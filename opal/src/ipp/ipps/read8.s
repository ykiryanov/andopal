        .text
        .align  4
        .globl  __aeabi_uread8


__aeabi_uread8:
        tst     r0, #3
        ldreq   r1, [r0, #4]
        ldreq   r0, [r0]
        bxeq    lr
        ldrb    r1, [r0, #4]
        ldrb    r2, [r0, #5]
        ldrb    r3, [r0, #6]
        ldrb    r12, [r0, #7]
        orr     r1, r1, r2, lsl #8
        orr     r3, r3, r12, lsl #8
        orr     r1, r1, r3, lsl #16
        ldrb    r12, [r0, #3]
        ldrb    r3, [r0, #2]
        ldrb    r2, [r0, #1]
        ldrb    r0, [r0]
        orr     r3, r3, r12, lsl #8
        orr     r0, r0, r2, lsl #8
        orr     r0, r0, r3, lsl #16
        bx      lr


