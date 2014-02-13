        .text
        .align  4
        .globl  ownsUp2ConvAdd_32f


ownsUp2ConvAdd_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x3C
        mov     r4, r0
        ldr     r12, [sp, #0x60]
        ldr     r7, [r4, #0xC]
        ldr     r6, [r4, #0x14]
        ldr     r0, [r4, #8]
        ldr     r4, [r4, #0x10]
        sub     lr, r12, r7
        cmp     r12, #0
        add     lr, lr, #1
        rsb     r12, r6, #1
        str     r4, [sp, #0x34]
        add     r5, r1, lr, lsl #2
        add     r1, r1, r12, lsl #2
        mov     r9, r2
        mov     r8, #0
        sub     r12, r3, #1
        bne     LAJY14
        cmp     r12, #0
        movle   lr, r8
        ble     LAJY9
        mov     lr, r8
        sub     r11, r7, #6
        str     r5, [sp, #0x24]
        add     r10, r9, #4
        mov     r4, r9
        str     r11, [sp, #0x14]
        str     r9, [sp, #4]
        ldr     r9, [sp, #0x24]
        ldr     r11, [sp, #0x34]
        sub     r2, r6, #6
        str     r5, [sp, #0x38]
        str     lr, [sp, #0x18]
        str     r2, [sp, #0x20]
        str     r12, [sp, #0x2C]
        str     r0, [sp, #8]
        str     r3, [sp, #0x30]
        mov     r5, r1
LAJY0:
        cmp     r7, #0
        movle   r1, #0
        movle   r0, r1
        ble     LAJY4
        cmp     r7, #6
        blt     LAJY31
        ldr     r12, [sp, #8]
        mov     r1, #0
        add     r3, r9, #4
        str     r9, [sp, #0x24]
        ldr     r9, [sp, #0x14]
        mov     r2, r1
        mov     r0, r2
        add     r12, r12, #4
        str     r10, [sp, #0x1C]
        str     r6, [sp, #0x10]
        str     r7, [sp, #0xC]
        str     r8, [sp]
        mov     r11, r0
        mov     r10, r1
        mov     r6, r2
        mov     r8, r3
        mov     r7, r12
LAJY1:
        ldr     r1, [r7, #-4]
        ldr     r0, [r8, #-4]
        add     r6, r6, #5
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        ldr     r2, [r7]
        ldr     r3, [r8]
        mov     r10, r1
        mov     r11, r0
        mov     r1, r2
        mov     r0, r3
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        ldr     r2, [r8, #4]
        ldr     r3, [r7, #4]
        mov     r10, r0
        mov     r11, r1
        mov     r0, r2
        mov     r1, r3
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        ldr     r3, [r8, #8]
        ldr     r2, [r7, #8]
        mov     r10, r1
        mov     r11, r0
        mov     r0, r3
        mov     r1, r2
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        ldr     r2, [r8, #0xC]
        ldr     r3, [r7, #0xC]
        mov     r10, r0
        mov     r11, r1
        mov     r0, r2
        mov     r1, r3
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        cmp     r6, r9
        mov     r11, r0
        mov     r10, r1
        add     r8, r8, #0x14
        add     r7, r7, #0x14
        ble     LAJY1
        mov     r2, r6
        mov     r1, r10
        mov     r0, r11
        ldr     r9, [sp, #0x24]
        ldr     r10, [sp, #0x1C]
        ldr     r6, [sp, #0x10]
        ldr     r11, [sp, #0x34]
        ldr     r7, [sp, #0xC]
        ldr     r8, [sp]
LAJY2:
        ldr     r12, [sp, #8]
        add     r3, r9, r2, lsl #2
        str     r9, [sp, #0x24]
        add     r12, r12, r2, lsl #2
        str     r10, [sp, #0x1C]
        str     r6, [sp, #0x10]
        str     r8, [sp]
        mov     r11, r0
        mov     r10, r1
        mov     r6, r2
        mov     r9, r3
        mov     r8, r12
LAJY3:
        ldr     r0, [r9], #4
        ldr     r1, [r8], #4
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        add     r6, r6, #1
        cmp     r6, r7
        mov     r11, r0
        mov     r10, r1
        blt     LAJY3
        mov     r1, r10
        mov     r0, r11
        ldr     r9, [sp, #0x24]
        ldr     r10, [sp, #0x1C]
        ldr     r6, [sp, #0x10]
        ldr     r11, [sp, #0x34]
        ldr     r8, [sp]
LAJY4:
        bl      __truncdfsf2
        ldr     r1, [r4]
        bl      __addsf3
        str     r0, [r4], #8
        cmp     r6, #0
        movle   r1, #0
        movle   r0, r1
        ble     LAJY8
        cmp     r6, #6
        blt     LAJY30
        mov     r1, #0
        str     r9, [sp, #0x24]
        ldr     r9, [sp, #0x20]
        mov     r2, r1
        add     r3, r11, #4
        mov     r0, r2
        add     r12, r5, #4
        str     r10, [sp, #0x1C]
        str     r6, [sp, #0x10]
        str     r7, [sp, #0xC]
        str     r8, [sp]
        mov     r11, r0
        mov     r10, r1
        mov     r6, r2
        mov     r7, r3
        mov     r8, r12
LAJY5:
        ldr     r1, [r7, #-4]
        ldr     r0, [r8, #-4]
        add     r6, r6, #5
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        ldr     r3, [r7]
        ldr     r2, [r8]
        mov     r10, r1
        mov     r11, r0
        mov     r1, r3
        mov     r0, r2
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        ldr     r3, [r8, #4]
        ldr     r2, [r7, #4]
        mov     r10, r0
        mov     r11, r1
        mov     r0, r3
        mov     r1, r2
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        ldr     r2, [r8, #8]
        ldr     r3, [r7, #8]
        mov     r10, r1
        mov     r11, r0
        mov     r0, r2
        mov     r1, r3
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        ldr     r3, [r8, #0xC]
        ldr     r2, [r7, #0xC]
        mov     r10, r0
        mov     r11, r1
        mov     r0, r3
        mov     r1, r2
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        cmp     r6, r9
        mov     r11, r0
        mov     r10, r1
        add     r8, r8, #0x14
        add     r7, r7, #0x14
        ble     LAJY5
        mov     r2, r6
        mov     r1, r10
        mov     r0, r11
        ldr     r9, [sp, #0x24]
        ldr     r10, [sp, #0x1C]
        ldr     r6, [sp, #0x10]
        ldr     r11, [sp, #0x34]
        ldr     r7, [sp, #0xC]
        ldr     r8, [sp]
LAJY6:
        str     r7, [sp, #0xC]
        add     r12, r11, r2, lsl #2
        add     r3, r5, r2, lsl #2
        str     r9, [sp, #0x24]
        str     r10, [sp, #0x1C]
        str     r8, [sp]
        mov     r7, r6
        mov     r11, r0
        mov     r10, r1
        mov     r6, r2
        mov     r9, r3
        mov     r8, r12
LAJY7:
        ldr     r0, [r9], #4
        ldr     r1, [r8], #4
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        add     r6, r6, #1
        cmp     r6, r7
        mov     r11, r0
        mov     r10, r1
        blt     LAJY7
        mov     r6, r7
        mov     r1, r10
        mov     r0, r11
        ldr     r9, [sp, #0x24]
        ldr     r10, [sp, #0x1C]
        ldr     r11, [sp, #0x34]
        ldr     r7, [sp, #0xC]
        ldr     r8, [sp]
LAJY8:
        bl      __truncdfsf2
        ldr     r1, [r10]
        bl      __addsf3
        str     r0, [r10], #8
        ldr     r0, [sp, #0x2C]
        add     r8, r8, #2
        cmp     r8, r0
        ldr     r0, [sp, #0x18]
        add     r5, r5, #4
        add     r9, r9, #4
        add     r0, r0, #1
        str     r0, [sp, #0x18]
        blt     LAJY0
        ldr     r5, [sp, #0x38]
        ldr     lr, [sp, #0x18]
        ldr     r0, [sp, #8]
        ldr     r3, [sp, #0x30]
        ldr     r9, [sp, #4]
LAJY9:
        cmp     r8, r3
        bge     LAJY29
        add     r6, r5, lr, lsl #2
        cmp     r7, #0
        mov     r5, #0
        movle   r4, r5
        ble     LAJY13
        cmp     r7, #6
        movlt   r10, r5
        movlt   r4, r10
        blt     LAJY11
        mov     r10, r5
        sub     r2, r7, #6
        add     r1, r6, #4
        str     r9, [sp, #4]
        str     r8, [sp]
        mov     r4, r10
        add     r11, r0, #4
        str     r0, [sp, #8]
        mov     r8, r1
        mov     r9, r2
LAJY10:
        ldr     r1, [r11, #-4]
        ldr     r0, [r8, #-4]
        add     r10, r10, #5
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        mov     r4, r0
        mov     r5, r1
        ldr     r1, [r11]
        ldr     r0, [r8]
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        mov     r4, r0
        mov     r5, r1
        ldr     r0, [r8, #4]
        ldr     r1, [r11, #4]
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        mov     r5, r1
        mov     r4, r0
        ldr     r0, [r8, #8]
        ldr     r1, [r11, #8]
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        mov     r4, r0
        mov     r5, r1
        ldr     r0, [r8, #0xC]
        ldr     r1, [r11, #0xC]
        add     r8, r8, #0x14
        add     r11, r11, #0x14
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        cmp     r10, r9
        mov     r4, r0
        mov     r5, r1
        ble     LAJY10
        ldr     r0, [sp, #8]
        ldr     r9, [sp, #4]
        ldr     r8, [sp]
LAJY11:
        add     r6, r6, r10, lsl #2
        add     r11, r0, r10, lsl #2
LAJY12:
        ldr     r0, [r6], #4
        ldr     r1, [r11], #4
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        add     r10, r10, #1
        cmp     r10, r7
        mov     r4, r0
        mov     r5, r1
        blt     LAJY12
LAJY13:
        mov     r0, r4
        mov     r1, r5
        bl      __truncdfsf2
        ldr     r1, [r9, +r8, lsl #2]
        bl      __addsf3
        str     r0, [r9, +r8, lsl #2]
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LAJY14:
        cmp     r12, #0
        strle   r8, [sp, #0x20]
        ble     LAJY24
        sub     r2, r6, #6
        add     r10, r9, #4
        sub     lr, r7, #6
        mov     r4, r9
        str     r9, [sp, #4]
        str     r8, [sp, #0x20]
        mov     r11, r1
        str     lr, [sp, #0x24]
        str     r2, [sp, #0x14]
        str     r1, [sp, #0x28]
        str     r12, [sp, #0x2C]
        str     r3, [sp, #0x30]
        mov     r9, r0
LAJY15:
        cmp     r6, #0
        movle   r1, #0
        movle   r0, r1
        ble     LAJY19
        cmp     r6, #6
        blt     LAJY33
        ldr     r12, [sp, #0x34]
        mov     r1, #0
        str     r9, [sp, #8]
        ldr     r9, [sp, #0x14]
        mov     r2, r1
        add     r3, r11, #4
        mov     r0, r2
        add     r12, r12, #4
        str     r11, [sp, #0x1C]
        str     r10, [sp, #0x18]
        str     r6, [sp, #0x10]
        str     r7, [sp, #0xC]
        str     r8, [sp]
        mov     r11, r0
        mov     r10, r1
        mov     r6, r2
        mov     r8, r3
        mov     r7, r12
LAJY16:
        ldr     r1, [r7, #-4]
        ldr     r0, [r8, #-4]
        add     r6, r6, #5
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        ldr     r3, [r7]
        ldr     r2, [r8]
        mov     r10, r1
        mov     r11, r0
        mov     r1, r3
        mov     r0, r2
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        ldr     r3, [r8, #4]
        ldr     r2, [r7, #4]
        mov     r10, r0
        mov     r11, r1
        mov     r0, r3
        mov     r1, r2
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        ldr     r2, [r8, #8]
        ldr     r3, [r7, #8]
        mov     r10, r1
        mov     r11, r0
        mov     r0, r2
        mov     r1, r3
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        ldr     r3, [r8, #0xC]
        ldr     r2, [r7, #0xC]
        mov     r10, r0
        mov     r11, r1
        mov     r0, r3
        mov     r1, r2
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        cmp     r6, r9
        mov     r11, r0
        mov     r10, r1
        add     r8, r8, #0x14
        add     r7, r7, #0x14
        ble     LAJY16
        mov     r2, r6
        mov     r1, r10
        mov     r0, r11
        ldr     r11, [sp, #0x1C]
        ldr     r10, [sp, #0x18]
        ldr     r6, [sp, #0x10]
        ldr     r7, [sp, #0xC]
        ldr     r9, [sp, #8]
        ldr     r8, [sp]
LAJY17:
        ldr     r12, [sp, #0x34]
        str     r7, [sp, #0xC]
        add     r3, r11, r2, lsl #2
        add     r12, r12, r2, lsl #2
        str     r11, [sp, #0x1C]
        str     r10, [sp, #0x18]
        str     r9, [sp, #8]
        str     r8, [sp]
        mov     r7, r6
        mov     r11, r0
        mov     r10, r1
        mov     r6, r2
        mov     r9, r3
        mov     r8, r12
LAJY18:
        ldr     r0, [r9], #4
        ldr     r1, [r8], #4
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        add     r6, r6, #1
        cmp     r6, r7
        mov     r11, r0
        mov     r10, r1
        blt     LAJY18
        mov     r6, r7
        mov     r1, r10
        mov     r0, r11
        ldr     r11, [sp, #0x1C]
        ldr     r10, [sp, #0x18]
        ldr     r7, [sp, #0xC]
        ldr     r9, [sp, #8]
        ldr     r8, [sp]
LAJY19:
        bl      __truncdfsf2
        ldr     r1, [r4]
        bl      __addsf3
        str     r0, [r4], #8
        cmp     r7, #0
        movle   r1, #0
        movle   r0, r1
        ble     LAJY23
        cmp     r7, #6
        blt     LAJY32
        mov     r1, #0
        add     r12, r9, #4
        str     r9, [sp, #8]
        ldr     r9, [sp, #0x24]
        mov     r2, r1
        mov     r0, r2
        add     r3, r5, #4
        str     r11, [sp, #0x1C]
        str     r10, [sp, #0x18]
        str     r6, [sp, #0x10]
        str     r7, [sp, #0xC]
        str     r8, [sp]
        mov     r11, r0
        mov     r10, r1
        mov     r6, r2
        mov     r8, r3
        mov     r7, r12
LAJY20:
        ldr     r1, [r7, #-4]
        ldr     r0, [r8, #-4]
        add     r6, r6, #5
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        ldr     r2, [r7]
        ldr     r3, [r8]
        mov     r10, r1
        mov     r11, r0
        mov     r1, r2
        mov     r0, r3
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        ldr     r2, [r8, #4]
        ldr     r3, [r7, #4]
        mov     r10, r0
        mov     r11, r1
        mov     r0, r2
        mov     r1, r3
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        ldr     r3, [r8, #8]
        ldr     r2, [r7, #8]
        mov     r10, r1
        mov     r11, r0
        mov     r0, r3
        mov     r1, r2
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        ldr     r2, [r8, #0xC]
        ldr     r3, [r7, #0xC]
        mov     r10, r0
        mov     r11, r1
        mov     r0, r2
        mov     r1, r3
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        cmp     r6, r9
        mov     r11, r0
        mov     r10, r1
        add     r8, r8, #0x14
        add     r7, r7, #0x14
        ble     LAJY20
        mov     r2, r6
        mov     r1, r10
        mov     r0, r11
        ldr     r11, [sp, #0x1C]
        ldr     r10, [sp, #0x18]
        ldr     r6, [sp, #0x10]
        ldr     r7, [sp, #0xC]
        ldr     r9, [sp, #8]
        ldr     r8, [sp]
LAJY21:
        add     r3, r9, r2, lsl #2
        add     r12, r5, r2, lsl #2
        str     r11, [sp, #0x1C]
        str     r10, [sp, #0x18]
        str     r6, [sp, #0x10]
        str     r9, [sp, #8]
        str     r8, [sp]
        mov     r11, r0
        mov     r10, r1
        mov     r6, r2
        mov     r8, r3
        mov     r9, r12
LAJY22:
        ldr     r0, [r9], #4
        ldr     r1, [r8], #4
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        add     r6, r6, #1
        cmp     r6, r7
        mov     r11, r0
        mov     r10, r1
        blt     LAJY22
        mov     r1, r10
        mov     r0, r11
        ldr     r11, [sp, #0x1C]
        ldr     r10, [sp, #0x18]
        ldr     r6, [sp, #0x10]
        ldr     r9, [sp, #8]
        ldr     r8, [sp]
LAJY23:
        bl      __truncdfsf2
        ldr     r1, [r10]
        bl      __addsf3
        str     r0, [r10], #8
        ldr     r1, [sp, #0x2C]
        add     r8, r8, #2
        cmp     r8, r1
        ldr     r1, [sp, #0x20]
        add     r5, r5, #4
        add     r11, r11, #4
        add     r1, r1, #1
        str     r1, [sp, #0x20]
        blt     LAJY15
        ldr     r1, [sp, #0x28]
        ldr     r3, [sp, #0x30]
        ldr     r9, [sp, #4]
LAJY24:
        cmp     r8, r3
        bge     LAJY29
        ldr     r0, [sp, #0x20]
        cmp     r6, #0
        mov     r5, #0
        add     r10, r1, r0, lsl #2
        movle   r4, r5
        ble     LAJY28
        cmp     r6, #6
        movlt   r11, r5
        movlt   r4, r11
        blt     LAJY26
        mov     r11, r5
        ldr     r12, [sp, #0x34]
        sub     r1, r6, #6
        add     r0, r10, #4
        str     r9, [sp, #4]
        str     r8, [sp]
        mov     r4, r11
        add     r7, r12, #4
        mov     r8, r0
        mov     r9, r1
LAJY25:
        ldr     r1, [r7, #-4]
        ldr     r0, [r8, #-4]
        add     r11, r11, #5
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        mov     r4, r0
        mov     r5, r1
        ldr     r1, [r7]
        ldr     r0, [r8]
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        mov     r4, r0
        mov     r5, r1
        ldr     r0, [r8, #4]
        ldr     r1, [r7, #4]
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        mov     r5, r1
        mov     r4, r0
        ldr     r0, [r8, #8]
        ldr     r1, [r7, #8]
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        mov     r4, r0
        mov     r5, r1
        ldr     r0, [r8, #0xC]
        ldr     r1, [r7, #0xC]
        add     r8, r8, #0x14
        add     r7, r7, #0x14
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        cmp     r11, r9
        mov     r4, r0
        mov     r5, r1
        ble     LAJY25
        ldr     r9, [sp, #4]
        ldr     r8, [sp]
LAJY26:
        ldr     r12, [sp, #0x34]
        add     r7, r10, r11, lsl #2
        add     r10, r12, r11, lsl #2
LAJY27:
        ldr     r0, [r7], #4
        ldr     r1, [r10], #4
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        add     r11, r11, #1
        cmp     r11, r6
        mov     r4, r0
        mov     r5, r1
        blt     LAJY27
LAJY28:
        mov     r0, r4
        mov     r1, r5
        bl      __truncdfsf2
        ldr     r1, [r9, +r8, lsl #2]
        bl      __addsf3
        str     r0, [r9, +r8, lsl #2]
LAJY29:
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LAJY30:
        mov     r1, #0
        mov     r2, r1
        mov     r0, r2
        b       LAJY6
LAJY31:
        mov     r1, #0
        mov     r2, r1
        mov     r0, r2
        b       LAJY2
LAJY32:
        mov     r1, #0
        mov     r2, r1
        mov     r0, r2
        b       LAJY21
LAJY33:
        mov     r1, #0
        mov     r2, r1
        mov     r0, r2
        b       LAJY17


