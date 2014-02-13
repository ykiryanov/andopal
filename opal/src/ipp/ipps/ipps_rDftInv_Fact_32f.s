        .text
        .align  4
        .globl  _ipps_rDftInv_Fact_32f


_ipps_rDftInv_Fact_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x70
        ldr     r12, [sp, #0x94]
        mov     r6, r3
        rsb     lr, r6, #0
        mla     r4, r2, r6, lr
        str     r12, [sp, #0x64]
        ldr     r12, [sp, #0x98]
        add     lr, r2, #1
        str     r12, [sp, #0x34]
        str     r4, [sp, #0x68]
        ldr     r5, [r0]
        ldr     r12, [sp, #0x9C]
        mov     lr, lr, asr #1
        add     r7, r0, r6, lsl #3
        str     r5, [sp, #0x30]
        add     r8, r1, r6, lsl #2
        add     r4, r1, r4, lsl #2
        cmp     lr, #1
        sub     r7, r7, #4
        str     r8, [sp, #0x54]
        str     r4, [sp, #0x50]
        ble     LCJD3
        ldr     r4, [pc, #0x79C]
        sub     r8, lr, #1
        cmp     r8, #4
        blt     LCJD16
        ldr     r4, [r4]
        mov     r10, #0
        add     r11, r12, #8
        str     r11, [sp, #0x60]
        str     r10, [sp, #0x38]
        ldr     r10, [sp, #0x60]
        add     r9, r12, #4
        sub     r3, lr, #4
        mov     r8, #1
        add     r11, r12, #0xC
        str     r9, [sp, #0x4C]
        str     r3, [sp, #0x3C]
        str     lr, [sp, #0x40]
        str     r12, [sp, #0x44]
        str     r2, [sp, #0x48]
        str     r1, [sp, #0x58]
        str     r0, [sp, #0x5C]
LCJD0:
        ldr     r0, [r7]
        mov     r1, r4
        add     r9, r7, r6, lsl #3
        bl      __mulsf3
        str     r0, [sp, #0x2C]
        mov     r1, r5
        bl      __addsf3
        ldr     r2, [sp, #0x2C]
        mov     r1, r4
        str     r2, [r10, #-8]
        ldr     r2, [r7, #4]
        str     r0, [sp, #0x2C]
        add     r5, r9, r6, lsl #3
        mov     r0, r2
        bl      __mulsf3
        str     r0, [r11, #-8]
        ldr     r0, [r7, +r6, lsl #3]
        mov     r1, r4
        add     r8, r8, #3
        bl      __mulsf3
        ldr     r1, [sp, #0x2C]
        mov     r7, r0
        bl      __addsf3
        str     r7, [r10]
        ldr     r2, [r9, #4]
        str     r0, [sp, #0x2C]
        mov     r0, r2
        mov     r1, r4
        bl      __mulsf3
        str     r0, [r11]
        ldr     r0, [r9, +r6, lsl #3]
        mov     r1, r4
        add     r7, r5, r6, lsl #3
        bl      __mulsf3
        ldr     r1, [sp, #0x2C]
        mov     r9, r0
        bl      __addsf3
        str     r9, [r10, #8]
        ldr     r2, [r5, #4]
        mov     r5, r0
        mov     r1, r4
        mov     r0, r2
        bl      __mulsf3
        str     r0, [r11, #8]
        ldr     r2, [sp, #0x3C]
        add     r10, r10, #0x18
        add     r11, r11, #0x18
        cmp     r8, r2
        ldr     r2, [sp, #0x38]
        add     r2, r2, #6
        str     r2, [sp, #0x38]
        ble     LCJD0
        ldr     r9, [sp, #0x4C]
        ldr     r10, [sp, #0x38]
        ldr     lr, [sp, #0x40]
        ldr     r12, [sp, #0x44]
        ldr     r2, [sp, #0x48]
        ldr     r1, [sp, #0x58]
        ldr     r0, [sp, #0x5C]
LCJD1:
        add     r11, r12, r10, lsl #2
        str     lr, [sp, #0x40]
        str     r12, [sp, #0x44]
        str     r6, [sp, #4]
        str     r2, [sp, #0x48]
        str     r1, [sp, #0x58]
        str     r0, [sp, #0x5C]
LCJD2:
        ldr     r0, [r7]
        mov     r1, r4
        add     r8, r8, #1
        bl      __mulsf3
        mov     r6, r0
        mov     r1, r5
        bl      __addsf3
        str     r6, [r11], #8
        ldr     r2, [r7, #4]
        mov     r5, r0
        mov     r1, r4
        mov     r0, r2
        bl      __mulsf3
        str     r0, [r9, +r10, lsl #2]
        ldr     r2, [sp, #0x40]
        add     r10, r10, #2
        cmp     r8, r2
        ldr     r2, [sp, #4]
        add     r7, r7, r2, lsl #3
        blt     LCJD2
        ldr     lr, [sp, #0x40]
        ldr     r12, [sp, #0x44]
        ldr     r6, [sp, #4]
        ldr     r2, [sp, #0x48]
        ldr     r1, [sp, #0x58]
        ldr     r0, [sp, #0x5C]
LCJD3:
        cmp     lr, #1
        str     r5, [r1]
        ble     LCJD7
        ldr     r4, [pc, #0x5D0]
        ldr     r10, [sp, #0x50]
        ldr     r11, [sp, #0x54]
        ldr     r4, [r4]
        add     r7, r12, #4
        mov     r9, #1
        sub     r5, r2, #1
        str     r7, [sp, #0x4C]
        str     lr, [sp, #0x40]
        str     r12, [sp, #0x44]
        str     r2, [sp, #0x48]
        str     r1, [sp, #0x58]
        str     r0, [sp, #0x5C]
LCJD4:
        ldr     r7, [sp, #0x30]
        cmp     r5, #0
        mov     r8, r4
        mov     r1, r9
        ble     LCJD6
        ldr     r2, [sp, #0x44]
        ldr     r3, [sp, #0x4C]
        str     r6, [sp, #4]
        ldr     r6, [sp, #0x48]
        mov     r0, #0
        str     r4, [sp, #0x60]
        str     r9, [sp, #0x3C]
        str     r10, [sp, #0x50]
        str     r11, [sp, #0x54]
        str     r5, [sp, #0x38]
        mov     r11, r0
        mov     r4, r1
        mov     r9, r2
        mov     r10, r3
LCJD5:
        ldr     r12, [sp, #0x64]
        ldr     r0, [r9], #8
        ldr     r1, [r12, +r4, lsl #3]
        add     r5, r12, r4, lsl #3
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        ldr     r1, [r10], #8
        ldr     r5, [r5, #4]
        mov     r7, r0
        mov     r0, r1
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r12, [sp, #0x3C]
        mov     r8, r0
        add     r4, r12, r4
        cmp     r4, r6
        subge   r4, r4, r6
        ldr     r12, [sp, #0x38]
        add     r11, r11, #2
        cmp     r11, r12
        blt     LCJD5
        ldr     r5, [sp, #0x38]
        ldr     r4, [sp, #0x60]
        ldr     r9, [sp, #0x3C]
        ldr     r10, [sp, #0x50]
        ldr     r11, [sp, #0x54]
        ldr     r6, [sp, #4]
LCJD6:
        mov     r0, r7
        mov     r1, r8
        bl      __addsf3
        str     r0, [r11]
        mov     r0, r7
        mov     r1, r8
        bl      __subsf3
        str     r0, [r10]
        ldr     r0, [sp, #0x40]
        add     r9, r9, #1
        add     r11, r11, r6, lsl #2
        cmp     r9, r0
        sub     r10, r10, r6, lsl #2
        blt     LCJD4
        ldr     lr, [sp, #0x40]
        ldr     r12, [sp, #0x44]
        ldr     r2, [sp, #0x48]
        ldr     r1, [sp, #0x58]
        ldr     r0, [sp, #0x5C]
LCJD7:
        add     r8, r1, #4
        ldr     r1, [sp, #0x34]
        mov     r7, r6, asr #1
        cmp     r7, #1
        add     r0, r0, #4
        add     r1, r1, r2, lsl #3
        blt     LCJD15
        ldr     r4, [pc, #0x470]
        sub     r5, r2, #1
        add     r10, r12, #4
        ldr     r4, [r4]
        mov     r5, r5, lsl #1
        add     r11, r12, #0xC
        add     r3, r12, #8
        mov     r9, #0x10
        str     r3, [sp, #0x1C]
        str     r11, [sp, #0x20]
        str     r10, [sp, #0x24]
        str     r5, [sp, #0x28]
        str     r4, [sp, #0x2C]
        str     r12, [sp, #0x44]
        str     r6, [sp, #4]
        str     r2, [sp, #0x48]
LCJD8:
        ldr     r4, [sp, #0x68]
        ldr     r2, [sp, #4]
        ldr     r12, [r0]
        ldr     r3, [r0, #4]
        add     r4, r8, r4, lsl #2
        add     r6, r0, r2, lsl #3
        str     r4, [sp, #0x10]
        cmp     lr, #1
        sub     r5, r6, r9
        add     r2, r8, r2, lsl #2
        mov     r4, r12
        mov     r10, r3
        ble     LCJD10
        ldr     r11, [sp, #0x44]
        str     r10, [sp]
        str     r3, [sp, #8]
        str     r11, [sp, #0x4C]
        ldr     r11, [sp, #0x24]
        str     r12, [sp, #0xC]
        str     r2, [sp, #0x14]
        str     r11, [sp, #0x54]
        ldr     r11, [sp, #0x1C]
        ldr     r10, [sp, #0x54]
        str     r9, [sp, #0x18]
        str     r11, [sp, #0x58]
        ldr     r11, [sp, #0x20]
        ldr     r9, [sp, #0x4C]
        str     r7, [sp, #0x30]
        str     r11, [sp, #0x5C]
        sub     r11, lr, #1
        str     r11, [sp, #0x50]
        ldr     r11, [sp, #0x58]
        str     r1, [sp, #0x34]
        str     r8, [sp, #0x38]
        str     r0, [sp, #0x3C]
        str     lr, [sp, #0x40]
LCJD9:
        ldr     r1, [r5]
        ldr     r0, [r6]
        bl      __addsf3
        ldr     r1, [r5, #4]
        ldr     r2, [r6, #4]
        mov     r8, r0
        mov     r0, r2
        bl      __subsf3
        mov     r7, r0
        mov     r0, r4
        mov     r1, r8
        bl      __addsf3
        mov     r4, r0
        ldr     r0, [sp]
        mov     r1, r7
        bl      __addsf3
        str     r8, [r9], #0x10
        str     r7, [r10], #0x10
        ldr     r1, [r5]
        ldr     r2, [r6]
        str     r0, [sp]
        mov     r0, r2
        bl      __subsf3
        str     r0, [r11], #0x10
        ldr     r0, [r6, #4]
        ldr     r1, [r5, #4]
        bl      __addsf3
        ldr     r1, [sp, #0x5C]
        str     r0, [r1], #0x10
        ldr     r2, [sp, #0x50]
        str     r1, [sp, #0x5C]
        ldr     r1, [sp, #4]
        subs    r2, r2, #1
        str     r2, [sp, #0x50]
        add     r6, r6, r1, lsl #3
        add     r5, r5, r1, lsl #3
        ldr     r1, [sp, #0x50]
        bne     LCJD9
        ldr     r10, [sp]
        ldr     r3, [sp, #8]
        ldr     r12, [sp, #0xC]
        ldr     r2, [sp, #0x14]
        ldr     r9, [sp, #0x18]
        ldr     r7, [sp, #0x30]
        ldr     r1, [sp, #0x34]
        ldr     r8, [sp, #0x38]
        ldr     r0, [sp, #0x3C]
        ldr     lr, [sp, #0x40]
LCJD10:
        cmp     lr, #1
        str     r4, [r8]
        str     r10, [r8, #4]
        ldrle   r2, [sp, #0x48]
        addle   r6, r1, r2, lsl #3
        ble     LCJD14
        ldr     r4, [sp, #0x48]
        mov     r5, #1
        str     r3, [sp, #8]
        add     r6, r1, r4, lsl #3
        add     r4, r1, #4
        str     r6, [sp, #0x58]
        str     r12, [sp, #0xC]
        str     r2, [sp, #0x14]
        str     r9, [sp, #0x18]
        str     r7, [sp, #0x30]
        str     r1, [sp, #0x34]
        str     r8, [sp, #0x38]
        str     r0, [sp, #0x3C]
        str     lr, [sp, #0x40]
LCJD11:
        ldr     r6, [sp, #0x2C]
        ldr     r2, [sp, #8]
        ldr     r0, [sp, #0x28]
        ldr     r10, [sp, #0xC]
        cmp     r0, #0
        str     r2, [sp]
        mov     r11, r6
        mov     r1, r5
        ble     LCJD13
        ldr     r2, [sp, #0x1C]
        ldr     r7, [sp, #0x44]
        ldr     r8, [sp, #0x24]
        ldr     r9, [sp, #0x20]
        str     r10, [sp, #0x60]
        ldr     r10, [sp, #0x48]
        mov     r0, #0
        str     r6, [sp, #0x4C]
        str     r4, [sp, #0x5C]
        str     r5, [sp, #0x54]
        str     r11, [sp, #0x50]
        mov     r5, r0
        mov     r6, r1
        mov     r4, r2
LCJD12:
        ldr     r3, [sp, #0x64]
        ldr     r0, [r7], #0x10
        ldr     r11, [r3, +r6, lsl #3]
        add     r3, r3, r6, lsl #3
        str     r3, [sp, #0x6C]
        mov     r1, r11
        bl      __mulsf3
        ldr     r1, [sp, #0x60]
        bl      __addsf3
        ldr     r2, [r8], #0x10
        str     r0, [sp, #0x60]
        mov     r0, r2
        mov     r1, r11
        bl      __mulsf3
        ldr     r1, [sp]
        bl      __addsf3
        ldr     r3, [sp, #0x6C]
        ldr     r1, [r9], #0x10
        ldr     r11, [r3, #4]
        str     r0, [sp]
        mov     r0, r1
        mov     r1, r11
        bl      __mulsf3
        ldr     r1, [sp, #0x50]
        bl      __addsf3
        ldr     r2, [r4], #0x10
        str     r0, [sp, #0x50]
        mov     r0, r2
        mov     r1, r11
        bl      __mulsf3
        ldr     r1, [sp, #0x4C]
        bl      __addsf3
        ldr     r3, [sp, #0x54]
        add     r6, r3, r6
        cmp     r6, r10
        str     r0, [sp, #0x4C]
        subge   r6, r6, r10
        ldr     r3, [sp, #0x28]
        add     r5, r5, #4
        cmp     r5, r3
        blt     LCJD12
        ldr     r11, [sp, #0x50]
        ldr     r6, [sp, #0x4C]
        ldr     r10, [sp, #0x60]
        ldr     r4, [sp, #0x5C]
        ldr     r5, [sp, #0x54]
LCJD13:
        mov     r0, r10
        mov     r1, r11
        bl      __addsf3
        ldr     r9, [sp]
        mov     r8, r0
        mov     r1, r6
        mov     r0, r9
        bl      __subsf3
        mov     r7, r0
        mov     r0, r10
        mov     r1, r11
        bl      __subsf3
        mov     r10, r0
        mov     r0, r9
        mov     r1, r6
        bl      __addsf3
        ldr     r1, [sp, #0x34]
        rsb     r9, r5, #0
        mov     r6, r0
        ldr     r1, [r1, +r5, lsl #3]
        mov     r0, r8
        bl      __mulsf3
        ldr     r1, [r4, #8]
        str     r0, [sp, #0x6C]
        mov     r0, r7
        bl      __mulsf3
        ldr     r1, [sp, #0x6C]
        bl      __addsf3
        ldr     r1, [sp, #0x14]
        str     r0, [r1]
        ldr     r1, [sp, #0x34]
        mov     r0, r7
        ldr     r7, [sp, #0x58]
        ldr     r1, [r1, +r5, lsl #3]
        add     r5, r5, #1
        add     r11, r7, r9, lsl #3
        bl      __mulsf3
        ldr     r1, [r4, #8]!
        str     r0, [sp, #0x6C]
        mov     r0, r8
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x6C]
        bl      __subsf3
        ldr     r2, [sp, #0x14]
        str     r0, [r2, #4]
        ldr     r3, [sp, #4]
        ldr     r1, [r7, +r9, lsl #3]
        mov     r0, r10
        add     r3, r2, r3, lsl #2
        str     r3, [sp, #0x14]
        bl      __mulsf3
        ldr     r1, [r11, #4]
        mov     r8, r0
        mov     r0, r6
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r8, [sp, #0x10]
        str     r0, [r8]
        ldr     r1, [r7, +r9, lsl #3]
        mov     r0, r6
        bl      __mulsf3
        ldr     r1, [r11, #4]
        mov     r6, r0
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r6
        bl      __subsf3
        str     r0, [r8, #4]
        ldr     r0, [sp, #0x40]
        cmp     r5, r0
        ldr     r0, [sp, #4]
        sub     r8, r8, r0, lsl #2
        str     r8, [sp, #0x10]
        blt     LCJD11
        ldr     r6, [sp, #0x58]
        ldr     r9, [sp, #0x18]
        ldr     r7, [sp, #0x30]
        ldr     r8, [sp, #0x38]
        ldr     r0, [sp, #0x3C]
        ldr     lr, [sp, #0x40]
LCJD14:
        subs    r7, r7, #1
        add     r0, r0, #8
        add     r8, r8, #8
        mov     r1, r6
        add     r9, r9, #0x10
        bne     LCJD8
LCJD15:
        add     sp, sp, #0x70
        ldmia   sp!, {r4 - r11, pc}
LCJD16:
        ldr     r4, [r4]
        mov     r8, #1
        mov     r10, #0
        add     r9, r12, #4
        b       LCJD1
        .long   LCJD__2il0floatpacket.2
        .long   LCJD__2il0floatpacket.1


        .data
        .align  4


LCJD__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00
LCJD__2il0floatpacket.2:
        .byte   0x00,0x00,0x00,0x40


