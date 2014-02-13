        .text
        .align  4
        .globl  _ippsAddC_8u_Sfs


_ippsAddC_8u_Sfs:
        stmdb   sp!, {r4 - r10, lr}
        ldr     r12, [sp, #0x20]
        mov     r4, r1
        mov     r1, r2
        cmp     r12, #0
        mov     r2, r3
        bne     LDCI0
        cmp     r4, #0
        ldmeqia sp!, {r4 - r10, lr}
        beq     _ippsCopy_8u
        b       LDCI2
LDCI0:
        cmp     r12, #9
        ble     LDCI1
        cmp     r0, #0
        beq     LDCI17
        mov     r0, r1
        mov     r1, r2
        ldmia   sp!, {r4 - r10, lr}
        b       _ippsZero_8u
LDCI1:
        cmn     r12, #7
        bge     LDCI2
        cmp     r4, #0
        beq     LDCI2
        cmp     r0, #0
        beq     LDCI17
        mov     r0, #0xFF
        ldmia   sp!, {r4 - r10, lr}
        b       _ippsSet_8u
LDCI2:
        cmp     r0, #0
        beq     LDCI17
        cmp     r1, #0
        beq     LDCI17
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r10, pc}
        cmp     r12, #0
        mov     lr, #0
        mov     r5, #0xFF
        bne     LDCI6
        cmp     r2, #6
        blt     LDCI4
        sub     r7, r2, #6
        sub     r6, r0, #1
        sub     r12, r1, #1
LDCI3:
        ldrb    r8, [r6, #1]
        add     lr, lr, #5
        mov     r9, r5
        add     r8, r4, r8
        cmp     r8, #0xFF
        movcc   r9, r8
        strb    r9, [r12, #1]
        ldrb    r8, [r6, #2]
        mov     r9, r5
        add     r8, r4, r8
        cmp     r8, #0xFF
        movcc   r9, r8
        strb    r9, [r12, #2]
        ldrb    r8, [r6, #3]
        mov     r9, r5
        add     r8, r4, r8
        cmp     r8, #0xFF
        movcc   r9, r8
        strb    r9, [r12, #3]
        ldrb    r8, [r6, #4]
        mov     r9, r5
        add     r8, r4, r8
        cmp     r8, #0xFF
        movcc   r9, r8
        strb    r9, [r12, #4]
        ldrb    r8, [r6, #5]!
        mov     r9, r5
        add     r8, r4, r8
        cmp     r8, #0xFF
        movcc   r9, r8
        strb    r9, [r12, #5]!
        cmp     lr, r7
        ble     LDCI3
LDCI4:
        add     r0, lr, r0
        add     r1, lr, r1
LDCI5:
        ldrb    r12, [r0], #1
        add     lr, lr, #1
        add     r12, r4, r12
        cmp     r12, #0xFF
        mov     r6, r5
        movcc   r6, r12
        strb    r6, [r1], #1
        cmp     lr, r2
        blt     LDCI5
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LDCI6:
        cmp     r12, #0
        ble     LDCI11
        sub     r6, r12, #1
        mov     r5, #1
        mov     r6, r5, lsl r6
        cmp     r2, #5
        sub     r5, r6, #1
        blt     LDCI8
        sub     r8, r2, #5
        sub     r7, r0, #1
        sub     r6, r1, #1
LDCI7:
        ldrb    r9, [r7, #1]
        add     lr, lr, #4
        cmp     lr, r8
        add     r9, r4, r9
        mov     r10, r9, lsr r12
        and     r10, r10, #1
        add     r9, r5, r9
        add     r10, r9, r10
        mov     r9, r10, lsr r12
        strb    r9, [r6, #1]
        ldrb    r9, [r7, #2]
        add     r9, r4, r9
        mov     r10, r9, lsr r12
        and     r10, r10, #1
        add     r9, r5, r9
        add     r10, r9, r10
        mov     r9, r10, lsr r12
        strb    r9, [r6, #2]
        ldrb    r9, [r7, #3]
        add     r9, r4, r9
        mov     r10, r9, lsr r12
        and     r10, r10, #1
        add     r9, r5, r9
        add     r10, r9, r10
        mov     r9, r10, lsr r12
        strb    r9, [r6, #3]
        ldrb    r9, [r7, #4]!
        add     r9, r4, r9
        mov     r10, r9, lsr r12
        and     r10, r10, #1
        add     r9, r5, r9
        add     r10, r9, r10
        mov     r9, r10, lsr r12
        strb    r9, [r6, #4]!
        ble     LDCI7
LDCI8:
        add     r0, lr, r0
        add     r1, lr, r1
LDCI9:
        ldrb    r6, [r0], #1
        add     lr, lr, #1
        add     r6, r4, r6
        mov     r7, r6, lsr r12
        and     r7, r7, #1
        add     r6, r5, r6
        add     r7, r6, r7
        mov     r6, r7, lsr r12
        strb    r6, [r1], #1
        cmp     lr, r2
        blt     LDCI9
LDCI10:
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LDCI11:
        cmn     r12, #7
        bge     LDCI13
        cmp     r2, #0
        ble     LDCI10
        mov     r12, lr
LDCI12:
        ldrb    r4, [r0], #1
        cmp     r4, #0
        moveq   r4, lr
        movne   r4, #0xFF
        add     r12, r12, #1
        strb    r4, [r1], #1
        cmp     r12, r2
        blt     LDCI12
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LDCI13:
        cmp     r2, #6
        rsb     r12, r12, #0
        blt     LDCI15
        sub     r8, r2, #6
        sub     r7, r0, #1
        sub     r6, r1, #1
LDCI14:
        ldrb    r9, [r7, #1]
        add     lr, lr, #5
        mov     r10, r5
        add     r9, r4, r9
        mov     r9, r9, lsl r12
        cmp     r9, #0xFF
        movcc   r10, r9
        strb    r10, [r6, #1]
        ldrb    r9, [r7, #2]
        mov     r10, r5
        add     r9, r4, r9
        mov     r9, r9, lsl r12
        cmp     r9, #0xFF
        movcc   r10, r9
        strb    r10, [r6, #2]
        ldrb    r9, [r7, #3]
        mov     r10, r5
        add     r9, r4, r9
        mov     r9, r9, lsl r12
        cmp     r9, #0xFF
        movcc   r10, r9
        strb    r10, [r6, #3]
        ldrb    r9, [r7, #4]
        mov     r10, r5
        add     r9, r4, r9
        mov     r9, r9, lsl r12
        cmp     r9, #0xFF
        movcc   r10, r9
        strb    r10, [r6, #4]
        ldrb    r9, [r7, #5]!
        mov     r10, r5
        add     r9, r4, r9
        mov     r9, r9, lsl r12
        cmp     r9, #0xFF
        movcc   r10, r9
        strb    r10, [r6, #5]!
        cmp     lr, r8
        ble     LDCI14
LDCI15:
        add     r0, lr, r0
        add     r1, lr, r1
LDCI16:
        ldrb    r6, [r0], #1
        add     lr, lr, #1
        add     r6, r4, r6
        mov     r6, r6, lsl r12
        cmp     r6, #0xFF
        mov     r7, r5
        movcc   r7, r6
        strb    r7, [r1], #1
        cmp     lr, r2
        blt     LDCI16
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LDCI17:
        mvn     r0, #7
        ldmia   sp!, {r4 - r10, pc}


