        .text
        .align  4
        .globl  strcmp


strcmp:
        mov     r2, r0, lsl #30
        subs    r3, r2, r1, lsl #30
        bne     LAIQ_byte_cpy
LAIQ_same_align:
        teq     r2, #0
        beq     LAIQ_word_aligned
LAIQ_align_loop:
        ldrb    r2, [r0], #1
        ldrb    r3, [r1], #1
        cmp     r2, #1
        cmpcs   r2, r3
        subne   r0, r2, r3
        bxne    lr
        tst     r0, #3
        bne     LAIQ_align_loop
LAIQ_word_aligned:
        ldr     r2, [r0], #4
        ldr     r3, [r1], #4
        mov     r12, #1
        orr     r12, r12, #1, 24
        pld     [r1, #0x1C]
        orr     r12, r12, r12, lsl #16
LAIQ_loop4:
        cmp     r2, r3
        subeq   r2, r3, r12
        biceq   r2, r2, r3
        andeqs  r2, r2, r12, lsl #7
        ldreq   r2, [r0], #4
        ldreq   r3, [r1], #4
        beq     LAIQ_loop4
        ldr     r2, [r0, #-4]
        mov     r0, #0
        subs    r12, r2, r3
        bxeq    lr
        mov     r0, r2, lsl #24
        mov     r1, r3, lsl #24
        mov     r0, r0, asr #24
        subs    r0, r0, r1, asr #24
        bxne    lr
        tst     r2, #0xFF
        bxeq    lr
        mov     r0, r2, lsl #16
        mov     r1, r3, lsl #16
        mov     r0, r0, asr #24
        subs    r0, r0, r1, asr #24
        bxne    lr
        tst     r2, #0xFF, 24
        bxeq    lr
        mov     r0, r2, lsl #8
        mov     r1, r3, lsl #8
        mov     r0, r0, asr #24
        subs    r0, r0, r1, asr #24
        bxne    lr
        tst     r2, #0xFF, 16
        bxeq    lr
        mov     r0, r2, asr #24
        subs    r0, r0, r3, asr #24
        bx      lr
LAIQ_byte_cpy:
        ldrb    r2, [r0], #1
        ldrb    r3, [r1], #1
        pld     [r0, #0x1F]
        pld     [r1, #0x1F]
LAIQ_loop:
        cmp     r2, #1
        cmpcs   r2, r3
        ldreqsb r2, [r0], #1
        ldreqsb r3, [r1], #1
        beq     LAIQ_loop
        sub     r0, r2, r3
        bx      lr


