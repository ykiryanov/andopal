        .text
        .align  4
        .globl  _ippiQuantIntra_H263_16s_C1I


_ippiQuantIntra_H263_16s_C1I:
        stmdb   sp!, {r4, r5, lr}
        ldr     r12, [sp, #0xC]
        mov     r4, r0
        cmp     r4, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4, r5, pc}
        cmp     r1, #1
        blt     LFFR5
        cmp     r1, #0x1F
        bgt     LFFR5
        cmp     r3, #0
        bne     LFFR3
        ldrsh   r5, [r4]
        cmp     r1, #8
        bge     LFFR0
        cmp     r12, #0
        bne     LFFR0
        mov     r0, r4
        bl      ownph263_QuantIntra_16s_I
        b       LFFR1
LFFR0:
        mov     r0, r4
        bl      ownph263_QuantIntraNoClip_16s_I
LFFR1:
        add     r5, r5, #4
        mov     r5, r5, asr #3
        mov     r5, r5, lsl #16
        movs    r5, r5, asr #16
        bne     LFFR2
        mov     r1, #1
        strh    r1, [r4]
        mov     r0, #0
        ldmia   sp!, {r4, r5, pc}
LFFR2:
        cmp     r5, #0xFF
        beq     LFFR6
        strh    r5, [r4]
        mov     r0, #0
        ldmia   sp!, {r4, r5, pc}
LFFR3:
        cmp     r12, #0
        beq     LFFR4
        mov     r0, r4
        bl      ownph263_QuantAdvIntraNoClip_16s_I
        mov     r0, #0
        ldmia   sp!, {r4, r5, pc}
LFFR4:
        mov     r0, r4
        bl      ownph263_QuantAdvIntra_16s_I
        mov     r0, #0
        ldmia   sp!, {r4, r5, pc}
LFFR5:
        mvn     r0, #0xBF
        ldmia   sp!, {r4, r5, pc}
LFFR6:
        mov     r1, #0xFE
        strh    r1, [r4]
        mov     r0, #0
        ldmia   sp!, {r4, r5, pc}


