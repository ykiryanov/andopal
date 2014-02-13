        .text
        .align  4
        .globl  floor


floor:
        stmdb   sp!, {r4, r5, lr}
        mvn     r2, #0
        add     r12, r2, #2, 22
        mov     r3, r1
        add     lr, r2, #1, 22
        and     r12, r12, r3, lsr #20
        sub     r4, r12, lr
        cmp     r4, #0x34
        mvn     lr, #2, 2
        mov     r12, #0
        bcs     LACV2
        rsb     r1, r4, #0x34
        cmp     r1, #0x20
        biccc   r4, r0, r2, lsl r1
        andcc   r12, r0, r2, lsl r1
        bcc     LACV0
        sub     r4, r1, #0x20
        bic     r5, r3, r2, lsl r4
        and     r3, r3, r2, lsl r4
        orr     r4, r0, r5
LACV0:
        bic     lr, r3, lr
        tst     r4, lr, asr #31
        beq     LACV1
        cmp     r1, #0x20
        mov     r0, #1
        subcs   r1, r1, #0x20
        addcs   r3, r3, r0, lsl r1
        bcs     LACV1
        adds    r12, r12, r0, lsl r1
        adc     r3, r3, #0
LACV1:
        mov     r1, r3
        mov     r0, r12
        b       LACV4
LACV2:
        cmp     r4, #1, 22
        bls     LACV4
        bics    r1, r3, lr
        beq     LACV3
        orrs    r3, r0, r3, lsl #1
        movne   r0, #0xFF, 12
        orrne   r1, r0, #0xB, 4
LACV3:
        mov     r0, r12
LACV4:
        ldmia   sp!, {r4, r5, pc}


