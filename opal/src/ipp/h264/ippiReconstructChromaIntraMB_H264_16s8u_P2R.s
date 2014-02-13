        .text
        .align  4
        .globl  _ippiReconstructChromaIntraMB_H264_16s8u_P2R


_ippiReconstructChromaIntraMB_H264_16s8u_P2R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x8C
        ldr     r5, [sp, #0xBC]
        ldr     r4, [sp, #0xB0]
        ldr     lr, [sp, #0xB4]
        ldr     r12, [sp, #0xB8]
        and     r8, r5, #4
        and     r7, r5, #1
        and     r9, r5, #0x10
        cmp     r0, #0
        mov     r6, r1
        mov     r5, r2
        beq     LKWS26
        cmp     r1, #0
        beq     LKWS26
        cmp     r2, #0
        beq     LKWS26
        ldr     r10, [r0]
        cmp     r10, #0
        beq     LKWS26
        cmp     r12, #0x27
        bhi     LKWS0
        subs    r4, r4, #3
        beq     LKWS19
        adds    r4, r4, #3
        beq     LKWS9
        subs    r9, r4, #1
        mov     r4, #8
        beq     LKWS6
        subs    r9, r9, #1
        beq     LKWS1
LKWS0:
        mvn     r0, #0xA
        add     sp, sp, #0x8C
        ldmia   sp!, {r4 - r11, pc}
LKWS1:
        cmp     r8, #0
        beq     LKWS2
        mvn     r0, #0x74
        add     sp, sp, #0x8C
        ldmia   sp!, {r4 - r11, pc}
LKWS2:
        sub     r8, r1, r3
        sub     r7, r2, r3
        str     r0, [sp, #0x38]
LKWS3:
        mov     r9, r8
        mov     r0, r7
        mov     r10, #0
LKWS4:
        ldrb    r11, [r9], #1
        strb    r11, [r6, +r10]
        ldrb    r11, [r0], #1
        strb    r11, [r5, +r10]
        add     r10, r10, #1
        cmp     r10, #8
        blt     LKWS4
        subs    r4, r4, #1
        add     r6, r3, r6
        add     r5, r3, r5
        bne     LKWS3
        ldr     r0, [sp, #0x38]
LKWS5:
        str     r12, [sp, #4]
        str     lr, [sp]
        bl      _ippiReconstructChromaInterMB_H264_16s8u_P2R
        add     sp, sp, #0x8C
        ldmia   sp!, {r4 - r11, pc}
LKWS6:
        cmp     r7, #0
        beq     LKWS7
        mvn     r0, #0x74
        add     sp, sp, #0x8C
        ldmia   sp!, {r4 - r11, pc}
LKWS7:
        mov     r7, #0
LKWS8:
        ldrb    r8, [r6, #-1]
        strb    r8, [r6, +r7]
        ldrb    r8, [r5, #-1]
        strb    r8, [r5, +r7]
        add     r7, r7, #1
        cmp     r7, #8
        blt     LKWS8
        subs    r4, r4, #1
        add     r6, r3, r6
        add     r5, r3, r5
        bne     LKWS7
        b       LKWS5
LKWS9:
        cmp     r8, #0
        mov     r10, #0
        mov     r11, #4
        bne     LKWS13
        cmp     r7, #0
        sub     r5, r1, r3
        sub     r4, r2, r3
        beq     LKWS11
        mov     r8, r10
        mov     r7, r8
        add     r5, r5, #3
        add     r4, r4, #3
        mov     r6, r7
        str     r2, [sp, #0x30]
        str     r1, [sp, #0x34]
        str     r0, [sp, #0x38]
LKWS10:
        ldrb    r0, [r5, #-3]
        ldrb    r1, [r5, #1]!
        ldrb    r2, [r4, #-3]
        ldrb    r9, [r4, #1]!
        subs    r11, r11, #1
        add     r7, r0, r7
        add     r8, r1, r8
        add     r10, r2, r10
        add     r6, r9, r6
        bne     LKWS10
        ldr     r2, [sp, #0x30]
        ldr     r1, [sp, #0x34]
        ldr     r0, [sp, #0x38]
        add     r10, r10, #2
        add     r6, r6, #2
        add     r7, r7, #2
        mov     r5, r10, asr #2
        add     r8, r8, #2
        mov     r6, r6, asr #2
        and     r11, r5, #0xFF
        and     r5, r6, #0xFF
        mov     r8, r8, asr #2
        mov     r7, r7, asr #2
        and     r10, r8, #0xFF
        and     r4, r7, #0xFF
        mov     r9, r4
        mov     r8, r10
        mov     r6, r11
        str     r5, [sp, #0x58]
        b       LKWS16
LKWS11:
        mov     r6, r10
        add     r9, r1, r3, lsl #2
        str     r9, [sp, #0x58]
        add     r9, r2, r3, lsl #2
        sub     r9, r9, #2
        str     r9, [sp, #0x10]
        sub     r9, r2, #2
        add     r4, r4, #3
        str     r9, [sp, #0x14]
        str     r4, [sp, #0x40]
        ldr     r9, [sp, #0x58]
        mov     r4, r6
        mov     r7, r4
        add     r5, r5, #3
        sub     r9, r9, #2
        str     r5, [sp, #0x3C]
        str     r7, [sp, #0x20]
        str     r9, [sp, #0xC]
        mov     r5, r7
        mov     r8, r5
        sub     r9, r1, #2
        str     r12, [sp, #0x28]
        str     lr, [sp, #0x2C]
        str     r3, [sp, #0x1C]
        str     r2, [sp, #0x30]
        str     r1, [sp, #0x34]
        ldr     r1, [sp, #0x40]
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #0x14]
        ldr     r12, [sp, #0x10]
        ldr     lr, [sp, #0x3C]
        str     r8, [sp, #0x18]
        str     r7, [sp, #0x24]
        str     r0, [sp, #0x38]
LKWS12:
        ldrb    r0, [lr, #-3]
        ldrb    r7, [lr, #1]!
        subs    r11, r11, #1
        str     r7, [sp, #0x58]
        ldrb    r7, [r9, #1]
        str     r7, [sp, #0x54]
        ldrb    r7, [r2, #1]
        str     r7, [sp, #0x50]
        ldrb    r7, [r1, #-3]
        str     r7, [sp, #0x4C]
        ldrb    r7, [r1, #1]!
        str     r7, [sp, #0x48]
        ldrb    r7, [r3, #1]
        str     r7, [sp, #0x44]
        ldrb    r7, [r12, #1]
        str     r7, [sp, #8]
        ldr     r7, [sp, #0x24]
        add     r7, r0, r7
        ldr     r0, [sp, #0x20]
        str     r7, [sp, #0x24]
        ldr     r7, [sp, #0x58]
        add     r0, r7, r0
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #0x54]
        ldr     r7, [sp, #0x48]
        add     r4, r0, r4
        ldr     r0, [sp, #0x50]
        add     r6, r0, r6
        ldr     r0, [sp, #0x4C]
        add     r10, r0, r10
        ldr     r0, [sp, #0x18]
        add     r0, r7, r0
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x44]
        add     r8, r0, r8
        ldr     r0, [sp, #8]
        add     r5, r0, r5
        ldr     r0, [sp, #0x1C]
        add     r12, r12, r0
        add     r3, r3, r0
        add     r2, r2, r0
        add     r9, r9, r0
        bne     LKWS12
        ldr     r7, [sp, #0x24]
        ldr     r12, [sp, #0x28]
        ldr     lr, [sp, #0x2C]
        ldr     r3, [sp, #0x1C]
        ldr     r2, [sp, #0x30]
        ldr     r1, [sp, #0x34]
        ldr     r0, [sp, #0x38]
        add     r7, r4, r7
        add     r10, r8, r10
        add     r4, r7, #4
        ldr     r8, [sp, #0x20]
        add     r7, r10, #4
        mov     r4, r4, asr #3
        mov     r7, r7, asr #3
        and     r11, r7, #0xFF
        add     r7, r6, r8
        add     r6, r6, #2
        and     r4, r4, #0xFF
        add     r8, r8, #2
        mov     r6, r6, asr #2
        and     r9, r6, #0xFF
        ldr     r6, [sp, #0x18]
        add     r7, r7, #4
        mov     r8, r8, asr #2
        mov     r7, r7, asr #3
        and     r10, r8, #0xFF
        and     r8, r7, #0xFF
        add     r7, r5, r6
        add     r6, r6, #2
        str     r6, [sp, #0x58]
        add     r6, r5, #2
        ldr     r5, [sp, #0x58]
        add     r7, r7, #4
        mov     r6, r6, asr #2
        mov     r5, r5, asr #2
        mov     r7, r7, asr #3
        and     r7, r7, #0xFF
        and     r5, r5, #0xFF
        and     r6, r6, #0xFF
        str     r7, [sp, #0x58]
        b       LKWS16
LKWS13:
        cmp     r7, #0
        beq     LKWS14
        mov     r11, #0x80
        mov     r8, r11
        mov     r9, r8
        mov     r10, r9
        mov     r4, r10
        mov     r6, r4
        str     r6, [sp, #0x58]
        mov     r5, r6
        b       LKWS16
LKWS14:
        mov     r9, r10
        sub     r6, r2, #2
        str     r6, [sp, #0x40]
        str     lr, [sp, #0x2C]
        ldr     lr, [sp, #0x40]
        add     r4, r1, r3, lsl #2
        add     r5, r2, r3, lsl #2
        mov     r8, r9
        sub     r4, r4, #2
        sub     r5, r5, #2
        mov     r7, r8
        sub     r6, r1, #2
        str     r12, [sp, #0x28]
        str     r2, [sp, #0x30]
        str     r1, [sp, #0x34]
        str     r0, [sp, #0x38]
LKWS15:
        ldrb    r0, [r6, #1]
        ldrb    r1, [r4, #1]
        ldrb    r2, [lr, #1]
        ldrb    r12, [r5, #1]
        subs    r11, r11, #1
        add     r8, r0, r8
        add     r9, r1, r9
        add     r10, r2, r10
        add     r7, r12, r7
        add     r5, r5, r3
        add     lr, lr, r3
        add     r4, r4, r3
        add     r6, r6, r3
        bne     LKWS15
        ldr     r12, [sp, #0x28]
        ldr     lr, [sp, #0x2C]
        ldr     r2, [sp, #0x30]
        ldr     r1, [sp, #0x34]
        ldr     r0, [sp, #0x38]
        add     r7, r7, #2
        add     r8, r8, #2
        add     r9, r9, #2
        add     r10, r10, #2
        mov     r7, r7, asr #2
        mov     r8, r8, asr #2
        mov     r9, r9, asr #2
        mov     r10, r10, asr #2
        and     r6, r7, #0xFF
        and     r4, r8, #0xFF
        and     r11, r10, #0xFF
        and     r9, r9, #0xFF
        mov     r10, r4
        mov     r8, r9
        mov     r5, r11
        str     r6, [sp, #0x58]
LKWS16:
        add     r7, r1, r3, lsl #2
        str     r7, [sp, #0x54]
        add     r7, r2, r3, lsl #2
        str     r7, [sp, #0x20]
        add     r7, r1, #4
        str     r7, [sp, #0x50]
        ldr     r7, [sp, #0x54]
        str     r1, [sp, #0x4C]
        add     r7, r7, #4
        str     r7, [sp, #0x48]
        add     r7, r2, #4
        str     r7, [sp, #0x24]
        ldr     r7, [sp, #0x20]
        str     r2, [sp, #0x44]
        str     r11, [sp, #0xC]
        add     r7, r7, #4
        str     r7, [sp, #0x18]
        mov     r7, #4
        str     r7, [sp, #0x10]
        str     r8, [sp, #8]
        str     r9, [sp, #0x3C]
        str     r10, [sp, #0x40]
        str     r4, [sp, #0x14]
        str     r12, [sp, #0x28]
        str     lr, [sp, #0x2C]
        str     r2, [sp, #0x30]
        str     r1, [sp, #0x34]
        ldr     r4, [sp, #0x10]
        ldr     r11, [sp, #0x18]
        ldr     r9, [sp, #0x20]
        ldr     r10, [sp, #0x24]
        ldr     r1, [sp, #0x44]
        ldr     r2, [sp, #0x48]
        ldr     r12, [sp, #0x54]
        ldr     lr, [sp, #0x50]
        ldr     r7, [sp, #0x4C]
        ldr     r8, [sp, #0x58]
        str     r0, [sp, #0x38]
LKWS17:
        str     r11, [sp, #0x18]
        str     r9, [sp, #0x20]
        str     r10, [sp, #0x24]
        str     r3, [sp, #0x1C]
        ldr     r3, [sp, #0xC]
        ldr     r9, [sp, #8]
        ldr     r10, [sp, #0x3C]
        ldr     r11, [sp, #0x40]
        mov     r0, #0
        str     r4, [sp, #0x10]
LKWS18:
        ldr     r4, [sp, #0x14]
        strb    r4, [r7, +r0]
        strb    r11, [lr, +r0]
        strb    r10, [r12, +r0]
        strb    r9, [r2, +r0]
        strb    r3, [r1, +r0]
        ldr     r4, [sp, #0x24]
        strb    r5, [r4, +r0]
        ldr     r4, [sp, #0x20]
        strb    r6, [r4, +r0]
        ldr     r4, [sp, #0x18]
        strb    r8, [r4, +r0]
        add     r0, r0, #1
        cmp     r0, #4
        blt     LKWS18
        ldr     r3, [sp, #0x1C]
        ldr     r4, [sp, #0x10]
        ldr     r11, [sp, #0x18]
        ldr     r9, [sp, #0x20]
        ldr     r10, [sp, #0x24]
        subs    r4, r4, #1
        add     r7, r3, r7
        add     lr, r3, lr
        add     r12, r3, r12
        add     r2, r3, r2
        add     r1, r3, r1
        add     r10, r3, r10
        add     r9, r3, r9
        add     r11, r3, r11
        bne     LKWS17
        ldr     r12, [sp, #0x28]
        ldr     lr, [sp, #0x2C]
        ldr     r2, [sp, #0x30]
        ldr     r1, [sp, #0x34]
        ldr     r0, [sp, #0x38]
        b       LKWS5
LKWS19:
        cmp     r8, #0
        bne     LKWS20
        cmp     r7, #0
        bne     LKWS20
        cmp     r9, #0
        beq     LKWS21
LKWS20:
        mvn     r0, #0x74
        add     sp, sp, #0x8C
        ldmia   sp!, {r4 - r11, pc}
LKWS21:
        sub     r7, r1, r3
        rsb     r5, r3, r1
        rsb     r6, r3, r2
        sub     r4, r2, r3
        sub     r7, r7, #2
        sub     r6, r6, #2
        sub     r5, r5, #2
        sub     r4, r4, #2
        mov     r8, #0
        str     r2, [sp, #0x30]
        str     r1, [sp, #0x34]
        str     r0, [sp, #0x38]
LKWS22:
        ldrb    r9, [r5, #1]
        ldrb    r11, [r7, #1]!
        ldrb    r0, [r4, #1]!
        ldrb    r1, [r6, #1]
        add     r2, sp, #0x74
        strb    r9, [r8, +r2]
        add     r10, sp, #0x80
        add     r9, sp, #0x68
        add     r2, sp, #0x5C
        strb    r11, [r8, +r10]
        strb    r0, [r8, +r9]
        strb    r1, [r8, +r2]
        add     r8, r8, #1
        cmp     r8, #9
        add     r5, r5, r3
        add     r6, r6, r3
        blt     LKWS22
        ldr     r2, [sp, #0x30]
        ldr     r1, [sp, #0x34]
        ldr     r0, [sp, #0x38]
        mov     r9, #0
        mov     r11, r9
        mov     r10, r11
        mov     r4, r10
        mov     r5, #1
        str     lr, [sp, #0x2C]
        str     r3, [sp, #0x1C]
        str     r2, [sp, #0x30]
        str     r1, [sp, #0x34]
        str     r0, [sp, #0x38]
LKWS23:
        add     r0, sp, #0x74
        add     r2, sp, #0x80
        add     r8, sp, #0x5C
        add     r6, sp, #0x68
        add     r1, sp, #0x74
        add     r3, sp, #0x80
        add     lr, sp, #0x5C
        add     r7, sp, #0x68
        add     r0, r0, r5
        ldrb    r0, [r0, #4]
        add     r2, r2, r5
        ldrb    r2, [r2, #4]
        add     r8, r8, r5
        ldrb    r8, [r8, #4]
        add     r6, r6, r5
        sub     r1, r1, r5
        ldrb    r1, [r1, #4]
        sub     r3, r3, r5
        ldrb    r3, [r3, #4]
        sub     lr, lr, r5
        ldrb    lr, [lr, #4]
        ldrb    r6, [r6, #4]
        sub     r7, r7, r5
        ldrb    r7, [r7, #4]
        sub     r0, r0, r1
        mla     r10, r5, r0, r10
        sub     r2, r2, r3
        mla     r11, r5, r2, r11
        sub     r8, r8, lr
        mla     r9, r5, r8, r9
        sub     r6, r6, r7
        mla     r4, r5, r6, r4
        add     r5, r5, #1
        cmp     r5, #4
        ble     LKWS23
        ldr     lr, [sp, #0x2C]
        ldr     r3, [sp, #0x1C]
        ldr     r2, [sp, #0x30]
        ldr     r1, [sp, #0x34]
        ldr     r0, [sp, #0x38]
        add     r6, sp, #0x80
        ldrb    r8, [r6, #8]
        add     r5, sp, #0x74
        add     r6, sp, #0x5C
        add     r7, sp, #0x68
        ldrb    r5, [r5, #8]
        ldrb    r7, [r7, #8]
        ldrb    r6, [r6, #8]
        add     r11, r11, r11, lsl #4
        add     r4, r4, r4, lsl #4
        add     r11, r11, #0x10
        add     r4, r4, #0x10
        add     r5, r8, r5
        add     r6, r7, r6
        add     r10, r10, r10, lsl #4
        add     r9, r9, r9, lsl #4
        mov     r11, r11, asr #5
        mov     r4, r4, asr #5
        add     r10, r10, #0x10
        sub     r8, r11, r11, lsl #2
        sub     r7, r4, r4, lsl #2
        add     r9, r9, #0x10
        add     r5, r8, r5, lsl #4
        add     r6, r7, r6, lsl #4
        mov     r10, r10, asr #5
        mov     r9, r9, asr #5
        str     r2, [sp, #0xC]
        sub     r8, r10, r10, lsl #2
        sub     r7, r9, r9, lsl #2
        str     r11, [sp, #0x24]
        ldr     r11, [sp, #0xC]
        add     r8, r5, r8
        add     r7, r6, r7
        str     r4, [sp, #0x20]
        mov     r5, r1
        mov     r6, #8
        str     r12, [sp, #0x28]
        str     lr, [sp, #0x2C]
        str     r2, [sp, #0x30]
        str     r1, [sp, #0x34]
        str     r0, [sp, #0x38]
        mov     r4, #0xFF
LKWS24:
        mov     r2, r5
        str     r5, [sp, #8]
        str     r6, [sp, #0x10]
        ldr     r5, [sp, #0x20]
        ldr     r6, [sp, #0x24]
        str     r3, [sp, #0x1C]
        add     lr, r8, #0x10
        add     r12, r7, #0x10
        mov     r1, r11
        mov     r0, #8
        str     r11, [sp, #0xC]
        str     r9, [sp, #0x14]
        str     r10, [sp, #0x18]
        mov     r3, #0
LKWS25:
        mov     r10, lr, asr #5
        cmp     r10, #0xFF
        mov     r9, r4
        movlt   r9, r10
        cmp     r9, #0
        movlt   r9, r3
        mov     r10, r12, asr #5
        cmp     r10, #0xFF
        mov     r11, r4
        movlt   r11, r10
        cmp     r11, #0
        strb    r9, [r2], #1
        movlt   r11, r3
        strb    r11, [r1], #1
        subs    r0, r0, #1
        add     lr, lr, r6
        add     r12, r12, r5
        bne     LKWS25
        ldr     r6, [sp, #0x10]
        ldr     r5, [sp, #8]
        ldr     r11, [sp, #0xC]
        ldr     r3, [sp, #0x1C]
        ldr     r9, [sp, #0x14]
        ldr     r10, [sp, #0x18]
        subs    r6, r6, #1
        add     r11, r11, r3
        add     r5, r5, r3
        add     r8, r8, r10
        add     r7, r7, r9
        bne     LKWS24
        ldr     r12, [sp, #0x28]
        ldr     lr, [sp, #0x2C]
        ldr     r2, [sp, #0x30]
        ldr     r1, [sp, #0x34]
        ldr     r0, [sp, #0x38]
        b       LKWS5
LKWS26:
        mvn     r0, #7
        add     sp, sp, #0x8C
        ldmia   sp!, {r4 - r11, pc}


