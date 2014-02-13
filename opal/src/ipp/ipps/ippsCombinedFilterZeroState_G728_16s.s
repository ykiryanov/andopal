        .text
        .align  4
        .globl  _ippsCombinedFilterZeroState_G728_16s


_ippsCombinedFilterZeroState_G728_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x60
        add     r12, sp, #0x40
        ldr     lr, [sp, #0x84]
        and     r4, r12, #0xF
        ldr     r12, [sp, #0x88]
        rsb     r4, r4, #0
        add     r5, sp, #0x40
        str     r12, [sp, #0x24]
        ldr     r12, [sp, #0x8C]
        and     r4, r4, #0xF
        cmp     r0, #0
        add     r5, r5, r4
        beq     LDGE71
        cmp     r1, #0
        beq     LDGE71
        cmp     r2, #0
        beq     LDGE71
        cmp     lr, #0
        beq     LDGE71
        ldr     r6, [sp, #0x24]
        cmp     r6, #0
        beq     LDGE71
        cmp     r12, #0
        beq     LDGE71
        sub     r7, r0, #2
        add     r0, r12, #0x90
        mov     r10, #0
        mvn     r9, #2, 2
        mvn     r8, #0
        str     r5, [sp, #8]
        str     r4, [sp, #0xC]
        str     lr, [sp, #0x14]
        str     r3, [sp, #0x18]
        str     r1, [sp, #0x20]
LDGE0:
        ldrsh   lr, [r2]
        mov     r4, r10, lsl #16
        mov     r3, #1
        add     r1, r2, #2
        mov     r6, r4, asr #16
        mov     lr, lr, asr r6
        strh    lr, [r12, #0x90]
        str     r10, [sp]
        str     r2, [sp, #0x1C]
LDGE1:
        ldrsh   r2, [r1], #2
        cmp     r3, #0
        mov     r2, r2, asr r6
        mov     r10, r3
        mov     r2, r2, lsl #14
        ble     LDGE4
        add     lr, r12, r10, lsl #1
        mov     r4, #0x8E
        add     lr, r4, lr
        add     r4, r0, r10, lsl #1
        add     r5, r7, r10, lsl #1
        str     r0, [sp, #4]
        str     r12, [sp, #0x10]
LDGE2:
        ldrsh   r11, [lr], #-2
        mov     r0, r2, asr #31
        strh    r11, [r4], #-2
        ldrsh   r12, [r5], #-2
        mul     r11, r12, r11
        subs    r2, r2, r11
        sbc     r0, r0, r11, asr #31
        subs    r12, r2, r9
        sbcs    r11, r0, #0
        movlt   r12, #0
        movlt   r11, #0
        orrs    r11, r12, r11
        mvnne   r2, #2, 2
        bne     LDGE3
        cmp     r2, #2, 2
        sbcs    r0, r0, r8
        movlt   r2, #2, 2
LDGE3:
        sub     r10, r10, #1
        cmp     r10, #0
        bgt     LDGE2
        ldr     r0, [sp, #4]
        ldr     r12, [sp, #0x10]
LDGE4:
        cmn     r2, #0x1F, 4
        bgt     LDGE70
        cmp     r2, #0xF, 4
        blt     LDGE68
        add     r3, r3, #1
        mov     r2, r2, asr #14
        cmp     r3, #5
        strh    r2, [r12, #0x90]
        blt     LDGE1
        ldr     r2, [sp, #0x1C]
        ldr     r5, [sp, #8]
        ldr     r4, [sp, #0xC]
        ldrsh   r7, [r2, #2]
        ldr     lr, [sp, #0x14]
        ldr     r3, [sp, #0x18]
        ldr     r1, [sp, #0x20]
        ldrsh   r8, [r2]
        mov     r7, r7, asr r6
        strh    r7, [r2, #2]
        ldrsh   r7, [r2, #6]
        mov     r8, r8, asr r6
        strh    r8, [r2]
        ldrsh   r8, [r2, #4]
        mov     r7, r7, asr r6
        strh    r7, [r2, #6]
        ldrsh   r7, [r2, #8]
        mov     r8, r8, asr r6
        sub     r3, r3, r6
        mov     r6, r7, asr r6
        strh    r8, [r2, #4]
        strh    r6, [r2, #8]
        mov     r3, r3, lsl #16
        ldrsh   r9, [r12, #0x98]
        mov     r2, r3, asr #16
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r11, #2, 2
        mvn     r10, #0
        mvn     r3, r3
        mov     r8, #1
        sub     r7, r5, #2
        sub     r6, r1, #2
        str     r10, [sp, #0x38]
        str     r11, [sp, #0x3C]
        str     r2, [sp, #0x1C]
        str     r5, [sp, #8]
        str     r4, [sp, #0xC]
        str     lr, [sp, #0x14]
LDGE5:
        rsb     r2, r8, #0
        rsb     r4, r8, #4
        add     r2, r12, r2, lsl #1
        ldrsh   r2, [r2, #0x98]
        cmp     r8, #0
        mov     lr, r8
        mov     r2, r2, lsl #14
        ble     LDGE9
        ldr     r11, [sp, #0xC]
        add     r10, sp, #0x40
        add     r5, r0, r4, lsl #1
        strh    r9, [r11, +r10]
        add     r9, r7, lr, lsl #1
        str     r9, [sp, #0x2C]
        ldr     r9, [sp, #8]
        add     r4, r1, lr, lsl #1
        add     r5, r5, lr, lsl #1
        add     r9, r9, lr, lsl #1
        str     r9, [sp, #0x34]
        str     r5, [sp, #0x30]
        mov     r9, #0x12
        add     r5, r6, lr, lsl #1
        add     r4, r9, r4
        str     r6, [sp, #0x28]
        str     r7, [sp]
        str     r8, [sp, #0x18]
        str     r12, [sp, #0x10]
        ldr     r12, [sp, #0x2C]
        ldr     r6, [sp, #0x34]
        ldr     r7, [sp, #0x30]
        ldr     r8, [sp, #0x38]
        ldr     r9, [sp, #0x3C]
        str     r0, [sp, #4]
        str     r1, [sp, #0x20]
LDGE6:
        ldrsh   r10, [r7], #-2
        ldrsh   r0, [r5], #-2
        ldrsh   r1, [r12], #-2
        mul     r10, r0, r10
        strh    r1, [r6], #-2
        adds    r0, r2, r10
        mov     r10, r10, asr #31
        adc     r2, r10, r2, asr #31
        subs    r10, r0, r9
        sbcs    r11, r2, #0
        movlt   r10, #0
        movlt   r11, #0
        orrs    r11, r10, r11
        mvnne   r0, #2, 2
        bne     LDGE7
        cmp     r0, #2, 2
        sbcs    r2, r2, r8
        movlt   r0, #2, 2
LDGE7:
        ldrsh   r2, [r4], #-2
        mul     r1, r2, r1
        subs    r2, r0, r1
        mov     r1, r1, asr #31
        rsc     r0, r1, r0, asr #31
        subs    r1, r2, r9
        sbcs    r10, r0, #0
        movlt   r1, #0
        movlt   r10, #0
        orrs    r10, r1, r10
        mvnne   r2, #2, 2
        bne     LDGE8
        cmp     r2, #2, 2
        sbcs    r0, r0, r8
        movlt   r2, #2, 2
LDGE8:
        sub     lr, lr, #1
        cmp     lr, #0
        bgt     LDGE6
        ldr     r6, [sp, #0x28]
        ldr     r7, [sp]
        ldr     r8, [sp, #0x18]
        ldr     r0, [sp, #4]
        ldr     r12, [sp, #0x10]
        ldr     r1, [sp, #0x20]
LDGE9:
        mov     r2, r2, asr #14
        cmp     r3, r2
        blt     LDGE10
        cmn     r2, #2, 18
        movge   r2, r2, lsl #16
        movge   r9, r2, asr #16
        movlt   r2, #0
        sublt   r9, r2, #2, 18
        b       LDGE11
LDGE10:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r9, r2
LDGE11:
        add     r8, r8, #1
        cmp     r8, #5
        blt     LDGE5
        ldr     r2, [sp, #0x1C]
        ldr     r4, [sp, #0xC]
        ldr     r5, [sp, #8]
        ldr     lr, [sp, #0x14]
        sub     r0, r2, #2
        add     r1, sp, #0x40
        strh    r9, [r4, +r1]
        mov     r0, r0, lsl #16
        mov     r9, r9, lsl #16
        movs    r1, r0, asr #16
        mov     r0, r9, asr #16
        bmi     LDGE59
        mov     r0, r0, asr r1
        add     r3, sp, #0x40
        strh    r0, [r4, +r3]
        ldrsh   r0, [r5, #6]
        ldrsh   r3, [r5, #4]
        ldrsh   r7, [r5, #2]
        ldrsh   r6, [r5, #8]
        mov     r0, r0, asr r1
        mov     r3, r3, asr r1
        mov     r7, r7, asr r1
        mov     r6, r6, asr r1
        mov     r1, r3, lsl #16
        mov     r0, r0, lsl #16
        mov     r7, r7, lsl #16
        mov     r6, r6, lsl #16
        mov     r1, r1, asr #16
        mov     r3, r7, asr #16
        mov     r0, r0, asr #16
        strh    r3, [r5, #2]
        strh    r1, [r5, #4]
        strh    r0, [r5, #6]
        mov     r6, r6, asr #16
LDGE12:
        strh    r6, [r5, #8]
        ldrsh   r5, [r12, #0x82]
        cmp     r2, r5
        addeq   r2, r12, #8
        streq   r2, [sp]
        beq     LDGE14
        cmp     r2, r5
        bge     LDGE13
        ldrsh   r9, [r12]
        ldrsh   r10, [r12, #2]
        ldrsh   r7, [r12, #4]
        ldrsh   r8, [r12, #6]
        ldrsh   r11, [r12, #8]
        strh    r2, [r12, #0x82]
        sub     r5, r5, r2
        cmp     r5, #0xF
        str     r11, [sp, #0x3C]
        mov     r11, #0xF
        movgt   r5, r11
        ldr     r11, [sp, #0x3C]
        mov     r9, r9, asr r5
        mov     r10, r10, asr r5
        mov     r7, r7, asr r5
        mov     r8, r8, asr r5
        mov     r5, r11, asr r5
        strh    r5, [r12, #8]
        mov     r5, r2
        strh    r9, [r12]
        strh    r10, [r12, #2]
        strh    r7, [r12, #4]
        strh    r8, [r12, #6]
        add     r2, r12, #8
        str     r2, [sp]
        b       LDGE14
LDGE13:
        sub     r2, r2, r5
        cmp     r2, #0xF
        mov     r5, #0xF
        movgt   r2, r5
        ldrsh   r5, [r12, #0x98]
        ldrsh   r8, [r12, #0x90]
        ldrsh   r7, [r12, #0x92]
        ldrsh   r10, [r12, #0x94]
        ldrsh   r9, [r12, #0x96]
        str     r5, [sp, #0x3C]
        ldr     r11, [sp, #0x3C]
        ldrsh   r5, [r12, #0x82]
        mov     r8, r8, asr r2
        mov     r7, r7, asr r2
        mov     r10, r10, asr r2
        mov     r9, r9, asr r2
        mov     r2, r11, asr r2
        strh    r2, [r12, #0x98]
        strh    r8, [r12, #0x90]
        strh    r7, [r12, #0x92]
        strh    r10, [r12, #0x94]
        strh    r9, [r12, #0x96]
        add     r2, r12, #8
        str     r2, [sp]
LDGE14:
        mov     r2, #0xFF
        orr     r2, r2, #0x7F, 24
        cmp     r5, #0
        sub     r7, r2, #7, 20
        rsble   r5, r5, #0
        movle   r2, r7, asr r5
        ble     LDGE15
        bic     r5, r5, #0xFF, 8
        bic     r5, r5, #0xFF, 16
        mvn     r2, #2, 2
        cmp     r7, r2, asr r5
        mov     r7, #2, 2
        bgt     LDGE15
        mov     r2, #0xFF
        orr     r2, r2, #0x7F, 24
        sub     r2, r2, #7, 20
        cmp     r2, r7, asr r5
        movlt   r2, #2, 2
        blt     LDGE15
        mov     r2, #0xFF
        orr     r2, r2, #0x7F, 24
        sub     r2, r2, #7, 20
        mov     r2, r2, lsl r5
LDGE15:
        ldrsh   r5, [r12, #0x90]
        ldrsh   r7, [r12]
        add     r5, r7, r5
        cmp     r5, r2
        movgt   r5, r2
        rsb     r9, r2, #0
        cmp     r5, r9
        movlt   r5, r9
        mvn     r7, #0xFF
        bic     r7, r7, #0x7F, 24
        mvn     r7, r7
        cmp     r7, r5
        blt     LDGE16
        cmn     r5, #2, 18
        movge   r5, r5, lsl #16
        movge   r5, r5, asr #16
        movlt   r5, #0
        sublt   r5, r5, #2, 18
        b       LDGE17
LDGE16:
        mvn     r5, #0xFF
        bic     r5, r5, #0x7F, 24
        mvn     r5, r5
LDGE17:
        strh    r5, [r12]
        ldrsh   r5, [r12, #0x92]
        ldrsh   r7, [r12, #2]
        add     r5, r7, r5
        cmp     r5, r2
        movgt   r5, r2
        cmp     r5, r9
        movlt   r5, r9
        mvn     r7, #0xFF
        bic     r7, r7, #0x7F, 24
        mvn     r7, r7
        cmp     r7, r5
        blt     LDGE18
        cmn     r5, #2, 18
        movge   r5, r5, lsl #16
        movge   r5, r5, asr #16
        movlt   r5, #0
        sublt   r5, r5, #2, 18
        b       LDGE19
LDGE18:
        mvn     r5, #0xFF
        bic     r5, r5, #0x7F, 24
        mvn     r5, r5
LDGE19:
        ldrsh   r7, [r12, #0x94]
        ldrsh   r8, [r12, #4]
        strh    r5, [r12, #2]
        add     r7, r8, r7
        cmp     r7, r2
        movgt   r7, r2
        cmp     r7, r9
        movlt   r7, r9
        mvn     r8, #0xFF
        bic     r8, r8, #0x7F, 24
        mvn     r8, r8
        cmp     r8, r7
        blt     LDGE20
        cmn     r7, #2, 18
        movge   r7, r7, lsl #16
        movge   r7, r7, asr #16
        movlt   r7, #0
        sublt   r7, r7, #2, 18
        b       LDGE21
LDGE20:
        mvn     r7, #0xFF
        bic     r7, r7, #0x7F, 24
        mvn     r7, r7
LDGE21:
        ldrsh   r8, [r12, #0x96]
        ldrsh   r10, [r12, #6]
        strh    r7, [r12, #4]
        add     r8, r10, r8
        cmp     r8, r2
        movgt   r8, r2
        cmp     r8, r9
        movlt   r8, r9
        mvn     r10, #0xFF
        bic     r10, r10, #0x7F, 24
        mvn     r10, r10
        cmp     r10, r8
        blt     LDGE22
        cmn     r8, #2, 18
        movge   r8, r8, lsl #16
        movge   r8, r8, asr #16
        movlt   r8, #0
        sublt   r8, r8, #2, 18
        b       LDGE23
LDGE22:
        mvn     r8, #0xFF
        bic     r8, r8, #0x7F, 24
        mvn     r8, r8
LDGE23:
        ldrsh   r10, [r12, #0x98]
        ldrsh   r11, [r12, #8]
        strh    r8, [r12, #6]
        add     r10, r11, r10
        cmp     r10, r2
        movgt   r10, r2
        cmp     r10, r9
        movlt   r10, r9
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r2, r2
        cmp     r2, r10
        blt     LDGE24
        cmn     r10, #2, 18
        movge   r10, r10, lsl #16
        movge   r11, r10, asr #16
        movlt   r2, #0
        sublt   r11, r2, #2, 18
        b       LDGE25
LDGE24:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r11, r2
LDGE25:
        ldrsh   r10, [r12]
        ldrsh   r9, [r12]
        strh    r11, [r12, #8]
        mov     r2, r10
        cmp     r9, r2
        movgt   r10, r9
        cmp     r9, r2
        movlt   r2, r9
        cmp     r5, r10
        movgt   r10, r5
        cmp     r5, r2
        movlt   r2, r5
        cmp     r7, r10
        movgt   r10, r7
        cmp     r7, r2
        movlt   r2, r7
        cmp     r8, r10
        movgt   r10, r8
        cmp     r8, r2
        movlt   r2, r8
        cmp     r11, r10
        movgt   r10, r11
        cmp     r11, r2
        movlt   r2, r11
        orrs    r7, r10, r2
        mov     r5, #0
        bne     LDGE26
        strh    r5, [r12]
        strh    r5, [r12, #2]
        strh    r5, [r12, #4]
        strh    r5, [r12, #6]
        strh    r5, [r12, #8]
        mov     r5, #0xD
        b       LDGE39
LDGE26:
        cmp     r10, #0
        blt     LDGE27
        rsb     r5, r10, #0
        cmp     r2, r5
        bge     LDGE33
LDGE27:
        cmn     r2, #2, 20
        bge     LDGE30
        cmn     r2, #2, 20
        movge   r5, #0
        bge     LDGE29
        mov     r5, #0
LDGE28:
        add     r5, r5, #1
        mov     r2, r2, asr #1
        mov     r5, r5, lsl #16
        cmn     r2, #2, 20
        mov     r5, r5, asr #16
        blt     LDGE28
LDGE29:
        mov     r9, r9, asr r5
        strh    r9, [r12]
        ldrsh   r7, [r12, #2]
        ldrsh   r2, [r12, #4]
        ldrsh   r9, [r12, #6]
        ldrsh   r8, [r12, #8]
        rsb     r10, r5, #0
        str     r10, [sp, #0x3C]
        mov     r7, r7, asr r5
        mov     r2, r2, asr r5
        mov     r9, r9, asr r5
        mov     r5, r8, asr r5
        ldr     r8, [sp, #0x3C]
        strh    r5, [r12, #8]
        strh    r7, [r12, #2]
        mov     r8, r8, lsl #16
        strh    r2, [r12, #4]
        strh    r9, [r12, #6]
        mov     r5, r8, asr #16
        b       LDGE39
LDGE30:
        cmn     r2, #1, 20
        movlt   r5, #0
        blt     LDGE32
        mov     r5, #0
LDGE31:
        mov     r2, r2, lsl #1
        add     r5, r5, #1
        mov     r2, r2, lsl #16
        mov     r5, r5, lsl #16
        mov     r2, r2, asr #16
        cmn     r2, #1, 20
        mov     r5, r5, asr #16
        bge     LDGE31
LDGE32:
        mov     r9, r9, lsl r5
        strh    r9, [r12]
        ldrsh   r2, [r12, #2]
        ldrsh   r8, [r12, #4]
        ldrsh   r9, [r12, #6]
        ldrsh   r7, [r12, #8]
        mov     r2, r2, lsl r5
        mov     r8, r8, lsl r5
        mov     r9, r9, lsl r5
        mov     r7, r7, lsl r5
        strh    r2, [r12, #2]
        strh    r8, [r12, #4]
        strh    r9, [r12, #6]
        strh    r7, [r12, #8]
        b       LDGE39
LDGE33:
        mov     r2, #0xFF
        orr     r2, r2, #0x7F, 24
        sub     r2, r2, #6, 20
        cmp     r2, r10
        bge     LDGE36
        mov     r2, #0xFF
        orr     r2, r2, #0x7F, 24
        sub     r2, r2, #6, 20
        cmp     r2, r10
        movge   r2, #0
        bge     LDGE35
        mov     r2, #0xFF
        orr     r2, r2, #0x7F, 24
        sub     r5, r2, #6, 20
        mov     r2, #0
LDGE34:
        add     r2, r2, #1
        mov     r10, r10, asr #1
        mov     r2, r2, lsl #16
        cmp     r5, r10
        mov     r2, r2, asr #16
        blt     LDGE34
LDGE35:
        mov     r9, r9, asr r2
        strh    r9, [r12]
        ldrsh   r9, [r12, #2]
        ldrsh   r5, [r12, #4]
        ldrsh   r8, [r12, #6]
        ldrsh   r7, [r12, #8]
        mov     r9, r9, asr r2
        rsb     r10, r2, #0
        str     r9, [sp, #0x38]
        str     r10, [sp, #0x3C]
        mov     r5, r5, asr r2
        mov     r8, r8, asr r2
        mov     r2, r7, asr r2
        ldr     r7, [sp, #0x3C]
        ldr     r9, [sp, #0x38]
        strh    r5, [r12, #4]
        mov     r7, r7, lsl #16
        strh    r8, [r12, #6]
        strh    r9, [r12, #2]
        strh    r2, [r12, #8]
        mov     r5, r7, asr #16
        b       LDGE39
LDGE36:
        cmp     r10, #1, 20
        movge   r5, #0
        bge     LDGE38
        mov     r5, #0
LDGE37:
        mov     r10, r10, lsl #1
        add     r2, r5, #1
        mov     r5, r10, lsl #16
        mov     r2, r2, lsl #16
        mov     r10, r5, asr #16
        cmp     r10, #1, 20
        mov     r5, r2, asr #16
        blt     LDGE37
LDGE38:
        mov     r9, r9, lsl r5
        strh    r9, [r12]
        ldrsh   r9, [r12, #8]
        ldrsh   r2, [r12, #2]
        ldrsh   r7, [r12, #4]
        ldrsh   r8, [r12, #6]
        str     r9, [sp, #0x3C]
        ldr     r9, [sp, #0x3C]
        mov     r2, r2, lsl r5
        mov     r7, r7, lsl r5
        mov     r8, r8, lsl r5
        mov     r9, r9, lsl r5
        strh    r2, [r12, #2]
        strh    r7, [r12, #4]
        strh    r8, [r12, #6]
        strh    r9, [r12, #8]
LDGE39:
        add     r2, sp, #0x40
        ldrsh   r4, [r4, +r2]
        ldrsh   r7, [r12, #0x82]
        ldrsh   r2, [r12, #0xB0]
        add     r7, r5, r7
        strh    r7, [r12, #0x82]
        add     r5, r2, r4
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r4, r2
        cmp     r4, r5
        mov     r4, #0
        mvnlt   r5, r2
        blt     LDGE40
        cmn     r5, #2, 18
        movge   r5, r5, lsl #16
        movge   r5, r5, asr #16
        sublt   r5, r4, #2, 18
LDGE40:
        strh    r5, [r12, #0xB0]
        ldrsh   r5, [r12, #0xB2]
        add     r3, r5, r3
        mvn     r5, r2
        cmp     r5, r3
        mvnlt   r3, r2
        blt     LDGE41
        cmn     r3, #2, 18
        movge   r3, r3, lsl #16
        movge   r3, r3, asr #16
        sublt   r3, r4, #2, 18
LDGE41:
        ldrsh   r5, [r12, #0xB4]
        strh    r3, [r12, #0xB2]
        mvn     r3, r2
        add     r1, r5, r1
        cmp     r3, r1
        mvnlt   r1, r2
        blt     LDGE42
        cmn     r1, #2, 18
        movge   r1, r1, lsl #16
        movge   r1, r1, asr #16
        sublt   r1, r4, #2, 18
LDGE42:
        ldrsh   r3, [r12, #0xB6]
        strh    r1, [r12, #0xB4]
        mvn     r1, r2
        add     r0, r3, r0
        cmp     r1, r0
        mvnlt   r0, r2
        blt     LDGE43
        cmn     r0, #2, 18
        movge   r0, r0, lsl #16
        movge   r0, r0, asr #16
        sublt   r0, r4, #2, 18
LDGE43:
        ldrsh   r1, [r12, #0xB8]
        strh    r0, [r12, #0xB6]
        mvn     r0, r2
        add     r6, r1, r6
        cmp     r0, r6
        mvnlt   r0, r2
        blt     LDGE44
        cmn     r6, #2, 18
        movge   r6, r6, lsl #16
        movge   r0, r6, asr #16
        sublt   r0, r4, #2, 18
LDGE44:
        ldrsh   r3, [r12, #0x82]
        ldrsh   r1, [r12]
        strh    r0, [r12, #0xB8]
        sub     r3, r3, #2
        mov     r0, r3, lsl #16
        movs    r0, r0, asr #16
        bmi     LDGE53
        ldrsh   r7, [r12, #2]
        ldrsh   r6, [r12, #4]
        ldrsh   r5, [r12, #6]
        ldrsh   r3, [r12, #8]
        mov     r1, r1, asr r0
        mov     r7, r7, asr r0
        mov     r6, r6, asr r0
        mov     r5, r5, asr r0
        mov     r0, r3, asr r0
        strh    r1, [r12, #0x90]
        strh    r7, [r12, #0x92]
        strh    r6, [r12, #0x94]
        strh    r5, [r12, #0x96]
        strh    r0, [r12, #0x98]
LDGE45:
        ldrsh   r0, [r12, #0x80]
        ldrsh   r1, [r12, #0xA]
        sub     r0, r0, #2
        mov     r0, r0, lsl #16
        movs    r0, r0, asr #16
        bmi     LDGE47
        ldrsh   r5, [r12, #0xC]
        ldrsh   r4, [r12, #0xE]
        ldrsh   r3, [r12, #0x10]
        ldrsh   r2, [r12, #0x12]
        mov     r1, r1, asr r0
        strh    r1, [r12, #0x9A]
        mov     r1, r5, asr r0
        mov     r4, r4, asr r0
        mov     r3, r3, asr r0
        mov     r0, r2, asr r0
        strh    r1, [r12, #0x9C]
        strh    r4, [r12, #0x9E]
        strh    r3, [r12, #0xA0]
        strh    r0, [r12, #0xA2]
LDGE46:
        ldr     r0, [sp]
        ldrsh   r1, [r0]
        mov     r0, #0
        strh    r1, [lr]
        ldrsh   r1, [r12, #6]
        strh    r1, [lr, #2]
        ldrsh   r1, [r12, #4]
        strh    r1, [lr, #4]
        ldrsh   r1, [r12, #2]
        strh    r1, [lr, #6]
        ldrsh   r1, [r12]
        strh    r1, [lr, #8]
        ldr     r1, [sp, #0x24]
        ldrsh   r12, [r12, #0x82]
        strh    r12, [r1]
        add     sp, sp, #0x60
        ldmia   sp!, {r4 - r11, pc}
LDGE47:
        rsb     r0, r0, #0
        mov     r1, r1, lsl r0
        mvn     r3, r2
        cmp     r3, r1
        mvnlt   r1, r2
        blt     LDGE48
        cmn     r1, #2, 18
        movge   r1, r1, lsl #16
        movge   r1, r1, asr #16
        sublt   r1, r4, #2, 18
LDGE48:
        ldrsh   r3, [r12, #0xC]
        strh    r1, [r12, #0x9A]
        mvn     r1, r2
        mov     r3, r3, lsl r0
        cmp     r1, r3
        mvnlt   r1, r2
        blt     LDGE49
        cmn     r3, #2, 18
        movge   r3, r3, lsl #16
        movge   r1, r3, asr #16
        sublt   r1, r4, #2, 18
LDGE49:
        ldrsh   r3, [r12, #0xE]
        strh    r1, [r12, #0x9C]
        mvn     r1, r2
        mov     r3, r3, lsl r0
        cmp     r1, r3
        mvnlt   r1, r2
        blt     LDGE50
        cmn     r3, #2, 18
        movge   r3, r3, lsl #16
        movge   r1, r3, asr #16
        sublt   r1, r4, #2, 18
LDGE50:
        ldrsh   r3, [r12, #0x10]
        strh    r1, [r12, #0x9E]
        mvn     r1, r2
        mov     r3, r3, lsl r0
        cmp     r1, r3
        mvnlt   r1, r2
        blt     LDGE51
        cmn     r3, #2, 18
        movge   r3, r3, lsl #16
        movge   r1, r3, asr #16
        sublt   r1, r4, #2, 18
LDGE51:
        ldrsh   r3, [r12, #0x12]
        strh    r1, [r12, #0xA0]
        mvn     r1, r2
        mov     r0, r3, lsl r0
        cmp     r1, r0
        mvnlt   r4, r2
        blt     LDGE52
        cmn     r0, #2, 18
        movge   r0, r0, lsl #16
        movge   r4, r0, asr #16
        sublt   r4, r4, #2, 18
LDGE52:
        strh    r4, [r12, #0xA2]
        b       LDGE46
LDGE53:
        rsb     r0, r0, #0
        mov     r1, r1, lsl r0
        mvn     r3, r2
        cmp     r3, r1
        mvnlt   r1, r2
        blt     LDGE54
        cmn     r1, #2, 18
        movge   r1, r1, lsl #16
        movge   r1, r1, asr #16
        sublt   r1, r4, #2, 18
LDGE54:
        ldrsh   r3, [r12, #2]
        strh    r1, [r12, #0x90]
        mvn     r1, r2
        mov     r3, r3, lsl r0
        cmp     r1, r3
        mvnlt   r1, r2
        blt     LDGE55
        cmn     r3, #2, 18
        movge   r3, r3, lsl #16
        movge   r1, r3, asr #16
        sublt   r1, r4, #2, 18
LDGE55:
        ldrsh   r3, [r12, #4]
        strh    r1, [r12, #0x92]
        mvn     r1, r2
        mov     r3, r3, lsl r0
        cmp     r1, r3
        mvnlt   r1, r2
        blt     LDGE56
        cmn     r3, #2, 18
        movge   r3, r3, lsl #16
        movge   r1, r3, asr #16
        sublt   r1, r4, #2, 18
LDGE56:
        ldrsh   r3, [r12, #6]
        strh    r1, [r12, #0x94]
        mvn     r1, r2
        mov     r3, r3, lsl r0
        cmp     r1, r3
        mvnlt   r1, r2
        blt     LDGE57
        cmn     r3, #2, 18
        movge   r3, r3, lsl #16
        movge   r1, r3, asr #16
        sublt   r1, r4, #2, 18
LDGE57:
        ldrsh   r3, [r12, #8]
        strh    r1, [r12, #0x96]
        mvn     r1, r2
        mov     r0, r3, lsl r0
        cmp     r1, r0
        mvnlt   r0, r2
        blt     LDGE58
        cmn     r0, #2, 18
        movge   r0, r0, lsl #16
        movge   r0, r0, asr #16
        sublt   r0, r4, #2, 18
LDGE58:
        strh    r0, [r12, #0x98]
        b       LDGE45
LDGE59:
        rsb     r3, r1, #0
        mvn     r1, #0xFF
        bic     r3, r3, #0xFF, 8
        bic     r6, r3, #0xFF, 16
        bic     r1, r1, #0x7F, 24
        mvn     r8, r1
        mov     r3, #0
        cmp     r0, r8, asr r6
        sub     r7, r3, #2, 18
        mvngt   r1, r1
        bgt     LDGE60
        cmp     r0, r7, asr r6
        movlt   r0, #0
        sublt   r1, r0, #2, 18
        blt     LDGE60
        mov     r0, r0, lsl r6
        mov     r0, r0, lsl #16
        mov     r1, r0, asr #16
LDGE60:
        add     r0, sp, #0x40
        strh    r1, [r4, +r0]
        ldrsh   r0, [r5, #2]
        cmp     r0, r8, asr r6
        bgt     LDGE61
        cmp     r0, r7, asr r6
        movlt   r0, #0
        sublt   r3, r0, #2, 18
        blt     LDGE62
        mov     r0, r0, lsl r6
        mov     r0, r0, lsl #16
        mov     r3, r0, asr #16
        b       LDGE62
LDGE61:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r3, r0
LDGE62:
        ldrsh   r0, [r5, #4]
        strh    r3, [r5, #2]
        cmp     r0, r8, asr r6
        bgt     LDGE63
        cmp     r0, r7, asr r6
        movlt   r0, #0
        sublt   r1, r0, #2, 18
        blt     LDGE64
        mov     r0, r0, lsl r6
        mov     r0, r0, lsl #16
        mov     r1, r0, asr #16
        b       LDGE64
LDGE63:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r1, r0
LDGE64:
        ldrsh   r0, [r5, #6]
        strh    r1, [r5, #4]
        cmp     r0, r8, asr r6
        bgt     LDGE65
        cmp     r0, r7, asr r6
        movlt   r0, #0
        sublt   r0, r0, #2, 18
        blt     LDGE66
        mov     r0, r0, lsl r6
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LDGE66
LDGE65:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r0, r0
LDGE66:
        ldrsh   r9, [r5, #8]
        strh    r0, [r5, #6]
        cmp     r9, r8, asr r6
        bgt     LDGE67
        cmp     r9, r7, asr r6
        mvnlt   r6, #0xFF
        biclt   r6, r6, #0x7F, 24
        blt     LDGE12
        mov     r6, r9, lsl r6
        mov     r6, r6, lsl #16
        mov     r6, r6, asr #16
        b       LDGE12
LDGE67:
        mov     r6, #0
        sub     r6, r6, #2, 18
        mvn     r6, r6
        b       LDGE12
LDGE68:
        ldr     r10, [sp]
        ldr     r2, [sp, #0x1C]
LDGE69:
        add     r10, r10, #1
        b       LDGE0
LDGE70:
        ldr     r10, [sp]
        ldr     r2, [sp, #0x1C]
        b       LDGE69
LDGE71:
        mvn     r0, #7
        add     sp, sp, #0x60
        ldmia   sp!, {r4 - r11, pc}


