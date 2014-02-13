        .text
        .align  4
        .globl  _ippsFIRSetTaps32s_16s


_ippsFIRSetTaps32s_16s:
        stmdb   sp!, {lr}
        cmp     r1, #0
        mov     r3, r2
        beq     LBTN1
        cmp     r0, #0
        beq     LBTN1
        ldr     lr, [r1, #0x58]
        ldr     r12, [pc, #0x5FC]
        subs    lr, lr, r12
        beq     LBTN0
        adds    r12, lr, #0xF8
        mvnne   r0, #0x10
        ldrne   pc, [sp], #4
        mov     r2, r1
        mov     r1, r3
        bl      LBTN_ownsSRSetTaps32s_16s
        mov     r0, #0
        ldr     pc, [sp], #4
LBTN0:
        mov     r2, r1
        mov     r1, r3
        bl      LBTN_ownsMRSetTaps32s_16s
        mov     r0, #0
        ldr     pc, [sp], #4
LBTN1:
        mvn     r0, #7
        ldr     pc, [sp], #4
LBTN_ownsMRSetTaps32s_16s:
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
LBTN2:
        cmp     r11, #0
        ble     LBTN37
        cmp     r11, #6
        add     r0, r1, r2
        blt     LBTN36
        mul     r0, r8, r0
        mov     r3, #0
        sub     lr, r11, #6
        str     r4, [sp, #4]
        add     r0, r12, r0, lsl #2
        str     r11, [sp]
LBTN3:
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
        ble     LBTN3
        ldr     r4, [sp, #4]
        ldr     r11, [sp]
LBTN4:
        str     r3, [r0, +r3, lsl #2]
        add     r3, r3, #1
        cmp     r3, r11
        blt     LBTN4
        add     r8, r8, #1
        cmp     r8, #4
        blt     LBTN2
        ldr     r8, [sp, #0x48]
        str     r12, [sp, #0x20]
LBTN5:
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
        ble     LBTN14
        mov     r0, r10
        cmp     r3, r0
        bge     LBTN35
        mov     r12, #0
        mov     r1, r12
        mov     r11, r1
LBTN6:
        add     r3, r4, r3
        cmp     r3, r0
        add     lr, lr, #1
        blt     LBTN6
LBTN7:
        str     r6, [sp, #0x2C]
        str     r7, [sp, #0x30]
        ldr     r6, [sp, #8]
        ldr     r7, [sp, #0x18]
        str     r5, [sp, #0x3C]
        str     r9, [sp, #0x40]
        str     r8, [sp, #0x48]
LBTN8:
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
LBTN9:
        mla     r12, r10, r9, r2
        cmp     r0, r7
        mov     r3, r0
        bge     LBTN12
        mov     r1, lr
        str     lr, [sp, #0x1C]
        ldr     lr, [sp, #0x30]
        ldr     r10, [sp, #4]
        str     r11, [sp, #0xC]
LBTN10:
        add     r11, r3, r5
        ldr     r11, [r4, +r11, lsl #2]
        cmn     r11, #1
        ble     LBTN11
        str     r11, [r6, +r12, lsl #2]
        ldr     r11, [lr, +r8, lsl #2]
        cmn     r11, #1
        streq   r1, [lr, +r8, lsl #2]
        add     r12, r12, #1
LBTN11:
        add     r3, r10, r3
        cmp     r3, r7
        add     r1, r1, #1
        blt     LBTN10
        ldr     r11, [sp, #0xC]
        ldr     lr, [sp, #0x1C]
        ldr     r10, [sp, #0x24]
LBTN12:
        add     r9, r9, #1
        cmp     r9, #4
        add     r5, r5, r7
        add     r8, r8, #1
        add     r11, r11, #1
        blt     LBTN9
        ldr     r1, [sp, #0x34]
        ldr     r4, [sp, #4]
        ldr     r12, [sp]
        ldr     r3, [sp, #0x38]
        ldr     r6, [sp, #8]
        ldr     r10, [sp, #0x44]
        ldr     r7, [sp, #0x18]
        add     r1, r1, #1
        cmp     r1, r4
        bge     LBTN13
        mov     r0, r1, lsl #2
        mla     r0, r7, r0, r10
        cmp     r3, r0
        bge     LBTN8
        ldr     r5, [sp, #0x3C]
        ldr     r9, [sp, #0x40]
        ldr     r6, [sp, #0x2C]
        ldr     r7, [sp, #0x30]
        ldr     r8, [sp, #0x48]
        b       LBTN6
LBTN13:
        ldr     r5, [sp, #0x3C]
        ldr     r9, [sp, #0x40]
        ldr     r6, [sp, #0x2C]
        ldr     r7, [sp, #0x30]
        ldr     r8, [sp, #0x48]
LBTN14:
        ldr     r0, [sp, #0x18]
        mla     r10, r0, r5, r10
        cmp     r3, r10
        bge     LBTN16
LBTN15:
        add     r3, r4, r3
        cmp     r3, r10
        add     lr, lr, #1
        blt     LBTN15
LBTN16:
        ldr     r0, [r7]
        cmp     r0, #0
        strlt   r12, [r7]
        movlt   r0, r12
        sub     lr, lr, r0
        cmp     r5, #0
        str     lr, [r7, +r4, lsl #4]
        mov     r0, #0
        ble     LBTN19
        mov     r12, r0
        mov     r3, r7
LBTN17:
        ldr     lr, [r3]
        cmp     lr, #0
        blt     LBTN34
LBTN18:
        add     r12, r12, #1
        cmp     r12, r5
        add     r3, r3, #4
        blt     LBTN17
LBTN19:
        cmp     r4, #0
        ble     LBTN30
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
LBTN20:
        mov     lr, #0
        mov     r12, #4
        str     r4, [sp, #4]
LBTN21:
        cmp     r11, #0
        ble     LBTN25
        cmp     r11, #5
        movlt   r9, #0
        addlt   r8, r6, lr, lsl #2
        blt     LBTN23
        mov     r4, r3, lsl #2
        add     r8, r6, lr, lsl #2
        str     r6, [sp, #0x2C]
        ldr     r6, [sp, #0x3C]
        add     r4, r4, #4
        mov     r9, #0
        add     r4, r4, r2
        mov     r7, r0
LBTN22:
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
        ble     LBTN22
        ldr     r10, [sp, #0x24]
        ldr     r11, [sp, #8]
        ldr     r6, [sp, #0x2C]
LBTN23:
        add     r7, r2, r3, lsl #2
        add     r1, r9, r0
LBTN24:
        ldr     r4, [r8, +r1, lsl #2]
        add     r9, r9, #1
        cmp     r9, r11
        str     r4, [r7], #4
        add     r1, r1, #1
        add     r3, r3, #1
        blt     LBTN24
LBTN25:
        cmp     r5, #0
        ble     LBTN29
        cmp     r5, #6
        movlt   r4, #0
        blt     LBTN27
        ldr     r9, [sp, #0x38]
        ldr     r8, [sp, #0x44]
        mov     r4, r3, lsl #2
        add     r7, r4, #4
        mov     r4, #0
        add     r7, r7, r2
LBTN26:
        add     r4, r4, #5
        str     r9, [r7, #-4]
        str     r9, [r7]
        str     r9, [r7, #4]
        str     r9, [r7, #8]
        str     r9, [r7, #0xC]
        cmp     r4, r8
        add     r7, r7, #0x14
        add     r3, r3, #5
        ble     LBTN26
LBTN27:
        ldr     r8, [sp, #0x38]
        add     r7, r2, r3, lsl #2
LBTN28:
        add     r4, r4, #1
        str     r8, [r7], #4
        cmp     r4, r5
        add     r3, r3, #1
        blt     LBTN28
LBTN29:
        subs    r12, r12, #1
        add     lr, lr, r10
        bne     LBTN21
        ldr     r4, [sp, #4]
        add     r0, r0, r11
        subs    r4, r4, #1
        bne     LBTN20
        ldr     r9, [sp, #0x40]
        ldr     r8, [sp, #0x48]
        str     r2, [sp, #0x20]
LBTN30:
        mov     r9, r9, lsl #2
        cmp     r9, #0
        ble     LBTN33
        ldr     r0, [sp, #0x20]
        ldr     r1, [sp, #0x28]
LBTN31:
        ldr     r12, [r0], #4
        cmn     r12, #1
        movle   r12, #0
        ble     LBTN32
        ldr     r3, [r8]
        mov     r12, r12, lsl #1
        ldrsh   r12, [r3, +r12]
LBTN32:
        strh    r12, [r1], #2
        subs    r9, r9, #1
        bne     LBTN31
LBTN33:
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
LBTN34:
        sub     lr, r7, #4
        ldr     lr, [lr, +r12, lsl #2]
        str     lr, [r3]
        b       LBTN18
LBTN35:
        mov     r12, #0
        mov     r1, r12
        mov     r11, r1
        b       LBTN7
LBTN36:
        mul     r0, r8, r0
        mov     r3, #0
        add     r0, r12, r0, lsl #2
        b       LBTN4
LBTN37:
        add     r8, r8, #1
        cmp     r8, #4
        blt     LBTN2
        ldr     r8, [sp, #0x48]
        str     r12, [sp, #0x20]
        b       LBTN5
LBTN_ownsSRSetTaps32s_16s:
        stmdb   sp!, {r4, r5, lr}
        mov     r4, r2
        mov     r5, r1
        ldr     r2, [r4, #8]
        ldr     r1, [r4]
        bl      ownsCvt32sTo16s
        add     r5, r0, r5
        str     r5, [r4, #0x28]
        ldmia   sp!, {r4, r5, pc}
        .long   0x46493131


