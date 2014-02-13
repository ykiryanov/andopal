        .text
        .align  4
        .globl  _ippsIIR16sInit_G728_16s


_ippsIIR16sInit_G728_16s:
        stmdb   sp!, {lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldreq   pc, [sp], #4
        mov     r1, #0x20
        bl      _ippsZero_16s
        mov     r0, #0
        ldr     pc, [sp], #4


