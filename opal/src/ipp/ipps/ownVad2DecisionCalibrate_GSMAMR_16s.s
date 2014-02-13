        .text
        .align  4
        .globl  ownVad2DecisionCalibrate_GSMAMR_16s


ownVad2DecisionCalibrate_GSMAMR_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        mov     r4, r0
        ldr     r12, [r4, #0xB8]
        mov     lr, #0x54
        orr     r11, lr, #6, 20
        cmp     r12, #4
        mov     r8, r1
        mov     r6, r2
        mov     r5, r3
        mvn     r9, #0
        mov     r7, #0
        ble     LDOJ5
        ldrsh   r12, [r4, #0xAC]
        cmp     r12, #1
        beq     LDOJ5
        mvn     r0, #2, 2
        str     r11, [sp]
        mov     r10, #0x10
        str     r4, [sp, #4]
        mov     r11, r0
LDOJ0:
        ldrsh   r12, [r8], #2
        mov     lr, #0xAB
        orr     lr, lr, #0x2A, 24
        sub     lr, lr, #0x26
        mul     r12, r12, lr
        add     lr, r9, #2, 18
        mov     r4, r7, asr #31
        and     r1, lr, r12, asr #8
        mov     r12, r12, asr #23
        add     r12, r12, #3
        mov     r12, r12, lsl #16
        mov     r0, r12, asr #16
        bl      ownPow2
        adds    r7, r0, r7
        adc     r4, r4, r0, asr #31
        subs    lr, r7, r11
        sbcs    r12, r4, #0
        movlt   lr, #0
        movlt   r12, #0
        orrs    r12, lr, r12
        movne   r7, r11
        bne     LDOJ1
        cmp     r7, #2, 2
        sbcs    r4, r4, r9
        movlt   r7, #2, 2
LDOJ1:
        subs    r10, r10, #1
        bne     LDOJ0
        ldr     r4, [sp, #4]
        ldr     r11, [sp]
        add     r2, sp, #0xC
        add     r1, sp, #0x14
        mov     r0, r7
        bl      ownLog2
        ldrsh   r12, [sp, #0x14]
        ldrsh   r1, [sp, #0xC]
        sub     r12, r12, #7
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        mul     r12, r12, r11
        mul     r11, r1, r11
        add     r11, r12, r11, asr #15
        mov     r1, r11, lsl #1
        tst     r1, #0x20
        mov     r1, r1, asr #6
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        addne   r1, r1, #1
        strh    r1, [r6]
        ldrsh   r12, [r4, #0xAE]
        mov     r1, r1, lsl #16
        mov     lr, #2, 2
        mov     r1, r1, asr #16
        cmp     r1, r12
        ble     LDOJ3
        mov     r7, #0x66
        mov     r8, #0x9A
        orr     r7, r7, #0xE6, 24
        mul     r7, r12, r7
        orr     r8, r8, #0x19, 24
        mul     r1, r1, r8
        sub     lr, lr, #2, 18
        add     r7, r1, r7
        cmp     lr, r7
        addle   r12, r9, #2, 18
        ble     LDOJ2
        add     r7, r7, #2, 18
        mov     r7, r7, asr #16
        mov     r7, r7, lsl #16
        mov     r12, r7, asr #16
LDOJ2:
        strh    r12, [r4, #0xAE]
        b       LDOJ6
LDOJ3:
        add     r7, r12, r12, lsl #2
        mov     r7, r7, lsl #12
        mov     r7, r7, asr #15
        mov     r7, r7, lsl #16
        cmp     r1, r7, asr #16
        ble     LDOJ6
        mov     r7, r1, lsl #7
        add     r1, r7, r1, lsl #2
        rsb     r7, r12, r12, lsl #9
        sub     lr, lr, #2, 18
        rsb     r7, r12, r7, lsl #5
        add     r7, r1, r7, lsl #2
        cmp     lr, r7
        addle   r12, r9, #2, 18
        ble     LDOJ4
        add     r7, r7, #2, 18
        mov     r7, r7, asr #16
        mov     r7, r7, lsl #16
        mov     r12, r7, asr #16
LDOJ4:
        strh    r12, [r4, #0xAE]
        b       LDOJ6
LDOJ5:
        add     r2, sp, #8
        add     r0, r4, #0x40
        strh    r7, [r4, #0xB0]
        strh    r7, [r4, #0xB2]
        mov     r1, #0x10
        mov     r3, #0
        bl      _ippsSum_32s_Sfs
        ldr     r0, [sp, #8]
        add     r2, sp, #0x10
        add     r1, sp, #0x18
        bl      ownLog2
        ldrsh   r12, [sp, #0x18]
        ldrsh   r1, [sp, #0x10]
        sub     r12, r12, #9
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        mul     r12, r12, r11
        mul     r11, r1, r11
        add     r11, r12, r11, asr #15
        mov     r1, r11, lsl #1
        tst     r1, #0x20
        mov     r1, r1, asr #6
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        addne   r1, r1, #1
        mov     r12, #0x7F, 28
        orr     r12, r12, #3, 20
        rsb     r12, r1, r12
        mov     r1, r12, lsl #16
        mov     r12, r1, asr #16
        strh    r12, [r6]
        strh    r12, [r4, #0xAE]
LDOJ6:
        mov     r1, #0xAB
        orr     r1, r1, #0x2A, 24
        mul     lr, r12, r1
        mov     r1, #0
        mov     r12, #0x13
        mov     lr, lr, asr #15
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #24
        mov     lr, lr, lsl #16
        mov     r7, lr, asr #16
        cmp     r7, #0
        mov     lr, r1
        movgt   lr, r7
        cmp     lr, #0x13
        movlt   r12, lr
        strh    r12, [r5]
        ldrsh   r6, [r6]
        cmp     r6, #0
        addge   sp, sp, #0x1C
        ldmgeia sp!, {r4 - r11, pc}
        mul     r3, r6, r6
        add     r12, r9, #2, 10
        mov     r2, #2, 2
        cmp     r12, r3
        mvnlt   r3, #2, 2
        blt     LDOJ7
        cmn     r3, #2, 10
        movge   r3, r3, lsl #8
        movlt   r3, #2, 2
LDOJ7:
        sub     r12, r2, #2, 18
        cmp     r12, r3
        addle   r3, r9, #2, 18
        ble     LDOJ8
        add     r3, r3, #2, 18
        mov     r3, r3, asr #16
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
LDOJ8:
        ldrsh   r12, [r4, #0xB0]
        mov     lr, #0xD7, 28
        orr     lr, lr, #0xF, 20
        mul     r12, r12, lr
        add     lr, r3, r3, lsl #2
        sub     r2, r2, #2, 18
        add     lr, r3, lr, lsl #3
        add     lr, r12, lr, lsl #4
        cmp     r2, lr
        addle   r9, r9, #2, 18
        ble     LDOJ9
        add     lr, lr, #2, 18
        mov     lr, lr, asr #16
        mov     lr, lr, lsl #16
        mov     r9, lr, asr #16
LDOJ9:
        mov     r2, #1, 22
        cmp     r9, #1, 22
        movlt   r2, r9
        sub     r3, r2, #0xA6
        strh    r2, [r4, #0xB0]
        mov     r2, r3, lsl #6
        sub     r2, r2, r3, lsl #4
        mov     r2, r2, lsl #13
        add     r2, r2, #1, 18
        mov     r2, r2, asr #15
        mov     r2, r2, lsl #16
        movs    r2, r2, asr #16
        bmi     LDOJ10
        mov     r2, r2, asr #8
        strh    r2, [r4, #0xB2]
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LDOJ10:
        strh    r1, [r4, #0xB2]
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}


