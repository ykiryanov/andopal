        .text
        .align  4
        .globl  ownsSRSetTaps32f_16s


ownsSRSetTaps32f_16s:
        stmdb   sp!, {r4, r5, lr}
        mov     r5, r1
        ldr     r2, [r5, #8]
        ldr     r1, [r5]
        mov     r4, r0
        bl      ownsCvt32fToQ15
        ldr     r2, [r5, #8]
        sub     r0, r0, #0xE
        str     r0, [r5, #0x28]
        cmp     r2, #0
        ble     LBWY1
        mov     r2, #0
LBWY0:
        ldr     r3, [r4], #4
        ldr     r12, [r5, #0x54]
        str     r3, [r12, +r2, lsl #2]
        ldr     r3, [r5, #8]
        add     r2, r2, #1
        cmp     r2, r3
        blt     LBWY0
LBWY1:
        ldmia   sp!, {r4, r5, pc}


