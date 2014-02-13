        .text
        .align  4
        .globl  nearbyintf


nearbyintf:
        stmdb   sp!, {r4, lr}
        mov     r3, r0
        mvn     r2, #2, 2
        and     r1, r3, r2
        bic     r0, r3, r2
        mov     r12, r1, asr #23
        cmp     r12, #0x7E
        ldmltia sp!, {r4, pc}
        cmp     r12, #0x96
        mov     r2, #2, 10
        blt     LABF0
        add     r2, r2, #0x7F, 8
        cmp     r2, r1
        movge   r0, r3
        ldmgeia sp!, {r4, pc}
        orr     r0, r3, #1, 10
        ldmia   sp!, {r4, pc}
LABF0:
        sub     r1, r12, #0x7E
        sub     r12, r2, #1
        and     r12, r3, r12
        orr     r3, r12, #2, 10
        mvn     r12, #0xFF, 8
        and     lr, r3, r12, asr r1
        mov     r12, r2, asr r1
        cmp     r12, lr
        mov     lr, #0xFF, 8
        bne     LABF1
        mov     r4, #1, 8
        tst     r3, r4, asr r1
        bne     LABF1
        cmp     r1, #0
        mvneq   r1, #0x7D
        and     lr, r3, lr, asr r1
        b       LABF2
LABF1:
        add     r12, r3, r12
        and     lr, r12, lr, asr r1
LABF2:
        cmp     lr, #1, 8
        movge   lr, lr, asr #1
        addge   r1, r1, #1
        add     r1, r1, #0x7E
        sub     r2, r2, #1
        orr     r1, r0, r1, lsl #23
        and     r2, lr, r2
        orr     r0, r1, r2
        ldmia   sp!, {r4, pc}


