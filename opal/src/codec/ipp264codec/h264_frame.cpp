#include "stdafx.h"
#include "h264.h"

#include <codec/opalplugin.hpp>

extern int h264TraceLevel;

H264Frame::H264Frame()
    : _timestamp (0)
    , _nMaxPayloadSize(H264_PAYLOAD_SIZE)
    , _pNALs(NULL)
    , _numberOfNALsReserved(0)
    , _pEncodedFramePtr(NULL)
    , _uEncodedFrameLen(0)
    , _uEncodedFrameSize(0)
{
    BeginNewFrame();
}

void H264Frame::BeginNewFrame ()
{
  _uEncodedFrameLen = 0;
  _bIsSync = false;

  _numberOfNALsInFrame = 0;
  _nCurrentNAL = 0; 
  _nCurrentNALFURemainingLen = 0;
  _nCurrentNALFURemainingDataPtr = NULL;
  _nCurrentNALFUHeader0 = 0;
  _nCurrentNALFUHeader1 = 0;

  _nCurrentFU = 0;
}

H264Frame::~H264Frame ()
{
    delete [] _pNALs;
}

void H264Frame::SetNewFrame(void* pEncodedFramePtr, uint uEncodedFrameLen)
{
    BeginNewFrame();

    uchar* pCur = _pEncodedFramePtr = (uchar*) pEncodedFramePtr;
    _uEncodedFrameLen = uEncodedFrameLen;

    uchar* pEnd = _pEncodedFramePtr + uEncodedFrameLen - 3;

    uint i=0;
  
    while (pCur < pEnd)
    {
        if ((pCur[0] == 0) && (pCur[1] == 0) && ((pCur[2] == 1) || ((pCur[2] == 0) && pCur[3] == 1)))
        {
            if (i > 0) 
                _pNALs[i-1].length = pCur - _pNALs[i-1].pFramePtr;

            if (pCur[2] == 1)
                pCur += 3;
            else
                pCur += 4;

            CheckAndReallocNAT(i+1);

            _pNALs[i].pFramePtr = pCur; // - _pEncodedFramePtr;
            _pNALs[i].type = pCur[0] & 0x1f;
            
            if (!_bIsSync && (
                (_pNALs[i].type == H264_NAL_TYPE_IDR_SLICE) ||
                (_pNALs[i].type == H264_NAL_TYPE_SEQ_PARAM) ||
                (_pNALs[i].type == H264_NAL_TYPE_PIC_PARAM)))
            {
                _bIsSync = true;
            }

            _numberOfNALsInFrame = ++i;
            pCur ++;
        }
        else 
            pCur ++;
    }


    if (i > 0) 
        _pNALs[i-1].length = pCur - _pNALs[i-1].pFramePtr + 3;

#if PTRACING
    for (i=0; i<_numberOfNALsInFrame; i++) {
        PTRACE(h264TraceLevel, D264_LOG, "_pNALs[" << i 
            << "] = {0x" << hex << ((unsigned)(_pNALs[i].pFramePtr)) 
            << " x_offset=" << dec << _pNALs[i].x_offset
            << " length=" << _pNALs[i].length
            << " type=" << int(_pNALs[i].type));
    }
#endif
}

