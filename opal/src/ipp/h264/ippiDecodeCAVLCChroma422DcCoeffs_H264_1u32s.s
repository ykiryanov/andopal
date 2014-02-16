        .text
        .align  4
        .globl  ippiDecodeCAVLCChroma422DcCoeffs_H264_1u32s


ippiDecodeCAVLCChroma422DcCoeffs_H264_1u32s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x70
        ldr     r12, [sp, #0x94]
        ldr     r9, [sp, #0x98]
        ldr     r11, [sp, #0x9C]
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        mov     r7, r3
        beq     LLBE32
        cmp     r4, #0
        beq     LLBE32
        cmp     r7, #0
        beq     LLBE32
        cmp     r2, #0
        beq     LLBE32
        cmp     r12, #0
        beq     LLBE32
        cmp     r9, #0
        beq     LLBE32
        cmp     r11, #0
        beq     LLBE32
        ldr     r8, [r5]
        cmp     r8, #0
        beq     LLBE32
        ldr     lr, [r7]
        cmp     lr, #0
        beq     LLBE32
        ldr     r6, [r4]
        ldr     r10, [r12]
        subs    lr, r6, r10
        bmi     LLBE29
        str     lr, [r4]
        ldr     r0, [r5]
        add     r1, lr, #1
        ldr     r0, [r0]
        mov     r1, r0, lsr r1
LLBE0:
        mov     r0, #1
        mov     r10, r0, lsl r10
        sub     r10, r10, #1
        and     r1, r1, r10
        add     r10, r12, #4
        ldr     r1, [r10, +r1, lsl #2]
        and     r3, r1, #0xFF
        tst     r3, #0x80
        beq     LLBE3
        str     r11, [sp, #0xC]
        str     r9, [sp, #0x14]
        str     r7, [sp, #8]
        str     r2, [sp, #0x18]
LLBE1:
        mov     r2, r1, asr #8
        ldr     r11, [r12, +r2, lsl #2]
        subs    lr, lr, r11
        bmi     LLBE28
        str     lr, [r4]
        ldr     r7, [r5]
        add     r3, lr, #1
        ldr     r7, [r7]
        mov     r3, r7, lsr r3
LLBE2:
        mov     r11, r0, lsl r11
        sub     r11, r11, #1
        and     r3, r11, r3
        add     r3, r2, r3
        ldr     r1, [r10, +r3, lsl #2]
        and     r3, r1, #0xFF
        tst     r3, #0x80
        bne     LLBE1
        ldr     r11, [sp, #0xC]
        ldr     r9, [sp, #0x14]
        ldr     r7, [sp, #8]
        ldr     r2, [sp, #0x18]
LLBE3:
        add     r3, lr, r3
        cmp     r3, #0x1F
        strle   r3, [r4]
        ble     LLBE4
        sub     r12, r3, #0x20
        str     r12, [r4]
        ldr     r12, [r5]
        sub     r12, r12, #4
        str     r12, [r5]
LLBE4:
        mov     r12, #0xF1
        orr     lr, r12, #0xF, 20
        mov     r12, r1, asr #8
        cmp     lr, r12
        beq     LLBE31
        mov     r1, r1, asr #16
        ands    r3, r12, #0xFF
        and     r6, r1, #0xFF
        strh    r6, [r2]
        mov     r12, #0
        beq     LLBE7
        ldr     lr, [r4]
        subs    lr, lr, r3
        bmi     LLBE23
        str     lr, [r4]
        ldr     r8, [r5]
        add     lr, lr, #1
        ldr     r8, [r8]
        mov     r10, r8, lsr lr
LLBE5:
        mov     r8, #1
        mov     lr, r8, lsl r3
        sub     lr, lr, #1
        and     lr, r10, lr
        sub     r10, r3, #1
        movs    r8, r8, lsl r10
        beq     LLBE7
LLBE6:
        tst     lr, r8
        mvnne   r10, #0
        moveq   r10, #1
        add     r0, sp, #0x30
        str     r10, [r0, +r12, lsl #2]
        movs    r8, r8, lsr #1
        add     r12, r12, #1
        bne     LLBE6
LLBE7:
        mov     r8, r6
        cmp     r8, #0
        beq     LLBE22
        ldr     lr, [r7]
        mov     r10, #0
        cmp     r8, r3
        str     r10, [lr]
        ldr     lr, [r7]
        str     r10, [lr, #4]
        ldr     lr, [r7]
        str     r10, [lr, #8]
        ldr     lr, [r7]
        str     r10, [lr, #0xC]
        ldr     lr, [r7]
        str     r10, [lr, #0x10]
        ldr     lr, [r7]
        str     r10, [lr, #0x14]
        ldr     lr, [r7]
        str     r10, [lr, #0x18]
        ldr     lr, [r7]
        str     r10, [lr, #0x1C]
        ble     LLBE8
        add     lr, sp, #0x30
        add     r12, lr, r12, lsl #2
        str     r12, [sp]
        mov     r2, r6
        mov     r1, r4
        mov     r0, r5
        bl      LLBE__GetBlockCoeffs_CAVLC
LLBE8:
        cmp     r8, #8
        movge   lr, r10
        bge     LLBE13
        ldr     r9, [r9, +r8, lsl #2]
        ldr     r12, [r4]
        ldr     lr, [r9]
        subs    r12, r12, lr
        bmi     LLBE25
        str     r12, [r4]
        ldr     r0, [r5]
        add     r12, r12, #1
        ldr     r0, [r0]
        mov     r12, r0, lsr r12
LLBE9:
        mov     r0, #1
        mov     lr, r0, lsl lr
        sub     lr, lr, #1
        and     lr, lr, r12
        add     r12, r9, #4
        ldr     lr, [r12, +lr, lsl #2]
        and     r0, lr, #0xFF
        tst     r0, #0x80
        mov     lr, lr, asr #8
        beq     LLBE12
        str     r6, [sp, #0x10]
        str     r11, [sp, #0xC]
        str     r7, [sp, #8]
        mov     r2, #1
LLBE10:
        ldr     r3, [r4]
        ldr     r6, [r9, +lr, lsl #2]
        subs    r3, r3, r6
        bmi     LLBE24
        str     r3, [r4]
        ldr     r7, [r5]
        add     r3, r3, #1
        ldr     r7, [r7]
        mov     r3, r7, lsr r3
LLBE11:
        mov     r6, r2, lsl r6
        sub     r6, r6, #1
        and     r3, r6, r3
        add     r3, lr, r3
        ldr     r3, [r12, +r3, lsl #2]
        and     r0, r3, #0xFF
        tst     r0, #0x80
        mov     lr, r3, asr #8
        bne     LLBE10
        ldr     r6, [sp, #0x10]
        ldr     r11, [sp, #0xC]
        ldr     r7, [sp, #8]
LLBE12:
        mov     r12, #0xF1
        orr     r12, r12, #0xF, 20
        cmp     r12, lr
        beq     LLBE30
        ldr     r12, [r4]
        add     r12, r0, r12
        cmp     r12, #0x1F
        strle   r12, [r4]
        ble     LLBE13
        sub     r12, r12, #0x20
        str     r12, [r4]
        ldr     r12, [r5]
        sub     r12, r12, #4
        str     r12, [r5]
LLBE13:
        cmp     r8, #0
        beq     LLBE21
        ldr     r9, [pc, #0x600]
        mov     r12, #0xF1
        orr     r12, r12, #0xF, 20
LLBE14:
        cmp     r8, #1
        ble     LLBE19
        cmp     lr, #0
        ble     LLBE19
        ldr     r0, [r11, +lr, lsl #2]
        ldr     r2, [r4]
        ldr     r1, [r0]
        subs    r2, r2, r1
        bmi     LLBE27
        str     r2, [r4]
        ldr     r3, [r5]
        add     r2, r2, #1
        ldr     r3, [r3]
        mov     r2, r3, lsr r2
LLBE15:
        mov     r3, #1
        mov     r1, r3, lsl r1
        sub     r1, r1, #1
        and     r2, r1, r2
        add     r3, r0, #4
        ldr     r1, [r3, +r2, lsl #2]
        and     r2, r1, #0xFF
        tst     r2, #0x80
        mov     r1, r1, asr #8
        beq     LLBE18
        str     lr, [sp, #0x14]
        str     r10, [sp, #0x1C]
        str     r8, [sp, #0x18]
        str     r6, [sp, #0x10]
        str     r11, [sp, #0xC]
        str     r7, [sp, #8]
        mov     lr, #1
LLBE16:
        ldr     r2, [r4]
        ldr     r6, [r0, +r1, lsl #2]
        subs    r2, r2, r6
        bmi     LLBE26
        str     r2, [r4]
        ldr     r7, [r5]
        add     r2, r2, #1
        ldr     r7, [r7]
        mov     r2, r7, lsr r2
LLBE17:
        mov     r6, lr, lsl r6
        sub     r6, r6, #1
        and     r2, r6, r2
        add     r2, r1, r2
        ldr     r6, [r3, +r2, lsl #2]
        and     r2, r6, #0xFF
        tst     r2, #0x80
        mov     r1, r6, asr #8
        bne     LLBE16
        ldr     lr, [sp, #0x14]
        ldr     r10, [sp, #0x1C]
        ldr     r8, [sp, #0x18]
        ldr     r6, [sp, #0x10]
        ldr     r11, [sp, #0xC]
        ldr     r7, [sp, #8]
LLBE18:
        cmp     r12, r1
        beq     LLBE33
        ldr     r0, [r4]
        add     r0, r2, r0
        cmp     r0, #0x1F
        strle   r0, [r4]
        ble     LLBE20
        sub     r0, r0, #0x20
        str     r0, [r4]
        ldr     r0, [r5]
        sub     r0, r0, #4
        str     r0, [r5]
        b       LLBE20
LLBE19:
        mov     r1, lr
LLBE20:
        ldr     r3, [r7]
        add     r0, sp, #0x30
        ldr     r2, [r0, +r10, lsl #2]
        add     r8, lr, r8
        sub     r6, r6, #1
        mov     r8, r8, lsl #2
        sub     r8, r8, #4
        ldr     r0, [r9, +r8]
        mov     r8, r6, lsl #16
        sub     lr, lr, r1
        str     r2, [r3, +r0, lsl #2]
        movs    r8, r8, asr #16
        add     r10, r10, #1
        bne     LLBE14
LLBE21:
        ldr     r0, [r7]
        add     r0, r0, #0x20
        str     r0, [r7]
LLBE22:
        mov     r0, #0
        add     sp, sp, #0x70
        ldmia   sp!, {r4 - r11, pc}
LLBE23:
        add     r10, lr, #0x20
        str     r10, [r4]
        ldr     r1, [r5]
        rsb     r8, r10, #0x1F
        ldr     r0, [r1, #4]
        ldr     lr, [r1], #4
        str     r1, [r5]
        mov     r10, r0, lsr r10
        mov     r8, lr, lsl r8
        add     r10, r8, r10, lsr #1
        b       LLBE5
LLBE24:
        add     r3, r3, #0x20
        str     r3, [r4]
        ldr     r1, [r5]
        rsb     r7, r3, #0x1F
        ldr     r11, [r1, #4]
        ldr     r0, [r1], #4
        str     r1, [r5]
        mov     r3, r11, lsr r3
        mov     r7, r0, lsl r7
        add     r3, r7, r3, lsr #1
        b       LLBE11
LLBE25:
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
        b       LLBE9
LLBE26:
        add     r2, r2, #0x20
        str     r2, [r4]
        ldr     r11, [r5]
        rsb     r7, r2, #0x1F
        ldr     r8, [r11, #4]
        ldr     r10, [r11], #4
        str     r11, [r5]
        mov     r2, r8, lsr r2
        mov     r7, r10, lsl r7
        add     r2, r7, r2, lsr #1
        b       LLBE17
LLBE27:
        add     r3, r2, #0x20
        str     r3, [sp, #0x20]
        str     r3, [r4]
        ldr     r2, [r5]
        rsb     r3, r3, #0x1F
        str     r3, [sp, #0x24]
        ldr     r3, [r2, #4]
        str     r3, [sp, #0x28]
        ldr     r3, [r2], #4
        str     r3, [sp, #0x2C]
        str     r2, [r5]
        ldr     r3, [sp, #0x20]
        ldr     r2, [sp, #0x28]
        mov     r3, r2, lsr r3
        str     r3, [sp, #0x28]
        ldr     r2, [sp, #0x2C]
        ldr     r3, [sp, #0x24]
        mov     r2, r2, lsl r3
        ldr     r3, [sp, #0x28]
        add     r2, r2, r3, lsr #1
        b       LLBE15
LLBE28:
        add     r3, lr, #0x20
        str     r3, [r4]
        ldr     lr, [r5]
        rsb     r7, r3, #0x1F
        ldr     r1, [lr, #4]
        ldr     r9, [lr], #4
        str     lr, [r5]
        ldr     lr, [r4]
        mov     r3, r1, lsr r3
        mov     r7, r9, lsl r7
        add     r3, r7, r3, lsr #1
        b       LLBE2
LLBE29:
        add     r1, lr, #0x20
        str     r1, [r4]
        ldr     lr, [r5]
        rsb     r0, r1, #0x1F
        ldr     r3, [lr, #4]
        str     r3, [sp, #0x2C]
        ldr     r3, [lr], #4
        str     r3, [sp, #0x28]
        str     lr, [r5]
        ldr     r3, [sp, #0x2C]
        ldr     lr, [r4]
        mov     r1, r3, lsr r1
        ldr     r3, [sp, #0x28]
        mov     r0, r3, lsl r0
        add     r1, r0, r1, lsr #1
        b       LLBE0
LLBE30:
        mvn     r0, #0x49
        add     sp, sp, #0x70
        ldmia   sp!, {r4 - r11, pc}
LLBE31:
        str     r8, [r5]
        mvn     r0, #0x49
        str     r6, [r4]
        add     sp, sp, #0x70
        ldmia   sp!, {r4 - r11, pc}
LLBE32:
        mvn     r0, #7
        add     sp, sp, #0x70
        ldmia   sp!, {r4 - r11, pc}
LLBE33:
        mvn     r0, #0x49
        add     sp, sp, #0x70
        ldmia   sp!, {r4 - r11, pc}
LLBE__GetBlockCoeffs_CAVLC:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        ldr     r12, [sp, #0x40]
        cmp     r2, #0xA
        mov     lr, #0
        movle   r8, lr
        ble     LLBE34
        cmp     r3, #3
        movge   r8, lr
        movlt   r8, #1
LLBE34:
        cmp     r3, #3
        movge   r5, lr
        movlt   r5, #1
        sub     r3, r2, r3
        cmp     r3, #0
        ble     LLBE48
        ldr     r6, [pc, #0x2A8]
        ldr     r7, [pc, #0x2A8]
        mov     r4, lr
        str     r4, [sp]
        add     r11, r6, #0x77, 30
        add     r9, r6, #0x1C
        ldr     r6, [sp]
        mov     r2, r8
        mov     r10, #0xF
        str     r9, [sp, #8]
        str     r11, [sp, #0xC]
LLBE35:
        cmp     r2, #6
        bge     LLBE36
        ldrb    r9, [r2, +r7]
        cmp     r4, r9
        bls     LLBE36
        add     r8, r8, #1
        bic     r2, r8, #0xFF, 8
        bic     r2, r2, #0xFF, 16
LLBE36:
        str     r8, [sp, #4]
LLBE37:
        mvn     r4, #0
LLBE38:
        ldr     r7, [r1]
        subs    r7, r7, #1
        bmi     LLBE50
        str     r7, [r1]
        ldr     r8, [r0]
        add     r7, r7, #1
        ldr     r8, [r8]
        mov     r7, r8, lsr r7
LLBE39:
        tst     r7, #1
        add     r4, r4, #1
        beq     LLBE38
        cmp     r4, #0xF
        bgt     LLBE42
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
        beq     LLBE41
        ldr     r4, [r1]
        subs    r4, r4, r8
        bmi     LLBE45
        str     r4, [r1]
        ldr     r9, [r0]
        add     r4, r4, #1
        ldr     r9, [r9]
        mov     r4, r9, lsr r4
LLBE40:
        mov     r9, #1
        mov     r8, r9, lsl r8
        sub     r8, r8, #1
        and     r4, r4, r8
LLBE41:
        tst     r4, #1
        add     r7, r5, r7
        add     r4, r7, r4, asr #1
        moveq   r5, r4
        rsbne   r5, r4, #0
        mov     r5, r5, lsl #16
        mov     r5, r5, asr #16
        b       LLBE44
LLBE42:
        ldr     r8, [r1]
        sub     r7, r4, #3
        subs    r8, r8, r7
        bmi     LLBE49
        str     r8, [r1]
        ldr     r9, [r0]
        add     r8, r8, #1
        ldr     r9, [r9]
        mov     r9, r9, lsr r8
LLBE43:
        ldr     r8, [pc, #0x180]
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
LLBE44:
        add     r6, r6, #1
        str     r5, [r12, +lr, lsl #2]
        mov     lr, r6, lsl #16
        mov     lr, lr, asr #16
        cmp     lr, r3
        bge     LLBE48
        cmp     lr, #1
        beq     LLBE46
        ldr     r7, [pc, #0xF4]
        ldr     r8, [sp, #4]
        mov     r5, #0
        b       LLBE35
LLBE45:
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
        b       LLBE40
LLBE46:
        cmp     r4, #3
        bls     LLBE47
        mov     r2, #2
        str     r2, [sp, #4]
        mov     r5, #0
        b       LLBE37
LLBE47:
        ldr     r7, [pc, #0x88]
        ldr     r8, [sp, #4]
        mov     r5, #0
        b       LLBE35
LLBE48:
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LLBE49:
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
        b       LLBE43
LLBE50:
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
        b       LLBE39
        .long   LLBE_ChromaDC422RasterScan
        .long   LLBE_sadd
        .long   LLBE_vlc_inc


        .data
        .align  4


LLBE_ChromaDC422RasterScan:
        .byte   0x00,0x00,0x00,0x00,0x02,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x04,0x00,0x00,0x00
        .byte   0x06,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x05,0x00,0x00,0x00,0x07,0x00,0x00,0x00
LLBE_vlc_inc:
        .byte   0x00,0x03,0x06,0x0C,0x18,0x30


        .data
        .align  4


LLBE_sadd:
        .byte   0x0F,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LLBE_bitsToGetTbl16s:
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
LLBE_addOffsetTbl16s:
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


