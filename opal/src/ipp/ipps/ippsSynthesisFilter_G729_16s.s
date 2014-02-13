        .text
        .align  4
        .globl  _ippsSynthesisFilter_G729_16s


_ippsSynthesisFilter_G729_16s:
        stmdb   sp!, {lr}
        sub     sp, sp, #8
        sub     r12, r2, #0x14
        mov     r3, r0
        mov     r0, r1
        str     r12, [sp, #4]
        mov     r12, #0xC
        mov     r1, r3
        str     r12, [sp]
        mov     r3, #0x28
        bl      _ippsSynthesisFilter_NR_16s_Sfs
        add     sp, sp, #8
        ldr     pc, [sp], #4


