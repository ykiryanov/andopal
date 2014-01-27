//
//  UdpListener.cpp
//  Player
//
//  Created by Sergey Bezruchkin on 9/21/13.
//  Copyright (c) 2013 Sergey Bezruchkin. All rights reserved.
//

#include <ptlib.h>
#include "BoneCodecTest.h"
#include "UdpListener.h"

enum
{
    INVALID_SOCKET              =-1,
    SOCKET_ERROR                =-1
};

#define CHK(a)  if ((iRet=(a)) < 0) {return iRet;} else

inline int GetSocketError() { return errno; }

UdpListener::UdpListener()
    : PThread(5000, NoAutoDeleteThread, NormalPriority, "UDP Listener")
    ,_socketUdp(INVALID_SOCKET)
    , _bStarted(false)
    , _onReceive(NULL)
{
}


int UdpListener::start(u32 nIp, u16 nPort)
{
    int iRet;
    CHK( openSocket(nIp, nPort));
    _bStarted = true;
    PThread::Resume();
    return iRet;
}

int UdpListener::openSocket(u32 nIp, u16 nPort)
{
	if (_socketUdp != INVALID_SOCKET)
		closeSocket();
    
	// Create the socket itself.
	_socketUdp = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);
	if (_socketUdp == INVALID_SOCKET)
	{
        return -1;
	}
    
	// Allow using port address by other code.
	int iOptVal1 = 1;
	if (setsockopt(_socketUdp, SOL_SOCKET, SO_REUSEADDR, (char*)&iOptVal1, sizeof(iOptVal1)) != 0)
	{
		closeSocket();
        return -2;
	}
	
    NetIpAddress a(nIp);
    if(!a.IsMulticastAddr())
    {
        setsockopt (_socketUdp, SOL_SOCKET, SO_USELOOPBACK, (char*)&iOptVal1, sizeof(iOptVal1));
        
        int nRetries = 5;
        int error = 0;
        while(nRetries-- && (nIp != INADDR_ANY || nPort != 0))
        {
            // Assign local address to the socket.
            sockaddr_in addr;
            memset(&addr, 0, sizeof(addr));
            addr.sin_family = AF_INET;
            addr.sin_addr.s_addr = htonl(nIp);
            addr.sin_port = htons(nPort);
            error = bind(_socketUdp, (sockaddr*)&addr, sizeof(addr));
            if(error == 0)
                break;
        }
        
        if(error != 0)
        {
            closeSocket();
            return -3;
        }
        
        if(a.IsBroadcadstAddr())
        {
            // Enable sending and receiving braodcast messages.
            int iOptVal3 = 1;
            if (setsockopt(_socketUdp, SOL_SOCKET, SO_BROADCAST, (char*)&iOptVal3, sizeof(iOptVal3)) != 0)
            {
                closeSocket();
                return INVALID_SOCKET; //GetSocketError();
            }
        }
    }
    else
    {
        PIPSocket::Address pa(((nIp >> 24) & 0xFF), ((nIp >> 16) & 0xFF), ((nIp >> 8) & 0xFF), (nIp & 0xFF));
        
        BYTE loop = 1;
        if (setsockopt(_socketUdp, IPPROTO_IP, IP_MULTICAST_LOOP, &loop, sizeof(loop)) < 0)
        {
            closeSocket();
            return INVALID_SOCKET; //GetSocketError();
        }
        
        BYTE ttl = 64;
        if (setsockopt(_socketUdp, IPPROTO_IP, IP_MULTICAST_TTL, &ttl, sizeof(ttl)) < 0)
        {
            closeSocket();
            return INVALID_SOCKET; //GetSocketError();
        }
        
        struct ip_mreq mreq;
        mreq.imr_multiaddr.s_addr = inet_addr(pa.AsString());
        mreq.imr_interface.s_addr = INADDR_ANY;
        
        if (setsockopt(_socketUdp, IPPROTO_IP, IP_ADD_MEMBERSHIP, &mreq, sizeof(mreq)) < 0)
        {
            closeSocket();
            return INVALID_SOCKET; //GetSocketError();
        }

        sockaddr_in addr;
        memset(&addr, 0, sizeof(addr));
        addr.sin_family = AF_INET;
        addr.sin_addr.s_addr = htonl(nIp);
        addr.sin_port = htons(nPort);
        int error = bind(_socketUdp, (sockaddr*)&addr, sizeof(addr));
        if(error != 0)
        {
            closeSocket();
            return INVALID_SOCKET; //GetSocketError();
        }
    }
    
    // Enable sending and receiving large messages.
	int iRcvBufSize = 65535;
	if (setsockopt(_socketUdp, SOL_SOCKET, SO_RCVBUF, (char*)&iRcvBufSize, sizeof(iRcvBufSize)) != 0)
	{
		closeSocket();
        return INVALID_SOCKET; //GetSocketError();
	}

	// Success.
	return 0;
}


