        .text
        .align  4
        .globl  _ippsWinHybridInit_G729E_32f


_ippsWinHybridInit_G729E_32f:
        stmdb   sp!, {lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldreq   pc, [sp], #4
        mov     r1, #0x1F
        bl      _ippsZero_32f
        mov     r0, #0
        ldr     pc, [sp], #4


