        .text
        .align  4
        .globl  ippiTransformInvAddPredLuma8x8_H264_32s16u_C1R


ippiTransformInvAddPredLuma8x8_H264_32s16u_C1R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x15, 28
        ldr     r12, [sp, #0x174]
        ldr     lr, [sp, #0x178]
        cmp     r0, #0
        beq     LLBZ5
        cmp     r2, #0
        beq     LLBZ5
        cmp     r3, #0
        beq     LLBZ5
        add     r11, r2, #0x1C
        str     r11, [sp, #0x30]
        add     r9, r2, #0x10
        add     r8, r2, #8
        add     r11, r2, #4
        add     r6, r2, #0x18
        add     r5, r2, #0x14
        add     r4, r2, #0xC
        mov     r10, #0
        mov     r7, r10
        str     r11, [sp, #0x34]
        str     r2, [sp, #0x38]
        str     r2, [sp, #0xC]
        str     r8, [sp]
        str     r9, [sp, #4]
        str     r10, [sp, #8]
        str     lr, [sp, #0x10]
        str     r12, [sp, #0x14]
        str     r3, [sp, #0x18]
        str     r1, [sp, #0x1C]
        str     r0, [sp, #0x20]
LLBZ0:
        ldr     r0, [sp, #0x30]
        ldr     r1, [sp, #4]
        ldr     r9, [r5], #0x20
        ldr     lr, [r0]
        ldr     r0, [sp, #0x34]
        ldr     r1, [r1]
        ldr     r8, [r4], #0x20
        ldr     r2, [r0]
        ldr     r0, [sp, #0x38]
        add     r12, r8, r9
        mov     r3, lr, asr #1
        ldr     r0, [r0]
        str     r1, [sp, #0x2C]
        ldr     r1, [sp]
        rsb     r3, r3, #0
        sub     r10, r9, r8
        sub     r3, r3, lr
        ldr     r1, [r1]
        add     r3, r10, r3
        mov     r10, r8, asr #1
        add     r9, r9, r9, asr #1
        str     r1, [sp, #0x28]
        ldr     r1, [r6], #0x20
        str     r12, [sp, #0x24]
        str     r10, [sp, #0x44]
        add     r12, r2, r2, asr #1
        ldr     r11, [sp, #0x24]
        str     r12, [sp, #0x3C]
        ldr     r10, [sp, #0x3C]
        ldr     r12, [sp, #0x2C]
        add     r10, r11, r10
        str     r10, [sp, #0x3C]
        ldr     r10, [sp, #0x44]
        add     r12, r0, r12
        add     r11, r2, lr
        sub     lr, lr, r2
        ldr     r2, [sp, #0x2C]
        str     lr, [sp, #0x48]
        str     r11, [sp, #0x44]
        str     r12, [sp, #0x40]
        ldr     r12, [sp, #0x28]
        sub     r0, r0, r2
        str     r0, [sp, #0x2C]
        ldr     r0, [sp, #0x28]
        ldr     r2, [sp, #0x44]
        add     r12, r12, r1, asr #1
        rsb     r10, r10, #0
        rsb     lr, r1, r0, asr #1
        ldr     r0, [sp, #0x40]
        sub     r10, r10, r8
        str     r10, [sp, #0x24]
        add     r8, sp, #0x50
        add     r1, r0, r12
        ldr     r0, [sp, #0x24]
        add     r2, r2, r0
        ldr     r0, [sp, #0x48]
        add     r10, r0, r9
        ldr     r0, [sp, #0x3C]
        ldr     r9, [sp, #0x2C]
        sub     r0, r0, r3, asr #2
        str     r0, [sp, #0x48]
        ldr     r0, [sp, #8]
        add     r0, r8, r0
        add     r8, r9, lr
        sub     lr, r9, lr
        ldr     r9, [sp, #0x40]
        str     r0, [sp, #0x44]
        ldr     r0, [sp, #0x48]
        sub     r12, r9, r12
        ldr     r9, [sp, #0x3C]
        add     r0, r1, r0
        add     r3, r3, r9, asr #2
        add     r9, r2, r10, asr #2
        rsb     r2, r10, r2, asr #2
        add     r10, sp, #0x50
        str     r0, [r10, +r7, lsl #2]
        add     r10, r8, r2
        sub     r8, r8, r2
        ldr     r2, [sp, #0x48]
        add     r7, r7, #1
        add     r11, lr, r9
        sub     r1, r1, r2
        ldr     r2, [sp, #0x38]
        add     r0, r12, r3
        sub     r12, r12, r3
        sub     lr, lr, r9
        add     r2, r2, #0x20
        str     r2, [sp, #0x38]
        ldr     r2, [sp, #4]
        cmp     r7, #8
        add     r2, r2, #0x20
        str     r2, [sp, #4]
        ldr     r2, [sp]
        add     r2, r2, #0x20
        str     r2, [sp]
        ldr     r2, [sp, #0x30]
        add     r2, r2, #0x20
        str     r2, [sp, #0x30]
        ldr     r2, [sp, #0x34]
        add     r2, r2, #0x20
        str     r2, [sp, #0x34]
        ldr     r2, [sp, #0x44]
        str     r0, [r2, #0x60]
        str     r10, [r2, #0x20]
        str     r11, [r2, #0x40]
        str     r12, [r2, #0x80]
        str     lr, [r2, #0xA0]
        str     r8, [r2, #0xC0]
        str     r1, [r2, #0xE0]
        ldr     r0, [sp, #8]
        add     r0, r0, #4
        str     r0, [sp, #8]
        blt     LLBZ0
        ldr     r2, [sp, #0xC]
        ldr     lr, [sp, #0x10]
        ldr     r12, [sp, #0x14]
        ldr     r3, [sp, #0x18]
        ldr     r1, [sp, #0x1C]
        ldr     r0, [sp, #0x20]
        mov     r5, #0
        str     r5, [sp, #0x38]
        add     r11, r2, #0x20
        add     r10, r2, #0x40
        add     r9, r2, #0x60
        add     r8, r2, #0x80
        add     r7, r2, #0xA0
        add     r6, r2, #0xE0
        str     lr, [sp, #0x10]
        ldr     lr, [sp, #0x38]
        add     r4, r2, #0xC0
        str     r2, [sp, #0x34]
        str     r2, [sp, #0xC]
        str     r6, [sp, #0x30]
        str     r7, [sp, #0x28]
        str     r8, [sp, #0x2C]
        str     r9, [sp]
        str     r10, [sp, #4]
        str     r11, [sp, #0x24]
        str     r5, [sp, #8]
        str     r12, [sp, #0x14]
        str     r3, [sp, #0x18]
        str     r1, [sp, #0x1C]
        str     r0, [sp, #0x20]
LLBZ1:
        ldr     r0, [sp, #8]
        add     r1, sp, #0x50
        ldr     r5, [r1, +lr, lsl #5]
        add     r0, r1, r0
        ldr     r7, [r0, #0x1C]
        ldr     r9, [r0, #4]
        ldr     r10, [r0, #0xC]
        ldr     r8, [r0, #0x14]
        ldr     r6, [r0, #0x10]
        ldr     r12, [r0, #0x18]
        ldr     r0, [r0, #8]
        mov     r1, r7, asr #1
        rsb     r1, r1, #0
        add     r11, r10, r8
        str     r11, [sp, #0x48]
        sub     r2, r1, r7
        mov     r1, r10, asr #1
        rsb     r1, r1, #0
        add     r11, r9, r9, asr #1
        str     r11, [sp, #0x44]
        sub     r3, r8, r10
        str     r1, [sp, #0x4C]
        ldr     r1, [sp, #0x44]
        add     r11, r5, r6
        add     r2, r3, r2
        ldr     r3, [sp, #0x48]
        str     r11, [sp, #0x40]
        add     r11, r0, r12, asr #1
        str     r11, [sp, #0x3C]
        add     r1, r3, r1
        ldr     r3, [sp, #0x3C]
        ldr     r11, [sp, #0x40]
        sub     r5, r5, r6
        add     r8, r8, r8, asr #1
        add     lr, lr, #1
        add     r3, r11, r3
        add     r11, r9, r7
        str     r11, [sp, #0x48]
        ldr     r11, [sp, #0x4C]
        sub     r7, r7, r9
        str     r7, [sp, #0x44]
        sub     r11, r11, r10
        str     r11, [sp, #0x4C]
        rsb     r9, r12, r0, asr #1
        ldr     r12, [sp, #0x48]
        ldr     r0, [sp, #0x4C]
        sub     r7, r1, r2, asr #2
        add     r6, r3, r7
        add     r1, r2, r1, asr #2
        add     r0, r12, r0
        ldr     r12, [sp, #0x44]
        sub     r3, r3, r7
        cmp     lr, #8
        add     r8, r12, r8
        ldr     r12, [sp, #0x34]
        str     r6, [r12]
        ldr     r10, [sp, #0x24]
        rsb     r12, r8, r0, asr #2
        add     r6, r5, r9
        add     r11, r6, r12
        str     r11, [r10]
        sub     r5, r5, r9
        add     r8, r0, r8, asr #2
        ldr     r0, [sp, #4]
        add     r9, r5, r8
        sub     r5, r5, r8
        str     r9, [r0]
        ldr     r0, [sp, #0x40]
        ldr     r9, [sp, #0x3C]
        ldr     r2, [sp]
        sub     r6, r6, r12
        sub     r0, r0, r9
        add     r9, r0, r1
        str     r9, [r2]
        sub     r0, r0, r1
        ldr     r1, [sp, #0x2C]
        str     r0, [r1]
        ldr     r0, [sp, #0x28]
        str     r5, [r0]
        str     r6, [r4], #4
        ldr     r0, [sp, #0x30]
        str     r3, [r0], #4
        ldr     r1, [sp, #0x34]
        str     r0, [sp, #0x30]
        add     r1, r1, #4
        str     r1, [sp, #0x34]
        ldr     r1, [sp, #0x24]
        ldr     r0, [sp, #8]
        add     r1, r1, #4
        str     r1, [sp, #0x24]
        ldr     r1, [sp, #4]
        add     r0, r0, #0x20
        str     r0, [sp, #8]
        add     r1, r1, #4
        str     r1, [sp, #4]
        ldr     r1, [sp]
        add     r1, r1, #4
        str     r1, [sp]
        ldr     r1, [sp, #0x2C]
        add     r1, r1, #4
        str     r1, [sp, #0x2C]
        ldr     r1, [sp, #0x28]
        add     r1, r1, #4
        str     r1, [sp, #0x28]
        blt     LLBZ1
        ldr     lr, [sp, #0x10]
        ldr     r2, [sp, #0xC]
        ldr     r12, [sp, #0x14]
        ldr     r3, [sp, #0x18]
        ldr     r1, [sp, #0x1C]
        ldr     r0, [sp, #0x20]
        mov     r4, #1
        mov     lr, r4, lsl lr
        mov     r6, #0
        sub     lr, lr, #1
        mov     r5, r6
        mov     r4, #8
LLBZ2:
        add     r7, r0, r5, lsl #1
        add     r10, r3, r6, lsl #1
        mov     r8, r2
        mov     r9, #8
        str     r0, [sp, #0x20]
LLBZ3:
        ldrh    r11, [r7], #2
        ldr     r0, [r8], #4
        add     r11, r0, r11, lsl #6
        add     r0, r11, #0x20
        movs    r0, r0, asr #6
        movmi   r0, #0
        bmi     LLBZ4
        cmp     lr, r0
        movlt   r0, lr
LLBZ4:
        strh    r0, [r10], #2
        subs    r9, r9, #1
        bne     LLBZ3
        ldr     r0, [sp, #0x20]
        subs    r4, r4, #1
        add     r5, r5, r1, asr #1
        add     r6, r6, r12, asr #1
        add     r2, r2, #0x20
        bne     LLBZ2
        mov     r0, #0
        add     sp, sp, #0x15, 28
        ldmia   sp!, {r4 - r11, pc}
LLBZ5:
        mvn     r0, #7
        add     sp, sp, #0x15, 28
        ldmia   sp!, {r4 - r11, pc}


