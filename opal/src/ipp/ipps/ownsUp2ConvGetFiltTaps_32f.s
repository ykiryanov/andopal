        .text
        .align  4
        .globl  ownsUp2ConvGetFiltTaps_32f


ownsUp2ConvGetFiltTaps_32f:
        stmdb   sp!, {r4, r5, lr}
        ldr     r2, [r0]
        ldr     r3, [r0, #4]
        cmp     r2, #0
        ble     LAJV3
        cmp     r2, #6
        mov     r0, #0
        blt     LAJV1
        sub     r4, r2, #6
        add     lr, r3, #4
        add     r12, r1, #4
LAJV0:
        ldr     r5, [lr, #-4]
        add     r0, r0, #5
        cmp     r0, r4
        str     r5, [r12, #-4]
        ldr     r5, [lr]
        str     r5, [r12]
        ldr     r5, [lr, #4]
        str     r5, [r12, #4]
        ldr     r5, [lr, #8]
        str     r5, [r12, #8]
        ldr     r5, [lr, #0xC]
        add     lr, lr, #0x14
        str     r5, [r12, #0xC]
        add     r12, r12, #0x14
        ble     LAJV0
LAJV1:
        add     r3, r3, r0, lsl #2
        add     r1, r1, r0, lsl #2
LAJV2:
        ldr     r12, [r3], #4
        add     r0, r0, #1
        cmp     r0, r2
        str     r12, [r1], #4
        blt     LAJV2
LAJV3:
        ldmia   sp!, {r4, r5, pc}


