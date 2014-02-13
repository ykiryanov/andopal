        .text
        .align  4
        .globl  _ippsFFTFree_C_32s


_ippsFFTFree_C_32s:
        stmdb   sp!, {lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldreq   pc, [sp], #4
        ldr     r2, [r0]
        ldr     r1, [pc, #0x2C]
        cmp     r1, r2
        mvnne   r0, #0x10
        ldrne   pc, [sp], #4
        bl      LCBY_deleteFftCtx
        mov     r0, #0
        ldr     pc, [sp], #4
LCBY_deleteFftCtx:
        ldr     r2, [r0, #0x10]
        mov     r1, #0
        str     r1, [r0]
        cmp     r2, #1
        beq     _ippsFree
        bxne    lr
        .long   0x434d414d


