        .text
        .align  4
        .globl  _ippsMagnitude_16s_Sfs


_ippsMagnitude_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        ldr     r10, [sp, #0x38]
        mov     r7, r0
        mov     r6, r1
        cmp     r10, #0x10
        mov     r4, r2
        mov     r5, r3
        ble     LBIM0
        cmp     r7, #0
        beq     LBIM36
        cmp     r6, #0
        beq     LBIM36
        mov     r0, r4
        mov     r1, r5
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsZero_16s
LBIM0:
        cmp     r7, #0
        beq     LBIM36
        cmp     r6, #0
        beq     LBIM36
        cmp     r4, #0
        beq     LBIM36
        cmp     r5, #0
        ble     LBIM37
        mov     r12, #0xFF
        cmp     r10, #0
        orr     r12, r12, #0xFF, 24
        mvn     r8, #0xFF, 8
        beq     LBIM23
        cmp     r10, #0
        ble     LBIM11
        cmp     r5, #0
        sub     lr, r10, #1
        mov     r11, #1
        ble     LBIM34
        ldr     r0, [pc, #0x644]
        ldr     r1, [pc, #0x644]
        sub     r9, r12, #2, 18
        mov     r2, r10, lsl #1
        sub     r12, r8, #0xFF, 16
        str     r12, [sp, #0xC]
        str     r2, [sp, #4]
        str     lr, [sp, #8]
        str     r8, [sp]
LBIM1:
        ldrsh   lr, [r6], #2
        ldrsh   r12, [r7], #2
        mul     lr, lr, lr
        mla     r11, r12, r12, lr
        ldr     r12, [sp, #4]
        mov     r8, r11, lsr r12
        cmp     r8, #1, 24
        bgt     LBIM2
        cmp     r10, #0
        ldrne   r12, [pc, #0x600]
        ldrnesb r12, [r8, +r12]
        ldreq   r12, [pc, #0x5F4]
        ldreqsb r12, [r8, +r12]
        b       LBIM9
LBIM2:
        ldr     r12, [sp]
        cmp     r12, r8
        bge     LBIM4
        ldr     lr, [pc, #0x5E0]
        mov     r12, r8, asr #24
        mov     r0, r8
        ldrsb   r12, [lr, +r12]
        mov     r1, r12, lsl #12
        str     r1, [sp, #0x10]
        bl      __intel_idiv
        ldr     r12, [sp, #0x10]
        add     r12, r12, r0
        mov     r0, r8
        mov     r1, r12, asr #1
        str     r1, [sp, #0x10]
        bl      __intel_idiv
        ldr     r12, [sp, #0x10]
        add     r12, r12, r0
        mov     r0, r8
        mov     r1, r12, asr #1
        str     r1, [sp, #0x10]
        bl      __intel_idiv
        ldr     r12, [sp, #0x10]
        add     r0, r12, r0
        mov     r12, r0, asr #1
        mul     lr, r12, r12
        cmp     r8, lr
        bge     LBIM8
LBIM3:
        sub     r12, r12, #1
        mul     lr, r12, r12
        cmp     r8, lr
        blt     LBIM3
        b       LBIM8
LBIM4:
        ldr     r12, [sp, #0xC]
        mov     r0, r8
        cmp     r12, r8
        bge     LBIM6
        ldr     lr, [pc, #0x558]
        mov     r12, r8, asr #16
        ldrsb   r12, [lr, +r12]
        mov     r1, r12, lsl #8
        str     r1, [sp, #0x10]
        bl      __intel_idiv
        ldr     r12, [sp, #0x10]
        add     r12, r12, r0
        mov     r0, r8
        mov     r1, r12, asr #1
        str     r1, [sp, #0x10]
        bl      __intel_idiv
        ldr     r12, [sp, #0x10]
        add     r12, r12, r0
        mov     r0, r8
        mov     r1, r12, asr #1
        str     r1, [sp, #0x10]
        bl      __intel_idiv
        ldr     r12, [sp, #0x10]
        add     r0, r12, r0
        mov     r12, r0, asr #1
        mul     lr, r12, r12
        cmp     r8, lr
        bge     LBIM8
LBIM5:
        sub     r12, r12, #1
        mul     lr, r12, r12
        cmp     r8, lr
        blt     LBIM5
        b       LBIM8
LBIM6:
        ldr     lr, [pc, #0x4E4]
        mov     r12, r8, asr #8
        ldrsb   r12, [lr, +r12]
        mov     r12, r12, lsl #4
        add     r1, r12, #9
        str     r1, [sp, #0x10]
        bl      __intel_idiv
        ldr     r12, [sp, #0x10]
        add     r0, r12, r0
        mov     r12, r0, asr #1
        mul     lr, r12, r12
        cmp     r8, lr
        bge     LBIM8
LBIM7:
        sub     r12, r12, #1
        mul     lr, r12, r12
        cmp     r8, lr
        blt     LBIM7
LBIM8:
        cmp     r10, #0
        bne     LBIM9
        mul     r0, r12, r12
        mov     lr, r12, lsl #1
        add     lr, lr, #1
        sub     r8, r8, r0
        cmp     lr, r8, lsl #1
        addle   r12, r12, #1
LBIM9:
        ldr     lr, [sp, #8]
        mov     r0, r12, lsl r10
        mov     r8, #1
        add     lr, r0, r8, lsl lr
        mul     lr, lr, lr
        cmp     lr, r11
        addcc   r12, r12, #1
        bcc     LBIM10
        cmp     lr, r11
        bne     LBIM10
        tst     r12, #1
        addne   r12, r12, #1
LBIM10:
        cmp     r12, r9
        mov     lr, r9
        movcc   lr, r12
        strh    lr, [r4], #2
        subs    r5, r5, #1
        bne     LBIM1
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LBIM11:
        cmn     r10, #0xF
        bgt     LBIM13
        cmp     r5, #0
        ble     LBIM34
        mov     lr, #0
LBIM12:
        ldrsh   r8, [r6], #2
        ldrsh   r9, [r7], #2
        orrs    r8, r9, r8
        moveq   r8, #0
        subne   r8, r12, #2, 18
        add     lr, lr, #1
        strh    r8, [r4], #2
        cmp     lr, r5
        blt     LBIM12
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LBIM13:
        mov     lr, #0xFF
        rsb     r10, r10, #0
        orr     lr, lr, #0x7F, 24
        mov     r9, r10, lsl #1
        cmp     r5, #0
        mov     r10, lr, lsl #15
        ble     LBIM34
        ldr     lr, [pc, #0x3C8]
        sub     r11, r12, #2, 18
        str     r8, [sp]
LBIM14:
        ldrsh   lr, [r6], #2
        ldrsh   r12, [r7], #2
        mul     lr, lr, lr
        mla     lr, r12, r12, lr
        cmp     lr, r10, asr r9
        strcsh  r11, [r4]
        bcs     LBIM22
        mov     r8, lr, lsl r9
        cmp     r8, #1, 24
        ldrle   r12, [pc, #0x398]
        ldrlesb r12, [r8, +r12]
        ble     LBIM21
        ldr     r12, [sp]
        cmp     r12, r8
        bge     LBIM16
        ldr     lr, [pc, #0x384]
        mov     r12, r8, asr #24
        mov     r0, r8
        ldrsb   r12, [lr, +r12]
        mov     r1, r12, lsl #12
        str     r1, [sp, #0x10]
        bl      __intel_idiv
        ldr     r12, [sp, #0x10]
        add     r0, r12, r0
        mov     r1, r0, asr #1
        str     r1, [sp, #0x10]
        mov     r0, r8
        bl      __intel_idiv
        ldr     r12, [sp, #0x10]
        add     r0, r12, r0
        mov     r1, r0, asr #1
        str     r1, [sp, #0x10]
        mov     r0, r8
        bl      __intel_idiv
        ldr     r12, [sp, #0x10]
        add     r0, r12, r0
        mov     r12, r0, asr #1
        mul     lr, r12, r12
        cmp     r8, lr
        mulge   lr, r12, r12
        bge     LBIM20
LBIM15:
        sub     r12, r12, #1
        mul     lr, r12, r12
        cmp     r8, lr
        blt     LBIM15
        b       LBIM20
LBIM16:
        ldr     lr, [sp]
        ldr     r12, [pc, #0x304]
        mov     r0, r8
        sub     lr, lr, #0xFF, 16
        cmp     lr, r8
        bge     LBIM18
        mov     lr, r8, asr #16
        ldrsb   lr, [r12, +lr]
        mov     r1, lr, lsl #8
        str     r1, [sp, #0x10]
        bl      __intel_idiv
        ldr     r12, [sp, #0x10]
        add     r0, r12, r0
        mov     r1, r0, asr #1
        str     r1, [sp, #0x10]
        mov     r0, r8
        bl      __intel_idiv
        ldr     r12, [sp, #0x10]
        add     r0, r12, r0
        mov     r1, r0, asr #1
        str     r1, [sp, #0x10]
        mov     r0, r8
        bl      __intel_idiv
        ldr     r12, [sp, #0x10]
        add     r0, r12, r0
        mov     r12, r0, asr #1
        mul     lr, r12, r12
        cmp     r8, lr
        mulge   lr, r12, r12
        bge     LBIM20
LBIM17:
        sub     r12, r12, #1
        mul     lr, r12, r12
        cmp     r8, lr
        blt     LBIM17
        b       LBIM20
LBIM18:
        mov     lr, r8, asr #8
        ldrsb   lr, [r12, +lr]
        mov     r12, lr, lsl #4
        add     r1, r12, #9
        str     r1, [sp, #0x10]
        bl      __intel_idiv
        ldr     r12, [sp, #0x10]
        add     r0, r12, r0
        mov     r12, r0, asr #1
        mul     lr, r12, r12
        cmp     r8, lr
        mulge   lr, r12, r12
        bge     LBIM20
LBIM19:
        sub     r12, r12, #1
        mul     lr, r12, r12
        cmp     r8, lr
        blt     LBIM19
LBIM20:
        sub     r8, r8, lr
        mov     lr, r12, lsl #1
        add     lr, lr, #1
        cmp     lr, r8, lsl #1
        addle   r12, r12, #1
LBIM21:
        cmp     r12, r11
        mov     lr, r11
        movcc   lr, r12
        strh    lr, [r4]
LBIM22:
        subs    r5, r5, #1
        add     r4, r4, #2
        bne     LBIM14
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LBIM23:
        cmp     r5, #0
        ble     LBIM34
        ldr     r11, [pc, #0x1F0]
        ldr     lr, [pc, #0x1F0]
        sub     r9, r8, #0xFF, 16
        sub     r10, r9, #2, 18
        str     r12, [sp, #0xC]
LBIM24:
        ldrsh   r12, [r7], #2
        cmn     r12, #2, 18
        ldrnesh lr, [r6]
        beq     LBIM35
LBIM25:
        mul     lr, lr, lr
        mla     r9, r12, r12, lr
        cmp     r9, #1, 24
        ldrlesb r12, [r9, +r11]
        ble     LBIM32
        cmp     r8, r9
        bge     LBIM27
        ldr     lr, [pc, #0x1B4]
        mov     r12, r9, asr #24
        mov     r0, r9
        ldrsb   r12, [lr, +r12]
        mov     r1, r12, lsl #12
        str     r1, [sp, #0x10]
        bl      __intel_idiv
        ldr     r12, [sp, #0x10]
        add     r0, r12, r0
        mov     r1, r0, asr #1
        str     r1, [sp, #0x10]
        mov     r0, r9
        bl      __intel_idiv
        ldr     r12, [sp, #0x10]
        add     r0, r12, r0
        mov     r1, r0, asr #1
        str     r1, [sp, #0x10]
        mov     r0, r9
        bl      __intel_idiv
        ldr     r12, [sp, #0x10]
        add     r0, r12, r0
        mov     r12, r0, asr #1
        mul     lr, r12, r12
        cmp     r9, lr
        mulge   lr, r12, r12
        bge     LBIM31
LBIM26:
        sub     r12, r12, #1
        mul     lr, r12, r12
        cmp     r9, lr
        blt     LBIM26
        b       LBIM31
LBIM27:
        ldr     r12, [sp, #0xC]
        mov     r0, r9
        cmp     r12, r9
        bge     LBIM29
        ldr     lr, [pc, #0x128]
        mov     r12, r9, asr #16
        ldrsb   r12, [lr, +r12]
        mov     r1, r12, lsl #8
        str     r1, [sp, #0x10]
        bl      __intel_idiv
        ldr     r12, [sp, #0x10]
        add     r0, r12, r0
        mov     r1, r0, asr #1
        str     r1, [sp, #0x10]
        mov     r0, r9
        bl      __intel_idiv
        ldr     r12, [sp, #0x10]
        add     r0, r12, r0
        mov     r1, r0, asr #1
        str     r1, [sp, #0x10]
        mov     r0, r9
        bl      __intel_idiv
        ldr     r12, [sp, #0x10]
        add     r0, r12, r0
        mov     r12, r0, asr #1
        mul     lr, r12, r12
        cmp     r9, lr
        mulge   lr, r12, r12
        bge     LBIM31
LBIM28:
        sub     r12, r12, #1
        mul     lr, r12, r12
        cmp     r9, lr
        blt     LBIM28
        b       LBIM31
LBIM29:
        ldr     lr, [pc, #0xB0]
        mov     r12, r9, asr #8
        ldrsb   r12, [lr, +r12]
        mov     r12, r12, lsl #4
        add     r1, r12, #9
        str     r1, [sp, #0x10]
        bl      __intel_idiv
        ldr     r12, [sp, #0x10]
        add     r0, r12, r0
        mov     r12, r0, asr #1
        mul     lr, r12, r12
        cmp     r9, lr
        mulge   lr, r12, r12
        bge     LBIM31
LBIM30:
        sub     r12, r12, #1
        mul     lr, r12, r12
        cmp     r9, lr
        blt     LBIM30
LBIM31:
        sub     r9, r9, lr
        mov     lr, r12, lsl #1
        add     lr, lr, #1
        cmp     lr, r9, lsl #1
        addle   r12, r12, #1
LBIM32:
        cmp     r12, r10
        mov     lr, r10
        movcc   lr, r12
        strh    lr, [r4]
LBIM33:
        subs    r5, r5, #1
        add     r6, r6, #2
        add     r4, r4, #2
        bne     LBIM24
LBIM34:
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LBIM35:
        ldrsh   lr, [r6]
        cmn     lr, #2, 18
        streqh  r10, [r4]
        beq     LBIM33
        b       LBIM25
LBIM36:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LBIM37:
        mvn     r0, #5
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
        .long   LBIM_sqrtblr
        .long   LBIM_sqrtbl


        .data
        .align  4


LBIM_sqrtbl:
        .byte   0x00,0x01,0x01,0x01,0x02,0x02,0x02,0x02,0x02,0x03,0x03,0x03,0x03,0x03,0x03,0x03
        .byte   0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x05,0x05,0x05,0x05,0x05,0x05,0x05
        .byte   0x05,0x05,0x05,0x05,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06
        .byte   0x06,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07
        .byte   0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08
        .byte   0x08,0x09,0x09,0x09,0x09,0x09,0x09,0x09,0x09,0x09,0x09,0x09,0x09,0x09,0x09,0x09
        .byte   0x09,0x09,0x09,0x09,0x0A,0x0A,0x0A,0x0A,0x0A,0x0A,0x0A,0x0A,0x0A,0x0A,0x0A,0x0A
        .byte   0x0A,0x0A,0x0A,0x0A,0x0A,0x0A,0x0A,0x0A,0x0A,0x0B,0x0B,0x0B,0x0B,0x0B,0x0B,0x0B
        .byte   0x0B,0x0B,0x0B,0x0B,0x0B,0x0B,0x0B,0x0B,0x0B,0x0B,0x0B,0x0B,0x0B,0x0B,0x0B,0x0B
        .byte   0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C
        .byte   0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D
        .byte   0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D
        .byte   0x0D,0x0D,0x0D,0x0D,0x0E,0x0E,0x0E,0x0E,0x0E,0x0E,0x0E,0x0E,0x0E,0x0E,0x0E,0x0E
        .byte   0x0E,0x0E,0x0E,0x0E,0x0E,0x0E,0x0E,0x0E,0x0E,0x0E,0x0E,0x0E,0x0E,0x0E,0x0E,0x0E
        .byte   0x0E,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F
        .byte   0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F
        .byte   0x10,0x00,0x00,0x00
LBIM_sqrtblr:
        .byte   0x00,0x01,0x01,0x02,0x02,0x02,0x02,0x03,0x03,0x03,0x03,0x03,0x03,0x04,0x04,0x04
        .byte   0x04,0x04,0x04,0x04,0x04,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x06
        .byte   0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x07,0x07,0x07,0x07,0x07
        .byte   0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x08,0x08,0x08,0x08,0x08,0x08,0x08
        .byte   0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x09,0x09,0x09,0x09,0x09,0x09,0x09
        .byte   0x09,0x09,0x09,0x09,0x09,0x09,0x09,0x09,0x09,0x09,0x09,0x0A,0x0A,0x0A,0x0A,0x0A
        .byte   0x0A,0x0A,0x0A,0x0A,0x0A,0x0A,0x0A,0x0A,0x0A,0x0A,0x0A,0x0A,0x0A,0x0A,0x0A,0x0B
        .byte   0x0B,0x0B,0x0B,0x0B,0x0B,0x0B,0x0B,0x0B,0x0B,0x0B,0x0B,0x0B,0x0B,0x0B,0x0B,0x0B
        .byte   0x0B,0x0B,0x0B,0x0B,0x0B,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C
        .byte   0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0D,0x0D,0x0D
        .byte   0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D
        .byte   0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0D,0x0E,0x0E,0x0E,0x0E,0x0E,0x0E,0x0E,0x0E,0x0E
        .byte   0x0E,0x0E,0x0E,0x0E,0x0E,0x0E,0x0E,0x0E,0x0E,0x0E,0x0E,0x0E,0x0E,0x0E,0x0E,0x0E
        .byte   0x0E,0x0E,0x0E,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F
        .byte   0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F
        .byte   0x0F,0x10,0x10,0x10,0x10,0x10,0x10,0x10,0x10,0x10,0x10,0x10,0x10,0x10,0x10,0x10
        .byte   0x10


