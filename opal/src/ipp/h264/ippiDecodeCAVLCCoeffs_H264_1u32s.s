        .text
        .align  4
        .globl  ippiDecodeCAVLCCoeffs_H264_1u32s


ippiDecodeCAVLCCoeffs_H264_1u32s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x80
        ldr     r4, [sp, #0xA8]
        ldr     lr, [sp, #0xA4]
        ldr     r12, [sp, #0xAC]
        ldr     r5, [sp, #0xB0]
        ldr     r6, [sp, #0xB4]
        ldr     r7, [sp, #0xB8]
        cmp     r0, #0
        rsb     r8, r4, #0x10
        beq     LLBC57
        cmp     r1, #0
        beq     LLBC57
        cmp     r3, #0
        beq     LLBC57
        cmp     r2, #0
        beq     LLBC57
        cmp     r12, #0
        beq     LLBC57
        cmp     r5, #0
        beq     LLBC57
        cmp     r6, #0
        beq     LLBC57
        cmp     r7, #0
        beq     LLBC57
        ldr     r9, [r0]
        cmp     r9, #0
        str     r9, [sp, #0x24]
        beq     LLBC57
        ldr     r9, [r3]
        cmp     r9, #0
        beq     LLBC57
        cmp     r8, #0
        beq     LLBC1
        cmp     r8, #1
        beq     LLBC1
LLBC0:
        mvn     r0, #0xA
        add     sp, sp, #0x80
        ldmia   sp!, {r4 - r11, pc}
LLBC1:
        cmp     lr, #0
        blt     LLBC0
        ldr     r9, [r1]
        cmp     lr, #7
        bls     LLBC4
        subs    r9, r9, #6
        bmi     LLBC40
        str     r9, [r1]
        ldr     lr, [r0]
        add     r12, r9, #1
        ldr     lr, [lr]
        mov     r12, lr, lsr r12
LLBC2:
        and     lr, r12, #0x3F
        and     r12, lr, #0x3C
        and     r11, lr, #3
        movs    r12, r12, asr #2
        bne     LLBC3
        cmp     r11, #3
        moveq   r11, #0
        beq     LLBC10
LLBC3:
        add     r12, r12, #1
        b       LLBC10
LLBC4:
        cmp     lr, #4
        movcs   lr, #2
        movcc   lr, lr, lsr #1
        ldr     lr, [r12, +lr, lsl #2]
        cmp     lr, #0
        beq     LLBC57
        ldr     r12, [lr]
        str     r12, [sp, #0x2C]
        subs    r12, r9, r12
        bmi     LLBC52
        str     r12, [r1]
        ldr     r11, [r0]
        add     r10, r12, #1
        str     r10, [sp, #0x34]
        ldr     r10, [r11]
        ldr     r11, [sp, #0x34]
        mov     r11, r10, lsr r11
        str     r11, [sp, #0x28]
LLBC5:
        ldr     r11, [sp, #0x2C]
        mov     r10, #1
        mov     r11, r10, lsl r11
        sub     r10, r11, #1
        ldr     r11, [sp, #0x28]
        and     r10, r11, r10
        add     r11, lr, #4
        str     r11, [sp, #0x2C]
        ldr     r10, [r11, +r10, lsl #2]
        and     r11, r10, #0xFF
        tst     r11, #0x80
        str     r11, [sp, #0x28]
        beq     LLBC8
        str     r2, [sp, #0x10]
        ldr     r2, [sp, #0x2C]
        str     r3, [sp]
        str     r7, [sp, #8]
        str     r6, [sp, #4]
        str     r5, [sp, #0x18]
        str     r4, [sp, #0x14]
        mov     r3, #1
LLBC6:
        mov     r10, r10, asr #8
        ldr     r7, [lr, +r10, lsl #2]
        subs    r12, r12, r7
        bmi     LLBC51
        str     r12, [r1]
        ldr     r5, [r0]
        add     r4, r12, #1
        ldr     r5, [r5]
        mov     r4, r5, lsr r4
LLBC7:
        mov     r7, r3, lsl r7
        sub     r5, r7, #1
        and     r4, r5, r4
        add     r4, r10, r4
        ldr     r10, [r2, +r4, lsl #2]
        and     r4, r10, #0xFF
        tst     r4, #0x80
        bne     LLBC6
        str     r4, [sp, #0x28]
        ldr     r7, [sp, #8]
        ldr     r6, [sp, #4]
        ldr     r5, [sp, #0x18]
        ldr     r4, [sp, #0x14]
        ldr     r3, [sp]
        ldr     r2, [sp, #0x10]
LLBC8:
        ldr     lr, [sp, #0x28]
        add     lr, r12, lr
        cmp     lr, #0x1F
        strle   lr, [r1]
        ble     LLBC9
        sub     r12, lr, #0x20
        str     r12, [r1]
        ldr     r12, [r0]
        sub     r12, r12, #4
        str     r12, [r0]
LLBC9:
        mov     r12, #0xF1
        orr     lr, r12, #0xF, 20
        mov     r12, r10, asr #8
        cmp     lr, r12
        beq     LLBC53
        mov     r10, r10, asr #16
        and     r11, r12, #0xFF
        and     r12, r10, #0xFF
LLBC10:
        cmp     r11, #0
        strh    r12, [r2]
        moveq   lr, #0
        beq     LLBC13
        ldr     r2, [r1]
        subs    r2, r2, r11
        bmi     LLBC41
        str     r2, [r1]
        ldr     lr, [r0]
        add     r2, r2, #1
        ldr     lr, [lr]
        mov     r2, lr, lsr r2
LLBC11:
        mov     lr, #1
        mov     r9, lr, lsl r11
        sub     r9, r9, #1
        and     r2, r2, r9
        sub     r9, r11, #1
        movs    r9, lr, lsl r9
        mov     lr, #0
        beq     LLBC13
        str     r0, [sp, #0x30]
LLBC12:
        tst     r2, r9
        mvnne   r10, #0
        moveq   r10, #1
        add     r0, sp, #0x40
        str     r10, [r0, +lr, lsl #2]
        movs    r9, r9, lsr #1
        add     lr, lr, #1
        bne     LLBC12
        ldr     r0, [sp, #0x30]
LLBC13:
        cmp     r12, #0
        beq     LLBC39
        ldr     r9, [r3]
        mov     r2, #0
        cmp     r12, r11
        str     r2, [r9]
        ldr     r9, [r3]
        str     r2, [r9, #4]
        ldr     r9, [r3]
        str     r2, [r9, #8]
        ldr     r9, [r3]
        str     r2, [r9, #0xC]
        ldr     r9, [r3]
        str     r2, [r9, #0x10]
        ldr     r9, [r3]
        str     r2, [r9, #0x14]
        ldr     r9, [r3]
        str     r2, [r9, #0x18]
        ldr     r9, [r3]
        str     r2, [r9, #0x1C]
        ldr     r9, [r3]
        str     r2, [r9, #0x20]
        ldr     r9, [r3]
        str     r2, [r9, #0x24]
        ldr     r9, [r3]
        str     r2, [r9, #0x28]
        ldr     r9, [r3]
        str     r2, [r9, #0x2C]
        ldr     r9, [r3]
        str     r2, [r9, #0x30]
        ldr     r9, [r3]
        str     r2, [r9, #0x34]
        ldr     r9, [r3]
        str     r2, [r9, #0x38]
        ldr     r9, [r3]
        str     r2, [r9, #0x3C]
        ble     LLBC25
        add     r2, sp, #0x40
        cmp     r12, #0xA
        add     lr, r2, lr, lsl #2
        movle   r10, #0
        ble     LLBC14
        cmp     r11, #3
        movge   r10, #0
        movlt   r10, #1
LLBC14:
        cmp     r11, #3
        movge   r9, #0
        movlt   r9, #1
        sub     r2, r12, r11
        cmp     r2, #0
        ble     LLBC25
        mov     r11, #0
        str     r11, [sp, #0x2C]
        str     r11, [sp, #0x28]
        str     r11, [sp, #0x20]
        ldr     r11, [pc, #0x750]
        str     r12, [sp, #0x1C]
        str     r8, [sp, #0xC]
        add     r11, r11, #0x77, 30
        str     r11, [sp, #0x10]
        ldr     r11, [pc, #0x73C]
        str     r6, [sp, #4]
        str     r5, [sp, #0x18]
        str     r3, [sp]
        ldr     r6, [sp, #0x20]
        ldr     r5, [sp, #0x28]
        ldr     r3, [sp, #0x2C]
        add     r11, r11, #0x1C
        str     r11, [sp, #0x24]
        str     r7, [sp, #8]
        str     r4, [sp, #0x14]
LLBC15:
        cmp     r3, #1
        beq     LLBC46
LLBC16:
        bic     r12, r10, #0xFF, 8
        bic     r12, r12, #0xFF, 16
        cmp     r12, #6
        bge     LLBC17
        ldr     r4, [pc, #0x6FC]
        ldrb    r4, [r12, +r4]
        cmp     r5, r4
        ble     LLBC17
        add     r10, r10, #1
        bic     r12, r10, #0xFF, 8
        bic     r12, r12, #0xFF, 16
LLBC17:
        mvn     r4, #0
        str     lr, [sp, #0x34]
LLBC18:
        ldr     lr, [r1]
        subs    lr, lr, #1
        bmi     LLBC45
        str     lr, [r1]
        ldr     r5, [r0]
        add     lr, lr, #1
        ldr     r5, [r5]
        mov     lr, r5, lsr lr
LLBC19:
        tst     lr, #1
        add     r4, r4, #1
        beq     LLBC18
        ldr     lr, [sp, #0x34]
        cmp     r4, #0xF
        bgt     LLBC22
        ldr     r5, [sp, #0x24]
        add     r5, r5, r12, lsl #6
        ldr     r7, [r5, +r4, lsl #2]
        ldr     r5, [sp, #0x10]
        bic     r7, r7, #0xFF, 8
        add     r12, r5, r12, lsl #6
        ldr     r5, [r12, +r4, lsl #2]
        bics    r12, r7, #0xFF, 16
        beq     LLBC21
        ldr     r4, [r1]
        subs    r4, r4, r12
        bmi     LLBC42
        str     r4, [r1]
        ldr     r7, [r0]
        add     r4, r4, #1
        ldr     r7, [r7]
        mov     r4, r7, lsr r4
LLBC20:
        mov     r7, #1
        mov     r12, r7, lsl r12
        sub     r12, r12, #1
        and     r4, r4, r12
LLBC21:
        add     r5, r9, r5
        add     r12, r5, r4, asr #1
        bic     r12, r12, #0xFF, 8
        bic     r5, r12, #0xFF, 16
        tst     r4, #1
        mov     r12, r5
        rsbne   r12, r12, #0
        str     r12, [lr, +r3, lsl #2]
        b       LLBC24
LLBC22:
        ldr     r7, [r1]
        sub     r5, r4, #3
        subs    r7, r7, r5
        bmi     LLBC44
        str     r7, [r1]
        ldr     r8, [r0]
        add     r7, r7, #1
        ldr     r8, [r8]
        mov     r7, r8, lsr r7
        str     r7, [sp, #0x28]
LLBC23:
        ldr     r7, [pc, #0x5FC]
        cmp     r4, #0xF
        mov     r11, #0xF
        ldr     r8, [r7, +r12, lsl #2]
        mov     r7, #1
        mov     r7, r7, lsl r5
        movgt   r4, r11
        ldr     r11, [sp, #0x28]
        sub     r7, r7, #1
        add     r9, r8, r9, lsl #1
        and     r7, r11, r7
        add     r12, r7, r4, lsl r12
        add     r9, r9, r12
        mov     r12, #1
        add     r5, r9, r12, lsl r5
        sub     r12, r5, #1, 20
        bic     r12, r12, #0xFF, 8
        bic     r12, r12, #0xFF, 16
        tst     r12, #1
        addeq   r4, r12, #2
        mvnne   r4, #0
        rsbne   r4, r12, r4
        movs    r12, r4, asr #1
        str     r12, [lr, +r3, lsl #2]
        rsbmi   r12, r12, #0
        bic     r12, r12, #0xFF, 8
        bic     r5, r12, #0xFF, 16
LLBC24:
        add     r6, r6, #1
        mov     r3, r6, lsl #16
        mov     r3, r3, asr #16
        cmp     r3, r2
        movlt   r9, #0
        blt     LLBC15
        b       LLBC43
LLBC25:
        cmp     r12, r4
        mov     r2, #0
        movge   r4, r2
        bge     LLBC30
        ldr     r5, [r5, +r12, lsl #2]
        cmp     r5, #0
        beq     LLBC57
        ldr     lr, [r1]
        ldr     r11, [r5]
        subs    lr, lr, r11
        bmi     LLBC48
        str     lr, [r1]
        ldr     r4, [r0]
        add     lr, lr, #1
        ldr     r4, [r4]
        mov     lr, r4, lsr lr
LLBC26:
        mov     r4, #1
        mov     r11, r4, lsl r11
        sub     r4, r11, #1
        and     r4, r4, lr
        add     lr, r5, #4
        ldr     r4, [lr, +r4, lsl #2]
        and     r9, r4, #0xFF
        tst     r9, #0x80
        mov     r4, r4, asr #8
        beq     LLBC29
        str     r3, [sp]
        str     r8, [sp, #0xC]
        str     r7, [sp, #8]
        str     r6, [sp, #4]
        mov     r3, #1
LLBC27:
        ldr     r6, [r1]
        ldr     r7, [r5, +r4, lsl #2]
        subs    r6, r6, r7
        bmi     LLBC47
        str     r6, [r1]
        ldr     r8, [r0]
        add     r6, r6, #1
        ldr     r8, [r8]
        mov     r6, r8, lsr r6
LLBC28:
        mov     r7, r3, lsl r7
        sub     r7, r7, #1
        and     r6, r7, r6
        add     r6, r4, r6
        ldr     r4, [lr, +r6, lsl #2]
        and     r9, r4, #0xFF
        tst     r9, #0x80
        mov     r4, r4, asr #8
        bne     LLBC27
        ldr     r8, [sp, #0xC]
        ldr     r7, [sp, #8]
        ldr     r6, [sp, #4]
        ldr     r3, [sp]
LLBC29:
        mov     lr, #0xF1
        orr     lr, lr, #0xF, 20
        cmp     lr, r4
        beq     LLBC56
        ldr     lr, [r1]
        add     lr, r9, lr
        cmp     lr, #0x1F
        strle   lr, [r1]
        ble     LLBC30
        sub     lr, lr, #0x20
        str     lr, [r1]
        ldr     lr, [r0]
        sub     lr, lr, #4
        str     lr, [r0]
LLBC30:
        cmp     r12, #0
        beq     LLBC38
        mov     lr, #0xF1
        orr     lr, lr, #0xF, 20
LLBC31:
        cmp     r12, #1
        ble     LLBC36
        cmp     r4, #0
        ble     LLBC36
        ldr     r5, [r6, +r4, lsl #2]
        cmp     r5, #0
        beq     LLBC55
        ldr     r10, [r1]
        ldr     r9, [r5]
        subs    r10, r10, r9
        bmi     LLBC50
        str     r10, [r1]
        ldr     r11, [r0]
        add     r10, r10, #1
        ldr     r11, [r11]
        mov     r10, r11, lsr r10
LLBC32:
        mov     r11, #1
        mov     r9, r11, lsl r9
        sub     r9, r9, #1
        and     r10, r9, r10
        add     r11, r5, #4
        ldr     r9, [r11, +r10, lsl #2]
        and     r10, r9, #0xFF
        tst     r10, #0x80
        mov     r9, r9, asr #8
        beq     LLBC35
        str     r2, [sp, #0x14]
        str     r12, [sp, #0x1C]
        str     r8, [sp, #0xC]
        str     r7, [sp, #8]
        str     r6, [sp, #4]
        str     r3, [sp]
        mov     r2, #1
LLBC33:
        ldr     r3, [r1]
        ldr     r12, [r5, +r9, lsl #2]
        subs    r3, r3, r12
        bmi     LLBC49
        str     r3, [r1]
        ldr     r6, [r0]
        add     r3, r3, #1
        ldr     r6, [r6]
        mov     r3, r6, lsr r3
LLBC34:
        mov     r12, r2, lsl r12
        sub     r12, r12, #1
        and     r3, r12, r3
        add     r3, r9, r3
        ldr     r3, [r11, +r3, lsl #2]
        and     r10, r3, #0xFF
        tst     r10, #0x80
        mov     r9, r3, asr #8
        bne     LLBC33
        ldr     r2, [sp, #0x14]
        ldr     r12, [sp, #0x1C]
        ldr     r8, [sp, #0xC]
        ldr     r7, [sp, #8]
        ldr     r6, [sp, #4]
        ldr     r3, [sp]
LLBC35:
        cmp     lr, r9
        beq     LLBC54
        ldr     r5, [r1]
        add     r5, r10, r5
        cmp     r5, #0x1F
        strle   r5, [r1]
        ble     LLBC37
        sub     r5, r5, #0x20
        str     r5, [r1]
        ldr     r5, [r0]
        sub     r5, r5, #4
        str     r5, [r0]
        b       LLBC37
LLBC36:
        mov     r9, r4
LLBC37:
        add     r5, r8, r4
        sub     r4, r4, r9
        add     r9, r5, r12
        ldr     r10, [r3]
        mov     r9, r9, lsl #2
        add     r5, sp, #0x40
        sub     r9, r9, #4
        ldr     r9, [r7, +r9]
        ldr     r5, [r5, +r2, lsl #2]
        subs    r12, r12, #1
        add     r2, r2, #1
        str     r5, [r10, +r9, lsl #2]
        bne     LLBC31
LLBC38:
        ldr     r0, [r3]
        add     r0, r0, #0x40
        str     r0, [r3]
LLBC39:
        mov     r0, #0
        add     sp, sp, #0x80
        ldmia   sp!, {r4 - r11, pc}
LLBC40:
        add     r12, r9, #0x20
        str     r12, [r1]
        ldr     lr, [r0]
        rsb     r9, r12, #0x1F
        ldr     r10, [lr, #4]
        mov     r12, r10, lsr r12
        ldr     r10, [lr], #4
        str     lr, [r0]
        mov     r9, r10, lsl r9
        add     r12, r9, r12, lsr #1
        b       LLBC2
LLBC41:
        add     r2, r2, #0x20
        str     r2, [r1]
        ldr     lr, [r0]
        rsb     r9, r2, #0x1F
        str     r9, [sp, #0x34]
        ldr     r9, [lr, #4]
        ldr     r10, [lr], #4
        str     lr, [r0]
        ldr     lr, [sp, #0x34]
        mov     r2, r9, lsr r2
        mov     lr, r10, lsl lr
        add     r2, lr, r2, lsr #1
        b       LLBC11
LLBC42:
        add     r4, r4, #0x20
        str     r4, [r1]
        ldr     r7, [r0]
        rsb     r8, r4, #0x1F
        str     r8, [sp, #0x28]
        ldr     r11, [r7]
        ldr     r8, [r7, #4]!
        str     r11, [sp, #0x38]
        str     r7, [r0]
        mov     r4, r8, lsr r4
        ldr     r7, [sp, #0x28]
        ldr     r8, [sp, #0x38]
        mov     r7, r8, lsl r7
        add     r4, r7, r4, lsr #1
        b       LLBC20
LLBC43:
        ldr     r12, [sp, #0x1C]
        ldr     r8, [sp, #0xC]
        ldr     r7, [sp, #8]
        ldr     r6, [sp, #4]
        ldr     r5, [sp, #0x18]
        ldr     r4, [sp, #0x14]
        ldr     r3, [sp]
        b       LLBC25
LLBC44:
        add     r7, r7, #0x20
        str     r7, [r1]
        ldr     r8, [r0]
        rsb     r11, r7, #0x1F
        str     r11, [sp, #0x38]
        ldr     r11, [r8, #4]
        str     r11, [sp, #0x28]
        ldr     r11, [r8], #4
        str     r11, [sp, #0x3C]
        str     r8, [r0]
        ldr     r8, [sp, #0x28]
        ldr     r11, [sp, #0x3C]
        mov     r7, r8, lsr r7
        ldr     r8, [sp, #0x38]
        mov     r8, r11, lsl r8
        add     r7, r8, r7, lsr #1
        str     r7, [sp, #0x28]
        b       LLBC23
LLBC45:
        add     lr, lr, #0x20
        str     lr, [r1]
        ldr     r11, [r0]
        rsb     r5, lr, #0x1F
        ldr     r7, [r11, #4]
        ldr     r8, [r11], #4
        str     r11, [r0]
        mov     lr, r7, lsr lr
        mov     r5, r8, lsl r5
        add     lr, r5, lr, lsr #1
        b       LLBC19
LLBC46:
        cmp     r5, #3
        movgt   r12, #2
        movgt   r10, r12
        bgt     LLBC17
        b       LLBC16
LLBC47:
        add     r6, r6, #0x20
        str     r6, [r1]
        ldr     r11, [r0]
        rsb     r8, r6, #0x1F
        ldr     r9, [r11, #4]
        ldr     r10, [r11], #4
        str     r11, [r0]
        mov     r6, r9, lsr r6
        mov     r8, r10, lsl r8
        add     r6, r8, r6, lsr #1
        b       LLBC28
LLBC48:
        add     lr, lr, #0x20
        str     lr, [r1]
        ldr     r4, [r0]
        rsb     r9, lr, #0x1F
        str     r9, [sp, #0x3C]
        ldr     r9, [r4, #4]
        ldr     r10, [r4], #4
        str     r4, [r0]
        ldr     r4, [sp, #0x3C]
        mov     lr, r9, lsr lr
        mov     r4, r10, lsl r4
        add     lr, r4, lr, lsr #1
        b       LLBC26
LLBC49:
        add     r3, r3, #0x20
        str     r3, [r1]
        ldr     r10, [r0]
        rsb     r6, r3, #0x1F
        ldr     r7, [r10, #4]
        ldr     r8, [r10], #4
        str     r10, [r0]
        mov     r3, r7, lsr r3
        mov     r6, r8, lsl r6
        add     r3, r6, r3, lsr #1
        b       LLBC34
LLBC50:
        add     r11, r10, #0x20
        str     r11, [sp, #0x3C]
        str     r11, [r1]
        ldr     r10, [r0]
        rsb     r11, r11, #0x1F
        str     r11, [sp, #0x38]
        ldr     r11, [r10, #4]
        str     r11, [sp, #0x34]
        ldr     r11, [r10], #4
        str     r11, [sp, #0x2C]
        str     r10, [r0]
        ldr     r10, [sp, #0x3C]
        ldr     r11, [sp, #0x34]
        mov     r10, r11, lsr r10
        str     r10, [sp, #0x3C]
        ldr     r10, [sp, #0x38]
        ldr     r11, [sp, #0x2C]
        mov     r10, r11, lsl r10
        ldr     r11, [sp, #0x3C]
        add     r10, r10, r11, lsr #1
        b       LLBC32
LLBC51:
        add     r4, r12, #0x20
        str     r4, [r1]
        ldr     r12, [r0]
        rsb     r5, r4, #0x1F
        ldr     r11, [r12, #4]
        ldr     r6, [r12], #4
        str     r12, [r0]
        ldr     r12, [r1]
        mov     r4, r11, lsr r4
        mov     r5, r6, lsl r5
        add     r4, r5, r4, lsr #1
        b       LLBC7
LLBC52:
        add     r10, r12, #0x20
        str     r10, [sp, #0x3C]
        str     r10, [r1]
        ldr     r12, [r0]
        rsb     r10, r10, #0x1F
        str     r10, [sp, #0x38]
        ldr     r10, [r12, #4]
        str     r10, [sp, #0x34]
        ldr     r10, [r12], #4
        str     r10, [sp, #0x28]
        str     r12, [r0]
        ldr     r11, [sp, #0x3C]
        ldr     r10, [sp, #0x34]
        ldr     r12, [r1]
        mov     r11, r10, lsr r11
        str     r11, [sp, #0x3C]
        ldr     r10, [sp, #0x28]
        ldr     r11, [sp, #0x38]
        mov     r10, r10, lsl r11
        ldr     r11, [sp, #0x3C]
        add     r11, r10, r11, lsr #1
        str     r11, [sp, #0x28]
        b       LLBC5
LLBC53:
        ldr     r2, [sp, #0x24]
        str     r2, [r0]
        mvn     r0, #0x49
        str     r9, [r1]
        add     sp, sp, #0x80
        ldmia   sp!, {r4 - r11, pc}
LLBC54:
        mvn     r0, #0x49
        add     sp, sp, #0x80
        ldmia   sp!, {r4 - r11, pc}
LLBC55:
        mvn     r0, #7
        add     sp, sp, #0x80
        ldmia   sp!, {r4 - r11, pc}
LLBC56:
        mvn     r0, #0x49
        add     sp, sp, #0x80
        ldmia   sp!, {r4 - r11, pc}
LLBC57:
        mvn     r0, #7
        add     sp, sp, #0x80
        ldmia   sp!, {r4 - r11, pc}
        .long   LLBC_sadd
        .long   LLBC_vlc_inc


        .data
        .align  4


LLBC_vlc_inc:
        .byte   0x00,0x03,0x06,0x0C,0x18,0x30


        .data
        .align  4


LLBC_sadd:
        .byte   0x0F,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LLBC_bitsToGetTbl16s:
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
LLBC_addOffsetTbl16s:
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


