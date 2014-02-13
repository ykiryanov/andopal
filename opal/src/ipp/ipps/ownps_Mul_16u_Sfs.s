        .text
        .align  4
        .globl  ownps_Mul_16u_Sfs


ownps_Mul_16u_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        ldr     r4, [sp, #0x44]
        mov     lr, #0xFF
        orr     r9, lr, #0xFF, 24
        cmp     r4, #0
        mov     r11, r0
        mov     r12, r1
        mov     r7, r2
        mov     r6, r3
        mov     r10, #0
        bne     LCZP3
        cmp     r6, #0
        ble     LCZP7
        cmp     r6, #5
        blt     LCZP1
        sub     r0, r6, #5
        mov     r5, r12
        mov     r4, r11
        mov     lr, r7
LCZP0:
        ldrh    r1, [r5]
        ldrh    r2, [r4]
        add     r10, r10, #4
        mul     r1, r2, r1
        mov     r2, r9
        cmp     r1, r9
        movcc   r2, r1
        strh    r2, [lr]
        ldrh    r1, [r5, #2]
        ldrh    r2, [r4, #2]
        mul     r1, r2, r1
        mov     r2, r9
        cmp     r1, r9
        movcc   r2, r1
        strh    r2, [lr, #2]
        ldrh    r1, [r5, #4]
        ldrh    r2, [r4, #4]
        mul     r1, r2, r1
        mov     r2, r9
        cmp     r1, r9
        movcc   r2, r1
        strh    r2, [lr, #4]
        ldrh    r1, [r5, #6]
        ldrh    r2, [r4, #6]
        add     r5, r5, #8
        add     r4, r4, #8
        mul     r1, r2, r1
        mov     r2, r9
        cmp     r1, r9
        movcc   r2, r1
        strh    r2, [lr, #6]
        cmp     r10, r0
        add     lr, lr, #8
        ble     LCZP0
LCZP1:
        add     r12, r12, r10, lsl #1
        add     r11, r11, r10, lsl #1
        add     r7, r7, r10, lsl #1
LCZP2:
        ldrh    r0, [r11], #2
        ldrh    r1, [r12], #2
        add     r10, r10, #1
        mul     r0, r0, r1
        mov     r1, r9
        cmp     r0, r9
        movcc   r1, r0
        strh    r1, [r7], #2
        cmp     r10, r6
        blt     LCZP2
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LCZP3:
        cmp     r4, #0
        ble     LCZP8
        sub     lr, r4, #1
        mov     r5, #1
        mov     lr, r5, lsl lr
        sub     r0, lr, #1
        cmp     r6, #0
        mov     r1, r0, asr #31
        ble     LCZP7
        cmp     r6, #4
        movlt   r5, r4, asr #31
        blt     LCZP5
        sub     lr, r6, #4
        mov     r2, r11
        mov     r3, r12
        mov     r8, r7
        str     r11, [sp, #0xC]
        str     r6, [sp, #0x10]
        str     r7, [sp, #0x14]
        str     r10, [sp]
        mov     r5, r4, asr #31
        str     r12, [sp, #8]
        str     lr, [sp, #4]
        mov     r7, r0
        mov     r6, r1
        mov     r10, r2
        mov     r11, r3
LCZP4:
        ldrh    r12, [r11]
        ldrh    lr, [r10]
        ldr     r0, [sp]
        mov     r2, r4
        mov     r3, r5
        mul     lr, lr, r12
        add     r0, r0, #3
        str     r0, [sp]
        adds    r0, r7, lr
        mov     r12, lr, lsr r4
        and     r12, r12, #1
        adc     lr, r6, #0
        adds    r0, r0, r12
        adc     r1, lr, #0
        bl      __lshrdi3
        cmp     r0, r9
        mov     r12, r9
        movcc   r12, r0
        strh    r12, [r8]
        ldrh    r12, [r11, #2]
        ldrh    lr, [r10, #2]
        mov     r2, r4
        mov     r3, r5
        mul     r0, lr, r12
        adds    r12, r7, r0
        adc     lr, r6, #0
        mov     r0, r0, lsr r4
        and     r0, r0, #1
        adds    r0, r12, r0
        adc     r1, lr, #0
        bl      __lshrdi3
        cmp     r0, r9
        mov     r12, r9
        movcc   r12, r0
        strh    r12, [r8, #2]
        ldrh    r12, [r11, #4]
        ldrh    lr, [r10, #4]
        mov     r2, r4
        mov     r3, r5
        add     r11, r11, #6
        mul     r0, lr, r12
        add     r10, r10, #6
        adds    r12, r7, r0
        adc     lr, r6, #0
        mov     r0, r0, lsr r4
        and     r0, r0, #1
        adds    r0, r12, r0
        adc     r1, lr, #0
        bl      __lshrdi3
        cmp     r0, r9
        mov     r12, r9
        movcc   r12, r0
        strh    r12, [r8, #4]
        ldr     r12, [sp, #4]
        ldr     lr, [sp]
        add     r8, r8, #6
        cmp     lr, r12
        ble     LCZP4
        mov     r1, r6
        mov     r0, r7
        ldr     r12, [sp, #8]
        ldr     r11, [sp, #0xC]
        ldr     r6, [sp, #0x10]
        ldr     r7, [sp, #0x14]
        ldr     r10, [sp]
LCZP5:
        mov     lr, #0xFF
        orr     r9, lr, #0xFF, 24
        add     r8, r12, r10, lsl #1
        add     r11, r11, r10, lsl #1
        add     r7, r7, r10, lsl #1
        str     r1, [sp, #0x1C]
        str     r0, [sp, #0x18]
LCZP6:
        ldrh    r1, [r8], #2
        ldrh    r0, [r11], #2
        ldr     r12, [sp, #0x1C]
        mul     r1, r0, r1
        ldr     r0, [sp, #0x18]
        add     r10, r10, #1
        mov     r2, r4
        mov     r3, r5
        adds    r0, r0, r1
        mov     r1, r1, lsr r4
        adc     r12, r12, #0
        and     r1, r1, #1
        adds    r0, r0, r1
        adc     r1, r12, #0
        bl      __lshrdi3
        cmp     r0, r9
        mov     r1, r9
        movcc   r1, r0
        strh    r1, [r7], #2
        cmp     r10, r6
        blt     LCZP6
LCZP7:
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LCZP8:
        cmn     r4, #0xF
        bge     LCZP12
        cmp     r6, #0
        ble     LCZP7
        mov     lr, r10
LCZP9:
        ldrh    r4, [r11], #2
        cmp     r4, #0
        beq     LCZP10
        ldrh    r4, [r12]
        cmp     r4, #0
        movne   r4, r9
        bne     LCZP11
LCZP10:
        mov     r4, r10
LCZP11:
        add     lr, lr, #1
        strh    r4, [r7], #2
        cmp     lr, r6
        add     r12, r12, #2
        blt     LCZP9
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LCZP12:
        cmp     r6, #0
        rsb     r4, r4, #0
        ble     LCZP7
        mov     r5, r4, asr #31
        mov     r8, r12
LCZP13:
        ldrh    r0, [r8], #2
        ldrh    lr, [r11], #2
        mov     r1, #0
        mul     r0, lr, r0
        mov     r3, r5
        mov     r2, r4
        bl      __ashldi3
        cmp     r1, #0
        cmpeq   r0, r9
        movcs   r0, r9
        add     r10, r10, #1
        strh    r0, [r7], #2
        cmp     r10, r6
        blt     LCZP13
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}


