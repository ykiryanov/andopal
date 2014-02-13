        .text
        .align  4
        .globl  copysign


copysign:
        stmdb   sp!, {lr}
        rsb     r12, r0, #0
        mvn     r2, #2, 2
        orr     r12, r0, r12
        mov     lr, #0xFF, 12
        and     r1, r1, r2
        orr     r12, r1, r12, lsr #31
        orr     lr, lr, #7, 4
        cmp     lr, r12
        orrcc   r1, r1, #2, 14
        bic     r2, r3, r2
        orr     r1, r1, r2
        ldr     pc, [sp], #4


