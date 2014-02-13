        .text
        .align  4
        .globl  _ippsDCTFwdFree_16s


_ippsDCTFwdFree_16s:
        stmdb   sp!, {lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldreq   pc, [sp], #4
        ldr     r1, [r0]
        cmp     r1, #0x13
        mvnne   r0, #0x10
        ldrne   pc, [sp], #4
        bl      LCTE_deleteDctCtx
        mov     r0, #0
        ldr     pc, [sp], #4
LCTE_deleteDctCtx:
        ldr     r2, [r0, #0x10]
        mov     r1, #0
        str     r1, [r0]
        cmp     r2, #1
        beq     _ippsFree
        bxne    lr


