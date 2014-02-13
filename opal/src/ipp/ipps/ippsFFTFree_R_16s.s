        .text
        .align  4
        .globl  _ippsFFTFree_R_16s


_ippsFFTFree_R_16s:
        stmdb   sp!, {lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldreq   pc, [sp], #4
        ldr     r1, [r0]
        cmp     r1, #3
        mvnne   r0, #0x10
        ldrne   pc, [sp], #4
        bl      LCDP_deleteFftCtx
        mov     r0, #0
        ldr     pc, [sp], #4
LCDP_deleteFftCtx:
        ldr     r2, [r0, #0x1C]
        mov     r1, #0
        str     r1, [r0]
        cmp     r2, #1
        beq     _ippsFree
        bxne    lr


