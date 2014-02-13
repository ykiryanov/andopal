        .text
        .align  4
        .globl  ownsOverlapAdd_Long_32s


ownsOverlapAdd_Long_32s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x3C
        ldr     lr, [sp, #0x60]
        mov     r12, lr, asr #2
        cmp     r12, #0
        str     r12, [sp, #0xC]
        ble     LGGK1
        mov     r12, lr, asr #1
        sub     lr, lr, #1
        sub     r5, r12, #1
        add     r8, r3, lr, lsl #2
        add     r6, r2, lr, lsl #2
        add     r7, r1, lr, lsl #2
        add     lr, r0, lr, lsl #2
        str     lr, [sp, #4]
        mov     r4, #0
        add     lr, r2, r12, lsl #2
        add     r9, r3, r12, lsl #2
        str     r4, [sp, #8]
        str     lr, [sp]
        str     r9, [sp, #0x20]
        str     r8, [sp, #0x18]
        ldr     r8, [sp, #4]
        ldr     r9, [sp, #8]
        add     r11, r3, r5, lsl #2
        add     r10, r1, r5, lsl #2
        add     lr, r0, r5, lsl #2
        add     r4, r1, r12, lsl #2
        add     r5, r2, r5, lsl #2
        add     r12, r0, r12, lsl #2
        str     r5, [sp, #0x10]
        str     r10, [sp, #0x2C]
        str     r11, [sp, #0x14]
        str     r7, [sp, #0x28]
        str     r6, [sp, #0x1C]
        str     r2, [sp, #0x24]
LGGK0:
        ldr     r2, [r0]
        ldr     r10, [r3], #4
        ldr     r5, [r12]
        rsb     r7, r9, #0
        ldr     r6, [r8, +r7, lsl #2]
        smull   r10, r11, r10, r2
        add     r9, r9, #1
        mov     r11, r11, lsl #1
        rsb     r2, r2, #0
        str     r10, [sp, #0x30]
        ldr     r10, [lr, +r7, lsl #2]
        str     r2, [sp, #0x34]
        ldr     r2, [sp, #0x30]
        orr     r11, r11, r2, lsr #31
        str     r11, [r0]
        ldr     r2, [r1]
        str     r2, [sp, #0x30]
        rsb     r2, r10, #0
        str     r2, [sp, #0x38]
        ldr     r2, [sp, #0x30]
        add     r2, r11, r2
        ldr     r11, [sp, #0xC]
        add     r2, r2, #4
        cmp     r9, r11
        mov     r2, r2, asr #3
        str     r2, [r0], #4
        ldr     r2, [sp, #0x18]
        ldr     r11, [sp, #0x34]
        ldr     r2, [r2, +r7, lsl #2]
        smull   r2, r11, r2, r11
        mov     r11, r11, lsl #1
        orr     r2, r11, r2, lsr #31
        str     r2, [r8, +r7, lsl #2]
        ldr     r11, [sp, #0x28]
        ldr     r11, [r11, +r7, lsl #2]
        add     r11, r2, r11
        add     r2, r11, #4
        mov     r2, r2, asr #3
        str     r2, [r8, +r7, lsl #2]
        ldr     r2, [sp, #0x1C]
        ldr     r2, [r2, +r7, lsl #2]
        smull   r2, r11, r2, r5
        mov     r11, r11, lsl #1
        orr     r2, r11, r2, lsr #31
        str     r2, [r1], #4
        ldr     r2, [sp, #0x24]
        ldr     r11, [r2], #4
        str     r2, [sp, #0x24]
        smull   r5, r2, r11, r5
        mov     r2, r2, lsl #1
        orr     r5, r2, r5, lsr #31
        ldr     r2, [sp, #0x28]
        str     r5, [r2, +r7, lsl #2]
        ldr     r2, [sp, #0x14]
        ldr     r2, [r2, +r7, lsl #2]
        smull   r10, r2, r2, r10
        mov     r2, r2, lsl #1
        orr     r10, r2, r10, lsr #31
        str     r10, [lr, +r7, lsl #2]
        ldr     r2, [sp, #0x2C]
        ldr     r2, [r2, +r7, lsl #2]
        add     r2, r10, r2
        add     r2, r2, #4
        mov     r2, r2, asr #3
        str     r2, [lr, +r7, lsl #2]
        ldr     r5, [sp, #0x20]
        ldr     r2, [r5], #4
        str     r5, [sp, #0x20]
        ldr     r5, [sp, #0x38]
        smull   r2, r5, r2, r5
        mov     r5, r5, lsl #1
        orr     r2, r5, r2, lsr #31
        str     r2, [r12]
        ldr     r5, [r4]
        add     r5, r2, r5
        add     r2, r5, #4
        mov     r2, r2, asr #3
        str     r2, [r12], #4
        ldr     r2, [sp]
        ldr     r5, [r2], #4
        str     r2, [sp]
        smull   r2, r5, r5, r6
        mov     r5, r5, lsl #1
        orr     r2, r5, r2, lsr #31
        ldr     r5, [sp, #0x2C]
        str     r2, [r5, +r7, lsl #2]
        ldr     r2, [sp, #0x10]
        ldr     r7, [r2, +r7, lsl #2]
        smull   r6, r2, r7, r6
        mov     r2, r2, lsl #1
        orr     r6, r2, r6, lsr #31
        str     r6, [r4], #4
        blt     LGGK0
LGGK1:
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}


