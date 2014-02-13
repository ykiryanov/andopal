        .text
        .align  4
        .globl  _ippsOpenLoopPitchSearch_G729A_16s


_ippsOpenLoopPitchSearch_G729A_16s:
        stmdb   sp!, {r4 - r7, lr}
        sub     sp, sp, #0x86, 30
        add     r3, sp, #8
        and     r3, r3, #0x1F
        rsb     r3, r3, #0
        add     r2, sp, #8
        and     r3, r3, #0x1F
        cmp     r0, #0
        add     r6, r2, r3
        mov     r4, r1
        beq     LDQT15
        cmp     r4, #0
        beq     LDQT15
        mov     r2, #0x1E
        orr     r2, r2, #1, 24
        sub     r7, r0, r2
        add     r3, sp, #0x82, 30
        mov     r0, r7
        mov     r2, #0xDF
        mov     r1, r7
        bl      _ippsDotProd_G729A_16s32s
        cmp     r0, #0xC
        add     r5, r6, #0x12, 28
        add     r2, r6, #2
        beq     LDQT14
        ldr     r3, [sp, #0x208]
        cmp     r3, #1, 12
        bge     LDQT0
        mov     r0, r7
        mov     r3, #0xDF
        mov     r1, #3
        bl      _ippsLShiftC_16s
        b       LDQT1
LDQT0:
        mov     r1, r2
        mov     r0, r7
        mov     r2, #0xDF
        bl      _ippsCopy_16s
LDQT1:
        add     r2, sp, #0x81, 30
        add     r12, sp, #0x7A, 30
        str     r2, [sp, #4]
        str     r12, [sp]
        mov     r3, #1
        mov     r2, #0x28
        mov     r1, #0x14
        mov     r0, r5
        bl      ownAutoCorrLagMax_G729A_16s
        add     r2, sp, #2, 24
        add     r12, sp, #0x7B, 30
        str     r2, [sp, #4]
        str     r12, [sp]
        mov     r3, #1
        mov     r2, #0x50
        mov     r1, #0x28
        mov     r0, r5
        bl      ownAutoCorrLagMax_G729A_16s
        add     r7, sp, #0x7A, 30
        add     r2, r7, #8
        add     r12, sp, #0x85, 30
        str     r2, [sp]
        str     r12, [sp, #4]
        mov     r3, #2
        mov     r2, #0x8F
        mov     r1, #0x50
        mov     r0, r5
        bl      ownAutoCorrLagMax_G729A_16s
        ldr     r2, [sp, #0x204]
        add     r3, sp, #0x7D, 30
        sub     r0, r5, r2, lsl #1
        mov     r1, r0
        mov     r2, #0x50
        bl      _ippsDotProd_G729A_16s32s
        add     r2, sp, #0x7D, 30
        ldr     r3, [r2]
        cmn     r3, #6, 2
        beq     LDQT2
        add     r2, sp, #0x7D, 30
        add     r3, r3, #1
        str     r3, [r2]
LDQT2:
        ldr     r2, [sp, #0x200]
        add     r6, sp, #0x7D, 30
        add     r3, r6, #4
        sub     r0, r5, r2, lsl #1
        mov     r1, r0
        mov     r2, #0x50
        bl      _ippsDotProd_G729A_16s32s
        ldr     r2, [r6, #4]
        cmn     r2, #6, 2
        addne   r2, r2, #1
        strne   r2, [r6, #4]
        ldr     r6, [sp, #0x214]
        add     r3, sp, #0x82, 30
        mov     r2, #0x50
        add     r12, r6, #1
        sub     r1, r5, r12, lsl #1
        mov     r0, r5
        bl      _ippsDotProd_G729A_16s32s
        ldr     r2, [sp, #0x208]
        ldr     r3, [r7, #8]
        cmp     r2, r3
        ldrle   r12, [sp, #0x214]
        ble     LDQT3
        ldr     r12, [sp, #0x214]
        str     r2, [r7, #8]
        add     r6, r12, #1
LDQT3:
        sub     r12, r12, #1
        add     r3, sp, #0x82, 30
        sub     r1, r5, r12, lsl #1
        mov     r2, #0x50
        mov     r0, r5
        bl      _ippsDotProd_G729A_16s32s
        ldr     r2, [sp, #0x208]
        ldr     r3, [r7, #8]
        cmp     r2, r3
        ble     LDQT4
        ldr     r3, [sp, #0x214]
        str     r2, [r7, #8]
        sub     r6, r3, #1
LDQT4:
        sub     r0, r5, r6, lsl #1
        add     r7, sp, #0x7D, 30
        add     r3, r7, #8
        mov     r1, r0
        str     r6, [sp, #0x214]
        mov     r2, #0x50
        bl      _ippsDotProd_G729A_16s32s
        ldr     r0, [r7, #8]
        cmn     r0, #6, 2
        addne   r0, r0, #1
        strne   r0, [r7, #8]
        add     r0, sp, #0x7D, 30
        mov     r1, #3
        bl      _ippsInvSqrt_32s_I
        add     r2, sp, #0x83, 30
        add     r1, sp, #0x7D, 30
        add     r0, sp, #0x7A, 30
        mov     r3, #3
        bl      ownMul_32s16s
        ldr     r5, [sp, #0x200]
        ldr     lr, [sp, #0x214]
        mov     r6, #0xFF
        orr     r0, r6, #0x7F, 24
        rsb     r2, lr, r5, lsl #1
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #16
        cmp     r2, #0
        bge     LDQT5
        cmn     r2, #2, 18
        moveq   r2, r0
        beq     LDQT5
        rsb     r2, r2, #0
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #16
LDQT5:
        cmp     r2, #5
        blt     LDQT7
        add     r2, r5, r5, lsl #1
        sub     r2, r2, lr
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #16
        cmp     r2, #0
        bge     LDQT6
        cmn     r2, #2, 18
        moveq   r2, r0
        beq     LDQT6
        rsb     r2, r2, #0
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #16
LDQT6:
        cmp     r2, #7
        bge     LDQT8
LDQT7:
        add     r3, sp, #0x83, 30
        add     r12, sp, #0x83, 30
        ldrsh   r2, [r12, #2]
        ldrsh   r3, [r3, #4]
        add     r2, r2, r3, asr #2
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #16
        strh    r2, [r12, #2]
        b       LDQT9
LDQT8:
        add     r2, sp, #0x83, 30
        add     r3, sp, #0x83, 30
        ldrsh   r2, [r2, #2]
        ldrsh   r3, [r3, #4]
LDQT9:
        ldr     r12, [sp, #0x204]
        rsb     r6, r5, r12, lsl #1
        mov     r6, r6, lsl #16
        mov     r6, r6, asr #16
        cmp     r6, #0
        bge     LDQT10
        cmn     r6, #2, 18
        moveq   r6, r0
        beq     LDQT10
        rsb     r6, r6, #0
        mov     r6, r6, lsl #16
        mov     r6, r6, asr #16
LDQT10:
        cmp     r6, #5
        blt     LDQT12
        add     r6, r12, r12, lsl #1
        sub     r6, r6, r5
        mov     r6, r6, lsl #16
        mov     r6, r6, asr #16
        cmp     r6, #0
        bge     LDQT11
        cmn     r6, #2, 18
        moveq   r6, r0
        beq     LDQT11
        rsb     r6, r6, #0
        mov     r6, r6, lsl #16
        mov     r6, r6, asr #16
LDQT11:
        cmp     r6, #7
        addge   r0, sp, #0x83, 30
        ldrgesh r0, [r0]
        bge     LDQT13
LDQT12:
        mov     r6, #0x9A
        orr     r6, r6, #0x19, 24
        mul     r6, r2, r6
        add     r0, sp, #0x83, 30
        ldrsh   r0, [r0]
        add     r6, r0, r6, asr #15
        mov     r0, r6, lsl #16
        mov     r0, r0, asr #16
LDQT13:
        cmp     r0, r2
        movlt   r12, r5
        movlt   r0, r2
        cmp     r0, r3
        movlt   r12, lr
        mov     r0, #0
        strh    r12, [r4]
        add     sp, sp, #0x86, 30
        ldmia   sp!, {r4 - r7, pc}
LDQT14:
        mov     r0, r7
        mov     r3, #0xDF
        mov     r1, #3
        bl      _ippsRShiftC_16s
        b       LDQT1
LDQT15:
        mvn     r0, #7
        add     sp, sp, #0x86, 30
        ldmia   sp!, {r4 - r7, pc}


