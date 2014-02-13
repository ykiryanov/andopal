        .text
        .align  4
        .globl  frexp


frexp:
        stmdb   sp!, {r4, lr}
        mov     r3, #0xFF
        orr     r3, r3, #7, 24
        and     r12, r3, r1, lsr #20
        cmp     r3, r12
        movle   r12, #0
        ble     LACL3
        mov     r3, #0xFE
        cmp     r12, #0
        orr     r3, r3, #3, 24
        beq     LACL0
        mov     lr, #0xFE, 12
        eor     r1, r1, r12, lsl #20
        orr     lr, lr, #3, 4
        orr     r1, r1, lr
        sub     r12, r12, r3
        b       LACL3
LACL0:
        orrs    lr, r0, r1, lsl #1
        beq     LACL3
        movs    r12, r1, lsl #12
        beq     LACL1
        clz     r12, r12
        rsb     lr, r12, #0x1F
        mov     lr, r0, lsr lr
        add     r4, r12, #1
        orr     lr, lr, r1, lsl r4
        mov     r0, r0, lsl r4
        b       LACL2
LACL1:
        clz     r12, r0
        mov     lr, r0, lsl r12
        add     r12, r12, #0x14
        mov     r0, lr, lsl #21
        mov     lr, lr, lsr #11
LACL2:
        mov     r4, r3, lsl #20
        add     r4, r4, #1, 12
        eor     lr, lr, r4
        mvn     r4, #2, 2
        bic     r1, r1, r4
        rsb     r3, r3, #0
        orr     r1, lr, r1
        rsb     r12, r12, r3
LACL3:
        str     r12, [r2]
        ldmia   sp!, {r4, pc}


