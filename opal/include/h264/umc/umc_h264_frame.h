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

#ifndef __UMC_H264_FRAME_H__
#define __UMC_H264_FRAME_H__

#include <stdlib.h>
#include "umc_h264_dec_defs_yuv.h"
#include "umc_h264_notify.h"

namespace UMC
{
class H264DecoderFrameInfo;
// The H264DecoderFrame class represents a YUV work space which was obtained
// by decoding a bitstream picture.

class H264DecoderFrame : public H264DecYUVWorkSpace
{
    DYNAMIC_CAST_DECL(H264DecoderFrame, H264DecYUVWorkSpace)

    H264DecoderFrameInfo * m_pSlicesInfo;
    H264DecoderFrameInfo * m_pSlicesInfoBottom;

    H264DecoderFrameInfo * GetAU(Ipp32s field = 0)
    {
        if (field)
            return m_pSlicesInfoBottom;
        else
            return m_pSlicesInfo;
    }

    void Reset();
    void FreeResources();

    H264DecoderFrame *m_pPreviousFrame;
    H264DecoderFrame *m_pFutureFrame;
        // These point to the previous and future reference frames
        // used to decode this frame.
        // These are also used to maintain a doubly-linked list of
        // reference frames in the H264DecoderFrameList class.  So, these
        // may be non-NULL even if the current frame is an I frame,
        // for example.  m_pPreviousFrame will always be valid when
        // decoding a P or B frame, and m_pFutureFrame will always
        // be valid when decoding a B frame.

    bool   m_isDisplayable;
        // When true indicates this decoded frame contains a decoded
        // frame ready for output. The frame should not be overwritten
        // until wasOutputted is also true.

    bool   m_wasOutputted;
        // m_wasOutputted indicates whether this decoded frame has
        // already been sent for output to the calling application.
        // The frame might not be immediately displayed depending
        // on whether the application buffers up decoded frames.

    Ipp32s m_BusyState;                  // (Ipp32s) frame is busy (2 - locked for decoding, 1 - could not dispose)
    bool m_isSkipped;

    NotifiersChain   m_NotifiersChain;

public:

    H264SEIPayLoad m_UserData;

    void SetBusyState(Ipp32s busyState){m_BusyState = busyState;};
    Ipp32s GetBusyState() const {return m_BusyState;}

    void OnDecodingCompleted();

    void IncrementBusyState() {m_BusyState++;}
    void DecrementBusyState();

    void SetSkipped(bool isSkipped)
    {
        m_isSkipped = isSkipped;
    }

    bool IsSkipped() const
    {
        return m_isSkipped;
    }

    NotifiersChain * GetNotifiersChain()
    {
        return &m_NotifiersChain;
    }

    void SetNotifiersChain(NotifiersChain & notify)
    {
        m_NotifiersChain = notify;
    }

    bool IsFrameExist() const
    {
        return m_IsFrameExist;
    }

    void SetFrameExistFlag(bool isFrameExist)
    {
        m_IsFrameExist = isFrameExist;
    }

    bool             m_IsFrameExist;
    Ipp64f           m_dFrameTime;
    Ipp32s           m_PictureStructureForRef;
    Ipp32s           m_PictureStructureForDec;
#ifdef USE_SEI
    Ipp8u            m_PictureStructureFromSEI;
    Ipp8s            m_RepeatCount;
#endif
    Ipp32s           totalMBs;

    // For type 1 calculation of m_PicOrderCnt. m_FrameNum is needed to
    // be used as previous frame num.

    Ipp32s           m_PicNum[2];
    Ipp32s           m_LongTermPicNum[2];
    Ipp32s           m_FrameNum;
    Ipp32s           m_FrameNumWrap;
    Ipp32s           m_LongTermFrameIdx;
    Ipp32s           m_RefPicListResetCount[2];
    Ipp32s           m_PicOrderCnt[2];    // Display order picture count mod MAX_PIC_ORDER_CNT.
    Ipp32s           m_crop_left;
    Ipp32s           m_crop_right;
    Ipp32s           m_crop_top;
    Ipp32s           m_crop_bottom;
    Ipp32s           m_crop_flag;

    Ipp32s           m_aspect_width;
    Ipp32s           m_aspect_height;

    bool             m_isShortTermRef[2];
    bool             m_isLongTermRef[2];
    H264DecoderGlobalMacroblocksDescriptor m_mbinfo; //Global MB Data

    IppiSize         m_dimensions;
    Ipp32s           m_bottom_field_flag[2];
        // The above variables are used for management of reference frames
        // on reference picture lists maintained in m_RefPicList. They are
        // updated as reference picture management information is decoded
        // from the bitstream. The picture and frame number variables determine
        // reference picture ordering on the lists.

