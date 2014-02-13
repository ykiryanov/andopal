        .text
        .align  4
        .globl  _ipps_cbZero_32fc


_ipps_cbZero_32fc:
        stmdb   sp!, {r4 - r6, lr}
        sub     r2, r1, #1
        cmp     r2, #0
        mov     r3, #0
        ble     LBYR3
        ldr     lr, [pc, #0xBC]
        sub     r12, r1, #1
        cmp     r12, #0xA
        ldrlt   r12, [lr]
        addlt   lr, r0, #8
        blt     LBYR1
        ldr     r12, [lr]
        add     lr, r0, #8
        sub     r6, r1, #0xB
        sub     r5, r0, #4
        sub     r4, r0, #0xC
LBYR0:
        str     r12, [r4, #0xC]
        str     r12, [r4, #0x10]
        str     r12, [r5, #0xC]
        str     r12, [r5, #0x10]
        str     r12, [r4, #0x1C]
        str     r12, [r4, #0x20]
        str     r12, [r5, #0x1C]
        str     r12, [r5, #0x20]
        str     r12, [r4, #0x2C]
        str     r12, [r4, #0x30]
        str     r12, [r5, #0x2C]
        str     r12, [r5, #0x30]
        str     r12, [r4, #0x3C]
        str     r12, [r4, #0x40]!
        add     r3, r3, #8
        str     r12, [r5, #0x3C]
        str     r12, [r5, #0x40]!
        cmp     r3, r6
        ble     LBYR0
LBYR1:
        mov     r4, r3, lsl #3
        sub     r5, r4, #0xC
        add     r4, r5, lr
        add     r5, r5, r0
LBYR2:
        str     r12, [r5, #0xC]
        str     r12, [r5, #0x10]!
        str     r12, [lr, +r3, lsl #3]
        add     r3, r3, #2
        str     r12, [r4, #0x10]!
        cmp     r3, r2
        blt     LBYR2
LBYR3:
        tst     r1, #1
        beq     LBYR4
        ldr     r2, [pc, #0x10]
        add     r1, r0, r3, lsl #3
        ldr     r2, [r2]
        str     r2, [r0, +r3, lsl #3]
        str     r2, [r1, #4]
LBYR4:
        ldmia   sp!, {r4 - r6, pc}
        .long   LBYR__2il0floatpacket.1


        .data
        .align  4


LBYR__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


