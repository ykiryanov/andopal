        .text
        .align  4
        .globl  _ippsSub_16s_ISfs


_ippsSub_16s_ISfs:
        stmdb   sp!, {r4 - r10, lr}
        cmp     r3, #0x10
        ble     LATB0
        cmp     r0, #0
        beq     LATB15
        mov     r0, r1
        mov     r1, r2
        ldmia   sp!, {r4 - r10, lr}
        b       _ippsZero_16s
LATB0:
        cmp     r0, #0
        beq     LATB15
        cmp     r1, #0
        beq     LATB15
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r10, pc}
        mvn     r12, #0xFF
        cmn     r3, #0xF
        bic     r12, r12, #0x7F, 24
        mov     lr, #0
        bge     LATB3
        cmp     r2, #0
        ble     LATB2
LATB1:
        ldrsh   r4, [r1]
        ldrsh   r3, [r0], #2
        sub     r4, r4, r3
        cmp     r4, #0
        mvngt   r4, r12
        cmp     r4, #0
        sublt   r4, lr, #2, 18
        strh    r4, [r1], #2
        subs    r2, r2, #1
        bne     LATB1
LATB2:
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LATB3:
        cmp     r3, #0
        bne     LATB7
        cmp     r2, #5
        movlt   r8, lr
        blt     LATB5
        mov     r8, lr
        sub     r7, r2, #5
        sub     r6, lr, #2, 18
        mvn     r5, r12
        mov     r4, r1
        mov     r3, r0
