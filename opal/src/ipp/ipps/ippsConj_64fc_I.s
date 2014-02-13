        .text
        .align  4
        .globl  _ippsConj_64fc_I


_ippsConj_64fc_I:
        stmdb   sp!, {r4 - r8, lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r8, pc}
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r8, pc}
        and     r2, r1, #3
        sub     r3, r1, r2
        cmp     r3, #0
        mov     r1, #0
        ble     LCXK1
        mov     r6, r1
        sub     r5, r0, #4
        sub     r4, r0, #0x14
        sub     lr, r0, #0x24
        sub     r12, r0, #0x34
LCXK0:
        ldr     r8, [r12, #0x40]
        ldr     r7, [r12, #0x3C]
        add     r6, r6, #4
        eor     r8, r8, #2, 2
        str     r8, [r12, #0x40]
        str     r7, [r12, #0x3C]
        ldr     r8, [lr, #0x40]
        ldr     r7, [lr, #0x3C]
        add     r12, r12, #0x40
        eor     r8, r8, #2, 2
        str     r8, [lr, #0x40]
        str     r7, [lr, #0x3C]
        ldr     r8, [r4, #0x40]
        ldr     r7, [r4, #0x3C]
        add     lr, lr, #0x40
        eor     r8, r8, #2, 2
        str     r8, [r4, #0x40]
        str     r7, [r4, #0x3C]
        ldr     r8, [r5, #0x40]
        ldr     r7, [r5, #0x3C]
        add     r4, r4, #0x40
        eor     r8, r8, #2, 2
        str     r8, [r5, #0x40]
        str     r7, [r5, #0x3C]
        cmp     r6, r3
        add     r5, r5, #0x40
        blt     LCXK0
LCXK1:
        cmp     r2, #0
        beq     LCXK5
        cmp     r2, #0
        add     r3, r0, r3, lsl #4
        ble     LCXK5
        cmp     r2, #6
        blt     LCXK3
        sub     r12, r2, #6
        sub     r0, r3, #0x44
LCXK2:
        ldr     lr, [r0, #0x4C]
        ldr     r5, [r0, #0x50]
        add     r4, r1, #1
        str     lr, [r0, #0x4C]
        add     lr, r3, r4, lsl #4
        eor     r5, r5, #2, 2
        str     r5, [r0, #0x50]!
        ldr     r5, [lr, #0xC]
        ldr     r4, [lr, #8]
        eor     r5, r5, #2, 2
        str     r5, [lr, #0xC]
        str     r4, [lr, #8]
        add     lr, r1, #2
        add     r5, r1, #3
        add     lr, r3, lr, lsl #4
        ldr     r6, [lr, #0xC]
        ldr     r4, [lr, #8]
        eor     r6, r6, #2, 2
        str     r6, [lr, #0xC]
        str     r4, [lr, #8]
        add     lr, r3, r5, lsl #4
        ldr     r6, [lr, #0xC]
        ldr     r4, [lr, #8]
        add     r5, r1, #4
        eor     r6, r6, #2, 2
        str     r6, [lr, #0xC]
        str     r4, [lr, #8]
        add     r5, r3, r5, lsl #4
        ldr     r4, [r5, #0xC]
        ldr     lr, [r5, #8]
        add     r1, r1, #5
        eor     r4, r4, #2, 2
        cmp     r1, r12
        str     lr, [r5, #8]
        str     r4, [r5, #0xC]
        ble     LCXK2
LCXK3:
        mov     r0, r1, lsl #4
        sub     r0, r0, #4
        add     r3, r0, r3
LCXK4:
        ldr     r12, [r3, #0x10]
        ldr     r0, [r3, #0xC]
        add     r1, r1, #1
        eor     r12, r12, #2, 2
        str     r12, [r3, #0x10]
        str     r0, [r3, #0xC]
        cmp     r1, r2
        add     r3, r3, #0x10
        blt     LCXK4
LCXK5:
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}


