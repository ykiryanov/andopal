/* ///////////////////////////////////////////////////////////////////////
//
//               INTEL CORPORATION PROPRIETARY INFORMATION
//  This software is supplied under the terms of a license agreement or
//  nondisclosure agreement with Intel Corporation and may not be copied
//  or disclosed except in accordance with the terms of that agreement.
//        Copyright (c) 2005-2006 Intel Corporation. All Rights Reserved.
//
//  Description:  H.263 decoder functions
//
*/

#include "h263.h"
#include "h263dec.h"

h263_Status h263_PredictDecodeMV(h263_Info *pInfo, h263_MacroBlock *MBcurr, Ipp32s frGOB, Ipp32s y, Ipp32s x, Ipp32s adv)
{
  IppMotionVector *mvLeft, *mvTop, *mvRight, *mvCurr;
  h263_Status status;
  h263_VideoPicture *VPic = &pInfo->VideoSequence.VideoPicture;
  Ipp32s  mbInRow = VPic->MacroBlockPerRow;
  Ipp32s i1, i2;

  if (adv) {
    i1 = 1;
    i2 = 2;
  } else {
    i1 = i2 = 0;
  }

  mvCurr  = MBcurr[0].mv;
  mvLeft  = MBcurr[-1].mv;
  mvTop   = MBcurr[-mbInRow].mv;
  mvRight = MBcurr[-mbInRow+1].mv;
  if (y == frGOB && x == 0) {
    mvCurr->dx = mvCurr->dy = 0;
  } else if (x == 0) {
    mvCurr->dx = h263_Median(0, mvTop[i2].dx, mvRight[i2].dx);
    mvCurr->dy = h263_Median(0, mvTop[i2].dy, mvRight[i2].dy);
  } else if (y == frGOB) {
    MBcurr->mv[0] = mvLeft[i1];
  } else if (x == mbInRow - 1) {
    mvCurr->dx = h263_Median(0, mvLeft[i1].dx, mvTop[i2].dx);
    mvCurr->dy = h263_Median(0, mvLeft[i1].dy, mvTop[i2].dy);
  } else {
    mvCurr->dx = h263_Median(mvLeft[i1].dx, mvTop[i2].dx, mvRight[i2].dx);
    mvCurr->dy = h263_Median(mvLeft[i1].dy, mvTop[i2].dy, mvRight[i2].dy);
  }

  if (!VPic->oppmodes.UMV && !VPic->modes.UMV) {
    status = h263_DecodeMV(pInfo, mvCurr, -32, 31);
  } else if (!VPic->oppmodes.UMV) {
    status = h263_DecodeMV(pInfo, mvCurr, -63, 63);
  } else {
    Ipp32s mvdx, mvdy;
    status = h263_DecodeMVD_umvplus(pInfo, &mvdx, &mvdy);
    mvCurr->dx = mvCurr->dx + (Ipp16s)mvdx;
    mvCurr->dy = mvCurr->dy + (Ipp16s)mvdy;
  }
  return status;
}

h263_Status h263_DecodeMVD(h263_Info *pInfo, Ipp32s *mvdx, Ipp32s *mvdy, Ipp32s fcode)
{
    const h263_VLC1 *pTab;
    Ipp32s          mvd, sign;
    Ipp32u          code;
    Ipp32s          factor = fcode - 1;

    /* decode MVDx */
    code = h263_ShowBits(pInfo, 12);
    if (code >= 128)
        pTab = h263_MVD_T14_2 + ((code - 128) >> 5);
    else if (code >= 2)
        pTab = h263_MVD_T14_1 + (code - 2);
    else
        return H263_STATUS_ERROR;
    mvd = pTab->code;
    h263_FlushBits(pInfo, pTab->len);
    if (mvd) {
        sign = h263_GetBit(pInfo);
        if (factor) {
            code = h263_GetBits9(pInfo, factor);
            mvd = ((mvd - 1) << factor) + code + 1;
        }
        if (sign)
            mvd = -mvd;
    }
    *mvdx = mvd;
    /* decode MVDy */
    code = h263_ShowBits(pInfo, 12);
    if (code >= 128)
        pTab = h263_MVD_T14_2 + ((code - 128) >> 5);
    else if (code >= 2)
        pTab = h263_MVD_T14_1 + (code - 2);
    else
        return H263_STATUS_ERROR;
    mvd = pTab->code;
    h263_FlushBits(pInfo, pTab->len);
    if (mvd) {
        sign = h263_GetBit(pInfo);
        if (factor) {
            code = h263_GetBits9(pInfo, factor);
            mvd = ((mvd - 1) << factor) + code + 1;
        }
        if (sign)
            mvd = -mvd;
    }
    *mvdy = mvd;
    return H263_STATUS_OK;
}

h263_Status h263_DecodeMV(h263_Info *pInfo, IppMotionVector *mv, Ipp32s leftlim, Ipp32s rightlim)
{
  Ipp32s  mvdx, mvdy, dx, dy;

  if (h263_DecodeMVD(pInfo, &mvdx, &mvdy, 1) != H263_STATUS_OK)
    return H263_STATUS_ERROR;

  dx = mv->dx + mvdx;
  if (dx < leftlim)
    dx += 64;
  else if (dx > rightlim)
    dx -= 64;
  mv->dx = (Ipp16s)dx;
  dy = mv->dy + mvdy;
  if (dy < leftlim)
    dy += 64;
  else if (dy > rightlim)
    dy -= 64;
  mv->dy = (Ipp16s)dy;
  return H263_STATUS_OK;
}

h263_Status h263_DecodeMVD_umvplus(h263_Info *pInfo, Ipp32s *mvdx, Ipp32s *mvdy)
{
  Ipp32s mvx, mvy;
  Ipp32u code;

  code = h263_GetBit(pInfo);
  if (code)
    mvx = 0;
  else {
    mvx = 1;
    for (;;) {
      code = h263_GetBits9(pInfo, 2);
      if ((code & 1) == 0)
        break;
      mvx = (mvx << 1) | (code >> 1);
    }
    if (code & 2)
      mvx = -mvx;
  }

  code = h263_GetBit(pInfo);
  if (code)
    mvy = 0;
  else {
    mvy = 1;
    for (;;) {
      code = h263_GetBits9(pInfo, 2);
      if ((code & 1) == 0)
        break;
      mvy = (mvy << 1) | (code >> 1);
    }
    if (code & 2)
      mvy = -mvy;
  }
  if (mvx == 1 && mvy == 1)
    code = h263_GetBit(pInfo);

#ifdef H263_METICULOUS
  if (!code) {
    h263_Error("Error: Zero anti-emulation bit");
    return H263_STATUS_PARSE_ERROR;
  }
#endif

  *mvdx = mvx;
  *mvdy = mvy;

  return H263_STATUS_OK;
}

/*
//  Intra DC and AC reconstruction for macroblock
*/
h263_Status h263_DecodeMacroBlockIntra(h263_Info *pInfo, Ipp32s pat, Ipp32s quant, Ipp32s quant_c, Ipp8u *pR[], Ipp32s stepR[])
{
  __ALIGN16(Ipp16s, coeff, 64);
  Ipp32s blockNum, pm = 32, lnz;
  Ipp32s modQ = pInfo->VideoSequence.VideoPicture.oppmodes.modQuant;

  for (blockNum = 0; blockNum < 6; blockNum++) {
    if (blockNum > 3)
      quant = quant_c;
    if (ippiReconstructCoeffsIntra_H263_1u16s(&pInfo->bufptr, &pInfo->bitoff, coeff, &lnz, pat & pm, quant, 0, IPPVC_SCAN_ZIGZAG, modQ) != ippStsNoErr) {
      return H263_STATUS_ERROR;
    }
    if (lnz > 0) {
      ippiDCT8x8Inv_16s8u_C1R(coeff, pR[blockNum], stepR[blockNum]);
      h263_StatisticInc_(&pInfo->VideoSequence.Statistic.nB_INTRA_AC);
    } else {
      h263_Set8x8_8u(pR[blockNum], stepR[blockNum], (Ipp8u)((coeff[0] + 4) >> 3));
      h263_StatisticInc_(&pInfo->VideoSequence.Statistic.nB_INTRA_DC);
    }
    pm >>= 1;
  }
  return H263_STATUS_OK;
}

