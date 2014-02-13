        .text
        .align  4
        .globl  _ipps_cbZero_64fc


_ipps_cbZero_64fc:
        stmdb   sp!, {r4 - r7, lr}
        sub     r2, r1, #1
        cmp     r2, #0
        mov     r3, #0
        movle   r12, #0
        ble     LCDY3
        sub     r12, r1, #1
        cmp     r12, #0xA
        movlt   r12, #0
        addlt   lr, r0, #0x10
        blt     LCDY1
        mov     r12, #0
        add     lr, r0, #0x10
        sub     r7, r1, #0xB
        mov     r6, r12
        sub     r5, r0, #4
        sub     r4, r0, #0x14
LCDY0:
        str     r6, [r4, #0x14]
        str     r6, [r4, #0x18]
        str     r6, [r4, #0x1C]
        str     r6, [r4, #0x20]
        str     r6, [r5, #0x14]
        str     r6, [r5, #0x18]
        str     r6, [r5, #0x1C]
        str     r6, [r5, #0x20]
        str     r6, [r4, #0x34]
        str     r6, [r4, #0x38]
        str     r6, [r4, #0x3C]
        str     r6, [r4, #0x40]
        str     r6, [r5, #0x34]
        str     r6, [r5, #0x38]
        str     r6, [r5, #0x3C]
        str     r6, [r5, #0x40]
        str     r6, [r4, #0x54]
        str     r6, [r4, #0x58]
        str     r6, [r4, #0x5C]
        str     r6, [r4, #0x60]
        str     r6, [r5, #0x54]
        str     r6, [r5, #0x58]
        str     r6, [r5, #0x5C]
        str     r6, [r5, #0x60]
        str     r6, [r4, #0x74]
        str     r6, [r4, #0x78]
        str     r6, [r4, #0x7C]
        str     r6, [r4, #0x80]!
        add     r12, r12, #8
        str     r6, [r5, #0x74]
        str     r6, [r5, #0x78]
        str     r6, [r5, #0x7C]
        str     r6, [r5, #0x80]!
        cmp     r12, r7
        ble     LCDY0
LCDY1:
        mov     r4, r12, lsl #4
        sub     r5, r4, #0x14
        add     r4, r5, lr
        add     r5, r5, r0
LCDY2:
        str     r3, [r5, #0x14]
        str     r3, [r5, #0x18]
        str     r3, [r5, #0x1C]
        str     r3, [r5, #0x20]!
        str     r3, [lr, +r12, lsl #4]
        add     r12, r12, #2
        str     r3, [r4, #0x18]
        str     r3, [r4, #0x1C]
        str     r3, [r4, #0x20]!
        cmp     r12, r2
        blt     LCDY2
LCDY3:
        tst     r1, #1
        beq     LCDY4
        str     r3, [r0, +r12, lsl #4]
        add     r12, r0, r12, lsl #4
        str     r3, [r12, #4]
        str     r3, [r12, #8]
        str     r3, [r12, #0xC]
LCDY4:
        ldmia   sp!, {r4 - r7, pc}


