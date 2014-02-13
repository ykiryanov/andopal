        .text
        .align  4
        .globl  _ipps_cDftOutOrdFwd_Fact5_32fc


_ipps_cDftOutOrdFwd_Fact5_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xA0
        ldr     r12, [sp, #0xC4]
        ldr     r4, [sp, #0xC8]
        add     lr, r2, r2, lsl #3
        add     lr, r2, lr
        mul     lr, lr, r3
        add     r9, r4, r3, lsl #5
        cmp     r2, #1
        add     r0, r0, lr, lsl #2
        add     r1, r1, lr, lsl #2
        mov     r3, #0
        beq     LCKS4
        cmp     r12, #0
        ble     LCKS3
        ldr     lr, [pc, #0xD44]
        ldr     r4, [pc, #0xD44]
        ldr     r5, [pc, #0xD44]
        ldr     r6, [pc, #0xD44]
        ldr     lr, [lr]
        ldr     r4, [r4]
        ldr     r5, [r5]
        ldr     r6, [r6]
        rsb     r8, r2, r2, lsl #2
        mov     r7, r2, lsl #1
        add     r10, r2, r2, lsl #2
        str     r10, [sp, #0x4C]
        str     r7, [sp, #0x48]
        str     r8, [sp, #0x50]
        str     r6, [sp, #8]
        str     r5, [sp, #0xC]
        str     r4, [sp, #4]
        str     lr, [sp, #0x10]
        str     r9, [sp]
        str     r12, [sp, #0x54]
        str     r2, [sp, #0x58]
        str     r3, [sp, #0x5C]
LCKS0:
        ldr     r2, [sp, #0x48]
        ldr     r3, [sp, #0x50]
        cmp     r2, #0
        ldr     r2, [sp, #0x58]
        add     r7, r0, r3, lsl #3
        add     r3, r1, r3, lsl #3
        add     r10, r0, r2, lsl #3
        add     r8, r0, r2, lsl #4
        add     r6, r0, r2, lsl #5
        add     r5, r1, r2, lsl #3
        add     r4, r1, r2, lsl #4
        add     r2, r1, r2, lsl #5
        ble     LCKS2
        add     r11, r10, #4
        str     r11, [sp, #0x78]
        add     r11, r8, #4
        str     r11, [sp, #0x74]
        add     r11, r7, #4
        str     r11, [sp, #0x70]
        add     r11, r6, #4
        str     r11, [sp, #0x6C]
        add     r11, r5, #4
        str     r11, [sp, #0x68]
        add     r11, r4, #4
        str     r11, [sp, #0x64]
        add     r11, r3, #4
        str     r11, [sp, #0x60]
        add     lr, r0, #4
        add     r12, r1, #4
        add     r11, r2, #4
        mov     r9, #0
        str     r11, [sp, #0x3C]
        str     r12, [sp, #0x1C]
        str     lr, [sp, #0x14]
        str     r2, [sp, #0x20]
        str     r3, [sp, #0x24]
        str     r4, [sp, #0x28]
        str     r5, [sp, #0x18]
        str     r6, [sp, #0x2C]
        str     r7, [sp, #0x30]
        str     r8, [sp, #0x34]
        str     r10, [sp, #0x38]
        str     r1, [sp, #0x44]
        str     r0, [sp, #0x40]
LCKS1:
        ldr     r2, [sp, #0x78]
        ldr     r0, [sp, #0x38]
        ldr     r1, [sp]
        ldr     r4, [r2]
        ldr     r2, [sp]
        ldr     r5, [r1]
        ldr     r8, [r0]
        ldr     r7, [r2, #4]
        mov     r0, r8
        mov     r1, r5
        bl      __mulsf3
        mov     r6, r0
        mov     r0, r4
        mov     r1, r7
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r6
        bl      __subsf3
        mov     r6, r0
        mov     r0, r4
        mov     r1, r5
        bl      __mulsf3
        mov     r4, r0
        mov     r0, r8
        mov     r1, r7
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r2, [sp]
        ldr     r1, [sp, #0x34]
        mov     r7, r0
        ldr     r11, [r2, #8]
        ldr     r5, [r2, #0xC]
        ldr     r2, [sp, #0x74]
        ldr     r8, [r1]
        mov     r1, r11
        ldr     r4, [r2]
        mov     r0, r8
        bl      __mulsf3
        mov     r10, r0
        mov     r0, r4
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r10
        bl      __subsf3
        str     r0, [sp, #0x7C]
        mov     r0, r4
        mov     r1, r11
        bl      __mulsf3
        mov     r4, r0
        mov     r0, r8
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r2, [sp]
        ldr     r1, [sp, #0x30]
        ldr     r11, [r2, #0x10]
        ldr     r5, [r2, #0x14]
        ldr     r2, [sp, #0x70]
        ldr     r8, [r1]
        mov     r1, r11
        ldr     r4, [r2]
        str     r0, [sp, #0x80]
        mov     r0, r8
        bl      __mulsf3
        mov     r10, r0
        mov     r1, r5
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r10
        bl      __subsf3
        str     r0, [sp, #0x84]
        mov     r0, r4
        mov     r1, r11
        bl      __mulsf3
        mov     r4, r0
        mov     r1, r5
        mov     r0, r8
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r2, [sp, #0x2C]
        ldr     r1, [sp]
        ldr     r11, [r2]
        ldr     r2, [sp]
        ldr     r5, [r1, #0x18]
        ldr     r4, [r2, #0x1C]
        ldr     r2, [sp, #0x6C]
        mov     r1, r5
        ldr     r10, [r2]
        str     r0, [sp, #0x88]
        mov     r0, r11
        bl      __mulsf3
        mov     r8, r0
        mov     r0, r10
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r8
        bl      __subsf3
        mov     r8, r0
        mov     r1, r5
        mov     r0, r10
        bl      __mulsf3
        mov     r5, r0
        mov     r1, r4
        mov     r0, r11
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        mov     r10, r0
        mov     r1, r8
        mov     r0, r6
        bl      __addsf3
        mov     r5, r0
        mov     r0, r7
        mov     r1, r10
        bl      __addsf3
        mov     r4, r0
        mov     r0, r6
        mov     r1, r8
        bl      __subsf3
        str     r0, [sp, #0x8C]
        mov     r0, r7
        mov     r1, r10
        bl      __subsf3
        ldr     r1, [sp, #0x84]
        str     r0, [sp, #0x90]
        ldr     r0, [sp, #0x7C]
        bl      __addsf3
        mov     r6, r0
        ldr     r1, [sp, #0x88]
        ldr     r0, [sp, #0x80]
        bl      __addsf3
        mov     r7, r0
        ldr     r0, [sp, #0x7C]
        ldr     r1, [sp, #0x84]
        bl      __subsf3
        str     r0, [sp, #0x84]
        ldr     r1, [sp, #0x88]
        ldr     r0, [sp, #0x80]
        bl      __subsf3
        ldr     r2, [sp, #0x40]
        ldr     r1, [sp, #0x10]
        mov     r10, r0
        ldr     r8, [r2, +r9, lsl #2]
        mov     r0, r5
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [sp, #4]
        mov     r11, r0
        mov     r0, r6
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r2, [sp, #0x14]
        ldr     r1, [sp, #0x10]
        ldr     r11, [r2]
        str     r0, [sp, #0x88]
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r1, [sp, #4]
        str     r0, [sp, #0x80]
        mov     r0, r7
        bl      __mulsf3
        ldr     r1, [sp, #0x80]
        bl      __addsf3
        ldr     r1, [sp, #0xC]
        str     r0, [sp, #0x80]
        ldr     r0, [sp, #0x90]
        bl      __mulsf3
        ldr     r1, [sp, #8]
        str     r0, [sp, #0x7C]
        mov     r0, r10
        bl      __mulsf3
        ldr     r1, [sp, #0x7C]
        bl      __addsf3
        ldr     r1, [sp, #0xC]
        str     r0, [sp, #0x7C]
        ldr     r0, [sp, #0x8C]
        bl      __mulsf3
        str     r0, [sp, #0x94]
        ldr     r0, [sp, #0x84]
        ldr     r1, [sp, #8]
        bl      __mulsf3
        ldr     r1, [sp, #0x94]
        bl      __addsf3
        ldr     r1, [sp, #4]
        str     r0, [sp, #0x94]
        mov     r0, r5
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [sp, #0x10]
        str     r0, [sp, #0x98]
        mov     r0, r6
        bl      __mulsf3
        ldr     r1, [sp, #0x98]
        bl      __addsf3
        ldr     r1, [sp, #4]
        str     r0, [sp, #0x98]
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r1, [sp, #0x10]
        str     r0, [sp, #0x9C]
        mov     r0, r7
        bl      __mulsf3
        ldr     r1, [sp, #0x9C]
        bl      __addsf3
        ldr     r1, [sp, #8]
        mov     r11, r0
        ldr     r0, [sp, #0x90]
        bl      __mulsf3
        ldr     r1, [sp, #0xC]
        str     r0, [sp, #0x9C]
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x9C]
        bl      __subsf3
        ldr     r1, [sp, #8]
        str     r0, [sp, #0x9C]
        ldr     r0, [sp, #0x8C]
        bl      __mulsf3
        str     r0, [sp, #0x90]
        ldr     r0, [sp, #0x84]
        ldr     r1, [sp, #0xC]
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x90]
        bl      __subsf3
        mov     r10, r0
        mov     r1, r5
        mov     r0, r8
        bl      __addsf3
        mov     r1, r6
        bl      __addsf3
        ldr     r2, [sp, #0x44]
        mov     r1, r4
        str     r0, [r2, +r9, lsl #2]
        ldr     r2, [sp, #0x14]
        add     r9, r9, #2
        ldr     r0, [r2]
        ldr     r2, [sp, #0x38]
        add     r2, r2, #8
        str     r2, [sp, #0x38]
        bl      __addsf3
        mov     r1, r7
        bl      __addsf3
        ldr     r2, [sp, #0x1C]
        str     r0, [r2]
        ldr     r0, [sp, #0x88]
        ldr     r1, [sp, #0x7C]
        bl      __subsf3
        ldr     r2, [sp, #0x18]
        str     r0, [r2]
        ldr     r1, [sp, #0x94]
        ldr     r0, [sp, #0x80]
        bl      __addsf3
        ldr     r2, [sp, #0x68]
        str     r0, [r2]
        ldr     r1, [sp, #0x9C]
        ldr     r0, [sp, #0x98]
        bl      __subsf3
        ldr     r2, [sp, #0x28]
        mov     r1, r10
        str     r0, [r2]
        mov     r0, r11
        bl      __addsf3
        ldr     r2, [sp, #0x64]
        str     r0, [r2]
        ldr     r0, [sp, #0x98]
        ldr     r1, [sp, #0x9C]
        bl      __addsf3
        ldr     r2, [sp, #0x24]
        mov     r1, r10
        str     r0, [r2]
        mov     r0, r11
        bl      __subsf3
        ldr     r1, [sp, #0x60]
        str     r0, [r1]
        ldr     r0, [sp, #0x88]
        ldr     r1, [sp, #0x7C]
        bl      __addsf3
        ldr     r1, [sp, #0x20]
        str     r0, [r1]
        ldr     r0, [sp, #0x80]
        ldr     r1, [sp, #0x94]
        bl      __subsf3
        ldr     r1, [sp, #0x3C]
        str     r0, [r1]
        ldr     r0, [sp, #0x48]
        cmp     r9, r0
        ldr     r0, [sp, #0x78]
        add     r0, r0, #8
        str     r0, [sp, #0x78]
        ldr     r0, [sp, #0x34]
        add     r0, r0, #8
        str     r0, [sp, #0x34]
        ldr     r0, [sp, #0x74]
        add     r0, r0, #8
        str     r0, [sp, #0x74]
        ldr     r0, [sp, #0x30]
        add     r0, r0, #8
        str     r0, [sp, #0x30]
        ldr     r0, [sp, #0x70]
        add     r0, r0, #8
        str     r0, [sp, #0x70]
        ldr     r0, [sp, #0x2C]
        add     r0, r0, #8
        str     r0, [sp, #0x2C]
        ldr     r0, [sp, #0x6C]
        add     r0, r0, #8
        str     r0, [sp, #0x6C]
        ldr     r0, [sp, #0x14]
        add     r0, r0, #8
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #0x1C]
        add     r0, r0, #8
        str     r0, [sp, #0x1C]
        ldr     r0, [sp, #0x18]
        add     r0, r0, #8
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x68]
        add     r0, r0, #8
        str     r0, [sp, #0x68]
        ldr     r0, [sp, #0x28]
        add     r0, r0, #8
        str     r0, [sp, #0x28]
        ldr     r0, [sp, #0x64]
        add     r0, r0, #8
        str     r0, [sp, #0x64]
        ldr     r0, [sp, #0x24]
        add     r0, r0, #8
        str     r0, [sp, #0x24]
        ldr     r0, [sp, #0x60]
        add     r0, r0, #8
        str     r0, [sp, #0x60]
        ldr     r0, [sp, #0x20]
        add     r0, r0, #8
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #0x3C]
        add     r0, r0, #8
        str     r0, [sp, #0x3C]
        blt     LCKS1
        ldr     r1, [sp, #0x44]
        ldr     r0, [sp, #0x40]
LCKS2:
        ldr     r2, [sp, #0x5C]
        ldr     r3, [sp, #0x54]
        add     r2, r2, #1
        str     r2, [sp, #0x5C]
        cmp     r2, r3
        ldr     r2, [sp]
        add     r2, r2, #0x20
        str     r2, [sp]
        ldr     r2, [sp, #0x4C]
        add     r0, r0, r2, lsl #3
        add     r1, r1, r2, lsl #3
        blt     LCKS0
LCKS3:
        add     sp, sp, #0xA0
        ldmia   sp!, {r4 - r11, pc}
LCKS4:
        add     r2, r12, r12, lsl #3
        add     lr, r12, r2
        cmp     lr, #0
        ble     LCKS3
        ldr     r5, [pc, #0x670]
        ldr     r12, [pc, #0x664]
        ldr     r2, [pc, #0x664]
        ldr     r5, [r5]
        ldr     r4, [pc, #0x664]
        ldr     r12, [r12]
        ldr     r2, [r2]
        str     r5, [sp, #0x48]
        ldr     r4, [r4]
        add     r10, r0, #8
        add     r8, r0, #0x10
        add     r7, r0, #0x14
        str     r4, [sp, #0x54]
        add     r4, r0, #0xC
        str     r4, [sp, #0x74]
        add     r4, r0, #0x18
        str     r4, [sp, #0x70]
        add     r4, r0, #0x1C
        str     r4, [sp, #0x4C]
        add     r4, r0, #0x20
        str     r4, [sp, #0x78]
        add     r4, r0, #0x24
        str     r4, [sp, #0x50]
        add     r4, r1, #8
        str     r4, [sp, #0x68]
        add     r4, r1, #0xC
        str     r4, [sp, #0x64]
        add     r4, r1, #0x10
        str     r4, [sp, #0x60]
        add     r4, r1, #0x14
        str     r4, [sp, #0x58]
        add     r4, r1, #0x18
        add     r11, r1, #0x20
        str     r4, [sp, #0x6C]
        str     r11, [sp, #0x3C]
        add     r6, r0, #4
        add     r5, r1, #4
        add     r4, r1, #0x1C
        add     r11, r1, #0x24
        str     r11, [sp, #0x34]
        str     r4, [sp, #0x24]
        str     r5, [sp, #0x20]
        str     r6, [sp, #0x1C]
        str     r2, [sp, #0x14]
        str     r12, [sp, #0x18]
        str     r7, [sp, #0x28]
        str     r8, [sp, #0x2C]
        str     r10, [sp, #0x30]
        str     lr, [sp, #0x38]
        str     r1, [sp, #0x44]
        str     r0, [sp, #0x40]
        str     r3, [sp, #0x5C]
LCKS5:
        ldr     r5, [r9]
        ldr     r0, [sp, #0x30]
        ldr     r2, [sp, #0x74]
        ldr     r7, [r9, #4]
        mov     r1, r5
        ldr     r4, [r0]
        ldr     r8, [r2]
        mov     r0, r4
        bl      __mulsf3
        mov     r6, r0
        mov     r0, r8
        mov     r1, r7
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r6
        bl      __subsf3
        mov     r6, r0
        mov     r0, r8
        mov     r1, r5
        bl      __mulsf3
        mov     r5, r0
        mov     r0, r4
        mov     r1, r7
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r1, [sp, #0x2C]
        ldr     r2, [sp, #0x28]
        ldr     r10, [r9, #8]
        ldr     r5, [r1]
        ldr     r11, [r9, #0xC]
        ldr     r4, [r2]
        mov     r7, r0
        mov     r0, r5
        mov     r1, r10
        bl      __mulsf3
        mov     r8, r0
        mov     r0, r4
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r8
        bl      __subsf3
        str     r0, [sp, #0x9C]
        mov     r1, r10
        mov     r0, r4
        bl      __mulsf3
        mov     r4, r0
        mov     r0, r5
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r10, [r9, #0x10]
        ldr     r2, [sp, #0x70]
        ldr     r11, [r9, #0x14]
        mov     r1, r10
        ldr     r5, [r2]
        ldr     r2, [sp, #0x4C]
        ldr     r4, [r2]
        str     r0, [sp, #0x98]
        mov     r0, r5
        bl      __mulsf3
        mov     r8, r0
        mov     r1, r11
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r8
        bl      __subsf3
        str     r0, [sp, #0x94]
        mov     r1, r10
        mov     r0, r4
        bl      __mulsf3
        mov     r4, r0
        mov     r1, r11
        mov     r0, r5
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r2, [sp, #0x78]
        ldr     r10, [r9, #0x1C]
        ldr     r11, [r9, #0x18]
        ldr     r5, [r2]
        ldr     r2, [sp, #0x50]
        mov     r1, r11
        ldr     r4, [r2]
        str     r0, [sp, #0x90]
        mov     r0, r5
        bl      __mulsf3
        mov     r8, r0
        mov     r0, r4
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r8
        bl      __subsf3
        mov     r8, r0
        mov     r1, r11
        mov     r0, r4
        bl      __mulsf3
        mov     r4, r0
        mov     r1, r10
        mov     r0, r5
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        mov     r10, r0
        mov     r0, r6
        mov     r1, r8
        bl      __addsf3
        mov     r4, r0
        mov     r0, r7
        mov     r1, r10
        bl      __addsf3
        mov     r5, r0
        mov     r1, r8
        mov     r0, r6
        bl      __subsf3
        str     r0, [sp, #0x8C]
        mov     r0, r7
        mov     r1, r10
        bl      __subsf3
        ldr     r1, [sp, #0x94]
        mov     r11, r0
        ldr     r0, [sp, #0x9C]
        add     r9, r9, #0x20
        bl      __addsf3
        ldr     r1, [sp, #0x90]
        mov     r6, r0
        ldr     r0, [sp, #0x98]
        bl      __addsf3
        ldr     r1, [sp, #0x94]
        mov     r7, r0
        ldr     r0, [sp, #0x9C]
        bl      __subsf3
        str     r0, [sp, #0x9C]
        ldr     r0, [sp, #0x98]
        ldr     r1, [sp, #0x90]
        bl      __subsf3
        ldr     r2, [sp, #0x40]
        ldr     r1, [sp, #0x18]
        mov     r10, r0
        ldr     r8, [r2]
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [sp, #0x14]
        str     r0, [sp, #0x98]
        mov     r0, r6
        bl      __mulsf3
        ldr     r1, [sp, #0x98]
        bl      __addsf3
        ldr     r2, [sp, #0x1C]
        ldr     r1, [sp, #0x18]
        ldr     r2, [r2]
        str     r0, [sp, #0x94]
        mov     r0, r5
        str     r2, [sp, #0x98]
        bl      __mulsf3
        ldr     r1, [sp, #0x98]
        bl      __addsf3
        ldr     r1, [sp, #0x14]
        str     r0, [sp, #0x90]
        mov     r0, r7
        bl      __mulsf3
        ldr     r1, [sp, #0x90]
        bl      __addsf3
        ldr     r1, [sp, #0x48]
        str     r0, [sp, #0x90]
        mov     r0, r11
        bl      __mulsf3
        ldr     r1, [sp, #0x54]
        str     r0, [sp, #0x88]
        mov     r0, r10
        bl      __mulsf3
        ldr     r1, [sp, #0x88]
        bl      __addsf3
        ldr     r1, [sp, #0x48]
        str     r0, [sp, #0x88]
        ldr     r0, [sp, #0x8C]
        bl      __mulsf3
        ldr     r1, [sp, #0x54]
        str     r0, [sp, #0x84]
        ldr     r0, [sp, #0x9C]
        bl      __mulsf3
        ldr     r1, [sp, #0x84]
        bl      __addsf3
        ldr     r1, [sp, #0x14]
        str     r0, [sp, #0x84]
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [sp, #0x18]
        str     r0, [sp, #0x80]
        mov     r0, r6
        bl      __mulsf3
        ldr     r1, [sp, #0x80]
        bl      __addsf3
        ldr     r1, [sp, #0x14]
        str     r0, [sp, #0x80]
        mov     r0, r5
        bl      __mulsf3
        ldr     r1, [sp, #0x98]
        bl      __addsf3
        ldr     r1, [sp, #0x18]
        str     r0, [sp, #0x98]
        mov     r0, r7
        bl      __mulsf3
        ldr     r1, [sp, #0x98]
        bl      __addsf3
        ldr     r1, [sp, #0x54]
        str     r0, [sp, #0x98]
        mov     r0, r11
        bl      __mulsf3
        ldr     r1, [sp, #0x48]
        mov     r11, r0
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        mov     r11, r0
        ldr     r1, [sp, #0x54]
        ldr     r0, [sp, #0x8C]
        bl      __mulsf3
        str     r0, [sp, #0x8C]
        ldr     r0, [sp, #0x9C]
        ldr     r1, [sp, #0x48]
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x8C]
        bl      __subsf3
        mov     r10, r0
        mov     r1, r4
        mov     r0, r8
        bl      __addsf3
        mov     r1, r6
        bl      __addsf3
        ldr     r2, [sp, #0x44]
        mov     r1, r5
        str     r0, [r2]
        ldr     r2, [sp, #0x1C]
        ldr     r0, [r2]
        ldr     r2, [sp, #0x30]
        add     r2, r2, #0x28
        str     r2, [sp, #0x30]
        bl      __addsf3
        mov     r1, r7
        bl      __addsf3
        ldr     r2, [sp, #0x20]
        str     r0, [r2]
        ldr     r0, [sp, #0x94]
        ldr     r1, [sp, #0x88]
        bl      __subsf3
        ldr     r2, [sp, #0x68]
        str     r0, [r2]
        ldr     r1, [sp, #0x84]
        ldr     r0, [sp, #0x90]
        bl      __addsf3
        ldr     r2, [sp, #0x64]
        mov     r1, r11
        str     r0, [r2]
        ldr     r0, [sp, #0x80]
        bl      __subsf3
        ldr     r2, [sp, #0x60]
        mov     r1, r10
        str     r0, [r2]
        ldr     r0, [sp, #0x98]
        bl      __addsf3
        ldr     r2, [sp, #0x58]
        mov     r1, r11
        str     r0, [r2]
        ldr     r0, [sp, #0x80]
        bl      __addsf3
        ldr     r2, [sp, #0x6C]
        mov     r1, r10
        str     r0, [r2]
        ldr     r0, [sp, #0x98]
        bl      __subsf3
        ldr     r1, [sp, #0x24]
        str     r0, [r1]
        ldr     r0, [sp, #0x94]
        ldr     r1, [sp, #0x88]
        bl      __addsf3
        ldr     r1, [sp, #0x3C]
        str     r0, [r1]
        ldr     r0, [sp, #0x90]
        ldr     r1, [sp, #0x84]
        bl      __subsf3
        ldr     r1, [sp, #0x5C]
        add     r1, r1, #0xA
        str     r1, [sp, #0x5C]
        ldr     r1, [sp, #0x34]
        str     r0, [r1]
        ldr     r0, [sp, #0x5C]
        ldr     r1, [sp, #0x38]
        cmp     r0, r1
        ldr     r0, [sp, #0x74]
        add     r0, r0, #0x28
        str     r0, [sp, #0x74]
        ldr     r0, [sp, #0x2C]
        add     r0, r0, #0x28
        str     r0, [sp, #0x2C]
        ldr     r0, [sp, #0x28]
        add     r0, r0, #0x28
        str     r0, [sp, #0x28]
        ldr     r0, [sp, #0x70]
        add     r0, r0, #0x28
        str     r0, [sp, #0x70]
        ldr     r0, [sp, #0x4C]
        add     r0, r0, #0x28
        str     r0, [sp, #0x4C]
        ldr     r0, [sp, #0x78]
        add     r0, r0, #0x28
        str     r0, [sp, #0x78]
        ldr     r0, [sp, #0x50]
        add     r0, r0, #0x28
        str     r0, [sp, #0x50]
        ldr     r0, [sp, #0x40]
        add     r0, r0, #0x28
        str     r0, [sp, #0x40]
        ldr     r0, [sp, #0x44]
        add     r0, r0, #0x28
        str     r0, [sp, #0x44]
        ldr     r0, [sp, #0x1C]
        add     r0, r0, #0x28
        str     r0, [sp, #0x1C]
        ldr     r0, [sp, #0x20]
        add     r0, r0, #0x28
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #0x68]
        add     r0, r0, #0x28
        str     r0, [sp, #0x68]
        ldr     r0, [sp, #0x64]
        add     r0, r0, #0x28
        str     r0, [sp, #0x64]
        ldr     r0, [sp, #0x60]
        add     r0, r0, #0x28
        str     r0, [sp, #0x60]
        ldr     r0, [sp, #0x58]
        add     r0, r0, #0x28
        str     r0, [sp, #0x58]
        ldr     r0, [sp, #0x6C]
        add     r0, r0, #0x28
        str     r0, [sp, #0x6C]
        ldr     r0, [sp, #0x24]
        add     r0, r0, #0x28
        str     r0, [sp, #0x24]
        ldr     r0, [sp, #0x3C]
        add     r0, r0, #0x28
        str     r0, [sp, #0x3C]
        ldr     r0, [sp, #0x34]
        add     r0, r0, #0x28
        str     r0, [sp, #0x34]
        blt     LCKS5
        add     sp, sp, #0xA0
        ldmia   sp!, {r4 - r11, pc}
        .long   LCKS_C_1_5
        .long   LCKS_C_2_5
        .long   LCKS_S_1_5
        .long   LCKS_S_2_5


        .data
        .align  4


LCKS_C_1_5:
        .byte   0x7A,0x37,0x9E,0x3E
LCKS_C_2_5:
        .byte   0xBD,0x1B,0x4F,0xBF
LCKS_S_1_5:
        .byte   0x71,0x78,0x73,0xBF
LCKS_S_2_5:
        .byte   0x18,0x79,0x16,0xBF


