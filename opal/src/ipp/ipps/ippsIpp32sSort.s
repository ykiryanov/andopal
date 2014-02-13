        .text
        .align  4
        .globl  ownippsIpp32sSort


ownippsIpp32sSort:
        stmdb   sp!, {r4, r5, lr}
        sub     r1, r1, #1
        cmp     r1, #0
        ble     LBHK3
        add     r2, r0, #4
LBHK0:
        cmp     r1, #0
        ble     LBHK2
        mov     r12, r2
        mov     lr, #0
        mov     r3, r0
LBHK1:
        ldr     r5, [r3]
        ldr     r4, [r12]
        cmp     r5, r4
        strgt   r4, [r3]
        strgt   r5, [r12]
        add     lr, lr, #1
        cmp     lr, r1
        add     r12, r12, #4
        add     r3, r3, #4
        blt     LBHK1
LBHK2:
        sub     r1, r1, #1
        cmp     r1, #0
        bgt     LBHK0
LBHK3:
        ldmia   sp!, {r4, r5, pc}


