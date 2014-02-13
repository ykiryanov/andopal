        .text
        .align  4
        .globl  ownsTnsArFilter


ownsTnsArFilter:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x88
        ldr     r11, [sp, #0xAC]
        ldr     r5, [sp, #0xB0]
        add     r4, sp, #0x38
        mov     r10, r1
        mov     r6, r0
        mov     r1, r11, lsl #2
        mov     r0, r4
        mov     r7, r2
        mov     r4, r3
        bl      _ippsZero_8u
        cmp     r7, #0
        ble     LGHA6
        mov     r0, #0
        mov     r3, r5, asr #31
        str     r4, [sp, #0xC]
        str     r7, [sp, #8]
        sub     r9, r11, #1
        add     r8, r10, #4
        str     r11, [sp, #0x10]
        str     r10, [sp, #4]
        mov     r7, r0
        mov     r4, r3
LGHA0:
        ldr     r0, [r6]
        mov     r2, r5
        mov     r3, r4
        mov     r1, r0, asr #31
        bl      __ashldi3
        cmp     r9, #0
        mov     r10, r9
        ble     LGHA4
        cmp     r9, #5
        blt     LGHA2
        mov     lr, r10, lsl #2
        sub     r12, lr, #4
        add     r12, r12, r8
        str     r8, [sp, #0x24]
        str     r9, [sp, #0x20]
        str     r4, [sp, #0x1C]
        str     r7, [sp, #0x18]
        str     r5, [sp, #0x14]
        str     r6, [sp]
LGHA1:
        add     r2, sp, #0x38
        ldr     r7, [r2, +r10, lsl #2]
        ldr     r3, [r12, #4]
        ldr     r4, [r12]
        ldr     r5, [r12, #-4]
        ldr     r6, [r12, #-8]
        smull   r3, r7, r3, r7
        add     r2, r2, lr
        ldr     r9, [r2, #-4]
        sub     lr, lr, #0x10
        sub     r12, r12, #0x10
        str     r9, [sp, #0x28]
        ldr     r11, [r2, #-8]
        smull   r4, r9, r4, r9
        ldr     r8, [r2, #-0xC]
        subs    r0, r0, r3
        smull   r5, r3, r5, r11
        sbc     r1, r1, r7
        subs    r0, r0, r4
        sbc     r1, r1, r9
        str     r3, [sp, #0x2C]
        smull   r6, r3, r6, r8
        subs    r5, r0, r5
        ldr     r0, [sp, #0x2C]
        str     r3, [sp, #0x34]
        str     r6, [sp, #0x30]
        ldr     r3, [r2, #-0x10]
        sbc     r1, r1, r0
        ldr     r0, [sp, #0x28]
        add     r4, sp, #0x38
        str     r0, [r4, +r10, lsl #2]
        ldr     r0, [sp, #0x30]
        str     r11, [r2, #-4]
        str     r8, [r2, #-8]
        ldr     r4, [sp, #0x34]
        subs    r0, r5, r0
        sub     r10, r10, #4
        sbc     r1, r1, r4
        cmp     r10, #5
        str     r3, [r2, #-0xC]
        bge     LGHA1
        ldr     r8, [sp, #0x24]
        ldr     r9, [sp, #0x20]
        ldr     r4, [sp, #0x1C]
        ldr     r7, [sp, #0x18]
        ldr     r5, [sp, #0x14]
        ldr     r6, [sp]
LGHA2:
        mov     lr, r10, lsl #2
        add     r12, r8, r10, lsl #2
        str     r6, [sp]
LGHA3:
        add     r3, sp, #0x38
        ldr     r11, [r3, +r10, lsl #2]
        ldr     r2, [r12], #-4
        add     r6, r3, lr
        ldr     r6, [r6, #-4]
        smull   r11, r2, r2, r11
        sub     lr, lr, #4
        str     r6, [r3, +r10, lsl #2]
        sub     r10, r10, #1
        subs    r0, r0, r11
        sbc     r1, r1, r2
        cmp     r10, #0
        bgt     LGHA3
        ldr     r6, [sp]
LGHA4:
        ldr     r12, [sp, #0x10]
        cmp     r12, #0
        ble     LGHA5
        ldr     r12, [sp, #4]
        add     lr, sp, #0x38
        ldr     lr, [lr]
        ldr     r12, [r12, #4]
        rsbs    r11, lr, #0
        mov     lr, lr, asr #31
        rsc     lr, lr, #0
        umull   r10, r3, r11, r12
        mov     r2, r12, asr #31
        mla     r11, r11, r2, r3
        adds    r0, r10, r0
        mla     r11, lr, r12, r11
        adc     r1, r11, r1
LGHA5:
        mov     r2, r5
        mov     r3, r4
        bl      __ashrdi3
        ldr     r1, [sp, #8]
        add     r7, r7, #1
        str     r0, [r6]
        cmp     r7, r1
        ldr     r1, [sp, #0xC]
        add     r6, r6, r1, lsl #2
        addlt   r1, sp, #0x38
        strlt   r0, [r1]
        blt     LGHA0
LGHA6:
        add     sp, sp, #0x88
        ldmia   sp!, {r4 - r11, pc}


