        .text
        .align  4
        .globl  ownsTnsMaFilter


ownsTnsMaFilter:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x8C
        ldr     r9, [sp, #0xB0]
        ldr     r5, [sp, #0xB4]
        add     r4, sp, #0x3C
        mov     r8, r1
        mov     r7, r0
        mov     r1, r9, lsl #2
        mov     r0, r4
        mov     r4, r2
        mov     r6, r3
        bl      _ippsZero_8u
        cmp     r4, #0
        ble     LGGY6
        mov     r0, #0
        mov     r3, r5, asr #31
        add     r10, r8, #4
        str     r4, [sp, #0x10]
        str     r8, [sp, #0xC]
        sub     r11, r9, #1
        mov     r8, r0
        mov     r4, r3
LGGY0:
        ldr     r0, [r7]
        mov     r2, r5
        mov     r3, r4
        str     r0, [sp, #0x28]
        mov     r1, r0, asr #31
        bl      __ashldi3
        cmp     r11, #0
        mov     r2, r11
        ble     LGGY4
        cmp     r11, #5
        blt     LGGY2
        mov     lr, r2, lsl #2
        sub     r12, lr, #4
        add     r12, r12, r10
        str     r10, [sp, #0x24]
        str     r11, [sp, #0x20]
        str     r4, [sp, #0x1C]
        str     r8, [sp, #0x18]
        str     r5, [sp, #0x14]
        str     r9, [sp, #8]
        str     r6, [sp, #4]
        str     r7, [sp]
LGGY1:
        add     r3, sp, #0x3C
        ldr     r8, [r3, +r2, lsl #2]
        ldr     r4, [r12, #4]
        ldr     r5, [r12]
        ldr     r6, [r12, #-4]
        ldr     r7, [r12, #-8]
        smull   r4, r8, r4, r8
        add     r3, r3, lr
        ldr     r9, [r3, #-4]
        sub     lr, lr, #0x10
        sub     r12, r12, #0x10
        str     r9, [sp, #0x2C]
        ldr     r11, [r3, #-8]
        smull   r5, r9, r5, r9
        ldr     r10, [r3, #-0xC]
        adds    r4, r0, r4
        smull   r6, r0, r6, r11
        str     r0, [sp, #0x30]
        smull   r7, r0, r7, r10
        str     r0, [sp, #0x34]
        adc     r8, r1, r8
        ldr     r0, [sp, #0x30]
        adds    r5, r4, r5
        adc     r9, r8, r9
        adds    r6, r5, r6
        adc     r1, r9, r0
        ldr     r0, [sp, #0x2C]
        str     r7, [sp, #0x38]
        ldr     r4, [r3, #-0x10]
        add     r5, sp, #0x3C
        str     r0, [r5, +r2, lsl #2]
        ldr     r0, [sp, #0x38]
        str     r11, [r3, #-4]
        str     r10, [r3, #-8]
        ldr     r5, [sp, #0x34]
        adds    r0, r6, r0
        sub     r2, r2, #4
        adc     r1, r1, r5
        cmp     r2, #5
        str     r4, [r3, #-0xC]
        bge     LGGY1
        ldr     r10, [sp, #0x24]
        ldr     r11, [sp, #0x20]
        ldr     r4, [sp, #0x1C]
        ldr     r8, [sp, #0x18]
        ldr     r5, [sp, #0x14]
        ldr     r9, [sp, #8]
        ldr     r6, [sp, #4]
        ldr     r7, [sp]
LGGY2:
        mov     lr, r2, lsl #2
        add     r12, r10, r2, lsl #2
        str     r9, [sp, #8]
        str     r6, [sp, #4]
        str     r7, [sp]
LGGY3:
        add     r3, sp, #0x3C
        ldr     r7, [r3, +r2, lsl #2]
        ldr     r9, [r12], #-4
        add     r6, r3, lr
        ldr     r6, [r6, #-4]
        smull   r7, r9, r9, r7
        sub     lr, lr, #4
        str     r6, [r3, +r2, lsl #2]
        sub     r2, r2, #1
        adds    r0, r0, r7
        adc     r1, r1, r9
        cmp     r2, #0
        bgt     LGGY3
        ldr     r9, [sp, #8]
        ldr     r6, [sp, #4]
        ldr     r7, [sp]
LGGY4:
        cmp     r9, #0
        ble     LGGY5
        ldr     r12, [sp, #0xC]
        add     lr, sp, #0x3C
        ldr     lr, [lr]
        ldr     r12, [r12, #4]
        smull   r12, lr, lr, r12
        adds    r0, r12, r0
        adc     r1, lr, r1
LGGY5:
        mov     r2, r5
        mov     r3, r4
        bl      __ashrdi3
        ldr     r1, [sp, #0x10]
        add     r8, r8, #1
        str     r0, [r7]
        cmp     r8, r1
        add     r7, r7, r6, lsl #2
        bge     LGGY6
        ldr     r1, [sp, #0x28]
        add     r12, sp, #0x3C
        str     r1, [r12]
        b       LGGY0
LGGY6:
        add     sp, sp, #0x8C
        ldmia   sp!, {r4 - r11, pc}


