        .text
        .align  4
        .globl  _ippsMinAbsIndx_16s


_ippsMinAbsIndx_16s:
        stmdb   sp!, {r4 - r7, lr}
        cmp     r0, #0
        beq     LBGZ2
        cmp     r2, #0
        beq     LBGZ2
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r7, pc}
        cmp     r3, #0
        ldmeqia sp!, {r4 - r7, lr}
        beq     _ippsMinAbs_16s
        ldrsh   r4, [r0]
        mov     r12, #0xFF
        orr     r12, r12, #0x7F, 24
        eor     r5, r4, r4, asr #31
        mov     lr, #0
        sub     r4, r5, r4, asr #31
        cmp     r12, r4
        movlt   r4, r12
        cmp     r1, #1
        ble     LBGZ1
        add     r0, r0, #2
        mov     r5, #1
LBGZ0:
        ldrsh   r6, [r0], #2
        eor     r7, r6, r6, asr #31
        sub     r7, r7, r6, asr #31
        cmp     r12, r7
        movlt   r7, r12
        cmp     r4, r7
        movgt   r4, r7
        movgt   lr, r5
        add     r5, r5, #1
        cmp     r5, r1
        blt     LBGZ0
LBGZ1:
        strh    r4, [r2]
        mov     r0, #0
        str     lr, [r3]
        ldmia   sp!, {r4 - r7, pc}
LBGZ2:
        mvn     r0, #7
        ldmia   sp!, {r4 - r7, pc}


