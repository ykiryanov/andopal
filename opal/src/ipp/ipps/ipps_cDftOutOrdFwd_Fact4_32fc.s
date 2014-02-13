        .text
        .align  4
        .globl  _ipps_cDftOutOrdFwd_Fact4_32fc


_ipps_cDftOutOrdFwd_Fact4_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x64
        ldr     r12, [sp, #0x88]
        ldr     lr, [sp, #0x8C]
        mov     r4, r3, lsl #3
        mul     r4, r2, r4
        rsb     r3, r3, r3, lsl #2
        add     r8, lr, r3, lsl #3
        cmp     r2, #1
        add     r0, r0, r4, lsl #2
        add     r1, r1, r4, lsl #2
        mov     r3, #0
        beq     LCKT4
        cmp     r12, #0
        ble     LCKT3
        rsb     lr, r2, r2, lsl #2
        mov     r4, r2, lsl #1
        str     r4, [sp, #0x2C]
        str     lr, [sp, #0x30]
        str     r12, [sp, #0x34]
        str     r3, [sp, #0x3C]
LCKT0:
        ldr     r3, [sp, #0x2C]
        add     r10, r0, r2, lsl #3
        add     r9, r0, r2, lsl #4
        cmp     r3, #0
        ldr     r3, [sp, #0x30]
        add     r5, r1, r2, lsl #3
        add     r4, r1, r2, lsl #4
        add     r6, r0, r3, lsl #3
        add     r3, r1, r3, lsl #3
        ble     LCKT2
        add     r11, r10, #4
        str     r11, [sp, #0x50]
        add     r11, r9, #4
        str     r11, [sp, #0x4C]
        add     r11, r6, #4
        str     r11, [sp, #0x48]
        add     r11, r4, #4
        str     r11, [sp, #0x44]
        add     r11, r5, #4
        str     r11, [sp, #0x40]
        add     lr, r0, #4
        add     r12, r1, #4
        add     r11, r3, #4
        mov     r7, #0
        str     r11, [sp, #0x20]
        str     r12, [sp]
        str     lr, [sp, #4]
        str     r3, [sp, #0x14]
        str     r4, [sp, #0x10]
        str     r5, [sp, #8]
        str     r6, [sp, #0x18]
        str     r9, [sp, #0x1C]
        str     r10, [sp, #0xC]
        str     r1, [sp, #0x28]
        str     r0, [sp, #0x24]
        str     r2, [sp, #0x38]
LCKT1:
        ldr     r0, [sp, #0xC]
        ldr     r6, [r8]
        ldr     r2, [sp, #0x50]
        ldr     r5, [r0]
        ldr     r9, [r8, #4]
        ldr     r4, [r2]
        mov     r1, r6
        mov     r0, r5
        bl      __mulsf3
        mov     r10, r0
        mov     r1, r9
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r10
        bl      __subsf3
        str     r0, [sp, #0x54]
        mov     r0, r4
        mov     r1, r6
        bl      __mulsf3
        mov     r4, r0
        mov     r0, r5
        mov     r1, r9
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r1, [sp, #0x1C]
        ldr     r2, [sp, #0x4C]
        ldr     r9, [r8, #8]
        ldr     r6, [r1]
        ldr     r10, [r8, #0xC]
        ldr     r4, [r2]
        str     r0, [sp, #0x58]
        mov     r1, r9
        mov     r0, r6
        bl      __mulsf3
        mov     r5, r0
        mov     r1, r10
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r5
        bl      __subsf3
        mov     r5, r0
        mov     r0, r4
        mov     r1, r9
        bl      __mulsf3
        mov     r4, r0
        mov     r1, r10
        mov     r0, r6
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r2, [sp, #0x18]
        ldr     r10, [r8, #0x10]
        ldr     r11, [r8, #0x14]
        ldr     r6, [r2]
        ldr     r2, [sp, #0x48]
        mov     r9, r0
        mov     r1, r10
        ldr     r4, [r2]
        mov     r0, r6
        bl      __mulsf3
        str     r0, [sp, #0x5C]
        mov     r0, r4
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x5C]
        bl      __subsf3
        str     r0, [sp, #0x5C]
        mov     r0, r4
        mov     r1, r10
        bl      __mulsf3
        mov     r4, r0
        mov     r1, r11
        mov     r0, r6
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r2, [sp, #0x24]
        mov     r1, r5
        mov     r6, r0
        ldr     r11, [r2, +r7, lsl #2]
        ldr     r2, [sp, #0xC]
        add     r2, r2, #8
        str     r2, [sp, #0xC]
        mov     r0, r11
        bl      __addsf3
        ldr     r2, [sp, #4]
        mov     r1, r9
        ldr     r10, [r2]
        ldr     r2, [sp, #0x50]
        str     r0, [sp, #0x60]
        add     r2, r2, #8
        str     r2, [sp, #0x50]
        mov     r0, r10
        bl      __addsf3
        mov     r4, r0
        mov     r1, r5
        mov     r0, r11
        bl      __subsf3
        mov     r5, r0
        mov     r0, r10
        mov     r1, r9
        bl      __subsf3
        mov     r11, r0
        ldr     r0, [sp, #0x54]
        ldr     r1, [sp, #0x5C]
        bl      __addsf3
        mov     r10, r0
        ldr     r0, [sp, #0x58]
        mov     r1, r6
        bl      __addsf3
        ldr     r1, [sp, #0x5C]
        mov     r9, r0
        ldr     r0, [sp, #0x54]
        bl      __subsf3
        str     r0, [sp, #0x5C]
        ldr     r0, [sp, #0x58]
        mov     r1, r6
        bl      __subsf3
        mov     r6, r0
        ldr     r0, [sp, #0x60]
        mov     r1, r10
        bl      __addsf3
        ldr     r2, [sp, #0x28]
        mov     r1, r9
        str     r0, [r2, +r7, lsl #2]
        mov     r0, r4
        bl      __addsf3
        ldr     r2, [sp]
        add     r7, r7, #2
        str     r0, [r2]
        ldr     r0, [sp, #0x60]
        mov     r1, r10
        bl      __subsf3
        ldr     r2, [sp, #0x10]
        mov     r1, r9
        str     r0, [r2]
        mov     r0, r4
        bl      __subsf3
        ldr     r2, [sp, #0x44]
        mov     r1, r6
        str     r0, [r2]
        mov     r0, r5
        bl      __addsf3
        ldr     r2, [sp, #8]
        str     r0, [r2]
        ldr     r1, [sp, #0x5C]
        mov     r0, r11
        bl      __subsf3
        ldr     r2, [sp, #0x40]
        mov     r1, r6
        str     r0, [r2]
        mov     r0, r5
        bl      __subsf3
        ldr     r1, [sp, #0x14]
        str     r0, [r1]
        ldr     r1, [sp, #0x5C]
        mov     r0, r11
        bl      __addsf3
        ldr     r1, [sp, #0x20]
        str     r0, [r1]
        ldr     r0, [sp, #0x2C]
        cmp     r7, r0
        ldr     r0, [sp, #0x1C]
        add     r0, r0, #8
        str     r0, [sp, #0x1C]
        ldr     r0, [sp, #0x4C]
        add     r0, r0, #8
        str     r0, [sp, #0x4C]
        ldr     r0, [sp, #0x18]
        add     r0, r0, #8
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x48]
        add     r0, r0, #8
        str     r0, [sp, #0x48]
        ldr     r0, [sp, #4]
        add     r0, r0, #8
        str     r0, [sp, #4]
        ldr     r0, [sp]
        add     r0, r0, #8
        str     r0, [sp]
        ldr     r0, [sp, #0x10]
        add     r0, r0, #8
        str     r0, [sp, #0x10]
        ldr     r0, [sp, #0x44]
        add     r0, r0, #8
        str     r0, [sp, #0x44]
        ldr     r0, [sp, #8]
        add     r0, r0, #8
        str     r0, [sp, #8]
        ldr     r0, [sp, #0x40]
        add     r0, r0, #8
        str     r0, [sp, #0x40]
        ldr     r0, [sp, #0x14]
        add     r0, r0, #8
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #0x20]
        add     r0, r0, #8
        str     r0, [sp, #0x20]
        blt     LCKT1
        ldr     r1, [sp, #0x28]
        ldr     r0, [sp, #0x24]
        ldr     r2, [sp, #0x38]
LCKT2:
        ldr     r3, [sp, #0x3C]
        ldr     r12, [sp, #0x34]
        add     r8, r8, #0x18
        add     r3, r3, #1
        str     r3, [sp, #0x3C]
        cmp     r3, r12
        add     r0, r0, r2, lsl #5
        add     r1, r1, r2, lsl #5
        blt     LCKT0
LCKT3:
        add     sp, sp, #0x64
        ldmia   sp!, {r4 - r11, pc}
LCKT4:
        mov     r2, r12, lsl #3
        cmp     r2, #0
        ble     LCKT3
        add     r10, r1, #0x10
        str     r10, [sp, #0x40]
        add     r10, r1, #0x14
        str     r10, [sp, #0x44]
        add     r10, r1, #8
        str     r10, [sp, #0x50]
        add     r12, r0, #8
        add     r10, r1, #0xC
        str     r12, [sp, #0x48]
        str     r10, [sp, #0x4C]
        add     r9, r0, #0xC
        add     r7, r0, #0x10
        add     r6, r0, #0x14
        add     r5, r0, #0x18
        add     r4, r0, #0x1C
        add     lr, r0, #4
        add     r12, r1, #4
        add     r10, r1, #0x18
        add     r11, r1, #0x1C
        str     r11, [sp, #0x34]
        str     r10, [sp, #0x30]
        str     r12, [sp, #0x14]
        str     lr, [sp, #0x18]
        str     r4, [sp, #0xC]
        str     r5, [sp, #0x1C]
        str     r6, [sp, #0x10]
        str     r7, [sp, #0x20]
        str     r9, [sp, #0x2C]
        str     r2, [sp, #0x38]
        str     r1, [sp, #0x28]
        str     r0, [sp, #0x24]
        str     r3, [sp, #0x3C]
LCKT5:
        ldr     r0, [sp, #0x48]
        ldr     r2, [sp, #0x2C]
        ldr     r5, [r8]
        ldr     r4, [r0]
        ldr     r6, [r8, #4]
        ldr     r7, [r2]
        mov     r1, r5
        mov     r0, r4
        bl      __mulsf3
        mov     r9, r0
        mov     r0, r7
        mov     r1, r6
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r9
        bl      __subsf3
        str     r0, [sp, #0x60]
        mov     r1, r5
        mov     r0, r7
        bl      __mulsf3
        mov     r5, r0
        mov     r1, r6
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r1, [sp, #0x20]
        ldr     r2, [sp, #0x10]
        ldr     r6, [r8, #8]
        ldr     r5, [r1]
        ldr     r9, [r8, #0xC]
        ldr     r4, [r2]
        str     r0, [sp, #0x5C]
        mov     r1, r6
        mov     r0, r5
        bl      __mulsf3
        mov     r7, r0
        mov     r1, r9
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r7
        bl      __subsf3
        mov     r7, r0
        mov     r1, r6
        mov     r0, r4
        bl      __mulsf3
        mov     r4, r0
        mov     r0, r5
        mov     r1, r9
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r2, [sp, #0x1C]
        ldr     r10, [r8, #0x14]
        ldr     r11, [r8, #0x10]
        ldr     r6, [r2]
        ldr     r2, [sp, #0xC]
        mov     r1, r11
        mov     r9, r0
        ldr     r5, [r2]
        mov     r0, r6
        bl      __mulsf3
        mov     r4, r0
        mov     r0, r5
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r4
        bl      __subsf3
        mov     r4, r0
        mov     r1, r11
        mov     r0, r5
        bl      __mulsf3
        mov     r5, r0
        mov     r0, r6
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r2, [sp, #0x24]
        mov     r5, r0
        mov     r1, r7
        ldr     r11, [r2]
        ldr     r2, [sp, #0x48]
        add     r8, r8, #0x18
        add     r2, r2, #0x20
        str     r2, [sp, #0x48]
        mov     r0, r11
        bl      __addsf3
        ldr     r2, [sp, #0x18]
        mov     r1, r9
        ldr     r10, [r2]
        ldr     r2, [sp, #0x2C]
        str     r0, [sp, #0x58]
        add     r2, r2, #0x20
        str     r2, [sp, #0x2C]
        mov     r0, r10
        bl      __addsf3
        mov     r6, r0
        mov     r0, r11
        mov     r1, r7
        bl      __subsf3
        mov     r7, r0
        mov     r1, r9
        mov     r0, r10
        bl      __subsf3
        mov     r10, r0
        ldr     r0, [sp, #0x60]
        mov     r1, r4
        bl      __addsf3
        mov     r9, r0
        ldr     r0, [sp, #0x5C]
        mov     r1, r5
        bl      __addsf3
        mov     r11, r0
        ldr     r0, [sp, #0x60]
        mov     r1, r4
        bl      __subsf3
        mov     r4, r0
        ldr     r0, [sp, #0x5C]
        mov     r1, r5
        bl      __subsf3
        mov     r5, r0
        ldr     r0, [sp, #0x58]
        mov     r1, r9
        bl      __addsf3
        ldr     r2, [sp, #0x28]
        mov     r1, r11
        str     r0, [r2]
        mov     r0, r6
        bl      __addsf3
        ldr     r2, [sp, #0x14]
        mov     r1, r9
        str     r0, [r2]
        ldr     r0, [sp, #0x58]
        bl      __subsf3
        ldr     r2, [sp, #0x40]
        mov     r1, r11
        str     r0, [r2]
        mov     r0, r6
        bl      __subsf3
        ldr     r2, [sp, #0x44]
        mov     r1, r5
        str     r0, [r2]
        mov     r0, r7
        bl      __addsf3
        ldr     r2, [sp, #0x50]
        mov     r1, r4
        str     r0, [r2]
        mov     r0, r10
        bl      __subsf3
        ldr     r2, [sp, #0x4C]
        mov     r1, r5
        str     r0, [r2]
        mov     r0, r7
        bl      __subsf3
        ldr     r2, [sp, #0x30]
        mov     r1, r4
        str     r0, [r2]
        mov     r0, r10
        bl      __addsf3
        ldr     r1, [sp, #0x3C]
        add     r1, r1, #8
        str     r1, [sp, #0x3C]
        ldr     r1, [sp, #0x34]
        str     r0, [r1]
        ldr     r1, [sp, #0x38]
        ldr     r0, [sp, #0x3C]
        cmp     r0, r1
        ldr     r0, [sp, #0x20]
        add     r0, r0, #0x20
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #0x10]
        add     r0, r0, #0x20
        str     r0, [sp, #0x10]
        ldr     r0, [sp, #0x1C]
        add     r0, r0, #0x20
        str     r0, [sp, #0x1C]
        ldr     r0, [sp, #0xC]
        add     r0, r0, #0x20
        str     r0, [sp, #0xC]
        ldr     r0, [sp, #0x24]
        add     r0, r0, #0x20
        str     r0, [sp, #0x24]
        ldr     r0, [sp, #0x18]
        add     r0, r0, #0x20
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x28]
        add     r0, r0, #0x20
        str     r0, [sp, #0x28]
        ldr     r0, [sp, #0x14]
        add     r0, r0, #0x20
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #0x40]
        add     r0, r0, #0x20
        str     r0, [sp, #0x40]
        ldr     r0, [sp, #0x44]
        add     r0, r0, #0x20
        str     r0, [sp, #0x44]
        ldr     r0, [sp, #0x50]
        add     r0, r0, #0x20
        str     r0, [sp, #0x50]
        ldr     r0, [sp, #0x4C]
        add     r0, r0, #0x20
        str     r0, [sp, #0x4C]
        ldr     r0, [sp, #0x30]
        add     r0, r0, #0x20
        str     r0, [sp, #0x30]
        ldr     r0, [sp, #0x34]
        add     r0, r0, #0x20
        str     r0, [sp, #0x34]
        blt     LCKT5
        add     sp, sp, #0x64
        ldmia   sp!, {r4 - r11, pc}


