        .text
        .align  4
        .globl  _ippsSubCRev_8u_ISfs


_ippsSubCRev_8u_ISfs:
        stmdb   sp!, {r4, lr}
        cmp     r0, #0
        beq     LATQ4
        cmp     r3, #8
        bgt     LATQ4
        cmp     r1, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4, pc}
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4, pc}
        cmp     r3, #0
        mov     r12, #0
        bne     LATQ1
        cmp     r2, #0
        ble     LATQ3
LATQ0:
        ldrb    r3, [r1]
        mov     lr, r12
        sub     r3, r0, r3
        cmp     r3, #0
        movgt   lr, r3
        strb    lr, [r1], #1
        subs    r2, r2, #1
        bne     LATQ0
        mov     r0, #0
        ldmia   sp!, {r4, pc}
LATQ1:
        cmp     r3, #0
        ble     LATQ5
        sub     lr, r3, #1
        mov     r12, #1
        mov     lr, r12, lsl lr
        cmp     r2, #0
        sub     r12, lr, #1
        ble     LATQ3
LATQ2:
        ldrb    lr, [r1]
        sub     lr, r0, lr
        cmp     lr, #0
        movle   lr, #0
        mov     r4, lr, asr r3
        and     r4, r4, #1
        add     lr, r12, lr
        add     r4, lr, r4
        mov     lr, r4, asr r3
        strb    lr, [r1], #1
        subs    r2, r2, #1
        bne     LATQ2
LATQ3:
        mov     r0, #0
        ldmia   sp!, {r4, pc}
LATQ4:
        mov     r0, r1
        mov     r1, r2
        ldmia   sp!, {r4, lr}
        b       _ippsZero_8u
LATQ5:
        cmn     r3, #7
        mov     r12, #0xFF
        bge     LATQ7
        cmp     r2, #0
        ble     LATQ3
LATQ6:
        ldrb    r3, [r1]
        cmp     r3, r0
        movge   r3, #0
        movlt   r3, #0xFF
        strb    r3, [r1], #1
        subs    r2, r2, #1
        bne     LATQ6
        mov     r0, #0
        ldmia   sp!, {r4, pc}
LATQ7:
        cmp     r2, #0
        rsb     r3, r3, #0
        ble     LATQ3
LATQ8:
        ldrb    lr, [r1]
        sub     lr, r0, lr
        cmp     lr, #0
        movle   lr, #0
        mov     lr, lr, lsl r3
        cmp     lr, #0xFF
        mov     r4, r12
        movlt   r4, lr
        strb    r4, [r1], #1
        subs    r2, r2, #1
        bne     LATQ8
        mov     r0, #0
        ldmia   sp!, {r4, pc}


