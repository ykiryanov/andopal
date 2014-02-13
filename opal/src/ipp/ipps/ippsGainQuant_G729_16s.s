        .text
        .align  4
        .globl  _ippsGainQuant_G729_16s


_ippsGainQuant_G729_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xF0
        ldr     r5, [sp, #0x11C]
        add     lr, sp, #0x30
        ldr     r4, [sp, #0x114]
        and     lr, lr, #0xF
        ldr     r6, [sp, #0x118]
        str     r5, [sp, #0x20]
        ldr     r5, [sp, #0x120]
        rsb     lr, lr, #0
        mov     r8, r0
        add     r12, sp, #0x30
        and     lr, lr, #0xF
        cmp     r8, #0
        add     r7, r12, lr
        mov     r9, r1
        mov     r11, r2
        mov     r10, r3
        beq     LDTN74
        cmp     r9, #0
        beq     LDTN74
        cmp     r10, #0
        beq     LDTN74
        cmp     r4, #0
        beq     LDTN74
        cmp     r6, #0
        beq     LDTN74
        ldr     r12, [sp, #0x20]
        cmp     r12, #0
        beq     LDTN74
        cmp     r11, #0
        beq     LDTN74
        cmp     r5, #0
        blt     LDTN0
        cmp     r5, #1
        ble     LDTN1
LDTN0:
        mvn     r0, #6
        add     sp, sp, #0xF0
        ldmia   sp!, {r4 - r11, pc}
LDTN1:
        add     r12, sp, #0xB8
        add     r3, sp, #0x90
        str     r12, [sp]
        mov     r2, r8
        mov     r1, r9
        mov     r0, #0
        bl      _ippsComputeAdaptiveCodebookGain_16s
        ldrsh   r12, [sp, #0xB8]
        cmp     r12, #0
        bne     LDTN2
        mvn     r12, #0xE
        add     lr, sp, #0x90
        strh    r12, [lr, #6]
LDTN2:
        add     r3, sp, #0x98
        mov     r0, r11
        mov     r2, #0
        mov     r1, #0x28
        bl      _ippsSumSquare_NS_16s32s_Sfs
        add     lr, sp, #0x90
        add     r11, sp, #0x90
        ldrsh   lr, [lr, #2]
        ldrsh   r11, [r11]
        add     r12, sp, #0xC8
        cmn     lr, #2, 18
        strh    r11, [r12]
        beq     LDTN73
        rsb     lr, lr, #0
        mov     lr, lr, lsl #16
        mov     r11, lr, asr #16
LDTN3:
        add     r12, sp, #0x90
        ldrsh   r12, [r12, #4]
        cmn     r12, #2, 18
        beq     LDTN72
        rsb     r12, r12, #0
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
LDTN4:
        add     lr, sp, #0x90
        ldrsh   r0, [lr, #6]
        add     lr, sp, #0xC8
        strh    r12, [lr, #2]
        add     r0, r0, #1
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        cmn     r0, #2, 18
        beq     LDTN71
        rsb     r0, r0, #0
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        str     r0, [sp, #0x28]
LDTN5:
        mov     r0, r10
        mov     r2, r7
        mov     r3, #0x28
        mov     r1, #3
        bl      _ippsRShiftC_16s
        add     r3, sp, #0xBC
        mov     r0, r7
        mov     r2, #0
        mov     r1, #0x28
        bl      _ippsSumSquare_NS_16s32s_Sfs
        add     r10, sp, #0xBC
        add     r3, r10, #4
        mov     r0, r8
        mov     r1, r7
        mov     r2, #0x28
        bl      _ippsDotProd_16s32s
        add     r8, sp, #0xBC
        add     r3, r8, #8
        mov     r1, r7
        mov     r0, r9
        mov     r2, #0x28
        bl      _ippsDotProd_16s32s
        add     r2, sp, #0xBC
        ldr     r2, [r2]
        ldr     r1, [r10, #4]
        ldr     r8, [r8, #8]
        mov     r2, r2, lsl #1
        adds    r12, r2, #1
        mov     r1, r1, lsl #1
        mov     r8, r8, lsl #1
        add     lr, r1, #1
        add     r7, r8, #1
        mov     r2, r12
        beq     LDTN9
        cmn     r12, #1
        beq     LDTN58
        cmp     r12, #0
        mvnlt   r2, r12
        cmp     r2, #0
        moveq   r3, #0
        beq     LDTN8
        movs    r1, r2, lsr #16
        bne     LDTN6
        bic     r2, r2, #0xFF, 8
        bic     r1, r2, #0xFF, 16
        movs    r2, r1, asr #8
        movne   r1, r2, lsl #1
        ldrne   r2, [pc, #0xF10]
        ldreq   r2, [pc, #0xF10]
        moveq   r1, r1, lsl #1
        ldrsh   r1, [r2, +r1]
        add     r1, r1, #0x10
        mov     r1, r1, lsl #16
        mov     r3, r1, asr #16
        b       LDTN8
LDTN6:
        movs    r2, r2, lsr #24
        bne     LDTN7
        ldr     r2, [pc, #0xEEC]
        mov     r1, r1, lsl #1
        ldrsh   r3, [r2, +r1]
        b       LDTN8
LDTN7:
        ldr     r1, [pc, #0xED8]
        mov     r2, r2, lsl #1
        ldrsh   r3, [r1, +r2]
LDTN8:
        mov     r12, r12, lsl r3
        add     r1, sp, #0xBC
        str     r12, [r1]
        b       LDTN10
LDTN9:
        add     r1, sp, #0xBC
        str     r12, [r1]
        mov     r3, #0
LDTN10:
        cmp     lr, #0
        mov     r2, lr
        streq   lr, [r10, #4]
        moveq   r2, #0
        beq     LDTN14
        cmn     lr, #1
        beq     LDTN59
        cmp     lr, #0
        mvnlt   r2, lr
        cmp     r2, #0
        moveq   r2, #0
        beq     LDTN13
        movs    r1, r2, lsr #16
        bne     LDTN11
        bic     r2, r2, #0xFF, 8
        bic     r2, r2, #0xFF, 16
        movs    r8, r2, asr #8
        ldrne   r1, [pc, #0xE6C]
        movne   r2, r8, lsl #1
        ldreq   r1, [pc, #0xE68]
        moveq   r2, r2, lsl #1
        ldrsh   r2, [r1, +r2]
        add     r1, r2, #0x10
        mov     r1, r1, lsl #16
        mov     r2, r1, asr #16
        b       LDTN13
LDTN11:
        movs    r2, r2, lsr #24
        bne     LDTN12
        ldr     r2, [pc, #0xE44]
        mov     r1, r1, lsl #1
        ldrsh   r2, [r2, +r1]
        b       LDTN13
LDTN12:
        ldr     r1, [pc, #0xE30]
        mov     r2, r2, lsl #1
        ldrsh   r2, [r1, +r2]
LDTN13:
        mov     lr, lr, lsl r2
        str     lr, [r10, #4]
LDTN14:
        cmp     r7, #0
        mov     r8, r7
        beq     LDTN18
        cmn     r7, #1
        beq     LDTN60
        cmp     r7, #0
        mvnlt   r8, r7
        cmp     r8, #0
        moveq   r1, #0
        beq     LDTN17
        movs    r1, r8, lsr #16
        bne     LDTN15
        bic     r8, r8, #0xFF, 8
        bic     r8, r8, #0xFF, 16
        movs    r9, r8, asr #8
        ldrne   r1, [pc, #0xDE0]
        movne   r8, r9, lsl #1
        ldreq   r1, [pc, #0xDDC]
        moveq   r8, r8, lsl #1
        ldrsh   r8, [r1, +r8]
        add     r1, r8, #0x10
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        b       LDTN17
LDTN15:
        movs    r8, r8, lsr #24
        bne     LDTN16
        ldr     r8, [pc, #0xDB8]
        mov     r1, r1, lsl #1
        ldrsh   r1, [r8, +r1]
        b       LDTN17
LDTN16:
        ldr     r1, [pc, #0xDA4]
        mov     r8, r8, lsl #1
        ldrsh   r1, [r1, +r8]
LDTN17:
        mov     r7, r7, lsl r1
        add     r8, sp, #0xBC
        str     r7, [r8, #8]
        b       LDTN19
LDTN18:
        add     r1, sp, #0xBC
        str     r7, [r1, #8]
        mov     r1, #0
LDTN19:
        mvn     r8, #0xFF
        bic     r8, r8, #0x7F, 24
        sub     r9, r8, #2, 2
        cmp     r9, r12
        mvnle   r12, r8
        ble     LDTN20
        add     r12, r12, #2, 18
        mov     r12, r12, asr #16
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
LDTN20:
        sub     r8, r8, #2, 2
        add     r9, sp, #0xC8
        cmp     r8, lr
        strh    r12, [r9, #4]
        ble     LDTN21
        add     lr, lr, #2, 18
        mov     lr, lr, asr #16
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        b       LDTN22
LDTN21:
        mvn     r12, #0xFF
        bic     r12, r12, #0x7F, 24
        mvn     lr, r12
LDTN22:
        cmn     lr, #2, 18
        beq     LDTN70
        rsb     r12, lr, #0
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
LDTN23:
        mvn     r8, #0xFF
        bic     r8, r8, #0x7F, 24
        sub     r9, r8, #2, 2
        add     lr, sp, #0xC8
        cmp     r9, r7
        strh    r12, [lr, #6]
        mvnle   r12, r8
        ble     LDTN24
        add     r7, r7, #2, 18
        mov     r7, r7, asr #16
        mov     r7, r7, lsl #16
        mov     r12, r7, asr #16
LDTN24:
        add     r3, r3, #3
        sub     r2, r2, #7
        sub     r7, r1, #7
        ldr     r1, [sp, #0x98]
        mov     r9, r3, lsl #16
        mov     r8, r2, lsl #16
        add     lr, sp, #0xC8
        add     r3, sp, #0xEC
        add     r2, sp, #0xE0
        strh    r12, [lr, #8]
        mov     r0, r4
        bl      ownGainPredict
        add     r1, sp, #0xC8
        ldrsh   r1, [r1, #4]
        add     r2, sp, #0xC8
        mov     r7, r7, lsl #16
        str     r1, [sp, #0x24]
        ldrsh   r2, [r2]
        mov     r7, r7, asr #16
        mul     r1, r2, r1
        str     r2, [sp, #0x14]
        cmn     r1, #7, 2
        mvngt   r12, #2, 2
        bgt     LDTN25
        cmp     r1, #3, 2
        movge   r12, r1, lsl #1
        movlt   r12, #2, 2
LDTN25:
        add     r1, sp, #0xC8
        ldrsh   r10, [r1, #8]
        add     r1, r11, r9, asr #16
        sub     r1, r1, #1
        mul     r2, r10, r10
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        cmn     r2, #7, 2
        mvngt   r3, #2, 2
        bgt     LDTN26
        cmp     r2, #3, 2
        movge   r3, r2, lsl #1
        movlt   r3, #2, 2
LDTN26:
        mov     r2, r7, lsl #1
        add     r2, r2, #1
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #16
        cmp     r1, r2
        ble     LDTN27
        sub     r1, r1, r2
        cmp     r1, #0x1F
        movge   r1, #0x1F
        rsb     r12, r3, r12, asr r1
        b       LDTN28
LDTN27:
        sub     r2, r2, r1
        cmp     r2, #0x1F
        movge   r2, #0x1F
        sub     r12, r12, r3, asr r2
        mov     r2, r1
LDTN28:
        cmp     r12, #0
        mov     r3, r12
        moveq   r1, #0
        beq     LDTN32
        cmn     r12, #1
        moveq   r12, #2, 2
        moveq   r1, #0x1F
        beq     LDTN32
        cmp     r12, #0
        mvnlt   r3, r12
        cmp     r3, #0
        moveq   r1, #0
        beq     LDTN31
        movs    r1, r3, lsr #16
        bne     LDTN29
        bic     r3, r3, #0xFF, 8
        bic     r3, r3, #0xFF, 16
        movs    lr, r3, asr #8
        ldrne   r1, [pc, #0xBB4]
        movne   r3, lr, lsl #1
        ldreq   r1, [pc, #0xBB0]
        moveq   r3, r3, lsl #1
        ldrsh   r3, [r1, +r3]
        add     r1, r3, #0x10
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        b       LDTN31
LDTN29:
        movs    r3, r3, lsr #24
        bne     LDTN30
        ldr     r3, [pc, #0xB8C]
        mov     r1, r1, lsl #1
        ldrsh   r1, [r3, +r1]
        b       LDTN31
LDTN30:
        ldr     r1, [pc, #0xB78]
        mov     r3, r3, lsl #1
        ldrsh   r1, [r1, +r3]
LDTN31:
        mov     r12, r12, lsl r1
LDTN32:
        add     r1, r2, r1
        mov     r12, r12, asr #16
        sub     r1, r1, #0x10
        mov     r12, r12, lsl #16
        str     r1, [sp, #0x1C]
        mov     r1, r12, asr #16
        cmp     r1, #0
        ble     LDTN69
        mov     r0, #2, 4
        bl      __intel_idiv
        mov     r0, r0, lsl #16
        mov     lr, r0, asr #16
LDTN33:
        add     r1, sp, #0xC8
        ldrsh   r3, [r1, #6]
        add     r1, sp, #0xC8
        ldrsh   r1, [r1, #2]
        ldr     r2, [sp, #0x24]
        ldr     r12, [sp, #0x28]
        str     r1, [sp, #0x18]
        add     r0, r7, r8, asr #16
        mov     r2, r2, lsl #1
        mul     r1, r2, r1
        rsb     lr, lr, #0
        add     r12, r12, r9, asr #16
        add     r0, r0, #1
        mov     r12, r12, lsl #16
        str     r1, [sp, #0x24]
        mov     r1, r3, lsl #1
        mul     r1, r1, r10
        mov     r2, lr, lsl #16
        ldr     lr, [sp, #0x1C]
        mov     r0, r0, lsl #16
        str     r1, [sp, #0x10]
        mov     r2, r2, asr #16
        mov     r12, r12, asr #16
        mov     r1, r0, asr #16
        rsb     lr, lr, #0x1D
        str     r2, [sp, #0x1C]
        cmp     r12, r1
        mov     r2, lr, lsl #16
        ble     LDTN34
        sub     r12, r12, r1
        add     r12, r12, #1
        cmp     r12, #0x1F
        movge   r12, #0x1F
        ldr     lr, [sp, #0x24]
        sub     r1, r1, #1
        mov     lr, lr, asr r12
        ldr     r12, [sp, #0x10]
        mov     r0, r12, asr #1
        b       LDTN35
LDTN34:
        sub     r1, r1, r12
        add     r1, r1, #1
        cmp     r1, #0x1F
        movge   r1, #0x1F
        ldr     r0, [sp, #0x10]
        ldr     lr, [sp, #0x24]
        mov     r0, r0, asr r1
        sub     r1, r12, #1
        mov     lr, lr, asr #1
LDTN35:
        subs    lr, lr, r0
        mov     r1, r1, lsl #16
        mov     r0, lr
        moveq   r12, #0
        beq     LDTN40
        cmn     lr, #1
        moveq   lr, #2, 2
        moveq   r12, #0x1F
        beq     LDTN40
        cmp     lr, #0
        mvnlt   r0, lr
        cmp     r0, #0
        moveq   r12, #0
        beq     LDTN39
        movs    r12, r0, lsr #16
        bne     LDTN37
        bic     r0, r0, #0xFF, 8
        bic     r0, r0, #0xFF, 16
        str     r0, [sp, #0x10]
        movs    r0, r0, asr #8
        ldrne   r12, [pc, #0xA28]
        movne   r0, r0, lsl #1
        bne     LDTN36
        ldr     r0, [sp, #0x10]
        ldr     r12, [pc, #0xA1C]
        mov     r0, r0, lsl #1
LDTN36:
        ldrsh   r0, [r12, +r0]
        add     r12, r0, #0x10
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        b       LDTN39
LDTN37:
        movs    r0, r0, lsr #24
        bne     LDTN38
        ldr     r0, [pc, #0x9F8]
        mov     r12, r12, lsl #1
        ldrsh   r12, [r0, +r12]
        b       LDTN39
LDTN38:
        ldr     r12, [pc, #0x9E4]
        mov     r0, r0, lsl #1
        ldrsh   r12, [r12, +r0]
LDTN39:
        mov     lr, lr, lsl r12
LDTN40:
        add     r1, r12, r1, asr #16
        ldr     r12, [sp, #0x1C]
        mov     lr, lr, asr #16
        sub     r1, r1, #0x10
        add     r1, r1, r2, asr #16
        mov     lr, lr, lsl #16
        sub     r1, r1, #0x18
        mov     lr, lr, asr #15
        mul     r12, r12, lr
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        cmp     r1, #0
        blt     LDTN68
        cmp     r1, #0x1F
        movge   r1, #0x1F
        mov     r1, r12, asr r1
LDTN41:
        mov     r1, r1, asr #16
        cmp     r5, #1
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        addne   r12, sp, #0xB4
        strneh  r1, [r12]
        beq     LDTN67
LDTN42:
        ldr     r12, [sp, #0x28]
        ldr     lr, [sp, #0x18]
        add     r12, r7, r12
        str     r12, [sp, #0x24]
        ldr     r12, [sp, #0x14]
        mov     lr, lr, lsl #1
        mul     r10, lr, r10
        mov     r12, r12, lsl #1
        mul     r3, r12, r3
        ldr     lr, [sp, #0x24]
        add     r12, r11, r8, asr #16
        mov     r12, r12, lsl #16
        add     lr, lr, #1
        mov     lr, lr, lsl #16
        mov     r12, r12, asr #16
        mov     lr, lr, asr #16
        cmp     r12, lr
        ble     LDTN43
        sub     r12, r12, lr
        add     r12, r12, #1
        cmp     r12, #0x1F
        mov     r0, #0x1F
        movgt   r12, r0
        mov     r3, r3, asr r12
        mov     r10, r10, asr #1
        sub     lr, lr, #1
        b       LDTN44
LDTN43:
        sub     lr, lr, r12
        add     lr, lr, #1
        cmp     lr, #0x1F
        mov     r0, #0x1F
        movgt   lr, r0
        mov     r10, r10, asr lr
        mov     r3, r3, asr #1
        sub     lr, r12, #1
LDTN44:
        subs    r12, r3, r10
        mov     r3, lr, lsl #16
        mov     r10, r12
        moveq   lr, #0
        beq     LDTN48
        cmn     r12, #1
        moveq   r12, #2, 2
        moveq   lr, #0x1F
        beq     LDTN48
        cmp     r12, #0
        mvnlt   r10, r12
        cmp     r10, #0
        moveq   lr, #0
        beq     LDTN47
        movs    lr, r10, lsr #16
        bne     LDTN45
        bic     r10, r10, #0xFF, 8
        bic     r10, r10, #0xFF, 16
        movs    r0, r10, asr #8
        ldrne   lr, [pc, #0x8A0]
        movne   r10, r0, lsl #1
        ldreq   lr, [pc, #0x89C]
        moveq   r10, r10, lsl #1
        ldrsh   r10, [lr, +r10]
        add     lr, r10, #0x10
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        b       LDTN47
LDTN45:
        movs    r10, r10, lsr #24
        bne     LDTN46
        ldr     r10, [pc, #0x878]
        mov     lr, lr, lsl #1
        ldrsh   lr, [r10, +lr]
        b       LDTN47
LDTN46:
        ldr     lr, [pc, #0x864]
        mov     r10, r10, lsl #1
        ldrsh   lr, [lr, +r10]
LDTN47:
        mov     r12, r12, lsl lr
LDTN48:
        add     r3, lr, r3, asr #16
        sub     r3, r3, #0x10
        add     r3, r3, r2, asr #16
        ldr     r2, [sp, #0x1C]
        mov     r12, r12, asr #16
        sub     r3, r3, #0x11
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #15
        mul     r2, r2, r12
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
        cmp     r3, #0
        blt     LDTN66
        cmp     r3, #0x1F
        movge   r3, #0x1F
        mov     r3, r2, asr r3
LDTN49:
        mov     r2, r3, asr #16
        add     r3, sp, #0xB4
        strh    r2, [r3, #2]
        ldrsh   r3, [sp, #0xE0]
        ldrsh   r2, [sp, #0xEC]
        str     r3, [sp, #0x14]
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        cmp     r2, #4
        blt     LDTN50
        ldr     r12, [sp, #0x14]
        sub     lr, r2, #4
        mov     lr, r12, asr lr
        mov     r12, lr, lsl #16
        mov     r12, r12, asr #16
        b       LDTN52
LDTN50:
        ldr     lr, [sp, #0x14]
        rsb     r12, r2, #4
        bic     r12, r12, #0xFF, 8
        bic     r12, r12, #0xFF, 16
        mvn     r10, r3
        mov     r0, #0
        cmp     lr, r10, asr r12
        sub     r0, r0, #2, 18
        bgt     LDTN51
        ldr     lr, [sp, #0x14]
        cmp     lr, r0, asr r12
        movlt   r12, #0
        sublt   r12, r12, #2, 18
        blt     LDTN52
        ldr     lr, [sp, #0x14]
        mov     r12, lr, lsl r12
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        b       LDTN52
LDTN51:
        mvn     r12, #0xFF
        bic     r12, r12, #0x7F, 24
        mvn     r12, r12
LDTN52:
        mov     lr, #0x89
        orr     lr, lr, #0x1F, 22
        ldr     r0, [pc, #0x77C]
        mov     r10, lr, lsl #1
        mul     r10, r1, r10
        add     r1, sp, #0xB4
        ldrsh   r1, [r1, #2]
        mul     lr, r1, lr
        str     r1, [sp, #0x24]
        mov     r1, #0x51
        str     lr, [sp, #0x10]
        orr     lr, r1, #0xD9, 24
        ldr     r1, [pc, #0x758]
        add     lr, r10, lr
        sub     r10, r10, r0
        ldrsh   r1, [r1, #-8]
        ldr     r0, [sp, #0x24]
        mov     lr, lr, asr #16
        mov     r10, r10, asr #16
        mul     r1, r1, r12
        str     r1, [sp, #0x1C]
        mov     r1, lr, lsl #16
        mov     lr, r10, lsl #16
        mov     r1, r1, asr #15
        mul     r1, r12, r1
        mov     lr, lr, asr #16
        mul     r10, r12, lr
        mvn     lr, #0x9D
        rsb     r1, r1, r0, lsl #7
        mov     r0, #0xCF, 30
        orr     r0, r0, #0x1E, 22
        str     r0, [sp, #0x24]
        ldr     r0, [sp, #0x24]
        mov     r10, r10, asr #15
        bic     lr, lr, #0x85, 24
        mov     r1, r1, asr #14
        mov     r10, r10, lsl #16
        cmn     r1, #2, 18
        movlt   r1, r3
        mov     r10, r10, asr #15
        mul     r10, r10, r0
        ldr     r0, [sp, #0x10]
        mov     r1, r1, lsl #16
        mvn     r3, r3
        sub     r10, r10, r0, asr #2
        mov     r1, r1, asr #16
        mul     r1, r1, lr
        mov     r10, r10, asr #14
        cmp     r3, r10
        movlt   r10, r3
        cmp     r12, #0
        mov     r10, r10, lsl #16
        mov     r10, r10, asr #16
        mul     lr, r10, lr
        ble     LDTN61
        ldr     r3, [sp, #0x1C]
        cmp     lr, r3, asr #2
        movle   r3, #0
        ble     LDTN54
        ldr     r10, [pc, #0x69C]
        mov     r3, #0
        sub     r10, r10, #8
LDTN53:
        add     r3, r3, #1
        cmp     r3, #4
        add     r10, r10, #2
        bge     LDTN54
        ldrsh   r0, [r10]
        mul     r0, r12, r0
        cmp     lr, r0, asr #2
        bgt     LDTN53
LDTN54:
        ldr     lr, [pc, #0x670]
        mov     r10, r3, lsl #16
        ldrsh   r3, [lr]
        mov     r10, r10, asr #16
        str     r10, [sp, #0x24]
        mul     r3, r12, r3
        cmp     r1, r3, asr #4
        movle   r3, #0
        ble     LDTN56
        mov     r3, #0
LDTN55:
        add     r3, r3, #1
        cmp     r3, #8
        add     lr, lr, #2
        bge     LDTN56
        ldrsh   r10, [lr]
        mul     r10, r12, r10
        cmp     r1, r10, asr #4
        bgt     LDTN55
LDTN56:
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
        str     r3, [sp, #0x1C]
LDTN57:
        ldr     r1, [sp, #0x28]
        add     r11, r11, #0xD
        add     r7, r7, r2
        add     r3, r1, #0xE
        mov     r1, r11, lsl #16
        sub     lr, r7, #4
        add     r7, sp, #0xD4
        mov     r12, r2, lsl #1
        mov     r3, r3, lsl #16
        mov     r1, r1, asr #16
        strh    r1, [r7]
        add     r9, r12, r9, asr #16
        mov     r3, r3, asr #16
        add     r8, r2, r8, asr #16
        add     r7, sp, #0xD4
        sub     r2, r9, #0x15
        strh    r3, [r7, #2]
        add     r7, sp, #0xD4
        strh    r2, [r7, #4]
        add     r2, sp, #0xD4
        sub     r12, r8, #3
        strh    r12, [r2, #6]
        add     r2, sp, #0xD4
        cmp     r3, r1
        strh    lr, [r2, #8]
        movlt   r1, r3
        add     r2, sp, #0xD4
        ldrsh   r2, [r2, #4]
        cmp     r2, r1
        movlt   r1, r2
        add     r12, sp, #0xD4
        ldrsh   r12, [r12, #6]
        cmp     r12, r1
        movlt   r1, r12
        add     lr, sp, #0xD4
        ldrsh   r8, [lr, #8]
        cmp     r8, r1
        movlt   r1, r8
        ldr     lr, [sp, #0x18]
        ldr     r0, [sp, #0x14]
        sub     r3, r3, r1
        mov     lr, lr, lsl #16
        mov     r3, lr, asr r3
        str     r3, [sp, #0x28]
        add     r9, sp, #0xD4
        ldrsh   r11, [r9]
        sub     lr, r2, r1
        add     r2, sp, #0xC8
        ldrsh   r2, [r2, #4]
        sub     r7, r12, r1
        add     r3, sp, #0xC8
        ldrsh   r9, [r3, #8]
        add     r10, sp, #0xC8
        ldrsh   r10, [r10]
        add     r12, sp, #0xC8
        ldrsh   r12, [r12, #6]
        mov     r2, r2, lsl #16
        mvn     r3, #0xFF
        mov     r9, r9, lsl #16
        mov     r12, r12, lsl #16
        mov     r10, r10, lsl #16
        mov     lr, r2, asr lr
        ldr     r2, [sp, #0x24]
        bic     r3, r3, #0x7F, 24
        mvn     r3, r3
        str     r3, [sp, #0x18]
        strh    r2, [sp, #0xE8]
        ldr     r3, [sp, #0x1C]
        sub     r8, r8, r1
        sub     r1, r11, r1
        mov     r1, r10, asr r1
        mov     r8, r9, asr r8
        strh    r3, [sp, #0xE4]
        ldr     r9, [sp, #0x28]
        mov     r3, r1, asr #16
        str     r3, [sp, #0x14]
        ldr     r3, [sp, #0x18]
        mov     r7, r12, asr r7
        mov     r12, r9, asr #16
        str     r12, [sp, #0x2C]
        and     r12, r3, r9, asr #1
        mov     r9, lr, asr #16
        and     lr, r3, lr, asr #1
        mov     r10, r7, asr #16
        and     r7, r3, r7, asr #1
        mov     r11, r8, asr #16
        and     r1, r3, r1, asr #1
        str     r1, [sp, #0x10]
        and     r8, r3, r8, asr #1
        ldr     r3, [sp, #0x14]
        add     r1, sp, #0xA8
        strh    r3, [r1]
        ldr     r3, [sp, #0x10]
        add     r1, sp, #0x9C
        strh    r3, [r1]
        ldr     r3, [sp, #0x2C]
        add     r1, sp, #0xA8
        strh    r3, [r1, #2]
        add     r3, sp, #0x9C
        strh    r12, [r3, #2]
        add     r3, sp, #0xA8
        strh    r9, [r3, #4]
        add     r3, sp, #0x9C
        strh    lr, [r3, #4]
        add     r3, sp, #0xA8
        strh    r10, [r3, #6]
        add     r3, sp, #0x9C
        strh    r7, [r3, #6]
        add     r3, sp, #0xA8
        strh    r11, [r3, #8]
        add     r3, sp, #0x9C
        strh    r8, [r3, #8]
        add     r3, sp, #0xE4
        str     r3, [sp, #8]
        add     r3, sp, #0xE8
        str     r3, [sp, #4]
        add     r3, sp, #0x9C
        str     r3, [sp]
        str     r5, [sp, #0xC]
        mov     r1, r2
        ldr     r2, [sp, #0x1C]
        add     r3, sp, #0xA8
        bl      LDTN_ownWeightedMSE
        ldr     r3, [pc, #0x430]
        ldrsh   r2, [sp, #0xE8]
        ldrsh   r1, [sp, #0xE4]
        add     r12, r3, #0x10
        add     r3, r3, #0x30
        mov     lr, r2, lsl #2
        mov     r5, r1, lsl #2
        ldrsh   r8, [r3, +r5]
        ldrsh   r7, [r12, +lr]
        ldrsh   r2, [sp, #0xE0]
        ldrsh   r1, [sp, #0xEC]
        add     r8, r7, r8
        strh    r8, [r6]
        add     lr, r12, lr
        ldrsh   r12, [lr, #2]
        add     r5, r3, r5
        ldrsh   lr, [r5, #2]
        add     r3, r1, #0xB
        mov     r0, r4
        add     r1, r12, lr
        mov     r12, r1, asr #1
        mul     r12, r2, r12
        mov     r3, r12, asr r3
        strh    r3, [r6, #2]
        bl      ownGainUpdate
        ldr     r3, [sp, #0x20]
        ldrsh   r1, [sp, #0xE8]
        ldrsh   r2, [sp, #0xE4]
        mov     r0, #0
        strh    r1, [r3]
        strh    r2, [r3, #2]
        add     sp, sp, #0xF0
        ldmia   sp!, {r4 - r11, pc}
LDTN58:
        add     r1, sp, #0xBC
        mov     r12, #2, 2
        str     r12, [r1]
        mov     r3, #0x1F
        b       LDTN10
LDTN59:
        mov     lr, #2, 2
        str     lr, [r10, #4]
        mov     r2, #0x1F
        b       LDTN14
LDTN60:
        add     r1, sp, #0xBC
        mov     r7, #2, 2
        str     r7, [r1, #8]
        mov     r1, #0x1F
        b       LDTN19
LDTN61:
        ldr     r3, [sp, #0x1C]
        cmp     lr, r3, asr #4
        movle   r10, #0
        ble     LDTN63
        ldr     r3, [pc, #0x364]
        mov     r10, #0
        sub     r3, r3, #8
LDTN62:
        add     r10, r10, #1
        cmp     r10, #4
        add     r3, r3, #2
        bge     LDTN63
        ldrsh   r0, [r3]
        mul     r0, r12, r0
        cmp     lr, r0, asr #4
        bgt     LDTN62
LDTN63:
        ldr     r3, [pc, #0x338]
        mov     r10, r10, lsl #16
        str     r3, [sp, #0x10]
        ldrsh   r3, [r3]
        mov     r10, r10, asr #16
        str     r10, [sp, #0x24]
        mul     r3, r12, r3
        cmp     r1, r3, asr #4
        movle   r3, #0
        ble     LDTN65
        ldr     lr, [sp, #0x10]
        mov     r3, #0
LDTN64:
        add     r3, r3, #1
        cmp     r3, #8
        add     lr, lr, #2
        bge     LDTN65
        ldrsh   r10, [lr]
        mul     r10, r12, r10
        cmp     r1, r10, asr #4
        bgt     LDTN64
LDTN65:
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
        str     r3, [sp, #0x1C]
        b       LDTN57
LDTN66:
        rsb     r3, r3, #0
        bic     r3, r3, #0xFF, 8
        mvn     r12, #2, 2
        bic     r3, r3, #0xFF, 16
        cmp     r2, r12, asr r3
        mov     r12, #2, 2
        mvngt   r3, #2, 2
        bgt     LDTN49
        cmp     r2, r12, asr r3
        movge   r3, r2, lsl r3
        movlt   r3, #2, 2
        b       LDTN49
LDTN67:
        mvn     r12, #0xE
        add     r12, r12, #0x1F, 28
        cmp     r12, r1
        movlt   r1, r12
        add     r12, sp, #0xB4
        strh    r1, [r12]
        b       LDTN42
LDTN68:
        rsb     r1, r1, #0
        bic     r1, r1, #0xFF, 8
        mvn     lr, #2, 2
        bic     r1, r1, #0xFF, 16
        cmp     r12, lr, asr r1
        mov     lr, #2, 2
        mvngt   r1, #2, 2
        bgt     LDTN41
        cmp     r12, lr, asr r1
        movge   r1, r12, lsl r1
        movlt   r1, #2, 2
        b       LDTN41
LDTN69:
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     lr, r1
        b       LDTN33
LDTN70:
        mvn     r12, #0xFF
        bic     r12, r12, #0x7F, 24
        mvn     r12, r12
        b       LDTN23
LDTN71:
        mvn     r12, #0xFF
        bic     r12, r12, #0x7F, 24
        mvn     r12, r12
        str     r12, [sp, #0x28]
        b       LDTN5
LDTN72:
        mvn     r12, #0xFF
        bic     r12, r12, #0x7F, 24
        mvn     r12, r12
        b       LDTN4
LDTN73:
        mov     r12, #0
        sub     r12, r12, #2, 18
        mvn     r11, r12
        b       LDTN3
LDTN74:
        mvn     r0, #7
        add     sp, sp, #0xF0
        ldmia   sp!, {r4 - r11, pc}
LDTN_ownWeightedMSE:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x54
        ldr     r4, [sp, #0x84]
        ldr     lr, [pc, #0x1F4]
        ldr     r12, [sp, #0x78]
        ldr     r6, [sp, #0x7C]
        ldr     r5, [sp, #0x80]
        cmp     r4, #1
        sub     r4, lr, #0x20
        add     r9, r4, r1, lsl #2
        add     lr, lr, r2, lsl #2
        mvn     r10, #2, 2
        mov     r4, #0
        beq     LDTN78
        mov     r7, r9
        str     r9, [sp, #0x18]
        str     r5, [sp, #0xC]
        str     r6, [sp, #0x10]
        str     r0, [sp, #0x1C]
        str     r10, [sp, #0x24]
LDTN75:
        mov     r5, r2
        mov     r0, lr
        mov     r6, #8
        str     r1, [sp, #8]
        str     r6, [sp, #0x28]
        str     r7, [sp, #0x14]
        str     lr, [sp, #4]
        str     r2, [sp]
        str     r4, [sp, #0x20]
LDTN76:
        ldr     r1, [sp, #0x14]
        ldrsh   r4, [r0, #2]
        ldr     r2, [sp, #0x18]
        ldrsh   lr, [r1, #2]
        ldr     r1, [sp, #0x20]
        ldrsh   r8, [r3, #2]
        ldr     r6, [sp, #0x1C]
        mov     r1, r1, lsl #2
        ldrsh   r1, [r2, +r1]
        ldrsh   r2, [r0]
        add     lr, lr, r4
        ldrsh   r4, [r12, #2]
        mov     lr, lr, asr #1
        mul     lr, r6, lr
        add     r2, r1, r2
        ldrsh   r1, [r3, #6]
        str     r1, [sp, #0x2C]
        mov     r1, r2, lsl #16
        ldrsh   r2, [r12, #6]
        mov     r7, lr, asr #15
        mul     r6, r7, r7
        mul     r2, r2, r7
        mov     r1, r1, asr #16
        mul     r4, r4, r1
        mul     lr, r1, r1
        mul     r9, r7, r1
        str     r2, [sp, #0x34]
        mov     r6, r6, asr #15
        str     r4, [sp, #0x30]
        ldrsh   r4, [r12]
        ldrsh   r10, [r3]
        ldrsh   r2, [r12, #4]
        mov     lr, lr, asr #15
        mov     r11, r6, lsl #16
        str     r10, [sp, #0x38]
        mov     lr, lr, lsl #16
        ldrsh   r10, [r12, #8]
        mov     lr, lr, asr #16
        mul     r6, r4, lr
        mov     r4, r11, asr #16
        ldrsh   r11, [r3, #4]
        mul     r2, r2, r4
        mov     r9, r9, asr #15
        str     r11, [sp, #0x3C]
        ldrsh   r11, [r3, #8]
        mov     r9, r9, lsl #16
        mov     r6, r6, asr #15
        mov     r2, r2, asr #15
        str     r11, [sp, #0x40]
        ldr     r11, [sp, #0x30]
        mov     r11, r11, asr #15
        mla     r8, r8, r1, r11
        mov     r1, r9, asr #16
        ldr     r9, [sp, #0x34]
        mul     r10, r10, r1
        ldr     r11, [sp, #0x2C]
        mov     r9, r9, asr #15
        mov     r10, r10, asr #15
        mla     r7, r11, r7, r9
        ldr     r9, [sp, #0x38]
        mla     lr, r9, lr, r6
        ldr     r6, [sp, #0x3C]
        add     r7, r8, r7
        mla     r4, r6, r4, r2
        ldr     r2, [sp, #0x40]
        mla     r1, r2, r1, r10
        ldr     r2, [sp, #0x24]
        add     r4, lr, r4
        add     r4, r7, r4
        add     r1, r4, r1
        cmp     r1, r2
        bge     LDTN77
        ldr     r2, [sp, #8]
        ldr     lr, [sp, #0x10]
        strh    r2, [lr]
        str     r1, [sp, #0x24]
        ldr     r1, [sp, #0xC]
        strh    r5, [r1]
LDTN77:
        ldr     r1, [sp, #0x28]
        add     r5, r5, #1
        add     r0, r0, #4
        subs    r1, r1, #1
        str     r1, [sp, #0x28]
        bne     LDTN76
        ldr     r4, [sp, #0x20]
        ldr     r1, [sp, #8]
        ldr     r7, [sp, #0x14]
        ldr     lr, [sp, #4]
        ldr     r2, [sp]
        add     r4, r4, #1
        cmp     r4, #4
        add     r7, r7, #4
        add     r1, r1, #1
        blt     LDTN75
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}
        .long   0xea000004
        .long   NormTable
        .long   NormTable2
        .long   0x0019cc12
        .long   LDTN_thr2
        .long   LDTN_gbk2
LDTN78:
        mov     r7, #0xFF
        orr     r7, r7, #0x3F, 24
        mov     r8, r9
        str     r9, [sp, #0x18]
        str     r5, [sp, #0xC]
        str     r6, [sp, #0x10]
        str     r0, [sp, #0x1C]
        str     r10, [sp, #0x24]
LDTN79:
        mov     r6, r2
        mov     r5, lr
        mov     r0, #8
        str     r1, [sp, #8]
        str     r8, [sp, #0x28]
        str     lr, [sp, #4]
        str     r2, [sp]
LDTN80:
        ldr     r2, [sp, #0x18]
        mov     r1, r4, lsl #2
        ldrsh   r1, [r2, +r1]
        ldrsh   r2, [r5]
        add     r2, r1, r2
        mov     r1, r2, lsl #16
        mov     r2, r1, asr #16
        cmp     r7, r2
        ble     LDTN81
        ldr     r1, [sp, #0x28]
        ldrsh   r9, [r5, #2]
        ldrsh   lr, [r3, #2]
        ldrsh   r8, [r1, #2]
        mul     r1, r2, r2
        str     lr, [sp, #0x40]
        ldrsh   lr, [r12, #2]
        add     r8, r8, r9
        ldrsh   r9, [r3, #6]
        mul     lr, lr, r2
        mov     r8, r8, asr #1
        str     r9, [sp, #0x3C]
        ldrsh   r9, [r12, #6]
        str     lr, [sp, #0x38]
        ldr     lr, [sp, #0x1C]
        mul     r8, lr, r8
        ldrsh   lr, [r3]
        str     lr, [sp, #0x34]
        ldrsh   lr, [r12]
        ldrsh   r10, [r3, #4]
        mov     r11, r8, asr #15
        mul     r8, r11, r2
        str     r10, [sp, #0x30]
        mul     r10, r11, r11
        str     r11, [sp, #0x2C]
        mul     r11, r9, r11
        mov     r8, r8, asr #15
        mov     r8, r8, lsl #16
        str     r11, [sp, #0x14]
        ldrsh   r9, [r12, #4]
        ldr     r11, [sp, #0x30]
        mov     r8, r8, asr #16
        str     r9, [sp, #0x44]
        mov     r9, r1, asr #15
        mov     r1, r10, asr #15
        mov     r10, r9, lsl #16
        ldrsh   r9, [r3, #8]
        mov     r10, r10, asr #16
        mul     lr, lr, r10
        str     r9, [sp, #0x48]
        mov     r9, r1, lsl #16
        ldrsh   r1, [r12, #8]
        str     r10, [sp, #0x4C]
        ldr     r10, [sp, #0x44]
        mov     r9, r9, asr #16
        str     r9, [sp, #0x50]
        mul     r1, r1, r8
        mul     r9, r10, r9
        ldr     r10, [sp, #0x40]
        mov     lr, lr, asr #15
        mov     r1, r1, asr #15
        str     r9, [sp, #0x44]
        ldr     r9, [sp, #0x38]
        mov     r9, r9, asr #15
        mla     r9, r10, r2, r9
        ldr     r2, [sp, #0x14]
        ldr     r10, [sp, #0x3C]
        str     r9, [sp, #0x40]
        ldr     r9, [sp, #0x2C]
        mov     r2, r2, asr #15
        mla     r2, r10, r9, r2
        ldr     r9, [sp, #0x4C]
        ldr     r10, [sp, #0x34]
        mla     r9, r10, r9, lr
        ldr     lr, [sp, #0x44]
        ldr     r10, [sp, #0x50]
        mov     lr, lr, asr #15
        mla     lr, r11, r10, lr
        ldr     r10, [sp, #0x48]
        mla     r8, r10, r8, r1
        ldr     r1, [sp, #0x40]
        add     lr, r9, lr
        add     r2, r1, r2
        ldr     r1, [sp, #0x24]
        add     lr, r2, lr
        add     r8, lr, r8
        cmp     r8, r1
        bge     LDTN81
        ldr     r1, [sp, #0x10]
        ldr     r2, [sp, #8]
        strh    r2, [r1]
        ldr     r1, [sp, #0xC]
        str     r8, [sp, #0x24]
        strh    r6, [r1]
LDTN81:
        subs    r0, r0, #1
        add     r6, r6, #1
        add     r5, r5, #4
        bne     LDTN80
        ldr     r1, [sp, #8]
        ldr     r8, [sp, #0x28]
        ldr     lr, [sp, #4]
        ldr     r2, [sp]
        add     r4, r4, #1
        cmp     r4, #4
        add     r8, r8, #4
        add     r1, r1, #1
        blt     LDTN79
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}


        .data
        .align  4


LDTN_thr1:
        .byte   0x38,0x2A,0x56,0x30,0x42,0x4D,0x37,0x7F
LDTN_thr2:
        .byte   0x07,0x37,0x3C,0x3F,0x32,0x4F,0x49,0x53,0xE5,0x5B,0x90,0x62,0xE1,0x6C,0x4E,0x77
LDTN_gbk1:
        .byte   0x01,0x00,0xEC,0x05,0x0F,0x06,0x79,0x09,0x27,0x07,0x9E,0x13,0x39,0x00,0x1C,0x15
        .byte   0x81,0x07,0x4B,0x24,0xAA,0x0C,0xDD,0x26,0x64,0x01,0xA4,0x39,0x76,0x0A,0x1A,0x6A
LDTN_gbk2:
        .byte   0x3A,0x03,0xD5,0x07,0xCA,0x07,0x00,0x00,0x16,0x14,0x50,0x02,0x10,0x18,0x5B,0x09
        .byte   0x9B,0x1F,0xFD,0x12,0xA0,0x23,0x0D,0x02,0x4D,0x29,0x96,0x0B,0x31,0x2D,0xAC,0x04
        .byte   0xCC,0x33,0xB8,0x0C,0x72,0x37,0x5E,0x06,0x1C,0x3B,0x32,0x13,0x39,0x3B,0xC4,0x37
        .byte   0x4A,0x3C,0xED,0x00,0xF0,0x3E,0x40,0x0D,0x93,0x43,0x45,0x07,0x1D,0x4A,0x2F,0x17


