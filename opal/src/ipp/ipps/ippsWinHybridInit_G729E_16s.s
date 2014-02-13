        .text
        .align  4
        .globl  _ippsWinHybridInit_G729E_16s


_ippsWinHybridInit_G729E_16s:
        stmdb   sp!, {lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldreq   pc, [sp], #4
        mov     r1, #0x3E
        bl      _ippsZero_16s
        mov     r0, #0
        ldr     pc, [sp], #4


