        .text
        .align  4
        .globl  _ippiTransformLuma8x8InvAddPred_H264_16s8u_C1R


_ippiTransformLuma8x8InvAddPred_H264_16s8u_C1R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x52, 30
        ldr     r12, [sp, #0x16C]
        cmp     r0, #0
        beq     LLCQ5
        cmp     r2, #0
        beq     LLCQ5
        cmp     r3, #0
        beq     LLCQ5
        add     r10, r2, #0xC
        add     r9, r2, #0xA
        add     r8, r2, #0xE
        add     lr, r2, #2
        add     r6, r2, #8
        add     r5, r2, #4
        add     r4, r2, #6
        mov     r11, #0
        mov     r7, r11
        str     r2, [sp, #0x30]
        str     r2, [sp, #0x14]
        str     r0, [sp, #0x18]
        str     r3, [sp, #0x1C]
        str     lr, [sp, #4]
        str     r8, [sp]
        str     r9, [sp, #8]
        str     r10, [sp, #0xC]
        str     r11, [sp, #0x10]
        str     r12, [sp, #0x20]
        str     r1, [sp, #0x24]
LLCQ0:
        ldr     r0, [sp]
        ldrsh   r9, [r4], #0x10
        ldrsh   r1, [r6], #0x10
        ldrsh   lr, [r0]
        ldr     r0, [sp, #8]
        ldrsh   r8, [r0]
        ldr     r0, [sp, #4]
        mov     r3, lr, asr #1
        rsb     r3, r3, #0
        ldrsh   r2, [r0]
        ldr     r0, [sp, #0x30]
        sub     r10, r8, r9
        add     r12, r9, r8
        add     r8, r8, r8, asr #1
        ldrsh   r0, [r0]
        str     r1, [sp, #0x2C]
        ldrsh   r1, [r5], #0x10
        sub     r3, r3, lr
        add     r3, r10, r3
        mov     r10, r9, asr #1
        str     r1, [sp, #0x28]
        ldr     r1, [sp, #0xC]
        ldrsh   r1, [r1]
        str     r12, [sp, #0x34]
        str     r10, [sp, #0x40]
        add     r12, r2, r2, asr #1
        str     r12, [sp, #0x38]
        ldr     r12, [sp, #0x2C]
        ldr     r11, [sp, #0x34]
        ldr     r10, [sp, #0x38]
        add     r12, r0, r12
        str     r12, [sp, #0x3C]
        ldr     r12, [sp, #0x28]
        add     r10, r11, r10
        add     r11, r2, lr
        sub     lr, lr, r2
        ldr     r2, [sp, #0x2C]
        str     lr, [sp, #0x44]
        str     r10, [sp, #0x38]
        ldr     r10, [sp, #0x40]
        str     r11, [sp, #0x40]
        sub     r0, r0, r2
        ldr     r2, [sp, #0x40]
        str     r0, [sp, #0x2C]
        ldr     r0, [sp, #0x28]
        add     r12, r12, r1, asr #1
        rsb     r10, r10, #0
        rsb     lr, r1, r0, asr #1
        ldr     r0, [sp, #0x3C]
        sub     r10, r10, r9
        str     r10, [sp, #0x34]
        ldr     r9, [sp, #0x2C]
        add     r1, r0, r12
        ldr     r0, [sp, #0x34]
        add     r2, r2, r0
        ldr     r0, [sp, #0x44]
        add     r10, r0, r8
        ldr     r0, [sp, #0x38]
        add     r8, sp, #0x48
        sub     r0, r0, r3, asr #2
        str     r0, [sp, #0x44]
        ldr     r0, [sp, #0x10]
        add     r0, r8, r0
        add     r8, r9, lr
        sub     lr, r9, lr
        ldr     r9, [sp, #0x3C]
        str     r0, [sp, #0x40]
        ldr     r0, [sp, #0x44]
        sub     r12, r9, r12
        ldr     r9, [sp, #0x38]
        add     r0, r1, r0
        add     r3, r3, r9, asr #2
        add     r9, r2, r10, asr #2
        rsb     r2, r10, r2, asr #2
        add     r10, sp, #0x48
        str     r0, [r10, +r7, lsl #2]
        add     r10, r8, r2
        sub     r8, r8, r2
        ldr     r2, [sp, #0x44]
        add     r7, r7, #1
        add     r11, lr, r9
        sub     r1, r1, r2
        ldr     r2, [sp, #0x30]
        add     r0, r12, r3
        sub     r12, r12, r3
        sub     lr, lr, r9
        add     r2, r2, #0x10
        str     r2, [sp, #0x30]
        ldr     r2, [sp, #0xC]
        cmp     r7, #8
        add     r2, r2, #0x10
        str     r2, [sp, #0xC]
        ldr     r2, [sp, #8]
        add     r2, r2, #0x10
        str     r2, [sp, #8]
        ldr     r2, [sp]
        add     r2, r2, #0x10
        str     r2, [sp]
        ldr     r2, [sp, #4]
        add     r2, r2, #0x10
        str     r2, [sp, #4]
        ldr     r2, [sp, #0x40]
        str     r0, [r2, #0x60]
        str     r10, [r2, #0x20]
        str     r11, [r2, #0x40]
        str     r12, [r2, #0x80]
        str     lr, [r2, #0xA0]
        str     r8, [r2, #0xC0]
        str     r1, [r2, #0xE0]
        ldr     r0, [sp, #0x10]
        add     r0, r0, #4
        str     r0, [sp, #0x10]
        blt     LLCQ0
        ldr     r2, [sp, #0x14]
        ldr     r0, [sp, #0x18]
        ldr     r3, [sp, #0x1C]
        ldr     r12, [sp, #0x20]
        ldr     r1, [sp, #0x24]
        add     r10, r2, #0x10
        add     r9, r2, #0x20
        add     r8, r2, #0x30
        add     r7, r2, #0x40
        add     r6, r2, #0x50
        add     r5, r2, #0x70
        add     lr, r2, #0x60
        mov     r11, #0
        mov     r4, r11
        str     r2, [sp, #0x30]
        str     r2, [sp, #0x14]
        str     r0, [sp, #0x18]
        str     r3, [sp, #0x1C]
        str     r5, [sp, #0x2C]
        str     r6, [sp]
        str     r7, [sp, #0x28]
        str     r8, [sp, #8]
        str     r9, [sp, #0xC]
        str     r10, [sp, #4]
        str     r11, [sp, #0x10]
        str     r12, [sp, #0x20]
        str     r1, [sp, #0x24]
LLCQ1:
        ldr     r0, [sp, #0x10]
        add     r1, sp, #0x48
        ldr     r5, [r1, +r4, lsl #5]
        add     r0, r1, r0
        ldr     r6, [r0, #0x10]
        ldr     r10, [r0, #0xC]
        ldr     r8, [r0, #0x14]
        ldr     r7, [r0, #0x1C]
        ldr     r9, [r0, #4]
        ldr     r12, [r0, #0x18]
        ldr     r0, [r0, #8]
        mov     r1, r7, asr #1
        rsb     r1, r1, #0
        sub     r2, r1, r7
        add     r11, r10, r8
        mov     r1, r10, asr #1
        str     r11, [sp, #0x44]
        add     r11, r9, r9, asr #1
        str     r11, [sp, #0x40]
        sub     r3, r8, r10
        rsb     r1, r1, #0
        str     r1, [sp, #0x34]
        ldr     r1, [sp, #0x40]
        add     r2, r3, r2
        ldr     r3, [sp, #0x44]
        add     r11, r5, r6
        str     r11, [sp, #0x3C]
        add     r11, r0, r12, asr #1
        str     r11, [sp, #0x38]
        ldr     r11, [sp, #0x3C]
        add     r1, r3, r1
        ldr     r3, [sp, #0x38]
        sub     r5, r5, r6
        add     r8, r8, r8, asr #1
        add     r4, r4, #1
        add     r3, r11, r3
        add     r11, r9, r7
        str     r11, [sp, #0x44]
        ldr     r11, [sp, #0x34]
        sub     r7, r7, r9
        str     r7, [sp, #0x34]
        sub     r11, r11, r10
        str     r11, [sp, #0x40]
        rsb     r9, r12, r0, asr #1
        ldr     r12, [sp, #0x44]
        ldr     r0, [sp, #0x40]
        sub     r7, r1, r2, asr #2
        add     r6, r3, r7
        add     r1, r2, r1, asr #2
        add     r0, r12, r0
        ldr     r12, [sp, #0x34]
        sub     r3, r3, r7
        cmp     r4, #8
        add     r8, r12, r8
        ldr     r12, [sp, #0x30]
        strh    r6, [r12]
        ldr     r10, [sp, #4]
        rsb     r12, r8, r0, asr #2
        add     r6, r5, r9
        add     r11, r6, r12
        strh    r11, [r10]
        sub     r5, r5, r9
        add     r8, r0, r8, asr #2
        ldr     r0, [sp, #0xC]
        add     r9, r5, r8
        sub     r5, r5, r8
        strh    r9, [r0]
        ldr     r0, [sp, #0x3C]
        ldr     r9, [sp, #0x38]
        ldr     r2, [sp, #8]
        sub     r6, r6, r12
        sub     r0, r0, r9
        add     r9, r0, r1
        strh    r9, [r2]
        sub     r0, r0, r1
        ldr     r1, [sp, #0x28]
        strh    r0, [r1]
        ldr     r0, [sp]
        strh    r5, [r0]
        strh    r6, [lr], #2
        ldr     r0, [sp, #0x2C]
        strh    r3, [r0], #2
        ldr     r1, [sp, #0x30]
        str     r0, [sp, #0x2C]
        add     r1, r1, #2
        str     r1, [sp, #0x30]
        ldr     r1, [sp, #4]
        ldr     r0, [sp, #0x10]
        add     r1, r1, #2
        str     r1, [sp, #4]
        ldr     r1, [sp, #0xC]
        add     r0, r0, #0x20
        str     r0, [sp, #0x10]
        add     r1, r1, #2
        str     r1, [sp, #0xC]
        ldr     r1, [sp, #8]
        add     r1, r1, #2
        str     r1, [sp, #8]
        ldr     r1, [sp, #0x28]
        add     r1, r1, #2
        str     r1, [sp, #0x28]
        ldr     r1, [sp]
        add     r1, r1, #2
        str     r1, [sp]
        blt     LLCQ1
        ldr     r2, [sp, #0x14]
        ldr     r0, [sp, #0x18]
        ldr     r3, [sp, #0x1C]
        ldr     r12, [sp, #0x20]
        ldr     r1, [sp, #0x24]
        mov     lr, #8
LLCQ2:
        mov     r4, r2
        mov     r5, r0
        mov     r7, r3
        mov     r6, #8
LLCQ3:
        ldrb    r9, [r5], #1
        ldrsh   r8, [r4], #2
        add     r9, r8, r9, lsl #6
        add     r8, r9, #0x20
        movs    r8, r8, asr #6
        movmi   r8, #0
        bmi     LLCQ4
        cmp     r8, #0xFF
        mov     r9, #0xFF
        movgt   r8, r9
LLCQ4:
        strb    r8, [r7], #1
        subs    r6, r6, #1
        bne     LLCQ3
        subs    lr, lr, #1
        add     r0, r0, r1
        add     r3, r3, r12
        add     r2, r2, #0x10
        bne     LLCQ2
        mov     r0, #0
        add     sp, sp, #0x52, 30
        ldmia   sp!, {r4 - r11, pc}
LLCQ5:
        mvn     r0, #7
        add     sp, sp, #0x52, 30
        ldmia   sp!, {r4 - r11, pc}


