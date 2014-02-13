//
//  ippmp3.s
//  Player
//
//  Created by Sergey Bezruchkin on 10/25/13.
//  Copyright (c) 2013 Sergey Bezruchkin. All rights reserved.
//
#if defined __i386__
#else
.macro gl
.globl $0
$0:
.endmacro

.macro redirect
.globl $0
$0:
b $1:
.endmacro

.data
.align  4


.text
.align  4

gl ippsReQuantizeSfb_MP3_32s_I
gl ippsHuffmanDecodeSfb_MP3_1u32s
gl ippsHuffmanDecode_MP3_1u32s
gl ippsUnpackFrameHeader_MP3
gl ippsUnpackScaleFactors_MP3_1u8s
gl ippsUnpackSideInfo_MP3
gl ippsReQuantize_MP3_32s_I
gl ippsMDCTInv_MP3_32s
gl ippsSynthPQMF_MP3_32s16s

#include "ipps/ownsZero_8u.s"
#include "ipps/ownsSet_32s.s"
#include "ipps/ownsSet_8u.s"
#include "ipps/ownsCopy_8u.s"

#include "ippac/ippsHuffmanDecodeSfb_MP3_1u32s.s"
#include "ippac/ippsHuffmanDecode_MP3_1u32s.s"
#include "ippac/ippsUnpackFrameHeader_MP3.s"
#include "ippac/ippsUnpackScaleFactors_MP3_1u8s.s"
#include "ippac/ippsUnpackSideInfo_MP3.s"

#include "ippac/ippsReQuantizeSfb_MP3_32s_I.s"
#include "ippac/ippsReQuantize_MP3_32s_I.s"
#include "ippac/ippsMDCTInv_MP3_32s.s"
#include "ippac/ippsSynthPQMF_MP3_32s16s.s"

#include "ippac/pacmp3sfbtbl_nosplit.s"
#include "ippac/pacmp3dhufftbl_nosplit.s"

#endif
