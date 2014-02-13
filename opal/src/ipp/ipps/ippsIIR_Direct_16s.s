        .text
        .align  4
        .globl  _ippsIIR_Direct_16s


_ippsIIR_Direct_16s:
        stmdb   sp!, {r4, lr}
        sub     sp, sp, #8
        ldr     lr, [sp, #0x10]
        ldr     r12, [sp, #0x14]
        cmp     lr, #1
        blt     LCIN1
        cmp     r0, #0
        beq     LCIN2
        cmp     r3, #0
        beq     LCIN2
        cmp     r12, #0
        beq     LCIN2
        cmp     r1, #0
        beq     LCIN2
        add     r4, r3, lr, lsl #1
        ldrsh   r4, [r4, #2]
        cmp     r4, #0
        blt     LCIN3
        cmp     r2, #0
        ble     LCIN0
        str     r12, [sp, #4]
        str     lr, [sp]
        bl      ownsIIR_Direct_16s
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}
LCIN0:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}
LCIN1:
        mvn     r0, #0x18
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}
LCIN2:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}
LCIN3:
        mvn     r0, #0xC
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}


