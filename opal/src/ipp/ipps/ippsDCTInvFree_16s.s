        .text
        .align  4
        .globl  _ippsDCTInvFree_16s


_ippsDCTInvFree_16s:
        stmdb   sp!, {lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldreq   pc, [sp], #4
        ldr     r1, [r0]
        cmp     r1, #0x14
        mvnne   r0, #0x10
        ldrne   pc, [sp], #4
        bl      LCSX_deleteDctCtx
        mov     r0, #0
        ldr     pc, [sp], #4
LCSX_deleteDctCtx:
        ldr     r2, [r0, #0x10]
        mov     r1, #0
        str     r1, [r0]
        cmp     r2, #1
        beq     _ippsFree
        bxne    lr


