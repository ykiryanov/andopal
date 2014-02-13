        .text
        .align  4
        .globl  exp10


exp10:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        str     r0, [sp, #0x10]
        mov     r12, #0xFF, 12
        ldr     r2, [pc, #0x50C]
        orr     r12, r12, #3, 4
        str     r1, [sp, #0x14]
        mvn     r6, #2, 2
        sub     lr, r12, #0xE, 10
        and     r3, r1, r6
        sub     lr, r3, lr
        cmp     r2, lr
        mov     r2, #0xFF
        orr     r4, r2, #7, 24
        mov     r2, #0
        bcs     LADG4
        sub     r12, r12, #0x36, 12
        cmp     r12, r3
        ble     LADG0
        mov     r0, #0xFE
        orr     r1, r0, #7, 24
        mov     r0, #0
        mov     r1, r1, lsl #19
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LADG0:
        cmp     r3, r4, lsl #20
        ble     LADG2
LADG1:
        orr     r1, r1, #2, 14
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LADG2:
        cmp     r3, r4, lsl #20
        beq     LADG18
        cmp     r3, r1
        bne     LADG3
        ldr     r12, [pc, #0x498]
        cmp     r12, r3
        bge     LADG4
        str     r2, [sp, #8]
        add     r1, sp, #0x10
        add     r0, sp, #0x10
        add     r2, sp, #8
        mov     r4, r4, lsl #20
        str     r4, [sp, #0xC]
        mov     r3, #0xA6
        bl      __libm_error_support
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #0xC]
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LADG3:
        ldr     r12, [pc, #0x460]
        cmp     r12, r3
        bgt     LADG4
        mov     r0, #0
        mov     r1, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LADG4:
        mvn     r3, #0xFF, 12
        bic     r3, r3, #0xF, 4
        movs    r8, r1, lsl #1
        and     r3, r1, r3
        moveq   r8, #2, 12
        orrne   r3, r3, #1, 12
        bics    r1, r1, r6
        beq     LADG5
        rsbs    r0, r0, #0
        rsc     r3, r3, #0
LADG5:
        ldr     r12, [pc, #0x420]
        add     r9, r3, r0, lsr #31
        ldr     r1, [r12]
        ldr     r11, [r12, #4]
        ldr     r10, [r12, #8]
        smull   r7, r3, r1, r0
        smull   r1, r5, r1, r9
        smull   lr, r12, r9, r11
        smull   r11, r0, r0, r11
        smull   r10, r9, r10, r9
        adds    r1, r3, r1
        adc     r3, r5, r3, asr #31
        adds    r1, r1, r12
        adc     r3, r3, r12, asr #31
        adds    r7, r7, lr
        adc     lr, r2, #0
        adds    r12, r7, r0
        adc     lr, lr, r0, asr #31
        adds    r0, r12, r9
        adc     r9, lr, r9, asr #31
        adds    r12, r9, r1
        mov     r1, #0x33
        orr     r1, r1, #1, 22
        adc     r3, r3, r9, asr #31
        sub     r1, r1, r8, lsr #21
        sub     lr, r1, #0x2B
        mov     r5, r3, asr lr
        and     r7, r5, #1
        add     lr, lr, #1
        add     r5, r7, r5, asr #1
        sub     r8, r3, r5, lsl lr
        ldr     r3, [pc, #0x3A8]
        ldr     lr, [r3, #0x20]
        ldr     r3, [r3, #0x1C]
        str     r3, [sp]
        eor     r3, r8, r8, asr #31
        sub     r3, r3, r8, asr #31
        clz     r3, r3
        sub     r7, r3, #2
        rsb     r9, r7, #0x20
        mov     r10, r0, lsr r9
        add     r1, r1, r7
        ldr     r0, [pc, #0x37C]
        orr     r10, r10, r12, lsl r7
        mov     r9, r12, lsr r9
        ldr     r3, [r0, #0x18]
        ldr     r12, [pc, #0x370]
        orr     r7, r9, r8, lsl r7
        add     r7, r7, r10, lsr #31
        smull   lr, r8, r7, lr
        smull   r11, r12, r12, r10
        ldr     r9, [sp]
        sub     r1, r1, #0x24
        sub     r1, r1, #0x20
        add     lr, r1, #3
        add     r8, r9, r8, asr lr
        smull   r9, r8, r7, r8
        str     r3, [sp, #4]
        ldr     r9, [sp, #4]
        ldr     r3, [r0, #0x14]
        ldr     r0, [r0, #0x10]
        add     lr, r9, r8, asr lr
        smull   r9, r8, r7, lr
        add     lr, r1, #2
        cmp     lr, #0x20
        bgt     LADG6
        mov     r9, r9, lsr lr
        rsb     r2, r1, #0x1E
        orr     r9, r9, r8, lsl r2
        mov     r2, r8, asr lr
        b       LADG7
LADG6:
        cmp     lr, #0x40
        movgt   r9, r2
        bgt     LADG7
        sub     r2, r1, #0x1E
        mov     r9, r8, asr #31
        mov     r8, r8, lsr r2
        mov     r2, r9, asr r2
        rsb     r10, r1, #0x3E
        orr     r9, r8, r9, lsl r10
LADG7:
        adds    r0, r0, r9
        adc     r2, r3, r2
        adds    r2, r2, r0, lsr #31
        smull   r3, r0, r7, r0
        smull   r2, r3, r7, r2
        ldr     r9, [pc, #0x2D0]
        adds    r2, r2, r0
        adc     r8, r3, r0, asr #31
        cmp     lr, #0x20
        ldr     r3, [r9, #0xC]
        ldr     r0, [r9, #8]
        bgt     LADG8
        rsb     r9, r1, #0x1E
        mov     r2, r2, lsr lr
        orr     r9, r2, r8, lsl r9
        mov     r8, r8, asr lr
        b       LADG9
LADG8:
        cmp     lr, #0x40
        movgt   r8, #0
        movgt   r9, r8
        bgt     LADG9
        sub     r10, r1, #0x1E
        mov     r2, r8, asr #31
        mov     r9, r8, lsr r10
        mov     r8, r2, asr r10
        rsb     r10, r1, #0x3E
        orr     r9, r9, r2, lsl r10
LADG9:
        adds    r0, r0, r9
        adc     r8, r3, r8
        adds    r2, r8, r0, lsr #31
        smull   r3, r0, r7, r0
        smull   r3, r2, r7, r2
        ldr     r9, [pc, #0x264]
        adds    r8, r3, r0
        adc     r2, r2, r0, asr #31
        ldr     r3, [r9, #4]
        ldr     r0, [r9]
        cmp     lr, #0x20
        bgt     LADG10
        mov     r8, r8, lsr lr
        rsb     r9, r1, #0x1E
        mov     lr, r2, asr lr
        orr     r9, r8, r2, lsl r9
        b       LADG11
LADG10:
        cmp     lr, #0x40
        movgt   lr, #0
        movgt   r9, lr
        bgt     LADG11
        sub     lr, r1, #0x1E
        mov     r8, r2, asr #31
        mov     r2, r2, lsr lr
        rsb     r9, r1, #0x3E
        mov     lr, r8, asr lr
        orr     r9, r2, r8, lsl r9
LADG11:
        adds    r0, r0, r9
        adc     lr, r3, lr
        adds    r2, lr, r0, lsr #31
        smull   r3, r0, r7, r0
        smull   lr, r3, r7, r2
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
        ldr     r12, [pc, #0x1D4]
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
        beq     LADG12
        rsbs    r9, r9, #0
        rsc     r10, r10, #0
LADG12:
        sub     r0, r4, #0xF3, 30
        clz     r1, r10
        add     r0, r0, #9
        cmp     r1, #0x20
        rsb     r5, r5, r0
        mov     r2, #0
        beq     LADG21
LADG13:
        sub     r0, r1, #1
        rsb     r1, r0, #0x20
        mov     r1, r9, lsr r1
        orr     r10, r1, r10, lsl r0
        subs    r1, r5, r0
        mov     r0, r9, lsl r0
        bpl     LADG15
        rsb     r1, r1, #0
        cmp     r1, #0x20
        blt     LADG14
        mov     r0, r10
        mov     r10, r10, asr #31
        sub     r1, r1, #0x20
LADG14:
        cmp     r1, #0x20
        mov     r3, #0x20
        movgt   r1, r3
        mov     r0, r0, lsr r1
        rsb     r3, r1, #0x20
        orr     r0, r0, r10, lsl r3
        mov     r10, r10, asr r1
        mov     r1, #0
LADG15:
        mov     r3, r0, lsr #9
        mov     r12, r10, lsl #22
        orr     r0, r12, r0, lsr #10
        and     r3, r3, #1
        adds    r0, r3, r0
        mov     r10, r10, lsr #10
        adc     r3, r10, r3, asr #31
        orrs    r12, r3, r3, asr #31
        moveq   r1, #0
        beq     LADG16
        sub     r12, r4, #1
        cmp     r12, r1
        bgt     LADG16
        mov     r0, #0
        mov     r1, r4
        mov     r3, r0
LADG16:
        add     r1, r3, r1, lsl #20
        orr     r1, r1, r6
        adds    r3, r1, #1, 12
        bmi     LADG20
        cmp     r1, #1, 12
        bge     LADG17
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LADG17:
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LADG18:
        cmp     r0, #0
        bne     LADG1
        bics    r6, r1, r6
        beq     LADG19
        mov     r0, #0
        mov     r1, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LADG19:
        mov     r1, r3
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LADG20:
        str     r2, [sp, #8]
        add     r1, sp, #0x10
        add     r0, sp, #0x10
        add     r2, sp, #8
        mov     r4, r4, lsl #20
        str     r4, [sp, #0xC]
        mov     r3, #0xA6
        bl      __libm_error_support
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #0xC]
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LADG21:
        clz     r0, r9
        cmp     r0, #0
        beq     LADG13
        mov     r10, r9
        sub     r5, r5, #0x20
        mov     r1, r0
        mov     r9, #0
        b       LADG13
        .long   0x0416232b
        .long   0x40734413
        .long   0x40743e88
        .long   LADG_L2_10
        .long   __intel_exp_coeffs
        .long   0x58b90bfc
        .long   __intel_dbl_T_2f


        .data
        .align  4


LADG_L2_10:
        .byte   0x13,0x9E,0x26,0x35,0xC0,0xE2,0x46,0xF3,0x00,0x00,0x50,0x92


