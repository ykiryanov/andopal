        .text
        .align  4
        .globl  _ippsGainQuantTCX_AMRWBE_16s


_ippsGainQuantTCX_AMRWBE_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        ldr     r5, [sp, #0x44]
        ldr     r8, [sp, #0x48]
        ldr     r7, [sp, #0x4C]
        cmp     r0, #0
        mov     r4, r3
        beq     LDER39
        cmp     r2, #0
        beq     LDER39
        cmp     r8, #0
        beq     LDER39
        cmp     r7, #0
        beq     LDER39
        cmp     r4, #0
        ble     LDER36
        mov     r3, r1
        add     lr, sp, #0x1C
        add     r12, sp, #0x18
        mov     r1, r2
        str     lr, [sp, #4]
        str     r12, [sp]
        str     r8, [sp, #8]
        mov     r2, r4
        bl      LDER__ownGetGain_AMRWBE_16s
        cmp     r5, #0
        bne     LDER0
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LDER0:
        mov     r1, r4, lsl #16
        mov     r0, #0
        mov     r1, r1, asr #16
        cmn     r1, #1
        mov     r12, #0xF
        moveq   r1, r12
        beq     LDER3
        cmp     r1, #0
        moveq   r1, r0
        beq     LDER3
        cmp     r1, #0
        blt     LDER37
LDER1:
        bic     r1, r1, #0xFF, 8
        bic     r1, r1, #0xFF, 16
        movs    lr, r1, asr #8
        bne     LDER2
        ldr     lr, [pc, #0xA50]
        mov     r1, r1, lsl #1
        ldrsh   r1, [lr, +r1]
        b       LDER3
LDER2:
        ldr     r1, [pc, #0xA44]
        mov     lr, lr, lsl #1
        ldrsh   r1, [r1, +lr]
LDER3:
        ldrsh   r5, [sp, #0x18]
        mov     r4, r4, lsl r1
        rsb     r1, r1, #0xF
        mov     r2, r4, lsl #16
        mov     r2, r2, asr #16
        mov     r1, r1, lsl #16
        cmp     r2, r5
        mov     r1, r1, asr #16
        ble     LDER4
        add     r1, r1, #1
        mov     r2, r2, asr #1
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
LDER4:
        cmp     r2, r5
        ble     LDER5
        b       LDER10
LDER5:
        cmp     r2, #0
        blt     LDER10
        cmp     r5, #0
        blt     LDER10
        cmp     r5, #0
        beq     LDER10
        cmp     r2, #0
        beq     LDER10
        mvn     r3, #0xFF
        cmp     r2, r5
        bic     r3, r3, #0x7F, 24
        mvneq   r0, r3
        beq     LDER10
        mvn     r3, r3
        mvn     r4, #2, 2
        mvn     lr, #0
LDER6:
        mov     r0, r0, lsl #1
        mov     r2, r2, lsl #1
        mov     r0, r0, lsl #16
        cmp     r2, r5
        mov     r0, r0, asr #16
        blt     LDER9
        mov     r6, r2, asr #31
        subs    r2, r2, r5
        sbc     r6, r6, r5, asr #31
        subs    r9, r2, r4
        sbcs    r10, r6, #0
        movlt   r9, #0
        movlt   r10, #0
        orrs    r10, r9, r10
        movne   r2, r4
        bne     LDER7
        cmp     r2, #2, 2
        sbcs    r6, r6, lr
        movlt   r2, #2, 2
LDER7:
        add     r0, r0, #1
        cmp     r3, r0
        blt     LDER8
        cmn     r0, #2, 18
        movge   r0, r0, lsl #16
        movge   r0, r0, asr #16
        movlt   r0, #0
        sublt   r0, r0, #2, 18
        b       LDER9
LDER8:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r0, r0
LDER9:
        subs    r12, r12, #1
        bne     LDER6
LDER10:
        ldrsh   r2, [sp, #0x1C]
        mvn     r10, #2, 2
        sub     r2, r1, r2
        mov     r1, #2, 2
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #16
        add     r3, r2, #0xD
        cmp     r3, #0
        ble     LDER38
        bic     r3, r3, #0xFF, 8
        bic     r3, r3, #0xFF, 16
        cmp     r0, r10, asr r3
        movgt   r0, r10
        bgt     LDER11
        cmp     r0, r1, asr r3
        movge   r0, r0, lsl r3
        movlt   r0, #2, 2
LDER11:
        bl      _ownIsqrt
        mov     r4, r0
LDER12:
        ldr     r1, [pc, #0x8E4]
        ldr     r12, [r8]
        mov     lr, r4, asr #16
        str     r1, [sp, #0x10]
        mvn     r1, #0xFF
        bic     r6, r1, #0x7F, 24
        mvn     r3, r6
        mov     lr, lr, lsl #16
        and     r3, r3, r4, asr #1
        mov     r1, lr, asr #16
        cmp     r12, #0
        strh    r3, [sp, #0x18]
        strh    r1, [sp, #0x1C]
        mov     r2, r12
        moveq   r2, #0
        beq     LDER16
        cmn     r12, #1
        moveq   r12, #2, 2
        moveq   r2, #0x1F
        beq     LDER16
        cmp     r12, #0
        mvnlt   r2, r12
        cmp     r2, #0
        moveq   r2, #0
        beq     LDER15
        movs    lr, r2, lsr #16
        bne     LDER13
        bic     r2, r2, #0xFF, 8
        bic     r2, r2, #0xFF, 16
        movs    lr, r2, asr #8
        ldrne   r2, [pc, #0x870]
        movne   lr, lr, lsl #1
        moveq   lr, r2, lsl #1
        ldreq   r2, [sp, #0x10]
        ldrsh   lr, [r2, +lr]
        add     r2, lr, #0x10
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #16
        b       LDER15
LDER13:
        movs    r2, r2, lsr #24
        bne     LDER14
        ldr     r2, [sp, #0x10]
        mov     lr, lr, lsl #1
        ldrsh   r2, [r2, +lr]
        b       LDER15
LDER14:
        ldr     lr, [pc, #0x834]
        mov     r2, r2, lsl #1
        ldrsh   r2, [lr, +r2]
LDER15:
        mov     r12, r12, lsl r2
LDER16:
        mov     r12, r12, asr #16
        mov     r12, r12, lsl #16
        mov     lr, r12, asr #16
        mul     r5, r3, lr
        mov     r3, #2, 2
        rsb     r12, r2, #0x11
        cmp     r12, #0
        mov     r5, r5, asr #15
        mla     r5, r1, lr, r5
        mov     r1, r5, lsl #1
        suble   r2, r2, #0x11
        movle   r0, r1, asr r2
        ble     LDER17
        bic     r12, r12, #0xFF, 8
        bic     r12, r12, #0xFF, 16
        cmp     r1, r10, asr r12
        movgt   r0, r10
        bgt     LDER17
        cmp     r1, r3, asr r12
        movge   r0, r1, lsl r12
        movlt   r0, #2, 2
LDER17:
        cmp     r0, #0
        moveq   r0, #1
        add     r2, sp, #0x18
        add     r1, sp, #0x1C
        bl      ownLog2
        ldrsh   r2, [sp, #0x1C]
        mvn     r1, r6
        mov     r11, #0
        sub     r2, r2, #0xF
        cmp     r1, r2
        mvnlt   r1, r6
        blt     LDER18
        cmn     r2, #2, 18
        movge   r2, r2, lsl #16
        movge   r1, r2, asr #16
        sublt   r1, r11, #2, 18
LDER18:
        ldrsh   r2, [sp, #0x18]
        mov     r3, #0x6E
        orr     r3, r3, #0x43, 24
        mul     r1, r1, r3
        mul     r3, r2, r3
        mvn     r9, #0
        add     r3, r1, r3, asr #15
        mov     r2, r3, lsl #1
        adds    r1, r2, #2, 22
        mov     r2, r2, asr #31
        adc     r2, r2, #0
        subs    r3, r1, r10
        sbcs    r12, r2, #0
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        movne   r1, r10
        bne     LDER19
        cmp     r1, #2, 2
        sbcs    r2, r2, r9
        movlt   r1, #2, 2
LDER19:
        cmn     r1, #0x7E, 6
        movgt   r1, r10
        bgt     LDER20
        cmp     r1, #0x3E, 6
        movge   r1, r1, lsl #4
        movlt   r1, #2, 2
LDER20:
        mov     r1, r1, asr #16
        mov     r1, r1, lsl #16
        movs    r5, r1, asr #16
        movmi   r5, r11
        cmp     r5, #0x7F
        mov     r1, #0x7F
        movgt   r5, r1
        mov     r1, #0xF3, 28
        mul     r1, r5, r1
        cmp     r1, #1, 2
        moveq   r3, r10
        movne   r3, r1, lsl #1
        mvn     r1, r6
        and     r1, r1, r3, asr #1
        strh    r1, [sp, #0x18]
        mov     r3, r3, asr #16
        strh    r3, [sp, #0x1C]
        mov     r0, #0xE
        bl      ownPow2
        cmp     r4, #0
        mov     r1, r0, lsl #16
        mov     r2, r4
        mov     r1, r1, asr #16
        beq     LDER25
        cmn     r4, #1
        moveq   r4, #2, 2
        moveq   r11, #0x1F
        beq     LDER25
        cmp     r4, #0
        mvnlt   r2, r4
        cmp     r2, #0
        moveq   r11, #0
        beq     LDER24
        movs    r3, r2, lsr #16
        bne     LDER22
        bic     r2, r2, #0xFF, 8
        bic     r3, r2, #0xFF, 16
        movs    r2, r3, asr #8
        moveq   r3, r3, lsl #1
        beq     LDER21
        ldr     r3, [pc, #0x684]
        str     r3, [sp, #0x10]
        mov     r3, r2, lsl #1
LDER21:
        ldr     r2, [sp, #0x10]
        ldrsh   r3, [r2, +r3]
        add     r2, r3, #0x10
        mov     r2, r2, lsl #16
        mov     r11, r2, asr #16
        b       LDER24
LDER22:
        movs    r2, r2, lsr #24
        bne     LDER23
        ldr     r2, [sp, #0x10]
        mov     r3, r3, lsl #1
        ldrsh   r11, [r2, +r3]
        b       LDER24
LDER23:
        ldr     r3, [pc, #0x648]
        mov     r2, r2, lsl #1
        ldrsh   r11, [r3, +r2]
LDER24:
        mov     r4, r4, lsl r11
LDER25:
        mov     r4, r4, asr #16
        rsb     r11, r11, #0x1F
        mov     r4, r4, lsl #16
        mov     r3, #0
        mov     r0, r4, asr #16
        cmp     r1, r0
        ldrlesh r2, [sp, #0x1C]
        ble     LDER26
        ldrsh   r2, [sp, #0x1C]
        mvn     r12, r6
        mov     r1, r1, asr #1
        add     r2, r2, #1
        cmp     r12, r2
        mvnlt   r2, r6
        blt     LDER26
        cmn     r2, #2, 18
        movge   r2, r2, lsl #16
        movge   r2, r2, asr #16
        sublt   r2, r3, #2, 18
LDER26:
        cmp     r1, r0
        ble     LDER27
        b       LDER32
LDER27:
        cmp     r1, #0
        blt     LDER32
        cmp     r0, #0
        blt     LDER32
        cmp     r0, #0
        beq     LDER32
        cmp     r1, #0
        beq     LDER32
        cmp     r1, r0
        mvneq   r3, r6
        beq     LDER32
        mvn     r6, r6
        mov     r12, #0xF
        str     r8, [sp, #0x14]
LDER28:
        mov     r3, r3, lsl #1
        mov     r1, r1, lsl #1
        mov     r3, r3, lsl #16
        cmp     r1, r0
        mov     r3, r3, asr #16
        blt     LDER31
        mov     lr, r1, asr #31
        subs    r1, r1, r0
        sbc     lr, lr, r0, asr #31
        subs    r8, r1, r10
        sbcs    r4, lr, #0
        movlt   r8, #0
        movlt   r4, #0
        orrs    r4, r8, r4
        mvnne   r1, #2, 2
        bne     LDER29
        cmp     r1, #2, 2
        sbcs    lr, lr, r9
        movlt   r1, #2, 2
LDER29:
        add     r3, r3, #1
        cmp     r6, r3
        blt     LDER30
        cmn     r3, #2, 18
        movge   r3, r3, lsl #16
        movge   r3, r3, asr #16
        mvnlt   r3, #0xFF
        biclt   r3, r3, #0x7F, 24
        b       LDER31
LDER30:
        mov     r3, #0
        sub     r3, r3, #2, 18
        mvn     r3, r3
LDER31:
        subs    r12, r12, #1
        bne     LDER28
        ldr     r8, [sp, #0x14]
LDER32:
        sub     r2, r2, r11
        mov     r0, r2, lsl #16
        mov     r0, r0, asr #16
        add     r1, r0, #0xF
        cmp     r1, #0
        ble     LDER34
        bic     r1, r1, #0xFF, 8
        bic     r0, r1, #0xFF, 16
        mvn     r2, #2, 2
        cmp     r3, r2, asr r0
        mov     r1, #2, 2
        bgt     LDER33
        cmp     r3, r1, asr r0
        movge   r2, r3, lsl r0
        movlt   r2, #2, 2
LDER33:
        str     r2, [r8]
        b       LDER35
LDER34:
        mvn     r1, #0xE
        rsb     r1, r0, r1
        mov     r1, r3, asr r1
        str     r1, [r8]
LDER35:
        mov     r0, #0
        strh    r5, [r7]
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LDER36:
        mvn     r0, #5
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LDER37:
        mvn     r1, r1
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        b       LDER1
LDER38:
        mvn     r1, #0xC
        rsb     r1, r2, r1
        mov     r0, r0, asr r1
        bl      _ownIsqrt
        mov     r4, r0
        b       LDER12
LDER39:
        mvn     r0, #7
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LDER__ownGetGain_AMRWBE_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        ldr     r4, [sp, #0x38]
        ldr     lr, [sp, #0x3C]
        ldr     r12, [sp, #0x40]
        cmp     r2, #0
        mov     r9, #0
        movle   r6, r9
        ble     LDER46
        mov     r6, r9
        mov     r5, r6
        mvn     r8, #2, 2
        mvn     r7, #0
        str     r12, [sp, #4]
        str     lr, [sp, #8]
        str     r4, [sp, #0xC]
        str     r3, [sp, #0x10]
LDER40:
        mov     r3, #0
        mov     r12, r3
        mov     lr, #0x10
        str     r9, [sp]
LDER41:
        ldrsh   r9, [r1]
        ldrsh   r4, [r0]
        mov     r9, r9, lsl #14
        mov     r9, r9, asr #15
        mov     r10, r9, lsl #16
        mov     r9, r4, lsl #14
        mov     r9, r9, asr #15
        mov     r4, r10, asr #16
        mul     r9, r9, r4
        cmp     r9, #1, 2
        mvneq   r9, #2, 2
        movne   r9, r9, lsl #1
        mov     r10, r12, asr #31
        adds    r12, r12, r9
        adc     r9, r10, r9, asr #31
        subs    r11, r12, r8
        sbcs    r10, r9, #0
        movlt   r11, #0
        movlt   r10, #0
        orrs    r10, r11, r10
        mvnne   r12, #2, 2
        bne     LDER42
        cmp     r12, #2, 2
        sbcs    r9, r9, r7
        movlt   r12, #2, 2
LDER42:
        mul     r4, r4, r4
        cmp     r4, #1, 2
        mvneq   r4, #2, 2
        movne   r4, r4, lsl #1
        mov     r9, r3, asr #31
        adds    r3, r3, r4
        adc     r4, r9, r4, asr #31
        subs    r10, r3, r8
        sbcs    r9, r4, #0
        movlt   r10, #0
        movlt   r9, #0
        orrs    r9, r10, r9
        mvnne   r3, #2, 2
        bne     LDER43
        cmp     r3, #2, 2
        sbcs    r4, r4, r7
        movlt   r3, #2, 2
LDER43:
        subs    lr, lr, #1
        add     r1, r1, #2
        add     r0, r0, #2
        bne     LDER41
        ldr     r9, [sp]
        mov     r12, r12, asr #2
        mov     lr, r6, asr #31
        adds    r6, r6, r12
        adc     r12, lr, r12, asr #31
        subs    lr, r6, r8
        sbcs    r4, r12, #0
        movlt   lr, #0
        movlt   r4, #0
        orrs    r4, lr, r4
        mvnne   r6, #2, 2
        bne     LDER44
        cmp     r6, #2, 2
        sbcs    r12, r12, r7
        movlt   r6, #2, 2
LDER44:
        mov     r3, r3, asr #2
        mov     r12, r5, asr #31
        adds    r5, r5, r3
        adc     r3, r12, r3, asr #31
        subs    r12, r5, r8
        sbcs    lr, r3, #0
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        mvnne   r5, #2, 2
        bne     LDER45
        cmp     r5, #2, 2
        sbcs    r3, r3, r7
        movlt   r5, #2, 2
LDER45:
        add     r9, r9, #0x10
        cmp     r9, r2
        blt     LDER40
        ldr     r12, [sp, #4]
        ldr     lr, [sp, #8]
        ldr     r4, [sp, #0xC]
        ldr     r3, [sp, #0x10]
        cmp     r5, #0
        bne     LDER47
LDER46:
        mov     r5, #1
LDER47:
        cmp     r6, #0
        mvn     r0, #2, 2
        mov     r2, #0
        movgt   r1, r2
        ble     LDER65
LDER48:
        ldr     r7, [pc, #0x2BC]
        ldr     r8, [pc, #0x2BC]
        cmp     r6, #0
        mov     r9, r6
        beq     LDER51
        cmn     r6, #1
        moveq   r6, #2, 2
        moveq   r2, #0x1F
        beq     LDER51
        cmp     r6, #0
        mvnlt   r9, r6
        cmp     r9, #0
        beq     LDER50
        movs    r2, r9, lsr #16
        bne     LDER49
        bic     r9, r9, #0xFF, 8
        bic     r2, r9, #0xFF, 16
        movs    r9, r2, asr #8
        movne   r2, r9, lsl #1
        movne   r9, r8
        moveq   r2, r2, lsl #1
        moveq   r9, r7
        ldrsh   r2, [r9, +r2]
        add     r2, r2, #0x10
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #16
        b       LDER50
LDER49:
        movs    r9, r9, lsr #24
        movne   r9, r9, lsl #1
        ldrnesh r2, [r8, +r9]
        moveq   r2, r2, lsl #1
        ldreqsh r2, [r7, +r2]
LDER50:
        mov     r6, r6, lsl r2
LDER51:
        add     r2, r3, r2
        rsb     r3, r2, #0x1E
        mov     r6, r6, asr #16
        mov     r3, r3, lsl #16
        mov     r2, r6, lsl #16
        cmp     r5, #0
        mov     r2, r2, asr #16
        mov     r3, r3, asr #16
        mov     r6, #0
        mov     r10, r5
        moveq   r9, r6
        beq     LDER54
        cmn     r5, #1
        moveq   r5, #2, 2
        moveq   r9, #0x1F
        beq     LDER54
        cmp     r5, #0
        mvnlt   r10, r5
        cmp     r10, #0
        moveq   r9, r6
        beq     LDER53
        movs    r9, r10, lsr #16
        bne     LDER52
        bic     r10, r10, #0xFF, 8
        bic     r9, r10, #0xFF, 16
        movs    r10, r9, asr #8
        movne   r9, r10, lsl #1
        movne   r7, r8
        moveq   r9, r9, lsl #1
        ldrsh   r9, [r7, +r9]
        add     r7, r9, #0x10
        mov     r7, r7, lsl #16
        mov     r9, r7, asr #16
        b       LDER53
LDER52:
        movs    r10, r10, lsr #24
        movne   r10, r10, lsl #1
        ldrnesh r9, [r8, +r10]
        moveq   r9, r9, lsl #1
        ldreqsh r9, [r7, +r9]
LDER53:
        mov     r5, r5, lsl r9
LDER54:
        mov     r5, r5, asr #16
        rsb     r7, r9, #0x1E
        mov     r5, r5, lsl #16
        mov     r7, r7, lsl #16
        mov     r5, r5, asr #16
        strh    r5, [r4]
        mov     r4, r7, asr #16
        strh    r4, [lr]
        mvn     lr, #0xFF
        cmp     r2, r5
        bic     lr, lr, #0x7F, 24
        ble     LDER55
        add     r3, r3, #1
        mvn     r7, lr
        cmp     r7, r3
        mov     r2, r2, asr #1
        mvnlt   r3, lr
        blt     LDER55
        cmn     r3, #2, 18
        movge   r3, r3, lsl #16
        movge   r3, r3, asr #16
        sublt   r3, r6, #2, 18
LDER55:
        cmp     r2, r5
        bgt     LDER60
        cmp     r2, #0
        blt     LDER60
        cmp     r5, #0
        blt     LDER60
        cmp     r5, #0
        beq     LDER60
        cmp     r2, #0
        beq     LDER60
        cmp     r2, r5
        mvneq   r6, lr
        beq     LDER60
        mvn     lr, lr
        mvn     r9, #0
        mov     r8, #0xF
LDER56:
        mov     r6, r6, lsl #1
        mov     r2, r2, lsl #1
        mov     r6, r6, lsl #16
        cmp     r2, r5
        mov     r6, r6, asr #16
        blt     LDER59
        mov     r7, r2, asr #31
        subs    r2, r2, r5
        sbc     r7, r7, r5, asr #31
        subs    r10, r2, r0
        sbcs    r11, r7, #0
        movlt   r10, #0
        movlt   r11, #0
        orrs    r11, r10, r11
        movne   r2, r0
        bne     LDER57
        cmp     r2, #2, 2
        sbcs    r7, r7, r9
        movlt   r2, #2, 2
LDER57:
        add     r6, r6, #1
        cmp     lr, r6
        blt     LDER58
        cmn     r6, #2, 18
        movge   r6, r6, lsl #16
        movge   r6, r6, asr #16
        mvnlt   r6, #0xFF
        biclt   r6, r6, #0x7F, 24
        b       LDER59
LDER58:
        mov     r6, #0
        sub     r6, r6, #2, 18
        mvn     r6, r6
LDER59:
        subs    r8, r8, #1
        bne     LDER56
LDER60:
        sub     r3, r3, r4
        mvn     r0, #2, 2
        mov     r2, r3, lsl #16
        mov     r2, r2, asr #16
        add     r3, r2, #1
        cmp     r3, #0
        ble     LDER61
        bic     r3, r3, #0xFF, 8
        bic     r3, r3, #0xFF, 16
        cmp     r6, r0, asr r3
        mov     r2, #2, 2
        movgt   r2, r0
        bgt     LDER62
        cmp     r6, r2, asr r3
        movge   r2, r6, lsl r3
        b       LDER62
LDER61:
        mvn     r3, #0
        rsb     r3, r2, r3
        mov     r2, r6, asr r3
LDER62:
        cmp     r1, #1
        beq     LDER64
LDER63:
        str     r2, [r12]
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LDER64:
        cmp     r2, #2, 2
        moveq   r2, r0
        rsbne   r2, r2, #0
        b       LDER63
LDER65:
        cmp     r6, #2, 2
        moveq   r6, r0
        rsbne   r6, r6, #0
        mov     r1, #1
        b       LDER48
        .long   NormTable2
        .long   NormTable


