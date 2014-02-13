        .text
        .align  4
        .globl  round


round:
        stmdb   sp!, {r4, r5, lr}
        mvn     r4, #2, 2
        and     r3, r1, r4
        mov     lr, #0xFF
        mov     r2, #0xF3
        mov     r12, r3, lsr #20
        orr     r5, lr, #7, 24
        cmp     r12, #1, 22
        orr     r2, r2, #3, 24
        mvn     lr, #0
        bge     LAAS2
        add     r2, r2, #0xB
        cmp     r2, r12
        ble     LAAS0
        bic     r1, r1, r4
        mov     r0, #0
        ldmia   sp!, {r4, r5, pc}
LAAS0:
        cmp     r12, #1, 22
        bge     LAAS3
        cmp     r3, r5, lsl #19
        bic     r4, r1, r4
        orrcs   r1, r4, #1, 2
        bcs     LAAS1
        mov     r0, #0xFF
        orr     r0, r0, #3, 24
        orr     r1, r4, r0, lsl #20
LAAS1:
        mov     r0, #0
        ldmia   sp!, {r4, r5, pc}
LAAS2:
        add     r4, r2, #0x40
        cmp     r4, r12
        bgt     LAAS6
LAAS3:
        cmp     r5, r12
        bne     LAAS5
        add     lr, lr, #2, 22
        cmp     r3, lr, lsl #20
        bhi     LAAS4
        cmp     r0, #0
        bls     LAAS5
LAAS4:
        orr     r1, r1, #2, 14
        ldmia   sp!, {r4, r5, pc}
LAAS5:
        ldmia   sp!, {r4, r5, pc}
LAAS6:
        add     r4, lr, #1, 22
        sub     r4, r12, r4
        cmp     r4, #0x14
        bge     LAAS7
        sub     r0, r12, r2
        mov     r0, r3, lsl r0
        add     r3, r2, #0x1F
        rsb     r3, r12, r3
        mov     r0, r0, lsr #31
        add     r2, r2, #0x20
        add     r3, r1, r0, lsl r3
        rsb     r2, r12, r2
        and     r1, r3, lr, lsl r2
        mov     r0, #0
        b       LAAS8
LAAS7:
        add     r2, lr, #0xFD, 30
        add     r2, r2, #0x20
        sub     r12, r12, r2
        mov     r3, r0, lsl r12
        rsb     r2, r12, #0x1F
        mov     r3, r3, lsr #31
        adds    r2, r0, r3, lsl r2
        rsb     r12, r12, #0x20
        and     r0, r2, lr, lsl r12
        adc     r1, r1, #0
LAAS8:
        ldmia   sp!, {r4, r5, pc}


