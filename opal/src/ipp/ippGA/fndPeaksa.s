        .text
        .align  4
        .globl  _ippsFindPeaks_32s8u


LAAD_fndPeaksa:
_ippsFindPeaks_32s8u:
        stmdb   sp!, {r4 - r11, lr}
        ldr     r4, [sp, #0x24]
        cmp     r2, #1
        bne     LAAD_Len_NOT_EQ_1
        strb    r2, [r1]
        mov     r0, #0
LAAD_ippsFindPeaks_32s8u_Quit:
        ldmia   sp!, {r4 - r11, pc}
LAAD_Len_NOT_EQ_1:
        sub     r2, r2, #1
        cmp     r4, r2
        blt     LAAD_MovingAvgSize_LT_Len_1
LAAD_MovingAvgSize_GE_Len_1:
        mov     r5, #0
        add     r6, r1, r2
LAAD_FillZero_Loop:
        cmp     r1, r6
        strb    r5, [r6], #-1
        bne     LAAD_FillZero_Loop
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LAAD_MovingAvgSize_LT_Len_1:
        cmp     r4, #0
        bne     LAAD_MovingAvgSize_NOT_EQ_0
LAAD_MovingAvgSize_EQ_0:
        add     r8, r0, r2, lsl #2
        ldr     r5, [r0], #4
        ldr     r6, [r0], #4
        mov     r11, #0
        mov     r12, r1
        cmp     r3, r2
        bge     LAAD_MovingAvgSize_EQ_0_searchSize_GE_Len_1
        mov     r9, #0
        sub     r4, r8, r3, lsl #2
        add     r4, r4, #8
LAAD_MovingAvgSize_EQ_0_FindFirstPeak_Loop:
        strb    r11, [r1], #1
        cmp     r6, r5
        bge     LAAD_MovingAvgSize_EQ_0_FindFirstPeak_Loop_End
        mov     r5, r6
        add     r9, r9, #1
        cmp     r8, r0
        ldrge   r6, [r0], #4
        bge     LAAD_MovingAvgSize_EQ_0_FindFirstPeak_Loop
LAAD_MovingAvgSize_EQ_0_I_EQ_Len:
        mov     r9, #1
        strb    r9, [r12]
        strb    r11, [r1]
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LAAD_MovingAvgSize_EQ_0_FindFirstPeak_Loop_End:
        cmp     r9, r3
        mov     r9, #1
        strgeb  r9, [r12]
        cmp     r8, r0
        blt     LAAD_MovingAvgSize_EQ_0_I_EQ_Len_1
LAAD_MovingAvgSize_EQ_0_FindPeak_Loop:
        cmp     r5, r6
        mov     r5, r6
        ldr     r6, [r0], #4
        moveq   r10, #0
        movne   r10, #1
LAAD_MovingAvgSize_EQ_0_FindPeak_LeftLoop:
        strb    r11, [r1], #1
        cmp     r5, r6
        bge     LAAD_MovingAvgSize_EQ_0_FindPeak_LeftLoop_End
        mov     r5, r6
        add     r10, r10, #1
        cmp     r8, r0
        ldrge   r6, [r0], #4
        bge     LAAD_MovingAvgSize_EQ_0_FindPeak_LeftLoop
        cmp     r2, r3
        movlt   r9, r2
        movge   r9, r3
        cmp     r10, r9
        mov     r9, #1
        strgeb  r9, [r1]
        strltb  r11, [r1]
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LAAD_MovingAvgSize_EQ_0_FindPeak_LeftLoop_End:
        bgt     LAAD_MovingAvgSize_EQ_0_FindPeak_RightLoop_Init
        cmp     r8, r0
        bge     LAAD_MovingAvgSize_EQ_0_FindPeak_Loop
        strb    r11, [r1]
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LAAD_MovingAvgSize_EQ_0_FindPeak_RightLoop_Init:
        sub     r7, r1, #1
        cmp     r8, r0
        mov     r5, r6
        ldrge   r6, [r0], #4
        mov     r9, #1
        blt     LAAD_MovingAvgSize_EQ_0_FindPeak_RightLoop_I_EQ_Len_1
LAAD_MovingAvgSize_EQ_0_FindPeak_RightLoop:
        strb    r11, [r1], #1
        cmp     r6, r5
        bge     LAAD_MovingAvgSize_EQ_0_FindPeak_RightLoop_End
        mov     r5, r6
        add     r9, r9, #1
        cmp     r8, r0
        ldrge   r6, [r0], #4
        bge     LAAD_MovingAvgSize_EQ_0_FindPeak_RightLoop
LAAD_MovingAvgSize_EQ_0_FindPeak_RightLoop_I_EQ_Len_1:
        strb    r11, [r1], #1
        sub     lr, r7, r12
        cmp     lr, r3
        movge   lr, r3
        cmp     r10, lr
        blt     LAAD_MovingAvgSize_EQ_0_FindPeak_End
        sub     lr, r7, r12
        sub     lr, r2, lr
        cmp     lr, r3
        movge   lr, r3
        cmp     r9, lr
        mov     r9, #1
        strgeb  r9, [r7]
LAAD_MovingAvgSize_EQ_0_FindPeak_End:
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LAAD_MovingAvgSize_EQ_0_FindPeak_RightLoop_End:
        sub     lr, r7, r12
        cmp     lr, r3
        movge   lr, r3
        cmp     r10, lr
        blt     LAAD_MovingAvgSize_EQ_0_FindPeak_Loop_End
        sub     lr, r7, r12
        sub     lr, r2, lr
        cmp     lr, r3
        movge   lr, r3
        cmp     r9, lr
        mov     r9, #1
        strgeb  r9, [r7]
LAAD_MovingAvgSize_EQ_0_FindPeak_Loop_End:
        cmp     r4, r0
        bge     LAAD_MovingAvgSize_EQ_0_FindPeak_Loop
        cmp     r8, r0
        blt     LAAD_MovingAvgSize_EQ_0_I_EQ_Len_1
        add     r9, r12, r2
LAAD_MovingAvgSize_EQ_0_End_Loop:
        strb    r11, [r1], #1
        cmp     r9, r1
        bge     LAAD_MovingAvgSize_EQ_0_searchSize_GE_Len_1_End
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LAAD_MovingAvgSize_EQ_0_I_EQ_Len_1:
        cmp     r6, r5
        ble     LAAD_MovingAvgSize_EQ_0_I_EQ_Len_1_NoEndPeak
        cmp     r3, #1
        bne     LAAD_MovingAvgSize_EQ_0_I_EQ_Len_1_NoEndPeak
LAAD_MovingAvgSize_EQ_0_I_EQ_Len_1_OneEndPeak:
        mov     r9, #1
        strb    r9, [r1]
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LAAD_MovingAvgSize_EQ_0_I_EQ_Len_1_NoEndPeak:
        strb    r11, [r1]
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LAAD_MovingAvgSize_EQ_0_searchSize_GE_Len_1:
        mov     r4, #1
        add     r9, r1, r2
        strb    r11, [r1], #1
        cmp     r6, r5
        bgt     LAAD_MovingAvgSize_EQ_0_searchSize_GE_Len_1_pSrc2_GT_PSrc1
        beq     LAAD_MovingAvgSize_EQ_0_searchSize_GE_Len_1_End
        mov     r5, r6
        cmp     r8, r0
        ldrge   r6, [r0], #4
        blt     LAAD_MovingAvgSize_EQ_0_searchSize_GE_Len_1_RightLoop_End
LAAD_MovingAvgSize_EQ_0_searchSize_GE_Len_1_RightLoop:
        strb    r11, [r1], #1
        cmp     r6, r5
        bge     LAAD_MovingAvgSize_EQ_0_searchSize_GE_Len_1_End
        mov     r5, r6
        cmp     r8, r0
        ldrge   r6, [r0], #4
        bge     LAAD_MovingAvgSize_EQ_0_searchSize_GE_Len_1
LAAD_MovingAvgSize_EQ_0_searchSize_GE_Len_1_RightLoop_End:
        strb    r4, [r12]
        strb    r11, [r1]
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LAAD_MovingAvgSize_EQ_0_searchSize_GE_Len_1_pSrc2_GT_PSrc1:
        mov     r5, r6
        cmp     r8, r0
        ldrge   r6, [r0], #4
        blt     LAAD_MovingAvgSize_EQ_0_searchSize_GE_Len_1_pSrc2_GT_PSrc1_LeftLoop_End
LAAD_MovingAvgSize_EQ_0_searchSize_GE_Len_1_pSrc2_GT_PSrc1_LeftLoop:
        strb    r11, [r1], #1
        cmp     r5, r6
        bge     LAAD_MovingAvgSize_EQ_0_searchSize_GE_Len_1_pSrc2_GT_PSrc1_RightLoop_Init
        mov     r5, r6
        cmp     r8, r0
        ldrge   r6, [r0], #4
        bge     LAAD_MovingAvgSize_EQ_0_searchSize_GE_Len_1_pSrc2_GT_PSrc1_LeftLoop
LAAD_MovingAvgSize_EQ_0_searchSize_GE_Len_1_pSrc2_GT_PSrc1_LeftLoop_End:
        strb    r4, [r1]
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LAAD_MovingAvgSize_EQ_0_searchSize_GE_Len_1_pSrc2_GT_PSrc1_RightLoop_Init:
        beq     LAAD_MovingAvgSize_EQ_0_searchSize_GE_Len_1_End
        mov     r10, r1
        mov     r5, r6
        cmp     r8, r0
        ldrge   r6, [r0], #4
        blt     LAAD_MovingAvgSize_EQ_0_searchSize_GE_Len_1_pSrc2_GT_PSrc1_RightLoop_End
LAAD_MovingAvgSize_EQ_0_searchSize_GE_Len_1_pSrc2_GT_PSrc1_RightLoop:
        strb    r11, [r1], #1
        cmp     r6, r5
        bge     LAAD_MovingAvgSize_EQ_0_searchSize_GE_Len_1_End
        mov     r5, r6
        cmp     r8, r0
        ldrge   r6, [r0], #4
        bge     LAAD_MovingAvgSize_EQ_0_searchSize_GE_Len_1_pSrc2_GT_PSrc1_RightLoop
LAAD_MovingAvgSize_EQ_0_searchSize_GE_Len_1_pSrc2_GT_PSrc1_RightLoop_End:
        strb    r4, [r10, #-1]
LAAD_MovingAvgSize_EQ_0_searchSize_GE_Len_1_End:
        strb    r11, [r1], #1
        cmp     r9, r1
        bge     LAAD_MovingAvgSize_EQ_0_searchSize_GE_Len_1_End
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LAAD_MovingAvgSize_NOT_EQ_0:
        add     r5, r4, r4
        cmp     r3, r2
        blt     LAAD_searchSize_LT_Len_1
LAAD_searchSize_GE_Len_1:
        cmp     r5, r2
        ble     LAAD_avgWinSize_LE_Len
        add     r9, r1, r2
        mov     r11, #0
LAAD_MovingAvgSize_NE_0_searchSize_GE_Len_1_avgWinSize_GT_Len:
        strb    r11, [r1], #1
        cmp     r9, r1
        bge     LAAD_MovingAvgSize_NE_0_searchSize_GE_Len_1_avgWinSize_GT_Len
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LAAD_avgWinSize_LE_Len:
        str     r1, [sp, #-4]!
        str     r0, [sp, #-4]!
        add     lr, r0, r2, lsl #2
        add     lr, lr, #4
        ldr     r7, [r0], #4
        add     r9, r0, r4, lsl #2
        mov     r8, #0
        ldr     r6, [r0], #4
        cmp     r7, #0
        sublt   r8, r8, #1
LAAD_LE_Smooth_0:
        cmp     r6, #0
        sublt   r8, r8, #1
        adds    r7, r6, r7
        adc     r8, r8, #0
        ldr     r6, [r0], #4
        cmp     r9, r0
        bge     LAAD_LE_Smooth_0
        add     r4, r4, #1
        smull   r9, r10, r4, r6
        mov     r11, #0
        add     r12, r1, r2
        strb    r11, [r1], #1
        subs    r9, r9, r7
        sbcs    r10, r10, r8
        blt     LAAD_pSrc2_LT_pSrc1
        bgt     LAAD_pSrc2_GT_pSrc1
        cmp     r9, #0
        bgt     LAAD_pSrc2_GT_pSrc1
        beq     LAAD_avgWinSize_LE_Len_End
LAAD_pSrc2_LT_pSrc1:
        cmp     r6, #0
        sublt   r8, r8, #1
        adds    r7, r6, r7
        adc     r8, r8, #0
        cmp     r0, lr
        blt     LAAD_pSrc2_LT_pSrc1_Len_NE_3
        ldr     r5, [sp]
        ldr     r9, [r5], #4
        b       LAAD_pSrc2_LT_pSrc1_EndPart
LAAD_pSrc2_LT_pSrc1_Len_NE_3:
        ldr     r6, [r0], #4
        cmp     r4, r5
        add     r4, r4, #1
        bge     LAAD_pSrc2_LT_pSrc1_MiddlePart_Init
LAAD_pSrc2_LT_pSrc1_StartPart:
        smull   r9, r10, r4, r6
        add     r4, r4, #1
        strb    r11, [r1], #1
        subs    r9, r9, r7
        sbcs    r10, r10, r8
        bge     LAAD_avgWinSize_LE_Len_End
        cmp     r6, #0
        sublt   r8, r8, #1
        adds    r7, r6, r7
        adc     r8, r8, #0
        ldr     r6, [r0], #4
        cmp     r4, r5
        ble     LAAD_pSrc2_LT_pSrc1_StartPart
LAAD_pSrc2_LT_pSrc1_MiddlePart_Init:
        ldr     r5, [sp]
        ldr     r9, [r5], #4
LAAD_pSrc2_LT_pSrc1_MiddlePart:
        strb    r11, [r1], #1
        subs    r6, r6, r9
        bge     LAAD_avgWinSize_LE_Len_End
        sub     r8, r8, #1
        adds    r7, r6, r7
        adc     r8, r8, #0
        ldr     r9, [r5], #4
        cmp     lr, r0
        ldrgt   r6, [r0], #4
        bgt     LAAD_pSrc2_LT_pSrc1_MiddlePart
        sub     r4, r4, #1
LAAD_pSrc2_LT_pSrc1_EndPart:
        smull   r6, r10, r4, r9
        sub     r4, r4, #1
        strb    r11, [r1], #1
        cmp     r9, #0
        addlt   r8, r8, #1
        subs    r7, r7, r9
        sbc     r8, r8, #0
        subs    r9, r7, r6
        sbcs    r10, r8, r10
        bge     LAAD_avgWinSize_LE_Len_End
        ldr     r9, [r5], #4
        cmp     r12, r1
        bgt     LAAD_pSrc2_LT_pSrc1_EndPart
        ldr     r5, [sp, #4]
        strb    r11, [r1]
        mov     r4, #1
        strb    r4, [r5]
        add     sp, sp, #8
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LAAD_pSrc2_GT_pSrc1:
        cmp     r6, #0
        sublt   r8, r8, #1
        adds    r7, r6, r7
        adc     r8, r8, #0
        cmp     r0, lr
        blt     LAAD_pSrc2_GT_pSrc1_Len_NE_3
        ldr     r5, [sp]
        ldr     r9, [r5], #4
        b       LAAD_pSrc2_GT_pSrc1_Left_EndPart
LAAD_pSrc2_GT_pSrc1_Len_NE_3:
        ldr     r6, [r0], #4
        cmp     r4, r5
        add     r4, r4, #1
        bge     LAAD_pSrc2_GT_pSrc1_Left_MiddlePart_Init
LAAD_pSrc2_GT_pSrc1_Left_StartPart:
        smull   r9, r10, r4, r6
        add     r4, r4, #1
        strb    r11, [r1], #1
        subs    r9, r7, r9
        sbcs    r10, r8, r10
        bge     LAAD_pSrc2_GT_pSrc1_Left_StartPart_End
        cmp     r6, #0
        sublt   r8, r8, #1
        adds    r7, r6, r7
        adc     r8, r8, #0
        ldr     r6, [r0], #4
        cmp     r4, r5
        ble     LAAD_pSrc2_GT_pSrc1_Left_StartPart
LAAD_pSrc2_GT_pSrc1_Left_MiddlePart_Init:
        ldr     r5, [sp]
        ldr     r9, [r5], #4
LAAD_pSrc2_GT_pSrc1_Left_MiddlePart:
        strb    r11, [r1], #1
        subs    r6, r6, r9
        ble     LAAD_pSrc2_GT_pSrc1_Left_MiddlePart_End
        adds    r7, r6, r7
        adc     r8, r8, #0
        ldr     r9, [r5], #4
        cmp     lr, r0
        ldrgt   r6, [r0], #4
        bgt     LAAD_pSrc2_GT_pSrc1_Left_MiddlePart
        sub     r4, r4, #1
LAAD_pSrc2_GT_pSrc1_Left_EndPart:
        smull   r6, r10, r4, r9
        sub     r4, r4, #1
        strb    r11, [r1], #1
        cmp     r9, #0
        addlt   r8, r8, #1
        subs    r7, r7, r9
        sbc     r8, r8, #0
        subs    r9, r6, r7
        sbcs    r10, r10, r8
        bge     LAAD_pSrc2_GT_pSrc1_Left_EndPart_End
        ldr     r9, [r5], #4
        cmp     r12, r1
        bgt     LAAD_pSrc2_GT_pSrc1_Left_EndPart
        mov     r4, #1
        strb    r4, [r1]
        add     sp, sp, #8
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LAAD_pSrc2_GT_pSrc1_Left_StartPart_End:
        bgt     LAAD_pSrc2_GT_pSrc1_Left_StartPart_End_pSrc3_LT_pSrc2
        cmp     r9, #0
        beq     LAAD_avgWinSize_LE_Len_End
LAAD_pSrc2_GT_pSrc1_Left_StartPart_End_pSrc3_LT_pSrc2:
        str     r1, [sp, #-4]
        cmp     r6, #0
        sublt   r8, r8, #1
        adds    r7, r6, r7
        adc     r8, r8, #0
        ldr     r6, [r0], #4
        cmp     r4, r5
        ble     LAAD_pSrc2_GT_pSrc1_Right_StartPart
        b       LAAD_pSrc2_GT_pSrc1_Right_MiddlePart_Init
LAAD_pSrc2_GT_pSrc1_Left_MiddlePart_End:
        beq     LAAD_avgWinSize_LE_Len_End
        str     r1, [sp, #-4]
        sub     r8, r8, #1
        adds    r7, r6, r7
        adc     r8, r8, #0
        ldr     r9, [r5], #4
        cmp     lr, r0
        ldrgt   r6, [r0], #4
        bgt     LAAD_pSrc2_GT_pSrc1_Right_MiddlePart
        sub     r4, r4, #1
        b       LAAD_pSrc2_GT_pSrc1_Right_EndPart
LAAD_pSrc2_GT_pSrc1_Left_EndPart_End:
        bgt     LAAD_pSrc2_GT_pSrc1_Left_EndPart_End_pSrc3_LT_pSrc2
        cmp     r9, #0
        beq     LAAD_avgWinSize_LE_Len_End
LAAD_pSrc2_GT_pSrc1_Left_EndPart_End_pSrc3_LT_pSrc2:
        str     r1, [sp, #-4]
        ldr     r9, [r5], #4
        cmp     r12, r1
        bgt     LAAD_pSrc2_GT_pSrc1_Right_EndPart
        b       LAAD_pSrc2_GT_pSrc1_Right_EndPart_End
LAAD_pSrc2_GT_pSrc1_Right_StartPart:
        smull   r9, r10, r4, r6
        add     r4, r4, #1
        strb    r11, [r1], #1
        subs    r9, r9, r7
        sbcs    r10, r10, r8
        bge     LAAD_avgWinSize_LE_Len_End
        cmp     r6, #0
        sublt   r8, r8, #1
        adds    r7, r6, r7
        adc     r8, r8, #0
        ldr     r6, [r0], #4
        cmp     r4, r5
        ble     LAAD_pSrc2_GT_pSrc1_Right_StartPart
LAAD_pSrc2_GT_pSrc1_Right_MiddlePart_Init:
        ldr     r5, [sp]
        ldr     r9, [r5], #4
LAAD_pSrc2_GT_pSrc1_Right_MiddlePart:
        strb    r11, [r1], #1
        subs    r6, r6, r9
        bge     LAAD_avgWinSize_LE_Len_End
        sub     r8, r8, #1
        adds    r7, r6, r7
        adc     r8, r8, #0
        ldr     r9, [r5], #4
        cmp     lr, r0
        ldrgt   r6, [r0], #4
        bgt     LAAD_pSrc2_GT_pSrc1_Right_MiddlePart
        sub     r4, r4, #1
LAAD_pSrc2_GT_pSrc1_Right_EndPart:
        smull   r6, r10, r4, r9
        sub     r4, r4, #1
        strb    r11, [r1], #1
        cmp     r9, #0
        addlt   r8, r8, #1
        subs    r7, r7, r9
        sbc     r8, r8, #0
        subs    r9, r7, r6
        sbcs    r10, r8, r10
        bge     LAAD_avgWinSize_LE_Len_End
        ldr     r9, [r5], #4
        cmp     r12, r1
        bgt     LAAD_pSrc2_GT_pSrc1_Right_EndPart
LAAD_pSrc2_GT_pSrc1_Right_EndPart_End:
        ldr     r5, [sp, #-4]
        mov     r4, #1
        strb    r4, [r5, #-1]
LAAD_avgWinSize_LE_Len_End:
        strb    r11, [r1], #1
        cmp     r12, r1
        bge     LAAD_avgWinSize_LE_Len_End
        add     sp, sp, #8
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LAAD_searchSize_LT_Len_1:
        cmp     r5, r2
        bge     LAAD_avgWinSize_GE_Len
        str     r3, [sp, #-4]!
        str     r2, [sp, #-4]!
        str     r1, [sp, #-4]!
        str     r0, [sp, #-4]!
        add     lr, r0, r2, lsl #2
        add     lr, lr, #4
        ldr     r7, [r0], #4
        add     r9, r0, r4, lsl #2
        mov     r8, #0
        ldr     r6, [r0], #4
        cmp     r7, #0
        sublt   r8, r8, #1
        add     r12, r1, r2
LAAD_searchSize_LT_Len_1_Smooth_0:
        cmp     r6, #0
        sublt   r8, r8, #1
        adds    r7, r6, r7
        adc     r8, r8, #0
        ldr     r6, [r0], #4
        cmp     r9, r0
        bge     LAAD_searchSize_LT_Len_1_Smooth_0
        mov     r2, #0
        mov     r11, #0
        add     r4, r4, #1
LAAD_searchSize_LT_Len_1_FindFirstPeak_StartPart_Loop:
        smull   r9, r10, r4, r6
        add     r4, r4, #1
        strb    r11, [r1], #1
        subs    r9, r9, r7
        sbcs    r10, r10, r8
        bge     LAAD_searchSize_LT_Len_1_FindFirstPeak_StartPart_Loop_End
        cmp     r6, #0
        sublt   r8, r8, #1
        adds    r7, r6, r7
        adc     r8, r8, #0
        ldr     r6, [r0], #4
        add     r2, r2, #1
        cmp     r4, r5
        ble     LAAD_searchSize_LT_Len_1_FindFirstPeak_StartPart_Loop
        ldr     r5, [sp]
        ldr     r9, [r5], #4
LAAD_searchSize_LT_Len_1_FindFirstPeak_MiddlePart_Loop:
        strb    r11, [r1], #1
        subs    r6, r6, r9
        bge     LAAD_searchSize_LT_Len_1_FindFirstPeak_MiddlePart_Loop_End
        sub     r8, r8, #1
        adds    r7, r6, r7
        adc     r8, r8, #0
        ldr     r9, [r5], #4
        add     r2, r2, #1
        cmp     lr, r0
        ldrgt   r6, [r0], #4
        bgt     LAAD_searchSize_LT_Len_1_FindFirstPeak_MiddlePart_Loop
        sub     r4, r4, #1
LAAD_searchSize_LT_Len_1_FindFirstPeak_EndPart_Loop:
        smull   r6, r10, r4, r9
        sub     r4, r4, #1
        strb    r11, [r1], #1
        cmp     r9, #0
        addlt   r8, r8, #1
        subs    r7, r7, r9
        sbc     r8, r8, #0
        subs    r9, r7, r6
        sbcs    r10, r8, r10
        bge     LAAD_searchSize_LT_Len_1_FindFirstPeak_EndPart_Loop_End
        ldr     r9, [r5], #4
        cmp     r12, r1
        bgt     LAAD_searchSize_LT_Len_1_FindFirstPeak_EndPart_Loop
        ldr     r12, [sp, #4]
        mov     r9, #1
        strb    r11, [r1]
        strb    r9, [r12]
        add     sp, sp, #0x10
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LAAD_searchSize_LT_Len_1_FindFirstPeak_StartPart_Loop_End:
        cmp     r2, r3
        blt     LAAD_searchSize_LT_Len_1_FindFirstPeak_StartPart_Loop_End_NoPeak
        ldr     r3, [sp, #4]
        mov     r2, #1
        strb    r2, [r3]
LAAD_searchSize_LT_Len_1_FindFirstPeak_StartPart_Loop_End_NoPeak:
        cmp     r6, #0
        sublt   r8, r8, #1
        adds    r7, r6, r7
        adc     r8, r8, #0
        cmp     r9, #0
        cmpeq   r10, #0
        moveq   r3, #0
        movne   r3, #1
        ldr     r6, [r0], #4
        cmp     r4, r5
        ble     LAAD_searchSize_LT_Len_1_FindPeak_StartPart_Loop
        b       LAAD_searchSize_LT_Len_1_FindPeak_MiddlePart_Loop_Init
LAAD_searchSize_LT_Len_1_FindFirstPeak_MiddlePart_Loop_End:
        cmp     r2, r3
        blt     LAAD_searchSize_LT_Len_1_FindFirstPeak_MiddlePart_Loop_End_NoPeak
        ldr     r3, [sp, #4]
        mov     r2, #1
        strb    r2, [r3]
LAAD_searchSize_LT_Len_1_FindFirstPeak_MiddlePart_Loop_End_NoPeak:
        adds    r7, r6, r7
        adc     r8, r8, #0
        cmp     r6, #0
        moveq   r3, #0
        movne   r3, #1
        ldr     r9, [r5], #4
        cmp     lr, r0
        ldrgt   r6, [r0], #4
        bgt     LAAD_searchSize_LT_Len_1_FindPeak_MiddlePart_Loop
        sub     r4, r4, #1
        b       LAAD_searchSize_LT_Len_1_FindPeak_EndPart_Loop
LAAD_searchSize_LT_Len_1_FindFirstPeak_EndPart_Loop_End:
        cmp     r2, r3
        blt     LAAD_searchSize_LT_Len_1_FindFirstPeak_EndPart_Loop_End_NoPeak
        ldr     r3, [sp, #4]
        mov     r2, #1
        strb    r2, [r3]
LAAD_searchSize_LT_Len_1_FindFirstPeak_EndPart_Loop_End_NoPeak:
        cmp     r9, #0
        cmpeq   r10, #0
        moveq   r3, #0
        movne   r3, #1
        ldr     r9, [r5], #4
        cmp     r12, r1
        bgt     LAAD_searchSize_LT_Len_1_FindPeak_EndPart_Loop
        b       LAAD_searchSize_LT_Len_1_FindPeak_EndPart_Loop_End
LAAD_searchSize_LT_Len_1_FindPeak_StartPart_Loop:
        smull   r9, r10, r4, r6
        add     r4, r4, #1
        strb    r11, [r1], #1
        subs    r9, r7, r9
        sbcs    r10, r8, r10
        bge     LAAD_searchSize_LT_Len_1_FindPeak_Left_StartPart_Loop_End
        cmp     r6, #0
        sublt   r8, r8, #1
        adds    r7, r6, r7
        adc     r8, r8, #0
        ldr     r6, [r0], #4
        add     r3, r3, #1
        cmp     r4, r5
        ble     LAAD_searchSize_LT_Len_1_FindPeak_StartPart_Loop
LAAD_searchSize_LT_Len_1_FindPeak_MiddlePart_Loop_Init:
        ldr     r5, [sp]
        ldr     r9, [r5], #4
LAAD_searchSize_LT_Len_1_FindPeak_MiddlePart_Loop:
        strb    r11, [r1], #1
        subs    r6, r6, r9
        ble     LAAD_searchSize_LT_Len_1_FindPeak_Left_MiddlePart_Loop_End
        adds    r7, r6, r7
        adc     r8, r8, #0
        add     r3, r3, #1
        ldr     r9, [r5], #4
        cmp     lr, r0
        ldrgt   r6, [r0], #4
        bgt     LAAD_searchSize_LT_Len_1_FindPeak_MiddlePart_Loop
        sub     r4, r4, #1
LAAD_searchSize_LT_Len_1_FindPeak_EndPart_Loop:
        smull   r6, r10, r4, r9
        sub     r4, r4, #1
        strb    r11, [r1], #1
        cmp     r9, #0
        addlt   r8, r8, #1
        subs    r7, r7, r9
        sbc     r8, r8, #0
        subs    r9, r6, r7
        sbcs    r10, r10, r8
        bge     LAAD_searchSize_LT_Len_1_FindPeak_Left_EndPart_Loop_End
        ldr     r9, [r5], #4
        add     r3, r3, #1
        cmp     r12, r1
        bgt     LAAD_searchSize_LT_Len_1_FindPeak_EndPart_Loop
        ldr     r9, [sp, #8]
        ldr     r10, [sp, #0xC]
        mov     r4, #1
        add     sp, sp, #0x10
        cmp     r9, r10
        movlt   r2, r9
        movge   r2, r10
        cmp     r3, r2
        strgeb  r4, [r1]
        strltb  r11, [r1]
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LAAD_searchSize_LT_Len_1_FindPeak_Left_StartPart_Loop_End:
        cmp     r6, #0
        sublt   r8, r8, #1
        adds    r7, r6, r7
        adc     r8, r8, #0
        ldr     r6, [r0], #4
        cmp     r9, #0
        cmpeq   r10, #0
        bne     LAAD_searchSize_LT_Len_1_FindPeak_Left_StartPart_Loop_End_GT
        mov     r3, #0
        cmp     r4, r5
        ble     LAAD_searchSize_LT_Len_1_FindPeak_StartPart_Loop
        b       LAAD_searchSize_LT_Len_1_FindPeak_MiddlePart_Loop_Init
LAAD_searchSize_LT_Len_1_FindPeak_Left_StartPart_Loop_End_GT:
        str     r1, [sp, #-4]
        mov     r2, #1
        cmp     r4, r5
        ble     LAAD_searchSize_LT_Len_1_FindPeak_Right_StartPart_Loop
        b       LAAD_searchSize_LT_Len_1_FindPeak_Right_MiddlePart_Loop_Init
LAAD_searchSize_LT_Len_1_FindPeak_Left_MiddlePart_Loop_End:
        bne     LAAD_searchSize_LT_Len_1_FindPeak_Left_MiddlePart_Loop_End_GT
        mov     r3, #0
        ldr     r9, [r5], #4
        cmp     lr, r0
        ldrgt   r6, [r0], #4
        bgt     LAAD_searchSize_LT_Len_1_FindPeak_MiddlePart_Loop
        sub     r4, r4, #1
        b       LAAD_searchSize_LT_Len_1_FindPeak_EndPart_Loop
LAAD_searchSize_LT_Len_1_FindPeak_Left_MiddlePart_Loop_End_GT:
        sub     r8, r8, #1
        adds    r7, r6, r7
        adc     r8, r8, #0
        str     r1, [sp, #-4]
        mov     r2, #1
        ldr     r9, [r5], #4
        cmp     lr, r0
        ldrgt   r6, [r0], #4
        bgt     LAAD_searchSize_LT_Len_1_FindPeak_Right_MiddlePart_Loop
        sub     r4, r4, #1
        b       LAAD_searchSize_LT_Len_1_FindPeak_Right_EndPart_Loop
LAAD_searchSize_LT_Len_1_FindPeak_Left_EndPart_Loop_End:
        cmp     r9, #0
        cmpeq   r10, #0
        ldr     r9, [r5], #4
        bne     LAAD_searchSize_LT_Len_1_FindPeak_Left_EndPart_Loop_End_GT
        mov     r3, #0
        cmp     r12, r1
        bgt     LAAD_searchSize_LT_Len_1_FindPeak_EndPart_Loop
        b       LAAD_searchSize_LT_Len_1_FindPeak_Right_EndPart_I_EQ_Len_1
LAAD_searchSize_LT_Len_1_FindPeak_Left_EndPart_Loop_End_GT:
        mov     r2, #1
        str     r1, [sp, #-4]
        cmp     r12, r1
        bgt     LAAD_searchSize_LT_Len_1_FindPeak_Right_EndPart_Loop
        b       LAAD_searchSize_LT_Len_1_FindPeak_Right_EndPart_I_EQ_Len_1
LAAD_searchSize_LT_Len_1_FindPeak_Right_StartPart_Loop:
        smull   r9, r10, r4, r6
        add     r4, r4, #1
        strb    r11, [r1], #1
        subs    r9, r9, r7
        sbcs    r10, r10, r8
        bge     LAAD_searchSize_LT_Len_1_FindPeak_Right_StartPart_Loop_End
        cmp     r6, #0
        sublt   r8, r8, #1
        adds    r7, r6, r7
        adc     r8, r8, #0
        ldr     r6, [r0], #4
        add     r2, r2, #1
        cmp     r4, r5
        ble     LAAD_searchSize_LT_Len_1_FindPeak_Right_StartPart_Loop
LAAD_searchSize_LT_Len_1_FindPeak_Right_MiddlePart_Loop_Init:
        ldr     r5, [sp]
        ldr     r9, [r5], #4
LAAD_searchSize_LT_Len_1_FindPeak_Right_MiddlePart_Loop:
        strb    r11, [r1], #1
        subs    r6, r6, r9
        bge     LAAD_searchSize_LT_Len_1_FindPeak_Right_MiddlePart_Loop_End
        sub     r8, r8, #1
        adds    r7, r6, r7
        adc     r8, r8, #0
        ldr     r9, [r5], #4
        add     r2, r2, #1
        cmp     lr, r0
        ldrgt   r6, [r0], #4
        bgt     LAAD_searchSize_LT_Len_1_FindPeak_Right_MiddlePart_Loop
        sub     r4, r4, #1
LAAD_searchSize_LT_Len_1_FindPeak_Right_EndPart_Loop:
        smull   r6, r10, r4, r9
        sub     r4, r4, #1
        strb    r11, [r1], #1
        cmp     r9, #0
        addlt   r8, r8, #1
        subs    r7, r7, r9
        sbc     r8, r8, #0
        subs    r9, r7, r6
        sbcs    r10, r8, r10
        bge     LAAD_searchSize_LT_Len_1_FindPeak_Right_EndPart_Loop_End
        add     r2, r2, #1
        ldr     r9, [r5], #4
        cmp     r12, r1
        bgt     LAAD_searchSize_LT_Len_1_FindPeak_Right_EndPart_Loop
LAAD_searchSize_LT_Len_1_FindPeak_Right_EndPart_I_EQ_Len_1:
        ldr     r7, [sp, #-4]
        ldr     r12, [sp, #4]
        strb    r11, [r1], #1
        sub     r7, r7, #1
        ldr     r10, [sp, #0xC]
        ldr     r9, [sp, #8]
        sub     lr, r7, r12
        cmp     lr, r10
        movge   lr, r10
        cmp     r3, lr
        blt     LAAD_searchSize_LT_Len_1_FindPeak_Right_EndPart_I_EQ_Len_1_End
        sub     lr, r7, r12
        sub     lr, r9, lr
        cmp     lr, r10
        movge   lr, r10
        cmp     r2, lr
        mov     r2, #1
        strgeb  r2, [r7]
LAAD_searchSize_LT_Len_1_FindPeak_Right_EndPart_I_EQ_Len_1_End:
        add     sp, sp, #0x10
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LAAD_searchSize_LT_Len_1_FindPeak_Right_StartPart_Loop_End:
        cmp     r6, #0
        sublt   r8, r8, #1
        adds    r7, r6, r7
        adc     r8, r8, #0
        cmp     r9, #0
        cmpeq   r10, #0
        movne   r11, #1
        ldr     r6, [sp, #-4]
        ldr     r9, [sp, #4]
        ldr     r10, [sp, #0xC]
        sub     r6, r6, #1
        sub     r9, r6, r9
        cmp     r9, r10
        movge   r9, r10
        cmp     r3, r9
        blt     LAAD_searchSize_LT_Len_1_FindPeak_Right_StartPart_Loop_End_NoPeak
        ldr     r9, [sp, #4]
        ldr     r3, [sp, #8]
        sub     r9, r6, r9
        sub     r9, r3, r9
        cmp     r9, r10
        movge   r9, r10
        cmp     r2, r9
        mov     r2, #1
        strgeb  r2, [r6]
LAAD_searchSize_LT_Len_1_FindPeak_Right_StartPart_Loop_End_NoPeak:
        mov     r3, r11
        mov     r11, #0
        ldr     r6, [r0], #4
        cmp     r4, r5
        ble     LAAD_searchSize_LT_Len_1_FindPeak_StartPart_Loop
        b       LAAD_searchSize_LT_Len_1_FindPeak_MiddlePart_Loop_Init
LAAD_searchSize_LT_Len_1_FindPeak_Right_MiddlePart_Loop_End:
        adds    r7, r6, r7
        adc     r8, r8, #0
        cmp     r6, #0
        movne   r11, #1
        ldr     r6, [sp, #-4]
        ldr     r9, [sp, #4]
        ldr     r10, [sp, #0xC]
        sub     r6, r6, #1
        sub     r9, r6, r9
        cmp     r9, r10
        movge   r9, r10
        cmp     r3, r9
        blt     LAAD_searchSize_LT_Len_1_FindPeak_Right_MiddlePart_Loop_End_NoPeak
        ldr     r9, [sp, #4]
        ldr     r3, [sp, #8]
        sub     r9, r6, r9
        sub     r9, r3, r9
        cmp     r9, r10
        movge   r9, r10
        cmp     r2, r9
        mov     r2, #1
        strgeb  r2, [r6]
LAAD_searchSize_LT_Len_1_FindPeak_Right_MiddlePart_Loop_End_NoPeak:
        mov     r3, r11
        mov     r11, #0
        ldr     r9, [r5], #4
        cmp     lr, r0
        ldrgt   r6, [r0], #4
        bgt     LAAD_searchSize_LT_Len_1_FindPeak_MiddlePart_Loop
        sub     r4, r4, #1
        b       LAAD_searchSize_LT_Len_1_FindPeak_EndPart_Loop
LAAD_searchSize_LT_Len_1_FindPeak_Right_EndPart_Loop_End:
        cmp     r9, #0
        cmpeq   r10, #0
        movne   r11, #1
        ldr     r6, [sp, #-4]
        ldr     r9, [sp, #4]
        ldr     r10, [sp, #0xC]
        sub     r6, r6, #1
        sub     r9, r6, r9
        cmp     r9, r10
        movge   r9, r10
        cmp     r3, r9
        blt     LAAD_searchSize_LT_Len_1_FindPeak_Right_EndPart_Loop_End_NoPeak
        ldr     r9, [sp, #4]
        ldr     r3, [sp, #8]
        sub     r9, r6, r9
        sub     r9, r3, r9
        cmp     r9, r10
        movge   r9, r10
        cmp     r2, r9
        mov     r2, #1
        strgeb  r2, [r6]
LAAD_searchSize_LT_Len_1_FindPeak_Right_EndPart_Loop_End_NoPeak:
        mov     r3, r11
        mov     r11, #0
        ldr     r9, [r5], #4
        cmp     r12, r1
        bgt     LAAD_searchSize_LT_Len_1_FindPeak_EndPart_Loop
LAAD_searchSize_LT_Len_1_FindPeak_EndPart_Loop_End:
        ldr     r9, [sp, #0xC]
        cmp     r3, #0
        beq     LAAD_searchSize_LT_Len_1_FindPeak_EndPart_Loop_End_NoPeak
        cmp     r9, #1
        bne     LAAD_searchSize_LT_Len_1_FindPeak_EndPart_Loop_End_NoPeak
        strb    r9, [r1]
        add     sp, sp, #0x10
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LAAD_searchSize_LT_Len_1_FindPeak_EndPart_Loop_End_NoPeak:
        strb    r11, [r1]
        add     sp, sp, #0x10
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LAAD_avgWinSize_GE_Len:
        add     r12, r1, r2
        mov     r11, #0
        cmp     r5, r2
        beq     LAAD_avgWinSize_GE_Len_Normal
        cmp     r3, r4
        ble     LAAD_avgWinSize_GE_Len_Normal
LAAD_avgWinSize_GE_Len_FillZero_Loop:
        strb    r11, [r1], #1
        cmp     r12, r1
        bge     LAAD_avgWinSize_GE_Len_FillZero_Loop
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LAAD_avgWinSize_GE_Len_Normal:
        str     r3, [sp, #-4]!
        str     r2, [sp, #-4]!
        str     r1, [sp, #-4]!
        str     r0, [sp, #-4]!
        mov     r5, r2
        add     lr, r1, r4
        ldr     r7, [r0], #4
        add     r9, r0, r4, lsl #2
        mov     r8, #0
        ldr     r6, [r0], #4
        cmp     r7, #0
        sublt   r8, r8, #1
LAAD_avgWinSize_GE_Len_Smooth_0:
        cmp     r6, #0
        sublt   r8, r8, #1
        adds    r7, r6, r7
        adc     r8, r8, #0
        ldr     r6, [r0], #4
        cmp     r9, r0
        bge     LAAD_avgWinSize_GE_Len_Smooth_0
        mov     r2, #0
        add     r4, r4, #1
LAAD_avgWinSize_GE_Len_FindFirstPeak_StartPart_Loop:
        smull   r9, r10, r4, r6
        add     r4, r4, #1
        strb    r11, [r1], #1
        subs    r9, r9, r7
        sbcs    r10, r10, r8
        bge     LAAD_avgWinSize_GE_Len_FindFirstPeak_StartPart_Loop_End
        cmp     r6, #0
        sublt   r8, r8, #1
        adds    r7, r6, r7
        adc     r8, r8, #0
        ldr     r6, [r0], #4
        add     r2, r2, #1
        cmp     r4, r5
        ble     LAAD_avgWinSize_GE_Len_FindFirstPeak_StartPart_Loop
        cmp     r2, r3
        blt     LAAD_avgWinSize_GE_Len_FindFirstPeak_StartPart_End_NoPeak
        ldr     r3, [sp, #4]
        mov     r2, #1
        strb    r2, [r3]
LAAD_avgWinSize_GE_Len_FindFirstPeak_StartPart_End_NoPeak:
        cmp     r9, #0
        cmpeq   r10, #0
        moveq   r3, #0
        movne   r3, #1
        b       LAAD_avgWinSize_GE_Len_FindPeak_MiddlePart_Loop_Init
LAAD_avgWinSize_GE_Len_FindFirstPeak_StartPart_Loop_End:
        cmp     r2, r3
        blt     LAAD_avgWinSize_GE_Len_FindFirstPeak_StartPart_Loop_End_NoPeak
        ldr     r3, [sp, #4]
        mov     r2, #1
        strb    r2, [r3]
LAAD_avgWinSize_GE_Len_FindFirstPeak_StartPart_Loop_End_NoPeak:
        cmp     r6, #0
        sublt   r8, r8, #1
        adds    r7, r6, r7
        adc     r8, r8, #0
        cmp     r9, #0
        cmpeq   r10, #0
        moveq   r3, #0
        movne   r3, #1
        cmp     r4, r5
        ldrle   r6, [r0], #4
        bgt     LAAD_avgWinSize_GE_Len_FindPeak_MiddlePart_Loop_Init
LAAD_avgWinSize_GE_Len_FindPeak_StartPart_Loop:
        smull   r9, r10, r4, r6
        add     r4, r4, #1
        strb    r11, [r1], #1
        subs    r9, r7, r9
        sbcs    r10, r8, r10
        bge     LAAD_avgWinSize_GE_Len_FindPeak_Left_StartPart_Loop_End
        cmp     r6, #0
        sublt   r8, r8, #1
        adds    r7, r6, r7
        adc     r8, r8, #0
        ldr     r6, [r0], #4
        add     r3, r3, #1
        cmp     r4, r5
        ble     LAAD_avgWinSize_GE_Len_FindPeak_StartPart_Loop
LAAD_avgWinSize_GE_Len_FindPeak_MiddlePart_Loop_Init:
        ldr     r5, [sp]
        cmp     lr, r1
        movgt   r3, #0
        ldr     r9, [r5], #4
LAAD_avgWinSize_GE_Len_FindPeak_MiddlePart_Loop:
        cmp     lr, r1
        strgtb  r11, [r1], #1
        bgt     LAAD_avgWinSize_GE_Len_FindPeak_MiddlePart_Loop
        sub     r4, r4, #1
LAAD_avgWinSize_GE_Len_FindPeak_EndPart_Loop:
        smull   r6, r10, r4, r9
        sub     r4, r4, #1
        strb    r11, [r1], #1
        cmp     r9, #0
        addlt   r8, r8, #1
        subs    r7, r7, r9
        sbc     r8, r8, #0
        subs    r9, r6, r7
        sbcs    r10, r10, r8
        bge     LAAD_avgWinSize_GE_Len_FindPeak_Left_EndPart_Loop_End
        ldr     r9, [r5], #4
        add     r3, r3, #1
        cmp     r12, r1
        bgt     LAAD_avgWinSize_GE_Len_FindPeak_EndPart_Loop
        ldr     r9, [sp, #8]
        ldr     r10, [sp, #0xC]
        mov     r4, #1
        add     sp, sp, #0x10
        cmp     r9, r10
        movlt   r2, r9
        movge   r2, r10
        cmp     r3, r2
        strgeb  r4, [r1]
        strltb  r11, [r1]
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LAAD_avgWinSize_GE_Len_FindPeak_Left_StartPart_Loop_End:
        cmp     r6, #0
        sublt   r8, r8, #1
        adds    r7, r6, r7
        adc     r8, r8, #0
        ldr     r6, [r0], #4
        cmp     r9, #0
        cmpeq   r10, #0
        bne     LAAD_avgWinSize_GE_Len_FindPeak_Left_StartPart_Loop_End_GT
        mov     r3, #0
        cmp     r4, r5
        ble     LAAD_avgWinSize_GE_Len_FindPeak_StartPart_Loop
        b       LAAD_avgWinSize_GE_Len_FindPeak_MiddlePart_Loop_Init
LAAD_avgWinSize_GE_Len_FindPeak_Left_StartPart_Loop_End_GT:
        str     r1, [sp, #-4]
        mov     r2, #1
        cmp     r4, r5
        ble     LAAD_avgWinSize_GE_Len_FindPeak_Right_StartPart_Loop
        b       LAAD_avgWinSize_GE_Len_FindPeak_Right_MiddlePart_Loop_End
LAAD_avgWinSize_GE_Len_FindPeak_Left_EndPart_Loop_End:
        cmp     r9, #0
        cmpeq   r10, #0
        ldr     r9, [r5], #4
        bne     LAAD_avgWinSize_GE_Len_FindPeak_Left_EndPart_Loop_End_GT
        mov     r3, #0
        cmp     r12, r1
        bgt     LAAD_avgWinSize_GE_Len_FindPeak_EndPart_Loop
        b       LAAD_avgWinSize_GE_Len_FindPeak_Right_EndPart_I_EQ_Len_1
LAAD_avgWinSize_GE_Len_FindPeak_Left_EndPart_Loop_End_GT:
        mov     r2, #1
        str     r1, [sp, #-4]
        cmp     r12, r1
        bgt     LAAD_avgWinSize_GE_Len_FindPeak_Right_EndPart_Loop
        b       LAAD_avgWinSize_GE_Len_FindPeak_Right_EndPart_I_EQ_Len_1
LAAD_avgWinSize_GE_Len_FindPeak_Right_StartPart_Loop:
        smull   r9, r10, r4, r6
        add     r4, r4, #1
        strb    r11, [r1], #1
        subs    r9, r9, r7
        sbcs    r10, r10, r8
        bge     LAAD_avgWinSize_GE_Len_FindPeak_Right_StartPart_Loop_End
        cmp     r6, #0
        sublt   r8, r8, #1
        adds    r7, r6, r7
        adc     r8, r8, #0
        ldr     r6, [r0], #4
        add     r2, r2, #1
        cmp     r4, r5
        ble     LAAD_avgWinSize_GE_Len_FindPeak_Right_StartPart_Loop
LAAD_avgWinSize_GE_Len_FindPeak_Right_MiddlePart_Loop_End:
        ldr     r6, [sp, #-4]
        ldr     r9, [sp, #4]
        ldr     r10, [sp, #0xC]
        sub     r6, r6, #1
        sub     r9, r6, r9
        cmp     r9, r10
        movge   r9, r10
        cmp     r3, r9
        movlt   r3, #0
        blt     LAAD_avgWinSize_GE_Len_FindPeak_MiddlePart_Loop_Init
        ldr     r9, [sp, #4]
        ldr     r3, [sp, #8]
        sub     r9, r6, r9
        sub     r9, r3, r9
        cmp     r9, r10
        movge   r9, r10
        cmp     r2, r9
        mov     r2, #1
        strgeb  r2, [r6]
        mov     r3, #0
        b       LAAD_avgWinSize_GE_Len_FindPeak_MiddlePart_Loop_Init
LAAD_avgWinSize_GE_Len_FindPeak_Right_EndPart_Loop:
        smull   r6, r10, r4, r9
        sub     r4, r4, #1
        strb    r11, [r1], #1
        cmp     r9, #0
        addlt   r8, r8, #1
        subs    r7, r7, r9
        sbc     r8, r8, #0
        subs    r9, r7, r6
        sbcs    r10, r8, r10
        bge     LAAD_avgWinSize_GE_Len_FindPeak_Right_EndPart_Loop_End
        add     r2, r2, #1
        ldr     r9, [r5], #4
        cmp     r12, r1
        bgt     LAAD_avgWinSize_GE_Len_FindPeak_Right_EndPart_Loop
LAAD_avgWinSize_GE_Len_FindPeak_Right_EndPart_I_EQ_Len_1:
        ldr     r7, [sp, #-4]
        ldr     r12, [sp, #4]
        strb    r11, [r1], #1
        sub     r7, r7, #1
        ldr     r10, [sp, #0xC]
        ldr     r9, [sp, #8]
        sub     lr, r7, r12
        cmp     lr, r10
        movge   lr, r10
        cmp     r3, lr
        blt     LAAD_avgWinSize_GE_Len_FindPeak_Right_EndPart_I_EQ_Len_1_End
        sub     lr, r7, r12
        sub     lr, r9, lr
        cmp     lr, r10
        movge   lr, r10
        cmp     r2, lr
        mov     r2, #1
        strgeb  r2, [r7]
LAAD_avgWinSize_GE_Len_FindPeak_Right_EndPart_I_EQ_Len_1_End:
        add     sp, sp, #0x10
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LAAD_avgWinSize_GE_Len_FindPeak_Right_StartPart_Loop_End:
        cmp     r6, #0
        sublt   r8, r8, #1
        adds    r7, r6, r7
        adc     r8, r8, #0
        cmp     r9, #0
        cmpeq   r10, #0
        movne   r11, #1
        ldr     r6, [sp, #-4]
        ldr     r9, [sp, #4]
        ldr     r10, [sp, #0xC]
        sub     r6, r6, #1
        sub     r9, r6, r9
        cmp     r9, r10
        movge   r9, r10
        cmp     r3, r9
        blt     LAAD_avgWinSize_GE_Len_FindPeak_Right_StartPart_Loop_End_NoPeak
        ldr     r9, [sp, #4]
        ldr     r3, [sp, #8]
        sub     r9, r6, r9
        sub     r9, r3, r9
        cmp     r9, r10
        movge   r9, r10
        cmp     r2, r9
        mov     r2, #1
        strgeb  r2, [r6]
LAAD_avgWinSize_GE_Len_FindPeak_Right_StartPart_Loop_End_NoPeak:
        mov     r3, r11
        mov     r11, #0
        ldr     r6, [r0], #4
        cmp     r4, r5
        ble     LAAD_avgWinSize_GE_Len_FindPeak_StartPart_Loop
        b       LAAD_avgWinSize_GE_Len_FindPeak_MiddlePart_Loop_Init
LAAD_avgWinSize_GE_Len_FindPeak_Right_EndPart_Loop_End:
        cmp     r9, #0
        cmpeq   r10, #0
        movne   r11, #1
        ldr     r6, [sp, #-4]
        ldr     r9, [sp, #4]
        ldr     r10, [sp, #0xC]
        sub     r6, r6, #1
        sub     r9, r6, r9
        cmp     r9, r10
        movge   r9, r10
        cmp     r3, r9
        blt     LAAD_avgWinSize_GE_Len_FindPeak_Right_EndPart_Loop_End_NoPeak
        ldr     r9, [sp, #4]
        ldr     r3, [sp, #8]
        sub     r9, r6, r9
        sub     r9, r3, r9
        cmp     r9, r10
        movge   r9, r10
        cmp     r2, r9
        mov     r2, #1
        strgeb  r2, [r6]
LAAD_avgWinSize_GE_Len_FindPeak_Right_EndPart_Loop_End_NoPeak:
        mov     r3, r11
        mov     r11, #0
        ldr     r9, [r5], #4
        cmp     r12, r1
        bgt     LAAD_avgWinSize_GE_Len_FindPeak_EndPart_Loop
LAAD_avgWinSize_GE_Len_FindPeak_EndPart_Loop_End:
        ldr     r9, [sp, #0xC]
        cmp     r3, #0
        beq     LAAD_avgWinSize_GE_Len_FindPeak_EndPart_Loop_End_NoPeak
        cmp     r9, #1
        bne     LAAD_avgWinSize_GE_Len_FindPeak_EndPart_Loop_End_NoPeak
        strb    r9, [r1]
        add     sp, sp, #0x10
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LAAD_avgWinSize_GE_Len_FindPeak_EndPart_Loop_End_NoPeak:
        strb    r11, [r1]
        add     sp, sp, #0x10
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}


