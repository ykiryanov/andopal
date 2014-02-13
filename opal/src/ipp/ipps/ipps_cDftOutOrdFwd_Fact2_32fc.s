        .text
        .align  4
        .globl  _ipps_cDftOutOrdFwd_Fact2_32fc


_ipps_cDftOutOrdFwd_Fact2_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x34
        ldr     r12, [sp, #0x58]
        ldr     r4, [sp, #0x5C]
        mov     lr, r3, lsl #2
        mul     lr, r2, lr
        add     r3, r4, r3, lsl #3
        cmp     r2, #1
        add     r0, r0, lr, lsl #2
        add     r4, r1, lr, lsl #2
        mov     r8, #0
        beq     LCKV4
        cmp     r12, #0
        ble     LCKV3
        mov     lr, r8
        mov     r1, r2, lsl #1
        str     r8, [sp, #0x28]
LCKV0:
        cmp     r1, #0
        add     r9, r0, r2, lsl #3
        add     r8, r4, r2, lsl #3
        ble     LCKV2
        ldr     r5, [sp, #0x28]
        add     r10, r4, #4
        add     r11, r8, #4
        add     r7, r0, #4
        add     r6, r9, #4
        str     r11, [sp, #8]
        str     r10, [sp]
        str     r9, [sp, #4]
        str     r1, [sp, #0x10]
        str     lr, [sp, #0x1C]
        str     r3, [sp, #0xC]
        str     r4, [sp, #0x14]
        str     r0, [sp, #0x18]
        str     r12, [sp, #0x20]
        str     r2, [sp, #0x24]
LCKV1:
        ldr     r1, [sp, #0xC]
        ldr     r0, [r1]
        str     r0, [sp, #0x2C]
        ldr     r0, [sp, #4]
        ldr     r0, [r0]
        str     r0, [sp, #0x30]
        ldr     r4, [r1, #4]
        ldr     r10, [r6], #8
        ldr     r0, [sp, #0x30]
        ldr     r1, [sp, #0x2C]
        bl      __mulsf3
        mov     r9, r0
        mov     r1, r4
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r9
        bl      __subsf3
        ldr     r1, [sp, #0x2C]
        mov     r9, r0
        mov     r0, r10
        bl      __mulsf3
        mov     r10, r0
        ldr     r0, [sp, #0x30]
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r2, [sp, #0x18]
        mov     r4, r0
        mov     r1, r9
        ldr     r11, [r2, +r5, lsl #2]
        ldr     r2, [sp, #4]
        add     r2, r2, #8
        str     r2, [sp, #4]
        mov     r0, r11
        bl      __addsf3
        ldr     r10, [r7], #8
        str     r0, [sp, #0x30]
        mov     r1, r4
        mov     r0, r10
        bl      __addsf3
        str     r0, [sp, #0x2C]
        mov     r1, r9
        mov     r0, r11
        bl      __subsf3
        mov     r9, r0
        mov     r0, r10
        mov     r1, r4
        bl      __subsf3
        ldr     r1, [sp, #0x14]
        ldr     r2, [sp, #0x30]
        str     r2, [r1, +r5, lsl #2]
        ldr     r1, [sp]
        ldr     r2, [sp, #0x2C]
        add     r5, r5, #2
        str     r2, [r1]
        str     r9, [r8], #8
        ldr     r1, [sp, #8]
        str     r0, [r1], #8
        ldr     r0, [sp]
        str     r1, [sp, #8]
        add     r0, r0, #8
        str     r0, [sp]
        ldr     r0, [sp, #0x10]
        cmp     r5, r0
        blt     LCKV1
        ldr     r1, [sp, #0x10]
        ldr     lr, [sp, #0x1C]
        ldr     r3, [sp, #0xC]
        ldr     r4, [sp, #0x14]
        ldr     r0, [sp, #0x18]
        ldr     r12, [sp, #0x20]
        ldr     r2, [sp, #0x24]
LCKV2:
        add     lr, lr, #1
        cmp     lr, r12
        add     r3, r3, #8
        add     r0, r0, r2, lsl #4
        add     r4, r4, r2, lsl #4
        blt     LCKV0
LCKV3:
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LCKV4:
        mov     r12, r12, lsl #2
        cmp     r12, #0
        ble     LCKV3
        add     lr, r0, #8
        add     r2, r0, #0xC
        add     r1, r0, #4
        add     r5, r4, #0xC
        add     r7, r4, #4
        add     r6, r4, #8
        str     r5, [sp, #0x20]
        str     r1, [sp, #8]
        str     r2, [sp, #0x1C]
        str     lr, [sp, #0x10]
        str     r12, [sp, #0x24]
        str     r3, [sp, #0xC]
        str     r0, [sp, #0x18]
LCKV5:
        ldr     r0, [sp, #0xC]
        ldr     r2, [sp, #0x10]
        add     r8, r8, #4
        ldr     r9, [r0]
        ldr     r0, [r2], #0x10
        str     r2, [sp, #0x10]
        ldr     r2, [sp, #0x1C]
        str     r0, [sp, #0x30]
        ldr     r0, [sp, #0x30]
        ldr     r10, [r2], #0x10
        str     r2, [sp, #0x1C]
        ldr     r2, [sp, #0xC]
        mov     r1, r9
        ldr     r11, [r2, #4]
        add     r2, r2, #8
        str     r2, [sp, #0xC]
        bl      __mulsf3
        mov     r5, r0
        mov     r0, r10
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r5
        bl      __subsf3
        mov     r5, r0
        mov     r0, r10
        mov     r1, r9
        bl      __mulsf3
        mov     r9, r0
        ldr     r0, [sp, #0x30]
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        ldr     r2, [sp, #0x18]
        mov     r9, r0
        mov     r1, r5
        ldr     r11, [r2], #0x10
        str     r2, [sp, #0x18]
        mov     r0, r11
        bl      __addsf3
        ldr     r2, [sp, #8]
        str     r0, [sp, #0x30]
        ldr     r10, [r2], #0x10
        str     r2, [sp, #8]
        mov     r1, r9
        mov     r0, r10
        bl      __addsf3
        str     r0, [sp, #0x2C]
        mov     r1, r5
        mov     r0, r11
        bl      __subsf3
        mov     r5, r0
        mov     r0, r10
        mov     r1, r9
        bl      __subsf3
        ldr     r1, [sp, #0x30]
        str     r1, [r4], #0x10
        ldr     r1, [sp, #0x2C]
        str     r1, [r7], #0x10
        str     r5, [r6], #0x10
        ldr     r1, [sp, #0x20]
        str     r0, [r1]
        ldr     r0, [sp, #0x24]
        cmp     r8, r0
        ldr     r0, [sp, #0x20]
        add     r0, r0, #0x10
        str     r0, [sp, #0x20]
        blt     LCKV5
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}


