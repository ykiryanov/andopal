        .text
        .align  4
        .globl  _ippiReconstructLumaInterMB_H264_16s8u_C1R


_ippiReconstructLumaInterMB_H264_16s8u_C1R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x74
        ldr     r12, [sp, #0x98]
        cmp     r0, #0
        beq     LKWR4
        cmp     r1, #0
        beq     LKWR4
        ldr     lr, [r0]
        cmp     lr, #0
        beq     LKWR4
        cmp     r12, #0x33
        bhi     LKWR3
        ldr     lr, [pc, #0xAC8]
        tst     r3, lr
        beq     LKWR2
        ldr     lr, [pc, #0xAC0]
        ldr     r5, [pc, #0xAC0]
        ldr     r6, [pc, #0xAC0]
        mov     r8, #2
        mov     r9, #0x10
        mov     r7, #1, 24
        mvn     r4, #0xFF
        str     r9, [sp]
        str     lr, [sp, #8]
        str     r8, [sp, #4]
        str     r12, [sp, #0x14]
        str     r3, [sp, #0xC]
        str     r0, [sp, #0x10]
LKWR0:
        ldr     r3, [sp, #0xC]
        ldr     r0, [sp, #4]
        tst     r3, r0
        beq     LKWR1
        ldr     r0, [sp, #0x10]
        ldr     r10, [pc, #0xA80]
        add     r7, sp, #0x64
        ldr     r6, [r0]
        add     r3, r6, #0x20
        str     r3, [r0]
        ldrsh   r8, [r6]
        ldrsh   r0, [r6, #2]
        add     r11, r6, #0x10
        str     r0, [sp, #0x18]
        ldrsh   r0, [r6, #4]
        str     r0, [sp, #0x1C]
        ldrsh   r0, [r6, #6]
        str     r0, [sp, #0x20]
        ldrsh   r0, [r6, #8]
        str     r0, [sp, #0x24]
        ldrsh   r0, [r6, #0xA]
        str     r0, [sp, #0x28]
        ldrsh   r0, [r6, #0xC]
        str     r0, [sp, #0x2C]
        ldrsh   r0, [r6, #0xE]
        str     r0, [sp, #0x30]
        ldrsh   r0, [r6, #0x10]
        str     r0, [sp, #0x34]
        ldrsh   r0, [r6, #0x12]
        str     r0, [sp, #0x38]
        ldrsh   r0, [r6, #0x14]
        str     r0, [sp, #0x3C]
        ldrsh   r0, [r6, #0x16]
        str     r0, [sp, #0x40]
        ldrsh   lr, [r6, #0x1E]
        ldrsh   r0, [r6, #0x18]
        ldrsh   r12, [r6, #0x1A]
        ldrsh   r3, [r6, #0x1C]
        str     lr, [sp, #0x44]
        ldr     lr, [sp, #0x14]
        str     r11, [r7, #8]
        ldr     r11, [sp, #0x24]
        add     r7, sp, #0x64
        mov     lr, lr, lsl #5
        ldrsh   r9, [r10, +lr]
        ldr     r7, [r7, #8]
        add     r10, r10, lr
        str     r10, [sp, #0x50]
        mul     r9, r8, r9
        str     r7, [sp, #0x48]
        str     r9, [sp, #0x4C]
        ldrsh   r7, [r10, #0xA]
        ldrsh   lr, [r10, #8]
        str     r7, [sp, #0x54]
        ldrsh   r7, [r10, #0xC]
        mul     lr, r11, lr
        ldr     r11, [sp, #0x28]
        str     r7, [sp, #0x58]
        ldrsh   r7, [r10, #0xE]
        str     r7, [sp, #0x5C]
        ldrsh   r7, [r10, #0x18]
        ldrsh   r9, [r10, #0x1C]
        ldrsh   r8, [r10, #0x1A]
        mul     r7, r0, r7
        ldrsh   r10, [r10, #0x1E]
        mul     r8, r12, r8
        mul     r9, r3, r9
        ldr     r0, [sp, #0x44]
        str     lr, [sp, #0x24]
        ldr     lr, [sp, #0x54]
        str     r9, [sp, #0x28]
        mul     r3, r0, r10
        ldr     r0, [sp, #0x50]
        mul     lr, r11, lr
        ldr     r11, [sp, #0x2C]
        str     r8, [sp, #0x2C]
        str     lr, [sp, #0x54]
        ldr     lr, [sp, #0x58]
        mul     lr, r11, lr
        ldr     r11, [sp, #0x30]
        str     r7, [sp, #0x30]
        str     lr, [sp, #0x58]
        ldr     lr, [sp, #0x5C]
        mul     lr, r11, lr
        ldr     r11, [sp, #0x18]
        str     lr, [sp, #0x5C]
        ldrsh   r12, [r0, #2]
        ldrsh   r9, [r0, #6]
        ldrsh   r7, [r0, #0x12]
        ldrsh   r8, [r0, #0x14]
        mul     r12, r11, r12
        ldrsh   lr, [r0, #4]
        ldr     r11, [sp, #0x1C]
        ldrsh   r10, [r0, #0x10]
        str     r8, [sp, #0x44]
        ldrsh   r8, [r0, #0x16]
        mul     lr, r11, lr
        ldr     r11, [sp, #0x20]
        ldrsh   r0, [r0, #4]
        mul     r9, r11, r9
        ldr     r11, [sp, #0x34]
        mul     r10, r11, r10
        ldr     r11, [sp, #0x38]
        mul     r7, r11, r7
        ldr     r11, [sp, #0x3C]
        str     r7, [sp, #0x50]
        ldr     r7, [sp, #0x44]
        mul     r7, r11, r7
        str     r7, [sp, #0x44]
        ldr     r7, [sp, #0x40]
        mul     r8, r7, r8
        ldr     r7, [sp, #0x4C]
        strh    r12, [r6, #2]
        strh    lr, [r6, #4]
        ldr     r12, [sp, #0x24]
        mov     r7, r7, lsl #16
        add     lr, sp, #0x64
        strh    r12, [r6, #8]
        ldr     r12, [sp, #0x54]
        mov     r7, r7, asr #16
        mul     r0, r0, r7
        strh    r12, [r6, #0xA]
        ldr     r12, [sp, #0x58]
        strh    r12, [r6, #0xC]
        ldr     r12, [sp, #0x5C]
        strh    r12, [r6, #0xE]
        ldr     r12, [sp, #0x30]
        strh    r12, [r6, #0x18]
        ldr     r12, [sp, #0x2C]
        strh    r12, [r6, #0x1A]
        ldr     r12, [sp, #0x28]
        strh    r3, [r6, #0x1E]
        strh    r10, [r6, #0x10]
        strh    r9, [r6, #6]
        strh    r12, [r6, #0x1C]
        ldr     r3, [sp, #0x50]
        add     r12, r6, #8
        strh    r3, [r6, #0x12]
        ldr     r3, [sp, #0x44]
        strh    r0, [r6]
        strh    r8, [r6, #0x16]
        strh    r3, [r6, #0x14]
        add     r0, sp, #0x64
        str     r6, [r0]
        add     r0, sp, #0x64
        ldr     r3, [r0]
        add     r0, sp, #0x64
        str     r12, [r0, #4]
        ldrsh   r0, [r3, #4]
        ldrsh   r7, [r3, #6]
        ldrsh   r8, [r3, #2]
        ldrsh   r12, [r3]
        ldr     lr, [lr, #4]
        rsb     r9, r7, r8, asr #1
        add     r8, r8, r7, asr #1
        sub     r7, r12, r0
        mov     r10, r9, lsl #16
        add     r9, r12, r0
        add     r0, sp, #0x64
        mov     r7, r7, lsl #16
        mov     r12, r10, asr #16
        add     r10, r6, #0x18
        str     r10, [r0, #0xC]
        mov     r10, r8, lsl #16
        add     r0, sp, #0x64
        ldr     r0, [r0, #0xC]
        mov     r8, r9, lsl #16
        mov     r10, r10, asr #16
        add     r9, r12, r7, asr #16
        rsb     r11, r10, r8, asr #16
        rsb     r7, r12, r7, asr #16
        strh    r7, [r3, #4]
        strh    r11, [r3, #6]
        add     r8, r10, r8, asr #16
        strh    r8, [r3]
        strh    r9, [r3, #2]
        ldrsh   r9, [lr, #4]
        ldrsh   r10, [lr]
        ldrsh   r8, [lr, #2]
        ldrsh   r7, [lr, #6]
        add     r12, r1, r2
        str     r12, [sp, #0x5C]
        add     r12, r2, r12
        add     r11, r10, r9
        str     r11, [sp, #0x58]
        rsb     r11, r7, r8, asr #1
        str     r11, [sp, #0x54]
        add     r8, r8, r7, asr #1
        ldr     r7, [sp, #0x54]
        sub     r10, r10, r9
        mov     r7, r7, lsl #16
        mov     r9, r10, lsl #16
        mov     r10, r8, lsl #16
        ldr     r8, [sp, #0x58]
        mov     r7, r7, asr #16
        mov     r10, r10, asr #16
        add     r11, r7, r9, asr #16
        strh    r11, [lr, #2]
        mov     r8, r8, lsl #16
        rsb     r9, r7, r9, asr #16
        rsb     r11, r10, r8, asr #16
        strh    r9, [lr, #4]
        strh    r11, [lr, #6]
        add     r8, r10, r8, asr #16
        strh    r8, [lr]
        ldr     r7, [sp, #0x48]
        add     r9, r2, r12
        ldrsh   r10, [r7, #4]
        ldrsh   r11, [r7, #6]
        ldrsh   r8, [r7]
        ldrsh   r7, [r7, #2]
        str     r9, [sp, #0x58]
        add     r9, r8, r10
        sub     r8, r8, r10
        rsb     r10, r11, r7, asr #1
        add     r7, r7, r11, asr #1
        mov     r9, r9, lsl #16
        mov     r10, r10, lsl #16
        mov     r8, r8, lsl #16
        mov     r7, r7, lsl #16
        mov     r10, r10, asr #16
        str     r10, [sp, #0x54]
        add     r10, r10, r8, asr #16
        str     r10, [sp, #0x50]
        ldr     r10, [sp, #0x48]
        mov     r7, r7, asr #16
        rsb     r11, r7, r9, asr #16
        strh    r11, [r10, #6]
        add     r9, r7, r9, asr #16
        ldr     r7, [sp, #0x48]
        strh    r9, [r7]
        ldr     r7, [sp, #0x54]
        rsb     r8, r7, r8, asr #16
        ldr     r7, [sp, #0x48]
        strh    r8, [r7, #4]
        ldr     r8, [sp, #0x50]
        strh    r8, [r7, #2]
        ldrsh   r9, [r0, #4]
        ldrsh   r8, [r0]
        ldrsh   r11, [r0, #2]
        ldrsh   r10, [r0, #6]
        add     r7, r8, r9
        sub     r9, r8, r9
        add     r8, r11, r10, asr #1
        mov     r7, r7, lsl #16
        mov     r9, r9, lsl #16
        mov     r8, r8, lsl #16
        rsb     r11, r10, r11, asr #1
        mov     r8, r8, asr #16
        rsb     r10, r8, r7, asr #16
        mov     r11, r11, lsl #16
        strh    r10, [r0, #6]
        add     r7, r8, r7, asr #16
        mov     r11, r11, asr #16
        strh    r7, [r0]
        add     r10, r11, r9, asr #16
        strh    r10, [r0, #2]
        rsb     r9, r11, r9, asr #16
        strh    r9, [r0, #4]
        ldrsh   r8, [r6, #0x18]
        ldrsh   r7, [r6, #8]
        str     r8, [sp, #0x54]
        ldrsh   r10, [r6, #0xC]
        ldrsh   r11, [r6, #0x1C]
        ldrsh   r9, [r6, #0x1A]
        ldrsh   r8, [r6, #0xA]
        str     r11, [sp, #0x50]
        ldrsh   r11, [r6, #0xE]
        str     r11, [sp, #0x4C]
        ldrsh   r11, [r6, #0x1E]
        str     r11, [sp, #0x44]
        ldrsh   r11, [r6]
        str     r11, [sp, #0x40]
        ldrsh   r11, [r6, #0x10]
        str     r11, [sp, #0x3C]
        ldrsh   r11, [r6, #2]
        str     r11, [sp, #0x38]
        ldrsh   r11, [r6, #0x12]
        str     r11, [sp, #0x34]
        ldrsh   r11, [r6, #4]
        str     r11, [sp, #0x30]
        ldrsh   r11, [r6, #0x14]
        str     r11, [sp, #0x2C]
        ldrsh   r11, [r6, #6]
        str     r11, [sp, #0x28]
        ldrsh   r11, [r6, #0x16]
        str     r11, [sp, #0x24]
        ldr     r11, [sp, #0x54]
        rsb     r11, r11, r7, asr #1
        str     r11, [sp, #0x20]
        ldr     r11, [sp, #0x54]
        add     r11, r7, r11, asr #1
        str     r11, [sp, #0x54]
        ldr     r11, [sp, #0x3C]
        rsb     r7, r9, r8, asr #1
        str     r7, [sp, #0x1C]
        ldr     r7, [sp, #0x50]
        add     r9, r8, r9, asr #1
        ldr     r8, [sp, #0x44]
        str     r9, [sp, #0x18]
        ldr     r9, [sp, #0x4C]
        rsb     r7, r7, r10, asr #1
        str     r7, [sp, #0x60]
        ldr     r7, [sp, #0x50]
        add     r10, r10, r7, asr #1
        rsb     r7, r8, r9, asr #1
        add     r8, r9, r8, asr #1
        ldr     r9, [sp, #0x40]
        str     r8, [sp, #0x50]
        mov     r10, r10, lsl #16
        mov     r7, r7, lsl #16
        add     r8, r9, r11
        sub     r9, r9, r11
        str     r9, [sp, #0x4C]
        ldr     r9, [sp, #0x20]
        ldr     r11, [sp, #0x38]
        mov     r9, r9, lsl #16
        str     r9, [sp, #0x44]
        ldr     r9, [sp, #0x54]
        mov     r9, r9, lsl #16
        str     r9, [sp, #0x54]
        ldr     r9, [sp, #0x34]
        add     r9, r11, r9
        ldr     r11, [sp, #0x34]
        str     r9, [sp, #0x40]
        ldr     r9, [sp, #0x38]
        sub     r9, r9, r11
        ldr     r11, [sp, #0x30]
        str     r9, [sp, #0x3C]
        ldr     r9, [sp, #0x1C]
        mov     r9, r9, lsl #16
        str     r9, [sp, #0x38]
        ldr     r9, [sp, #0x18]
        mov     r9, r9, lsl #16
        str     r9, [sp, #0x34]
        ldr     r9, [sp, #0x2C]
        add     r9, r11, r9
        ldr     r11, [sp, #0x2C]
        str     r9, [sp, #0x20]
        ldr     r9, [sp, #0x30]
        str     r10, [sp, #0x2C]
        ldr     r10, [sp, #0x28]
        sub     r9, r9, r11
        str     r9, [sp, #0x30]
        ldr     r9, [sp, #0x60]
        mov     r9, r9, lsl #16
        str     r9, [sp, #0x60]
        ldr     r9, [sp, #0x24]
        add     r9, r10, r9
        ldr     r10, [sp, #0x24]
        str     r9, [sp, #0x1C]
        ldr     r9, [sp, #0x28]
        str     r7, [sp, #0x24]
        ldr     r7, [sp, #0x50]
        sub     r9, r9, r10
        str     r9, [sp, #0x28]
        mov     r9, r8, lsl #16
        ldr     r8, [sp, #0x44]
        mov     r7, r7, lsl #16
        str     r7, [sp, #0x50]
        ldr     r7, [sp, #0x4C]
        mov     r11, r8, asr #16
        ldr     r8, [sp, #0x54]
        mov     r7, r7, lsl #16
        mov     r10, r8, asr #16
        add     r8, r10, r9, asr #16
        str     r8, [sp, #0x54]
        rsb     r10, r10, r9, asr #16
        ldr     r9, [sp, #0x54]
        add     r8, r11, r7, asr #16
        rsb     r7, r11, r7, asr #16
        add     r8, r8, #0x20
        add     r10, r10, #0x20
        add     r9, r9, #0x20
        add     r7, r7, #0x20
        mov     r10, r10, asr #6
        mov     r9, r9, asr #6
        mov     r7, r7, asr #6
        strh    r7, [r6, #0x10]
        strh    r9, [r6]
        mov     r8, r8, asr #6
        strh    r10, [r6, #0x18]
        strh    r8, [r6, #8]
        ldr     r7, [sp, #0x40]
        ldr     r8, [sp, #0x38]
        mov     r9, r7, lsl #16
        ldr     r7, [sp, #0x3C]
        mov     r11, r8, asr #16
        ldr     r8, [sp, #0x34]
        mov     r7, r7, lsl #16
        mov     r10, r8, asr #16
        add     r8, r10, r9, asr #16
        str     r8, [sp, #0x54]
        add     r8, r11, r7, asr #16
        rsb     r7, r11, r7, asr #16
        rsb     r10, r10, r9, asr #16
        ldr     r9, [sp, #0x54]
        add     r8, r8, #0x20
        add     r7, r7, #0x20
        add     r9, r9, #0x20
        add     r10, r10, #0x20
        mov     r8, r8, asr #6
        strh    r8, [r6, #0xA]
        mov     r7, r7, asr #6
        mov     r10, r10, asr #6
        strh    r10, [r6, #0x1A]
        strh    r7, [r6, #0x12]
        mov     r9, r9, asr #6
        strh    r9, [r6, #2]
        ldr     r8, [sp, #0x60]
        ldr     r7, [sp, #0x20]
        mov     r11, r8, asr #16
        ldr     r8, [sp, #0x2C]
        mov     r9, r7, lsl #16
        ldr     r7, [sp, #0x30]
        mov     r10, r8, asr #16
        add     r8, r10, r9, asr #16
        str     r8, [sp, #0x60]
        mov     r7, r7, lsl #16
        rsb     r10, r10, r9, asr #16
        ldr     r9, [sp, #0x60]
        add     r8, r11, r7, asr #16
        rsb     r7, r11, r7, asr #16
        add     r7, r7, #0x20
        add     r9, r9, #0x20
        add     r8, r8, #0x20
        add     r10, r10, #0x20
        mov     r7, r7, asr #6
        mov     r10, r10, asr #6
        mov     r8, r8, asr #6
        strh    r8, [r6, #0xC]
        strh    r7, [r6, #0x14]
        strh    r10, [r6, #0x1C]
        mov     r9, r9, asr #6
        strh    r9, [r6, #4]
        ldr     r7, [sp, #0x1C]
        ldr     r9, [sp, #0x24]
        ldr     r8, [sp, #0x28]
        mov     r7, r7, lsl #16
        mov     r8, r8, lsl #16
        mov     r11, r9, asr #16
        ldr     r9, [sp, #0x50]
        mov     r9, r9, asr #16
        add     r10, r9, r7, asr #16
        str     r10, [sp, #0x60]
        add     r10, r11, r8, asr #16
        rsb     r9, r9, r7, asr #16
        ldr     r7, [sp, #0x60]
        rsb     r8, r11, r8, asr #16
        add     r10, r10, #0x20
        add     r7, r7, #0x20
        add     r8, r8, #0x20
        add     r9, r9, #0x20
        mov     r10, r10, asr #6
        strh    r10, [r6, #0xE]
        mov     r7, r7, asr #6
        mov     r8, r8, asr #6
        strh    r8, [r6, #0x16]
        strh    r7, [r6, #6]
        mov     r9, r9, asr #6
        strh    r9, [r6, #0x1E]
        ldrsh   r6, [r3]
        ldrb    r8, [r1]
        ldrb    r9, [r1, #1]
        cmp     r6, r4
        ldrb    r11, [r1, #3]
        ldrb    r10, [r1, #2]
        mov     r7, r4
        movgt   r7, r6
        mov     r6, #1, 24
        cmp     r7, #1, 24
        movgt   r7, r6
        add     r7, r5, r7
        add     r8, r7, r8
        ldrb    r7, [r8, #0x100]
        strb    r7, [r1]
        ldrsh   r8, [r3, #2]
        mov     r7, r4
        cmp     r8, r4
        movgt   r7, r8
        cmp     r7, #1, 24
        movgt   r7, r6
        add     r7, r5, r7
        add     r9, r7, r9
        ldrb    r7, [r9, #0x100]
        strb    r7, [r1, #1]
        ldrsh   r8, [r3, #4]
        mov     r7, r4
        cmp     r8, r4
        movgt   r7, r8
        cmp     r7, #1, 24
        movgt   r7, r6
        add     r7, r5, r7
        add     r10, r7, r10
        ldrb    r7, [r10, #0x100]
        mov     r8, r4
        strb    r7, [r1, #2]
        ldrsh   r3, [r3, #6]
        mov     r7, r4
        cmp     r3, r4
        movgt   r7, r3
        cmp     r7, #1, 24
        movgt   r7, r6
        add     r7, r5, r7
        add     r11, r7, r11
        ldrb    r3, [r11, #0x100]
        strb    r3, [r1, #3]
        ldrsh   r3, [lr]
        ldrb    r9, [r2, +r1]
        ldr     r7, [sp, #0x5C]
        cmp     r3, r4
        movgt   r8, r3
        ldrb    r10, [r7, #1]
        ldrb    r7, [r7, #2]
        cmp     r8, #1, 24
        ldr     r3, [sp, #0x5C]
        movgt   r8, r6
        add     r8, r5, r8
        add     r9, r8, r9
        ldrb    r8, [r9, #0x100]
        ldrb    r3, [r3, #3]
        strb    r8, [r2, +r1]
        ldrsh   r9, [lr, #2]
        mov     r8, r4
        cmp     r9, r4
        movgt   r8, r9
        cmp     r8, #1, 24
        movgt   r8, r6
        add     r8, r5, r8
        add     r10, r8, r10
        ldrb    r8, [r10, #0x100]
        ldr     r9, [sp, #0x5C]
        strb    r8, [r9, #1]
        ldrsh   r9, [lr, #4]
        mov     r8, r4
        cmp     r9, r4
        movgt   r8, r9
        cmp     r8, #1, 24
        movgt   r8, r6
        add     r8, r5, r8
        add     r7, r8, r7
        ldrb    r7, [r7, #0x100]
        ldr     r8, [sp, #0x5C]
        mov     r9, r4
        strb    r7, [r8, #2]
        ldrsh   lr, [lr, #6]
        mov     r7, r4
        cmp     lr, r4
        movgt   r7, lr
        ldr     lr, [sp, #0x5C]
        cmp     r7, #1, 24
        movgt   r7, r6
        add     r7, r5, r7
        add     r3, r7, r3
        ldrb    r3, [r3, #0x100]
        strb    r3, [lr, #3]
        ldr     r3, [sp, #0x48]
        ldrb    r7, [r12, #2]
        ldrb    lr, [r12, #1]
        ldrsh   r8, [r3]
        ldr     r3, [sp, #0x5C]
        cmp     r8, r4
        movgt   r9, r8
        ldrb    r3, [r3, +r2]
        cmp     r9, #1, 24
        movgt   r9, r6
        add     r9, r5, r9
        add     r3, r9, r3
        ldr     r9, [sp, #0x5C]
        ldrb    r8, [r3, #0x100]
        ldrb    r3, [r12, #3]
        strb    r8, [r9, +r2]
        ldr     r8, [sp, #0x48]
        mov     r9, r4
        ldrsh   r8, [r8, #2]
        cmp     r8, r4
        movgt   r9, r8
        cmp     r9, #1, 24
        movgt   r9, r6
        add     r9, r5, r9
        add     lr, r9, lr
        ldrb    lr, [lr, #0x100]
        mov     r8, r4
        mov     r9, r4
        strb    lr, [r12, #1]
        ldr     lr, [sp, #0x48]
        ldrsh   lr, [lr, #4]
        cmp     lr, r4
        movgt   r8, lr
        cmp     r8, #1, 24
        movgt   r8, r6
        add     r8, r5, r8
        add     r7, r8, r7
        ldrb    lr, [r7, #0x100]
        mov     r7, r4
        strb    lr, [r12, #2]
        ldr     lr, [sp, #0x48]
        ldrsh   lr, [lr, #6]
        cmp     lr, r4
        movgt   r7, lr
        cmp     r7, #1, 24
        movgt   r7, r6
        add     r7, r5, r7
        add     r3, r7, r3
        ldrb    r3, [r3, #0x100]
        strb    r3, [r12, #3]
        ldrsh   r8, [r0]
        ldrb    r3, [r12, +r2]
        ldr     lr, [sp, #0x58]
        cmp     r8, r4
        movgt   r9, r8
        ldrb    r7, [lr, #1]
        ldrb    lr, [lr, #2]
        cmp     r9, #1, 24
        movgt   r9, r6
        add     r9, r5, r9
        add     r3, r9, r3
        ldrb    r8, [r3, #0x100]
        ldr     r3, [sp, #0x58]
        strb    r8, [r12, +r2]
        ldrsh   r8, [r0, #2]
        mov     r12, r4
        ldrb    r3, [r3, #3]
        cmp     r8, r4
        movgt   r12, r8
        cmp     r12, #1, 24
        movgt   r12, r6
        add     r12, r5, r12
        add     r7, r12, r7
        ldrb    r12, [r7, #0x100]
        ldr     r7, [sp, #0x58]
        strb    r12, [r7, #1]
        ldrsh   r7, [r0, #4]
        mov     r12, r4
        cmp     r7, r4
        movgt   r12, r7
        cmp     r12, #1, 24
        movgt   r12, r6
        add     r12, r5, r12
        add     lr, r12, lr
        ldrb    r12, [lr, #0x100]
        ldr     lr, [sp, #0x58]
        strb    r12, [lr, #2]
        ldrsh   r0, [r0, #6]
        mov     r12, r4
        cmp     r0, r4
        movgt   r12, r0
        cmp     r12, #1, 24
        movgt   r12, r6
        add     r12, r5, r12
        add     r3, r12, r3
        ldrb    r0, [r3, #0x100]
        ldr     r3, [sp, #0x58]
        strb    r0, [r3, #3]
LKWR1:
        ldr     r0, [sp]
        ldr     lr, [sp, #8]
        ldr     r12, [sp, #4]
        subs    r0, r0, #1
        str     r0, [sp]
        ldrsb   r3, [lr, #1]
        mov     r12, r12, lsl #1
        str     r12, [sp, #4]
        ldrsb   r12, [lr, #2]!
        add     r3, r1, r3
        mla     r1, r2, r12, r3
        str     lr, [sp, #8]
        bne     LKWR0
LKWR2:
        mov     r0, #0
        add     sp, sp, #0x74
        ldmia   sp!, {r4 - r11, pc}
LKWR3:
        mvn     r0, #0xA
        add     sp, sp, #0x74
        ldmia   sp!, {r4 - r11, pc}
LKWR4:
        mvn     r0, #7
        add     sp, sp, #0x74
        ldmia   sp!, {r4 - r11, pc}
        .long   0x0001fffe
        .long   xyoff
        .long   ClampTbl
        .long   InvQuantTable_w7


