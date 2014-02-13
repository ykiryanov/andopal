        .text
        .align  4
        .globl  _ippsAddC_16s_ISfs


_ippsAddC_16s_ISfs:
        stmdb   sp!, {r4 - r11, lr}
        cmp     r3, #0x10
        bgt     LDCR16
        cmp     r1, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r11, pc}
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r11, pc}
        mvn     r12, #0xFF
        cmp     r3, #0
        bic     r12, r12, #0x7F, 24
        mov     lr, #0
        bne     LDCR0
        cmp     r0, #0
        moveq   r0, #0
        ldmeqia sp!, {r4 - r11, pc}
        b       LDCR4
LDCR0:
        cmn     r3, #0xF
        bge     LDCR3
        cmp     r2, #0
        ble     LDCR2
LDCR1:
        ldrsh   r3, [r1]
        add     r3, r0, r3
        cmp     r3, #0
        mvngt   r3, r12
        cmp     r3, #0
        sublt   r3, lr, #2, 18
        strh    r3, [r1], #2
        subs    r2, r2, #1
        bne     LDCR1
LDCR2:
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LDCR3:
        cmp     r3, #0
        bne     LDCR8
LDCR4:
        cmp     r0, #0
        ble     LDCR17
        cmp     r2, #6
        blt     LDCR6
        sub     r6, r2, #6
        mvn     r5, r12
        mov     r4, r1
