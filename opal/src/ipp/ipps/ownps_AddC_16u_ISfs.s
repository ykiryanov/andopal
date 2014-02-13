        .text
        .align  4
        .globl  ownps_AddC_16u_ISfs


ownps_AddC_16u_ISfs:
        stmdb   sp!, {r4 - r10, lr}
        mov     r12, #0xFF
        cmp     r3, #0
        orr     r12, r12, #0xFF, 24
        mov     lr, #0
        bne     LDAA3
        cmp     r2, #0
        ble     LDAA7
        cmp     r2, #6
        blt     LDAA1
        sub     r5, r2, #6
        mov     r4, r1
LDAA0:
        ldrh    r7, [r4]
        ldrh    r6, [r4, #2]
        ldrh    r3, [r4, #4]
        add     r7, r0, r7
        cmp     r7, r12
        mov     r8, r12
        movcc   r8, r7
        add     r7, r0, r6
        ldrh    r6, [r4, #6]
        strh    r8, [r4]
        cmp     r7, r12
        mov     r8, r12
        movcc   r8, r7
        add     r7, r0, r3
        ldrh    r3, [r4, #8]
        strh    r8, [r4, #2]
        cmp     r7, r12
        mov     r8, r12
        movcc   r8, r7
        add     r7, r0, r6
        cmp     r7, r12
        mov     r6, r12
        movcc   r6, r7
        add     r3, r0, r3
        cmp     r3, r12
        mov     r7, r12
        movcc   r7, r3
        add     lr, lr, #5
        strh    r8, [r4, #4]
        strh    r6, [r4, #6]
        strh    r7, [r4, #8]
        cmp     lr, r5
        add     r4, r4, #0xA
        ble     LDAA0
LDAA1:
        add     r1, r1, lr, lsl #1
LDAA2:
        ldrh    r3, [r1]
        add     lr, lr, #1
        mov     r4, r12
        add     r3, r0, r3
        cmp     r3, r12
        movcc   r4, r3
        strh    r4, [r1], #2
        cmp     lr, r2
        blt     LDAA2
        ldmia   sp!, {r4 - r10, pc}
LDAA3:
        cmp     r3, #0
        ble     LDAA8
        sub     r4, r3, #1
        mov     r12, #1
        mov     r4, r12, lsl r4
        cmp     r2, #0
        sub     r6, r4, #1
        ble     LDAA7
        cmp     r2, #5
        blt     LDAA5
        sub     r8, r2, #5
        mov     r7, r1
LDAA4:
        ldrh    r12, [r7]
        ldrh    r4, [r7, #2]
        ldrh    r5, [r7, #4]
        ldrh    r9, [r7, #6]
        add     r12, r0, r12
        mov     r10, r12, lsr r3
        and     r10, r10, #1
        add     r12, r6, r12
        add     r10, r12, r10
        mov     r12, r10, lsr r3
        add     r4, r0, r4
        strh    r12, [r7]
        mov     r12, r4, lsr r3
        and     r12, r12, #1
        add     r4, r6, r4
        add     r12, r4, r12
        mov     r12, r12, lsr r3
        add     r5, r0, r5
        add     r9, r0, r9
        strh    r12, [r7, #2]
        mov     r12, r5, lsr r3
        mov     r4, r9, lsr r3
        and     r12, r12, #1
        and     r4, r4, #1
        add     r5, r6, r5
        add     r9, r6, r9
        add     r12, r5, r12
        add     r4, r9, r4
        mov     r12, r12, lsr r3
        mov     r4, r4, lsr r3
        add     lr, lr, #4
        strh    r12, [r7, #4]
        strh    r4, [r7, #6]
        cmp     lr, r8
        add     r7, r7, #8
        ble     LDAA4
LDAA5:
        add     r1, r1, lr, lsl #1
LDAA6:
        ldrh    r12, [r1]
        add     lr, lr, #1
        cmp     lr, r2
        add     r12, r0, r12
        mov     r4, r12, lsr r3
        and     r4, r4, #1
        add     r12, r6, r12
        add     r4, r12, r4
        mov     r12, r4, lsr r3
        strh    r12, [r1], #2
        blt     LDAA6
LDAA7:
        ldmia   sp!, {r4 - r10, pc}
LDAA8:
        cmn     r3, #0xF
        bge     LDAA10
        cmp     r2, #0
        ble     LDAA7
        mov     r0, lr
LDAA9:
        ldrh    r3, [r1]
        cmp     r3, #0
        moveq   r3, lr
        movne   r3, r12
        add     r0, r0, #1
        strh    r3, [r1], #2
        cmp     r0, r2
        blt     LDAA9
        ldmia   sp!, {r4 - r10, pc}
LDAA10:
        cmp     r2, #0
        rsb     r3, r3, #0
        ble     LDAA7
        cmp     r2, #5
        blt     LDAA12
        sub     r5, r2, #5
        mov     r4, r1
LDAA11:
        ldrh    r8, [r4]
        ldrh    r7, [r4, #2]
        ldrh    r6, [r4, #4]
        add     r8, r0, r8
        mov     r8, r8, lsl r3
        cmp     r8, r12
        mov     r9, r12
        add     r7, r0, r7
        movcc   r9, r8
        mov     r7, r7, lsl r3
        cmp     r7, r12
        mov     r8, r12
        movcc   r8, r7
        ldrh    r7, [r4, #6]
        add     r6, r0, r6
        mov     r6, r6, lsl r3
        strh    r8, [r4, #2]
        cmp     r6, r12
        mov     r8, r12
        movcc   r8, r6
        add     r7, r0, r7
        mov     r6, r7, lsl r3
        cmp     r6, r12
        mov     r7, r12
        movcc   r7, r6
        add     lr, lr, #4
        strh    r9, [r4]
        strh    r8, [r4, #4]
        strh    r7, [r4, #6]
        cmp     lr, r5
        add     r4, r4, #8
        ble     LDAA11
LDAA12:
        add     r1, r1, lr, lsl #1
LDAA13:
        ldrh    r4, [r1]
        add     lr, lr, #1
        mov     r5, r12
        add     r4, r0, r4
        mov     r4, r4, lsl r3
        cmp     r4, r12
        movcc   r5, r4
        strh    r5, [r1], #2
        cmp     lr, r2
        blt     LDAA13
        ldmia   sp!, {r4 - r10, pc}


