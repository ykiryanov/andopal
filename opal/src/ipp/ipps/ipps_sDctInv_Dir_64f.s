        .text
        .align  4
        .globl  _ipps_sDctInv_Dir_64f


_ipps_sDctInv_Dir_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x34
        mov     r4, r2
        tst     r4, #1
        mov     r6, r0
        mov     r9, r1
        mov     r5, r3
        mov     r7, #0
        mov     r10, r4, asr #1
        beq     LCTN9
        cmp     r10, #0
        ble     LCTN3
        mov     r8, r7
        sub     lr, r4, #1
        sub     r12, r9, #8
        sub     r11, r9, #4
        str     r12, [sp, #0x18]
        str     lr, [sp, #0x10]
        str     r10, [sp, #0x20]
        str     r5, [sp, #0x2C]
        str     r9, [sp, #0x24]
        str     r6, [sp, #0x28]
LCTN0:
        ldr     r3, [sp, #0x28]
        ldr     r1, [sp, #0x10]
        ldr     r6, [r3]
        ldr     r5, [r3, #4]
        mov     r3, r8, lsl #1
        cmp     r1, #1
        add     r0, r3, #1
        add     r1, r7, #2
        movle   r9, #0
        movle   r10, r9
        ble     LCTN2
        ldr     r12, [sp, #0x28]
        mov     r9, #0
        mov     r10, r9
        str     r11, [sp, #0x14]
        ldr     r11, [sp, #0x2C]
        add     r3, r12, #8
        mov     r2, #1
        add     r12, r12, #0x10
        str     r9, [sp, #0xC]
        str     r10, [sp]
        str     r5, [sp, #8]
        str     r6, [sp, #4]
        str     r8, [sp, #0x1C]
        mov     r5, r0
        mov     r6, r1
        mov     r10, r2
        mov     r8, r3
        mov     r9, r12
LCTN1:
        ldr     r0, [r9]
        ldr     r1, [r9, #4]
        add     lr, r11, r6, lsl #3
        ldr     r3, [lr, #4]
        ldr     r2, [r11, +r6, lsl #3]
        bl      __muldf3
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #8]
        bl      __adddf3
        ldr     r2, [r8]
        ldr     r12, [r11, +r5, lsl #3]
        ldr     lr, [r8, #4]
        str     r0, [sp, #4]
        str     r1, [sp, #8]
        add     r0, r11, r5, lsl #3
        ldr     r3, [r0, #4]
        mov     r0, r2
        mov     r1, lr
        mov     r2, r12
        bl      __muldf3
        ldr     r2, [sp]
        ldr     r3, [sp, #0xC]
        bl      __adddf3
        add     r6, r7, r6
        add     r6, r6, #2
        add     r5, r7, r5
        cmp     r6, r4, lsl #2
        str     r0, [sp]
        str     r1, [sp, #0xC]
        add     r5, r5, #2
        subge   r6, r6, r4, lsl #2
        cmp     r5, r4, lsl #2
        subge   r5, r5, r4, lsl #2
        ldr     lr, [sp, #0x10]
        add     r10, r10, #2
        add     r8, r8, #0x10
        cmp     r10, lr
        add     r9, r9, #0x10
        blt     LCTN1
        ldr     r9, [sp, #0xC]
        ldr     r10, [sp]
        ldr     r5, [sp, #8]
        ldr     r6, [sp, #4]
        ldr     r11, [sp, #0x14]
        ldr     r8, [sp, #0x1C]
LCTN2:
        mov     r0, r6
        mov     r1, r5
        mov     r2, r10
        mov     r3, r9
        bl      __adddf3
        str     r0, [r11, #4]
        str     r1, [r11, #8]!
        mov     r0, r6
        mov     r1, r5
        mov     r2, r10
        mov     r3, r9
        bl      __subdf3
        ldr     r3, [sp, #0x18]
        sub     r12, r4, r8
        str     r0, [r3, +r12, lsl #3]
        add     r12, r3, r12, lsl #3
        str     r1, [r12, #4]
        ldr     r0, [sp, #0x20]
        add     r8, r8, #1
        cmp     r8, r0
        add     r7, r7, #4
        blt     LCTN0
        ldr     r10, [sp, #0x20]
        ldr     r9, [sp, #0x24]
        ldr     r6, [sp, #0x28]
LCTN3:
        sub     r0, r4, #2
        cmp     r0, #0
        mov     r1, #0
        ble     LCTN15
        sub     r3, r4, #2
        cmp     r3, #0x18
        blt     LCTN14
        mov     r7, r1
        mov     r5, r7
        add     r12, r6, #0x10
        sub     lr, r4, #0x1A
        sub     r3, r6, #0xC
        sub     r2, r6, #0x1C
        mov     r11, r5
        str     r4, [sp, #0x30]
        str     r6, [sp, #0x28]
        mov     r8, r11
        str     r12, [sp, #0x2C]
        str     lr, [sp, #0x18]
        str     r0, [sp, #0x1C]
        str     r1, [sp, #0x14]
        str     r10, [sp, #0x20]
        str     r9, [sp, #0x24]
        mov     r4, r2
        mov     r6, r3
LCTN4:
        ldr     r2, [r4, #0x1C]
        ldr     r3, [r4, #0x20]
        mov     r0, r7
        mov     r1, r5
        bl      __adddf3
        ldr     r2, [r6, #0x1C]
        ldr     r3, [r6, #0x20]
        mov     r7, r1
        mov     r5, r0
        mov     r1, r8
        mov     r0, r11
        bl      __adddf3
        ldr     r2, [r4, #0x3C]
        ldr     r3, [r4, #0x40]
        mov     r8, r0
        mov     r9, r1
        mov     r1, r7
        mov     r0, r5
        bl      __adddf3
        ldr     r2, [r6, #0x3C]
        ldr     r3, [r6, #0x40]
        mov     r7, r1
        mov     r5, r0
        mov     r0, r8
        mov     r1, r9
        bl      __adddf3
        ldr     r2, [r4, #0x5C]
        ldr     r3, [r4, #0x60]
        mov     r8, r0
        mov     r9, r1
        mov     r1, r7
        mov     r0, r5
        bl      __adddf3
        ldr     r2, [r6, #0x5C]
        ldr     r3, [r6, #0x60]
        mov     r7, r1
        mov     r5, r0
        mov     r0, r8
        mov     r1, r9
        bl      __adddf3
        ldr     r2, [r4, #0x7C]
        ldr     r3, [r4, #0x80]
        mov     r8, r0
        mov     r9, r1
        mov     r1, r7
        mov     r0, r5
        bl      __adddf3
        ldr     r2, [r6, #0x7C]
        ldr     r3, [r6, #0x80]
        mov     r7, r1
        mov     r5, r0
        mov     r0, r8
        mov     r1, r9
        bl      __adddf3
        ldr     r2, [r4, #0x9C]
        ldr     r3, [r4, #0xA0]!
        mov     r8, r0
        mov     r9, r1
        mov     r1, r7
        mov     r0, r5
        bl      __adddf3
        ldr     r2, [r6, #0x9C]
        ldr     r3, [r6, #0xA0]!
        mov     r7, r0
        mov     r5, r1
        mov     r0, r8
        mov     r1, r9
        bl      __adddf3
        ldr     r12, [sp, #0x14]
        ldr     lr, [sp, #0x18]
        mov     r11, r0
        mov     r8, r1
        add     r12, r12, #0x14
        cmp     r12, lr
        str     r12, [sp, #0x14]
        ble     LCTN4
        ldr     r12, [sp, #0x2C]
        ldr     r0, [sp, #0x1C]
        ldr     r1, [sp, #0x14]
        ldr     r10, [sp, #0x20]
        ldr     r4, [sp, #0x30]
        ldr     r9, [sp, #0x24]
        ldr     r6, [sp, #0x28]
LCTN5:
        mov     lr, r1, lsl #3
        sub     lr, lr, #0x1C
        add     r3, lr, r6
        add     r2, lr, r12
        str     r10, [sp, #0x20]
        str     r4, [sp, #0x30]
        str     r9, [sp, #0x24]
        str     r6, [sp, #0x28]
        str     r12, [sp, #0x2C]
        mov     r9, r0
        mov     r10, r1
        mov     r6, r2
        mov     r4, r3
LCTN6:
        ldr     r2, [r4, #0x1C]
        ldr     r3, [r4, #0x20]!
        mov     r0, r7
        mov     r1, r5
        bl      __adddf3
        ldr     r12, [sp, #0x2C]
        ldr     r3, [r6, #0x20]!
        mov     r7, r0
        mov     r5, r1
        ldr     r2, [r12, +r10, lsl #3]
        mov     r0, r11
        mov     r1, r8
        bl      __adddf3
        add     r10, r10, #4
        cmp     r10, r9
        mov     r11, r0
        mov     r8, r1
        blt     LCTN6
        mov     r1, r10
        ldr     r10, [sp, #0x20]
        ldr     r4, [sp, #0x30]
        ldr     r9, [sp, #0x24]
        ldr     r6, [sp, #0x28]
LCTN7:
        cmp     r1, r4
        bge     LCTN8
        add     r12, r6, r1, lsl #3
        ldr     r2, [r6, +r1, lsl #3]
        ldr     r3, [r12, #4]
        mov     r0, r7
        mov     r1, r5
        bl      __adddf3
        mov     r7, r0
        mov     r5, r1
LCTN8:
        mov     r0, r7
        mov     r1, r5
        mov     r2, r11
        mov     r3, r8
        bl      __subdf3
        str     r0, [r9, +r10, lsl #3]
        add     r10, r9, r10, lsl #3
        str     r1, [r10, #4]
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LCTN9:
        cmp     r10, #0
        ble     LCTN13
        mov     r8, r7
        sub     r12, r9, #8
        sub     lr, r4, #1
        sub     r9, r9, #4
        str     r9, [sp, #0xC]
        str     r12, [sp, #8]
        str     lr, [sp, #0x10]
        str     r10, [sp, #0x20]
LCTN10:
        ldr     r12, [r6]
        mov     r1, r8, lsl #1
        add     r11, r1, #1
        ldr     r0, [r6, #8]
        ldr     r1, [r6, #0xC]
        str     r12, [sp, #0x24]
        ldr     r12, [r6, #4]
        str     r12, [sp, #0x1C]
        add     r12, r5, r11, lsl #3
        ldr     r3, [r12, #4]
        ldr     r2, [r5, +r11, lsl #3]
        bl      __muldf3
        ldr     r12, [sp, #0x10]
        cmp     r12, #2
        str     r0, [sp, #0x18]
        str     r1, [sp, #0x14]
        ble     LCTN12
        add     r9, r6, #0xC
        add     r10, r6, #4
        str     r6, [sp, #0x28]
        mov     r0, #0
        mov     r1, #2
        str     r8, [sp, #4]
        mov     r6, r11
        mov     r11, r0
        mov     r8, r1
LCTN11:
        add     r11, r7, r11
        add     r11, r11, #2
        add     r6, r7, r6
        cmp     r11, r4, lsl #2
        add     r6, r6, #2
        subge   r11, r11, r4, lsl #2
        cmp     r6, r4, lsl #2
        subge   r6, r6, r4, lsl #2
        ldr     r0, [r10, #0xC]
        ldr     r1, [r10, #0x10]!
        add     r12, r5, r11, lsl #3
        ldr     r3, [r12, #4]
        ldr     r2, [r5, +r11, lsl #3]
        bl      __muldf3
        ldr     r2, [sp, #0x24]
        ldr     r3, [sp, #0x1C]
        bl      __adddf3
        ldr     r2, [r9, #0xC]
        ldr     lr, [r9, #0x10]!
        ldr     r12, [r5, +r6, lsl #3]
        str     r0, [sp, #0x24]
        str     r1, [sp, #0x1C]
        add     r0, r5, r6, lsl #3
        ldr     r3, [r0, #4]
        mov     r0, r2
        mov     r1, lr
        mov     r2, r12
        bl      __muldf3
        ldr     r2, [sp, #0x18]
        ldr     r3, [sp, #0x14]
        bl      __adddf3
        ldr     r12, [sp, #0x10]
        add     r8, r8, #2
        cmp     r8, r12
        str     r0, [sp, #0x18]
        str     r1, [sp, #0x14]
        blt     LCTN11
        ldr     r8, [sp, #4]
        ldr     r6, [sp, #0x28]
LCTN12:
        ldr     r1, [sp, #0x1C]
        ldr     r9, [sp, #0x24]
        ldr     r10, [sp, #0x18]
        ldr     r11, [sp, #0x14]
        mov     r0, r9
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        ldr     r12, [sp, #0xC]
        add     r7, r7, #4
        str     r1, [r12, #8]
        str     r0, [r12, #4]
        ldr     r1, [sp, #0x1C]
        add     r12, r12, #8
        str     r12, [sp, #0xC]
        mov     r0, r9
        mov     r2, r10
        mov     r3, r11
        bl      __subdf3
        ldr     r12, [sp, #8]
        sub     lr, r4, r8
        str     r0, [r12, +lr, lsl #3]
        add     lr, r12, lr, lsl #3
        str     r1, [lr, #4]
        ldr     r1, [sp, #0x20]
        add     r8, r8, #1
        cmp     r8, r1
        blt     LCTN10
LCTN13:
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LCTN14:
        mov     r7, r1
        mov     r5, r7
        mov     r11, r5
        mov     r8, r11
        add     r12, r6, #0x10
        b       LCTN5
LCTN15:
        mov     r7, r1
        mov     r5, r7
        mov     r11, r5
        mov     r8, r11
        b       LCTN7


