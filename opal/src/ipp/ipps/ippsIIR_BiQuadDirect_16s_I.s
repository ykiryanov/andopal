        .text
        .align  4
        .globl  _ippsIIR_BiQuadDirect_16s_I


_ippsIIR_BiQuadDirect_16s_I:
        stmdb   sp!, {lr}
        sub     sp, sp, #8
        ldr     r12, [sp, #0xC]
        cmp     r3, #1
        blt     LCIO1
        cmp     r0, #0
        beq     LCIO2
        cmp     r2, #0
        beq     LCIO2
        cmp     r12, #0
        beq     LCIO2
        cmp     r1, #0
        ble     LCIO0
        str     r3, [sp]
        mov     r3, r2
        mov     r2, r1
        str     r12, [sp, #4]
        mov     r1, r0
        bl      _ippsIIR_BiQuadDirect_16s
        add     sp, sp, #8
        ldr     pc, [sp], #4
LCIO0:
        mvn     r0, #5
        add     sp, sp, #8
        ldr     pc, [sp], #4
LCIO1:
        mvn     r0, #0x18
        add     sp, sp, #8
        ldr     pc, [sp], #4
LCIO2:
        mvn     r0, #7
        add     sp, sp, #8
        ldr     pc, [sp], #4


