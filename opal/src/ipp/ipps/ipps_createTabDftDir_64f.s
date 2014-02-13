        .text
        .align  4
        .globl  _ipps_createTabDftDir_64f


_ipps_createTabDftDir_64f:
        stmdb   sp!, {r4 - r11, lr}
        mov     r5, r0
        mov     r6, r1
        mov     r0, r5, lsl #4
        mov     r7, r2
        bl      _ippsMalloc_8u
        mov     r4, r0
        cmp     r4, #0
        moveq   r0, #0
        ldmeqia sp!, {r4 - r11, pc}
        mov     r0, r7
        mov     r1, r5
        bl      __intel_idiv
        cmp     r5, #0
        ble     LCQD3
        cmp     r5, #5
        mov     r8, #0
        movlt   r9, r8
        blt     LCQD1
        mov     r9, r8
        mov     r7, r0, lsl #1
        add     lr, r0, r0, lsl #1
        sub     r12, r5, #5
        sub     r3, r4, #4
        mov     r2, r0
LCQD0:
        add     r10, r6, r8, lsl #4
        ldr     r1, [r10, #4]
        ldr     r11, [r6, +r8, lsl #4]
        add     r9, r9, #4
        str     r1, [r3, #8]
        cmp     r9, r12
        str     r11, [r3, #4]
        ldr     r11, [r10, #8]
        ldr     r10, [r10, #0xC]
        add     r8, r8, r0, lsl #2
        str     r11, [r3, #0xC]
        str     r10, [r3, #0x10]
        add     r10, r6, r2, lsl #4
        ldr     r1, [r10, #4]
        ldr     r11, [r6, +r2, lsl #4]
        add     r2, r2, r0, lsl #2
        str     r1, [r3, #0x18]
        str     r11, [r3, #0x14]
        ldr     r1, [r10, #8]
        ldr     r11, [r10, #0xC]
        add     r10, r6, r7, lsl #4
        str     r1, [r3, #0x1C]
        str     r11, [r3, #0x20]
        ldr     r1, [r10, #4]
        ldr     r11, [r6, +r7, lsl #4]
        add     r7, r7, r0, lsl #2
        str     r1, [r3, #0x28]
        str     r11, [r3, #0x24]
        ldr     r11, [r10, #0xC]
        ldr     r1, [r10, #8]
        add     r10, r6, lr, lsl #4
        str     r11, [r3, #0x30]
        str     r1, [r3, #0x2C]
        ldr     r11, [r6, +lr, lsl #4]
        ldr     r1, [r10, #4]
        add     lr, lr, r0, lsl #2
        str     r11, [r3, #0x34]
        str     r1, [r3, #0x38]
        ldr     r11, [r10, #8]
        ldr     r10, [r10, #0xC]
        str     r11, [r3, #0x3C]
        str     r10, [r3, #0x40]!
        ble     LCQD0
LCQD1:
        mul     r2, r9, r0
        mov     r3, r9, lsl #4
        sub     r3, r3, #4
        add     r3, r3, r4
LCQD2:
        add     r12, r6, r2, lsl #4
        ldr     lr, [r12, #4]
        ldr     r7, [r6, +r2, lsl #4]
        add     r2, r2, r0
        str     lr, [r3, #8]
        add     r9, r9, #1
        str     r7, [r3, #4]
        ldr     lr, [r12, #8]
        ldr     r12, [r12, #0xC]
        cmp     r9, r5
        str     lr, [r3, #0xC]
        str     r12, [r3, #0x10]!
        blt     LCQD2
LCQD3:
        mov     r0, r4
        ldmia   sp!, {r4 - r11, pc}


