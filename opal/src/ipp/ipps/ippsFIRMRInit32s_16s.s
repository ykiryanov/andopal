        .text
        .align  4
        .globl  _ippsFIRMRInit32s_16s


LBTZ_ownsMRSetDlyLine32s_16s:
        mov     r2, r1
        ldr     r1, [r2, #0x48]
        ldr     r3, [r2, #4]
        cmp     r0, #0
        moveq   r0, r3
        beq     _ippsZero_16s
        mov     r2, r1
        mov     r1, r3
        b       _ippsFlip_16u
LBTZ_ownsMRSetTaps32s_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x4C
        mov     r8, r2
        ldr     r3, [r8, #0x14]
        ldr     r11, [r8, #8]
        ldr     r2, [r8]
        ldr     r4, [r8, #0xC]
        str     r3, [sp, #0xC]
        ldr     r3, [r8, #0x10]
        mov     r5, r1
        str     r3, [sp, #0x18]
        ldr     r3, [r8, #0x24]
        ldr     r10, [r8, #0x18]
        mov     r1, r2
        str     r3, [sp, #0x14]
        ldr     r3, [r8, #0x34]
        mov     r2, r11
        str     r3, [sp, #0x28]
        ldr     r6, [r8, #0x4C]
        ldr     r7, [r8, #0x30]
        str     r5, [r8, #0x60]
        bl      ownsCvt32sTo16s
        add     r5, r0, r5
        add     r0, r11, r4
        sub     r0, r0, #1
        str     r5, [r8, #0x28]
        mov     r1, r4
        bl      __intel_idiv
        mul     r3, r4, r0
        str     r0, [sp, #8]
        mov     r1, r6
        mov     r5, r4, lsl #2
        str     r3, [sp, #0x24]
        add     r3, r0, #1
        bic     r3, r3, #1
        mul     r9, r4, r3
        sub     r3, r3, r0
        str     r3, [sp, #0x10]
        ldr     r3, [sp, #0x14]
        mvn     r0, #0
        cmp     r9, r3
        movgt   r3, r9
        str     r3, [sp, #0x38]
        mov     r3, #0
        str     r3, [sp, #0x1C]
        ldr     r3, [sp, #0x38]
        mov     r2, r3, lsl #3
        bl      _ippsSet_32s
        ldr     r3, [sp, #0x38]
        mov     r2, r5
        mov     r1, r7
        add     r3, r6, r3, lsl #4
        str     r3, [sp, #0x20]
        mvn     r0, #0
        bl      _ippsSet_32s
        str     r8, [sp, #0x48]
        ldr     r12, [sp, #0x20]
        ldr     r8, [sp, #0x1C]
        ldr     r1, [sp, #0x14]
        ldr     r2, [sp, #0x18]
LBTZ0:
        cmp     r11, #0
        ble     LBTZ35
        cmp     r11, #6
        add     r0, r1, r2
        blt     LBTZ34
        mul     r0, r8, r0
        mov     r3, #0
        sub     lr, r11, #6
        str     r4, [sp, #4]
        add     r0, r12, r0, lsl #2
        str     r11, [sp]
LBTZ1:
        str     r3, [r0, +r3, lsl #2]
        add     r4, r3, #1
        str     r4, [r0, +r4, lsl #2]
        add     r4, r3, #2
        str     r4, [r0, +r4, lsl #2]
        add     r11, r3, #3
        add     r4, r3, #4
        str     r11, [r0, +r11, lsl #2]
        add     r3, r3, #5
        cmp     r3, lr
        str     r4, [r0, +r4, lsl #2]
        ble     LBTZ1
        ldr     r4, [sp, #4]
        ldr     r11, [sp]
LBTZ2:
        str     r3, [r0, +r3, lsl #2]
        add     r3, r3, #1
        cmp     r3, r11
        blt     LBTZ2
        add     r8, r8, #1
        cmp     r8, #4
        blt     LBTZ0
        ldr     r8, [sp, #0x48]
        str     r12, [sp, #0x20]
LBTZ3:
        sub     r0, r11, #1
        mov     r1, r4
        bl      __intel_imod
        ldr     r3, [sp, #0xC]
        add     r3, r0, r3
        cmp     r3, r4
        movlt   lr, #1
        subge   r3, r3, r4
        movge   lr, #0
        cmp     r4, #0
        movle   r12, #0
        ble     LBTZ12
        mov     r0, r10
        cmp     r3, r0
        bge     LBTZ33
        mov     r12, #0
        mov     r1, r12
        mov     r11, r1
LBTZ4:
        add     r3, r4, r3
        cmp     r3, r0
        add     lr, lr, #1
        blt     LBTZ4
LBTZ5:
        str     r6, [sp, #0x2C]
        str     r7, [sp, #0x30]
        ldr     r6, [sp, #8]
        ldr     r7, [sp, #0x18]
        str     r5, [sp, #0x3C]
        str     r9, [sp, #0x40]
        str     r8, [sp, #0x48]
LBTZ6:
        cmp     r1, #0
        moveq   r12, lr
        mul     r2, r6, r1
        str     r10, [sp, #0x44]
        str     r4, [sp, #4]
        ldr     r4, [sp, #0x20]
        ldr     r10, [sp, #0x24]
        ldr     r6, [sp, #0x2C]
        ldr     r7, [sp, #0x14]
        mov     r5, #0
        sub     r0, r3, r0
        mov     r9, r5
        mov     r8, r11
        str     r12, [sp]
        str     r1, [sp, #0x34]
        str     r3, [sp, #0x38]
LBTZ7:
        mla     r12, r10, r9, r2
        cmp     r0, r7
        mov     r3, r0
        bge     LBTZ10
        mov     r1, lr
        str     lr, [sp, #0x1C]
        ldr     lr, [sp, #0x30]
        ldr     r10, [sp, #4]
        str     r11, [sp, #0xC]
LBTZ8:
        add     r11, r3, r5
        ldr     r11, [r4, +r11, lsl #2]
        cmn     r11, #1
        ble     LBTZ9
        str     r11, [r6, +r12, lsl #2]
        ldr     r11, [lr, +r8, lsl #2]
        cmn     r11, #1
        streq   r1, [lr, +r8, lsl #2]
        add     r12, r12, #1
LBTZ9:
        add     r3, r10, r3
        cmp     r3, r7
        add     r1, r1, #1
        blt     LBTZ8
        ldr     r11, [sp, #0xC]
        ldr     lr, [sp, #0x1C]
        ldr     r10, [sp, #0x24]
LBTZ10:
        add     r9, r9, #1
        cmp     r9, #4
        add     r5, r5, r7
        add     r8, r8, #1
        add     r11, r11, #1
        blt     LBTZ7
        ldr     r1, [sp, #0x34]
        ldr     r4, [sp, #4]
        ldr     r12, [sp]
        ldr     r3, [sp, #0x38]
        ldr     r6, [sp, #8]
        ldr     r10, [sp, #0x44]
        ldr     r7, [sp, #0x18]
        add     r1, r1, #1
        cmp     r1, r4
        bge     LBTZ11
        mov     r0, r1, lsl #2
        mla     r0, r7, r0, r10
        cmp     r3, r0
        bge     LBTZ6
        ldr     r5, [sp, #0x3C]
        ldr     r9, [sp, #0x40]
        ldr     r6, [sp, #0x2C]
        ldr     r7, [sp, #0x30]
        ldr     r8, [sp, #0x48]
        b       LBTZ4
LBTZ11:
        ldr     r5, [sp, #0x3C]
        ldr     r9, [sp, #0x40]
        ldr     r6, [sp, #0x2C]
        ldr     r7, [sp, #0x30]
        ldr     r8, [sp, #0x48]
LBTZ12:
        ldr     r0, [sp, #0x18]
        mla     r10, r0, r5, r10
        cmp     r3, r10
        bge     LBTZ14
LBTZ13:
        add     r3, r4, r3
        cmp     r3, r10
        add     lr, lr, #1
        blt     LBTZ13
LBTZ14:
        ldr     r0, [r7]
        cmp     r0, #0
        strlt   r12, [r7]
        movlt   r0, r12
        sub     lr, lr, r0
        cmp     r5, #0
        str     lr, [r7, +r4, lsl #4]
        mov     r0, #0
        ble     LBTZ17
        mov     r12, r0
        mov     r3, r7
LBTZ15:
        ldr     lr, [r3]
        cmp     lr, #0
        blt     LBTZ32
LBTZ16:
        add     r12, r12, #1
        cmp     r12, r5
        add     r3, r3, #4
        blt     LBTZ15
LBTZ17:
        cmp     r4, #0
        ble     LBTZ28
        mov     r3, r0
        ldr     r12, [sp, #0x10]
        ldr     lr, [sp, #8]
        mvn     r5, #0
        str     r5, [sp, #0x38]
        ldr     r2, [sp, #0x20]
        ldr     r5, [sp, #0x10]
        ldr     r10, [sp, #0x24]
        ldr     r11, [sp, #8]
        sub     r12, r12, #6
        sub     lr, lr, #5
        str     lr, [sp, #0x3C]
        str     r12, [sp, #0x44]
        str     r9, [sp, #0x40]
        str     r8, [sp, #0x48]
LBTZ18:
        mov     lr, #0
        mov     r12, #4
        str     r4, [sp, #4]
LBTZ19:
        cmp     r11, #0
        ble     LBTZ23
        cmp     r11, #5
        movlt   r9, #0
        addlt   r8, r6, lr, lsl #2
        blt     LBTZ21
        mov     r4, r3, lsl #2
        add     r8, r6, lr, lsl #2
        str     r6, [sp, #0x2C]
        ldr     r6, [sp, #0x3C]
        add     r4, r4, #4
        mov     r9, #0
        add     r4, r4, r2
        mov     r7, r0
LBTZ20:
        ldr     r1, [r8, +r7, lsl #2]
        mov     r11, r7, lsl #2
        add     r10, r11, #4
        str     r1, [r4, #-4]
        ldr     r1, [r8, +r10]
        add     r10, r11, #8
        add     r11, r11, #0xC
        str     r1, [r4]
        ldr     r10, [r8, +r10]
        add     r7, r7, #4
        add     r9, r9, #4
        str     r10, [r4, #4]
        ldr     r11, [r8, +r11]
        cmp     r9, r6
        add     r3, r3, #4
        str     r11, [r4, #8]
        add     r4, r4, #0x10
        ble     LBTZ20
        ldr     r10, [sp, #0x24]
        ldr     r11, [sp, #8]
        ldr     r6, [sp, #0x2C]
LBTZ21:
        add     r7, r2, r3, lsl #2
        add     r1, r9, r0
LBTZ22:
        ldr     r4, [r8, +r1, lsl #2]
        add     r9, r9, #1
        cmp     r9, r11
        str     r4, [r7], #4
        add     r1, r1, #1
        add     r3, r3, #1
        blt     LBTZ22
LBTZ23:
        cmp     r5, #0
        ble     LBTZ27
        cmp     r5, #6
        movlt   r4, #0
        blt     LBTZ25
        ldr     r9, [sp, #0x38]
        ldr     r8, [sp, #0x44]
        mov     r4, r3, lsl #2
        add     r7, r4, #4
        mov     r4, #0
        add     r7, r7, r2
LBTZ24:
        add     r4, r4, #5
        str     r9, [r7, #-4]
        str     r9, [r7]
        str     r9, [r7, #4]
        str     r9, [r7, #8]
        str     r9, [r7, #0xC]
        cmp     r4, r8
        add     r7, r7, #0x14
        add     r3, r3, #5
        ble     LBTZ24
LBTZ25:
        ldr     r8, [sp, #0x38]
        add     r7, r2, r3, lsl #2
LBTZ26:
        add     r4, r4, #1
        str     r8, [r7], #4
        cmp     r4, r5
        add     r3, r3, #1
        blt     LBTZ26
LBTZ27:
        subs    r12, r12, #1
        add     lr, lr, r10
        bne     LBTZ19
        ldr     r4, [sp, #4]
        add     r0, r0, r11
        subs    r4, r4, #1
        bne     LBTZ18
        ldr     r9, [sp, #0x40]
        ldr     r8, [sp, #0x48]
        str     r2, [sp, #0x20]
LBTZ28:
        mov     r9, r9, lsl #2
        cmp     r9, #0
        ble     LBTZ31
        ldr     r0, [sp, #0x20]
        ldr     r1, [sp, #0x28]
LBTZ29:
        ldr     r12, [r0], #4
        cmn     r12, #1
        movle   r12, #0
        ble     LBTZ30
        ldr     r3, [r8]
        mov     r12, r12, lsl #1
        ldrsh   r12, [r3, +r12]
LBTZ30:
        strh    r12, [r1], #2
        subs    r9, r9, #1
        bne     LBTZ29
LBTZ31:
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
LBTZ32:
        sub     lr, r7, #4
        ldr     lr, [lr, +r12, lsl #2]
        str     lr, [r3]
        b       LBTZ16
LBTZ33:
        mov     r12, #0
        mov     r1, r12
        mov     r11, r1
        b       LBTZ5
LBTZ34:
        mul     r0, r8, r0
        mov     r3, #0
        add     r0, r12, r0, lsl #2
        b       LBTZ2
LBTZ35:
        add     r8, r8, #1
        cmp     r8, #4
        blt     LBTZ0
        ldr     r8, [sp, #0x48]
        str     r12, [sp, #0x20]
        b       LBTZ3
_ippsFIRMRInit32s_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x48
        ldr     r12, [sp, #0x7C]
        ldr     r4, [sp, #0x6C]
        ldr     r11, [sp, #0x70]
        ldr     r8, [sp, #0x74]
        ldr     r10, [sp, #0x78]
        ldr     r9, [sp, #0x80]
        mov     r7, r0
        cmp     r7, #0
        str     r12, [sp, #0x1C]
        mov     r6, r1
        mov     r5, r2
        str     r3, [sp, #0x14]
        beq     LBTZ47
        cmp     r6, #0
        beq     LBTZ47
        cmp     r9, #0
        beq     LBTZ47
        cmp     r5, #0
        ble     LBTZ46
        cmp     r4, #1
        blt     LBTZ44
        cmp     r11, #0
        blt     LBTZ43
        cmp     r4, r11
        ble     LBTZ43
        cmp     r8, #1
        blt     LBTZ44
        cmp     r10, #0
        blt     LBTZ43
        cmp     r8, r10
        ble     LBTZ43
        cmp     r4, #1
        beq     LBTZ45
LBTZ36:
        add     r3, r5, r4
        sub     r0, r3, #1
        mov     r1, r4
        bl      __intel_idiv
        mov     r1, r0
        str     r1, [sp, #0x18]
        add     r3, r8, r8, lsl #1
        add     r0, r5, r3
        add     r1, r1, #1
        bic     r3, r1, #1
        str     r3, [sp, #0x34]
        mul     r3, r4, r3
        str     r0, [sp, #0x20]
        mov     r1, r4
        str     r3, [sp, #0x24]
        bl      __intel_imod
        cmp     r0, #0
        ble     LBTZ38
        str     r7, [sp, #8]
        ldr     r7, [sp, #0x20]
LBTZ37:
        add     r7, r7, #1
        mov     r0, r7
        mov     r1, r4
        bl      __intel_imod
        cmp     r0, #0
        bgt     LBTZ37
        str     r7, [sp, #0x20]
        ldr     r7, [sp, #8]
LBTZ38:
        ldr     r12, [sp, #0x24]
        ldr     r3, [sp, #0x20]
        cmp     r12, r3
        ldrle   r3, [sp, #0x20]
        strle   r3, [sp, #0x24]
        ldr     r3, [sp, #0x18]
        cmp     r3, #0
        movlt   r3, #0
        strlt   r3, [sp, #0x2C]
        blt     LBTZ40
        mov     r3, #0
        str     r3, [sp, #0x2C]
        ldr     r3, [sp, #0x2C]
        ldr     r12, [sp, #0x18]
LBTZ39:
        add     r3, r3, r8, lsl #2
        cmp     r12, r3
        bge     LBTZ39
        str     r3, [sp, #0x2C]
LBTZ40:
        ldr     r3, [sp, #0x18]
        mov     r1, r8
        add     r3, r3, r8
        sub     r0, r3, #1
        bl      __intel_idiv
        mul     r0, r4, r0
        ldr     r3, [sp, #0x2C]
        mov     r1, r4, lsl #2
        str     r1, [sp, #0x28]
        str     r0, [sp, #0x30]
        add     r3, r3, #1
        str     r3, [sp, #0x2C]
        bl      __intel_imod
        cmp     r0, #0
        ble     LBTZ42
        str     r5, [sp, #0x10]
        str     r6, [sp, #0xC]
        str     r7, [sp, #8]
        ldr     r6, [sp, #0x28]
        ldr     r5, [sp, #0x30]
        ldr     r7, [sp, #0x2C]
LBTZ41:
        add     r5, r4, r5
        mov     r0, r5
        mov     r1, r6
        bl      __intel_imod
        cmp     r0, #0
        add     r7, r7, r8
        bgt     LBTZ41
        str     r5, [sp, #0x30]
        str     r7, [sp, #0x2C]
        ldr     r5, [sp, #0x10]
        ldr     r6, [sp, #0xC]
        ldr     r7, [sp, #8]
LBTZ42:
        ldr     r3, [sp, #0x28]
        add     r9, r9, #0xF
        add     r12, r3, #1
        mov     r3, r5, lsl #1
        add     r3, r3, #0xF
        mov     r12, r12, lsl #2
        str     r12, [sp, #0x28]
        ldr     lr, [sp, #0x28]
        bic     r3, r3, #0xF
        str     r3, [sp, #0x38]
        ldr     r3, [sp, #0x24]
        add     lr, lr, #0xF
        bic     lr, lr, #0xF
        mov     r12, r3, lsl #3
        add     r12, r12, #0xF
        bic     r12, r12, #0xF
        str     r12, [sp, #0x3C]
        mov     r12, r5, lsl #2
        add     r12, r12, #0xF
        bic     r12, r12, #0xF
        str     r12, [sp, #0x40]
        bic     r12, r9, #0xF
        add     r9, r12, #0x70
        str     r9, [sp, #0x28]
        str     r12, [r7]
        ldr     r9, [sp, #0x28]
        add     lr, lr, r9
        str     lr, [r12]
        ldr     r12, [sp, #0x38]
        ldr     r2, [sp, #0x3C]
        ldr     r9, [r7]
        add     r1, lr, r12
        ldr     lr, [sp, #0x2C]
        ldr     r12, [sp, #0x18]
        str     r1, [sp, #0x38]
        add     r2, r1, r2
        str     r2, [sp, #0x3C]
        str     r2, [r9, #4]
        ldr     r9, [r7]
        add     r0, r12, lr
        add     r1, r0, #1
        ldr     r0, [sp, #0x3C]
        str     r9, [sp, #0x44]
        mov     r9, r1, lsl #1
        add     r9, r9, #0xF
        bic     r9, r9, #0xF
        add     r9, r0, r9
        ldr     r0, [sp, #0x44]
        str     r9, [r0, #0x54]
        ldr     r0, [r7]
        ldr     r2, [sp, #0x40]
        add     r2, r9, r2
        add     r3, r2, r3, lsl #4
        str     r3, [r0, #0x4C]
        ldr     r3, [r7]
        str     r5, [r3, #8]
        ldr     r9, [sp, #0x20]
        ldr     r3, [r7]
        str     r9, [r3, #0x24]
        ldr     r3, [r7]
        ldr     r9, [sp, #0x38]
        str     r9, [r3, #0x34]
        ldr     r9, [sp, #0x34]
        ldr     r3, [r7]
        str     r9, [r3, #0x5C]
        ldr     r9, [sp, #0x28]
        ldr     r3, [r7]
        str     r9, [r3, #0x30]
        ldr     r3, [r7]
        str     r12, [r3, #0x48]
        ldr     r3, [r7]
        ldr     r12, [pc, #0x10C]
        str     r12, [r3, #0x58]
        ldr     r3, [r7]
        str     r4, [r3, #0xC]
        ldr     r3, [r7]
        str     lr, [r3, #0x1C]
        ldr     r3, [r7]
        str     r8, [r3, #0x10]
        ldr     r3, [r7]
        ldr     r12, [sp, #0x30]
        str     r12, [r3, #0x20]
        ldr     r3, [r7]
        mov     r12, #0
        str     r12, [r3, #0x50]
        ldr     r3, [r7]
        str     r11, [r3, #0x14]
        ldr     r3, [r7]
        str     r10, [r3, #0x18]
        ldr     r3, [r7]
        ldr     r0, [r3, #4]
        bl      _ippsZero_16s
        ldr     r3, [r7]
        cmp     r4, #1
        moveq   r12, #2
        movne   r12, #3
        str     r12, [r3, #0x44]
        ldr     r1, [sp, #0x14]
        ldr     r2, [r7]
        mov     r0, r6
        bl      LBTZ_ownsMRSetTaps32s_16s
        ldr     r0, [sp, #0x1C]
        ldr     r1, [r7]
        bl      LBTZ_ownsMRSetDlyLine32s_16s
        ldr     r3, [r7]
        mov     r1, r5
        ldr     r0, [r3]
        bl      ownsTestTaps
        ldr     r7, [r7]
        cmp     r0, #0
        ldreq   r0, [pc, #0x74]
        ldrne   r0, [pc, #0x74]
        str     r0, [r7, #0x6C]
        mov     r0, #0
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LBTZ43:
        mvn     r0, #0x1B
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LBTZ44:
        mvn     r0, #0x1C
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LBTZ45:
        cmp     r8, #1
        bne     LBTZ36
        str     r9, [sp, #4]
        ldr     r3, [sp, #0x1C]
        mov     r0, r7
        mov     r2, r5
        str     r3, [sp]
        ldr     r3, [sp, #0x14]
        mov     r1, r6
        bl      _ippsFIRInit32s_16s
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LBTZ46:
        mvn     r0, #0x19
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LBTZ47:
        mvn     r0, #7
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
        .long   0x46493131
        .long   ownsMR_16s_Sfs
        .long   ownsMR64s_16s_Sfs


