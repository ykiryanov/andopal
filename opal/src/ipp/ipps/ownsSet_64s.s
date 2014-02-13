        .text
        .align  4
        .globl  ownsSet_64s


ownsSet_64s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        str     r0, [sp]
        str     r1, [sp, #4]
        mov     r4, sp
        ldr     r12, [r4]
        mov     lr, sp
        ldr     r1, [lr, #4]
        mov     r4, r3, lsl #1
        cmp     r4, #0
        ble     LCVF9
        tst     r2, #3
        mov     lr, #0
        beq     LCVF3
        cmp     r4, #0xC
        addlt   r3, r2, #4
        blt     LCVF1
        add     r3, r2, #4
        sub     r7, r4, #0xC
        add     r6, r2, #8
        add     r5, r2, #0xC
LCVF0:
        str     r12, [r6, #-8]
        str     r1, [r5, #-8]
        str     r12, [r6]
        str     r1, [r5]
        str     r12, [r6, #8]
        str     r1, [r5, #8]
        str     r12, [r6, #0x10]
        str     r1, [r5, #0x10]
        str     r12, [r6, #0x18]
        add     lr, lr, #0xA
        str     r1, [r5, #0x18]
        cmp     lr, r7
        add     r6, r6, #0x28
        add     r5, r5, #0x28
        ble     LCVF0
LCVF1:
        add     r5, r2, lr, lsl #2
LCVF2:
        str     r12, [r5], #8
        str     r1, [r3, +lr, lsl #2]
        add     lr, lr, #2
        cmp     lr, r4
        blt     LCVF2
        mov     r0, r2
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCVF3:
        and     r3, r4, #6
        sub     r4, r4, r3
        cmp     r4, #0
        ble     LCVF5
        add     r5, r2, #4
        add     r6, r2, #8
        add     r7, r2, #0xC
        add     r8, r2, #0x10
        add     r9, r2, #0x14
        add     r10, r2, #0x18
        add     r11, r2, #0x1C
        mov     r0, r2
LCVF4:
        str     r12, [r0], #0x20
        str     r1, [r5], #0x20
        str     r12, [r6], #0x20
        str     r1, [r7], #0x20
        str     r12, [r8], #0x20
        str     r1, [r9], #0x20
        str     r12, [r10], #0x20
        add     lr, lr, #8
        str     r1, [r11], #0x20
        cmp     lr, r4
        blt     LCVF4
LCVF5:
        cmp     r3, #0
        beq     LCVF9
        cmp     r3, #0
        add     r5, r2, r4, lsl #2
        ble     LCVF9
        cmp     r3, #0xC
        mov     r4, #0
        addlt   lr, r5, #4
        blt     LCVF7
        add     lr, r5, #4
        sub     r8, r3, #0xC
        add     r7, r5, #8
        add     r6, r5, #0xC
LCVF6:
        str     r12, [r7, #-8]
        str     r1, [r6, #-8]
        str     r12, [r7]
        str     r1, [r6]
        str     r12, [r7, #8]
        str     r1, [r6, #8]
        str     r12, [r7, #0x10]
        str     r1, [r6, #0x10]
        str     r12, [r7, #0x18]
        add     r4, r4, #0xA
        str     r1, [r6, #0x18]
        cmp     r4, r8
        add     r7, r7, #0x28
        add     r6, r6, #0x28
        ble     LCVF6
LCVF7:
        add     r5, r5, r4, lsl #2
LCVF8:
        str     r12, [r5], #8
        str     r1, [lr, +r4, lsl #2]
        add     r4, r4, #2
        cmp     r4, r3
        blt     LCVF8
LCVF9:
        mov     r0, r2
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}


