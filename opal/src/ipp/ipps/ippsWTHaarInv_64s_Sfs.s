        .text
        .align  4
        .globl  _ippsWTHaarInv_64s_Sfs


_ippsWTHaarInv_64s_Sfs:
        mov     r12, sp
        stmdb   sp!, {r4 - r6, r11, r12, lr}
        mov     r11, r12
        sub     sp, sp, #0xAC
        str     r0, [r11, #-0x28]
        str     r1, [r11, #-0x24]
        str     r2, [r11, #-0x20]
        str     r3, [r11, #-0x1C]
        ldr     r6, [r11, #-0x1C]
        ldr     r5, [r11, #-0x1C]
        ldr     r4, [r11, #-0x1C]
        ldr     r1, [r11, #-0x1C]
        ldr     r0, [r11, #-0x1C]
        ldr     r2, [r11, #-0x1C]
        ldr     r3, [r11]
        cmp     r3, #0
        bne     LAJA0
        ldr     r3, [r11, #-0x1C]
        ldr     r2, [r11, #-0x20]
        ldr     r1, [r11, #-0x24]
        ldr     r0, [r11, #-0x28]
        bl      _ippsWTHaarInv_64s
        ldmdb   r11, {r4 - r6, r11, sp, pc}
LAJA0:
        ldr     r3, [r11, #-0x28]
        cmp     r3, #0
        bne     LAJA1
        mvn     r0, #7
        ldmdb   r11, {r4 - r6, r11, sp, pc}
LAJA1:
        ldr     r3, [r11, #-0x24]
        cmp     r3, #0
        bne     LAJA2
        mvn     r0, #7
        ldmdb   r11, {r4 - r6, r11, sp, pc}
LAJA2:
        ldr     r3, [r11, #-0x20]
        cmp     r3, #0
        bne     LAJA3
        mvn     r0, #7
        ldmdb   r11, {r4 - r6, r11, sp, pc}
LAJA3:
        ldr     r3, [r11, #-0x1C]
        cmp     r3, #0
        bgt     LAJA4
        mvn     r0, #5
        ldmdb   r11, {r4 - r6, r11, sp, pc}
LAJA4:
        mov     r3, #0
        str     r3, [r11, #-0x3C]
        str     r3, [r11, #-0x38]
        ldr     r3, [r11]
        cmp     r3, #2, 2
        mvneq   r3, #2, 2
        streq   r3, [r11]
        ldr     r3, [r11]
        cmp     r3, #1
        bne     LAJA9
        ldr     r0, [r11, #-0x38]
        ldr     r1, [r11, #-0x1C]
        sub     r1, r1, #1
        cmp     r0, r1
        bge     LAJA8
LAJA5:
        ldr     r1, [r11, #-0x28]
        ldr     r3, [r11, #-0x3C]
        mov     r0, r3, lsl #3
        add     r0, r1, r0
        ldr     r1, [r1, +r3, lsl #3]
        ldr     r0, [r0, #4]
        str     r1, [r11, #-0xB4]
        str     r0, [r11, #-0xB0]
        ldr     r1, [r11, #-0x24]
        ldr     r3, [r11, #-0x3C]
        mov     r0, r3, lsl #3
        add     r0, r1, r0
        ldr     r1, [r1, +r3, lsl #3]
        ldr     r0, [r0, #4]
        str     r1, [r11, #-0xAC]
        str     r0, [r11, #-0xA8]
        ldr     r1, [r11, #-0xB4]
        ldr     r0, [r11, #-0xB0]
        mov     r1, r1, lsr #1
        mov     r3, r0, lsl #31
        orr     r1, r1, r3
        mov     r0, r0, asr #1
        ldr     lr, [r11, #-0xAC]
        ldr     r3, [r11, #-0xA8]
        mov     lr, lr, lsr #1
        mov     r4, r3, lsl #31
        orr     lr, lr, r4
        mov     r3, r3, asr #1
        rsbs    lr, lr, #0
        rsc     r3, r3, #0
        adds    lr, r1, lr
        adc     r3, r0, r3
        str     lr, [r11, #-0xA4]
        str     r3, [r11, #-0xA0]
        mvn     lr, #0
        mvn     r1, #2, 2
        ldr     r3, [r11, #-0xA4]
        ldr     r0, [r11, #-0xA0]
        cmp     r0, r1
        cmpeq   r3, lr
        beq     LAJA6
        ldr     r1, [r11, #-0xB4]
        ldr     r0, [r11, #-0xB0]
        mov     r1, r1, lsr #1
        mov     r3, r0, lsl #31
        orr     r1, r1, r3
        mov     r0, r0, asr #1
        ldr     lr, [r11, #-0xAC]
        ldr     r3, [r11, #-0xA8]
        mov     lr, lr, lsr #1
        mov     r4, r3, lsl #31
        orr     lr, lr, r4
        mov     r3, r3, asr #1
        adds    lr, r1, lr
        adc     r3, r0, r3
        str     lr, [r11, #-0x9C]
        str     r3, [r11, #-0x98]
        ldr     r0, [r11, #-0xB4]
        and     r1, r0, #3
        mov     r0, #0
        str     r1, [r11, #-0xB4]
        str     r0, [r11, #-0xB0]
        ldr     r0, [r11, #-0xAC]
        and     r1, r0, #3
        mov     r0, #0
        str     r1, [r11, #-0xAC]
        str     r0, [r11, #-0xA8]
        ldr     r1, [r11, #-0xA4]
        ldr     r0, [r11, #-0xA0]
        ldr     r3, [r11, #-0xAC]
        mov     r3, r3, lsl #4
        ldr     lr, [pc, #0xFBC]
        add     r3, lr, r3
        ldr     lr, [r11, #-0xB4]
        ldr     lr, [r3, +lr, lsl #2]
        mov     r3, lr, asr #31
        adds    r1, r1, lr
        adc     r3, r0, r3
        str     r1, [r11, #-0xA4]
        str     r3, [r11, #-0xA0]
        ldr     r1, [r11, #-0x9C]
        ldr     r0, [r11, #-0x98]
        ldr     r3, [r11, #-0xAC]
        mov     r3, r3, lsl #4
        ldr     lr, [pc, #0xF8C]
        add     r3, lr, r3
        ldr     lr, [r11, #-0xB4]
        ldr     lr, [r3, +lr, lsl #2]
        mov     r3, lr, asr #31
        adds    r1, r1, lr
        adc     r3, r0, r3
        str     r1, [r11, #-0x9C]
        str     r3, [r11, #-0x98]
        b       LAJA7
LAJA6:
        mov     r0, #0
        str     r0, [r11, #-0x9C]
        str     r0, [r11, #-0x98]
        mvn     r1, #0
        mvn     r0, #2, 2
        str     r1, [r11, #-0xA4]
        str     r0, [r11, #-0xA0]
LAJA7:
        ldr     r0, [r11, #-0xA4]
        ldr     lr, [r11, #-0xA0]
        ldr     r1, [r11, #-0x20]
        ldr     r3, [r11, #-0x38]
        mov     r4, r3, lsl #3
        add     r4, r1, r4
        str     r0, [r1, +r3, lsl #3]
        str     lr, [r4, #4]
        ldr     r0, [r11, #-0x9C]
        ldr     r3, [r11, #-0x98]
        ldr     r1, [r11, #-0x20]
        ldr     lr, [r11, #-0x38]
        mov     lr, lr, lsl #3
        add     lr, lr, #8
        add     r4, r1, lr
        str     r0, [r1, +lr]
        str     r3, [r4, #4]
        ldr     r0, [r11, #-0x38]
        add     r0, r0, #2
        str     r0, [r11, #-0x38]
        ldr     r0, [r11, #-0x3C]
        add     r0, r0, #1
        str     r0, [r11, #-0x3C]
        ldr     r0, [r11, #-0x38]
        sub     r1, r2, #1
        cmp     r0, r1
        blt     LAJA5
LAJA8:
        ldr     r0, [r11, #-0x1C]
        tst     r0, #1
        beq     LAJA44
        ldr     r1, [r11, #-0x28]
        ldr     r2, [r11, #-0x3C]
        mov     r0, r2, lsl #3
        add     r0, r1, r0
        ldr     r1, [r1, +r2, lsl #3]
        ldr     r0, [r0, #4]
        str     r1, [r11, #-0xB4]
        str     r0, [r11, #-0xB0]
        ldr     r1, [r11, #-0xB4]
        ldr     r0, [r11, #-0xB0]
        mov     r1, r1, lsr #1
        mov     r2, r0, lsl #31
        orr     r1, r1, r2
        mov     r0, r0, asr #1
        str     r1, [r11, #-0xA4]
        str     r0, [r11, #-0xA0]
        ldr     r1, [r11, #-0xA4]
        ldr     r0, [r11, #-0xA0]
        ldr     r2, [r11, #-0xB4]
        ldr     r3, [r11, #-0xA4]
        and     r3, r2, r3
        and     r3, r3, #1
        mov     r2, r3, asr #31
        adds    r1, r1, r3
        adc     r2, r0, r2
        str     r1, [r11, #-0xA4]
        str     r2, [r11, #-0xA0]
        ldr     r0, [r11, #-0xA4]
        ldr     r3, [r11, #-0xA0]
        ldr     r1, [r11, #-0x20]
        ldr     r2, [r11, #-0x38]
        mov     lr, r2, lsl #3
        add     lr, r1, lr
        str     r0, [r1, +r2, lsl #3]
        str     r3, [lr, #4]
        b       LAJA44
LAJA9:
        ldr     r2, [r11]
        cmp     r2, #0x40
        ble     LAJA11
        ldr     r0, [r11, #-0x38]
        ldr     r1, [r11, #-0x1C]
        cmp     r0, r1
        bge     LAJA44
LAJA10:
        mov     r2, #0
        ldr     r0, [r11, #-0x20]
        ldr     r1, [r11, #-0x38]
        mov     r3, r1, lsl #3
        add     r3, r0, r3
        str     r2, [r0, +r1, lsl #3]
        str     r2, [r3, #4]
        ldr     r0, [r11, #-0x38]
        add     r0, r0, #1
        str     r0, [r11, #-0x38]
        ldr     r0, [r11, #-0x38]
        ldr     r1, [r11, #-0x1C]
        cmp     r0, r1
        blt     LAJA10
        b       LAJA44
LAJA11:
        ldr     r2, [r11]
        cmn     r2, #0x40
        bgt     LAJA17
        ldr     r1, [r11, #-0x38]
        ldr     r2, [r11, #-0x1C]
        sub     r2, r2, #1
        cmp     r1, r2
        bge     LAJA15
LAJA12:
        ldr     r2, [r11, #-0x28]
        ldr     r3, [r11, #-0x3C]
        mov     r1, r3, lsl #3
        add     r1, r2, r1
        ldr     r2, [r2, +r3, lsl #3]
        ldr     r1, [r1, #4]
        str     r2, [r11, #-0xB4]
        str     r1, [r11, #-0xB0]
        ldr     r2, [r11, #-0x24]
        ldr     r3, [r11, #-0x3C]
        mov     r1, r3, lsl #3
        add     r1, r2, r1
        ldr     r2, [r2, +r3, lsl #3]
        ldr     r1, [r1, #4]
        str     r2, [r11, #-0xAC]
        str     r1, [r11, #-0xA8]
        ldr     lr, [r11, #-0xB4]
        ldr     r2, [r11, #-0xB0]
        ldr     r3, [r11, #-0xAC]
        ldr     r1, [r11, #-0xA8]
        subs    r3, lr, r3
        sbcs    r2, r2, r1
        movlt   r3, #0
        movlt   r2, #0
        orrs    r2, r3, r2
        mvnne   r1, #0
        mvnne   lr, #2, 2
        bne     LAJA13
        ldr     r1, [r11, #-0xB4]
        ldr     lr, [r11, #-0xB0]
        ldr     r2, [r11, #-0xAC]
        ldr     r3, [r11, #-0xA8]
        cmp     r1, r2
        sbcs    lr, lr, r3
        movge   r1, #0
        movge   lr, #0
        movlt   r1, #0
        movlt   lr, #2, 2
LAJA13:
        ldr     r2, [r11, #-0x20]
        ldr     r3, [r11, #-0x38]
        mov     r4, r3, lsl #3
        add     r4, r2, r4
        str     r1, [r2, +r3, lsl #3]
        str     lr, [r4, #4]
        ldr     r2, [r11, #-0xB4]
        ldr     r1, [r11, #-0xB0]
        ldr     lr, [r11, #-0xAC]
        ldr     r3, [r11, #-0xA8]
        rsbs    lr, lr, #0
        rsc     r3, r3, #0
        mvn     r4, #0
        adds    lr, lr, r4
        mvn     r4, #0
        adc     r3, r3, r4
        subs    r2, r2, lr
        sbcs    r1, r1, r3
        movlt   r2, #0
        movlt   r1, #0
        orrs    r1, r2, r1
        moveq   r1, #0
        moveq   r3, #2, 2
        beq     LAJA14
        ldr     r3, [r11, #-0xB4]
        ldr     r1, [r11, #-0xB0]
        ldr     lr, [r11, #-0xAC]
        ldr     r2, [r11, #-0xA8]
        cmp     r1, r2
        cmpeq   r3, lr
        mvnne   r1, #0
        mvnne   r3, #2, 2
        moveq   r1, #0
        moveq   r3, #0
LAJA14:
        ldr     r2, [r11, #-0x20]
        ldr     lr, [r11, #-0x38]
        mov     lr, lr, lsl #3
        add     lr, lr, #8
        add     r4, r2, lr
        str     r1, [r2, +lr]
        str     r3, [r4, #4]
        ldr     r1, [r11, #-0x38]
        add     r1, r1, #2
        str     r1, [r11, #-0x38]
        ldr     r1, [r11, #-0x3C]
        add     r1, r1, #1
        str     r1, [r11, #-0x3C]
        ldr     r1, [r11, #-0x38]
        sub     r2, r0, #1
        cmp     r1, r2
        blt     LAJA12
LAJA15:
        ldr     r0, [r11, #-0x1C]
        tst     r0, #1
        beq     LAJA44
        ldr     r1, [r11, #-0x28]
        ldr     r2, [r11, #-0x3C]
        mov     r0, r2, lsl #3
        add     r0, r1, r0
        ldr     r1, [r1, +r2, lsl #3]
        ldr     r0, [r0, #4]
        str     r1, [r11, #-0xA4]
        str     r0, [r11, #-0xA0]
        ldr     r0, [r11, #-0xA4]
        ldr     r1, [r11, #-0xA0]
        orrs    r1, r0, r1, lsl #1
        tstcs   r1, #0
        mvnne   r0, #0
        mvnne   r3, #2, 2
        bne     LAJA16
        ldr     r0, [r11, #-0xA0]
        tst     r0, r0
        movpl   r0, #0
        movpl   r3, #0
        movmi   r0, #0
        movmi   r3, #2, 2
LAJA16:
        ldr     r1, [r11, #-0x20]
        ldr     r2, [r11, #-0x38]
        mov     lr, r2, lsl #3
        add     lr, r1, lr
        str     r0, [r1, +r2, lsl #3]
        str     r3, [lr, #4]
        b       LAJA44
LAJA17:
        ldr     r0, [r11]
        cmp     r0, #0x40
        bne     LAJA28
        ldr     r0, [r11, #-0x38]
        ldr     r2, [r11, #-0x1C]
        sub     r2, r2, #1
        cmp     r0, r2
        bge     LAJA27
LAJA18:
        ldr     r2, [r11, #-0x28]
        ldr     r3, [r11, #-0x3C]
        mov     r0, r3, lsl #3
        add     r0, r2, r0
        ldr     r2, [r2, +r3, lsl #3]
        ldr     r0, [r0, #4]
        str     r2, [r11, #-0xB4]
        str     r0, [r11, #-0xB0]
        ldr     r2, [r11, #-0x24]
        ldr     r3, [r11, #-0x3C]
        mov     r0, r3, lsl #3
        add     r0, r2, r0
        ldr     r2, [r2, +r3, lsl #3]
        ldr     r0, [r0, #4]
        str     r2, [r11, #-0xAC]
        str     r0, [r11, #-0xA8]
        ldr     r2, [r11, #-0xB4]
        ldr     r0, [r11, #-0xB0]
        ldr     r3, [r11, #-0xAC]
        ldr     lr, [r11, #-0xA8]
        rsbs    r3, r3, #0
        rsc     lr, lr, #0
        adds    r3, r2, r3
        adc     lr, r0, lr
        str     r3, [r11, #-0xA4]
        str     lr, [r11, #-0xA0]
        ldr     r0, [r11, #-0xB4]
        ldr     r2, [r11, #-0xB0]
        ldr     lr, [r11, #-0xAC]
        ldr     r3, [r11, #-0xA8]
        adds    r0, r0, lr
        adc     r3, r2, r3
        str     r0, [r11, #-0x9C]
        str     r3, [r11, #-0x98]
        ldr     lr, [r11, #-0xB4]
        ldr     r2, [r11, #-0xB0]
        ldr     r3, [r11, #-0xAC]
        ldr     r0, [r11, #-0xA8]
        subs    r3, lr, r3
        sbcs    r2, r2, r0
        movlt   r3, #0
        movlt   r2, #0
        orrs    r2, r3, r2
        beq     LAJA20
        ldr     r0, [r11, #-0xA0]
        tst     r0, r0
        bpl     LAJA19
        mov     r2, #1
        mov     r0, #0
        str     r2, [r11, #-0xA4]
        str     r0, [r11, #-0xA0]
        b       LAJA22
LAJA19:
        mov     r0, #0
        str     r0, [r11, #-0xA4]
        str     r0, [r11, #-0xA0]
        b       LAJA22
LAJA20:
        ldr     r0, [r11, #-0xA4]
        ldr     r2, [r11, #-0xA0]
        orrs    r2, r0, r2, lsl #1
        tstcs   r2, #0
        beq     LAJA21
        mvn     r0, #0
        str     r0, [r11, #-0xA4]
        str     r0, [r11, #-0xA0]
        b       LAJA22
LAJA21:
        mov     r0, #0
        str     r0, [r11, #-0xA4]
        str     r0, [r11, #-0xA0]
LAJA22:
        ldr     r2, [r11, #-0xB4]
        ldr     r0, [r11, #-0xB0]
        ldr     lr, [r11, #-0xAC]
        ldr     r3, [r11, #-0xA8]
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
        bne     LAJA24
        ldr     r0, [r11, #-0x98]
        tst     r0, r0
        bmi     LAJA23
        mvn     r0, #0
        str     r0, [r11, #-0x9C]
        str     r0, [r11, #-0x98]
        b       LAJA26
LAJA23:
        mov     r0, #0
        str     r0, [r11, #-0x9C]
        str     r0, [r11, #-0x98]
        b       LAJA26
LAJA24:
        ldr     r0, [r11, #-0x98]
        tst     r0, r0
        bpl     LAJA25
        mov     r2, #1
        mov     r0, #0
        str     r2, [r11, #-0x9C]
        str     r0, [r11, #-0x98]
        b       LAJA26
LAJA25:
        mov     r0, #0
        str     r0, [r11, #-0x9C]
        str     r0, [r11, #-0x98]
LAJA26:
        ldr     r0, [r11, #-0xA4]
        ldr     lr, [r11, #-0xA0]
        ldr     r2, [r11, #-0x20]
        ldr     r3, [r11, #-0x38]
        mov     r4, r3, lsl #3
        add     r4, r2, r4
        str     r0, [r2, +r3, lsl #3]
        str     lr, [r4, #4]
        ldr     r0, [r11, #-0x9C]
        ldr     r3, [r11, #-0x98]
        ldr     r2, [r11, #-0x20]
        ldr     lr, [r11, #-0x38]
        mov     lr, lr, lsl #3
        add     lr, lr, #8
        add     r4, r2, lr
        str     r0, [r2, +lr]
        str     r3, [r4, #4]
        ldr     r0, [r11, #-0x38]
        add     r0, r0, #2
        str     r0, [r11, #-0x38]
        ldr     r0, [r11, #-0x3C]
        add     r0, r0, #1
        str     r0, [r11, #-0x3C]
        ldr     r0, [r11, #-0x38]
        sub     r2, r1, #1
        cmp     r0, r2
        blt     LAJA18
LAJA27:
        ldr     r0, [r11, #-0x1C]
        tst     r0, #1
        beq     LAJA44
        mov     r2, #0
        ldr     r0, [r11, #-0x20]
        ldr     r1, [r11, #-0x38]
        mov     r3, r1, lsl #3
        add     r3, r0, r3
        str     r2, [r0, +r1, lsl #3]
        str     r2, [r3, #4]
        b       LAJA44
LAJA28:
        ldr     r0, [r11]
        cmp     r0, #0x3D
        blt     LAJA31
        mov     r0, #3
        str     r0, [r11, #-0x30]
        ldr     r1, [r11, #-0x30]
        mov     r0, #1
        mov     r1, r0, lsl r1
        sub     r2, r1, #1
        mov     r1, r2, asr #31
        str     r2, [r11, #-0x6C]
        str     r1, [r11, #-0x68]
        ldr     r1, [r11, #-0x30]
        mov     r0, r0, lsl r1
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11]
        ldr     r1, [r11, #-0x30]
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
        str     r0, [r11, #-0x64]
        str     r1, [r11, #-0x60]
        ldr     r0, [r11, #-0x38]
        ldr     r1, [r11, #-0x1C]
        sub     r1, r1, #1
        cmp     r0, r1
        bge     LAJA30
LAJA29:
        ldr     r1, [r11, #-0x28]
        ldr     r2, [r11, #-0x3C]
        mov     r0, r2, lsl #3
        add     r0, r1, r0
        ldr     r1, [r1, +r2, lsl #3]
        ldr     r0, [r0, #4]
        str     r1, [r11, #-0xB4]
        str     r0, [r11, #-0xB0]
        ldr     r1, [r11, #-0x24]
        ldr     r2, [r11, #-0x3C]
        mov     r0, r2, lsl #3
        add     r0, r1, r0
        ldr     r1, [r1, +r2, lsl #3]
        ldr     r0, [r0, #4]
        str     r1, [r11, #-0xAC]
        str     r0, [r11, #-0xA8]
        ldr     r0, [r11, #-0xB4]
        ldr     r1, [r11, #-0xB0]
        ldr     r2, [r11, #-0x30]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        mov     r5, r0
        mov     r6, r1
        ldr     r0, [r11, #-0xAC]
        ldr     r1, [r11, #-0xA8]
        ldr     r2, [r11, #-0x30]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
        adds    r0, r5, r0
        adc     r1, r6, r1
        str     r0, [r11, #-0xA4]
        str     r1, [r11, #-0xA0]
        ldr     r0, [r11, #-0xB4]
        ldr     r1, [r11, #-0xB0]
        ldr     r2, [r11, #-0x30]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        mov     r5, r0
        mov     r6, r1
        ldr     r0, [r11, #-0xAC]
        ldr     r1, [r11, #-0xA8]
        ldr     r2, [r11, #-0x30]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        adds    r0, r5, r0
        adc     r1, r6, r1
        str     r0, [r11, #-0x9C]
        str     r1, [r11, #-0x98]
        ldr     r5, [r11, #-0xB4]
        ldr     r6, [r11, #-0xB0]
        ldr     r0, [r11, #-0xB4]
        ldr     r1, [r11, #-0xB0]
        ldr     r2, [r11, #-0x30]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        ldr     r2, [r11, #-0x30]
        mov     r3, r2, asr #31
        bl      __ashldi3
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
        adds    r0, r5, r0
        adc     r1, r6, r1
        str     r0, [r11, #-0x5C]
        str     r1, [r11, #-0x58]
        ldr     r5, [r11, #-0xAC]
        ldr     r6, [r11, #-0xA8]
        ldr     r0, [r11, #-0xAC]
        ldr     r1, [r11, #-0xA8]
        ldr     r2, [r11, #-0x30]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        ldr     r2, [r11, #-0x30]
        mov     r3, r2, asr #31
        bl      __ashldi3
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
        adds    r0, r5, r0
        adc     r1, r6, r1
        str     r0, [r11, #-0x54]
        str     r1, [r11, #-0x50]
        ldr     r1, [r11, #-0x5C]
        ldr     r0, [r11, #-0x58]
        ldr     r2, [r11, #-0x54]
        ldr     r3, [r11, #-0x50]
        rsbs    r2, r2, #0
        rsc     r3, r3, #0
        adds    r1, r1, r2
        adc     r3, r0, r3
        ldr     r2, [r11, #-0x6C]
        ldr     r0, [r11, #-0x68]
        adds    r1, r1, r2
        adc     r3, r3, r0
        ldr     r0, [r11, #-0x2C]
        mov     r2, r0, asr #31
        and     r0, r1, r0
        and     r1, r3, r2
        ldr     r2, [r11, #-0x30]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        str     r0, [r11, #-0x4C]
        str     r1, [r11, #-0x48]
        ldr     r0, [r11, #-0x5C]
        ldr     r1, [r11, #-0x58]
        ldr     r3, [r11, #-0x54]
        ldr     r2, [r11, #-0x50]
        adds    r0, r0, r3
        adc     r1, r1, r2
        ldr     r3, [r11, #-0x6C]
        ldr     r2, [r11, #-0x68]
        adds    r0, r0, r3
        adc     r1, r1, r2
        ldr     r3, [r11, #-0x2C]
        mov     r2, r3, asr #31
        and     r0, r0, r3
        and     r1, r1, r2
        ldr     r2, [r11, #-0x30]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        str     r0, [r11, #-0x44]
        str     r1, [r11, #-0x40]
        ldr     r0, [r11, #-0xA4]
        ldr     r1, [r11, #-0xA0]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r11, #-0x48]
        adds    r0, r0, r3
        adc     r1, r1, r2
        ldr     r3, [r11, #-0x64]
        ldr     r2, [r11, #-0x60]
        adds    r5, r0, r3
        adc     r6, r1, r2
        ldr     r0, [r11, #-0xA4]
        ldr     r1, [r11, #-0xA0]
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
        str     r0, [r11, #-0xA4]
        str     r1, [r11, #-0xA0]
        ldr     r0, [r11, #-0x9C]
        ldr     r1, [r11, #-0x98]
        ldr     r3, [r11, #-0x44]
        ldr     r2, [r11, #-0x40]
        adds    r0, r0, r3
        adc     r1, r1, r2
        ldr     r3, [r11, #-0x64]
        ldr     r2, [r11, #-0x60]
        adds    r5, r0, r3
        adc     r6, r1, r2
        ldr     r0, [r11, #-0x9C]
        ldr     r1, [r11, #-0x98]
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
        str     r0, [r11, #-0x9C]
        str     r1, [r11, #-0x98]
        ldr     r0, [r11, #-0xA4]
        ldr     r3, [r11, #-0xA0]
        ldr     r1, [r11, #-0x20]
        ldr     r2, [r11, #-0x38]
        mov     lr, r2, lsl #3
        add     lr, r1, lr
        str     r0, [r1, +r2, lsl #3]
        str     r3, [lr, #4]
        ldr     r0, [r11, #-0x9C]
        ldr     r2, [r11, #-0x98]
        ldr     r1, [r11, #-0x20]
        ldr     r3, [r11, #-0x38]
        mov     r3, r3, lsl #3
        add     r3, r3, #8
        add     lr, r1, r3
        str     r0, [r1, +r3]
        str     r2, [lr, #4]
        ldr     r0, [r11, #-0x38]
        add     r0, r0, #2
        str     r0, [r11, #-0x38]
        ldr     r0, [r11, #-0x3C]
        add     r0, r0, #1
        str     r0, [r11, #-0x3C]
        ldr     r0, [r11, #-0x38]
        sub     r1, r4, #1
        cmp     r0, r1
        blt     LAJA29
LAJA30:
        ldr     r0, [r11, #-0x1C]
        tst     r0, #1
        beq     LAJA44
        ldr     r1, [r11, #-0x28]
        ldr     r2, [r11, #-0x3C]
        mov     r0, r2, lsl #3
        add     r0, r1, r0
        ldr     r1, [r1, +r2, lsl #3]
        ldr     r0, [r0, #4]
        str     r1, [r11, #-0xB4]
        str     r0, [r11, #-0xB0]
        ldr     r0, [r11, #-0xB4]
        ldr     r1, [r11, #-0xB0]
        ldr     r2, [r11, #-0x30]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        str     r0, [r11, #-0xA4]
        str     r1, [r11, #-0xA0]
        ldr     r4, [r11, #-0xB4]
        ldr     r5, [r11, #-0xB0]
        ldr     r0, [r11, #-0xB4]
        ldr     r1, [r11, #-0xB0]
        ldr     r2, [r11, #-0x30]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        ldr     r2, [r11, #-0x30]
        mov     r3, r2, asr #31
        bl      __ashldi3
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
        adds    r0, r4, r0
        adc     r1, r5, r1
        str     r0, [r11, #-0x5C]
        str     r1, [r11, #-0x58]
        ldr     r0, [r11, #-0x5C]
        ldr     r1, [r11, #-0x58]
        ldr     r3, [r11, #-0x6C]
        ldr     r2, [r11, #-0x68]
        adds    r0, r0, r3
        adc     r1, r1, r2
        ldr     r3, [r11, #-0x2C]
        mov     r2, r3, asr #31
        and     r0, r0, r3
        and     r1, r1, r2
        ldr     r2, [r11, #-0x30]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        str     r0, [r11, #-0x4C]
        str     r1, [r11, #-0x48]
        ldr     r0, [r11, #-0xA4]
        ldr     r1, [r11, #-0xA0]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r11, #-0x48]
        adds    r0, r0, r3
        adc     r1, r1, r2
        ldr     r3, [r11, #-0x64]
        ldr     r2, [r11, #-0x60]
        adds    r5, r0, r3
        adc     r4, r1, r2
        ldr     r0, [r11, #-0xA4]
        ldr     r1, [r11, #-0xA0]
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
        mov     r1, r0, asr #31
        str     r0, [r11, #-0xA4]
        str     r1, [r11, #-0xA0]
        ldr     r0, [r11, #-0xA4]
        ldr     r3, [r11, #-0xA0]
        ldr     r1, [r11, #-0x20]
        ldr     r2, [r11, #-0x38]
        mov     lr, r2, lsl #3
        add     lr, r1, lr
        str     r0, [r1, +r2, lsl #3]
        str     r3, [lr, #4]
        b       LAJA44
LAJA31:
        ldr     r0, [r11]
        cmp     r0, #1
        ble     LAJA34
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
        str     r0, [r11, #-0x94]
        str     r1, [r11, #-0x90]
        ldr     r0, [r11]
        add     r0, r0, #1
        str     r0, [r11, #-0x34]
        ldr     r0, [r11, #-0x38]
        ldr     r1, [r11, #-0x1C]
        sub     r1, r1, #1
        cmp     r0, r1
        bge     LAJA33
LAJA32:
        ldr     r1, [r11, #-0x28]
        ldr     r2, [r11, #-0x3C]
        mov     r0, r2, lsl #3
        add     r0, r1, r0
        ldr     r1, [r1, +r2, lsl #3]
        ldr     r0, [r0, #4]
        str     r1, [r11, #-0xB4]
        str     r0, [r11, #-0xB0]
        ldr     r1, [r11, #-0x24]
        ldr     r2, [r11, #-0x3C]
        mov     r0, r2, lsl #3
        add     r0, r1, r0
        ldr     r1, [r1, +r2, lsl #3]
        ldr     r0, [r0, #4]
        str     r1, [r11, #-0xAC]
        str     r0, [r11, #-0xA8]
        ldr     r0, [r11, #-0xB4]
        ldr     r1, [r11, #-0xB0]
        ldr     r2, [r11, #-0x34]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        mov     r4, r0
        mov     r6, r1
        ldr     r0, [r11, #-0xAC]
        ldr     r1, [r11, #-0xA8]
        ldr     r2, [r11, #-0x34]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
        adds    r0, r4, r0
        adc     r1, r6, r1
        str     r0, [r11, #-0xA4]
        str     r1, [r11, #-0xA0]
        ldr     r0, [r11, #-0xB4]
        ldr     r1, [r11, #-0xB0]
        ldr     r2, [r11, #-0x34]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        mov     r4, r0
        mov     r6, r1
        ldr     r0, [r11, #-0xAC]
        ldr     r1, [r11, #-0xA8]
        ldr     r2, [r11, #-0x34]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        adds    r0, r4, r0
        adc     r1, r6, r1
        str     r0, [r11, #-0x9C]
        str     r1, [r11, #-0x98]
        ldr     r4, [r11, #-0xB4]
        ldr     r6, [r11, #-0xB0]
        ldr     r0, [r11, #-0xB4]
        ldr     r1, [r11, #-0xB0]
        ldr     r2, [r11, #-0x34]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        ldr     r2, [r11, #-0x34]
        mov     r3, r2, asr #31
        bl      __ashldi3
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
        adds    r0, r4, r0
        adc     r1, r6, r1
        str     r0, [r11, #-0x8C]
        str     r1, [r11, #-0x88]
        ldr     r4, [r11, #-0xAC]
        ldr     r6, [r11, #-0xA8]
        ldr     r0, [r11, #-0xAC]
        ldr     r1, [r11, #-0xA8]
        ldr     r2, [r11, #-0x34]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        ldr     r2, [r11, #-0x34]
        mov     r3, r2, asr #31
        bl      __ashldi3
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
        adds    r0, r4, r0
        adc     r1, r6, r1
        str     r0, [r11, #-0x84]
        str     r1, [r11, #-0x80]
        ldr     r1, [r11, #-0x8C]
        ldr     r0, [r11, #-0x88]
        ldr     r2, [r11, #-0x84]
        ldr     r3, [r11, #-0x80]
        rsbs    r2, r2, #0
        rsc     r3, r3, #0
        adds    r2, r1, r2
        adc     r3, r0, r3
        str     r2, [r11, #-0x7C]
        str     r3, [r11, #-0x78]
        ldr     r0, [r11, #-0x8C]
        ldr     r1, [r11, #-0x88]
        ldr     r3, [r11, #-0x84]
        ldr     r2, [r11, #-0x80]
        adds    r0, r0, r3
        adc     r2, r1, r2
        str     r0, [r11, #-0x74]
        str     r2, [r11, #-0x70]
        ldr     r2, [r11, #-0x7C]
        ldr     r0, [r11, #-0x78]
        ldr     r3, [r11, #-0x94]
        ldr     r1, [r11, #-0x90]
        adds    r4, r2, r3
        adc     r6, r0, r1
        ldr     r0, [r11, #-0x7C]
        ldr     r1, [r11, #-0x78]
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
        str     r0, [r11, #-0x7C]
        str     r1, [r11, #-0x78]
        ldr     r2, [r11, #-0x74]
        ldr     r0, [r11, #-0x70]
        ldr     r3, [r11, #-0x94]
        ldr     r1, [r11, #-0x90]
        adds    r4, r2, r3
        adc     r6, r0, r1
        ldr     r0, [r11, #-0x74]
        ldr     r1, [r11, #-0x70]
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
        str     r0, [r11, #-0x74]
        str     r1, [r11, #-0x70]
        ldr     r1, [r11, #-0x7C]
        ldr     r0, [r11, #-0x78]
        ldr     r3, [r11, #-0xA4]
        ldr     r2, [r11, #-0xA0]
        mov     r2, r2, lsl #1
        mov     lr, r3, lsr #31
        mov     r3, r3, lsl #1
        orr     lr, r2, lr
        adds    r3, r1, r3
        adc     lr, r0, lr
        str     r3, [r11, #-0xA4]
        str     lr, [r11, #-0xA0]
        ldr     r1, [r11, #-0x74]
        ldr     r0, [r11, #-0x70]
        ldr     r3, [r11, #-0x9C]
        ldr     r2, [r11, #-0x98]
        mov     r2, r2, lsl #1
        mov     lr, r3, lsr #31
        mov     r3, r3, lsl #1
        orr     lr, r2, lr
        adds    r3, r1, r3
        adc     lr, r0, lr
        str     r3, [r11, #-0x9C]
        str     lr, [r11, #-0x98]
        ldr     r0, [r11, #-0xA4]
        ldr     r3, [r11, #-0xA0]
        ldr     r1, [r11, #-0x20]
        ldr     r2, [r11, #-0x38]
        mov     lr, r2, lsl #3
        add     lr, r1, lr
        str     r0, [r1, +r2, lsl #3]
        str     r3, [lr, #4]
        ldr     r0, [r11, #-0x9C]
        ldr     r2, [r11, #-0x98]
        ldr     r1, [r11, #-0x20]
        ldr     r3, [r11, #-0x38]
        mov     r3, r3, lsl #3
        add     r3, r3, #8
        add     lr, r1, r3
        str     r0, [r1, +r3]
        str     r2, [lr, #4]
        ldr     r0, [r11, #-0x38]
        add     r0, r0, #2
        str     r0, [r11, #-0x38]
        ldr     r0, [r11, #-0x3C]
        add     r0, r0, #1
        str     r0, [r11, #-0x3C]
        ldr     r0, [r11, #-0x38]
        sub     r1, r5, #1
        cmp     r0, r1
        blt     LAJA32
LAJA33:
        ldr     r0, [r11, #-0x1C]
        tst     r0, #1
        beq     LAJA44
        ldr     r1, [r11, #-0x28]
        ldr     r2, [r11, #-0x3C]
        mov     r0, r2, lsl #3
        add     r0, r1, r0
        ldr     r1, [r1, +r2, lsl #3]
        ldr     r0, [r0, #4]
        str     r1, [r11, #-0xB4]
        str     r0, [r11, #-0xB0]
        ldr     r0, [r11, #-0xB4]
        ldr     r1, [r11, #-0xB0]
        ldr     r2, [r11, #-0x34]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        str     r0, [r11, #-0x9C]
        str     r1, [r11, #-0x98]
        ldr     r4, [r11, #-0xB4]
        ldr     r5, [r11, #-0xB0]
        ldr     r0, [r11, #-0xB4]
        ldr     r1, [r11, #-0xB0]
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
        str     r0, [r11, #-0x8C]
        str     r1, [r11, #-0x88]
        ldr     r1, [r11, #-0x8C]
        ldr     r0, [r11, #-0x88]
        str     r1, [r11, #-0x74]
        str     r0, [r11, #-0x70]
        ldr     r2, [r11, #-0x74]
        ldr     r0, [r11, #-0x70]
        ldr     r3, [r11, #-0x94]
        ldr     r1, [r11, #-0x90]
        adds    r5, r2, r3
        adc     r4, r0, r1
        ldr     r0, [r11, #-0x74]
        ldr     r1, [r11, #-0x70]
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
        str     r0, [r11, #-0x74]
        str     r1, [r11, #-0x70]
        ldr     r1, [r11, #-0x74]
        ldr     r0, [r11, #-0x70]
        ldr     r3, [r11, #-0x9C]
        ldr     r2, [r11, #-0x98]
        mov     r2, r2, lsl #1
        mov     lr, r3, lsr #31
        mov     r3, r3, lsl #1
        orr     lr, r2, lr
        adds    r3, r1, r3
        adc     lr, r0, lr
        str     r3, [r11, #-0x9C]
        str     lr, [r11, #-0x98]
        ldr     r0, [r11, #-0x9C]
        ldr     r3, [r11, #-0x98]
        ldr     r1, [r11, #-0x20]
        ldr     r2, [r11, #-0x38]
        mov     lr, r2, lsl #3
        add     lr, r1, lr
        str     r0, [r1, +r2, lsl #3]
        str     r3, [lr, #4]
        b       LAJA44
        .long   LAJA_subCorrect
        .long   LAJA_sumCorrect
LAJA34:
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
        str     r0, [r11, #-0xC4]
        str     r1, [r11, #-0xC0]
        ldr     r1, [r11, #-0xC4]
        ldr     r0, [r11, #-0xC0]
        rsbs    r1, r1, #0
        rsc     r0, r0, #0
        mvn     r2, #0
        adds    r1, r1, r2
        mvn     r2, #0
        adc     r0, r0, r2
        str     r1, [r11, #-0xBC]
        str     r0, [r11, #-0xB8]
        ldr     r0, [r11, #-0x38]
        ldr     r1, [r11, #-0x1C]
        sub     r1, r1, #1
        cmp     r0, r1
        bge     LAJA42
LAJA35:
        ldr     r1, [r11, #-0x28]
        ldr     r2, [r11, #-0x3C]
        mov     r0, r2, lsl #3
        add     r0, r1, r0
        ldr     r1, [r1, +r2, lsl #3]
        ldr     r0, [r0, #4]
        str     r1, [r11, #-0xB4]
        str     r0, [r11, #-0xB0]
        ldr     r1, [r11, #-0x24]
        ldr     r2, [r11, #-0x3C]
        mov     r0, r2, lsl #3
        add     r0, r1, r0
        ldr     r1, [r1, +r2, lsl #3]
        ldr     r0, [r0, #4]
        str     r1, [r11, #-0xAC]
        str     r0, [r11, #-0xA8]
        ldr     r1, [r11, #-0xB4]
        ldr     r0, [r11, #-0xB0]
        ldr     r2, [r11, #-0xAC]
        ldr     r3, [r11, #-0xA8]
        rsbs    r2, r2, #0
        rsc     r3, r3, #0
        adds    r2, r1, r2
        adc     r3, r0, r3
        str     r2, [r11, #-0xA4]
        str     r3, [r11, #-0xA0]
        ldr     r0, [r11, #-0xB4]
        ldr     r1, [r11, #-0xB0]
        ldr     r3, [r11, #-0xAC]
        ldr     r2, [r11, #-0xA8]
        adds    r0, r0, r3
        adc     r2, r1, r2
        str     r0, [r11, #-0x9C]
        str     r2, [r11, #-0x98]
        ldr     r3, [r11, #-0xB4]
        ldr     r1, [r11, #-0xB0]
        ldr     r2, [r11, #-0xAC]
        ldr     r0, [r11, #-0xA8]
        subs    r2, r3, r2
        sbcs    r1, r1, r0
        movlt   r2, #0
        movlt   r1, #0
        orrs    r1, r2, r1
        beq     LAJA36
        ldr     r0, [r11, #-0xA0]
        tst     r0, r0
        bpl     LAJA37
        mvn     r1, #0
        mvn     r0, #2, 2
        str     r1, [r11, #-0xA4]
        str     r0, [r11, #-0xA0]
        b       LAJA37
LAJA36:
        ldr     r0, [r11, #-0xA4]
        ldr     r1, [r11, #-0xA0]
        orrs    r1, r0, r1, lsl #1
        tstcs   r1, #0
        beq     LAJA37
        mov     r1, #0
        mov     r0, #2, 2
        str     r1, [r11, #-0xA4]
        str     r0, [r11, #-0xA0]
LAJA37:
        ldr     r0, [r11, #-0xAC]
        ldr     r1, [r11, #-0xA8]
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
        str     r0, [r11, #-0xAC]
        str     r1, [r11, #-0xA8]
        ldr     r0, [r11, #-0xAC]
        ldr     r1, [r11, #-0xA8]
        mvn     r2, #0
        adds    r0, r0, r2
        mvn     r2, #0
        adc     r1, r1, r2
        str     r0, [r11, #-0xAC]
        str     r1, [r11, #-0xA8]
        ldr     r3, [r11, #-0xB4]
        ldr     r1, [r11, #-0xB0]
        ldr     r2, [r11, #-0xAC]
        ldr     r0, [r11, #-0xA8]
        subs    r2, r3, r2
        sbcs    r1, r1, r0
        movlt   r2, #0
        movlt   r1, #0
        orrs    r1, r2, r1
        bne     LAJA38
        ldr     r0, [r11, #-0x98]
        tst     r0, r0
        bmi     LAJA39
        mov     r1, #0
        mov     r0, #2, 2
        str     r1, [r11, #-0x9C]
        str     r0, [r11, #-0x98]
        b       LAJA39
LAJA38:
        ldr     r0, [r11, #-0x98]
        tst     r0, r0
        bpl     LAJA39
        mvn     r1, #0
        mvn     r0, #2, 2
        str     r1, [r11, #-0x9C]
        str     r0, [r11, #-0x98]
LAJA39:
        ldr     r3, [r11, #-0x9C]
        ldr     r1, [r11, #-0x98]
        ldr     r2, [r11, #-0xC4]
        ldr     r0, [r11, #-0xC0]
        subs    r2, r3, r2
        sbcs    r1, r1, r0
        movlt   r2, #0
        movlt   r1, #0
        orrs    r1, r2, r1
        moveq   r0, #0
        moveq   r1, #2, 2
        beq     LAJA40
        ldr     r0, [r11, #-0x9C]
        ldr     r3, [r11, #-0x98]
        ldr     r1, [r11, #-0xBC]
        ldr     r2, [r11, #-0xB8]
        cmp     r0, r1
        sbcs    r3, r3, r2
        mvnge   r0, #0
        mvnge   r1, #2, 2
        bge     LAJA40
        ldr     r0, [r11, #-0x9C]
        ldr     r1, [r11, #-0x98]
        ldr     r2, [r11]
        mov     r3, r2, asr #31
        bl      __ashldi3
LAJA40:
        str     r0, [r11, #-0x9C]
        str     r1, [r11, #-0x98]
        ldr     r3, [r11, #-0xA4]
        ldr     r1, [r11, #-0xA0]
        ldr     r2, [r11, #-0xC4]
        ldr     r0, [r11, #-0xC0]
        subs    r2, r3, r2
        sbcs    r1, r1, r0
        movlt   r2, #0
        movlt   r1, #0
        orrs    r1, r2, r1
        moveq   r0, #0
        moveq   r1, #2, 2
        beq     LAJA41
        ldr     r0, [r11, #-0xA4]
        ldr     r3, [r11, #-0xA0]
        ldr     r1, [r11, #-0xBC]
        ldr     r2, [r11, #-0xB8]
        cmp     r0, r1
        sbcs    r3, r3, r2
        mvnge   r0, #0
        mvnge   r1, #2, 2
        bge     LAJA41
        ldr     r0, [r11, #-0xA4]
        ldr     r1, [r11, #-0xA0]
        ldr     r2, [r11]
        mov     r3, r2, asr #31
        bl      __ashldi3
LAJA41:
        str     r0, [r11, #-0xA4]
        str     r1, [r11, #-0xA0]
        ldr     r0, [r11, #-0x9C]
        ldr     r2, [r11, #-0x98]
        ldr     r1, [r11, #-0x20]
        ldr     r3, [r11, #-0x38]
        mov     r3, r3, lsl #3
        add     r3, r3, #8
        add     lr, r1, r3
        str     r0, [r1, +r3]
        str     r2, [lr, #4]
        ldr     r0, [r11, #-0xA4]
        ldr     r3, [r11, #-0xA0]
        ldr     r1, [r11, #-0x20]
        ldr     r2, [r11, #-0x38]
        mov     lr, r2, lsl #3
        add     lr, r1, lr
        str     r0, [r1, +r2, lsl #3]
        str     r3, [lr, #4]
        ldr     r0, [r11, #-0x38]
        add     r0, r0, #2
        str     r0, [r11, #-0x38]
        ldr     r0, [r11, #-0x3C]
        add     r0, r0, #1
        str     r0, [r11, #-0x3C]
        ldr     r0, [r11, #-0x38]
        sub     r1, r6, #1
        cmp     r0, r1
        blt     LAJA35
LAJA42:
        ldr     r0, [r11, #-0x1C]
        tst     r0, #1
        beq     LAJA44
        ldr     r1, [r11, #-0x28]
        ldr     r2, [r11, #-0x3C]
        mov     r0, r2, lsl #3
        add     r0, r1, r0
        ldr     r1, [r1, +r2, lsl #3]
        ldr     r0, [r0, #4]
        str     r1, [r11, #-0x9C]
        str     r0, [r11, #-0x98]
        ldr     r3, [r11, #-0x9C]
        ldr     r1, [r11, #-0x98]
        ldr     r2, [r11, #-0xC4]
        ldr     r0, [r11, #-0xC0]
        subs    r2, r3, r2
        sbcs    r1, r1, r0
        movlt   r2, #0
        movlt   r1, #0
        orrs    r1, r2, r1
        moveq   r0, #0
        moveq   r1, #2, 2
        beq     LAJA43
        ldr     r0, [r11, #-0x9C]
        ldr     r3, [r11, #-0x98]
        ldr     r1, [r11, #-0xBC]
        ldr     r2, [r11, #-0xB8]
        cmp     r0, r1
        sbcs    r3, r3, r2
        mvnge   r0, #0
        mvnge   r1, #2, 2
        bge     LAJA43
        ldr     r0, [r11, #-0x9C]
        ldr     r1, [r11, #-0x98]
        ldr     r2, [r11]
        mov     r3, r2, asr #31
        bl      __ashldi3
LAJA43:
        str     r0, [r11, #-0x9C]
        str     r1, [r11, #-0x98]
        ldr     r0, [r11, #-0x9C]
        ldr     r3, [r11, #-0x98]
        ldr     r1, [r11, #-0x20]
        ldr     r2, [r11, #-0x38]
        mov     lr, r2, lsl #3
        add     lr, r1, lr
        str     r0, [r1, +r2, lsl #3]
        str     r3, [lr, #4]
LAJA44:
        mov     r0, #0
        ldmdb   r11, {r4 - r6, r11, sp, pc}


        .data
        .align  4


LAJA_subCorrect:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xFF,0xFF,0xFF,0xFF,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0xFF,0xFF,0xFF,0xFF,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LAJA_sumCorrect:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x01,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x01,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00


