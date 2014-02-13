        .text
        .align  4
        .globl  _ippsMin_16s


_ippsMin_16s:
        stmdb   sp!, {r4 - r7, lr}
        cmp     r0, #0
        beq     LBGE3
        cmp     r2, #0
        beq     LBGE3
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r7, pc}
        mov     r3, #0xFF
        orr     r12, r3, #0x7F, 24
        cmp     r1, #6
        mov     r3, #0
        blt     LBGE1
        sub     r4, r1, #6
        mov     lr, r0
LBGE0:
        ldrsh   r7, [lr]
        mov     r12, r12, lsl #16
        ldrsh   r6, [lr, #2]
        ldrsh   r5, [lr, #4]
        mov     r12, r12, asr #16
        cmp     r7, r12
        movlt   r12, r7
        cmp     r6, r12
        movlt   r12, r6
        ldrsh   r6, [lr, #6]
        cmp     r5, r12
        movlt   r12, r5
        ldrsh   r5, [lr, #8]
        cmp     r6, r12
        movlt   r12, r6
        add     lr, lr, #0xA
        cmp     r5, r12
        movlt   r12, r5
        add     r3, r3, #5
        cmp     r3, r4
        ble     LBGE0
LBGE1:
        add     r0, r0, r3, lsl #1
LBGE2:
        ldrsh   lr, [r0], #2
        mov     r12, r12, lsl #16
        add     r3, r3, #1
        mov     r12, r12, asr #16
        cmp     lr, r12
        movlt   r12, lr
        cmp     r3, r1
        blt     LBGE2
        mov     r0, #0
        strh    r12, [r2]
        ldmia   sp!, {r4 - r7, pc}
LBGE3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r7, pc}


