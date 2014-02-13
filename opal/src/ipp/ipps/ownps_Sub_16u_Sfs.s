        .text
        .align  4
        .globl  ownps_Sub_16u_Sfs


ownps_Sub_16u_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        ldr     r12, [sp, #0x24]
        cmp     r12, #0
        mov     lr, #0
        bne     LCZJ3
        cmp     r3, #0
        ble     LCZJ7
        cmp     r3, #5
        movlt   r8, #0
        blt     LCZJ1
        mov     r8, #0
        sub     r7, r3, #5
        mov     r6, r8
        mov     r5, r1
        mov     r4, r0
        mov     r12, r2
LCZJ0:
        ldrh    r9, [r5]
        ldrh    r10, [r4]
        add     r8, r8, #4
        sub     r9, r9, r10
        cmp     r9, #0
        mov     r10, r6
        movgt   r10, r9
        strh    r10, [r12]
        ldrh    r9, [r5, #2]
        ldrh    r10, [r4, #2]
        sub     r9, r9, r10
        cmp     r9, #0
        mov     r10, r6
        movgt   r10, r9
        strh    r10, [r12, #2]
        ldrh    r9, [r5, #4]
        ldrh    r10, [r4, #4]
        sub     r9, r9, r10
        cmp     r9, #0
        mov     r10, r6
        movgt   r10, r9
        strh    r10, [r12, #4]
        ldrh    r9, [r5, #6]
        ldrh    r10, [r4, #6]
        add     r5, r5, #8
        add     r4, r4, #8
        sub     r9, r9, r10
        cmp     r9, #0
        mov     r10, r6
        movgt   r10, r9
        strh    r10, [r12, #6]
        cmp     r8, r7
        add     r12, r12, #8
        ble     LCZJ0
LCZJ1:
        add     r1, r1, r8, lsl #1
        add     r0, r0, r8, lsl #1
        add     r2, r2, r8, lsl #1
LCZJ2:
        ldrh    r12, [r0], #2
        ldrh    r4, [r1], #2
        add     r8, r8, #1
        sub     r12, r4, r12
        cmp     r12, #0
        mov     r4, lr
        movgt   r4, r12
        strh    r4, [r2], #2
        cmp     r8, r3
        blt     LCZJ2
        ldmia   sp!, {r4 - r11, pc}
LCZJ3:
        cmp     r12, #0
        ble     LCZJ8
        sub     r4, r12, #1
        mov     r5, #1
        mov     r4, r5, lsl r4
        cmp     r3, #0
        sub     r4, r4, #1
        ble     LCZJ7
        cmp     r3, #4
        movlt   r5, #0
        blt     LCZJ5
        mov     r5, #0
        sub     r9, r3, #4
        mov     r8, r1
        mov     r7, r0
        mov     r6, r2
LCZJ4:
        ldrh    r11, [r7]
        ldrh    r10, [r8]
        add     r5, r5, #3
        sub     r10, r10, r11
        mov     r11, lr
        cmp     r10, #0
        movgt   r11, r10
        bic     r11, r11, #0xFF, 8
        bic     r10, r11, #0xFF, 16
        mov     r11, r10, asr r12
        and     r11, r11, #1
        add     r10, r4, r10
        add     r11, r10, r11
        mov     r10, r11, asr r12
        strh    r10, [r6]
        ldrh    r10, [r8, #2]
        ldrh    r11, [r7, #2]
        sub     r10, r10, r11
        cmp     r10, #0
        mov     r11, lr
        movgt   r11, r10
        bic     r11, r11, #0xFF, 8
        bic     r10, r11, #0xFF, 16
        mov     r11, r10, asr r12
        and     r11, r11, #1
        add     r10, r4, r10
        add     r11, r10, r11
        mov     r10, r11, asr r12
        strh    r10, [r6, #2]
        ldrh    r10, [r8, #4]
        ldrh    r11, [r7, #4]
        add     r8, r8, #6
        add     r7, r7, #6
        sub     r10, r10, r11
        cmp     r10, #0
        mov     r11, lr
        movgt   r11, r10
        bic     r11, r11, #0xFF, 8
        bic     r10, r11, #0xFF, 16
        mov     r11, r10, asr r12
        and     r11, r11, #1
        add     r10, r4, r10
        add     r11, r10, r11
        mov     r10, r11, asr r12
        strh    r10, [r6, #4]
        cmp     r5, r9
        add     r6, r6, #6
        ble     LCZJ4
LCZJ5:
        add     r1, r1, r5, lsl #1
        add     r0, r0, r5, lsl #1
        add     r2, r2, r5, lsl #1
        mov     lr, #0
LCZJ6:
        ldrh    r6, [r0], #2
        ldrh    r7, [r1], #2
        add     r5, r5, #1
        sub     r6, r7, r6
        cmp     r6, #0
        mov     r7, lr
        movgt   r7, r6
        bic     r7, r7, #0xFF, 8
        bic     r6, r7, #0xFF, 16
        mov     r7, r6, asr r12
        and     r7, r7, #1
        add     r6, r4, r6
        add     r7, r6, r7
        mov     r6, r7, asr r12
        strh    r6, [r2], #2
        cmp     r5, r3
        blt     LCZJ6
LCZJ7:
        ldmia   sp!, {r4 - r11, pc}
LCZJ8:
        mov     r4, #0xFF
        cmn     r12, #0xF
        orr     r5, r4, #0xFF, 24
        bge     LCZJ10
        cmp     r3, #0
        ble     LCZJ7
        mov     r12, #0
LCZJ9:
        ldrh    r4, [r1], #2
        ldrh    lr, [r0], #2
        cmp     r4, lr
        movle   lr, #0
        movgt   lr, r5
        add     r12, r12, #1
        strh    lr, [r2], #2
        cmp     r12, r3
        blt     LCZJ9
        ldmia   sp!, {r4 - r11, pc}
LCZJ10:
        cmp     r3, #0
        rsb     r12, r12, #0
        ble     LCZJ7
        cmp     r3, #5
        movlt   r4, #0
        blt     LCZJ12
        mov     r4, #0
        sub     r9, r3, #5
        mov     r8, r1
        mov     r7, r0
        mov     r6, r2
LCZJ11:
        ldrh    r10, [r7]
        ldrh    r11, [r8]
        add     r4, r4, #4
        sub     r10, r11, r10
        cmp     r10, #0
        mov     r11, lr
        movgt   r11, r10
        bic     r11, r11, #0xFF, 8
        bic     r11, r11, #0xFF, 16
        mov     r10, r11, lsl r12
        mov     r11, r5
        cmp     r10, r5
        movlt   r11, r10
        strh    r11, [r6]
        ldrh    r10, [r7, #2]
        ldrh    r11, [r8, #2]
        sub     r10, r11, r10
        cmp     r10, #0
        mov     r11, lr
        movgt   r11, r10
        bic     r11, r11, #0xFF, 8
        bic     r11, r11, #0xFF, 16
        mov     r10, r11, lsl r12
        cmp     r10, r5
        mov     r11, r5
        movlt   r11, r10
        strh    r11, [r6, #2]
        ldrh    r10, [r7, #4]
        ldrh    r11, [r8, #4]
        sub     r10, r11, r10
        cmp     r10, #0
        mov     r11, lr
        movgt   r11, r10
        bic     r11, r11, #0xFF, 8
        bic     r11, r11, #0xFF, 16
        mov     r10, r11, lsl r12
        cmp     r10, r5
        mov     r11, r5
        movlt   r11, r10
        strh    r11, [r6, #4]
        ldrh    r10, [r7, #6]
        ldrh    r11, [r8, #6]
        add     r8, r8, #8
        add     r7, r7, #8
        sub     r10, r11, r10
        cmp     r10, #0
        mov     r11, lr
        movgt   r11, r10
        bic     r11, r11, #0xFF, 8
        bic     r11, r11, #0xFF, 16
        mov     r10, r11, lsl r12
        cmp     r10, r5
        mov     r11, r5
        movlt   r11, r10
        strh    r11, [r6, #6]
        cmp     r4, r9
        add     r6, r6, #8
        ble     LCZJ11
LCZJ12:
        mov     lr, #0xFF
        orr     lr, lr, #0xFF, 24
        add     r1, r1, r4, lsl #1
        add     r0, r0, r4, lsl #1
        add     r2, r2, r4, lsl #1
        mov     r5, #0
LCZJ13:
        ldrh    r6, [r0], #2
        ldrh    r7, [r1], #2
        add     r4, r4, #1
        sub     r6, r7, r6
        cmp     r6, #0
        mov     r7, r5
        movgt   r7, r6
        bic     r7, r7, #0xFF, 8
        bic     r7, r7, #0xFF, 16
        mov     r6, r7, lsl r12
        cmp     r6, lr
        mov     r7, lr
        movlt   r7, r6
        strh    r7, [r2], #2
        cmp     r4, r3
        blt     LCZJ13
        ldmia   sp!, {r4 - r11, pc}


