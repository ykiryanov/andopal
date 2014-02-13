        .text
        .align  4
        .globl  _ipps_initTabTwdRealRec_64f


_ipps_initTabTwdRealRec_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x2C
        mov     r12, #1
        mov     lr, r12, lsl r0
        sub     r0, r2, r0
        mov     r2, lr, asr #1
        cmp     lr, #4
        add     lr, lr, r2, lsr #30
        mov     r4, r1
        mov     r6, r12, lsl r0
        mov     r5, lr, asr #2
        movgt   r12, r5
        add     r12, r3, r12, lsl #4
        and     r0, r12, #0x1F
        rsb     r0, r0, #0
        and     r0, r0, #0x1F
        add     r0, r12, r0
        cmp     r5, #0
        str     r0, [sp, #8]
        ble     LCDT3
        cmp     r5, #4
        mov     r0, #0
        mullt   r7, r6, r5
        movlt   r11, r0
        blt     LCDT1
        mul     r7, r6, r5
        add     r1, r6, r6, lsl #1
        sub     r2, r5, #4
        mov     r10, r6, lsl #1
        rsb     r12, r6, r7
        sub     lr, r7, r6, lsl #1
        mov     r8, r6
        str     r6, [sp, #0x20]
        mov     r11, r0
        sub     r9, r3, #4
        str     r7, [sp, #0x1C]
        str     r1, [sp, #0x18]
        str     lr, [sp, #0xC]
        str     r12, [sp, #0x14]
        str     r2, [sp, #0x10]
        str     r5, [sp, #4]
        str     r3, [sp]
        mov     r6, r0
LCDT0:
        ldr     r2, [sp, #0x20]
        rsb     r3, r11, #0
        add     r11, r11, #3
        mul     r7, r2, r3
        add     r2, r4, r8, lsl #3
        str     r2, [sp, #0x24]
        mov     r2, #0xFE, 12
        orr     r5, r2, #3, 4
        ldr     r2, [sp, #0x1C]
        mov     r3, r5
        add     r12, r2, r7
        ldr     r0, [r4, +r12, lsl #3]
        mov     r2, #0
        add     r12, r4, r12, lsl #3
        ldr     r1, [r12, #4]
        ldr     r12, [sp, #0x14]
        add     r12, r7, r12
        str     r12, [sp, #0x28]
        bl      __muldf3
        str     r0, [r9, #4]
        str     r1, [r9, #8]
        ldr     r0, [r4, +r6, lsl #3]
        add     r2, r4, r6, lsl #3
        ldr     r1, [r2, #4]
        mov     r2, #0
        mov     r3, r5
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, #0
        mov     r1, r5
        bl      __subdf3
        str     r0, [r9, #0xC]
        str     r1, [r9, #0x10]
        ldr     r12, [sp, #0x28]
        mov     r3, r5
        add     r2, r4, r12, lsl #3
        ldr     r1, [r2, #4]
        ldr     r0, [r4, +r12, lsl #3]
        mov     r2, #0
        bl      __muldf3
        str     r1, [r9, #0x18]
        str     r0, [r9, #0x14]
        ldr     r2, [sp, #0x24]
        ldr     r0, [r4, +r8, lsl #3]
        mov     r3, r5
        ldr     r1, [r2, #4]
        mov     r2, #0
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, #0
        mov     r1, r5
        bl      __subdf3
        str     r1, [r9, #0x20]
        str     r0, [r9, #0x1C]
        ldr     r2, [sp, #0xC]
        mov     r3, r5
        add     r7, r7, r2
        ldr     r0, [r4, +r7, lsl #3]
        add     r2, r4, r7, lsl #3
        ldr     r1, [r2, #4]
        mov     r2, #0
        bl      __muldf3
        str     r1, [r9, #0x28]
        str     r0, [r9, #0x24]
        add     r2, r4, r10, lsl #3
        ldr     r1, [r2, #4]
        ldr     r0, [r4, +r10, lsl #3]
        mov     r2, #0
        mov     r3, r5
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, #0
        mov     r1, r5
        bl      __subdf3
        str     r0, [r9, #0x2C]
        str     r1, [r9, #0x30]!
        ldr     r2, [sp, #0x10]
        cmp     r11, r2
        ldr     r2, [sp, #0x18]
        add     r10, r10, r2
        add     r8, r8, r2
        add     r6, r6, r2
        ble     LCDT0
        ldr     r7, [sp, #0x1C]
        ldr     r5, [sp, #4]
        ldr     r6, [sp, #0x20]
        ldr     r3, [sp]
LCDT1:
        mul     r8, r11, r6
        mov     r0, r11, lsl #4
        sub     r2, r0, #4
        mov     r0, #0xFE, 12
        add     r10, r2, r3
        orr     r9, r0, #3, 4
LCDT2:
        rsb     r0, r11, #0
        mla     r0, r6, r0, r7
        add     r11, r11, #1
        mov     r2, #0
        mov     r3, r9
        add     r12, r4, r0, lsl #3
        ldr     r1, [r12, #4]
        ldr     r0, [r4, +r0, lsl #3]
        bl      __muldf3
        str     r0, [r10, #4]
        str     r1, [r10, #8]
        add     r0, r4, r8, lsl #3
        ldr     r1, [r0, #4]
        ldr     r0, [r4, +r8, lsl #3]
        mov     r2, #0
        mov     r3, r9
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r1, r9
        mov     r0, #0
        bl      __subdf3
        str     r0, [r10, #0xC]
        str     r1, [r10, #0x10]!
        cmp     r11, r5
        add     r8, r8, r6
        blt     LCDT2
LCDT3:
        ldr     r0, [sp, #8]
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}


