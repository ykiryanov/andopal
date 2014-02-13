        .text
        .align  4
        .globl  _ipps_rDftFwd_Fact_64f


_ipps_rDftFwd_Fact_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xA4
        ldr     r12, [sp, #0xC8]
        ldr     r8, [sp, #0xD0]
        str     r12, [sp, #0x80]
        ldr     r12, [sp, #0xCC]
        mov     r7, r0
        str     r12, [sp, #0x48]
        rsb     r12, r3, #0
        mla     r4, r2, r3, r12
        add     r5, r2, #1
        mov     r9, r1
        mov     r10, r5, asr #1
        str     r4, [sp, #0x84]
        ldr     lr, [r7]
        ldr     r12, [r7, #4]
        add     r5, r9, r3, lsl #4
        sub     r11, r5, #8
        add     r0, r7, r4, lsl #3
        cmp     r10, #1
        add     r1, r7, r3, lsl #3
        mov     r5, lr
        mov     r4, r12
        ble     LCNV1
        sub     r6, r8, #4
        str     r6, [sp, #0x7C]
        sub     r6, r8, #0xC
        str     r6, [sp, #0x78]
        str     r9, [sp, #0x70]
        ldr     r9, [sp, #0x78]
        str     r8, [sp, #0x58]
        str     r7, [sp, #0x74]
        sub     r6, r10, #1
        str     r12, [sp, #0x64]
        str     lr, [sp, #0x68]
        str     r11, [sp, #0x6C]
        str     r10, [sp, #0x1C]
        str     r3, [sp, #0x18]
        str     r2, [sp, #0x5C]
        mov     r7, r0
        mov     r8, r1
LCNV0:
        ldr     r0, [r8]
        ldr     r1, [r8, #4]
        ldr     r2, [r7]
        ldr     r3, [r7, #4]
        bl      __adddf3
        mov     r10, r0
        mov     r11, r1
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        str     r10, [r9, #0xC]
        str     r11, [r9, #0x10]!
        ldr     r2, [r8]
        ldr     r3, [r7, #4]
        ldr     r10, [r8, #4]
        ldr     r11, [r7]
        mov     r5, r0
        mov     r0, r2
        mov     r4, r1
        mov     r1, r10
        mov     r2, r11
        bl      __subdf3
        ldr     r12, [sp, #0x7C]
        subs    r6, r6, #1
        str     r0, [r12, #0xC]
        str     r1, [r12, #0x10]
        ldr     r12, [sp, #0x18]
        add     r8, r8, r12, lsl #3
        sub     r7, r7, r12, lsl #3
        ldr     r12, [sp, #0x7C]
        add     r12, r12, #0x10
        str     r12, [sp, #0x7C]
        bne     LCNV0
        ldr     r12, [sp, #0x64]
        ldr     lr, [sp, #0x68]
        ldr     r11, [sp, #0x6C]
        ldr     r10, [sp, #0x1C]
        ldr     r8, [sp, #0x58]
        ldr     r3, [sp, #0x18]
        ldr     r2, [sp, #0x5C]
        ldr     r9, [sp, #0x70]
        ldr     r7, [sp, #0x74]
LCNV1:
        cmp     r10, #1
        str     r5, [r9]
        str     r4, [r9, #4]
        ble     LCNV5
        add     r4, r8, #8
        mov     r1, #1
        sub     r0, r2, #1
        str     r4, [sp, #0x7C]
        str     r8, [sp, #0x58]
        str     r3, [sp, #0x18]
        str     r2, [sp, #0x5C]
        str     r9, [sp, #0x70]
        str     r7, [sp, #0x74]
LCNV2:
        cmp     r0, #0
        mov     r5, lr
        mov     r4, r12
        mov     r9, r1
        movle   r3, #0
        movle   r2, r3
        ble     LCNV4
        ldr     r6, [sp, #0x7C]
        ldr     r7, [sp, #0x58]
        mov     r8, #0
        str     r11, [sp, #0x6C]
        ldr     r11, [sp, #0x5C]
        mov     r2, r8
        mov     r3, r2
        str     r3, [sp, #0x50]
        str     r2, [sp, #0x54]
        str     r0, [sp, #0x78]
        str     r1, [sp, #0x60]
        str     r12, [sp, #0x64]
        str     lr, [sp, #0x68]
        str     r10, [sp, #0x1C]
LCNV3:
        ldr     r12, [sp, #0x80]
        ldr     r0, [r7]
        ldr     r1, [r7, #4]
        add     r10, r12, r9, lsl #4
        ldr     r2, [r12, +r9, lsl #4]
        ldr     r3, [r10, #4]
        bl      __muldf3
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        ldr     r2, [r6]
        ldr     r3, [r10, #0xC]
        ldr     r12, [r6, #4]
        ldr     lr, [r10, #8]
        mov     r5, r0
        mov     r0, r2
        mov     r4, r1
        mov     r1, r12
        mov     r2, lr
        bl      __muldf3
        ldr     r2, [sp, #0x54]
        ldr     r3, [sp, #0x50]
        bl      __adddf3
        ldr     r12, [sp, #0x60]
        str     r0, [sp, #0x54]
        add     r9, r12, r9
        cmp     r9, r11
        str     r1, [sp, #0x50]
        subge   r9, r9, r11
        ldr     r12, [sp, #0x78]
        add     r8, r8, #2
        add     r6, r6, #0x10
        cmp     r8, r12
        add     r7, r7, #0x10
        blt     LCNV3
        ldr     r3, [sp, #0x50]
        ldr     r2, [sp, #0x54]
        ldr     r0, [sp, #0x78]
        ldr     r1, [sp, #0x60]
        ldr     r12, [sp, #0x64]
        ldr     lr, [sp, #0x68]
        ldr     r11, [sp, #0x6C]
        ldr     r10, [sp, #0x1C]
LCNV4:
        str     r2, [r11, #8]
        str     r5, [r11]
        str     r4, [r11, #4]
        str     r3, [r11, #0xC]
        ldr     r2, [sp, #0x18]
        add     r1, r1, #1
        cmp     r1, r10
        add     r11, r11, r2, lsl #4
        blt     LCNV2
        ldr     r8, [sp, #0x58]
        ldr     r3, [sp, #0x18]
        ldr     r2, [sp, #0x5C]
        ldr     r9, [sp, #0x70]
        ldr     r7, [sp, #0x74]
LCNV5:
        ldr     r0, [sp, #0x48]
        mov     r12, r3, asr #1
        cmp     r12, #1
        add     r7, r7, #8
        add     r9, r9, #8
        add     r0, r0, r2, lsl #4
        blt     LCNV13
        sub     r1, r2, #1
        add     r4, r8, #8
        mov     r1, r1, lsl #1
        add     r5, r8, #0x18
        add     r6, r8, #0x10
        mov     lr, #0x20
        str     lr, [sp, #0x38]
        str     r6, [sp, #0x3C]
        str     r5, [sp, #0x40]
        str     r4, [sp, #0x44]
        str     r1, [sp, #0x48]
        str     r10, [sp, #0x1C]
        str     r8, [sp, #0x58]
        str     r3, [sp, #0x18]
        str     r2, [sp, #0x5C]
LCNV6:
        ldr     r5, [sp, #0x18]
        ldr     lr, [r7]
        ldr     r3, [r7, #4]
        ldr     r2, [r7, #8]
        ldr     r1, [r7, #0xC]
        add     r4, r9, r5, lsl #4
        ldr     r6, [sp, #0x1C]
        add     r5, r7, r5, lsl #3
        str     r5, [sp, #0x60]
        ldr     r5, [sp, #0x84]
        str     r4, [sp, #0x34]
        cmp     r6, #1
        add     r5, r7, r5, lsl #3
        str     r5, [sp, #0x64]
        ldr     r5, [sp, #0x38]
        mov     r10, lr
        mov     r8, r3
        sub     r4, r4, r5
        str     r4, [sp, #0x30]
        mov     r6, r2
        mov     r5, r1
        ble     LCNV15
        mov     r4, #1
        str     r4, [sp, #0x6C]
        ldr     r4, [sp, #0x5C]
        str     r5, [sp, #0x10]
        str     r6, [sp, #4]
        add     r4, r0, r4, lsl #4
        str     r4, [sp]
        ldr     r4, [sp, #0x58]
        str     r8, [sp, #8]
        str     r10, [sp, #0xC]
        sub     r11, r4, #4
        str     r11, [sp, #0x70]
        sub     r11, r4, #0xC
        str     r11, [sp, #0x74]
        sub     r11, r4, #0x14
        sub     r4, r4, #0x1C
        str     r4, [sp, #0x7C]
        add     r4, r0, #4
        str     r4, [sp, #0x68]
        ldr     r4, [sp, #0x6C]
        str     r11, [sp, #0x78]
        str     r1, [sp, #0x20]
        str     r2, [sp, #0x24]
        str     r3, [sp, #0x28]
        str     lr, [sp, #0x2C]
        str     r12, [sp, #0x4C]
        str     r0, [sp, #0x14]
        str     r9, [sp, #0x50]
        str     r7, [sp, #0x54]
LCNV7:
        ldr     r3, [sp, #0x68]
        ldr     r12, [sp, #0x14]
        ldr     r1, [sp, #0x60]
        ldr     r10, [r3, #0x14]
        ldr     r7, [r3, #0x18]
        ldr     r8, [r1, #4]
        ldr     r12, [r12, +r4, lsl #4]
        ldr     r11, [r1]
        str     r12, [sp, #0x88]
        ldr     r12, [sp, #0x68]
        ldr     r2, [sp, #0x88]
        mov     r0, r11
        mov     r1, r8
        ldr     r5, [r12, #0x10]
        ldr     r12, [sp, #0x60]
        ldr     r6, [r12, #0xC]
        ldr     r9, [r12, #8]
        mov     r3, r5
        bl      __muldf3
        str     r0, [sp, #0x8C]
        str     r1, [sp, #0x90]
        mov     r3, r7
        mov     r1, r6
        mov     r2, r10
        mov     r0, r9
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x8C]
        mov     r3, r1
        ldr     r1, [sp, #0x90]
        bl      __subdf3
        ldr     r2, [sp, #0x88]
        str     r0, [sp, #0x90]
        str     r1, [sp, #0x8C]
        mov     r3, r5
        mov     r1, r6
        mov     r0, r9
        bl      __muldf3
        mov     r5, r0
        mov     r6, r1
        mov     r2, r10
        mov     r0, r11
        mov     r3, r7
        mov     r1, r8
        bl      __muldf3
        mov     r3, r6
        mov     r2, r5
        bl      __adddf3
        ldr     r2, [sp, #0x64]
        ldr     r12, [sp]
        ldr     r3, [r2, #8]
        str     r3, [sp, #0x88]
        ldr     r9, [r2, #0xC]
        ldr     r11, [r2]
        ldr     r7, [r2, #4]
        ldr     r2, [sp]
        rsb     r3, r4, #0
        add     r4, r4, #1
        ldr     r5, [r2, +r3, lsl #4]
        str     r0, [sp, #0x94]
        add     r3, r12, r3, lsl #4
        ldr     r8, [r3, #4]
        ldr     r10, [r3, #8]
        ldr     r6, [r3, #0xC]
        str     r1, [sp, #0x98]
        mov     r0, r11
        mov     r1, r7
        mov     r2, r5
        mov     r3, r8
        bl      __muldf3
        str     r0, [sp, #0x9C]
        ldr     r0, [sp, #0x88]
        str     r1, [sp, #0xA0]
        mov     r1, r9
        mov     r2, r10
        mov     r3, r6
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [sp, #0x9C]
        ldr     r1, [sp, #0xA0]
        bl      __subdf3
        str     r0, [sp, #0xA0]
        ldr     r0, [sp, #0x88]
        str     r1, [sp, #0x9C]
        mov     r2, r5
        mov     r1, r9
        mov     r3, r8
        bl      __muldf3
        mov     r5, r0
        mov     r8, r1
        mov     r3, r6
        mov     r0, r11
        mov     r1, r7
        mov     r2, r10
        bl      __muldf3
        mov     r2, r5
        mov     r3, r8
        bl      __adddf3
        ldr     r2, [sp, #0xA0]
        ldr     r3, [sp, #0x9C]
        mov     r5, r0
        ldr     r0, [sp, #0x90]
        mov     r6, r1
        ldr     r1, [sp, #0x8C]
        bl      __adddf3
        mov     r8, r0
        ldr     r0, [sp, #0x94]
        mov     r7, r1
        ldr     r1, [sp, #0x98]
        mov     r2, r5
        mov     r3, r6
        bl      __adddf3
        mov     r9, r0
        ldr     r0, [sp, #0xC]
        mov     r10, r1
        ldr     r1, [sp, #8]
        mov     r2, r8
        mov     r3, r7
        bl      __adddf3
        str     r0, [sp, #0xC]
        ldr     r0, [sp, #4]
        str     r1, [sp, #8]
        ldr     r1, [sp, #0x10]
        mov     r2, r9
        mov     r3, r10
        bl      __adddf3
        ldr     r12, [sp, #0x7C]
        str     r0, [sp, #4]
        str     r1, [sp, #0x10]
        str     r8, [r12, #0x1C]
        str     r7, [r12, #0x20]
        ldr     r12, [sp, #0x78]
        str     r9, [r12, #0x1C]
        str     r10, [r12, #0x20]
        ldr     r0, [sp, #0x90]
        ldr     r1, [sp, #0x8C]
        ldr     r2, [sp, #0xA0]
        ldr     r3, [sp, #0x9C]
        bl      __subdf3
        ldr     r12, [sp, #0x74]
        mov     r2, r5
        str     r0, [r12, #0x1C]
        str     r1, [r12, #0x20]
        ldr     r0, [sp, #0x94]
        ldr     r1, [sp, #0x98]
        mov     r3, r6
        bl      __subdf3
        ldr     r2, [sp, #0x70]
        str     r0, [r2, #0x1C]
        str     r1, [r2, #0x20]
        ldr     r0, [sp, #0x1C]
        ldr     r1, [sp, #0x60]
        cmp     r4, r0
        ldr     r0, [sp, #0x18]
        add     r1, r1, r0, lsl #3
        str     r1, [sp, #0x60]
        ldr     r1, [sp, #0x64]
        sub     r1, r1, r0, lsl #3
        ldr     r0, [sp, #0x70]
        str     r1, [sp, #0x64]
        add     r0, r0, #0x20
        str     r0, [sp, #0x70]
        ldr     r0, [sp, #0x74]
        add     r0, r0, #0x20
        str     r0, [sp, #0x74]
        ldr     r0, [sp, #0x78]
        add     r0, r0, #0x20
        str     r0, [sp, #0x78]
        ldr     r0, [sp, #0x7C]
        add     r0, r0, #0x20
        str     r0, [sp, #0x7C]
        ldr     r0, [sp, #0x68]
        add     r0, r0, #0x10
        str     r0, [sp, #0x68]
        blt     LCNV7
        ldr     r5, [sp, #0x10]
        ldr     r6, [sp, #4]
        ldr     r8, [sp, #8]
        ldr     r10, [sp, #0xC]
        ldr     r1, [sp, #0x20]
        ldr     r2, [sp, #0x24]
        ldr     r3, [sp, #0x28]
        ldr     lr, [sp, #0x2C]
        ldr     r12, [sp, #0x4C]
        ldr     r9, [sp, #0x50]
        ldr     r7, [sp, #0x54]
LCNV8:
        ldr     r0, [sp, #0x1C]
        str     r10, [r9]
        str     r8, [r9, #4]
        cmp     r0, #1
        str     r6, [r9, #8]
        str     r5, [r9, #0xC]
        ble     LCNV12
        ldr     r11, [sp, #0x30]
        ldr     r10, [sp, #0x34]
        mov     r4, #1
        str     r1, [sp, #0x20]
        str     r2, [sp, #0x24]
        str     r3, [sp, #0x28]
        str     lr, [sp, #0x2C]
        str     r12, [sp, #0x4C]
        str     r9, [sp, #0x50]
        str     r7, [sp, #0x54]
LCNV9:
        ldr     r0, [sp, #0x48]
        mov     r1, r4
        cmp     r0, #0
        ldr     r0, [sp, #0x2C]
        str     r0, [sp, #0x70]
        ldr     r0, [sp, #0x28]
        str     r0, [sp, #0x6C]
        ldr     r0, [sp, #0x24]
        str     r0, [sp, #0x64]
        ldr     r0, [sp, #0x20]
        str     r0, [sp, #0x68]
        ble     LCNV14
        mov     r12, #0
        mov     r6, r12
        ldr     r0, [sp, #0x40]
        ldr     r2, [sp, #0x44]
        ldr     r3, [sp, #0x58]
        mov     r9, r6
        ldr     r5, [sp, #0x3C]
        mov     r8, r9
        mov     r7, r8
        str     r9, [sp, #0x60]
        ldr     r9, [sp, #0x5C]
        str     r7, [sp, #0x78]
        str     r8, [sp, #0x74]
        str     r6, [sp, #0x14]
        str     r4, [sp, #0x7C]
        str     r12, [sp, #0x10]
        str     r11, [sp, #0x30]
        str     r10, [sp, #0x34]
        mov     r4, r0
        mov     r8, r1
        mov     r6, r2
        mov     r7, r3
LCNV10:
        ldr     r12, [sp, #0x80]
        ldr     r0, [r7]
        ldr     r1, [r7, #4]
        ldr     r11, [r12, +r8, lsl #4]
        add     r12, r12, r8, lsl #4
        str     r12, [sp, #0xA0]
        ldr     r10, [r12, #4]
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0x70]
        ldr     r3, [sp, #0x6C]
        bl      __adddf3
        ldr     r2, [r6]
        ldr     r3, [r6, #4]
        str     r0, [sp, #0x70]
        str     r1, [sp, #0x6C]
        mov     r0, r2
        mov     r1, r3
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0x64]
        ldr     r3, [sp, #0x68]
        bl      __adddf3
        ldr     r12, [sp, #0xA0]
        ldr     r2, [r4]
        ldr     r3, [r4, #4]
        ldr     r11, [r12, #8]
        ldr     r10, [r12, #0xC]
        str     r0, [sp, #0x64]
        str     r1, [sp, #0x68]
        mov     r0, r2
        mov     r1, r3
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0x74]
        ldr     r3, [sp, #0x78]
        bl      __adddf3
        ldr     r2, [r5]
        ldr     r3, [r5, #4]
        str     r0, [sp, #0x74]
        str     r1, [sp, #0x78]
        mov     r0, r2
        mov     r1, r3
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0x14]
        ldr     r3, [sp, #0x60]
        bl      __adddf3
        ldr     r12, [sp, #0x7C]
        str     r0, [sp, #0x14]
        add     r8, r12, r8
        cmp     r8, r9
        str     r1, [sp, #0x60]
        subge   r8, r8, r9
        ldr     r12, [sp, #0x10]
        ldr     lr, [sp, #0x48]
        add     r5, r5, #0x20
        add     r12, r12, #4
        str     r12, [sp, #0x10]
        cmp     r12, lr
        add     r4, r4, #0x20
        add     r6, r6, #0x20
        add     r7, r7, #0x20
        blt     LCNV10
        ldr     r7, [sp, #0x78]
        ldr     r8, [sp, #0x74]
        ldr     r9, [sp, #0x60]
        ldr     r6, [sp, #0x14]
        ldr     r4, [sp, #0x7C]
        ldr     r11, [sp, #0x30]
        ldr     r10, [sp, #0x34]
LCNV11:
        ldr     r0, [sp, #0x70]
        ldr     r5, [sp, #0x6C]
        mov     r2, r8
        mov     r3, r7
        mov     r1, r5
        bl      __subdf3
        str     r0, [r10]
        str     r1, [r10, #4]
        ldr     r2, [sp, #0x64]
        ldr     r3, [sp, #0x68]
        mov     r0, r6
        mov     r1, r9
        bl      __adddf3
        str     r0, [r10, #8]
        str     r1, [r10, #0xC]
        ldr     r0, [sp, #0x70]
        mov     r1, r5
        mov     r2, r8
        mov     r3, r7
        bl      __adddf3
        str     r0, [r11]
        str     r1, [r11, #4]
        ldr     r2, [sp, #0x64]
        ldr     r3, [sp, #0x68]
        mov     r0, r6
        mov     r1, r9
        bl      __subdf3
        str     r0, [r11, #8]
        str     r1, [r11, #0xC]
        ldr     r0, [sp, #0x1C]
        add     r4, r4, #1
        cmp     r4, r0
        ldr     r0, [sp, #0x18]
        add     r10, r10, r0, lsl #4
        add     r11, r11, r0, lsl #4
        blt     LCNV9
        ldr     r12, [sp, #0x4C]
        ldr     r9, [sp, #0x50]
        ldr     r7, [sp, #0x54]
LCNV12:
        ldr     r1, [sp, #0x38]
        ldr     r0, [sp]
        subs    r12, r12, #1
        add     r1, r1, #0x20
        add     r7, r7, #0x10
        add     r9, r9, #0x10
        str     r1, [sp, #0x38]
        bne     LCNV6
LCNV13:
        add     sp, sp, #0xA4
        ldmia   sp!, {r4 - r11, pc}
LCNV14:
        mov     r7, #0
        mov     r6, r7
        mov     r9, r6
        mov     r8, r9
        b       LCNV11
LCNV15:
        ldr     r4, [sp, #0x5C]
        add     r4, r0, r4, lsl #4
        str     r4, [sp]
        b       LCNV8


