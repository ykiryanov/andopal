        .text
        .align  4
        .globl  _ippsUnpackScaleFactors_MP3_1u8s


_ippsUnpackScaleFactors_MP3_1u8s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x38
        ldr     r7, [sp, #0x5C]
        ldr     r12, [sp, #0x60]
        ldr     r8, [sp, #0x64]
        ldr     lr, [sp, #0x68]
        mov     r6, r0
        cmp     r6, #0
        mov     r4, r1
        mov     r5, r2
        beq     LGDK51
        cmp     r4, #0
        beq     LGDK51
        cmp     r5, #0
        beq     LGDK51
        cmp     r3, #0
        beq     LGDK51
        cmp     r7, #0
        beq     LGDK51
        cmp     r12, #0
        beq     LGDK51
        ldr     r0, [r6]
        cmp     r0, #0
        beq     LGDK51
        ldr     r9, [r4]
        cmp     r9, #0
        blt     LGDK16
        cmp     r9, #7
        bgt     LGDK16
        cmp     r8, #0
        blt     LGDK16
        cmp     r8, #1
        bgt     LGDK16
        cmp     lr, #0
        blt     LGDK16
        cmp     lr, #1
        bgt     LGDK16
        ldr     r10, [r12]
        ldr     r9, [r3, #0xC]
        mvn     r1, #0
        cmp     r10, #1
        mov     r11, #0
        beq     LGDK26
        add     r1, r1, #2, 24
        cmp     r1, r9
        bge     LGDK1
LGDK0:
        mvn     r0, #0xA9
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LGDK1:
        cmp     r9, #0
        blt     LGDK0
        ldr     r7, [r12, #0x20]
        cmp     r7, #3
        ble     LGDK3
LGDK2:
        mvn     r0, #0xAA
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LGDK3:
        cmp     r7, #0
        blt     LGDK2
        ldr     r12, [r3, #0x14]
        cmp     r12, #2
        movne   r12, r11
        beq     LGDK25
LGDK4:
        ands    r7, r7, #1
        beq     LGDK5
        cmp     lr, #1
        beq     LGDK8
LGDK5:
        cmp     r9, #0x19, 28
        bge     LGDK6
        ldr     r1, [pc, #0x9C0]
        mov     r10, r9, asr #4
        smull   r11, r8, r10, r1
        smull   r11, r1, r10, r1
        mov     r2, r10, asr #31
        rsb     r8, r2, r8, asr #1
        rsb     r1, r2, r1, asr #1
        and     r11, r9, #0xF
        add     r8, r8, r8, lsl #2
        sub     r10, r10, r8
        str     r10, [sp]
        add     r2, sp, #0x24
        str     r1, [r2]
        ldr     r1, [sp]
        mov     r8, r11, asr #2
        add     r2, sp, #0x24
        str     r1, [r2, #4]
        add     r1, sp, #0x24
        str     r8, [r1, #8]
        and     r10, r9, #3
        mov     r11, #0
        add     r8, sp, #0x24
        str     r10, [r8, #0xC]
        str     r11, [r3, #0x3C]
        b       LGDK8
LGDK6:
        cmp     r9, #0x7D, 30
        bge     LGDK7
        ldr     r2, [pc, #0x954]
        sub     r11, r9, #0x19, 28
        mov     r10, r11, asr #2
        smull   r1, r8, r10, r2
        smull   r2, r1, r10, r2
        mov     r2, r10, asr #31
        rsb     r8, r2, r8, asr #1
        and     r11, r11, #3
        rsb     r1, r2, r1, asr #1
        add     r8, r8, r8, lsl #2
        sub     r10, r10, r8
        add     r8, sp, #0x24
        str     r1, [r8]
        add     r8, sp, #0x24
        str     r10, [r8, #4]
        add     r8, sp, #0x24
        str     r11, [r8, #8]
        mov     r10, #0
        add     r8, sp, #0x24
        str     r10, [r8, #0xC]
        str     r10, [r3, #0x3C]
        mov     r11, #1
        b       LGDK8
LGDK7:
        cmp     r9, #2, 24
        mov     r11, #0
        bge     LGDK8
        ldr     r8, [pc, #0x8F0]
        sub     r10, r9, #0x7D, 30
        mov     r8, r8, lsl #1
        smull   r2, r1, r10, r8
        smull   r2, r8, r10, r8
        sub     r8, r8, r10, asr #31
        add     r2, sp, #0x24
        str     r8, [r2]
        add     r8, sp, #0x24
        str     r11, [r8, #8]
        add     r8, sp, #0x24
        sub     r1, r1, r10, asr #31
        str     r11, [r8, #0xC]
        mov     r11, #1
        add     r1, r1, r1, lsl #1
        sub     r10, r10, r1
        add     r8, sp, #0x24
        str     r11, [r3, #0x3C]
        str     r10, [r8, #4]
        mov     r11, #2
LGDK8:
        cmp     r7, #0
        beq     LGDK9
        cmp     lr, #1
        beq     LGDK17
LGDK9:
        ldr     r8, [pc, #0x894]
        mov     r3, #0
        rsb     r11, r11, r11, lsl #2
        sub     r8, r8, #0x48
        add     r12, r8, r12, lsl #2
        add     r12, r12, r11, lsl #2
        mov     r11, r3
        mov     r10, #1
        mvn     r9, #0
        mov     r8, r12
        str     r7, [sp, #4]
        str     lr, [sp, #8]
        str     r6, [sp, #0x10]
LGDK10:
        ldrsb   r7, [r8], #1
        add     lr, sp, #0x24
        ldr     lr, [lr, +r3, lsl #2]
        cmp     r7, #0
        add     r6, sp, #0x14
        mov     r7, r10, lsl lr
        sub     r7, r7, #1
        str     r7, [r6, +r3, lsl #2]
        ble     LGDK14
        mov     r7, #0
        add     r6, r11, r5
        str     r8, [sp]
        str     r5, [sp, #0xC]
LGDK11:
        cmp     lr, #0
        moveq   r2, #0
        beq     LGDK13
        cmp     lr, #0
        moveq   r10, #0
        beq     LGDK12
        str     r0, [sp, #0x34]
        ldrb    r1, [r0, #1]
        ldrb    r8, [r0]
        ldrb    r10, [r0, #2]
        ldrb    r5, [r0, #3]
        ldr     r2, [r4]
        mov     r1, r1, lsl #16
        orr     r8, r1, r8, lsl #24
        orr     r10, r8, r10, lsl #8
        orr     r5, r10, r5
        add     r8, r2, lr
        and     r5, r5, r9, lsr r2
        rsb     r10, r8, #0x20
        and     r2, r8, #7
        mov     r10, r5, lsr r10
        add     r0, r0, r8, asr #3
        str     r2, [r4]
LGDK12:
        mov     r10, r10, lsl #24
        mov     r2, r10, asr #24
LGDK13:
        strb    r2, [r6], #1
        ldrsb   r2, [r12, +r3]
        add     r7, r7, #1
        cmp     r7, r2
        add     r11, r11, #1
        blt     LGDK11
        ldr     r8, [sp]
        ldr     r5, [sp, #0xC]
        mov     r10, #1
LGDK14:
        add     r3, r3, #1
        cmp     r3, #4
        blt     LGDK10
        ldr     r7, [sp, #4]
        ldr     lr, [sp, #8]
        ldr     r6, [sp, #0x10]
        mov     r1, #0
        add     r3, r5, r11
        cmp     r7, #0
        strb    r1, [r11, +r5]
        strb    r1, [r3, #1]
        strb    r1, [r3, #2]
        beq     LGDK15
        cmp     lr, #1
        beq     LGDK20
LGDK15:
        str     r0, [r6]
        mov     r0, #0
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LGDK16:
        mvn     r0, #4
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LGDK17:
        mov     r9, r9, asr #1
        cmp     r9, #0xB4
        bge     LGDK18
        ldr     r11, [pc, #0x744]
        ldr     r2, [pc, #0x738]
        smull   r10, r8, r9, r11
        smull   r11, r10, r9, r11
        mov     r11, r9, asr #31
        rsb     r8, r11, r8, asr #3
        mov     r1, r8, lsl #5
        rsb     r10, r11, r10, asr #3
        add     r8, r1, r8, lsl #2
        sub     r8, r9, r8
        smull   r9, r1, r8, r2
        smull   r2, r9, r8, r2
        sub     r1, r1, r8, asr #31
        add     r11, r1, r1, lsl #2
        add     r1, r1, r11
        sub     r9, r9, r8, asr #31
        sub     r8, r8, r1
        add     r1, sp, #0x24
        str     r10, [r1]
        add     r10, sp, #0x24
        str     r9, [r10, #4]
        mov     r11, #0
        add     r9, sp, #0x24
        str     r8, [r9, #8]
        add     r8, sp, #0x24
        str     r11, [r8, #0xC]
        str     r11, [r3, #0x3C]
        mov     r11, #3
        b       LGDK9
LGDK18:
        cmp     r9, #0xF4
        bge     LGDK19
        sub     r8, r9, #0xB4
        and     r9, r8, #0xF
        and     r10, r8, #0x3F
        mov     r9, r9, asr #2
        add     r11, sp, #0x24
        and     r8, r8, #3
        add     r1, sp, #0x24
        str     r9, [r11, #4]
        str     r8, [r1, #8]
        mov     r9, #0
        mov     r10, r10, asr #4
        add     r2, sp, #0x24
        add     r8, sp, #0x24
        str     r10, [r2]
        str     r9, [r8, #0xC]
        str     r9, [r3, #0x3C]
        mov     r11, #4
        b       LGDK9
LGDK19:
        cmp     r9, #0xFF
        bgt     LGDK9
        sub     r8, r9, #0xF4
        ldr     r9, [pc, #0x66C]
        mov     r10, r9, lsl #1
        smull   r11, r9, r8, r10
        smull   r11, r10, r8, r10
        sub     r1, r9, r8, asr #31
        add     r11, sp, #0x24
        sub     r10, r10, r8, asr #31
        add     r2, r1, r1, lsl #1
        str     r10, [r11]
        mov     r1, #0
        add     r11, sp, #0x24
        add     r9, sp, #0x24
        add     r10, sp, #0x24
        sub     r8, r8, r2
        str     r1, [r11, #0xC]
        str     r8, [r9, #4]
        str     r1, [r10, #8]
        str     r1, [r3, #0x3C]
        mov     r11, #5
        b       LGDK9
LGDK20:
        mov     lr, #0
        mov     r3, lr
        mov     r1, r12
LGDK21:
        ldrsb   r9, [r1], #1
        cmp     r9, #0
        ble     LGDK24
        add     r7, sp, #0x14
        ldr     r7, [r7, +r3, lsl #2]
        mov     r4, #0
        add     r8, lr, r5
LGDK22:
        ldrsb   r10, [r8]
        cmp     r10, r7
        bne     LGDK23
        rsb     r10, r10, #0
        strb    r10, [r8]
        ldrsb   r9, [r12, +r3]
LGDK23:
        add     r4, r4, #1
        cmp     r4, r9
        add     r8, r8, #1
        add     lr, lr, #1
        blt     LGDK22
LGDK24:
        add     r3, r3, #1
        cmp     r3, #4
        blt     LGDK21
        b       LGDK15
LGDK25:
        ldr     r12, [r3, #0x18]
        and     r12, r12, #1
        str     r12, [r3, #0x18]
        add     r12, r12, #1
        b       LGDK4
LGDK26:
        cmp     r9, #0xF
        ble     LGDK28
LGDK27:
        mvn     r0, #0xA9
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LGDK28:
        cmp     r9, #0
        blt     LGDK27
        ldr     lr, [pc, #0x58C]
        add     r12, lr, r9
        ldrsb   r10, [r9, +lr]
        ldrsb   r9, [r12, #0x10]
        strb    r11, [r5, #0x15]
        ldr     r12, [r3, #0x14]
        rsb     r11, r10, #8
        cmp     r12, #2
        rsb     r12, r9, #8
        str     r12, [sp, #8]
        beq     LGDK36
        ldr     r3, [r7]
        str     r0, [sp, #0x34]
        cmp     r3, #0
        beq     LGDK29
        cmp     r8, #0
        bne     LGDK30
LGDK29:
        add     r3, r10, r10, lsl #2
        add     r0, sp, #0x34
        add     r2, r10, r3
        mov     r1, r4
        bl      LGDK_ownGetBits_MP3
        mov     r12, r0, lsr r10
        mov     lr, r12, lsr r10
        mov     r3, #0xFF
        and     r12, r12, r3, asr r11
        strb    r12, [r5, #4]
        mov     r12, lr, lsr r10
        and     lr, lr, r3, asr r11
        strb    lr, [r5, #3]
        mov     lr, r12, lsr r10
        and     r12, r12, r3, asr r11
        strb    r12, [r5, #2]
        mov     r12, lr, lsr r10
        and     r0, r0, r3, asr r11
        and     lr, lr, r3, asr r11
        and     r3, r12, r3, asr r11
        strb    r0, [r5, #5]
        strb    lr, [r5, #1]
        strb    r3, [r5]
LGDK30:
        ldr     r3, [r7, #4]
        cmp     r3, #0
        beq     LGDK31
        cmp     r8, #0
        bne     LGDK32
LGDK31:
        add     r0, sp, #0x34
        add     r2, r10, r10, lsl #2
        mov     r1, r4
        bl      LGDK_ownGetBits_MP3
        mov     r12, r0, lsr r10
        mov     lr, r12, lsr r10
        mov     r3, #0xFF
        and     r12, r12, r3, asr r11
        strb    r12, [r5, #9]
        mov     r12, lr, lsr r10
        mov     r10, r12, lsr r10
        and     r0, r0, r3, asr r11
        and     lr, lr, r3, asr r11
        and     r12, r12, r3, asr r11
        and     r11, r10, r3, asr r11
        strb    r0, [r5, #0xA]
        strb    lr, [r5, #8]
        strb    r12, [r5, #7]
        strb    r11, [r5, #6]
LGDK32:
        ldr     r3, [r7, #8]
        cmp     r3, #0
        beq     LGDK33
        cmp     r8, #0
        bne     LGDK34
LGDK33:
        add     r0, sp, #0x34
        add     r2, r9, r9, lsl #2
        mov     r1, r4
        bl      LGDK_ownGetBits_MP3
        ldr     r12, [sp, #8]
        mov     lr, r0, lsr r9
        mov     r10, lr, lsr r9
        mov     r3, #0xFF
        and     lr, lr, r3, asr r12
        strb    lr, [r5, #0xE]
        mov     lr, r10, lsr r9
        and     r10, r10, r3, asr r12
        strb    r10, [r5, #0xD]
        mov     r10, lr, lsr r9
        and     r0, r0, r3, asr r12
        and     lr, lr, r3, asr r12
        and     r12, r10, r3, asr r12
        strb    r0, [r5, #0xF]
        strb    lr, [r5, #0xC]
        strb    r12, [r5, #0xB]
LGDK34:
        ldr     r7, [r7, #0xC]
        cmp     r7, #0
        beq     LGDK35
        cmp     r8, #0
        ldrne   r0, [sp, #0x34]
        bne     LGDK15
LGDK35:
        add     r0, sp, #0x34
        add     r2, r9, r9, lsl #2
        mov     r1, r4
        bl      LGDK_ownGetBits_MP3
        mov     r2, r0
        mov     r4, r2, lsr r9
        ldr     r3, [sp, #8]
        mov     lr, r4, lsr r9
        mov     r12, lr, lsr r9
        ldr     r0, [sp, #0x34]
        mov     r1, #0xFF
        mov     r9, r12, lsr r9
        and     r2, r2, r1, asr r3
        and     r4, r4, r1, asr r3
        and     lr, lr, r1, asr r3
        and     r12, r12, r1, asr r3
        and     r3, r9, r1, asr r3
        strb    r2, [r5, #0x14]
        strb    r4, [r5, #0x13]
        strb    lr, [r5, #0x12]
        strb    r12, [r5, #0x11]
        strb    r3, [r5, #0x10]
        b       LGDK15
LGDK36:
        ldr     r3, [r3, #0x18]
        cmp     r3, #0
        beq     LGDK45
        mov     r3, #8
LGDK37:
        cmp     r10, #0
        moveq   lr, #0
        beq     LGDK38
        str     r0, [sp, #0x34]
        ldrb    r7, [r0, #1]
        ldrb    lr, [r0]
        ldrb    r12, [r0, #2]
        mov     r7, r7, lsl #16
        orr     lr, r7, lr, lsl #24
        ldrb    r7, [r0, #3]
        orr     lr, lr, r12, lsl #8
        ldr     r12, [r4]
        orr     r7, lr, r7
        and     lr, r7, r1, lsr r12
        add     r12, r12, r10
        rsb     r7, r12, #0x20
        mov     lr, lr, lsr r7
        add     r0, r0, r12, asr #3
        and     r12, r12, #7
        str     r12, [r4]
LGDK38:
        strb    lr, [r5], #1
        subs    r3, r3, #1
        bne     LGDK37
        mvn     r3, #0
        mov     r12, #3
LGDK39:
        cmp     r10, #0
        moveq   r7, #0
        beq     LGDK40
        str     r0, [sp, #0x34]
        ldrb    r8, [r0, #1]
        ldrb    r7, [r0]
        ldrb    lr, [r0, #2]
        mov     r8, r8, lsl #16
        orr     r7, r8, r7, lsl #24
        ldrb    r8, [r0, #3]
        orr     r7, r7, lr, lsl #8
        ldr     lr, [r4]
        orr     r8, r7, r8
        and     r7, r8, r3, lsr lr
        add     lr, lr, r10
        rsb     r8, lr, #0x20
        mov     r7, r7, lsr r8
        add     r0, r0, lr, asr #3
        and     lr, lr, #7
        str     lr, [r4]
LGDK40:
        strb    r7, [r5], #1
        cmp     r10, #0
        moveq   lr, #0
        beq     LGDK41
        str     r0, [sp, #0x34]
        ldrb    r7, [r0, #1]
        ldrb    lr, [r0]
        ldrb    r2, [r0, #2]
        mov     r7, r7, lsl #16
        orr     lr, r7, lr, lsl #24
        ldrb    r7, [r0, #3]
        orr     lr, lr, r2, lsl #8
        ldr     r2, [r4]
        orr     r7, lr, r7
        and     lr, r7, r3, lsr r2
        add     r2, r2, r10
        rsb     r7, r2, #0x20
        mov     lr, lr, lsr r7
        add     r0, r0, r2, asr #3
        and     r2, r2, #7
        str     r2, [r4]
LGDK41:
        cmp     r10, #0
        strb    lr, [r5]
        moveq   lr, #0
        beq     LGDK42
        str     r0, [sp, #0x34]
        ldrb    r7, [r0, #1]
        ldrb    lr, [r0]
        ldrb    r2, [r0, #2]
        mov     r7, r7, lsl #16
        orr     lr, r7, lr, lsl #24
        ldrb    r7, [r0, #3]
        orr     lr, lr, r2, lsl #8
        ldr     r2, [r4]
        orr     r7, lr, r7
        and     lr, r7, r3, lsr r2
        add     r2, r2, r10
        rsb     r7, r2, #0x20
        mov     lr, lr, lsr r7
        add     r0, r0, r2, asr #3
        and     r2, r2, #7
        str     r2, [r4]
LGDK42:
        strb    lr, [r5, #1]
        subs    r12, r12, #1
        add     r5, r5, #2
        bne     LGDK39
        ldr     r7, [sp, #8]
        add     lr, r9, r9, lsl #1
        mov     r12, #6
        mov     r8, #0xFF
LGDK43:
        cmp     lr, #0
        moveq   r11, #0
        beq     LGDK44
        str     r0, [sp, #0x34]
        ldrb    r1, [r0, #1]
        ldrb    r11, [r0]
        ldrb    r10, [r0, #2]
        mov     r1, r1, lsl #16
        orr     r11, r1, r11, lsl #24
        ldrb    r1, [r0, #3]
        orr     r11, r11, r10, lsl #8
        ldr     r10, [r4]
        orr     r1, r11, r1
        and     r11, r1, r3, lsr r10
        add     r10, r10, lr
        rsb     r1, r10, #0x20
        mov     r11, r11, lsr r1
        add     r0, r0, r10, asr #3
        and     r10, r10, #7
        str     r10, [r4]
LGDK44:
        mov     r10, r11, lsr r9
        and     r11, r11, r8, asr r7
        strb    r11, [r5, #2]
        mov     r11, r10, lsr r9
        and     r10, r10, r8, asr r7
        and     r11, r11, r8, asr r7
        strb    r10, [r5, #1]
        strb    r11, [r5], #3
        subs    r12, r12, #1
        bne     LGDK43
        b       LGDK50
LGDK45:
        str     r6, [sp, #0x10]
        add     r12, r10, r10, lsl #1
        mov     r3, #6
        str     r9, [sp, #4]
        mov     r6, #0xFF
LGDK46:
        cmp     r12, #0
        moveq   r7, #0
        beq     LGDK47
        str     r0, [sp, #0x34]
        ldrb    r2, [r0, #1]
        ldrb    r8, [r0]
        ldrb    r9, [r0, #2]
        ldrb    r7, [r0, #3]
        ldr     lr, [r4]
        mov     r2, r2, lsl #16
        orr     r8, r2, r8, lsl #24
        orr     r9, r8, r9, lsl #8
        orr     r7, r9, r7
        add     r8, r12, lr
        and     r7, r7, r1, lsr lr
        rsb     r9, r8, #0x20
        and     lr, r8, #7
        mov     r7, r7, lsr r9
        add     r0, r0, r8, asr #3
        str     lr, [r4]
LGDK47:
        mov     lr, r7, lsr r10
        and     r7, r7, r6, asr r11
        strb    r7, [r5, #2]
        mov     r7, lr, lsr r10
        and     lr, lr, r6, asr r11
        and     r7, r7, r6, asr r11
        strb    lr, [r5, #1]
        strb    r7, [r5], #3
        subs    r3, r3, #1
        bne     LGDK46
        ldr     r9, [sp, #4]
        ldr     r6, [sp, #0x10]
        ldr     r7, [sp, #8]
        add     lr, r9, r9, lsl #1
        mvn     r12, #0
        mov     r3, #6
        mov     r8, #0xFF
LGDK48:
        cmp     lr, #0
        moveq   r11, #0
        beq     LGDK49
        str     r0, [sp, #0x34]
        ldrb    r1, [r0, #1]
        ldrb    r11, [r0]
        ldrb    r10, [r0, #2]
        mov     r1, r1, lsl #16
        orr     r11, r1, r11, lsl #24
        ldrb    r1, [r0, #3]
        orr     r11, r11, r10, lsl #8
        ldr     r10, [r4]
        orr     r1, r11, r1
        and     r11, r1, r12, lsr r10
        add     r10, r10, lr
        rsb     r1, r10, #0x20
        mov     r11, r11, lsr r1
        add     r0, r0, r10, asr #3
        and     r10, r10, #7
        str     r10, [r4]
LGDK49:
        mov     r10, r11, lsr r9
        and     r11, r11, r8, asr r7
        strb    r11, [r5, #2]
        mov     r11, r10, lsr r9
        and     r10, r10, r8, asr r7
        and     r11, r11, r8, asr r7
        strb    r10, [r5, #1]
        strb    r11, [r5], #3
        subs    r3, r3, #1
        bne     LGDK48
LGDK50:
        mov     r1, #0
        strb    r1, [r5]
        strb    r1, [r5, #1]
        strb    r1, [r5, #2]
        b       LGDK15
LGDK51:
        mvn     r0, #7
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LGDK_ownGetBits_MP3:
        stmdb   sp!, {r4 - r7, lr}
        cmp     r2, #0
        moveq   r0, #0
        ldmeqia sp!, {r4 - r7, pc}
        ldr     r12, [r0]
        ldr     r3, [r1]
        mvn     lr, #0
        ldrb    r7, [r12, #1]
        ldrb    r6, [r12]
        ldrb    r5, [r12, #2]
        ldrb    r4, [r12, #3]
        mov     r7, r7, lsl #16
        orr     r6, r7, r6, lsl #24
        orr     r5, r6, r5, lsl #8
        orr     r4, r5, r4
        and     r4, r4, lr, lsr r3
        add     lr, r2, r3
        rsb     r3, lr, #0x20
        add     lr, r12, lr, asr #3
        str     lr, [r0]
        ldr     r12, [r1]
        mov     r3, r4, lsr r3
        mov     r0, r3
        add     r12, r2, r12
        and     r2, r12, #7
        str     r2, [r1]
        ldmia   sp!, {r4 - r7, pc}
        .long   0x66666667
        .long   0x2aaaaaab
        .long   LGDK__pMP3TableSlen
        .long   0x38e38e39


        .data
        .align  4


LGDK__pNumberOfSfbBlock:
        .byte   0x06,0x05,0x05,0x05,0x09,0x09,0x09,0x09,0x06,0x09,0x09,0x09,0x06,0x05,0x07,0x03
        .byte   0x09,0x09,0x0C,0x06,0x06,0x09,0x0C,0x06,0x0B,0x0A,0x00,0x00,0x12,0x12,0x00,0x00
        .byte   0x0F,0x12,0x00,0x00,0x07,0x07,0x07,0x00,0x0C,0x0C,0x0C,0x00,0x06,0x0F,0x0C,0x00
        .byte   0x06,0x06,0x06,0x03,0x0C,0x09,0x09,0x06,0x06,0x0C,0x09,0x06,0x08,0x08,0x05,0x00
        .byte   0x0F,0x0C,0x09,0x00,0x06,0x12,0x09,0x00
LGDK__pMP3TableSlen:
        .byte   0x00,0x00,0x00,0x00,0x03,0x01,0x01,0x01,0x02,0x02,0x02,0x03,0x03,0x03,0x04,0x04
        .byte   0x00,0x01,0x02,0x03,0x00,0x01,0x02,0x03,0x01,0x02,0x03,0x01,0x02,0x03,0x02,0x03


