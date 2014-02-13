        .text
        .align  4
        .globl  ownsUp2ConvCheck_32f


ownsUp2ConvCheck_32f:
        cmp     r0, #0
        beq     LAJX1
        ldr     r1, [r0]
        cmp     r1, #0
        ble     LAJX1
        ldr     r1, [r0, #4]
        cmp     r1, #0
        beq     LAJX1
        ldr     r1, [r0, #8]
        cmp     r1, #0
        beq     LAJX1
        ldr     r1, [r0, #0xC]
        cmp     r1, #0
        ble     LAJX1
        ldr     r1, [r0, #0x10]
        cmp     r1, #0
        beq     LAJX0
        ldr     r0, [r0, #0x14]
        cmp     r0, #0
        ble     LAJX1
LAJX0:
        mov     r0, #1
        bx      lr
LAJX1:
        mov     r0, #0
        bx      lr


