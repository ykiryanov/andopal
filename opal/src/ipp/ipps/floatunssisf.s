        .text
        .align  4
        .globl  __aeabi_ui2f
        .globl  __floatunssisf


__aeabi_ui2f:
__floatunssisf:
        cmp     r0, #0
        bxeq    lr
        clz     r2, r0
        mov     r0, r0, lsl r2
        rsb     r2, r2, #0x9D
        mov     r2, r2, lsl #23
        and     r3, r0, #1, 24
        orr     r3, r3, r0, lsl #24
        subs    r3, r3, #6, 2
        adc     r0, r2, r0, lsr #8
        bx      lr


