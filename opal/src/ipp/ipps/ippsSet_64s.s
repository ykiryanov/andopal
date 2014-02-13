        .text
        .align  4
        .globl  _ippsSet_64s


_ippsSet_64s:
        stmdb   sp!, {r4, lr}
        cmp     r2, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4, pc}
        cmp     r3, #0
        mvnle   r0, #5
        ldmleia sp!, {r4, pc}
        cmp     r3, #6
        mov     r12, #0
        blt     LBMY1
        sub     r4, r3, #6
        sub     lr, r2, #4
LBMY0:
        add     r12, r12, #5
        str     r0, [lr, #4]
        str     r1, [lr, #8]
        str     r0, [lr, #0xC]
        str     r1, [lr, #0x10]
        str     r0, [lr, #0x14]
        str     r1, [lr, #0x18]
        str     r0, [lr, #0x1C]
        str     r1, [lr, #0x20]
        str     r0, [lr, #0x24]
        str     r1, [lr, #0x28]!
        cmp     r12, r4
        ble     LBMY0
LBMY1:
        mov     lr, r12, lsl #3
        sub     lr, lr, #4
        add     r2, lr, r2
LBMY2:
        add     r12, r12, #1
        str     r0, [r2, #4]
        str     r1, [r2, #8]!
        cmp     r12, r3
        blt     LBMY2
        mov     r0, #0
        ldmia   sp!, {r4, pc}


