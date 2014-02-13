        .text
        .align  4
        .globl  _ipps_cbConj2_32fc


_ipps_cbConj2_32fc:
        stmdb   sp!, {r4 - r7, lr}
        sub     r3, r2, #1
        cmp     r3, #0
        mov     r6, #0
        ble     LBYT1
        sub     r5, r0, #4
        sub     r4, r1, #4
        sub     lr, r0, #0xC
        sub     r12, r1, #0xC
LBYT0:
        ldr     r7, [lr, #0xC]
        add     r6, r6, #2
        cmp     r6, r3
        str     r7, [r12, #0xC]
        ldr     r7, [lr, #0x10]!
        eor     r7, r7, #2, 2
        str     r7, [r12, #0x10]!
        ldr     r7, [r5, #0xC]
        str     r7, [r4, #0xC]
        ldr     r7, [r5, #0x10]!
        eor     r7, r7, #2, 2
        str     r7, [r4, #0x10]!
        blt     LBYT0
LBYT1:
        tst     r2, #1
        beq     LBYT2
        ldr     r2, [r0, +r6, lsl #3]
        add     r0, r0, r6, lsl #3
        str     r2, [r1, +r6, lsl #3]
        ldr     r0, [r0, #4]
        add     r6, r1, r6, lsl #3
        eor     r0, r0, #2, 2
        str     r0, [r6, #4]
LBYT2:
        ldmia   sp!, {r4 - r7, pc}


