        .text
        .align  4
        .globl  strncpy


strncpy:
        mov     r3, r0
        cmp     r2, #0
        bxeq    lr
LAIK_strncpy_loop:
        ldrb    r12, [r1], #1
        strb    r12, [r3], #1
        cmp     r12, #0
        subnes  r2, r2, #1
        bne     LAIK_strncpy_loop
        cmp     r2, #0
LAIK_fill_loop:
        subnes  r2, r2, #1
        strneb  r12, [r3], #1
        bne     LAIK_fill_loop
        bx      lr


