        .text
        .align  4
        .globl  lroundf


lroundf:
        stmdb   sp!, {lr}
        sub     sp, sp, #8
        mov     r2, r0
        mvn     r3, #2, 2
        str     r0, [sp, #4]
        and     r0, r2, r3
        bic     r1, r2, r3
        mov     r12, r0, asr #23
        cmp     r12, #0x7E
        bgt     LABJ2
        cmp     r12, #0x7E
        beq     LABJ0
        cmp     r12, #0x7E
        bge     LABJ3
        mov     r0, #0
        add     sp, sp, #8
        ldr     pc, [sp], #4
LABJ0:
        cmp     r1, #2, 2
        bne     LABJ1
        mvn     r0, #0
        add     sp, sp, #8
        ldr     pc, [sp], #4
LABJ1:
        mov     r0, #1
        add     sp, sp, #8
        ldr     pc, [sp], #4
LABJ2:
        cmp     r12, #0x9E
        blt     LABJ5
LABJ3:
        cmp     r0, #0xCF, 8
        mov     r0, #2, 2
        beq     LABJ4
        mov     r2, r2, lsl #1
        cmp     r2, #0xFF, 8
        bls     LABJ6
        add     sp, sp, #8
        ldr     pc, [sp], #4
LABJ4:
        mov     r0, #2, 2
        add     sp, sp, #8
        ldr     pc, [sp], #4
LABJ5:
        sub     r0, r12, #0x7F
        mov     r12, #0xFE, 10
        orr     r12, r12, #3, 2
        mvn     r12, r12
        and     r12, r2, r12
        orr     r2, r12, #2, 10
        mov     r12, #1, 10
        mov     r3, r3, lsl #23
        add     r12, r2, r12, asr r0
        cmp     r0, #0x17
        and     r3, r12, r3, asr r0
        rsble   r0, r0, #0x17
        movle   r0, r3, asr r0
        subgt   r0, r0, #0x17
        movgt   r0, r3, lsl r0
        cmp     r1, #2, 2
        rsbeq   r0, r0, #0
        add     sp, sp, #8
        ldr     pc, [sp], #4
LABJ6:
        str     r0, [sp]
        add     r3, sp, #4
        mov     r2, sp
        add     r1, sp, #4
        mov     r0, r3
        mov     r3, #0xBF
        bl      __libm_error_support
        ldr     r0, [sp]
        add     sp, sp, #8
        ldr     pc, [sp], #4


