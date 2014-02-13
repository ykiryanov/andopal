        .text
        .align  4
        .globl  __arm_add_ll


__arm_add_ll:
        adds    r0, r0, r2
        adc     r1, r1, r3
        bx      lr


