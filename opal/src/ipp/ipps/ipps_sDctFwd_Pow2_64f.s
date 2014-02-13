        .text
        .align  4
        .globl  _ipps_sDctFwd_Pow2_64f


_ipps_sDctFwd_Pow2_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xB8
        ldr     r5, [sp, #0xDC]
        mov     r12, r2, asr #1
        cmp     r12, #0
        str     r1, [sp, #0x70]
        str     r12, [sp, #0x74]
        add     r4, r5, r12, lsl #3
        ble     LCTG8
        sub     r6, r3, #0xC
        str     r6, [sp, #0x40]
        sub     r6, r4, #0x14
        str     r6, [sp, #0x44]
        sub     r6, r3, #0x14
        str     r6, [sp, #0x48]
        sub     r6, r4, #0x1C
        str     r6, [sp, #0x4C]
        sub     r6, r3, #0x1C
        str     r6, [sp, #0x50]
        sub     r6, r5, #4
        str     r6, [sp, #0x54]
        sub     r6, r0, #4
        add     r12, r5, #8
        str     r6, [sp, #0x58]
        str     r12, [sp, #0x78]
        sub     r6, r5, #0xC
        add     r12, r5, #0x10
        str     r6, [sp, #0x5C]
        str     r12, [sp, #0x7C]
        sub     r6, r0, #0xC
        add     r12, r5, #0x18
        str     r6, [sp, #0x60]
        str     r12, [sp, #0x80]
        sub     r6, r5, #0x14
        add     r12, r4, #8
        str     r6, [sp, #0x64]
        str     r12, [sp, #0x30]
        sub     r6, r0, #0x14
        add     r12, r4, #0x10
        str     r6, [sp, #0x68]
        sub     r11, r0, #0x10
        sub     r10, r0, #0x18
        sub     r9, r0, #0x20
        sub     r8, r4, #4
        str     r12, [sp, #0x2C]
        sub     r6, r5, #0x1C
        add     r12, r4, #0x18
        str     r8, [sp, #0x20]
        str     r9, [sp, #0x1C]
        str     r10, [sp, #0x14]
        str     r11, [sp, #0x10]
        str     r5, [sp, #0x38]
        ldr     r8, [sp, #0x68]
        ldr     r9, [sp, #0x64]
        ldr     r10, [sp, #0x60]
        ldr     r11, [sp, #0x5C]
        ldr     r5, [sp, #0x58]
        str     r12, [sp, #0x28]
        sub     r1, r0, #8
        sub     lr, r3, #4
        sub     r12, r4, #0xC
        str     r6, [sp, #0x6C]
        mov     r7, #0
        sub     r6, r0, #0x1C
        str     r12, [sp, #0xC]
        str     lr, [sp, #8]
        str     r1, [sp, #0x18]
        str     r4, [sp, #0x34]
        str     r3, [sp, #0x3C]
        str     r2, [sp, #0x24]
LCTG0:
        ldr     r0, [sp, #0x24]
        ldr     r3, [sp, #0x18]
        ldr     r1, [r6, #0x20]
        sub     r4, r0, r7
        ldr     r0, [r6, #0x1C]
        ldr     r2, [r3, +r4, lsl #3]
        add     r3, r3, r4, lsl #3
        str     r3, [sp, #0x84]
        ldr     r3, [r3, #4]
        bl      __adddf3
        ldr     r2, [sp, #0x6C]
        add     r7, r7, #4
        str     r0, [r2, #0x1C]
        ldr     r0, [sp, #0x6C]
        str     r1, [r0, #0x20]
        ldr     r2, [sp, #0x10]
        add     r0, r2, r4, lsl #3
        str     r0, [sp, #0x88]
        ldr     r0, [r8, #0x1C]
        ldr     r1, [r8, #0x20]
        ldr     r2, [r2, +r4, lsl #3]
        ldr     r3, [sp, #0x88]
        ldr     r3, [r3, #4]
        bl      __adddf3
        str     r0, [r9, #0x1C]
        str     r1, [r9, #0x20]!
        ldr     r3, [sp, #0x14]
        ldr     r0, [r10, #0x1C]
        ldr     r1, [r10, #0x20]
        ldr     r2, [r3, +r4, lsl #3]
        add     r3, r3, r4, lsl #3
        str     r3, [sp, #0x8C]
        ldr     r3, [r3, #4]
        bl      __adddf3
        str     r0, [r11, #0x1C]
        str     r1, [r11, #0x20]!
        ldr     r3, [sp, #0x1C]
        ldr     r0, [r5, #0x1C]
        ldr     r1, [r5, #0x20]
        ldr     r2, [r3, +r4, lsl #3]
        add     r3, r3, r4, lsl #3
        str     r3, [sp, #0x90]
        ldr     r3, [r3, #4]
        bl      __adddf3
        ldr     r2, [sp, #0x54]
        str     r0, [r2, #0x1C]
        str     r1, [r2, #0x20]
        ldr     r0, [sp, #0x18]
        ldr     r1, [r6, #0x20]
        ldr     r2, [r0, +r4, lsl #3]
        ldr     r0, [sp, #0x84]
        ldr     r3, [r0, #4]
        ldr     r0, [r6, #0x1C]
        add     r6, r6, #0x20
        bl      __subdf3
        ldr     r3, [sp, #0x50]
        ldr     r2, [r3, #0x1C]
        ldr     r3, [r3, #0x20]
        str     r3, [sp, #0x84]
        ldr     r3, [sp, #0x84]
        bl      __muldf3
        ldr     r2, [sp, #0x4C]
        str     r1, [r2, #0x20]
        str     r0, [r2, #0x1C]
        ldr     r0, [sp, #0x10]
        ldr     r3, [sp, #0x88]
        ldr     r1, [r8, #0x20]
        ldr     r2, [r0, +r4, lsl #3]
        ldr     r0, [r8, #0x1C]
        ldr     r3, [r3, #4]
        bl      __subdf3
        ldr     r3, [sp, #0x48]
        ldr     r2, [r3, #0x1C]
        ldr     r3, [r3, #0x20]
        str     r1, [sp, #0x88]
        ldr     r1, [sp, #0x88]
        add     r8, r8, #0x20
        bl      __muldf3
        ldr     r2, [sp, #0x44]
        str     r1, [r2, #0x20]
        str     r0, [r2, #0x1C]
        ldr     r0, [sp, #0x14]
        ldr     r1, [r10, #0x20]
        ldr     r2, [r0, +r4, lsl #3]
        ldr     r0, [sp, #0x8C]
        ldr     r3, [r0, #4]
        ldr     r0, [r10, #0x1C]
        add     r10, r10, #0x20
        bl      __subdf3
        ldr     r3, [sp, #0x40]
        ldr     r2, [r3, #0x1C]
        ldr     r3, [r3, #0x20]
        bl      __muldf3
        ldr     r2, [sp, #0xC]
        str     r0, [r2, #0x1C]
        str     r1, [r2, #0x20]
        ldr     r2, [sp, #0x1C]
        ldr     r3, [sp, #0x90]
        ldr     r0, [r5, #0x1C]
        ldr     r1, [r5, #0x20]!
        ldr     r2, [r2, +r4, lsl #3]
        ldr     r3, [r3, #4]
        bl      __subdf3
        ldr     r3, [sp, #8]
        ldr     r2, [r3, #0x1C]
        ldr     r3, [r3, #0x20]
        bl      __muldf3
        ldr     r2, [sp, #0x20]
        str     r0, [r2, #0x1C]
        str     r1, [r2, #0x20]
        ldr     r0, [sp, #0x74]
        cmp     r7, r0
        ldr     r0, [sp, #0x20]
        add     r0, r0, #0x20
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #8]
        add     r0, r0, #0x20
        str     r0, [sp, #8]
        ldr     r0, [sp, #0xC]
        add     r0, r0, #0x20
        str     r0, [sp, #0xC]
        ldr     r0, [sp, #0x40]
        add     r0, r0, #0x20
        str     r0, [sp, #0x40]
        ldr     r0, [sp, #0x44]
        add     r0, r0, #0x20
        str     r0, [sp, #0x44]
        ldr     r0, [sp, #0x48]
        add     r0, r0, #0x20
        str     r0, [sp, #0x48]
        ldr     r0, [sp, #0x4C]
        add     r0, r0, #0x20
        str     r0, [sp, #0x4C]
        ldr     r0, [sp, #0x50]
        add     r0, r0, #0x20
        str     r0, [sp, #0x50]
        ldr     r0, [sp, #0x54]
        add     r0, r0, #0x20
        str     r0, [sp, #0x54]
        ldr     r0, [sp, #0x6C]
        add     r0, r0, #0x20
        str     r0, [sp, #0x6C]
        blt     LCTG0
        ldr     r2, [sp, #0x74]
        ldr     r4, [sp, #0x34]
        ldr     r5, [sp, #0x38]
        ldr     r3, [sp, #0x3C]
        cmp     r2, #8
        bgt     LCTG2
LCTG1:
        ldr     r2, [r5]
        str     r2, [sp, #0x90]
        ldr     r2, [r5, #4]
        str     r2, [sp, #0x8C]
        ldr     r0, [r5, #0x38]
        ldr     r3, [sp, #0x8C]
        str     r0, [sp, #0x88]
        ldr     r2, [r5, #0x3C]
        str     r2, [sp, #0x84]
        ldr     r2, [sp, #0x90]
        ldr     r1, [sp, #0x84]
        bl      __adddf3
        ldr     r9, [r5, #0x34]
        ldr     r10, [r5, #0x30]
        ldr     r8, [r5, #8]
        ldr     r11, [r5, #0xC]
        str     r0, [sp, #0x6C]
        str     r1, [sp, #0x68]
        mov     r0, r8
        mov     r2, r10
        mov     r3, r9
        mov     r1, r11
        bl      __adddf3
        ldr     r6, [r5, #0x28]
        ldr     r12, [r5, #0x10]
        mov     r2, r6
        str     r12, [sp, #0x64]
        ldr     r12, [r5, #0x14]
        str     r12, [sp, #0x60]
        ldr     r7, [r5, #0x2C]
        str     r1, [sp, #0x58]
        str     r0, [sp, #0x5C]
        ldr     r0, [sp, #0x64]
        ldr     r1, [sp, #0x60]
        mov     r3, r7
        bl      __adddf3
        ldr     r12, [r5, #0x18]
        str     r12, [sp, #0x54]
        ldr     r12, [r5, #0x1C]
        str     r12, [sp, #0x50]
        ldr     r12, [r5, #0x20]
        str     r12, [sp, #0x4C]
        ldr     r12, [r5, #0x24]
        str     r0, [sp, #0x44]
        str     r1, [sp, #0x40]
        str     r12, [sp, #0x48]
        ldr     r2, [sp, #0x4C]
        ldr     r3, [sp, #0x48]
        ldr     r1, [sp, #0x50]
        ldr     r0, [sp, #0x54]
        bl      __adddf3
        ldr     r2, [sp, #0x4C]
        ldr     r3, [sp, #0x48]
        str     r0, [sp, #0x3C]
        ldr     r0, [sp, #0x54]
        str     r1, [sp, #0x24]
        ldr     r1, [sp, #0x50]
        bl      __subdf3
        str     r0, [sp, #0x54]
        str     r1, [sp, #0x50]
        ldr     r0, [sp, #0x64]
        ldr     r1, [sp, #0x60]
        mov     r3, r7
        mov     r2, r6
        bl      __subdf3
        str     r0, [sp, #0x64]
        str     r1, [sp, #0x60]
        mov     r0, r8
        mov     r2, r10
        mov     r3, r9
        mov     r1, r11
        bl      __subdf3
        ldr     r2, [sp, #0x88]
        ldr     r3, [sp, #0x84]
        str     r0, [sp, #0x4C]
        ldr     r0, [sp, #0x90]
        str     r1, [sp, #0x48]
        ldr     r1, [sp, #0x8C]
        bl      __subdf3
        ldr     r3, [sp, #0x24]
        ldr     r2, [sp, #0x3C]
        str     r1, [sp, #0x8C]
        ldr     r1, [sp, #0x68]
        str     r0, [sp, #0x90]
        ldr     r0, [sp, #0x6C]
        bl      __adddf3
        mov     r10, r0
        ldr     r0, [sp, #0x6C]
        ldr     r2, [sp, #0x3C]
        ldr     r3, [sp, #0x24]
        mov     r11, r1
        ldr     r1, [sp, #0x68]
        bl      __subdf3
        ldr     r3, [sp, #0x40]
        mov     r8, r1
        ldr     r2, [sp, #0x44]
        ldr     r1, [sp, #0x58]
        mov     r7, r0
        ldr     r0, [sp, #0x5C]
        bl      __adddf3
        ldr     r3, [sp, #0x40]
        ldr     r2, [sp, #0x44]
        str     r0, [sp, #0x88]
        ldr     r0, [sp, #0x5C]
        str     r1, [sp, #0x84]
        ldr     r1, [sp, #0x58]
        bl      __subdf3
        ldr     r2, [sp, #0x88]
        ldr     r3, [sp, #0x84]
        mov     r6, r0
        mov     r9, r1
        mov     r1, r11
        mov     r0, r10
        bl      __adddf3
        ldr     r12, [pc, #0xB3C]
        str     r0, [r5]
        ldr     lr, [r12]
        mov     r0, r10
        str     lr, [sp, #0x5C]
        ldr     r12, [r12, #4]
        str     r12, [sp, #0x58]
        str     r1, [r5, #4]
        ldr     r2, [sp, #0x88]
        ldr     r3, [sp, #0x84]
        mov     r1, r11
        bl      __subdf3
        ldr     r2, [sp, #0x5C]
        ldr     r3, [sp, #0x58]
        bl      __muldf3
        ldr     lr, [pc, #0xB04]
        ldr     r12, [pc, #0xB04]
        mov     r2, r7
        mov     r3, r8
        ldr     r10, [lr]
        str     r10, [sp, #0x88]
        ldr     lr, [lr, #4]
        str     lr, [sp, #0x84]
        ldr     lr, [r12]
        str     lr, [sp, #0x44]
        ldr     r12, [r12, #4]
        str     r12, [sp, #0x40]
        str     r0, [r5, #0x20]
        str     r1, [r5, #0x24]
        ldr     r0, [sp, #0x88]
        ldr     r1, [sp, #0x84]
        bl      __muldf3
        mov     r10, r0
        ldr     r0, [sp, #0x44]
        mov     r11, r1
        ldr     r1, [sp, #0x40]
        mov     r2, r6
        mov     r3, r9
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        str     r0, [r5, #0x10]
        str     r1, [r5, #0x14]
        ldr     r0, [sp, #0x44]
        ldr     r1, [sp, #0x40]
        mov     r2, r7
        mov     r3, r8
        bl      __muldf3
        mov     r7, r0
        ldr     r0, [sp, #0x88]
        mov     r8, r1
        ldr     r1, [sp, #0x84]
        mov     r3, r9
        mov     r2, r6
        bl      __muldf3
        mov     r3, r1
        mov     r2, r0
        mov     r1, r8
        mov     r0, r7
        bl      __subdf3
        str     r0, [r5, #0x30]
        str     r1, [r5, #0x34]
        ldr     r2, [sp, #0x4C]
        ldr     r1, [sp, #0x60]
        ldr     r3, [sp, #0x48]
        ldr     r0, [sp, #0x64]
        bl      __adddf3
        ldr     r3, [sp, #0x60]
        mov     r6, r0
        ldr     r0, [sp, #0x4C]
        ldr     r2, [sp, #0x64]
        mov     r7, r1
        ldr     r1, [sp, #0x48]
        bl      __subdf3
        ldr     r12, [pc, #0xA1C]
        mov     r10, r0
        ldr     r0, [sp, #0x54]
        mov     r11, r1
        ldr     lr, [r12]
        ldr     r1, [sp, #0x50]
        str     lr, [sp, #0x64]
        ldr     r12, [r12, #4]
        ldr     r2, [sp, #0x64]
        str     r12, [sp, #0x60]
        ldr     r3, [sp, #0x60]
        bl      __muldf3
        ldr     r2, [sp, #0x64]
        ldr     r3, [sp, #0x60]
        str     r0, [sp, #0x6C]
        ldr     r0, [sp, #0x90]
        str     r1, [sp, #0x68]
        ldr     r1, [sp, #0x8C]
        bl      __muldf3
        mov     r8, r0
        mov     r9, r1
        mov     r3, r7
        mov     r2, r6
        bl      __adddf3
        str     r0, [sp, #0x90]
        str     r1, [sp, #0x8C]
        mov     r0, r8
        mov     r3, r7
        mov     r2, r6
        mov     r1, r9
        bl      __subdf3
        mov     r6, r0
        ldr     r0, [sp, #0x6C]
        mov     r7, r1
        ldr     r1, [sp, #0x68]
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        mov     r9, r1
        ldr     r1, [sp, #0x68]
        mov     r8, r0
        ldr     r0, [sp, #0x6C]
        mov     r2, r10
        mov     r3, r11
        bl      __subdf3
        ldr     lr, [pc, #0x96C]
        ldr     r12, [pc, #0x96C]
        ldr     r2, [sp, #0x90]
        ldr     r3, [sp, #0x8C]
        mov     r10, r0
        ldr     r0, [lr]
        mov     r11, r1
        str     r0, [sp, #0x54]
        ldr     lr, [lr, #4]
        ldr     r0, [sp, #0x54]
        str     lr, [sp, #0x50]
        ldr     lr, [r12]
        ldr     r1, [sp, #0x50]
        str     lr, [sp, #0x4C]
        ldr     r12, [r12, #4]
        str     r12, [sp, #0x48]
        bl      __muldf3
        str     r0, [sp, #0x6C]
        ldr     r0, [sp, #0x4C]
        str     r1, [sp, #0x68]
        ldr     r1, [sp, #0x48]
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #0x6C]
        ldr     r3, [sp, #0x68]
        bl      __adddf3
        str     r0, [r5, #8]
        str     r1, [r5, #0xC]
        ldr     r0, [sp, #0x4C]
        ldr     r1, [sp, #0x48]
        ldr     r2, [sp, #0x90]
        ldr     r3, [sp, #0x8C]
        bl      __muldf3
        str     r0, [sp, #0x90]
        str     r1, [sp, #0x8C]
        ldr     r0, [sp, #0x54]
        ldr     r1, [sp, #0x50]
        mov     r3, r9
        mov     r2, r8
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x90]
        mov     r3, r1
        ldr     r1, [sp, #0x8C]
        bl      __subdf3
        ldr     lr, [pc, #0x8BC]
        ldr     r12, [pc, #0x8BC]
        ldr     r8, [lr]
        mov     r3, r7
        mov     r2, r6
        str     r8, [sp, #0x90]
        ldr     lr, [lr, #4]
        str     lr, [sp, #0x8C]
        ldr     lr, [r12]
        str     lr, [sp, #0x24]
        ldr     r12, [r12, #4]
        str     r12, [sp, #0x20]
        str     r0, [r5, #0x38]
        str     r1, [r5, #0x3C]
        ldr     r0, [sp, #0x90]
        ldr     r1, [sp, #0x8C]
        bl      __muldf3
        mov     r8, r0
        ldr     r0, [sp, #0x24]
        mov     r9, r1
        ldr     r1, [sp, #0x20]
        mov     r3, r11
        mov     r2, r10
        bl      __muldf3
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        str     r0, [r5, #0x28]
        str     r1, [r5, #0x2C]
        ldr     r0, [sp, #0x24]
        ldr     r1, [sp, #0x20]
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        mov     r7, r1
        ldr     r1, [sp, #0x8C]
        mov     r6, r0
        ldr     r0, [sp, #0x90]
        mov     r2, r10
        mov     r3, r11
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r6
        mov     r1, r7
        bl      __subdf3
        str     r0, [r5, #0x18]
        str     r1, [r5, #0x1C]
        ldr     r0, [r4, #0x38]
        str     r0, [sp, #0x6C]
        ldr     r2, [r4, #0x3C]
        str     r2, [sp, #0x68]
        ldr     r2, [sp, #0x74]
        ldr     r1, [sp, #0x68]
        ldr     r2, [r5, +r2, lsl #3]
        str     r2, [sp, #0x3C]
        ldr     r2, [r4, #4]
        str     r2, [sp, #0x1C]
        ldr     r2, [sp, #0x3C]
        ldr     r3, [sp, #0x1C]
        bl      __adddf3
        ldr     r8, [r4, #8]
        ldr     r11, [r4, #0xC]
        ldr     r10, [r4, #0x30]
        ldr     r9, [r4, #0x34]
        str     r0, [sp, #0x18]
        str     r1, [sp, #0x14]
        mov     r3, r9
        mov     r1, r11
        mov     r0, r8
        mov     r2, r10
        bl      __adddf3
        ldr     r6, [r4, #0x10]
        ldr     r7, [r4, #0x14]
        ldr     r12, [r4, #0x28]
        str     r12, [sp, #0x10]
        ldr     r12, [r4, #0x2C]
        str     r1, [sp, #0x94]
        ldr     r2, [sp, #0x10]
        str     r12, [sp, #0xC]
        ldr     r3, [sp, #0xC]
        str     r0, [sp, #8]
        mov     r0, r6
        mov     r1, r7
        bl      __adddf3
        ldr     r12, [r4, #0x18]
        str     r12, [sp, #0x98]
        ldr     r12, [r4, #0x1C]
        str     r12, [sp, #0x9C]
        ldr     r12, [r4, #0x20]
        str     r12, [sp, #0xA0]
        ldr     r12, [r4, #0x24]
        str     r0, [sp, #0xA8]
        str     r1, [sp, #0xAC]
        str     r12, [sp, #0xA4]
        ldr     r0, [sp, #0x98]
        ldr     r1, [sp, #0x9C]
        ldr     r3, [sp, #0xA4]
        ldr     r2, [sp, #0xA0]
        bl      __adddf3
        ldr     r2, [sp, #0xA0]
        str     r1, [sp, #0xB4]
        ldr     r1, [sp, #0x9C]
        str     r0, [sp, #0xB0]
        ldr     r0, [sp, #0x98]
        ldr     r3, [sp, #0xA4]
        bl      __subdf3
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0xC]
        str     r0, [sp, #0xA4]
        str     r1, [sp, #0xA0]
        mov     r0, r6
        mov     r1, r7
        bl      __subdf3
        str     r0, [sp, #0x9C]
        str     r1, [sp, #0x98]
        mov     r1, r11
        mov     r0, r8
        mov     r2, r10
        mov     r3, r9
        bl      __subdf3
        str     r1, [sp, #0xC]
        ldr     r1, [sp, #0x1C]
        str     r0, [sp, #0x10]
        ldr     r0, [sp, #0x3C]
        ldr     r2, [sp, #0x6C]
        ldr     r3, [sp, #0x68]
        bl      __subdf3
        str     r0, [sp, #0x3C]
        ldr     r0, [sp, #0x18]
        ldr     r2, [sp, #0xB0]
        ldr     r3, [sp, #0xB4]
        str     r1, [sp, #0x1C]
        ldr     r1, [sp, #0x14]
        bl      __adddf3
        ldr     r3, [sp, #0xB4]
        ldr     r2, [sp, #0xB0]
        mov     r10, r0
        ldr     r0, [sp, #0x18]
        mov     r11, r1
        ldr     r1, [sp, #0x14]
        bl      __subdf3
        mov     r7, r0
        mov     r8, r1
        ldr     r2, [sp, #0xA8]
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #0x94]
        ldr     r3, [sp, #0xAC]
        bl      __adddf3
        ldr     r2, [sp, #0xA8]
        ldr     r3, [sp, #0xAC]
        str     r0, [sp, #0xB4]
        mov     r9, r1
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #0x94]
        bl      __subdf3
        ldr     r2, [sp, #0xB4]
        mov     r6, r0
        str     r1, [sp, #0xB0]
        mov     r1, r11
        mov     r0, r10
        mov     r3, r9
        bl      __adddf3
        ldr     r2, [sp, #0xB4]
        str     r1, [sp, #0x6C]
        str     r0, [sp, #0x68]
        mov     r3, r9
        mov     r1, r11
        mov     r0, r10
        bl      __subdf3
        ldr     r2, [sp, #0x5C]
        ldr     r3, [sp, #0x58]
        bl      __muldf3
        str     r0, [r4, #0x20]
        str     r1, [r4, #0x24]
        ldr     r0, [sp, #0x88]
        ldr     r1, [sp, #0x84]
        mov     r3, r8
        mov     r2, r7
        bl      __muldf3
        ldr     r3, [sp, #0xB0]
        str     r0, [sp, #0xB4]
        ldr     r0, [sp, #0x44]
        mov     r9, r1
        ldr     r1, [sp, #0x40]
        mov     r2, r6
        bl      __muldf3
        ldr     r2, [sp, #0xB4]
        mov     r3, r9
        bl      __adddf3
        str     r0, [r4, #0x10]
        str     r1, [r4, #0x14]
        ldr     r0, [sp, #0x44]
        ldr     r1, [sp, #0x40]
        mov     r3, r8
        mov     r2, r7
        bl      __muldf3
        ldr     r3, [sp, #0xB0]
        mov     r7, r0
        ldr     r0, [sp, #0x88]
        mov     r8, r1
        ldr     r1, [sp, #0x84]
        mov     r2, r6
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r7
        mov     r1, r8
        bl      __subdf3
        str     r0, [r4, #0x30]
        str     r1, [r4, #0x34]
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0xC]
        ldr     r0, [sp, #0x9C]
        ldr     r1, [sp, #0x98]
        bl      __adddf3
        mov     r8, r0
        mov     r7, r1
        ldr     r0, [sp, #0x10]
        ldr     r1, [sp, #0xC]
        ldr     r2, [sp, #0x9C]
        ldr     r3, [sp, #0x98]
        bl      __subdf3
        ldr     r2, [sp, #0x64]
        ldr     r3, [sp, #0x60]
        mov     r9, r0
        ldr     r0, [sp, #0xA4]
        mov     r11, r1
        ldr     r1, [sp, #0xA0]
        bl      __muldf3
        ldr     r2, [sp, #0x64]
        ldr     r3, [sp, #0x60]
        mov     r10, r0
        ldr     r0, [sp, #0x3C]
        str     r1, [sp, #0xB4]
        ldr     r1, [sp, #0x1C]
        bl      __muldf3
        str     r1, [sp, #0xB0]
        mov     r6, r0
        mov     r3, r7
        mov     r2, r8
        bl      __adddf3
        str     r0, [sp, #0xAC]
        str     r1, [sp, #0xA8]
        ldr     r1, [sp, #0xB0]
        mov     r0, r6
        mov     r2, r8
        mov     r3, r7
        bl      __subdf3
        mov     r6, r1
        ldr     r1, [sp, #0xB4]
        str     r0, [sp, #0xB0]
        mov     r3, r11
        mov     r2, r9
        mov     r0, r10
        bl      __adddf3
        mov     r8, r1
        ldr     r1, [sp, #0xB4]
        mov     r7, r0
        mov     r3, r11
        mov     r2, r9
        mov     r0, r10
        bl      __subdf3
        ldr     r3, [sp, #0xA8]
        ldr     r2, [sp, #0xAC]
        mov     r9, r0
        ldr     r0, [sp, #0x54]
        mov     r10, r1
        ldr     r1, [sp, #0x50]
        bl      __muldf3
        str     r0, [sp, #0xB4]
        ldr     r0, [sp, #0x4C]
        mov     r11, r1
        ldr     r1, [sp, #0x48]
        mov     r2, r7
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [sp, #0xB4]
        mov     r3, r11
        bl      __adddf3
        mov     r11, r0
        str     r1, [sp, #0x3C]
        str     r11, [r4, #8]
        str     r1, [r4, #0xC]
        ldr     r3, [sp, #0xA8]
        ldr     r0, [sp, #0x4C]
        ldr     r1, [sp, #0x48]
        ldr     r2, [sp, #0xAC]
        bl      __muldf3
        str     r0, [sp, #0xB4]
        ldr     r0, [sp, #0x54]
        str     r1, [sp, #0xAC]
        ldr     r1, [sp, #0x50]
        mov     r2, r7
        mov     r3, r8
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [sp, #0xB4]
        ldr     r1, [sp, #0xAC]
        bl      __subdf3
        str     r0, [r4, #0x38]
        str     r1, [r4, #0x3C]
        ldr     r2, [sp, #0xB0]
        ldr     r0, [sp, #0x90]
        ldr     r1, [sp, #0x8C]
        mov     r3, r6
        bl      __muldf3
        mov     r7, r0
        mov     r8, r1
        ldr     r0, [sp, #0x24]
        ldr     r1, [sp, #0x20]
        mov     r2, r9
        mov     r3, r10
        bl      __muldf3
        mov     r2, r7
        mov     r3, r8
        bl      __adddf3
        str     r0, [r4, #0x28]
        str     r1, [r4, #0x2C]
        ldr     r0, [sp, #0x24]
        ldr     r1, [sp, #0x20]
        ldr     r2, [sp, #0xB0]
        mov     r3, r6
        bl      __muldf3
        mov     r6, r0
        mov     r7, r1
        ldr     r0, [sp, #0x90]
        ldr     r1, [sp, #0x8C]
        mov     r2, r9
        mov     r3, r10
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r6
        mov     r1, r7
        bl      __subdf3
        str     r0, [r4, #0x18]
        str     r1, [r4, #0x1C]
        b       LCTG3
LCTG2:
        ldr     r6, [sp, #0x74]
        ldr     r8, [sp, #0x70]
        mov     r1, r5
        add     r7, r3, r6, lsl #3
        mov     r3, r7
        str     r8, [sp]
        mov     r2, r6
        mov     r0, r5
        bl      ipps_sDctFwd_Pow2_64f
        str     r8, [sp]
        mov     r2, r6
        mov     r3, r7
        mov     r1, r4
        mov     r0, r4
        bl      ipps_sDctFwd_Pow2_64f
        ldr     r6, [r5, +r6, lsl #3]
        str     r6, [sp, #0x68]
        ldr     r2, [r4, #4]
        str     r2, [sp, #0x6C]
        ldr     r2, [r4, #0xC]
        ldr     r11, [r4, #8]
        str     r2, [sp, #0x3C]
LCTG3:
        mov     r0, r11
        ldr     r1, [sp, #0x3C]
        ldr     r2, [sp, #0x68]
        ldr     r3, [sp, #0x6C]
        bl      __adddf3
        ldr     r12, [sp, #0x74]
        str     r0, [r5, +r12, lsl #3]
        str     r1, [r4, #4]
        ldr     r0, [r4, #8]
        ldr     r1, [r4, #0xC]
        ldr     r2, [r4, #0x10]
        ldr     r3, [r4, #0x14]
        sub     r11, r12, #1
        bl      __adddf3
        str     r0, [r4, #8]
        str     r1, [r4, #0xC]
        ldr     r0, [r4, #0x10]
        ldr     r1, [r4, #0x14]
        ldr     r2, [r4, #0x18]
        ldr     r3, [r4, #0x1C]
        bl      __adddf3
        cmp     r11, #3
        str     r0, [r4, #0x10]
        str     r1, [r4, #0x14]
        ble     LCTG5
        ldr     r3, [sp, #0x28]
        mov     r10, #3
        add     r2, r4, #0x1C
        sub     r8, r3, #4
        ldr     r3, [sp, #0x2C]
        sub     r9, r4, #4
        str     r2, [sp, #0x68]
        str     r11, [sp, #0x6C]
        sub     r7, r3, #4
        ldr     r3, [sp, #0x30]
        str     r4, [sp, #0x34]
        str     r5, [sp, #0x38]
        ldr     r4, [sp, #0x28]
        ldr     r5, [sp, #0x2C]
        ldr     r11, [sp, #0x30]
        sub     r6, r3, #4
LCTG4:
        ldr     r0, [r9, #0x1C]
        ldr     r1, [r9, #0x20]
        ldr     r2, [r11, +r10, lsl #3]
        ldr     r3, [r6, #0x20]
        bl      __adddf3
        str     r0, [r9, #0x1C]
        str     r1, [r9, #0x20]!
        ldr     r0, [r11, +r10, lsl #3]
        ldr     r2, [r5, +r10, lsl #3]
        ldr     r1, [r6, #0x20]
        ldr     r3, [r7, #0x20]
        bl      __adddf3
        str     r0, [r11, +r10, lsl #3]
        str     r1, [r6, #0x20]!
        ldr     r0, [r5, +r10, lsl #3]
        ldr     r2, [r4, +r10, lsl #3]
        ldr     r1, [r7, #0x20]
        ldr     r3, [r8, #0x20]
        bl      __adddf3
        str     r0, [r5, +r10, lsl #3]
        str     r1, [r7, #0x20]!
        ldr     r3, [sp, #0x68]
        ldr     r0, [r4, +r10, lsl #3]
        ldr     r1, [r8, #0x20]
        ldr     r2, [r3, #0x1C]
        ldr     r3, [r3, #0x20]
        bl      __adddf3
        str     r0, [r4, +r10, lsl #3]
        str     r1, [r8, #0x20]!
        ldr     r0, [sp, #0x6C]
        add     r10, r10, #4
        cmp     r10, r0
        ldr     r0, [sp, #0x68]
        add     r0, r0, #0x20
        str     r0, [sp, #0x68]
        blt     LCTG4
        ldr     r4, [sp, #0x34]
        ldr     r5, [sp, #0x38]
LCTG5:
        ldr     r2, [sp, #0x74]
        cmp     r2, #0
        ble     LCTG7
        ldr     r0, [sp, #0x28]
        sub     r4, r4, #0x1C
        str     r4, [sp, #0x4C]
        sub     r2, r0, #0x1C
        ldr     r0, [sp, #0x80]
        sub     r5, r5, #0x1C
        mov     r6, #0
        sub     r0, r0, #0x1C
        str     r0, [sp, #0x40]
        ldr     r0, [sp, #0x2C]
        sub     r0, r0, #0x1C
        str     r0, [sp, #0x44]
        ldr     r0, [sp, #0x7C]
        sub     r1, r0, #0x1C
        ldr     r0, [sp, #0x30]
        sub     r8, r0, #0x1C
        ldr     r0, [sp, #0x78]
        str     r8, [sp, #0x5C]
        ldr     r8, [sp, #0x4C]
        sub     r7, r0, #0x1C
        ldr     r0, [sp, #0x70]
        str     r7, [sp, #0x60]
        ldr     r7, [sp, #0x44]
        sub     r9, r0, #4
        sub     r10, r0, #0xC
        sub     r11, r0, #0x14
        sub     r4, r0, #0x3C
        sub     lr, r0, #0x1C
        sub     r12, r0, #0x24
        sub     r3, r0, #0x2C
        sub     r0, r0, #0x34
        str     r11, [sp, #0x6C]
        str     r10, [sp, #0x64]
        str     r9, [sp, #0x68]
LCTG6:
        ldr     r10, [r5, #0x20]
        ldr     r9, [r5, #0x1C]
        add     r5, r5, #0x20
        str     r10, [r4, #0x40]
        str     r9, [r4, #0x3C]
        ldr     r10, [r8, #0x20]
        ldr     r9, [r8, #0x1C]
        add     r8, r8, #0x20
        str     r10, [r0, #0x40]
        add     r4, r4, #0x40
        str     r9, [r0, #0x3C]
        ldr     r10, [sp, #0x60]
        ldr     r9, [sp, #0x78]
        add     r0, r0, #0x40
        ldr     r11, [r10, #0x20]!
        ldr     r9, [r9, +r6, lsl #3]
        str     r10, [sp, #0x60]
        str     r11, [r3, #0x40]
        str     r9, [r3, #0x3C]
        ldr     r9, [sp, #0x30]
        ldr     r10, [sp, #0x5C]
        add     r3, r3, #0x40
        ldr     r9, [r9, +r6, lsl #3]
        ldr     r11, [r10, #0x20]!
        str     r10, [sp, #0x5C]
        str     r9, [r12, #0x3C]
        str     r11, [r12, #0x40]!
        ldr     r9, [sp, #0x7C]
        ldr     r10, [r1, #0x20]!
        ldr     r9, [r9, +r6, lsl #3]
        str     r10, [lr, #0x40]
        str     r9, [lr, #0x3C]
        ldr     r9, [sp, #0x2C]
        ldr     r11, [sp, #0x6C]
        ldr     r10, [r7, #0x20]!
        ldr     r9, [r9, +r6, lsl #3]
        str     r10, [r11, #0x40]
        add     lr, lr, #0x40
        str     r9, [r11, #0x3C]
        add     r11, r11, #0x40
        str     r11, [sp, #0x6C]
        ldr     r11, [sp, #0x40]
        ldr     r9, [sp, #0x80]
        ldr     r10, [r11, #0x20]!
        ldr     r9, [r9, +r6, lsl #3]
        str     r11, [sp, #0x40]
        ldr     r11, [sp, #0x64]
        str     r9, [r11, #0x3C]
        str     r10, [r11, #0x40]!
        ldr     r9, [sp, #0x28]
        str     r11, [sp, #0x64]
        ldr     r10, [r9, +r6, lsl #3]
        ldr     r11, [sp, #0x68]
        ldr     r9, [r2, #0x20]!
        add     r6, r6, #4
        str     r10, [r11, #0x3C]
        ldr     r10, [sp, #0x74]
        cmp     r6, r10
        ldr     r10, [sp, #0x68]
        str     r9, [r10, #0x40]!
        str     r10, [sp, #0x68]
        blt     LCTG6
LCTG7:
        add     sp, sp, #0xB8
        ldmia   sp!, {r4 - r11, pc}
LCTG8:
        add     r2, r5, #8
        str     r2, [sp, #0x78]
        add     r2, r5, #0x10
        str     r2, [sp, #0x7C]
        add     r2, r5, #0x18
        str     r2, [sp, #0x80]
        add     r2, r4, #8
        str     r2, [sp, #0x30]
        add     r2, r4, #0x10
        str     r2, [sp, #0x2C]
        add     r2, r4, #0x18
        str     r2, [sp, #0x28]
        b       LCTG1
        .long   LCTG_cos_4_16
        .long   LCTG_cos_2_16
        .long   LCTG_sin_2_16
        .long   LCTG_sqrt_2
        .long   LCTG_cos_1_16s
        .long   LCTG_sin_1_16s
        .long   LCTG_cos_5_16s
        .long   LCTG_sin_5_16s


        .data
        .align  4


LCTG_cos_4_16:
        .byte   0xCD,0x3B,0x7F,0x66,0x9E,0xA0,0xE6,0x3F
LCTG_cos_2_16:
        .byte   0x46,0x8D,0x32,0xCF,0x6B,0x90,0xED,0x3F
LCTG_sin_2_16:
        .byte   0x63,0xA9,0xAE,0xA6,0xE2,0x7D,0xD8,0x3F
LCTG_sqrt_2:
        .byte   0xCD,0x3B,0x7F,0x66,0x9E,0xA0,0xF6,0x3F
LCTG_cos_1_16s:
        .byte   0x36,0x85,0x5E,0xB1,0x50,0x31,0xE6,0x3F
LCTG_sin_1_16s:
        .byte   0xB6,0x71,0xC0,0xDE,0x55,0xA8,0xC1,0x3F
LCTG_cos_5_16s:
        .byte   0x2F,0xF3,0xDC,0xC0,0x69,0x24,0xD9,0x3F
LCTG_sin_5_16s:
        .byte   0x1A,0xE3,0x88,0xEF,0x62,0xD0,0xE2,0x3F


