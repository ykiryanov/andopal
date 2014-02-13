        .text
        .align  4
        .globl  _ipps_rDftInvRecombine_32f


_ipps_rDftInvRecombine_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x38
        mov     r9, r0
        ldr     r10, [r9]
        ldr     r5, [r9, #4]
        mov     r8, r1
        mov     r0, r10
        mov     r7, r2
        mov     r1, r5
        mov     r6, r3
        bl      __addsf3
        mov     r4, r0
        mov     r0, r10
        mov     r1, r5
        bl      __subsf3
        str     r4, [r8]
        cmp     r7, #1
        str     r0, [r8, #4]
        add     r4, r9, #4
        add     r12, r8, #4
        beq     LCIV2
        mov     lr, r7, lsl #1
        cmp     r7, #2
        sub     lr, lr, #2
        ble     LCIV1
        add     r12, r12, lr, lsl #2
        add     r0, r9, lr, lsl #2
        add     r4, r4, lr, lsl #2
        add     r5, r6, #8
        mov     r1, #2
        add     lr, r8, lr, lsl #2
        add     r11, r9, #8
        add     r10, r9, #0xC
        add     r6, r6, #0xC
        add     r2, r8, #8
        add     r3, r8, #0xC
        str     r3, [sp, #0x20]
        str     r2, [sp, #0x18]
        str     r6, [sp, #0x28]
        str     r10, [sp, #0x24]
        str     r11, [sp, #0x10]
        str     r12, [sp, #0xC]
        str     lr, [sp, #0x2C]
        str     r0, [sp, #0x14]
        str     r1, [sp, #0x1C]
        str     r7, [sp, #8]
        str     r8, [sp, #4]
        str     r9, [sp]
LCIV0:
        ldr     r2, [sp, #0x10]
        ldr     r1, [sp, #0x14]
        ldr     r11, [r2], #8
        ldr     r8, [r1]
        str     r2, [sp, #0x10]
        ldr     r2, [sp, #0x14]
        mov     r0, r11
        mov     r1, r8
        sub     r2, r2, #8
        str     r2, [sp, #0x14]
        bl      __subsf3
        ldr     r2, [sp, #0x24]
        ldr     r10, [r4], #-8
        mov     r6, r0
        ldr     r9, [r2]
        ldr     r2, [sp, #0x24]
        mov     r1, r10
        add     r2, r2, #8
        str     r2, [sp, #0x24]
        mov     r0, r9
        bl      __addsf3
        mov     r7, r0
        mov     r0, r11
        mov     r1, r8
        bl      __addsf3
        mov     r8, r0
        mov     r0, r9
        mov     r1, r10
        bl      __subsf3
        ldr     r2, [sp, #0x28]
        ldr     r11, [r5], #8
        ldr     r10, [r2]
        str     r0, [sp, #0x30]
        mov     r0, r6
        mov     r1, r10
        bl      __mulsf3
        str     r0, [sp, #0x34]
        mov     r1, r11
        mov     r0, r7
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x34]
        bl      __subsf3
        mov     r9, r0
        mov     r1, r11
        mov     r0, r6
        bl      __mulsf3
        mov     r6, r0
        mov     r1, r10
        mov     r0, r7
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        mov     r6, r0
        mov     r0, r8
        mov     r1, r9
        bl      __addsf3
        mov     r7, r0
        mov     r0, r8
        mov     r1, r9
        bl      __subsf3
        mov     r9, r0
        ldr     r0, [sp, #0x30]
        mov     r1, r6
        bl      __addsf3
        ldr     r1, [sp, #0x30]
        mov     r8, r0
        mov     r0, r6
        bl      __subsf3
        ldr     r1, [sp, #0x18]
        str     r7, [r1]
        ldr     r1, [sp, #0x20]
        str     r8, [r1]
        ldr     r1, [sp, #0x2C]
        str     r9, [r1]
        ldr     r1, [sp, #0x1C]
        add     r1, r1, #2
        str     r1, [sp, #0x1C]
        ldr     r1, [sp, #0xC]
        str     r0, [r1], #-8
        ldr     r0, [sp, #0x28]
        str     r1, [sp, #0xC]
        add     r0, r0, #8
        str     r0, [sp, #0x28]
        ldr     r0, [sp, #0x18]
        ldr     r1, [sp, #8]
        add     r0, r0, #8
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x20]
        add     r0, r0, #8
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #0x2C]
        sub     r0, r0, #8
        str     r0, [sp, #0x2C]
        ldr     r0, [sp, #0x1C]
        cmp     r0, r1
        blt     LCIV0
        ldr     r7, [sp, #8]
        ldr     r8, [sp, #4]
        ldr     r9, [sp]
LCIV1:
        tst     r7, #1
        bne     LCIV2
        ldr     r3, [pc, #0x30]
        ldr     r0, [r9, +r7, lsl #2]
        mov     r12, r7, lsl #2
        ldr     r1, [r3]
        add     r4, r12, #4
        bl      __mulsf3
        ldr     r3, [pc, #0x1C]
        str     r0, [r8, +r7, lsl #2]
        ldr     r0, [r4, +r9]
        ldr     r1, [r3]
        bl      __mulsf3
        str     r0, [r4, +r8]
LCIV2:
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
        .long   LCIV__2il0floatpacket.1
        .long   LCIV__2il0floatpacket.2


        .data
        .align  4


LCIV__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x40
LCIV__2il0floatpacket.2:
        .byte   0x00,0x00,0x00,0xC0


