        .text
        .align  4
        .globl  ownph263_QuantAdvIntraNoClip_16s_I


ownph263_QuantAdvIntraNoClip_16s_I:
        stmdb   sp!, {r4 - r9, lr}
        ldr     r3, [pc, #0x88]
        add     r3, r3, r1, lsl #2
        ldr     r3, [r3, #-4]
        mov     r12, #0xFF
        mov     r6, r1, lsl #1
        orr     r12, r12, #0xFF, 24
        add     r1, r1, r6
        mov     r4, #0
        mov     r5, #0
        mov     lr, #0x40
LFFQ0:
        ldrsh   r7, [r0]
        add     r8, r7, r1, asr #2
        cmp     r6, r8
        bgt     LFFQ1
        add     r7, r7, r1, asr #2
        mul     r7, r7, r3
        add     r5, r5, #1
        mov     r7, r7, asr #16
        strh    r7, [r0]
        b       LFFQ2
LFFQ1:
        sub     r8, r7, r1, asr #2
        rsb     r9, r6, #0
        cmp     r8, r9
        strgth  r4, [r0]
        bgt     LFFQ2
        sub     r7, r7, r1, asr #2
        mul     r7, r7, r3
        add     r5, r5, #1
        add     r7, r7, r12
        mov     r7, r7, asr #16
        strh    r7, [r0]
LFFQ2:
        subs    lr, lr, #1
        add     r0, r0, #2
        bne     LFFQ0
        str     r5, [r2]
        ldmia   sp!, {r4 - r9, pc}
        .long   _p_QuantInv


