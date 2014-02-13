        .text
        .align  4
        .globl  _ippsFIRSubband_EC_32sc_Sfs


_ippsFIRSubband_EC_32sc_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xB4
        ldr     r9, [sp, #0xD8]
        ldr     r4, [sp, #0xDC]
        mov     r8, r0
        cmp     r8, #0
        mov     r7, r1
        mov     r6, r2
        mov     r5, r3
        beq     LDKS195
        cmp     r7, #0
        beq     LDKS195
        cmp     r6, #0
        beq     LDKS195
        cmp     r9, #0
        ble     LDKS194
        mov     r12, #1
        orr     r12, r12, #1, 20
        cmp     r12, r9
        blt     LDKS194
        cmp     r5, #0
        ble     LDKS193
        cmp     r5, #0xFF
        bgt     LDKS193
        cmn     r4, #0x1F
        blt     LDKS193
        cmp     r4, #0x1F
        bgt     LDKS193
        sub     r12, r9, #4
        cmp     r12, #0
        str     r12, [sp]
        mvn     r12, #2, 2
        mov     r11, #0
        mvn     r10, #0
        str     r12, [sp, #4]
        ble     LDKS192
        add     r2, r4, #0x3F
        mov     r0, #1
        mov     r3, r2, asr #31
        mov     r1, #0
        bl      __ashldi3
        str     r0, [sp, #0xC]
        str     r1, [sp, #8]
        mov     r3, r4, asr #31
        mov     r0, #1
        mov     r1, #0
        mov     r2, r4
        bl      __ashldi3
        ldr     r12, [sp, #0xC]
        rsbs    lr, r12, #0
        ldr     r12, [sp, #8]
        str     r1, [sp, #0x68]
        str     r0, [sp, #0x64]
        str     lr, [sp, #0x4C]
        rsc     r12, r12, #0
        adds    r2, r0, r10
        adc     r3, r1, r10
        str     r3, [sp, #0x14]
        add     r3, r6, #8
        str     r3, [sp, #0x6C]
        add     r3, r6, #0x10
        str     r3, [sp, #0x18]
        add     r3, r6, #0x18
        str     r3, [sp, #0x1C]
        mov     r3, #8
        str     r3, [sp, #0x20]
        mov     r3, #0x10
        str     r6, [sp, #0x30]
        ldr     r6, [sp, #4]
        str     r2, [sp, #0x10]
        str     r3, [sp, #0x24]
        rsb     r2, r4, #0
        mov     r3, #0x18
        str     r3, [sp, #0x88]
        str     r2, [sp, #0x60]
        str     r12, [sp, #0x48]
        str     r11, [sp, #0x40]
        str     r9, [sp, #0x38]
        str     r5, [sp, #0x34]
        str     r7, [sp, #0x2C]
        str     r8, [sp, #0x28]
LDKS0:
        ldr     r0, [sp, #0x34]
        cmp     r0, #0
        ble     LDKS191
        mov     r11, #0
        str     r11, [sp, #0xA0]
        str     r11, [sp, #0x50]
        str     r11, [sp, #0x90]
        str     r11, [sp, #0x54]
        str     r11, [sp, #0x94]
        mov     r9, r11
        str     r9, [sp, #0x9C]
        mov     r7, r9
        str     r7, [sp, #0x98]
        mov     r8, r7
        str     r8, [sp, #0xAC]
        ldr     r1, [sp, #0x40]
        mov     r0, r8
        str     r0, [sp, #0xA8]
        ldr     r3, [sp, #0x2C]
        ldr     r12, [sp, #0x34]
        ldr     r2, [sp, #0x20]
        str     r0, [sp, #0x74]
        mov     r5, r1, lsl #3
        ldr     r1, [sp, #0x28]
        str     r0, [sp, #0xA4]
        str     r0, [sp, #0x70]
        str     r1, [sp, #0x58]
        str     r3, [sp, #0x8C]
        str     r12, [sp, #0x5C]
        str     r8, [sp, #0x78]
        str     r7, [sp, #0x7C]
        str     r9, [sp, #0x80]
        str     r11, [sp, #0x84]
        str     r4, [sp, #0x3C]
LDKS1:
        ldr     r12, [sp, #0x58]
        ldr     r3, [sp, #0x8C]
        ldr     r1, [r12], #4
        ldr     r0, [r3], #4
        str     r12, [sp, #0x58]
        add     r12, r5, r1
        ldr     lr, [r12, #4]
        ldr     r9, [r1, +r5]
        add     r12, r5, r0
        ldr     r12, [r12, #4]
        ldr     r8, [r0, +r5]
        smull   r7, r4, lr, r12
        str     r3, [sp, #0x8C]
        smull   r11, r3, r9, r8
        subs    r7, r11, r7
        sbc     r4, r3, r4
        ldr     r3, [sp, #0x90]
        tst     r3, r3
        bmi     LDKS189
        ldr     r3, [sp, #0x50]
        subs    r11, r10, r3
        ldr     r3, [sp, #0x90]
        sbc     r3, r6, r3
        subs    r11, r7, r11
        sbcs    r3, r4, r3
        movlt   r11, #0
        movlt   r3, #0
        orrs    r3, r11, r3
        bne     LDKS2
        ldr     r3, [sp, #0x50]
        adds    r7, r3, r7
        ldr     r3, [sp, #0x90]
        str     r7, [sp, #0x50]
        adc     r4, r3, r4
        str     r4, [sp, #0x90]
        b       LDKS3
LDKS2:
        mvn     r3, #0
        str     r3, [sp, #0x50]
        mvn     r3, #2, 2
        str     r3, [sp, #0x90]
LDKS3:
        smull   r9, r3, r12, r9
        smull   r8, r12, lr, r8
        orrs    lr, r9, r3, lsl #1
        tstcs   lr, #0
        beq     LDKS4
        subs    lr, r10, r9
        sbc     r4, r6, r3
        subs    lr, r8, lr
        sbcs    r4, r12, r4
        movlt   lr, #0
        movlt   r4, #0
        orrs    r4, lr, r4
        mvnne   r8, #0
        mvnne   r12, #2, 2
        bne     LDKS5
        adds    r8, r9, r8
        adc     r12, r3, r12
        b       LDKS5
LDKS4:
        adds    r8, r9, r8
        adc     r12, r3, r12
LDKS5:
        ldr     r3, [sp, #0x94]
        tst     r3, r3
        bmi     LDKS187
        ldr     r3, [sp, #0x54]
        ldr     lr, [sp, #0x94]
        subs    r3, r10, r3
        sbc     lr, r6, lr
        subs    r3, r8, r3
        sbcs    lr, r12, lr
        movlt   r3, #0
        movlt   lr, #0
        orrs    lr, r3, lr
        bne     LDKS6
        ldr     r3, [sp, #0x54]
        adds    r8, r3, r8
        ldr     r3, [sp, #0x94]
        str     r8, [sp, #0x54]
        adc     r12, r3, r12
        str     r12, [sp, #0x94]
        b       LDKS7
LDKS6:
        mvn     r3, #0
        str     r3, [sp, #0x54]
        mvn     r3, #2, 2
        str     r3, [sp, #0x94]
LDKS7:
        add     r3, r2, r1
        ldr     lr, [r3, #4]
        ldr     r9, [r1, +r2]
        add     r3, r2, r0
        ldr     r12, [r3, #4]
        ldr     r8, [r0, +r2]
        smull   r7, r4, lr, r12
        smull   r11, r3, r9, r8
        subs    r7, r11, r7
        sbc     r4, r3, r4
        ldr     r3, [sp, #0x9C]
        tst     r3, r3
        bmi     LDKS185
        ldr     r3, [sp, #0x84]
        subs    r11, r10, r3
        ldr     r3, [sp, #0x9C]
        sbc     r3, r6, r3
        subs    r11, r7, r11
        sbcs    r3, r4, r3
        movlt   r11, #0
        movlt   r3, #0
        orrs    r3, r11, r3
        bne     LDKS8
        ldr     r3, [sp, #0x84]
        adds    r7, r3, r7
        ldr     r3, [sp, #0x9C]
        str     r7, [sp, #0x84]
        adc     r4, r3, r4
        str     r4, [sp, #0x9C]
        b       LDKS9
LDKS8:
        mvn     r3, #0
        str     r3, [sp, #0x84]
        mvn     r3, #2, 2
        str     r3, [sp, #0x9C]
LDKS9:
        smull   r9, r3, r12, r9
        smull   r8, r12, lr, r8
        orrs    lr, r9, r3, lsl #1
        tstcs   lr, #0
        beq     LDKS10
        subs    lr, r10, r9
        sbc     r4, r6, r3
        subs    lr, r8, lr
        sbcs    r4, r12, r4
        movlt   lr, #0
        movlt   r4, #0
        orrs    r4, lr, r4
        mvnne   r8, #0
        mvnne   r12, #2, 2
        bne     LDKS11
        adds    r8, r9, r8
        adc     r12, r3, r12
        b       LDKS11
LDKS10:
        adds    r8, r9, r8
        adc     r12, r3, r12
LDKS11:
        ldr     r3, [sp, #0x98]
        tst     r3, r3
        bmi     LDKS183
        ldr     r3, [sp, #0x80]
        ldr     lr, [sp, #0x98]
        subs    r3, r10, r3
        sbc     lr, r6, lr
        subs    r3, r8, r3
        sbcs    lr, r12, lr
        movlt   r3, #0
        movlt   lr, #0
        orrs    lr, r3, lr
        bne     LDKS12
        ldr     r3, [sp, #0x80]
        adds    r8, r3, r8
        ldr     r3, [sp, #0x98]
        str     r8, [sp, #0x80]
        adc     r12, r3, r12
        str     r12, [sp, #0x98]
        b       LDKS13
LDKS12:
        mvn     r3, #0
        str     r3, [sp, #0x80]
        mvn     r3, #2, 2
        str     r3, [sp, #0x98]
LDKS13:
        ldr     r3, [sp, #0x24]
        add     r12, r0, r3
        ldr     r4, [r12, #4]
        ldr     r9, [r0, +r3]
        add     r12, r1, r3
        ldr     lr, [r3, +r1]
        ldr     r12, [r12, #4]
        smull   r8, r7, r4, r12
        smull   r11, r3, lr, r9
        subs    r8, r11, r8
        sbc     r7, r3, r7
        ldr     r3, [sp, #0xAC]
        tst     r3, r3
        bmi     LDKS181
        ldr     r3, [sp, #0x7C]
        subs    r11, r10, r3
        ldr     r3, [sp, #0xAC]
        sbc     r3, r6, r3
        subs    r11, r8, r11
        sbcs    r3, r7, r3
        movlt   r11, #0
        movlt   r3, #0
        orrs    r3, r11, r3
        bne     LDKS14
        ldr     r3, [sp, #0x7C]
        adds    r8, r3, r8
        ldr     r3, [sp, #0xAC]
        str     r8, [sp, #0x7C]
        adc     r7, r3, r7
        str     r7, [sp, #0xAC]
        b       LDKS15
LDKS14:
        mvn     r3, #0
        str     r3, [sp, #0x7C]
        mvn     r3, #2, 2
        str     r3, [sp, #0xAC]
LDKS15:
        smull   r4, r3, lr, r4
        smull   r9, r12, r9, r12
        orrs    lr, r4, r3, lsl #1
        tstcs   lr, #0
        beq     LDKS16
        subs    lr, r10, r4
        sbc     r7, r6, r3
        subs    lr, r9, lr
        sbcs    r7, r12, r7
        movlt   lr, #0
        movlt   r7, #0
        orrs    r7, lr, r7
        mvnne   r9, #0
        mvnne   r12, #2, 2
        bne     LDKS17
        adds    r9, r4, r9
        adc     r12, r3, r12
        b       LDKS17
LDKS16:
        adds    r9, r4, r9
        adc     r12, r3, r12
LDKS17:
        ldr     r3, [sp, #0xA8]
        tst     r3, r3
        bmi     LDKS179
        ldr     r3, [sp, #0x78]
        ldr     lr, [sp, #0xA8]
        subs    r3, r10, r3
        sbc     lr, r6, lr
        subs    r3, r9, r3
        sbcs    lr, r12, lr
        movlt   r3, #0
        movlt   lr, #0
        orrs    lr, r3, lr
        bne     LDKS18
        ldr     r3, [sp, #0x78]
        adds    r3, r9, r3
        str     r3, [sp, #0x78]
        ldr     r3, [sp, #0xA8]
        adc     r3, r12, r3
        str     r3, [sp, #0xA8]
        b       LDKS19
LDKS18:
        mvn     r3, #0
        str     r3, [sp, #0x78]
        mvn     r3, #2, 2
        str     r3, [sp, #0xA8]
LDKS19:
        ldr     r12, [sp, #0x88]
        add     r4, r1, r12
        add     r3, r0, r12
        ldr     lr, [r12, +r1]
        ldr     r1, [r4, #4]
        ldr     r0, [r0, +r12]
        ldr     r3, [r3, #4]
        smull   r4, r12, r3, r1
        smull   r8, r7, lr, r0
        subs    r4, r8, r4
        sbc     r12, r7, r12
        ldr     r7, [sp, #0xA4]
        tst     r7, r7
        bmi     LDKS177
        ldr     r7, [sp, #0x74]
        ldr     r8, [sp, #0xA4]
        subs    r7, r10, r7
        sbc     r8, r6, r8
        subs    r7, r4, r7
        sbcs    r8, r12, r8
        movlt   r7, #0
        movlt   r8, #0
        orrs    r8, r7, r8
        bne     LDKS20
        ldr     r7, [sp, #0x74]
        adds    r4, r7, r4
        str     r4, [sp, #0x74]
        ldr     r4, [sp, #0xA4]
        adc     r12, r4, r12
        str     r12, [sp, #0xA4]
        b       LDKS21
LDKS20:
        mvn     r12, #0
        str     r12, [sp, #0x74]
        mvn     r12, #2, 2
        str     r12, [sp, #0xA4]
LDKS21:
        smull   lr, r3, lr, r3
        smull   r1, r0, r0, r1
        orrs    r12, lr, r3, lsl #1
        tstcs   r12, #0
        beq     LDKS22
        subs    r12, r10, lr
        sbc     r4, r6, r3
        subs    r12, r1, r12
        sbcs    r4, r0, r4
        movlt   r12, #0
        movlt   r4, #0
        orrs    r4, r12, r4
        mvnne   lr, #0
        mvnne   r0, #2, 2
        bne     LDKS23
        adds    lr, lr, r1
        adc     r0, r3, r0
        b       LDKS23
LDKS22:
        adds    lr, lr, r1
        adc     r0, r3, r0
LDKS23:
        ldr     r1, [sp, #0xA0]
        tst     r1, r1
        bmi     LDKS175
        ldr     r1, [sp, #0x70]
        ldr     r3, [sp, #0xA0]
        subs    r1, r10, r1
        sbc     r3, r6, r3
        subs    r1, lr, r1
        sbcs    r3, r0, r3
        movlt   r1, #0
        movlt   r3, #0
        orrs    r3, r1, r3
        bne     LDKS24
        ldr     r1, [sp, #0x70]
        adds    r1, lr, r1
        str     r1, [sp, #0x70]
        ldr     r1, [sp, #0xA0]
        adc     r1, r0, r1
        str     r1, [sp, #0xA0]
        b       LDKS25
LDKS24:
        mvn     r0, #0
        str     r0, [sp, #0x70]
        mvn     r0, #2, 2
        str     r0, [sp, #0xA0]
LDKS25:
        ldr     r0, [sp, #0x5C]
        subs    r0, r0, #1
        str     r0, [sp, #0x5C]
        bne     LDKS1
        ldr     r8, [sp, #0x78]
        ldr     r7, [sp, #0x7C]
        ldr     r9, [sp, #0x80]
        ldr     r11, [sp, #0x84]
        ldr     r4, [sp, #0x3C]
LDKS26:
        cmp     r4, #0
        blt     LDKS140
        cmp     r4, #0
        beq     LDKS29
        ldr     r1, [sp, #0x90]
        tst     r1, r1
        bmi     LDKS91
LDKS27:
        ldr     r0, [sp, #0x50]
        ldr     r1, [sp, #0x90]
        mov     r2, r4
        mov     r3, #0
        bl      __ashrdi3
        ldr     r3, [sp, #0x94]
        str     r0, [sp, #0x50]
        tst     r3, r3
        str     r1, [sp, #0x90]
        bmi     LDKS90
LDKS28:
        ldr     r0, [sp, #0x54]
        ldr     r1, [sp, #0x94]
        mov     r2, r4
        mov     r3, #0
        bl      __ashrdi3
        str     r0, [sp, #0x54]
        str     r1, [sp, #0x94]
LDKS29:
        ldr     r1, [sp, #0x50]
        ldr     r3, [sp, #0x90]
        subs    r1, r1, r6
        sbcs    r3, r3, #0
        movlt   r1, #0
        movlt   r3, #0
        orrs    r3, r1, r3
        mvnne   r1, #2, 2
        strne   r1, [sp, #0x50]
        bne     LDKS30
        ldr     r1, [sp, #0x50]
        cmp     r1, #2, 2
        ldr     r1, [sp, #0x90]
        sbcs    r1, r1, r10
        movlt   r1, #2, 2
        strlt   r1, [sp, #0x50]
LDKS30:
        ldr     r1, [sp, #0x54]
        ldr     r3, [sp, #0x94]
        subs    r1, r1, r6
        sbcs    r3, r3, #0
        movlt   r1, #0
        movlt   r3, #0
        orrs    r3, r1, r3
        mvnne   r1, #2, 2
        strne   r1, [sp, #0x54]
        bne     LDKS31
        ldr     r1, [sp, #0x54]
        cmp     r1, #2, 2
        ldr     r1, [sp, #0x94]
        sbcs    r1, r1, r10
        movlt   r1, #2, 2
        strlt   r1, [sp, #0x54]
LDKS31:
        ldr     r3, [sp, #0x30]
        ldr     r12, [sp, #0x50]
        cmp     r4, #0
        add     r1, r3, r5
        str     r12, [r5, +r3]
        ldr     r3, [sp, #0x54]
        str     r3, [r1, #4]
        beq     LDKS34
        ldr     r1, [sp, #0x9C]
        tst     r1, r1
        bmi     LDKS93
LDKS32:
        mov     r0, r11
        ldr     r1, [sp, #0x9C]
        mov     r2, r4
        mov     r3, #0
        bl      __ashrdi3
        ldr     r3, [sp, #0x98]
        mov     r11, r0
        str     r1, [sp, #0x9C]
        tst     r3, r3
        bmi     LDKS92
LDKS33:
        mov     r0, r9
        ldr     r1, [sp, #0x98]
        mov     r2, r4
        mov     r3, #0
        bl      __ashrdi3
        mov     r9, r0
        str     r1, [sp, #0x98]
LDKS34:
        ldr     r3, [sp, #0x9C]
        subs    r1, r11, r6
        sbcs    r3, r3, #0
        movlt   r1, #0
        movlt   r3, #0
        orrs    r3, r1, r3
        mvnne   r11, #2, 2
        bne     LDKS35
        ldr     r1, [sp, #0x9C]
        cmp     r11, #2, 2
        sbcs    r1, r1, r10
        movlt   r11, #2, 2
LDKS35:
        ldr     r3, [sp, #0x98]
        subs    r1, r9, r6
        sbcs    r3, r3, #0
        movlt   r1, #0
        movlt   r3, #0
        orrs    r3, r1, r3
        mvnne   r9, #2, 2
        bne     LDKS36
        ldr     r1, [sp, #0x98]
        cmp     r9, #2, 2
        sbcs    r1, r1, r10
        movlt   r9, #2, 2
LDKS36:
        ldr     r3, [sp, #0x6C]
        cmp     r4, #0
        add     r1, r5, r3
        str     r11, [r3, +r5]
        str     r9, [r1, #4]
        beq     LDKS39
        ldr     r1, [sp, #0xAC]
        tst     r1, r1
        bmi     LDKS95
LDKS37:
        mov     r0, r7
        ldr     r1, [sp, #0xAC]
        mov     r2, r4
        mov     r3, #0
        bl      __ashrdi3
        ldr     r3, [sp, #0xA8]
        mov     r7, r0
        str     r1, [sp, #0xAC]
        tst     r3, r3
        bmi     LDKS94
LDKS38:
        mov     r0, r8
        ldr     r1, [sp, #0xA8]
        mov     r2, r4
        mov     r3, #0
        bl      __ashrdi3
        mov     r8, r0
        str     r1, [sp, #0xA8]
LDKS39:
        ldr     r3, [sp, #0xAC]
        subs    r1, r7, r6
        sbcs    r3, r3, #0
        movlt   r1, #0
        movlt   r3, #0
        orrs    r3, r1, r3
        mvnne   r7, #2, 2
        bne     LDKS40
        ldr     r1, [sp, #0xAC]
        cmp     r7, #2, 2
        sbcs    r1, r1, r10
        movlt   r7, #2, 2
LDKS40:
        ldr     r3, [sp, #0xA8]
        subs    r1, r8, r6
        sbcs    r3, r3, #0
        movlt   r1, #0
        movlt   r3, #0
        orrs    r3, r1, r3
        mvnne   r8, #2, 2
        bne     LDKS41
        ldr     r1, [sp, #0xA8]
        cmp     r8, #2, 2
        sbcs    r1, r1, r10
        movlt   r8, #2, 2
LDKS41:
        ldr     r3, [sp, #0x18]
        cmp     r4, #0
        add     r1, r5, r3
        str     r7, [r3, +r5]
        str     r8, [r1, #4]
        beq     LDKS44
        ldr     r0, [sp, #0xA4]
        tst     r0, r0
        bmi     LDKS97
LDKS42:
        ldr     r0, [sp, #0x74]
        ldr     r1, [sp, #0xA4]
        mov     r2, r4
        mov     r3, #0
        bl      __ashrdi3
        ldr     r3, [sp, #0xA0]
        str     r0, [sp, #0x74]
        tst     r3, r3
        str     r1, [sp, #0xA4]
        bmi     LDKS96
LDKS43:
        ldr     r0, [sp, #0x70]
        ldr     r1, [sp, #0xA0]
        mov     r2, r4
        mov     r3, #0
        bl      __ashrdi3
        str     r0, [sp, #0x70]
        str     r1, [sp, #0xA0]
LDKS44:
        ldr     r0, [sp, #0x74]
        ldr     r1, [sp, #0xA4]
        subs    r0, r0, r6
        sbcs    r1, r1, #0
        movlt   r0, #0
        movlt   r1, #0
        orrs    r1, r0, r1
        mvnne   r0, #2, 2
        strne   r0, [sp, #0x74]
        bne     LDKS45
        ldr     r0, [sp, #0x74]
        cmp     r0, #2, 2
        ldr     r0, [sp, #0xA4]
        sbcs    r0, r0, r10
        movlt   r0, #2, 2
        strlt   r0, [sp, #0x74]
LDKS45:
        ldr     r0, [sp, #0x70]
        ldr     r1, [sp, #0xA0]
        subs    r0, r0, r6
        sbcs    r1, r1, #0
        movlt   r0, #0
        movlt   r1, #0
        orrs    r1, r0, r1
        mvnne   r0, #2, 2
        strne   r0, [sp, #0x70]
        bne     LDKS46
        ldr     r0, [sp, #0x70]
        cmp     r0, #2, 2
        ldr     r0, [sp, #0xA0]
        sbcs    r0, r0, r10
        movlt   r0, #2, 2
        strlt   r0, [sp, #0x70]
LDKS46:
        ldr     r1, [sp, #0x1C]
        ldr     r3, [sp, #0x74]
        add     r0, r5, r1
        str     r3, [r1, +r5]
        ldr     r1, [sp, #0x70]
        str     r1, [r0, #4]
LDKS47:
        ldr     r0, [sp, #0x40]
        ldr     r1, [sp]
        add     r0, r0, #4
        str     r0, [sp, #0x40]
        cmp     r0, r1
        ldr     r0, [sp, #0x20]
        add     r0, r0, #0x20
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #0x24]
        add     r0, r0, #0x20
        str     r0, [sp, #0x24]
        ldr     r0, [sp, #0x88]
        add     r0, r0, #0x20
        str     r0, [sp, #0x88]
        blt     LDKS0
        ldr     r9, [sp, #0x38]
        ldr     r11, [sp, #0x40]
        ldr     r5, [sp, #0x34]
        ldr     r6, [sp, #0x30]
        ldr     r7, [sp, #0x2C]
        ldr     r8, [sp, #0x28]
        sub     r12, r9, #2
        cmp     r11, r12
        str     r12, [sp]
        bge     LDKS75
LDKS48:
        add     r2, r4, #0x3F
        mov     r0, #1
        mov     r3, r2, asr #31
        mov     r1, #0
        bl      __ashldi3
        mov     r2, r11, lsl #3
        str     r8, [sp, #0x28]
        ldr     r8, [sp, #4]
        add     r2, r2, #8
        mov     r12, #0
        mov     lr, #2, 2
        str     r2, [sp, #0x24]
        str     r1, [sp, #0x14]
        str     r0, [sp, #0x18]
        str     r10, [sp, #0x44]
        str     r11, [sp, #0x40]
        str     r9, [sp, #0x38]
        str     r5, [sp, #0x34]
        str     r6, [sp, #0x30]
        str     r7, [sp, #0x2C]
LDKS49:
        ldr     r0, [sp, #0x34]
        cmp     r0, #0
        ble     LDKS139
        ldr     r3, [sp, #0x40]
        mov     r5, #0
        mov     r11, r5
        mov     r9, r11
        mov     r7, r3, lsl #3
        ldr     r3, [sp, #0x28]
        ldr     r12, [sp, #0x2C]
        str     r9, [sp, #0x5C]
        mov     r6, r9
        ldr     lr, [sp, #0x34]
        mov     r10, r6
        mov     r0, r10
        str     r3, [sp, #0x1C]
        str     r12, [sp, #0x4C]
        ldr     r3, [sp, #0x24]
        ldr     r12, [sp, #0x44]
        str     r0, [sp, #0x54]
        str     r0, [sp, #0x48]
        str     lr, [sp, #0x20]
        str     r10, [sp, #0x10]
        str     r9, [sp, #0xC]
        str     r11, [sp, #8]
        str     r4, [sp, #0x3C]
LDKS50:
        ldr     lr, [sp, #0x1C]
        ldr     r10, [sp, #0x4C]
        ldr     r0, [lr], #4
        ldr     r2, [r10], #4
        str     lr, [sp, #0x1C]
        ldr     r9, [r0, +r7]
        add     lr, r7, r0
        ldr     lr, [lr, #4]
        add     r4, r7, r2
        ldr     r4, [r4, #4]
        str     r4, [sp, #0x58]
        ldr     r11, [r2, +r7]
        smull   r4, r1, lr, r4
        str     r10, [sp, #0x4C]
        str     r11, [sp, #0x50]
        smull   r11, r10, r9, r11
        subs    r4, r11, r4
        sbc     r11, r10, r1
        ldr     r10, [sp, #0x5C]
        tst     r10, r10
        bmi     LDKS137
        ldr     r10, [sp, #8]
        subs    r1, r12, r10
        ldr     r10, [sp, #0x5C]
        sbc     r10, r8, r10
        subs    r1, r4, r1
        sbcs    r10, r11, r10
        movlt   r1, #0
        movlt   r10, #0
        orrs    r10, r1, r10
        bne     LDKS51
        ldr     r10, [sp, #8]
        adds    r4, r10, r4
        str     r4, [sp, #8]
        ldr     r4, [sp, #0x5C]
        adc     r11, r4, r11
        str     r11, [sp, #0x5C]
        b       LDKS52
LDKS51:
        mvn     r4, #0
        str     r4, [sp, #8]
        mvn     r4, #2, 2
        str     r4, [sp, #0x5C]
LDKS52:
        ldr     r4, [sp, #0x58]
        ldr     r10, [sp, #0x50]
        smull   r9, r4, r4, r9
        smull   r11, lr, lr, r10
        orrs    r10, r9, r4, lsl #1
        tstcs   r10, #0
        beq     LDKS53
        subs    r10, r12, r9
        sbc     r1, r8, r4
        subs    r10, r11, r10
        sbcs    r1, lr, r1
        movlt   r10, #0
        movlt   r1, #0
        orrs    r1, r10, r1
        mvnne   r11, #0
        mvnne   lr, #2, 2
        bne     LDKS54
        adds    r11, r9, r11
        adc     lr, r4, lr
        b       LDKS54
LDKS53:
        adds    r11, r9, r11
        adc     lr, r4, lr
LDKS54:
        tst     r6, r6
        bmi     LDKS135
        ldr     r4, [sp, #0xC]
        subs    r4, r12, r4
        sbc     r9, r8, r6
        subs    r4, r11, r4
        sbcs    r9, lr, r9
        movlt   r4, #0
        movlt   r9, #0
        orrs    r9, r4, r9
        bne     LDKS55
        ldr     r4, [sp, #0xC]
        adds    r11, r4, r11
        str     r11, [sp, #0xC]
        adc     r6, r6, lr
        b       LDKS56
LDKS55:
        mvn     lr, #0
        str     lr, [sp, #0xC]
        mvn     r6, #2, 2
LDKS56:
        ldr     r4, [r0, +r3]
        add     lr, r3, r0
        ldr     lr, [lr, #4]
        add     r0, r3, r2
        ldr     r9, [r2, +r3]
        ldr     r0, [r0, #4]
        smull   r11, r10, lr, r0
        smull   r1, r2, r4, r9
        subs    r11, r1, r11
        sbc     r10, r2, r10
        ldr     r2, [sp, #0x54]
        tst     r2, r2
        bmi     LDKS133
        ldr     r2, [sp, #0x10]
        subs    r1, r12, r2
        ldr     r2, [sp, #0x54]
        sbc     r2, r8, r2
        subs    r1, r11, r1
        sbcs    r2, r10, r2
        movlt   r1, #0
        movlt   r2, #0
        orrs    r2, r1, r2
        bne     LDKS57
        ldr     r2, [sp, #0x10]
        adds    r11, r2, r11
        ldr     r2, [sp, #0x54]
        str     r11, [sp, #0x10]
        adc     r10, r2, r10
        str     r10, [sp, #0x54]
        b       LDKS58
LDKS57:
        mvn     r2, #0
        str     r2, [sp, #0x10]
        mvn     r2, #2, 2
        str     r2, [sp, #0x54]
LDKS58:
        smull   r4, r0, r0, r4
        smull   r9, r2, lr, r9
        orrs    lr, r4, r0, lsl #1
        tstcs   lr, #0
        beq     LDKS59
        subs    lr, r12, r4
        sbc     r10, r8, r0
        subs    lr, r9, lr
        sbcs    r10, r2, r10
        movlt   lr, #0
        movlt   r10, #0
        orrs    r10, lr, r10
        mvnne   r9, #0
        mvnne   r2, #2, 2
        bne     LDKS60
        adds    r9, r4, r9
        adc     r2, r0, r2
        b       LDKS60
LDKS59:
        adds    r9, r4, r9
        adc     r2, r0, r2
LDKS60:
        tst     r5, r5
        bmi     LDKS131
        ldr     r0, [sp, #0x48]
        subs    r0, r12, r0
        sbc     lr, r8, r5
        subs    r0, r9, r0
        sbcs    lr, r2, lr
        movlt   r0, #0
        movlt   lr, #0
        orrs    lr, r0, lr
        bne     LDKS61
        ldr     r0, [sp, #0x48]
        adds    r0, r9, r0
        str     r0, [sp, #0x48]
        adc     r5, r2, r5
        b       LDKS62
LDKS61:
        mvn     r0, #0
        str     r0, [sp, #0x48]
        mvn     r5, #2, 2
LDKS62:
        ldr     r0, [sp, #0x20]
        subs    r0, r0, #1
        str     r0, [sp, #0x20]
        bne     LDKS50
        ldr     r10, [sp, #0x10]
        ldr     r9, [sp, #0xC]
        ldr     r11, [sp, #8]
        ldr     r4, [sp, #0x3C]
LDKS63:
        cmp     r4, #0
        blt     LDKS114
        cmp     r4, #0
        beq     LDKS66
        ldr     r3, [sp, #0x5C]
        tst     r3, r3
        bmi     LDKS99
LDKS64:
        mov     r0, r11
        ldr     r1, [sp, #0x5C]
        mov     r2, r4
        mov     r3, #0
        bl      __ashrdi3
        tst     r6, r6
        mov     r11, r0
        str     r1, [sp, #0x5C]
        bmi     LDKS98
LDKS65:
        mov     r0, r9
        mov     r1, r6
        mov     r2, r4
        mov     r3, #0
        bl      __ashrdi3
        mov     r9, r0
        mov     r6, r1
LDKS66:
        ldr     r12, [sp, #0x5C]
        subs    r3, r11, r8
        sbcs    r12, r12, #0
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        mvnne   r11, #2, 2
        bne     LDKS67
        ldr     r12, [sp, #0x44]
        ldr     r3, [sp, #0x5C]
        cmp     r11, #2, 2
        sbcs    r3, r3, r12
        movlt   r11, #2, 2
LDKS67:
        subs    r12, r9, r8
        sbcs    r3, r6, #0
        movlt   r12, #0
        movlt   r3, #0
        orrs    r3, r12, r3
        mvnne   r9, #2, 2
        bne     LDKS68
        ldr     r3, [sp, #0x44]
        cmp     r9, #2, 2
        sbcs    r6, r6, r3
        movlt   r9, #2, 2
LDKS68:
        ldr     r12, [sp, #0x30]
        cmp     r4, #0
        add     r3, r12, r7
        str     r11, [r7, +r12]
        str     r9, [r3, #4]
        beq     LDKS71
        ldr     r3, [sp, #0x54]
        tst     r3, r3
        bmi     LDKS101
LDKS69:
        mov     r0, r10
        ldr     r1, [sp, #0x54]
        mov     r2, r4
        mov     r3, #0
        bl      __ashrdi3
        tst     r5, r5
        mov     r10, r0
        str     r1, [sp, #0x54]
        bmi     LDKS100
LDKS70:
        ldr     r0, [sp, #0x48]
        mov     r1, r5
        mov     r2, r4
        mov     r3, #0
        bl      __ashrdi3
        str     r0, [sp, #0x48]
        mov     r5, r1
LDKS71:
        ldr     r12, [sp, #0x54]
        subs    r3, r10, r8
        sbcs    r12, r12, #0
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        mvnne   r10, #2, 2
        bne     LDKS72
        ldr     r12, [sp, #0x44]
        ldr     r3, [sp, #0x54]
        cmp     r10, #2, 2
        sbcs    r3, r3, r12
        movlt   r10, #2, 2
LDKS72:
        ldr     r3, [sp, #0x48]
        subs    r3, r3, r8
        sbcs    r12, r5, #0
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        mvnne   r1, #2, 2
        strne   r1, [sp, #0x48]
        bne     LDKS73
        ldr     r3, [sp, #0x48]
        cmp     r3, #2, 2
        ldr     r3, [sp, #0x44]
        sbcs    r5, r5, r3
        movlt   r1, #2, 2
        strlt   r1, [sp, #0x48]
LDKS73:
        ldr     r3, [sp, #0x6C]
        str     r10, [r3, +r7]
        ldr     r0, [sp, #0x48]
        add     r1, r7, r3
        str     r0, [r1, #4]
LDKS74:
        ldr     r0, [sp, #0x40]
        ldr     r1, [sp]
        add     r0, r0, #2
        str     r0, [sp, #0x40]
        cmp     r0, r1
        ldr     r0, [sp, #0x24]
        add     r0, r0, #0x10
        str     r0, [sp, #0x24]
        blt     LDKS49
        ldr     r11, [sp, #0x40]
        ldr     r9, [sp, #0x38]
        ldr     r5, [sp, #0x34]
        ldr     r6, [sp, #0x30]
        ldr     r7, [sp, #0x2C]
        ldr     r8, [sp, #0x28]
LDKS75:
        cmp     r11, r9
        bge     LDKS89
        add     r2, r4, #0x3F
        mov     r0, #1
        mov     r3, r2, asr #31
        mov     r1, #0
        bl      __ashldi3
        mvn     r2, #0
        mov     lr, #0
        mvn     r10, #2, 2
        mov     r12, #2, 2
        str     r2, [sp, #0x24]
        str     r1, [sp, #0x1C]
        str     r0, [sp, #0x20]
        str     r9, [sp, #0x38]
        str     r5, [sp, #0x34]
        str     r6, [sp, #0x30]
        str     r7, [sp, #0x2C]
        str     r8, [sp, #0x28]
LDKS76:
        ldr     r0, [sp, #0x34]
        cmp     r0, #0
        ble     LDKS113
        ldr     r12, [sp, #0x28]
        ldr     lr, [sp, #0x34]
        ldr     r3, [sp, #0x2C]
        mov     r5, #0
        ldr     r2, [sp, #0x24]
        mov     r8, r5
        mov     r6, r8
        mov     r7, r6
        mov     r9, r11, lsl #3
        str     r12, [sp, #0x14]
        str     lr, [sp, #0x18]
        str     r11, [sp, #0x40]
        str     r4, [sp, #0x3C]
LDKS77:
        ldr     r12, [sp, #0x14]
        ldr     r11, [r3], #4
        ldr     lr, [r12], #4
        str     r12, [sp, #0x14]
        add     r4, r9, r11
        add     r12, r9, lr
        ldr     r11, [r11, +r9]
        ldr     lr, [lr, +r9]
        ldr     r12, [r12, #4]
        ldr     r4, [r4, #4]
        str     r11, [sp, #0x10]
        smull   r11, r0, lr, r11
        str     r0, [sp, #0xAC]
        smull   r1, r0, r12, r4
        str     r0, [sp, #0xA8]
        ldr     r0, [sp, #0xAC]
        subs    r11, r11, r1
        str     r11, [sp, #0xC]
        ldr     r11, [sp, #0xA8]
        sbc     r11, r0, r11
        tst     r6, r6
        bmi     LDKS112
        subs    r0, r2, r8
        sbc     r1, r10, r6
        str     r1, [sp, #0xAC]
        ldr     r1, [sp, #0xC]
        subs    r1, r1, r0
        ldr     r0, [sp, #0xAC]
        str     r1, [sp, #0xA8]
        ldr     r1, [sp, #0xA8]
        sbcs    r0, r11, r0
        movlt   r1, #0
        movlt   r0, #0
        orrs    r0, r1, r0
        mvnne   r8, #0
        mvnne   r6, #2, 2
        bne     LDKS78
        ldr     r0, [sp, #0xC]
        adds    r8, r8, r0
        adc     r6, r6, r11
LDKS78:
        ldr     r11, [sp, #0x10]
        smull   lr, r4, r4, lr
        smull   r0, r12, r12, r11
        orrs    r11, lr, r4, lsl #1
        tstcs   r11, #0
        beq     LDKS79
        subs    r11, r2, lr
        sbc     r1, r10, r4
        subs    r11, r0, r11
        sbcs    r1, r12, r1
        movlt   r11, #0
        movlt   r1, #0
        orrs    r1, r11, r1
        mvnne   r0, #0
        mvnne   r12, #2, 2
        bne     LDKS80
        adds    r0, lr, r0
        adc     r12, r4, r12
        b       LDKS80
LDKS79:
        adds    r0, lr, r0
        adc     r12, r4, r12
LDKS80:
        tst     r5, r5
        bmi     LDKS111
        subs    lr, r2, r7
        sbc     r4, r10, r5
        subs    lr, r0, lr
        sbcs    r4, r12, r4
        movlt   lr, #0
        movlt   r4, #0
        orrs    r4, lr, r4
        mvnne   r7, #0
        mvnne   r5, #2, 2
        bne     LDKS81
        adds    r7, r0, r7
        adc     r5, r12, r5
LDKS81:
        ldr     r12, [sp, #0x18]
        subs    r12, r12, #1
        str     r12, [sp, #0x18]
        bne     LDKS77
        ldr     r11, [sp, #0x40]
        ldr     r4, [sp, #0x3C]
LDKS82:
        cmp     r4, #0
        blt     LDKS104
        cmp     r4, #0
        beq     LDKS85
        tst     r6, r6
        bmi     LDKS103
LDKS83:
        mov     r0, r8
        mov     r1, r6
        mov     r2, r4
        mov     r3, #0
        bl      __ashrdi3
        tst     r5, r5
        mov     r8, r0
        mov     r6, r1
        bmi     LDKS102
LDKS84:
        mov     r0, r7
        mov     r1, r5
        mov     r2, r4
        mov     r3, #0
        bl      __ashrdi3
        mov     r7, r0
        mov     r5, r1
LDKS85:
        subs    r12, r8, r10
        sbcs    r3, r6, #0
        movlt   r12, #0
        movlt   r3, #0
        orrs    r3, r12, r3
        mvnne   r8, #2, 2
        bne     LDKS86
        ldr     r3, [sp, #0x24]
        cmp     r8, #2, 2
        sbcs    r6, r6, r3
        movlt   r8, #2, 2
LDKS86:
        subs    r12, r7, r10
        sbcs    r3, r5, #0
        movlt   r12, #0
        movlt   r3, #0
        orrs    r3, r12, r3
        mvnne   r7, #2, 2
        bne     LDKS87
        ldr     r3, [sp, #0x24]
        cmp     r7, #2, 2
        sbcs    r5, r5, r3
        movlt   r7, #2, 2
LDKS87:
        ldr     r3, [sp, #0x30]
        add     r1, r3, r9
        str     r7, [r1, #4]
        str     r8, [r9, +r3]
LDKS88:
        ldr     r0, [sp, #0x38]
        add     r11, r11, #1
        cmp     r11, r0
        blt     LDKS76
LDKS89:
        mov     r0, #0
        add     sp, sp, #0xB4
        ldmia   sp!, {r4 - r11, pc}
LDKS90:
        ldr     r1, [sp, #0x10]
        ldr     r3, [sp, #0x54]
        ldr     r12, [sp, #0x94]
        and     r1, r3, r1
        ldr     r3, [sp, #0x14]
        and     r3, r12, r3
        orrs    r3, r1, r3
        beq     LDKS28
        ldr     r1, [sp, #0x64]
        ldr     r3, [sp, #0x54]
        adds    r1, r3, r1
        str     r1, [sp, #0x54]
        ldr     r1, [sp, #0x68]
        ldr     r3, [sp, #0x94]
        adc     r1, r3, r1
        str     r1, [sp, #0x94]
        b       LDKS28
LDKS91:
        ldr     r1, [sp, #0x10]
        ldr     r3, [sp, #0x50]
        ldr     r12, [sp, #0x90]
        and     r1, r3, r1
        ldr     r3, [sp, #0x14]
        and     r3, r12, r3
        orrs    r3, r1, r3
        beq     LDKS27
        ldr     r1, [sp, #0x64]
        ldr     r3, [sp, #0x50]
        adds    r1, r3, r1
        str     r1, [sp, #0x50]
        ldr     r1, [sp, #0x68]
        ldr     r3, [sp, #0x90]
        adc     r1, r3, r1
        str     r1, [sp, #0x90]
        b       LDKS27
LDKS92:
        ldr     r3, [sp, #0x14]
        ldr     r1, [sp, #0x10]
        ldr     r12, [sp, #0x98]
        and     r3, r12, r3
        and     r1, r9, r1
        orrs    r3, r1, r3
        beq     LDKS33
        ldr     r1, [sp, #0x64]
        ldr     r3, [sp, #0x98]
        adds    r9, r9, r1
        ldr     r1, [sp, #0x68]
        adc     r1, r3, r1
        str     r1, [sp, #0x98]
        b       LDKS33
LDKS93:
        ldr     r3, [sp, #0x14]
        ldr     r1, [sp, #0x10]
        ldr     r12, [sp, #0x9C]
        and     r3, r12, r3
        and     r1, r11, r1
        orrs    r3, r1, r3
        beq     LDKS32
        ldr     r1, [sp, #0x64]
        ldr     r3, [sp, #0x9C]
        adds    r11, r11, r1
        ldr     r1, [sp, #0x68]
        adc     r1, r3, r1
        str     r1, [sp, #0x9C]
        b       LDKS32
LDKS94:
        ldr     r3, [sp, #0x14]
        ldr     r1, [sp, #0x10]
        ldr     r12, [sp, #0xA8]
        and     r3, r12, r3
        and     r1, r8, r1
        orrs    r3, r1, r3
        beq     LDKS38
        ldr     r1, [sp, #0x64]
        ldr     r3, [sp, #0xA8]
        adds    r8, r8, r1
        ldr     r1, [sp, #0x68]
        adc     r1, r3, r1
        str     r1, [sp, #0xA8]
        b       LDKS38
LDKS95:
        ldr     r3, [sp, #0x14]
        ldr     r1, [sp, #0x10]
        ldr     r12, [sp, #0xAC]
        and     r3, r12, r3
        and     r1, r7, r1
        orrs    r3, r1, r3
        beq     LDKS37
        ldr     r1, [sp, #0x64]
        ldr     r3, [sp, #0xAC]
        adds    r7, r7, r1
        ldr     r1, [sp, #0x68]
        adc     r1, r3, r1
        str     r1, [sp, #0xAC]
        b       LDKS37
LDKS96:
        ldr     r0, [sp, #0x10]
        ldr     r1, [sp, #0x70]
        ldr     r3, [sp, #0xA0]
        and     r0, r1, r0
        ldr     r1, [sp, #0x14]
        and     r1, r3, r1
        orrs    r1, r0, r1
        beq     LDKS43
        ldr     r0, [sp, #0x64]
        ldr     r1, [sp, #0x70]
        adds    r0, r1, r0
        str     r0, [sp, #0x70]
        ldr     r0, [sp, #0x68]
        ldr     r1, [sp, #0xA0]
        adc     r0, r1, r0
        str     r0, [sp, #0xA0]
        b       LDKS43
LDKS97:
        ldr     r0, [sp, #0x10]
        ldr     r1, [sp, #0x74]
        ldr     r3, [sp, #0xA4]
        and     r0, r1, r0
        ldr     r1, [sp, #0x14]
        and     r1, r3, r1
        orrs    r1, r0, r1
        beq     LDKS42
        ldr     r0, [sp, #0x64]
        ldr     r1, [sp, #0x74]
        adds    r0, r1, r0
        str     r0, [sp, #0x74]
        ldr     r0, [sp, #0x68]
        ldr     r1, [sp, #0xA4]
        adc     r0, r1, r0
        str     r0, [sp, #0xA4]
        b       LDKS42
LDKS98:
        mov     r3, r4, asr #31
        mov     r0, #1
        mov     r1, #0
        mov     r2, r4
        bl      __ashldi3
        mvn     r3, #0
        adds    r12, r0, r3
        adc     r3, r1, r3
        and     r3, r6, r3
        and     r12, r9, r12
        orrs    r3, r12, r3
        str     r0, [sp, #0x1C]
        str     r1, [sp, #0x20]
        beq     LDKS65
        ldr     r3, [sp, #0x1C]
        adds    r9, r9, r3
        ldr     r3, [sp, #0x20]
        adc     r6, r6, r3
        b       LDKS65
LDKS99:
        mov     r3, r4, asr #31
        mov     r0, #1
        mov     r1, #0
        mov     r2, r4
        bl      __ashldi3
        ldr     lr, [sp, #0x5C]
        mvn     r3, #0
        adds    r12, r0, r3
        adc     r3, r1, r3
        and     r3, lr, r3
        and     r12, r11, r12
        orrs    r3, r12, r3
        str     r0, [sp, #0x1C]
        str     r1, [sp, #0x20]
        beq     LDKS64
        ldr     r3, [sp, #0x1C]
        ldr     r12, [sp, #0x5C]
        adds    r11, r11, r3
        ldr     r3, [sp, #0x20]
        adc     r3, r12, r3
        str     r3, [sp, #0x5C]
        b       LDKS64
LDKS100:
        mov     r3, r4, asr #31
        mov     r0, #1
        mov     r1, #0
        mov     r2, r4
        bl      __ashldi3
        ldr     lr, [sp, #0x48]
        mvn     r12, #0
        adds    r3, r0, r12
        adc     r12, r1, r12
        and     r12, r5, r12
        and     r3, lr, r3
        orrs    r12, r3, r12
        beq     LDKS70
        ldr     r3, [sp, #0x48]
        adds    r0, r3, r0
        str     r0, [sp, #0x48]
        adc     r5, r5, r1
        b       LDKS70
LDKS101:
        mov     r3, r4, asr #31
        mov     r0, #1
        mov     r1, #0
        mov     r2, r4
        bl      __ashldi3
        ldr     lr, [sp, #0x54]
        mvn     r12, #0
        adds    r3, r0, r12
        adc     r12, r1, r12
        and     r12, lr, r12
        and     r3, r10, r3
        orrs    r12, r3, r12
        beq     LDKS69
        ldr     r3, [sp, #0x54]
        adds    r10, r10, r0
        adc     r1, r3, r1
        str     r1, [sp, #0x54]
        b       LDKS69
LDKS102:
        mov     r3, r4, asr #31
        mov     r0, #1
        mov     r1, #0
        mov     r2, r4
        bl      __ashldi3
        mvn     r12, #0
        adds    r3, r0, r12
        adc     r12, r1, r12
        and     r12, r5, r12
        and     r3, r7, r3
        orrs    r12, r3, r12
        beq     LDKS84
        adds    r7, r7, r0
        adc     r5, r5, r1
        b       LDKS84
LDKS103:
        mov     r3, r4, asr #31
        mov     r0, #1
        mov     r1, #0
        mov     r2, r4
        bl      __ashldi3
        mvn     r12, #0
        adds    r3, r0, r12
        adc     r12, r1, r12
        and     r12, r6, r12
        and     r3, r8, r3
        orrs    r12, r3, r12
        beq     LDKS83
        adds    r8, r8, r0
        adc     r6, r6, r1
        b       LDKS83
LDKS104:
        tst     r6, r6
        bmi     LDKS110
        ldr     r3, [sp, #0x20]
        cmp     r8, r3
        ldr     r3, [sp, #0x1C]
        sbcs    r3, r6, r3
        mvnge   r8, #2, 2
        movge   r6, #0
        bge     LDKS105
        rsb     r2, r4, #0
        mov     r0, r8
        mov     r1, r6
        mov     r3, #0
        bl      __ashldi3
        mov     r8, r0
        mov     r6, r1
LDKS105:
        tst     r5, r5
        bmi     LDKS109
        ldr     r3, [sp, #0x20]
        cmp     r7, r3
        ldr     r3, [sp, #0x1C]
        sbcs    r3, r5, r3
        mvnge   r0, #2, 2
        movge   r1, #0
        bge     LDKS106
        rsb     r2, r4, #0
        mov     r0, r7
        mov     r1, r5
        mov     r3, #0
        bl      __ashldi3
LDKS106:
        subs    r12, r8, r10
        sbcs    r3, r6, #0
        movlt   r12, #0
        movlt   r3, #0
        orrs    r3, r12, r3
        mvnne   r8, #2, 2
        bne     LDKS107
        ldr     r3, [sp, #0x24]
        cmp     r8, #2, 2
        sbcs    r6, r6, r3
        movlt   r8, #2, 2
LDKS107:
        subs    r12, r0, r10
        sbcs    r3, r1, #0
        movlt   r12, #0
        movlt   r3, #0
        orrs    r3, r12, r3
        mvnne   r0, #2, 2
        bne     LDKS108
        ldr     r3, [sp, #0x24]
        cmp     r0, #2, 2
        sbcs    r1, r1, r3
        movlt   r0, #2, 2
LDKS108:
        ldr     r3, [sp, #0x30]
        add     r1, r3, r9
        str     r0, [r1, #4]
        str     r8, [r9, +r3]
        b       LDKS88
LDKS109:
        ldr     r3, [sp, #0x20]
        ldr     r12, [sp, #0x1C]
        rsbs    r3, r3, #0
        rsc     r12, r12, #0
        subs    r3, r7, r3
        sbcs    r12, r5, r12
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        moveq   r0, #2, 2
        mvneq   r1, #0
        beq     LDKS106
        rsb     r2, r4, #0
        mov     r0, r7
        mov     r1, r5
        mov     r3, #0
        bl      __ashldi3
        b       LDKS106
LDKS110:
        ldr     r3, [sp, #0x20]
        ldr     r12, [sp, #0x1C]
        rsbs    r3, r3, #0
        rsc     r12, r12, #0
        subs    r3, r8, r3
        sbcs    r12, r6, r12
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        moveq   r8, #2, 2
        mvneq   r6, #0
        beq     LDKS105
        rsb     r2, r4, #0
        mov     r0, r8
        mov     r1, r6
        mov     r3, #0
        bl      __ashldi3
        mov     r8, r0
        mov     r6, r1
        b       LDKS105
LDKS111:
        mov     lr, #0
        subs    lr, lr, r7
        mov     r4, #2, 2
        sbc     r4, r4, r5
        cmp     r0, lr
        sbcs    r4, r12, r4
        movlt   r7, #0
        movlt   r5, #2, 2
        blt     LDKS81
        adds    r7, r0, r7
        adc     r5, r12, r5
        b       LDKS81
LDKS112:
        mov     r0, #0
        subs    r0, r0, r8
        str     r0, [sp, #0xAC]
        mov     r0, #2, 2
        sbc     r0, r0, r6
        str     r0, [sp, #0xA8]
        ldr     r0, [sp, #0xC]
        ldr     r1, [sp, #0xAC]
        cmp     r0, r1
        ldr     r0, [sp, #0xA8]
        sbcs    r0, r11, r0
        movlt   r8, #0
        movlt   r6, #2, 2
        blt     LDKS78
        ldr     r0, [sp, #0xC]
        adds    r8, r8, r0
        adc     r6, r6, r11
        b       LDKS78
LDKS113:
        mov     r5, #0
        mov     r8, r5
        mov     r6, r8
        mov     r7, r6
        mov     r9, r11, lsl #3
        b       LDKS82
LDKS114:
        ldr     r3, [sp, #0x5C]
        tst     r3, r3
        bmi     LDKS129
        ldr     r3, [sp, #0x18]
        ldr     r12, [sp, #0x14]
        cmp     r11, r3
        ldr     r3, [sp, #0x5C]
        sbcs    r3, r3, r12
        bge     LDKS115
        ldr     r1, [sp, #0x5C]
        rsb     r2, r4, #0
        mov     r0, r11
        mov     r3, #0
        bl      __ashldi3
        mov     r11, r0
        str     r1, [sp, #0x1C]
        b       LDKS116
LDKS115:
        mov     r3, #0
        mvn     r11, #2, 2
        str     r3, [sp, #0x1C]
LDKS116:
        tst     r6, r6
        bmi     LDKS127
        ldr     r3, [sp, #0x18]
        cmp     r9, r3
        ldr     r3, [sp, #0x14]
        sbcs    r3, r6, r3
        bge     LDKS117
        rsb     r2, r4, #0
        mov     r0, r9
        mov     r1, r6
        mov     r3, #0
        bl      __ashldi3
        str     r1, [sp, #0x20]
        b       LDKS118
LDKS117:
        mov     r3, #0
        mvn     r0, #2, 2
        str     r3, [sp, #0x20]
LDKS118:
        ldr     r12, [sp, #0x1C]
        subs    r3, r11, r8
        sbcs    r12, r12, #0
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        mvnne   r11, #2, 2
        bne     LDKS119
        ldr     r3, [sp, #0x1C]
        ldr     r12, [sp, #0x44]
        cmp     r11, #2, 2
        sbcs    r3, r3, r12
        movlt   r11, #2, 2
LDKS119:
        ldr     r12, [sp, #0x20]
        subs    r3, r0, r8
        sbcs    r12, r12, #0
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        mvnne   r0, #2, 2
        bne     LDKS120
        ldr     r3, [sp, #0x20]
        ldr     r12, [sp, #0x44]
        cmp     r0, #2, 2
        sbcs    r3, r3, r12
        movlt   r0, #2, 2
LDKS120:
        ldr     r12, [sp, #0x30]
        ldr     lr, [sp, #0x54]
        add     r3, r12, r7
        str     r11, [r7, +r12]
        str     r0, [r3, #4]
        tst     lr, lr
        bmi     LDKS126
        ldr     r3, [sp, #0x18]
        ldr     r12, [sp, #0x14]
        cmp     r10, r3
        ldr     r3, [sp, #0x54]
        sbcs    r3, r3, r12
        mvnge   r9, #2, 2
        movge   r6, #0
        bge     LDKS121
        ldr     r1, [sp, #0x54]
        rsb     r2, r4, #0
        mov     r0, r10
        mov     r3, #0
        bl      __ashldi3
        mov     r9, r0
        mov     r6, r1
LDKS121:
        tst     r5, r5
        bmi     LDKS125
        ldr     r3, [sp, #0x18]
        ldr     r12, [sp, #0x48]
        cmp     r12, r3
        ldr     r3, [sp, #0x14]
        sbcs    r3, r5, r3
        mvnge   r0, #2, 2
        movge   r1, #0
        bge     LDKS122
        ldr     r0, [sp, #0x48]
        rsb     r2, r4, #0
        mov     r1, r5
        mov     r3, #0
        bl      __ashldi3
LDKS122:
        subs    r12, r9, r8
        sbcs    r3, r6, #0
        movlt   r12, #0
        movlt   r3, #0
        orrs    r3, r12, r3
        mvnne   r9, #2, 2
        bne     LDKS123
        ldr     r3, [sp, #0x44]
        cmp     r9, #2, 2
        sbcs    r6, r6, r3
        movlt   r9, #2, 2
LDKS123:
        subs    r12, r0, r8
        sbcs    r3, r1, #0
        movlt   r12, #0
        movlt   r3, #0
        orrs    r3, r12, r3
        mvnne   r0, #2, 2
        bne     LDKS124
        ldr     r3, [sp, #0x44]
        cmp     r0, #2, 2
        sbcs    r1, r1, r3
        movlt   r0, #2, 2
LDKS124:
        ldr     r3, [sp, #0x6C]
        add     r1, r7, r3
        str     r0, [r1, #4]
        str     r9, [r3, +r7]
        b       LDKS74
LDKS125:
        ldr     r3, [sp, #0x18]
        ldr     lr, [sp, #0x48]
        rsbs    r12, r3, #0
        ldr     r3, [sp, #0x14]
        rsc     r3, r3, #0
        subs    r12, lr, r12
        sbcs    r3, r5, r3
        movlt   r12, #0
        movlt   r3, #0
        orrs    r3, r12, r3
        moveq   r0, #2, 2
        mvneq   r1, #0
        beq     LDKS122
        ldr     r0, [sp, #0x48]
        rsb     r2, r4, #0
        mov     r1, r5
        mov     r3, #0
        bl      __ashldi3
        b       LDKS122
LDKS126:
        ldr     r3, [sp, #0x18]
        ldr     r12, [sp, #0x14]
        ldr     lr, [sp, #0x54]
        rsbs    r3, r3, #0
        rsc     r12, r12, #0
        subs    r3, r10, r3
        sbcs    lr, lr, r12
        movlt   r3, #0
        movlt   lr, #0
        orrs    lr, r3, lr
        moveq   r9, #2, 2
        mvneq   r6, #0
        beq     LDKS121
        ldr     r1, [sp, #0x54]
        rsb     r2, r4, #0
        mov     r0, r10
        mov     r3, #0
        bl      __ashldi3
        mov     r9, r0
        mov     r6, r1
        b       LDKS121
LDKS127:
        ldr     r3, [sp, #0x18]
        ldr     r12, [sp, #0x14]
        rsbs    r3, r3, #0
        rsc     r12, r12, #0
        subs    r3, r9, r3
        sbcs    r12, r6, r12
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        beq     LDKS128
        rsb     r2, r4, #0
        mov     r0, r9
        mov     r1, r6
        mov     r3, #0
        bl      __ashldi3
        str     r1, [sp, #0x20]
        b       LDKS118
LDKS128:
        mvn     r3, #0
        mov     r0, #2, 2
        str     r3, [sp, #0x20]
        b       LDKS118
LDKS129:
        ldr     r3, [sp, #0x18]
        ldr     r12, [sp, #0x14]
        ldr     lr, [sp, #0x5C]
        rsbs    r3, r3, #0
        rsc     r12, r12, #0
        subs    r3, r11, r3
        sbcs    lr, lr, r12
        movlt   r3, #0
        movlt   lr, #0
        orrs    lr, r3, lr
        beq     LDKS130
        ldr     r1, [sp, #0x5C]
        rsb     r2, r4, #0
        mov     r0, r11
        mov     r3, #0
        bl      __ashldi3
        mov     r11, r0
        str     r1, [sp, #0x1C]
        b       LDKS116
LDKS130:
        mvn     r3, #0
        mov     r11, #2, 2
        str     r3, [sp, #0x1C]
        b       LDKS116
LDKS131:
        ldr     r0, [sp, #0x48]
        mov     lr, #0
        subs    r0, lr, r0
        mov     lr, #2, 2
        sbc     lr, lr, r5
        cmp     r9, r0
        sbcs    lr, r2, lr
        blt     LDKS132
        ldr     r0, [sp, #0x48]
        adds    r0, r9, r0
        str     r0, [sp, #0x48]
        adc     r5, r2, r5
        b       LDKS62
LDKS132:
        mov     r0, #0
        str     r0, [sp, #0x48]
        mov     r5, #2, 2
        b       LDKS62
LDKS133:
        ldr     r2, [sp, #0x10]
        mov     r1, #0
        subs    r1, r1, r2
        ldr     r2, [sp, #0x54]
        str     r1, [sp, #0xAC]
        mov     r1, #2, 2
        sbc     r2, r1, r2
        ldr     r1, [sp, #0xAC]
        cmp     r11, r1
        sbcs    r2, r10, r2
        blt     LDKS134
        ldr     r2, [sp, #0x10]
        adds    r11, r2, r11
        ldr     r2, [sp, #0x54]
        str     r11, [sp, #0x10]
        adc     r10, r2, r10
        str     r10, [sp, #0x54]
        b       LDKS58
LDKS134:
        mov     r2, #0
        str     r2, [sp, #0x10]
        mov     r2, #2, 2
        str     r2, [sp, #0x54]
        b       LDKS58
LDKS135:
        ldr     r4, [sp, #0xC]
        mov     r9, #0
        subs    r4, r9, r4
        mov     r9, #2, 2
        sbc     r9, r9, r6
        cmp     r11, r4
        sbcs    r9, lr, r9
        blt     LDKS136
        ldr     r4, [sp, #0xC]
        adds    r11, r4, r11
        str     r11, [sp, #0xC]
        adc     r6, r6, lr
        b       LDKS56
LDKS136:
        mov     lr, #0
        str     lr, [sp, #0xC]
        mov     r6, #2, 2
        b       LDKS56
LDKS137:
        ldr     r10, [sp, #8]
        mov     r1, #0
        subs    r1, r1, r10
        ldr     r10, [sp, #0x5C]
        str     r1, [sp, #0xAC]
        mov     r1, #2, 2
        sbc     r10, r1, r10
        ldr     r1, [sp, #0xAC]
        cmp     r4, r1
        sbcs    r10, r11, r10
        blt     LDKS138
        ldr     r10, [sp, #8]
        adds    r4, r10, r4
        str     r4, [sp, #8]
        ldr     r4, [sp, #0x5C]
        adc     r11, r4, r11
        str     r11, [sp, #0x5C]
        b       LDKS52
LDKS138:
        mov     r4, #0
        str     r4, [sp, #8]
        mov     r4, #2, 2
        str     r4, [sp, #0x5C]
        b       LDKS52
LDKS139:
        mov     r5, #0
        mov     r11, r5
        mov     r9, r11
        str     r9, [sp, #0x5C]
        mov     r6, r9
        mov     r10, r6
        ldr     r3, [sp, #0x40]
        mov     r0, r10
        str     r0, [sp, #0x54]
        str     r0, [sp, #0x48]
        mov     r7, r3, lsl #3
        b       LDKS63
LDKS140:
        ldr     r1, [sp, #0x90]
        tst     r1, r1
        bmi     LDKS173
        ldr     r1, [sp, #0xC]
        ldr     r3, [sp, #0x50]
        cmp     r3, r1
        ldr     r1, [sp, #0x90]
        ldr     r3, [sp, #8]
        sbcs    r1, r1, r3
        bge     LDKS141
        ldr     r0, [sp, #0x50]
        ldr     r1, [sp, #0x90]
        ldr     r2, [sp, #0x60]
        mov     r3, #0
        bl      __ashldi3
        str     r0, [sp, #0x58]
        str     r1, [sp, #0x50]
        b       LDKS142
LDKS141:
        mvn     r1, #2, 2
        str     r1, [sp, #0x58]
        mov     r1, #0
        str     r1, [sp, #0x50]
LDKS142:
        ldr     r1, [sp, #0x94]
        tst     r1, r1
        bmi     LDKS171
        ldr     r1, [sp, #0xC]
        ldr     r3, [sp, #0x54]
        cmp     r3, r1
        ldr     r1, [sp, #0x94]
        ldr     r3, [sp, #8]
        sbcs    r1, r1, r3
        bge     LDKS143
        ldr     r0, [sp, #0x54]
        ldr     r1, [sp, #0x94]
        ldr     r2, [sp, #0x60]
        mov     r3, #0
        bl      __ashldi3
        str     r0, [sp, #0x5C]
        str     r1, [sp, #0x54]
        b       LDKS144
LDKS143:
        mvn     r1, #2, 2
        str     r1, [sp, #0x5C]
        mov     r1, #0
        str     r1, [sp, #0x54]
LDKS144:
        ldr     r1, [sp, #0x58]
        ldr     r3, [sp, #0x50]
        subs    r1, r1, r6
        sbcs    r3, r3, #0
        movlt   r1, #0
        movlt   r3, #0
        orrs    r3, r1, r3
        mvnne   r1, #2, 2
        strne   r1, [sp, #0x58]
        bne     LDKS145
        ldr     r1, [sp, #0x58]
        cmp     r1, #2, 2
        ldr     r1, [sp, #0x50]
        sbcs    r1, r1, r10
        movlt   r1, #2, 2
        strlt   r1, [sp, #0x58]
LDKS145:
        ldr     r1, [sp, #0x5C]
        ldr     r3, [sp, #0x54]
        subs    r1, r1, r6
        sbcs    r3, r3, #0
        movlt   r1, #0
        movlt   r3, #0
        orrs    r3, r1, r3
        mvnne   r1, #2, 2
        strne   r1, [sp, #0x5C]
        bne     LDKS146
        ldr     r1, [sp, #0x5C]
        cmp     r1, #2, 2
        ldr     r1, [sp, #0x54]
        sbcs    r1, r1, r10
        movlt   r1, #2, 2
        strlt   r1, [sp, #0x5C]
LDKS146:
        ldr     r12, [sp, #0x9C]
        ldr     r3, [sp, #0x30]
        tst     r12, r12
        ldr     r12, [sp, #0x58]
        add     r1, r3, r5
        str     r12, [r5, +r3]
        ldr     r3, [sp, #0x5C]
        str     r3, [r1, #4]
        bmi     LDKS169
        ldr     r1, [sp, #0xC]
        ldr     r3, [sp, #8]
        cmp     r11, r1
        ldr     r1, [sp, #0x9C]
        sbcs    r1, r1, r3
        bge     LDKS147
        mov     r0, r11
        ldr     r1, [sp, #0x9C]
        ldr     r2, [sp, #0x60]
        mov     r3, #0
        bl      __ashldi3
        str     r0, [sp, #0x58]
        str     r1, [sp, #0x54]
        b       LDKS148
LDKS147:
        mvn     r1, #2, 2
        str     r1, [sp, #0x58]
        mov     r1, #0
        str     r1, [sp, #0x54]
LDKS148:
        ldr     r1, [sp, #0x98]
        tst     r1, r1
        bmi     LDKS167
        ldr     r1, [sp, #0xC]
        ldr     r3, [sp, #8]
        cmp     r9, r1
        ldr     r1, [sp, #0x98]
        sbcs    r1, r1, r3
        bge     LDKS149
        mov     r0, r9
        ldr     r1, [sp, #0x98]
        ldr     r2, [sp, #0x60]
        mov     r3, #0
        bl      __ashldi3
        str     r0, [sp, #0x5C]
        b       LDKS150
LDKS149:
        mvn     r1, #2, 2
        str     r1, [sp, #0x5C]
        mov     r1, #0
LDKS150:
        ldr     r3, [sp, #0x58]
        ldr     r12, [sp, #0x54]
        subs    r3, r3, r6
        sbcs    r12, r12, #0
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        mvnne   r3, #2, 2
        strne   r3, [sp, #0x58]
        bne     LDKS151
        ldr     r3, [sp, #0x58]
        cmp     r3, #2, 2
        ldr     r3, [sp, #0x54]
        sbcs    r3, r3, r10
        movlt   r3, #2, 2
        strlt   r3, [sp, #0x58]
LDKS151:
        ldr     r3, [sp, #0x5C]
        subs    r3, r3, r6
        sbcs    r12, r1, #0
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        mvnne   r1, #2, 2
        strne   r1, [sp, #0x5C]
        bne     LDKS152
        ldr     r3, [sp, #0x5C]
        cmp     r3, #2, 2
        sbcs    r1, r1, r10
        movlt   r1, #2, 2
        strlt   r1, [sp, #0x5C]
LDKS152:
        ldr     r12, [sp, #0xAC]
        ldr     r3, [sp, #0x6C]
        tst     r12, r12
        ldr     r12, [sp, #0x58]
        add     r1, r5, r3
        str     r12, [r3, +r5]
        ldr     r3, [sp, #0x5C]
        str     r3, [r1, #4]
        bmi     LDKS165
        ldr     r1, [sp, #0xC]
        ldr     r3, [sp, #8]
        cmp     r7, r1
        ldr     r1, [sp, #0xAC]
        sbcs    r1, r1, r3
        bge     LDKS153
        mov     r0, r7
        ldr     r1, [sp, #0xAC]
        ldr     r2, [sp, #0x60]
        mov     r3, #0
        bl      __ashldi3
        mov     r7, r0
        str     r1, [sp, #0x5C]
        b       LDKS154
LDKS153:
        mov     r1, #0
        mvn     r7, #2, 2
        str     r1, [sp, #0x5C]
LDKS154:
        ldr     r1, [sp, #0xA8]
        tst     r1, r1
        bmi     LDKS164
        ldr     r1, [sp, #0xC]
        ldr     r3, [sp, #8]
        cmp     r8, r1
        ldr     r1, [sp, #0xA8]
        sbcs    r1, r1, r3
        mvnge   r0, #2, 2
        movge   r1, #0
        bge     LDKS155
        mov     r0, r8
        ldr     r1, [sp, #0xA8]
        ldr     r2, [sp, #0x60]
        mov     r3, #0
        bl      __ashldi3
LDKS155:
        ldr     r12, [sp, #0x5C]
        subs    r3, r7, r6
        sbcs    r12, r12, #0
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        mvnne   r7, #2, 2
        bne     LDKS156
        ldr     r3, [sp, #0x5C]
        cmp     r7, #2, 2
        sbcs    r3, r3, r10
        movlt   r7, #2, 2
LDKS156:
        subs    r12, r0, r6
        sbcs    r3, r1, #0
        movlt   r12, #0
        movlt   r3, #0
        orrs    r3, r12, r3
        mvnne   r0, #2, 2
        bne     LDKS157
        cmp     r0, #2, 2
        sbcs    r1, r1, r10
        movlt   r0, #2, 2
LDKS157:
        ldr     r3, [sp, #0x18]
        ldr     r12, [sp, #0xA4]
        add     r1, r5, r3
        str     r7, [r3, +r5]
        str     r0, [r1, #4]
        tst     r12, r12
        bmi     LDKS163
        ldr     r0, [sp, #0xC]
        ldr     r1, [sp, #0x74]
        cmp     r1, r0
        ldr     r0, [sp, #0xA4]
        ldr     r1, [sp, #8]
        sbcs    r0, r0, r1
        mvnge   r8, #2, 2
        movge   r7, #0
        bge     LDKS158
        ldr     r0, [sp, #0x74]
        ldr     r1, [sp, #0xA4]
        ldr     r2, [sp, #0x60]
        mov     r3, #0
        bl      __ashldi3
        mov     r8, r0
        mov     r7, r1
LDKS158:
        ldr     r3, [sp, #0xA0]
        tst     r3, r3
        bmi     LDKS162
        ldr     r3, [sp, #0xC]
        ldr     r12, [sp, #0x70]
        cmp     r12, r3
        ldr     r3, [sp, #0xA0]
        ldr     r12, [sp, #8]
        sbcs    r3, r3, r12
        mvnge   r0, #2, 2
        movge   r1, #0
        bge     LDKS159
        ldr     r0, [sp, #0x70]
        ldr     r1, [sp, #0xA0]
        ldr     r2, [sp, #0x60]
        mov     r3, #0
        bl      __ashldi3
LDKS159:
        subs    r12, r8, r6
        sbcs    r3, r7, #0
        movlt   r12, #0
        movlt   r3, #0
        orrs    r3, r12, r3
        mvnne   r8, #2, 2
        bne     LDKS160
        cmp     r8, #2, 2
        sbcs    r7, r7, r10
        movlt   r8, #2, 2
LDKS160:
        subs    r12, r0, r6
        sbcs    r3, r1, #0
        movlt   r12, #0
        movlt   r3, #0
        orrs    r3, r12, r3
        mvnne   r0, #2, 2
        bne     LDKS161
        cmp     r0, #2, 2
        sbcs    r1, r1, r10
        movlt   r0, #2, 2
LDKS161:
        ldr     r3, [sp, #0x1C]
        add     r1, r5, r3
        str     r0, [r1, #4]
        str     r8, [r3, +r5]
        b       LDKS47
LDKS162:
        ldr     r3, [sp, #0x70]
        ldr     r12, [sp, #0x4C]
        ldr     lr, [sp, #0x48]
        subs    r3, r3, r12
        ldr     r12, [sp, #0xA0]
        sbcs    r12, r12, lr
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        moveq   r0, #2, 2
        mvneq   r1, #0
        beq     LDKS159
        ldr     r0, [sp, #0x70]
        ldr     r1, [sp, #0xA0]
        ldr     r2, [sp, #0x60]
        mov     r3, #0
        bl      __ashldi3
        b       LDKS159
LDKS163:
        ldr     r0, [sp, #0x74]
        ldr     r1, [sp, #0x4C]
        ldr     r3, [sp, #0x48]
        subs    r0, r0, r1
        ldr     r1, [sp, #0xA4]
        sbcs    r1, r1, r3
        movlt   r0, #0
        movlt   r1, #0
        orrs    r1, r0, r1
        moveq   r8, #2, 2
        mvneq   r7, #0
        beq     LDKS158
        ldr     r0, [sp, #0x74]
        ldr     r1, [sp, #0xA4]
        ldr     r2, [sp, #0x60]
        mov     r3, #0
        bl      __ashldi3
        mov     r8, r0
        mov     r7, r1
        b       LDKS158
LDKS164:
        ldr     r1, [sp, #0x4C]
        ldr     r12, [sp, #0x48]
        ldr     r3, [sp, #0xA8]
        subs    r1, r8, r1
        sbcs    r3, r3, r12
        movlt   r1, #0
        movlt   r3, #0
        orrs    r3, r1, r3
        moveq   r0, #2, 2
        mvneq   r1, #0
        beq     LDKS155
        mov     r0, r8
        ldr     r1, [sp, #0xA8]
        ldr     r2, [sp, #0x60]
        mov     r3, #0
        bl      __ashldi3
        b       LDKS155
LDKS165:
        ldr     r1, [sp, #0x4C]
        ldr     r12, [sp, #0x48]
        ldr     r3, [sp, #0xAC]
        subs    r1, r7, r1
        sbcs    r3, r3, r12
        movlt   r1, #0
        movlt   r3, #0
        orrs    r3, r1, r3
        beq     LDKS166
        mov     r0, r7
        ldr     r1, [sp, #0xAC]
        ldr     r2, [sp, #0x60]
        mov     r3, #0
        bl      __ashldi3
        mov     r7, r0
        str     r1, [sp, #0x5C]
        b       LDKS154
LDKS166:
        mvn     r1, #0
        mov     r7, #2, 2
        str     r1, [sp, #0x5C]
        b       LDKS154
LDKS167:
        ldr     r1, [sp, #0x4C]
        ldr     r12, [sp, #0x48]
        ldr     r3, [sp, #0x98]
        subs    r1, r9, r1
        sbcs    r3, r3, r12
        movlt   r1, #0
        movlt   r3, #0
        orrs    r3, r1, r3
        beq     LDKS168
        mov     r0, r9
        ldr     r1, [sp, #0x98]
        ldr     r2, [sp, #0x60]
        mov     r3, #0
        bl      __ashldi3
        str     r0, [sp, #0x5C]
        b       LDKS150
LDKS168:
        mov     r1, #2, 2
        str     r1, [sp, #0x5C]
        mvn     r1, #0
        b       LDKS150
LDKS169:
        ldr     r1, [sp, #0x4C]
        ldr     r12, [sp, #0x48]
        ldr     r3, [sp, #0x9C]
        subs    r1, r11, r1
        sbcs    r3, r3, r12
        movlt   r1, #0
        movlt   r3, #0
        orrs    r3, r1, r3
        beq     LDKS170
        mov     r0, r11
        ldr     r1, [sp, #0x9C]
        ldr     r2, [sp, #0x60]
        mov     r3, #0
        bl      __ashldi3
        str     r0, [sp, #0x58]
        str     r1, [sp, #0x54]
        b       LDKS148
LDKS170:
        mov     r1, #2, 2
        str     r1, [sp, #0x58]
        mvn     r1, #0
        str     r1, [sp, #0x54]
        b       LDKS148
LDKS171:
        ldr     r1, [sp, #0x54]
        ldr     r3, [sp, #0x4C]
        ldr     r12, [sp, #0x48]
        subs    r1, r1, r3
        ldr     r3, [sp, #0x94]
        sbcs    r3, r3, r12
        movlt   r1, #0
        movlt   r3, #0
        orrs    r3, r1, r3
        beq     LDKS172
        ldr     r0, [sp, #0x54]
        ldr     r1, [sp, #0x94]
        ldr     r2, [sp, #0x60]
        mov     r3, #0
        bl      __ashldi3
        str     r0, [sp, #0x5C]
        str     r1, [sp, #0x54]
        b       LDKS144
LDKS172:
        mov     r1, #2, 2
        str     r1, [sp, #0x5C]
        mvn     r1, #0
        str     r1, [sp, #0x54]
        b       LDKS144
LDKS173:
        ldr     r1, [sp, #0x50]
        ldr     r3, [sp, #0x4C]
        ldr     r12, [sp, #0x48]
        subs    r1, r1, r3
        ldr     r3, [sp, #0x90]
        sbcs    r3, r3, r12
        movlt   r1, #0
        movlt   r3, #0
        orrs    r3, r1, r3
        beq     LDKS174
        ldr     r0, [sp, #0x50]
        ldr     r1, [sp, #0x90]
        ldr     r2, [sp, #0x60]
        mov     r3, #0
        bl      __ashldi3
        str     r0, [sp, #0x58]
        str     r1, [sp, #0x50]
        b       LDKS142
LDKS174:
        mov     r1, #2, 2
        str     r1, [sp, #0x58]
        mvn     r1, #0
        str     r1, [sp, #0x50]
        b       LDKS142
LDKS175:
        ldr     r1, [sp, #0x70]
        mov     r3, #0
        mov     r12, #2, 2
        subs    r1, r3, r1
        ldr     r3, [sp, #0xA0]
        sbc     r12, r12, r3
        cmp     lr, r1
        sbcs    r12, r0, r12
        blt     LDKS176
        ldr     r1, [sp, #0x70]
        adds    r1, lr, r1
        str     r1, [sp, #0x70]
        ldr     r1, [sp, #0xA0]
        adc     r1, r0, r1
        str     r1, [sp, #0xA0]
        b       LDKS25
LDKS176:
        mov     r0, #0
        str     r0, [sp, #0x70]
        mov     r0, #2, 2
        str     r0, [sp, #0xA0]
        b       LDKS25
LDKS177:
        ldr     r7, [sp, #0x74]
        mov     r8, #0
        mov     r9, #2, 2
        subs    r7, r8, r7
        ldr     r8, [sp, #0xA4]
        sbc     r9, r9, r8
        cmp     r4, r7
        sbcs    r9, r12, r9
        blt     LDKS178
        ldr     r7, [sp, #0x74]
        adds    r4, r7, r4
        str     r4, [sp, #0x74]
        ldr     r4, [sp, #0xA4]
        adc     r12, r4, r12
        str     r12, [sp, #0xA4]
        b       LDKS21
LDKS178:
        mov     r12, #0
        str     r12, [sp, #0x74]
        mov     r12, #2, 2
        str     r12, [sp, #0xA4]
        b       LDKS21
LDKS179:
        ldr     r3, [sp, #0x78]
        mov     lr, #0
        mov     r4, #2, 2
        subs    r3, lr, r3
        ldr     lr, [sp, #0xA8]
        sbc     r4, r4, lr
        cmp     r9, r3
        sbcs    r4, r12, r4
        blt     LDKS180
        ldr     r3, [sp, #0x78]
        adds    r3, r9, r3
        str     r3, [sp, #0x78]
        ldr     r3, [sp, #0xA8]
        adc     r3, r12, r3
        str     r3, [sp, #0xA8]
        b       LDKS19
LDKS180:
        mov     r3, #0
        str     r3, [sp, #0x78]
        mov     r3, #2, 2
        str     r3, [sp, #0xA8]
        b       LDKS19
LDKS181:
        ldr     r3, [sp, #0x7C]
        mov     r11, #0
        subs    r11, r11, r3
        ldr     r3, [sp, #0xAC]
        str     r11, [sp, #0xB0]
        mov     r11, #2, 2
        sbc     r3, r11, r3
        ldr     r11, [sp, #0xB0]
        cmp     r8, r11
        sbcs    r3, r7, r3
        blt     LDKS182
        ldr     r3, [sp, #0x7C]
        adds    r8, r3, r8
        ldr     r3, [sp, #0xAC]
        str     r8, [sp, #0x7C]
        adc     r7, r3, r7
        str     r7, [sp, #0xAC]
        b       LDKS15
LDKS182:
        mov     r3, #0
        str     r3, [sp, #0x7C]
        mov     r3, #2, 2
        str     r3, [sp, #0xAC]
        b       LDKS15
LDKS183:
        ldr     r3, [sp, #0x80]
        mov     lr, #0
        mov     r4, #2, 2
        subs    r3, lr, r3
        ldr     lr, [sp, #0x98]
        sbc     r4, r4, lr
        cmp     r8, r3
        sbcs    r4, r12, r4
        blt     LDKS184
        ldr     r3, [sp, #0x80]
        adds    r8, r3, r8
        ldr     r3, [sp, #0x98]
        str     r8, [sp, #0x80]
        adc     r12, r3, r12
        str     r12, [sp, #0x98]
        b       LDKS13
LDKS184:
        mov     r3, #0
        str     r3, [sp, #0x80]
        mov     r3, #2, 2
        str     r3, [sp, #0x98]
        b       LDKS13
LDKS185:
        ldr     r3, [sp, #0x84]
        mov     r11, #0
        subs    r11, r11, r3
        ldr     r3, [sp, #0x9C]
        str     r11, [sp, #0xB0]
        mov     r11, #2, 2
        sbc     r3, r11, r3
        ldr     r11, [sp, #0xB0]
        cmp     r7, r11
        sbcs    r3, r4, r3
        blt     LDKS186
        ldr     r3, [sp, #0x84]
        adds    r7, r3, r7
        ldr     r3, [sp, #0x9C]
        str     r7, [sp, #0x84]
        adc     r4, r3, r4
        str     r4, [sp, #0x9C]
        b       LDKS9
LDKS186:
        mov     r3, #0
        str     r3, [sp, #0x84]
        mov     r3, #2, 2
        str     r3, [sp, #0x9C]
        b       LDKS9
LDKS187:
        ldr     r3, [sp, #0x54]
        mov     lr, #0
        mov     r4, #2, 2
        subs    r3, lr, r3
        ldr     lr, [sp, #0x94]
        sbc     r4, r4, lr
        cmp     r8, r3
        sbcs    r4, r12, r4
        blt     LDKS188
        ldr     r3, [sp, #0x54]
        adds    r8, r3, r8
        ldr     r3, [sp, #0x94]
        str     r8, [sp, #0x54]
        adc     r12, r3, r12
        str     r12, [sp, #0x94]
        b       LDKS7
LDKS188:
        mov     r3, #0
        str     r3, [sp, #0x54]
        mov     r3, #2, 2
        str     r3, [sp, #0x94]
        b       LDKS7
LDKS189:
        ldr     r3, [sp, #0x50]
        mov     r11, #0
        subs    r11, r11, r3
        ldr     r3, [sp, #0x90]
        str     r11, [sp, #0xB0]
        mov     r11, #2, 2
        sbc     r3, r11, r3
        ldr     r11, [sp, #0xB0]
        cmp     r7, r11
        sbcs    r3, r4, r3
        blt     LDKS190
        ldr     r3, [sp, #0x50]
        adds    r7, r3, r7
        ldr     r3, [sp, #0x90]
        str     r7, [sp, #0x50]
        adc     r4, r3, r4
        str     r4, [sp, #0x90]
        b       LDKS3
LDKS190:
        mov     r3, #0
        str     r3, [sp, #0x50]
        mov     r3, #2, 2
        str     r3, [sp, #0x90]
        b       LDKS3
LDKS191:
        mov     r11, #0
        str     r11, [sp, #0xA0]
        str     r11, [sp, #0x50]
        str     r11, [sp, #0x90]
        str     r11, [sp, #0x54]
        str     r11, [sp, #0x94]
        mov     r9, r11
        str     r9, [sp, #0x9C]
        mov     r7, r9
        str     r7, [sp, #0x98]
        mov     r8, r7
        str     r8, [sp, #0xAC]
        mov     r0, r8
        str     r0, [sp, #0xA8]
        str     r0, [sp, #0x74]
        ldr     r1, [sp, #0x40]
        str     r0, [sp, #0xA4]
        str     r0, [sp, #0x70]
        mov     r5, r1, lsl #3
        b       LDKS26
LDKS192:
        sub     r12, r9, #2
        cmp     r12, #0
        str     r12, [sp]
        addgt   r12, r6, #8
        strgt   r12, [sp, #0x6C]
        bgt     LDKS48
        b       LDKS75
LDKS193:
        mvn     r0, #6
        add     sp, sp, #0xB4
        ldmia   sp!, {r4 - r11, pc}
LDKS194:
        mvn     r0, #0x76
        add     sp, sp, #0xB4
        ldmia   sp!, {r4 - r11, pc}
LDKS195:
        mvn     r0, #7
        add     sp, sp, #0xB4
        ldmia   sp!, {r4 - r11, pc}


