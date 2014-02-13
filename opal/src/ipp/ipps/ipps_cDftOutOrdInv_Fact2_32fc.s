        .text
        .align  4
        .globl  _ipps_cDftOutOrdInv_Fact2_32fc


_ipps_cDftOutOrdInv_Fact2_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x34
        ldr     r12, [sp, #0x58]
        ldr     r4, [sp, #0x5C]
        mov     lr, r3, lsl #2
        mul     lr, r2, lr
        add     r5, r4, r3, lsl #3
        cmp     r2, #1
        add     r0, r0, lr, lsl #2
        add     r4, r1, lr, lsl #2
        mov     r6, #0
        beq     LCKN4
        cmp     r12, #0
        ble     LCKN3
        mov     r3, r6
        mov     r1, r2, lsl #1
        str     r6, [sp, #0x20]
LCKN0:
        cmp     r1, #0
        add     lr, r0, r2, lsl #3
        add     r10, r4, r2, lsl #3
        ble     LCKN2
        ldr     r6, [sp, #0x20]
        add     r11, r10, #4
        add     r9, r0, #4
        add     r8, r4, #4
        add     r7, lr, #4
        str     r11, [sp, #4]
        str     lr, [sp]
        str     r1, [sp, #0x10]
        str     r3, [sp, #0x14]
        str     r4, [sp, #0xC]
        str     r0, [sp, #8]
        str     r12, [sp, #0x18]
        str     r2, [sp, #0x1C]
LCKN1:
        ldr     r0, [sp]
        ldr     r4, [r0]
        ldr     r0, [sp, #8]
        ldr     r0, [r0, +r6, lsl #2]
        mov     r1, r4
        str     r0, [sp, #0x24]
        ldr     r0, [sp]
        add     r0, r0, #8
        str     r0, [sp]
        ldr     r0, [sp, #0x24]
        bl      __addsf3
        ldr     r2, [r7], #8
        str     r2, [sp, #0x28]
        ldr     r11, [r9], #8
        ldr     r1, [sp, #0x28]
        str     r0, [sp, #0x2C]
        mov     r0, r11
        bl      __addsf3
        str     r0, [sp, #0x30]
        ldr     r0, [sp, #0x24]
        mov     r1, r4
        bl      __subsf3
        ldr     r1, [sp, #0x28]
        mov     r4, r0
        mov     r0, r11
        bl      __subsf3
        ldr     r1, [sp, #0xC]
        ldr     r2, [sp, #0x2C]
        mov     r11, r0
        mov     r0, r4
        str     r2, [r1, +r6, lsl #2]
        ldr     r1, [sp, #0x30]
        add     r6, r6, #2
        str     r1, [r8], #8
        ldr     r1, [r5]
        bl      __mulsf3
        ldr     r1, [r5, #4]
        str     r0, [sp, #0x30]
        mov     r0, r11
        bl      __mulsf3
        ldr     r1, [sp, #0x30]
        bl      __addsf3
        str     r0, [r10], #8
        ldr     r1, [r5]
        mov     r0, r11
        bl      __mulsf3
        ldr     r1, [r5, #4]
        mov     r11, r0
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        ldr     r1, [sp, #4]
        str     r0, [r1], #8
        ldr     r0, [sp, #0x10]
        str     r1, [sp, #4]
        cmp     r6, r0
        blt     LCKN1
        ldr     r1, [sp, #0x10]
        ldr     r3, [sp, #0x14]
        ldr     r4, [sp, #0xC]
        ldr     r0, [sp, #8]
        ldr     r12, [sp, #0x18]
        ldr     r2, [sp, #0x1C]
LCKN2:
        add     r3, r3, #1
        cmp     r3, r12
        add     r5, r5, #8
        add     r0, r0, r2, lsl #4
        add     r4, r4, r2, lsl #4
        blt     LCKN0
LCKN3:
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LCKN4:
        mov     r12, r12, lsl #2
        cmp     r12, #0
        ble     LCKN3
        add     lr, r0, #8
        add     r3, r0, #4
        add     r2, r4, #4
        add     r1, r4, #8
        add     r8, r4, #0xC
        add     r7, r0, #0xC
        str     r8, [sp, #0x18]
        str     r1, [sp, #0x10]
        str     r2, [sp, #0x14]
        str     r3, [sp, #4]
        str     lr, [sp]
        str     r12, [sp, #0x1C]
        str     r0, [sp, #8]
LCKN5:
        ldr     r0, [sp]
        ldr     r2, [sp, #8]
        add     r6, r6, #4
        ldr     r11, [r0], #0x10
        str     r0, [sp]
        ldr     r8, [r2], #0x10
        str     r2, [sp, #8]
        mov     r0, r8
        mov     r1, r11
        bl      __addsf3
        ldr     r2, [sp, #4]
        str     r0, [sp, #0x30]
        ldr     r10, [r2], #0x10
        ldr     r9, [r7], #0x10
        str     r2, [sp, #4]
        mov     r0, r10
        mov     r1, r9
        bl      __addsf3
        str     r0, [sp, #0x2C]
        mov     r0, r8
        mov     r1, r11
        bl      __subsf3
        mov     r8, r0
        mov     r0, r10
        mov     r1, r9
        bl      __subsf3
        ldr     r1, [sp, #0x30]
        mov     r9, r0
        mov     r0, r8
        str     r1, [r4], #0x10
        ldr     r1, [sp, #0x2C]
        ldr     r2, [sp, #0x14]
        str     r1, [r2], #0x10
        str     r2, [sp, #0x14]
        ldr     r1, [r5]
        bl      __mulsf3
        ldr     r1, [r5, #4]
        mov     r10, r0
        mov     r0, r9
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r2, [sp, #0x10]
        str     r0, [r2], #0x10
        ldr     r1, [r5]
        str     r2, [sp, #0x10]
        mov     r0, r9
        bl      __mulsf3
        ldr     r1, [r5, #4]
        mov     r9, r0
        mov     r0, r8
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r9
        bl      __subsf3
        ldr     r1, [sp, #0x18]
        add     r5, r5, #8
        str     r0, [r1]
        ldr     r0, [sp, #0x1C]
        cmp     r6, r0
        ldr     r0, [sp, #0x18]
        add     r0, r0, #0x10
        str     r0, [sp, #0x18]
        blt     LCKN5
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}


