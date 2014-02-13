        .text
        .align  4
        .globl  _ippsExp_64f_I


_ippsExp_64f_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x7D, 30
        mov     r8, r0
        cmp     r8, #0
        mov     r4, r1
        beq     LCFJ62
        cmp     r4, #1
        blt     LCFJ44
        ldr     r3, [pc, #0xF18]
        ldr     r0, [pc, #0xF18]
        ldr     r12, [pc, #0xF18]
        ldr     r11, [r3]
        ldr     r9, [pc, #0xF14]
        ldr     lr, [pc, #0xF14]
        ldr     r5, [pc, #0xF14]
        ldr     r6, [pc, #0xF14]
        ldr     r7, [pc, #0xF14]
        ldr     r2, [pc, #0xF14]
        ldr     r3, [pc, #0xF14]
        ldr     r10, [r9]
        ldr     r0, [r0]
        ldr     r12, [r12]
        ldr     lr, [lr]
        ldr     r5, [r5]
        ldr     r6, [r6]
        ldr     r7, [r7]
        ldr     r2, [r2]
        ldr     r3, [r3]
        ldr     r1, [pc, #0xEF0]
        ldr     r9, [pc, #0xEF0]
        str     r0, [sp, #8]
        ldr     r1, [r1]
        cmp     r4, #4
        ldr     r0, [r9]
        ldr     r9, [pc, #0xEE0]
        str     r1, [sp, #4]
        ldr     r1, [pc, #0xEDC]
        ldr     r1, [r1]
        str     r1, [sp, #0x14]
        ldr     r1, [pc, #0xED4]
        ldr     r1, [r1]
        str     r1, [sp, #0x10]
        ldr     r1, [pc, #0xECC]
        ldr     r1, [r1]
        str     r1, [sp, #0x2C]
        ldr     r1, [pc, #0xEC4]
        ldr     r1, [r1]
        str     r1, [sp, #0x30]
        ldr     r9, [r9]
        str     r9, [sp]
        ldr     r9, [pc, #0xEB4]
        ldr     r9, [r9]
        str     r9, [sp, #0xC]
        ldr     r9, [pc, #0xEAC]
        str     r12, [sp, #0x17C]
        str     lr, [sp, #0x174]
        ldr     r9, [r9]
        str     r5, [sp, #0x16C]
        str     r6, [sp, #0x164]
        str     r7, [sp, #0x1EC]
        str     r10, [sp, #0x1E4]
        str     r11, [sp, #0x1DC]
        str     r2, [sp, #0x1D4]
        str     r3, [sp, #0x1C4]
        str     r0, [sp, #0x1CC]
        bge     LCFJ2
        cmp     r4, #0
        ble     LCFJ1
        sub     r8, r8, #4
LCFJ0:
        ldr     r0, [r8, #4]
        ldr     r1, [r8, #8]
        bl      exp
        str     r0, [r8, #4]
        str     r1, [r8, #8]!
        subs    r4, r4, #1
        bne     LCFJ0
LCFJ1:
        mov     r0, #0
        add     sp, sp, #0x7D, 30
        ldmia   sp!, {r4 - r11, pc}
LCFJ2:
        ldr     r12, [sp, #0xC]
        subs    r7, r4, #1
        str     r12, [sp, #0x1D0]
        ldr     r12, [sp]
        str     r12, [sp, #0x1C8]
        ldr     r3, [sp, #0x10]
        str     r3, [sp, #0x1D8]
        ldr     lr, [sp, #0x14]
        str     lr, [sp, #0x1E0]
        ldr     r1, [sp, #4]
        str     r1, [sp, #0x1E8]
        ldr     r1, [sp, #8]
        str     r1, [sp, #0x1F0]
        movmi   r1, #0
        strmi   r1, [sp, #0x40]
        bmi     LCFJ8
        ldr     r3, [pc, #0xE08]
        ldr     lr, [sp, #0x30]
        ldr     r4, [sp, #0x2C]
        mvn     r12, #2, 2
        add     r2, r8, r7, lsl #3
LCFJ3:
        ldr     r6, [r2]
        ldr     r5, [r2, #4]
        str     r6, [sp, #0x1EC]
        and     r6, r5, r12
        cmp     r6, lr
        str     r5, [sp, #0x1F0]
        bic     r1, r5, r12
        bcc     LCFJ61
        cmp     r1, #0
        beq     LCFJ5
        tst     r5, #2, 14
        beq     LCFJ4
        ldr     r5, [r3]
        ldr     r6, [r3, #4]
        str     r5, [r2]
        str     r6, [r2, #4]
        b       LCFJ7
LCFJ4:
        ldr     r5, [sp, #0x1CC]
        ldr     r6, [sp, #0x1D0]
        str     r5, [r2]
        str     r6, [r2, #4]
        b       LCFJ7
LCFJ5:
        cmp     r5, r4
        bcc     LCFJ60
        tst     r5, #2, 14
        beq     LCFJ6
        ldr     r6, [r3, #4]
        ldr     r5, [r3]
        eor     r6, r6, #2, 2
        str     r6, [r2, #4]
        str     r5, [r2]
        b       LCFJ7
LCFJ6:
        ldr     r5, [sp, #0x1C4]
        ldr     r6, [sp, #0x1C8]
        str     r5, [r2]
        str     r6, [r2, #4]
LCFJ7:
        subs    r7, r7, #1
        sub     r2, r2, #8
        bpl     LCFJ3
        str     r1, [sp, #0x40]
LCFJ8:
        ldr     r2, [sp, #0x40]
        subs    r1, r7, #1
        str     r1, [sp, #0x34]
        add     r3, r9, r2
        movmi   r1, #0
        strmi   r1, [sp, #0x48]
        bmi     LCFJ14
        ldr     r1, [sp, #0x34]
        ldr     lr, [pc, #0xD34]
        ldr     r4, [sp, #0x34]
        ldr     r5, [sp, #0x30]
        ldr     r6, [sp, #0x2C]
        add     r2, r8, r1, lsl #3
LCFJ9:
        ldr     r1, [r2]
        ldr     r12, [r2, #4]
        mvn     r10, #2, 2
        str     r1, [sp, #0x1E4]
        and     r1, r12, r10
        cmp     r1, r5
        str     r12, [sp, #0x1E8]
        bic     r1, r12, r10
        bcc     LCFJ59
        cmp     r1, #0
        beq     LCFJ11
        tst     r12, #2, 14
        beq     LCFJ10
        ldr     r12, [lr]
        ldr     r10, [lr, #4]
        str     r12, [r2]
        str     r10, [r2, #4]
        b       LCFJ13
LCFJ10:
        ldr     r12, [sp, #0x1CC]
        ldr     r10, [sp, #0x1D0]
        str     r12, [r2]
        str     r10, [r2, #4]
        b       LCFJ13
LCFJ11:
        cmp     r12, r6
        bcc     LCFJ58
        tst     r12, #2, 14
        beq     LCFJ12
        ldr     r10, [lr, #4]
        ldr     r12, [lr]
        eor     r10, r10, #2, 2
        str     r10, [r2, #4]
        str     r12, [r2]
        b       LCFJ13
LCFJ12:
        ldr     r12, [sp, #0x1C4]
        ldr     r10, [sp, #0x1C8]
        str     r12, [r2]
        str     r10, [r2, #4]
LCFJ13:
        subs    r4, r4, #1
        sub     r2, r2, #8
        bpl     LCFJ9
        str     r1, [sp, #0x48]
        str     r4, [sp, #0x34]
LCFJ14:
        ldr     r1, [sp, #0x34]
        ldr     r2, [sp, #0x48]
        subs    r1, r1, #1
        str     r1, [sp, #0x38]
        add     r12, r9, r2
        movmi   r1, #0
        strmi   r1, [sp, #0x44]
        bmi     LCFJ20
        ldr     r1, [sp, #0x38]
        ldr     r2, [pc, #0xC54]
        ldr     lr, [sp, #0x38]
        ldr     r4, [sp, #0x30]
        ldr     r5, [sp, #0x2C]
        add     r1, r8, r1, lsl #3
        str     r8, [sp, #0x5C]
LCFJ15:
        ldr     r10, [r1]
        ldr     r0, [r1, #4]
        mvn     r8, #2, 2
        str     r10, [sp, #0x1DC]
        and     r10, r0, r8
        cmp     r10, r4
        str     r0, [sp, #0x1E0]
        bic     r8, r0, r8
        bcc     LCFJ57
        cmp     r8, #0
        beq     LCFJ17
        tst     r0, #2, 14
        beq     LCFJ16
        ldr     r0, [r2]
        ldr     r6, [r2, #4]
        str     r0, [r1]
        str     r6, [r1, #4]
        b       LCFJ19
LCFJ16:
        ldr     r0, [sp, #0x1CC]
        ldr     r6, [sp, #0x1D0]
        str     r0, [r1]
        str     r6, [r1, #4]
        b       LCFJ19
LCFJ17:
        cmp     r0, r5
        bcc     LCFJ56
        tst     r0, #2, 14
        beq     LCFJ18
        ldr     r6, [r2, #4]
        ldr     r0, [r2]
        eor     r6, r6, #2, 2
        str     r6, [r1, #4]
        str     r0, [r1]
        b       LCFJ19
LCFJ18:
        ldr     r0, [sp, #0x1C4]
        ldr     r6, [sp, #0x1C8]
        str     r0, [r1]
        str     r6, [r1, #4]
LCFJ19:
        subs    lr, lr, #1
        sub     r1, r1, #8
        bpl     LCFJ15
        str     r8, [sp, #0x44]
        ldr     r8, [sp, #0x5C]
        str     lr, [sp, #0x38]
LCFJ20:
        ldr     r1, [sp, #0x38]
        ldr     r2, [sp, #0x44]
        subs    r1, r1, #1
        str     r1, [sp, #0x3C]
        add     r2, r9, r2
        movmi   r1, #0
        strmi   r1, [sp, #0x4C]
        bmi     LCFJ26
        ldr     r1, [sp, #0x3C]
        ldr     lr, [pc, #0xB6C]
        ldr     r4, [sp, #0x3C]
        ldr     r5, [sp, #0x30]
        ldr     r6, [sp, #0x2C]
        add     r1, r8, r1, lsl #3
        str     r9, [sp, #0x58]
        str     r8, [sp, #0x5C]
LCFJ21:
        ldr     r10, [r1]
        ldr     r0, [r1, #4]
        mvn     r9, #2, 2
        str     r10, [sp, #0x1D4]
        and     r10, r0, r9
        cmp     r10, r5
        str     r0, [sp, #0x1D8]
        bic     r9, r0, r9
        bcc     LCFJ55
        cmp     r9, #0
        beq     LCFJ23
        tst     r0, #2, 14
        beq     LCFJ22
        ldr     r0, [lr]
        ldr     r8, [lr, #4]
        str     r0, [r1]
        str     r8, [r1, #4]
        b       LCFJ25
LCFJ22:
        ldr     r0, [sp, #0x1CC]
        ldr     r8, [sp, #0x1D0]
        str     r0, [r1]
        str     r8, [r1, #4]
        b       LCFJ25
LCFJ23:
        cmp     r0, r6
        bcc     LCFJ54
        tst     r0, #2, 14
        beq     LCFJ24
        ldr     r8, [lr, #4]
        ldr     r0, [lr]
        eor     r8, r8, #2, 2
        str     r8, [r1, #4]
        str     r0, [r1]
        b       LCFJ25
LCFJ24:
        ldr     r0, [sp, #0x1C4]
        ldr     r8, [sp, #0x1C8]
        str     r0, [r1]
        str     r8, [r1, #4]
LCFJ25:
        subs    r4, r4, #1
        sub     r1, r1, #8
        bpl     LCFJ21
        str     r9, [sp, #0x4C]
        ldr     r9, [sp, #0x58]
        ldr     r8, [sp, #0x5C]
        str     r4, [sp, #0x3C]
LCFJ26:
        ldr     r1, [sp, #0x3C]
        cmp     r1, #0
        ldr     r1, [sp, #0x4C]
        add     r1, r9, r1
        blt     LCFJ45
        ldr     lr, [pc, #0xA8C]
        ldr     r10, [sp, #0x1EC]
        ldr     r11, [sp, #0x1D8]
        ldr     r6, [lr, #4]
        ldr     r0, [sp, #0x1C8]
        str     r10, [sp, #4]
        ldr     r10, [sp, #0x1F0]
        str     r0, [sp, #0xC]
        str     r10, [sp]
        ldr     r10, [sp, #0x1E4]
        str     r10, [sp, #0x18]
        ldr     r10, [sp, #0x1E8]
        str     r10, [sp, #0x1C]
        ldr     r10, [sp, #0x1DC]
        str     r10, [sp, #0x28]
        ldr     r10, [sp, #0x1E0]
        str     r10, [sp, #0x10]
        ldr     r10, [sp, #0x1D4]
        str     r10, [sp, #0x14]
        ldr     lr, [lr]
        ldr     r10, [sp, #0x1C4]
        str     lr, [sp, #8]
        ldr     lr, [sp, #0x1CC]
        str     lr, [sp, #0x24]
        ldr     lr, [sp, #0x1D0]
        str     lr, [sp, #0x20]
        str     r1, [sp, #0x168]
        str     r2, [sp, #0x170]
        str     r12, [sp, #0x178]
        str     r3, [sp, #0x180]
        eor     lr, r6, #2, 2
        str     lr, [sp, #0x68]
        str     r6, [sp, #0x64]
        str     r10, [sp, #0x60]
        str     r11, [sp, #0x9C]
        str     r1, [sp, #0x6C]
        str     r2, [sp, #0x70]
        str     r12, [sp, #0x74]
        str     r3, [sp, #0xA4]
LCFJ27:
        ldr     r4, [pc, #0x9F4]
        ldr     r0, [sp, #4]
        ldr     r1, [sp]
        ldr     r2, [pc, #0x9EC]
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [pc, #0x9E0]
        mov     r5, r0
        ldr     r0, [sp, #0x18]
        mov     r6, r1
        ldr     r1, [sp, #0x1C]
        mov     r3, r4
        bl      __muldf3
        ldr     r10, [sp, #0x17C]
        ldr     r11, [sp, #0x180]
        str     r0, [sp, #0x160]
        str     r1, [sp, #0x15C]
        mov     r3, r11
        mov     r2, r10
        mov     r0, r5
        mov     r1, r6
        bl      __adddf3
        ldr     r5, [sp, #0x174]
        ldr     r6, [sp, #0x178]
        str     r0, [sp, #0x158]
        str     r0, [sp, #0x19C]
        str     r1, [sp, #0x154]
        str     r1, [sp, #0x1A0]
        ldr     r1, [sp, #0x15C]
        ldr     r0, [sp, #0x160]
        mov     r3, r6
        mov     r2, r5
        bl      __adddf3
        ldr     r2, [sp, #0x19C]
        str     r0, [sp, #0xA8]
        str     r2, [sp, #0x78]
        str     r0, [sp, #0x194]
        str     r1, [sp, #0x160]
        str     r1, [sp, #0x198]
        ldr     r1, [sp, #0x154]
        ldr     r0, [sp, #0x158]
        mov     r2, r10
        mov     r3, r11
        bl      __subdf3
        str     r0, [sp, #0x15C]
        ldr     r0, [sp, #0xA8]
        str     r1, [sp, #0x158]
        ldr     r1, [sp, #0x160]
        mov     r2, r5
        mov     r3, r6
        bl      __subdf3
        str     r1, [sp, #0x154]
        ldr     r1, [sp, #0x10]
        str     r0, [sp, #0x160]
        ldr     r0, [sp, #0x28]
        ldr     r2, [pc, #0x91C]
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [pc, #0x910]
        mov     r6, r0
        ldr     r0, [sp, #0x14]
        mov     r5, r1
        ldr     r1, [sp, #0x9C]
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [sp, #0x16C]
        ldr     r4, [sp, #0x170]
        str     r0, [sp, #0x14C]
        str     r2, [sp, #0x150]
        ldr     r2, [sp, #0x150]
        str     r1, [sp, #0x148]
        mov     r3, r4
        mov     r1, r5
        mov     r0, r6
        bl      __adddf3
        ldr     r5, [sp, #0x164]
        ldr     r6, [sp, #0x168]
        str     r0, [sp, #0x144]
        str     r0, [sp, #0x18C]
        str     r1, [sp, #0x140]
        str     r1, [sp, #0x190]
        ldr     r0, [sp, #0x14C]
        ldr     r1, [sp, #0x148]
        mov     r2, r5
        mov     r3, r6
        bl      __adddf3
        ldr     r2, [sp, #0x18C]
        mov     r10, r0
        str     r10, [sp, #0xF4]
        mov     r3, r4
        str     r2, [sp, #0x7C]
        str     r10, [sp, #0x184]
        mov     r11, r1
        str     r11, [sp, #0x188]
        ldr     r2, [sp, #0x150]
        ldr     r0, [sp, #0x144]
        ldr     r1, [sp, #0x140]
        bl      __subdf3
        str     r0, [sp, #0x150]
        mov     r4, r1
        mov     r2, r5
        mov     r1, r11
        mov     r0, r10
        mov     r3, r6
        bl      __subdf3
        ldr     r6, [pc, #0x858]
        mov     r2, #0
        mov     r10, r0
        ldr     r0, [sp, #0x15C]
        mov     r11, r1
        ldr     r1, [sp, #0x158]
        sub     r5, r2, #0x12, 12
        mov     r2, r5
        mov     r3, r6
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #4]
        mov     r3, r1
        ldr     r1, [sp]
        bl      __subdf3
        str     r0, [sp, #0xCC]
        str     r1, [sp, #0xD0]
        ldr     r1, [sp, #0x154]
        ldr     r0, [sp, #0x160]
        mov     r2, r5
        mov     r3, r6
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x18]
        mov     r3, r1
        ldr     r1, [sp, #0x1C]
        bl      __subdf3
        str     r0, [sp, #0xBC]
        ldr     r0, [sp, #0x150]
        str     r1, [sp, #0xC0]
        mov     r3, r6
        mov     r2, r5
        mov     r1, r4
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x28]
        mov     r3, r1
        ldr     r1, [sp, #0x10]
        bl      __subdf3
        str     r0, [sp, #0xB4]
        str     r1, [sp, #0xB8]
        mov     r0, r10
        mov     r3, r6
        mov     r2, r5
        mov     r1, r11
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x14]
        mov     r3, r1
        ldr     r1, [sp, #0x9C]
        bl      __subdf3
        ldr     r5, [pc, #0x790]
        ldr     r6, [pc, #0x790]
        str     r0, [sp, #0xAC]
        ldr     r0, [sp, #0x15C]
        str     r1, [sp, #0xB0]
        ldr     r1, [sp, #0x158]
        mov     r3, r6
        mov     r2, r5
        bl      __muldf3
        str     r0, [sp, #0xE4]
        ldr     r0, [sp, #0x160]
        str     r1, [sp, #0xE8]
        ldr     r1, [sp, #0x154]
        mov     r2, r5
        mov     r3, r6
        bl      __muldf3
        str     r0, [sp, #0xDC]
        ldr     r0, [sp, #0x150]
        str     r1, [sp, #0xE0]
        mov     r2, r5
        mov     r1, r4
        mov     r3, r6
        bl      __muldf3
        str     r0, [sp, #0xD4]
        str     r1, [sp, #0xD8]
        mov     r3, r6
        mov     r1, r11
        mov     r0, r10
        mov     r2, r5
        bl      __muldf3
        mov     r5, r1
        str     r5, [sp, #0xC8]
        mov     r4, r0
        ldr     r2, [sp, #0xE4]
        ldr     r3, [sp, #0xE8]
        ldr     r0, [sp, #0xCC]
        ldr     r1, [sp, #0xD0]
        str     r4, [sp, #0xC4]
        bl      __subdf3
        ldr     r2, [sp, #0xDC]
        ldr     r3, [sp, #0xE0]
        str     r0, [sp, #0x11C]
        ldr     r0, [sp, #0xBC]
        str     r1, [sp, #0x120]
        ldr     r1, [sp, #0xC0]
        bl      __subdf3
        str     r1, [sp, #0x118]
        ldr     r2, [sp, #0xD4]
        str     r0, [sp, #0x114]
        ldr     r3, [sp, #0xD8]
        ldr     r0, [sp, #0xB4]
        ldr     r1, [sp, #0xB8]
        bl      __subdf3
        str     r0, [sp, #0x10C]
        ldr     r0, [sp, #0xAC]
        str     r1, [sp, #0x110]
        ldr     r1, [sp, #0xB0]
        mov     r2, r4
        mov     r3, r5
        bl      __subdf3
        ldr     r3, [sp, #0x120]
        str     r0, [sp, #0x104]
        ldr     r0, [sp, #0x11C]
        str     r1, [sp, #0x108]
        ldr     r1, [sp, #0x120]
        mov     r2, r0
        bl      __muldf3
        ldr     r3, [sp, #0x118]
        str     r0, [sp, #0x160]
        ldr     r0, [sp, #0x114]
        str     r1, [sp, #0x15C]
        ldr     r1, [sp, #0x118]
        mov     r2, r0
        bl      __muldf3
        ldr     r2, [sp, #0x10C]
        ldr     r3, [sp, #0x110]
        str     r0, [sp, #0x158]
        mov     r10, r1
        ldr     r1, [sp, #0x110]
        mov     r0, r2
        bl      __muldf3
        ldr     r3, [sp, #0x108]
        mov     r4, r0
        ldr     r0, [sp, #0x104]
        mov     r11, r1
        ldr     r1, [sp, #0x108]
        mov     r2, r0
        bl      __muldf3
        ldr     r2, [pc, #0x638]
        ldr     r3, [pc, #0x638]
        mov     r5, r0
        ldr     r0, [sp, #0x160]
        mov     r6, r1
        ldr     r1, [sp, #0x15C]
        bl      __muldf3
        ldr     r2, [pc, #0x624]
        ldr     r3, [pc, #0x624]
        bl      __adddf3
        ldr     r2, [sp, #0x160]
        ldr     r3, [sp, #0x15C]
        bl      __muldf3
        ldr     r2, [pc, #0x614]
        ldr     r3, [pc, #0x614]
        bl      __adddf3
        ldr     r2, [sp, #0x160]
        ldr     r3, [sp, #0x15C]
        bl      __muldf3
        ldr     r2, [pc, #0x604]
        ldr     r3, [pc, #0x604]
        bl      __adddf3
        ldr     r2, [sp, #0x160]
        ldr     r3, [sp, #0x15C]
        bl      __muldf3
        ldr     r2, [pc, #0x5F4]
        ldr     r3, [pc, #0x5F4]
        bl      __adddf3
        ldr     r2, [sp, #0x160]
        ldr     r3, [sp, #0x15C]
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x11C]
        mov     r3, r1
        ldr     r1, [sp, #0x120]
        bl      __subdf3
        ldr     r2, [pc, #0x5A8]
        ldr     r3, [pc, #0x5A8]
        str     r0, [sp, #0xF0]
        ldr     r0, [sp, #0x158]
        str     r1, [sp, #0xEC]
        mov     r1, r10
        bl      __muldf3
        ldr     r2, [pc, #0x594]
        ldr     r3, [pc, #0x594]
        bl      __adddf3
        ldr     r2, [sp, #0x158]
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [pc, #0x584]
        ldr     r3, [pc, #0x584]
        bl      __adddf3
        ldr     r2, [sp, #0x158]
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [pc, #0x574]
        ldr     r3, [pc, #0x574]
        bl      __adddf3
        ldr     r2, [sp, #0x158]
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [pc, #0x564]
        ldr     r3, [pc, #0x564]
        bl      __adddf3
        ldr     r2, [sp, #0x158]
        mov     r3, r10
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x114]
        mov     r3, r1
        ldr     r1, [sp, #0x118]
        bl      __subdf3
        ldr     r2, [pc, #0x518]
        ldr     r3, [pc, #0x518]
        str     r0, [sp, #0xF8]
        mov     r10, r1
        str     r10, [sp, #0xFC]
        mov     r1, r11
        mov     r0, r4
        bl      __muldf3
        ldr     r2, [pc, #0x500]
        ldr     r3, [pc, #0x500]
        bl      __adddf3
        mov     r3, r11
        mov     r2, r4
        bl      __muldf3
        ldr     r2, [pc, #0x4F0]
        ldr     r3, [pc, #0x4F0]
        bl      __adddf3
        mov     r2, r4
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [pc, #0x4E0]
        ldr     r3, [pc, #0x4E0]
        bl      __adddf3
        mov     r3, r11
        mov     r2, r4
        bl      __muldf3
        ldr     r2, [pc, #0x4D0]
        ldr     r3, [pc, #0x4D0]
        bl      __adddf3
        mov     r3, r11
        mov     r2, r4
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x10C]
        mov     r3, r1
        ldr     r1, [sp, #0x110]
        bl      __subdf3
        ldr     r2, [pc, #0x484]
        ldr     r3, [pc, #0x484]
        mov     r4, r0
        str     r1, [sp, #0x124]
        str     r4, [sp, #0x128]
        mov     r0, r5
        mov     r1, r6
        bl      __muldf3
        ldr     r2, [pc, #0x46C]
        ldr     r3, [pc, #0x46C]
        bl      __adddf3
        mov     r2, r5
        mov     r3, r6
        bl      __muldf3
        ldr     r2, [pc, #0x45C]
        ldr     r3, [pc, #0x45C]
        bl      __adddf3
        mov     r2, r5
        mov     r3, r6
        bl      __muldf3
        ldr     r2, [pc, #0x44C]
        ldr     r3, [pc, #0x44C]
        bl      __adddf3
        mov     r2, r5
        mov     r3, r6
        bl      __muldf3
        ldr     r2, [pc, #0x43C]
        ldr     r3, [pc, #0x43C]
        bl      __adddf3
        mov     r2, r5
        mov     r3, r6
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [sp, #0x104]
        ldr     r1, [sp, #0x108]
        bl      __subdf3
        ldr     r2, [sp, #0xF0]
        ldr     r3, [sp, #0xEC]
        mov     r5, r0
        str     r5, [sp, #0x160]
        mov     r6, r1
        str     r6, [sp, #0x15C]
        mov     r0, #0
        mov     r1, #1, 2
        bl      __subdf3
        ldr     r2, [sp, #0xF8]
        str     r0, [sp, #0x13C]
        str     r1, [sp, #0x140]
        mov     r0, #0
        mov     r1, #1, 2
        mov     r3, r10
        bl      __subdf3
        ldr     r3, [sp, #0x124]
        mov     r10, r0
        str     r10, [sp, #0x144]
        mov     r11, r1
        str     r11, [sp, #0x148]
        mov     r2, r4
        mov     r0, #0
        mov     r1, #1, 2
        bl      __subdf3
        str     r0, [sp, #0x130]
        mov     r4, r1
        str     r4, [sp, #0x12C]
        mov     r2, r5
        mov     r3, r6
        mov     r0, #0
        mov     r1, #1, 2
        bl      __subdf3
        mov     r5, r0
        ldr     r0, [sp, #0x13C]
        str     r5, [sp, #0x134]
        mov     r6, r1
        ldr     r1, [sp, #0x140]
        str     r6, [sp, #0x138]
        mov     r2, r10
        mov     r3, r11
        bl      __muldf3
        mov     r10, r0
        ldr     r0, [sp, #0x130]
        mov     r11, r1
        str     r10, [sp, #0x158]
        str     r11, [sp, #0x150]
        mov     r1, r4
        mov     r2, r5
        mov     r3, r6
        bl      __muldf3
        str     r1, [sp, #0xA0]
        mov     r4, r0
        mov     r2, r10
        mov     r3, r11
        bl      __muldf3
        mov     r3, r1
        mov     r12, #0xFF, 12
        mov     r2, r0
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __divdf3
        ldr     r3, [sp, #0x3C]
        str     r1, [sp, #0x154]
        ldr     r1, [sp, #0x40]
        str     r7, [sp, #0x88]
        subs    r7, r3, #1
        str     r1, [sp, #0x98]
        ldr     r1, [sp, #0x48]
        str     r0, [sp, #0x14C]
        str     r1, [sp, #0x94]
        ldr     r1, [sp, #0x44]
        str     r3, [sp, #0x80]
        str     r1, [sp, #0x90]
        ldr     r1, [sp, #0x4C]
        str     r1, [sp, #0x8C]
        ldr     r1, [sp, #0x34]
        str     r1, [sp, #0x100]
        ldr     r1, [sp, #0x38]
        str     r1, [sp, #0x84]
        bmi     LCFJ31
        str     r4, [sp, #0x50]
        str     r9, [sp, #0x58]
        ldr     r2, [sp, #0x20]
        ldr     r3, [sp, #0x24]
        ldr     r12, [sp, #0x64]
        ldr     lr, [sp, #8]
        ldr     r4, [sp, #0xC]
        ldr     r5, [sp, #0x60]
        ldr     r9, [sp, #0x30]
        ldr     r10, [sp, #0x2C]
        add     r1, r8, r7, lsl #3
        str     r8, [sp, #0x5C]
LCFJ28:
        ldr     r6, [r1, #4]
        ldr     r8, [r1]
        mvn     r0, #2, 2
        and     r11, r6, r0
        cmp     r11, r9
        str     r8, [sp, #0x1EC]
        str     r6, [sp, #0x1F0]
        bic     r0, r6, r0
        bcc     LCFJ53
        cmp     r0, #0
        beq     LCFJ29
        tst     r6, #2, 14
        streq   r3, [r1]
        streq   r2, [r1, #4]
        strne   lr, [r1]
        strne   r12, [r1, #4]
        b       LCFJ30
LCFJ29:
        cmp     r6, r10
        bcc     LCFJ52
        tst     r6, #2, 14
        streq   r5, [r1]
        streq   r4, [r1, #4]
        beq     LCFJ30
        str     lr, [r1]
        ldr     r11, [sp, #0x68]
        str     r11, [r1, #4]
LCFJ30:
        subs    r7, r7, #1
        sub     r1, r1, #8
        bpl     LCFJ28
        str     r0, [sp, #0x40]
        ldr     r1, [sp, #0x40]
        ldr     r9, [sp, #0x58]
        str     r8, [sp, #4]
        ldr     r4, [sp, #0x50]
        ldr     r8, [sp, #0x5C]
        add     r1, r9, r1
        str     r12, [sp, #0x64]
        str     r5, [sp, #0x60]
        str     r6, [sp]
        str     r1, [sp, #0xA4]
LCFJ31:
        subs    r1, r7, #1
        str     r1, [sp, #0x34]
        bmi     LCFJ35
        ldr     r1, [sp, #0x34]
        str     r4, [sp, #0x50]
        str     r9, [sp, #0x58]
        add     r1, r8, r1, lsl #3
        str     r8, [sp, #0x5C]
        ldr     r2, [sp, #0x20]
        ldr     r3, [sp, #0x24]
        ldr     r12, [sp, #0x64]
        ldr     lr, [sp, #8]
        ldr     r4, [sp, #0xC]
        ldr     r5, [sp, #0x60]
        ldr     r8, [sp, #0x34]
        ldr     r9, [sp, #0x30]
        ldr     r10, [sp, #0x2C]
        str     r7, [sp, #0x54]
LCFJ32:
        ldr     r6, [r1, #4]
        ldr     r7, [r1]
        mvn     r0, #2, 2
        and     r11, r6, r0
        cmp     r11, r9
        str     r7, [sp, #0x1E4]
        str     r6, [sp, #0x1E8]
        bic     r0, r6, r0
        bcc     LCFJ51
        cmp     r0, #0
        beq     LCFJ33
        tst     r6, #2, 14
        streq   r3, [r1]
        streq   r2, [r1, #4]
        strne   lr, [r1]
        strne   r12, [r1, #4]
        b       LCFJ34
LCFJ33:
        cmp     r6, r10
        bcc     LCFJ50
        tst     r6, #2, 14
        streq   r5, [r1]
        streq   r4, [r1, #4]
        beq     LCFJ34
        str     lr, [r1]
        ldr     r11, [sp, #0x68]
        str     r11, [r1, #4]
LCFJ34:
        subs    r8, r8, #1
        sub     r1, r1, #8
        bpl     LCFJ32
        str     r0, [sp, #0x48]
        ldr     r1, [sp, #0x48]
        ldr     r9, [sp, #0x58]
        str     r7, [sp, #0x18]
        str     r8, [sp, #0x34]
        ldr     r4, [sp, #0x50]
        ldr     r7, [sp, #0x54]
        ldr     r8, [sp, #0x5C]
        add     r1, r9, r1
        str     r12, [sp, #0x64]
        str     r5, [sp, #0x60]
        str     r6, [sp, #0x1C]
        str     r1, [sp, #0x74]
LCFJ35:
        ldr     r1, [sp, #0x34]
        subs    r1, r1, #1
        str     r1, [sp, #0x38]
        bmi     LCFJ39
        ldr     r1, [sp, #0x38]
        str     r4, [sp, #0x50]
        str     r9, [sp, #0x58]
        add     r1, r8, r1, lsl #3
        str     r8, [sp, #0x5C]
        ldr     r2, [sp, #0x20]
        ldr     r3, [sp, #0x24]
        ldr     r12, [sp, #0x64]
        ldr     lr, [sp, #8]
        ldr     r4, [sp, #0xC]
        ldr     r5, [sp, #0x60]
        ldr     r8, [sp, #0x38]
        ldr     r9, [sp, #0x30]
        ldr     r10, [sp, #0x2C]
        str     r7, [sp, #0x54]
LCFJ36:
        ldr     r6, [r1, #4]
        ldr     r7, [r1]
        mvn     r0, #2, 2
        and     r11, r6, r0
        cmp     r11, r9
        str     r7, [sp, #0x1DC]
        str     r6, [sp, #0x1E0]
        bic     r0, r6, r0
        bcc     LCFJ49
        cmp     r0, #0
        beq     LCFJ37
        tst     r6, #2, 14
        streq   r3, [r1]
        streq   r2, [r1, #4]
        strne   lr, [r1]
        strne   r12, [r1, #4]
        b       LCFJ38
        .long   LCFJ_x3.3621.0.0.0
        .long   LCFJ_x1.3621.0.0.0
        .long   LCFJ_c1.3621.0.0.0
        .long   LCFJ_x2.3621.0.0.0
        .long   LCFJ_c2.3621.0.0.0
        .long   LCFJ_c3.3621.0.0.0
        .long   LCFJ_c4.3621.0.0.0
        .long   LCFJ_x1.3621.0.0.0
        .long   LCFJ_x4.3621.0.0.0
        .long   LCFJ_maxd.3621.0.0.0
        .long   LCFJ_x2.3621.0.0.0
        .long   LCFJ_mind.3621.0.0.0
        .long   LCFJ_maxd.3621.0.0.0
        .long   LCFJ_x3.3621.0.0.0
        .long   LCFJ_x4.3621.0.0.0
        .long   LCFJ_ln_maxd.3621.0.0.0
        .long   LCFJ_ln_mind.3621.0.0.0
        .long   LCFJ_mind.3621.0.0.0
        .long   LCFJ_coef.3621.0.0.0
        .long   ippConstantOfNAN_64f
        .long   0x3ff71547
        .long   0x652b82fe
        .long   0x3fe62e42
        .long   0x35793c76
        .long   0x3dea39ef
        .long   0x72bea4d0
        .long   0x3e663769
        .long   0xc5d26bf1
        .long   0xbebbbd41
        .long   0xaf25de2c
        .long   0x3f11566a
        .long   0x16bebd93
        .long   0xbf66c16c
        .long   0x5555553e
        .long   0x3fc55555
LCFJ37:
        cmp     r6, r10
        bcc     LCFJ48
        tst     r6, #2, 14
        streq   r5, [r1]
        streq   r4, [r1, #4]
        beq     LCFJ38
        str     lr, [r1]
        ldr     r11, [sp, #0x68]
        str     r11, [r1, #4]
LCFJ38:
        subs    r8, r8, #1
        sub     r1, r1, #8
        bpl     LCFJ36
        str     r0, [sp, #0x44]
        ldr     r1, [sp, #0x44]
        ldr     r9, [sp, #0x58]
        str     r7, [sp, #0x28]
        str     r8, [sp, #0x38]
        ldr     r4, [sp, #0x50]
        ldr     r7, [sp, #0x54]
        ldr     r8, [sp, #0x5C]
        add     r1, r9, r1
        str     r12, [sp, #0x64]
        str     r5, [sp, #0x60]
        str     r6, [sp, #0x10]
        str     r1, [sp, #0x70]
LCFJ39:
        ldr     r1, [sp, #0x38]
        subs    r1, r1, #1
        str     r1, [sp, #0x3C]
        bmi     LCFJ43
        ldr     r1, [sp, #0x3C]
        str     r4, [sp, #0x50]
        str     r9, [sp, #0x58]
        add     r1, r8, r1, lsl #3
        str     r8, [sp, #0x5C]
        ldr     r2, [sp, #0x20]
        ldr     r3, [sp, #0x24]
        ldr     r12, [sp, #0x64]
        ldr     lr, [sp, #8]
        ldr     r4, [sp, #0xC]
        ldr     r5, [sp, #0x60]
        ldr     r8, [sp, #0x3C]
        ldr     r9, [sp, #0x30]
        ldr     r10, [sp, #0x2C]
        str     r7, [sp, #0x54]
LCFJ40:
        ldr     r6, [r1, #4]
        ldr     r7, [r1]
        mvn     r0, #2, 2
        and     r11, r6, r0
        cmp     r11, r9
        str     r7, [sp, #0x1D4]
        str     r6, [sp, #0x1D8]
        bic     r0, r6, r0
        bcc     LCFJ47
        cmp     r0, #0
        beq     LCFJ41
        tst     r6, #2, 14
        streq   r3, [r1]
        streq   r2, [r1, #4]
        strne   lr, [r1]
        strne   r12, [r1, #4]
        b       LCFJ42
LCFJ41:
        cmp     r6, r10
        bcc     LCFJ46
        tst     r6, #2, 14
        streq   r5, [r1]
        streq   r4, [r1, #4]
        beq     LCFJ42
        str     lr, [r1]
        ldr     r11, [sp, #0x68]
        str     r11, [r1, #4]
LCFJ42:
        subs    r8, r8, #1
        sub     r1, r1, #8
        bpl     LCFJ40
        str     r0, [sp, #0x4C]
        ldr     r1, [sp, #0x4C]
        ldr     r9, [sp, #0x58]
        str     r7, [sp, #0x14]
        str     r8, [sp, #0x3C]
        ldr     r4, [sp, #0x50]
        ldr     r7, [sp, #0x54]
        ldr     r8, [sp, #0x5C]
        add     r1, r9, r1
        str     r12, [sp, #0x64]
        str     r5, [sp, #0x60]
        str     r6, [sp, #0x9C]
        str     r1, [sp, #0x6C]
LCFJ43:
        ldr     r2, [sp, #0x11C]
        ldr     r3, [sp, #0x120]
        ldr     r0, [sp, #0xF0]
        ldr     r1, [sp, #0xEC]
        bl      __muldf3
        ldr     r3, [sp, #0x118]
        ldr     r2, [sp, #0x114]
        str     r0, [sp, #0x120]
        ldr     r0, [sp, #0xF8]
        mov     r6, r1
        ldr     r1, [sp, #0xFC]
        bl      __muldf3
        str     r0, [sp, #0x11C]
        ldr     r2, [sp, #0x10C]
        ldr     r0, [sp, #0x128]
        ldr     r3, [sp, #0x110]
        str     r1, [sp, #0x118]
        ldr     r1, [sp, #0x124]
        bl      __muldf3
        ldr     r2, [sp, #0x104]
        ldr     r3, [sp, #0x108]
        str     r0, [sp, #0x128]
        ldr     r0, [sp, #0x160]
        str     r1, [sp, #0x124]
        ldr     r1, [sp, #0x15C]
        bl      __muldf3
        ldr     r10, [sp, #0x14C]
        ldr     r5, [sp, #0x154]
        ldr     r3, [sp, #0xA0]
        str     r1, [sp, #0x15C]
        str     r0, [sp, #0x160]
        mov     r1, r5
        mov     r0, r10
        mov     r2, r4
        bl      __muldf3
        ldr     r2, [sp, #0x158]
        ldr     r3, [sp, #0x150]
        mov     r11, r0
        mov     r4, r1
        mov     r0, r10
        mov     r1, r5
        bl      __muldf3
        ldr     r2, [sp, #0x144]
        ldr     r3, [sp, #0x148]
        mov     r10, r1
        mov     r5, r0
        mov     r0, r11
        mov     r1, r4
        bl      __muldf3
        ldr     r2, [sp, #0x120]
        mov     r3, r6
        bl      __muldf3
        ldr     r2, [sp, #0x13C]
        ldr     r3, [sp, #0x140]
        str     r0, [sp, #0x158]
        str     r1, [sp, #0x154]
        mov     r0, r11
        mov     r1, r4
        bl      __muldf3
        ldr     r2, [sp, #0x11C]
        ldr     r3, [sp, #0x118]
        bl      __muldf3
        ldr     r2, [sp, #0x134]
        ldr     r3, [sp, #0x138]
        mov     r6, r0
        mov     r4, r1
        mov     r0, r5
        mov     r1, r10
        bl      __muldf3
        ldr     r2, [sp, #0x128]
        ldr     r3, [sp, #0x124]
        bl      __muldf3
        ldr     r2, [sp, #0x130]
        ldr     r3, [sp, #0x12C]
        str     r0, [sp, #0x150]
        str     r1, [sp, #0x14C]
        mov     r0, r5
        mov     r1, r10
        bl      __muldf3
        ldr     r2, [sp, #0x160]
        ldr     r3, [sp, #0x15C]
        mov     r5, #0xFF, 12
        bl      __muldf3
        ldr     r2, [sp, #0x158]
        ldr     r3, [sp, #0x154]
        orr     r5, r5, #3, 4
        mov     r11, r0
        mov     r10, r1
        mov     r0, #0
        mov     r1, r5
        bl      __adddf3
        ldr     r2, [sp, #0xCC]
        ldr     r3, [sp, #0xD0]
        bl      __adddf3
        ldr     r2, [sp, #0xE4]
        ldr     r3, [sp, #0xE8]
        bl      __subdf3
        str     r0, [sp, #0x1BC]
        str     r1, [sp, #0x1C0]
        mov     r0, #0
        mov     r1, r5
        mov     r2, r6
        mov     r3, r4
        bl      __adddf3
        ldr     r2, [sp, #0xBC]
        ldr     r3, [sp, #0xC0]
        bl      __adddf3
        ldr     r2, [sp, #0xDC]
        ldr     r3, [sp, #0xE0]
        bl      __subdf3
        str     r0, [sp, #0x1B4]
        str     r1, [sp, #0x1B8]
        ldr     r2, [sp, #0x150]
        ldr     r3, [sp, #0x14C]
        mov     r0, #0
        mov     r1, r5
        bl      __adddf3
        ldr     r2, [sp, #0xB4]
        ldr     r3, [sp, #0xB8]
        bl      __adddf3
        ldr     r2, [sp, #0xD4]
        ldr     r3, [sp, #0xD8]
        bl      __subdf3
        str     r0, [sp, #0x1AC]
        str     r1, [sp, #0x1B0]
        mov     r0, #0
        mov     r1, r5
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        ldr     r2, [sp, #0xAC]
        ldr     r3, [sp, #0xB0]
        bl      __adddf3
        ldr     r2, [sp, #0xC4]
        ldr     r3, [sp, #0xC8]
        bl      __subdf3
        ldr     r2, [sp, #0x1C0]
        str     r0, [sp, #0x1A4]
        ldr     r12, [sp, #0x98]
        str     r1, [sp, #0x1A8]
        cmp     r12, #0
        ldreq   r1, [sp, #0x78]
        addeq   r2, r2, r1, lsl #20
        ldrne   r1, [sp, #0x78]
        subne   r2, r2, r1, lsl #20
        ldr     r3, [sp, #0x94]
        ldr     r1, [sp, #0x1B8]
        str     r2, [sp, #0x1C0]
        cmp     r3, #0
        ldreq   r2, [sp, #0xA8]
        addeq   r2, r1, r2, lsl #20
        ldrne   r2, [sp, #0xA8]
        subne   r2, r1, r2, lsl #20
        ldr     r3, [sp, #0x90]
        ldr     r1, [sp, #0x1B0]
        str     r2, [sp, #0x1B8]
        cmp     r3, #0
        ldreq   r2, [sp, #0x7C]
        addeq   r2, r1, r2, lsl #20
        ldrne   r2, [sp, #0x7C]
        subne   r2, r1, r2, lsl #20
        ldr     r3, [sp, #0x8C]
        ldr     r1, [sp, #0x1A8]
        str     r2, [sp, #0x1B0]
        cmp     r3, #0
        ldreq   r2, [sp, #0xF4]
        addeq   r1, r1, r2, lsl #20
        ldrne   r2, [sp, #0xF4]
        subne   r1, r1, r2, lsl #20
        ldr     r4, [sp, #0x88]
        ldr     r3, [sp, #0x1BC]
        ldr     lr, [sp, #0x1C0]
        ldr     r12, [sp, #0x1B4]
        str     r3, [r8, +r4, lsl #3]
        ldr     r3, [sp, #0x1B8]
        add     r4, r8, r4, lsl #3
        str     lr, [r4, #4]
        ldr     r4, [sp, #0x100]
        ldr     lr, [sp, #0x1AC]
        str     r1, [sp, #0x1A8]
        str     r12, [r8, +r4, lsl #3]
        ldr     r12, [sp, #0x1B0]
        add     r4, r8, r4, lsl #3
        str     r3, [r4, #4]
        ldr     r3, [sp, #0x84]
        ldr     r2, [sp, #0x1A4]
        str     lr, [r8, +r3, lsl #3]
        add     r3, r8, r3, lsl #3
        str     r12, [r3, #4]
        ldr     r3, [sp, #0x80]
        str     r2, [r8, +r3, lsl #3]
        add     r2, r8, r3, lsl #3
        ldr     r3, [sp, #0x3C]
        str     r1, [r2, #4]
        cmp     r3, #0
        blt     LCFJ45
        ldr     r12, [sp, #0x6C]
        str     r12, [sp, #0x168]
        ldr     r12, [sp, #0x70]
        str     r12, [sp, #0x170]
        ldr     r3, [sp, #0x74]
        str     r3, [sp, #0x178]
        ldr     r2, [sp, #0xA4]
        str     r2, [sp, #0x180]
        b       LCFJ27
LCFJ44:
        mvn     r0, #5
        add     sp, sp, #0x7D, 30
        ldmia   sp!, {r4 - r11, pc}
LCFJ45:
        cmp     r7, #0
        blt     LCFJ1
        ldr     r0, [sp, #0x1EC]
        ldr     r1, [sp, #0x1F0]
        add     r4, r8, r7, lsl #3
        bl      exp
        str     r0, [r8, +r7, lsl #3]
        str     r1, [r4, #4]
        ldr     r1, [sp, #0x34]
        cmp     r1, #0
        blt     LCFJ1
        ldr     r0, [sp, #0x1E4]
        ldr     r1, [sp, #0x1E8]
        ldr     r5, [sp, #0x34]
        bl      exp
        str     r0, [r8, +r5, lsl #3]
        add     r4, r8, r5, lsl #3
        str     r1, [r4, #4]
        ldr     r1, [sp, #0x38]
        cmp     r1, #0
        blt     LCFJ1
        ldr     r0, [sp, #0x1DC]
        ldr     r1, [sp, #0x1E0]
        ldr     r5, [sp, #0x38]
        bl      exp
        str     r0, [r8, +r5, lsl #3]
        add     r4, r8, r5, lsl #3
        mov     r0, #0
        str     r1, [r4, #4]
        add     sp, sp, #0x7D, 30
        ldmia   sp!, {r4 - r11, pc}
LCFJ46:
        str     r0, [sp, #0x4C]
        ldr     r1, [sp, #0x4C]
        ldr     r9, [sp, #0x58]
        str     r7, [sp, #0x14]
        str     r8, [sp, #0x3C]
        ldr     r4, [sp, #0x50]
        ldr     r7, [sp, #0x54]
        ldr     r8, [sp, #0x5C]
        add     r1, r9, r1
        str     r12, [sp, #0x64]
        str     r5, [sp, #0x60]
        str     r6, [sp, #0x9C]
        str     r1, [sp, #0x6C]
        b       LCFJ43
LCFJ47:
        str     r0, [sp, #0x4C]
        ldr     r1, [sp, #0x4C]
        ldr     r9, [sp, #0x58]
        str     r7, [sp, #0x14]
        str     r8, [sp, #0x3C]
        ldr     r4, [sp, #0x50]
        ldr     r7, [sp, #0x54]
        ldr     r8, [sp, #0x5C]
        add     r1, r9, r1
        str     r12, [sp, #0x64]
        str     r5, [sp, #0x60]
        str     r6, [sp, #0x9C]
        str     r1, [sp, #0x6C]
        b       LCFJ43
LCFJ48:
        str     r0, [sp, #0x44]
        ldr     r1, [sp, #0x44]
        ldr     r9, [sp, #0x58]
        str     r7, [sp, #0x28]
        str     r8, [sp, #0x38]
        ldr     r4, [sp, #0x50]
        ldr     r7, [sp, #0x54]
        ldr     r8, [sp, #0x5C]
        add     r1, r9, r1
        str     r12, [sp, #0x64]
        str     r5, [sp, #0x60]
        str     r6, [sp, #0x10]
        str     r1, [sp, #0x70]
        b       LCFJ39
LCFJ49:
        str     r0, [sp, #0x44]
        ldr     r1, [sp, #0x44]
        ldr     r9, [sp, #0x58]
        str     r7, [sp, #0x28]
        str     r8, [sp, #0x38]
        ldr     r4, [sp, #0x50]
        ldr     r7, [sp, #0x54]
        ldr     r8, [sp, #0x5C]
        add     r1, r9, r1
        str     r12, [sp, #0x64]
        str     r5, [sp, #0x60]
        str     r6, [sp, #0x10]
        str     r1, [sp, #0x70]
        b       LCFJ39
LCFJ50:
        str     r0, [sp, #0x48]
        ldr     r1, [sp, #0x48]
        ldr     r9, [sp, #0x58]
        str     r7, [sp, #0x18]
        str     r8, [sp, #0x34]
        ldr     r4, [sp, #0x50]
        ldr     r7, [sp, #0x54]
        ldr     r8, [sp, #0x5C]
        add     r1, r9, r1
        str     r12, [sp, #0x64]
        str     r5, [sp, #0x60]
        str     r6, [sp, #0x1C]
        str     r1, [sp, #0x74]
        b       LCFJ35
LCFJ51:
        str     r0, [sp, #0x48]
        ldr     r1, [sp, #0x48]
        ldr     r9, [sp, #0x58]
        str     r7, [sp, #0x18]
        str     r8, [sp, #0x34]
        ldr     r4, [sp, #0x50]
        ldr     r7, [sp, #0x54]
        ldr     r8, [sp, #0x5C]
        add     r1, r9, r1
        str     r12, [sp, #0x64]
        str     r5, [sp, #0x60]
        str     r6, [sp, #0x1C]
        str     r1, [sp, #0x74]
        b       LCFJ35
LCFJ52:
        str     r0, [sp, #0x40]
        ldr     r1, [sp, #0x40]
        ldr     r9, [sp, #0x58]
        str     r8, [sp, #4]
        ldr     r4, [sp, #0x50]
        ldr     r8, [sp, #0x5C]
        add     r1, r9, r1
        str     r12, [sp, #0x64]
        str     r5, [sp, #0x60]
        str     r6, [sp]
        str     r1, [sp, #0xA4]
        b       LCFJ31
LCFJ53:
        str     r0, [sp, #0x40]
        ldr     r1, [sp, #0x40]
        ldr     r9, [sp, #0x58]
        str     r8, [sp, #4]
        ldr     r4, [sp, #0x50]
        ldr     r8, [sp, #0x5C]
        add     r1, r9, r1
        str     r12, [sp, #0x64]
        str     r5, [sp, #0x60]
        str     r6, [sp]
        str     r1, [sp, #0xA4]
        b       LCFJ31
LCFJ54:
        str     r9, [sp, #0x4C]
        ldr     r9, [sp, #0x58]
        ldr     r8, [sp, #0x5C]
        str     r4, [sp, #0x3C]
        b       LCFJ26
LCFJ55:
        str     r9, [sp, #0x4C]
        ldr     r9, [sp, #0x58]
        ldr     r8, [sp, #0x5C]
        str     r4, [sp, #0x3C]
        b       LCFJ26
LCFJ56:
        str     r8, [sp, #0x44]
        ldr     r8, [sp, #0x5C]
        str     lr, [sp, #0x38]
        b       LCFJ20
LCFJ57:
        str     r8, [sp, #0x44]
        ldr     r8, [sp, #0x5C]
        str     lr, [sp, #0x38]
        b       LCFJ20
LCFJ58:
        str     r1, [sp, #0x48]
        str     r4, [sp, #0x34]
        b       LCFJ14
LCFJ59:
        str     r1, [sp, #0x48]
        str     r4, [sp, #0x34]
        b       LCFJ14
LCFJ60:
        str     r1, [sp, #0x40]
        b       LCFJ8
LCFJ61:
        str     r1, [sp, #0x40]
        b       LCFJ8
LCFJ62:
        mvn     r0, #7
        add     sp, sp, #0x7D, 30
        ldmia   sp!, {r4 - r11, pc}


        .data
        .align  4


LCFJ_c1.3621.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LCFJ_c2.3621.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LCFJ_c3.3621.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LCFJ_c4.3621.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LCFJ_x1.3621.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LCFJ_x2.3621.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LCFJ_x3.3621.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LCFJ_x4.3621.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LCFJ_ln_maxd.3621.0.0.0:
        .byte   0xE6,0x39,0xFA,0xFE,0x42,0x2E,0x86,0x40
LCFJ_ln_mind.3621.0.0.0:
        .byte   0xD2,0xBC,0x7A,0xDD,0x2B,0x23,0x86,0x40
LCFJ_maxd.3621.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0xF0,0x7F
LCFJ_mind.3621.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LCFJ_coef.3621.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x30,0x43


