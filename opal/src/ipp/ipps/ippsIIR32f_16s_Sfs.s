        .text
        .align  4
        .globl  _ippsIIR32f_16s_Sfs


_ippsIIR32f_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x5C
        ldr     lr, [sp, #0x80]
        mov     r4, r0
        cmp     r4, #0
        mov     r6, r1
        mov     r5, r2
        beq     LBRZ27
        cmp     r6, #0
        beq     LBRZ27
        cmp     r3, #0
        beq     LBRZ27
        cmp     r5, #0
        ble     LBRZ26
        ldr     r7, [r3]
        ldr     r8, [pc, #0xF9C]
        ldr     r12, [r3, #0x30]
        subs    r7, r7, r8
        add     r12, lr, r12
        beq     LBRZ3
        adds    r7, r7, #1
        beq     LBRZ0
        mvn     r0, #0x10
        add     sp, sp, #0x5C
        ldmia   sp!, {r4 - r11, pc}
LBRZ0:
        ldr     r7, [r3, #0x28]
        cmp     r7, #7
        bge     LBRZ2
        cmp     r12, #0
        blt     LBRZ1
        cmp     r12, #0x1F
        bgt     LBRZ1
        str     lr, [sp]
        mov     r0, r4
        mov     r2, r5
        mov     r1, r6
        bl      LBRZ_ownsIIRAR32f_16s_Sfs
        mov     r0, #0
        add     sp, sp, #0x5C
        ldmia   sp!, {r4 - r11, pc}
LBRZ1:
        str     lr, [sp]
        mov     r0, r4
        mov     r2, r5
        mov     r1, r6
        bl      LBRZ_refsIIRAR32f_16s_Sfs
        mov     r0, #0
        add     sp, sp, #0x5C
        ldmia   sp!, {r4 - r11, pc}
LBRZ2:
        str     lr, [sp]
        mov     r0, r4
        mov     r2, r5
        mov     r1, r6
        bl      LBRZ_refsIIRAR32f_16s_Sfs
        mov     r0, #0
        add     sp, sp, #0x5C
        ldmia   sp!, {r4 - r11, pc}
LBRZ3:
        ldr     r7, [r3, #0x28]
        cmp     r7, #6
        bge     LBRZ14
        cmp     r12, #0
        blt     LBRZ4
        cmp     r12, #0x1F
        bgt     LBRZ4
        str     lr, [sp]
        mov     r0, r4
        mov     r2, r5
        mov     r1, r6
        bl      LBRZ_ownsIIRBQ32f_16s_Sfs
        mov     r0, #0
        add     sp, sp, #0x5C
        ldmia   sp!, {r4 - r11, pc}
LBRZ4:
        ldr     r8, [pc, #0xEC0]
        ldr     r12, [r3, #4]
        ldr     r3, [r3, #8]
        ldr     r8, [r8]
        cmp     lr, #0
        str     r8, [sp, #0x58]
        andge   lr, lr, #0x7F
        subge   r9, r8, lr, lsl #23
        blt     LBRZ24
LBRZ5:
        ldr     r8, [pc, #0xEA0]
        cmp     r5, #0
        str     r9, [sp, #0x58]
        ldr     r11, [r8]
        mov     r8, r11
        ble     LBRZ13
        ldr     r0, [pc, #0xE8C]
        ldr     r10, [pc, #0xE8C]
        ldr     lr, [pc, #0xE8C]
        ldr     r0, [r0]
        add     r1, r3, #4
        add     r2, r12, #8
        str     r0, [sp, #0x10]
        ldr     r10, [r10]
        add     r0, r12, #0xC
        str     r10, [sp, #0x14]
        ldr     lr, [lr]
        add     r10, r12, #4
        str     r10, [sp, #0xC]
        add     r10, r12, #0x10
        str     r10, [sp, #0x40]
        str     r2, [sp, #0x3C]
        str     r1, [sp, #0x38]
        str     r0, [sp, #0x34]
        str     lr, [sp, #0x30]
        str     r9, [sp, #0x28]
        str     r3, [sp, #0x24]
        str     r12, [sp, #8]
LBRZ6:
        ldrsh   r0, [r4], #2
        bl      __floatsisf
        cmp     r7, #0
        ble     LBRZ8
        ldr     r12, [sp, #8]
        ldr     r8, [sp, #0x24]
        ldr     r3, [sp, #0xC]
        ldr     r2, [sp, #0x34]
        ldr     r1, [sp, #0x3C]
        ldr     r9, [sp, #0x40]
        ldr     r10, [sp, #0x38]
        mov     lr, r7
        str     r4, [sp, #0x44]
        str     r11, [sp, #0x2C]
        str     r7, [sp, #0x20]
        str     r5, [sp, #0x1C]
        str     r6, [sp, #0x18]
        str     lr, [sp, #0x4C]
        str     r12, [sp, #0x48]
        mov     r11, r0
        mov     r4, r1
        mov     r5, r2
        mov     r6, r3
        mov     r7, r8
LBRZ7:
        ldr     r12, [sp, #0x48]
        mov     r1, r11
        ldr     r0, [r12], #0x14
        str     r12, [sp, #0x48]
        bl      __mulsf3
        ldr     r1, [r7]
        bl      __addsf3
        ldr     r2, [r6], #0x14
        mov     r8, r0
        mov     r1, r11
        mov     r0, r2
        bl      __mulsf3
        ldr     r2, [r5], #0x14
        str     r0, [sp, #0x50]
        mov     r0, r2
        mov     r1, r8
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x50]
        bl      __subsf3
        ldr     r1, [r10]
        bl      __addsf3
        str     r0, [r7], #8
        ldr     r0, [r4], #0x14
        mov     r1, r11
        bl      __mulsf3
        ldr     r2, [r9], #0x14
        mov     r11, r0
        mov     r1, r8
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        str     r0, [r10], #8
        ldr     r12, [sp, #0x4C]
        subs    r12, r12, #1
        str     r12, [sp, #0x4C]
        mov     r11, r8
        bne     LBRZ7
        ldr     r4, [sp, #0x44]
        ldr     r11, [sp, #0x2C]
        ldr     r7, [sp, #0x20]
        ldr     r5, [sp, #0x1C]
        ldr     r6, [sp, #0x18]
LBRZ8:
        mov     r0, r8
        ldr     r1, [sp, #0x28]
        bl      __mulsf3
        ldr     r1, [sp, #0x10]
        mov     r9, r0
        bl      __gtsf2
        cmp     r0, #0
        movgt   r3, #0xFF
        orrgt   r0, r3, #0x7F, 24
        bgt     LBRZ12
        mov     r0, r9
        ldr     r1, [sp, #0x14]
        bl      __ltsf2
        cmp     r0, #0
        blt     LBRZ11
        mov     r0, r9
        mov     r1, r11
        bl      __gtsf2
        cmp     r0, #0
        ble     LBRZ9
        ldr     r0, [sp, #0x30]
        mov     r1, r9
        bl      __addsf3
        mov     r9, r0
LBRZ9:
        mov     r0, r9
        mov     r1, r11
        bl      __ltsf2
        cmp     r0, #0
        bge     LBRZ10
        mov     r0, r9
        ldr     r1, [sp, #0x30]
        bl      __subsf3
        mov     r9, r0
LBRZ10:
        mov     r0, r9
        bl      __fixsfsi
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LBRZ12
LBRZ11:
        mov     r3, #0xFF
        orr     r3, r3, #0x7F, 24
        mvn     r0, r3
LBRZ12:
        strh    r0, [r6], #2
        subs    r5, r5, #1
        bne     LBRZ6
LBRZ13:
        mov     r0, #0
        add     sp, sp, #0x5C
        ldmia   sp!, {r4 - r11, pc}
LBRZ14:
        ldr     r8, [pc, #0xC5C]
        ldr     r12, [r3, #4]
        ldr     r3, [r3, #8]
        ldr     r8, [r8]
        cmp     lr, #0
        str     r8, [sp, #0x54]
        andge   lr, lr, #0x7F
        subge   r0, r8, lr, lsl #23
        blt     LBRZ25
LBRZ15:
        ldr     r8, [pc, #0xC3C]
        cmp     r5, #0
        str     r0, [sp, #0x54]
        ldr     r9, [r8]
        mov     r8, r9
        ble     LBRZ23
        ldr     r11, [pc, #0xC28]
        ldr     r10, [pc, #0xC28]
        ldr     lr, [pc, #0xC28]
        ldr     r11, [r11]
        add     r1, r12, #4
        ldr     r10, [r10]
        ldr     lr, [lr]
        add     r2, r3, #4
        str     r2, [sp, #0x14]
        add     r2, r12, #8
        str     r1, [sp, #8]
        str     r2, [sp, #0x10]
        add     r1, r12, #0xC
        add     r2, r12, #0x10
        str     r2, [sp, #0xC]
        str     r1, [sp, #0x2C]
        str     lr, [sp, #0x30]
        str     r10, [sp, #0x34]
        str     r11, [sp, #0x38]
        str     r0, [sp, #0x40]
        str     r3, [sp, #0x48]
        str     r12, [sp, #0x4C]
LBRZ16:
        ldrsh   r0, [r4], #2
        bl      __floatsisf
        cmp     r7, #0
        ble     LBRZ18
        ldr     r12, [sp, #0x4C]
        ldr     r8, [sp, #0x48]
        ldr     r3, [sp, #8]
        ldr     r2, [sp, #0x2C]
        ldr     r1, [sp, #0x10]
        ldr     r10, [sp, #0xC]
        ldr     r11, [sp, #0x14]
        mov     lr, r7
        str     r4, [sp, #0x44]
        str     r9, [sp, #0x3C]
        str     r7, [sp, #0x20]
        str     r5, [sp, #0x1C]
        str     r6, [sp, #0x18]
        str     lr, [sp, #0x24]
        str     r12, [sp, #0x28]
        mov     r9, r0
        mov     r4, r1
        mov     r5, r2
        mov     r6, r3
        mov     r7, r8
LBRZ17:
        ldr     r12, [sp, #0x28]
        mov     r1, r9
        ldr     r0, [r12], #0x14
        str     r12, [sp, #0x28]
        bl      __mulsf3
        ldr     r1, [r7]
        bl      __addsf3
        ldr     r2, [r6], #0x14
        mov     r8, r0
        mov     r1, r9
        mov     r0, r2
        bl      __mulsf3
        ldr     r2, [r5], #0x14
        str     r0, [sp, #0x50]
        mov     r0, r2
        mov     r1, r8
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x50]
        bl      __subsf3
        ldr     r1, [r11]
        bl      __addsf3
        str     r0, [r7], #8
        ldr     r0, [r4], #0x14
        mov     r1, r9
        bl      __mulsf3
        ldr     r2, [r10], #0x14
        mov     r9, r0
        mov     r1, r8
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r9
        bl      __subsf3
        str     r0, [r11], #8
        ldr     r12, [sp, #0x24]
        subs    r12, r12, #1
        str     r12, [sp, #0x24]
        mov     r9, r8
        bne     LBRZ17
        ldr     r4, [sp, #0x44]
        ldr     r9, [sp, #0x3C]
        ldr     r7, [sp, #0x20]
        ldr     r5, [sp, #0x1C]
        ldr     r6, [sp, #0x18]
LBRZ18:
        mov     r0, r8
        ldr     r1, [sp, #0x40]
        bl      __mulsf3
        ldr     r1, [sp, #0x38]
        mov     r10, r0
        bl      __gtsf2
        cmp     r0, #0
        movgt   r3, #0xFF
        orrgt   r0, r3, #0x7F, 24
        bgt     LBRZ22
        mov     r0, r10
        ldr     r1, [sp, #0x34]
        bl      __ltsf2
        cmp     r0, #0
        blt     LBRZ21
        mov     r0, r10
        mov     r1, r9
        bl      __gtsf2
        cmp     r0, #0
        ble     LBRZ19
        ldr     r0, [sp, #0x30]
        mov     r1, r10
        bl      __addsf3
        mov     r10, r0
LBRZ19:
        mov     r0, r10
        mov     r1, r9
        bl      __ltsf2
        cmp     r0, #0
        bge     LBRZ20
        mov     r0, r10
        ldr     r1, [sp, #0x30]
        bl      __subsf3
        mov     r10, r0
LBRZ20:
        mov     r0, r10
        bl      __fixsfsi
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LBRZ22
LBRZ21:
        mov     r3, #0xFF
        orr     r3, r3, #0x7F, 24
        mvn     r0, r3
LBRZ22:
        strh    r0, [r6], #2
        subs    r5, r5, #1
        bne     LBRZ16
LBRZ23:
        mov     r0, #0
        add     sp, sp, #0x5C
        ldmia   sp!, {r4 - r11, pc}
LBRZ24:
        rsb     lr, lr, #0
        and     lr, lr, #0x7F
        add     r9, r8, lr, lsl #23
        b       LBRZ5
LBRZ25:
        rsb     lr, lr, #0
        and     lr, lr, #0x7F
        add     r0, r8, lr, lsl #23
        b       LBRZ15
LBRZ26:
        mvn     r0, #5
        add     sp, sp, #0x5C
        ldmia   sp!, {r4 - r11, pc}
LBRZ27:
        mvn     r0, #7
        add     sp, sp, #0x5C
        ldmia   sp!, {r4 - r11, pc}
LBRZ_ownsIIRBQ32f_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x70
        ldr     r12, [r3, #0x30]
        ldr     lr, [r3, #0x28]
        ldr     r10, [r3, #0xC]
        ldr     r3, [r3, #0x10]
        ldr     r4, [sp, #0x94]
        str     r0, [sp, #0x24]
        cmp     r2, #0
        str     r3, [sp, #0x2C]
        str     r2, [sp, #0x28]
        add     r0, r4, r12
        ble     LBRZ34
        add     r2, lr, lr, lsl #2
        sub     r3, r12, #1
        mov     r7, r2, lsl #1
        mov     r2, #1
        mov     r11, r0, asr #31
        mov     r3, r2, lsl r3
        str     r11, [sp, #0xC]
        add     r11, r10, #2
        sub     r3, r3, #1
        str     r11, [sp, #0x10]
        add     r11, r10, #6
        str     r3, [sp, #4]
        sub     r3, r0, #1
        mov     r4, lr, lsl #4
        str     r11, [sp, #8]
        add     r11, r10, #4
        mov     r3, r2, lsl r3
        str     r11, [sp, #0x18]
        add     r11, r10, #8
        sub     r2, r3, #1
        sub     r9, r4, #8
        sub     r5, r4, #0x10
        mvn     r3, #0
        sub     r4, r7, #6
        str     r11, [sp, #0x14]
        add     r11, r3, #2, 18
        sub     r8, r7, #8
        str     r4, [sp]
        str     r11, [sp, #0x1C]
        ldr     r11, [sp, #0x2C]
        sub     r6, r7, #2
        sub     r4, r7, #4
        str     r8, [sp, #0x20]
        sub     lr, lr, #1
        sub     r7, r7, #0xA
        mov     r8, r12, asr #31
        str     r3, [sp, #0x58]
        str     r2, [sp, #0x54]
        str     r8, [sp, #0x60]
        str     r7, [sp, #0x50]
        str     r4, [sp, #0x4C]
        str     r6, [sp, #0x48]
        str     lr, [sp, #0x3C]
        str     r0, [sp, #0x38]
        str     r12, [sp, #0x64]
        str     r1, [sp, #0x30]
LBRZ28:
        ldr     r0, [sp, #0x24]
        ldr     r1, [sp, #0x3C]
        ldrsh   r6, [r0], #2
        str     r0, [sp, #0x24]
        cmp     r1, #0
        ble     LBRZ31
        ldr     r1, [sp, #0x10]
        ldr     r0, [sp, #8]
        ldr     r3, [sp, #0x18]
        ldr     r12, [sp, #0x3C]
        ldr     r4, [sp, #0x14]
        mov     r7, r10
        sub     r2, r11, #4
        str     r5, [sp, #0x44]
        str     r9, [sp, #0x40]
        str     r10, [sp, #0x34]
        sub     r8, r11, #0xC
        str     r12, [sp, #0x68]
        str     r3, [sp, #0x5C]
        mov     r5, r0
        mov     r9, r1
        mov     r10, r2
LBRZ29:
        ldrsh   r3, [r7], #0xA
        mov     r11, r6
        ldr     r12, [r8, #0xC]
        mul     r3, r11, r3
        ldr     lr, [r8, #0x10]
        ldr     r2, [sp, #0x64]
        adds    r6, r3, r12
        adc     r1, lr, r3, asr #31
        ldr     r3, [sp, #0x60]
        str     r1, [sp, #0x6C]
        mov     r0, r6
        bl      __ashrdi3
        ldr     r3, [sp, #4]
        ldr     r12, [sp, #0x6C]
        ldr     r2, [sp, #0x64]
        adds    r6, r3, r6
        adc     r3, r12, r3, asr #31
        and     r0, r0, #1
        adds    r0, r6, r0
        adc     r1, r3, #0
        ldr     r3, [sp, #0x60]
        bl      __ashrdi3
        ldr     r3, [sp, #0x1C]
        subs    r3, r0, r3
        sbcs    r12, r1, #0
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        mvnne   r3, #0
        addne   r6, r3, #2, 18
        bne     LBRZ30
        mvn     r3, #0
        cmp     r0, r3, lsl #15
        ldr     r3, [sp, #0x58]
        sbcs    r1, r1, r3
        movge   r0, r0, lsl #16
        movge   r6, r0, asr #16
        mvnlt   r3, #0
        movlt   r6, r3, lsl #15
LBRZ30:
        ldrsh   r0, [r5], #0xA
        ldrsh   lr, [r9], #0xA
        ldr     r3, [r10, #0xC]
        ldr     r12, [r10, #0x10]
        rsb     r0, r0, #0
        mul     r0, r0, r6
        mla     r0, r11, lr, r0
        adds    r3, r3, r0
        str     r3, [r8, #0xC]
        adc     r0, r12, r0, asr #31
        str     r0, [r8, #0x10]!
        ldr     lr, [sp, #0x5C]
        ldrsh   r12, [r4], #0xA
        ldrsh   r3, [lr], #0xA
        str     lr, [sp, #0x5C]
        rsb     r12, r12, #0
        mul     lr, r12, r6
        ldr     r12, [sp, #0x68]
        mla     lr, r11, r3, lr
        subs    r12, r12, #1
        str     r12, [sp, #0x68]
        mov     r3, lr, asr #31
        str     r3, [r10, #0x10]
        str     lr, [r10, #0xC]
        add     r10, r10, #0x10
        bne     LBRZ29
        ldr     r5, [sp, #0x44]
        ldr     r9, [sp, #0x40]
        ldr     r11, [sp, #0x2C]
        ldr     r10, [sp, #0x34]
LBRZ31:
        ldr     r0, [sp, #0x50]
        ldr     r8, [sp, #0x60]
        add     r2, r11, r5
        ldrsh   r1, [r0, +r10]
        ldr     r12, [r2, #4]
        ldr     r0, [r5, +r11]
        ldr     r2, [sp, #0x64]
        mul     r1, r1, r6
        mov     r3, r8
        adds    r4, r0, r1
        mov     r0, r4
        adc     r7, r12, r1, asr #31
        mov     r1, r7
        bl      __ashrdi3
        ldr     r12, [sp, #4]
        and     r0, r0, #1
        mov     r3, r8
        adds    r2, r4, r12
        adc     r12, r7, r12, asr #31
        adds    r0, r2, r0
        ldr     r2, [sp, #0x64]
        adc     r1, r12, #0
        bl      __ashrdi3
        ldr     r2, [sp, #0x1C]
        subs    r2, r0, r2
        sbcs    r3, r1, #0
        movlt   r2, #0
        movlt   r3, #0
        orrs    r3, r2, r3
        mvnne   r2, #0
        addne   r8, r2, #2, 18
        bne     LBRZ32
        mvn     r2, #0
        cmp     r0, r2, lsl #15
        ldr     r2, [sp, #0x58]
        sbcs    r1, r1, r2
        movge   r0, r0, lsl #16
        movge   r8, r0, asr #16
        mvnlt   r2, #0
        movlt   r8, r2, lsl #15
LBRZ32:
        mov     r0, r4
        mov     r1, r7
        ldr     r2, [sp, #0x38]
        ldr     r3, [sp, #0xC]
        bl      __ashrdi3
        ldr     r2, [sp, #0x54]
        ldr     r3, [sp, #0xC]
        adds    r4, r4, r2
        adc     r2, r7, r2, asr #31
        and     r0, r0, #1
        adds    r0, r4, r0
        adc     r1, r2, #0
        ldr     r2, [sp, #0x38]
        bl      __ashrdi3
        ldr     r2, [sp, #0x1C]
        subs    r2, r0, r2
        sbcs    r3, r1, #0
        movlt   r2, #0
        movlt   r3, #0
        orrs    r3, r2, r3
        mvnne   r0, #0
        addne   r0, r0, #2, 18
        bne     LBRZ33
        mvn     r2, #0
        cmp     r0, r2, lsl #15
        ldr     r2, [sp, #0x58]
        sbcs    r1, r1, r2
        movge   r0, r0, lsl #16
        movge   r0, r0, asr #16
        mvnlt   r0, #0
        movlt   r0, r0, lsl #15
LBRZ33:
        ldr     r1, [sp, #0x30]
        add     r12, r11, r5
        add     lr, r9, r11
        strh    r0, [r1], #2
        ldr     r0, [sp, #0x4C]
        ldr     r2, [r11, +r9]
        ldrsh   r3, [r0, +r10]
        ldr     r0, [sp, #0x20]
        rsb     r3, r3, #0
        mul     r4, r3, r8
        ldr     r3, [lr, #4]
        ldrsh   r0, [r0, +r10]
        str     r1, [sp, #0x30]
        mla     r4, r0, r6, r4
        adds    r2, r2, r4
        str     r2, [r5, +r11]
        adc     r4, r3, r4, asr #31
        str     r4, [r12, #4]
        ldr     r0, [sp, #0x48]
        ldrsh   r2, [r10, +r0]
        ldr     r0, [sp]
        ldrsh   r1, [r0, +r10]
        ldr     r0, [sp, #0x28]
        rsb     r2, r2, #0
        mul     r8, r2, r8
        subs    r0, r0, #1
        str     r0, [sp, #0x28]
        mla     r8, r1, r6, r8
        mov     r1, r8, asr #31
        str     r8, [r11, +r9]
        str     r1, [lr, #4]
        bne     LBRZ28
LBRZ34:
        mov     r0, #0
        add     sp, sp, #0x70
        ldmia   sp!, {r4 - r11, pc}
LBRZ_ownsIIRAR32f_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x84
        ldr     r6, [r3, #0x28]
        ldr     r12, [r3, #0xC]
        ldr     r5, [r3, #0x30]
        ldr     r10, [r3, #0x10]
        ldr     r4, [sp, #0xA8]
        mov     r3, r6, lsl #1
        add     lr, r12, r3
        str     r0, [sp, #0x24]
        cmp     r6, #1
        mov     r8, r1
        mov     r9, r2
        add     r4, r4, r5
        mvn     r11, #0
        add     r7, lr, #2
        add     r0, r12, #2
        ble     LBRZ42
        cmp     r9, #0
        ble     LBRZ48
        sub     r3, r3, #2
        str     r3, [sp, #0x2C]
        sub     r3, r5, #1
        mov     lr, #1
        mov     r3, lr, lsl r3
        sub     r3, r3, #1
        sub     r1, r4, #1
        str     r3, [sp, #0x10]
        mov     r3, r5, asr #31
        mov     r1, lr, lsl r1
        mov     lr, r6, lsl #3
        str     r3, [sp, #0x28]
        mov     r2, #0
        sub     r3, r6, #1
        sub     lr, lr, #8
        str     r2, [sp]
        str     r3, [sp, #0xC]
        str     lr, [sp, #0x20]
        mov     r2, r4, asr #31
        str     r8, [sp, #0x14]
        str     r4, [sp, #0x48]
        str     r7, [sp, #0x3C]
        ldr     r7, [sp, #0x20]
        ldr     r8, [sp, #0xC]
        ldr     r4, [sp, #0x28]
        sub     r1, r1, #1
        add     r3, r10, #8
        sub     r6, r6, #6
        add     lr, r11, #2, 18
        str     r2, [sp, #8]
        str     lr, [sp, #0x50]
        str     r6, [sp, #0x58]
        str     r3, [sp, #0x30]
        str     r1, [sp, #0x4C]
        str     r0, [sp, #0x38]
        str     r12, [sp, #4]
        str     r9, [sp, #0x44]
        str     r11, [sp, #0x18]
LBRZ35:
        ldr     r6, [sp, #0x24]
        ldr     r0, [sp, #4]
        mov     r2, r5
        ldrsh   r12, [r6], #2
        mov     r3, r4
        str     r12, [sp, #0x34]
        ldrsh   lr, [r0]
        ldr     r0, [r10]
        ldr     r1, [r10, #4]
        mul     r12, lr, r12
        str     r6, [sp, #0x24]
        adds    r9, r0, r12
        mov     r0, r9
        adc     r11, r1, r12, asr #31
        mov     r1, r11
        bl      __ashrdi3
        ldr     lr, [sp, #0x10]
        and     r0, r0, #1
        mov     r2, r5
        adds    r12, r9, lr
        adc     lr, r11, lr, asr #31
        adds    r0, r12, r0
        adc     r1, lr, #0
        mov     r3, r4
        bl      __ashrdi3
        ldr     r12, [sp, #0x50]
        subs    r12, r0, r12
        sbcs    lr, r1, #0
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        mvnne   r12, #0
        addne   r6, r12, #2, 18
        bne     LBRZ36
        mvn     r12, #0
        cmp     r0, r12, lsl #15
        ldr     r12, [sp, #0x18]
        sbcs    r1, r1, r12
        movge   r0, r0, lsl #16
        movge   r6, r0, asr #16
        mvnlt   r12, #0
        movlt   r6, r12, lsl #15
LBRZ36:
        mov     r0, r9
        mov     r1, r11
        ldr     r2, [sp, #0x48]
        ldr     r3, [sp, #8]
        bl      __ashrdi3
        ldr     r12, [sp, #0x4C]
        ldr     r2, [sp, #0x48]
        ldr     r3, [sp, #8]
        adds    r9, r12, r9
        and     r0, r0, #1
        adc     r12, r11, r12, asr #31
        adds    r0, r9, r0
        adc     r1, r12, #0
        bl      __ashrdi3
        ldr     r12, [sp, #0x50]
        subs    r12, r0, r12
        sbcs    lr, r1, #0
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        mvnne   r0, #0
        addne   r0, r0, #2, 18
        bne     LBRZ37
        mvn     r12, #0
        cmp     r0, r12, lsl #15
        ldr     r12, [sp, #0x18]
        sbcs    r1, r1, r12
        movge   r0, r0, lsl #16
        movge   r0, r0, asr #16
        mvnlt   r0, #0
        movlt   r0, r0, lsl #15
LBRZ37:
        ldr     r1, [sp, #0x14]
        cmp     r8, #0
        strh    r0, [r1], #2
        str     r1, [sp, #0x14]
        ble     LBRZ41
        cmp     r8, #5
        movlt   r12, #0
        rsblt   r1, r6, #0
        blt     LBRZ39
        ldr     r9, [sp, #0x38]
        ldr     r11, [sp, #0x3C]
        sub     lr, r10, #0x1C
        str     lr, [sp, #0x64]
        str     r5, [sp, #0x40]
        ldr     r3, [sp, #0x34]
        ldr     lr, [sp, #0x30]
        ldr     r4, [sp, #0x38]
        ldr     r5, [sp, #0x3C]
        mov     r12, #0
        rsb     r1, r6, #0
        sub     r0, r10, #0x14
        str     r11, [sp, #0x5C]
        str     r9, [sp, #0x60]
        str     r6, [sp, #0x54]
LBRZ38:
        ldr     r2, [sp, #0x5C]
        ldr     r6, [sp, #0x60]
        ldr     r7, [r0, #0x1C]
        ldrsh   r2, [r2]
        ldrsh   r6, [r6]
        str     r7, [sp, #0x68]
        ldr     r7, [r0, #0x20]!
        mul     r8, r1, r2
        ldr     r2, [sp, #0x60]
        mla     r9, r3, r6, r8
        add     r6, r12, #2
        add     r2, r2, #8
        str     r2, [sp, #0x60]
        ldr     r2, [sp, #0x5C]
        add     r2, r2, #8
        str     r2, [sp, #0x5C]
        add     r2, r12, #1
        mov     r11, r2, lsl #1
        add     r8, lr, r2, lsl #3
        str     r8, [sp, #0x6C]
        add     r8, r10, r2, lsl #3
        str     r8, [sp, #0x70]
        ldr     r8, [sp, #0x68]
        adds    r8, r9, r8
        adc     r9, r7, r9, asr #31
        ldr     r7, [sp, #0x64]
        str     r8, [r7, #0x1C]
        str     r9, [r7, #0x20]
        ldrsh   r7, [r5, +r11]
        ldrsh   r11, [r4, +r11]
        ldr     r8, [lr, +r2, lsl #3]
        add     r9, lr, r6, lsl #3
        str     r8, [sp, #0x68]
        mul     r8, r1, r7
        ldr     r7, [sp, #0x6C]
        ldr     r7, [r7, #4]
        str     r9, [sp, #0x74]
        mla     r11, r3, r11, r8
        add     r9, r10, r6, lsl #3
        str     r9, [sp, #0x78]
        ldr     r9, [sp, #0x64]
        str     r7, [sp, #0x6C]
        add     r8, r12, #3
        mov     r7, r6, lsl #1
        add     r9, r9, #0x20
        str     r9, [sp, #0x64]
        mov     r9, r8, lsl #1
        str     r9, [sp, #0x7C]
        add     r9, lr, r8, lsl #3
        str     r9, [sp, #0x80]
        ldr     r9, [sp, #0x68]
        add     r12, r12, #4
        adds    r9, r11, r9
        str     r9, [r10, +r2, lsl #3]
        ldr     r2, [sp, #0x6C]
        adc     r11, r2, r11, asr #31
        ldr     r2, [sp, #0x70]
        str     r11, [r2, #4]
        ldrsh   r2, [r5, +r7]
        ldr     r11, [sp, #0x74]
        ldrsh   r7, [r4, +r7]
        mul     r2, r1, r2
        ldr     r9, [lr, +r6, lsl #3]
        ldr     r11, [r11, #4]
        str     r11, [sp, #0x74]
        add     r11, r10, r8, lsl #3
        mla     r2, r3, r7, r2
        str     r11, [sp, #0x70]
        adds    r9, r2, r9
        str     r9, [r10, +r6, lsl #3]
        ldr     r6, [sp, #0x74]
        adc     r2, r6, r2, asr #31
        ldr     r6, [sp, #0x78]
        str     r2, [r6, #4]
        ldr     r6, [sp, #0x7C]
        ldr     r7, [lr, +r8, lsl #3]
        ldrsh   r2, [r5, +r6]
        ldrsh   r6, [r4, +r6]
        mul     r9, r1, r2
        ldr     r2, [sp, #0x80]
        mla     r9, r3, r6, r9
        ldr     r2, [r2, #4]
        adds    r7, r9, r7
        str     r7, [r10, +r8, lsl #3]
        adc     r9, r2, r9, asr #31
        ldr     r2, [sp, #0x58]
        cmp     r12, r2
        ldr     r2, [sp, #0x70]
        str     r9, [r2, #4]
        ble     LBRZ38
        ldr     r6, [sp, #0x54]
        ldr     r7, [sp, #0x20]
        ldr     r8, [sp, #0xC]
        ldr     r4, [sp, #0x28]
        ldr     r5, [sp, #0x40]
LBRZ39:
        ldr     lr, [sp, #0x30]
        mov     r0, r12, lsl #3
        sub     r0, r0, #4
        add     r9, r0, lr
        add     r11, r0, r10
        ldr     r0, [sp, #0x38]
        str     r10, [sp, #0x1C]
        str     r5, [sp, #0x40]
        add     lr, r0, r12, lsl #1
        ldr     r0, [sp, #0x3C]
        ldr     r5, [sp, #0x34]
        add     r0, r0, r12, lsl #1
LBRZ40:
        ldrsh   r3, [r0], #2
        ldrsh   r2, [lr], #2
        ldr     r4, [r9, #4]
        mul     r10, r1, r3
        ldr     r3, [r9, #8]!
        mla     r10, r5, r2, r10
        add     r12, r12, #1
        adds    r4, r10, r4
        str     r4, [r11, #4]
        adc     r10, r3, r10, asr #31
        str     r10, [r11, #8]!
        cmp     r12, r8
        blt     LBRZ40
        ldr     r4, [sp, #0x28]
        ldr     r10, [sp, #0x1C]
        ldr     r5, [sp, #0x40]
LBRZ41:
        ldr     r0, [sp, #0x2C]
        ldr     r1, [sp, #0x3C]
        ldr     lr, [sp, #0x44]
        ldrsh   r12, [r1, +r0]
        ldr     r1, [sp, #0x38]
        rsb     r12, r12, #0
        mul     r6, r12, r6
        ldr     r12, [sp]
        ldrsh   r0, [r1, +r0]
        add     r1, r7, r10
        add     r12, r12, #1
        str     r12, [sp]
        cmp     r12, lr
        ldr     r12, [sp, #0x34]
        mla     r6, r0, r12, r6
        mov     r0, r6, asr #31
        str     r6, [r10, +r7]
        str     r0, [r1, #4]
        blt     LBRZ35
        mov     r0, #0
        add     sp, sp, #0x84
        ldmia   sp!, {r4 - r11, pc}
LBRZ42:
        cmp     r6, #0
        mov     r3, #1
        ble     LBRZ49
        cmp     r9, #0
        ble     LBRZ48
        ldr     r6, [r10, #4]
        ldr     r0, [r10]
        mov     r7, r4, asr #31
        str     r6, [sp, #8]
        sub     r6, r4, #1
        mov     r6, r3, lsl r6
        sub     r1, r6, #1
        sub     r6, r5, #1
        mov     r6, r3, lsl r6
        add     r3, r11, #2, 18
        str     r3, [sp, #0x28]
        str     r1, [sp, #0xC]
        str     r8, [sp, #0x14]
        ldr     r8, [sp, #0x28]
        ldr     r1, [sp, #8]
        sub     r2, r6, #1
        mov     r6, r5, asr #31
        str     r2, [sp]
        str     r10, [sp, #0x1C]
        str     lr, [sp, #0x20]
        str     r12, [sp, #4]
        str     r11, [sp, #0x18]
LBRZ43:
        ldr     r10, [sp, #0x24]
        ldr     lr, [sp, #4]
        mov     r2, r5
        ldrsh   r12, [r10], #2
        mov     r3, r6
        str     r12, [sp, #0x10]
        ldrsh   lr, [lr]
        str     r10, [sp, #0x24]
        mul     r12, lr, r12
        adds    r10, r0, r12
        mov     r0, r10
        adc     r11, r1, r12, asr #31
        mov     r1, r11
        bl      __ashrdi3
        ldr     lr, [sp]
        and     r0, r0, #1
        mov     r2, r5
        adds    r12, r10, lr
        adc     lr, r11, lr, asr #31
        adds    r0, r12, r0
        adc     r1, lr, #0
        mov     r3, r6
        bl      __ashrdi3
        subs    r12, r0, r8
        sbcs    lr, r1, #0
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        bne     LBRZ45
        mvn     r12, #0
        cmp     r0, r12, lsl #15
        ldr     r12, [sp, #0x18]
        sbcs    r1, r1, r12
        bge     LBRZ44
        mvn     r12, #0
        mov     r12, r12, lsl #15
        str     r12, [sp, #8]
        b       LBRZ46
LBRZ44:
        mov     r0, r0, lsl #16
        mov     r12, r0, asr #16
        str     r12, [sp, #8]
        b       LBRZ46
        .long   0x49493036
        .long   LBRZ__2il0floatpacket.1
        .long   LBRZ__2il0floatpacket.2
        .long   LBRZ__2il0floatpacket.3
        .long   LBRZ__2il0floatpacket.4
        .long   LBRZ__2il0floatpacket.5
LBRZ45:
        mvn     r12, #0
        add     r12, r12, #2, 18
        str     r12, [sp, #8]
LBRZ46:
        mov     r0, r10
        mov     r1, r11
        mov     r2, r4
        mov     r3, r7
        bl      __ashrdi3
        ldr     r12, [sp, #0xC]
        and     r0, r0, #1
        adds    r10, r12, r10
        adc     r12, r11, r12, asr #31
        adds    r0, r10, r0
        adc     r1, r12, #0
        mov     r2, r4
        mov     r3, r7
        bl      __ashrdi3
        subs    r12, r0, r8
        sbcs    lr, r1, #0
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        mvnne   r0, #0
        addne   r0, r0, #2, 18
        bne     LBRZ47
        mvn     r12, #0
        cmp     r0, r12, lsl #15
        ldr     r12, [sp, #0x18]
        sbcs    r1, r1, r12
        movge   r0, r0, lsl #16
        movge   r0, r0, asr #16
        mvnlt   r0, #0
        movlt   r0, r0, lsl #15
LBRZ47:
        ldr     r1, [sp, #0x14]
        subs    r9, r9, #1
        strh    r0, [r1], #2
        ldr     r0, [sp, #0x20]
        ldrsh   r12, [r0, #2]
        ldr     r0, [sp, #4]
        ldrsh   r0, [r0, #2]
        str     r1, [sp, #0x14]
        ldr     r1, [sp, #8]
        rsb     r12, r12, #0
        mul     r12, r12, r1
        ldr     r1, [sp, #0x10]
        mla     r0, r0, r1, r12
        ldr     r12, [sp, #0x1C]
        mov     r1, r0, asr #31
        str     r1, [r12, #4]
        str     r0, [r12]
        bne     LBRZ43
LBRZ48:
        mov     r0, #0
        add     sp, sp, #0x84
        ldmia   sp!, {r4 - r11, pc}
LBRZ49:
        cmp     r9, #0
        ble     LBRZ48
        sub     r0, r4, #1
        ldr     r10, [sp, #0x24]
        mov     r0, r3, lsl r0
        sub     r0, r0, #1
        add     lr, r11, #2, 18
        mov     r5, r4, asr #31
        str     lr, [sp, #0x60]
        str     r0, [sp, #0x64]
        str     r12, [sp, #4]
LBRZ50:
        ldr     r12, [sp, #4]
        ldrsh   r0, [r10], #2
        ldrsh   r12, [r12]
        mov     r2, r4
        mov     r3, r5
        mul     r6, r12, r0
        mov     r7, r6, asr #31
        mov     r1, r7
        mov     r0, r6
        bl      __ashrdi3
        ldr     r12, [sp, #0x64]
        and     r0, r0, #1
        adds    r6, r6, r12
        adc     r7, r7, r12, asr #31
        adds    r0, r6, r0
        adc     r1, r7, #0
        mov     r3, r5
        mov     r2, r4
        bl      __ashrdi3
        ldr     r12, [sp, #0x60]
        subs    r12, r0, r12
        sbcs    lr, r1, #0
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        addne   r0, r11, #2, 18
        bne     LBRZ51
        cmp     r0, r11, lsl #15
        sbcs    r1, r1, r11
        movge   r0, r0, lsl #16
        movge   r0, r0, asr #16
        movlt   r0, r11, lsl #15
LBRZ51:
        strh    r0, [r8], #2
        subs    r9, r9, #1
        bne     LBRZ50
        mov     r0, #0
        add     sp, sp, #0x84
        ldmia   sp!, {r4 - r11, pc}
LBRZ_refsIIRAR32f_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x80
        ldr     r10, [r3, #4]
        ldr     r12, [pc, #0xCDC]
        ldr     r11, [r3, #0x28]
        ldr     r7, [r3, #8]
        ldr     r3, [r10]
        ldr     r12, [r12]
        ldr     lr, [sp, #0xA4]
        str     r3, [sp, #0x54]
        add     r6, r10, r11, lsl #2
        str     r12, [sp, #0x7C]
        cmp     lr, #0
        mov     r5, r1
        add     r9, r6, #4
        add     r8, r10, #4
        andge   lr, lr, #0x7F
        subge   r4, r12, lr, lsl #23
        blt     LBRZ89
LBRZ52:
        cmp     r11, #1
        str     r4, [sp, #0x7C]
        ble     LBRZ67
        bic     r3, r2, #1
        cmp     r3, #0
        ble     LBRZ66
        ldr     r1, [pc, #0xC88]
        ldr     r12, [pc, #0xC88]
        ldr     lr, [pc, #0xC88]
        ldr     r1, [r1]
        str     r1, [sp, #0x24]
        ldr     r1, [pc, #0xC80]
        ldr     r1, [r1]
        str     r1, [sp, #0x28]
        ldr     r12, [r12]
        mov     r1, r11, lsl #2
        str     r12, [sp, #0x2C]
        ldr     lr, [lr]
        sub     r12, r1, #8
        sub     r1, r1, #4
        str     r1, [sp, #0x14]
        sub     r1, r11, #2
        str     r1, [sp, #8]
        sub     r1, r11, #6
        str     r1, [sp, #4]
        add     r1, r0, #2
        str     r1, [sp, #0x18]
        add     r1, r5, #2
        str     r4, [sp, #0x58]
        ldr     r4, [sp, #0x14]
        str     lr, [sp, #0x30]
        str     r1, [sp, #0x20]
        mov     lr, #0
        mov     r1, r5
        str     r0, [sp, #0x1C]
        str     r0, [sp, #0x6C]
        str     r1, [sp, #0x68]
        str     r12, [sp, #0x64]
        str     lr, [sp, #0x60]
        str     r3, [sp, #0x5C]
        str     r11, [sp, #0x50]
        str     r2, [sp, #0xC]
        str     r5, [sp, #0x4C]
LBRZ53:
        ldr     r1, [sp, #0x1C]
        ldrsh   r0, [r1], #4
        str     r1, [sp, #0x1C]
        bl      __floatsisf
        ldr     r2, [sp, #0x18]
        mov     r11, r0
        ldrsh   r1, [r2], #4
        str     r11, [sp, #0x74]
        str     r2, [sp, #0x18]
        mov     r0, r1
        bl      __floatsisf
        str     r0, [sp, #0x38]
        ldr     r0, [sp, #0x54]
        mov     r1, r11
        bl      __mulsf3
        ldr     r1, [r7]
        bl      __addsf3
        ldr     r1, [sp, #0x38]
        mov     r5, r0
        ldr     r0, [sp, #0x54]
        str     r5, [sp, #0x70]
        bl      __mulsf3
        ldr     r2, [r10, #4]
        ldr     r3, [r7, #4]
        str     r0, [sp, #0x34]
        mov     r1, r11
        str     r3, [sp, #0x3C]
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [sp, #0x3C]
        bl      __addsf3
        ldr     r2, [r6, #4]
        mov     r11, r0
        mov     r1, r5
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        ldr     r1, [sp, #0x34]
        bl      __addsf3
        ldr     r1, [sp, #0x58]
        str     r0, [sp, #0x3C]
        mov     r0, r5
        bl      __mulsf3
        ldr     r1, [sp, #0x24]
        mov     r5, r0
        bl      __gtsf2
        cmp     r0, #0
        bgt     LBRZ56
        mov     r0, r5
        ldr     r1, [sp, #0x28]
        bl      __ltsf2
        cmp     r0, #0
        movlt   r0, #0
        sublt   r0, r0, #2, 18
        blt     LBRZ57
        mov     r0, r5
        ldr     r1, [sp, #0x2C]
        bl      __gtsf2
        cmp     r0, #0
        ble     LBRZ54
        ldr     r0, [sp, #0x30]
        mov     r1, r5
        bl      __addsf3
        mov     r5, r0
LBRZ54:
        mov     r0, r5
        ldr     r1, [sp, #0x2C]
        bl      __ltsf2
        cmp     r0, #0
        bge     LBRZ55
        mov     r0, r5
        ldr     r1, [sp, #0x30]
        bl      __subsf3
        mov     r5, r0
LBRZ55:
        mov     r0, r5
        bl      __fixsfsi
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LBRZ57
LBRZ56:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r0, r0
LBRZ57:
        ldr     r2, [sp, #0x68]
        strh    r0, [r2], #4
        ldr     r5, [r7, #4]
        ldr     r1, [sp, #0x74]
        ldr     r0, [r10, #4]
        str     r2, [sp, #0x68]
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r1, [sp, #0x70]
        ldr     r2, [r6, #4]
        mov     r5, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r5
        bl      __subsf3
        ldr     r1, [sp, #0x34]
        bl      __addsf3
        ldr     r1, [sp, #0x58]
        bl      __mulsf3
        ldr     r1, [sp, #0x24]
        mov     r5, r0
        bl      __gtsf2
        cmp     r0, #0
        bgt     LBRZ60
        mov     r0, r5
        ldr     r1, [sp, #0x28]
        bl      __ltsf2
        cmp     r0, #0
        movlt   r0, #0
        sublt   r1, r0, #2, 18
        blt     LBRZ61
        mov     r0, r5
        ldr     r1, [sp, #0x2C]
        bl      __gtsf2
        cmp     r0, #0
        ble     LBRZ58
        ldr     r0, [sp, #0x30]
        mov     r1, r5
        bl      __addsf3
        mov     r5, r0
LBRZ58:
        mov     r0, r5
        ldr     r1, [sp, #0x2C]
        bl      __ltsf2
        cmp     r0, #0
        bge     LBRZ59
        mov     r0, r5
        ldr     r1, [sp, #0x30]
        bl      __subsf3
        mov     r5, r0
LBRZ59:
        mov     r0, r5
        bl      __fixsfsi
        mov     r0, r0, lsl #16
        mov     r1, r0, asr #16
        b       LBRZ61
LBRZ60:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r1, r0
LBRZ61:
        ldr     r0, [sp, #0x20]
        strh    r1, [r0], #4
        ldr     r1, [sp, #8]
        str     r0, [sp, #0x20]
        cmp     r1, #0
        ble     LBRZ65
        ldr     r0, [sp, #8]
        cmp     r0, #4
        movlt   r0, #0
        blt     LBRZ63
        add     r3, r6, #8
        add     r1, r6, #0xC
        str     r6, [sp, #0x40]
        ldr     r4, [sp, #0x3C]
        ldr     r6, [sp, #0x38]
        add     r12, r10, #8
        add     r2, r10, #0xC
        mov     r0, #0
        add     r11, r7, #0xC
        add     r5, r7, #4
        str     r7, [sp]
        str     r8, [sp, #0x48]
        str     r9, [sp, #0x44]
        str     r10, [sp, #0x10]
        str     r0, [sp, #0x34]
        mov     r7, r1
        mov     r8, r2
        mov     r9, r3
        mov     r10, r12
LBRZ62:
        ldr     lr, [sp, #0x34]
        ldr     r0, [r10, #-4]
        mov     r1, r6
        add     lr, lr, #3
        str     lr, [sp, #0x34]
        bl      __mulsf3
        ldr     r2, [r9, #-4]
        str     r0, [sp, #0x78]
        mov     r0, r2
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x78]
        bl      __subsf3
        ldr     r2, [r8, #-4]
        ldr     r1, [sp, #0x74]
        str     r0, [sp, #0x78]
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [sp, #0x78]
        bl      __addsf3
        ldr     r2, [r7, #-4]
        ldr     r1, [sp, #0x70]
        str     r0, [sp, #0x78]
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x78]
        bl      __subsf3
        ldr     r1, [r11, #-4]
        bl      __addsf3
        str     r0, [r5, #-4]
        ldr     r0, [r10]
        mov     r1, r6
        bl      __mulsf3
        ldr     r2, [r9]
        str     r0, [sp, #0x78]
        mov     r0, r2
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x78]
        bl      __subsf3
        ldr     r2, [r8]
        ldr     r1, [sp, #0x74]
        str     r0, [sp, #0x78]
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [sp, #0x78]
        bl      __addsf3
        ldr     r2, [r7]
        ldr     r1, [sp, #0x70]
        str     r0, [sp, #0x78]
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x78]
        bl      __subsf3
        ldr     r1, [r11]
        bl      __addsf3
        str     r0, [r5]
        ldr     r0, [r10, #4]
        mov     r1, r6
        add     r10, r10, #0xC
        bl      __mulsf3
        ldr     r2, [r9, #4]
        str     r0, [sp, #0x78]
        mov     r0, r2
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x78]
        add     r9, r9, #0xC
        bl      __subsf3
        ldr     r2, [r8, #4]
        ldr     r1, [sp, #0x74]
        str     r0, [sp, #0x78]
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [sp, #0x78]
        bl      __addsf3
        ldr     r2, [r7, #4]
        ldr     r1, [sp, #0x70]
        str     r0, [sp, #0x78]
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x78]
        add     r8, r8, #0xC
        bl      __subsf3
        ldr     r1, [r11, #4]
        bl      __addsf3
        str     r0, [r5, #4]
        ldr     lr, [sp, #4]
        ldr     r0, [sp, #0x34]
        add     r7, r7, #0xC
        add     r11, r11, #0xC
        add     r5, r5, #0xC
        cmp     r0, lr
        ble     LBRZ62
        ldr     r0, [sp, #0x34]
        ldr     r4, [sp, #0x14]
        ldr     r7, [sp]
        ldr     r8, [sp, #0x48]
        ldr     r9, [sp, #0x44]
        ldr     r6, [sp, #0x40]
        ldr     r10, [sp, #0x10]
LBRZ63:
        mov     r12, #8
        add     lr, r6, r0, lsl #2
        add     r1, r10, r0, lsl #2
        add     r11, r7, r0, lsl #2
        add     r3, r8, r0, lsl #2
        add     r2, r9, r0, lsl #2
        add     r1, r12, r1
        add     lr, r12, lr
        str     r7, [sp]
        str     r8, [sp, #0x48]
        str     r9, [sp, #0x44]
        str     r6, [sp, #0x40]
        add     r5, r12, r11
        str     r10, [sp, #0x10]
        mov     r9, r0
        mov     r6, r1
        mov     r7, r2
        mov     r8, r3
        mov     r4, lr
LBRZ64:
        ldr     r0, [r8], #4
        ldr     r1, [sp, #0x38]
        add     r9, r9, #1
        bl      __mulsf3
        ldr     r2, [r7], #4
        ldr     r1, [sp, #0x3C]
        mov     r10, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r10
        bl      __subsf3
        ldr     r1, [sp, #0x74]
        ldr     r2, [r6], #4
        mov     r10, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r1, [sp, #0x70]
        ldr     r2, [r4], #4
        mov     r10, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r10
        bl      __subsf3
        ldr     r1, [r5], #4
        bl      __addsf3
        str     r0, [r11], #4
        ldr     r12, [sp, #8]
        cmp     r9, r12
        blt     LBRZ64
        ldr     r4, [sp, #0x14]
        ldr     r7, [sp]
        ldr     r8, [sp, #0x48]
        ldr     r9, [sp, #0x44]
        ldr     r6, [sp, #0x40]
        ldr     r10, [sp, #0x10]
LBRZ65:
        ldr     r1, [sp, #0x74]
        ldr     r0, [r4, +r8]
        ldr     r2, [sp, #0x60]
        add     r2, r2, #2
        str     r2, [sp, #0x60]
        bl      __mulsf3
        ldr     r1, [sp, #0x70]
        ldr     r2, [r4, +r9]
        mov     r5, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r5
        bl      __subsf3
        ldr     r11, [sp, #0x64]
        ldr     r1, [sp, #0x38]
        mov     r5, r0
        ldr     r2, [r8, +r11]
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r2, [r9, +r11]
        ldr     r5, [sp, #0x3C]
        str     r0, [sp, #0x78]
        mov     r0, r2
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x78]
        bl      __subsf3
        str     r0, [r11, +r7]
        ldr     r1, [sp, #0x38]
        ldr     r0, [r4, +r8]
        bl      __mulsf3
        ldr     r2, [r4, +r9]
        mov     r11, r0
        mov     r1, r5
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        ldr     r1, [sp, #0x5C]
        ldr     r2, [sp, #0x60]
        str     r0, [r4, +r7]
        cmp     r2, r1
        blt     LBRZ53
        ldr     r0, [sp, #0x6C]
        ldr     r4, [sp, #0x58]
        ldr     r11, [sp, #0x50]
        ldr     r2, [sp, #0xC]
        ldr     r5, [sp, #0x4C]
LBRZ66:
        tst     r2, #1
        beq     LBRZ73
        b       LBRZ74
LBRZ67:
        cmp     r11, #0
        mov     r9, #0
        ble     LBRZ83
        cmp     r2, #0
        ble     LBRZ73
        ldr     r12, [pc, #0x5C0]
        ldr     r8, [r7]
        ldr     r3, [pc, #0x5C4]
        ldr     r12, [r12]
        ldr     r11, [pc, #0x5B4]
        ldr     lr, [pc, #0x5B4]
        str     r7, [sp]
        str     r10, [sp, #0x10]
        mov     r7, r5
        str     r12, [sp, #8]
        str     r2, [sp, #0xC]
        mov     r5, r0
        mov     r10, r6
LBRZ68:
        ldrsh   r0, [r5], #2
        bl      __floatsisf
        ldr     r1, [sp, #0x54]
        mov     r6, r0
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        mov     r8, r0
        mov     r1, r4
        bl      __mulsf3
        ldr     r1, [sp, #8]
        mov     r11, r0
        bl      __gtsf2
        cmp     r0, #0
        bgt     LBRZ71
        ldr     r2, [pc, #0x55C]
        mov     r0, r11
        ldr     r1, [r2]
        bl      __ltsf2
        cmp     r0, #0
        movlt   r2, #0
        sublt   r0, r2, #2, 18
        blt     LBRZ72
        ldr     r2, [pc, #0x534]
        mov     r0, r11
        ldr     r1, [r2]
        str     r1, [sp, #0x14]
        bl      __gtsf2
        cmp     r0, #0
        ble     LBRZ69
        ldr     r2, [pc, #0x51C]
        mov     r1, r11
        ldr     r0, [r2]
        bl      __addsf3
        mov     r11, r0
LBRZ69:
        mov     r0, r11
        ldr     r1, [sp, #0x14]
        bl      __ltsf2
        cmp     r0, #0
        bge     LBRZ70
        ldr     r2, [pc, #0x4F4]
        mov     r0, r11
        ldr     r1, [r2]
        bl      __subsf3
        mov     r11, r0
LBRZ70:
        mov     r0, r11
        bl      __fixsfsi
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LBRZ72
LBRZ71:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r0, r2
LBRZ72:
        strh    r0, [r7], #2
        ldr     r2, [sp, #0x10]
        mov     r1, r6
        ldr     r0, [r2, #4]
        add     r9, r9, #1
        bl      __mulsf3
        ldr     r2, [r10, #4]
        mov     r6, r0
        mov     r1, r8
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r6
        bl      __subsf3
        ldr     r2, [sp, #0xC]
        mov     r8, r0
        cmp     r9, r2
        ldr     r2, [sp]
        str     r8, [r2]
        blt     LBRZ68
LBRZ73:
        mov     r0, #0
        add     sp, sp, #0x80
        ldmia   sp!, {r4 - r11, pc}
LBRZ74:
        mov     r2, r2, lsl #1
        str     r2, [sp, #0x28]
        sub     r0, r0, #2
        ldrsh   r0, [r0, +r2]
        bl      __floatsisf
        str     r0, [sp, #0x74]
        ldr     r2, [r7]
        ldr     r1, [sp, #0x54]
        str     r2, [sp, #0x78]
        bl      __mulsf3
        ldr     r1, [sp, #0x78]
        bl      __addsf3
        str     r0, [sp, #0x20]
        mov     r1, r4
        bl      __mulsf3
        ldr     r2, [pc, #0x420]
        mov     r4, r0
        ldr     r1, [r2]
        bl      __gtsf2
        cmp     r0, #0
        bgt     LBRZ77
        ldr     r2, [pc, #0x414]
        mov     r0, r4
        ldr     r1, [r2]
        bl      __ltsf2
        cmp     r0, #0
        movlt   r0, #0
        sublt   r0, r0, #2, 18
        blt     LBRZ78
        ldr     r2, [pc, #0x3EC]
        mov     r0, r4
        ldr     r1, [r2]
        str     r1, [sp, #0x30]
        bl      __gtsf2
        cmp     r0, #0
        ble     LBRZ75
        ldr     r2, [pc, #0x3D4]
        mov     r1, r4
        ldr     r0, [r2]
        bl      __addsf3
        mov     r4, r0
LBRZ75:
        ldr     r1, [sp, #0x30]
        mov     r0, r4
        bl      __ltsf2
        cmp     r0, #0
        bge     LBRZ76
        ldr     r2, [pc, #0x3AC]
        mov     r0, r4
        ldr     r1, [r2]
        bl      __subsf3
        mov     r4, r0
LBRZ76:
        mov     r0, r4
        bl      __fixsfsi
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LBRZ78
LBRZ77:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r0, r0
LBRZ78:
        ldr     r1, [sp, #0x28]
        sub     r5, r5, #2
        strh    r0, [r5, +r1]
        sub     r0, r11, #1
        cmp     r0, #0
        ble     LBRZ82
        sub     r1, r11, #1
        cmp     r1, #5
        mov     r4, #0
        addlt   r5, r7, #4
        blt     LBRZ80
        add     r5, r7, #4
        add     r1, r10, #8
        add     r2, r6, #8
        add     r10, r7, #8
        mov     r6, r5
        str     r5, [sp, #0x6C]
        str     r7, [sp]
        ldr     r5, [sp, #0x20]
        ldr     r7, [sp, #0x74]
        sub     r3, r11, #6
        str     r8, [sp, #0x48]
        str     r9, [sp, #0x44]
        str     r3, [sp, #0x68]
        str     r0, [sp, #0x70]
        str     r11, [sp, #0x50]
        mov     r9, r1
        mov     r8, r2
LBRZ79:
        ldr     r0, [r9, #-4]
        mov     r1, r7
        add     r4, r4, #4
        bl      __mulsf3
        ldr     r2, [r8, #-4]
        mov     r11, r0
        mov     r1, r5
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        ldr     r1, [r10, #-4]
        bl      __addsf3
        str     r0, [r6, #-4]
        ldr     r0, [r9]
        mov     r1, r7
        bl      __mulsf3
        ldr     r2, [r8]
        mov     r11, r0
        mov     r1, r5
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        ldr     r1, [r10]
        bl      __addsf3
        str     r0, [r6]
        ldr     r0, [r9, #4]
        mov     r1, r7
        bl      __mulsf3
        ldr     r2, [r8, #4]
        mov     r11, r0
        mov     r1, r5
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        ldr     r1, [r10, #4]
        bl      __addsf3
        str     r0, [r6, #4]
        ldr     r0, [r9, #8]
        mov     r1, r7
        add     r9, r9, #0x10
        bl      __mulsf3
        ldr     r2, [r8, #8]
        mov     r11, r0
        mov     r1, r5
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        ldr     r1, [r10, #8]
        bl      __addsf3
        ldr     r3, [sp, #0x68]
        str     r0, [r6, #8]
        cmp     r4, r3
        add     r8, r8, #0x10
        add     r10, r10, #0x10
        add     r6, r6, #0x10
        ble     LBRZ79
        ldr     r5, [sp, #0x6C]
        ldr     r0, [sp, #0x70]
        ldr     r7, [sp]
        ldr     r8, [sp, #0x48]
        ldr     r9, [sp, #0x44]
        ldr     r11, [sp, #0x50]
LBRZ80:
        str     r11, [sp, #0x50]
        ldr     r11, [sp, #0x20]
        add     r1, r8, r4, lsl #2
        add     r10, r9, r4, lsl #2
        str     r8, [sp, #0x48]
        str     r9, [sp, #0x44]
        add     r6, r7, r4, lsl #2
        str     r7, [sp]
        mov     r8, r0
        mov     r9, r1
LBRZ81:
        ldr     r1, [sp, #0x74]
        ldr     r0, [r9], #4
        bl      __mulsf3
        mov     r7, r0
        ldr     r0, [r10], #4
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r7
        bl      __subsf3
        ldr     r1, [r5, +r4, lsl #2]
        bl      __addsf3
        add     r4, r4, #1
        str     r0, [r6], #4
        cmp     r4, r8
        blt     LBRZ81
        ldr     r7, [sp]
        ldr     r8, [sp, #0x48]
        ldr     r9, [sp, #0x44]
        ldr     r11, [sp, #0x50]
LBRZ82:
        ldr     r1, [sp, #0x74]
        mov     r11, r11, lsl #2
        sub     r4, r11, #4
        ldr     r0, [r4, +r8]
        bl      __mulsf3
        ldr     r1, [sp, #0x20]
        ldr     r9, [r4, +r9]
        mov     r5, r0
        mov     r0, r9
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r5
        bl      __subsf3
        str     r0, [r4, +r7]
        mov     r0, #0
        add     sp, sp, #0x80
        ldmia   sp!, {r4 - r11, pc}
LBRZ83:
        cmp     r2, #0
        ble     LBRZ73
        ldr     lr, [pc, #0x124]
        ldr     r3, [pc, #0x12C]
        ldr     r12, [pc, #0x120]
        ldr     r6, [lr]
        ldr     lr, [pc, #0x11C]
        mvn     r8, #0xFF
        bic     r11, r8, #0x7F, 24
        str     r11, [sp, #8]
        ldr     r11, [sp, #0x54]
        mov     r8, r9
        str     r9, [sp, #4]
        mov     r9, r5
        mov     r7, r0
        mov     r10, r2
        mov     r5, r4
LBRZ84:
        ldrsh   r0, [r7], #2
        bl      __floatsisf
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r5
        bl      __mulsf3
        mov     r4, r0
        mov     r1, r6
        bl      __gtsf2
        cmp     r0, #0
        bgt     LBRZ87
        ldr     r3, [pc, #0xC8]
        mov     r0, r4
        ldr     r1, [r3]
        bl      __ltsf2
        cmp     r0, #0
        ldrlt   r3, [sp, #8]
        blt     LBRZ88
        ldr     r3, [pc, #0xA4]
        mov     r0, r4
        ldr     r1, [r3]
        str     r1, [sp]
        bl      __gtsf2
        cmp     r0, #0
        ble     LBRZ85
        ldr     r3, [pc, #0x8C]
        mov     r1, r4
        ldr     r0, [r3]
        bl      __addsf3
        mov     r4, r0
LBRZ85:
        mov     r0, r4
        ldr     r1, [sp]
        bl      __ltsf2
        cmp     r0, #0
        bge     LBRZ86
        ldr     r3, [pc, #0x64]
        mov     r0, r4
        ldr     r1, [r3]
        bl      __subsf3
        mov     r4, r0
LBRZ86:
        mov     r0, r4
        bl      __fixsfsi
        mov     r0, r0, lsl #16
        mov     r3, r0, asr #16
        b       LBRZ88
LBRZ87:
        ldr     r3, [sp, #4]
        sub     r3, r3, #2, 18
        mvn     r3, r3
LBRZ88:
        add     r8, r8, #1
        strh    r3, [r9], #2
        cmp     r8, r10
        blt     LBRZ84
        mov     r0, #0
        add     sp, sp, #0x80
        ldmia   sp!, {r4 - r11, pc}
LBRZ89:
        rsb     lr, lr, #0
        and     r3, lr, #0x7F
        add     r4, r12, r3, lsl #23
        b       LBRZ52
        .long   LBRZ__2il0floatpacket.6
        .long   LBRZ__2il0floatpacket.7
        .long   LBRZ__2il0floatpacket.9
        .long   LBRZ__2il0floatpacket.10
        .long   LBRZ__2il0floatpacket.8


        .data
        .align  4


LBRZ__2il0floatpacket.1:
        .byte   0x00,0x00,0x80,0x3F
LBRZ__2il0floatpacket.2:
        .byte   0x00,0x00,0x00,0x00
LBRZ__2il0floatpacket.3:
        .byte   0x00,0xFE,0xFF,0x46
LBRZ__2il0floatpacket.4:
        .byte   0x00,0x00,0x00,0xC7
LBRZ__2il0floatpacket.5:
        .byte   0x00,0x00,0x00,0x3F
LBRZ__2il0floatpacket.6:
        .byte   0x00,0x00,0x80,0x3F
LBRZ__2il0floatpacket.7:
        .byte   0x00,0xFE,0xFF,0x46
LBRZ__2il0floatpacket.8:
        .byte   0x00,0x00,0x00,0xC7
LBRZ__2il0floatpacket.9:
        .byte   0x00,0x00,0x00,0x00
LBRZ__2il0floatpacket.10:
        .byte   0x00,0x00,0x00,0x3F


