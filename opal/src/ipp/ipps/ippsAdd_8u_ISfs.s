        .text
        .align  4
        .globl  _ippsAdd_8u_ISfs


_ippsAdd_8u_ISfs:
        stmdb   sp!, {r4 - r9, lr}
        cmp     r3, #9
        ble     LDBT0
        cmp     r0, #0
        beq     LDBT15
        mov     r0, r1
        mov     r1, r2
        ldmia   sp!, {r4 - r9, lr}
        b       _ippsZero_8u
LDBT0:
        cmp     r0, #0
        beq     LDBT15
        cmp     r1, #0
        beq     LDBT15
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r9, pc}
        cmp     r3, #0
        mov     lr, #0
        mov     r12, #0xFF
        bne     LDBT4
        cmp     r2, #5
        blt     LDBT2
        sub     r7, r2, #5
        sub     r6, r0, #1
        sub     r5, r1, #1
LDBT1:
        ldrb    r3, [r6, #1]
        ldrb    r8, [r5, #1]
        ldrb    r4, [r5, #2]
        add     lr, lr, #4
        add     r3, r3, r8
        cmp     r3, #0xFF
        mov     r8, r12
        movcc   r8, r3
        strb    r8, [r5, #1]
        ldrb    r8, [r6, #2]
        ldrb    r3, [r5, #3]
        add     r4, r8, r4
        cmp     r4, #0xFF
        mov     r8, r12
        movcc   r8, r4
        strb    r8, [r5, #2]
        ldrb    r8, [r6, #3]
        ldrb    r4, [r5, #4]
        add     r3, r8, r3
        cmp     r3, #0xFF
        mov     r8, r12
        movcc   r8, r3
        strb    r8, [r5, #3]
        ldrb    r3, [r6, #4]!
        add     r4, r3, r4
        cmp     r4, #0xFF
        mov     r3, r12
        movcc   r3, r4
        strb    r3, [r5, #4]!
        cmp     lr, r7
        ble     LDBT1
LDBT2:
        add     r0, lr, r0
        add     r1, lr, r1
LDBT3:
        ldrb    r3, [r0], #1
        ldrb    r4, [r1]
        add     lr, lr, #1
        add     r3, r3, r4
        cmp     r3, #0xFF
        mov     r4, r12
        movcc   r4, r3
        strb    r4, [r1], #1
        cmp     lr, r2
        blt     LDBT3
        mov     r0, #0
        ldmia   sp!, {r4 - r9, pc}
LDBT4:
        cmp     r3, #0
        ble     LDBT9
        sub     r12, r3, #1
        mov     r4, #1
        mov     r12, r4, lsl r12
        cmp     r2, #5
        sub     r12, r12, #1
        blt     LDBT6
        sub     r8, r2, #5
        sub     r7, r0, #1
        sub     r6, r1, #1
LDBT5:
        ldrb    r4, [r6, #1]
        ldrb    r5, [r7, #1]
        add     lr, lr, #4
        cmp     lr, r8
        add     r4, r5, r4
        mov     r5, r4, lsr r3
        and     r5, r5, #1
        add     r4, r12, r4
        add     r5, r4, r5
        mov     r4, r5, lsr r3
        strb    r4, [r6, #1]
        ldrb    r5, [r6, #2]
        ldrb    r9, [r7, #2]
        ldrb    r4, [r6, #3]
        add     r5, r9, r5
        mov     r9, r5, lsr r3
        and     r9, r9, #1
        add     r5, r12, r5
        add     r9, r5, r9
        mov     r5, r9, lsr r3
        strb    r5, [r6, #2]
        ldrb    r9, [r7, #3]
        ldrb    r5, [r6, #4]
        add     r4, r9, r4
        mov     r9, r4, lsr r3
        and     r9, r9, #1
        add     r4, r12, r4
        add     r9, r4, r9
        mov     r4, r9, lsr r3
        strb    r4, [r6, #3]
        ldrb    r4, [r7, #4]!
        add     r4, r4, r5
        mov     r5, r4, lsr r3
        and     r5, r5, #1
        add     r4, r12, r4
        add     r5, r4, r5
        mov     r4, r5, lsr r3
        strb    r4, [r6, #4]!
        ble     LDBT5
LDBT6:
        add     r0, lr, r0
        add     r1, lr, r1
LDBT7:
        ldrb    r4, [r1]
        ldrb    r5, [r0], #1
        add     lr, lr, #1
        cmp     lr, r2
        add     r4, r5, r4
        mov     r5, r4, lsr r3
        and     r5, r5, #1
        add     r4, r12, r4
        add     r5, r4, r5
        mov     r4, r5, lsr r3
        strb    r4, [r1], #1
        blt     LDBT7
LDBT8:
        mov     r0, #0
        ldmia   sp!, {r4 - r9, pc}
LDBT9:
        cmn     r3, #7
        bge     LDBT11
        cmp     r2, #0
        ble     LDBT8
        mov     r3, lr
LDBT10:
        ldrb    r12, [r1]
        ldrb    r4, [r0], #1
        adds    r12, r4, r12
        moveq   r12, lr
        movne   r12, #0xFF
        add     r3, r3, #1
        strb    r12, [r1], #1
        cmp     r3, r2
        blt     LDBT10
        mov     r0, #0
        ldmia   sp!, {r4 - r9, pc}
LDBT11:
        cmp     r2, #5
        rsb     r3, r3, #0
        blt     LDBT13
        sub     r6, r2, #5
        sub     r5, r0, #1
        sub     r4, r1, #1
LDBT12:
        ldrb    r8, [r4, #1]
        ldrb    r7, [r5, #1]
        add     lr, lr, #4
        add     r8, r7, r8
        mov     r7, r8, lsl r3
        cmp     r7, #0xFF
        mov     r8, r12
        movcc   r8, r7
        strb    r8, [r4, #1]
        ldrb    r8, [r4, #2]
        ldrb    r7, [r5, #2]
        add     r8, r7, r8
        mov     r7, r8, lsl r3
        cmp     r7, #0xFF
        mov     r8, r12
        movcc   r8, r7
        strb    r8, [r4, #2]
        ldrb    r8, [r4, #3]
        ldrb    r7, [r5, #3]
        add     r8, r7, r8
        mov     r7, r8, lsl r3
        cmp     r7, #0xFF
        mov     r8, r12
        movcc   r8, r7
        strb    r8, [r4, #3]
        ldrb    r8, [r4, #4]
        ldrb    r7, [r5, #4]!
        add     r8, r7, r8
        mov     r7, r8, lsl r3
        cmp     r7, #0xFF
        mov     r8, r12
        movcc   r8, r7
        strb    r8, [r4, #4]!
        cmp     lr, r6
        ble     LDBT12
LDBT13:
        add     r0, lr, r0
        add     r1, lr, r1
LDBT14:
        ldrb    r5, [r1]
        ldrb    r4, [r0], #1
        add     lr, lr, #1
        add     r5, r4, r5
        mov     r4, r5, lsl r3
        cmp     r4, #0xFF
        mov     r5, r12
        movcc   r5, r4
        strb    r5, [r1], #1
        cmp     lr, r2
        blt     LDBT14
        mov     r0, #0
        ldmia   sp!, {r4 - r9, pc}
LDBT15:
        mvn     r0, #7
        ldmia   sp!, {r4 - r9, pc}


