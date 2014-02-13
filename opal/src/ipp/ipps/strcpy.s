        .text
        .align  4
        .globl  strcpy


strcpy:
        pld     [r1]
        pld     [r1, #0x20]
        str     r4, [sp, #-4]!
        mov     r2, r0
        orr     r3, r2, r1
        ands    r3, r3, #3
        bne     LAIP_ByteLoop
        ldr     r12, [r1]
        mov     r3, #1
        orr     r3, r3, #1, 24
        orr     r4, r3, r3, lsl #16
LAIP_WordLoop:
        sub     r3, r12, r4
        bic     r3, r3, r12
        ands    r3, r3, r4, lsl #7
        streq   r12, [r2], #4
        ldreq   r12, [r1, #4]!
        beq     LAIP_WordLoop
LAIP_ByteLoop:
        ldrb    r3, [r1], #1
        strb    r3, [r2], #1
        cmp     r3, #0
        bne     LAIP_ByteLoop
        ldr     r4, [sp], #4
        bx      lr


