        .text
        .align  4
        .globl  _ipps_cbConj2_64fc


_ipps_cbConj2_64fc:
        stmdb   sp!, {r4 - r8, lr}
        sub     r3, r2, #1
        cmp     r3, #0
        mov     r6, #0
        ble     LCEA1
        sub     r5, r0, #4
        sub     r4, r1, #4
        sub     lr, r0, #0x14
        sub     r12, r1, #0x14
LCEA0:
        ldr     r8, [lr, #0x18]
        ldr     r7, [lr, #0x14]
        add     r6, r6, #2
        str     r8, [r12, #0x18]
        cmp     r6, r3
        str     r7, [r12, #0x14]
        ldr     r8, [lr, #0x20]
        ldr     r7, [lr, #0x1C]
        add     lr, lr, #0x20
        eor     r8, r8, #2, 2
        str     r8, [r12, #0x20]
        str     r7, [r12, #0x1C]
        ldr     r8, [r5, #0x18]
        ldr     r7, [r5, #0x14]
        add     r12, r12, #0x20
        str     r8, [r4, #0x18]
        str     r7, [r4, #0x14]
        ldr     r8, [r5, #0x20]
        ldr     r7, [r5, #0x1C]
        add     r5, r5, #0x20
        eor     r8, r8, #2, 2
        str     r8, [r4, #0x20]
        str     r7, [r4, #0x1C]
        add     r4, r4, #0x20
        blt     LCEA0
LCEA1:
        tst     r2, #1
        beq     LCEA2
        ldr     r3, [r0, +r6, lsl #4]
        add     r0, r0, r6, lsl #4
        ldr     r2, [r0, #4]
        str     r3, [r1, +r6, lsl #4]
        add     r6, r1, r6, lsl #4
        str     r2, [r6, #4]
        ldr     r1, [r0, #0xC]
        ldr     r0, [r0, #8]
        eor     r1, r1, #2, 2
        str     r1, [r6, #0xC]
        str     r0, [r6, #8]
LCEA2:
        ldmia   sp!, {r4 - r8, pc}


