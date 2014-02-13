        .text
        .align  4
        .globl  ownsIIRInitAlloc_BiQuad_32f


ownsIIRInitAlloc_BiQuad_32f:
        stmdb   sp!, {r4 - r9, lr}
        sub     sp, sp, #0xC
        ldr     r8, [sp, #0x28]
        mov     r5, r2
        add     r9, sp, #8
        mov     r4, r0
        mov     r7, r1
        mov     r1, r9
        mov     r0, r5
        mov     r2, r8
        mov     r6, r3
        bl      ownsIIRGetStateSize_BiQuad_32f
        ldr     r0, [sp, #8]
        bl      _ippsMalloc_8u
        cmp     r0, #0
        bne     LBPT0
        mvn     r0, #8
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r9, pc}
LBPT0:
        str     r0, [sp]
        str     r8, [sp, #4]
        mov     r2, r5
        mov     r3, r6
        mov     r1, r7
        mov     r0, r4
        bl      ownsIIRInit_BiQuad_32f
        ldr     r1, [r4]
        mov     r5, r0
        mov     r2, #1
        cmn     r5, #0xA
        str     r2, [r1, #0x28]
        beq     LBPT1
        mov     r0, r5
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r9, pc}
LBPT1:
        ldr     r0, [r4]
        bl      _ippsIIRFree_32f
        mov     r0, r5
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r9, pc}