void UdpListener::closeSocket()
{
	if (_socketUdp == INVALID_SOCKET)
		return;
	
	try { ::shutdown(_socketUdp, SHUT_RDWR); } catch(...) { }
    //	try { closesocket(_socketUdp); } catch(...) { }

    int stat;
    do {
        stat = ::close(_socketUdp);
    } while (stat == -1 && errno == EINTR);
    
	_socketUdp = INVALID_SOCKET;
}


int UdpListener::readFrom(NetIpAddress& addrFrom, void *pBuff, uint *pBuffLen, unsigned nTimeOutMSec)
{
	if (_socketUdp == INVALID_SOCKET)
	{
		return -10;
	}
	
	// Receive data. This is receiving with timetout that is set as a sockopt.
    fd_set  fdRead;
    
    FD_ZERO(&fdRead);
    FD_SET(_socketUdp, &fdRead);
    
    timeval timeOutVal;
    
    timeOutVal.tv_usec = (nTimeOutMSec % 1000) * 1000;
    timeOutVal.tv_sec  = nTimeOutMSec/1000;
    
    int iSel = select(_socketUdp+1, &fdRead, NULL, NULL, &timeOutVal);
    if (iSel == 0) {
        return -20; //HipResult(3014, rpcerr_timeout);
    }
    
	sockaddr_in addr;
	memset(&addr, 0, sizeof(addr));
	socklen_t addrFromLen = sizeof(addr);
	int iRet = recvfrom(_socketUdp, pBuff, *pBuffLen, 0, (sockaddr*)&addr, &addrFromLen);
    
	// Check results of the receiving.
	if (iRet == SOCKET_ERROR)
	{
		// System error was returned.
		int netError = GetSocketError();
        switch (netError) {
            case ETIMEDOUT:  // Timeout happened.
                return -3014; //HipResult(3014, rpcerr_timeout);
            default: // Unknown system error.
                return -4038; //HipResult(4038, facility_Win32, 12345); //wsaError);
		}
	}
	else
	{
		if (addrFromLen >= sizeof(addr))
		{
			// Give out the properties of received data.
			addrFrom.nIp  = addr.sin_addr.s_addr;
			addrFrom.nPort = ntohs(addr.sin_port);
			*pBuffLen = iRet;
		}
	}
    
	return 0;
}

#define kRTP 1

#if kRTP
void UdpListener::Main()
{
	NetIpAddress addrFrom;
    RTP_DataFrame frame;
    int nSkip = 0;
    WORD nextSequenceNumber = 0;
    
	while (_bStarted)
	{
        uint nDataSize = 2048;
		int result = readFrom(addrFrom, frame.GetPointer(2048), &nDataSize, 100);
        if (result != 0)
            continue;
        
        WORD seq = frame.GetSequenceNumber();
        if (seq != nextSequenceNumber) {
            if (--nSkip < 0) {
                nSkip = 5;
            } else if (seq < nextSequenceNumber)
                continue;
        }
        
        nextSequenceNumber = seq + 1;
        
        OnReceive onReceive = _onReceive;
        if (onReceive != NULL)
            onReceive(_opaque, frame.GetPayloadPtr(), nDataSize - frame.GetHeaderSize());
	}
}
#else  // !kRTP
void UdpListener::Main()
{

	NetIpAddress addrFrom;
    BYTE  data[1500];
    
	while (_bStarted)
	{
        uint nDataSize = sizeof(data);
		int result = readFrom(addrFrom, data, &nDataSize, 100);
        if (result == 0 && _bStarted) {
            OnReceive onReceive = _onReceive;
            if (onReceive != NULL)
                onReceive(_opaque, data, nDataSize);
        }
	}
}
#endif
