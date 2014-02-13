        .text
        .align  4
        .globl  _ippsAdaptiveCodebookSearch_AMRWB_16s


_ippsAdaptiveCodebookSearch_AMRWB_16s:
        stmdb   sp!, {r4 - r7, lr}
        sub     sp, sp, #0x20
        ldr     r12, [sp, #0x34]
        ldr     lr, [sp, #0x3C]
        ldr     r7, [sp, #0x38]
        ldr     r5, [sp, #0x40]
        ldr     r4, [sp, #0x44]
        ldr     r6, [sp, #0x48]
        str     r12, [sp]
        mov     r12, #0
        str     lr, [sp, #8]
        str     r12, [sp, #0x18]
        str     r4, [sp, #0x10]
        str     r5, [sp, #0xC]
        str     r6, [sp, #0x14]
        str     r7, [sp, #4]
        bl      _ippsAdaptiveCodebookSearch_AMRWBE_16s
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r7, pc}


