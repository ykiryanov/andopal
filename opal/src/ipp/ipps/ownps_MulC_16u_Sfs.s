        .text
        .align  4
        .globl  ownps_MulC_16u_Sfs


ownps_MulC_16u_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        ldr     r4, [sp, #0x40]
        mov     r12, #0xFF
        orr     r12, r12, #0xFF, 24
        cmp     r4, #0
        mov     r7, r0
        mov     r6, r1
        mov     r9, r2
        mov     r8, r3
        mov     r10, #0
        bne     LCZR3
        cmp     r8, #0
        ble     LCZR7
        cmp     r8, #6
        blt     LCZR1
        sub     r5, r8, #6
        mov     r4, r7
        mov     lr, r9
LCZR0:
        ldrh    r0, [r4]
        add     r10, r10, #5
        mov     r1, r12
        mul     r0, r6, r0
        cmp     r0, r12
        movcc   r1, r0
        strh    r1, [lr]
        ldrh    r0, [r4, #2]
        mov     r1, r12
        mul     r0, r6, r0
        cmp     r0, r12
        movcc   r1, r0
        strh    r1, [lr, #2]
        ldrh    r0, [r4, #4]
        mov     r1, r12
        mul     r0, r6, r0
        cmp     r0, r12
        movcc   r1, r0
        strh    r1, [lr, #4]
        ldrh    r0, [r4, #6]
        mov     r1, r12
        mul     r0, r6, r0
        cmp     r0, r12
        movcc   r1, r0
        strh    r1, [lr, #6]
        ldrh    r0, [r4, #8]
        add     r4, r4, #0xA
        mov     r1, r12
        mul     r0, r6, r0
        cmp     r0, r12
        movcc   r1, r0
        strh    r1, [lr, #8]
        cmp     r10, r5
        add     lr, lr, #0xA
        ble     LCZR0
LCZR1:
        add     r7, r7, r10, lsl #1
        add     r9, r9, r10, lsl #1
LCZR2:
        ldrh    r0, [r7], #2
        add     r10, r10, #1
        mul     r0, r6, r0
        mov     r2, r12
        cmp     r0, r12
        movcc   r2, r0
        strh    r2, [r9], #2
        cmp     r10, r8
        blt     LCZR2
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LCZR3:
        cmp     r4, #0
        ble     LCZR8
        sub     r5, r4, #1
        mov     lr, #1
        mov     r5, lr, lsl r5
        sub     r0, r5, #1
        cmp     r8, #0
        mov     r1, r0, asr #31
        ble     LCZR7
        cmp     r8, #5
        movlt   r5, r4, asr #31
        blt     LCZR5
        sub     lr, r8, #5
        mov     r2, r7
        mov     r11, r9
        str     r7, [sp, #8]
        str     r8, [sp, #0xC]
        str     r9, [sp, #0x10]
        str     r10, [sp]
        mov     r5, r4, asr #31
        str     lr, [sp, #4]
        mov     r9, r0
        mov     r8, r1
        mov     r10, r2
        mov     r7, r12
LCZR4:
        ldr     lr, [sp]
        mov     r2, r4
        mov     r3, r5
        add     lr, lr, #4
        str     lr, [sp]
        ldrh    lr, [r10]
        mul     r0, r6, lr
        adds    r1, r9, r0
        mov     lr, r0, lsr r4
        and     lr, lr, #1
        adc     r0, r8, #0
        adds    lr, r1, lr
        adc     r1, r0, #0
        mov     r0, lr
        bl      __lshrdi3
        cmp     r0, r7
        mov     lr, r7
        movcc   lr, r0
        strh    lr, [r11]
        ldrh    lr, [r10, #2]
        mov     r2, r4
        mov     r3, r5
        mul     r1, r6, lr
        adds    lr, r9, r1
        adc     r0, r8, #0
        mov     r1, r1, lsr r4
        and     r1, r1, #1
        adds    lr, lr, r1
        adc     r1, r0, #0
        mov     r0, lr
        bl      __lshrdi3
        mov     lr, r7
        cmp     r0, r7
        movcc   lr, r0
        strh    lr, [r11, #2]
        ldrh    lr, [r10, #4]
        mov     r2, r4
        mov     r3, r5
        mul     r1, r6, lr
        adds    lr, r9, r1
        adc     r0, r8, #0
        mov     r1, r1, lsr r4
        and     r1, r1, #1
        adds    lr, lr, r1
        adc     r1, r0, #0
        mov     r0, lr
        bl      __lshrdi3
        cmp     r0, r7
        mov     lr, r7
        movcc   lr, r0
        strh    lr, [r11, #4]
        ldrh    lr, [r10, #6]
        mov     r2, r4
        mov     r3, r5
        mul     r1, r6, lr
        add     r10, r10, #8
        adds    lr, r9, r1
        adc     r0, r8, #0
        mov     r1, r1, lsr r4
        and     r1, r1, #1
        adds    lr, lr, r1
        adc     r1, r0, #0
        mov     r0, lr
        bl      __lshrdi3
        cmp     r0, r7
        mov     lr, r7
        movcc   lr, r0
        strh    lr, [r11, #6]
        ldr     lr, [sp, #4]
        ldr     r0, [sp]
        add     r11, r11, #8
        cmp     r0, lr
        ble     LCZR4
        mov     r1, r8
        mov     r0, r9
        ldr     r7, [sp, #8]
        ldr     r8, [sp, #0xC]
        ldr     r9, [sp, #0x10]
        ldr     r10, [sp]
LCZR5:
        mov     r12, #0xFF
        orr     r11, r12, #0xFF, 24
        add     r7, r7, r10, lsl #1
        add     r9, r9, r10, lsl #1
        str     r1, [sp, #0x14]
        str     r0, [sp, #0x18]
LCZR6:
        ldrh    r0, [r7], #2
        add     r10, r10, #1
        mul     r12, r6, r0
        ldr     r0, [sp, #0x18]
        mov     r2, r4
        mov     r3, r5
        adds    r0, r0, r12
        mov     r12, r12, lsr r4
        and     lr, r12, #1
        ldr     r12, [sp, #0x14]
        adc     r12, r12, #0
        adds    r0, r0, lr
        adc     r1, r12, #0
        bl      __lshrdi3
        cmp     r0, r11
        mov     r12, r11
        movcc   r12, r0
        strh    r12, [r9], #2
        cmp     r10, r8
        blt     LCZR6
LCZR7:
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LCZR8:
        cmn     r4, #0xF
        bge     LCZR10
        cmp     r8, #0
        ble     LCZR7
        mov     r1, r10
LCZR9:
        ldrh    lr, [r7], #2
        cmp     lr, #0
        moveq   lr, r10
        movne   lr, r12
        add     r1, r1, #1
        strh    lr, [r9], #2
        cmp     r1, r8
        blt     LCZR9
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LCZR10:
        cmp     r8, #0
        rsb     r4, r4, #0
        ble     LCZR7
        mov     r5, r4, asr #31
        mov     r11, r12
LCZR11:
        ldrh    lr, [r7], #2
        mov     r3, r5
        mul     r0, r6, lr
        mov     r1, #0
        mov     r2, r4
        bl      __ashldi3
        cmp     r1, #0
        cmpeq   r0, r11
        movcs   r0, r11
        add     r10, r10, #1
        strh    r0, [r9], #2
        cmp     r10, r8
        blt     LCZR11
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}


