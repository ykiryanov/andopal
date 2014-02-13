        .text
        .align  4
        .globl  _ippsFFTInv_CToC_32s_ISfs


_ippsFFTInv_CToC_32s_ISfs:
        stmdb   sp!, {lr}
        sub     sp, sp, #0x10
        ldr     r12, [sp, #0x14]
        str     r3, [sp, #4]
        str     r2, [sp]
        mov     r3, r1
        str     r12, [sp, #8]
        mov     r2, r0
        bl      _ippsFFTInv_CToC_32s_Sfs
        add     sp, sp, #0x10
        ldr     pc, [sp], #4


