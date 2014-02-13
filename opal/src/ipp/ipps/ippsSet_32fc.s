        .text
        .align  4
        .globl  _ippsSet_32fc


_ippsSet_32fc:
        stmdb   sp!, {r4, lr}
        sub     sp, sp, #8
        str     r0, [sp]
        cmp     r2, #0
        str     r1, [sp, #4]
        beq     LCVP3
        cmp     r3, #0
        ble     LCVP4
        cmp     r3, #6
        mov     r12, #0
        ldrlt   r0, [sp]
        ldrlt   r1, [sp, #4]
        blt     LCVP1
        ldr     r0, [sp]
        ldr     r1, [sp, #4]
        sub     r4, r3, #6
        sub     lr, r2, #4
LCVP0:
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
        ble     LCVP0
LCVP1:
        mov     lr, r12, lsl #3
        sub     lr, lr, #4
        add     r2, lr, r2
LCVP2:
        add     r12, r12, #1
        str     r0, [r2, #4]
        str     r1, [r2, #8]!
        cmp     r12, r3
        blt     LCVP2
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}
LCVP3:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}
LCVP4:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}


