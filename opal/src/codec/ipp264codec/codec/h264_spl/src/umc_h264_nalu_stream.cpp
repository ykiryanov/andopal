/*
//
//                  INTEL CORPORATION PROPRIETARY INFORMATION
//     This software is supplied under the terms of a license agreement or
//     nondisclosure agreement with Intel Corporation and may not be copied
//     or disclosed except in accordance with the terms of that agreement.
//          Copyright(c) 2003-2010 Intel Corporation. All Rights Reserved.
//
*/
#include "umc_defs.h"
#if defined (UMC_ENABLE_H264_SPLITTER)

#include "umc_h264_nalu_stream.h"

namespace UMC
{

    H264_NALU_Stream::H264_NALU_Stream()
    {
        Init( 0 );
    }

    H264_NALU_Stream::~H264_NALU_Stream(void){}

    Status H264_NALU_Stream::Init( Ipp32s p_iSize )
    {
        m_iZeroCount = 0;
        m_vecNALU.clear();
        m_vecNALU.reserve(p_iSize);
        return UMC_OK;
    }

    Status H264_NALU_Stream::Close()
    {
        m_vecNALU.clear();
        return UMC_OK;
    }

    Status H264_NALU_Stream::PutData(MediaData & p_dataNal)
    {
        Ipp32s iStart;

        for(iStart = 0; iStart < m_iZeroCount; iStart++)
            m_vecNALU.insert(m_vecNALU.end(), (Ipp8u)0);

        iStart = -1;

        for(Ipp32s iCur =0 ; iCur<(Ipp32s)p_dataNal.GetDataSize() ; iCur++) {
            Ipp8u bCur = *((Ipp8u*)p_dataNal.GetDataPointer() + iCur);
            switch(bCur)
            {
            case 0x00:
                //////////////////////////////////////////////////////////////////////////
                {
                    if(m_iZeroCount == 0){
                        iStart = iCur;
                    }
                    m_iZeroCount++;
                }
                //////////////////////////////////////////////////////////////////////////
                break;
            case 0x01:
                //////////////////////////////////////////////////////////////////////////
                {
                    if(m_iZeroCount >= 2 ){
                        // Detected stop bit
                        CopyRest( p_dataNal, iStart );
                        p_dataNal.MoveDataPointer(iCur + 1);
                        m_iZeroCount = 0;
                        if( 0 != m_vecNALU.size()){
                            return UMC_OK;
                        }
                        iCur = -1;
                    }
                    iStart = -1;
                    m_iZeroCount = 0;
                }
                //////////////////////////////////////////////////////////////////////////
                break;
            default:
                //////////////////////////////////////////////////////////////////////////
                {
                    m_iZeroCount = 0;
                    iStart = -1;
                }
                //////////////////////////////////////////////////////////////////////////
                break;
            }
        }

        CopyRest(p_dataNal, iStart);
        p_dataNal.MoveDataPointer((Ipp32s)p_dataNal.GetDataSize());
        return UMC_ERR_NOT_ENOUGH_DATA;
    }

    Status H264_NALU_Stream::CopyRest(MediaData & p_dataNal, Ipp32s p_iStart)
    {
        if(m_iZeroCount == 0){
            if( 0 < p_dataNal.GetDataSize()){
                m_vecNALU.insert(m_vecNALU.end(), ((Ipp8u*)p_dataNal.GetDataPointer()),
                                 ((Ipp8u*)p_dataNal.GetDataPointer()) + p_dataNal.GetDataSize());
            }
        } else {
            if(0 < p_iStart){
                m_vecNALU.insert(m_vecNALU.end(), ((Ipp8u*)p_dataNal.GetDataPointer()),
                                 ((Ipp8u*)p_dataNal.GetDataPointer()) + p_iStart);
            }
        }
        return UMC_OK;
    }

    Status H264_NALU_Stream::LockOutputData(MediaData & o_dataNALU)
    {
        if( 0 == m_vecNALU.size() ){
            return UMC_ERR_NOT_ENOUGH_DATA;
        }

        o_dataNALU.SetBufferPointer(&(m_vecNALU[0]), m_vecNALU.size());
        o_dataNALU.SetDataSize(m_vecNALU.size());
        return UMC_OK;
    }

    Status H264_NALU_Stream::UnLockOutputData()
    {
        m_vecNALU.clear();
        return UMC_OK;
    }
} // namespace UMC

#endif // UMC_ENABLE_H264_SPLITTER