bool H264Frame::GetRTPFrame(RTPFrame& frame, uint& flags)
{
    flags = 0;
    flags |= _bIsSync ? kIsIFrame : 0;

    if (_nCurrentNAL < _numberOfNALsInFrame) 
    { 
        uint curNALLen = _pNALs[_nCurrentNAL].length;
        uchar *curNALPtr = _pNALs[_nCurrentNAL].pFramePtr;
        /*
         * We have 3 types of packets we can send:
         * fragmentation units - if the NAL is > max_payload_size
         * single nal units - if the NAL is < max_payload_size, and can only fit 1 NAL
         * single time aggregation units - if we can put multiple NALs into one packet
         *
         * We don't send multiple time aggregation units
         */

        if (curNALLen > _nMaxPayloadSize)
        {
            // fragmentation unit - break up into max_payload_size size chunks
            return EncapsulateFU(frame, flags);
        } 
        else 
        {
            // it is the last NAL of that frame or doesnt fit into an STAP packet with next nal ?
#ifdef SEND_STAP_PACKETS
            if (((_nCurrentNAL + 1) >= _numberOfNALsInFrame)  ||  
	            ( (curNALLen + _pNALs[_nCurrentNAL + 1].length + 5) > _nMaxPayloadSize)) 
            { 
#endif
                // single nal unit packet
                
                frame.SetTimestamp(_timestamp);
                frame.SetPayloadSize(curNALLen);
                memcpy(frame.GetPayloadPtr(), curNALPtr, curNALLen);
                _nCurrentNAL++;
                if (_nCurrentNAL >= _numberOfNALsInFrame) {
                    frame.SetMarker(1);
                    flags |= kIsLastFrame;
                }
                PTRACE(h264TraceLevel, D264_LOG, "Encap\tEncapsulating NAL unit #" << _nCurrentNAL << "/" << (_numberOfNALsReserved-1) << " of " << curNALLen << " bytes as a regular NAL unit");
                return true;
#ifdef SEND_STAP_PACKETS
            } 
            else
                return EncapsulateSTAP(frame, flags); 
#endif
        }
    } 
    else 
    {
        return false;
    }
}

#ifdef SEND_STAP_PACKETS
bool H264Frame::EncapsulateSTAP(RTPFrame& frame, uint& flags)
{
    uint STAPLen = 1;
    uint highestNALNumberInSTAP = _nCurrentNAL;
  
    // first check how many nals we want to put into the packet
    do {
        uint newSize = STAPLen + 2 +  _pNALs[highestNALNumberInSTAP].length;
        if (newSize > _nMaxPayloadSize)
            break;
        STAPLen = newSize;
        highestNALNumberInSTAP++;
    } while (highestNALNumberInSTAP < _numberOfNALsInFrame);

    PTRACE(h264TraceLevel, D264_LOG, "Encap\tEncapsulating NAL units " << _nCurrentNAL << "-"<< (highestNALNumberInSTAP-1) << "/" << (_numberOfNALsReserved-1) << " as a STAP of " << STAPLen);

    frame.SetPayloadSize(STAPLen); // for stap header
    uchar* pPayload = frame.GetPayloadPtr();
    uchar* pOut = pPayload + 1;

    uchar  maxNRI = 0;
    while (_nCurrentNAL < highestNALNumberInSTAP) {
        uint curNALLen = _pNALs[_nCurrentNAL].length;
        // store the nal length information
        pOut[0] = curNALLen >> 8;
        pOut[1] = curNALLen & 0x0ff;

        memcpy(pOut+2, _pNALs[_nCurrentNAL].pFramePtr, curNALLen);
        pOut += 2 + curNALLen;

        if ((pOut[2] & 0x60) > maxNRI) 
            maxNRI = pOut[2] & 0x60;

        PTRACE(h264TraceLevel, D264_LOG, "Encap\tAdding NAL unit " << _nCurrentNAL << "/" << (_numberOfNALsReserved-1) << " of " << curNALLen << " bytes to STAP");
        _nCurrentNAL++;
    }
        
    // set the nri value in the stap header
    *pPayload = maxNRI | 0x18;

    frame.SetTimestamp(_timestamp);
    if (_nCurrentNAL >= _numberOfNALsInFrame) {
        frame.SetMarker(1);
        flags |= kIsLastFrame;  // marker bit on last frame of video
    } else
        frame.SetMarker(0);

    return true;
}
#endif

