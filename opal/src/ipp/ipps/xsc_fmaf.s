        .text
        .align  4
        .globl  fmaf


fmaf:
        stmdb   sp!, {r4 - r11, lr}
        mov     r4, r0
        mov     r0, r2
        mvn     r2, #2, 2
        and     r11, r4, r2
        and     r6, r1, r2
        mov     r8, r11, lsr #23
        and     r5, r0, r2
        cmp     r8, #0xFF
        bic     r3, r4, r2
        bic     r12, r1, r2
        bic     r9, r0, r2
        mov     r10, #0
        mov     r7, r6, lsr #23
        mov     lr, r5, lsr #23
        beq     LACS24
        cmp     r7, #0xFF
        beq     LACS24
        cmp     lr, #0xFF
        beq     LACS24
        cmp     r8, #0
        bne     LACS1
        cmp     r11, #0
        bne     LACS0
        orrs    r5, r5, #0
        eoreq   r12, r3, r12
        andeq   r0, r12, r9
        ldmneia sp!, {r4 - r11, pc}
        ldmia   sp!, {r4 - r11, pc}
LACS0:
        mvn     r10, #0
        add     r10, r10, #2, 10
        and     r4, r4, r10
        clz     r10, r4
        sub     r8, r8, r10
        mov     r4, r4, lsl r10
        sub     r10, r8, #0x95
        b       LACS3
LACS1:
        cmp     r7, #0
        beq     LACS2
        cmp     lr, #0
        bne     LACS8
LACS2:
        mov     r4, r4, lsl #8
        orr     r4, r4, #2, 2
        sub     r10, r8, #0x9E
LACS3:
        cmp     r7, #0
        bne     LACS5
        cmp     r6, #0
        bne     LACS4
        orrs    r5, r5, #0
        eoreq   r12, r3, r12
        andeq   r0, r12, r9
        ldmneia sp!, {r4 - r11, pc}
        ldmia   sp!, {r4 - r11, pc}
LACS4:
        mvn     r6, #0
        add     r6, r6, #2, 10
        and     r1, r1, r6
        clz     r6, r1
        sub     r7, r7, r6
        mov     r6, r1, lsl r6
        sub     r8, r7, #0x95
        b       LACS6
LACS5:
        mov     r1, r1, lsl #8
        orr     r6, r1, #2, 2
        sub     r8, r7, #0x9E
LACS6:
        cmp     lr, #0
        mvn     r1, #2, 2
        bne     LACS7
        cmp     r5, #0
        moveq   lr, r1, lsl #9
        mvn     r1, #0
        add     r1, r1, #2, 10
        and     r1, r0, r1
        clz     r5, r1
        sub     lr, lr, r5
        sub     r5, r5, #1
        mov     r7, r1, lsl r5
        sub     lr, lr, #0xB4
        mov     r5, #0
        b       LACS9
LACS7:
        mov     r5, r0, lsl #7
        orr     r5, r5, #1, 2
        and     r7, r5, r1
        sub     lr, lr, #0xBD
        mov     r5, #0
        b       LACS9
LACS8:
        mov     r5, r1, lsl #8
        mov     r6, r0, lsl #7
        orr     r1, r6, #1, 2
        orr     r6, r5, #2, 2
        sub     r10, r8, #0x9E
        mvn     r5, #2, 2
        sub     r8, r7, #0x9E
        mov     r4, r4, lsl #8
        and     r7, r1, r5
        sub     lr, lr, #0xBD
        orr     r4, r4, #2, 2
        mov     r5, #0
LACS9:
        umull   r4, r6, r4, r6
        cmp     r6, #0
        add     r8, r10, r8
        ble     LACS22
LACS10:
        cmp     r8, lr
        eor     r10, r3, r12
        blt     LACS11
        sub     r2, r8, lr
        mov     r0, r5
        mov     r3, r2, asr #31
        mov     r1, r7
        bl      __lshrdi3
        mov     r5, r0
        mov     r7, r1
        b       LACS12
LACS11:
        sub     r2, lr, r8
        mov     r0, r4
        mov     r3, r2, asr #31
        mov     r1, r6
        mov     r8, lr
        bl      __lshrdi3
        mov     r4, r0
        mov     r6, r1
