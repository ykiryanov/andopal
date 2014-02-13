        .text
        .align  4
        .globl  ownps_Add_16u_ISfs


ownps_Add_16u_ISfs:
        stmdb   sp!, {r4 - r9, lr}
        mov     r12, #0xFF
        cmp     r3, #0
        orr     r12, r12, #0xFF, 24
        mov     lr, #0
        bne     LCZY3
        cmp     r2, #0
        ble     LCZY7
        cmp     r2, #5
        blt     LCZY1
        sub     r7, r2, #5
        mov     r6, r0
        mov     r5, r1
LCZY0:
        ldrh    r3, [r6]
        ldrh    r8, [r5]
        ldrh    r4, [r5, #2]
        add     lr, lr, #4
        add     r3, r3, r8
        cmp     r3, r12
        mov     r8, r12
        movcc   r8, r3
        strh    r8, [r5]
        ldrh    r8, [r6, #2]
        ldrh    r3, [r5, #4]
        add     r4, r8, r4
        cmp     r4, r12
        mov     r8, r12
        movcc   r8, r4
        strh    r8, [r5, #2]
        ldrh    r8, [r6, #4]
        ldrh    r4, [r5, #6]
        add     r3, r8, r3
        cmp     r3, r12
        mov     r8, r12
        movcc   r8, r3
        strh    r8, [r5, #4]
        ldrh    r3, [r6, #6]
        add     r6, r6, #8
        add     r4, r3, r4
        cmp     r4, r12
        mov     r3, r12
        movcc   r3, r4
        strh    r3, [r5, #6]
        cmp     lr, r7
        add     r5, r5, #8
        ble     LCZY0
LCZY1:
        add     r0, r0, lr, lsl #1
        add     r1, r1, lr, lsl #1
LCZY2:
        ldrh    r3, [r0], #2
        ldrh    r4, [r1]
        add     lr, lr, #1
        add     r3, r3, r4
        cmp     r3, r12
        mov     r4, r12
        movcc   r4, r3
        strh    r4, [r1], #2
        cmp     lr, r2
        blt     LCZY2
        ldmia   sp!, {r4 - r9, pc}
LCZY3:
        cmp     r3, #0
        ble     LCZY8
        sub     r12, r3, #1
        mov     r4, #1
        mov     r12, r4, lsl r12
        cmp     r2, #0
        sub     r12, r12, #1
        ble     LCZY7
        cmp     r2, #5
        blt     LCZY5
        sub     r8, r2, #5
        mov     r7, r0
        mov     r6, r1
LCZY4:
        ldrh    r4, [r6]
        ldrh    r5, [r7]
        add     lr, lr, #4
        cmp     lr, r8
        add     r4, r5, r4
        mov     r5, r4, lsr r3
        and     r5, r5, #1
        add     r4, r12, r4
        add     r5, r4, r5
        mov     r4, r5, lsr r3
        strh    r4, [r6]
        ldrh    r5, [r6, #2]
        ldrh    r9, [r7, #2]
        ldrh    r4, [r6, #4]
        add     r5, r9, r5
        mov     r9, r5, lsr r3
        and     r9, r9, #1
        add     r5, r12, r5
        add     r9, r5, r9
        mov     r5, r9, lsr r3
        strh    r5, [r6, #2]
        ldrh    r9, [r7, #4]
        ldrh    r5, [r6, #6]
        add     r4, r9, r4
        mov     r9, r4, lsr r3
        and     r9, r9, #1
        add     r4, r12, r4
        add     r9, r4, r9
        mov     r4, r9, lsr r3
        strh    r4, [r6, #4]
        ldrh    r4, [r7, #6]
        add     r7, r7, #8
        add     r4, r4, r5
        mov     r5, r4, lsr r3
        and     r5, r5, #1
        add     r4, r12, r4
        add     r5, r4, r5
        mov     r4, r5, lsr r3
        strh    r4, [r6, #6]
        add     r6, r6, #8
        ble     LCZY4
LCZY5:
        add     r0, r0, lr, lsl #1
        add     r1, r1, lr, lsl #1
LCZY6:
        ldrh    r4, [r1]
        ldrh    r5, [r0], #2
        add     lr, lr, #1
        cmp     lr, r2
        add     r4, r5, r4
        mov     r5, r4, lsr r3
        and     r5, r5, #1
        add     r4, r12, r4
        add     r5, r4, r5
        mov     r4, r5, lsr r3
        strh    r4, [r1], #2
        blt     LCZY6
LCZY7:
        ldmia   sp!, {r4 - r9, pc}
LCZY8:
        cmn     r3, #0xF
        bge     LCZY12
        cmp     r2, #0
        ble     LCZY7
        mov     r3, lr
LCZY9:
        ldrh    r4, [r0], #2
        cmp     r4, #0
        bne     LCZY10
        ldrh    r4, [r1]
        cmp     r4, #0
        moveq   r4, lr
        beq     LCZY11
LCZY10:
        mov     r4, r12
LCZY11:
        add     r3, r3, #1
        strh    r4, [r1], #2
        cmp     r3, r2
        blt     LCZY9
        ldmia   sp!, {r4 - r9, pc}
LCZY12:
        cmp     r2, #0
        rsb     r3, r3, #0
        ble     LCZY7
        cmp     r2, #5
        blt     LCZY14
        sub     r6, r2, #5
        mov     r5, r0
        mov     r4, r1
LCZY13:
        ldrh    r8, [r4]
        ldrh    r7, [r5]
        add     lr, lr, #4
        add     r8, r7, r8
        mov     r7, r8, lsl r3
        cmp     r7, r12
        mov     r8, r12
        movcc   r8, r7
        strh    r8, [r4]
        ldrh    r8, [r4, #2]
        ldrh    r7, [r5, #2]
        add     r8, r7, r8
        mov     r7, r8, lsl r3
        cmp     r7, r12
        mov     r8, r12
        movcc   r8, r7
        strh    r8, [r4, #2]
        ldrh    r8, [r4, #4]
        ldrh    r7, [r5, #4]
        add     r8, r7, r8
        mov     r7, r8, lsl r3
        cmp     r7, r12
        mov     r8, r12
        movcc   r8, r7
        strh    r8, [r4, #4]
        ldrh    r8, [r4, #6]
        ldrh    r7, [r5, #6]
        add     r5, r5, #8
        add     r8, r7, r8
        mov     r7, r8, lsl r3
        cmp     r7, r12
        mov     r8, r12
        movcc   r8, r7
        strh    r8, [r4, #6]
        cmp     lr, r6
        add     r4, r4, #8
        ble     LCZY13
LCZY14:
        add     r0, r0, lr, lsl #1
        add     r1, r1, lr, lsl #1
LCZY15:
        ldrh    r5, [r1]
        ldrh    r4, [r0], #2
        add     lr, lr, #1
        add     r5, r4, r5
        mov     r4, r5, lsl r3
        cmp     r4, r12
        mov     r5, r12
        movcc   r5, r4
        strh    r5, [r1], #2
        cmp     lr, r2
        blt     LCZY15
        ldmia   sp!, {r4 - r9, pc}


