        .text
        .align  4
        .globl  ownsConvDown2SetFiltTaps_32f


ownsConvDown2SetFiltTaps_32f:
        stmdb   sp!, {r4 - r7, lr}
        ldr     r2, [r0]
        ldr     r12, [r0, #4]
        cmp     r2, #0
        mov     r3, #0
        ble     LAKA3
        cmp     r2, #6
        movlt   lr, r3
        blt     LAKA1
        mov     lr, r3
        sub     r6, r2, #6
        add     r5, r1, #4
        add     r4, r12, #4
LAKA0:
        ldr     r7, [r5, #-4]
        add     lr, lr, #5
        cmp     lr, r6
        str     r7, [r4, #-4]
        ldr     r7, [r5]
        str     r7, [r4]
        ldr     r7, [r5, #4]
        str     r7, [r4, #4]
        ldr     r7, [r5, #8]
        str     r7, [r4, #8]
        ldr     r7, [r5, #0xC]
        add     r5, r5, #0x14
        str     r7, [r4, #0xC]
        add     r4, r4, #0x14
        ble     LAKA0
LAKA1:
        add     r12, r12, lr, lsl #2
        add     r4, r1, lr, lsl #2
LAKA2:
        ldr     r5, [r4], #4
        add     lr, lr, #1
        cmp     lr, r2
        str     r5, [r12], #4
        blt     LAKA2
        ldr     r2, [r0]
LAKA3:
        ldr     r0, [r0, #8]
        cmp     r2, #0
        ble     LAKA7
        cmp     r2, #6
        sublt   r0, r0, #4
        blt     LAKA5
        sub     r0, r0, #4
        sub     lr, r2, #6
        add     r12, r1, #4
LAKA4:
        ldr     r5, [r12, #-4]
        sub     r4, r2, r3
        add     r3, r3, #5
        str     r5, [r0, +r4, lsl #2]
        ldr     r5, [r12]
        mov     r4, r4, lsl #2
        sub     r6, r4, #4
        str     r5, [r0, +r6]
        ldr     r6, [r12, #4]
        sub     r5, r4, #8
        cmp     r3, lr
        str     r6, [r0, +r5]
        ldr     r6, [r12, #8]
        sub     r5, r4, #0xC
        sub     r4, r4, #0x10
        str     r6, [r0, +r5]
        ldr     r5, [r12, #0xC]
        add     r12, r12, #0x14
        str     r5, [r0, +r4]
        ble     LAKA4
LAKA5:
        add     r1, r1, r3, lsl #2
LAKA6:
        ldr     lr, [r1], #4
        sub     r12, r2, r3
        add     r3, r3, #1
        cmp     r3, r2
        str     lr, [r0, +r12, lsl #2]
        blt     LAKA6
LAKA7:
        ldmia   sp!, {r4 - r7, pc}


