        .text
        .align  4
        .globl  _ippsIIR_BiQuadDirect_16s


_ippsIIR_BiQuadDirect_16s:
        stmdb   sp!, {lr}
        sub     sp, sp, #8
        ldr     lr, [sp, #0xC]
        ldr     r12, [sp, #0x10]
        cmp     lr, #1
        blt     LCIP1
        cmp     r0, #0
        beq     LCIP2
        cmp     r3, #0
        beq     LCIP2
        cmp     r12, #0
        beq     LCIP2
        cmp     r1, #0
        beq     LCIP2
        cmp     r2, #0
        ble     LCIP0
        str     r12, [sp, #4]
        str     lr, [sp]
        bl      ownsIIR_BiQuadDirect_16s
        add     sp, sp, #8
        ldr     pc, [sp], #4
LCIP0:
        mvn     r0, #5
        add     sp, sp, #8
        ldr     pc, [sp], #4
LCIP1:
        mvn     r0, #0x18
        add     sp, sp, #8
        ldr     pc, [sp], #4
LCIP2:
        mvn     r0, #7
        add     sp, sp, #8
        ldr     pc, [sp], #4


