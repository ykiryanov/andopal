        .text
        .align  4
        .globl  _ippsMagnitude_16sc_Sfs


_ippsMagnitude_16sc_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        mov     r6, r3
        cmp     r6, #0x10
        mov     r7, r0
        mov     r4, r1
        mov     r5, r2
        ble     LBIL0
        cmp     r7, #0
        beq     LBIL37
        mov     r0, r4
        mov     r1, r5
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsZero_16s
LBIL0:
        cmp     r7, #0
        beq     LBIL37
        cmp     r4, #0
        beq     LBIL37
        cmp     r5, #0
        ble     LBIL36
        mov     r12, #0xFF
        cmp     r6, #0
        orr     r12, r12, #0xFF, 24
        mvn     r10, #0xFF, 8
        beq     LBIL23
        cmp     r6, #0
        ble     LBIL11
        cmp     r5, #0
        sub     r9, r6, #1
        mov     lr, #1
        ble     LBIL34
        ldr     r11, [pc, #0x620]
        ldr     r0, [pc, #0x620]
        sub     r8, r12, #2, 18
        mov     r1, r6, lsl #1
        sub     r12, r10, #0xFF, 16
        str     r12, [sp]
        str     r1, [sp, #8]
        str     r10, [sp, #4]
LBIL1:
        ldrsh   lr, [r7, #2]
        ldrsh   r12, [r7], #4
        mul     lr, lr, lr
        mla     r11, r12, r12, lr
        ldr     r12, [sp, #8]
        mov     r10, r11, lsr r12
        cmp     r10, #1, 24
        bgt     LBIL2
        cmp     r6, #0
        ldrne   r12, [pc, #0x5E0]
        ldrnesb r12, [r10, +r12]
        ldreq   r12, [pc, #0x5D4]
        ldreqsb r12, [r10, +r12]
        b       LBIL9
LBIL2:
        ldr     r12, [sp, #4]
        cmp     r12, r10
        bge     LBIL4
        ldr     r12, [pc, #0x5C0]
        mov     lr, r10, asr #24
        mov     r0, r10
        ldrsb   r12, [r12, +lr]
        mov     r1, r12, lsl #12
        str     r1, [sp, #0xC]
        bl      __intel_idiv
        ldr     r12, [sp, #0xC]
        add     r12, r12, r0
        mov     r0, r10
        mov     r1, r12, asr #1
        str     r1, [sp, #0xC]
        bl      __intel_idiv
        ldr     r12, [sp, #0xC]
        add     r12, r12, r0
        mov     r0, r10
        mov     r1, r12, asr #1
        str     r1, [sp, #0xC]
        bl      __intel_idiv
        ldr     r12, [sp, #0xC]
        add     r0, r12, r0
        mov     r12, r0, asr #1
        mul     lr, r12, r12
        cmp     r10, lr
        bge     LBIL8
LBIL3:
        sub     r12, r12, #1
        mul     lr, r12, r12
        cmp     r10, lr
        blt     LBIL3
        b       LBIL8
LBIL4:
        ldr     r12, [sp]
        mov     r0, r10
        cmp     r12, r10
        bge     LBIL6
        ldr     r12, [pc, #0x538]
        mov     lr, r10, asr #16
        ldrsb   lr, [r12, +lr]
        mov     r1, lr, lsl #8
        str     r1, [sp, #0xC]
        bl      __intel_idiv
        ldr     r12, [sp, #0xC]
        add     r12, r12, r0
        mov     r0, r10
        mov     r1, r12, asr #1
        str     r1, [sp, #0xC]
        bl      __intel_idiv
        ldr     r12, [sp, #0xC]
        add     r12, r12, r0
        mov     r0, r10
        mov     r1, r12, asr #1
        str     r1, [sp, #0xC]
        bl      __intel_idiv
        ldr     r12, [sp, #0xC]
        add     r0, r12, r0
        mov     r12, r0, asr #1
        mul     lr, r12, r12
        cmp     r10, lr
        bge     LBIL8
LBIL5:
        sub     r12, r12, #1
        mul     lr, r12, r12
        cmp     r10, lr
        blt     LBIL5
        b       LBIL8
LBIL6:
        ldr     r12, [pc, #0x4C4]
        mov     lr, r10, asr #8
        ldrsb   lr, [r12, +lr]
        mov     r12, lr, lsl #4
        add     r1, r12, #9
        str     r1, [sp, #0xC]
        bl      __intel_idiv
        ldr     r12, [sp, #0xC]
        add     r0, r12, r0
        mov     r12, r0, asr #1
        mul     lr, r12, r12
        cmp     r10, lr
        bge     LBIL8
LBIL7:
        sub     r12, r12, #1
        mul     lr, r12, r12
        cmp     r10, lr
        blt     LBIL7
LBIL8:
        cmp     r6, #0
        bne     LBIL9
        mul     r0, r12, r12
        mov     lr, r12, lsl #1
        add     lr, lr, #1
        sub     r10, r10, r0
        cmp     lr, r10, lsl #1
        addle   r12, r12, #1
LBIL9:
        mov     r10, #1
        mov     lr, r12, lsl r6
        add     r10, lr, r10, lsl r9
        mul     r10, r10, r10
        cmp     r10, r11
        addcc   r12, r12, #1
        bcc     LBIL10
        cmp     r10, r11
        bne     LBIL10
        tst     r12, #1
        addne   r12, r12, #1
LBIL10:
        cmp     r12, r8
        mov     lr, r8
        movcc   lr, r12
        strh    lr, [r4], #2
        subs    r5, r5, #1
        bne     LBIL1
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LBIL11:
        cmn     r6, #0xF
        bgt     LBIL13
        cmp     r5, #0
        ble     LBIL34
        mov     r3, #0
LBIL12:
        ldr     lr, [r7], #4
        cmp     lr, #0
        moveq   lr, #0
        subne   lr, r12, #2, 18
        add     r3, r3, #1
        strh    lr, [r4], #2
        cmp     r3, r5
        blt     LBIL12
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LBIL13:
        mov     lr, #0xFF
        rsb     r6, r6, #0
        orr     r3, lr, #0x7F, 24
        cmp     r5, #0
        mov     r11, r6, lsl #1
        mov     r9, r3, lsl #15
        ble     LBIL34
        ldr     r3, [pc, #0x3B0]
        sub     r8, r12, #2, 18
LBIL14:
        ldrsh   r12, [r7, #2]
        ldrsh   r3, [r7], #4
        mul     r12, r12, r12
        mla     r12, r3, r3, r12
        cmp     r12, r9, asr r11
        strcsh  r8, [r4]
        bcs     LBIL22
        mov     r6, r12, lsl r11
        cmp     r6, #1, 24
        ldrle   r3, [pc, #0x384]
        ldrlesb r3, [r6, +r3]
        ble     LBIL21
        cmp     r10, r6
        bge     LBIL16
        ldr     r3, [pc, #0x374]
        mov     r12, r6, asr #24
        mov     r0, r6
        ldrsb   r3, [r3, +r12]
        mov     r1, r3, lsl #12
        str     r1, [sp, #0xC]
        bl      __intel_idiv
        ldr     r3, [sp, #0xC]
        add     r3, r3, r0
        mov     r0, r6
        mov     r1, r3, asr #1
        str     r1, [sp, #0xC]
        bl      __intel_idiv
        ldr     r3, [sp, #0xC]
        add     r3, r3, r0
        mov     r0, r6
        mov     r1, r3, asr #1
        str     r1, [sp, #0xC]
        bl      __intel_idiv
        ldr     r3, [sp, #0xC]
        add     r0, r3, r0
        mov     r3, r0, asr #1
        mul     r12, r3, r3
        cmp     r6, r12
        mulge   r12, r3, r3
        bge     LBIL20
LBIL15:
        sub     r3, r3, #1
        mul     r12, r3, r3
        cmp     r6, r12
        blt     LBIL15
        b       LBIL20
LBIL16:
        ldr     r3, [pc, #0x2F8]
        sub     r12, r10, #0xFF, 16
        cmp     r12, r6
        mov     r0, r6
        bge     LBIL18
        mov     r12, r6, asr #16
        ldrsb   r12, [r3, +r12]
        mov     r1, r12, lsl #8
        str     r1, [sp, #0xC]
        bl      __intel_idiv
        ldr     r3, [sp, #0xC]
        add     r3, r3, r0
        mov     r0, r6
        mov     r1, r3, asr #1
        str     r1, [sp, #0xC]
        bl      __intel_idiv
        ldr     r3, [sp, #0xC]
        add     r3, r3, r0
        mov     r0, r6
        mov     r1, r3, asr #1
        str     r1, [sp, #0xC]
        bl      __intel_idiv
        ldr     r3, [sp, #0xC]
        add     r0, r3, r0
        mov     r3, r0, asr #1
        mul     r12, r3, r3
        cmp     r6, r12
        mulge   r12, r3, r3
        bge     LBIL20
LBIL17:
        sub     r3, r3, #1
        mul     r12, r3, r3
        cmp     r6, r12
        blt     LBIL17
        b       LBIL20
LBIL18:
        mov     r12, r6, asr #8
        ldrsb   r12, [r3, +r12]
        mov     r3, r12, lsl #4
        add     r1, r3, #9
        str     r1, [sp, #0xC]
        bl      __intel_idiv
        ldr     r3, [sp, #0xC]
        add     r0, r3, r0
        mov     r3, r0, asr #1
        mul     r12, r3, r3
        cmp     r6, r12
        mulge   r12, r3, r3
        bge     LBIL20
LBIL19:
        sub     r3, r3, #1
        mul     r12, r3, r3
        cmp     r6, r12
        blt     LBIL19
LBIL20:
        sub     r6, r6, r12
        mov     r12, r3, lsl #1
        add     r12, r12, #1
        cmp     r12, r6, lsl #1
        addle   r3, r3, #1
LBIL21:
        cmp     r3, r8
        mov     r12, r8
        movcc   r12, r3
        strh    r12, [r4]
LBIL22:
        subs    r5, r5, #1
        add     r4, r4, #2
        bne     LBIL14
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LBIL23:
        cmp     r5, #0
        ble     LBIL34
        ldr     r11, [pc, #0x1E4]
        ldr     r9, [pc, #0x1E4]
        sub     r3, r10, #0xFF, 16
        sub     r8, r3, #2, 18
        str     r12, [sp]
LBIL24:
        ldrsh   r3, [r7]
        cmn     r3, #2, 18
        ldrnesh r12, [r7, #2]
        beq     LBIL35
LBIL25:
        mul     r12, r12, r12
        mla     r6, r3, r3, r12
        cmp     r6, #1, 24
        ldrlesb r3, [r6, +r11]
        ble     LBIL32
        cmp     r10, r6
        bge     LBIL27
        mov     r3, r6, asr #24
        ldrsb   r3, [r9, +r3]
        mov     r0, r6
        mov     r1, r3, lsl #12
        str     r1, [sp, #0xC]
        bl      __intel_idiv
        ldr     r3, [sp, #0xC]
        add     r3, r3, r0
        mov     r0, r6
        mov     r1, r3, asr #1
        str     r1, [sp, #0xC]
        bl      __intel_idiv
        ldr     r3, [sp, #0xC]
        add     r3, r3, r0
        mov     r0, r6
        mov     r1, r3, asr #1
        str     r1, [sp, #0xC]
        bl      __intel_idiv
        ldr     r3, [sp, #0xC]
        add     r0, r3, r0
        mov     r3, r0, asr #1
        mul     r12, r3, r3
        cmp     r6, r12
        mulge   r12, r3, r3
        bge     LBIL31
LBIL26:
        sub     r3, r3, #1
        mul     r12, r3, r3
        cmp     r6, r12
        blt     LBIL26
        b       LBIL31
LBIL27:
        ldr     r3, [sp]
        mov     r0, r6
        cmp     r3, r6
        bge     LBIL29
        mov     r3, r6, asr #16
        ldrsb   r3, [r9, +r3]
        mov     r1, r3, lsl #8
        str     r1, [sp, #0xC]
        bl      __intel_idiv
        ldr     r3, [sp, #0xC]
        add     r3, r3, r0
        mov     r0, r6
        mov     r1, r3, asr #1
        str     r1, [sp, #0xC]
        bl      __intel_idiv
        ldr     r3, [sp, #0xC]
        add     r3, r3, r0
        mov     r0, r6
        mov     r1, r3, asr #1
        str     r1, [sp, #0xC]
        bl      __intel_idiv
        ldr     r3, [sp, #0xC]
        add     r0, r3, r0
        mov     r3, r0, asr #1
        mul     r12, r3, r3
        cmp     r6, r12
        mulge   r12, r3, r3
        bge     LBIL31
LBIL28:
        sub     r3, r3, #1
        mul     r12, r3, r3
        cmp     r6, r12
        blt     LBIL28
        b       LBIL31
LBIL29:
        mov     r3, r6, asr #8
        ldrsb   r3, [r9, +r3]
        mov     r3, r3, lsl #4
        add     r1, r3, #9
        str     r1, [sp, #0xC]
        bl      __intel_idiv
        ldr     r3, [sp, #0xC]
        add     r0, r3, r0
        mov     r3, r0, asr #1
        mul     r12, r3, r3
        cmp     r6, r12
        mulge   r12, r3, r3
        bge     LBIL31
LBIL30:
        sub     r3, r3, #1
        mul     r12, r3, r3
        cmp     r6, r12
        blt     LBIL30
LBIL31:
        sub     r6, r6, r12
        mov     r12, r3, lsl #1
        add     r12, r12, #1
        cmp     r12, r6, lsl #1
        addle   r3, r3, #1
LBIL32:
        cmp     r3, r8
        mov     r12, r8
        movcc   r12, r3
        strh    r12, [r4]
LBIL33:
        subs    r5, r5, #1
        add     r7, r7, #4
        add     r4, r4, #2
        bne     LBIL24
LBIL34:
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LBIL35:
        ldrsh   r12, [r7, #2]
        cmn     r12, #2, 18
        streqh  r8, [r4]
        beq     LBIL33
        b       LBIL25
LBIL36:
        mvn     r0, #5
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LBIL37:
        mvn     r0, #7
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
        .long   LBIL_sqrtblr
        .long   LBIL_sqrtbl


        .data
        .align  4


LBIL_sqrtbl:
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
LBIL_sqrtblr:
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


