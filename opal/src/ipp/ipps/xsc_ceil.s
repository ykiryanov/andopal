        .text
        .align  4
        .globl  ceil


ceil:
        stmdb   sp!, {r4, r5, lr}
        mvn     r2, #0
        add     r12, r2, #2, 22
        mov     lr, #0xFF
        mov     r3, r1
        orr     lr, lr, #3, 24
        and     r12, r12, r3, lsr #20
        sub     r4, r12, lr
        cmp     r4, #0x34
        mvn     lr, #2, 2
        mov     r12, #0
        bcs     LADU2
        rsb     r1, r4, #0x34
        cmp     r1, #0x20
        biccc   r4, r0, r2, lsl r1
        andcc   r12, r0, r2, lsl r1
        bcc     LADU0
        sub     r4, r1, #0x20
        bic     r5, r3, r2, lsl r4
        and     r3, r3, r2, lsl r4
        orr     r4, r0, r5
LADU0:
        bic     lr, r3, lr
        bics    lr, r4, lr, asr #31
        beq     LADU1
        cmp     r1, #0x20
        mov     r0, #1
        subcs   r1, r1, #0x20
        addcs   r3, r3, r0, lsl r1
        bcs     LADU1
        adds    r12, r12, r0, lsl r1
        adc     r3, r3, #0
LADU1:
        mov     r1, r3
        mov     r0, r12
        b       LADU4
LADU2:
        cmp     r4, #1, 22
        bls     LADU4
        bics    r1, r3, lr
        bne     LADU3
        orrs    r3, r0, r3, lsl #1
        addne   r2, r2, #1, 22
        movne   r1, r2, lsl #20
LADU3:
        mov     r0, r12
LADU4:
        ldmia   sp!, {r4, r5, pc}