h263_Status h263_DecodeMacroBlockIntra_AdvI(h263_Info *pInfo, Ipp32s x, Ipp32s pat, Ipp32s quant, Ipp32s quant_c, Ipp32s scan, Ipp8u *pR[], Ipp32s stepR[])
{
  __ALIGN16(Ipp16s, coeff, 64);
  Ipp32s      blockNum, pm = 32, lnz, dc, ac, k, nz;
  Ipp16s      *predC, *predA;
  h263_IntraPredBlock *bCurr;
  Ipp32s modQ = pInfo->VideoSequence.VideoPicture.oppmodes.modQuant;

  for (blockNum = 0; blockNum < 6; blockNum ++) {
    bCurr = &pInfo->VideoSequence.IntraPredBuff.block[6*x+blockNum];
    if (blockNum > 3)
      quant = quant_c;
    if (pat & pm) {
      if (ippiReconstructCoeffsIntra_H263_1u16s(&pInfo->bufptr, &pInfo->bitoff, coeff, &lnz, pat & pm, quant, 1, scan, modQ) != ippStsNoErr)
        return H263_STATUS_ERROR;
      if (lnz) {
        h263_StatisticInc_(&pInfo->VideoSequence.Statistic.nB_INTRA_AC);
      } else {
        h263_StatisticInc_(&pInfo->VideoSequence.Statistic.nB_INTRA_DC);
      }
    } else {
      if (scan != IPPVC_SCAN_ZIGZAG) {
        h263_Zero64_16s(coeff);
      } else
        coeff[0] = 0;
      lnz = 0;
    }

    nz = 0;
    if (scan == IPPVC_SCAN_ZIGZAG) {
      if (bCurr->predA->dct_dc >= 0) {
        dc = bCurr->predA->dct_dc;
        dc = bCurr->predC->dct_dc >= 0 ? ((dc + bCurr->predC->dct_dc) >> 1) : dc;
      } else
        dc = bCurr->predC->dct_dc >= 0 ? bCurr->predC->dct_dc : 1024;
      if (lnz && ((quant > 8) || modQ)) { /* ??? */
        for (k = 1; k < 64; k ++) {
          h263_CLIP(coeff[k], -2048, 2047);
        }
      }
    } else if (scan == IPPVC_SCAN_HORIZONTAL) {
      if (bCurr->predC->dct_dc >= 0) {
        dc = bCurr->predC->dct_dc;
        predC = bCurr->predC->dct_acC;
        for (k = 1; k < 8; k ++) {
          ac = coeff[k] + predC[k];
          h263_CLIP(ac, -2048, 2047); /* ??? */
          coeff[k] = (Ipp16s)ac;
          if (ac)
            nz = 1;
        }
        if ((lnz > 7) && ((quant > 8) || modQ)) { /* ??? */
          for (k = 8; k < 64; k ++) {
            h263_CLIP(coeff[k], -2048, 2047);
          }
        }
      } else {
        dc = 1024;
        if (lnz && ((quant > 8) || modQ)) { /* ??? */
          for (k = 1; k < 64; k ++) {
            h263_CLIP(coeff[k], -2048, 2047);
          }
        }
      }
    } else { /* scan == IPPVC_SCAN_VERTICAL */
      if (bCurr->predA->dct_dc >= 0) {
        dc = bCurr->predA->dct_dc;
        predA = bCurr->predA->dct_acA;
        for (k = 1; k < 8; k ++) {
          ac = coeff[k*8] + predA[k];
          h263_CLIP(ac, -2048, 2047); /* ??? */
          coeff[k*8] = (Ipp16s)ac;
          if (ac)
            nz = 1;
        }
      } else
        dc = 1024;
      if (lnz && ((quant > 8) || modQ)) { /* ??? */
        for (k = 1; k < 64; k ++) {
          h263_CLIP(coeff[k], -2048, 2047);
        }
      }
    }
    dc += coeff[0];
    dc |= 1; /* oddify */
    h263_CLIP(dc, 0, 2047); /* ??? h263_CLIPR(dc, 2047); */
    coeff[0] = (Ipp16s)dc;

    if (lnz | nz) {
      ippiDCT8x8Inv_16s8u_C1R(coeff, pR[blockNum], stepR[blockNum]);
      /* copy predicted coeffs for future Prediction */
      for (k = 1; k < 8; k ++) {
        bCurr[6].dct_acC[k] = coeff[k];
        bCurr[6].dct_acA[k] = coeff[k*8];
      }
    } else {
      k = (coeff[0] + 4) >> 3;
      h263_CLIPR(k, 255);
      h263_Set8x8_8u(pR[blockNum], stepR[blockNum], (Ipp8u)k);
      for (k = 1; k < 8; k ++) {
        bCurr[6].dct_acC[k] = bCurr[6].dct_acA[k] = 0;
      }
    }
    bCurr[6].dct_dc = coeff[0];
    pm >>= 1;
  }
  return H263_STATUS_OK;
}

h263_Status h263_DecodeMacroBlockInter(h263_Info *pInfo, Ipp16s *coeffMB, Ipp32s quant, Ipp32s quant_c, Ipp32s pat)
{
  Ipp32s i, lnz, pm = 32;
  Ipp16s *coeff = coeffMB;
  Ipp32s modQ = pInfo->VideoSequence.VideoPicture.oppmodes.modQuant;
  Ipp32s altInterVLC = pInfo->VideoSequence.VideoPicture.oppmodes.altInterVLC;

  for (i = 0; i < 6; i ++) {
    if (i > 3)
      quant = quant_c;
    if ((pat) & pm) {
      if (!altInterVLC) {
        if (ippiReconstructCoeffsInter_H263_1u16s(&pInfo->bufptr, &pInfo->bitoff, coeff, &lnz, quant, modQ) != ippStsNoErr)
          return H263_STATUS_ERROR;
      } else {
        __ALIGN16(Ipp16s, coeffZ, 64);
        if (ippiDecodeCoeffsInter_H263_1u16s(&pInfo->bufptr, &pInfo->bitoff, coeffZ, &lnz, modQ, IPPVC_SCAN_NONE) != ippStsNoErr)
          if (ippiDecodeCoeffsIntra_H263_1u16s(&pInfo->bufptr, &pInfo->bitoff, coeffZ, &lnz, 1, modQ, IPPVC_SCAN_NONE) != ippStsNoErr)
            return H263_STATUS_ERROR;
        ippiQuantInvInter_H263_16s_C1I(coeffZ, lnz, quant, modQ);
        ippiScanInv_16s_C1(coeffZ, coeff, lnz, IPPVC_SCAN_ZIGZAG);
      }
      if (lnz != 0) {
        if ((lnz <= 4) && (coeff[16] == 0))
          ippiDCT8x8Inv_2x2_16s_C1I(coeff);
        else if ((lnz <= 13) && (coeff[32] == 0))
          ippiDCT8x8Inv_4x4_16s_C1I(coeff);
        else
          ippiDCT8x8Inv_16s_C1I(coeff);
      } else {
        h263_Set64_16s((Ipp16s)((coeff[0] + 4) >> 3), coeff);
      }
      h263_StatisticInc_(&pInfo->VideoSequence.Statistic.nB_INTER_C);
    } else {
      h263_StatisticInc_(&pInfo->VideoSequence.Statistic.nB_INTER_NC);
    }
    pm >>= 1;
    coeff += 64;
  }
  return H263_STATUS_OK;
}

