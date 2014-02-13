        .text
        .align  4
        .globl  _ippsIIR_Direct_16s_I


_ippsIIR_Direct_16s_I:
        stmdb   sp!, {lr}
        sub     sp, sp, #8
        ldr     r12, [sp, #0xC]
        cmp     r3, #1
        blt     LCIM1
        cmp     r0, #0
        beq     LCIM2
        cmp     r2, #0
        beq     LCIM2
        cmp     r12, #0
        beq     LCIM2
        add     lr, r2, r3, lsl #1
        ldrsh   lr, [lr, #2]
        cmp     lr, #0
        blt     LCIM3
        cmp     r1, #0
        ble     LCIM0
        str     r3, [sp]
        mov     r3, r2
        mov     r2, r1
        str     r12, [sp, #4]
        mov     r1, r0
        bl      ownsIIR_Direct_16s
        add     sp, sp, #8
        ldr     pc, [sp], #4
LCIM0:
        mvn     r0, #5
        add     sp, sp, #8
        ldr     pc, [sp], #4
LCIM1:
        mvn     r0, #0x18
        add     sp, sp, #8
        ldr     pc, [sp], #4
LCIM2:
        mvn     r0, #7
        add     sp, sp, #8
        ldr     pc, [sp], #4
LCIM3:
        mvn     r0, #0xC
        add     sp, sp, #8
        ldr     pc, [sp], #4


