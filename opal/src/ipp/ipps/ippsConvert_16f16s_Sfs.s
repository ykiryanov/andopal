        .text
        .align  4
        .globl  _ippsConvert_16f16s_Sfs


_ippsConvert_16f16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        ldr     r12, [sp, #0x30]
        cmp     r0, #0
        beq     LCWU39
        cmp     r1, #0
        beq     LCWU39
        cmp     r2, #0
        ble     LCWU40
        mvn     r4, #0xFF
        mov     lr, #0xFF
        cmp     r12, #0
        bic     r4, r4, #0x7F, 24
        orr     lr, lr, #0x7F, 24
        mov     r5, #0
        bne     LCWU5
        cmp     r3, #1
        mov     r12, r5
        sub     r3, r5, #2, 18
        beq     LCWU18
LCWU0:
        ldrsh   r6, [r0], #2
        and     r7, r6, #0x1F, 22
        movs    r7, r7, asr #10
        streqh  r12, [r1]
        beq     LCWU4
        cmp     r7, #0x1F
        beq     LCWU17
        sub     r8, lr, #0x1F, 22
        and     r8, r6, r8
        subs    r7, r7, #0x19
        orr     r8, r8, #1, 22
        bmi     LCWU2
        cmp     r7, #4
        bgt     LCWU1
        cmp     r6, #0
        mov     r7, r8, lsl r7
        rsblt   r7, r7, #0
        b       LCWU3
LCWU1:
        cmp     r6, #0
        movlt   r6, #0
        sublt   r7, r6, #2, 18
        mvnge   r7, r4
        b       LCWU3
LCWU2:
        rsb     r7, r7, #0
        cmp     r7, #0xA
        movgt   r7, #0
        movle   r7, r8, asr r7
        cmp     r6, #0
        rsblt   r7, r7, #0
LCWU3:
        strh    r7, [r1]
LCWU4:
        add     r5, r5, #1
        cmp     r5, r2
        add     r1, r1, #2
        blt     LCWU0
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LCWU5:
        cmp     r3, #1
        mvn     r6, r4
        sub     r3, r5, #2, 18
        beq     LCWU26
LCWU6:
        ldrsh   r8, [r0], #2
        sub     r7, lr, #0x1F, 22
        and     r9, r8, #0x1F, 22
        and     r7, r8, r7
        movs    r9, r9, asr #10
        beq     LCWU10
        cmp     r9, #0x1F
        beq     LCWU25
        sub     r9, r9, #0x19
        subs    r9, r9, r12
        orr     r7, r7, #1, 22
        bmi     LCWU8
        cmp     r9, #4
        bgt     LCWU7
        cmp     r8, #0
        mov     r9, r7, lsl r9
        rsblt   r9, r9, #0
        b       LCWU9
LCWU7:
        cmp     r8, #0
        movlt   r7, #0
        sublt   r9, r7, #2, 18
        mvnge   r9, r4
        b       LCWU9
LCWU8:
        rsb     r9, r9, #0
        cmp     r9, #0xB
        movgt   r9, #0
        movle   r9, r7, asr r9
        cmp     r8, #0
        rsblt   r9, r9, #0
LCWU9:
        strh    r9, [r1]
        b       LCWU16
LCWU10:
        cmp     r7, #0
        beq     LCWU15
        mvn     r9, #0x17
        rsbs    r9, r12, r9
        bmi     LCWU11
        cmp     r9, #0x10
        movlt   r7, r7, lsl r9
        blt     LCWU12
        b       LCWU13
LCWU11:
        rsb     r9, r9, #0
        cmp     r9, #0xA
        movgt   r7, #0
        movle   r7, r7, asr r9
        bgt     LCWU14
LCWU12:
        cmp     r6, r7
        bge     LCWU14
LCWU13:
        cmp     r8, #0
        movlt   r7, #0
        sublt   r7, r7, #2, 18
        mvnge   r7, r4
        b       LCWU15
LCWU14:
        cmp     r8, #0
        rsblt   r7, r7, #0
LCWU15:
        strh    r7, [r1]
LCWU16:
        add     r5, r5, #1
        cmp     r5, r2
        add     r1, r1, #2
        blt     LCWU6
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LCWU17:
        cmp     r6, #0x1F, 22
        mvneq   r6, r4
        streqh  r6, [r1]
        strneh  r3, [r1]
        b       LCWU4
LCWU18:
        ldrsh   r8, [r0], #2
        and     r6, r8, #0x1F, 22
        movs    r6, r6, asr #10
        streqh  r12, [r1]
        beq     LCWU23
        cmp     r6, #0x1F
        beq     LCWU24
        sub     r7, lr, #0x1F, 22
        and     r7, r8, r7
        subs    r6, r6, #0x19
        orr     r7, r7, #1, 22
        bmi     LCWU20
        cmp     r6, #4
        bgt     LCWU19
        cmp     r8, #0
        mov     r6, r7, lsl r6
        rsblt   r6, r6, #0
        b       LCWU22
LCWU19:
        cmp     r8, #0
        movlt   r6, #0
        sublt   r6, r6, #2, 18
        mvnge   r6, r4
        b       LCWU22
LCWU20:
        rsb     r6, r6, #0
        cmp     r6, #0xB
        movgt   r6, #0
        bgt     LCWU21
        mov     r9, r7, asr r6
        rsb     r11, r6, #0xB
        and     r9, r9, #1
        sub     r10, lr, #0x1F, 22
        add     r11, r9, r10, asr r11
        add     r11, r7, r11
        mov     r6, r11, asr r6
LCWU21:
        cmp     r8, #0
        rsblt   r6, r6, #0
LCWU22:
        strh    r6, [r1]
LCWU23:
        add     r5, r5, #1
        cmp     r5, r2
        add     r1, r1, #2
        blt     LCWU18
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LCWU24:
        cmp     r8, #0x1F, 22
        mvneq   r6, r4
        streqh  r6, [r1]
        strneh  r3, [r1]
        b       LCWU23
LCWU25:
        cmp     r8, #0x1F, 22
        streqh  r6, [r1]
        strneh  r3, [r1]
        b       LCWU16
LCWU26:
        ldrsh   r7, [r0], #2
        sub     r8, lr, #0x1F, 22
        and     r9, r7, #0x1F, 22
        and     r8, r7, r8
        movs    r9, r9, asr #10
        beq     LCWU31
        cmp     r9, #0x1F
        beq     LCWU38
        sub     r9, r9, #0x19
        subs    r9, r9, r12
        orr     r8, r8, #1, 22
        bmi     LCWU28
        cmp     r9, #4
        bgt     LCWU27
        cmp     r7, #0
        mov     r9, r8, lsl r9
        rsblt   r9, r9, #0
        b       LCWU30
LCWU27:
        cmp     r7, #0
        movlt   r7, #0
        sublt   r9, r7, #2, 18
        mvnge   r9, r4
        b       LCWU30
LCWU28:
        rsb     r9, r9, #0
        cmp     r9, #0xB
        str     r9, [sp]
        movgt   r9, #0
        bgt     LCWU29
        mov     r9, #0xFF
        ldr     r10, [sp]
        orr     r9, r9, #0x7F, 24
        sub     r9, r9, #0x1F, 22
        str     r9, [sp, #4]
        mov     r9, r8, asr r10
        rsb     r10, r10, #0xB
        str     r10, [sp, #8]
        ldr     r10, [sp, #8]
        ldr     r11, [sp, #4]
        and     r9, r9, #1
        add     r10, r9, r11, asr r10
        ldr     r9, [sp]
        add     r8, r8, r10
        mov     r9, r8, asr r9
LCWU29:
        cmp     r7, #0
        rsblt   r9, r9, #0
LCWU30:
        strh    r9, [r1]
        b       LCWU37
LCWU31:
        cmp     r8, #0
        beq     LCWU36
        mvn     r9, #0x17
        rsbs    r9, r12, r9
        bmi     LCWU32
        cmp     r9, #0x10
        movlt   r8, r8, lsl r9
        blt     LCWU33
        b       LCWU34
LCWU32:
        rsb     r9, r9, #0
        cmp     r9, #0xA
        str     r9, [sp]
        movgt   r8, #0
        bgt     LCWU35
        mov     r9, #0xFF
        ldr     r10, [sp]
        orr     r9, r9, #0x7F, 24
        sub     r9, r9, #0x7E, 24
        str     r9, [sp, #8]
        mov     r9, r8, asr r10
        rsb     r10, r10, #0xA
        str     r10, [sp, #4]
        ldr     r10, [sp, #4]
        ldr     r11, [sp, #8]
        and     r9, r9, #1
        add     r10, r9, r11, asr r10
        ldr     r9, [sp]
        add     r8, r8, r10
        mov     r8, r8, asr r9
LCWU33:
        cmp     r6, r8
        bge     LCWU35
LCWU34:
        cmp     r7, #0
        movlt   r7, #0
        sublt   r8, r7, #2, 18
        mvnge   r8, r4
        b       LCWU36
LCWU35:
        cmp     r7, #0
        rsblt   r8, r8, #0
LCWU36:
        strh    r8, [r1]
LCWU37:
        add     r5, r5, #1
        cmp     r5, r2
        add     r1, r1, #2
        blt     LCWU26
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LCWU38:
        cmp     r7, #0x1F, 22
        streqh  r6, [r1]
        strneh  r3, [r1]
        b       LCWU37
LCWU39:
        mvn     r0, #7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LCWU40:
        mvn     r0, #5
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}


