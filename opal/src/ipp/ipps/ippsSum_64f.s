        .text
        .align  4
        .globl  _ippsSum_64f


_ippsSum_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x2C
        cmp     r0, #0
        mov     r6, r2
        beq     LASO11
        cmp     r6, #0
        beq     LASO11
        cmp     r1, #0
        ble     LASO10
        subs    r12, r1, #4
        str     r12, [sp, #0x18]
        mov     r3, #0
        bmi     LASO9
        sub     r12, r1, #4
        cmp     r12, #0x10
        blt     LASO8
        mov     r10, r3
        sub     r9, r0, #0x14
        str     r9, [sp, #0x28]
        sub     r9, r0, #0x1C
        str     r6, [sp, #0x1C]
        str     r10, [sp]
        mov     r6, r9
        ldr     r9, [sp, #0x28]
        mov     r4, r10
        add     r2, r0, #8
        add     lr, r0, #0x10
        add     r12, r0, #0x18
        sub     r11, r1, #0x14
        mov     r5, r4
        sub     r8, r0, #4
        sub     r7, r0, #0xC
        str     r12, [sp, #0xC]
        str     lr, [sp, #0x10]
        str     r2, [sp, #0x14]
        str     r11, [sp, #8]
        str     r3, [sp, #4]
        str     r1, [sp, #0x20]
        str     r0, [sp, #0x24]
LASO0:
        ldr     r0, [sp]
        ldr     r2, [r6, #0x1C]
        ldr     r3, [r6, #0x20]
        mov     r1, r10
        bl      __adddf3
        ldr     r2, [r9, #0x1C]
        ldr     r3, [r9, #0x20]
        str     r0, [sp]
        mov     r10, r1
        mov     r1, r5
        mov     r0, r4
        bl      __adddf3
        ldr     r2, [r7, #0x1C]
        ldr     r3, [r7, #0x20]
        mov     r4, r0
        ldr     r0, [sp]
        mov     r5, r1
        mov     r1, r10
        bl      __adddf3
        ldr     r2, [r8, #0x1C]
        ldr     r3, [r8, #0x20]
        mov     r10, r0
        mov     r11, r1
        mov     r0, r4
        mov     r1, r5
        bl      __adddf3
        ldr     r2, [r6, #0x3C]
        ldr     r3, [r6, #0x40]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r10
        mov     r1, r11
        bl      __adddf3
        ldr     r2, [r9, #0x3C]
        ldr     r3, [r9, #0x40]
        mov     r10, r0
        mov     r11, r1
        mov     r0, r4
        mov     r1, r5
        bl      __adddf3
        ldr     r2, [r7, #0x3C]
        ldr     r3, [r7, #0x40]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r10
        mov     r1, r11
        bl      __adddf3
        ldr     r2, [r8, #0x3C]
        ldr     r3, [r8, #0x40]
        mov     r10, r1
        mov     r11, r0
        mov     r1, r5
        mov     r0, r4
        bl      __adddf3
        ldr     r2, [r6, #0x5C]
        ldr     r3, [r6, #0x60]!
        mov     r5, r1
        mov     r4, r0
        mov     r1, r10
        mov     r0, r11
        bl      __adddf3
        ldr     r2, [r9, #0x5C]
        ldr     r3, [r9, #0x60]!
        mov     r10, r1
        mov     r11, r0
        mov     r1, r5
        mov     r0, r4
        bl      __adddf3
        ldr     r2, [r7, #0x5C]
        ldr     r3, [r7, #0x60]!
        mov     r5, r1
        mov     r4, r0
        mov     r1, r10
        mov     r0, r11
        bl      __adddf3
        ldr     r2, [r8, #0x5C]
        ldr     r3, [r8, #0x60]!
        str     r0, [sp]
        mov     r10, r1
        mov     r0, r4
        mov     r1, r5
        bl      __adddf3
        ldr     r12, [sp, #4]
        ldr     r2, [sp, #8]
        mov     r4, r0
        add     r12, r12, #0xC
        str     r12, [sp, #4]
        cmp     r12, r2
        mov     r5, r1
        ble     LASO0
        ldr     r12, [sp, #0xC]
        ldr     lr, [sp, #0x10]
        ldr     r2, [sp, #0x14]
        ldr     r3, [sp, #4]
        ldr     r6, [sp, #0x1C]
        ldr     r1, [sp, #0x20]
        ldr     r0, [sp, #0x24]
LASO1:
        mov     r11, r3, lsl #3
        sub     r7, r11, #0x1C
        add     r11, r7, r12
        add     r9, r7, lr
        add     r8, r7, r2
        str     r6, [sp, #0x1C]
        add     r7, r7, r0
        str     r12, [sp, #0xC]
        str     lr, [sp, #0x10]
        str     r2, [sp, #0x14]
        str     r1, [sp, #0x20]
        str     r0, [sp, #0x24]
        mov     r6, r3
LASO2:
        ldr     r0, [sp]
        ldr     r2, [r7, #0x1C]
        ldr     r3, [r7, #0x20]!
        mov     r1, r10
        bl      __adddf3
        ldr     r2, [sp, #0x14]
        ldr     r3, [r8, #0x20]!
        ldr     r2, [r2, +r6, lsl #3]
        str     r0, [sp, #0x28]
        str     r1, [sp, #8]
        mov     r0, r4
        mov     r1, r5
        bl      __adddf3
        ldr     r2, [sp, #0x10]
        ldr     r3, [r9, #0x20]!
        mov     r4, r0
        ldr     r2, [r2, +r6, lsl #3]
        mov     r5, r1
        ldr     r0, [sp, #0x28]
        ldr     r1, [sp, #8]
        bl      __adddf3
        ldr     r2, [sp, #0xC]
        ldr     r3, [r11, #0x20]!
        mov     r10, r1
        ldr     r2, [r2, +r6, lsl #3]
        str     r0, [sp]
        mov     r0, r4
        mov     r1, r5
        bl      __adddf3
        ldr     r2, [sp, #0x18]
        add     r6, r6, #4
        mov     r4, r0
        mov     r5, r1
        cmp     r6, r2
        ble     LASO2
        mov     r3, r6
        ldr     r6, [sp, #0x1C]
        ldr     r1, [sp, #0x20]
        ldr     r0, [sp, #0x24]
LASO3:
        cmp     r3, r1
        bge     LASO7
        sub     r12, r1, r3
        cmp     r12, #6
        blt     LASO5
        mov     r12, r3, lsl #3
        sub     r12, r12, #4
        add     r9, r12, r0
        mov     r7, r0
        mov     r8, r6
        ldr     r0, [sp]
        sub     r11, r1, #6
        mov     r6, r1
        mov     r1, r10
        mov     r10, r3
LASO4:
        ldr     r2, [r9, #4]
        ldr     r3, [r9, #8]
        bl      __adddf3
        ldr     r2, [r9, #0xC]
        ldr     r3, [r9, #0x10]
        bl      __adddf3
        ldr     r2, [r9, #0x14]
        ldr     r3, [r9, #0x18]
        bl      __adddf3
        ldr     r2, [r9, #0x1C]
        ldr     r3, [r9, #0x20]
        bl      __adddf3
        ldr     r2, [r9, #0x24]
        ldr     r3, [r9, #0x28]!
        bl      __adddf3
        add     r10, r10, #5
        cmp     r10, r11
        ble     LASO4
        mov     r3, r10
        mov     r10, r1
        str     r0, [sp]
        mov     r1, r6
        mov     r6, r8
        mov     r0, r7
LASO5:
        mov     r12, r3, lsl #3
        sub     r12, r12, #4
        add     r7, r12, r0
        ldr     r0, [sp]
        mov     r9, r1
        mov     r8, r3
LASO6:
        ldr     r2, [r7, #4]
        ldr     r3, [r7, #8]!
        mov     r1, r10
        bl      __adddf3
        add     r8, r8, #1
        cmp     r8, r9
        mov     r10, r1
        blt     LASO6
        str     r0, [sp]
LASO7:
        mov     r0, r4
        mov     r1, r5
        ldr     r2, [sp]
        mov     r3, r10
        bl      __adddf3
        str     r0, [r6]
        mov     r0, #0
        str     r1, [r6, #4]
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LASO8:
        mov     r10, r3
        str     r10, [sp]
        mov     r4, r10
        mov     r5, r4
        add     r2, r0, #8
        add     lr, r0, #0x10
        add     r12, r0, #0x18
        b       LASO1
LASO9:
        mov     r10, r3
        str     r10, [sp]
        mov     r4, r10
        mov     r5, r4
        b       LASO3
LASO10:
        mvn     r0, #5
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LASO11:
        mvn     r0, #7
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}


