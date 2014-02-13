        .text
        .align  4
        .globl  remainder


remainder:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x28
        str     r0, [sp, #0x18]
        str     r2, [sp, #0x20]
        mov     r4, r1
        str     r1, [sp, #0x1C]
        mov     r12, r4, lsl #1
        str     r3, [sp, #0x24]
        mov     r1, r0
        cmn     r12, #2, 12
        mov     r0, r2
        bcs     LAAY0
        mov     lr, r3, lsl #1
        cmn     lr, #2, 12
        bcs     LAAY0
        orrs    lr, lr, r0
        bne     LAAY8
LAAY0:
        cmn     r12, #2, 12
        bhi     LAAY1
        cmn     r12, #2, 12
        bne     LAAY2
        cmp     r1, #0
        beq     LAAY2
LAAY1:
        mov     r0, r1
        orr     r4, r4, #2, 14
        mov     r1, r4
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LAAY2:
        mov     lr, r3, lsl #1
        cmn     lr, #2, 12
        bhi     LAAY3
        cmn     lr, #2, 12
        bne     LAAY4
        cmp     r0, #0
        beq     LAAY4
LAAY3:
        orr     r1, r3, #2, 14
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LAAY4:
        orrs    r0, lr, r0
        beq     LAAY5
        cmn     r12, #2, 12
        bcc     LAAY6
LAAY5:
        mov     r1, #0
        sub     r4, r1, #2, 14
LAAY6:
        cmp     r0, #0
        beq     LAAY32
LAAY7:
        mov     r0, r1
        mov     r1, r4
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LAAY8:
        mvn     r12, #2, 2
        and     r8, r4, r12
        bic     lr, r4, r12
        and     r4, r3, r12
        mvn     r3, #0xFF, 12
        bic     r9, r3, #0xF, 4
        mov     r12, r8, lsl #1
        cmp     r12, #2, 12
        and     r3, r8, r9
        movcc   r12, #2, 12
        orrcs   r3, r3, #1, 12
        mov     r5, #0xFF
        orr     r7, r5, #7, 24
        sub     r5, r7, #0xF3, 30
        cmp     r3, #1, 12
        sub     r6, r5, r12, lsr #21
        mov     r12, r1
        bcs     LAAY11
        cmp     r3, #0
        clz     r5, r3
        clzeq   r5, r1
        addeq   r5, r5, #0x20
        sub     r5, r5, #0xB
        cmp     r5, #0x20
        bgt     LAAY9
        rsb     r10, r5, #0x20
        mov     r10, r12, lsr r10
        orr     r3, r10, r3, lsl r5
        mov     r12, r12, lsl r5
        b       LAAY10
LAAY9:
        cmp     r5, #0x40
        mov     r3, #0
        movgt   r12, r3
        bgt     LAAY10
        mov     r10, r3
        rsb     r3, r5, #0x40
        mov     r3, r10, lsr r3
        sub     r11, r5, #0x20
        orr     r3, r3, r12, lsl r11
        mov     r12, r10, lsl r11
LAAY10:
        add     r6, r6, r5
LAAY11:
        and     r5, r4, r9
        mov     r4, r4, lsl #1
        cmp     r4, #2, 12
        movcc   r4, #2, 12
        orrcs   r5, r5, #1, 12
        mov     r9, #0x33
        orr     r9, r9, #1, 22
        cmp     r5, #1, 12
        sub     r9, r9, r4, lsr #21
        bcs     LAAY14
        cmp     r5, #0
        clz     r4, r5
        clzeq   r4, r0
        addeq   r4, r4, #0x20
        sub     r4, r4, #0xB
        cmp     r4, #0x20
        bgt     LAAY12
        rsb     r10, r4, #0x20
        mov     r10, r0, lsr r10
        orr     r5, r10, r5, lsl r4
        mov     r0, r0, lsl r4
        b       LAAY13
LAAY12:
        cmp     r4, #0x40
        mov     r5, #0
        movgt   r0, r5
        bgt     LAAY13
        mov     r10, r5
        rsb     r5, r4, #0x40
        mov     r5, r10, lsr r5
        sub     r11, r4, #0x20
        orr     r5, r5, r0, lsl r11
        mov     r0, r10, lsl r11
LAAY13:
        add     r9, r4, r9
LAAY14:
        subs    r4, r9, r6
        bmi     LAAY34
        mov     r1, r0, lsr #31
        orr     r7, r1, r5, lsl #1
        mov     r1, r12, lsr #31
        mov     r10, r0, lsl #1
        orr     r3, r1, r3, lsl #1
        mov     r9, r10, lsr #29
        mov     r1, r10, lsr #31
        orr     r9, r9, r7, lsl #3
        bic     r12, r12, #2, 2
        orr     r5, r1, r7, lsl #1
        str     r9, [sp, #8]
        movs    r8, r4, asr #2
        mov     r1, r10, lsr #30
        orr     r12, r12, r3, lsl #31
        mov     r11, r0, lsl #2
        mov     r9, r0, lsl #3
        orr     r1, r1, r7, lsl #2
        mov     r3, r3, asr #1
        mov     r0, r0, lsl #4
        sub     r2, r4, r8, lsl #2
        beq     LAAY20
        str     lr, [sp]
        ldr     lr, [sp, #8]
        str     r6, [sp, #4]
LAAY15:
        mov     r6, r12, lsr #28
        mov     r12, r12, lsl #4
        cmp     r12, r0
        orr     r3, r6, r3, lsl #4
        sbcs    r6, r3, lr
        blt     LAAY16
        subs    r12, r12, r0
        sbc     r3, r3, lr
LAAY16:
        cmp     r12, r9
        sbcs    r6, r3, r1
        blt     LAAY17
        subs    r12, r12, r9
        sbc     r3, r3, r1
LAAY17:
        cmp     r12, r11
        sbcs    r6, r3, r5
        blt     LAAY18
        subs    r12, r12, r11
        sbc     r3, r3, r5
LAAY18:
        cmp     r12, r10
        sbcs    r6, r3, r7
        blt     LAAY19
        subs    r12, r12, r10
        sbc     r3, r3, r7
LAAY19:
        subs    r8, r8, #1
        bne     LAAY15
        ldr     r6, [sp, #4]
        ldr     lr, [sp]
LAAY20:
        cmp     r2, #0
        beq     LAAY23
LAAY21:
        mov     r0, r12, lsr #31
        mov     r12, r12, lsl #1
        cmp     r12, r10
        orr     r3, r0, r3, lsl #1
        sbcs    r0, r3, r7
        blt     LAAY22
        subs    r12, r12, r10
        sbc     r3, r3, r7
LAAY22:
        subs    r2, r2, #1
        bne     LAAY21
LAAY23:
        mov     r1, r12, lsl #1
        mov     r12, r12, lsr #31
        cmp     r1, r10
        orr     r3, r12, r3, lsl #1
        sbcs    r0, r3, r7
        mov     r2, #0
        blt     LAAY24
        subs    r1, r1, r10
        sbc     r3, r3, r7
        mov     r2, #1
LAAY24:
        mov     r0, r1, lsl #1
        mov     r1, r1, lsr #31
        orr     r1, r1, r3, lsl #1
        subs    r3, r0, r10
        sbcs    r12, r1, r7
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        bne     LAAY25
        cmp     r1, r7
        cmpeq   r0, r10
        bne     LAAY26
        cmp     r2, #0
        beq     LAAY26
LAAY25:
        subs    r0, r0, r11
        sbc     r1, r1, r5
LAAY26:
        mvn     r2, #2, 2
        add     r4, r6, r4
        bics    r2, r1, r2
        add     r3, r4, #2
        beq     LAAY27
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
LAAY27:
        mov     r12, #0x33
        orr     r12, r12, #1, 22
        add     r12, r12, #9
        clz     r4, r1
        cmp     r4, #0x20
        rsb     r12, r3, r12
        beq     LAAY33
LAAY28:
        sub     r4, r4, #1
        rsb     r3, r4, #0x20
        mov     r3, r0, lsr r3
        orr     r3, r3, r1, lsl r4
        subs    r1, r12, r4
        mov     r4, r0, lsl r4
        bpl     LAAY30
        rsb     r1, r1, #0
        cmp     r1, #0x20
        blt     LAAY29
        mov     r4, r3
        mov     r3, r3, asr #31
        sub     r1, r1, #0x20
LAAY29:
        cmp     r1, #0x20
        mov     r0, #0x20
        movgt   r1, r0
        mov     r4, r4, lsr r1
        rsb     r0, r1, #0x20
        orr     r4, r4, r3, lsl r0
        mov     r3, r3, asr r1
        mov     r1, #0
LAAY30:
        mov     r0, r4, lsr #9
        and     r12, r0, #1
        mov     r0, r3, lsl #22
        orr     r4, r0, r4, lsr #10
        adds    r0, r12, r4
        mov     r3, r3, lsr #10
        adc     r12, r3, r12, asr #31
        orrs    r3, r12, r12, asr #31
        moveq   r1, #0
        beq     LAAY31
        mov     r3, #0xFF
        orr     r3, r3, #7, 24
        sub     r4, r3, #1
        cmp     r4, r1
        bgt     LAAY31
        mov     r0, #0
        mov     r1, r3
        mov     r12, r0
LAAY31:
        add     r1, r12, r1, lsl #20
        orr     r2, r1, r2
        eor     r1, lr, r2
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LAAY32:
        str     r1, [sp, #0x10]
        add     r2, sp, #0x10
        add     r0, sp, #0x18
        add     r5, sp, #0x20
        str     r4, [sp, #0x14]
        mov     r1, r5
        mov     r3, #0x7C
        bl      __libm_error_support
        ldr     r1, [sp, #0x10]
        ldr     r4, [sp, #0x14]
        b       LAAY7
LAAY33:
        clz     r3, r0
        cmp     r3, #0
        beq     LAAY28
        mov     r1, r0
        sub     r12, r12, #0x20
        mov     r4, r3
        mov     r0, #0
        b       LAAY28
LAAY34:
        cmn     r4, #1
        bne     LAAY40
        subs    r4, r12, r0
        sbcs    r9, r3, r5
        movlt   r4, #0
        movlt   r9, #0
        orrs    r9, r4, r9
        beq     LAAY40
        subs    r12, r12, r0, lsl #1
        mov     r0, r0, lsr #31
        orr     r5, r0, r5, lsl #1
        sbc     r3, r3, r5
        mvn     r0, #2, 2
        bics    r1, r3, r0
        beq     LAAY35
        rsbs    r12, r12, #0
        rsc     r3, r3, #0
LAAY35:
        sub     r0, r7, #0xF3, 30
        clz     r2, r3
        add     r0, r0, #9
        cmp     r2, #0x20
        rsb     r6, r6, r0
        beq     LAAY41
LAAY36:
        sub     r0, r2, #1
        rsb     r2, r0, #0x20
        mov     r2, r12, lsr r2
        orr     r3, r2, r3, lsl r0
        subs    r2, r6, r0
        mov     r0, r12, lsl r0
        bpl     LAAY38
        rsb     r2, r2, #0
        cmp     r2, #0x20
        blt     LAAY37
        mov     r0, r3
        mov     r3, r3, asr #31
        sub     r2, r2, #0x20
LAAY37:
        cmp     r2, #0x20
        mov     r12, #0x20
        movgt   r2, r12
        mov     r0, r0, lsr r2
        rsb     r12, r2, #0x20
        orr     r0, r0, r3, lsl r12
        mov     r3, r3, asr r2
        mov     r2, #0
LAAY38:
        mov     r12, r0, lsr #9
        mov     r4, r3, lsl #22
        orr     r0, r4, r0, lsr #10
        and     r12, r12, #1
        adds    r0, r12, r0
        mov     r3, r3, lsr #10
        adc     r12, r3, r12, asr #31
        orrs    r3, r12, r12, asr #31
        moveq   r2, #0
        beq     LAAY39
        sub     r3, r7, #1
        cmp     r3, r2
        bgt     LAAY39
        mov     r0, #0
        mov     r2, r7
        mov     r12, r0
LAAY39:
        add     r2, r12, r2, lsl #20
        orr     r1, r2, r1
        eor     r1, lr, r1
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LAAY40:
        mov     r0, r1
        orr     lr, r8, lr
        mov     r1, lr
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LAAY41:
        clz     r0, r12
        cmp     r0, #0
        beq     LAAY36
        mov     r3, r12
        sub     r6, r6, #0x20
        mov     r2, r0
        mov     r12, #0
        b       LAAY36


