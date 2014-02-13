        .text
        .align  4
        .globl  _ippsToneDetectInit_EC_16s


_ippsToneDetectInit_EC_16s:
        stmdb   sp!, {r4 - r6, lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r6, pc}
        cmp     r1, #0x7D, 26
        beq     LDJY0
        cmp     r1, #0xFA, 26
        mvnne   r0, #6
        ldmneia sp!, {r4 - r6, pc}
LDJY0:
        ldr     r2, [pc, #0xB0]
        and     r3, r0, #0xF
        rsb     r3, r3, #0
        and     lr, r3, #0xF
        mov     r3, #0
        add     r12, r0, lr
        cmp     r1, #0x7D, 26
        strh    r3, [r12, #0xC]
        strh    r3, [r12, #0xE]
        strh    r3, [r12, #0x10]
        strh    r3, [r12, #0x12]
        moveq   r4, #0xD7, 28
        orreq   r4, r4, #3, 20
        beq     LDJY1
        mov     r4, #0xE1
        orr     r4, r4, #0x3A, 24
        sub     r2, r2, #8
LDJY1:
        strh    r4, [r12, #0x2C]
        str     r2, [lr, +r0]
        ldr     r2, [pc, #0x68]
        ldr     r0, [pc, #0x68]
        rsb     lr, r1, r1, lsl #4
        smull   r4, r2, r1, r2
        rsb     r4, r1, lr, lsl #2
        str     r3, [r12, #0x14]
        rsb     r5, r4, r4, lsl #3
        smull   r6, r4, r5, r0
        mov     lr, #0xD2
        orr     lr, lr, #1, 24
        mul     lr, r1, lr
        mov     r5, r5, asr #31
        rsb     r4, r5, r4, asr #6
        str     r3, [r12, #0x28]
        smull   r5, r0, lr, r0
        mov     lr, lr, asr #31
        rsb     r0, lr, r0, asr #6
        mov     r1, r1, asr #31
        str     r0, [r12, #0x1C]
        rsb     r2, r1, r2, asr #4
        mov     r0, #0
        str     r4, [r12, #0x18]
        str     r2, [r12, #0x24]
        str     r3, [r12, #0x20]
        str     r3, [r12, #4]
        str     r3, [r12, #8]
        ldmia   sp!, {r4 - r6, pc}
        .long   LDJY_td_iir_coeffs_8
        .long   0x51eb851f
        .long   0x10624dd3


        .data
        .align  4


LDJY_td_iir_coeffs_16:
        .byte   0x4F,0x00,0xB1,0xFF,0xB1,0xEA,0x62,0x0F
LDJY_td_iir_coeffs_8:
        .byte   0x9B,0x00,0x65,0xFF,0x6B,0x02,0xCA,0x0E