    bool             m_bIDRFlag;
        // Read from slice NAL unit of current picture. True indicates the
        // picture contains only I or SI slice types.

    // Struct containing list 0 and list 1 reference picture lists for one slice.
    // Length is plus 1 to provide for null termination.
    struct H264H264DecoderRefPicListStruct
    {
        H264DecoderFrame *m_RefPicList[MAX_NUM_REF_FRAMES + 2];
        ReferenceFlags    m_Flags[MAX_NUM_REF_FRAMES + 2];
    };

    struct H264DecoderRefPicList
    {
        H264H264DecoderRefPicListStruct m_RefPicList[2];
    };    // H264DecoderRefPicList

    H264StructArray<H264DecoderRefPicList> m_pRefPicListTop;
    H264StructArray<H264DecoderRefPicList> m_pRefPicListBottom;


    Ipp32s                 m_TopSliceCount;

    Ipp8u                 *m_pParsedFrameDataNew;
    // This points to a huge, monolithic buffer that contains data
    // derived from parsing the current frame.  It contains motion
    // vectors,  MB info, reference indices, and slice info for the
    // current frame, among other things. When B slices are used it
    // contains L0 and L1 motion vectors and reference indices.

    IppiSize           m_paddedParsedFrameDataSize;
    // m_pParsedFrameData's allocated size is remembered so that a
    // re-allocation is done only if size requirements exceed the
    // existing allocation.
    // m_paddedParsedFrameDataSize contains the image dimensions,
    // rounded up to a multiple of 16, that were used.

    H264DecoderFrame(MemoryAllocator *pMemoryAllocator);

    virtual ~H264DecoderFrame();

    virtual Status  allocate(const IppiSize &lumaSize, Ipp32s bpp, Ipp32s chroma_format);
    // This allocate method first clears our state, and then
    // calls H264DecYUVWorkSpace::allocate.
    // An existing buffer, if any, is not reallocated if it
    // is already large enough.


    // The following methods provide access to the H264Decoder's doubly
    // linked list of H264DecoderFrames.  Note that m_pPreviousFrame can
    // be non-NULL even for an I frame.
    H264DecoderFrame *previous() { return m_pPreviousFrame; }
    H264DecoderFrame *future()   { return m_pFutureFrame; }

    const H264DecoderFrame *previous() const { return m_pPreviousFrame; }
    const H264DecoderFrame *future() const { return m_pFutureFrame; }

    void setPrevious(H264DecoderFrame *pPrev)
    {
        m_pPreviousFrame = pPrev;
    }

    void setFuture(H264DecoderFrame *pFut)
    {
        m_pFutureFrame = pFut;
    }

    bool        isDisplayable()    { return m_isDisplayable; }
    void        SetisDisplayable()
    {
        m_isDisplayable = true;
        DecrementBusyState();
        DecrementBusyState();
    }
    void        unSetisDisplayable() { m_isDisplayable = false; }

    bool        wasOutputted()    { return m_wasOutputted; }
    void        setWasOutputted() { m_wasOutputted = true; }
    void        unsetWasOutputted() { m_wasOutputted = false; }

    bool        isDisposable()    { return (!m_isShortTermRef[0] &&
                                            !m_isShortTermRef[1] &&
                                            !m_isLongTermRef[0] &&
                                            !m_isLongTermRef[1] &&
                                            (m_wasOutputted || !m_isDisplayable) &&
                                            !m_BusyState); }

    bool        isCouldDisplay()
    {
        return  (isDisplayable() && !(!m_isShortTermRef[0] &&
                                    !m_isShortTermRef[1] &&
                                    !m_isLongTermRef[0] &&
                                    !m_isLongTermRef[1] &&
                                    (m_wasOutputted || !m_isDisplayable)));
    }

    // A decoded frame can be "disposed" if it is not an active reference
    // and it is not locked by the calling application and it has been
    // output for display.

    Ipp32s PicNum(Ipp32s f, Ipp32s force=0)
    {
        if ((m_PictureStructureForRef>=FRM_STRUCTURE && force==0) || force==3)
        {
            return IPP_MIN(m_PicNum[0],m_PicNum[1]);
        }
        else if (force==2)
        {
            if (isShortTermRef(0) && isShortTermRef(1)) return IPP_MIN(m_PicNum[0],m_PicNum[1]);
            else if (isShortTermRef(0)) return m_PicNum[0];
            else return m_PicNum[0];
        }

        return m_PicNum[f];
    }

