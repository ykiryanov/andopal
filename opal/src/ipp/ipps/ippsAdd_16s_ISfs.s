        .text
        .align  4
        .globl  _ippsAdd_16s_ISfs


_ippsAdd_16s_ISfs:
        stmdb   sp!, {r4 - r10, lr}
        cmp     r3, #0x10
        ble     LDCE0
        cmp     r0, #0
        beq     LDCE15
        mov     r0, r1
        mov     r1, r2
        ldmia   sp!, {r4 - r10, lr}
        b       _ippsZero_16s
LDCE0:
        cmp     r0, #0
        beq     LDCE15
        cmp     r1, #0
        beq     LDCE15
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r10, pc}
        mvn     r12, #0xFF
        cmn     r3, #0xF
        bic     r12, r12, #0x7F, 24
        mov     lr, #0
        bge     LDCE3
        cmp     r2, #0
        ble     LDCE2
LDCE1:
        ldrsh   r4, [r1]
        ldrsh   r3, [r0], #2
        add     r4, r3, r4
        cmp     r4, #0
        mvngt   r4, r12
        cmp     r4, #0
        sublt   r4, lr, #2, 18
        strh    r4, [r1], #2
        subs    r2, r2, #1
        bne     LDCE1
LDCE2:
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LDCE3:
        cmp     r3, #0
        bne     LDCE7
        cmp     r2, #5
        movlt   r8, lr
        blt     LDCE5
        mov     r8, lr
        sub     r7, r2, #5
        sub     r6, lr, #2, 18
        mvn     r5, r12
        mov     r4, r0
        mov     r3, r1
