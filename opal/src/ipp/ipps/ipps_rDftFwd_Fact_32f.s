        .text
        .align  4
        .globl  _ipps_rDftFwd_Fact_32f


_ipps_rDftFwd_Fact_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x84
        ldr     r12, [sp, #0xA8]
        ldr     r9, [sp, #0xB0]
        mov     r7, r3
        str     r12, [sp, #0x70]
        ldr     r12, [sp, #0xAC]
        mov     r5, r2
        mov     r8, r0
        str     r12, [sp, #0x3C]
        rsb     r12, r7, #0
        mla     lr, r5, r7, r12
        add     r4, r5, #1
        mov     r10, r1
        mov     r0, r4, asr #1
        str     lr, [sp, #0x74]
        ldr     r12, [r8]
        add     r4, r10, r7, lsl #3
        sub     r11, r4, #4
        cmp     r0, #1
        add     r1, r8, r7, lsl #2
        add     r2, r8, lr, lsl #2
        mov     r4, r12
        ble     LCJK1
        add     lr, r9, #4
        mov     r3, r9
        str     r9, [sp, #0x4C]
        str     r5, [sp, #0x50]
        str     r10, [sp, #0x68]
        str     r8, [sp, #0x6C]
        sub     r6, r0, #1
        str     r12, [sp, #0x60]
        str     r11, [sp, #0x64]
        str     r0, [sp, #0xC]
        mov     r10, r1
        mov     r9, r2
        mov     r5, r3
        mov     r8, lr
LCJK0:
        ldr     r0, [r10]
        ldr     r1, [r9]
        bl      __addsf3
        mov     r11, r0
        mov     r1, r4
        bl      __addsf3
        str     r11, [r5], #8
        ldr     r1, [r10]
        ldr     r2, [r9]
        mov     r4, r0
        mov     r0, r1
        mov     r1, r2
        bl      __subsf3
        str     r0, [r8], #8
        subs    r6, r6, #1
        add     r10, r10, r7, lsl #2
        sub     r9, r9, r7, lsl #2
        bne     LCJK0
        ldr     r12, [sp, #0x60]
        ldr     r11, [sp, #0x64]
        ldr     r0, [sp, #0xC]
        ldr     r9, [sp, #0x4C]
        ldr     r5, [sp, #0x50]
        ldr     r10, [sp, #0x68]
        ldr     r8, [sp, #0x6C]
LCJK1:
        cmp     r0, #1
        str     r4, [r10]
        ble     LCJK5
        ldr     lr, [pc, #0x5DC]
        mov     r3, #1
        sub     r2, r5, #1
        ldr     lr, [lr]
        add     r1, r9, #4
        str     r9, [sp, #0x4C]
        str     r5, [sp, #0x50]
        str     r10, [sp, #0x68]
        str     r8, [sp, #0x6C]
LCJK2:
        cmp     r2, #0
        mov     r5, r12
        mov     r4, lr
        mov     r10, r3
        ble     LCJK4
        ldr     r6, [sp, #0x4C]
        str     r11, [sp, #0x64]
        ldr     r11, [sp, #0x50]
        mov     r9, #0
        mov     r8, r1
        str     r1, [sp, #0x58]
        str     r2, [sp, #0x48]
        str     lr, [sp, #0x5C]
        str     r3, [sp, #0x54]
        str     r12, [sp, #0x60]
        str     r0, [sp, #0xC]
        str     r7, [sp, #8]
LCJK3:
        ldr     r2, [sp, #0x70]
        ldr     r0, [r6], #8
        ldr     r1, [r2, +r10, lsl #3]
        add     r7, r2, r10, lsl #3
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r1, [r8], #8
        ldr     r7, [r7, #4]
        mov     r5, r0
        mov     r0, r1
        mov     r1, r7
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r2, [sp, #0x54]
        mov     r4, r0
        add     r10, r2, r10
        cmp     r10, r11
        subge   r10, r10, r11
        ldr     r2, [sp, #0x48]
        add     r9, r9, #2
        cmp     r9, r2
        blt     LCJK3
        ldr     r1, [sp, #0x58]
        ldr     r2, [sp, #0x48]
        ldr     lr, [sp, #0x5C]
        ldr     r3, [sp, #0x54]
        ldr     r12, [sp, #0x60]
        ldr     r11, [sp, #0x64]
        ldr     r0, [sp, #0xC]
        ldr     r7, [sp, #8]
LCJK4:
        add     r3, r3, #1
        str     r5, [r11]
        str     r4, [r11, #4]
        cmp     r3, r0
        add     r11, r11, r7, lsl #3
        blt     LCJK2
        ldr     r9, [sp, #0x4C]
        ldr     r5, [sp, #0x50]
        ldr     r10, [sp, #0x68]
        ldr     r8, [sp, #0x6C]
LCJK5:
        ldr     r1, [sp, #0x3C]
        mov     r12, r7, asr #1
        cmp     r12, #1
        add     r8, r8, #4
        add     r10, r10, #4
        add     lr, r1, r5, lsl #3
        blt     LCJK13
        ldr     r4, [pc, #0x4B0]
        sub     r1, r5, #1
        add     r11, r9, #4
        ldr     r4, [r4]
        mov     r6, r1, lsl #1
        add     r2, r9, #0xC
        add     r3, r9, #8
        mov     r1, #0x10
        str     r3, [sp, #0x2C]
        str     r2, [sp, #0x30]
        str     r11, [sp, #0x34]
        str     r6, [sp, #0x38]
        str     r4, [sp, #0x3C]
        str     r9, [sp, #0x4C]
        str     r5, [sp, #0x50]
LCJK6:
        ldr     r9, [sp, #0x74]
        ldr     r6, [r8]
        ldr     r2, [r8, #4]
        add     r9, r8, r9, lsl #2
        add     r4, r10, r7, lsl #3
        str     r9, [sp, #0x54]
        sub     r9, r4, r1
        str     r9, [sp, #0x20]
        cmp     r0, #1
        add     r5, r8, r7, lsl #2
        mov     r11, r6
        mov     r9, r2
        ble     LCJK14
        mov     r3, #1
        str     r3, [sp, #0x5C]
        ldr     r3, [sp, #0x50]
        str     r9, [sp]
        str     r11, [sp, #4]
        add     r3, lr, r3, lsl #3
        str     r3, [sp, #0x14]
        ldr     r3, [sp, #0x4C]
        str     r2, [sp, #0x18]
        str     r6, [sp, #0x1C]
        str     r3, [sp, #0x60]
        ldr     r3, [sp, #0x34]
        ldr     r6, [sp, #0x5C]
        str     r4, [sp, #0x24]
        str     r3, [sp, #0x64]
        ldr     r3, [sp, #0x2C]
        ldr     r4, [sp, #0x54]
        str     r1, [sp, #0x28]
        str     r3, [sp, #0x68]
        ldr     r3, [sp, #0x30]
        str     r12, [sp, #0x40]
        str     lr, [sp, #0x10]
        str     r3, [sp, #0x6C]
        add     r3, lr, #4
        str     r3, [sp, #0x58]
        str     r7, [sp, #8]
        ldr     r7, [sp, #0x58]
        str     r10, [sp, #0x44]
        str     r8, [sp, #0x48]
        str     r0, [sp, #0xC]
LCJK7:
        ldr     r0, [r5]
        str     r0, [sp, #0x78]
        ldr     r0, [sp, #0x10]
        ldr     r10, [r5, #4]
        ldr     r11, [r7, #8]!
        ldr     r8, [r0, +r6, lsl #3]
        ldr     r0, [sp, #0x78]
        mov     r1, r8
        bl      __mulsf3
        mov     r9, r0
        mov     r1, r11
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r9
        bl      __subsf3
        str     r0, [sp, #0x7C]
        mov     r1, r8
        mov     r0, r10
        bl      __mulsf3
        mov     r8, r0
        ldr     r0, [sp, #0x78]
        mov     r1, r11
        rsb     r9, r6, #0
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [sp, #0x14]
        ldr     r11, [r4]
        ldr     r10, [r2, +r9, lsl #3]
        add     r9, r2, r9, lsl #3
        ldr     r8, [r9, #4]
        ldr     r9, [r4, #4]
        str     r0, [sp, #0x78]
        mov     r1, r10
        mov     r0, r11
        bl      __mulsf3
        str     r0, [sp, #0x80]
        mov     r0, r9
        mov     r1, r8
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x80]
        add     r6, r6, #1
        bl      __subsf3
        str     r0, [sp, #0x80]
        mov     r1, r10
        mov     r0, r9
        bl      __mulsf3
        mov     r9, r0
        mov     r1, r8
        mov     r0, r11
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        mov     r8, r0
        ldr     r1, [sp, #0x80]
        ldr     r0, [sp, #0x7C]
        bl      __addsf3
        mov     r9, r0
        ldr     r0, [sp, #0x78]
        mov     r1, r8
        bl      __addsf3
        mov     r10, r0
        ldr     r0, [sp, #4]
        mov     r1, r9
        bl      __addsf3
        str     r0, [sp, #4]
        ldr     r0, [sp]
        mov     r1, r10
        bl      __addsf3
        ldr     r2, [sp, #0x60]
        str     r0, [sp]
        str     r9, [r2]
        ldr     r2, [sp, #0x64]
        str     r10, [r2]
        ldr     r0, [sp, #0x7C]
        ldr     r1, [sp, #0x80]
        bl      __subsf3
        ldr     r2, [sp, #0x68]
        mov     r1, r8
        str     r0, [r2]
        ldr     r0, [sp, #0x78]
        bl      __subsf3
        ldr     r1, [sp, #0x6C]
        str     r0, [r1]
        ldr     r0, [sp, #0xC]
        cmp     r6, r0
        ldr     r0, [sp, #0x60]
        add     r0, r0, #0x10
        str     r0, [sp, #0x60]
        ldr     r0, [sp, #0x64]
        add     r0, r0, #0x10
        str     r0, [sp, #0x64]
        ldr     r0, [sp, #0x68]
        add     r0, r0, #0x10
        str     r0, [sp, #0x68]
        ldr     r0, [sp, #0x6C]
        add     r0, r0, #0x10
        str     r0, [sp, #0x6C]
        ldr     r0, [sp, #8]
        add     r5, r5, r0, lsl #2
        sub     r4, r4, r0, lsl #2
        blt     LCJK7
        ldr     r9, [sp]
        ldr     r11, [sp, #4]
        ldr     r2, [sp, #0x18]
        ldr     r6, [sp, #0x1C]
        ldr     r4, [sp, #0x24]
        ldr     r1, [sp, #0x28]
        ldr     r12, [sp, #0x40]
        ldr     r10, [sp, #0x44]
        ldr     r8, [sp, #0x48]
        ldr     r0, [sp, #0xC]
        ldr     r7, [sp, #8]
LCJK8:
        cmp     r0, #1
        str     r11, [r10]
        str     r9, [r10, #4]
        ble     LCJK12
        ldr     r11, [sp, #0x20]
        mov     r5, #1
        str     r2, [sp, #0x18]
        str     r6, [sp, #0x1C]
        str     r1, [sp, #0x28]
        str     r12, [sp, #0x40]
        str     r10, [sp, #0x44]
        str     r8, [sp, #0x48]
        str     r0, [sp, #0xC]
LCJK9:
        ldr     r6, [sp, #0x3C]
        ldr     r1, [sp, #0x38]
        ldr     r9, [sp, #0x1C]
        ldr     r8, [sp, #0x18]
        cmp     r1, #0
        mov     r10, r6
        mov     r12, r5
        ble     LCJK11
        ldr     r0, [sp, #0x4C]
        ldr     r1, [sp, #0x34]
        ldr     r2, [sp, #0x30]
        ldr     lr, [sp, #0x2C]
        str     r10, [sp, #0x68]
        ldr     r10, [sp, #0x50]
        mov     r3, #0
        str     r6, [sp, #0x64]
        str     r8, [sp, #0x60]
        str     r9, [sp, #0x5C]
        str     r5, [sp, #0x6C]
        str     r4, [sp, #0x24]
        str     r7, [sp, #8]
        str     r11, [sp, #0x20]
        mov     r4, r0
        mov     r5, r1
        mov     r6, r2
        mov     r8, r3
        mov     r9, r12
        mov     r7, lr
LCJK10:
        ldr     r1, [sp, #0x70]
        ldr     r0, [r4], #0x10
        ldr     r11, [r1, +r9, lsl #3]
        add     r1, r1, r9, lsl #3
        str     r1, [sp, #0x80]
        mov     r1, r11
        bl      __mulsf3
        ldr     r1, [sp, #0x5C]
        bl      __addsf3
        ldr     r2, [r5], #0x10
        str     r0, [sp, #0x5C]
        mov     r0, r2
        mov     r1, r11
        bl      __mulsf3
        ldr     r1, [sp, #0x60]
        bl      __addsf3
        ldr     r11, [sp, #0x80]
        ldr     r1, [r6], #0x10
        ldr     r11, [r11, #4]
        str     r0, [sp, #0x60]
        mov     r0, r1
        mov     r1, r11
        bl      __mulsf3
        ldr     r1, [sp, #0x68]
        bl      __addsf3
        ldr     r2, [r7], #0x10
        str     r0, [sp, #0x68]
        mov     r0, r2
        mov     r1, r11
        bl      __mulsf3
        ldr     r1, [sp, #0x64]
        bl      __addsf3
        ldr     r11, [sp, #0x6C]
        add     r9, r11, r9
        cmp     r9, r10
        str     r0, [sp, #0x64]
        subge   r9, r9, r10
        ldr     r11, [sp, #0x38]
        add     r8, r8, #4
        cmp     r8, r11
        blt     LCJK10
        ldr     r10, [sp, #0x68]
        ldr     r6, [sp, #0x64]
        ldr     r8, [sp, #0x60]
        ldr     r9, [sp, #0x5C]
        ldr     r5, [sp, #0x6C]
        ldr     r11, [sp, #0x20]
        ldr     r4, [sp, #0x24]
        ldr     r7, [sp, #8]
LCJK11:
        mov     r0, r9
        mov     r1, r10
        bl      __subsf3
        str     r0, [r4]
        mov     r0, r6
        mov     r1, r8
        bl      __addsf3
        str     r0, [r4, #4]
        mov     r0, r9
        mov     r1, r10
        bl      __addsf3
        str     r0, [r11]
        mov     r0, r6
        mov     r1, r8
        bl      __subsf3
        str     r0, [r11, #4]
        ldr     r0, [sp, #0xC]
        add     r5, r5, #1
        add     r4, r4, r7, lsl #3
        cmp     r5, r0
        add     r11, r11, r7, lsl #3
        blt     LCJK9
        ldr     r1, [sp, #0x28]
        ldr     r12, [sp, #0x40]
        ldr     r10, [sp, #0x44]
        ldr     r8, [sp, #0x48]
        ldr     r0, [sp, #0xC]
LCJK12:
        ldr     lr, [sp, #0x14]
        subs    r12, r12, #1
        add     r8, r8, #8
        add     r10, r10, #8
        add     r1, r1, #0x10
        bne     LCJK6
LCJK13:
        add     sp, sp, #0x84
        ldmia   sp!, {r4 - r11, pc}
LCJK14:
        ldr     r5, [sp, #0x50]
        add     r5, lr, r5, lsl #3
        str     r5, [sp, #0x14]
        b       LCJK8
        .long   LCJK__2il0floatpacket.1


        .data
        .align  4


LCJK__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


