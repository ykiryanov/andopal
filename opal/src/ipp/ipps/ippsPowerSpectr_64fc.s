        .text
        .align  4
        .globl  _ippsPowerSpectr_64fc


_ippsPowerSpectr_64fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x4C
        mov     r6, r0
        cmp     r6, #0
        mov     r4, r1
        mov     r5, r2
        beq     LBAD11
        cmp     r4, #0
        beq     LBAD11
        cmp     r5, #1
        blt     LBAD10
        cmp     r5, #8
        ble     LBAD5
        mov     r10, r5, asr #3
        cmp     r10, #0
        and     r9, r5, #7
        ble     LBAD1
        sub     r7, r4, #0x24
        str     r7, [sp, #0x1C]
        sub     r7, r4, #0x2C
        str     r7, [sp, #0x18]
        sub     r7, r4, #0x34
        str     r7, [sp, #0x14]
        sub     r7, r4, #0x3C
        str     r7, [sp, #0x10]
        sub     r7, r6, #0xC
        str     r7, [sp]
        sub     r7, r6, #0x1C
        str     r7, [sp, #4]
        sub     r7, r6, #0x2C
        str     r7, [sp, #8]
        sub     lr, r4, #4
        sub     r12, r4, #0xC
        sub     r3, r4, #0x14
        sub     r8, r4, #0x1C
        str     r5, [sp, #0xC]
        str     r4, [sp, #0x24]
        ldr     r4, [sp, #8]
        ldr     r5, [sp, #0x14]
        sub     r0, r6, #0x4C
        sub     r1, r6, #0x5C
        sub     r2, r6, #0x6C
        sub     r11, r6, #0x7C
        sub     r7, r6, #0x3C
        str     r11, [sp, #0x34]
        str     r2, [sp, #0x40]
        str     r1, [sp, #0x44]
        str     r0, [sp, #0x48]
        str     r3, [sp, #0x2C]
        str     r12, [sp, #0x3C]
        str     lr, [sp, #0x30]
        str     r9, [sp, #0x28]
        str     r10, [sp, #0x38]
        str     r6, [sp, #0x20]
LBAD0:
        ldr     r12, [sp, #0x34]
        ldr     r2, [r12, #0x7C]
        ldr     r11, [r12, #0x84]
        ldr     r10, [r12, #0x88]
        ldr     r3, [r12, #0x80]!
        mov     r0, r2
        str     r12, [sp, #0x34]
        mov     r1, r3
        bl      __muldf3
        mov     r6, r0
        mov     r9, r1
        mov     r1, r10
        mov     r3, r10
        mov     r0, r11
        mov     r2, r11
        bl      __muldf3
        mov     r2, r6
        mov     r3, r9
        bl      __adddf3
        ldr     r2, [sp, #0x10]
        str     r0, [r2, #0x3C]
        ldr     r12, [sp, #0x10]
        str     r1, [r12, #0x40]!
        ldr     lr, [sp, #0x40]
        ldr     r10, [lr, #0x88]
        ldr     r2, [lr, #0x7C]
        ldr     r3, [lr, #0x80]
        ldr     r11, [lr, #0x84]
        str     r12, [sp, #0x10]
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        mov     r6, r0
        mov     r9, r1
        mov     r0, r11
        mov     r2, r11
        mov     r1, r10
        mov     r3, r10
        bl      __muldf3
        mov     r2, r6
        mov     r3, r9
        bl      __adddf3
        str     r0, [r5, #0x3C]
        str     r1, [r5, #0x40]!
        ldr     r12, [sp, #0x44]
        ldr     r2, [r12, #0x7C]
        ldr     r3, [r12, #0x80]
        ldr     r11, [r12, #0x84]
        ldr     r6, [r12, #0x88]
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        mov     r9, r0
        mov     r10, r1
        mov     r0, r11
        mov     r2, r11
        mov     r1, r6
        mov     r3, r6
        bl      __muldf3
        mov     r2, r9
        mov     r3, r10
        bl      __adddf3
        ldr     r2, [sp, #0x18]
        str     r0, [r2, #0x3C]
        ldr     r12, [sp, #0x18]
        str     r1, [r12, #0x40]!
        ldr     lr, [sp, #0x48]
        ldr     r10, [lr, #0x88]
        ldr     r2, [lr, #0x7C]
        ldr     r3, [lr, #0x80]
        ldr     r11, [lr, #0x84]
        str     r12, [sp, #0x18]
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        mov     r6, r0
        mov     r9, r1
        mov     r3, r10
        mov     r1, r10
        mov     r2, r11
        mov     r0, r11
        bl      __muldf3
        mov     r3, r9
        mov     r2, r6
        bl      __adddf3
        ldr     r2, [sp, #0x1C]
        str     r0, [r2, #0x3C]
        ldr     r12, [sp, #0x1C]
        str     r1, [r12, #0x40]!
        ldr     r10, [r7, #0x88]
        ldr     r11, [r7, #0x84]
        ldr     r2, [r7, #0x7C]
        ldr     r3, [r7, #0x80]!
        str     r12, [sp, #0x1C]
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        mov     r6, r0
        mov     r9, r1
        mov     r3, r10
        mov     r1, r10
        mov     r2, r11
        mov     r0, r11
        bl      __muldf3
        mov     r3, r9
        mov     r2, r6
        bl      __adddf3
        str     r0, [r8, #0x3C]
        str     r1, [r8, #0x40]!
        ldr     r0, [r4, #0x7C]
        ldr     r1, [r4, #0x80]
        ldr     r10, [r4, #0x84]
        ldr     r11, [r4, #0x88]
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        mov     r9, r1
        mov     r6, r0
        mov     r2, r10
        mov     r0, r10
        mov     r3, r11
        mov     r1, r11
        bl      __muldf3
        mov     r3, r9
        mov     r2, r6
        bl      __adddf3
        ldr     r12, [sp, #0x2C]
        str     r0, [r12, #0x3C]
        str     r1, [r12, #0x40]!
        ldr     lr, [sp, #4]
        ldr     r10, [lr, #0x88]
        ldr     r11, [lr, #0x84]
        ldr     r0, [lr, #0x7C]
        ldr     r1, [lr, #0x80]
        str     r12, [sp, #0x2C]
        add     r4, r4, #0x80
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        mov     r6, r0
        mov     r9, r1
        mov     r3, r10
        mov     r1, r10
        mov     r2, r11
        mov     r0, r11
        bl      __muldf3
        mov     r2, r6
        mov     r3, r9
        bl      __adddf3
        ldr     r2, [sp, #0x3C]
        str     r0, [r2, #0x3C]
        str     r1, [r2, #0x40]
        ldr     r12, [sp]
        ldr     r2, [r12, #0x7C]
        ldr     r3, [r12, #0x80]
        ldr     r11, [r12, #0x84]
        ldr     r6, [r12, #0x88]
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        mov     r9, r0
        mov     r10, r1
        mov     r0, r11
        mov     r1, r6
        mov     r2, r11
        mov     r3, r6
        bl      __muldf3
        mov     r2, r9
        mov     r3, r10
        bl      __adddf3
        ldr     r2, [sp, #0x30]
        str     r0, [r2, #0x3C]
        str     r1, [r2, #0x40]!
        ldr     r0, [sp, #0x38]
        str     r2, [sp, #0x30]
        subs    r0, r0, #1
        str     r0, [sp, #0x38]
        ldr     r0, [sp, #0x3C]
        add     r0, r0, #0x40
        str     r0, [sp, #0x3C]
        ldr     r0, [sp]
        add     r0, r0, #0x80
        str     r0, [sp]
        ldr     r0, [sp, #4]
        add     r0, r0, #0x80
        str     r0, [sp, #4]
        ldr     r0, [sp, #0x48]
        add     r0, r0, #0x80
        str     r0, [sp, #0x48]
        ldr     r0, [sp, #0x44]
        add     r0, r0, #0x80
        str     r0, [sp, #0x44]
        ldr     r0, [sp, #0x40]
        add     r0, r0, #0x80
        str     r0, [sp, #0x40]
        ldr     r0, [sp, #0x38]
        bne     LBAD0
        ldr     r9, [sp, #0x28]
        ldr     r5, [sp, #0xC]
        ldr     r4, [sp, #0x24]
        ldr     r6, [sp, #0x20]
LBAD1:
        sub     r7, r5, r9
        cmp     r7, r5
        bge     LBAD9
        sub     r3, r5, r7
        cmp     r3, #5
        blt     LBAD3
        mov     r3, r7, lsl #4
        mov     r12, r7, lsl #3
        sub     r3, r3, #0x3C
        sub     r12, r12, #0x1C
        add     r3, r3, r6
        add     r12, r12, r4
        sub     lr, r5, #5
        str     r12, [sp, #0x40]
        str     r3, [sp, #0x44]
        str     lr, [sp, #0x48]
        str     r5, [sp, #0xC]
LBAD2:
        ldr     r12, [sp, #0x44]
        add     r11, r7, #1
        ldr     r2, [r12, #0x3C]
        ldr     r3, [r12, #0x40]
        ldr     r5, [r12, #0x44]
        ldr     r8, [r12, #0x48]
        mov     r0, r2
        mov     r1, r3
        add     r12, r12, #0x40
        str     r12, [sp, #0x44]
        bl      __muldf3
        mov     r10, r1
        mov     r9, r0
        mov     r0, r5
        mov     r2, r5
        mov     r1, r8
        mov     r3, r8
        bl      __muldf3
        mov     r3, r10
        mov     r2, r9
        bl      __adddf3
        ldr     r2, [sp, #0x40]
        add     r12, r6, r11, lsl #4
        str     r0, [r2, #0x1C]
        ldr     r2, [sp, #0x40]
        str     r1, [r2, #0x20]!
        str     r2, [sp, #0x40]
        ldr     r3, [r12, #4]
        ldr     r2, [r6, +r11, lsl #4]
        ldr     r10, [r12, #8]
        ldr     r5, [r12, #0xC]
        mov     r1, r3
        mov     r0, r2
        bl      __muldf3
        mov     r8, r0
        mov     r9, r1
        mov     r0, r10
        mov     r2, r10
        mov     r1, r5
        mov     r3, r5
        bl      __muldf3
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        str     r0, [r4, +r11, lsl #3]
        add     r11, r4, r11, lsl #3
        str     r1, [r11, #4]
        add     r11, r7, #2
        ldr     r0, [r6, +r11, lsl #4]
        add     r12, r6, r11, lsl #4
        ldr     r1, [r12, #4]
        ldr     r10, [r12, #8]
        ldr     r5, [r12, #0xC]
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        mov     r8, r0
        mov     r9, r1
        mov     r0, r10
        mov     r2, r10
        mov     r1, r5
        mov     r3, r5
        bl      __muldf3
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        str     r0, [r4, +r11, lsl #3]
        add     r11, r4, r11, lsl #3
        str     r1, [r11, #4]
        add     r11, r7, #3
        ldr     r2, [r6, +r11, lsl #4]
        add     r12, r6, r11, lsl #4
        ldr     r3, [r12, #4]
        ldr     r10, [r12, #8]
        ldr     r5, [r12, #0xC]
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        mov     r8, r0
        mov     r9, r1
        mov     r0, r10
        mov     r2, r10
        mov     r1, r5
        mov     r3, r5
        bl      __muldf3
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        str     r0, [r4, +r11, lsl #3]
        ldr     r2, [sp, #0x48]
        add     r7, r7, #4
        add     r11, r4, r11, lsl #3
        cmp     r7, r2
        str     r1, [r11, #4]
        ble     LBAD2
        ldr     r5, [sp, #0xC]
LBAD3:
        mov     r12, r7, lsl #4
        mov     r3, r7, lsl #3
        sub     r12, r12, #0xC
        sub     r3, r3, #4
        add     r6, r12, r6
        add     r11, r3, r4
LBAD4:
        ldr     r2, [r6, #0xC]
        ldr     r3, [r6, #0x10]
        ldr     r9, [r6, #0x14]
        ldr     r10, [r6, #0x18]
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        mov     r4, r0
        mov     r8, r1
        mov     r0, r9
        mov     r1, r10
        mov     r2, r9
        mov     r3, r10
        bl      __muldf3
        mov     r2, r4
        mov     r3, r8
        bl      __adddf3
        add     r7, r7, #1
        str     r0, [r11, #4]
        str     r1, [r11, #8]!
        cmp     r7, r5
        add     r6, r6, #0x10
        blt     LBAD4
        mov     r0, #0
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
LBAD5:
        cmp     r5, #5
        mov     r7, #0
        blt     LBAD7
        sub     r12, r5, #5
        sub     lr, r6, #0x3C
        sub     r3, r4, #0x1C
        str     r3, [sp]
        str     lr, [sp, #4]
        str     r12, [sp, #8]
        str     r5, [sp, #0xC]
LBAD6:
        ldr     r12, [sp, #4]
        add     r11, r7, #1
        ldr     r8, [r12, #0x48]
        ldr     r2, [r12, #0x3C]
        ldr     r3, [r12, #0x40]
        ldr     r5, [r12, #0x44]
        mov     r0, r2
        add     r12, r12, #0x40
        str     r12, [sp, #4]
        mov     r1, r3
        bl      __muldf3
        mov     r9, r0
        mov     r10, r1
        mov     r1, r8
        mov     r3, r8
        mov     r0, r5
        mov     r2, r5
        bl      __muldf3
        mov     r2, r9
        mov     r3, r10
        bl      __adddf3
        ldr     r2, [sp]
        str     r0, [r2, #0x1C]
        ldr     r2, [sp]
        add     r12, r6, r11, lsl #4
        str     r1, [r2, #0x20]!
        str     r2, [sp]
        ldr     r2, [r6, +r11, lsl #4]
        ldr     r3, [r12, #4]
        ldr     r5, [r12, #0xC]
        ldr     r8, [r12, #8]
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        mov     r10, r1
        mov     r9, r0
        mov     r0, r8
        mov     r2, r8
        mov     r1, r5
        mov     r3, r5
        bl      __muldf3
        mov     r2, r9
        mov     r3, r10
        bl      __adddf3
        str     r0, [r4, +r11, lsl #3]
        add     r11, r4, r11, lsl #3
        str     r1, [r11, #4]
        add     r11, r7, #2
        ldr     r0, [r6, +r11, lsl #4]
        add     r12, r6, r11, lsl #4
        ldr     r1, [r12, #4]
        ldr     r10, [r12, #8]
        ldr     r5, [r12, #0xC]
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        mov     r8, r0
        mov     r9, r1
        mov     r0, r10
        mov     r2, r10
        mov     r1, r5
        mov     r3, r5
        bl      __muldf3
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        str     r0, [r4, +r11, lsl #3]
        add     r11, r4, r11, lsl #3
        str     r1, [r11, #4]
        add     r11, r7, #3
        ldr     r2, [r6, +r11, lsl #4]
        add     r12, r6, r11, lsl #4
        ldr     r3, [r12, #4]
        ldr     r10, [r12, #8]
        ldr     r5, [r12, #0xC]
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        mov     r8, r0
        mov     r9, r1
        mov     r0, r10
        mov     r2, r10
        mov     r1, r5
        mov     r3, r5
        bl      __muldf3
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        str     r0, [r4, +r11, lsl #3]
        ldr     r2, [sp, #8]
        add     r7, r7, #4
        add     r11, r4, r11, lsl #3
        cmp     r7, r2
        str     r1, [r11, #4]
        ble     LBAD6
        ldr     r5, [sp, #0xC]
LBAD7:
        mov     r12, r7, lsl #4
        mov     r3, r7, lsl #3
        sub     r12, r12, #0xC
        sub     r3, r3, #4
        add     r6, r12, r6
        add     r11, r3, r4
LBAD8:
        ldr     r2, [r6, #0xC]
        ldr     r3, [r6, #0x10]
        ldr     r9, [r6, #0x14]
        ldr     r10, [r6, #0x18]
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        mov     r4, r0
        mov     r8, r1
        mov     r0, r9
        mov     r1, r10
        mov     r2, r9
        mov     r3, r10
        bl      __muldf3
        mov     r2, r4
        mov     r3, r8
        bl      __adddf3
        add     r7, r7, #1
        str     r0, [r11, #4]
        str     r1, [r11, #8]!
        cmp     r7, r5
        add     r6, r6, #0x10
        blt     LBAD8
LBAD9:
        mov     r0, #0
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
LBAD10:
        mvn     r0, #5
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
LBAD11:
        mvn     r0, #7
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}


