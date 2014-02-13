        .text
        .align  4
        .globl  _ippsSqrt_16sc_ISfs


_ippsSqrt_16sc_ISfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        mov     r8, r0
        cmp     r8, #0
        mov     r5, r1
        mov     r9, r2
        beq     LAWC33
        cmp     r5, #0
        ble     LAWC34
        mov     r3, #0xFE, 12
        cmp     r9, #0
        orr     r6, r3, #3, 4
        mov     r7, #0
        blt     LAWC18
        cmp     r9, #8
        bgt     LAWC13
        cmp     r9, #0
        bne     LAWC5
        cmp     r5, #0
        ble     LAWC17
        ldr     r4, [pc, #0x944]
        ldr     r2, [pc, #0x944]
        ldr     r3, [pc, #0x944]
        ldr     r12, [pc, #0x944]
        sub     r8, r8, #2
        str     r6, [sp, #4]
LAWC0:
        ldrsh   r11, [r8, #2]
        ldrsh   r6, [r8, #4]
        mul     r0, r11, r11
        bl      __floatsidf
        mul     r2, r6, r6
        mov     r9, r0
        mov     r10, r1
        mov     r0, r2
        bl      __floatsidf
        mov     r2, r9
        mov     r3, r10
        bl      __adddf3
        bl      sqrt
        ldr     r3, [sp, #4]
        mov     r2, #0
        bl      __adddf3
        bl      __fixdfsi
        add     r2, r11, r0
        sub     r11, r0, r11
        and     r0, r2, #1
        add     r0, r0, r2, lsr #1
        and     r2, r11, #1
        tst     r0, #0xF, 20
        add     r2, r2, r11, lsr #1
        beq     LAWC1
        ldr     r3, [pc, #0x8CC]
        ldrb    r3, [r3, +r0, lsr #8]
        mov     r12, r3, lsl #1
        ldrh    r12, [r4, +r12]
        cmp     r12, r0
        bcs     LAWC2
        add     r3, r3, #1
        mov     r12, r3, lsl #1
        ldrh    r12, [r4, +r12]
        cmp     r12, r0
        addcc   r3, r3, #1
        b       LAWC2
LAWC1:
        tst     r0, #0xFE, 28
        ldreq   r3, [pc, #0x8A0]
        ldreqsb r3, [r0, +r3]
        beq     LAWC2
        ldr     r3, [pc, #0x890]
        mov     r12, r0, lsr #4
        ldrsb   r3, [r3, +r12]
        mov     r12, r3, lsl #1
        ldrh    r12, [r4, +r12]
        cmp     r12, r0
        addcc   r3, r3, #1
LAWC2:
        tst     r2, #0xF, 20
        strh    r3, [r8, #2]
        beq     LAWC3
        ldr     r0, [pc, #0x864]
        ldrb    r0, [r0, +r2, lsr #8]
        mov     r3, r0, lsl #1
        ldrh    r3, [r4, +r3]
        cmp     r3, r2
        bcs     LAWC4
        add     r0, r0, #1
        mov     r3, r0, lsl #1
        ldrh    r3, [r4, +r3]
        cmp     r3, r2
        addcc   r0, r0, #1
        b       LAWC4
LAWC3:
        tst     r2, #0xFE, 28
        ldreq   r0, [pc, #0x838]
        ldreqsb r0, [r2, +r0]
        beq     LAWC4
        ldr     r0, [pc, #0x828]
        mov     r3, r2, lsr #4
        ldrsb   r0, [r0, +r3]
        mov     r3, r0, lsl #1
        ldrh    r3, [r4, +r3]
        cmp     r3, r2
        addcc   r0, r0, #1
LAWC4:
        cmp     r6, #0
        rsblt   r0, r0, #0
        add     r7, r7, #1
        strh    r0, [r8, #4]!
        cmp     r7, r5
        blt     LAWC0
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LAWC5:
        mov     r12, r9, lsl #1
        mov     r3, #1
        mov     r4, r3, lsl r12
        sub     lr, r12, #1
        orr     r4, r4, r3, lsl lr
        cmp     r5, #0
        add     r12, r12, #1
        sub     lr, r9, #1
        ble     LAWC17
        ldr     r6, [pc, #0x7BC]
        ldr     r10, [pc, #0x7BC]
        ldr     r11, [pc, #0x7BC]
        ldr     r0, [pc, #0x7BC]
        sub     r8, r8, #2
        str     lr, [sp, #4]
        str     r12, [sp, #8]
        str     r9, [sp]
LAWC6:
        ldrsh   r9, [r8, #4]
        ldrsh   r10, [r8, #2]
        mul     r0, r9, r9
        mla     r11, r10, r10, r0
        mov     r0, r11
        bl      __floatunssidf
        bl      sqrt
        bl      __fixdfsi
        mul     r2, r0, r0
        cmp     r11, r2
        movne   r2, #0
        moveq   r2, #1
        add     r3, r10, r0
        sub     r10, r0, r10
        ldr     r0, [sp, #8]
        add     r12, r4, r3
        add     lr, r4, r10
        mov     r12, r12, lsr r0
        tst     r12, #0xF, 20
        mov     r0, lr, lsr r0
        beq     LAWC7
        ldr     lr, [pc, #0x74C]
        ldrb    lr, [lr, +r12, lsr #8]
        mov     r11, lr, lsl #1
        ldrh    r11, [r6, +r11]
        cmp     r11, r12
        bcs     LAWC8
        add     lr, lr, #1
        mov     r11, lr, lsl #1
        ldrh    r11, [r6, +r11]
        cmp     r11, r12
        addcc   lr, lr, #1
        b       LAWC8
LAWC7:
        tst     r12, #0xFE, 28
        ldreq   lr, [pc, #0x720]
        ldreqsb lr, [r12, +lr]
        beq     LAWC8
        ldr     r11, [pc, #0x710]
        mov     lr, r12, lsr #4
        ldrsb   lr, [r11, +lr]
        mov     r11, lr, lsl #1
        ldrh    r11, [r6, +r11]
        cmp     r11, r12
        addcc   lr, lr, #1
LAWC8:
        cmp     r2, #0
        beq     LAWC9
        tst     lr, #1
        beq     LAWC9
        ldr     r12, [sp]
        ldr     r11, [sp, #4]
        mov     r1, #1
        mov     r12, lr, lsl r12
        sub     r11, r12, r1, lsl r11
        mul     r12, r11, r11
        cmp     r3, r12, lsl #1
        subeq   lr, lr, #1
LAWC9:
        tst     r0, #0xF, 20
        strh    lr, [r8, #2]
        beq     LAWC10
        ldr     r3, [pc, #0x6B4]
        ldrb    r3, [r3, +r0, lsr #8]
        mov     r12, r3, lsl #1
        ldrh    r12, [r6, +r12]
        cmp     r12, r0
        bcs     LAWC11
        add     r3, r3, #1
        mov     r12, r3, lsl #1
        ldrh    r12, [r6, +r12]
        cmp     r12, r0
        addcc   r3, r3, #1
        b       LAWC11
LAWC10:
        tst     r0, #0xFE, 28
        ldreq   r3, [pc, #0x688]
        ldreqsb r3, [r0, +r3]
        beq     LAWC11
        ldr     r12, [pc, #0x678]
        mov     r3, r0, lsr #4
        ldrsb   r3, [r12, +r3]
        mov     r12, r3, lsl #1
        ldrh    r12, [r6, +r12]
        cmp     r12, r0
        addcc   r3, r3, #1
LAWC11:
        cmp     r2, #0
        beq     LAWC12
        tst     r3, #1
        beq     LAWC12
        ldr     r0, [sp]
        ldr     r2, [sp, #4]
        mov     r12, #1
        mov     r0, r3, lsl r0
        sub     r2, r0, r12, lsl r2
        mul     r0, r2, r2
        cmp     r10, r0, lsl #1
        subeq   r3, r3, #1
LAWC12:
        mov     r3, r3, lsl #16
        cmp     r9, #0
        mov     r3, r3, asr #16
        rsblt   r3, r3, #0
        add     r7, r7, #1
        strh    r3, [r8, #4]!
        cmp     r7, r5
        blt     LAWC6
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LAWC13:
        cmp     r5, #6
        movlt   r2, r7
        blt     LAWC15
        mov     r2, r7
        sub     r3, r5, #6
        mov     r12, r2
        sub     lr, r8, #2
LAWC14:
        add     r2, r2, #5
        strh    r12, [lr, #2]
        strh    r12, [lr, #4]
        strh    r12, [lr, #6]
        strh    r12, [lr, #8]
        strh    r12, [lr, #0xA]
        strh    r12, [lr, #0xC]
        strh    r12, [lr, #0xE]
        strh    r12, [lr, #0x10]
        strh    r12, [lr, #0x12]
        strh    r12, [lr, #0x14]!
        cmp     r2, r3
        ble     LAWC14
LAWC15:
        mov     r3, r2, lsl #2
        sub     r3, r3, #2
        add     r8, r3, r8
LAWC16:
        add     r2, r2, #1
        strh    r7, [r8, #2]
        strh    r7, [r8, #4]!
        cmp     r2, r5
        blt     LAWC16
LAWC17:
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LAWC18:
        cmp     r9, #0
        mov     r10, r9
        movge   r4, r7
        addge   r1, r6, #1, 12
        bge     LAWC21
        rsb     r3, r9, #0
        cmp     r3, #6
        movlt   r4, r7
        addlt   r1, r6, #1, 12
        blt     LAWC20
        mov     r4, r7
        add     r1, r6, #1, 12
LAWC19:
        mov     r2, r4
        mov     r3, r1
        mov     r0, r4
        bl      __adddf3
        mov     r2, r0
        mov     r3, r1
        bl      __adddf3
        mov     r2, r0
        mov     r3, r1
        bl      __adddf3
        mov     r2, r0
        mov     r3, r1
        bl      __adddf3
        mov     r2, r0
        mov     r3, r1
        bl      __adddf3
        add     r10, r10, #5
        cmn     r10, #6
        mov     r4, r0
        blt     LAWC19
LAWC20:
        mov     r0, r4
        mov     r2, r4
        mov     r3, r1
        bl      __adddf3
        adds    r10, r10, #1
        mov     r4, r0
        bmi     LAWC20
LAWC21:
        cmn     r9, #7
        blt     LAWC24
        cmp     r5, #0
        ble     LAWC17
        sub     r8, r8, #2
        str     r1, [sp, #8]
        str     r7, [sp, #0xC]
        str     r6, [sp, #4]
        str     r5, [sp, #0x10]
LAWC22:
        ldrsh   r11, [r8, #2]
        mov     r0, r11
        bl      __floatsidf
        ldr     r5, [sp, #4]
        mov     r3, r5
        mov     r2, #0
        bl      __muldf3
        ldrsh   r6, [r8, #4]
        mov     r7, r0
        mov     r9, r1
        mov     r0, r6
        bl      __floatsidf
        mov     r3, r5
        mov     r2, #0
        bl      __muldf3
        mov     r10, r1
        bic     r12, r10, #2, 2
        cmp     r11, #0
        mov     r5, r0
        str     r12, [sp]
        ble     LAWC31
        mov     r0, r7
        mov     r1, r9
        mov     r2, r7
        mov     r3, r9
        bl      __muldf3
        str     r0, [sp, #0x18]
        mov     r11, r1
        mov     r1, r10
        mov     r3, r10
        mov     r0, r5
        mov     r2, r5
        bl      __muldf3
        ldr     r2, [sp, #0x18]
        mov     r3, r11
        bl      __adddf3
        bl      sqrt
        mov     r2, r7
        mov     r3, r9
        bl      __adddf3
        bl      sqrt
        mov     r7, r1
        ldr     r1, [sp]
        mov     r9, r0
        mov     r0, r5
        mov     r2, r9
        mov     r3, r7
        bl      __divdf3
        mov     r10, r0
        mov     r11, r1
LAWC23:
        mov     r0, r10
        mov     r1, r11
        mov     r2, r4
        ldr     r11, [sp, #8]
        mov     r3, r11
        bl      __muldf3
        mov     r12, #0xFE, 12
        orr     r5, r12, #3, 4
        mov     r2, #0
        mov     r3, r5
        bl      __adddf3
        str     r0, [sp]
        mov     r10, r1
        mov     r0, r9
        mov     r1, r7
        mov     r2, r4
        mov     r3, r11
        bl      __muldf3
        mov     r3, r5
        mov     r2, #0
        bl      __adddf3
        cmp     r6, #0
        eorlt   r10, r10, #2, 2
        bl      __fixdfsi
        strh    r0, [r8, #2]
        ldr     r0, [sp]
        mov     r1, r10
        bl      __fixdfsi
        strh    r0, [r8, #4]!
        ldr     r1, [sp, #0xC]
        ldr     r3, [sp, #0x10]
        add     r1, r1, #1
        str     r1, [sp, #0xC]
        cmp     r1, r3
        blt     LAWC22
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LAWC24:
        cmp     r5, #0
        ble     LAWC17
        ldr     r12, [pc, #0x364]
        sub     r8, r8, #2
        mov     r9, r7
        str     r1, [sp, #8]
        str     r4, [sp, #0x14]
        str     r7, [sp, #0xC]
        str     r6, [sp, #4]
        str     r5, [sp, #0x10]
LAWC25:
        ldrsh   r11, [r8, #2]
        mov     r0, r11
        bl      __floatsidf
        ldr     r4, [sp, #4]
        mov     r3, r4
        mov     r2, #0
        bl      __muldf3
        ldrsh   r5, [r8, #4]
        mov     r6, r0
        mov     r7, r1
        mov     r0, r5
        bl      __floatsidf
        mov     r3, r4
        mov     r2, #0
        bl      __muldf3
        mov     r10, r1
        bic     r12, r10, #2, 2
        cmp     r11, #0
        mov     r4, r0
        str     r12, [sp]
        ble     LAWC28
        mov     r0, r6
        mov     r1, r7
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        str     r0, [sp, #0x18]
        mov     r11, r1
        mov     r1, r10
        mov     r3, r10
        mov     r0, r4
        mov     r2, r4
        bl      __muldf3
        ldr     r2, [sp, #0x18]
        mov     r3, r11
        bl      __adddf3
        bl      sqrt
        mov     r2, r6
        mov     r3, r7
        bl      __adddf3
        bl      sqrt
        mov     r6, r1
        ldr     r1, [sp]
        mov     r7, r0
        mov     r0, r4
        mov     r2, r7
        mov     r3, r6
        bl      __divdf3
        mov     r10, r0
        mov     r11, r1
LAWC26:
        mov     r0, r10
        mov     r1, r11
        ldr     r2, [sp, #0x14]
        ldr     r3, [sp, #8]
        bl      __muldf3
        mov     r12, #0xFE, 12
        orr     r11, r12, #3, 4
        mov     r2, #0
        mov     r3, r11
        bl      __adddf3
        ldr     r2, [sp, #0x14]
        ldr     r3, [sp, #8]
        mov     r10, r1
        mov     r4, r0
        mov     r1, r6
        mov     r0, r7
        bl      __muldf3
        mov     r2, #0
        mov     r3, r11
        bl      __adddf3
        mov     r6, r1
        ldr     r1, [pc, #0x228]
        mov     r7, r0
        mov     r2, r7
        mov     r3, r6
        mov     r0, #0
        bl      __ltdf2
        ldr     r12, [sp, #0xC]
        cmp     r0, #0
        movlt   r7, r12
        ldr     r12, [pc, #0x204]
        movlt   r6, r12
        cmp     r5, #0
        blt     LAWC30
        ldr     r1, [pc, #0x1F4]
        mov     r2, r4
        mov     r3, r10
        mov     r0, #0
        bl      __ltdf2
        ldr     r12, [sp, #0xC]
        cmp     r0, #0
        movlt   r4, r12
        ldr     r12, [pc, #0x1D4]
        movlt   r10, r12
LAWC27:
        mov     r0, r7
        mov     r1, r6
        bl      __fixdfsi
        strh    r0, [r8, #2]
        mov     r0, r4
        mov     r1, r10
        bl      __fixdfsi
        strh    r0, [r8, #4]!
        ldr     r0, [sp, #0x10]
        add     r9, r9, #1
        cmp     r9, r0
        blt     LAWC25
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LAWC28:
        cmp     r11, #0
        beq     LAWC29
        mov     r0, r6
        mov     r1, r7
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        str     r0, [sp, #0x18]
        str     r1, [sp, #0x1C]
        mov     r1, r10
        mov     r3, r10
        mov     r0, r4
        mov     r2, r4
        bl      __muldf3
        ldr     r2, [sp, #0x18]
        ldr     r3, [sp, #0x1C]
        bl      __adddf3
        bl      sqrt
        mov     r2, r6
        mov     r3, r7
        bl      __subdf3
        bl      sqrt
        mov     r11, r1
        ldr     r1, [sp]
        mov     r10, r0
        mov     r0, r4
        mov     r2, r10
        mov     r3, r11
        bl      __divdf3
        mov     r7, r0
        mov     r6, r1
        b       LAWC26
LAWC29:
        mov     r0, r4
        ldr     r1, [sp]
        bl      sqrt
        mov     r7, r0
        mov     r6, r1
        mov     r10, r7
        mov     r11, r6
        b       LAWC26
LAWC30:
        mov     r12, #0xFE, 12
        orr     r5, r12, #3, 4
        sub     r3, r5, #0x7F, 8
        eor     r10, r10, #2, 2
        mov     r0, r4
        mov     r1, r10
        mov     r2, #0
        bl      __ltdf2
        cmp     r0, #0
        sublt   r10, r5, #0x7F, 8
        movlt   r4, #0
        b       LAWC27
LAWC31:
        cmp     r11, #0
        beq     LAWC32
        mov     r0, r7
        mov     r1, r9
        mov     r2, r7
        mov     r3, r9
        bl      __muldf3
        str     r0, [sp, #0x1C]
        str     r1, [sp, #0x18]
        mov     r1, r10
        mov     r3, r10
        mov     r0, r5
        mov     r2, r5
        bl      __muldf3
        ldr     r2, [sp, #0x1C]
        ldr     r3, [sp, #0x18]
        bl      __adddf3
        bl      sqrt
        mov     r2, r7
        mov     r3, r9
        bl      __subdf3
        bl      sqrt
        mov     r11, r1
        ldr     r1, [sp]
        mov     r10, r0
        mov     r0, r5
        mov     r2, r10
        mov     r3, r11
        bl      __divdf3
        mov     r9, r0
        mov     r7, r1
        b       LAWC23
LAWC32:
        mov     r0, r5
        ldr     r1, [sp]
        bl      sqrt
        mov     r9, r0
        mov     r7, r1
        mov     r10, r9
        mov     r11, r7
        b       LAWC23
LAWC33:
        mvn     r0, #7
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LAWC34:
        mvn     r0, #5
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
        .long   LAWC_sqtbmx
        .long   LAWC_sqrtb2
        .long   LAWC_sqrtb1
        .long   LAWC_sqrtb0
        .long   0x40dfffc0


        .data
        .align  4


LAWC_sqrtb0:
        .byte   0x00,0x01,0x01,0x02,0x02,0x02,0x02,0x03,0x03,0x03,0x03,0x03,0x03,0x04,0x04,0x04
        .byte   0x04,0x04,0x04,0x04,0x04,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x06
LAWC_sqrtb1:
        .byte   0x04,0x05,0x06,0x07,0x08,0x09,0x0A,0x0B,0x0B,0x0C,0x0D,0x0D,0x0E,0x0E,0x0F,0x0F
        .byte   0x10,0x10,0x11,0x11,0x12,0x12,0x13,0x13,0x14,0x14,0x14,0x15,0x15,0x16,0x16,0x16
        .byte   0x17,0x17,0x17,0x18,0x18,0x18,0x19,0x19,0x19,0x1A,0x1A,0x1A,0x1B,0x1B,0x1B,0x1B
        .byte   0x1C,0x1C,0x1C,0x1D,0x1D,0x1D,0x1D,0x1E,0x1E,0x1E,0x1E,0x1F,0x1F,0x1F,0x1F,0x20
        .byte   0x20,0x20,0x20,0x21,0x21,0x21,0x21,0x22,0x22,0x22,0x22,0x23,0x23,0x23,0x23,0x24
        .byte   0x24,0x24,0x24,0x24,0x25,0x25,0x25,0x25,0x26,0x26,0x26,0x26,0x26,0x27,0x27,0x27
        .byte   0x27,0x27,0x28,0x28,0x28,0x28,0x28,0x29,0x29,0x29,0x29,0x29,0x2A,0x2A,0x2A,0x2A
        .byte   0x2A,0x2B,0x2B,0x2B,0x2B,0x2B,0x2B,0x2C,0x2C,0x2C,0x2C,0x2C,0x2D,0x2D,0x2D,0x2D
        .byte   0x2D,0x2D,0x2E,0x2E,0x2E,0x2E,0x2E,0x2E,0x2F,0x2F,0x2F,0x2F,0x2F,0x2F,0x30,0x30
        .byte   0x30,0x30,0x30,0x30,0x31,0x31,0x31,0x31,0x31,0x31,0x32,0x32,0x32,0x32,0x32,0x32
        .byte   0x33,0x33,0x33,0x33,0x33,0x33,0x34,0x34,0x34,0x34,0x34,0x34,0x34,0x35,0x35,0x35
        .byte   0x35,0x35,0x35,0x36,0x36,0x36,0x36,0x36,0x36,0x36,0x37,0x37,0x37,0x37,0x37,0x37
        .byte   0x37,0x38,0x38,0x38,0x38,0x38,0x38,0x38,0x39,0x39,0x39,0x39,0x39,0x39,0x39,0x3A
        .byte   0x3A,0x3A,0x3A,0x3A,0x3A,0x3A,0x3B,0x3B,0x3B,0x3B,0x3B,0x3B,0x3B,0x3B,0x3C,0x3C
        .byte   0x3C,0x3C,0x3C,0x3C,0x3C,0x3D,0x3D,0x3D,0x3D,0x3D,0x3D,0x3D,0x3D,0x3E,0x3E,0x3E
        .byte   0x3E,0x3E,0x3E,0x3E,0x3E,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x40,0x40,0x40
LAWC_sqtbmx:
        .byte   0x00,0x00,0x02,0x00,0x06,0x00,0x0C,0x00,0x0E,0x00,0x1E,0x00,0x2A,0x00,0x38,0x00
        .byte   0x48,0x00,0x5A,0x00,0x6E,0x00,0x84,0x00,0x9C,0x00,0xB6,0x00,0xD2,0x00,0xF0,0x00
        .byte   0x10,0x01,0x32,0x01,0x56,0x01,0x7C,0x01,0xA4,0x01,0xCE,0x01,0xFA,0x01,0x28,0x02
        .byte   0x58,0x02,0x8A,0x02,0xBE,0x02,0xF4,0x02,0x2C,0x03,0x66,0x03,0xA2,0x03,0xE0,0x03
        .byte   0x20,0x04,0x62,0x04,0xA6,0x04,0xEC,0x04,0x34,0x05,0x7E,0x05,0xCA,0x05,0x18,0x06
        .byte   0x68,0x06,0xBA,0x06,0x0E,0x07,0x64,0x07,0xBC,0x07,0x16,0x08,0x72,0x08,0xD0,0x08
        .byte   0x30,0x09,0x92,0x09,0xF6,0x09,0x5C,0x0A,0xC4,0x0A,0x2E,0x0B,0x9A,0x0B,0x08,0x0C
        .byte   0x78,0x0C,0xEA,0x0C,0x5E,0x0D,0xD4,0x0D,0x4C,0x0E,0xC6,0x0E,0x42,0x0F,0xC0,0x0F
        .byte   0x40,0x10,0xC2,0x10,0x46,0x11,0xCC,0x11,0x54,0x12,0xDE,0x12,0x6A,0x13,0xF8,0x13
        .byte   0x88,0x14,0x1A,0x15,0xAE,0x15,0x44,0x16,0xDC,0x16,0x76,0x17,0x12,0x18,0xB0,0x18
        .byte   0x50,0x19,0xF2,0x19,0x96,0x1A,0x3C,0x1B,0xE4,0x1B,0x8E,0x1C,0x3A,0x1D,0xE8,0x1D
        .byte   0x98,0x1E,0x4A,0x1F,0xFE,0x1F,0xB4,0x20,0x6C,0x21,0x26,0x22,0xE2,0x22,0xA0,0x23
        .byte   0x60,0x24,0x22,0x25,0xE6,0x25,0xAC,0x26,0x74,0x27,0x3E,0x28,0x0A,0x29,0xD8,0x29
        .byte   0xA8,0x2A,0x7A,0x2B,0x4E,0x2C,0x24,0x2D,0xFC,0x2D,0xD6,0x2E,0xB2,0x2F,0x90,0x30
        .byte   0x70,0x31,0x52,0x32,0x36,0x33,0x1C,0x34,0x04,0x35,0xEE,0x35,0xDA,0x36,0xC8,0x37
        .byte   0xB8,0x38,0xAA,0x39,0x9E,0x3A,0x94,0x3B,0x8C,0x3C,0x86,0x3D,0x82,0x3E,0x80,0x3F
        .byte   0x80,0x40,0x82,0x41,0x86,0x42,0x8C,0x43,0x94,0x44,0x9E,0x45,0xAA,0x46,0xB8,0x47
        .byte   0xC8,0x48,0xDA,0x49,0xEE,0x4A,0x04,0x4C,0x1C,0x4D,0x36,0x4E,0x52,0x4F,0x70,0x50
        .byte   0x90,0x51,0xB2,0x52,0xD6,0x53,0xFC,0x54,0x24,0x56,0x4E,0x57,0x7A,0x58,0xA8,0x59
        .byte   0xD8,0x5A,0x0A,0x5C,0x3E,0x5D,0x74,0x5E,0xAC,0x5F,0xE6,0x60,0x22,0x62,0x60,0x63
        .byte   0xA0,0x64,0xE2,0x65,0x26,0x67,0x6C,0x68,0xB4,0x69,0xFE,0x6A,0x4A,0x6C,0x98,0x6D
        .byte   0xE8,0x6E,0x3A,0x70,0x8E,0x71,0xE4,0x72,0x3C,0x74,0x96,0x75,0xF2,0x76,0x50,0x78
        .byte   0xB0,0x79,0x12,0x7B,0x76,0x7C,0xDC,0x7D,0x44,0x7F,0xAE,0x80,0x1A,0x82,0x88,0x83
        .byte   0xF8,0x84,0x6A,0x86,0xDE,0x87,0x54,0x89,0xCC,0x8A,0x46,0x8C,0xC2,0x8D,0x40,0x8F
        .byte   0xC0,0x90,0x42,0x92,0xC6,0x93,0x4C,0x95,0xD4,0x96,0x5E,0x98,0xEA,0x99,0x78,0x9B
LAWC_sqrtb2:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x40,0x42,0x44,0x46,0x48,0x49,0x4B,0x4D,0x4E,0x50,0x52,0x53,0x55,0x56,0x58,0x59
        .byte   0x5B,0x5C,0x5D,0x5F,0x60,0x61,0x63,0x64,0x65,0x66,0x68,0x69,0x6A,0x6B,0x6D,0x6E
        .byte   0x6F,0x70,0x71,0x72,0x73,0x74,0x76,0x77,0x78,0x79,0x7A,0x7B,0x7C,0x7D,0x7E,0x7F
        .byte   0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8B,0x8C,0x8D,0x8E
        .byte   0x8F,0x90,0x91,0x92,0x93,0x94,0x94,0x95,0x96,0x97,0x98,0x99,0x99,0x9A,0x9B,0x9C
        .byte   0x9D,0x9E,0x9E,0x9F,0xA0,0xA1,0xA2,0xA2,0xA3,0xA4,0xA5,0xA6,0xA6,0xA7,0xA8,0xA9
        .byte   0xA9,0xAA,0xAB,0xAC,0xAC,0xAD,0xAE,0xAF,0xAF,0xB0,0xB1,0xB1,0xB2,0xB3,0xB4,0xB4
        .byte   0xB5,0xB6,0xB6,0xB7,0xB8,0xB9,0xB9,0xBA,0xBB,0xBB,0xBC,0xBD,0xBD,0xBE,0xBF,0xBF
        .byte   0xC0,0xC1,0xC1,0xC2,0xC3,0xC3,0xC4,0xC5,0xC5,0xC6,0xC7,0xC7,0xC8,0xC8,0xC9,0xCA


