        .text
        .align  4
        .globl  expm1


expm1:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        ldr     r3, [pc, #0x900]
        str     r0, [sp, #0x10]
        mov     r2, r1
        mov     lr, #0xE2, 14
        str     r1, [sp, #0x14]
        mvn     r12, #2, 2
        orr     lr, lr, #0xF, 6
        and     r1, r2, r12
        sub     r4, r1, lr
        cmp     r3, r4
        mov     r3, #0xFF, 12
        mov     r4, #0xFF
        orr     r5, r3, #7, 4
        orr     r4, r4, #7, 24
        mvn     r6, #0
        mov     r3, #0
        bcs     LADC14
        sub     r7, lr, #0xBE, 14
        cmp     r7, r1
        bgt     LADC13
        cmp     lr, r1
        ble     LADC9
        add     r6, r6, #1, 12
        movs    lr, r2, lsl #1
        and     r5, r2, r6
        moveq   lr, #2, 12
        orrne   r5, r5, #1, 12
        bics    r12, r2, r12
        beq     LADC0
        rsbs    r0, r0, #0
        rsc     r5, r5, #0
LADC0:
        mov     r2, r0, lsr #23
        orr     r6, r2, r5, lsl #9
        mov     r5, r0, lsl #9
        cmp     r1, #0x3E, 8
        add     r12, r6, r5, lsr #31
        smull   r0, r1, r12, r12
        sub     r4, r4, #0xF3, 30
        sub     r4, r4, lr, lsr #21
        sub     r4, r4, #0x37
        add     r2, r4, #1
        bge     LADC1
        mov     r3, r2, asr #31
        bl      __ashrdi3
        adds    r5, r5, r0
        adc     r6, r6, r1
        b       LADC3
LADC1:
        ldr     lr, [pc, #0x848]
        ldr     r6, [pc, #0x848]
        ldr     r10, [pc, #0x848]
        ldr     r7, [pc, #0x848]
        add     r8, r4, #5
        mov     r8, r12, asr r8
        add     r8, r8, #1, 2
        umull   r8, lr, lr, r8
        smull   r8, lr, r12, lr
        umull   r8, r9, r7, r0
        str     r9, [sp]
        umull   r8, r9, r7, r1
        add     r7, r4, #2
        add     lr, r6, lr, asr r7
        smull   lr, r6, r12, lr
        add     r6, r10, r6, asr r7
        smull   lr, r6, r12, r6
        smull   r10, lr, r6, r1
        rsb     r6, r4, #0x1F
        rsb     r11, r4, #0x1E
        str     r11, [sp, #4]
        mov     r10, r10, lsr r2
        orr     r10, r10, lr, lsl r6
        adds    r11, r10, r0
        adc     r10, r1, lr, asr r2
        ldr     lr, [sp, #4]
        mov     r11, r11, lsr r7
        orr     lr, r11, r10, lsl lr
        adds    lr, lr, #0
        adc     r7, r12, r10, asr r7
        adds    r8, r8, r9
        adc     r10, r9, #0
        ldr     r9, [sp]
        adds    r9, r9, r8
        adc     r8, r10, #0
        umull   r10, lr, lr, r8
        umull   r10, r11, r7, r9
        adds    lr, r11, lr
        umull   r11, r10, r7, r8
        adc     r3, r3, #0
        adds    lr, r11, lr
        adc     r3, r10, r3
        cmp     r7, #0
        blt     LADC34
LADC2:
        rsb     r7, r4, #0x20
        mov     lr, lr, lsr r4
        orr     r7, lr, r3, lsl r7
        adds    r7, r0, r7
        adc     r3, r1, r3, asr r4
        mov     r7, r7, lsr r2
        orr     r6, r7, r3, lsl r6
        adds    r0, r6, #0
        adc     r2, r12, r3, asr r2
        smull   r3, r1, r5, r2
        adds    r0, r0, r5
        adc     r2, r2, r5, asr #31
        mov     r1, r1, asr r4
        adds    r5, r1, r0
        adc     r6, r2, r1, asr #31
LADC3:
        mvn     r0, #2, 2
        bics    r1, r6, r0
        beq     LADC4
        rsbs    r5, r5, #0
        rsc     r6, r6, #0
LADC4:
        clz     r0, r6
        cmp     r0, #0x20
        rsb     r4, r4, #0xFF, 30
        beq     LADC33
LADC5:
        sub     r0, r0, #1
        rsb     r2, r0, #0x20
        mov     r2, r5, lsr r2
        orr     r3, r2, r6, lsl r0
        subs    r2, r4, r0
        mov     r0, r5, lsl r0
        bpl     LADC7
        rsb     r2, r2, #0
        cmp     r2, #0x20
        blt     LADC6
        mov     r0, r3
        mov     r3, r3, asr #31
        sub     r2, r2, #0x20
LADC6:
        cmp     r2, #0x20
        mov     r12, #0x20
        movgt   r2, r12
        mov     r0, r0, lsr r2
        rsb     r12, r2, #0x20
        orr     r0, r0, r3, lsl r12
        mov     r3, r3, asr r2
        mov     r2, #0
LADC7:
        mov     r12, r0, lsr #9
        mov     lr, r3, lsl #22
        orr     r0, lr, r0, lsr #10
        and     r12, r12, #1
        adds    r0, r12, r0
        mov     r3, r3, lsr #10
        adc     r12, r3, r12, asr #31
        orrs    r3, r12, r12, asr #31
        moveq   r2, #0
        beq     LADC8
        mov     r3, #0xFF
        orr     r3, r3, #7, 24
        sub     r3, r3, #1
        cmp     r3, r2
        bgt     LADC8
        mvn     r2, #0
        mov     r0, #0
        add     r2, r2, #2, 22
        mov     r12, r0
LADC8:
        add     r2, r12, r2, lsl #20
        orr     r1, r2, r1
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LADC9:
        cmp     r1, r4, lsl #20
        ble     LADC11
LADC10:
        orr     r1, r2, #2, 14
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LADC11:
        cmp     r1, r4, lsl #20
        beq     LADC36
        cmp     r1, r2
        bne     LADC12
        ldr     lr, [pc, #0x674]
        cmp     lr, r1
        bge     LADC14
        str     r3, [sp, #8]
        add     r1, sp, #0x10
        add     r0, sp, #0x10
        add     r2, sp, #8
        mov     r4, r4, lsl #20
        str     r4, [sp, #0xC]
        mov     r3, #0x29
        bl      __libm_error_support
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #0xC]
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LADC12:
        ldr     lr, [pc, #0x63C]
        cmp     lr, r1
        ble     LADC35
        b       LADC14
LADC13:
        mov     r1, r2
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LADC14:
        mov     lr, #0xFF, 12
        orr     lr, lr, #0xB, 4
        add     lr, lr, #0x15, 14
        cmp     lr, r2
        bls     LADC32
        add     lr, r6, #1, 12
        movs    r8, r2, lsl #1
        and     lr, r2, lr
        moveq   r8, #2, 12
        orrne   lr, lr, #1, 12
        bics    r12, r2, r12
        beq     LADC15
        rsbs    r0, r0, #0
        rsc     lr, lr, #0
LADC15:
        ldr     r2, [pc, #0x5EC]
        add     r9, lr, r0, lsr #31
        ldr     r1, [r2]
        ldr     r10, [r2, #8]
        ldr     r11, [r2, #4]
        smull   r7, r2, r0, r1
        smull   r1, r5, r1, r9
        smull   lr, r12, r9, r11
        smull   r10, r9, r10, r9
        smull   r11, r0, r0, r11
        ldr     r11, [pc, #0x5C8]
        adds    r1, r2, r1
        adc     r2, r5, r2, asr #31
        adds    r1, r1, r12
        adc     r2, r2, r12, asr #31
        adds    r7, r7, lr
        adc     lr, r3, #0
        adds    r12, r7, r0
        adc     lr, lr, r0, asr #31
        adds    r0, r12, r9
        adc     r9, lr, r9, asr #31
        adds    r12, r9, r1
        mov     r1, #0x33
        orr     r1, r1, #1, 22
        adc     r2, r2, r9, asr #31
        sub     r8, r1, r8, lsr #21
        sub     r1, r8, #0x2A
        mov     lr, r2, asr r1
        and     r5, lr, #1
        add     r1, r1, #1
        add     r5, r5, lr, asr #1
        sub     r7, r2, r5, lsl r1
        ldr     r1, [pc, #0x570]
        ldr     r2, [r1, #0x20]
        ldr     r1, [r1, #0x1C]
        str     r1, [sp, #4]
        eor     r1, r7, r7, asr #31
        sub     r1, r1, r7, asr #31
        clz     r1, r1
        sub     lr, r1, #2
        rsb     r9, lr, #0x20
        mov     r10, r0, lsr r9
        ldr     r0, [r11, #0x14]
        orr     r10, r10, r12, lsl lr
        add     r8, r8, lr
        mov     r9, r12, lsr r9
        ldr     r12, [pc, #0x53C]
        orr     lr, r9, r7, lsl lr
        add     lr, lr, r10, lsr #31
        smull   r2, r7, lr, r2
        ldr     r9, [sp, #4]
        sub     r1, r8, #0x23
        ldr     r8, [r11, #0x18]
        sub     r2, r1, #0x1D
        add     r7, r9, r7, asr r2
        smull   r7, r9, lr, r7
        str     r0, [sp]
        ldr     r0, [r11, #0x10]
        smull   r11, r12, r12, r10
        add     r2, r8, r9, asr r2
        smull   r8, r7, lr, r2
        sub     r2, r1, #0x1E
        cmp     r2, #0x20
        bgt     LADC16
        mov     r8, r8, lsr r2
        rsb     r3, r1, #0x3E
        orr     r8, r8, r7, lsl r3
        mov     r3, r7, asr r2
        b       LADC17
LADC16:
        cmp     r2, #0x40
        movgt   r8, r3
        bgt     LADC17
        sub     r3, r1, #0x3E
        mov     r8, r7, asr #31
        mov     r7, r7, lsr r3
        mov     r3, r8, asr r3
        rsb     r9, r1, #0x5E
        orr     r8, r7, r8, lsl r9
LADC17:
        ldr     r7, [sp]
        adds    r0, r0, r8
        ldr     r9, [pc, #0x4B0]
        adc     r3, r7, r3
        adds    r3, r3, r0, lsr #31
        smull   r7, r0, lr, r0
        smull   r3, r7, lr, r3
        adds    r3, r3, r0
        adc     r8, r7, r0, asr #31
        ldr     r7, [r9, #0xC]
        ldr     r0, [r9, #8]
        cmp     r2, #0x20
        bgt     LADC18
        rsb     r9, r1, #0x3E
        mov     r3, r3, lsr r2
        orr     r9, r3, r8, lsl r9
        mov     r8, r8, asr r2
        b       LADC19
LADC18:
        cmp     r2, #0x40
        movgt   r8, #0
        movgt   r9, r8
        bgt     LADC19
        sub     r10, r1, #0x3E
        mov     r3, r8, asr #31
        mov     r9, r8, lsr r10
        mov     r8, r3, asr r10
        rsb     r10, r1, #0x5E
        orr     r9, r9, r3, lsl r10
LADC19:
        adds    r0, r0, r9
        adc     r8, r7, r8
        adds    r3, r8, r0, lsr #31
        smull   r7, r0, lr, r0
        smull   r7, r3, lr, r3
        ldr     r9, [pc, #0x434]
        adds    r8, r7, r0
        adc     r3, r3, r0, asr #31
        ldr     r7, [r9, #4]
        ldr     r0, [r9]
        cmp     r2, #0x20
        bgt     LADC20
        mov     r8, r8, lsr r2
        rsb     r9, r1, #0x3E
        mov     r2, r3, asr r2
        orr     r9, r8, r3, lsl r9
        b       LADC21
LADC20:
        cmp     r2, #0x40
        movgt   r2, #0
        movgt   r9, r2
        bgt     LADC21
        sub     r2, r1, #0x3E
        mov     r8, r3, asr #31
        mov     r3, r3, lsr r2
        rsb     r9, r1, #0x5E
        mov     r2, r8, asr r2
        orr     r9, r3, r8, lsl r9
LADC21:
        adds    r0, r0, r9
        adc     r2, r7, r2
        adds    r2, r2, r0, lsr #31
        smull   r3, r0, lr, r0
        smull   r3, lr, lr, r2
        sub     r7, r1, #0x21
        mov     r2, r7
        mov     r11, r5, asr #6
        adds    r3, r3, r0
        adc     lr, lr, r0, asr #31
        smull   r1, r0, r12, lr
        mov     r1, r0, asr #31
        adds    r8, r3, r12
        mov     r3, r7, asr #31
        adc     r9, lr, r12, asr #31
        bl      __ashrdi3
        ldr     r12, [pc, #0x3A4]
        adds    lr, r8, r0
        and     r3, r5, #0x3F
        ldr     r8, [r12, +r3, lsl #3]
        adc     r10, r9, r1
        add     r12, r12, r3, lsl #3
        ldr     r9, [r12, #4]
        add     r10, r10, lr, lsr #31
        mov     r12, #0
        smull   r5, r0, r10, r9
        add     r5, r8, r9, lsr #31
        smull   r1, lr, lr, r5
        smull   r10, r1, r10, r5
        rsb     r5, r11, #0x3E
        adds    r10, r10, lr
        adc     lr, r1, lr, asr #31
        adds    r10, r10, r0
        str     r10, [sp]
        adc     r10, lr, r0, asr #31
        cmp     r11, #0
        blt     LADC41
        cmp     r11, #0x3F
        bge     LADC22
        mov     r2, r5
        mov     r0, #1
        mov     r1, #0
        mov     r3, #0
        bl      __ashldi3
        subs    r9, r9, r0
        sbc     r8, r8, r1
        clz     r0, r8
        cmp     r0, #2
        mov     r3, #2
        movgt   r3, r0
        sub     r12, r3, #2
        rsb     r0, r12, #0x20
        mov     r0, r9, lsr r0
        cmp     r11, #0
        add     r5, r5, r12
        orr     r8, r0, r8, lsl r12
        mov     r9, r9, lsl r12
        bne     LADC22
        cmp     r12, #6
        beq     LADC37
LADC22:
        cmp     r7, r12
        blt     LADC23
        ldr     r0, [sp]
        sub     r2, r7, r12
        mov     r1, r10
        mov     r3, r2, asr #31
        bl      __ashrdi3
        adds    r0, r0, r9
        adc     r1, r1, r8
        b       LADC24
LADC23:
        sub     r2, r12, r7
        add     r7, r5, r7
        mov     r3, r2, asr #31
        mov     r0, r9
        mov     r1, r8
        sub     r5, r7, r12
        bl      __ashrdi3
        ldr     r3, [sp]
        adds    r0, r3, r0
        adc     r1, r10, r1
LADC24:
        cmn     r11, #1
        bge     LADC25
        rsb     r2, r11, r6
        mov     r3, r2, asr #31
        bl      __ashrdi3
        adds    r0, r0, #0
        adc     r1, r1, #2, 2
        mov     r5, #0x3F
LADC25:
        mvn     r3, #2, 2
        bics    r3, r1, r3
        beq     LADC26
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
LADC26:
        sub     r12, r4, #0xF3, 30
        clz     lr, r1
        add     r12, r12, #9
        cmp     lr, #0x20
        rsb     r5, r5, r12
        mov     r2, #0
        beq     LADC40
LADC27:
        sub     lr, lr, #1
        rsb     r12, lr, #0x20
        mov     r12, r0, lsr r12
        orr     r12, r12, r1, lsl lr
        subs    r1, r5, lr
        mov     r0, r0, lsl lr
        bpl     LADC29
        rsb     r1, r1, #0
        cmp     r1, #0x20
        blt     LADC28
        mov     r0, r12
        mov     r12, r12, asr #31
        sub     r1, r1, #0x20
LADC28:
        cmp     r1, #0x20
        mov     lr, #0x20
        movgt   r1, lr
        mov     r0, r0, lsr r1
        rsb     lr, r1, #0x20
        orr     r0, r0, r12, lsl lr
        mov     r12, r12, asr r1
        mov     r1, #0
LADC29:
        mov     lr, r0, lsr #9
        mov     r5, r12, lsl #22
        orr     r0, r5, r0, lsr #10
        and     lr, lr, #1
        adds    r0, lr, r0
        mov     r12, r12, lsr #10
        adc     lr, r12, lr, asr #31
        orrs    r12, lr, lr, asr #31
        moveq   r1, #0
        beq     LADC30
        sub     r12, r4, #1
        cmp     r12, r1
        bgt     LADC30
        mov     r0, #0
        mov     r1, r4
        mov     lr, r0
LADC30:
        add     r1, lr, r1, lsl #20
        orr     r3, r1, r3
        cmp     r3, #0
        ble     LADC31
        adds    r12, r3, #1, 12
        bmi     LADC39
LADC31:
        cmp     r3, #1, 12
        blt     LADC38
        mov     r1, r3
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LADC32:
        add     r1, r5, #1, 2
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LADC33:
        clz     r2, r5
        cmp     r2, #0
        beq     LADC5
        mov     r6, r5
        sub     r4, r4, #0x20
        mov     r0, r2
        mov     r5, #0
        b       LADC5
LADC34:
        subs    lr, lr, r9
        sbc     r3, r3, r8
        b       LADC2
LADC35:
        str     r3, [sp, #8]
        add     r1, sp, #0x10
        add     r0, sp, #0x10
        add     r2, sp, #8
        eor     r5, r5, #3, 2
        str     r5, [sp, #0xC]
        mov     r3, #0x2A
        bl      __libm_error_support
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #0xC]
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LADC36:
        cmp     r0, #0
        bne     LADC10
        bics    r12, r2, r12
        addne   r1, r5, #1, 2
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LADC37:
        mvn     r3, #0x3F
        adds    r3, r9, r3
        adc     r8, r8, r6
        orr     r9, r3, #0x2F
        b       LADC22
LADC38:
        str     r0, [sp, #8]
        add     r2, sp, #0x10
        add     r1, sp, #0x10
        mov     r0, r2
        str     r3, [sp, #0xC]
        add     r4, sp, #8
        mov     r2, r4
        mov     r3, #0x2A
        bl      __libm_error_support
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #0xC]
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LADC39:
        str     r2, [sp, #8]
        add     r1, sp, #0x10
        add     r0, sp, #0x10
        add     r2, sp, #8
        add     r6, r6, #2, 22
        mov     r6, r6, lsl #20
        str     r6, [sp, #0xC]
        mov     r3, #0x29
        bl      __libm_error_support
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #0xC]
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LADC40:
        clz     r12, r0
        cmp     r12, #0
        beq     LADC27
        mov     r1, r0
        sub     r5, r5, #0x20
        mov     lr, r12
        mov     r0, #0
        b       LADC27
LADC41:
        cmn     r11, #1
        bne     LADC22
        cmp     r3, #0x3B
        blt     LADC42
        mov     r3, r9, lsr #28
        mov     r9, r9, lsl #4
        orr     r8, r3, r8, lsl #4
        add     r5, r5, #4
        orr     r9, r9, #4
        mov     r12, #4
        b       LADC22
LADC42:
        cmp     r3, #0x28
        orrlt   r8, r8, #2, 2
        blt     LADC22
        mov     r3, r9, lsr #31
        orr     r8, r3, r8, lsl #1
        mov     r9, r9, lsl #1
        add     r5, r5, #1
        mov     r12, #1
        b       LADC22
        .long   0x00fe232a
        .long   0x9c09c09c
        .long   0x44444444
        .long   0x66666666
        .long   0x55555555
        .long   0x40862e42
        .long   0x40875427
        .long   LADC_L2E
        .long   __intel_exp_coeffs
        .long   0x58b90bfc
        .long   __intel_dbl_T_2f


        .data
        .align  4


LADC_L2E:
        .byte   0xCA,0x8E,0x2A,0x2E,0x2F,0xFC,0x05,0x57,0xB4,0xFF,0xA1,0xEF


