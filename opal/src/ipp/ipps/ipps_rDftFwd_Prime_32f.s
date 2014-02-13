        .text
        .align  4
        .globl  _ipps_rDftFwd_Prime_32f


_ipps_rDftFwd_Prime_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x40
        ldr     r8, [sp, #0x64]
        ldr     r4, [sp, #0x68]
        ldr     r12, [sp, #0x6C]
        mul     r6, r1, r8
        add     lr, r3, #1
        cmp     r8, #0
        mov     lr, lr, asr #1
        ble     LCJG7
        ldr     r5, [pc, #0x200]
        rsb     r7, r6, #0
        mla     r9, r3, r6, r7
        ldr     r5, [r5]
        sub     r10, r3, #1
        add     r7, r12, #4
        str     r7, [sp, #0x3C]
        str     r10, [sp]
        str     r5, [sp, #0x10]
        str     r4, [sp, #0x38]
        str     r3, [sp, #0x34]
        str     r1, [sp, #0x30]
LCJG0:
        ldr     r3, [r0]
        cmp     lr, #1
        add     r11, r0, r9, lsl #2
        add     r1, r0, r6, lsl #2
        mov     r4, r3
        ble     LCJG2
        mov     r10, r12
        ldr     r5, [sp, #0x3C]
        str     r8, [sp, #0x24]
        sub     r7, lr, #1
        str     r3, [sp, #0xC]
        str     r9, [sp, #0x14]
        str     lr, [sp, #0x1C]
        str     r12, [sp, #0x20]
        str     r2, [sp, #0x28]
        str     r0, [sp, #0x2C]
        mov     r8, r1
LCJG1:
        ldr     r0, [r8]
        ldr     r1, [r11]
        bl      __addsf3
        mov     r9, r0
        mov     r1, r4
        bl      __addsf3
        str     r9, [r10], #8
        ldr     r1, [r8]
        ldr     r2, [r11]
        mov     r4, r0
        mov     r0, r1
        mov     r1, r2
        bl      __subsf3
        str     r0, [r5], #8
        subs    r7, r7, #1
        add     r8, r8, r6, lsl #2
        sub     r11, r11, r6, lsl #2
        bne     LCJG1
        ldr     r3, [sp, #0xC]
        ldr     r9, [sp, #0x14]
        ldr     lr, [sp, #0x1C]
        ldr     r12, [sp, #0x20]
        ldr     r8, [sp, #0x24]
        ldr     r2, [sp, #0x28]
        ldr     r0, [sp, #0x2C]
LCJG2:
        cmp     lr, #1
        str     r4, [r2]
        ble     LCJG6
        sub     r1, r2, #4
        add     r10, r1, #8
        str     r0, [sp, #0x2C]
        ldr     r0, [sp]
        ldr     r1, [sp, #0x10]
        mov     r11, #1
        str     r9, [sp, #0x14]
        str     r6, [sp, #0x18]
        str     r8, [sp, #0x24]
LCJG3:
        cmp     r0, #0
        mov     r5, r3
        mov     r4, r1
        mov     r9, r11
        ble     LCJG5
        mov     r7, r12
        ldr     r6, [sp, #0x3C]
        str     r11, [sp, #4]
        ldr     r11, [sp, #0x34]
        mov     r8, #0
        str     r10, [sp, #8]
        str     r3, [sp, #0xC]
        str     lr, [sp, #0x1C]
        str     r12, [sp, #0x20]
        str     r2, [sp, #0x28]
LCJG4:
        ldr     r2, [sp, #0x38]
        ldr     r0, [r7], #8
        ldr     r1, [r2, +r9, lsl #3]
        add     r10, r2, r9, lsl #3
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r1, [r6], #8
        ldr     r10, [r10, #4]
        mov     r5, r0
        mov     r0, r1
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r2, [sp, #4]
        mov     r4, r0
        add     r9, r2, r9
        cmp     r9, r11
        subge   r9, r9, r11
        ldr     r2, [sp]
        add     r8, r8, #2
        cmp     r8, r2
        blt     LCJG4
        ldr     r10, [sp, #8]
        ldr     r11, [sp, #4]
        ldr     r3, [sp, #0xC]
        ldr     r0, [sp]
        ldr     r1, [sp, #0x10]
        ldr     lr, [sp, #0x1C]
        ldr     r12, [sp, #0x20]
        ldr     r2, [sp, #0x28]
LCJG5:
        str     r5, [r10], #8
        str     r4, [r2, +r11, lsl #3]
        add     r11, r11, #1
        cmp     r11, lr
        blt     LCJG3
        ldr     r9, [sp, #0x14]
        ldr     r6, [sp, #0x18]
        ldr     r8, [sp, #0x24]
        ldr     r0, [sp, #0x2C]
LCJG6:
        ldr     r1, [sp, #0x30]
        subs    r8, r8, #1
        add     r0, r0, r1, lsl #2
        ldr     r1, [sp, #0x34]
        add     r2, r2, r1, lsl #2
        bne     LCJG0
LCJG7:
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
        .long   LCJG__2il0floatpacket.1


        .data
        .align  4


LCJG__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


