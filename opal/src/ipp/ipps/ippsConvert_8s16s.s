        .text
        .align  4
        .globl  _ippsConvert_8s16s


_ippsConvert_8s16s:
        stmdb   sp!, {r4, r5, lr}
        cmp     r0, #0
        beq     LCVW3
        cmp     r1, #0
        beq     LCVW3
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4, r5, pc}
        cmp     r2, #6
        mov     r3, #0
        blt     LCVW1
        sub     r4, r2, #6
        sub     lr, r0, #1
        mov     r12, r1
LCVW0:
        ldrsb   r5, [lr, #1]
        add     r3, r3, #5
        cmp     r3, r4
        strh    r5, [r12]
        ldrsb   r5, [lr, #2]
        strh    r5, [r12, #2]
        ldrsb   r5, [lr, #3]
        strh    r5, [r12, #4]
        ldrsb   r5, [lr, #4]
        strh    r5, [r12, #6]
        ldrsb   r5, [lr, #5]!
        strh    r5, [r12, #8]
        add     r12, r12, #0xA
        ble     LCVW0
LCVW1:
        add     r1, r1, r3, lsl #1
        add     r0, r3, r0
LCVW2:
        ldrsb   r12, [r0], #1
        add     r3, r3, #1
        cmp     r3, r2
        strh    r12, [r1], #2
        blt     LCVW2
        mov     r0, #0
        ldmia   sp!, {r4, r5, pc}
LCVW3:
        mvn     r0, #7
        ldmia   sp!, {r4, r5, pc}