h263_Status h263_BidirPredMacroblock(Ipp8u *pYr, Ipp32s stepYr, Ipp8u *pCbr, Ipp8u* pCrr, Ipp32s stepCr,
                                     Ipp8u *pYc, Ipp32s stepYc, Ipp8u *pCbc, Ipp8u* pCrc, Ipp32s stepCc,
                                     Ipp8u *predMB, IppMotionVector *mvForw, IppMotionVector *mvFCbCr,
                                     IppMotionVector *mvBack, IppMotionVector *mvBCbCr, Ipp32s fourMVmode)
{
  Ipp32s mvx0, mvx1, mvy0, mvy1, xL0, w0, xL, xR, yT, yB;
  IppiSize roiSize;
  Ipp8u *pCur;

  if (!fourMVmode)
    h263_Copy16x16HP_8u(pYr, stepYr, predMB, 16, &mvForw[0], 0);
  else {
    h263_Copy8x8HP_8u(pYr, stepYr, predMB, 16, &mvForw[0], 0);
    h263_Copy8x8HP_8u(pYr + 8, stepYr, predMB + 8, 16, &mvForw[1], 0);
    h263_Copy8x8HP_8u(pYr + 8*stepYr, stepYr, predMB + 8*16, 16, &mvForw[2], 0);
    h263_Copy8x8HP_8u(pYr + 8 + 8*stepYr, stepYr, predMB + 8 + 8*16, 16, &mvForw[3], 0);
  }
  h263_Copy8x8HP_8u(pCbr, stepCr, predMB + 4*64, 8, mvFCbCr, 0);
  h263_Copy8x8HP_8u(pCrr, stepCr, predMB + 5*64, 8, mvFCbCr, 0);

  pCur = pYc + H263_MV_OFF_HP(mvBack[0].dx, mvBack[0].dy, stepYc);
  pCbc += H263_MV_OFF_HP(mvBCbCr->dx, mvBCbCr->dy, stepCc);
  pCrc += H263_MV_OFF_HP(mvBCbCr->dx, mvBCbCr->dy, stepCc);

  mvx0 = (-mvBack[0].dx + 1) >> 1;
  mvx1 = 16 - ((mvBack[0].dx + 1) >> 1);
  mvy0 = (-mvBack[0].dy + 1) >> 1;
  mvy1 = 16 - ((mvBack[0].dy + 1) >> 1);

  xL = IPP_MAX(mvx0, 0);
  xR = IPP_MIN(mvx1, 8);
  roiSize.width = xR - xL;
  yT = IPP_MAX(mvy0, 0);
  yB = IPP_MIN(mvy1, 8);
  roiSize.height = yB - yT;
  h263_AddBackPredPB_8u(pCur + xL + yT*stepYc, stepYc, roiSize, predMB + xL + yT*16, 16, &mvBack[0]);

  if (!fourMVmode) {
    xL0 = xL;
    w0 = roiSize.width;
    xL = IPP_MAX(mvx0 - 8, 0);
    xR = IPP_MIN(mvx1 - 8, 8);
    roiSize.width = xR - xL;
    h263_AddBackPredPB_8u(pCur + 8 + xL + yT*stepYc, stepYc, roiSize, predMB + 8 + xL + yT*16, 16, &mvBack[0]);

    roiSize.width = w0;
    yT = IPP_MAX(mvy0 - 8, 0);
    yB = IPP_MIN(mvy1 - 8, 8);
    roiSize.height = yB - yT;
    h263_AddBackPredPB_8u(pCur + 8*stepYc + xL0 + yT*stepYc, stepYc, roiSize, predMB + 8*16 + xL0 + yT*16, 16, &mvBack[0]);

    roiSize.width = xR - xL;
    h263_AddBackPredPB_8u(pCur + 8*stepYc + 8 + xL + yT*stepYc, stepYc, roiSize, predMB + 8 + 8*16 + xL + yT*16, 16, &mvBack[0]);

  } else {
    Ipp32s i;
    for (i = 1; i < 4; i++) {
      mvx0 = ((-mvBack[i].dx + 1) >> 1) - (i & 1)*8;
      mvx1 = 16 - ((mvBack[i].dx + 1) >> 1) - (i & 1)*8;
      mvy0 = ((-mvBack[i].dy + 1) >> 1) - (i & 2)*4;
      mvy1 = 16 - ((mvBack[i].dy + 1) >> 1) - (i & 2)*4;

      xL = IPP_MAX(mvx0, 0);
      xR = IPP_MIN(mvx1, 8);
      roiSize.width = xR - xL;
      yT = IPP_MAX(mvy0, 0);
      yB = IPP_MIN(mvy1, 8);
      roiSize.height = yB - yT;

      pCur = pYc + H263_MV_OFF_HP(mvBack[i].dx, mvBack[i].dy, stepYc) + (i & 1)*8 + (i & 2)*4*stepYc + xL + yT*stepYc;

      h263_AddBackPredPB_8u(pCur, stepYc, roiSize, predMB + (i & 1)*8 + (i & 2)*4*16 + xL + yT*16, 16, &mvBack[i]);
    }
  }

  mvx0 = (-mvBCbCr->dx + 1) >> 1;
  mvx1 = 8 - ((mvBCbCr->dx + 1) >> 1);
  mvy0 = (-mvBCbCr->dy + 1) >> 1;
  mvy1 = 8 - ((mvBCbCr->dy + 1) >> 1);
  xL = IPP_MAX(mvx0, 0);
  xR = IPP_MIN(mvx1, 8);
  yT = IPP_MAX(mvy0, 0);
  yB = IPP_MIN(mvy1, 8);
  roiSize.width = xR - xL;
  roiSize.height = yB - yT;
  h263_AddBackPredPB_8u(pCbc + xL + yT*stepCc, stepCc, roiSize, predMB + 4*64 + xL + yT*8, 8, mvBCbCr);
  h263_AddBackPredPB_8u(pCrc + xL + yT*stepCc, stepCc, roiSize, predMB + 5*64 + xL + yT*8, 8, mvBCbCr);

  return H263_STATUS_OK;
}

/*
//  decode mcbpc and set MBtype and ChromaPattern
*/
h263_Status h263_DecodeMCBPC_P(h263_Info* pInfo, Ipp32s *mbType, Ipp32s *mbPattern, Ipp32s stat)
{
  Ipp32u      code;
  Ipp32s      type, pattern;

  code = h263_ShowBits9(pInfo, 9);
  if (code >= 256) {
    type = IPPVC_MBTYPE_INTER;
    pattern = 0;
    h263_FlushBits(pInfo, 1);
  } else if (code) {
    type = h263_Pmb_type[code];
    pattern = h263_Pmb_cbpc[code];
    h263_FlushBits(pInfo, h263_Pmb_bits[code]);
  } else {
    h263_FlushBits(pInfo, 9);
    code = h263_ShowBits9(pInfo, 4);
    if (code < 8) {
      h263_Error("Error when decoding mcbpc of P-Frame macroblock");
      return H263_STATUS_ERROR;
    } else if (code < 12) {
       pattern = 0;
       h263_FlushBits(pInfo, 2);
    } else {
      pattern = (code & 3) ? (code & 3) : 1;
      h263_FlushBits(pInfo, 4);
    }
    type = IPPVC_MBTYPE_INTER4V_Q;
  }
  *mbType = type;
  *mbPattern = pattern;
  if (stat) {
    if (type == IPPVC_MBTYPE_INTER)
      h263_StatisticInc_(&pInfo->VideoSequence.Statistic.nMB_INTER);
    else if (type == IPPVC_MBTYPE_INTER_Q)
      h263_StatisticInc_(&pInfo->VideoSequence.Statistic.nMB_INTER_Q);
    else if (type == IPPVC_MBTYPE_INTRA)
      h263_StatisticInc_(&pInfo->VideoSequence.Statistic.nMB_INTRA);
    else if (type == IPPVC_MBTYPE_INTRA_Q)
      h263_StatisticInc_(&pInfo->VideoSequence.Statistic.nMB_INTRA_Q);
    else if (type == IPPVC_MBTYPE_INTER4V)
      h263_StatisticInc_(&pInfo->VideoSequence.Statistic.nMB_INTER4V);
    else if (type == IPPVC_MBTYPE_INTER4V_Q)
      h263_StatisticInc_(&pInfo->VideoSequence.Statistic.nMB_INTER4V_Q);
  }
  return H263_STATUS_OK;
}

void h263_DecodeMODB_iPB(h263_Info* pInfo, Ipp32s *bmb_type, Ipp32s *cbpb, Ipp32s *mvdb)
{
  Ipp32u code;
  Ipp32s fbits;
  code = h263_ShowBits9(pInfo, 5);
  if (code < 24) {
    *bmb_type = IPPVC_MBTYPE_INTERPOLATE;
    *cbpb = code >> 4;
    fbits = 1 + *cbpb;
    h263_StatisticInc_(&pInfo->VideoSequence.Statistic.nMB_INTERPOLATE_iPB);
  } else if (code < 30) {
    *bmb_type = IPPVC_MBTYPE_FORWARD;
    *mvdb = 1;
    *cbpb = (code >> 2) & 1;
    fbits = 3 + *cbpb;
    h263_StatisticInc_(&pInfo->VideoSequence.Statistic.nMB_FORWARD_iPB);
  } else {
    *bmb_type = IPPVC_MBTYPE_BACKWARD;
    *cbpb = code & 1;
    fbits = 5;
    h263_StatisticInc_(&pInfo->VideoSequence.Statistic.nMB_BACKWARD_iPB);
  }
  h263_FlushBits(pInfo, fbits);
}

