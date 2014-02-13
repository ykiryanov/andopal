        .text
        .align  4
        .globl  _ipps_cDftInv_Fact2_32fc


_ipps_cDftInv_Fact2_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x34
        ldr     r12, [sp, #0x58]
        cmp     r3, #0
        mov     r6, r0
        mov     r5, r1
        mov     r4, r2
        ble     LCLF3
        add     r12, r12, #8
        mov     lr, r4, lsl #1
        str     lr, [sp, #0x10]
        str     r12, [sp, #0xC]
        str     r3, [sp, #8]
LCLF0:
        ldr     r3, [r6]
        add     r8, r6, r4, lsl #3
        add     r7, r5, r4, lsl #3
        str     r3, [sp, #0x28]
        ldr     r11, [r6, +r4, lsl #3]
        ldr     r3, [sp, #0xC]
        ldr     r0, [sp, #0x28]
        mov     r1, r11
        str     r3, [sp]
        bl      __addsf3
        str     r0, [sp, #0x24]
        ldr     r9, [r6, #4]
        ldr     r10, [r8, #4]
        mov     r0, r9
        mov     r1, r10
        bl      __addsf3
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #0x28]
        mov     r1, r11
        bl      __subsf3
        mov     r11, r0
        mov     r0, r9
        mov     r1, r10
        bl      __subsf3
        ldr     r3, [sp, #0x24]
        str     r3, [r5]
        ldr     r3, [sp, #0x20]
        str     r3, [r5, #4]
        str     r11, [r5, +r4, lsl #3]
        str     r0, [r7, #4]
        ldr     r3, [sp, #0x10]
        cmp     r3, #2
        ble     LCLF2
        add     r3, r8, #0xC
        add     r12, r8, #8
        add     r8, r7, #8
        add     r7, r7, #0xC
        str     r7, [sp, #0x1C]
        ldr     r7, [sp]
        add     lr, r5, #0xC
        mov     r10, #2
        add     r9, r6, #0xC
        str     lr, [sp, #0x28]
        str     r12, [sp, #0x24]
        str     r3, [sp, #0x20]
        str     r4, [sp, #4]
        str     r5, [sp, #0x14]
        str     r6, [sp, #0x18]
LCLF1:
        ldr     r1, [sp, #0x24]
        ldr     r2, [sp, #0x20]
        ldr     r1, [r1]
        ldr     r6, [r2], #8
        str     r1, [sp, #0x2C]
        ldr     r1, [r7]
        ldr     r0, [sp, #0x2C]
        str     r1, [sp, #0x30]
        ldr     r4, [r7, #4]
        ldr     r1, [sp, #0x30]
        str     r2, [sp, #0x20]
        add     r7, r7, #8
        bl      __mulsf3
        mov     r5, r0
        mov     r1, r4
        mov     r0, r6
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r1, [sp, #0x30]
        mov     r5, r0
        mov     r0, r6
        bl      __mulsf3
        mov     r6, r0
        ldr     r0, [sp, #0x2C]
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r6
        bl      __subsf3
        ldr     r2, [sp, #0x18]
        mov     r4, r0
        mov     r1, r5
        ldr     r11, [r2, +r10, lsl #2]
        ldr     r2, [sp, #0x24]
        add     r2, r2, #8
        str     r2, [sp, #0x24]
        mov     r0, r11
        bl      __addsf3
        ldr     r6, [r9], #8
        str     r0, [sp, #0x30]
        mov     r1, r4
        mov     r0, r6
        bl      __addsf3
        str     r0, [sp, #0x2C]
        mov     r1, r5
        mov     r0, r11
        bl      __subsf3
        mov     r5, r0
        mov     r0, r6
        mov     r1, r4
        bl      __subsf3
        ldr     r1, [sp, #0x30]
        ldr     r2, [sp, #0x14]
        str     r1, [r2, +r10, lsl #2]
        ldr     r1, [sp, #0x2C]
        ldr     r2, [sp, #0x28]
        add     r10, r10, #2
        str     r1, [r2]
        str     r5, [r8], #8
        ldr     r1, [sp, #0x28]
        add     r1, r1, #8
        str     r1, [sp, #0x28]
        ldr     r1, [sp, #0x1C]
        str     r0, [r1], #8
        ldr     r0, [sp, #0x10]
        str     r1, [sp, #0x1C]
        cmp     r10, r0
        blt     LCLF1
        ldr     r4, [sp, #4]
        ldr     r5, [sp, #0x14]
        ldr     r6, [sp, #0x18]
LCLF2:
        ldr     r3, [sp, #8]
        add     r6, r6, r4, lsl #4
        add     r5, r5, r4, lsl #4
        subs    r3, r3, #1
        str     r3, [sp, #8]
        bne     LCLF0
LCLF3:
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}

