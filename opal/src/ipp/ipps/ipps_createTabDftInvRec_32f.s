        .text
        .align  4
        .globl  _ipps_createTabDftInvRec_32f


_ipps_createTabDftInvRec_32f:
        stmdb   sp!, {r4 - r6, lr}
        add     r2, r0, #3
        mov     r4, r1
        mov     r2, r2, asr #1
        add     r2, r0, r2, lsr #30
        add     r0, r2, #3
        mov     r5, r0, asr #2
        mov     r0, r5, lsl #3
        bl      _ippsMalloc_8u
        cmp     r0, #0
        moveq   r0, #0
        ldmeqia sp!, {r4 - r6, pc}
        cmp     r5, #0
        ble     LCIX3
        cmp     r5, #5
        mov     lr, #0
        blt     LCIX1
        sub     r12, r5, #5
        sub     r3, r4, #4
        sub     r2, r0, #4
LCIX0:
        ldr     r6, [r3, #4]
        add     lr, lr, #4
        cmp     lr, r12
        str     r6, [r2, #4]
        ldr     r6, [r3, #8]
        str     r6, [r2, #8]
        ldr     r6, [r3, #0xC]
        str     r6, [r2, #0xC]
        ldr     r6, [r3, #0x10]
        str     r6, [r2, #0x10]
        ldr     r6, [r3, #0x14]
        str     r6, [r2, #0x14]
        ldr     r6, [r3, #0x18]
        str     r6, [r2, #0x18]
        ldr     r6, [r3, #0x1C]
        str     r6, [r2, #0x1C]
        ldr     r6, [r3, #0x20]!
        str     r6, [r2, #0x20]!
        ble     LCIX0
LCIX1:
        mov     r2, lr, lsl #3
        sub     r2, r2, #4
        add     r4, r2, r4
        add     r1, r2, r0
LCIX2:
        ldr     r2, [r4, #4]
        add     lr, lr, #1
        cmp     lr, r5
        str     r2, [r1, #4]
        ldr     r2, [r4, #8]!
        str     r2, [r1, #8]!
        blt     LCIX2
LCIX3:
        ldmia   sp!, {r4 - r6, pc}


