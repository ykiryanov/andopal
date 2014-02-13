        .text
        .align  4
        .globl  _ipps_initTabTwdCcsRec_64f


_ipps_initTabTwdCcsRec_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x2C
        mov     r12, #1
        mov     lr, r12, lsl r0
        sub     r0, r2, r0
        mov     r2, lr, asr #1
        cmp     lr, #4
        add     lr, lr, r2, lsr #30
        mov     r6, r12, lsl r0
        mov     r7, lr, asr #2
        movgt   r12, r7
        add     r12, r3, r12, lsl #4
        and     r0, r12, #0x1F
        rsb     r0, r0, #0
        and     r0, r0, #0x1F
        cmp     r7, #0
        add     r0, r12, r0
        ble     LCDU3
        cmp     r7, #4
        mov     r4, #0
        mullt   r8, r6, r7
        movlt   r5, r4
        blt     LCDU1
        mul     r8, r6, r7
        mov     lr, r6, lsl #1
        add     r2, r6, r6, lsl #1
        mov     r5, r4
        sub     r9, r8, r6, lsl #1
        rsb     r10, r6, r8
        str     r6, [sp]
        str     r9, [sp, #0x10]
        ldr     r9, [sp]
        sub     r11, r7, #4
        sub     r12, r3, #4
        str     r8, [sp, #0x1C]
        str     r10, [sp, #0x18]
        str     r11, [sp, #0x14]
        str     r0, [sp, #0xC]
        str     r7, [sp, #8]
        str     r6, [sp, #0x20]
        str     r3, [sp, #4]
LCDU0:
        ldr     r0, [sp, #0x20]
        rsb     r3, r5, #0
        add     r7, r1, r4, lsl #3
        mul     r10, r0, r3
        add     r0, r1, lr, lsl #3
        str     r0, [sp, #0x24]
        ldr     r0, [sp, #0x1C]
        add     r8, r1, r9, lsl #3
        add     r5, r5, #3
        add     r3, r0, r10
        ldr     r6, [r1, +r3, lsl #3]
        ldr     r0, [sp, #0x18]
        add     r3, r1, r3, lsl #3
        ldr     r3, [r3, #4]
        str     r6, [r12, #4]
        ldr     r11, [sp, #0x10]
        str     r3, [r12, #8]
        ldr     r7, [r7, #4]
        ldr     r3, [r1, +r4, lsl #3]
        add     r0, r10, r0
        add     r10, r10, r11
        add     r6, r1, r0, lsl #3
        eor     r7, r7, #2, 2
        add     r11, r1, r10, lsl #3
        str     r11, [sp, #0x28]
        str     r3, [r12, #0xC]
        str     r7, [r12, #0x10]
        ldr     r0, [r1, +r0, lsl #3]
        ldr     r6, [r6, #4]
        add     r4, r4, r2
        str     r0, [r12, #0x14]
        str     r6, [r12, #0x18]
        ldr     r8, [r8, #4]
        ldr     r0, [r1, +r9, lsl #3]
        add     r9, r9, r2
        eor     r8, r8, #2, 2
        str     r8, [r12, #0x20]
        str     r0, [r12, #0x1C]
        ldr     r0, [sp, #0x28]
        ldr     r10, [r1, +r10, lsl #3]
        ldr     r3, [sp, #0x14]
        ldr     r0, [r0, #4]
        str     r10, [r12, #0x24]
        cmp     r5, r3
        str     r0, [r12, #0x28]
        ldr     r0, [sp, #0x24]
        ldr     r3, [r0, #4]
        ldr     r0, [r1, +lr, lsl #3]
        add     lr, lr, r2
        eor     r3, r3, #2, 2
        str     r3, [r12, #0x30]
        str     r0, [r12, #0x2C]
        add     r12, r12, #0x30
        ble     LCDU0
        ldr     r8, [sp, #0x1C]
        ldr     r0, [sp, #0xC]
        ldr     r7, [sp, #8]
        ldr     r6, [sp, #0x20]
        ldr     r3, [sp, #4]
LCDU1:
        mul     r2, r5, r6
        mov     r12, r5, lsl #4
        sub     r12, r12, #4
        add     r3, r12, r3
LCDU2:
        rsb     r12, r5, #0
        mla     lr, r6, r12, r8
        add     r5, r5, #1
        cmp     r5, r7
        add     r12, r1, r2, lsl #3
        add     r4, r1, lr, lsl #3
        ldr     lr, [r1, +lr, lsl #3]
        ldr     r4, [r4, #4]
        str     lr, [r3, #4]
        str     r4, [r3, #8]
        ldr     lr, [r12, #4]
        ldr     r12, [r1, +r2, lsl #3]
        add     r2, r2, r6
        eor     lr, lr, #2, 2
        str     lr, [r3, #0x10]
        str     r12, [r3, #0xC]
        add     r3, r3, #0x10
        blt     LCDU2
LCDU3:
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}