bool H264Frame::EncapsulateFU(RTPFrame& frame, uint& flags) 
{
    uchar header[2];

    if (_nCurrentNALFURemainingLen==0)
    {
        _nCurrentNALFURemainingLen = _pNALs[_nCurrentNAL].length;
        _nCurrentNALFURemainingDataPtr = _pNALs[_nCurrentNAL].pFramePtr;
        _nCurrentNALFUHeader0 = (*_nCurrentNALFURemainingDataPtr & 0x60) | 0x1C;
        _nCurrentNALFUHeader1 = *_nCurrentNALFURemainingDataPtr & 0x1F;
        header[0] = _nCurrentNALFUHeader0;
        header[1] = 0x80 | _nCurrentNALFUHeader1; // s indication
        _nCurrentNALFURemainingDataPtr++; // remove the first byte
        _nCurrentNALFURemainingLen--;
    }
    else
    {
        header[0] = _nCurrentNALFUHeader0;
        header[1] = _nCurrentNALFUHeader1;
    }

    uint nCopy;

    if ((_nCurrentNALFURemainingLen + 2) <= _nMaxPayloadSize)
    {
        header[1] |= 0x40;
        nCopy = _nCurrentNALFURemainingLen;
    }
    else
        nCopy = _nMaxPayloadSize - 2;

    frame.SetTimestamp(_timestamp);
    frame.SetPayloadSize(nCopy + 2);
    uchar* pOut = frame.GetPayloadPtr();
    pOut[0] = header[0]; 
    pOut[1] = header[1]; 
    memcpy (pOut + 2, _nCurrentNALFURemainingDataPtr, nCopy);
    _nCurrentNALFURemainingDataPtr += nCopy;
    _nCurrentNALFURemainingLen -= nCopy;

    if (_nCurrentNALFURemainingLen == 0) {
        _nCurrentNAL++;
        if (_nCurrentNAL >= _numberOfNALsInFrame) {
            frame.SetMarker(1);
            flags |= kIsLastFrame; // marker bit on last frame of video
        }
    }
    else 
        frame.SetMarker(0);

    PTRACE(h264TraceLevel, D264_LOG, "Encap\tEncapsulating "<< nCopy << " bytes of NAL " << _nCurrentNAL<< "/" << (_numberOfNALsReserved-1) << " as a FU (" << _nCurrentNALFURemainingLen << " bytes remaining)");
    return true;
}

bool H264Frame::SetFromRTPFrame(RTPFrame& frame, uint& flags) 
{
    uchar curNALType = *(frame.GetPayloadPtr()) & 0x1f;

    if (curNALType >= H264_NAL_TYPE_NON_IDR_SLICE &&
        curNALType <= H264_NAL_TYPE_FILLER_DATA)
    {
        // regular NAL - put in buffer, adding the header.
        PTRACE(h264TraceLevel, D264_LOG, "Deencap\tDeencapsulating a regular NAL unit NAL of " << frame.GetPayloadSize() - 1 << " bytes (type " << (int) curNALType << ")");
        AddDataToEncodedFrame(frame.GetPayloadPtr() + 1, frame.GetPayloadSize() - 1, *(frame.GetPayloadPtr()), 1);
    } 
    else if (curNALType == 0x18) 
        return DeencapsulateSTAP (frame, flags);            // stap-A (single time aggregation packet )
    else if (curNALType == 0x1C) 
        return DeencapsulateFU (frame, flags);              // Fragmentation Units
    else
    {
        PTRACE(h264TraceLevel, D264_LOG, "Deencap\tSkipping unsupported NAL unit type " << curNALType);
        return false;
    }
    return true;
}

bool H264Frame::IsSync () 
{
    uint i;
    for (i=0; i<_numberOfNALsInFrame; i++)
    {
        if ((_pNALs[i].type == H264_NAL_TYPE_IDR_SLICE) ||
            (_pNALs[i].type == H264_NAL_TYPE_SEQ_PARAM) ||
            (_pNALs[i].type == H264_NAL_TYPE_PIC_PARAM))
        {
            return true;
        }
    }
    return false;
}

bool H264Frame::DeencapsulateSTAP (RTPFrame& frame, unsigned int & /*flags*/) 
{
    uchar* pIn = frame.GetPayloadPtr() + 1;
    uint curSTAPLen = frame.GetPayloadSize() - 1; 

    PTRACE(h264TraceLevel, D264_LOG, "Deencap\tDeencapsulating a STAP of " << curSTAPLen << " bytes");

    while (curSTAPLen > 0)
    {
        // first, theres a 2 byte length field
        uint len = (uint(pIn[0]) << 8) | pIn[1];
        curSTAPLen -= 2;
        pIn += 2;
        if (len < 1 || len > curSTAPLen) {
            PTRACE(1, D264_LOG, "Deencap\tError deencapsulating STAP, STAP header says its " << len + 2 << " bytes long but there are only " << curSTAPLen << " bytes left of the packet");
            return false;
        }
        // then the header, followed by the body.  We'll add the header
        // in the AddDataToEncodedFrame - that's why the nal body is dptr + 1
        PTRACE(h264TraceLevel, D264_LOG, "Deencap\tDeencapsulating an NAL unit of " << len << " bytes (type " << (int)(pIn[0] & 0x1f) << ") from STAP");
        if (!AddDataToEncodedFrame(pIn + 1,  len - 1, pIn[0], 1))
            return false;
        pIn += len;
        curSTAPLen -= len ;
    }
    return true;
}

