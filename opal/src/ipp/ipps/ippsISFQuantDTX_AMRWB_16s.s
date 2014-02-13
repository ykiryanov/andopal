        .text
        .align  4
        .globl  _ippsISFQuantDTX_AMRWB_16s


_ippsISFQuantDTX_AMRWB_16s:
        stmdb   sp!, {r4 - r11, lr}
        cmp     r0, #0
        mov     r4, r1
        mov     r5, r2
        beq     LDIT5
        cmp     r4, #0
        beq     LDIT5
        cmp     r5, #0
        beq     LDIT5
        ldr     r2, [pc, #0x300]
        mov     r1, r0
        mov     r3, #0x10
        mov     r0, r2
        mov     r2, r4
        bl      _ippsSub_16s
        ldr     r1, [pc, #0x2EC]
        ldrsh   r9, [r4]
        ldrsh   lr, [r4, #2]
        mov     r7, #0
        mov     r8, r7
        mvn     r6, #2, 2
        mov     r0, r1
        mov     r11, r6
        mov     r10, r8
LDIT0:
        ldrsh   r3, [r0]
        sub     r12, r9, r3
        ldrsh   r3, [r0, #2]
        add     r0, r0, #4
        mov     r12, r12, lsl #16
        sub     r3, lr, r3
        mov     r12, r12, asr #16
        mul     r12, r12, r12
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
        mla     r12, r3, r3, r12
        cmp     r12, r11
        movlt   r11, r12
        movlt   r8, r10
        add     r10, r10, #1
        cmp     r10, #0x40
        blt     LDIT0
        add     r0, r1, r8, lsl #2
        mov     r2, #2
        mov     r1, r4
        bl      _ippsCopy_16s
        strh    r8, [r5]
        ldr     r2, [pc, #0x274]
        ldrsh   r11, [r4, #4]
        ldrsh   r10, [r4, #6]
        ldrsh   r9, [r4, #8]
        add     r1, r4, #4
        mov     r8, r7
        mov     r0, r6
LDIT1:
        ldrsh   r3, [r2]
        sub     r12, r11, r3
        ldrsh   r3, [r2, #2]
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        mul     lr, r12, r12
        sub     r3, r10, r3
        mov     r12, r3, lsl #16
        ldrsh   r3, [r2, #4]
        mov     r12, r12, asr #16
        mla     lr, r12, r12, lr
        add     r2, r2, #8
        sub     r3, r9, r3
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
        mla     lr, r3, r3, lr
        cmp     lr, r0
        movlt   r0, lr
        movlt   r8, r7
        add     r7, r7, #1
        cmp     r7, #0x40
        blt     LDIT1
        ldr     r3, [pc, #0x200]
        mov     r2, #3
        add     r0, r3, r8, lsl #3
        bl      _ippsCopy_16s
        strh    r8, [r5, #2]
        ldr     r2, [pc, #0x1F0]
        ldrsh   r10, [r4, #0xA]
        ldrsh   r9, [r4, #0xC]
        ldrsh   r8, [r4, #0xE]
        mov     r0, #0
        add     r1, r4, #0xA
        mov     r7, r0
        mov     r11, r6
LDIT2:
        ldrsh   r3, [r2]
        sub     r12, r10, r3
        ldrsh   r3, [r2, #2]
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        mul     lr, r12, r12
        sub     r3, r9, r3
        mov     r12, r3, lsl #16
        ldrsh   r3, [r2, #4]
        mov     r12, r12, asr #16
        mla     lr, r12, r12, lr
        add     r2, r2, #8
        sub     r3, r8, r3
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
        mla     lr, r3, r3, lr
        cmp     lr, r11
        movlt   r11, lr
        movlt   r7, r0
        add     r0, r0, #1
        cmp     r0, #0x40
        blt     LDIT2
        ldr     r3, [pc, #0x178]
        mov     r2, #3
        add     r0, r3, r7, lsl #3
        bl      _ippsCopy_16s
        strh    r7, [r5, #4]
        ldr     r0, [pc, #0x168]
        ldrsh   r10, [r4, #0x10]
        ldrsh   r9, [r4, #0x12]
        ldrsh   r8, [r4, #0x14]
        ldrsh   lr, [r4, #0x16]
        mov     r11, #0
        add     r1, r4, #0x10
        mov     r7, r11
LDIT3:
        ldrsh   r3, [r0]
        sub     r12, r10, r3
        ldrsh   r3, [r0, #2]
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        mul     r2, r12, r12
        sub     r3, r9, r3
        mov     r12, r3, lsl #16
        ldrsh   r3, [r0, #4]
        mov     r12, r12, asr #16
        mla     r12, r12, r12, r2
        sub     r3, r8, r3
        mov     r2, r3, lsl #16
        ldrsh   r3, [r0, #6]
        mov     r2, r2, asr #16
        mla     r12, r2, r2, r12
        add     r0, r0, #8
        sub     r3, lr, r3
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
        mla     r12, r3, r3, r12
        cmp     r12, r6
        movlt   r6, r12
        movlt   r7, r11
        add     r11, r11, #1
        cmp     r11, #0x20
        blt     LDIT3
        ldr     r3, [pc, #0xDC]
        mov     r2, #4
        add     r0, r3, r7, lsl #3
        bl      _ippsCopy_16s
        strh    r7, [r5, #6]
        ldr     r0, [pc, #0xCC]
        ldrsh   r9, [r4, #0x18]
        ldrsh   r8, [r4, #0x1A]
        ldrsh   r7, [r4, #0x1C]
        ldrsh   lr, [r4, #0x1E]
        mov     r11, #0
        add     r1, r4, #0x18
        mov     r6, r11
        mvn     r10, #2, 2
LDIT4:
        ldrsh   r3, [r0]
        sub     r12, r9, r3
        ldrsh   r3, [r0, #2]
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        mul     r2, r12, r12
        sub     r3, r8, r3
        mov     r12, r3, lsl #16
        ldrsh   r3, [r0, #4]
        mov     r12, r12, asr #16
        mla     r12, r12, r12, r2
        sub     r3, r7, r3
        mov     r2, r3, lsl #16
        ldrsh   r3, [r0, #6]
        mov     r2, r2, asr #16
        mla     r12, r2, r2, r12
        add     r0, r0, #8
        sub     r3, lr, r3
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
        mla     r12, r3, r3, r12
        cmp     r12, r10
        movlt   r10, r12
        movlt   r6, r11
        add     r11, r11, #1
        cmp     r11, #0x20
        blt     LDIT4
        ldr     r3, [pc, #0x3C]
        mov     r2, #4
        add     r0, r3, r6, lsl #3
        bl      _ippsCopy_16s
        strh    r6, [r5, #8]
        mov     r0, r5
        mov     r1, r4
        bl      _ippsISFQuantDecodeDTX_AMRWB_16s
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LDIT5:
        mvn     r0, #7
        ldmia   sp!, {r4 - r11, pc}
        .long   meanISFnoiseTbl
        .long   QCdbk1ISFnoiseTbl
        .long   QCdbk2ISFnoiseTbl
        .long   QCdbk3ISFnoiseTbl
        .long   QCdbk4ISFnoiseTbl
        .long   QCdbk5ISFnoiseTbl


