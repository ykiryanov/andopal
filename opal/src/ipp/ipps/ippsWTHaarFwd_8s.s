        .text
        .align  4
        .globl  _ippsWTHaarFwd_8s


_ippsWTHaarFwd_8s:
        stmdb   sp!, {r4 - r10, lr}
        cmp     r0, #0
        beq     LAJJ2
        cmp     r2, #0
        beq     LAJJ2
        cmp     r3, #0
        beq     LAJJ2
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r10, pc}
        sub     r5, r1, #1
        cmp     r5, #0
        mov     r7, #0
        movle   r6, r7
        ble     LAJJ1
        mov     r6, r7
        mov     r4, r2
        mov     lr, r0
LAJJ0:
        ldrsb   r8, [lr, #1]
        ldrsb   r12, [lr]
        sub     r9, r8, r12
        and     r8, r9, #1
        and     r10, r8, r9, asr #1
        add     r12, r12, r9, asr #1
        add     r9, r10, r9, asr #1
        and     r8, r8, r12
        cmp     r9, #0x80
        add     r8, r12, r8
        moveq   r9, #0x7F
        strb    r8, [r4], #1
        add     r7, r7, #2
        strb    r9, [r3], #1
        cmp     r7, r5
        add     r6, r6, #1
        add     lr, lr, #2
        blt     LAJJ0
LAJJ1:
        tst     r1, #1
        ldrnesb r0, [r7, +r0]
        strneb  r0, [r6, +r2]
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LAJJ2:
        mvn     r0, #7
        ldmia   sp!, {r4 - r10, pc}


