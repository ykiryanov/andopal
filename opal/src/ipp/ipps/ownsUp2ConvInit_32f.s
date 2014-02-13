        .text
        .align  4
        .globl  ownsUp2ConvInit_32f


ownsUp2ConvInit_32f:
        stmdb   sp!, {r4 - r7, lr}
        mov     r6, r0
        mov     r0, #0x18
        mov     r5, r1
        bl      _ippsMalloc_8u
        mov     r4, r0
        mov     r1, #0x18
        bl      _ippsZero_8u
        cmp     r4, #0
        moveq   r0, #0
        ldmeqia sp!, {r4 - r7, pc}
        adds    r3, r5, #1
        mov     r7, #0
        mov     r12, r7
        mov     r2, #1
        movmi   r12, r2
        cmp     r5, #0
        mov     r3, r7
        movlt   r3, r2
        add     r12, r5, r12
        add     r12, r12, #1
        add     r3, r5, r3
        mov     r12, r12, asr #1
        mov     r3, r3, asr #1
        str     r12, [r4, #0xC]
        str     r3, [r4, #0x14]
        mov     r0, r5
        bl      _ippsMalloc_32f
        cmp     r0, #0
        str     r0, [r4, #4]
        ldreq   r0, [r4, #8]
        beq     LAJU1
        ldr     r0, [r4, #0xC]
        bl      _ippsMalloc_32f
        cmp     r0, #0
        str     r0, [r4, #8]
        beq     LAJU1
        ldr     r0, [r4, #0x14]
        cmp     r0, #0
        streq   r7, [r4, #0x10]
        beq     LAJU0
        bl      _ippsMalloc_32f
        cmp     r0, #0
        str     r0, [r4, #0x10]
        ldreq   r0, [r4, #8]
        beq     LAJU1
LAJU0:
        str     r5, [r4]
        mov     r1, r6
        mov     r0, r4
        bl      ownsUp2ConvSetFiltTaps_32f
        mov     r0, r4
        ldmia   sp!, {r4 - r7, pc}
LAJU1:
        bl      _ippsFree
        ldr     r0, [r4, #0x10]
        bl      _ippsFree
        ldr     r0, [r4, #4]
        bl      _ippsFree
        mov     r0, r4
        bl      _ippsFree
        mov     r0, #0
        ldmia   sp!, {r4 - r7, pc}


