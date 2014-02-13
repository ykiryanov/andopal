        .text
        .align  4
        .globl  ownsConvDown2Check_32f


ownsConvDown2Check_32f:
        cmp     r0, #0
        beq     LAKE0
        ldr     r1, [r0, #4]
        cmp     r1, #0
        beq     LAKE0
        ldr     r1, [r0, #8]
        cmp     r1, #0
        beq     LAKE0
        ldr     r0, [r0]
        cmp     r0, #0
        movgt   r0, #1
        bxgt    lr
LAKE0:
        mov     r0, #0
        bx      lr


