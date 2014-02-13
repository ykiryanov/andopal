        .text
        .align  4
        .globl  _ipps_cDftFwd_Prime_32fc


_ipps_cDftFwd_Prime_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x54
        ldr     r12, [sp, #0x78]
        ldr     r7, [sp, #0x7C]
        mul     r5, r1, r12
        ldr     r6, [sp, #0x80]
        add     lr, r3, #1
        cmp     r12, #0
        mov     r4, lr, asr #1
        ble     LCLG7
        ldr     r8, [pc, #0x314]
        rsb     lr, r5, #0
        mla     lr, r3, r5, lr
        ldr     r8, [r8]
        sub     r10, r3, #1
        add     r9, r6, #8
        str     r9, [sp, #0x50]
        str     r10, [sp, #0x4C]
        str     r8, [sp, #0x48]
        str     r5, [sp, #0x24]
        str     r6, [sp, #0x44]
        str     r7, [sp, #0x40]
        str     r3, [sp, #0x3C]
        str     r1, [sp, #0x38]
LCLG0:
        ldr     r5, [sp, #0x24]
        ldr     r3, [r0]
        ldr     r1, [r0, #4]
        add     r10, r0, r5, lsl #3
        cmp     r4, #1
        add     r8, r0, lr, lsl #3
        mov     r5, r3
        mov     r9, r1
        ble     LCLG2
        ldr     r6, [sp, #0x44]
        sub     r11, r4, #1
        str     r11, [sp, #0x14]
        ldr     r11, [sp, #0x24]
        sub     r7, r6, #4
        sub     r6, r6, #0xC
        str     r9, [sp, #0x10]
        str     r1, [sp, #0x18]
        str     r3, [sp, #0x1C]
        str     lr, [sp, #0x20]
        str     r4, [sp, #0x28]
        str     r12, [sp, #0x2C]
        str     r2, [sp, #0x30]
        str     r0, [sp, #0x34]
LCLG1:
        ldr     r0, [r10]
        ldr     r1, [r8]
        bl      __addsf3
        ldr     r1, [r10, #4]
        ldr     r2, [r8, #4]
        mov     r9, r0
        mov     r0, r1
        mov     r1, r2
        bl      __addsf3
        mov     r4, r0
        mov     r0, r5
        mov     r1, r9
        bl      __addsf3
        mov     r5, r0
        ldr     r0, [sp, #0x10]
        mov     r1, r4
        bl      __addsf3
        str     r9, [r6, #0xC]
        str     r4, [r6, #0x10]!
        ldr     r1, [r10]
        ldr     r2, [r8]
        str     r0, [sp, #0x10]
        mov     r0, r1
        mov     r1, r2
        bl      __subsf3
        str     r0, [r7, #0xC]
        ldr     r0, [r10, #4]
        ldr     r1, [r8, #4]
        add     r10, r10, r11, lsl #3
        bl      __subsf3
        str     r0, [r7, #0x10]!
        ldr     r1, [sp, #0x14]
        sub     r8, r8, r11, lsl #3
        subs    r1, r1, #1
        str     r1, [sp, #0x14]
        bne     LCLG1
        ldr     r9, [sp, #0x10]
        ldr     r1, [sp, #0x18]
        ldr     r3, [sp, #0x1C]
        ldr     lr, [sp, #0x20]
        ldr     r4, [sp, #0x28]
        ldr     r12, [sp, #0x2C]
        ldr     r2, [sp, #0x30]
        ldr     r0, [sp, #0x34]
LCLG2:
        cmp     r4, #1
        str     r5, [r2]
        str     r9, [r2, #4]
        ldrle   r1, [sp, #0x3C]
        addle   r5, r2, r1, lsl #3
        ble     LCLG6
        ldr     r5, [sp, #0x3C]
        mov     r7, #1
        add     r6, r2, #4
        add     r5, r2, r5, lsl #3
        str     r1, [sp, #0x18]
        str     r3, [sp, #0x1C]
        str     lr, [sp, #0x20]
        str     r12, [sp, #0x2C]
        str     r2, [sp, #0x30]
        str     r0, [sp, #0x34]
LCLG3:
        ldr     r9, [sp, #0x48]
        ldr     r0, [sp, #0x4C]
        ldr     r11, [sp, #0x1C]
        ldr     r10, [sp, #0x18]
        cmp     r0, #0
        mov     r8, r9
        mov     r0, r7
        ble     LCLG5
        ldr     r2, [sp, #0x50]
        ldr     r3, [sp, #0x44]
        str     r5, [sp, #0x10]
        ldr     r5, [sp, #0x3C]
        mov     r1, #0
        str     r9, [sp, #8]
        str     r10, [sp, #4]
        str     r11, [sp]
        str     r4, [sp, #0x28]
        str     r6, [sp, #0x14]
        str     r7, [sp, #0xC]
        mov     r4, r0
        mov     r11, r1
        mov     r10, r2
        mov     r9, r3
LCLG4:
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
        ldr     r12, [sp, #0x4C]
        add     r11, r11, #2
        add     r9, r9, #0x10
        cmp     r11, r12
        blt     LCLG4
        ldr     r5, [sp, #0x10]
        ldr     r9, [sp, #8]
        ldr     r10, [sp, #4]
        ldr     r11, [sp]
        ldr     r6, [sp, #0x14]
        ldr     r7, [sp, #0xC]
        ldr     r4, [sp, #0x28]
LCLG5:
        mov     r0, r11
        mov     r1, r8
        bl      __subsf3
        ldr     r2, [sp, #0x30]
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
        blt     LCLG3
        ldr     lr, [sp, #0x20]
        ldr     r12, [sp, #0x2C]
        ldr     r0, [sp, #0x34]
LCLG6:
        ldr     r1, [sp, #0x38]
        subs    r12, r12, #1
        mov     r2, r5
        add     r0, r0, r1, lsl #3
        bne     LCLG0
LCLG7:
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}
        .long   LCLG__2il0floatpacket.1


        .data
        .align  4


LCLG__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