/*
//  decode mcbpc and set MBtype and ChromaPattern for EI-frames
*/
h263_Status h263_DecodeMCBPC_EI(h263_Info* pInfo, Ipp32s *mbType, Ipp32s *mbPattern)
{
  Ipp32u  code;
  Ipp32s  len;
  h263_VLC1 vlc;

  code = h263_ShowBits9(pInfo, 8);

  if (code >= 32) {
    code >>= 5;
    *mbType = IPPVC_MBTYPE_INTER; /* IPPVC_MBTYPE_INTER(_Q) is used for UPWARD prediction */
    *mbPattern = (code > 3) ? 0 : (code & 3);
    len = (code > 3) ? 1 : 3;
  } else if (code >= 16) {
    *mbType = IPPVC_MBTYPE_INTER_Q;
    *mbPattern = 0;
    len = 4;
  } else if (code != 0) {
    vlc = h263_EImb_type[code - 1];
    *mbType = vlc.code;
    len = vlc.len & 15;
    *mbPattern = vlc.len >> 4;
  } else {
    h263_FlushBits(pInfo, 8);
    if (h263_GetBit(pInfo) == 1) {
      *mbType = IPPVC_MB_STUFFING;
      return H263_STATUS_OK;
    } else {
      h263_Error("Error when decoding mcbpc of EI-Frame macroblock");
      return H263_STATUS_ERROR;
    }
  }
  h263_FlushBits(pInfo, len);

#ifdef H263_FULL_STAT
  if (*mbType == IPPVC_MBTYPE_INTER)
    h263_StatisticInc_(&pInfo->VideoSequence.Statistic.nMB_UPWARD_EI);
  else if (*mbType == IPPVC_MBTYPE_INTER_Q)
    h263_StatisticInc_(&pInfo->VideoSequence.Statistic.nMB_UPWARD_Q_EI);
  else if (*mbType == IPPVC_MBTYPE_INTRA)
    h263_StatisticInc_(&pInfo->VideoSequence.Statistic.nMB_INTRA_EI);
  else if (*mbType == IPPVC_MBTYPE_INTRA_Q)
    h263_StatisticInc_(&pInfo->VideoSequence.Statistic.nMB_INTRA_Q_EI);
#endif
  return H263_STATUS_OK;
}

/*
//  decode MBTYPE for B-frames
*/
h263_Status h263_DecodeMBTYPE_B(h263_Info* pInfo, Ipp32s *mbType, Ipp32s *cbp, Ipp32s *dquant)
{
  Ipp32u code;
  Ipp32s len;
  h263_VLC1 vlc;

  code = h263_ShowBits9(pInfo, 7);
  if (code == 0) {
    h263_FlushBits(pInfo, 7);
    if (h263_GetBits9(pInfo, 2) == 1) {
      *mbType = IPPVC_MB_STUFFING;
      return H263_STATUS_OK;
    } else {
      h263_Error("Error when decoding mcbpc of B-Frame macroblock");
      return H263_STATUS_ERROR;
    }
  } else if (code <= 3) {
    *dquant = (2 &~ code);
    *cbp = 1;
    *mbType = (code & 2) ? IPPVC_MBTYPE_INTRA : IPPVC_MBTYPE_INTRA_Q;
    h263_FlushBits(pInfo, 7 - (code >> 1));
#ifdef H263_FULL_STAT
    if (*mbType == IPPVC_MBTYPE_INTRA)
      h263_StatisticInc_(&pInfo->VideoSequence.Statistic.nMB_INTRA);
    else
      h263_StatisticInc_(&pInfo->VideoSequence.Statistic.nMB_INTRA_Q);
#endif
    return H263_STATUS_OK;
  }

  vlc = h263_Bmb_type[(code >> 2) - 1];
  *mbType = vlc.code;
  len = vlc.len & 15;
  *cbp = vlc.len & 0x10;
  *dquant = vlc.len & 0x20;

  h263_FlushBits(pInfo, len);

#ifdef H263_FULL_STAT
  if (*mbType == IPPVC_MBTYPE_DIRECT)
    h263_StatisticInc_(&pInfo->VideoSequence.Statistic.nMB_DIRECT_B);
  else if (*mbType == IPPVC_MBTYPE_INTERPOLATE)
    h263_StatisticInc_(&pInfo->VideoSequence.Statistic.nMB_INTERPOLATE_B);
  else if (*mbType == IPPVC_MBTYPE_BACKWARD)
    h263_StatisticInc_(&pInfo->VideoSequence.Statistic.nMB_BACKWARD_B);
  else if (*mbType == IPPVC_MBTYPE_FORWARD)
    h263_StatisticInc_(&pInfo->VideoSequence.Statistic.nMB_BACKWARD_B);
#endif
  return H263_STATUS_OK;
}

/*
//  decode MBTYPE for EP-frames
*/
h263_Status h263_DecodeMBTYPE_EP(h263_Info* pInfo, Ipp32s *mbType, Ipp32s *cbp, Ipp32s *dquant)
{
  Ipp32u code;
  Ipp32s len;
  h263_VLC1 vlc;

  code = h263_ShowBits9(pInfo, 8);
  if (code == 0) {
    h263_FlushBits(pInfo, 8);
    if (h263_GetBit(pInfo) == 1) {
      *mbType = IPPVC_MB_STUFFING;
      return H263_STATUS_OK;
    } else {
      h263_Error("Error when decoding mcbpc of EP-Frame macroblock");
      return H263_STATUS_ERROR;
    }
  } else if (code <= 3) {
    *mbType = (code & 2) ? IPPVC_MBTYPE_INTRA : IPPVC_MBTYPE_INTRA_Q;
    h263_FlushBits(pInfo, 8 - (code >> 1));
#ifdef H263_FULL_STAT
    if (*mbType == IPPVC_MBTYPE_INTRA)
      h263_StatisticInc_(&pInfo->VideoSequence.Statistic.nMB_INTRA);
    else
      h263_StatisticInc_(&pInfo->VideoSequence.Statistic.nMB_INTRA_Q);
#endif
    return H263_STATUS_OK;
  }
  code >>= 2;

  if (code < 8)
    vlc = h263_EPmb_type_0[code - 1];
  else
    vlc = h263_EPmb_type_1[(code >> 3) - 1];

  *mbType = vlc.code;
  len = vlc.len & 15;
  *cbp = vlc.len & 0x10;
  *dquant = vlc.len & 0x20;

  h263_FlushBits(pInfo, len);

#ifdef H263_FULL_STAT
  if (*mbType == IPPVC_MBTYPE_INTERPOLATE)
    h263_StatisticInc_(&pInfo->VideoSequence.Statistic.nMB_INTERPOLATE_EP);
  else if (*mbType == IPPVC_MBTYPE_BACKWARD)
    h263_StatisticInc_(&pInfo->VideoSequence.Statistic.nMB_UPWARD_EP);
  else if (*mbType == IPPVC_MBTYPE_FORWARD)
    h263_StatisticInc_(&pInfo->VideoSequence.Statistic.nMB_FORWARD_EP);
#endif
  return H263_STATUS_OK;
}

