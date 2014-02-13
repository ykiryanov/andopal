        .text
        .align  4
        .globl  _ippsExp_32f_I


_ippsExp_32f_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x55, 30
        cmp     r0, #0
        str     r0, [sp, #8]
        mov     r4, r1
        beq     LCFL58
        cmp     r4, #1
        blt     LCFL45
        ldr     r12, [pc, #0xF80]
        ldr     r0, [pc, #0xF80]
        ldr     r3, [pc, #0xF80]
        ldr     r2, [pc, #0xF80]
        ldr     lr, [pc, #0xF80]
        ldr     r12, [r12]
        ldr     r9, [r0]
        ldr     r3, [r3]
        ldr     r2, [r2]
        ldr     lr, [lr]
        str     r12, [sp, #0xF4]
        mov     r0, #0xFF, 10
        orr     r12, r0, #1, 2
        str     r3, [sp, #0x104]
        str     r2, [sp, #0xFC]
        str     lr, [sp, #0xEC]
        mov     r0, #0
        cmp     r4, #4
        str     r0, [sp, #4]
        bge     LCFL3
        cmp     r4, #0
        ble     LCFL2
        ldr     r6, [pc, #0xF3C]
        ldr     r5, [pc, #0xF3C]
        sub     r7, r12, #1, 10
        str     r7, [sp, #0x140]
        ldr     r8, [sp, #8]
LCFL0:
        ldr     r0, [r8]
        bl      __extendsfdf2
        mov     r10, r0
        mov     r9, r1
        mov     r2, r5
        mov     r3, r6
        bl      __gtdf2
        cmp     r0, #0
        strgt   r7, [r8]
        bgt     LCFL1
        mov     r1, r9
        mov     r0, r10
        bl      exp
        bl      __truncdfsf2
        str     r0, [r8]
LCFL1:
        subs    r4, r4, #1
        add     r8, r8, #4
        bne     LCFL0
LCFL2:
        mov     r0, #0
        add     sp, sp, #0x55, 30
        ldmia   sp!, {r4 - r11, pc}
LCFL3:
        ldr     r0, [sp, #4]
        eor     r6, r12, #1, 10
        str     r6, [sp, #0x140]
        str     r0, [sp, #0x13C]
        str     r0, [sp, #0x144]
        str     r0, [sp, #0x148]
        str     r0, [sp, #0x14C]
        str     r0, [sp, #0x150]
        subs    r4, r4, #1
        str     r4, [sp, #0xC]
        mvn     r1, #2, 2
        bmi     LCFL8
        ldr     r0, [sp, #0xC]
        ldr     r5, [sp, #8]
        ldr     r4, [pc, #0xEA4]
        ldr     lr, [pc, #0xEA4]
        ldr     r3, [pc, #0xEA4]
        ldr     r2, [pc, #0xEA4]
        add     r0, r5, r0, lsl #2
        ldr     r5, [sp, #0xC]
LCFL4:
        ldr     r7, [r0]
        and     r6, r7, r1
        cmp     r6, #2, 10
        str     r7, [sp, #0x150]
        bic     r6, r7, r1
        ldrcc   r7, [r4]
        strcc   r7, [r0]
        bcc     LCFL7
        cmp     r6, #0
        beq     LCFL6
        cmp     lr, r7
        bhi     LCFL5
        and     r7, r7, r12
        cmp     r12, r7
        ldrne   r7, [sp, #0x13C]
        strne   r7, [r0]
        ldreq   r7, [r3]
        streq   r7, [r0]
        b       LCFL7
LCFL5:
        str     r5, [sp, #0xC]
        str     r6, [sp, #4]
        b       LCFL8
LCFL6:
        cmp     r2, r7
        bhi     LCFL57
        and     r7, r7, r12
        cmp     r12, r7
        ldrne   r7, [sp, #0x140]
        strne   r7, [r0]
        bne     LCFL7
        ldr     r7, [r3]
        eor     r7, r7, #2, 2
        str     r7, [r0]
LCFL7:
        subs    r5, r5, #1
        sub     r0, r0, #4
        bpl     LCFL4
        str     r5, [sp, #0xC]
        str     r6, [sp, #4]
LCFL8:
        ldr     r0, [sp, #0xC]
        subs    r2, r0, #1
        ldr     r0, [sp, #4]
        str     r2, [sp, #0x24]
        add     r0, r9, r0
        movmi   r1, #0
        strmi   r1, [sp, #0x2C]
        bmi     LCFL13
        ldr     r2, [sp, #0x24]
        ldr     r3, [sp, #8]
        ldr     r6, [pc, #0xDD0]
        ldr     r5, [pc, #0xDD0]
        ldr     r4, [pc, #0xDD0]
        ldr     lr, [pc, #0xDD0]
        ldr     r8, [sp, #0x24]
        add     r2, r3, r2, lsl #2
LCFL9:
        ldr     r7, [r2]
        and     r3, r7, r1
        cmp     r3, #2, 10
        str     r7, [sp, #0x14C]
        bic     r3, r7, r1
        ldrcc   r7, [r6]
        strcc   r7, [r2]
        bcc     LCFL12
        cmp     r3, #0
        beq     LCFL11
        cmp     r5, r7
        bhi     LCFL10
        mov     r10, #0xFF, 10
        orr     r10, r10, #1, 2
        and     r10, r7, r10
        cmp     r12, r10
        ldrne   r7, [sp, #0x13C]
        strne   r7, [r2]
        ldreq   r7, [r4]
        streq   r7, [r2]
        b       LCFL12
LCFL10:
        str     r3, [sp, #0x2C]
        str     r8, [sp, #0x24]
        b       LCFL13
LCFL11:
        cmp     lr, r7
        bhi     LCFL56
        mov     r10, #0xFF, 10
        orr     r10, r10, #1, 2
        and     r10, r7, r10
        cmp     r12, r10
        ldrne   r7, [sp, #0x140]
        strne   r7, [r2]
        bne     LCFL12
        ldr     r7, [r4]
        eor     r7, r7, #2, 2
        str     r7, [r2]
LCFL12:
        subs    r8, r8, #1
        sub     r2, r2, #4
        bpl     LCFL9
        str     r3, [sp, #0x2C]
        str     r8, [sp, #0x24]
LCFL13:
        ldr     r1, [sp, #0x24]
        subs    r2, r1, #1
        ldr     r1, [sp, #0x2C]
        str     r2, [sp, #0x28]
        add     r1, r9, r1
        movmi   r2, #0
        strmi   r2, [sp, #0x30]
        bmi     LCFL18
        ldr     r6, [pc, #0xCF4]
        ldr     r5, [pc, #0xCF4]
        ldr     r4, [pc, #0xCF4]
        ldr     lr, [pc, #0xCF4]
        mov     r2, #0xFF, 10
        ldr     r12, [sp, #8]
        orr     r3, r2, #1, 2
        ldr     r2, [sp, #0x28]
        ldr     r8, [sp, #0x28]
        add     r12, r12, r2, lsl #2
LCFL14:
        ldr     r7, [r12]
        mvn     r2, #2, 2
        and     r11, r7, r2
        cmp     r11, #2, 10
        str     r7, [sp, #0x148]
        bic     r2, r7, r2
        ldrcc   r7, [r6]
        strcc   r7, [r12]
        bcc     LCFL17
        cmp     r2, #0
        beq     LCFL16
        cmp     r5, r7
        bhi     LCFL15
        mov     r10, #0xFF, 10
        orr     r10, r10, #1, 2
        and     r10, r7, r10
        cmp     r3, r10
        ldrne   r7, [sp, #0x13C]
        strne   r7, [r12]
        ldreq   r7, [r4]
        streq   r7, [r12]
        b       LCFL17
LCFL15:
        str     r2, [sp, #0x30]
        str     r8, [sp, #0x28]
        b       LCFL18
LCFL16:
        cmp     lr, r7
        bhi     LCFL55
        mov     r10, #0xFF, 10
        orr     r10, r10, #1, 2
        and     r10, r7, r10
        cmp     r3, r10
        ldrne   r7, [sp, #0x140]
        strne   r7, [r12]
        bne     LCFL17
        ldr     r7, [r4]
        eor     r7, r7, #2, 2
        str     r7, [r12]
LCFL17:
        subs    r8, r8, #1
        sub     r12, r12, #4
        bpl     LCFL14
        str     r2, [sp, #0x30]
        str     r8, [sp, #0x28]
LCFL18:
        ldr     r2, [sp, #0x28]
        subs    r8, r2, #1
        ldr     r2, [sp, #0x30]
        add     r2, r9, r2
        movmi   r7, #0
        bmi     LCFL23
        ldr     r6, [pc, #0xC0C]
        ldr     r5, [pc, #0xC0C]
        ldr     r4, [pc, #0xC0C]
        ldr     lr, [pc, #0xC0C]
        mov     r3, #0xFF, 10
        orr     r12, r3, #1, 2
        ldr     r3, [sp, #8]
        str     r9, [sp]
        add     r3, r3, r8, lsl #2
LCFL19:
        ldr     r9, [r3]
        mvn     r11, #2, 2
        and     r7, r9, r11
        cmp     r7, #2, 10
        str     r9, [sp, #0x144]
        bic     r7, r9, r11
        ldrcc   r9, [r6]
        strcc   r9, [r3]
        bcc     LCFL22
        cmp     r7, #0
        beq     LCFL21
        cmp     r5, r9
        bhi     LCFL20
        mov     r10, #0xFF, 10
        orr     r10, r10, #1, 2
        and     r10, r9, r10
        cmp     r12, r10
        ldrne   r9, [sp, #0x13C]
        strne   r9, [r3]
        ldreq   r9, [r4]
        streq   r9, [r3]
        b       LCFL22
LCFL20:
        ldr     r9, [sp]
        b       LCFL23
LCFL21:
        cmp     lr, r9
        bhi     LCFL54
        mov     r10, #0xFF, 10
        orr     r10, r10, #1, 2
        and     r10, r9, r10
        cmp     r12, r10
        ldrne   r9, [sp, #0x140]
        strne   r9, [r3]
        bne     LCFL22
        ldr     r9, [r4]
        eor     r9, r9, #2, 2
        str     r9, [r3]
LCFL22:
        subs    r8, r8, #1
        sub     r3, r3, #4
        bpl     LCFL19
        ldr     r9, [sp]
LCFL23:
        cmp     r8, #0
        add     r6, r9, r7
        blt     LCFL46
        ldr     r3, [pc, #0xB44]
        ldr     r4, [sp, #0x150]
        ldr     r10, [pc, #0xB34]
        ldr     r3, [r3]
        ldr     r5, [sp, #0x140]
        str     r4, [sp, #0x10]
        ldr     r4, [sp, #0x14C]
        eor     r12, r3, #2, 2
        str     r4, [sp, #0x18]
        ldr     r4, [sp, #0x148]
        str     r4, [sp, #0x1C]
        ldr     r4, [sp, #0x144]
        str     r4, [sp, #0x14]
        ldr     r10, [r10]
        ldr     r4, [sp, #0x13C]
        str     r10, [sp, #0x20]
        str     r6, [sp, #0xF0]
        str     r2, [sp, #0xF8]
        str     r1, [sp, #0x100]
        str     r0, [sp, #0x108]
        mov     r10, #0xFF, 10
        orr     r10, r10, #1, 2
        str     r10, [sp, #0x4C]
        str     r4, [sp, #0x48]
        str     r12, [sp, #0x44]
        str     r3, [sp, #0x40]
        str     r5, [sp, #0x3C]
        str     r6, [sp, #0x58]
        str     r2, [sp, #0x54]
        str     r1, [sp, #0x50]
        str     r0, [sp, #0x38]
LCFL24:
        ldr     r0, [sp, #0x10]
        bl      __extendsfdf2
        ldr     r5, [pc, #0xAC8]
        ldr     r4, [pc, #0xAC8]
        str     r0, [sp, #0xE0]
        ldr     r0, [sp, #0xE0]
        str     r1, [sp, #0xDC]
        mov     r3, r4
        mov     r2, r5
        bl      __muldf3
        mov     r10, r0
        ldr     r0, [sp, #0x18]
        mov     r6, r1
        bl      __extendsfdf2
        str     r0, [sp, #0xD8]
        ldr     r0, [sp, #0xD8]
        str     r1, [sp, #0xD4]
        mov     r3, r4
        mov     r2, r5
        bl      __muldf3
        ldr     r12, [sp, #0x104]
        ldr     r11, [sp, #0x108]
        str     r12, [sp, #0xD0]
        ldr     r2, [sp, #0xD0]
        str     r0, [sp, #0xCC]
        str     r1, [sp, #0xC8]
        mov     r3, r11
        mov     r1, r6
        mov     r0, r10
        bl      __adddf3
        ldr     r6, [sp, #0xFC]
        ldr     r10, [sp, #0x100]
        str     r0, [sp, #0xC4]
        str     r0, [sp, #0x124]
        str     r1, [sp, #0xC0]
        str     r1, [sp, #0x128]
        ldr     r0, [sp, #0xCC]
        ldr     r1, [sp, #0xC8]
        mov     r2, r6
        mov     r3, r10
        bl      __adddf3
        ldr     r2, [sp, #0x124]
        str     r0, [sp, #0x5C]
        mov     r3, r11
        str     r2, [sp, #0x60]
        str     r0, [sp, #0x11C]
        str     r1, [sp, #0xCC]
        str     r1, [sp, #0x120]
        ldr     r1, [sp, #0xC0]
        ldr     r2, [sp, #0xD0]
        ldr     r0, [sp, #0xC4]
        bl      __subdf3
        str     r0, [sp, #0xD0]
        ldr     r0, [sp, #0x5C]
        str     r1, [sp, #0xC8]
        ldr     r1, [sp, #0xCC]
        mov     r2, r6
        mov     r3, r10
        bl      __subdf3
        str     r0, [sp, #0xCC]
        ldr     r0, [sp, #0x1C]
        str     r1, [sp, #0xC4]
        bl      __extendsfdf2
        str     r0, [sp, #0xC0]
        ldr     r0, [sp, #0xC0]
        str     r1, [sp, #0xBC]
        mov     r3, r4
        mov     r2, r5
        bl      __muldf3
        str     r0, [sp, #0xB8]
        ldr     r0, [sp, #0x14]
        mov     r6, r1
        bl      __extendsfdf2
        str     r0, [sp, #0xB4]
        ldr     r0, [sp, #0xB4]
        str     r1, [sp, #0xB0]
        mov     r3, r4
        mov     r2, r5
        bl      __muldf3
        ldr     r2, [sp, #0xF4]
        ldr     r4, [sp, #0xF8]
        str     r0, [sp, #0xA8]
        str     r2, [sp, #0xAC]
        ldr     r0, [sp, #0xB8]
        ldr     r2, [sp, #0xAC]
        str     r1, [sp, #0xA4]
        mov     r3, r4
        mov     r1, r6
        bl      __adddf3
        ldr     r6, [sp, #0xEC]
        ldr     r5, [sp, #0xF0]
        str     r0, [sp, #0xB8]
        str     r0, [sp, #0x114]
        str     r1, [sp, #0xA0]
        str     r1, [sp, #0x118]
        ldr     r0, [sp, #0xA8]
        ldr     r1, [sp, #0xA4]
        mov     r2, r6
        mov     r3, r5
        bl      __adddf3
        ldr     r2, [sp, #0x114]
        mov     r10, r0
        str     r10, [sp, #0x64]
        mov     r11, r1
        str     r2, [sp, #0x68]
        str     r10, [sp, #0x10C]
        str     r11, [sp, #0x110]
        ldr     r0, [sp, #0xB8]
        ldr     r1, [sp, #0xA0]
        ldr     r2, [sp, #0xAC]
        mov     r3, r4
        bl      __subdf3
        str     r1, [sp, #0xAC]
        str     r0, [sp, #0xB8]
        mov     r0, r10
        mov     r3, r5
        mov     r2, r6
        mov     r1, r11
        bl      __subdf3
        ldr     r5, [pc, #0x8FC]
        ldr     r6, [pc, #0x8FC]
        mov     r10, r0
        ldr     r0, [sp, #0xD0]
        mov     r11, r1
        ldr     r1, [sp, #0xC8]
        mov     r2, r5
        mov     r3, r6
        bl      __muldf3
        str     r0, [sp, #0xD0]
        mov     r4, r1
        ldr     r0, [sp, #0xCC]
        ldr     r1, [sp, #0xC4]
        mov     r2, r5
        mov     r3, r6
        bl      __muldf3
        str     r0, [sp, #0xCC]
        ldr     r0, [sp, #0xB8]
        str     r1, [sp, #0xC8]
        ldr     r1, [sp, #0xAC]
        mov     r2, r5
        mov     r3, r6
        bl      __muldf3
        str     r0, [sp, #0xC4]
        str     r1, [sp, #0xB8]
        mov     r2, r5
        mov     r3, r6
        mov     r0, r10
        mov     r1, r11
        bl      __muldf3
        ldr     r2, [sp, #0xD0]
        mov     r5, r0
        ldr     r0, [sp, #0xE0]
        mov     r6, r1
        ldr     r1, [sp, #0xDC]
        mov     r3, r4
        bl      __subdf3
        str     r0, [sp, #0xE0]
        ldr     r2, [sp, #0xCC]
        str     r1, [sp, #0xDC]
        ldr     r0, [sp, #0xD8]
        ldr     r1, [sp, #0xD4]
        ldr     r3, [sp, #0xC8]
        bl      __subdf3
        ldr     r3, [sp, #0xB8]
        mov     r10, r0
        ldr     r0, [sp, #0xC0]
        mov     r11, r1
        ldr     r1, [sp, #0xBC]
        ldr     r2, [sp, #0xC4]
        bl      __subdf3
        str     r0, [sp, #0xD8]
        ldr     r0, [sp, #0xB4]
        str     r1, [sp, #0xD4]
        ldr     r1, [sp, #0xB0]
        mov     r2, r5
        mov     r3, r6
        bl      __subdf3
        ldr     r2, [sp, #0xE0]
        ldr     r3, [sp, #0xDC]
        str     r0, [sp, #0xD0]
        str     r1, [sp, #0xCC]
        ldr     r1, [sp, #0xDC]
        mov     r0, r2
        bl      __muldf3
        str     r1, [sp, #0xC4]
        ldr     r1, [sp, #0xC4]
        str     r0, [sp, #0xC8]
        ldr     r0, [sp, #0xC8]
        mov     r12, #0x4E, 16
        orr     r4, r12, #1, 2
        sub     r6, r4, #0x2A, 16
        mov     r2, #0
        mov     r3, r6
        bl      __adddf3
        str     r0, [sp, #0xC0]
        str     r1, [sp, #0xBC]
        mov     r0, r10
        mov     r2, r10
        mov     r1, r11
        mov     r3, r11
        bl      __muldf3
        str     r0, [sp, #0xB8]
        ldr     r0, [sp, #0xB8]
        str     r1, [sp, #0xB4]
        mov     r2, #0
        mov     r3, r6
        bl      __adddf3
        str     r0, [sp, #0xB0]
        str     r1, [sp, #0xAC]
        ldr     r0, [sp, #0xC0]
        ldr     r1, [sp, #0xBC]
        sub     r5, r4, #0x26, 16
        mov     r3, r5
        mov     r2, #0
        bl      __muldf3
        str     r0, [sp, #0xC0]
        str     r1, [sp, #0xBC]
        ldr     r0, [sp, #0xB0]
        ldr     r1, [sp, #0xAC]
        mov     r3, r5
        mov     r2, #0
        bl      __muldf3
        ldr     r3, [sp, #0xC4]
        ldr     r2, [sp, #0xC8]
        str     r0, [sp, #0xB0]
        str     r1, [sp, #0xAC]
        mov     r0, #0
        mov     r1, r4
        bl      __adddf3
        ldr     r2, [sp, #0xB8]
        ldr     r3, [sp, #0xB4]
        str     r0, [sp, #0xC8]
        str     r1, [sp, #0xC4]
        mov     r0, #0
        mov     r1, r4
        bl      __adddf3
        str     r0, [sp, #0xB8]
        ldr     r0, [sp, #0xC8]
        ldr     r2, [sp, #0xE0]
        ldr     r3, [sp, #0xDC]
        str     r1, [sp, #0xB4]
        ldr     r1, [sp, #0xC4]
        bl      __muldf3
        str     r1, [sp, #0xDC]
        ldr     r1, [sp, #0xB4]
        str     r0, [sp, #0xE0]
        ldr     r0, [sp, #0xB8]
        mov     r3, r11
        mov     r2, r10
        bl      __muldf3
        str     r1, [sp, #0xC4]
        str     r0, [sp, #0xC8]
        ldr     r1, [sp, #0xBC]
        ldr     r0, [sp, #0xC0]
        ldr     r2, [sp, #0xE0]
        ldr     r3, [sp, #0xDC]
        bl      __adddf3
        ldr     r3, [sp, #0xC4]
        ldr     r2, [sp, #0xC8]
        str     r0, [sp, #0x6C]
        ldr     r0, [sp, #0xB0]
        str     r1, [sp, #0x70]
        ldr     r1, [sp, #0xAC]
        bl      __adddf3
        ldr     r3, [sp, #0xD4]
        str     r0, [sp, #0x74]
        ldr     r0, [sp, #0xD8]
        str     r1, [sp, #0x78]
        ldr     r1, [sp, #0xD4]
        mov     r2, r0
        bl      __muldf3
        mov     r10, r0
        str     r1, [sp, #0xB8]
        mov     r2, #0
        mov     r3, r6
        bl      __adddf3
        ldr     r3, [sp, #0xCC]
        str     r0, [sp, #0xB4]
        ldr     r0, [sp, #0xD0]
        str     r1, [sp, #0xA8]
        ldr     r1, [sp, #0xCC]
        mov     r2, r0
        bl      __muldf3
        str     r1, [sp, #0xA4]
        mov     r11, r0
        mov     r2, #0
        mov     r3, r6
        bl      __adddf3
        str     r0, [sp, #0xA0]
        mov     r6, r1
        ldr     r0, [sp, #0xB4]
        ldr     r1, [sp, #0xA8]
        mov     r3, r5
        mov     r2, #0
        bl      __muldf3
        str     r0, [sp, #0xB4]
        ldr     r0, [sp, #0xA0]
        str     r1, [sp, #0xA8]
        mov     r2, #0
        mov     r1, r6
        mov     r3, r5
        bl      __muldf3
        ldr     r3, [sp, #0xB8]
        str     r0, [sp, #0xE4]
        str     r1, [sp, #0xE8]
        mov     r0, #0
        mov     r1, r4
        mov     r2, r10
        bl      __adddf3
        ldr     r3, [sp, #0xA4]
        mov     r6, r1
        mov     r5, r0
        mov     r2, r11
        mov     r0, #0
        mov     r1, r4
        bl      __adddf3
        ldr     r2, [sp, #0xD8]
        ldr     r3, [sp, #0xD4]
        str     r0, [sp, #0xB8]
        str     r1, [sp, #0xA4]
        mov     r1, r6
        mov     r0, r5
        bl      __muldf3
        mov     r6, r1
        ldr     r3, [sp, #0xCC]
        ldr     r2, [sp, #0xD0]
        ldr     r1, [sp, #0xA4]
        mov     r5, r0
        ldr     r0, [sp, #0xB8]
        bl      __muldf3
        mov     r10, r0
        ldr     r0, [sp, #0xB4]
        mov     r11, r1
        ldr     r1, [sp, #0xA8]
        mov     r2, r5
        mov     r3, r6
        bl      __adddf3
        str     r0, [sp, #0x7C]
        ldr     r0, [sp, #0xE4]
        str     r1, [sp, #0x80]
        ldr     r1, [sp, #0xE8]
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        str     r1, [sp, #0x88]
        str     r0, [sp, #0x84]
        ldr     r1, [sp, #0xBC]
        ldr     r2, [sp, #0xE0]
        ldr     r3, [sp, #0xDC]
        ldr     r0, [sp, #0xC0]
        bl      __subdf3
        str     r0, [sp, #0x8C]
        str     r1, [sp, #0x90]
        ldr     r0, [sp, #0xB0]
        ldr     r2, [sp, #0xC8]
        ldr     r3, [sp, #0xC4]
        ldr     r1, [sp, #0xAC]
        bl      __subdf3
        str     r1, [sp, #0x98]
        ldr     r1, [sp, #0xA8]
        str     r0, [sp, #0x94]
        ldr     r0, [sp, #0xB4]
        mov     r2, r5
        mov     r3, r6
        bl      __subdf3
        str     r0, [sp, #0x9C]
        str     r1, [sp, #0xA0]
        ldr     r0, [sp, #0xE4]
        ldr     r1, [sp, #0xE8]
        mov     r2, r10
        mov     r3, r11
        bl      __subdf3
        ldr     r2, [sp, #0x94]
        ldr     r3, [sp, #0x98]
        mov     r11, r0
        str     r11, [sp, #0xA4]
        ldr     r0, [sp, #0x8C]
        mov     r10, r1
        ldr     r1, [sp, #0x90]
        str     r10, [sp, #0xA8]
        bl      __muldf3
        mov     r5, r0
        mov     r6, r1
        ldr     r0, [sp, #0x9C]
        ldr     r1, [sp, #0xA0]
        str     r5, [sp, #0xAC]
        str     r6, [sp, #0xB0]
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        str     r0, [sp, #0xB4]
        str     r1, [sp, #0xB8]
        mov     r2, r5
        mov     r3, r6
        bl      __muldf3
        mov     r3, r1
        mov     r2, r0
        sub     r1, r4, #0x5E, 16
        mov     r0, #0
        bl      __divdf3
        ldr     r2, [sp, #0xC]
        str     r0, [sp, #0xBC]
        ldr     r0, [sp, #4]
        str     r2, [sp, #0xD4]
        str     r0, [sp, #0xC4]
        ldr     r0, [sp, #0x2C]
        subs    r2, r8, #1
        str     r2, [sp, #0xC]
        str     r0, [sp, #0xC8]
        ldr     r0, [sp, #0x30]
        str     r1, [sp, #0xC0]
        str     r0, [sp, #0xCC]
        ldr     r0, [sp, #0x24]
        str     r7, [sp, #0xD0]
        str     r0, [sp, #0xD8]
        ldr     r0, [sp, #0x28]
        str     r8, [sp, #0xE0]
        str     r0, [sp, #0xDC]
        bmi     LCFL29
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #0xC]
        str     r7, [sp, #0x34]
        str     r9, [sp]
        ldr     r2, [pc, #0x430]
        ldr     r3, [sp, #0x4C]
        ldr     r12, [pc, #0x420]
        ldr     lr, [sp, #0x20]
        ldr     r4, [sp, #0x48]
        ldr     r5, [sp, #0x44]
        ldr     r6, [sp, #0x40]
        ldr     r7, [sp, #0x3C]
        ldr     r9, [sp, #0xC]
        add     r0, r0, r1, lsl #2
LCFL25:
        ldr     r8, [r0]
        mvn     r11, #2, 2
        and     r1, r8, r11
        cmp     r1, #2, 10
        str     r8, [sp, #0x150]
        bic     r1, r8, r11
        strcc   lr, [r0]
        bcc     LCFL28
        cmp     r1, #0
        beq     LCFL27
        cmp     r12, r8
        bhi     LCFL26
        mov     r10, #0xFF, 10
        orr     r10, r10, #1, 2
        and     r10, r8, r10
        cmp     r3, r10
        strne   r4, [r0]
        streq   r6, [r0]
        b       LCFL28
LCFL26:
        str     r1, [sp, #4]
        ldr     r0, [sp, #4]
        str     r9, [sp, #0xC]
        ldr     r9, [sp]
        str     r7, [sp, #0x3C]
        ldr     r7, [sp, #0x34]
        add     r0, r9, r0
        str     r3, [sp, #0x4C]
        str     r4, [sp, #0x48]
        str     r5, [sp, #0x44]
        str     r6, [sp, #0x40]
        str     r8, [sp, #0x10]
        str     r0, [sp, #0x38]
        b       LCFL29
LCFL27:
        cmp     r2, r8
        bhi     LCFL53
        mov     r10, #0xFF, 10
        orr     r10, r10, #1, 2
        and     r10, r8, r10
        cmp     r3, r10
        strne   r7, [r0]
        streq   r5, [r0]
LCFL28:
        subs    r9, r9, #1
        sub     r0, r0, #4
        bpl     LCFL25
        str     r1, [sp, #4]
        ldr     r0, [sp, #4]
        str     r9, [sp, #0xC]
        ldr     r9, [sp]
        str     r7, [sp, #0x3C]
        ldr     r7, [sp, #0x34]
        add     r0, r9, r0
        str     r3, [sp, #0x4C]
        str     r4, [sp, #0x48]
        str     r5, [sp, #0x44]
        str     r6, [sp, #0x40]
        str     r8, [sp, #0x10]
        str     r0, [sp, #0x38]
LCFL29:
        ldr     r0, [sp, #0xC]
        subs    r0, r0, #1
        str     r0, [sp, #0x24]
        bmi     LCFL34
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #0x24]
        str     r7, [sp, #0x34]
        str     r9, [sp]
        ldr     r2, [pc, #0x304]
        ldr     r3, [sp, #0x4C]
        ldr     r12, [pc, #0x2F4]
        ldr     lr, [sp, #0x20]
        ldr     r4, [sp, #0x48]
        ldr     r5, [sp, #0x44]
        ldr     r6, [sp, #0x40]
        ldr     r7, [sp, #0x3C]
        ldr     r9, [sp, #0x24]
        add     r0, r0, r1, lsl #2
LCFL30:
        ldr     r8, [r0]
        mvn     r1, #2, 2
        and     r11, r8, r1
        cmp     r11, #2, 10
        str     r8, [sp, #0x14C]
        bic     r1, r8, r1
        strcc   lr, [r0]
        bcc     LCFL33
        cmp     r1, #0
        beq     LCFL32
        cmp     r12, r8
        bhi     LCFL31
        mov     r10, #0xFF, 10
        orr     r10, r10, #1, 2
        and     r10, r8, r10
        cmp     r3, r10
        strne   r4, [r0]
        streq   r6, [r0]
        b       LCFL33
LCFL31:
        str     r1, [sp, #0x2C]
        ldr     r0, [sp, #0x2C]
        str     r9, [sp, #0x24]
        ldr     r9, [sp]
        str     r7, [sp, #0x3C]
        ldr     r7, [sp, #0x34]
        add     r0, r9, r0
        str     r3, [sp, #0x4C]
        str     r4, [sp, #0x48]
        str     r5, [sp, #0x44]
        str     r6, [sp, #0x40]
        str     r8, [sp, #0x18]
        str     r0, [sp, #0x50]
        b       LCFL34
LCFL32:
        cmp     r2, r8
        bhi     LCFL52
        mov     r10, #0xFF, 10
        orr     r10, r10, #1, 2
        and     r10, r8, r10
        cmp     r3, r10
        strne   r7, [r0]
        streq   r5, [r0]
LCFL33:
        subs    r9, r9, #1
        sub     r0, r0, #4
        bpl     LCFL30
        str     r1, [sp, #0x2C]
        ldr     r0, [sp, #0x2C]
        str     r9, [sp, #0x24]
        ldr     r9, [sp]
        str     r7, [sp, #0x3C]
        ldr     r7, [sp, #0x34]
        add     r0, r9, r0
        str     r3, [sp, #0x4C]
        str     r4, [sp, #0x48]
        str     r5, [sp, #0x44]
        str     r6, [sp, #0x40]
        str     r8, [sp, #0x18]
        str     r0, [sp, #0x50]
LCFL34:
        ldr     r0, [sp, #0x24]
        subs    r0, r0, #1
        str     r0, [sp, #0x28]
        bmi     LCFL39
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #0x28]
        str     r7, [sp, #0x34]
        str     r9, [sp]
        ldr     r2, [pc, #0x1D8]
        ldr     r3, [sp, #0x4C]
        ldr     r12, [pc, #0x1C8]
        ldr     lr, [sp, #0x20]
        ldr     r4, [sp, #0x48]
        ldr     r5, [sp, #0x44]
        ldr     r6, [sp, #0x40]
        ldr     r7, [sp, #0x3C]
        ldr     r9, [sp, #0x28]
        add     r0, r0, r1, lsl #2
LCFL35:
        ldr     r8, [r0]
        mvn     r11, #2, 2
        and     r1, r8, r11
        cmp     r1, #2, 10
        str     r8, [sp, #0x148]
        bic     r1, r8, r11
        strcc   lr, [r0]
        bcc     LCFL38
        cmp     r1, #0
        beq     LCFL37
        cmp     r12, r8
        bhi     LCFL36
        mov     r10, #0xFF, 10
        orr     r10, r10, #1, 2
        and     r10, r8, r10
        cmp     r3, r10
        strne   r4, [r0]
        streq   r6, [r0]
        b       LCFL38
LCFL36:
        str     r1, [sp, #0x30]
        ldr     r0, [sp, #0x30]
        str     r9, [sp, #0x28]
        ldr     r9, [sp]
        str     r7, [sp, #0x3C]
        ldr     r7, [sp, #0x34]
        add     r0, r9, r0
        str     r3, [sp, #0x4C]
        str     r4, [sp, #0x48]
        str     r5, [sp, #0x44]
        str     r6, [sp, #0x40]
        str     r8, [sp, #0x1C]
        str     r0, [sp, #0x54]
        b       LCFL39
LCFL37:
        cmp     r2, r8
        bhi     LCFL51
        mov     r10, #0xFF, 10
        orr     r10, r10, #1, 2
        and     r10, r8, r10
        cmp     r3, r10
        strne   r7, [r0]
        streq   r5, [r0]
LCFL38:
        subs    r9, r9, #1
        sub     r0, r0, #4
        bpl     LCFL35
        str     r1, [sp, #0x30]
        ldr     r0, [sp, #0x30]
        str     r9, [sp, #0x28]
        ldr     r9, [sp]
        str     r7, [sp, #0x3C]
        ldr     r7, [sp, #0x34]
        add     r0, r9, r0
        str     r3, [sp, #0x4C]
        str     r4, [sp, #0x48]
        str     r5, [sp, #0x44]
        str     r6, [sp, #0x40]
        str     r8, [sp, #0x1C]
        str     r0, [sp, #0x54]
LCFL39:
        ldr     r0, [sp, #0x28]
        subs    r8, r0, #1
        bmi     LCFL44
        ldr     r0, [sp, #8]
        str     r9, [sp]
        ldr     r1, [pc, #0xB8]
        ldr     r2, [sp, #0x4C]
        ldr     r3, [pc, #0xA8]
        ldr     r12, [sp, #0x20]
        ldr     lr, [sp, #0x48]
        ldr     r4, [sp, #0x44]
        ldr     r5, [sp, #0x40]
        ldr     r9, [sp, #0x3C]
        add     r0, r0, r8, lsl #2
LCFL40:
        ldr     r6, [r0]
        mvn     r7, #2, 2
        and     r11, r6, r7
        cmp     r11, #2, 10
        str     r6, [sp, #0x144]
        bic     r7, r6, r7
        strcc   r12, [r0]
        bcc     LCFL43
        cmp     r7, #0
        beq     LCFL42
        cmp     r3, r6
        bhi     LCFL41
        mov     r10, #0xFF, 10
        orr     r10, r10, #1, 2
        and     r10, r6, r10
        cmp     r2, r10
        strne   lr, [r0]
        streq   r5, [r0]
        b       LCFL43
LCFL41:
        str     r9, [sp, #0x3C]
        ldr     r9, [sp]
        str     r2, [sp, #0x4C]
        str     lr, [sp, #0x48]
        add     r0, r9, r7
        str     r4, [sp, #0x44]
        str     r5, [sp, #0x40]
        str     r6, [sp, #0x14]
        str     r0, [sp, #0x58]
        b       LCFL44
        .long   LCFL_c3.3619.0.0.0
        .long   LCFL_coef.3619.0.0.0
        .long   LCFL_c1.3619.0.0.0
        .long   LCFL_c2.3619.0.0.0
        .long   LCFL_c4.3619.0.0.0
        .long   0x40562e43
        .long   0x02b40f67
        .long   LCFL__2il0floatpacket.1
        .long   0xc2aeac50
        .long   ippConstantOfNAN_32f
        .long   0x42b17218
        .long   0x652b82fe
        .long   0x3ff71547
        .long   0xfefa39ef
        .long   0x3fe62e42
LCFL42:
        cmp     r1, r6
        bhi     LCFL50
        mov     r10, #0xFF, 10
        orr     r10, r10, #1, 2
        and     r10, r6, r10
        cmp     r2, r10
        strne   r9, [r0]
        streq   r4, [r0]
LCFL43:
        subs    r8, r8, #1
        sub     r0, r0, #4
        bpl     LCFL40
        str     r9, [sp, #0x3C]
        ldr     r9, [sp]
        str     r2, [sp, #0x4C]
        str     lr, [sp, #0x48]
        add     r0, r9, r7
        str     r4, [sp, #0x44]
        str     r5, [sp, #0x40]
        str     r6, [sp, #0x14]
        str     r0, [sp, #0x58]
LCFL44:
        ldr     r2, [sp, #0xB4]
        ldr     r3, [sp, #0xB8]
        ldr     r4, [sp, #0xBC]
        ldr     r5, [sp, #0xC0]
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        ldr     r2, [sp, #0xAC]
        ldr     r3, [sp, #0xB0]
        mov     r6, r0
        mov     r10, r1
        mov     r1, r5
        mov     r0, r4
        bl      __muldf3
        ldr     r2, [sp, #0x94]
        ldr     r3, [sp, #0x98]
        mov     r5, r0
        mov     r4, r1
        mov     r0, r6
        mov     r1, r10
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r1, [sp, #0x70]
        mov     r11, r0
        ldr     r0, [sp, #0x6C]
        bl      __truncdfsf2
        mov     r1, r11
        bl      __mulsf3
        ldr     r2, [sp, #0x8C]
        str     r0, [sp, #0x138]
        ldr     r3, [sp, #0x90]
        mov     r0, r6
        mov     r1, r10
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r1, [sp, #0x78]
        mov     r6, r0
        ldr     r0, [sp, #0x74]
        bl      __truncdfsf2
        mov     r1, r6
        bl      __mulsf3
        ldr     r2, [sp, #0xA4]
        str     r0, [sp, #0x134]
        ldr     r3, [sp, #0xA8]
        mov     r1, r4
        mov     r0, r5
        bl      __muldf3
        bl      __truncdfsf2
        mov     r6, r0
        ldr     r0, [sp, #0x7C]
        ldr     r1, [sp, #0x80]
        bl      __truncdfsf2
        mov     r1, r6
        bl      __mulsf3
        mov     r1, r0
        str     r1, [sp, #0x130]
        ldr     r2, [sp, #0x9C]
        ldr     r3, [sp, #0xA0]
        mov     r1, r4
        mov     r0, r5
        bl      __muldf3
        bl      __truncdfsf2
        mov     r4, r0
        ldr     r0, [sp, #0x84]
        ldr     r1, [sp, #0x88]
        bl      __truncdfsf2
        mov     r1, r4
        bl      __mulsf3
        ldr     r3, [sp, #0xC4]
        ldr     r1, [sp, #0x138]
        cmp     r3, #0
        str     r0, [sp, #0x12C]
        ldreq   r0, [sp, #0x60]
        addeq   r1, r1, r0, lsl #23
        ldrne   r0, [sp, #0x60]
        subne   r1, r1, r0, lsl #23
        ldr     r2, [sp, #0xC8]
        ldr     r0, [sp, #0x134]
        str     r1, [sp, #0x138]
        cmp     r2, #0
        ldreq   r1, [sp, #0x5C]
        addeq   r1, r0, r1, lsl #23
        ldrne   r1, [sp, #0x5C]
        subne   r1, r0, r1, lsl #23
        ldr     r2, [sp, #0xCC]
        ldr     r0, [sp, #0x130]
        str     r1, [sp, #0x134]
        cmp     r2, #0
        ldreq   r1, [sp, #0x68]
        addeq   r1, r0, r1, lsl #23
        ldrne   r1, [sp, #0x68]
        subne   r1, r0, r1, lsl #23
        ldr     r2, [sp, #0xD0]
        ldr     r0, [sp, #0x12C]
        str     r1, [sp, #0x130]
        cmp     r2, #0
        ldreq   r1, [sp, #0x64]
        addeq   r0, r0, r1, lsl #23
        ldrne   r1, [sp, #0x64]
        subne   r0, r0, r1, lsl #23
        ldr     r1, [sp, #8]
        ldr     r4, [sp, #0xD4]
        ldr     lr, [sp, #0x138]
        ldr     r12, [sp, #0x134]
        ldr     r2, [sp, #0x130]
        str     lr, [r1, +r4, lsl #2]
        ldr     lr, [sp, #0xD8]
        cmp     r8, #0
        str     r12, [r1, +lr, lsl #2]
        ldr     r12, [sp, #0xDC]
        str     r0, [sp, #0x12C]
        str     r2, [r1, +r12, lsl #2]
        ldr     r2, [sp, #0xE0]
        str     r0, [r1, +r2, lsl #2]
        blt     LCFL46
        ldr     r3, [sp, #0x58]
        str     r3, [sp, #0xF0]
        ldr     r3, [sp, #0x54]
        str     r3, [sp, #0xF8]
        ldr     r2, [sp, #0x50]
        str     r2, [sp, #0x100]
        ldr     r1, [sp, #0x38]
        str     r1, [sp, #0x108]
        b       LCFL24
LCFL45:
        mvn     r0, #5
        add     sp, sp, #0x55, 30
        ldmia   sp!, {r4 - r11, pc}
LCFL46:
        ldr     r0, [sp, #0xC]
        cmp     r0, #0
        blt     LCFL2
        ldr     r0, [sp, #0x150]
        ldr     r1, [sp, #0xC]
        mov     r6, r1, lsl #2
        bl      __extendsfdf2
        ldr     r4, [pc, #-0x294]
        ldr     r5, [pc, #-0x29C]
        mov     r7, r0
        mov     r8, r1
        mov     r2, r4
        mov     r3, r5
        bl      __gtdf2
        cmp     r0, #0
        ldrgt   r0, [sp, #0x140]
        bgt     LCFL47
        mov     r1, r8
        mov     r0, r7
        bl      exp
        bl      __truncdfsf2
LCFL47:
        ldr     r1, [sp, #8]
        str     r0, [r1, +r6]
        ldr     r0, [sp, #0x24]
        cmp     r0, #0
        blt     LCFL2
        ldr     r0, [sp, #0x14C]
        ldr     r1, [sp, #0x24]
        mov     r6, r1, lsl #2
        bl      __extendsfdf2
        mov     r7, r0
        mov     r8, r1
        mov     r2, r4
        mov     r3, r5
        bl      __gtdf2
        cmp     r0, #0
        ldrgt   r0, [sp, #0x140]
        bgt     LCFL48
        mov     r1, r8
        mov     r0, r7
        bl      exp
        bl      __truncdfsf2
LCFL48:
        ldr     r1, [sp, #8]
        str     r0, [r1, +r6]
        ldr     r0, [sp, #0x28]
        cmp     r0, #0
        blt     LCFL2
        ldr     r0, [sp, #0x148]
        ldr     r1, [sp, #0x28]
        mov     r6, r1, lsl #2
        bl      __extendsfdf2
        mov     r7, r0
        mov     r8, r1
        mov     r2, r4
        mov     r3, r5
        bl      __gtdf2
        cmp     r0, #0
        ldrgt   r0, [sp, #0x140]
        bgt     LCFL49
        mov     r1, r8
        mov     r0, r7
        bl      exp
        bl      __truncdfsf2
LCFL49:
        ldr     r1, [sp, #8]
        str     r0, [r1, +r6]
        mov     r0, #0
        add     sp, sp, #0x55, 30
        ldmia   sp!, {r4 - r11, pc}
LCFL50:
        str     r9, [sp, #0x3C]
        ldr     r9, [sp]
        str     r2, [sp, #0x4C]
        str     lr, [sp, #0x48]
        add     r0, r9, r7
        str     r4, [sp, #0x44]
        str     r5, [sp, #0x40]
        str     r6, [sp, #0x14]
        str     r0, [sp, #0x58]
        b       LCFL44
LCFL51:
        str     r1, [sp, #0x30]
        ldr     r0, [sp, #0x30]
        str     r9, [sp, #0x28]
        ldr     r9, [sp]
        str     r7, [sp, #0x3C]
        ldr     r7, [sp, #0x34]
        add     r0, r9, r0
        str     r3, [sp, #0x4C]
        str     r4, [sp, #0x48]
        str     r5, [sp, #0x44]
        str     r6, [sp, #0x40]
        str     r8, [sp, #0x1C]
        str     r0, [sp, #0x54]
        b       LCFL39
LCFL52:
        str     r1, [sp, #0x2C]
        ldr     r0, [sp, #0x2C]
        str     r9, [sp, #0x24]
        ldr     r9, [sp]
        str     r7, [sp, #0x3C]
        ldr     r7, [sp, #0x34]
        add     r0, r9, r0
        str     r3, [sp, #0x4C]
        str     r4, [sp, #0x48]
        str     r5, [sp, #0x44]
        str     r6, [sp, #0x40]
        str     r8, [sp, #0x18]
        str     r0, [sp, #0x50]
        b       LCFL34
LCFL53:
        str     r1, [sp, #4]
        ldr     r0, [sp, #4]
        str     r9, [sp, #0xC]
        ldr     r9, [sp]
        str     r7, [sp, #0x3C]
        ldr     r7, [sp, #0x34]
        add     r0, r9, r0
        str     r3, [sp, #0x4C]
        str     r4, [sp, #0x48]
        str     r5, [sp, #0x44]
        str     r6, [sp, #0x40]
        str     r8, [sp, #0x10]
        str     r0, [sp, #0x38]
        b       LCFL29
LCFL54:
        ldr     r9, [sp]
        b       LCFL23
LCFL55:
        str     r2, [sp, #0x30]
        str     r8, [sp, #0x28]
        b       LCFL18
LCFL56:
        str     r3, [sp, #0x2C]
        str     r8, [sp, #0x24]
        b       LCFL13
LCFL57:
        str     r5, [sp, #0xC]
        str     r6, [sp, #4]
        b       LCFL8
LCFL58:
        mvn     r0, #7
        add     sp, sp, #0x55, 30
        ldmia   sp!, {r4 - r11, pc}


        .data
        .align  4


LCFL__2il0floatpacket.1:
        .byte   0x00,0x00,0x80,0x3F,0x00,0x00,0x00,0x00
LCFL_c1.3619.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LCFL_c2.3619.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LCFL_c3.3619.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LCFL_c4.3619.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LCFL_coef.3619.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x30,0x43


