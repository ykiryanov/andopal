        .text
        .align  4
        .globl  _ipps_cDftInv_Prime_64fc


_ipps_cDftInv_Prime_64fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x6C
        ldr     r12, [sp, #0x90]
        ldr     r6, [sp, #0x94]
        ldr     r5, [sp, #0x98]
        mul     r4, r1, r12
        add     lr, r3, #1
        cmp     r12, #0
        mov     lr, lr, asr #1
        ble     LCPH7
        rsb     r7, r4, #0
        mla     r7, r3, r4, r7
        sub     r9, r3, #1
        add     r8, r5, #0x10
        str     r8, [sp, #0x64]
        str     r9, [sp, #0x60]
        str     r7, [sp, #0x5C]
        str     r4, [sp, #0x68]
        str     r5, [sp, #0x58]
        str     r6, [sp, #0x54]
        str     r3, [sp, #0x50]
        str     r1, [sp, #0x4C]
LCPH0:
        ldr     r1, [sp, #0x5C]
        ldr     r6, [sp, #0x68]
        cmp     lr, #1
        add     r1, r0, r1, lsl #4
        str     r1, [sp, #0x1C]
        ldr     r5, [r0]
        ldr     r4, [r0, #4]
        ldr     r3, [r0, #8]
        ldr     r1, [r0, #0xC]
        add     r6, r0, r6, lsl #4
        str     r6, [sp, #0x18]
        mov     r9, r5
        mov     r8, r4
        mov     r7, r3
        mov     r6, r1
        ble     LCPH2
        ldr     r11, [sp, #0x58]
        str     r6, [sp, #0xC]
        str     r7, [sp, #8]
        sub     r10, r11, #4
        str     r10, [sp, #0x24]
        sub     r11, r11, #0x14
        sub     r10, lr, #1
        str     r11, [sp, #0x28]
        str     r10, [sp, #0x20]
        str     r8, [sp, #0x10]
        str     r9, [sp, #0x14]
        ldr     r9, [sp, #0x28]
        ldr     r10, [sp, #0x24]
        ldr     r8, [sp, #0x1C]
        ldr     r11, [sp, #0x18]
        str     r1, [sp, #0x2C]
        str     r3, [sp, #0x30]
        str     r4, [sp, #0x34]
        str     r5, [sp, #0x38]
        str     lr, [sp, #0x3C]
        str     r12, [sp, #0x40]
        str     r2, [sp, #0x44]
        str     r0, [sp, #0x48]
LCPH1:
        ldr     r2, [r8]
        ldr     r3, [r8, #4]
        ldr     r0, [r11]
        ldr     r1, [r11, #4]
        bl      __adddf3
        ldr     r2, [r11, #8]
        ldr     r3, [r8, #0xC]
        ldr     r4, [r11, #0xC]
        ldr     r5, [r8, #8]
        mov     r6, r0
        mov     r0, r2
        mov     r7, r1
        mov     r2, r5
        mov     r1, r4
        bl      __adddf3
        mov     r5, r0
        ldr     r0, [sp, #0x14]
        mov     r4, r1
        ldr     r1, [sp, #0x10]
        mov     r2, r6
        mov     r3, r7
        bl      __adddf3
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #8]
        str     r1, [sp, #0x10]
        ldr     r1, [sp, #0xC]
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        str     r5, [r9, #0x1C]
        str     r4, [r9, #0x20]
        str     r6, [r9, #0x14]
        str     r7, [r9, #0x18]
        ldr     r2, [r11]
        ldr     r3, [r8, #4]
        ldr     r4, [r11, #4]
        ldr     r5, [r8]
        str     r0, [sp, #8]
        str     r1, [sp, #0xC]
        mov     r0, r2
        mov     r1, r4
        mov     r2, r5
        bl      __subdf3
        str     r0, [r10, #0x14]
        str     r1, [r10, #0x18]
        ldr     r0, [r11, #8]
        ldr     r1, [r11, #0xC]
        ldr     r2, [r8, #8]
        ldr     r3, [r8, #0xC]
        bl      __subdf3
        str     r0, [r10, #0x1C]
        str     r1, [r10, #0x20]!
        ldr     r0, [sp, #0x20]
        add     r9, r9, #0x20
        subs    r0, r0, #1
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #0x68]
        add     r11, r11, r0, lsl #4
        sub     r8, r8, r0, lsl #4
        ldr     r0, [sp, #0x20]
        bne     LCPH1
        ldr     r6, [sp, #0xC]
        ldr     r7, [sp, #8]
        ldr     r8, [sp, #0x10]
        ldr     r9, [sp, #0x14]
        ldr     r1, [sp, #0x2C]
        ldr     r3, [sp, #0x30]
        ldr     r4, [sp, #0x34]
        ldr     r5, [sp, #0x38]
        ldr     lr, [sp, #0x3C]
        ldr     r12, [sp, #0x40]
        ldr     r2, [sp, #0x44]
        ldr     r0, [sp, #0x48]
LCPH2:
        cmp     lr, #1
        str     r9, [r2]
        str     r8, [r2, #4]
        str     r7, [r2, #8]
        str     r6, [r2, #0xC]
        ldrle   r1, [sp, #0x50]
        addle   r8, r2, r1, lsl #4
        ble     LCPH6
        ldr     r6, [sp, #0x50]
        mov     r7, #1
        str     r1, [sp, #0x2C]
        add     r8, r2, r6, lsl #4
        add     r6, r2, #0xC
        str     r8, [sp, #0x24]
        str     r3, [sp, #0x30]
        str     r4, [sp, #0x34]
        str     r5, [sp, #0x38]
        str     lr, [sp, #0x3C]
        str     r12, [sp, #0x40]
        str     r2, [sp, #0x44]
        str     r0, [sp, #0x48]
LCPH3:
        ldr     r0, [sp, #0x60]
        cmp     r0, #0
        ldr     r0, [sp, #0x38]
        str     r0, [sp, #8]
        ldr     r0, [sp, #0x34]
        str     r0, [sp, #4]
        ldr     r0, [sp, #0x30]
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #0x2C]
        str     r0, [sp, #0x10]
        mov     r0, r7
        ble     LCPH8
        mov     r1, #0
        mov     r10, r1
        mov     r11, r10
        mov     r9, r11
        ldr     r4, [sp, #0x64]
        ldr     r5, [sp, #0x58]
        mov     r8, r9
        str     r9, [sp, #0x18]
        ldr     r9, [sp, #0x50]
        str     r6, [sp, #0x28]
        str     r7, [sp, #0x20]
        str     r8, [sp, #0x1C]
        str     r11, [sp, #0xC]
        str     r10, [sp]
        mov     r7, r0
        mov     r6, r1
LCPH4:
        ldr     r3, [sp, #0x54]
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
        ldr     r2, [sp, #0x20]
        str     r0, [sp]
        add     r7, r2, r7
        cmp     r7, r9
        str     r1, [sp, #0xC]
        subge   r7, r7, r9
        ldr     r2, [sp, #0x60]
        add     r6, r6, #2
        add     r4, r4, #0x20
        cmp     r6, r2
        add     r5, r5, #0x20
        blt     LCPH4
        ldr     r8, [sp, #0x1C]
        ldr     r9, [sp, #0x18]
        ldr     r11, [sp, #0xC]
        ldr     r10, [sp]
        ldr     r6, [sp, #0x28]
        ldr     r7, [sp, #0x20]
LCPH5:
        ldr     r4, [sp, #8]
        ldr     r5, [sp, #4]
        mov     r2, r9
        mov     r0, r4
        mov     r3, r8
        mov     r1, r5
        bl      __adddf3
        ldr     r12, [sp, #0x44]
        mov     r2, r10
        str     r0, [r12, +r7, lsl #4]
        str     r1, [r6, #8]
        ldr     r0, [sp, #0x14]
        ldr     r1, [sp, #0x10]
        mov     r3, r11
        bl      __subdf3
        str     r0, [r6, #0xC]
        str     r1, [r6, #0x10]!
        mov     r0, r4
        mov     r1, r5
        mov     r2, r9
        mov     r3, r8
        bl      __subdf3
        ldr     lr, [sp, #0x24]
        rsb     r12, r7, #0
        str     r0, [lr, +r12, lsl #4]
        add     r4, lr, r12, lsl #4
        str     r1, [r4, #4]
        ldr     r0, [sp, #0x14]
        ldr     r1, [sp, #0x10]
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        ldr     r2, [sp, #0x3C]
        add     r7, r7, #1
        cmp     r7, r2
        str     r0, [r4, #8]
        str     r1, [r4, #0xC]
        blt     LCPH3
        ldr     r8, [sp, #0x24]
        ldr     lr, [sp, #0x3C]
        ldr     r12, [sp, #0x40]
        ldr     r0, [sp, #0x48]
LCPH6:
        ldr     r1, [sp, #0x4C]
        subs    r12, r12, #1
        mov     r2, r8
        add     r0, r0, r1, lsl #4
        bne     LCPH0
LCPH7:
        add     sp, sp, #0x6C
        ldmia   sp!, {r4 - r11, pc}
LCPH8:
        mov     r8, #0
        mov     r10, r8
        mov     r11, r10
        mov     r9, r11
        b       LCPH5


