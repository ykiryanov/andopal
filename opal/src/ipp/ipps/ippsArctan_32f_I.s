        .text
        .align  4
        .globl  _ippsArctan_32f_I


_ippsArctan_32f_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xFC
        mov     r4, r0
        mov     r2, #0
        mov     r0, r2
        mov     r3, r0
        cmp     r4, #0
        mov     r5, r1
        mov     lr, r3
        beq     LCZH65
        cmp     r5, #1
        blt     LCZH26
        ldr     r6, [pc, #0xF0C]
        mov     r12, #0xFF, 10
        cmp     r5, #4
        orr     r10, r12, #3, 2
        orr     r7, r12, #1, 2
        mvn     r8, #2, 2
        bge     LCZH7
        cmp     r5, #0
        ble     LCZH6
        str     r2, [sp, #0xF8]
        sub     r3, r2, #1, 10
        sub     r2, r10, #2, 2
        str     r2, [sp, #0xC]
        str     r3, [sp, #0x10]
        str     r8, [sp, #4]
        str     r7, [sp]
        str     r10, [sp, #8]
LCZH0:
        ldr     r2, [sp]
        ldr     r9, [r4]
        sub     r2, r2, #1, 10
        str     r9, [sp, #0xF8]
        ldr     r3, [sp, #4]
        and     r2, r9, r2
        mov     r2, r2, lsr #23
        bic     r3, r9, r3
        cmp     r2, #0xFE
        mov     r11, r3, lsr #31
        ble     LCZH3
        ldr     r2, [sp, #8]
        mvn     r2, r2
        bic     r2, r9, r2
        cmn     r2, #1, 10
        bne     LCZH1
        ldr     r3, [sp, #0x10]
        str     r3, [r4]
        str     r3, [sp, #0xF8]
        b       LCZH5
LCZH1:
        ldr     r3, [sp, #0xC]
        cmp     r3, r2
        bne     LCZH2
        ldr     r3, [sp, #0xC]
        str     r3, [r4]
        str     r3, [sp, #0xF8]
        b       LCZH5
LCZH2:
        ldr     r0, [r6, +r11, lsl #3]
        add     r11, r6, r11, lsl #3
        ldr     r1, [r11, #4]
        bl      __truncdfsf2
        str     r0, [r4]
        b       LCZH5
LCZH3:
        cmp     r2, #0x7F
        blt     LCZH4
        mov     r0, r9
        bl      __extendsfdf2
        mov     r12, #0xFF, 12
        mov     r2, r0
        mov     r3, r1
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __divdf3
        mov     r9, r0
        mov     r10, r1
        mov     r2, r9
        mov     r3, r10
        bl      __muldf3
        add     r7, r6, r11, lsl #3
        ldr     r12, [r7, #4]
        ldr     r11, [r6, +r11, lsl #3]
        mov     r7, r0
        mov     r8, r1
        mov     r1, r12
        mov     r2, r9
        mov     r3, r10
        mov     r0, r11
        bl      __subdf3
        ldr     r2, [r6, #0x10]
        ldr     r3, [r6, #0x14]
        ldr     r11, [r6, #0x28]
        ldr     r12, [r6, #0x2C]
        str     r12, [sp, #0xE8]
        ldr     r12, [r6, #0x20]
        str     r12, [sp, #0xE4]
        ldr     r12, [r6, #0x24]
        str     r12, [sp, #0xE0]
        ldr     r12, [r6, #0x18]
        str     r12, [sp, #0xDC]
        ldr     r12, [r6, #0x1C]
        str     r0, [sp, #0xD4]
        str     r1, [sp, #0xD0]
        mov     r0, r2
        str     r12, [sp, #0xD8]
        mov     r1, r3
        mov     r2, r7
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [sp, #0xDC]
        ldr     r3, [sp, #0xD8]
        bl      __adddf3
        mov     r2, r7
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [sp, #0xE4]
        ldr     r3, [sp, #0xE0]
        bl      __adddf3
        mov     r2, r7
        mov     r3, r8
        bl      __muldf3
        ldr     r3, [sp, #0xE8]
        mov     r2, r11
        bl      __adddf3
        mov     r2, r9
        mov     r3, r10
        bl      __muldf3
        ldr     lr, [r6, #0x30]
        ldr     r12, [r6, #0x34]
        ldr     r11, [r6, #0x40]
        ldr     r9, [r6, #0x48]
        ldr     r10, [r6, #0x4C]
        str     r11, [sp, #0xE8]
        ldr     r11, [r6, #0x44]
        ldr     r2, [r6, #0x38]
        str     r2, [sp, #0xE4]
        ldr     r2, [r6, #0x3C]
        str     r0, [sp, #0xDC]
        str     r1, [sp, #0xD8]
        str     r2, [sp, #0xE0]
        mov     r0, lr
        mov     r1, r12
        mov     r2, r7
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [sp, #0xE4]
        ldr     r3, [sp, #0xE0]
        bl      __adddf3
        mov     r2, r7
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [sp, #0xE8]
        mov     r3, r11
        bl      __adddf3
        mov     r2, r7
        mov     r3, r8
        bl      __muldf3
        mov     r2, r9
        mov     r3, r10
        bl      __adddf3
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [sp, #0xDC]
        ldr     r1, [sp, #0xD8]
        bl      __divdf3
        ldr     r2, [sp, #0xD4]
        ldr     r3, [sp, #0xD0]
        bl      __adddf3
        bl      __truncdfsf2
        str     r0, [r4]
        b       LCZH5
LCZH4:
        mov     r0, r9
        mov     r1, r9
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r7, r0
        mov     r0, r9
        mov     r8, r1
        bl      __extendsfdf2
        ldr     r12, [r6, #0x28]
        mov     r10, r0
        ldr     r0, [r6, #0x10]
        mov     r9, r1
        ldr     r1, [r6, #0x14]
        str     r12, [sp, #0xE8]
        ldr     r11, [r6, #0x2C]
        ldr     r12, [r6, #0x20]
        mov     r2, r7
        mov     r3, r8
        str     r12, [sp, #0xE4]
        ldr     r12, [r6, #0x24]
        str     r12, [sp, #0xE0]
        ldr     r12, [r6, #0x18]
        str     r12, [sp, #0xDC]
        ldr     r12, [r6, #0x1C]
        str     r12, [sp, #0xD8]
        bl      __muldf3
        ldr     r3, [sp, #0xD8]
        ldr     r2, [sp, #0xDC]
        bl      __adddf3
        mov     r2, r7
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [sp, #0xE4]
        ldr     r3, [sp, #0xE0]
        bl      __adddf3
        mov     r2, r7
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [sp, #0xE8]
        mov     r3, r11
        bl      __adddf3
        mov     r2, r10
        mov     r3, r9
        bl      __muldf3
        ldr     r12, [r6, #0x48]
        mov     r11, r1
        str     r12, [sp, #0xE8]
        ldr     r12, [r6, #0x4C]
        str     r12, [sp, #0xE4]
        ldr     r12, [r6, #0x40]
        ldr     r3, [r6, #0x30]
        ldr     r2, [r6, #0x34]
        str     r12, [sp, #0xE0]
        ldr     r12, [r6, #0x44]
        mov     r1, r2
        mov     r2, r7
        str     r12, [sp, #0xDC]
        ldr     r12, [r6, #0x38]
        str     r12, [sp, #0xD8]
        ldr     r12, [r6, #0x3C]
        str     r0, [sp, #0xD0]
        mov     r0, r3
        str     r12, [sp, #0xD4]
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [sp, #0xD8]
        ldr     r3, [sp, #0xD4]
        bl      __adddf3
        mov     r2, r7
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [sp, #0xE0]
        ldr     r3, [sp, #0xDC]
        bl      __adddf3
        mov     r2, r7
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [sp, #0xE8]
        ldr     r3, [sp, #0xE4]
        bl      __adddf3
        mov     r2, r0
        ldr     r0, [sp, #0xD0]
        mov     r3, r1
        mov     r1, r11
        bl      __divdf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r10
        mov     r1, r9
        bl      __subdf3
        bl      __truncdfsf2
        str     r0, [r4]
LCZH5:
        subs    r5, r5, #1
        add     r4, r4, #4
        bne     LCZH0
LCZH6:
        mov     r0, #0
        add     sp, sp, #0xFC
        ldmia   sp!, {r4 - r11, pc}
LCZH7:
        subs    r5, r5, #1
        str     r2, [sp, #0xF0]
        str     r2, [sp, #0xF4]
        str     r2, [sp, #0xF8]
        bmi     LCZH12
        sub     r2, r2, #1, 10
        sub     r11, r10, #2, 2
        add     r9, r4, r5, lsl #2
        str     r2, [sp, #0x10]
        str     r4, [sp, #0x14]
        str     lr, [sp, #0xC]
        str     r3, [sp, #0x18]
LCZH8:
        ldr     r6, [r9]
        sub     r1, r7, #1, 10
        and     r1, r6, r1
        str     r6, [sp, #0xF8]
        mov     r1, r1, lsr #23
        cmp     r1, #0xFE
        bic     r1, r6, r8
        mov     r4, r1, lsr #31
        ble     LCZH64
        mvn     r1, r10
        bic     r1, r6, r1
        cmn     r1, #1, 10
        bne     LCZH9
        ldr     r1, [sp, #0x10]
        mov     r0, #0
        sub     r6, r0, #1, 10
        str     r1, [r9]
        str     r1, [sp, #0xF8]
        b       LCZH11
LCZH9:
        cmp     r11, r1
        bne     LCZH10
        mov     r0, #0xFF, 10
        orr     r0, r0, #3, 2
        str     r11, [r9]
        str     r11, [sp, #0xF8]
        sub     r6, r0, #2, 2
        b       LCZH11
LCZH10:
        ldr     r1, [pc, #0xA74]
        ldr     r0, [r1, +r4, lsl #3]
        add     r1, r1, r4, lsl #3
        ldr     r1, [r1, #4]
        bl      __truncdfsf2
        str     r0, [r9]
LCZH11:
        subs    r5, r5, #1
        sub     r9, r9, #4
        bpl     LCZH8
        mov     r2, r4
        mov     r0, r6
        ldr     r4, [sp, #0x14]
        ldr     lr, [sp, #0xC]
        ldr     r3, [sp, #0x18]
LCZH12:
        subs    r8, r5, #1
        mov     r1, #0
        bmi     LCZH17
        ldr     r6, [pc, #0xA30]
        mov     r3, #0xFF, 10
        orr     r3, r3, #3, 2
        sub     r11, r1, #1, 10
        sub     r10, r3, #2, 2
        add     r7, r4, r8, lsl #2
        str     r4, [sp, #0x14]
        str     lr, [sp, #0xC]
        str     r0, [sp, #0x20]
        str     r2, [sp, #0x1C]
LCZH13:
        ldr     r9, [r7]
        mov     r0, #0xFF, 10
        orr     r0, r0, #1, 2
        sub     r0, r0, #1, 10
        and     r0, r9, r0
        str     r9, [sp, #0xF4]
        mov     r0, r0, lsr #23
        cmp     r0, #0xFE
        mvn     r0, #2, 2
        bic     r0, r9, r0
        mov     r4, r0, lsr #31
        ble     LCZH63
        mov     r0, #0xFF, 10
        orr     r0, r0, #3, 2
        mvn     r0, r0
        bic     r0, r9, r0
        cmn     r0, #1, 10
        bne     LCZH14
        mov     r0, #0
        str     r11, [r7]
        str     r11, [sp, #0xF4]
        sub     r9, r0, #1, 10
        b       LCZH16
LCZH14:
        cmp     r10, r0
        bne     LCZH15
        mov     r0, #0xFF, 10
        orr     r0, r0, #3, 2
        str     r10, [r7]
        str     r10, [sp, #0xF4]
        sub     r9, r0, #2, 2
        b       LCZH16
LCZH15:
        ldr     r0, [r6, +r4, lsl #3]
        add     r2, r6, r4, lsl #3
        ldr     r1, [r2, #4]
        bl      __truncdfsf2
        str     r0, [r7]
LCZH16:
        subs    r8, r8, #1
        sub     r7, r7, #4
        bpl     LCZH13
        mov     r1, r4
        mov     r3, r9
        ldr     r4, [sp, #0x14]
        ldr     lr, [sp, #0xC]
        ldr     r0, [sp, #0x20]
        ldr     r2, [sp, #0x1C]
LCZH17:
        subs    r9, r8, #1
        mov     r12, #0
        bmi     LCZH22
        ldr     r7, [pc, #0x948]
        sub     r11, r12, #1, 10
        mov     r12, #0xFF, 10
        orr     r12, r12, #3, 2
        sub     r10, r12, #2, 2
        add     r6, r4, r9, lsl #2
        str     r5, [sp, #0x24]
        str     r1, [sp, #0x10]
        str     r4, [sp, #0x14]
        str     r3, [sp, #0x18]
        str     r0, [sp, #0x20]
        str     r2, [sp, #0x1C]
LCZH18:
        ldr     r4, [r6]
        mov     r1, #0xFF, 10
        orr     r1, r1, #1, 2
        sub     r1, r1, #1, 10
        and     r2, r4, r1
        mvn     r1, #2, 2
        mov     r2, r2, lsr #23
        bic     r1, r4, r1
        cmp     r2, #0xFE
        str     r4, [sp, #0xF0]
        mov     r5, r1, lsr #31
        ble     LCZH62
        mov     r0, #0xFF, 10
        orr     r0, r0, #3, 2
        mvn     r0, r0
        bic     r0, r4, r0
        cmn     r0, #1, 10
        bne     LCZH19
        mov     r1, #0
        str     r11, [r6]
        sub     r4, r1, #1, 10
        str     r11, [sp, #0xF0]
        b       LCZH21
LCZH19:
        cmp     r10, r0
        bne     LCZH20
        mov     r1, #0xFF, 10
        orr     r1, r1, #3, 2
        str     r10, [r6]
        sub     r4, r1, #2, 2
        str     r10, [sp, #0xF0]
        b       LCZH21
LCZH20:
        ldr     r0, [r7, +r5, lsl #3]
        add     r1, r7, r5, lsl #3
        ldr     r1, [r1, #4]
        bl      __truncdfsf2
        str     r0, [r6]
LCZH21:
        subs    r9, r9, #1
        sub     r6, r6, #4
        bpl     LCZH18
        mov     lr, r4
        mov     r12, r5
        ldr     r5, [sp, #0x24]
        ldr     r1, [sp, #0x10]
        ldr     r4, [sp, #0x14]
        ldr     r3, [sp, #0x18]
        ldr     r0, [sp, #0x20]
        ldr     r2, [sp, #0x1C]
LCZH22:
        subs    r11, r9, #1
        bmi     LCZH25
        mov     r7, #0xFF, 10
        orr     r7, r7, #3, 2
        add     r10, r4, r11, lsl #2
        str     r4, [sp, #0x14]
        ldr     r4, [pc, #0x844]
        sub     r6, r7, #2, 2
        mov     r7, #0
        sub     r7, r7, #1, 10
        str     r12, [sp, #8]
        str     r1, [sp, #0x10]
        str     lr, [sp, #0xC]
        str     r3, [sp, #0x18]
        str     r0, [sp, #0x20]
        str     r2, [sp, #0x1C]
LCZH23:
        ldr     r1, [r10]
        mov     r3, #0xFF, 10
        orr     r3, r3, #1, 2
        sub     r3, r3, #1, 10
        mov     r0, r1
        and     r3, r0, r3
        mvn     r12, #2, 2
        mov     r3, r3, lsr #23
        bic     r12, r0, r12
        cmp     r3, #0xFE
        str     r1, [sp, #0xEC]
        mov     r2, r12, lsr #31
        ble     LCZH27
        mov     r1, #0xFF, 10
        orr     r1, r1, #3, 2
        mvn     r1, r1
        bic     r1, r0, r1
        cmn     r1, #1, 10
        streq   r7, [r10]
        streq   r7, [sp, #0xEC]
        beq     LCZH24
        cmp     r6, r1
        streq   r6, [r10]
        streq   r6, [sp, #0xEC]
        beq     LCZH24
        ldr     r0, [r4, +r2, lsl #3]
        add     r2, r4, r2, lsl #3
        ldr     r1, [r2, #4]
        bl      __truncdfsf2
        str     r0, [r10]
LCZH24:
        subs    r11, r11, #1
        sub     r10, r10, #4
        bpl     LCZH23
        ldr     r4, [sp, #0x14]
LCZH25:
        cmp     r5, #0
        blt     LCZH6
        ldr     r0, [sp, #0xF8]
        bl      __extendsfdf2
        bl      atan
        bl      __truncdfsf2
        cmp     r8, #0
        str     r0, [r4, +r5, lsl #2]
        blt     LCZH6
        ldr     r0, [sp, #0xF4]
        bl      __extendsfdf2
        bl      atan
        bl      __truncdfsf2
        cmp     r9, #0
        str     r0, [r4, +r8, lsl #2]
        blt     LCZH6
        ldr     r0, [sp, #0xF0]
        bl      __extendsfdf2
        bl      atan
        bl      __truncdfsf2
        str     r0, [r4, +r9, lsl #2]
        mov     r0, #0
        add     sp, sp, #0xFC
        ldmia   sp!, {r4 - r11, pc}
LCZH26:
        mvn     r0, #5
        add     sp, sp, #0xFC
        ldmia   sp!, {r4 - r11, pc}
LCZH27:
        ldr     r7, [sp, #0xF8]
        ldr     r12, [sp, #8]
        ldr     r4, [sp, #0x14]
        ldr     lr, [sp, #0xC]
        str     r7, [sp, #0x30]
        ldr     r7, [sp, #0xF4]
        str     r3, [sp, #0x2C]
        ldr     r3, [sp, #0x18]
        ldr     r6, [sp, #0xF0]
        str     r7, [sp, #0x34]
        str     r2, [sp, #0x28]
        ldr     r2, [sp, #0x1C]
        str     r0, [sp]
        ldr     r0, [sp, #0x20]
        str     r1, [sp, #4]
        ldr     r1, [sp, #0x10]
        mov     r7, #0xFF, 10
        orr     r7, r7, #3, 2
        mov     r10, #0
        str     r5, [sp, #0x24]
        ldr     r5, [sp, #0x2C]
        sub     r10, r10, #1, 10
        sub     r7, r7, #2, 2
        str     r7, [sp, #0x4C]
        str     r10, [sp, #0x48]
        str     r6, [sp, #0x50]
        str     r9, [sp, #0xDC]
        str     r8, [sp, #0xD8]
        str     r11, [sp, #0xE0]
        str     r12, [sp, #8]
        str     r1, [sp, #0x10]
        str     lr, [sp, #0xC]
        str     r3, [sp, #0x18]
        str     r0, [sp, #0x20]
        str     r2, [sp, #0x1C]
LCZH28:
        ldr     r0, [sp, #0x30]
        bl      __extendsfdf2
        ldr     r3, [sp, #0x20]
        mov     r2, #0xFF, 10
        orr     r2, r2, #1, 2
        sub     r2, r2, #1, 10
        and     r2, r3, r2
        mov     r2, r2, lsr #23
        cmp     r2, #0x7F
        str     r0, [sp, #0xC8]
        str     r1, [sp, #0xCC]
        movlt   r1, #0
        strlt   r1, [sp, #0x70]
        blt     LCZH29
        ldr     r2, [sp, #0xC8]
        ldr     r3, [sp, #0xCC]
        mov     r1, #0xFF, 12
        orr     r1, r1, #3, 4
        mov     r0, #0
        bl      __divdf3
        str     r1, [sp, #0xCC]
        mov     r1, #1
        str     r0, [sp, #0xC8]
        str     r1, [sp, #0x70]
LCZH29:
        ldr     r0, [sp, #0x34]
        bl      __extendsfdf2
        ldr     r3, [sp, #0x18]
        mov     r2, #0xFF, 10
        orr     r2, r2, #1, 2
        sub     r2, r2, #1, 10
        and     r2, r3, r2
        mov     r2, r2, lsr #23
        cmp     r2, #0x7F
        str     r0, [sp, #0xC4]
        str     r1, [sp, #0xC0]
        movlt   r1, #0
        strlt   r1, [sp, #0x6C]
        blt     LCZH30
        ldr     r2, [sp, #0xC4]
        ldr     r3, [sp, #0xC0]
        mov     r1, #0xFF, 12
        orr     r1, r1, #3, 4
        mov     r0, #0
        bl      __divdf3
        str     r1, [sp, #0xC0]
        mov     r1, #1
        str     r0, [sp, #0xC4]
        str     r1, [sp, #0x6C]
LCZH30:
        ldr     r0, [sp, #0x50]
        bl      __extendsfdf2
        ldr     r3, [sp, #0xC]
        mov     r2, #0xFF, 10
        orr     r2, r2, #1, 2
        sub     r2, r2, #1, 10
        and     r2, r3, r2
        mov     r2, r2, lsr #23
        cmp     r2, #0x7F
        str     r0, [sp, #0xB4]
        str     r1, [sp, #0xBC]
        movlt   r1, #0
        strlt   r1, [sp, #0x68]
        blt     LCZH31
        ldr     r2, [sp, #0xB4]
        ldr     r3, [sp, #0xBC]
        mov     r1, #0xFF, 12
        orr     r1, r1, #3, 4
        mov     r0, #0
        bl      __divdf3
        str     r1, [sp, #0xBC]
        mov     r1, #1
        str     r0, [sp, #0xB4]
        str     r1, [sp, #0x68]
LCZH31:
        ldr     r0, [sp, #4]
        bl      __extendsfdf2
        cmp     r5, #0x7F
        str     r0, [sp, #0xB8]
        str     r1, [sp, #0xB0]
        movlt   r1, #0
        strlt   r1, [sp, #0x64]
        blt     LCZH32
        ldr     r2, [sp, #0xB8]
        ldr     r3, [sp, #0xB0]
        mov     r1, #0xFF, 12
        orr     r1, r1, #3, 4
        mov     r0, #0
        bl      __divdf3
        str     r1, [sp, #0xB0]
        mov     r1, #1
        str     r0, [sp, #0xB8]
        str     r1, [sp, #0x64]
LCZH32:
        ldr     r2, [sp, #0xC8]
        ldr     r3, [sp, #0xCC]
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        ldr     r2, [sp, #0xC4]
        ldr     r3, [sp, #0xC0]
        mov     r7, r0
        mov     r10, r1
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        mov     r8, r0
        mov     r9, r1
        ldr     r0, [sp, #0xB4]
        ldr     r1, [sp, #0xBC]
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        ldr     r2, [sp, #0xB8]
        ldr     r3, [sp, #0xB0]
        str     r1, [sp, #0xE4]
        str     r0, [sp, #0xE8]
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        ldr     r11, [pc, #0x4CC]
        ldr     r12, [r11, #0x10]
        mov     r2, r7
        mov     r3, r10
        str     r12, [sp, #0xD4]
        ldr     r12, [r11, #0x14]
        str     r12, [sp, #0xD0]
        ldr     r12, [r11, #0x20]
        ldr     r5, [r11, #0x28]
        ldr     r6, [r11, #0x2C]
        str     r12, [sp, #0xAC]
        ldr     r12, [r11, #0x24]
        str     r12, [sp, #0xA8]
        ldr     r12, [r11, #0x18]
        str     r12, [sp, #0xA4]
        ldr     r12, [r11, #0x1C]
        str     r1, [sp, #0x98]
        str     r0, [sp, #0x9C]
        ldr     r1, [sp, #0xD0]
        ldr     r0, [sp, #0xD4]
        str     r12, [sp, #0xA0]
        bl      __muldf3
        ldr     r2, [sp, #0xA4]
        ldr     r3, [sp, #0xA0]
        bl      __adddf3
        mov     r2, r7
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0xAC]
        ldr     r3, [sp, #0xA8]
        bl      __adddf3
        mov     r2, r7
        mov     r3, r10
        bl      __muldf3
        mov     r2, r5
        mov     r3, r6
        bl      __adddf3
        ldr     r2, [sp, #0xC8]
        ldr     r3, [sp, #0xCC]
        bl      __muldf3
        str     r1, [sp, #0x78]
        ldr     r1, [sp, #0xD0]
        str     r0, [sp, #0x74]
        ldr     r0, [sp, #0xD4]
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #0xA4]
        ldr     r3, [sp, #0xA0]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #0xAC]
        ldr     r3, [sp, #0xA8]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        mov     r2, r5
        mov     r3, r6
        bl      __adddf3
        ldr     r2, [sp, #0xC4]
        ldr     r3, [sp, #0xC0]
        bl      __muldf3
        str     r1, [sp, #0x80]
        ldr     r1, [sp, #0xD0]
        ldr     r3, [sp, #0xE4]
        ldr     r2, [sp, #0xE8]
        str     r0, [sp, #0x7C]
        ldr     r0, [sp, #0xD4]
        bl      __muldf3
        ldr     r2, [sp, #0xA4]
        ldr     r3, [sp, #0xA0]
        bl      __adddf3
        ldr     r3, [sp, #0xE4]
        ldr     r2, [sp, #0xE8]
        bl      __muldf3
        ldr     r2, [sp, #0xAC]
        ldr     r3, [sp, #0xA8]
        bl      __adddf3
        ldr     r3, [sp, #0xE4]
        ldr     r2, [sp, #0xE8]
        bl      __muldf3
        mov     r2, r5
        mov     r3, r6
        bl      __adddf3
        ldr     r2, [sp, #0xB4]
        ldr     r3, [sp, #0xBC]
        bl      __muldf3
        str     r1, [sp, #0x84]
        ldr     r1, [sp, #0xD0]
        ldr     r2, [sp, #0x9C]
        ldr     r3, [sp, #0x98]
        str     r0, [sp, #0x88]
        ldr     r0, [sp, #0xD4]
        bl      __muldf3
        ldr     r2, [sp, #0xA4]
        ldr     r3, [sp, #0xA0]
        bl      __adddf3
        ldr     r2, [sp, #0x9C]
        ldr     r3, [sp, #0x98]
        bl      __muldf3
        ldr     r2, [sp, #0xAC]
        ldr     r3, [sp, #0xA8]
        bl      __adddf3
        ldr     r2, [sp, #0x9C]
        ldr     r3, [sp, #0x98]
        bl      __muldf3
        mov     r2, r5
        mov     r3, r6
        bl      __adddf3
        ldr     r2, [sp, #0xB8]
        ldr     r3, [sp, #0xB0]
        bl      __muldf3
        ldr     r12, [r11, #0x40]
        mov     r2, r7
        str     r12, [sp, #0xA4]
        ldr     r12, [r11, #0x44]
        mov     r3, r10
        str     r12, [sp, #0xA0]
        ldr     r12, [r11, #0x30]
        str     r12, [sp, #0x94]
        ldr     r12, [r11, #0x34]
        str     r12, [sp, #0x60]
        ldr     r12, [r11, #0x38]
        ldr     r5, [r11, #0x48]
        ldr     r6, [r11, #0x4C]
        str     r12, [sp, #0x5C]
        ldr     r11, [r11, #0x3C]
        str     r1, [sp, #0x8C]
        str     r0, [sp, #0x90]
        ldr     r0, [sp, #0x94]
        ldr     r1, [sp, #0x60]
        str     r11, [sp, #0x58]
        bl      __muldf3
        ldr     r2, [sp, #0x5C]
        ldr     r3, [sp, #0x58]
        bl      __adddf3
        mov     r2, r7
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0xA4]
        ldr     r3, [sp, #0xA0]
        bl      __adddf3
        mov     r3, r10
        mov     r2, r7
        bl      __muldf3
        mov     r2, r5
        mov     r3, r6
        bl      __adddf3
        str     r1, [sp, #0xAC]
        ldr     r1, [sp, #0x60]
        str     r0, [sp, #0xA8]
        ldr     r0, [sp, #0x94]
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #0x5C]
        ldr     r3, [sp, #0x58]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #0xA4]
        ldr     r3, [sp, #0xA0]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        mov     r2, r5
        mov     r3, r6
        bl      __adddf3
        mov     r10, r1
        ldr     r3, [sp, #0xE4]
        ldr     r2, [sp, #0xE8]
        ldr     r1, [sp, #0x60]
        mov     r7, r0
        ldr     r0, [sp, #0x94]
        str     r7, [sp, #0xD0]
        str     r10, [sp, #0xD4]
        bl      __muldf3
        ldr     r2, [sp, #0x5C]
        ldr     r3, [sp, #0x58]
        bl      __adddf3
        ldr     r3, [sp, #0xE4]
        ldr     r2, [sp, #0xE8]
        bl      __muldf3
        ldr     r2, [sp, #0xA4]
        ldr     r3, [sp, #0xA0]
        bl      __adddf3
        ldr     r2, [sp, #0xE8]
        ldr     r3, [sp, #0xE4]
        bl      __muldf3
        mov     r2, r5
        mov     r3, r6
        bl      __adddf3
        mov     r8, r0
        mov     r9, r1
        ldr     r2, [sp, #0x9C]
        ldr     r3, [sp, #0x98]
        ldr     r0, [sp, #0x94]
        ldr     r1, [sp, #0x60]
        str     r8, [sp, #0xE4]
        str     r9, [sp, #0xE8]
        bl      __muldf3
        ldr     r2, [sp, #0x5C]
        ldr     r3, [sp, #0x58]
        bl      __adddf3
        ldr     r2, [sp, #0x9C]
        ldr     r3, [sp, #0x98]
        bl      __muldf3
        ldr     r2, [sp, #0xA4]
        ldr     r3, [sp, #0xA0]
        bl      __adddf3
        ldr     r2, [sp, #0x9C]
        ldr     r3, [sp, #0x98]
        bl      __muldf3
        mov     r2, r5
        mov     r3, r6
        bl      __adddf3
        mov     r6, r0
        ldr     r0, [sp, #0xA8]
        mov     r5, r1
        ldr     r1, [sp, #0xAC]
        mov     r2, r7
        mov     r3, r10
        bl      __muldf3
        str     r1, [sp, #0xA4]
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
        ldr     r8, [sp, #0x1C]
        ldr     r12, [sp, #0x24]
        mov     r11, r0
        str     r8, [sp, #0x60]
        ldr     r8, [sp, #0x10]
        str     r12, [sp, #0x94]
        ldr     r12, [sp, #0xE0]
        str     r8, [sp, #0x5C]
        ldr     r8, [sp, #8]
        subs    lr, r12, #1
        str     lr, [sp, #0x24]
        str     r8, [sp, #0x58]
        ldr     r8, [sp, #0x28]
        mov     r10, r1
        str     r8, [sp, #0x54]
        ldr     r8, [sp, #0xD8]
        str     r12, [sp, #0x98]
        str     r8, [sp, #0xA0]
        ldr     r8, [sp, #0xDC]
        str     r8, [sp, #0x9C]
        bmi     LCZH37
        ldr     r12, [sp, #0x24]
        str     r10, [sp, #0x2C]
        str     r7, [sp, #0x3C]
        str     r5, [sp, #0x40]
        str     r6, [sp, #0x44]
        ldr     r5, [sp, #0x4C]
        ldr     r6, [sp, #0x48]
        ldr     r7, [pc, #0x94]
        ldr     r10, [sp, #0x24]
        add     r8, r4, r12, lsl #2
        str     r11, [sp, #0x38]
        str     r4, [sp, #0x14]
LCZH33:
        ldr     r9, [r8]
        mov     r1, #0xFF, 10
        orr     r1, r1, #1, 2
        sub     r1, r1, #1, 10
        mov     r4, r9
        and     r2, r4, r1
        mvn     r1, #2, 2
        mov     r2, r2, lsr #23
        bic     r1, r4, r1
        cmp     r2, #0xFE
        str     r9, [sp, #0xF8]
        mov     r11, r1, lsr #31
        ble     LCZH60
        mov     r0, #0xFF, 10
        orr     r0, r0, #3, 2
        mvn     r0, r0
        bic     r0, r4, r0
        cmn     r0, #1, 10
        bne     LCZH34
        mov     r1, #0
        sub     r4, r1, #1, 10
        mov     r9, r4
        str     r6, [sp, #0xF8]
        str     r9, [r8]
        b       LCZH36
LCZH34:
        cmp     r5, r0
        bne     LCZH35
        mov     r1, #0xFF, 10
        orr     r1, r1, #3, 2
        sub     r4, r1, #2, 2
        mov     r9, r4
        str     r5, [sp, #0xF8]
        str     r9, [r8]
        b       LCZH36
        .long   LCZH_pi_2d
LCZH35:
        ldr     r0, [r7, +r11, lsl #3]
        add     r1, r7, r11, lsl #3
        ldr     r1, [r1, #4]
        bl      __truncdfsf2
        str     r0, [r8]
LCZH36:
        subs    r10, r10, #1
        sub     r8, r8, #4
        bpl     LCZH33
        str     r10, [sp, #0x24]
        str     r4, [sp, #0x20]
        str     r11, [sp, #0x1C]
        ldr     r10, [sp, #0x2C]
        ldr     r11, [sp, #0x38]
        ldr     r7, [sp, #0x3C]
        ldr     r5, [sp, #0x40]
        ldr     r6, [sp, #0x44]
        ldr     r4, [sp, #0x14]
        str     r9, [sp, #0x30]
LCZH37:
        ldr     r12, [sp, #0x24]
        subs    r12, r12, #1
        str     r12, [sp, #0xD8]
        bmi     LCZH42
        ldr     r12, [sp, #0xD8]
        str     r10, [sp, #0x2C]
        str     r7, [sp, #0x3C]
        str     r5, [sp, #0x40]
        str     r6, [sp, #0x44]
        ldr     r5, [sp, #0x4C]
        ldr     r6, [sp, #0x48]
        ldr     r7, [pc, #-0x80]
        ldr     r10, [sp, #0xD8]
        add     r8, r4, r12, lsl #2
        str     r11, [sp, #0x38]
        str     r4, [sp, #0x14]
LCZH38:
        ldr     r9, [r8]
        mov     r1, #0xFF, 10
        orr     r1, r1, #1, 2
        sub     r1, r1, #1, 10
        mov     r4, r9
        and     r2, r4, r1
        mvn     r1, #2, 2
        mov     r2, r2, lsr #23
        bic     r1, r4, r1
        cmp     r2, #0xFE
        str     r9, [sp, #0xF4]
        mov     r11, r1, lsr #31
        ble     LCZH59
        mov     r0, #0xFF, 10
        orr     r0, r0, #3, 2
        mvn     r0, r0
        bic     r0, r4, r0
        cmn     r0, #1, 10
        bne     LCZH39
        mov     r1, #0
        sub     r4, r1, #1, 10
        mov     r9, r4
        str     r6, [sp, #0xF4]
        str     r9, [r8]
        b       LCZH41
LCZH39:
        cmp     r5, r0
        bne     LCZH40
        mov     r1, #0xFF, 10
        orr     r1, r1, #3, 2
        sub     r4, r1, #2, 2
        mov     r9, r4
        str     r5, [sp, #0xF4]
        str     r9, [r8]
        b       LCZH41
LCZH40:
        ldr     r0, [r7, +r11, lsl #3]
        add     r1, r7, r11, lsl #3
        ldr     r1, [r1, #4]
        bl      __truncdfsf2
        str     r0, [r8]
LCZH41:
        subs    r10, r10, #1
        sub     r8, r8, #4
        bpl     LCZH38
        str     r10, [sp, #0xD8]
        str     r11, [sp, #0x10]
        str     r4, [sp, #0x18]
        ldr     r10, [sp, #0x2C]
        ldr     r11, [sp, #0x38]
        ldr     r7, [sp, #0x3C]
        ldr     r5, [sp, #0x40]
        ldr     r6, [sp, #0x44]
        ldr     r4, [sp, #0x14]
        str     r9, [sp, #0x34]
LCZH42:
        ldr     r12, [sp, #0xD8]
        subs    r12, r12, #1
        str     r12, [sp, #0xDC]
        bmi     LCZH47
        ldr     r12, [sp, #0xDC]
        str     r10, [sp, #0x2C]
        str     r7, [sp, #0x3C]
        str     r5, [sp, #0x40]
        str     r6, [sp, #0x44]
        ldr     r5, [sp, #0x4C]
        ldr     r6, [sp, #0x48]
        ldr     r7, [pc, #-0x190]
        ldr     r10, [sp, #0xDC]
        add     r8, r4, r12, lsl #2
        str     r11, [sp, #0x38]
        str     r4, [sp, #0x14]
LCZH43:
        ldr     r9, [r8]
        mov     r1, #0xFF, 10
        orr     r1, r1, #1, 2
        sub     r1, r1, #1, 10
        mov     r4, r9
        and     r2, r4, r1
        mvn     r1, #2, 2
        mov     r2, r2, lsr #23
        bic     r1, r4, r1
        cmp     r2, #0xFE
        str     r9, [sp, #0xF0]
        mov     r11, r1, lsr #31
        ble     LCZH58
        mov     r0, #0xFF, 10
        orr     r0, r0, #3, 2
        mvn     r0, r0
        bic     r0, r4, r0
        cmn     r0, #1, 10
        bne     LCZH44
        mov     r1, #0
        sub     r4, r1, #1, 10
        mov     r9, r4
        str     r6, [sp, #0xF0]
        str     r9, [r8]
        b       LCZH46
LCZH44:
        cmp     r5, r0
        bne     LCZH45
        mov     r1, #0xFF, 10
        orr     r1, r1, #3, 2
        sub     r4, r1, #2, 2
        mov     r9, r4
        str     r5, [sp, #0xF0]
        str     r9, [r8]
        b       LCZH46
LCZH45:
        ldr     r0, [r7, +r11, lsl #3]
        add     r1, r7, r11, lsl #3
        ldr     r1, [r1, #4]
        bl      __truncdfsf2
        str     r0, [r8]
LCZH46:
        subs    r10, r10, #1
        sub     r8, r8, #4
        bpl     LCZH43
        str     r10, [sp, #0xDC]
        str     r11, [sp, #8]
        str     r4, [sp, #0xC]
        ldr     r10, [sp, #0x2C]
        ldr     r11, [sp, #0x38]
        ldr     r7, [sp, #0x3C]
        ldr     r5, [sp, #0x40]
        ldr     r6, [sp, #0x44]
        ldr     r4, [sp, #0x14]
        str     r9, [sp, #0x50]
LCZH47:
        ldr     r12, [sp, #0xDC]
        subs    r12, r12, #1
        str     r12, [sp, #0xE0]
        bmi     LCZH52
        ldr     r12, [sp, #0xE0]
        str     r10, [sp, #0x2C]
        str     r7, [sp, #0x3C]
        str     r6, [sp, #0x44]
        ldr     r6, [sp, #0x4C]
        ldr     r7, [sp, #0x48]
        ldr     r9, [pc, #-0x29C]
        ldr     r10, [sp, #0xE0]
        add     r8, r4, r12, lsl #2
        str     r11, [sp, #0x38]
        str     r5, [sp, #0x40]
        str     r4, [sp, #0x14]
LCZH48:
        ldr     r4, [r8]
        mov     r1, #0xFF, 10
        orr     r1, r1, #1, 2
        sub     r1, r1, #1, 10
        mov     r5, r4
        and     r2, r5, r1
        mvn     r1, #2, 2
        mov     r2, r2, lsr #23
        bic     r1, r5, r1
        cmp     r2, #0xFE
        str     r4, [sp, #0xEC]
        mov     r11, r1, lsr #31
        ble     LCZH61
        mov     r0, #0xFF, 10
        orr     r0, r0, #3, 2
        mvn     r0, r0
        bic     r0, r5, r0
        cmn     r0, #1, 10
        bne     LCZH49
        mov     r2, #0xFF, 10
        mov     r1, #0
        orr     r4, r2, #3, 2
        sub     r5, r1, #1, 10
        str     r7, [sp, #0xEC]
        str     r4, [r8]
        b       LCZH51
LCZH49:
        cmp     r6, r0
        bne     LCZH50
        mov     r2, #0xFF, 10
        orr     r1, r2, #3, 2
        orr     r4, r2, #1, 2
        sub     r5, r1, #2, 2
        str     r6, [sp, #0xEC]
        str     r4, [r8]
        b       LCZH51
LCZH50:
        ldr     r0, [r9, +r11, lsl #3]
        add     r1, r9, r11, lsl #3
        ldr     r1, [r1, #4]
        bl      __truncdfsf2
        str     r0, [r8]
LCZH51:
        subs    r10, r10, #1
        sub     r8, r8, #4
        bpl     LCZH48
        str     r11, [sp, #0x28]
        str     r5, [sp]
        str     r4, [sp, #4]
        str     r10, [sp, #0xE0]
        ldr     r10, [sp, #0x2C]
        ldr     r11, [sp, #0x38]
        ldr     r7, [sp, #0x3C]
        ldr     r5, [sp, #0x40]
        ldr     r6, [sp, #0x44]
        ldr     r4, [sp, #0x14]
LCZH52:
        ldr     r0, [sp, #0xE4]
        ldr     r1, [sp, #0xE8]
        mov     r3, r5
        mov     r2, r6
        bl      __muldf3
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldr     r3, [sp, #0xA4]
        mov     r8, r0
        mov     r9, r1
        mov     r2, r7
        mov     r0, r11
        mov     r1, r10
        bl      __muldf3
        ldr     r2, [sp, #0xD0]
        ldr     r3, [sp, #0xD4]
        mov     r10, r1
        mov     r7, r0
        mov     r0, r8
        mov     r1, r9
        bl      __muldf3
        ldr     r2, [sp, #0x74]
        ldr     r3, [sp, #0x78]
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0xC8]
        mov     r3, r1
        ldr     r1, [sp, #0xCC]
        bl      __subdf3
        bl      __truncdfsf2
        ldr     r2, [sp, #0xA8]
        ldr     r3, [sp, #0xAC]
        mov     r11, r0
        mov     r1, r9
        mov     r0, r8
        bl      __muldf3
        ldr     r2, [sp, #0x7C]
        ldr     r3, [sp, #0x80]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [sp, #0xC4]
        ldr     r1, [sp, #0xC0]
        bl      __subdf3
        bl      __truncdfsf2
        mov     r8, r0
        mov     r3, r5
        mov     r2, r6
        mov     r0, r7
        mov     r1, r10
        bl      __muldf3
        ldr     r2, [sp, #0x88]
        ldr     r3, [sp, #0x84]
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0xB4]
        mov     r3, r1
        ldr     r1, [sp, #0xBC]
        bl      __subdf3
        bl      __truncdfsf2
        ldr     r2, [sp, #0xE4]
        ldr     r3, [sp, #0xE8]
        mov     r5, r0
        mov     r0, r7
        mov     r1, r10
        bl      __muldf3
        ldr     r2, [sp, #0x90]
        ldr     r3, [sp, #0x8C]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [sp, #0xB8]
        ldr     r1, [sp, #0xB0]
        bl      __subdf3
        bl      __truncdfsf2
        ldr     r1, [sp, #0x70]
        mov     r6, r0
        cmp     r1, #0
        beq     LCZH53
        ldr     r2, [sp, #0x60]
        ldr     r1, [pc, #-0x4CC]
        mov     r0, r11
        ldr     r9, [r1, +r2, lsl #3]
        add     r2, r1, r2, lsl #3
        ldr     r7, [r2, #4]
        bl      __extendsfdf2
        mov     r2, r0
        mov     r3, r1
        mov     r0, r9
        mov     r1, r7
        bl      __subdf3
        bl      __truncdfsf2
        mov     r11, r0
LCZH53:
        ldr     r1, [sp, #0x6C]
        cmp     r1, #0
        beq     LCZH54
        ldr     r2, [sp, #0x5C]
        ldr     r1, [pc, #-0x510]
        mov     r0, r8
        ldr     r9, [r1, +r2, lsl #3]
        add     r2, r1, r2, lsl #3
        ldr     r7, [r2, #4]
        bl      __extendsfdf2
        mov     r2, r0
        mov     r3, r1
        mov     r0, r9
        mov     r1, r7
        bl      __subdf3
        bl      __truncdfsf2
        mov     r8, r0
LCZH54:
        ldr     r1, [sp, #0x68]
        cmp     r1, #0
        beq     LCZH55
        ldr     r2, [sp, #0x58]
        ldr     r1, [pc, #-0x554]
        mov     r0, r5
        ldr     r9, [r1, +r2, lsl #3]
        add     r2, r1, r2, lsl #3
        ldr     r7, [r2, #4]
        bl      __extendsfdf2
        mov     r2, r0
        mov     r3, r1
        mov     r0, r9
        mov     r1, r7
        bl      __subdf3
        bl      __truncdfsf2
        mov     r5, r0
LCZH55:
        ldr     r1, [sp, #0x64]
        cmp     r1, #0
        beq     LCZH56
        ldr     r2, [sp, #0x54]
        ldr     r1, [pc, #-0x598]
        mov     r0, r6
        ldr     r9, [r1, +r2, lsl #3]
        add     r2, r1, r2, lsl #3
        ldr     r7, [r2, #4]
        bl      __extendsfdf2
        mov     r2, r0
        mov     r3, r1
        mov     r0, r9
        mov     r1, r7
        bl      __subdf3
        bl      __truncdfsf2
        mov     r6, r0
LCZH56:
        ldr     r1, [sp, #0x94]
        str     r11, [r4, +r1, lsl #2]
        ldr     r1, [sp, #0xA0]
        str     r8, [r4, +r1, lsl #2]
        ldr     r1, [sp, #0x9C]
        str     r5, [r4, +r1, lsl #2]
        ldr     r1, [sp, #0xE0]
        cmp     r1, #0
        ldr     r1, [sp, #0x98]
        str     r6, [r4, +r1, lsl #2]
        blt     LCZH57
        mov     r1, #0
        ldr     r2, [sp]
        sub     r1, r1, #1, 10
        sub     r1, r1, #2, 2
        sub     r1, r1, #1, 10
        and     r1, r2, r1
        mov     r5, r1, lsr #23
        b       LCZH28
LCZH57:
        ldr     r9, [sp, #0xDC]
        ldr     r8, [sp, #0xD8]
        ldr     r5, [sp, #0x24]
        b       LCZH25
LCZH58:
        str     r10, [sp, #0xDC]
        str     r11, [sp, #8]
        str     r4, [sp, #0xC]
        ldr     r10, [sp, #0x2C]
        ldr     r11, [sp, #0x38]
        ldr     r7, [sp, #0x3C]
        ldr     r5, [sp, #0x40]
        ldr     r6, [sp, #0x44]
        ldr     r4, [sp, #0x14]
        str     r9, [sp, #0x50]
        b       LCZH47
LCZH59:
        str     r10, [sp, #0xD8]
        str     r11, [sp, #0x10]
        str     r4, [sp, #0x18]
        ldr     r10, [sp, #0x2C]
        ldr     r11, [sp, #0x38]
        ldr     r7, [sp, #0x3C]
        ldr     r5, [sp, #0x40]
        ldr     r6, [sp, #0x44]
        ldr     r4, [sp, #0x14]
        str     r9, [sp, #0x34]
        b       LCZH42
LCZH60:
        str     r10, [sp, #0x24]
        str     r4, [sp, #0x20]
        str     r11, [sp, #0x1C]
        ldr     r10, [sp, #0x2C]
        ldr     r11, [sp, #0x38]
        ldr     r7, [sp, #0x3C]
        ldr     r5, [sp, #0x40]
        ldr     r6, [sp, #0x44]
        ldr     r4, [sp, #0x14]
        str     r9, [sp, #0x30]
        b       LCZH37
LCZH61:
        str     r11, [sp, #0x28]
        str     r5, [sp]
        str     r4, [sp, #4]
        str     r10, [sp, #0xE0]
        ldr     r10, [sp, #0x2C]
        ldr     r11, [sp, #0x38]
        ldr     r7, [sp, #0x3C]
        ldr     r5, [sp, #0x40]
        ldr     r6, [sp, #0x44]
        ldr     r4, [sp, #0x14]
        b       LCZH52
LCZH62:
        mov     lr, r4
        mov     r12, r5
        ldr     r5, [sp, #0x24]
        ldr     r1, [sp, #0x10]
        ldr     r4, [sp, #0x14]
        ldr     r3, [sp, #0x18]
        ldr     r0, [sp, #0x20]
        ldr     r2, [sp, #0x1C]
        b       LCZH22
LCZH63:
        mov     r1, r4
        mov     r3, r9
        ldr     r4, [sp, #0x14]
        ldr     lr, [sp, #0xC]
        ldr     r0, [sp, #0x20]
        ldr     r2, [sp, #0x1C]
        b       LCZH17
LCZH64:
        mov     r2, r4
        mov     r0, r6
        ldr     r4, [sp, #0x14]
        ldr     lr, [sp, #0xC]
        ldr     r3, [sp, #0x18]
        b       LCZH12
LCZH65:
        mvn     r0, #7
        add     sp, sp, #0xFC
        ldmia   sp!, {r4 - r11, pc}


        .data
        .align  4


LCZH_pi_2d:
        .byte   0x18,0x2D,0x44,0x54,0xFB,0x21,0xF9,0x3F,0x18,0x2D,0x44,0x54,0xFB,0x21,0xF9,0xBF
LCZH_P:
        .byte   0xCC,0x92,0x86,0x60,0xB7,0x79,0x95,0x3F,0xFE,0xC7,0xD8,0xD6,0x06,0xA4,0xC2,0x3F
        .byte   0x0C,0xD5,0x15,0x3C,0x8F,0xAB,0xC5,0x3F,0x4B,0x54,0x84,0x24,0x20,0x23,0x13,0x3E
LCZH_Q:
        .byte   0x32,0x43,0x42,0x86,0x66,0x0F,0x9A,0x3F,0x40,0xFC,0xF6,0x8E,0xA1,0x93,0xD2,0x3F
        .byte   0x1E,0x22,0xA0,0x11,0x62,0xBB,0xE7,0x3F,0x34,0x02,0xE5,0xF6,0xAB,0x40,0xE0,0x3F


