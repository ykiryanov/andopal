        .text
        .align  4
        .globl  ippiSub8x8_8u16s_C1R


ippiSub8x8_8u16s_C1R:
        stmdb   sp!, {lr}
        sub     sp, sp, #8
        ldr     lr, [sp, #0xC]
        ldr     r12, [sp, #0x10]
        cmp     r0, #0
        beq     LKEL0
        cmp     r2, #0
        beq     LKEL0
        cmp     lr, #0
        beq     LKEL0
        str     r12, [sp, #4]
        str     lr, [sp]
        bl      ownvc_Sub8x8_8u16s_C1R
        mov     r0, #0
        add     sp, sp, #8
        ldr     pc, [sp], #4
LKEL0:
        mvn     r0, #7
        add     sp, sp, #8
        ldr     pc, [sp], #4


