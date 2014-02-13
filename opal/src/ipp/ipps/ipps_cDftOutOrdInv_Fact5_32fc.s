        .text
        .align  4
        .globl  _ipps_cDftOutOrdInv_Fact5_32fc


_ipps_cDftOutOrdInv_Fact5_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xA4
        ldr     r12, [sp, #0xC8]
        ldr     r4, [sp, #0xCC]
        add     lr, r2, r2, lsl #3
        add     lr, r2, lr
        mul     lr, lr, r3
        add     r4, r4, r3, lsl #5
        cmp     r2, #1
        add     r0, r0, lr, lsl #2
        add     r1, r1, lr, lsl #2
        mov     r3, #0
        beq     LCKK4
        cmp     r12, #0
        ble     LCKK3
        ldr     lr, [pc, #0xCE4]
        ldr     r5, [pc, #0xCE4]
        ldr     r6, [pc, #0xCE4]
        ldr     r7, [pc, #0xCE4]
        ldr     lr, [lr]
        ldr     r5, [r5]
        ldr     r6, [r6]
        ldr     r7, [r7]
        rsb     r9, r2, r2, lsl #2
        mov     r8, r2, lsl #1
        add     r10, r2, r2, lsl #2
        str     r10, [sp, #0x44]
        str     r8, [sp, #0x40]
        str     r9, [sp, #0x48]
        str     r7, [sp]
        str     r6, [sp, #0xC]
        str     r5, [sp, #4]
        str     lr, [sp, #8]
        str     r12, [sp, #0x4C]
        str     r2, [sp, #0x50]
        str     r3, [sp, #0x54]
LCKK0:
        ldr     r2, [sp, #0x40]
        ldr     r3, [sp, #0x48]
        cmp     r2, #0
        ldr     r2, [sp, #0x50]
        add     r8, r0, r3, lsl #3
        add     r3, r1, r3, lsl #3
        add     r10, r0, r2, lsl #3
        add     r9, r0, r2, lsl #4
        add     r7, r0, r2, lsl #5
        add     r6, r1, r2, lsl #3
        add     lr, r1, r2, lsl #4
        add     r2, r1, r2, lsl #5
        ble     LCKK2
        add     r11, r1, #4
        str     r11, [sp, #0x74]
        add     r11, r10, #4
        str     r11, [sp, #0x70]
        add     r11, r7, #4
        str     r11, [sp, #0x6C]
        add     r11, r9, #4
        str     r11, [sp, #0x68]
        add     r11, r8, #4
        str     r11, [sp, #0x64]
        add     r11, r6, #4
        str     r11, [sp, #0x60]
        add     r11, lr, #4
        str     r11, [sp, #0x5C]
        add     r11, r3, #4
        str     r11, [sp, #0x58]
        add     r12, r0, #4
        add     r11, r2, #4
        mov     r5, #0
        str     r11, [sp, #0x34]
        str     r12, [sp, #0x14]
        str     r2, [sp, #0x18]
        str     r3, [sp, #0x1C]
        str     lr, [sp, #0x20]
        str     r6, [sp, #0x10]
        str     r7, [sp, #0x2C]
        str     r8, [sp, #0x24]
        str     r9, [sp, #0x28]
        str     r10, [sp, #0x30]
        str     r1, [sp, #0x3C]
        str     r0, [sp, #0x38]
LCKK1:
        ldr     r2, [sp, #0x30]
        ldr     r1, [sp, #0x2C]
        ldr     r11, [r2], #8
        ldr     r7, [r1]
        str     r2, [sp, #0x30]
        ldr     r2, [sp, #0x2C]
        mov     r0, r11
        mov     r1, r7
        add     r2, r2, #8
        str     r2, [sp, #0x2C]
        bl      __addsf3
        ldr     r2, [sp, #0x70]
        mov     r8, r0
        ldr     r10, [r2]
        ldr     r2, [sp, #0x6C]
        ldr     r6, [r2]
        ldr     r2, [sp, #0x70]
        mov     r0, r10
        add     r2, r2, #8
        str     r2, [sp, #0x70]
        mov     r1, r6
        bl      __addsf3
        mov     r9, r0
        mov     r0, r11
        mov     r1, r7
        bl      __subsf3
        str     r0, [sp, #0x78]
        mov     r1, r6
        mov     r0, r10
        bl      __subsf3
        ldr     r2, [sp, #0x24]
        ldr     r2, [r2]
        str     r2, [sp, #0x7C]
        ldr     r2, [sp, #0x28]
        ldr     r1, [sp, #0x7C]
        ldr     r2, [r2]
        str     r0, [sp, #0x84]
        str     r2, [sp, #0x80]
        ldr     r2, [sp, #0x6C]
        ldr     r0, [sp, #0x80]
        add     r2, r2, #8
        str     r2, [sp, #0x6C]
        bl      __addsf3
        ldr     r2, [sp, #0x68]
        mov     r6, r0
        ldr     r10, [r2]
        ldr     r2, [sp, #0x64]
        ldr     r11, [r2]
        ldr     r2, [sp, #0x28]
        mov     r0, r10
        add     r2, r2, #8
        str     r2, [sp, #0x28]
        mov     r1, r11
        bl      __addsf3
        ldr     r1, [sp, #0x7C]
        mov     r7, r0
        ldr     r0, [sp, #0x80]
        bl      __subsf3
        str     r0, [sp, #0x80]
        mov     r1, r11
        mov     r0, r10
        bl      __subsf3
        ldr     r2, [sp, #0x38]
        ldr     r1, [sp, #8]
        ldr     r10, [r2, +r5, lsl #2]
        str     r0, [sp, #0x7C]
        mov     r0, r8
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r1, [sp, #4]
        mov     r11, r0
        mov     r0, r6
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r2, [sp, #0x14]
        ldr     r1, [sp, #8]
        ldr     r11, [r2]
        str     r0, [sp, #0x88]
        mov     r0, r9
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r1, [sp, #4]
        str     r0, [sp, #0x8C]
        mov     r0, r7
        bl      __mulsf3
        ldr     r1, [sp, #0x8C]
        bl      __addsf3
        str     r0, [sp, #0x8C]
        ldr     r1, [sp, #0xC]
        ldr     r0, [sp, #0x84]
        bl      __mulsf3
        str     r0, [sp, #0x90]
        ldr     r0, [sp, #0x7C]
        ldr     r1, [sp]
        bl      __mulsf3
        ldr     r1, [sp, #0x90]
        bl      __addsf3
        ldr     r1, [sp, #0xC]
        str     r0, [sp, #0x90]
        ldr     r0, [sp, #0x78]
        bl      __mulsf3
        str     r0, [sp, #0x94]
        ldr     r1, [sp]
        ldr     r0, [sp, #0x80]
        bl      __mulsf3
        ldr     r1, [sp, #0x94]
        bl      __addsf3
        ldr     r1, [sp, #4]
        str     r0, [sp, #0x94]
        mov     r0, r8
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r1, [sp, #8]
        str     r0, [sp, #0x98]
        mov     r0, r6
        bl      __mulsf3
        ldr     r1, [sp, #0x98]
        bl      __addsf3
        ldr     r1, [sp, #4]
        str     r0, [sp, #0x98]
        mov     r0, r9
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r1, [sp, #8]
        str     r0, [sp, #0x9C]
        mov     r0, r7
        bl      __mulsf3
        ldr     r1, [sp, #0x9C]
        bl      __addsf3
        str     r0, [sp, #0x9C]
        ldr     r0, [sp, #0x84]
        ldr     r1, [sp]
        bl      __mulsf3
        str     r0, [sp, #0x84]
        ldr     r0, [sp, #0x7C]
        ldr     r1, [sp, #0xC]
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x84]
        bl      __subsf3
        ldr     r1, [sp]
        str     r0, [sp, #0x84]
        ldr     r0, [sp, #0x78]
        bl      __mulsf3
        ldr     r1, [sp, #0xC]
        str     r0, [sp, #0x7C]
        ldr     r0, [sp, #0x80]
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x7C]
        bl      __subsf3
        str     r0, [sp, #0x80]
        mov     r0, r10
        mov     r1, r8
        bl      __addsf3
        mov     r1, r6
        bl      __addsf3
        str     r0, [sp, #0x7C]
        mov     r0, r11
        mov     r1, r9
        bl      __addsf3
        mov     r1, r7
        bl      __addsf3
        str     r0, [sp, #0x78]
        ldr     r1, [sp, #0x90]
        ldr     r0, [sp, #0x88]
        bl      __addsf3
        ldr     r1, [sp, #0x94]
        mov     r6, r0
        ldr     r0, [sp, #0x8C]
        bl      __subsf3
        mov     r11, r0
        ldr     r1, [sp, #0x84]
        ldr     r0, [sp, #0x98]
        bl      __addsf3
        str     r0, [sp, #0xA0]
        ldr     r0, [sp, #0x9C]
        ldr     r1, [sp, #0x80]
        bl      __subsf3
        mov     r7, r0
        ldr     r1, [sp, #0x84]
        ldr     r0, [sp, #0x98]
        bl      __subsf3
        mov     r9, r0
        ldr     r0, [sp, #0x9C]
        ldr     r1, [sp, #0x80]
        bl      __addsf3
        ldr     r1, [sp, #0x90]
        mov     r8, r0
        ldr     r0, [sp, #0x88]
        bl      __subsf3
        mov     r10, r0
        ldr     r1, [sp, #0x94]
        ldr     r0, [sp, #0x8C]
        bl      __addsf3
        ldr     r1, [sp, #0x3C]
        ldr     r2, [sp, #0x7C]
        str     r2, [r1, +r5, lsl #2]
        ldr     r1, [sp, #0x74]
        ldr     r2, [sp, #0x78]
        add     r5, r5, #2
        str     r2, [r1]
        ldr     r1, [r4]
        str     r0, [sp, #0x9C]
        mov     r0, r6
        bl      __mulsf3
        ldr     r2, [sp, #0x24]
        ldr     r1, [r4, #4]
        str     r0, [sp, #0x98]
        add     r2, r2, #8
        str     r2, [sp, #0x24]
        mov     r0, r11
        bl      __mulsf3
        ldr     r1, [sp, #0x98]
        bl      __addsf3
        ldr     r1, [sp, #0x10]
        str     r0, [r1]
        ldr     r2, [sp, #0x68]
        ldr     r1, [r4]
        mov     r0, r11
        add     r2, r2, #8
        str     r2, [sp, #0x68]
        bl      __mulsf3
        ldr     r2, [sp, #0x64]
        ldr     r1, [r4, #4]
        mov     r11, r0
        mov     r0, r6
        add     r2, r2, #8
        str     r2, [sp, #0x64]
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        ldr     r1, [sp, #0x60]
        str     r0, [r1]
        ldr     r1, [r4, #8]
        ldr     r0, [sp, #0xA0]
        ldr     r2, [sp, #0x14]
        add     r2, r2, #8
        str     r2, [sp, #0x14]
        bl      __mulsf3
        ldr     r2, [sp, #0x74]
        ldr     r1, [r4, #0xC]
        mov     r6, r0
        mov     r0, r7
        add     r2, r2, #8
        str     r2, [sp, #0x74]
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        ldr     r1, [sp, #0x20]
        str     r0, [r1]
        ldr     r1, [r4, #8]
        ldr     r2, [sp, #0x10]
        mov     r0, r7
        add     r2, r2, #8
        str     r2, [sp, #0x10]
        bl      __mulsf3
        ldr     r2, [sp, #0x60]
        ldr     r1, [r4, #0xC]
        mov     r6, r0
        ldr     r0, [sp, #0xA0]
        add     r2, r2, #8
        str     r2, [sp, #0x60]
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r6
        bl      __subsf3
        ldr     r1, [sp, #0x5C]
        str     r0, [r1]
        ldr     r1, [r4, #0x10]
        ldr     r2, [sp, #0x20]
        mov     r0, r9
        add     r2, r2, #8
        str     r2, [sp, #0x20]
        bl      __mulsf3
        ldr     r1, [r4, #0x14]
        ldr     r2, [sp, #0x5C]
        mov     r6, r0
        mov     r0, r8
        add     r2, r2, #8
        str     r2, [sp, #0x5C]
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        ldr     r1, [sp, #0x1C]
        str     r0, [r1]
        ldr     r2, [sp, #0x1C]
        ldr     r1, [r4, #0x10]
        mov     r0, r8
        add     r2, r2, #8
        str     r2, [sp, #0x1C]
        bl      __mulsf3
        ldr     r1, [r4, #0x14]
        mov     r6, r0
        mov     r0, r9
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r6
        bl      __subsf3
        ldr     r2, [sp, #0x58]
        str     r0, [r2], #8
        ldr     r1, [r4, #0x18]
        mov     r0, r10
        str     r2, [sp, #0x58]
        bl      __mulsf3
        ldr     r1, [r4, #0x1C]
        mov     r6, r0
        ldr     r0, [sp, #0x9C]
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        ldr     r1, [sp, #0x18]
        str     r0, [r1]
        ldr     r2, [sp, #0x18]
        ldr     r1, [r4, #0x18]
        ldr     r0, [sp, #0x9C]
        add     r2, r2, #8
        str     r2, [sp, #0x18]
        bl      __mulsf3
        ldr     r1, [r4, #0x1C]
        mov     r6, r0
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r6
        bl      __subsf3
        ldr     r1, [sp, #0x34]
        str     r0, [r1]
        ldr     r0, [sp, #0x40]
        cmp     r5, r0
        ldr     r0, [sp, #0x34]
        add     r0, r0, #8
        str     r0, [sp, #0x34]
        blt     LCKK1
        ldr     r1, [sp, #0x3C]
        ldr     r0, [sp, #0x38]
LCKK2:
        ldr     r2, [sp, #0x54]
        ldr     r3, [sp, #0x4C]
        add     r4, r4, #0x20
        add     r2, r2, #1
        str     r2, [sp, #0x54]
        cmp     r2, r3
        ldr     r2, [sp, #0x44]
        add     r0, r0, r2, lsl #3
        add     r1, r1, r2, lsl #3
        blt     LCKK0
LCKK3:
        add     sp, sp, #0xA4
        ldmia   sp!, {r4 - r11, pc}
LCKK4:
        add     r2, r12, r12, lsl #3
        add     lr, r12, r2
        cmp     lr, #0
        ble     LCKK3
        ldr     r6, [pc, #0x650]
        ldr     r12, [pc, #0x644]
        ldr     r2, [pc, #0x644]
        ldr     r6, [r6]
        ldr     r5, [pc, #0x644]
        ldr     r12, [r12]
        ldr     r2, [r2]
        str     r6, [sp, #0x44]
        ldr     r5, [r5]
        add     r10, r0, #8
        add     r9, r0, #0xC
        add     r8, r0, #0x24
        str     r5, [sp, #0x50]
        add     r5, r0, #0x20
        str     r5, [sp, #0x70]
        add     r5, r0, #0x10
        str     r5, [sp, #0x6C]
        add     r5, r0, #0x18
        str     r5, [sp, #0x48]
        add     r5, r0, #0x14
        str     r5, [sp, #0x74]
        add     r5, r0, #0x1C
        str     r5, [sp, #0x4C]
        add     r5, r1, #8
        str     r5, [sp, #0x64]
        add     r5, r1, #0xC
        str     r5, [sp, #0x60]
        add     r5, r1, #0x10
        str     r5, [sp, #0x5C]
        add     r5, r1, #0x14
        str     r5, [sp, #0x58]
        add     r5, r1, #0x18
        add     r11, r1, #0x20
        str     r5, [sp, #0x68]
        str     r11, [sp, #0x40]
        add     r7, r0, #4
        add     r6, r1, #4
        add     r5, r1, #0x1C
        add     r11, r1, #0x24
        str     r11, [sp, #0x30]
        str     r5, [sp, #0x28]
        str     r6, [sp, #0x1C]
        str     r7, [sp, #0x18]
        str     r2, [sp, #0x14]
        str     r12, [sp, #0x10]
        str     r8, [sp, #0x20]
        str     r9, [sp, #0x24]
        str     r10, [sp, #0x2C]
        str     lr, [sp, #0x34]
        str     r1, [sp, #0x3C]
        str     r0, [sp, #0x38]
        str     r3, [sp, #0x54]
LCKK5:
        ldr     r2, [sp, #0x2C]
        ldr     r1, [sp, #0x70]
        ldr     r10, [r2], #0x28
        ldr     r7, [r1]
        str     r2, [sp, #0x2C]
        ldr     r2, [sp, #0x70]
        mov     r0, r10
        mov     r1, r7
        add     r2, r2, #0x28
        str     r2, [sp, #0x70]
        bl      __addsf3
        ldr     r2, [sp, #0x24]
        mov     r6, r0
        ldr     r9, [r2]
        ldr     r2, [sp, #0x20]
        ldr     r8, [r2]
        ldr     r2, [sp, #0x24]
        mov     r0, r9
        add     r2, r2, #0x28
        str     r2, [sp, #0x24]
        mov     r1, r8
        bl      __addsf3
        mov     r5, r0
        mov     r0, r10
        mov     r1, r7
        bl      __subsf3
        str     r0, [sp, #0xA0]
        mov     r0, r9
        mov     r1, r8
        bl      __subsf3
        ldr     r2, [sp, #0x48]
        ldr     r9, [r2]
        ldr     r2, [sp, #0x6C]
        ldr     r2, [r2]
        str     r0, [sp, #0x98]
        mov     r1, r9
        str     r2, [sp, #0x9C]
        ldr     r2, [sp, #0x20]
        ldr     r0, [sp, #0x9C]
        add     r2, r2, #0x28
        str     r2, [sp, #0x20]
        bl      __addsf3
        ldr     r2, [sp, #0x74]
        mov     r7, r0
        ldr     r11, [r2]
        ldr     r2, [sp, #0x4C]
        ldr     r10, [r2]
        ldr     r2, [sp, #0x6C]
        mov     r0, r11
        add     r2, r2, #0x28
        str     r2, [sp, #0x6C]
        mov     r1, r10
        bl      __addsf3
        mov     r8, r0
        ldr     r0, [sp, #0x9C]
        mov     r1, r9
        bl      __subsf3
        str     r0, [sp, #0x9C]
        mov     r0, r11
        mov     r1, r10
        bl      __subsf3
        ldr     r2, [sp, #0x38]
        ldr     r1, [sp, #0x10]
        mov     r11, r0
        ldr     r10, [r2]
        mov     r0, r6
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r1, [sp, #0x14]
        mov     r9, r0
        mov     r0, r7
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        ldr     r2, [sp, #0x18]
        ldr     r1, [sp, #0x10]
        ldr     r9, [r2]
        str     r0, [sp, #0x94]
        mov     r0, r5
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        ldr     r1, [sp, #0x14]
        str     r0, [sp, #0x90]
        mov     r0, r8
        bl      __mulsf3
        ldr     r1, [sp, #0x90]
        bl      __addsf3
        str     r0, [sp, #0x90]
        ldr     r0, [sp, #0x98]
        ldr     r1, [sp, #0x44]
        bl      __mulsf3
        ldr     r1, [sp, #0x50]
        str     r0, [sp, #0x8C]
        mov     r0, r11
        bl      __mulsf3
        ldr     r1, [sp, #0x8C]
        bl      __addsf3
        ldr     r1, [sp, #0x44]
        str     r0, [sp, #0x8C]
        ldr     r0, [sp, #0xA0]
        bl      __mulsf3
        ldr     r1, [sp, #0x50]
        str     r0, [sp, #0x88]
        ldr     r0, [sp, #0x9C]
        bl      __mulsf3
        ldr     r1, [sp, #0x88]
        bl      __addsf3
        ldr     r1, [sp, #0x14]
        str     r0, [sp, #0x88]
        mov     r0, r6
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r1, [sp, #0x10]
        str     r0, [sp, #0x84]
        mov     r0, r7
        bl      __mulsf3
        ldr     r1, [sp, #0x84]
        bl      __addsf3
        ldr     r1, [sp, #0x14]
        str     r0, [sp, #0x84]
        mov     r0, r5
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        ldr     r1, [sp, #0x10]
        str     r0, [sp, #0x80]
        mov     r0, r8
        bl      __mulsf3
        ldr     r1, [sp, #0x80]
        bl      __addsf3
        ldr     r1, [sp, #0x50]
        str     r0, [sp, #0x80]
        ldr     r0, [sp, #0x98]
        bl      __mulsf3
        ldr     r1, [sp, #0x44]
        str     r0, [sp, #0x98]
        mov     r0, r11
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x98]
        bl      __subsf3
        ldr     r1, [sp, #0x50]
        str     r0, [sp, #0x98]
        ldr     r0, [sp, #0xA0]
        bl      __mulsf3
        mov     r11, r0
        ldr     r1, [sp, #0x44]
        ldr     r0, [sp, #0x9C]
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        str     r0, [sp, #0xA0]
        mov     r1, r6
        mov     r0, r10
        bl      __addsf3
        mov     r1, r7
        bl      __addsf3
        str     r0, [sp, #0x9C]
        mov     r1, r5
        mov     r0, r9
        bl      __addsf3
        mov     r1, r8
        bl      __addsf3
        mov     r11, r0
        ldr     r0, [sp, #0x94]
        ldr     r1, [sp, #0x8C]
        bl      __addsf3
        mov     r6, r0
        ldr     r0, [sp, #0x90]
        ldr     r1, [sp, #0x88]
        bl      __subsf3
        mov     r5, r0
        ldr     r0, [sp, #0x84]
        ldr     r1, [sp, #0x98]
        bl      __addsf3
        mov     r8, r0
        ldr     r0, [sp, #0x80]
        ldr     r1, [sp, #0xA0]
        bl      __subsf3
        mov     r7, r0
        ldr     r0, [sp, #0x84]
        ldr     r1, [sp, #0x98]
        bl      __subsf3
        mov     r10, r0
        ldr     r0, [sp, #0x80]
        ldr     r1, [sp, #0xA0]
        bl      __addsf3
        ldr     r1, [sp, #0x8C]
        mov     r9, r0
        ldr     r0, [sp, #0x94]
        bl      __subsf3
        str     r0, [sp, #0xA0]
        ldr     r1, [sp, #0x88]
        ldr     r0, [sp, #0x90]
        bl      __addsf3
        ldr     r2, [sp, #0x3C]
        ldr     r1, [sp, #0x9C]
        str     r1, [r2]
        ldr     r1, [sp, #0x1C]
        str     r11, [r1]
        ldr     r1, [r4]
        mov     r11, r0
        mov     r0, r6
        bl      __mulsf3
        ldr     r1, [r4, #4]
        ldr     r2, [sp, #0x48]
        str     r0, [sp, #0x9C]
        add     r2, r2, #0x28
        str     r2, [sp, #0x48]
        mov     r0, r5
        bl      __mulsf3
        ldr     r1, [sp, #0x9C]
        bl      __addsf3
        ldr     r1, [sp, #0x64]
        str     r0, [r1]
        ldr     r1, [r4]
        ldr     r2, [sp, #0x74]
        mov     r0, r5
        add     r2, r2, #0x28
        str     r2, [sp, #0x74]
        bl      __mulsf3
        ldr     r2, [sp, #0x4C]
        ldr     r1, [r4, #4]
        mov     r5, r0
        mov     r0, r6
        add     r2, r2, #0x28
        str     r2, [sp, #0x4C]
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r5
        bl      __subsf3
        ldr     r1, [sp, #0x60]
        str     r0, [r1]
        ldr     r1, [r4, #8]
        ldr     r2, [sp, #0x38]
        mov     r0, r8
        add     r2, r2, #0x28
        str     r2, [sp, #0x38]
        bl      __mulsf3
        ldr     r2, [sp, #0x18]
        ldr     r1, [r4, #0xC]
        mov     r5, r0
        add     r2, r2, #0x28
        str     r2, [sp, #0x18]
        mov     r0, r7
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r1, [sp, #0x5C]
        str     r0, [r1]
        ldr     r2, [sp, #0x3C]
        ldr     r1, [r4, #8]
        mov     r0, r7
        add     r2, r2, #0x28
        str     r2, [sp, #0x3C]
        bl      __mulsf3
        ldr     r2, [sp, #0x1C]
        ldr     r1, [r4, #0xC]
        mov     r5, r0
        add     r2, r2, #0x28
        str     r2, [sp, #0x1C]
        mov     r0, r8
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r5
        bl      __subsf3
        ldr     r1, [sp, #0x58]
        str     r0, [r1]
        ldr     r1, [r4, #0x10]
        ldr     r2, [sp, #0x64]
        mov     r0, r10
        add     r2, r2, #0x28
        str     r2, [sp, #0x64]
        bl      __mulsf3
        ldr     r2, [sp, #0x60]
        ldr     r1, [r4, #0x14]
        mov     r5, r0
        add     r2, r2, #0x28
        mov     r0, r9
        str     r2, [sp, #0x60]
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r1, [sp, #0x68]
        str     r0, [r1]
        ldr     r2, [sp, #0x5C]
        ldr     r1, [r4, #0x10]
        mov     r0, r9
        add     r2, r2, #0x28
        str     r2, [sp, #0x5C]
        bl      __mulsf3
        ldr     r2, [sp, #0x58]
        ldr     r1, [r4, #0x14]
        mov     r5, r0
        add     r2, r2, #0x28
        str     r2, [sp, #0x58]
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r5
        bl      __subsf3
        ldr     r1, [sp, #0x28]
        str     r0, [r1]
        ldr     r0, [sp, #0xA0]
        ldr     r2, [sp, #0x68]
        ldr     r1, [r4, #0x18]
        add     r2, r2, #0x28
        str     r2, [sp, #0x68]
        bl      __mulsf3
        ldr     r2, [sp, #0x28]
        ldr     r1, [r4, #0x1C]
        mov     r5, r0
        add     r2, r2, #0x28
        mov     r0, r11
        str     r2, [sp, #0x28]
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r1, [sp, #0x40]
        str     r0, [r1]
        ldr     r2, [sp, #0x40]
        ldr     r1, [r4, #0x18]
        mov     r0, r11
        add     r2, r2, #0x28
        str     r2, [sp, #0x40]
        bl      __mulsf3
        ldr     r1, [r4, #0x1C]
        mov     r5, r0
        ldr     r0, [sp, #0xA0]
        add     r4, r4, #0x20
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r5
        bl      __subsf3
        ldr     r1, [sp, #0x54]
        add     r1, r1, #0xA
        str     r1, [sp, #0x54]
        ldr     r1, [sp, #0x30]
        str     r0, [r1]
        ldr     r0, [sp, #0x54]
        ldr     r1, [sp, #0x34]
        cmp     r0, r1
        ldr     r0, [sp, #0x30]
        add     r0, r0, #0x28
        str     r0, [sp, #0x30]
        blt     LCKK5
        add     sp, sp, #0xA4
        ldmia   sp!, {r4 - r11, pc}
        .long   LCKK_C_1_5
        .long   LCKK_C_2_5
        .long   LCKK_S_1_5
        .long   LCKK_S_2_5


        .data
        .align  4


LCKK_C_1_5:
        .byte   0x7A,0x37,0x9E,0x3E
LCKK_C_2_5:
        .byte   0xBD,0x1B,0x4F,0xBF
LCKK_S_1_5:
        .byte   0x71,0x78,0x73,0xBF
LCKK_S_2_5:
        .byte   0x18,0x79,0x16,0xBF


