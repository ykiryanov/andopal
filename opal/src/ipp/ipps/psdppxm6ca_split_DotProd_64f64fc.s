        .text
        .align  4
        .globl  DotProd_64f64fc


DotProd_64f64fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        cmp     r2, #0
        mov     r5, r0
        mov     r4, r1
        mov     r7, #0
        ble     LCFR5
        cmp     r2, #5
        blt     LCFR4
        mov     r11, r7
        mov     r10, r11
        mov     r9, r10
        sub     lr, r2, #5
        sub     r12, r5, #0x1C
        mov     r8, r9
        sub     r6, r4, #0x34
        str     r10, [sp, #0x14]
        str     r11, [sp, #0x18]
        str     r12, [sp, #0x10]
        str     lr, [sp, #0xC]
        str     r3, [sp, #8]
        str     r2, [sp, #4]
LCFR0:
        ldr     r12, [sp, #0x10]
        ldr     r2, [r6, #0x34]
        ldr     r3, [r6, #0x38]
        ldr     r11, [r12, #0x1C]
        ldr     r10, [r12, #0x20]
        mov     r0, r11
        mov     r1, r10
        bl      __muldf3
        ldr     r3, [sp, #0x14]
        ldr     r2, [sp, #0x18]
        bl      __adddf3
        ldr     r2, [r6, #0x3C]
        ldr     r3, [r6, #0x40]!
        str     r0, [sp, #0x18]
        str     r1, [sp, #0x14]
        mov     r1, r10
        mov     r0, r11
        bl      __muldf3
        mov     r3, r8
        mov     r2, r9
        add     r11, r7, #1
        bl      __adddf3
        ldr     r2, [r4, +r11, lsl #4]
        ldr     r8, [r5, +r11, lsl #3]
        add     r10, r4, r11, lsl #4
        ldr     r3, [r10, #4]
        add     r11, r5, r11, lsl #3
        ldr     r11, [r11, #4]
        str     r0, [sp]
        mov     r9, r1
        mov     r0, r8
        mov     r1, r11
        bl      __muldf3
        ldr     r2, [sp, #0x18]
        ldr     r3, [sp, #0x14]
        bl      __adddf3
        ldr     r2, [r10, #8]
        ldr     r3, [r10, #0xC]
        str     r0, [sp, #0x18]
        str     r1, [sp, #0x14]
        mov     r1, r11
        mov     r0, r8
        bl      __muldf3
        ldr     r2, [sp]
        mov     r3, r9
        add     r11, r7, #2
        bl      __adddf3
        ldr     r2, [r4, +r11, lsl #4]
        ldr     r8, [r5, +r11, lsl #3]
        add     r10, r4, r11, lsl #4
        ldr     r3, [r10, #4]
        add     r11, r5, r11, lsl #3
        ldr     r11, [r11, #4]
        str     r0, [sp]
        mov     r9, r1
        mov     r1, r11
        mov     r0, r8
        bl      __muldf3
        ldr     r2, [sp, #0x18]
        ldr     r3, [sp, #0x14]
        bl      __adddf3
        ldr     r2, [r10, #8]
        ldr     r3, [r10, #0xC]
        str     r0, [sp, #0x18]
        str     r1, [sp, #0x14]
        mov     r1, r11
        mov     r0, r8
        bl      __muldf3
        ldr     r2, [sp]
        add     r8, r7, #3
        mov     r3, r9
        bl      __adddf3
        ldr     r2, [r4, +r8, lsl #4]
        ldr     r10, [r5, +r8, lsl #3]
        str     r1, [sp]
        add     r3, r5, r8, lsl #3
        ldr     r9, [r3, #4]
        add     r8, r4, r8, lsl #4
        ldr     r3, [r8, #4]
        mov     r11, r0
        mov     r1, r9
        mov     r0, r10
        bl      __muldf3
        ldr     r3, [sp, #0x14]
        ldr     r2, [sp, #0x18]
        bl      __adddf3
        ldr     r2, [r8, #8]
        ldr     r3, [r8, #0xC]
        str     r1, [sp, #0x14]
        str     r0, [sp, #0x18]
        mov     r1, r9
        mov     r0, r10
        bl      __muldf3
        ldr     r3, [sp]
        mov     r2, r11
        bl      __adddf3
        ldr     r12, [sp, #0xC]
        add     r7, r7, #4
        mov     r9, r0
        mov     r8, r1
        cmp     r7, r12
        ldr     r12, [sp, #0x10]
        add     r12, r12, #0x20
        str     r12, [sp, #0x10]
        ble     LCFR0
        ldr     r10, [sp, #0x14]
        ldr     r11, [sp, #0x18]
        ldr     r3, [sp, #8]
        ldr     r2, [sp, #4]
LCFR1:
        mov     r12, r7, lsl #3
        sub     r12, r12, #4
        add     r5, r12, r5
        mov     r12, r7, lsl #4
        sub     r12, r12, #4
        add     r4, r12, r4
        str     r9, [sp]
        str     r3, [sp, #8]
        str     r2, [sp, #4]
LCFR2:
        ldr     r2, [r4, #4]
        ldr     r3, [r4, #8]
        ldr     r6, [r5, #4]
        ldr     r9, [r5, #8]!
        mov     r0, r6
        mov     r1, r9
        bl      __muldf3
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        ldr     r2, [r4, #0xC]
        ldr     r3, [r4, #0x10]!
        mov     r11, r0
        mov     r10, r1
        mov     r0, r6
        mov     r1, r9
        bl      __muldf3
        ldr     r2, [sp]
        mov     r3, r8
        bl      __adddf3
        ldr     r12, [sp, #4]
        add     r7, r7, #1
        cmp     r7, r12
        str     r0, [sp]
        mov     r8, r1
        blt     LCFR2
        ldr     r9, [sp]
        ldr     r3, [sp, #8]
LCFR3:
        str     r11, [r3]
        str     r10, [r3, #4]
        str     r9, [r3, #8]
        str     r8, [r3, #0xC]
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LCFR4:
        mov     r11, r7
        mov     r10, r11
        mov     r9, r10
        mov     r8, r9
        b       LCFR1
LCFR5:
        mov     r11, r7
        mov     r10, r11
        mov     r9, r10
        mov     r8, r9
        b       LCFR3


