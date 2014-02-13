        .text
        .align  4
        .globl  __arm_sub_ll


__arm_sub_ll:
        subs    r0, r0, r2
        sbc     r1, r1, r3
        bx      lr


