        .text
        .align  4
        .globl  _ipps_createTabDftFwdRec_64f


_ipps_createTabDftFwdRec_64f:
        stmdb   sp!, {r4 - r11, lr}
        add     r2, r0, #3
        mov     r8, r1
        mov     r2, r2, asr #1
        add     r2, r0, r2, lsr #30
        add     r0, r2, #3
        mov     r6, r0, asr #2
        mov     r0, r6, lsl #4
        bl      _ippsMalloc_8u
        mov     r5, r0
        cmp     r5, #0
        moveq   r0, #0
        ldmeqia sp!, {r4 - r11, pc}
        cmp     r6, #0
        ble     LCNJ3
        mov     r2, #0xFE, 12
        cmp     r6, #5
        orr     r4, r2, #3, 4
        mov     r7, #0
        blt     LCNJ1
        sub     r11, r6, #5
        sub     r10, r8, #4
        sub     r9, r5, #4
LCNJ0:
        ldr     r0, [r10, #4]
        ldr     r1, [r10, #8]
        mov     r2, #0
        mov     r3, r4
        bl      __muldf3
        str     r0, [r9, #4]
        str     r1, [r9, #8]
        ldr     r0, [r10, #0xC]
        ldr     r1, [r10, #0x10]
        mov     r2, #0
        mov     r3, r4
        bl      __muldf3
        mov     r2, #0
        mov     r3, r4
        bl      __adddf3
        str     r0, [r9, #0xC]
        str     r1, [r9, #0x10]
        ldr     r0, [r10, #0x14]
        ldr     r1, [r10, #0x18]
        mov     r2, #0
        mov     r3, r4
        bl      __muldf3
        str     r0, [r9, #0x14]
        str     r1, [r9, #0x18]
        ldr     r0, [r10, #0x1C]
        ldr     r1, [r10, #0x20]
        mov     r2, #0
        mov     r3, r4
        bl      __muldf3
        mov     r2, #0
        mov     r3, r4
        bl      __adddf3
        str     r0, [r9, #0x1C]
        str     r1, [r9, #0x20]
        ldr     r0, [r10, #0x24]
        ldr     r1, [r10, #0x28]
        mov     r2, #0
        mov     r3, r4
        bl      __muldf3
        str     r0, [r9, #0x24]
        str     r1, [r9, #0x28]
        ldr     r0, [r10, #0x2C]
        ldr     r1, [r10, #0x30]
        mov     r2, #0
        mov     r3, r4
        bl      __muldf3
        mov     r2, #0
        mov     r3, r4
        bl      __adddf3
        str     r0, [r9, #0x2C]
        str     r1, [r9, #0x30]
        ldr     r0, [r10, #0x34]
        ldr     r1, [r10, #0x38]
        mov     r2, #0
        mov     r3, r4
        bl      __muldf3
        str     r0, [r9, #0x34]
        str     r1, [r9, #0x38]
        ldr     r0, [r10, #0x3C]
        ldr     r1, [r10, #0x40]!
        mov     r2, #0
        mov     r3, r4
        bl      __muldf3
        mov     r2, #0
        mov     r3, r4
        bl      __adddf3
        add     r7, r7, #4
        str     r0, [r9, #0x3C]
        str     r1, [r9, #0x40]!
        cmp     r7, r11
        ble     LCNJ0
LCNJ1:
        mov     r2, r7, lsl #4
        sub     r2, r2, #4
        add     r9, r2, r8
        add     r8, r2, r5
LCNJ2:
        ldr     r0, [r9, #4]
        ldr     r1, [r9, #8]
        mov     r2, #0
        mov     r3, r4
        bl      __muldf3
        str     r0, [r8, #4]
        str     r1, [r8, #8]
        ldr     r0, [r9, #0xC]
        ldr     r1, [r9, #0x10]!
        mov     r2, #0
        mov     r3, r4
        bl      __muldf3
        mov     r2, #0
        mov     r3, r4
        bl      __adddf3
        add     r7, r7, #1
        str     r0, [r8, #0xC]
        str     r1, [r8, #0x10]!
        cmp     r7, r6
        blt     LCNJ2
LCNJ3:
        mov     r0, r5
        ldmia   sp!, {r4 - r11, pc}


