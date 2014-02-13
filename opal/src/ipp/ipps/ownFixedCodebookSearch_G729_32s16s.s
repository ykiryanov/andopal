        .text
        .align  4
        .globl  ownFixedCodebookSearch_G729_32s16s


ownFixedCodebookSearch_G729_32s16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x8A, 30
        add     r4, sp, #0xE4
        and     r4, r4, #0x1F
        rsb     r4, r4, #0
        cmp     r3, #0
        and     r3, r4, #0x1F
        add     r4, sp, #0xE4
        add     lr, sp, #0x69, 30
        add     r4, r4, r3
        mvn     r3, #0xFF
        and     lr, lr, #0x1F
        bic     r3, r3, #0x1F, 24
        add     r9, sp, #2, 24
        strh    r3, [r9, #0x14]
        rsb     lr, lr, #0
        add     r12, sp, #0x85, 30
        and     lr, lr, #0x1F
        mov     r3, #0
        add     r6, sp, #0x69, 30
        mvn     r9, #0
        strh    r3, [r12, #2]
        mov     r8, r0
        ldr     r0, [sp, #0x24C]
        add     lr, r6, lr
        ldr     r6, [sp, #0x250]
        mov     r12, r9, lsl #13
        add     r7, sp, #0x85, 30
        mvn     r12, r12
        mov     r5, r2
        strh    r12, [r7, #4]
        ldrnesh r7, [r0]
        moveq   r7, #0x1E
        add     r7, r7, #0x4B
        strh    r7, [r0]
        add     r2, lr, #0x20
        str     r2, [sp, #0xC4]
        add     r2, r8, #6
        str     r2, [sp, #0xBC]
        add     r2, r4, #0x60
        add     r7, r8, #2
        str     r2, [sp, #0xA4]
        add     r2, lr, #0x30
        str     r7, [sp, #0xB4]
        add     r7, r4, #0x20
        str     r2, [sp, #0xC8]
        add     r2, r8, #8
        str     r7, [sp, #0x9C]
        add     r7, lr, #0x10
        str     r2, [sp, #0xC0]
        add     r2, r4, #0x80
        str     r7, [sp, #0x60]
        mov     r12, r9, lsl #15
        add     r7, r8, #4
        str     r2, [sp, #0xB0]
        mov     r11, r12
        str     r7, [sp, #0xB8]
        add     r2, lr, #0x32
        mov     r10, r11
        mov     r9, r3
        add     r7, r4, #0x40
        str     r2, [sp, #0xA0]
        str     r6, [sp, #0x30]
        str     r0, [sp, #0x34]
        str     r5, [sp, #0x38]
        str     r1, [sp, #0x5C]
LDVE0:
        ldrsh   r5, [r8], #0xA
        cmp     r5, #0
        blt     LDVE28
        mov     r1, r9, lsl #2
        add     r6, r4, r1
        mvn     r2, #0xFF
        str     r6, [sp, #0xAC]
        ldr     r6, [sp, #0xAC]
        bic     r2, r2, #0x7F, 24
        mvn     r2, r2
        str     r2, [sp, #0xA8]
        mov     r0, #1
        strh    r0, [r6, #2]
        ldr     r6, [sp, #0xA8]
        mov     r2, r9, lsl #1
        strh    r5, [lr, +r2]
        strh    r6, [r4, +r1]
LDVE1:
        ldr     r6, [sp, #0xB4]
        ldrsh   r5, [r6], #0xA
        str     r6, [sp, #0xB4]
        cmp     r5, #0
        blt     LDVE26
        ldr     r0, [sp, #0x9C]
        mvn     r6, #0xFF
        bic     r6, r6, #0x7F, 24
        mvn     r6, r6
        add     r0, r1, r0
        str     r0, [sp, #0xAC]
        str     r6, [sp, #0xA8]
        ldr     r6, [sp, #0xAC]
        mov     r0, #1
        strh    r0, [r6, #2]
        ldr     r6, [sp, #0x9C]
        ldr     r0, [sp, #0xA8]
        strh    r0, [r6, +r1]
        ldr     r6, [sp, #0x60]
        strh    r5, [r6, +r2]
LDVE2:
        ldr     r5, [sp, #0xB8]
        ldrsh   r6, [r5], #0xA
        str     r5, [sp, #0xB8]
        cmp     r6, #0
        blt     LDVE24
        mvn     r5, #0xFF
        bic     r5, r5, #0x7F, 24
        mvn     r5, r5
        add     r0, r1, r7
        str     r0, [sp, #0xAC]
        str     r5, [sp, #0xA8]
        ldr     r5, [sp, #0xAC]
        mov     r0, #1
        strh    r0, [r5, #2]
        ldr     r5, [sp, #0xA8]
        strh    r5, [r7, +r1]
        ldr     r5, [sp, #0xC4]
        strh    r6, [r5, +r2]
LDVE3:
        ldr     r6, [sp, #0xBC]
        ldrsh   r5, [r6], #0xA
        str     r6, [sp, #0xBC]
        cmp     r5, #0
        blt     LDVE22
        mvn     r6, #0xFF
        ldr     r0, [sp, #0xA4]
        bic     r6, r6, #0x7F, 24
        mvn     r6, r6
        str     r6, [sp, #0x98]
        add     r0, r1, r0
        mov     r6, r2, lsl #1
        str     r0, [sp, #0xA8]
        str     r6, [sp, #0xAC]
        ldr     r6, [sp, #0xA8]
        mov     r0, #1
        strh    r0, [r6, #2]
        ldr     r0, [sp, #0x98]
        ldr     r6, [sp, #0xA4]
        strh    r0, [r6, +r1]
        ldr     r0, [sp, #0xC8]
        ldr     r6, [sp, #0xAC]
        strh    r5, [r0, +r6]
LDVE4:
        ldr     r6, [sp, #0xC0]
        ldrsh   r5, [r6], #0xA
        str     r6, [sp, #0xC0]
        cmp     r5, #0
        str     r5, [sp, #0xA8]
        blt     LDVE20
        ldr     r6, [sp, #0xB0]
        mvn     r5, #0xFF
        bic     r5, r5, #0x7F, 24
        mvn     r5, r5
        add     r6, r1, r6
        str     r6, [sp, #0x98]
        str     r5, [sp, #0x94]
        ldr     r5, [sp, #0x98]
        mov     r6, #1
        strh    r6, [r5, #2]
        ldr     r5, [sp, #0xB0]
        ldr     r6, [sp, #0x94]
        strh    r6, [r5, +r1]
        ldr     r5, [sp, #0xA0]
        ldr     r6, [sp, #0xA8]
        ldr     r1, [sp, #0xAC]
        strh    r6, [r5, +r1]
LDVE5:
        ldrsh   r5, [r2, +lr]
        ldr     r1, [sp, #0x60]
        ldr     r6, [sp, #0xC4]
        cmp     r5, r10
        movgt   r10, r5
        ldrsh   r1, [r1, +r2]
        ldrsh   r2, [r6, +r2]
        add     r9, r9, #1
        add     r5, r3, r5
        cmp     r1, r11
        movgt   r11, r1
        cmp     r2, r12
        movgt   r12, r2
        add     r2, r1, r2
        cmp     r9, #8
        add     r3, r5, r2
        blt     LDVE0
        ldr     r6, [sp, #0x30]
        ldr     r0, [sp, #0x34]
        ldr     r5, [sp, #0x38]
        ldr     r1, [sp, #0x5C]
        add     r10, r11, r10
        add     r7, r12, r10
        mov     r3, r3, asr #3
        mov     r2, #0
        add     r11, r1, #0xA0
        mov     r12, r3, lsl #16
        sub     r7, r7, r12, asr #16
        mov     r10, r4
        mov     r7, r7, lsl #16
        mov     r3, r7, asr #16
        add     r7, sp, #2, 24
        rsb     r8, r3, r3, lsl #2
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        add     r8, r8, r8, lsl #4
        mvn     r9, r3
        add     r8, r8, r8, lsl #8
        strh    r9, [r7, #0x1C]
        mov     r8, r8, asr #15
        add     r9, sp, #0x87, 30
        add     r12, r8, r12, asr #16
        strh    r2, [r9, #2]
        add     r8, r3, #1
        mov     r7, #0xFF
        add     r9, sp, #0x87, 30
        strh    r8, [r9, #4]
        add     r8, sp, #0x87, 30
        orr     r7, r7, #0x7F, 24
        strh    r2, [r8, #6]
        sub     r7, r7, #1
        add     r8, sp, #0x87, 30
        strh    r7, [r8, #8]
        mov     r12, r12, lsl #16
        mov     r3, r11
        str     r6, [sp, #0x30]
        str     r0, [sp, #0x34]
        str     r5, [sp, #0x38]
        str     r1, [sp, #0x5C]
LDVE6:
        ldrsh   r7, [r10, #2]
        add     r1, r2, #8
        add     r0, r2, #0x10
        add     r8, sp, #0x87, 30
        add     r1, r4, r1, lsl #2
        ldrsh   r5, [r1, #2]
        add     r0, r4, r0, lsl #2
        ldrsh   r0, [r0, #2]
        add     r1, sp, #0x87, 30
        add     r6, sp, #0x87, 30
        add     r8, r8, r7, lsl #1
        add     r0, r1, r0, lsl #1
        mov     r9, #0
        add     r7, r6, r5, lsl #1
        str     r0, [sp]
        str     r10, [sp, #4]
        str     r2, [sp, #8]
        str     r11, [sp, #0xC]
        str     r12, [sp, #0x10]
        str     lr, [sp, #0x14]
LDVE7:
        ldr     r6, [r3, #0x100]
        ldr     r11, [r3]
        ldr     r5, [r3, #0x200]
        ldr     r1, [r3, #0x300]
        add     r12, r9, #0x18
        add     r0, r9, #0x20
        add     r2, r9, #0x10
        str     r1, [sp, #0xC0]
        ldr     r1, [r3, #0x400]
        add     r12, r4, r12, lsl #2
        add     r0, r4, r0, lsl #2
        str     r1, [sp, #0xBC]
        ldr     r1, [r3, #0x500]
        add     r2, r4, r2, lsl #2
        str     r1, [sp, #0xB8]
        ldr     r1, [r3, #0x600]
        str     r1, [sp, #0xB4]
        ldr     r1, [r3, #0x700]
        str     r1, [sp, #0xB0]
        ldr     r1, [r3, #0x800]
        str     r1, [sp, #0xAC]
        ldrsh   r10, [r12, #2]
        add     r1, r9, #8
        ldrsh   r12, [r2, #2]
        ldrsh   r0, [r0, #2]
        add     r1, r4, r1, lsl #2
        ldrsh   r1, [r1, #2]
        add     lr, r8, r12, lsl #1
        ldrsh   lr, [lr, #4]
        add     r1, r8, r1, lsl #1
        ldrsh   r1, [r1, #4]
        mul     r6, r6, lr
        add     lr, r8, r0, lsl #1
        mul     r1, r11, r1
        add     r2, r8, r10, lsl #1
        ldrsh   lr, [lr, #4]
        ldr     r11, [sp, #0xC0]
        ldrsh   r2, [r2, #4]
        add     r12, r7, r12, lsl #1
        mul     lr, r11, lr
        ldrsh   r12, [r12, #4]
        mul     r2, r5, r2
        ldr     r11, [sp, #0xB8]
        add     r5, r7, r10, lsl #1
        str     lr, [sp, #0xC0]
        ldrsh   lr, [r5, #4]
        ldr     r5, [sp, #0xBC]
        mov     r1, r1, asr #15
        mov     r6, r6, asr #15
        mul     lr, r11, lr
        ldr     r11, [sp]
        mul     r12, r5, r12
        add     r5, r7, r0, lsl #1
        ldrsh   r5, [r5, #4]
        add     r10, r11, r10, lsl #1
        ldr     r11, [sp]
        ldrsh   r10, [r10, #4]
        mov     r2, r2, asr #15
        mov     r12, r12, asr #15
        add     r0, r11, r0, lsl #1
        ldr     r11, [sp, #0xB4]
        ldrsh   r0, [r0, #4]
        mov     lr, lr, asr #15
        add     r9, r9, #1
        mul     r5, r11, r5
        ldr     r11, [sp, #0xB0]
        cmp     r9, #8
        mul     r10, r11, r10
        ldr     r11, [sp, #0xAC]
        mov     r5, r5, asr #15
        mul     r0, r11, r0
        ldr     r11, [sp, #0xC0]
        mov     r10, r10, asr #15
        str     r1, [r3]
        mov     r11, r11, asr #15
        mov     r0, r0, asr #15
        str     r6, [r3, #0x100]
        str     r2, [r3, #0x200]
        str     r11, [r3, #0x300]
        str     r12, [r3, #0x400]
        str     lr, [r3, #0x500]
        str     r5, [r3, #0x600]
        str     r10, [r3, #0x700]
        str     r0, [r3, #0x800]
        add     r3, r3, #4
        blt     LDVE7
        ldr     r2, [sp, #8]
        ldr     r10, [sp, #4]
        ldr     r11, [sp, #0xC]
        ldr     r12, [sp, #0x10]
        ldr     lr, [sp, #0x14]
        add     r2, r2, #1
        cmp     r2, #8
        add     r10, r10, #4
        blt     LDVE6
        ldr     r1, [sp, #0x5C]
        ldr     r6, [sp, #0x30]
        ldr     r0, [sp, #0x34]
        ldr     r5, [sp, #0x38]
        mvn     r3, #0
        add     r3, r3, #2, 18
        str     r3, [sp, #0xBC]
        add     r3, r1, #0x20
        mov     r7, #0
        add     r2, r1, #0x1A, 28
        str     r3, [sp, #0x68]
        str     r2, [sp, #0x9C]
        add     r3, r1, #0x5A, 28
        add     r2, r1, #0x2A, 28
        str     r7, [sp, #0xB8]
        str     r3, [sp, #0x70]
        str     r2, [sp, #0x64]
        add     r3, r1, #0x40
        mov     r9, r7
        mov     r10, r9
        mov     r8, r10
        add     r2, r1, #0x60
        str     r3, [sp, #0xC0]
        str     r2, [sp, #0xB0]
        add     r3, r1, #0x7A, 28
        add     r2, r1, #0x4A, 28
        str     r3, [sp, #0x74]
        str     r1, [sp, #0x78]
        str     r8, [sp, #0xB4]
        mov     r3, lr
        str     r8, [sp, #0x1C]
        str     r7, [sp, #0x28]
        str     r4, [sp, #0x2C]
        str     lr, [sp, #0x14]
        str     r0, [sp, #0x34]
        str     r5, [sp, #0x38]
        ldr     lr, [sp, #0x78]
        ldr     r4, [sp, #0x70]
        ldr     r5, [sp, #0x68]
        ldr     r7, [sp, #0x64]
        ldr     r0, [sp, #0x9C]
        ldr     r8, [sp, #0x60]
        str     r10, [sp, #0x20]
        str     r9, [sp, #0x24]
        str     r11, [sp, #0xC]
        str     r12, [sp, #0x10]
        str     r6, [sp, #0x30]
LDVE8:
        ldr     r12, [lr], #4
        ldrsh   r6, [r3], #2
        mov     r12, r12, lsl #16
        str     r12, [sp, #4]
        add     r12, r1, #0x80
        str     r12, [sp]
        str     r3, [sp, #0x7C]
        ldr     r3, [sp, #0x74]
        add     r12, r7, #1, 24
        str     r6, [sp, #8]
        str     r12, [sp, #0x18]
        mov     r11, r2
        mov     r10, r4
        mov     r9, #0
        mov     r12, r8
        mov     r6, r5
        str     lr, [sp, #0x78]
        str     r2, [sp, #0x6C]
        str     r7, [sp, #0x64]
        str     r1, [sp, #0x5C]
LDVE9:
        ldr     lr, [r6], #4
        ldr     r1, [sp, #0xC]
        ldr     r4, [sp, #4]
        ldrsh   r2, [r12], #2
        ldr     r1, [r1, +r9, lsl #2]
        add     lr, lr, r4, asr #16
        ldr     r4, [sp, #8]
        add     r1, lr, r1, lsl #1
        ldr     lr, [sp, #0xC0]
        add     r7, r4, r2
        ldr     r4, [sp, #0xC4]
        add     r2, r10, #1, 24
        str     r10, [sp, #0x80]
        ldr     r10, [sp, #0x10]
        mov     r8, r3
        mov     r5, #0
        str     r2, [sp, #0x94]
        str     r1, [sp, #0x98]
        str     r12, [sp, #0x88]
        str     r6, [sp, #0x84]
        str     r9, [sp, #0x90]
        str     r11, [sp, #0xA0]
        str     r0, [sp, #0x9C]
LDVE10:
        ldrsh   r0, [r4], #2
        add     r0, r7, r0
        mov     r0, r0, lsl #16
        mov     r9, r0, asr #16
        cmp     r9, r10, asr #16
        ble     LDVE15
        ldr     r0, [sp, #0x9C]
        ldr     r1, [sp, #0xA0]
        ldr     r2, [lr]
        ldr     r0, [r0, +r5, lsl #2]
        ldr     r3, [sp, #0x98]
        ldr     r1, [r1, +r5, lsl #2]
        ldr     r11, [sp, #0x94]
        add     r2, r3, r2
        add     r0, r2, r0, lsl #1
        add     r1, r0, r1, lsl #1
        mvn     r0, #0
        str     r0, [sp, #0xA4]
        add     r0, r8, #1, 24
        str     r0, [sp, #0xAC]
        str     r1, [sp, #0x8C]
        ldr     r0, [sp, #0xC8]
        ldr     r1, [sp, #0xB0]
        ldr     r2, [sp]
        ldr     r3, [sp, #0x18]
        str     r11, [sp, #0xA8]
        str     lr, [sp, #0x4C]
        str     r8, [sp, #0x48]
        str     r7, [sp, #0x58]
        ldr     r7, [sp, #0xA8]
        ldr     r8, [sp, #0xAC]
        ldr     lr, [sp, #0xB4]
        mov     r12, #0
        mov     r6, r12
        str     r9, [sp, #0x3C]
        str     r4, [sp, #0x50]
        str     r5, [sp, #0x54]
LDVE11:
        ldr     r5, [r1], #4
        ldrsh   r4, [r0], #4
        ldr     r9, [r2], #4
        ldr     r10, [sp, #0x64]
        str     r9, [sp, #0x44]
        ldr     r9, [sp, #0x3C]
        ldr     r10, [r10, +r6, lsl #2]
        add     r4, r9, r4
        str     r10, [sp, #0x40]
        ldr     r10, [r3], #4
        ldr     r11, [sp, #0x40]
        mov     r4, r4, lsl #16
        str     r10, [sp, #0xCC]
        ldr     r10, [sp, #0x80]
        mov     r4, r4, asr #16
        mul     r4, r4, r4
        ldr     r10, [r10, +r6, lsl #2]
        str     r10, [sp, #0xD0]
        ldr     r10, [r7], #4
        str     r10, [sp, #0xD4]
        ldr     r10, [sp, #0x48]
        ldr     r10, [r10, +r6, lsl #2]
        str     r10, [sp, #0xD8]
        ldr     r10, [r8], #4
        str     r10, [sp, #0xDC]
        ldr     r10, [sp, #0x14]
        add     r10, r10, r12, lsl #1
        ldrsh   r10, [r10, #0x32]
        str     r10, [sp, #0xE0]
        ldr     r10, [sp, #0x8C]
        add     r5, r10, r5
        add     r5, r5, r11, lsl #1
        ldr     r11, [sp, #0xE0]
        add     r9, r9, r11
        ldr     r11, [sp, #0xD0]
        add     r5, r5, r11, lsl #1
        ldr     r11, [sp, #0xD8]
        add     r11, r5, r11, lsl #1
        mov     r5, r9, lsl #16
        mov     r9, r4, asr #15
        mov     r4, r11, asr #4
        ldr     r11, [sp, #0x44]
        mov     r5, r5, asr #16
        mul     r5, r5, r5
        add     r10, r10, r11
        ldr     r11, [sp, #0xCC]
        mov     r9, r9, lsl #16
        mov     r4, r4, lsl #16
        mov     r9, r9, asr #16
        add     r10, r10, r11, lsl #1
        ldr     r11, [sp, #0xBC]
        str     r9, [sp, #0x44]
        mov     r4, r4, asr #16
        str     r4, [sp, #0x40]
        mul     r9, r11, r9
        ldr     r11, [sp, #0xD4]
        mul     r4, lr, r4
        mov     r5, r5, asr #15
        add     r10, r10, r11, lsl #1
        ldr     r11, [sp, #0xDC]
        mov     r5, r5, lsl #16
        subs    r4, r4, r9
        mov     r9, r5, asr #16
        add     r10, r10, r11, lsl #1
        mov     r10, r10, asr #4
        mov     r10, r10, lsl #16
        mov     r5, r10, asr #16
        bmi     LDVE19
LDVE12:
        ldr     r4, [sp, #0xBC]
        rsb     r10, r9, #0
        mul     r4, r10, r4
        mlas    r4, r5, lr, r4
        bmi     LDVE18
LDVE13:
        add     r6, r6, #1
        cmp     r6, #8
        add     r12, r12, #2
        blt     LDVE11
        ldr     r0, [sp, #0xA4]
        ldr     r4, [sp, #0x50]
        ldr     r5, [sp, #0x54]
        ldr     r8, [sp, #0x48]
        ldr     r7, [sp, #0x58]
        ldr     r10, [sp, #0x10]
        str     lr, [sp, #0xB4]
        ldr     lr, [sp, #0x4C]
        mov     r0, r0, lsl #16
        movs    r0, r0, asr #16
        bmi     LDVE14
        ldr     r1, [sp, #0xB8]
        str     r5, [sp, #0x20]
        str     r1, [sp, #0x28]
        ldr     r1, [sp, #0x90]
        str     r0, [sp, #0x1C]
        str     r1, [sp, #0x24]
LDVE14:
        ldr     r0, [sp, #0x34]
        ldrsh   r1, [r0]
        sub     r1, r1, #1
        strh    r1, [r0]
        mov     r1, r1, lsl #16
        cmp     r1, #0
        ble     LDVE17
LDVE15:
        add     r5, r5, #1
        cmp     r5, #8
        add     r8, r8, #0x20
        add     lr, lr, #4
        blt     LDVE10
        ldr     r9, [sp, #0x90]
        ldr     r0, [sp, #0x9C]
        ldr     r10, [sp, #0x80]
        ldr     r11, [sp, #0xA0]
        ldr     r12, [sp, #0x88]
        ldr     r6, [sp, #0x84]
        ldr     r3, [sp, #0x74]
        add     r9, r9, #1
        sub     r1, r0, #0x20
        cmp     r9, #8
        add     r10, r10, #0x20
        add     r0, r1, #0x20
        add     r11, r11, #0x20
        blt     LDVE9
        mov     r0, r1
        ldr     r12, [sp, #0xB8]
        ldr     r3, [sp, #0x7C]
        ldr     lr, [sp, #0x78]
        ldr     r4, [sp, #0x70]
        ldr     r2, [sp, #0x6C]
        ldr     r5, [sp, #0x68]
        ldr     r7, [sp, #0x64]
        ldr     r8, [sp, #0x60]
        ldr     r1, [sp, #0x5C]
        add     r12, r12, #1
        cmp     r12, #8
        str     r12, [sp, #0xB8]
        ldr     r12, [sp, #0xC]
        add     r0, r0, #0x40
        add     r7, r7, #0x20
        add     r12, r12, #0x20
        str     r12, [sp, #0xC]
        blt     LDVE8
        ldr     r8, [sp, #0x1C]
        ldr     r10, [sp, #0x20]
        ldr     r9, [sp, #0x24]
        ldr     r7, [sp, #0x28]
        ldr     r4, [sp, #0x2C]
        ldr     r6, [sp, #0x30]
        ldr     r5, [sp, #0x38]
LDVE16:
        mov     r1, r8, asr #1
        and     r12, r8, #1
        add     r3, r1, r1, lsl #2
        add     r3, r3, r12
        add     r12, r12, #3
        mov     r3, r3, lsl #1
        add     r12, r1, r12, lsl #3
        str     r3, [sp, #0xC4]
        str     r12, [sp, #0xC8]
        mov     r1, #0x28
        mov     r0, r5
        bl      _ippsZero_16s
        add     r3, r9, r9, lsl #2
        add     r1, r10, r10, lsl #2
        mov     lr, r3, lsl #1
        mov     r3, r1, lsl #1
        add     r1, r7, r7, lsl #2
        add     r0, r9, #8
        add     r11, r10, #0x10
        add     r12, r4, r7, lsl #2
        ldrsh   r12, [r12, #2]
        add     r2, sp, #0x85, 30
        mov     r1, r1, lsl #1
        add     r12, r2, r12, lsl #1
        ldrsh   r12, [r12, #2]
        add     r0, r4, r0, lsl #2
        ldrsh   r0, [r0, #2]
        strh    r12, [r5, +r1]
        add     r12, sp, #0x85, 30
        add     r0, r12, r0, lsl #1
        ldrsh   r12, [r0, #2]
        ldr     r0, [sp, #0xC8]
        add     r11, r4, r11, lsl #2
        ldrsh   r11, [r11, #2]
        add     lr, lr, #2
        strh    r12, [r5, +lr]
        add     r12, sp, #0x85, 30
        add     r11, r12, r11, lsl #1
        ldrsh   r12, [r11, #2]
        add     r0, r4, r0, lsl #2
        ldrsh   r4, [r0, #2]
        add     r3, r3, #4
        strh    r12, [r5, +r3]
        ldr     r12, [sp, #0xC4]
        add     r11, sp, #0x85, 30
        add     r4, r11, r4, lsl #1
        ldrsh   r4, [r4, #2]
        add     r12, r12, #6
        strh    r4, [r5, +r12]
        mov     r4, #0
        strh    r4, [r6]
        ldrsh   r1, [r5, +r1]
        cmp     r1, #0
        movgt   r4, #1
        strgth  r4, [r6]
        ldrsh   lr, [lr, +r5]
        cmp     lr, #0
        addgt   r4, r4, #2
        strgth  r4, [r6]
        ldrsh   r3, [r3, +r5]
        cmp     r3, #0
        addgt   r4, r4, #4
        strgth  r4, [r6]
        ldrsh   r5, [r12, +r5]
        cmp     r5, #0
        addgt   r4, r4, #8
        strgth  r4, [r6]
        mov     r8, r8, lsl #9
        add     r10, r8, r10, lsl #6
        add     r9, r7, r9, lsl #3
        add     r10, r9, r10
        strh    r10, [r6, #2]
        add     sp, sp, #0x8A, 30
        ldmia   sp!, {r4 - r11, pc}
LDVE17:
        ldr     r8, [sp, #0x1C]
        ldr     r10, [sp, #0x20]
        ldr     r9, [sp, #0x24]
        ldr     r7, [sp, #0x28]
        ldr     r4, [sp, #0x2C]
        ldr     r6, [sp, #0x30]
        ldr     r5, [sp, #0x38]
        b       LDVE16
LDVE18:
        mov     lr, r9
        add     r4, r12, #1
        str     r5, [sp, #0xBC]
        str     r4, [sp, #0xA4]
        b       LDVE13
LDVE19:
        ldr     r4, [sp, #0x40]
        ldr     lr, [sp, #0x44]
        str     r4, [sp, #0xBC]
        str     r12, [sp, #0xA4]
        b       LDVE12
LDVE20:
        ldr     r6, [sp, #0xB0]
        mvn     r5, #0
        add     r6, r1, r6
        str     r6, [sp, #0xE0]
        mov     r6, r5, lsl #15
        str     r6, [sp, #0xDC]
        ldr     r6, [sp, #0xA8]
        cmn     r6, #2, 18
        ldr     r6, [sp, #0xE0]
        strh    r5, [r6, #2]
        ldr     r6, [sp, #0xDC]
        ldr     r5, [sp, #0xB0]
        strh    r6, [r5, +r1]
        beq     LDVE21
        ldr     r1, [sp, #0xA8]
        ldr     r6, [sp, #0xA0]
        ldr     r5, [sp, #0xAC]
        rsb     r1, r1, #0
        strh    r1, [r6, +r5]
        b       LDVE5
LDVE21:
        ldr     r6, [sp, #0xA0]
        ldr     r5, [sp, #0xAC]
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r1, r1
        strh    r1, [r6, +r5]
        b       LDVE5
LDVE22:
        ldr     r0, [sp, #0xA4]
        mvn     r6, #0
        cmn     r5, #2, 18
        add     r0, r1, r0
        str     r0, [sp, #0xE0]
        mov     r0, r6, lsl #15
        str     r0, [sp, #0xDC]
        ldr     r0, [sp, #0xE0]
        strh    r6, [r0, #2]
        ldr     r6, [sp, #0xA4]
        ldr     r0, [sp, #0xDC]
        strh    r0, [r6, +r1]
        mov     r6, r2, lsl #1
        str     r6, [sp, #0xAC]
        beq     LDVE23
        ldr     r0, [sp, #0xC8]
        ldr     r6, [sp, #0xAC]
        rsb     r5, r5, #0
        strh    r5, [r0, +r6]
        b       LDVE4
LDVE23:
        ldr     r0, [sp, #0xC8]
        ldr     r6, [sp, #0xAC]
        mvn     r5, #0xFF
        bic     r5, r5, #0x7F, 24
        mvn     r5, r5
        strh    r5, [r0, +r6]
        b       LDVE4
LDVE24:
        add     r0, r1, r7
        str     r0, [sp, #0xE0]
        mvn     r5, #0
        cmn     r6, #2, 18
        mov     r0, r5, lsl #15
        str     r0, [sp, #0xDC]
        ldr     r0, [sp, #0xE0]
        strh    r5, [r0, #2]
        ldr     r5, [sp, #0xDC]
        strh    r5, [r7, +r1]
        beq     LDVE25
        ldr     r5, [sp, #0xC4]
        rsb     r6, r6, #0
        strh    r6, [r5, +r2]
        b       LDVE3
LDVE25:
        ldr     r6, [sp, #0xC4]
        mvn     r5, #0xFF
        bic     r5, r5, #0x7F, 24
        mvn     r5, r5
        strh    r5, [r6, +r2]
        b       LDVE3
LDVE26:
        ldr     r0, [sp, #0x9C]
        mvn     r6, #0
        cmn     r5, #2, 18
        add     r0, r1, r0
        str     r0, [sp, #0xE0]
        mov     r0, r6, lsl #15
        str     r0, [sp, #0xDC]
        ldr     r0, [sp, #0xE0]
        strh    r6, [r0, #2]
        ldr     r0, [sp, #0xDC]
        ldr     r6, [sp, #0x9C]
        strh    r0, [r6, +r1]
        beq     LDVE27
        ldr     r6, [sp, #0x60]
        rsb     r5, r5, #0
        strh    r5, [r6, +r2]
        b       LDVE2
LDVE27:
        ldr     r6, [sp, #0x60]
        mvn     r5, #0xFF
        bic     r5, r5, #0x7F, 24
        mvn     r5, r5
        strh    r5, [r6, +r2]
        b       LDVE2
LDVE28:
        mov     r1, r9, lsl #2
        mvn     r0, #0xFF
        add     r2, r4, r1
        mvn     r6, #0
        bic     r0, r0, #0x7F, 24
        strh    r6, [r2, #2]
        cmn     r5, #2, 18
        strh    r0, [r4, +r1]
        mov     r2, r9, lsl #1
        rsbne   r5, r5, #0
        strneh  r5, [lr, +r2]
        bne     LDVE1
        mvn     r5, #0
        mov     r5, r5, lsl #15
        mvn     r5, r5
        strh    r5, [lr, +r2]
        b       LDVE1


