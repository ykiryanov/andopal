        .text
        .align  4
        .globl  _ippsFIRLMSMRPutVal32s_16s


_ippsFIRLMSMRPutVal32s_16s:
        stmdb   sp!, {r4, lr}
        cmp     r1, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4, pc}
        ldr     r3, [r1]
        ldr     r2, [pc, #0x3C]
        cmp     r2, r3
        mvnne   r0, #0x10
        ldmneia sp!, {r4, pc}
        ldr     lr, [r1, #0x1C]
        ldr     r12, [r1, #0x14]
        ldr     r2, [r1, #8]
        mov     r3, lr, lsl #1
        add     lr, lr, #1
        add     r4, r3, r12, lsl #1
        strh    r0, [r2, +r4]
        cmp     lr, r12
        strh    r0, [r2, +r3]
        movge   lr, #0
        mov     r0, #0
        str     lr, [r1, #0x1C]
        ldmia   sp!, {r4, pc}
        .long   0x4c4d5352


