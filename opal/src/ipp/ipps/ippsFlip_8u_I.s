        .text
        .align  4
        .globl  _ippsFlip_8u_I


_ippsFlip_8u_I:
        stmdb   sp!, {r4 - r6, lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r6, pc}
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r6, pc}
        mov     r4, r1, asr #1
        cmp     r4, #0
        sub     r2, r1, #1
        ble     LASC3
        cmp     r4, #5
        mov     lr, #0
        blt     LASC1
        add     r1, r2, #1
        add     r1, r1, r0
        sub     r12, r4, #5
        sub     r3, r0, #1
LASC0:
        ldrb    r6, [r1, #-1]
        ldrb    r5, [r3, #1]
        add     lr, lr, #4
        strb    r6, [r3, #1]
        ldrb    r6, [r1, #-2]
        strb    r5, [r1, #-1]
        ldrb    r5, [r3, #2]
        strb    r6, [r3, #2]
        ldrb    r6, [r1, #-3]
        strb    r5, [r1, #-2]
        ldrb    r5, [r3, #3]
        strb    r6, [r3, #3]
        ldrb    r6, [r1, #-4]
        strb    r5, [r1, #-3]
        ldrb    r5, [r3, #4]
        strb    r6, [r3, #4]!
        cmp     lr, r12
        strb    r5, [r1, #-4]!
        sub     r2, r2, #4
        ble     LASC0
LASC1:
        add     r2, r2, r0
        add     r0, lr, r0
LASC2:
        ldrb    r3, [r2]
        ldrb    r1, [r0]
        add     lr, lr, #1
        strb    r3, [r0], #1
        cmp     lr, r4
        strb    r1, [r2], #-1
        blt     LASC2
LASC3:
        mov     r0, #0
        ldmia   sp!, {r4 - r6, pc}