LATB4:
        ldrsh   r10, [r4]
        ldrsh   r9, [r3]
        add     r8, r8, #4
        sub     r10, r10, r9
        cmp     r10, r5
        mov     r9, r5
        movlt   r9, r10
        mov     r10, r6
        cmp     r9, r6
        movgt   r10, r9
        strh    r10, [r4]
        ldrsh   r10, [r4, #2]
        ldrsh   r9, [r3, #2]
        sub     r10, r10, r9
        cmp     r10, r5
        mov     r9, r5
        movlt   r9, r10
        cmp     r9, r6
        mov     r10, r6
        movgt   r10, r9
        strh    r10, [r4, #2]
        ldrsh   r10, [r4, #4]
        ldrsh   r9, [r3, #4]
        sub     r10, r10, r9
        cmp     r10, r5
        mov     r9, r5
        movlt   r9, r10
        cmp     r9, r6
        mov     r10, r6
        movgt   r10, r9
        strh    r10, [r4, #4]
        ldrsh   r10, [r4, #6]
        ldrsh   r9, [r3, #6]
        add     r3, r3, #8
        sub     r10, r10, r9
        cmp     r10, r5
        mov     r9, r5
        movlt   r9, r10
        cmp     r9, r6
        mov     r10, r6
        movgt   r10, r9
        strh    r10, [r4, #6]
        cmp     r8, r7
        add     r4, r4, #8
        ble     LATB4
LATB5:
        sub     lr, lr, #2, 18
        mvn     r12, r12
        add     r1, r1, r8, lsl #1
        add     r0, r0, r8, lsl #1
LATB6:
        ldrsh   r4, [r0], #2
        ldrsh   r3, [r1]
        add     r8, r8, #1
        sub     r4, r3, r4
        cmp     r4, r12
        mov     r3, r12
        movlt   r3, r4
        cmp     r3, lr
        mov     r4, lr
        movgt   r4, r3
        strh    r4, [r1], #2
        cmp     r8, r2
        blt     LATB6
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LATB7:
        cmp     r3, #0
        ble     LATB11
        sub     r4, r3, #1
        mov     r5, #1
        mov     r4, r5, lsl r4
        cmp     r2, #4
        sub     r4, r4, #1
        blt     LATB9
        sub     r8, r2, #4
        mvn     r7, r12
        mov     r6, r1
        mov     r5, r0
LATB8:
        ldrsh   r10, [r6]
        ldrsh   r9, [r5]
        add     lr, lr, #3
        sub     r9, r10, r9
        mov     r10, r9, asr r3
        and     r10, r10, #1
        add     r9, r4, r9
        add     r10, r9, r10
        mov     r9, r10, asr r3
        cmp     r9, r7
        mov     r10, r7
        movlt   r10, r9
        strh    r10, [r6]
        ldrsh   r9, [r5, #2]
        ldrsh   r10, [r6, #2]
        sub     r9, r10, r9
        mov     r10, r9, asr r3
        and     r10, r10, #1
        add     r9, r4, r9
        add     r10, r9, r10
        mov     r9, r10, asr r3
        cmp     r9, r7
        mov     r10, r7
        movlt   r10, r9
        strh    r10, [r6, #2]
        ldrsh   r9, [r5, #4]
        ldrsh   r10, [r6, #4]
        add     r5, r5, #6
        sub     r9, r10, r9
        mov     r10, r9, asr r3
        and     r10, r10, #1
        add     r9, r4, r9
        add     r10, r9, r10
        mov     r9, r10, asr r3
        cmp     r9, r7
        mov     r10, r7
        movlt   r10, r9
        strh    r10, [r6, #4]
        cmp     lr, r8
        add     r6, r6, #6
        ble     LATB8
LATB9:
        mvn     r12, r12
        add     r1, r1, lr, lsl #1
        add     r0, r0, lr, lsl #1
LATB10:
        ldrsh   r5, [r1]
        ldrsh   r6, [r0], #2
        add     lr, lr, #1
        sub     r5, r5, r6
        mov     r6, r5, asr r3
        and     r6, r6, #1
        add     r5, r4, r5
        add     r6, r5, r6
        mov     r5, r6, asr r3
        cmp     r5, r12
        mov     r6, r12
        movlt   r6, r5
        strh    r6, [r1], #2
        cmp     lr, r2
        blt     LATB10
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LATB11:
        cmp     r2, #5
        rsb     r3, r3, #0
        blt     LATB13
        sub     r8, r2, #5
        sub     r7, lr, #2, 18
        mvn     r6, r12
        mov     r5, r1
        mov     r4, r0
LATB12:
        ldrsh   r9, [r4]
        ldrsh   r10, [r5]
        add     lr, lr, #4
        sub     r10, r10, r9
        mov     r10, r10, lsl r3
        cmp     r10, r6
        mov     r9, r6
        movlt   r9, r10
        cmp     r9, r7
        mov     r10, r7
        movgt   r10, r9
        strh    r10, [r5]
        ldrsh   r10, [r5, #2]
        ldrsh   r9, [r4, #2]
        sub     r10, r10, r9
        mov     r10, r10, lsl r3
        cmp     r10, r6
        mov     r9, r6
        movlt   r9, r10
        cmp     r9, r7
        mov     r10, r7
        movgt   r10, r9
        strh    r10, [r5, #2]
        ldrsh   r10, [r5, #4]
        ldrsh   r9, [r4, #4]
        sub     r10, r10, r9
        mov     r10, r10, lsl r3
        cmp     r10, r6
        mov     r9, r6
        movlt   r9, r10
        cmp     r9, r7
        mov     r10, r7
        movgt   r10, r9
        strh    r10, [r5, #4]
        ldrsh   r10, [r5, #6]
        ldrsh   r9, [r4, #6]
        add     r4, r4, #8
        sub     r10, r10, r9
        mov     r10, r10, lsl r3
        cmp     r10, r6
        mov     r9, r6
        movlt   r9, r10
        cmp     r9, r7
        mov     r10, r7
        movgt   r10, r9
        strh    r10, [r5, #6]
        cmp     lr, r8
        add     r5, r5, #8
        ble     LATB12
LATB13:
        mov     r4, #0
        sub     r4, r4, #2, 18
        mvn     r12, r12
        add     r1, r1, lr, lsl #1
        add     r0, r0, lr, lsl #1
LATB14:
        ldrsh   r5, [r1]
        ldrsh   r6, [r0], #2
        add     lr, lr, #1
        sub     r5, r5, r6
        mov     r6, r5, lsl r3
        cmp     r6, r12
        mov     r5, r12
        movlt   r5, r6
        cmp     r5, r4
        mov     r6, r4
        movgt   r6, r5
        strh    r6, [r1], #2
        cmp     lr, r2
        blt     LATB14
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LATB15:
        mvn     r0, #7
        ldmia   sp!, {r4 - r10, pc}


