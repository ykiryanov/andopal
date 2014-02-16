        .text
        .align  4
        .globl  ippiDecodeCAVLCCoeffs_H264_1u16s


ippiDecodeCAVLCCoeffs_H264_1u16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x64
        ldr     r4, [sp, #0x8C]
        ldr     lr, [sp, #0x88]
        ldr     r12, [sp, #0x90]
        ldr     r5, [sp, #0x94]
        ldr     r6, [sp, #0x98]
        ldr     r7, [sp, #0x9C]
        cmp     r0, #0
        rsb     r8, r4, #0x10
        beq     LLBG57
        cmp     r1, #0
        beq     LLBG57
        cmp     r3, #0
        beq     LLBG57
        cmp     r2, #0
        beq     LLBG57
        cmp     r12, #0
        beq     LLBG57
        cmp     r5, #0
        beq     LLBG57
        cmp     r6, #0
        beq     LLBG57
        cmp     r7, #0
        beq     LLBG57
        ldr     r9, [r0]
        cmp     r9, #0
        str     r9, [sp, #0x24]
        beq     LLBG57
        ldr     r9, [r3]
        cmp     r9, #0
        beq     LLBG57
        cmp     r8, #0
        beq     LLBG1
        cmp     r8, #1
        beq     LLBG1
LLBG0:
        mvn     r0, #0xA
        add     sp, sp, #0x64
        ldmia   sp!, {r4 - r11, pc}
LLBG1:
        cmp     lr, #0
        blt     LLBG0
        ldr     r9, [r1]
        cmp     lr, #7
        bls     LLBG4
        subs    r9, r9, #6
        bmi     LLBG40
        str     r9, [r1]
        ldr     lr, [r0]
        add     r12, r9, #1
        ldr     lr, [lr]
        mov     r12, lr, lsr r12
LLBG2:
        and     lr, r12, #0x3F
        and     r12, lr, #0x3C
        and     lr, lr, #3
        movs    r12, r12, asr #2
        bne     LLBG3
        cmp     lr, #3
        moveq   lr, #0
        beq     LLBG10
LLBG3:
        add     r12, r12, #1
        b       LLBG10
LLBG4:
        cmp     lr, #4
        movcs   lr, #2
        movcc   lr, lr, lsr #1
        ldr     lr, [r12, +lr, lsl #2]
        cmp     lr, #0
        beq     LLBG57
        ldr     r12, [lr]
        str     r12, [sp, #0x2C]
        subs    r12, r9, r12
        bmi     LLBG52
        str     r12, [r1]
        ldr     r11, [r0]
        add     r10, r12, #1
        str     r10, [sp, #0x38]
        ldr     r10, [r11]
        ldr     r11, [sp, #0x38]
        mov     r11, r10, lsr r11
        str     r11, [sp, #0x28]
LLBG5:
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
        beq     LLBG8
        str     r2, [sp, #0x10]
        ldr     r2, [sp, #0x2C]
        str     r3, [sp]
        str     r7, [sp, #8]
        str     r6, [sp, #4]
        str     r5, [sp, #0x18]
        str     r4, [sp, #0x14]
        mov     r3, #1
LLBG6:
        mov     r10, r10, asr #8
        ldr     r7, [lr, +r10, lsl #2]
        subs    r12, r12, r7
        bmi     LLBG51
        str     r12, [r1]
        ldr     r5, [r0]
        add     r4, r12, #1
        ldr     r5, [r5]
        mov     r4, r5, lsr r4
LLBG7:
        mov     r7, r3, lsl r7
        sub     r5, r7, #1
        and     r4, r5, r4
        add     r4, r10, r4
        ldr     r10, [r2, +r4, lsl #2]
        and     r4, r10, #0xFF
        tst     r4, #0x80
        bne     LLBG6
        str     r4, [sp, #0x28]
        ldr     r7, [sp, #8]
        ldr     r6, [sp, #4]
        ldr     r5, [sp, #0x18]
        ldr     r4, [sp, #0x14]
        ldr     r3, [sp]
        ldr     r2, [sp, #0x10]
LLBG8:
        ldr     lr, [sp, #0x28]
        add     lr, r12, lr
        cmp     lr, #0x1F
        strle   lr, [r1]
        ble     LLBG9
        sub     r12, lr, #0x20
        str     r12, [r1]
        ldr     r12, [r0]
        sub     r12, r12, #4
        str     r12, [r0]
LLBG9:
        mov     r12, #0xF1
        orr     lr, r12, #0xF, 20
        mov     r12, r10, asr #8
        cmp     lr, r12
        beq     LLBG53
        mov     r10, r10, asr #16
        and     lr, r12, #0xFF
        and     r12, r10, #0xFF
LLBG10:
        cmp     lr, #0
        strh    r12, [r2]
        moveq   r9, #0
        beq     LLBG13
        ldr     r2, [r1]
        subs    r2, r2, lr
        bmi     LLBG41
        str     r2, [r1]
        ldr     r9, [r0]
        add     r2, r2, #1
        ldr     r9, [r9]
        mov     r2, r9, lsr r2
LLBG11:
        mov     r9, #1
        mov     r10, r9, lsl lr
        sub     r10, r10, #1
        and     r2, r2, r10
        sub     r10, lr, #1
        movs    r10, r9, lsl r10
        mov     r11, #0
        moveq   r9, r11
        beq     LLBG13
        mov     r9, r11
        str     r1, [sp, #0x30]
        str     r0, [sp, #0x34]
LLBG12:
        tst     r2, r10
        mvnne   r1, #0
        moveq   r1, #1
        add     r0, sp, #0x44
        strh    r1, [r0, +r11]
        movs    r10, r10, lsr #1
        add     r9, r9, #1
        add     r11, r11, #2
        bne     LLBG12
        ldr     r1, [sp, #0x30]
        ldr     r0, [sp, #0x34]
LLBG13:
        cmp     r12, #0
        beq     LLBG39
        ldr     r10, [r3]
        mov     r2, #0
        cmp     r12, lr
        strh    r2, [r10]
        ldr     r10, [r3]
        strh    r2, [r10, #2]
        ldr     r10, [r3]
        strh    r2, [r10, #4]
        ldr     r10, [r3]
        strh    r2, [r10, #6]
        ldr     r10, [r3]
        strh    r2, [r10, #8]
        ldr     r10, [r3]
        strh    r2, [r10, #0xA]
        ldr     r10, [r3]
        strh    r2, [r10, #0xC]
        ldr     r10, [r3]
        strh    r2, [r10, #0xE]
        ldr     r10, [r3]
        strh    r2, [r10, #0x10]
        ldr     r10, [r3]
        strh    r2, [r10, #0x12]
        ldr     r10, [r3]
        strh    r2, [r10, #0x14]
        ldr     r10, [r3]
        strh    r2, [r10, #0x16]
        ldr     r10, [r3]
        strh    r2, [r10, #0x18]
        ldr     r10, [r3]
        strh    r2, [r10, #0x1A]
        ldr     r10, [r3]
        strh    r2, [r10, #0x1C]
        ldr     r10, [r3]
        strh    r2, [r10, #0x1E]
        ble     LLBG25
        add     r2, sp, #0x44
        cmp     r12, #0xA
        add     r2, r2, r9, lsl #1
        movle   r10, #0
        ble     LLBG14
        cmp     lr, #3
        movge   r10, #0
        movlt   r10, #1
LLBG14:
        cmp     lr, #3
        movge   r9, #0
        movlt   r9, #1
        sub     lr, r12, lr
        cmp     lr, #0
        ble     LLBG25
        mov     r11, #0
        str     r11, [sp, #0x28]
        str     r11, [sp, #0x2C]
        str     r11, [sp, #0x24]
        ldr     r11, [pc, #0x770]
        str     r12, [sp, #0x1C]
        str     r8, [sp, #0xC]
        add     r11, r11, #0x77, 30
        str     r11, [sp, #0x10]
        ldr     r11, [pc, #0x75C]
        str     r6, [sp, #4]
        str     r5, [sp, #0x18]
        str     r3, [sp]
        ldr     r6, [sp, #0x24]
        ldr     r5, [sp, #0x2C]
        ldr     r3, [sp, #0x28]
        add     r11, r11, #0x1C
        str     r11, [sp, #0x20]
        str     r7, [sp, #8]
        str     r4, [sp, #0x14]
LLBG15:
        cmp     r3, #1
        beq     LLBG46
LLBG16:
        bic     r12, r10, #0xFF, 8
        bic     r12, r12, #0xFF, 16
        cmp     r12, #6
        bge     LLBG17
        ldr     r4, [pc, #0x71C]
        ldrb    r4, [r12, +r4]
        cmp     r5, r4
        ble     LLBG17
        add     r10, r10, #1
        bic     r12, r10, #0xFF, 8
        bic     r12, r12, #0xFF, 16
LLBG17:
        mvn     r4, #0
        str     r2, [sp, #0x38]
LLBG18:
        ldr     r2, [r1]
        subs    r2, r2, #1
        bmi     LLBG45
        str     r2, [r1]
        ldr     r5, [r0]
        add     r2, r2, #1
        ldr     r5, [r5]
        mov     r2, r5, lsr r2
LLBG19:
        tst     r2, #1
        add     r4, r4, #1
        beq     LLBG18
        ldr     r2, [sp, #0x38]
        cmp     r4, #0xF
        bgt     LLBG22
        ldr     r5, [sp, #0x20]
        add     r5, r5, r12, lsl #6
        ldr     r7, [r5, +r4, lsl #2]
        ldr     r5, [sp, #0x10]
        bic     r7, r7, #0xFF, 8
        add     r12, r5, r12, lsl #6
        ldr     r5, [r12, +r4, lsl #2]
        bics    r12, r7, #0xFF, 16
        beq     LLBG21
        ldr     r4, [r1]
        subs    r4, r4, r12
        bmi     LLBG42
        str     r4, [r1]
        ldr     r7, [r0]
        add     r4, r4, #1
        ldr     r7, [r7]
        mov     r4, r7, lsr r4
LLBG20:
        mov     r7, #1
        mov     r12, r7, lsl r12
        sub     r12, r12, #1
        and     r4, r4, r12
LLBG21:
        add     r5, r9, r5
        add     r12, r5, r4, asr #1
        bic     r12, r12, #0xFF, 8
        bic     r5, r12, #0xFF, 16
        tst     r4, #1
        mov     r12, r5
        rsbne   r12, r12, #0
        mov     r3, r3, lsl #1
        strh    r12, [r2, +r3]
        b       LLBG24
LLBG22:
        ldr     r7, [r1]
        sub     r5, r4, #3
        subs    r7, r7, r5
        bmi     LLBG44
        str     r7, [r1]
        ldr     r8, [r0]
        add     r7, r7, #1
        ldr     r8, [r8]
        mov     r7, r8, lsr r7
        str     r7, [sp, #0x2C]
LLBG23:
        ldr     r7, [pc, #0x618]
        cmp     r4, #0xF
        mov     r11, #0xF
        ldr     r8, [r7, +r12, lsl #2]
        mov     r7, #1
        mov     r7, r7, lsl r5
        movgt   r4, r11
        ldr     r11, [sp, #0x2C]
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
        mov     r12, r4, asr #1
        mov     r3, r3, lsl #1
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        cmp     r12, #0
        strh    r12, [r2, +r3]
        rsblt   r12, r12, #0
        bic     r12, r12, #0xFF, 8
        bic     r5, r12, #0xFF, 16
LLBG24:
        add     r6, r6, #1
        mov     r3, r6, lsl #16
        mov     r3, r3, asr #16
        cmp     r3, lr
        movlt   r9, #0
        blt     LLBG15
        b       LLBG43
LLBG25:
        cmp     r12, r4
        mov     r2, #0
        movge   r4, r2
        bge     LLBG30
        ldr     r5, [r5, +r12, lsl #2]
        cmp     r5, #0
        beq     LLBG57
        ldr     lr, [r1]
        ldr     r10, [r5]
        subs    lr, lr, r10
        bmi     LLBG48
        str     lr, [r1]
        ldr     r4, [r0]
        add     lr, lr, #1
        ldr     r4, [r4]
        mov     lr, r4, lsr lr
LLBG26:
        mov     r4, #1
        mov     r10, r4, lsl r10
        sub     r4, r10, #1
        and     r4, r4, lr
        add     lr, r5, #4
        ldr     r4, [lr, +r4, lsl #2]
        and     r9, r4, #0xFF
        tst     r9, #0x80
        mov     r4, r4, asr #8
        beq     LLBG29
        str     r3, [sp]
        str     r8, [sp, #0xC]
        str     r7, [sp, #8]
        str     r6, [sp, #4]
        mov     r3, #1
LLBG27:
        ldr     r6, [r1]
        ldr     r7, [r5, +r4, lsl #2]
        subs    r6, r6, r7
        bmi     LLBG47
        str     r6, [r1]
        ldr     r8, [r0]
        add     r6, r6, #1
        ldr     r8, [r8]
        mov     r6, r8, lsr r6
LLBG28:
        mov     r7, r3, lsl r7
        sub     r7, r7, #1
        and     r6, r7, r6
        add     r6, r4, r6
        ldr     r4, [lr, +r6, lsl #2]
        and     r9, r4, #0xFF
        tst     r9, #0x80
        mov     r4, r4, asr #8
        bne     LLBG27
        ldr     r8, [sp, #0xC]
        ldr     r7, [sp, #8]
        ldr     r6, [sp, #4]
        ldr     r3, [sp]
LLBG29:
        mov     lr, #0xF1
        orr     lr, lr, #0xF, 20
        cmp     lr, r4
        beq     LLBG56
        ldr     lr, [r1]
        add     lr, r9, lr
        cmp     lr, #0x1F
        strle   lr, [r1]
        ble     LLBG30
        sub     lr, lr, #0x20
        str     lr, [r1]
        ldr     lr, [r0]
        sub     lr, lr, #4
        str     lr, [r0]
LLBG30:
        cmp     r12, #0
        beq     LLBG38
        mov     lr, #0xF1
        orr     lr, lr, #0xF, 20
LLBG31:
        cmp     r12, #1
        ble     LLBG36
        cmp     r4, #0
        ble     LLBG36
        ldr     r5, [r6, +r4, lsl #2]
        cmp     r5, #0
        beq     LLBG55
        ldr     r10, [r1]
        ldr     r9, [r5]
        subs    r10, r10, r9
        bmi     LLBG50
        str     r10, [r1]
        ldr     r11, [r0]
        add     r10, r10, #1
        ldr     r11, [r11]
        mov     r10, r11, lsr r10
LLBG32:
        mov     r11, #1
        mov     r9, r11, lsl r9
        sub     r9, r9, #1
        and     r10, r9, r10
        add     r11, r5, #4
        ldr     r9, [r11, +r10, lsl #2]
        and     r10, r9, #0xFF
        tst     r10, #0x80
        mov     r9, r9, asr #8
        beq     LLBG35
        str     r2, [sp, #0x14]
        str     r12, [sp, #0x1C]
        str     r8, [sp, #0xC]
        str     r7, [sp, #8]
        str     r6, [sp, #4]
        str     r3, [sp]
        mov     r2, #1
LLBG33:
        ldr     r3, [r1]
        ldr     r12, [r5, +r9, lsl #2]
        subs    r3, r3, r12
        bmi     LLBG49
        str     r3, [r1]
        ldr     r6, [r0]
        add     r3, r3, #1
        ldr     r6, [r6]
        mov     r3, r6, lsr r3
LLBG34:
        mov     r12, r2, lsl r12
        sub     r12, r12, #1
        and     r3, r12, r3
        add     r3, r9, r3
        ldr     r3, [r11, +r3, lsl #2]
        and     r10, r3, #0xFF
        tst     r10, #0x80
        mov     r9, r3, asr #8
        bne     LLBG33
        ldr     r2, [sp, #0x14]
        ldr     r12, [sp, #0x1C]
        ldr     r8, [sp, #0xC]
        ldr     r7, [sp, #8]
        ldr     r6, [sp, #4]
        ldr     r3, [sp]
LLBG35:
        cmp     lr, r9
        beq     LLBG54
        ldr     r5, [r1]
        add     r5, r10, r5
        cmp     r5, #0x1F
        strle   r5, [r1]
        ble     LLBG37
        sub     r5, r5, #0x20
        str     r5, [r1]
        ldr     r5, [r0]
        sub     r5, r5, #4
        str     r5, [r0]
        b       LLBG37
LLBG36:
        mov     r9, r4
LLBG37:
        add     r5, r8, r4
        add     r5, r5, r12
        sub     r4, r4, r9
        mov     r5, r5, lsl #2
        sub     r5, r5, #4
        ldr     r9, [r7, +r5]
        add     r10, sp, #0x44
        ldr     r5, [r3]
        ldrsh   r10, [r10, +r2]
        mov     r9, r9, lsl #1
        subs    r12, r12, #1
        add     r2, r2, #2
        strh    r10, [r5, +r9]
        bne     LLBG31
LLBG38:
        ldr     r0, [r3]
        add     r0, r0, #0x20
        str     r0, [r3]
LLBG39:
        mov     r0, #0
        add     sp, sp, #0x64
        ldmia   sp!, {r4 - r11, pc}
LLBG40:
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
        b       LLBG2
LLBG41:
        add     r2, r2, #0x20
        str     r2, [r1]
        ldr     r9, [r0]
        rsb     r10, r2, #0x1F
        ldr     r11, [r9, #4]
        str     r11, [sp, #0x38]
        ldr     r11, [r9], #4
        str     r9, [r0]
        ldr     r9, [sp, #0x38]
        mov     r10, r11, lsl r10
        mov     r2, r9, lsr r2
        add     r2, r10, r2, lsr #1
        b       LLBG11
LLBG42:
        add     r4, r4, #0x20
        str     r4, [r1]
        ldr     r7, [r0]
        rsb     r8, r4, #0x1F
        str     r8, [sp, #0x2C]
        ldr     r11, [r7]
        ldr     r8, [r7, #4]!
        str     r11, [sp, #0x3C]
        str     r7, [r0]
        mov     r4, r8, lsr r4
        ldr     r7, [sp, #0x2C]
        ldr     r8, [sp, #0x3C]
        mov     r7, r8, lsl r7
        add     r4, r7, r4, lsr #1
        b       LLBG20
LLBG43:
        ldr     r12, [sp, #0x1C]
        ldr     r8, [sp, #0xC]
        ldr     r7, [sp, #8]
        ldr     r6, [sp, #4]
        ldr     r5, [sp, #0x18]
        ldr     r4, [sp, #0x14]
        ldr     r3, [sp]
        b       LLBG25
LLBG44:
        add     r7, r7, #0x20
        str     r7, [r1]
        ldr     r8, [r0]
        rsb     r11, r7, #0x1F
        str     r11, [sp, #0x3C]
        ldr     r11, [r8, #4]
        str     r11, [sp, #0x2C]
        ldr     r11, [r8], #4
        str     r11, [sp, #0x40]
        str     r8, [r0]
        ldr     r8, [sp, #0x2C]
        ldr     r11, [sp, #0x40]
        mov     r7, r8, lsr r7
        ldr     r8, [sp, #0x3C]
        mov     r8, r11, lsl r8
        add     r7, r8, r7, lsr #1
        str     r7, [sp, #0x2C]
        b       LLBG23
LLBG45:
        add     r2, r2, #0x20
        str     r2, [r1]
        ldr     r11, [r0]
        rsb     r5, r2, #0x1F
        ldr     r7, [r11, #4]
        ldr     r8, [r11], #4
        str     r11, [r0]
        mov     r2, r7, lsr r2
        mov     r5, r8, lsl r5
        add     r2, r5, r2, lsr #1
        b       LLBG19
LLBG46:
        cmp     r5, #3
        movgt   r12, #2
        movgt   r10, r12
        bgt     LLBG17
        b       LLBG16
LLBG47:
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
        b       LLBG28
LLBG48:
        add     lr, lr, #0x20
        str     lr, [r1]
        ldr     r4, [r0]
        rsb     r9, lr, #0x1F
        ldr     r11, [r4, #4]
        str     r11, [sp, #0x40]
        ldr     r11, [r4], #4
        str     r11, [sp, #0x3C]
        str     r4, [r0]
        ldr     r4, [sp, #0x40]
        mov     lr, r4, lsr lr
        ldr     r4, [sp, #0x3C]
        mov     r9, r4, lsl r9
        add     lr, r9, lr, lsr #1
        b       LLBG26
LLBG49:
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
        b       LLBG34
LLBG50:
        add     r11, r10, #0x20
        str     r11, [sp, #0x40]
        str     r11, [r1]
        ldr     r10, [r0]
        rsb     r11, r11, #0x1F
        str     r11, [sp, #0x3C]
        ldr     r11, [r10, #4]
        str     r11, [sp, #0x38]
        ldr     r11, [r10], #4
        str     r11, [sp, #0x2C]
        str     r10, [r0]
        ldr     r10, [sp, #0x40]
        ldr     r11, [sp, #0x38]
        mov     r10, r11, lsr r10
        str     r10, [sp, #0x40]
        ldr     r10, [sp, #0x3C]
        ldr     r11, [sp, #0x2C]
        mov     r10, r11, lsl r10
        ldr     r11, [sp, #0x40]
        add     r10, r10, r11, lsr #1
        b       LLBG32
LLBG51:
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
        b       LLBG7
LLBG52:
        add     r10, r12, #0x20
        str     r10, [sp, #0x40]
        str     r10, [r1]
        ldr     r12, [r0]
        rsb     r10, r10, #0x1F
        str     r10, [sp, #0x3C]
        ldr     r10, [r12, #4]
        str     r10, [sp, #0x38]
        ldr     r10, [r12], #4
        str     r10, [sp, #0x28]
        str     r12, [r0]
        ldr     r11, [sp, #0x40]
        ldr     r10, [sp, #0x38]
        ldr     r12, [r1]
        mov     r11, r10, lsr r11
        str     r11, [sp, #0x40]
        ldr     r10, [sp, #0x28]
        ldr     r11, [sp, #0x3C]
        mov     r10, r10, lsl r11
        ldr     r11, [sp, #0x40]
        add     r11, r10, r11, lsr #1
        str     r11, [sp, #0x28]
        b       LLBG5
LLBG53:
        ldr     r2, [sp, #0x24]
        str     r2, [r0]
        mvn     r0, #0x49
        str     r9, [r1]
        add     sp, sp, #0x64
        ldmia   sp!, {r4 - r11, pc}
LLBG54:
        mvn     r0, #0x49
        add     sp, sp, #0x64
        ldmia   sp!, {r4 - r11, pc}
LLBG55:
        mvn     r0, #7
        add     sp, sp, #0x64
        ldmia   sp!, {r4 - r11, pc}
LLBG56:
        mvn     r0, #0x49
        add     sp, sp, #0x64
        ldmia   sp!, {r4 - r11, pc}
LLBG57:
        mvn     r0, #7
        add     sp, sp, #0x64
        ldmia   sp!, {r4 - r11, pc}
        .long   LLBG_sadd
        .long   LLBG_vlc_inc


        .data
        .align  4


LLBG_vlc_inc:
        .byte   0x00,0x03,0x06,0x0C,0x18,0x30


        .data
        .align  4


LLBG_sadd:
        .byte   0x0F,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LLBG_bitsToGetTbl16s:
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
LLBG_addOffsetTbl16s:
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


