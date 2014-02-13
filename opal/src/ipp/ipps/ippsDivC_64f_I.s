        .text
        .align  4
        .globl  _ippsDivC_64f_I


_ippsDivC_64f_I:
        stmdb   sp!, {r4 - r7, lr}
        mov     r5, r2
        cmp     r5, #0
        mov     r6, r0
        mov     r7, r1
        mov     r4, r3
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r7, pc}
        cmp     r4, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r7, pc}
        mov     r0, r6
        mov     r1, r7
        mov     r2, #0
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        mvneq   r0, #9
        beq     LCHW0
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        mov     r2, r6
        mov     r3, r7
        bl      __divdf3
        mov     r3, r4
        mov     r2, r5
        ldmia   sp!, {r4 - r7, lr}
        b       _ippsMulC_64f_I
LCHW0:
        ldmia   sp!, {r4 - r7, pc}


