        .text
        .align  4
        .globl  _ippsAutoCorr_NormA_32fc


_ippsAutoCorr_NormA_32fc:
        stmdb   sp!, {r4 - r7, lr}
        mov     r7, r1
        mov     r4, r2
        mov     r6, r3
        bl      _ippsAutoCorr_32fc
        mov     r5, r0
        cmp     r5, #0
        blt     LCYX0
        ldr     r12, [pc, #0x34]
        cmp     r7, r6
        mov     r0, r7
        movlt   r6, r7
        ldr     r7, [r12]
        bl      __floatsisf
        mov     r1, r0
        mov     r0, r7
        bl      __divsf3
        mov     r6, r6, lsl #1
        mov     r2, r6
        mov     r1, r4
        bl      _ippsMulC_32f_I
LCYX0:
        mov     r0, r5
        ldmia   sp!, {r4 - r7, pc}
        .long   LCYX__2il0floatpacket.1


        .data
        .align  4


LCYX__2il0floatpacket.1:
        .byte   0x00,0x00,0x80,0x3F


