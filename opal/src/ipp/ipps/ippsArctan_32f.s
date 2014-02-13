        .text
        .align  4
        .globl  _ippsArctan_32f


_ippsArctan_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #1, 24
        mov     r12, r0
        mov     r3, #0
        mov     r0, r3
        str     r0, [sp, #0xDC]
        cmp     r12, #0
        mov     r4, r1
        mov     r5, r2
        str     r0, [sp, #0xE0]
        beq     LCZI65
        cmp     r4, #0
        beq     LCZI65
        cmp     r5, #1
        blt     LCZI26
        ldr     r11, [pc, #0xF3C]
        mov     r6, #0xFF, 10
        orr     lr, r6, #3, 2
        cmp     r5, #4
        orr     r6, r6, #1, 2
        bge     LCZI7
        cmp     r5, #0
        ble     LCZI6
        str     r3, [sp, #0xFC]
        sub     r7, r3, #1, 10
        sub     r3, lr, #2, 2
        str     r3, [sp, #0xE8]
        str     r7, [sp, #0xEC]
        str     r6, [sp, #0xD8]
        str     lr, [sp, #0xE4]
        mov     r10, r12
LCZI0:
        ldr     lr, [sp, #0xD8]
        ldr     r8, [r10], #4
        sub     lr, lr, #1, 10
        mvn     r6, #2, 2
        and     lr, r8, lr
        bic     r6, r8, r6
        str     r8, [sp, #0xFC]
        mov     r3, lr, lsr #23
        cmp     r3, #0xFE
        mov     r6, r6, lsr #31
        ble     LCZI3
        ldr     r3, [sp, #0xE4]
        mvn     r3, r3
        bic     r3, r8, r3
        cmn     r3, #1, 10
        bne     LCZI1
        ldr     r3, [sp, #0xEC]
        str     r3, [r4]
        str     r3, [sp, #0xFC]
        b       LCZI5
LCZI1:
        ldr     lr, [sp, #0xE8]
        cmp     lr, r3
        bne     LCZI2
        ldr     r3, [sp, #0xE8]
        str     r3, [r4]
        str     r3, [sp, #0xFC]
        b       LCZI5
LCZI2:
        ldr     r0, [r11, +r6, lsl #3]
        add     r6, r11, r6, lsl #3
        ldr     r1, [r6, #4]
        bl      __truncdfsf2
        str     r0, [r4]
        b       LCZI5
LCZI3:
        cmp     r3, #0x7F
        blt     LCZI4
        mov     r0, r8
        bl      __extendsfdf2
        mov     r3, r1
        mov     lr, #0xFF, 12
        mov     r2, r0
        orr     r1, lr, #3, 4
        mov     r0, #0
        bl      __divdf3
        mov     r8, r0
        mov     r9, r1
        mov     r2, r8
        mov     r3, r9
        add     r7, r11, r6, lsl #3
        bl      __muldf3
        ldr     r12, [r11, +r6, lsl #3]
        ldr     lr, [r7, #4]
        mov     r6, r0
        mov     r7, r1
        mov     r0, r12
        mov     r1, lr
        mov     r2, r8
        mov     r3, r9
        bl      __subdf3
        ldr     r2, [r11, #0x10]
        ldr     r3, [r11, #0x14]
        ldr     lr, [r11, #0x28]
        str     lr, [sp, #0xE0]
        ldr     lr, [r11, #0x2C]
        str     lr, [sp, #0xDC]
        ldr     lr, [r11, #0x20]
        str     lr, [sp, #0xD4]
        ldr     lr, [r11, #0x24]
        str     lr, [sp, #0xD0]
        ldr     lr, [r11, #0x18]
        str     lr, [sp, #0xCC]
        ldr     lr, [r11, #0x1C]
        str     r0, [sp, #0xC4]
        str     r1, [sp, #0xC0]
        mov     r0, r2
        str     lr, [sp, #0xC8]
        mov     r1, r3
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        ldr     r2, [sp, #0xCC]
        ldr     r3, [sp, #0xC8]
        bl      __adddf3
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        ldr     r3, [sp, #0xD0]
        ldr     r2, [sp, #0xD4]
        bl      __adddf3
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        ldr     r2, [sp, #0xE0]
        ldr     r3, [sp, #0xDC]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        ldr     r8, [r11, #0x48]
        ldr     r9, [r11, #0x4C]
        ldr     r2, [r11, #0x40]
        ldr     lr, [r11, #0x30]
        ldr     r12, [r11, #0x34]
        str     r2, [sp, #0xE0]
        ldr     r2, [r11, #0x44]
        mov     r3, r7
        str     r2, [sp, #0xDC]
        ldr     r2, [r11, #0x38]
        str     r2, [sp, #0xD4]
        ldr     r2, [r11, #0x3C]
        str     r0, [sp, #0xCC]
        str     r1, [sp, #0xC8]
        str     r2, [sp, #0xD0]
        mov     r0, lr
        mov     r1, r12
        mov     r2, r6
        bl      __muldf3
        ldr     r2, [sp, #0xD4]
        ldr     r3, [sp, #0xD0]
        bl      __adddf3
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        ldr     r2, [sp, #0xE0]
        ldr     r3, [sp, #0xDC]
        bl      __adddf3
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [sp, #0xCC]
        ldr     r1, [sp, #0xC8]
        bl      __divdf3
        ldr     r2, [sp, #0xC4]
        ldr     r3, [sp, #0xC0]
        bl      __adddf3
        bl      __truncdfsf2
        str     r0, [r4]
        b       LCZI5
LCZI4:
        mov     r0, r8
        mov     r1, r8
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r6, r0
        mov     r7, r1
        mov     r0, r8
        bl      __extendsfdf2
        ldr     lr, [r11, #0x28]
        mov     r8, r0
        ldr     r0, [r11, #0x10]
        mov     r9, r1
        ldr     r1, [r11, #0x14]
        str     lr, [sp, #0xE0]
        ldr     lr, [r11, #0x2C]
        mov     r2, r6
        mov     r3, r7
        str     lr, [sp, #0xDC]
        ldr     lr, [r11, #0x20]
        str     lr, [sp, #0xD4]
        ldr     lr, [r11, #0x24]
        str     lr, [sp, #0xD0]
        ldr     lr, [r11, #0x18]
        str     lr, [sp, #0xCC]
        ldr     lr, [r11, #0x1C]
        str     lr, [sp, #0xC8]
        bl      __muldf3
        ldr     r2, [sp, #0xCC]
        ldr     r3, [sp, #0xC8]
        bl      __adddf3
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        ldr     r2, [sp, #0xD4]
        ldr     r3, [sp, #0xD0]
        bl      __adddf3
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        ldr     r2, [sp, #0xE0]
        ldr     r3, [sp, #0xDC]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        ldr     lr, [r11, #0x48]
        str     lr, [sp, #0xE0]
        ldr     lr, [r11, #0x4C]
        str     lr, [sp, #0xDC]
        ldr     lr, [r11, #0x40]
        ldr     r2, [r11, #0x30]
        ldr     r3, [r11, #0x34]
        str     lr, [sp, #0xD4]
        ldr     lr, [r11, #0x44]
        str     lr, [sp, #0xD0]
        ldr     lr, [r11, #0x38]
        str     lr, [sp, #0xCC]
        ldr     lr, [r11, #0x3C]
        str     r0, [sp, #0xC4]
        str     r1, [sp, #0xC0]
        str     lr, [sp, #0xC8]
        mov     r0, r2
        mov     r1, r3
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        ldr     r2, [sp, #0xCC]
        ldr     r3, [sp, #0xC8]
        bl      __adddf3
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        ldr     r2, [sp, #0xD4]
        ldr     r3, [sp, #0xD0]
        bl      __adddf3
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        ldr     r2, [sp, #0xE0]
        ldr     r3, [sp, #0xDC]
        bl      __adddf3
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [sp, #0xC4]
        ldr     r1, [sp, #0xC0]
        bl      __divdf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r8
        mov     r1, r9
        bl      __subdf3
        bl      __truncdfsf2
        str     r0, [r4]
LCZI5:
        subs    r5, r5, #1
        add     r4, r4, #4
        bne     LCZI0
LCZI6:
        mov     r0, #0
        add     sp, sp, #1, 24
        ldmia   sp!, {r4 - r11, pc}
LCZI7:
        subs    r5, r5, #1
        str     r3, [sp, #0xF4]
        str     r3, [sp, #0xF8]
        str     r3, [sp, #0xFC]
        bmi     LCZI12
        sub     r10, r3, #1, 10
        sub     r7, lr, #2, 2
        add     r9, r12, r5, lsl #2
        add     r8, r4, r5, lsl #2
        str     r4, [sp, #0xBC]
        str     r12, [sp, #0xC]
        str     r0, [sp, #0xA8]
LCZI8:
        ldr     r11, [r9], #-4
        sub     r0, r6, #1, 10
        and     r0, r11, r0
        str     r11, [sp, #0xFC]
        mov     r0, r0, lsr #23
        cmp     r0, #0xFE
        mvn     r0, #2, 2
        bic     r0, r11, r0
        mov     r4, r0, lsr #31
        ble     LCZI64
        mov     r1, #0xFF, 10
        orr     r1, r1, #3, 2
        mvn     r1, r1
        bic     r1, r11, r1
        cmn     r1, #1, 10
        bne     LCZI9
        mov     r1, #0
        str     r10, [r8]
        str     r10, [sp, #0xFC]
        sub     r11, r1, #1, 10
        b       LCZI11
LCZI9:
        cmp     r7, r1
        bne     LCZI10
        mov     r1, #0xFF, 10
        orr     r1, r1, #3, 2
        str     r7, [r8]
        str     r7, [sp, #0xFC]
        sub     r11, r1, #2, 2
        b       LCZI11
LCZI10:
        ldr     r1, [pc, #0xA94]
        ldr     r0, [r1, +r4, lsl #3]
        add     r1, r1, r4, lsl #3
        ldr     r1, [r1, #4]
        bl      __truncdfsf2
        str     r0, [r8]
LCZI11:
        subs    r5, r5, #1
        sub     r8, r8, #4
        bpl     LCZI8
        mov     r3, r4
        ldr     r4, [sp, #0xBC]
        ldr     r12, [sp, #0xC]
        ldr     r0, [sp, #0xA8]
        str     r11, [sp, #0xDC]
LCZI12:
        subs    r8, r5, #1
        mov     r1, #0
        bmi     LCZI17
        ldr     r6, [pc, #0xA50]
        mov     r2, #0xFF, 10
        orr     r2, r2, #3, 2
        sub     r11, r1, #1, 10
        sub     r10, r2, #2, 2
        add     r9, r12, r8, lsl #2
        add     r7, r4, r8, lsl #2
        str     r5, [sp, #0x10]
        str     r4, [sp, #0xBC]
        str     r12, [sp, #0xC]
        str     r3, [sp, #0xA0]
LCZI13:
        ldr     r4, [r9], #-4
        mov     r1, #0xFF, 10
        orr     r1, r1, #1, 2
        sub     r1, r1, #1, 10
        and     r1, r4, r1
        mov     r1, r1, lsr #23
        cmp     r1, #0xFE
        mvn     r1, #2, 2
        bic     r1, r4, r1
        str     r4, [sp, #0xF8]
        mov     r5, r1, lsr #31
        ble     LCZI63
        mov     r2, #0xFF, 10
        orr     r2, r2, #3, 2
        mvn     r2, r2
        bic     r2, r4, r2
        cmn     r2, #1, 10
        bne     LCZI14
        mov     r0, #0
        str     r11, [r7]
        sub     r4, r0, #1, 10
        str     r11, [sp, #0xF8]
        b       LCZI16
LCZI14:
        cmp     r10, r2
        bne     LCZI15
        mov     r0, #0xFF, 10
        orr     r0, r0, #3, 2
        str     r10, [r7]
        sub     r4, r0, #2, 2
        str     r10, [sp, #0xF8]
        b       LCZI16
LCZI15:
        ldr     r0, [r6, +r5, lsl #3]
        add     r2, r6, r5, lsl #3
        ldr     r1, [r2, #4]
        bl      __truncdfsf2
        str     r0, [r7]
LCZI16:
        subs    r8, r8, #1
        sub     r7, r7, #4
        bpl     LCZI13
        mov     r0, r4
        mov     r1, r5
        ldr     r5, [sp, #0x10]
        ldr     r4, [sp, #0xBC]
        ldr     r12, [sp, #0xC]
        ldr     r3, [sp, #0xA0]
LCZI17:
        subs    r9, r8, #1
        mov     r2, #0
        bmi     LCZI22
        ldr     r10, [pc, #0x964]
        mov     lr, #0xFF, 10
        sub     r2, r2, #1, 10
        orr     lr, lr, #3, 2
        add     r6, r4, r9, lsl #2
        str     r4, [sp, #0xBC]
        sub     r11, lr, #2, 2
        add     r7, r12, r9, lsl #2
        str     r8, [sp, #0x40]
        str     r5, [sp, #0x10]
        str     r1, [sp, #0xAC]
        str     r12, [sp, #0xC]
        str     r0, [sp, #0xA8]
        str     r3, [sp, #0xA0]
        mov     r4, r2
LCZI18:
        ldr     r5, [r7], #-4
        mov     r1, #0xFF, 10
        orr     r1, r1, #1, 2
        sub     r1, r1, #1, 10
        and     r3, r5, r1
        mvn     r1, #2, 2
        mov     r3, r3, lsr #23
        bic     r1, r5, r1
        cmp     r3, #0xFE
        str     r5, [sp, #0xF4]
        mov     r8, r1, lsr #31
        ble     LCZI62
        mov     r0, #0xFF, 10
        orr     r0, r0, #3, 2
        mvn     r0, r0
        bic     r0, r5, r0
        cmn     r0, #1, 10
        bne     LCZI19
        mov     r1, #0
        sub     r5, r1, #1, 10
        str     r4, [sp, #0xF4]
        str     r4, [r6]
        b       LCZI21
LCZI19:
        cmp     r11, r0
        bne     LCZI20
        mov     r1, #0xFF, 10
        orr     r1, r1, #3, 2
        sub     r5, r1, #2, 2
        str     r11, [sp, #0xF4]
        str     r11, [r6]
        b       LCZI21
LCZI20:
        ldr     r0, [r10, +r8, lsl #3]
        add     r1, r10, r8, lsl #3
        ldr     r1, [r1, #4]
        bl      __truncdfsf2
        str     r0, [r6]
LCZI21:
        subs    r9, r9, #1
        sub     r6, r6, #4
        bpl     LCZI18
        str     r5, [sp, #0xE0]
        mov     r2, r8
        ldr     r8, [sp, #0x40]
        ldr     r5, [sp, #0x10]
        ldr     r1, [sp, #0xAC]
        ldr     r4, [sp, #0xBC]
        ldr     r12, [sp, #0xC]
        ldr     r0, [sp, #0xA8]
        ldr     r3, [sp, #0xA0]
LCZI22:
        subs    lr, r9, #1
        bmi     LCZI25
        mov     r6, #0xFF, 10
        str     r5, [sp, #0x10]
        ldr     r5, [pc, #0x858]
        mov     r7, #0
        orr     r6, r6, #3, 2
        add     r10, r4, lr, lsl #2
        str     r4, [sp, #0xBC]
        sub     r7, r7, #1, 10
        sub     r6, r6, #2, 2
        add     r11, r12, lr, lsl #2
        str     r2, [sp, #0xB0]
        str     r1, [sp, #0xAC]
        str     r12, [sp, #0xC]
        str     r0, [sp, #0xA8]
        str     r3, [sp, #0xA0]
        mov     r4, lr
LCZI23:
        ldr     r1, [r11], #-4
        mov     r3, #0xFF, 10
        orr     r3, r3, #1, 2
        sub     r3, r3, #1, 10
        mov     r0, r1
        and     r3, r0, r3
        mvn     r12, #2, 2
        mov     r3, r3, lsr #23
        bic     r12, r0, r12
        cmp     r3, #0xFE
        str     r1, [sp, #0xF0]
        mov     r2, r12, lsr #31
        ble     LCZI27
        mov     r1, #0xFF, 10
        orr     r1, r1, #3, 2
        mvn     r1, r1
        bic     r1, r0, r1
        cmn     r1, #1, 10
        streq   r7, [r10]
        streq   r7, [sp, #0xF0]
        beq     LCZI24
        cmp     r6, r1
        streq   r6, [r10]
        streq   r6, [sp, #0xF0]
        beq     LCZI24
        ldr     r0, [r5, +r2, lsl #3]
        add     r2, r5, r2, lsl #3
        ldr     r1, [r2, #4]
        bl      __truncdfsf2
        str     r0, [r10]
LCZI24:
        subs    r4, r4, #1
        sub     r10, r10, #4
        bpl     LCZI23
        ldr     r5, [sp, #0x10]
        ldr     r4, [sp, #0xBC]
LCZI25:
        cmp     r5, #0
        blt     LCZI6
        ldr     r0, [sp, #0xFC]
        bl      __extendsfdf2
        bl      atan
        bl      __truncdfsf2
        cmp     r8, #0
        str     r0, [r4, +r5, lsl #2]
        blt     LCZI6
        ldr     r0, [sp, #0xF8]
        bl      __extendsfdf2
        bl      atan
        bl      __truncdfsf2
        cmp     r9, #0
        str     r0, [r4, +r8, lsl #2]
        blt     LCZI6
        ldr     r0, [sp, #0xF4]
        bl      __extendsfdf2
        bl      atan
        bl      __truncdfsf2
        str     r0, [r4, +r9, lsl #2]
        mov     r0, #0
        add     sp, sp, #1, 24
        ldmia   sp!, {r4 - r11, pc}
LCZI26:
        mvn     r0, #5
        add     sp, sp, #1, 24
        ldmia   sp!, {r4 - r11, pc}
LCZI27:
        ldr     r7, [sp, #0xFC]
        ldr     r5, [sp, #0x10]
        ldr     r12, [sp, #0xC]
        str     r7, [sp, #0xD8]
        ldr     r7, [sp, #0xF4]
        ldr     r11, [sp, #0xF8]
        str     r2, [sp, #0xE4]
        ldr     r2, [sp, #0xB0]
        str     r7, [sp, #0xD4]
        str     r0, [sp, #0xE8]
        ldr     r0, [sp, #0xA8]
        str     r1, [sp, #0xEC]
        ldr     r1, [sp, #0xAC]
        mov     r6, r3
        ldr     r3, [sp, #0xA0]
        mov     r7, #0xFF, 10
        mov     lr, r4
        ldr     r4, [sp, #0xBC]
        mov     r10, #0
        orr     r7, r7, #3, 2
        sub     r10, r10, #1, 10
        sub     r7, r7, #2, 2
        str     r7, [sp, #0xB4]
        str     r10, [sp, #0xB8]
        str     r11, [sp, #0xA4]
        str     r9, [sp, #0x3C]
        str     r8, [sp, #0x40]
        str     r5, [sp, #0x10]
        str     lr, [sp, #8]
        str     r2, [sp, #0xB0]
        str     r1, [sp, #0xAC]
        str     r12, [sp, #0xC]
        str     r0, [sp, #0xA8]
        str     r3, [sp, #0xA0]
LCZI28:
        ldr     r0, [sp, #0xD8]
        bl      __extendsfdf2
        ldr     r12, [sp, #0xDC]
        mov     r2, #0xFF, 10
        orr     r2, r2, #1, 2
        sub     r2, r2, #1, 10
        and     r2, r12, r2
        mov     r2, r2, lsr #23
        cmp     r2, #0x7F
        str     r0, [sp, #0x20]
        str     r1, [sp, #0x1C]
        movlt   r0, #0
        strlt   r0, [sp, #0x80]
        blt     LCZI29
        ldr     r2, [sp, #0x20]
        ldr     r3, [sp, #0x1C]
        mov     r0, #0xFF, 12
        orr     r1, r0, #3, 4
        mov     r0, #0
        bl      __divdf3
        str     r0, [sp, #0x20]
        mov     r0, #1
        str     r1, [sp, #0x1C]
        str     r0, [sp, #0x80]
LCZI29:
        ldr     r0, [sp, #0xA4]
        bl      __extendsfdf2
        ldr     r12, [sp, #0xA8]
        mov     r2, #0xFF, 10
        orr     r2, r2, #1, 2
        sub     r2, r2, #1, 10
        and     r2, r12, r2
        mov     r2, r2, lsr #23
        cmp     r2, #0x7F
        str     r0, [sp, #0x24]
        str     r1, [sp, #0x28]
        movlt   r0, #0
        strlt   r0, [sp, #0x84]
        blt     LCZI30
        ldr     r2, [sp, #0x24]
        ldr     r3, [sp, #0x28]
        mov     r0, #0xFF, 12
        orr     r1, r0, #3, 4
        mov     r0, #0
        bl      __divdf3
        str     r0, [sp, #0x24]
        mov     r0, #1
        str     r1, [sp, #0x28]
        str     r0, [sp, #0x84]
LCZI30:
        ldr     r0, [sp, #0xD4]
        bl      __extendsfdf2
        ldr     r12, [sp, #0xE0]
        mov     r2, #0xFF, 10
        orr     r2, r2, #1, 2
        sub     r2, r2, #1, 10
        and     r2, r12, r2
        mov     r2, r2, lsr #23
        cmp     r2, #0x7F
        str     r0, [sp, #0x2C]
        str     r1, [sp, #0x30]
        movlt   r0, #0
        strlt   r0, [sp, #0x88]
        blt     LCZI31
        ldr     r2, [sp, #0x2C]
        ldr     r3, [sp, #0x30]
        mov     r0, #0xFF, 12
        orr     r1, r0, #3, 4
        mov     r0, #0
        bl      __divdf3
        str     r0, [sp, #0x2C]
        mov     r0, #1
        str     r1, [sp, #0x30]
        str     r0, [sp, #0x88]
LCZI31:
        ldr     r0, [sp, #0xEC]
        bl      __extendsfdf2
        cmp     r6, #0x7F
        str     r0, [sp, #0x38]
        str     r1, [sp, #0x34]
        movlt   r0, #0
        strlt   r0, [sp, #0x8C]
        blt     LCZI32
        ldr     r2, [sp, #0x38]
        ldr     r3, [sp, #0x34]
        mov     r0, #0xFF, 12
        orr     r1, r0, #3, 4
        mov     r0, #0
        bl      __divdf3
        str     r0, [sp, #0x38]
        mov     r0, #1
        str     r1, [sp, #0x34]
        str     r0, [sp, #0x8C]
LCZI32:
        ldr     r2, [sp, #0x20]
        ldr     r3, [sp, #0x1C]
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        ldr     r2, [sp, #0x24]
        ldr     r3, [sp, #0x28]
        mov     r7, r0
        mov     r10, r1
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        mov     r8, r0
        ldr     r0, [sp, #0x2C]
        mov     r9, r1
        ldr     r1, [sp, #0x30]
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        ldr     r2, [sp, #0x38]
        ldr     r3, [sp, #0x34]
        str     r0, [sp, #0xD0]
        str     r1, [sp, #0xCC]
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        ldr     r11, [pc, #0x4D0]
        mov     r3, r10
        ldr     r12, [r11, #0x10]
        mov     r2, r7
        str     r12, [sp, #0xC8]
        ldr     r12, [r11, #0x14]
        str     r12, [sp, #0xC4]
        ldr     r12, [r11, #0x20]
        ldr     r5, [r11, #0x28]
        ldr     r6, [r11, #0x2C]
        str     r12, [sp, #0xC0]
        ldr     r12, [r11, #0x24]
        str     r12, [sp, #0x9C]
        ldr     r12, [r11, #0x18]
        str     r12, [sp, #0x98]
        ldr     r12, [r11, #0x1C]
        str     r0, [sp, #0x90]
        str     r1, [sp, #0x5C]
        ldr     r0, [sp, #0xC8]
        ldr     r1, [sp, #0xC4]
        str     r12, [sp, #0x94]
        bl      __muldf3
        ldr     r2, [sp, #0x98]
        ldr     r3, [sp, #0x94]
        bl      __adddf3
        mov     r3, r10
        mov     r2, r7
        bl      __muldf3
        ldr     r3, [sp, #0x9C]
        ldr     r2, [sp, #0xC0]
        bl      __adddf3
        mov     r3, r10
        mov     r2, r7
        bl      __muldf3
        mov     r2, r5
        mov     r3, r6
        bl      __adddf3
        ldr     r2, [sp, #0x20]
        ldr     r3, [sp, #0x1C]
        bl      __muldf3
        str     r1, [sp, #0x7C]
        ldr     r1, [sp, #0xC4]
        str     r0, [sp, #0x78]
        ldr     r0, [sp, #0xC8]
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #0x98]
        ldr     r3, [sp, #0x94]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        ldr     r3, [sp, #0x9C]
        ldr     r2, [sp, #0xC0]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        mov     r2, r5
        mov     r3, r6
        bl      __adddf3
        ldr     r2, [sp, #0x24]
        ldr     r3, [sp, #0x28]
        bl      __muldf3
        ldr     r2, [sp, #0xD0]
        ldr     r3, [sp, #0xCC]
        str     r1, [sp, #0x70]
        ldr     r1, [sp, #0xC4]
        str     r0, [sp, #0x74]
        ldr     r0, [sp, #0xC8]
        bl      __muldf3
        ldr     r2, [sp, #0x98]
        ldr     r3, [sp, #0x94]
        bl      __adddf3
        ldr     r2, [sp, #0xD0]
        ldr     r3, [sp, #0xCC]
        bl      __muldf3
        ldr     r2, [sp, #0xC0]
        ldr     r3, [sp, #0x9C]
        bl      __adddf3
        ldr     r2, [sp, #0xD0]
        ldr     r3, [sp, #0xCC]
        bl      __muldf3
        mov     r2, r5
        mov     r3, r6
        bl      __adddf3
        ldr     r2, [sp, #0x2C]
        ldr     r3, [sp, #0x30]
        bl      __muldf3
        ldr     r2, [sp, #0x90]
        ldr     r3, [sp, #0x5C]
        str     r0, [sp, #0x6C]
        str     r1, [sp, #0x68]
        ldr     r0, [sp, #0xC8]
        ldr     r1, [sp, #0xC4]
        bl      __muldf3
        ldr     r3, [sp, #0x94]
        ldr     r2, [sp, #0x98]
        bl      __adddf3
        ldr     r2, [sp, #0x90]
        ldr     r3, [sp, #0x5C]
        bl      __muldf3
        ldr     r3, [sp, #0x9C]
        ldr     r2, [sp, #0xC0]
        bl      __adddf3
        ldr     r2, [sp, #0x90]
        ldr     r3, [sp, #0x5C]
        bl      __muldf3
        mov     r2, r5
        mov     r3, r6
        bl      __adddf3
        ldr     r2, [sp, #0x38]
        ldr     r3, [sp, #0x34]
        bl      __muldf3
        ldr     r12, [r11, #0x40]
        mov     r2, r7
        str     r12, [sp, #0xC8]
        ldr     r12, [r11, #0x44]
        mov     r3, r10
        str     r12, [sp, #0xC4]
        ldr     r12, [r11, #0x30]
        str     r12, [sp, #0xC0]
        ldr     r12, [r11, #0x34]
        str     r12, [sp, #0x9C]
        ldr     r5, [r11, #0x48]
        ldr     r6, [r11, #0x4C]
        ldr     r12, [r11, #0x38]
        str     r12, [sp, #0x98]
        ldr     r11, [r11, #0x3C]
        str     r1, [sp, #0x64]
        str     r0, [sp, #0x60]
        ldr     r1, [sp, #0x9C]
        ldr     r0, [sp, #0xC0]
        str     r11, [sp, #0x94]
        bl      __muldf3
        ldr     r2, [sp, #0x98]
        ldr     r3, [sp, #0x94]
        bl      __adddf3
        mov     r3, r10
        mov     r2, r7
        bl      __muldf3
        ldr     r2, [sp, #0xC8]
        ldr     r3, [sp, #0xC4]
        bl      __adddf3
        mov     r2, r7
        mov     r3, r10
        bl      __muldf3
        mov     r2, r5
        mov     r3, r6
        bl      __adddf3
        str     r0, [sp, #0x44]
        ldr     r0, [sp, #0xC0]
        str     r1, [sp, #0x48]
        ldr     r1, [sp, #0x9C]
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        ldr     r3, [sp, #0x94]
        ldr     r2, [sp, #0x98]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #0xC8]
        ldr     r3, [sp, #0xC4]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        mov     r2, r5
        mov     r3, r6
        bl      __adddf3
        ldr     r2, [sp, #0xD0]
        ldr     r3, [sp, #0xCC]
        mov     r7, r0
        ldr     r0, [sp, #0xC0]
        str     r7, [sp, #0x14]
        mov     r10, r1
        ldr     r1, [sp, #0x9C]
        str     r10, [sp, #0x18]
        bl      __muldf3
        ldr     r3, [sp, #0x94]
        ldr     r2, [sp, #0x98]
        bl      __adddf3
        ldr     r2, [sp, #0xD0]
        ldr     r3, [sp, #0xCC]
        bl      __muldf3
        ldr     r2, [sp, #0xC8]
        ldr     r3, [sp, #0xC4]
        bl      __adddf3
        ldr     r2, [sp, #0xD0]
        ldr     r3, [sp, #0xCC]
        bl      __muldf3
        mov     r2, r5
        mov     r3, r6
        bl      __adddf3
        mov     r8, r0
        mov     r9, r1
        ldr     r2, [sp, #0x90]
        ldr     r3, [sp, #0x5C]
        ldr     r0, [sp, #0xC0]
        ldr     r1, [sp, #0x9C]
        str     r8, [sp]
        str     r9, [sp, #4]
        bl      __muldf3
        ldr     r2, [sp, #0x98]
        ldr     r3, [sp, #0x94]
        bl      __adddf3
        ldr     r2, [sp, #0x90]
        ldr     r3, [sp, #0x5C]
        bl      __muldf3
        ldr     r2, [sp, #0xC8]
        ldr     r3, [sp, #0xC4]
        bl      __adddf3
        ldr     r2, [sp, #0x90]
        ldr     r3, [sp, #0x5C]
        bl      __muldf3
        mov     r2, r5
        mov     r3, r6
        bl      __adddf3
        mov     r6, r0
        ldr     r0, [sp, #0x44]
        mov     r5, r1
        ldr     r1, [sp, #0x48]
        mov     r2, r7
        mov     r3, r10
        bl      __muldf3
        str     r1, [sp, #0x4C]
        mov     r7, r0
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        mov     r2, r6
        mov     r3, r5
        bl      __muldf3
        mov     r3, r1
        mov     r12, #0xFF, 12
        mov     r2, r0
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __divdf3
        ldr     r8, [sp, #0xA0]
        ldr     r12, [sp, #0x10]
        mov     r11, r0
        str     r8, [sp, #0x90]
        ldr     r8, [sp, #0xAC]
        str     r12, [sp, #0x5C]
        ldr     r12, [sp, #8]
        str     r8, [sp, #0x94]
        ldr     r8, [sp, #0xB0]
        subs    lr, r12, #1
        str     lr, [sp, #0x10]
        str     r8, [sp, #0x98]
        ldr     r8, [sp, #0xE4]
        mov     r10, r1
        str     r8, [sp, #0x9C]
        ldr     r8, [sp, #0x40]
        str     r12, [sp, #0x50]
        str     r8, [sp, #0x58]
        ldr     r8, [sp, #0x3C]
        str     r8, [sp, #0x54]
        bmi     LCZI37
        ldr     r12, [sp, #0x10]
        ldr     lr, [sp, #0xC]
        str     r10, [sp, #0xD0]
        str     r5, [sp, #0xC4]
        str     r6, [sp, #0xC0]
        ldr     r5, [sp, #0xB4]
        ldr     r6, [sp, #0xB8]
        ldr     r10, [sp, #0x10]
        add     r9, lr, r12, lsl #2
        add     r8, r4, r12, lsl #2
        str     r11, [sp, #0xCC]
        str     r7, [sp, #0xC8]
        str     r4, [sp, #0xBC]
LCZI33:
        ldr     r7, [r9], #-4
        mov     r1, #0xFF, 10
        orr     r1, r1, #1, 2
        sub     r1, r1, #1, 10
        mov     r4, r7
        and     r1, r4, r1
        mvn     r2, #2, 2
        mov     r1, r1, lsr #23
        bic     r2, r4, r2
        cmp     r1, #0xFE
        str     r7, [sp, #0xFC]
        mov     r11, r2, lsr #31
        ble     LCZI60
        mov     r0, #0xFF, 10
        orr     r0, r0, #3, 2
        mvn     r0, r0
        bic     r0, r4, r0
        cmn     r0, #1, 10
        bne     LCZI34
        mov     r1, #0
        sub     r4, r1, #1, 10
        mov     r7, r4
        str     r6, [sp, #0xFC]
        str     r7, [r8]
        b       LCZI36
LCZI34:
        cmp     r5, r0
        bne     LCZI35
        mov     r1, #0xFF, 10
        orr     r1, r1, #3, 2
        sub     r4, r1, #2, 2
        mov     r7, r4
        str     r5, [sp, #0xFC]
        str     r7, [r8]
        b       LCZI36
        .long   LCZI_pi_2d
LCZI35:
        ldr     r1, [pc, #-0xC]
        ldr     r0, [r1, +r11, lsl #3]
        add     r1, r1, r11, lsl #3
        ldr     r1, [r1, #4]
        bl      __truncdfsf2
        str     r0, [r8]
LCZI36:
        subs    r10, r10, #1
        sub     r8, r8, #4
        bpl     LCZI33
        str     r7, [sp, #0xD8]
        str     r10, [sp, #0x10]
        str     r4, [sp, #0xDC]
        str     r11, [sp, #0xA0]
        ldr     r10, [sp, #0xD0]
        ldr     r11, [sp, #0xCC]
        ldr     r7, [sp, #0xC8]
        ldr     r5, [sp, #0xC4]
        ldr     r6, [sp, #0xC0]
        ldr     r4, [sp, #0xBC]
LCZI37:
        ldr     r12, [sp, #0x10]
        subs    r12, r12, #1
        str     r12, [sp, #0x40]
        bmi     LCZI42
        ldr     r12, [sp, #0x40]
        ldr     lr, [sp, #0xC]
        str     r10, [sp, #0xD0]
        str     r5, [sp, #0xC4]
        str     r6, [sp, #0xC0]
        ldr     r5, [sp, #0xB4]
        ldr     r6, [sp, #0xB8]
        ldr     r10, [sp, #0x40]
        add     r9, lr, r12, lsl #2
        add     r8, r4, r12, lsl #2
        str     r11, [sp, #0xCC]
        str     r7, [sp, #0xC8]
        str     r4, [sp, #0xBC]
LCZI38:
        ldr     r7, [r9], #-4
        mov     r1, #0xFF, 10
        orr     r1, r1, #1, 2
        sub     r1, r1, #1, 10
        mov     r4, r7
        and     r1, r4, r1
        mvn     r2, #2, 2
        mov     r1, r1, lsr #23
        bic     r2, r4, r2
        cmp     r1, #0xFE
        str     r7, [sp, #0xF8]
        mov     r11, r2, lsr #31
        ble     LCZI59
        mov     r0, #0xFF, 10
        orr     r0, r0, #3, 2
        mvn     r0, r0
        bic     r0, r4, r0
        cmn     r0, #1, 10
        bne     LCZI39
        mov     r1, #0
        sub     r4, r1, #1, 10
        mov     r7, r4
        str     r6, [sp, #0xF8]
        str     r7, [r8]
        b       LCZI41
LCZI39:
        cmp     r5, r0
        bne     LCZI40
        mov     r1, #0xFF, 10
        orr     r1, r1, #3, 2
        sub     r4, r1, #2, 2
        mov     r7, r4
        str     r5, [sp, #0xF8]
        str     r7, [r8]
        b       LCZI41
LCZI40:
        ldr     r1, [pc, #-0x124]
        ldr     r0, [r1, +r11, lsl #3]
        add     r1, r1, r11, lsl #3
        ldr     r1, [r1, #4]
        bl      __truncdfsf2
        str     r0, [r8]
LCZI41:
        subs    r10, r10, #1
        sub     r8, r8, #4
        bpl     LCZI38
        str     r7, [sp, #0xA4]
        str     r10, [sp, #0x40]
        str     r11, [sp, #0xAC]
        str     r4, [sp, #0xA8]
        ldr     r10, [sp, #0xD0]
        ldr     r11, [sp, #0xCC]
        ldr     r7, [sp, #0xC8]
        ldr     r5, [sp, #0xC4]
        ldr     r6, [sp, #0xC0]
        ldr     r4, [sp, #0xBC]
LCZI42:
        ldr     r12, [sp, #0x40]
        subs    r12, r12, #1
        str     r12, [sp, #0x3C]
        bmi     LCZI47
        ldr     r12, [sp, #0x3C]
        ldr     lr, [sp, #0xC]
        str     r10, [sp, #0xD0]
        str     r5, [sp, #0xC4]
        str     r6, [sp, #0xC0]
        ldr     r5, [sp, #0xB4]
        ldr     r6, [sp, #0xB8]
        ldr     r10, [sp, #0x3C]
        add     r9, lr, r12, lsl #2
        add     r8, r4, r12, lsl #2
        str     r11, [sp, #0xCC]
        str     r7, [sp, #0xC8]
        str     r4, [sp, #0xBC]
LCZI43:
        ldr     r7, [r9], #-4
        mov     r1, #0xFF, 10
        orr     r1, r1, #1, 2
        sub     r1, r1, #1, 10
        mov     r4, r7
        and     r1, r4, r1
        mvn     r2, #2, 2
        mov     r1, r1, lsr #23
        bic     r2, r4, r2
        cmp     r1, #0xFE
        str     r7, [sp, #0xF4]
        mov     r11, r2, lsr #31
        ble     LCZI58
        mov     r0, #0xFF, 10
        orr     r0, r0, #3, 2
        mvn     r0, r0
        bic     r0, r4, r0
        cmn     r0, #1, 10
        bne     LCZI44
        mov     r1, #0
        sub     r4, r1, #1, 10
        mov     r7, r4
        str     r6, [sp, #0xF4]
        str     r7, [r8]
        b       LCZI46
LCZI44:
        cmp     r5, r0
        bne     LCZI45
        mov     r1, #0xFF, 10
        orr     r1, r1, #3, 2
        sub     r4, r1, #2, 2
        mov     r7, r4
        str     r5, [sp, #0xF4]
        str     r7, [r8]
        b       LCZI46
LCZI45:
        ldr     r1, [pc, #-0x23C]
        ldr     r0, [r1, +r11, lsl #3]
        add     r1, r1, r11, lsl #3
        ldr     r1, [r1, #4]
        bl      __truncdfsf2
        str     r0, [r8]
LCZI46:
        subs    r10, r10, #1
        sub     r8, r8, #4
        bpl     LCZI43
        str     r7, [sp, #0xD4]
        str     r10, [sp, #0x3C]
        str     r11, [sp, #0xB0]
        str     r4, [sp, #0xE0]
        ldr     r10, [sp, #0xD0]
        ldr     r11, [sp, #0xCC]
        ldr     r7, [sp, #0xC8]
        ldr     r5, [sp, #0xC4]
        ldr     r6, [sp, #0xC0]
        ldr     r4, [sp, #0xBC]
LCZI47:
        ldr     r12, [sp, #0x3C]
        subs    r12, r12, #1
        str     r12, [sp, #8]
        bmi     LCZI52
        ldr     r12, [sp, #8]
        ldr     lr, [sp, #0xC]
        str     r10, [sp, #0xD0]
        str     r7, [sp, #0xC8]
        str     r6, [sp, #0xC0]
        ldr     r6, [sp, #0xB4]
        ldr     r7, [sp, #0xB8]
        ldr     r10, [sp, #8]
        add     r9, lr, r12, lsl #2
        add     r8, r4, r12, lsl #2
        str     r11, [sp, #0xCC]
        str     r5, [sp, #0xC4]
        str     r4, [sp, #0xBC]
LCZI48:
        ldr     r4, [r9], #-4
        mov     r1, #0xFF, 10
        orr     r1, r1, #1, 2
        sub     r1, r1, #1, 10
        mov     r5, r4
        and     r1, r5, r1
        mvn     r2, #2, 2
        mov     r1, r1, lsr #23
        bic     r2, r5, r2
        cmp     r1, #0xFE
        str     r4, [sp, #0xF0]
        mov     r11, r2, lsr #31
        ble     LCZI61
        mov     r0, #0xFF, 10
        orr     r0, r0, #3, 2
        mvn     r0, r0
        bic     r0, r5, r0
        cmn     r0, #1, 10
        bne     LCZI49
        mov     r2, #0xFF, 10
        mov     r1, #0
        orr     r4, r2, #3, 2
        sub     r5, r1, #1, 10
        str     r7, [sp, #0xF0]
        str     r4, [r8]
        b       LCZI51
LCZI49:
        cmp     r6, r0
        bne     LCZI50
        mov     r2, #0xFF, 10
        orr     r1, r2, #3, 2
        orr     r4, r2, #1, 2
        sub     r5, r1, #2, 2
        str     r6, [sp, #0xF0]
        str     r4, [r8]
        b       LCZI51
LCZI50:
        ldr     r1, [pc, #-0x358]
        ldr     r0, [r1, +r11, lsl #3]
        add     r1, r1, r11, lsl #3
        ldr     r1, [r1, #4]
        bl      __truncdfsf2
        str     r0, [r8]
LCZI51:
        subs    r10, r10, #1
        sub     r8, r8, #4
        bpl     LCZI48
        str     r11, [sp, #0xE4]
        str     r5, [sp, #0xE8]
        str     r4, [sp, #0xEC]
        str     r10, [sp, #8]
        ldr     r10, [sp, #0xD0]
        ldr     r11, [sp, #0xCC]
        ldr     r7, [sp, #0xC8]
        ldr     r5, [sp, #0xC4]
        ldr     r6, [sp, #0xC0]
        ldr     r4, [sp, #0xBC]
LCZI52:
        ldr     r0, [sp]
        ldr     r1, [sp, #4]
        mov     r3, r5
        mov     r2, r6
        bl      __muldf3
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldr     r3, [sp, #0x4C]
        mov     r8, r0
        mov     r9, r1
        mov     r2, r7
        mov     r0, r11
        mov     r1, r10
        bl      __muldf3
        ldr     r2, [sp, #0x14]
        ldr     r3, [sp, #0x18]
        mov     r10, r1
        mov     r7, r0
        mov     r0, r8
        mov     r1, r9
        bl      __muldf3
        ldr     r2, [sp, #0x78]
        ldr     r3, [sp, #0x7C]
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x20]
        mov     r3, r1
        ldr     r1, [sp, #0x1C]
        bl      __subdf3
        bl      __truncdfsf2
        ldr     r2, [sp, #0x44]
        ldr     r3, [sp, #0x48]
        mov     r11, r0
        mov     r1, r9
        mov     r0, r8
        bl      __muldf3
        ldr     r2, [sp, #0x74]
        ldr     r3, [sp, #0x70]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [sp, #0x24]
        ldr     r1, [sp, #0x28]
        bl      __subdf3
        bl      __truncdfsf2
        mov     r8, r0
        mov     r3, r5
        mov     r2, r6
        mov     r0, r7
        mov     r1, r10
        bl      __muldf3
        ldr     r2, [sp, #0x6C]
        ldr     r3, [sp, #0x68]
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x2C]
        mov     r3, r1
        ldr     r1, [sp, #0x30]
        bl      __subdf3
        bl      __truncdfsf2
        ldr     r2, [sp]
        ldr     r3, [sp, #4]
        mov     r5, r0
        mov     r0, r7
        mov     r1, r10
        bl      __muldf3
        ldr     r2, [sp, #0x60]
        ldr     r3, [sp, #0x64]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [sp, #0x38]
        ldr     r1, [sp, #0x34]
        bl      __subdf3
        bl      __truncdfsf2
        ldr     r2, [sp, #0x80]
        mov     r6, r0
        cmp     r2, #0
        beq     LCZI53
        ldr     r2, [sp, #0x90]
        ldr     r3, [pc, #-0x4E8]
        mov     r0, r11
        ldr     r9, [r3, +r2, lsl #3]
        add     r2, r3, r2, lsl #3
        ldr     r7, [r2, #4]
        bl      __extendsfdf2
        mov     r2, r0
        mov     r3, r1
        mov     r0, r9
        mov     r1, r7
        bl      __subdf3
        bl      __truncdfsf2
        mov     r11, r0
LCZI53:
        ldr     r2, [sp, #0x84]
        cmp     r2, #0
        beq     LCZI54
        ldr     r2, [sp, #0x94]
        ldr     r3, [pc, #-0x52C]
        mov     r0, r8
        ldr     r9, [r3, +r2, lsl #3]
        add     r2, r3, r2, lsl #3
        ldr     r7, [r2, #4]
        bl      __extendsfdf2
        mov     r2, r0
        mov     r3, r1
        mov     r0, r9
        mov     r1, r7
        bl      __subdf3
        bl      __truncdfsf2
        mov     r8, r0
LCZI54:
        ldr     r2, [sp, #0x88]
        cmp     r2, #0
        beq     LCZI55
        ldr     r2, [sp, #0x98]
        ldr     r3, [pc, #-0x570]
        mov     r0, r5
        ldr     r9, [r3, +r2, lsl #3]
        add     r2, r3, r2, lsl #3
        ldr     r7, [r2, #4]
        bl      __extendsfdf2
        mov     r2, r0
        mov     r3, r1
        mov     r0, r9
        mov     r1, r7
        bl      __subdf3
        bl      __truncdfsf2
        mov     r5, r0
LCZI55:
        ldr     r2, [sp, #0x8C]
        cmp     r2, #0
        beq     LCZI56
        ldr     r2, [sp, #0x9C]
        ldr     r3, [pc, #-0x5B4]
        mov     r0, r6
        ldr     r9, [r3, +r2, lsl #3]
        add     r2, r3, r2, lsl #3
        ldr     r7, [r2, #4]
        bl      __extendsfdf2
        mov     r2, r0
        mov     r3, r1
        mov     r0, r9
        mov     r1, r7
        bl      __subdf3
        bl      __truncdfsf2
        mov     r6, r0
LCZI56:
        ldr     r2, [sp, #0x5C]
        str     r11, [r4, +r2, lsl #2]
        ldr     r2, [sp, #0x58]
        str     r8, [r4, +r2, lsl #2]
        ldr     r2, [sp, #0x54]
        str     r5, [r4, +r2, lsl #2]
        ldr     r2, [sp, #8]
        cmp     r2, #0
        ldr     r2, [sp, #0x50]
        str     r6, [r4, +r2, lsl #2]
        blt     LCZI57
        mov     r0, #0
        ldr     r2, [sp, #0xE8]
        sub     r0, r0, #1, 10
        sub     r0, r0, #2, 2
        sub     r0, r0, #1, 10
        and     r0, r2, r0
        mov     r6, r0, lsr #23
        b       LCZI28
LCZI57:
        ldr     r9, [sp, #0x3C]
        ldr     r8, [sp, #0x40]
        ldr     r5, [sp, #0x10]
        b       LCZI25
LCZI58:
        str     r7, [sp, #0xD4]
        str     r10, [sp, #0x3C]
        str     r11, [sp, #0xB0]
        str     r4, [sp, #0xE0]
        ldr     r10, [sp, #0xD0]
        ldr     r11, [sp, #0xCC]
        ldr     r7, [sp, #0xC8]
        ldr     r5, [sp, #0xC4]
        ldr     r6, [sp, #0xC0]
        ldr     r4, [sp, #0xBC]
        b       LCZI47
LCZI59:
        str     r7, [sp, #0xA4]
        str     r10, [sp, #0x40]
        str     r11, [sp, #0xAC]
        str     r4, [sp, #0xA8]
        ldr     r10, [sp, #0xD0]
        ldr     r11, [sp, #0xCC]
        ldr     r7, [sp, #0xC8]
        ldr     r5, [sp, #0xC4]
        ldr     r6, [sp, #0xC0]
        ldr     r4, [sp, #0xBC]
        b       LCZI42
LCZI60:
        str     r7, [sp, #0xD8]
        str     r10, [sp, #0x10]
        str     r4, [sp, #0xDC]
        str     r11, [sp, #0xA0]
        ldr     r10, [sp, #0xD0]
        ldr     r11, [sp, #0xCC]
        ldr     r7, [sp, #0xC8]
        ldr     r5, [sp, #0xC4]
        ldr     r6, [sp, #0xC0]
        ldr     r4, [sp, #0xBC]
        b       LCZI37
LCZI61:
        str     r11, [sp, #0xE4]
        str     r5, [sp, #0xE8]
        str     r4, [sp, #0xEC]
        str     r10, [sp, #8]
        ldr     r10, [sp, #0xD0]
        ldr     r11, [sp, #0xCC]
        ldr     r7, [sp, #0xC8]
        ldr     r5, [sp, #0xC4]
        ldr     r6, [sp, #0xC0]
        ldr     r4, [sp, #0xBC]
        b       LCZI52
LCZI62:
        str     r5, [sp, #0xE0]
        mov     r2, r8
        ldr     r8, [sp, #0x40]
        ldr     r5, [sp, #0x10]
        ldr     r1, [sp, #0xAC]
        ldr     r4, [sp, #0xBC]
        ldr     r12, [sp, #0xC]
        ldr     r0, [sp, #0xA8]
        ldr     r3, [sp, #0xA0]
        b       LCZI22
LCZI63:
        mov     r0, r4
        mov     r1, r5
        ldr     r5, [sp, #0x10]
        ldr     r4, [sp, #0xBC]
        ldr     r12, [sp, #0xC]
        ldr     r3, [sp, #0xA0]
        b       LCZI17
LCZI64:
        mov     r3, r4
        ldr     r4, [sp, #0xBC]
        ldr     r12, [sp, #0xC]
        ldr     r0, [sp, #0xA8]
        str     r11, [sp, #0xDC]
        b       LCZI12
LCZI65:
        mvn     r0, #7
        add     sp, sp, #1, 24
        ldmia   sp!, {r4 - r11, pc}


        .data
        .align  4


LCZI_pi_2d:
        .byte   0x18,0x2D,0x44,0x54,0xFB,0x21,0xF9,0x3F,0x18,0x2D,0x44,0x54,0xFB,0x21,0xF9,0xBF
LCZI_P:
        .byte   0xCC,0x92,0x86,0x60,0xB7,0x79,0x95,0x3F,0xFE,0xC7,0xD8,0xD6,0x06,0xA4,0xC2,0x3F
        .byte   0x0C,0xD5,0x15,0x3C,0x8F,0xAB,0xC5,0x3F,0x4B,0x54,0x84,0x24,0x20,0x23,0x13,0x3E
LCZI_Q:
        .byte   0x32,0x43,0x42,0x86,0x66,0x0F,0x9A,0x3F,0x40,0xFC,0xF6,0x8E,0xA1,0x93,0xD2,0x3F
        .byte   0x1E,0x22,0xA0,0x11,0x62,0xBB,0xE7,0x3F,0x34,0x02,0xE5,0xF6,0xAB,0x40,0xE0,0x3F


