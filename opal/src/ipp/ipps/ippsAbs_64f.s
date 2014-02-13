        .text
        .align  4
        .globl  _ippsAbs_64f


_ippsAbs_64f:
        stmdb   sp!, {r1, r4 - r11, lr}
        cmp     r0, #0
        beq     LDDL7
        cmp     r1, #0
        beq     LDDL7
        cmp     r2, #0
        ble     LDDL6
        subs    r10, r2, #4
        mov     r3, #0
        bmi     LDDL1
        sub     r9, r1, #4
        sub     r8, r0, #4
        sub     r7, r1, #0xC
        sub     r6, r0, #0xC
        sub     r5, r1, #0x14
        sub     r4, r0, #0x14
        sub     lr, r1, #0x1C
        sub     r12, r0, #0x1C
        str     r0, [sp]
LDDL0:
        ldr     r11, [r12, #0x20]
        ldr     r0, [r12, #0x1C]
        add     r3, r3, #4
        bic     r11, r11, #2, 2
        str     r11, [lr, #0x20]
        str     r0, [lr, #0x1C]
        ldr     r11, [r4, #0x20]
        ldr     r0, [r4, #0x1C]
        cmp     r3, r10
        bic     r11, r11, #2, 2
        str     r11, [r5, #0x20]
        str     r0, [r5, #0x1C]
        ldr     r11, [r6, #0x20]
        ldr     r0, [r6, #0x1C]
        add     r12, r12, #0x20
        bic     r11, r11, #2, 2
        str     r11, [r7, #0x20]
        str     r0, [r7, #0x1C]
        ldr     r11, [r8, #0x20]
        ldr     r0, [r8, #0x1C]
        add     lr, lr, #0x20
        bic     r11, r11, #2, 2
        str     r11, [r9, #0x20]
        str     r0, [r9, #0x1C]
        add     r4, r4, #0x20
        add     r6, r6, #0x20
        add     r8, r8, #0x20
        add     r9, r9, #0x20
        add     r7, r7, #0x20
        add     r5, r5, #0x20
        ble     LDDL0
        ldr     r0, [sp]
LDDL1:
        cmp     r3, r2
        bge     LDDL5
        sub     r12, r2, r3
        cmp     r12, #6
        blt     LDDL3
        mov     r12, r3, lsl #3
        sub     r12, r12, #4
        add     lr, r12, r1
        sub     r4, r2, #6
        add     r12, r12, r0
LDDL2:
        ldr     r6, [r12, #8]
        ldr     r5, [r12, #4]
        add     r3, r3, #5
        bic     r6, r6, #2, 2
        str     r6, [lr, #8]
        str     r5, [lr, #4]
        ldr     r6, [r12, #0x10]
        ldr     r5, [r12, #0xC]
        cmp     r3, r4
        bic     r6, r6, #2, 2
        str     r6, [lr, #0x10]
        str     r5, [lr, #0xC]
        ldr     r6, [r12, #0x18]
        ldr     r5, [r12, #0x14]
        bic     r6, r6, #2, 2
        str     r6, [lr, #0x18]
        str     r5, [lr, #0x14]
        ldr     r6, [r12, #0x20]
        ldr     r5, [r12, #0x1C]
        bic     r6, r6, #2, 2
        str     r6, [lr, #0x20]
        str     r5, [lr, #0x1C]
        ldr     r6, [r12, #0x28]
        ldr     r5, [r12, #0x24]
        add     r12, r12, #0x28
        bic     r6, r6, #2, 2
        str     r6, [lr, #0x28]
        str     r5, [lr, #0x24]
        add     lr, lr, #0x28
        ble     LDDL2
LDDL3:
        mov     r12, r3, lsl #3
        sub     r12, r12, #4
        add     r1, r12, r1
        add     r0, r12, r0
LDDL4:
        ldr     lr, [r0, #8]
        ldr     r12, [r0, #4]
        add     r3, r3, #1
        bic     lr, lr, #2, 2
        str     lr, [r1, #8]
        str     r12, [r1, #4]
        cmp     r3, r2
        add     r0, r0, #8
        add     r1, r1, #8
        blt     LDDL4
LDDL5:
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LDDL6:
        mvn     r0, #5
        ldmia   sp!, {r1, r4 - r11, pc}
LDDL7:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r11, pc}


