        .text
        .align  4
        .globl  nearbyint


nearbyint:
        stmdb   sp!, {r4 - r6, lr}
        mvn     r12, #2, 2
        mov     r4, #0xFF
        and     r2, r1, r12
        orr     lr, r4, #3, 24
        mov     r3, r2, lsr #20
        cmp     r3, #1, 22
        orr     r4, r4, #7, 24
        mvn     r5, #0
        bge     LABG3
        sub     r6, lr, #1
        cmp     r6, r3
        ble     LABG0
        bic     r1, r1, r12
        mov     r0, #0
        ldmia   sp!, {r4 - r6, pc}
LABG0:
        cmp     r3, #1, 22
        bge     LABG4
        cmp     r2, r4, lsl #19
        bic     r12, r1, r12
        orrcs   r12, r12, #1, 2
        bcs     LABG2
        cmp     r2, lr, lsl #20
        bcs     LABG1
        orrs    r1, r0, r1, lsl #12
        beq     LABG2
LABG1:
        orr     r12, r12, lr, lsl #20
LABG2:
        mov     r1, r12
        mov     r0, #0
        ldmia   sp!, {r4 - r6, pc}
LABG3:
        add     r12, lr, #0x34
        cmp     r12, r3
        bgt     LABG7
LABG4:
        cmp     r4, r3
        bne     LABG6
        add     r5, r5, #2, 22
        cmp     r2, r5, lsl #20
        bhi     LABG5
        cmp     r0, #0
        bls     LABG6
LABG5:
        orr     r1, r1, #2, 14
        ldmia   sp!, {r4 - r6, pc}
LABG6:
        ldmia   sp!, {r4 - r6, pc}
LABG7:
        sub     r12, r3, lr
        cmp     r12, #0x14
        mov     r4, #0
        mov     r12, #1
        bge     LABG8
        sub     r6, r3, #0xFD, 30
        mov     r2, r2, lsl r6
        mov     r6, r2, lsl #2
        orr     r2, r6, r2, lsr #31
        orrs    r2, r0, r2
        moveq   r12, r4
        add     r2, lr, #0x13
        rsb     r2, r3, r2
        add     lr, lr, #0x14
        add     r2, r1, r12, lsl r2
        rsb     lr, r3, lr
        and     r1, r2, r5, lsl lr
        b       LABG11
LABG8:
        add     r2, r5, #1, 22
        add     r2, r2, #0x14
        subs    r3, r3, r2
        bne     LABG9
        add     r2, r3, #1
        mov     lr, r0, lsl r2
        and     r2, r1, #1
        b       LABG10
LABG9:
        sub     r2, r3, #1
        mov     lr, r0, lsl r2
        mov     r2, lr, lsr #31
        mov     lr, lr, lsl #2
LABG10:
        orrs    lr, r2, lr
        moveq   r12, r4
        rsb     r2, r3, #0x1F
        adds    r2, r0, r12, lsl r2
        rsb     r3, r3, #0x20
        and     r4, r2, r5, lsl r3
        adc     r1, r1, #0
LABG11:
        mov     r0, r4
        ldmia   sp!, {r4 - r6, pc}


