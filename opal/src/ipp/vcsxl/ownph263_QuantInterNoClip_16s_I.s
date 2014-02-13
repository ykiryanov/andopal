        .text
        .align  4
        .globl  ownph263_QuantInterNoClip_16s_I


ownph263_QuantInterNoClip_16s_I:
        stmdb   sp!, {r4 - r9, lr}
        ldr     r3, [pc, #0x84]
        add     r3, r3, r1, lsl #2
        ldr     r3, [r3, #-4]
        mov     r12, #0xFF
        orr     r12, r12, #0xFF, 24
        mov     r5, r1, lsl #1
        mov     r4, #0
        mov     r6, #0
        mov     lr, #0x40
LFFO0:
        ldrsh   r7, [r0]
        sub     r8, r7, r1, asr #1
        cmp     r5, r8
        bgt     LFFO1
        sub     r7, r7, r1, asr #1
        mul     r7, r7, r3
        add     r6, r6, #1
        mov     r7, r7, asr #16
        strh    r7, [r0]
        b       LFFO2
LFFO1:
        add     r8, r7, r1, asr #1
        rsb     r9, r5, #0
        cmp     r8, r9
        strgth  r4, [r0]
        bgt     LFFO2
        add     r7, r7, r1, asr #1
        mul     r7, r7, r3
        add     r6, r6, #1
        add     r7, r7, r12
        mov     r7, r7, asr #16
        strh    r7, [r0]
LFFO2:
        subs    lr, lr, #1
        add     r0, r0, #2
        bne     LFFO0
        str     r6, [r2]
        ldmia   sp!, {r4 - r9, pc}
        .long   _p_QuantInv


