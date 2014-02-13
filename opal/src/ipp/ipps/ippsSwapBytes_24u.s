        .text
        .align  4
        .globl  _ippsSwapBytes_24u


_ippsSwapBytes_24u:
        stmdb   sp!, {r4 - r6, lr}
        cmp     r0, #0
        beq     LARZ4
        cmp     r1, #0
        beq     LARZ4
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r6, pc}
        add     r2, r2, r2, lsl #1
        cmp     r2, #0
        ble     LARZ3
        cmp     r2, #0xC
        mov     r4, #0
        blt     LARZ1
        sub     lr, r2, #0xC
        sub     r12, r0, #2
        sub     r3, r1, #1
LARZ0:
        ldrb    r6, [r12, #4]
        ldrb    r5, [r12, #2]
        add     r4, r4, #9
        strb    r6, [r3, #1]
        ldrb    r6, [r12, #3]
        strb    r5, [r3, #3]
        cmp     r4, lr
        strb    r6, [r3, #2]
        ldrb    r6, [r12, #7]
        ldrb    r5, [r12, #5]
        strb    r6, [r3, #4]
        ldrb    r6, [r12, #6]
        strb    r5, [r3, #6]
        strb    r6, [r3, #5]
        ldrb    r6, [r12, #0xA]
        ldrb    r5, [r12, #8]
        strb    r6, [r3, #7]
        ldrb    r6, [r12, #9]!
        strb    r5, [r3, #9]
        strb    r6, [r3, #8]
        add     r3, r3, #9
        ble     LARZ0
LARZ1:
        sub     r3, r4, #2
        add     r0, r3, r0
        sub     r3, r4, #1
        add     r1, r3, r1
LARZ2:
        ldrb    r12, [r0, #4]
        ldrb    r3, [r0, #2]
        add     r4, r4, #3
        strb    r12, [r1, #1]
        ldrb    r12, [r0, #3]!
        strb    r3, [r1, #3]
        cmp     r4, r2
        strb    r12, [r1, #2]
        add     r1, r1, #3
        blt     LARZ2
LARZ3:
        mov     r0, #0
        ldmia   sp!, {r4 - r6, pc}
LARZ4:
        mvn     r0, #7
        ldmia   sp!, {r4 - r6, pc}


