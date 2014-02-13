        .text
        .align  4
        .globl  _ippsSet_64sc


_ippsSet_64sc:
        stmdb   sp!, {r4 - r6, lr}
        sub     sp, sp, #0x10
        str     r0, [sp]
        ldr     r0, [sp, #0x20]
        str     r1, [sp, #4]
        ldr     r1, [sp, #0x24]
        str     r2, [sp, #8]
        cmp     r0, #0
        str     r3, [sp, #0xC]
        beq     LBMX4
        cmp     r1, #0
        ble     LBMX5
        cmp     r1, #6
        mov     r4, #0
        blt     LBMX3
        ldr     r3, [sp]
        ldr     r2, [sp, #4]
        ldr     lr, [sp, #8]
        ldr     r12, [sp, #0xC]
        sub     r6, r1, #6
        sub     r5, r0, #4
LBMX0:
        add     r4, r4, #5
        str     r3, [r5, #4]
        str     r2, [r5, #8]
        str     lr, [r5, #0xC]
        str     r12, [r5, #0x10]
        str     r3, [r5, #0x14]
        str     r2, [r5, #0x18]
        str     lr, [r5, #0x1C]
        str     r12, [r5, #0x20]
        str     r3, [r5, #0x24]
        str     r2, [r5, #0x28]
        str     lr, [r5, #0x2C]
        str     r12, [r5, #0x30]
        str     r3, [r5, #0x34]
        str     r2, [r5, #0x38]
        str     lr, [r5, #0x3C]
        str     r12, [r5, #0x40]
        str     r3, [r5, #0x44]
        str     r2, [r5, #0x48]
        str     lr, [r5, #0x4C]
        str     r12, [r5, #0x50]!
        cmp     r4, r6
        ble     LBMX0
LBMX1:
        mov     r5, r4, lsl #4
        sub     r5, r5, #4
        add     r0, r5, r0
LBMX2:
        add     r4, r4, #1
        str     r3, [r0, #4]
        str     r2, [r0, #8]
        str     lr, [r0, #0xC]
        str     r12, [r0, #0x10]!
        cmp     r4, r1
        blt     LBMX2
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r6, pc}
LBMX3:
        ldr     r3, [sp]
        ldr     r2, [sp, #4]
        ldr     lr, [sp, #8]
        ldr     r12, [sp, #0xC]
        b       LBMX1
LBMX4:
        mvn     r0, #7
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r6, pc}
LBMX5:
        mvn     r0, #5
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r6, pc}


