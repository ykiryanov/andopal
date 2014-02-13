        .text
        .align  4
        .globl  _ippiDecodeCAVLCChromaDcCoeffs_H264_1u16s


_ippiDecodeCAVLCChromaDcCoeffs_H264_1u16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x4C
        ldr     r12, [sp, #0x70]
        ldr     r8, [sp, #0x74]
        ldr     r7, [sp, #0x78]
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        mov     r6, r3
        beq     LLBH43
        cmp     r4, #0
        beq     LLBH43
        cmp     r2, #0
        beq     LLBH43
        ldr     r11, [r4]
        cmp     r11, #4
        ble     LLBH1
        ldr     r10, [r5]
        sub     lr, r11, #4
        mov     r9, #0
        ldr     r0, [r10]
        mov     lr, r0, lsr lr
        tst     lr, #0x10
        beq     LLBH0
        cmp     r6, #0
        beq     LLBH43
        ldr     r0, [r6]
        ldr     r12, [pc, #0xA74]
        mov     r5, lr, asr #3
        add     r7, r0, #8
        str     r7, [r6]
        and     lr, lr, #7
        strh    r9, [r0, #6]
        strh    r9, [r0, #4]
        strh    r9, [r0, #2]
        strh    r9, [r0]
        mov     r3, lr, lsl #1
        ldrsb   lr, [r12, +r3]
        and     r5, r5, #1
        add     r3, r12, r3
        mov     lr, lr, lsl #1
        mov     r5, r5, lsl #1
        rsb     r5, r5, #1
        strh    r5, [r0, +lr]
        ldr     lr, [r4]
        ldrsb   r12, [r3, #1]
        mov     r3, #1
        mov     r0, #0
        sub     lr, lr, r12
        str     lr, [r4]
        strh    r3, [r2]
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
LLBH0:
        tst     lr, #8
        beq     LLBH5
        strh    r9, [r2]
        ldr     r2, [r4]
        mov     r0, #0
        sub     r2, r2, #2
        str     r2, [r4]
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
LLBH1:
        ldr     r10, [r5]
        subs    r0, r11, #5
        ldr     lr, [r10]
        addpl   r0, r0, #1
        movpl   lr, lr, lsr r0
        bmi     LLBH38
LLBH2:
        tst     lr, #0x10
        mov     r9, #0
        beq     LLBH4
        cmp     r6, #0
        beq     LLBH43
        ldr     r12, [r6]
        ldr     r7, [pc, #0x9B8]
        mov     r8, lr, asr #3
        add     r10, r12, #8
        str     r10, [r6]
        and     lr, lr, #7
        strh    r9, [r12, #6]
        strh    r9, [r12, #4]
        strh    r9, [r12, #2]
        strh    r9, [r12]
        mov     r3, lr, lsl #1
        ldrsb   lr, [r7, +r3]
        and     r8, r8, #1
        add     r3, r7, r3
        mov     lr, lr, lsl #1
        mov     r8, r8, lsl #1
        rsb     r6, r8, #1
        strh    r6, [r12, +lr]
        ldr     r12, [r4]
        ldrsb   r3, [r3, #1]
        subs    r12, r12, r3
        strpl   r12, [r4]
        bmi     LLBH29
LLBH3:
        mov     r0, #1
        strh    r0, [r2]
        mov     r0, #0
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
LLBH4:
        tst     lr, #8
        beq     LLBH5
        strh    r9, [r2]
        ldr     r2, [r4]
        subs    r2, r2, #2
        strpl   r2, [r4]
        bmi     LLBH30
        mov     r0, #0
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
LLBH5:
        cmp     r6, #0
        beq     LLBH43
        cmp     r12, #0
        beq     LLBH43
        cmp     r8, #0
        beq     LLBH43
        cmp     r7, #0
        beq     LLBH43
        ldr     r9, [r12]
        subs    lr, r11, r9
        bmi     LLBH37
        str     lr, [r4]
        ldr     r0, [r5]
        add     r1, lr, #1
        ldr     r0, [r0]
        mov     r1, r0, lsr r1
LLBH6:
        mov     r0, #1
        mov     r9, r0, lsl r9
        sub     r9, r9, #1
        and     r1, r1, r9
        add     r9, r12, #4
        ldr     r1, [r9, +r1, lsl #2]
        and     r3, r1, #0xFF
        tst     r3, #0x80
        beq     LLBH9
        str     r7, [sp, #0xC]
        str     r8, [sp, #0x14]
        str     r6, [sp, #8]
        str     r2, [sp, #0x18]
LLBH7:
        mov     r2, r1, asr #8
        ldr     r8, [r12, +r2, lsl #2]
        subs    lr, lr, r8
        bmi     LLBH36
        str     lr, [r4]
        ldr     r6, [r5]
        add     r3, lr, #1
        ldr     r6, [r6]
        mov     r3, r6, lsr r3
LLBH8:
        mov     r8, r0, lsl r8
        sub     r8, r8, #1
        and     r3, r8, r3
        add     r3, r2, r3
        ldr     r1, [r9, +r3, lsl #2]
        and     r3, r1, #0xFF
        tst     r3, #0x80
        bne     LLBH7
        ldr     r7, [sp, #0xC]
        ldr     r8, [sp, #0x14]
        ldr     r6, [sp, #8]
        ldr     r2, [sp, #0x18]
LLBH9:
        add     r3, lr, r3
        cmp     r3, #0x1F
        strle   r3, [r4]
        ble     LLBH10
        sub     r12, r3, #0x20
        str     r12, [r4]
        ldr     r12, [r5]
        sub     r12, r12, #4
        str     r12, [r5]
LLBH10:
        mov     r12, #0xF1
        orr     lr, r12, #0xF, 20
        mov     r12, r1, asr #8
        cmp     lr, r12
        beq     LLBH40
        mov     r1, r1, asr #16
        and     r9, r1, #0xFF
        ands    r3, r12, #0xFF
        strh    r9, [r2]
        mov     lr, #0
        moveq   r12, lr
        beq     LLBH13
        ldr     r12, [r4]
        subs    r12, r12, r3
        bmi     LLBH31
        str     r12, [r4]
        ldr     r10, [r5]
        add     r12, r12, #1
        ldr     r10, [r10]
        mov     r11, r10, lsr r12
LLBH11:
        mov     r12, #1
        mov     r10, r12, lsl r3
        sub     r10, r10, #1
        and     r10, r11, r10
        sub     r11, r3, #1
        movs    r11, r12, lsl r11
        moveq   r12, lr
        beq     LLBH13
        mov     r12, lr
LLBH12:
        tst     r10, r11
        mvnne   r0, #0
        moveq   r0, #1
        add     r1, sp, #0x2C
        strh    r0, [r1, +lr]
        movs    r11, r11, lsr #1
        add     lr, lr, #2
        add     r12, r12, #1
        bne     LLBH12
LLBH13:
        mov     r10, r9
        cmp     r10, #0
        beq     LLBH28
        ldr     lr, [r6]
        mov     r11, #0
        cmp     r10, r3
        strh    r11, [lr]
        ldr     lr, [r6]
        strh    r11, [lr, #2]
        ldr     lr, [r6]
        strh    r11, [lr, #4]
        ldr     lr, [r6]
        strh    r11, [lr, #6]
        ble     LLBH14
        add     lr, sp, #0x2C
        add     r12, lr, r12, lsl #1
        str     r12, [sp]
        mov     r2, r9
        mov     r1, r4
        mov     r0, r5
        bl      LLBH__GetBlockCoeffs_CAVLC
LLBH14:
        cmp     r10, #4
        movge   r12, r11
        bge     LLBH19
        ldr     r8, [r8, +r10, lsl #2]
        cmp     r8, #0
        beq     LLBH43
        ldr     r12, [r4]
        ldr     lr, [r8]
        subs    r12, r12, lr
        bmi     LLBH33
        str     r12, [r4]
        ldr     r0, [r5]
        add     r12, r12, #1
        ldr     r0, [r0]
        mov     r12, r0, lsr r12
LLBH15:
        mov     r0, #1
        mov     lr, r0, lsl lr
        sub     lr, lr, #1
        and     r12, lr, r12
        add     lr, r8, #4
        ldr     r12, [lr, +r12, lsl #2]
        and     r0, r12, #0xFF
        tst     r0, #0x80
        mov     r12, r12, asr #8
        beq     LLBH18
        str     r9, [sp, #0x10]
        str     r7, [sp, #0xC]
        str     r6, [sp, #8]
        mov     r2, #1
LLBH16:
        ldr     r3, [r4]
        ldr     r6, [r8, +r12, lsl #2]
        subs    r3, r3, r6
        bmi     LLBH32
        str     r3, [r4]
        ldr     r7, [r5]
        add     r3, r3, #1
        ldr     r7, [r7]
        mov     r3, r7, lsr r3
LLBH17:
        mov     r6, r2, lsl r6
        sub     r6, r6, #1
        and     r3, r6, r3
        add     r3, r12, r3
        ldr     r3, [lr, +r3, lsl #2]
        and     r0, r3, #0xFF
        tst     r0, #0x80
        mov     r12, r3, asr #8
        bne     LLBH16
        ldr     r9, [sp, #0x10]
        ldr     r7, [sp, #0xC]
        ldr     r6, [sp, #8]
LLBH18:
        mov     lr, #0xF1
        orr     lr, lr, #0xF, 20
        cmp     lr, r12
        beq     LLBH41
        ldr     lr, [r4]
        add     lr, r0, lr
        cmp     lr, #0x1F
        strle   lr, [r4]
        ble     LLBH19
        sub     lr, lr, #0x20
        str     lr, [r4]
        ldr     lr, [r5]
        sub     lr, lr, #4
        str     lr, [r5]
LLBH19:
        cmp     r10, #0
        beq     LLBH27
        mov     lr, #0xF1
        orr     lr, lr, #0xF, 20
        mov     r0, #1
LLBH20:
        cmp     r10, #1
        ble     LLBH25
        cmp     r12, #0
        ble     LLBH25
        ldr     r8, [r7, +r12, lsl #2]
        cmp     r8, #0
        beq     LLBH42
        ldr     r2, [r4]
        ldr     r1, [r8]
        subs    r2, r2, r1
        bmi     LLBH35
        str     r2, [r4]
        ldr     r3, [r5]
        add     r2, r2, #1
        ldr     r3, [r3]
        mov     r2, r3, lsr r2
LLBH21:
        mov     r1, r0, lsl r1
        sub     r1, r1, #1
        and     r1, r1, r2
        add     r2, r8, #4
        ldr     r1, [r2, +r1, lsl #2]
        and     r3, r1, #0xFF
        tst     r3, #0x80
        mov     r1, r1, asr #8
        beq     LLBH24
        str     r11, [sp, #0x1C]
        str     r10, [sp, #0x18]
        str     r9, [sp, #0x10]
        str     r7, [sp, #0xC]
        str     r6, [sp, #8]
LLBH22:
        ldr     r3, [r4]
        ldr     r6, [r8, +r1, lsl #2]
        subs    r3, r3, r6
        bmi     LLBH34
        str     r3, [r4]
        ldr     r7, [r5]
        add     r3, r3, #1
        ldr     r7, [r7]
        mov     r3, r7, lsr r3
LLBH23:
        mov     r6, r0, lsl r6
        sub     r6, r6, #1
        and     r3, r6, r3
        add     r3, r1, r3
        ldr     r6, [r2, +r3, lsl #2]
        and     r3, r6, #0xFF
        tst     r3, #0x80
        mov     r1, r6, asr #8
        bne     LLBH22
        ldr     r11, [sp, #0x1C]
        ldr     r10, [sp, #0x18]
        ldr     r9, [sp, #0x10]
        ldr     r7, [sp, #0xC]
        ldr     r6, [sp, #8]
LLBH24:
        cmp     lr, r1
        beq     LLBH39
        ldr     r8, [r4]
        add     r8, r3, r8
        cmp     r8, #0x1F
        strle   r8, [r4]
        ble     LLBH26
        sub     r8, r8, #0x20
        str     r8, [r4]
        ldr     r8, [r5]
        sub     r8, r8, #4
        str     r8, [r5]
        b       LLBH26
LLBH25:
        mov     r1, r12
LLBH26:
        ldr     r2, [r6]
        add     r8, sp, #0x2C
        ldrsh   r8, [r8, +r11]
        add     r3, r12, r10
        sub     r9, r9, #1
        sub     r12, r12, r1
        mov     r3, r3, lsl #1
        mov     r10, r9, lsl #16
        sub     r1, r3, #2
        add     r11, r11, #2
        movs    r10, r10, asr #16
        strh    r8, [r2, +r1]
        bne     LLBH20
LLBH27:
        ldr     r0, [r6]
        add     r0, r0, #8
        str     r0, [r6]
LLBH28:
        mov     r0, #0
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
LLBH29:
        add     r3, r12, #0x20
        str     r3, [r4]
        ldr     r1, [r5]
        add     r1, r1, #4
        str     r1, [r5]
        b       LLBH3
LLBH30:
        add     r2, r2, #0x20
        str     r2, [r4]
        ldr     r1, [r5]
        add     r1, r1, #4
        str     r1, [r5]
        mov     r0, #0
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
LLBH31:
        add     r11, r12, #0x20
        str     r11, [r4]
        ldr     r1, [r5]
        rsb     r10, r11, #0x1F
        ldr     r0, [r1, #4]
        ldr     r12, [r1], #4
        str     r1, [r5]
        mov     r11, r0, lsr r11
        mov     r10, r12, lsl r10
        add     r11, r10, r11, lsr #1
        b       LLBH11
LLBH32:
        add     r3, r3, #0x20
        str     r3, [r4]
        ldr     r1, [r5]
        rsb     r7, r3, #0x1F
        ldr     r9, [r1, #4]
        ldr     r0, [r1], #4
        str     r1, [r5]
        mov     r3, r9, lsr r3
        mov     r7, r0, lsl r7
        add     r3, r7, r3, lsr #1
        b       LLBH17
LLBH33:
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
        b       LLBH15
LLBH34:
        add     r3, r3, #0x20
        str     r3, [r4]
        ldr     r11, [r5]
        rsb     r7, r3, #0x1F
        ldr     r9, [r11, #4]
        ldr     r10, [r11], #4
        str     r11, [r5]
        mov     r3, r9, lsr r3
        mov     r7, r10, lsl r7
        add     r3, r7, r3, lsr #1
        b       LLBH23
LLBH35:
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
        b       LLBH21
LLBH36:
        add     r3, lr, #0x20
        str     r3, [r4]
        ldr     lr, [r5]
        rsb     r6, r3, #0x1F
        ldr     r1, [lr, #4]
        ldr     r7, [lr], #4
        str     lr, [r5]
        ldr     lr, [r4]
        mov     r3, r1, lsr r3
        mov     r6, r7, lsl r6
        add     r3, r6, r3, lsr #1
        b       LLBH8
LLBH37:
        add     r0, lr, #0x20
        str     r0, [r4]
        ldr     lr, [r5]
        rsb     r1, r0, #0x1F
        str     r1, [sp, #0x28]
        ldr     r1, [lr, #4]
        ldr     r3, [lr], #4
        str     lr, [r5]
        ldr     lr, [r4]
        mov     r0, r1, lsr r0
        ldr     r1, [sp, #0x28]
        mov     r1, r3, lsl r1
        add     r1, r1, r0, lsr #1
        b       LLBH6
LLBH38:
        ldr     r9, [r10, #4]
        mvn     r1, #0
        rsb     r1, r0, r1
        add     r0, r0, #0x20
        mov     lr, lr, lsl r1
        mov     r0, r9, lsr r0
        orr     lr, lr, r0, lsr #1
        b       LLBH2
LLBH39:
        mvn     r0, #0x49
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
LLBH40:
        str     r10, [r5]
        mvn     r0, #0x49
        str     r11, [r4]
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
LLBH41:
        mvn     r0, #0x49
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
LLBH42:
        mvn     r0, #7
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
LLBH43:
        mvn     r0, #7
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
LLBH__GetBlockCoeffs_CAVLC:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        ldr     r12, [sp, #0x40]
        cmp     r2, #0xA
        mov     lr, #0
        movle   r8, lr
        ble     LLBH44
        cmp     r3, #3
        movge   r8, lr
        movlt   r8, #1
LLBH44:
        cmp     r3, #3
        movge   r5, lr
        movlt   r5, #1
        sub     r3, r2, r3
        cmp     r3, #0
        ble     LLBH58
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
LLBH45:
        cmp     r2, #6
        bge     LLBH46
        ldrb    r9, [r2, +r7]
        cmp     r4, r9
        bls     LLBH46
        add     r8, r8, #1
        bic     r2, r8, #0xFF, 8
        bic     r2, r2, #0xFF, 16
LLBH46:
        str     r8, [sp, #8]
LLBH47:
        mvn     r4, #0
LLBH48:
        ldr     r7, [r1]
        subs    r7, r7, #1
        bmi     LLBH60
        str     r7, [r1]
        ldr     r8, [r0]
        add     r7, r7, #1
        ldr     r8, [r8]
        mov     r7, r8, lsr r7
LLBH49:
        tst     r7, #1
        add     r4, r4, #1
        beq     LLBH48
        cmp     r4, #0xF
        bgt     LLBH52
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
        beq     LLBH51
        ldr     r4, [r1]
        subs    r4, r4, r8
        bmi     LLBH55
        str     r4, [r1]
        ldr     r9, [r0]
        add     r4, r4, #1
        ldr     r9, [r9]
        mov     r4, r9, lsr r4
LLBH50:
        mov     r9, #1
        mov     r8, r9, lsl r8
        sub     r8, r8, #1
        and     r4, r4, r8
LLBH51:
        tst     r4, #1
        add     r7, r5, r7
        add     r4, r7, r4, asr #1
        moveq   r5, r4
        rsbne   r5, r4, #0
        b       LLBH54
LLBH52:
        ldr     r8, [r1]
        sub     r7, r4, #3
        subs    r8, r8, r7
        bmi     LLBH59
        str     r8, [r1]
        ldr     r9, [r0]
        add     r8, r8, #1
        ldr     r9, [r9]
        mov     r9, r9, lsr r8
LLBH53:
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
LLBH54:
        mov     lr, lr, lsl #1
        add     r6, r6, #1
        strh    r5, [r12, +lr]
        mov     r7, r6, lsl #16
        mov     lr, r7, asr #16
        cmp     lr, r3
        bge     LLBH58
        cmp     lr, #1
        beq     LLBH56
        ldr     r7, [pc, #0xF4]
        ldr     r8, [sp, #8]
        mov     r5, #0
        b       LLBH45
LLBH55:
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
        b       LLBH50
LLBH56:
        cmp     r4, #3
        bls     LLBH57
        mov     r2, #2
        str     r2, [sp, #8]
        mov     r5, #0
        b       LLBH47
LLBH57:
        ldr     r7, [pc, #0x88]
        ldr     r8, [sp, #8]
        mov     r5, #0
        b       LLBH45
LLBH58:
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LLBH59:
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
        b       LLBH53
LLBH60:
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
        b       LLBH49
        .long   LLBH_ChromaDCRunTable
        .long   LLBH_sadd
        .long   LLBH_vlc_inc


        .data
        .align  4


LLBH_vlc_inc:
        .byte   0x00,0x03,0x06,0x0C,0x18,0x30


        .data
        .align  4


LLBH_ChromaDCRunTable:
        .byte   0x03,0x05,0x02,0x05,0x01,0x04,0x01,0x04,0x00,0x03,0x00,0x03,0x00,0x03,0x00,0x03
LLBH_sadd:
        .byte   0x0F,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LLBH_bitsToGetTbl16s:
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
LLBH_addOffsetTbl16s:
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


