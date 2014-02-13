        .text
        .align  4
        .globl  _ippsReQuantizeSfb_MP3_32s_I


_ippsReQuantizeSfb_MP3_32s_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #6, 26
        add     r12, sp, #0x12, 28
        ldr     r10, [sp, #0x1A4]
        and     r4, r12, #0xF
        ldr     r9, [sp, #0x1A8]
        ldr     r11, [sp, #0x1AC]
        ldr     r12, [sp, #0x1B0]
        rsb     r4, r4, #0
        mov     r6, r0
        and     r4, r4, #0xF
        add     lr, sp, #0x12, 28
        cmp     r6, #0
        add     r4, lr, r4
        mov     r5, r1
        mov     r8, r2
        mov     r7, r3
        beq     LGDN144
        cmp     r5, #0
        beq     LGDN144
        cmp     r8, #0
        beq     LGDN144
        cmp     r7, #0
        beq     LGDN144
        cmp     r10, #0
        beq     LGDN144
        cmp     r9, #0
        beq     LGDN144
        cmp     r11, #0
        beq     LGDN144
        cmp     r12, #0
        beq     LGDN144
        ldr     r2, [r10]
        cmp     r2, #1
        ble     LGDN1
LGDN0:
        mvn     r0, #0xAA
        add     sp, sp, #6, 26
        ldmia   sp!, {r4 - r11, pc}
LGDN1:
        cmp     r2, #0
        blt     LGDN0
        ldr     r1, [r10, #0x10]
        cmp     r1, #2
        ble     LGDN3
LGDN2:
        mvn     r0, #0xAA
        add     sp, sp, #6, 26
        ldmia   sp!, {r4 - r11, pc}
LGDN3:
        cmp     r1, #0
        blt     LGDN2
        ldr     r0, [r10, #0x1C]
        cmp     r0, #3
        ble     LGDN5
LGDN4:
        mvn     r0, #0xAA
        add     sp, sp, #6, 26
        ldmia   sp!, {r4 - r11, pc}
LGDN5:
        cmp     r0, #0
        blt     LGDN4
        ldr     lr, [r10, #0x20]
        cmp     lr, #3
        ble     LGDN7
LGDN6:
        mvn     r0, #0xAA
        add     sp, sp, #6, 26
        ldmia   sp!, {r4 - r11, pc}
LGDN7:
        cmp     lr, #0
        blt     LGDN6
        add     r3, r2, r2, lsl #1
        add     r1, r1, r3
        str     r1, [sp, #0x9C]
        rsb     r3, r1, r1, lsl #2
        mov     r1, r1, lsl #5
        str     r1, [sp, #0x98]
        ldr     r1, [sp, #0x9C]
        cmp     r0, #1
        rsb     r3, r1, r3, lsl #3
        str     r3, [sp, #0x94]
        ldr     r3, [sp, #0x98]
        sub     r1, r3, r1, lsl #2
        ldr     r3, [sp, #0x94]
        add     r12, r1, r12
        str     r12, [sp, #0x90]
        mov     r3, r3, lsl #1
        str     r3, [sp, #0x40]
        add     r3, r3, r11
        str     r3, [sp, #0x3C]
        beq     LGDN141
        mov     r12, #0
        str     r12, [sp, #0x38]
        str     r12, [sp, #0x34]
LGDN8:
        cmp     r0, #3
        moveq   r12, #1
        streq   r12, [sp, #0x30]
        movne   r12, #2
        strne   r12, [sp, #0x30]
        ldr     r12, [sp, #0x34]
        cmp     r12, #0
        bne     LGDN9
        ldr     r12, [sp, #0x38]
        cmp     r12, #0
        beq     LGDN10
LGDN9:
        ldr     r12, [r7, #0x14]
        ldr     lr, [r7, #0x5C]
        cmp     r12, lr
        bne     LGDN111
        ldr     r12, [r7, #0x18]
        ldr     lr, [r7, #0x60]
        cmp     r12, lr
        beq     LGDN10
        mvn     r0, #0xA9
        add     sp, sp, #6, 26
        ldmia   sp!, {r4 - r11, pc}
LGDN10:
        ldr     r12, [sp, #0x30]
        str     r6, [sp, #0x7C]
        cmp     r12, #0
        ble     LGDN13
        ldr     r0, [sp, #0x90]
        mov     r1, #0
        str     r5, [sp, #0x68]
        str     r11, [sp, #0x48]
        str     r9, [sp, #0x50]
        ldr     r11, [sp, #0x68]
        ldr     r9, [sp, #0x7C]
        mov     lr, r1
        mov     r12, lr
        sub     r3, r0, #2
        mov     r0, r7
        str     r3, [sp, #0x78]
        str     r4, [sp, #0x4C]
        str     r10, [sp, #0x54]
        str     r7, [sp, #0x2C]
        str     r8, [sp, #0x28]
        str     r5, [sp, #0x24]
        str     r6, [sp, #0x20]
LGDN11:
        ldr     r3, [r0, #0x14]
        cmp     r3, #3
        bgt     LGDN140
        cmp     r3, #0
        blt     LGDN139
        ldr     r6, [r0, #0x18]
        cmp     r6, #1
        bgt     LGDN138
        cmp     r6, #0
        blt     LGDN137
        ldr     r5, [r11], #4
        cmp     r5, #9, 26
        bgt     LGDN136
        cmp     r5, #0
        blt     LGDN135
        cmp     r3, #2
        beq     LGDN117
LGDN12:
        ldr     r3, [sp, #0x30]
        add     lr, lr, #1
        add     r9, r9, #9, 24
        cmp     lr, r3
        add     r0, r0, #0x48
        add     r12, r12, #1
        add     r1, r1, #0xC
        blt     LGDN11
        ldr     r4, [sp, #0x4C]
        ldr     r11, [sp, #0x48]
        ldr     r9, [sp, #0x50]
        ldr     r10, [sp, #0x54]
        ldr     r7, [sp, #0x2C]
        ldr     r8, [sp, #0x28]
        ldr     r5, [sp, #0x24]
        ldr     r6, [sp, #0x20]
LGDN13:
        mov     r0, r4
        mov     r1, #0x28
        bl      ownsZero_8u
        add     r0, r4, #0x28
        str     r0, [sp, #0x64]
        mov     r1, #0x28
        bl      ownsZero_8u
        ldr     r12, [sp, #0x34]
        cmp     r12, #0
        bne     LGDN14
        ldr     r12, [sp, #0x38]
        cmp     r12, #0
        moveq   r12, #0
        streq   r12, [sp, #0x7C]
        beq     LGDN23
LGDN14:
        ldr     lr, [r7, #0x18]
        add     r12, r8, #0x28
        str     r12, [sp, #0x68]
        cmp     lr, #0
        ldrne   r12, [r7, #0x14]
        strne   r12, [sp, #0x74]
        bne     LGDN15
        ldr     r12, [r7, #0x14]
        cmp     r12, #2
        str     r12, [sp, #0x74]
        moveq   r12, #0
        streq   r12, [sp, #0x7C]
        beq     LGDN22
LGDN15:
        ldr     r12, [sp, #0x38]
        cmp     r12, #0
        ldrne   r12, [r5, #4]
        bne     LGDN16
        ldr     lr, [r5, #4]
        ldr     r12, [r5]
        cmp     r12, lr
        movle   r12, lr
LGDN16:
        ldr     lr, [sp, #0x74]
        cmp     lr, #2
        movne   lr, #0x16
        strne   lr, [sp, #0x78]
        beq     LGDN67
LGDN17:
        ldr     lr, [sp, #0x3C]
        ldrsh   lr, [lr, #0x2A]
        cmp     lr, r12
        movlt   lr, #0x15
        blt     LGDN18
        ldr     lr, [sp, #0x3C]
        ldrsh   lr, [lr, #0x28]
        cmp     lr, r12
        movlt   lr, #0x14
        blt     LGDN18
        ldr     lr, [sp, #0x3C]
        ldrsh   lr, [lr, #0x26]
        cmp     lr, r12
        movlt   lr, #0x13
        blt     LGDN18
        ldr     lr, [sp, #0x3C]
        ldrsh   lr, [lr, #0x24]
        cmp     lr, r12
        movlt   lr, #0x12
        blt     LGDN18
        ldr     lr, [sp, #0x3C]
        ldrsh   lr, [lr, #0x22]
        cmp     lr, r12
        movlt   lr, #0x11
        blt     LGDN18
        ldr     lr, [sp, #0x3C]
        ldrsh   lr, [lr, #0x20]
        cmp     lr, r12
        movlt   lr, #0x10
        blt     LGDN18
        ldr     lr, [sp, #0x3C]
        ldrsh   lr, [lr, #0x1E]
        cmp     lr, r12
        movlt   lr, #0xF
        blt     LGDN18
        ldr     lr, [sp, #0x3C]
        ldrsh   lr, [lr, #0x1C]
        cmp     lr, r12
        movlt   lr, #0xE
        blt     LGDN18
        ldr     lr, [sp, #0x3C]
        ldrsh   lr, [lr, #0x1A]
        cmp     lr, r12
        movlt   lr, #0xD
        blt     LGDN18
        ldr     lr, [sp, #0x3C]
        ldrsh   lr, [lr, #0x18]
        cmp     lr, r12
        movlt   lr, #0xC
        blt     LGDN18
        ldr     lr, [sp, #0x3C]
        ldrsh   lr, [lr, #0x16]
        cmp     lr, r12
        movlt   lr, #0xB
        blt     LGDN18
        ldr     lr, [sp, #0x3C]
        ldrsh   lr, [lr, #0x14]
        cmp     lr, r12
        movlt   lr, #0xA
        blt     LGDN18
        ldr     lr, [sp, #0x3C]
        ldrsh   lr, [lr, #0x12]
        cmp     lr, r12
        movlt   lr, #9
        blt     LGDN18
        ldr     lr, [sp, #0x3C]
        ldrsh   lr, [lr, #0x10]
        cmp     lr, r12
        movlt   lr, #8
        blt     LGDN18
        ldr     lr, [sp, #0x3C]
        ldrsh   lr, [lr, #0xE]
        cmp     lr, r12
        movlt   lr, #7
        blt     LGDN18
        ldr     lr, [sp, #0x3C]
        ldrsh   lr, [lr, #0xC]
        cmp     lr, r12
        movlt   lr, #6
        blt     LGDN18
        ldr     lr, [sp, #0x3C]
        ldrsh   lr, [lr, #0xA]
        cmp     lr, r12
        movlt   lr, #5
        blt     LGDN18
        ldr     lr, [sp, #0x3C]
        ldrsh   lr, [lr, #8]
        cmp     lr, r12
        movlt   lr, #4
        blt     LGDN18
        ldr     lr, [sp, #0x3C]
        ldrsh   lr, [lr, #6]
        cmp     lr, r12
        movlt   lr, #3
        blt     LGDN18
        ldr     lr, [sp, #0x3C]
        ldrsh   lr, [lr, #4]
        cmp     lr, r12
        movlt   lr, #2
        blt     LGDN18
        ldr     lr, [sp, #0x3C]
        ldrsh   lr, [lr, #2]
        cmp     lr, r12
        movlt   lr, #1
        blt     LGDN18
        ldr     lr, [sp, #0x40]
        ldrsh   lr, [r11, +lr]
        cmp     lr, r12
        movlt   lr, #0
        mvnge   lr, #0
LGDN18:
        ldr     r12, [sp, #0x34]
        add     lr, lr, #1
        str     lr, [sp, #0x7C]
        cmp     r12, #0
        beq     LGDN22
        ldr     r11, [sp, #0x7C]
        mov     r1, r4
        mov     r0, #2
        mov     r2, r11
        bl      ownsSet_8u
        ldr     r1, [sp, #0x64]
        mov     r2, r11
        mov     r0, #2
        bl      ownsSet_8u
        ldr     r12, [sp, #0x38]
        cmp     r12, #0
        ldreq   r12, [r7, #0x14]
        streq   r12, [sp, #0x74]
        beq     LGDN22
        ldr     r12, [sp, #0x7C]
        ldr     lr, [sp, #0x78]
        cmp     r12, lr
        ldrge   r12, [r7, #0x14]
        strge   r12, [sp, #0x74]
        bge     LGDN22
        ldr     lr, [sp, #0x68]
        ldr     r1, [sp, #0x78]
        mov     r0, #2
        add     lr, r12, lr
        add     r11, r12, r4
LGDN19:
        ldrsb   r3, [lr], #1
        cmp     r3, #7
        beq     LGDN55
LGDN20:
        cmp     r3, #0
        blt     LGDN53
LGDN21:
        add     r12, r12, #1
        cmp     r12, r1
        add     r11, r11, #1
        blt     LGDN19
        ldr     r12, [r7, #0x14]
        str     r12, [sp, #0x74]
LGDN22:
        ldr     r12, [sp, #0x74]
        cmp     r12, #2
        beq     LGDN56
LGDN23:
        ldr     r12, [sp, #0x30]
        cmp     r12, #0
        ble     LGDN37
        mvn     r2, #2, 2
        mov     lr, #0
        mov     r3, #0x1F
        mov     r1, r7
        mov     r0, r6
        mov     r12, r8
        mov     r11, r5
        str     r2, [sp, #0x78]
        str     r10, [sp, #0x54]
        str     r7, [sp, #0x2C]
        str     r8, [sp, #0x28]
        str     r5, [sp, #0x24]
LGDN24:
        ldr     r2, [r1, #8]
        ldr     r3, [r1, #0x40]
        ldr     r10, [r1, #0x14]
        ldr     r8, [r1, #0x18]
        ldr     r7, [r1, #0x3C]
        rsb     r2, r2, #0xD2
        cmp     r2, #0xD2
        add     r3, r3, #1
        bgt     LGDN116
        cmn     r2, #0x2D
        blt     LGDN115
        cmp     r3, #2
        bgt     LGDN114
        cmp     r3, #1
        blt     LGDN113
        cmp     r7, #1
        bgt     LGDN112
        cmp     r7, #0
        blt     LGDN111
        cmp     r10, #2
        add     r5, sp, #0xC0
        beq     LGDN81
        ldr     r10, [r11]
        str     r0, [r5, +lr, lsl #2]
        cmp     r10, #0
        ble     LGDN36
        str     r9, [sp, #0x50]
        ldr     r9, [pc, #0xFB8]
        mov     r8, #0
        mov     r5, r8
        str     r10, [sp, #0x48]
        str     r11, [sp, #0x44]
        str     r7, [sp, #0x64]
        str     r3, [sp, #0x58]
        str     r2, [sp, #0x5C]
        str     r12, [sp, #0x60]
        str     r0, [sp, #0x68]
        str     r1, [sp, #0x40]
        str     lr, [sp, #0x6C]
        str     r4, [sp, #0x4C]
        str     r6, [sp, #0x20]
LGDN25:
        ldr     r0, [sp, #0x60]
        ldrsb   r1, [r5, +r0]
        cmp     r1, #0
        rsblt   r1, r1, #0
        ldr     r0, [pc, #0xF74]
        ldr     r3, [sp, #0x64]
        mov     r12, #0x1F
        ldrb    r2, [r5, +r0]
        ldr     r0, [sp, #0x4C]
        mov     r11, #0x1F
        mla     r1, r3, r2, r1
        ldrsb   r0, [r0, +r5]
        ldr     r2, [sp, #0x5C]
        add     r5, r5, #1
        mov     r3, r5, lsl #1
        add     r2, r2, r0
        ldr     r0, [sp, #0x3C]
        ldrsh   lr, [r0, +r3]
        ldr     r3, [sp, #0x58]
        ldr     r0, [sp, #0x68]
        add     r3, r2, r1, lsl r3
        ldr     r1, [pc, #0xF34]
        and     r2, r3, #3
        mov     r3, r3, asr #2
        add     r7, r3, #2
        ldr     r1, [r1, +r2, lsl #2]
        cmp     r7, #0x1F
        movgt   r7, r12
        add     r2, r9, r2, lsl #6
        ldr     r10, [r2, #4]
        ldr     r4, [r2, #8]
        ldr     r6, [r2, #0xC]
        sub     r12, r3, #1
        mov     r10, r10, asr r7
        mov     r4, r4, asr r7
        cmp     r12, #0x1F
        mov     r7, r6, asr r7
        add     r6, sp, #0x11, 28
        str     r10, [r6, #4]
        add     r6, sp, #0x11, 28
        add     r0, r0, r8, lsl #2
        str     r4, [r6, #8]
        movgt   r12, r11
        sub     r8, lr, r8
        add     r4, sp, #0x11, 28
        cmp     r8, #0
        str     r7, [r4, #0xC]
        ble     LGDN34
        ldr     r10, [sp, #0x78]
        ldr     r11, [pc, #0xEC8]
        str     lr, [sp, #0x74]
        str     r5, [sp, #0x70]
LGDN26:
        ldr     r9, [r0]
        cmp     r9, #0
        mov     lr, r9
        beq     LGDN33
        cmp     r9, #0
        rsblt   lr, r9, #0
        cmp     lr, #4
        addlt   r4, sp, #0x11, 28
        ldrlt   lr, [r4, +lr, lsl #2]
        blt     LGDN32
        cmp     lr, #0x10
        bge     LGDN27
        ldr     lr, [r2, +lr, lsl #2]
        cmp     r12, #0
        rsble   r4, r12, #0
        movle   lr, lr, lsl r4
        movgt   lr, lr, asr r12
        b       LGDN32
LGDN27:
        cmp     lr, #0x40
        bge     LGDN28
        add     lr, r11, lr, lsl #2
        ldr     r5, [lr, #-0x40]
        mov     r4, #4
        b       LGDN30
LGDN28:
        cmp     lr, #0x80
        bgt     LGDN29
        add     lr, r11, lr, lsl #2
        ldr     r5, [lr, #-0x40]
        mov     r4, #6
        b       LGDN30
LGDN29:
        mov     r4, #0xE
        add     r4, r4, #2, 20
        cmp     r4, lr
        blt     LGDN68
        mov     r6, lr, lsl #17
        cmp     r6, #2, 6
        movge   lr, #0
        movlt   r6, lr, lsl #21
        movlt   lr, #4
        cmp     r6, #2, 4
        movlt   r6, r6, lsl #2
        addlt   lr, lr, #2
        cmp     r6, #1, 2
        movlt   r6, r6, lsl #1
        addlt   lr, lr, #1
        ldr     r4, [pc, #0xE0C]
        ldr     r5, [pc, #0xE0C]
        rsb     lr, lr, #6
        smull   r4, r7, r4, r6
        ldr     r4, [pc, #0xE04]
        add     r5, r7, r5
        smull   r7, r5, r6, r5
        ldr     r7, [pc, #0xDFC]
        sub     r5, r5, r7
        smull   r5, r7, r6, r5
        add     r4, r7, r4
        smull   r5, r4, r6, r4
        ldr     r7, [pc, #0xDEC]
        ldr     r5, [pc, #0xDEC]
        sub     r4, r4, r7
        smull   r7, r4, r6, r4
        ldr     r7, [pc, #0xDE4]
        add     r7, r4, r7
        smull   r7, r4, r6, r7
        ldr     r7, [pc, #0xDDC]
        add     r5, r4, r5
        smull   r5, r4, r6, r5
        ldr     r5, [pc, #0xDD4]
        ldr     r7, [r7, +lr, lsl #2]
        sub     r4, r4, r5
        ldr     r5, [pc, #0xDCC]
        mov     r4, r4, lsl #4
        ldr     lr, [r5, +lr, lsl #2]
        smull   r4, r5, r7, r4
        mov     r5, r5, lsl #1
        rsb     r4, lr, #0x1B
LGDN30:
        smull   r5, lr, r1, r5
        subs    r4, r3, r4
        bmi     LGDN31
        cmp     r4, #0x1F
        movgt   r4, #0x1F
        mov     lr, lr, asr r4
        b       LGDN32
LGDN31:
        rsb     r4, r4, #0
        cmp     lr, r10, asr r4
        movle   lr, lr, lsl r4
        mvngt   lr, #2, 2
LGDN32:
        cmp     r9, #0
        rsblt   lr, lr, #0
LGDN33:
        str     lr, [r0], #4
        subs    r8, r8, #1
        bne     LGDN26
        ldr     lr, [sp, #0x74]
        ldr     r5, [sp, #0x70]
        ldr     r9, [pc, #0xD38]
        str     r10, [sp, #0x78]
LGDN34:
        mov     r0, #0
LGDN35:
        cmp     r0, #0
        bne     LGDN142
        ldr     r0, [sp, #0x48]
        mov     r8, lr
        cmp     lr, r0
        blt     LGDN25
        ldr     r11, [sp, #0x44]
        ldr     r12, [sp, #0x60]
        ldr     r0, [sp, #0x68]
        ldr     r1, [sp, #0x40]
        ldr     lr, [sp, #0x6C]
        ldr     r4, [sp, #0x4C]
        ldr     r9, [sp, #0x50]
        ldr     r6, [sp, #0x20]
LGDN36:
        ldr     r2, [sp, #0x30]
        add     lr, lr, #1
        add     r1, r1, #0x48
        cmp     lr, r2
        add     r0, r0, #9, 24
        add     r4, r4, #0x28
        add     r12, r12, #0x28
        add     r11, r11, #4
        blt     LGDN24
        ldr     r10, [sp, #0x54]
        ldr     r7, [sp, #0x2C]
        ldr     r8, [sp, #0x28]
        ldr     r5, [sp, #0x24]
LGDN37:
        ldr     r12, [sp, #0x34]
        cmp     r12, #0
        bne     LGDN38
        ldr     r12, [sp, #0x38]
        cmp     r12, #0
        beq     LGDN42
LGDN38:
        ldr     r12, [r7, #0x18]
        ldr     lr, [r7, #0x54]
        cmp     r12, #0
        and     r4, lr, #1
        ldrne   r12, [r7, #0x14]
        bne     LGDN39
        ldr     r12, [r7, #0x14]
        cmp     r12, #2
        beq     LGDN41
LGDN39:
        cmp     r12, #2
        beq     LGDN70
        ldr     r12, [r5, #4]
        ldr     r9, [r5]
        cmp     r9, r12
        movle   r9, r12
        str     r9, [r5, #4]
LGDN40:
        str     r9, [r5]
        str     r4, [sp, #0x14]
        ldr     r12, [sp, #0x3C]
        add     lr, sp, #0xC0
        add     r2, r8, #0x28
        str     r12, [sp, #0x10]
        ldr     r11, [r10]
        str     r9, [sp, #8]
        add     r12, sp, #0xC0
        str     r11, [sp, #0xC]
        ldr     r9, [sp, #0x7C]
        str     r9, [sp, #4]
        ldr     r9, [sp, #0x38]
        str     r9, [sp]
        ldr     r0, [lr]
        ldr     r1, [r12, #4]
        ldr     r3, [sp, #0x34]
        bl      LGDN__sStereoLong_MP3_32s_I
        cmp     r0, #0
        ldreq   r12, [r7, #0x14]
        bne     LGDN109
LGDN41:
        cmp     r12, #2
        beq     LGDN69
        b       LGDN45
LGDN42:
        ldr     r2, [sp, #0x30]
        cmp     r2, #0
        ble     LGDN45
        mov     r4, r7
        mov     lr, r5
        ldr     r2, [sp, #0x30]
        mov     r12, #0
LGDN43:
        ldr     r8, [r4, #0x14]
        cmp     r8, #2
        beq     LGDN80
LGDN44:
        add     r12, r12, #1
        cmp     r12, r2
        add     r4, r4, #0x48
        add     lr, lr, #4
        blt     LGDN43
LGDN45:
        ldr     r2, [sp, #0x30]
        subs    r4, r2, #1
        bmi     LGDN52
        add     r12, r4, r4, lsl #3
        rsb     r2, r4, r4, lsl #2
        add     r8, r7, r12, lsl #3
        add     r6, r6, r12, lsl #8
        mov     r7, r2, lsl #2
        add     r9, r5, r4, lsl #2
LGDN46:
        ldr     r0, [r8, #0x14]
        cmp     r0, #2
        ldrne   r2, [r9]
        movne   r10, r4, lsl #2
        beq     LGDN71
LGDN47:
        subs    r0, r2, #1
        bmi     LGDN51
        cmp     r0, #6
        blt     LGDN49
LGDN48:
        ldr     r2, [r6, +r0, lsl #2]
        cmp     r2, #0
        bne     LGDN51
        sub     r0, r0, #1
        ldr     r2, [r6, +r0, lsl #2]
        cmp     r2, #0
        bne     LGDN51
        sub     r0, r0, #1
        ldr     r2, [r6, +r0, lsl #2]
        cmp     r2, #0
        bne     LGDN51
        sub     r0, r0, #1
        ldr     r2, [r6, +r0, lsl #2]
        cmp     r2, #0
        bne     LGDN51
        sub     r0, r0, #1
        ldr     r2, [r6, +r0, lsl #2]
        cmp     r2, #0
        bne     LGDN51
        sub     r0, r0, #1
        cmp     r0, #6
        bge     LGDN48
LGDN49:
        add     r3, r6, r0, lsl #2
LGDN50:
        ldr     r2, [r3], #-4
        cmp     r2, #0
        bne     LGDN51
        subs    r0, r0, #1
        bpl     LGDN50
LGDN51:
        add     r0, r0, #1
        subs    r4, r4, #1
        str     r0, [r10, +r5]
        sub     r6, r6, #9, 24
        sub     r8, r8, #0x48
        sub     r9, r9, #4
        sub     r7, r7, #0xC
        bpl     LGDN46
LGDN52:
        mov     r0, #0
        add     sp, sp, #6, 26
        ldmia   sp!, {r4 - r11, pc}
LGDN53:
        ldr     r2, [r10]
        cmp     r2, #0
        bne     LGDN21
LGDN54:
        strb    r0, [r11]
        b       LGDN21
LGDN55:
        ldr     r2, [r10]
        cmp     r2, #0
        bne     LGDN54
        b       LGDN20
LGDN56:
        ldr     r12, [sp, #0x38]
        add     r3, sp, #0xA0
        add     lr, sp, #0xA0
        cmp     r12, #0
        beq     LGDN57
        ldr     r12, [r3, #0xC]!
        add     r0, sp, #0xA0
        add     r1, sp, #0xA0
        str     r12, [sp, #0x6C]
        ldr     r11, [lr, #0x10]!
        str     r11, [sp, #0x84]
        ldr     r1, [r1]
        ldr     r2, [r0, #0x14]!
        str     r1, [sp, #0x88]
        add     r1, sp, #0xA0
        ldr     r1, [r1, #4]
        str     r1, [sp, #0x8C]
        add     r1, sp, #0xA0
        ldr     r1, [r1, #8]
        str     r3, [sp, #0x5C]
        add     r3, sp, #0xC8
        str     r12, [r3]
        str     lr, [sp, #0x58]
        add     r12, sp, #0xC8
        str     r11, [r12, #4]
        str     r0, [sp, #0x80]
        add     r12, sp, #0xC8
        str     r2, [r12, #8]
        add     r12, sp, #0xA0
        add     r12, r12, #4
        str     r12, [sp, #0x40]
        add     r12, sp, #0xA0
        add     r12, r12, #8
        str     r12, [sp, #0x60]
        b       LGDN58
LGDN57:
        ldr     r3, [r3]
        str     r3, [sp, #0x88]
        ldr     r12, [lr, #0xC]!
        str     lr, [sp, #0x5C]
        cmp     r3, r12
        str     r12, [sp, #0x6C]
        ldrle   lr, [sp, #0x6C]
        ldrgt   lr, [sp, #0x88]
        add     r1, sp, #0xA0
        ldr     r12, [r1, #4]!
        str     r1, [sp, #0x40]
        add     r0, sp, #0xA0
        str     r12, [sp, #0x8C]
        ldr     r1, [r0, #0x10]!
        add     r11, sp, #0xC8
        str     r1, [sp, #0x84]
        str     lr, [r11]
        cmp     r12, r1
        str     r0, [sp, #0x58]
        ldrle   r12, [sp, #0x84]
        ldrgt   r12, [sp, #0x8C]
        add     r0, sp, #0xA0
        ldr     r1, [r0, #8]!
        add     r11, sp, #0xA0
        str     r0, [sp, #0x60]
        ldr     r2, [r11, #0x14]!
        add     lr, sp, #0xC8
        str     r12, [lr, #4]
        cmp     r1, r2
        str     r11, [sp, #0x80]
        movle   r12, r2
        movgt   r12, r1
        add     lr, sp, #0xC8
        str     r12, [lr, #8]
LGDN58:
        ldr     r12, [sp, #0x34]
        cmp     r12, #0
        beq     LGDN64
        add     r12, sp, #0xEC
        mov     r11, #0
        str     r11, [sp, #0x74]
        ldr     r12, [r12]
        add     lr, sp, #0xE4
        str     r12, [sp, #0x70]
        str     r11, [sp, #0x78]
        ldr     lr, [lr]
        add     r12, r12, r12, lsl #1
        ldr     r11, [sp, #0x64]
        sub     lr, lr, r12
        ldr     r12, [sp, #0x68]
        add     r0, r4, lr
        str     r4, [sp, #0x4C]
        str     r5, [sp, #0x24]
        str     r6, [sp, #0x20]
        ldr     r3, [sp, #0x78]
        ldr     r4, [sp, #0x74]
        ldr     r5, [sp, #0x70]
        ldr     r6, [sp, #0x38]
        add     r12, r12, lr
        add     lr, lr, r11
        str     r2, [sp, #0x44]
        mov     r11, r0
        str     r1, [sp, #0x48]
        str     r9, [sp, #0x50]
        str     r7, [sp, #0x2C]
        str     r8, [sp, #0x28]
        mov     r2, #2
LGDN59:
        add     r1, sp, #0xC8
        ldr     r1, [r1, +r3, lsl #2]
        mov     r8, r5
        cmp     r5, r1
        bge     LGDN61
        add     r9, r8, r8, lsl #1
        add     r7, r9, r11
        add     r9, r9, lr
LGDN60:
        strb    r2, [r7], #3
        add     r8, r8, #1
        strb    r2, [r9], #3
        cmp     r8, r1
        blt     LGDN60
LGDN61:
        cmp     r6, #0
        beq     LGDN63
        ldr     r8, [r10]
        add     r7, sp, #0xA0
        cmp     r8, #1
        beq     LGDN65
        ldr     r9, [r7, +r4, lsl #2]
        cmp     r1, r9
        bge     LGDN63
        add     r8, r1, r1, lsl #1
        add     r7, r8, r12
        sub     r1, r9, r1
LGDN62:
        ldrsb   r9, [r7], #3
        cmp     r9, #0
        addlt   r9, r3, r0
        strltb  r2, [r9, +r8]
        subs    r1, r1, #1
        add     r8, r8, #3
        bne     LGDN62
LGDN63:
        add     r3, r3, #1
        cmp     r3, #3
        add     r4, r4, #1
        add     r11, r11, #1
        add     lr, lr, #1
        add     r12, r12, #1
        blt     LGDN59
        ldr     r2, [sp, #0x44]
        ldr     r1, [sp, #0x48]
        ldr     r4, [sp, #0x4C]
        ldr     r9, [sp, #0x50]
        ldr     r7, [sp, #0x2C]
        ldr     r8, [sp, #0x28]
        ldr     r5, [sp, #0x24]
        ldr     r6, [sp, #0x20]
LGDN64:
        ldr     lr, [sp, #0x6C]
        ldr     r12, [sp, #0x88]
        cmp     r12, lr
        ldrle   r12, [sp, #0x6C]
        strle   r12, [sp, #0x88]
        ldr     r11, [sp, #0x84]
        ldr     lr, [sp, #0x8C]
        add     r12, sp, #0xA0
        cmp     lr, r11
        ldr     r11, [sp, #0x88]
        ldr     lr, [sp, #0x5C]
        str     r11, [lr]
        str     r11, [r12]
        ldrle   r12, [sp, #0x84]
        strle   r12, [sp, #0x8C]
        ldr     lr, [sp, #0x58]
        ldr     r12, [sp, #0x8C]
        cmp     r1, r2
        str     r12, [lr]
        ldr     lr, [sp, #0x40]
        str     r12, [lr]
        movle   r1, r2
        ldr     r12, [sp, #0x80]
        str     r1, [r12]
        ldr     r12, [sp, #0x60]
        str     r1, [r12]
        b       LGDN23
LGDN65:
        ldr     r9, [r7, +r4, lsl #2]
        cmp     r1, r9
        bge     LGDN63
        add     r8, r1, r1, lsl #1
        add     r7, r8, r12
        sub     r1, r9, r1
LGDN66:
        ldrsb   r9, [r7], #3
        cmp     r9, #7
        addeq   r9, r3, r0
        streqb  r2, [r9, +r8]
        subs    r1, r1, #1
        add     r8, r8, #3
        bne     LGDN66
        b       LGDN63
LGDN67:
        cmp     r12, #0x24
        movge   r12, #0x24
        ldr     lr, [r10]
        cmp     lr, #0
        moveq   lr, #6
        streq   lr, [sp, #0x78]
        movne   lr, #8
        strne   lr, [sp, #0x78]
        b       LGDN17
LGDN68:
        ldr     lr, [sp, #0x74]
        ldr     r5, [sp, #0x70]
        ldr     r9, [pc, #0x7A4]
        str     r10, [sp, #0x78]
        mvn     r0, #1
        b       LGDN35
LGDN69:
        add     lr, sp, #0xA0
        str     lr, [sp, #0x18]
        str     r4, [sp, #0x1C]
        add     r12, sp, #0xEC
        ldr     lr, [r12, #4]
        ldr     r3, [sp, #0x34]
        add     r12, sp, #0xE4
        str     lr, [sp, #0x14]
        ldr     r12, [r12, #4]
        ldr     lr, [sp, #0x90]
        add     r2, r8, #0x28
        str     r12, [sp, #0x10]
        str     lr, [sp, #0xC]
        ldr     r12, [sp, #0x38]
        ldr     r10, [r10]
        str     r12, [sp]
        add     r12, sp, #0xC8
        str     r12, [sp, #4]
        str     r10, [sp, #8]
        add     lr, sp, #0xC0
        add     r12, sp, #0xC0
        ldr     r1, [lr, #4]
        ldr     r0, [r12]
        bl      LGDN__sStereoShort_MP3_32s_I
        cmp     r0, #0
        bne     LGDN109
        add     r12, sp, #0xB8
        add     r2, sp, #0xB8
        ldr     r12, [r12, #4]
        ldr     r2, [r2]
        cmp     r2, r12
        movgt   r12, r2
        add     r12, r12, r12, lsl #1
        str     r12, [r5, #4]
        str     r12, [r5]
        b       LGDN45
LGDN70:
        ldr     r9, [r5]
        cmp     r9, #0x24
        movge   r9, #0x24
        b       LGDN40
LGDN71:
        add     r2, sp, #0xC0
        ldr     r2, [r2, +r4, lsl #2]
        ldr     r11, [r8, #0x18]
        add     r0, sp, #0xA0
        str     r2, [sp, #0x2C]
        ldr     r2, [r9]
        add     r0, r0, r7
        cmp     r11, #0
        str     r2, [sp, #0x34]
        str     r0, [sp, #0x28]
        str     r6, [sp, #0x54]
        mov     r10, r4, lsl #2
        moveq   r0, #0
        beq     LGDN72
        mov     r1, r6
        ldr     r0, [sp, #0x2C]
        mov     r2, #0x90
        bl      ownsCopy_8u
        mov     r0, #3
LGDN72:
        ldr     r2, [sp, #0x34]
        mov     r3, #0xC9
        orr     r3, r3, #0xF1, 24
        rsb     r12, r2, r2, lsl #3
        str     r10, [sp, #0x3C]
        add     r12, r12, r12, lsl #6
        ldr     r10, [sp, #0x28]
        add     r12, r2, r12, lsl #3
        add     r2, r12, r3
        mov     r3, r11, lsl #5
        add     r11, r3, r11, lsl #2
        mov     r2, r2, asr #16
        str     r9, [sp, #0x40]
        ldr     r9, [sp, #0x54]
        add     r3, r2, r2, lsl #4
        add     r2, r2, r3
        mov     r12, #0
        add     r3, r11, #6
        str     r7, [sp, #0x44]
        str     r8, [sp, #0x48]
        str     r6, [sp, #0x4C]
        str     r4, [sp, #0x50]
        str     r5, [sp, #0x24]
LGDN73:
        ldr     r5, [r10], #4
        mov     r8, r11
        mov     r7, r3
        cmp     r0, r5
        mov     r6, r0
        bge     LGDN77
        ldr     r1, [sp, #0x90]
        str     r11, [sp, #0x30]
        ldr     r11, [sp, #0x2C]
        mov     lr, #2
        add     r1, r1, r6, lsl #1
        add     r4, r9, #4
        add     lr, lr, r1
        str     r10, [sp, #0x28]
        str     r3, [sp, #0x20]
        str     r2, [sp, #0x34]
        str     r0, [sp, #0x38]
LGDN74:
        ldrsh   r3, [r1], #2
        ldrsh   r2, [lr], #2
        add     r0, r3, r3, lsl #1
        sub     r2, r2, r3
        mla     r3, r12, r2, r0
        add     r2, r2, r3
        cmp     r3, r2
        bge     LGDN76
        mov     r0, #4
        add     r10, r11, r3, lsl #2
        add     r0, r0, r10
LGDN75:
        ldr     r11, [r10], #8
        str     r11, [r9, +r8, lsl #2]
        ldr     r11, [r0], #8
        str     r11, [r4, +r8, lsl #2]
        add     r8, r8, #2
        cmp     r8, r7
        addeq   r8, r8, #0xC
        addeq   r7, r7, #0x12
        add     r3, r3, #2
        cmp     r3, r2
        blt     LGDN75
        ldr     r11, [sp, #0x2C]
LGDN76:
        add     r6, r6, #1
        cmp     r6, r5
        blt     LGDN74
        ldr     r10, [sp, #0x28]
        ldr     r3, [sp, #0x20]
        ldr     r11, [sp, #0x30]
        ldr     r2, [sp, #0x34]
        ldr     r0, [sp, #0x38]
LGDN77:
        cmp     r8, r2
        bge     LGDN79
        add     lr, r9, #4
        mov     r1, #0
LGDN78:
        str     r1, [r9, +r8, lsl #2]
        str     r1, [lr, +r8, lsl #2]
        add     r8, r8, #2
        cmp     r8, r7
        addeq   r8, r8, #0xC
        addeq   r7, r7, #0x12
        cmp     r8, r2
        blt     LGDN78
LGDN79:
        add     r12, r12, #1
        cmp     r12, #3
        add     r9, r9, #0x18
        blt     LGDN73
        ldr     r10, [sp, #0x3C]
        ldr     r5, [sp, #0x24]
        ldr     r9, [sp, #0x40]
        ldr     r7, [sp, #0x44]
        ldr     r8, [sp, #0x48]
        ldr     r2, [r5, +r10]
        ldr     r6, [sp, #0x4C]
        ldr     r4, [sp, #0x50]
        mov     r0, #0xC9
        rsb     r3, r2, r2, lsl #3
        orr     r0, r0, #0xF1, 24
        add     r3, r3, r3, lsl #6
        add     r3, r2, r3, lsl #3
        add     r0, r3, r0
        mov     r0, r0, asr #16
        add     r2, r0, r0, lsl #4
        add     r2, r0, r2
        str     r2, [r5, +r10]
        b       LGDN47
LGDN80:
        add     r8, sp, #0xB8
        ldr     r8, [r8, +r12, lsl #2]
        add     r8, r8, r8, lsl #1
        str     r8, [lr]
        b       LGDN44
LGDN81:
        str     r9, [r5, +lr, lsl #2]
        mov     r5, r9
        add     r9, lr, lr, lsl #3
        cmp     r8, #0
        add     r9, r6, r9, lsl #8
        beq     LGDN93
        str     r9, [sp, #0x50]
        ldr     r9, [pc, #0x4D8]
        mov     r10, #0
        mov     r8, r10
        str     r5, [sp, #0x98]
        str     r11, [sp, #0x44]
        str     r7, [sp, #0x64]
        str     r3, [sp, #0x58]
        str     r2, [sp, #0x5C]
        str     r12, [sp, #0x60]
        str     r0, [sp, #0x68]
        str     r1, [sp, #0x40]
        str     lr, [sp, #0x6C]
        str     r4, [sp, #0x4C]
        str     r6, [sp, #0x20]
LGDN82:
        ldr     r0, [sp, #0x60]
        ldrsb   r0, [r8, +r0]
        cmp     r0, #0
        rsblt   r0, r0, #0
        ldr     r1, [pc, #0x48C]
        ldr     r3, [sp, #0x64]
        mov     r6, #0x1F
        ldrb    r2, [r8, +r1]
        ldr     r1, [sp, #0x4C]
        mla     r0, r3, r2, r0
        ldr     r2, [sp, #0x5C]
        ldrsb   r1, [r1, +r8]
        add     r8, r8, #1
        mov     r3, r8, lsl #1
        add     r2, r2, r1
        ldr     r1, [sp, #0x3C]
        ldrsh   lr, [r1, +r3]
        ldr     r3, [sp, #0x58]
        ldr     r1, [sp, #0x50]
        add     r2, r2, r0, lsl r3
        ldr     r3, [pc, #0x448]
        and     r0, r2, #3
        ldr     r5, [r9, +r0, lsl #2]
        mov     r2, r2, asr #2
        add     r7, r2, #2
        cmp     r7, #0x1F
        add     r12, r3, r0, lsl #6
        ldr     r3, [r12, #4]
        ldr     r0, [r12, #8]
        ldr     r11, [r12, #0xC]
        movgt   r7, r6
        sub     r4, r2, #1
        cmp     r4, #0x1F
        mov     r3, r3, asr r7
        mov     r0, r0, asr r7
        mov     r7, r11, asr r7
        ldr     r11, [sp, #0x98]
        movgt   r4, r6
        sub     r6, lr, r10
        add     r1, r1, r10, lsl #2
        add     r10, r11, r10, lsl #2
        add     r11, sp, #0xD4
        str     r3, [r11, #4]
        add     r3, sp, #0xD4
        str     r0, [r3, #8]
        add     r0, sp, #0xD4
        cmp     r6, #0
        str     r7, [r0, #0xC]
        ble     LGDN91
        str     lr, [sp, #0x9C]
        ldr     r3, [sp, #0x78]
        ldr     lr, [pc, #0x3D8]
        str     r8, [sp, #0x94]
LGDN83:
        ldr     r0, [r1], #4
        cmp     r0, #0
        mov     r7, r0
        beq     LGDN90
        cmp     r0, #0
        rsblt   r7, r0, #0
        cmp     r7, #4
        addlt   r8, sp, #0xD4
        ldrlt   r7, [r8, +r7, lsl #2]
        blt     LGDN89
        cmp     r7, #0x10
        bge     LGDN84
        ldr     r7, [r12, +r7, lsl #2]
        cmp     r4, #0
        rsble   r8, r4, #0
        movle   r7, r7, lsl r8
        movgt   r7, r7, asr r4
        b       LGDN89
LGDN84:
        cmp     r7, #0x40
        bge     LGDN85
        add     r7, lr, r7, lsl #2
        ldr     r9, [r7, #-0x40]
        mov     r8, #4
        b       LGDN87
LGDN85:
        cmp     r7, #0x80
        bgt     LGDN86
        add     r7, lr, r7, lsl #2
        ldr     r9, [r7, #-0x40]
        mov     r8, #6
        b       LGDN87
LGDN86:
        mov     r8, #0xE
        add     r8, r8, #2, 20
        cmp     r8, r7
        blt     LGDN107
        mov     r8, r7, lsl #17
        cmp     r8, #2, 6
        movge   r7, #0
        movlt   r8, r7, lsl #21
        movlt   r7, #4
        cmp     r8, #2, 4
        movlt   r8, r8, lsl #2
        addlt   r7, r7, #2
        cmp     r8, #1, 2
        movlt   r8, r8, lsl #1
        addlt   r7, r7, #1
        ldr     r9, [pc, #0x320]
        rsb     r7, r7, #6
        smull   r11, r9, r9, r8
        ldr     r11, [pc, #0x318]
        add     r11, r9, r11
        smull   r11, r9, r8, r11
        ldr     r11, [pc, #0x314]
        sub     r9, r9, r11
        smull   r11, r9, r8, r9
        ldr     r11, [pc, #0x304]
        add     r11, r9, r11
        smull   r11, r9, r8, r11
        ldr     r11, [pc, #0x300]
        sub     r9, r9, r11
        smull   r11, r9, r8, r9
        ldr     r11, [pc, #0x2FC]
        add     r11, r9, r11
        smull   r11, r9, r8, r11
        ldr     r11, [pc, #0x2EC]
        add     r11, r9, r11
        smull   r8, r9, r8, r11
        ldr     r8, [pc, #0x2E8]
        ldr     r11, [pc, #0x2E8]
        ldr     r8, [r8, +r7, lsl #2]
        sub     r9, r9, r11
        ldr     r11, [pc, #0x2E0]
        mov     r9, r9, lsl #4
        smull   r9, r8, r8, r9
        mov     r9, r8, lsl #1
        ldr     r7, [r11, +r7, lsl #2]
        rsb     r8, r7, #0x1B
LGDN87:
        smull   r9, r7, r5, r9
        subs    r8, r2, r8
        bmi     LGDN88
        cmp     r8, #0x1F
        movgt   r8, #0x1F
        mov     r7, r7, asr r8
        b       LGDN89
LGDN88:
        rsb     r8, r8, #0
        cmp     r7, r3, asr r8
        movle   r7, r7, lsl r8
        mvngt   r7, #2, 2
LGDN89:
        cmp     r0, #0
        rsblt   r7, r7, #0
LGDN90:
        str     r7, [r10], #4
        subs    r6, r6, #1
        bne     LGDN83
        ldr     lr, [sp, #0x9C]
        ldr     r8, [sp, #0x94]
        ldr     r9, [pc, #0x254]
        str     r3, [sp, #0x78]
LGDN91:
        mov     r0, #0
LGDN92:
        cmp     r0, #0
        bne     LGDN143
        cmp     lr, #0x24
        mov     r10, lr
        blt     LGDN82
        ldr     r5, [sp, #0x98]
        ldr     r11, [sp, #0x44]
        ldr     r3, [sp, #0x58]
        ldr     r2, [sp, #0x5C]
        ldr     r12, [sp, #0x60]
        ldr     r0, [sp, #0x68]
        ldr     r1, [sp, #0x40]
        ldr     lr, [sp, #0x6C]
        ldr     r4, [sp, #0x4C]
        ldr     r9, [sp, #0x50]
        ldr     r6, [sp, #0x20]
LGDN93:
        mov     r7, r1
        str     r0, [sp, #0x68]
        ldr     r0, [sp, #0x90]
        mov     r10, #0
        mov     r8, r10
        str     r5, [sp, #0x98]
        str     r11, [sp, #0x44]
        str     r3, [sp, #0x58]
        str     r1, [sp, #0x40]
        str     r9, [sp, #0x50]
        str     r6, [sp, #0x20]
LGDN94:
        ldr     r3, [r7, #0x28]
        mov     r9, r3, lsl #3
        cmp     r9, #0x38
        bgt     LGDN110
        cmp     r9, #0
        blt     LGDN109
        rsb     r11, lr, lr, lsl #2
        add     r3, sp, #0xA0
        add     r5, sp, #0xEC
        add     r6, sp, #0xE4
        add     r11, r3, r11, lsl #2
        ldr     r3, [r11, +r10]
        ldr     r5, [r5, +lr, lsl #2]
        ldr     r6, [r6, +lr, lsl #2]
        cmp     r5, r3
        add     r6, r6, r8
        bge     LGDN106
        add     r9, r2, r9
        str     r9, [sp, #0x9C]
        add     r9, r6, r12
        mov     r1, #2
        add     r11, r0, r5, lsl #1
        add     r6, r6, r4
        sub     r3, r3, r5
        add     r1, r1, r11
        str     r6, [sp, #0x8C]
        str     r3, [sp, #0x88]
        str     r7, [sp, #0x74]
        str     r8, [sp, #0x80]
        str     r10, [sp, #0x70]
        str     r2, [sp, #0x5C]
        str     r12, [sp, #0x60]
        str     lr, [sp, #0x6C]
        str     r4, [sp, #0x4C]
LGDN95:
        ldrsh   r12, [r11], #2
        ldrsh   r3, [r1], #2
        ldrsb   r0, [r9], #3
        add     r2, r12, r12, lsl #1
        sub     lr, r3, r12
        ldr     r3, [sp, #0x80]
        cmp     r0, #0
        mla     r12, r3, lr, r2
        rsblt   r0, r0, #0
        ldr     r3, [sp, #0x8C]
        mov     r4, #0x1F
        mov     r10, #0x1F
        ldrsb   r2, [r3], #3
        str     r3, [sp, #0x8C]
        ldr     r3, [sp, #0x50]
        add     r3, r3, r12, lsl #2
        str     r3, [sp, #0x84]
        ldr     r3, [sp, #0x9C]
        add     r2, r3, r2
        ldr     r3, [sp, #0x58]
        add     r2, r2, r0, lsl r3
        and     r3, r2, #3
        ldr     r0, [pc, #0xFC]
        mov     r2, r2, asr #2
        add     r7, r2, #2
        ldr     r0, [r0, +r3, lsl #2]
        cmp     r7, #0x1F
        movgt   r7, r4
        ldr     r4, [pc, #0xDC]
        add     r3, r4, r3, lsl #6
        ldr     r6, [r3, #4]
        ldr     r5, [r3, #8]
        ldr     r8, [r3, #0xC]
        sub     r4, r2, #1
        mov     r6, r6, asr r7
        mov     r5, r5, asr r7
        mov     r7, r8, asr r7
        ldr     r8, [sp, #0x98]
        cmp     r4, #0x1F
        movgt   r4, r10
        cmp     lr, #0
        add     r12, r8, r12, lsl #2
        add     r8, sp, #1, 24
        str     r6, [r8, #4]
        add     r6, sp, #1, 24
        str     r5, [r6, #8]
        add     r5, sp, #1, 24
        str     r7, [r5, #0xC]
        ble     LGDN104
        ldr     r5, [sp, #0x84]
        ldr     r6, [sp, #0x78]
        ldr     r7, [pc, #0x8C]
        str     r9, [sp, #0x94]
        str     r11, [sp, #0x48]
        str     r1, [sp, #0x64]
LGDN96:
        ldr     r1, [r5], #4
        cmp     r1, #0
        mov     r8, r1
        beq     LGDN103
        cmp     r1, #0
        rsblt   r8, r1, #0
        cmp     r8, #4
        addlt   r9, sp, #1, 24
        ldrlt   r8, [r9, +r8, lsl #2]
        blt     LGDN102
        cmp     r8, #0x10
        bge     LGDN97
        ldr     r8, [r3, +r8, lsl #2]
        cmp     r4, #0
        rsble   r9, r4, #0
        movle   r8, r8, lsl r9
        movgt   r8, r8, asr r4
        b       LGDN102
LGDN97:
        cmp     r8, #0x40
        bge     LGDN98
        add     r8, r7, r8, lsl #2
        ldr     r10, [r8, #-0x40]
        mov     r9, #4
        b       LGDN100
LGDN98:
        cmp     r8, #0x80
        bgt     LGDN99
        add     r8, r7, r8, lsl #2
        ldr     r10, [r8, #-0x40]
        mov     r9, #6
        b       LGDN100
        .long   LGDN__pReq16x4
        .long   LGDN__pPretab
        .long   LGDN__pMP3Sqrt14_32s
        .long   LGDN__pMP3Sqrt43
        .long   0xe4b9115a
        .long   0x562f89de
        .long   0x65cb31ec
        .long   0x79615329
        .long   0x3b1fd2f9
        .long   0x079a1f60
        .long   0x1feebc56
        .long   LGDN__pMP3Xt43
        .long   0x00189d37
        .long   LGDN__pXtExp
LGDN99:
        mov     r9, #0xE
        add     r9, r9, #2, 20
        cmp     r9, r8
        blt     LGDN108
        mov     r9, r8, lsl #17
        cmp     r9, #2, 6
        movge   r8, #0
        movlt   r9, r8, lsl #21
        movlt   r8, #4
        cmp     r9, #2, 4
        movlt   r9, r9, lsl #2
        addlt   r8, r8, #2
        cmp     r9, #1, 2
        movlt   r9, r9, lsl #1
        addlt   r8, r8, #1
        ldr     r10, [pc, #-0x6C]
        rsb     r8, r8, #6
        smull   r11, r10, r10, r9
        ldr     r11, [pc, #-0x74]
        add     r11, r10, r11
        smull   r11, r10, r9, r11
        ldr     r11, [pc, #-0x78]
        sub     r10, r10, r11
        smull   r11, r10, r9, r10
        ldr     r11, [pc, #-0x88]
        add     r11, r10, r11
        smull   r11, r10, r9, r11
        ldr     r11, [pc, #-0x8C]
        sub     r10, r10, r11
        smull   r11, r10, r9, r10
        ldr     r11, [pc, #-0x90]
        add     r11, r10, r11
        smull   r11, r10, r9, r11
        ldr     r11, [pc, #-0xA0]
        add     r11, r10, r11
        smull   r11, r10, r9, r11
        ldr     r9, [pc, #-0xA4]
        ldr     r11, [pc, #-0xA4]
        ldr     r9, [r9, +r8, lsl #2]
        sub     r10, r10, r11
        ldr     r11, [pc, #-0xAC]
        mov     r10, r10, lsl #4
        smull   r10, r9, r9, r10
        mov     r10, r9, lsl #1
        ldr     r8, [r11, +r8, lsl #2]
        rsb     r9, r8, #0x1B
LGDN100:
        smull   r10, r8, r0, r10
        subs    r9, r2, r9
        bmi     LGDN101
        cmp     r9, #0x1F
        movgt   r9, #0x1F
        mov     r8, r8, asr r9
        b       LGDN102
LGDN101:
        rsb     r9, r9, #0
        cmp     r8, r6, asr r9
        movle   r8, r8, lsl r9
        mvngt   r8, #2, 2
LGDN102:
        cmp     r1, #0
        rsblt   r8, r8, #0
LGDN103:
        str     r8, [r12], #4
        subs    lr, lr, #1
        bne     LGDN96
        ldr     r9, [sp, #0x94]
        ldr     r11, [sp, #0x48]
        ldr     r1, [sp, #0x64]
        str     r6, [sp, #0x78]
LGDN104:
        mov     r0, #0
LGDN105:
        cmp     r0, #0
        bne     LGDN145
        ldr     r0, [sp, #0x88]
        subs    r0, r0, #1
        str     r0, [sp, #0x88]
        bne     LGDN95
        ldr     r7, [sp, #0x74]
        ldr     r8, [sp, #0x80]
        ldr     r10, [sp, #0x70]
        ldr     r2, [sp, #0x5C]
        ldr     r12, [sp, #0x60]
        ldr     lr, [sp, #0x6C]
        ldr     r0, [sp, #0x90]
        ldr     r4, [sp, #0x4C]
LGDN106:
        add     r8, r8, #1
        cmp     r8, #3
        add     r10, r10, #4
        add     r7, r7, #4
        blt     LGDN94
        ldr     r11, [sp, #0x44]
        ldr     r0, [sp, #0x68]
        ldr     r1, [sp, #0x40]
        ldr     r9, [sp, #0x50]
        ldr     r6, [sp, #0x20]
        b       LGDN36
LGDN107:
        ldr     lr, [sp, #0x9C]
        ldr     r8, [sp, #0x94]
        ldr     r9, [pc, #-0x1B0]
        str     r3, [sp, #0x78]
        mvn     r0, #1
        b       LGDN92
LGDN108:
        ldr     r9, [sp, #0x94]
        ldr     r11, [sp, #0x48]
        ldr     r1, [sp, #0x64]
        str     r6, [sp, #0x78]
        mvn     r0, #1
        b       LGDN105
LGDN109:
        mvn     r0, #1
        add     sp, sp, #6, 26
        ldmia   sp!, {r4 - r11, pc}
LGDN110:
        mvn     r0, #1
        add     sp, sp, #6, 26
        ldmia   sp!, {r4 - r11, pc}
LGDN111:
        mvn     r0, #0xA9
        add     sp, sp, #6, 26
        ldmia   sp!, {r4 - r11, pc}
LGDN112:
        mvn     r0, #0xA9
        add     sp, sp, #6, 26
        ldmia   sp!, {r4 - r11, pc}
LGDN113:
        mvn     r0, #0xA9
        add     sp, sp, #6, 26
        ldmia   sp!, {r4 - r11, pc}
LGDN114:
        mvn     r0, #0xA9
        add     sp, sp, #6, 26
        ldmia   sp!, {r4 - r11, pc}
LGDN115:
        mvn     r0, #0xA9
        add     sp, sp, #6, 26
        ldmia   sp!, {r4 - r11, pc}
LGDN116:
        mvn     r0, #0xA9
        add     sp, sp, #6, 26
        ldmia   sp!, {r4 - r11, pc}
LGDN117:
        cmp     r6, #0
        add     r4, sp, #0xEC
        add     r3, sp, #0xE4
        mov     r7, #3
        bne     LGDN118
        mov     r6, #0
        add     r4, sp, #0xEC
        str     r6, [r3, +r12, lsl #2]
        mov     r7, #0
        str     r6, [r4, +lr, lsl #2]
        b       LGDN119
LGDN118:
        mov     r6, #3
        cmp     r2, #1
        str     r6, [r4, +lr, lsl #2]
        moveq   r4, #8
        streq   r4, [r3, +r12, lsl #2]
        movne   r4, #6
        strne   r4, [r3, +r12, lsl #2]
LGDN119:
        add     r3, sp, #0xA0
        cmp     r7, #0xC
        add     r10, sp, #0xB8
        add     r3, r3, r1
        movgt   r4, #0xC
        bgt     LGDN123
        rsb     r4, r7, #0xC
        cmp     r4, #6
        movlt   r4, #0xC
        blt     LGDN121
        ldr     r6, [sp, #0x90]
        mov     r4, #0xC
LGDN120:
        mov     r8, r4, lsl #1
        ldrsh   r8, [r6, +r8]
        add     r8, r8, r8, lsl #1
        cmp     r8, r5
        blt     LGDN123
        sub     r4, r4, #1
        mov     r8, r4, lsl #1
        ldrsh   r8, [r6, +r8]
        add     r8, r8, r8, lsl #1
        cmp     r8, r5
        blt     LGDN123
        sub     r4, r4, #1
        mov     r8, r4, lsl #1
        ldrsh   r8, [r6, +r8]
        add     r8, r8, r8, lsl #1
        cmp     r8, r5
        blt     LGDN123
        sub     r4, r4, #1
        mov     r8, r4, lsl #1
        ldrsh   r8, [r6, +r8]
        add     r8, r8, r8, lsl #1
        cmp     r8, r5
        blt     LGDN123
        sub     r4, r4, #1
        mov     r8, r4, lsl #1
        ldrsh   r8, [r6, +r8]
        add     r8, r8, r8, lsl #1
        cmp     r8, r5
        blt     LGDN123
        sub     r4, r4, #1
        add     r8, r7, #6
        cmp     r4, r8
        bge     LGDN120
LGDN121:
        ldr     r6, [sp, #0x90]
        add     r6, r6, r4, lsl #1
LGDN122:
        ldrsh   r8, [r6], #-2
        add     r8, r8, r8, lsl #1
        cmp     r8, r5
        blt     LGDN123
        sub     r4, r4, #1
        cmp     r4, r7
        bge     LGDN122
LGDN123:
        str     lr, [sp, #0x5C]
        ldr     lr, [sp, #0x78]
        ldr     r10, [sp, #0x90]
        mov     r6, #0
        mov     r8, r6
        add     r5, r4, #1
        mov     r4, r8
        str     r11, [sp, #0x68]
        str     r12, [sp, #0x64]
        str     r0, [sp, #0x60]
        str     r1, [sp, #0x58]
        str     r2, [sp, #0x44]
LGDN124:
        cmp     r5, r7
        mov     r12, r5
        ble     LGDN129
        add     r1, lr, r12, lsl #1
        add     r2, r10, r12, lsl #1
LGDN125:
        ldrsh   r4, [r1], #-2
        ldrsh   r11, [r2], #-2
        rsb     r0, r4, r4, lsl #2
        sub     r4, r11, r4
        mul     r11, r6, r4
        add     r0, r9, r0, lsl #2
        subs    r4, r4, #1
        add     r11, r0, r11, lsl #2
        bmi     LGDN128
        ldr     r0, [r11, +r4, lsl #2]
        cmp     r4, #6
        blt     LGDN131
        cmp     r0, #0
        bne     LGDN129
LGDN126:
        sub     r4, r4, #1
        ldr     r0, [r11, +r4, lsl #2]
        cmp     r0, #0
        bne     LGDN127
        sub     r4, r4, #1
        ldr     r0, [r11, +r4, lsl #2]
        cmp     r0, #0
        bne     LGDN127
        sub     r4, r4, #1
        ldr     r0, [r11, +r4, lsl #2]
        cmp     r0, #0
        bne     LGDN127
        sub     r4, r4, #1
        ldr     r0, [r11, +r4, lsl #2]
        cmp     r0, #0
        bne     LGDN127
        sub     r4, r4, #1
        ldr     r0, [r11, +r4, lsl #2]
        cmp     r4, #6
        blt     LGDN134
        cmp     r0, #0
        beq     LGDN126
LGDN127:
        cmp     r4, #0
        bge     LGDN129
LGDN128:
        sub     r12, r12, #1
        cmp     r12, r7
        bgt     LGDN125
LGDN129:
        str     r12, [r3], #4
        cmp     r7, r12
        add     r0, sp, #0xF4
        moveq   r1, r7, lsl #1
        ldreqsh r1, [r10, +r1]
        beq     LGDN130
        mov     r12, r12, lsl #1
        ldrsh   r1, [lr, +r12]
        add     r1, r4, r1
        add     r1, r1, #1
LGDN130:
        cmp     r8, r1
        str     r1, [r0, +r6, lsl #2]
        movle   r8, r1
        add     r6, r6, #1
        cmp     r6, #3
        blt     LGDN124
        str     lr, [sp, #0x78]
        ldr     r12, [sp, #0x64]
        ldr     r11, [sp, #0x68]
        ldr     r0, [sp, #0x60]
        ldr     lr, [sp, #0x5C]
        ldr     r1, [sp, #0x58]
        ldr     r2, [sp, #0x44]
        add     r10, sp, #0xB8
        str     r8, [r10, +r12, lsl #2]
        b       LGDN12
LGDN131:
        cmp     r0, #0
        bne     LGDN129
LGDN132:
        add     r11, r11, r4, lsl #2
LGDN133:
        subs    r4, r4, #1
        sub     r11, r11, #4
        bmi     LGDN128
        ldr     r0, [r11]
        cmp     r0, #0
        beq     LGDN133
        b       LGDN129
LGDN134:
        cmp     r0, #0
        beq     LGDN132
        b       LGDN127
LGDN135:
        mvn     r0, #4
        add     sp, sp, #6, 26
        ldmia   sp!, {r4 - r11, pc}
LGDN136:
        mvn     r0, #4
        add     sp, sp, #6, 26
        ldmia   sp!, {r4 - r11, pc}
LGDN137:
        mvn     r0, #0xA9
        add     sp, sp, #6, 26
        ldmia   sp!, {r4 - r11, pc}
LGDN138:
        mvn     r0, #0xA9
        add     sp, sp, #6, 26
        ldmia   sp!, {r4 - r11, pc}
LGDN139:
        mvn     r0, #0xA9
        add     sp, sp, #6, 26
        ldmia   sp!, {r4 - r11, pc}
LGDN140:
        mvn     r0, #0xA9
        add     sp, sp, #6, 26
        ldmia   sp!, {r4 - r11, pc}
LGDN141:
        and     r12, lr, #2
        and     lr, lr, #1
        str     r12, [sp, #0x34]
        str     lr, [sp, #0x38]
        b       LGDN8
LGDN142:
        mvn     r0, #1
        add     sp, sp, #6, 26
        ldmia   sp!, {r4 - r11, pc}
LGDN143:
        mvn     r0, #1
        add     sp, sp, #6, 26
        ldmia   sp!, {r4 - r11, pc}
LGDN144:
        mvn     r0, #7
        add     sp, sp, #6, 26
        ldmia   sp!, {r4 - r11, pc}
LGDN145:
        mvn     r0, #1
        add     sp, sp, #6, 26
        ldmia   sp!, {r4 - r11, pc}
LGDN__sStereoLong_MP3_32s_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x28
        ldr     r11, [sp, #0x50]
        ldr     r9, [sp, #0x5C]
        ldr     r8, [sp, #0x4C]
        ldr     r10, [sp, #0x54]
        ldr     r7, [sp, #0x58]
        ldr     lr, [sp, #0x60]
        mov     r12, r11, lsl #1
        ldrsh   r12, [r9, +r12]
        cmp     r3, #0
        mov     r4, r0
        mov     r6, r1
        mov     r5, r2
        beq     LGDN147
        cmp     r12, #0
        ble     LGDN147
        add     r0, r6, #4
        str     r0, [sp, #0x24]
        add     r1, r4, #4
        str     r4, [sp, #0x1C]
        mov     r0, r6
        str     r5, [sp, #0xC]
        str     r6, [sp, #8]
        ldr     r5, [sp, #0x1C]
        ldr     r6, [sp, #0x24]
        mov     r2, #0
        str     r10, [sp, #0x18]
        str     r11, [sp, #0x14]
        str     r8, [sp, #0x10]
        str     r3, [sp, #4]
        str     r4, [sp]
LGDN146:
        ldr     r11, [r5]
        ldr     r10, [r0]
        ldr     r4, [r1]
        ldr     r3, [r6]
        add     r2, r2, #2
        add     r8, r11, r10
        str     r8, [r5], #8
        sub     r11, r11, r10
        str     r11, [r0], #8
        add     r8, r4, r3
        str     r8, [r1], #8
        sub     r4, r4, r3
        str     r4, [r6], #8
        cmp     r2, r12
        blt     LGDN146
        ldr     r10, [sp, #0x18]
        ldr     r11, [sp, #0x14]
        ldr     r8, [sp, #0x10]
        ldr     r3, [sp, #4]
        ldr     r5, [sp, #0xC]
        ldr     r6, [sp, #8]
        ldr     r4, [sp]
LGDN147:
        cmp     r8, #0
        beq     LGDN154
        cmp     r7, #1
        beq     LGDN157
        cmp     r12, r10
        bge     LGDN154
        ldr     r7, [pc, #-0x658]
        add     r9, r9, r11, lsl #1
        add     r5, r11, r5
        str     r3, [sp, #4]
LGDN148:
        ldrsb   r2, [r5], #1
        add     r9, r9, #2
        ldrsh   r0, [r9]
        cmp     r2, #0
        blt     LGDN156
        add     r3, r2, #1
        and     r2, r2, #1
        mov     r3, r3, asr #1
        mov     r3, r3, lsl lr
LGDN149:
        cmp     r2, #0
        mov     r11, r4
        mov     r8, r6
        moveq   r8, r4
        moveq   r11, r6
        cmp     r12, r0
        bge     LGDN153
        sub     r2, r0, r12
        cmp     r2, #4
        blt     LGDN155
        ldr     r7, [pc, #-0x6B4]
        and     r2, r3, #3
        mov     r3, r3, asr #2
        ldr     r7, [r7, +r2, lsl #2]
        mov     r2, r12, lsl #2
        str     r2, [sp, #0x24]
        add     r2, r2, #4
        str     r2, [sp, #0x14]
        add     r2, r2, r4
        str     r2, [sp, #0xC]
        ldr     r2, [sp, #0x24]
        sub     r1, r0, #4
        str     r1, [sp, #0x10]
        str     lr, [sp, #0x20]
        str     r6, [sp, #8]
        str     r4, [sp]
        ldr     r4, [sp, #0xC]
        ldr     lr, [sp, #0x14]
        ldr     r6, [sp, #0x10]
        add     r2, r2, #8
        str     r9, [sp, #0x1C]
        str     r10, [sp, #0x18]
LGDN150:
        ldr     r1, [r4, #-4]
        str     r1, [r8, +r12, lsl #2]
        mov     r1, r1, lsl #1
        smull   r1, r9, r7, r1
        mov     r9, r9, asr r3
        str     r9, [r11, +r12, lsl #2]
        ldr     r1, [r4]
        add     r12, r12, #3
        cmp     r12, r6
        str     r1, [lr, +r8]
        mov     r1, r1, lsl #1
        smull   r1, r9, r7, r1
        mov     r9, r9, asr r3
        str     r9, [lr, +r11]
        ldr     r1, [r4, #4]
        add     lr, lr, #0xC
        add     r4, r4, #0xC
        mov     r9, r1, lsl #1
        smull   r9, r10, r7, r9
        str     r1, [r2, +r8]
        mov     r10, r10, asr r3
        str     r10, [r2, +r11]
        add     r2, r2, #0xC
        ble     LGDN150
        ldr     r9, [sp, #0x1C]
        ldr     lr, [sp, #0x20]
        ldr     r10, [sp, #0x18]
        ldr     r6, [sp, #8]
        ldr     r4, [sp]
LGDN151:
        add     r2, r4, r12, lsl #2
        str     r6, [sp, #8]
        str     r4, [sp]
LGDN152:
        ldr     r1, [r2], #4
        mov     r4, r1, lsl #1
        smull   r4, r6, r7, r4
        str     r1, [r8, +r12, lsl #2]
        mov     r6, r6, asr r3
        str     r6, [r11, +r12, lsl #2]
        add     r12, r12, #1
        cmp     r12, r0
        blt     LGDN152
        ldr     r6, [sp, #8]
        ldr     r4, [sp]
LGDN153:
        cmp     r12, r10
        blt     LGDN148
LGDN154:
        mov     r0, #0
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LGDN155:
        ldr     r7, [pc, #-0x7CC]
        and     r2, r3, #3
        mov     r3, r3, asr #2
        ldr     r7, [r7, +r2, lsl #2]
        b       LGDN151
LGDN156:
        ldr     r2, [sp, #4]
        cmp     r2, #0
        mov     r2, #0
        moveq   r3, r2
        moveq   r12, r0
        movne   r3, r2
        b       LGDN149
LGDN157:
        cmp     r12, r10
        bge     LGDN154
        str     r3, [sp, #4]
LGDN158:
        ldrsb   r8, [r11, +r5]
        add     r11, r11, #1
        mov     r3, r11, lsl #1
        ldrsh   r7, [r9, +r3]
        cmp     r8, #7
        bgt     LGDN166
        cmp     r8, #7
        beq     LGDN164
        cmp     r12, r7
        bge     LGDN158
LGDN159:
        ldr     r3, [pc, #0x740]
        sub     lr, r7, r12
        cmp     lr, #4
        ldrlt   r8, [r3, +r8, lsl #2]
        blt     LGDN161
        ldr     r8, [r3, +r8, lsl #2]
        mov     r3, r12, lsl #2
        add     r3, r3, #4
        add     lr, r3, r4
        sub     r0, r7, #4
        add     r3, r3, r6
        str     r4, [sp]
LGDN160:
        ldr     r4, [lr, #-4]
        add     r12, r12, #3
        cmp     r12, r0
        mov     r1, r4, lsl #1
        smull   r2, r1, r8, r1
        sub     r4, r4, r1
        str     r4, [r3, #-4]
        ldr     r4, [lr]
        str     r1, [lr, #-4]
        mov     r1, r4, lsl #1
        smull   r2, r1, r8, r1
        sub     r4, r4, r1
        str     r4, [r3]
        ldr     r4, [lr, #4]
        str     r1, [lr]
        mov     r1, r4, lsl #1
        smull   r2, r1, r8, r1
        sub     r4, r4, r1
        str     r4, [r3, #4]
        str     r1, [lr, #4]
        add     lr, lr, #0xC
        add     r3, r3, #0xC
        ble     LGDN160
        ldr     r4, [sp]
LGDN161:
        add     r0, r4, r12, lsl #2
        add     lr, r6, r12, lsl #2
LGDN162:
        ldr     r3, [r0]
        add     r12, r12, #1
        cmp     r12, r7
        mov     r1, r3, lsl #1
        smull   r2, r1, r8, r1
        sub     r3, r3, r1
        str     r3, [lr], #4
        str     r1, [r0], #4
        blt     LGDN162
LGDN163:
        cmp     r12, r10
        blt     LGDN158
        mov     r0, #0
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LGDN164:
        ldr     r3, [sp, #4]
        cmp     r3, #0
        beq     LGDN165
        sub     r3, r7, r12
        add     r1, r6, r12, lsl #2
        mov     r2, r3, lsl #2
        add     r0, r4, r12, lsl #2
        bl      ownsCopy_8u
LGDN165:
        cmp     r7, r7
        mov     r12, r7
        blt     LGDN159
        b       LGDN163
LGDN166:
        mvn     r0, #1
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LGDN__sStereoShort_MP3_32s_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x4C
        ldr     r11, [sp, #0x8C]
        ldr     r10, [sp, #0x70]
        ldr     r12, [sp, #0x74]
        ldr     r9, [sp, #0x78]
        ldr     r7, [sp, #0x7C]
        ldr     r8, [sp, #0x80]
        ldr     lr, [sp, #0x84]
        ldr     r6, [sp, #0x88]
        cmp     r3, #0
        str     r11, [sp]
        mov     r5, r0
        mov     r4, r1
        beq     LGDN174
        mov     r11, r12
        mov     r1, #0
        mov     r0, r1
        str     r6, [sp, #0x38]
        str     r8, [sp, #0x2C]
        str     r9, [sp, #0x28]
        str     r10, [sp, #0x24]
        str     r3, [sp, #0x40]
        str     r2, [sp, #0x20]
LGDN167:
        ldr     r9, [r11], #4
        mov     r6, lr
        cmp     lr, r9
        bge     LGDN173
        mov     r2, #2
        add     r3, r7, r6, lsl #1
        add     r2, r2, r3
        str     r11, [sp, #0x34]
        str     lr, [sp, #0x30]
        str     r7, [sp, #0x3C]
LGDN168:
        ldrsh   r7, [r3], #2
        ldrsh   r8, [r2], #2
        add     lr, r7, r7, lsl #1
        sub     r7, r8, r7
        mla     r8, r0, r7, lr
        add     r7, r8, r7
        cmp     r8, r7
        bge     LGDN172
        sub     lr, r7, r8
        cmp     lr, #4
        blt     LGDN170
        mov     lr, r8, lsl #2
        add     lr, lr, #4
        add     r9, lr, r5
        sub     r10, r7, #4
        add     lr, lr, r4
        str     r4, [sp, #0x44]
        str     r5, [sp, #4]
LGDN169:
        ldr     r4, [r9, #-4]
        ldr     r5, [lr, #-4]
        add     r8, r8, #3
        cmp     r8, r10
        add     r11, r4, r5
        str     r11, [r9, #-4]
        sub     r4, r4, r5
        str     r4, [lr, #-4]
        ldr     r4, [r9]
        ldr     r5, [lr]
        add     r11, r4, r5
        str     r11, [r9]
        ldr     r11, [lr, #4]
        sub     r4, r4, r5
        str     r4, [lr]
        ldr     r4, [r9, #4]
        add     r5, r4, r11
        str     r5, [r9, #4]
        sub     r4, r4, r11
        str     r4, [lr, #4]
        add     r9, r9, #0xC
        add     lr, lr, #0xC
        ble     LGDN169
        ldr     r4, [sp, #0x44]
        ldr     r5, [sp, #4]
LGDN170:
        add     r9, r5, r8, lsl #2
        add     lr, r4, r8, lsl #2
        str     r5, [sp, #4]
LGDN171:
        ldr     r5, [r9]
        ldr     r10, [lr]
        add     r8, r8, #1
        cmp     r8, r7
        add     r11, r5, r10
        str     r11, [r9], #4
        sub     r5, r5, r10
        str     r5, [lr], #4
        blt     LGDN171
        ldr     r5, [sp, #4]
        ldr     r9, [r12, +r1, lsl #2]
LGDN172:
        add     r6, r6, #1
        cmp     r6, r9
        blt     LGDN168
        ldr     r11, [sp, #0x34]
        ldr     lr, [sp, #0x30]
        ldr     r7, [sp, #0x3C]
LGDN173:
        add     r0, r0, #1
        cmp     r0, #3
        add     r1, r1, #1
        blt     LGDN167
        ldr     r6, [sp, #0x38]
        ldr     r8, [sp, #0x2C]
        ldr     r9, [sp, #0x28]
        ldr     r10, [sp, #0x24]
        ldr     r3, [sp, #0x40]
        ldr     r2, [sp, #0x20]
LGDN174:
        cmp     r10, #0
        beq     LGDN183
        sub     lr, lr, lr, lsl #2
        add     r0, r8, lr
        cmp     r9, #1
        mov     lr, #0
        beq     LGDN186
        ldr     r8, [pc, #-0xB04]
        add     r2, r2, r0
        mov     r0, lr
        mov     r11, r6
        str     r6, [sp, #0x38]
        str     r3, [sp, #0x40]
LGDN175:
        ldr     r10, [r12], #4
        ldr     r3, [r11], #4
        cmp     r10, r3
        bge     LGDN182
        add     r8, r10, r10, lsl #1
        mov     r6, #2
        add     r9, r7, r10, lsl #1
        add     r8, r8, r2
        add     r6, r6, r9
        str     r12, [sp, #8]
        str     r2, [sp, #0x24]
        str     r11, [sp, #0x2C]
        str     r0, [sp, #0x30]
        str     lr, [sp, #0x34]
        str     r7, [sp, #0x3C]
LGDN176:
        ldrsh   r2, [r9], #2
        ldrsh   r7, [r6], #2
        ldrsb   r12, [r8], #3
        add     lr, r2, r2, lsl #1
        sub     r2, r7, r2
        ldr     r7, [sp, #0x30]
        cmp     r12, #0
        mla     lr, r7, r2, lr
        add     r10, r10, #1
        add     r0, r2, lr
        blt     LGDN184
        add     r2, r12, #1
        tst     r12, #1
        ldr     r12, [sp]
        mov     r2, r2, asr #1
        mov     r11, r5
        mov     r2, r2, lsl r12
        mov     r7, r4
        moveq   r7, r5
        moveq   r11, r4
LGDN177:
        ldr     r12, [pc, #-0xBA8]
        and     r1, r2, #3
        cmp     lr, r0
        ldr     r12, [r12, +r1, lsl #2]
        mov     r2, r2, asr #2
        bge     LGDN181
        sub     r3, r0, lr
        cmp     r3, #5
        blt     LGDN179
        mov     r3, lr, lsl #2
        str     r3, [sp, #0x48]
        add     r3, r3, #4
        str     r3, [sp, #0x18]
        add     r3, r3, r5
        str     r3, [sp, #0x10]
        ldr     r3, [sp, #0x48]
        sub     r1, r0, #5
        str     r1, [sp, #0x14]
        add     r3, r3, #8
        str     r3, [sp, #0xC]
        ldr     r3, [sp, #0x48]
        str     r8, [sp, #0x20]
        str     r4, [sp, #0x44]
        str     r5, [sp, #4]
        ldr     r1, [sp, #0xC]
        ldr     r4, [sp, #0x10]
        ldr     r5, [sp, #0x18]
        ldr     r8, [sp, #0x14]
        add     r3, r3, #0xC
        str     r9, [sp, #0x1C]
        str     r10, [sp, #0x28]
LGDN178:
        ldr     r9, [r4, #-4]
        str     r9, [r7, +lr, lsl #2]
        ldr     r9, [r4, #-4]
        mov     r9, r9, lsl #1
        smull   r9, r10, r12, r9
        mov     r10, r10, asr r2
        str     r10, [r11, +lr, lsl #2]
        ldr     r9, [r4]
        add     lr, lr, #4
        cmp     lr, r8
        str     r9, [r5, +r7]
        ldr     r9, [r4]
        mov     r9, r9, lsl #1
        smull   r9, r10, r12, r9
        mov     r10, r10, asr r2
        str     r10, [r5, +r11]
        ldr     r9, [r4, #4]
        add     r5, r5, #0x10
        str     r9, [r1, +r7]
        ldr     r9, [r4, #4]
        mov     r9, r9, lsl #1
        smull   r9, r10, r12, r9
        mov     r10, r10, asr r2
        str     r10, [r1, +r11]
        ldr     r9, [r4, #8]
        add     r1, r1, #0x10
        str     r9, [r3, +r7]
        ldr     r9, [r4, #8]
        add     r4, r4, #0x10
        mov     r9, r9, lsl #1
        smull   r9, r10, r12, r9
        mov     r10, r10, asr r2
        str     r10, [r3, +r11]
        add     r3, r3, #0x10
        ble     LGDN178
        ldr     r9, [sp, #0x1C]
        ldr     r8, [sp, #0x20]
        ldr     r10, [sp, #0x28]
        ldr     r4, [sp, #0x44]
        ldr     r5, [sp, #4]
LGDN179:
        add     r3, r5, lr, lsl #2
        str     r5, [sp, #4]
LGDN180:
        ldr     r5, [r3]
        str     r5, [r7, +lr, lsl #2]
        ldr     r5, [r3], #4
        mov     r5, r5, lsl #1
        smull   r5, r1, r12, r5
        mov     r1, r1, asr r2
        str     r1, [r11, +lr, lsl #2]
        add     lr, lr, #1
        cmp     lr, r0
        blt     LGDN180
        ldr     r3, [sp, #0x34]
        ldr     r2, [sp, #0x38]
        ldr     r5, [sp, #4]
        ldr     r3, [r2, +r3, lsl #2]
LGDN181:
        cmp     r10, r3
        blt     LGDN176
        ldr     r12, [sp, #8]
        ldr     r2, [sp, #0x24]
        ldr     r11, [sp, #0x2C]
        ldr     r0, [sp, #0x30]
        ldr     lr, [sp, #0x34]
        ldr     r7, [sp, #0x3C]
LGDN182:
        add     r0, r0, #1
        cmp     r0, #3
        add     lr, lr, #1
        add     r2, r2, #1
        blt     LGDN175
LGDN183:
        mov     r0, #0
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
LGDN184:
        ldr     r12, [sp, #0x40]
        cmp     r12, #0
        beq     LGDN185
        mov     r7, r5
        mov     r11, r4
        mov     r2, #0
        b       LGDN177
LGDN185:
        add     r1, r4, lr, lsl #2
        mov     r0, #0
        bl      ownsSet_32s
        ldr     r3, [sp, #0x34]
        ldr     r2, [sp, #0x38]
        ldr     r3, [r2, +r3, lsl #2]
        b       LGDN181
LGDN186:
        ldr     r8, [pc, #0x1F4]
        mov     r9, lr
        mov     r11, r6
        str     r3, [sp, #0x40]
        str     r4, [sp, #0x44]
        str     r5, [sp, #4]
LGDN187:
        ldr     r5, [r12], #4
        ldr     r1, [r11], #4
        cmp     r5, r1
        bge     LGDN194
        add     r1, r2, r0
        add     r4, r9, r1
        add     r10, r7, #2
        str     r12, [sp, #8]
        str     r11, [sp, #0x28]
        str     r0, [sp, #0x30]
        str     lr, [sp, #0x34]
        str     r2, [sp, #0x20]
LGDN188:
        mov     r0, r5, lsl #1
        ldrsh   r1, [r7, +r0]
        ldrsh   r2, [r10, +r0]
        add     r0, r5, r5, lsl #1
        ldrsb   r0, [r4, +r0]
        add     r3, r1, r1, lsl #1
        sub     r1, r2, r1
        mla     r2, r9, r1, r3
        ldr     r3, [r8, +r0, lsl #2]
        cmp     r0, #7
        str     r3, [sp, #0x2C]
        add     r11, r2, r1
        bgt     LGDN196
        cmp     r0, #7
        beq     LGDN195
LGDN189:
        cmp     r2, r11
        add     r5, r5, #1
        bge     LGDN193
        sub     r0, r11, r2
        cmp     r0, #5
        blt     LGDN191
        mov     r0, r2, lsl #2
        add     r1, r0, #4
        ldr     r0, [sp, #4]
        ldr     r12, [sp, #0x44]
        sub     r3, r11, #5
        add     r0, r1, r0
        str     r6, [sp, #0x38]
        add     r1, r1, r12
        ldr     r12, [sp, #0x2C]
        str     r7, [sp, #0x3C]
LGDN190:
        ldr     lr, [r0, #-4]
        add     r2, r2, #4
        cmp     r2, r3
        mov     r6, lr, lsl #1
        smull   r7, r6, r12, r6
        sub     lr, lr, r6
        str     lr, [r1, #-4]
        ldr     lr, [r0]
        str     r6, [r0, #-4]
        mov     r6, lr, lsl #1
        smull   r7, r6, r12, r6
        sub     lr, lr, r6
        str     lr, [r1]
        ldr     lr, [r0, #4]
        str     r6, [r0]
        mov     r6, lr, lsl #1
        smull   r7, r6, r12, r6
        sub     lr, lr, r6
        str     lr, [r1, #4]
        ldr     lr, [r0, #8]
        str     r6, [r0, #4]
        mov     r6, lr, lsl #1
        smull   r7, r6, r12, r6
        sub     lr, lr, r6
        str     lr, [r1, #8]
        str     r6, [r0, #8]
        add     r0, r0, #0x10
        add     r1, r1, #0x10
        ble     LGDN190
        ldr     r6, [sp, #0x38]
        ldr     r7, [sp, #0x3C]
LGDN191:
        ldr     r0, [sp, #4]
        ldr     lr, [sp, #0x2C]
        str     r7, [sp, #0x3C]
        add     r1, r0, r2, lsl #2
        ldr     r0, [sp, #0x44]
        add     r0, r0, r2, lsl #2
LGDN192:
        ldr     r3, [r1]
        add     r2, r2, #1
        cmp     r2, r11
        mov     r12, r3, lsl #1
        smull   r7, r12, lr, r12
        sub     r3, r3, r12
        str     r3, [r0], #4
        str     r12, [r1], #4
        blt     LGDN192
        ldr     r7, [sp, #0x3C]
LGDN193:
        ldr     r0, [sp, #0x34]
        ldr     r0, [r6, +r0, lsl #2]
        cmp     r5, r0
        blt     LGDN188
        ldr     r12, [sp, #8]
        ldr     r11, [sp, #0x28]
        ldr     r0, [sp, #0x30]
        ldr     lr, [sp, #0x34]
        ldr     r2, [sp, #0x20]
LGDN194:
        add     r9, r9, #1
        cmp     r9, #3
        add     lr, lr, #1
        blt     LGDN187
        mov     r0, #0
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
LGDN195:
        ldr     r0, [sp, #0x40]
        cmp     r0, #0
        beq     LGDN189
        ldr     r0, [sp, #0x44]
        sub     r3, r11, r2
        add     r1, r0, r2, lsl #2
        ldr     r0, [sp, #4]
        add     r0, r0, r2, lsl #2
        mov     r2, r3, lsl #2
        bl      ownsCopy_8u
        mov     r2, r11
        b       LGDN189
LGDN196:
        mvn     r0, #1
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
        .long   LGDN__pIsLeft


        .data
        .align  4


LGDN__pPretab:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x01,0x01,0x01,0x02
        .byte   0x02,0x03,0x03,0x03,0x02,0x00,0x00,0x00
LGDN__pReq16x4:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x10,0xF3,0x45,0x51,0x28,0xDB,0x5C,0x3A,0x45
        .byte   0x53,0xFF,0xB2,0x0C,0xD6,0x89,0x19,0x11,0xC8,0x31,0xCE,0x15,0x03,0xF2,0xC7,0x1A
        .byte   0x00,0x00,0x00,0x20,0xB9,0x06,0x71,0x25,0xA3,0xB4,0x16,0x2B,0xB4,0x74,0xED,0x30
        .byte   0xA5,0x3F,0xF2,0x36,0xD3,0x7B,0x22,0x3D,0x56,0xE6,0x7B,0x43,0x3C,0x82,0xFC,0x49
        .byte   0x00,0x00,0x00,0x00,0xCD,0x4F,0x74,0x0D,0x26,0x1F,0xE7,0x21,0xD9,0xAB,0x36,0x3A
        .byte   0x84,0xC0,0xAD,0x0A,0x6E,0x0E,0x61,0x0E,0x1D,0x0C,0x56,0x12,0xCF,0x23,0x85,0x16
        .byte   0x99,0x9F,0xE8,0x1A,0xA4,0x03,0x7C,0x1F,0x49,0xAE,0x3B,0x24,0x67,0x9C,0x24,0x29
        .byte   0x0F,0x42,0x34,0x2E,0x85,0x6F,0x68,0x33,0xFF,0x3D,0xBF,0x38,0x82,0x01,0x37,0x3E
        .byte   0x00,0x00,0x00,0x00,0x33,0x4F,0x50,0x0B,0x07,0x3E,0x82,0x1C,0x55,0x9A,0xF3,0x30
        .byte   0x62,0xCD,0xFA,0x08,0x19,0x63,0x17,0x0C,0x22,0x35,0x6B,0x0F,0xAD,0xE2,0xEF,0x12
        .byte   0x66,0x9E,0xA0,0x16,0x17,0xA3,0x79,0x1A,0x01,0xE3,0x77,0x1E,0xB4,0xD5,0x98,0x22
        .byte   0xFC,0x56,0xDA,0x26,0x2A,0x90,0x3A,0x2B,0xE7,0xE7,0xB7,0x2F,0x50,0xF6,0x50,0x34
        .byte   0x00,0x00,0x00,0x00,0x05,0x7F,0x83,0x09,0xD7,0x10,0xF9,0x17,0xA9,0xC7,0x29,0x29
        .byte   0xFA,0x0D,0x8D,0x07,0x61,0xE6,0x2A,0x0A,0x54,0x31,0xF7,0x0C,0xCB,0x91,0xEC,0x0F
        .byte   0x0A,0xFE,0x06,0x13,0x6C,0x4A,0x43,0x16,0x95,0xE5,0x9E,0x19,0x3D,0xAE,0x17,0x1D
        .byte   0x6A,0xD7,0xAB,0x20,0x51,0xD5,0x59,0x24,0xBB,0x4F,0x20,0x28,0x08,0x18,0xFE,0x2B
LGDN__pMP3Sqrt14_32s:
        .byte   0xFF,0xFF,0xFF,0x7F,0x65,0x7E,0xA2,0x6B,0x9A,0x79,0x82,0x5A,0x29,0xF8,0x1B,0x4C
LGDN__pMP3Xt43:
        .byte   0x94,0xFA,0x97,0x65,0xFF,0xFF,0xFF,0x7F,0xE6,0x8B,0xA2,0x50,0x94,0xFA,0x97,0x65
        .byte   0xFF,0xFF,0xFF,0x7F,0xE6,0x8B,0xA2,0x50,0x94,0xFA,0x97,0x65
LGDN__pXtExp:
        .byte   0x14,0x00,0x00,0x00,0x13,0x00,0x00,0x00,0x11,0x00,0x00,0x00,0x10,0x00,0x00,0x00
        .byte   0x0F,0x00,0x00,0x00,0x0D,0x00,0x00,0x00,0x0C,0x00,0x00,0x00
LGDN__pMP3Sqrt43:
        .byte   0xFA,0xA2,0x28,0x14,0xD6,0x1B,0xDB,0x15,0x2C,0x30,0x96,0x17,0x85,0x8D,0x59,0x19
        .byte   0xBB,0xE8,0x24,0x1B,0xFA,0xFC,0xF7,0x1C,0xF2,0x8A,0xD2,0x1E,0x2A,0x58,0xB4,0x20
        .byte   0x6E,0x2E,0x9D,0x22,0x55,0xDB,0x8C,0x24,0xDA,0x2F,0x83,0x26,0x00,0x00,0x80,0x28
        .byte   0x87,0x22,0x83,0x2A,0xA8,0x70,0x8C,0x2C,0xD8,0xC5,0x9B,0x2E,0x99,0xFF,0xB0,0x30
        .byte   0x4A,0xFD,0xCB,0x32,0x01,0xA0,0xEC,0x34,0x62,0xCA,0x12,0x37,0x88,0x60,0x3E,0x39
        .byte   0xE0,0x47,0x6F,0x3B,0x17,0x67,0xA5,0x3D,0xFC,0xA5,0xE0,0x3F,0x72,0xED,0x20,0x42
        .byte   0x58,0x27,0x66,0x44,0x7C,0x3E,0xB0,0x46,0x87,0x1E,0xFF,0x48,0xF3,0xB3,0x52,0x4B
        .byte   0xFD,0xEB,0xAA,0x4D,0x97,0xB4,0x07,0x50,0x62,0xFC,0x68,0x52,0x9C,0xB2,0xCE,0x54
        .byte   0x21,0xC7,0x38,0x57,0x59,0x2A,0xA7,0x59,0x35,0xCD,0x19,0x5C,0x29,0xA1,0x90,0x5E
        .byte   0x21,0x98,0x0B,0x61,0x7F,0xA4,0x8A,0x63,0x0F,0xB9,0x0D,0x66,0x0B,0xC9,0x94,0x68
        .byte   0x0C,0xC8,0x1F,0x6B,0x0D,0xAA,0xAE,0x6D,0x60,0x63,0x41,0x70,0xB0,0xE8,0xD7,0x72
        .byte   0xF9,0x2E,0x72,0x75,0x85,0x2B,0x10,0x78,0xEC,0xD3,0xB1,0x7A,0x09,0x1E,0x57,0x7D
        .byte   0x00,0x00,0x00,0x20,0x0D,0x1C,0xAB,0x20,0x53,0x19,0x57,0x21,0x89,0xF5,0x03,0x22
        .byte   0x77,0xAE,0xB1,0x22,0xF0,0x41,0x60,0x23,0xD8,0xAD,0x0F,0x24,0x1C,0xF0,0xBF,0x24
        .byte   0xB9,0x06,0x71,0x25,0xB5,0xEF,0x22,0x26,0x25,0xA9,0xD5,0x26,0x26,0x31,0x89,0x27
        .byte   0xE1,0x85,0x3D,0x28,0x88,0xA5,0xF2,0x28,0x5B,0x8E,0xA8,0x29,0x9E,0x3E,0x5F,0x2A
        .byte   0xA3,0xB4,0x16,0x2B,0xC3,0xEE,0xCE,0x2B,0x5F,0xEB,0x87,0x2C,0xE2,0xA8,0x41,0x2D
        .byte   0xBF,0x25,0xFC,0x2D,0x70,0x60,0xB7,0x2E,0x77,0x57,0x73,0x2F,0x5D,0x09,0x30,0x30
        .byte   0xB4,0x74,0xED,0x30,0x12,0x98,0xAB,0x31,0x17,0x72,0x6A,0x32,0x68,0x01,0x2A,0x33
        .byte   0xAF,0x44,0xEA,0x33,0x9E,0x3A,0xAB,0x34,0xED,0xE1,0x6C,0x35,0x59,0x39,0x2F,0x36
        .byte   0xA5,0x3F,0xF2,0x36,0x9A,0xF3,0xB5,0x37,0x06,0x54,0x7A,0x38,0xBB,0x5F,0x3F,0x39
        .byte   0x93,0x15,0x05,0x3A,0x69,0x74,0xCB,0x3A,0x21,0x7B,0x92,0x3B,0xA0,0x28,0x5A,0x3C
        .byte   0xD3,0x7B,0x22,0x3D,0xA7,0x73,0xEB,0x3D,0x13,0x0F,0xB5,0x3E,0x0D,0x4D,0x7F,0x3F
        .byte   0x92,0x2C,0x4A,0x40,0xA3,0xAC,0x15,0x41,0x43,0xCC,0xE1,0x41,0x7B,0x8A,0xAE,0x42
        .byte   0x56,0xE6,0x7B,0x43,0xE4,0xDE,0x49,0x44,0x38,0x73,0x18,0x45,0x68,0xA2,0xE7,0x45
        .byte   0x8F,0x6B,0xB7,0x46,0xC8,0xCD,0x87,0x47,0x35,0xC8,0x58,0x48,0xFA,0x59,0x2A,0x49
        .byte   0x3C,0x82,0xFC,0x49,0x26,0x40,0xCF,0x4A,0xE4,0x92,0xA2,0x4B,0xA6,0x79,0x76,0x4C
        .byte   0x9D,0xF3,0x4A,0x4D,0x00,0x00,0x20,0x4E,0x06,0x9E,0xF5,0x4E,0xE9,0xCC,0xCB,0x4F
        .byte   0xE6,0x8B,0xA2,0x50
LGDN__pIsLeft:
        .byte   0x00,0x00,0x00,0x00,0x75,0xB1,0x0C,0x1B,0xA1,0xEB,0xD9,0x2E,0x00,0x00,0x00,0x40
        .byte   0x5F,0x14,0x26,0x51,0x8B,0x4E,0xF3,0x64,0xFF,0xFF,0xFF,0x7F,0xFF,0xFF,0xFF,0x7F


