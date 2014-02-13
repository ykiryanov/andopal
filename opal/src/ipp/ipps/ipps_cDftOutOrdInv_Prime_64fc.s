        .text
        .align  4
        .globl  _ipps_cDftOutOrdInv_Prime_64fc


_ipps_cDftOutOrdInv_Prime_64fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x68
        ldr     r4, [sp, #0x8C]
        ldr     lr, [sp, #0x90]
        add     r12, r2, #1
        cmp     r3, #0
        mov     r12, r12, asr #1
        ble     LCOR7
        rsb     r5, r3, #0
        mla     r5, r2, r3, r5
        sub     r7, r2, #1
        add     r8, lr, #0x10
        mov     r6, r3
        str     r6, [sp, #0x60]
        str     r8, [sp, #0x5C]
        str     r7, [sp, #0x58]
        str     r5, [sp, #0x54]
        str     lr, [sp, #0x50]
        str     r4, [sp, #0x4C]
        str     r3, [sp, #0x64]
        str     r2, [sp, #0x48]
LCOR0:
        ldr     r5, [sp, #0x54]
        ldr     r8, [sp, #0x64]
        ldr     r6, [r0]
        ldr     lr, [r0, #4]
        ldr     r3, [r0, #8]
        ldr     r2, [r0, #0xC]
        add     r7, r0, r5, lsl #4
        add     r4, r0, r8, lsl #4
        add     r8, r1, r8, lsl #4
        add     r5, r1, r5, lsl #4
        str     r7, [sp, #0x14]
        str     r8, [sp, #0x38]
        str     r5, [sp, #0x34]
        cmp     r12, #1
        mov     r9, r6
        mov     r8, lr
        mov     r7, r3
        mov     r5, r2
        ble     LCOR2
        ldr     r11, [sp, #0x50]
        str     r5, [sp, #8]
        str     r7, [sp, #4]
        sub     r10, r11, #4
        str     r10, [sp, #0x1C]
        sub     r11, r11, #0x14
        sub     r10, r12, #1
        str     r11, [sp, #0x20]
        str     r10, [sp, #0x18]
        str     r9, [sp, #0x10]
        ldr     r10, [sp, #0x20]
        ldr     r11, [sp, #0x1C]
        ldr     r9, [sp, #0x14]
        str     r8, [sp, #0xC]
        str     r2, [sp, #0x24]
        str     r3, [sp, #0x28]
        str     lr, [sp, #0x2C]
        str     r6, [sp, #0x30]
        str     r12, [sp, #0x3C]
        str     r1, [sp, #0x40]
        str     r0, [sp, #0x44]
LCOR1:
        ldr     r2, [r9]
        ldr     r3, [r9, #4]
        ldr     r0, [r4]
        ldr     r1, [r4, #4]
        bl      __adddf3
        ldr     r2, [r4, #8]
        ldr     r3, [r9, #0xC]
        ldr     r5, [r4, #0xC]
        ldr     r6, [r9, #8]
        mov     r7, r0
        mov     r0, r2
        mov     r8, r1
        mov     r2, r6
        mov     r1, r5
        bl      __adddf3
        mov     r6, r0
        ldr     r0, [sp, #0x10]
        mov     r5, r1
        ldr     r1, [sp, #0xC]
        mov     r2, r7
        mov     r3, r8
        bl      __adddf3
        str     r0, [sp, #0x10]
        ldr     r0, [sp, #4]
        str     r1, [sp, #0xC]
        ldr     r1, [sp, #8]
        mov     r2, r6
        mov     r3, r5
        bl      __adddf3
        str     r6, [r10, #0x1C]
        str     r5, [r10, #0x20]
        str     r7, [r10, #0x14]
        str     r8, [r10, #0x18]
        ldr     r2, [r4]
        ldr     r3, [r9, #4]
        ldr     r5, [r4, #4]
        ldr     r6, [r9]
        str     r0, [sp, #4]
        str     r1, [sp, #8]
        mov     r0, r2
        mov     r1, r5
        mov     r2, r6
        bl      __subdf3
        str     r0, [r11, #0x14]
        str     r1, [r11, #0x18]
        ldr     r0, [r4, #8]
        ldr     r1, [r4, #0xC]
        ldr     r2, [r9, #8]
        ldr     r3, [r9, #0xC]
        bl      __subdf3
        str     r0, [r11, #0x1C]
        str     r1, [r11, #0x20]!
        ldr     r0, [sp, #0x18]
        add     r10, r10, #0x20
        subs    r0, r0, #1
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x64]
        add     r4, r4, r0, lsl #4
        sub     r9, r9, r0, lsl #4
        ldr     r0, [sp, #0x18]
        bne     LCOR1
        ldr     r5, [sp, #8]
        ldr     r7, [sp, #4]
        ldr     r8, [sp, #0xC]
        ldr     r9, [sp, #0x10]
        ldr     r2, [sp, #0x24]
        ldr     r3, [sp, #0x28]
        ldr     lr, [sp, #0x2C]
        ldr     r6, [sp, #0x30]
        ldr     r12, [sp, #0x3C]
        ldr     r1, [sp, #0x40]
        ldr     r0, [sp, #0x44]
LCOR2:
        cmp     r12, #1
        str     r9, [r1]
        str     r8, [r1, #4]
        str     r7, [r1, #8]
        str     r5, [r1, #0xC]
        ble     LCOR6
        ldr     r10, [sp, #0x34]
        ldr     r11, [sp, #0x38]
        mov     r5, #1
        str     r2, [sp, #0x24]
        str     r3, [sp, #0x28]
        str     lr, [sp, #0x2C]
        str     r6, [sp, #0x30]
        str     r12, [sp, #0x3C]
        str     r1, [sp, #0x40]
        str     r0, [sp, #0x44]
LCOR3:
        ldr     r0, [sp, #0x58]
        cmp     r0, #0
        ldr     r0, [sp, #0x30]
        str     r0, [sp, #8]
        ldr     r0, [sp, #0x2C]
        str     r0, [sp, #4]
        ldr     r0, [sp, #0x28]
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #0x24]
        str     r0, [sp, #0x10]
        mov     r0, r5
        ble     LCOR8
        mov     r1, #0
        mov     r9, r1
        ldr     r2, [sp, #0x50]
        mov     r8, r9
        ldr     r4, [sp, #0x5C]
        mov     r7, r8
        mov     r6, r7
        str     r9, [sp]
        ldr     r9, [sp, #0x48]
        str     r6, [sp, #0x1C]
        str     r7, [sp, #0x18]
        str     r5, [sp, #0x20]
        str     r8, [sp, #0xC]
        str     r10, [sp, #0x34]
        str     r11, [sp, #0x38]
        mov     r7, r0
        mov     r6, r1
        mov     r5, r2
LCOR4:
        ldr     r3, [sp, #0x4C]
        ldr     r0, [r5]
        ldr     r1, [r5, #4]
        ldr     r11, [r3, +r7, lsl #4]
        add     r8, r3, r7, lsl #4
        ldr     r10, [r8, #4]
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #4]
        bl      __adddf3
        ldr     r3, [r5, #8]
        ldr     r2, [r5, #0xC]
        str     r1, [sp, #4]
        str     r0, [sp, #8]
        mov     r1, r2
        mov     r0, r3
        mov     r3, r10
        mov     r2, r11
        bl      __muldf3
        ldr     r2, [sp, #0x14]
        ldr     r3, [sp, #0x10]
        bl      __adddf3
        ldr     r10, [r8, #8]
        ldr     r3, [r4, #8]
        ldr     r2, [r4, #0xC]
        ldr     r8, [r8, #0xC]
        str     r0, [sp, #0x14]
        str     r1, [sp, #0x10]
        mov     r0, r3
        mov     r1, r2
        mov     r2, r10
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [sp, #0x18]
        ldr     r3, [sp, #0x1C]
        bl      __adddf3
        ldr     r3, [r4]
        ldr     r2, [r4, #4]
        str     r0, [sp, #0x18]
        str     r1, [sp, #0x1C]
        mov     r0, r3
        mov     r1, r2
        mov     r2, r10
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [sp]
        ldr     r3, [sp, #0xC]
        bl      __adddf3
        ldr     r3, [sp, #0x20]
        str     r0, [sp]
        add     r7, r3, r7
        cmp     r7, r9
        str     r1, [sp, #0xC]
        subge   r7, r7, r9
        ldr     r3, [sp, #0x58]
        add     r6, r6, #2
        add     r4, r4, #0x20
        cmp     r6, r3
        add     r5, r5, #0x20
        blt     LCOR4
        ldr     r6, [sp, #0x1C]
        ldr     r7, [sp, #0x18]
        ldr     r8, [sp, #0xC]
        ldr     r9, [sp]
        ldr     r5, [sp, #0x20]
        ldr     r10, [sp, #0x34]
        ldr     r11, [sp, #0x38]
LCOR5:
        ldr     r4, [sp, #8]
        ldr     r1, [sp, #4]
        mov     r2, r7
        mov     r0, r4
        mov     r3, r6
        bl      __adddf3
        str     r0, [r11]
        str     r1, [r11, #4]
        ldr     r0, [sp, #0x14]
        ldr     r1, [sp, #0x10]
        mov     r2, r9
        mov     r3, r8
        bl      __subdf3
        str     r1, [r11, #0xC]
        str     r0, [r11, #8]
        ldr     r1, [sp, #4]
        mov     r0, r4
        mov     r2, r7
        mov     r3, r6
        bl      __subdf3
        str     r0, [r10]
        str     r1, [r10, #4]
        ldr     r0, [sp, #0x14]
        ldr     r1, [sp, #0x10]
        mov     r2, r9
        mov     r3, r8
        bl      __adddf3
        str     r0, [r10, #8]
        str     r1, [r10, #0xC]
        ldr     r0, [sp, #0x3C]
        add     r5, r5, #1
        cmp     r5, r0
        ldr     r0, [sp, #0x64]
        add     r11, r11, r0, lsl #4
        sub     r10, r10, r0, lsl #4
        blt     LCOR3
        ldr     r12, [sp, #0x3C]
        ldr     r1, [sp, #0x40]
        ldr     r0, [sp, #0x44]
LCOR6:
        ldr     r2, [sp, #0x60]
        add     r0, r0, #0x10
        add     r1, r1, #0x10
        subs    r2, r2, #1
        str     r2, [sp, #0x60]
        bne     LCOR0
LCOR7:
        add     sp, sp, #0x68
        ldmia   sp!, {r4 - r11, pc}
LCOR8:
        mov     r6, #0
        mov     r9, r6
        mov     r8, r9
        mov     r7, r8
        b       LCOR5


