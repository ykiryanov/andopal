        .text
        .align  4
        .globl  _ipps_cDftOutOrdInv_Fact4_32fc


_ipps_cDftOutOrdInv_Fact4_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x64
        ldr     r12, [sp, #0x88]
        ldr     lr, [sp, #0x8C]
        mov     r4, r3, lsl #3
        mul     r4, r2, r4
        rsb     r3, r3, r3, lsl #2
        cmp     r2, #1
        add     r0, r0, r4, lsl #2
        add     r1, r1, r4, lsl #2
        add     r4, lr, r3, lsl #3
        mov     r3, #0
        beq     LCKL4
        cmp     r12, #0
        ble     LCKL3
        rsb     lr, r2, r2, lsl #2
        mov     r5, r2, lsl #1
        str     r5, [sp, #0x2C]
        str     lr, [sp, #0x30]
        str     r12, [sp, #0x34]
        str     r3, [sp, #0x3C]
LCKL0:
        ldr     r3, [sp, #0x2C]
        add     r10, r0, r2, lsl #3
        add     r9, r0, r2, lsl #4
        cmp     r3, #0
        ldr     r3, [sp, #0x30]
        add     r6, r1, r2, lsl #3
        add     r5, r1, r2, lsl #4
        add     r7, r0, r3, lsl #3
        add     r3, r1, r3, lsl #3
        ble     LCKL2
        add     r11, r9, #4
        str     r11, [sp, #0x50]
        add     r11, r10, #4
        str     r11, [sp, #0x4C]
        add     r11, r7, #4
        str     r11, [sp, #0x48]
        add     r11, r6, #4
        str     r11, [sp, #0x44]
        add     r11, r5, #4
        str     r11, [sp, #0x40]
        add     lr, r0, #4
        add     r12, r1, #4
        add     r11, r3, #4
        mov     r8, #0
        str     r11, [sp, #0x20]
        str     r12, [sp, #8]
        str     lr, [sp, #4]
        str     r3, [sp, #0x10]
        str     r5, [sp, #0xC]
        str     r6, [sp]
        str     r7, [sp, #0x14]
        str     r9, [sp, #0x1C]
        str     r10, [sp, #0x18]
        str     r1, [sp, #0x28]
        str     r0, [sp, #0x24]
        str     r2, [sp, #0x38]
LCKL1:
        ldr     r0, [sp, #0x1C]
        ldr     r2, [sp, #0x1C]
        ldr     r11, [r0]
        ldr     r0, [sp, #0x24]
        add     r2, r2, #8
        mov     r1, r11
        ldr     r10, [r0, +r8, lsl #2]
        str     r2, [sp, #0x1C]
        mov     r0, r10
        bl      __addsf3
        ldr     r2, [sp, #4]
        mov     r7, r0
        ldr     r5, [r2]
        ldr     r2, [sp, #0x50]
        ldr     r6, [r2]
        ldr     r2, [sp, #4]
        mov     r0, r5
        add     r2, r2, #8
        str     r2, [sp, #4]
        mov     r1, r6
        bl      __addsf3
        mov     r9, r0
        mov     r1, r11
        mov     r0, r10
        bl      __subsf3
        str     r0, [sp, #0x54]
        mov     r0, r5
        mov     r1, r6
        bl      __subsf3
        ldr     r1, [sp, #0x14]
        ldr     r1, [r1]
        str     r1, [sp, #0x58]
        ldr     r1, [sp, #0x18]
        ldr     r5, [r1]
        ldr     r1, [sp, #0x50]
        str     r0, [sp, #0x5C]
        add     r1, r1, #8
        str     r1, [sp, #0x50]
        ldr     r1, [sp, #0x58]
        mov     r0, r5
        bl      __addsf3
        ldr     r2, [sp, #0x4C]
        mov     r11, r0
        ldr     r2, [r2]
        str     r2, [sp, #0x60]
        ldr     r2, [sp, #0x48]
        ldr     r0, [sp, #0x60]
        ldr     r6, [r2]
        ldr     r2, [sp, #0x18]
        mov     r1, r6
        add     r2, r2, #8
        str     r2, [sp, #0x18]
        bl      __addsf3
        ldr     r1, [sp, #0x58]
        mov     r10, r0
        mov     r0, r5
        bl      __subsf3
        mov     r5, r0
        ldr     r0, [sp, #0x60]
        mov     r1, r6
        bl      __subsf3
        mov     r6, r0
        mov     r0, r7
        mov     r1, r11
        bl      __addsf3
        str     r0, [sp, #0x60]
        mov     r1, r10
        mov     r0, r9
        bl      __addsf3
        str     r0, [sp, #0x58]
        mov     r0, r7
        mov     r1, r11
        bl      __subsf3
        mov     r7, r0
        mov     r1, r10
        mov     r0, r9
        bl      __subsf3
        mov     r10, r0
        ldr     r0, [sp, #0x54]
        mov     r1, r6
        bl      __subsf3
        mov     r11, r0
        ldr     r0, [sp, #0x5C]
        mov     r1, r5
        bl      __addsf3
        mov     r9, r0
        ldr     r0, [sp, #0x54]
        mov     r1, r6
        bl      __addsf3
        mov     r6, r0
        ldr     r0, [sp, #0x5C]
        mov     r1, r5
        bl      __subsf3
        ldr     r2, [sp, #0x60]
        ldr     r1, [sp, #0x28]
        mov     r5, r0
        mov     r0, r11
        str     r2, [r1, +r8, lsl #2]
        ldr     r2, [sp, #0x58]
        ldr     r1, [sp, #8]
        add     r8, r8, #2
        str     r2, [r1]
        ldr     r1, [r4]
        bl      __mulsf3
        ldr     r2, [sp, #0x14]
        ldr     r1, [r4, #4]
        str     r0, [sp, #0x60]
        add     r2, r2, #8
        str     r2, [sp, #0x14]
        mov     r0, r9
        bl      __mulsf3
        ldr     r1, [sp, #0x60]
        bl      __addsf3
        ldr     r1, [sp]
        str     r0, [r1]
        ldr     r2, [sp, #0x4C]
        ldr     r1, [r4]
        mov     r0, r9
        add     r2, r2, #8
        str     r2, [sp, #0x4C]
        bl      __mulsf3
        ldr     r1, [r4, #4]
        ldr     r2, [sp, #0x48]
        mov     r9, r0
        mov     r0, r11
        add     r2, r2, #8
        str     r2, [sp, #0x48]
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r9
        bl      __subsf3
        ldr     r1, [sp, #0x44]
        str     r0, [r1]
        ldr     r2, [sp, #8]
        ldr     r1, [r4, #8]
        mov     r0, r7
        add     r2, r2, #8
        str     r2, [sp, #8]
        bl      __mulsf3
        ldr     r2, [sp]
        ldr     r1, [r4, #0xC]
        mov     r9, r0
        mov     r0, r10
        add     r2, r2, #8
        str     r2, [sp]
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        ldr     r1, [sp, #0xC]
        str     r0, [r1]
        ldr     r2, [sp, #0x44]
        ldr     r1, [r4, #8]
        mov     r0, r10
        add     r2, r2, #8
        str     r2, [sp, #0x44]
        bl      __mulsf3
        ldr     r2, [sp, #0xC]
        ldr     r1, [r4, #0xC]
        mov     r9, r0
        mov     r0, r7
        add     r2, r2, #8
        str     r2, [sp, #0xC]
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r9
        bl      __subsf3
        ldr     r2, [sp, #0x40]
        str     r0, [r2], #8
        ldr     r1, [r4, #0x10]
        str     r2, [sp, #0x40]
        mov     r0, r6
        bl      __mulsf3
        ldr     r1, [r4, #0x14]
        mov     r7, r0
        mov     r0, r5
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        ldr     r1, [sp, #0x10]
        str     r0, [r1]
        ldr     r2, [sp, #0x10]
        ldr     r1, [r4, #0x10]
        mov     r0, r5
        add     r2, r2, #8
        str     r2, [sp, #0x10]
        bl      __mulsf3
        ldr     r1, [r4, #0x14]
        mov     r5, r0
        mov     r0, r6
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r5
        bl      __subsf3
        ldr     r1, [sp, #0x20]
        str     r0, [r1]
        ldr     r0, [sp, #0x2C]
        cmp     r8, r0
        ldr     r0, [sp, #0x20]
        add     r0, r0, #8
        str     r0, [sp, #0x20]
        blt     LCKL1
        ldr     r1, [sp, #0x28]
        ldr     r0, [sp, #0x24]
        ldr     r2, [sp, #0x38]
LCKL2:
        ldr     r3, [sp, #0x3C]
        ldr     r12, [sp, #0x34]
        add     r4, r4, #0x18
        add     r3, r3, #1
        str     r3, [sp, #0x3C]
        cmp     r3, r12
        add     r0, r0, r2, lsl #5
        add     r1, r1, r2, lsl #5
        blt     LCKL0
LCKL3:
        add     sp, sp, #0x64
        ldmia   sp!, {r4 - r11, pc}
LCKL4:
        mov     r2, r12, lsl #3
        cmp     r2, #0
        ble     LCKL3
        add     r10, r1, #8
        str     r10, [sp, #0x40]
        add     r10, r1, #0xC
        str     r10, [sp, #0x44]
        add     r10, r1, #0x10
        str     r10, [sp, #0x50]
        add     r12, r0, #0x10
        add     r10, r1, #0x14
        str     r12, [sp, #0x48]
        str     r10, [sp, #0x4C]
        add     r9, r0, #4
        add     r8, r0, #0x14
        add     r7, r0, #8
        add     r6, r0, #0x18
        add     r5, r0, #0xC
        add     lr, r0, #0x1C
        add     r12, r1, #4
        add     r10, r1, #0x18
        add     r11, r1, #0x1C
        str     r11, [sp, #0x30]
        str     r10, [sp, #0x34]
        str     r12, [sp, #0x10]
        str     lr, [sp, #0x1C]
        str     r5, [sp, #0x20]
        str     r6, [sp, #0xC]
        str     r7, [sp, #0x14]
        str     r8, [sp, #0x18]
        str     r9, [sp, #0x2C]
        str     r2, [sp, #0x38]
        str     r1, [sp, #0x28]
        str     r0, [sp, #0x24]
        str     r3, [sp, #0x3C]
LCKL5:
        ldr     r2, [sp, #0x24]
        ldr     r1, [sp, #0x48]
        ldr     r10, [r2], #0x20
        ldr     r5, [r1]
        str     r2, [sp, #0x24]
        ldr     r2, [sp, #0x48]
        mov     r0, r10
        mov     r1, r5
        add     r2, r2, #0x20
        str     r2, [sp, #0x48]
        bl      __addsf3
        ldr     r2, [sp, #0x18]
        mov     r8, r0
        ldr     r7, [r2]
        ldr     r2, [sp, #0x2C]
        ldr     r6, [r2]
        ldr     r2, [sp, #0x2C]
        mov     r1, r7
        add     r2, r2, #0x20
        str     r2, [sp, #0x2C]
        mov     r0, r6
        bl      __addsf3
        mov     r9, r0
        mov     r1, r5
        mov     r0, r10
        bl      __subsf3
        str     r0, [sp, #0x60]
        mov     r0, r6
        mov     r1, r7
        bl      __subsf3
        ldr     r2, [sp, #0x14]
        ldr     r1, [sp, #0xC]
        mov     r5, r0
        ldr     r2, [r2]
        ldr     r6, [r1]
        str     r2, [sp, #0x5C]
        ldr     r2, [sp, #0x18]
        ldr     r0, [sp, #0x5C]
        mov     r1, r6
        add     r2, r2, #0x20
        str     r2, [sp, #0x18]
        bl      __addsf3
        ldr     r2, [sp, #0x1C]
        mov     r11, r0
        ldr     r2, [r2]
        str     r2, [sp, #0x58]
        ldr     r2, [sp, #0x20]
        ldr     r1, [sp, #0x58]
        ldr     r7, [r2]
        ldr     r2, [sp, #0x14]
        mov     r0, r7
        add     r2, r2, #0x20
        str     r2, [sp, #0x14]
        bl      __addsf3
        mov     r10, r0
        ldr     r0, [sp, #0x5C]
        mov     r1, r6
        bl      __subsf3
        ldr     r1, [sp, #0x58]
        mov     r6, r0
        mov     r0, r7
        bl      __subsf3
        mov     r7, r0
        mov     r1, r11
        mov     r0, r8
        bl      __addsf3
        str     r0, [sp, #0x5C]
        mov     r1, r10
        mov     r0, r9
        bl      __addsf3
        str     r0, [sp, #0x58]
        mov     r0, r8
        mov     r1, r11
        bl      __subsf3
        mov     r8, r0
        mov     r0, r9
        mov     r1, r10
        bl      __subsf3
        mov     r10, r0
        ldr     r0, [sp, #0x60]
        mov     r1, r7
        bl      __subsf3
        mov     r11, r0
        mov     r0, r5
        mov     r1, r6
        bl      __addsf3
        mov     r9, r0
        ldr     r0, [sp, #0x60]
        mov     r1, r7
        bl      __addsf3
        mov     r7, r0
        mov     r1, r6
        mov     r0, r5
        bl      __subsf3
        ldr     r1, [sp, #0x5C]
        ldr     r2, [sp, #0x28]
        mov     r5, r0
        mov     r0, r11
        str     r1, [r2]
        ldr     r1, [sp, #0x58]
        ldr     r2, [sp, #0x10]
        str     r1, [r2]
        ldr     r1, [r4]
        bl      __mulsf3
        ldr     r1, [r4, #4]
        ldr     r2, [sp, #0xC]
        mov     r6, r0
        mov     r0, r9
        add     r2, r2, #0x20
        str     r2, [sp, #0xC]
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        ldr     r1, [sp, #0x40]
        str     r0, [r1]
        ldr     r2, [sp, #0x20]
        ldr     r1, [r4]
        mov     r0, r9
        add     r2, r2, #0x20
        str     r2, [sp, #0x20]
        bl      __mulsf3
        ldr     r1, [r4, #4]
        ldr     r2, [sp, #0x1C]
        mov     r6, r0
        mov     r0, r11
        add     r2, r2, #0x20
        str     r2, [sp, #0x1C]
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r6
        bl      __subsf3
        ldr     r1, [sp, #0x44]
        str     r0, [r1]
        ldr     r2, [sp, #0x28]
        ldr     r1, [r4, #8]
        mov     r0, r8
        add     r2, r2, #0x20
        str     r2, [sp, #0x28]
        bl      __mulsf3
        ldr     r2, [sp, #0x10]
        ldr     r1, [r4, #0xC]
        mov     r6, r0
        mov     r0, r10
        add     r2, r2, #0x20
        str     r2, [sp, #0x10]
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        ldr     r1, [sp, #0x50]
        str     r0, [r1]
        ldr     r1, [r4, #8]
        ldr     r2, [sp, #0x40]
        mov     r0, r10
        add     r2, r2, #0x20
        str     r2, [sp, #0x40]
        bl      __mulsf3
        ldr     r2, [sp, #0x44]
        ldr     r1, [r4, #0xC]
        mov     r6, r0
        add     r2, r2, #0x20
        mov     r0, r8
        str     r2, [sp, #0x44]
        bl      __mulsf3
        ldr     r2, [sp, #0x50]
        mov     r1, r0
        mov     r0, r6
        add     r2, r2, #0x20
        str     r2, [sp, #0x50]
        bl      __subsf3
        ldr     r1, [sp, #0x4C]
        str     r0, [r1], #0x20
        ldr     r2, [sp, #0x3C]
        str     r1, [sp, #0x4C]
        ldr     r1, [r4, #0x10]
        mov     r0, r7
        add     r2, r2, #8
        str     r2, [sp, #0x3C]
        bl      __mulsf3
        ldr     r1, [r4, #0x14]
        mov     r6, r0
        mov     r0, r5
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        ldr     r2, [sp, #0x34]
        str     r0, [r2], #0x20
        ldr     r1, [r4, #0x10]
        str     r2, [sp, #0x34]
        mov     r0, r5
        bl      __mulsf3
        ldr     r1, [r4, #0x14]
        mov     r5, r0
        mov     r0, r7
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r5
        bl      __subsf3
        ldr     r1, [sp, #0x30]
        add     r4, r4, #0x18
        str     r0, [r1]
        ldr     r0, [sp, #0x3C]
        ldr     r1, [sp, #0x38]
        cmp     r0, r1
        ldr     r0, [sp, #0x30]
        add     r0, r0, #0x20
        str     r0, [sp, #0x30]
        blt     LCKL5
        add     sp, sp, #0x64
        ldmia   sp!, {r4 - r11, pc}