LDCR5:
        ldrsh   r8, [r4]
        ldrsh   r7, [r4, #2]
        ldrsh   r3, [r4, #4]
        add     r8, r0, r8
        cmp     r8, r5
        mov     r9, r5
        movlt   r9, r8
        add     r7, r0, r7
        cmp     r7, r5
        mov     r8, r5
        movlt   r8, r7
        ldrsh   r7, [r4, #6]
        add     r3, r0, r3
        strh    r8, [r4, #2]
        cmp     r3, r5
        mov     r8, r5
        movlt   r8, r3
        ldrsh   r3, [r4, #8]
        add     r7, r0, r7
        strh    r8, [r4, #4]
        cmp     r7, r5
        mov     r8, r5
        movlt   r8, r7
        add     r3, r0, r3
        cmp     r3, r5
        mov     r7, r5
        movlt   r7, r3
        add     lr, lr, #5
        strh    r9, [r4]
        strh    r8, [r4, #6]
        strh    r7, [r4, #8]
        cmp     lr, r6
        add     r4, r4, #0xA
        ble     LDCR5
LDCR6:
        mvn     r12, r12
        add     r1, r1, lr, lsl #1
LDCR7:
        ldrsh   r3, [r1]
        add     lr, lr, #1
        mov     r4, r12
        add     r3, r0, r3
        cmp     r3, r12
        movlt   r4, r3
        strh    r4, [r1], #2
        cmp     lr, r2
        blt     LDCR7
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LDCR8:
        cmp     r3, #0
        ble     LDCR12
        sub     r12, r3, #1
        mov     r4, #1
        mov     r12, r4, lsl r12
        cmp     r2, #5
        sub     r6, r12, #1
        blt     LDCR10
        sub     r8, r2, #5
        mov     r7, r1
LDCR9:
        ldrsh   r12, [r7]
        ldrsh   r4, [r7, #2]
        ldrsh   r5, [r7, #4]
        ldrsh   r9, [r7, #6]
        add     r12, r0, r12
        mov     r10, r12, asr r3
        and     r10, r10, #1
        add     r12, r6, r12
        add     r10, r12, r10
        mov     r12, r10, asr r3
        add     r4, r0, r4
        strh    r12, [r7]
        mov     r12, r4, asr r3
        and     r12, r12, #1
        add     r4, r6, r4
        add     r12, r4, r12
        mov     r12, r12, asr r3
        add     r5, r0, r5
        add     r9, r0, r9
        strh    r12, [r7, #2]
        mov     r12, r5, asr r3
        mov     r4, r9, asr r3
        and     r12, r12, #1
        and     r4, r4, #1
        add     r5, r6, r5
        add     r9, r6, r9
        add     r12, r5, r12
        add     r4, r9, r4
        mov     r12, r12, asr r3
        mov     r4, r4, asr r3
        add     lr, lr, #4
        strh    r12, [r7, #4]
        strh    r4, [r7, #6]
        cmp     lr, r8
        add     r7, r7, #8
        ble     LDCR9
LDCR10:
        add     r1, r1, lr, lsl #1
LDCR11:
        ldrsh   r12, [r1]
        add     lr, lr, #1
        cmp     lr, r2
        add     r12, r0, r12
        mov     r4, r12, asr r3
        and     r4, r4, #1
        add     r12, r6, r12
        add     r4, r12, r4
        mov     r12, r4, asr r3
        strh    r12, [r1], #2
        blt     LDCR11
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LDCR12:
        cmp     r2, #5
        rsb     r3, r3, #0
        movlt   r8, lr
        blt     LDCR14
        mov     r8, lr
        sub     r7, r2, #5
        sub     r6, lr, #2, 18
        mvn     r5, r12
        mov     r4, r1
LDCR13:
        ldrsh   r9, [r4]
        ldrsh   r10, [r4, #2]
        add     r8, r8, #4
        add     r9, r0, r9
        mov     r11, r9, lsl r3
        cmp     r11, r5
        mov     r9, r5
        movlt   r9, r11
        cmp     r9, r6
        mov     r11, r6
        add     r10, r0, r10
        movgt   r11, r9
        mov     r10, r10, lsl r3
        cmp     r10, r5
        mov     r9, r5
        movlt   r9, r10
        cmp     r9, r6
        mov     r10, r6
        movgt   r10, r9
        ldrsh   r9, [r4, #4]
        strh    r11, [r4]
        strh    r10, [r4, #2]
        ldrsh   r10, [r4, #6]
        add     r9, r0, r9
        mov     r11, r9, lsl r3
        cmp     r11, r5
        mov     r9, r5
        movlt   r9, r11
        cmp     r9, r6
        mov     r11, r6
        add     r10, r0, r10
        movgt   r11, r9
        mov     r10, r10, lsl r3
        cmp     r10, r5
        mov     r9, r5
        movlt   r9, r10
        cmp     r9, r6
        mov     r10, r6
        movgt   r10, r9
        strh    r11, [r4, #4]
        strh    r10, [r4, #6]
        cmp     r8, r7
        add     r4, r4, #8
        ble     LDCR13
LDCR14:
        sub     lr, lr, #2, 18
        mvn     r12, r12
        add     r1, r1, r8, lsl #1
LDCR15:
        ldrsh   r4, [r1]
        add     r8, r8, #1
        add     r4, r0, r4
        mov     r5, r4, lsl r3
        cmp     r5, r12
        mov     r4, r12
        movlt   r4, r5
        cmp     r4, lr
        mov     r5, lr
        movgt   r5, r4
        strh    r5, [r1], #2
        cmp     r8, r2
        blt     LDCR15
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LDCR16:
        mov     r0, r1
        mov     r1, r2
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsZero_16s
LDCR17:
        cmp     r2, #6
        movlt   r12, lr
        blt     LDCR19
        mov     r12, lr
        sub     r6, r2, #6
        sub     r5, lr, #2, 18
        mov     r4, r1
LDCR18:
        ldrsh   r8, [r4]
        ldrsh   r7, [r4, #2]
        ldrsh   r3, [r4, #4]
        add     r8, r0, r8
        cmp     r8, r5
        mov     r9, r5
        movgt   r9, r8
        add     r7, r0, r7
        cmp     r7, r5
        mov     r8, r5
        movgt   r8, r7
        ldrsh   r7, [r4, #6]
        add     r3, r0, r3
        strh    r8, [r4, #2]
        cmp     r3, r5
        mov     r8, r5
        movgt   r8, r3
        ldrsh   r3, [r4, #8]
        add     r7, r0, r7
        strh    r8, [r4, #4]
        cmp     r7, r5
        mov     r8, r5
        movgt   r8, r7
        add     r3, r0, r3
        cmp     r3, r5
        mov     r7, r5
        movgt   r7, r3
        add     r12, r12, #5
        strh    r9, [r4]
        strh    r8, [r4, #6]
        strh    r7, [r4, #8]
        cmp     r12, r6
        add     r4, r4, #0xA
        ble     LDCR18
LDCR19:
        sub     lr, lr, #2, 18
        add     r1, r1, r12, lsl #1
LDCR20:
        ldrsh   r3, [r1]
        add     r12, r12, #1
        mov     r4, lr
        add     r3, r0, r3
        cmp     r3, lr
        movgt   r4, r3
        strh    r4, [r1], #2
        cmp     r12, r2
        blt     LDCR20
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}


