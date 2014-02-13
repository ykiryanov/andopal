        .text
        .align  4
        .globl  _ipps_cDftOutOrdInv_Fact_32fc


_ipps_cDftOutOrdInv_Fact_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x5C
        ldr     r4, [sp, #0x80]
        mul     r6, r2, r3
        mul     r7, r2, r4
        ldr     r5, [sp, #0x84]
        ldr     lr, [sp, #0x88]
        mul     r12, r4, r6
        ldr     r4, [sp, #0x8C]
        add     r7, lr, r7, lsl #3
        add     r8, r2, #1
        add     lr, r0, r12, lsl #3
        add     r10, r1, r12, lsl #3
        cmp     r3, #0
        mov     r12, r8, asr #1
        ble     LCKJ7
        ldr     r0, [pc, #0x3E0]
        rsb     r6, r3, r6
        sub     r8, r2, #1
        ldr     r0, [r0]
        add     r9, r7, r2, lsl #3
        add     r11, r4, #8
        mov     r1, r3
        str     r1, [sp, #0x58]
        str     r11, [sp, #0x54]
        str     r9, [sp, #0x50]
        str     r8, [sp, #0x4C]
        str     r0, [sp, #0x48]
        str     r6, [sp, #0x44]
        str     r7, [sp, #0x40]
        str     r4, [sp, #0x3C]
        str     r5, [sp, #0x38]
        str     r3, [sp, #0x30]
        str     r2, [sp, #0x34]
LCKJ0:
        ldr     r1, [sp, #0x30]
        ldr     r0, [sp, #0x44]
        ldr     r11, [lr]
        ldr     r3, [lr, #4]
        add     r8, lr, r1, lsl #3
        add     r2, r10, r1, lsl #3
        cmp     r12, #1
        add     r7, lr, r0, lsl #3
        add     r1, r10, r0, lsl #3
        mov     r4, r11
        mov     r9, r3
        ble     LCKJ2
        ldr     r5, [sp, #0x3C]
        str     r11, [sp, #0x18]
        ldr     r11, [sp, #0x30]
        sub     r6, r5, #4
        sub     r0, r12, #1
        sub     r5, r5, #0xC
        str     r0, [sp, #0x10]
        str     r9, [sp, #0xC]
        str     r3, [sp, #0x14]
        str     r1, [sp, #0x1C]
        str     r2, [sp, #0x20]
        str     r12, [sp, #0x24]
        str     r10, [sp, #0x28]
        str     lr, [sp, #0x2C]
LCKJ1:
        ldr     r0, [r8]
        ldr     r1, [r7]
        bl      __addsf3
        ldr     r1, [r8, #4]
        ldr     r2, [r7, #4]
        mov     r10, r0
        mov     r0, r1
        mov     r1, r2
        bl      __addsf3
        mov     r9, r0
        mov     r0, r4
        mov     r1, r10
        bl      __addsf3
        mov     r4, r0
        ldr     r0, [sp, #0xC]
        mov     r1, r9
        bl      __addsf3
        str     r10, [r5, #0xC]
        str     r9, [r5, #0x10]!
        ldr     r1, [r8]
        ldr     r2, [r7]
        str     r0, [sp, #0xC]
        mov     r0, r1
        mov     r1, r2
        bl      __subsf3
        str     r0, [r6, #0xC]
        ldr     r0, [r8, #4]
        ldr     r1, [r7, #4]
        add     r8, r8, r11, lsl #3
        bl      __subsf3
        str     r0, [r6, #0x10]!
        ldr     r1, [sp, #0x10]
        sub     r7, r7, r11, lsl #3
        subs    r1, r1, #1
        str     r1, [sp, #0x10]
        bne     LCKJ1
        ldr     r9, [sp, #0xC]
        ldr     r3, [sp, #0x14]
        ldr     r11, [sp, #0x18]
        ldr     r1, [sp, #0x1C]
        ldr     r2, [sp, #0x20]
        ldr     r12, [sp, #0x24]
        ldr     r10, [sp, #0x28]
        ldr     lr, [sp, #0x2C]
LCKJ2:
        cmp     r12, #1
        str     r4, [r10]
        str     r9, [r10, #4]
        ble     LCKJ6
        ldr     r0, [sp, #0x40]
        mov     r9, #1
        str     r3, [sp, #0x14]
        add     r8, r0, #4
        str     r11, [sp, #0x18]
        str     r1, [sp, #0x1C]
        str     r2, [sp, #0x20]
        str     r12, [sp, #0x24]
        str     r10, [sp, #0x28]
        str     lr, [sp, #0x2C]
LCKJ3:
        ldr     r4, [sp, #0x48]
        ldr     r0, [sp, #0x4C]
        ldr     r2, [sp, #0x14]
        ldr     r11, [sp, #0x18]
        cmp     r0, #0
        str     r2, [sp, #4]
        mov     r10, r4
        mov     r0, r9
        ble     LCKJ5
        ldr     r5, [sp, #0x54]
        ldr     r6, [sp, #0x3C]
        str     r8, [sp, #0x10]
        ldr     r8, [sp, #0x34]
        str     r4, [sp, #8]
        mov     r7, #0
        str     r11, [sp]
        str     r9, [sp, #0xC]
        mov     r4, r0
LCKJ4:
        ldr     r2, [sp, #0x38]
        ldr     r0, [r6]
        ldr     r9, [r2, +r4, lsl #3]
        add     r11, r2, r4, lsl #3
        ldr     r2, [sp, #0xC]
        mov     r1, r9
        add     r4, r2, r4
        bl      __mulsf3
        ldr     r1, [sp]
        bl      __addsf3
        ldr     r2, [r6, #4]
        str     r0, [sp]
        mov     r1, r9
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [sp, #4]
        bl      __addsf3
        ldr     r1, [r5, #4]
        ldr     r11, [r11, #4]
        str     r0, [sp, #4]
        mov     r0, r1
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r2, [r5], #0x10
        mov     r10, r0
        mov     r1, r11
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [sp, #8]
        bl      __addsf3
        cmp     r4, r8
        str     r0, [sp, #8]
        subge   r4, r4, r8
        ldr     r2, [sp, #0x4C]
        add     r7, r7, #2
        add     r6, r6, #0x10
        cmp     r7, r2
        blt     LCKJ4
        ldr     r4, [sp, #8]
        ldr     r11, [sp]
        ldr     r8, [sp, #0x10]
        ldr     r9, [sp, #0xC]
LCKJ5:
        mov     r1, r10
        mov     r0, r11
        bl      __addsf3
        ldr     r7, [sp, #4]
        mov     r6, r0
        mov     r1, r4
        mov     r0, r7
        bl      __subsf3
        mov     r5, r0
        mov     r0, r11
        mov     r1, r10
        bl      __subsf3
        mov     r10, r0
        mov     r1, r4
        mov     r0, r7
        bl      __addsf3
        ldr     r1, [r8, #4]
        mov     r4, r0
        mov     r0, r6
        bl      __mulsf3
        ldr     r1, [r8, #8]
        str     r0, [sp, #8]
        mov     r0, r5
        rsb     r7, r9, #0
        bl      __mulsf3
        ldr     r1, [sp, #8]
        bl      __addsf3
        ldr     r1, [sp, #0x20]
        add     r9, r9, #1
        str     r0, [r1]
        ldr     r1, [r8, #4]
        mov     r0, r5
        ldr     r5, [sp, #0x50]
        bl      __mulsf3
        ldr     r1, [r8, #8]!
        str     r0, [sp, #8]
        mov     r0, r6
        bl      __mulsf3
        add     r11, r5, r7, lsl #3
        mov     r1, r0
        ldr     r0, [sp, #8]
        bl      __subsf3
        ldr     r2, [sp, #0x20]
        str     r0, [r2, #4]
        ldr     r3, [sp, #0x30]
        ldr     r1, [r5, +r7, lsl #3]
        mov     r0, r10
        add     r3, r2, r3, lsl #3
        str     r3, [sp, #0x20]
        bl      __mulsf3
        ldr     r1, [r11, #4]
        mov     r6, r0
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        ldr     r6, [sp, #0x1C]
        str     r0, [r6]
        ldr     r1, [r5, +r7, lsl #3]
        mov     r0, r4
        bl      __mulsf3
        ldr     r1, [r11, #4]
        mov     r4, r0
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r4
        bl      __subsf3
        str     r0, [r6, #4]
        ldr     r0, [sp, #0x24]
        cmp     r9, r0
        ldr     r0, [sp, #0x30]
        sub     r6, r6, r0, lsl #3
        str     r6, [sp, #0x1C]
        blt     LCKJ3
        ldr     r12, [sp, #0x24]
        ldr     r10, [sp, #0x28]
        ldr     lr, [sp, #0x2C]
LCKJ6:
        ldr     r0, [sp, #0x58]
        add     lr, lr, #8
        add     r10, r10, #8
        subs    r0, r0, #1
        str     r0, [sp, #0x58]
        bne     LCKJ0
LCKJ7:
        add     sp, sp, #0x5C
        ldmia   sp!, {r4 - r11, pc}
        .long   LCKJ__2il0floatpacket.1


        .data
        .align  4


LCKJ__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


