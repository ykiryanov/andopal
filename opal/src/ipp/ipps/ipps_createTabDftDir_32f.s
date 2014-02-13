        .text
        .align  4
        .globl  _ipps_createTabDftDir_32f


_ipps_createTabDftDir_32f:
        stmdb   sp!, {r4 - r11, lr}
        mov     r5, r0
        mov     r6, r1
        mov     r0, r5, lsl #3
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
        ble     LCLS3
        cmp     r5, #5
        mov     r8, #0
        movlt   r9, r8
        blt     LCLS1
        mov     r9, r8
        mov     r7, r0, lsl #1
        add     lr, r0, r0, lsl #1
        sub     r12, r5, #5
        sub     r3, r4, #4
        mov     r2, r0
LCLS0:
        ldr     r10, [r6, +r8, lsl #3]
        add     r9, r9, #4
        cmp     r9, r12
        str     r10, [r3, #4]
        add     r10, r6, r8, lsl #3
        ldr     r10, [r10, #4]
        add     r8, r8, r0, lsl #2
        add     r11, r6, r7, lsl #3
        str     r10, [r3, #8]
        ldr     r10, [r6, +r2, lsl #3]
        str     r10, [r3, #0xC]
        add     r10, r6, r2, lsl #3
        ldr     r10, [r10, #4]
        add     r2, r2, r0, lsl #2
        str     r10, [r3, #0x10]
        ldr     r10, [r6, +r7, lsl #3]
        add     r7, r7, r0, lsl #2
        str     r10, [r3, #0x14]
        ldr     r11, [r11, #4]
        add     r10, r6, lr, lsl #3
        str     r11, [r3, #0x18]
        ldr     r11, [r6, +lr, lsl #3]
        add     lr, lr, r0, lsl #2
        str     r11, [r3, #0x1C]
        ldr     r10, [r10, #4]
        str     r10, [r3, #0x20]!
        ble     LCLS0
LCLS1:
        mul     r2, r9, r0
        mov     r3, r9, lsl #3
        sub     r3, r3, #4
        add     r3, r3, r4
LCLS2:
        ldr     lr, [r6, +r2, lsl #3]
        add     r12, r6, r2, lsl #3
        add     r2, r2, r0
        str     lr, [r3, #4]
        ldr     r12, [r12, #4]
        add     r9, r9, #1
        cmp     r9, r5
        str     r12, [r3, #8]!
        blt     LCLS2
LCLS3:
        mov     r0, r4
        ldmia   sp!, {r4 - r11, pc}


