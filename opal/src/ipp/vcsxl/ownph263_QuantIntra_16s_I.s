        .text
        .align  4
        .globl  ownph263_QuantIntra_16s_I


ownph263_QuantIntra_16s_I:
        stmdb   sp!, {r4 - r9, lr}
        ldr     r3, [pc, #0x90]
        add     r3, r3, r1, lsl #2
        ldr     r3, [r3, #-4]
        mov     r12, #0xFF
        orr     r12, r12, #0xFF, 24
        mov     r1, r1, lsl #1
        add     r0, r0, #2
        mov     r7, #1
        mov     r6, #0x7F
        mov     r5, #0
        mvn     r4, #0x7E
        mov     lr, #0x3F
LFFL0:
        ldrsh   r9, [r0]
        cmp     r9, r1
        blt     LFFL1
        mul     r9, r3, r9
        add     r7, r7, #1
        mov     r9, r9, asr #16
        cmp     r9, #0x7F
        movgt   r9, r6
        strh    r9, [r0]
        b       LFFL2
LFFL1:
        rsb     r8, r1, #0
        cmp     r9, r8
        strgth  r5, [r0]
        bgt     LFFL2
        mul     r9, r3, r9
        add     r7, r7, #1
        add     r9, r9, r12
        mov     r9, r9, asr #16
        cmn     r9, #0x7F
        movlt   r9, r4
        strh    r9, [r0]
LFFL2:
        subs    lr, lr, #1
        add     r0, r0, #2
        bne     LFFL0
        str     r7, [r2]
        ldmia   sp!, {r4 - r9, pc}
        .long   _p_QuantInv


