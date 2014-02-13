        .text
        .align  4
        .globl  ownRE8_Cod


ownRE8_Cod:
        stmdb   sp!, {r4 - r6, lr}
        sub     sp, sp, #0x24
        mov     r5, r1
        mov     r1, r0
        mov     r0, r3
        add     r12, sp, #0x1C
        mov     r4, r2
        mov     r2, r0
        str     r12, [sp]
        mov     r0, r1
        add     r6, sp, #8
        mov     r1, r5
        mov     r3, r6
        bl      LDOA__ownRE8_Vor
        ldrsh   r5, [r5]
        cmp     r5, #0
        ble     LDOA4
        add     r2, sp, #0x20
        add     r1, sp, #0x18
        add     r0, sp, #8
        bl      LDOA___ownRe8_compute_rank_of_permutation_and_sign_code
        ldrsh   r1, [sp, #0x1C]
        ldr     r0, [pc, #0xF4C]
        mvn     r5, #0
        mov     r1, r1, lsl #1
        ldrsh   r0, [r0, +r1]
        mov     lr, r0
        cmp     lr, #0xE0
        movge   r0, r5
        bge     LDOA2
        ldrsh   r12, [sp, #0x20]
        ldr     r1, [pc, #0xF2C]
        add     r3, r5, #2, 18
LDOA0:
        mov     lr, lr, lsl #1
        ldrsh   lr, [r1, +lr]
        sub     lr, r12, lr
        cmp     r3, lr
        addlt   lr, r5, #2, 18
        blt     LDOA1
        cmn     lr, #2, 18
        movge   lr, lr, lsl #16
        movge   lr, lr, asr #16
        movlt   lr, r5, lsl #15
LDOA1:
        cmp     lr, #0
        beq     LDOA2
        add     r0, r0, #1
        mov     lr, r0, lsl #16
        mov     lr, lr, asr #16
        cmp     lr, #0xE0
        blt     LDOA0
        mov     r0, r5
LDOA2:
        mov     r0, r0, lsl #16
        movs    r1, r0, asr #16
        bmi     LDOA4
        ldr     r0, [pc, #0xED4]
        mov     r1, r1, lsl #1
        ldrsh   r3, [sp, #0x18]
        ldrsh   r12, [r0, +r1]
        mvn     r1, #2, 2
        adds    r0, r3, r12
        mov     r12, r12, asr #31
        adc     r3, r12, r3, asr #31
        subs    r12, r0, r1
        sbcs    lr, r3, #0
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        movne   r0, r1
        bne     LDOA3
        cmp     r0, #2, 2
        sbcs    r3, r3, r5
        movlt   r0, #2, 2
LDOA3:
        strh    r0, [r4]
LDOA4:
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r6, pc}
LDOA___ownRe8_compute_rank_of_permutation_and_sign_code:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x60
        ldrsh   lr, [r0]
        ldrsh   r3, [r0, #2]
        ldrsh   r12, [r0, #6]
        add     r6, sp, #0x50
        ldrsh   r4, [r0, #4]
        strh    lr, [r6]
        add     r7, sp, #0x50
        ldrsh   lr, [r0, #8]
        strh    r3, [r7, #2]
        ldrsh   r3, [r0, #0xA]
        add     r5, sp, #0x50
        add     r6, sp, #0x50
        strh    r12, [r6, #6]
        ldrsh   r12, [r0, #0xE]
        strh    r4, [r5, #4]
        add     r7, sp, #0x50
        ldrsh   r5, [r0, #0xC]
        strh    lr, [r7, #8]
        add     r4, sp, #0x50
        add     lr, sp, #0x50
        strh    r3, [r4, #0xA]
        strh    r12, [lr, #0xE]
        add     r6, sp, #0x50
        mvn     r3, #0xFF
        strh    r5, [r6, #0xC]
        bic     r12, r3, #0x7F, 24
        mov     lr, #0
        mov     r5, lr
        mvn     r4, r12
LDOA5:
        add     r3, r5, #1
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
        cmp     r3, #8
        movge   r6, r5
        bge     LDOA14
        mov     r6, r5
        mov     r9, r3, lsl #1
LDOA6:
        mov     r7, r6, lsl #1
        add     r8, sp, #0x50
        ldrsh   r7, [r8, +r7]
        mov     r10, r7
        cmp     r10, #0
        bge     LDOA7
        cmn     r10, #2, 18
        mvneq   r7, r12
        beq     LDOA7
        rsb     r7, r10, #0
        mov     r7, r7, lsl #16
        mov     r7, r7, asr #16
LDOA7:
        add     r8, sp, #0x50
        ldrsh   r8, [r8, +r9]
        cmp     r8, #0
        bge     LDOA8
        cmn     r8, #2, 18
        beq     LDOA54
        rsb     r8, r8, #0
        mov     r8, r8, lsl #16
        mov     r8, r8, asr #16
LDOA8:
        sub     r7, r8, r7
        cmp     r4, r7
        blt     LDOA9
        cmn     r7, #2, 18
        movge   r7, r7, lsl #16
        movge   r7, r7, asr #16
        movlt   r7, #0
        sublt   r7, r7, #2, 18
        b       LDOA10
LDOA9:
        mvn     r7, #0xFF
        bic     r7, r7, #0x7F, 24
        mvn     r7, r7
LDOA10:
        cmp     r7, #0
        blt     LDOA13
        sub     r8, r8, r10
        cmp     r4, r8
        blt     LDOA11
        cmn     r8, #2, 18
        movge   r7, r8, lsl #16
        movge   r7, r7, asr #16
        movlt   r7, #0
        sublt   r7, r7, #2, 18
        b       LDOA12
LDOA11:
        mvn     r7, #0xFF
        bic     r7, r7, #0x7F, 24
        mvn     r7, r7
LDOA12:
        cmp     r7, #0
        movgt   r6, r3
LDOA13:
        add     r3, r3, #1
        cmp     r3, #8
        add     r9, r9, #2
        blt     LDOA6
LDOA14:
        sub     r8, r6, r5
        mvn     r3, #0xFF
        cmp     r4, r8
        bic     r3, r3, #0x7F, 24
        mov     r7, #0
        mvnlt   r8, r3
        blt     LDOA15
        cmn     r8, #2, 18
        movge   r8, r8, lsl #16
        movge   r8, r8, asr #16
        sublt   r8, r7, #2, 18
LDOA15:
        cmp     r8, #0
        ble     LDOA16
        add     r8, sp, #0x50
        add     r9, sp, #0x50
        mov     r6, r6, lsl #1
        ldrsh   r10, [r9, +r6]
        ldrsh   r11, [r8, +lr]
        strh    r10, [r8, +lr]
        strh    r11, [r9, +r6]
LDOA16:
        add     r5, r5, #1
        cmp     r5, #7
        add     lr, lr, #2
        blt     LDOA5
        ldr     r6, [pc, #0xCB4]
        mov     lr, r7
        mov     r12, #8
        mov     r5, lr
        mov     r4, r12
LDOA17:
        add     r8, sp, #0x50
        ldrsh   r8, [r8, +r5]
        cmp     r8, #0
        blt     LDOA58
LDOA18:
        subs    r4, r4, #1
        add     r5, r5, #2
        bne     LDOA17
        add     r5, sp, #0x50
        strh    lr, [r2]
        ldrsh   lr, [r5]
        add     r4, sp, #0x30
        mov     r2, #1
        strh    lr, [r4]
        mvn     r6, r3
        mov     r5, #2
        mov     r4, #7
LDOA19:
        add     r8, sp, #0x50
        add     r8, r8, r5
        add     lr, sp, #0x50
        ldrsh   r8, [r8, #-2]
        ldrsh   lr, [lr, +r5]
        sub     r8, lr, r8
        cmp     r6, r8
        mvnlt   r8, r3
        blt     LDOA20
        cmn     r8, #2, 18
        movge   r8, r8, lsl #16
        movge   r8, r8, asr #16
        sublt   r8, r7, #2, 18
LDOA20:
        cmp     r8, #0
        beq     LDOA21
        add     r8, r2, #1
        add     r9, sp, #0x30
        mov     r2, r2, lsl #1
        cmp     r6, r8
        strh    lr, [r9, +r2]
        mvnlt   r2, r3
        blt     LDOA21
        cmn     r8, #2, 18
        movge   r8, r8, lsl #16
        movge   r2, r8, asr #16
        sublt   r2, r7, #2, 18
LDOA21:
        subs    r4, r4, #1
        add     r5, r5, #2
        bne     LDOA19
        mvn     r4, r3
        mov     lr, r7
LDOA22:
        cmp     r2, #0
        ble     LDOA25
        ldrsh   r6, [r0]
        mov     r8, r7
        mov     r5, r8
LDOA23:
        add     r9, sp, #0x30
        ldrsh   r9, [r9, +r5]
        sub     r9, r6, r9
        cmp     r4, r9
        mvnlt   r9, r3
        blt     LDOA24
        cmn     r9, #2, 18
        movge   r9, r9, lsl #16
        movge   r9, r9, asr #16
        sublt   r9, r7, #2, 18
LDOA24:
        cmp     r9, #0
        beq     LDOA57
        add     r8, r8, #1
        cmp     r8, r2
        add     r5, r5, #2
        blt     LDOA23
LDOA25:
        subs    r12, r12, #1
        add     r0, r0, #2
        add     lr, lr, #2
        bne     LDOA22
        cmp     r2, #0
        ble     LDOA28
        cmp     r2, #6
        movlt   r0, r7
        movlt   r10, r0
        blt     LDOA27
        mov     r0, r7
        mov     r10, r0
        sub     lr, r2, #6
        mov     r12, r10
LDOA26:
        add     r4, sp, #0x40
        add     r11, r0, #1
        mov     r10, r10, lsl #1
        strh    r12, [r4, +r10]
        mov     r11, r11, lsl #16
        add     r5, sp, #0x40
        mov     r4, r11, asr #15
        strh    r12, [r5, +r4]
        add     r4, r0, #2
        add     r6, sp, #0x40
        mov     r5, r4, lsl #16
        add     r9, sp, #0x40
        mov     r5, r5, asr #15
        add     r4, r0, #3
        strh    r12, [r6, +r5]
        mov     r5, r4, lsl #16
        add     r8, sp, #0x40
        mov     r5, r5, asr #15
        add     r4, r0, #4
        strh    r12, [r9, +r5]
        mov     r5, r4, lsl #16
        add     r0, r0, #5
        mov     r5, r5, asr #15
        mov     r4, r0, lsl #16
        strh    r12, [r8, +r5]
        mov     r10, r4, asr #16
        cmp     r10, lr
        ble     LDOA26
LDOA27:
        add     r12, sp, #0x40
        mov     r10, r10, lsl #1
        strh    r7, [r12, +r10]
        add     r0, r0, #1
        mov     r12, r0, lsl #16
        mov     r10, r12, asr #16
        cmp     r10, r2
        blt     LDOA27
LDOA28:
        ldr     r5, [pc, #0xACC]
        mov     r0, #0xFF
        orr     r0, r0, #0x7F, 24
        mvn     r8, #0
        add     r0, r0, #2, 18
        mov     r2, #2
        mov     r4, #7
        mvn     r6, r3
        sub     lr, r7, #2, 18
        mov     r12, #0xE
        str     r8, [sp]
        str     r3, [sp, #0x18]
        str     r1, [sp, #0x1C]
LDOA29:
        add     r1, sp, #0x20
        ldrsh   r1, [r1, +r12]
        add     r3, sp, #0x40
        mov     r8, r1, lsl #1
        ldrsh   r8, [r3, +r8]
        add     r3, r8, #1
        cmp     r6, r3
        ldrlt   r3, [sp, #0x18]
        mvnlt   r3, r3
        blt     LDOA30
        cmn     r3, #2, 18
        movge   r3, r3, lsl #16
        movge   r3, r3, asr #16
        movlt   r3, #0
        sublt   r3, r3, #2, 18
LDOA30:
        add     r8, sp, #0x40
        mov     r9, r1, lsl #1
        cmp     r0, r2
        strh    r3, [r8, +r9]
        mvnlt   r2, #2, 2
        blt     LDOA31
        cmn     r2, #1, 16
        movge   r2, r2, lsl #15
        movlt   r2, #2, 2
LDOA31:
        mov     r2, r2, asr #16
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #16
        mul     r2, r3, r2
        cmp     r2, #1, 2
        mvneq   r2, #2, 2
        movne   r2, r2, lsl #1
        cmp     r1, #0
        movle   r8, #0
        ble     LDOA35
        mov     r3, #0
        mov     r8, r3
LDOA32:
        add     r9, sp, #0x40
        ldrsh   r9, [r9, +r3]
        add     r8, r9, r8
        cmp     r6, r8
        blt     LDOA33
        cmn     r8, #2, 18
        movge   r8, r8, lsl #16
        movge   r8, r8, asr #16
        movlt   r8, #0
        sublt   r8, r8, #2, 18
        b       LDOA34
LDOA33:
        mvn     r8, #0xFF
        bic     r8, r8, #0x7F, 24
        mvn     r8, r8
LDOA34:
        subs    r1, r1, #1
        add     r3, r3, #2
        bne     LDOA32
LDOA35:
        cmp     r8, #0
        ble     LDOA53
        ldrsh   r1, [r5]
        mul     r8, r1, r8
        cmp     r8, #1, 2
        mvneq   r1, #2, 2
        movne   r1, r8, lsl #1
        cmp     r1, #0
        mov     r8, r1
        moveq   r3, #0
        beq     LDOA39
        cmn     r1, #1
        moveq   r1, #2, 2
        moveq   r3, #0x1F
        beq     LDOA39
        cmp     r1, #0
        mvnlt   r8, r1
        cmp     r8, #0
        moveq   r3, #0
        beq     LDOA38
        movs    r3, r8, lsr #16
        bne     LDOA36
        bic     r8, r8, #0xFF, 8
        bic     r3, r8, #0xFF, 16
        movs    r8, r3, asr #8
        movne   r3, r8, lsl #1
        ldrne   r8, [pc, #0x960]
        ldreq   r8, [pc, #0x960]
        moveq   r3, r3, lsl #1
        ldrsh   r3, [r8, +r3]
        add     r3, r3, #0x10
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
        b       LDOA38
LDOA36:
        movs    r8, r8, lsr #24
        bne     LDOA37
        ldr     r8, [pc, #0x93C]
        mov     r3, r3, lsl #1
        ldrsh   r3, [r8, +r3]
        b       LDOA38
LDOA37:
        ldr     r3, [pc, #0x928]
        mov     r8, r8, lsl #1
        ldrsh   r3, [r3, +r8]
LDOA38:
        mov     r1, r1, lsl r3
LDOA39:
        mov     r1, r1, asr #17
        sub     r3, r3, #1
        mov     r1, r1, lsl #16
        cmp     r2, #0
        mov     r1, r1, asr #16
        rsb     r9, r3, #0x1E
        mov     r8, r2
        moveq   r8, #0
        beq     LDOA42
        cmn     r2, #1
        moveq   r8, #0x1F
        beq     LDOA42
        cmp     r2, #0
        mvnlt   r8, r2
        cmp     r8, #0
        moveq   r8, #0
        beq     LDOA42
        movs    r3, r8, lsr #16
        bne     LDOA40
        bic     r8, r8, #0xFF, 8
        bic     r8, r8, #0xFF, 16
        movs    r10, r8, asr #8
        ldrne   r3, [pc, #0x8C0]
        movne   r8, r10, lsl #1
        ldreq   r3, [pc, #0x8BC]
        moveq   r8, r8, lsl #1
        ldrsh   r8, [r3, +r8]
        add     r3, r8, #0x10
        mov     r3, r3, lsl #16
        mov     r8, r3, asr #16
        b       LDOA42
LDOA40:
        movs    r8, r8, lsr #24
        bne     LDOA41
        ldr     r8, [pc, #0x898]
        mov     r3, r3, lsl #1
        ldrsh   r8, [r8, +r3]
        b       LDOA42
LDOA41:
        ldr     r3, [pc, #0x884]
        mov     r8, r8, lsl #1
        ldrsh   r8, [r3, +r8]
LDOA42:
        mov     r3, r2, lsl r8
        rsb     r8, r8, #0x1E
        mov     r3, r3, asr #16
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
        cmp     r1, r3
        bgt     LDOA48
        cmp     r1, #0
        blt     LDOA48
        cmp     r3, #0
        blt     LDOA48
        cmp     r3, #0
        moveq   r10, #0
        beq     LDOA49
        cmp     r1, #0
        moveq   r10, #0
        beq     LDOA49
        cmp     r1, r3
        bne     LDOA43
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r10, r1
        b       LDOA49
LDOA43:
        mov     r11, #0xF
        str     r11, [sp, #4]
        str     r12, [sp, #8]
        str     lr, [sp, #0x10]
        ldr     r12, [sp, #4]
        ldr     lr, [sp]
        mov     r10, #0
        str     r0, [sp, #0xC]
        str     r4, [sp, #0x14]
LDOA44:
        mov     r10, r10, lsl #1
        mov     r1, r1, lsl #1
        mov     r0, r10, lsl #16
        cmp     r1, r3
        mov     r10, r0, asr #16
        blt     LDOA47
        mov     r0, r1, asr #31
        subs    r1, r1, r3
        mvn     r4, #2, 2
        sbc     r0, r0, r3, asr #31
        subs    r4, r1, r4
        sbcs    r11, r0, #0
        movlt   r4, #0
        movlt   r11, #0
        orrs    r11, r4, r11
        mvnne   r1, #2, 2
        bne     LDOA45
        cmp     r1, #2, 2
        sbcs    r0, r0, lr
        movlt   r1, #2, 2
LDOA45:
        add     r10, r10, #1
        cmp     r6, r10
        blt     LDOA46
        cmn     r10, #2, 18
        movge   r0, r10, lsl #16
        movge   r10, r0, asr #16
        movlt   r0, #0
        sublt   r10, r0, #2, 18
        b       LDOA47
LDOA46:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r10, r0
LDOA47:
        subs    r12, r12, #1
        bne     LDOA44
        str     lr, [sp]
        ldr     r12, [sp, #8]
        ldr     r0, [sp, #0xC]
        ldr     lr, [sp, #0x10]
        ldr     r4, [sp, #0x14]
        b       LDOA49
LDOA48:
        mov     r10, #0
LDOA49:
        sub     r9, r9, r8
        mov     r1, r9, lsl #16
        mov     r1, r1, asr #16
        sub     r3, r1, #0xF
        cmp     r3, #0
        ble     LDOA55
        bic     r3, r3, #0xFF, 8
        bic     r3, r3, #0xFF, 16
        cmp     r10, r6, asr r3
        bgt     LDOA50
        cmp     r10, lr, asr r3
        movlt   r1, #0
        sublt   r1, r1, #2, 18
        blt     LDOA51
        mov     r3, r10, lsl r3
        mov     r1, r3, lsl #16
        mov     r1, r1, asr #16
        b       LDOA51
LDOA50:
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r1, r1
LDOA51:
        add     r1, r7, r1
        cmp     r6, r1
        blt     LDOA52
        cmn     r1, #2, 18
        movge   r1, r1, lsl #16
        movge   r7, r1, asr #16
        movlt   r1, #0
        sublt   r7, r1, #2, 18
        b       LDOA53
LDOA52:
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r7, r1
LDOA53:
        subs    r4, r4, #1
        sub     r5, r5, #2
        sub     r12, r12, #2
        bpl     LDOA29
        ldr     r1, [sp, #0x1C]
        strh    r7, [r1]
        add     sp, sp, #0x60
        ldmia   sp!, {r4 - r11, pc}
LDOA54:
        mvn     r8, #0xFF
        bic     r8, r8, #0x7F, 24
        mvn     r8, r8
        b       LDOA8
LDOA55:
        rsb     r1, r1, #0xF
        mov     r1, r10, asr r1
        mov     r1, r1, lsl #16
        add     r1, r7, r1, asr #16
        cmp     r6, r1
        blt     LDOA56
        cmn     r1, #2, 18
        movge   r1, r1, lsl #16
        movge   r7, r1, asr #16
        movlt   r1, #0
        sublt   r7, r1, #2, 18
        b       LDOA53
LDOA56:
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r7, r1
        b       LDOA53
LDOA57:
        add     r5, sp, #0x20
        strh    r8, [r5, +lr]
        b       LDOA25
LDOA58:
        ldrsh   r9, [r6, +r5]
        mvn     r8, r3
        add     r9, lr, r9
        cmp     r8, r9
        sublt   lr, r7, #2, 18
        mvnlt   lr, lr
        blt     LDOA18
        cmn     r9, #2, 18
        movge   r9, r9, lsl #16
        movge   lr, r9, asr #16
        movlt   lr, r3
        b       LDOA18
LDOA__ownRE8_Vor:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xD8
        ldr     r12, [sp, #0xFC]
        mov     lr, #0
        mov     r9, lr
        mvn     r8, #2, 2
        mvn     r7, #0
        mov     r6, r0
LDOA59:
        ldrsh   r4, [r6], #2
        mul     r4, r4, r4
        cmp     r4, #1, 2
        moveq   r10, r8
        movne   r10, r4, lsl #1
        add     r5, sp, #0x58
        cmp     r4, #1, 2
        str     r10, [r5, +r9, lsl #2]
        mvneq   r4, #2, 2
        movne   r4, r4, lsl #1
        mov     r5, lr, asr #31
        adds    lr, lr, r4
        adc     r5, r5, r4, asr #31
        subs    r10, lr, r8
        sbcs    r4, r5, #0
        movlt   r10, #0
        movlt   r4, #0
        orrs    r10, r10, r4
        mvn     r4, #2, 2
        movne   lr, r4
        bne     LDOA60
        cmp     lr, #2, 2
        sbcs    r5, r5, r7
        movlt   lr, #2, 2
LDOA60:
        add     r9, r9, #1
        cmp     r9, #8
        blt     LDOA59
        mov     r5, #0xFF
        orr     r6, r5, #0x7F, 24
        add     r5, r6, #0x1E, 18
        cmp     r5, lr
        movlt   lr, r4
        blt     LDOA61
        cmn     lr, #2, 14
        movge   lr, lr, lsl #12
        movlt   lr, #2, 2
LDOA61:
        mov     lr, lr, asr #16
        mov     lr, lr, lsl #16
        movs    lr, lr, asr #16
        moveq   lr, #0x24
        beq     LDOA69
        cmp     lr, #0x20
        movgt   lr, #0x25
        bgt     LDOA69
        mov     r5, #0
        add     r6, r6, #2, 18
        mov     r9, r5
        mvn     r8, #0
LDOA62:
        add     r7, sp, #0x58
        ldr     r7, [r7, +r9, lsl #2]
        cmp     r6, r7
        movlt   r7, r4
        blt     LDOA63
        cmn     r7, #1, 16
        movge   r7, r7, lsl #15
        movlt   r7, #2, 2
LDOA63:
        mov     r7, r7, asr #16
        mov     r7, r7, lsl #16
        mov     r7, r7, asr #16
        mul     r7, r7, r7
        cmp     r7, #1, 2
        mvneq   r7, #2, 2
        movne   r7, r7, lsl #1
        mov     r10, r5, asr #31
        adds    r5, r5, r7
        adc     r7, r10, r7, asr #31
        subs    r11, r5, r4
        sbcs    r10, r7, #0
        movlt   r11, #0
        movlt   r10, #0
        orrs    r10, r11, r10
        mvnne   r5, #2, 2
        bne     LDOA64
        cmp     r5, #2, 2
        sbcs    r7, r7, r8
        movlt   r5, #2, 2
LDOA64:
        add     r9, r9, #1
        cmp     r9, #8
        blt     LDOA62
        mov     r4, #0xFF
        orr     r4, r4, #0x7F, 24
        add     r4, r4, #0x1E, 18
        cmp     r4, r5
        mvn     r4, #2, 2
        movlt   r6, r4
        blt     LDOA65
        cmn     r5, #2, 14
        movge   r6, r5, lsl #12
        movlt   r6, #2, 2
LDOA65:
        mvn     r5, #0xFF
        bic     r5, r5, #0x7F, 24
        sub     lr, lr, #1
        mov     r6, r6, asr #16
        mvn     r7, r5
        cmp     r7, lr
        mov     r6, r6, lsl #16
        mvnlt   r7, r5
        blt     LDOA66
        cmn     lr, #2, 18
        movge   r7, lr, lsl #16
        movge   r7, r7, asr #16
        movlt   r7, r4, lsl #15
LDOA66:
        ldr     r8, [pc, #0x474]
        mvn     r9, r5
        cmp     r9, lr
        mov     r7, r7, lsl #1
        sub     r9, r8, #0x80
        ldrsh   r7, [r9, +r7]
        mvnlt   r4, r5
        blt     LDOA67
        cmn     lr, #2, 18
        movge   lr, lr, lsl #16
        movge   r4, lr, asr #16
        movlt   r4, r4, lsl #15
LDOA67:
        mov     lr, r4, lsl #1
        sub     r4, r8, #0x40
        ldrsh   lr, [r4, +lr]
        cmp     r7, #0
        movle   lr, #0x25
        ble     LDOA69
        mov     r4, #0
LDOA68:
        mov     r5, lr, lsl #16
        mov     r5, r5, asr #15
        ldrsh   r5, [r8, +r5]
        cmp     r5, r6, asr #16
        beq     LDOA69
        add     r4, r4, #1
        cmp     r4, r7
        add     lr, lr, #1
        blt     LDOA68
        mov     lr, #0x25
LDOA69:
        ldr     r4, [pc, #0x404]
        strh    lr, [r12]
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #15
        ldrsh   lr, [r4, +lr]
        cmp     lr, #4
        strh    lr, [r1]
        bgt     LDOA70
        ldrsh   r1, [r0]
        strh    r1, [r3]
        ldrsh   r1, [r0, #2]
        strh    r1, [r3, #2]
        ldrsh   r1, [r0, #4]
        strh    r1, [r3, #4]
        ldrsh   r1, [r0, #6]
        strh    r1, [r3, #6]
        ldrsh   r1, [r0, #8]
        strh    r1, [r3, #8]
        ldrsh   r1, [r0, #0xA]
        strh    r1, [r3, #0xA]
        ldrsh   r1, [r0, #0xC]
        strh    r1, [r3, #0xC]
        ldrsh   r0, [r0, #0xE]
        strh    r0, [r3, #0xE]
        add     sp, sp, #0xD8
        ldmia   sp!, {r4 - r11, pc}
LDOA70:
        mov     r4, #0
        mvn     lr, #2, 2
        mvn     r7, #0
        mov     r5, r0
        mov     r6, #8
LDOA71:
        ldrsh   r8, [r5], #2
        mul     r8, r8, r8
        cmp     r8, #1, 2
        moveq   r8, lr
        movne   r8, r8, lsl #1
        mov     r9, r4, asr #31
        adds    r4, r4, r8
        adc     r8, r9, r8, asr #31
        subs    r10, r4, lr
        sbcs    r9, r8, #0
        movlt   r10, #0
        movlt   r9, #0
        orrs    r9, r10, r9
        movne   r4, lr
        bne     LDOA72
        cmp     r4, #2, 2
        sbcs    r8, r8, r7
        movlt   r4, #2, 2
LDOA72:
        subs    r6, r6, #1
        bne     LDOA71
        mov     r4, r4, asr #6
        cmp     r4, #0xB
        mov     r7, #1
        ble     LDOA74
LDOA73:
        add     r7, r7, #1
        mov     r4, r4, asr #2
        mov     r7, r7, lsl #16
        cmp     r4, #0xB
        mov     r7, r7, asr #16
        bgt     LDOA73
LDOA74:
        ldrsh   r9, [r0, #0xE]
        add     r5, sp, #0xA8
        mov     r4, r9, lsl #1
        cmp     r4, #1, 2
        strh    r9, [r5, #0xE]
        moveq   r5, lr
        movne   r5, r9, lsl #2
        adds    r4, r9, r5
        mov     r5, r5, asr #31
        adc     r5, r5, r9, asr #31
        subs    r6, r4, lr
        sbcs    r8, r5, #0
        movlt   r6, #0
        movlt   r8, #0
        orrs    r8, r6, r8
        movne   r4, lr
        bne     LDOA75
        cmp     r4, #2, 2
        mvn     lr, #0
        sbcs    r5, r5, lr
        movlt   r4, #2, 2
LDOA75:
        mvn     lr, #0xFF
        mov     r4, r4, lsl #16
        bic     lr, lr, #0x7F, 24
        mov     r4, r4, asr #16
        mvn     lr, lr
        mov     r8, #6
        mov     r6, #0xC
        add     r5, r0, #0xC
        str     r0, [sp, #4]
LDOA76:
        ldrsh   r10, [r5], #-2
        sub     r0, r10, r9
        cmp     lr, r0
        blt     LDOA77
        cmn     r0, #2, 18
        movge   r0, r0, lsl #16
        movge   r0, r0, asr #16
        mvnlt   r0, #2, 2
        movlt   r0, r0, lsl #15
        b       LDOA78
LDOA77:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r0, r0
LDOA78:
        mov     r0, r0, lsl #16
        sub     r4, r4, r10
        add     r11, sp, #0xA8
        mov     r0, r0, asr #17
        cmp     lr, r4
        strh    r0, [r11, +r6]
        blt     LDOA79
        cmn     r4, #2, 18
        movge   r4, r4, lsl #16
        movge   r4, r4, asr #16
        mvnlt   r0, #2, 2
        movlt   r4, r0, lsl #15
        b       LDOA80
LDOA79:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r4, r0
LDOA80:
        sub     r8, r8, #1
        cmp     r8, #1
        sub     r6, r6, #2
        bge     LDOA76
        ldr     r0, [sp, #4]
        mvn     r5, #0xFF
        bic     r5, r5, #0x7F, 24
        ldrsh   lr, [r0]
        add     r4, lr, r4
        mvn     lr, r5
        cmp     lr, r4
        mvn     lr, #2, 2
        mvnlt   r6, r5
        blt     LDOA81
        cmn     r4, #2, 18
        movge   r4, r4, lsl #16
        movge   r6, r4, asr #16
        movlt   r6, lr, lsl #15
LDOA81:
        mov     r8, r6, lsl #16
        add     r4, sp, #0xA8
        mov     r8, r8, asr #18
        bic     r6, r7, #0xFF, 8
        strh    r8, [r4]
        mvn     r4, r5
        bic     r6, r6, #0xFF, 16
        mov     r4, r4, asr r6
        cmp     r4, #1
        mov     r4, lr, lsl #15
        mov     r8, r4, asr r6
        mov     r4, r7
        mvnlt   r6, r5
        blt     LDOA82
        cmp     r8, #1
        movgt   r6, lr, lsl #15
        bgt     LDOA82
        mov     r8, #1
        mov     r6, r8, lsl r6
        mov     r6, r6, lsl #16
        mov     r6, r6, asr #16
LDOA82:
        sub     r6, r6, #1
        mvn     r8, r5
        cmp     r8, r6
        mvnlt   r6, r5
        blt     LDOA83
        cmn     r6, #2, 18
        movge   r6, r6, lsl #16
        movge   r6, r6, asr #16
        movlt   r6, lr, lsl #15
LDOA83:
        ldr     r8, [pc, #0x160]
        mov     r9, #0xFF
        mvn     r10, #0
        orr     r9, r9, #0x7F, 24
        str     r10, [sp, #0x34]
        add     r10, r9, #0x1E, 18
        sub     r11, r8, #0x80
        sub     r8, r8, #0x40
        str     r10, [sp, #0x30]
        add     r10, r9, #2, 18
        str     r8, [sp, #0x24]
        sub     r9, r9, #1, 18
        mov     r8, #2
        mvn     r5, r5
        str     r11, [sp, #0x28]
        str     r8, [sp, #0x2C]
        str     r9, [sp, #8]
        str     r10, [sp, #0x1C]
        str     lr, [sp, #0x20]
        str     r12, [sp, #0x18]
        str     r3, [sp, #0xC]
        str     r2, [sp, #0x10]
        str     r1, [sp, #0x14]
        str     r0, [sp, #4]
LDOA84:
        add     r0, sp, #0xA8
        ldrsh   r0, [r0]
        add     r2, sp, #0xA8
        ldrsh   r2, [r2, #2]
        and     r0, r0, r6
        add     r3, sp, #0xA8
        ldrsh   r3, [r3, #4]
        add     r11, sp, #0xB8
        strh    r0, [r11]
        add     r0, sp, #0xB8
        and     r2, r2, r6
        add     r12, sp, #0xA8
        ldrsh   r12, [r12, #6]
        strh    r2, [r0, #2]
        add     r0, sp, #0xB8
        add     lr, sp, #0xA8
        ldrsh   lr, [lr, #8]
        and     r3, r3, r6
        strh    r3, [r0, #4]
        add     r0, sp, #0xB8
        and     r12, r12, r6
        add     r8, sp, #0xA8
        ldrsh   r8, [r8, #0xA]
        strh    r12, [r0, #6]
        add     r0, sp, #0xB8
        add     r9, sp, #0xA8
        ldrsh   r9, [r9, #0xC]
        and     lr, lr, r6
        strh    lr, [r0, #8]
        add     r0, sp, #0xB8
        add     r10, sp, #0xA8
        ldrsh   r10, [r10, #0xE]
        and     r8, r8, r6
        strh    r8, [r0, #0xA]
        add     r0, sp, #0xB8
        and     r9, r9, r6
        strh    r9, [r0, #0xC]
        add     r0, sp, #0xB8
        and     r10, r10, r6
        strh    r10, [r0, #0xE]
        add     r2, sp, #0x98
        add     r0, sp, #0xB8
        mov     r1, r4
        bl      ownRe8_k2y
        ldr     r0, [sp, #4]
        mov     r3, #0
        mov     r2, #8
LDOA85:
        add     lr, sp, #0x98
        ldrsh   r12, [r0], #2
        ldrsh   lr, [lr, +r3]
        sub     r12, r12, lr
        cmp     r5, r12
        blt     LDOA86
        cmn     r12, #2, 18
        movge   r12, r12, lsl #16
        movge   lr, r12, asr #16
        mvnlt   r12, #2, 2
        movlt   lr, r12, lsl #15
        b       LDOA87
        .long   Ia_
        .long   Ds_
        .long   Is_
        .long   ownTab_pow2
        .long   ownTab_factorial
        .long   NormTable
        .long   NormTable2
        .long   LDOA_Da_id_
        .long   LDOA_Da_nq_
LDOA86:
        mvn     r12, #0xFF
        bic     r12, r12, #0x7F, 24
        mvn     lr, r12
LDOA87:
        add     r12, sp, #0xC8
        mov     lr, lr, asr r4
        strh    lr, [r12, +r3]
        subs    r2, r2, #1
        add     r3, r3, #2
        bne     LDOA85
        ldr     r12, [sp, #0x34]
        ldr     lr, [sp, #0x20]
        mov     r3, #0
        mov     r0, r3
        mov     r2, r0
LDOA88:
        add     r8, sp, #0xC8
        ldrsh   r8, [r8, +r3]
        mul     r8, r8, r8
        cmp     r8, #1, 2
        mvneq   r9, #2, 2
        movne   r9, r8, lsl #1
        add     r10, sp, #0x78
        cmp     r8, #1, 2
        str     r9, [r10, +r2, lsl #2]
        mvneq   r8, #2, 2
        movne   r8, r8, lsl #1
        mov     r9, r0, asr #31
        adds    r0, r0, r8
        adc     r8, r9, r8, asr #31
        subs    r9, r0, lr
        sbcs    r10, r8, #0
        movlt   r9, #0
        movlt   r10, #0
        orrs    r10, r9, r10
        mvnne   r0, #2, 2
        bne     LDOA89
        cmp     r0, #2, 2
        sbcs    r8, r8, r12
        movlt   r0, #2, 2
LDOA89:
        add     r2, r2, #1
        cmp     r2, #8
        add     r3, r3, #2
        blt     LDOA88
        ldr     r2, [sp, #0x30]
        cmp     r2, r0
        mvnlt   r0, #2, 2
        blt     LDOA90
        cmn     r0, #2, 14
        movge   r0, r0, lsl #12
        movlt   r0, #2, 2
LDOA90:
        mov     r0, r0, asr #16
        mov     r0, r0, lsl #16
        movs    r0, r0, asr #16
        moveq   r2, #0x24
        beq     LDOA100
        cmp     r0, #0x20
        movgt   r2, #0x25
        bgt     LDOA100
        ldr     r12, [sp, #0x1C]
        ldr     lr, [sp, #0x34]
        ldr     r8, [sp, #0x20]
        mov     r2, #0
        mov     r3, r2
LDOA91:
        add     r9, sp, #0x78
        ldr     r9, [r9, +r3, lsl #2]
        cmp     r12, r9
        mvnlt   r9, #2, 2
        blt     LDOA92
        cmn     r9, #1, 16
        movge   r9, r9, lsl #15
        movlt   r9, #2, 2
LDOA92:
        mov     r9, r9, asr #16
        mov     r9, r9, lsl #16
        mov     r9, r9, asr #16
        mul     r9, r9, r9
        cmp     r9, #1, 2
        mvneq   r9, #2, 2
        movne   r9, r9, lsl #1
        mov     r10, r2, asr #31
        adds    r2, r2, r9
        adc     r9, r10, r9, asr #31
        subs    r10, r2, r8
        sbcs    r11, r9, #0
        movlt   r10, #0
        movlt   r11, #0
        orrs    r11, r10, r11
        mvnne   r2, #2, 2
        bne     LDOA93
        cmp     r2, #2, 2
        sbcs    r9, r9, lr
        movlt   r2, #2, 2
LDOA93:
        add     r3, r3, #1
        cmp     r3, #8
        blt     LDOA91
        ldr     r3, [sp, #0x30]
        cmp     r3, r2
        mvnlt   r3, #2, 2
        blt     LDOA94
        cmn     r2, #2, 14
        movge   r3, r2, lsl #12
        movlt   r3, #2, 2
LDOA94:
        sub     r2, r0, #1
        mov     r3, r3, asr #16
        cmp     r5, r2
        mov     r0, r3, lsl #16
        blt     LDOA95
        cmn     r2, #2, 18
        movge   r3, r2, lsl #16
        movge   r3, r3, asr #16
        mvnlt   r3, #2, 2
        movlt   r3, r3, lsl #15
        b       LDOA96
LDOA95:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r3, r3
LDOA96:
        ldr     r12, [sp, #0x28]
        mov     r3, r3, lsl #1
        cmp     r5, r2
        ldrsh   r3, [r12, +r3]
        blt     LDOA97
        cmn     r2, #2, 18
        movge   r2, r2, lsl #16
        movge   r2, r2, asr #16
        mvnlt   r2, #2, 2
        movlt   r2, r2, lsl #15
        b       LDOA98
LDOA97:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r2, r2
LDOA98:
        ldr     r12, [sp, #0x24]
        mov     r2, r2, lsl #1
        cmp     r3, #0
        ldrsh   r2, [r12, +r2]
        movle   r2, #0x25
        ble     LDOA100
        ldr     r12, [pc, #-0x228]
        mov     lr, #0
LDOA99:
        mov     r8, r2, lsl #16
        mov     r8, r8, asr #15
        ldrsh   r8, [r12, +r8]
        cmp     r8, r0, asr #16
        beq     LDOA100
        add     lr, lr, #1
        cmp     lr, r3
        add     r2, r2, #1
        blt     LDOA99
        mov     r2, #0x25
LDOA100:
        ldr     r3, [pc, #-0x254]
        mov     r0, r2, lsl #16
        mov     r0, r0, asr #15
        ldrsh   r3, [r3, +r0]
        cmp     r3, #4
        bgt     LDOA110
        mov     r0, #3
        cmp     r3, #3
        movgt   r0, r3
        ldr     r3, [sp, #8]
        cmp     r3, r7
        ldr     r3, [sp, #0x18]
        strh    r2, [r3]
        blt     LDOA101
        cmn     r7, #1, 18
        mvnlt   r2, #2, 2
        movlt   r2, r2, lsl #15
        blt     LDOA102
        mov     r2, r7, lsl #1
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #16
        b       LDOA102
LDOA101:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r2, r2
LDOA102:
        add     r2, r0, r2
        cmp     r5, r2
        blt     LDOA104
        cmn     r2, #2, 18
        bge     LDOA103
        mvn     r0, #2, 2
        mov     r0, r0, lsl #15
        str     r0, [sp]
        b       LDOA105
LDOA103:
        mov     r0, r2, lsl #16
        mov     r0, r0, asr #16
        str     r0, [sp]
        b       LDOA105
LDOA104:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r0, r0
        str     r0, [sp]
LDOA105:
        ldr     r1, [sp]
        add     r0, sp, #0xB8
        ldrsh   r3, [r0]
        add     r0, sp, #0xB8
        ldrsh   r0, [r0, #2]
        add     lr, sp, #0xC8
        add     r8, sp, #0xC8
        add     r2, sp, #0xB8
        str     r0, [sp, #0x38]
        ldrsh   r2, [r2, #6]
        add     r0, sp, #0xB8
        ldrsh   r0, [r0, #4]
        str     r2, [sp, #0x3C]
        add     r2, sp, #0xB8
        ldrsh   r2, [r2, #8]
        add     r12, sp, #0xC8
        add     r11, sp, #0xC8
        str     r2, [sp, #0x40]
        add     r2, sp, #0xB8
        ldrsh   r2, [r2, #0xA]
        sub     r7, r7, #1
        cmp     r5, r7
        str     r2, [sp, #0x44]
        add     r2, sp, #0xB8
        ldrsh   r2, [r2, #0xC]
        str     r2, [sp, #0x48]
        ldrsh   r9, [r12]
        add     r12, sp, #0xC8
        add     r2, sp, #0xB8
        ldrsh   r12, [r12, #2]
        ldrsh   r2, [r2, #0xE]
        str     r12, [sp, #0x4C]
        ldrsh   lr, [lr, #8]
        ldrsh   r8, [r8, #0xA]
        add     r12, sp, #0xC8
        ldrsh   r10, [r12, #4]
        add     r12, sp, #0xC8
        ldrsh   r12, [r12, #6]
        ldrsh   r11, [r11, #0xC]
        str     r11, [sp, #0x50]
        add     r11, sp, #0xC8
        ldrsh   r11, [r11, #0xE]
        str     r11, [sp, #0x54]
        ldr     r11, [sp, #0x14]
        strh    r1, [r11]
        ldr     r11, [sp, #0x10]
        strh    r3, [r11]
        ldr     r3, [sp, #0x38]
        strh    r0, [r11, #4]
        strh    r3, [r11, #2]
        ldr     r0, [sp, #0x3C]
        strh    r0, [r11, #6]
        ldr     r0, [sp, #0x40]
        strh    r0, [r11, #8]
        ldr     r0, [sp, #0x44]
        strh    r0, [r11, #0xA]
        ldr     r0, [sp, #0x48]
        strh    r2, [r11, #0xE]
        strh    r0, [r11, #0xC]
        ldr     r0, [sp, #0xC]
        strh    r9, [r0]
        ldr     r2, [sp, #0x4C]
        strh    r10, [r0, #4]
        strh    r12, [r0, #6]
        strh    r2, [r0, #2]
        strh    lr, [r0, #8]
        strh    r8, [r0, #0xA]
        ldr     r2, [sp, #0x50]
        strh    r2, [r0, #0xC]
        ldr     r2, [sp, #0x54]
        strh    r2, [r0, #0xE]
        blt     LDOA106
        cmn     r7, #2, 18
        movge   r7, r7, lsl #16
        movge   r7, r7, asr #16
        mvnlt   r0, #2, 2
        movlt   r7, r0, lsl #15
        b       LDOA107
LDOA106:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r7, r0
LDOA107:
        sub     r4, r4, #1
        cmp     r5, r4
        blt     LDOA108
        cmn     r4, #2, 18
        movge   r0, r4, lsl #16
        movge   r4, r0, asr #16
        mvnlt   r0, #2, 2
        movlt   r4, r0, lsl #15
        b       LDOA109
LDOA108:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r4, r0
LDOA109:
        mov     r6, r6, asr #1
        b       LDOA118
LDOA110:
        add     r7, r7, #1
        cmp     r5, r7
        blt     LDOA111
        cmn     r7, #2, 18
        movge   r0, r7, lsl #16
        movge   r7, r0, asr #16
        mvnlt   r0, #2, 2
        movlt   r7, r0, lsl #15
        b       LDOA112
LDOA111:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r7, r0
LDOA112:
        add     r4, r4, #1
        cmp     r5, r4
        blt     LDOA113
        cmn     r4, #2, 18
        movge   r0, r4, lsl #16
        movge   r4, r0, asr #16
        mvnlt   r0, #2, 2
        movlt   r4, r0, lsl #15
        b       LDOA114
LDOA113:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r4, r0
LDOA114:
        ldr     r0, [sp, #8]
        cmp     r0, r6
        blt     LDOA115
        cmn     r6, #1, 18
        mvnlt   r0, #2, 2
        movlt   r0, r0, lsl #15
        blt     LDOA116
        mov     r6, r6, lsl #1
        mov     r0, r6, lsl #16
        mov     r0, r0, asr #16
        b       LDOA116
LDOA115:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r0, r0
LDOA116:
        add     r0, r0, #1
        cmp     r5, r0
        blt     LDOA117
        cmn     r0, #2, 18
        movge   r0, r0, lsl #16
        movge   r6, r0, asr #16
        mvnlt   r0, #0xFF
        biclt   r6, r0, #0x7F, 24
        b       LDOA118
LDOA117:
        mvn     r0, #2, 2
        mov     r0, r0, lsl #15
        mvn     r6, r0
LDOA118:
        ldr     r0, [sp, #0x2C]
        subs    r0, r0, #1
        str     r0, [sp, #0x2C]
        bne     LDOA84
        add     sp, sp, #0xD8
        ldmia   sp!, {r4 - r11, pc}


        .data
        .align  4


LDOA_Da_nq_:
        .byte   0x02,0x00,0x02,0x00,0x03,0x00,0x03,0x00,0x02,0x00,0x04,0x00,0x04,0x00,0x03,0x00
        .byte   0x04,0x00,0x04,0x00,0x04,0x00,0x03,0x00,0x04,0x00,0x04,0x00,0x04,0x00,0x04,0x00
        .byte   0x04,0x00,0x03,0x00,0x04,0x00,0x04,0x00,0x04,0x00,0x04,0x00,0x03,0x00,0x04,0x00
        .byte   0x04,0x00,0x04,0x00,0x04,0x00,0x04,0x00,0x04,0x00,0x04,0x00,0x04,0x00,0x04,0x00
        .byte   0x04,0x00,0x04,0x00,0x04,0x00,0x04,0x00,0x00,0x00,0x64,0x00


        .data
        .align  4


LDOA_Da_nb_:
        .byte   0x02,0x00,0x03,0x00,0x03,0x00,0x05,0x00,0x05,0x00,0x02,0x00,0x02,0x00,0x01,0x00
        .byte   0x02,0x00,0x01,0x00,0x01,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x00,0x00,0x01,0x00
        .byte   0x01,0x00,0x01,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x02,0x00,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x00
LDOA_Da_pos_:
        .byte   0x00,0x00,0x02,0x00,0x05,0x00,0x08,0x00,0x0D,0x00,0x12,0x00,0x14,0x00,0x16,0x00
        .byte   0x17,0x00,0x19,0x00,0x1A,0x00,0x1B,0x00,0x1B,0x00,0x1C,0x00,0x1C,0x00,0x1C,0x00
        .byte   0x1D,0x00,0x1E,0x00,0x1F,0x00,0x1F,0x00,0x20,0x00,0x20,0x00,0x20,0x00,0x20,0x00
        .byte   0x20,0x00,0x22,0x00,0x23,0x00,0x23,0x00,0x23,0x00,0x23,0x00,0x23,0x00,0x23,0x00
LDOA_Da_id_:
        .byte   0x01,0x00,0x04,0x00,0x08,0x00,0x0B,0x00,0x20,0x00,0x0C,0x00,0x15,0x00,0x24,0x00
        .byte   0x10,0x00,0x1F,0x00,0x28,0x00,0x40,0x00,0x4F,0x00,0x29,0x00,0x2C,0x00,0x44,0x00
        .byte   0x59,0x00,0xA4,0x00,0x60,0x00,0xA8,0x00,0xC4,0x00,0x2D,0x01,0x00,0x02,0x44,0x01
        .byte   0x04,0x02,0x20,0x02,0x35,0x03,0xE4,0x04,0x00,0x04,0x84,0x05,0x20,0x0A,0x40,0x0A
        .byte   0xC4,0x09,0xC4,0x12,0x20,0x0C,0x00,0x20


