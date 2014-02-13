        .text
        .align  4
        .globl  _ippsFIRLMSMRPutVal32sc_16sc


_ippsFIRLMSMRPutVal32sc_16sc:
        stmdb   sp!, {r1, r4, r5, lr}
        cmp     r1, #0
        str     r0, [sp]
        beq     LBWE1
        ldr     r2, [r1]
        ldr     r0, [pc, #0x60]
        cmp     r0, r2
        bne     LBWE0
        ldr     r3, [r1, #0x1C]
        ldr     r0, [r1, #0x14]
        ldr     lr, [r1, #8]
        ldrsh   r4, [sp]
        mov     r12, r3, lsl #2
        ldrsh   r2, [sp, #2]
        add     r5, r12, r0, lsl #2
        strh    r4, [r5, +lr]
        strh    r4, [lr, +r12]
        add     r5, lr, r5
        strh    r2, [r5, #2]
        add     r3, r3, #1
        add     lr, r12, lr
        cmp     r3, r0
        strh    r2, [lr, #2]
        movge   r3, #0
        mov     r0, #0
        str     r3, [r1, #0x1C]
        ldmia   sp!, {r1, r4, r5, pc}
LBWE0:
        mvn     r0, #0x10
        ldmia   sp!, {r1, r4, r5, pc}
LBWE1:
        mvn     r0, #7
        ldmia   sp!, {r1, r4, r5, pc}
        .long   0x4c4d5343


