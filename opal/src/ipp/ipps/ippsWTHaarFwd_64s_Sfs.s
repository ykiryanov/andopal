        .text
        .align  4
        .globl  _ippsWTHaarFwd_64s_Sfs


_ippsWTHaarFwd_64s_Sfs:
        mov     r12, sp
        stmdb   sp!, {r4 - r6, r11, r12, lr}
        mov     r11, r12
        sub     sp, sp, #0xA8
        str     r0, [r11, #-0x28]
        str     r1, [r11, #-0x24]
        str     r2, [r11, #-0x20]
        str     r3, [r11, #-0x1C]
        ldr     r6, [r11, #-0x24]
        ldr     r5, [r11, #-0x24]
        ldr     r4, [r11, #-0x24]
        ldr     r2, [r11, #-0x24]
        ldr     r1, [r11, #-0x24]
        ldr     r0, [r11, #-0x24]
        ldr     r3, [r11]
        cmp     r3, #0
        bne     LAJK0
        ldr     r3, [r11, #-0x1C]
        ldr     r2, [r11, #-0x20]
        ldr     r1, [r11, #-0x24]
        ldr     r0, [r11, #-0x28]
        bl      _ippsWTHaarFwd_64s
        ldmdb   r11, {r4 - r6, r11, sp, pc}
LAJK0:
        ldr     r3, [r11, #-0x28]
        cmp     r3, #0
        bne     LAJK1
        mvn     r0, #7
        ldmdb   r11, {r4 - r6, r11, sp, pc}
LAJK1:
        ldr     r3, [r11, #-0x20]
        cmp     r3, #0
        bne     LAJK2
        mvn     r0, #7
        ldmdb   r11, {r4 - r6, r11, sp, pc}
LAJK2:
        ldr     r3, [r11, #-0x1C]
        cmp     r3, #0
        bne     LAJK3
        mvn     r0, #7
        ldmdb   r11, {r4 - r6, r11, sp, pc}
LAJK3:
        ldr     r3, [r11, #-0x24]
        cmp     r3, #0
        bgt     LAJK4
        mvn     r0, #5
        ldmdb   r11, {r4 - r6, r11, sp, pc}
LAJK4:
        mov     r3, #0
        str     r3, [r11, #-0x40]
        str     r3, [r11, #-0x3C]
        ldr     r3, [r11]
        add     r3, r3, #1
        str     r3, [r11]
        ldr     r3, [r11]
        cmp     r3, #2, 2
        mvneq   r3, #2, 2
        streq   r3, [r11]
        ldr     r3, [r11]
        cmp     r3, #0
        bne     LAJK14
        ldr     r1, [r11, #-0x3C]
        ldr     r2, [r11, #-0x24]
        sub     r2, r2, #1
        cmp     r1, r2
        bge     LAJK10
LAJK5:
        ldr     r2, [r11, #-0x28]
        ldr     r3, [r11, #-0x3C]
        mov     r1, r3, lsl #3
        add     r1, r2, r1
        ldr     r2, [r2, +r3, lsl #3]
        ldr     r1, [r1, #4]
        str     r2, [r11, #-0xB0]
        str     r1, [r11, #-0xAC]
        ldr     r1, [r11, #-0x28]
        ldr     r2, [r11, #-0x3C]
        mov     r2, r2, lsl #3
        add     r2, r2, #8
        add     r3, r1, r2
        ldr     r2, [r1, +r2]
        ldr     r1, [r3, #4]
        str     r2, [r11, #-0xA8]
        str     r1, [r11, #-0xA4]
        ldr     r2, [r11, #-0xA8]
        ldr     r1, [r11, #-0xA4]
        ldr     r3, [r11, #-0xB0]
        ldr     lr, [r11, #-0xAC]
        rsbs    r3, r3, #0
        rsc     lr, lr, #0
        adds    r3, r2, r3
        adc     lr, r1, lr
        str     r3, [r11, #-0xA0]
        str     lr, [r11, #-0x9C]
        ldr     r1, [r11, #-0xA8]
        ldr     r2, [r11, #-0xA4]
        ldr     lr, [r11, #-0xB0]
        ldr     r3, [r11, #-0xAC]
        adds    r1, r1, lr
        adc     r3, r2, r3
        str     r1, [r11, #-0x98]
        str     r3, [r11, #-0x94]
        ldr     lr, [r11, #-0xA8]
        ldr     r2, [r11, #-0xA4]
        ldr     r3, [r11, #-0xB0]
        ldr     r1, [r11, #-0xAC]
        subs    r3, lr, r3
        sbcs    r2, r2, r1
        movlt   r3, #0
        movlt   r2, #0
        orrs    r2, r3, r2
        beq     LAJK6
        ldr     r1, [r11, #-0x9C]
        tst     r1, r1
        bpl     LAJK7
        mvn     r2, #0
        mvn     r1, #2, 2
        str     r2, [r11, #-0xA0]
        str     r1, [r11, #-0x9C]
        b       LAJK7
LAJK6:
        ldr     r1, [r11, #-0xA0]
        ldr     r2, [r11, #-0x9C]
        orrs    r2, r1, r2, lsl #1
        tstcs   r2, #0
        beq     LAJK7
        mov     r2, #0
        mov     r1, #2, 2
        str     r2, [r11, #-0xA0]
        str     r1, [r11, #-0x9C]
LAJK7:
        ldr     r1, [r11, #-0xB0]
        ldr     r2, [r11, #-0xAC]
        rsbs    r1, r1, #0
        rsc     r2, r2, #0
        str     r1, [r11, #-0xB0]
        str     r2, [r11, #-0xAC]
        ldr     r1, [r11, #-0xB0]
        ldr     r2, [r11, #-0xAC]
        mvn     r3, #0
        adds    r1, r1, r3
        mvn     r3, #0
        adc     r2, r2, r3
        str     r1, [r11, #-0xB0]
        str     r2, [r11, #-0xAC]
        ldr     lr, [r11, #-0xA8]
        ldr     r2, [r11, #-0xA4]
        ldr     r3, [r11, #-0xB0]
        ldr     r1, [r11, #-0xAC]
        subs    r3, lr, r3
        sbcs    r2, r2, r1
        movlt   r3, #0
        movlt   r2, #0
        orrs    r2, r3, r2
        bne     LAJK8
        ldr     r1, [r11, #-0x94]
        tst     r1, r1
        bmi     LAJK9
        mov     r2, #0
        mov     r1, #2, 2
        str     r2, [r11, #-0x98]
        str     r1, [r11, #-0x94]
        b       LAJK9
LAJK8:
        ldr     r1, [r11, #-0x94]
        tst     r1, r1
        bpl     LAJK9
        mvn     r2, #0
        mvn     r1, #2, 2
        str     r2, [r11, #-0x98]
        str     r1, [r11, #-0x94]
LAJK9:
        ldr     r1, [r11, #-0x98]
        ldr     lr, [r11, #-0x94]
        ldr     r2, [r11, #-0x20]
        ldr     r3, [r11, #-0x40]
        mov     r4, r3, lsl #3
        add     r4, r2, r4
        str     r1, [r2, +r3, lsl #3]
        str     lr, [r4, #4]
        ldr     r1, [r11, #-0xA0]
        ldr     lr, [r11, #-0x9C]
        ldr     r2, [r11, #-0x1C]
        ldr     r3, [r11, #-0x40]
        mov     r4, r3, lsl #3
        add     r4, r2, r4
        str     r1, [r2, +r3, lsl #3]
        str     lr, [r4, #4]
        ldr     r1, [r11, #-0x40]
        add     r1, r1, #1
        str     r1, [r11, #-0x40]
        ldr     r1, [r11, #-0x3C]
        add     r1, r1, #2
        str     r1, [r11, #-0x3C]
        ldr     r1, [r11, #-0x3C]
        sub     r2, r0, #1
        cmp     r1, r2
        blt     LAJK5
LAJK10:
        ldr     r0, [r11, #-0x24]
        tst     r0, #1
        beq     LAJK56
        mov     r1, #0
        mov     r0, #3, 2
        ldr     r3, [r11, #-0x28]
        ldr     lr, [r11, #-0x3C]
        mov     r2, lr, lsl #3
        add     r2, r3, r2
        ldr     lr, [r3, +lr, lsl #3]
        ldr     r2, [r2, #4]
        subs    lr, lr, r1
        sbcs    r2, r2, r0
        movlt   lr, #0
        movlt   r2, #0
        orrs    r2, lr, r2
        bne     LAJK11
        mov     r1, #0
        mov     r0, #2, 2
        str     r1, [r11, #-0x98]
        str     r0, [r11, #-0x94]
        b       LAJK13
LAJK11:
        mvn     r1, #0
        mvn     r0, #3, 2
        ldr     r3, [r11, #-0x28]
        ldr     lr, [r11, #-0x3C]
        mov     r2, lr, lsl #3
        add     r2, r3, r2
        ldr     lr, [r3, +lr, lsl #3]
        ldr     r2, [r2, #4]
        subs    lr, lr, r1
        sbcs    r2, r2, r0
        movlt   lr, #0
        movlt   r2, #0
        orrs    r2, lr, r2
        beq     LAJK12
        mvn     r1, #0
        mvn     r0, #2, 2
        str     r1, [r11, #-0x98]
        str     r0, [r11, #-0x94]
        b       LAJK13
LAJK12:
        ldr     r0, [r11, #-0x28]
        ldr     r2, [r11, #-0x3C]
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
        mov     r1, r1, lsl #1
        mov     r2, r0, lsr #31
        mov     r0, r0, lsl #1
        orr     r1, r1, r2
        str     r0, [r11, #-0x98]
        str     r1, [r11, #-0x94]
LAJK13:
        ldr     r0, [r11, #-0x98]
        ldr     r3, [r11, #-0x94]
        ldr     r1, [r11, #-0x20]
        ldr     r2, [r11, #-0x40]
        mov     lr, r2, lsl #3
        add     lr, r1, lr
        str     r0, [r1, +r2, lsl #3]
        str     r3, [lr, #4]
        b       LAJK56
LAJK14:
        ldr     r0, [r11]
        cmp     r0, #0x40
        ble     LAJK18
        ldr     r0, [r11, #-0x40]
        ldr     r1, [r11, #-0x24]
        add     r1, r1, #1
        ldr     r2, [r11, #-0x24]
        adds    r2, r2, #1
        mov     lr, #0
        mov     r3, #1
        movmi   lr, r3
        add     lr, r1, lr
        mov     r1, lr, asr #1
        cmp     r0, r1
        bge     LAJK16
LAJK15:
        mov     r0, #0
        ldr     r1, [r11, #-0x20]
        ldr     r2, [r11, #-0x40]
        mov     r3, r2, lsl #3
        add     r3, r1, r3
        str     r0, [r1, +r2, lsl #3]
        str     r0, [r3, #4]
        ldr     r1, [r11, #-0x40]
        add     r1, r1, #1
        str     r1, [r11, #-0x40]
        ldr     r1, [r11, #-0x40]
        ldr     r2, [r11, #-0x24]
        add     r2, r2, #1
        ldr     r3, [r11, #-0x24]
        adds    r3, r3, #1
        mov     lr, #1
        movmi   r0, lr
        add     r0, r2, r0
        mov     r0, r0, asr #1
        cmp     r1, r0
        blt     LAJK15
LAJK16:
        mov     r1, #0
        str     r1, [r11, #-0x40]
        ldr     r0, [r11, #-0x40]
        ldr     r3, [r11, #-0x24]
        ldr     lr, [r11, #-0x24]
        mov     r2, #1
        cmp     lr, #0
        movlt   r1, r2
        add     r1, r3, r1
        mov     r1, r1, asr #1
        cmp     r0, r1
        bge     LAJK56
LAJK17:
        mov     r0, #0
        ldr     r1, [r11, #-0x1C]
        ldr     r2, [r11, #-0x40]
        mov     r3, r2, lsl #3
        add     r3, r1, r3
        str     r0, [r1, +r2, lsl #3]
        str     r0, [r3, #4]
        ldr     r1, [r11, #-0x40]
        add     r1, r1, #1
        str     r1, [r11, #-0x40]
        ldr     r1, [r11, #-0x40]
        ldr     r3, [r11, #-0x24]
        ldr     lr, [r11, #-0x24]
        mov     r2, #1
        cmp     lr, #0
        movlt   r0, r2
        add     r0, r3, r0
        mov     r0, r0, asr #1
        cmp     r1, r0
        blt     LAJK17
        b       LAJK56
LAJK18:
        ldr     r0, [r11]
        cmn     r0, #0x40
        bgt     LAJK24
        ldr     r0, [r11, #-0x3C]
        ldr     r2, [r11, #-0x24]
        sub     r2, r2, #1
        cmp     r0, r2
        bge     LAJK22
LAJK19:
        ldr     r2, [r11, #-0x28]
        ldr     r3, [r11, #-0x3C]
        mov     r0, r3, lsl #3
        add     r0, r2, r0
        ldr     r2, [r2, +r3, lsl #3]
        ldr     r0, [r0, #4]
        str     r2, [r11, #-0xB0]
        str     r0, [r11, #-0xAC]
        ldr     r0, [r11, #-0x28]
        ldr     r2, [r11, #-0x3C]
        mov     r2, r2, lsl #3
        add     r2, r2, #8
        add     r3, r0, r2
        ldr     r2, [r0, +r2]
        ldr     r0, [r3, #4]
        str     r2, [r11, #-0xA8]
        str     r0, [r11, #-0xA4]
        ldr     r2, [r11, #-0xA8]
        ldr     r0, [r11, #-0xA4]
        ldr     lr, [r11, #-0xB0]
        ldr     r3, [r11, #-0xAC]
        rsbs    lr, lr, #0
        rsc     r3, r3, #0
        mvn     r4, #0
        adds    lr, lr, r4
        mvn     r4, #0
        adc     r3, r3, r4
        subs    r2, r2, lr
        sbcs    r0, r0, r3
        movlt   r2, #0
        movlt   r0, #0
        orrs    r0, r2, r0
        moveq   r0, #0
        moveq   lr, #2, 2
        beq     LAJK20
        ldr     r3, [r11, #-0xA8]
        ldr     r0, [r11, #-0xA4]
        ldr     lr, [r11, #-0xB0]
        ldr     r2, [r11, #-0xAC]
        cmp     r0, r2
        cmpeq   r3, lr
        mvnne   r0, #0
        mvnne   lr, #2, 2
        moveq   r0, #0
        moveq   lr, #0
LAJK20:
        ldr     r2, [r11, #-0x20]
        ldr     r3, [r11, #-0x40]
        mov     r4, r3, lsl #3
        add     r4, r2, r4
        str     r0, [r2, +r3, lsl #3]
        str     lr, [r4, #4]
        ldr     lr, [r11, #-0xA8]
        ldr     r2, [r11, #-0xA4]
        ldr     r3, [r11, #-0xB0]
        ldr     r0, [r11, #-0xAC]
        subs    r3, lr, r3
        sbcs    r2, r2, r0
        movlt   r3, #0
        movlt   r2, #0
        orrs    r2, r3, r2
        mvnne   r0, #0
        mvnne   lr, #2, 2
        bne     LAJK21
        ldr     r0, [r11, #-0xA8]
        ldr     lr, [r11, #-0xA4]
        ldr     r2, [r11, #-0xB0]
        ldr     r3, [r11, #-0xAC]
        cmp     r0, r2
        sbcs    lr, lr, r3
        movge   r0, #0
        movge   lr, #0
        movlt   r0, #0
        movlt   lr, #2, 2
LAJK21:
        ldr     r2, [r11, #-0x1C]
        ldr     r3, [r11, #-0x40]
        mov     r4, r3, lsl #3
        add     r4, r2, r4
        str     r0, [r2, +r3, lsl #3]
        str     lr, [r4, #4]
        ldr     r0, [r11, #-0x40]
        add     r0, r0, #1
        str     r0, [r11, #-0x40]
        ldr     r0, [r11, #-0x3C]
        add     r0, r0, #2
        str     r0, [r11, #-0x3C]
        ldr     r0, [r11, #-0x3C]
        sub     r2, r1, #1
        cmp     r0, r2
        blt     LAJK19
LAJK22:
        ldr     r0, [r11, #-0x24]
        tst     r0, #1
        beq     LAJK56
        ldr     r1, [r11, #-0x28]
        ldr     r2, [r11, #-0x3C]
        mov     r0, r2, lsl #3
        add     r0, r1, r0
        ldr     r1, [r1, +r2, lsl #3]
        ldr     r0, [r0, #4]
        str     r1, [r11, #-0xA0]
        str     r0, [r11, #-0x9C]
        ldr     r0, [r11, #-0xA0]
        ldr     r1, [r11, #-0x9C]
        orrs    r1, r0, r1, lsl #1
        tstcs   r1, #0
        mvnne   r0, #0
        mvnne   r3, #2, 2
        bne     LAJK23
        ldr     r0, [r11, #-0x9C]
        tst     r0, r0
        movpl   r0, #0
        movpl   r3, #0
        movmi   r0, #0
        movmi   r3, #2, 2
LAJK23:
        ldr     r1, [r11, #-0x20]
        ldr     r2, [r11, #-0x40]
        mov     lr, r2, lsl #3
        add     lr, r1, lr
        str     r0, [r1, +r2, lsl #3]
        str     r3, [lr, #4]
        b       LAJK56
LAJK24:
        ldr     r0, [r11]
        cmp     r0, #0x40
        bne     LAJK37
        ldr     r0, [r11, #-0x3C]
        ldr     r1, [r11, #-0x24]
        sub     r1, r1, #1
        cmp     r0, r1
        bge     LAJK34
LAJK25:
        ldr     r1, [r11, #-0x28]
        ldr     r3, [r11, #-0x3C]
        mov     r0, r3, lsl #3
        add     r0, r1, r0
        ldr     r1, [r1, +r3, lsl #3]
        ldr     r0, [r0, #4]
        str     r1, [r11, #-0xB0]
        str     r0, [r11, #-0xAC]
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x3C]
        mov     r1, r1, lsl #3
        add     r1, r1, #8
        add     r3, r0, r1
        ldr     r1, [r0, +r1]
        ldr     r0, [r3, #4]
        str     r1, [r11, #-0xA8]
        str     r0, [r11, #-0xA4]
        ldr     r1, [r11, #-0xA8]
        ldr     r0, [r11, #-0xA4]
        ldr     r3, [r11, #-0xB0]
        ldr     lr, [r11, #-0xAC]
        rsbs    r3, r3, #0
        rsc     lr, lr, #0
        adds    r3, r1, r3
        adc     lr, r0, lr
        str     r3, [r11, #-0xA0]
        str     lr, [r11, #-0x9C]
        ldr     r0, [r11, #-0xA8]
        ldr     r1, [r11, #-0xA4]
        ldr     lr, [r11, #-0xB0]
        ldr     r3, [r11, #-0xAC]
        adds    r0, r0, lr
        adc     r3, r1, r3
        str     r0, [r11, #-0x98]
        str     r3, [r11, #-0x94]
        ldr     lr, [r11, #-0xA8]
        ldr     r1, [r11, #-0xA4]
        ldr     r3, [r11, #-0xB0]
        ldr     r0, [r11, #-0xAC]
        subs    r3, lr, r3
        sbcs    r1, r1, r0
        movlt   r3, #0
        movlt   r1, #0
        orrs    r1, r3, r1
        beq     LAJK27
        ldr     r0, [r11, #-0x9C]
        tst     r0, r0
        bpl     LAJK26
        mov     r1, #1
        mov     r0, #0
        str     r1, [r11, #-0xA0]
        str     r0, [r11, #-0x9C]
        b       LAJK29
LAJK26:
        mov     r0, #0
        str     r0, [r11, #-0xA0]
        str     r0, [r11, #-0x9C]
        b       LAJK29
LAJK27:
        ldr     r0, [r11, #-0xA0]
        ldr     r1, [r11, #-0x9C]
        orrs    r1, r0, r1, lsl #1
        tstcs   r1, #0
        beq     LAJK28
        mvn     r0, #0
        str     r0, [r11, #-0xA0]
        str     r0, [r11, #-0x9C]
        b       LAJK29
LAJK28:
        mov     r0, #0
        str     r0, [r11, #-0xA0]
        str     r0, [r11, #-0x9C]
LAJK29:
        ldr     r1, [r11, #-0xA8]
        ldr     r0, [r11, #-0xA4]
        ldr     lr, [r11, #-0xB0]
        ldr     r3, [r11, #-0xAC]
        rsbs    lr, lr, #0
        rsc     r3, r3, #0
        mvn     r4, #0
        adds    lr, lr, r4
        mvn     r4, #0
        adc     r3, r3, r4
        subs    r1, r1, lr
        sbcs    r0, r0, r3
        movlt   r1, #0
        movlt   r0, #0
        orrs    r0, r1, r0
        bne     LAJK31
        ldr     r0, [r11, #-0x94]
        tst     r0, r0
        bmi     LAJK30
        mvn     r0, #0
        str     r0, [r11, #-0x98]
        str     r0, [r11, #-0x94]
        b       LAJK33
LAJK30:
        mov     r0, #0
        str     r0, [r11, #-0x98]
        str     r0, [r11, #-0x94]
        b       LAJK33
LAJK31:
        ldr     r0, [r11, #-0x94]
        tst     r0, r0
        bpl     LAJK32
        mov     r1, #1
        mov     r0, #0
        str     r1, [r11, #-0x98]
        str     r0, [r11, #-0x94]
        b       LAJK33
LAJK32:
        mov     r0, #0
        str     r0, [r11, #-0x98]
        str     r0, [r11, #-0x94]
LAJK33:
        ldr     r0, [r11, #-0x98]
        ldr     lr, [r11, #-0x94]
        ldr     r1, [r11, #-0x20]
        ldr     r3, [r11, #-0x40]
        mov     r4, r3, lsl #3
        add     r4, r1, r4
        str     r0, [r1, +r3, lsl #3]
        str     lr, [r4, #4]
        ldr     r0, [r11, #-0xA0]
        ldr     lr, [r11, #-0x9C]
        ldr     r1, [r11, #-0x1C]
        ldr     r3, [r11, #-0x40]
        mov     r4, r3, lsl #3
        add     r4, r1, r4
        str     r0, [r1, +r3, lsl #3]
        str     lr, [r4, #4]
        ldr     r0, [r11, #-0x40]
        add     r0, r0, #1
        str     r0, [r11, #-0x40]
        ldr     r0, [r11, #-0x3C]
        add     r0, r0, #2
        str     r0, [r11, #-0x3C]
        ldr     r0, [r11, #-0x3C]
        sub     r1, r2, #1
        cmp     r0, r1
        blt     LAJK25
LAJK34:
        ldr     r0, [r11, #-0x24]
        tst     r0, #1
        beq     LAJK56
        ldr     r1, [r11, #-0x28]
        ldr     r2, [r11, #-0x3C]
        mov     r0, r2, lsl #3
        add     r0, r1, r0
        ldr     r1, [r1, +r2, lsl #3]
        ldr     r0, [r0, #4]
        str     r1, [r11, #-0x98]
        str     r0, [r11, #-0x94]
        mov     r2, #0
        mov     r0, #1, 2
        ldr     r3, [r11, #-0x98]
        ldr     r1, [r11, #-0x94]
        subs    r2, r3, r2
        sbcs    r1, r1, r0
        movlt   r2, #0
        movlt   r1, #0
        orrs    r1, r2, r1
        beq     LAJK35
        mov     r0, #1
        mov     r3, #0
        ldr     r1, [r11, #-0x20]
        ldr     r2, [r11, #-0x40]
        mov     lr, r2, lsl #3
        add     lr, r1, lr
        str     r0, [r1, +r2, lsl #3]
        str     r3, [lr, #4]
        b       LAJK56
LAJK35:
        mov     r1, #3, 2
        ldr     r0, [r11, #-0x98]
        ldr     r2, [r11, #-0x94]
        cmp     r0, #0
        sbcs    r2, r2, r1
        bge     LAJK36
        mvn     r2, #0
        ldr     r0, [r11, #-0x20]
        ldr     r1, [r11, #-0x40]
        mov     r3, r1, lsl #3
        add     r3, r0, r3
        str     r2, [r0, +r1, lsl #3]
        str     r2, [r3, #4]
        b       LAJK56
LAJK36:
        mov     r2, #0
        ldr     r0, [r11, #-0x20]
        ldr     r1, [r11, #-0x40]
        mov     r3, r1, lsl #3
        add     r3, r0, r3
        str     r2, [r0, +r1, lsl #3]
        str     r2, [r3, #4]
        b       LAJK56
LAJK37:
        ldr     r0, [r11]
        cmp     r0, #0x3D
        blt     LAJK40
        mov     r0, #3
        str     r0, [r11, #-0x34]
        ldr     r1, [r11, #-0x34]
        mov     r0, #1
        mov     r1, r0, lsl r1
        sub     r1, r1, #1
        str     r1, [r11, #-0x30]
        ldr     r1, [r11, #-0x34]
        mov     r0, r0, lsl r1
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11]
        ldr     r1, [r11, #-0x34]
        mov     r2, #0
        sub     r2, r2, r1
        add     r2, r0, r2
        str     r2, [r11]
        ldr     r0, [r11]
        sub     r2, r0, #1
        mov     r3, r2, asr #31
        mov     r0, #1
        mov     r1, #0
        bl      __ashldi3
        mvn     r2, #0
        adds    r0, r0, r2
        mvn     r2, #0
        adc     r1, r1, r2
        str     r0, [r11, #-0x68]
        str     r1, [r11, #-0x64]
        ldr     r0, [r11, #-0x3C]
        ldr     r1, [r11, #-0x24]
        sub     r1, r1, #1
        cmp     r0, r1
        bge     LAJK39
LAJK38:
        ldr     r1, [r11, #-0x28]
        ldr     r2, [r11, #-0x3C]
        mov     r0, r2, lsl #3
        add     r0, r1, r0
        ldr     r1, [r1, +r2, lsl #3]
        ldr     r0, [r0, #4]
        str     r1, [r11, #-0xB0]
        str     r0, [r11, #-0xAC]
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x3C]
        mov     r1, r1, lsl #3
        add     r1, r1, #8
        add     r2, r0, r1
        ldr     r1, [r0, +r1]
        ldr     r0, [r2, #4]
        str     r1, [r11, #-0xA8]
        str     r0, [r11, #-0xA4]
        ldr     r0, [r11, #-0xA8]
        ldr     r1, [r11, #-0xA4]
        ldr     r2, [r11, #-0x34]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        mov     r5, r0
        mov     r6, r1
        ldr     r0, [r11, #-0xB0]
        ldr     r1, [r11, #-0xAC]
        ldr     r2, [r11, #-0x34]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
        adds    r0, r5, r0
        adc     r1, r6, r1
        str     r0, [r11, #-0xA0]
        str     r1, [r11, #-0x9C]
        ldr     r0, [r11, #-0xA8]
        ldr     r1, [r11, #-0xA4]
        ldr     r2, [r11, #-0x34]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        mov     r5, r0
        mov     r6, r1
        ldr     r0, [r11, #-0xB0]
        ldr     r1, [r11, #-0xAC]
        ldr     r2, [r11, #-0x34]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        adds    r0, r5, r0
        adc     r1, r6, r1
        str     r0, [r11, #-0x98]
        str     r1, [r11, #-0x94]
        ldr     r5, [r11, #-0xA8]
        ldr     r6, [r11, #-0xA4]
        ldr     r0, [r11, #-0xA8]
        ldr     r1, [r11, #-0xA4]
        ldr     r2, [r11, #-0x34]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        ldr     r2, [r11, #-0x34]
        mov     r3, r2, asr #31
        bl      __ashldi3
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
        adds    r0, r5, r0
        adc     r1, r6, r1
        str     r0, [r11, #-0x60]
        str     r1, [r11, #-0x5C]
        ldr     r5, [r11, #-0xB0]
        ldr     r6, [r11, #-0xAC]
        ldr     r0, [r11, #-0xB0]
        ldr     r1, [r11, #-0xAC]
        ldr     r2, [r11, #-0x34]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        ldr     r2, [r11, #-0x34]
        mov     r3, r2, asr #31
        bl      __ashldi3
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
        adds    r0, r5, r0
        adc     r1, r6, r1
        str     r0, [r11, #-0x58]
        str     r1, [r11, #-0x54]
        ldr     r0, [r11, #-0x60]
        ldr     r1, [r11, #-0x58]
        mov     r2, #0
        sub     r2, r2, r1
        add     r2, r0, r2
        ldr     r0, [r11, #-0x30]
        add     r2, r2, r0
        ldr     r0, [r11, #-0x2C]
        and     r2, r2, r0
        ldr     r0, [r11, #-0x34]
        mov     r1, r2, asr r0
        mov     r0, r1, asr #31
        str     r1, [r11, #-0x50]
        str     r0, [r11, #-0x4C]
        ldr     r0, [r11, #-0x60]
        ldr     r1, [r11, #-0x58]
        add     r0, r0, r1
        ldr     r1, [r11, #-0x30]
        add     r0, r0, r1
        ldr     r1, [r11, #-0x2C]
        and     r0, r0, r1
        ldr     r1, [r11, #-0x34]
        mov     r1, r0, asr r1
        mov     r0, r1, asr #31
        str     r1, [r11, #-0x48]
        str     r0, [r11, #-0x44]
        ldr     r0, [r11, #-0xA0]
        ldr     r1, [r11, #-0x9C]
        ldr     r3, [r11, #-0x50]
        ldr     r2, [r11, #-0x4C]
        adds    r0, r0, r3
        adc     r1, r1, r2
        ldr     r3, [r11, #-0x68]
        ldr     r2, [r11, #-0x64]
        adds    r5, r0, r3
        adc     r6, r1, r2
        ldr     r0, [r11, #-0xA0]
        ldr     r1, [r11, #-0x9C]
        ldr     r2, [r11]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        and     r0, r0, #1
        mov     r1, #0
        adds    r0, r5, r0
        adc     r1, r6, r1
        ldr     r2, [r11]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        str     r0, [r11, #-0xA0]
        str     r1, [r11, #-0x9C]
        ldr     r0, [r11, #-0x98]
        ldr     r1, [r11, #-0x94]
        ldr     r3, [r11, #-0x48]
        ldr     r2, [r11, #-0x44]
        adds    r0, r0, r3
        adc     r1, r1, r2
        ldr     r3, [r11, #-0x68]
        ldr     r2, [r11, #-0x64]
        adds    r5, r0, r3
        adc     r6, r1, r2
        ldr     r0, [r11, #-0x98]
        ldr     r1, [r11, #-0x94]
        ldr     r2, [r11]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        and     r0, r0, #1
        mov     r1, #0
        adds    r0, r5, r0
        adc     r1, r6, r1
        ldr     r2, [r11]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        str     r0, [r11, #-0x98]
        str     r1, [r11, #-0x94]
        ldr     r0, [r11, #-0x98]
        ldr     r3, [r11, #-0x94]
        ldr     r1, [r11, #-0x20]
        ldr     r2, [r11, #-0x40]
        mov     lr, r2, lsl #3
        add     lr, r1, lr
        str     r0, [r1, +r2, lsl #3]
        str     r3, [lr, #4]
        ldr     r0, [r11, #-0xA0]
        ldr     r3, [r11, #-0x9C]
        ldr     r1, [r11, #-0x1C]
        ldr     r2, [r11, #-0x40]
        mov     lr, r2, lsl #3
        add     lr, r1, lr
        str     r0, [r1, +r2, lsl #3]
        str     r3, [lr, #4]
        ldr     r0, [r11, #-0x40]
        add     r0, r0, #1
        str     r0, [r11, #-0x40]
        ldr     r0, [r11, #-0x3C]
        add     r0, r0, #2
        str     r0, [r11, #-0x3C]
        ldr     r0, [r11, #-0x3C]
        sub     r1, r4, #1
        cmp     r0, r1
        blt     LAJK38
LAJK39:
        ldr     r0, [r11, #-0x24]
        tst     r0, #1
        beq     LAJK56
        ldr     r0, [r11]
        ldr     r1, [r11, #-0x34]
        sub     r1, r1, #1
        add     r1, r0, r1
        str     r1, [r11]
        mov     r0, #3
        str     r0, [r11, #-0x34]
        ldr     r1, [r11, #-0x34]
        mov     r0, #1
        mov     r1, r0, lsl r1
        sub     r1, r1, #1
        str     r1, [r11, #-0x30]
        ldr     r1, [r11, #-0x34]
        mov     r0, r0, lsl r1
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11]
        ldr     r1, [r11, #-0x34]
        mov     r2, #0
        sub     r2, r2, r1
        add     r2, r0, r2
        str     r2, [r11]
        ldr     r0, [r11]
        sub     r2, r0, #1
        mov     r3, r2, asr #31
        mov     r0, #1
        mov     r1, #0
        bl      __ashldi3
        mvn     r2, #0
        adds    r0, r0, r2
        mvn     r2, #0
        adc     r1, r1, r2
        str     r0, [r11, #-0x68]
        str     r1, [r11, #-0x64]
        ldr     r1, [r11, #-0x28]
        ldr     r2, [r11, #-0x3C]
        mov     r0, r2, lsl #3
        add     r0, r1, r0
        ldr     r1, [r1, +r2, lsl #3]
        ldr     r0, [r0, #4]
        str     r1, [r11, #-0xB0]
        str     r0, [r11, #-0xAC]
        ldr     r0, [r11, #-0xB0]
        ldr     r1, [r11, #-0xAC]
        ldr     r2, [r11, #-0x34]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        str     r0, [r11, #-0x98]
        str     r1, [r11, #-0x94]
        ldr     r4, [r11, #-0xB0]
        ldr     r5, [r11, #-0xAC]
        ldr     r0, [r11, #-0xB0]
        ldr     r1, [r11, #-0xAC]
        ldr     r2, [r11, #-0x34]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        ldr     r2, [r11, #-0x34]
        mov     r3, r2, asr #31
        bl      __ashldi3
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
        adds    r0, r4, r0
        adc     r1, r5, r1
        str     r0, [r11, #-0x58]
        str     r1, [r11, #-0x54]
        ldr     r0, [r11, #-0x58]
        ldr     r1, [r11, #-0x54]
        ldr     r3, [r11, #-0x30]
        mov     r2, r3, asr #31
        adds    r0, r0, r3
        adc     r1, r1, r2
        ldr     r3, [r11, #-0x2C]
        mov     r2, r3, asr #31
        and     r0, r0, r3
        and     r1, r1, r2
        ldr     r2, [r11, #-0x34]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        str     r0, [r11, #-0x48]
        str     r1, [r11, #-0x44]
        ldr     r0, [r11, #-0x98]
        ldr     r1, [r11, #-0x94]
        ldr     r3, [r11, #-0x48]
        ldr     r2, [r11, #-0x44]
        adds    r0, r0, r3
        adc     r1, r1, r2
        ldr     r3, [r11, #-0x68]
        ldr     r2, [r11, #-0x64]
        adds    r5, r0, r3
        adc     r4, r1, r2
        ldr     r0, [r11, #-0x98]
        ldr     r1, [r11, #-0x94]
        ldr     r2, [r11]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        and     r0, r0, #1
        mov     r1, #0
        adds    r0, r5, r0
        adc     r1, r4, r1
        ldr     r2, [r11]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        str     r0, [r11, #-0x98]
        str     r1, [r11, #-0x94]
        ldr     r0, [r11, #-0x98]
        ldr     r3, [r11, #-0x94]
        ldr     r1, [r11, #-0x20]
        ldr     r2, [r11, #-0x40]
        mov     lr, r2, lsl #3
        add     lr, r1, lr
        str     r0, [r1, +r2, lsl #3]
        str     r3, [lr, #4]
        b       LAJK56
LAJK40:
        ldr     r0, [r11]
        cmp     r0, #1
        ble     LAJK43
        ldr     r0, [r11]
        sub     r2, r0, #1
        mov     r3, r2, asr #31
        mov     r0, #1
        mov     r1, #0
        bl      __ashldi3
        mvn     r2, #0
        adds    r0, r0, r2
        mvn     r2, #0
        adc     r1, r1, r2
        str     r0, [r11, #-0x90]
        str     r1, [r11, #-0x8C]
        ldr     r0, [r11]
        add     r0, r0, #1
        str     r0, [r11, #-0x38]
        ldr     r0, [r11, #-0x3C]
        ldr     r1, [r11, #-0x24]
        sub     r1, r1, #1
        cmp     r0, r1
        bge     LAJK42
LAJK41:
        ldr     r1, [r11, #-0x28]
        ldr     r2, [r11, #-0x3C]
        mov     r0, r2, lsl #3
        add     r0, r1, r0
        ldr     r1, [r1, +r2, lsl #3]
        ldr     r0, [r0, #4]
        str     r1, [r11, #-0xB0]
        str     r0, [r11, #-0xAC]
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x3C]
        mov     r1, r1, lsl #3
        add     r1, r1, #8
        add     r2, r0, r1
        ldr     r1, [r0, +r1]
        ldr     r0, [r2, #4]
        str     r1, [r11, #-0xA8]
        str     r0, [r11, #-0xA4]
        ldr     r0, [r11, #-0xA8]
        ldr     r1, [r11, #-0xA4]
        ldr     r2, [r11, #-0x38]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        mov     r4, r0
        mov     r6, r1
        ldr     r0, [r11, #-0xB0]
        ldr     r1, [r11, #-0xAC]
        ldr     r2, [r11, #-0x38]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
        adds    r0, r4, r0
        adc     r1, r6, r1
        str     r0, [r11, #-0xA0]
        str     r1, [r11, #-0x9C]
        ldr     r0, [r11, #-0xA8]
        ldr     r1, [r11, #-0xA4]
        ldr     r2, [r11, #-0x38]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        mov     r4, r0
        mov     r6, r1
        ldr     r0, [r11, #-0xB0]
        ldr     r1, [r11, #-0xAC]
        ldr     r2, [r11, #-0x38]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        adds    r0, r4, r0
        adc     r1, r6, r1
        str     r0, [r11, #-0x98]
        str     r1, [r11, #-0x94]
        ldr     r4, [r11, #-0xB0]
        ldr     r6, [r11, #-0xAC]
        ldr     r0, [r11, #-0xB0]
        ldr     r1, [r11, #-0xAC]
        ldr     r2, [r11, #-0x38]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        ldr     r2, [r11, #-0x38]
        mov     r3, r2, asr #31
        bl      __ashldi3
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
        adds    r0, r4, r0
        adc     r1, r6, r1
        str     r0, [r11, #-0x88]
        str     r1, [r11, #-0x84]
        ldr     r4, [r11, #-0xA8]
        ldr     r6, [r11, #-0xA4]
        ldr     r0, [r11, #-0xA8]
        ldr     r1, [r11, #-0xA4]
        ldr     r2, [r11, #-0x38]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        ldr     r2, [r11, #-0x38]
        mov     r3, r2, asr #31
        bl      __ashldi3
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
        adds    r0, r4, r0
        adc     r1, r6, r1
        str     r0, [r11, #-0x80]
        str     r1, [r11, #-0x7C]
        ldr     r1, [r11, #-0x80]
        ldr     r0, [r11, #-0x7C]
        ldr     r2, [r11, #-0x88]
        ldr     r3, [r11, #-0x84]
        rsbs    r2, r2, #0
        rsc     r3, r3, #0
        adds    r2, r1, r2
        adc     r3, r0, r3
        str     r2, [r11, #-0x78]
        str     r3, [r11, #-0x74]
        ldr     r0, [r11, #-0x80]
        ldr     r1, [r11, #-0x7C]
        ldr     r3, [r11, #-0x88]
        ldr     r2, [r11, #-0x84]
        adds    r0, r0, r3
        adc     r2, r1, r2
        str     r0, [r11, #-0x70]
        str     r2, [r11, #-0x6C]
        ldr     r2, [r11, #-0x78]
        ldr     r0, [r11, #-0x74]
        ldr     r3, [r11, #-0x90]
        ldr     r1, [r11, #-0x8C]
        adds    r4, r2, r3
        adc     r6, r0, r1
        ldr     r0, [r11, #-0x78]
        ldr     r1, [r11, #-0x74]
        ldr     r2, [r11]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        and     r0, r0, #1
        mov     r1, #0
        adds    r0, r4, r0
        adc     r1, r6, r1
        ldr     r2, [r11]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        str     r0, [r11, #-0x78]
        str     r1, [r11, #-0x74]
        ldr     r2, [r11, #-0x70]
        ldr     r0, [r11, #-0x6C]
        ldr     r3, [r11, #-0x90]
        ldr     r1, [r11, #-0x8C]
        adds    r4, r2, r3
        adc     r6, r0, r1
        ldr     r0, [r11, #-0x70]
        ldr     r1, [r11, #-0x6C]
        ldr     r2, [r11]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        and     r0, r0, #1
        mov     r1, #0
        adds    r0, r4, r0
        adc     r1, r6, r1
        ldr     r2, [r11]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        str     r0, [r11, #-0x70]
        str     r1, [r11, #-0x6C]
        ldr     r1, [r11, #-0x78]
        ldr     r0, [r11, #-0x74]
        ldr     r3, [r11, #-0xA0]
        ldr     r2, [r11, #-0x9C]
        mov     r2, r2, lsl #1
        mov     lr, r3, lsr #31
        mov     r3, r3, lsl #1
        orr     lr, r2, lr
        adds    r3, r1, r3
        adc     lr, r0, lr
        str     r3, [r11, #-0xA0]
        str     lr, [r11, #-0x9C]
        ldr     r1, [r11, #-0x70]
        ldr     r0, [r11, #-0x6C]
        ldr     r3, [r11, #-0x98]
        ldr     r2, [r11, #-0x94]
        mov     r2, r2, lsl #1
        mov     lr, r3, lsr #31
        mov     r3, r3, lsl #1
        orr     lr, r2, lr
        adds    r3, r1, r3
        adc     lr, r0, lr
        str     r3, [r11, #-0x98]
        str     lr, [r11, #-0x94]
        ldr     r0, [r11, #-0x98]
        ldr     r3, [r11, #-0x94]
        ldr     r1, [r11, #-0x20]
        ldr     r2, [r11, #-0x40]
        mov     lr, r2, lsl #3
        add     lr, r1, lr
        str     r0, [r1, +r2, lsl #3]
        str     r3, [lr, #4]
        ldr     r0, [r11, #-0xA0]
        ldr     r3, [r11, #-0x9C]
        ldr     r1, [r11, #-0x1C]
        ldr     r2, [r11, #-0x40]
        mov     lr, r2, lsl #3
        add     lr, r1, lr
        str     r0, [r1, +r2, lsl #3]
        str     r3, [lr, #4]
        ldr     r0, [r11, #-0x40]
        add     r0, r0, #1
        str     r0, [r11, #-0x40]
        ldr     r0, [r11, #-0x3C]
        add     r0, r0, #2
        str     r0, [r11, #-0x3C]
        ldr     r0, [r11, #-0x3C]
        sub     r1, r5, #1
        cmp     r0, r1
        blt     LAJK41
LAJK42:
        ldr     r0, [r11, #-0x24]
        tst     r0, #1
        beq     LAJK56
        ldr     r0, [r11]
        sub     r0, r0, #1
        str     r0, [r11]
        ldr     r0, [r11]
        sub     r2, r0, #1
        mov     r3, r2, asr #31
        mov     r0, #1
        mov     r1, #0
        bl      __ashldi3
        mvn     r2, #0
        adds    r0, r0, r2
        mvn     r2, #0
        adc     r1, r1, r2
        str     r0, [r11, #-0x90]
        str     r1, [r11, #-0x8C]
        ldr     r0, [r11]
        add     r0, r0, #1
        str     r0, [r11, #-0x38]
        ldr     r1, [r11, #-0x28]
        ldr     r2, [r11, #-0x3C]
        mov     r0, r2, lsl #3
        add     r0, r1, r0
        ldr     r1, [r1, +r2, lsl #3]
        ldr     r0, [r0, #4]
        str     r1, [r11, #-0xB0]
        str     r0, [r11, #-0xAC]
        ldr     r0, [r11, #-0xB0]
        ldr     r1, [r11, #-0xAC]
        ldr     r2, [r11, #-0x38]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        str     r0, [r11, #-0x98]
        str     r1, [r11, #-0x94]
        ldr     r4, [r11, #-0xB0]
        ldr     r5, [r11, #-0xAC]
        ldr     r0, [r11, #-0xB0]
        ldr     r1, [r11, #-0xAC]
        ldr     r2, [r11, #-0x38]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        ldr     r2, [r11, #-0x38]
        mov     r3, r2, asr #31
        bl      __ashldi3
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
        adds    r0, r4, r0
        adc     r1, r5, r1
        str     r0, [r11, #-0x88]
        str     r1, [r11, #-0x84]
        ldr     r1, [r11, #-0x88]
        ldr     r0, [r11, #-0x84]
        str     r1, [r11, #-0x70]
        str     r0, [r11, #-0x6C]
        ldr     r2, [r11, #-0x70]
        ldr     r0, [r11, #-0x6C]
        ldr     r3, [r11, #-0x90]
        ldr     r1, [r11, #-0x8C]
        adds    r5, r2, r3
        adc     r4, r0, r1
        ldr     r0, [r11, #-0x70]
        ldr     r1, [r11, #-0x6C]
        ldr     r2, [r11]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        and     r0, r0, #1
        mov     r1, #0
        adds    r0, r5, r0
        adc     r1, r4, r1
        ldr     r2, [r11]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        str     r0, [r11, #-0x70]
        str     r1, [r11, #-0x6C]
        ldr     r1, [r11, #-0x70]
        ldr     r0, [r11, #-0x6C]
        ldr     r3, [r11, #-0x98]
        ldr     r2, [r11, #-0x94]
        mov     r2, r2, lsl #1
        mov     lr, r3, lsr #31
        mov     r3, r3, lsl #1
        orr     lr, r2, lr
        adds    r3, r1, r3
        adc     lr, r0, lr
        str     r3, [r11, #-0x98]
        str     lr, [r11, #-0x94]
        ldr     r0, [r11, #-0x98]
        ldr     r3, [r11, #-0x94]
        ldr     r1, [r11, #-0x20]
        ldr     r2, [r11, #-0x40]
        mov     lr, r2, lsl #3
        add     lr, r1, lr
        str     r0, [r1, +r2, lsl #3]
        str     r3, [lr, #4]
        b       LAJK56
LAJK43:
        ldr     r1, [r11]
        mov     r0, #0
        sub     r1, r0, r1
        str     r1, [r11]
        ldr     r1, [r11]
        sub     r0, r0, r1
        add     r2, r0, #0x3F
        mov     r3, r2, asr #31
        mov     r0, #1
        mov     r1, #0
        bl      __ashldi3
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
        str     r0, [r11, #-0xC0]
        str     r1, [r11, #-0xBC]
        ldr     r1, [r11, #-0xC0]
        ldr     r0, [r11, #-0xBC]
        rsbs    r1, r1, #0
        rsc     r0, r0, #0
        mvn     r2, #0
        adds    r1, r1, r2
        mvn     r2, #0
        adc     r0, r0, r2
        str     r1, [r11, #-0xB8]
        str     r0, [r11, #-0xB4]
        ldr     r0, [r11, #-0x3C]
        ldr     r1, [r11, #-0x24]
        sub     r1, r1, #1
        cmp     r0, r1
        bge     LAJK51
LAJK44:
        ldr     r1, [r11, #-0x28]
        ldr     r2, [r11, #-0x3C]
        mov     r0, r2, lsl #3
        add     r0, r1, r0
        ldr     r1, [r1, +r2, lsl #3]
        ldr     r0, [r0, #4]
        str     r1, [r11, #-0xB0]
        str     r0, [r11, #-0xAC]
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x3C]
        mov     r1, r1, lsl #3
        add     r1, r1, #8
        add     r2, r0, r1
        ldr     r1, [r0, +r1]
        ldr     r0, [r2, #4]
        str     r1, [r11, #-0xA8]
        str     r0, [r11, #-0xA4]
        ldr     r1, [r11, #-0xA8]
        ldr     r0, [r11, #-0xA4]
        ldr     r2, [r11, #-0xB0]
        ldr     r3, [r11, #-0xAC]
        rsbs    r2, r2, #0
        rsc     r3, r3, #0
        adds    r2, r1, r2
        adc     r3, r0, r3
        str     r2, [r11, #-0xA0]
        str     r3, [r11, #-0x9C]
        ldr     r0, [r11, #-0xA8]
        ldr     r1, [r11, #-0xA4]
        ldr     r3, [r11, #-0xB0]
        ldr     r2, [r11, #-0xAC]
        adds    r0, r0, r3
        adc     r2, r1, r2
        str     r0, [r11, #-0x98]
        str     r2, [r11, #-0x94]
        ldr     r3, [r11, #-0xA8]
        ldr     r1, [r11, #-0xA4]
        ldr     r2, [r11, #-0xB0]
        ldr     r0, [r11, #-0xAC]
        subs    r2, r3, r2
        sbcs    r1, r1, r0
        movlt   r2, #0
        movlt   r1, #0
        orrs    r1, r2, r1
        beq     LAJK45
        ldr     r0, [r11, #-0x9C]
        tst     r0, r0
        bpl     LAJK46
        mvn     r1, #0
        mvn     r0, #2, 2
        str     r1, [r11, #-0xA0]
        str     r0, [r11, #-0x9C]
        b       LAJK46
LAJK45:
        ldr     r0, [r11, #-0xA0]
        ldr     r1, [r11, #-0x9C]
        orrs    r1, r0, r1, lsl #1
        tstcs   r1, #0
        beq     LAJK46
        mov     r1, #0
        mov     r0, #2, 2
        str     r1, [r11, #-0xA0]
        str     r0, [r11, #-0x9C]
LAJK46:
        ldr     r0, [r11, #-0xB0]
        ldr     r1, [r11, #-0xAC]
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
        str     r0, [r11, #-0xB0]
        str     r1, [r11, #-0xAC]
        ldr     r0, [r11, #-0xB0]
        ldr     r1, [r11, #-0xAC]
        mvn     r2, #0
        adds    r0, r0, r2
        mvn     r2, #0
        adc     r1, r1, r2
        str     r0, [r11, #-0xB0]
        str     r1, [r11, #-0xAC]
        ldr     r3, [r11, #-0xA8]
        ldr     r1, [r11, #-0xA4]
        ldr     r2, [r11, #-0xB0]
        ldr     r0, [r11, #-0xAC]
        subs    r2, r3, r2
        sbcs    r1, r1, r0
        movlt   r2, #0
        movlt   r1, #0
        orrs    r1, r2, r1
        bne     LAJK47
        ldr     r0, [r11, #-0x94]
        tst     r0, r0
        bmi     LAJK48
        mov     r1, #0
        mov     r0, #2, 2
        str     r1, [r11, #-0x98]
        str     r0, [r11, #-0x94]
        b       LAJK48
LAJK47:
        ldr     r0, [r11, #-0x94]
        tst     r0, r0
        bpl     LAJK48
        mvn     r1, #0
        mvn     r0, #2, 2
        str     r1, [r11, #-0x98]
        str     r0, [r11, #-0x94]
LAJK48:
        ldr     r3, [r11, #-0x98]
        ldr     r1, [r11, #-0x94]
        ldr     r2, [r11, #-0xC0]
        ldr     r0, [r11, #-0xBC]
        subs    r2, r3, r2
        sbcs    r1, r1, r0
        movlt   r2, #0
        movlt   r1, #0
        orrs    r1, r2, r1
        moveq   r0, #0
        moveq   r1, #2, 2
        beq     LAJK49
        ldr     r0, [r11, #-0x98]
        ldr     r3, [r11, #-0x94]
        ldr     r1, [r11, #-0xB8]
        ldr     r2, [r11, #-0xB4]
        cmp     r0, r1
        sbcs    r3, r3, r2
        mvnge   r0, #0
        mvnge   r1, #2, 2
        bge     LAJK49
        ldr     r0, [r11, #-0x98]
        ldr     r1, [r11, #-0x94]
        ldr     r2, [r11]
        mov     r3, r2, asr #31
        bl      __ashldi3
LAJK49:
        str     r0, [r11, #-0x98]
        str     r1, [r11, #-0x94]
        ldr     r3, [r11, #-0xA0]
        ldr     r1, [r11, #-0x9C]
        ldr     r2, [r11, #-0xC0]
        ldr     r0, [r11, #-0xBC]
        subs    r2, r3, r2
        sbcs    r1, r1, r0
        movlt   r2, #0
        movlt   r1, #0
        orrs    r1, r2, r1
        moveq   r0, #0
        moveq   r1, #2, 2
        beq     LAJK50
        ldr     r0, [r11, #-0xA0]
        ldr     r3, [r11, #-0x9C]
        ldr     r1, [r11, #-0xB8]
        ldr     r2, [r11, #-0xB4]
        cmp     r0, r1
        sbcs    r3, r3, r2
        mvnge   r0, #0
        mvnge   r1, #2, 2
        bge     LAJK50
        ldr     r0, [r11, #-0xA0]
        ldr     r1, [r11, #-0x9C]
        ldr     r2, [r11]
        mov     r3, r2, asr #31
        bl      __ashldi3
LAJK50:
        str     r0, [r11, #-0xA0]
        str     r1, [r11, #-0x9C]
        ldr     r0, [r11, #-0x98]
        ldr     r3, [r11, #-0x94]
        ldr     r1, [r11, #-0x20]
        ldr     r2, [r11, #-0x40]
        mov     lr, r2, lsl #3
        add     lr, r1, lr
        str     r0, [r1, +r2, lsl #3]
        str     r3, [lr, #4]
        ldr     r0, [r11, #-0xA0]
        ldr     r3, [r11, #-0x9C]
        ldr     r1, [r11, #-0x1C]
        ldr     r2, [r11, #-0x40]
        mov     lr, r2, lsl #3
        add     lr, r1, lr
        str     r0, [r1, +r2, lsl #3]
        str     r3, [lr, #4]
        ldr     r0, [r11, #-0x40]
        add     r0, r0, #1
        str     r0, [r11, #-0x40]
        ldr     r0, [r11, #-0x3C]
        add     r0, r0, #2
        str     r0, [r11, #-0x3C]
        ldr     r0, [r11, #-0x3C]
        sub     r1, r6, #1
        cmp     r0, r1
        blt     LAJK44
LAJK51:
        ldr     r0, [r11, #-0x24]
        tst     r0, #1
        beq     LAJK56
        ldr     r0, [r11]
        cmp     r0, #0x3F
        bne     LAJK54
        ldr     r1, [r11, #-0x28]
        ldr     r2, [r11, #-0x3C]
        mov     r0, r2, lsl #3
        add     r0, r1, r0
        ldr     r1, [r1, +r2, lsl #3]
        ldr     r0, [r0, #4]
        str     r1, [r11, #-0x98]
        str     r0, [r11, #-0x94]
        ldr     r0, [r11, #-0x98]
        ldr     r1, [r11, #-0x94]
        orrs    r1, r0, r1, lsl #1
        tstcs   r1, #0
        beq     LAJK52
        mvn     r0, #0
        mvn     r3, #2, 2
        ldr     r1, [r11, #-0x20]
        ldr     r2, [r11, #-0x40]
        mov     lr, r2, lsl #3
        add     lr, r1, lr
        str     r0, [r1, +r2, lsl #3]
        str     r3, [lr, #4]
        b       LAJK56
LAJK52:
        ldr     r0, [r11, #-0x94]
        tst     r0, r0
        bpl     LAJK53
        mov     r0, #0
        mov     r3, #2, 2
        ldr     r1, [r11, #-0x20]
        ldr     r2, [r11, #-0x40]
        mov     lr, r2, lsl #3
        add     lr, r1, lr
        str     r0, [r1, +r2, lsl #3]
        str     r3, [lr, #4]
        b       LAJK56
LAJK53:
        mov     r2, #0
        ldr     r0, [r11, #-0x20]
        ldr     r1, [r11, #-0x40]
        mov     r3, r1, lsl #3
        add     r3, r0, r3
        str     r2, [r0, +r1, lsl #3]
        str     r2, [r3, #4]
        b       LAJK56
LAJK54:
        ldr     r0, [r11]
        add     r0, r0, #1
        str     r0, [r11]
        ldr     r0, [r11]
        mov     r1, #0
        sub     r1, r1, r0
        add     r2, r1, #0x3F
        mov     r3, r2, asr #31
        mov     r0, #1
        mov     r1, #0
        bl      __ashldi3
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
        str     r0, [r11, #-0xC0]
        str     r1, [r11, #-0xBC]
        ldr     r1, [r11, #-0xC0]
        ldr     r0, [r11, #-0xBC]
        rsbs    r1, r1, #0
        rsc     r0, r0, #0
        mvn     r2, #0
        adds    r1, r1, r2
        mvn     r2, #0
        adc     r0, r0, r2
        str     r1, [r11, #-0xB8]
        str     r0, [r11, #-0xB4]
        ldr     r1, [r11, #-0x28]
        ldr     r2, [r11, #-0x3C]
        mov     r0, r2, lsl #3
        add     r0, r1, r0
        ldr     r1, [r1, +r2, lsl #3]
        ldr     r0, [r0, #4]
        str     r1, [r11, #-0x98]
        str     r0, [r11, #-0x94]
        ldr     r3, [r11, #-0x98]
        ldr     r1, [r11, #-0x94]
        ldr     r2, [r11, #-0xC0]
        ldr     r0, [r11, #-0xBC]
        subs    r2, r3, r2
        sbcs    r1, r1, r0
        movlt   r2, #0
        movlt   r1, #0
        orrs    r1, r2, r1
        moveq   r0, #0
        moveq   r1, #2, 2
        beq     LAJK55
        ldr     r0, [r11, #-0x98]
        ldr     r3, [r11, #-0x94]
        ldr     r1, [r11, #-0xB8]
        ldr     r2, [r11, #-0xB4]
        cmp     r0, r1
        sbcs    r3, r3, r2
        mvnge   r0, #0
        mvnge   r1, #2, 2
        bge     LAJK55
        ldr     r0, [r11, #-0x98]
        ldr     r1, [r11, #-0x94]
        ldr     r2, [r11]
        mov     r3, r2, asr #31
        bl      __ashldi3
LAJK55:
        str     r0, [r11, #-0x98]
        str     r1, [r11, #-0x94]
        ldr     r0, [r11, #-0x98]
        ldr     r3, [r11, #-0x94]
        ldr     r1, [r11, #-0x20]
        ldr     r2, [r11, #-0x40]
        mov     lr, r2, lsl #3
        add     lr, r1, lr
        str     r0, [r1, +r2, lsl #3]
        str     r3, [lr, #4]
LAJK56:
        mov     r0, #0
        ldmdb   r11, {r4 - r6, r11, sp, pc}


