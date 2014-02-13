        .text
        .align  4
        .globl  log1p


log1p:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x30
        mov     r12, #0xFF, 12
        str     r0, [sp, #0x28]
        orr     r12, r12, #7, 4
        str     r1, [sp, #0x2C]
        add     r2, r12, #1, 2
        cmp     r2, r1
        mvn     r3, #2, 2
        mov     r2, #0
        bhi     LABT1
        add     r12, r12, #1, 2
        cmp     r12, r1
        bne     LABT0
        cmp     r0, #0
        beq     LABT32
LABT0:
        cmp     r1, #0
        blt     LABT33
        b       LABT2
LABT1:
        mov     r2, #0xFF
        orr     r2, r2, #7, 24
        cmp     r1, r2, lsl #20
        blt     LABT6
LABT2:
        orrs    r2, r0, r1, lsl #12
        beq     LABT4
LABT3:
        orr     r1, r1, #2, 14
        b       LABT5
LABT4:
        cmp     r1, #0
        blt     LABT3
LABT5:
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LABT6:
        mvn     r2, #0xFF, 12
        bic     r2, r2, #0xF, 4
        movs    r12, r1, lsl #1
        and     r2, r1, r2
        moveq   r12, #2, 12
        orrne   r2, r2, #1, 12
        bics    r3, r1, r3
        mov     r4, r0
        beq     LABT7
        rsbs    r4, r4, #0
        rsc     r2, r2, #0
LABT7:
        mov     r3, #0x33
        orr     r3, r3, #1, 22
        sub     r6, r3, r12, lsr #21
        cmp     r6, #0x3E
        ble     LABT20
        cmp     r6, #0x6A
        bhi     LABT19
        ldr     r12, [pc, #0x7DC]
        mov     r3, r4, lsr #23
        orr     r2, r3, r2, lsl #9
        ldr     r0, [pc, #0x7D4]
        mov     r3, r4, lsl #9
        rsb     r12, r12, #0
        add     r5, r2, r3, lsr #31
        smull   r12, r1, r12, r5
        smull   lr, r12, r5, r5
        sub     r4, r6, #0x37
        add     r0, r0, r1, asr r4
        sub     r1, r6, #0x38
        adds    r7, r12, lr, lsr #31
        smull   r0, r9, r0, r7
        sub     r8, r6, #0x35
        rsb     r0, r6, #0x58
        rsb     r10, r5, r9, asr r1
        cmp     r8, #0x20
        mov     r9, r9, lsl r0
        bgt     LABT8
        mov     r9, r9, lsr r8
        rsb     r11, r6, #0x55
        mov     r8, r10, asr r8
        orr     r11, r9, r10, lsl r11
        b       LABT9
LABT8:
        cmp     r8, #0x40
        movgt   r8, #0
        movgt   r11, r8
        bgt     LABT9
        sub     r8, r6, #0x55
        mov     r9, r10, asr #31
        mov     r10, r10, lsr r8
        rsb     r11, r6, #0x75
        mov     r8, r9, asr r8
        orr     r11, r10, r9, lsl r11
LABT9:
        ldr     r10, [pc, #0x750]
        adds    r9, r11, r10
        adc     r10, r8, r10
        smull   r11, r8, r7, r9
        adds    r10, r10, r9, lsr #31
        smull   r9, r7, r7, r10
        smull   r11, r10, lr, r10
        adds    r9, r9, r10
        adc     r10, r7, r10, asr #31
        adds    r9, r9, r8
        adc     r8, r10, r8, asr #31
        smull   r10, r7, r5, r9
        adds    r9, r8, r9, lsr #31
        smull   r8, r9, r5, r9
        adds    r8, r8, r7
        adc     r7, r9, r7, asr #31
        cmp     r1, #0x20
        bgt     LABT10
        mov     r8, r8, lsr r1
        orr     r0, r8, r7, lsl r0
        mov     r1, r7, asr r1
        b       LABT11
LABT10:
        cmp     r1, #0x40
        movgt   r1, #0
        movgt   r0, r1
        bgt     LABT11
        mov     r1, r7, asr #31
        sub     r8, r6, #0x58
        rsb     r0, r6, #0x78
        mov     r7, r7, lsr r8
        orr     r0, r7, r1, lsl r0
        mov     r1, r1, asr r8
LABT11:
        subs    lr, r0, lr
        sbc     r0, r1, r12
        cmp     r4, #0x20
        bge     LABT12
        sub     r1, r6, #0x36
        rsb     r12, r6, #0x56
        mov     lr, lr, lsr r1
        orr     r12, lr, r0, lsl r12
        mov     lr, r0, asr r1
        b       LABT13
LABT12:
        cmp     r4, #0x40
        movge   r12, #0
        movge   lr, r12
        bge     LABT13
        sub     lr, r6, #0x56
        mov     r1, r0, asr #31
        mov     r0, r0, lsr lr
        rsb     r12, r6, #0x76
        orr     r12, r0, r1, lsl r12
        mov     lr, r1, asr lr
LABT13:
        smull   r1, r0, r5, r3
        adds    r12, r12, #0
        adc     lr, lr, r5
        mov     r1, r0, asr #31
        adds    r7, r12, r3
        adc     r10, lr, r3, asr #31
        mov     r8, r4, asr #31
        mov     r2, r4
        mov     r3, r8
        bl      __ashrdi3
        mov     r9, r0
        smull   r5, r0, r5, r9
        mov     r1, r0, asr #31
        mov     r2, r4
        mov     r3, r8
        bl      __ashrdi3
        subs    r7, r7, r9
        sbc     r10, r10, r9, asr #31
        adds    r0, r7, r0
        adc     r2, r10, r1
        mvn     r1, #2, 2
        bics    r1, r2, r1
        add     r6, r6, #9
        beq     LABT14
        rsbs    r0, r0, #0
        rsc     r2, r2, #0
LABT14:
        mov     r3, #0x33
        orr     r3, r3, #1, 22
        clz     lr, r2
        add     r3, r3, #9
        cmp     lr, #0x20
        rsb     r12, r6, r3
        beq     LABT35
LABT15:
        sub     lr, lr, #1
        rsb     r3, lr, #0x20
        mov     r3, r0, lsr r3
        orr     r3, r3, r2, lsl lr
        subs    r2, r12, lr
        mov     lr, r0, lsl lr
        bpl     LABT17
        rsb     r2, r2, #0
        cmp     r2, #0x20
        blt     LABT16
        mov     lr, r3
        mov     r3, r3, asr #31
        sub     r2, r2, #0x20
LABT16:
        cmp     r2, #0x20
        mov     r0, #0x20
        movgt   r2, r0
        mov     lr, lr, lsr r2
        rsb     r0, r2, #0x20
        orr     lr, lr, r3, lsl r0
        mov     r3, r3, asr r2
        mov     r2, #0
LABT17:
        mov     r0, lr, lsr #9
        and     r12, r0, #1
        mov     r0, r3, lsl #22
        orr     lr, r0, lr, lsr #10
        adds    r0, r12, lr
        mov     r3, r3, lsr #10
        adc     r12, r3, r12, asr #31
        orrs    r3, r12, r12, asr #31
        moveq   r2, #0
        beq     LABT18
        mov     r3, #0x3E
        add     r3, r3, #0x1F, 26
        cmp     r3, r2
        bgt     LABT18
        mov     r0, #0xFE
        orr     r2, r0, #7, 24
        mov     r0, #0
        add     r2, r2, #1
        mov     r12, r0
LABT18:
        add     r2, r12, r2, lsl #20
        orr     r1, r2, r1
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LABT19:
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LABT20:
        cmp     r6, #0x34
        bgt     LABT21
        mov     r3, r4, lsr #23
        adds    r6, r6, #9
        orr     r5, r3, r2, lsl #9
        movmi   r0, #0
        movpl   r0, #1
        mov     r1, r0, asr #31
        mov     r2, r6
        mov     r3, #0
        bl      __ashldi3
        adds    r0, r0, r4, lsl #9
        adc     r1, r5, r1
        b       LABT22
LABT21:
        mov     r1, r2
        rsb     r6, r6, #0x3E
        mov     r2, r6
        mov     r0, r4
        mov     r3, #0
        bl      __ashldi3
        adds    r0, r0, #0
        adc     r1, r1, #1, 2
        mov     r6, #0x3E
LABT22:
        cmp     r1, r0, asr #31
        bne     LABT23
        mov     r1, r0
        add     r6, r6, #0x20
        mov     r0, #0
LABT23:
        eor     r3, r1, r1, asr #31
        sub     r3, r3, r1, asr #31
        clz     r3, r3
        sub     r4, r3, #1
        mov     r2, r4
        mov     r3, #0
        bl      __ashldi3
        ldr     r12, [pc, #0x4C0]
        ldr     r7, [pc, #0x4C0]
        ldr     r9, [pc, #0x4C0]
        mov     r2, r1, lsr #25
        sub     r3, r2, #0x20
        ldrb    r2, [r3, +r12]
        mov     r12, r1, lsl #22
        add     r6, r6, r4
        mov     r1, r1, lsr #10
        umull   r1, r4, r1, r2
        orr     r12, r12, r0, lsr #10
        umull   lr, r12, r12, r2
        ldr     r4, [pc, #0x49C]
        sub     r6, r6, r3, asr #4
        adds    r5, lr, #0
        ldrb    lr, [r3, +r4]
        adc     r1, r12, r1
        ldr     r4, [pc, #0x48C]
        mov     r12, r0, lsl #22
        mov     r0, r1, lsr #17
        str     r6, [sp]
        ldr     r8, [r7, +r3, lsl #3]
        sub     r0, r0, #2, 24
        add     r3, r7, r3, lsl #3
        ldr     r3, [r3, #4]
        ldr     r7, [pc, #0x470]
        mov     r6, r0, lsl #1
        ldrh    r6, [r4, +r6]
        ldrb    r4, [r0, +r9]
        ldr     r9, [r7, +r0, lsl #3]
        add     r0, r7, r0, lsl #3
        umull   r1, r7, r1, r6
        sub     r7, lr, #0x2B
        str     r9, [sp, #0xC]
        ldr     r10, [sp, #0xC]
        sub     r11, r4, #0x2B
        str     r1, [sp, #8]
        ldr     r1, [r0, #4]
        umull   r0, r5, r6, r5
        str     r5, [sp, #4]
        mov     r9, r1, lsr r11
        rsb     r4, r4, #0x4B
        mov     r11, r10, lsr r11
        orr     r10, r9, r10, lsl r4
        ldr     r9, [sp, #8]
        adds    r0, r0, #0
        mov     r4, r1, lsl r4
        ldr     r1, [sp, #4]
        mov     r5, r3, lsr r7
        rsb     lr, lr, #0x4B
        orr     r5, r5, r8, lsl lr
        adc     r1, r1, r9
        cmp     r12, #0
        beq     LABT24
        mul     r6, r2, r6
        umull   r6, r2, r12, r6
        adds    r0, r0, r2
        adc     r1, r1, #0
LABT24:
        adds    r10, r5, r10
        adc     r7, r11, r8, asr r7
        mov     r2, #0
        adds    lr, r4, r3, lsl lr
        adc     r2, r2, #0
        adds    r10, r10, r2
        mov     r3, r1
        adc     r2, r7, r2, asr #31
        cmp     r3, #0
        str     lr, [sp, #8]
        str     r10, [sp, #4]
        str     r2, [sp, #0xC]
        rsblt   r3, r3, #0
        clz     r3, r3
        subs    r4, r3, #1
        subne   r4, r4, #1
        mov     r2, r4
        mov     r3, #0
        bl      __ashldi3
        ldr     r3, [pc, #0x388]
        ldr     lr, [pc, #0x380]
        mov     r6, r0
        add     r7, r1, r6, lsr #31
        smull   r1, r12, r7, r6
        smull   r10, r9, r7, r7
        ldr     r1, [pc, #0x36C]
        str     r12, [sp, #0x10]
        add     r8, r4, #6
        rsb     r1, r1, #0
        smull   r1, r12, r1, r7
        add     r5, r4, #7
        add     r12, r3, r12, asr r5
        adds    r1, r9, r10, lsr #31
        smull   r12, r3, r12, r1
        rsb     r12, r5, #0x21
        str     r12, [sp, #0x14]
        rsb     r0, r7, r3, asr r8
        mov     r12, r3, lsl r12
        add     r11, r4, #9
        rsb     r3, r5, #0x1E
        mov     r12, r12, lsr r11
        orr     r3, r12, r0, lsl r3
        adds    r12, r3, lr
        smull   r2, r3, r12, r1
        adc     r11, lr, r0, asr r11
        adds    r11, r11, r12, lsr #31
        smull   r12, lr, r11, r1
        smull   r1, r11, r11, r10
        ldr     r0, [sp, #0x10]
        adds    r12, r12, r11
        adc     r11, lr, r11, asr #31
        adds    r12, r12, r3
        smull   lr, r2, r7, r12
        adc     r3, r11, r3, asr #31
        adds    r12, r3, r12, lsr #31
        smull   r3, r11, r7, r12
        str     r2, [sp, #0x10]
        mov     r1, r0, asr #31
        str     r3, [sp, #0x18]
        mov     r3, r5, asr #31
        str     r3, [sp, #0x1C]
        mov     r2, r5
        bl      __ashrdi3
        ldr     r3, [sp, #0x18]
        ldr     r1, [sp, #0x10]
        ldr     r12, [sp, #0x14]
        mov     r2, r5
        adds    r3, r3, r1
        mov     r3, r3, lsr r8
        adc     r1, r11, r1, asr #31
        orr     r3, r3, r1, lsl r12
        mov     r11, r0
        smull   r12, r0, r7, r11
        subs    r3, r3, r10
        rsc     r8, r9, r1, asr r8
        add     r1, r4, #8
        rsb     r12, r5, #0x1F
        mov     r3, r3, lsr r1
        orr     r12, r3, r8, lsl r12
        adds    r3, r12, #0
        adc     r12, r7, r8, asr r1
        adds    r7, r3, r6
        ldr     r3, [sp, #0x1C]
        mov     r1, r0, asr #31
        adc     r6, r12, r6, asr #31
        bl      __ashrdi3
        subs    r7, r7, r11
        sbc     r6, r6, r11, asr #31
        adds    r0, r7, r0
        adc     r1, r6, r1
        cmp     r5, #0xB
        blt     LABT25
        sub     r2, r4, #4
        mov     r3, #0
        bl      __ashrdi3
        mov     r4, r1, asr #31
        b       LABT26
LABT25:
        rsb     r2, r5, #0xB
        add     r4, r4, #0x1C
        mov     r4, r1, asr r4
        mov     r3, #0
        bl      __ashldi3
LABT26:
        ldr     r2, [sp, #4]
        adds    lr, r2, r1
        ldr     r1, [sp, #0xC]
        adc     r2, r1, r4
        ldr     r1, [sp, #8]
        ldr     r4, [pc, #0x244]
        adds    r3, r1, r0
        ldr     r1, [sp]
        mov     r0, #0
        ldr     r5, [r4]
        ldr     r7, [r4, #4]
        ldr     r6, [r4, #8]
        adc     r12, r0, #0
        adds    r4, lr, r12
        rsb     r1, r1, #0x3E
        smull   r8, r7, r7, r1
        smull   lr, r5, r5, r1
        mul     r1, r6, r1
        adc     r12, r2, r12, asr #31
        adds    r8, r5, r8
        adc     r5, r7, r5, asr #31
        adds    r8, r8, #0
        adc     r1, r5, r1
        adds    r8, r4, r8
        adc     r1, r12, r1
        adds    r5, r3, lr
        adc     r2, r0, #0
        adds    r0, r8, r2
        adc     r1, r1, r2, asr #31
        mov     r3, #0
        eor     r2, r1, r1, asr #31
        sub     r2, r2, r1, asr #31
        clz     r4, r2
        sub     r2, r4, #1
        bl      __ashldi3
        mvn     r2, #2, 2
        rsb     r3, r4, #0x21
        bics    r2, r1, r2
        orr     r5, r0, r5, lsr r3
        add     r4, r4, #0x2A
        beq     LABT27
        rsbs    r5, r5, #0
        rsc     r1, r1, #0
LABT27:
        mov     r0, #0xFF
        orr     r0, r0, #7, 24
        sub     r0, r0, #0xF3, 30
        add     r0, r0, #9
        clz     r12, r1
        cmp     r12, #0x20
        rsb     r0, r4, r0
        beq     LABT36
LABT28:
        sub     r12, r12, #1
        rsb     r3, r12, #0x20
        mov     r3, r5, lsr r3
        orr     r3, r3, r1, lsl r12
        subs    r1, r0, r12
        mov     r5, r5, lsl r12
        bpl     LABT30
        rsb     r1, r1, #0
        cmp     r1, #0x20
        blt     LABT29
        mov     r5, r3
        mov     r3, r3, asr #31
        sub     r1, r1, #0x20
LABT29:
        cmp     r1, #0x20
        mov     r0, #0x20
        movgt   r1, r0
        mov     r5, r5, lsr r1
        rsb     r0, r1, #0x20
        orr     r5, r5, r3, lsl r0
        mov     r3, r3, asr r1
        mov     r1, #0
LABT30:
        mov     r0, r5, lsr #9
        and     r12, r0, #1
        mov     r0, r3, lsl #22
        orr     r5, r0, r5, lsr #10
        adds    r0, r12, r5
        mov     r3, r3, lsr #10
        adc     r12, r3, r12, asr #31
        orrs    r3, r12, r12, asr #31
        moveq   r1, #0
        beq     LABT31
        mov     r3, #0xFE
        orr     r3, r3, #7, 24
        cmp     r3, r1
        bgt     LABT31
        mov     r0, #0x3E
        add     r1, r0, #0x1F, 26
        mov     r0, #0
        add     r1, r1, #1
        mov     r12, r0
LABT31:
        add     r1, r12, r1, lsl #20
        orr     r1, r1, r2
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LABT32:
        str     r0, [sp, #0x20]
        orr     lr, r1, #0xF, 4
        add     r2, sp, #0x28
        add     r3, sp, #0x28
        mov     r0, r2
        mov     r1, r3
        str     lr, [sp, #0x24]
        add     r4, sp, #0x20
        mov     r2, r4
        mov     r3, #0x8C
        bl      __libm_error_support
        ldr     r0, [sp, #0x20]
        ldr     r1, [sp, #0x24]
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LABT33:
        adds    r12, r1, #1, 12
        bmi     LABT34
        cmn     r1, #1, 12
        bne     LABT2
        cmp     r0, #0
        bne     LABT2
LABT34:
        str     r2, [sp, #0x20]
        add     r1, sp, #0x28
        add     r0, sp, #0x28
        add     r2, sp, #0x20
        mov     r3, r3, lsl #19
        str     r3, [sp, #0x24]
        mov     r3, #0x8D
        bl      __libm_error_support
        ldr     r0, [sp, #0x20]
        ldr     r1, [sp, #0x24]
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LABT35:
        clz     r3, r0
        cmp     r3, #0
        beq     LABT15
        mov     r2, r0
        sub     r12, r12, #0x20
        mov     lr, r3
        mov     r0, #0
        b       LABT15
LABT36:
        clz     r3, r5
        cmp     r3, #0
        beq     LABT28
        mov     r1, r5
        sub     r0, r0, #0x20
        mov     r12, r3
        mov     r5, #0
        b       LABT28
        .long   0x55555555
        .long   0x66666666
        .long   LABT_r1_tbl
        .long   LABT_log_r1_tbl
        .long   LABT_log_r2_scale
        .long   LABT_log_r1_scale
        .long   LABT_r2_tbl
        .long   LABT_log_r2_tbl
        .long   LABT_LOG_2


        .data
        .align  4


LABT_r1_tbl:
        .byte   0x40,0x3F,0x3D,0x3B,0x39,0x38,0x36,0x35,0x34,0x32,0x31,0x30,0x2F,0x2E,0x2D,0x2C
        .byte   0x2B,0x2A,0x29,0x29,0x28,0x27,0x26,0x26,0x25,0x24,0x24,0x23,0x23,0x22,0x22,0x21
LABT_log_r1_scale:
        .byte   0x45,0x44,0x43,0x42,0x42,0x41,0x41,0x41,0x41,0x41,0x40,0x40,0x40,0x40,0x40,0x40
        .byte   0x40,0x40,0x41,0x41,0x41,0x41,0x41,0x41,0x41,0x42,0x42,0x42,0x42,0x43,0x43,0x44
LABT_log_r1_tbl:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x62,0x59,0x81,0x40,0x28,0x1D,0x61,0x4D
        .byte   0x52,0xA8,0x52,0x62,0xD4,0x0C,0xCD,0x7E,0x74,0x45,0x4C,0x53,0x77,0xB1,0xFA,0x81
        .byte   0x8E,0x9D,0x9C,0x76,0x40,0x89,0x1A,0x11,0x08,0x3A,0x5E,0x44,0x79,0xEF,0x91,0x9F
        .byte   0xAD,0x01,0xFD,0x56,0xEE,0xC7,0xF6,0x50,0x95,0x05,0x8F,0x60,0xEE,0x06,0x8F,0x46
        .byte   0xF2,0xB4,0x4F,0x6A,0xBD,0x8D,0x67,0x2B,0xB2,0x71,0x64,0x7E,0xF6,0xE5,0xCD,0xCE
        .byte   0x08,0x3A,0x5E,0x44,0x79,0xEF,0x91,0x9F,0x44,0x88,0xA5,0x49,0xE1,0x49,0x6E,0xD3
        .byte   0xDC,0x49,0x09,0x4F,0xD5,0x0E,0xC6,0xCC,0x1C,0xB8,0x8A,0x54,0x38,0x5F,0x8F,0xE2
        .byte   0xFA,0x20,0x2B,0x5A,0x6A,0x50,0xA8,0x71,0xEF,0xE8,0xEB,0x5F,0xB8,0x6F,0x54,0x60
        .byte   0x14,0x75,0x5C,0xB4,0x8F,0x3D,0x8B,0x7B,0x51,0x8D,0x62,0xBA,0xF2,0xC7,0x67,0x51
        .byte   0x4A,0x9E,0x1B,0x81,0xCB,0x55,0x07,0x87,0x4A,0x9E,0x1B,0x81,0xCB,0x55,0x07,0x87
        .byte   0xE1,0x20,0xC0,0x8D,0x4F,0x79,0x97,0x95,0x8C,0x95,0xB6,0x9A,0x27,0x2E,0xA5,0x2E
        .byte   0x3D,0x3E,0x03,0xA8,0xDE,0xB0,0xB0,0x61,0x3D,0x3E,0x03,0xA8,0xDE,0xB0,0xB0,0x61
        .byte   0x1F,0xB4,0xAA,0xB5,0xD0,0x72,0x2B,0x80,0x47,0xE2,0x63,0x87,0x58,0x68,0x34,0x54
        .byte   0x47,0xE2,0x63,0x87,0x58,0x68,0x34,0x54,0xD4,0xB5,0x3C,0xA4,0x90,0xD1,0x52,0x6A
        .byte   0xD4,0xB5,0x3C,0xA4,0x90,0xD1,0x52,0x6A,0xFF,0x3C,0xD7,0x83,0x7A,0x66,0x75,0xBA
        .byte   0xFF,0x3C,0xD7,0x83,0x7A,0x66,0x75,0xBA,0xC6,0x93,0xF5,0x81,0xCC,0xFE,0x33,0x1F
LABT_r2_tbl:
        .byte   0xF8,0x1F,0xE8,0x1F,0xD8,0x1F,0xC8,0x1F,0xB9,0x1F,0xA9,0x1F,0x99,0x1F,0x8A,0x1F
        .byte   0x7A,0x1F,0x6B,0x1F,0x5B,0x1F,0x4C,0x1F,0x3D,0x1F,0x2E,0x1F,0x1E,0x1F,0x0F,0x1F
        .byte   0x00,0x1F,0xF1,0x1E,0xE2,0x1E,0xD3,0x1E,0xC5,0x1E,0xB6,0x1E,0xA7,0x1E,0x99,0x1E
        .byte   0x8A,0x1E,0x7B,0x1E,0x6D,0x1E,0x5E,0x1E,0x50,0x1E,0x42,0x1E,0x33,0x1E,0x25,0x1E
LABT_log_r2_scale:
        .byte   0x48,0x47,0x46,0x46,0x45,0x45,0x45,0x45,0x44,0x44,0x44,0x44,0x44,0x44,0x44,0x44
        .byte   0x43,0x43,0x43,0x43,0x43,0x43,0x43,0x43,0x43,0x43,0x43,0x43,0x43,0x43,0x43,0x43
LABT_log_r2_tbl:
        .byte   0x55,0x01,0x08,0x40,0xCD,0x24,0x62,0x95,0x0A,0x12,0x24,0x60,0xA6,0x01,0x17,0x26
        .byte   0xD1,0x29,0x32,0x50,0x1E,0x87,0xE3,0xE1,0xEC,0x72,0x62,0x70,0xBB,0xEA,0x9F,0x38
        .byte   0x45,0x39,0x4F,0x47,0xCE,0x58,0x7D,0x25,0x14,0x1C,0x77,0x57,0xA1,0xB9,0x37,0x15
        .byte   0x18,0x2B,0xA7,0x67,0xAD,0x2D,0xD5,0x01,0xAF,0xAC,0xDB,0x76,0x20,0x0C,0x73,0xC1
        .byte   0x7C,0xD4,0x8D,0x43,0xE9,0x0F,0xD1,0x93,0xDB,0x93,0x2F,0x4B,0xED,0x72,0x5B,0x31
        .byte   0x5D,0x98,0x57,0x53,0xB6,0x11,0x32,0xAB,0x24,0xE5,0x00,0x5B,0x34,0x7B,0xDF,0x38
        .byte   0xCF,0xDE,0xAD,0x62,0x5E,0xD2,0xBA,0xF5,0xE9,0x88,0x5E,0x6A,0xAF,0xD4,0x47,0x54
        .byte   0x86,0x86,0x96,0x72,0x6E,0x97,0x4F,0x18,0xB9,0xDB,0x4E,0x7A,0x6E,0x6F,0xD9,0x07
        .byte   0x27,0x76,0x05,0x41,0xC0,0x11,0x11,0x9D,0xF3,0x5D,0xE5,0x44,0xEC,0x8A,0x70,0x10
        .byte   0x10,0x27,0xC7,0x48,0xD4,0x71,0x81,0x38,0x53,0xD3,0xAA,0x4C,0x97,0xA3,0x72,0x16
        .byte   0x4B,0xD4,0x4D,0x50,0x85,0x57,0x1B,0xDF,0xDD,0x2B,0x35,0x54,0xDF,0xBE,0xA1,0x72
        .byte   0x01,0x6C,0x1E,0x58,0x49,0xE4,0xFF,0x08,0x94,0xA6,0xC6,0x5B,0x34,0x56,0x27,0xFF
        .byte   0x99,0x9C,0xB3,0x5F,0x9D,0x6B,0x44,0xF3,0xB4,0x80,0xA2,0x63,0xAC,0xEC,0xC5,0xB8
        .byte   0xFD,0x03,0x50,0x67,0x22,0x04,0x96,0x20,0xB9,0xA8,0x42,0x6B,0x49,0x9A,0x3B,0xE1
        .byte   0xF1,0xAF,0xF3,0x6E,0xF3,0x80,0xD0,0xA3,0x05,0x6C,0xA6,0x72,0xB4,0x48,0x22,0xCD
        .byte   0x66,0xAE,0x9E,0x76,0x6F,0xDC,0xDF,0x2D,0x71,0xF8,0x54,0x7A,0xA1,0xC2,0x80,0x21
LABT_LOG_2:
        .byte   0x4F,0x5E,0xCD,0x7B,0x8E,0xBE,0xBF,0x90,0x8C,0x05,0x00,0x00


