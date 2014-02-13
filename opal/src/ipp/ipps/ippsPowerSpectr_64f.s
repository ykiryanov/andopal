        .text
        .align  4
        .globl  _ippsPowerSpectr_64f


_ippsPowerSpectr_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x74
        cmp     r0, #0
        beq     LBAE11
        cmp     r1, #0
        beq     LBAE11
        cmp     r2, #0
        beq     LBAE11
        cmp     r3, #1
        blt     LBAE10
        cmp     r3, #8
        ble     LBAE5
        mov     r7, r3, asr #3
        cmp     r7, #0
        and     r6, r3, #7
        ble     LBAE1
        sub     r4, r2, #0xC
        str     r4, [sp, #0x4C]
        sub     r4, r1, #0xC
        str     r4, [sp, #0x48]
        sub     r4, r0, #0xC
        str     r4, [sp, #0x44]
        sub     r4, r2, #0x14
        str     r4, [sp, #0x40]
        sub     r4, r1, #0x14
        str     r4, [sp, #0x3C]
        sub     r4, r0, #0x14
        str     r4, [sp, #0x38]
        sub     r4, r2, #0x1C
        str     r4, [sp, #0x34]
        sub     r4, r1, #0x1C
        str     r4, [sp, #0x30]
        sub     r4, r0, #0x1C
        str     r4, [sp, #0x2C]
        sub     r4, r2, #0x24
        str     r4, [sp, #0x28]
        sub     r4, r1, #0x24
        str     r4, [sp, #0x24]
        sub     r4, r0, #0x24
        str     r4, [sp, #0x20]
        sub     r4, r2, #0x2C
        str     r4, [sp, #0x1C]
        sub     r4, r1, #0x2C
        str     r4, [sp, #0x18]
        sub     r4, r0, #0x2C
        str     r4, [sp, #0x14]
        sub     r5, r2, #4
        sub     r4, r2, #0x34
        str     r4, [sp]
        str     r5, [sp, #0x54]
        str     r6, [sp, #0x50]
        str     r7, [sp, #0x58]
        ldr     r6, [sp]
        ldr     r7, [sp, #0x28]
        ldr     r5, [sp, #0x34]
        sub     lr, r1, #4
        sub     r12, r0, #4
        sub     r9, r1, #0x34
        sub     r10, r0, #0x34
        sub     r11, r1, #0x3C
        sub     r8, r0, #0x3C
        sub     r4, r2, #0x3C
        str     r8, [sp, #0x68]
        str     r11, [sp, #0x5C]
        str     r10, [sp, #0x6C]
        str     r9, [sp, #0x70]
        str     r12, [sp, #0x60]
        str     lr, [sp, #0x64]
        str     r3, [sp, #4]
        str     r2, [sp, #8]
        str     r1, [sp, #0xC]
        str     r0, [sp, #0x10]
LBAE0:
        ldr     r1, [sp, #0x68]
        ldr     r12, [sp, #0x5C]
        ldr     r2, [r1, #0x3C]
        ldr     r3, [r1, #0x40]
        ldr     r11, [r12, #0x3C]
        ldr     r8, [r12, #0x40]
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        mov     r9, r0
        mov     r10, r1
        mov     r0, r11
        mov     r1, r8
        mov     r2, r11
        mov     r3, r8
        bl      __muldf3
        mov     r2, r9
        mov     r3, r10
        bl      __adddf3
        str     r1, [r4, #0x40]
        str     r0, [r4, #0x3C]
        ldr     r1, [sp, #0x6C]
        ldr     r12, [sp, #0x70]
        add     r4, r4, #0x40
        ldr     r2, [r1, #0x3C]
        ldr     r3, [r1, #0x40]
        ldr     r11, [r12, #0x3C]
        ldr     r8, [r12, #0x40]
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        mov     r9, r0
        mov     r10, r1
        mov     r0, r11
        mov     r1, r8
        mov     r2, r11
        mov     r3, r8
        bl      __muldf3
        mov     r2, r9
        mov     r3, r10
        bl      __adddf3
        str     r0, [r6, #0x3C]
        str     r1, [r6, #0x40]!
        ldr     r1, [sp, #0x14]
        ldr     r12, [sp, #0x18]
        ldr     r2, [r1, #0x3C]
        ldr     r3, [r1, #0x40]
        ldr     r11, [r12, #0x3C]
        ldr     r8, [r12, #0x40]
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        mov     r9, r0
        mov     r10, r1
        mov     r0, r11
        mov     r1, r8
        mov     r2, r11
        mov     r3, r8
        bl      __muldf3
        mov     r2, r9
        mov     r3, r10
        bl      __adddf3
        ldr     r2, [sp, #0x1C]
        str     r0, [r2, #0x3C]
        ldr     r0, [sp, #0x1C]
        str     r1, [r0, #0x40]
        ldr     r1, [sp, #0x20]
        ldr     r12, [sp, #0x24]
        ldr     r2, [r1, #0x3C]
        ldr     r3, [r1, #0x40]
        ldr     r11, [r12, #0x3C]
        ldr     r8, [r12, #0x40]
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        mov     r9, r0
        mov     r10, r1
        mov     r2, r11
        mov     r3, r8
        mov     r0, r11
        mov     r1, r8
        bl      __muldf3
        mov     r2, r9
        mov     r3, r10
        bl      __adddf3
        str     r0, [r7, #0x3C]
        str     r1, [r7, #0x40]!
        ldr     r1, [sp, #0x2C]
        ldr     r12, [sp, #0x30]
        ldr     r2, [r1, #0x3C]
        ldr     r3, [r1, #0x40]
        ldr     r11, [r12, #0x3C]
        ldr     r8, [r12, #0x40]
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        mov     r9, r0
        mov     r10, r1
        mov     r2, r11
        mov     r3, r8
        mov     r0, r11
        mov     r1, r8
        bl      __muldf3
        mov     r2, r9
        mov     r3, r10
        bl      __adddf3
        str     r0, [r5, #0x3C]
        str     r1, [r5, #0x40]!
        ldr     r1, [sp, #0x38]
        ldr     r12, [sp, #0x3C]
        ldr     r0, [r1, #0x3C]
        ldr     r1, [r1, #0x40]
        ldr     r11, [r12, #0x3C]
        ldr     r8, [r12, #0x40]
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        mov     r9, r0
        mov     r10, r1
        mov     r2, r11
        mov     r3, r8
        mov     r0, r11
        mov     r1, r8
        bl      __muldf3
        mov     r2, r9
        mov     r3, r10
        bl      __adddf3
        ldr     r2, [sp, #0x40]
        str     r1, [r2, #0x40]
        str     r0, [r2, #0x3C]
        ldr     r1, [sp, #0x44]
        ldr     r12, [sp, #0x48]
        ldr     r0, [r1, #0x3C]
        ldr     r1, [r1, #0x40]
        ldr     r11, [r12, #0x3C]
        ldr     r8, [r12, #0x40]
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        mov     r9, r0
        mov     r10, r1
        mov     r2, r11
        mov     r3, r8
        mov     r0, r11
        mov     r1, r8
        bl      __muldf3
        mov     r2, r9
        mov     r3, r10
        bl      __adddf3
        ldr     r2, [sp, #0x4C]
        str     r0, [r2, #0x3C]
        str     r1, [r2, #0x40]
        ldr     r1, [sp, #0x60]
        ldr     r12, [sp, #0x64]
        ldr     r2, [r1, #0x3C]
        ldr     r3, [r1, #0x40]
        ldr     r11, [r12, #0x3C]
        ldr     r8, [r12, #0x40]
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        mov     r9, r0
        mov     r10, r1
        mov     r0, r11
        mov     r1, r8
        mov     r2, r11
        mov     r3, r8
        bl      __muldf3
        mov     r2, r9
        mov     r3, r10
        bl      __adddf3
        ldr     r2, [sp, #0x54]
        str     r1, [r2, #0x40]
        str     r0, [r2, #0x3C]
        ldr     r0, [sp, #0x58]
        add     r2, r2, #0x40
        str     r2, [sp, #0x54]
        subs    r0, r0, #1
        str     r0, [sp, #0x58]
        ldr     r0, [sp, #0x64]
        add     r0, r0, #0x40
        str     r0, [sp, #0x64]
        ldr     r0, [sp, #0x60]
        add     r0, r0, #0x40
        str     r0, [sp, #0x60]
        ldr     r0, [sp, #0x4C]
        add     r0, r0, #0x40
        str     r0, [sp, #0x4C]
        ldr     r0, [sp, #0x48]
        add     r0, r0, #0x40
        str     r0, [sp, #0x48]
        ldr     r0, [sp, #0x44]
        add     r0, r0, #0x40
        str     r0, [sp, #0x44]
        ldr     r0, [sp, #0x40]
        add     r0, r0, #0x40
        str     r0, [sp, #0x40]
        ldr     r0, [sp, #0x3C]
        add     r0, r0, #0x40
        str     r0, [sp, #0x3C]
        ldr     r0, [sp, #0x38]
        add     r0, r0, #0x40
        str     r0, [sp, #0x38]
        ldr     r0, [sp, #0x30]
        add     r0, r0, #0x40
        str     r0, [sp, #0x30]
        ldr     r0, [sp, #0x2C]
        add     r0, r0, #0x40
        str     r0, [sp, #0x2C]
        ldr     r0, [sp, #0x24]
        add     r0, r0, #0x40
        str     r0, [sp, #0x24]
        ldr     r0, [sp, #0x20]
        add     r0, r0, #0x40
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #0x1C]
        add     r0, r0, #0x40
        str     r0, [sp, #0x1C]
        ldr     r0, [sp, #0x18]
        add     r0, r0, #0x40
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x14]
        add     r0, r0, #0x40
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #0x70]
        add     r0, r0, #0x40
        str     r0, [sp, #0x70]
        ldr     r0, [sp, #0x6C]
        add     r0, r0, #0x40
        str     r0, [sp, #0x6C]
        ldr     r0, [sp, #0x5C]
        add     r0, r0, #0x40
        str     r0, [sp, #0x5C]
        ldr     r0, [sp, #0x68]
        add     r0, r0, #0x40
        str     r0, [sp, #0x68]
        ldr     r0, [sp, #0x58]
        bne     LBAE0
        ldr     r6, [sp, #0x50]
        ldr     r3, [sp, #4]
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #0xC]
        ldr     r0, [sp, #0x10]
LBAE1:
        sub     r4, r3, r6
        cmp     r4, r3
        bge     LBAE9
        sub     r12, r3, r4
        cmp     r12, #5
        blt     LBAE3
        mov     r12, r4, lsl #3
        sub     lr, r12, #4
        sub     r12, r3, #5
        add     r7, lr, r2
        add     r6, lr, r1
        add     r5, lr, r0
        str     r12, [sp, #0x70]
        str     r3, [sp, #4]
        str     r2, [sp, #8]
        str     r1, [sp, #0xC]
        str     r0, [sp, #0x10]
LBAE2:
        ldr     r0, [r5, #4]
        ldr     r1, [r5, #8]
        ldr     r8, [r6, #4]
        ldr     r9, [r6, #8]
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        mov     r10, r0
        mov     r11, r1
        mov     r2, r8
        mov     r3, r9
        mov     r0, r8
        mov     r1, r9
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        str     r0, [r7, #4]
        str     r1, [r7, #8]
        ldr     r9, [r6, #0xC]
        ldr     r8, [r6, #0x10]
        ldr     r2, [r5, #0xC]
        ldr     r3, [r5, #0x10]
        add     r4, r4, #4
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        mov     r10, r0
        mov     r11, r1
        mov     r0, r9
        mov     r1, r8
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        str     r0, [r7, #0xC]
        str     r1, [r7, #0x10]
        ldr     r0, [r5, #0x14]
        ldr     r1, [r5, #0x18]
        ldr     r11, [r6, #0x14]
        ldr     r10, [r6, #0x18]
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        mov     r8, r0
        mov     r9, r1
        mov     r0, r11
        mov     r1, r10
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        str     r0, [r7, #0x14]
        str     r1, [r7, #0x18]
        ldr     r2, [r5, #0x1C]
        ldr     r3, [r5, #0x20]!
        ldr     r10, [r6, #0x1C]
        ldr     r11, [r6, #0x20]!
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        mov     r8, r0
        mov     r9, r1
        mov     r0, r10
        mov     r2, r10
        mov     r1, r11
        mov     r3, r11
        bl      __muldf3
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        str     r0, [r7, #0x1C]
        str     r1, [r7, #0x20]!
        ldr     r0, [sp, #0x70]
        cmp     r4, r0
        ble     LBAE2
        ldr     r3, [sp, #4]
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #0xC]
        ldr     r0, [sp, #0x10]
LBAE3:
        mov     r12, r4, lsl #3
        sub     r12, r12, #4
        add     r5, r12, r2
        add     r6, r12, r1
        add     r7, r12, r0
        str     r3, [sp, #4]
LBAE4:
        ldr     r2, [r7, #4]
        ldr     r3, [r7, #8]!
        ldr     r10, [r6, #4]
        ldr     r11, [r6, #8]!
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        mov     r8, r0
        mov     r9, r1
        mov     r0, r10
        mov     r1, r11
        mov     r2, r10
        mov     r3, r11
        bl      __muldf3
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        str     r0, [r5, #4]
        str     r1, [r5, #8]!
        ldr     r0, [sp, #4]
        add     r4, r4, #1
        cmp     r4, r0
        blt     LBAE4
        mov     r0, #0
        add     sp, sp, #0x74
        ldmia   sp!, {r4 - r11, pc}
LBAE5:
        cmp     r3, #5
        mov     r4, #0
        blt     LBAE7
        sub     r12, r3, #5
        sub     r7, r2, #4
        sub     r6, r1, #4
        sub     r5, r0, #4
        str     r12, [sp]
        str     r3, [sp, #4]
        str     r2, [sp, #8]
        str     r1, [sp, #0xC]
        str     r0, [sp, #0x10]
LBAE6:
        ldr     r0, [r5, #4]
        ldr     r1, [r5, #8]
        ldr     r8, [r6, #4]
        ldr     r9, [r6, #8]
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        mov     r10, r0
        mov     r11, r1
        mov     r2, r8
        mov     r3, r9
        mov     r0, r8
        mov     r1, r9
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        str     r0, [r7, #4]
        str     r1, [r7, #8]
        ldr     r9, [r6, #0xC]
        ldr     r8, [r6, #0x10]
        ldr     r2, [r5, #0xC]
        ldr     r3, [r5, #0x10]
        add     r4, r4, #4
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        mov     r10, r0
        mov     r11, r1
        mov     r0, r9
        mov     r1, r8
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        str     r0, [r7, #0xC]
        str     r1, [r7, #0x10]
        ldr     r0, [r5, #0x14]
        ldr     r1, [r5, #0x18]
        ldr     r11, [r6, #0x14]
        ldr     r10, [r6, #0x18]
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        mov     r8, r0
        mov     r9, r1
        mov     r0, r11
        mov     r1, r10
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        str     r0, [r7, #0x14]
        str     r1, [r7, #0x18]
        ldr     r2, [r5, #0x1C]
        ldr     r3, [r5, #0x20]!
        ldr     r10, [r6, #0x1C]
        ldr     r11, [r6, #0x20]!
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        mov     r8, r0
        mov     r9, r1
        mov     r0, r10
        mov     r2, r10
        mov     r1, r11
        mov     r3, r11
        bl      __muldf3
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        str     r0, [r7, #0x1C]
        str     r1, [r7, #0x20]!
        ldr     r0, [sp]
        cmp     r4, r0
        ble     LBAE6
        ldr     r3, [sp, #4]
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #0xC]
        ldr     r0, [sp, #0x10]
LBAE7:
        mov     r12, r4, lsl #3
        sub     r12, r12, #4
        add     r5, r12, r2
        add     r6, r12, r1
        add     r7, r12, r0
        str     r3, [sp, #4]
LBAE8:
        ldr     r2, [r7, #4]
        ldr     r3, [r7, #8]!
        ldr     r10, [r6, #4]
        ldr     r11, [r6, #8]!
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        mov     r8, r0
        mov     r9, r1
        mov     r0, r10
        mov     r1, r11
        mov     r2, r10
        mov     r3, r11
        bl      __muldf3
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        str     r0, [r5, #4]
        str     r1, [r5, #8]!
        ldr     r0, [sp, #4]
        add     r4, r4, #1
        cmp     r4, r0
        blt     LBAE8
LBAE9:
        mov     r0, #0
        add     sp, sp, #0x74
        ldmia   sp!, {r4 - r11, pc}
LBAE10:
        mvn     r0, #5
        add     sp, sp, #0x74
        ldmia   sp!, {r4 - r11, pc}
LBAE11:
        mvn     r0, #7
        add     sp, sp, #0x74
        ldmia   sp!, {r4 - r11, pc}


