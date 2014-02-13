        .text
        .align  4
        .globl  ownsConvDown2Init_32f


ownsConvDown2Init_32f:
        stmdb   sp!, {r4 - r6, lr}
        mov     r6, r0
        mov     r0, #0xC
        mov     r5, r1
        bl      _ippsMalloc_8u
        mov     r4, r0
        mov     r1, #0xC
        bl      _ippsZero_8u
        cmp     r4, #0
        moveq   r0, #0
        ldmeqia sp!, {r4 - r6, pc}
        mov     r0, r5
        bl      _ippsMalloc_32f
        cmp     r0, #0
        str     r0, [r4, #4]
        ldreq   r0, [r4, #8]
        beq     LAKB0
        mov     r0, r5
        bl      _ippsMalloc_32f
        cmp     r0, #0
        str     r0, [r4, #8]
        beq     LAKB0
        str     r5, [r4]
        mov     r1, r6
        mov     r0, r4
        bl      ownsConvDown2SetFiltTaps_32f
        mov     r0, r4
        ldmia   sp!, {r4 - r6, pc}
LAKB0:
        bl      _ippsFree
        mov     r0, r4
        bl      _ippsFree
        mov     r0, #0
        ldmia   sp!, {r4 - r6, pc}


