        .text
        .align  4
        .globl  _ipps_rDftInv_Prime_32f


_ipps_rDftInv_Prime_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x5C
        ldr     lr, [sp, #0x84]
        ldr     r12, [sp, #0x80]
        str     lr, [sp, #4]
        mul     r4, r1, r12
        ldr     lr, [sp, #0x88]
        add     r5, r3, #1
        cmp     r12, #0
        str     r0, [sp]
        mov     r5, r5, asr #1
        ble     LCIZ9
        ldr     r6, [pc, #0x394]
        ldr     r0, [pc, #0x394]
        rsb     r7, r4, #0
        mla     r11, r3, r4, r7
        ldr     r6, [r6]
        ldr     r7, [r0]
        sub     r8, r5, #4
        str     r8, [sp, #0x4C]
        ldr     r8, [sp]
        sub     r9, r3, #1
        sub     r10, r5, #1
        add     r0, lr, #4
        str     r7, [sp, #0x18]
        str     r10, [sp, #0x48]
        str     r9, [sp, #0x44]
        str     r6, [sp, #0x40]
        str     r4, [sp, #0x24]
        str     r3, [sp, #0x3C]
        str     r1, [sp, #0x38]
LCIZ0:
        ldr     r3, [sp, #0x24]
        ldr     r4, [r8]
        cmp     r5, #1
        add     r3, r2, r3, lsl #2
        str     r3, [sp, #0x14]
        str     r4, [sp, #0xC]
        add     r3, r2, r11, lsl #2
        str     r3, [sp, #0x10]
        ble     LCIZ4
        ldr     r3, [sp, #0x48]
        cmp     r3, #4
        blt     LCIZ10
        str     r5, [sp, #0x28]
        ldr     r5, [sp, #0x18]
        sub     r6, r8, #4
        mov     r3, #0
        add     r1, r6, #8
        mov     r7, #1
        add     r10, lr, #8
        add     r9, lr, #0xC
        str     r3, [sp, #0x50]
        str     r1, [sp, #8]
        str     r0, [sp, #0x1C]
        str     r11, [sp, #0x20]
        str     lr, [sp, #0x2C]
        str     r12, [sp, #0x30]
        str     r2, [sp, #0x34]
LCIZ1:
        ldr     r2, [sp, #8]
        mov     r1, r5
        ldr     r0, [r2], #0x18
        str     r2, [sp, #8]
        bl      __mulsf3
        mov     r11, r0
        mov     r1, r4
        bl      __addsf3
        str     r11, [r10, #-8]
        ldr     r2, [r8, +r7, lsl #3]
        str     r0, [sp, #0x54]
        mov     r1, r5
        mov     r0, r2
        bl      __mulsf3
        str     r0, [r9, #-8]
        add     r4, r7, #1
        ldr     r0, [r6, +r4, lsl #3]
        mov     r1, r5
        add     r11, r7, #2
        bl      __mulsf3
        ldr     r1, [sp, #0x54]
        str     r0, [sp, #0x58]
        bl      __addsf3
        ldr     r2, [sp, #0x58]
        mov     r1, r5
        str     r2, [r10]
        ldr     r4, [r8, +r4, lsl #3]
        str     r0, [sp, #0x58]
        add     r7, r7, #3
        mov     r0, r4
        bl      __mulsf3
        str     r0, [r9]
        ldr     r0, [r6, +r11, lsl #3]
        mov     r1, r5
        bl      __mulsf3
        ldr     r1, [sp, #0x58]
        mov     r4, r0
        bl      __addsf3
        str     r4, [r10, #8]
        ldr     r11, [r8, +r11, lsl #3]
        mov     r4, r0
        mov     r1, r5
        mov     r0, r11
        bl      __mulsf3
        str     r0, [r9, #8]
        ldr     r2, [sp, #0x4C]
        add     r10, r10, #0x18
        add     r9, r9, #0x18
        cmp     r7, r2
        ldr     r2, [sp, #0x50]
        add     r2, r2, #6
        str     r2, [sp, #0x50]
        ble     LCIZ1
        ldr     r3, [sp, #0x50]
        ldr     r0, [sp, #0x1C]
        ldr     r11, [sp, #0x20]
        ldr     r5, [sp, #0x28]
        ldr     lr, [sp, #0x2C]
        ldr     r12, [sp, #0x30]
        ldr     r2, [sp, #0x34]
LCIZ2:
        str     r8, [sp]
        ldr     r8, [sp, #0x18]
        add     r10, lr, r3, lsl #2
        add     r9, r0, r3, lsl #2
        str     r0, [sp, #0x1C]
        str     r11, [sp, #0x20]
        str     lr, [sp, #0x2C]
        str     r12, [sp, #0x30]
        str     r2, [sp, #0x34]
LCIZ3:
        ldr     r0, [r6, +r7, lsl #3]
        mov     r1, r8
        bl      __mulsf3
        mov     r11, r0
        mov     r1, r4
        bl      __addsf3
        str     r11, [r10], #8
        ldr     r2, [sp]
        mov     r4, r0
        mov     r1, r8
        ldr     r2, [r2, +r7, lsl #3]
        add     r7, r7, #1
        mov     r0, r2
        bl      __mulsf3
        str     r0, [r9], #8
        cmp     r7, r5
        blt     LCIZ3
        ldr     r0, [sp, #0x1C]
        ldr     r11, [sp, #0x20]
        ldr     lr, [sp, #0x2C]
        ldr     r12, [sp, #0x30]
        ldr     r2, [sp, #0x34]
        ldr     r8, [sp]
LCIZ4:
        cmp     r5, #1
        str     r4, [r2]
        ble     LCIZ8
        str     r11, [sp, #0x20]
        str     r8, [sp]
        ldr     r8, [sp, #0xC]
        ldr     r9, [sp, #0x10]
        ldr     r10, [sp, #0x14]
        ldr     r11, [sp, #0x24]
        mov     r4, #1
        str     r0, [sp, #0x1C]
        str     lr, [sp, #0x2C]
        str     r12, [sp, #0x30]
        str     r2, [sp, #0x34]
LCIZ5:
        ldr     r0, [sp, #0x44]
        ldr     r6, [sp, #0x40]
        mov     r7, r8
        cmp     r0, #0
        mov     r0, r4
        ble     LCIZ7
        ldr     r2, [sp, #0x2C]
        ldr     r3, [sp, #0x1C]
        str     r5, [sp, #0x28]
        ldr     r5, [sp, #0x3C]
        mov     r1, #0
        str     r9, [sp, #0x10]
        str     r10, [sp, #0x14]
        str     r4, [sp, #8]
        mov     r11, r0
        mov     r10, r1
        mov     r8, r2
        mov     r9, r3
LCIZ6:
        ldr     r12, [sp, #4]
        ldr     r0, [r8], #8
        ldr     r1, [r12, +r11, lsl #3]
        add     r4, r12, r11, lsl #3
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        ldr     r1, [r9], #8
        ldr     r4, [r4, #4]
        mov     r7, r0
        mov     r0, r1
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        ldr     r12, [sp, #8]
        mov     r6, r0
        add     r11, r12, r11
        cmp     r11, r5
        subge   r11, r11, r5
        ldr     r12, [sp, #0x44]
        add     r10, r10, #2
        cmp     r10, r12
        blt     LCIZ6
        ldr     r4, [sp, #8]
        ldr     r8, [sp, #0xC]
        ldr     r9, [sp, #0x10]
        ldr     r10, [sp, #0x14]
        ldr     r11, [sp, #0x24]
        ldr     r5, [sp, #0x28]
LCIZ7:
        mov     r0, r7
        mov     r1, r6
        bl      __addsf3
        str     r0, [r10]
        mov     r0, r7
        mov     r1, r6
        bl      __subsf3
        add     r4, r4, #1
        str     r0, [r9]
        cmp     r4, r5
        add     r10, r10, r11, lsl #2
        sub     r9, r9, r11, lsl #2
        blt     LCIZ5
        ldr     r0, [sp, #0x1C]
        ldr     r11, [sp, #0x20]
        ldr     lr, [sp, #0x2C]
        ldr     r12, [sp, #0x30]
        ldr     r2, [sp, #0x34]
        ldr     r8, [sp]
LCIZ8:
        ldr     r1, [sp, #0x3C]
        subs    r12, r12, #1
        add     r8, r8, r1, lsl #2
        ldr     r1, [sp, #0x38]
        add     r2, r2, r1, lsl #2
        bne     LCIZ0
LCIZ9:
        add     sp, sp, #0x5C
        ldmia   sp!, {r4 - r11, pc}
LCIZ10:
        mov     r7, #1
        mov     r3, #0
        sub     r6, r8, #4
        b       LCIZ2
        .long   LCIZ__2il0floatpacket.1
        .long   LCIZ__2il0floatpacket.2


        .data
        .align  4


LCIZ__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00
LCIZ__2il0floatpacket.2:
        .byte   0x00,0x00,0x00,0x40


