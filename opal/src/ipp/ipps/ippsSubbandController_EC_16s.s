        .text
        .align  4
        .globl  _ippsSubbandController_EC_16s


_ippsSubbandController_EC_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x84
        ldr     r4, [sp, #0xA8]
        ldr     lr, [sp, #0xAC]
        cmp     r0, #0
        beq     LDKD30
        cmp     r1, #0
        beq     LDKD30
        cmp     r2, #0
        beq     LDKD30
        cmp     r3, #0
        beq     LDKD30
        cmp     r4, #0
        beq     LDKD30
        cmp     lr, #0
        beq     LDKD30
        and     r12, lr, #0xF
        rsb     r12, r12, #0
        and     r5, r12, #0xF
        str     r5, [sp]
        ldr     r12, [r5, +lr]
        add     r6, lr, r5
        ldr     r5, [r6, #0x20]
        cmp     r12, #0
        str     r5, [sp, #0x24]
        ldr     r12, [r6, #0x14]
        str     r12, [sp, #0x28]
        ldr     r12, [r6, #0x10]
        str     r12, [sp, #0x2C]
        ldr     r9, [r6, #0x30]
        ldr     r8, [r6, #0x2C]
        ble     LDKD29
        mov     r5, r9, asr #31
        rsbs    r7, r9, #0
        rsc     r5, r5, #0
        mov     r10, r8, asr #31
        rsbs    r11, r8, #0
        rsc     r10, r10, #0
        str     r10, [sp, #0xC]
        mvn     r10, #2, 2
        mov     r12, #0
        str     r10, [sp, #4]
        str     r12, [sp, #0x14]
        mvn     r10, #0
        str     r7, [sp, #0x30]
        str     r10, [sp, #8]
        mov     r7, r12
        str     r5, [sp, #0x1C]
        mov     r5, r7
        str     r11, [sp, #0x18]
        mov     r10, #0x66
        mov     r11, #0xAA
        str     r1, [sp, #0x50]
        str     lr, [sp, #0x40]
        str     r4, [sp, #0x3C]
        str     r3, [sp, #0x38]
        str     r2, [sp, #0x34]
        ldr     r1, [sp, #0x2C]
        ldr     r2, [sp, #0x28]
        ldr     r3, [sp, #0x24]
        ldr     lr, [sp, #8]
        ldr     r4, [sp, #4]
        orr     r10, r10, #0x16, 24
        orr     r11, r11, #0x2A, 24
        str     r5, [sp, #0x20]
        str     r11, [sp, #0x10]
        str     r5, [sp, #0x58]
        str     r7, [sp, #0x54]
        str     r10, [sp, #0x4C]
        str     r8, [sp, #0x48]
        str     r9, [sp, #0x44]
        str     r6, [sp, #0x74]
LDKD0:
        ldr     r5, [sp, #0x50]
        ldr     r7, [r0, #4]
        ldr     r6, [r5, #4]
        ldr     r8, [r5], #8
        smull   r6, r10, r6, r6
        smull   r8, r9, r8, r8
        str     r6, [sp, #0x6C]
        ldr     r6, [r0], #8
        str     r9, [sp, #0x68]
        ldr     r11, [sp, #0x6C]
        smull   r6, r9, r6, r6
        str     r8, [sp, #0x64]
        smull   r7, r8, r7, r7
        str     r6, [sp, #0x5C]
        ldr     r6, [sp, #0x74]
        ldr     r6, [r6, #8]
        str     r5, [sp, #0x50]
        ldr     r5, [sp, #0x64]
        str     r6, [sp, #0x60]
        adds    r5, r5, r11
        ldr     r11, [sp, #0x68]
        adc     r11, r11, r10
        adds    r10, r5, #2, 24
        adc     r5, r11, #0
        ldr     r11, [sp, #0x5C]
        adds    r7, r11, r7
        adc     r9, r9, r8
        adds    r8, r7, #2, 24
        adc     r7, r9, #0
        mov     r11, r5, lsl #22
        mov     r5, r5, asr #10
        mov     r9, r7, lsl #22
        cmp     r6, #0
        str     r5, [sp, #0x68]
        mov     r7, r7, asr #10
        orr     r6, r11, r10, lsr #10
        orr     r5, r9, r8, lsr #10
        str     r7, [sp, #0x64]
        movle   r8, #0
        movle   r9, r8
        ble     LDKD2
        ldr     r7, [sp, #0x34]
        str     r6, [sp, #0x6C]
        ldr     r4, [sp, #0x60]
        ldr     r6, [sp, #0x14]
        mov     r8, #0
        mov     r9, r8
        str     r0, [sp, #0x70]
LDKD1:
        ldr     r0, [r7], #4
        add     lr, r6, r0
        ldr     r10, [lr, #4]
        ldr     r0, [r0, +r6]
        smull   r0, lr, r0, r0
        smull   r11, r10, r10, r10
        adds    r0, r0, r11
        adc     r10, lr, r10
        adds    lr, r0, #2, 24
        adc     r0, r10, #0
        mov     r10, r0, lsl #22
        orr     lr, r10, lr, lsr #10
        adds    r9, r9, lr
        adc     r8, r8, r0, asr #10
        subs    r4, r4, #1
        bne     LDKD1
        ldr     r6, [sp, #0x6C]
        ldr     r0, [sp, #0x70]
        ldr     lr, [sp, #8]
        ldr     r4, [sp, #4]
LDKD2:
        ldr     r7, [r3]
        cmp     r7, r9
        rscs    r10, r8, r7, asr #31
        bge     LDKD3
        subs    r10, r9, r7
        str     r10, [sp, #0x5C]
        sbc     r10, r8, r7, asr #31
        str     r10, [sp, #0x60]
        b       LDKD4
LDKD3:
        subs    r10, r7, r9
        str     r10, [sp, #0x5C]
        rsc     r10, r8, r7, asr #31
        str     r10, [sp, #0x60]
LDKD4:
        ldr     r10, [sp, #0x44]
        smull   r7, r10, r10, r7
        str     r10, [sp, #0x78]
        str     r7, [sp, #0x7C]
        ldr     r7, [sp, #0x30]
        adds    r7, r7, #1, 18
        umull   r10, r11, r7, r9
        mla     r11, r7, r8, r11
        ldr     r7, [sp, #0x1C]
        ldr     r8, [sp, #0x7C]
        str     r10, [sp, #0x80]
        ldr     r10, [sp, #0x78]
        adc     r7, r7, #0
        mla     r11, r7, r9, r11
        ldr     r7, [sp, #0x80]
        adds    r8, r8, #2, 20
        adc     r10, r10, #0
        adds    r8, r7, r8
        adc     r10, r11, r10
        mov     r7, r10, lsl #18
        orr     r7, r7, r8, lsr #14
        subs    r9, r7, r4
        mov     r8, r10, asr #14
        sbcs    r10, r8, #0
        movlt   r9, #0
        movlt   r10, #0
        orrs    r10, r9, r10
        mvnne   r7, #2, 2
        bne     LDKD5
        cmp     r7, #2, 2
        sbcs    r8, r8, lr
        movlt   r7, #2, 2
LDKD5:
        str     r7, [r3]
        ldr     r7, [sp, #0x18]
        ldr     r8, [r2]
        ldr     r9, [sp, #0x68]
        adds    r7, r7, #1, 18
        umull   r11, r10, r7, r6
        mla     r9, r7, r9, r10
        ldr     r10, [sp, #0x48]
        ldr     r7, [sp, #0xC]
        smull   r8, r10, r10, r8
        adc     r7, r7, #0
        mla     r9, r7, r6, r9
        adds    r8, r8, #2, 20
        adc     r10, r10, #0
        adds    r8, r11, r8
        adc     r10, r9, r10
        mov     r6, r10, lsl #18
        orr     r6, r6, r8, lsr #14
        subs    r8, r6, r4
        mov     r7, r10, asr #14
        sbcs    r9, r7, #0
        movlt   r8, #0
        movlt   r9, #0
        orrs    r9, r8, r9
        mvnne   r6, #2, 2
        bne     LDKD6
        cmp     r6, #2, 2
        sbcs    r7, r7, lr
        movlt   r6, #2, 2
LDKD6:
        str     r6, [r2]
        ldr     r6, [sp, #0x18]
        ldr     r9, [r1]
        ldr     r7, [sp, #0x64]
        adds    r6, r6, #1, 18
        umull   r8, r10, r6, r5
        mla     r7, r6, r7, r10
        ldr     r10, [sp, #0x48]
        ldr     r6, [sp, #0xC]
        smull   r10, r9, r10, r9
        adc     r6, r6, #0
        mla     r7, r6, r5, r7
        adds    r10, r10, #2, 20
        adc     r9, r9, #0
        adds    r10, r8, r10
        adc     r9, r7, r9
        mov     r5, r9, lsl #18
        orr     r5, r5, r10, lsr #14
        subs    r7, r5, r4
        mov     r6, r9, asr #14
        sbcs    r8, r6, #0
        movlt   r7, #0
        movlt   r8, #0
        orrs    r8, r7, r8
        mvnne   r5, #2, 2
        bne     LDKD7
        cmp     r5, #2, 2
        sbcs    r6, r6, lr
        movlt   r5, #2, 2
LDKD7:
        ldr     r7, [sp, #0x5C]
        mov     r6, #0xA
        str     r5, [r1]
        umull   r6, r8, r6, r7
        ldr     r7, [r3], #4
        ldr     r9, [sp, #0x60]
        subs    r6, r7, r6
        add     r10, r9, r9, lsl #3
        add     r10, r9, r10
        add     r8, r10, r8
        rscs    r7, r8, r7, asr #31
        movlt   r6, #0
        movlt   r7, #0
        orrs    r7, r6, r7
        ldreq   r7, [r2]
        moveq   r6, r7, asr #31
        beq     LDKD10
        ldr     r7, [r2]
        ldr     r6, [sp, #0x4C]
        smull   r9, r8, r6, r7
        mov     r6, r7, asr #31
        adds    r9, r9, #2, 20
        adc     r8, r8, #0
        mov     r10, r8, lsl #18
        orr     r9, r10, r9, lsr #14
        subs    r9, r9, r5
        mov     r8, r8, asr #14
        sbcs    r8, r8, r5, asr #31
        movlt   r9, #0
        movlt   r8, #0
        orrs    r8, r9, r8
        beq     LDKD10
        ldr     r6, [sp, #0x74]
        ldr     r6, [r6, #8]
        cmp     r6, #0
        ble     LDKD9
        ldr     r6, [sp, #0x38]
        ldr     r5, [sp, #0x34]
        ldr     r4, [sp, #0x14]
        ldr     r8, [sp, #0x74]
        mov     r7, #0
LDKD8:
        ldr     lr, [r5], #4
        ldr     r9, [r6], #4
        ldr     r10, [lr, +r4]
        add     r11, r4, lr
        add     lr, r4, r9
        str     r10, [r9, +r4]
        ldr     r11, [r11, #4]
        add     r7, r7, #1
        str     r11, [lr, #4]
        ldr     lr, [r8, #8]
        cmp     r7, lr
        blt     LDKD8
        ldr     lr, [sp, #8]
        ldr     r4, [sp, #4]
        ldr     r5, [r1]
LDKD9:
        ldr     r6, [sp, #0x54]
        mov     r7, r5
        adds    r9, r6, r7
        mov     r8, r6, asr #31
        mov     r6, r5, asr #31
        str     r9, [sp, #0x54]
        adc     r8, r8, r6
        subs    r9, r9, r4
        sbcs    r10, r8, #0
        movlt   r9, #0
        movlt   r10, #0
        orrs    r10, r9, r10
        str     r5, [r2]
        mvnne   r5, #2, 2
        strne   r5, [sp, #0x54]
        bne     LDKD13
        ldr     r5, [sp, #0x54]
        cmp     r5, #2, 2
        sbcs    r8, r8, lr
        movlt   r5, #2, 2
        strlt   r5, [sp, #0x54]
        b       LDKD13
LDKD10:
        ldr     r8, [sp, #0x10]
        smull   r5, r8, r8, r5
        adds    r5, r5, #2, 20
        adc     r8, r8, #0
        mov     r9, r8, lsl #18
        orr     r5, r9, r5, lsr #14
        cmp     r7, r5
        sbcs    r8, r6, r8, asr #14
        bge     LDKD13
        ldr     r5, [sp, #0x74]
        ldr     r5, [r5, #8]
        cmp     r5, #0
        ble     LDKD12
        ldr     r6, [sp, #0x34]
        ldr     r5, [sp, #0x38]
        ldr     r4, [sp, #0x14]
        ldr     r8, [sp, #0x74]
        mov     r7, #0
LDKD11:
        ldr     lr, [r5], #4
        ldr     r9, [r6], #4
        ldr     r10, [lr, +r4]
        add     r11, r4, lr
        add     lr, r4, r9
        str     r10, [r9, +r4]
        ldr     r11, [r11, #4]
        add     r7, r7, #1
        str     r11, [lr, #4]
        ldr     lr, [r8, #8]
        cmp     r7, lr
        blt     LDKD11
        ldr     lr, [sp, #8]
        ldr     r4, [sp, #4]
        ldr     r7, [r2]
LDKD12:
        str     r7, [r1]
        ldr     r6, [sp, #0x58]
        ldr     r7, [r2]
        mov     r5, r6, asr #31
        adds    r8, r6, r7
        str     r8, [sp, #0x58]
        mov     r6, r7, asr #31
        adc     r5, r5, r6
        subs    r8, r8, r4
        sbcs    r9, r5, #0
        movlt   r8, #0
        movlt   r9, #0
        orrs    r9, r8, r9
        mvnne   r5, #2, 2
        strne   r5, [sp, #0x58]
        bne     LDKD13
        ldr     r8, [sp, #0x58]
        cmp     r8, #2, 2
        sbcs    r5, r5, lr
        movlt   r5, #2, 2
        strlt   r5, [sp, #0x58]
LDKD13:
        mov     r5, r12, asr #31
        adds    r12, r12, r7
        adc     r6, r5, r6
        subs    r5, r12, r4
        sbcs    r7, r6, #0
        movlt   r5, #0
        movlt   r7, #0
        orrs    r7, r5, r7
        mvnne   r12, #2, 2
        bne     LDKD14
        cmp     r12, #2, 2
        sbcs    r6, r6, lr
        movlt   r12, #2, 2
LDKD14:
        ldr     r5, [sp]
        ldr     r6, [sp, #0x40]
        ldr     r7, [sp, #0x14]
        add     r2, r2, #4
        add     r1, r1, #4
        ldr     r5, [r5, +r6]
        ldr     r6, [sp, #0x20]
        add     r7, r7, #8
        str     r7, [sp, #0x14]
        add     r6, r6, #1
        cmp     r6, r5
        str     r6, [sp, #0x20]
        blt     LDKD0
        ldr     r5, [sp, #0x58]
        ldr     r7, [sp, #0x54]
        ldr     r6, [sp, #0x74]
        ldr     r4, [sp, #0x3C]
LDKD15:
        ldr     r0, [r6, #0x58]
        mvn     r2, #2, 2
        mvn     r1, #0
        cmp     r0, #0
        mov     r0, #0
        mov     r3, #0xA
        beq     LDKD19
        smull   lr, r9, r3, r7
        mov     r8, r12, asr #31
        subs    lr, lr, r12
        sbcs    r9, r9, r8
        movlt   lr, #0
        movlt   r9, #0
        orrs    r9, lr, r9
        beq     LDKD17
        ldr     lr, [r6, #0x28]
        mov     r9, #5
        smull   r9, r10, r9, r12
        subs    r9, lr, r9
        rscs    lr, r10, lr, asr #31
        movlt   r9, #0
        movlt   lr, #0
        orrs    lr, r9, lr
        beq     LDKD17
        ldr     r3, [r6, #0x34]
        ldr     r12, [r6, #0x44]
        mul     r3, r12, r3
        add     r3, r3, #2, 20
        mov     r3, r3, asr #14
        subs    lr, r3, r2
        rscs    r12, r0, r3, asr #31
        movlt   lr, #0
        movlt   r12, #0
        orrs    r12, lr, r12
        movne   r3, r2
        bne     LDKD16
        cmp     r3, #2, 2
        rscs    r12, r1, r3, asr #31
        movlt   r3, #2, 2
LDKD16:
        str     r3, [r6, #0x44]
        b       LDKD23
LDKD17:
        smull   r3, lr, r3, r5
        cmp     r3, r12
        sbcs    lr, lr, r8
        ldrlt   r3, [r6, #0x44]
        blt     LDKD23
        ldr     r3, [r6, #0x34]
        ldr     r12, [r6, #0x44]
        rsb     lr, r3, #1, 18
        mov     lr, lr, lsl #14
        mla     lr, r12, r3, lr
        add     r3, lr, #2, 20
        mov     r3, r3, asr #14
        subs    lr, r3, r2
        rscs    r12, r0, r3, asr #31
        movlt   lr, #0
        movlt   r12, #0
        orrs    r12, lr, r12
        movne   r3, r2
        bne     LDKD18
        cmp     r3, #2, 2
        rscs    r12, r1, r3, asr #31
        movlt   r3, #2, 2
LDKD18:
        str     r3, [r6, #0x44]
        b       LDKD23
LDKD19:
        smull   r8, r9, r3, r7
        mov     lr, r12, asr #31
        subs    r8, r8, r12
        sbcs    r9, r9, lr
        movlt   r8, #0
        movlt   r9, #0
        orrs    r9, r8, r9
        bne     LDKD21
        smull   r3, r8, r3, r5
        cmp     r3, r12
        sbcs    r8, r8, lr
        ldrlt   r3, [r6, #0x44]
        blt     LDKD23
        ldr     r3, [r6, #0x34]
        ldr     r12, [r6, #0x44]
        rsb     lr, r3, #1, 18
        mov     lr, lr, lsl #14
        mla     lr, r12, r3, lr
        add     r3, lr, #2, 20
        mov     r3, r3, asr #14
        subs    lr, r3, r2
        rscs    r12, r0, r3, asr #31
        movlt   lr, #0
        movlt   r12, #0
        orrs    r12, lr, r12
        movne   r3, r2
        bne     LDKD20
        cmp     r3, #2, 2
        rscs    r12, r1, r3, asr #31
        movlt   r3, #2, 2
LDKD20:
        str     r3, [r6, #0x44]
        b       LDKD23
LDKD21:
        ldr     r3, [r6, #0x34]
        ldr     r12, [r6, #0x44]
        mul     r3, r12, r3
        add     r3, r3, #2, 20
        mov     r3, r3, asr #14
        subs    lr, r3, r2
        rscs    r12, r0, r3, asr #31
        movlt   lr, #0
        movlt   r12, #0
        orrs    r12, lr, r12
        movne   r3, r2
        bne     LDKD22
        cmp     r3, #2, 2
        rscs    r12, r1, r3, asr #31
        movlt   r3, #2, 2
LDKD22:
        str     r3, [r6, #0x44]
LDKD23:
        cmp     r3, #2, 20
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        bge     LDKD24
        cmp     r5, #0x64
        bge     LDKD25
        cmp     r7, #0x64
        bge     LDKD25
LDKD24:
        mvn     r12, r3
        b       LDKD26
LDKD25:
        mov     r12, #0
LDKD26:
        ldr     r5, [r6, #0x38]
        ldr     r7, [r6, #0x3C]
        rsb     lr, r5, #0
        add     lr, lr, #1, 18
        mul     r5, r7, r5
        add     r5, r5, #2, 20
        mla     r5, lr, r12, r5
        mov     r12, r5, asr #14
        subs    r5, r12, r2
        rscs    lr, r0, r12, asr #31
        movlt   r5, #0
        movlt   lr, #0
        orrs    lr, r5, lr
        movne   r12, r2
        bne     LDKD27
        cmp     r12, #2, 2
        rscs    r1, r1, r12, asr #31
        movlt   r12, #2, 2
LDKD27:
        mvn     r1, r3
        cmp     r1, r12
        str     r12, [r6, #0x3C]
        sublt   r0, r0, #2, 18
        mvnlt   r3, r0
        blt     LDKD28
        cmn     r12, #2, 18
        movge   r12, r12, lsl #16
        movge   r3, r12, asr #16
LDKD28:
        mov     r0, #0
        strh    r3, [r4]
        add     sp, sp, #0x84
        ldmia   sp!, {r4 - r11, pc}
LDKD29:
        mov     r5, #0
        mov     r12, r5
        mov     r7, r12
        b       LDKD15
LDKD30:
        mvn     r0, #7
        add     sp, sp, #0x84
        ldmia   sp!, {r4 - r11, pc}


