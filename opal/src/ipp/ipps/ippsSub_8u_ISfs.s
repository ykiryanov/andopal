        .text
        .align  4
        .globl  _ippsSub_8u_ISfs


_ippsSub_8u_ISfs:
        stmdb   sp!, {r4 - r10, lr}
        cmp     r3, #8
        ble     LAST0
        cmp     r0, #0
        beq     LAST15
        mov     r0, r1
        mov     r1, r2
        ldmia   sp!, {r4 - r10, lr}
        b       _ippsZero_8u
LAST0:
        cmp     r0, #0
        beq     LAST15
        cmp     r1, #0
        beq     LAST15
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r10, pc}
        cmp     r3, #0
        mov     r12, #0
        bne     LAST4
        cmp     r2, #5
        movlt   r6, #0
        blt     LAST2
        mov     r6, #0
        sub     r5, r2, #5
        mov     r4, r6
        sub     lr, r1, #1
        sub     r3, r0, #1
LAST1:
        ldrb    r7, [r3, #1]
        ldrb    r8, [lr, #1]
        add     r6, r6, #4
        sub     r7, r8, r7
        cmp     r7, #0
        mov     r8, r4
        movgt   r8, r7
        strb    r8, [lr, #1]
        ldrb    r7, [r3, #2]
        ldrb    r8, [lr, #2]
        sub     r7, r8, r7
        cmp     r7, #0
        mov     r8, r4
        movgt   r8, r7
        strb    r8, [lr, #2]
        ldrb    r7, [r3, #3]
        ldrb    r8, [lr, #3]
        sub     r7, r8, r7
        cmp     r7, #0
        mov     r8, r4
        movgt   r8, r7
        strb    r8, [lr, #3]
        ldrb    r7, [r3, #4]!
        ldrb    r8, [lr, #4]
        sub     r7, r8, r7
        cmp     r7, #0
        mov     r8, r4
        movgt   r8, r7
        strb    r8, [lr, #4]!
        cmp     r6, r5
        ble     LAST1
LAST2:
        add     r1, r6, r1
        add     r0, r6, r0
LAST3:
        ldrb    r3, [r0], #1
        ldrb    lr, [r1]
        add     r6, r6, #1
        sub     r3, lr, r3
        cmp     r3, #0
        mov     lr, r12
        movgt   lr, r3
        strb    lr, [r1], #1
        cmp     r6, r2
        blt     LAST3
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LAST4:
        cmp     r3, #0
        ble     LAST9
        sub     lr, r3, #1
        mov     r4, #1
        mov     lr, r4, lsl lr
        cmp     r2, #5
        sub     lr, lr, #1
        movlt   r4, #0
        blt     LAST6
        mov     r4, #0
        sub     r8, r2, #5
        mov     r7, r4
        sub     r6, r1, #1
        sub     r5, r0, #1
LAST5:
        ldrb    r9, [r6, #1]
        ldrb    r10, [r5, #1]
        add     r4, r4, #4
        sub     r9, r9, r10
        mov     r10, r7
        cmp     r9, #0
        movgt   r10, r9
        and     r9, r10, #0xFF
        mov     r10, r9, asr r3
        and     r10, r10, #1
        add     r9, lr, r9
        add     r10, r9, r10
        mov     r9, r10, asr r3
        strb    r9, [r6, #1]
        ldrb    r10, [r5, #2]
        ldrb    r9, [r6, #2]
        sub     r9, r9, r10
        mov     r10, r7
        cmp     r9, #0
        movgt   r10, r9
        and     r9, r10, #0xFF
        mov     r10, r9, asr r3
        and     r10, r10, #1
        add     r9, lr, r9
        add     r10, r9, r10
        mov     r9, r10, asr r3
        strb    r9, [r6, #2]
        ldrb    r9, [r6, #3]
        ldrb    r10, [r5, #3]
        sub     r9, r9, r10
        cmp     r9, #0
        mov     r10, r7
        movgt   r10, r9
        and     r9, r10, #0xFF
        mov     r10, r9, asr r3
        and     r10, r10, #1
        add     r9, lr, r9
        add     r10, r9, r10
        mov     r9, r10, asr r3
        strb    r9, [r6, #3]
        ldrb    r9, [r6, #4]
        ldrb    r10, [r5, #4]!
        sub     r9, r9, r10
        cmp     r9, #0
        mov     r10, r7
        movgt   r10, r9
        and     r9, r10, #0xFF
        mov     r10, r9, asr r3
        and     r10, r10, #1
        add     r9, lr, r9
        add     r10, r9, r10
        mov     r9, r10, asr r3
        strb    r9, [r6, #4]!
        cmp     r4, r8
        ble     LAST5
LAST6:
        add     r1, r4, r1
        add     r0, r4, r0
LAST7:
        ldrb    r5, [r1]
        ldrb    r6, [r0], #1
        add     r4, r4, #1
        sub     r5, r5, r6
        cmp     r5, #0
        mov     r6, r12
        movgt   r6, r5
        and     r5, r6, #0xFF
        mov     r6, r5, asr r3
        and     r6, r6, #1
        add     r5, lr, r5
        add     r6, r5, r6
        mov     r5, r6, asr r3
        strb    r5, [r1], #1
        cmp     r4, r2
        blt     LAST7
LAST8:
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LAST9:
        cmn     r3, #7
        mov     lr, #0xFF
        bge     LAST11
        cmp     r2, #0
        ble     LAST8
        mov     r3, #0
LAST10:
        ldrb    r12, [r0], #1
        ldrb    lr, [r1]
        cmp     lr, r12
        movle   r12, #0
        movgt   r12, #0xFF
        add     r3, r3, #1
        strb    r12, [r1], #1
        cmp     r3, r2
        blt     LAST10
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LAST11:
        cmp     r2, #5
        rsb     r3, r3, #0
        movlt   r4, #0
        blt     LAST13
        mov     r4, #0
        sub     r8, r2, #5
        mov     r7, r4
        sub     r6, r1, #1
        sub     r5, r0, #1
LAST12:
        ldrb    r9, [r5, #1]
        ldrb    r10, [r6, #1]
        add     r4, r4, #4
        sub     r9, r10, r9
        cmp     r9, #0
        mov     r10, r7
        movgt   r10, r9
        and     r10, r10, #0xFF
        mov     r9, r10, lsl r3
        cmp     r9, #0xFF
        mov     r10, lr
        movlt   r10, r9
        strb    r10, [r6, #1]
        ldrb    r9, [r5, #2]
        ldrb    r10, [r6, #2]
        sub     r9, r10, r9
        cmp     r9, #0
        mov     r10, r7
        movgt   r10, r9
        and     r10, r10, #0xFF
        mov     r9, r10, lsl r3
        cmp     r9, #0xFF
        mov     r10, lr
        movlt   r10, r9
        strb    r10, [r6, #2]
        ldrb    r9, [r5, #3]
        ldrb    r10, [r6, #3]
        sub     r9, r10, r9
        cmp     r9, #0
        mov     r10, r7
        movgt   r10, r9
        and     r10, r10, #0xFF
        mov     r9, r10, lsl r3
        cmp     r9, #0xFF
        mov     r10, lr
        movlt   r10, r9
        strb    r10, [r6, #3]
        ldrb    r9, [r5, #4]!
        ldrb    r10, [r6, #4]
        sub     r9, r10, r9
        cmp     r9, #0
        mov     r10, r7
        movgt   r10, r9
        and     r10, r10, #0xFF
        mov     r9, r10, lsl r3
        cmp     r9, #0xFF
        mov     r10, lr
        movlt   r10, r9
        strb    r10, [r6, #4]!
        cmp     r4, r8
        ble     LAST12
LAST13:
        add     r1, r4, r1
        add     r0, r4, r0
        mov     lr, #0xFF
LAST14:
        ldrb    r5, [r0], #1
        ldrb    r6, [r1]
        add     r4, r4, #1
        sub     r5, r6, r5
        cmp     r5, #0
        mov     r6, r12
        movgt   r6, r5
        and     r6, r6, #0xFF
        mov     r5, r6, lsl r3
        cmp     r5, #0xFF
        mov     r6, lr
        movlt   r6, r5
        strb    r6, [r1], #1
        cmp     r4, r2
        blt     LAST14
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LAST15:
        mvn     r0, #7
        ldmia   sp!, {r4 - r10, pc}


