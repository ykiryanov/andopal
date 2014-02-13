        .text
        .align  4
        .globl  _ipps_cCcsRecombine_64f


_ipps_cCcsRecombine_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x58
        ldr     r12, [sp, #0x7C]
        mov     r4, r2
        cmp     r4, #1
        mov     r6, r0
        mov     r5, r1
        beq     LCDW2
        cmp     r3, #0
        mov     r3, r4, lsl #1
        sub     lr, r3, #2
        mov     r3, #2
        ble     LCDW3
        cmp     r4, #2
        ble     LCDW1
        mov     lr, lr, lsl #3
        add     lr, lr, #0x14
        add     r7, r6, #8
        add     r8, r5, #8
        add     r8, lr, r8
        add     r7, lr, r7
        add     r0, lr, r5
        add     r9, r12, #0xC
        add     lr, lr, r6
        add     r11, r5, #0xC
        add     r10, r5, #4
        add     r12, r12, #4
        add     r1, r6, #0xC
        add     r2, r6, #4
        str     r2, [sp, #4]
        str     r1, [sp]
        str     r12, [sp, #8]
        str     r9, [sp, #0xC]
        str     r10, [sp, #0x1C]
        str     r11, [sp, #0x18]
        str     lr, [sp, #0x10]
        str     r7, [sp, #0x14]
        str     r0, [sp, #0x20]
        str     r8, [sp, #0x28]
        str     r3, [sp, #0x24]
        str     r4, [sp, #0x2C]
        str     r5, [sp, #0x30]
        str     r6, [sp, #0x34]
LCDW0:
        ldr     r0, [sp, #0x10]
        ldr     r1, [sp, #4]
        ldr     r8, [r0, #-0x14]
        ldr     r4, [r0, #-0x10]
        ldr     r9, [r1, #0xC]
        ldr     r5, [r1, #0x10]
        mov     r2, r8
        mov     r3, r4
        mov     r0, r9
        mov     r1, r5
        bl      __subdf3
        ldr     r12, [sp]
        ldr     r11, [r12, #0xC]
        ldr     r7, [r12, #0x10]
        ldr     r12, [sp, #0x14]
        ldr     r10, [r12, #-0x14]
        ldr     r6, [r12, #-0x10]
        str     r0, [sp, #0x38]
        str     r1, [sp, #0x3C]
        mov     r1, r7
        mov     r3, r6
        mov     r2, r10
        mov     r0, r11
        bl      __adddf3
        str     r0, [sp, #0x40]
        str     r1, [sp, #0x44]
        mov     r2, r8
        mov     r0, r9
        mov     r3, r4
        mov     r1, r5
        bl      __adddf3
        str     r0, [sp, #0x48]
        str     r1, [sp, #0x4C]
        mov     r3, r6
        mov     r1, r7
        mov     r2, r10
        mov     r0, r11
        bl      __subdf3
        ldr     r12, [sp, #0xC]
        mov     r4, r0
        ldr     r0, [sp, #0x38]
        ldr     r9, [r12, #0xC]
        ldr     r8, [r12, #0x10]
        ldr     r12, [sp, #8]
        mov     r5, r1
        ldr     r1, [sp, #0x3C]
        ldr     r11, [r12, #0xC]
        ldr     r10, [r12, #0x10]
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        str     r0, [sp, #0x50]
        ldr     r0, [sp, #0x40]
        str     r1, [sp, #0x54]
        ldr     r1, [sp, #0x44]
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldr     r3, [sp, #0x54]
        ldr     r2, [sp, #0x50]
        bl      __adddf3
        mov     r6, r0
        mov     r7, r1
        ldr     r0, [sp, #0x38]
        ldr     r1, [sp, #0x3C]
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        mov     r10, r0
        mov     r11, r1
        ldr     r0, [sp, #0x40]
        ldr     r1, [sp, #0x44]
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r10
        mov     r1, r11
        bl      __subdf3
        mov     r9, r0
        mov     r8, r1
        ldr     r0, [sp, #0x48]
        ldr     r1, [sp, #0x4C]
        mov     r2, r6
        mov     r3, r7
        bl      __subdf3
        str     r0, [sp, #0x54]
        ldr     r0, [sp, #0x48]
        str     r1, [sp, #0x50]
        ldr     r1, [sp, #0x4C]
        mov     r2, r6
        mov     r3, r7
        bl      __adddf3
        mov     r11, r0
        mov     r10, r1
        mov     r0, r4
        mov     r1, r5
        mov     r2, r9
        mov     r3, r8
        bl      __adddf3
        mov     r7, r0
        mov     r6, r1
        mov     r0, r9
        mov     r1, r8
        mov     r2, r4
        mov     r3, r5
        bl      __subdf3
        ldr     r3, [sp, #0x54]
        ldr     r2, [sp, #0x1C]
        str     r3, [r2, #0xC]
        ldr     r3, [sp, #0x50]
        str     r3, [r2, #0x10]
        ldr     r2, [sp, #0x18]
        str     r7, [r2, #0xC]
        str     r6, [r2, #0x10]
        ldr     r2, [sp, #0x20]
        str     r11, [r2, #-0x14]
        str     r10, [r2, #-0x10]
        ldr     r2, [sp, #0x24]
        add     r2, r2, #2
        str     r2, [sp, #0x24]
        ldr     r2, [sp, #0x28]
        str     r0, [r2, #-0x14]
        str     r1, [r2, #-0x10]
        ldr     r0, [sp, #0x2C]
        ldr     r1, [sp, #0x24]
        cmp     r1, r0
        ldr     r0, [sp, #0x28]
        sub     r0, r0, #0x10
        str     r0, [sp, #0x28]
        ldr     r0, [sp, #0x20]
        sub     r0, r0, #0x10
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #0x14]
        sub     r0, r0, #0x10
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #0x10]
        sub     r0, r0, #0x10
        str     r0, [sp, #0x10]
        ldr     r0, [sp, #0x18]
        add     r0, r0, #0x10
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x1C]
        add     r0, r0, #0x10
        str     r0, [sp, #0x1C]
        ldr     r0, [sp, #0xC]
        add     r0, r0, #0x10
        str     r0, [sp, #0xC]
        ldr     r0, [sp, #8]
        add     r0, r0, #0x10
        str     r0, [sp, #8]
        ldr     r0, [sp]
        add     r0, r0, #0x10
        str     r0, [sp]
        ldr     r0, [sp, #4]
        add     r0, r0, #0x10
        str     r0, [sp, #4]
        blt     LCDW0
        ldr     r4, [sp, #0x2C]
        ldr     r5, [sp, #0x30]
        ldr     r6, [sp, #0x34]
LCDW1:
        mov     r7, r4, lsl #3
        add     r3, r7, r6
        ldr     r1, [r3, #4]
        ldr     r0, [r6, +r4, lsl #3]
        mov     r2, #0
        mov     r3, #1, 2
        bl      __muldf3
        str     r0, [r5, +r4, lsl #3]
        add     r2, r7, r5
        str     r1, [r2, #4]
        add     r7, r7, #8
        add     r2, r6, r7
        ldr     r1, [r2, #4]
        ldr     r0, [r7, +r6]
        mov     r2, #0
        mov     r3, #1, 2
        bl      __muldf3
        str     r0, [r7, +r5]
        add     r7, r5, r7
        str     r1, [r7, #4]
LCDW2:
        add     sp, sp, #0x58
        ldmia   sp!, {r4 - r11, pc}
LCDW3:
        cmp     r4, #2
        ble     LCDW5
        mov     lr, lr, lsl #3
        add     lr, lr, #0x14
        add     r7, r6, #8
        add     r8, r5, #8
        add     r8, lr, r8
        add     r7, lr, r7
        add     r0, lr, r5
        add     r9, r12, #0xC
        add     lr, lr, r6
        add     r11, r5, #0xC
        add     r10, r5, #4
        add     r12, r12, #4
        add     r1, r6, #0xC
        add     r2, r6, #4
        str     r2, [sp, #8]
        str     r1, [sp]
        str     r12, [sp, #4]
        str     r9, [sp, #0xC]
        str     r10, [sp, #0x1C]
        str     r11, [sp, #0x18]
        str     lr, [sp, #0x10]
        str     r7, [sp, #0x14]
        str     r0, [sp, #0x20]
        str     r8, [sp, #0x28]
        str     r3, [sp, #0x24]
        str     r4, [sp, #0x2C]
        str     r5, [sp, #0x30]
        str     r6, [sp, #0x34]
LCDW4:
        ldr     r1, [sp, #8]
        ldr     r3, [sp, #0x10]
        ldr     r11, [r1, #0xC]
        ldr     r5, [r1, #0x10]
        ldr     r9, [r3, #-0x14]
        ldr     r4, [r3, #-0x10]
        mov     r0, r11
        mov     r1, r5
        mov     r2, r9
        mov     r3, r4
        bl      __subdf3
        ldr     r12, [sp]
        ldr     r10, [r12, #0xC]
        ldr     r6, [r12, #0x10]
        ldr     r12, [sp, #0x14]
        ldr     r8, [r12, #-0x14]
        ldr     r7, [r12, #-0x10]
        str     r1, [sp, #0x50]
        str     r0, [sp, #0x54]
        mov     r2, r8
        mov     r0, r10
        mov     r3, r7
        mov     r1, r6
        bl      __adddf3
        str     r0, [sp, #0x4C]
        str     r1, [sp, #0x48]
        mov     r3, r4
        mov     r1, r5
        mov     r2, r9
        mov     r0, r11
        bl      __adddf3
        str     r0, [sp, #0x44]
        str     r1, [sp, #0x40]
        mov     r1, r6
        mov     r2, r8
        mov     r0, r10
        mov     r3, r7
        bl      __subdf3
        ldr     r12, [sp, #0xC]
        mov     r4, r0
        ldr     r0, [sp, #0x54]
        ldr     r9, [r12, #0xC]
        ldr     r8, [r12, #0x10]
        ldr     r12, [sp, #4]
        mov     r5, r1
        ldr     r1, [sp, #0x50]
        ldr     r11, [r12, #0xC]
        ldr     r10, [r12, #0x10]
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        str     r0, [sp, #0x3C]
        ldr     r0, [sp, #0x4C]
        str     r1, [sp, #0x38]
        ldr     r1, [sp, #0x48]
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x3C]
        mov     r3, r1
        ldr     r1, [sp, #0x38]
        bl      __subdf3
        mov     r6, r0
        mov     r7, r1
        ldr     r1, [sp, #0x50]
        ldr     r0, [sp, #0x54]
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        mov     r10, r0
        mov     r11, r1
        ldr     r0, [sp, #0x4C]
        ldr     r1, [sp, #0x48]
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        mov     r9, r0
        ldr     r0, [sp, #0x44]
        mov     r8, r1
        ldr     r1, [sp, #0x40]
        mov     r2, r6
        mov     r3, r7
        bl      __adddf3
        str     r0, [sp, #0x54]
        ldr     r0, [sp, #0x44]
        str     r1, [sp, #0x50]
        ldr     r1, [sp, #0x40]
        mov     r2, r6
        mov     r3, r7
        bl      __subdf3
        mov     r11, r0
        mov     r10, r1
        mov     r0, r4
        mov     r1, r5
        mov     r2, r9
        mov     r3, r8
        bl      __adddf3
        mov     r7, r0
        mov     r6, r1
        mov     r0, r9
        mov     r1, r8
        mov     r2, r4
        mov     r3, r5
        bl      __subdf3
        ldr     r3, [sp, #0x54]
        ldr     r2, [sp, #0x1C]
        str     r3, [r2, #0xC]
        ldr     r3, [sp, #0x50]
        str     r3, [r2, #0x10]
        ldr     r2, [sp, #0x18]
        str     r7, [r2, #0xC]
        str     r6, [r2, #0x10]
        ldr     r2, [sp, #0x20]
        str     r11, [r2, #-0x14]
        str     r10, [r2, #-0x10]
        ldr     r2, [sp, #0x24]
        add     r2, r2, #2
        str     r2, [sp, #0x24]
        ldr     r2, [sp, #0x28]
        str     r0, [r2, #-0x14]
        str     r1, [r2, #-0x10]
        ldr     r0, [sp, #0x24]
        ldr     r1, [sp, #0x2C]
        cmp     r0, r1
        ldr     r0, [sp, #0x28]
        sub     r0, r0, #0x10
        str     r0, [sp, #0x28]
        ldr     r0, [sp, #0x20]
        sub     r0, r0, #0x10
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #0x14]
        sub     r0, r0, #0x10
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #0x10]
        sub     r0, r0, #0x10
        str     r0, [sp, #0x10]
        ldr     r0, [sp, #0x18]
        add     r0, r0, #0x10
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x1C]
        add     r0, r0, #0x10
        str     r0, [sp, #0x1C]
        ldr     r0, [sp, #0xC]
        add     r0, r0, #0x10
        str     r0, [sp, #0xC]
        ldr     r0, [sp, #4]
        add     r0, r0, #0x10
        str     r0, [sp, #4]
        ldr     r0, [sp]
        add     r0, r0, #0x10
        str     r0, [sp]
        ldr     r0, [sp, #8]
        add     r0, r0, #0x10
        str     r0, [sp, #8]
        blt     LCDW4
        ldr     r4, [sp, #0x2C]
        ldr     r5, [sp, #0x30]
        ldr     r6, [sp, #0x34]
LCDW5:
        mov     r7, r4, lsl #3
        add     r3, r7, r6
        ldr     r1, [r3, #4]
        ldr     r0, [r6, +r4, lsl #3]
        mov     r2, #0
        mov     r3, #1, 2
        bl      __muldf3
        str     r0, [r5, +r4, lsl #3]
        add     r2, r7, r5
        str     r1, [r2, #4]
        add     r7, r7, #8
        add     r2, r6, r7
        ldr     r1, [r2, #4]
        ldr     r0, [r7, +r6]
        mov     r2, #0
        mov     r3, #3, 2
        bl      __muldf3
        str     r0, [r7, +r5]
        add     r7, r5, r7
        str     r1, [r7, #4]
        add     sp, sp, #0x58
        ldmia   sp!, {r4 - r11, pc}


