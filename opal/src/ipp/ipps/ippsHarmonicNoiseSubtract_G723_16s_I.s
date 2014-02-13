        .text
        .align  4
        .globl  _ippsHarmonicNoiseSubtract_G723_16s_I


_ippsHarmonicNoiseSubtract_G723_16s_I:
        stmdb   sp!, {r4 - r10, lr}
        cmp     r2, #0
        beq     LDUQ3
        cmp     r3, #0
        beq     LDUQ3
        rsb     r12, r1, #0
        rsb     r1, r0, #0
        add     r0, r2, r12, lsl #1
        mvn     r7, #3, 2
        mov     r6, #3, 2
        mov     r5, #0
        add     lr, r3, #2
        add     r4, r2, #2
LDUQ0:
        ldrsh   r9, [r2], #4
        ldrsh   r12, [r3]
        ldrsh   r8, [r4], #4
        sub     r10, r12, r9
        ldrsh   r9, [lr]
        ldrsh   r12, [r0]
        mov     r10, r10, lsl #15
        sub     r9, r9, r8
        mla     r12, r1, r12, r10
        ldrsh   r8, [r0, #2]
        mov     r9, r9, lsl #15
        mla     r9, r1, r8, r9
        cmn     r12, #7, 2
        movgt   r12, r7
        bgt     LDUQ1
        cmp     r12, #3, 2
        movlt   r12, r6
LDUQ1:
        cmn     r9, #7, 2
        movgt   r9, r7
        bgt     LDUQ2
        cmp     r9, #3, 2
        movlt   r9, r6
LDUQ2:
        add     r8, r12, #1, 18
        add     r12, r9, #1, 18
        mov     r8, r8, asr #15
        strh    r8, [r3], #4
        mov     r12, r12, asr #15
        add     r5, r5, #2
        strh    r12, [lr], #4
        cmp     r5, #0x3C
        add     r0, r0, #4
        blt     LDUQ0
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LDUQ3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r10, pc}


