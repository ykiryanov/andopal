        .text
        .align  4
        .globl  _ippsMeanStdDev_16s32s_Sfs


_ippsMeanStdDev_16s32s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x5C
        ldr     r7, [sp, #0x80]
        mov     r8, r0
        cmp     r8, #0
        mov     r6, r1
        str     r2, [sp, #0x40]
        str     r3, [sp, #0x44]
        beq     LBHZ31
        ldr     r2, [sp, #0x44]
        cmp     r2, #0
        beq     LBHZ31
        ldr     r2, [sp, #0x40]
        cmp     r2, #0
        beq     LBHZ31
        cmp     r6, #2
        blt     LBHZ22
        subs    r4, r6, #4
        mov     r9, #0
        bmi     LBHZ30
        mov     r0, r9
        mov     r1, r0
        mov     r2, r1
        mov     r3, r2
        mov     r11, r3
        mov     r10, r11
        mov     r5, r10
        str     r5, [sp, #0x28]
        str     r5, [sp, #0x24]
        add     r5, r8, #6
        str     r5, [sp, #0x3C]
        add     lr, r8, #2
        add     r12, r8, #4
        mov     r5, r8
        str     r1, [sp, #0x14]
        str     r0, [sp, #0x10]
        str     r3, [sp, #8]
        str     r2, [sp, #0xC]
        str     r10, [sp, #0x1C]
        str     r11, [sp, #0x18]
        str     r5, [sp, #0x20]
        str     r12, [sp, #4]
        str     lr, [sp]
        str     r4, [sp, #0x2C]
        str     r7, [sp, #0x30]
        str     r6, [sp, #0x34]
        str     r8, [sp, #0x38]
LBHZ0:
        ldr     r1, [sp, #0x20]
        add     r9, r9, #4
        ldrsh   r0, [r1], #8
        str     r1, [sp, #0x20]
        bl      __floatsidf
        ldr     r2, [sp]
        ldr     r12, [sp]
        ldrsh   r2, [r2]
        str     r0, [sp, #0x4C]
        add     r12, r12, #8
        str     r12, [sp]
        mov     r0, r2
        mov     r6, r1
        bl      __floatsidf
        ldr     r12, [sp, #4]
        mov     r7, r0
        mov     r8, r1
        ldrsh   r2, [r12]
        ldr     r12, [sp, #4]
        add     r12, r12, #8
        str     r12, [sp, #4]
        mov     r0, r2
        bl      __floatsidf
        ldr     r12, [sp, #0x3C]
        mov     r11, r0
        mov     r10, r1
        ldrsh   r2, [r12]
        ldr     r12, [sp, #0x3C]
        add     r12, r12, #8
        str     r12, [sp, #0x3C]
        mov     r0, r2
        bl      __floatsidf
        mov     r4, r1
        ldr     r1, [sp, #0x14]
        mov     r5, r0
        ldr     r2, [sp, #0x4C]
        ldr     r0, [sp, #0x10]
        mov     r3, r6
        bl      __adddf3
        ldr     r2, [sp, #0x4C]
        str     r0, [sp, #0x14]
        str     r1, [sp, #0x10]
        mov     r0, r2
        mov     r1, r6
        mov     r3, r6
        bl      __muldf3
        str     r0, [sp, #0x4C]
        ldr     r0, [sp, #0xC]
        str     r1, [sp, #0x50]
        ldr     r1, [sp, #8]
        mov     r3, r8
        mov     r2, r7
        bl      __adddf3
        str     r0, [sp, #0xC]
        str     r1, [sp, #8]
        mov     r1, r8
        mov     r3, r8
        mov     r0, r7
        mov     r2, r7
        bl      __muldf3
        str     r0, [sp, #0x54]
        ldr     r0, [sp, #0x14]
        str     r1, [sp, #0x58]
        ldr     r1, [sp, #0x10]
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        str     r0, [sp, #0x10]
        str     r1, [sp, #0x14]
        mov     r0, r11
        mov     r1, r10
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        mov     r7, r0
        ldr     r0, [sp, #0xC]
        mov     r6, r1
        ldr     r1, [sp, #8]
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        str     r0, [sp, #0xC]
        str     r1, [sp, #8]
        mov     r2, r5
        mov     r3, r4
        mov     r0, r5
        mov     r1, r4
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r0, [sp, #0x4C]
        ldr     r1, [sp, #0x50]
        mov     r2, r7
        mov     r3, r6
        bl      __adddf3
        mov     r7, r0
        mov     r6, r1
        ldr     r0, [sp, #0x54]
        ldr     r1, [sp, #0x58]
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        mov     r4, r0
        mov     r5, r1
        ldr     r0, [sp, #0x18]
        ldr     r1, [sp, #0x1C]
        mov     r2, r7
        mov     r3, r6
        bl      __adddf3
        str     r0, [sp, #0x18]
        str     r1, [sp, #0x1C]
        ldr     r0, [sp, #0x28]
        ldr     r1, [sp, #0x24]
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        ldr     r2, [sp, #0x2C]
        str     r0, [sp, #0x28]
        cmp     r9, r2
        str     r1, [sp, #0x24]
        ble     LBHZ0
        ldr     r1, [sp, #0x14]
        ldr     r0, [sp, #0x10]
        ldr     r3, [sp, #8]
        ldr     r2, [sp, #0xC]
        ldr     r10, [sp, #0x1C]
        ldr     r11, [sp, #0x18]
        ldr     r7, [sp, #0x30]
        ldr     r6, [sp, #0x34]
        ldr     r8, [sp, #0x38]
LBHZ1:
        bl      __adddf3
        ldr     r2, [sp, #0x28]
        ldr     r3, [sp, #0x24]
        mov     r4, r1
        mov     r5, r0
        mov     r1, r10
        mov     r0, r11
        bl      __adddf3
        cmp     r9, r6
        mov     r10, r0
        str     r1, [sp, #0x2C]
        bge     LBHZ5
        sub     r12, r6, r9
        cmp     r12, #5
        blt     LBHZ3
        sub     r12, r6, #5
        add     r11, r8, r9, lsl #1
        str     r12, [sp, #0x3C]
        str     r9, [sp, #0x48]
        str     r7, [sp, #0x30]
        str     r6, [sp, #0x34]
        str     r8, [sp, #0x38]
LBHZ2:
        ldr     r12, [sp, #0x48]
        ldrsh   r0, [r11]
        add     r12, r12, #4
        str     r12, [sp, #0x48]
        bl      __floatsidf
        mov     r8, r0
        mov     r9, r1
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        mov     r6, r0
        mov     r7, r1
        mov     r2, r8
        mov     r1, r4
        mov     r0, r5
        mov     r3, r9
        bl      __adddf3
        mov     r4, r1
        ldr     r1, [sp, #0x2C]
        str     r0, [sp, #0x58]
        mov     r3, r7
        mov     r0, r10
        mov     r2, r6
        bl      __adddf3
        ldrsh   r2, [r11, #2]
        mov     r6, r0
        mov     r5, r1
        mov     r0, r2
        bl      __floatsidf
        mov     r10, r0
        mov     r9, r1
        mov     r2, r10
        mov     r3, r9
        bl      __muldf3
        mov     r7, r0
        ldr     r0, [sp, #0x58]
        mov     r8, r1
        mov     r1, r4
        mov     r2, r10
        mov     r3, r9
        bl      __adddf3
        str     r0, [sp, #0x58]
        mov     r4, r1
        mov     r2, r7
        mov     r1, r5
        mov     r0, r6
        mov     r3, r8
        bl      __adddf3
        ldrsh   r2, [r11, #4]
        mov     r6, r0
        mov     r5, r1
        mov     r0, r2
        bl      __floatsidf
        mov     r10, r1
        mov     r9, r0
        mov     r3, r10
        mov     r2, r9
        bl      __muldf3
        mov     r7, r0
        ldr     r0, [sp, #0x58]
        mov     r8, r1
        mov     r1, r4
        mov     r3, r10
        mov     r2, r9
        bl      __adddf3
        str     r0, [sp, #0x58]
        mov     r4, r1
        mov     r2, r7
        mov     r0, r6
        mov     r1, r5
        mov     r3, r8
        bl      __adddf3
        ldrsh   r2, [r11, #6]
        mov     r7, r0
        mov     r6, r1
        mov     r0, r2
        bl      __floatsidf
        mov     r5, r1
        mov     r10, r0
        mov     r3, r5
        mov     r2, r10
        bl      __muldf3
        mov     r8, r0
        ldr     r0, [sp, #0x58]
        mov     r9, r1
        mov     r1, r4
        mov     r3, r5
        mov     r2, r10
        bl      __adddf3
        mov     r5, r0
        mov     r4, r1
        mov     r0, r7
        mov     r1, r6
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        ldr     lr, [sp, #0x3C]
        ldr     r12, [sp, #0x48]
        add     r11, r11, #8
        mov     r10, r0
        cmp     r12, lr
        str     r1, [sp, #0x2C]
        ble     LBHZ2
        ldr     r9, [sp, #0x48]
        ldr     r7, [sp, #0x30]
        ldr     r6, [sp, #0x34]
        ldr     r8, [sp, #0x38]
LBHZ3:
        add     r8, r8, r9, lsl #1
        str     r7, [sp, #0x30]
        str     r6, [sp, #0x34]
LBHZ4:
        ldrsh   r0, [r8], #2
        add     r9, r9, #1
        bl      __floatsidf
        mov     r7, r0
        mov     r6, r1
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        str     r0, [sp, #0x58]
        mov     r11, r1
        mov     r1, r4
        mov     r0, r5
        mov     r2, r7
        mov     r3, r6
        bl      __adddf3
        mov     r4, r1
        ldr     r1, [sp, #0x2C]
        ldr     r2, [sp, #0x58]
        mov     r5, r0
        mov     r0, r10
        mov     r3, r11
        bl      __adddf3
        ldr     r12, [sp, #0x34]
        mov     r10, r0
        str     r1, [sp, #0x2C]
        cmp     r9, r12
        blt     LBHZ4
        ldr     r7, [sp, #0x30]
        ldr     r6, [sp, #0x34]
LBHZ5:
        mov     r0, r6
        bl      __floatsidf
        mov     r3, r1
        str     r3, [sp, #0x38]
        mov     r8, r0
        mov     r0, r5
        mov     r1, r4
        mov     r2, r8
        bl      __divdf3
        mov     r11, r0
        cmp     r7, #0
        mov     r9, r1
        mov     r0, r7
        blt     LBHZ26
        cmp     r7, #0
        ble     LBHZ9
        cmp     r7, #6
        blt     LBHZ7
        str     r0, [sp, #0x58]
        mov     r0, r11
        ldr     r11, [sp, #0x58]
        mov     r1, r9
        mov     r9, r7
        mov     r7, r6
LBHZ6:
        mov     r12, #0xFE, 12
        orr     r6, r12, #3, 4
        mov     r2, #0
        mov     r3, r6
        bl      __muldf3
        mov     r2, #0
        mov     r3, r6
        bl      __muldf3
        mov     r2, #0
        mov     r3, r6
        bl      __muldf3
        mov     r2, #0
        mov     r3, r6
        bl      __muldf3
        mov     r2, #0
        mov     r3, r6
        bl      __muldf3
        sub     r11, r11, #5
        cmp     r11, #6
        bge     LBHZ6
        str     r0, [sp, #0x54]
        mov     r0, r11
        ldr     r11, [sp, #0x54]
        mov     r6, r7
        mov     r7, r9
        mov     r9, r1
LBHZ7:
        str     r0, [sp, #0x58]
        mov     r0, r11
        ldr     r11, [sp, #0x58]
LBHZ8:
        mov     r12, #0xFE, 12
        orr     r3, r12, #3, 4
        mov     r1, r9
        mov     r2, #0
        bl      __muldf3
        sub     r11, r11, #1
        cmp     r11, #0
        mov     r9, r1
        bgt     LBHZ8
        mov     r11, r0
LBHZ9:
        mov     r0, r11
        mov     r1, r9
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        mov     r12, #0xFE, 12
        cmp     r0, #0
        orr     r3, r12, #3, 4
        bge     LBHZ10
        mov     r0, r11
        mov     r1, r9
        mov     r2, #0
        bl      __subdf3
        mov     r11, r0
        mov     r9, r1
        b       LBHZ11
LBHZ10:
        mov     r1, r3
        mov     r2, r11
        mov     r3, r9
        mov     r0, #0
        bl      __adddf3
        mov     r11, r0
        mov     r9, r1
LBHZ11:
        mov     r0, r11
        mov     r1, r9
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        bge     LBHZ13
        mov     r0, r11
        mov     r12, #0xFE, 12
        orr     r12, r12, #3, 4
        sub     r3, r12, #0x7E, 8
        mov     r1, r9
        mov     r2, #0
        bl      __gtdf2
        cmp     r0, #0
        ble     LBHZ12
        mov     r0, r11
        mov     r1, r9
        bl      __fixdfsi
        ldr     r12, [sp, #0x40]
        str     r0, [r12]
        b       LBHZ15
LBHZ12:
        ldr     r12, [sp, #0x40]
        mov     lr, #2, 2
        str     lr, [r12]
        b       LBHZ15
LBHZ13:
        mov     r0, r11
        mov     lr, #0
        mvn     r12, #0xE2, 12
        sub     r2, lr, #1, 10
        bic     r3, r12, #0xB, 4
        mov     r1, r9
        bl      __ltdf2
        cmp     r0, #0
        bge     LBHZ14
        mov     r0, r11
        mov     r1, r9
        bl      __fixdfsi
        ldr     r12, [sp, #0x40]
        str     r0, [r12]
        b       LBHZ15
LBHZ14:
        ldr     r12, [sp, #0x40]
        mvn     lr, #2, 2
        str     lr, [r12]
LBHZ15:
        mov     r0, r10
        ldr     r1, [sp, #0x2C]
        ldr     r9, [sp, #0x38]
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        mov     r10, r0
        mov     r11, r1
        mov     r0, r5
        mov     r2, r5
        mov     r1, r4
        mov     r3, r4
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r10
        mov     r1, r11
        bl      __subdf3
        mov     r5, r0
        sub     r0, r6, #1
        mov     r6, r1
        bl      __floatsidf
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        mov     r9, r0
        mov     r8, r1
        mov     r0, r5
        mov     r1, r6
        mov     r2, #0
        mov     r3, #0
        bl      __gtdf2
        cmp     r0, #0
        mov     r4, #0
        movle   r8, #0
        movle   r6, r8
        ble     LBHZ16
        mov     r0, r5
        mov     r1, r6
        mov     r2, r9
        mov     r3, r8
        bl      __divdf3
        bl      sqrt
        mov     r8, r0
        mov     r6, r1
LBHZ16:
        mov     r2, #0xFE, 12
        cmp     r7, #0
        orr     r5, r2, #3, 4
        blt     LBHZ23
        cmp     r7, #0
        movle   r2, #0
        addle   r3, r5, #1, 12
        ble     LBHZ19
        cmp     r7, #6
        movlt   r2, #0
        addlt   r3, r5, #1, 12
        blt     LBHZ18
        mov     r2, #0
        add     r3, r5, #1, 12
LBHZ17:
        mov     r0, r2
        mov     r1, r3
        mov     r2, #0
        mov     r3, r5
        bl      __muldf3
        mov     r2, #0
        mov     r3, r5
        bl      __muldf3
        mov     r2, #0
        mov     r3, r5
        bl      __muldf3
        mov     r2, #0
        mov     r3, r5
        bl      __muldf3
        mov     r2, #0
        mov     r3, r5
        bl      __muldf3
        sub     r7, r7, #5
        cmp     r7, #6
        mov     r2, r0
        mov     r3, r1
        bge     LBHZ17
LBHZ18:
        mov     r0, r2
        mov     r1, r3
        mov     r2, #0
        mov     r3, r5
        bl      __muldf3
        sub     r7, r7, #1
        cmp     r7, #0
        mov     r2, r0
        mov     r3, r1
        bgt     LBHZ18
LBHZ19:
        mov     r0, r8
        mov     r1, r6
        bl      __muldf3
        mov     r3, r5
        mov     r2, #0
        bl      __adddf3
        mvn     r12, #0xE2, 12
        bic     r3, r12, #0xB, 4
        mov     r6, r0
        mov     r5, r1
        sub     r2, r4, #1, 10
        bl      __ltdf2
        cmp     r0, #0
        bge     LBHZ21
        mov     r0, r6
        mov     r1, r5
        bl      __fixdfsi
        mov     r4, r0
        tst     r4, #1
        beq     LBHZ20
        mov     r0, r4
        bl      __floatsidf
        mov     r2, r6
        mov     r3, r5
        bl      __eqdf2
        cmp     r0, #0
        subeq   r4, r4, #1
LBHZ20:
        ldr     r1, [sp, #0x44]
        str     r4, [r1]
        mov     r0, #0
        add     sp, sp, #0x5C
        ldmia   sp!, {r4 - r11, pc}
LBHZ21:
        ldr     r0, [sp, #0x44]
        mvn     r1, #2, 2
        str     r1, [r0]
        mov     r0, #0
        add     sp, sp, #0x5C
        ldmia   sp!, {r4 - r11, pc}
LBHZ22:
        mvn     r0, #5
        add     sp, sp, #0x5C
        ldmia   sp!, {r4 - r11, pc}
LBHZ23:
        cmp     r7, #0
        movge   r2, #0
        addge   r3, r5, #1, 12
        bge     LBHZ19
        rsb     r2, r7, #0
        cmp     r2, #6
        movlt   r2, #0
        addlt   r3, r5, #1, 12
        blt     LBHZ25
        mov     r2, #0
        add     r3, r5, #1, 12
LBHZ24:
        mov     r0, r2
        mov     r1, r3
        bl      __adddf3
        mov     r2, r0
        mov     r3, r1
        bl      __adddf3
        mov     r2, r0
        mov     r3, r1
        bl      __adddf3
        mov     r2, r0
        mov     r3, r1
        bl      __adddf3
        mov     r2, r0
        mov     r3, r1
        bl      __adddf3
        add     r7, r7, #5
        cmn     r7, #6
        mov     r2, r0
        mov     r3, r1
        blt     LBHZ24
LBHZ25:
        mov     r0, r2
        mov     r1, r3
        bl      __adddf3
        adds    r7, r7, #1
        mov     r2, r0
        mov     r3, r1
        bmi     LBHZ25
        b       LBHZ19
LBHZ26:
        cmp     r7, #0
        bge     LBHZ9
        rsb     r12, r7, #0
        cmp     r12, #6
        blt     LBHZ28
        str     r0, [sp, #0x58]
        mov     r0, r11
        mov     r11, r7
        ldr     r7, [sp, #0x58]
LBHZ27:
        mov     r2, r0
        mov     r3, r9
        mov     r1, r9
        bl      __adddf3
        mov     r2, r0
        mov     r3, r1
        bl      __adddf3
        mov     r2, r0
        mov     r3, r1
        bl      __adddf3
        mov     r2, r0
        mov     r3, r1
        bl      __adddf3
        mov     r2, r0
        mov     r3, r1
        bl      __adddf3
        add     r7, r7, #5
        cmn     r7, #6
        mov     r9, r1
        blt     LBHZ27
        str     r0, [sp, #0x54]
        mov     r0, r7
        mov     r7, r11
        ldr     r11, [sp, #0x54]
LBHZ28:
        str     r0, [sp, #0x58]
        mov     r0, r11
        mov     r11, r7
        ldr     r7, [sp, #0x58]
LBHZ29:
        mov     r1, r9
        mov     r2, r0
        mov     r3, r9
        bl      __adddf3
        adds    r7, r7, #1
        mov     r9, r1
        bmi     LBHZ29
        mov     r7, r11
        mov     r11, r0
        b       LBHZ9
LBHZ30:
        mov     r0, r9
        mov     r1, r0
        mov     r2, r1
        mov     r3, r2
        mov     r11, r3
        mov     r10, r11
        mov     r5, r10
        str     r5, [sp, #0x28]
        str     r5, [sp, #0x24]
        b       LBHZ1
LBHZ31:
        mvn     r0, #7
        add     sp, sp, #0x5C
        ldmia   sp!, {r4 - r11, pc}


