        .text
        .align  4
        .globl  ownRE8_PPV_FX


ownRE8_PPV_FX:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x88
        mov     r12, #0xFF
        mvn     r3, #0xFF
        orr     r12, r12, #0x7F, 24
        bic     r4, r3, #0x7F, 24
        mov     r2, #0
        sub     lr, r12, #1, 18
        mov     r3, r2
        mvn     r12, r4
        mov     r9, r3
        mvn     r8, #2, 2
        mvn     r7, #0
        mov     r6, #2, 18
        mov     r4, r0
        mov     r5, #8
        str     r0, [sp]
        str     r1, [sp, #4]
LDNZ0:
        ldr     r1, [r4], #4
        cmp     r1, #0
        mov     r0, r1, asr #31
        blt     LDNZ57
        adds    r1, r1, #2, 18
        adc     r0, r0, #0
        subs    r11, r1, r8
        sbcs    r10, r0, #0
        movlt   r11, #0
        movlt   r10, #0
        orrs    r10, r11, r10
        mvnne   r1, #2, 2
        bne     LDNZ1
        cmp     r1, #2, 2
        sbcs    r0, r0, r7
        movlt   r1, #2, 2
LDNZ1:
        mov     r1, r1, asr #16
        mov     r0, r1, lsl #16
        mov     r0, r0, asr #16
        cmp     lr, r0
        blt     LDNZ2
        cmn     r0, #1, 18
        mvnlt   r0, #2, 2
        movlt   r0, r0, lsl #15
        blt     LDNZ3
        mov     r0, r0, lsl #1
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LDNZ3
LDNZ2:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r0, r0
LDNZ3:
        add     r3, r3, r0
        add     r1, sp, #0x68
        cmp     r12, r3
        strh    r0, [r1, +r2]
        blt     LDNZ4
        cmn     r3, #2, 18
        movge   r3, r3, lsl #16
        movge   r3, r3, asr #16
        mvnlt   r0, #2, 2
        movlt   r3, r0, lsl #15
        b       LDNZ5
LDNZ4:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r3, r0
LDNZ5:
        subs    r5, r5, #1
        add     r2, r2, #2
        bne     LDNZ0
        ldr     r0, [sp]
        ldr     r1, [sp, #4]
        tst     r3, #3
        beq     LDNZ11
        mov     r8, #0
        mov     r7, r8
        mov     r6, r7
        mov     r5, r6
        mov     r4, #1
        mov     lr, r5
        mvn     r12, #2, 2
        mvn     r3, #0
        mov     r2, r0
        str     r0, [sp]
        str     r1, [sp, #4]
LDNZ6:
        add     r0, sp, #0x68
        ldrsh   r0, [r0, +r8]
        mov     r1, lr
        movs    r0, r0, lsl #15
        movmi   r1, r4
        add     r1, r0, r1
        mov     r0, r1, asr #1
        cmp     r0, #1, 2
        mvneq   r1, #2, 2
        movne   r1, r0, lsl #1
        ldr     r0, [r2], #4
        mov     r9, r1, asr #31
        subs    r1, r0, r1
        rsc     r0, r9, r0, asr #31
        subs    r10, r1, r12
        sbcs    r9, r0, #0
        movlt   r10, #0
        movlt   r9, #0
        orrs    r9, r10, r9
        mvnne   r1, #2, 2
        bne     LDNZ7
        cmp     r1, #2, 2
        sbcs    r0, r0, r3
        movlt   r1, #2, 2
LDNZ7:
        add     r0, sp, #0x28
        cmp     r1, #0
        str     r1, [r0, +r5, lsl #2]
        bge     LDNZ8
        cmp     r1, #2, 2
        mvneq   r1, #2, 2
        rsbne   r1, r1, #0
LDNZ8:
        mov     r0, r1, asr #31
        subs    r9, r7, r1
        rsc     r0, r0, r7, asr #31
        subs    r11, r9, r12
        sbcs    r10, r0, #0
        movlt   r11, #0
        movlt   r10, #0
        orrs    r10, r11, r10
        mvnne   r9, #2, 2
        bne     LDNZ9
        cmp     r9, #2, 2
        sbcs    r0, r0, r3
        movlt   r9, #2, 2
LDNZ9:
        cmp     r9, #0
        movlt   r7, r1
        movlt   r6, r5
        add     r5, r5, #1
        cmp     r5, #8
        add     r8, r8, #2
        blt     LDNZ6
        ldr     r0, [sp]
        ldr     r1, [sp, #4]
        mov     r6, r6, lsl #16
        add     lr, sp, #0x28
        mov     r2, r6, asr #16
        ldr     lr, [lr, +r2, lsl #2]
        add     r12, sp, #0x68
        mov     r4, r2, lsl #1
        ldrsh   r4, [r12, +r4]
        mvn     r5, #0xFF
        cmp     lr, #0
        bic     r12, r5, #0x7F, 24
        mvn     r3, #2, 2
        mvn     lr, r12
        blt     LDNZ55
        add     r4, r4, #2
        cmp     lr, r4
        mvnlt   r3, r12
        blt     LDNZ10
        cmn     r4, #2, 18
        movge   r4, r4, lsl #16
        movge   r3, r4, asr #16
        movlt   r3, r3, lsl #15
LDNZ10:
        add     r12, sp, #0x68
        mov     r2, r2, lsl #1
        strh    r3, [r12, +r2]
LDNZ11:
        mov     lr, #0
        mov     r3, lr
        mvn     r5, #2, 2
        mvn     r4, #0
        mov     r2, r0
LDNZ12:
        ldr     r6, [r2], #4
        adds    r12, r6, r5, lsl #15
        adc     r6, r4, r6, asr #31
        subs    r8, r12, r5
        sbcs    r7, r6, #0
        movlt   r8, #0
        movlt   r7, #0
        orrs    r7, r8, r7
        movne   r12, r5
        bne     LDNZ13
        cmp     r12, #2, 2
        sbcs    r6, r6, r4
        movlt   r12, #2, 2
LDNZ13:
        add     r6, sp, #0x48
        str     r12, [r6, +r3, lsl #2]
        add     r3, r3, #1
        cmp     r3, #8
        blt     LDNZ12
        mov     r12, lr
        mov     r2, #0xFF
        mvn     r3, #0xFF
        bic     r6, r3, #0x7F, 24
        orr     r2, r2, #0x7F, 24
        sub     r3, r2, #1, 18
        mov     r8, r12
        mvn     r2, r6
        mov     r7, r8
        mov     r6, #2, 18
        str     r1, [sp, #4]
LDNZ14:
        add     r1, sp, #0x48
        ldr     r9, [r1, +r8, lsl #2]
        cmp     r9, #0
        mov     r1, r9, asr #31
        blt     LDNZ50
        adds    r9, r9, #2, 18
        adc     r1, r1, #0
        subs    r11, r9, r5
        sbcs    r10, r1, #0
        movlt   r11, #0
        movlt   r10, #0
        orrs    r10, r11, r10
        mvnne   r9, #2, 2
        bne     LDNZ15
        cmp     r9, #2, 2
        sbcs    r1, r1, r4
        movlt   r9, #2, 2
LDNZ15:
        mov     r9, r9, asr #16
        mov     r1, r9, lsl #16
        mov     r1, r1, asr #16
        cmp     r3, r1
        blt     LDNZ16
        cmn     r1, #1, 18
        mvnlt   r1, #2, 2
        movlt   r1, r1, lsl #15
        blt     LDNZ17
        mov     r1, r1, lsl #1
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        b       LDNZ17
LDNZ16:
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r1, r1
LDNZ17:
        add     r12, r12, r1
        add     r9, sp, #0x78
        cmp     r2, r12
        strh    r1, [r9, +lr]
        blt     LDNZ18
        cmn     r12, #2, 18
        movge   r12, r12, lsl #16
        movge   r12, r12, asr #16
        mvnlt   r1, #2, 2
        movlt   r12, r1, lsl #15
        b       LDNZ19
LDNZ18:
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r12, r1
LDNZ19:
        add     r8, r8, #1
        cmp     r8, #8
        add     lr, lr, #2
        blt     LDNZ14
        ldr     r1, [sp, #4]
        tst     r12, #3
        beq     LDNZ25
        mov     r8, #0
        mov     r7, r8
        mov     r6, r7
        mov     r5, r6
        mov     lr, r5
        mov     r4, #1
        mvn     r12, #2, 2
        mvn     r3, #0
        mov     r2, lr
        str     r0, [sp]
        str     r1, [sp, #4]
LDNZ20:
        add     r0, sp, #0x78
        ldrsh   r0, [r0, +r8]
        mov     r1, lr
        movs    r0, r0, lsl #15
        movmi   r1, r4
        add     r1, r0, r1
        mov     r0, r1, asr #1
        cmp     r0, #1, 2
        mvneq   r1, #2, 2
        movne   r1, r0, lsl #1
        add     r0, sp, #0x48
        ldr     r0, [r0, +r5, lsl #2]
        mov     r9, r1, asr #31
        subs    r1, r0, r1
        rsc     r0, r9, r0, asr #31
        subs    r10, r1, r12
        sbcs    r9, r0, #0
        movlt   r10, #0
        movlt   r9, #0
        orrs    r9, r10, r9
        mvnne   r1, #2, 2
        bne     LDNZ21
        cmp     r1, #2, 2
        sbcs    r0, r0, r3
        movlt   r1, #2, 2
LDNZ21:
        add     r0, sp, #8
        cmp     r1, #0
        str     r1, [r0, +r2, lsl #2]
        bge     LDNZ22
        cmp     r1, #2, 2
        mvneq   r1, #2, 2
        rsbne   r1, r1, #0
LDNZ22:
        mov     r0, r1, asr #31
        subs    r9, r7, r1
        rsc     r0, r0, r7, asr #31
        subs    r11, r9, r12
        sbcs    r10, r0, #0
        movlt   r11, #0
        movlt   r10, #0
        orrs    r10, r11, r10
        mvnne   r9, #2, 2
        bne     LDNZ23
        cmp     r9, #2, 2
        sbcs    r0, r0, r3
        movlt   r9, #2, 2
LDNZ23:
        cmp     r9, #0
        movlt   r7, r1
        movlt   r6, r5
        add     r5, r5, #1
        cmp     r5, #8
        add     r2, r2, #1
        add     r8, r8, #2
        blt     LDNZ20
        ldr     r0, [sp]
        ldr     r1, [sp, #4]
        mov     r6, r6, lsl #16
        add     lr, sp, #8
        mov     r2, r6, asr #16
        ldr     lr, [lr, +r2, lsl #2]
        add     r12, sp, #0x78
        mov     r4, r2, lsl #1
        ldrsh   r4, [r12, +r4]
        mvn     r5, #0xFF
        cmp     lr, #0
        bic     r12, r5, #0x7F, 24
        mvn     r3, #2, 2
        mvn     lr, r12
        blt     LDNZ48
        add     r4, r4, #2
        cmp     lr, r4
        mvnlt   r3, r12
        blt     LDNZ24
        cmn     r4, #2, 18
        movge   r4, r4, lsl #16
        movge   r3, r4, asr #16
        movlt   r3, r3, lsl #15
LDNZ24:
        add     r12, sp, #0x78
        mov     r2, r2, lsl #1
        strh    r3, [r12, +r2]
LDNZ25:
        mov     r6, #0
        mvn     r2, #0xFF
        bic     r3, r2, #0x7F, 24
        mov     r5, r6
        mvn     r7, #2, 2
        mvn     r4, r3
        mov     lr, r5
LDNZ26:
        add     r2, sp, #0x78
        ldrsh   r2, [r2, +lr]
        add     r2, r2, #1
        cmp     r4, r2
        mvnlt   r2, r3
        blt     LDNZ27
        cmn     r2, #2, 18
        movge   r2, r2, lsl #16
        movge   r2, r2, asr #16
        movlt   r2, r7, lsl #15
LDNZ27:
        add     r8, sp, #0x78
        strh    r2, [r8, +lr]
        add     r2, r5, #1
        add     r12, sp, #0x78
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #16
        mov     r8, r2, lsl #1
        ldrsh   r8, [r12, +r8]
        add     r12, r8, #1
        cmp     r4, r12
        mvnlt   r12, r3
        blt     LDNZ28
        cmn     r12, #2, 18
        movge   r12, r12, lsl #16
        movge   r12, r12, asr #16
        movlt   r12, r7, lsl #15
LDNZ28:
        add     r5, r5, #2
        add     r8, sp, #0x78
        mov     r2, r2, lsl #1
        cmp     r5, #8
        strh    r12, [r8, +r2]
        add     lr, lr, #4
        blt     LDNZ26
        mov     r2, #0xFF
        orr     r2, r2, #0x7F, 24
        mov     r3, r6
        add     r5, r2, #2, 18
        mov     r12, r3
        add     r2, r2, #6, 18
        mvn     r4, #0
        mov     lr, #8
        str     r0, [sp]
        str     r1, [sp, #4]
LDNZ29:
        add     r0, sp, #0x68
        ldrsh   r0, [r0, +r6]
        cmp     r5, r0
        movlt   r0, r7
        blt     LDNZ30
        cmn     r0, #1, 16
        movge   r0, r0, lsl #15
        movlt   r0, #2, 2
LDNZ30:
        ldr     r8, [sp]
        ldr     r1, [r8], #4
        str     r8, [sp]
        mov     r8, r0, asr #31
        subs    r9, r1, r0
        rsc     r0, r8, r1, asr #31
        subs    r10, r9, r7
        sbcs    r8, r0, #0
        movlt   r10, #0
        movlt   r8, #0
        orrs    r8, r10, r8
        mvnne   r9, #2, 2
        bne     LDNZ31
        cmp     r9, #2, 2
        sbcs    r0, r0, r4
        movlt   r9, #2, 2
LDNZ31:
        cmn     r9, #7, 2
        mvngt   r0, #2, 2
        bgt     LDNZ32
        cmp     r9, #3, 2
        movge   r0, r9, lsl #1
        movlt   r0, #2, 2
LDNZ32:
        mov     r0, r0, asr #16
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        mov     r8, r0, lsl #14
        cmp     r8, #1, 2
        mvneq   r10, #2, 2
        movne   r10, r0, lsl #15
        subs    r8, r9, r10
        mov     r10, r10, asr #31
        rsc     r9, r10, r9, asr #31
        subs    r11, r8, r7
        sbcs    r10, r9, #0
        movlt   r11, #0
        movlt   r10, #0
        orrs    r10, r11, r10
        mvnne   r8, #2, 2
        bne     LDNZ33
        cmp     r8, #2, 2
        sbcs    r9, r9, r4
        movlt   r8, #2, 2
LDNZ33:
        mul     r9, r0, r0
        mov     r8, r8, lsl #16
        mov     r8, r8, asr #16
        cmp     r9, #1, 2
        mvneq   r9, #2, 2
        movne   r9, r9, lsl #1
        cmp     r2, r9
        mvnlt   r9, #2, 2
        blt     LDNZ34
        cmn     r9, #2, 16
        movge   r9, r9, lsl #14
        movlt   r9, #2, 2
LDNZ34:
        mul     r0, r0, r8
        cmp     r0, #1, 2
        mvneq   r10, #2, 2
        movne   r10, r0, lsl #1
        adds    r0, r9, r10
        mov     r10, r10, asr #31
        adc     r9, r10, r9, asr #31
        subs    r11, r0, r7
        sbcs    r10, r9, #0
        movlt   r11, #0
        movlt   r10, #0
        orrs    r10, r11, r10
        mvnne   r0, #2, 2
        bne     LDNZ35
        cmp     r0, #2, 2
        sbcs    r9, r9, r4
        movlt   r0, #2, 2
LDNZ35:
        mul     r8, r8, r8
        mov     r9, r8, asr #15
        adds    r8, r0, r9
        mov     r9, r9, asr #31
        adc     r0, r9, r0, asr #31
        subs    r10, r8, r7
        sbcs    r9, r0, #0
        movlt   r10, #0
        movlt   r9, #0
        orrs    r9, r10, r9
        mvnne   r8, #2, 2
        bne     LDNZ36
        cmp     r8, #2, 2
        sbcs    r0, r0, r4
        movlt   r8, #2, 2
LDNZ36:
        mov     r0, r12, asr #31
        adds    r12, r8, r12
        adc     r8, r0, r8, asr #31
        subs    r9, r12, r7
        sbcs    r0, r8, #0
        movlt   r9, #0
        movlt   r0, #0
        orrs    r0, r9, r0
        mvnne   r12, #2, 2
        bne     LDNZ37
        cmp     r12, #2, 2
        sbcs    r8, r8, r4
        movlt   r12, #2, 2
LDNZ37:
        add     r0, sp, #0x78
        ldrsh   r0, [r0, +r6]
        cmp     r5, r0
        mvnlt   r0, #2, 2
        blt     LDNZ38
        cmn     r0, #1, 16
        movge   r0, r0, lsl #15
        movlt   r0, #2, 2
LDNZ38:
        subs    r8, r1, r0
        mov     r0, r0, asr #31
        rsc     r1, r0, r1, asr #31
        subs    r9, r8, r7
        sbcs    r0, r1, #0
        movlt   r9, #0
        movlt   r0, #0
        orrs    r0, r9, r0
        mvnne   r8, #2, 2
        bne     LDNZ39
        cmp     r8, #2, 2
        sbcs    r1, r1, r4
        movlt   r8, #2, 2
LDNZ39:
        cmn     r8, #7, 2
        mvngt   r0, #2, 2
        bgt     LDNZ40
        cmp     r8, #3, 2
        movge   r0, r8, lsl #1
        movlt   r0, #2, 2
LDNZ40:
        mov     r0, r0, asr #16
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        mov     r1, r0, lsl #14
        cmp     r1, #1, 2
        mvneq   r9, #2, 2
        movne   r9, r0, lsl #15
        subs    r1, r8, r9
        mov     r9, r9, asr #31
        rsc     r8, r9, r8, asr #31
        subs    r10, r1, r7
        sbcs    r9, r8, #0
        movlt   r10, #0
        movlt   r9, #0
        orrs    r9, r10, r9
        mvnne   r1, #2, 2
        bne     LDNZ41
        cmp     r1, #2, 2
        sbcs    r8, r8, r4
        movlt   r1, #2, 2
LDNZ41:
        mul     r9, r0, r0
        mov     r1, r1, lsl #16
        mov     r8, r1, asr #16
        cmp     r9, #1, 2
        mvneq   r9, #2, 2
        movne   r9, r9, lsl #1
        cmp     r2, r9
        mvnlt   r1, #2, 2
        blt     LDNZ42
        cmn     r9, #2, 16
        movge   r1, r9, lsl #14
        movlt   r1, #2, 2
LDNZ42:
        mul     r0, r0, r8
        cmp     r0, #1, 2
        mvneq   r9, #2, 2
        movne   r9, r0, lsl #1
        adds    r0, r1, r9
        mov     r9, r9, asr #31
        adc     r1, r9, r1, asr #31
        subs    r10, r0, r7
        sbcs    r9, r1, #0
        movlt   r10, #0
        movlt   r9, #0
        orrs    r9, r10, r9
        mvnne   r0, #2, 2
        bne     LDNZ43
        cmp     r0, #2, 2
        sbcs    r1, r1, r4
        movlt   r0, #2, 2
LDNZ43:
        mul     r8, r8, r8
        mov     r8, r8, asr #15
        adds    r1, r0, r8
        mov     r8, r8, asr #31
        adc     r0, r8, r0, asr #31
        subs    r9, r1, r7
        sbcs    r8, r0, #0
        movlt   r9, #0
        movlt   r8, #0
        orrs    r8, r9, r8
        mvnne   r1, #2, 2
        bne     LDNZ44
        cmp     r1, #2, 2
        sbcs    r0, r0, r4
        movlt   r1, #2, 2
LDNZ44:
        mov     r0, r3, asr #31
        adds    r3, r1, r3
        adc     r1, r0, r1, asr #31
        subs    r8, r3, r7
        sbcs    r0, r1, #0
        movlt   r8, #0
        movlt   r0, #0
        orrs    r0, r8, r0
        mvnne   r3, #2, 2
        bne     LDNZ45
        cmp     r3, #2, 2
        sbcs    r1, r1, r4
        movlt   r3, #2, 2
LDNZ45:
        subs    lr, lr, #1
        add     r6, r6, #2
        bne     LDNZ29
        ldr     r1, [sp, #4]
        cmp     r12, r3
        bge     LDNZ46
        add     r0, sp, #0x68
        ldrsh   r6, [r0]
        add     r4, sp, #0x68
        add     r12, sp, #0x68
        add     r3, sp, #0x68
        add     r5, sp, #0x68
        add     lr, sp, #0x68
        add     r0, sp, #0x68
        add     r2, sp, #0x68
        strh    r6, [r1]
        b       LDNZ47
LDNZ46:
        add     r0, sp, #0x78
        ldrsh   r6, [r0]
        add     r4, sp, #0x78
        add     r12, sp, #0x78
        add     r3, sp, #0x78
        add     r5, sp, #0x78
        add     lr, sp, #0x78
        add     r0, sp, #0x78
        add     r2, sp, #0x78
        strh    r6, [r1]
LDNZ47:
        ldrsh   r3, [r3, #6]
        ldrsh   r4, [r4, #2]
        ldrsh   r12, [r12, #4]
        ldrsh   r5, [r5, #8]
        ldrsh   lr, [lr, #0xA]
        ldrsh   r0, [r0, #0xC]
        ldrsh   r2, [r2, #0xE]
        strh    r4, [r1, #2]
        strh    r12, [r1, #4]
        strh    r0, [r1, #0xC]
        strh    r2, [r1, #0xE]
        strh    r3, [r1, #6]
        strh    r5, [r1, #8]
        strh    lr, [r1, #0xA]
        add     sp, sp, #0x88
        ldmia   sp!, {r4 - r11, pc}
LDNZ48:
        sub     r4, r4, #2
        cmp     lr, r4
        mvnlt   r3, r12
        blt     LDNZ49
        cmn     r4, #2, 18
        movge   r4, r4, lsl #16
        movge   r3, r4, asr #16
        movlt   r3, r3, lsl #15
LDNZ49:
        add     r12, sp, #0x78
        mov     r2, r2, lsl #1
        strh    r3, [r12, +r2]
        b       LDNZ25
LDNZ50:
        subs    r9, r6, r9
        sbc     r1, r7, r1
        subs    r11, r9, r5
        sbcs    r10, r1, #0
        movlt   r11, #0
        movlt   r10, #0
        orrs    r10, r11, r10
        mvnne   r9, #2, 2
        bne     LDNZ51
        cmp     r9, #2, 2
        sbcs    r1, r1, r4
        movlt   r9, #2, 2
LDNZ51:
        mov     r9, r9, asr #16
        mov     r1, r9, lsl #16
        mov     r1, r1, asr #16
        cmp     r3, r1
        blt     LDNZ52
        cmn     r1, #1, 18
        mvnlt   r1, #2, 2
        movlt   r1, r1, lsl #15
        blt     LDNZ53
        mov     r1, r1, lsl #1
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        b       LDNZ53
LDNZ52:
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r1, r1
LDNZ53:
        cmn     r1, #2, 18
        beq     LDNZ54
        rsb     r1, r1, #0
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        b       LDNZ17
LDNZ54:
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r1, r1
        b       LDNZ17
LDNZ55:
        sub     r4, r4, #2
        cmp     lr, r4
        mvnlt   r3, r12
        blt     LDNZ56
        cmn     r4, #2, 18
        movge   r4, r4, lsl #16
        movge   r3, r4, asr #16
        movlt   r3, r3, lsl #15
LDNZ56:
        add     r12, sp, #0x68
        mov     r2, r2, lsl #1
        strh    r3, [r12, +r2]
        b       LDNZ11
LDNZ57:
        subs    r1, r6, r1
        sbc     r0, r9, r0
        subs    r11, r1, r8
        sbcs    r10, r0, #0
        movlt   r11, #0
        movlt   r10, #0
        orrs    r10, r11, r10
        mvnne   r1, #2, 2
        bne     LDNZ58
        cmp     r1, #2, 2
        sbcs    r0, r0, r7
        movlt   r1, #2, 2
LDNZ58:
        mov     r1, r1, asr #16
        mov     r0, r1, lsl #16
        mov     r0, r0, asr #16
        cmp     lr, r0
        blt     LDNZ59
        cmn     r0, #1, 18
        mvnlt   r0, #0xFF
        biclt   r0, r0, #0x7F, 24
        blt     LDNZ60
        mov     r0, r0, lsl #1
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LDNZ60
LDNZ59:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r0, r0
LDNZ60:
        cmn     r0, #2, 18
        beq     LDNZ61
        rsb     r0, r0, #0
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LDNZ3
LDNZ61:
        mvn     r0, #2, 2
        mov     r0, r0, lsl #15
        mvn     r0, r0
        b       LDNZ3


