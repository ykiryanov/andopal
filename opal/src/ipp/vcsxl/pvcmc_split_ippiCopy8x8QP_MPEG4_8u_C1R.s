        .text
        .align  4
        .globl  _ippiCopy8x8QP_MPEG4_8u_C1R


_ippiCopy8x8QP_MPEG4_8u_C1R:
        stmdb   sp!, {lr}
        sub     sp, sp, #0x10
        ldr     lr, [sp, #0x14]
        ldr     r12, [sp, #0x18]
        cmp     r0, #0
        beq     LENU1
        cmp     r2, #0
        beq     LENU1
        ands    lr, lr, #0xF
        bne     LENU0
        bl      ownvc_Copy8x8_8u_C1R
        mov     r0, #0
        add     sp, sp, #0x10
        ldr     pc, [sp], #4
LENU0:
        str     lr, [sp]
        mov     lr, #8
        and     r12, r12, #1
        str     r12, [sp, #4]
        str     lr, [sp, #0xC]
        str     lr, [sp, #8]
        bl      ownvc_CopyQP_8u_C1R
        mov     r0, #0
        add     sp, sp, #0x10
        ldr     pc, [sp], #4
LENU1:
        mvn     r0, #7
        add     sp, sp, #0x10
        ldr     pc, [sp], #4


