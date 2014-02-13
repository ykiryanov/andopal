        .text
        .align  4
        .globl  __intel_imod
        .globl  __modsi3


__intel_imod:
__modsi3:
        cmp     r1, #0
        beq     LAGI__mod0
        rsbmi   r1, r1, #0
        cmp     r0, #2, 2
        rsbcs   r0, r0, #0
        mov     r2, r2, rrx
        cmp     r1, r0, lsr #16
        bhi     LAGI_SHORT_Q
        cmp     r1, r0, lsr #31
        subls   r0, r0, r1, lsl #31
        cmp     r1, r0, lsr #30
        subls   r0, r0, r1, lsl #30
        cmp     r1, r0, lsr #29
        subls   r0, r0, r1, lsl #29
        cmp     r1, r0, lsr #28
        subls   r0, r0, r1, lsl #28
        cmp     r1, r0, lsr #27
        subls   r0, r0, r1, lsl #27
        cmp     r1, r0, lsr #26
        subls   r0, r0, r1, lsl #26
        cmp     r1, r0, lsr #25
        subls   r0, r0, r1, lsl #25
        cmp     r1, r0, lsr #24
        subls   r0, r0, r1, lsl #24
        cmp     r1, r0, lsr #23
        subls   r0, r0, r1, lsl #23
        cmp     r1, r0, lsr #22
        subls   r0, r0, r1, lsl #22
        cmp     r1, r0, lsr #21
        subls   r0, r0, r1, lsl #21
        cmp     r1, r0, lsr #20
        subls   r0, r0, r1, lsl #20
        cmp     r1, r0, lsr #19
        subls   r0, r0, r1, lsl #19
        cmp     r1, r0, lsr #18
        subls   r0, r0, r1, lsl #18
        cmp     r1, r0, lsr #17
        subls   r0, r0, r1, lsl #17
        cmp     r1, r0, lsr #16
        subls   r0, r0, r1, lsl #16
LAGI_SHORT_Q:
        cmp     r1, r0, lsr #15
        subls   r0, r0, r1, lsl #15
        cmp     r1, r0, lsr #14
        subls   r0, r0, r1, lsl #14
        cmp     r1, r0, lsr #13
        subls   r0, r0, r1, lsl #13
        cmp     r1, r0, lsr #12
        subls   r0, r0, r1, lsl #12
        cmp     r1, r0, lsr #11
        subls   r0, r0, r1, lsl #11
        cmp     r1, r0, lsr #10
        subls   r0, r0, r1, lsl #10
        cmp     r1, r0, lsr #9
        subls   r0, r0, r1, lsl #9
        cmp     r1, r0, lsr #8
        subls   r0, r0, r1, lsl #8
        cmp     r1, r0, lsr #7
        subls   r0, r0, r1, lsl #7
        cmp     r1, r0, lsr #6
        subls   r0, r0, r1, lsl #6
        cmp     r1, r0, lsr #5
        subls   r0, r0, r1, lsl #5
        cmp     r1, r0, lsr #4
        subls   r0, r0, r1, lsl #4
        cmp     r1, r0, lsr #3
        subls   r0, r0, r1, lsl #3
        cmp     r1, r0, lsr #2
        subls   r0, r0, r1, lsl #2
        cmp     r1, r0, lsr #1
        subls   r0, r0, r1, lsl #1
        cmp     r1, r0
        subls   r0, r0, r1
        cmp     r2, #0
        rsbmi   r0, r0, #0
        bx      lr
LAGI__mod0:
        mov     r0, #0
        bx      lr


