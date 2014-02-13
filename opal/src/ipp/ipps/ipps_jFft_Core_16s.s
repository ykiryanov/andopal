        .text
        .align  4
        .globl  _ipps_jFft_Core_16s


_ipps_jFft_Core_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x90
        cmp     r1, #2
        mov     r4, r1
        mov     lr, r1, asr #3
        mov     r12, r1, asr #2
        beq     LCCF15
        cmp     r2, #0
        blt     LCCF13
LCCF0:
        cmp     r1, #2
        mov     r6, r1
        ble     LCCF10
        add     r5, r3, #4
        mov     r2, #1
        str     r5, [sp, #0x20]
        str     r3, [sp, #0x24]
LCCF1:
        cmp     r1, #0
        mov     r5, #0
        ble     LCCF3
        mov     r3, r5
        str     r5, [sp, #0xC]
        str     r2, [sp, #0x10]
        str     r6, [sp, #0x14]
        str     r12, [sp]
        str     lr, [sp, #0x18]
        str     r4, [sp, #8]
        str     r1, [sp, #4]
LCCF2:
        ldr     r1, [sp]
        ldr     r2, [r0, +r3, lsl #3]
        add     r5, r0, r3, lsl #3
        add     r12, r3, r1
        add     r9, r1, r12
        add     r1, r1, r9
        ldr     lr, [r0, +r1, lsl #3]
        ldr     r6, [r0, +r12, lsl #3]
        ldr     r11, [r0, +r9, lsl #3]
        add     r4, r0, r9, lsl #3
        add     r7, r6, lr
        add     r6, r0, r1, lsl #3
        add     r10, r2, r11
        add     lr, r10, r7
        str     lr, [r0, +r3, lsl #3]
        ldr     lr, [r6, #4]
        sub     r7, r10, r7
        ldr     r10, [sp, #8]
        str     lr, [sp, #0x34]
        add     lr, r0, r12, lsl #3
        ldr     r8, [lr, #4]
        add     r3, r3, r10
        ldr     r10, [sp, #0x34]
        sub     r2, r2, r11
        sub     r10, r8, r10
        add     r8, r10, r2
        str     r8, [r0, +r9, lsl #3]
        ldr     r8, [r0, +r1, lsl #3]
        ldr     r9, [r0, +r12, lsl #3]
        str     r7, [r0, +r12, lsl #3]
        sub     r2, r2, r10
        str     r2, [r0, +r1, lsl #3]
        ldr     r2, [r6, #4]
        ldr     r1, [lr, #4]
        ldr     r12, [r5, #4]
        ldr     r10, [r4, #4]
        sub     r9, r9, r8
        add     r2, r1, r2
        add     r7, r12, r10
        add     r1, r7, r2
        str     r1, [r5, #4]
        sub     r12, r12, r10
        sub     r7, r7, r2
        str     r7, [lr, #4]
        sub     r1, r12, r9
        str     r1, [r4, #4]
        add     r12, r9, r12
        str     r12, [r6, #4]
        ldr     r1, [sp, #4]
        cmp     r3, r1
        blt     LCCF2
        ldr     r5, [sp, #0xC]
        ldr     r2, [sp, #0x10]
        ldr     r6, [sp, #0x14]
        ldr     r12, [sp]
        ldr     lr, [sp, #0x18]
        ldr     r4, [sp, #8]
        ldr     r1, [sp, #4]
LCCF3:
        cmp     r6, #4
        ble     LCCF9
        cmp     r12, #1
        ble     LCCF9
        mov     r3, #1
        str     r6, [sp, #0x14]
        str     r4, [sp, #8]
LCCF4:
        cmp     r3, lr
        add     r5, r2, r5
        beq     LCCF6
        cmp     r3, r1
        add     r6, r5, r5, lsl #1
        mov     r4, r3
        bge     LCCF8
        ldr     r9, [sp, #0x20]
        ldr     r10, [sp, #0x24]
        mov     r6, r6, lsl #3
        mov     r7, r5, lsl #3
        mov     r8, r5, lsl #4
        str     r8, [sp, #0x2C]
        str     r7, [sp, #0x34]
        str     r6, [sp, #0x30]
        str     r4, [sp, #0x28]
        str     r3, [sp, #0x1C]
        str     r5, [sp, #0xC]
        str     r2, [sp, #0x10]
        str     r12, [sp]
        str     lr, [sp, #0x18]
        str     r1, [sp, #4]
LCCF5:
        ldr     r1, [sp, #0x28]
        ldr     r2, [sp]
        ldr     r7, [sp, #0x30]
        add     r1, r1, r2
        str     r1, [sp, #0x38]
        add     r1, r2, r1
        add     r2, r2, r1
        str     r1, [sp, #0x3C]
        str     r2, [sp, #0x40]
        ldr     r2, [sp, #0x28]
        ldr     r5, [r0, +r1, lsl #3]
        ldr     r1, [sp, #0x38]
        ldr     r4, [r0, +r2, lsl #3]
        add     r7, r10, r7
        ldr     r12, [r0, +r1, lsl #3]
        ldr     r1, [sp, #0x40]
        sub     r11, r4, r5
        add     r5, r4, r5
        ldr     lr, [r0, +r1, lsl #3]
        ldr     r1, [sp, #0x30]
        ldrsh   r3, [r10, +r1]
        ldr     r1, [sp, #0x28]
        add     r1, r0, r1, lsl #3
        str     r1, [sp, #0x44]
        ldr     r1, [r1, #4]
        str     r1, [sp, #0x48]
        ldr     r1, [sp, #0x3C]
        add     r1, r0, r1, lsl #3
        str     r1, [sp, #0x4C]
        ldr     r6, [r1, #4]
        ldr     r1, [sp, #0x40]
        add     r1, r0, r1, lsl #3
        str     r1, [sp, #0x50]
        ldr     r1, [sp, #0x38]
        ldr     r2, [sp, #0x50]
        add     r1, r0, r1, lsl #3
        str     r1, [sp, #0x54]
        ldrsh   r8, [r7, #2]
        ldr     r1, [r1, #4]
        ldr     r2, [r2, #4]
        str     r11, [sp, #0x60]
        str     r5, [sp, #0x88]
        sub     r7, r12, lr
        str     r7, [sp, #0x58]
        ldr     r7, [sp, #0x48]
        sub     r11, r1, r2
        str     r11, [sp, #0x64]
        ldr     r11, [sp, #0x58]
        sub     r7, r7, r6
        str     r7, [sp, #0x5C]
        add     r7, r11, r7
        ldr     r11, [sp, #0x60]
        str     r7, [sp, #0x68]
        ldr     r7, [sp, #0x64]
        add     lr, r12, lr
        ldr     r12, [sp, #0x40]
        str     lr, [sp, #0x8C]
        sub     r7, r11, r7
        ldr     r11, [sp, #0x68]
        bic     r11, r11, #0xFF, 8
        bic     r11, r11, #0xFF, 16
        str     r11, [sp, #0x6C]
        ldr     r11, [sp, #0x2C]
        add     r11, r9, r11
        str     r11, [sp, #0x70]
        ldr     r11, [sp, #0x2C]
        add     r11, r10, r11
        str     r11, [sp, #0x74]
        ldr     r11, [sp, #0x6C]
        mov     r11, r11, asr #1
        str     r11, [sp, #0x6C]
        mul     r11, r11, r8
        str     r11, [sp, #0x78]
        bic     r11, r7, #0xFF, 8
        str     r11, [sp, #0x7C]
        ldr     r11, [sp, #0x68]
        mov     r7, r7, asr #16
        mov     r11, r11, asr #16
        mul     r8, r11, r8
        str     r11, [sp, #0x68]
        ldr     r11, [sp, #0x34]
        str     r8, [sp, #0x80]
        ldr     r8, [sp, #0x7C]
        add     r11, r9, r11
        str     r11, [sp, #0x7C]
        ldr     r11, [sp, #0x78]
        str     r7, [sp, #0x78]
        bic     r8, r8, #0xFF, 16
        mov     r8, r8, asr #1
        str     r8, [sp, #0x84]
        mla     r8, r8, r3, r11
        ldr     r11, [sp, #0x80]
        mla     r7, r7, r3, r11
        ldr     r3, [sp, #0x34]
        add     r8, r8, #1, 20
        add     r3, r10, r3
        str     r3, [sp, #0x80]
        ldr     r3, [sp, #0x30]
        mov     r8, r8, asr #13
        add     r7, r8, r7, lsl #2
        str     r7, [r0, +r12, lsl #3]
        ldr     r12, [sp, #0x30]
        add     r3, r9, r3
        ldrsh   r3, [r3, #2]
        ldrsh   lr, [r9, +r12]
        ldr     r12, [sp, #0x48]
        add     r4, r12, r6
        ldr     r12, [sp, #0x6C]
        mul     r6, r12, r3
        ldr     r12, [sp, #0x68]
        mul     r5, r12, r3
        ldr     r3, [sp, #0x5C]
        add     r12, r1, r2
        ldr     r2, [sp, #0x60]
        ldr     r1, [sp, #0x64]
        sub     r8, r4, r12
        add     r12, r4, r12
        add     r1, r1, r2
        ldr     r2, [sp, #0x58]
        mov     r7, r1, asr #16
        bic     r1, r1, #0xFF, 8
        sub     r3, r3, r2
        ldr     r2, [sp, #0x84]
        mla     r2, r2, lr, r6
        ldr     r6, [sp, #0x78]
        mla     r5, r6, lr, r5
        ldr     lr, [sp, #0x8C]
        ldr     r6, [sp, #0x88]
        sub     lr, r6, lr
        add     r6, r2, #1, 20
        bic     r2, r1, #0xFF, 16
        ldr     r1, [sp, #0x50]
        mov     r6, r6, asr #13
        add     r5, r6, r5, lsl #2
        bic     r6, r3, #0xFF, 8
        str     r5, [r1, #4]
        ldr     r1, [sp, #0x80]
        bic     r6, r6, #0xFF, 16
        mov     r2, r2, asr #1
        ldrsh   r5, [r1, #2]
        ldr     r1, [sp, #0x34]
        mov     r6, r6, asr #1
        mov     r3, r3, asr #16
        ldrsh   r1, [r10, +r1]
        str     r3, [sp, #0x84]
        mul     r3, r3, r5
        mul     r11, r6, r5
        str     r6, [sp, #0x80]
        mov     r6, lr, asr #16
        bic     lr, lr, #0xFF, 8
        mla     r3, r7, r1, r3
        mla     r11, r2, r1, r11
        bic     r1, lr, #0xFF, 16
        mov     r5, r8, asr #16
        bic     r8, r8, #0xFF, 8
        str     r3, [sp, #0x78]
        ldr     lr, [sp, #0x78]
        add     r11, r11, #1, 20
        mov     r3, r1, asr #1
        bic     r1, r8, #0xFF, 16
        mov     r11, r11, asr #13
        add     r11, r11, lr, lsl #2
        ldr     lr, [sp, #0x3C]
        mov     r1, r1, asr #1
        str     r11, [r0, +lr, lsl #3]
        ldr     lr, [sp, #0x7C]
        ldr     r8, [sp, #0x34]
        ldr     r11, [sp, #0x8C]
        ldrsh   lr, [lr, #2]
        ldrsh   r8, [r9, +r8]
        str     r8, [sp, #0x7C]
        ldr     r8, [sp, #0x80]
        ldr     r4, [sp, #0x7C]
        mul     r8, r8, lr
        str     r8, [sp, #0x80]
        ldr     r8, [sp, #0x84]
        mul     lr, r8, lr
        ldr     r8, [sp, #0x88]
        add     r8, r8, r11
        ldr     r11, [sp, #0x80]
        mla     lr, r7, r4, lr
        mla     r2, r2, r4, r11
        add     r2, r2, #1, 20
        mov     r2, r2, asr #13
        add     lr, r2, lr, lsl #2
        ldr     r2, [sp, #0x4C]
        str     lr, [r2, #4]
        ldr     r2, [sp, #0x74]
        ldrsh   lr, [r2, #2]
        ldr     r2, [sp, #0x2C]
        mul     r4, lr, r1
        ldrsh   r2, [r10, +r2]
        mul     lr, lr, r5
        mla     r4, r2, r3, r4
        mla     lr, r2, r6, lr
        ldr     r2, [sp, #0x38]
        add     r4, r4, #1, 20
        mov     r4, r4, asr #13
        add     lr, r4, lr, lsl #2
        str     lr, [r0, +r2, lsl #3]
        ldr     r2, [sp, #0x70]
        ldrsh   lr, [r2, #2]
        ldr     r2, [sp, #0x2C]
        mul     r1, r1, lr
        ldrsh   r2, [r9, +r2]
        mul     lr, r5, lr
        mla     r1, r3, r2, r1
        mla     lr, r6, r2, lr
        add     r1, r1, #1, 20
        mov     r1, r1, asr #13
        add     lr, r1, lr, lsl #2
        ldr     r1, [sp, #0x54]
        str     lr, [r1, #4]
        ldr     r1, [sp, #0x28]
        str     r8, [r0, +r1, lsl #3]
        ldr     r2, [sp, #8]
        add     r1, r1, r2
        ldr     r2, [sp, #4]
        str     r1, [sp, #0x28]
        cmp     r1, r2
        ldr     r1, [sp, #0x44]
        str     r12, [r1, #4]
        blt     LCCF5
        ldr     r3, [sp, #0x1C]
        ldr     r5, [sp, #0xC]
        ldr     r2, [sp, #0x10]
        ldr     r12, [sp]
        ldr     lr, [sp, #0x18]
        ldr     r1, [sp, #4]
        b       LCCF8
LCCF6:
        cmp     r3, r1
        mov     r4, r3
        bge     LCCF8
        str     r3, [sp, #0x1C]
        str     r5, [sp, #0xC]
        str     r2, [sp, #0x10]
        str     r12, [sp]
        str     lr, [sp, #0x18]
        str     r1, [sp, #4]
LCCF7:
        ldr     r1, [sp]
        ldr     r11, [r0, +r4, lsl #3]
        add     r8, r0, r4, lsl #3
        ldr     r10, [r8, #4]
        add     r6, r4, r1
        ldr     r12, [r0, +r6, lsl #3]
        add     r7, r1, r6
        add     r1, r1, r7
        ldr     r3, [r0, +r7, lsl #3]
        ldr     r2, [r0, +r1, lsl #3]
        add     r5, r11, r3
        add     r2, r12, r2
        str     r2, [sp, #0x8C]
        add     r2, r5, r2
        str     r2, [r0, +r4, lsl #3]
        add     r2, r0, r1, lsl #3
        str     r2, [sp, #0x88]
        add     r2, r0, r7, lsl #3
        str     r2, [sp, #0x84]
        ldr     lr, [r2, #4]
        ldr     r2, [sp, #0x88]
        add     r12, r0, r6, lsl #3
        add     r9, r10, lr
        sub     r3, r11, r3
        ldr     r2, [r2, #4]
        str     r12, [sp, #0x80]
        ldr     r12, [r12, #4]
        sub     lr, r10, lr
        add     r2, r12, r2
        add     r12, r9, r2
        str     r12, [r8, #4]
        ldr     r8, [r0, +r6, lsl #3]
        ldr     r12, [r0, +r1, lsl #3]
        sub     r9, r9, r2
        str     r9, [r0, +r6, lsl #3]
        ldr     r6, [sp, #0x88]
        ldr     r2, [sp, #0x80]
        ldr     r9, [r6, #4]
        sub     r6, r8, r12
        rsb     r12, r6, #0
        ldr     r2, [r2, #4]
        mvn     r8, #0xB5, 26
        sub     r2, r2, r9
        add     r10, r2, lr
        sub     lr, lr, r2
        sub     r2, r3, r6
        sub     r9, r12, r3
        bic     r11, lr, #0xFF, 8
        str     r9, [sp, #0x7C]
        bic     r3, r10, #0xFF, 8
        rsb     r6, r8, #0
        bic     r11, r11, #0xFF, 16
        str     r11, [sp, #0x78]
        bic     r12, r2, #0xFF, 8
        bic     r3, r3, #0xFF, 16
        bic     r12, r12, #0xFF, 16
        mov     r3, r3, asr #1
        mul     r11, r3, r6
        mov     r12, r12, asr #1
        bic     r9, r9, #0xFF, 8
        bic     r9, r9, #0xFF, 16
        str     r11, [sp, #0x74]
        mul     r11, r12, r8
        mov     r9, r9, asr #1
        mov     r10, r10, asr #16
        mov     r2, r2, asr #16
        str     r11, [sp, #0x70]
        ldr     r11, [sp, #0x78]
        add     r12, r3, r12
        mul     r3, r12, r6
        mov     r11, r11, asr #1
        str     r11, [sp, #0x78]
        mul     r11, r11, r8
        ldr     r12, [sp, #0x7C]
        mov     lr, lr, asr #16
        add     r3, r3, #1, 20
        mov     r12, r12, asr #16
        str     r11, [sp, #0x6C]
        mul     r11, r9, r6
        str     r11, [sp, #0x68]
        mul     r11, r10, r6
        str     r11, [sp, #0x64]
        mul     r11, r2, r8
        mul     r8, lr, r8
        add     r2, r10, r2
        mul     r2, r2, r6
        str     r11, [sp, #0x60]
        mul     r11, r12, r6
        add     r12, lr, r12
        str     r11, [sp, #0x7C]
        ldr     r11, [sp, #0x8C]
        sub     r11, r11, r5
        ldr     r5, [sp, #0x78]
        add     r9, r5, r9
        mul     r5, r9, r6
        ldr     r9, [sp, #0x80]
        mul     r6, r12, r6
        str     r11, [r9, #4]
        ldr     r12, [sp, #0x70]
        ldr     lr, [sp, #0x74]
        ldr     r9, [sp, #0x6C]
        add     r5, r5, #1, 20
        add     r12, lr, r12
        ldr     lr, [sp, #0x68]
        mov     r5, r5, asr #13
        add     r12, r12, #1, 20
        add     r6, r5, r6, lsl #2
        add     r9, r9, lr
        mov     lr, r3, asr #13
        add     r2, lr, r2, lsl #2
        str     r2, [r0, +r7, lsl #3]
        ldr     r2, [sp, #0x84]
        add     r3, r9, #1, 20
        mov     r12, r12, asr #13
        str     r6, [r2, #4]
        ldr     r2, [sp, #0x60]
        ldr     lr, [sp, #0x64]
        mov     r3, r3, asr #13
        add     r2, lr, r2
        ldr     lr, [sp, #0x7C]
        add     r2, r12, r2, lsl #2
        add     r8, r8, lr
        ldr     lr, [sp, #8]
        add     r8, r3, r8, lsl #2
        ldr     r3, [sp, #4]
        str     r2, [r0, +r1, lsl #3]
        ldr     r1, [sp, #0x88]
        add     r4, r4, lr
        cmp     r4, r3
        str     r8, [r1, #4]
        blt     LCCF7
        ldr     r3, [sp, #0x1C]
        ldr     r5, [sp, #0xC]
        ldr     r2, [sp, #0x10]
        ldr     r12, [sp]
        ldr     lr, [sp, #0x18]
        ldr     r1, [sp, #4]
LCCF8:
        add     r3, r3, #1
        cmp     r3, r12
        blt     LCCF4
        ldr     r6, [sp, #0x14]
        ldr     r4, [sp, #8]
LCCF9:
        mov     r6, r6, asr #2
        cmp     r6, #2
        mov     lr, lr, asr #2
        mov     r4, r4, asr #2
        mov     r12, r12, asr #2
        mov     r2, r2, lsl #2
        bgt     LCCF1
LCCF10:
        cmp     r6, #1
        ble     LCCF12
        cmp     r1, #0
        ble     LCCF12
        sub     r3, r0, #4
        mov     r2, #0
        sub     r0, r0, #0xC
LCCF11:
        ldr     r12, [r0, #0xC]
        ldr     lr, [r3, #0xC]
        add     r2, r2, #2
        cmp     r2, r1
        add     r4, r12, lr
        str     r4, [r0, #0xC]
        sub     r12, r12, lr
        str     r12, [r3, #0xC]
        ldr     r12, [r0, #0x10]
        ldr     lr, [r3, #0x10]
        add     r4, r12, lr
        str     r4, [r0, #0x10]!
        sub     r12, r12, lr
        str     r12, [r3, #0x10]!
        blt     LCCF11
LCCF12:
        add     sp, sp, #0x90
        ldmia   sp!, {r4 - r11, pc}
LCCF13:
        mov     r5, r1, asr #1
        cmp     r5, #1
        sub     r2, r1, #1
        ble     LCCF0
        mov     r2, r2, lsl #3
        add     r2, r2, #0xC
        add     r2, r2, r0
        sub     r5, r5, #1
        add     r6, r0, #4
LCCF14:
        ldr     r9, [r6, #4]
        ldr     r7, [r6, #8]
        ldr     r8, [r2, #-0xC]
        str     r9, [r2, #-0xC]
        ldr     r9, [r2, #-8]
        str     r7, [r2, #-8]!
        str     r8, [r6, #4]
        subs    r5, r5, #1
        str     r9, [r6, #8]!
        bne     LCCF14
        b       LCCF0
LCCF15:
        ldr     r12, [r0]
        ldr     lr, [r0, #8]
        ldr     r2, [r0, #0xC]
        ldr     r1, [r0, #4]
        add     r3, lr, r12
        str     r3, [r0]
        sub     r12, r12, lr
        add     r3, r2, r1
        sub     r1, r1, r2
        str     r12, [r0, #8]
        str     r3, [r0, #4]
        str     r1, [r0, #0xC]
        add     sp, sp, #0x90
        ldmia   sp!, {r4 - r11, pc}


