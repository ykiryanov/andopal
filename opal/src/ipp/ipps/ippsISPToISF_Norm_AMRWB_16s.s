        .text
        .align  4
        .globl  _ippsISPToISF_Norm_AMRWB_16s


_ippsISPToISF_Norm_AMRWB_16s:
        stmdb   sp!, {r4 - r9, lr}
        cmp     r0, #0
        beq     LDIN4
        cmp     r1, #0
        beq     LDIN4
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r9, pc}
        subs    r6, r2, #1
        bmi     LDIN3
        ldr     lr, [pc, #0x94]
        ldr     r12, [pc, #0x94]
        add     r0, r0, r6, lsl #1
        mov     r5, #0x7F
        sub     r4, r2, #2
        add     r3, r1, r6, lsl #1
LDIN0:
        cmp     r6, r4
        movge   r5, #0x7F
        ldrsh   r7, [r0], #-2
        mov     r8, r5, lsl #1
        ldrsh   r8, [lr, +r8]
        cmp     r8, r7
        bge     LDIN2
        add     r9, lr, r5, lsl #1
LDIN1:
        sub     r9, r9, #2
        ldrsh   r8, [r9]
        sub     r5, r5, #1
        cmp     r8, r7
        blt     LDIN1
LDIN2:
        sub     r7, r7, r8
        mov     r8, r5, lsl #1
        ldrsh   r8, [r12, +r8]
        subs    r6, r6, #1
        mul     r8, r7, r8
        mov     r7, r5, lsl #7
        add     r8, r8, #1, 22
        add     r8, r7, r8, asr #11
        strh    r8, [r3], #-2
        bpl     LDIN0
LDIN3:
        sub     r1, r1, #2
        mov     r2, r2, lsl #1
        ldrsh   r3, [r1, +r2]
        mov     r0, #0
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #17
        strh    r3, [r1, +r2]
        ldmia   sp!, {r4 - r9, pc}
LDIN4:
        mvn     r0, #7
        ldmia   sp!, {r4 - r9, pc}
        .long   cosTbl
        .long   slopeTbl


