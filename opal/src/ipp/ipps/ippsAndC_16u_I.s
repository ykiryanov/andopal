        .text
        .align  4
        .globl  _ippsAndC_16u_I


_ippsAndC_16u_I:
        stmdb   sp!, {r4 - r8, lr}
        cmp     r0, #0
        beq     LBKH3
        cmp     r1, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r8, pc}
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r8, pc}
        cmp     r2, #6
        mov     lr, #0
        blt     LBKH1
        sub     r12, r2, #6
        mov     r3, r1
LBKH0:
        ldrh    r8, [r3]
        ldrh    r7, [r3, #2]
        ldrh    r6, [r3, #4]
        ldrh    r5, [r3, #6]
        ldrh    r4, [r3, #8]
        and     r8, r8, r0
        and     r7, r7, r0
        and     r6, r6, r0
        and     r5, r5, r0
        and     r4, r4, r0
        add     lr, lr, #5
        strh    r8, [r3]
        strh    r7, [r3, #2]
        strh    r6, [r3, #4]
        strh    r5, [r3, #6]
        strh    r4, [r3, #8]
        cmp     lr, r12
        add     r3, r3, #0xA
        ble     LBKH0
LBKH1:
        add     r1, r1, lr, lsl #1
LBKH2:
        ldrh    r3, [r1]
        add     lr, lr, #1
        cmp     lr, r2
        and     r3, r3, r0
        strh    r3, [r1], #2
        blt     LBKH2
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}
LBKH3:
        mov     r0, r1
        mov     r1, r2
        ldmia   sp!, {r4 - r8, lr}
        b       _ippsZero_16s


