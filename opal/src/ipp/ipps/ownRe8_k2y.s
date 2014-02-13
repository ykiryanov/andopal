        .text
        .align  4
        .globl  ownRe8_k2y


ownRe8_k2y:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x4C
        mvn     r3, #0xFF
        bic     r12, r3, #0x7F, 24
        rsb     r3, r1, #0xF
        mvn     lr, r12
        cmp     lr, r3
        mov     r4, r2
        mvn     r11, #2, 2
        mvnlt   r3, r12
        blt     LDNY0
        cmn     r3, #2, 18
        movge   r3, r3, lsl #16
        movge   r3, r3, asr #16
        movlt   r3, r11, lsl #15
LDNY0:
        ldrh    lr, [r0, #0xE]
        add     r7, sp, #0x3C
        add     r8, sp, #0x3C
        strh    lr, [r7]
        add     r6, sp, #0x3C
        add     r5, sp, #0x3C
        add     r7, sp, #0x3C
        strh    lr, [r6, #4]
        strh    lr, [r5, #6]
        strh    lr, [r7, #8]
        add     r6, sp, #0x3C
        add     r5, sp, #0x3C
        add     r7, sp, #0x3C
        strh    lr, [r8, #2]
        strh    lr, [r6, #0xA]
        strh    lr, [r5, #0xC]
        strh    lr, [r7, #0xE]
        add     lr, sp, #0x3C
        ldrh    lr, [lr, #0xE]
        cmp     r3, #0
        mov     r10, #2, 2
        ble     LDNY2
        bic     r5, r3, #0xFF, 8
        bic     r5, r5, #0xFF, 16
        cmp     lr, r11, asr r5
        movgt   r5, r11
        bgt     LDNY1
        cmp     lr, r10, asr r5
        movge   r5, lr, lsl r5
        movlt   r5, #2, 2
LDNY1:
        add     lr, sp, #0x1C
        str     r5, [lr, #0x1C]
        b       LDNY3
LDNY2:
        rsb     r6, r3, #0
        add     r5, sp, #0x1C
        mov     r6, lr, asr r6
        str     r6, [r5, #0x1C]
LDNY3:
        mov     lr, #0xFF
        orr     lr, lr, #0x7F, 24
        sub     r5, lr, #1, 18
        mvn     lr, r12
        mov     r12, #0
        mov     r9, #6
        mvn     r8, #0
        mov     r7, #0xC
        add     r6, r0, #0xC
        str     r4, [sp]
        str     r1, [sp, #4]
        str     r0, [sp, #8]
LDNY4:
        ldrsh   r0, [r6], #-2
        cmp     r5, r0
        blt     LDNY5
        cmn     r0, #1, 18
        mvnlt   r0, #2, 2
        movlt   r0, r0, lsl #15
        blt     LDNY6
        mov     r0, r0, lsl #1
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LDNY6
LDNY5:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r0, r0
LDNY6:
        add     r12, r0, r12
        cmp     lr, r12
        blt     LDNY7
        cmn     r12, #2, 18
        movge   r1, r12, lsl #16
        movge   r12, r1, asr #16
        mvnlt   r1, #2, 2
        movlt   r12, r1, lsl #15
        b       LDNY8
LDNY7:
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r12, r1
LDNY8:
        add     r2, sp, #0x3C
        ldrh    r2, [r2, +r7]
        mov     r1, r0, asr #31
        adds    r0, r2, r0
        adc     r1, r1, r2, asr #31
        subs    r4, r0, r11
        sbcs    r2, r1, #0
        movlt   r4, #0
        movlt   r2, #0
        orrs    r2, r4, r2
        mvnne   r0, #2, 2
        bne     LDNY9
        cmp     r0, #2, 2
        sbcs    r1, r1, r8
        movlt   r0, #2, 2
LDNY9:
        bic     r0, r0, #0xFF, 8
        add     r1, sp, #0x3C
        bic     r0, r0, #0xFF, 16
        cmp     r3, #0
        strh    r0, [r1, +r7]
        ble     LDNY11
        bic     r1, r3, #0xFF, 8
        bic     r1, r1, #0xFF, 16
        cmp     r0, r11, asr r1
        mvngt   r1, #2, 2
        bgt     LDNY10
        cmp     r0, r10, asr r1
        movge   r1, r0, lsl r1
        movlt   r1, #2, 2
LDNY10:
        add     r0, sp, #0x1C
        str     r1, [r0, +r9, lsl #2]
        b       LDNY12
LDNY11:
        rsb     r2, r3, #0
        add     r1, sp, #0x1C
        mov     r2, r0, asr r2
        str     r2, [r1, +r9, lsl #2]
LDNY12:
        sub     r9, r9, #1
        cmp     r9, #1
        sub     r7, r7, #2
        bge     LDNY4
        ldr     r0, [sp, #8]
        ldr     r4, [sp]
        ldr     r1, [sp, #4]
        ldrsh   r0, [r0]
        mov     lr, #0xFF
        orr     lr, lr, #0x7F, 24
        sub     lr, lr, #6, 20
        cmp     lr, r0
        mvn     lr, #0xFF
        bic     r5, lr, #0x7F, 24
        mvn     r6, #2, 2
        mvnlt   r0, r5
        blt     LDNY13
        cmn     r0, #2, 20
        movlt   r0, r6, lsl #15
        blt     LDNY13
        mov     r0, r0, lsl #2
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
LDNY13:
        adds    lr, r12, r0
        mov     r0, r0, asr #31
        adc     r12, r0, r12, asr #31
        subs    r0, lr, r6
        sbcs    r7, r12, #0
        movlt   r0, #0
        movlt   r7, #0
        orrs    r8, r0, r7
        mvn     r7, #0
        mov     r0, #2, 2
        movne   lr, r6
        bne     LDNY14
        cmp     lr, #2, 2
        sbcs    r12, r12, r7
        movlt   lr, #2, 2
LDNY14:
        add     r8, sp, #0x3C
        ldrh    r8, [r8]
        mov     r12, lr, asr #31
        adds    lr, r8, lr
        adc     r12, r12, r8, asr #31
        subs    r8, lr, r6
        sbcs    r9, r12, #0
        movlt   r8, #0
        movlt   r9, #0
        orrs    r9, r8, r9
        movne   lr, r6
        bne     LDNY15
        cmp     lr, #2, 2
        sbcs    r12, r12, r7
        movlt   lr, #2, 2
LDNY15:
        bic     lr, lr, #0xFF, 8
        add     r12, sp, #0x3C
        bic     lr, lr, #0xFF, 16
        strh    lr, [r12]
        cmp     r3, #0
        mvn     r12, #1
        ble     LDNY22
        adds    r12, lr, r12
        adc     lr, r7, lr, asr #31
        subs    r8, r12, r6
        sbcs    r9, lr, #0
        movlt   r8, #0
        movlt   r9, #0
        orrs    r9, r8, r9
        movne   r12, r6
        bne     LDNY16
        cmp     r12, #2, 2
        sbcs    lr, lr, r7
        movlt   r12, #2, 2
LDNY16:
        bic     r3, r3, #0xFF, 8
        bic     r3, r3, #0xFF, 16
        cmp     r12, r6, asr r3
        movgt   r3, r6
        bgt     LDNY17
        cmp     r12, r0, asr r3
        movge   r3, r12, lsl r3
        movlt   r3, #2, 2
LDNY17:
        add     r0, sp, #0x1C
        str     r3, [r0]
LDNY18:
        bic     r3, r1, #0xFF, 8
        add     r0, sp, #0x1C
        add     r2, sp, #0xC
        mov     r1, r2
        bic     r8, r3, #0xFF, 16
        bl      ownRE8_PPV_FX
        mvn     r1, r5
        mov     r1, r1, asr r8
        cmp     r1, #1
        mov     r1, r6, lsl #15
        add     r0, sp, #0xC
        mov     r1, r1, asr r8
        movlt   r1, r6, lsl #15
        mvnlt   r5, r1
        blt     LDNY19
        cmp     r1, #1
        bgt     LDNY19
        mov     r1, #1
        mov     r8, r1, lsl r8
        mov     r1, r8, lsl #16
        mov     r5, r1, asr #16
LDNY19:
        mov     r5, r5, lsl #16
        mov     lr, #0
        mov     r5, r5, asr #17
        mov     r12, #8
        mov     r1, r5, lsl #16
        mov     r3, r1, asr #16
LDNY20:
        ldrsh   r1, [r0]
        mul     r1, r3, r1
        cmp     r1, #1, 2
        moveq   r1, r6
        movne   r1, r1, lsl #1
        add     r8, sp, #0x3C
        ldrh    r8, [r8, +lr]
        mov     r5, r1, asr #31
        subs    r1, r8, r1
        rsc     r5, r5, r8, asr #31
        subs    r9, r1, r6
        sbcs    r8, r5, #0
        movlt   r9, #0
        movlt   r8, #0
        orrs    r8, r9, r8
        movne   r1, r6
        bne     LDNY21
        cmp     r1, #2, 2
        sbcs    r5, r5, r7
        movlt   r1, #2, 2
LDNY21:
        strh    r1, [r4], #2
        subs    r12, r12, #1
        add     r0, r0, #2
        add     lr, lr, #2
        bne     LDNY20
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
LDNY22:
        adds    r0, lr, r12
        adc     lr, r7, lr, asr #31
        subs    r12, r0, r6
        sbcs    r8, lr, #0
        movlt   r12, #0
        movlt   r8, #0
        orrs    r8, r12, r8
        movne   r0, r6
        bne     LDNY23
        cmp     r0, #2, 2
        sbcs    lr, lr, r7
        movlt   r0, #2, 2
LDNY23:
        rsb     r3, r3, #0
        add     r12, sp, #0x1C
        mov     r3, r0, asr r3
        str     r3, [r12]
        b       LDNY18


