        .text
        .align  4
        .globl  ownsGetBits_AAC


ownsGetBits_AAC:
        stmdb   sp!, {r4 - r6, lr}
        ldr     r3, [r0]
        ldr     r12, [r1]
        ldrb    r6, [r3, #1]
        ldrb    r5, [r3]
        ldrb    r4, [r3, #2]
        ldrb    lr, [r3, #3]
        mov     r6, r6, lsl #16
        orr     r5, r6, r5, lsl #24
        orr     r4, r5, r4, lsl #8
        add     r2, r12, r2
        orr     lr, r4, lr
        mvn     r4, #0
        and     r12, lr, r4, lsr r12
        add     r3, r3, r2, lsr #3
        rsb     lr, r2, #0x20
        str     r3, [r0]
        mov     r0, r12, lsr lr
        and     r2, r2, #7
        str     r2, [r1]
        ldmia   sp!, {r4 - r6, pc}