LDCE4:
        ldrsh   r9, [r3]
        ldrsh   r10, [r4]
        add     r8, r8, #4
        add     r10, r10, r9
        cmp     r10, r5
        mov     r9, r5
        movlt   r9, r10
        cmp     r9, r6
        mov     r10, r6
        movgt   r10, r9
        strh    r10, [r3]
        ldrsh   r10, [r4, #2]
        ldrsh   r9, [r3, #2]
        add     r10, r10, r9
        cmp     r10, r5
        mov     r9, r5
        movlt   r9, r10
        cmp     r9, r6
        mov     r10, r6
        movgt   r10, r9
        strh    r10, [r3, #2]
        ldrsh   r10, [r4, #4]
        ldrsh   r9, [r3, #4]
        add     r10, r10, r9
        cmp     r10, r5
        mov     r9, r5
        movlt   r9, r10
        cmp     r9, r6
        mov     r10, r6
        movgt   r10, r9
        strh    r10, [r3, #4]
        ldrsh   r10, [r4, #6]
        ldrsh   r9, [r3, #6]
        add     r4, r4, #8
        add     r10, r10, r9
        cmp     r10, r5
        mov     r9, r5
        movlt   r9, r10
        cmp     r9, r6
        mov     r10, r6
        movgt   r10, r9
        strh    r10, [r3, #6]
        cmp     r8, r7
        add     r3, r3, #8
        ble     LDCE4
LDCE5:
        sub     lr, lr, #2, 18
        mvn     r12, r12
        add     r0, r0, r8, lsl #1
        add     r1, r1, r8, lsl #1
LDCE6:
        ldrsh   r4, [r0], #2
        ldrsh   r3, [r1]
        add     r8, r8, #1
        add     r4, r4, r3
        cmp     r4, r12
        mov     r3, r12
        movlt   r3, r4
        cmp     r3, lr
        mov     r4, lr
        movgt   r4, r3
        strh    r4, [r1], #2
        cmp     r8, r2
        blt     LDCE6
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LDCE7:
        cmp     r3, #0
        ble     LDCE11
        sub     r12, r3, #1
        mov     r4, #1
        mov     r12, r4, lsl r12
        cmp     r2, #5
        sub     r12, r12, #1
        blt     LDCE9
        sub     r8, r2, #5
        mov     r7, r0
        mov     r6, r1
LDCE8:
        ldrsh   r4, [r7]
        ldrsh   r5, [r6]
        ldrsh   r9, [r6, #2]
        add     lr, lr, #4
        cmp     lr, r8
        add     r4, r4, r5
        mov     r5, r4, asr r3
        and     r5, r5, #1
        add     r4, r12, r4
        add     r5, r4, r5
        mov     r4, r5, asr r3
        strh    r4, [r6]
        ldrsh   r4, [r7, #2]
        ldrsh   r5, [r6, #4]
        add     r4, r4, r9
        mov     r9, r4, asr r3
        and     r9, r9, #1
        add     r4, r12, r4
        add     r9, r4, r9
        mov     r4, r9, asr r3
        strh    r4, [r6, #2]
        ldrsh   r9, [r7, #4]
        ldrsh   r4, [r6, #6]
        add     r5, r9, r5
        mov     r9, r5, asr r3
        and     r9, r9, #1
        add     r5, r12, r5
        add     r9, r5, r9
        mov     r5, r9, asr r3
        strh    r5, [r6, #4]
        ldrsh   r5, [r7, #6]
        add     r7, r7, #8
        add     r4, r5, r4
        mov     r5, r4, asr r3
        and     r5, r5, #1
        add     r4, r12, r4
        add     r5, r4, r5
        mov     r4, r5, asr r3
        strh    r4, [r6, #6]
        add     r6, r6, #8
        ble     LDCE8
LDCE9:
        add     r0, r0, lr, lsl #1
        add     r1, r1, lr, lsl #1
LDCE10:
        ldrsh   r4, [r0], #2
        ldrsh   r5, [r1]
        add     lr, lr, #1
        cmp     lr, r2
        add     r4, r4, r5
        mov     r5, r4, asr r3
        and     r5, r5, #1
        add     r4, r12, r4
        add     r5, r4, r5
        mov     r4, r5, asr r3
        strh    r4, [r1], #2
        blt     LDCE10
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LDCE11:
        cmp     r2, #5
        rsb     r3, r3, #0
        blt     LDCE13
        sub     r8, r2, #5
        sub     r7, lr, #2, 18
        mvn     r6, r12
        mov     r5, r0
        mov     r4, r1
LDCE12:
        ldrsh   r9, [r5]
        ldrsh   r10, [r4]
        add     lr, lr, #4
        add     r10, r9, r10
        mov     r10, r10, lsl r3
        cmp     r10, r6
        mov     r9, r6
        movlt   r9, r10
        cmp     r9, r7
        mov     r10, r7
        movgt   r10, r9
        strh    r10, [r4]
        ldrsh   r10, [r4, #2]
        ldrsh   r9, [r5, #2]
        add     r10, r9, r10
        mov     r10, r10, lsl r3
        cmp     r10, r6
        mov     r9, r6
        movlt   r9, r10
        cmp     r9, r7
        mov     r10, r7
        movgt   r10, r9
        strh    r10, [r4, #2]
        ldrsh   r10, [r4, #4]
        ldrsh   r9, [r5, #4]
        add     r10, r9, r10
        mov     r10, r10, lsl r3
        cmp     r10, r6
        mov     r9, r6
        movlt   r9, r10
        cmp     r9, r7
        mov     r10, r7
        movgt   r10, r9
        strh    r10, [r4, #4]
        ldrsh   r10, [r4, #6]
        ldrsh   r9, [r5, #6]
        add     r5, r5, #8
        add     r10, r9, r10
        mov     r10, r10, lsl r3
        cmp     r10, r6
        mov     r9, r6
        movlt   r9, r10
        cmp     r9, r7
        mov     r10, r7
        movgt   r10, r9
        strh    r10, [r4, #6]
        cmp     lr, r8
        add     r4, r4, #8
        ble     LDCE12
LDCE13:
        mov     r4, #0
        sub     r4, r4, #2, 18
        mvn     r12, r12
        add     r0, r0, lr, lsl #1
        add     r1, r1, lr, lsl #1
LDCE14:
        ldrsh   r5, [r1]
        ldrsh   r6, [r0], #2
        add     lr, lr, #1
        add     r5, r6, r5
        mov     r6, r5, lsl r3
        cmp     r6, r12
        mov     r5, r12
        movlt   r5, r6
        cmp     r5, r4
        mov     r6, r4
        movgt   r6, r5
        strh    r6, [r1], #2
        cmp     lr, r2
        blt     LDCE14
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LDCE15:
        mvn     r0, #7
        ldmia   sp!, {r4 - r10, pc}


