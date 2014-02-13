        .text
        .align  4
        .globl  ownSearchOptimalPulsePos_M74M795_GSMAMR_16s


ownSearchOptimalPulsePos_M74M795_GSMAMR_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xAB, 30
        sub     sp, sp, #2, 22
        add     lr, sp, #0x98
        ldr     r4, [sp, #0xAD0]
        and     lr, lr, #0xF
        rsb     lr, lr, #0
        add     r12, sp, #0x98
        and     lr, lr, #0xF
        add     r12, r12, lr
        mov     lr, #8
        str     r0, [sp, #0x10]
        str     r1, [sp, #0x2C]
        str     r2, [sp, #0xC]
        str     r4, [sp, #0x28]
        add     r2, r12, #0xDC
        sub     r1, r3, #4
        mov     r0, lr
LDMN0:
        ldr     r5, [r1, #4]
        ldr     r4, [r1, #8]
        ldr     r6, [r1, #0x10]
        str     r5, [r2, #-0xDC]
        ldr     r5, [r1, #0xC]
        str     r4, [r2, #-0xBC]
        ldr     r4, [r1, #0x14]
        subs    r0, r0, #1
        str     r5, [r2, #-0x9C]
        ldr     r5, [r1, #0x18]
        str     r4, [r2, #-0x5C]
        ldr     r4, [r1, #0x1C]
        str     r5, [r2, #-0x3C]
        ldr     r5, [r1, #0x20]!
        str     r6, [r2, #-0x7C]
        str     r4, [r2, #-0x1C]
        str     r5, [r2, #4]!
        bne     LDMN0
        add     r0, r3, #1, 24
        str     r0, [sp, #0x18]
        add     r0, r12, #1, 24
        str     r0, [sp, #0x1C]
        add     r1, r12, #0x77, 30
        add     r0, r3, #0xFC
LDMN1:
        ldr     r2, [r0, #4]
        ldr     r4, [r0, #8]
        subs    lr, lr, #1
        str     r2, [r1, #-0xDC]
        ldr     r2, [r0, #0xC]
        str     r4, [r1, #-0xBC]
        ldr     r4, [r0, #0x10]
        str     r2, [r1, #-0x9C]
        ldr     r2, [r0, #0x14]
        str     r4, [r1, #-0x7C]
        ldr     r4, [r0, #0x18]
        str     r2, [r1, #-0x5C]
        ldr     r2, [r0, #0x1C]
        str     r4, [r1, #-0x3C]
        ldr     r4, [r0, #0x20]!
        str     r2, [r1, #-0x1C]
        str     r4, [r1, #4]!
        bne     LDMN1
        add     r0, r3, #2, 24
        str     r0, [sp, #0x20]
        add     r0, r12, #2, 24
        str     r0, [sp, #0x24]
        add     r2, r12, #0xB7, 30
        add     r1, r3, #0x7F, 30
        mov     r0, #8
LDMN2:
        ldr     lr, [r1, #4]
        subs    r0, r0, #1
        str     lr, [r2, #-0xDC]
        ldr     lr, [r1, #8]
        str     lr, [r2, #-0xBC]
        ldr     lr, [r1, #0xC]
        str     lr, [r2, #-0x9C]
        ldr     lr, [r1, #0x10]
        str     lr, [r2, #-0x7C]
        ldr     lr, [r1, #0x14]
        str     lr, [r2, #-0x5C]
        ldr     lr, [r1, #0x18]
        str     lr, [r2, #-0x3C]
        ldr     lr, [r1, #0x1C]
        str     lr, [r2, #-0x1C]
        ldr     lr, [r1, #0x20]!
        str     lr, [r2, #4]!
        bne     LDMN2
        add     lr, r3, #3, 24
        add     r2, r12, #3, 24
        add     r4, r12, #0xF7, 30
        add     r1, r3, #0xBF, 30
        mov     r0, #8
        str     r3, [sp, #0x78]
LDMN3:
        ldr     r3, [r1, #4]
        ldr     r5, [r1, #8]
        ldr     r6, [r1, #0xC]
        ldr     r7, [r1, #0x10]
        ldr     r8, [r1, #0x14]
        ldr     r9, [r1, #0x18]
        ldr     r10, [r1, #0x1C]
        ldr     r11, [r1, #0x20]!
        str     r3, [r4, #-0xDC]
        str     r5, [r4, #-0xBC]
        str     r6, [r4, #-0x9C]
        str     r7, [r4, #-0x7C]
        str     r8, [r4, #-0x5C]
        str     r9, [r4, #-0x3C]
        str     r10, [r4, #-0x1C]
        str     r11, [r4, #4]!
        subs    r0, r0, #1
        bne     LDMN3
        ldr     r3, [sp, #0x78]
        mov     r0, #0xFF, 30
        orr     r0, r0, #1, 22
        add     r1, r3, #1, 22
        sub     r0, r0, #0x32, 28
        str     r1, [sp, #4]
        add     r0, r12, r0
        add     r4, r12, #1, 22
        add     r5, r3, #0xFF, 30
        mov     r1, #8
        str     r12, [sp, #0x7C]
        str     r3, [sp, #0x78]
LDMN4:
        ldr     r3, [r5, #4]
        ldr     r12, [r5, #8]
        ldr     r6, [r5, #0xC]
        ldr     r7, [r5, #0x10]
        ldr     r8, [r5, #0x14]
        ldr     r9, [r5, #0x18]
        ldr     r10, [r5, #0x1C]
        ldr     r11, [r5, #0x20]!
        str     r3, [r0, #-0xDC]
        str     r12, [r0, #-0xBC]
        str     r6, [r0, #-0x9C]
        str     r7, [r0, #-0x7C]
        str     r8, [r0, #-0x5C]
        str     r9, [r0, #-0x3C]
        str     r10, [r0, #-0x1C]
        str     r11, [r0, #4]!
        subs    r1, r1, #1
        bne     LDMN4
        ldr     r12, [sp, #0x7C]
        ldr     r3, [sp, #0x78]
        mov     r0, #0xFF, 30
        orr     r0, r0, #1, 22
        sub     r1, r0, #0x22, 28
        sub     r0, r0, #3, 24
        add     r6, r3, #5, 24
        add     r5, r12, #5, 24
        add     r1, r12, r1
        add     r0, r3, r0
        mov     r7, #8
        str     r2, [sp, #0x84]
        str     lr, [sp, #0x80]
        str     r12, [sp, #0x7C]
        str     r3, [sp, #0x78]
LDMN5:
        ldr     r2, [r0, #4]
        ldr     r3, [r0, #8]
        ldr     r12, [r0, #0xC]
        ldr     lr, [r0, #0x10]
        ldr     r8, [r0, #0x14]
        ldr     r9, [r0, #0x18]
        ldr     r10, [r0, #0x1C]
        ldr     r11, [r0, #0x20]!
        str     r2, [r1, #-0xDC]
        str     r3, [r1, #-0xBC]
        str     r12, [r1, #-0x9C]
        str     lr, [r1, #-0x7C]
        str     r8, [r1, #-0x5C]
        str     r9, [r1, #-0x3C]
        str     r10, [r1, #-0x1C]
        str     r11, [r1, #4]!
        subs    r7, r7, #1
        bne     LDMN5
        ldr     r3, [sp, #0x78]
        ldr     r2, [sp, #0x84]
        ldr     lr, [sp, #0x80]
        ldr     r12, [sp, #0x7C]
        mov     r0, #0xFF, 30
        orr     r0, r0, #1, 22
        sub     r1, r0, #0x12, 28
        add     r7, r3, #6, 24
        sub     r0, r0, #2, 24
        str     r7, [sp, #8]
        add     r7, r12, #6, 24
        add     r1, r12, r1
        add     r0, r3, r0
        mov     r8, #8
        str     r4, [sp, #0x88]
        str     r2, [sp, #0x84]
        str     lr, [sp, #0x80]
        str     r12, [sp, #0x7C]
        str     r3, [sp, #0x78]
LDMN6:
        ldr     r2, [r0, #4]
        ldr     r3, [r0, #8]
        ldr     r12, [r0, #0xC]
        ldr     lr, [r0, #0x10]
        ldr     r4, [r0, #0x14]
        ldr     r9, [r0, #0x18]
        ldr     r10, [r0, #0x1C]
        ldr     r11, [r0, #0x20]!
        str     r2, [r1, #-0xDC]
        str     r3, [r1, #-0xBC]
        str     r12, [r1, #-0x9C]
        str     lr, [r1, #-0x7C]
        str     r4, [r1, #-0x5C]
        str     r9, [r1, #-0x3C]
        str     r10, [r1, #-0x1C]
        str     r11, [r1, #4]!
        subs    r8, r8, #1
        bne     LDMN6
        ldr     r4, [sp, #0x88]
        ldr     r2, [sp, #0x84]
        ldr     lr, [sp, #0x80]
        ldr     r12, [sp, #0x7C]
        ldr     r3, [sp, #0x78]
        mov     r0, #0xFF, 30
        orr     r0, r0, #1, 22
        sub     r1, r0, #0x20
        sub     r0, r0, #1, 24
        add     r9, r3, #7, 24
        add     r8, r12, #7, 24
        add     r1, r12, r1
        add     r0, r3, r0
        mov     r10, #8
        str     r5, [sp, #0x90]
        str     r6, [sp, #0x8C]
        str     r4, [sp, #0x88]
        str     r2, [sp, #0x84]
        str     lr, [sp, #0x80]
        str     r12, [sp, #0x7C]
        str     r3, [sp, #0x78]
LDMN7:
        ldr     r2, [r0, #4]
        ldr     r3, [r0, #8]
        ldr     r12, [r0, #0xC]
        ldr     lr, [r0, #0x10]
        ldr     r4, [r0, #0x14]
        ldr     r5, [r0, #0x18]
        ldr     r6, [r0, #0x1C]
        ldr     r11, [r0, #0x20]!
        str     r2, [r1, #-0xDC]
        str     r3, [r1, #-0xBC]
        str     r12, [r1, #-0x9C]
        str     lr, [r1, #-0x7C]
        str     r4, [r1, #-0x5C]
        str     r5, [r1, #-0x3C]
        str     r6, [r1, #-0x1C]
        str     r11, [r1, #4]!
        subs    r10, r10, #1
        bne     LDMN7
        ldr     r12, [sp, #0x7C]
        ldr     r5, [sp, #0x90]
        ldr     r6, [sp, #0x8C]
        ldr     r4, [sp, #0x88]
        ldr     r2, [sp, #0x84]
        ldr     lr, [sp, #0x80]
        ldr     r3, [sp, #0x78]
        mov     r0, #0xFF, 30
        orr     r0, r0, #1, 22
        add     r10, r0, #0xE0
        add     r11, r12, #2, 22
        add     r10, r12, r10
        str     r10, [sp, #0x14]
        str     r11, [sp]
        ldr     r11, [sp, #0x14]
        add     r1, r3, #2, 22
        add     r0, r3, r0
        mov     r10, #8
        str     r7, [sp, #0x94]
        str     r5, [sp, #0x90]
        str     r6, [sp, #0x8C]
        str     r4, [sp, #0x88]
        str     r2, [sp, #0x84]
        str     lr, [sp, #0x80]
        str     r12, [sp, #0x7C]
        str     r3, [sp, #0x78]
LDMN8:
        ldr     r2, [r0, #4]
        ldr     r3, [r0, #8]
        ldr     r12, [r0, #0xC]
        ldr     lr, [r0, #0x10]
        ldr     r4, [r0, #0x14]
        ldr     r5, [r0, #0x18]
        ldr     r6, [r0, #0x1C]
        ldr     r7, [r0, #0x20]!
        str     r2, [r11, #-0xDC]
        str     r3, [r11, #-0xBC]
        str     r12, [r11, #-0x9C]
        str     lr, [r11, #-0x7C]
        str     r4, [r11, #-0x5C]
        str     r5, [r11, #-0x3C]
        str     r6, [r11, #-0x1C]
        str     r7, [r11, #4]!
        subs    r10, r10, #1
        bne     LDMN8
        ldr     r2, [sp, #0x84]
        ldr     r4, [sp, #0x88]
        ldr     r6, [sp, #0x8C]
        ldr     r5, [sp, #0x90]
        ldr     r7, [sp, #0x94]
        ldr     lr, [sp, #0x80]
        ldr     r12, [sp, #0x7C]
        ldr     r3, [sp, #0x78]
        mov     r10, #1
        str     r10, [sp, #0x14]
        add     r11, sp, #2, 22
        add     r11, r11, #0x92, 30
        str     r3, [r11, #4]
        add     r3, sp, #2, 22
        add     r3, r3, #0x92, 30
        str     r12, [r3, #0x14]
        ldr     r12, [sp, #0x18]
        add     r3, sp, #2, 22
        add     r3, r3, #0x92, 30
        str     r12, [r3, #8]
        ldr     r12, [sp, #0x1C]
        add     r3, sp, #2, 22
        add     r3, r3, #0x92, 30
        str     r12, [r3, #0x28]
        ldr     r12, [sp, #0x20]
        add     r3, sp, #2, 22
        add     r3, r3, #0x92, 30
        str     r12, [r3, #0xC]
        ldr     r12, [sp, #0x24]
        add     r3, sp, #2, 22
        add     r3, r3, #0x92, 30
        str     r12, [r3, #0x3C]
        add     r3, sp, #2, 22
        add     r3, r3, #0x92, 30
        str     lr, [r3, #0x10]
        add     r3, sp, #2, 22
        add     r3, r3, #0x92, 30
        str     r2, [r3, #0x50]
        ldr     r3, [sp, #4]
        add     r2, sp, #2, 22
        add     r2, r2, #0x92, 30
        str     r3, [r2, #0x1C]
        add     r2, sp, #2, 22
        add     r2, r2, #0x92, 30
        str     r4, [r2, #0x2C]
        add     r2, sp, #2, 22
        add     r2, r2, #0x92, 30
        str     r6, [r2, #0x20]
        add     r2, sp, #2, 22
        add     r2, r2, #0x92, 30
        str     r5, [r2, #0x40]
        ldr     r3, [sp, #8]
        add     r2, sp, #2, 22
        add     r2, r2, #0x92, 30
        str     r3, [r2, #0x24]
        add     r2, sp, #2, 22
        add     r2, r2, #0x92, 30
        str     r7, [r2, #0x54]
        add     r2, sp, #2, 22
        add     r2, r2, #0x92, 30
        str     r9, [r2, #0x34]
        add     r2, sp, #2, 22
        add     r2, r2, #0x92, 30
        str     r8, [r2, #0x44]
        add     r2, sp, #2, 22
        add     r2, r2, #0x92, 30
        str     r1, [r2, #0x38]
        ldr     r2, [sp]
        add     r1, sp, #2, 22
        add     r1, r1, #0x92, 30
        str     r2, [r1, #0x58]
        ldr     r1, [sp, #0x28]
        mov     r2, #0
        mov     r0, #3
        strh    r2, [r1]
        mov     r2, #2
        strh    r10, [r1, #2]
        strh    r2, [r1, #4]
        strh    r0, [r1, #6]
        ldr     r7, [sp, #0xC]
        ldr     r8, [sp, #0x10]
        mvn     r1, #0
        str     r1, [sp, #0x44]
LDMN9:
        mov     r6, r0
        mov     r5, #0
        mov     r4, #1
        mov     lr, #2
        mov     r2, #4
        str     r0, [sp, #0x48]
LDMN10:
        mov     r0, lr, lsl #16
        mov     r1, r5, lsl #16
        mov     r9, r0, asr #16
        mov     r3, r4, lsl #16
        add     r11, r9, r9, lsl #2
        str     r11, [sp, #0x94]
        add     r11, sp, #2, 22
        mov     r1, r1, asr #16
        add     r11, r11, #0x92, 30
        add     r0, r1, r1, lsl #2
        mov     r10, r3, asr #16
        add     r0, r11, r0, lsl #2
        add     r11, r8, r1, lsl #1
        str     r11, [sp, #0x20]
        add     r11, sp, #2, 22
        add     r12, r10, r10, lsl #2
        add     r11, r11, #0x92, 30
        add     r12, r11, r12, lsl #2
        str     r12, [sp, #4]
        add     r12, r7, r10, lsl #5
        str     r12, [sp, #8]
        add     r12, r8, r10, lsl #1
        str     r12, [sp]
        ldr     r12, [sp, #0x94]
        add     r11, sp, #2, 22
        add     r11, r11, #0x92, 30
        add     r12, r11, r12, lsl #2
        mov     r3, r6, lsl #16
        str     r12, [sp, #0x30]
        add     r12, r7, r9, lsl #5
        str     r0, [sp, #0x24]
        mov     r3, r3, asr #16
        str     r12, [sp, #0x34]
        add     r12, r8, r9, lsl #1
        add     r0, r7, r1, lsl #5
        str     r0, [sp, #0x1C]
        ldr     r0, [sp, #0x2C]
        str     r12, [sp, #0x38]
        add     r12, r7, r3, lsl #5
        str     r3, [sp, #0x18]
        str     lr, [sp, #0x70]
        str     r4, [sp, #0x6C]
        str     r5, [sp, #0x68]
        ldr     lr, [sp, #0x1C]
        ldr     r4, [sp, #0x20]
        ldr     r5, [sp, #0x24]
        add     r3, r8, r3, lsl #1
        str     r12, [sp, #0x3C]
        str     r3, [sp, #0x40]
        add     r0, r0, r1, lsl #1
        mov     r12, #0
        mov     r3, #8
        str     r9, [sp, #0x80]
        str     r10, [sp, #0x7C]
        str     r2, [sp, #0x74]
        str     r6, [sp, #0x64]
LDMN11:
        ldrsh   r2, [r0], #0xA
        cmp     r2, #0
        blt     LDMN20
        ldr     r2, [sp, #0x7C]
        ldr     r11, [lr]
        ldrsh   r6, [r4]
        ldr     r2, [r5, +r2, lsl #2]
        mvn     r10, #0
        mov     r9, r10
        mov     r7, #0
        add     r8, r2, r12
        ldr     r2, [sp]
        str     r7, [sp, #0x78]
        mov     r7, #1
        str     r4, [sp, #0x20]
        str     r2, [sp, #0x84]
        ldr     r2, [sp, #8]
        str     r0, [sp, #0x58]
        str     r1, [sp, #0x4C]
        ldr     r0, [sp, #0x84]
        ldr     r1, [sp, #0x78]
        str     r3, [sp, #0x54]
        str     r12, [sp, #0x50]
LDMN12:
        ldrsh   r4, [r0], #0xA
        ldr     r12, [r2], #4
        ldr     r3, [r8], #4
        add     r4, r6, r4
        mov     r4, r4, lsl #16
        add     r12, r11, r12
        mov     r4, r4, asr #16
        mul     r4, r4, r4
        add     r3, r12, r3, lsl #1
        add     r3, r3, #2
        mov     r4, r4, asr #15
        mov     r3, r3, asr #2
        mov     r12, r4, lsl #16
        mov     r3, r3, lsl #16
        mov     r12, r12, asr #16
        mul     r4, r7, r12
        mov     r3, r3, asr #16
        mul     r5, r9, r3
        sub     r4, r4, r5
        cmp     r4, #0
        ble     LDMN13
        mov     r9, r12
        mov     r10, r1
        mov     r7, r3
LDMN13:
        add     r1, r1, #1
        cmp     r1, #8
        blt     LDMN12
        ldr     r4, [sp, #0x20]
        ldr     r0, [sp, #0x58]
        ldr     r3, [sp, #0x54]
        ldr     r12, [sp, #0x50]
        ldr     r5, [sp, #0x24]
        ldr     r1, [sp, #0x4C]
        mov     r10, r10, lsl #16
        mov     r2, r10, asr #16
        cmp     r2, #0
        movlt   r2, #0
        movlt   r6, r2
        blt     LDMN14
        ldr     r9, [sp]
        add     r8, r2, r2, lsl #3
        add     r8, r2, r8
        ldrsh   r8, [r9, +r8]
        add     r8, r6, r8
        mov     r6, r8, lsl #16
        mov     r6, r6, asr #16
LDMN14:
        ldr     r9, [sp, #0x80]
        ldr     r8, [sp, #4]
        mov     r7, r7, lsl #2
        ldr     r10, [r5, +r9, lsl #2]
        ldr     r9, [r8, +r9, lsl #2]
        str     r7, [sp, #0x78]
        mvn     r8, #0
        add     r10, r12, r10
        add     r9, r9, r2, lsl #5
        str     r9, [sp, #0x88]
        ldr     r9, [sp, #0x38]
        str     r10, [sp, #0x60]
        mov     r11, r8
        str     r9, [sp, #0x84]
        ldr     r9, [sp, #0x34]
        str     r2, [sp, #0x5C]
        str     r0, [sp, #0x58]
        str     r3, [sp, #0x54]
        str     r1, [sp, #0x4C]
        ldr     r0, [sp, #0x84]
        ldr     r1, [sp, #0x88]
        ldr     r2, [sp, #0x60]
        ldr     r3, [sp, #0x78]
        mov     r10, #0
        mov     r7, #1
        str     lr, [sp, #0x1C]
        str     r4, [sp, #0x20]
        str     r12, [sp, #0x50]
LDMN15:
        ldrsh   r12, [r0], #0xA
        ldr     lr, [r2], #4
        ldr     r5, [r1], #4
        add     r12, r6, r12
        ldr     r4, [r9], #4
        add     lr, r5, lr
        mov     r12, r12, lsl #16
        add     r4, r3, r4
        mov     r12, r12, asr #16
        mul     r12, r12, r12
        add     lr, r4, lr, lsl #1
        add     r4, lr, #8
        mov     lr, r12, asr #15
        mov     r12, r4, asr #4
        mov     lr, lr, lsl #16
        mov     r12, r12, lsl #16
        mov     lr, lr, asr #16
        mul     r4, r7, lr
        mov     r12, r12, asr #16
        mul     r5, r11, r12
        sub     r4, r4, r5
        cmp     r4, #0
        ble     LDMN16
        mov     r11, lr
        mov     r8, r10
        mov     r7, r12
LDMN16:
        add     r10, r10, #1
        cmp     r10, #8
        blt     LDMN15
        ldr     r2, [sp, #0x5C]
        ldr     lr, [sp, #0x1C]
        ldr     r4, [sp, #0x20]
        ldr     r0, [sp, #0x58]
        ldr     r3, [sp, #0x54]
        ldr     r12, [sp, #0x50]
        ldr     r5, [sp, #0x24]
        ldr     r1, [sp, #0x4C]
        mov     r8, r8, lsl #16
        mov     r8, r8, asr #16
        cmp     r8, #0
        movlt   r8, #0
        strlt   r8, [sp, #0x94]
        blt     LDMN17
        ldr     r10, [sp, #0x38]
        add     r9, r8, r8, lsl #3
        add     r9, r8, r9
        ldrsh   r9, [r10, +r9]
        add     r9, r6, r9
        mov     r6, r9, lsl #16
        mov     r6, r6, asr #16
        str     r6, [sp, #0x94]
LDMN17:
        ldr     r6, [sp, #0x18]
        ldr     r9, [sp, #4]
        ldr     r11, [sp, #0x30]
        ldr     r10, [r5, +r6, lsl #2]
        mov     r7, r7, lsl #4
        ldr     r9, [r9, +r6, lsl #2]
        ldr     r11, [r11, +r6, lsl #2]
        str     r7, [sp, #0x78]
        mov     r7, #0
        add     r9, r9, r2, lsl #5
        str     r9, [sp, #0x8C]
        str     r7, [sp, #0x90]
        add     r11, r11, r8, lsl #5
        str     r11, [sp, #0x84]
        ldr     r7, [sp, #0x40]
        ldr     r9, [sp, #0x3C]
        mvn     r6, #0
        str     r2, [sp, #0x5C]
        str     r0, [sp, #0x58]
        str     r3, [sp, #0x54]
        str     r1, [sp, #0x4C]
        ldr     r1, [sp, #0x84]
        ldr     r2, [sp, #0x8C]
        ldr     r0, [sp, #0x90]
        ldr     r3, [sp, #0x94]
        add     r11, r12, r10
        mov     r10, #1
        str     r6, [sp, #0x88]
        str     r8, [sp, #0x60]
        str     lr, [sp, #0x1C]
        str     r4, [sp, #0x20]
        str     r12, [sp, #0x50]
LDMN18:
        ldrsh   r12, [r7], #0xA
        ldr     lr, [r2], #4
        ldr     r8, [r1], #4
        ldr     r4, [r11], #4
        ldr     r5, [r9], #4
        add     r12, r3, r12
        add     lr, r8, lr
        add     r4, lr, r4
        ldr     lr, [sp, #0x78]
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        mul     r12, r12, r12
        add     r5, lr, r5
        add     r4, r5, r4, lsl #1
        add     lr, r4, #8
        mov     r12, r12, asr #15
        mov     lr, lr, asr #4
        mov     r12, r12, lsl #16
        mov     lr, lr, lsl #16
        mov     r12, r12, asr #16
        mul     r4, r10, r12
        mov     lr, lr, asr #16
        mul     r5, r6, lr
        sub     r4, r4, r5
        cmp     r4, #0
        ble     LDMN19
        mov     r6, r12
        mov     r10, lr
        str     r0, [sp, #0x88]
LDMN19:
        add     r0, r0, #1
        cmp     r0, #8
        blt     LDMN18
        ldr     r7, [sp, #0x44]
        ldr     r8, [sp, #0x60]
        ldr     r2, [sp, #0x5C]
        ldr     lr, [sp, #0x1C]
        ldr     r4, [sp, #0x20]
        ldr     r0, [sp, #0x58]
        ldr     r3, [sp, #0x54]
        ldr     r12, [sp, #0x50]
        ldr     r5, [sp, #0x24]
        ldr     r1, [sp, #0x4C]
        rsb     r7, r7, #0
        mul     r7, r7, r10
        ldr     r9, [sp, #0x14]
        mla     r7, r9, r6, r7
        cmp     r7, #0
        ble     LDMN20
        ldr     r9, [sp, #0x7C]
        add     r2, r2, r2, lsl #2
        ldr     r7, [sp, #0x88]
        add     r2, r9, r2
        ldr     r9, [sp, #0x80]
        add     r8, r8, r8, lsl #2
        str     r6, [sp, #0x44]
        ldr     r6, [sp, #0x28]
        add     r8, r9, r8
        ldr     r9, [sp, #0x18]
        add     r7, r7, r7, lsl #2
        str     r10, [sp, #0x14]
        add     r7, r9, r7
        strh    r1, [r6]
        strh    r2, [r6, #2]
        strh    r8, [r6, #4]
        strh    r7, [r6, #6]
LDMN20:
        subs    r3, r3, #1
        add     r12, r12, #0x20
        add     lr, lr, #4
        add     r1, r1, #5
        add     r4, r4, #0xA
        bne     LDMN11
        ldr     r6, [sp, #0x64]
        ldr     lr, [sp, #0x70]
        ldr     r4, [sp, #0x6C]
        ldr     r2, [sp, #0x74]
        ldr     r5, [sp, #0x68]
        ldr     r7, [sp, #0xC]
        ldr     r8, [sp, #0x10]
        mov     r0, r6
        mov     r6, lr
        mov     lr, r4
        mov     r4, r5
        subs    r2, r2, #1
        mov     r5, r0
        bne     LDMN10
        ldr     r0, [sp, #0x48]
        add     r0, r0, #1
        cmp     r0, #5
        blt     LDMN9
        add     sp, sp, #0xAB, 30
        add     sp, sp, #2, 22
        ldmia   sp!, {r4 - r11, pc}


