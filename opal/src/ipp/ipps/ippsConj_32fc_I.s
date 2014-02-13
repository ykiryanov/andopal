        .text
        .align  4
        .globl  _ippsConj_32fc_I


_ippsConj_32fc_I:
        stmdb   sp!, {r4 - r7, lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r7, pc}
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r7, pc}
        and     r2, r1, #3
        sub     r3, r1, r2
        cmp     r3, #0
        mov     r1, #0
        ble     LCXM1
        mov     r6, r1
        sub     r5, r0, #4
        sub     r4, r0, #0xC
        sub     lr, r0, #0x14
        sub     r12, r0, #0x1C
LCXM0:
        ldr     r7, [r12, #0x20]
        add     r6, r6, #4
        cmp     r6, r3
        eor     r7, r7, #2, 2
        str     r7, [r12, #0x20]!
        ldr     r7, [lr, #0x20]
        eor     r7, r7, #2, 2
        str     r7, [lr, #0x20]!
        ldr     r7, [r4, #0x20]
        eor     r7, r7, #2, 2
        str     r7, [r4, #0x20]!
        ldr     r7, [r5, #0x20]
        eor     r7, r7, #2, 2
        str     r7, [r5, #0x20]!
        blt     LCXM0
LCXM1:
        cmp     r2, #0
        beq     LCXM5
        cmp     r2, #0
        add     r3, r0, r3, lsl #3
        ble     LCXM5
        cmp     r2, #6
        blt     LCXM3
        sub     r12, r2, #6
        sub     r0, r3, #0x24
LCXM2:
        ldr     r4, [r0, #0x28]
        add     lr, r1, #1
        eor     r4, r4, #2, 2
        str     r4, [r0, #0x28]!
        add     lr, r3, lr, lsl #3
        ldr     r5, [lr, #4]
        add     r4, r1, #2
        eor     r5, r5, #2, 2
        str     r5, [lr, #4]
        add     lr, r3, r4, lsl #3
        ldr     r5, [lr, #4]
        add     r4, r1, #3
        eor     r5, r5, #2, 2
        str     r5, [lr, #4]
        add     lr, r3, r4, lsl #3
        ldr     r5, [lr, #4]
        add     r4, r1, #4
        add     r1, r1, #5
        eor     r5, r5, #2, 2
        str     r5, [lr, #4]
        add     r4, r3, r4, lsl #3
        ldr     lr, [r4, #4]
        cmp     r1, r12
        eor     lr, lr, #2, 2
        str     lr, [r4, #4]
        ble     LCXM2
LCXM3:
        mov     r0, r1, lsl #3
        sub     r0, r0, #4
        add     r3, r0, r3
LCXM4:
        ldr     r0, [r3, #8]
        add     r1, r1, #1
        cmp     r1, r2
        eor     r0, r0, #2, 2
        str     r0, [r3, #8]!
        blt     LCXM4
LCXM5:
        mov     r0, #0
        ldmia   sp!, {r4 - r7, pc}


