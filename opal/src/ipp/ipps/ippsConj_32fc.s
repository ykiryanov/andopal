        .text
        .align  4
        .globl  _ippsConj_32fc


_ippsConj_32fc:
        stmdb   sp!, {r4 - r11, lr}
        cmp     r0, #0
        beq     LCXN6
        cmp     r1, #0
        beq     LCXN6
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r11, pc}
        and     r3, r2, #3
        sub     r2, r2, r3
        cmp     r2, #0
        ble     LCXN1
        mov     r10, #0
        sub     r9, r0, #4
        sub     r8, r1, #4
        sub     r7, r0, #0xC
        sub     r6, r1, #0xC
        sub     r5, r0, #0x14
        sub     r4, r1, #0x14
        sub     lr, r0, #0x1C
        sub     r12, r1, #0x1C
LCXN0:
        ldr     r11, [lr, #0x1C]
        add     r10, r10, #4
        cmp     r10, r2
        str     r11, [r12, #0x1C]
        ldr     r11, [lr, #0x20]!
        eor     r11, r11, #2, 2
        str     r11, [r12, #0x20]!
        ldr     r11, [r5, #0x1C]
        str     r11, [r4, #0x1C]
        ldr     r11, [r5, #0x20]!
        eor     r11, r11, #2, 2
        str     r11, [r4, #0x20]!
        ldr     r11, [r7, #0x1C]
        str     r11, [r6, #0x1C]
        ldr     r11, [r7, #0x20]!
        eor     r11, r11, #2, 2
        str     r11, [r6, #0x20]!
        ldr     r11, [r9, #0x1C]
        str     r11, [r8, #0x1C]
        ldr     r11, [r9, #0x20]!
        eor     r11, r11, #2, 2
        str     r11, [r8, #0x20]!
        blt     LCXN0
LCXN1:
        cmp     r3, #0
        beq     LCXN5
        add     r0, r0, r2, lsl #3
        cmp     r3, #0
        add     r2, r1, r2, lsl #3
        ble     LCXN5
        cmp     r3, #5
        mov     r4, #0
        blt     LCXN3
        sub     lr, r3, #5
        sub     r12, r0, #4
        sub     r1, r2, #4
LCXN2:
        ldr     r5, [r12, #4]
        add     r4, r4, #4
        cmp     r4, lr
        str     r5, [r1, #4]
        ldr     r5, [r12, #8]
        eor     r5, r5, #2, 2
        str     r5, [r1, #8]
        ldr     r5, [r12, #0xC]
        str     r5, [r1, #0xC]
        ldr     r5, [r12, #0x10]
        eor     r5, r5, #2, 2
        str     r5, [r1, #0x10]
        ldr     r5, [r12, #0x14]
        str     r5, [r1, #0x14]
        ldr     r5, [r12, #0x18]
        eor     r5, r5, #2, 2
        str     r5, [r1, #0x18]
        ldr     r5, [r12, #0x1C]
        str     r5, [r1, #0x1C]
        ldr     r5, [r12, #0x20]!
        eor     r5, r5, #2, 2
        str     r5, [r1, #0x20]!
        ble     LCXN2
LCXN3:
        mov     r1, r4, lsl #3
        sub     r1, r1, #4
        add     r0, r1, r0
        add     r2, r1, r2
LCXN4:
        ldr     r1, [r0, #4]
        add     r4, r4, #1
        cmp     r4, r3
        str     r1, [r2, #4]
        ldr     r1, [r0, #8]!
        eor     r1, r1, #2, 2
        str     r1, [r2, #8]!
        blt     LCXN4
LCXN5:
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LCXN6:
        mvn     r0, #7
        ldmia   sp!, {r4 - r11, pc}


