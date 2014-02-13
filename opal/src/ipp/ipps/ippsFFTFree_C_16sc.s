        .text
        .align  4
        .globl  _ippsFFTFree_C_16sc


_ippsFFTFree_C_16sc:
        stmdb   sp!, {lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldreq   pc, [sp], #4
        ldr     r1, [r0]
        cmp     r1, #1
        mvnne   r0, #0x10
        ldrne   pc, [sp], #4
        bl      LCDQ_deleteFftCtx
        mov     r0, #0
        ldr     pc, [sp], #4
LCDQ_deleteFftCtx:
        ldr     r2, [r0, #0x1C]
        mov     r1, #0
        str     r1, [r0]
        cmp     r2, #1
        beq     _ippsFree
        bxne    lr


