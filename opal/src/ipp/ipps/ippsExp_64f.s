        .text
        .align  4
        .globl  _ippsExp_64f


_ippsExp_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x7D, 30
        mov     r8, r0
        cmp     r8, #0
        mov     r7, r1
        mov     r4, r2
        beq     LCFK66
        cmp     r7, #0
        beq     LCFK66
        cmp     r4, #1
        blt     LCFK48
        ldr     r12, [pc, #0xFA4]
        ldr     r3, [pc, #0xFA4]
        ldr     lr, [pc, #0xFA4]
        ldr     r10, [pc, #0xFA4]
        ldr     r12, [r12]
        ldr     r3, [r3]
        ldr     lr, [lr]
        ldr     r10, [r10]
        ldr     r5, [pc, #0xF94]
        ldr     r6, [pc, #0xF94]
        ldr     r9, [pc, #0xF94]
        ldr     r0, [pc, #0xF94]
        str     r10, [sp, #0x160]
        ldr     r10, [pc, #0xF90]
        ldr     r11, [r9]
        ldr     r9, [pc, #0xF8C]
        ldr     r5, [r5]
        ldr     r1, [r10]
        ldr     r6, [r6]
        ldr     r10, [r9]
        ldr     r9, [pc, #0xF7C]
        ldr     r0, [r0]
        cmp     r4, #4
        ldr     r9, [r9]
        str     r9, [sp, #4]
        ldr     r9, [pc, #0xF6C]
        ldr     r9, [r9]
        str     r9, [sp, #8]
        ldr     r9, [pc, #0xF64]
        ldr     r9, [r9]
        str     r9, [sp]
        ldr     r9, [pc, #0xF5C]
        ldr     r9, [r9]
        str     r9, [sp, #0x14]
        ldr     r9, [pc, #0xF54]
        ldr     r9, [r9]
        str     r9, [sp, #0x2C]
        ldr     r9, [pc, #0xF4C]
        ldr     r9, [r9]
        str     r9, [sp, #0x30]
        ldr     r9, [pc, #0xF44]
        ldr     r9, [r9]
        str     r9, [sp, #0xC]
        ldr     r9, [pc, #0xF3C]
        ldr     r9, [r9]
        str     r9, [sp, #0x10]
        ldr     r9, [pc, #0xF34]
        str     r12, [sp, #0x174]
        str     r3, [sp, #0x17C]
        str     lr, [sp, #0x16C]
        ldr     r12, [sp, #0x160]
        ldr     r9, [r9]
        str     r5, [sp, #0x1EC]
        str     r12, [sp, #0x164]
        str     r6, [sp, #0x1E4]
        str     r11, [sp, #0x1DC]
        str     r0, [sp, #0x1D4]
        str     r1, [sp, #0x1C4]
        str     r10, [sp, #0x1CC]
        bge     LCFK2
        cmp     r4, #0
        ble     LCFK1
        sub     r7, r7, #4
        sub     r8, r8, #4
LCFK0:
        ldr     r0, [r8, #4]
        ldr     r1, [r8, #8]!
        bl      exp
        str     r0, [r7, #4]
        str     r1, [r7, #8]!
        subs    r4, r4, #1
        bne     LCFK0
LCFK1:
        mov     r0, #0
        add     sp, sp, #0x7D, 30
        ldmia   sp!, {r4 - r11, pc}
LCFK2:
        ldr     r2, [sp, #0x10]
        subs    r4, r4, #1
        str     r4, [sp, #0x28]
        str     r2, [sp, #0x1D0]
        ldr     r12, [sp, #0xC]
        str     r12, [sp, #0x1C8]
        ldr     r12, [sp, #0x14]
        str     r12, [sp, #0x1D8]
        ldr     r12, [sp]
        str     r12, [sp, #0x1E0]
        ldr     r12, [sp, #8]
        str     r12, [sp, #0x1E8]
        ldr     r2, [sp, #4]
        str     r2, [sp, #0x1F0]
        movmi   r2, #0
        strmi   r2, [sp, #0x3C]
        bmi     LCFK8
        ldr     r2, [sp, #0x28]
        ldr     r4, [pc, #0xE80]
        ldr     r6, [sp, #0x28]
        ldr     r10, [sp, #0x30]
        ldr     r11, [sp, #0x2C]
        add     lr, r7, r2, lsl #3
        mvn     r5, #2, 2
        add     r2, r8, r2, lsl #3
LCFK3:
        ldr     r12, [r2]
        ldr     r3, [r2, #4]
        str     r12, [sp, #0x1EC]
        and     r12, r3, r5
        cmp     r12, r10
        str     r3, [sp, #0x1F0]
        bic     r12, r3, r5
        bcc     LCFK65
        cmp     r12, #0
        beq     LCFK5
        tst     r3, #2, 14
        beq     LCFK4
        ldr     r3, [r4]
        ldr     r0, [r4, #4]
        str     r3, [lr]
        str     r0, [lr, #4]
        b       LCFK7
LCFK4:
        ldr     r3, [sp, #0x1CC]
        ldr     r0, [sp, #0x1D0]
        str     r3, [lr]
        str     r0, [lr, #4]
        b       LCFK7
LCFK5:
        cmp     r3, r11
        bcc     LCFK64
        tst     r3, #2, 14
        beq     LCFK6
        ldr     r0, [r4, #4]
        ldr     r3, [r4]
        eor     r0, r0, #2, 2
        str     r0, [lr, #4]
        str     r3, [lr]
        b       LCFK7
LCFK6:
        ldr     r3, [sp, #0x1C4]
        ldr     r0, [sp, #0x1C8]
        str     r3, [lr]
        str     r0, [lr, #4]
LCFK7:
        subs    r6, r6, #1
        sub     lr, lr, #8
        sub     r2, r2, #8
        bpl     LCFK3
        str     r12, [sp, #0x3C]
        str     r6, [sp, #0x28]
LCFK8:
        ldr     r2, [sp, #0x28]
        ldr     r3, [sp, #0x3C]
        subs    r2, r2, #1
        str     r2, [sp, #0x34]
        add     r3, r9, r3
        movmi   r2, #0
        strmi   r2, [sp, #0x40]
        bmi     LCFK14
        ldr     r2, [sp, #0x34]
        ldr     lr, [pc, #0xD98]
        ldr     r4, [sp, #0x34]
        ldr     r5, [sp, #0x30]
        ldr     r6, [sp, #0x2C]
        add     r12, r7, r2, lsl #3
        add     r2, r8, r2, lsl #3
        str     r8, [sp, #0x58]
LCFK9:
        ldr     r11, [r2]
        ldr     r0, [r2, #4]
        mvn     r10, #2, 2
        str     r11, [sp, #0x1E4]
        and     r11, r0, r10
        cmp     r11, r5
        str     r0, [sp, #0x1E8]
        bic     r10, r0, r10
        bcc     LCFK63
        cmp     r10, #0
        beq     LCFK11
        tst     r0, #2, 14
        beq     LCFK10
        ldr     r0, [lr]
        ldr     r8, [lr, #4]
        str     r0, [r12]
        str     r8, [r12, #4]
        b       LCFK13
LCFK10:
        ldr     r0, [sp, #0x1CC]
        ldr     r8, [sp, #0x1D0]
        str     r0, [r12]
        str     r8, [r12, #4]
        b       LCFK13
LCFK11:
        cmp     r0, r6
        bcc     LCFK62
        tst     r0, #2, 14
        beq     LCFK12
        ldr     r8, [lr, #4]
        ldr     r0, [lr]
        eor     r8, r8, #2, 2
        str     r8, [r12, #4]
        str     r0, [r12]
        b       LCFK13
LCFK12:
        ldr     r0, [sp, #0x1C4]
        ldr     r8, [sp, #0x1C8]
        str     r0, [r12]
        str     r8, [r12, #4]
LCFK13:
        subs    r4, r4, #1
        sub     r12, r12, #8
        sub     r2, r2, #8
        bpl     LCFK9
        ldr     r8, [sp, #0x58]
        str     r10, [sp, #0x40]
        str     r4, [sp, #0x34]
LCFK14:
        ldr     r2, [sp, #0x34]
        subs    r12, r2, #1
        ldr     r2, [sp, #0x40]
        str     r12, [sp, #0x38]
        add     r2, r9, r2
        movmi   r12, #0
        strmi   r12, [sp, #0x44]
        bmi     LCFK20
        ldr     r12, [sp, #0x38]
        ldr     r4, [pc, #0xCA8]
        ldr     r1, [sp, #0x38]
        ldr     r5, [sp, #0x30]
        ldr     r6, [sp, #0x2C]
        add     lr, r7, r12, lsl #3
        add     r12, r8, r12, lsl #3
        str     r7, [sp, #0x54]
        str     r8, [sp, #0x58]
LCFK15:
        ldr     r10, [r12]
        ldr     r0, [r12, #4]
        mvn     r8, #2, 2
        str     r10, [sp, #0x1DC]
        and     r10, r0, r8
        cmp     r10, r5
        str     r0, [sp, #0x1E0]
        bic     r8, r0, r8
        bcc     LCFK61
        cmp     r8, #0
        beq     LCFK17
        tst     r0, #2, 14
        beq     LCFK16
        ldr     r0, [r4]
        ldr     r7, [r4, #4]
        str     r0, [lr]
        str     r7, [lr, #4]
        b       LCFK19
LCFK16:
        ldr     r0, [sp, #0x1CC]
        ldr     r7, [sp, #0x1D0]
        str     r0, [lr]
        str     r7, [lr, #4]
        b       LCFK19
LCFK17:
        cmp     r0, r6
        bcc     LCFK60
        tst     r0, #2, 14
        beq     LCFK18
        ldr     r7, [r4, #4]
        ldr     r0, [r4]
        eor     r7, r7, #2, 2
        str     r7, [lr, #4]
        str     r0, [lr]
        b       LCFK19
LCFK18:
        ldr     r0, [sp, #0x1C4]
        ldr     r7, [sp, #0x1C8]
        str     r0, [lr]
        str     r7, [lr, #4]
LCFK19:
        subs    r1, r1, #1
        sub     lr, lr, #8
        sub     r12, r12, #8
        bpl     LCFK15
        str     r8, [sp, #0x44]
        ldr     r7, [sp, #0x54]
        ldr     r8, [sp, #0x58]
        str     r1, [sp, #0x38]
LCFK20:
        ldr     r12, [sp, #0x38]
        subs    r6, r12, #1
        ldr     r12, [sp, #0x44]
        add     r12, r9, r12
        movmi   lr, #0
        strmi   lr, [sp, #0x48]
        bmi     LCFK26
        ldr     r5, [pc, #0xBB8]
        add     r4, r7, r6, lsl #3
        str     r7, [sp, #0x54]
        ldr     r1, [sp, #0x30]
        ldr     r7, [sp, #0x2C]
        add     lr, r8, r6, lsl #3
        str     r9, [sp, #0x50]
        str     r8, [sp, #0x58]
LCFK21:
        ldr     r10, [lr]
        ldr     r0, [lr, #4]
        mvn     r9, #2, 2
        str     r10, [sp, #0x1D4]
        and     r10, r0, r9
        cmp     r10, r1
        str     r0, [sp, #0x1D8]
        bic     r9, r0, r9
        bcc     LCFK59
        cmp     r9, #0
        beq     LCFK23
        tst     r0, #2, 14
        beq     LCFK22
        ldr     r0, [r5]
        ldr     r8, [r5, #4]
        str     r0, [r4]
        str     r8, [r4, #4]
        b       LCFK25
LCFK22:
        ldr     r0, [sp, #0x1CC]
        ldr     r8, [sp, #0x1D0]
        str     r0, [r4]
        str     r8, [r4, #4]
        b       LCFK25
LCFK23:
        cmp     r0, r7
        bcc     LCFK58
        tst     r0, #2, 14
        beq     LCFK24
        ldr     r8, [r5, #4]
        ldr     r0, [r5]
        eor     r8, r8, #2, 2
        str     r8, [r4, #4]
        str     r0, [r4]
        b       LCFK25
LCFK24:
        ldr     r0, [sp, #0x1C4]
        ldr     r8, [sp, #0x1C8]
        str     r0, [r4]
        str     r8, [r4, #4]
LCFK25:
        subs    r6, r6, #1
        sub     r4, r4, #8
        sub     lr, lr, #8
        bpl     LCFK21
        str     r9, [sp, #0x48]
        ldr     r9, [sp, #0x50]
        ldr     r7, [sp, #0x54]
        ldr     r8, [sp, #0x58]
LCFK26:
        ldr     lr, [sp, #0x48]
        cmp     r6, #0
        add     lr, r9, lr
        blt     LCFK49
        ldr     r4, [pc, #0xAD4]
        ldr     r11, [sp, #0x1EC]
        ldr     r1, [sp, #0x1D8]
        ldr     r10, [r4, #4]
        ldr     r0, [sp, #0x1C4]
        str     r11, [sp, #8]
        ldr     r11, [sp, #0x1F0]
        str     r11, [sp, #4]
        ldr     r11, [sp, #0x1E4]
        str     r11, [sp]
        ldr     r11, [sp, #0x1E8]
        str     r11, [sp, #0x20]
        ldr     r11, [sp, #0x1DC]
        str     r11, [sp, #0x24]
        ldr     r11, [sp, #0x1E0]
        str     r11, [sp, #0x10]
        ldr     r11, [sp, #0x1D4]
        str     r11, [sp, #0x14]
        ldr     r4, [r4]
        ldr     r11, [sp, #0x1C8]
        str     r4, [sp, #0xC]
        ldr     r4, [sp, #0x1CC]
        str     r4, [sp, #0x18]
        ldr     r4, [sp, #0x1D0]
        str     r4, [sp, #0x1C]
        str     lr, [sp, #0x168]
        str     r12, [sp, #0x170]
        str     r2, [sp, #0x178]
        str     r3, [sp, #0x180]
        eor     r4, r10, #2, 2
        str     r4, [sp, #0x68]
        str     r10, [sp, #0x64]
        str     r11, [sp, #0x60]
        str     r0, [sp, #0x5C]
        str     r1, [sp, #0xE8]
        str     lr, [sp, #0xA0]
        str     r12, [sp, #0x74]
        str     r2, [sp, #0x70]
        str     r3, [sp, #0x6C]
LCFK27:
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #4]
        ldr     r2, [pc, #0xA34]
        ldr     r3, [pc, #0xA34]
        bl      __muldf3
        ldr     r2, [pc, #0xA28]
        ldr     r3, [pc, #0xA28]
        mov     r5, r1
        mov     r4, r0
        ldr     r0, [sp]
        ldr     r1, [sp, #0x20]
        bl      __muldf3
        ldr     r10, [sp, #0x17C]
        ldr     r11, [sp, #0x180]
        str     r1, [sp, #0x15C]
        str     r0, [sp, #0x160]
        mov     r0, r4
        mov     r1, r5
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        ldr     r4, [sp, #0x174]
        ldr     r5, [sp, #0x178]
        str     r0, [sp, #0x158]
        str     r0, [sp, #0x19C]
        str     r1, [sp, #0x154]
        str     r1, [sp, #0x1A0]
        ldr     r1, [sp, #0x15C]
        ldr     r0, [sp, #0x160]
        mov     r3, r5
        mov     r2, r4
        bl      __adddf3
        ldr     r2, [sp, #0x19C]
        str     r0, [sp, #0xA4]
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
        str     r1, [sp, #0x158]
        ldr     r0, [sp, #0xA4]
        ldr     r1, [sp, #0x160]
        mov     r2, r4
        mov     r3, r5
        bl      __subdf3
        str     r0, [sp, #0x160]
        ldr     r0, [sp, #0x24]
        ldr     r2, [pc, #0x96C]
        ldr     r3, [pc, #0x96C]
        str     r1, [sp, #0x154]
        ldr     r1, [sp, #0x10]
        bl      __muldf3
        ldr     r2, [pc, #0x958]
        ldr     r3, [pc, #0x958]
        mov     r4, r0
        ldr     r0, [sp, #0x14]
        mov     r5, r1
        ldr     r1, [sp, #0xE8]
        bl      __muldf3
        ldr     r2, [sp, #0x16C]
        str     r1, [sp, #0x144]
        str     r2, [sp, #0x150]
        ldr     r2, [sp, #0x170]
        str     r0, [sp, #0x148]
        mov     r0, r4
        str     r2, [sp, #0x14C]
        ldr     r3, [sp, #0x14C]
        ldr     r2, [sp, #0x150]
        mov     r1, r5
        bl      __adddf3
        ldr     r5, [sp, #0x164]
        ldr     r4, [sp, #0x168]
        str     r0, [sp, #0x140]
        str     r0, [sp, #0x18C]
        str     r1, [sp, #0x13C]
        str     r1, [sp, #0x190]
        ldr     r0, [sp, #0x148]
        ldr     r1, [sp, #0x144]
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        ldr     r2, [sp, #0x18C]
        mov     r10, r0
        str     r10, [sp, #0xF4]
        mov     r11, r1
        str     r2, [sp, #0x7C]
        str     r10, [sp, #0x184]
        str     r11, [sp, #0x188]
        ldr     r3, [sp, #0x14C]
        ldr     r2, [sp, #0x150]
        ldr     r0, [sp, #0x140]
        ldr     r1, [sp, #0x13C]
        bl      __subdf3
        str     r0, [sp, #0x150]
        str     r1, [sp, #0x14C]
        mov     r2, r5
        mov     r1, r11
        mov     r0, r10
        mov     r3, r4
        bl      __subdf3
        ldr     r5, [pc, #0x8A0]
        mov     r10, r0
        ldr     r0, [sp, #0x15C]
        mov     r11, r1
        ldr     r1, [sp, #0x158]
        mov     r2, #0
        sub     r4, r2, #0x12, 12
        mov     r3, r5
        mov     r2, r4
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #8]
        mov     r3, r1
        ldr     r1, [sp, #4]
        bl      __subdf3
        str     r0, [sp, #0xC8]
        ldr     r0, [sp, #0x160]
        str     r1, [sp, #0xCC]
        ldr     r1, [sp, #0x154]
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp]
        mov     r3, r1
        ldr     r1, [sp, #0x20]
        bl      __subdf3
        str     r0, [sp, #0xB8]
        ldr     r0, [sp, #0x150]
        str     r1, [sp, #0xBC]
        ldr     r1, [sp, #0x14C]
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x24]
        mov     r3, r1
        ldr     r1, [sp, #0x10]
        bl      __subdf3
        str     r0, [sp, #0xB0]
        str     r1, [sp, #0xB4]
        mov     r2, r4
        mov     r0, r10
        mov     r3, r5
        mov     r1, r11
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x14]
        mov     r3, r1
        ldr     r1, [sp, #0xE8]
        bl      __subdf3
        ldr     r4, [pc, #0x7D8]
        ldr     r5, [pc, #0x7D8]
        str     r0, [sp, #0xA8]
        ldr     r0, [sp, #0x15C]
        str     r1, [sp, #0xAC]
        ldr     r1, [sp, #0x158]
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        str     r0, [sp, #0xE0]
        ldr     r0, [sp, #0x160]
        str     r1, [sp, #0xE4]
        ldr     r1, [sp, #0x154]
        mov     r3, r5
        mov     r2, r4
        bl      __muldf3
        str     r0, [sp, #0xD8]
        ldr     r0, [sp, #0x150]
        str     r1, [sp, #0xDC]
        ldr     r1, [sp, #0x14C]
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        str     r1, [sp, #0xD4]
        str     r0, [sp, #0xD0]
        mov     r1, r11
        mov     r3, r5
        mov     r0, r10
        mov     r2, r4
        bl      __muldf3
        mov     r5, r1
        str     r5, [sp, #0xC4]
        mov     r4, r0
        ldr     r2, [sp, #0xE0]
        ldr     r3, [sp, #0xE4]
        ldr     r0, [sp, #0xC8]
        ldr     r1, [sp, #0xCC]
        str     r4, [sp, #0xC0]
        bl      __subdf3
        str     r0, [sp, #0x124]
        str     r1, [sp, #0x128]
        ldr     r0, [sp, #0xB8]
        ldr     r1, [sp, #0xBC]
        ldr     r2, [sp, #0xD8]
        ldr     r3, [sp, #0xDC]
        bl      __subdf3
        ldr     r2, [sp, #0xD0]
        ldr     r3, [sp, #0xD4]
        str     r0, [sp, #0x11C]
        ldr     r0, [sp, #0xB0]
        str     r1, [sp, #0x120]
        ldr     r1, [sp, #0xB4]
        bl      __subdf3
        str     r1, [sp, #0x118]
        ldr     r1, [sp, #0xAC]
        str     r0, [sp, #0x114]
        ldr     r0, [sp, #0xA8]
        mov     r2, r4
        mov     r3, r5
        bl      __subdf3
        str     r0, [sp, #0x10C]
        ldr     r3, [sp, #0x128]
        ldr     r0, [sp, #0x124]
        str     r1, [sp, #0x110]
        ldr     r1, [sp, #0x128]
        mov     r2, r0
        bl      __muldf3
        ldr     r3, [sp, #0x120]
        str     r0, [sp, #0x160]
        ldr     r0, [sp, #0x11C]
        str     r1, [sp, #0x15C]
        ldr     r1, [sp, #0x120]
        mov     r2, r0
        bl      __muldf3
        ldr     r2, [sp, #0x114]
        str     r1, [sp, #0x154]
        ldr     r1, [sp, #0x118]
        ldr     r3, [sp, #0x118]
        str     r0, [sp, #0x158]
        mov     r0, r2
        bl      __muldf3
        ldr     r3, [sp, #0x110]
        mov     r11, r0
        ldr     r0, [sp, #0x10C]
        mov     r10, r1
        ldr     r1, [sp, #0x110]
        mov     r2, r0
        bl      __muldf3
        mov     r4, r0
        ldr     r0, [sp, #0x160]
        ldr     r2, [pc, #0x678]
        ldr     r3, [pc, #0x678]
        mov     r5, r1
        ldr     r1, [sp, #0x15C]
        bl      __muldf3
        ldr     r2, [pc, #0x66C]
        ldr     r3, [pc, #0x66C]
        bl      __adddf3
        ldr     r2, [sp, #0x160]
        ldr     r3, [sp, #0x15C]
        bl      __muldf3
        ldr     r2, [pc, #0x65C]
        ldr     r3, [pc, #0x65C]
        bl      __adddf3
        ldr     r3, [sp, #0x15C]
        ldr     r2, [sp, #0x160]
        bl      __muldf3
        ldr     r2, [pc, #0x64C]
        ldr     r3, [pc, #0x64C]
        bl      __adddf3
        ldr     r2, [sp, #0x160]
        ldr     r3, [sp, #0x15C]
        bl      __muldf3
        ldr     r2, [pc, #0x63C]
        ldr     r3, [pc, #0x63C]
        bl      __adddf3
        ldr     r2, [sp, #0x160]
        ldr     r3, [sp, #0x15C]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [sp, #0x124]
        ldr     r1, [sp, #0x128]
        bl      __subdf3
        str     r0, [sp, #0xEC]
        str     r1, [sp, #0xF0]
        ldr     r2, [pc, #0x5E8]
        ldr     r3, [pc, #0x5E8]
        ldr     r0, [sp, #0x158]
        ldr     r1, [sp, #0x154]
        bl      __muldf3
        ldr     r2, [pc, #0x5DC]
        ldr     r3, [pc, #0x5DC]
        bl      __adddf3
        ldr     r2, [sp, #0x158]
        ldr     r3, [sp, #0x154]
        bl      __muldf3
        ldr     r2, [pc, #0x5CC]
        ldr     r3, [pc, #0x5CC]
        bl      __adddf3
        ldr     r2, [sp, #0x158]
        ldr     r3, [sp, #0x154]
        bl      __muldf3
        ldr     r2, [pc, #0x5BC]
        ldr     r3, [pc, #0x5BC]
        bl      __adddf3
        ldr     r2, [sp, #0x158]
        ldr     r3, [sp, #0x154]
        bl      __muldf3
        ldr     r2, [pc, #0x5AC]
        ldr     r3, [pc, #0x5AC]
        bl      __adddf3
        ldr     r2, [sp, #0x158]
        ldr     r3, [sp, #0x154]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [sp, #0x11C]
        ldr     r1, [sp, #0x120]
        bl      __subdf3
        ldr     r2, [pc, #0x560]
        ldr     r3, [pc, #0x560]
        str     r0, [sp, #0xF8]
        str     r1, [sp, #0xFC]
        mov     r0, r11
        mov     r1, r10
        bl      __muldf3
        ldr     r2, [pc, #0x54C]
        ldr     r3, [pc, #0x54C]
        bl      __adddf3
        mov     r3, r10
        mov     r2, r11
        bl      __muldf3
        ldr     r2, [pc, #0x53C]
        ldr     r3, [pc, #0x53C]
        bl      __adddf3
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [pc, #0x52C]
        ldr     r3, [pc, #0x52C]
        bl      __adddf3
        mov     r3, r10
        mov     r2, r11
        bl      __muldf3
        ldr     r2, [pc, #0x51C]
        ldr     r3, [pc, #0x51C]
        bl      __adddf3
        mov     r3, r10
        mov     r2, r11
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x114]
        mov     r3, r1
        ldr     r1, [sp, #0x118]
        bl      __subdf3
        ldr     r2, [pc, #0x4D0]
        ldr     r3, [pc, #0x4D0]
        mov     r10, r1
        mov     r11, r0
        str     r11, [sp, #0x104]
        str     r10, [sp, #0x108]
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        ldr     r2, [pc, #0x4B4]
        ldr     r3, [pc, #0x4B4]
        bl      __adddf3
        mov     r3, r5
        mov     r2, r4
        bl      __muldf3
        ldr     r2, [pc, #0x4A4]
        ldr     r3, [pc, #0x4A4]
        bl      __adddf3
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [pc, #0x494]
        ldr     r3, [pc, #0x494]
        bl      __adddf3
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [pc, #0x484]
        ldr     r3, [pc, #0x484]
        bl      __adddf3
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [sp, #0x10C]
        ldr     r1, [sp, #0x110]
        bl      __subdf3
        ldr     r2, [sp, #0xEC]
        ldr     r3, [sp, #0xF0]
        mov     r4, r0
        str     r4, [sp, #0x160]
        mov     r5, r1
        str     r5, [sp, #0x15C]
        mov     r0, #0
        mov     r1, #1, 2
        bl      __subdf3
        ldr     r2, [sp, #0xF8]
        ldr     r3, [sp, #0xFC]
        str     r0, [sp, #0x140]
        str     r1, [sp, #0x13C]
        mov     r0, #0
        mov     r1, #1, 2
        bl      __subdf3
        str     r0, [sp, #0x144]
        str     r1, [sp, #0x148]
        mov     r0, #0
        mov     r1, #1, 2
        mov     r3, r10
        mov     r2, r11
        bl      __subdf3
        str     r0, [sp, #0x130]
        str     r1, [sp, #0x12C]
        mov     r3, r5
        mov     r2, r4
        mov     r0, #0
        mov     r1, #1, 2
        bl      __subdf3
        ldr     r2, [sp, #0x144]
        ldr     r3, [sp, #0x148]
        mov     r4, r0
        ldr     r0, [sp, #0x140]
        str     r4, [sp, #0x134]
        mov     r11, r1
        ldr     r1, [sp, #0x13C]
        str     r11, [sp, #0x138]
        bl      __muldf3
        mov     r5, r0
        mov     r10, r1
        ldr     r0, [sp, #0x130]
        ldr     r1, [sp, #0x12C]
        str     r5, [sp, #0x158]
        str     r10, [sp, #0x154]
        mov     r2, r4
        mov     r3, r11
        bl      __muldf3
        str     r1, [sp, #0x9C]
        mov     r4, r0
        mov     r2, r5
        mov     r3, r10
        bl      __muldf3
        mov     r3, r1
        mov     r12, #0xFF, 12
        mov     r2, r0
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __divdf3
        ldr     r12, [sp, #0x3C]
        ldr     r3, [sp, #0x28]
        str     r12, [sp, #0x98]
        ldr     r12, [sp, #0x40]
        str     r3, [sp, #0x88]
        str     r12, [sp, #0x94]
        ldr     r12, [sp, #0x44]
        subs    r3, r6, #1
        str     r3, [sp, #0x28]
        str     r12, [sp, #0x90]
        ldr     r12, [sp, #0x48]
        str     r0, [sp, #0x14C]
        str     r12, [sp, #0x8C]
        ldr     r12, [sp, #0x34]
        str     r1, [sp, #0x150]
        str     r12, [sp, #0x100]
        ldr     r12, [sp, #0x38]
        str     r6, [sp, #0x80]
        str     r12, [sp, #0x84]
        bmi     LCFK32
        ldr     r3, [sp, #0x28]
        ldr     r0, [sp, #0x1C]
        ldr     r1, [sp, #0x18]
        add     r12, r7, r3, lsl #3
        add     r3, r8, r3, lsl #3
        str     r4, [sp, #0x4C]
        str     r9, [sp, #0x50]
        str     r7, [sp, #0x54]
        str     r8, [sp, #0x58]
        ldr     r2, [sp, #0x64]
        ldr     lr, [sp, #0xC]
        ldr     r4, [sp, #0x60]
        ldr     r7, [sp, #0x28]
        ldr     r8, [sp, #0x30]
        ldr     r9, [sp, #0x2C]
LCFK28:
        ldr     r5, [r3, #4]
        ldr     r6, [r3]
        mvn     r10, #2, 2
        and     r11, r5, r10
        cmp     r11, r8
        str     r6, [sp, #0x1EC]
        str     r5, [sp, #0x1F0]
        bic     r10, r5, r10
        bcc     LCFK57
        cmp     r10, #0
        beq     LCFK29
        tst     r5, #2, 14
        streq   r1, [r12]
        streq   r0, [r12, #4]
        strne   lr, [r12]
        strne   r2, [r12, #4]
        b       LCFK31
LCFK29:
        cmp     r5, r9
        bcc     LCFK56
        tst     r5, #2, 14
        beq     LCFK30
        str     lr, [r12]
        ldr     r11, [sp, #0x68]
        str     r11, [r12, #4]
        b       LCFK31
LCFK30:
        ldr     r11, [sp, #0x5C]
        str     r4, [r12, #4]
        str     r11, [r12]
LCFK31:
        subs    r7, r7, #1
        sub     r12, r12, #8
        sub     r3, r3, #8
        bpl     LCFK28
        str     r10, [sp, #0x3C]
        ldr     r3, [sp, #0x3C]
        ldr     r9, [sp, #0x50]
        str     r4, [sp, #0x60]
        str     r7, [sp, #0x28]
        ldr     r4, [sp, #0x4C]
        ldr     r7, [sp, #0x54]
        ldr     r8, [sp, #0x58]
        add     r3, r9, r3
        str     r2, [sp, #0x64]
        str     r5, [sp, #4]
        str     r6, [sp, #8]
        str     r3, [sp, #0x6C]
LCFK32:
        ldr     r3, [sp, #0x28]
        subs    r3, r3, #1
        str     r3, [sp, #0x34]
        bmi     LCFK37
        ldr     r3, [sp, #0x34]
        ldr     r0, [sp, #0x1C]
        ldr     r1, [sp, #0x18]
        add     r12, r7, r3, lsl #3
        add     r3, r8, r3, lsl #3
        str     r4, [sp, #0x4C]
        str     r9, [sp, #0x50]
        str     r7, [sp, #0x54]
        str     r8, [sp, #0x58]
        ldr     r2, [sp, #0x64]
        ldr     lr, [sp, #0xC]
        ldr     r4, [sp, #0x60]
        ldr     r7, [sp, #0x34]
        ldr     r8, [sp, #0x30]
        ldr     r9, [sp, #0x2C]
LCFK33:
        ldr     r5, [r3, #4]
        ldr     r6, [r3]
        mvn     r10, #2, 2
        and     r11, r5, r10
        cmp     r11, r8
        str     r6, [sp, #0x1E4]
        str     r5, [sp, #0x1E8]
        bic     r10, r5, r10
        bcc     LCFK55
        cmp     r10, #0
        beq     LCFK34
        tst     r5, #2, 14
        streq   r1, [r12]
        streq   r0, [r12, #4]
        strne   lr, [r12]
        strne   r2, [r12, #4]
        b       LCFK36
LCFK34:
        cmp     r5, r9
        bcc     LCFK54
        tst     r5, #2, 14
        beq     LCFK35
        str     lr, [r12]
        ldr     r11, [sp, #0x68]
        str     r11, [r12, #4]
        b       LCFK36
LCFK35:
        ldr     r11, [sp, #0x5C]
        str     r4, [r12, #4]
        str     r11, [r12]
LCFK36:
        subs    r7, r7, #1
        sub     r12, r12, #8
        sub     r3, r3, #8
        bpl     LCFK33
        str     r10, [sp, #0x40]
        ldr     r3, [sp, #0x40]
        ldr     r9, [sp, #0x50]
        str     r4, [sp, #0x60]
        str     r7, [sp, #0x34]
        ldr     r4, [sp, #0x4C]
        ldr     r7, [sp, #0x54]
        ldr     r8, [sp, #0x58]
        add     r3, r9, r3
        str     r2, [sp, #0x64]
        str     r5, [sp, #0x20]
        str     r6, [sp]
        str     r3, [sp, #0x70]
LCFK37:
        ldr     r3, [sp, #0x34]
        subs    r3, r3, #1
        str     r3, [sp, #0x38]
        bmi     LCFK42
        ldr     r3, [sp, #0x38]
        ldr     r0, [sp, #0x1C]
        ldr     r1, [sp, #0x18]
        add     r12, r7, r3, lsl #3
        add     r3, r8, r3, lsl #3
        str     r4, [sp, #0x4C]
        str     r9, [sp, #0x50]
        str     r7, [sp, #0x54]
        str     r8, [sp, #0x58]
        ldr     r2, [sp, #0x64]
        ldr     lr, [sp, #0xC]
        ldr     r4, [sp, #0x60]
        ldr     r7, [sp, #0x38]
        ldr     r8, [sp, #0x30]
        ldr     r9, [sp, #0x2C]
LCFK38:
        ldr     r5, [r3, #4]
        ldr     r6, [r3]
        mvn     r10, #2, 2
        and     r11, r5, r10
        cmp     r11, r8
        str     r6, [sp, #0x1DC]
        str     r5, [sp, #0x1E0]
        bic     r10, r5, r10
        bcc     LCFK53
        cmp     r10, #0
        beq     LCFK39
        tst     r5, #2, 14
        streq   r1, [r12]
        streq   r0, [r12, #4]
        strne   lr, [r12]
        strne   r2, [r12, #4]
        b       LCFK41
LCFK39:
        cmp     r5, r9
        bcc     LCFK52
        tst     r5, #2, 14
        beq     LCFK40
        str     lr, [r12]
        ldr     r11, [sp, #0x68]
        str     r11, [r12, #4]
        b       LCFK41
        .long   LCFK_c2.3622.0.0.0
        .long   LCFK_c1.3622.0.0.0
        .long   LCFK_c3.3622.0.0.0
        .long   LCFK_c4.3622.0.0.0
        .long   LCFK_x1.3622.0.0.0
        .long   LCFK_x2.3622.0.0.0
        .long   LCFK_x3.3622.0.0.0
        .long   LCFK_x4.3622.0.0.0
        .long   LCFK_maxd.3622.0.0.0
        .long   LCFK_mind.3622.0.0.0
        .long   LCFK_x1.3622.0.0.0
        .long   LCFK_x2.3622.0.0.0
        .long   LCFK_x3.3622.0.0.0
        .long   LCFK_x4.3622.0.0.0
        .long   LCFK_ln_maxd.3622.0.0.0
        .long   LCFK_ln_mind.3622.0.0.0
        .long   LCFK_maxd.3622.0.0.0
        .long   LCFK_mind.3622.0.0.0
        .long   LCFK_coef.3622.0.0.0
        .long   ippConstantOfNAN_64f
        .long   0x652b82fe
        .long   0x3ff71547
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
LCFK40:
        ldr     r11, [sp, #0x5C]
        str     r4, [r12, #4]
        str     r11, [r12]
LCFK41:
        subs    r7, r7, #1
        sub     r12, r12, #8
        sub     r3, r3, #8
        bpl     LCFK38
        str     r10, [sp, #0x44]
        ldr     r3, [sp, #0x44]
        ldr     r9, [sp, #0x50]
        str     r4, [sp, #0x60]
        str     r7, [sp, #0x38]
        ldr     r4, [sp, #0x4C]
        ldr     r7, [sp, #0x54]
        ldr     r8, [sp, #0x58]
        add     r3, r9, r3
        str     r2, [sp, #0x64]
        str     r5, [sp, #0x10]
        str     r6, [sp, #0x24]
        str     r3, [sp, #0x74]
LCFK42:
        ldr     r3, [sp, #0x38]
        subs    r6, r3, #1
        bmi     LCFK47
        add     r3, r8, r6, lsl #3
        str     r4, [sp, #0x4C]
        str     r9, [sp, #0x50]
        str     r8, [sp, #0x58]
        ldr     r0, [sp, #0x1C]
        ldr     r1, [sp, #0x18]
        ldr     r2, [sp, #0x64]
        ldr     lr, [sp, #0xC]
        ldr     r4, [sp, #0x60]
        ldr     r8, [sp, #0x30]
        ldr     r9, [sp, #0x2C]
        add     r12, r7, r6, lsl #3
        str     r7, [sp, #0x54]
LCFK43:
        ldr     r5, [r3, #4]
        ldr     r7, [r3]
        mvn     r10, #2, 2
        and     r11, r5, r10
        cmp     r11, r8
        str     r7, [sp, #0x1D4]
        str     r5, [sp, #0x1D8]
        bic     r10, r5, r10
        bcc     LCFK51
        cmp     r10, #0
        beq     LCFK44
        tst     r5, #2, 14
        streq   r1, [r12]
        streq   r0, [r12, #4]
        strne   lr, [r12]
        strne   r2, [r12, #4]
        b       LCFK46
LCFK44:
        cmp     r5, r9
        bcc     LCFK50
        tst     r5, #2, 14
        beq     LCFK45
        str     lr, [r12]
        ldr     r11, [sp, #0x68]
        str     r11, [r12, #4]
        b       LCFK46
LCFK45:
        ldr     r11, [sp, #0x5C]
        str     r4, [r12, #4]
        str     r11, [r12]
LCFK46:
        subs    r6, r6, #1
        sub     r12, r12, #8
        sub     r3, r3, #8
        bpl     LCFK43
        str     r10, [sp, #0x48]
        ldr     r3, [sp, #0x48]
        ldr     r9, [sp, #0x50]
        str     r4, [sp, #0x60]
        str     r7, [sp, #0x14]
        ldr     r4, [sp, #0x4C]
        ldr     r7, [sp, #0x54]
        ldr     r8, [sp, #0x58]
        add     r3, r9, r3
        str     r2, [sp, #0x64]
        str     r5, [sp, #0xE8]
        str     r3, [sp, #0xA0]
LCFK47:
        ldr     r2, [sp, #0x124]
        ldr     r3, [sp, #0x128]
        ldr     r0, [sp, #0xEC]
        ldr     r1, [sp, #0xF0]
        bl      __muldf3
        ldr     r2, [sp, #0x11C]
        ldr     r3, [sp, #0x120]
        str     r0, [sp, #0x128]
        str     r1, [sp, #0x124]
        ldr     r0, [sp, #0xF8]
        ldr     r1, [sp, #0xFC]
        bl      __muldf3
        ldr     r2, [sp, #0x114]
        ldr     r3, [sp, #0x118]
        str     r0, [sp, #0x120]
        ldr     r0, [sp, #0x104]
        str     r1, [sp, #0x11C]
        ldr     r1, [sp, #0x108]
        bl      __muldf3
        ldr     r2, [sp, #0x10C]
        ldr     r3, [sp, #0x110]
        str     r0, [sp, #0x118]
        ldr     r0, [sp, #0x160]
        str     r1, [sp, #0x114]
        ldr     r1, [sp, #0x15C]
        bl      __muldf3
        ldr     r10, [sp, #0x14C]
        ldr     r11, [sp, #0x150]
        ldr     r3, [sp, #0x9C]
        str     r0, [sp, #0x160]
        str     r1, [sp, #0x15C]
        mov     r2, r4
        mov     r1, r11
        mov     r0, r10
        bl      __muldf3
        ldr     r3, [sp, #0x154]
        ldr     r2, [sp, #0x158]
        mov     r4, r0
        mov     r5, r1
        mov     r1, r11
        mov     r0, r10
        bl      __muldf3
        ldr     r2, [sp, #0x144]
        ldr     r3, [sp, #0x148]
        mov     r11, r1
        mov     r10, r0
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        ldr     r2, [sp, #0x128]
        ldr     r3, [sp, #0x124]
        bl      __muldf3
        ldr     r2, [sp, #0x140]
        ldr     r3, [sp, #0x13C]
        str     r1, [sp, #0x154]
        str     r0, [sp, #0x158]
        mov     r1, r5
        mov     r0, r4
        bl      __muldf3
        ldr     r2, [sp, #0x120]
        ldr     r3, [sp, #0x11C]
        bl      __muldf3
        ldr     r2, [sp, #0x134]
        ldr     r3, [sp, #0x138]
        str     r0, [sp, #0x150]
        str     r1, [sp, #0x14C]
        mov     r0, r10
        mov     r1, r11
        bl      __muldf3
        ldr     r2, [sp, #0x118]
        ldr     r3, [sp, #0x114]
        bl      __muldf3
        ldr     r2, [sp, #0x130]
        ldr     r3, [sp, #0x12C]
        str     r0, [sp, #0x148]
        mov     r4, r1
        mov     r0, r10
        mov     r1, r11
        bl      __muldf3
        ldr     r2, [sp, #0x160]
        ldr     r3, [sp, #0x15C]
        bl      __muldf3
        ldr     r2, [sp, #0x158]
        ldr     r3, [sp, #0x154]
        mov     r5, #0xFF, 12
        mov     r11, r0
        mov     r10, r1
        mov     r0, #0
        orr     r5, r5, #3, 4
        mov     r1, r5
        bl      __adddf3
        ldr     r2, [sp, #0xC8]
        ldr     r3, [sp, #0xCC]
        bl      __adddf3
        ldr     r2, [sp, #0xE0]
        ldr     r3, [sp, #0xE4]
        bl      __subdf3
        str     r0, [sp, #0x1BC]
        str     r1, [sp, #0x1C0]
        ldr     r2, [sp, #0x150]
        ldr     r3, [sp, #0x14C]
        mov     r0, #0
        mov     r1, r5
        bl      __adddf3
        ldr     r2, [sp, #0xB8]
        ldr     r3, [sp, #0xBC]
        bl      __adddf3
        ldr     r2, [sp, #0xD8]
        ldr     r3, [sp, #0xDC]
        bl      __subdf3
        str     r0, [sp, #0x1B4]
        str     r1, [sp, #0x1B8]
        ldr     r2, [sp, #0x148]
        mov     r0, #0
        mov     r1, r5
        mov     r3, r4
        bl      __adddf3
        ldr     r2, [sp, #0xB0]
        ldr     r3, [sp, #0xB4]
        bl      __adddf3
        ldr     r2, [sp, #0xD0]
        ldr     r3, [sp, #0xD4]
        bl      __subdf3
        str     r0, [sp, #0x1AC]
        str     r1, [sp, #0x1B0]
        mov     r0, #0
        mov     r1, r5
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        ldr     r2, [sp, #0xA8]
        ldr     r3, [sp, #0xAC]
        bl      __adddf3
        ldr     r2, [sp, #0xC0]
        ldr     r3, [sp, #0xC4]
        bl      __subdf3
        ldr     r2, [sp, #0x1C0]
        str     r0, [sp, #0x1A4]
        ldr     r12, [sp, #0x98]
        str     r1, [sp, #0x1A8]
        cmp     r12, #0
        ldreq   r3, [sp, #0x78]
        addeq   r3, r2, r3, lsl #20
        ldrne   r3, [sp, #0x78]
        subne   r3, r2, r3, lsl #20
        ldr     r12, [sp, #0x94]
        ldr     r2, [sp, #0x1B8]
        str     r3, [sp, #0x1C0]
        cmp     r12, #0
        ldreq   r3, [sp, #0xA4]
        addeq   r3, r2, r3, lsl #20
        ldrne   r3, [sp, #0xA4]
        subne   r3, r2, r3, lsl #20
        ldr     r12, [sp, #0x90]
        ldr     r2, [sp, #0x1B0]
        str     r3, [sp, #0x1B8]
        cmp     r12, #0
        ldreq   r3, [sp, #0x7C]
        addeq   r3, r2, r3, lsl #20
        ldrne   r3, [sp, #0x7C]
        subne   r3, r2, r3, lsl #20
        ldr     r12, [sp, #0x8C]
        ldr     r2, [sp, #0x1A8]
        str     r3, [sp, #0x1B0]
        cmp     r12, #0
        ldreq   r3, [sp, #0xF4]
        addeq   r2, r2, r3, lsl #20
        ldrne   r3, [sp, #0xF4]
        subne   r2, r2, r3, lsl #20
        ldr     r5, [sp, #0x88]
        ldr     r3, [sp, #0x1BC]
        ldr     r4, [sp, #0x1C0]
        ldr     lr, [sp, #0x1B4]
        cmp     r6, #0
        str     r3, [r7, +r5, lsl #3]
        ldr     r3, [sp, #0x1B8]
        add     r5, r7, r5, lsl #3
        str     r4, [r5, #4]
        ldr     r5, [sp, #0x100]
        ldr     r4, [sp, #0x1AC]
        str     r2, [sp, #0x1A8]
        str     lr, [r7, +r5, lsl #3]
        ldr     lr, [sp, #0x1B0]
        add     r5, r7, r5, lsl #3
        str     r3, [r5, #4]
        ldr     r12, [sp, #0x84]
        ldr     r3, [sp, #0x1A4]
        str     r4, [r7, +r12, lsl #3]
        add     r12, r7, r12, lsl #3
        str     lr, [r12, #4]
        ldr     r12, [sp, #0x80]
        str     r3, [r7, +r12, lsl #3]
        add     r12, r7, r12, lsl #3
        str     r2, [r12, #4]
        blt     LCFK49
        ldr     lr, [sp, #0xA0]
        str     lr, [sp, #0x168]
        ldr     lr, [sp, #0x74]
        str     lr, [sp, #0x170]
        ldr     r12, [sp, #0x70]
        str     r12, [sp, #0x178]
        ldr     r3, [sp, #0x6C]
        str     r3, [sp, #0x180]
        b       LCFK27
LCFK48:
        mvn     r0, #5
        add     sp, sp, #0x7D, 30
        ldmia   sp!, {r4 - r11, pc}
LCFK49:
        ldr     r0, [sp, #0x28]
        cmp     r0, #0
        blt     LCFK1
        ldr     r0, [sp, #0x1EC]
        ldr     r1, [sp, #0x1F0]
        ldr     r5, [sp, #0x28]
        bl      exp
        str     r0, [r7, +r5, lsl #3]
        add     r4, r7, r5, lsl #3
        str     r1, [r4, #4]
        ldr     r0, [sp, #0x34]
        cmp     r0, #0
        blt     LCFK1
        ldr     r0, [sp, #0x1E4]
        ldr     r1, [sp, #0x1E8]
        ldr     r5, [sp, #0x34]
        bl      exp
        str     r0, [r7, +r5, lsl #3]
        add     r4, r7, r5, lsl #3
        str     r1, [r4, #4]
        ldr     r0, [sp, #0x38]
        cmp     r0, #0
        blt     LCFK1
        ldr     r0, [sp, #0x1DC]
        ldr     r1, [sp, #0x1E0]
        ldr     r5, [sp, #0x38]
        bl      exp
        str     r0, [r7, +r5, lsl #3]
        add     r4, r7, r5, lsl #3
        mov     r0, #0
        str     r1, [r4, #4]
        add     sp, sp, #0x7D, 30
        ldmia   sp!, {r4 - r11, pc}
LCFK50:
        str     r10, [sp, #0x48]
        ldr     r3, [sp, #0x48]
        ldr     r9, [sp, #0x50]
        str     r4, [sp, #0x60]
        str     r7, [sp, #0x14]
        ldr     r4, [sp, #0x4C]
        ldr     r7, [sp, #0x54]
        ldr     r8, [sp, #0x58]
        add     r3, r9, r3
        str     r2, [sp, #0x64]
        str     r5, [sp, #0xE8]
        str     r3, [sp, #0xA0]
        b       LCFK47
LCFK51:
        str     r10, [sp, #0x48]
        ldr     r3, [sp, #0x48]
        ldr     r9, [sp, #0x50]
        str     r4, [sp, #0x60]
        str     r7, [sp, #0x14]
        ldr     r4, [sp, #0x4C]
        ldr     r7, [sp, #0x54]
        ldr     r8, [sp, #0x58]
        add     r3, r9, r3
        str     r2, [sp, #0x64]
        str     r5, [sp, #0xE8]
        str     r3, [sp, #0xA0]
        b       LCFK47
LCFK52:
        str     r10, [sp, #0x44]
        ldr     r3, [sp, #0x44]
        ldr     r9, [sp, #0x50]
        str     r4, [sp, #0x60]
        str     r7, [sp, #0x38]
        ldr     r4, [sp, #0x4C]
        ldr     r7, [sp, #0x54]
        ldr     r8, [sp, #0x58]
        add     r3, r9, r3
        str     r2, [sp, #0x64]
        str     r5, [sp, #0x10]
        str     r6, [sp, #0x24]
        str     r3, [sp, #0x74]
        b       LCFK42
LCFK53:
        str     r10, [sp, #0x44]
        ldr     r3, [sp, #0x44]
        ldr     r9, [sp, #0x50]
        str     r4, [sp, #0x60]
        str     r7, [sp, #0x38]
        ldr     r4, [sp, #0x4C]
        ldr     r7, [sp, #0x54]
        ldr     r8, [sp, #0x58]
        add     r3, r9, r3
        str     r2, [sp, #0x64]
        str     r5, [sp, #0x10]
        str     r6, [sp, #0x24]
        str     r3, [sp, #0x74]
        b       LCFK42
LCFK54:
        str     r10, [sp, #0x40]
        ldr     r3, [sp, #0x40]
        ldr     r9, [sp, #0x50]
        str     r4, [sp, #0x60]
        str     r7, [sp, #0x34]
        ldr     r4, [sp, #0x4C]
        ldr     r7, [sp, #0x54]
        ldr     r8, [sp, #0x58]
        add     r3, r9, r3
        str     r2, [sp, #0x64]
        str     r5, [sp, #0x20]
        str     r6, [sp]
        str     r3, [sp, #0x70]
        b       LCFK37
LCFK55:
        str     r10, [sp, #0x40]
        ldr     r3, [sp, #0x40]
        ldr     r9, [sp, #0x50]
        str     r4, [sp, #0x60]
        str     r7, [sp, #0x34]
        ldr     r4, [sp, #0x4C]
        ldr     r7, [sp, #0x54]
        ldr     r8, [sp, #0x58]
        add     r3, r9, r3
        str     r2, [sp, #0x64]
        str     r5, [sp, #0x20]
        str     r6, [sp]
        str     r3, [sp, #0x70]
        b       LCFK37
LCFK56:
        str     r10, [sp, #0x3C]
        ldr     r3, [sp, #0x3C]
        ldr     r9, [sp, #0x50]
        str     r4, [sp, #0x60]
        str     r7, [sp, #0x28]
        ldr     r4, [sp, #0x4C]
        ldr     r7, [sp, #0x54]
        ldr     r8, [sp, #0x58]
        add     r3, r9, r3
        str     r2, [sp, #0x64]
        str     r5, [sp, #4]
        str     r6, [sp, #8]
        str     r3, [sp, #0x6C]
        b       LCFK32
LCFK57:
        str     r10, [sp, #0x3C]
        ldr     r3, [sp, #0x3C]
        ldr     r9, [sp, #0x50]
        str     r4, [sp, #0x60]
        str     r7, [sp, #0x28]
        ldr     r4, [sp, #0x4C]
        ldr     r7, [sp, #0x54]
        ldr     r8, [sp, #0x58]
        add     r3, r9, r3
        str     r2, [sp, #0x64]
        str     r5, [sp, #4]
        str     r6, [sp, #8]
        str     r3, [sp, #0x6C]
        b       LCFK32
LCFK58:
        str     r9, [sp, #0x48]
        ldr     r9, [sp, #0x50]
        ldr     r7, [sp, #0x54]
        ldr     r8, [sp, #0x58]
        b       LCFK26
LCFK59:
        str     r9, [sp, #0x48]
        ldr     r9, [sp, #0x50]
        ldr     r7, [sp, #0x54]
        ldr     r8, [sp, #0x58]
        b       LCFK26
LCFK60:
        str     r8, [sp, #0x44]
        ldr     r7, [sp, #0x54]
        ldr     r8, [sp, #0x58]
        str     r1, [sp, #0x38]
        b       LCFK20
LCFK61:
        str     r8, [sp, #0x44]
        ldr     r7, [sp, #0x54]
        ldr     r8, [sp, #0x58]
        str     r1, [sp, #0x38]
        b       LCFK20
LCFK62:
        ldr     r8, [sp, #0x58]
        str     r10, [sp, #0x40]
        str     r4, [sp, #0x34]
        b       LCFK14
LCFK63:
        ldr     r8, [sp, #0x58]
        str     r10, [sp, #0x40]
        str     r4, [sp, #0x34]
        b       LCFK14
LCFK64:
        str     r12, [sp, #0x3C]
        str     r6, [sp, #0x28]
        b       LCFK8
LCFK65:
        str     r12, [sp, #0x3C]
        str     r6, [sp, #0x28]
        b       LCFK8
LCFK66:
        mvn     r0, #7
        add     sp, sp, #0x7D, 30
        ldmia   sp!, {r4 - r11, pc}


        .data
        .align  4


LCFK_c1.3622.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LCFK_c2.3622.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LCFK_c3.3622.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LCFK_c4.3622.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LCFK_x1.3622.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LCFK_x2.3622.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LCFK_x3.3622.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LCFK_x4.3622.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LCFK_ln_maxd.3622.0.0.0:
        .byte   0xE6,0x39,0xFA,0xFE,0x42,0x2E,0x86,0x40
LCFK_ln_mind.3622.0.0.0:
        .byte   0xD2,0xBC,0x7A,0xDD,0x2B,0x23,0x86,0x40
LCFK_maxd.3622.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0xF0,0x7F
LCFK_mind.3622.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LCFK_coef.3622.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x30,0x43


