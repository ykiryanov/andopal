        .text
        .align  4
        .globl  _ippsFIRLMSMRGetDlyVal32sc_16sc


_ippsFIRLMSMRGetDlyVal32sc_16sc:
        cmp     r0, #0
        beq     LBWQ2
        cmp     r1, #0
        beq     LBWQ2
        ldr     r12, [r0]
        ldr     r3, [pc, #0x6C]
        cmp     r3, r12
        mvnne   r0, #0x10
        bxne    lr
        cmp     r2, #0
        blt     LBWQ0
        ldr     r3, [r0, #0x14]
        cmp     r2, r3
        ble     LBWQ1
LBWQ0:
        mvn     r0, #4
        bx      lr
LBWQ1:
        ldr     r3, [r0, #0x1C]
        ldr     r12, [r0, #0x18]
        sub     r2, r2, #1
        add     r3, r3, r12
        ldr     r12, [r0, #0x10]
        ldr     r0, [r0, #8]
        add     r12, r3, r12
        add     r2, r12, r2
        mov     r3, r2, lsl #2
        ldrsh   r2, [r0, +r3]
        add     r3, r0, r3
        mov     r0, #0
        strh    r2, [r1]
        ldrsh   r2, [r3, #2]
        strh    r2, [r1, #2]
        bx      lr
LBWQ2:
        mvn     r0, #7
        bx      lr
        .long   0x4c4d5343