h263_Status h263_PredictDecode4MV(h263_Info *pInfo, h263_MacroBlock *MBcurr, Ipp32s frGOB, Ipp32s y, Ipp32s x)
{
  IppMotionVector *mvLeft, *mvTop, *mvRight, *mvCurr;
  h263_VideoPicture *VPic = &pInfo->VideoSequence.VideoPicture;
  Ipp32s mbInRow = VPic->MacroBlockPerRow;
  Ipp32s mvdx, mvdy;
  h263_Status status;
  Ipp32s noUMVplus = !VPic->oppmodes.UMV;
  Ipp32s noUMV = noUMVplus && !VPic->modes.UMV;

  mvCurr = MBcurr[0].mv;
  mvLeft  = MBcurr[-1].mv;
  mvTop   = MBcurr[-mbInRow].mv;
  mvRight = MBcurr[-mbInRow+1].mv;
  /* block 0 */
  if (y == frGOB && x == 0) {
    mvCurr[0].dx = mvCurr[0].dy = 0;
  } else if (x == 0) {
    mvCurr[0].dx = h263_Median(0, mvTop[2].dx, mvRight[2].dx);
    mvCurr[0].dy = h263_Median(0, mvTop[2].dy, mvRight[2].dy);
  } else if (y == frGOB) {
    mvCurr[0] = mvLeft[1];
  } else if (x == mbInRow - 1) {
    mvCurr[0].dx = h263_Median(0, mvLeft[1].dx, mvTop[2].dx);
    mvCurr[0].dy = h263_Median(0, mvLeft[1].dy, mvTop[2].dy);
  } else {
    mvCurr[0].dx = h263_Median(mvLeft[1].dx, mvTop[2].dx, mvRight[2].dx);
    mvCurr[0].dy = h263_Median(mvLeft[1].dy, mvTop[2].dy, mvRight[2].dy);
  }
  if (noUMV) {
    status = h263_DecodeMV(pInfo, &mvCurr[0], -32, 31);
  } else if (noUMVplus) {
    status = h263_DecodeMV(pInfo, &mvCurr[0], -63, 63);
  } else {
    status = h263_DecodeMVD_umvplus(pInfo, &mvdx, &mvdy);
    mvCurr[0].dx = mvCurr[0].dx + (Ipp16s)mvdx;
    mvCurr[0].dy = mvCurr[0].dy + (Ipp16s)mvdy;
  }
  if (status != H263_STATUS_OK)
    return status;

  /* block 1 */
  if (y == frGOB) {
    mvCurr[1] = mvCurr[0];
  } else if (x == mbInRow - 1) {
    mvCurr[1].dx = h263_Median(mvCurr[0].dx, mvTop[3].dx, 0);
    mvCurr[1].dy = h263_Median(mvCurr[0].dy, mvTop[3].dy, 0);
  } else {
    mvCurr[1].dx = h263_Median(mvCurr[0].dx, mvTop[3].dx, mvRight[2].dx);
    mvCurr[1].dy = h263_Median(mvCurr[0].dy, mvTop[3].dy, mvRight[2].dy);
  }
  if (noUMV) {
    status = h263_DecodeMV(pInfo, &mvCurr[1], -32, 31);
  } else if (noUMVplus) {
    status = h263_DecodeMV(pInfo, &mvCurr[1], -63, 63);
  } else {
    status = h263_DecodeMVD_umvplus(pInfo, &mvdx, &mvdy);
    mvCurr[1].dx = mvCurr[1].dx + (Ipp16s)mvdx;
    mvCurr[1].dy = mvCurr[1].dy + (Ipp16s)mvdy;
  }
  if (status != H263_STATUS_OK)
    return status;

  /* block 2 */
  if (x == 0) {
    mvCurr[2].dx = h263_Median(0, mvCurr[0].dx, mvCurr[1].dx);
    mvCurr[2].dy = h263_Median(0, mvCurr[0].dy, mvCurr[1].dy);
  } else {
    mvCurr[2].dx = h263_Median(mvLeft[3].dx, mvCurr[0].dx, mvCurr[1].dx);
    mvCurr[2].dy = h263_Median(mvLeft[3].dy, mvCurr[0].dy, mvCurr[1].dy);
  }
  if (noUMV) {
    status = h263_DecodeMV(pInfo, &mvCurr[2], -32, 31);
  } else if (noUMVplus) {
    status = h263_DecodeMV(pInfo, &mvCurr[2], -63, 63);
  } else {
    status = h263_DecodeMVD_umvplus(pInfo, &mvdx, &mvdy);
    mvCurr[2].dx = mvCurr[2].dx + (Ipp16s)mvdx;
    mvCurr[2].dy = mvCurr[2].dy + (Ipp16s)mvdy;
  }
  if (status != H263_STATUS_OK)
    return status;

  /* block 3 */
  mvCurr[3].dx = h263_Median(mvCurr[2].dx, mvCurr[0].dx, mvCurr[1].dx);
  mvCurr[3].dy = h263_Median(mvCurr[2].dy, mvCurr[0].dy, mvCurr[1].dy);
  if (noUMV) {
    status = h263_DecodeMV(pInfo, &mvCurr[3], -32, 31);
  } else if (noUMVplus) {
    status = h263_DecodeMV(pInfo, &mvCurr[3], -63, 63);
  } else {
    status = h263_DecodeMVD_umvplus(pInfo, &mvdx, &mvdy);
    mvCurr[3].dx = mvCurr[3].dx + (Ipp16s)mvdx;
    mvCurr[3].dy = mvCurr[3].dy + (Ipp16s)mvdy;
  }
  if (status != H263_STATUS_OK)
    return status;

  return H263_STATUS_OK;
}

void h263_OBMC(h263_Info *pInfo, h263_MacroBlock *pMBinfo, IppMotionVector *mvCur, Ipp32s colNum, Ipp32s rowNum, IppiRect limitRectL, Ipp8u *pYc, Ipp32s stepYc, Ipp8u *pYr, Ipp32s stepYr, Ipp32s cbpy, Ipp16s *coeffMB)
{
  IppMotionVector mvOBMCL, mvOBMCU, mvOBMCR, mvOBMCB, *mvLeft, *mvUpper, *mvRight;
  h263_VideoPicture *VPic = &pInfo->VideoSequence.VideoPicture;
  Ipp32s mbPerRow = VPic->MacroBlockPerRow, dx, dy, rt;

  /* get Right MV */
  if (colNum == mbPerRow - 1)
    mvRight = &mvCur[1];
  else if ((pMBinfo[1].type & 0xC0) == 0x80) /* INTRA(_Q), no vector for B-part */
    mvRight = &mvCur[1];
  else
    mvRight = pMBinfo[1].mv;
  /* get Left MV */
  if (colNum == 0)
    mvLeft = mvCur - 1;
  else if ((pMBinfo[-1].type & 0xC0) == 0x80)
    mvLeft = mvCur - 1;
  else
    mvLeft = pMBinfo[-1].mv;
  /* get Upper MV */
  if (rowNum == 0)
    mvUpper = mvCur - 2;
  else if ((pMBinfo[-mbPerRow].type & 0xC0) == 0x80)
    mvUpper = mvCur - 2;
  else
    mvUpper = pMBinfo[-mbPerRow].mv;

  dx = colNum * 16;
  dy = rowNum * 16;
  rt = VPic->rtype;

  h263_LimitMV(&mvLeft[1], &mvOBMCL, &limitRectL, dx, dy, 8);
  h263_LimitMV(&mvUpper[2], &mvOBMCU, &limitRectL, dx, dy, 8);
  h263_LimitMV(&mvCur[1], &mvOBMCR, &limitRectL, dx, dy, 8);
  h263_LimitMV(&mvCur[2], &mvOBMCB, &limitRectL, dx, dy, 8);
  ippiOBMC8x8HP_MPEG4_8u_C1R(pYr, stepYr, pYc, stepYc, &mvCur[0], &mvOBMCL, &mvOBMCR, &mvOBMCU, &mvOBMCB, rt);
  h263_LimitMV(&mvCur[0], &mvOBMCL, &limitRectL, dx+8, dy, 8);
  h263_LimitMV(&mvUpper[3], &mvOBMCU, &limitRectL, dx+8, dy, 8);
  h263_LimitMV(&mvRight[0], &mvOBMCR, &limitRectL, dx+8, dy, 8);
  h263_LimitMV(&mvCur[3], &mvOBMCB, &limitRectL, dx+8, dy, 8);
  ippiOBMC8x8HP_MPEG4_8u_C1R(pYr+8, stepYr, pYc+8, stepYc, &mvCur[1], &mvOBMCL, &mvOBMCR, &mvOBMCU, &mvOBMCB, rt);
  h263_LimitMV(&mvLeft[3], &mvOBMCL, &limitRectL, dx, dy+8, 8);
  h263_LimitMV(&mvCur[0], &mvOBMCU, &limitRectL, dx, dy+8, 8);
  h263_LimitMV(&mvCur[3], &mvOBMCR, &limitRectL, dx, dy+8, 8);
  ippiOBMC8x8HP_MPEG4_8u_C1R(pYr+stepYr*8, stepYr, pYc+stepYc*8, stepYc, &mvCur[2], &mvOBMCL, &mvOBMCR, &mvOBMCU, &mvCur[2], rt);
  h263_LimitMV(&mvCur[2], &mvOBMCL, &limitRectL, dx+8, dy+8, 8);
  h263_LimitMV(&mvCur[1], &mvOBMCU, &limitRectL, dx+8, dy+8, 8);
  h263_LimitMV(&mvRight[2], &mvOBMCR, &limitRectL, dx+8, dy+8, 8);
  ippiOBMC8x8HP_MPEG4_8u_C1R(pYr+8+stepYr*8, stepYr, pYc+8+stepYc*8, stepYc, &mvCur[3], &mvOBMCL, &mvOBMCR, &mvOBMCU, &mvCur[3], rt);

  h263_AddResidual(cbpy & 8, pYc, stepYc, coeffMB);
  h263_AddResidual(cbpy & 4, pYc+8, stepYc, coeffMB+64);
  h263_AddResidual(cbpy & 2, pYc+stepYc*8, stepYc, coeffMB+128);
  h263_AddResidual(cbpy & 1, pYc+stepYc*8+8, stepYc, coeffMB+192);
}

