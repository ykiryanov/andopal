        .text
        .align  4
        .globl  ippiOBMC8x8QP_MPEG4_8u_C1R


ippiOBMC8x8QP_MPEG4_8u_C1R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x4A, 30
        ldr     lr, [sp, #0x154]
        ldr     r12, [sp, #0x14C]
        ldr     r11, [sp, #0x150]
        str     lr, [sp, #0x14]
        ldr     lr, [sp, #0x158]
        ldr     r10, [sp, #0x160]
        mov     r7, r0
        cmp     r7, #0
        str     lr, [sp, #0x10]
        ldr     lr, [sp, #0x15C]
        mov     r4, r1
        str     lr, [sp, #0xC]
        mov     r6, r2
        str     r3, [sp, #8]
        beq     LENQ10
        cmp     r6, #0
        beq     LENQ10
        ldrsh   r8, [r12, #2]
        ldrsh   r9, [r12]
        str     r10, [sp, #4]
        mov     r12, r8, asr #2
        add     r3, sp, #0x27
        add     lr, r7, r9, asr #2
        mla     r0, r4, r12, lr
        bic     r5, r3, #0xF
        and     r12, r8, #3
        and     r3, r9, #3
        add     r12, r3, r12, lsl #2
        str     r12, [sp]
        mov     r3, #8
        mov     r2, r5
        mov     r1, r4
        bl      _ippiCopy8x8QP_MPEG4_8u_C1R
        ldrsh   r3, [r11]
        ldrsh   r12, [r11, #2]
        add     r11, r5, #0xC0
        cmp     r9, r3
        bne     LENQ0
        cmp     r8, r12
        bne     LENQ0
        ldr     r3, [r5]
        str     r3, [r5, #0x40]
        ldr     r3, [r5, #8]
        str     r3, [r5, #0x48]
        ldr     r3, [r5, #0x10]
        str     r3, [r5, #0x50]
        ldr     r3, [r5, #0x18]
        str     r3, [r5, #0x58]
        ldr     r3, [r5, #0x20]
        str     r3, [r5, #0x60]
        ldr     r3, [r5, #0x28]
        str     r3, [r5, #0x68]
        ldr     r3, [r5, #0x30]
        str     r3, [r5, #0x70]
        ldr     r3, [r5, #0x38]
        str     r3, [r5, #0x78]
        b       LENQ2
LENQ0:
        add     r0, r7, r3, asr #2
        mov     lr, r12, asr #2
        mla     r0, r4, lr, r0
        and     r12, r12, #3
        and     r3, r3, #3
        add     r12, r3, r12, lsl #2
        str     r12, [sp]
        str     r10, [sp, #4]
        mov     r3, #8
        mov     r2, r11
        mov     r1, r4
        bl      _ippiCopy8x8QP_MPEG4_8u_C1R
        add     lr, r5, #0xBB
        add     r12, r5, #0x3B
        mov     r3, #8
LENQ1:
        ldrb    r0, [lr, #5]
        subs    r3, r3, #1
        strb    r0, [r12, #5]
        ldrb    r0, [lr, #6]
        strb    r0, [r12, #6]
        ldrb    r0, [lr, #7]
        strb    r0, [r12, #7]
        ldrb    r0, [lr, #8]!
        strb    r0, [r12, #8]!
        bne     LENQ1
LENQ2:
        ldr     r12, [sp, #0x10]
        ldrsh   r3, [r12]
        ldrsh   r12, [r12, #2]
        cmp     r9, r3
        bne     LENQ3
        cmp     r8, r12
        bne     LENQ3
        ldr     r12, [r5]
        ldr     r3, [r5, #4]
        str     r12, [r5, #0x80]
        ldr     r12, [r5, #8]
        str     r3, [r5, #0x84]
        ldr     r3, [r5, #0xC]
        str     r12, [r5, #0x88]
        ldr     r12, [r5, #0x10]
        str     r3, [r5, #0x8C]
        ldr     r3, [r5, #0x14]
        str     r12, [r5, #0x90]
        ldr     r12, [r5, #0x18]
        str     r3, [r5, #0x94]
        ldr     r3, [r5, #0x1C]
        str     r12, [r5, #0x98]
        str     r3, [r5, #0x9C]
        b       LENQ4
LENQ3:
        mov     lr, r12, asr #2
        add     r0, r7, r3, asr #2
        mla     r0, r4, lr, r0
        and     r12, r12, #3
        and     r3, r3, #3
        add     r12, r3, r12, lsl #2
        str     r12, [sp]
        str     r10, [sp, #4]
        mov     r3, #8
        mov     r2, r11
        mov     r1, r4
        bl      _ippiCopy8x8QP_MPEG4_8u_C1R
        ldrb    r12, [r5, #0xC0]
        ldrb    r3, [r5, #0xC1]
        strb    r12, [r5, #0x80]
        ldrb    r12, [r5, #0xC2]
        strb    r3, [r5, #0x81]
        ldrb    r3, [r5, #0xC3]
        strb    r12, [r5, #0x82]
        ldrb    r12, [r5, #0xC4]
        strb    r3, [r5, #0x83]
        ldrb    r3, [r5, #0xC5]
        strb    r12, [r5, #0x84]
        ldrb    r12, [r5, #0xC6]
        strb    r3, [r5, #0x85]
        ldrb    r3, [r5, #0xC7]
        strb    r12, [r5, #0x86]
        ldrb    r12, [r5, #0xC8]
        strb    r3, [r5, #0x87]
        ldrb    r3, [r5, #0xC9]
        strb    r12, [r5, #0x88]
        ldrb    r12, [r5, #0xCA]
        strb    r3, [r5, #0x89]
        ldrb    r3, [r5, #0xCB]
        strb    r12, [r5, #0x8A]
        ldrb    r12, [r5, #0xCC]
        strb    r3, [r5, #0x8B]
        ldrb    r3, [r5, #0xCD]
        strb    r12, [r5, #0x8C]
        ldrb    r12, [r5, #0xCE]
        strb    r3, [r5, #0x8D]
        ldrb    r3, [r5, #0xCF]
        strb    r12, [r5, #0x8E]
        ldrb    r12, [r5, #0xD0]
        strb    r3, [r5, #0x8F]
        ldrb    r3, [r5, #0xD1]
        strb    r12, [r5, #0x90]
        ldrb    r12, [r5, #0xD2]
        strb    r3, [r5, #0x91]
        ldrb    r3, [r5, #0xD3]
        strb    r12, [r5, #0x92]
        ldrb    r12, [r5, #0xD4]
        strb    r3, [r5, #0x93]
        ldrb    r3, [r5, #0xD5]
        strb    r12, [r5, #0x94]
        ldrb    r12, [r5, #0xD6]
        strb    r3, [r5, #0x95]
        ldrb    r3, [r5, #0xD7]
        strb    r12, [r5, #0x96]
        ldrb    r12, [r5, #0xD8]
        strb    r3, [r5, #0x97]
        ldrb    r3, [r5, #0xD9]
        strb    r12, [r5, #0x98]
        ldrb    r12, [r5, #0xDA]
        strb    r3, [r5, #0x99]
        ldrb    r3, [r5, #0xDB]
        strb    r12, [r5, #0x9A]
        ldrb    r12, [r5, #0xDC]
        strb    r3, [r5, #0x9B]
        ldrb    r3, [r5, #0xDD]
        strb    r12, [r5, #0x9C]
        ldrb    r12, [r5, #0xDE]
        strb    r3, [r5, #0x9D]
        ldrb    r3, [r5, #0xDF]
        strb    r12, [r5, #0x9E]
        strb    r3, [r5, #0x9F]
LENQ4:
        ldr     r3, [sp, #0x14]
        ldrsh   r12, [r3]
        ldrsh   r3, [r3, #2]
        cmp     r9, r12
        bne     LENQ5
        cmp     r8, r3
        bne     LENQ5
        ldr     r12, [r5, #4]
        ldr     r3, [r5, #0xC]
        str     r12, [r5, #0x44]
        ldr     r12, [r5, #0x14]
        str     r3, [r5, #0x4C]
        ldr     r3, [r5, #0x1C]
        str     r12, [r5, #0x54]
        ldr     r12, [r5, #0x24]
        str     r3, [r5, #0x5C]
        ldr     r3, [r5, #0x2C]
        str     r12, [r5, #0x64]
        ldr     r12, [r5, #0x34]
        str     r3, [r5, #0x6C]
        ldr     r3, [r5, #0x3C]
        str     r12, [r5, #0x74]
        str     r3, [r5, #0x7C]
        b       LENQ7
LENQ5:
        mov     r0, r3, asr #2
        str     r10, [sp, #4]
        add     lr, r7, r12, asr #2
        mla     r0, r4, r0, lr
        and     r3, r3, #3
        and     r12, r12, #3
        add     r3, r12, r3, lsl #2
        str     r3, [sp]
        mov     r3, #8
        mov     r2, r11
        mov     r1, r4
        bl      _ippiCopy8x8QP_MPEG4_8u_C1R
        add     lr, r5, #0xBF
        add     r12, r5, #0x3F
        mov     r3, #8
LENQ6:
        ldrb    r0, [lr, #5]
        subs    r3, r3, #1
        strb    r0, [r12, #5]
        ldrb    r0, [lr, #6]
        strb    r0, [r12, #6]
        ldrb    r0, [lr, #7]
        strb    r0, [r12, #7]
        ldrb    r0, [lr, #8]!
        strb    r0, [r12, #8]!
        bne     LENQ6
LENQ7:
        ldr     r3, [sp, #0xC]
        ldrsh   r12, [r3]
        ldrsh   r3, [r3, #2]
        cmp     r9, r12
        bne     LENQ8
        cmp     r8, r3
        bne     LENQ8
        ldr     r9, [r5, #0x20]
        ldr     r3, [r5, #0x24]
        ldr     r12, [r5, #0x28]
        ldr     lr, [r5, #0x2C]
        ldr     r4, [r5, #0x30]
        ldr     r7, [r5, #0x34]
        ldr     r8, [r5, #0x38]
        str     r9, [r5, #0xA0]
        ldr     r9, [r5, #0x3C]
        str     r3, [r5, #0xA4]
        str     r12, [r5, #0xA8]
        str     lr, [r5, #0xAC]
        str     r4, [r5, #0xB0]
        str     r7, [r5, #0xB4]
        str     r8, [r5, #0xB8]
        str     r9, [r5, #0xBC]
        b       LENQ9
LENQ8:
        mov     lr, r3, asr #2
        str     r10, [sp, #4]
        add     r7, r7, r12, asr #2
        mla     r0, r4, lr, r7
        and     r3, r3, #3
        and     r12, r12, #3
        add     r3, r12, r3, lsl #2
        str     r3, [sp]
        mov     r1, r4
        mov     r2, r11
        mov     r3, #8
        bl      _ippiCopy8x8QP_MPEG4_8u_C1R
        ldrb    lr, [r5, #0xE0]
        ldrb    r7, [r5, #0xE1]
        ldrb    r8, [r5, #0xE2]
        ldrb    r4, [r5, #0xE3]
        ldrb    r12, [r5, #0xE4]
        ldrb    r9, [r5, #0xE5]
        ldrb    r3, [r5, #0xE6]
        strb    lr, [r5, #0xA0]
        ldrb    lr, [r5, #0xE7]
        strb    r7, [r5, #0xA1]
        ldrb    r7, [r5, #0xE8]
        strb    r8, [r5, #0xA2]
        ldrb    r8, [r5, #0xE9]
        strb    r4, [r5, #0xA3]
        ldrb    r4, [r5, #0xEA]
        strb    r12, [r5, #0xA4]
        ldrb    r12, [r5, #0xEB]
        strb    r9, [r5, #0xA5]
        ldrb    r9, [r5, #0xEC]
        strb    r3, [r5, #0xA6]
        ldrb    r3, [r5, #0xED]
        strb    lr, [r5, #0xA7]
        ldrb    lr, [r5, #0xEE]
        strb    r7, [r5, #0xA8]
        ldrb    r7, [r5, #0xEF]
        strb    r8, [r5, #0xA9]
        ldrb    r8, [r5, #0xF0]
        strb    r4, [r5, #0xAA]
        ldrb    r4, [r5, #0xF1]
        strb    r12, [r5, #0xAB]
        ldrb    r12, [r5, #0xF2]
        strb    r9, [r5, #0xAC]
        ldrb    r9, [r5, #0xF3]
        strb    r3, [r5, #0xAD]
        ldrb    r3, [r5, #0xF4]
        strb    lr, [r5, #0xAE]
        ldrb    lr, [r5, #0xF5]
        strb    r7, [r5, #0xAF]
        ldrb    r7, [r5, #0xF6]
        strb    r8, [r5, #0xB0]
        ldrb    r8, [r5, #0xF7]
        strb    r4, [r5, #0xB1]
        ldrb    r4, [r5, #0xF8]
        strb    r12, [r5, #0xB2]
        ldrb    r12, [r5, #0xF9]
        strb    r9, [r5, #0xB3]
        ldrb    r9, [r5, #0xFA]
        strb    r3, [r5, #0xB4]
        ldrb    r3, [r5, #0xFB]
        strb    lr, [r5, #0xB5]
        ldrb    lr, [r5, #0xFC]
        strb    r7, [r5, #0xB6]
        ldrb    r7, [r5, #0xFD]
        strb    r8, [r5, #0xB7]
        ldrb    r8, [r5, #0xFE]
        strb    r4, [r5, #0xB8]
        ldrb    r4, [r5, #0xFF]
        strb    r12, [r5, #0xB9]
        strb    r9, [r5, #0xBA]
        strb    r3, [r5, #0xBB]
        strb    lr, [r5, #0xBC]
        strb    r7, [r5, #0xBD]
        strb    r8, [r5, #0xBE]
        strb    r4, [r5, #0xBF]
LENQ9:
        mov     r0, r5
        ldr     r2, [sp, #8]
        mov     r1, r6
        bl      ownvc_SumPredictOBMC8x8_8u_C1R
        mov     r0, #0
        add     sp, sp, #0x4A, 30
        ldmia   sp!, {r4 - r11, pc}
LENQ10:
        mvn     r0, #7
        add     sp, sp, #0x4A, 30
        ldmia   sp!, {r4 - r11, pc}


