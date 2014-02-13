        .text
        .align  4
        .globl  exp2


exp2:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        mov     r12, #0xFF, 12
        str     r0, [sp, #8]
        orr     r2, r12, #3, 4
        mov     r4, r1
        str     r1, [sp, #0xC]
        mvn     r8, #2, 2
        sub     r3, r2, #0x36, 12
        mov     r12, #0xFF, 20
        and     r1, r4, r8
        sub     r3, r1, r3
        orr     r12, r12, #0x3F, 12
        cmp     r12, r3
        mov     r3, #0xFF
        orr     r6, r3, #7, 24
        mov     r3, #0
        bcs     LADH6
        sub     r12, r2, #0x36, 12
        cmp     r12, r1
        ble     LADH0
        mov     r1, r2
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LADH0:
        cmp     r1, r6, lsl #20
        ble     LADH2
LADH1:
        orr     r1, r4, #2, 14
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LADH2:
        cmp     r1, r6, lsl #20
        beq     LADH21
        mov     r2, #9, 12
        cmp     r1, r4
        orr     r2, r2, #1, 2
        bne     LADH3
        cmp     r2, r1
        ble     LADH19
        b       LADH6
LADH3:
        add     r2, r2, #0x33, 22
        cmp     r2, r1
        bge     LADH5
LADH4:
        str     r3, [sp]
        add     r1, sp, #8
        add     r0, sp, #8
        mov     r2, sp
        str     r3, [sp, #4]
        mov     r3, #0xA2
        bl      __libm_error_support
        ldr     r0, [sp]
        ldr     r1, [sp, #4]
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LADH5:
        mov     r2, #0xFE
        orr     r2, r2, #7, 24
        mov     r2, r2, lsl #19
        add     r2, r2, #0xA, 12
        add     r2, r2, #0x33, 22
        cmp     r2, r1
        beq     LADH20
LADH6:
        mvn     r2, #0xFF, 12
        bic     r2, r2, #0xF, 4
        movs    r12, r4, lsl #1
        and     r2, r4, r2
        moveq   r12, #2, 12
        orrne   r2, r2, #1, 12
        bics    r4, r4, r8
        beq     LADH7
        rsbs    r0, r0, #0
        rsc     r2, r2, #0
LADH7:
        mov     r1, #0x33
        orr     r1, r1, #1, 22
        ldr     lr, [pc, #0x414]
        sub     r1, r1, r12, lsr #21
        mov     r12, r0, lsr #24
        orr     r2, r12, r2, lsl #8
        sub     r12, r1, #0x1F
        mov     r5, r2, asr r12
        and     r4, r5, #1
        add     r12, r12, #1
        add     r7, r4, r5, asr #1
        sub     r12, r2, r7, lsl r12
        ldr     r2, [pc, #0x3F0]
        mov     r5, r0, lsl #8
        eor     r0, r12, r12, asr #31
        sub     r0, r0, r12, asr #31
        clz     r0, r0
        sub     r4, r0, #2
        rsb     r9, r4, #0x20
        mov     r10, r3, lsr r9
        mov     r9, r5, lsr r9
        add     r1, r1, r4
        orr     r5, r10, r5, lsl r4
        orr     r4, r9, r12, lsl r4
        smull   lr, r12, lr, r5
        sub     r1, r1, #0x18
        sub     r0, r1, #0x20
        ldr     r1, [r2, #0x20]
        add     lr, r4, r5, lsr #31
        ldr     r5, [r2, #0x1C]
        smull   r1, r4, lr, r1
        add     r1, r0, #3
        add     r4, r5, r4, asr r1
        smull   r5, r4, lr, r4
        ldr     r5, [r2, #0x18]
        add     r1, r5, r4, asr r1
        smull   r9, r4, lr, r1
        ldr     r5, [r2, #0x14]
        ldr     r2, [r2, #0x10]
        add     r1, r0, #2
        cmp     r1, #0x20
        bgt     LADH8
        mov     r9, r9, lsr r1
        rsb     r3, r0, #0x1E
        orr     r9, r9, r4, lsl r3
        mov     r3, r4, asr r1
        b       LADH9
LADH8:
        cmp     r1, #0x40
        movgt   r9, r3
        bgt     LADH9
        sub     r3, r0, #0x1E
        mov     r9, r4, asr #31
        mov     r4, r4, lsr r3
        mov     r3, r9, asr r3
        rsb     r10, r0, #0x3E
        orr     r9, r4, r9, lsl r10
LADH9:
        adds    r2, r2, r9
        adc     r3, r5, r3
        adds    r3, r3, r2, lsr #31
        smull   r4, r2, lr, r2
        smull   r3, r4, lr, r3
        ldr     r9, [pc, #0x32C]
        adds    r3, r3, r2
        adc     r5, r4, r2, asr #31
        cmp     r1, #0x20
        ldr     r4, [r9, #0xC]
        ldr     r2, [r9, #8]
        bgt     LADH10
        rsb     r9, r0, #0x1E
        mov     r3, r3, lsr r1
        orr     r9, r3, r5, lsl r9
        mov     r5, r5, asr r1
        b       LADH11
LADH10:
        cmp     r1, #0x40
        movgt   r5, #0
        movgt   r9, r5
        bgt     LADH11
        sub     r10, r0, #0x1E
        mov     r3, r5, asr #31
        mov     r9, r5, lsr r10
        mov     r5, r3, asr r10
        rsb     r10, r0, #0x3E
        orr     r9, r9, r3, lsl r10
LADH11:
        adds    r2, r2, r9
        adc     r5, r4, r5
        adds    r3, r5, r2, lsr #31
        smull   r4, r2, lr, r2
        smull   r4, r3, lr, r3
        ldr     r9, [pc, #0x2C0]
        adds    r5, r4, r2
        adc     r3, r3, r2, asr #31
        ldr     r4, [r9, #4]
        ldr     r2, [r9]
        cmp     r1, #0x20
        bgt     LADH12
        mov     r5, r5, lsr r1
        rsb     r9, r0, #0x1E
        mov     r1, r3, asr r1
        orr     r9, r5, r3, lsl r9
        b       LADH13
LADH12:
        cmp     r1, #0x40
        movgt   r1, #0
        movgt   r9, r1
        bgt     LADH13
        sub     r1, r0, #0x1E
        mov     r5, r3, asr #31
        mov     r3, r3, lsr r1
        rsb     r9, r0, #0x3E
        mov     r1, r5, asr r1
        orr     r9, r3, r5, lsl r9
LADH13:
        adds    r2, r2, r9
        adc     r1, r4, r1
        adds    r3, r1, r2, lsr #31
        smull   r2, r1, lr, r2
        smull   lr, r3, lr, r3
        sub     r4, r0, #1
        mov     r2, r4
        adds    r9, lr, r1
        adc     lr, r3, r1, asr #31
        smull   r1, r0, r12, lr
        mov     r1, r0, asr #31
        adds    r9, r9, r12
        mov     r5, r4, asr #31
        adc     r10, lr, r12, asr #31
        mov     r3, r5
        bl      __ashrdi3
        ldr     r12, [pc, #0x22C]
        adds    r0, r9, r0
        and     lr, r7, #0x3F
        adc     r1, r10, r1
        ldr     r10, [r12, +lr, lsl #3]
        add     r9, r12, lr, lsl #3
        ldr     r9, [r9, #4]
        add     r12, r1, r0, lsr #31
        mov     r7, r7, asr #6
        smull   lr, r1, r12, r9
        add     lr, r10, r9, lsr #31
        smull   r11, r0, r0, lr
        smull   lr, r12, r12, lr
        mov     r2, r4
        mov     r3, r5
        rsb     r7, r7, #0x3E
        adds    lr, lr, r0
        adc     r12, r12, r0, asr #31
        adds    r0, lr, r1
        adc     r1, r12, r1, asr #31
        bl      __ashrdi3
        adds    r9, r0, r9
        adc     r10, r1, r10
        bics    r8, r10, r8
        beq     LADH14
        rsbs    r9, r9, #0
        rsc     r10, r10, #0
LADH14:
        sub     r0, r6, #0xF3, 30
        clz     r1, r10
        add     r0, r0, #9
        cmp     r1, #0x20
        rsb     r7, r7, r0
        mov     r2, #0
        beq     LADH25
LADH15:
        sub     r0, r1, #1
        rsb     r1, r0, #0x20
        mov     r1, r9, lsr r1
        orr     r10, r1, r10, lsl r0
        subs    r1, r7, r0
        mov     r0, r9, lsl r0
        bpl     LADH17
        rsb     r1, r1, #0
        cmp     r1, #0x20
        blt     LADH16
        mov     r0, r10
        mov     r10, r10, asr #31
        sub     r1, r1, #0x20
LADH16:
        cmp     r1, #0x20
        mov     r3, #0x20
        movgt   r1, r3
        mov     r0, r0, lsr r1
        rsb     r3, r1, #0x20
        orr     r0, r0, r10, lsl r3
        mov     r10, r10, asr r1
        mov     r1, #0
LADH17:
        mov     r3, r0, lsr #9
        mov     r12, r10, lsl #22
        orr     r0, r12, r0, lsr #10
        and     r3, r3, #1
        adds    r0, r3, r0
        mov     r10, r10, lsr #10
        adc     r3, r10, r3, asr #31
        orrs    r12, r3, r3, asr #31
        moveq   r1, #0
        beq     LADH18
        sub     r12, r6, #1
        cmp     r12, r1
        bgt     LADH18
        mov     r0, #0
        mov     r1, r6
        mov     r3, r0
LADH18:
        add     r1, r3, r1, lsl #20
        orr     r8, r1, r8
        adds    r3, r8, #1, 12
        bmi     LADH24
        cmp     r8, #1, 12
        blt     LADH23
        mov     r1, r8
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LADH19:
        str     r3, [sp]
        add     r1, sp, #8
        add     r0, sp, #8
        mov     r2, sp
        mov     r6, r6, lsl #20
        str     r6, [sp, #4]
        mov     r3, #0xA1
        bl      __libm_error_support
        ldr     r0, [sp]
        ldr     r1, [sp, #4]
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LADH20:
        cmp     r0, #0
        beq     LADH4
        b       LADH6
LADH21:
        cmp     r0, #0
        bne     LADH1
        bics    r8, r4, r8
        beq     LADH22
        mov     r0, #0
        mov     r1, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LADH22:
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LADH23:
        str     r0, [sp]
        add     r2, sp, #8
        mov     r3, sp
        mov     r0, r2
        add     r1, sp, #8
        mov     r2, r3
        str     r8, [sp, #4]
        mov     r3, #0xA2
        bl      __libm_error_support
        ldr     r0, [sp]
        ldr     r1, [sp, #4]
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LADH24:
        str     r2, [sp]
        add     r1, sp, #8
        add     r0, sp, #8
        mov     r2, sp
        mov     r6, r6, lsl #20
        str     r6, [sp, #4]
        mov     r3, #0xA1
        bl      __libm_error_support
        ldr     r0, [sp]
        ldr     r1, [sp, #4]
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LADH25:
        clz     r0, r9
        cmp     r0, #0
        beq     LADH15
        mov     r10, r9
        sub     r7, r7, #0x20
        mov     r1, r0
        mov     r9, #0
        b       LADH15
        .long   0x58b90bfc
        .long   __intel_exp_coeffs
        .long   __intel_dbl_T_2f


