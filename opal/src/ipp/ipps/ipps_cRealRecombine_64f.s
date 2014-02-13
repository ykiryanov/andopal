        .text
        .align  4
        .globl  _ipps_cRealRecombine_64f


_ipps_cRealRecombine_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x4C
        cmp     r1, #1
        beq     LCDV2
        cmp     r2, #0
        mov     r2, r1, lsl #1
        sub     r12, r2, #2
        mov     r2, #2
        ble     LCDV3
        cmp     r1, #2
        ble     LCDV1
        mov     r12, r12, lsl #3
        add     r12, r12, #0x14
        add     lr, r0, #8
        add     r5, r12, lr
        add     r4, r12, r0
        add     r12, r3, #0xC
        add     r3, r3, #4
        add     r7, r0, #0xC
        add     r6, r0, #4
        str     r3, [sp]
        str     r12, [sp, #4]
        str     r2, [sp, #8]
        str     r1, [sp, #0xC]
        str     r0, [sp, #0x10]
LCDV0:
        ldr     r0, [r6, #0xC]
        str     r0, [sp, #0x14]
        ldr     r0, [r6, #0x10]
        str     r0, [sp, #0x18]
        ldr     r2, [r4, #-0x14]
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #0x18]
        str     r2, [sp, #0x1C]
        add     r0, r0, #2
        str     r0, [sp, #8]
        ldr     r0, [r4, #-0x10]
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #0x14]
        ldr     r3, [sp, #0x20]
        bl      __subdf3
        ldr     r2, [r7, #0xC]
        mov     r8, r0
        mov     r9, r1
        str     r2, [sp, #0x24]
        ldr     r2, [r7, #0x10]
        ldr     r0, [sp, #0x24]
        str     r2, [sp, #0x28]
        ldr     r2, [r5, #-0x14]
        ldr     r1, [sp, #0x28]
        str     r2, [sp, #0x2C]
        ldr     r2, [r5, #-0x10]
        str     r2, [sp, #0x30]
        ldr     r2, [sp, #0x2C]
        ldr     r3, [sp, #0x30]
        bl      __adddf3
        ldr     r2, [sp, #4]
        ldr     r3, [r2, #0xC]
        str     r3, [sp, #0x34]
        ldr     r2, [r2, #0x10]
        ldr     r3, [sp]
        str     r2, [sp, #0x38]
        ldr     r2, [sp, #0x34]
        ldr     r11, [r3, #0xC]
        ldr     r10, [r3, #0x10]
        ldr     r3, [sp, #0x38]
        str     r0, [sp, #0x3C]
        str     r1, [sp, #0x40]
        mov     r0, r8
        mov     r1, r9
        bl      __muldf3
        str     r0, [sp, #0x44]
        ldr     r0, [sp, #0x3C]
        str     r1, [sp, #0x48]
        ldr     r1, [sp, #0x40]
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0x44]
        ldr     r3, [sp, #0x48]
        bl      __adddf3
        ldr     r2, [sp, #0x34]
        str     r0, [sp, #0x48]
        ldr     r0, [sp, #0x3C]
        str     r1, [sp, #0x44]
        ldr     r1, [sp, #0x40]
        ldr     r3, [sp, #0x38]
        bl      __muldf3
        str     r0, [sp, #0x40]
        str     r1, [sp, #0x3C]
        mov     r0, r8
        mov     r1, r9
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x40]
        mov     r3, r1
        ldr     r1, [sp, #0x3C]
        bl      __subdf3
        ldr     r2, [sp, #0x48]
        ldr     r3, [sp, #0x44]
        mov     r9, r0
        ldr     r0, [sp, #0x14]
        mov     r8, r1
        ldr     r1, [sp, #0x18]
        bl      __subdf3
        ldr     r2, [sp, #0x48]
        ldr     r3, [sp, #0x44]
        str     r0, [sp, #0x40]
        ldr     r0, [sp, #0x1C]
        str     r1, [sp, #0x3C]
        ldr     r1, [sp, #0x20]
        bl      __adddf3
        ldr     r2, [sp, #0x24]
        ldr     r3, [sp, #0x28]
        str     r0, [sp, #0x48]
        str     r1, [sp, #0x44]
        mov     r0, r9
        mov     r1, r8
        bl      __subdf3
        ldr     r2, [sp, #0x2C]
        ldr     r3, [sp, #0x30]
        mov     r10, r0
        mov     r11, r1
        mov     r0, r9
        mov     r1, r8
        bl      __subdf3
        ldr     r2, [sp, #0x48]
        str     r2, [r6, #0xC]
        ldr     r2, [sp, #0x44]
        str     r2, [r6, #0x10]!
        ldr     r2, [sp, #0x40]
        str     r2, [r4, #-0x14]
        ldr     r2, [sp, #0x3C]
        str     r2, [r4, #-0x10]!
        str     r0, [r7, #0xC]
        str     r1, [r7, #0x10]!
        str     r10, [r5, #-0x14]
        str     r11, [r5, #-0x10]!
        ldr     r0, [sp, #0xC]
        ldr     r1, [sp, #8]
        cmp     r1, r0
        ldr     r0, [sp, #4]
        add     r0, r0, #0x10
        str     r0, [sp, #4]
        ldr     r0, [sp]
        add     r0, r0, #0x10
        str     r0, [sp]
        blt     LCDV0
        ldr     r1, [sp, #0xC]
        ldr     r0, [sp, #0x10]
LCDV1:
        mov     r1, r1, lsl #3
        add     r2, r1, #8
        add     r1, r0, r2
        ldr     r12, [r1, #4]
        ldr     r3, [r2, +r0]
        eor     r12, r12, #2, 2
        str     r3, [r2, +r0]
        str     r12, [r1, #4]
LCDV2:
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
LCDV3:
        cmp     r1, #2
        ble     LCDV2
        mov     r12, r12, lsl #3
        add     r12, r12, #0x14
        add     lr, r0, #8
        add     r6, r12, lr
        add     r5, r12, r0
        add     r12, r3, #0xC
        add     r3, r3, #4
        add     r7, r0, #0xC
        add     r4, r0, #4
        str     r3, [sp]
        str     r12, [sp, #4]
        str     r2, [sp, #8]
        str     r1, [sp, #0xC]
LCDV4:
        ldr     r0, [r4, #0xC]
        str     r0, [sp, #0x48]
        ldr     r0, [r4, #0x10]
        str     r0, [sp, #0x44]
        ldr     r2, [r5, #-0x14]
        ldr     r1, [sp, #0x44]
        str     r2, [sp, #0x40]
        ldr     r0, [r5, #-0x10]
        str     r0, [sp, #0x3C]
        ldr     r0, [sp, #8]
        ldr     r3, [sp, #0x3C]
        add     r0, r0, #2
        str     r0, [sp, #8]
        ldr     r0, [sp, #0x48]
        bl      __subdf3
        ldr     r2, [r6, #-0x14]
        mov     r9, r1
        str     r2, [sp, #0x38]
        ldr     r2, [r7, #0xC]
        str     r2, [sp, #0x34]
        ldr     r2, [r7, #0x10]
        str     r2, [sp, #0x30]
        ldr     r2, [r6, #-0x10]
        str     r0, [sp, #0x28]
        ldr     r0, [sp, #0x34]
        str     r2, [sp, #0x2C]
        ldr     r2, [sp, #0x38]
        ldr     r3, [sp, #0x2C]
        ldr     r1, [sp, #0x30]
        bl      __adddf3
        ldr     r3, [sp]
        mov     r8, r0
        ldr     r2, [r3, #0xC]
        str     r2, [sp, #0x24]
        ldr     r3, [r3, #0x10]
        ldr     r2, [sp, #0x24]
        str     r3, [sp, #0x20]
        ldr     r3, [sp, #4]
        ldr     r11, [r3, #0xC]
        ldr     r10, [r3, #0x10]
        ldr     r3, [sp, #0x20]
        str     r1, [sp, #0x1C]
        bl      __muldf3
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x28]
        str     r1, [sp, #0x14]
        mov     r1, r9
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        mov     r3, r1
        ldr     r1, [sp, #0x14]
        mov     r2, r0
        ldr     r0, [sp, #0x18]
        bl      __subdf3
        ldr     r3, [sp, #0x20]
        ldr     r2, [sp, #0x24]
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x28]
        str     r1, [sp, #0x14]
        mov     r1, r9
        bl      __muldf3
        str     r0, [sp, #0x28]
        str     r1, [sp, #0x24]
        ldr     r1, [sp, #0x1C]
        mov     r0, r8
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0x28]
        ldr     r3, [sp, #0x24]
        bl      __adddf3
        mov     r8, r0
        mov     r9, r1
        ldr     r0, [sp, #0x48]
        ldr     r1, [sp, #0x44]
        ldr     r2, [sp, #0x18]
        ldr     r3, [sp, #0x14]
        bl      __adddf3
        str     r0, [sp, #0x48]
        ldr     r0, [sp, #0x34]
        str     r1, [sp, #0x44]
        ldr     r1, [sp, #0x30]
        mov     r2, r8
        mov     r3, r9
        bl      __subdf3
        ldr     r2, [sp, #0x18]
        ldr     r3, [sp, #0x14]
        str     r0, [sp, #0x34]
        ldr     r0, [sp, #0x40]
        str     r1, [sp, #0x30]
        ldr     r1, [sp, #0x3C]
        bl      __subdf3
        mov     r10, r0
        mov     r11, r1
        ldr     r0, [sp, #0x38]
        ldr     r1, [sp, #0x2C]
        mov     r2, r8
        mov     r3, r9
        bl      __subdf3
        ldr     r2, [sp, #0x48]
        str     r2, [r4, #0xC]
        ldr     r2, [sp, #0x44]
        str     r2, [r4, #0x10]!
        ldr     r2, [sp, #0x34]
        str     r2, [r7, #0xC]
        ldr     r2, [sp, #0x30]
        str     r2, [r7, #0x10]!
        str     r10, [r5, #-0x14]
        str     r11, [r5, #-0x10]!
        str     r0, [r6, #-0x14]
        str     r1, [r6, #-0x10]!
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #0xC]
        cmp     r0, r1
        ldr     r0, [sp, #4]
        add     r0, r0, #0x10
        str     r0, [sp, #4]
        ldr     r0, [sp]
        add     r0, r0, #0x10
        str     r0, [sp]
        blt     LCDV4
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}


