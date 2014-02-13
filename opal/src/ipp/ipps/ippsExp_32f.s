        .text
        .align  4
        .globl  _ippsExp_32f


_ippsExp_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x56, 30
        cmp     r0, #0
        str     r0, [sp, #0xE0]
        str     r1, [sp, #0xDC]
        mov     r4, r2
        beq     LCFN59
        ldr     r0, [sp, #0xDC]
        cmp     r0, #0
        beq     LCFN59
        cmp     r4, #1
        blt     LCFN45
        ldr     r1, [pc, #0xFD0]
        ldr     r12, [pc, #0xFD0]
        ldr     r3, [pc, #0xFD0]
        ldr     lr, [pc, #0xFD0]
        ldr     r0, [pc, #0xFD0]
        ldr     r1, [r1]
        ldr     r12, [r12]
        ldr     r9, [r0]
        ldr     r3, [r3]
        ldr     lr, [lr]
        str     r1, [sp, #0xF8]
        str     r12, [sp, #0x108]
        str     r3, [sp, #0x100]
        str     lr, [sp, #0xF0]
        mov     r0, #0xFF, 10
        mov     r1, #0
        cmp     r4, #4
        orr     r0, r0, #1, 2
        str     r1, [sp, #0xE4]
        bge     LCFN3
        cmp     r4, #0
        ble     LCFN2
        ldr     r6, [pc, #0xF8C]
        ldr     r5, [pc, #0xF8C]
        sub     r9, r0, #1, 10
        str     r9, [sp, #0x144]
        ldr     r10, [sp, #0xDC]
        ldr     r11, [sp, #0xE0]
LCFN0:
        ldr     r0, [r11], #4
        bl      __extendsfdf2
        mov     r8, r0
        mov     r7, r1
        mov     r2, r5
        mov     r3, r6
        bl      __gtdf2
        cmp     r0, #0
        strgt   r9, [r10]
        bgt     LCFN1
        mov     r1, r7
        mov     r0, r8
        bl      exp
        bl      __truncdfsf2
        str     r0, [r10]
LCFN1:
        subs    r4, r4, #1
        add     r10, r10, #4
        bne     LCFN0
LCFN2:
        mov     r0, #0
        add     sp, sp, #0x56, 30
        ldmia   sp!, {r4 - r11, pc}
LCFN3:
        ldr     r1, [sp, #0xE4]
        eor     lr, r0, #1, 10
        str     lr, [sp, #0x144]
        str     r1, [sp, #0x140]
        str     r1, [sp, #0x148]
        str     r1, [sp, #0x14C]
        str     r1, [sp, #0x150]
        str     r1, [sp, #0x154]
        subs    r4, r4, #1
        str     r4, [sp, #0xD8]
        bmi     LCFN8
        ldr     r2, [sp, #0xD8]
        ldr     r1, [sp, #0xE0]
        ldr     r3, [sp, #0xDC]
        ldr     r5, [pc, #0xEF0]
        ldr     r4, [pc, #0xEF0]
        ldr     lr, [pc, #0xEF0]
        ldr     r12, [pc, #0xEF0]
        ldr     r7, [sp, #0xD8]
        add     r1, r1, r2, lsl #2
        add     r3, r3, r2, lsl #2
LCFN4:
        ldr     r6, [r1], #-4
        mvn     r2, #2, 2
        and     r8, r6, r2
        cmp     r8, #2, 10
        str     r6, [sp, #0x154]
        bic     r2, r6, r2
        ldrcc   r6, [r5]
        strcc   r6, [r3]
        bcc     LCFN7
        cmp     r2, #0
        beq     LCFN6
        cmp     r4, r6
        bhi     LCFN5
        mov     r8, #0xFF, 10
        orr     r8, r8, #1, 2
        and     r8, r6, r8
        cmp     r0, r8
        ldrne   r6, [sp, #0x140]
        strne   r6, [r3]
        ldreq   r6, [lr]
        streq   r6, [r3]
        b       LCFN7
LCFN5:
        str     r7, [sp, #0xD8]
        str     r2, [sp, #0xE4]
        b       LCFN8
LCFN6:
        cmp     r12, r6
        bhi     LCFN58
        mov     r8, #0xFF, 10
        orr     r8, r8, #1, 2
        and     r8, r6, r8
        cmp     r0, r8
        ldrne   r6, [sp, #0x144]
        strne   r6, [r3]
        bne     LCFN7
        ldr     r6, [lr]
        eor     r6, r6, #2, 2
        str     r6, [r3]
LCFN7:
        subs    r7, r7, #1
        sub     r3, r3, #4
        bpl     LCFN4
        str     r7, [sp, #0xD8]
        str     r2, [sp, #0xE4]
LCFN8:
        ldr     r0, [sp, #0xD8]
        ldr     r1, [sp, #0xE4]
        subs    r0, r0, #1
        str     r0, [sp, #8]
        add     r1, r9, r1
        movmi   r0, #0
        strmi   r0, [sp, #0xC]
        bmi     LCFN13
        ldr     r6, [pc, #0xE0C]
        ldr     r5, [pc, #0xE0C]
        ldr     r4, [pc, #0xE0C]
        ldr     lr, [pc, #0xE0C]
        mov     r0, #0xFF, 10
        orr     r3, r0, #1, 2
        ldr     r0, [sp, #8]
        ldr     r2, [sp, #0xE0]
        ldr     r12, [sp, #0xDC]
        ldr     r8, [sp, #8]
        add     r2, r2, r0, lsl #2
        add     r12, r12, r0, lsl #2
LCFN9:
        ldr     r7, [r2], #-4
        mvn     r11, #2, 2
        and     r0, r7, r11
        cmp     r0, #2, 10
        str     r7, [sp, #0x150]
        bic     r0, r7, r11
        ldrcc   r7, [r6]
        strcc   r7, [r12]
        bcc     LCFN12
        cmp     r0, #0
        beq     LCFN11
        cmp     r5, r7
        bhi     LCFN10
        mov     r10, #0xFF, 10
        orr     r10, r10, #1, 2
        and     r10, r7, r10
        cmp     r3, r10
        ldrne   r7, [sp, #0x140]
        strne   r7, [r12]
        ldreq   r7, [r4]
        streq   r7, [r12]
        b       LCFN12
LCFN10:
        str     r0, [sp, #0xC]
        str     r8, [sp, #8]
        b       LCFN13
LCFN11:
        cmp     lr, r7
        bhi     LCFN57
        mov     r10, #0xFF, 10
        orr     r10, r10, #1, 2
        and     r10, r7, r10
        cmp     r3, r10
        ldrne   r7, [sp, #0x144]
        strne   r7, [r12]
        bne     LCFN12
        ldr     r7, [r4]
        eor     r7, r7, #2, 2
        str     r7, [r12]
LCFN12:
        subs    r8, r8, #1
        sub     r12, r12, #4
        bpl     LCFN9
        str     r0, [sp, #0xC]
        str     r8, [sp, #8]
LCFN13:
        ldr     r0, [sp, #8]
        ldr     r2, [sp, #0xC]
        subs    r0, r0, #1
        str     r0, [sp, #0x20]
        add     r2, r9, r2
        movmi   r0, #0
        strmi   r0, [sp, #0x24]
        bmi     LCFN18
        ldr     r6, [pc, #0xD14]
        ldr     r5, [pc, #0xD14]
        ldr     r4, [pc, #0xD14]
        ldr     lr, [pc, #0xD14]
        mov     r0, #0xFF, 10
        orr     r3, r0, #1, 2
        ldr     r12, [sp, #0x20]
        ldr     r0, [sp, #0xE0]
        ldr     r7, [sp, #0xDC]
        str     r9, [sp]
        ldr     r9, [sp, #0x20]
        add     r0, r0, r12, lsl #2
        add     r12, r7, r12, lsl #2
LCFN14:
        ldr     r8, [r0], #-4
        mvn     r7, #2, 2
        and     r11, r8, r7
        cmp     r11, #2, 10
        str     r8, [sp, #0x14C]
        bic     r7, r8, r7
        ldrcc   r8, [r6]
        strcc   r8, [r12]
        bcc     LCFN17
        cmp     r7, #0
        beq     LCFN16
        cmp     r5, r8
        bhi     LCFN15
        mov     r10, #0xFF, 10
        orr     r10, r10, #1, 2
        and     r10, r8, r10
        cmp     r3, r10
        ldrne   r8, [sp, #0x140]
        strne   r8, [r12]
        ldreq   r8, [r4]
        streq   r8, [r12]
        b       LCFN17
LCFN15:
        str     r9, [sp, #0x20]
        ldr     r9, [sp]
        str     r7, [sp, #0x24]
        b       LCFN18
LCFN16:
        cmp     lr, r8
        bhi     LCFN56
        mov     r10, #0xFF, 10
        orr     r10, r10, #1, 2
        and     r10, r8, r10
        cmp     r3, r10
        ldrne   r8, [sp, #0x144]
        strne   r8, [r12]
        bne     LCFN17
        ldr     r8, [r4]
        eor     r8, r8, #2, 2
        str     r8, [r12]
LCFN17:
        subs    r9, r9, #1
        sub     r12, r12, #4
        bpl     LCFN14
        str     r9, [sp, #0x20]
        ldr     r9, [sp]
        str     r7, [sp, #0x24]
LCFN18:
        ldr     r0, [sp, #0x20]
        subs    r8, r0, #1
        ldr     r0, [sp, #0x24]
        add     r0, r9, r0
        movmi   r7, #0
        bmi     LCFN23
        ldr     r10, [pc, #0xC18]
        ldr     r6, [pc, #0xC18]
        ldr     r5, [pc, #0xC18]
        ldr     r4, [pc, #0xC18]
        mov     r3, #0xFF, 10
        orr     lr, r3, #1, 2
        ldr     r3, [sp, #0xE0]
        str     r1, [sp, #4]
        str     r9, [sp]
        add     r12, r3, r8, lsl #2
        ldr     r3, [sp, #0xDC]
        add     r3, r3, r8, lsl #2
LCFN19:
        ldr     r1, [r12], #-4
        mvn     r11, #2, 2
        and     r7, r1, r11
        cmp     r7, #2, 10
        str     r1, [sp, #0x148]
        bic     r7, r1, r11
        ldrcc   r1, [r10]
        strcc   r1, [r3]
        bcc     LCFN22
        cmp     r7, #0
        beq     LCFN21
        cmp     r6, r1
        bhi     LCFN20
        mov     r9, #0xFF, 10
        orr     r9, r9, #1, 2
        and     r9, r1, r9
        cmp     lr, r9
        ldrne   r1, [sp, #0x140]
        strne   r1, [r3]
        ldreq   r1, [r5]
        streq   r1, [r3]
        b       LCFN22
LCFN20:
        ldr     r1, [sp, #4]
        ldr     r9, [sp]
        b       LCFN23
LCFN21:
        cmp     r4, r1
        bhi     LCFN55
        mov     r9, #0xFF, 10
        orr     r9, r9, #1, 2
        and     r9, r1, r9
        cmp     lr, r9
        ldrne   r1, [sp, #0x144]
        strne   r1, [r3]
        bne     LCFN22
        ldr     r1, [r5]
        eor     r1, r1, #2, 2
        str     r1, [r3]
LCFN22:
        subs    r8, r8, #1
        sub     r3, r3, #4
        bpl     LCFN19
        ldr     r1, [sp, #4]
        ldr     r9, [sp]
LCFN23:
        cmp     r8, #0
        add     r10, r9, r7
        blt     LCFN46
        ldr     r3, [pc, #0xB3C]
        ldr     r4, [sp, #0x154]
        ldr     r6, [sp, #0x144]
        ldr     r3, [r3]
        ldr     r5, [sp, #0x148]
        str     r4, [sp, #0x10]
        ldr     r4, [sp, #0x150]
        ldr     r11, [pc, #0xB18]
        eor     r12, r3, #2, 2
        mov     lr, #0xFF, 10
        str     r4, [sp, #0x1C]
        ldr     r4, [sp, #0x14C]
        orr     lr, lr, #1, 2
        str     r4, [sp, #0x18]
        ldr     r11, [r11]
        ldr     r4, [sp, #0x140]
        str     r11, [sp, #0x14]
        str     r10, [sp, #0xF4]
        str     r0, [sp, #0xFC]
        str     r2, [sp, #0x104]
        str     r1, [sp, #0x10C]
        str     lr, [sp, #0x3C]
        str     r4, [sp, #0x38]
        str     r12, [sp, #0x34]
        str     r3, [sp, #0x30]
        str     r5, [sp, #0x4C]
        str     r6, [sp, #0x2C]
        str     r10, [sp, #0x48]
        str     r0, [sp, #0x44]
        str     r2, [sp, #0x40]
        str     r1, [sp, #4]
LCFN24:
        ldr     r0, [sp, #0x10]
        bl      __extendsfdf2
        ldr     r5, [pc, #0xAC0]
        ldr     r4, [pc, #0xAC0]
        str     r0, [sp, #0xD4]
        ldr     r0, [sp, #0xD4]
        str     r1, [sp, #0xD0]
        mov     r3, r4
        mov     r2, r5
        bl      __muldf3
        mov     r10, r0
        ldr     r0, [sp, #0x1C]
        mov     r6, r1
        bl      __extendsfdf2
        str     r0, [sp, #0xCC]
        ldr     r0, [sp, #0xCC]
        str     r1, [sp, #0xC8]
        mov     r3, r4
        mov     r2, r5
        bl      __muldf3
        ldr     r12, [sp, #0x108]
        ldr     r11, [sp, #0x10C]
        str     r12, [sp, #0xC4]
        ldr     r2, [sp, #0xC4]
        str     r0, [sp, #0xC0]
        str     r1, [sp, #0xBC]
        mov     r3, r11
        mov     r1, r6
        mov     r0, r10
        bl      __adddf3
        ldr     r6, [sp, #0x100]
        ldr     r10, [sp, #0x104]
        str     r0, [sp, #0xB8]
        str     r0, [sp, #0x128]
        str     r1, [sp, #0xB4]
        str     r1, [sp, #0x12C]
        ldr     r0, [sp, #0xC0]
        ldr     r1, [sp, #0xBC]
        mov     r2, r6
        mov     r3, r10
        bl      __adddf3
        ldr     r2, [sp, #0x128]
        str     r0, [sp, #0x50]
        mov     r3, r11
        str     r2, [sp, #0x54]
        str     r0, [sp, #0x120]
        str     r1, [sp, #0xC0]
        str     r1, [sp, #0x124]
        ldr     r1, [sp, #0xB4]
        ldr     r2, [sp, #0xC4]
        ldr     r0, [sp, #0xB8]
        bl      __subdf3
        str     r0, [sp, #0xC4]
        ldr     r0, [sp, #0x50]
        str     r1, [sp, #0xBC]
        ldr     r1, [sp, #0xC0]
        mov     r2, r6
        mov     r3, r10
        bl      __subdf3
        str     r0, [sp, #0xC0]
        ldr     r0, [sp, #0x18]
        str     r1, [sp, #0xB8]
        bl      __extendsfdf2
        str     r0, [sp, #0xB4]
        ldr     r0, [sp, #0xB4]
        str     r1, [sp, #0xB0]
        mov     r3, r4
        mov     r2, r5
        bl      __muldf3
        str     r0, [sp, #0xAC]
        ldr     r0, [sp, #0x4C]
        mov     r6, r1
        bl      __extendsfdf2
        str     r0, [sp, #0xA8]
        ldr     r0, [sp, #0xA8]
        str     r1, [sp, #0xA4]
        mov     r3, r4
        mov     r2, r5
        bl      __muldf3
        ldr     r2, [sp, #0xF8]
        ldr     r4, [sp, #0xFC]
        str     r0, [sp, #0x9C]
        str     r2, [sp, #0xA0]
        ldr     r0, [sp, #0xAC]
        ldr     r2, [sp, #0xA0]
        str     r1, [sp, #0x98]
        mov     r3, r4
        mov     r1, r6
        bl      __adddf3
        ldr     r6, [sp, #0xF0]
        ldr     r5, [sp, #0xF4]
        str     r0, [sp, #0xAC]
        str     r0, [sp, #0x118]
        str     r1, [sp, #0x94]
        str     r1, [sp, #0x11C]
        ldr     r0, [sp, #0x9C]
        ldr     r1, [sp, #0x98]
        mov     r2, r6
        mov     r3, r5
        bl      __adddf3
        ldr     r2, [sp, #0x118]
        mov     r10, r0
        str     r10, [sp, #0x58]
        mov     r11, r1
        str     r2, [sp, #0x5C]
        str     r10, [sp, #0x110]
        str     r11, [sp, #0x114]
        ldr     r0, [sp, #0xAC]
        ldr     r1, [sp, #0x94]
        ldr     r2, [sp, #0xA0]
        mov     r3, r4
        bl      __subdf3
        str     r1, [sp, #0xA0]
        str     r0, [sp, #0xAC]
        mov     r0, r10
        mov     r3, r5
        mov     r2, r6
        mov     r1, r11
        bl      __subdf3
        ldr     r5, [pc, #0x8F4]
        ldr     r6, [pc, #0x8F4]
        mov     r10, r0
        ldr     r0, [sp, #0xC4]
        mov     r11, r1
        ldr     r1, [sp, #0xBC]
        mov     r2, r5
        mov     r3, r6
        bl      __muldf3
        str     r0, [sp, #0xC4]
        mov     r4, r1
        ldr     r0, [sp, #0xC0]
        ldr     r1, [sp, #0xB8]
        mov     r2, r5
        mov     r3, r6
        bl      __muldf3
        str     r0, [sp, #0xC0]
        ldr     r0, [sp, #0xAC]
        str     r1, [sp, #0xBC]
        ldr     r1, [sp, #0xA0]
        mov     r2, r5
        mov     r3, r6
        bl      __muldf3
        str     r0, [sp, #0xB8]
        str     r1, [sp, #0xAC]
        mov     r2, r5
        mov     r3, r6
        mov     r0, r10
        mov     r1, r11
        bl      __muldf3
        ldr     r2, [sp, #0xC4]
        mov     r5, r0
        ldr     r0, [sp, #0xD4]
        mov     r6, r1
        ldr     r1, [sp, #0xD0]
        mov     r3, r4
        bl      __subdf3
        str     r0, [sp, #0xD4]
        ldr     r2, [sp, #0xC0]
        str     r1, [sp, #0xD0]
        ldr     r0, [sp, #0xCC]
        ldr     r1, [sp, #0xC8]
        ldr     r3, [sp, #0xBC]
        bl      __subdf3
        ldr     r3, [sp, #0xAC]
        mov     r10, r0
        ldr     r0, [sp, #0xB4]
        mov     r11, r1
        ldr     r1, [sp, #0xB0]
        ldr     r2, [sp, #0xB8]
        bl      __subdf3
        str     r0, [sp, #0xCC]
        ldr     r0, [sp, #0xA8]
        str     r1, [sp, #0xC8]
        ldr     r1, [sp, #0xA4]
        mov     r2, r5
        mov     r3, r6
        bl      __subdf3
        ldr     r2, [sp, #0xD4]
        ldr     r3, [sp, #0xD0]
        str     r0, [sp, #0xC4]
        str     r1, [sp, #0xC0]
        ldr     r1, [sp, #0xD0]
        mov     r0, r2
        bl      __muldf3
        str     r1, [sp, #0xB8]
        ldr     r1, [sp, #0xB8]
        str     r0, [sp, #0xBC]
        ldr     r0, [sp, #0xBC]
        mov     r12, #0x4E, 16
        orr     r4, r12, #1, 2
        sub     r6, r4, #0x2A, 16
        mov     r2, #0
        mov     r3, r6
        bl      __adddf3
        str     r0, [sp, #0xB4]
        str     r1, [sp, #0xB0]
        mov     r0, r10
        mov     r2, r10
        mov     r1, r11
        mov     r3, r11
        bl      __muldf3
        str     r0, [sp, #0xAC]
        ldr     r0, [sp, #0xAC]
        str     r1, [sp, #0xA8]
        mov     r2, #0
        mov     r3, r6
        bl      __adddf3
        str     r0, [sp, #0xA4]
        str     r1, [sp, #0xA0]
        ldr     r0, [sp, #0xB4]
        ldr     r1, [sp, #0xB0]
        sub     r5, r4, #0x26, 16
        mov     r3, r5
        mov     r2, #0
        bl      __muldf3
        str     r0, [sp, #0xB4]
        str     r1, [sp, #0xB0]
        ldr     r0, [sp, #0xA4]
        ldr     r1, [sp, #0xA0]
        mov     r3, r5
        mov     r2, #0
        bl      __muldf3
        ldr     r3, [sp, #0xB8]
        ldr     r2, [sp, #0xBC]
        str     r0, [sp, #0xA4]
        str     r1, [sp, #0xA0]
        mov     r0, #0
        mov     r1, r4
        bl      __adddf3
        ldr     r2, [sp, #0xAC]
        ldr     r3, [sp, #0xA8]
        str     r0, [sp, #0xBC]
        str     r1, [sp, #0xB8]
        mov     r0, #0
        mov     r1, r4
        bl      __adddf3
        str     r0, [sp, #0xAC]
        ldr     r0, [sp, #0xBC]
        ldr     r2, [sp, #0xD4]
        ldr     r3, [sp, #0xD0]
        str     r1, [sp, #0xA8]
        ldr     r1, [sp, #0xB8]
        bl      __muldf3
        str     r1, [sp, #0xD0]
        ldr     r1, [sp, #0xA8]
        str     r0, [sp, #0xD4]
        ldr     r0, [sp, #0xAC]
        mov     r3, r11
        mov     r2, r10
        bl      __muldf3
        str     r1, [sp, #0xB8]
        str     r0, [sp, #0xBC]
        ldr     r1, [sp, #0xB0]
        ldr     r0, [sp, #0xB4]
        ldr     r2, [sp, #0xD4]
        ldr     r3, [sp, #0xD0]
        bl      __adddf3
        ldr     r3, [sp, #0xB8]
        ldr     r2, [sp, #0xBC]
        str     r0, [sp, #0x60]
        ldr     r0, [sp, #0xA4]
        str     r1, [sp, #0x64]
        ldr     r1, [sp, #0xA0]
        bl      __adddf3
        ldr     r3, [sp, #0xC8]
        str     r0, [sp, #0x68]
        ldr     r0, [sp, #0xCC]
        str     r1, [sp, #0x6C]
        ldr     r1, [sp, #0xC8]
        mov     r2, r0
        bl      __muldf3
        mov     r10, r0
        str     r1, [sp, #0xAC]
        mov     r2, #0
        mov     r3, r6
        bl      __adddf3
        ldr     r3, [sp, #0xC0]
        str     r0, [sp, #0xA8]
        ldr     r0, [sp, #0xC4]
        str     r1, [sp, #0x9C]
        ldr     r1, [sp, #0xC0]
        mov     r2, r0
        bl      __muldf3
        str     r1, [sp, #0x98]
        mov     r11, r0
        mov     r2, #0
        mov     r3, r6
        bl      __adddf3
        str     r0, [sp, #0x94]
        mov     r6, r1
        ldr     r0, [sp, #0xA8]
        ldr     r1, [sp, #0x9C]
        mov     r3, r5
        mov     r2, #0
        bl      __muldf3
        str     r0, [sp, #0xA8]
        ldr     r0, [sp, #0x94]
        str     r1, [sp, #0x9C]
        mov     r2, #0
        mov     r1, r6
        mov     r3, r5
        bl      __muldf3
        ldr     r3, [sp, #0xAC]
        str     r0, [sp, #0xE8]
        str     r1, [sp, #0xEC]
        mov     r0, #0
        mov     r1, r4
        mov     r2, r10
        bl      __adddf3
        ldr     r3, [sp, #0x98]
        mov     r6, r1
        mov     r5, r0
        mov     r2, r11
        mov     r0, #0
        mov     r1, r4
        bl      __adddf3
        ldr     r2, [sp, #0xCC]
        ldr     r3, [sp, #0xC8]
        str     r0, [sp, #0xAC]
        str     r1, [sp, #0x98]
        mov     r1, r6
        mov     r0, r5
        bl      __muldf3
        mov     r6, r1
        ldr     r3, [sp, #0xC0]
        ldr     r2, [sp, #0xC4]
        ldr     r1, [sp, #0x98]
        mov     r5, r0
        ldr     r0, [sp, #0xAC]
        bl      __muldf3
        mov     r10, r0
        ldr     r0, [sp, #0xA8]
        mov     r11, r1
        ldr     r1, [sp, #0x9C]
        mov     r2, r5
        mov     r3, r6
        bl      __adddf3
        str     r0, [sp, #0x70]
        ldr     r0, [sp, #0xE8]
        str     r1, [sp, #0x74]
        ldr     r1, [sp, #0xEC]
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        str     r1, [sp, #0x7C]
        str     r0, [sp, #0x78]
        ldr     r1, [sp, #0xB0]
        ldr     r2, [sp, #0xD4]
        ldr     r3, [sp, #0xD0]
        ldr     r0, [sp, #0xB4]
        bl      __subdf3
        str     r0, [sp, #0x80]
        str     r1, [sp, #0x84]
        ldr     r0, [sp, #0xA4]
        ldr     r2, [sp, #0xBC]
        ldr     r3, [sp, #0xB8]
        ldr     r1, [sp, #0xA0]
        bl      __subdf3
        str     r1, [sp, #0x8C]
        ldr     r1, [sp, #0x9C]
        str     r0, [sp, #0x88]
        ldr     r0, [sp, #0xA8]
        mov     r2, r5
        mov     r3, r6
        bl      __subdf3
        str     r0, [sp, #0x90]
        str     r1, [sp, #0x94]
        ldr     r0, [sp, #0xE8]
        ldr     r1, [sp, #0xEC]
        mov     r2, r10
        mov     r3, r11
        bl      __subdf3
        ldr     r2, [sp, #0x88]
        ldr     r3, [sp, #0x8C]
        mov     r11, r0
        str     r11, [sp, #0x98]
        ldr     r0, [sp, #0x80]
        mov     r10, r1
        ldr     r1, [sp, #0x84]
        str     r10, [sp, #0x9C]
        bl      __muldf3
        mov     r5, r0
        mov     r6, r1
        ldr     r0, [sp, #0x90]
        ldr     r1, [sp, #0x94]
        str     r5, [sp, #0xA0]
        str     r6, [sp, #0xA4]
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        str     r0, [sp, #0xA8]
        str     r1, [sp, #0xAC]
        mov     r2, r5
        mov     r3, r6
        bl      __muldf3
        mov     r3, r1
        mov     r2, r0
        sub     r1, r4, #0x5E, 16
        mov     r0, #0
        bl      __divdf3
        ldr     r2, [sp, #0xD8]
        str     r0, [sp, #0xB0]
        ldr     r0, [sp, #0xE4]
        str     r2, [sp, #0xC8]
        str     r0, [sp, #0xB8]
        ldr     r0, [sp, #0xC]
        subs    r2, r8, #1
        str     r2, [sp, #0xD8]
        str     r0, [sp, #0xBC]
        ldr     r0, [sp, #0x24]
        str     r1, [sp, #0xB4]
        str     r0, [sp, #0xC0]
        ldr     r0, [sp, #8]
        str     r7, [sp, #0xC4]
        str     r0, [sp, #0xCC]
        ldr     r0, [sp, #0x20]
        str     r8, [sp, #0xD4]
        str     r0, [sp, #0xD0]
        bmi     LCFN29
        ldr     r1, [sp, #0xD8]
        ldr     r0, [sp, #0xE0]
        ldr     r2, [sp, #0xDC]
        ldr     r3, [sp, #0x3C]
        ldr     r12, [pc, #0x420]
        add     r0, r0, r1, lsl #2
        add     r1, r2, r1, lsl #2
        str     r7, [sp, #0x28]
        str     r9, [sp]
        ldr     r2, [pc, #0x414]
        ldr     lr, [sp, #0x14]
        ldr     r4, [sp, #0x38]
        ldr     r5, [sp, #0x34]
        ldr     r6, [sp, #0x30]
        ldr     r7, [sp, #0x2C]
        ldr     r9, [sp, #0xD8]
LCFN25:
        ldr     r8, [r0], #-4
        mvn     r10, #2, 2
        and     r11, r8, r10
        cmp     r11, #2, 10
        str     r8, [sp, #0x154]
        bic     r10, r8, r10
        strcc   lr, [r1]
        bcc     LCFN28
        cmp     r10, #0
        beq     LCFN27
        cmp     r12, r8
        bhi     LCFN26
        mov     r11, #0xFF, 10
        orr     r11, r11, #1, 2
        and     r11, r8, r11
        cmp     r3, r11
        strne   r4, [r1]
        streq   r6, [r1]
        b       LCFN28
LCFN26:
        str     r10, [sp, #0xE4]
        ldr     r0, [sp, #0xE4]
        str     r9, [sp, #0xD8]
        ldr     r9, [sp]
        str     r7, [sp, #0x2C]
        ldr     r7, [sp, #0x28]
        add     r0, r9, r0
        str     r3, [sp, #0x3C]
        str     r4, [sp, #0x38]
        str     r5, [sp, #0x34]
        str     r6, [sp, #0x30]
        str     r8, [sp, #0x10]
        str     r0, [sp, #4]
        b       LCFN29
LCFN27:
        cmp     r2, r8
        bhi     LCFN54
        mov     r11, #0xFF, 10
        orr     r11, r11, #1, 2
        and     r11, r8, r11
        cmp     r3, r11
        strne   r7, [r1]
        streq   r5, [r1]
LCFN28:
        subs    r9, r9, #1
        sub     r1, r1, #4
        bpl     LCFN25
        str     r10, [sp, #0xE4]
        ldr     r0, [sp, #0xE4]
        str     r9, [sp, #0xD8]
        ldr     r9, [sp]
        str     r7, [sp, #0x2C]
        ldr     r7, [sp, #0x28]
        add     r0, r9, r0
        str     r3, [sp, #0x3C]
        str     r4, [sp, #0x38]
        str     r5, [sp, #0x34]
        str     r6, [sp, #0x30]
        str     r8, [sp, #0x10]
        str     r0, [sp, #4]
LCFN29:
        ldr     r0, [sp, #0xD8]
        subs    r0, r0, #1
        str     r0, [sp, #8]
        bmi     LCFN34
        ldr     r1, [sp, #8]
        ldr     r0, [sp, #0xE0]
        ldr     r2, [sp, #0xDC]
        ldr     r3, [sp, #0x3C]
        ldr     r12, [pc, #0x2EC]
        add     r0, r0, r1, lsl #2
        add     r1, r2, r1, lsl #2
        str     r7, [sp, #0x28]
        str     r9, [sp]
        ldr     r2, [pc, #0x2E0]
        ldr     lr, [sp, #0x14]
        ldr     r4, [sp, #0x38]
        ldr     r5, [sp, #0x34]
        ldr     r6, [sp, #0x30]
        ldr     r7, [sp, #0x2C]
        ldr     r9, [sp, #8]
LCFN30:
        ldr     r8, [r0], #-4
        mvn     r10, #2, 2
        and     r11, r8, r10
        cmp     r11, #2, 10
        str     r8, [sp, #0x150]
        bic     r10, r8, r10
        strcc   lr, [r1]
        bcc     LCFN33
        cmp     r10, #0
        beq     LCFN32
        cmp     r12, r8
        bhi     LCFN31
        mov     r11, #0xFF, 10
        orr     r11, r11, #1, 2
        and     r11, r8, r11
        cmp     r3, r11
        strne   r4, [r1]
        streq   r6, [r1]
        b       LCFN33
LCFN31:
        str     r10, [sp, #0xC]
        ldr     r0, [sp, #0xC]
        str     r9, [sp, #8]
        ldr     r9, [sp]
        str     r7, [sp, #0x2C]
        ldr     r7, [sp, #0x28]
        add     r0, r9, r0
        str     r3, [sp, #0x3C]
        str     r4, [sp, #0x38]
        str     r5, [sp, #0x34]
        str     r6, [sp, #0x30]
        str     r8, [sp, #0x1C]
        str     r0, [sp, #0x40]
        b       LCFN34
LCFN32:
        cmp     r2, r8
        bhi     LCFN53
        mov     r11, #0xFF, 10
        orr     r11, r11, #1, 2
        and     r11, r8, r11
        cmp     r3, r11
        strne   r7, [r1]
        streq   r5, [r1]
LCFN33:
        subs    r9, r9, #1
        sub     r1, r1, #4
        bpl     LCFN30
        str     r10, [sp, #0xC]
        ldr     r0, [sp, #0xC]
        str     r9, [sp, #8]
        ldr     r9, [sp]
        str     r7, [sp, #0x2C]
        ldr     r7, [sp, #0x28]
        add     r0, r9, r0
        str     r3, [sp, #0x3C]
        str     r4, [sp, #0x38]
        str     r5, [sp, #0x34]
        str     r6, [sp, #0x30]
        str     r8, [sp, #0x1C]
        str     r0, [sp, #0x40]
LCFN34:
        ldr     r0, [sp, #8]
        subs    r0, r0, #1
        str     r0, [sp, #0x20]
        bmi     LCFN39
        ldr     r1, [sp, #0x20]
        ldr     r0, [sp, #0xE0]
        ldr     r2, [sp, #0xDC]
        ldr     r3, [sp, #0x3C]
        ldr     r12, [pc, #0x1B8]
        add     r0, r0, r1, lsl #2
        add     r1, r2, r1, lsl #2
        str     r7, [sp, #0x28]
        str     r9, [sp]
        ldr     r2, [pc, #0x1AC]
        ldr     lr, [sp, #0x14]
        ldr     r4, [sp, #0x38]
        ldr     r5, [sp, #0x34]
        ldr     r6, [sp, #0x30]
        ldr     r7, [sp, #0x2C]
        ldr     r9, [sp, #0x20]
LCFN35:
        ldr     r8, [r0], #-4
        mvn     r10, #2, 2
        and     r11, r8, r10
        cmp     r11, #2, 10
        str     r8, [sp, #0x14C]
        bic     r10, r8, r10
        strcc   lr, [r1]
        bcc     LCFN38
        cmp     r10, #0
        beq     LCFN37
        cmp     r12, r8
        bhi     LCFN36
        mov     r11, #0xFF, 10
        orr     r11, r11, #1, 2
        and     r11, r8, r11
        cmp     r3, r11
        strne   r4, [r1]
        streq   r6, [r1]
        b       LCFN38
LCFN36:
        str     r10, [sp, #0x24]
        ldr     r0, [sp, #0x24]
        str     r9, [sp, #0x20]
        ldr     r9, [sp]
        str     r7, [sp, #0x2C]
        ldr     r7, [sp, #0x28]
        add     r0, r9, r0
        str     r3, [sp, #0x3C]
        str     r4, [sp, #0x38]
        str     r5, [sp, #0x34]
        str     r6, [sp, #0x30]
        str     r8, [sp, #0x18]
        str     r0, [sp, #0x44]
        b       LCFN39
LCFN37:
        cmp     r2, r8
        bhi     LCFN52
        mov     r11, #0xFF, 10
        orr     r11, r11, #1, 2
        and     r11, r8, r11
        cmp     r3, r11
        strne   r7, [r1]
        streq   r5, [r1]
LCFN38:
        subs    r9, r9, #1
        sub     r1, r1, #4
        bpl     LCFN35
        str     r10, [sp, #0x24]
        ldr     r0, [sp, #0x24]
        str     r9, [sp, #0x20]
        ldr     r9, [sp]
        str     r7, [sp, #0x2C]
        ldr     r7, [sp, #0x28]
        add     r0, r9, r0
        str     r3, [sp, #0x3C]
        str     r4, [sp, #0x38]
        str     r5, [sp, #0x34]
        str     r6, [sp, #0x30]
        str     r8, [sp, #0x18]
        str     r0, [sp, #0x44]
LCFN39:
        ldr     r0, [sp, #0x20]
        subs    r8, r0, #1
        bmi     LCFN44
        ldr     r0, [sp, #0xE0]
        ldr     r2, [pc, #0x9C]
        ldr     r3, [sp, #0x3C]
        add     r1, r0, r8, lsl #2
        ldr     r0, [sp, #0xDC]
        ldr     r12, [pc, #0x84]
        ldr     lr, [sp, #0x14]
        ldr     r4, [sp, #0x38]
        ldr     r5, [sp, #0x34]
        ldr     r6, [sp, #0x30]
        ldr     r10, [sp, #0x2C]
        add     r0, r0, r8, lsl #2
        str     r9, [sp]
LCFN40:
        ldr     r9, [r1], #-4
        mvn     r7, #2, 2
        and     r11, r9, r7
        cmp     r11, #2, 10
        str     r9, [sp, #0x148]
        bic     r7, r9, r7
        strcc   lr, [r0]
        bcc     LCFN43
        cmp     r7, #0
        beq     LCFN42
        cmp     r12, r9
        bhi     LCFN41
        mov     r11, #0xFF, 10
        orr     r11, r11, #1, 2
        and     r11, r9, r11
        cmp     r3, r11
        strne   r4, [r0]
        streq   r6, [r0]
        b       LCFN43
        .long   LCFN_c3.3620.0.0.0
        .long   LCFN_c1.3620.0.0.0
        .long   LCFN_c2.3620.0.0.0
        .long   LCFN_c4.3620.0.0.0
        .long   LCFN_coef.3620.0.0.0
        .long   0x40562e43
        .long   0x02b40f67
        .long   LCFN__2il0floatpacket.1
        .long   0xc2aeac50
        .long   ippConstantOfNAN_32f
        .long   0x42b17218
        .long   0x652b82fe
        .long   0x3ff71547
        .long   0xfefa39ef
        .long   0x3fe62e42
LCFN41:
        str     r9, [sp, #0x4C]
        ldr     r9, [sp]
        str     r3, [sp, #0x3C]
        str     r4, [sp, #0x38]
        add     r0, r9, r7
        str     r5, [sp, #0x34]
        str     r6, [sp, #0x30]
        str     r10, [sp, #0x2C]
        str     r0, [sp, #0x48]
        b       LCFN44
LCFN42:
        cmp     r2, r9
        bhi     LCFN51
        mov     r11, #0xFF, 10
        orr     r11, r11, #1, 2
        and     r11, r9, r11
        cmp     r3, r11
        strne   r10, [r0]
        streq   r5, [r0]
LCFN43:
        subs    r8, r8, #1
        sub     r0, r0, #4
        bpl     LCFN40
        str     r9, [sp, #0x4C]
        ldr     r9, [sp]
        str     r3, [sp, #0x3C]
        str     r4, [sp, #0x38]
        add     r0, r9, r7
        str     r5, [sp, #0x34]
        str     r6, [sp, #0x30]
        str     r10, [sp, #0x2C]
        str     r0, [sp, #0x48]
LCFN44:
        ldr     r2, [sp, #0xA8]
        ldr     r3, [sp, #0xAC]
        ldr     r4, [sp, #0xB0]
        ldr     r5, [sp, #0xB4]
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        ldr     r2, [sp, #0xA0]
        ldr     r3, [sp, #0xA4]
        mov     r6, r0
        mov     r10, r1
        mov     r1, r5
        mov     r0, r4
        bl      __muldf3
        ldr     r2, [sp, #0x88]
        ldr     r3, [sp, #0x8C]
        mov     r5, r0
        mov     r4, r1
        mov     r0, r6
        mov     r1, r10
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r1, [sp, #0x64]
        mov     r11, r0
        ldr     r0, [sp, #0x60]
        bl      __truncdfsf2
        mov     r1, r11
        bl      __mulsf3
        ldr     r2, [sp, #0x80]
        str     r0, [sp, #0x13C]
        ldr     r3, [sp, #0x84]
        mov     r0, r6
        mov     r1, r10
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r1, [sp, #0x6C]
        mov     r6, r0
        ldr     r0, [sp, #0x68]
        bl      __truncdfsf2
        mov     r1, r6
        bl      __mulsf3
        ldr     r2, [sp, #0x98]
        str     r0, [sp, #0x138]
        ldr     r3, [sp, #0x9C]
        mov     r1, r4
        mov     r0, r5
        bl      __muldf3
        bl      __truncdfsf2
        mov     r6, r0
        ldr     r0, [sp, #0x70]
        ldr     r1, [sp, #0x74]
        bl      __truncdfsf2
        mov     r1, r6
        bl      __mulsf3
        mov     r1, r0
        str     r1, [sp, #0x134]
        ldr     r2, [sp, #0x90]
        ldr     r3, [sp, #0x94]
        mov     r1, r4
        mov     r0, r5
        bl      __muldf3
        bl      __truncdfsf2
        mov     r4, r0
        ldr     r0, [sp, #0x78]
        ldr     r1, [sp, #0x7C]
        bl      __truncdfsf2
        mov     r1, r4
        bl      __mulsf3
        ldr     r3, [sp, #0xB8]
        ldr     r1, [sp, #0x13C]
        cmp     r3, #0
        str     r0, [sp, #0x130]
        ldreq   r0, [sp, #0x54]
        addeq   r1, r1, r0, lsl #23
        ldrne   r0, [sp, #0x54]
        subne   r1, r1, r0, lsl #23
        ldr     r2, [sp, #0xBC]
        ldr     r0, [sp, #0x138]
        str     r1, [sp, #0x13C]
        cmp     r2, #0
        ldreq   r1, [sp, #0x50]
        addeq   r1, r0, r1, lsl #23
        ldrne   r1, [sp, #0x50]
        subne   r1, r0, r1, lsl #23
        ldr     r2, [sp, #0xC0]
        ldr     r0, [sp, #0x134]
        str     r1, [sp, #0x138]
        cmp     r2, #0
        ldreq   r1, [sp, #0x5C]
        addeq   r1, r0, r1, lsl #23
        ldrne   r1, [sp, #0x5C]
        subne   r1, r0, r1, lsl #23
        ldr     r2, [sp, #0xC4]
        ldr     r0, [sp, #0x130]
        str     r1, [sp, #0x134]
        cmp     r2, #0
        ldreq   r1, [sp, #0x58]
        addeq   r0, r0, r1, lsl #23
        ldrne   r1, [sp, #0x58]
        subne   r0, r0, r1, lsl #23
        ldr     r1, [sp, #0xDC]
        ldr     r4, [sp, #0xC8]
        ldr     lr, [sp, #0x13C]
        ldr     r12, [sp, #0x138]
        ldr     r2, [sp, #0x134]
        str     lr, [r1, +r4, lsl #2]
        ldr     lr, [sp, #0xCC]
        cmp     r8, #0
        str     r12, [r1, +lr, lsl #2]
        ldr     r12, [sp, #0xD0]
        str     r0, [sp, #0x130]
        str     r2, [r1, +r12, lsl #2]
        ldr     r2, [sp, #0xD4]
        str     r0, [r1, +r2, lsl #2]
        blt     LCFN46
        ldr     r3, [sp, #0x48]
        str     r3, [sp, #0xF4]
        ldr     r3, [sp, #0x44]
        str     r3, [sp, #0xFC]
        ldr     r2, [sp, #0x40]
        str     r2, [sp, #0x104]
        ldr     r1, [sp, #4]
        str     r1, [sp, #0x10C]
        b       LCFN24
LCFN45:
        mvn     r0, #5
        add     sp, sp, #0x56, 30
        ldmia   sp!, {r4 - r11, pc}
LCFN46:
        ldr     r0, [sp, #0xD8]
        cmp     r0, #0
        blt     LCFN50
        ldr     r0, [sp, #0x154]
        bl      __extendsfdf2
        ldr     r5, [pc, #-0x2B4]
        ldr     r4, [pc, #-0x2BC]
        mov     r6, r0
        mov     r7, r1
        mov     r2, r5
        mov     r3, r4
        bl      __gtdf2
        cmp     r0, #0
        ldrgt   r0, [sp, #0x144]
        bgt     LCFN47
        mov     r1, r7
        mov     r0, r6
        bl      exp
        bl      __truncdfsf2
LCFN47:
        ldr     r1, [sp, #0xD8]
        ldr     r12, [sp, #0xDC]
        str     r0, [r12, +r1, lsl #2]
        ldr     r0, [sp, #8]
        cmp     r0, #0
        blt     LCFN50
        ldr     r0, [sp, #0x150]
        bl      __extendsfdf2
        mov     r6, r0
        mov     r7, r1
        mov     r2, r5
        mov     r3, r4
        bl      __gtdf2
        cmp     r0, #0
        ldrgt   r0, [sp, #0x144]
        bgt     LCFN48
        mov     r1, r7
        mov     r0, r6
        bl      exp
        bl      __truncdfsf2
LCFN48:
        ldr     r1, [sp, #8]
        ldr     r12, [sp, #0xDC]
        str     r0, [r12, +r1, lsl #2]
        ldr     r0, [sp, #0x20]
        cmp     r0, #0
        blt     LCFN50
        ldr     r0, [sp, #0x14C]
        bl      __extendsfdf2
        mov     r6, r0
        mov     r7, r1
        mov     r2, r5
        mov     r3, r4
        bl      __gtdf2
        cmp     r0, #0
        ble     LCFN49
        ldr     r0, [sp, #0x20]
        ldr     r1, [sp, #0xDC]
        ldr     r2, [sp, #0x144]
        str     r2, [r1, +r0, lsl #2]
        mov     r0, #0
        add     sp, sp, #0x56, 30
        ldmia   sp!, {r4 - r11, pc}
LCFN49:
        mov     r1, r7
        mov     r0, r6
        bl      exp
        bl      __truncdfsf2
        ldr     r1, [sp, #0x20]
        ldr     r2, [sp, #0xDC]
        str     r0, [r2, +r1, lsl #2]
LCFN50:
        mov     r0, #0
        add     sp, sp, #0x56, 30
        ldmia   sp!, {r4 - r11, pc}
LCFN51:
        str     r9, [sp, #0x4C]
        ldr     r9, [sp]
        str     r3, [sp, #0x3C]
        str     r4, [sp, #0x38]
        add     r0, r9, r7
        str     r5, [sp, #0x34]
        str     r6, [sp, #0x30]
        str     r10, [sp, #0x2C]
        str     r0, [sp, #0x48]
        b       LCFN44
LCFN52:
        str     r10, [sp, #0x24]
        ldr     r0, [sp, #0x24]
        str     r9, [sp, #0x20]
        ldr     r9, [sp]
        str     r7, [sp, #0x2C]
        ldr     r7, [sp, #0x28]
        add     r0, r9, r0
        str     r3, [sp, #0x3C]
        str     r4, [sp, #0x38]
        str     r5, [sp, #0x34]
        str     r6, [sp, #0x30]
        str     r8, [sp, #0x18]
        str     r0, [sp, #0x44]
        b       LCFN39
LCFN53:
        str     r10, [sp, #0xC]
        ldr     r0, [sp, #0xC]
        str     r9, [sp, #8]
        ldr     r9, [sp]
        str     r7, [sp, #0x2C]
        ldr     r7, [sp, #0x28]
        add     r0, r9, r0
        str     r3, [sp, #0x3C]
        str     r4, [sp, #0x38]
        str     r5, [sp, #0x34]
        str     r6, [sp, #0x30]
        str     r8, [sp, #0x1C]
        str     r0, [sp, #0x40]
        b       LCFN34
LCFN54:
        str     r10, [sp, #0xE4]
        ldr     r0, [sp, #0xE4]
        str     r9, [sp, #0xD8]
        ldr     r9, [sp]
        str     r7, [sp, #0x2C]
        ldr     r7, [sp, #0x28]
        add     r0, r9, r0
        str     r3, [sp, #0x3C]
        str     r4, [sp, #0x38]
        str     r5, [sp, #0x34]
        str     r6, [sp, #0x30]
        str     r8, [sp, #0x10]
        str     r0, [sp, #4]
        b       LCFN29
LCFN55:
        ldr     r1, [sp, #4]
        ldr     r9, [sp]
        b       LCFN23
LCFN56:
        str     r9, [sp, #0x20]
        ldr     r9, [sp]
        str     r7, [sp, #0x24]
        b       LCFN18
LCFN57:
        str     r0, [sp, #0xC]
        str     r8, [sp, #8]
        b       LCFN13
LCFN58:
        str     r7, [sp, #0xD8]
        str     r2, [sp, #0xE4]
        b       LCFN8
LCFN59:
        mvn     r0, #7
        add     sp, sp, #0x56, 30
        ldmia   sp!, {r4 - r11, pc}


        .data
        .align  4


LCFN__2il0floatpacket.1:
        .byte   0x00,0x00,0x80,0x3F,0x00,0x00,0x00,0x00
LCFN_c1.3620.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LCFN_c2.3620.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LCFN_c3.3620.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LCFN_c4.3620.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LCFN_coef.3620.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x30,0x43