Ipp32s h263_UpdateQuant_Mod(h263_Info *pInfo)
{
  h263_VideoPicture *VPic = &pInfo->VideoSequence.VideoPicture;
  Ipp32s quant = VPic->pic_quant;
  Ipp32s dquant, quant_c;
  Ipp32u code;

  code = h263_ShowBits9(pInfo, 6);
  if (code >= 32) {
    dquant = (code >> 4) & 1;
    VPic->pic_quant = h263_dquant_Mod[dquant][quant - 1];
    h263_FlushBits(pInfo, 2);
  } else {
    VPic->pic_quant = code;
    h263_FlushBits(pInfo, 6);
  }

  quant_c = h263_quant_c[VPic->pic_quant];

  return quant_c;
}

/* intra-macroblock horizontal boundaries are processed in h263_DecodeFrame_P() */
void h263_DeblockingFilter_P(h263_Info *pInfo, h263_Frame *frame)
{
  Ipp8u *pYc, *pCbc, *pCrc;
  Ipp32s stepYc, stepCbc, stepCrc, mbPerRow, mbPerCol;
  h263_MacroBlock *pMBinfo;
  Ipp32s quant, quant_c;
  Ipp32s i, j;
  h263_VideoPicture *VPic = &pInfo->VideoSequence.VideoPicture;

  stepYc = frame->stepY;
  stepCbc = frame->stepCb;
  stepCrc = frame->stepCr;
  mbPerRow = frame->mbPerRow;
  mbPerCol = frame->mbPerCol;

  /* Horizontal */
  for (i = 1; i < mbPerCol; i++) {
    if (pInfo->VideoSequence.GOBboundary[i] > 0)
      continue; /* no filtering across GOB boundaries */
    pYc = frame->pY + (stepYc << 4)*i;
    pCbc = frame->pCb + (stepCbc << 3)*i;
    pCrc = frame->pCr + (stepCrc << 3)*i;
    pMBinfo = pInfo->VideoSequence.MBinfo + mbPerRow*i;

    for (j = 0; j < mbPerRow; j++) {
      if (pMBinfo[j].type != IPPVC_MB_STUFFING) {
        quant = pMBinfo[j].quant;
        quant_c = VPic->oppmodes.modQuant ? h263_quant_c[quant] : quant;
        H263_MB_HOR_DEBLOCKING(pYc, stepYc, pCbc, stepCbc, pCrc, stepCrc, quant, quant_c);
      } else if (pMBinfo[j-mbPerRow].type != IPPVC_MB_STUFFING) {
        quant = pMBinfo[j-mbPerRow].quant;
        quant_c = VPic->oppmodes.modQuant ? h263_quant_c[quant] : quant;
        H263_MB_HOR_DEBLOCKING(pYc, stepYc, pCbc, stepCbc, pCrc, stepCrc, quant, quant_c);
      }
      pYc += 16;
      pCbc += 8;
      pCrc += 8;
    }
  }

  /* Vertical */
  for (i = 0; i < mbPerCol; i++) {
    if (pInfo->VideoSequence.GOBboundary[i] > 1)
      continue; /* the row belongs to a skipped GOB */
    pYc = frame->pY + (stepYc << 4)*i;
    pCbc = frame->pCb + (stepCbc << 3)*i;
    pCrc = frame->pCr + (stepCrc << 3)*i;
    pMBinfo = pInfo->VideoSequence.MBinfo + mbPerRow*i;

    if (pMBinfo[0].type != IPPVC_MB_STUFFING) {
      H263_MB_INTERNAL_VER_DEBLOCKING_LUM(pYc, stepYc, quant);
    }
    for (j = 1; j < mbPerRow; j++) {
      pYc += 16;
      pCbc += 8;
      pCrc += 8;
      if (pMBinfo[j].type != IPPVC_MB_STUFFING) {
        quant = pMBinfo[j].quant;
        quant_c = VPic->oppmodes.modQuant ? h263_quant_c[quant] : quant;
        H263_MB_VER_DEBLOCKING(pYc, stepYc, pCbc, stepCbc, pCrc, stepCrc, quant, quant_c);
        H263_MB_INTERNAL_VER_DEBLOCKING_LUM(pYc, stepYc, quant);
      } else if (pMBinfo[j-1].type != IPPVC_MB_STUFFING) {
        quant = pMBinfo[j-1].quant;
        quant_c = VPic->oppmodes.modQuant ? h263_quant_c[quant] : quant;
        H263_MB_VER_DEBLOCKING(pYc, stepYc, pCbc, stepCbc, pCrc, stepCrc, quant, quant_c);
      }
    }
  }
}

void h263_DeblockingFilter_I(h263_Info *pInfo, h263_Frame *frame)
{
  Ipp8u *pYc, *pCbc, *pCrc;
  Ipp32s stepYc, stepCbc, stepCrc, mbPerRow, mbPerCol;
  h263_MacroBlock *pMBinfo;
  Ipp32s quant, quant_c;
  Ipp32s i, j;
  h263_VideoPicture *VPic = &pInfo->VideoSequence.VideoPicture;
  Ipp32s modQ = VPic->oppmodes.modQuant;

  stepYc = frame->stepY;
  stepCbc = frame->stepCb;
  stepCrc = frame->stepCr;
  mbPerRow = frame->mbPerRow;
  mbPerCol = frame->mbPerCol;

  for (i = 1; i < mbPerCol; i++) {
    pYc = frame->pY + (stepYc << 4)*i;
    pCbc = frame->pCb + (stepCbc << 3)*i;
    pCrc = frame->pCr + (stepCrc << 3)*i;
    pMBinfo = pInfo->VideoSequence.MBinfo + mbPerRow*i;
    if (pInfo->VideoSequence.GOBboundary[i] > 0) {
      if (pInfo->VideoSequence.GOBboundary[i] > 1) {
        continue; /* the row belongs to a skipped GOB */
      } else { /* no horizontal filtering across GOB boundary */
        quant = pMBinfo[-mbPerRow].quant;
        H263_MB_INTERNAL_VER_DEBLOCKING_LUM(pYc-16*stepYc, stepYc, quant);
        for (j = 1; j < mbPerRow; j++) {
          pYc += 16;
          pCbc += 8;
          pCrc += 8;
          quant = pMBinfo[j-mbPerRow].quant;
          quant_c = modQ ? h263_quant_c[quant] : quant;
          H263_MB_VER_DEBLOCKING(pYc-16*stepYc, stepYc, pCbc-8*stepCbc, stepCbc, pCrc-8*stepCrc, stepCrc, quant, quant_c);
          H263_MB_INTERNAL_VER_DEBLOCKING_LUM(pYc - 16*stepYc, stepYc, quant);
        }
      }
    } else {
      quant = pMBinfo[0].quant;
      quant_c = modQ ? h263_quant_c[quant] : quant;
      H263_MB_HOR_DEBLOCKING(pYc, stepYc, pCbc, stepCbc, pCrc, stepCrc, quant, quant_c);
      H263_MB_INTERNAL_VER_DEBLOCKING_LUM(pYc - 16*stepYc, stepYc, pMBinfo[-mbPerRow].quant);

      for (j = 1; j < mbPerRow; j++) {
        pYc += 16;
        pCbc += 8;
        pCrc += 8;

        quant = pMBinfo[j].quant;
        quant_c = modQ ? h263_quant_c[quant] : quant;
        H263_MB_HOR_DEBLOCKING(pYc, stepYc, pCbc, stepCbc, pCrc, stepCrc, quant, quant_c);

        quant = pMBinfo[j-mbPerRow].quant;
        quant_c = modQ ? h263_quant_c[quant] : quant;

        H263_MB_VER_DEBLOCKING(pYc-16*stepYc, stepYc, pCbc-8*stepCbc, stepCbc, pCrc-8*stepCrc, stepCrc, quant, quant_c);
        H263_MB_INTERNAL_VER_DEBLOCKING_LUM(pYc - 16*stepYc, stepYc, quant);
      }
    }
  }

  pYc = frame->pY + (stepYc << 4)*(mbPerCol - 1);
  pCbc = frame->pCb + (stepCbc << 3)*(mbPerCol - 1);
  pCrc = frame->pCr + (stepCrc << 3)*(mbPerCol - 1);
  pMBinfo = pInfo->VideoSequence.MBinfo + mbPerRow*(mbPerCol - 1);

  quant = pMBinfo[0].quant;
  quant_c = modQ ? h263_quant_c[quant] : quant;
  H263_MB_INTERNAL_VER_DEBLOCKING_LUM(pYc, stepYc, quant);

  for (j = 1; j < mbPerRow; j++) {
    pYc += 16;
    pCbc += 8;
    pCrc += 8;
    quant = pMBinfo[j].quant;
    quant_c = modQ ? h263_quant_c[quant] : quant;
    H263_MB_VER_DEBLOCKING(pYc, stepYc, pCbc, stepCbc, pCrc, stepCrc, quant, quant_c);
    H263_MB_INTERNAL_VER_DEBLOCKING_LUM(pYc, stepYc, quant);
  }
}

