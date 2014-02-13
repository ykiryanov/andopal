        .text
        .align  4
        .globl  rint


rint:
        stmdb   sp!, {r4, lr}
        mvn     r2, #0
        mov     r12, #0xFF
        add     r3, r2, #2, 22
        orr     r12, r12, #3, 24
        and     r3, r3, r1, lsr #20
        sub     r12, r3, r12
        cmp     r12, #0x34
        bcs     LAAU1
        cmp     r12, #0x15
        bls     LAAU0
        rsb     r3, r12, #0x34
        mov     lr, r2, lsl r3
        sub     r2, r12, #0x15
        bic     r12, r0, lr, lsl #1
        and     r0, lr, r0
        mov     lr, r12, lsl #1
        orr     r12, lr, r12, lsr r3
        mov     r2, r12, lsl r2
        mov     r2, r2, lsr #1
        rsb     r2, r2, #1, 2
        mov     r2, r2, lsr #31
        adds    r0, r0, r2, lsl r3
        adc     r1, r1, #0
        b       LAAU3
LAAU0:
        mov     lr, r0, lsl #4
        rsb     r3, r12, #0x18
        add     r12, r2, #1, 12
        mov     r0, r0, lsr #28
        and     r4, r1, r12
        mov     r2, r2, lsl r3
        orr     r0, r0, r4, lsl #4
        rsb     r4, lr, #0
        orr     r4, lr, r4
        bic     r12, r1, r12
        orr     r0, r0, r4, lsr #31
        orr     lr, r0, #1, 8
        bic     r4, r0, r2
        bic     lr, lr, r2, lsl #1
        mov     lr, lr, lsr r3
        and     r0, r0, r2
        orr     r4, lr, r4, lsl #1
        mov     r2, #1
        rsb     r4, r4, r2, lsl r3
        mov     r4, r4, lsr #31
        add     r3, r0, r4, lsl r3
        add     r1, r12, r3, lsr #4
        mov     r0, r3, lsl #28
        b       LAAU3
LAAU1:
        cmp     r12, #1, 22
        bls     LAAU2
        rsb     r3, r0, #0
        orr     r0, r0, r3
        mov     r3, #0xFF, 10
        orr     r3, r3, #1, 2
        orr     r0, r1, r0, lsr #31
        sub     r3, r3, r0, lsl #1
        add     r2, r2, #1, 22
        mvn     r0, #2, 2
        mov     r2, r2, lsl #20
        bic     r0, r1, r0
        and     r3, r2, r3, asr #31
        orr     r1, r3, r0
        mov     r0, #0
        b       LAAU3
LAAU2:
        cmp     r12, #1, 22
        bne     LAAU3
        orrs    r2, r0, r1, lsl #12
        orrne   r1, r1, #2, 14
LAAU3:
        ldmia   sp!, {r4, pc}


