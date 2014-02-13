        .text
        .align  4
        .globl  _ippsFIR32sc_Direct_16sc_ISfs


_ippsFIR32sc_Direct_16sc_ISfs:
        stmdb   sp!, {r4, r5, lr}
        sub     sp, sp, #0x18
        mov     r4, r1
        mov     r1, r3
        ldr     r12, [sp, #0x24]
        mov     r3, r2
        mov     r2, r4
        ldr     lr, [sp, #0x2C]
        ldr     r4, [sp, #0x28]
        ldr     r5, [sp, #0x30]
        str     r1, [sp]
        str     r12, [sp, #4]
        str     lr, [sp, #0xC]
        str     r4, [sp, #8]
        str     r5, [sp, #0x10]
        mov     r1, r0
        bl      _ippsFIR32sc_Direct_16sc_Sfs
        add     sp, sp, #0x18
        ldmia   sp!, {r4, r5, pc}


