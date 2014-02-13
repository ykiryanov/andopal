        .text
        .align  4
        .globl  _ippsFDPInit_32f


_ippsFDPInit_32f:
        stmdb   sp!, {lr}
        cmp     r0, #0
        beq     LGFA0
        cmp     r2, #0
        beq     LGFA0
        cmp     r1, #1
        mvnlt   r0, #5
        ldrlt   pc, [sp], #4
        add     r3, r2, #0x24
        and     r12, r3, #0x1F
        rsb     r12, r12, #0
        and     r12, r12, #0x1F
        add     r12, r3, r12
        and     lr, r2, #0x1F
        mov     r3, r1, lsl #2
        rsb     lr, lr, #0
        add     r3, r3, #0x1F
        and     lr, lr, #0x1F
        str     r12, [lr, +r2]
        bic     r3, r3, #0x1F
        add     r12, r12, r3
        add     r2, r2, lr
        str     r12, [r2, #4]
        add     r12, r12, r3
        str     r12, [r2, #8]
        str     r1, [r2, #0x18]
        add     r12, r12, r3
        add     r1, r12, r3
        add     r3, r1, r3
        str     r1, [r2, #0x10]
        mov     r1, #0
        str     r1, [r2, #0x20]
        mov     r1, #0x3B
        str     r12, [r2, #0xC]
        str     r3, [r2, #0x14]
        str     r1, [r2, #0x1C]
        str     r2, [r0]
        mov     r0, r2
        bl      _ippsFDPReset_32f
        mov     r0, #0
        ldr     pc, [sp], #4
LGFA0:
        mvn     r0, #7
        ldr     pc, [sp], #4


