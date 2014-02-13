        .text
        .align  4
        .globl  _ippsPostFilterAdapterStateInit_G728


_ippsPostFilterAdapterStateInit_G728:
        stmdb   sp!, {lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldreq   pc, [sp], #4
        mov     r1, #0x58
        bl      _ippsZero_16s
        mov     r0, #0
        ldr     pc, [sp], #4


