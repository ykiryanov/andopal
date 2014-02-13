        .text
        .align  4
        .globl  _ippiSqrDiff16x16_8u32s


_ippiSqrDiff16x16_8u32s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x48
        ldr     r4, [sp, #0x6C]
        ldr     lr, [sp, #0x70]
        cmp     r0, #0
        beq     LEJU7
        cmp     r2, #0
        beq     LEJU7
        cmp     lr, #0
        beq     LEJU7
        cmp     r4, #0
        mov     r12, #0x10
        mov     r6, #0
        beq     LEJU1
        cmp     r4, #8
        beq     LEJU5
        cmp     r4, #4
        add     r4, r3, r2
        beq     LEJU4
        str     r12, [sp, #0xC]
        str     lr, [sp, #8]
        str     r3, [sp, #4]
        str     r1, [sp]
LEJU0:
        ldrb    r12, [r4]
        ldrb    lr, [r2]
        ldr     r5, [sp, #0xC]
        ldrb    r1, [r2, #1]
        ldrb    r3, [r4, #1]
        subs    r5, r5, #1
        str     r5, [sp, #0xC]
        add     lr, lr, r1
        ldrb    r7, [r2, #2]
        add     r12, lr, r12
        ldrb    lr, [r0]
        add     r12, r12, r3
        add     r12, r12, #2
        add     r1, r1, r7
        add     r3, r1, r3
        rsb     r12, lr, r12, lsr #2
        mla     r6, r12, r12, r6
        str     r3, [sp, #0x10]
        ldrb    r9, [r4, #2]
        str     r6, [sp, #0x14]
        ldrb    r1, [r2, #3]
        str     r1, [sp, #0x18]
        ldrb    r1, [r0, #1]
        str     r1, [sp, #0x1C]
        ldrb    r8, [r4, #3]
        ldrb    r6, [r2, #4]
        ldrb    r1, [r4, #4]
        ldr     r11, [sp, #0x1C]
        str     r1, [sp, #0x20]
        ldrb    r1, [r2, #7]
        ldrb    r3, [r4, #6]
        ldrb    lr, [r4, #5]
        ldrb    r5, [r2, #5]
        ldrb    r12, [r2, #6]
        str     r1, [sp, #0x24]
        ldrb    r1, [r4, #7]
        ldrb    r10, [r2, #8]
        str     r10, [sp, #0x28]
        ldrb    r10, [r4, #8]
        str     r10, [sp, #0x2C]
        ldrb    r10, [r2, #9]
        str     r10, [sp, #0x30]
        ldrb    r10, [r4, #9]
        str     r10, [sp, #0x34]
        ldrb    r10, [r2, #0xA]
        str     r10, [sp, #0x38]
        ldr     r10, [sp, #0x10]
        add     r10, r10, r9
        add     r10, r10, #2
        str     r10, [sp, #0x10]
        ldrb    r10, [r0, #2]
        str     r10, [sp, #0x3C]
        ldrb    r10, [r0, #3]
        str     r10, [sp, #0x40]
        ldr     r10, [sp, #0x10]
        rsb     r10, r11, r10, lsr #2
        ldr     r11, [sp, #0x14]
        mla     r11, r10, r10, r11
        str     r11, [sp, #0x1C]
        ldrb    r10, [r4, #0xA]
        str     r10, [sp, #0x14]
        ldr     r10, [sp, #0x18]
        add     r10, r7, r10
        add     r9, r10, r9
        add     r7, r9, r8
        ldrb    r9, [r0, #4]
        add     r7, r7, #2
        str     r9, [sp, #0x10]
        ldrb    r9, [r0, #5]
        str     r9, [sp, #0x44]
        ldr     r9, [sp, #0x3C]
        rsb     r7, r9, r7, lsr #2
        ldr     r9, [sp, #0x1C]
        mla     r7, r7, r7, r9
        ldr     r9, [sp, #0x18]
        add     r10, r9, r6
        ldrb    r9, [r2, #0xB]
        add     r8, r10, r8
        ldr     r10, [sp, #0x20]
        add     r6, r6, r5
        add     r5, r5, r12
        add     r10, r8, r10
        add     r8, r10, #2
        ldrb    r10, [r0, #6]
        str     r10, [sp, #0x3C]
        ldrb    r10, [r0, #7]
        str     r10, [sp, #0x1C]
        ldr     r10, [sp, #0x40]
        rsb     r8, r10, r8, lsr #2
        mla     r7, r8, r8, r7
        ldrb    r10, [r4, #0xB]
        ldr     r8, [sp, #0x20]
        add     r8, r6, r8
        add     r6, r8, lr
        ldrb    r8, [r0, #8]
        add     lr, r5, lr
        add     lr, lr, r3
        add     r5, lr, #2
        str     r8, [sp, #0x40]
        ldrb    r8, [r0, #9]
        add     r6, r6, #2
        str     r8, [sp, #0x20]
        ldr     r8, [sp, #0x10]
        ldr     r11, [sp, #0x20]
        rsb     r6, r8, r6, lsr #2
        mla     r7, r6, r6, r7
        ldrb    r6, [r2, #0xC]
        ldr     r8, [sp, #0x40]
        str     r6, [sp, #0x18]
        ldr     r6, [sp, #0x44]
        ldrb    lr, [r0, #0xA]
        rsb     r5, r6, r5, lsr #2
        mla     r5, r5, r5, r7
        ldr     r6, [sp, #0x24]
        str     lr, [sp, #0x10]
        ldrb    lr, [r4, #0xC]
        add     r6, r12, r6
        ldrb    r12, [r0, #0xB]
        add     r3, r6, r3
        add     r3, r3, r1
        add     r3, r3, #2
        str     r12, [sp, #0x44]
        ldr     r12, [sp, #0x3C]
        ldrb    r7, [r2, #0xD]
        rsb     r3, r12, r3, lsr #2
        mla     r5, r3, r3, r5
        ldr     r12, [sp, #0x24]
        ldr     r3, [sp, #0x28]
        add     r3, r12, r3
        ldrb    r12, [r0, #0xC]
        add     r1, r3, r1
        ldr     r3, [sp, #0x2C]
        add     r3, r1, r3
        add     r1, r3, #2
        ldrb    r3, [r4, #0xD]
        str     r12, [sp, #0x3C]
        ldr     r12, [sp, #0x1C]
        rsb     r1, r12, r1, lsr #2
        mla     r1, r1, r1, r5
        ldr     r12, [sp, #0x30]
        ldr     r5, [sp, #0x28]
        add     r12, r5, r12
        ldr     r5, [sp, #0x2C]
        add     r12, r12, r5
        ldr     r5, [sp, #0x34]
        add     r5, r12, r5
        ldrb    r12, [r4, #0xE]
        add     r6, r5, #2
        ldrb    r5, [r2, #0xE]
        rsb     r6, r8, r6, lsr #2
        mla     r6, r6, r6, r1
        ldr     r8, [sp, #0x30]
        ldr     r1, [sp, #0x38]
        add     r1, r8, r1
        ldr     r8, [sp, #0x34]
        add     r1, r1, r8
        ldr     r8, [sp, #0x14]
        add     r8, r1, r8
        add     r1, r8, #2
        ldrb    r8, [r0, #0xD]
        rsb     r1, r11, r1, lsr #2
        mla     r6, r1, r1, r6
        str     r8, [sp, #0x40]
        ldrb    r8, [r2, #0xF]
        ldr     r1, [sp, #0x38]
        str     r6, [sp, #0x34]
        ldr     r6, [sp, #0x14]
        ldrb    r11, [r0, #0xE]
        add     r1, r1, r9
        add     r6, r1, r6
        add     r1, r6, r10
        ldrb    r6, [r4, #0xF]
        str     r11, [sp, #0x38]
        ldr     r11, [sp, #0x10]
        add     r1, r1, #2
        ldrb    r2, [r2, #0x10]
        rsb     r1, r11, r1, lsr #2
        ldr     r11, [sp, #0x34]
        add     r2, r8, r2
        mla     r1, r1, r1, r11
        ldr     r11, [sp, #0x18]
        add     r11, r9, r11
        add     r10, r11, r10
        ldr     r11, [sp, #0x44]
        add     r9, r10, lr
        add     r10, r9, #2
        ldrb    r9, [r0, #0xF]
        rsb     r10, r11, r10, lsr #2
        mla     r1, r10, r10, r1
        ldr     r10, [sp, #0x18]
        ldr     r11, [sp, #0x3C]
        add     r10, r10, r7
        add     lr, r10, lr
        add     r7, r7, r5
        add     lr, lr, r3
        add     r3, r7, r3
        add     r3, r3, r12
        add     r5, r5, r8
        add     r10, lr, #2
        ldrb    lr, [r4, #0x10]
        add     r12, r5, r12
        ldr     r5, [sp, #0x40]
        rsb     r10, r11, r10, lsr #2
        mla     r1, r10, r10, r1
        add     r3, r3, #2
        add     r12, r12, r6
        rsb     r3, r5, r3, lsr #2
        add     r6, r2, r6
        mla     r1, r3, r3, r1
        add     r3, r12, #2
        ldr     r12, [sp, #0x38]
        add     lr, r6, lr
        mov     r2, r4
        rsb     r3, r12, r3, lsr #2
        mla     r1, r3, r3, r1
        add     r3, lr, #2
        ldr     r12, [sp, #4]
        rsb     r3, r9, r3, lsr #2
        mla     r6, r3, r3, r1
        ldr     r1, [sp]
        add     r4, r12, r4
        add     r0, r0, r1
        ldr     r1, [sp, #0xC]
        bne     LEJU0
        ldr     lr, [sp, #8]
        b       LEJU3
LEJU1:
        str     lr, [sp, #8]
        str     r3, [sp, #4]
        str     r1, [sp]
LEJU2:
        ldrb    lr, [r2]
        ldrb    r4, [r0]
        ldrb    r1, [r2, #1]
        ldrb    r3, [r0, #1]
        ldrb    r9, [r0, #9]
        sub     lr, lr, r4
        mla     r6, lr, lr, r6
        sub     r1, r1, r3
        ldrb    lr, [r0, #2]
        ldrb    r3, [r2, #2]
        ldrb    r4, [r0, #3]
        mla     r1, r1, r1, r6
        ldrb    r6, [r0, #4]
        sub     lr, r3, lr
        ldrb    r3, [r2, #3]
        subs    r12, r12, #1
        mla     r5, lr, lr, r1
        ldrb    lr, [r2, #4]
        sub     r3, r3, r4
        ldrb    r1, [r2, #5]
        ldrb    r4, [r0, #5]
        mla     r5, r3, r3, r5
        sub     r7, lr, r6
        ldrb    r6, [r0, #6]
        ldrb    r3, [r2, #6]
        ldrb    lr, [r2, #7]
        mla     r7, r7, r7, r5
        sub     r8, r1, r4
        ldrb    r4, [r0, #7]
        ldrb    r1, [r2, #8]
        ldrb    r5, [r0, #8]
        mla     r7, r8, r8, r7
        sub     r6, r3, r6
        ldrb    r8, [r2, #9]
        ldrb    r3, [r2, #0xA]
        sub     r1, r1, r5
        mla     r6, r6, r6, r7
        sub     r7, lr, r4
        ldrb    r4, [r2, #0xB]
        ldrb    lr, [r0, #0xA]
        sub     r11, r8, r9
        mla     r10, r7, r7, r6
        str     r4, [sp, #0x44]
        ldrb    r4, [r0, #0xB]
        ldrb    r5, [r2, #0xC]
        ldrb    r6, [r0, #0xC]
        mla     r1, r1, r1, r10
        ldrb    r7, [r2, #0xD]
        ldrb    r10, [r0, #0xD]
        ldrb    r8, [r2, #0xE]
        ldrb    r9, [r0, #0xE]
        mla     r1, r11, r11, r1
        sub     lr, r3, lr
        ldrb    r3, [r2, #0xF]
        ldr     r11, [sp, #0x44]
        sub     r5, r5, r6
        mla     r1, lr, lr, r1
        str     r3, [sp, #0x40]
        ldrb    r3, [r0, #0xF]
        sub     r4, r11, r4
        ldr     lr, [sp, #0x40]
        mla     r1, r4, r4, r1
        sub     r7, r7, r10
        sub     r8, r8, r9
        sub     r3, lr, r3
        mla     r1, r5, r5, r1
        ldr     lr, [sp, #4]
        add     r2, lr, r2
        ldr     lr, [sp]
        mla     r1, r7, r7, r1
        add     r0, r0, lr
        mla     r1, r8, r8, r1
        mla     r6, r3, r3, r1
        bne     LEJU2
        ldr     lr, [sp, #8]
LEJU3:
        mov     r0, #0
        str     r6, [lr]
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LEJU4:
        ldrb    r8, [r2]
        ldrb    r5, [r4]
        ldrb    r7, [r0]
        ldrb    r10, [r0, #2]
        ldrb    r9, [r0, #3]
        add     r5, r8, r5
        add     r8, r5, #1
        ldrb    r5, [r2, #1]
        subs    r12, r12, #1
        rsb     r7, r7, r8, lsr #1
        mla     r6, r7, r7, r6
        ldrb    r8, [r4, #1]
        ldrb    r7, [r0, #1]
        add     r8, r5, r8
        add     r5, r8, #1
        ldrb    r8, [r2, #3]
        rsb     r5, r7, r5, lsr #1
        mla     r6, r5, r5, r6
        ldrb    r5, [r4, #2]
        ldrb    r7, [r2, #2]
        add     r5, r7, r5
        ldrb    r7, [r4, #3]
        add     r11, r5, #1
        ldrb    r5, [r2, #4]
        rsb     r11, r10, r11, lsr #1
        mla     r6, r11, r11, r6
        ldrb    r10, [r4, #4]
        add     r7, r8, r7
        ldrb    r8, [r2, #5]
        add     r11, r7, #1
        ldrb    r7, [r0, #4]
        rsb     r11, r9, r11, lsr #1
        mla     r9, r11, r11, r6
        add     r5, r5, r10
        ldrb    r10, [r4, #5]
        add     r11, r5, #1
        ldrb    r5, [r0, #5]
        ldrb    r6, [r2, #6]
        rsb     r11, r7, r11, lsr #1
        mla     r9, r11, r11, r9
        add     r8, r8, r10
        ldrb    r10, [r4, #6]
        add     r11, r8, #1
        ldrb    r7, [r0, #6]
        ldrb    r8, [r2, #7]
        rsb     r11, r5, r11, lsr #1
        mla     r9, r11, r11, r9
        add     r6, r6, r10
        ldrb    r10, [r4, #7]
        add     r11, r6, #1
        ldrb    r5, [r0, #7]
        ldrb    r6, [r2, #8]
        rsb     r11, r7, r11, lsr #1
        mla     r9, r11, r11, r9
        add     r8, r8, r10
        ldrb    r10, [r4, #8]
        add     r11, r8, #1
        ldrb    r7, [r0, #8]
        ldrb    r8, [r2, #9]
        rsb     r11, r5, r11, lsr #1
        mla     r9, r11, r11, r9
        add     r6, r6, r10
        ldrb    r10, [r4, #9]
        add     r11, r6, #1
        ldrb    r5, [r0, #9]
        ldrb    r6, [r2, #0xA]
        rsb     r11, r7, r11, lsr #1
        mla     r9, r11, r11, r9
        add     r8, r8, r10
        ldrb    r10, [r4, #0xA]
        add     r11, r8, #1
        ldrb    r7, [r0, #0xA]
        ldrb    r8, [r2, #0xB]
        rsb     r11, r5, r11, lsr #1
        mla     r9, r11, r11, r9
        add     r6, r6, r10
        ldrb    r10, [r4, #0xB]
        add     r11, r6, #1
        ldrb    r5, [r0, #0xB]
        ldrb    r6, [r2, #0xC]
        rsb     r11, r7, r11, lsr #1
        mla     r9, r11, r11, r9
        add     r8, r8, r10
        ldrb    r10, [r4, #0xC]
        add     r11, r8, #1
        ldrb    r7, [r0, #0xC]
        ldrb    r8, [r2, #0xD]
        rsb     r11, r5, r11, lsr #1
        mla     r9, r11, r11, r9
        add     r6, r6, r10
        ldrb    r10, [r4, #0xD]
        add     r11, r6, #1
        ldrb    r5, [r0, #0xD]
        ldrb    r6, [r2, #0xE]
        ldrb    r2, [r2, #0xF]
        rsb     r11, r7, r11, lsr #1
        mla     r9, r11, r11, r9
        add     r10, r8, r10
        ldrb    r8, [r4, #0xE]
        ldrb    r7, [r0, #0xE]
        add     r10, r10, #1
        add     r6, r6, r8
        ldrb    r8, [r4, #0xF]
        rsb     r10, r5, r10, lsr #1
        mla     r9, r10, r10, r9
        add     r6, r6, #1
        ldrb    r5, [r0, #0xF]
        rsb     r6, r7, r6, lsr #1
        add     r2, r2, r8
        mla     r9, r6, r6, r9
        add     r6, r2, #1
        mov     r2, r4
        rsb     r6, r5, r6, lsr #1
        add     r4, r3, r4
        mla     r6, r6, r6, r9
        add     r0, r0, r1
        bne     LEJU4
        b       LEJU3
LEJU5:
        str     lr, [sp, #8]
        str     r3, [sp, #4]
        str     r1, [sp]
LEJU6:
        ldrb    r4, [r2]
        ldrb    r3, [r2, #1]
        ldrb    lr, [r0]
        ldrb    r1, [r2, #2]
        ldrb    r5, [r2, #3]
        add     r4, r4, r3
        ldrb    r8, [r2, #4]
        ldrb    r10, [r0, #3]
        ldrb    r7, [r2, #5]
        ldrb    r11, [r0, #4]
        add     r4, r4, #1
        add     r3, r3, r1
        add     r1, r1, r5
        rsb     r4, lr, r4, lsr #1
        mla     r6, r4, r4, r6
        ldrb    lr, [r0, #1]
        ldrb    r4, [r2, #9]
        add     r3, r3, #1
        add     r1, r1, #1
        subs    r12, r12, #1
        rsb     r3, lr, r3, lsr #1
        mla     r6, r3, r3, r6
        ldrb    r3, [r0, #2]
        ldrb    lr, [r2, #8]
        add     r5, r5, r8
        rsb     r1, r3, r1, lsr #1
        mla     r9, r1, r1, r6
        ldrb    r3, [r2, #6]
        ldrb    r1, [r2, #7]
        ldrb    r6, [r2, #0xA]
        str     r11, [sp, #0x44]
        ldrb    r11, [r0, #5]
        add     r5, r5, #1
        add     r8, r8, r7
        rsb     r5, r10, r5, lsr #1
        mla     r9, r5, r5, r9
        str     r11, [sp, #0x40]
        ldrb    r11, [r0, #7]
        ldrb    r5, [r2, #0xB]
        add     r10, r8, #1
        ldrb    r8, [r0, #6]
        str     r11, [sp, #0x3C]
        ldr     r11, [sp, #0x44]
        add     r7, r7, r3
        add     r7, r7, #1
        add     r3, r3, r1
        rsb     r10, r11, r10, lsr #1
        mla     r9, r10, r10, r9
        ldrb    r10, [r0, #8]
        add     r1, r1, lr
        add     lr, lr, r4
        str     r10, [sp, #0x44]
        ldr     r10, [sp, #0x40]
        ldrb    r11, [r0, #0xA]
        add     r4, r4, r6
        rsb     r7, r10, r7, lsr #1
        mla     r9, r7, r7, r9
        ldrb    r7, [r2, #0xC]
        add     r10, r3, #1
        ldrb    r3, [r0, #9]
        str     r11, [sp, #0x40]
        rsb     r10, r8, r10, lsr #1
        mla     r9, r10, r10, r9
        ldr     r10, [sp, #0x3C]
        add     r8, r1, #1
        ldrb    r1, [r0, #0xB]
        ldr     r11, [sp, #0x44]
        rsb     r8, r10, r8, lsr #1
        mla     r9, r8, r8, r9
        ldrb    r8, [r2, #0xD]
        add     r10, lr, #1
        ldrb    lr, [r0, #0xC]
        add     r6, r6, r5
        rsb     r10, r11, r10, lsr #1
        mla     r9, r10, r10, r9
        add     r10, r4, #1
        str     lr, [sp, #0x3C]
        ldrb    lr, [r2, #0xE]
        ldrb    r4, [r0, #0xD]
        rsb     r10, r3, r10, lsr #1
        mla     r9, r10, r10, r9
        ldr     r10, [sp, #0x40]
        add     r6, r6, #1
        ldrb    r3, [r2, #0xF]
        add     r5, r5, r7
        rsb     r6, r10, r6, lsr #1
        mla     r6, r6, r6, r9
        add     r9, r5, #1
        ldrb    r5, [r0, #0xE]
        rsb     r9, r1, r9, lsr #1
        mla     r6, r9, r9, r6
        ldr     r9, [sp, #0x3C]
        add     r7, r7, r8
        add     r7, r7, #1
        ldrb    r1, [r0, #0xF]
        add     r8, r8, lr
        rsb     r7, r9, r7, lsr #1
        mla     r7, r7, r7, r6
        ldrb    r6, [r2, #0x10]
        add     r8, r8, #1
        add     lr, lr, r3
        add     r6, r3, r6
        ldr     r3, [sp, #4]
        rsb     r8, r4, r8, lsr #1
        mla     r7, r8, r8, r7
        add     lr, lr, #1
        add     r6, r6, #1
        rsb     lr, r5, lr, lsr #1
        rsb     r6, r1, r6, lsr #1
        mla     r7, lr, lr, r7
        ldr     r1, [sp]
        add     r2, r3, r2
        add     r0, r0, r1
        mla     r6, r6, r6, r7
        bne     LEJU6
        ldr     lr, [sp, #8]
        b       LEJU3
LEJU7:
        mvn     r0, #7
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}