bool H264Frame::DeencapsulateFU (RTPFrame& frame, unsigned int & /*flags*/) 
{
    uchar* pIn = frame.GetPayloadPtr();
    uint nDataSize = frame.GetPayloadSize(); 
    if (nDataSize < 3)
        return false;
    nDataSize -= 2;

    if (pIn[1] & 0x80)  // bStartBit
    {
        if (pIn[1] & 0x40)
        {
            PTRACE(6, D264_LOG, "Deencap\tDeencapsulating a FU of " << frame.GetPayloadSize() - 1 << " bytes (_Startbit_, _Endbit_)");
            PTRACE(1, D264_LOG, "Deencap\tReceived a FU with both Starbit and Endbit set - This MUST NOT happen!");
            _nCurrentFU=0;
            return false;
        }
        _nCurrentFU = 1;
       return AddDataToEncodedFrame(pIn + 2, nDataSize, (pIn[0] & 0xE0) | (pIn[1] & 0x1f),  1);
    } 
    else 
    {
        if (_nCurrentFU == 0) {
            PTRACE(1, D264_LOG, "Deencap\tReceived an intermediate FU without getting the first - dropping!");
            return false;
        }
        if (pIn[1] & 0x40)
            _nCurrentFU = 0;
        else
            _nCurrentFU ++;

         return AddDataToEncodedFrame(pIn + 2, nDataSize,  0, 0);
    }
    return true;
}

bool H264Frame::AddDataToEncodedFrame (uchar *data, uint dataLen, uchar header, bool addHeader) 
{
    uchar headerLen = addHeader ? 5 : 0;
    uchar* currentPositionInFrame = _pEncodedFramePtr + _uEncodedFrameLen;
/*
    if (addHeader) 
    {
        PTRACE(h264TraceLevel, D264_LOG, "Deencap\tAdding a NAL unit of " << dataLen << " bytes to buffer (type " << (int)(header & 0x1f) << ")"); 
        uchar* NALptr = data;
        if ( ((header & 0x1f) == H264_NAL_TYPE_SEQ_PARAM) && (dataLen >= 3)) 
        {
            PTRACE(h264TraceLevel, D264_LOG, "Deencap\tProfile: " << (int)NALptr[0] << 
                " Level: "   << (int)NALptr[2] << 
			    " Constraints: " << (NALptr[1] & 0x80 ? 1 : 0) 
			                     << (NALptr[1] & 0x40 ? 1 : 0) 
					             << (NALptr[1] & 0x20 ? 1 : 0) 
					             << (NALptr[1] & 0x10 ? 1 : 0));
        }
    }
    else 
*/
    { 
        PTRACE(6, D264_LOG, "Deencap\tAdding a NAL unit of " << dataLen << " bytes to buffer");
    }


    if (_uEncodedFrameLen + dataLen + headerLen > _uEncodedFrameSize) 
    {
        PTRACE(1, D264_LOG, "Deencap\tFrame too big (" << _uEncodedFrameLen + dataLen + headerLen << ">" << MAX_FRAME_SIZE << ")");
        return false;
    }

    // add 00 00 01 [headerbyte] header
    if (addHeader)
    {
        *currentPositionInFrame++ = 0;
        *currentPositionInFrame++ = 0;
        *currentPositionInFrame++ = 0;
        *currentPositionInFrame++ = 1;
        *currentPositionInFrame++ = header;
    }

    memcpy(currentPositionInFrame, data, dataLen);
    _uEncodedFrameLen += dataLen + headerLen;
    return true;
}

bool H264Frame::IsStartCode (const uchar *positionInFrame)
{
  if (positionInFrame[0] == 0 &&
      positionInFrame[1] == 0 &&
    ((positionInFrame[2] == 1) ||
    ((positionInFrame[2] == 0) && positionInFrame[3] == 1))) 
  {
    return true;
  }
  return false;
}