LACS12:
        cmp     r6, r7
        bcc     LACS14
        cmp     r9, r10
        beq     LACS13
        subs    r0, r4, r5
        sbc     r1, r6, r7
        b       LACS16
LACS13:
        adds    r0, r5, r4
        adc     r1, r7, r6
        b       LACS16
LACS14:
        cmp     r9, r10
        mov     r10, r9
        beq     LACS15
        subs    r0, r5, r4
        sbc     r1, r7, r6
        b       LACS16
LACS15:
        adds    r0, r5, r4
        adc     r1, r7, r6
LACS16:
        cmp     r1, #0
        blt     LACS21
LACS17:
        cmp     r1, #0
        clzne   r2, r1
        bne     LACS18
        clz     r2, r0
        cmp     r0, #0
        add     r2, r2, #0x20
        moveq   r0, #0
        ldmeqia sp!, {r4 - r11, pc}
LACS18:
        sub     r4, r2, #1
        mov     r2, r4
        mov     r3, #0
        bl      __ashldi3
        mov     r2, r1, lsl #25
        sub     r8, r8, r4
        orr     r2, r2, r0, lsr #7
        adds    r0, r8, #0xBC
        mov     r1, r1, lsr #7
        bmi     LACS32
        adds    r2, r1, r2, lsr #31
        cmp     r0, #0xFD
        blt     LACS20
        cmp     r0, #0xFD
        bne     LACS19
        cmp     r2, #1, 8
        bcs     LACS19
        add     r0, r2, r0, lsl #23
        orr     r0, r0, r10
        ldmia   sp!, {r4 - r11, pc}
LACS19:
        mov     r0, #0xFE, 10
        orr     r0, r0, #1, 2
        orr     r0, r10, r0
        ldmia   sp!, {r4 - r11, pc}
LACS20:
        add     r0, r2, r0, lsl #23
        orr     r0, r0, r10
        ldmia   sp!, {r4 - r11, pc}
LACS21:
        mov     r2, r1, lsl #31
        orr     r0, r2, r0, lsr #1
        mov     r1, r1, lsr #1
        add     r8, r8, #1
        b       LACS17
LACS22:
        mov     r10, r6, lsl #31
        orr     r4, r10, r4, lsr #1
        mov     r6, r6, lsr #1
        orrs    r10, r4, r6
        add     r8, r8, #1
        bne     LACS10
LACS23:
        ldmia   sp!, {r4 - r11, pc}
LACS24:
        mov     lr, #0xFE, 10
        orr     lr, lr, #1, 2
        cmp     lr, r11
        bcc     LACS31
        cmp     lr, r6
        bcc     LACS30
        mov     r1, #0
        cmp     r1, #0
        cmp     r10, #0
        cmpeq   r5, lr
        bhi     LACS29
        cmp     lr, r11
        bne     LACS26
        cmp     r6, #0
        beq     LACS27
        eor     r12, r3, r12
        teq     r12, r9
        beq     LACS25
        cmp     r1, #0
        cmpeq   r5, lr
        bne     LACS25
        mov     r0, r2, lsl #22
        ldmia   sp!, {r4 - r11, pc}
LACS25:
        orr     r0, r11, r12
        ldmia   sp!, {r4 - r11, pc}
LACS26:
        cmp     lr, r6
        bne     LACS23
        cmp     r11, #0
        beq     LACS27
        eor     r12, r3, r12
        teq     r12, r9
        beq     LACS28
        cmp     r1, #0
        cmpeq   r5, lr
        bne     LACS28
LACS27:
        mov     r0, r2, lsl #22
        ldmia   sp!, {r4 - r11, pc}
LACS28:
        orr     r0, r12, r6
        ldmia   sp!, {r4 - r11, pc}
LACS29:
        orr     r0, r0, #1, 10
        ldmia   sp!, {r4 - r11, pc}
LACS30:
        orr     r0, r1, #1, 10
        ldmia   sp!, {r4 - r11, pc}
LACS31:
        orr     r0, r4, #1, 10
        ldmia   sp!, {r4 - r11, pc}
LACS32:
        mvn     r2, #0
        rsb     r2, r0, r2
        mov     r2, r1, lsr r2
        and     r0, r2, #1
        add     r2, r0, r2, lsr #1
        orr     r0, r10, r2
        ldmia   sp!, {r4 - r11, pc}


