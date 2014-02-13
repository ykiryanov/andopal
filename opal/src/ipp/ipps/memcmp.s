        .text
        .align  4
        .globl  memcmp


memcmp:
        cmp     r2, #0
        moveq   r0, #0
        bxeq    lr
        tst     r0, #3
        tsteq   r1, #3
        bne     LAIW_memcmp_byte
        sub     r2, r2, #1
LAIW_memcpy_loop1:
        ldr     r3, [r0], #4
        ldr     r12, [r1], #4
        cmp     r3, r12
        bne     LAIW_mem_difference
        subs    r2, r2, #4
        bhi     LAIW_memcpy_loop1
        mov     r0, #0
        bx      lr
LAIW_mem_difference:
        and     r0, r3, #0xFF
        and     r1, r12, #0xFF
        subs    r0, r0, r1
        bxne    lr
        cmp     r2, #0
        bxeq    lr
        and     r0, r3, #0xFF, 24
        and     r1, r12, #0xFF, 24
        subs    r0, r0, r1
        bxne    lr
        cmp     r2, #1
        bxeq    lr
        and     r0, r3, #0xFF, 16
        and     r1, r12, #0xFF, 16
        subs    r0, r0, r1
        bxne    lr
        cmp     r2, #2
        bxeq    lr
        mov     r0, r3, lsr #24
        sub     r0, r0, r12, lsr #24
        bx      lr
LAIW_memcmp_byte:
        mov     r3, r0
LAIW_memcmp_byte_loop:
        ldrb    r0, [r3], #1
        ldrb    r12, [r1], #1
        subs    r0, r0, r12
        bxne    lr
        subs    r2, r2, #1
        bne     LAIW_memcmp_byte_loop
        bx      lr


