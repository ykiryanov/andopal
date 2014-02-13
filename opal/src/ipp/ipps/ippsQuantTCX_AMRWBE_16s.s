        .text
        .align  4
        .globl  _ippsQuantTCX_AMRWBE_16s


_ippsQuantTCX_AMRWBE_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x97, 30
        ldr     r9, [sp, #0x280]
        mov     r5, r0
        cmp     r5, #0
        mov     r6, r1
        mov     r4, r2
        mov     r8, r3
        beq     LDGL63
        cmp     r6, #0
        beq     LDGL63
        cmp     r9, #0
        beq     LDGL63
        cmp     r8, #0
        ble     LDGL62
        cmp     r4, #0
        ble     LDGL62
        cmp     r4, #0
        ble     LDGL3
        mov     r0, #0
        str     r6, [sp, #4]
        mov     r11, r0
        mvn     r10, #2, 2
        mvn     r7, #0
        mov     r6, r0
LDGL0:
        mov     r0, #4
        add     r12, r5, r6, lsl #4
        mov     lr, #8
LDGL1:
        ldrsh   r1, [r12], #2
        mul     r1, r1, r1
        cmp     r1, #1, 2
        mvneq   r1, #2, 2
        movne   r1, r1, lsl #1
        mov     r2, r0, asr #31
        adds    r0, r0, r1
        adc     r1, r2, r1, asr #31
        subs    r3, r0, r10
        sbcs    r2, r1, #0
        movlt   r3, #0
        movlt   r2, #0
        orrs    r2, r3, r2
        mvnne   r0, #2, 2
        bne     LDGL2
        cmp     r0, #2, 2
        sbcs    r1, r1, r7
        movlt   r0, #2, 2
LDGL2:
        subs    lr, lr, #1
        bne     LDGL1
        add     r2, sp, #0x95, 30
        add     r1, sp, #0x96, 30
        bl      ownLog2
        add     r1, sp, #2, 24
        ldrsh   r1, [r1, #0x58]
        add     r12, sp, #2, 24
        ldrsh   r12, [r12, #0x54]
        sub     r1, r1, #2
        add     r11, r11, #1
        add     r0, sp, #0x24
        mov     r1, r1, lsl #16
        add     lr, sp, #2, 24
        add     r12, r12, r12, lsl #2
        mov     r1, r1, asr #16
        strh    r1, [lr, #0x58]
        mov     r12, r12, lsl #3
        add     r1, r1, r1, lsl #2
        mov     r12, r12, asr #15
        add     r1, r12, r1, lsl #3
        mov     r6, r6, lsl #1
        mov     r1, r1, lsl #1
        strh    r1, [r0, +r6]
        mov     r1, r11, lsl #16
        mov     r6, r1, asr #16
        cmp     r4, r6
        bgt     LDGL0
        ldr     r6, [sp, #4]
LDGL3:
        mov     lr, r4, lsl #16
        mvn     r12, #0xFF
        mov     r7, lr, asr #16
        bic     r12, r12, #0x7F, 24
        mov     r8, r8, lsl #16
        mvn     r3, r12
        rsb     lr, r7, r8, asr #16
        cmp     r3, lr
        mvn     r3, #2, 2
        mvnlt   lr, r12
        blt     LDGL4
        cmn     lr, #2, 18
        movge   lr, lr, lsl #16
        movge   lr, lr, asr #16
        movlt   lr, r3, lsl #15
LDGL4:
        mov     r8, #0x9A
        orr     r8, r8, #0x79, 24
        mul     r8, lr, r8
        cmp     r8, #1, 2
        moveq   lr, r3
        movne   lr, r8, lsl #1
        cmn     lr, #0x7E, 6
        bgt     LDGL5
        cmp     lr, #0x3E, 6
        movge   r3, lr, lsl #4
        movlt   r3, #2, 2
LDGL5:
        sub     lr, r12, #2, 2
        cmp     lr, r3
        mvnle   r3, r12
        ble     LDGL6
        add     r3, r3, #2, 18
        mov     r3, r3, asr #16
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
LDGL6:
        mov     r8, #0
        str     r8, [sp, #0x1C]
        ldr     r1, [sp, #0x1C]
        mvn     r12, r12
        mov     lr, #2, 22
        mov     r10, #0
        mov     r8, #0xA
        str     r5, [sp]
LDGL7:
        add     r1, lr, r1
        cmp     r12, r1
        blt     LDGL8
        cmn     r1, #2, 18
        movge   r0, r1, lsl #16
        movge   r1, r0, asr #16
        mvnlt   r0, #2, 2
        movlt   r1, r0, lsl #15
        b       LDGL9
LDGL8:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r1, r0
LDGL9:
        cmp     r4, #0
        movle   r0, #0
        ble     LDGL15
        mov     r2, #0
        mov     r0, r2
        mov     r5, r0
LDGL10:
        mov     r2, r2, lsl #1
        add     r11, sp, #0x24
        ldrsh   r2, [r11, +r2]
        sub     r11, r2, r1
        cmp     r12, r11
        blt     LDGL11
        cmn     r11, #2, 18
        movge   r11, r11, lsl #16
        movge   r11, r11, asr #16
        mvnlt   r11, #2, 2
        movlt   r11, r11, lsl #15
        b       LDGL12
LDGL11:
        mvn     r11, #0xFF
        bic     r11, r11, #0x7F, 24
        mvn     r11, r11
LDGL12:
        cmp     r11, #0
        movlt   r11, r10
        add     r0, r11, r0
        cmp     r12, r0
        blt     LDGL13
        cmn     r0, #2, 18
        movge   r0, r0, lsl #16
        movge   r0, r0, asr #16
        mvnlt   r0, #2, 2
        movlt   r0, r0, lsl #15
        b       LDGL14
LDGL13:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r0, r0
LDGL14:
        add     r5, r5, #1
        mov     r11, r5, lsl #16
        mov     r2, r11, asr #16
        cmp     r4, r2
        bgt     LDGL10
LDGL15:
        sub     r0, r0, r3
        cmp     r12, r0
        blt     LDGL16
        cmn     r0, #2, 18
        movge   r0, r0, lsl #16
        movge   r0, r0, asr #16
        mvnlt   r0, #2, 2
        movlt   r0, r0, lsl #15
        b       LDGL17
LDGL16:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r0, r0
LDGL17:
        cmp     r0, #0
        ble     LDGL60
LDGL18:
        mov     lr, lr, lsl #14
        subs    r8, r8, #1
        mov     r0, lr, asr #15
        mov     r0, r0, lsl #16
        mov     lr, r0, asr #16
        bne     LDGL7
        str     r1, [sp, #0x1C]
        ldr     r3, [sp, #0x1C]
        ldr     r5, [sp]
        mvn     r11, #2, 2
        rsb     r3, r3, r3, lsl #2
        add     r3, r3, r3, lsl #4
        add     r3, r3, r3, lsl #8
        cmp     r3, #1, 2
        moveq   r3, r11
        movne   r3, r3, lsl #1
        mvn     r12, #0xFF
        bic     r10, r12, #0x7F, 24
        mvn     r12, r10
        and     r1, r12, r3, asr #7
        mov     r0, #0xE
        mov     r8, r3, asr #22
        bl      ownPow2
        mov     r8, r8, lsl #16
        mov     r0, r0, lsl #16
        mov     r12, r8, asr #16
        cmp     r12, #0
        mov     r3, r0, asr #16
        rsble   r12, r12, #0
        movle   r3, r3, asr r12
        ble     LDGL19
        bic     r12, r12, #0xFF, 8
        bic     r12, r12, #0xFF, 16
        cmp     r3, r11, asr r12
        mov     lr, #2, 2
        movgt   r3, r11
        bgt     LDGL19
        cmp     r3, lr, asr r12
        movge   r3, r3, lsl r12
        movlt   r3, #2, 2
LDGL19:
        cmp     r3, #0
        mov     r12, #0
        mov     lr, r3
        beq     LDGL23
        cmn     r3, #1
        moveq   r3, #2, 2
        moveq   r12, #0x1F
        beq     LDGL23
        cmp     r3, #0
        mvnlt   lr, r3
        cmp     lr, #0
        beq     LDGL22
        movs    r12, lr, lsr #16
        bne     LDGL20
        bic     lr, lr, #0xFF, 8
        bic     lr, lr, #0xFF, 16
        movs    r8, lr, asr #8
        ldrne   r12, [pc, #0x8B8]
        movne   lr, r8, lsl #1
        ldreq   r12, [pc, #0x8B4]
        moveq   lr, lr, lsl #1
        ldrsh   lr, [r12, +lr]
        add     r12, lr, #0x10
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        b       LDGL22
LDGL20:
        movs    lr, lr, lsr #24
        bne     LDGL21
        ldr     lr, [pc, #0x890]
        mov     r12, r12, lsl #1
        ldrsh   r12, [lr, +r12]
        b       LDGL22
LDGL21:
        ldr     r12, [pc, #0x87C]
        mov     lr, lr, lsl #1
        ldrsh   r12, [r12, +lr]
LDGL22:
        mov     r3, r3, lsl r12
LDGL23:
        mov     r3, r3, asr #16
        rsb     r12, r12, #0x11
        mov     r3, r3, lsl #16
        mov     r12, r12, lsl #16
        mov     r3, r3, asr #16
        cmp     r3, #1, 18
        mov     r12, r12, asr #16
        mov     r8, #0
        blt     LDGL28
        cmp     r3, #0
        blt     LDGL28
        cmp     r3, #0
        beq     LDGL28
        cmp     r3, #1, 18
        mvneq   r8, r10
        beq     LDGL28
        mvn     r10, r10
        mov     lr, #1, 18
        mvn     r1, #0
        mov     r0, #0xF
        str     r6, [sp, #4]
        str     r5, [sp]
LDGL24:
        mov     r8, r8, lsl #1
        mov     lr, lr, lsl #1
        mov     r8, r8, lsl #16
        cmp     lr, r3
        mov     r8, r8, asr #16
        blt     LDGL27
        mov     r5, lr, asr #31
        subs    lr, lr, r3
        sbc     r5, r5, r3, asr #31
        subs    r6, lr, r11
        sbcs    r2, r5, #0
        movlt   r6, #0
        movlt   r2, #0
        orrs    r2, r6, r2
        mvnne   lr, #2, 2
        bne     LDGL25
        cmp     lr, #2, 2
        sbcs    r5, r5, r1
        movlt   lr, #2, 2
LDGL25:
        add     r8, r8, #1
        cmp     r10, r8
        blt     LDGL26
        cmn     r8, #2, 18
        movge   r8, r8, lsl #16
        movge   r8, r8, asr #16
        mvnlt   r5, #2, 2
        movlt   r8, r5, lsl #15
        b       LDGL27
LDGL26:
        mvn     r5, #0xFF
        bic     r5, r5, #0x7F, 24
        mvn     r8, r5
LDGL27:
        subs    r0, r0, #1
        bne     LDGL24
        ldr     r6, [sp, #4]
        ldr     r5, [sp]
LDGL28:
        mvn     r3, #0xFF
        rsb     lr, r12, #0
        bic     r3, r3, #0x7F, 24
        mvn     r12, r3
        cmp     r12, lr
        mvn     r12, #2, 2
        mvnlt   r10, r3
        blt     LDGL29
        cmn     lr, #2, 18
        movge   lr, lr, lsl #16
        movge   r10, lr, asr #16
        movlt   r10, r12, lsl #15
LDGL29:
        cmp     r10, #0
        mov     r3, #0
        ble     LDGL58
        cmp     r4, #0
        ble     LDGL33
        bic     r10, r10, #0xFF, 8
        bic     r11, r10, #0xFF, 16
        add     lr, sp, #0x91, 30
        add     r1, sp, #0x91, 30
        add     r2, sp, #0x91, 30
        mov     r10, r3
        mov     r0, #2, 2
        str     r11, [sp, #8]
        str     r12, [sp, #0xC]
        str     r8, [sp, #0x10]
        str     r7, [sp, #0x14]
        str     r9, [sp, #0x18]
LDGL30:
        mov     r3, r3, lsl #3
        ldr     r7, [sp, #8]
        ldr     r9, [sp, #0xC]
        ldr     r11, [sp, #0x10]
        mov     r3, r3, lsl #16
        mov     r12, #0
        mov     lr, #2, 2
        mov     r8, r3, asr #15
        add     r3, r5, r8
LDGL31:
        ldrsh   r0, [r3], #2
        mul     r0, r11, r0
        cmp     r0, #1, 2
        mvneq   r0, #2, 2
        movne   r0, r0, lsl #1
        cmp     r0, r9, asr r7
        mvngt   r0, #2, 2
        bgt     LDGL32
        cmp     r0, lr, asr r7
        movge   r0, r0, lsl r7
        movlt   r0, #2, 2
LDGL32:
        add     r1, sp, #0x89, 30
        str     r0, [r1, +r12, lsl #2]
        add     r12, r12, #1
        cmp     r12, #8
        blt     LDGL31
        add     r1, sp, #0x91, 30
        add     r0, sp, #0x89, 30
        bl      ownRE8_PPV_FX
        add     r3, sp, #0x91, 30
        ldrsh   r2, [r3]
        add     r3, sp, #0x91, 30
        ldrsh   r1, [r3, #2]
        add     r3, sp, #0x91, 30
        ldrsh   r3, [r3, #4]
        strh    r2, [r6, +r8]
        add     r7, r6, r8
        add     r12, sp, #0x91, 30
        ldrsh   r12, [r12, #6]
        add     lr, sp, #0x91, 30
        ldrsh   lr, [lr, #8]
        add     r9, sp, #0x91, 30
        ldrsh   r9, [r9, #0xA]
        add     r11, sp, #0x91, 30
        ldrsh   r11, [r11, #0xC]
        add     r0, sp, #0x91, 30
        ldrsh   r0, [r0, #0xE]
        add     r10, r10, #1
        strh    r3, [r7, #4]
        strh    r1, [r7, #2]
        mov     r8, r10, lsl #16
        strh    r12, [r7, #6]
        mov     r3, r8, asr #16
        cmp     r4, r3
        strh    lr, [r7, #8]
        strh    r9, [r7, #0xA]
        strh    r11, [r7, #0xC]
        strh    r0, [r7, #0xE]
        bgt     LDGL30
        ldr     r7, [sp, #0x14]
        ldr     r9, [sp, #0x18]
LDGL33:
        cmp     r7, #0
        mov     r0, #0
        mov     r3, r0
        mov     r12, #1
        movlt   r3, r12
        add     r3, r7, r3
        mvn     r12, #0xFF
        mov     r3, r3, asr #1
        bic     lr, r12, #0x7F, 24
        mov     r3, r3, lsl #16
        mvn     r8, #0
        mov     r5, r3, asr #16
        mov     r11, r5
        cmp     r4, r11
        mvn     r7, #2, 2
        mov     r3, #0xA
        movle   r12, r0
        ble     LDGL40
        mov     r12, r0
        str     r6, [sp, #4]
        ldr     r6, [sp, #0x1C]
        mvn     r10, lr
LDGL34:
        mov     r11, r11, lsl #1
        add     r1, sp, #0x24
        ldrsh   r11, [r1, +r11]
        sub     r1, r11, r6
        cmp     r10, r1
        blt     LDGL35
        cmn     r1, #2, 18
        movge   r1, r1, lsl #16
        movge   r1, r1, asr #16
        mvnlt   r1, #2, 2
        movlt   r1, r1, lsl #15
        b       LDGL36
LDGL35:
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r1, r1
LDGL36:
        cmp     r1, #0x50
        bge     LDGL39
        mov     r11, r1, lsl #11
        cmp     r11, #1, 2
        mvneq   r1, #2, 2
        movne   r1, r1, lsl #12
        mov     r11, r12, asr #31
        adds    r12, r12, r1
        adc     r1, r11, r1, asr #31
        subs    r11, r12, r7
        sbcs    r2, r1, #0
        movlt   r11, #0
        movlt   r2, #0
        orrs    r2, r11, r2
        mvnne   r12, #2, 2
        bne     LDGL37
        cmp     r12, #2, 2
        sbcs    r1, r1, r8
        movlt   r12, #2, 2
LDGL37:
        add     r3, r3, #0xA
        cmp     r10, r3
        blt     LDGL38
        cmn     r3, #2, 18
        movge   r3, r3, lsl #16
        movge   r3, r3, asr #16
        mvnlt   r1, #2, 2
        movlt   r3, r1, lsl #15
        b       LDGL39
LDGL38:
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r3, r1
LDGL39:
        add     r5, r5, #1
        mov     r1, r5, lsl #16
        mov     r11, r1, asr #16
        cmp     r4, r11
        bgt     LDGL34
        ldr     r6, [sp, #4]
LDGL40:
        mov     r5, r3
        cmp     r5, #0
        moveq   r3, r0
        beq     LDGL42
        cmp     r5, #0
        blt     LDGL57
LDGL41:
        bic     r3, r3, #0xFF, 8
        bic     r10, r3, #0xFF, 16
        movs    r11, r10, asr #8
        ldrne   r3, [pc, #0x4D8]
        movne   r10, r11, lsl #1
        ldreq   r3, [pc, #0x4D4]
        moveq   r10, r10, lsl #1
        ldrsh   r3, [r3, +r10]
        mov     r5, r5, lsl r3
        mov     r5, r5, lsl #16
        mov     r5, r5, asr #16
LDGL42:
        cmp     r5, #1, 18
        blt     LDGL47
        cmp     r5, #0
        blt     LDGL47
        cmp     r5, #0
        beq     LDGL47
        cmp     r5, #1, 18
        mvneq   r0, lr
        beq     LDGL47
        mvn     lr, lr
        mov     r10, #1, 18
        mov     r11, #0xF
        str     r6, [sp, #4]
LDGL43:
        mov     r0, r0, lsl #1
        mov     r10, r10, lsl #1
        mov     r0, r0, lsl #16
        cmp     r10, r5
        mov     r0, r0, asr #16
        blt     LDGL46
        mov     r1, r10, asr #31
        subs    r10, r10, r5
        sbc     r1, r1, r5, asr #31
        subs    r2, r10, r7
        sbcs    r6, r1, #0
        movlt   r2, #0
        movlt   r6, #0
        orrs    r6, r2, r6
        mvnne   r10, #2, 2
        bne     LDGL44
        cmp     r10, #2, 2
        sbcs    r1, r1, r8
        movlt   r10, #2, 2
LDGL44:
        add     r0, r0, #1
        cmp     lr, r0
        blt     LDGL45
        cmn     r0, #2, 18
        movge   r0, r0, lsl #16
        movge   r0, r0, asr #16
        mvnlt   r0, #2, 2
        movlt   r0, r0, lsl #15
        b       LDGL46
LDGL45:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r0, r0
LDGL46:
        subs    r11, r11, #1
        bne     LDGL43
        ldr     r6, [sp, #4]
LDGL47:
        sub     lr, r3, #0xE
        mvn     r5, #0xFF
        cmp     lr, #0
        bic     r5, r5, #0x7F, 24
        mvn     r7, #2, 2
        ble     LDGL48
        bic     lr, lr, #0xFF, 8
        bic     r3, lr, #0xFF, 16
        mvn     lr, r5
        cmp     r0, lr, asr r3
        mov     lr, r7, lsl #15
        mvngt   r0, r5
        bgt     LDGL49
        cmp     r0, lr, asr r3
        movlt   r0, r7, lsl #15
        blt     LDGL49
        mov     r3, r0, lsl r3
        mov     r0, r3, lsl #16
        mov     r0, r0, asr #16
        b       LDGL49
LDGL48:
        rsb     r3, r3, #0xE
        mov     r3, r0, asr r3
        mov     r0, r3, lsl #16
        mov     r0, r0, asr #16
LDGL49:
        sub     r3, r5, #2, 2
        cmp     r3, r12
        mvnle   r3, r5
        ble     LDGL50
        add     r12, r12, #2, 18
        mov     r3, r12, asr #16
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
LDGL50:
        mul     r3, r0, r3
        cmp     r3, #1, 2
        moveq   r3, r7
        movne   r3, r3, lsl #1
        adds    r0, r3, r7, lsl #15
        mvn     r8, #0
        adc     r3, r8, r3, asr #31
        subs    lr, r0, r7
        sbcs    r12, r3, #0
        movlt   lr, #0
        movlt   r12, #0
        orrs    r12, lr, r12
        movne   r0, r7
        bne     LDGL51
        cmp     r0, #2, 2
        sbcs    r3, r3, r8
        movlt   r0, #2, 2
LDGL51:
        mvn     r3, r5
        and     r1, r3, r0, asr #1
        mov     r10, r0, asr #16
        mov     r0, #0xE
        bl      ownPow2
        mov     r10, r10, lsl #16
        mov     r3, r10, asr #16
        mov     r0, r0, lsl #16
        add     r12, r3, #1
        cmp     r12, #0
        mov     r0, r0, asr #16
        ble     LDGL52
        bic     r12, r12, #0xFF, 8
        bic     r3, r12, #0xFF, 16
        mvn     r12, r5
        cmp     r0, r12, asr r3
        mov     r12, r7, lsl #15
        mvngt   r3, r5
        bgt     LDGL53
        cmp     r0, r12, asr r3
        movlt   r3, r7, lsl #15
        blt     LDGL53
        mov     r3, r0, lsl r3
        mov     r0, r3, lsl #16
        mov     r3, r0, asr #16
        b       LDGL53
LDGL52:
        rsb     r8, r3, r8
        mov     r8, r0, asr r8
        mov     r0, r8, lsl #16
        mov     r3, r0, asr #16
LDGL53:
        cmp     r4, #0
        ble     LDGL56
        mov     r0, #0xFF
        orr     r12, r0, #0x7F, 24
        mov     r0, #0
        sub     r1, r12, #7, 20
        add     r6, r6, r4, lsl #4
        mov     r12, r0
LDGL54:
        mov     lr, r0, lsl #1
        add     r8, sp, #0x24
        ldrsh   lr, [r8, +lr]
        cmp     r1, lr
        mvnlt   lr, r5
        blt     LDGL55
        cmn     lr, #1, 20
        movlt   lr, r7, lsl #15
        blt     LDGL55
        mov     lr, lr, lsl #3
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
LDGL55:
        mov     r0, r0, lsl #1
        add     r12, r12, #1
        strh    lr, [r6, +r0]
        mov     r0, r12, lsl #16
        mov     r0, r0, asr #16
        cmp     r4, r0
        bgt     LDGL54
LDGL56:
        mov     r0, #0
        strh    r3, [r9]
        add     sp, sp, #0x97, 30
        ldmia   sp!, {r4 - r11, pc}
LDGL57:
        mvn     r3, r5
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
        b       LDGL41
LDGL58:
        cmp     r4, #0
        ble     LDGL33
        add     r12, sp, #0x89, 30
        add     lr, sp, #0x89, 30
        add     r0, sp, #0x89, 30
        rsb     r10, r10, #0
        add     r1, sp, #0x91, 30
        add     r2, sp, #0x91, 30
        mov     r11, r3
        str     r7, [sp, #0x14]
        str     r9, [sp, #0x18]
        str     r4, [sp, #0x20]
LDGL59:
        mov     r3, r3, lsl #3
        mov     r3, r3, lsl #16
        mov     r4, r3, asr #15
        ldrsh   r2, [r5, +r4]
        mul     r2, r8, r2
        cmp     r2, #1, 2
        mvneq   r3, #2, 2
        movne   r3, r2, lsl #1
        add     r2, r5, r4
        ldrsh   r2, [r2, #2]
        mov     r3, r3, asr r10
        add     r12, sp, #0x89, 30
        mul     r2, r8, r2
        str     r3, [r12]
        cmp     r2, #1, 2
        mvneq   r3, #2, 2
        movne   r3, r2, lsl #1
        add     r2, r5, r4
        ldrsh   r2, [r2, #4]
        mov     r3, r3, asr r10
        add     r12, sp, #0x89, 30
        mul     r2, r8, r2
        str     r3, [r12, #4]
        cmp     r2, #1, 2
        mvneq   r3, #2, 2
        movne   r3, r2, lsl #1
        add     r2, r5, r4
        ldrsh   r2, [r2, #6]
        mov     r3, r3, asr r10
        add     r12, sp, #0x89, 30
        mul     r2, r8, r2
        str     r3, [r12, #8]
        cmp     r2, #1, 2
        mvneq   r3, #2, 2
        movne   r3, r2, lsl #1
        add     r2, r5, r4
        ldrsh   r2, [r2, #8]
        mov     r3, r3, asr r10
        add     r12, sp, #0x89, 30
        mul     r2, r8, r2
        str     r3, [r12, #0xC]
        cmp     r2, #1, 2
        mvneq   r3, #2, 2
        movne   r3, r2, lsl #1
        add     r2, r5, r4
        ldrsh   r2, [r2, #0xA]
        mov     r3, r3, asr r10
        add     r12, sp, #0x89, 30
        mul     r2, r8, r2
        str     r3, [r12, #0x10]
        cmp     r2, #1, 2
        mvneq   r3, #2, 2
        movne   r3, r2, lsl #1
        add     r2, r5, r4
        ldrsh   r2, [r2, #0xC]
        mov     r3, r3, asr r10
        add     r12, sp, #0x89, 30
        mul     r2, r8, r2
        str     r3, [r12, #0x14]
        cmp     r2, #1, 2
        mvneq   r3, #2, 2
        movne   r3, r2, lsl #1
        add     r2, r5, r4
        ldrsh   r2, [r2, #0xE]
        mov     r3, r3, asr r10
        add     r12, sp, #0x89, 30
        mul     r2, r8, r2
        str     r3, [r12, #0x18]
        cmp     r2, #1, 2
        mvneq   r2, #2, 2
        movne   r2, r2, lsl #1
        add     r3, sp, #0x89, 30
        mov     r2, r2, asr r10
        add     r1, sp, #0x91, 30
        add     r0, sp, #0x89, 30
        str     r2, [r3, #0x1C]
        bl      ownRE8_PPV_FX
        add     r2, sp, #0x91, 30
        ldrsh   r1, [r2]
        add     r2, sp, #0x91, 30
        ldrsh   r3, [r2, #2]
        add     r2, sp, #0x91, 30
        ldrsh   r9, [r2, #4]
        strh    r1, [r6, +r4]
        add     r2, sp, #0x91, 30
        ldrsh   r0, [r2, #6]
        add     r2, sp, #0x91, 30
        ldrsh   r7, [r2, #8]
        add     r4, r6, r4
        strh    r9, [r4, #4]
        strh    r3, [r4, #2]
        strh    r0, [r4, #6]
        ldr     r9, [sp, #0x20]
        add     r2, sp, #0x91, 30
        ldrsh   r2, [r2, #0xA]
        add     r12, sp, #0x91, 30
        ldrsh   r12, [r12, #0xC]
        add     lr, sp, #0x91, 30
        ldrsh   lr, [lr, #0xE]
        add     r11, r11, #1
        strh    r7, [r4, #8]
        strh    r2, [r4, #0xA]
        mov     r3, r11, lsl #16
        strh    r12, [r4, #0xC]
        mov     r3, r3, asr #16
        cmp     r9, r3
        strh    lr, [r4, #0xE]
        bgt     LDGL59
        ldr     r7, [sp, #0x14]
        ldr     r9, [sp, #0x18]
        ldr     r4, [sp, #0x20]
        b       LDGL33
LDGL60:
        sub     r1, r1, lr
        cmp     r12, r1
        blt     LDGL61
        cmn     r1, #2, 18
        movge   r0, r1, lsl #16
        movge   r1, r0, asr #16
        mvnlt   r0, #0xFF
        biclt   r1, r0, #0x7F, 24
        b       LDGL18
LDGL61:
        mvn     r0, #2, 2
        mov     r0, r0, lsl #15
        mvn     r1, r0
        b       LDGL18
LDGL62:
        mvn     r0, #5
        add     sp, sp, #0x97, 30
        ldmia   sp!, {r4 - r11, pc}
LDGL63:
        mvn     r0, #7
        add     sp, sp, #0x97, 30
        ldmia   sp!, {r4 - r11, pc}
        .long   NormTable
        .long   NormTable2


