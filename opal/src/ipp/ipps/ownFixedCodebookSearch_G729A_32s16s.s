        .text
        .align  4
        .globl  ownFixedCodebookSearch_G729A_32s16s


ownFixedCodebookSearch_G729A_32s16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xD9, 30
        add     r10, sp, #0x61, 30
        add     r5, sp, #0xC4
        and     r11, r10, #0x1F
        add     r8, sp, #0x91, 30
        and     r10, r5, #0x1F
        and     r5, r8, #0x1F
        rsb     r8, r11, #0
        str     r0, [sp, #0x3C]
        add     r9, sp, #0x61, 30
        add     r7, sp, #0xCD, 30
        and     r8, r8, #0x1F
        rsb     r5, r5, #0
        rsb     r10, r10, #0
        add     lr, sp, #0xC4
        add     r12, sp, #0x91, 30
        mov     r0, r7
        add     r8, r9, r8
        and     r5, r5, #0x1F
        and     r10, r10, #0x1F
        mov     r6, r2
        mov     r4, r1
        mov     r2, #0xC
        mov     r1, #0
        add     r9, lr, r10
        add     r5, r12, r5
        mov     r7, r3
        bl      __intel_memset
        add     r10, r8, #0x20
        str     r10, [sp, #0x28]
        add     r10, r9, #0x20
        str     r10, [sp, #0x34]
        add     r10, r5, #0x10
        str     r10, [sp, #0x44]
        add     r10, r8, #0x40
        str     r10, [sp, #0x2C]
        add     r10, r5, #0x20
        str     r10, [sp, #0x18]
        add     r10, r9, #0x60
        str     r10, [sp, #0x20]
        add     r1, r9, #0x40
        add     r10, r8, #0x80
        add     r3, r9, #0x80
        str     r10, [sp, #0x24]
        str     r9, [sp, #0x38]
        str     r7, [sp, #0xC]
        str     r6, [sp, #0x10]
        ldr     r6, [sp, #0x3C]
        ldr     r7, [sp, #0x38]
        mov     r2, #0
        add     r10, r5, #0x40
        mvn     lr, #0xFF
        sub     r12, r2, #2, 18
        str     r10, [sp, #0x30]
        bic     lr, lr, #0x7F, 24
        mvn     r12, r12
        add     r0, r8, #0x60
        add     r11, r5, #0x30
        mov     r10, r8
        str     r3, [sp]
        str     r9, [sp, #4]
        str     r8, [sp, #8]
        str     r4, [sp, #0x14]
LDVF0:
        ldrsh   r8, [r6]
        cmp     r8, #0
        blt     LDVF33
        mov     r4, r2, lsl #1
        mov     r3, r2, lsl #2
        str     r12, [r10]
        str     lr, [r7]
        strh    r8, [r5, +r4]
LDVF1:
        ldrsh   r8, [r6, #2]
        cmp     r8, #0
        blt     LDVF32
        ldr     r9, [sp, #0x28]
        str     r12, [r9, +r3]
        ldr     r9, [sp, #0x34]
        str     lr, [r9, +r3]
        ldr     r9, [sp, #0x44]
        strh    r8, [r9, +r4]
LDVF2:
        ldrsh   r8, [r6, #4]
        cmp     r8, #0
        blt     LDVF31
        ldr     r9, [sp, #0x2C]
        str     lr, [r1, +r3]
        str     r12, [r9, +r3]
        ldr     r9, [sp, #0x18]
        strh    r8, [r9, +r4]
LDVF3:
        ldrsh   r8, [r6, #6]
        cmp     r8, #0
        blt     LDVF30
        str     r12, [r0, +r3]
        ldr     r9, [sp, #0x20]
        strh    r8, [r11, +r4]
        str     lr, [r9, +r3]
LDVF4:
        ldrsh   r8, [r6, #8]
        cmp     r8, #0
        blt     LDVF29
        ldr     r9, [sp, #0x24]
        str     r12, [r9, +r3]
        ldr     r9, [sp]
        str     lr, [r9, +r3]
        ldr     r3, [sp, #0x30]
        strh    r8, [r3, +r4]
LDVF5:
        add     r2, r2, #1
        cmp     r2, #8
        add     r6, r6, #0xA
        add     r10, r10, #4
        add     r7, r7, #4
        blt     LDVF0
        ldr     r4, [sp, #0x14]
        ldr     r9, [sp, #4]
        ldr     r8, [sp, #8]
        ldr     r7, [sp, #0xC]
        ldr     r6, [sp, #0x10]
        add     r10, r4, #0xA0
        str     r10, [sp, #0x40]
        str     r10, [sp, #0x18]
        str     r9, [sp, #4]
        ldr     r10, [sp, #0x2C]
        ldr     r9, [sp, #0x28]
        mov     r12, r8
        mov     lr, #8
        str     r5, [sp, #0x1C]
        str     r7, [sp, #0xC]
        str     r6, [sp, #0x10]
        str     r4, [sp, #0x14]
LDVF6:
        ldr     r2, [r12], #4
        mov     r1, r8
        mov     r0, r1
        cmp     r2, #0
        mov     r7, r0
        ldrlt   r1, [sp, #4]
        ldr     r2, [r9], #4
        cmp     r2, #0
        ldrlt   r0, [sp, #4]
        ldr     r2, [r10], #4
        cmp     r2, #0
        ldrlt   r7, [sp, #4]
        add     r2, r1, #0x40
        str     r12, [sp, #0x24]
        ldr     r12, [sp, #0x18]
        str     r2, [sp]
        add     r6, r1, #0x20
        add     r5, r1, #0x60
        add     r4, r0, #0x40
        add     r3, r0, #0x60
        add     r2, r7, #0x60
        mov     r11, #8
        add     r1, r1, #0x80
        add     r0, r0, #0x80
        add     r7, r7, #0x80
        str     r11, [sp, #0x30]
        str     r10, [sp, #0x2C]
        str     r9, [sp, #0x28]
        str     lr, [sp, #0x20]
        str     r8, [sp, #8]
LDVF7:
        ldr     lr, [r12]
        ldr     r8, [r12, #0x100]
        ldr     r10, [sp]
        str     r8, [sp, #0x98]
        ldr     r8, [r12, #0x300]
        ldr     r9, [r12, #0x200]
        str     r8, [sp, #0x94]
        ldr     r8, [r12, #0x400]
        str     r8, [sp, #0x90]
        ldr     r8, [r12, #0x500]
        str     r8, [sp, #0x8C]
        ldr     r8, [r12, #0x600]
        str     r8, [sp, #0x88]
        ldr     r8, [r12, #0x700]
        str     r8, [sp, #0x84]
        ldr     r8, [r12, #0x800]
        str     r8, [sp, #0x80]
        ldr     r10, [r10]
        ldr     r8, [r6], #4
        str     r10, [sp, #0x7C]
        ldr     r11, [r1], #4
        mul     r8, lr, r8
        ldr     r10, [r5], #4
        ldr     lr, [sp, #0x98]
        str     r11, [sp, #0x78]
        mul     r10, r9, r10
        ldr     r11, [r4], #4
        str     r11, [sp, #0x74]
        ldr     r11, [r3], #4
        ldr     r9, [sp, #0x74]
        str     r11, [sp, #0x70]
        ldr     r11, [r0], #4
        str     r11, [sp, #0x6C]
        ldr     r11, [r2], #4
        str     r11, [sp, #0x68]
        ldr     r11, [r7], #4
        str     r8, [sp, #0x60]
        ldr     r8, [sp, #0x7C]
        str     r11, [sp, #0x64]
        ldr     r11, [sp, #0x68]
        mul     r8, lr, r8
        ldr     lr, [sp, #0x94]
        str     r10, [sp, #0x7C]
        ldr     r10, [sp, #0x6C]
        str     r8, [sp, #0x98]
        ldr     r8, [sp, #0x78]
        mul     lr, lr, r8
        ldr     r8, [sp, #0x90]
        mul     r9, r8, r9
        ldr     r8, [sp, #0x8C]
        mov     lr, lr, asr #15
        str     r9, [sp, #0x94]
        ldr     r9, [sp, #0x70]
        mul     r9, r8, r9
        ldr     r8, [sp, #0x88]
        mul     r8, r8, r10
        ldr     r10, [sp, #0x84]
        mul     r11, r10, r11
        ldr     r10, [sp, #0x80]
        str     lr, [sp, #0x80]
        ldr     lr, [sp, #0x94]
        mov     r8, r8, asr #15
        str     r11, [sp, #0x90]
        ldr     r11, [sp, #0x64]
        mov     lr, lr, asr #15
        str     lr, [sp, #0x94]
        mul     r11, r10, r11
        ldr     r10, [sp, #0x60]
        mov     lr, r9, asr #15
        ldr     r9, [sp, #0x90]
        mov     r10, r10, asr #15
        str     r10, [sp, #0x88]
        ldr     r10, [sp, #0x98]
        str     r11, [sp, #0x8C]
        ldr     r11, [sp, #0x88]
        mov     r10, r10, asr #15
        str     r10, [sp, #0x98]
        ldr     r10, [sp, #0x7C]
        mov     r9, r9, asr #15
        mov     r10, r10, asr #15
        str     r10, [sp, #0x84]
        ldr     r10, [sp, #0x8C]
        str     r11, [r12]
        ldr     r11, [sp, #0x98]
        mov     r10, r10, asr #15
        str     r11, [r12, #0x100]
        ldr     r11, [sp, #0x84]
        str     r11, [r12, #0x200]
        ldr     r11, [sp, #0x80]
        str     r11, [r12, #0x300]
        ldr     r11, [sp, #0x94]
        str     r8, [r12, #0x600]
        str     lr, [r12, #0x500]
        str     r11, [r12, #0x400]
        str     r9, [r12, #0x700]
        str     r10, [r12, #0x800]
        ldr     r8, [sp, #0x30]
        ldr     lr, [sp]
        add     r12, r12, #4
        subs    r8, r8, #1
        str     r8, [sp, #0x30]
        add     lr, lr, #4
        str     lr, [sp]
        bne     LDVF7
        ldr     lr, [sp, #0x20]
        str     r12, [sp, #0x18]
        ldr     r10, [sp, #0x2C]
        ldr     r9, [sp, #0x28]
        ldr     r12, [sp, #0x24]
        ldr     r8, [sp, #8]
        subs    lr, lr, #1
        bne     LDVF6
        ldr     r6, [sp, #0x10]
        ldr     r4, [sp, #0x14]
        ldr     r5, [sp, #0x1C]
        ldr     r7, [sp, #0xC]
        mov     lr, #0
        mov     r12, lr
        str     r6, [sp, #0x10]
        str     r4, [sp, #0x14]
LDVF8:
        add     r0, sp, #0xCD, 30
        add     r2, lr, #2
        mvn     r1, #0
        add     r0, r0, r12
        add     r2, r5, r2, lsl #4
        mov     r11, r1
        mov     r3, #0
LDVF9:
        ldrsh   r4, [r2], #2
        cmp     r4, r1
        ble     LDVF10
        add     r6, sp, #0xCD, 30
        mov     r9, lr, lsl #2
        ldrsh   r10, [r6, +r9]
        mov     r11, r1
        mov     r1, r4
        strh    r3, [r6, +r9]
        strh    r10, [r0, #2]
        b       LDVF11
LDVF10:
        cmp     r4, r11
        movgt   r11, r4
        strgth  r3, [r0, #2]
LDVF11:
        add     r3, r3, #1
        cmp     r3, #8
        blt     LDVF9
        add     lr, lr, #1
        cmp     lr, #3
        add     r12, r12, #4
        blt     LDVF8
        ldr     r6, [sp, #0x10]
        ldr     r4, [sp, #0x14]
        add     r12, sp, #0xCD, 30
        ldrsh   r1, [r12]
        add     lr, sp, #0xBD, 30
        add     r12, sp, #0xAD, 30
        and     lr, lr, #0x1F
        and     r12, r12, #0x1F
        rsb     lr, lr, #0
        rsb     r12, r12, #0
        and     r11, lr, #0x1F
        and     lr, r12, #0x1F
        ldr     r12, [r4, #0x20]
        add     r9, sp, #0xCD, 30
        ldrsh   r0, [r9, #2]
        mov     r10, #0
        str     r12, [sp, #0x2C]
        ldr     r12, [r4, #0x40]
        mvn     r9, #0
        mov     r3, #1
        str     r12, [sp]
        add     r12, r4, r0, lsl #2
        ldr     r12, [r12, #0x40]
        add     r2, sp, #3, 24
        str     r12, [sp, #0x3C]
        add     r12, r5, r1, lsl #1
        ldrsh   r12, [r12, #0x20]
        str     r12, [sp, #0x30]
        strh    r10, [r2, #0x5C]
        add     r2, sp, #3, 24
        strh    r9, [r2, #0x54]
        mov     r2, #1
        add     r9, sp, #3, 24
        strh    r2, [r9, #0x50]
        str     r3, [sp, #0x34C]
        add     r2, sp, #0xBD, 30
        str     r10, [sp, #0x340]
        mov     r3, #2
        str     r3, [sp, #0x348]
        str     r10, [sp, #0x344]
        str     r10, [sp, #0x360]
        add     r2, r2, r11
        str     r2, [sp, #0x28]
        add     r2, r4, #0x20
        str     r2, [sp, #0x20]
        add     r2, r4, #0x4A, 28
        str     r2, [sp, #4]
        add     r2, sp, #0xAD, 30
        add     r2, r2, lr
        str     r2, [sp, #0x34]
        add     r2, r5, #0x20
        str     r2, [sp, #0x18]
        add     r2, r4, #0x60
        mov     r12, #3
        str     r2, [sp, #0x24]
        mov     r9, r12
        add     r3, r5, #0x30
        mov     r2, #0xC
        str     r2, [sp, #0x38]
        str     r3, [sp, #0x94]
        str     lr, [sp, #0x80]
        str     r11, [sp, #0x7C]
        str     r0, [sp, #0x90]
        str     r1, [sp, #0x8C]
        str     r9, [sp, #0x6C]
        str     r10, [sp, #0x68]
        str     r8, [sp, #8]
        str     r7, [sp, #0xC]
        str     r6, [sp, #0x10]
LDVF12:
        ldr     r3, [sp, #0x8C]
        ldr     r6, [sp, #0x90]
        ldr     r1, [sp, #0x8C]
        add     r0, r12, #4
        add     r2, r4, r3, lsl #2
        ldr     r8, [r2, #0x40]
        mov     lr, r0, lsl #8
        add     r0, r5, r6, lsl #1
        ldrsh   r2, [r0, #0x20]
        ldr     r0, [sp, #0x24]
        add     r3, lr, r3, lsl #5
        add     r6, lr, r6, lsl #5
        mov     lr, #1
        str     lr, [sp, #0x98]
        ldr     lr, [sp, #0x40]
        mov     r10, #0
        add     r7, lr, r3
        add     r3, lr, r6
        ldr     r6, [sp, #0x94]
        mov     r9, r0
        str     r2, [sp, #0x48]
        str     r0, [sp, #0x50]
        ldr     r2, [sp, #0x98]
        ldr     r0, [sp, #0x30]
        mvn     lr, #0
        str     r3, [sp, #0x4C]
        str     r12, [sp, #0x54]
        str     r5, [sp, #0x1C]
        str     r4, [sp, #0x14]
LDVF13:
        ldr     r4, [r7]
        ldrsh   r12, [r6], #2
        ldr     r3, [r9], #4
        add     r4, r8, r4, lsl #1
        add     r12, r0, r12
        add     r4, r3, r4
        mov     r12, r12, lsl #16
        add     r4, r4, #2
        mov     r3, r12, asr #16
        mul     r12, r3, r3
        mov     r4, r4, asr #2
        mov     r4, r4, lsl #16
        mov     r12, r12, asr #15
        mov     r5, r12, lsl #16
        mov     r12, r4, asr #16
        mul     r4, lr, r12
        mov     r5, r5, asr #16
        mul     r11, r5, r2
        cmp     r11, r4
        ble     LDVF14
        mov     r2, r12
        mov     lr, r5
        add     r12, sp, #0xD7, 30
        strh    r3, [r12]
        add     r3, sp, #0x36, 28
        str     r1, [r3]
        add     r3, sp, #0xD1, 30
        str     r10, [r3]
LDVF14:
        add     r10, r10, #1
        cmp     r10, #8
        add     r7, r7, #4
        blt     LDVF13
        ldr     r12, [sp, #0x54]
        ldr     r5, [sp, #0x1C]
        ldr     r4, [sp, #0x14]
        str     r2, [sp, #0x98]
        ldr     r2, [sp, #0x48]
        ldr     r3, [sp, #0x4C]
        ldr     r0, [sp, #0x50]
        str     r12, [sp, #0x54]
        str     r5, [sp, #0x1C]
        str     r4, [sp, #0x14]
        ldr     r1, [sp, #0x98]
        ldr     r12, [sp, #0x94]
        ldr     r4, [sp, #0x3C]
        ldr     r5, [sp, #0x90]
        mov     r6, #0
LDVF15:
        mov     r7, r6, lsl #1
        ldrsh   r8, [r12, +r7]
        ldr     r9, [r3]
        ldr     r7, [r0]
        add     r8, r2, r8
        add     r9, r4, r9, lsl #1
        add     r9, r9, r7
        mov     r8, r8, lsl #16
        add     r9, r9, #2
        mov     r7, r8, asr #16
        mul     r8, r7, r7
        mov     r9, r9, asr #2
        mov     r9, r9, lsl #16
        mov     r8, r8, asr #15
        mov     r10, r8, lsl #16
        mov     r8, r9, asr #16
        mul     r9, lr, r8
        mov     r10, r10, asr #16
        mul     r11, r10, r1
        cmp     r11, r9
        ble     LDVF16
        mov     lr, r10
        add     r1, sp, #0xD7, 30
        strh    r7, [r1]
        add     r7, sp, #0x36, 28
        str     r5, [r7]
        add     r7, sp, #0xD1, 30
        mov     r1, r8
        str     r6, [r7]
LDVF16:
        add     r6, r6, #1
        cmp     r6, #8
        add     r3, r3, #4
        add     r0, r0, #4
        blt     LDVF15
        ldr     r0, [sp, #0x360]
        ldr     r12, [sp, #0x54]
        ldr     r5, [sp, #0x1C]
        ldr     r4, [sp, #0x14]
        ldr     r3, [sp, #0x344]
        str     r0, [sp, #0x74]
        str     r1, [sp, #0x98]
        add     r2, sp, #3, 24
        ldrsh   r2, [r2, #0x5C]
        str     r3, [sp, #0x78]
        add     r3, r4, r3, lsl #2
        str     r2, [sp, #0x48]
        sub     r2, r12, #1
        str     r2, [sp, #0x70]
        add     r0, r4, r0, lsl #2
        add     r10, r3, r2, lsl #8
        str     r10, [sp, #0x64]
        ldr     r3, [r10, #0x3C0]
        ldr     r11, [r0, #0x4A0]
        ldr     r9, [r10, #0x3A0]
        ldr     r2, [r0, #0x4C0]
        str     r3, [sp, #0x60]
        ldr     r3, [r0, #0x4E0]
        ldr     r8, [r10, #0x3E0]
        ldr     lr, [r0, #0x500]
        add     r9, r11, r9
        add     r11, sp, #0x35, 28
        add     r3, r3, r8
        str     lr, [sp, #0x5C]
        ldr     r6, [r10, #0x400]
        ldr     lr, [r0, #0x520]
        str     lr, [sp, #0x58]
        ldr     lr, [r0, #0x540]
        ldr     r7, [r10, #0x420]
        str     lr, [sp, #0x50]
        ldr     lr, [r10, #0x440]
        str     lr, [sp, #0x9C]
        ldr     lr, [r0, #0x560]
        str     lr, [sp, #0xA0]
        ldr     r1, [r0, #0x580]
        ldr     lr, [r10, #0x460]
        add     r0, r0, #0x1A, 28
        str     r1, [sp, #0xA4]
        ldr     r10, [r10, #0x480]
        str     r10, [sp, #0xA8]
        ldr     r10, [r4, #0x24]
        str     r10, [sp, #0xAC]
        ldr     r10, [r4, #0x28]
        str     r10, [sp, #0xB0]
        ldr     r10, [r4, #0x2C]
        str     r10, [sp, #0xB4]
        ldr     r10, [r4, #0x30]
        str     r10, [sp, #0xB8]
        ldr     r1, [r4, #0x38]
        ldr     r10, [r4, #0x34]
        str     r1, [sp, #0xBC]
        ldr     r1, [r4, #0x3C]
        str     r1, [sp, #0xC0]
        ldrsh   r11, [r11]
        add     r1, sp, #0xD6, 30
        str     r11, [sp, #0x84]
        ldr     r11, [sp, #0x2C]
        add     r9, r11, r9, lsl #1
        add     r11, sp, #0xD5, 30
        ldrsh   r11, [r11]
        add     r9, r9, #4
        bic     r9, r9, #7
        str     r11, [sp, #0x88]
        ldr     r11, [sp, #0x98]
        strh    r11, [r1]
        add     r11, sp, #3, 24
        ldrsh   r11, [r11, #0x58]
        add     r1, sp, #0xBD, 30
        str     r11, [sp, #0x4C]
        ldr     r11, [sp, #0x7C]
        str     r9, [r11, +r1]
        ldr     r8, [sp, #0x5C]
        ldr     r9, [sp, #0x60]
        ldr     r11, [sp, #0xA8]
        add     r6, r8, r6
        ldr     r8, [sp, #0x58]
        add     r2, r2, r9
        ldr     r9, [sp, #0x9C]
        ldr     r1, [sp, #0x40]
        add     r8, r8, r7
        ldr     r7, [sp, #0x50]
        str     r0, [sp, #0x58]
        ldr     r0, [sp, #0x64]
        add     r9, r7, r9
        ldr     r7, [sp, #0xA0]
        str     r1, [sp, #0x98]
        ldr     r1, [sp, #0x28]
        add     r9, r10, r9, lsl #1
        add     r7, r7, lr
        ldr     lr, [sp, #0xA4]
        ldr     r10, [sp, #0xBC]
        add     r9, r9, #4
        bic     r9, r9, #7
        add     lr, lr, r11
        ldr     r11, [sp, #0xAC]
        add     r7, r10, r7, lsl #1
        ldr     r10, [sp, #0xC0]
        add     r2, r11, r2, lsl #1
        ldr     r11, [sp, #0xB0]
        add     r2, r2, #4
        add     lr, r10, lr, lsl #1
        add     r7, r7, #4
        add     r3, r11, r3, lsl #1
        ldr     r11, [sp, #0xB4]
        add     r3, r3, #4
        add     lr, lr, #4
        bic     r2, r2, #7
        add     r6, r11, r6, lsl #1
        ldr     r11, [sp, #0xB8]
        str     r2, [r1, #4]
        str     r9, [r1, #0x14]
        add     r6, r6, #4
        add     r8, r11, r8, lsl #1
        add     r8, r8, #4
        bic     r11, lr, #7
        bic     r10, r7, #7
        bic     r6, r6, #7
        bic     r8, r8, #7
        bic     r3, r3, #7
        str     r6, [r1, #0xC]
        str     r8, [r1, #0x10]
        str     r10, [r1, #0x18]
        str     r11, [r1, #0x1C]
        str     r3, [r1, #8]
        ldr     r6, [sp, #0x58]
        ldr     r8, [sp, #0x48]
        ldr     r9, [sp, #0x4C]
        ldr     r10, [sp, #0x28]
        ldr     r11, [sp, #0x44]
        mov     lr, #0
        mov     r3, lr
        add     r0, r0, #0xA0
        mov     r7, r4
        mov     r2, r5
        str     r3, [sp, #0x50]
        str     r12, [sp, #0x54]
        str     r5, [sp, #0x1C]
        str     r4, [sp, #0x14]
LDVF17:
        ldr     r4, [r6], #0x20
        ldrsh   r12, [r2], #2
        ldr     r1, [r0], #0x20
        ldr     r3, [r7], #4
        add     r4, r4, r9, lsl #1
        add     r4, r4, r1
        str     r2, [sp, #0x64]
        str     r7, [sp, #0x60]
        str     r0, [sp, #0x5C]
        str     r6, [sp, #0x58]
        ldr     r2, [sp, #0x88]
        ldr     r6, [sp, #0x84]
        ldr     r7, [sp, #0x50]
        ldr     r0, [sp, #0x98]
        add     r12, r8, r12
        add     r3, r3, r4, lsl #1
        mov     r1, r12, lsl #16
        mov     r5, #0
        mov     r12, r11
        mov     r4, r10
LDVF18:
        ldrsh   r8, [r12], #2
        ldr     r9, [r0], #4
        ldr     r10, [r4], #4
        add     r8, r8, r1, asr #16
        mul     r8, r8, r8
        add     r9, r3, r9, lsl #1
        add     r9, r10, r9
        add     r9, r9, #8
        mov     r8, r8, asr #15
        mov     r9, r9, asr #4
        mov     r10, r8, lsl #16
        mov     r8, r9, lsl #16
        mov     r9, r10, asr #16
        mul     r10, r9, r6
        mov     r8, r8, asr #16
        mul     r11, r8, r2
        cmp     r10, r11
        ble     LDVF19
        mov     r2, r9
        add     r7, sp, #0x35, 28
        strh    r8, [r7]
        add     r7, sp, #0xD, 26
        str     lr, [r7]
        add     r6, sp, #0xD5, 30
        add     r7, sp, #0xD3, 30
        strh    r9, [r6]
        str     r5, [r7]
        mov     r6, r8
        mov     r7, #1
LDVF19:
        add     r5, r5, #1
        cmp     r5, #8
        blt     LDVF18
        str     r2, [sp, #0x88]
        str     r6, [sp, #0x84]
        str     r7, [sp, #0x50]
        str     r0, [sp, #0x98]
        ldr     r2, [sp, #0x64]
        ldr     r7, [sp, #0x60]
        ldr     r0, [sp, #0x5C]
        ldr     r6, [sp, #0x58]
        ldr     r8, [sp, #0x48]
        ldr     r9, [sp, #0x4C]
        ldr     r10, [sp, #0x28]
        ldr     r11, [sp, #0x44]
        add     lr, lr, #1
        cmp     lr, #8
        blt     LDVF17
        ldr     r3, [sp, #0x50]
        ldr     r12, [sp, #0x54]
        ldr     r5, [sp, #0x1C]
        ldr     r4, [sp, #0x14]
        cmp     r3, #0
        beq     LDVF20
        ldr     r2, [sp, #0x78]
        str     r12, [sp, #0x68]
        str     r2, [sp, #0x6C]
        ldr     r2, [sp, #0x74]
        str     r2, [sp, #0x348]
LDVF20:
        ldr     r2, [sp, #0x38]
        add     r0, sp, #0xCD, 30
        ldr     r7, [pc, #0x754]
        add     r0, r0, r2
        ldrsh   r8, [r0, #-8]
        ldrsh   r3, [r0, #-6]
        ldr     r0, [sp, #0x24]
        sub     r6, r12, #2
        mov     lr, r4
        mvn     r9, #0
        ldr     r1, [r0, +r8, lsl #2]
        ldr     r0, [r0, +r3, lsl #2]
        mov     r11, #0
        mov     r10, lr
        str     r0, [sp, #0x88]
        ldr     r0, [sp, #0x70]
        add     r2, r4, r0, lsl #8
        mov     r0, r6, lsl #4
        mov     r6, r6, lsl #1
        ldrsh   r6, [r7, +r6]
        add     r0, r0, #0x20
        add     r7, r5, r3, lsl #1
        str     r6, [sp, #0x84]
        ldrsh   r7, [r0, +r7]
        add     r6, r5, r8, lsl #1
        ldrsh   r6, [r6, +r0]
        str     r7, [sp, #0x78]
        add     r7, r2, r8, lsl #2
        add     r2, r2, r3, lsl #2
        add     r2, r2, #0xA0
        str     r9, [sp, #0x74]
        str     r2, [sp, #0x60]
        str     r3, [sp, #0x58]
        ldr     r2, [sp, #0x74]
        ldr     r3, [sp, #0x84]
        mov     r0, #1
        add     r7, r7, #0xA0
        mov     r9, r5
        str     lr, [sp, #0x5C]
        str     r8, [sp, #0x64]
        str     r12, [sp, #0x54]
        str     r5, [sp, #0x1C]
        str     r4, [sp, #0x14]
LDVF21:
        ldr     r4, [r7]
        ldrsh   lr, [r9], #2
        ldr     r12, [r10], #4
        add     r4, r1, r4, lsl #1
        add     lr, r6, lr
        add     r4, r12, r4
        mov     lr, lr, lsl #16
        add     r4, r4, #2
        mov     r12, lr, asr #16
        mul     lr, r12, r12
        mov     r4, r4, asr #2
        mov     r4, r4, lsl #16
        mov     lr, lr, asr #15
        mov     r5, lr, lsl #16
        mov     lr, r4, asr #16
        mul     r4, r2, lr
        mov     r5, r5, asr #16
        mul     r8, r5, r0
        cmp     r8, r4
        ble     LDVF22
        mov     r0, lr
        mov     r2, r5
        add     lr, sp, #0xD7, 30
        strh    r12, [lr]
        ldr     lr, [sp, #0x64]
        add     r12, sp, #0x36, 28
        str     lr, [r12]
        add     r12, sp, #0xD1, 30
        str     r11, [r12]
LDVF22:
        add     r11, r11, #1
        cmp     r11, #8
        add     r7, r7, r3, lsl #2
        blt     LDVF21
        ldr     r3, [sp, #0x58]
        ldr     r12, [sp, #0x54]
        ldr     r4, [sp, #0x14]
        str     r2, [sp, #0x74]
        ldr     r2, [sp, #0x60]
        ldr     lr, [sp, #0x5C]
        ldr     r5, [sp, #0x1C]
        str     r3, [sp, #0x58]
        str     r12, [sp, #0x54]
        str     r4, [sp, #0x14]
        ldr     r1, [sp, #0x74]
        ldr     r3, [sp, #0x78]
        ldr     r12, [sp, #0x84]
        ldr     r4, [sp, #0x88]
        mov     r6, #0
LDVF23:
        mov     r7, r6, lsl #1
        ldrsh   r8, [r5, +r7]
        ldr     r9, [r2]
        ldr     r7, [lr]
        add     r8, r3, r8
        add     r9, r4, r9, lsl #1
        add     r9, r9, r7
        mov     r8, r8, lsl #16
        add     r9, r9, #2
        mov     r7, r8, asr #16
        mul     r8, r7, r7
        mov     r9, r9, asr #2
        mov     r9, r9, lsl #16
        mov     r8, r8, asr #15
        mov     r10, r8, lsl #16
        mov     r8, r9, asr #16
        mul     r9, r1, r8
        mov     r10, r10, asr #16
        mul     r11, r10, r0
        cmp     r11, r9
        ble     LDVF24
        mov     r1, r10
        add     r0, sp, #0xD7, 30
        strh    r7, [r0]
        mov     r0, r8
        ldr     r8, [sp, #0x58]
        add     r7, sp, #0x36, 28
        str     r8, [r7]
        add     r7, sp, #0xD1, 30
        str     r6, [r7]
LDVF24:
        add     r6, r6, #1
        cmp     r6, #8
        add     r2, r2, r12, lsl #2
        add     lr, lr, #4
        blt     LDVF23
        ldr     r4, [sp, #0x14]
        ldr     r12, [sp, #0x54]
        ldr     r2, [sp, #0x344]
        ldr     lr, [sp, #0x360]
        add     r3, sp, #3, 24
        ldrsh   r3, [r3, #0x5C]
        str     r2, [sp, #0x88]
        str     lr, [sp, #0x84]
        add     r2, r2, #5
        str     r3, [sp, #0x5C]
        add     r3, r4, lr, lsl #2
        add     lr, r12, #2
        add     r10, r4, r2, lsl #5
        str     r10, [sp, #0x50]
        ldr     r2, [r10, #0x100]
        add     r8, r3, lr, lsl #8
        ldr     r11, [r8, #0x2A0]
        str     r2, [sp, #0xC0]
        ldr     r3, [r10, #0x104]
        ldr     r2, [r8, #0x2C0]
        str     r3, [sp, #0xBC]
        ldr     r3, [r10, #0x108]
        ldr     r9, [r8, #0x2E0]
        str     r3, [sp, #0xB8]
        ldr     r3, [r8, #0x300]
        str     r3, [sp, #0xB4]
        ldr     r3, [r10, #0x10C]
        ldr     lr, [r8, #0x320]
        str     lr, [sp, #0xB0]
        ldr     lr, [r10, #0x110]
        str     lr, [sp, #0xAC]
        ldr     lr, [r8, #0x340]
        ldr     r7, [r10, #0x114]
        ldr     r6, [r8, #0x360]
        str     r6, [sp, #0xA8]
        ldr     r6, [r10, #0x118]
        ldr     r1, [r8, #0x380]
        add     lr, lr, r7
        add     r8, r8, #0xA0
        str     r1, [sp, #0xA4]
        ldr     r10, [r10, #0x11C]
        str     r10, [sp, #0xA0]
        ldr     r10, [r4, #0x44]
        str     r10, [sp, #0x9C]
        ldr     r10, [r4, #0x48]
        str     r10, [sp, #0x98]
        ldr     r10, [r4, #0x4C]
        str     r10, [sp, #0x78]
        ldr     r10, [r4, #0x50]
        str     r10, [sp, #0x64]
        ldr     r1, [r4, #0x58]
        ldr     r10, [r4, #0x54]
        str     r1, [sp, #0x58]
        ldr     r1, [r4, #0x5C]
        add     lr, r10, lr, lsl #1
        add     lr, lr, #4
        str     r1, [sp, #0x4C]
        ldr     r1, [sp, #0xC0]
        add     r11, r11, r1
        add     r1, sp, #0xD5, 30
        ldrsh   r1, [r1]
        str     r1, [sp, #0x70]
        add     r1, sp, #0x35, 28
        ldrsh   r1, [r1]
        str     r1, [sp, #0x74]
        ldr     r1, [sp]
        add     r11, r1, r11, lsl #1
        add     r1, sp, #0xD6, 30
        strh    r0, [r1]
        add     r0, sp, #3, 24
        ldrsh   r0, [r0, #0x58]
        add     r11, r11, #4
        add     r1, sp, #0xAD, 30
        str     r0, [sp, #0x60]
        bic     r0, r11, #7
        ldr     r11, [sp, #0x80]
        str     r0, [r11, +r1]
        ldr     r0, [sp, #0xBC]
        ldr     r11, [sp, #0xAC]
        ldr     r7, [sp, #0xA8]
        add     r2, r2, r0
        ldr     r0, [sp, #0xB8]
        ldr     r10, [sp, #0x58]
        ldr     r1, [sp, #4]
        add     r6, r7, r6
        add     r0, r9, r0
        ldr     r9, [sp, #0xB4]
        ldr     r7, [sp, #0xA4]
        add     r6, r10, r6, lsl #1
        ldr     r10, [sp, #0x4C]
        add     r9, r9, r3
        ldr     r3, [sp, #0xB0]
        add     r6, r6, #4
        add     r3, r3, r11
        ldr     r11, [sp, #0xA0]
        add     r7, r7, r11
        ldr     r11, [sp, #0x9C]
        add     r7, r10, r7, lsl #1
        add     r7, r7, #4
        add     r2, r11, r2, lsl #1
        ldr     r11, [sp, #0x98]
        add     r2, r2, #4
        bic     r2, r2, #7
        add     r0, r11, r0, lsl #1
        ldr     r11, [sp, #0x78]
        str     r1, [sp, #0x78]
        ldr     r1, [sp, #0x34]
        add     r9, r11, r9, lsl #1
        ldr     r11, [sp, #0x64]
        add     r0, r0, #4
        add     r9, r9, #4
        bic     r0, r0, #7
        add     r3, r11, r3, lsl #1
        bic     r11, r6, #7
        ldr     r6, [sp, #0x20]
        add     r3, r3, #4
        bic     r10, lr, #7
        bic     r9, r9, #7
        bic     r7, r7, #7
        str     r0, [r1, #8]
        str     r9, [r1, #0xC]
        str     r10, [r1, #0x14]
        str     r11, [r1, #0x18]
        str     r7, [r1, #0x1C]
        str     r2, [r1, #4]
        bic     r3, r3, #7
        str     r3, [r1, #0x10]
        ldr     r0, [sp, #0x44]
        str     r5, [sp, #0x1C]
        ldr     r5, [sp, #0x50]
        ldr     r7, [sp, #0x5C]
        ldr     r9, [sp, #0x60]
        ldr     r10, [sp, #0x18]
        ldr     r11, [sp, #0x34]
        mov     lr, #0
        mov     r2, lr
        str     r2, [sp, #0x64]
        str     r12, [sp, #0x54]
        str     r4, [sp, #0x14]
LDVF25:
        ldr     r12, [r8], #0x20
        ldrsh   r3, [r0], #2
        ldr     r1, [r5], #4
        ldr     r2, [r6], #4
        add     r12, r12, r9, lsl #1
        add     r3, r7, r3
        ldr     r7, [sp, #0x64]
        add     r12, r12, r1
        str     r0, [sp, #0x48]
        str     r6, [sp, #0x4C]
        str     r5, [sp, #0x50]
        ldr     r5, [sp, #0x70]
        ldr     r6, [sp, #0x74]
        ldr     r0, [sp, #0x78]
        mov     r1, r3, lsl #16
        add     r2, r2, r12, lsl #1
        mov     r4, #0
        mov     r3, r10
        mov     r12, r11
        str     r8, [sp, #0x58]
LDVF26:
        ldrsh   r8, [r3], #2
        ldr     r9, [r0], #4
        ldr     r10, [r12], #4
        add     r8, r8, r1, asr #16
        mul     r8, r8, r8
        add     r9, r2, r9, lsl #1
        add     r9, r10, r9
        add     r9, r9, #8
        mov     r8, r8, asr #15
        mov     r9, r9, asr #4
        mov     r10, r8, lsl #16
        mov     r8, r9, lsl #16
        mov     r9, r10, asr #16
        mul     r10, r9, r6
        mov     r8, r8, asr #16
        mul     r11, r8, r5
        cmp     r10, r11
        ble     LDVF27
        mov     r5, r9
        add     r7, sp, #0x35, 28
        strh    r8, [r7]
        add     r7, sp, #0xD3, 30
        str     lr, [r7]
        add     r6, sp, #0xD5, 30
        add     r7, sp, #0xD2, 30
        strh    r9, [r6]
        str     r4, [r7]
        mov     r6, r8
        mov     r7, #1
LDVF27:
        add     r4, r4, #1
        cmp     r4, #8
        blt     LDVF26
        str     r5, [sp, #0x70]
        str     r6, [sp, #0x74]
        str     r7, [sp, #0x64]
        str     r0, [sp, #0x78]
        ldr     r0, [sp, #0x48]
        ldr     r6, [sp, #0x4C]
        ldr     r5, [sp, #0x50]
        ldr     r8, [sp, #0x58]
        ldr     r7, [sp, #0x5C]
        ldr     r9, [sp, #0x60]
        ldr     r10, [sp, #0x18]
        ldr     r11, [sp, #0x34]
        add     lr, lr, #1
        cmp     lr, #8
        blt     LDVF25
        ldr     r2, [sp, #0x64]
        ldr     r12, [sp, #0x54]
        ldr     r5, [sp, #0x1C]
        ldr     r4, [sp, #0x14]
        cmp     r2, #0
        beq     LDVF28
        ldr     r2, [sp, #0x84]
        str     r12, [sp, #0x68]
        str     r2, [sp, #0x6C]
        ldr     r2, [sp, #0x88]
        str     r2, [sp, #0x340]
LDVF28:
        ldr     r0, [sp, #0x24]
        add     r12, r12, #1
        cmp     r12, #5
        add     r0, r0, #0x20
        str     r0, [sp, #0x24]
        ldr     r0, [sp, #0x94]
        add     r0, r0, #0x10
        str     r0, [sp, #0x94]
        ldr     r0, [sp, #0x38]
        add     r0, r0, #4
        str     r0, [sp, #0x38]
        blt     LDVF12
        ldr     r9, [sp, #0x6C]
        ldr     r10, [sp, #0x68]
        ldr     r11, [sp, #0x34C]
        ldr     r4, [sp, #0x340]
        ldr     r5, [sp, #0x348]
        ldr     r8, [sp, #8]
        ldr     r7, [sp, #0xC]
        ldr     r6, [sp, #0x10]
        add     r0, r10, r9, lsl #1
        orr     lr, r4, r11, lsl #3
        sub     r0, r0, #3
        orr     lr, lr, r5, lsl #6
        add     r1, r5, #0x10
        orr     r0, lr, r0, lsl #9
        strh    r0, [r7, #2]
        add     lr, r11, #8
        str     r1, [sp, #0x348]
        str     lr, [sp, #0x34C]
        mov     r1, #0x28
        mov     r0, r6
        bl      _ippsZero_16s
        ldr     r0, [sp, #0x34C]
        ldr     r1, [sp, #0x340]
        ldr     r12, [sp, #0x348]
        add     lr, r4, r4, lsl #2
        ldr     r4, [r8, +r0, lsl #2]
        ldr     r1, [r8, +r1, lsl #2]
        ldr     r12, [r8, +r12, lsl #2]
        add     r0, r9, r10, lsl #3
        ldr     r8, [r8, +r0, lsl #2]
        mov     lr, lr, lsl #1
        mov     r0, r1, asr #2
        strh    r0, [r6, +lr]
        add     r11, r11, r11, lsl #2
        mov     lr, r4, asr #2
        mov     r11, r11, lsl #1
        add     r11, r11, #2
        mov     r1, r1, asr #15
        strh    lr, [r6, +r11]
        mov     r4, r4, asr #14
        eor     lr, r4, #2
        eor     r1, r1, #1
        and     r1, r1, #1
        and     lr, lr, #2
        orr     r1, r1, lr
        add     r5, r5, r5, lsl #2
        mov     lr, r12, asr #13
        mov     r4, r5, lsl #1
        mov     r12, r12, asr #2
        add     r4, r4, #4
        strh    r12, [r6, +r4]
        mov     r12, r8, asr #12
        eor     lr, lr, #4
        add     r9, r9, r9, lsl #2
        eor     r12, r12, #8
        add     r10, r9, r10
        and     lr, lr, #4
        and     r12, r12, #8
        orr     r1, r1, lr
        mov     r8, r8, asr #2
        mov     r10, r10, lsl #1
        strh    r8, [r6, +r10]
        orr     r12, r1, r12
        strh    r12, [r7]
        add     sp, sp, #0xD9, 30
        ldmia   sp!, {r4 - r11, pc}
LDVF29:
        ldr     r9, [sp, #0x24]
        cmn     r8, #2, 18
        str     lr, [r9, +r3]
        ldr     r9, [sp]
        str     r12, [r9, +r3]
        ldreq   r3, [sp, #0x30]
        streqh  r12, [r3, +r4]
        beq     LDVF5
        ldr     r3, [sp, #0x30]
        rsb     r8, r8, #0
        strh    r8, [r3, +r4]
        b       LDVF5
LDVF30:
        str     lr, [r0, +r3]
        ldr     r9, [sp, #0x20]
        cmn     r8, #2, 18
        str     r12, [r9, +r3]
        streqh  r12, [r11, +r4]
        rsbne   r8, r8, #0
        strneh  r8, [r11, +r4]
        b       LDVF4
LDVF31:
        ldr     r9, [sp, #0x2C]
        cmn     r8, #2, 18
        str     r12, [r1, +r3]
        str     lr, [r9, +r3]
        ldreq   r8, [sp, #0x18]
        streqh  r12, [r8, +r4]
        beq     LDVF3
        ldr     r9, [sp, #0x18]
        rsb     r8, r8, #0
        strh    r8, [r9, +r4]
        b       LDVF3
LDVF32:
        ldr     r9, [sp, #0x28]
        cmn     r8, #2, 18
        str     lr, [r9, +r3]
        ldr     r9, [sp, #0x34]
        str     r12, [r9, +r3]
        ldreq   r8, [sp, #0x44]
        streqh  r12, [r8, +r4]
        beq     LDVF2
        ldr     r9, [sp, #0x44]
        rsb     r8, r8, #0
        strh    r8, [r9, +r4]
        b       LDVF2
LDVF33:
        cmn     r8, #2, 18
        mov     r3, r2, lsl #2
        str     lr, [r10]
        str     r12, [r7]
        mov     r4, r2, lsl #1
        streqh  r12, [r5, +r4]
        rsbne   r8, r8, #0
        strneh  r8, [r5, +r4]
        b       LDVF1
        .long   LDVF_steps.4079.0.2


        .data
        .align  4


LDVF_steps.4079.0.2:
        .byte   0x01,0x00,0x08,0x00,0x08,0x00


