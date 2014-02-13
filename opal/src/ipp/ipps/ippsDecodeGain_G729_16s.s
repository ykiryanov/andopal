        .text
        .align  4
        .globl  _ippsDecodeGain_G729_16s


_ippsDecodeGain_G729_16s:
        stmdb   sp!, {r4 - r9, lr}
        sub     sp, sp, #8
        mov     r4, r1
        cmp     r4, #0
        mov     r1, r0
        mov     r5, r3
        beq     LDTO3
        cmp     r5, #0
        beq     LDTO3
        cmp     r2, #0
        mvn     r7, #2, 2
        beq     LDTO2
        ldrsh   r12, [r2, #2]
        ldrsh   lr, [r2]
        ldr     r2, [pc, #0x154]
        and     r6, r12, #0xF
        add     r3, sp, #4
        and     lr, lr, #7
        mov     r6, r6, lsl #1
        sub     r8, r2, #0x20
        mov     r12, lr, lsl #1
        sub     lr, r2, #0x40
        ldrsh   r6, [lr, +r6]
        sub     lr, r2, #0x50
        ldrsh   lr, [lr, +r12]
        mov     r12, r6, lsl #2
        ldrsh   r12, [r2, +r12]
        add     r6, r2, r6, lsl #2
        mov     r2, lr, lsl #2
        ldrsh   r9, [r8, +r2]
        mov     r2, sp
        add     r8, r8, lr, lsl #2
        add     r12, r9, r12
        strh    r12, [r5]
        mov     r0, r4
        bl      ownGainPredict
        ldrsh   r6, [r6, #2]
        ldrsh   r8, [r8, #2]
        mov     r2, r6, asr #31
        adds    r1, r8, r6
        adc     r2, r2, r8, asr #31
        subs    r12, r1, r7
        sbcs    lr, r2, #0
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        movne   r1, r7
        bne     LDTO0
        cmp     r1, #2, 2
        mvn     r12, #0
        sbcs    r2, r2, r12
        movlt   r1, #2, 2
LDTO0:
        ldrsh   r12, [sp]
        mov     lr, r1, asr #1
        ldrsh   r2, [sp, #4]
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        mul     r12, r12, lr
        mvn     lr, #0xFF
        add     r2, r2, #0xB
        bic     lr, lr, #0x7F, 24
        mvn     r6, lr
        mov     r2, r12, asr r2
        cmp     r6, r2
        movlt   r2, #0xFF
        orrlt   lr, r2, #0x7F, 24
        blt     LDTO1
        cmn     r2, #2, 18
        movge   r2, r2, lsl #16
        movge   lr, r2, asr #16
LDTO1:
        strh    lr, [r5, #2]
        mov     r0, r4
        bl      ownGainUpdate
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r9, pc}
LDTO2:
        ldrsh   r12, [r5]
        mov     r2, #0x33
        orr     r2, r2, #0x73, 24
        mul     r12, r12, r2
        ldrsh   lr, [r5, #2]
        mov     r7, r7, lsl #15
        mvn     r7, r7
        sub     r7, r7, #0x29, 28
        mul     lr, lr, r7
        mov     r12, r12, asr #15
        mov     r0, r4
        mov     r12, r12, lsl #16
        mov     lr, lr, asr #15
        strh    lr, [r5, #2]
        mov     r12, r12, asr #16
        cmp     r12, r2
        movlt   r2, r12
        strh    r2, [r5]
        bl      ownGainUpdateErasure
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r9, pc}
LDTO3:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r9, pc}
        .long   LDTO_gbk2


        .data
        .align  4


LDTO_imap1:
        .byte   0x05,0x00,0x01,0x00,0x07,0x00,0x04,0x00,0x02,0x00,0x00,0x00,0x06,0x00,0x03,0x00
LDTO_imap2:
        .byte   0x02,0x00,0x0E,0x00,0x03,0x00,0x0D,0x00,0x00,0x00,0x0F,0x00,0x01,0x00,0x0C,0x00
        .byte   0x06,0x00,0x0A,0x00,0x07,0x00,0x09,0x00,0x04,0x00,0x0B,0x00,0x05,0x00,0x08,0x00
LDTO_gbk1:
        .byte   0x01,0x00,0xEC,0x05,0x0F,0x06,0x79,0x09,0x27,0x07,0x9E,0x13,0x39,0x00,0x1C,0x15
        .byte   0x81,0x07,0x4B,0x24,0xAA,0x0C,0xDD,0x26,0x64,0x01,0xA4,0x39,0x76,0x0A,0x1A,0x6A
LDTO_gbk2:
        .byte   0x3A,0x03,0xD5,0x07,0xCA,0x07,0x00,0x00,0x16,0x14,0x50,0x02,0x10,0x18,0x5B,0x09
        .byte   0x9B,0x1F,0xFD,0x12,0xA0,0x23,0x0D,0x02,0x4D,0x29,0x96,0x0B,0x31,0x2D,0xAC,0x04
        .byte   0xCC,0x33,0xB8,0x0C,0x72,0x37,0x5E,0x06,0x1C,0x3B,0x32,0x13,0x39,0x3B,0xC4,0x37
        .byte   0x4A,0x3C,0xED,0x00,0xF0,0x3E,0x40,0x0D,0x93,0x43,0x45,0x07,0x1D,0x4A,0x2F,0x17