#ifdef _OMP_KARABAS

Ipp32s h263_GetNumOfThreads(void)
{
    Ipp32s maxThreads = 1;
#ifdef _OPENMP
#pragma omp parallel shared(maxThreads)
#endif
    {
#ifdef _OPENMP
#pragma omp master
#endif
    {
#ifdef _OPENMP
        maxThreads = omp_get_num_threads();
#endif
    }
    }
    return maxThreads;
}

h263_Status h263_DecodeDequantMacroBlockIntra(h263_Info *pInfo, Ipp32s x, Ipp32s pat, Ipp32s quant, Ipp32s quant_c,
                                              Ipp32s scan, Ipp16s *coeffMB, Ipp8u lastNZ[])
{
  Ipp16s *coeff = coeffMB;
  Ipp32s blockNum, pm = 32, lnz, dc, ac, k, nz;
  Ipp16s *predC, *predA;
  h263_IntraPredBlock *bCurr;
  Ipp32s modQ = pInfo->VideoSequence.VideoPicture.oppmodes.modQuant;
  Ipp32s advI = pInfo->VideoSequence.VideoPicture.oppmodes.advIntra;

  if (!advI) {
    for (blockNum = 0; blockNum < 6; blockNum++) {
      if (blockNum > 3)
        quant = quant_c;
      if (ippiReconstructCoeffsIntra_H263_1u16s(&pInfo->bufptr, &pInfo->bitoff, coeff, &lnz, pat & pm, quant, 0, IPPVC_SCAN_ZIGZAG, modQ) != ippStsNoErr) {
        return H263_STATUS_ERROR;
      }
      if (lnz > 0) {
        h263_StatisticInc_(&pInfo->VideoSequence.Statistic.nB_INTRA_AC);
      } else {
        h263_StatisticInc_(&pInfo->VideoSequence.Statistic.nB_INTRA_DC);
      }
      pm >>= 1;
      lastNZ[blockNum] = lnz;
      coeff += 64;
    }
    return H263_STATUS_OK;
  }

  /* Advance Intra Coding */

  for (blockNum = 0; blockNum < 6; blockNum ++) {
    bCurr = &pInfo->VideoSequence.IntraPredBuff.block[6*x+blockNum];
    if (blockNum > 3)
      quant = quant_c;
    if (pat & pm) {
      if (ippiReconstructCoeffsIntra_H263_1u16s(&pInfo->bufptr, &pInfo->bitoff, coeff, &lnz, pat & pm, quant, 1, scan, modQ) != ippStsNoErr)
        return H263_STATUS_ERROR;
      if (lnz) {
        h263_StatisticInc_(&pInfo->VideoSequence.Statistic.nB_INTRA_AC);
      } else {
        h263_StatisticInc_(&pInfo->VideoSequence.Statistic.nB_INTRA_DC);
      }
    } else {
      if (scan != IPPVC_SCAN_ZIGZAG) {
        h263_Zero64_16s(coeff);
      } else
        coeff[0] = 0;
      lnz = 0;
    }

    nz = 0;
    if (scan == IPPVC_SCAN_ZIGZAG) {
      if (bCurr->predA->dct_dc >= 0) {
        dc = bCurr->predA->dct_dc;
        dc = bCurr->predC->dct_dc >= 0 ? ((dc + bCurr->predC->dct_dc) >> 1) : dc;
      } else
        dc = bCurr->predC->dct_dc >= 0 ? bCurr->predC->dct_dc : 1024;
      if (lnz && ((quant > 8) || modQ)) { /* ??? */
        for (k = 1; k < 64; k ++) {
          h263_CLIP(coeff[k], -2048, 2047);
        }
      }
    } else if (scan == IPPVC_SCAN_HORIZONTAL) {
      if (bCurr->predC->dct_dc >= 0) {
        dc = bCurr->predC->dct_dc;
        predC = bCurr->predC->dct_acC;
        for (k = 1; k < 8; k ++) {
          ac = coeff[k] + predC[k];
          h263_CLIP(ac, -2048, 2047); /* ??? */
          coeff[k] = (Ipp16s)ac;
          if (ac)
            nz = 1;
        }
        if ((lnz > 7) && ((quant > 8) || modQ)) { /* ??? */
          for (k = 8; k < 64; k ++) {
            h263_CLIP(coeff[k], -2048, 2047);
          }
        }
      } else {
        dc = 1024;
        if (lnz && ((quant > 8) || modQ)) { /* ??? */
          for (k = 1; k < 64; k ++) {
            h263_CLIP(coeff[k], -2048, 2047);
          }
        }
      }
    } else { /* scan == IPPVC_SCAN_VERTICAL */
      if (bCurr->predA->dct_dc >= 0) {
        dc = bCurr->predA->dct_dc;
        predA = bCurr->predA->dct_acA;
        for (k = 1; k < 8; k ++) {
          ac = coeff[k*8] + predA[k];
          h263_CLIP(ac, -2048, 2047); /* ??? */
          coeff[k*8] = (Ipp16s)ac;
          if (ac)
            nz = 1;
        }
      } else
        dc = 1024;
      if (lnz && ((quant > 8) || modQ)) { /* ??? */
        for (k = 1; k < 64; k ++) {
          h263_CLIP(coeff[k], -2048, 2047);
        }
      }
    }
    dc += coeff[0];
    dc |= 1; /* oddify */
    h263_CLIP(dc, 0, 2047); /* ??? h263_CLIPR(dc, 2047); */
    coeff[0] = (Ipp16s)dc;

    if (nz)
      lnz = 63;

    if (lnz) {
      /* copy predicted coeffs for future Prediction */
      for (k = 1; k < 8; k ++) {
        bCurr[6].dct_acC[k] = coeff[k];
        bCurr[6].dct_acA[k] = coeff[k*8];
      }
    } else {
      for (k = 1; k < 8; k ++) {
        bCurr[6].dct_acC[k] = bCurr[6].dct_acA[k] = 0;
      }
    }

    bCurr[6].dct_dc = coeff[0];
    pm >>= 1;
    lastNZ[blockNum] = (Ipp8u)lnz;
    coeff += 64;
  }
  return H263_STATUS_OK;
}

h263_Status h263_DecodeDequantMacroBlockInter(h263_Info *pInfo, Ipp32s pat, Ipp32s quant, Ipp32s quant_c,
                                              Ipp16s *coeffMB, Ipp8u lastNZ[])
{
  Ipp32s i, lnz, pm = 32;
  Ipp16s *coeff = coeffMB;
  Ipp32s modQ = pInfo->VideoSequence.VideoPicture.oppmodes.modQuant;
  Ipp32s altInterVLC = pInfo->VideoSequence.VideoPicture.oppmodes.altInterVLC;

  for (i = 0; i < 6; i ++) {
    if (i > 3)
      quant = quant_c;
    if (pat & pm) {
      if (!altInterVLC) {
        if (ippiReconstructCoeffsInter_H263_1u16s(&pInfo->bufptr, &pInfo->bitoff, coeff, &lnz, quant, modQ) != ippStsNoErr)
          return H263_STATUS_ERROR;
      } else {
        __ALIGN16(Ipp16s, coeffZ, 64);
        if (ippiDecodeCoeffsInter_H263_1u16s(&pInfo->bufptr, &pInfo->bitoff, coeffZ, &lnz, modQ, IPPVC_SCAN_NONE) != ippStsNoErr)
          if (ippiDecodeCoeffsIntra_H263_1u16s(&pInfo->bufptr, &pInfo->bitoff, coeffZ, &lnz, 1, modQ, IPPVC_SCAN_NONE) != ippStsNoErr)
            return H263_STATUS_ERROR;
        ippiQuantInvInter_H263_16s_C1I(coeffZ, lnz, quant, modQ);
        ippiScanInv_16s_C1(coeffZ, coeff, lnz, IPPVC_SCAN_ZIGZAG);
      }
      h263_StatisticInc_(&pInfo->VideoSequence.Statistic.nB_INTER_C);
    } else {
      h263_StatisticInc_(&pInfo->VideoSequence.Statistic.nB_INTER_NC);
    }
    pm >>= 1;
    lastNZ[i] = (Ipp8u)lnz;
    coeff += 64;
  }
  return H263_STATUS_OK;
}

