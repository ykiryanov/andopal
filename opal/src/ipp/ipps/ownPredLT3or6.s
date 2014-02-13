        .text
        .align  4
        .globl  ownPredLT3or6


ownPredLT3or6:
        stmdb   sp!, {r4 - r11, lr}
        ldr     r12, [sp, #0x24]
        rsb     r2, r2, #0
        cmp     r12, #0
        mov     r2, r2, lsl #16
        sub     r12, r0, r1, lsl #1
        mov     r1, r2, asr #16
        beq     LDMS0
        mov     r1, r1, lsl #1
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
LDMS0:
        cmp     r1, #0
        blt     LDMS4
LDMS1:
        ldr     r6, [pc, #0x140]
        rsb     lr, r1, #0
        add     r2, r1, r1, lsl #2
        cmp     r3, #0
        rsb     lr, r1, lr, lsl #2
        mov     r2, r2, lsl #2
        add     r5, r6, r2
        add     r1, r6, lr, lsl #2
        ble     LDMS3
LDMS2:
        ldrsh   r8, [r6, +r2]
        mov     r4, r12
        ldrsh   r7, [r4]
        ldrsh   lr, [r1, #0x78]
        add     r12, r12, #2
        ldrsh   r9, [r12]
        mul     r10, r7, r8
        ldrsh   r7, [r5, #2]
        ldrsh   r8, [r4, #-2]
        subs    r3, r3, #1
        mla     r10, r9, lr, r10
        ldrsh   lr, [r1, #0x7A]
        ldrsh   r9, [r12, #2]
        mla     r10, r8, r7, r10
        ldrsh   r7, [r5, #4]
        ldrsh   r8, [r4, #-4]
        mla     r10, r9, lr, r10
        ldrsh   lr, [r1, #0x7C]
        ldrsh   r9, [r12, #4]
        mla     r10, r8, r7, r10
        ldrsh   r7, [r5, #6]
        ldrsh   r8, [r4, #-6]
        mla     r10, r9, lr, r10
        ldrsh   lr, [r1, #0x7E]
        ldrsh   r9, [r12, #6]
        mla     r10, r8, r7, r10
        ldrsh   r7, [r5, #8]
        ldrsh   r8, [r4, #-8]
        mla     r10, r9, lr, r10
        ldrsh   lr, [r1, #0x80]
        ldrsh   r9, [r12, #8]
        mla     r10, r8, r7, r10
        ldrsh   r7, [r5, #0xA]
        ldrsh   r8, [r4, #-0xA]
        mla     r10, r9, lr, r10
        ldrsh   lr, [r1, #0x82]
        ldrsh   r9, [r12, #0xA]
        mla     r10, r8, r7, r10
        ldrsh   r7, [r5, #0xC]
        ldrsh   r8, [r4, #-0xC]
        mla     r10, r9, lr, r10
        ldrsh   lr, [r1, #0x84]
        ldrsh   r9, [r12, #0xC]
        mla     r10, r8, r7, r10
        ldrsh   r7, [r5, #0xE]
        ldrsh   r8, [r4, #-0xE]
        mla     r9, r9, lr, r10
        ldrsh   lr, [r1, #0x86]
        ldrsh   r10, [r12, #0xE]
        mla     r11, r8, r7, r9
        ldrsh   r8, [r5, #0x10]
        ldrsh   r9, [r5, #0x12]
        ldrsh   r7, [r4, #-0x10]
        ldrsh   r4, [r4, #-0x12]
        mla     lr, r10, lr, r11
        ldrsh   r10, [r1, #0x88]
        ldrsh   r11, [r1, #0x8A]
        mla     r8, r7, r8, lr
        ldrsh   r7, [r12, #0x10]
        ldrsh   lr, [r12, #0x12]
        mla     r8, r7, r10, r8
        mla     r8, r4, r9, r8
        mla     r8, lr, r11, r8
        add     lr, r8, #1, 18
        mov     lr, lr, asr #15
        strh    lr, [r0], #2
        bne     LDMS2
LDMS3:
        ldmia   sp!, {r4 - r11, pc}
LDMS4:
        add     r1, r1, #6
        sub     r12, r12, #2
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        b       LDMS1
        .long   LDMS_inter_6new


        .data
        .align  4


LDMS_inter_6new:
        .byte   0x03,0x73,0x47,0x0C,0x21,0xF5,0xD3,0x08,0x7E,0xF9,0x4B,0x04,0x86,0xFD,0x34,0x01
        .byte   0x88,0xFF,0x22,0x00,0xBA,0x6E,0xB8,0xFA,0x60,0xFD,0x92,0x04,0x85,0xFB,0x88,0x03
        .byte   0xA6,0xFD,0x54,0x01,0x5D,0xFF,0x49,0x00,0x77,0x62,0xCE,0xEE,0xBB,0x04,0x00,0x00
        .byte   0x30,0xFE,0x26,0x02,0x3D,0xFE,0x28,0x01,0x5B,0xFF,0x5B,0x00,0xE1,0x4F,0x17,0xE9
        .byte   0xE8,0x09,0x17,0xFC,0xDA,0x00,0x87,0x00,0x19,0xFF,0xC6,0x00,0x7C,0xFF,0x59,0x00
        .byte   0x6D,0x39,0x26,0xE9,0x3A,0x0C,0x8C,0xF9,0xF4,0x02,0x0B,0xFF,0x00,0x00,0x4E,0x00
        .byte   0xB1,0xFF,0x46,0x00,0xF5,0x21,0xBF,0xED,0xAF,0x0B,0xB4,0xF8,0x24,0x04,0xFE,0xFD
        .byte   0xBF,0x00,0xDC,0xFF,0xED,0xFF,0x26,0x00,0x47,0x0C,0x21,0xF5,0xD3,0x08,0x7E,0xF9
        .byte   0x4B,0x04,0x86,0xFD,0x34,0x01,0x88,0xFF,0x22,0x00,0x00,0x00


