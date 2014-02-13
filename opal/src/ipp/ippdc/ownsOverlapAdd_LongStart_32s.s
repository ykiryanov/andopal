        .text
        .align  4
        .globl  ownsOverlapAdd_LongStart_32s


ownsOverlapAdd_LongStart_32s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x44
        ldr     r12, [sp, #0x68]
        mov     lr, r12, asr #4
        cmp     lr, #0
        ble     LGGM1
        sub     r7, lr, #1
        mov     r5, r12, asr #1
        add     r7, r2, r7, lsl #2
        add     r2, r2, lr, lsl #2
        sub     r4, r12, #1
        sub     r6, r5, #1
        str     r2, [sp, #0xC]
        add     r2, r3, r4, lsl #2
        str     r2, [sp]
        add     r2, r0, r6, lsl #2
        add     r10, r3, r6, lsl #2
        str     r7, [sp, #4]
        str     r2, [sp, #0x14]
        add     r7, r1, r5, lsl #2
        add     r6, r1, r6, lsl #2
        add     r8, r1, r4, lsl #2
        add     r11, r3, r5, lsl #2
        add     r2, r0, r5, lsl #2
        str     r1, [sp, #0x10]
        mov     r5, r3
        str     r12, [sp, #8]
        str     r3, [sp, #0x24]
        ldr     r3, [sp, #0x10]
        ldr     r12, [sp, #0x14]
        str     r6, [sp, #0x18]
        mov     r9, #0
        add     r4, r0, r4, lsl #2
        mov     r6, r0
        str     r11, [sp, #0x30]
        str     r10, [sp, #0x28]
        str     lr, [sp, #0x2C]
        str     r1, [sp, #0x20]
        str     r0, [sp, #0x1C]
LGGM0:
        ldr     r0, [r6]
        rsb     r1, r9, #0
        add     r9, r9, #1
        str     r0, [sp, #0x34]
        ldr     r0, [r2]
        ldr     r10, [sp, #0x34]
        str     r0, [sp, #0x38]
        ldr     lr, [r5], #4
        ldr     r0, [r12, +r1, lsl #2]
        smull   r10, r11, lr, r10
        ldr     lr, [r4, +r1, lsl #2]
        mov     r11, r11, lsl #1
        orr     r10, r11, r10, lsr #31
        str     r10, [r6]
        ldr     r11, [r3]
        str     r11, [sp, #0x3C]
        ldr     r11, [sp, #0x34]
        rsb     r11, r11, #0
        str     r11, [sp, #0x34]
        rsb     r11, r0, #0
        str     r11, [sp, #0x40]
        ldr     r11, [sp, #0x3C]
        add     r11, r10, r11
        add     r10, r11, #4
        ldr     r11, [sp, #0x2C]
        mov     r10, r10, asr #3
        str     r10, [r6], #4
        ldr     r10, [sp]
        cmp     r9, r11
        ldr     r11, [sp, #0x34]
        ldr     r10, [r10, +r1, lsl #2]
        smull   r10, r11, r10, r11
        mov     r11, r11, lsl #1
        orr     r10, r11, r10, lsr #31
        str     r10, [r4, +r1, lsl #2]
        ldr     r11, [r8, +r1, lsl #2]
        add     r11, r10, r11
        add     r10, r11, #4
        mov     r10, r10, asr #3
        str     r10, [r4, +r1, lsl #2]
        ldr     r10, [sp, #0x38]
        str     r10, [r3], #4
        mov     r10, #0
        str     r10, [r8, +r1, lsl #2]
        ldr     r10, [sp, #0x28]
        ldr     r10, [r10, +r1, lsl #2]
        smull   r0, r10, r10, r0
        mov     r10, r10, lsl #1
        orr     r0, r10, r0, lsr #31
        str     r0, [r12, +r1, lsl #2]
        ldr     r10, [sp, #0x18]
        ldr     r10, [r10, +r1, lsl #2]
        add     r10, r0, r10
        add     r0, r10, #4
        mov     r0, r0, asr #3
        str     r0, [r12, +r1, lsl #2]
        ldr     r10, [sp, #0x30]
        ldr     r0, [r10], #4
        str     r10, [sp, #0x30]
        ldr     r10, [sp, #0x40]
        smull   r0, r10, r0, r10
        mov     r10, r10, lsl #1
        orr     r0, r10, r0, lsr #31
        str     r0, [r2]
        ldr     r10, [r7]
        add     r10, r0, r10
        add     r0, r10, #4
        mov     r0, r0, asr #3
        str     r0, [r2], #4
        ldr     r0, [sp, #0xC]
        ldr     r10, [r0], #4
        str     r0, [sp, #0xC]
        smull   r0, r10, r10, lr
        mov     r10, r10, lsl #1
        orr     r0, r10, r0, lsr #31
        ldr     r10, [sp, #0x18]
        str     r0, [r10, +r1, lsl #2]
        ldr     r0, [sp, #4]
        ldr     r1, [r0, +r1, lsl #2]
        smull   lr, r0, r1, lr
        mov     r0, r0, lsl #1
        orr     lr, r0, lr, lsr #31
        str     lr, [r7], #4
        blt     LGGM0
        ldr     lr, [sp, #0x2C]
        ldr     r12, [sp, #8]
        ldr     r3, [sp, #0x24]
        ldr     r1, [sp, #0x20]
        ldr     r0, [sp, #0x1C]
LGGM1:
        cmp     lr, r12, asr #2
        bge     LGGM3
        mov     r4, r12, asr #1
        sub     r11, r4, #1
        sub     r5, r12, #1
        add     r6, r3, r4, lsl #2
        add     r2, r1, r4, lsl #2
        add     r9, r3, r5, lsl #2
        add     r10, r3, r11, lsl #2
        add     r8, r1, r5, lsl #2
        add     r7, r0, r11, lsl #2
        add     r4, r0, r4, lsl #2
        add     r6, r6, lr, lsl #2
        add     r5, r0, r5, lsl #2
        add     r11, r1, r11, lsl #2
        add     r4, r4, lr, lsl #2
        add     r2, r2, lr, lsl #2
        add     r3, r3, lr, lsl #2
        add     r0, r0, lr, lsl #2
        add     r1, r1, lr, lsl #2
        str     r6, [sp]
        str     r10, [sp, #0xC]
        str     r9, [sp, #4]
        str     r12, [sp, #8]
LGGM2:
        ldr     r12, [r0]
        str     r12, [sp, #0x40]
        ldr     r12, [r3], #4
        ldr     r6, [r4]
        str     r6, [sp, #0x3C]
        rsb     r6, lr, #0
        ldr     r9, [r5, +r6, lsl #2]
        add     lr, lr, #1
        str     r9, [sp, #0x38]
        ldr     r9, [sp, #0x40]
        smull   r9, r10, r12, r9
        ldr     r12, [r7, +r6, lsl #2]
        mov     r10, r10, lsl #1
        orr     r9, r10, r9, lsr #31
        str     r9, [r0]
        ldr     r10, [r1]
        str     r10, [sp, #0x34]
        ldr     r10, [sp, #0x40]
        rsb     r10, r10, #0
        str     r10, [sp, #0x40]
        rsb     r10, r12, #0
        str     r10, [sp, #0x30]
        ldr     r10, [sp, #0x34]
        add     r10, r9, r10
        add     r9, r10, #4
        ldr     r10, [sp, #8]
        mov     r9, r9, asr #3
        str     r9, [r0], #4
        ldr     r9, [sp, #4]
        cmp     lr, r10, asr #2
        ldr     r10, [sp, #0x40]
        ldr     r9, [r9, +r6, lsl #2]
        smull   r9, r10, r9, r10
        mov     r10, r10, lsl #1
        orr     r9, r10, r9, lsr #31
        str     r9, [r5, +r6, lsl #2]
        ldr     r10, [r8, +r6, lsl #2]
        add     r10, r9, r10
        add     r9, r10, #4
        mov     r9, r9, asr #3
        str     r9, [r5, +r6, lsl #2]
        ldr     r9, [sp, #0x3C]
        str     r9, [r1], #4
        mov     r9, #0
        str     r9, [r8, +r6, lsl #2]
        ldr     r9, [sp, #0xC]
        ldr     r9, [r9, +r6, lsl #2]
        smull   r12, r9, r9, r12
        mov     r9, r9, lsl #1
        orr     r12, r9, r12, lsr #31
        str     r12, [r7, +r6, lsl #2]
        ldr     r9, [r11, +r6, lsl #2]
        add     r9, r12, r9
        add     r12, r9, #4
        mov     r12, r12, asr #3
        str     r12, [r7, +r6, lsl #2]
        ldr     r9, [sp]
        ldr     r12, [r9], #4
        str     r9, [sp]
        ldr     r9, [sp, #0x30]
        smull   r12, r9, r12, r9
        mov     r9, r9, lsl #1
        orr     r12, r9, r12, lsr #31
        str     r12, [r4]
        ldr     r9, [r2]
        add     r9, r12, r9
        add     r12, r9, #4
        mov     r12, r12, asr #3
        str     r12, [r4], #4
        ldr     r12, [sp, #0x38]
        str     r12, [r11, +r6, lsl #2]
        mov     r12, #0
        str     r12, [r2], #4
        blt     LGGM2
LGGM3:
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}


