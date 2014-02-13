        .text
        .align  4
        .globl  _ippsExp_32f64f


_ippsExp_32f64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x7D, 30
        mov     r6, r0
        cmp     r6, #0
        mov     r7, r1
        mov     r5, r2
        beq     LCFM66
        cmp     r7, #0
        beq     LCFM66
        cmp     r5, #1
        blt     LCFM48
        ldr     r3, [pc, #0xFD8]
        ldr     r12, [pc, #0xFD8]
        ldr     lr, [pc, #0xFD8]
        ldr     r8, [pc, #0xFD8]
        ldr     r9, [pc, #0xFD8]
        ldr     r4, [pc, #0xFD8]
        ldr     r10, [pc, #0xFD8]
        ldr     r12, [r12]
        ldr     r3, [r3]
        ldr     lr, [lr]
        ldr     r8, [r8]
        ldr     r9, [r9]
        ldr     r4, [r4]
        ldr     r0, [pc, #0xFC0]
        cmp     r5, #4
        str     r4, [sp, #0x160]
        ldr     r11, [r10]
        ldr     r10, [pc, #0xFB4]
        ldr     r4, [pc, #0xFB4]
        ldr     r0, [r0]
        ldr     r1, [r10]
        ldr     r10, [r4]
        ldr     r4, [pc, #0xFA8]
        ldr     r4, [r4]
        str     r4, [sp, #0x10]
        ldr     r4, [pc, #0xFA0]
        ldr     r4, [r4]
        str     r4, [sp, #4]
        ldr     r4, [pc, #0xF98]
        ldr     r4, [r4]
        str     r4, [sp, #0x14]
        ldr     r4, [pc, #0xF90]
        ldr     r4, [r4]
        str     r4, [sp, #8]
        ldr     r4, [pc, #0xF88]
        ldr     r4, [r4]
        str     r4, [sp, #0x2C]
        ldr     r4, [pc, #0xF80]
        ldr     r4, [r4]
        str     r4, [sp, #0x30]
        ldr     r4, [pc, #0xF78]
        ldr     r4, [r4]
        str     r4, [sp, #0xC]
        ldr     r4, [pc, #0xF70]
        ldr     r4, [r4]
        str     r4, [sp]
        ldr     r4, [pc, #0xF68]
        str     r12, [sp, #0x174]
        str     r3, [sp, #0x17C]
        str     lr, [sp, #0x16C]
        str     r8, [sp, #0x164]
        str     r9, [sp, #0x1EC]
        ldr     r12, [sp, #0x160]
        ldr     r4, [r4]
        str     r11, [sp, #0x1DC]
        str     r12, [sp, #0x1E4]
        str     r0, [sp, #0x1D4]
        str     r1, [sp, #0x1C4]
        str     r10, [sp, #0x1CC]
        bge     LCFM2
        cmp     r5, #0
        ble     LCFM1
        sub     r7, r7, #4
LCFM0:
        ldr     r0, [r6], #4
        bl      __extendsfdf2
        bl      exp
        str     r0, [r7, #4]
        str     r1, [r7, #8]!
        subs    r5, r5, #1
        bne     LCFM0
LCFM1:
        mov     r0, #0
        add     sp, sp, #0x7D, 30
        ldmia   sp!, {r4 - r11, pc}
LCFM2:
        ldr     r2, [sp]
        subs    r5, r5, #1
        str     r5, [sp, #0x28]
        str     r2, [sp, #0x1D0]
        ldr     r12, [sp, #0xC]
        str     r12, [sp, #0x1C8]
        ldr     r12, [sp, #8]
        str     r12, [sp, #0x1D8]
        ldr     r12, [sp, #0x14]
        str     r12, [sp, #0x1E0]
        ldr     r12, [sp, #4]
        str     r12, [sp, #0x1E8]
        ldr     r2, [sp, #0x10]
        str     r2, [sp, #0x1F0]
        movmi   r2, #0
        strmi   r2, [sp, #0x3C]
        bmi     LCFM8
        ldr     r2, [sp, #0x28]
        ldr     r9, [pc, #0xEB8]
        str     r7, [sp, #0x54]
        add     r8, r6, r2, lsl #2
        add     r5, r7, r2, lsl #3
        str     r6, [sp, #0x58]
        ldr     r7, [sp, #0x28]
        ldr     r11, [sp, #0x30]
        ldr     r6, [sp, #0x2C]
        mvn     r10, #2, 2
LCFM3:
        ldr     r0, [r8], #-4
        bl      __extendsfdf2
        str     r0, [sp, #0x1EC]
        and     r0, r1, r10
        cmp     r0, r11
        str     r1, [sp, #0x1F0]
        bic     r0, r1, r10
        bcc     LCFM65
        cmp     r0, #0
        beq     LCFM5
        tst     r1, #2, 14
        beq     LCFM4
        ldr     r1, [r9]
        ldr     r2, [r9, #4]
        str     r1, [r5]
        str     r2, [r5, #4]
        b       LCFM7
LCFM4:
        ldr     r1, [sp, #0x1CC]
        ldr     r2, [sp, #0x1D0]
        str     r1, [r5]
        str     r2, [r5, #4]
        b       LCFM7
LCFM5:
        cmp     r1, r6
        bcc     LCFM64
        tst     r1, #2, 14
        beq     LCFM6
        ldr     r2, [r9, #4]
        ldr     r1, [r9]
        eor     r2, r2, #2, 2
        str     r2, [r5, #4]
        str     r1, [r5]
        b       LCFM7
LCFM6:
        ldr     r1, [sp, #0x1C4]
        ldr     r2, [sp, #0x1C8]
        str     r1, [r5]
        str     r2, [r5, #4]
LCFM7:
        subs    r7, r7, #1
        sub     r5, r5, #8
        bpl     LCFM3
        str     r7, [sp, #0x28]
        ldr     r7, [sp, #0x54]
        ldr     r6, [sp, #0x58]
        str     r0, [sp, #0x3C]
LCFM8:
        ldr     r2, [sp, #0x28]
        ldr     r3, [sp, #0x3C]
        subs    r2, r2, #1
        str     r2, [sp, #0x34]
        add     r0, r4, r3
        movmi   r2, #0
        strmi   r2, [sp, #0x40]
        bmi     LCFM14
        ldr     r2, [sp, #0x34]
        ldr     r9, [pc, #0xDC4]
        str     r7, [sp, #0x54]
        add     r5, r7, r2, lsl #3
        ldr     r7, [sp, #0x34]
        ldr     r10, [sp, #0x30]
        ldr     r11, [sp, #0x2C]
        add     r8, r6, r2, lsl #2
        str     r6, [sp, #0x58]
        mov     r6, r4
        mov     r4, r0
LCFM9:
        ldr     r0, [r8], #-4
        bl      __extendsfdf2
        mvn     lr, #2, 2
        and     r3, r1, lr
        str     r0, [sp, #0x1E4]
        cmp     r3, r10
        str     r1, [sp, #0x1E8]
        bic     r2, r1, lr
        bcc     LCFM63
        cmp     r2, #0
        beq     LCFM11
        tst     r1, #2, 14
        beq     LCFM10
        ldr     r1, [r9]
        ldr     r3, [r9, #4]
        str     r1, [r5]
        str     r3, [r5, #4]
        b       LCFM13
LCFM10:
        ldr     r1, [sp, #0x1CC]
        ldr     r3, [sp, #0x1D0]
        str     r1, [r5]
        str     r3, [r5, #4]
        b       LCFM13
LCFM11:
        cmp     r1, r11
        bcc     LCFM62
        tst     r1, #2, 14
        beq     LCFM12
        ldr     r3, [r9, #4]
        ldr     r1, [r9]
        eor     r3, r3, #2, 2
        str     r3, [r5, #4]
        str     r1, [r5]
        b       LCFM13
LCFM12:
        ldr     r1, [sp, #0x1C4]
        ldr     r3, [sp, #0x1C8]
        str     r1, [r5]
        str     r3, [r5, #4]
LCFM13:
        subs    r7, r7, #1
        sub     r5, r5, #8
        bpl     LCFM9
        mov     r0, r4
        str     r7, [sp, #0x34]
        mov     r4, r6
        ldr     r7, [sp, #0x54]
        ldr     r6, [sp, #0x58]
        str     r2, [sp, #0x40]
LCFM14:
        ldr     r2, [sp, #0x34]
        ldr     r3, [sp, #0x40]
        subs    r2, r2, #1
        str     r2, [sp, #0x38]
        add     r1, r4, r3
        movmi   r2, #0
        strmi   r2, [sp, #0x44]
        bmi     LCFM20
        ldr     r2, [sp, #0x38]
        ldr     r9, [pc, #0xCC0]
        str     r7, [sp, #0x54]
        add     r5, r7, r2, lsl #3
        ldr     r7, [sp, #0x38]
        ldr     r10, [sp, #0x30]
        ldr     r11, [sp, #0x2C]
        str     r4, [sp, #0x50]
        add     r8, r6, r2, lsl #2
        str     r0, [sp, #0x6C]
        str     r6, [sp, #0x58]
        mov     r4, r1
LCFM15:
        ldr     r0, [r8], #-4
        mvn     r6, #2, 2
        bl      __extendsfdf2
        str     r0, [sp, #0x1DC]
        and     r0, r1, r6
        cmp     r0, r10
        str     r1, [sp, #0x1E0]
        bic     r6, r1, r6
        bcc     LCFM61
        cmp     r6, #0
        beq     LCFM17
        tst     r1, #2, 14
        beq     LCFM16
        ldr     r0, [r9]
        ldr     r2, [r9, #4]
        str     r0, [r5]
        str     r2, [r5, #4]
        b       LCFM19
LCFM16:
        ldr     r0, [sp, #0x1CC]
        ldr     r2, [sp, #0x1D0]
        str     r0, [r5]
        str     r2, [r5, #4]
        b       LCFM19
LCFM17:
        cmp     r1, r11
        bcc     LCFM60
        tst     r1, #2, 14
        beq     LCFM18
        ldr     r2, [r9, #4]
        ldr     r0, [r9]
        eor     r2, r2, #2, 2
        str     r2, [r5, #4]
        str     r0, [r5]
        b       LCFM19
LCFM18:
        ldr     r0, [sp, #0x1C4]
        ldr     r2, [sp, #0x1C8]
        str     r0, [r5]
        str     r2, [r5, #4]
LCFM19:
        subs    r7, r7, #1
        sub     r5, r5, #8
        bpl     LCFM15
        str     r6, [sp, #0x44]
        str     r7, [sp, #0x38]
        mov     r1, r4
        ldr     r0, [sp, #0x6C]
        ldr     r4, [sp, #0x50]
        ldr     r7, [sp, #0x54]
        ldr     r6, [sp, #0x58]
LCFM20:
        ldr     r2, [sp, #0x38]
        subs    r5, r2, #1
        ldr     r2, [sp, #0x44]
        add     r8, r4, r2
        movmi   r2, #0
        strmi   r2, [sp, #0x48]
        bmi     LCFM26
        ldr     r11, [pc, #0xBBC]
        add     r9, r6, r5, lsl #2
        add     r10, r7, r5, lsl #3
        str     r7, [sp, #0x54]
        str     r6, [sp, #0x58]
        ldr     r6, [sp, #0x30]
        ldr     r7, [sp, #0x2C]
        str     r1, [sp, #0x70]
        str     r0, [sp, #0x6C]
        str     r4, [sp, #0x50]
LCFM21:
        ldr     r0, [r9], #-4
        mvn     r4, #2, 2
        bl      __extendsfdf2
        str     r0, [sp, #0x1D4]
        and     r0, r1, r4
        cmp     r0, r6
        str     r1, [sp, #0x1D8]
        bic     r4, r1, r4
        bcc     LCFM59
        cmp     r4, #0
        beq     LCFM23
        tst     r1, #2, 14
        beq     LCFM22
        ldr     r0, [r11]
        ldr     r1, [r11, #4]
        str     r0, [r10]
        str     r1, [r10, #4]
        b       LCFM25
LCFM22:
        ldr     r0, [sp, #0x1CC]
        ldr     r1, [sp, #0x1D0]
        str     r0, [r10]
        str     r1, [r10, #4]
        b       LCFM25
LCFM23:
        cmp     r1, r7
        bcc     LCFM58
        tst     r1, #2, 14
        beq     LCFM24
        ldr     r1, [r11, #4]
        ldr     r0, [r11]
        eor     r1, r1, #2, 2
        str     r1, [r10, #4]
        str     r0, [r10]
        b       LCFM25
LCFM24:
        ldr     r0, [sp, #0x1C4]
        ldr     r1, [sp, #0x1C8]
        str     r0, [r10]
        str     r1, [r10, #4]
LCFM25:
        subs    r5, r5, #1
        sub     r10, r10, #8
        bpl     LCFM21
        str     r4, [sp, #0x48]
        ldr     r1, [sp, #0x70]
        ldr     r0, [sp, #0x6C]
        ldr     r4, [sp, #0x50]
        ldr     r7, [sp, #0x54]
        ldr     r6, [sp, #0x58]
LCFM26:
        ldr     r2, [sp, #0x48]
        cmp     r5, #0
        add     r2, r4, r2
        blt     LCFM49
        ldr     r10, [pc, #0xACC]
        ldr     lr, [sp, #0x1EC]
        ldr     r9, [sp, #0x1D4]
        ldr     r12, [r10, #4]
        ldr     r11, [sp, #0x1C8]
        str     lr, [sp, #8]
        ldr     lr, [sp, #0x1F0]
        eor     r3, r12, #2, 2
        str     r11, [sp, #0xC]
        str     lr, [sp, #4]
        ldr     lr, [sp, #0x1E4]
        str     lr, [sp, #0x18]
        ldr     lr, [sp, #0x1E8]
        str     lr, [sp, #0x24]
        ldr     lr, [sp, #0x1DC]
        str     lr, [sp, #0x10]
        ldr     lr, [sp, #0x1E0]
        str     lr, [sp]
        ldr     lr, [sp, #0x1D8]
        str     lr, [sp, #0x14]
        ldr     r10, [r10]
        ldr     lr, [sp, #0x1C4]
        str     r10, [sp, #0x20]
        ldr     r10, [sp, #0x1CC]
        str     r10, [sp, #0x1C]
        ldr     r10, [sp, #0x1D0]
        str     r2, [sp, #0x168]
        str     r8, [sp, #0x170]
        str     r1, [sp, #0x178]
        str     r0, [sp, #0x180]
        str     r10, [sp, #0x68]
        str     r3, [sp, #0x64]
        str     r12, [sp, #0x60]
        str     lr, [sp, #0x5C]
        str     r9, [sp, #0xE8]
        str     r2, [sp, #0xA0]
        str     r8, [sp, #0x74]
        str     r1, [sp, #0x70]
        str     r0, [sp, #0x6C]
LCFM27:
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #4]
        ldr     r2, [pc, #0xA2C]
        ldr     r3, [pc, #0xA2C]
        bl      __muldf3
        ldr     r2, [pc, #0xA20]
        ldr     r3, [pc, #0xA20]
        mov     r9, r1
        mov     r8, r0
        ldr     r0, [sp, #0x18]
        ldr     r1, [sp, #0x24]
        bl      __muldf3
        ldr     r10, [sp, #0x17C]
        ldr     r11, [sp, #0x180]
        str     r1, [sp, #0x15C]
        str     r0, [sp, #0x160]
        mov     r0, r8
        mov     r1, r9
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        ldr     r8, [sp, #0x174]
        ldr     r9, [sp, #0x178]
        str     r0, [sp, #0x158]
        str     r0, [sp, #0x19C]
        str     r1, [sp, #0x154]
        str     r1, [sp, #0x1A0]
        ldr     r1, [sp, #0x15C]
        ldr     r0, [sp, #0x160]
        mov     r3, r9
        mov     r2, r8
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
        mov     r2, r8
        mov     r3, r9
        bl      __subdf3
        str     r0, [sp, #0x160]
        ldr     r0, [sp, #0x10]
        ldr     r2, [pc, #0x964]
        ldr     r3, [pc, #0x964]
        str     r1, [sp, #0x154]
        ldr     r1, [sp]
        bl      __muldf3
        ldr     r2, [pc, #0x950]
        ldr     r3, [pc, #0x950]
        mov     r8, r0
        ldr     r0, [sp, #0xE8]
        mov     r9, r1
        ldr     r1, [sp, #0x14]
        bl      __muldf3
        ldr     r2, [sp, #0x16C]
        str     r1, [sp, #0x144]
        str     r2, [sp, #0x150]
        ldr     r2, [sp, #0x170]
        str     r0, [sp, #0x148]
        mov     r0, r8
        str     r2, [sp, #0x14C]
        ldr     r3, [sp, #0x14C]
        ldr     r2, [sp, #0x150]
        mov     r1, r9
        bl      __adddf3
        ldr     r9, [sp, #0x164]
        ldr     r8, [sp, #0x168]
        str     r0, [sp, #0x140]
        str     r0, [sp, #0x18C]
        str     r1, [sp, #0x13C]
        str     r1, [sp, #0x190]
        ldr     r0, [sp, #0x148]
        ldr     r1, [sp, #0x144]
        mov     r2, r9
        mov     r3, r8
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
        mov     r2, r9
        mov     r1, r11
        mov     r0, r10
        mov     r3, r8
        bl      __subdf3
        ldr     r9, [pc, #0x898]
        mov     r10, r0
        ldr     r0, [sp, #0x15C]
        mov     r11, r1
        ldr     r1, [sp, #0x158]
        mov     r2, #0
        sub     r8, r2, #0x12, 12
        mov     r3, r9
        mov     r2, r8
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
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x18]
        mov     r3, r1
        ldr     r1, [sp, #0x24]
        bl      __subdf3
        str     r0, [sp, #0xB8]
        ldr     r0, [sp, #0x150]
        str     r1, [sp, #0xBC]
        ldr     r1, [sp, #0x14C]
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x10]
        mov     r3, r1
        ldr     r1, [sp]
        bl      __subdf3
        str     r0, [sp, #0xB0]
        str     r1, [sp, #0xB4]
        mov     r2, r8
        mov     r0, r10
        mov     r3, r9
        mov     r1, r11
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0xE8]
        mov     r3, r1
        ldr     r1, [sp, #0x14]
        bl      __subdf3
        ldr     r8, [pc, #0x7D0]
        ldr     r9, [pc, #0x7D0]
        str     r0, [sp, #0xA8]
        ldr     r0, [sp, #0x15C]
        str     r1, [sp, #0xAC]
        ldr     r1, [sp, #0x158]
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        str     r0, [sp, #0xE0]
        ldr     r0, [sp, #0x160]
        str     r1, [sp, #0xE4]
        ldr     r1, [sp, #0x154]
        mov     r3, r9
        mov     r2, r8
        bl      __muldf3
        str     r0, [sp, #0xD8]
        ldr     r0, [sp, #0x150]
        str     r1, [sp, #0xDC]
        ldr     r1, [sp, #0x14C]
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        str     r1, [sp, #0xD4]
        str     r0, [sp, #0xD0]
        mov     r1, r11
        mov     r3, r9
        mov     r0, r10
        mov     r2, r8
        bl      __muldf3
        mov     r9, r1
        str     r9, [sp, #0xC4]
        mov     r8, r0
        ldr     r2, [sp, #0xE0]
        ldr     r3, [sp, #0xE4]
        ldr     r0, [sp, #0xC8]
        ldr     r1, [sp, #0xCC]
        str     r8, [sp, #0xC0]
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
        mov     r2, r8
        mov     r3, r9
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
        mov     r8, r0
        ldr     r0, [sp, #0x160]
        ldr     r2, [pc, #0x670]
        ldr     r3, [pc, #0x670]
        mov     r9, r1
        ldr     r1, [sp, #0x15C]
        bl      __muldf3
        ldr     r2, [pc, #0x664]
        ldr     r3, [pc, #0x664]
        bl      __adddf3
        ldr     r2, [sp, #0x160]
        ldr     r3, [sp, #0x15C]
        bl      __muldf3
        ldr     r2, [pc, #0x654]
        ldr     r3, [pc, #0x654]
        bl      __adddf3
        ldr     r3, [sp, #0x15C]
        ldr     r2, [sp, #0x160]
        bl      __muldf3
        ldr     r2, [pc, #0x644]
        ldr     r3, [pc, #0x644]
        bl      __adddf3
        ldr     r2, [sp, #0x160]
        ldr     r3, [sp, #0x15C]
        bl      __muldf3
        ldr     r2, [pc, #0x634]
        ldr     r3, [pc, #0x634]
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
        ldr     r2, [pc, #0x5E0]
        ldr     r3, [pc, #0x5E0]
        ldr     r0, [sp, #0x158]
        ldr     r1, [sp, #0x154]
        bl      __muldf3
        ldr     r2, [pc, #0x5D4]
        ldr     r3, [pc, #0x5D4]
        bl      __adddf3
        ldr     r2, [sp, #0x158]
        ldr     r3, [sp, #0x154]
        bl      __muldf3
        ldr     r2, [pc, #0x5C4]
        ldr     r3, [pc, #0x5C4]
        bl      __adddf3
        ldr     r2, [sp, #0x158]
        ldr     r3, [sp, #0x154]
        bl      __muldf3
        ldr     r2, [pc, #0x5B4]
        ldr     r3, [pc, #0x5B4]
        bl      __adddf3
        ldr     r2, [sp, #0x158]
        ldr     r3, [sp, #0x154]
        bl      __muldf3
        ldr     r2, [pc, #0x5A4]
        ldr     r3, [pc, #0x5A4]
        bl      __adddf3
        ldr     r2, [sp, #0x158]
        ldr     r3, [sp, #0x154]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [sp, #0x11C]
        ldr     r1, [sp, #0x120]
        bl      __subdf3
        ldr     r2, [pc, #0x558]
        ldr     r3, [pc, #0x558]
        str     r0, [sp, #0xF8]
        str     r1, [sp, #0xFC]
        mov     r0, r11
        mov     r1, r10
        bl      __muldf3
        ldr     r2, [pc, #0x544]
        ldr     r3, [pc, #0x544]
        bl      __adddf3
        mov     r3, r10
        mov     r2, r11
        bl      __muldf3
        ldr     r2, [pc, #0x534]
        ldr     r3, [pc, #0x534]
        bl      __adddf3
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [pc, #0x524]
        ldr     r3, [pc, #0x524]
        bl      __adddf3
        mov     r3, r10
        mov     r2, r11
        bl      __muldf3
        ldr     r2, [pc, #0x514]
        ldr     r3, [pc, #0x514]
        bl      __adddf3
        mov     r3, r10
        mov     r2, r11
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x114]
        mov     r3, r1
        ldr     r1, [sp, #0x118]
        bl      __subdf3
        ldr     r2, [pc, #0x4C8]
        ldr     r3, [pc, #0x4C8]
        mov     r10, r1
        mov     r11, r0
        str     r11, [sp, #0x104]
        str     r10, [sp, #0x108]
        mov     r0, r8
        mov     r1, r9
        bl      __muldf3
        ldr     r2, [pc, #0x4AC]
        ldr     r3, [pc, #0x4AC]
        bl      __adddf3
        mov     r3, r9
        mov     r2, r8
        bl      __muldf3
        ldr     r2, [pc, #0x49C]
        ldr     r3, [pc, #0x49C]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [pc, #0x48C]
        ldr     r3, [pc, #0x48C]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [pc, #0x47C]
        ldr     r3, [pc, #0x47C]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [sp, #0x10C]
        ldr     r1, [sp, #0x110]
        bl      __subdf3
        ldr     r2, [sp, #0xEC]
        ldr     r3, [sp, #0xF0]
        mov     r8, r0
        str     r8, [sp, #0x160]
        mov     r9, r1
        str     r9, [sp, #0x15C]
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
        mov     r3, r9
        mov     r2, r8
        mov     r0, #0
        mov     r1, #1, 2
        bl      __subdf3
        ldr     r2, [sp, #0x144]
        ldr     r3, [sp, #0x148]
        mov     r8, r0
        ldr     r0, [sp, #0x140]
        str     r8, [sp, #0x134]
        mov     r11, r1
        ldr     r1, [sp, #0x13C]
        str     r11, [sp, #0x138]
        bl      __muldf3
        mov     r9, r0
        mov     r10, r1
        ldr     r0, [sp, #0x130]
        ldr     r1, [sp, #0x12C]
        str     r9, [sp, #0x158]
        str     r10, [sp, #0x154]
        mov     r2, r8
        mov     r3, r11
        bl      __muldf3
        str     r1, [sp, #0x9C]
        mov     r8, r0
        mov     r2, r9
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
        subs    r3, r5, #1
        str     r3, [sp, #0x28]
        str     r12, [sp, #0x90]
        ldr     r12, [sp, #0x48]
        str     r0, [sp, #0x14C]
        str     r12, [sp, #0x8C]
        ldr     r12, [sp, #0x34]
        str     r1, [sp, #0x150]
        str     r12, [sp, #0x100]
        ldr     r12, [sp, #0x38]
        str     r5, [sp, #0x80]
        str     r12, [sp, #0x84]
        bmi     LCFM32
        ldr     r3, [sp, #0x28]
        str     r8, [sp, #0x4C]
        str     r7, [sp, #0x54]
        add     r9, r6, r3, lsl #2
        add     r5, r7, r3, lsl #3
        str     r6, [sp, #0x58]
        ldr     r6, [sp, #0x60]
        ldr     r7, [sp, #0x20]
        ldr     r11, [sp, #0x28]
        ldr     r8, [sp, #0x30]
        ldr     r10, [sp, #0x2C]
        str     r4, [sp, #0x50]
LCFM28:
        ldr     r0, [r9], #-4
        mvn     r4, #2, 2
        bl      __extendsfdf2
        str     r0, [sp, #0x1EC]
        and     r3, r1, r4
        cmp     r3, r8
        str     r1, [sp, #0x1F0]
        bic     r4, r1, r4
        bcc     LCFM57
        cmp     r4, #0
        beq     LCFM29
        tst     r1, #2, 14
        strne   r7, [r5]
        strne   r6, [r5, #4]
        bne     LCFM31
        ldr     r2, [sp, #0x1C]
        str     r2, [r5]
        ldr     r2, [sp, #0x68]
        str     r2, [r5, #4]
        b       LCFM31
LCFM29:
        cmp     r1, r10
        bcc     LCFM56
        tst     r1, #2, 14
        beq     LCFM30
        str     r7, [r5]
        ldr     r2, [sp, #0x64]
        str     r2, [r5, #4]
        b       LCFM31
LCFM30:
        ldr     r2, [sp, #0x5C]
        str     r2, [r5]
        ldr     r2, [sp, #0xC]
        str     r2, [r5, #4]
LCFM31:
        subs    r11, r11, #1
        sub     r5, r5, #8
        bpl     LCFM28
        str     r4, [sp, #0x3C]
        ldr     r3, [sp, #0x3C]
        ldr     r4, [sp, #0x50]
        str     r6, [sp, #0x60]
        ldr     r8, [sp, #0x4C]
        ldr     r7, [sp, #0x54]
        ldr     r6, [sp, #0x58]
        add     r3, r4, r3
        str     r1, [sp, #4]
        str     r0, [sp, #8]
        str     r11, [sp, #0x28]
        str     r3, [sp, #0x6C]
LCFM32:
        ldr     r3, [sp, #0x28]
        subs    r3, r3, #1
        str     r3, [sp, #0x34]
        bmi     LCFM37
        ldr     r3, [sp, #0x34]
        str     r8, [sp, #0x4C]
        str     r7, [sp, #0x54]
        add     r9, r6, r3, lsl #2
        add     r5, r7, r3, lsl #3
        str     r6, [sp, #0x58]
        ldr     r6, [sp, #0x60]
        ldr     r7, [sp, #0x20]
        ldr     r11, [sp, #0x34]
        ldr     r8, [sp, #0x30]
        ldr     r10, [sp, #0x2C]
        str     r4, [sp, #0x50]
LCFM33:
        ldr     r0, [r9], #-4
        mvn     r4, #2, 2
        bl      __extendsfdf2
        str     r0, [sp, #0x1E4]
        and     r3, r1, r4
        cmp     r3, r8
        str     r1, [sp, #0x1E8]
        bic     r4, r1, r4
        bcc     LCFM55
        cmp     r4, #0
        beq     LCFM34
        tst     r1, #2, 14
        strne   r7, [r5]
        strne   r6, [r5, #4]
        bne     LCFM36
        ldr     r2, [sp, #0x1C]
        str     r2, [r5]
        ldr     r2, [sp, #0x68]
        str     r2, [r5, #4]
        b       LCFM36
LCFM34:
        cmp     r1, r10
        bcc     LCFM54
        tst     r1, #2, 14
        beq     LCFM35
        str     r7, [r5]
        ldr     r2, [sp, #0x64]
        str     r2, [r5, #4]
        b       LCFM36
LCFM35:
        ldr     r2, [sp, #0x5C]
        str     r2, [r5]
        ldr     r2, [sp, #0xC]
        str     r2, [r5, #4]
LCFM36:
        subs    r11, r11, #1
        sub     r5, r5, #8
        bpl     LCFM33
        str     r4, [sp, #0x40]
        ldr     r3, [sp, #0x40]
        ldr     r4, [sp, #0x50]
        str     r6, [sp, #0x60]
        ldr     r8, [sp, #0x4C]
        ldr     r7, [sp, #0x54]
        ldr     r6, [sp, #0x58]
        add     r3, r4, r3
        str     r1, [sp, #0x24]
        str     r0, [sp, #0x18]
        str     r11, [sp, #0x34]
        str     r3, [sp, #0x70]
LCFM37:
        ldr     r3, [sp, #0x34]
        subs    r3, r3, #1
        str     r3, [sp, #0x38]
        bmi     LCFM42
        ldr     r3, [sp, #0x38]
        str     r8, [sp, #0x4C]
        str     r7, [sp, #0x54]
        add     r9, r6, r3, lsl #2
        add     r5, r7, r3, lsl #3
        str     r6, [sp, #0x58]
        ldr     r6, [sp, #0x60]
        ldr     r7, [sp, #0x20]
        ldr     r11, [sp, #0x38]
        ldr     r8, [sp, #0x30]
        ldr     r10, [sp, #0x2C]
        str     r4, [sp, #0x50]
LCFM38:
        ldr     r0, [r9], #-4
        mvn     r4, #2, 2
        bl      __extendsfdf2
        str     r0, [sp, #0x1DC]
        and     r3, r1, r4
        cmp     r3, r8
        str     r1, [sp, #0x1E0]
        bic     r4, r1, r4
        bcc     LCFM53
        cmp     r4, #0
        beq     LCFM39
        tst     r1, #2, 14
        strne   r7, [r5]
        strne   r6, [r5, #4]
        bne     LCFM41
        ldr     r2, [sp, #0x1C]
        str     r2, [r5]
        ldr     r2, [sp, #0x68]
        str     r2, [r5, #4]
        b       LCFM41
LCFM39:
        cmp     r1, r10
        bcc     LCFM52
        tst     r1, #2, 14
        beq     LCFM40
        str     r7, [r5]
        ldr     r2, [sp, #0x64]
        str     r2, [r5, #4]
        b       LCFM41
        .long   LCFM_c1.3623.0.0.0
        .long   LCFM_c2.3623.0.0.0
        .long   LCFM_c3.3623.0.0.0
        .long   LCFM_c4.3623.0.0.0
        .long   LCFM_x1.3623.0.0.0
        .long   LCFM_x2.3623.0.0.0
        .long   LCFM_x3.3623.0.0.0
        .long   LCFM_x4.3623.0.0.0
        .long   LCFM_maxd.3623.0.0.0
        .long   LCFM_mind.3623.0.0.0
        .long   LCFM_x1.3623.0.0.0
        .long   LCFM_x2.3623.0.0.0
        .long   LCFM_x3.3623.0.0.0
        .long   LCFM_x4.3623.0.0.0
        .long   LCFM_ln_maxd.3623.0.0.0
        .long   LCFM_ln_mind.3623.0.0.0
        .long   LCFM_maxd.3623.0.0.0
        .long   LCFM_mind.3623.0.0.0
        .long   LCFM_coef.3623.0.0.0
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
LCFM40:
        ldr     r2, [sp, #0x5C]
        str     r2, [r5]
        ldr     r2, [sp, #0xC]
        str     r2, [r5, #4]
LCFM41:
        subs    r11, r11, #1
        sub     r5, r5, #8
        bpl     LCFM38
        str     r4, [sp, #0x44]
        ldr     r3, [sp, #0x44]
        ldr     r4, [sp, #0x50]
        str     r6, [sp, #0x60]
        ldr     r8, [sp, #0x4C]
        ldr     r7, [sp, #0x54]
        ldr     r6, [sp, #0x58]
        add     r3, r4, r3
        str     r1, [sp]
        str     r0, [sp, #0x10]
        str     r11, [sp, #0x38]
        str     r3, [sp, #0x74]
LCFM42:
        ldr     r3, [sp, #0x38]
        subs    r5, r3, #1
        bmi     LCFM47
        add     r9, r6, r5, lsl #2
        add     r10, r7, r5, lsl #3
        str     r8, [sp, #0x4C]
        str     r7, [sp, #0x54]
        str     r6, [sp, #0x58]
        ldr     r6, [sp, #0x60]
        ldr     r7, [sp, #0x20]
        ldr     r8, [sp, #0x30]
        ldr     r11, [sp, #0x2C]
        str     r4, [sp, #0x50]
LCFM43:
        ldr     r0, [r9], #-4
        mvn     r4, #2, 2
        bl      __extendsfdf2
        str     r0, [sp, #0x1D4]
        and     r3, r1, r4
        cmp     r3, r8
        str     r1, [sp, #0x1D8]
        bic     r4, r1, r4
        bcc     LCFM51
        cmp     r4, #0
        beq     LCFM44
        tst     r1, #2, 14
        strne   r7, [r10]
        strne   r6, [r10, #4]
        bne     LCFM46
        ldr     r2, [sp, #0x1C]
        str     r2, [r10]
        ldr     r2, [sp, #0x68]
        str     r2, [r10, #4]
        b       LCFM46
LCFM44:
        cmp     r1, r11
        bcc     LCFM50
        tst     r1, #2, 14
        beq     LCFM45
        str     r7, [r10]
        ldr     r2, [sp, #0x64]
        str     r2, [r10, #4]
        b       LCFM46
LCFM45:
        ldr     r2, [sp, #0x5C]
        str     r2, [r10]
        ldr     r2, [sp, #0xC]
        str     r2, [r10, #4]
LCFM46:
        subs    r5, r5, #1
        sub     r10, r10, #8
        bpl     LCFM43
        str     r4, [sp, #0x48]
        ldr     r3, [sp, #0x48]
        ldr     r4, [sp, #0x50]
        str     r6, [sp, #0x60]
        ldr     r8, [sp, #0x4C]
        ldr     r7, [sp, #0x54]
        ldr     r6, [sp, #0x58]
        add     r3, r4, r3
        str     r1, [sp, #0x14]
        str     r0, [sp, #0xE8]
        str     r3, [sp, #0xA0]
LCFM47:
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
        ldr     r3, [sp, #0x118]
        ldr     r2, [sp, #0x114]
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
        mov     r2, r8
        mov     r0, r10
        mov     r1, r11
        bl      __muldf3
        ldr     r2, [sp, #0x158]
        ldr     r3, [sp, #0x154]
        mov     r9, r0
        mov     r8, r1
        mov     r0, r10
        mov     r1, r11
        bl      __muldf3
        ldr     r2, [sp, #0x144]
        ldr     r3, [sp, #0x148]
        mov     r10, r0
        mov     r11, r1
        mov     r1, r8
        mov     r0, r9
        bl      __muldf3
        ldr     r2, [sp, #0x128]
        ldr     r3, [sp, #0x124]
        bl      __muldf3
        ldr     r2, [sp, #0x140]
        ldr     r3, [sp, #0x13C]
        str     r0, [sp, #0x158]
        str     r1, [sp, #0x154]
        mov     r0, r9
        mov     r1, r8
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
        mov     r8, r1
        mov     r0, r10
        mov     r1, r11
        bl      __muldf3
        ldr     r2, [sp, #0x160]
        ldr     r3, [sp, #0x15C]
        bl      __muldf3
        ldr     r2, [sp, #0x158]
        ldr     r3, [sp, #0x154]
        mov     r9, #0xFF, 12
        mov     r11, r0
        mov     r10, r1
        mov     r0, #0
        orr     r9, r9, #3, 4
        mov     r1, r9
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
        mov     r1, r9
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
        mov     r1, r9
        mov     r3, r8
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
        mov     r1, r9
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
        ldr     r9, [sp, #0x88]
        ldr     r3, [sp, #0x1BC]
        ldr     r8, [sp, #0x1C0]
        ldr     lr, [sp, #0x1B4]
        cmp     r5, #0
        str     r3, [r7, +r9, lsl #3]
        ldr     r3, [sp, #0x1B8]
        add     r9, r7, r9, lsl #3
        str     r8, [r9, #4]
        ldr     r9, [sp, #0x100]
        ldr     r8, [sp, #0x1AC]
        str     r2, [sp, #0x1A8]
        str     lr, [r7, +r9, lsl #3]
        ldr     lr, [sp, #0x1B0]
        add     r9, r7, r9, lsl #3
        str     r3, [r9, #4]
        ldr     r12, [sp, #0x84]
        ldr     r3, [sp, #0x1A4]
        str     r8, [r7, +r12, lsl #3]
        add     r12, r7, r12, lsl #3
        str     lr, [r12, #4]
        ldr     r12, [sp, #0x80]
        str     r3, [r7, +r12, lsl #3]
        add     r12, r7, r12, lsl #3
        str     r2, [r12, #4]
        blt     LCFM49
        ldr     lr, [sp, #0xA0]
        str     lr, [sp, #0x168]
        ldr     lr, [sp, #0x74]
        str     lr, [sp, #0x170]
        ldr     r12, [sp, #0x70]
        str     r12, [sp, #0x178]
        ldr     r3, [sp, #0x6C]
        str     r3, [sp, #0x180]
        b       LCFM27
LCFM48:
        mvn     r0, #5
        add     sp, sp, #0x7D, 30
        ldmia   sp!, {r4 - r11, pc}
LCFM49:
        ldr     r0, [sp, #0x28]
        cmp     r0, #0
        blt     LCFM1
        ldr     r0, [sp, #0x1EC]
        ldr     r1, [sp, #0x1F0]
        ldr     r5, [sp, #0x28]
        bl      exp
        str     r0, [r7, +r5, lsl #3]
        add     r4, r7, r5, lsl #3
        str     r1, [r4, #4]
        ldr     r0, [sp, #0x34]
        cmp     r0, #0
        blt     LCFM1
        ldr     r0, [sp, #0x1E4]
        ldr     r1, [sp, #0x1E8]
        ldr     r5, [sp, #0x34]
        bl      exp
        str     r0, [r7, +r5, lsl #3]
        add     r4, r7, r5, lsl #3
        str     r1, [r4, #4]
        ldr     r0, [sp, #0x38]
        cmp     r0, #0
        blt     LCFM1
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
LCFM50:
        str     r4, [sp, #0x48]
        ldr     r3, [sp, #0x48]
        ldr     r4, [sp, #0x50]
        str     r6, [sp, #0x60]
        ldr     r8, [sp, #0x4C]
        ldr     r7, [sp, #0x54]
        ldr     r6, [sp, #0x58]
        add     r3, r4, r3
        str     r1, [sp, #0x14]
        str     r0, [sp, #0xE8]
        str     r3, [sp, #0xA0]
        b       LCFM47
LCFM51:
        str     r4, [sp, #0x48]
        ldr     r3, [sp, #0x48]
        ldr     r4, [sp, #0x50]
        str     r6, [sp, #0x60]
        ldr     r8, [sp, #0x4C]
        ldr     r7, [sp, #0x54]
        ldr     r6, [sp, #0x58]
        add     r3, r4, r3
        str     r1, [sp, #0x14]
        str     r0, [sp, #0xE8]
        str     r3, [sp, #0xA0]
        b       LCFM47
LCFM52:
        str     r4, [sp, #0x44]
        ldr     r3, [sp, #0x44]
        ldr     r4, [sp, #0x50]
        str     r6, [sp, #0x60]
        ldr     r8, [sp, #0x4C]
        ldr     r7, [sp, #0x54]
        ldr     r6, [sp, #0x58]
        add     r3, r4, r3
        str     r1, [sp]
        str     r0, [sp, #0x10]
        str     r11, [sp, #0x38]
        str     r3, [sp, #0x74]
        b       LCFM42
LCFM53:
        str     r4, [sp, #0x44]
        ldr     r3, [sp, #0x44]
        ldr     r4, [sp, #0x50]
        str     r6, [sp, #0x60]
        ldr     r8, [sp, #0x4C]
        ldr     r7, [sp, #0x54]
        ldr     r6, [sp, #0x58]
        add     r3, r4, r3
        str     r1, [sp]
        str     r0, [sp, #0x10]
        str     r11, [sp, #0x38]
        str     r3, [sp, #0x74]
        b       LCFM42
LCFM54:
        str     r4, [sp, #0x40]
        ldr     r3, [sp, #0x40]
        ldr     r4, [sp, #0x50]
        str     r6, [sp, #0x60]
        ldr     r8, [sp, #0x4C]
        ldr     r7, [sp, #0x54]
        ldr     r6, [sp, #0x58]
        add     r3, r4, r3
        str     r1, [sp, #0x24]
        str     r0, [sp, #0x18]
        str     r11, [sp, #0x34]
        str     r3, [sp, #0x70]
        b       LCFM37
LCFM55:
        str     r4, [sp, #0x40]
        ldr     r3, [sp, #0x40]
        ldr     r4, [sp, #0x50]
        str     r6, [sp, #0x60]
        ldr     r8, [sp, #0x4C]
        ldr     r7, [sp, #0x54]
        ldr     r6, [sp, #0x58]
        add     r3, r4, r3
        str     r1, [sp, #0x24]
        str     r0, [sp, #0x18]
        str     r11, [sp, #0x34]
        str     r3, [sp, #0x70]
        b       LCFM37
LCFM56:
        str     r4, [sp, #0x3C]
        ldr     r3, [sp, #0x3C]
        ldr     r4, [sp, #0x50]
        str     r6, [sp, #0x60]
        ldr     r8, [sp, #0x4C]
        ldr     r7, [sp, #0x54]
        ldr     r6, [sp, #0x58]
        add     r3, r4, r3
        str     r1, [sp, #4]
        str     r0, [sp, #8]
        str     r11, [sp, #0x28]
        str     r3, [sp, #0x6C]
        b       LCFM32
LCFM57:
        str     r4, [sp, #0x3C]
        ldr     r3, [sp, #0x3C]
        ldr     r4, [sp, #0x50]
        str     r6, [sp, #0x60]
        ldr     r8, [sp, #0x4C]
        ldr     r7, [sp, #0x54]
        ldr     r6, [sp, #0x58]
        add     r3, r4, r3
        str     r1, [sp, #4]
        str     r0, [sp, #8]
        str     r11, [sp, #0x28]
        str     r3, [sp, #0x6C]
        b       LCFM32
LCFM58:
        str     r4, [sp, #0x48]
        ldr     r1, [sp, #0x70]
        ldr     r0, [sp, #0x6C]
        ldr     r4, [sp, #0x50]
        ldr     r7, [sp, #0x54]
        ldr     r6, [sp, #0x58]
        b       LCFM26
LCFM59:
        str     r4, [sp, #0x48]
        ldr     r1, [sp, #0x70]
        ldr     r0, [sp, #0x6C]
        ldr     r4, [sp, #0x50]
        ldr     r7, [sp, #0x54]
        ldr     r6, [sp, #0x58]
        b       LCFM26
LCFM60:
        str     r6, [sp, #0x44]
        str     r7, [sp, #0x38]
        mov     r1, r4
        ldr     r0, [sp, #0x6C]
        ldr     r4, [sp, #0x50]
        ldr     r7, [sp, #0x54]
        ldr     r6, [sp, #0x58]
        b       LCFM20
LCFM61:
        str     r6, [sp, #0x44]
        str     r7, [sp, #0x38]
        mov     r1, r4
        ldr     r0, [sp, #0x6C]
        ldr     r4, [sp, #0x50]
        ldr     r7, [sp, #0x54]
        ldr     r6, [sp, #0x58]
        b       LCFM20
LCFM62:
        mov     r0, r4
        str     r7, [sp, #0x34]
        mov     r4, r6
        ldr     r7, [sp, #0x54]
        ldr     r6, [sp, #0x58]
        str     r2, [sp, #0x40]
        b       LCFM14
LCFM63:
        mov     r0, r4
        str     r7, [sp, #0x34]
        mov     r4, r6
        ldr     r7, [sp, #0x54]
        ldr     r6, [sp, #0x58]
        str     r2, [sp, #0x40]
        b       LCFM14
LCFM64:
        str     r7, [sp, #0x28]
        ldr     r7, [sp, #0x54]
        ldr     r6, [sp, #0x58]
        str     r0, [sp, #0x3C]
        b       LCFM8
LCFM65:
        str     r7, [sp, #0x28]
        ldr     r7, [sp, #0x54]
        ldr     r6, [sp, #0x58]
        str     r0, [sp, #0x3C]
        b       LCFM8
LCFM66:
        mvn     r0, #7
        add     sp, sp, #0x7D, 30
        ldmia   sp!, {r4 - r11, pc}


        .data
        .align  4


LCFM_c1.3623.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LCFM_c2.3623.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LCFM_c3.3623.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LCFM_c4.3623.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LCFM_x1.3623.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LCFM_x2.3623.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LCFM_x3.3623.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LCFM_x4.3623.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LCFM_ln_maxd.3623.0.0.0:
        .byte   0xE6,0x39,0xFA,0xFE,0x42,0x2E,0x86,0x40
LCFM_ln_mind.3623.0.0.0:
        .byte   0xD2,0xBC,0x7A,0xDD,0x2B,0x23,0x86,0x40
LCFM_maxd.3623.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0xF0,0x7F
LCFM_mind.3623.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LCFM_coef.3623.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x30,0x43


