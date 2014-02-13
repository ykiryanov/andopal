        .text
        .align  4
        .globl  _ippsFIRSetDlyLine32f_16s


_ippsFIRSetDlyLine32f_16s:
        stmdb   sp!, {lr}
        mov     r2, r0
        cmp     r2, #0
        mov     r0, r1
        mvneq   r0, #7
        ldreq   pc, [sp], #4
        ldr     r12, [r2, #0x58]
        ldr     r3, [pc, #0x7C]
        subs    r12, r12, r3
        beq     LBXE0
        adds    r3, r12, #2
        mvnne   r0, #0x10
        ldrne   pc, [sp], #4
        mov     r1, r2
        bl      LBXE_ownsSRSetDlyLine32f_16s
        mov     r0, #0
        ldr     pc, [sp], #4
LBXE0:
        mov     r1, r2
        bl      LBXE_ownsMRSetDlyLine32f_16s
        mov     r0, #0
        ldr     pc, [sp], #4
LBXE_ownsMRSetDlyLine32f_16s:
        mov     r2, r1
        ldr     r1, [r2, #0x48]
        ldr     r3, [r2, #4]
        cmp     r0, #0
        moveq   r0, r3
        beq     _ippsZero_16s
        mov     r2, r1
        mov     r1, r3
        b       _ippsFlip_16u
LBXE_ownsSRSetDlyLine32f_16s:
        ldr     r2, [r1, #0x48]
        ldr     r3, [r1, #4]
        mov     r12, #0
        cmp     r0, #0
        str     r12, [r1, #0x2C]
        movne   r1, r3
        bne     _ippsFlip_16u
        mov     r1, r2
        mov     r0, r3
        b       _ippsZero_16s
        .long   0x46493037


