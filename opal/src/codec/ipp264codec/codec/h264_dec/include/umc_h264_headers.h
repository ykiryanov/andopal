/*
//
//              INTEL CORPORATION PROPRIETARY INFORMATION
//  This software is supplied under the terms of a license  agreement or
//  nondisclosure agreement with Intel Corporation and may not be copied
//  or disclosed except in  accordance  with the terms of that agreement.
//        Copyright (c) 2003-2010 Intel Corporation. All Rights Reserved.
//
//
*/
#include "umc_defs.h"
#if defined (UMC_ENABLE_H264_VIDEO_DECODER)

#ifndef __UMC_H264_HEADERS_H
#define __UMC_H264_HEADERS_H

#include "umc_h264_dec_defs_dec.h"
#include "umc_media_data_ex.h"
#include "umc_h264_heap.h"
#include "umc_h264_slice_decoding.h"
#include "umc_h264_frame_info.h"


namespace UMC
{
/****************************************************************************************************/
// Headers stuff
/****************************************************************************************************/
class Headers
{
public:

    Headers()
    {
    }

    H264Array<H264SeqParamSet*>             m_SeqParamSet;     // Sequence parameter sets read from the bitstream.
    H264Array<H264SeqParamSetExtension*>    m_SeqParamSetEx;   // Sequence parameter extension sets read from the bitstream.
    H264Array<H264PicParamSet*>             m_PicParamSet;     // Picture parameter sets read from the bitstream.

    H264Array<H264SEIPayLoad*>              m_SEISet;     // Picture parameter sets read from the bitstream.

    H264_List<H264SeqParamSet>             m_AdditionalSeqParamSetList;
    H264_List<H264SeqParamSetExtension>    m_AdditionalSeqParamSetExList;
    H264_List<H264PicParamSet>             m_AdditionalPicParamSetList;
    H264_List<H264SEIPayLoad>              m_AdditionalSEISetList;

    void Reset(bool isPartialReset = false)
    {
        if (!isPartialReset)
        {
        Ipp32u i;
        for (i = 0; i < m_SeqParamSet.GetItemCount(); i++)
        {
            delete m_SeqParamSet[i];
        }

        for (i = 0; i < m_SeqParamSetEx.GetItemCount(); i++)
        {
            delete m_SeqParamSetEx[i];
        }

        for (i = 0; i < m_PicParamSet.GetItemCount(); i++)
        {
            delete m_PicParamSet[i];
        }

        for (i = 0; i < m_SEISet.GetItemCount(); i++)
        {
            delete m_SEISet[i];
        }

        m_SeqParamSet.Reset();
        m_SeqParamSetEx.Reset();
        m_PicParamSet.Reset();
        m_SEISet.Reset();
        }

        m_AdditionalSeqParamSetList.Reset();
        m_AdditionalSeqParamSetExList.Reset();
        m_AdditionalPicParamSetList.Reset();
        m_AdditionalSEISetList.Reset();
    }

    bool AddSeqParamSet(H264SeqParamSet* sps, bool force)
    {
        if (force)
        {
            delete m_SeqParamSet[sps->seq_parameter_set_id];
            m_SeqParamSet[sps->seq_parameter_set_id] = 0;
        }

        if (!m_SeqParamSet[sps->seq_parameter_set_id])
        {
            m_SeqParamSet[sps->seq_parameter_set_id] = new H264SeqParamSet();
            *m_SeqParamSet[sps->seq_parameter_set_id] = *sps;
            return false;
        }

        H264SeqParamSet * tmp = m_AdditionalSeqParamSetList.FindLastByPid(sps->seq_parameter_set_id);
        if (!tmp)
        {
            tmp = m_SeqParamSet[sps->seq_parameter_set_id];
        }

        if (*tmp == *sps)
        {
            return false;
        }
        else
        {
            // add to
            H264SeqParamSet* newItem = new H264SeqParamSet();
            *newItem = *sps;
            m_AdditionalSeqParamSetList.AddItem(newItem, sps->seq_parameter_set_id);
        }
        return true;
    }

    bool AddSeqParamSetEx(H264SeqParamSetExtension* sps, bool force)
    {
        if (force)
        {
            delete m_SeqParamSetEx[sps->seq_parameter_set_id];
            m_SeqParamSetEx[sps->seq_parameter_set_id] = 0;
        }

        if (!m_SeqParamSetEx[sps->seq_parameter_set_id])
        {
            m_SeqParamSetEx[sps->seq_parameter_set_id] = new H264SeqParamSetExtension();
            *m_SeqParamSetEx[sps->seq_parameter_set_id] = *sps;
            return false;
        }

        H264SeqParamSetExtension * tmp = m_AdditionalSeqParamSetExList.FindLastByPid(sps->seq_parameter_set_id);
        if (!tmp)
        {
            tmp = m_SeqParamSetEx[sps->seq_parameter_set_id];
        }

        if (*tmp == *sps)
        {
            return false;
        }
        else
        {
            // add to
            H264SeqParamSetExtension* newItem = new H264SeqParamSetExtension();
            *newItem = *sps;
            m_AdditionalSeqParamSetExList.AddItem(newItem, sps->seq_parameter_set_id);
        }
        return true;
    }

