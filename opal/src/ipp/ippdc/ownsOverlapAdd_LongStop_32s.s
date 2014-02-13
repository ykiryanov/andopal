        .text
        .align  4
        .globl  ownsOverlapAdd_LongStop_32s


ownsOverlapAdd_LongStop_32s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x48
        ldr     r12, [sp, #0x6C]
        mov     lr, r12, asr #4
        cmp     lr, #0
        ble     LGGL1
        mov     r4, #0
        sub     r8, lr, #1
        str     r4, [sp, #0x10]
        sub     r7, r12, #1
        add     r4, r3, r8, lsl #2
        add     r3, r3, lr, lsl #2
        mov     r6, r12, asr #1
        str     r3, [sp, #8]
        add     r3, r2, r7, lsl #2
        add     r8, r1, r7, lsl #2
        add     r7, r0, r7, lsl #2
        str     r7, [sp]
        sub     r5, r6, #1
        add     r7, r1, r6, lsl #2
        add     r9, r2, r6, lsl #2
        add     r10, r2, r5, lsl #2
        add     r6, r0, r6, lsl #2
        str     r7, [sp, #0x14]
        str     r6, [sp, #0x18]
        str     r10, [sp, #0x28]
        str     r9, [sp, #0x38]
        str     r3, [sp, #0x2C]
        str     lr, [sp, #0x34]
        ldr     r3, [sp, #0x18]
        ldr     lr, [sp, #0x14]
        ldr     r9, [sp]
        ldr     r10, [sp, #0x10]
        str     r8, [sp, #4]
        add     r8, r0, r5, lsl #2
        add     r7, r1, r5, lsl #2
        mov     r11, r2
        mov     r6, r0
        mov     r5, r1
        str     r11, [sp, #0x3C]
        str     r4, [sp, #0x30]
        str     r12, [sp, #0xC]
        str     r2, [sp, #0x24]
        str     r1, [sp, #0x20]
        str     r0, [sp, #0x1C]
LGGL0:
        ldr     r0, [r5]
        ldr     r1, [r6]
        rsb     r4, r10, #0
        add     r10, r10, #1
        add     r0, r0, #4
        str     r1, [sp, #0x40]
        ldr     r2, [r8, +r4, lsl #2]
        ldr     r1, [r3]
        ldr     r12, [r9, +r4, lsl #2]
        rsb     r11, r2, #0
        str     r11, [sp, #0x44]
        mov     r0, r0, asr #3
        str     r0, [r6], #4
        ldr     r0, [sp, #4]
        ldr     r11, [sp, #0x40]
        ldr     r0, [r0, +r4, lsl #2]
        sub     r0, r0, r11
        ldr     r11, [sp, #0x34]
        add     r0, r0, #4
        mov     r0, r0, asr #3
        str     r0, [r9, +r4, lsl #2]
        ldr     r0, [sp, #0x2C]
        cmp     r10, r11
        ldr     r0, [r0, +r4, lsl #2]
        smull   r0, r11, r0, r1
        mov     r11, r11, lsl #1
        orr     r0, r11, r0, lsr #31
        str     r0, [r5], #4
        ldr     r0, [sp, #0x3C]
        ldr     r11, [r0], #4
        str     r0, [sp, #0x3C]
        smull   r1, r0, r11, r1
        mov     r0, r0, lsl #1
        orr     r1, r0, r1, lsr #31
        ldr     r0, [sp, #4]
        str     r1, [r0, +r4, lsl #2]
        ldr     r0, [sp, #0x30]
        ldr     r0, [r0, +r4, lsl #2]
        smull   r2, r0, r0, r2
        mov     r0, r0, lsl #1
        orr     r2, r0, r2, lsr #31
        str     r2, [r8, +r4, lsl #2]
        ldr     r0, [r7, +r4, lsl #2]
        add     r0, r2, r0
        add     r0, r0, #4
        mov     r0, r0, asr #3
        str     r0, [r8, +r4, lsl #2]
        ldr     r1, [sp, #8]
        ldr     r0, [r1], #4
        str     r1, [sp, #8]
        ldr     r1, [sp, #0x44]
        smull   r0, r1, r0, r1
        mov     r1, r1, lsl #1
        orr     r0, r1, r0, lsr #31
        str     r0, [r3]
        ldr     r1, [lr]
        add     r1, r0, r1
        add     r0, r1, #4
        mov     r0, r0, asr #3
        str     r0, [r3], #4
        ldr     r0, [sp, #0x38]
        ldr     r1, [r0], #4
        str     r0, [sp, #0x38]
        smull   r0, r1, r1, r12
        mov     r1, r1, lsl #1
        orr     r0, r1, r0, lsr #31
        str     r0, [r7, +r4, lsl #2]
        ldr     r0, [sp, #0x28]
        ldr     r4, [r0, +r4, lsl #2]
        smull   r12, r0, r4, r12
        mov     r0, r0, lsl #1
        orr     r12, r0, r12, lsr #31
        str     r12, [lr], #4
        blt     LGGL0
        ldr     lr, [sp, #0x34]
        ldr     r12, [sp, #0xC]
        ldr     r2, [sp, #0x24]
        ldr     r1, [sp, #0x20]
        ldr     r0, [sp, #0x1C]
LGGL1:
        cmp     lr, r12, asr #2
        bge     LGGL3
        mov     r4, r12, asr #1
        sub     r7, r4, #1
        sub     r6, r12, #1
        add     r5, r2, r4, lsl #2
        add     r3, r1, r4, lsl #2
        add     r8, r0, r7, lsl #2
        add     r11, r1, r7, lsl #2
        add     r10, r2, r6, lsl #2
        add     r9, r1, r6, lsl #2
        add     r7, r2, r7, lsl #2
        add     r4, r0, r4, lsl #2
        add     r5, r5, lr, lsl #2
        add     r6, r0, r6, lsl #2
        add     r2, r2, lr, lsl #2
        add     r4, r4, lr, lsl #2
        add     r3, r3, lr, lsl #2
        add     r0, r0, lr, lsl #2
        add     r1, r1, lr, lsl #2
        str     r5, [sp]
        str     r2, [sp, #4]
        str     r7, [sp, #0x10]
        str     r10, [sp, #8]
        str     r12, [sp, #0xC]
LGGL2:
        ldr     r2, [r0]
        ldr     r7, [r1]
        rsb     r12, lr, #0
        str     r2, [sp, #0x44]
        ldr     r2, [r4]
        ldr     r5, [r8, +r12, lsl #2]
        add     lr, lr, #1
        add     r7, r7, #4
        str     r5, [sp, #0x40]
        ldr     r5, [r6, +r12, lsl #2]
        mov     r7, r7, asr #3
        str     r7, [r0], #4
        ldr     r10, [sp, #0xC]
        ldr     r7, [r9, +r12, lsl #2]
        cmp     lr, r10, asr #2
        ldr     r10, [sp, #0x44]
        sub     r7, r7, r10
        add     r7, r7, #4
        mov     r7, r7, asr #3
        str     r7, [r6, +r12, lsl #2]
        ldr     r7, [sp, #8]
        ldr     r7, [r7, +r12, lsl #2]
        smull   r7, r10, r7, r2
        mov     r10, r10, lsl #1
        orr     r7, r10, r7, lsr #31
        str     r7, [r1], #4
        ldr     r10, [sp, #4]
        ldr     r7, [r10], #4
        str     r10, [sp, #4]
        smull   r2, r7, r7, r2
        mov     r7, r7, lsl #1
        orr     r2, r7, r2, lsr #31
        str     r2, [r9, +r12, lsl #2]
        ldr     r2, [r11, +r12, lsl #2]
        add     r2, r2, #4
        mov     r2, r2, asr #3
        str     r2, [r8, +r12, lsl #2]
        ldr     r2, [r3]
        ldr     r7, [sp, #0x40]
        sub     r2, r2, r7
        add     r2, r2, #4
        mov     r2, r2, asr #3
        str     r2, [r4], #4
        ldr     r7, [sp]
        ldr     r2, [r7], #4
        str     r7, [sp]
        smull   r2, r7, r2, r5
        mov     r7, r7, lsl #1
        orr     r2, r7, r2, lsr #31
        str     r2, [r11, +r12, lsl #2]
        ldr     r2, [sp, #0x10]
        ldr     r12, [r2, +r12, lsl #2]
        smull   r5, r2, r12, r5
        mov     r2, r2, lsl #1
        orr     r5, r2, r5, lsr #31
        str     r5, [r3], #4
        blt     LGGL2
LGGL3:
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}


