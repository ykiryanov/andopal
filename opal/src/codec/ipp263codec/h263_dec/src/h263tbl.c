/* ///////////////////////////////////////////////////////////////////////
//
//               INTEL CORPORATION PROPRIETARY INFORMATION
//  This software is supplied under the terms of a license agreement or
//  nondisclosure agreement with Intel Corporation and may not be copied
//  or disclosed except in accordance with the terms of that agreement.
//        Copyright (c) 2005-2006 Intel Corporation. All Rights Reserved.
//
//  Description:  H.263++ related tables.
//
*/

#include "h263.h"

const Ipp8u h263_cCbCrMvRound16[16] = {0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2};
const Ipp8s h263_dquant[4] = {-1, -2, 1, 2};
const Ipp8s h263_dquant_Mod[2][31] = {
  {
    3, 1, 2, 3, 4, 5, 6, 7, 8, 9, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28
  },
  {
    2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 24, 25, 26, 27, 28, 29, 30, 31, 31, 31, 26
  }
};
const Ipp8u h263_quant_c[32] = {
  0, 1, 2, 3, 4, 5, 6, 6, 7, 8, 9, 9, 10, 10, 11, 11, 12, 12, 12, 13, 13, 13, 14, 14, 14, 14, 14, 15, 15, 15, 15, 15
};

