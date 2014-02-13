        .text
        .align  4
        .globl  _ippsFIROne32sc_Direct_16sc_ISfs


_ippsFIROne32sc_Direct_16sc_ISfs:
        stmdb   sp!, {r4, r5, lr}
        sub     sp, sp, #0x10
        mov     r4, r0
        cmp     r4, #0
        ldr     r5, [sp, #0x1C]
        ldr     lr, [sp, #0x20]
        ldr     r12, [sp, #0x24]
        beq     LCQZ0
        str     r12, [sp, #0xC]
        str     lr, [sp, #8]
        str     r3, [sp]
        str     r5, [sp, #4]
        ldrh    lr, [r4, #2]
        ldrh    r12, [r4]
        mov     r3, r2
        mov     r2, r1
        mov     r1, r4
        orr     r0, r12, lr, lsl #16
        bl      _ippsFIROne32sc_Direct_16sc_Sfs
        add     sp, sp, #0x10
        ldmia   sp!, {r4, r5, pc}
LCQZ0:
        mvn     r0, #7
        add     sp, sp, #0x10
        ldmia   sp!, {r4, r5, pc}


