        .text
        .align  4
        .globl  _ippsGainControl_G723_16s_I


_ippsGainControl_G723_16s_I:
        stmdb   sp!, {r1, r4 - r11, lr}
        mov     r4, r1
        cmp     r4, #0
        mov     r5, r0
        mov     r6, r2
        beq     LDVT11
        cmp     r6, #0
        beq     LDVT11
        cmp     r5, #0
        blt     LDVT10
        ldrsh   r7, [r6]
        mov     r3, sp
        mov     r2, #2
        mov     r1, #0x3C
        mov     r0, r4
        bl      _ippsSumSquare_NS_16s32s_Sfs
        ldr     r3, [sp]
        cmn     r3, #7, 2
        movle   r3, r3, lsl #1
        mvngt   r3, #2, 2
        cmp     r3, #0
        mov     r8, #0
        beq     LDVT6
        cmp     r5, #0
        beq     LDVT6
        ldr     r9, [pc, #0x2CC]
        ldr     lr, [pc, #0x2CC]
        cmp     r3, #0
        moveq   r12, #0
        beq     LDVT2
        movs    r12, r3, asr #16
        bne     LDVT0
        bic     r12, r3, #0xFF, 8
        bic     r12, r12, #0xFF, 16
        movs    r10, r12, asr #8
        movne   r12, r10, lsl #1
        movne   r10, r9
        moveq   r12, r12, lsl #1
        moveq   r10, lr
        ldrsh   r12, [r10, +r12]
        add     r12, r12, #0x10
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        b       LDVT1
LDVT0:
        bic     r12, r12, #0xFF, 8
        bic     r12, r12, #0xFF, 16
        movs    r10, r12, asr #8
        movne   r10, r10, lsl #1
        ldrnesh r12, [r9, +r10]
        moveq   r12, r12, lsl #1
        ldreqsh r12, [lr, +r12]
LDVT1:
        mov     r3, r3, lsl r12
LDVT2:
        cmp     r5, #0
        mov     r11, r5
        moveq   lr, #0
        beq     LDVT5
        cmn     r5, #1
        moveq   r5, #2, 2
        moveq   lr, #0x1F
        beq     LDVT5
        cmp     r5, #0
        mvnlt   r11, r5
        cmp     r11, #0
        moveq   lr, #0
        beq     LDVT4
        movs    r10, r11, lsr #16
        bne     LDVT3
        bic     r11, r11, #0xFF, 8
        bic     r10, r11, #0xFF, 16
        movs    r11, r10, asr #8
        movne   r10, r11, lsl #1
        movne   lr, r9
        moveq   r10, r10, lsl #1
        ldrsh   r10, [lr, +r10]
        add     lr, r10, #0x10
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        b       LDVT4
LDVT3:
        movs    r11, r11, lsr #24
        movne   r11, r11, lsl #1
        ldrnesh lr, [r9, +r11]
        moveq   r10, r10, lsl #1
        ldreqsh lr, [lr, +r10]
LDVT4:
        mov     r5, r5, lsl lr
LDVT5:
        sub     lr, r12, lr
        mov     r12, r3, asr #16
        add     r3, lr, #1
        mov     r12, r12, lsl #16
        mov     r0, r5, asr #2
        mov     r1, r12, asr #16
        rsb     r3, r3, #6
        mov     r5, r3, lsl #16
        bl      __intel_idiv
        mov     r5, r5, asr #16
        cmp     r5, #0
        mov     r3, r8
        movgt   r3, r5
        rsb     r3, r3, #0xF
        mov     r0, r0, lsl #16
        mov     r12, r0, asr #16
        mov     r3, r12, lsl r3
        cmp     r3, #1, 4
        movlt   r12, #0
        movge   r12, #1, 18
        add     lr, r12, #2, 20
        mul     r5, lr, lr
        cmp     r3, r5
        movge   r12, lr
        add     lr, r12, #1, 20
        mul     r5, lr, lr
        cmp     r3, r5
        movge   r12, lr
        add     lr, r12, #2, 22
        mul     r5, lr, lr
        cmp     r3, r5
        movge   lr, lr, lsl #16
        movge   r12, lr, asr #16
        add     lr, r12, #1, 22
        mul     r5, lr, lr
        cmp     r3, r5
        movge   lr, lr, lsl #16
        movge   r12, lr, asr #16
        add     lr, r12, #2, 24
        mul     r5, lr, lr
        cmp     r3, r5
        movge   lr, lr, lsl #16
        movge   r12, lr, asr #16
        add     lr, r12, #1, 24
        mul     r5, lr, lr
        cmp     r3, r5
        movge   lr, lr, lsl #16
        movge   r12, lr, asr #16
        add     lr, r12, #0x80
        mul     r5, lr, lr
        cmp     r3, r5
        movge   lr, lr, lsl #16
        movge   r12, lr, asr #16
        add     lr, r12, #0x40
        mul     r5, lr, lr
        cmp     r3, r5
        movge   lr, lr, lsl #16
        movge   r12, lr, asr #16
        add     lr, r12, #0x20
        mul     r5, lr, lr
        cmp     r3, r5
        movge   lr, lr, lsl #16
        movge   r12, lr, asr #16
        add     lr, r12, #0x10
        mul     r5, lr, lr
        cmp     r3, r5
        movge   lr, lr, lsl #16
        movge   r12, lr, asr #16
        add     lr, r12, #8
        mul     r5, lr, lr
        cmp     r3, r5
        movge   lr, lr, lsl #16
        movge   r12, lr, asr #16
        add     lr, r12, #4
        mul     r5, lr, lr
        cmp     r3, r5
        movge   lr, lr, lsl #16
        movge   r12, lr, asr #16
        add     lr, r12, #2
        mul     r5, lr, lr
        cmp     r3, r5
        movge   lr, lr, lsl #16
        movge   r12, lr, asr #16
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        b       LDVT7
LDVT6:
        mov     r12, #1, 20
LDVT7:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r5, r3
        mov     lr, #0x3C
LDVT8:
        add     r9, r12, r7, lsl #4
        sub     r9, r9, r7
        add     r7, r9, #8
        ldrsh   r9, [r4]
        mov     r7, r7, asr #4
        mov     r7, r7, lsl #16
        mov     r7, r7, asr #16
        add     r10, r7, r7, asr #4
        mov     r10, r10, lsl #16
        mov     r10, r10, asr #16
        mul     r9, r10, r9
        add     r9, r9, #1, 22
        mov     r9, r9, asr #11
        cmp     r5, r9
        sublt   r9, r8, #2, 18
        mvnlt   r9, r9
        blt     LDVT9
        cmn     r9, #2, 18
        movge   r9, r9, lsl #16
        movge   r9, r9, asr #16
        movlt   r9, r3
LDVT9:
        strh    r9, [r4], #2
        subs    lr, lr, #1
        bne     LDVT8
        mov     r0, #0
        strh    r7, [r6]
        ldmia   sp!, {r1, r4 - r11, pc}
LDVT10:
        mvn     r0, #4
        ldmia   sp!, {r1, r4 - r11, pc}
LDVT11:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r11, pc}
        .long   NormTable
        .long   NormTable2


