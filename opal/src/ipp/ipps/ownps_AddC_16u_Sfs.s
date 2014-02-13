        .text
        .align  4
        .globl  ownps_AddC_16u_Sfs


ownps_AddC_16u_Sfs:
        stmdb   sp!, {r4 - r9, lr}
        ldr     lr, [sp, #0x1C]
        mov     r12, #0xFF
        orr     r12, r12, #0xFF, 24
        cmp     lr, #0
        mov     r4, #0
        bne     LCZZ3
        cmp     r3, #0
        ble     LCZZ7
        cmp     r3, #6
        blt     LCZZ1
        sub     r6, r3, #6
        mov     r5, r0
        mov     lr, r2
LCZZ0:
        ldrh    r7, [r5]
        add     r4, r4, #5
        mov     r8, r12
        add     r7, r1, r7
        cmp     r7, r12
        movcc   r8, r7
        strh    r8, [lr]
        ldrh    r7, [r5, #2]
        mov     r8, r12
        add     r7, r1, r7
        cmp     r7, r12
        movcc   r8, r7
        strh    r8, [lr, #2]
        ldrh    r7, [r5, #4]
        mov     r8, r12
        add     r7, r1, r7
        cmp     r7, r12
        movcc   r8, r7
        strh    r8, [lr, #4]
        ldrh    r7, [r5, #6]
        mov     r8, r12
        add     r7, r1, r7
        cmp     r7, r12
        movcc   r8, r7
        strh    r8, [lr, #6]
        ldrh    r7, [r5, #8]
        add     r5, r5, #0xA
        mov     r8, r12
        add     r7, r1, r7
        cmp     r7, r12
        movcc   r8, r7
        strh    r8, [lr, #8]
        cmp     r4, r6
        add     lr, lr, #0xA
        ble     LCZZ0
LCZZ1:
        add     r0, r0, r4, lsl #1
        add     r2, r2, r4, lsl #1
LCZZ2:
        ldrh    lr, [r0], #2
        add     r4, r4, #1
        add     lr, r1, lr
        cmp     lr, r12
        mov     r5, r12
        movcc   r5, lr
        strh    r5, [r2], #2
        cmp     r4, r3
        blt     LCZZ2
        ldmia   sp!, {r4 - r9, pc}
LCZZ3:
        cmp     lr, #0
        ble     LCZZ8
        sub     r5, lr, #1
        mov     r12, #1
        mov     r5, r12, lsl r5
        cmp     r3, #0
        sub     r12, r5, #1
        ble     LCZZ7
        cmp     r3, #5
        blt     LCZZ5
        sub     r7, r3, #5
        mov     r6, r0
        mov     r5, r2
LCZZ4:
        ldrh    r8, [r6]
        add     r4, r4, #4
        cmp     r4, r7
        add     r8, r1, r8
        mov     r9, r8, lsr lr
        and     r9, r9, #1
        add     r8, r12, r8
        add     r9, r8, r9
        mov     r8, r9, lsr lr
        strh    r8, [r5]
        ldrh    r8, [r6, #2]
        add     r8, r1, r8
        mov     r9, r8, lsr lr
        and     r9, r9, #1
        add     r8, r12, r8
        add     r9, r8, r9
        mov     r8, r9, lsr lr
        strh    r8, [r5, #2]
        ldrh    r8, [r6, #4]
        add     r8, r1, r8
        mov     r9, r8, lsr lr
        and     r9, r9, #1
        add     r8, r12, r8
        add     r9, r8, r9
        mov     r8, r9, lsr lr
        strh    r8, [r5, #4]
        ldrh    r8, [r6, #6]
        add     r6, r6, #8
        add     r8, r1, r8
        mov     r9, r8, lsr lr
        and     r9, r9, #1
        add     r8, r12, r8
        add     r9, r8, r9
        mov     r8, r9, lsr lr
        strh    r8, [r5, #6]
        add     r5, r5, #8
        ble     LCZZ4
LCZZ5:
        add     r0, r0, r4, lsl #1
        add     r2, r2, r4, lsl #1
LCZZ6:
        ldrh    r5, [r0], #2
        add     r4, r4, #1
        add     r5, r1, r5
        mov     r6, r5, lsr lr
        and     r6, r6, #1
        add     r5, r12, r5
        add     r6, r5, r6
        mov     r5, r6, lsr lr
        strh    r5, [r2], #2
        cmp     r4, r3
        blt     LCZZ6
LCZZ7:
        ldmia   sp!, {r4 - r9, pc}
LCZZ8:
        cmn     lr, #0xF
        bge     LCZZ10
        cmp     r3, #0
        ble     LCZZ7
        mov     r1, r4
LCZZ9:
        ldrh    lr, [r0], #2
        cmp     lr, #0
        moveq   lr, r4
        movne   lr, r12
        add     r1, r1, #1
        strh    lr, [r2], #2
        cmp     r1, r3
        blt     LCZZ9
        ldmia   sp!, {r4 - r9, pc}
LCZZ10:
        cmp     r3, #0
        rsb     lr, lr, #0
        ble     LCZZ7
        cmp     r3, #5
        blt     LCZZ12
        sub     r7, r3, #5
        mov     r6, r0
        mov     r5, r2
LCZZ11:
        ldrh    r8, [r6]
        add     r4, r4, #4
        mov     r9, r12
        add     r8, r1, r8
        mov     r8, r8, lsl lr
        cmp     r8, r12
        movcc   r9, r8
        strh    r9, [r5]
        ldrh    r8, [r6, #2]
        mov     r9, r12
        add     r8, r1, r8
        mov     r8, r8, lsl lr
        cmp     r8, r12
        movcc   r9, r8
        strh    r9, [r5, #2]
        ldrh    r8, [r6, #4]
        mov     r9, r12
        add     r8, r1, r8
        mov     r8, r8, lsl lr
        cmp     r8, r12
        movcc   r9, r8
        strh    r9, [r5, #4]
        ldrh    r8, [r6, #6]
        add     r6, r6, #8
        mov     r9, r12
        add     r8, r1, r8
        mov     r8, r8, lsl lr
        cmp     r8, r12
        movcc   r9, r8
        strh    r9, [r5, #6]
        cmp     r4, r7
        add     r5, r5, #8
        ble     LCZZ11
LCZZ12:
        add     r0, r0, r4, lsl #1
        add     r2, r2, r4, lsl #1
LCZZ13:
        ldrh    r5, [r0], #2
        add     r4, r4, #1
        add     r5, r1, r5
        mov     r5, r5, lsl lr
        cmp     r5, r12
        mov     r6, r12
        movcc   r6, r5
        strh    r6, [r2], #2
        cmp     r4, r3
        blt     LCZZ13
        ldmia   sp!, {r4 - r9, pc}


