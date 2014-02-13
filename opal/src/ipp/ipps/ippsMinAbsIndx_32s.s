        .text
        .align  4
        .globl  _ippsMinAbsIndx_32s


_ippsMinAbsIndx_32s:
        stmdb   sp!, {r4 - r7, lr}
        cmp     r0, #0
        beq     LBGY2
        cmp     r2, #0
        beq     LBGY2
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r7, pc}
        cmp     r3, #0
        ldmeqia sp!, {r4 - r7, lr}
        beq     _ippsMinAbs_32s
        ldr     r5, [r0]
        mov     lr, #0
        mvn     r12, #2, 2
        eor     r4, r5, r5, asr #31
        sub     r4, r4, r5, asr #31
        cmn     r4, #6, 2
        movhi   r4, r12
        cmp     r1, #1
        ble     LBGY1
        add     r0, r0, #4
        mov     r5, #1
LBGY0:
        ldr     r6, [r0], #4
        eor     r7, r6, r6, asr #31
        sub     r7, r7, r6, asr #31
        cmn     r7, #6, 2
        movhi   r7, r12
        cmp     r4, r7
        movhi   r4, r7
        movhi   lr, r5
        add     r5, r5, #1
        cmp     r5, r1
        blt     LBGY0
LBGY1:
        str     r4, [r2]
        mov     r0, #0
        str     lr, [r3]
        ldmia   sp!, {r4 - r7, pc}
LBGY2:
        mvn     r0, #7
        ldmia   sp!, {r4 - r7, pc}


