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

#include "umc_h264_bitstream.h"
#include "umc_h264_bitstream_inlines.h"

namespace UMC
{

Ipp32s H264Bitstream::ParseSEI(H264SeqParamSet **sps, Ipp32s current_sps, H264SEIPayLoad *spl)
{
    return sei_message(sps,current_sps,spl);
}

Ipp32s H264Bitstream::sei_message(H264SeqParamSet **sps, Ipp32s current_sps, H264SEIPayLoad *spl)
{
    Ipp32u code;
    Ipp32s payloadType = 0;

    ippiNextBits(m_pbs, m_bitOffset, 8, code);
    while (code  ==  0xFF)
    {
        /* fixed-pattern bit string using 8 bits written equal to 0xFF */
        ippiGetNBits(m_pbs, m_bitOffset, 8, code);
        payloadType += 255;
        ippiNextBits(m_pbs, m_bitOffset, 8, code);
    }

    Ipp32s last_payload_type_byte;    //Ipp32u integer using 8 bits
    ippiGetNBits(m_pbs, m_bitOffset, 8, last_payload_type_byte);

    payloadType += last_payload_type_byte;

    Ipp32s payloadSize = 0;

    ippiNextBits(m_pbs, m_bitOffset, 8, code);
    while( code  ==  0xFF )
    {
        /* fixed-pattern bit string using 8 bits written equal to 0xFF */
        ippiGetNBits(m_pbs, m_bitOffset, 8, code);
        payloadSize += 255;
        ippiNextBits(m_pbs, m_bitOffset, 8, code);
    }

    Ipp32s last_payload_size_byte;    //Ipp32u integer using 8 bits

    ippiGetNBits(m_pbs, m_bitOffset, 8, last_payload_size_byte);
    payloadSize += last_payload_size_byte;
    memset(spl, 0, sizeof(H264SEIPayLoad));
    spl->payLoadSize = payloadSize;

    if (payloadType < 0 || payloadType > SEI_RESERVED)
        payloadType = SEI_RESERVED;

    spl->payLoadType = (SEI_TYPE)payloadType;

    if (spl->payLoadSize > BytesLeft())
    {
        throw h264_exception(UMC_ERR_INVALID_STREAM);
    }

    Ipp32u * pbs;
    Ipp32u bitOffsetU;
    Ipp32s bitOffset;

    GetState(&pbs, &bitOffsetU);
    bitOffset = bitOffsetU;

    Ipp32s ret = sei_payload(sps, current_sps, spl);

    for (Ipp32u i = 0; i < spl->payLoadSize; i++)
    {
        ippiSkipNBits(pbs, bitOffset, 8);
    }

    SetState(pbs, bitOffset);

    return ret;
}

Ipp32s H264Bitstream::sei_payload(H264SeqParamSet **sps,Ipp32s current_sps,H264SEIPayLoad *spl)
{
    Ipp32u payloadType =spl->payLoadType;
    switch( payloadType)
    {
    case SEI_BUFFERING_PERIOD_TYPE:
        return buffering_period(sps,current_sps,spl);
    case SEI_PIC_TIMING_TYPE:
        return pic_timing(sps,current_sps,spl);
    case SEI_PAN_SCAN_RECT_TYPE:
        return pan_scan_rect(sps,current_sps,spl);
    case SEI_FILLER_TYPE:
        return filler_payload(sps,current_sps,spl);
    case SEI_USER_DATA_REGISTERED_TYPE:
        return user_data_registered_itu_t_t35(sps,current_sps,spl);
    case SEI_USER_DATA_UNREGISTERED_TYPE:
        return user_data_unregistered(sps,current_sps,spl);
    case SEI_RECOVERY_POINT_TYPE:
        return recovery_point(sps,current_sps,spl);
    case SEI_DEC_REF_PIC_MARKING_TYPE:
        return dec_ref_pic_marking_repetition(sps,current_sps,spl);
    case SEI_SPARE_PIC_TYPE:
        return spare_pic(sps,current_sps,spl);
    case SEI_SCENE_INFO_TYPE:
        return scene_info(sps,current_sps,spl);
    case SEI_SUB_SEQ_INFO_TYPE:
        return sub_seq_info(sps,current_sps,spl);
    case SEI_SUB_SEQ_LAYER_TYPE:
        return sub_seq_layer_characteristics(sps,current_sps,spl);
    case SEI_SUB_SEQ_TYPE:
        return sub_seq_characteristics(sps,current_sps,spl);
    case SEI_FULL_FRAME_FREEZE_TYPE:
        return full_frame_freeze(sps,current_sps,spl);
    case SEI_FULL_FRAME_FREEZE_RELEASE_TYPE:
        return full_frame_freeze_release(sps,current_sps,spl);
    case SEI_FULL_FRAME_SNAPSHOT_TYPE:
        return full_frame_snapshot(sps,current_sps,spl);
    case SEI_PROGRESSIVE_REF_SEGMENT_START_TYPE:
        return progressive_refinement_segment_start(sps,current_sps,spl);
    case SEI_PROGRESSIVE_REF_SEGMENT_END_TYPE:
        return progressive_refinement_segment_end(sps,current_sps,spl);
    case SEI_MOTION_CONSTRAINED_SG_SET_TYPE:
        return motion_constrained_slice_group_set(sps,current_sps,spl);
    default:
        return reserved_sei_message(sps,current_sps,spl);
    }
}

Ipp32s H264Bitstream::buffering_period(H264SeqParamSet **sps, Ipp32s current_sps, H264SEIPayLoad *spl)
{
    return unparsed_sei_message(sps, current_sps, spl);
}

Ipp32s H264Bitstream::pic_timing(H264SeqParamSet **sps, Ipp32s current_sps, H264SEIPayLoad *spl)
{
    const Ipp8u NumClockTS[]={1,1,1,2,2,3,3,2,3};
    H264SeqParamSet *csps = sps[current_sps];
    H264SEIPayLoad::SEIMessages::PicTiming &pts = spl->SEI_messages.pic_timing;

    if (csps->nal_hrd_parameters_present_flag || csps->vcl_hrd_parameters_present_flag)
    {
        pts.cbp_removal_delay = GetBits(csps->cpb_removal_delay_length);
        pts.dpb_ouput_delay = GetBits(csps->dpb_output_delay_length);
    }
    if (csps->pic_struct_present_flag)
    {
        pts.pic_struct = (Ipp8u)GetBits(4);
        for (Ipp32s i=0;i<NumClockTS[spl->SEI_messages.pic_timing.pic_struct];i++)
        {
            pts.clock_timestamp_flag[i] = (Ipp8u)Get1Bit();
            if (pts.clock_timestamp_flag[i])
            {
                pts.clock_timestamps[i].ct_type = (Ipp8u)GetBits(2);
                pts.clock_timestamps[i].nunit_field_based_flag = (Ipp8u)Get1Bit();
                pts.clock_timestamps[i].counting_type = (Ipp8u)GetBits(5);
                pts.clock_timestamps[i].full_timestamp_flag = (Ipp8u)Get1Bit();
                pts.clock_timestamps[i].discontinuity_flag = (Ipp8u)Get1Bit();
                pts.clock_timestamps[i].cnt_dropped_flag = (Ipp8u)Get1Bit();
                pts.clock_timestamps[i].n_frames = (Ipp8u)GetBits(8);
                if (pts.clock_timestamps[i].full_timestamp_flag )
                {
                    pts.clock_timestamps[i].seconds_value = (Ipp8u)GetBits(6);
                    pts.clock_timestamps[i].minutes_value = (Ipp8u)GetBits(6);
                    pts.clock_timestamps[i].hours_value = (Ipp8u)GetBits(5);
                }
                else
                {
                    if (Get1Bit())
                    {
                        pts.clock_timestamps[i].seconds_value = (Ipp8u)GetBits(6);
                        if (Get1Bit())
                        {
                            pts.clock_timestamps[i].minutes_value = (Ipp8u)GetBits(6);
                            if (Get1Bit())
                            {
                                pts.clock_timestamps[i].hours_value = (Ipp8u)GetBits(5);
                            }
                        }
                    }
                }
                if(csps->time_offset_length>0)
                    pts.clock_timestamps[i].time_offset = (Ipp8u)GetBits(csps->time_offset_length);
            }
        }
    }
    AlignPointerRight();
    return current_sps;
    //unparsed_sei_message(sps,spl);
}

Ipp32s H264Bitstream::pan_scan_rect(H264SeqParamSet **sps, Ipp32s current_sps, H264SEIPayLoad *spl)
{
    return unparsed_sei_message(sps, current_sps, spl);
}

Ipp32s H264Bitstream::filler_payload(H264SeqParamSet **sps, Ipp32s current_sps, H264SEIPayLoad *spl)
{
    return unparsed_sei_message(sps, current_sps, spl);
}

Ipp32s H264Bitstream::user_data_registered_itu_t_t35(H264SeqParamSet ** /*sps*/, Ipp32s current_sps, H264SEIPayLoad *spl)
{
    H264SEIPayLoad::SEIMessages::UserDataRegistered * user_data = &(spl->SEI_messages.user_data_registered);
    Ipp32u code;
    ippiGetBits8(m_pbs, m_bitOffset, code);
    user_data->itu_t_t35_country_code = (Ipp8u)code;

    Ipp32u i = 1;

    user_data->itu_t_t35_country_code_extension_byte = 0;
    if (user_data->itu_t_t35_country_code == 0xff)
    {
        ippiGetBits8(m_pbs, m_bitOffset, code);
        user_data->itu_t_t35_country_code_extension_byte = (Ipp8u)code;
        i++;
    }

    spl->user_data = new Ipp8u[spl->payLoadSize + 1];

    for(Ipp32s k = 0; i < spl->payLoadSize; i++, k++)
    {
        ippiGetBits8(m_pbs, m_bitOffset, code);
        spl->user_data[k] = (Ipp8u) code;
    }

    return current_sps;
}

Ipp32s H264Bitstream::user_data_unregistered(H264SeqParamSet **sps, Ipp32s current_sps, H264SEIPayLoad *spl)
{
    return unparsed_sei_message(sps, current_sps, spl);
}

Ipp32s H264Bitstream::recovery_point(H264SeqParamSet ** /*sps*/, Ipp32s current_sps, H264SEIPayLoad *spl)
{
    H264SEIPayLoad::SEIMessages::RecoveryPoint * recPoint = &(spl->SEI_messages.recovery_point);

    recPoint->recovery_frame_cnt = (Ipp8u)GetVLCElement(false);

    if (recPoint->recovery_frame_cnt > 16)
        return -1;

    recPoint->exact_match_flag = (Ipp8u)Get1Bit();
    recPoint->broken_link_flag = (Ipp8u)Get1Bit();
    recPoint->changing_slice_group_idc = (Ipp8u)GetBits(2);

    if (recPoint->changing_slice_group_idc > 2)
        return -1;

    return current_sps;
}

Ipp32s H264Bitstream::dec_ref_pic_marking_repetition(H264SeqParamSet **sps, Ipp32s current_sps, H264SEIPayLoad *spl)
{
    return unparsed_sei_message(sps, current_sps, spl);
}

Ipp32s H264Bitstream::spare_pic(H264SeqParamSet **sps, Ipp32s current_sps, H264SEIPayLoad *spl)
{
    return unparsed_sei_message(sps, current_sps, spl);
}

Ipp32s H264Bitstream::scene_info(H264SeqParamSet **sps, Ipp32s current_sps, H264SEIPayLoad *spl)
{
    return unparsed_sei_message(sps, current_sps, spl);
}

Ipp32s H264Bitstream::sub_seq_info(H264SeqParamSet **sps, Ipp32s current_sps, H264SEIPayLoad *spl)
{
    return unparsed_sei_message(sps, current_sps, spl);
}

Ipp32s H264Bitstream::sub_seq_layer_characteristics(H264SeqParamSet **sps, Ipp32s current_sps, H264SEIPayLoad *spl)
{
    return unparsed_sei_message(sps, current_sps, spl);
}

Ipp32s H264Bitstream::sub_seq_characteristics(H264SeqParamSet **sps, Ipp32s current_sps, H264SEIPayLoad *spl)
{
    return unparsed_sei_message(sps, current_sps, spl);
}

Ipp32s H264Bitstream::full_frame_freeze(H264SeqParamSet **sps, Ipp32s current_sps, H264SEIPayLoad *spl)
{
    return unparsed_sei_message(sps, current_sps, spl);
}

Ipp32s H264Bitstream::full_frame_freeze_release(H264SeqParamSet **sps, Ipp32s current_sps, H264SEIPayLoad *spl)
{
    return unparsed_sei_message(sps, current_sps, spl);
}

Ipp32s H264Bitstream::full_frame_snapshot(H264SeqParamSet **sps, Ipp32s current_sps, H264SEIPayLoad *spl)
{
    return unparsed_sei_message(sps, current_sps, spl);
}

Ipp32s H264Bitstream::progressive_refinement_segment_start(H264SeqParamSet **sps, Ipp32s current_sps, H264SEIPayLoad *spl)
{
    return unparsed_sei_message(sps, current_sps, spl);
}

Ipp32s H264Bitstream::progressive_refinement_segment_end(H264SeqParamSet **sps, Ipp32s current_sps, H264SEIPayLoad *spl)
{
    return unparsed_sei_message(sps, current_sps, spl);
}

Ipp32s H264Bitstream::motion_constrained_slice_group_set(H264SeqParamSet **sps, Ipp32s current_sps, H264SEIPayLoad *spl)
{
    return unparsed_sei_message(sps, current_sps, spl);
}

Ipp32s H264Bitstream::reserved_sei_message(H264SeqParamSet **sps, Ipp32s current_sps, H264SEIPayLoad *spl)
{
    return unparsed_sei_message(sps, current_sps, spl);
}

Ipp32s H264Bitstream::unparsed_sei_message(H264SeqParamSet ** /*sps*/, Ipp32s current_sps, H264SEIPayLoad *spl)
{
    Ipp32u i;
    for(i = 0; i < spl->payLoadSize; i++)
        ippiSkipNBits(m_pbs, m_bitOffset, 8)
    AlignPointerRight();
    return current_sps;
}

}//namespace UMC
#endif // UMC_ENABLE_H264_VIDEO_DECODER
