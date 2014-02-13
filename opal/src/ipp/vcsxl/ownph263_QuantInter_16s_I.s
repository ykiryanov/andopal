        .text
        .align  4
        .globl  ownph263_QuantInter_16s_I


ownph263_QuantInter_16s_I:
        stmdb   sp!, {r4 - r10, lr}
        ldr     r3, [pc, #0x9C]
        add     r3, r3, r1, lsl #2
        ldr     r3, [r3, #-4]
        mov     r6, r1, lsl #1
        mov     r5, #0
        mov     r7, #0
        mov     r4, #0x7F
        mvn     lr, #0x7E
        mov     r12, #0x40
LFFN0:
        ldrsh   r8, [r0]
        sub     r9, r8, r1, asr #1
        cmp     r6, r9
        bgt     LFFN1
        sub     r8, r8, r1, asr #1
        mul     r8, r8, r3
        add     r7, r7, #1
        mov     r8, r8, asr #16
        cmp     r8, #0x7F
        movgt   r8, r4
        strh    r8, [r0]
        b       LFFN2
LFFN1:
        add     r9, r8, r1, asr #1
        rsb     r10, r6, #0
        cmp     r9, r10
        strgth  r5, [r0]
        bgt     LFFN2
        add     r8, r8, r1, asr #1
        mul     r8, r8, r3
        mov     r9, #0xFF
        orr     r9, r9, #0xFF, 24
        add     r7, r7, #1
        add     r9, r8, r9
        mov     r8, r9, asr #16
        cmn     r8, #0x7F
        movlt   r8, lr
        strh    r8, [r0]
LFFN2:
        subs    r12, r12, #1
        add     r0, r0, #2
        bne     LFFN0
        str     r7, [r2]
        ldmia   sp!, {r4 - r10, pc}
        .long   _p_QuantInv


