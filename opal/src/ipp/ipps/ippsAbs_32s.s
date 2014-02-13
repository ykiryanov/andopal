        .text
        .align  4
        .globl  _ippsAbs_32s


_ippsAbs_32s:
        cmp     r0, #0
        beq     LDDN4
        cmp     r1, #0
        beq     LDDN4
        cmp     r2, #0
        mvnle   r0, #5
        bxle    lr
        cmp     r2, #0
        ble     LDDN2
        mvn     r3, #2, 2
LDDN0:
        ldr     r12, [r0], #4
        cmp     r12, #0
        blt     LDDN3
LDDN1:
        str     r12, [r1], #4
        subs    r2, r2, #1
        bne     LDDN0
LDDN2:
        mov     r0, #0
        bx      lr
LDDN3:
        cmp     r12, #2, 2
        moveq   r12, r3
        rsbne   r12, r12, #0
        b       LDDN1
LDDN4:
        mvn     r0, #7
        bx      lr


