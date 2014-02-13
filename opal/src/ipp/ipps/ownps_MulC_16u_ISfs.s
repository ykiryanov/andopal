        .text
        .align  4
        .globl  ownps_MulC_16u_ISfs


ownps_MulC_16u_ISfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        mov     r4, r3
        mov     r12, #0xFF
        cmp     r4, #0
        orr     r3, r12, #0xFF, 24
        mov     r6, r0
        mov     r7, r1
        mov     r8, r2
        mov     r9, #0
        bne     LCZS3
        cmp     r8, #0
        ble     LCZS7
        cmp     r8, #6
        blt     LCZS1
        sub     r0, r8, #6
        mov     r11, r7
LCZS0:
        ldrh    r4, [r11]
        ldrh    r12, [r11, #2]
        ldrh    lr, [r11, #4]
        mul     r5, r6, r4
        ldrh    r4, [r11, #6]
        mul     r12, r6, r12
        mul     lr, r6, lr
        mul     r4, r6, r4
        cmp     r5, r3
        mov     r1, r3
        movcc   r1, r5
        cmp     r12, r3
        mov     r5, r3
        movcc   r5, r12
        ldrh    r12, [r11, #8]
        strh    r5, [r11, #2]
        cmp     lr, r3
        mul     r12, r6, r12
        mov     r5, r3
        movcc   r5, lr
        cmp     r4, r3
        mov     lr, r3
        movcc   lr, r4
        strh    lr, [r11, #6]
        cmp     r12, r3
        mov     lr, r3
        movcc   lr, r12
        add     r9, r9, #5
        strh    r1, [r11]
        strh    r5, [r11, #4]
        strh    lr, [r11, #8]
        cmp     r9, r0
        add     r11, r11, #0xA
        ble     LCZS0
LCZS1:
        add     r7, r7, r9, lsl #1
LCZS2:
        ldrh    r1, [r7]
        add     r9, r9, #1
        mov     r12, r3
        mul     r1, r6, r1
        cmp     r1, r3
        movcc   r12, r1
        strh    r12, [r7], #2
        cmp     r9, r8
        blt     LCZS2
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCZS3:
        cmp     r4, #0
        ble     LCZS8
        sub     lr, r4, #1
        mov     r12, #1
        mov     lr, r12, lsl lr
        sub     r0, lr, #1
        cmp     r8, #0
        mov     r10, r0, asr #31
        ble     LCZS7
        cmp     r8, #5
        movlt   r5, r4, asr #31
        blt     LCZS5
        sub     r12, r8, #5
        mov     r11, r7
        str     r7, [sp, #4]
        str     r8, [sp, #8]
        mov     r5, r4, asr #31
        str     r12, [sp]
        mov     r8, r0
        mov     r7, r3
LCZS4:
        ldrh    r1, [r11]
        mov     r2, r4
        mov     r3, r5
        mul     r12, r6, r1
        add     r9, r9, #4
        mov     r1, r12, lsr r4
        and     r1, r1, #1
        adds    lr, r8, r12
        adc     r12, r10, #0
        adds    r0, lr, r1
        adc     r1, r12, #0
        bl      __lshrdi3
        cmp     r0, r7
        mov     r1, r7
        movcc   r1, r0
        strh    r1, [r11]
        ldrh    r1, [r11, #2]
        mov     r2, r4
        mov     r3, r5
        mul     r12, r6, r1
        mov     r1, r12, lsr r4
        and     r1, r1, #1
        adds    lr, r8, r12
        adc     r12, r10, #0
        adds    r0, lr, r1
        adc     r1, r12, #0
        bl      __lshrdi3
        mov     r1, r7
        cmp     r0, r7
        movcc   r1, r0
        strh    r1, [r11, #2]
        ldrh    r1, [r11, #4]
        mov     r2, r4
        mov     r3, r5
        mul     lr, r6, r1
        adds    r1, r8, lr
        adc     r12, r10, #0
        mov     lr, lr, lsr r4
        and     lr, lr, #1
        adds    r0, r1, lr
        adc     r1, r12, #0
        bl      __lshrdi3
        cmp     r0, r7
        mov     r1, r7
        movcc   r1, r0
        strh    r1, [r11, #4]
        ldrh    r1, [r11, #6]
        mov     r2, r4
        mov     r3, r5
        mul     lr, r6, r1
        adds    r1, r8, lr
        adc     r12, r10, #0
        mov     lr, lr, lsr r4
        and     lr, lr, #1
        adds    r0, r1, lr
        adc     r1, r12, #0
        bl      __lshrdi3
        cmp     r0, r7
        mov     r1, r7
        movcc   r1, r0
        strh    r1, [r11, #6]
        ldr     r1, [sp]
        add     r11, r11, #8
        cmp     r9, r1
        ble     LCZS4
        mov     r0, r8
        ldr     r7, [sp, #4]
        ldr     r8, [sp, #8]
LCZS5:
        mov     r12, #0xFF
        orr     r11, r12, #0xFF, 24
        add     r7, r7, r9, lsl #1
        str     r0, [sp, #0xC]
LCZS6:
        ldrh    r1, [r7]
        add     r9, r9, #1
        mov     r2, r4
        mul     r12, r6, r1
        ldr     r1, [sp, #0xC]
        mov     r3, r5
        adds    r1, r1, r12
        mov     r12, r12, lsr r4
        and     lr, r12, #1
        adc     r12, r10, #0
        adds    r0, r1, lr
        adc     r1, r12, #0
        bl      __lshrdi3
        cmp     r0, r11
        mov     r1, r11
        movcc   r1, r0
        strh    r1, [r7], #2
        cmp     r9, r8
        blt     LCZS6
LCZS7:
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCZS8:
        cmn     r4, #0xF
        bge     LCZS10
        cmp     r8, #0
        ble     LCZS7
        mov     r0, r9
LCZS9:
        ldrh    r12, [r7]
        cmp     r12, #0
        moveq   r12, r9
        movne   r12, r3
        add     r0, r0, #1
        strh    r12, [r7], #2
        cmp     r0, r8
        blt     LCZS9
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCZS10:
        cmp     r8, #0
        rsb     r4, r4, #0
        ble     LCZS7
        mov     r5, r4, asr #31
        mov     r10, r3
LCZS11:
        ldrh    r12, [r7]
        mov     r3, r5
        mov     r1, #0
        mul     r0, r6, r12
        mov     r2, r4
        bl      __ashldi3
        cmp     r1, #0
        cmpeq   r0, r10
        movcs   r0, r10
        add     r9, r9, #1
        strh    r0, [r7], #2
        cmp     r9, r8
        blt     LCZS11
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}


