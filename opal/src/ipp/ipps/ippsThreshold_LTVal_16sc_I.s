        .text
        .align  4
        .globl  _ippsThreshold_LTVal_16sc_I


_ippsThreshold_LTVal_16sc_I:
        sub     sp, sp, #4
        cmp     r0, #0
        str     r3, [sp]
        beq     LAPG5
        cmp     r1, #0
        ble     LAPG4
        cmp     r2, #0
        blt     LAPG3
        mul     r2, r2, r2
        cmp     r1, #0
        ble     LAPG2
LAPG0:
        ldrsh   r12, [r0, #2]
        ldrsh   r3, [r0]
        mul     r12, r12, r12
        mla     r12, r3, r3, r12
        cmp     r12, r2
        bcs     LAPG1
        ldrsh   r3, [sp]
        ldrsh   r12, [sp, #2]
        strh    r3, [r0]
        strh    r12, [r0, #2]
LAPG1:
        subs    r1, r1, #1
        add     r0, r0, #4
        bne     LAPG0
LAPG2:
        mov     r0, #0
        add     sp, sp, #4
        bx      lr
LAPG3:
        mvn     r0, #0x12
        add     sp, sp, #4
        bx      lr
LAPG4:
        mvn     r0, #5
        add     sp, sp, #4
        bx      lr
LAPG5:
        mvn     r0, #7
        add     sp, sp, #4
        bx      lr


