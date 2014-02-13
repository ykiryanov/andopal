        .text
        .align  4
        .globl  __armneg_64


__armneg_64:
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
        bx      lr


