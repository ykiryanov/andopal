        .text
        .align  4
        .globl  modf


modf:
        stmdb   sp!, {r4 - r10, lr}
        mov     r4, r1
        mvn     r3, #2, 2
        and     r12, r4, r3
        add     lr, r12, #1, 12
        mov     r1, r0
        cmp     lr, #1, 2
        mov     r8, #0
        bic     r0, r4, r3
        bge     LABI2
        cmp     lr, #0
        blt     LABI0
        str     r0, [r2, #4]
        mov     r0, r1
        mov     r1, r4
        str     r8, [r2]
        ldmia   sp!, {r4 - r10, pc}
LABI0:
        orrs    r3, r1, r12, lsl #12
        str     r1, [r2]
        bne     LABI1
        mov     r1, r0
        mov     r0, #0
        str     r4, [r2, #4]
        ldmia   sp!, {r4 - r10, pc}
LABI1:
        orr     r12, r12, #2, 14
        eor     r3, r0, r12
        mov     r0, r1
        mov     r1, r3
        str     r3, [r2, #4]
        ldmia   sp!, {r4 - r10, pc}
LABI2:
        mvn     lr, #0xFF, 12
        str     r4, [r2, #4]
        bic     lr, lr, #0xF, 4
        mov     r4, r12, lsl #1
        cmp     r4, #2, 12
        str     r1, [r2]
        and     lr, r12, lr
        movcc   r4, #2, 12
        orrcs   lr, lr, #1, 12
        mov     r12, #0x33
        orr     r12, r12, #1, 22
        sub     r5, r12, r4, lsr #21
        cmp     r5, #0
        ble     LABI18
        cmp     r5, #0x20
        bgt     LABI3
        rsb     r12, r5, #0x20
        mov     r4, r1, lsr r5
        orr     r8, r4, lr, lsl r12
        mov     r4, r8, lsr r12
        mov     r12, lr, lsr r5
        orr     r7, r4, r12, lsl r5
        mov     r6, r8, lsl r5
        b       LABI5
LABI3:
        cmp     r5, #0x40
        bgt     LABI4
        mov     r4, r8
        sub     r6, r5, #0x20
        rsb     r12, r5, #0x40
        mov     r7, lr, lsr r6
        orr     r8, r7, r4, lsl r12
        mov     r12, r4, lsr r12
        orr     r7, r12, r8, lsl r6
        mov     r12, r4, lsr r6
        mov     r6, r4, lsl r6
        b       LABI5
LABI4:
        mov     r6, r8
        mov     r7, r6
        mov     r12, r7
LABI5:
        subs    r4, r1, r6
        sbc     lr, lr, r7
        bics    r7, r12, r3
        beq     LABI6
        rsbs    r8, r8, #0
        rsc     r12, r12, #0
LABI6:
        mov     r6, #0x1C
        orr     r6, r6, #1, 22
        clz     r10, r12
        cmp     r10, #0x20
        add     r6, r6, #0x20
        beq     LABI17
LABI7:
        sub     r9, r10, #1
        rsb     r10, r9, #0x20
        mov     r10, r8, lsr r10
        subs    r6, r6, r9
        orr     r12, r10, r12, lsl r9
        mov     r8, r8, lsl r9
        bpl     LABI9
        rsb     r6, r6, #0
        cmp     r6, #0x20
        blt     LABI8
        mov     r8, r12
        mov     r12, r12, asr #31
        sub     r6, r6, #0x20
LABI8:
        cmp     r6, #0x20
        mov     r9, #0x20
        movgt   r6, r9
        mov     r8, r8, lsr r6
        rsb     r9, r6, #0x20
        orr     r8, r8, r12, lsl r9
        mov     r12, r12, asr r6
        mov     r6, #0
LABI9:
        mov     r9, r8, lsr #9
        mov     r10, r12, lsl #22
        orr     r8, r10, r8, lsr #10
        and     r9, r9, #1
        adds    r8, r9, r8
        mov     r12, r12, lsr #10
        adc     r9, r12, r9, asr #31
        mov     r12, #0xFF
        orrs    r10, r9, r9, asr #31
        orr     r12, r12, #7, 24
        moveq   r6, #0
        beq     LABI10
        sub     r10, r12, #1
        cmp     r10, r6
        bgt     LABI10
        mov     r6, #0x33
        orr     r6, r6, #1, 22
        mov     r9, #0
        add     r6, r6, #0xF3, 30
        mov     r8, r9
LABI10:
        add     r6, r9, r6, lsl #20
        orr     r7, r6, r7
        eor     r6, r0, r7
        bics    r3, lr, r3
        str     r8, [r2]
        str     r6, [r2, #4]
        beq     LABI11
        rsbs    r4, r4, #0
        rsc     lr, lr, #0
LABI11:
        mov     r2, #0x1C
        orr     r2, r2, #1, 22
        clz     r7, lr
        add     r6, r2, #0x20
        cmp     r7, #0x20
        rsb     r6, r5, r6
        beq     LABI16
LABI12:
        sub     r7, r7, #1
        rsb     r5, r7, #0x20
        mov     r5, r4, lsr r5
        orr     r5, r5, lr, lsl r7
        subs    lr, r6, r7
        mov     r7, r4, lsl r7
        bpl     LABI14
        rsb     lr, lr, #0
        cmp     lr, #0x20
        blt     LABI13
        mov     r7, r5
        mov     r5, r5, asr #31
        sub     lr, lr, #0x20
LABI13:
        cmp     lr, #0x20
        mov     r4, #0x20
        movgt   lr, r4
        mov     r7, r7, lsr lr
        rsb     r4, lr, #0x20
        orr     r7, r7, r5, lsl r4
        mov     r5, r5, asr lr
        mov     lr, #0
LABI14:
        mov     r4, r7, lsr #9
        and     r4, r4, #1
        mov     r6, r5, lsl #22
        orr     r7, r6, r7, lsr #10
        adds    r1, r4, r7
        mov     r5, r5, lsr #10
        adc     r4, r5, r4, asr #31
        orrs    r5, r4, r4, asr #31
        moveq   lr, #0
        beq     LABI15
        sub     r12, r12, #1
        cmp     r12, lr
        bgt     LABI15
        add     r2, r2, #0x17
        mov     r1, #0
        add     lr, r2, #0xF3, 30
        mov     r4, r1
LABI15:
        add     lr, r4, lr, lsl #20
        orr     r3, lr, r3
        eor     r2, r0, r3
        mov     r0, r1
        mov     r1, r2
        ldmia   sp!, {r4 - r10, pc}
LABI16:
        clz     r5, r4
        cmp     r5, #0
        beq     LABI12
        mov     lr, r4
        sub     r6, r6, #0x20
        mov     r7, r5
        mov     r4, #0
        b       LABI12
LABI17:
        clz     r9, r8
        cmp     r9, #0
        beq     LABI7
        mov     r12, r8
        mov     r6, #0x20
        add     r6, r6, #0xFF, 30
        mov     r10, r9
        mov     r8, #0
        b       LABI7
LABI18:
        mov     r1, r0
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}


