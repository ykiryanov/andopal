        .text
        .align  4
        .globl  _ippsAdd_8u_Sfs


_ippsAdd_8u_Sfs:
        stmdb   sp!, {r4 - r10, lr}
        ldr     r12, [sp, #0x20]
        cmp     r12, #9
        ble     LDBS0
        cmp     r0, #0
        beq     LDBS15
        cmp     r1, #0
        beq     LDBS15
        mov     r0, r2
        mov     r1, r3
        ldmia   sp!, {r4 - r10, lr}
        b       _ippsZero_8u
LDBS0:
        cmp     r0, #0
        beq     LDBS15
        cmp     r1, #0
        beq     LDBS15
        cmp     r2, #0
        beq     LDBS15
        cmp     r3, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r10, pc}
        cmp     r12, #0
        mov     r4, #0
        mov     lr, #0xFF
        bne     LDBS4
        cmp     r3, #5
        blt     LDBS2
        sub     r7, r3, #5
        sub     r6, r0, #1
        sub     r5, r1, #1
        sub     r12, r2, #1
LDBS1:
        ldrb    r8, [r5, #1]
        ldrb    r9, [r6, #1]
        add     r4, r4, #4
        add     r8, r9, r8
        cmp     r8, #0xFF
        mov     r9, lr
        movcc   r9, r8
        strb    r9, [r12, #1]
        ldrb    r8, [r5, #2]
        ldrb    r9, [r6, #2]
        add     r8, r9, r8
        cmp     r8, #0xFF
        mov     r9, lr
        movcc   r9, r8
        strb    r9, [r12, #2]
        ldrb    r8, [r5, #3]
        ldrb    r9, [r6, #3]
        add     r8, r9, r8
        cmp     r8, #0xFF
        mov     r9, lr
        movcc   r9, r8
        strb    r9, [r12, #3]
        ldrb    r8, [r5, #4]!
        ldrb    r9, [r6, #4]!
        add     r8, r9, r8
        cmp     r8, #0xFF
        mov     r9, lr
        movcc   r9, r8
        strb    r9, [r12, #4]!
        cmp     r4, r7
        ble     LDBS1
LDBS2:
        add     r0, r4, r0
        add     r1, r4, r1
        add     r2, r4, r2
LDBS3:
        ldrb    r12, [r1], #1
        ldrb    r5, [r0], #1
        add     r4, r4, #1
        add     r12, r5, r12
        cmp     r12, #0xFF
        mov     r5, lr
        movcc   r5, r12
        strb    r5, [r2], #1
        cmp     r4, r3
        blt     LDBS3
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LDBS4:
        cmp     r12, #0
        ble     LDBS9
        sub     r5, r12, #1
        mov     lr, #1
        mov     r5, lr, lsl r5
        cmp     r3, #5
        sub     lr, r5, #1
        blt     LDBS6
        sub     r8, r3, #5
        sub     r7, r0, #1
        sub     r6, r1, #1
        sub     r5, r2, #1
LDBS5:
        ldrb    r9, [r7, #1]
        ldrb    r10, [r6, #1]
        add     r4, r4, #4
        cmp     r4, r8
        add     r9, r9, r10
        mov     r10, r9, lsr r12
        and     r10, r10, #1
        add     r9, lr, r9
        add     r10, r9, r10
        mov     r9, r10, lsr r12
        strb    r9, [r5, #1]
        ldrb    r9, [r7, #2]
        ldrb    r10, [r6, #2]
        add     r9, r9, r10
        mov     r10, r9, lsr r12
        and     r10, r10, #1
        add     r9, lr, r9
        add     r10, r9, r10
        mov     r9, r10, lsr r12
        strb    r9, [r5, #2]
        ldrb    r9, [r7, #3]
        ldrb    r10, [r6, #3]
        add     r9, r9, r10
        mov     r10, r9, lsr r12
        and     r10, r10, #1
        add     r9, lr, r9
        add     r10, r9, r10
        mov     r9, r10, lsr r12
        strb    r9, [r5, #3]
        ldrb    r9, [r7, #4]!
        ldrb    r10, [r6, #4]!
        add     r9, r9, r10
        mov     r10, r9, lsr r12
        and     r10, r10, #1
        add     r9, lr, r9
        add     r10, r9, r10
        mov     r9, r10, lsr r12
        strb    r9, [r5, #4]!
        ble     LDBS5
LDBS6:
        add     r0, r4, r0
        add     r1, r4, r1
        add     r2, r4, r2
LDBS7:
        ldrb    r5, [r0], #1
        ldrb    r6, [r1], #1
        add     r4, r4, #1
        add     r5, r5, r6
        mov     r6, r5, lsr r12
        and     r6, r6, #1
        add     r5, lr, r5
        add     r6, r5, r6
        mov     r5, r6, lsr r12
        strb    r5, [r2], #1
        cmp     r4, r3
        blt     LDBS7
LDBS8:
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LDBS9:
        cmn     r12, #7
        bge     LDBS11
        cmp     r3, #0
        ble     LDBS8
        mov     r12, r4
LDBS10:
        ldrb    r5, [r1], #1
        ldrb    lr, [r0], #1
        adds    r5, lr, r5
        moveq   lr, r4
        movne   lr, #0xFF
        add     r12, r12, #1
        strb    lr, [r2], #1
        cmp     r12, r3
        blt     LDBS10
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LDBS11:
        cmp     r3, #5
        rsb     r12, r12, #0
        blt     LDBS13
        sub     r8, r3, #5
        sub     r7, r0, #1
        sub     r6, r1, #1
        sub     r5, r2, #1
LDBS12:
        ldrb    r10, [r6, #1]
        ldrb    r9, [r7, #1]
        add     r4, r4, #4
        add     r10, r9, r10
        mov     r9, r10, lsl r12
        cmp     r9, #0xFF
        mov     r10, lr
        movcc   r10, r9
        strb    r10, [r5, #1]
        ldrb    r10, [r6, #2]
        ldrb    r9, [r7, #2]
        add     r10, r9, r10
        mov     r9, r10, lsl r12
        cmp     r9, #0xFF
        mov     r10, lr
        movcc   r10, r9
        strb    r10, [r5, #2]
        ldrb    r10, [r6, #3]
        ldrb    r9, [r7, #3]
        add     r10, r9, r10
        mov     r9, r10, lsl r12
        cmp     r9, #0xFF
        mov     r10, lr
        movcc   r10, r9
        strb    r10, [r5, #3]
        ldrb    r10, [r6, #4]!
        ldrb    r9, [r7, #4]!
        add     r10, r9, r10
        mov     r9, r10, lsl r12
        cmp     r9, #0xFF
        mov     r10, lr
        movcc   r10, r9
        strb    r10, [r5, #4]!
        cmp     r4, r8
        ble     LDBS12
LDBS13:
        add     r0, r4, r0
        add     r1, r4, r1
        add     r2, r4, r2
        mov     lr, #0xFF
LDBS14:
        ldrb    r5, [r1], #1
        ldrb    r6, [r0], #1
        add     r4, r4, #1
        add     r5, r6, r5
        mov     r5, r5, lsl r12
        cmp     r5, #0xFF
        mov     r6, lr
        movcc   r6, r5
        strb    r6, [r2], #1
        cmp     r4, r3
        blt     LDBS14
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LDBS15:
        mvn     r0, #7
        ldmia   sp!, {r4 - r10, pc}


