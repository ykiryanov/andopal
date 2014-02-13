        .text
        .align  4
        .globl  _ippsFIRMRInit32sc_16sc


LBTX_ownsMRSetDlyLine32sc_16sc:
        stmdb   sp!, {r4 - r10, lr}
        ldr     r2, [r1, #4]
        ldr     r1, [r1, #0x48]
        cmp     r0, #0
        beq     LBTX4
        cmp     r1, #0
        ble     LBTX3
        cmp     r1, #5
        mov     r7, #0
        sub     r3, r1, #1
        addlt   r3, r0, r3, lsl #2
        blt     LBTX1
        add     r3, r0, r3, lsl #2
        mvn     r6, #0
        mvn     r5, #1
        mvn     r4, #2
        sub     lr, r1, #5
        sub     r12, r2, #2
LBTX0:
        rsb     r9, r7, #0
        rsb     r8, r7, r6
        mov     r10, r9, lsl #2
        ldrsh   r9, [r3, +r10]
        add     r10, r3, r10
        mov     r8, r8, lsl #2
        strh    r9, [r12, #2]
        ldrsh   r10, [r10, #2]
        strh    r10, [r12, #4]
        ldrsh   r9, [r3, +r8]
        add     r8, r3, r8
        strh    r9, [r12, #6]
        ldrsh   r8, [r8, #2]
        rsb     r9, r7, r5
        mov     r10, r9, lsl #2
        strh    r8, [r12, #8]
        ldrsh   r9, [r3, +r10]
        add     r10, r3, r10
        rsb     r8, r7, r4
        strh    r9, [r12, #0xA]
        ldrsh   r10, [r10, #2]
        mov     r8, r8, lsl #2
        add     r7, r7, #4
        strh    r10, [r12, #0xC]
        ldrsh   r9, [r3, +r8]
        add     r8, r3, r8
        cmp     r7, lr
        strh    r9, [r12, #0xE]
        ldrsh   r8, [r8, #2]
        strh    r8, [r12, #0x10]!
        ble     LBTX0
LBTX1:
        mov     r12, r7, lsl #2
        sub     r12, r12, #2
        add     r2, r12, r2
LBTX2:
        rsb     r0, r7, #0
        add     r7, r7, #1
        mov     r12, r0, lsl #2
        ldrsh   r0, [r3, +r12]
        add     r12, r3, r12
        cmp     r7, r1
        strh    r0, [r2, #2]
        ldrsh   r12, [r12, #2]
        strh    r12, [r2, #4]!
        blt     LBTX2
LBTX3:
        ldmia   sp!, {r4 - r10, pc}
LBTX4:
        mov     r0, r2
        ldmia   sp!, {r4 - r10, lr}
        b       _ippsZero_16sc
LBTX_ownsMRSetTaps32sc_16sc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x44
        mov     r7, r2
        ldr     r2, [r7]
        ldr     r6, [r7, #0xC]
        ldr     r11, [r7, #8]
        ldr     r3, [r7, #0x14]
        str     r3, [sp, #0x24]
        ldr     r3, [r7, #0x10]
        mov     r4, r6, lsl #2
        str     r3, [sp, #8]
        ldr     r9, [r7, #0x48]
        ldr     r10, [r7, #0x18]
        str     r1, [sp, #0x3C]
        ldr     r3, [r7, #0x34]
        ldr     r8, [r7, #0x24]
        str     r1, [r7, #0x60]
        mov     r1, r2
        str     r3, [sp, #0x40]
        ldr     r3, [r7, #0x4C]
        ldr     r5, [r7, #0x30]
        mov     r2, r11
        str     r3, [sp, #0x38]
        mul     r3, r6, r9
        str     r3, [sp, #0x28]
        bl      ownsCvt32scTo16sc
        ldr     r3, [sp, #0x3C]
        mov     r2, r4
        mov     r1, r5
        add     r3, r0, r3
        str     r3, [r7, #0x28]
        mvn     r0, #0
        bl      _ippsSet_32s
        ldr     r1, [sp, #0x38]
        mov     r2, r8, lsl #3
        add     r3, r1, r8, lsl #4
        str     r3, [sp, #0x3C]
        mvn     r0, #0
        bl      _ippsSet_32s
        ldr     r12, [sp, #0x3C]
        ldr     r2, [sp, #8]
        mov     r1, #0
LBTX5:
        cmp     r11, #0
        ble     LBTX38
        cmp     r11, #6
        add     r0, r8, r2
        blt     LBTX37
        mul     r0, r1, r0
        mov     r3, #0
        sub     lr, r11, #6
        str     r11, [sp, #4]
        add     r0, r12, r0, lsl #2
        str     r7, [sp]
LBTX6:
        str     r3, [r0, +r3, lsl #2]
        add     r7, r3, #1
        str     r7, [r0, +r7, lsl #2]
        add     r7, r3, #2
        str     r7, [r0, +r7, lsl #2]
        add     r11, r3, #3
        add     r7, r3, #4
        str     r11, [r0, +r11, lsl #2]
        add     r3, r3, #5
        cmp     r3, lr
        str     r7, [r0, +r7, lsl #2]
        ble     LBTX6
        ldr     r11, [sp, #4]
        ldr     r7, [sp]
LBTX7:
        str     r3, [r0, +r3, lsl #2]
        add     r3, r3, #1
        cmp     r3, r11
        blt     LBTX7
        add     r1, r1, #1
        cmp     r1, #4
        blt     LBTX5
        str     r12, [sp, #0x3C]
LBTX8:
        sub     r0, r11, #1
        mov     r1, r6
        bl      __intel_imod
        ldr     r3, [sp, #0x24]
        add     r3, r0, r3
        cmp     r3, r6
        movlt   lr, #1
        subge   r3, r3, r6
        movge   lr, #0
        cmp     r6, #0
        movle   r12, #0
        ble     LBTX17
        mov     r0, r10
        cmp     r3, r0
        bge     LBTX36
        mov     r12, #0
        mov     r1, r12
        mov     r11, r1
LBTX9:
        add     r3, r6, r3
        cmp     r3, r0
        add     lr, lr, #1
        blt     LBTX9
LBTX10:
        str     r5, [sp, #0x2C]
        ldr     r5, [sp, #8]
        str     r4, [sp, #0x14]
        str     r8, [sp, #0x34]
        str     r7, [sp]
LBTX11:
        cmp     r1, #0
        moveq   r12, lr
        mul     r2, r9, r1
        str     r9, [sp, #0x10]
        str     r10, [sp, #0xC]
        str     r6, [sp, #0x30]
        ldr     r5, [sp, #0x3C]
        ldr     r10, [sp, #0x28]
        ldr     r6, [sp, #0x38]
        ldr     r9, [sp, #0x34]
        mov     r4, #0
        sub     r0, r3, r0
        mov     r8, r4
        mov     r7, r11
        str     r12, [sp, #0x1C]
        str     r1, [sp, #0x18]
        str     r3, [sp, #4]
LBTX12:
        mla     r12, r10, r8, r2
        cmp     r0, r9
        mov     r3, r0
        bge     LBTX15
        mov     r1, lr
        str     lr, [sp, #0x24]
        ldr     lr, [sp, #0x2C]
        ldr     r10, [sp, #0x30]
        str     r11, [sp, #0x20]
LBTX13:
        add     r11, r3, r4
        ldr     r11, [r5, +r11, lsl #2]
        cmn     r11, #1
        ble     LBTX14
        str     r11, [r6, +r12, lsl #2]
        ldr     r11, [lr, +r7, lsl #2]
        cmn     r11, #1
        streq   r1, [lr, +r7, lsl #2]
        add     r12, r12, #1
LBTX14:
        add     r3, r10, r3
        cmp     r3, r9
        add     r1, r1, #1
        blt     LBTX13
        ldr     r11, [sp, #0x20]
        ldr     lr, [sp, #0x24]
        ldr     r10, [sp, #0x28]
LBTX15:
        add     r8, r8, #1
        cmp     r8, #4
        add     r4, r4, r9
        add     r7, r7, #1
        add     r11, r11, #1
        blt     LBTX12
        ldr     r1, [sp, #0x18]
        ldr     r6, [sp, #0x30]
        ldr     r12, [sp, #0x1C]
        ldr     r3, [sp, #4]
        ldr     r9, [sp, #0x10]
        ldr     r10, [sp, #0xC]
        ldr     r5, [sp, #8]
        add     r1, r1, #1
        cmp     r1, r6
        bge     LBTX16
        mov     r0, r1, lsl #2
        mla     r0, r5, r0, r10
        cmp     r3, r0
        bge     LBTX11
        ldr     r4, [sp, #0x14]
        ldr     r5, [sp, #0x2C]
        ldr     r8, [sp, #0x34]
        ldr     r7, [sp]
        b       LBTX9
LBTX16:
        ldr     r4, [sp, #0x14]
        ldr     r5, [sp, #0x2C]
        ldr     r7, [sp]
LBTX17:
        ldr     r0, [sp, #8]
        mla     r10, r0, r4, r10
        cmp     r3, r10
        bge     LBTX19
LBTX18:
        add     r3, r6, r3
        cmp     r3, r10
        add     lr, lr, #1
        blt     LBTX18
LBTX19:
        ldr     r0, [r5]
        cmp     r0, #0
        strlt   r12, [r5]
        movlt   r0, r12
        sub     lr, lr, r0
        cmp     r4, #0
        str     lr, [r5, +r6, lsl #4]
        ble     LBTX22
        mov     r3, #0
        mov     r0, r5
LBTX20:
        ldr     r12, [r0]
        cmp     r12, #0
        blt     LBTX35
LBTX21:
        add     r3, r3, #1
        cmp     r3, r4
        add     r0, r0, #4
        blt     LBTX20
LBTX22:
        cmp     r6, #0
        ble     LBTX29
        mov     lr, #0
        mov     r12, lr
        sub     r3, r9, #5
LBTX23:
        ldr     r8, [sp, #0x3C]
        ldr     r11, [sp, #0x28]
        ldr     r1, [sp, #0x38]
        mov     r0, #0
        str     r7, [sp]
LBTX24:
        cmp     r9, #0
        ble     LBTX34
        cmp     r9, #5
        blt     LBTX33
        mul     r4, r0, r11
        mul     r10, r9, r12
        mov     r2, lr, lsl #2
        add     r2, r2, #4
        mov     r5, #0
        add     r4, r1, r4, lsl #2
        add     r2, r2, r8
        mov     r7, r10
        str     r9, [sp, #0x10]
        str     r6, [sp, #0x30]
LBTX25:
        ldr     r6, [r4, +r7, lsl #2]
        mov     r9, r7, lsl #2
        add     r1, r9, #4
        str     r6, [r2, #-4]
        ldr     r1, [r4, +r1]
        add     r6, r9, #8
        add     r9, r9, #0xC
        str     r1, [r2]
        ldr     r6, [r4, +r6]
        add     r7, r7, #4
        add     r5, r5, #4
        str     r6, [r2, #4]
        ldr     r9, [r4, +r9]
        cmp     r5, r3
        add     lr, lr, #4
        str     r9, [r2, #8]
        add     r2, r2, #0x10
        ble     LBTX25
        ldr     r1, [sp, #0x38]
        ldr     r9, [sp, #0x10]
        ldr     r6, [sp, #0x30]
LBTX26:
        add     r2, r8, lr, lsl #2
        add     r10, r5, r10
LBTX27:
        ldr     r7, [r4, +r10, lsl #2]
        add     r5, r5, #1
        cmp     r5, r9
        str     r7, [r2], #4
        add     r10, r10, #1
        add     lr, lr, #1
        blt     LBTX27
        add     r0, r0, #1
        cmp     r0, #4
        blt     LBTX24
        ldr     r7, [sp]
        str     r8, [sp, #0x3C]
LBTX28:
        add     r12, r12, #1
        cmp     r12, r6
        blt     LBTX23
LBTX29:
        ldr     r0, [sp, #0x28]
        mov     r0, r0, lsl #2
        cmp     r0, #0
        ble     LBTX32
        ldr     r12, [sp, #0x3C]
        ldr     r3, [sp, #0x40]
        mov     r1, #0
LBTX30:
        ldr     r4, [r12]
        cmn     r4, #1
        strleh  r1, [r3, #2]
        strleh  r1, [r3]
        ble     LBTX31
        ldr     lr, [r7]
        mov     r4, r4, lsl #2
        ldrsh   r4, [lr, +r4]
        strh    r4, [r3]
        ldr     r4, [r12]
        ldr     lr, [r7]
        add     r4, lr, r4, lsl #2
        ldrsh   lr, [r4, #2]
        strh    lr, [r3, #2]
LBTX31:
        subs    r0, r0, #1
        add     r3, r3, #4
        add     r12, r12, #4
        bne     LBTX30
LBTX32:
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LBTX33:
        mul     r2, r0, r11
        mul     r10, r9, r12
        mov     r5, #0
        add     r4, r1, r2, lsl #2
        b       LBTX26
LBTX34:
        add     r0, r0, #1
        cmp     r0, #4
        blt     LBTX24
        ldr     r7, [sp]
        str     r8, [sp, #0x3C]
        b       LBTX28
LBTX35:
        sub     r12, r5, #4
        ldr     r12, [r12, +r3, lsl #2]
        str     r12, [r0]
        b       LBTX21
LBTX36:
        mov     r12, #0
        mov     r1, r12
        mov     r11, r1
        b       LBTX10
LBTX37:
        mul     r0, r1, r0
        mov     r3, #0
        add     r0, r12, r0, lsl #2
        b       LBTX7
LBTX38:
        add     r1, r1, #1
        cmp     r1, #4
        blt     LBTX5
        str     r12, [sp, #0x3C]
        b       LBTX8
_ippsFIRMRInit32sc_16sc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x3C
        ldr     r12, [sp, #0x70]
        ldr     r6, [sp, #0x60]
        ldr     r10, [sp, #0x64]
        ldr     r9, [sp, #0x68]
        ldr     r11, [sp, #0x6C]
        ldr     r8, [sp, #0x74]
        mov     r7, r0
        cmp     r7, #0
        str     r12, [sp, #0x18]
        mov     r4, r1
        mov     r5, r2
        str     r3, [sp, #0x14]
        beq     LBTX50
        cmp     r4, #0
        beq     LBTX50
        cmp     r8, #0
        beq     LBTX50
        cmp     r5, #0
        ble     LBTX49
        cmp     r6, #1
        blt     LBTX47
        cmp     r10, #0
        blt     LBTX46
        cmp     r6, r10
        ble     LBTX46
        cmp     r9, #1
        blt     LBTX47
        cmp     r11, #0
        blt     LBTX46
        cmp     r9, r11
        ble     LBTX46
        cmp     r6, #1
        beq     LBTX48
LBTX39:
        add     r3, r5, r6
        sub     r0, r3, #1
        mov     r1, r6
        bl      __intel_idiv
        str     r0, [sp, #0x1C]
        add     r3, r9, r9, lsl #1
        add     r0, r5, r3
        str     r0, [sp, #0x30]
        mov     r1, r6
        bl      __intel_imod
        cmp     r0, #0
        ble     LBTX41
        str     r7, [sp, #8]
        ldr     r7, [sp, #0x30]
LBTX40:
        add     r7, r7, #1
        mov     r0, r7
        mov     r1, r6
        bl      __intel_imod
        cmp     r0, #0
        bgt     LBTX40
        str     r7, [sp, #0x30]
        ldr     r7, [sp, #8]
LBTX41:
        ldr     r3, [sp, #0x1C]
        cmp     r3, #0
        movlt   r12, #0
        blt     LBTX43
        ldr     r3, [sp, #0x1C]
        mov     r12, #0
LBTX42:
        add     r12, r12, r9, lsl #2
        cmp     r3, r12
        bge     LBTX42
LBTX43:
        ldr     r3, [sp, #0x1C]
        add     r12, r12, #1
        str     r12, [sp, #0x24]
        add     r3, r9, r3
        sub     r0, r3, #1
        mov     r1, r9
        bl      __intel_idiv
        mul     r0, r6, r0
        mov     r1, r6, lsl #2
        str     r1, [sp, #0x20]
        str     r0, [sp, #0x38]
        bl      __intel_imod
        cmp     r0, #0
        ble     LBTX45
        str     r5, [sp, #0x10]
        str     r4, [sp, #0xC]
        str     r7, [sp, #8]
        ldr     r5, [sp, #0x20]
        ldr     r4, [sp, #0x38]
        ldr     r7, [sp, #0x24]
LBTX44:
        add     r4, r6, r4
        mov     r0, r4
        mov     r1, r5
        bl      __intel_imod
        cmp     r0, #0
        add     r7, r7, r9
        bgt     LBTX44
        str     r4, [sp, #0x38]
        str     r7, [sp, #0x24]
        ldr     r5, [sp, #0x10]
        ldr     r4, [sp, #0xC]
        ldr     r7, [sp, #8]
LBTX45:
        ldr     r12, [sp, #0x24]
        ldr     r3, [sp, #0x1C]
        add     r8, r8, #0xF
        bic     lr, r8, #0xF
        str     lr, [r7]
        add     r12, r12, r3
        add     r12, r12, #1
        ldr     r2, [sp, #0x30]
        mov     r12, r12, lsl #2
        add     r12, r12, #0xF
        bic     r8, r12, #0xF
        ldr     r12, [sp, #0x20]
        mov     r3, r5, lsl #2
        add     r3, r3, #0xF
        add     r12, r12, #1
        add     r1, lr, #0x70
        bic     r3, r3, #0xF
        mov     r12, r12, lsl #2
        str     r12, [sp, #0x2C]
        mov     r2, r2, lsl #5
        str     r2, [sp, #0x34]
        add     r0, r3, r1
        str     r0, [sp, #0x20]
        str     r1, [lr]
        ldr     r12, [sp, #0x34]
        mov     r3, r5, lsl #3
        mov     r1, r8
        add     lr, r12, #0xF
        ldr     r12, [sp, #0x2C]
        add     r3, r3, #0xF
        bic     r3, r3, #0xF
        add     r12, r12, #0xF
        bic     lr, lr, #0xF
        bic     r12, r12, #0xF
        str     r3, [sp, #0x34]
        str     lr, [sp, #0x2C]
        str     r12, [sp, #0x28]
        bl      _ippsZero_8u
        ldr     r12, [sp, #0x20]
        ldr     r3, [r7]
        cmp     r6, #1
        add     r8, r12, r8
        str     r12, [r3, #4]
        ldr     lr, [r7]
        ldr     r3, [sp, #0x2C]
        add     r12, r8, r3
        ldr     r3, [sp, #0x28]
        str     r8, [lr, #0x34]
        ldr     r8, [r7]
        ldr     lr, [sp, #0x34]
        add     r3, r12, r3
        str     r12, [r8, #0x30]
        ldr     r12, [r7]
        add     lr, r3, lr
        str     r3, [r12, #0x54]
        ldr     r3, [r7]
        str     lr, [r3, #0x4C]
        ldr     r3, [r7]
        ldr     r12, [sp, #0x30]
        str     r12, [r3, #0x24]
        ldr     r3, [r7]
        str     r5, [r3, #8]
        ldr     r3, [r7]
        ldr     r12, [sp, #0x1C]
        str     r12, [r3, #0x48]
        ldr     r3, [r7]
        ldr     r12, [pc, #0x100]
        str     r12, [r3, #0x58]
        ldr     r3, [r7]
        str     r6, [r3, #0xC]
        ldr     r3, [r7]
        ldr     r12, [sp, #0x24]
        str     r12, [r3, #0x1C]
        ldr     r3, [r7]
        str     r9, [r3, #0x10]
        ldr     r3, [r7]
        ldr     r12, [sp, #0x38]
        str     r12, [r3, #0x20]
        ldr     r3, [r7]
        mov     r12, #0
        str     r12, [r3, #0x50]
        ldr     r3, [r7]
        str     r10, [r3, #0x14]
        ldr     r3, [r7]
        str     r11, [r3, #0x18]
        ldr     r12, [r7]
        moveq   r3, #2
        movne   r3, #3
        str     r3, [r12, #0x44]
        ldr     r1, [sp, #0x14]
        ldr     r2, [r7]
        mov     r0, r4
        bl      LBTX_ownsMRSetTaps32sc_16sc
        ldr     r0, [sp, #0x18]
        ldr     r1, [r7]
        bl      LBTX_ownsMRSetDlyLine32sc_16sc
        ldr     r3, [r7]
        mov     r1, r5
        ldr     r0, [r3]
        bl      ownsTestTapsCplx
        ldr     r7, [r7]
        cmp     r0, #0
        ldreq   r0, [pc, #0x74]
        ldrne   r0, [pc, #0x74]
        str     r0, [r7, #0x6C]
        mov     r0, #0
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LBTX46:
        mvn     r0, #0x1B
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LBTX47:
        mvn     r0, #0x1C
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LBTX48:
        cmp     r9, #1
        bne     LBTX39
        str     r8, [sp, #4]
        ldr     r3, [sp, #0x18]
        mov     r0, r7
        mov     r2, r5
        str     r3, [sp]
        ldr     r3, [sp, #0x14]
        mov     r1, r4
        bl      _ippsFIRInit32sc_16sc
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LBTX49:
        mvn     r0, #0x19
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LBTX50:
        mvn     r0, #7
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
        .long   0x46493132
        .long   ownsMR_16sc_Sfs
        .long   ownsMR64sc_16sc_Sfs


