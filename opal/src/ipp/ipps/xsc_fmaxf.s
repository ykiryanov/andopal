        .text
        .align  4
        .globl  fmaxf


fmaxf:
        stmdb   sp!, {r4, lr}
        mov     r2, #0xFE, 10
        mvn     r3, #2, 2
        orr     r2, r2, #1, 2
        add     lr, r2, #1
        and     r12, r0, r3
        sub     r4, r12, lr
        and     r3, r1, r3
        sub     lr, r3, lr
        tst     r4, lr
        bmi     LACQ1
        cmp     r2, r12
        movlt   r0, r1
        movlt   r12, r3
        rsb     r2, r12, r2
        mov     r1, r2, asr #31
        and     r1, r1, #1, 10
        orr     r0, r0, r1
LACQ0:
        ldmia   sp!, {r4, pc}
LACQ1:
        eor     r12, r12, r0, asr #31
        eor     r3, r3, r1, asr #31
        cmp     r3, r12
        ble     LACQ0
        mov     r0, r1
        ldmia   sp!, {r4, pc}


