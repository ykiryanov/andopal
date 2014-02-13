        .text
        .align  4
        .globl  _ippsDecodeGain_G729I_16s


_ippsDecodeGain_G729I_16s:
        stmdb   sp!, {r4 - r8, lr}
        sub     sp, sp, #8
        ldr     r6, [sp, #0x20]
        mov     r4, r2
        cmp     r4, #0
        beq     LDTM1
        cmp     r6, #0
        beq     LDTM1
        cmp     r3, #0
        beq     LDTM0
        ldrsh   r5, [r3]
        ldr     lr, [pc, #0xD4]
        ldrsh   r12, [r3, #2]
        mov     r5, r5, lsl #1
        mov     r1, r0
        sub     r7, lr, #0x40
        ldrsh   r5, [r7, +r5]
        mov     r12, r12, lsl #1
        sub     r3, lr, #0x30
        ldrsh   r7, [r3, +r12]
        mov     r12, r5, lsl #2
        sub     r8, lr, #0x20
        ldrsh   r12, [r8, +r12]
        add     r5, r8, r5, lsl #2
        mov     r8, r7, lsl #2
        ldrsh   r8, [lr, +r8]
        add     r3, sp, #4
        mov     r2, sp
        add     r8, r12, r8
        strh    r8, [r6]
        mov     r0, r4
        add     r7, lr, r7, lsl #2
        bl      ownGainPredict
        ldrsh   r7, [r7, #2]
        ldrsh   r5, [r5, #2]
        ldrsh   r3, [sp]
        ldrsh   r12, [sp, #4]
        mov     r0, r4
        add     r7, r5, r7
        mov     r1, r7, asr #1
        add     r12, r12, #0xC
        mov     lr, r1, lsl #16
        mov     lr, lr, asr #16
        mul     lr, r3, lr
        mov     r12, lr, asr r12
        strh    r12, [r6, #2]
        bl      ownGainUpdate
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r8, pc}
LDTM0:
        ldrsh   r12, [r6]
        ldrsh   r3, [r6, #2]
        mov     r0, r4
        mul     r12, r1, r12
        mul     r3, r1, r3
        mov     r12, r12, asr #15
        strh    r12, [r6]
        mov     r3, r3, asr #15
        strh    r3, [r6, #2]
        bl      ownGainUpdateErasure
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r8, pc}
LDTM1:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r8, pc}
        .long   LDTM_gbk2_6k


        .data
        .align  4


LDTM_imap1_6k:
        .byte   0x00,0x00,0x05,0x00,0x04,0x00,0x07,0x00,0x01,0x00,0x03,0x00,0x02,0x00,0x06,0x00
LDTM_imap2_6k:
        .byte   0x00,0x00,0x05,0x00,0x07,0x00,0x02,0x00,0x01,0x00,0x04,0x00,0x06,0x00,0x03,0x00
LDTM_gbk1_6k:
        .byte   0xD9,0x16,0x00,0x00,0x71,0x0B,0x36,0x04,0xD1,0x24,0xAB,0x0A,0xB4,0x17,0xCD,0x17
        .byte   0x21,0x0E,0x5B,0x1A,0x63,0x0C,0x40,0x24,0x4B,0x0F,0x48,0x32,0x7B,0x13,0x16,0x57
LDTM_gbk2_6k:
        .byte   0x00,0x00,0x4F,0x10,0x94,0x0F,0x00,0x00,0x7E,0x11,0x9C,0x1C,0xC4,0x1E,0x8D,0x1E
        .byte   0x33,0x28,0x79,0x2C,0x4C,0x2A,0xD2,0x6B,0xB4,0x2E,0xEF,0x29,0x27,0x40,0x6C,0x3D


