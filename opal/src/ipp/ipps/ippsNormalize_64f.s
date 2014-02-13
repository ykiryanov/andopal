        .text
        .align  4
        .globl  _ippsNormalize_64f


_ippsNormalize_64f:
        mov     r12, sp
        stmdb   sp!, {r3}
        stmdb   sp!, {r4 - r12, lr}
        sub     r11, r12, #4
        sub     sp, sp, #0x54
        ldr     r6, [r11, #4]
        ldr     r4, [r11, #8]
        ldr     r10, [r11, #0xC]
        mov     r9, r0
        cmp     r9, #0
        mov     r8, r1
        mov     r7, r2
        mov     r5, r3
        beq     LBBR12
        cmp     r8, #0
        beq     LBBR12
        cmp     r7, #1
        blt     LBBR11
        bic     r1, r10, #2, 2
        mov     r0, r4
        mov     r2, #0
        mov     r3, #1, 12
        bl      __ltdf2
        cmp     r0, #0
        blt     LBBR10
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        mov     r2, r4
        mov     r0, #0
        mov     r3, r10
        bl      __divdf3
        cmp     r7, #8
        str     r0, [r11, #-0x6C]
        mov     r4, r1
        blt     LBBR5
        mov     r2, r7, asr #3
        cmp     r2, #0
        and     r1, r7, #7
        ble     LBBR1
        sub     r3, r8, #0x1C
        str     r3, [r11, #-0x68]
        sub     r3, r9, #0x1C
        str     r3, [r11, #-0x64]
        sub     r3, r8, #0x24
        str     r3, [r11, #-0x60]
        sub     r3, r9, #0x24
        str     r3, [r11, #-0x5C]
        sub     r3, r8, #0x2C
        str     r3, [r11, #-0x58]
        sub     r3, r9, #0x2C
        str     r3, [r11, #-0x54]
        sub     r3, r8, #0x34
        str     r3, [r11, #-0x50]
        sub     r3, r9, #0x34
        sub     r12, r8, #4
        str     r3, [r11, #-0x4C]
        sub     r3, r8, #0x3C
        str     r12, [r11, #-0x7C]
        sub     r12, r8, #0x14
        str     r3, [r11, #-0x48]
        sub     r3, r9, #0x3C
        str     r12, [r11, #-0x40]
        sub     r0, r8, #0xC
        sub     lr, r9, #0xC
        sub     r12, r9, #0x14
        str     r3, [r11, #-0x44]
        sub     r10, r9, #4
        str     r7, [r11, #-0x78]
        str     r8, [r11, #-0x74]
        str     r9, [r11, #-0x70]
        ldr     r8, [r11, #-0x44]
        ldr     r9, [r11, #-0x64]
        ldr     r7, [r11, #-0x6C]
        str     r12, [r11, #-0x30]
        str     lr, [r11, #-0x2C]
        str     r0, [r11, #-0x34]
        str     r1, [r11, #-0x3C]
        str     r2, [r11, #-0x38]
LBBR0:
        ldr     r0, [r8, #0x3C]
        ldr     r1, [r8, #0x40]!
        mov     r2, r5
        mov     r3, r6
        bl      __subdf3
        mov     r2, r7
        mov     r3, r4
        bl      __muldf3
        ldr     r12, [r11, #-0x48]
        str     r0, [r12, #0x3C]
        str     r1, [r12, #0x40]
        ldr     r12, [r11, #-0x4C]
        mov     r2, r5
        mov     r3, r6
        ldr     r0, [r12, #0x3C]
        ldr     r1, [r12, #0x40]
        bl      __subdf3
        mov     r2, r7
        mov     r3, r4
        bl      __muldf3
        ldr     r12, [r11, #-0x50]
        str     r0, [r12, #0x3C]
        str     r1, [r12, #0x40]
        ldr     r12, [r11, #-0x54]
        mov     r2, r5
        mov     r3, r6
        ldr     r0, [r12, #0x3C]
        ldr     r1, [r12, #0x40]
        bl      __subdf3
        mov     r2, r7
        mov     r3, r4
        bl      __muldf3
        ldr     r12, [r11, #-0x58]
        str     r0, [r12, #0x3C]
        str     r1, [r12, #0x40]
        ldr     r12, [r11, #-0x5C]
        mov     r2, r5
        mov     r3, r6
        ldr     r0, [r12, #0x3C]
        ldr     r1, [r12, #0x40]
        bl      __subdf3
        mov     r2, r7
        mov     r3, r4
        bl      __muldf3
        ldr     r12, [r11, #-0x60]
        str     r0, [r12, #0x3C]
        str     r1, [r12, #0x40]
        ldr     r0, [r9, #0x3C]
        ldr     r1, [r9, #0x40]!
        mov     r2, r5
        mov     r3, r6
        bl      __subdf3
        mov     r2, r7
        mov     r3, r4
        bl      __muldf3
        ldr     r12, [r11, #-0x68]
        str     r0, [r12, #0x3C]
        str     r1, [r12, #0x40]
        ldr     r12, [r11, #-0x30]
        mov     r2, r5
        mov     r3, r6
        ldr     r0, [r12, #0x3C]
        ldr     r1, [r12, #0x40]
        bl      __subdf3
        mov     r2, r7
        mov     r3, r4
        bl      __muldf3
        ldr     r12, [r11, #-0x40]
        str     r0, [r12, #0x3C]
        str     r1, [r12, #0x40]
        ldr     r12, [r11, #-0x2C]
        mov     r2, r5
        mov     r3, r6
        ldr     r0, [r12, #0x3C]
        ldr     r1, [r12, #0x40]
        bl      __subdf3
        mov     r2, r7
        mov     r3, r4
        bl      __muldf3
        ldr     r12, [r11, #-0x34]
        str     r0, [r12, #0x3C]
        str     r1, [r12, #0x40]
        ldr     r0, [r10, #0x3C]
        ldr     r1, [r10, #0x40]!
        mov     r2, r5
        mov     r3, r6
        bl      __subdf3
        mov     r2, r7
        mov     r3, r4
        bl      __muldf3
        ldr     r12, [r11, #-0x7C]
        str     r1, [r12, #0x40]
        str     r0, [r12, #0x3C]
        ldr     r0, [r11, #-0x38]
        add     r12, r12, #0x40
        str     r12, [r11, #-0x7C]
        subs    r0, r0, #1
        str     r0, [r11, #-0x38]
        ldr     r0, [r11, #-0x34]
        add     r0, r0, #0x40
        str     r0, [r11, #-0x34]
        ldr     r0, [r11, #-0x2C]
        add     r0, r0, #0x40
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x40]
        add     r0, r0, #0x40
        str     r0, [r11, #-0x40]
        ldr     r0, [r11, #-0x30]
        add     r0, r0, #0x40
        str     r0, [r11, #-0x30]
        ldr     r0, [r11, #-0x68]
        add     r0, r0, #0x40
        str     r0, [r11, #-0x68]
        ldr     r0, [r11, #-0x60]
        add     r0, r0, #0x40
        str     r0, [r11, #-0x60]
        ldr     r0, [r11, #-0x5C]
        add     r0, r0, #0x40
        str     r0, [r11, #-0x5C]
        ldr     r0, [r11, #-0x58]
        add     r0, r0, #0x40
        str     r0, [r11, #-0x58]
        ldr     r0, [r11, #-0x54]
        add     r0, r0, #0x40
        str     r0, [r11, #-0x54]
        ldr     r0, [r11, #-0x50]
        add     r0, r0, #0x40
        str     r0, [r11, #-0x50]
        ldr     r0, [r11, #-0x4C]
        add     r0, r0, #0x40
        str     r0, [r11, #-0x4C]
        ldr     r0, [r11, #-0x48]
        add     r0, r0, #0x40
        str     r0, [r11, #-0x48]
        ldr     r0, [r11, #-0x38]
        bne     LBBR0
        ldr     r1, [r11, #-0x3C]
        ldr     r7, [r11, #-0x78]
        ldr     r8, [r11, #-0x74]
        ldr     r9, [r11, #-0x70]
LBBR1:
        sub     r10, r7, r1
        cmp     r10, r7
        bge     LBBR9
        sub     r12, r7, r10
        cmp     r12, #6
        blt     LBBR3
        mov     r12, r10, lsl #3
        sub     lr, r12, #4
        sub     r12, r7, #6
        str     r7, [r11, #-0x78]
        ldr     r7, [r11, #-0x6C]
        add     r0, lr, r8
        add     r1, lr, r9
        str     r8, [r11, #-0x74]
        str     r9, [r11, #-0x70]
        str     r12, [r11, #-0x7C]
        mov     r9, r0
        mov     r8, r1
LBBR2:
        ldr     r0, [r8, #4]
        ldr     r1, [r8, #8]
        mov     r2, r5
        mov     r3, r6
        bl      __subdf3
        mov     r2, r7
        mov     r3, r4
        bl      __muldf3
        str     r0, [r9, #4]
        str     r1, [r9, #8]
        ldr     r0, [r8, #0xC]
        ldr     r1, [r8, #0x10]
        mov     r2, r5
        mov     r3, r6
        bl      __subdf3
        mov     r2, r7
        mov     r3, r4
        bl      __muldf3
        str     r0, [r9, #0xC]
        str     r1, [r9, #0x10]
        ldr     r0, [r8, #0x14]
        ldr     r1, [r8, #0x18]
        mov     r2, r5
        mov     r3, r6
        bl      __subdf3
        mov     r2, r7
        mov     r3, r4
        bl      __muldf3
        str     r0, [r9, #0x14]
        str     r1, [r9, #0x18]
        ldr     r0, [r8, #0x1C]
        ldr     r1, [r8, #0x20]
        mov     r2, r5
        mov     r3, r6
        bl      __subdf3
        mov     r2, r7
        mov     r3, r4
        bl      __muldf3
        str     r0, [r9, #0x1C]
        str     r1, [r9, #0x20]
        ldr     r0, [r8, #0x24]
        ldr     r1, [r8, #0x28]!
        mov     r2, r5
        mov     r3, r6
        bl      __subdf3
        mov     r2, r7
        mov     r3, r4
        bl      __muldf3
        ldr     r12, [r11, #-0x7C]
        add     r10, r10, #5
        str     r0, [r9, #0x24]
        str     r1, [r9, #0x28]!
        cmp     r10, r12
        ble     LBBR2
        ldr     r7, [r11, #-0x78]
        ldr     r8, [r11, #-0x74]
        ldr     r9, [r11, #-0x70]
LBBR3:
        mov     r12, r10, lsl #3
        sub     r12, r12, #4
        add     r8, r12, r8
        add     r9, r12, r9
LBBR4:
        ldr     r0, [r9, #4]
        ldr     r1, [r9, #8]!
        mov     r2, r5
        mov     r3, r6
        bl      __subdf3
        ldr     r2, [r11, #-0x6C]
        mov     r3, r4
        bl      __muldf3
        add     r10, r10, #1
        str     r0, [r8, #4]
        str     r1, [r8, #8]!
        cmp     r10, r7
        blt     LBBR4
        mov     r0, #0
        ldmdb   r11, {r4 - r11, sp, pc}
LBBR5:
        cmp     r7, #6
        mov     r10, #0
        blt     LBBR7
        sub     r12, r7, #6
        str     r7, [r11, #-0x78]
        ldr     r7, [r11, #-0x6C]
        sub     r1, r8, #4
        sub     r0, r9, #4
        str     r8, [r11, #-0x74]
        str     r9, [r11, #-0x70]
        str     r12, [r11, #-0x2C]
        mov     r8, r0
        mov     r9, r1
LBBR6:
        ldr     r0, [r8, #4]
        ldr     r1, [r8, #8]
        mov     r2, r5
        mov     r3, r6
        bl      __subdf3
        mov     r2, r7
        mov     r3, r4
        bl      __muldf3
        str     r0, [r9, #4]
        str     r1, [r9, #8]
        ldr     r0, [r8, #0xC]
        ldr     r1, [r8, #0x10]
        mov     r2, r5
        mov     r3, r6
        bl      __subdf3
        mov     r2, r7
        mov     r3, r4
        bl      __muldf3
        str     r0, [r9, #0xC]
        str     r1, [r9, #0x10]
        ldr     r0, [r8, #0x14]
        ldr     r1, [r8, #0x18]
        mov     r2, r5
        mov     r3, r6
        bl      __subdf3
        mov     r2, r7
        mov     r3, r4
        bl      __muldf3
        str     r0, [r9, #0x14]
        str     r1, [r9, #0x18]
        ldr     r0, [r8, #0x1C]
        ldr     r1, [r8, #0x20]
        mov     r2, r5
        mov     r3, r6
        bl      __subdf3
        mov     r2, r7
        mov     r3, r4
        bl      __muldf3
        str     r0, [r9, #0x1C]
        str     r1, [r9, #0x20]
        ldr     r0, [r8, #0x24]
        ldr     r1, [r8, #0x28]!
        mov     r2, r5
        mov     r3, r6
        bl      __subdf3
        mov     r2, r7
        mov     r3, r4
        bl      __muldf3
        ldr     r12, [r11, #-0x2C]
        add     r10, r10, #5
        str     r0, [r9, #0x24]
        str     r1, [r9, #0x28]!
        cmp     r10, r12
        ble     LBBR6
        ldr     r7, [r11, #-0x78]
        ldr     r8, [r11, #-0x74]
        ldr     r9, [r11, #-0x70]
LBBR7:
        mov     r12, r10, lsl #3
        sub     r12, r12, #4
        add     r8, r12, r8
        add     r9, r12, r9
LBBR8:
        ldr     r0, [r9, #4]
        ldr     r1, [r9, #8]!
        mov     r2, r5
        mov     r3, r6
        bl      __subdf3
        ldr     r2, [r11, #-0x6C]
        mov     r3, r4
        bl      __muldf3
        add     r10, r10, #1
        str     r0, [r8, #4]
        str     r1, [r8, #8]!
        cmp     r10, r7
        blt     LBBR8
LBBR9:
        mov     r0, #0
        ldmdb   r11, {r4 - r11, sp, pc}
LBBR10:
        mvn     r0, #9
        ldmdb   r11, {r4 - r11, sp, pc}
LBBR11:
        mvn     r0, #5
        ldmdb   r11, {r4 - r11, sp, pc}
LBBR12:
        mvn     r0, #7
        ldmdb   r11, {r4 - r11, sp, pc}


