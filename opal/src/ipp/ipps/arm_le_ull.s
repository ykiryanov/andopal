        .text
        .align  4
        .globl  __arm_le_ull


__arm_le_ull:
        cmp     r1, r3
        cmpeq   r0, r2
        movhi   r0, #0
        bhi     LAHF0
        mov     r0, #1
        bx      lr
LAHF0:
        bx      lr


