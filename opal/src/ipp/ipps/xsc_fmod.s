        .text
        .align  4
        .globl  fmod


fmod:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x28
        str     r0, [sp, #0x18]
        str     r2, [sp, #0x20]
        mov     r5, r1
        str     r1, [sp, #0x1C]
        mov     lr, r5, lsl #1
        str     r3, [sp, #0x24]
        mov     r1, r0
        cmn     lr, #2, 12
        mov     r0, r2
        mov     r12, #0
        bcs     LACN0
        mov     r4, r3, lsl #1
        cmn     r4, #2, 12
        bcs     LACN0
        orrs    r4, r4, r0
        bne     LACN8
LACN0:
        cmn     lr, #2, 12
        bhi     LACN1
        cmn     lr, #2, 12
        bne     LACN2
        cmp     r1, #0
        beq     LACN2
LACN1:
        mov     r0, r1
        orr     r5, r5, #2, 14
        mov     r1, r5
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LACN2:
        mov     r4, r3, lsl #1
        cmn     r4, #2, 12
        bhi     LACN3
        cmn     r4, #2, 12
        bne     LACN4
        cmp     r0, #0
        beq     LACN4
LACN3:
        orr     r1, r3, #2, 14
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LACN4:
        orrs    r0, r4, r0
        beq     LACN5
        cmn     lr, #2, 12
        bcc     LACN6
LACN5:
        sub     r5, r12, #2, 14
        mov     r1, #0
LACN6:
        cmp     r0, #0
        beq     LACN32
LACN7:
        mov     r0, r1
        mov     r1, r5
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LACN8:
        mvn     lr, #2, 2
        and     r4, r3, lr
        and     r3, r5, lr
        cmp     r3, r4
        bic     r7, r5, lr
        bcc     LACN9
        cmp     r3, r4
        bne     LACN10
        cmp     r1, r0
        bcs     LACN10
LACN9:
        mov     r0, r1
        orr     r7, r3, r7
        mov     r1, r7
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LACN10:
        mvn     lr, #0xFF, 12
        bic     r8, lr, #0xF, 4
        mov     lr, r3, lsl #1
        cmp     lr, #2, 12
        and     r3, r3, r8
        movcc   lr, #2, 12
        orrcs   r3, r3, #1, 12
        mov     r5, #0x33
        orr     r5, r5, #1, 22
        cmp     r3, #1, 12
        sub     lr, r5, lr, lsr #21
        bcs     LACN13
        cmp     r3, #0
        clz     r6, r3
        clzeq   r6, r1
        addeq   r6, r6, #0x20
        sub     r6, r6, #0xB
        cmp     r6, #0x20
        bgt     LACN11
        rsb     r9, r6, #0x20
        mov     r9, r1, lsr r9
        orr     r3, r9, r3, lsl r6
        mov     r1, r1, lsl r6
        b       LACN12
LACN11:
        cmp     r6, #0x40
        movgt   r1, #0
        movgt   r3, r1
        bgt     LACN12
        rsb     r3, r6, #0x40
        mov     r3, r12, lsr r3
        sub     r9, r6, #0x20
        orr     r3, r3, r1, lsl r9
        mov     r1, r12, lsl r9
LACN12:
        add     lr, lr, r6
LACN13:
        mov     r6, r4, lsl #1
        cmp     r6, #2, 12
        and     r4, r4, r8
        movcc   r6, #2, 12
        orrcs   r4, r4, #1, 12
        cmp     r4, #1, 12
        sub     r5, r5, r6, lsr #21
        bcs     LACN16
        cmp     r4, #0
        clz     r6, r4
        clzeq   r6, r0
        addeq   r6, r6, #0x20
        sub     r6, r6, #0xB
        cmp     r6, #0x20
        bgt     LACN14
        rsb     r12, r6, #0x20
        mov     r12, r0, lsr r12
        orr     r4, r12, r4, lsl r6
        mov     r0, r0, lsl r6
        b       LACN15
LACN14:
        cmp     r6, #0x40
        movgt   r0, #0
        movgt   r4, r0
        bgt     LACN15
        rsb     r4, r6, #0x40
        mov     r4, r12, lsr r4
        sub     r8, r6, #0x20
        orr     r4, r4, r0, lsl r8
        mov     r0, r12, lsl r8
LACN15:
        add     r5, r6, r5
LACN16:
        sub     r12, r5, lr
        mov     r5, r0, lsr #31
        orr     r6, r5, r4, lsl #1
        mov     r4, r1, lsr #31
        orr     r10, r4, r3, lsl #1
        mov     r8, r0, lsl #1
        bic     r1, r1, #2, 2
        mov     r3, r8, lsr #31
        orr     r5, r3, r6, lsl #1
        mov     r3, r8, lsr #30
        orr     r4, r3, r6, lsl #2
        orr     r3, r1, r10, lsl #31
        mov     r1, r10, asr #1
        mov     r10, r8, lsr #29
        orr     r10, r10, r6, lsl #3
        str     r10, [sp]
        movs    r9, r12, asr #2
        mov     r11, r0, lsl #2
        mov     r10, r0, lsl #3
        mov     r0, r0, lsl #4
        sub     r2, r12, r9, lsl #2
        beq     LACN22
        str     lr, [sp, #4]
        ldr     lr, [sp]
        str     r7, [sp, #8]
LACN17:
        mov     r7, r3, lsr #28
        mov     r3, r3, lsl #4
        cmp     r3, r0
        orr     r1, r7, r1, lsl #4
        sbcs    r7, r1, lr
        blt     LACN18
        subs    r3, r3, r0
        sbc     r1, r1, lr
LACN18:
        cmp     r3, r10
        sbcs    r7, r1, r4
        blt     LACN19
        subs    r3, r3, r10
        sbc     r1, r1, r4
LACN19:
        cmp     r3, r11
        sbcs    r7, r1, r5
        blt     LACN20
        subs    r3, r3, r11
        sbc     r1, r1, r5
LACN20:
        cmp     r3, r8
        sbcs    r7, r1, r6
        blt     LACN21
        subs    r3, r3, r8
        sbc     r1, r1, r6
LACN21:
        subs    r9, r9, #1
        bne     LACN17
        ldr     lr, [sp, #4]
        ldr     r7, [sp, #8]
LACN22:
        cmp     r2, #0
        beq     LACN25
LACN23:
        mov     r0, r3, lsr #31
        mov     r3, r3, lsl #1
        cmp     r3, r8
        orr     r1, r0, r1, lsl #1
        sbcs    r0, r1, r6
        blt     LACN24
        subs    r3, r3, r8
        sbc     r1, r1, r6
LACN24:
        subs    r2, r2, #1
        bne     LACN23
LACN25:
        mov     r0, r3, lsl #1
        mov     r3, r3, lsr #31
        cmp     r0, r8
        orr     r1, r3, r1, lsl #1
        sbcs    r2, r1, r6
        blt     LACN26
        subs    r0, r0, r8
        sbc     r1, r1, r6
LACN26:
        add     r12, lr, r12
        mvn     r2, #2, 2
        bics    r3, r1, r2
        add     lr, r12, #1
        beq     LACN27
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
LACN27:
        mov     r2, #0x33
        orr     r2, r2, #1, 22
        clz     r12, r1
        add     r4, r2, #9
        cmp     r12, #0x20
        rsb     lr, lr, r4
        beq     LACN33
LACN28:
        sub     r4, r12, #1
        rsb     r12, r4, #0x20
        mov     r12, r0, lsr r12
        orr     r12, r12, r1, lsl r4
        subs    r1, lr, r4
        mov     r4, r0, lsl r4
        bpl     LACN30
        rsb     r1, r1, #0
        cmp     r1, #0x20
        blt     LACN29
        mov     r4, r12
        mov     r12, r12, asr #31
        sub     r1, r1, #0x20
LACN29:
        cmp     r1, #0x20
        mov     r0, #0x20
        movgt   r1, r0
        mov     r4, r4, lsr r1
        rsb     r0, r1, #0x20
        orr     r4, r4, r12, lsl r0
        mov     r12, r12, asr r1
        mov     r1, #0
LACN30:
        mov     r0, r4, lsr #9
        and     lr, r0, #1
        mov     r0, r12, lsl #22
        orr     r4, r0, r4, lsr #10
        adds    r0, lr, r4
        mov     r12, r12, lsr #10
        adc     lr, r12, lr, asr #31
        orrs    r12, lr, lr, asr #31
        moveq   r1, #0
        beq     LACN31
        mov     r12, #0xFF
        orr     r12, r12, #7, 24
        sub     r12, r12, #1
        cmp     r12, r1
        bgt     LACN31
        mov     r0, #0
        add     r1, r2, #0xF3, 30
        mov     lr, r0
LACN31:
        add     r1, lr, r1, lsl #20
        orr     r3, r1, r3
        eor     r1, r7, r3
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LACN32:
        str     r1, [sp, #0x10]
        add     r2, sp, #0x10
        add     r0, sp, #0x18
        add     r4, sp, #0x20
        str     r5, [sp, #0x14]
        mov     r1, r4
        mov     r3, #0x79
        bl      __libm_error_support
        ldr     r1, [sp, #0x10]
        ldr     r5, [sp, #0x14]
        b       LACN7
LACN33:
        clz     r4, r0
        cmp     r4, #0
        beq     LACN28
        mov     r1, r0
        sub     lr, lr, #0x20
        mov     r12, r4
        mov     r0, #0
        b       LACN28


