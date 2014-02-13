        .text
        .align  4
        .globl  ownsSRSetTaps32fc_16sc


ownsSRSetTaps32fc_16sc:
        stmdb   sp!, {r4, r5, lr}
        mov     r4, r1
        ldr     r2, [r4, #8]
        ldr     r1, [r4]
        mov     r5, r0
        bl      ownsCvt32fcToQ15
        ldr     r2, [r4, #8]
        sub     r0, r0, #0xE
        str     r0, [r4, #0x28]
        cmp     r2, #0
        ble     LBWX1
        mov     r2, #0
        sub     r5, r5, #4
        mov     r0, r2
LBWX0:
        ldr     r12, [r4, #0x54]
        ldr     r3, [r5, #4]
        str     r3, [r12, +r0, lsl #3]
        ldr     r12, [r4, #0x54]
        ldr     r3, [r5, #8]!
        add     r0, r0, #1
        add     r12, r12, r2
        str     r3, [r12, #4]
        ldr     r3, [r4, #8]
        add     r2, r2, #8
        cmp     r0, r3
        blt     LBWX0
LBWX1:
        ldmia   sp!, {r4, r5, pc}


