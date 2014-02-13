        .text
        .align  4
        .globl  _ippsSwapBytes_24u_I


_ippsSwapBytes_24u_I:
        stmdb   sp!, {r4 - r8, lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r8, pc}
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r8, pc}
        add     r1, r1, r1, lsl #1
        cmp     r1, #0
        ble     LARY3
        cmp     r1, #0xF
        mov     r2, #0
        blt     LARY1
        sub     r12, r1, #0xF
        sub     r3, r0, #1
LARY0:
        ldrb    r7, [r3, #1]
        ldrb    r8, [r3, #3]
        ldrb    r4, [r3, #4]
        ldrb    lr, [r3, #6]
        ldrb    r6, [r3, #7]
        ldrb    r5, [r3, #9]
        strb    r8, [r3, #1]
        ldrb    r8, [r3, #0xA]
        strb    r7, [r3, #3]
        ldrb    r7, [r3, #0xC]
        add     r2, r2, #0xC
        strb    lr, [r3, #4]
        strb    r4, [r3, #6]
        strb    r5, [r3, #7]
        strb    r6, [r3, #9]
        strb    r7, [r3, #0xA]
        strb    r8, [r3, #0xC]!
        cmp     r2, r12
        ble     LARY0
LARY1:
        sub     r3, r2, #1
        add     r0, r3, r0
LARY2:
        ldrb    r12, [r0, #1]
        ldrb    r3, [r0, #3]
        add     r2, r2, #3
        strb    r12, [r0, #3]
        cmp     r2, r1
        strb    r3, [r0, #1]
        add     r0, r0, #3
        blt     LARY2
LARY3:
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}


