        .text
        .align  4
        .globl  DotProd_64fc


DotProd_64fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        mov     r9, r2
        cmp     r9, #0
        mov     r12, #0
        ble     LCFQ2
        mov     lr, r12
        mov     r6, lr
        sub     r10, r0, #0xC
        mov     r0, r6
        sub     r11, r1, #0xC
        str     lr, [sp, #0xC]
        str     r0, [sp, #4]
        str     r3, [sp]
        str     r12, [sp, #8]
LCFQ0:
        ldr     r2, [r11, #0xC]
        str     r2, [sp, #0x10]
        ldr     r0, [r10, #0xC]
        str     r0, [sp, #0x14]
        ldr     r0, [r10, #0x10]
        str     r0, [sp, #0x18]
        ldr     r3, [r11, #0x10]
        ldr     r0, [sp, #0x14]
        ldr     r1, [sp, #0x18]
        str     r3, [sp, #0x1C]
        ldr     r4, [r11, #0x14]
        ldr     r5, [r11, #0x18]
        ldr     r8, [r10, #0x14]
        ldr     r7, [r10, #0x18]
        bl      __muldf3
        ldr     r2, [sp, #0xC]
        mov     r3, r6
        bl      __adddf3
        str     r0, [sp, #0xC]
        mov     r6, r1
        mov     r2, r4
        mov     r3, r5
        mov     r0, r8
        mov     r1, r7
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0xC]
        mov     r3, r1
        mov     r1, r6
        bl      __subdf3
        str     r0, [sp, #0xC]
        mov     r6, r1
        ldr     r0, [sp, #0x14]
        ldr     r1, [sp, #0x18]
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #8]
        bl      __adddf3
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0x1C]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r8
        mov     r1, r7
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        subs    r9, r9, #1
        add     r11, r11, #0x10
        add     r10, r10, #0x10
        str     r0, [sp, #4]
        str     r1, [sp, #8]
        bne     LCFQ0
        ldr     lr, [sp, #0xC]
        ldr     r0, [sp, #4]
        ldr     r3, [sp]
        ldr     r12, [sp, #8]
LCFQ1:
        str     lr, [r3]
        str     r6, [r3, #4]
        str     r0, [r3, #8]
        str     r12, [r3, #0xC]
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LCFQ2:
        mov     lr, r12
        mov     r6, lr
        mov     r0, r6
        b       LCFQ1


