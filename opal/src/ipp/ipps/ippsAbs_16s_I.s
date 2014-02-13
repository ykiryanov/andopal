        .text
        .align  4
        .globl  _ippsAbs_16s_I


_ippsAbs_16s_I:
        stmdb   sp!, {r4 - r7, lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r7, pc}
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r7, pc}
        mov     r2, #0xFF
        subs    r5, r1, #4
        orr     r2, r2, #0x7F, 24
        mov     r6, #0
        bmi     LDDQ5
        add     lr, r0, #2
        add     r12, r0, #4
        add     r3, r0, #6
        mov     r4, r0
LDDQ0:
        ldrsh   r7, [r4]
        cmp     r7, #0
        blt     LDDQ13
LDDQ1:
        ldrsh   r7, [lr]
        cmp     r7, #0
        blt     LDDQ12
LDDQ2:
        ldrsh   r7, [r12]
        cmp     r7, #0
        blt     LDDQ11
LDDQ3:
        ldrsh   r7, [r3]
        cmp     r7, #0
        blt     LDDQ10
LDDQ4:
        add     r6, r6, #4
        cmp     r6, r5
        add     r4, r4, #8
        add     lr, lr, #8
        add     r12, r12, #8
        add     r3, r3, #8
        ble     LDDQ0
LDDQ5:
        cmp     r6, r1
        bge     LDDQ8
        add     r0, r0, r6, lsl #1
LDDQ6:
        ldrsh   r3, [r0]
        cmp     r3, #0
        blt     LDDQ9
LDDQ7:
        add     r6, r6, #1
        cmp     r6, r1
        add     r0, r0, #2
        blt     LDDQ6
LDDQ8:
        mov     r0, #0
        ldmia   sp!, {r4 - r7, pc}
LDDQ9:
        cmn     r3, #2, 18
        moveq   r3, r2
        rsbne   r3, r3, #0
        strh    r3, [r0]
        b       LDDQ7
LDDQ10:
        cmn     r7, #2, 18
        moveq   r7, r2
        rsbne   r7, r7, #0
        strh    r7, [r3]
        b       LDDQ4
LDDQ11:
        cmn     r7, #2, 18
        moveq   r7, r2
        rsbne   r7, r7, #0
        strh    r7, [r12]
        b       LDDQ3
LDDQ12:
        cmn     r7, #2, 18
        moveq   r7, r2
        rsbne   r7, r7, #0
        strh    r7, [lr]
        b       LDDQ2
LDDQ13:
        cmn     r7, #2, 18
        moveq   r7, r2
        rsbne   r7, r7, #0
        strh    r7, [r4]
        b       LDDQ1