void h263_DCT_MacroBlockInter(Ipp16s *coeffMB, Ipp8u lastNZ[], Ipp32s pat)
{
  Ipp32s i, lnz, pm = 32;
  Ipp16s *coeff = coeffMB;

  for (i = 0; i < 6; i ++) {
    if ((pat) & pm) {
      lnz = lastNZ[i];
      if (lnz != 0) {
        if ((lnz <= 4) && (coeff[16] == 0))
            ippiDCT8x8Inv_2x2_16s_C1I(coeff);
        else if ((lnz <= 13) && (coeff[32] == 0))
            ippiDCT8x8Inv_4x4_16s_C1I(coeff);
        else
            ippiDCT8x8Inv_16s_C1I(coeff);
      } else
        h263_Set64_16s((Ipp16s)((coeff[0] + 4) >> 3), coeff);
    }
    pm >>= 1;
    coeff += 64;
  }
}

void h263_DeblockingFilterHor_P_MT(h263_Info *pInfo, Ipp32s curRow)
{
  Ipp8u *pYc, *pCbc, *pCrc;
  Ipp32s stepYc, stepCbc, stepCrc, mbPerRow;
  h263_MacroBlock *pMBinfo;
  Ipp32s quant, quant_c;
  Ipp32s j;
  h263_VideoPicture *VPic = &pInfo->VideoSequence.VideoPicture;

  if (pInfo->VideoSequence.GOBboundary[curRow] > 0)
    return; /* no filtering across GOB boundaries */

  mbPerRow = VPic->MacroBlockPerRow;
  stepYc = pInfo->VideoSequence.cFrame.stepY;
  stepCbc = pInfo->VideoSequence.cFrame.stepCb;
  stepCrc = pInfo->VideoSequence.cFrame.stepCr;
  pYc = pInfo->VideoSequence.cFrame.pY + curRow*16*stepYc;
  pCbc = pInfo->VideoSequence.cFrame.pCb + curRow*8*stepCbc;
  pCrc = pInfo->VideoSequence.cFrame.pCr + curRow*8*stepCrc;
  pMBinfo = pInfo->VideoSequence.MBinfo + curRow * mbPerRow;

  for (j = 0; j < mbPerRow; j++) {
    if (pMBinfo[j].type != IPPVC_MB_STUFFING) {
      quant = pMBinfo[j].quant;
      quant_c = VPic->oppmodes.modQuant ? h263_quant_c[quant] : quant;
      H263_MB_HOR_DEBLOCKING(pYc, stepYc, pCbc, stepCbc, pCrc, stepCrc, quant, quant_c);
    } else if (pMBinfo[j-mbPerRow].type != IPPVC_MB_STUFFING) {
      quant = pMBinfo[j-mbPerRow].quant;
      quant_c = VPic->oppmodes.modQuant ? h263_quant_c[quant] : quant;
      H263_MB_HOR_DEBLOCKING(pYc, stepYc, pCbc, stepCbc, pCrc, stepCrc, quant, quant_c);
    }
    pYc += 16;
    pCbc += 8;
    pCrc += 8;
  }
}

void h263_DeblockingFilterVer_P_MT(h263_Info *pInfo, Ipp32s curRow)
{
  Ipp8u *pYc, *pCbc, *pCrc;
  Ipp32s stepYc, stepCbc, stepCrc, mbPerRow;
  h263_MacroBlock *pMBinfo;
  Ipp32s quant, quant_c;
  Ipp32s j;
  h263_VideoPicture *VPic = &pInfo->VideoSequence.VideoPicture;

  mbPerRow = VPic->MacroBlockPerRow;
  stepYc = pInfo->VideoSequence.cFrame.stepY;
  stepCbc = pInfo->VideoSequence.cFrame.stepCb;
  stepCrc = pInfo->VideoSequence.cFrame.stepCr;
  pYc = pInfo->VideoSequence.cFrame.pY + curRow*16*stepYc;
  pCbc = pInfo->VideoSequence.cFrame.pCb + curRow*8*stepCbc;
  pCrc = pInfo->VideoSequence.cFrame.pCr + curRow*8*stepCrc;
  pMBinfo = pInfo->VideoSequence.MBinfo + curRow * mbPerRow;

  if (pMBinfo[0].type != IPPVC_MB_STUFFING) {
    quant = pMBinfo[0].quant;
    H263_MB_INTERNAL_VER_DEBLOCKING_LUM(pYc, stepYc, quant);
  }
  for (j = 1; j < mbPerRow; j++) {
    pYc += 16;
    pCbc += 8;
    pCrc += 8;
    if (pMBinfo[j].type != IPPVC_MB_STUFFING) {
      quant = pMBinfo[j].quant;
      quant_c = VPic->oppmodes.modQuant ? h263_quant_c[quant] : quant;
      H263_MB_VER_DEBLOCKING(pYc, stepYc, pCbc, stepCbc, pCrc, stepCrc, quant, quant_c);
      H263_MB_INTERNAL_VER_DEBLOCKING_LUM(pYc, stepYc, quant);
    } else if (pMBinfo[j-1].type != IPPVC_MB_STUFFING) {
      quant = pMBinfo[j-1].quant;
      quant_c = VPic->oppmodes.modQuant ? h263_quant_c[quant] : quant;
      H263_MB_VER_DEBLOCKING(pYc, stepYc, pCbc, stepCbc, pCrc, stepCrc, quant, quant_c);
    }
  }
}

void h263_DeblockingFilterHor_I_MT(h263_Info *pInfo, Ipp32s curRow)
{
  Ipp8u *pYc, *pCbc, *pCrc;
  Ipp32s stepYc, stepCbc, stepCrc, mbPerRow;
  h263_MacroBlock *pMBinfo;
  Ipp32s quant, quant_c;
  Ipp32s j;
  h263_VideoPicture *VPic = &pInfo->VideoSequence.VideoPicture;

  if (pInfo->VideoSequence.GOBboundary[curRow] > 0)
    return; /* no filtering across GOB boundaries */

  mbPerRow = VPic->MacroBlockPerRow;
  stepYc = pInfo->VideoSequence.cFrame.stepY;
  stepCbc = pInfo->VideoSequence.cFrame.stepCb;
  stepCrc = pInfo->VideoSequence.cFrame.stepCr;
  pYc = pInfo->VideoSequence.cFrame.pY + curRow*16*stepYc;
  pCbc = pInfo->VideoSequence.cFrame.pCb + curRow*8*stepCbc;
  pCrc = pInfo->VideoSequence.cFrame.pCr + curRow*8*stepCrc;
  pMBinfo = pInfo->VideoSequence.MBinfo + curRow * mbPerRow;

  for (j = 0; j < mbPerRow; j++) {
    quant = pMBinfo[j].quant;
    quant_c = VPic->oppmodes.modQuant ? h263_quant_c[quant] : quant;
    H263_MB_HOR_DEBLOCKING(pYc, stepYc, pCbc, stepCbc, pCrc, stepCrc, quant, quant_c);
    pYc += 16;
    pCbc += 8;
    pCrc += 8;
  }
}

void h263_DeblockingFilterVer_I_MT(h263_Info *pInfo, Ipp32s curRow)
{
  Ipp8u *pYc, *pCbc, *pCrc;
  Ipp32s stepYc, stepCbc, stepCrc, mbPerRow;
  h263_MacroBlock *pMBinfo;
  Ipp32s quant, quant_c;
  Ipp32s j;
  h263_VideoPicture *VPic = &pInfo->VideoSequence.VideoPicture;

  mbPerRow = VPic->MacroBlockPerRow;
  stepYc = pInfo->VideoSequence.cFrame.stepY;
  stepCbc = pInfo->VideoSequence.cFrame.stepCb;
  stepCrc = pInfo->VideoSequence.cFrame.stepCr;
  pYc = pInfo->VideoSequence.cFrame.pY + curRow*16*stepYc;
  pCbc = pInfo->VideoSequence.cFrame.pCb + curRow*8*stepCbc;
  pCrc = pInfo->VideoSequence.cFrame.pCr + curRow*8*stepCrc;
  pMBinfo = pInfo->VideoSequence.MBinfo + curRow * mbPerRow;

  quant = pMBinfo[0].quant;
  H263_MB_INTERNAL_VER_DEBLOCKING_LUM(pYc, stepYc, quant);

  for (j = 1; j < mbPerRow; j++) {
    pYc += 16;
    pCbc += 8;
    pCrc += 8;
    quant = pMBinfo[j].quant;
    quant_c = VPic->oppmodes.modQuant ? h263_quant_c[quant] : quant;
    H263_MB_VER_DEBLOCKING(pYc, stepYc, pCbc, stepCbc, pCrc, stepCrc, quant, quant_c);
    H263_MB_INTERNAL_VER_DEBLOCKING_LUM(pYc, stepYc, quant);
  }
}

#endif // _OMP_KARABAS
