        .text
        .align  4
        .globl  _ipps_createTabDftInvRec_64f


_ipps_createTabDftInvRec_64f:
        stmdb   sp!, {r4 - r7, lr}
        add     r2, r0, #3
        mov     r4, r1
        mov     r2, r2, asr #1
        add     r2, r0, r2, lsr #30
        add     r0, r2, #3
        mov     r5, r0, asr #2
        mov     r0, r5, lsl #4
        bl      _ippsMalloc_8u
        cmp     r0, #0
        moveq   r0, #0
        ldmeqia sp!, {r4 - r7, pc}
        cmp     r5, #0
        ble     LCNI3
        cmp     r5, #5
        mov     lr, #0
        blt     LCNI1
        sub     r12, r5, #5
        sub     r3, r4, #4
        sub     r2, r0, #4
LCNI0:
        ldr     r6, [r3, #4]
        ldr     r7, [r3, #8]
        add     lr, lr, #4
        str     r6, [r2, #4]
        cmp     lr, r12
        str     r7, [r2, #8]
        ldr     r6, [r3, #0xC]
        ldr     r7, [r3, #0x10]
        str     r6, [r2, #0xC]
        str     r7, [r2, #0x10]
        ldr     r6, [r3, #0x14]
        ldr     r7, [r3, #0x18]
        str     r6, [r2, #0x14]
        str     r7, [r2, #0x18]
        ldr     r6, [r3, #0x1C]
        ldr     r7, [r3, #0x20]
        str     r6, [r2, #0x1C]
        str     r7, [r2, #0x20]
        ldr     r6, [r3, #0x24]
        ldr     r7, [r3, #0x28]
        str     r6, [r2, #0x24]
        str     r7, [r2, #0x28]
        ldr     r6, [r3, #0x2C]
        ldr     r7, [r3, #0x30]
        str     r6, [r2, #0x2C]
        str     r7, [r2, #0x30]
        ldr     r6, [r3, #0x34]
        ldr     r7, [r3, #0x38]
        str     r6, [r2, #0x34]
        str     r7, [r2, #0x38]
        ldr     r6, [r3, #0x3C]
        ldr     r7, [r3, #0x40]!
        str     r6, [r2, #0x3C]
        str     r7, [r2, #0x40]!
        ble     LCNI0
LCNI1:
        mov     r2, lr, lsl #4
        sub     r2, r2, #4
        add     r4, r2, r4
        add     r1, r2, r0
LCNI2:
        ldr     r3, [r4, #4]
        ldr     r2, [r4, #8]
        add     lr, lr, #1
        str     r3, [r1, #4]
        cmp     lr, r5
        str     r2, [r1, #8]
        ldr     r3, [r4, #0xC]
        ldr     r2, [r4, #0x10]!
        str     r3, [r1, #0xC]
        str     r2, [r1, #0x10]!
        blt     LCNI2
LCNI3:
        ldmia   sp!, {r4 - r7, pc}


