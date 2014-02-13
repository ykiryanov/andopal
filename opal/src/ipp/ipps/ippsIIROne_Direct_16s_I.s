        .text
        .align  4
        .globl  _ippsIIROne_Direct_16s_I


_ippsIIROne_Direct_16s_I:
        stmdb   sp!, {r4, lr}
        sub     sp, sp, #8
        cmp     r2, #1
        mov     r4, r0
        blt     LCIQ1
        cmp     r4, #0
        beq     LCIQ2
        cmp     r1, #0
        beq     LCIQ2
        cmp     r3, #0
        beq     LCIQ2
        add     r12, r1, r2, lsl #1
        ldrsh   r12, [r12, #2]
        cmp     r12, #0
        blt     LCIQ0
        str     r3, [sp]
        ldrsh   r0, [r4]
        mov     r3, r2
        mov     r2, r1
        mov     r1, r4
        bl      ownsIIROne_Direct_16s
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}
LCIQ0:
        mvn     r0, #0xC
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}
LCIQ1:
        mvn     r0, #0x18
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}
LCIQ2:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}


