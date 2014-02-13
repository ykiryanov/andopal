        .text
        .align  4
        .globl  _ippsThreshold_GTVal_16sc_I


_ippsThreshold_GTVal_16sc_I:
        sub     sp, sp, #4
        cmp     r0, #0
        str     r3, [sp]
        beq     LAQW5
        cmp     r1, #0
        ble     LAQW4
        cmp     r2, #0
        blt     LAQW3
        mul     r2, r2, r2
        cmp     r1, #0
        ble     LAQW2
LAQW0:
        ldrsh   r12, [r0, #2]
        ldrsh   r3, [r0]
        mul     r12, r12, r12
        mla     r12, r3, r3, r12
        cmp     r12, r2
        bls     LAQW1
        ldrsh   r3, [sp]
        ldrsh   r12, [sp, #2]
        strh    r3, [r0]
        strh    r12, [r0, #2]
LAQW1:
        subs    r1, r1, #1
        add     r0, r0, #4
        bne     LAQW0
LAQW2:
        mov     r0, #0
        add     sp, sp, #4
        bx      lr
LAQW3:
        mvn     r0, #0x12
        add     sp, sp, #4
        bx      lr
LAQW4:
        mvn     r0, #5
        add     sp, sp, #4
        bx      lr
LAQW5:
        mvn     r0, #7
        add     sp, sp, #4
        bx      lr


