        .text
        .align  4
        .globl  ownph263_QuantIntraNoClip_16s_I


ownph263_QuantIntraNoClip_16s_I:
        stmdb   sp!, {r4 - r7, lr}
        ldr     r3, [pc, #0x78]
        add     r3, r3, r1, lsl #2
        ldr     r3, [r3, #-4]
        mov     r12, #0xFF
        orr     r12, r12, #0xFF, 24
        mov     r1, r1, lsl #1
        add     r0, r0, #2
        mov     r5, #1
        mov     r4, #0
        mov     lr, #0x3F
LFFM0:
        ldrsh   r7, [r0]
        cmp     r7, r1
        blt     LFFM1
        mul     r7, r3, r7
        add     r5, r5, #1
        mov     r7, r7, asr #16
        strh    r7, [r0]
        b       LFFM2
LFFM1:
        rsb     r6, r1, #0
        cmp     r7, r6
        strgth  r4, [r0]
        bgt     LFFM2
        mul     r7, r3, r7
        add     r5, r5, #1
        add     r7, r7, r12
        mov     r7, r7, asr #16
        strh    r7, [r0]
LFFM2:
        subs    lr, lr, #1
        add     r0, r0, #2
        bne     LFFM0
        str     r5, [r2]
        ldmia   sp!, {r4 - r7, pc}
        .long   _p_QuantInv