const h263_VLC1 h263_cbpy[64] = {{16,255},{16,255},{6,6},{9,6},{8,5},{8,5},{4,5},{4,5},{2,5},{2,5},{1,5},{1,5},{0,4},{0,4},{0,4},{0,4},{12,4},{12,4},{12,4},{12,4},{10,4},{10,4},{10,4},{10,4},{14,4},{14,4},{14,4},{14,4},{5,4},{5,4},{5,4},{5,4},{13,4},{13,4},{13,4},{13,4},{3,4},{3,4},{3,4},{3,4},{11,4},{11,4},{11,4},{11,4},{7,4},{7,4},{7,4},{7,4},{15,2},{15,2},{15,2},{15,2},{15,2},{15,2},{15,2},{15,2},{15,2},{15,2},{15,2},{15,2},{15,2},{15,2},{15,2},{15,2}};
const Ipp8u h263_Pmb_type[256] = {255,255,4,4,4,1,3,3,3,3,2,2,3,3,3,3,2,2,2,2,2,2,2,2,1,1,1,1,1,1,1,1,4,4,4,4,4,4,4,4,0,0,0,0,0,0,0,0,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1};
const Ipp8u h263_Pmb_cbpc[256] = {0,0,3,2,1,3,2,2,1,1,3,3,3,3,3,3,2,2,2,2,1,1,1,1,2,2,2,2,1,1,1,1,0,0,0,0,0,0,0,0,3,3,3,3,3,3,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
const Ipp8u h263_Pmb_bits[256] = {9,9,9,9,9,9,8,8,8,8,8,8,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3};

const h263_VLC1 h263_Bmb_cbpc[8] = {{0, 1}, {0, 1}, {0, 1}, {0, 1}, {1, 2}, {1, 2}, {3, 3}, {2, 3}};
/* vlc.len = (dquant << 5) | (cbp << 4) | bits; */
const h263_VLC1 h263_Bmb_type[31] = {
  {7,0x35},{6,0x34},{6,0x34},{7,0x05},{7,0x15},{9,0x35},{8,0x35},
  {8,0x03},{8,0x03},{8,0x03},{8,0x03},{8,0x13},{8,0x13},{8,0x13},{8,0x13},
  {9,0x03},{9,0x03},{9,0x03},{9,0x03},{9,0x13},{9,0x13},{9,0x13},{9,0x13},
  {6,0x12},{6,0x12},{6,0x12},{6,0x12},{6,0x12},{6,0x12},{6,0x12},{6,0x12}
};
/* IPPVC_MBTYPE_BACKWARD is used for UPWARD prediction */
const h263_VLC1 h263_EPmb_type_0[7] = {{7, 0x36}, {8, 0x35}, {8, 0x35}, {7, 0x05}, {7, 0x05}, {7, 0x15}, {7, 0x15}};
const h263_VLC1 h263_EPmb_type_1[7] = {{9, 0x33}, {8, 0x03}, {8, 0x13}, {9, 0x11}, {9, 0x11}, {9, 0x11}, {9, 0x11}};

/* vlc.len = (cbpc << 4) | bits; */
/* IPPVC_MBTYPE_INTER is used for UPWARD prediction */
const h263_VLC1 h263_EImb_type[15] = {
  {3,0x08},{1,0x17},{1,0x17},{1,0x27},{1,0x27},{1,0x37},{1,0x37},
  {0,0/*incorrect VLC*/},{3,0x18},{3,0x28},{3,0x38},
  {4,0x08},{4,0x18},{4,0x28},{4,0x38}
};

const h263_VLC1 h263_MVD_T14_1[] = {
    {32,12},{31,12},
    {30,11},{30,11},{29,11},{29,11},{28,11},{28,11},
    {27,11},{27,11},{26,11},{26,11},{25,11},{25,11},
    {24,10},{24,10},{24,10},{24,10},{23,10},{23,10},{23,10},{23,10},
    {22,10},{22,10},{22,10},{22,10},{21,10},{21,10},{21,10},{21,10},
    {20,10},{20,10},{20,10},{20,10},{19,10},{19,10},{19,10},{19,10},
    {18,10},{18,10},{18,10},{18,10},{17,10},{17,10},{17,10},{17,10},
    {16,10},{16,10},{16,10},{16,10},{15,10},{15,10},{15,10},{15,10},
    {14,10},{14,10},{14,10},{14,10},{13,10},{13,10},{13,10},{13,10},
    {12,10},{12,10},{12,10},{12,10},{11,10},{11,10},{11,10},{11,10},
    {10, 9},{10, 9},{10, 9},{10, 9},{10, 9},{10, 9},{10, 9},{10, 9},
    { 9, 9},{ 9, 9},{ 9, 9},{ 9, 9},{ 9, 9},{ 9, 9},{ 9, 9},{ 9, 9},
    { 8, 9},{ 8, 9},{ 8, 9},{ 8, 9},{ 8, 9},{ 8, 9},{ 8, 9},{ 8, 9},
    { 0x7, 7},{ 7, 7},{ 7, 0x7},{ 7, 7},{ 7, 7},{ 7, 7},{ 7, 7},{ 7, 7},
    { 0x7, 7},{ 7, 7},{ 7, 0x7},{ 7, 7},{ 7, 7},{ 7, 7},{ 7, 7},{ 7, 7},
    { 0x7, 7},{ 7, 7},{ 7, 0x7},{ 7, 7},{ 7, 7},{ 7, 7},{ 7, 7},{ 7, 7},
    { 0x7, 7},{ 7, 7},{ 7, 0x7},{ 7, 7},{ 7, 7},{ 7, 7},{ 7, 7},{ 7, 7},
};

const h263_VLC1 h263_MVD_T14_2[] = {
    { 6, 7},{ 5, 7},{ 4, 6},{ 4, 6},
    { 3, 4},{ 3, 4},{ 3, 4},{ 3, 4},{ 3, 4},{ 3, 4},{ 3, 4},{ 3, 4},
    { 2, 3},{ 2, 3},{ 2, 3},{ 2, 3},{ 2, 3},{ 2, 3},{ 2, 3},{ 2, 3},
    { 2, 3},{ 2, 3},{ 2, 3},{ 2, 3},{ 2, 3},{ 2, 3},{ 2, 3},{ 2, 3},
    { 1, 2},{ 1, 2},{ 1, 2},{ 1, 2},{ 1, 2},{ 1, 2},{ 1, 2},{ 1, 2},
    { 1, 2},{ 1, 2},{ 1, 2},{ 1, 2},{ 1, 2},{ 1, 2},{ 1, 2},{ 1, 2},
    { 1, 2},{ 1, 2},{ 1, 2},{ 1, 2},{ 1, 2},{ 1, 2},{ 1, 2},{ 1, 2},
    { 1, 2},{ 1, 2},{ 1, 2},{ 1, 2},{ 1, 2},{ 1, 2},{ 1, 2},{ 1, 2},
    { 0, 1},{ 0, 1},{ 0, 1},{ 0, 1},{ 0, 1},{ 0, 1},{ 0, 1},{ 0, 1},
    { 0, 1},{ 0, 1},{ 0, 1},{ 0, 1},{ 0, 1},{ 0, 1},{ 0, 1},{ 0, 1},
    { 0, 1},{ 0, 1},{ 0, 1},{ 0, 1},{ 0, 1},{ 0, 1},{ 0, 1},{ 0, 1},
    { 0, 1},{ 0, 1},{ 0, 1},{ 0, 1},{ 0, 1},{ 0, 1},{ 0, 1},{ 0, 1},
    { 0, 1},{ 0, 1},{ 0, 1},{ 0, 1},{ 0, 1},{ 0, 1},{ 0, 1},{ 0, 1},
    { 0, 1},{ 0, 1},{ 0, 1},{ 0, 1},{ 0, 1},{ 0, 1},{ 0, 1},{ 0, 1},
    { 0, 1},{ 0, 1},{ 0, 1},{ 0, 1},{ 0, 1},{ 0, 1},{ 0, 1},{ 0, 1},
    { 0, 1},{ 0, 1},{ 0, 1},{ 0, 1},{ 0, 1},{ 0, 1},{ 0, 1},{ 0, 1},
};

const Ipp32s h263_pic_width[5] = {128, 176, 352, 704, 1408};
const Ipp32s h263_pic_height[5] = {96, 144, 288, 576, 1152};
const Ipp32s h263_mblocks_in_gob[5] = {8, 11, 22, 88, 352};
const Ipp32s h263_gobs_in_pic[5] = {6, 9, 18, 18, 18};