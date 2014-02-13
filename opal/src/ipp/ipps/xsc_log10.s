        .text
        .align  4
        .globl  log10


log10:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x48
        mov     r3, #0xFE
        mov     r4, r1
        str     r0, [sp, #0x40]
        orr     r3, r3, #7, 24
        add     r12, r4, #1, 22
        mov     r2, r3, lsl #9
        rsb     r12, r2, r12, lsr #10
        cmp     r12, #1
        mov     r2, #0xFF, 12
        orr     r12, r2, #3, 4
        str     r1, [sp, #0x44]
        mov     r2, #0
        bhi     LABV14
        subs    r4, r4, r12
        movpl   r1, r0
        movpl   r3, r4
        bmi     LABV36
LABV0:
        clz     r3, r3
        cmp     r3, #0x20
        clzge   r1, r1
        addge   r3, r1, #0x20
        sub     r1, r3, #2
        cmp     r1, #0x20
        bgt     LABV1
        rsb     r3, r1, #0x20
        mov     r3, r0, lsr r3
        orr     r12, r3, r4, lsl r1
        mov     r3, r0, lsl r1
        b       LABV2
LABV1:
        cmp     r1, #0x40
        movgt   r3, r2
        movgt   r12, r3
        bgt     LABV2
        rsb     r12, r1, #0x40
        sub     r3, r1, #0x20
        mov     r12, r2, lsr r12
        orr     r12, r12, r0, lsl r3
        mov     r3, r2, lsl r3
LABV2:
        add     r0, r12, r3, lsr #31
        ldr     r12, [pc, #0x92C]
        smull   r6, r5, r0, r0
        add     r4, r1, r4, lsr #31
        rsb     r12, r12, #0
        smull   lr, r12, r12, r0
        ldr     lr, [pc, #0x91C]
        sub     r1, r4, #0xC
        adds    r7, r5, r6, lsr #31
        add     r12, lr, r12, asr r1
        smull   r12, r9, r12, r7
        sub     r4, r1, #1
        add     r8, r1, #2
        rsb     lr, r1, #0x21
        rsb     r12, r0, r9, asr r4
        cmp     r8, #0x20
        mov     r9, r9, lsl lr
        bgt     LABV3
        mov     r9, r9, lsr r8
        mov     r2, r12, asr r8
        rsb     r8, r1, #0x1E
        orr     r8, r9, r12, lsl r8
        b       LABV4
LABV3:
        cmp     r8, #0x40
        movgt   r8, r2
        bgt     LABV4
        sub     r2, r1, #0x1E
        mov     r8, r12, asr #31
        mov     r12, r12, lsr r2
        mov     r2, r8, asr r2
        rsb     r9, r1, #0x3E
        orr     r8, r12, r8, lsl r9
LABV4:
        ldr     r9, [pc, #0x8B0]
        mov     r12, #0
        adds    r8, r8, r9
        adc     r9, r2, r9
        smull   r10, r2, r7, r8
        adds    r9, r9, r8, lsr #31
        smull   r8, r7, r7, r9
        smull   r10, r9, r6, r9
        adds    r8, r8, r9
        adc     r9, r7, r9, asr #31
        adds    r7, r8, r2
        adc     r9, r9, r2, asr #31
        smull   r8, r2, r0, r7
        adds    r7, r9, r7, lsr #31
        smull   r7, r8, r0, r7
        adds    r7, r7, r2
        adc     r2, r8, r2, asr #31
        cmp     r4, #0x20
        bgt     LABV5
        mov     r7, r7, lsr r4
        orr     lr, r7, r2, lsl lr
        mov     r4, r2, asr r4
        b       LABV6
LABV5:
        cmp     r4, #0x40
        movgt   lr, #0
        movgt   r4, lr
        bgt     LABV6
        mov     r4, r2, asr #31
        sub     r7, r1, #0x21
        rsb     lr, r1, #0x41
        mov     r2, r2, lsr r7
        orr     lr, r2, r4, lsl lr
        mov     r4, r4, asr r7
LABV6:
        subs    r6, lr, r6
        sbc     r5, r4, r5
        cmp     r1, #0x20
        bge     LABV7
        add     lr, r1, #1
        rsb     r2, r1, #0x1F
        mov     r6, r6, lsr lr
        orr     r2, r6, r5, lsl r2
        mov     r5, r5, asr lr
        b       LABV8
LABV7:
        cmp     r1, #0x40
        movge   r2, #0
        movge   r5, r2
        bge     LABV8
        mov     lr, r5, asr #31
        sub     r4, r1, #0x1F
        rsb     r2, r1, #0x3F
        mov     r5, r5, lsr r4
        orr     r2, r5, lr, lsl r2
        mov     r5, lr, asr r4
LABV8:
        smull   r4, lr, r0, r3
        adds    r2, r2, #0
        adc     r5, r5, r0
        adds    r2, r2, r3
        mov     lr, lr, asr r1
        smull   r0, r4, r0, lr
        adc     r3, r5, r3, asr #31
        ldr     r0, [pc, #0x7C8]
        subs    r2, r2, lr
        sbc     r3, r3, lr, asr #31
        mov     r4, r4, asr r1
        adds    lr, r2, r4
        ldr     r2, [r0]
        adc     r4, r3, r4, asr #31
        ldr     r3, [r0, #4]
        add     r5, r4, lr, lsr #31
        smull   r6, r4, r2, r5
        smull   r0, lr, r2, lr
        smull   r3, r5, r3, r5
        add     r2, r1, #0x40
        adds    r6, lr, r6
        adc     lr, r4, lr, asr #31
        adds    r1, r6, r5
        adc     r5, lr, r5, asr #31
        adds    r3, r0, r3
        adc     r12, r12, #0
        adds    r0, r1, r12
        mvn     r1, #2, 2
        adc     r3, r5, r12, asr #31
        bics    r1, r3, r1
        beq     LABV9
        rsbs    r0, r0, #0
        rsc     r3, r3, #0
LABV9:
        mov     r12, #0x33
        orr     r12, r12, #1, 22
        clz     lr, r3
        add     r12, r12, #9
        cmp     lr, #0x20
        rsb     r2, r2, r12
        beq     LABV35
LABV10:
        sub     r12, lr, #1
        rsb     lr, r12, #0x20
        mov     lr, r0, lsr lr
        subs    r2, r2, r12
        orr     r3, lr, r3, lsl r12
        mov     r0, r0, lsl r12
        bpl     LABV12
        rsb     r2, r2, #0
        cmp     r2, #0x20
        blt     LABV11
        mov     r0, r3
        mov     r3, r3, asr #31
        sub     r2, r2, #0x20
LABV11:
        cmp     r2, #0x20
        mov     r12, #0x20
        movgt   r2, r12
        mov     r0, r0, lsr r2
        rsb     r12, r2, #0x20
        orr     r0, r0, r3, lsl r12
        mov     r3, r3, asr r2
        mov     r2, #0
LABV12:
        mov     r12, r0, lsr #9
        mov     lr, r3, lsl #22
        orr     r0, lr, r0, lsr #10
        and     r12, r12, #1
        adds    r0, r12, r0
        mov     r3, r3, lsr #10
        adc     r12, r3, r12, asr #31
        orrs    r3, r12, r12, asr #31
        moveq   r2, #0
        beq     LABV13
        mov     r3, #0xFE
        orr     r3, r3, #7, 24
        cmp     r3, r2
        bgt     LABV13
        mov     r0, #0
        add     r2, r3, #1
        mov     r12, r0
LABV13:
        add     r2, r12, r2, lsl #20
        orr     r1, r2, r1
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LABV14:
        sub     lr, r4, #1, 12
        cmp     lr, r3, lsl #20
        mov     r5, #0xFF
        mov     lr, #0xFF, 12
        orr     r5, r5, #7, 24
        orr     lr, lr, #0xF, 4
        str     r5, [sp, #0x10]
        bcc     LABV20
        cmp     r4, #1, 12
        bcc     LABV17
        cmp     r0, #0
        bne     LABV15
        cmp     r4, #2, 2
        beq     LABV37
LABV15:
        cmp     r4, #0
        blt     LABV38
LABV16:
        orrs    r2, r0, r4, lsl #12
        orrne   r4, r4, #2, 14
        mov     r1, r4
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LABV17:
        clz     lr, r4
        cmp     lr, #0x20
        clzge   r12, r0
        addge   lr, r12, #0x20
        sub     r5, lr, #0xB
        cmp     r5, #0x20
        bgt     LABV18
        rsb     r12, lr, #0x2B
        mov     r12, r0, lsr r12
        orr     r12, r12, r4, lsl r5
        mov     r0, r0, lsl r5
        b       LABV19
LABV18:
        cmp     r5, #0x40
        movgt   r0, r2
        movgt   r12, r0
        bgt     LABV19
        rsb     r12, lr, #0x4B
        mov     r12, r2, lsr r12
        sub     r1, lr, #0x2B
        orr     r12, r12, r0, lsl r1
        mov     r0, r2, lsl r1
LABV19:
        ldr     r1, [sp, #0x10]
        cmp     r12, #0
        sub     r1, r1, #0xF6, 30
        add     lr, lr, r1
        bne     LABV22
        b       LABV41
LABV20:
        mvn     lr, lr
        and     r12, r4, lr
        movs    lr, r4, lsl #1
        moveq   lr, #2, 12
        orrne   r12, r12, #1, 12
        mvn     r5, #2, 2
        bics    r5, r4, r5
        beq     LABV21
        rsbs    r0, r0, #0
        rsc     r12, r12, #0
LABV21:
        mov     r1, #0x33
        orr     r1, r1, #1, 22
        sub     lr, r1, lr, lsr #21
LABV22:
        ldr     r4, [pc, #0x5AC]
        mov     r1, r12, lsr #15
        sub     r1, r1, #0x20
        ldrb    r5, [r1, +r4]
        sub     lr, lr, r1, asr #4
        str     lr, [sp]
        umull   lr, r12, r12, r5
        umull   r7, r5, r0, r5
        ldr     r6, [pc, #0x590]
        ldr     r4, [pc, #0x590]
        ldr     r8, [pc, #0x590]
        ldrb    r0, [r1, +r6]
        ldr     r6, [r4, +r1, lsl #3]
        add     r1, r4, r1, lsl #3
        ldr     r12, [r1, #4]
        adds    r1, r7, #0
        adc     r9, r5, lr
        ldr     r5, [pc, #0x578]
        ldr     r4, [pc, #0x578]
        mov     lr, r9, lsr #17
        sub     lr, lr, #2, 24
        ldrb    r4, [lr, +r4]
        mov     r7, lr, lsl #1
        ldrh    r5, [r5, +r7]
        ldr     r7, [r8, +lr, lsl #3]
        add     lr, r8, lr, lsl #3
        ldr     lr, [lr, #4]
        umull   r1, r8, r5, r1
        umull   r5, r9, r9, r5
        sub     r10, r0, #0x2B
        mov     r11, r12, lsr r10
        str     r11, [sp, #0xC]
        sub     r9, r4, #0x2B
        mov     r11, lr, lsr r9
        str     r11, [sp, #8]
        adds    r1, r1, #0
        adc     r5, r8, r5
        ldr     r8, [sp, #0xC]
        ldr     r11, [sp, #8]
        rsb     r0, r0, #0x4B
        rsb     r4, r4, #0x4B
        orr     r8, r8, r6, lsl r0
        orr     r11, r11, r7, lsl r4
        adds    r8, r8, r11
        mov     r9, r7, lsr r9
        adc     r10, r9, r6, asr r10
        mov     r4, lr, lsl r4
        adds    r0, r4, r12, lsl r0
        adc     r2, r2, #0
        adds    r8, r8, r2
        str     r0, [sp, #4]
        adc     r2, r10, r2, asr #31
        cmp     r5, #0
        str     r8, [sp, #8]
        str     r2, [sp, #0xC]
        rsblt   r0, r5, #0
        movge   r0, r5
        clz     r0, r0
        subs    r0, r0, #1
        beq     LABV23
        sub     r0, r0, #1
        cmp     r0, #0x20
        bgt     LABV42
LABV23:
        rsb     r2, r0, #0x20
        mov     r2, r1, lsr r2
        orr     r5, r2, r5, lsl r0
        mov     lr, r1, lsl r0
LABV24:
        add     r2, r5, lr, lsr #31
        smull   r1, r12, r2, lr
        smull   r9, r7, r2, r2
        ldr     r1, [pc, #0x488]
        str     r12, [sp, #0x14]
        add     r10, r0, #7
        rsb     r1, r1, #0
        smull   r12, r1, r1, r2
        ldr     r12, [pc, #0x478]
        adds    r4, r7, r9, lsr #31
        add     r6, r0, #6
        add     r1, r12, r1, asr r10
        smull   r1, r5, r1, r4
        ldr     r12, [pc, #0x468]
        rsb     r8, r10, #0x21
        ldr     r1, [r12]
        str     r1, [sp, #0x18]
        ldr     r12, [r12, #4]
        str     r8, [sp, #0x20]
        rsb     r1, r2, r5, asr r6
        mov     r8, r5, lsl r8
        str     r12, [sp, #0x1C]
        add     r12, r0, #9
        mov     r8, r8, lsr r12
        rsb     r5, r10, #0x1E
        orr     r5, r8, r1, lsl r5
        ldr     r8, [pc, #0x42C]
        adds    r5, r5, r8
        smull   r8, r11, r5, r4
        ldr     r8, [pc, #0x420]
        str     r11, [sp, #0x24]
        adc     r12, r8, r1, asr r12
        adds    r5, r12, r5, lsr #31
        smull   r4, r12, r5, r4
        smull   r5, r1, r5, r9
        rsb     r5, r10, #0x1F
        str     r5, [sp, #0x28]
        ldr     r5, [sp, #0x14]
        add     r8, r0, #8
        mov     r5, r5, asr r10
        str     r5, [sp, #0x14]
        smull   r5, r11, r2, r5
        adds    r5, r4, r1
        ldr     r4, [sp, #0x24]
        str     r11, [sp, #0x2C]
        adc     r12, r12, r1, asr #31
        adds    r1, r5, r4
        smull   r5, r11, r2, r1
        str     r11, [sp, #0x30]
        ldr     r11, [sp, #0x30]
        adc     r4, r12, r4, asr #31
        adds    r1, r4, r1, lsr #31
        smull   r1, r5, r2, r1
        ldr     r12, [sp, #0x2C]
        mov     r4, #0
        adds    r1, r1, r11
        adc     r11, r5, r11, asr #31
        ldr     r5, [sp, #0x20]
        mov     r1, r1, lsr r6
        mov     r12, r12, asr r10
        orr     r5, r1, r11, lsl r5
        ldr     r1, [sp, #0x28]
        subs    r5, r5, r9
        rsc     r6, r7, r11, asr r6
        mov     r5, r5, lsr r8
        orr     r1, r5, r6, lsl r1
        adds    r1, r1, #0
        adc     r8, r2, r6, asr r8
        ldr     r2, [sp, #0x14]
        adds    r1, r1, lr
        adc     lr, r8, lr, asr #31
        subs    r1, r1, r2
        sbc     r5, lr, r2, asr #31
        adds    lr, r12, r1
        ldr     r1, [sp, #0x18]
        adc     r12, r5, r12, asr #31
        ldr     r5, [sp, #0x1C]
        add     r12, r12, lr, lsr #31
        smull   r1, r2, r1, lr
        ldr     lr, [sp, #0x18]
        smull   r6, lr, lr, r12
        smull   r12, r5, r5, r12
        adds    r6, r2, r6
        adc     lr, lr, r2, asr #31
        adds    r2, r6, r5
        adc     r5, lr, r5, asr #31
        adds    r12, r1, r12
        adc     r12, r4, #0
        adds    r1, r2, r12
        adc     r2, r5, r12, asr #31
        cmp     r10, #0xB
        ble     LABV27
        sub     r0, r0, #4
        cmp     r0, #0x20
        bgt     LABV25
        mov     r1, r1, lsr r0
        rsb     r10, r10, #0x2B
        orr     r1, r1, r2, lsl r10
        mov     r4, r2, asr r0
        b       LABV26
LABV25:
        cmp     r0, #0x40
        movgt   r1, r4
        bgt     LABV26
        sub     r12, r10, #0x2B
        mov     r0, r2, asr #31
        rsb     r10, r10, #0x4B
        mov     r2, r2, lsr r12
        orr     r1, r2, r0, lsl r10
        mov     r4, r0, asr r12
LABV26:
        mov     r0, r4, asr #31
        b       LABV29
LABV27:
        add     lr, r0, #0x1C
        rsb     r12, r10, #0xB
        cmp     r12, #0x20
        mov     r0, r2, asr lr
        bgt     LABV28
        mov     lr, r1, lsr lr
        orr     r4, lr, r2, lsl r12
        mov     r1, r1, lsl r12
        b       LABV29
LABV28:
        cmp     r12, #0x40
        movgt   r1, r4
        bgt     LABV29
        mov     r2, r4
        mvn     r12, #0x14
        rsb     r12, r10, r12
        add     r10, r10, #0x35
        mov     r10, r2, lsr r10
        orr     r4, r10, r1, lsl r12
        mov     r1, r2, lsl r12
LABV29:
        ldr     r2, [sp, #8]
        ldr     r12, [pc, #0x2AC]
        ldr     lr, [sp]
        adds    r4, r2, r4
        ldr     r2, [sp, #0xC]
        ldr     r5, [r12, #4]
        ldr     r8, [r12, #8]
        rsb     lr, lr, #0x34
        adc     r6, r2, r0
        ldr     r0, [sp, #4]
        adds    r2, r0, r1
        mov     r0, #0
        adc     r7, r0, #0
        ldr     r1, [r12]
        adds    r4, r4, r7
        adc     r7, r6, r7, asr #31
        mul     r6, r8, lr
        smull   r5, r8, r5, lr
        smull   r1, r12, r1, lr
        mvn     lr, #2, 2
        adds    r5, r12, r5
        adc     r12, r8, r12, asr #31
        adds    r5, r5, #0
        adc     r6, r12, r6
        adds    r5, r4, r5
        adc     r6, r7, r6
        adds    r1, r2, r1
        adc     r2, r0, #0
        adds    r0, r5, r2
        adc     r12, r6, r2, asr #31
        eor     r2, r12, r12, asr #31
        sub     r2, r2, r12, asr #31
        clz     r2, r2
        rsb     r6, r2, #0x21
        mov     r5, r0, lsr r6
        sub     r4, r2, #1
        mov     r6, r1, lsr r6
        orr     r1, r5, r12, lsl r4
        bics    lr, r1, lr
        orr     r0, r6, r0, lsl r4
        add     r2, r2, #0x2A
        beq     LABV30
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
LABV30:
        ldr     r12, [sp, #0x10]
        clz     r4, r1
        cmp     r4, #0x20
        sub     r12, r12, #0xF3, 30
        add     r12, r12, #9
        rsb     r12, r2, r12
        beq     LABV43
LABV31:
        sub     r4, r4, #1
        rsb     r2, r4, #0x20
        mov     r2, r0, lsr r2
        orr     r2, r2, r1, lsl r4
        subs    r1, r12, r4
        mov     r4, r0, lsl r4
        bpl     LABV33
        rsb     r1, r1, #0
        cmp     r1, #0x20
        blt     LABV32
        mov     r4, r2
        mov     r2, r2, asr #31
        sub     r1, r1, #0x20
LABV32:
        cmp     r1, #0x20
        mov     r0, #0x20
        movgt   r1, r0
        mov     r4, r4, lsr r1
        rsb     r0, r1, #0x20
        orr     r4, r4, r2, lsl r0
        mov     r2, r2, asr r1
        mov     r1, #0
LABV33:
        mov     r0, r4, lsr #9
        and     r12, r0, #1
        mov     r0, r2, lsl #22
        orr     r4, r0, r4, lsr #10
        adds    r0, r12, r4
        mov     r2, r2, lsr #10
        adc     r12, r2, r12, asr #31
        orrs    r2, r12, r12, asr #31
        moveq   r1, #0
        beq     LABV34
        cmp     r3, r1
        bgt     LABV34
        mov     r0, #0
        add     r1, r3, #1
        mov     r12, r0
LABV34:
        add     r1, r12, r1, lsl #20
        orr     r1, r1, lr
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LABV35:
        clz     r12, r0
        cmp     r12, #0
        beq     LABV10
        mov     r3, r0
        sub     r2, r2, #0x20
        mov     lr, r12
        mov     r0, #0
        b       LABV10
LABV36:
        rsbs    r1, r0, #0
        rsc     r3, r4, #0
        b       LABV0
LABV37:
        str     r2, [sp, #0x38]
        add     r1, sp, #0x40
        add     r0, sp, #0x40
        add     r2, sp, #0x38
        orr     r12, r12, #3, 2
        str     r12, [sp, #0x3C]
        mov     r3, #8
        bl      __libm_error_support
        ldr     r0, [sp, #0x38]
        ldr     r1, [sp, #0x3C]
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LABV38:
        cmn     r4, #1, 12
        bcs     LABV40
LABV39:
        str     r2, [sp, #0x38]
        add     r1, sp, #0x40
        add     r0, sp, #0x40
        add     r2, sp, #0x38
        orr     lr, lr, #2, 14
        str     lr, [sp, #0x3C]
        mov     r3, #9
        bl      __libm_error_support
        ldr     r0, [sp, #0x38]
        ldr     r1, [sp, #0x3C]
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LABV40:
        cmn     r4, #1, 12
        bne     LABV16
        cmp     r0, #0
        beq     LABV39
        b       LABV16
LABV41:
        str     r2, [sp, #0x38]
        mov     r3, r3, lsl #19
        add     r1, sp, #0x40
        add     r0, sp, #0x40
        add     r2, sp, #0x38
        orr     r3, r3, #3, 2
        str     r3, [sp, #0x3C]
        mov     r3, #8
        bl      __libm_error_support
        ldr     r0, [sp, #0x38]
        ldr     r1, [sp, #0x3C]
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LABV42:
        cmp     r0, #0x40
        mov     r5, #0
        movgt   lr, r5
        bgt     LABV24
        mov     r2, r5
        rsb     r12, r0, #0x40
        mov     lr, r2, lsr r12
        sub     r12, r0, #0x20
        orr     r5, lr, r1, lsl r12
        mov     lr, r2, lsl r12
        b       LABV24
LABV43:
        clz     r2, r0
        cmp     r2, #0
        beq     LABV31
        mov     r1, r0
        sub     r12, r12, #0x20
        mov     r4, r2
        mov     r0, #0
        b       LABV31
        .long   0x55555555
        .long   0x66666666
        .long   LABV_L10_E
        .long   LABV_r1_tbl
        .long   LABV_log_r1_scale
        .long   LABV_log_r1_tbl
        .long   LABV_log_r2_tbl
        .long   LABV_r2_tbl
        .long   LABV_log_r2_scale
        .long   LABV_L10_2


        .data
        .align  4


LABV_r1_tbl:
        .byte   0x40,0x3F,0x3D,0x3B,0x39,0x38,0x36,0x35,0x34,0x32,0x31,0x30,0x2F,0x2E,0x2D,0x2C
        .byte   0x2B,0x2A,0x29,0x29,0x28,0x27,0x26,0x26,0x25,0x24,0x24,0x23,0x23,0x22,0x22,0x21
LABV_log_r1_scale:
        .byte   0x4A,0x46,0x44,0x43,0x43,0x43,0x42,0x42,0x42,0x42,0x42,0x42,0x41,0x41,0x41,0x41
        .byte   0x41,0x42,0x42,0x42,0x42,0x42,0x42,0x42,0x42,0x43,0x43,0x43,0x43,0x44,0x44,0x45
LABV_log_r1_tbl:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x2B,0xA0,0x0E,0x70,0x0B,0x4E,0x81,0x97
        .byte   0x90,0xF4,0x66,0x55,0x2A,0xE8,0x0E,0x1B,0xD7,0x06,0x5A,0x48,0x63,0x4D,0x08,0x23
        .byte   0xAF,0x5E,0x06,0x67,0x9E,0x5B,0x37,0xC0,0x5D,0x7B,0xC4,0x76,0xCB,0xD0,0xAF,0x9A
        .byte   0x02,0x9D,0x8E,0x4B,0x51,0x3A,0x00,0xDE,0x66,0xAB,0xDE,0x53,0x51,0xBB,0x2E,0xEF
        .byte   0x38,0x43,0x57,0x5C,0xB6,0xEE,0xEB,0xD9,0x45,0x73,0xC8,0x6D,0x58,0x8A,0x5F,0xC5
        .byte   0x5D,0x7B,0xC4,0x76,0xCB,0xD0,0xAF,0x9A,0xAE,0xF0,0xEF,0x7F,0xD6,0x0D,0xE0,0xF1
        .byte   0x3E,0x69,0xA6,0x44,0x32,0x16,0x8C,0xCF,0x85,0xA0,0x6E,0x49,0x82,0xF0,0xDF,0x6B
        .byte   0x3D,0xC0,0x51,0x4E,0xA0,0xF4,0x4F,0xE5,0x09,0xFE,0x50,0x53,0xAA,0x0C,0x92,0xD6
        .byte   0x61,0x0A,0x4D,0xBE,0xAF,0x26,0xF1,0x64,0x53,0xF9,0x10,0x87,0x0B,0x07,0x98,0xC7
        .byte   0xB1,0x6C,0xC8,0x91,0x29,0xA0,0x09,0x53,0xB1,0x6C,0xC8,0x91,0x29,0xA0,0x09,0x53
        .byte   0x1D,0x9F,0xC3,0x9C,0x93,0xCD,0xDF,0xE6,0xDD,0xFE,0x05,0xA8,0x5B,0x0D,0x2C,0xD4
        .byte   0xA8,0x3E,0x93,0xB3,0xF9,0x9F,0x3B,0xEE,0xA8,0x3E,0x93,0xB3,0xF9,0x9F,0x3B,0xEE
        .byte   0xF8,0x5C,0x6F,0xBF,0x56,0xA8,0xFF,0x3D,0xA7,0x58,0x3D,0x97,0xF6,0x58,0x40,0xD8
        .byte   0xA7,0x58,0x3D,0x97,0xF6,0x58,0x40,0xD8,0x99,0xB9,0x4B,0xB0,0xF2,0x6B,0x6F,0x68
        .byte   0x99,0xB9,0x4B,0xB0,0xF2,0x6B,0x6F,0x68,0x53,0x1B,0x28,0x94,0x65,0xC1,0x67,0xFC
        .byte   0x53,0x1B,0x28,0x94,0x65,0xC1,0x67,0xFC,0xC5,0xBD,0x85,0x92,0xC2,0xBF,0x21,0x3B
LABV_r2_tbl:
        .byte   0xF8,0x1F,0xE8,0x1F,0xD8,0x1F,0xC8,0x1F,0xB9,0x1F,0xA9,0x1F,0x99,0x1F,0x8A,0x1F
        .byte   0x7A,0x1F,0x6B,0x1F,0x5B,0x1F,0x4C,0x1F,0x3D,0x1F,0x2E,0x1F,0x1E,0x1F,0x0F,0x1F
        .byte   0x00,0x1F,0xF1,0x1E,0xE2,0x1E,0xD3,0x1E,0xC5,0x1E,0xB6,0x1E,0xA7,0x1E,0x99,0x1E
        .byte   0x8A,0x1E,0x7B,0x1E,0x6D,0x1E,0x5E,0x1E,0x50,0x1E,0x42,0x1E,0x33,0x1E,0x25,0x1E
LABV_log_r2_scale:
        .byte   0x4A,0x48,0x47,0x47,0x47,0x46,0x46,0x46,0x46,0x45,0x45,0x45,0x45,0x45,0x45,0x45
        .byte   0x45,0x45,0x45,0x44,0x44,0x44,0x44,0x44,0x44,0x44,0x44,0x44,0x44,0x44,0x44,0x44
LABV_log_r2_tbl:
        .byte   0x63,0xD4,0x3B,0x6F,0x94,0x46,0x58,0x8A,0xD5,0xC5,0x81,0x53,0x9D,0xE6,0x62,0x32
        .byte   0xF8,0x45,0xA8,0x45,0x9B,0xBF,0x2C,0x35,0xC5,0xB1,0x9D,0x61,0x0F,0xE4,0x3E,0x0D
        .byte   0x5A,0x92,0xE0,0x7B,0x57,0xEC,0x26,0x9A,0xB6,0xAB,0xF8,0x4B,0x65,0xC1,0xB4,0xB5
        .byte   0x84,0x27,0x08,0x5A,0x26,0x83,0x2C,0xB3,0x6E,0x24,0x3D,0x67,0xD2,0xCC,0x90,0xB6
        .byte   0xB5,0x75,0x5A,0x75,0xB8,0xBD,0xE0,0xC5,0xC3,0x3B,0x4E,0x41,0x13,0x80,0x14,0x7B
        .byte   0xCD,0xDC,0x63,0x48,0xD7,0xE0,0x18,0x63,0x0B,0x6D,0x0B,0x4F,0xED,0x6A,0xBB,0xC5
        .byte   0x8A,0x2E,0xB6,0x55,0x47,0xDC,0x0E,0x79,0x5B,0x24,0x64,0x5C,0x7F,0x9E,0xDF,0x14
        .byte   0x24,0xA5,0x87,0x63,0xE9,0x0D,0x50,0xDA,0x15,0x44,0x3C,0x6A,0x7D,0xC8,0x61,0xF1
        .byte   0xDD,0x20,0xF4,0x70,0x73,0x02,0x31,0xE1,0xA0,0x3E,0xAF,0x77,0xCC,0x6A,0x61,0x7E
        .byte   0x86,0xA0,0x6D,0x7E,0xD2,0x31,0xC2,0x2F,0xDD,0xA4,0x97,0x42,0x84,0xD1,0x98,0xFB
        .byte   0xBB,0x4D,0xC0,0x45,0x5A,0x97,0x40,0x02,0x35,0x52,0x24,0x49,0x05,0x8B,0x61,0x27
        .byte   0x0D,0xFF,0x89,0x4C,0x42,0xBC,0x5E,0x34,0xBE,0x31,0xB7,0x4F,0xEE,0xAC,0xB2,0xB2
        .byte   0xA4,0x17,0x20,0x53,0xB3,0xCA,0x01,0xFA,0xB3,0xAA,0x8A,0x56,0x0D,0x6C,0xD0,0x70
        .byte   0x56,0x74,0xBC,0x59,0xB4,0x65,0xAF,0xBA,0xCA,0x49,0x2A,0x5D,0xFD,0x3C,0xDF,0x4F
        .byte   0x1A,0x21,0x5F,0x60,0xC8,0xF5,0x2E,0x0A,0xDD,0x73,0x95,0x63,0x3A,0xB9,0xA9,0xA1
        .byte   0x08,0x2A,0x08,0x67,0xC9,0x9C,0x90,0xE5,0x2E,0x93,0x41,0x6A,0x6F,0x9D,0x57,0xF9
LABV_L10_E:
        .byte   0x55,0xEC,0x2D,0x6F,0xCB,0x38,0x94,0x9B
LABV_L10_2:
        .byte   0x3E,0x62,0xDE,0x3F,0xEF,0x13,0x6A,0x82,0x69,0x02,0x00,0x00


