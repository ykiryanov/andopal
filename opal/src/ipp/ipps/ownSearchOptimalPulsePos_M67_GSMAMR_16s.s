        .text
        .align  4
        .globl  ownSearchOptimalPulsePos_M67_GSMAMR_16s


ownSearchOptimalPulsePos_M67_GSMAMR_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xF4
        sub     sp, sp, #2, 22
        add     r4, sp, #0x80
        ldr     lr, [sp, #0x918]
        and     r4, r4, #0xF
        rsb     r4, r4, #0
        add     r12, sp, #0x80
        and     r4, r4, #0xF
        add     r12, r12, r4
        str     lr, [sp, #0x78]
        mov     r4, #0
        strh    r4, [lr]
        mov     r4, #1
        strh    r4, [lr, #2]
        mov     r4, #2
        strh    r4, [lr, #4]
        mov     lr, #8
        str     r0, [sp, #0x4C]
        str     r1, [sp, #0x7C]
        add     r4, r12, #0xDC
        sub     r1, r3, #4
        mov     r0, lr
LDMO0:
        ldr     r6, [r1, #4]
        ldr     r5, [r1, #8]
        ldr     r7, [r1, #0x10]
        str     r6, [r4, #-0xDC]
        ldr     r6, [r1, #0xC]
        str     r5, [r4, #-0xBC]
        ldr     r5, [r1, #0x14]
        subs    r0, r0, #1
        str     r6, [r4, #-0x9C]
        ldr     r6, [r1, #0x18]
        str     r5, [r4, #-0x5C]
        ldr     r5, [r1, #0x1C]
        str     r6, [r4, #-0x3C]
        ldr     r6, [r1, #0x20]!
        str     r7, [r4, #-0x7C]
        str     r5, [r4, #-0x1C]
        str     r6, [r4, #4]!
        bne     LDMO0
        add     r0, r3, #1, 24
        str     r0, [sp, #0xC]
        add     r0, r12, #1, 24
        str     r0, [sp, #0x10]
        add     r1, r12, #0x77, 30
        add     r0, r3, #0xFC
LDMO1:
        ldr     r4, [r0, #4]
        ldr     r5, [r0, #8]
        subs    lr, lr, #1
        str     r4, [r1, #-0xDC]
        ldr     r4, [r0, #0xC]
        str     r5, [r1, #-0xBC]
        ldr     r5, [r0, #0x10]
        str     r4, [r1, #-0x9C]
        ldr     r4, [r0, #0x14]
        str     r5, [r1, #-0x7C]
        ldr     r5, [r0, #0x18]
        str     r4, [r1, #-0x5C]
        ldr     r4, [r0, #0x1C]
        str     r5, [r1, #-0x3C]
        ldr     r5, [r0, #0x20]!
        str     r4, [r1, #-0x1C]
        str     r5, [r1, #4]!
        bne     LDMO1
        add     r0, r12, #2, 24
        str     r0, [sp, #0x64]
        add     r1, r3, #2, 24
        add     r4, r12, #0xB7, 30
        add     lr, r3, #0x7F, 30
        mov     r0, #8
LDMO2:
        ldr     r5, [lr, #4]
        subs    r0, r0, #1
        str     r5, [r4, #-0xDC]
        ldr     r5, [lr, #8]
        str     r5, [r4, #-0xBC]
        ldr     r5, [lr, #0xC]
        str     r5, [r4, #-0x9C]
        ldr     r5, [lr, #0x10]
        str     r5, [r4, #-0x7C]
        ldr     r5, [lr, #0x14]
        str     r5, [r4, #-0x5C]
        ldr     r5, [lr, #0x18]
        str     r5, [r4, #-0x3C]
        ldr     r5, [lr, #0x1C]
        str     r5, [r4, #-0x1C]
        ldr     r5, [lr, #0x20]!
        str     r5, [r4, #4]!
        bne     LDMO2
        add     r0, r12, #3, 24
        str     r0, [sp, #0x68]
        add     lr, r3, #3, 24
        add     r5, r12, #0xF7, 30
        add     r4, r3, #0xBF, 30
        mov     r0, #8
        str     r3, [sp, #4]
        str     r2, [sp]
LDMO3:
        ldr     r11, [r4, #4]
        ldr     r10, [r4, #8]
        ldr     r9, [r4, #0xC]
        ldr     r8, [r4, #0x10]
        ldr     r7, [r4, #0x14]
        ldr     r6, [r4, #0x18]
        ldr     r3, [r4, #0x1C]
        ldr     r2, [r4, #0x20]!
        str     r11, [r5, #-0xDC]
        str     r10, [r5, #-0xBC]
        str     r9, [r5, #-0x9C]
        str     r8, [r5, #-0x7C]
        str     r7, [r5, #-0x5C]
        str     r6, [r5, #-0x3C]
        str     r3, [r5, #-0x1C]
        str     r2, [r5, #4]!
        subs    r0, r0, #1
        bne     LDMO3
        ldr     r3, [sp, #4]
        ldr     r2, [sp]
        mov     r0, #0xBF, 30
        orr     r0, r0, #1, 22
        add     r5, r12, #1, 22
        sub     r0, r0, #0x22, 28
        str     r5, [sp, #0x6C]
        add     r0, r12, r0
        add     r4, r3, #1, 22
        add     r6, r3, #0xFF, 30
        mov     r5, #8
        str     r12, [sp, #8]
        str     r3, [sp, #4]
        str     r2, [sp]
LDMO4:
        ldr     r2, [r6, #4]
        ldr     r3, [r6, #8]
        ldr     r12, [r6, #0xC]
        ldr     r7, [r6, #0x10]
        ldr     r8, [r6, #0x14]
        ldr     r9, [r6, #0x18]
        ldr     r10, [r6, #0x1C]
        ldr     r11, [r6, #0x20]!
        str     r2, [r0, #-0xDC]
        str     r3, [r0, #-0xBC]
        str     r12, [r0, #-0x9C]
        str     r7, [r0, #-0x7C]
        str     r8, [r0, #-0x5C]
        str     r9, [r0, #-0x3C]
        str     r10, [r0, #-0x1C]
        str     r11, [r0, #4]!
        subs    r5, r5, #1
        bne     LDMO4
        ldr     r12, [sp, #8]
        ldr     r3, [sp, #4]
        ldr     r2, [sp]
        mov     r0, #0xBF, 30
        orr     r0, r0, #1, 22
        sub     r6, r0, #0x12, 28
        add     r7, r12, #5, 24
        sub     r0, r0, #2, 24
        str     r7, [sp, #0x70]
        add     r5, r3, #5, 24
        add     r6, r12, r6
        add     r0, r3, r0
        mov     r7, #8
        str     r1, [sp, #0x14]
        str     r12, [sp, #8]
        str     r3, [sp, #4]
        str     r2, [sp]
LDMO5:
        ldr     r11, [r0, #4]
        ldr     r10, [r0, #8]
        ldr     r9, [r0, #0xC]
        ldr     r8, [r0, #0x10]
        ldr     r12, [r0, #0x14]
        ldr     r3, [r0, #0x18]
        ldr     r2, [r0, #0x1C]
        ldr     r1, [r0, #0x20]!
        str     r11, [r6, #-0xDC]
        str     r10, [r6, #-0xBC]
        str     r9, [r6, #-0x9C]
        str     r8, [r6, #-0x7C]
        str     r12, [r6, #-0x5C]
        str     r3, [r6, #-0x3C]
        str     r2, [r6, #-0x1C]
        str     r1, [r6, #4]!
        subs    r7, r7, #1
        bne     LDMO5
        ldr     r1, [sp, #0x14]
        ldr     r12, [sp, #8]
        ldr     r3, [sp, #4]
        ldr     r2, [sp]
        mov     r0, #0xBF, 30
        orr     r0, r0, #1, 22
        sub     r8, r0, #0x20
        sub     r0, r0, #1, 24
        add     r7, r3, #6, 24
        add     r6, r12, #6, 24
        add     r8, r12, r8
        add     r0, r3, r0
        mov     r9, #8
        str     r4, [sp, #0x1C]
        str     lr, [sp, #0x18]
        str     r1, [sp, #0x14]
        str     r12, [sp, #8]
        str     r3, [sp, #4]
        str     r2, [sp]
LDMO6:
        ldr     r11, [r0, #4]
        ldr     r10, [r0, #8]
        ldr     r4, [r0, #0xC]
        ldr     lr, [r0, #0x10]
        ldr     r12, [r0, #0x14]
        ldr     r3, [r0, #0x18]
        ldr     r2, [r0, #0x1C]
        ldr     r1, [r0, #0x20]!
        str     r11, [r8, #-0xDC]
        str     r10, [r8, #-0xBC]
        str     r4, [r8, #-0x9C]
        str     lr, [r8, #-0x7C]
        str     r12, [r8, #-0x5C]
        str     r3, [r8, #-0x3C]
        str     r2, [r8, #-0x1C]
        str     r1, [r8, #4]!
        subs    r9, r9, #1
        bne     LDMO6
        ldr     r12, [sp, #8]
        ldr     r4, [sp, #0x1C]
        ldr     lr, [sp, #0x18]
        ldr     r1, [sp, #0x14]
        ldr     r3, [sp, #4]
        ldr     r2, [sp]
        mov     r0, #0xBF, 30
        orr     r0, r0, #1, 22
        add     r10, r0, #0xE0
        add     r10, r12, r10
        str     r10, [sp, #0x74]
        str     r1, [sp, #0x14]
        ldr     r1, [sp, #0x74]
        add     r9, r3, #7, 24
        add     r8, r12, #7, 24
        add     r0, r3, r0
        mov     r10, #8
        str     r7, [sp, #0x24]
        str     r5, [sp, #0x20]
        str     r4, [sp, #0x1C]
        str     lr, [sp, #0x18]
        str     r12, [sp, #8]
        str     r3, [sp, #4]
        str     r2, [sp]
LDMO7:
        ldr     r11, [r0, #4]
        ldr     r7, [r0, #8]
        ldr     r5, [r0, #0xC]
        ldr     r4, [r0, #0x10]
        ldr     lr, [r0, #0x14]
        ldr     r12, [r0, #0x18]
        ldr     r3, [r0, #0x1C]
        ldr     r2, [r0, #0x20]!
        str     r11, [r1, #-0xDC]
        str     r7, [r1, #-0xBC]
        str     r5, [r1, #-0x9C]
        str     r4, [r1, #-0x7C]
        str     lr, [r1, #-0x5C]
        str     r12, [r1, #-0x3C]
        str     r3, [r1, #-0x1C]
        str     r2, [r1, #4]!
        subs    r10, r10, #1
        bne     LDMO7
        ldr     r3, [sp, #4]
        ldr     r12, [sp, #8]
        ldr     r1, [sp, #0x14]
        ldr     lr, [sp, #0x18]
        ldr     r4, [sp, #0x1C]
        ldr     r5, [sp, #0x20]
        ldr     r7, [sp, #0x24]
        ldr     r2, [sp]
        add     r11, sp, #0x89, 28
        str     r3, [r11, #4]
        add     r3, sp, #0x89, 28
        str     r12, [r3, #0x14]
        ldr     r3, [sp, #0xC]
        add     r12, sp, #0x89, 28
        mov     r0, #1
        str     r3, [r12, #8]
        ldr     r3, [sp, #0x10]
        add     r12, sp, #0x89, 28
        mov     r10, r0
        str     r3, [r12, #0x28]
        add     r3, sp, #0x89, 28
        str     r1, [r3, #0xC]
        ldr     r1, [sp, #0x64]
        add     r3, sp, #0x89, 28
        str     r1, [r3, #0x3C]
        add     r1, sp, #0x89, 28
        str     lr, [r1, #0x10]
        ldr     r1, [sp, #0x68]
        add     r3, sp, #0x89, 28
        str     r1, [r3, #0x50]
        add     r1, sp, #0x89, 28
        str     r4, [r1, #0x1C]
        ldr     r1, [sp, #0x6C]
        add     r3, sp, #0x89, 28
        str     r1, [r3, #0x2C]
        add     r1, sp, #0x89, 28
        str     r5, [r1, #0x24]
        ldr     r1, [sp, #0x70]
        add     r3, sp, #0x89, 28
        str     r1, [r3, #0x54]
        add     r1, sp, #0x89, 28
        str     r7, [r1, #0x34]
        add     r1, sp, #0x89, 28
        str     r6, [r1, #0x44]
        add     r1, sp, #0x89, 28
        str     r9, [r1, #0x4C]
        add     r1, sp, #0x89, 28
        str     r8, [r1, #0x5C]
        ldr     r8, [sp, #0x4C]
        mvn     r3, #0
        mov     r1, r10
        str     r10, [sp, #0x28]
        str     r3, [sp, #4]
LDMO8:
        mov     r3, #2
        mov     r5, r3
        str     r0, [sp, #0x2C]
LDMO9:
        mov     r11, r1
        mov     r10, #0
        mov     r9, #3
        str     r3, [sp, #0xC]
        str     r1, [sp, #8]
LDMO10:
        mov     r3, r11, lsl #16
        add     r0, sp, #0x89, 28
        mov     r6, r3, asr #16
        add     lr, sp, #0x89, 28
        add     r4, r6, r6, lsl #2
        mov     r1, r10, lsl #16
        add     r4, lr, r4, lsl #2
        add     lr, r2, r6, lsl #5
        str     lr, [sp, #0x1C]
        mov     r1, r1, asr #16
        add     lr, r8, r6, lsl #1
        mov     r12, r5, lsl #16
        add     r3, r1, r1, lsl #2
        mov     r7, r12, asr #16
        str     lr, [sp, #0x18]
        add     lr, r2, r7, lsl #5
        add     r3, r0, r3, lsl #2
        ldr     r0, [sp, #0x7C]
        str     lr, [sp, #0x14]
        add     lr, r8, r7, lsl #1
        str     r3, [sp, #0x20]
        str     r4, [sp, #0x24]
        str     lr, [sp, #0x10]
        add     r3, r2, r1, lsl #5
        add     r0, r0, r1, lsl #1
        add     r12, r8, r1, lsl #1
        mov     r4, #0
        mov     lr, #8
        str     r7, [sp, #0x68]
        str     r6, [sp, #0x64]
        str     r5, [sp, #0x5C]
        str     r9, [sp, #0x58]
        str     r10, [sp, #0x54]
        str     r11, [sp, #0x50]
        str     r2, [sp]
LDMO11:
        ldrsh   r2, [r0], #0xA
        cmp     r2, #0
        blt     LDMO17
        ldr     r2, [sp, #0x20]
        ldr     r5, [sp, #0x64]
        ldr     r10, [r3]
        ldrsh   r6, [r12]
        ldr     r7, [sp, #0x1C]
        ldr     r2, [r2, +r5, lsl #2]
        mvn     r8, #0
        mov     r5, #0
        add     r9, r2, r4
        ldr     r2, [sp, #0x18]
        str     r5, [sp, #0x44]
        str     r8, [sp, #0x60]
        str     r0, [sp, #0x3C]
        str     r1, [sp, #0x30]
        ldr     r0, [sp, #0x44]
        ldr     r1, [sp, #0x60]
        mov     r5, #1
        str     r12, [sp, #0x40]
        str     lr, [sp, #0x38]
        str     r4, [sp, #0x34]
LDMO12:
        ldrsh   r4, [r2], #0xA
        ldr     lr, [r7], #4
        ldr     r12, [r9], #4
        add     r4, r6, r4
        mov     r4, r4, lsl #16
        add     lr, r10, lr
        mov     r4, r4, asr #16
        mul     r4, r4, r4
        add     r12, lr, r12, lsl #1
        add     r12, r12, #2
        mov     r4, r4, asr #15
        mov     r12, r12, asr #2
        mov     lr, r4, lsl #16
        mov     r12, r12, lsl #16
        mov     lr, lr, asr #16
        mul     r4, r5, lr
        mov     r12, r12, asr #16
        mul     r11, r1, r12
        sub     r4, r4, r11
        cmp     r4, #0
        ble     LDMO13
        mov     r1, lr
        mov     r8, r0
        mov     r5, r12
LDMO13:
        add     r0, r0, #1
        cmp     r0, #8
        blt     LDMO12
        ldr     r12, [sp, #0x40]
        ldr     r0, [sp, #0x3C]
        ldr     lr, [sp, #0x38]
        ldr     r4, [sp, #0x34]
        ldr     r1, [sp, #0x30]
        mov     r8, r8, lsl #16
        mov     r2, r8, asr #16
        cmp     r2, #0
        movlt   r2, #0
        movlt   r7, r2
        blt     LDMO14
        ldr     r8, [sp, #0x18]
        add     r7, r2, r2, lsl #3
        add     r7, r2, r7
        ldrsh   r7, [r8, +r7]
        add     r7, r6, r7
        mov     r6, r7, lsl #16
        mov     r7, r6, asr #16
LDMO14:
        ldr     r6, [sp, #0x68]
        ldr     r8, [sp, #0x20]
        ldr     r9, [sp, #0x24]
        mov     r11, #0
        ldr     r10, [r9, +r6, lsl #2]
        ldr     r8, [r8, +r6, lsl #2]
        str     r11, [sp, #0x74]
        ldr     r11, [sp, #0x10]
        mvn     r6, #0
        mov     r9, r5, lsl #2
        add     r8, r4, r8
        str     r11, [sp, #0x6C]
        ldr     r11, [sp, #0x14]
        add     r10, r10, r2, lsl #5
        str     r10, [sp, #0x70]
        str     r11, [sp, #0x60]
        str     r2, [sp, #0x44]
        str     r3, [sp, #0x48]
        str     r0, [sp, #0x3C]
        str     r1, [sp, #0x30]
        ldr     r0, [sp, #0x6C]
        ldr     r1, [sp, #0x70]
        ldr     r2, [sp, #0x60]
        ldr     r3, [sp, #0x74]
        mov     r5, #1
        mov     r10, r6
        str     r12, [sp, #0x40]
        str     lr, [sp, #0x38]
        str     r4, [sp, #0x34]
LDMO15:
        ldrsh   r12, [r0], #0xA
        ldr     lr, [r8], #4
        ldr     r11, [r1], #4
        add     r12, r7, r12
        ldr     r4, [r2], #4
        add     lr, r11, lr
        mov     r12, r12, lsl #16
        add     r4, r9, r4
        mov     r12, r12, asr #16
        mul     r12, r12, r12
        add     lr, r4, lr, lsl #1
        add     r4, lr, #8
        mov     lr, r12, asr #15
        mov     r12, r4, asr #4
        mov     lr, lr, lsl #16
        mov     r12, r12, lsl #16
        mov     lr, lr, asr #16
        mul     r4, r5, lr
        mov     r12, r12, asr #16
        mul     r11, r6, r12
        sub     r4, r4, r11
        cmp     r4, #0
        ble     LDMO16
        mov     r6, lr
        mov     r5, r12
        mov     r10, r3
LDMO16:
        add     r3, r3, #1
        cmp     r3, #8
        blt     LDMO15
        ldr     r2, [sp, #0x44]
        ldr     r3, [sp, #0x48]
        ldr     r12, [sp, #0x40]
        ldr     r0, [sp, #0x3C]
        ldr     lr, [sp, #0x38]
        ldr     r4, [sp, #0x34]
        ldr     r1, [sp, #0x30]
        mov     r10, r10, lsl #16
        mov     r7, r10, asr #16
        cmp     r7, #0
        movlt   r7, #0
        ldr     r8, [sp, #4]
        ldr     r9, [sp, #0x28]
        rsb     r8, r8, #0
        mul     r8, r8, r5
        mla     r8, r9, r6, r8
        cmp     r8, #0
        ble     LDMO17
        ldr     r8, [sp, #0x64]
        add     r2, r2, r2, lsl #2
        str     r5, [sp, #0x28]
        add     r2, r8, r2
        ldr     r8, [sp, #0x68]
        ldr     r5, [sp, #0x78]
        add     r7, r7, r7, lsl #2
        str     r6, [sp, #4]
        add     r7, r8, r7
        strh    r1, [r5]
        strh    r2, [r5, #2]
        strh    r7, [r5, #4]
LDMO17:
        subs    lr, lr, #1
        add     r4, r4, #0x20
        add     r3, r3, #4
        add     r1, r1, #5
        add     r12, r12, #0xA
        bne     LDMO11
        ldr     r5, [sp, #0x5C]
        ldr     r11, [sp, #0x50]
        ldr     r9, [sp, #0x58]
        ldr     r10, [sp, #0x54]
        ldr     r2, [sp]
        ldr     r8, [sp, #0x4C]
        mov     r0, r5
        mov     r5, r11
        mov     r11, r10
        subs    r9, r9, #1
        mov     r10, r0
        bne     LDMO10
        ldr     r3, [sp, #0xC]
        ldr     r1, [sp, #8]
        add     r3, r3, #2
        mov     r3, r3, lsl #16
        mov     r5, r3, asr #16
        mov     r3, r5
        cmp     r3, #5
        blt     LDMO9
        ldr     r0, [sp, #0x2C]
        add     r0, r0, #2
        mov     r0, r0, lsl #16
        mov     r1, r0, asr #16
        mov     r0, r1
        cmp     r0, #4
        blt     LDMO8
        add     sp, sp, #0xF4
        add     sp, sp, #2, 22
        ldmia   sp!, {r4 - r11, pc}


