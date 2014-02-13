        .text
        .align  4
        .globl  hypot


hypot:
        stmdb   sp!, {r4 - r10, lr}
        sub     sp, sp, #0x18
        str     r0, [sp, #8]
        str     r1, [sp, #0xC]
        str     r2, [sp, #0x10]
        mov     r12, #0xFF
        mov     r4, r1, lsl #1
        str     r3, [sp, #0x14]
        cmn     r4, #2, 12
        orr     r12, r12, #7, 24
        mvn     lr, #2, 2
        bcs     LACJ0
        mov     r5, r3, lsl #1
        cmn     r5, #2, 12
        bcc     LACJ6
LACJ0:
        cmn     r4, #2, 12
        bne     LACJ1
        cmp     r0, #0
        beq     LACJ2
LACJ1:
        mov     r5, r3, lsl #1
        cmn     r5, #2, 12
        bne     LACJ3
        cmp     r2, #0
        bne     LACJ3
LACJ2:
        mov     r1, r12, lsl #20
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r10, pc}
LACJ3:
        cmp     r4, r5
        bcc     LACJ4
        cmp     r4, r5
        bne     LACJ5
        cmp     r0, r2
        bcs     LACJ5
LACJ4:
        mov     r1, r3
        mov     r0, r2
LACJ5:
        and     lr, r1, lr
        orr     r1, lr, #2, 14
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r10, pc}
LACJ6:
        and     r3, r3, lr
        and     r1, r1, lr
        cmp     r3, r1
        bhi     LACJ7
        cmp     r3, r1
        bne     LACJ8
        cmp     r2, r0
        bls     LACJ8
LACJ7:
        mov     r4, r3
        mov     r5, r2
        mov     r3, r1
        mov     r2, r0
        mov     r1, r4
        mov     r0, r5
LACJ8:
        mvn     r4, #0xFF, 12
        mov     r5, r1, lsl #1
        bic     r7, r4, #0xF, 4
        cmp     r5, #2, 12
        and     r6, r1, r7
        movcc   r5, #2, 12
        orrcs   r6, r6, #1, 12
        mov     r4, r3, lsl #1
        and     r3, r3, r7
        sub     r7, r12, #0xF3, 30
        cmp     r4, #2, 12
        sub     r8, r7, r5, lsr #21
        mov     r5, r0
        movcc   r4, #2, 12
        orrcs   r3, r3, #1, 12
        mov     r7, #0x33
        orr     r7, r7, #1, 22
        sub     r4, r7, r4, lsr #21
        sub     r7, r4, r8
        cmp     r7, #0x1E
        mov     r7, r2
        ble     LACJ9
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r10, pc}
LACJ9:
        clz     r9, r6
        cmp     r9, #0x20
        mov     r1, #0
        beq     LACJ27
LACJ10:
        sub     r9, r9, #1
        add     r0, r9, r8
        rsb     r8, r9, #0x20
        mov     r8, r5, lsr r8
        orr     r6, r8, r6, lsl r9
        mov     r9, r5, lsl r9
        umull   r5, r8, r6, r9
        umull   r6, r5, r6, r6
        adds    r10, r8, r8
        adc     r9, r1, #0
        clz     r8, r3
        adds    r6, r6, r10
        adc     r5, r5, r9
        cmp     r8, #0x20
        beq     LACJ24
LACJ11:
        sub     r8, r8, #1
        rsb     r2, r8, #0x20
        mov     r2, r7, lsr r2
        orr     r3, r2, r3, lsl r8
        add     r4, r8, r4
        mov     r8, r7, lsl r8
        umull   r2, r7, r3, r8
        umull   r3, r2, r3, r3
        adds    r8, r7, r7
        adc     r7, r1, #0
        sub     r4, r4, r0
        adds    r3, r3, r8
        adc     r2, r2, r7
        mov     r4, r4, lsl #1
        cmp     r4, #0x20
        bgt     LACJ12
        mov     r3, r3, lsr r4
        rsb     r1, r4, #0x20
        orr     r7, r3, r2, lsl r1
        mov     r4, r2, lsr r4
        b       LACJ13
LACJ12:
        cmp     r4, #0x40
        movgt   r7, #0
        movgt   r4, r7
        bgt     LACJ13
        sub     r3, r4, #0x20
        rsb     r4, r4, #0x40
        mov     r2, r2, lsr r3
        orr     r7, r2, r1, lsl r4
        mov     r4, r1, lsr r3
LACJ13:
        adds    r2, r6, r7
        adc     r1, r5, r4
        mov     r0, r0, lsl #1
        mov     r6, r1
        cmp     r6, #1, 2
        sub     r0, r0, #0x40
        mov     r5, r1, asr #31
        bcs     LACJ14
        mov     r3, r2, lsr #31
        orr     r1, r3, r1, lsl #1
        mov     r6, r1
        cmp     r6, #1, 2
        mov     r2, r2, lsl #1
        add     r0, r0, #1
        mov     r5, r1, asr #31
        bcs     LACJ14
        mov     r3, r2, lsr #31
        orr     r1, r3, r1, lsl #1
        mov     r2, r2, lsl #1
        add     r0, r0, #1
        mov     r6, r1
        mov     r5, r1, asr #31
LACJ14:
        ldr     r4, [pc, #0x270]
        mov     r7, r5, lsl #9
        orr     r7, r7, r6, lsr #23
        and     r3, r0, #1
        mvn     r8, #0x7F
        adds    r7, r7, r3, lsl #7
        adds    r8, r7, r8
        ldrb    r4, [r8, +r4]
        cmp     r3, #0
        add     r3, r4, #1, 24
        beq     LACJ15
        mov     r4, r2, lsr #31
        orr     r1, r4, r1, lsl #1
        mov     r2, r2, lsl #1
LACJ15:
        mul     r8, r3, r3
        mov     r7, r1, lsr #12
        sub     r4, r2, #1
        mla     r8, r8, r7, r8
        mov     r8, r8, asr #14
        mla     r8, r3, r8, r3
        rsb     r3, r8, r3, lsl #23
        mov     r8, r3, lsr #19
        mul     r7, r8, r7
        umull   r9, r8, r7, r7
        subs    r9, r2, r9
        sbc     r8, r1, r8
        umull   r8, r9, r3, r8
        adds    r7, r7, r9
        umull   r9, r8, r7, r7
        subs    r2, r2, r9
        umull   r9, r2, r3, r2
        sbc     r1, r1, r8
        umull   r1, r8, r3, r1
        adds    r1, r1, #0
        adc     r7, r8, r7
        adds    r2, r2, r1
        adc     r1, r7, #0
        mul     r9, r1, r1
        umull   r8, r7, r1, r2
        sub     r9, r4, r9
        subs    r9, r9, r7, lsl #1
        movmi   r9, #0
        umull   r7, r8, r3, r9
        adds    r2, r2, r8
        adc     r1, r1, #0
        mul     r9, r1, r1
        umull   r8, r7, r1, r2
        sub     r4, r4, r9
        subs    r4, r4, r7, lsl #1
        movmi   r4, #0
        umull   r3, r4, r3, r4
        adds    r3, r2, r4
        adc     r2, r1, #0
        mov     r1, r5, lsl #2
        orr     r6, r1, r6, lsr #30
        mov     r1, r2, lsl #31
        orr     r3, r1, r3, lsr #1
        adds    r1, r6, r3
        rsb     r0, r0, #0x3E
        mov     r2, r2, lsr #1
        adc     r5, r2, r5, asr #30
        mov     r0, r0, asr #1
        bics    lr, r5, lr
        rsb     r0, r0, #0x3E
        beq     LACJ16
        rsbs    r1, r1, #0
        rsc     r5, r5, #0
LACJ16:
        sub     r2, r12, #0xF3, 30
        clz     r3, r5
        add     r2, r2, #9
        cmp     r3, #0x20
        rsb     r0, r0, r2
        beq     LACJ23
LACJ17:
        sub     r4, r3, #1
        rsb     r2, r4, #0x20
        mov     r2, r1, lsr r2
        orr     r3, r2, r5, lsl r4
        subs    r2, r0, r4
        mov     r4, r1, lsl r4
        bpl     LACJ19
        rsb     r2, r2, #0
        cmp     r2, #0x20
        blt     LACJ18
        mov     r4, r3
        mov     r3, r3, asr #31
        sub     r2, r2, #0x20
LACJ18:
        cmp     r2, #0x20
        mov     r0, #0x20
        movgt   r2, r0
        mov     r4, r4, lsr r2
        rsb     r0, r2, #0x20
        orr     r4, r4, r3, lsl r0
        mov     r3, r3, asr r2
        mov     r2, #0
LACJ19:
        mov     r0, r4, lsr #9
        and     r1, r0, #1
        mov     r0, r3, lsl #22
        orr     r4, r0, r4, lsr #10
        adds    r0, r1, r4
        mov     r3, r3, lsr #10
        adc     r1, r3, r1, asr #31
        orrs    r3, r1, r1, asr #31
        moveq   r2, #0
        beq     LACJ20
        sub     r3, r12, #1
        cmp     r3, r2
        bgt     LACJ20
        mov     r0, #0
        mov     r2, r12
        mov     r1, r0
LACJ20:
        add     r2, r1, r2, lsl #20
        orr     lr, r2, lr
        adds    r2, lr, #1, 12
        bmi     LACJ22
LACJ21:
        mov     r1, lr
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r10, pc}
LACJ22:
        str     r0, [sp]
        add     r3, sp, #8
        mov     r2, sp
        add     r1, sp, #0x10
        mov     r0, r3
        str     lr, [sp, #4]
        mov     r3, #0x2E
        bl      __libm_error_support
        ldr     r0, [sp]
        ldr     lr, [sp, #4]
        b       LACJ21
LACJ23:
        clz     r2, r1
        cmp     r2, #0
        beq     LACJ17
        mov     r5, r1
        sub     r0, r0, #0x20
        mov     r3, r2
        mov     r1, #0
        b       LACJ17
LACJ24:
        cmp     r2, #0
        add     r4, r4, #0x20
        mov     r3, r2
        mov     r7, #0
        blt     LACJ26
LACJ25:
        clz     r8, r3
        b       LACJ11
LACJ26:
        sub     r4, r4, #1
        mov     r7, r2, lsl #31
        mov     r3, r2, lsr #1
        b       LACJ25
LACJ27:
        cmp     r0, #0
        add     r8, r8, #0x20
        mov     r6, r0
        mov     r5, #0
        blt     LACJ29
LACJ28:
        clz     r9, r6
        b       LACJ10
LACJ29:
        sub     r8, r8, #1
        mov     r5, r0, lsl #31
        mov     r6, r0, lsr #1
        b       LACJ28
        .long   LACJ_rsqrt_table


        .data
        .align  4


LACJ_rsqrt_table:
        .byte   0xFE,0xFC,0xFA,0xF8,0xF6,0xF4,0xF2,0xF0,0xEE,0xED,0xEB,0xE9,0xE7,0xE6,0xE4,0xE2
        .byte   0xE1,0xDF,0xDD,0xDC,0xDA,0xD8,0xD7,0xD5,0xD4,0xD2,0xD1,0xCF,0xCE,0xCC,0xCB,0xC9
        .byte   0xC8,0xC7,0xC5,0xC4,0xC2,0xC1,0xC0,0xBE,0xBD,0xBC,0xBA,0xB9,0xB8,0xB7,0xB5,0xB4
        .byte   0xB3,0xB2,0xB0,0xAF,0xAE,0xAD,0xAC,0xAB,0xA9,0xA8,0xA7,0xA6,0xA5,0xA4,0xA3,0xA2
        .byte   0xA0,0x9F,0x9E,0x9D,0x9C,0x9B,0x9A,0x99,0x98,0x97,0x96,0x95,0x94,0x93,0x92,0x91
        .byte   0x90,0x8F,0x8E,0x8D,0x8C,0x8B,0x8B,0x8A,0x89,0x88,0x87,0x86,0x85,0x84,0x83,0x83
        .byte   0x82,0x81,0x80,0x7F,0x7E,0x7D,0x7D,0x7C,0x7B,0x7A,0x79,0x79,0x78,0x77,0x76,0x75
        .byte   0x75,0x74,0x73,0x72,0x72,0x71,0x70,0x6F,0x6F,0x6E,0x6D,0x6C,0x6C,0x6B,0x6A,0x6A
        .byte   0x68,0x67,0x65,0x64,0x63,0x61,0x60,0x5F,0x5D,0x5C,0x5B,0x5A,0x58,0x57,0x56,0x55
        .byte   0x54,0x52,0x51,0x50,0x4F,0x4E,0x4D,0x4C,0x4B,0x4A,0x48,0x47,0x46,0x45,0x44,0x43
        .byte   0x42,0x41,0x40,0x3F,0x3E,0x3D,0x3C,0x3C,0x3B,0x3A,0x39,0x38,0x37,0x36,0x35,0x34
        .byte   0x33,0x33,0x32,0x31,0x30,0x2F,0x2E,0x2D,0x2D,0x2C,0x2B,0x2A,0x29,0x29,0x28,0x27
        .byte   0x26,0x26,0x25,0x24,0x23,0x23,0x22,0x21,0x20,0x20,0x1F,0x1E,0x1E,0x1D,0x1C,0x1C
        .byte   0x1B,0x1A,0x19,0x19,0x18,0x17,0x17,0x16,0x16,0x15,0x14,0x14,0x13,0x12,0x12,0x11
        .byte   0x11,0x10,0x0F,0x0F,0x0E,0x0E,0x0D,0x0C,0x0C,0x0B,0x0B,0x0A,0x0A,0x09,0x08,0x08
        .byte   0x07,0x07,0x06,0x06,0x05,0x05,0x04,0x04,0x03,0x03,0x02,0x02,0x01,0x01,0x00,0x00


