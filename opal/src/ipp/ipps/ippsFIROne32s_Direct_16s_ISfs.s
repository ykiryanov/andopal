        .text
        .align  4
        .globl  _ippsFIROne32s_Direct_16s_ISfs


_ippsFIROne32s_Direct_16s_ISfs:
        stmdb   sp!, {r4, r5, lr}
        sub     sp, sp, #0x10
        ldr     r5, [sp, #0x1C]
        ldr     lr, [sp, #0x20]
        ldr     r12, [sp, #0x24]
        mov     r4, r0
        cmp     r4, #0
        beq     LCRB0
        str     r3, [sp]
        str     r12, [sp, #0xC]
        str     lr, [sp, #8]
        str     r5, [sp, #4]
        ldrsh   r0, [r4]
        mov     r3, r2
        mov     r2, r1
        mov     r1, r4
        bl      _ippsFIROne32s_Direct_16s_Sfs
        add     sp, sp, #0x10
        ldmia   sp!, {r4, r5, pc}
LCRB0:
        mvn     r0, #7
        add     sp, sp, #0x10
        ldmia   sp!, {r4, r5, pc}


