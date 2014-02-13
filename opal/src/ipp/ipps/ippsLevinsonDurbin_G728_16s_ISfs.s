        .text
        .align  4
        .globl  _ippsLevinsonDurbin_G728_16s_ISfs


_ippsLevinsonDurbin_G728_16s_ISfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x60
        ldr     lr, [sp, #0x88]
        ldr     r12, [sp, #0x84]
        mov     r5, r1
        mov     r1, r2
        cmp     r0, #0
        str     lr, [sp, #0x1C]
        mov     r2, r3
        beq     LDEJ40
        cmp     r2, #0
        beq     LDEJ40
        cmp     r12, #0
        beq     LDEJ40
        cmp     r5, #0
        blt     LDEJ39
        cmp     r1, r5
        blt     LDEJ39
        ldr     lr, [sp, #0x1C]
        ldrsh   lr, [lr]
        cmp     lr, #0
        blt     LDEJ37
        cmp     lr, #0xF
        bgt     LDEJ37
        cmp     r5, #0
        beq     LDEJ36
        ldrsh   r4, [r12]
        rsb     lr, lr, #0xF
        add     r7, r5, #1
        bic     lr, lr, #0xFF, 8
        cmp     r7, r1
        bic     lr, lr, #0xFF, 16
        movgt   r5, lr
        bgt     LDEJ31
        mvn     r8, #0
        sub     r11, r2, #2
        add     r10, r8, #1, 16
        mov     r6, #2, 2
        str     r10, [sp, #0x24]
        add     r3, r11, r7, lsl #1
        mov     r5, lr
        mvn     r9, #2, 2
        sub     r6, r6, #2, 18
        add     r10, r0, r7, lsl #1
        str     r3, [sp, #0x28]
        str     r11, [sp, #0x20]
        str     lr, [sp, #0x54]
        str     r12, [sp, #0x18]
        str     r2, [sp, #8]
        str     r1, [sp, #0x14]
        str     r0, [sp, #0x10]
LDEJ0:
        cmp     r7, #1
        movle   r3, #0
        ble     LDEJ3
        ldr     r0, [sp, #0x20]
        ldr     r12, [sp, #0x10]
        mov     r3, #0
        mov     r2, #1
        add     r0, r0, #2
LDEJ1:
        sub     r11, r7, r2
        ldrsh   lr, [r0], #2
        mov     r1, r11, lsl #16
        mov     r11, r3, asr #31
        mov     r1, r1, asr #15
        ldrsh   r1, [r12, +r1]
        mul     r1, lr, r1
        adds    r3, r3, r1
        adc     r11, r11, r1, asr #31
        subs    lr, r3, r9
        sbcs    r1, r11, #0
        movlt   lr, #0
        movlt   r1, #0
        orrs    r1, lr, r1
        mvnne   r3, #2, 2
        bne     LDEJ2
        cmp     r3, #2, 2
        sbcs    r11, r11, r8
        movlt   r3, #2, 2
LDEJ2:
        add     r2, r2, #1
        cmp     r2, r7
        blt     LDEJ1
LDEJ3:
        add     r0, r5, #1
        bic     r0, r0, #0xFF, 8
        bic     r0, r0, #0xFF, 16
        cmp     r3, r9, asr r0
        mvngt   r3, #2, 2
        bgt     LDEJ4
        mov     r2, #2, 2
        cmp     r3, r2, asr r0
        movge   r3, r3, lsl r0
        movlt   r3, #2, 2
LDEJ4:
        ldrsh   r0, [r10], #2
        mov     r2, r0, lsl #16
        adds    r0, r3, r2
        mov     r2, r2, asr #31
        adc     r2, r2, r3, asr #31
        subs    r12, r0, r9
        sbcs    r3, r2, #0
        movlt   r12, #0
        movlt   r3, #0
        orrs    r3, r12, r3
        mvnne   r0, #2, 2
        bne     LDEJ5
        cmp     r0, #2, 2
        sbcs    r2, r2, r8
        movlt   r0, #2, 2
LDEJ5:
        cmp     r6, r0
        mvnle   r0, #0
        addle   r0, r0, #2, 18
        ble     LDEJ6
        add     r0, r0, #2, 18
        mov     r0, r0, asr #16
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
LDEJ6:
        mov     r11, r0
        cmp     r11, #0
        blt     LDEJ38
LDEJ7:
        cmp     r0, r4
        bge     LDEJ35
        mov     r0, r0, lsl #16
        mov     r1, r4
        bl      __intel_idiv
        ldr     r2, [sp, #0x24]
        cmp     r2, r0
        mvnlt   lr, #2, 2
        blt     LDEJ8
        cmn     r0, #1, 16
        movge   lr, r0, lsl #15
        movlt   lr, #2, 2
LDEJ8:
        cmp     r6, lr
        mvnle   r0, #0
        addle   r0, r0, #2, 18
        ble     LDEJ9
        add     r0, lr, #2, 18
        mov     r0, r0, asr #16
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
LDEJ9:
        cmp     r11, #0
        ble     LDEJ10
        rsb     r0, r0, #0
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
LDEJ10:
        mul     r2, r11, r0
        mov     r4, r4, lsl #16
        mov     r2, r2, lsl #1
        adds    r1, r4, r2
        mov     r2, r2, asr #31
        adc     r4, r2, r4, asr #31
        subs    r3, r1, r9
        sbcs    r2, r4, #0
        movlt   r3, #0
        movlt   r2, #0
        orrs    r2, r3, r2
        mvnne   r1, #2, 2
        bne     LDEJ11
        cmp     r1, #2, 2
        sbcs    r4, r4, r8
        movlt   r1, #2, 2
LDEJ11:
        cmp     r1, #0
        ble     LDEJ34
        cmp     r6, r1
        mvnle   r1, #0
        addle   r4, r1, #2, 18
        ble     LDEJ12
        add     r1, r1, #2, 18
        mov     r1, r1, asr #16
        mov     r1, r1, lsl #16
        mov     r4, r1, asr #16
LDEJ12:
        mov     r2, #0
        cmp     r7, #0
        mov     r3, #1
        movlt   r2, r3
        add     r2, r7, r2
        mov     r2, r2, asr #1
        cmp     r2, #0
        str     r2, [sp, #0xC]
        ble     LDEJ29
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #8]
        sub     r5, r7, #7
        mov     r12, #0
        sub     r3, r7, #1
        str     r5, [sp, #0x3C]
        str     lr, [sp, #0x38]
        str     r4, [sp, #0x34]
        str     r11, [sp, #0x30]
        str     r10, [sp, #0x2C]
        str     r6, [sp, #0x44]
        str     r7, [sp, #0x40]
LDEJ13:
        ldr     lr, [sp, #0x40]
        ldrsh   r5, [r2]
        sub     lr, lr, r12
        mov     lr, lr, lsl #1
        sub     lr, lr, #4
        str     lr, [sp, #0x50]
        ldrsh   r4, [r1, +lr]
        mov     lr, r5, lsl #16
        str     r4, [sp, #0x58]
        mul     r4, r0, r4
        mov     r10, lr, asr #31
        mov     r6, r4, lsl #1
        adds    r4, r6, lr
        str     r4, [sp, #0x48]
        adc     r7, r10, r6, asr #31
        subs    r4, r4, r9
        str     r7, [sp, #0x4C]
        sbcs    r7, r7, #0
        movlt   r4, #0
        movlt   r7, #0
        orrs    r7, r4, r7
        bne     LDEJ14
        ldr     r4, [sp, #0x48]
        cmp     r4, #2, 2
        ldr     r4, [sp, #0x4C]
        sbcs    r4, r4, r8
        addge   r7, lr, r6
        bge     LDEJ19
LDEJ14:
        ldr     r4, [sp, #0x54]
        cmp     r3, #0
        add     r4, r4, #1
        str     r4, [sp, #0x54]
        ble     LDEJ18
        cmp     r3, #6
        movlt   r7, #0
        blt     LDEJ16
        mov     r10, r1
        ldr     r11, [sp, #0x3C]
        mov     r7, #0
        str     r1, [sp, #8]
LDEJ15:
        ldrsh   r1, [r10]
        ldrsh   lr, [r10, #2]
        ldrsh   r4, [r10, #4]
        ldrsh   r5, [r10, #6]
        ldrsh   r6, [r10, #8]
        mov     r1, r1, lsl #16
        mov     lr, lr, lsl #16
        mov     r4, r4, lsl #16
        mov     r5, r5, lsl #16
        mov     r6, r6, lsl #16
        mov     r1, r1, asr #17
        mov     lr, lr, asr #17
        mov     r4, r4, asr #17
        mov     r5, r5, asr #17
        mov     r6, r6, asr #17
        add     r7, r7, #5
        strh    r1, [r10]
        strh    lr, [r10, #2]
        strh    r4, [r10, #4]
        strh    r5, [r10, #6]
        strh    r6, [r10, #8]
        cmp     r7, r11
        add     r10, r10, #0xA
        ble     LDEJ15
        ldr     r1, [sp, #8]
LDEJ16:
        add     lr, r1, r7, lsl #1
LDEJ17:
        ldrsh   r4, [lr]
        add     r7, r7, #1
        cmp     r7, r3
        mov     r4, r4, lsl #16
        mov     r4, r4, asr #17
        strh    r4, [lr], #2
        blt     LDEJ17
        ldr     lr, [sp, #0x50]
        ldrsh   lr, [lr, +r1]
        str     lr, [sp, #0x58]
        ldrsh   r5, [r2]
        mul     r4, r0, lr
        mov     lr, r5, lsl #16
        mov     r10, lr, asr #31
        mov     r6, r4, lsl #1
LDEJ18:
        adds    r7, r6, lr
        adc     r11, r10, r6, asr #31
        subs    r4, r7, r9
        str     r11, [sp, #0x48]
        sbcs    r11, r11, #0
        movlt   r4, #0
        movlt   r11, #0
        orrs    r11, r4, r11
        mvnne   r7, #2, 2
        bne     LDEJ19
        ldr     r4, [sp, #0x48]
        cmp     r7, #2, 2
        sbcs    r4, r4, r8
        movlt   r7, #2, 2
LDEJ19:
        mul     r4, r0, r5
        ldr     r5, [sp, #0x58]
        mov     r4, r4, lsl #1
        str     r4, [sp, #0x4C]
        mov     r5, r5, lsl #16
        adds    r11, r5, r4
        mov     r4, r4, asr #31
        adc     r4, r4, r5, asr #31
        str     r11, [sp, #0x58]
        subs    r11, r11, r9
        str     r4, [sp, #0x48]
        sbcs    r4, r4, #0
        movlt   r11, #0
        movlt   r4, #0
        orrs    r4, r11, r4
        bne     LDEJ20
        ldr     r4, [sp, #0x58]
        cmp     r4, #2, 2
        ldr     r4, [sp, #0x48]
        sbcs    r4, r4, r8
        ldrge   lr, [sp, #0x4C]
        addge   lr, r5, lr
        bge     LDEJ26
LDEJ20:
        ldr     r4, [sp, #0x54]
        cmp     r3, #0
        add     r4, r4, #1
        str     r4, [sp, #0x54]
        ble     LDEJ24
        cmp     r3, #6
        movlt   r7, #0
        blt     LDEJ22
        mov     r10, r1
        ldr     r11, [sp, #0x3C]
        mov     r7, #0
        str     r1, [sp, #8]
LDEJ21:
        ldrsh   r1, [r10]
        ldrsh   lr, [r10, #2]
        ldrsh   r4, [r10, #4]
        ldrsh   r5, [r10, #6]
        ldrsh   r6, [r10, #8]
        mov     r1, r1, lsl #16
        mov     lr, lr, lsl #16
        mov     r4, r4, lsl #16
        mov     r5, r5, lsl #16
        mov     r6, r6, lsl #16
        mov     r1, r1, asr #17
        mov     lr, lr, asr #17
        mov     r4, r4, asr #17
        mov     r5, r5, asr #17
        mov     r6, r6, asr #17
        add     r7, r7, #5
        strh    r1, [r10]
        strh    lr, [r10, #2]
        strh    r4, [r10, #4]
        strh    r5, [r10, #6]
        strh    r6, [r10, #8]
        cmp     r7, r11
        add     r10, r10, #0xA
        ble     LDEJ21
        ldr     r1, [sp, #8]
LDEJ22:
        add     lr, r1, r7, lsl #1
LDEJ23:
        ldrsh   r4, [lr]
        add     r7, r7, #1
        cmp     r7, r3
        mov     r4, r4, lsl #16
        mov     r4, r4, asr #17
        strh    r4, [lr], #2
        blt     LDEJ23
        ldr     r4, [sp, #0x50]
        ldrsh   lr, [r2]
        ldrsh   r5, [r4, +r1]
        mul     r6, r0, lr
        mul     r4, r0, r5
        mov     lr, lr, lsl #16
        mov     r5, r5, lsl #16
        mov     r10, lr, asr #31
        mov     r6, r6, lsl #1
        str     r6, [sp, #0x4C]
        mov     r6, r4, lsl #1
LDEJ24:
        adds    r7, lr, r6
        adc     r6, r10, r6, asr #31
        subs    lr, r7, r9
        sbcs    r4, r6, #0
        movlt   lr, #0
        movlt   r4, #0
        orrs    r4, lr, r4
        mvnne   r7, #2, 2
        bne     LDEJ25
        cmp     r7, #2, 2
        sbcs    r6, r6, r8
        movlt   r7, #2, 2
LDEJ25:
        ldr     r4, [sp, #0x4C]
        adds    lr, r5, r4
        mov     r4, r4, asr #31
        adc     r5, r4, r5, asr #31
        subs    r4, lr, r9
        sbcs    r6, r5, #0
        movlt   r4, #0
        movlt   r6, #0
        orrs    r6, r4, r6
        mvnne   lr, #2, 2
        bne     LDEJ26
        cmp     lr, #2, 2
        sbcs    r5, r5, r8
        movlt   lr, #2, 2
LDEJ26:
        ldr     r4, [sp, #0x44]
        cmp     r4, r7
        mvnle   r4, #0
        addle   r7, r4, #2, 18
        ble     LDEJ27
        add     r7, r7, #2, 18
        mov     r7, r7, asr #16
        mov     r7, r7, lsl #16
        mov     r7, r7, asr #16
LDEJ27:
        strh    r7, [r2], #2
        ldr     r4, [sp, #0x44]
        cmp     r4, lr
        mvnle   lr, #0
        addle   lr, lr, #2, 18
        ble     LDEJ28
        add     lr, lr, #2, 18
        mov     lr, lr, asr #16
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
LDEJ28:
        ldr     r4, [sp, #0xC]
        add     r12, r12, #1
        cmp     r12, r4
        ldr     r4, [sp, #0x50]
        strh    lr, [r4, +r1]
        blt     LDEJ13
        ldr     r0, [sp, #0x54]
        ldr     lr, [sp, #0x38]
        ldr     r4, [sp, #0x34]
        ldr     r11, [sp, #0x30]
        ldr     r10, [sp, #0x2C]
        ldr     r6, [sp, #0x44]
        ldr     r7, [sp, #0x40]
        bic     r0, r0, #0xFF, 8
        str     r1, [sp, #8]
        bic     r5, r0, #0xFF, 16
LDEJ29:
        mov     lr, lr, asr r5
        cmp     r6, lr
        mvnle   r0, #0
        addle   r0, r0, #2, 18
        ble     LDEJ30
        add     r0, lr, #2, 18
        mov     r0, r0, asr #16
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
LDEJ30:
        cmp     r11, #0
        rsbgt   r0, r0, #0
        ldr     r2, [sp, #0x28]
        add     r7, r7, #1
        strh    r0, [r2], #2
        ldr     r0, [sp, #0x14]
        str     r2, [sp, #0x28]
        cmp     r7, r0
        ble     LDEJ0
        ldr     r12, [sp, #0x18]
LDEJ31:
        ldr     r2, [sp, #0x1C]
        rsb     r5, r5, #0xF
        mov     r0, r5, lsl #16
        mov     r0, r0, asr #16
        cmp     r0, #0xD
        strh    r0, [r2]
        bge     LDEJ33
        cmp     r7, #0xA
        bgt     LDEJ32
        mvn     r0, #0x74
        add     sp, sp, #0x60
        ldmia   sp!, {r4 - r11, pc}
LDEJ32:
        mov     r0, #0xC
        add     sp, sp, #0x60
        ldmia   sp!, {r4 - r11, pc}
LDEJ33:
        mov     r0, #0
        strh    r4, [r12]
        add     sp, sp, #0x60
        ldmia   sp!, {r4 - r11, pc}
LDEJ34:
        cmp     r7, #0xB
        bgt     LDEJ32
        mvn     r0, #0x74
        add     sp, sp, #0x60
        ldmia   sp!, {r4 - r11, pc}
LDEJ35:
        cmp     r7, #0xB
        bgt     LDEJ32
        mvn     r0, #0x74
        add     sp, sp, #0x60
        ldmia   sp!, {r4 - r11, pc}
LDEJ36:
        ldr     lr, [sp, #0x1C]
        add     r3, sp, #0x5C
        str     r12, [sp]
        str     lr, [sp, #4]
        bl      _ippsLevinsonDurbin_G728_16s_Sfs
        add     sp, sp, #0x60
        ldmia   sp!, {r4 - r11, pc}
LDEJ37:
        mvn     r0, #0xC
        add     sp, sp, #0x60
        ldmia   sp!, {r4 - r11, pc}
LDEJ38:
        cmn     r11, #2, 18
        mvneq   r0, #0
        addeq   r0, r0, #2, 18
        beq     LDEJ7
        rsb     r0, r11, #0
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LDEJ7
LDEJ39:
        mvn     r0, #6
        add     sp, sp, #0x60
        ldmia   sp!, {r4 - r11, pc}
LDEJ40:
        mvn     r0, #7
        add     sp, sp, #0x60
        ldmia   sp!, {r4 - r11, pc}


