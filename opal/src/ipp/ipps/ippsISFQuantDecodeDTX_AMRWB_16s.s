        .text
        .align  4
        .globl  _ippsISFQuantDecodeDTX_AMRWB_16s


_ippsISFQuantDecodeDTX_AMRWB_16s:
        stmdb   sp!, {r4 - r7, lr}
        mov     r3, r0
        cmp     r3, #0
        mov     r4, r1
        beq     LDIS0
        cmp     r4, #0
        beq     LDIS0
        ldrsh   lr, [r3]
        ldr     r2, [pc, #0x138]
        ldr     r12, [pc, #0x138]
        mov     lr, lr, lsl #2
        ldr     r6, [pc, #0x134]
        ldrsh   lr, [r2, +lr]
        ldr     r5, [pc, #0x130]
        ldr     r0, [pc, #0x130]
        strh    lr, [r4]
        ldrsh   lr, [r3]
        mov     r1, r4
        add     lr, r2, lr, lsl #2
        ldrsh   r2, [lr, #2]
        ldr     lr, [pc, #0x11C]
        strh    r2, [r4, #2]
        ldrsh   r2, [r3, #2]
        mov     r2, r2, lsl #3
        ldrsh   r7, [r6, +r2]
        mov     r2, #0x10
        strh    r7, [r4, #4]
        ldrsh   r7, [r3, #2]
        add     r7, r6, r7, lsl #3
        ldrsh   r7, [r7, #2]
        strh    r7, [r4, #6]
        ldrsh   r7, [r3, #2]
        add     r7, r6, r7, lsl #3
        ldrsh   r6, [r7, #4]
        strh    r6, [r4, #8]
        ldrsh   r6, [r3, #4]
        mov     r6, r6, lsl #3
        ldrsh   r6, [r12, +r6]
        strh    r6, [r4, #0xA]
        ldrsh   r6, [r3, #4]
        add     r6, r12, r6, lsl #3
        ldrsh   r6, [r6, #2]
        strh    r6, [r4, #0xC]
        ldrsh   r6, [r3, #4]
        add     r6, r12, r6, lsl #3
        ldrsh   r12, [r6, #4]
        strh    r12, [r4, #0xE]
        ldrsh   r12, [r3, #6]
        mov     r12, r12, lsl #3
        ldrsh   r12, [lr, +r12]
        strh    r12, [r4, #0x10]
        ldrsh   r12, [r3, #6]
        add     r12, lr, r12, lsl #3
        ldrsh   r12, [r12, #2]
        strh    r12, [r4, #0x12]
        ldrsh   r12, [r3, #6]
        add     r12, lr, r12, lsl #3
        ldrsh   r12, [r12, #4]
        strh    r12, [r4, #0x14]
        ldrsh   r12, [r3, #6]
        add     r12, lr, r12, lsl #3
        ldrsh   r12, [r12, #6]
        strh    r12, [r4, #0x16]
        ldrsh   r12, [r3, #8]
        mov     r12, r12, lsl #3
        ldrsh   r12, [r5, +r12]
        strh    r12, [r4, #0x18]
        ldrsh   r12, [r3, #8]
        add     r12, r5, r12, lsl #3
        ldrsh   r12, [r12, #2]
        strh    r12, [r4, #0x1A]
        ldrsh   r12, [r3, #8]
        add     r12, r5, r12, lsl #3
        ldrsh   r12, [r12, #4]
        strh    r12, [r4, #0x1C]
        ldrsh   r3, [r3, #8]
        add     r3, r5, r3, lsl #3
        ldrsh   r3, [r3, #6]
        strh    r3, [r4, #0x1E]
        bl      _ippsAdd_16s_I
        mov     r0, r4
        mov     r2, #0xF
        mov     r1, #0x80
        bl      ReorderLsf
        mov     r0, #0
        ldmia   sp!, {r4 - r7, pc}
LDIS0:
        mvn     r0, #7
        ldmia   sp!, {r4 - r7, pc}
        .long   QCdbk1ISFnoiseTbl
        .long   QCdbk3ISFnoiseTbl
        .long   QCdbk2ISFnoiseTbl
        .long   QCdbk5ISFnoiseTbl
        .long   meanISFnoiseTbl
        .long   QCdbk4ISFnoiseTbl


