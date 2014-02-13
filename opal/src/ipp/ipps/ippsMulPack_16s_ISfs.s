        .text
        .align  4
        .globl  _ippsMulPack_16s_ISfs


_ippsMulPack_16s_ISfs:
        stmdb   sp!, {r4 - r11, lr}
        cmp     r0, #0
        beq     LBFH17
        cmp     r1, #0
        beq     LBFH17
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r11, pc}
        ldrsh   r4, [r1]
        ldrsh   r12, [r0]
        cmp     r3, #0
        mvn     lr, #0xFF
        bic     lr, lr, #0x7F, 24
        mul     r4, r12, r4
        mov     r12, #0
        blt     LBFH16
        cmp     r3, #0
        movgt   r4, r4, asr r3
LBFH0:
        mvn     r5, lr
        cmp     r4, r5
        movlt   r5, r4
        sub     r4, r12, #2, 18
        cmp     r5, r4
        movgt   r4, r5
        tst     r2, #1
        strh    r4, [r1]
        subne   r2, r2, #1
        bne     LBFH2
        mov     r5, r2, lsl #1
        sub     r7, r0, #2
        sub     r4, r1, #2
        ldrsh   r6, [r4, +r5]
        ldrsh   r7, [r7, +r5]
        cmp     r3, #0
        mul     r6, r7, r6
        blt     LBFH15
        cmp     r3, #0
        movgt   r6, r6, asr r3
LBFH1:
        mvn     r7, lr
        cmp     r6, r7
        movlt   r7, r6
        sub     r6, r12, #2, 18
        cmp     r7, r6
        movgt   r6, r7
        strh    r6, [r4, +r5]
        sub     r2, r2, #2
LBFH2:
        cmp     r3, #0
        mov     r2, r2, asr #1
        add     r0, r0, #2
        add     r1, r1, #2
        bne     LBFH6
        cmp     r2, #0
        ble     LBFH14
        mvn     lr, lr
        mov     r3, r12
LBFH3:
        ldrsh   r5, [r0]
        ldrsh   r8, [r1, #2]
        ldrsh   r6, [r1]
        ldrsh   r7, [r0, #2]
        mul     r4, r5, r8
        mul     r5, r5, r6
        mul     r8, r8, r7
        mul     r6, r7, r6
        cmp     r4, #1, 2
        sub     r5, r5, r8
        moveq   r6, r12
        cmp     lr, r5
        add     r6, r4, r6
        strlth  lr, [r1]
        blt     LBFH4
        cmn     r5, #2, 18
        sub     r4, r12, #2, 18
        movlt   r5, r4
        strh    r5, [r1]
LBFH4:
        cmp     lr, r6
        strlth  lr, [r1, #2]
        blt     LBFH5
        cmn     r6, #2, 18
        sub     r4, r12, #2, 18
        movlt   r6, r4
        strh    r6, [r1, #2]
LBFH5:
        add     r3, r3, #1
        cmp     r3, r2
        add     r1, r1, #4
        add     r0, r0, #4
        blt     LBFH3
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LBFH6:
        cmp     r3, #0
        ble     LBFH10
        cmp     r2, #0
        ble     LBFH14
        mvn     lr, lr
        mov     r6, r12
        sub     r5, r3, #1
LBFH7:
        ldrsh   r4, [r0]
        ldrsh   r10, [r1, #2]
        ldrsh   r7, [r1]
        ldrsh   r8, [r0, #2]
        mul     r9, r4, r7
        mul     r4, r4, r10
        mul     r10, r10, r8
        mul     r8, r8, r7
        cmp     r4, #1, 2
        sub     r9, r9, r10
        mov     r7, r9, asr r3
        sub     r8, r8, #1
        moveq   r8, r12
        add     r8, r4, r8
        and     r4, r8, #1
        add     r8, r4, r8, asr #1
        cmp     lr, r7
        mov     r4, r8, asr r5
        strlth  lr, [r1]
        blt     LBFH8
        cmn     r7, #2, 18
        sub     r8, r12, #2, 18
        movlt   r7, r8
        strh    r7, [r1]
LBFH8:
        cmp     lr, r4
        strlth  lr, [r1, #2]
        blt     LBFH9
        cmn     r4, #2, 18
        sub     r7, r12, #2, 18
        movlt   r4, r7
        strh    r4, [r1, #2]
LBFH9:
        add     r6, r6, #1
        cmp     r6, r2
        add     r1, r1, #4
        add     r0, r0, #4
        blt     LBFH7
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LBFH10:
        rsb     r5, r3, #0
        cmp     r5, #0x10
        movge   r4, r12
        sublt   r3, r12, #2, 18
        movlt   r4, r3, asr r5
        cmp     r2, #0
        mvn     r10, lr
        ble     LBFH14
        mvn     r3, lr
        sub     r6, r12, #2, 18
LBFH11:
        ldrsh   lr, [r0]
        ldrsh   r11, [r1, #2]
        ldrsh   r7, [r1]
        ldrsh   r8, [r0, #2]
        mul     r9, lr, r11
        mul     lr, lr, r7
        mul     r11, r11, r8
        mul     r7, r8, r7
        cmp     r9, #1, 2
        sub     lr, lr, r11
        moveq   r7, #0
        cmp     lr, r10, asr r5
        add     r7, r9, r7
        strgth  r3, [r1]
        bgt     LBFH12
        cmp     lr, r4
        movge   lr, lr, lsl r5
        strgeh  lr, [r1]
        strlth  r6, [r1]
LBFH12:
        cmp     r7, r10, asr r5
        strgth  r3, [r1, #2]
        bgt     LBFH13
        cmp     r7, r4
        movge   r7, r7, lsl r5
        strgeh  r7, [r1, #2]
        strlth  r6, [r1, #2]
LBFH13:
        add     r12, r12, #1
        cmp     r12, r2
        add     r1, r1, #4
        add     r0, r0, #4
        blt     LBFH11
LBFH14:
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LBFH15:
        mvn     r7, lr
        cmp     r6, r7
        movlt   r7, r6
        sub     r6, r12, #2, 18
        cmp     r7, r6
        movgt   r6, r7
        rsb     r7, r3, #0
        mov     r6, r6, lsl r7
        b       LBFH1
LBFH16:
        mvn     r5, lr
        cmp     r4, r5
        movlt   r5, r4
        sub     r4, r12, #2, 18
        cmp     r5, r4
        movgt   r4, r5
        rsb     r5, r3, #0
        mov     r4, r4, lsl r5
        b       LBFH0
LBFH17:
        mvn     r0, #7
        ldmia   sp!, {r4 - r11, pc}


