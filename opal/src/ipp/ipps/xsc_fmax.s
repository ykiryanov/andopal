        .text
        .align  4
        .globl  fmax


fmax:
        stmdb   sp!, {r4 - r7, lr}
        mov     r12, #0xFF
        orr     r12, r12, #7, 24
        cmp     r12, r3, asr #20
        mvn     r12, #2, 2
        ble     LACR1
        and     r4, r3, r12
        and     lr, r1, r12
        eor     r4, r4, r3, asr #31
        eor     r5, lr, r1, asr #31
        cmp     r5, r4
        eor     r7, r2, r3, asr #31
        eor     r6, r0, r1, asr #31
        blt     LACR0
        cmp     r5, r4
        bne     LACR2
        cmp     r6, r7
        bcs     LACR2
LACR0:
        mov     r0, r2
        mov     r1, r3
        and     lr, r3, r12
        b       LACR2
LACR1:
        orrs    lr, r2, r3, lsl #12
        andne   lr, r1, r12
        bne     LACR2
        mov     r0, r2
        mov     r1, r3
        and     lr, r3, r12
LACR2:
        rsb     r4, r0, #0
        orr     r5, r0, r4
        mov     r4, #0xFF
        orr     r5, lr, r5, lsr #31
        orr     lr, r4, #7, 24
        rsb     r5, r5, lr, lsl #20
        tst     r5, #2, 2
        beq     LACR3
        rsb     r0, r2, #0
        orr     r0, r2, r0
        and     r12, r3, r12
        orr     r0, r12, r0, lsr #31
        rsb     lr, r0, lr, lsl #20
        mov     r0, r2
        mov     lr, lr, asr #31
        and     lr, lr, #2, 14
        orr     r1, r3, lr
LACR3:
        ldmia   sp!, {r4 - r7, pc}


