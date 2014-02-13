        .text
        .align  4
        .globl  trunc


trunc:
        stmdb   sp!, {r4, lr}
        mvn     r2, #0
        mvn     lr, #2, 2
        add     r12, r2, #1, 22
        and     r3, r1, lr
        cmp     r12, r3, lsr #20
        mov     r12, #0xFF
        orr     r12, r12, #7, 24
        bic     r4, r1, lr
        blt     LAAB0
        mov     lr, #0xFF
        orr     lr, lr, #3, 24
        cmp     lr, r3, lsr #20
        bne     LAAB1
        add     r2, r2, #1, 22
        mov     r0, #0
        orr     r1, r4, r2, lsl #20
        ldmia   sp!, {r4, pc}
LAAB0:
        sub     lr, r12, #0xF3, 30
        cmp     lr, r3, lsr #20
        bgt     LAAB4
LAAB1:
        cmp     r12, r3, lsr #20
        beq     LAAB7
        sub     r12, r12, #0xF3, 30
        cmp     r12, r3, lsr #20
        bgt     LAAB3
LAAB2:
        ldmia   sp!, {r4, pc}
LAAB3:
        mov     r1, r4
        mov     r0, #0
        ldmia   sp!, {r4, pc}
LAAB4:
        sub     lr, r12, #0xFB, 30
        cmp     lr, r3, lsr #20
        blt     LAAB5
        sub     r12, r12, #0xFB, 30
        mov     r0, #0
        sub     r12, r12, r3, lsr #20
        and     r1, r1, r2, lsl r12
        b       LAAB6
LAAB5:
        add     r12, r2, #2, 22
        sub     r12, r12, #0xF3, 30
        sub     r12, r12, r3, lsr #20
        and     r0, r0, r2, lsl r12
LAAB6:
        ldmia   sp!, {r4, pc}
LAAB7:
        add     r2, r2, #1, 12
        tst     r3, r2
        bne     LAAB8
        cmp     r0, #0
        beq     LAAB2
LAAB8:
        orr     r1, r1, #2, 14
        ldmia   sp!, {r4, pc}


