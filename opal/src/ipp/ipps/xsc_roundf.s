        .text
        .align  4
        .globl  roundf


roundf:
        stmdb   sp!, {r4}
        mov     r4, r0
        mvn     r2, #2, 2
        and     r1, r4, r2
        mov     r3, #0xFE, 10
        mov     r12, r1, asr #23
        cmp     r12, #0x7E
        orr     r3, r3, #3, 2
        bic     r0, r4, r2
        bgt     LAAR1
        cmp     r12, #0x7E
        beq     LAAR0
        cmp     r12, #0x7E
        ldrlt   r4, [sp], #4
        bxlt    lr
        b       LAAR2
LAAR0:
        orr     r0, r0, #0xFE, 10
        ldr     r4, [sp], #4
        bx      lr
LAAR1:
        cmp     r12, #0x96
        blt     LAAR3
LAAR2:
        sub     r3, r3, #2, 2
        cmp     r3, r1
        movge   r0, r4
        ldrge   r4, [sp], #4
        bxge    lr
        orr     r0, r4, #1, 10
        ldr     r4, [sp], #4
        bx      lr
LAAR3:
        sub     r1, r12, #0x7F
        mvn     r12, r3
        and     r4, r4, r12
        mov     r12, #1, 10
        add     r12, r4, r12, asr r1
        and     r3, r12, r3, asr r1
        cmp     r3, #2, 10
        blt     LAAR4
        mov     r2, r2, lsl #23
        mvn     r2, r2
        and     r2, r3, r2
        add     r1, r1, #1
        mov     r3, r2, asr #1
LAAR4:
        add     r1, r1, #0x7F
        orr     r1, r0, r1, lsl #23
        orr     r0, r1, r3
        ldr     r4, [sp], #4
        bx      lr


