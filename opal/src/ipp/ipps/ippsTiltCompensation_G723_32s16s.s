        .text
        .align  4
        .globl  _ippsTiltCompensation_G723_32s16s


_ippsTiltCompensation_G723_32s16s:
        stmdb   sp!, {r4 - r7, lr}
        cmp     r1, #0
        beq     LDUJ3
        cmp     r2, #0
        beq     LDUJ3
        mvn     r12, #2, 18
        mov     r3, #0xFF
        bic     r12, r12, #2, 2
        orr     r3, r3, #0x7F, 24
        add     lr, r1, #4
        mov     r4, #0x3C
LDUJ0:
        ldr     r5, [r1], #4
        cmp     r12, r5
        movlt   r6, r3
        blt     LDUJ1
        add     r5, r5, #2, 18
        mov     r5, r5, asr #16
        mov     r5, r5, lsl #16
        mov     r6, r5, asr #16
LDUJ1:
        ldr     r5, [lr], #4
        mov     r6, r6, lsl #1
        mul     r6, r0, r6
        mov     r7, r5, asr #31
        adds    r5, r5, r6
        adc     r6, r7, r6, asr #31
        adds    r5, r5, #2, 18
        adc     r6, r6, #0
        mov     r6, r6, lsl #16
        orr     r5, r6, r5, lsr #16
        cmp     r3, r5
        movlt   r5, r3
        blt     LDUJ2
        cmn     r5, #2, 18
        mvn     r6, r3
        movlt   r5, r6
LDUJ2:
        strh    r5, [r2], #2
        subs    r4, r4, #1
        bne     LDUJ0
        mov     r0, #0
        ldmia   sp!, {r4 - r7, pc}
LDUJ3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r7, pc}


