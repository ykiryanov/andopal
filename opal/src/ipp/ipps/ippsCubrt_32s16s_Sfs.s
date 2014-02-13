        .text
        .align  4
        .globl  _ippsCubrt_32s16s_Sfs


_ippsCubrt_32s16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        cmp     r0, #0
        mov     r5, r1
        beq     LCUC44
        cmp     r5, #0
        beq     LCUC44
        cmp     r2, #1
        blt     LCUC14
        cmp     r3, #0
        mvn     lr, #2, 2
        mov     r12, #0
        mov     r6, #3
        rsb     r4, r3, #0
        blt     LCUC15
        cmp     r2, #0
        ble     LCUC13
        mov     r4, r12
        str     r0, [sp]
        str     r12, [sp, #4]
        str     lr, [sp, #0x10]
        str     r3, [sp, #0xC]
        str     r2, [sp, #8]
LCUC0:
        ldr     r0, [sp]
        ldr     lr, [r0], #4
        str     r0, [sp]
        cmp     lr, #0
        ldreq   r0, [sp, #4]
        streqh  r0, [r5]
        beq     LCUC12
        ldr     r0, [sp, #0x10]
        bic     r0, lr, r0
        mov     r0, r0, asr #30
        adds    r0, r0, #1
        str     r0, [sp, #0x14]
        rsbmi   lr, lr, #0
        movmi   r7, lr, asr #31
        movpl   r7, lr, asr #31
        cmp     lr, #1, 2
        sbcs    r0, r7, #0
        movlt   r3, #0
        blt     LCUC1
        subs    lr, lr, #1, 2
        sbc     r7, r7, #0
        mov     r3, #1
LCUC1:
        mov     r10, r3, lsl #2
        mov     r12, r3, lsl #1
        adds    r0, r10, r12
        umull   r8, r0, r6, r0
        mov     r9, #0
        mov     r11, r3, lsr #30
        mov     r2, r3, lsr #31
        orr     r11, r11, r9, lsl #2
        orr     r2, r2, r9, lsl #1
        adc     r9, r11, r2
        adds    r8, r8, #1
        add     r9, r9, r9, lsl #1
        add     r0, r9, r0
        adc     r0, r0, #0
        mov     r9, r8, lsr #5
        cmp     lr, r8, lsl #27
        orr     r0, r9, r0, lsl #27
        sbcs    r9, r7, r0
        blt     LCUC2
        subs    lr, lr, r8, lsl #27
        sbc     r7, r7, r0
        mov     r0, r12, lsr #31
        orr     r0, r0, r2, lsl #1
        adds    r3, r10, r3, lsl #2
        adc     r0, r11, r0
        adds    r10, r3, #1
        adc     r11, r0, #0
        adds    r12, r12, #1
        adc     r2, r2, #0
LCUC2:
        mov     r9, r10, lsl #2
        mov     r3, r12, lsl #1
        mov     r1, r10, lsr #30
        adds    r0, r9, r3
        umull   r0, r8, r6, r0
        mov     r10, r12, lsr #31
        orr     r2, r10, r2, lsl #1
        orr     r11, r1, r11, lsl #2
        adc     r10, r11, r2
        adds    r0, r0, #1
        add     r10, r10, r10, lsl #1
        add     r8, r10, r8
        adc     r8, r8, #0
        mov     r10, r0, lsr #8
        cmp     lr, r0, lsl #24
        orr     r8, r10, r8, lsl #24
        sbcs    r10, r7, r8
        blt     LCUC3
        subs    lr, lr, r0, lsl #24
        mov     r0, r3, lsr #31
        sbc     r7, r7, r8
        orr     r0, r0, r2, lsl #1
        adds    r12, r9, r12, lsl #2
        adc     r0, r11, r0
        adds    r9, r12, #1
        adc     r11, r0, #0
        adds    r3, r3, #1
        adc     r2, r2, #0
LCUC3:
        mov     r10, r9, lsl #2
        mov     r12, r3, lsl #1
        mov     r1, r9, lsr #30
        adds    r0, r10, r12
        umull   r0, r8, r6, r0
        mov     r9, r3, lsr #31
        orr     r2, r9, r2, lsl #1
        orr     r11, r1, r11, lsl #2
        adc     r9, r11, r2
        adds    r0, r0, #1
        add     r9, r9, r9, lsl #1
        add     r8, r9, r8
        adc     r8, r8, #0
        mov     r9, r0, lsr #11
        cmp     lr, r0, lsl #21
        orr     r8, r9, r8, lsl #21
        sbcs    r9, r7, r8
        blt     LCUC4
        subs    lr, lr, r0, lsl #21
        mov     r0, r12, lsr #31
        sbc     r7, r7, r8
        orr     r0, r0, r2, lsl #1
        adds    r3, r10, r3, lsl #2
        adc     r0, r11, r0
        adds    r10, r3, #1
        adc     r11, r0, #0
        adds    r12, r12, #1
        adc     r2, r2, #0
LCUC4:
        mov     r3, r10, lsl #2
        mov     r9, r12, lsl #1
        mov     r1, r10, lsr #30
        adds    r0, r3, r9
        umull   r0, r8, r6, r0
        mov     r10, r12, lsr #31
        orr     r2, r10, r2, lsl #1
        orr     r11, r1, r11, lsl #2
        adc     r10, r11, r2
        adds    r0, r0, #1
        add     r10, r10, r10, lsl #1
        add     r8, r10, r8
        adc     r8, r8, #0
        mov     r10, r0, lsr #14
        cmp     lr, r0, lsl #18
        orr     r8, r10, r8, lsl #18
        sbcs    r10, r7, r8
        blt     LCUC5
        subs    lr, lr, r0, lsl #18
        mov     r0, r9, lsr #31
        sbc     r7, r7, r8
        orr     r0, r0, r2, lsl #1
        adds    r12, r3, r12, lsl #2
        adc     r0, r11, r0
        adds    r3, r12, #1
        adc     r11, r0, #0
        adds    r9, r9, #1
        adc     r2, r2, #0
LCUC5:
        mov     r0, r3, lsl #2
        mov     r12, r9, lsl #1
        adds    r8, r0, r12
        umull   r8, r10, r6, r8
        mov     r3, r3, lsr #30
        mov     r1, r9, lsr #31
        orr     r3, r3, r11, lsl #2
        orr     r2, r1, r2, lsl #1
        adc     r11, r3, r2
        adds    r8, r8, #1
        add     r11, r11, r11, lsl #1
        add     r10, r11, r10
        adc     r10, r10, #0
        mov     r11, r8, lsr #17
        cmp     lr, r8, lsl #15
        orr     r10, r11, r10, lsl #15
        sbcs    r11, r7, r10
        blt     LCUC6
        subs    lr, lr, r8, lsl #15
        mov     r8, r12, lsr #31
        sbc     r7, r7, r10
        orr     r8, r8, r2, lsl #1
        adds    r9, r0, r9, lsl #2
        adc     r8, r3, r8
        adds    r0, r9, #1
        adc     r3, r8, #0
        adds    r12, r12, #1
        adc     r2, r2, #0
LCUC6:
        mov     r9, r0, lsl #2
        mov     r11, r12, lsl #1
        mov     r1, r0, lsr #30
        adds    r8, r9, r11
        umull   r8, r10, r6, r8
        mov     r0, r12, lsr #31
        orr     r2, r0, r2, lsl #1
        orr     r3, r1, r3, lsl #2
        adc     r0, r3, r2
        adds    r8, r8, #1
        add     r0, r0, r0, lsl #1
        add     r10, r0, r10
        adc     r0, r10, #0
        mov     r10, r8, lsr #20
        cmp     lr, r8, lsl #12
        orr     r0, r10, r0, lsl #12
        sbcs    r10, r7, r0
        blt     LCUC7
        subs    lr, lr, r8, lsl #12
        sbc     r7, r7, r0
        mov     r0, r11, lsr #31
        orr     r0, r0, r2, lsl #1
        adds    r12, r9, r12, lsl #2
        adc     r0, r3, r0
        adds    r9, r12, #1
        adc     r3, r0, #0
        adds    r11, r11, #1
        adc     r2, r2, #0
LCUC7:
        mov     r12, r9, lsl #2
        mov     r10, r11, lsl #1
        mov     r1, r9, lsr #30
        adds    r0, r12, r10
        umull   r0, r8, r6, r0
        mov     r9, r11, lsr #31
        orr     r2, r9, r2, lsl #1
        orr     r3, r1, r3, lsl #2
        adc     r9, r3, r2
        adds    r0, r0, #1
        add     r9, r9, r9, lsl #1
        add     r8, r9, r8
        adc     r8, r8, #0
        mov     r9, r0, lsr #23
        cmp     lr, r0, lsl #9
        orr     r8, r9, r8, lsl #9
        sbcs    r9, r7, r8
        blt     LCUC8
        subs    lr, lr, r0, lsl #9
        mov     r0, r10, lsr #31
        sbc     r7, r7, r8
        orr     r0, r0, r2, lsl #1
        adds    r11, r12, r11, lsl #2
        adc     r0, r3, r0
        adds    r12, r11, #1
        adc     r3, r0, #0
        adds    r10, r10, #1
        adc     r2, r2, #0
LCUC8:
        mov     r8, r12, lsl #2
        mov     r11, r10, lsl #1
        mov     r1, r12, lsr #30
        adds    r0, r8, r11
        umull   r0, r9, r6, r0
        mov     r12, r10, lsr #31
        orr     r2, r12, r2, lsl #1
        orr     r3, r1, r3, lsl #2
        adc     r12, r3, r2
        adds    r0, r0, #1
        add     r12, r12, r12, lsl #1
        add     r9, r12, r9
        adc     r12, r9, #0
        mov     r9, r0, lsr #26
        cmp     lr, r0, lsl #6
        orr     r12, r9, r12, lsl #6
        sbcs    r9, r7, r12
        blt     LCUC9
        subs    lr, lr, r0, lsl #6
        mov     r0, r11, lsr #31
        sbc     r7, r7, r12
        orr     r0, r0, r2, lsl #1
        adds    r10, r8, r10, lsl #2
        adc     r0, r3, r0
        adds    r8, r10, #1
        adc     r3, r0, #0
        adds    r11, r11, #1
        adc     r2, r2, #0
LCUC9:
        mov     r12, r8, lsl #2
        mov     r10, r11, lsl #1
        mov     r1, r8, lsr #30
        adds    r0, r12, r10
        umull   r0, r9, r6, r0
        mov     r8, r11, lsr #31
        orr     r2, r8, r2, lsl #1
        orr     r3, r1, r3, lsl #2
        adc     r8, r3, r2
        adds    r0, r0, #1
        add     r8, r8, r8, lsl #1
        add     r9, r8, r9
        adc     r8, r9, #0
        mov     r9, r0, lsr #29
        cmp     lr, r0, lsl #3
        orr     r8, r9, r8, lsl #3
        sbcs    r9, r7, r8
        blt     LCUC10
        subs    lr, lr, r0, lsl #3
        mov     r0, r10, lsr #31
        sbc     r7, r7, r8
        orr     r0, r0, r2, lsl #1
        adds    r11, r12, r11, lsl #2
        adc     r0, r3, r0
        adds    r12, r11, #1
        adc     r3, r0, #0
        adds    r10, r10, #1
        adc     r2, r2, #0
LCUC10:
        mov     r9, r10, lsl #1
        adds    r0, r9, r12, lsl #2
        umull   r0, r8, r6, r0
        mov     r12, r12, lsr #30
        mov     r10, r10, lsr #31
        orr     r3, r12, r3, lsl #2
        orr     r2, r10, r2, lsl #1
        adc     r3, r3, r2
        adds    r0, r0, #1
        add     r3, r3, r3, lsl #1
        add     r8, r3, r8
        adc     r3, r8, #0
        cmp     lr, r0
        sbcs    r7, r7, r3
        blt     LCUC11
        adds    r9, r9, #1
        adc     r2, r2, #0
LCUC11:
        ldr     r3, [sp, #0x14]
        umull   r0, r12, r3, r9
        mla     r2, r3, r2, r12
        mov     r3, r3, asr #31
        mla     r1, r3, r9, r2
        ldr     r2, [sp, #0xC]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        strh    r0, [r5]
LCUC12:
        ldr     r0, [sp, #8]
        add     r4, r4, #1
        add     r5, r5, #2
        cmp     r4, r0
        blt     LCUC0
LCUC13:
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LCUC14:
        mvn     r0, #5
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LCUC15:
        mvn     r7, #0xFF
        cmn     r3, #0xF
        bic     r7, r7, #0x7F, 24
        mvn     r3, r7
        mov     r7, r12
        bgt     LCUC18
LCUC16:
        ldr     r4, [r0], #4
        cmp     r4, #0
        streqh  r7, [r5]
        beq     LCUC17
        cmp     r4, #0
        movle   r4, lr, lsl #15
        strleh  r4, [r5]
        strgth  r3, [r5]
LCUC17:
        add     r12, r12, #1
        cmp     r12, r2
        add     r5, r5, #2
        blt     LCUC16
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LCUC18:
        str     r0, [sp]
        str     r3, [sp, #0x14]
        str     r12, [sp, #4]
        str     lr, [sp, #0x10]
        str     r2, [sp, #8]
LCUC19:
        ldr     r3, [sp]
        ldr     r0, [r3], #4
        str     r3, [sp]
        cmp     r0, #0
        moveq   r0, #0
        streqh  r0, [r5]
        beq     LCUC42
        ldr     r3, [sp, #0x10]
        bic     r3, r0, r3
        mov     r3, r3, asr #30
        adds    r3, r3, #1
        str     r3, [sp, #0xC]
        rsbmi   r0, r0, #0
        movmi   r1, r0, asr #31
        movpl   r1, r0, asr #31
        mov     r7, r4, asr #31
        mov     r2, r4
        mov     r3, r7
        bl      __ashldi3
        mov     r2, r4
        mov     r3, r7
        bl      __ashldi3
        mov     r2, r4
        mov     r3, r7
        bl      __ashldi3
        cmp     r0, #0
        sbcs    r3, r1, #2, 20
        blt     LCUC20
        ldr     r0, [sp, #0xC]
        cmp     r0, #0
        ldrgt   r0, [sp, #0x14]
        strgth  r0, [r5]
        bgt     LCUC42
        b       LCUC43
LCUC20:
        cmp     r0, #0
        sbcs    r3, r1, #1, 4
        movlt   r12, #0
        blt     LCUC21
        subs    r0, r0, #0
        sbc     r1, r1, #1, 4
        mov     r12, #1
LCUC21:
        mov     r8, r12, lsl #2
        mov     r3, r12, lsl #1
        adds    lr, r8, r3
        umull   lr, r7, r6, lr
        mov     r7, #0
        mov     r9, r12, lsr #30
        orr     r10, r9, r7, lsl #2
        adds    lr, lr, #1
        cmp     r0, #0
        mov     r7, #0
        mov     r11, r12, lsr #31
        sbcs    r9, r1, lr, lsl #25
        orr     r7, r11, r7, lsl #1
        blt     LCUC22
        subs    r0, r0, #0
        sbc     r1, r1, lr, lsl #25
        mov     lr, r3, lsr #31
        orr     lr, lr, r7, lsl #1
        adds    r12, r8, r12, lsl #2
        adc     lr, r10, lr
        adds    r8, r12, #1
        adc     r10, lr, #0
        adds    r3, r3, #1
        adc     r7, r7, #0
LCUC22:
        mov     lr, r8, lsl #2
        mov     r12, r3, lsl #1
        adds    r9, lr, r12
        umull   r9, r11, r6, r9
        mov     r8, r8, lsr #30
        orr     r8, r8, r10, lsl #2
        mov     r2, r3, lsr #31
        adds    r10, r9, #1
        cmp     r0, #0
        sbcs    r11, r1, r10, lsl #22
        orr     r9, r2, r7, lsl #1
        blt     LCUC23
        subs    r0, r0, #0
        mov     r7, r12, lsr #31
        sbc     r1, r1, r10, lsl #22
        orr     r7, r7, r9, lsl #1
        adds    r3, lr, r3, lsl #2
        adc     r7, r8, r7
        adds    lr, r3, #1
        adc     r8, r7, #0
        adds    r12, r12, #1
        adc     r9, r9, #0
LCUC23:
        mov     r7, lr, lsl #2
        mov     r3, r12, lsl #1
        adds    r10, r7, r3
        umull   r10, r11, r6, r10
        mov     lr, lr, lsr #30
        orr     r8, lr, r8, lsl #2
        mov     r11, r12, lsr #31
        adds    r10, r10, #1
        cmp     r0, #0
        sbcs    lr, r1, r10, lsl #19
        orr     r9, r11, r9, lsl #1
        blt     LCUC24
        subs    r0, r0, #0
        mov     lr, r3, lsr #31
        sbc     r1, r1, r10, lsl #19
        orr     lr, lr, r9, lsl #1
        adds    r12, r7, r12, lsl #2
        adc     lr, r8, lr
        adds    r7, r12, #1
        adc     r8, lr, #0
        adds    r3, r3, #1
        adc     r9, r9, #0
LCUC24:
        mov     lr, r7, lsl #2
        mov     r12, r3, lsl #1
        adds    r10, lr, r12
        umull   r10, r11, r6, r10
        mov     r7, r7, lsr #30
        orr     r8, r7, r8, lsl #2
        mov     r11, r3, lsr #31
        adds    r10, r10, #1
        cmp     r0, #0
        sbcs    r7, r1, r10, lsl #16
        orr     r9, r11, r9, lsl #1
        blt     LCUC25
        subs    r0, r0, #0
        mov     r7, r12, lsr #31
        sbc     r1, r1, r10, lsl #16
        orr     r7, r7, r9, lsl #1
        adds    r3, lr, r3, lsl #2
        adc     r7, r8, r7
        adds    lr, r3, #1
        adc     r8, r7, #0
        adds    r12, r12, #1
        adc     r9, r9, #0
LCUC25:
        mov     r7, lr, lsl #2
        mov     r3, r12, lsl #1
        adds    r10, r7, r3
        umull   r10, r11, r6, r10
        mov     lr, lr, lsr #30
        orr     r8, lr, r8, lsl #2
        mov     r11, r12, lsr #31
        adds    r10, r10, #1
        cmp     r0, #0
        sbcs    lr, r1, r10, lsl #13
        orr     r9, r11, r9, lsl #1
        blt     LCUC26
        subs    r0, r0, #0
        mov     lr, r3, lsr #31
        sbc     r1, r1, r10, lsl #13
        orr     lr, lr, r9, lsl #1
        adds    r12, r7, r12, lsl #2
        adc     lr, r8, lr
        adds    r7, r12, #1
        adc     r8, lr, #0
        adds    r3, r3, #1
        adc     r9, r9, #0
LCUC26:
        mov     lr, r7, lsl #2
        mov     r12, r3, lsl #1
        adds    r10, lr, r12
        umull   r10, r11, r6, r10
        mov     r7, r7, lsr #30
        orr     r8, r7, r8, lsl #2
        mov     r11, r3, lsr #31
        adds    r10, r10, #1
        cmp     r0, #0
        sbcs    r7, r1, r10, lsl #10
        orr     r9, r11, r9, lsl #1
        blt     LCUC27
        subs    r0, r0, #0
        mov     r7, r12, lsr #31
        sbc     r1, r1, r10, lsl #10
        orr     r7, r7, r9, lsl #1
        adds    r3, lr, r3, lsl #2
        adc     r7, r8, r7
        adds    lr, r3, #1
        adc     r8, r7, #0
        adds    r12, r12, #1
        adc     r9, r9, #0
LCUC27:
        mov     r7, lr, lsl #2
        mov     r3, r12, lsl #1
        adds    r10, r7, r3
        umull   r10, r11, r6, r10
        mov     lr, lr, lsr #30
        orr     r8, lr, r8, lsl #2
        mov     r11, r12, lsr #31
        adds    r10, r10, #1
        cmp     r0, #0
        sbcs    lr, r1, r10, lsl #7
        orr     r9, r11, r9, lsl #1
        blt     LCUC28
        subs    r0, r0, #0
        mov     lr, r3, lsr #31
        sbc     r1, r1, r10, lsl #7
        orr     lr, lr, r9, lsl #1
        adds    r12, r7, r12, lsl #2
        adc     lr, r8, lr
        adds    r7, r12, #1
        adc     r8, lr, #0
        adds    r3, r3, #1
        adc     r9, r9, #0
LCUC28:
        mov     r12, r7, lsl #2
        mov     lr, r3, lsl #1
        adds    r10, r12, lr
        umull   r10, r11, r6, r10
        mov     r7, r7, lsr #30
        orr     r7, r7, r8, lsl #2
        mov     r8, r3, lsr #31
        adds    r10, r10, #1
        cmp     r0, #0
        sbcs    r11, r1, r10, lsl #4
        orr     r8, r8, r9, lsl #1
        blt     LCUC29
        subs    r0, r0, #0
        mov     r9, lr, lsr #31
        sbc     r1, r1, r10, lsl #4
        orr     r9, r9, r8, lsl #1
        adds    r3, r12, r3, lsl #2
        adc     r9, r7, r9
        adds    r12, r3, #1
        adc     r7, r9, #0
        adds    lr, lr, #1
        adc     r8, r8, #0
LCUC29:
        mov     r9, r12, lsl #2
        mov     r3, lr, lsl #1
        adds    r10, r9, r3
        umull   r10, r11, r6, r10
        mov     r12, r12, lsr #30
        orr     r11, r12, r7, lsl #2
        mov     r12, lr, lsr #31
        adds    r10, r10, #1
        cmp     r0, #0
        sbcs    r7, r1, r10, lsl #1
        orr     r12, r12, r8, lsl #1
        blt     LCUC30
        subs    r0, r0, #0
        mov     r7, r3, lsr #31
        sbc     r1, r1, r10, lsl #1
        orr     r7, r7, r12, lsl #1
        adds    lr, r9, lr, lsl #2
        adc     r7, r11, r7
        adds    r9, lr, #1
        adc     r11, r7, #0
        adds    r3, r3, #1
        adc     r12, r12, #0
LCUC30:
        mov     r10, r9, lsl #2
        mov     r7, r3, lsl #1
        mov     r2, r9, lsr #30
        adds    lr, r10, r7
        umull   lr, r8, r6, lr
        mov     r9, r3, lsr #31
        orr     r12, r9, r12, lsl #1
        orr     r11, r2, r11, lsl #2
        adc     r9, r11, r12
        adds    lr, lr, #1
        add     r9, r9, r9, lsl #1
        add     r8, r9, r8
        adc     r8, r8, #0
        mov     r9, lr, lsr #2
        cmp     r0, lr, lsl #30
        orr     r8, r9, r8, lsl #30
        sbcs    r9, r1, r8
        blt     LCUC31
        subs    r0, r0, lr, lsl #30
        mov     lr, r7, lsr #31
        sbc     r1, r1, r8
        orr     lr, lr, r12, lsl #1
        adds    r3, r10, r3, lsl #2
        adc     lr, r11, lr
        adds    r10, r3, #1
        adc     r11, lr, #0
        adds    r7, r7, #1
        adc     r12, r12, #0
LCUC31:
        mov     r9, r10, lsl #2
        mov     lr, r7, lsl #1
        mov     r2, r10, lsr #30
        adds    r3, r9, lr
        umull   r3, r8, r6, r3
        mov     r10, r7, lsr #31
        orr     r12, r10, r12, lsl #1
        orr     r11, r2, r11, lsl #2
        adc     r10, r11, r12
        adds    r3, r3, #1
        add     r10, r10, r10, lsl #1
        add     r8, r10, r8
        adc     r8, r8, #0
        mov     r10, r3, lsr #5
        cmp     r0, r3, lsl #27
        orr     r8, r10, r8, lsl #27
        sbcs    r10, r1, r8
        blt     LCUC32
        subs    r0, r0, r3, lsl #27
        mov     r3, lr, lsr #31
        sbc     r1, r1, r8
        orr     r3, r3, r12, lsl #1
        adds    r7, r9, r7, lsl #2
        adc     r3, r11, r3
        adds    r9, r7, #1
        adc     r11, r3, #0
        adds    lr, lr, #1
        adc     r12, r12, #0
LCUC32:
        mov     r10, r9, lsl #2
        mov     r7, lr, lsl #1
        mov     r2, r9, lsr #30
        adds    r3, r10, r7
        umull   r3, r8, r6, r3
        mov     r9, lr, lsr #31
        orr     r12, r9, r12, lsl #1
        orr     r11, r2, r11, lsl #2
        adc     r9, r11, r12
        adds    r3, r3, #1
        add     r9, r9, r9, lsl #1
        add     r8, r9, r8
        adc     r8, r8, #0
        mov     r9, r3, lsr #8
        cmp     r0, r3, lsl #24
        orr     r8, r9, r8, lsl #24
        sbcs    r9, r1, r8
        blt     LCUC33
        subs    r0, r0, r3, lsl #24
        mov     r3, r7, lsr #31
        sbc     r1, r1, r8
        orr     r3, r3, r12, lsl #1
        adds    lr, r10, lr, lsl #2
        adc     r3, r11, r3
        adds    r10, lr, #1
        adc     r11, r3, #0
        adds    r7, r7, #1
        adc     r12, r12, #0
LCUC33:
        mov     lr, r10, lsl #2
        mov     r9, r7, lsl #1
        mov     r2, r10, lsr #30
        adds    r3, lr, r9
        umull   r3, r8, r6, r3
        mov     r10, r7, lsr #31
        orr     r12, r10, r12, lsl #1
        orr     r11, r2, r11, lsl #2
        adc     r10, r11, r12
        adds    r3, r3, #1
        add     r10, r10, r10, lsl #1
        add     r8, r10, r8
        adc     r8, r8, #0
        mov     r10, r3, lsr #11
        cmp     r0, r3, lsl #21
        orr     r8, r10, r8, lsl #21
        sbcs    r10, r1, r8
        blt     LCUC34
        subs    r0, r0, r3, lsl #21
        mov     r3, r9, lsr #31
        sbc     r1, r1, r8
        orr     r3, r3, r12, lsl #1
        adds    r7, lr, r7, lsl #2
        adc     r3, r11, r3
        adds    lr, r7, #1
        adc     r11, r3, #0
        adds    r9, r9, #1
        adc     r12, r12, #0
LCUC34:
        mov     r3, lr, lsl #2
        mov     r7, r9, lsl #1
        adds    r8, r3, r7
        umull   r8, r10, r6, r8
        mov     lr, lr, lsr #30
        mov     r2, r9, lsr #31
        orr     lr, lr, r11, lsl #2
        orr     r12, r2, r12, lsl #1
        adc     r11, lr, r12
        adds    r8, r8, #1
        add     r11, r11, r11, lsl #1
        add     r10, r11, r10
        adc     r10, r10, #0
        mov     r11, r8, lsr #14
        cmp     r0, r8, lsl #18
        orr     r10, r11, r10, lsl #18
        sbcs    r11, r1, r10
        blt     LCUC35
        subs    r0, r0, r8, lsl #18
        mov     r8, r7, lsr #31
        sbc     r1, r1, r10
        orr     r8, r8, r12, lsl #1
        adds    r9, r3, r9, lsl #2
        adc     r8, lr, r8
        adds    r3, r9, #1
        adc     lr, r8, #0
        adds    r7, r7, #1
        adc     r12, r12, #0
LCUC35:
        mov     r9, r3, lsl #2
        mov     r11, r7, lsl #1
        mov     r2, r3, lsr #30
        adds    r8, r9, r11
        umull   r8, r10, r6, r8
        mov     r3, r7, lsr #31
        orr     r12, r3, r12, lsl #1
        orr     lr, r2, lr, lsl #2
        adc     r3, lr, r12
        adds    r8, r8, #1
        add     r3, r3, r3, lsl #1
        add     r10, r3, r10
        adc     r3, r10, #0
        mov     r10, r8, lsr #17
        cmp     r0, r8, lsl #15
        orr     r3, r10, r3, lsl #15
        sbcs    r10, r1, r3
        blt     LCUC36
        subs    r0, r0, r8, lsl #15
        sbc     r1, r1, r3
        mov     r3, r11, lsr #31
        orr     r3, r3, r12, lsl #1
        adds    r7, r9, r7, lsl #2
        adc     r3, lr, r3
        adds    r9, r7, #1
        adc     lr, r3, #0
        adds    r11, r11, #1
        adc     r12, r12, #0
LCUC36:
        mov     r7, r9, lsl #2
        mov     r10, r11, lsl #1
        mov     r2, r9, lsr #30
        adds    r3, r7, r10
        umull   r3, r8, r6, r3
        mov     r9, r11, lsr #31
        orr     r12, r9, r12, lsl #1
        orr     lr, r2, lr, lsl #2
        adc     r9, lr, r12
        adds    r3, r3, #1
        add     r9, r9, r9, lsl #1
        add     r8, r9, r8
        adc     r8, r8, #0
        mov     r9, r3, lsr #20
        cmp     r0, r3, lsl #12
        orr     r8, r9, r8, lsl #12
        sbcs    r9, r1, r8
        blt     LCUC37
        subs    r0, r0, r3, lsl #12
        mov     r3, r10, lsr #31
        sbc     r1, r1, r8
        orr     r3, r3, r12, lsl #1
        adds    r11, r7, r11, lsl #2
        adc     r3, lr, r3
        adds    r7, r11, #1
        adc     lr, r3, #0
        adds    r10, r10, #1
        adc     r12, r12, #0
LCUC37:
        mov     r8, r7, lsl #2
        mov     r11, r10, lsl #1
        mov     r2, r7, lsr #30
        adds    r3, r8, r11
        umull   r3, r9, r6, r3
        mov     r7, r10, lsr #31
        orr     r12, r7, r12, lsl #1
        orr     lr, r2, lr, lsl #2
        adc     r7, lr, r12
        adds    r3, r3, #1
        add     r7, r7, r7, lsl #1
        add     r9, r7, r9
        adc     r7, r9, #0
        mov     r9, r3, lsr #23
        cmp     r0, r3, lsl #9
        orr     r7, r9, r7, lsl #9
        sbcs    r9, r1, r7
        blt     LCUC38
        subs    r0, r0, r3, lsl #9
        mov     r3, r11, lsr #31
        sbc     r1, r1, r7
        orr     r3, r3, r12, lsl #1
        adds    r10, r8, r10, lsl #2
        adc     r3, lr, r3
        adds    r8, r10, #1
        adc     lr, r3, #0
        adds    r11, r11, #1
        adc     r12, r12, #0
LCUC38:
        mov     r7, r8, lsl #2
        mov     r10, r11, lsl #1
        mov     r2, r8, lsr #30
        adds    r3, r7, r10
        umull   r3, r9, r6, r3
        mov     r8, r11, lsr #31
        orr     r12, r8, r12, lsl #1
        orr     lr, r2, lr, lsl #2
        adc     r8, lr, r12
        adds    r3, r3, #1
        add     r8, r8, r8, lsl #1
        add     r9, r8, r9
        adc     r8, r9, #0
        mov     r9, r3, lsr #26
        cmp     r0, r3, lsl #6
        orr     r8, r9, r8, lsl #6
        sbcs    r9, r1, r8
        blt     LCUC39
        subs    r0, r0, r3, lsl #6
        mov     r3, r10, lsr #31
        sbc     r1, r1, r8
        orr     r3, r3, r12, lsl #1
        adds    r11, r7, r11, lsl #2
        adc     r3, lr, r3
        adds    r7, r11, #1
        adc     lr, r3, #0
        adds    r10, r10, #1
        adc     r12, r12, #0
LCUC39:
        mov     r8, r7, lsl #2
        mov     r11, r10, lsl #1
        mov     r2, r7, lsr #30
        adds    r3, r8, r11
        umull   r3, r9, r6, r3
        mov     r7, r10, lsr #31
        orr     r12, r7, r12, lsl #1
        orr     lr, r2, lr, lsl #2
        adc     r7, lr, r12
        adds    r3, r3, #1
        add     r7, r7, r7, lsl #1
        add     r9, r7, r9
        adc     r7, r9, #0
        mov     r9, r3, lsr #29
        cmp     r0, r3, lsl #3
        orr     r7, r9, r7, lsl #3
        sbcs    r9, r1, r7
        blt     LCUC40
        subs    r0, r0, r3, lsl #3
        mov     r3, r11, lsr #31
        sbc     r1, r1, r7
        orr     r3, r3, r12, lsl #1
        adds    r10, r8, r10, lsl #2
        adc     r3, lr, r3
        adds    r8, r10, #1
        adc     lr, r3, #0
        adds    r11, r11, #1
        adc     r12, r12, #0
LCUC40:
        mov     r9, r11, lsl #1
        adds    r3, r9, r8, lsl #2
        umull   r3, r7, r6, r3
        mov     r8, r8, lsr #30
        mov     r11, r11, lsr #31
        orr     lr, r8, lr, lsl #2
        orr     r12, r11, r12, lsl #1
        adc     lr, lr, r12
        adds    r3, r3, #1
        add     lr, lr, lr, lsl #1
        add     r7, lr, r7
        adc     r12, r7, #0
        cmp     r0, r3
        sbcs    r1, r1, r12
        blt     LCUC41
        adds    r9, r9, #1
LCUC41:
        ldr     r0, [sp, #0xC]
        umull   r9, r0, r0, r9
        strh    r9, [r5]
LCUC42:
        ldr     r0, [sp, #4]
        ldr     r3, [sp, #8]
        add     r5, r5, #2
        add     r0, r0, #1
        str     r0, [sp, #4]
        cmp     r0, r3
        blt     LCUC19
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LCUC43:
        mvn     r0, #2, 2
        mov     r0, r0, lsl #15
        strh    r0, [r5]
        b       LCUC42
LCUC44:
        mvn     r0, #7
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}


