        .text
        .align  4
        .globl  ownps_Sub_16u_ISfs


ownps_Sub_16u_ISfs:
        stmdb   sp!, {r4 - r10, lr}
        cmp     r3, #0
        mov     r12, #0
        bne     LCZK3
        cmp     r2, #0
        ble     LCZK7
        cmp     r2, #5
        movlt   r6, #0
        blt     LCZK1
        mov     r6, #0
        sub     r5, r2, #5
        mov     r4, r6
        mov     lr, r1
        mov     r3, r0
LCZK0:
        ldrh    r7, [lr]
        ldrh    r8, [r3]
        add     r6, r6, #4
        sub     r7, r7, r8
        cmp     r7, #0
        mov     r8, r4
        movgt   r8, r7
        strh    r8, [lr]
        ldrh    r7, [lr, #2]
        ldrh    r8, [r3, #2]
        sub     r7, r7, r8
        cmp     r7, #0
        mov     r8, r4
        movgt   r8, r7
        strh    r8, [lr, #2]
        ldrh    r7, [lr, #4]
        ldrh    r8, [r3, #4]
        sub     r7, r7, r8
        cmp     r7, #0
        mov     r8, r4
        movgt   r8, r7
        strh    r8, [lr, #4]
        ldrh    r7, [lr, #6]
        ldrh    r8, [r3, #6]
        add     r3, r3, #8
        sub     r7, r7, r8
        cmp     r7, #0
        mov     r8, r4
        movgt   r8, r7
        strh    r8, [lr, #6]
        cmp     r6, r5
        add     lr, lr, #8
        ble     LCZK0
LCZK1:
        add     r1, r1, r6, lsl #1
        add     r0, r0, r6, lsl #1
LCZK2:
        ldrh    r3, [r0], #2
        ldrh    lr, [r1]
        add     r6, r6, #1
        sub     r3, lr, r3
        cmp     r3, #0
        mov     lr, r12
        movgt   lr, r3
        strh    lr, [r1], #2
        cmp     r6, r2
        blt     LCZK2
        ldmia   sp!, {r4 - r10, pc}
LCZK3:
        cmp     r3, #0
        ble     LCZK8
        sub     lr, r3, #1
        mov     r4, #1
        mov     lr, r4, lsl lr
        cmp     r2, #0
        sub     lr, lr, #1
        ble     LCZK7
        cmp     r2, #4
        movlt   r4, #0
        blt     LCZK5
        mov     r4, #0
        sub     r8, r2, #4
        mov     r7, r4
        mov     r6, r1
        mov     r5, r0
LCZK4:
        ldrh    r9, [r6]
        ldrh    r10, [r5]
        add     r4, r4, #3
        sub     r9, r9, r10
        mov     r10, r7
        cmp     r9, #0
        movgt   r10, r9
        bic     r10, r10, #0xFF, 8
        bic     r9, r10, #0xFF, 16
        mov     r10, r9, asr r3
        and     r10, r10, #1
        add     r9, lr, r9
        add     r10, r9, r10
        mov     r9, r10, asr r3
        strh    r9, [r6]
        ldrh    r9, [r6, #2]
        ldrh    r10, [r5, #2]
        sub     r9, r9, r10
        cmp     r9, #0
        mov     r10, r7
        movgt   r10, r9
        bic     r10, r10, #0xFF, 8
        bic     r9, r10, #0xFF, 16
        mov     r10, r9, asr r3
        and     r10, r10, #1
        add     r9, lr, r9
        add     r10, r9, r10
        mov     r9, r10, asr r3
        strh    r9, [r6, #2]
        ldrh    r9, [r6, #4]
        ldrh    r10, [r5, #4]
        add     r5, r5, #6
        sub     r9, r9, r10
        cmp     r9, #0
        mov     r10, r7
        movgt   r10, r9
        bic     r10, r10, #0xFF, 8
        bic     r9, r10, #0xFF, 16
        mov     r10, r9, asr r3
        and     r10, r10, #1
        add     r9, lr, r9
        add     r10, r9, r10
        mov     r9, r10, asr r3
        strh    r9, [r6, #4]
        cmp     r4, r8
        add     r6, r6, #6
        ble     LCZK4
LCZK5:
        add     r1, r1, r4, lsl #1
        add     r0, r0, r4, lsl #1
LCZK6:
        ldrh    r5, [r0], #2
        ldrh    r6, [r1]
        add     r4, r4, #1
        sub     r5, r6, r5
        cmp     r5, #0
        mov     r6, r12
        movgt   r6, r5
        bic     r6, r6, #0xFF, 8
        bic     r5, r6, #0xFF, 16
        mov     r6, r5, asr r3
        and     r6, r6, #1
        add     r5, lr, r5
        add     r6, r5, r6
        mov     r5, r6, asr r3
        strh    r5, [r1], #2
        cmp     r4, r2
        blt     LCZK6
LCZK7:
        ldmia   sp!, {r4 - r10, pc}
LCZK8:
        mov     lr, #0xFF
        cmn     r3, #0xF
        orr     lr, lr, #0xFF, 24
        bge     LCZK10
        cmp     r2, #0
        ble     LCZK7
        mov     r3, #0
LCZK9:
        ldrh    r12, [r0], #2
        ldrh    r4, [r1]
        cmp     r4, r12
        movle   r12, #0
        movgt   r12, lr
        add     r3, r3, #1
        strh    r12, [r1], #2
        cmp     r3, r2
        blt     LCZK9
        ldmia   sp!, {r4 - r10, pc}
LCZK10:
        cmp     r2, #0
        rsb     r3, r3, #0
        ble     LCZK7
        cmp     r2, #5
        movlt   r4, #0
        blt     LCZK12
        mov     r4, #0
        sub     r7, r2, #5
        mov     r6, r1
        mov     r5, r0
LCZK11:
        ldrh    r8, [r5]
        ldrh    r9, [r6]
        add     r4, r4, #4
        sub     r8, r9, r8
        cmp     r8, #0
        mov     r9, r12
        movgt   r9, r8
        bic     r9, r9, #0xFF, 8
        bic     r9, r9, #0xFF, 16
        mov     r8, r9, lsl r3
        mov     r9, lr
        cmp     r8, lr
        movlt   r9, r8
        strh    r9, [r6]
        ldrh    r9, [r6, #2]
        ldrh    r8, [r5, #2]
        sub     r8, r9, r8
        cmp     r8, #0
        mov     r9, r12
        movgt   r9, r8
        bic     r9, r9, #0xFF, 8
        bic     r9, r9, #0xFF, 16
        mov     r8, r9, lsl r3
        cmp     r8, lr
        mov     r9, lr
        movlt   r9, r8
        strh    r9, [r6, #2]
        ldrh    r8, [r5, #4]
        ldrh    r9, [r6, #4]
        sub     r8, r9, r8
        cmp     r8, #0
        mov     r9, r12
        movgt   r9, r8
        bic     r9, r9, #0xFF, 8
        bic     r9, r9, #0xFF, 16
        mov     r8, r9, lsl r3
        cmp     r8, lr
        mov     r9, lr
        movlt   r9, r8
        strh    r9, [r6, #4]
        ldrh    r8, [r5, #6]
        ldrh    r9, [r6, #6]
        add     r5, r5, #8
        sub     r8, r9, r8
        cmp     r8, #0
        mov     r9, r12
        movgt   r9, r8
        bic     r9, r9, #0xFF, 8
        bic     r9, r9, #0xFF, 16
        mov     r8, r9, lsl r3
        cmp     r8, lr
        mov     r9, lr
        movlt   r9, r8
        strh    r9, [r6, #6]
        cmp     r4, r7
        add     r6, r6, #8
        ble     LCZK11
LCZK12:
        add     r1, r1, r4, lsl #1
        add     r0, r0, r4, lsl #1
        mov     r12, #0
LCZK13:
        ldrh    r5, [r0], #2
        ldrh    r6, [r1]
        add     r4, r4, #1
        sub     r5, r6, r5
        cmp     r5, #0
        mov     r6, r12
        movgt   r6, r5
        bic     r6, r6, #0xFF, 8
        bic     r6, r6, #0xFF, 16
        mov     r5, r6, lsl r3
        cmp     r5, lr
        mov     r6, lr
        movlt   r6, r5
        strh    r6, [r1], #2
        cmp     r4, r2
        blt     LCZK13
        ldmia   sp!, {r4 - r10, pc}


