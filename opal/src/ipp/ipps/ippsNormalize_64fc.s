        .text
        .align  4
        .globl  _ippsNormalize_64fc


_ippsNormalize_64fc:
        mov     r12, sp
        stmdb   sp!, {r3}
        stmdb   sp!, {r4 - r12, lr}
        sub     r11, r12, #4
        sub     sp, sp, #0x60
        ldr     r4, [r11, #0x10]
        ldr     r8, [r11, #0x14]
        mov     r7, r0
        cmp     r7, #0
        mov     r6, r1
        mov     r5, r2
        beq     LBBQ14
        cmp     r6, #0
        beq     LBBQ14
        cmp     r5, #1
        blt     LBBQ11
        bic     r1, r8, #2, 2
        mov     r0, r4
        mov     r2, #0
        mov     r3, #1, 12
        bl      __ltdf2
        cmp     r0, #0
        blt     LBBQ10
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        mov     r2, r4
        mov     r0, #0
        mov     r3, r8
        bl      __divdf3
        cmp     r5, #8
        mov     r4, r1
        blt     LBBQ5
        mov     r2, r5, asr #3
        cmp     r2, #0
        and     r1, r5, #7
        ble     LBBQ1
        ldr     r8, [r11]
        ldr     r12, [r11, #4]
        sub     r3, r6, #0x24
        str     r3, [r11, #-0x48]
        sub     r3, r7, #0x34
        str     r3, [r11, #-0x4C]
        sub     r3, r6, #0x34
        str     r3, [r11, #-0x50]
        sub     r3, r7, #0x44
        str     r3, [r11, #-0x54]
        sub     r3, r6, #0x44
        str     r3, [r11, #-0x58]
        str     r12, [r11, #-0x80]
        ldr     r12, [r11, #8]
        sub     r3, r7, #0x54
        str     r3, [r11, #-0x5C]
        sub     r3, r6, #0x54
        str     r12, [r11, #-0x88]
        ldr     r12, [r11, #0xC]
        str     r3, [r11, #-0x60]
        sub     r3, r7, #0x64
        str     r3, [r11, #-0x64]
        sub     r3, r6, #0x64
        str     r12, [r11, #-0x84]
        str     r3, [r11, #-0x68]
        sub     r12, r6, #0x14
        sub     r3, r7, #0x74
        sub     r10, r7, #4
        sub     r9, r6, #4
        str     r12, [r11, #-0x70]
        str     r3, [r11, #-0x6C]
        sub     lr, r7, #0x14
        sub     r12, r7, #0x24
        sub     r3, r6, #0x74
        str     r9, [r11, #-0x38]
        str     r10, [r11, #-0x34]
        str     r6, [r11, #-0x78]
        str     r7, [r11, #-0x74]
        ldr     r10, [r11, #-0x58]
        ldr     r6, [r11, #-0x84]
        ldr     r7, [r11, #-0x88]
        ldr     r9, [r11, #-0x80]
        str     r5, [r11, #-0x7C]
        str     r3, [r11, #-0x44]
        str     r12, [r11, #-0x30]
        str     lr, [r11, #-0x2C]
        str     r1, [r11, #-0x40]
        str     r2, [r11, #-0x3C]
        mov     r5, r0
LBBQ0:
        ldr     r12, [r11, #-0x6C]
        mov     r2, r8
        mov     r3, r9
        ldr     r0, [r12, #0x74]
        ldr     r1, [r12, #0x78]
        bl      __subdf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r12, [r11, #-0x44]
        str     r0, [r12, #0x74]
        str     r1, [r12, #0x78]
        ldr     r12, [r11, #-0x6C]
        mov     r2, r7
        mov     r3, r6
        ldr     r0, [r12, #0x7C]
        ldr     r1, [r12, #0x80]
        bl      __subdf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r12, [r11, #-0x44]
        mov     r2, r8
        str     r0, [r12, #0x7C]
        ldr     r12, [r11, #-0x44]
        mov     r3, r9
        str     r1, [r12, #0x80]
        ldr     r12, [r11, #-0x64]
        ldr     r0, [r12, #0x74]
        ldr     r1, [r12, #0x78]
        bl      __subdf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r12, [r11, #-0x68]
        str     r0, [r12, #0x74]
        str     r1, [r12, #0x78]
        ldr     r12, [r11, #-0x64]
        mov     r2, r7
        mov     r3, r6
        ldr     r0, [r12, #0x7C]
        ldr     r1, [r12, #0x80]
        bl      __subdf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r12, [r11, #-0x68]
        str     r0, [r12, #0x7C]
        str     r1, [r12, #0x80]
        ldr     r12, [r11, #-0x5C]
        mov     r2, r8
        mov     r3, r9
        ldr     r0, [r12, #0x74]
        ldr     r1, [r12, #0x78]
        bl      __subdf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r12, [r11, #-0x60]
        str     r0, [r12, #0x74]
        str     r1, [r12, #0x78]
        ldr     r12, [r11, #-0x5C]
        mov     r2, r7
        mov     r3, r6
        ldr     r0, [r12, #0x7C]
        ldr     r1, [r12, #0x80]
        bl      __subdf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r12, [r11, #-0x60]
        str     r0, [r12, #0x7C]
        str     r1, [r12, #0x80]
        ldr     r12, [r11, #-0x54]
        mov     r2, r8
        mov     r3, r9
        ldr     r0, [r12, #0x74]
        ldr     r1, [r12, #0x78]
        bl      __subdf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        str     r0, [r10, #0x74]
        str     r1, [r10, #0x78]
        ldr     r12, [r11, #-0x54]
        mov     r2, r7
        mov     r3, r6
        ldr     r0, [r12, #0x7C]
        ldr     r1, [r12, #0x80]
        bl      __subdf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        str     r0, [r10, #0x7C]
        str     r1, [r10, #0x80]!
        ldr     r12, [r11, #-0x4C]
        mov     r2, r8
        mov     r3, r9
        ldr     r0, [r12, #0x74]
        ldr     r1, [r12, #0x78]
        bl      __subdf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r12, [r11, #-0x50]
        str     r0, [r12, #0x74]
        str     r1, [r12, #0x78]
        ldr     r12, [r11, #-0x4C]
        mov     r2, r7
        mov     r3, r6
        ldr     r0, [r12, #0x7C]
        ldr     r1, [r12, #0x80]
        bl      __subdf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r12, [r11, #-0x50]
        mov     r2, r8
        str     r0, [r12, #0x7C]
        ldr     r12, [r11, #-0x50]
        mov     r3, r9
        str     r1, [r12, #0x80]
        ldr     r12, [r11, #-0x30]
        ldr     r0, [r12, #0x74]
        ldr     r1, [r12, #0x78]
        bl      __subdf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r12, [r11, #-0x48]
        str     r0, [r12, #0x74]
        str     r1, [r12, #0x78]
        ldr     r12, [r11, #-0x30]
        mov     r2, r7
        mov     r3, r6
        ldr     r0, [r12, #0x7C]
        ldr     r1, [r12, #0x80]
        bl      __subdf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r12, [r11, #-0x48]
        str     r0, [r12, #0x7C]
        str     r1, [r12, #0x80]
        ldr     r12, [r11, #-0x2C]
        mov     r2, r8
        mov     r3, r9
        ldr     r0, [r12, #0x74]
        ldr     r1, [r12, #0x78]
        bl      __subdf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r12, [r11, #-0x70]
        str     r0, [r12, #0x74]
        str     r1, [r12, #0x78]
        ldr     r12, [r11, #-0x2C]
        mov     r2, r7
        mov     r3, r6
        ldr     r0, [r12, #0x7C]
        ldr     r1, [r12, #0x80]
        bl      __subdf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r12, [r11, #-0x70]
        str     r0, [r12, #0x7C]
        str     r1, [r12, #0x80]
        ldr     r12, [r11, #-0x34]
        mov     r2, r8
        mov     r3, r9
        ldr     r0, [r12, #0x74]
        ldr     r1, [r12, #0x78]
        bl      __subdf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r12, [r11, #-0x38]
        str     r0, [r12, #0x74]
        str     r1, [r12, #0x78]
        ldr     r12, [r11, #-0x34]
        mov     r2, r7
        mov     r3, r6
        ldr     r0, [r12, #0x7C]
        ldr     r1, [r12, #0x80]
        bl      __subdf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     lr, [r11, #-0x38]
        str     r0, [lr, #0x7C]
        str     r1, [lr, #0x80]!
        ldr     r12, [r11, #-0x3C]
        ldr     r0, [r11, #-0x34]
        str     lr, [r11, #-0x38]
        ldr     lr, [r11, #-0x2C]
        subs    r12, r12, #1
        str     r12, [r11, #-0x3C]
        add     lr, lr, #0x80
        str     lr, [r11, #-0x2C]
        ldr     lr, [r11, #-0x70]
        add     r0, r0, #0x80
        str     r0, [r11, #-0x34]
        add     lr, lr, #0x80
        str     lr, [r11, #-0x70]
        ldr     lr, [r11, #-0x30]
        add     lr, lr, #0x80
        str     lr, [r11, #-0x30]
        ldr     lr, [r11, #-0x48]
        add     lr, lr, #0x80
        str     lr, [r11, #-0x48]
        ldr     lr, [r11, #-0x4C]
        add     lr, lr, #0x80
        str     lr, [r11, #-0x4C]
        ldr     lr, [r11, #-0x50]
        add     lr, lr, #0x80
        str     lr, [r11, #-0x50]
        ldr     lr, [r11, #-0x54]
        add     lr, lr, #0x80
        str     lr, [r11, #-0x54]
        ldr     lr, [r11, #-0x5C]
        add     lr, lr, #0x80
        str     lr, [r11, #-0x5C]
        ldr     lr, [r11, #-0x60]
        add     lr, lr, #0x80
        str     lr, [r11, #-0x60]
        ldr     lr, [r11, #-0x64]
        add     lr, lr, #0x80
        str     lr, [r11, #-0x64]
        ldr     lr, [r11, #-0x68]
        add     lr, lr, #0x80
        str     lr, [r11, #-0x68]
        ldr     lr, [r11, #-0x6C]
        add     lr, lr, #0x80
        str     lr, [r11, #-0x6C]
        ldr     lr, [r11, #-0x44]
        add     lr, lr, #0x80
        str     lr, [r11, #-0x44]
        bne     LBBQ0
        mov     r0, r5
        ldr     r1, [r11, #-0x40]
        ldr     r5, [r11, #-0x7C]
        ldr     r6, [r11, #-0x78]
        ldr     r7, [r11, #-0x74]
LBBQ1:
        sub     r10, r5, r1
        cmp     r10, r5
        bge     LBBQ9
        sub     r12, r5, r10
        cmp     r12, #5
        blt     LBBQ12
        ldr     r12, [r11]
        ldr     r3, [r11, #4]
        ldr     r9, [r11, #8]
        ldr     r8, [r11, #0xC]
        mov     lr, r10, lsl #4
        sub     r2, lr, #4
        add     r1, r2, r7
        sub     lr, r5, #5
        add     r2, r2, r6
        str     r10, [r11, #-0x84]
        str     r5, [r11, #-0x7C]
        str     r6, [r11, #-0x78]
        str     r7, [r11, #-0x74]
        str     r12, [r11, #-0x88]
        str     lr, [r11, #-0x80]
        mov     r5, r0
        mov     r10, r1
        mov     r7, r2
        mov     r6, r3
LBBQ2:
        ldr     r12, [r11, #-0x84]
        ldr     r2, [r11, #-0x88]
        mov     r3, r6
        add     r12, r12, #4
        str     r12, [r11, #-0x84]
        ldr     r0, [r10, #4]
        ldr     r1, [r10, #8]
        bl      __subdf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        str     r0, [r7, #4]
        str     r1, [r7, #8]
        ldr     r0, [r10, #0xC]
        ldr     r1, [r10, #0x10]
        mov     r2, r9
        mov     r3, r8
        bl      __subdf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        str     r0, [r7, #0xC]
        str     r1, [r7, #0x10]
        ldr     r0, [r10, #0x14]
        ldr     r1, [r10, #0x18]
        ldr     r2, [r11, #-0x88]
        mov     r3, r6
        bl      __subdf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        str     r0, [r7, #0x14]
        str     r1, [r7, #0x18]
        ldr     r0, [r10, #0x1C]
        ldr     r1, [r10, #0x20]
        mov     r2, r9
        mov     r3, r8
        bl      __subdf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        str     r0, [r7, #0x1C]
        str     r1, [r7, #0x20]
        ldr     r0, [r10, #0x24]
        ldr     r1, [r10, #0x28]
        ldr     r2, [r11, #-0x88]
        mov     r3, r6
        bl      __subdf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        str     r0, [r7, #0x24]
        str     r1, [r7, #0x28]
        ldr     r0, [r10, #0x2C]
        ldr     r1, [r10, #0x30]
        mov     r2, r9
        mov     r3, r8
        bl      __subdf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        str     r0, [r7, #0x2C]
        str     r1, [r7, #0x30]
        ldr     r0, [r10, #0x34]
        ldr     r1, [r10, #0x38]
        ldr     r2, [r11, #-0x88]
        mov     r3, r6
        bl      __subdf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        str     r0, [r7, #0x34]
        str     r1, [r7, #0x38]
        ldr     r0, [r10, #0x3C]
        ldr     r1, [r10, #0x40]!
        mov     r2, r9
        mov     r3, r8
        bl      __subdf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        str     r0, [r7, #0x3C]
        str     r1, [r7, #0x40]!
        ldr     r12, [r11, #-0x80]
        ldr     lr, [r11, #-0x84]
        cmp     lr, r12
        ble     LBBQ2
        mov     r0, r5
        mov     r3, r6
        ldr     r12, [r11, #-0x88]
        ldr     r10, [r11, #-0x84]
        ldr     r5, [r11, #-0x7C]
        ldr     r6, [r11, #-0x78]
        ldr     r7, [r11, #-0x74]
LBBQ3:
        mov     lr, r10, lsl #4
        sub     lr, lr, #4
        str     r5, [r11, #-0x7C]
        add     r7, lr, r7
        add     r6, lr, r6
        str     r3, [r11, #-0x44]
        str     r12, [r11, #-0x88]
        mov     r5, r0
LBBQ4:
        ldr     r0, [r7, #4]
        ldr     r1, [r7, #8]
        ldr     r2, [r11, #-0x88]
        ldr     r3, [r11, #-0x44]
        bl      __subdf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        str     r0, [r6, #4]
        str     r1, [r6, #8]
        ldr     r0, [r7, #0xC]
        ldr     r1, [r7, #0x10]!
        mov     r2, r9
        mov     r3, r8
        bl      __subdf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        str     r0, [r6, #0xC]
        str     r1, [r6, #0x10]!
        ldr     r12, [r11, #-0x7C]
        add     r10, r10, #1
        cmp     r10, r12
        blt     LBBQ4
        mov     r0, #0
        ldmdb   r11, {r4 - r11, sp, pc}
LBBQ5:
        cmp     r5, #5
        mov     r10, #0
        blt     LBBQ13
        ldr     r12, [r11]
        ldr     r3, [r11, #4]
        ldr     r9, [r11, #8]
        ldr     r8, [r11, #0xC]
        sub     lr, r5, #5
        sub     r2, r7, #4
        sub     r1, r6, #4
        str     r10, [r11, #-0x30]
        str     r5, [r11, #-0x7C]
        str     r6, [r11, #-0x78]
        str     r7, [r11, #-0x74]
        str     r12, [r11, #-0x80]
        str     lr, [r11, #-0x2C]
        mov     r5, r0
        mov     r10, r1
        mov     r7, r2
        mov     r6, r3
LBBQ6:
        ldr     r12, [r11, #-0x30]
        ldr     r2, [r11, #-0x80]
        mov     r3, r6
        add     r12, r12, #4
        str     r12, [r11, #-0x30]
        ldr     r0, [r7, #4]
        ldr     r1, [r7, #8]
        bl      __subdf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        str     r0, [r10, #4]
        str     r1, [r10, #8]
        ldr     r0, [r7, #0xC]
        ldr     r1, [r7, #0x10]
        mov     r2, r9
        mov     r3, r8
        bl      __subdf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        str     r0, [r10, #0xC]
        str     r1, [r10, #0x10]
        ldr     r0, [r7, #0x14]
        ldr     r1, [r7, #0x18]
        ldr     r2, [r11, #-0x80]
        mov     r3, r6
        bl      __subdf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        str     r0, [r10, #0x14]
        str     r1, [r10, #0x18]
        ldr     r0, [r7, #0x1C]
        ldr     r1, [r7, #0x20]
        mov     r2, r9
        mov     r3, r8
        bl      __subdf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        str     r0, [r10, #0x1C]
        str     r1, [r10, #0x20]
        ldr     r0, [r7, #0x24]
        ldr     r1, [r7, #0x28]
        ldr     r2, [r11, #-0x80]
        mov     r3, r6
        bl      __subdf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        str     r0, [r10, #0x24]
        str     r1, [r10, #0x28]
        ldr     r0, [r7, #0x2C]
        ldr     r1, [r7, #0x30]
        mov     r2, r9
        mov     r3, r8
        bl      __subdf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        str     r0, [r10, #0x2C]
        str     r1, [r10, #0x30]
        ldr     r0, [r7, #0x34]
        ldr     r1, [r7, #0x38]
        ldr     r2, [r11, #-0x80]
        mov     r3, r6
        bl      __subdf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        str     r0, [r10, #0x34]
        str     r1, [r10, #0x38]
        ldr     r0, [r7, #0x3C]
        ldr     r1, [r7, #0x40]!
        mov     r2, r9
        mov     r3, r8
        bl      __subdf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        str     r0, [r10, #0x3C]
        str     r1, [r10, #0x40]!
        ldr     lr, [r11, #-0x2C]
        ldr     r12, [r11, #-0x30]
        cmp     r12, lr
        ble     LBBQ6
        mov     r0, r5
        mov     r3, r6
        ldr     r12, [r11, #-0x80]
        ldr     r10, [r11, #-0x30]
        ldr     r5, [r11, #-0x7C]
        ldr     r6, [r11, #-0x78]
        ldr     r7, [r11, #-0x74]
LBBQ7:
        mov     lr, r10, lsl #4
        sub     lr, lr, #4
        str     r5, [r11, #-0x7C]
        add     r7, lr, r7
        add     r6, lr, r6
        str     r3, [r11, #-0x84]
        str     r12, [r11, #-0x80]
        mov     r5, r0
LBBQ8:
        ldr     r0, [r7, #4]
        ldr     r1, [r7, #8]
        ldr     r2, [r11, #-0x80]
        ldr     r3, [r11, #-0x84]
        bl      __subdf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        str     r0, [r6, #4]
        str     r1, [r6, #8]
        ldr     r0, [r7, #0xC]
        ldr     r1, [r7, #0x10]!
        mov     r2, r9
        mov     r3, r8
        bl      __subdf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        str     r0, [r6, #0xC]
        str     r1, [r6, #0x10]!
        ldr     r12, [r11, #-0x7C]
        add     r10, r10, #1
        cmp     r10, r12
        blt     LBBQ8
LBBQ9:
        mov     r0, #0
        ldmdb   r11, {r4 - r11, sp, pc}
LBBQ10:
        mvn     r0, #9
        ldmdb   r11, {r4 - r11, sp, pc}
LBBQ11:
        mvn     r0, #5
        ldmdb   r11, {r4 - r11, sp, pc}
LBBQ12:
        ldr     r12, [r11]
        ldr     r3, [r11, #4]
        ldr     r9, [r11, #8]
        ldr     r8, [r11, #0xC]
        b       LBBQ3
LBBQ13:
        ldr     r12, [r11]
        ldr     r3, [r11, #4]
        ldr     r9, [r11, #8]
        ldr     r8, [r11, #0xC]
        b       LBBQ7
LBBQ14:
        mvn     r0, #7
        ldmdb   r11, {r4 - r11, sp, pc}


