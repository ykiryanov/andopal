        .text
        .align  4
        .globl  ownps_Mul_16u_ISfs


ownps_Mul_16u_ISfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        mov     r4, r3
        mov     r12, #0xFF
        cmp     r4, #0
        orr     r3, r12, #0xFF, 24
        mov     r8, r1
        mov     r6, r2
        mov     r7, #0
        bne     LCZQ3
        cmp     r6, #0
        ble     LCZQ7
        cmp     r6, #5
        blt     LCZQ1
        sub     r5, r6, #5
        mov     r4, r0
        mov     lr, r8
LCZQ0:
        ldrh    r11, [r4]
        ldrh    r1, [lr]
        ldrh    r12, [lr, #2]
        add     r7, r7, #4
        mov     r9, r3
        mul     r2, r1, r11
        ldrh    r11, [lr, #4]
        ldrh    r1, [lr, #6]
        cmp     r2, r3
        movcc   r9, r2
        strh    r9, [lr]
        ldrh    r2, [r4, #2]
        mul     r12, r12, r2
        mov     r2, r3
        cmp     r12, r3
        movcc   r2, r12
        strh    r2, [lr, #2]
        ldrh    r12, [r4, #4]
        mul     r11, r11, r12
        mov     r12, r3
        cmp     r11, r3
        movcc   r12, r11
        strh    r12, [lr, #4]
        ldrh    r12, [r4, #6]
        add     r4, r4, #8
        mul     r1, r1, r12
        mov     r12, r3
        cmp     r1, r3
        movcc   r12, r1
        strh    r12, [lr, #6]
        cmp     r7, r5
        add     lr, lr, #8
        ble     LCZQ0
LCZQ1:
        add     r0, r0, r7, lsl #1
        add     r8, r8, r7, lsl #1
LCZQ2:
        ldrh    r1, [r8]
        ldrh    r12, [r0], #2
        add     r7, r7, #1
        mul     r1, r1, r12
        mov     r12, r3
        cmp     r1, r3
        movcc   r12, r1
        strh    r12, [r8], #2
        cmp     r7, r6
        blt     LCZQ2
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCZQ3:
        cmp     r4, #0
        ble     LCZQ8
        sub     r12, r4, #1
        mov     lr, #1
        mov     r12, lr, lsl r12
        sub     r1, r12, #1
        cmp     r6, #0
        mov     r9, r1, asr #31
        ble     LCZQ7
        cmp     r6, #4
        movlt   r5, r4, asr #31
        blt     LCZQ5
        sub     r12, r6, #4
        mov     r11, r8
        str     r8, [sp, #4]
        str     r6, [sp, #0xC]
        mov     r5, r4, asr #31
        mov     r10, r0
        str     r0, [sp, #8]
        str     r12, [sp]
        mov     r8, r1
        mov     r6, r3
LCZQ4:
        ldrh    r0, [r10]
        ldrh    r12, [r11]
        mov     r2, r4
        mov     r3, r5
        add     r7, r7, #3
        mul     lr, r12, r0
        adds    r0, r8, lr
        adc     r12, r9, #0
        mov     lr, lr, lsr r4
        and     lr, lr, #1
        adds    r0, r0, lr
        adc     r1, r12, #0
        bl      __lshrdi3
        cmp     r0, r6
        mov     r12, r6
        movcc   r12, r0
        strh    r12, [r11]
        ldrh    r0, [r10, #2]
        ldrh    r12, [r11, #2]
        mov     r2, r4
        mov     r3, r5
        mul     lr, r12, r0
        adds    r0, r8, lr
        adc     r12, r9, #0
        mov     lr, lr, lsr r4
        and     lr, lr, #1
        adds    r0, r0, lr
        adc     r1, r12, #0
        bl      __lshrdi3
        cmp     r0, r6
        mov     r12, r6
        movcc   r12, r0
        strh    r12, [r11, #2]
        ldrh    r0, [r10, #4]
        ldrh    r12, [r11, #4]
        add     r10, r10, #6
        mov     r2, r4
        mov     r3, r5
        mul     lr, r12, r0
        adds    r0, r8, lr
        adc     r12, r9, #0
        mov     lr, lr, lsr r4
        and     lr, lr, #1
        adds    r0, r0, lr
        adc     r1, r12, #0
        bl      __lshrdi3
        cmp     r0, r6
        mov     r12, r6
        movcc   r12, r0
        strh    r12, [r11, #4]
        ldr     r0, [sp]
        add     r11, r11, #6
        cmp     r7, r0
        ble     LCZQ4
        mov     r1, r8
        ldr     r8, [sp, #4]
        ldr     r0, [sp, #8]
        ldr     r6, [sp, #0xC]
LCZQ5:
        mov     r12, #0xFF
        orr     r10, r12, #0xFF, 24
        add     r11, r0, r7, lsl #1
        add     r8, r8, r7, lsl #1
        str     r1, [sp, #0x10]
LCZQ6:
        ldrh    r1, [r11], #2
        ldrh    r0, [r8]
        add     r7, r7, #1
        mov     r2, r4
        mul     r1, r0, r1
        ldr     r0, [sp, #0x10]
        mov     r3, r5
        adds    r0, r0, r1
        mov     r1, r1, lsr r4
        and     r12, r1, #1
        adc     r1, r9, #0
        adds    r0, r0, r12
        adc     r1, r1, #0
        bl      __lshrdi3
        cmp     r0, r10
        mov     r1, r10
        movcc   r1, r0
        strh    r1, [r8], #2
        cmp     r7, r6
        blt     LCZQ6
LCZQ7:
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCZQ8:
        cmn     r4, #0xF
        bge     LCZQ12
        cmp     r6, #0
        ble     LCZQ7
        mov     r12, r7
LCZQ9:
        ldrh    lr, [r0], #2
        cmp     lr, #0
        beq     LCZQ10
        ldrh    lr, [r8]
        cmp     lr, #0
        movne   lr, r3
        bne     LCZQ11
LCZQ10:
        mov     lr, r7
LCZQ11:
        add     r12, r12, #1
        strh    lr, [r8], #2
        cmp     r12, r6
        blt     LCZQ9
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCZQ12:
        cmp     r6, #0
        rsb     r4, r4, #0
        ble     LCZQ7
        mov     r9, r7
        mov     r7, r6
        mov     r5, r4, asr #31
        mov     r6, r0
        mov     r10, r3
LCZQ13:
        ldrh    lr, [r6], #2
        ldrh    r12, [r8]
        mov     r3, r5
        mov     r1, #0
        mul     r0, r12, lr
        mov     r2, r4
        bl      __ashldi3
        cmp     r1, #0
        cmpeq   r0, r10
        movcs   r0, r10
        add     r9, r9, #1
        strh    r0, [r8], #2
        cmp     r9, r7
        blt     LCZQ13
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}


