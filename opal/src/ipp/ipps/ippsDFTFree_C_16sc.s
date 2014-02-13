        .text
        .align  4
        .globl  _ippsDFTFree_C_16sc


_ippsDFTFree_C_16sc:
        stmdb   sp!, {r4, lr}
        mov     r4, r0
        cmp     r4, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4, pc}
        ldr     r1, [r4]
        cmp     r1, #0xA
        mvnne   r0, #0x10
        ldmneia sp!, {r4, pc}
        ldr     r0, [r4, #0x10]
        cmp     r0, #0
        beq     LCNE0
        bl      _ippsDFTFree_C_32fc
LCNE0:
        mov     r0, r4
        bl      LCNE_deleteDftCtx
        mov     r0, #0
        ldmia   sp!, {r4, pc}
LCNE_deleteDftCtx:
        cmp     r0, #0
        bxeq    lr
        mov     r1, #0
        str     r1, [r0]
        b       _ippsFree


