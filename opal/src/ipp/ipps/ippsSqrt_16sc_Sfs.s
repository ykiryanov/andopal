        .text
        .align  4
        .globl  _ippsSqrt_16sc_Sfs


_ippsSqrt_16sc_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        mov     r5, r0
        cmp     r5, #0
        mov     r8, r1
        mov     r6, r2
        mov     r7, r3
        beq     LAWB33
        cmp     r8, #0
        beq     LAWB33
        cmp     r6, #0
        ble     LAWB34
        mov     r12, #0xFE, 12
        cmp     r7, #0
        orr     r9, r12, #3, 4
        mov     r4, #0
        blt     LAWB18
        cmp     r7, #8
        bgt     LAWB13
        cmp     r7, #0
        bne     LAWB5
        cmp     r6, #0
        ble     LAWB17
        ldr     r7, [pc, #0x938]
        ldr     r3, [pc, #0x938]
        ldr     r12, [pc, #0x938]
        ldr     lr, [pc, #0x938]
        sub     r8, r8, #2
        str     r9, [sp, #4]
        str     r6, [sp, #0x10]
LAWB0:
        ldrsh   r11, [r5]
        ldrsh   r6, [r5, #2]
        mul     r0, r11, r11
        bl      __floatsidf
        mov     r9, r0
        mul     r0, r6, r6
        mov     r10, r1
        bl      __floatsidf
        mov     r2, r9
        mov     r3, r10
        bl      __adddf3
        bl      sqrt
        ldr     r3, [sp, #4]
        mov     r2, #0
        bl      __adddf3
        bl      __fixdfsi
        add     r1, r11, r0
        and     r3, r1, #1
        add     r1, r3, r1, lsr #1
        sub     r11, r0, r11
        and     r3, r11, #1
        tst     r1, #0xF, 20
        add     r3, r3, r11, lsr #1
        beq     LAWB1
        ldr     r12, [pc, #0x8C0]
        ldrb    r12, [r12, +r1, lsr #8]
        mov     lr, r12, lsl #1
        ldrh    lr, [r7, +lr]
        cmp     lr, r1
        bcs     LAWB2
        add     r12, r12, #1
        mov     lr, r12, lsl #1
        ldrh    lr, [r7, +lr]
        cmp     lr, r1
        addcc   r12, r12, #1
        b       LAWB2
LAWB1:
        tst     r1, #0xFE, 28
        ldreq   r12, [pc, #0x894]
        ldreqsb r12, [r1, +r12]
        beq     LAWB2
        ldr     r12, [pc, #0x884]
        mov     lr, r1, lsr #4
        ldrsb   r12, [r12, +lr]
        mov     lr, r12, lsl #1
        ldrh    lr, [r7, +lr]
        cmp     lr, r1
        addcc   r12, r12, #1
LAWB2:
        tst     r3, #0xF, 20
        strh    r12, [r8, #2]
        beq     LAWB3
        ldr     r1, [pc, #0x858]
        ldrb    r1, [r1, +r3, lsr #8]
        mov     r12, r1, lsl #1
        ldrh    r12, [r7, +r12]
        cmp     r12, r3
        bcs     LAWB4
        add     r1, r1, #1
        mov     r12, r1, lsl #1
        ldrh    r12, [r7, +r12]
        cmp     r12, r3
        addcc   r1, r1, #1
        b       LAWB4
LAWB3:
        tst     r3, #0xFE, 28
        ldreq   r1, [pc, #0x82C]
        ldreqsb r1, [r3, +r1]
        beq     LAWB4
        ldr     r1, [pc, #0x81C]
        mov     r12, r3, lsr #4
        ldrsb   r1, [r1, +r12]
        mov     r12, r1, lsl #1
        ldrh    r12, [r7, +r12]
        cmp     r12, r3
        addcc   r1, r1, #1
LAWB4:
        cmp     r6, #0
        rsblt   r1, r1, #0
        strh    r1, [r8, #4]!
        ldr     r1, [sp, #0x10]
        add     r4, r4, #1
        cmp     r4, r1
        add     r5, r5, #4
        blt     LAWB0
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LAWB5:
        mov     lr, r7, lsl #1
        mov     r12, #1
        sub     r9, lr, #1
        mov     r10, r12, lsl lr
        cmp     r6, #0
        orr     r9, r10, r12, lsl r9
        add     lr, lr, #1
        sub     r11, r7, #1
        ble     LAWB17
        ldr     r10, [pc, #0x7A8]
        ldr     r0, [pc, #0x7A8]
        ldr     r1, [pc, #0x7A8]
        ldr     r2, [pc, #0x7A8]
        sub     r8, r8, #2
        str     r11, [sp]
        str     lr, [sp, #8]
        str     r7, [sp, #0x14]
        str     r6, [sp, #0x10]
LAWB6:
        ldrsh   r6, [r5, #2]
        ldrsh   r7, [r5]
        mul     r1, r6, r6
        mla     r11, r7, r7, r1
        mov     r0, r11
        bl      __floatunssidf
        bl      sqrt
        bl      __fixdfsi
        mul     r1, r0, r0
        cmp     r11, r1
        movne   r1, #0
        moveq   r1, #1
        ldr     lr, [sp, #8]
        add     r3, r7, r0
        str     r3, [sp, #4]
        add     r3, r9, r3
        mov     r12, r3, lsr lr
        sub     r7, r0, r7
        add     r3, r9, r7
        tst     r12, #0xF, 20
        mov     r3, r3, lsr lr
        beq     LAWB7
        ldr     lr, [pc, #0x730]
        ldrb    lr, [lr, +r12, lsr #8]
        mov     r11, lr, lsl #1
        ldrh    r11, [r10, +r11]
        cmp     r11, r12
        bcs     LAWB8
        add     lr, lr, #1
        mov     r11, lr, lsl #1
        ldrh    r11, [r10, +r11]
        cmp     r11, r12
        addcc   lr, lr, #1
        b       LAWB8
LAWB7:
        tst     r12, #0xFE, 28
        ldreq   lr, [pc, #0x704]
        ldreqsb lr, [r12, +lr]
        beq     LAWB8
        ldr     r11, [pc, #0x6F4]
        mov     lr, r12, lsr #4
        ldrsb   lr, [r11, +lr]
        mov     r11, lr, lsl #1
        ldrh    r11, [r10, +r11]
        cmp     r11, r12
        addcc   lr, lr, #1
LAWB8:
        cmp     r1, #0
        beq     LAWB9
        tst     lr, #1
        beq     LAWB9
        ldr     r12, [sp, #0x14]
        ldr     r11, [sp]
        mov     r0, #1
        mov     r12, lr, lsl r12
        sub     r11, r12, r0, lsl r11
        mul     r12, r11, r11
        ldr     r11, [sp, #4]
        cmp     r11, r12, lsl #1
        subeq   lr, lr, #1
LAWB9:
        tst     r3, #0xF, 20
        strh    lr, [r8, #2]
        beq     LAWB10
        ldr     r12, [pc, #0x694]
        ldrb    r12, [r12, +r3, lsr #8]
        mov     lr, r12, lsl #1
        ldrh    lr, [r10, +lr]
        cmp     lr, r3
        bcs     LAWB11
        add     r12, r12, #1
        mov     lr, r12, lsl #1
        ldrh    lr, [r10, +lr]
        cmp     lr, r3
        addcc   r12, r12, #1
        b       LAWB11
LAWB10:
        tst     r3, #0xFE, 28
        ldreq   r12, [pc, #0x668]
        ldreqsb r12, [r3, +r12]
        beq     LAWB11
        ldr     lr, [pc, #0x658]
        mov     r12, r3, lsr #4
        ldrsb   r12, [lr, +r12]
        mov     lr, r12, lsl #1
        ldrh    lr, [r10, +lr]
        cmp     lr, r3
        addcc   r12, r12, #1
LAWB11:
        cmp     r1, #0
        beq     LAWB12
        tst     r12, #1
        beq     LAWB12
        ldr     r1, [sp, #0x14]
        ldr     r3, [sp]
        mov     lr, #1
        mov     r1, r12, lsl r1
        sub     r3, r1, lr, lsl r3
        mul     r1, r3, r3
        cmp     r7, r1, lsl #1
        subeq   r12, r12, #1
LAWB12:
        mov     r12, r12, lsl #16
        cmp     r6, #0
        mov     r12, r12, asr #16
        rsblt   r12, r12, #0
        strh    r12, [r8, #4]!
        ldr     r1, [sp, #0x10]
        add     r4, r4, #1
        cmp     r4, r1
        add     r5, r5, #4
        blt     LAWB6
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LAWB13:
        cmp     r6, #6
        movlt   r3, r4
        blt     LAWB15
        mov     r3, r4
        sub     r12, r6, #6
        mov     lr, r3
        sub     r5, r8, #2
LAWB14:
        add     r3, r3, #5
        strh    lr, [r5, #2]
        strh    lr, [r5, #4]
        strh    lr, [r5, #6]
        strh    lr, [r5, #8]
        strh    lr, [r5, #0xA]
        strh    lr, [r5, #0xC]
        strh    lr, [r5, #0xE]
        strh    lr, [r5, #0x10]
        strh    lr, [r5, #0x12]
        strh    lr, [r5, #0x14]!
        cmp     r3, r12
        ble     LAWB14
LAWB15:
        mov     r12, r3, lsl #2
        sub     r12, r12, #2
        add     r8, r12, r8
LAWB16:
        add     r3, r3, #1
        strh    r4, [r8, #2]
        strh    r4, [r8, #4]!
        cmp     r3, r6
        blt     LAWB16
LAWB17:
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LAWB18:
        cmp     r7, #0
        mov     r10, r7
        addge   r1, r9, #1, 12
        bge     LAWB21
        rsb     r12, r7, #0
        cmp     r12, #6
        addlt   r1, r9, #1, 12
        blt     LAWB20
        add     r1, r9, #1, 12
LAWB19:
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
        blt     LAWB19
LAWB20:
        mov     r0, r4
        mov     r2, r4
        mov     r3, r1
        bl      __adddf3
        adds    r10, r10, #1
        mov     r4, r0
        bmi     LAWB20
LAWB21:
        cmn     r7, #7
        blt     LAWB24
        cmp     r6, #0
        ble     LAWB17
        sub     r8, r8, #2
        str     r1, [sp, #8]
        str     r4, [sp, #0xC]
        str     r9, [sp, #4]
        str     r6, [sp, #0x10]
LAWB22:
        ldrsh   r11, [r5]
        mov     r0, r11
        bl      __floatsidf
        ldr     r4, [sp, #4]
        mov     r3, r4
        mov     r2, #0
        bl      __muldf3
        ldrsh   r6, [r5, #2]
        mov     r7, r0
        mov     r9, r1
        mov     r0, r6
        bl      __floatsidf
        mov     r3, r4
        mov     r2, #0
        bl      __muldf3
        mov     r10, r1
        bic     r12, r10, #2, 2
        cmp     r11, #0
        mov     r4, r0
        str     r12, [sp]
        ble     LAWB31
        mov     r0, r7
        mov     r1, r9
        mov     r2, r7
        mov     r3, r9
        bl      __muldf3
        str     r0, [sp, #0x14]
        mov     r11, r1
        mov     r1, r10
        mov     r3, r10
        mov     r0, r4
        mov     r2, r4
        bl      __muldf3
        ldr     r2, [sp, #0x14]
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
        mov     r0, r4
        mov     r2, r9
        mov     r3, r7
        bl      __divdf3
        mov     r11, r0
        mov     r10, r1
LAWB23:
        mov     r0, r11
        mov     r1, r10
        ldr     r2, [sp, #0xC]
        ldr     r11, [sp, #8]
        mov     r3, r11
        bl      __muldf3
        mov     r12, #0xFE, 12
        orr     r4, r12, #3, 4
        mov     r2, #0
        mov     r3, r4
        bl      __adddf3
        ldr     r2, [sp, #0xC]
        str     r0, [sp]
        mov     r10, r1
        mov     r0, r9
        mov     r1, r7
        mov     r3, r11
        bl      __muldf3
        mov     r3, r4
        mov     r2, #0
        bl      __adddf3
        cmp     r6, #0
        eorlt   r10, r10, #2, 2
        bl      __fixdfsi
        strh    r0, [r8, #2]
        ldr     r0, [sp]
        mov     r1, r10
        add     r5, r5, #4
        bl      __fixdfsi
        strh    r0, [r8, #4]!
        ldr     r1, [sp, #0x10]
        subs    r1, r1, #1
        str     r1, [sp, #0x10]
        bne     LAWB22
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LAWB24:
        cmp     r6, #0
        ble     LAWB17
        sub     r7, r8, #2
        str     r1, [sp, #8]
        str     r4, [sp, #0xC]
        str     r9, [sp, #4]
        str     r6, [sp, #0x10]
LAWB25:
        ldrsh   r11, [r5]
        mov     r0, r11
        bl      __floatsidf
        ldr     r6, [sp, #4]
        mov     r3, r6
        mov     r2, #0
        bl      __muldf3
        ldrsh   r4, [r5, #2]
        mov     r8, r0
        mov     r9, r1
        mov     r0, r4
        bl      __floatsidf
        mov     r3, r6
        mov     r2, #0
        bl      __muldf3
        mov     r10, r1
        bic     r12, r10, #2, 2
        cmp     r11, #0
        mov     r6, r0
        str     r12, [sp, #0x14]
        ble     LAWB28
        mov     r0, r8
        mov     r1, r9
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        str     r0, [sp]
        mov     r11, r1
        mov     r1, r10
        mov     r3, r10
        mov     r0, r6
        mov     r2, r6
        bl      __muldf3
        ldr     r2, [sp]
        mov     r3, r11
        bl      __adddf3
        bl      sqrt
        mov     r3, r9
        mov     r2, r8
        bl      __adddf3
        bl      sqrt
        mov     r9, r1
        ldr     r1, [sp, #0x14]
        mov     r10, r0
        mov     r0, r6
        mov     r2, r10
        mov     r3, r9
        bl      __divdf3
        mov     r8, r0
        mov     r11, r1
LAWB26:
        mov     r0, r8
        mov     r1, r11
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #8]
        bl      __muldf3
        mov     r12, #0xFE, 12
        orr     r11, r12, #3, 4
        mov     r3, r11
        mov     r2, #0
        bl      __adddf3
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #8]
        mov     r8, r0
        mov     r6, r1
        mov     r0, r10
        mov     r1, r9
        bl      __muldf3
        mov     r3, r11
        mov     r2, #0
        bl      __adddf3
        ldr     r11, [pc, #0x220]
        mov     r10, r0
        mov     r9, r1
        mov     r2, #0
        mov     r3, r11
        bl      __gtdf2
        cmp     r0, #0
        movgt   r9, r11
        movgt   r10, #0
        cmp     r4, #0
        blt     LAWB30
        ldr     r4, [pc, #0x1F4]
        mov     r0, r8
        mov     r1, r6
        mov     r2, #0
        mov     r3, r4
        bl      __gtdf2
        cmp     r0, #0
        movgt   r6, r4
        movgt   r8, #0
LAWB27:
        mov     r0, r10
        mov     r1, r9
        bl      __fixdfsi
        strh    r0, [r7, #2]
        mov     r0, r8
        mov     r1, r6
        bl      __fixdfsi
        strh    r0, [r7, #4]!
        ldr     r1, [sp, #0x10]
        add     r5, r5, #4
        subs    r1, r1, #1
        str     r1, [sp, #0x10]
        bne     LAWB25
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LAWB28:
        cmp     r11, #0
        beq     LAWB29
        mov     r0, r8
        mov     r1, r9
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        str     r0, [sp]
        str     r1, [sp, #0x18]
        mov     r1, r10
        mov     r3, r10
        mov     r0, r6
        mov     r2, r6
        bl      __muldf3
        ldr     r2, [sp]
        ldr     r3, [sp, #0x18]
        bl      __adddf3
        bl      sqrt
        mov     r2, r8
        mov     r3, r9
        bl      __subdf3
        bl      sqrt
        mov     r11, r1
        ldr     r1, [sp, #0x14]
        mov     r8, r0
        mov     r0, r6
        mov     r2, r8
        mov     r3, r11
        bl      __divdf3
        mov     r10, r0
        mov     r9, r1
        b       LAWB26
LAWB29:
        mov     r0, r6
        ldr     r1, [sp, #0x14]
        bl      sqrt
        mov     r10, r0
        mov     r9, r1
        mov     r8, r10
        mov     r11, r9
        b       LAWB26
LAWB30:
        mov     r2, #0xFE, 12
        orr     r4, r2, #3, 4
        sub     r3, r4, #0x7F, 8
        eor     r6, r6, #2, 2
        mov     r0, r8
        mov     r1, r6
        mov     r2, #0
        bl      __ltdf2
        cmp     r0, #0
        sublt   r6, r4, #0x7F, 8
        movlt   r8, #0
        b       LAWB27
LAWB31:
        cmp     r11, #0
        beq     LAWB32
        mov     r0, r7
        mov     r1, r9
        mov     r2, r7
        mov     r3, r9
        bl      __muldf3
        str     r0, [sp, #0x18]
        str     r1, [sp, #0x14]
        mov     r1, r10
        mov     r3, r10
        mov     r0, r4
        mov     r2, r4
        bl      __muldf3
        ldr     r2, [sp, #0x18]
        ldr     r3, [sp, #0x14]
        bl      __adddf3
        bl      sqrt
        mov     r2, r7
        mov     r3, r9
        bl      __subdf3
        bl      sqrt
        mov     r10, r1
        ldr     r1, [sp]
        mov     r11, r0
        mov     r0, r4
        mov     r2, r11
        mov     r3, r10
        bl      __divdf3
        mov     r9, r0
        mov     r7, r1
        b       LAWB23
LAWB32:
        mov     r0, r4
        ldr     r1, [sp]
        bl      sqrt
        mov     r9, r0
        mov     r7, r1
        mov     r11, r9
        mov     r10, r7
        b       LAWB23
LAWB33:
        mvn     r0, #7
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LAWB34:
        mvn     r0, #5
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
        .long   LAWB_sqtbmx
        .long   LAWB_sqrtb2
        .long   LAWB_sqrtb1
        .long   LAWB_sqrtb0
        .long   0x40dfffc0


        .data
        .align  4


LAWB_sqrtb0:
        .byte   0x00,0x01,0x01,0x02,0x02,0x02,0x02,0x03,0x03,0x03,0x03,0x03,0x03,0x04,0x04,0x04
        .byte   0x04,0x04,0x04,0x04,0x04,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x06
LAWB_sqrtb1:
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
LAWB_sqtbmx:
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
LAWB_sqrtb2:
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


