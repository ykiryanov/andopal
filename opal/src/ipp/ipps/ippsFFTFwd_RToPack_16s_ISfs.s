        .text
        .align  4
        .globl  _ippsFFTFwd_RToPack_16s_ISfs


_ippsFFTFwd_RToPack_16s_ISfs:
        stmdb   sp!, {lr}
        sub     sp, sp, #8
        str     r3, [sp]
        mov     r3, r2
        mov     r2, r1
        mov     r1, r0
        bl      _ippsFFTFwd_RToPack_16s_Sfs
        add     sp, sp, #8
        ldr     pc, [sp], #4


