        .text
        .align  4
        .globl  _ippiDecodeCAVLCChroma422DcCoeffs_H264_1u16s


_ippiDecodeCAVLCChroma422DcCoeffs_H264_1u16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x50
        ldr     r12, [sp, #0x74]
        ldr     r9, [sp, #0x78]
        ldr     r11, [sp, #0x7C]
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        mov     r7, r3
        beq     LLBI32
        cmp     r4, #0
        beq     LLBI32
        cmp     r7, #0
        beq     LLBI32
        cmp     r2, #0
        beq     LLBI32
        cmp     r12, #0
        beq     LLBI32
        cmp     r9, #0
        beq     LLBI32
        cmp     r11, #0
        beq     LLBI32
        ldr     r10, [r5]
        cmp     r10, #0
        beq     LLBI32
        ldr     lr, [r7]
        cmp     lr, #0
        beq     LLBI32
        ldr     r8, [r4]
        ldr     r0, [r12]
        subs    r6, r8, r0
        bmi     LLBI29
        str     r6, [r4]
        ldr     lr, [r5]
        add     r1, r6, #1
        ldr     lr, [lr]
        mov     r1, lr, lsr r1
LLBI0:
        mov     lr, #1
        mov     r0, lr, lsl r0
        sub     r0, r0, #1
        and     r1, r1, r0
        add     r0, r12, #4
        ldr     r1, [r0, +r1, lsl #2]
        and     r3, r1, #0xFF
        tst     r3, #0x80
        beq     LLBI3
        str     r11, [sp, #0xC]
        str     r9, [sp, #0x14]
        str     r7, [sp, #8]
        str     r2, [sp, #0x18]
LLBI1:
        mov     r2, r1, asr #8
        ldr     r11, [r12, +r2, lsl #2]
        subs    r6, r6, r11
        bmi     LLBI28
        str     r6, [r4]
        ldr     r7, [r5]
        add     r3, r6, #1
        ldr     r7, [r7]
        mov     r3, r7, lsr r3
LLBI2:
        mov     r11, lr, lsl r11
        sub     r11, r11, #1
        and     r3, r11, r3
        add     r3, r2, r3
        ldr     r1, [r0, +r3, lsl #2]
        and     r3, r1, #0xFF
        tst     r3, #0x80
        bne     LLBI1
        ldr     r11, [sp, #0xC]
        ldr     r9, [sp, #0x14]
        ldr     r7, [sp, #8]
        ldr     r2, [sp, #0x18]
LLBI3:
        add     r3, r6, r3
        cmp     r3, #0x1F
        strle   r3, [r4]
        ble     LLBI4
        sub     r12, r3, #0x20
        str     r12, [r4]
        ldr     r12, [r5]
        sub     r12, r12, #4
        str     r12, [r5]
LLBI4:
        mov     r12, #0xF1
        orr     lr, r12, #0xF, 20
        mov     r12, r1, asr #8
        cmp     lr, r12
        beq     LLBI31
        mov     r1, r1, asr #16
        and     r6, r1, #0xFF
        ands    r3, r12, #0xFF
        strh    r6, [r2]
        mov     lr, #0
        moveq   r12, lr
        beq     LLBI7
        ldr     r12, [r4]
        subs    r12, r12, r3
        bmi     LLBI23
        str     r12, [r4]
        ldr     r8, [r5]
        add     r12, r12, #1
        ldr     r8, [r8]
        mov     r10, r8, lsr r12
LLBI5:
        mov     r12, #1
        mov     r8, r12, lsl r3
        sub     r8, r8, #1
        and     r8, r10, r8
        sub     r10, r3, #1
        movs    r10, r12, lsl r10
        moveq   r12, lr
        beq     LLBI7
        mov     r12, lr
LLBI6:
        tst     r8, r10
        mvnne   r0, #0
        moveq   r0, #1
        add     r1, sp, #0x30
        strh    r0, [r1, +lr]
        movs    r10, r10, lsr #1
        add     lr, lr, #2
        add     r12, r12, #1
        bne     LLBI6
LLBI7:
        mov     r8, r6
        cmp     r8, #0
        beq     LLBI22
        ldr     lr, [r7]
        mov     r10, #0
        cmp     r8, r3
        strh    r10, [lr]
        ldr     lr, [r7]
        strh    r10, [lr, #2]
        ldr     lr, [r7]
        strh    r10, [lr, #4]
        ldr     lr, [r7]
        strh    r10, [lr, #6]
        ldr     lr, [r7]
        strh    r10, [lr, #8]
        ldr     lr, [r7]
        strh    r10, [lr, #0xA]
        ldr     lr, [r7]
        strh    r10, [lr, #0xC]
        ldr     lr, [r7]
        strh    r10, [lr, #0xE]
        ble     LLBI8
        add     lr, sp, #0x30
        add     r12, lr, r12, lsl #1
        str     r12, [sp]
        mov     r2, r6
        mov     r1, r4
        mov     r0, r5
        bl      LLBI__GetBlockCoeffs_CAVLC
LLBI8:
        cmp     r8, #8
        movge   lr, r10
        bge     LLBI13
        ldr     r9, [r9, +r8, lsl #2]
        ldr     r12, [r4]
        ldr     lr, [r9]
        subs    r12, r12, lr
        bmi     LLBI25
        str     r12, [r4]
        ldr     r0, [r5]
        add     r12, r12, #1
        ldr     r0, [r0]
        mov     r12, r0, lsr r12
LLBI9:
        mov     r0, #1
        mov     lr, r0, lsl lr
        sub     lr, lr, #1
        and     lr, lr, r12
        add     r12, r9, #4
        ldr     lr, [r12, +lr, lsl #2]
        and     r0, lr, #0xFF
        tst     r0, #0x80
        mov     lr, lr, asr #8
        beq     LLBI12
        str     r6, [sp, #0x10]
        str     r11, [sp, #0xC]
        str     r7, [sp, #8]
        mov     r2, #1
LLBI10:
        ldr     r3, [r4]
        ldr     r6, [r9, +lr, lsl #2]
        subs    r3, r3, r6
        bmi     LLBI24
        str     r3, [r4]
        ldr     r7, [r5]
        add     r3, r3, #1
        ldr     r7, [r7]
        mov     r3, r7, lsr r3
LLBI11:
        mov     r6, r2, lsl r6
        sub     r6, r6, #1
        and     r3, r6, r3
        add     r3, lr, r3
        ldr     r3, [r12, +r3, lsl #2]
        and     r0, r3, #0xFF
        tst     r0, #0x80
        mov     lr, r3, asr #8
        bne     LLBI10
        ldr     r6, [sp, #0x10]
        ldr     r11, [sp, #0xC]
        ldr     r7, [sp, #8]
LLBI12:
        mov     r12, #0xF1
        orr     r12, r12, #0xF, 20
        cmp     r12, lr
        beq     LLBI30
        ldr     r12, [r4]
        add     r12, r0, r12
        cmp     r12, #0x1F
        strle   r12, [r4]
        ble     LLBI13
        sub     r12, r12, #0x20
        str     r12, [r4]
        ldr     r12, [r5]
        sub     r12, r12, #4
        str     r12, [r5]
LLBI13:
        cmp     r8, #0
        beq     LLBI21
        ldr     r9, [pc, #0x5F8]
        mov     r12, #0xF1
        orr     r12, r12, #0xF, 20
LLBI14:
        cmp     r8, #1
        ble     LLBI19
        cmp     lr, #0
        ble     LLBI19
        ldr     r0, [r11, +lr, lsl #2]
        ldr     r2, [r4]
        ldr     r1, [r0]
        subs    r2, r2, r1
        bmi     LLBI27
        str     r2, [r4]
        ldr     r3, [r5]
        add     r2, r2, #1
        ldr     r3, [r3]
        mov     r2, r3, lsr r2
LLBI15:
        mov     r3, #1
        mov     r1, r3, lsl r1
        sub     r1, r1, #1
        and     r2, r1, r2
        add     r3, r0, #4
        ldr     r1, [r3, +r2, lsl #2]
        and     r2, r1, #0xFF
        tst     r2, #0x80
        mov     r1, r1, asr #8
        beq     LLBI18
        str     lr, [sp, #0x14]
        str     r10, [sp, #0x1C]
        str     r8, [sp, #0x18]
        str     r6, [sp, #0x10]
        str     r11, [sp, #0xC]
        str     r7, [sp, #8]
        mov     lr, #1
LLBI16:
        ldr     r2, [r4]
        ldr     r6, [r0, +r1, lsl #2]
        subs    r2, r2, r6
        bmi     LLBI26
        str     r2, [r4]
        ldr     r7, [r5]
        add     r2, r2, #1
        ldr     r7, [r7]
        mov     r2, r7, lsr r2
LLBI17:
        mov     r6, lr, lsl r6
        sub     r6, r6, #1
        and     r2, r6, r2
        add     r2, r1, r2
        ldr     r6, [r3, +r2, lsl #2]
        and     r2, r6, #0xFF
        tst     r2, #0x80
        mov     r1, r6, asr #8
        bne     LLBI16
        ldr     lr, [sp, #0x14]
        ldr     r10, [sp, #0x1C]
        ldr     r8, [sp, #0x18]
        ldr     r6, [sp, #0x10]
        ldr     r11, [sp, #0xC]
        ldr     r7, [sp, #8]
LLBI18:
        cmp     r12, r1
        beq     LLBI33
        ldr     r0, [r4]
        add     r0, r2, r0
        cmp     r0, #0x1F
        strle   r0, [r4]
        ble     LLBI20
        sub     r0, r0, #0x20
        str     r0, [r4]
        ldr     r0, [r5]
        sub     r0, r0, #4
        str     r0, [r5]
        b       LLBI20
LLBI19:
        mov     r1, lr
LLBI20:
        add     r8, lr, r8
        sub     r6, r6, #1
        mov     r8, r8, lsl #2
        sub     r8, r8, #4
        ldr     r8, [r9, +r8]
        add     r0, sp, #0x30
        ldrsh   r0, [r0, +r10]
        sub     lr, lr, r1
        ldr     r1, [r7]
        mov     r8, r8, lsl #1
        add     r10, r10, #2
        strh    r0, [r1, +r8]
        mov     r8, r6, lsl #16
        movs    r8, r8, asr #16
        bne     LLBI14
LLBI21:
        ldr     r0, [r7]
        add     r0, r0, #0x10
        str     r0, [r7]
LLBI22:
        mov     r0, #0
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LLBI23:
        add     r10, r12, #0x20
        str     r10, [r4]
        ldr     r1, [r5]
        rsb     r8, r10, #0x1F
        ldr     r0, [r1, #4]
        ldr     r12, [r1], #4
        str     r1, [r5]
        mov     r10, r0, lsr r10
        mov     r8, r12, lsl r8
        add     r10, r8, r10, lsr #1
        b       LLBI5
LLBI24:
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
        b       LLBI11
LLBI25:
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
        b       LLBI9
LLBI26:
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
        b       LLBI17
LLBI27:
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
        b       LLBI15
LLBI28:
        add     r3, r6, #0x20
        str     r3, [r4]
        ldr     r6, [r5]
        rsb     r7, r3, #0x1F
        ldr     r1, [r6, #4]
        ldr     r9, [r6], #4
        str     r6, [r5]
        ldr     r6, [r4]
        mov     r3, r1, lsr r3
        mov     r7, r9, lsl r7
        add     r3, r7, r3, lsr #1
        b       LLBI2
LLBI29:
        add     lr, r6, #0x20
        str     lr, [r4]
        ldr     r6, [r5]
        rsb     r1, lr, #0x1F
        str     r1, [sp, #0x2C]
        ldr     r3, [r6]
        ldr     r1, [r6, #4]!
        str     r3, [sp, #0x28]
        str     r6, [r5]
        ldr     r6, [r4]
        mov     lr, r1, lsr lr
        ldr     r1, [sp, #0x2C]
        ldr     r3, [sp, #0x28]
        mov     r1, r3, lsl r1
        add     r1, r1, lr, lsr #1
        b       LLBI0
LLBI30:
        mvn     r0, #0x49
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LLBI31:
        str     r10, [r5]
        mvn     r0, #0x49
        str     r8, [r4]
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LLBI32:
        mvn     r0, #7
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LLBI33:
        mvn     r0, #0x49
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LLBI__GetBlockCoeffs_CAVLC:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        ldr     r12, [sp, #0x40]
        cmp     r2, #0xA
        mov     lr, #0
        movle   r8, lr
        ble     LLBI34
        cmp     r3, #3
        movge   r8, lr
        movlt   r8, #1
LLBI34:
        cmp     r3, #3
        movge   r5, lr
        movlt   r5, #1
        sub     r3, r2, r3
        cmp     r3, #0
        ble     LLBI48
        ldr     r6, [pc, #0x29C]
        ldr     r7, [pc, #0x29C]
        mov     r4, lr
        str     r4, [sp]
        add     r11, r6, #0x77, 30
        add     r9, r6, #0x1C
        ldr     r6, [sp]
        mov     r2, r8
        mov     r10, #0xF
        str     r9, [sp, #0xC]
        str     r11, [sp, #4]
LLBI35:
        cmp     r2, #6
        bge     LLBI36
        ldrb    r9, [r2, +r7]
        cmp     r4, r9
        bls     LLBI36
        add     r8, r8, #1
        bic     r2, r8, #0xFF, 8
        bic     r2, r2, #0xFF, 16
LLBI36:
        str     r8, [sp, #8]
LLBI37:
        mvn     r4, #0
LLBI38:
        ldr     r7, [r1]
        subs    r7, r7, #1
        bmi     LLBI50
        str     r7, [r1]
        ldr     r8, [r0]
        add     r7, r7, #1
        ldr     r8, [r8]
        mov     r7, r8, lsr r7
LLBI39:
        tst     r7, #1
        add     r4, r4, #1
        beq     LLBI38
        cmp     r4, #0xF
        bgt     LLBI42
        ldr     r7, [sp, #0xC]
        add     r7, r7, r2, lsl #6
        ldr     r8, [r7, +r4, lsl #2]
        ldr     r7, [sp, #4]
        bic     r8, r8, #0xFF, 8
        bics    r8, r8, #0xFF, 16
        add     r7, r7, r2, lsl #6
        ldr     r7, [r7, +r4, lsl #2]
        bic     r7, r7, #0xFF, 8
        bic     r7, r7, #0xFF, 16
        beq     LLBI41
        ldr     r4, [r1]
        subs    r4, r4, r8
        bmi     LLBI45
        str     r4, [r1]
        ldr     r9, [r0]
        add     r4, r4, #1
        ldr     r9, [r9]
        mov     r4, r9, lsr r4
LLBI40:
        mov     r9, #1
        mov     r8, r9, lsl r8
        sub     r8, r8, #1
        and     r4, r4, r8
LLBI41:
        tst     r4, #1
        add     r7, r5, r7
        add     r4, r7, r4, asr #1
        moveq   r5, r4
        rsbne   r5, r4, #0
        b       LLBI44
LLBI42:
        ldr     r8, [r1]
        sub     r7, r4, #3
        subs    r8, r8, r7
        bmi     LLBI49
        str     r8, [r1]
        ldr     r9, [r0]
        add     r8, r8, #1
        ldr     r9, [r9]
        mov     r9, r9, lsr r8
LLBI43:
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
LLBI44:
        mov     lr, lr, lsl #1
        add     r6, r6, #1
        strh    r5, [r12, +lr]
        mov     r7, r6, lsl #16
        mov     lr, r7, asr #16
        cmp     lr, r3
        bge     LLBI48
        cmp     lr, #1
        beq     LLBI46
        ldr     r7, [pc, #0xF4]
        ldr     r8, [sp, #8]
        mov     r5, #0
        b       LLBI35
LLBI45:
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
        b       LLBI40
LLBI46:
        cmp     r4, #3
        bls     LLBI47
        mov     r2, #2
        str     r2, [sp, #8]
        mov     r5, #0
        b       LLBI37
LLBI47:
        ldr     r7, [pc, #0x88]
        ldr     r8, [sp, #8]
        mov     r5, #0
        b       LLBI35
LLBI48:
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LLBI49:
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
        b       LLBI43
LLBI50:
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
        b       LLBI39
        .long   LLBI_ChromaDC422RasterScan
        .long   LLBI_sadd
        .long   LLBI_vlc_inc


        .data
        .align  4


LLBI_ChromaDC422RasterScan:
        .byte   0x00,0x00,0x00,0x00,0x02,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x04,0x00,0x00,0x00
        .byte   0x06,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x05,0x00,0x00,0x00,0x07,0x00,0x00,0x00
LLBI_vlc_inc:
        .byte   0x00,0x03,0x06,0x0C,0x18,0x30


        .data
        .align  4


LLBI_sadd:
        .byte   0x0F,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LLBI_bitsToGetTbl16s:
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
LLBI_addOffsetTbl16s:
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


