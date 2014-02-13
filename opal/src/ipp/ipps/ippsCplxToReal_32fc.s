        .text
        .align  4
        .globl  _ippsCplxToReal_32fc


_ippsCplxToReal_32fc:
        stmdb   sp!, {r1, r4 - r11, lr}
        cmp     r0, #0
        beq     LCVB13
        cmp     r1, #0
        beq     LCVB13
        cmp     r2, #0
        beq     LCVB13
        cmp     r3, #0
        ble     LCVB12
        and     r12, r3, #3
        sub     r3, r3, r12
        cmp     r3, #0
        ble     LCVB1
        mov     r11, #0
        add     r10, r0, #8
        add     r9, r0, #0x10
        add     r8, r0, #0x18
        add     r7, r1, #4
        add     r6, r1, #8
        add     r5, r1, #0xC
        mov     r4, r0
        mov     lr, r1
        str     r0, [sp]
LCVB0:
        ldr     r0, [r4], #0x20
        add     r11, r11, #4
        str     r0, [lr], #0x10
        ldr     r0, [r10], #0x20
        str     r0, [r7], #0x10
        ldr     r0, [r9], #0x20
        str     r0, [r6], #0x10
        ldr     r0, [r8], #0x20
        cmp     r11, r3
        str     r0, [r5], #0x10
        blt     LCVB0
        ldr     r0, [sp]
LCVB1:
        cmp     r3, #0
        ble     LCVB3
        mov     r11, #0
        add     r10, r2, #4
        add     r9, r2, #8
        add     r8, r2, #0xC
        sub     r7, r0, #4
        sub     r6, r0, #0xC
        sub     r5, r0, #0x14
        sub     r4, r0, #0x1C
        mov     lr, r2
        str     r0, [sp]
LCVB2:
        ldr     r0, [r4, #0x20]!
        add     r11, r11, #4
        str     r0, [lr], #0x10
        ldr     r0, [r5, #0x20]!
        str     r0, [r10], #0x10
        ldr     r0, [r6, #0x20]!
        str     r0, [r9], #0x10
        ldr     r0, [r7, #0x20]!
        cmp     r11, r3
        str     r0, [r8], #0x10
        blt     LCVB2
        ldr     r0, [sp]
LCVB3:
        cmp     r12, #0
        beq     LCVB11
        add     lr, r1, r3, lsl #2
        add     r0, r0, r3, lsl #3
        cmp     r12, #0
        add     r3, r2, r3, lsl #2
        mov     r1, #0
        ble     LCVB7
        cmp     r12, #6
        movlt   r6, r1
        blt     LCVB5
        mov     r6, r1
        sub     r5, r12, #6
        mov     r4, r0
        mov     r2, lr
LCVB4:
        ldr     r7, [r4], #0x28
        add     r9, r6, #1
        str     r7, [r2], #0x14
        ldr     r8, [r0, +r9, lsl #3]
        add     r7, r6, #2
        str     r8, [lr, +r9, lsl #2]
        ldr     r9, [r0, +r7, lsl #3]
        add     r8, r6, #3
        str     r9, [lr, +r7, lsl #2]
        ldr     r9, [r0, +r8, lsl #3]
        add     r7, r6, #4
        add     r6, r6, #5
        str     r9, [lr, +r8, lsl #2]
        ldr     r8, [r0, +r7, lsl #3]
        cmp     r6, r5
        str     r8, [lr, +r7, lsl #2]
        ble     LCVB4
LCVB5:
        add     lr, lr, r6, lsl #2
        add     r2, r0, r6, lsl #3
LCVB6:
        ldr     r4, [r2], #8
        add     r6, r6, #1
        cmp     r6, r12
        str     r4, [lr], #4
        blt     LCVB6
LCVB7:
        cmp     r12, #0
        ble     LCVB11
        cmp     r12, #6
        blt     LCVB9
        sub     r4, r12, #6
        sub     lr, r0, #0x24
        mov     r2, r3
LCVB8:
        ldr     r6, [lr, #0x28]!
        add     r5, r1, #1
        str     r6, [r2], #0x14
        add     r6, r0, r5, lsl #3
        ldr     r7, [r6, #4]
        add     r6, r1, #2
        str     r7, [r3, +r5, lsl #2]
        add     r7, r0, r6, lsl #3
        ldr     r7, [r7, #4]
        add     r5, r1, #3
        str     r7, [r3, +r6, lsl #2]
        add     r6, r1, #4
        add     r8, r0, r5, lsl #3
        ldr     r8, [r8, #4]
        add     r1, r1, #5
        cmp     r1, r4
        str     r8, [r3, +r5, lsl #2]
        add     r5, r0, r6, lsl #3
        ldr     r5, [r5, #4]
        str     r5, [r3, +r6, lsl #2]
        ble     LCVB8
LCVB9:
        mov     r2, r1, lsl #3
        sub     r2, r2, #4
        add     r0, r2, r0
        add     r3, r3, r1, lsl #2
LCVB10:
        ldr     r2, [r0, #8]!
        add     r1, r1, #1
        cmp     r1, r12
        str     r2, [r3], #4
        blt     LCVB10
LCVB11:
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LCVB12:
        mvn     r0, #5
        ldmia   sp!, {r1, r4 - r11, pc}
LCVB13:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r11, pc}


