        .text
        .align  4
        .globl  _ipps_crDftFwd_Prime_32f


_ipps_crDftFwd_Prime_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x58
        ldr     r12, [sp, #0x80]
        ldr     lr, [sp, #0x7C]
        mul     r5, r2, r12
        ldr     r7, [sp, #0x84]
        ldr     r6, [sp, #0x88]
        add     r4, lr, #1
        cmp     r12, #0
        mov     r4, r4, asr #1
        ble     LCJX7
        ldr     r9, [pc, #0x358]
        rsb     r8, r5, #0
        mla     r8, lr, r5, r8
        ldr     r9, [r9]
        sub     r11, lr, #1
        add     r10, r6, #8
        str     r10, [sp, #0x54]
        str     r11, [sp, #0x50]
        str     r9, [sp, #0x4C]
        str     r8, [sp, #0x48]
        str     r5, [sp, #0x20]
        str     r6, [sp, #0x44]
        str     r7, [sp, #0x40]
        str     lr, [sp, #0x3C]
        str     r2, [sp, #0x38]
LCJX0:
        ldr     r8, [sp, #0x48]
        ldr     r5, [sp, #0x20]
        ldr     lr, [r0]
        ldr     r2, [r1]
        add     r6, r0, r8, lsl #2
        add     r8, r1, r8, lsl #2
        add     r7, r0, r5, lsl #2
        str     r8, [sp, #0xC]
        cmp     r4, #1
        add     r5, r1, r5, lsl #2
        mov     r9, lr
        mov     r8, r2
        ble     LCJX2
        ldr     r11, [sp, #0x44]
        str     r8, [sp, #4]
        str     r9, [sp]
        sub     r10, r11, #4
        ldr     r9, [sp, #0xC]
        str     r10, [sp, #0x10]
        sub     r11, r11, #0xC
        sub     r10, r4, #1
        str     r11, [sp, #0x14]
        str     r10, [sp, #8]
        ldr     r10, [sp, #0x14]
        ldr     r11, [sp, #0x20]
        str     r2, [sp, #0x18]
        str     lr, [sp, #0x1C]
        str     r4, [sp, #0x24]
        str     r12, [sp, #0x28]
        str     r3, [sp, #0x2C]
        str     r1, [sp, #0x30]
        str     r0, [sp, #0x34]
LCJX1:
        ldr     r0, [r7]
        ldr     r1, [r6]
        bl      __addsf3
        ldr     r1, [r5]
        ldr     r2, [r9]
        mov     r8, r0
        mov     r0, r1
        mov     r1, r2
        bl      __addsf3
        mov     r4, r0
        ldr     r0, [sp]
        mov     r1, r8
        bl      __addsf3
        str     r0, [sp]
        ldr     r0, [sp, #4]
        mov     r1, r4
        bl      __addsf3
        str     r8, [r10, #0xC]
        str     r4, [r10, #0x10]!
        ldr     r1, [r7]
        ldr     r2, [r6]
        str     r0, [sp, #4]
        mov     r0, r1
        mov     r1, r2
        bl      __subsf3
        ldr     r1, [sp, #0x10]
        add     r7, r7, r11, lsl #2
        str     r0, [r1, #0xC]
        ldr     r0, [r5]
        ldr     r1, [r9]
        add     r5, r5, r11, lsl #2
        sub     r6, r6, r11, lsl #2
        bl      __subsf3
        ldr     r1, [sp, #0x10]
        sub     r9, r9, r11, lsl #2
        str     r0, [r1, #0x10]!
        ldr     r0, [sp, #8]
        str     r1, [sp, #0x10]
        subs    r0, r0, #1
        str     r0, [sp, #8]
        bne     LCJX1
        ldr     r8, [sp, #4]
        ldr     r9, [sp]
        ldr     r2, [sp, #0x18]
        ldr     lr, [sp, #0x1C]
        ldr     r4, [sp, #0x24]
        ldr     r12, [sp, #0x28]
        ldr     r3, [sp, #0x2C]
        ldr     r1, [sp, #0x30]
        ldr     r0, [sp, #0x34]
LCJX2:
        cmp     r4, #1
        str     r9, [r3]
        str     r8, [r3, #4]
        ldrle   r2, [sp, #0x3C]
        addle   r5, r3, r2, lsl #3
        ble     LCJX6
        ldr     r5, [sp, #0x3C]
        mov     r7, #1
        add     r6, r3, #4
        add     r5, r3, r5, lsl #3
        str     r2, [sp, #0x18]
        str     lr, [sp, #0x1C]
        str     r12, [sp, #0x28]
        str     r3, [sp, #0x2C]
        str     r1, [sp, #0x30]
        str     r0, [sp, #0x34]
LCJX3:
        ldr     r9, [sp, #0x4C]
        ldr     r0, [sp, #0x50]
        ldr     r11, [sp, #0x1C]
        ldr     r10, [sp, #0x18]
        cmp     r0, #0
        mov     r8, r9
        mov     r0, r7
        ble     LCJX5
        ldr     r2, [sp, #0x54]
        ldr     r3, [sp, #0x44]
        str     r5, [sp, #0x10]
        ldr     r5, [sp, #0x3C]
        mov     r1, #0
        str     r9, [sp, #8]
        str     r10, [sp, #4]
        str     r11, [sp]
        str     r4, [sp, #0x24]
        str     r6, [sp, #0x14]
        str     r7, [sp, #0xC]
        mov     r4, r0
        mov     r11, r1
        mov     r10, r2
        mov     r9, r3
LCJX4:
        ldr     r12, [sp, #0x40]
        ldr     r0, [r9]
        ldr     r6, [r12, +r4, lsl #3]
        add     r7, r12, r4, lsl #3
        ldr     r12, [sp, #0xC]
        mov     r1, r6
        add     r4, r12, r4
        bl      __mulsf3
        ldr     r1, [sp]
        bl      __addsf3
        ldr     r2, [r9, #4]
        str     r0, [sp]
        mov     r1, r6
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [sp, #4]
        bl      __addsf3
        ldr     r1, [r10, #4]
        ldr     r7, [r7, #4]
        str     r0, [sp, #4]
        mov     r0, r1
        mov     r1, r7
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [r10], #0x10
        mov     r8, r0
        mov     r1, r7
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [sp, #8]
        bl      __addsf3
        cmp     r4, r5
        str     r0, [sp, #8]
        subge   r4, r4, r5
        ldr     r12, [sp, #0x50]
        add     r11, r11, #2
        add     r9, r9, #0x10
        cmp     r11, r12
        blt     LCJX4
        ldr     r5, [sp, #0x10]
        ldr     r9, [sp, #8]
        ldr     r10, [sp, #4]
        ldr     r11, [sp]
        ldr     r6, [sp, #0x14]
        ldr     r7, [sp, #0xC]
        ldr     r4, [sp, #0x24]
LCJX5:
        mov     r0, r11
        mov     r1, r8
        bl      __subsf3
        ldr     r2, [sp, #0x2C]
        mov     r1, r9
        str     r0, [r2, +r7, lsl #3]
        mov     r0, r10
        bl      __addsf3
        str     r0, [r6, #8]!
        mov     r1, r8
        mov     r0, r11
        bl      __addsf3
        rsb     r8, r7, #0
        str     r0, [r5, +r8, lsl #3]
        mov     r0, r10
        mov     r1, r9
        bl      __subsf3
        add     r7, r7, #1
        add     r8, r5, r8, lsl #3
        cmp     r7, r4
        str     r0, [r8, #4]
        blt     LCJX3
        ldr     r12, [sp, #0x28]
        ldr     r1, [sp, #0x30]
        ldr     r0, [sp, #0x34]
LCJX6:
        ldr     r2, [sp, #0x38]
        subs    r12, r12, #1
        mov     r3, r5
        add     r0, r0, r2, lsl #2
        add     r1, r1, r2, lsl #2
        bne     LCJX0
LCJX7:
        add     sp, sp, #0x58
        ldmia   sp!, {r4 - r11, pc}
        .long   LCJX__2il0floatpacket.1


        .data
        .align  4


LCJX__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


