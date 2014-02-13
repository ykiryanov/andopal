        .text
        .align  4
        .globl  exp


exp:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        str     r0, [sp, #0x10]
        mov     r12, #0xFF, 12
        ldr     r3, [pc, #0x558]
        orr     r12, r12, #3, 4
        str     r1, [sp, #0x14]
        mvn     r6, #2, 2
        sub     lr, r12, #0x36, 12
        and     r2, r1, r6
        sub     lr, r2, lr
        cmp     r3, lr
        mov     r3, #0xFF
        orr     r4, r3, #7, 24
        mov     r3, #0
        bcs     LADI4
        sub     r12, r12, #0x36, 12
        cmp     r12, r2
        ble     LADI0
        mov     r0, #0xFE
        orr     r1, r0, #7, 24
        mov     r0, #0
        mov     r1, r1, lsl #19
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LADI0:
        cmp     r2, r4, lsl #20
        ble     LADI2
LADI1:
        orr     r1, r1, #2, 14
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LADI2:
        cmp     r2, r4, lsl #20
        beq     LADI18
        cmp     r2, r1
        bne     LADI3
        ldr     r12, [pc, #0x4E4]
        cmp     r12, r2
        bge     LADI4
        str     r3, [sp, #8]
        add     r1, sp, #0x10
        add     r0, sp, #0x10
        add     r2, sp, #8
        mov     r4, r4, lsl #20
        str     r4, [sp, #0xC]
        mov     r3, #0xE
        bl      __libm_error_support
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #0xC]
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LADI3:
        ldr     r12, [pc, #0x4AC]
        cmp     r12, r2
        ble     LADI17
LADI4:
        mvn     r2, #0xFF, 12
        bic     r2, r2, #0xF, 4
        movs    r8, r1, lsl #1
        and     r2, r1, r2
        moveq   r8, #2, 12
        orrne   r2, r2, #1, 12
        bics    r1, r1, r6
        beq     LADI5
        rsbs    r0, r0, #0
        rsc     r2, r2, #0
LADI5:
        ldr     r12, [pc, #0x47C]
        add     r9, r2, r0, lsr #31
        ldr     r1, [r12]
        ldr     r10, [r12, #8]
        ldr     r11, [r12, #4]
        smull   r7, r2, r1, r0
        smull   r1, r5, r1, r9
        smull   lr, r12, r9, r11
        smull   r11, r0, r0, r11
        smull   r10, r9, r10, r9
        ldr     r11, [pc, #0x458]
        adds    r1, r2, r1
        adc     r2, r5, r2, asr #31
        adds    r1, r1, r12
        adc     r5, r2, r12, asr #31
        adds    lr, r7, lr
        adc     r12, r3, #0
        adds    r2, lr, r0
        adc     r0, r12, r0, asr #31
        adds    r2, r2, r9
        adc     r9, r0, r9, asr #31
        adds    r12, r9, r1
        mov     r1, #0x33
        orr     r1, r1, #1, 22
        adc     r0, r5, r9, asr #31
        sub     r8, r1, r8, lsr #21
        sub     r1, r8, #0x2A
        mov     lr, r0, asr r1
        and     r5, lr, #1
        add     r1, r1, #1
        add     r5, r5, lr, asr #1
        sub     r7, r0, r5, lsl r1
        ldr     r1, [pc, #0x400]
        ldr     r0, [r1, #0x20]
        str     r0, [sp, #4]
        ldr     r0, [r1, #0x1C]
        eor     r1, r7, r7, asr #31
        sub     r1, r1, r7, asr #31
        clz     r1, r1
        sub     lr, r1, #2
        rsb     r9, lr, #0x20
        mov     r10, r2, lsr r9
        add     r8, r8, lr
        ldr     r2, [r11, #0x14]
        orr     r10, r10, r12, lsl lr
        mov     r9, r12, lsr r9
        ldr     r12, [pc, #0x3CC]
        orr     lr, r9, r7, lsl lr
        ldr     r7, [sp, #4]
        add     lr, lr, r10, lsr #31
        sub     r8, r8, #0x23
        sub     r1, r8, #0x20
        smull   r7, r9, lr, r7
        ldr     r8, [r11, #0x18]
        ldr     r11, [r11, #0x10]
        add     r7, r1, #3
        add     r9, r0, r9, asr r7
        smull   r0, r9, lr, r9
        add     r7, r8, r9, asr r7
        smull   r8, r7, lr, r7
        str     r11, [sp]
        smull   r11, r12, r12, r10
        add     r0, r1, #2
        cmp     r0, #0x20
        bgt     LADI6
        rsb     r3, r1, #0x1E
        mov     r8, r8, lsr r0
        orr     r9, r8, r7, lsl r3
        mov     r3, r7, asr r0
        b       LADI7
LADI6:
        cmp     r0, #0x40
        movgt   r9, r3
        bgt     LADI7
        sub     r3, r1, #0x1E
        mov     r8, r7, asr #31
        mov     r7, r7, lsr r3
        rsb     r9, r1, #0x3E
        mov     r3, r8, asr r3
        orr     r9, r7, r8, lsl r9
LADI7:
        ldr     r7, [sp]
        adds    r7, r7, r9
        adc     r3, r2, r3
        adds    r3, r3, r7, lsr #31
        smull   r7, r2, lr, r7
        smull   r3, r7, lr, r3
        ldr     r9, [pc, #0x32C]
        adds    r3, r3, r2
        adc     r8, r7, r2, asr #31
        cmp     r0, #0x20
        ldr     r7, [r9, #0xC]
        ldr     r2, [r9, #8]
        bgt     LADI8
        rsb     r9, r1, #0x1E
        mov     r3, r3, lsr r0
        orr     r9, r3, r8, lsl r9
        mov     r8, r8, asr r0
        b       LADI9
LADI8:
        cmp     r0, #0x40
        movgt   r8, #0
        movgt   r9, r8
        bgt     LADI9
        sub     r10, r1, #0x1E
        mov     r3, r8, asr #31
        mov     r9, r8, lsr r10
        mov     r8, r3, asr r10
        rsb     r10, r1, #0x3E
        orr     r9, r9, r3, lsl r10
LADI9:
        adds    r2, r2, r9
        adc     r8, r7, r8
        adds    r3, r8, r2, lsr #31
        smull   r7, r2, lr, r2
        smull   r7, r3, lr, r3
        ldr     r9, [pc, #0x2C0]
        adds    r8, r7, r2
        adc     r3, r3, r2, asr #31
        ldr     r7, [r9, #4]
        ldr     r2, [r9]
        cmp     r0, #0x20
        bgt     LADI10
        mov     r8, r8, lsr r0
        rsb     r9, r1, #0x1E
        mov     r0, r3, asr r0
        orr     r9, r8, r3, lsl r9
        b       LADI11
LADI10:
        cmp     r0, #0x40
        movgt   r0, #0
        movgt   r9, r0
        bgt     LADI11
        sub     r0, r1, #0x1E
        mov     r8, r3, asr #31
        mov     r3, r3, lsr r0
        rsb     r9, r1, #0x3E
        mov     r0, r8, asr r0
        orr     r9, r3, r8, lsl r9
LADI11:
        adds    r2, r2, r9
        adc     r0, r7, r0
        adds    r3, r0, r2, lsr #31
        smull   r2, r0, lr, r2
        smull   lr, r3, lr, r3
        sub     r7, r1, #1
        mov     r2, r7
        adds    r9, lr, r0
        adc     lr, r3, r0, asr #31
        smull   r1, r0, r12, lr
        mov     r1, r0, asr #31
        adds    r9, r9, r12
        mov     r8, r7, asr #31
        adc     r10, lr, r12, asr #31
        mov     r3, r8
        bl      __ashrdi3
        ldr     r12, [pc, #0x230]
        adds    r0, r9, r0
        and     lr, r5, #0x3F
        adc     r1, r10, r1
        ldr     r10, [r12, +lr, lsl #3]
        add     r9, r12, lr, lsl #3
        ldr     r9, [r9, #4]
        add     r12, r1, r0, lsr #31
        mov     r5, r5, asr #6
        smull   lr, r1, r12, r9
        add     lr, r10, r9, lsr #31
        smull   r11, r0, r0, lr
        smull   lr, r12, r12, lr
        mov     r2, r7
        mov     r3, r8
        rsb     r5, r5, #0x3E
        adds    lr, lr, r0
        adc     r12, r12, r0, asr #31
        adds    r0, lr, r1
        adc     r1, r12, r1, asr #31
        bl      __ashrdi3
        adds    r9, r0, r9
        adc     r10, r1, r10
        bics    r6, r10, r6
        beq     LADI12
        rsbs    r9, r9, #0
        rsc     r10, r10, #0
LADI12:
        sub     r0, r4, #0xF3, 30
        clz     r1, r10
        add     r0, r0, #9
        cmp     r1, #0x20
        rsb     r5, r5, r0
        mov     r2, #0
        beq     LADI22
LADI13:
        sub     r0, r1, #1
        rsb     r1, r0, #0x20
        mov     r1, r9, lsr r1
        orr     r10, r1, r10, lsl r0
        subs    r1, r5, r0
        mov     r0, r9, lsl r0
        bpl     LADI15
        rsb     r1, r1, #0
        cmp     r1, #0x20
        blt     LADI14
        mov     r0, r10
        mov     r10, r10, asr #31
        sub     r1, r1, #0x20
LADI14:
        cmp     r1, #0x20
        mov     r3, #0x20
        movgt   r1, r3
        mov     r0, r0, lsr r1
        rsb     r3, r1, #0x20
        orr     r0, r0, r10, lsl r3
        mov     r10, r10, asr r1
        mov     r1, #0
LADI15:
        mov     r3, r0, lsr #9
        mov     r12, r10, lsl #22
        orr     r0, r12, r0, lsr #10
        and     r3, r3, #1
        adds    r0, r3, r0
        mov     r10, r10, lsr #10
        adc     r3, r10, r3, asr #31
        orrs    r12, r3, r3, asr #31
        moveq   r1, #0
        beq     LADI16
        sub     r12, r4, #1
        cmp     r12, r1
        bgt     LADI16
        mov     r0, #0
        mov     r1, r4
        mov     r3, r0
LADI16:
        add     r1, r3, r1, lsl #20
        orr     r6, r1, r6
        adds    r3, r6, #1, 12
        bmi     LADI21
        cmp     r6, #1, 12
        blt     LADI20
        mov     r1, r6
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LADI17:
        str     r3, [sp, #8]
        add     r1, sp, #0x10
        add     r0, sp, #0x10
        add     r2, sp, #8
        str     r3, [sp, #0xC]
        mov     r3, #0xF
        bl      __libm_error_support
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #0xC]
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LADI18:
        cmp     r0, #0
        bne     LADI1
        bics    r6, r1, r6
        beq     LADI19
        mov     r0, #0
        mov     r1, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LADI19:
        mov     r1, r2
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LADI20:
        str     r0, [sp, #8]
        add     r2, sp, #0x10
        add     r3, sp, #8
        mov     r0, r2
        add     r1, sp, #0x10
        mov     r2, r3
        str     r6, [sp, #0xC]
        mov     r3, #0xF
        bl      __libm_error_support
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #0xC]
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LADI21:
        str     r2, [sp, #8]
        add     r1, sp, #0x10
        add     r0, sp, #0x10
        add     r2, sp, #8
        mov     r4, r4, lsl #20
        str     r4, [sp, #0xC]
        mov     r3, #0xE
        bl      __libm_error_support
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #0xC]
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LADI22:
        clz     r0, r9
        cmp     r0, #0
        beq     LADI13
        mov     r10, r9
        sub     r5, r5, #0x20
        mov     r1, r0
        mov     r9, #0
        b       LADI13
        .long   0x03f6232a
        .long   0x40862e42
        .long   0x40875427
        .long   LADI_L2E
        .long   __intel_exp_coeffs
        .long   0x58b90bfc
        .long   __intel_dbl_T_2f


        .data
        .align  4


LADI_L2E:
        .byte   0xCA,0x8E,0x2A,0x2E,0x2F,0xFC,0x05,0x57,0xB4,0xFF,0xA1,0xEF


