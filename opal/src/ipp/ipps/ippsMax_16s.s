        .text
        .align  4
        .globl  _ippsMax_16s


_ippsMax_16s:
        stmdb   sp!, {r4 - r7, lr}
        cmp     r0, #0
        beq     LBGQ3
        cmp     r2, #0
        beq     LBGQ3
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r7, pc}
        cmp     r1, #6
        mov     r3, #0
        sublt   r12, r3, #2, 18
        blt     LBGQ1
        sub     r12, r3, #2, 18
        sub     r4, r1, #6
        mov     lr, r0
LBGQ0:
        ldrsh   r7, [lr]
        mov     r12, r12, lsl #16
        ldrsh   r6, [lr, #2]
        ldrsh   r5, [lr, #4]
        mov     r12, r12, asr #16
        cmp     r7, r12
        movgt   r12, r7
        cmp     r6, r12
        movgt   r12, r6
        ldrsh   r6, [lr, #6]
        cmp     r5, r12
        movgt   r12, r5
        ldrsh   r5, [lr, #8]
        cmp     r6, r12
        movgt   r12, r6
        add     lr, lr, #0xA
        cmp     r5, r12
        movgt   r12, r5
        add     r3, r3, #5
        cmp     r3, r4
        ble     LBGQ0
LBGQ1:
        add     r0, r0, r3, lsl #1
LBGQ2:
        ldrsh   lr, [r0], #2
        mov     r12, r12, lsl #16
        add     r3, r3, #1
        mov     r12, r12, asr #16
        cmp     lr, r12
        movgt   r12, lr
        cmp     r3, r1
        blt     LBGQ2
        mov     r0, #0
        strh    r12, [r2]
        ldmia   sp!, {r4 - r7, pc}
LBGQ3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r7, pc}


