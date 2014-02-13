        .text
        .align  4
        .globl  ownps_Add_16u_Sfs


ownps_Add_16u_Sfs:
        stmdb   sp!, {r4 - r10, lr}
        ldr     lr, [sp, #0x20]
        mov     r12, #0xFF
        orr     r12, r12, #0xFF, 24
        cmp     lr, #0
        mov     r4, #0
        bne     LCZX3
        cmp     r3, #0
        ble     LCZX7
        cmp     r3, #5
        blt     LCZX1
        sub     r7, r3, #5
        mov     r6, r0
        mov     r5, r1
        mov     lr, r2
LCZX0:
        ldrh    r8, [r6]
        ldrh    r9, [r5]
        add     r4, r4, #4
        add     r8, r8, r9
        cmp     r8, r12
        mov     r9, r12
        movcc   r9, r8
        strh    r9, [lr]
        ldrh    r8, [r6, #2]
        ldrh    r9, [r5, #2]
        add     r8, r8, r9
        cmp     r8, r12
        mov     r9, r12
        movcc   r9, r8
        strh    r9, [lr, #2]
        ldrh    r8, [r6, #4]
        ldrh    r9, [r5, #4]
        add     r8, r8, r9
        cmp     r8, r12
        mov     r9, r12
        movcc   r9, r8
        strh    r9, [lr, #4]
        ldrh    r8, [r6, #6]
        ldrh    r9, [r5, #6]
        add     r6, r6, #8
        add     r5, r5, #8
        add     r8, r8, r9
        cmp     r8, r12
        mov     r9, r12
        movcc   r9, r8
        strh    r9, [lr, #6]
        cmp     r4, r7
        add     lr, lr, #8
        ble     LCZX0
LCZX1:
        add     r0, r0, r4, lsl #1
        add     r1, r1, r4, lsl #1
        add     r2, r2, r4, lsl #1
LCZX2:
        ldrh    lr, [r0], #2
        ldrh    r5, [r1], #2
        add     r4, r4, #1
        add     lr, lr, r5
        cmp     lr, r12
        mov     r5, r12
        movcc   r5, lr
        strh    r5, [r2], #2
        cmp     r4, r3
        blt     LCZX2
        ldmia   sp!, {r4 - r10, pc}
LCZX3:
        cmp     lr, #0
        ble     LCZX8
        sub     r12, lr, #1
        mov     r5, #1
        mov     r12, r5, lsl r12
        cmp     r3, #0
        sub     r12, r12, #1
        ble     LCZX7
        cmp     r3, #5
        blt     LCZX5
        sub     r8, r3, #5
        mov     r7, r0
        mov     r6, r1
        mov     r5, r2
LCZX4:
        ldrh    r9, [r6]
        ldrh    r10, [r7]
        add     r4, r4, #4
        cmp     r4, r8
        add     r9, r10, r9
        mov     r10, r9, lsr lr
        and     r10, r10, #1
        add     r9, r12, r9
        add     r10, r9, r10
        mov     r9, r10, lsr lr
        strh    r9, [r5]
        ldrh    r9, [r6, #2]
        ldrh    r10, [r7, #2]
        add     r9, r10, r9
        mov     r10, r9, lsr lr
        and     r10, r10, #1
        add     r9, r12, r9
        add     r10, r9, r10
        mov     r9, r10, lsr lr
        strh    r9, [r5, #2]
        ldrh    r9, [r6, #4]
        ldrh    r10, [r7, #4]
        add     r9, r10, r9
        mov     r10, r9, lsr lr
        and     r10, r10, #1
        add     r9, r12, r9
        add     r10, r9, r10
        mov     r9, r10, lsr lr
        strh    r9, [r5, #4]
        ldrh    r9, [r6, #6]
        ldrh    r10, [r7, #6]
        add     r7, r7, #8
        add     r6, r6, #8
        add     r9, r10, r9
        mov     r10, r9, lsr lr
        and     r10, r10, #1
        add     r9, r12, r9
        add     r10, r9, r10
        mov     r9, r10, lsr lr
        strh    r9, [r5, #6]
        add     r5, r5, #8
        ble     LCZX4
LCZX5:
        add     r0, r0, r4, lsl #1
        add     r1, r1, r4, lsl #1
        add     r2, r2, r4, lsl #1
LCZX6:
        ldrh    r5, [r1], #2
        ldrh    r6, [r0], #2
        add     r4, r4, #1
        add     r5, r6, r5
        mov     r6, r5, lsr lr
        and     r6, r6, #1
        add     r5, r12, r5
        add     r6, r5, r6
        mov     r5, r6, lsr lr
        strh    r5, [r2], #2
        cmp     r4, r3
        blt     LCZX6
LCZX7:
        ldmia   sp!, {r4 - r10, pc}
LCZX8:
        cmn     lr, #0xF
        bge     LCZX12
        cmp     r3, #0
        ble     LCZX7
        mov     lr, r4
LCZX9:
        ldrh    r5, [r0], #2
        cmp     r5, #0
        bne     LCZX10
        ldrh    r5, [r1]
        cmp     r5, #0
        moveq   r5, r4
        beq     LCZX11
LCZX10:
        mov     r5, r12
LCZX11:
        add     lr, lr, #1
        strh    r5, [r2], #2
        cmp     lr, r3
        add     r1, r1, #2
        blt     LCZX9
        ldmia   sp!, {r4 - r10, pc}
LCZX12:
        cmp     r3, #0
        rsb     lr, lr, #0
        ble     LCZX7
        cmp     r3, #5
        blt     LCZX14
        sub     r8, r3, #5
        mov     r7, r0
        mov     r6, r1
        mov     r5, r2
LCZX13:
        ldrh    r10, [r6]
        ldrh    r9, [r7]
        add     r4, r4, #4
        add     r10, r9, r10
        mov     r9, r10, lsl lr
        cmp     r9, r12
        mov     r10, r12
        movcc   r10, r9
        strh    r10, [r5]
        ldrh    r10, [r6, #2]
        ldrh    r9, [r7, #2]
        add     r10, r9, r10
        mov     r9, r10, lsl lr
        cmp     r9, r12
        mov     r10, r12
        movcc   r10, r9
        strh    r10, [r5, #2]
        ldrh    r10, [r6, #4]
        ldrh    r9, [r7, #4]
        add     r10, r9, r10
        mov     r9, r10, lsl lr
        cmp     r9, r12
        mov     r10, r12
        movcc   r10, r9
        strh    r10, [r5, #4]
        ldrh    r10, [r6, #6]
        ldrh    r9, [r7, #6]
        add     r7, r7, #8
        add     r6, r6, #8
        add     r10, r9, r10
        mov     r9, r10, lsl lr
        cmp     r9, r12
        mov     r10, r12
        movcc   r10, r9
        strh    r10, [r5, #6]
        cmp     r4, r8
        add     r5, r5, #8
        ble     LCZX13
LCZX14:
        mov     r12, #0xFF
        orr     r12, r12, #0xFF, 24
        add     r0, r0, r4, lsl #1
        add     r1, r1, r4, lsl #1
        add     r2, r2, r4, lsl #1
LCZX15:
        ldrh    r6, [r1], #2
        ldrh    r5, [r0], #2
        add     r4, r4, #1
        add     r6, r5, r6
        mov     r5, r6, lsl lr
        cmp     r5, r12
        mov     r6, r12
        movcc   r6, r5
        strh    r6, [r2], #2
        cmp     r4, r3
        blt     LCZX15
        ldmia   sp!, {r4 - r10, pc}


