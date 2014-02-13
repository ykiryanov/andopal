        .text
        .align  4
        .globl  _ippsSet_64fc


_ippsSet_64fc:
        stmdb   sp!, {lr}
        sub     sp, sp, #0x30
        str     r0, [sp, #0x20]
        str     r1, [sp, #0x24]
        ldr     r0, [sp, #0x34]
        ldr     r1, [sp, #0x38]
        str     r2, [sp, #0x28]
        cmp     r0, #0
        str     r3, [sp, #0x2C]
        beq     LCVN1
        cmp     r1, #0
        ble     LCVN0
        ldr     r3, [sp, #0x20]
        ldr     r12, [sp, #0x24]
        add     r2, sp, #0x10
        str     r3, [r2]
        ldr     r3, [sp, #0x28]
        str     r12, [r2, #4]
        ldr     r12, [sp, #0x2C]
        str     r3, [r2, #8]
        str     r12, [r2, #0xC]
        str     r1, [sp, #4]
        str     r0, [sp]
        ldr     r0, [sp, #0x10]
        ldr     r3, [sp, #0x1C]
        ldr     r2, [sp, #0x18]
        ldr     r1, [sp, #0x14]
        bl      ownsSet_64sc
        mov     r0, #0
        add     sp, sp, #0x30
        ldr     pc, [sp], #4
LCVN0:
        mvn     r0, #5
        add     sp, sp, #0x30
        ldr     pc, [sp], #4
LCVN1:
        mvn     r0, #7
        add     sp, sp, #0x30
        ldr     pc, [sp], #4


