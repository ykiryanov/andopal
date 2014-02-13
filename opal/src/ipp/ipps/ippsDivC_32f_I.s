        .text
        .align  4
        .globl  _ippsDivC_32f_I


_ippsDivC_32f_I:
        stmdb   sp!, {r4, lr}
        mov     r4, r1
        cmp     r4, #0
        mov     r1, r0
        mov     r3, r2
        mvneq   r0, #7
        ldmeqia sp!, {r4, pc}
        cmp     r3, #0
        mvnle   r0, #5
        ldmleia sp!, {r4, pc}
        mov     r0, r4
        mov     r2, r4
        ldmia   sp!, {r4, lr}
        b       _ippsDivC_32f


