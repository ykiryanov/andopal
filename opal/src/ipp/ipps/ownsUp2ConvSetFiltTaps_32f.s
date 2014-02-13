        .text
        .align  4
        .globl  ownsUp2ConvSetFiltTaps_32f


ownsUp2ConvSetFiltTaps_32f:
        stmdb   sp!, {r4 - r7, lr}
        ldr     r3, [r0]
        ldr     r12, [r0, #4]
        cmp     r3, #0
        mov     r2, #0
        ble     LAJT3
        cmp     r3, #6
        movlt   lr, r2
        blt     LAJT1
        mov     lr, r2
        sub     r6, r3, #6
        add     r5, r1, #4
        add     r4, r12, #4
LAJT0:
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
        ble     LAJT0
LAJT1:
        add     r12, r12, lr, lsl #2
        add     r5, r1, lr, lsl #2
LAJT2:
        ldr     r4, [r5], #4
        add     lr, lr, #1
        cmp     lr, r3
        str     r4, [r12], #4
        blt     LAJT2
LAJT3:
        ldr     r3, [r0, #0xC]
        ldr     r12, [r0, #8]
        subs    r3, r3, #1
        bmi     LAJT7
        cmp     r3, #6
        blt     LAJT5
        mov     lr, r3, lsl #2
        sub     lr, lr, #4
        add     lr, lr, r12
        add     r4, r1, #8
LAJT4:
        ldr     r5, [r4, #-8]
        add     r2, r2, #0xA
        sub     r3, r3, #5
        str     r5, [lr, #4]
        ldr     r5, [r4]
        cmp     r3, #6
        str     r5, [lr]
        ldr     r5, [r4, #8]
        str     r5, [lr, #-4]
        ldr     r5, [r4, #0x10]
        str     r5, [lr, #-8]
        ldr     r5, [r4, #0x18]
        add     r4, r4, #0x28
        str     r5, [lr, #-0xC]
        sub     lr, lr, #0x14
        bge     LAJT4
LAJT5:
        add     r12, r12, r3, lsl #2
        add     r2, r1, r2, lsl #2
LAJT6:
        ldr     lr, [r2], #8
        subs    r3, r3, #1
        str     lr, [r12], #-4
        bpl     LAJT6
LAJT7:
        ldr     r2, [r0, #0x14]
        ldr     r0, [r0, #0x10]
        subs    r2, r2, #1
        bmi     LAJT11
        cmp     r2, #6
        mov     r3, #1
        blt     LAJT9
        mov     r12, r2, lsl #2
        sub     r12, r12, #4
        add     r12, r12, r0
        add     lr, r1, #0xC
LAJT8:
        ldr     r4, [lr, #-8]
        add     r3, r3, #0xA
        sub     r2, r2, #5
        str     r4, [r12, #4]
        ldr     r4, [lr]
        cmp     r2, #6
        str     r4, [r12]
        ldr     r4, [lr, #8]
        str     r4, [r12, #-4]
        ldr     r4, [lr, #0x10]
        str     r4, [r12, #-8]
        ldr     r4, [lr, #0x18]
        add     lr, lr, #0x28
        str     r4, [r12, #-0xC]
        sub     r12, r12, #0x14
        bge     LAJT8
LAJT9:
        add     r3, r1, r3, lsl #2
        add     r0, r0, r2, lsl #2
LAJT10:
        ldr     r1, [r3], #8
        subs    r2, r2, #1
        str     r1, [r0], #-4
        bpl     LAJT10
LAJT11:
        ldmia   sp!, {r4 - r7, pc}


