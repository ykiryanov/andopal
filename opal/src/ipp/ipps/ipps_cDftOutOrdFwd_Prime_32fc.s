        .text
        .align  4
        .globl  _ipps_cDftOutOrdFwd_Prime_32fc


_ipps_cDftOutOrdFwd_Prime_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x50
        ldr     r5, [sp, #0x74]
        ldr     lr, [sp, #0x78]
        mov     r4, r3
        add     r12, r2, #1
        cmp     r4, #0
        mov     r12, r12, asr #1
        ble     LCKO7
        ldr     r7, [pc, #0x310]
        rsb     r6, r4, #0
        mla     r6, r2, r4, r6
        ldr     r7, [r7]
        sub     r9, r2, #1
        add     r10, lr, #8
        mov     r8, r4
        str     r8, [sp, #0x4C]
        str     r10, [sp, #0x48]
        str     r9, [sp, #0x44]
        str     r7, [sp, #0x40]
        str     r6, [sp, #0x3C]
        str     lr, [sp, #0x38]
        str     r5, [sp, #0x34]
        str     r2, [sp, #0x30]
LCKO0:
        ldr     r5, [sp, #0x3C]
        ldr     lr, [r0]
        ldr     r2, [r0, #4]
        add     r9, r0, r5, lsl #3
        cmp     r12, #1
        add     r10, r0, r4, lsl #3
        add     r6, r1, r4, lsl #3
        add     r5, r1, r5, lsl #3
        mov     r7, lr
        mov     r11, r2
        ble     LCKO2
        ldr     r3, [sp, #0x38]
        str     r11, [sp, #4]
        str     r2, [sp, #0x10]
        sub     r8, r3, #4
        sub     r3, r3, #0xC
        str     r3, [sp, #0xC]
        ldr     r11, [sp, #0xC]
        sub     r3, r12, #1
        str     r3, [sp, #8]
        str     lr, [sp, #0x14]
        str     r5, [sp, #0x18]
        str     r6, [sp, #0x1C]
        str     r12, [sp, #0x20]
        str     r1, [sp, #0x28]
        str     r0, [sp, #0x2C]
LCKO1:
        ldr     r0, [r10]
        ldr     r1, [r9]
        bl      __addsf3
        ldr     r1, [r10, #4]
        ldr     r2, [r9, #4]
        mov     r6, r0
        mov     r0, r1
        mov     r1, r2
        bl      __addsf3
        mov     r5, r0
        mov     r0, r7
        mov     r1, r6
        bl      __addsf3
        mov     r7, r0
        ldr     r0, [sp, #4]
        mov     r1, r5
        bl      __addsf3
        str     r6, [r11, #0xC]
        str     r5, [r11, #0x10]!
        ldr     r1, [r10]
        ldr     r2, [r9]
        str     r0, [sp, #4]
        mov     r0, r1
        mov     r1, r2
        bl      __subsf3
        str     r0, [r8, #0xC]
        ldr     r0, [r10, #4]
        ldr     r1, [r9, #4]
        add     r10, r10, r4, lsl #3
        bl      __subsf3
        str     r0, [r8, #0x10]!
        ldr     r1, [sp, #8]
        sub     r9, r9, r4, lsl #3
        subs    r1, r1, #1
        str     r1, [sp, #8]
        bne     LCKO1
        ldr     r11, [sp, #4]
        ldr     r2, [sp, #0x10]
        ldr     lr, [sp, #0x14]
        ldr     r5, [sp, #0x18]
        ldr     r6, [sp, #0x1C]
        ldr     r12, [sp, #0x20]
        ldr     r1, [sp, #0x28]
        ldr     r0, [sp, #0x2C]
LCKO2:
        cmp     r12, #1
        str     r7, [r1]
        str     r11, [r1, #4]
        ble     LCKO6
        mov     r8, #1
        str     r2, [sp, #0x10]
        str     lr, [sp, #0x14]
        str     r12, [sp, #0x20]
        str     r1, [sp, #0x28]
        str     r0, [sp, #0x2C]
LCKO3:
        ldr     r9, [sp, #0x40]
        ldr     r0, [sp, #0x44]
        ldr     r11, [sp, #0x14]
        ldr     r10, [sp, #0x10]
        cmp     r0, #0
        mov     r7, r9
        mov     r0, r8
        ble     LCKO5
        ldr     r2, [sp, #0x48]
        ldr     r3, [sp, #0x38]
        str     r5, [sp, #0x18]
        ldr     r5, [sp, #0x30]
        mov     r1, #0
        str     r9, [sp, #8]
        str     r10, [sp, #4]
        str     r11, [sp]
        str     r4, [sp, #0x24]
        str     r8, [sp, #0xC]
        str     r6, [sp, #0x1C]
        mov     r4, r0
        mov     r11, r1
        mov     r10, r2
        mov     r9, r3
LCKO4:
        ldr     r12, [sp, #0x34]
        ldr     r0, [r9]
        ldr     r6, [r12, +r4, lsl #3]
        add     r8, r12, r4, lsl #3
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
        ldr     r8, [r8, #4]
        str     r0, [sp, #4]
        mov     r0, r1
        mov     r1, r8
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        ldr     r2, [r10], #0x10
        mov     r7, r0
        mov     r1, r8
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [sp, #8]
        bl      __addsf3
        cmp     r4, r5
        str     r0, [sp, #8]
        subge   r4, r4, r5
        ldr     r12, [sp, #0x44]
        add     r11, r11, #2
        add     r9, r9, #0x10
        cmp     r11, r12
        blt     LCKO4
        ldr     r9, [sp, #8]
        ldr     r10, [sp, #4]
        ldr     r11, [sp]
        ldr     r8, [sp, #0xC]
        ldr     r5, [sp, #0x18]
        ldr     r6, [sp, #0x1C]
        ldr     r4, [sp, #0x24]
LCKO5:
        mov     r0, r11
        mov     r1, r7
        bl      __subsf3
        str     r0, [r6]
        mov     r0, r10
        mov     r1, r9
        bl      __addsf3
        str     r0, [r6, #4]
        mov     r0, r11
        mov     r1, r7
        bl      __addsf3
        str     r0, [r5]
        mov     r0, r10
        mov     r1, r9
        bl      __subsf3
        str     r0, [r5, #4]
        ldr     r0, [sp, #0x20]
        add     r8, r8, #1
        add     r6, r6, r4, lsl #3
        cmp     r8, r0
        sub     r5, r5, r4, lsl #3
        blt     LCKO3
        ldr     r12, [sp, #0x20]
        ldr     r1, [sp, #0x28]
        ldr     r0, [sp, #0x2C]
LCKO6:
        ldr     r2, [sp, #0x4C]
        add     r0, r0, #8
        add     r1, r1, #8
        subs    r2, r2, #1
        str     r2, [sp, #0x4C]
        bne     LCKO0
LCKO7:
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
        .long   LCKO__2il0floatpacket.1


        .data
        .align  4


LCKO__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


