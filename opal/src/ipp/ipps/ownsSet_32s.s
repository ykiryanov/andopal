        .text
        .align  4
        .globl  ownsSet_32s


ownsSet_32s:
        stmdb   sp!, {r4 - r10, lr}
        cmp     r2, #0
        ble     LCVG5
        and     r3, r2, #7
        sub     r2, r2, r3
        cmp     r2, #0
        ble     LCVG1
        mov     r12, #0
        add     lr, r1, #4
        add     r4, r1, #8
        add     r5, r1, #0xC
        add     r6, r1, #0x10
        add     r7, r1, #0x14
        add     r8, r1, #0x18
        add     r9, r1, #0x1C
        mov     r10, r1
LCVG0:
        str     r0, [r10], #0x20
        str     r0, [lr], #0x20
        str     r0, [r4], #0x20
        str     r0, [r5], #0x20
        str     r0, [r6], #0x20
        str     r0, [r7], #0x20
        str     r0, [r8], #0x20
        add     r12, r12, #8
        str     r0, [r9], #0x20
        cmp     r12, r2
        blt     LCVG0
LCVG1:
        cmp     r3, #0
        beq     LCVG5
        cmp     r3, #0
        add     r12, r1, r2, lsl #2
        ble     LCVG5
        cmp     r3, #6
        mov     r2, #0
        blt     LCVG3
        sub     r4, r3, #6
        add     lr, r12, #4
LCVG2:
        add     r2, r2, #5
        str     r0, [lr, #-4]
        str     r0, [lr]
        str     r0, [lr, #4]
        str     r0, [lr, #8]
        str     r0, [lr, #0xC]
        cmp     r2, r4
        add     lr, lr, #0x14
        ble     LCVG2
LCVG3:
        add     r12, r12, r2, lsl #2
LCVG4:
        add     r2, r2, #1
        str     r0, [r12], #4
        cmp     r2, r3
        blt     LCVG4
LCVG5:
        mov     r0, r1
        ldmia   sp!, {r4 - r10, pc}