    void setPicNum(Ipp32s picNum, Ipp32s f)
    {
        if (m_PictureStructureForRef >= FRM_STRUCTURE)
        {
            m_PicNum[0] = m_PicNum[1] = picNum;
        }
        else
            m_PicNum[f] = picNum;
    }

    // Updates m_LongTermPicNum for if long term reference, based upon
    // m_LongTermFrameIdx.
    Ipp32s FrameNum()
    {
        return m_FrameNum;
    }

    void setFrameNum(Ipp32s FrameNum)
    {
        m_FrameNum = FrameNum;
    }

    Ipp32s FrameNumWrap()
    {
        return m_FrameNumWrap;
    }

    void setFrameNumWrap(Ipp32s FrameNumWrap)
    {
        m_FrameNumWrap = FrameNumWrap;
    };

    void UpdateFrameNumWrap(Ipp32s CurrFrameNum, Ipp32s MaxFrameNum, Ipp32s CurrPicStruct);
    // Updates m_FrameNumWrap and m_PicNum if the frame is a short-term
    // reference and a frame number wrap has occurred.

    Ipp32s LongTermFrameIdx()
    {
        return m_LongTermFrameIdx;
    }

    void setLongTermFrameIdx(Ipp32s LongTermFrameIdx)
    {
        m_LongTermFrameIdx = LongTermFrameIdx;
    };

    bool isShortTermRef(Ipp32s WhichField) const
    {
        if (m_PictureStructureForRef>=FRM_STRUCTURE )
            return m_isShortTermRef[0] && m_isShortTermRef[1];
        else
            return m_isShortTermRef[WhichField];
    };

    Ipp32s isShortTermRef() const
    {
        return m_isShortTermRef[0] + m_isShortTermRef[1]*2;
    };

    void SetisShortTermRef(Ipp32s WhichField)
    {
        if (m_PictureStructureForRef>=FRM_STRUCTURE)
            m_isShortTermRef[0] = m_isShortTermRef[1] = true;
        else
            m_isShortTermRef[WhichField] = true;
    }

    Ipp32s PicOrderCnt(Ipp32s index, Ipp32s force=0)
    {
        if ((m_PictureStructureForRef>=FRM_STRUCTURE && force==0) || force==3)
        {
            return IPP_MIN(m_PicOrderCnt[0],m_PicOrderCnt[1]);
        }
        else if (force==2)
        {
            if (isShortTermRef(0) && isShortTermRef(1))
                return IPP_MIN(m_PicOrderCnt[0],m_PicOrderCnt[1]);
            else if (isShortTermRef(0))
                return m_PicOrderCnt[0];
            else
                return m_PicOrderCnt[1];
        }
        return m_PicOrderCnt[index];
    }

    Ipp32s DeblockPicID(Ipp32s index)
    {
        size_t ret = (size_t) ((Ipp8u *) this - (Ipp8u *) 0);
        return (Ipp32s) (ret + index);

    }

    void setPicOrderCnt(Ipp32s PicOrderCnt, Ipp32s index) {m_PicOrderCnt[index] = PicOrderCnt;};
    bool isLongTermRef(Ipp32s WhichField) const
    {
        if (m_PictureStructureForRef>=FRM_STRUCTURE)
            return m_isLongTermRef[0] && m_isLongTermRef[1];
        else
            return m_isLongTermRef[WhichField];
    };

    Ipp32s isLongTermRef() const
    {
        return m_isLongTermRef[0] + m_isLongTermRef[1]*2;
    };

    void SetisLongTermRef(Ipp32s WhichField)
    {
        if (m_PictureStructureForRef>=FRM_STRUCTURE)
            m_isLongTermRef[0] = m_isLongTermRef[1] = true;
        else
            m_isLongTermRef[WhichField] = true;
    }

    void unSetisShortTermRef(Ipp32s WhichField)
    {
        if (m_PictureStructureForRef>=FRM_STRUCTURE)
        {
            m_isShortTermRef[0] = m_isShortTermRef[1] = false;
        }
        else
            m_isShortTermRef[WhichField] = false;
    }

    void unSetisLongTermRef(Ipp32s WhichField)
    {
        if (m_PictureStructureForRef>=FRM_STRUCTURE)
        {
            m_isLongTermRef[0] = m_isLongTermRef[1] = false;
        }
        else
            m_isLongTermRef[WhichField] = false;
    }

