        .text
        .align  4
        .globl  _ippsWTHaarInv_64f


_ippsWTHaarInv_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x24
        cmp     r0, #0
        beq     LAJC5
        cmp     r1, #0
        beq     LAJC5
        cmp     r2, #0
        beq     LAJC5
        cmp     r3, #0
        ble     LAJC6
        sub     r12, r3, #1
        cmp     r12, #0
        mov     r4, #0
        movle   lr, r4
        ble     LAJC3
        sub     lr, r3, #1
        cmp     lr, #8
        movlt   lr, r4
        addlt   r9, r2, #8
        blt     LAJC1
        mov     lr, r4
        add     r9, r2, #8
        sub     r10, r3, #9
        sub     r8, r1, #4
        sub     r7, r0, #4
        sub     r6, r2, #4
        sub     r5, r2, #0xC
        str     lr, [sp, #0x18]
        str     r9, [sp, #0xC]
        str     r10, [sp, #0x1C]
        str     r12, [sp, #0x10]
        str     r3, [sp, #8]
        str     r2, [sp, #4]
        str     r1, [sp, #0x14]
        str     r0, [sp]
LAJC0:
        ldr     r0, [sp, #0x18]
        add     r4, r4, #6
        add     r0, r0, #3
        str     r0, [sp, #0x18]
        ldr     r2, [r8, #4]
        ldr     r9, [r7, #4]
        ldr     r10, [r7, #8]
        str     r2, [sp, #0x20]
        ldr     r11, [r8, #8]
        mov     r0, r9
        mov     r1, r10
        mov     r3, r11
        bl      __subdf3
        str     r0, [r5, #0xC]
        str     r1, [r5, #0x10]
        ldr     r2, [sp, #0x20]
        mov     r3, r11
        mov     r0, r9
        mov     r1, r10
        bl      __adddf3
        str     r0, [r6, #0xC]
        str     r1, [r6, #0x10]
        ldr     r0, [r7, #0xC]
        str     r0, [sp, #0x20]
        ldr     r11, [r7, #0x10]
        ldr     r10, [r8, #0xC]
        ldr     r9, [r8, #0x10]
        mov     r1, r11
        mov     r2, r10
        mov     r3, r9
        bl      __subdf3
        str     r0, [r5, #0x1C]
        str     r1, [r5, #0x20]
        ldr     r0, [sp, #0x20]
        mov     r1, r11
        mov     r2, r10
        mov     r3, r9
        bl      __adddf3
        str     r0, [r6, #0x1C]
        str     r1, [r6, #0x20]
        ldr     r3, [r8, #0x18]
        ldr     r9, [r7, #0x14]
        ldr     r10, [r7, #0x18]!
        ldr     r11, [r8, #0x14]
        str     r3, [sp, #0x20]
        mov     r0, r9
        mov     r1, r10
        mov     r2, r11
        bl      __subdf3
        str     r0, [r5, #0x2C]
        str     r1, [r5, #0x30]!
        ldr     r3, [sp, #0x20]
        mov     r0, r9
        mov     r1, r10
        mov     r2, r11
        bl      __adddf3
        str     r0, [r6, #0x2C]
        str     r1, [r6, #0x30]!
        ldr     r0, [sp, #0x1C]
        cmp     r4, r0
        add     r8, r8, #0x18
        ble     LAJC0
        ldr     lr, [sp, #0x18]
        ldr     r9, [sp, #0xC]
        ldr     r12, [sp, #0x10]
        ldr     r3, [sp, #8]
        ldr     r2, [sp, #4]
        ldr     r1, [sp, #0x14]
        ldr     r0, [sp]
LAJC1:
        mov     r6, r4, lsl #3
        mov     r5, lr, lsl #3
        sub     r7, r6, #0xC
        sub     r5, r5, #4
        add     r6, r5, r1
        add     r1, r7, r9
        add     r5, r5, r0
        add     r7, r7, r2
        str     lr, [sp, #0x18]
        str     r1, [sp, #0x14]
        str     r9, [sp, #0xC]
        str     r12, [sp, #0x10]
        str     r3, [sp, #8]
        str     r2, [sp, #4]
        str     r0, [sp]
LAJC2:
        ldr     r3, [sp, #0x18]
        ldr     r8, [r5, #4]
        ldr     r11, [r5, #8]!
        ldr     r10, [r6, #4]
        add     r3, r3, #1
        str     r3, [sp, #0x18]
        ldr     r9, [r6, #8]!
        mov     r0, r8
        mov     r1, r11
        mov     r2, r10
        mov     r3, r9
        bl      __subdf3
        str     r0, [r7, #0xC]
        str     r1, [r7, #0x10]!
        mov     r0, r8
        mov     r1, r11
        mov     r2, r10
        mov     r3, r9
        bl      __adddf3
        ldr     r2, [sp, #0xC]
        str     r0, [r2, +r4, lsl #3]
        ldr     r0, [sp, #0x14]
        str     r1, [r0, #0x10]
        ldr     r0, [sp, #0x10]
        add     r4, r4, #2
        cmp     r4, r0
        ldr     r0, [sp, #0x14]
        add     r0, r0, #0x10
        str     r0, [sp, #0x14]
        blt     LAJC2
        ldr     lr, [sp, #0x18]
        ldr     r3, [sp, #8]
        ldr     r2, [sp, #4]
        ldr     r0, [sp]
LAJC3:
        tst     r3, #1
        beq     LAJC4
        ldr     r1, [r0, +lr, lsl #3]
        add     lr, r0, lr, lsl #3
        ldr     r0, [lr, #4]
        str     r1, [r2, +r4, lsl #3]
        add     r4, r2, r4, lsl #3
        str     r0, [r4, #4]
LAJC4:
        mov     r0, #0
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LAJC5:
        mvn     r0, #7
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LAJC6:
        mvn     r0, #5
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}


