        .text
        .align  4
        .globl  _ippsAlgebraicCodebookSearchEX_GSMAMR_16s


_ippsAlgebraicCodebookSearchEX_GSMAMR_16s:
        stmdb   sp!, {r4 - r7, lr}
        sub     sp, sp, #0x18
        ldr     r7, [sp, #0x44]
        ldr     r12, [sp, #0x2C]
        ldr     lr, [sp, #0x30]
        ldr     r4, [sp, #0x34]
        ldr     r5, [sp, #0x38]
        ldr     r6, [sp, #0x3C]
        cmp     r7, #0
        ldr     r7, [sp, #0x40]
        beq     LDPB0
        str     lr, [sp, #4]
        str     r12, [sp]
        str     r7, [sp, #0x14]
        str     r6, [sp, #0x10]
        str     r5, [sp, #0xC]
        str     r4, [sp, #8]
        bl      _ippsAlgebraicCodebookSearch_GSMAMR_16s
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r7, pc}
LDPB0:
        mvn     r0, #7
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r7, pc}


