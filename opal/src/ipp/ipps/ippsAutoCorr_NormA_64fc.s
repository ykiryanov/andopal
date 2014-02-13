        .text
        .align  4
        .globl  _ippsAutoCorr_NormA_64fc


_ippsAutoCorr_NormA_64fc:
        stmdb   sp!, {r4 - r7, lr}
        mov     r7, r1
        mov     r4, r2
        mov     r6, r3
        bl      _ippsAutoCorr_64fc
        mov     r5, r0
        cmp     r5, #0
        blt     LCYV0
        ldr     r12, [pc, #0x38]
        cmp     r7, r6
        mov     r0, r7
        movlt   r6, r7
        ldr     r7, [r12]
        bl      __floatsisf
        mov     r1, r0
        mov     r0, r7
        bl      __divsf3
        bl      __extendsfdf2
        mov     r6, r6, lsl #1
        mov     r3, r6
        mov     r2, r4
        bl      _ippsMulC_64f_I
LCYV0:
        mov     r0, r5
        ldmia   sp!, {r4 - r7, pc}
        .long   LCYV__2il0floatpacket.1


        .data
        .align  4


LCYV__2il0floatpacket.1:
        .byte   0x00,0x00,0x80,0x3F