    Ipp32s LongTermPicNum(Ipp32s f, Ipp32s force=0)
    {
        if ((m_PictureStructureForRef>=FRM_STRUCTURE && force==0) || force==3)
        {
            return IPP_MIN(m_LongTermPicNum[0],m_LongTermPicNum[1]);
        }
        else if (force==2)
        {
            if (isLongTermRef(0) && isLongTermRef(1))
                return IPP_MIN(m_LongTermPicNum[0],m_LongTermPicNum[1]);
            else if (isLongTermRef(0))
                return m_LongTermPicNum[0];
            else return m_LongTermPicNum[1];
        }
        return m_LongTermPicNum[f];
    }

    void setLongTermPicNum(Ipp32s LongTermPicNum,Ipp32s f) {m_LongTermPicNum[f] = LongTermPicNum;}
    void UpdateLongTermPicNum(Ipp32s CurrPicStruct);

    void IncreaseRefPicListResetCount(Ipp32s f)
    {
        m_RefPicListResetCount[f]++;
    }

    void InitRefPicListResetCount(Ipp32s f)
    {
        if (m_PictureStructureForRef>=FRM_STRUCTURE)
            m_RefPicListResetCount[0]=m_RefPicListResetCount[1]=0;
        else
            m_RefPicListResetCount[f]=0;
    }

    Ipp32s RefPicListResetCount(Ipp32s f,Ipp32s force=0)
    {
        if ((m_PictureStructureForRef>=FRM_STRUCTURE && force==0)|| force==3)
            return IPP_MAX(m_RefPicListResetCount[0],m_RefPicListResetCount[1]);
        else
            return m_RefPicListResetCount[f];
    }

    Ipp8s GetNumberByParity(Ipp32s parity) const
    {
        if (parity==-1) return -1;
        if (m_bottom_field_flag[0]==parity) return 0;
        if (m_bottom_field_flag[1]==parity) return 1;
        //VM_ASSERT(m_PictureStructureForDec>=FRM_STRUCTURE); // There could be only one un-paired field
        return -1;
    }

    //////////////////////////////////////////////////////////////////////////////
    // GetRefPicList
    // Returns pointer to start of specified ref pic list.
    //////////////////////////////////////////////////////////////////////////////
    H264H264DecoderRefPicListStruct* GetRefPicList(Ipp32s sliceNumber, Ipp32s list);

    const H264H264DecoderRefPicListStruct* GetRefPicList(Ipp32s sliceNumber, Ipp32s list) const;

    Status allocateParsedFrameData(const IppiSize&, Ipp32s bpp);
        // Reallocate m_pParsedFrameData, if necessary, and initialize the
        // various pointers that point into it.

    void deallocateParsedFrameData();

    bool IsAuxiliaryFrame() const
    {
        return is_auxiliary_frame;
    }

    void DefaultFill(Ipp32s field, bool isChromaOnly);

    void SetExternalPointers(
        const IppiSize &lumaSize,
        Ipp32s bpp,
        Ipp32s chroma_format,
        PlanePtrYCommon   pYPlane,
        Ipp32s      pitch_luma,
        PlanePtrUVCommon  pUPlane,
        PlanePtrUVCommon  pVPlane,
        Ipp32s      pitch_chroma);

    bool post_procces_complete;
    bool is_auxiliary_frame;
    H264DecoderFrame * primary_picture;

    Ipp32s m_iNumberOfSlices;
    Ipp32s m_iResourceNumber;

    Ipp32s m_index;
    Ipp32s m_UID;
    FrameType m_FrameType;

    Ipp32s GetError() const
    {
        return m_ErrorType;
    }

    void SetError(Ipp32s errorType)
    {
        m_ErrorType = errorType;
    }

protected:
    // Declare memory management tools
    MemoryAllocator *m_pMemoryAllocator;
    MemID m_midParsedFrameDataNew;

    Ipp32s m_ErrorType;
};

class H264DecoderFrameExtension : public H264DecoderFrame
{
    DYNAMIC_CAST_DECL(H264DecoderFrameExtension, H264DecoderFrame)

public:
    H264DecoderFrameExtension(MemoryAllocator *pMemoryAllocator);

    virtual ~H264DecoderFrameExtension();

    H264DecoderFrame * GetAuxiliaryFrame();

    void AllocateAuxiliary();

    void FillInfoToAuxiliary();

private:

    H264DecoderFrame * m_pAuxiliaryFrame;
};

inline H264DecoderFrame * GetAuxiliaryFrame(H264DecoderFrame * frame)
{
    if (frame)
    {
        H264DecoderFrameExtension * fr = DynamicCast<H264DecoderFrameExtension>(frame);
        return fr ? fr->GetAuxiliaryFrame() : 0;
    }

    return 0;
}

} // end namespace UMC

#endif // __UMC_H264_FRAME_H__
#endif // UMC_ENABLE_H264_VIDEO_DECODER
