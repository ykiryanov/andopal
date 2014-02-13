        .text
        .align  4
        .globl  _ipps_cbMpy3_64fc


_ipps_cbMpy3_64fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x48
        str     r2, [sp, #8]
        sub     r12, r3, #1
        mov     r2, #0
        cmp     r12, #0
        str     r2, [sp, #0x1C]
        ble     LCDZ1
        ldr     lr, [sp, #8]
        sub     r5, r1, #0xC
        sub     r6, r0, #0xC
        sub     r2, lr, #4
        sub     lr, lr, #0x14
        sub     r7, r1, #0x1C
        sub     r4, r0, #0x1C
        str     r4, [sp, #0x28]
        str     r7, [sp, #0x24]
        str     r6, [sp, #0x2C]
        str     r5, [sp, #0x20]
        str     lr, [sp, #0x18]
        str     r2, [sp, #0x14]
        str     r12, [sp, #0x10]
        str     r3, [sp, #0xC]
        str     r1, [sp, #4]
        str     r0, [sp]
LCDZ0:
        ldr     r0, [sp, #0x28]
        ldr     r1, [sp, #0x1C]
        ldr     lr, [sp, #0x28]
        ldr     r6, [r0, #0x1C]
        ldr     r12, [sp, #0x24]
        add     r1, r1, #2
        str     r1, [sp, #0x1C]
        ldr     r1, [lr, #0x20]
        mov     r0, r6
        str     r1, [sp, #0x30]
        ldr     r10, [r12, #0x1C]
        ldr     r9, [r12, #0x20]
        ldr     r5, [r12, #0x28]
        ldr     r8, [lr, #0x24]
        ldr     r4, [lr, #0x28]
        ldr     r11, [r12, #0x24]
        mov     r2, r10
        mov     r3, r9
        bl      __muldf3
        str     r0, [sp, #0x34]
        mov     r7, r1
        mov     r0, r8
        mov     r2, r11
        mov     r1, r4
        mov     r3, r5
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x34]
        mov     r3, r1
        mov     r1, r7
        bl      __subdf3
        str     r1, [sp, #0x38]
        str     r0, [sp, #0x34]
        mov     r2, r10
        mov     r3, r9
        mov     r0, r8
        mov     r1, r4
        bl      __muldf3
        mov     r7, r1
        ldr     r1, [sp, #0x30]
        mov     r4, r0
        mov     r3, r5
        mov     r0, r6
        mov     r2, r11
        bl      __muldf3
        mov     r3, r7
        mov     r2, r4
        bl      __adddf3
        ldr     r12, [sp, #0x20]
        ldr     r2, [sp, #0x2C]
        ldr     r9, [r12, #0x24]
        ldr     r10, [r12, #0x28]
        ldr     r8, [r12, #0x1C]
        ldr     r4, [r12, #0x20]
        ldr     r12, [sp, #0x2C]
        ldr     r11, [r2, #0x1C]
        ldr     r6, [r2, #0x20]
        ldr     r7, [r12, #0x24]
        ldr     r5, [r12, #0x28]
        str     r0, [sp, #0x30]
        str     r1, [sp, #0x3C]
        mov     r3, r4
        mov     r2, r8
        mov     r0, r11
        mov     r1, r6
        bl      __muldf3
        str     r0, [sp, #0x40]
        str     r1, [sp, #0x44]
        mov     r2, r9
        mov     r3, r10
        mov     r0, r7
        mov     r1, r5
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x40]
        mov     r3, r1
        ldr     r1, [sp, #0x44]
        bl      __subdf3
        str     r0, [sp, #0x44]
        str     r1, [sp, #0x40]
        mov     r0, r7
        mov     r2, r8
        mov     r1, r5
        mov     r3, r4
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        mov     r0, r11
        mov     r1, r6
        mov     r2, r9
        mov     r3, r10
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        ldr     r3, [sp, #0x34]
        ldr     r2, [sp, #0x18]
        str     r3, [r2, #0x14]
        ldr     r3, [sp, #0x38]
        str     r3, [r2, #0x18]
        ldr     r3, [sp, #0x30]
        str     r3, [r2, #0x1C]
        ldr     r3, [sp, #0x3C]
        str     r3, [r2, #0x20]
        ldr     r3, [sp, #0x44]
        ldr     r2, [sp, #0x14]
        str     r3, [r2, #0x14]
        ldr     r3, [sp, #0x40]
        str     r0, [r2, #0x1C]
        str     r1, [r2, #0x20]
        str     r3, [r2, #0x18]
        ldr     r0, [sp, #0x1C]
        ldr     r1, [sp, #0x10]
        cmp     r0, r1
        ldr     r0, [sp, #0x14]
        add     r0, r0, #0x20
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #0x18]
        add     r0, r0, #0x20
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x20]
        add     r0, r0, #0x20
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #0x2C]
        add     r0, r0, #0x20
        str     r0, [sp, #0x2C]
        ldr     r0, [sp, #0x24]
        add     r0, r0, #0x20
        str     r0, [sp, #0x24]
        ldr     r0, [sp, #0x28]
        add     r0, r0, #0x20
        str     r0, [sp, #0x28]
        blt     LCDZ0
        ldr     r3, [sp, #0xC]
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LCDZ1:
        tst     r3, #1
        beq     LCDZ2
        ldr     r11, [sp, #0x1C]
        ldr     r10, [r0, +r11, lsl #4]
        add     r0, r0, r11, lsl #4
        ldr     r5, [r0, #8]
        ldr     r8, [r0, #0xC]
        ldr     r2, [r0, #4]
        mov     r0, r10
        str     r2, [sp, #0x44]
        ldr     r7, [r1, +r11, lsl #4]
        add     r1, r1, r11, lsl #4
        ldr     r6, [r1, #4]
        ldr     r9, [r1, #8]
        ldr     r4, [r1, #0xC]
        ldr     r1, [sp, #0x44]
        mov     r3, r6
        mov     r2, r7
        bl      __muldf3
        str     r0, [sp, #0x40]
        str     r1, [sp, #0x3C]
        mov     r0, r5
        mov     r1, r8
        mov     r2, r9
        mov     r3, r4
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [sp, #0x40]
        ldr     r1, [sp, #0x3C]
        bl      __subdf3
        str     r0, [sp, #0x40]
        str     r1, [sp, #0x3C]
        mov     r3, r6
        mov     r0, r5
        mov     r1, r8
        mov     r2, r7
        bl      __muldf3
        mov     r6, r1
        ldr     r1, [sp, #0x44]
        mov     r5, r0
        mov     r0, r10
        mov     r2, r9
        mov     r3, r4
        bl      __muldf3
        mov     r2, r5
        mov     r3, r6
        bl      __adddf3
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #0x40]
        str     r3, [r2, +r11, lsl #4]
        add     r11, r2, r11, lsl #4
        ldr     r2, [sp, #0x3C]
        str     r0, [r11, #8]
        str     r1, [r11, #0xC]
        str     r2, [r11, #4]
LCDZ2:
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}


