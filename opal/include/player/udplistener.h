//
//  UdpListener.h
//  Player
//
//  Created by Sergey Bezruchkin on 9/21/13.
//  Copyright (c) 2013 Sergey Bezruchkin. All rights reserved.
//

#ifndef __Player__UdpListener__
#define __Player__UdpListener__

#pragma once
#include <ptlib.h>
#include <ptlib/thread.h>
#include <ptlib/ipsock.h>
typedef unsigned char       uchar;
typedef unsigned char       u8;
typedef unsigned int        uint;
typedef unsigned long       ulong;
typedef unsigned long       u32;
typedef unsigned short      u16;
typedef unsigned short		ushort;
typedef unsigned long long    u64;

#pragma pack(push, 1)
struct NetIpAddress
{
    union {
        struct {
            u32     nIp;	// Ip addr is stored in the network byte order.
            u16     nPort;	// Port number is stored in the platform byte order.
            u16     nReserv;
        };
        u64         u64Ip;
    };
    
    
	NetIpAddress()  { nIp = 0; nPort = 0xFFFF; nReserv = 0; }
	NetIpAddress(u32 ip, u16 port) : nIp(ip), nPort(port) { }
	NetIpAddress(int ip1, int ip2, int ip3, int ip4, u16 port = 0) { nIp = (ip1 & 0xFF) | ((ip2 << 8) & 0xFF00) | ((ip3 << 16) & 0xFF0000) | ((ip4 << 24) & 0xFF000000);  nPort = port; }
	NetIpAddress(u64 u64Val) { u64Ip = u64Val; }
    
    
	void		Clear() { nIp = 0; nPort = 0; }
    
	bool		IsValid() const { return (nPort != 0xFFFF) && (nPort != 0); }
	bool		IsEmpty() const { return nIp == 0 && nPort == 0; }
	bool		IsBroadcadstAddr() const { return nIp == 0xFFFFFFFF; }
	bool		IsMulticastAddr() const { return (((u_int32_t)(nIp) & 0xf0000000) == 0xe0000000); }
	bool		IsEqualTo(const NetIpAddress& ipAddr) { return nIp == ipAddr.nIp && nPort == ipAddr.nPort; }
    
	void		SetBroadcastAddr(WORD port = 0) { nIp = 0xFFFFFFFF; if (port != 0) nPort = port; }
    
    u64 ToU64() const  { return u64Ip;}
    
#ifdef WIN32
#pragma warning(push)
#pragma warning(disable:4996) // using unsafe sprintf function
    inline char* ToString(char* buffer80) const { sprintf(buffer80, "{Ip=%d.%d.%d.%d:%hu}", (nIp & 0xFF), ((nIp >> 8) & 0xFF), ((nIp >> 16) & 0xFF), ((nIp >> 24) & 0xFF), nPort); return buffer80; }
#pragma warning(pop)
#endif
};
#pragma pack(pop)

class BoneCodecTest;

class UdpListener: public PThread
{
	SOCKET		            _socketUdp;
    bool                    _bStarted;
public:
    typedef void (*OnReceive) (void* opaque, u8* pData, uint nDataSize);
    OnReceive                _onReceive;
    void*                    _opaque;
    
    UdpListener();
    
    virtual void Main();
    
    int     start(u32 nIp, u16 nPort);
    virtual int     openSocket(u32 nIp, u16 nPort);
    virtual void    closeSocket();
    virtual int     readFrom(NetIpAddress& addrFrom, void *pBuff, uint* pBuffLen, unsigned nTimeOutMSec);

    void    stop() { _bStarted = false; closeSocket(); }
    bool    isStarted() { return _bStarted; }
private:
};

#endif /* defined(__Player__UdpListener__) */
