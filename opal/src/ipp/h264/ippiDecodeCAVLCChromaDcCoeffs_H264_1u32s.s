        .text
        .align  4
        .globl  _ippiDecodeCAVLCChromaDcCoeffs_H264_1u32s


_ippiDecodeCAVLCChromaDcCoeffs_H264_1u32s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x6C
        ldr     r12, [sp, #0x90]
        ldr     r11, [sp, #0x94]
        ldr     r10, [sp, #0x98]
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        mov     r7, r3
        beq     LLBD34
        cmp     r4, #0
        beq     LLBD34
        cmp     r2, #0
        beq     LLBD34
        cmp     r7, #0
        beq     LLBD34
        cmp     r12, #0
        beq     LLBD34
        cmp     r11, #0
        beq     LLBD34
        cmp     r10, #0
        beq     LLBD34
        ldr     lr, [r7]
        cmp     lr, #0
        beq     LLBD34
        ldr     r8, [r5]
        cmp     r8, #0
        beq     LLBD34
        ldr     r6, [r4]
        ldr     r9, [r12]
        subs    lr, r6, r9
        bmi     LLBD29
        str     lr, [r4]
        ldr     r0, [r5]
        add     r1, lr, #1
        ldr     r0, [r0]
        mov     r1, r0, lsr r1
LLBD0:
        mov     r0, #1
        mov     r9, r0, lsl r9
        sub     r9, r9, #1
        and     r1, r1, r9
        add     r9, r12, #4
        ldr     r1, [r9, +r1, lsl #2]
        and     r3, r1, #0xFF
        tst     r3, #0x80
        beq     LLBD3
        str     r10, [sp, #0xC]
        str     r11, [sp, #0x14]
        str     r7, [sp, #8]
        str     r2, [sp, #0x18]
LLBD1:
        mov     r2, r1, asr #8
        ldr     r11, [r12, +r2, lsl #2]
        subs    lr, lr, r11
        bmi     LLBD28
        str     lr, [r4]
        ldr     r7, [r5]
        add     r3, lr, #1
        ldr     r7, [r7]
        mov     r3, r7, lsr r3
LLBD2:
        mov     r11, r0, lsl r11
        sub     r11, r11, #1
        and     r3, r11, r3
        add     r3, r2, r3
        ldr     r1, [r9, +r3, lsl #2]
        and     r3, r1, #0xFF
        tst     r3, #0x80
        bne     LLBD1
        ldr     r10, [sp, #0xC]
        ldr     r11, [sp, #0x14]
        ldr     r7, [sp, #8]
        ldr     r2, [sp, #0x18]
LLBD3:
        add     r3, lr, r3
        cmp     r3, #0x1F
        strle   r3, [r4]
        ble     LLBD4
        sub     r12, r3, #0x20
        str     r12, [r4]
        ldr     r12, [r5]
        sub     r12, r12, #4
        str     r12, [r5]
LLBD4:
        mov     r12, #0xF1
        orr     lr, r12, #0xF, 20
        mov     r12, r1, asr #8
        cmp     lr, r12
        beq     LLBD30
        mov     r1, r1, asr #16
        ands    r3, r12, #0xFF
        and     r6, r1, #0xFF
        strh    r6, [r2]
        mov     r12, #0
        beq     LLBD7
        ldr     lr, [r4]
        subs    lr, lr, r3
        bmi     LLBD23
        str     lr, [r4]
        ldr     r8, [r5]
        add     lr, lr, #1
        ldr     r8, [r8]
        mov     r9, r8, lsr lr
LLBD5:
        mov     r8, #1
        mov     lr, r8, lsl r3
        sub     lr, lr, #1
        and     lr, r9, lr
        sub     r9, r3, #1
        movs    r8, r8, lsl r9
        beq     LLBD7
LLBD6:
        tst     lr, r8
        mvnne   r9, #0
        moveq   r9, #1
        add     r0, sp, #0x2C
        str     r9, [r0, +r12, lsl #2]
        movs    r8, r8, lsr #1
        add     r12, r12, #1
        bne     LLBD6
LLBD7:
        mov     r8, r6
        cmp     r8, #0
        beq     LLBD22
        ldr     lr, [r7]
        mov     r9, #0
        cmp     r8, r3
        str     r9, [lr]
        ldr     lr, [r7]
        str     r9, [lr, #4]
        ldr     lr, [r7]
        str     r9, [lr, #8]
        ldr     lr, [r7]
        str     r9, [lr, #0xC]
        ble     LLBD8
        add     lr, sp, #0x2C
        add     r12, lr, r12, lsl #2
        str     r12, [sp]
        mov     r2, r6
        mov     r1, r4
        mov     r0, r5
        bl      LLBD__GetBlockCoeffs_CAVLC
LLBD8:
        cmp     r8, #4
        movge   r12, r9
        bge     LLBD13
        ldr     r11, [r11, +r8, lsl #2]
        cmp     r11, #0
        beq     LLBD34
        ldr     r12, [r4]
        ldr     lr, [r11]
        subs    r12, r12, lr
        bmi     LLBD25
        str     r12, [r4]
        ldr     r0, [r5]
        add     r12, r12, #1
        ldr     r0, [r0]
        mov     r12, r0, lsr r12
LLBD9:
        mov     r0, #1
        mov     lr, r0, lsl lr
        sub     lr, lr, #1
        and     r12, lr, r12
        add     lr, r11, #4
        ldr     r12, [lr, +r12, lsl #2]
        and     r0, r12, #0xFF
        tst     r0, #0x80
        mov     r12, r12, asr #8
        beq     LLBD12
        str     r6, [sp, #0x10]
        str     r10, [sp, #0xC]
        str     r7, [sp, #8]
        mov     r2, #1
LLBD10:
        ldr     r3, [r4]
        ldr     r6, [r11, +r12, lsl #2]
        subs    r3, r3, r6
        bmi     LLBD24
        str     r3, [r4]
        ldr     r7, [r5]
        add     r3, r3, #1
        ldr     r7, [r7]
        mov     r3, r7, lsr r3
LLBD11:
        mov     r6, r2, lsl r6
        sub     r6, r6, #1
        and     r3, r6, r3
        add     r3, r12, r3
        ldr     r3, [lr, +r3, lsl #2]
        and     r0, r3, #0xFF
        tst     r0, #0x80
        mov     r12, r3, asr #8
        bne     LLBD10
        ldr     r6, [sp, #0x10]
        ldr     r10, [sp, #0xC]
        ldr     r7, [sp, #8]
LLBD12:
        mov     lr, #0xF1
        orr     lr, lr, #0xF, 20
        cmp     lr, r12
        beq     LLBD33
        ldr     lr, [r4]
        add     lr, r0, lr
        cmp     lr, #0x1F
        strle   lr, [r4]
        ble     LLBD13
        sub     lr, lr, #0x20
        str     lr, [r4]
        ldr     lr, [r5]
        sub     lr, lr, #4
        str     lr, [r5]
LLBD13:
        cmp     r8, #0
        beq     LLBD21
        mov     lr, #0xF1
        orr     lr, lr, #0xF, 20
        mov     r0, #1
LLBD14:
        cmp     r8, #1
        ble     LLBD19
        cmp     r12, #0
        ble     LLBD19
        ldr     r11, [r10, +r12, lsl #2]
        cmp     r11, #0
        beq     LLBD32
        ldr     r2, [r4]
        ldr     r1, [r11]
        subs    r2, r2, r1
        bmi     LLBD27
        str     r2, [r4]
        ldr     r3, [r5]
        add     r2, r2, #1
        ldr     r3, [r3]
        mov     r2, r3, lsr r2
LLBD15:
        mov     r1, r0, lsl r1
        sub     r1, r1, #1
        and     r1, r1, r2
        add     r2, r11, #4
        ldr     r1, [r2, +r1, lsl #2]
        and     r3, r1, #0xFF
        tst     r3, #0x80
        mov     r1, r1, asr #8
        beq     LLBD18
        str     r9, [sp, #0x1C]
        str     r8, [sp, #0x18]
        str     r6, [sp, #0x10]
        str     r10, [sp, #0xC]
        str     r7, [sp, #8]
LLBD16:
        ldr     r3, [r4]
        ldr     r6, [r11, +r1, lsl #2]
        subs    r3, r3, r6
        bmi     LLBD26
        str     r3, [r4]
        ldr     r7, [r5]
        add     r3, r3, #1
        ldr     r7, [r7]
        mov     r3, r7, lsr r3
LLBD17:
        mov     r6, r0, lsl r6
        sub     r6, r6, #1
        and     r3, r6, r3
        add     r3, r1, r3
        ldr     r6, [r2, +r3, lsl #2]
        and     r3, r6, #0xFF
        tst     r3, #0x80
        mov     r1, r6, asr #8
        bne     LLBD16
        ldr     r9, [sp, #0x1C]
        ldr     r8, [sp, #0x18]
        ldr     r6, [sp, #0x10]
        ldr     r10, [sp, #0xC]
        ldr     r7, [sp, #8]
LLBD18:
        cmp     lr, r1
        beq     LLBD31
        ldr     r11, [r4]
        add     r11, r3, r11
        cmp     r11, #0x1F
        strle   r11, [r4]
        ble     LLBD20
        sub     r11, r11, #0x20
        str     r11, [r4]
        ldr     r11, [r5]
        sub     r11, r11, #4
        str     r11, [r5]
        b       LLBD20
LLBD19:
        mov     r1, r12
LLBD20:
        ldr     r2, [r7]
        add     r11, sp, #0x2C
        ldr     r11, [r11, +r9, lsl #2]
        add     r3, r12, r8
        sub     r6, r6, #1
        sub     r12, r12, r1
        mov     r3, r3, lsl #2
        mov     r8, r6, lsl #16
        sub     r1, r3, #4
        add     r9, r9, #1
        movs    r8, r8, asr #16
        str     r11, [r2, +r1]
        bne     LLBD14
LLBD21:
        ldr     r0, [r7]
        add     r0, r0, #0x10
        str     r0, [r7]
LLBD22:
        mov     r0, #0
        add     sp, sp, #0x6C
        ldmia   sp!, {r4 - r11, pc}
LLBD23:
        add     r9, lr, #0x20
        str     r9, [r4]
        ldr     r1, [r5]
        rsb     r8, r9, #0x1F
        ldr     r0, [r1, #4]
        ldr     lr, [r1], #4
        str     r1, [r5]
        mov     r9, r0, lsr r9
        mov     r8, lr, lsl r8
        add     r9, r8, r9, lsr #1
        b       LLBD5
LLBD24:
        add     r3, r3, #0x20
        str     r3, [r4]
        ldr     r1, [r5]
        rsb     r7, r3, #0x1F
        ldr     r10, [r1, #4]
        ldr     r0, [r1], #4
        str     r1, [r5]
        mov     r3, r10, lsr r3
        mov     r7, r0, lsl r7
        add     r3, r7, r3, lsr #1
        b       LLBD11
LLBD25:
        add     r12, r12, #0x20
        str     r12, [r4]
        ldr     r3, [r5]
        rsb     r0, r12, #0x1F
        ldr     r1, [r3, #4]
        ldr     r2, [r3], #4
        str     r3, [r5]
        mov     r12, r1, lsr r12
        mov     r0, r2, lsl r0
        add     r12, r0, r12, lsr #1
        b       LLBD9
LLBD26:
        add     r3, r3, #0x20
        str     r3, [r4]
        ldr     r10, [r5]
        rsb     r7, r3, #0x1F
        ldr     r8, [r10, #4]
        ldr     r9, [r10], #4
        str     r10, [r5]
        mov     r3, r8, lsr r3
        mov     r7, r9, lsl r7
        add     r3, r7, r3, lsr #1
        b       LLBD17
LLBD27:
        add     r3, r2, #0x20
        str     r3, [sp, #0x14]
        str     r3, [r4]
        ldr     r2, [r5]
        rsb     r3, r3, #0x1F
        str     r3, [sp, #0x20]
        ldr     r3, [r2, #4]
        str     r3, [sp, #0x24]
        ldr     r3, [r2], #4
        str     r3, [sp, #0x28]
        str     r2, [r5]
        ldr     r3, [sp, #0x14]
        ldr     r2, [sp, #0x24]
        mov     r3, r2, lsr r3
        str     r3, [sp, #0x24]
        ldr     r2, [sp, #0x28]
        ldr     r3, [sp, #0x20]
        mov     r2, r2, lsl r3
        ldr     r3, [sp, #0x24]
        add     r2, r2, r3, lsr #1
        b       LLBD15
LLBD28:
        add     r3, lr, #0x20
        str     r3, [r4]
        ldr     lr, [r5]
        rsb     r7, r3, #0x1F
        ldr     r1, [lr, #4]
        ldr     r10, [lr], #4
        str     lr, [r5]
        ldr     lr, [r4]
        mov     r3, r1, lsr r3
        mov     r7, r10, lsl r7
        add     r3, r7, r3, lsr #1
        b       LLBD2
LLBD29:
        add     r1, lr, #0x20
        str     r1, [r4]
        ldr     lr, [r5]
        rsb     r0, r1, #0x1F
        ldr     r3, [lr, #4]
        str     r3, [sp, #0x28]
        ldr     r3, [lr], #4
        str     r3, [sp, #0x24]
        str     lr, [r5]
        ldr     r3, [sp, #0x28]
        ldr     lr, [r4]
        mov     r1, r3, lsr r1
        ldr     r3, [sp, #0x24]
        mov     r0, r3, lsl r0
        add     r1, r0, r1, lsr #1
        b       LLBD0
LLBD30:
        str     r8, [r5]
        mvn     r0, #0x49
        str     r6, [r4]
        add     sp, sp, #0x6C
        ldmia   sp!, {r4 - r11, pc}
LLBD31:
        mvn     r0, #0x49
        add     sp, sp, #0x6C
        ldmia   sp!, {r4 - r11, pc}
LLBD32:
        mvn     r0, #7
        add     sp, sp, #0x6C
        ldmia   sp!, {r4 - r11, pc}
LLBD33:
        mvn     r0, #0x49
        add     sp, sp, #0x6C
        ldmia   sp!, {r4 - r11, pc}
LLBD34:
        mvn     r0, #7
        add     sp, sp, #0x6C
        ldmia   sp!, {r4 - r11, pc}
LLBD__GetBlockCoeffs_CAVLC:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        ldr     r12, [sp, #0x40]
        cmp     r2, #0xA
        mov     lr, #0
        movle   r8, lr
        ble     LLBD35
        cmp     r3, #3
        movge   r8, lr
        movlt   r8, #1
LLBD35:
        cmp     r3, #3
        movge   r5, lr
        movlt   r5, #1
        sub     r3, r2, r3
        cmp     r3, #0
        ble     LLBD49
        ldr     r6, [pc, #0x2A4]
        ldr     r7, [pc, #0x2A4]
        mov     r4, lr
        str     r4, [sp]
        add     r11, r6, #0x77, 30
        add     r9, r6, #0x1C
        ldr     r6, [sp]
        mov     r2, r8
        mov     r10, #0xF
        str     r9, [sp, #8]
        str     r11, [sp, #0xC]
LLBD36:
        cmp     r2, #6
        bge     LLBD37
        ldrb    r9, [r2, +r7]
        cmp     r4, r9
        bls     LLBD37
        add     r8, r8, #1
        bic     r2, r8, #0xFF, 8
        bic     r2, r2, #0xFF, 16
LLBD37:
        str     r8, [sp, #4]
LLBD38:
        mvn     r4, #0
LLBD39:
        ldr     r7, [r1]
        subs    r7, r7, #1
        bmi     LLBD51
        str     r7, [r1]
        ldr     r8, [r0]
        add     r7, r7, #1
        ldr     r8, [r8]
        mov     r7, r8, lsr r7
LLBD40:
        tst     r7, #1
        add     r4, r4, #1
        beq     LLBD39
        cmp     r4, #0xF
        bgt     LLBD43
        ldr     r7, [sp, #8]
        add     r7, r7, r2, lsl #6
        ldr     r8, [r7, +r4, lsl #2]
        ldr     r7, [sp, #0xC]
        bic     r8, r8, #0xFF, 8
        bics    r8, r8, #0xFF, 16
        add     r7, r7, r2, lsl #6
        ldr     r7, [r7, +r4, lsl #2]
        bic     r7, r7, #0xFF, 8
        bic     r7, r7, #0xFF, 16
        beq     LLBD42
        ldr     r4, [r1]
        subs    r4, r4, r8
        bmi     LLBD46
        str     r4, [r1]
        ldr     r9, [r0]
        add     r4, r4, #1
        ldr     r9, [r9]
        mov     r4, r9, lsr r4
LLBD41:
        mov     r9, #1
        mov     r8, r9, lsl r8
        sub     r8, r8, #1
        and     r4, r4, r8
LLBD42:
        tst     r4, #1
        add     r7, r5, r7
        add     r4, r7, r4, asr #1
        moveq   r5, r4
        rsbne   r5, r4, #0
        mov     r5, r5, lsl #16
        mov     r5, r5, asr #16
        b       LLBD45
LLBD43:
        ldr     r8, [r1]
        sub     r7, r4, #3
        subs    r8, r8, r7
        bmi     LLBD50
        str     r8, [r1]
        ldr     r9, [r0]
        add     r8, r8, #1
        ldr     r9, [r9]
        mov     r9, r9, lsr r8
LLBD44:
        ldr     r8, [pc, #0x17C]
        mov     r10, #1
        mov     r10, r10, lsl r7
        ldr     r8, [r8, +r2, lsl #2]
        cmp     r4, #0xF
        mov     r11, #0xF
        sub     r10, r10, #1
        movgt   r4, r11
        and     r10, r9, r10
        add     r5, r8, r5, lsl #1
        add     r4, r10, r4, lsl r2
        add     r5, r5, r4
        mov     r4, #1
        add     r7, r5, r4, lsl r7
        sub     r4, r7, #1, 20
        bic     r4, r4, #0xFF, 8
        bic     r4, r4, #0xFF, 16
        tst     r4, #1
        addeq   r5, r4, #2
        mvnne   r5, #0
        rsbne   r5, r4, r5
        mov     r4, r5, asr #1
        mov     r4, r4, lsl #16
        mov     r5, r4, asr #16
        eor     r4, r5, r5, asr #31
        sub     r4, r4, r5, asr #31
        bic     r4, r4, #0xFF, 8
        bic     r4, r4, #0xFF, 16
LLBD45:
        add     r6, r6, #1
        str     r5, [r12, +lr, lsl #2]
        mov     lr, r6, lsl #16
        mov     lr, lr, asr #16
        cmp     lr, r3
        bge     LLBD49
        cmp     lr, #1
        beq     LLBD47
        ldr     r7, [pc, #0xF0]
        ldr     r8, [sp, #4]
        mov     r5, #0
        b       LLBD36
LLBD46:
        add     r4, r4, #0x20
        str     r4, [r1]
        ldr     r9, [r0]
        rsb     r10, r4, #0x1F
        str     r10, [sp, #0x10]
        ldr     r10, [r9, #4]
        str     r10, [sp, #0x14]
        ldr     r10, [r9], #4
        str     r10, [sp, #0x18]
        str     r9, [r0]
        ldr     r9, [sp, #0x14]
        ldr     r10, [sp, #0x18]
        mov     r4, r9, lsr r4
        ldr     r9, [sp, #0x10]
        mov     r9, r10, lsl r9
        add     r4, r9, r4, lsr #1
        b       LLBD41
LLBD47:
        cmp     r4, #3
        bls     LLBD48
        mov     r2, #2
        str     r2, [sp, #4]
        mov     r5, #0
        b       LLBD38
LLBD48:
        ldr     r7, [pc, #0x84]
        ldr     r8, [sp, #4]
        mov     r5, #0
        b       LLBD36
LLBD49:
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LLBD50:
        add     r8, r8, #0x20
        str     r8, [r1]
        ldr     r9, [r0]
        rsb     r10, r8, #0x1F
        str     r10, [sp, #0x18]
        ldr     r10, [r9, #4]
        str     r10, [sp, #0x14]
        ldr     r10, [r9], #4
        str     r10, [sp, #0x10]
        str     r9, [r0]
        ldr     r9, [sp, #0x14]
        ldr     r10, [sp, #0x10]
        mov     r8, r9, lsr r8
        ldr     r9, [sp, #0x18]
        mov     r9, r10, lsl r9
        add     r9, r9, r8, lsr #1
        b       LLBD44
LLBD51:
        add     r7, r7, #0x20
        str     r7, [r1]
        ldr     r11, [r0]
        rsb     r8, r7, #0x1F
        ldr     r9, [r11, #4]
        ldr     r10, [r11], #4
        str     r11, [r0]
        mov     r7, r9, lsr r7
        mov     r8, r10, lsl r8
        add     r7, r8, r7, lsr #1
        b       LLBD40
        .long   LLBD_sadd
        .long   LLBD_vlc_inc


        .data
        .align  4


LLBD_vlc_inc:
        .byte   0x00,0x03,0x06,0x0C,0x18,0x30


        .data
        .align  4


LLBD_sadd:
        .byte   0x0F,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LLBD_bitsToGetTbl16s:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x04,0x00,0x00,0x00,0x0C,0x00,0x00,0x00
        .byte   0x01,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x01,0x00,0x00,0x00
        .byte   0x01,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x01,0x00,0x00,0x00
        .byte   0x01,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x01,0x00,0x00,0x00
        .byte   0x01,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x0C,0x00,0x00,0x00
        .byte   0x02,0x00,0x00,0x00,0x02,0x00,0x00,0x00,0x02,0x00,0x00,0x00,0x02,0x00,0x00,0x00
        .byte   0x02,0x00,0x00,0x00,0x02,0x00,0x00,0x00,0x02,0x00,0x00,0x00,0x02,0x00,0x00,0x00
        .byte   0x02,0x00,0x00,0x00,0x02,0x00,0x00,0x00,0x02,0x00,0x00,0x00,0x02,0x00,0x00,0x00
        .byte   0x02,0x00,0x00,0x00,0x02,0x00,0x00,0x00,0x02,0x00,0x00,0x00,0x0C,0x00,0x00,0x00
        .byte   0x03,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x03,0x00,0x00,0x00
        .byte   0x03,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x03,0x00,0x00,0x00
        .byte   0x03,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x03,0x00,0x00,0x00
        .byte   0x03,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x0C,0x00,0x00,0x00
        .byte   0x04,0x00,0x00,0x00,0x04,0x00,0x00,0x00,0x04,0x00,0x00,0x00,0x04,0x00,0x00,0x00
        .byte   0x04,0x00,0x00,0x00,0x04,0x00,0x00,0x00,0x04,0x00,0x00,0x00,0x04,0x00,0x00,0x00
        .byte   0x04,0x00,0x00,0x00,0x04,0x00,0x00,0x00,0x04,0x00,0x00,0x00,0x04,0x00,0x00,0x00
        .byte   0x04,0x00,0x00,0x00,0x04,0x00,0x00,0x00,0x04,0x00,0x00,0x00,0x0C,0x00,0x00,0x00
        .byte   0x05,0x00,0x00,0x00,0x05,0x00,0x00,0x00,0x05,0x00,0x00,0x00,0x05,0x00,0x00,0x00
        .byte   0x05,0x00,0x00,0x00,0x05,0x00,0x00,0x00,0x05,0x00,0x00,0x00,0x05,0x00,0x00,0x00
        .byte   0x05,0x00,0x00,0x00,0x05,0x00,0x00,0x00,0x05,0x00,0x00,0x00,0x05,0x00,0x00,0x00
        .byte   0x05,0x00,0x00,0x00,0x05,0x00,0x00,0x00,0x05,0x00,0x00,0x00,0x0C,0x00,0x00,0x00
        .byte   0x06,0x00,0x00,0x00,0x06,0x00,0x00,0x00,0x06,0x00,0x00,0x00,0x06,0x00,0x00,0x00
        .byte   0x06,0x00,0x00,0x00,0x06,0x00,0x00,0x00,0x06,0x00,0x00,0x00,0x06,0x00,0x00,0x00
        .byte   0x06,0x00,0x00,0x00,0x06,0x00,0x00,0x00,0x06,0x00,0x00,0x00,0x06,0x00,0x00,0x00
        .byte   0x06,0x00,0x00,0x00,0x06,0x00,0x00,0x00,0x06,0x00,0x00,0x00,0x0C,0x00,0x00,0x00
LLBD_addOffsetTbl16s:
        .byte   0x01,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x01,0x00,0x00,0x00
        .byte   0x01,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x01,0x00,0x00,0x00
        .byte   0x01,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x01,0x00,0x00,0x00
        .byte   0x01,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x08,0x00,0x00,0x00,0x10,0x00,0x00,0x00
        .byte   0x01,0x00,0x00,0x00,0x02,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x04,0x00,0x00,0x00
        .byte   0x05,0x00,0x00,0x00,0x06,0x00,0x00,0x00,0x07,0x00,0x00,0x00,0x08,0x00,0x00,0x00
        .byte   0x09,0x00,0x00,0x00,0x0A,0x00,0x00,0x00,0x0B,0x00,0x00,0x00,0x0C,0x00,0x00,0x00
        .byte   0x0D,0x00,0x00,0x00,0x0E,0x00,0x00,0x00,0x0F,0x00,0x00,0x00,0x10,0x00,0x00,0x00
        .byte   0x01,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x05,0x00,0x00,0x00,0x07,0x00,0x00,0x00
        .byte   0x09,0x00,0x00,0x00,0x0B,0x00,0x00,0x00,0x0D,0x00,0x00,0x00,0x0F,0x00,0x00,0x00
        .byte   0x11,0x00,0x00,0x00,0x13,0x00,0x00,0x00,0x15,0x00,0x00,0x00,0x17,0x00,0x00,0x00
        .byte   0x19,0x00,0x00,0x00,0x1B,0x00,0x00,0x00,0x1D,0x00,0x00,0x00,0x1F,0x00,0x00,0x00
        .byte   0x01,0x00,0x00,0x00,0x05,0x00,0x00,0x00,0x09,0x00,0x00,0x00,0x0D,0x00,0x00,0x00
        .byte   0x11,0x00,0x00,0x00,0x15,0x00,0x00,0x00,0x19,0x00,0x00,0x00,0x1D,0x00,0x00,0x00
        .byte   0x21,0x00,0x00,0x00,0x25,0x00,0x00,0x00,0x29,0x00,0x00,0x00,0x2D,0x00,0x00,0x00
        .byte   0x31,0x00,0x00,0x00,0x35,0x00,0x00,0x00,0x39,0x00,0x00,0x00,0x3D,0x00,0x00,0x00
        .byte   0x01,0x00,0x00,0x00,0x09,0x00,0x00,0x00,0x11,0x00,0x00,0x00,0x19,0x00,0x00,0x00
        .byte   0x21,0x00,0x00,0x00,0x29,0x00,0x00,0x00,0x31,0x00,0x00,0x00,0x39,0x00,0x00,0x00
        .byte   0x41,0x00,0x00,0x00,0x49,0x00,0x00,0x00,0x51,0x00,0x00,0x00,0x59,0x00,0x00,0x00
        .byte   0x61,0x00,0x00,0x00,0x69,0x00,0x00,0x00,0x71,0x00,0x00,0x00,0x79,0x00,0x00,0x00
        .byte   0x01,0x00,0x00,0x00,0x11,0x00,0x00,0x00,0x21,0x00,0x00,0x00,0x31,0x00,0x00,0x00
        .byte   0x41,0x00,0x00,0x00,0x51,0x00,0x00,0x00,0x61,0x00,0x00,0x00,0x71,0x00,0x00,0x00
        .byte   0x81,0x00,0x00,0x00,0x91,0x00,0x00,0x00,0xA1,0x00,0x00,0x00,0xB1,0x00,0x00,0x00
        .byte   0xC1,0x00,0x00,0x00,0xD1,0x00,0x00,0x00,0xE1,0x00,0x00,0x00,0xF1,0x00,0x00,0x00
        .byte   0x01,0x00,0x00,0x00,0x21,0x00,0x00,0x00,0x41,0x00,0x00,0x00,0x61,0x00,0x00,0x00
        .byte   0x81,0x00,0x00,0x00,0xA1,0x00,0x00,0x00,0xC1,0x00,0x00,0x00,0xE1,0x00,0x00,0x00
        .byte   0x01,0x01,0x00,0x00,0x21,0x01,0x00,0x00,0x41,0x01,0x00,0x00,0x61,0x01,0x00,0x00
        .byte   0x81,0x01,0x00,0x00,0xA1,0x01,0x00,0x00,0xC1,0x01,0x00,0x00,0xE1,0x01,0x00,0x00