    bool AddPicParamSet(H264PicParamSet* pps, bool force)
    {
        if (force)
        {
            delete m_PicParamSet[pps->pic_parameter_set_id];
            m_PicParamSet[pps->pic_parameter_set_id] = 0;
        }

        if (!m_PicParamSet[pps->pic_parameter_set_id])
        {
            m_PicParamSet[pps->pic_parameter_set_id] = new H264PicParamSet();
            *m_PicParamSet[pps->pic_parameter_set_id] = *pps;
            return false;
        }

        H264PicParamSet * tmp = m_AdditionalPicParamSetList.FindLastByPid(pps->pic_parameter_set_id);
        if (!tmp)
        {
            tmp = m_PicParamSet[pps->pic_parameter_set_id];
        }

        if (*tmp == *pps)
        {
            return false;
        }
        else
        {
            // add to
            H264PicParamSet* newItem = new H264PicParamSet();
            *newItem = *pps;
            m_AdditionalPicParamSetList.AddItem(newItem, pps->pic_parameter_set_id);
        }

        return true;
    }

    bool AddSEISet(H264SEIPayLoad* sei, bool force)
    {
        if (force)
        {
            delete m_SEISet[sei->payLoadType];
            m_SEISet[sei->payLoadType] = 0;
        }

        if (!m_SEISet[sei->payLoadType])
        {
            m_SEISet[sei->payLoadType] = new H264SEIPayLoad();
            *m_SEISet[sei->payLoadType] = *sei;
            sei->user_data = 0;
            return false;
        }

        H264SEIPayLoad * tmp = m_AdditionalSEISetList.FindLastByPid(sei->payLoadType);
        if (!tmp)
        {
            tmp = m_SEISet[sei->payLoadType];
        }

        if (*tmp == *sei)
        {
            return false;
        }
        else
        {
            // add to
            H264SEIPayLoad* newItem = new H264SEIPayLoad();
            *newItem = *sei;
            sei->user_data = 0;
            m_AdditionalSEISetList.AddItem(newItem, sei->payLoadType);
        }

        return true;
    }

    void Signal(Ipp32s type, void * hdr)
    {
        switch(type)
        {
        case 0:
            {
                H264SeqParamSet * tmp = (H264SeqParamSet *)hdr;
                if (!tmp)
                {
                    VM_ASSERT(false);
                    return;
                }

                Ipp32s pid = tmp->seq_parameter_set_id;
                if (tmp == m_SeqParamSet[pid])
                {
                    delete tmp;
                    m_SeqParamSet[pid] = m_AdditionalSeqParamSetList.DetachItemByPid(pid);
                    return;
                }

                m_AdditionalSeqParamSetList.RemoveItem(tmp);
                delete tmp;
            }
            break;
        case 1:
            {
                H264SeqParamSetExtension * tmp = (H264SeqParamSetExtension *)hdr;
                if (!tmp)
                {
                    VM_ASSERT(false);
                    return;
                }

                Ipp32s pid = tmp->seq_parameter_set_id;
                if (tmp == m_SeqParamSetEx[pid])
                {
                    delete tmp;
                    m_SeqParamSetEx[pid] = m_AdditionalSeqParamSetExList.DetachItemByPid(pid);
                    return;
                }

                m_AdditionalSeqParamSetExList.RemoveItem(tmp);
                delete tmp;
            }
            break;
        case 2:
            {
                H264PicParamSet * tmp = (H264PicParamSet *)hdr;
                if (!tmp)
                {
                    VM_ASSERT(false);
                    return;
                }

                Ipp32s pid = tmp->pic_parameter_set_id;
                if (tmp == m_PicParamSet[pid])
                {
                    delete tmp;
                    m_PicParamSet[pid] = m_AdditionalPicParamSetList.DetachItemByPid(pid);
                    return;
                }

                m_AdditionalPicParamSetList.RemoveItem(tmp);
                delete tmp;
            }
            break;
        case 3:
            {
                H264SEIPayLoad * tmp = (H264SEIPayLoad *)hdr;
                if (!tmp)
                {
                    VM_ASSERT(false);
                    return;
                }

                Ipp32s pid = tmp->payLoadType;
                if (tmp == m_SEISet[pid])
                {
                    delete tmp;
                    m_SEISet[pid] = m_AdditionalSEISetList.DetachItemByPid(pid);
                    return;
                }

                m_AdditionalSEISetList.RemoveItem(tmp);
                delete tmp;
            }
            break;
        default:
            VM_ASSERT(false);
            break;
        };
    }

    H264SeqParamSet* GetSeqParamSet(Ipp32s sps_pid)
    {
        H264SeqParamSet * tmp = m_AdditionalSeqParamSetList.FindLastByPid(sps_pid);
        if (tmp)
        {
            return tmp;
        }

        return m_SeqParamSet[sps_pid];
    }

    H264SeqParamSetExtension* GetSeqParamSetEx(Ipp32s sps_pid)
    {
        H264SeqParamSetExtension * tmp = m_AdditionalSeqParamSetExList.FindLastByPid(sps_pid);
        if (tmp)
        {
            return tmp;
        }

        return m_SeqParamSetEx[sps_pid];
    }

    H264PicParamSet* GetPicParamSet(Ipp32s sps_pid)
    {
        H264PicParamSet * tmp = m_AdditionalPicParamSetList.FindLastByPid(sps_pid);
        if (tmp)
        {
            return tmp;
        }

        return m_PicParamSet[sps_pid];
    }

    H264SEIPayLoad * GetSEISet(Ipp32s type)
    {
        H264SEIPayLoad * tmp = m_AdditionalSEISetList.FindLastByPid(type);
        if (tmp)
        {
            return tmp;
        }

        return m_SEISet[type];
    }
};

} // namespace UMC

#endif // __UMC_H264_HEADERS_H
#endif // UMC_ENABLE_H264_VIDEO_DECODER
