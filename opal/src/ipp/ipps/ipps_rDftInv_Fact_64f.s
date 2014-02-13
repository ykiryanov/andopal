        .text
        .align  4
        .globl  _ipps_rDftInv_Fact_64f


_ipps_rDftInv_Fact_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x88
        ldr     r12, [sp, #0xAC]
        ldr     lr, [sp, #0xB4]
        mov     r6, r3
        str     r12, [sp, #0x7C]
        ldr     r12, [sp, #0xB0]
        str     r12, [sp, #0x44]
        rsb     r12, r6, #0
        mla     r8, r2, r6, r12
        add     r12, r2, #1
        add     r7, r0, r6, lsl #4
        str     r8, [sp, #0x80]
        ldr     r4, [r0]
        mov     r12, r12, asr #1
        cmp     r12, #1
        str     r4, [sp, #0x48]
        ldr     r5, [r0, #4]
        add     r9, r1, r6, lsl #3
        add     r8, r1, r8, lsl #3
        str     r5, [sp, #0x40]
        sub     r7, r7, #8
        str     r9, [sp, #0x68]
        str     r8, [sp, #0x64]
        ble     LCNO3
        sub     r8, r12, #1
        cmp     r8, #4
        blt     LCNO17
        sub     r10, lr, #4
        str     r10, [sp, #0x78]
        str     r5, [sp, #0x4C]
        ldr     r5, [sp, #0x78]
        mov     r9, #0
        add     r11, lr, #8
        sub     r3, r12, #4
        mov     r8, #1
        sub     r10, lr, #0xC
        str     r9, [sp, #0x5C]
        str     r11, [sp, #0x6C]
        str     r3, [sp, #0x60]
        str     r12, [sp, #0x50]
        str     lr, [sp, #0x54]
        str     r2, [sp, #0x58]
        str     r1, [sp, #0x70]
        str     r0, [sp, #0x74]
LCNO0:
        ldr     r0, [r7]
        ldr     r1, [r7, #4]
        mov     r2, #0
        mov     r3, #1, 2
        bl      __muldf3
        ldr     r3, [sp, #0x4C]
        mov     r9, r0
        mov     r11, r1
        mov     r2, r4
        bl      __adddf3
        str     r9, [r10, #0xC]
        str     r11, [r10, #0x10]
        ldr     r9, [r7, #8]
        ldr     r11, [r7, #0xC]
        str     r0, [sp, #0x4C]
        mov     r4, r1
        mov     r0, r9
        mov     r2, #0
        mov     r3, #1, 2
        mov     r1, r11
        bl      __muldf3
        str     r0, [r5, #0xC]
        str     r1, [r5, #0x10]
        ldr     r0, [r7, +r6, lsl #4]
        add     r7, r7, r6, lsl #4
        ldr     r1, [r7, #4]
        mov     r2, #0
        mov     r3, #1, 2
        bl      __muldf3
        ldr     r2, [sp, #0x4C]
        mov     r11, r1
        mov     r9, r0
        mov     r3, r4
        bl      __adddf3
        str     r9, [r10, #0x1C]
        str     r11, [r10, #0x20]
        ldr     r2, [r7, #8]
        ldr     r3, [r7, #0xC]
        mov     r4, r0
        str     r1, [sp, #0x4C]
        mov     r0, r2
        mov     r1, r3
        mov     r2, #0
        mov     r3, #1, 2
        bl      __muldf3
        str     r0, [r5, #0x1C]
        str     r1, [r5, #0x20]
        add     r9, r7, r6, lsl #4
        ldr     r0, [r7, +r6, lsl #4]
        ldr     r1, [r9, #4]
        mov     r2, #0
        mov     r3, #1, 2
        bl      __muldf3
        ldr     r3, [sp, #0x4C]
        mov     r7, r0
        mov     r11, r1
        mov     r2, r4
        bl      __adddf3
        str     r7, [r10, #0x2C]
        str     r11, [r10, #0x30]!
        ldr     r2, [r9, #8]
        ldr     r3, [r9, #0xC]
        str     r1, [sp, #0x4C]
        mov     r4, r0
        mov     r0, r2
        mov     r1, r3
        mov     r2, #0
        mov     r3, #1, 2
        bl      __muldf3
        str     r1, [r5, #0x30]
        str     r0, [r5, #0x2C]
        ldr     r1, [sp, #0x60]
        add     r8, r8, #3
        add     r7, r9, r6, lsl #4
        cmp     r8, r1
        ldr     r1, [sp, #0x5C]
        add     r5, r5, #0x30
        add     r1, r1, #6
        str     r1, [sp, #0x5C]
        ble     LCNO0
        ldr     r9, [sp, #0x5C]
        ldr     r11, [sp, #0x6C]
        ldr     r5, [sp, #0x4C]
        ldr     r12, [sp, #0x50]
        ldr     lr, [sp, #0x54]
        ldr     r2, [sp, #0x58]
        ldr     r1, [sp, #0x70]
        ldr     r0, [sp, #0x74]
LCNO1:
        mov     r10, r9, lsl #3
        sub     r10, r10, #0xC
        add     r3, r10, r11
        add     r10, r10, lr
        str     r3, [sp, #0x78]
        str     r11, [sp, #0x6C]
        str     r12, [sp, #0x50]
        str     lr, [sp, #0x54]
        str     r6, [sp, #0x10]
        str     r2, [sp, #0x58]
        str     r1, [sp, #0x70]
        str     r0, [sp, #0x74]
LCNO2:
        ldr     r0, [r7]
        ldr     r1, [r7, #4]
        mov     r2, #0
        mov     r3, #1, 2
        bl      __muldf3
        mov     r6, r0
        mov     r11, r1
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        str     r6, [r10, #0xC]
        str     r11, [r10, #0x10]!
        ldr     r2, [r7, #8]
        ldr     r3, [r7, #0xC]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r2
        mov     r1, r3
        mov     r2, #0
        mov     r3, #1, 2
        bl      __muldf3
        ldr     r12, [sp, #0x6C]
        add     r8, r8, #1
        str     r0, [r12, +r9, lsl #3]
        ldr     r12, [sp, #0x78]
        add     r9, r9, #2
        str     r1, [r12, #0x10]
        ldr     r12, [sp, #0x50]
        cmp     r8, r12
        ldr     r12, [sp, #0x10]
        add     r7, r7, r12, lsl #4
        ldr     r12, [sp, #0x78]
        add     r12, r12, #0x10
        str     r12, [sp, #0x78]
        blt     LCNO2
        ldr     r12, [sp, #0x50]
        ldr     lr, [sp, #0x54]
        ldr     r6, [sp, #0x10]
        ldr     r2, [sp, #0x58]
        ldr     r1, [sp, #0x70]
        ldr     r0, [sp, #0x74]
LCNO3:
        cmp     r12, #1
        str     r4, [r1]
        str     r5, [r1, #4]
        ble     LCNO7
        ldr     r10, [sp, #0x64]
        ldr     r11, [sp, #0x68]
        sub     r7, r2, #1
        add     r5, lr, #8
        mov     r4, #1
        str     r5, [sp, #0x78]
        str     r7, [sp, #0x6C]
        str     r12, [sp, #0x50]
        str     lr, [sp, #0x54]
        str     r2, [sp, #0x58]
        str     r1, [sp, #0x70]
        str     r0, [sp, #0x74]
LCNO4:
        ldr     r0, [sp, #0x6C]
        ldr     r7, [sp, #0x48]
        ldr     r5, [sp, #0x40]
        cmp     r0, #0
        mov     r1, r4
        movle   r9, #0
        movle   r8, r9
        ble     LCNO6
        ldr     r2, [sp, #0x78]
        ldr     r3, [sp, #0x54]
        mov     r0, #0
        mov     r8, r0
        mov     r9, r8
        str     r6, [sp, #0x10]
        ldr     r6, [sp, #0x58]
        str     r9, [sp, #0x4C]
        str     r8, [sp, #0x5C]
        str     r10, [sp, #0x64]
        str     r11, [sp, #0x68]
        str     r4, [sp, #0x60]
        mov     r10, r0
        mov     r11, r1
        mov     r8, r2
        mov     r9, r3
LCNO5:
        ldr     r12, [sp, #0x7C]
        ldr     r0, [r9]
        ldr     r1, [r9, #4]
        add     r4, r12, r11, lsl #4
        ldr     r2, [r12, +r11, lsl #4]
        ldr     r3, [r4, #4]
        bl      __muldf3
        mov     r2, r7
        mov     r3, r5
        bl      __adddf3
        ldr     r2, [r8]
        ldr     r3, [r4, #0xC]
        ldr     r12, [r8, #4]
        ldr     lr, [r4, #8]
        mov     r7, r0
        mov     r0, r2
        mov     r5, r1
        mov     r1, r12
        mov     r2, lr
        bl      __muldf3
        ldr     r2, [sp, #0x5C]
        ldr     r3, [sp, #0x4C]
        bl      __adddf3
        ldr     r12, [sp, #0x60]
        str     r0, [sp, #0x5C]
        add     r11, r12, r11
        cmp     r11, r6
        str     r1, [sp, #0x4C]
        subge   r11, r11, r6
        ldr     r12, [sp, #0x6C]
        add     r10, r10, #2
        add     r8, r8, #0x10
        cmp     r10, r12
        add     r9, r9, #0x10
        blt     LCNO5
        ldr     r9, [sp, #0x4C]
        ldr     r8, [sp, #0x5C]
        ldr     r4, [sp, #0x60]
        ldr     r10, [sp, #0x64]
        ldr     r11, [sp, #0x68]
        ldr     r6, [sp, #0x10]
LCNO6:
        mov     r0, r7
        mov     r1, r5
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        str     r0, [r11]
        str     r1, [r11, #4]
        mov     r0, r7
        mov     r1, r5
        mov     r2, r8
        mov     r3, r9
        bl      __subdf3
        str     r0, [r10]
        str     r1, [r10, #4]
        ldr     r0, [sp, #0x50]
        add     r4, r4, #1
        add     r11, r11, r6, lsl #3
        cmp     r4, r0
        sub     r10, r10, r6, lsl #3
        blt     LCNO4
        ldr     r12, [sp, #0x50]
        ldr     lr, [sp, #0x54]
        ldr     r2, [sp, #0x58]
        ldr     r1, [sp, #0x70]
        ldr     r0, [sp, #0x74]
LCNO7:
        add     r7, r1, #8
        ldr     r1, [sp, #0x44]
        mov     r4, r6, asr #1
        cmp     r4, #1
        add     r0, r0, #8
        add     r1, r1, r2, lsl #4
        blt     LCNO15
        sub     r5, r2, #1
        add     r9, lr, #8
        mov     r5, r5, lsl #1
        add     r10, lr, #0x18
        add     r11, lr, #0x10
        mov     r8, #0x20
        str     r8, [sp, #0x2C]
        str     r11, [sp, #0x30]
        str     r10, [sp, #0x34]
        str     r9, [sp, #0x38]
        str     r5, [sp, #0x3C]
        str     r4, [sp, #0x40]
        str     lr, [sp, #0x54]
        str     r6, [sp, #0x10]
        str     r2, [sp, #0x58]
LCNO8:
        ldr     r4, [sp, #0x10]
        ldr     r6, [r0]
        ldr     lr, [r0, #4]
        ldr     r3, [r0, #8]
        ldr     r2, [r0, #0xC]
        add     r5, r0, r4, lsl #4
        ldr     r8, [sp, #0x2C]
        add     r4, r7, r4, lsl #3
        str     r4, [sp, #0x28]
        ldr     r4, [sp, #0x80]
        str     r5, [sp, #0x5C]
        sub     r5, r5, r8
        str     r5, [sp, #0x60]
        add     r4, r7, r4, lsl #3
        cmp     r12, #1
        str     r4, [sp, #0x24]
        mov     r10, r6
        mov     r9, lr
        mov     r8, r3
        mov     r5, r2
        ble     LCNO10
        ldr     r4, [sp, #0x54]
        str     r5, [sp, #8]
        str     r8, [sp, #0xC]
        sub     r11, r4, #4
        str     r11, [sp, #0x68]
        sub     r11, r4, #0xC
        str     r11, [sp, #0x6C]
        sub     r11, r4, #0x14
        sub     r4, r4, #0x1C
        str     r4, [sp, #0x74]
        str     r11, [sp, #0x70]
        str     r9, [sp, #4]
        str     r10, [sp]
        ldr     r9, [sp, #0x74]
        ldr     r10, [sp, #0x6C]
        ldr     r11, [sp, #0x60]
        ldr     r8, [sp, #0x5C]
        sub     r4, r12, #1
        str     r4, [sp, #0x64]
        str     r2, [sp, #0x14]
        str     r3, [sp, #0x18]
        str     lr, [sp, #0x1C]
        str     r6, [sp, #0x20]
        str     r1, [sp, #0x44]
        str     r7, [sp, #0x48]
        str     r0, [sp, #0x4C]
        str     r12, [sp, #0x50]
LCNO9:
        ldr     r2, [r11]
        ldr     r3, [r11, #4]
        ldr     r0, [r8]
        ldr     r1, [r8, #4]
        bl      __adddf3
        ldr     r2, [r11, #8]
        ldr     r3, [r11, #0xC]
        ldr     r5, [r8, #8]
        ldr     r4, [r8, #0xC]
        mov     r6, r0
        mov     r7, r1
        mov     r0, r5
        mov     r1, r4
        bl      __subdf3
        mov     r4, r0
        mov     r5, r1
        ldr     r0, [sp]
        ldr     r1, [sp, #4]
        mov     r2, r6
        mov     r3, r7
        bl      __adddf3
        str     r0, [sp]
        ldr     r0, [sp, #0xC]
        str     r1, [sp, #4]
        ldr     r1, [sp, #8]
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        str     r6, [r9, #0x1C]
        str     r7, [r9, #0x20]!
        ldr     r12, [sp, #0x70]
        str     r4, [r12, #0x1C]
        str     r5, [r12, #0x20]
        ldr     r2, [r11]
        ldr     r3, [r11, #4]
        ldr     r5, [r8]
        ldr     r4, [r8, #4]
        str     r0, [sp, #0xC]
        str     r1, [sp, #8]
        mov     r0, r5
        mov     r1, r4
        bl      __subdf3
        str     r0, [r10, #0x1C]
        str     r1, [r10, #0x20]!
        ldr     r0, [r8, #8]
        ldr     r1, [r8, #0xC]
        ldr     r2, [r11, #8]
        ldr     r3, [r11, #0xC]
        bl      __adddf3
        ldr     r2, [sp, #0x68]
        str     r0, [r2, #0x1C]
        str     r1, [r2, #0x20]
        ldr     r0, [sp, #0x64]
        subs    r0, r0, #1
        str     r0, [sp, #0x64]
        ldr     r0, [sp, #0x10]
        add     r8, r8, r0, lsl #4
        add     r11, r11, r0, lsl #4
        ldr     r0, [sp, #0x68]
        add     r0, r0, #0x20
        str     r0, [sp, #0x68]
        ldr     r0, [sp, #0x70]
        add     r0, r0, #0x20
        str     r0, [sp, #0x70]
        ldr     r0, [sp, #0x64]
        bne     LCNO9
        ldr     r5, [sp, #8]
        ldr     r8, [sp, #0xC]
        ldr     r9, [sp, #4]
        ldr     r10, [sp]
        ldr     r2, [sp, #0x14]
        ldr     r3, [sp, #0x18]
        ldr     lr, [sp, #0x1C]
        ldr     r6, [sp, #0x20]
        ldr     r1, [sp, #0x44]
        ldr     r7, [sp, #0x48]
        ldr     r0, [sp, #0x4C]
        ldr     r12, [sp, #0x50]
LCNO10:
        cmp     r12, #1
        str     r10, [r7]
        str     r9, [r7, #4]
        str     r8, [r7, #8]
        str     r5, [r7, #0xC]
        ldrle   r2, [sp, #0x58]
        addle   r8, r1, r2, lsl #4
        ble     LCNO14
        ldr     r4, [sp, #0x58]
        mov     r5, #1
        str     r2, [sp, #0x14]
        add     r8, r1, r4, lsl #4
        add     r4, r1, #0xC
        str     r8, [sp, #0x70]
        str     r3, [sp, #0x18]
        str     lr, [sp, #0x1C]
        str     r6, [sp, #0x20]
        str     r1, [sp, #0x44]
        str     r7, [sp, #0x48]
        str     r0, [sp, #0x4C]
        str     r12, [sp, #0x50]
LCNO11:
        ldr     r0, [sp, #0x3C]
        cmp     r0, #0
        ldr     r0, [sp, #0x20]
        str     r0, [sp, #0x60]
        ldr     r0, [sp, #0x1C]
        str     r0, [sp, #0x5C]
        ldr     r0, [sp, #0x18]
        str     r0, [sp, #8]
        ldr     r0, [sp, #0x14]
        str     r0, [sp, #0xC]
        mov     r0, r5
        ble     LCNO16
        mov     r2, #0
        mov     r6, r2
        str     r6, [sp]
        ldr     r8, [sp, #0x30]
        ldr     r9, [sp, #0x34]
        ldr     r10, [sp, #0x38]
        ldr     r11, [sp, #0x54]
        str     r6, [sp, #4]
        str     r5, [sp, #0x6C]
        ldr     r5, [sp, #0x58]
        mov     r7, r6
        str     r4, [sp, #0x74]
        str     r7, [sp, #0x68]
        str     r6, [sp, #0x64]
        str     r2, [sp, #0x78]
        mov     r4, r0
LCNO12:
        ldr     r3, [sp, #0x7C]
        ldr     r0, [r11]
        ldr     r1, [r11, #4]
        ldr     r7, [r3, +r4, lsl #4]
        add     r3, r3, r4, lsl #4
        str     r3, [sp, #0x84]
        ldr     r6, [r3, #4]
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        ldr     r2, [sp, #0x60]
        ldr     r3, [sp, #0x5C]
        bl      __adddf3
        ldr     r2, [r10]
        ldr     r3, [r10, #4]
        str     r0, [sp, #0x60]
        str     r1, [sp, #0x5C]
        mov     r0, r2
        mov     r1, r3
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #0xC]
        bl      __adddf3
        ldr     r3, [sp, #0x84]
        ldr     r2, [r9]
        ldr     r7, [r3, #8]
        ldr     r6, [r3, #0xC]
        ldr     r3, [r9, #4]
        str     r0, [sp, #8]
        str     r1, [sp, #0xC]
        mov     r0, r2
        mov     r1, r3
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        ldr     r2, [sp, #0x64]
        ldr     r3, [sp, #0x68]
        bl      __adddf3
        ldr     r2, [r8]
        ldr     r3, [r8, #4]
        str     r0, [sp, #0x64]
        str     r1, [sp, #0x68]
        mov     r0, r2
        mov     r1, r3
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        ldr     r2, [sp]
        ldr     r3, [sp, #4]
        bl      __adddf3
        ldr     r2, [sp, #0x6C]
        str     r0, [sp]
        add     r4, r2, r4
        cmp     r4, r5
        str     r1, [sp, #4]
        subge   r4, r4, r5
        ldr     r1, [sp, #0x78]
        ldr     r2, [sp, #0x3C]
        add     r8, r8, #0x20
        add     r1, r1, #4
        str     r1, [sp, #0x78]
        cmp     r1, r2
        add     r9, r9, #0x20
        add     r10, r10, #0x20
        add     r11, r11, #0x20
        blt     LCNO12
        ldr     r7, [sp, #0x68]
        ldr     r6, [sp, #0x64]
        ldr     r4, [sp, #0x74]
        ldr     r5, [sp, #0x6C]
LCNO13:
        ldr     r1, [sp, #0x5C]
        ldr     r0, [sp, #0x60]
        mov     r2, r6
        mov     r3, r7
        bl      __adddf3
        ldr     r2, [sp]
        ldr     r3, [sp, #4]
        mov     r8, r0
        ldr     r0, [sp, #8]
        mov     r10, r1
        ldr     r1, [sp, #0xC]
        bl      __subdf3
        mov     r11, r1
        ldr     r1, [sp, #0x5C]
        mov     r9, r0
        ldr     r0, [sp, #0x60]
        mov     r2, r6
        mov     r3, r7
        bl      __subdf3
        ldr     r2, [sp]
        str     r0, [sp, #0x84]
        str     r1, [sp, #0x78]
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #0xC]
        ldr     r3, [sp, #4]
        bl      __adddf3
        ldr     r2, [sp, #0x44]
        ldr     r3, [r4, #8]
        mov     r6, r0
        ldr     r2, [r2, +r5, lsl #4]
        str     r1, [sp, #0x68]
        mov     r1, r10
        mov     r0, r8
        bl      __muldf3
        ldr     r2, [r4, #0xC]
        ldr     r3, [r4, #0x10]
        str     r0, [sp, #0x64]
        str     r1, [sp, #0x60]
        mov     r1, r11
        mov     r0, r9
        bl      __muldf3
        ldr     r2, [sp, #0x64]
        ldr     r3, [sp, #0x60]
        bl      __adddf3
        ldr     r7, [sp, #0x28]
        str     r1, [r7, #4]
        str     r0, [r7]
        ldr     r2, [sp, #0x44]
        ldr     r3, [r4, #8]
        mov     r1, r11
        ldr     r2, [r2, +r5, lsl #4]
        mov     r0, r9
        bl      __muldf3
        ldr     r2, [r4, #0xC]
        ldr     r3, [r4, #0x10]!
        mov     r9, r0
        mov     r11, r1
        mov     r1, r10
        mov     r0, r8
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r9
        mov     r1, r11
        bl      __subdf3
        str     r1, [r7, #0xC]
        str     r0, [r7, #8]
        ldr     r1, [sp, #0x70]
        ldr     r0, [sp, #0x84]
        rsb     r10, r5, #0
        ldr     r2, [r1, +r10, lsl #4]
        add     r8, r1, r10, lsl #4
        ldr     r1, [sp, #0x78]
        ldr     r3, [r8, #4]
        bl      __muldf3
        ldr     r2, [r8, #8]
        ldr     r3, [r8, #0xC]
        mov     r11, r1
        ldr     r1, [sp, #0x68]
        mov     r9, r0
        mov     r0, r6
        bl      __muldf3
        mov     r2, r9
        mov     r3, r11
        bl      __adddf3
        ldr     r9, [sp, #0x24]
        str     r1, [r9, #4]
        str     r0, [r9]
        ldr     r1, [sp, #0x70]
        ldr     r3, [r8, #4]
        mov     r0, r6
        ldr     r2, [r1, +r10, lsl #4]
        ldr     r1, [sp, #0x68]
        add     r5, r5, #1
        bl      __muldf3
        ldr     r2, [r8, #8]
        ldr     r3, [r8, #0xC]
        mov     r6, r0
        mov     r8, r1
        ldr     r0, [sp, #0x84]
        ldr     r1, [sp, #0x78]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r6
        mov     r1, r8
        bl      __subdf3
        str     r0, [r9, #8]
        str     r1, [r9, #0xC]
        ldr     r0, [sp, #0x50]
        cmp     r5, r0
        ldr     r0, [sp, #0x10]
        add     r7, r7, r0, lsl #3
        str     r7, [sp, #0x28]
        sub     r9, r9, r0, lsl #3
        str     r9, [sp, #0x24]
        blt     LCNO11
        ldr     r8, [sp, #0x70]
        ldr     r7, [sp, #0x48]
        ldr     r0, [sp, #0x4C]
        ldr     r12, [sp, #0x50]
LCNO14:
        ldr     r1, [sp, #0x40]
        ldr     r3, [sp, #0x2C]
        add     r0, r0, #0x10
        subs    r2, r1, #1
        str     r2, [sp, #0x40]
        add     r3, r3, #0x20
        add     r7, r7, #0x10
        mov     r1, r8
        str     r3, [sp, #0x2C]
        bne     LCNO8
LCNO15:
        add     sp, sp, #0x88
        ldmia   sp!, {r4 - r11, pc}
LCNO16:
        mov     r7, #0
        mov     r6, r7
        str     r6, [sp]
        str     r6, [sp, #4]
        b       LCNO13
LCNO17:
        mov     r8, #1
        mov     r9, #0
        add     r11, lr, #8
        b       LCNO1


