        .text
        .align  4
        .globl  ownsDecodeIsCore_AAC


ownsDecodeIsCore_AAC:
        stmdb   sp!, {r4 - r6, lr}
        ldr     lr, [sp, #0x10]
        add     r5, lr, #3
        cmp     r5, #0xA
        mov     r12, #0
        ble     LGHP1
        ldr     r6, [pc, #0xD0]
        and     r5, lr, #3
        mov     r4, lr, asr #2
        cmp     r2, #0
        add     r5, r6, r5, lsl #2
        ldr     lr, [r5, #0xC]
        ble     LGHP5
        sub     r4, r4, #2
LGHP0:
        ldr     r5, [r0], #4
        cmp     r3, #0
        smull   r5, r6, lr, r5
        mov     r6, r6, asr r4
        rsblt   r6, r6, #0
        add     r12, r12, #1
        str     r6, [r1], #4
        cmp     r12, r2
        blt     LGHP0
        ldmia   sp!, {r4 - r6, pc}
LGHP1:
        ldr     r4, [pc, #0x88]
        cmp     r5, #0
        blt     LGHP3
        add     lr, r4, lr, lsl #2
        ldr     lr, [lr, #0xC]
        cmp     r2, #0
        ble     LGHP5
LGHP2:
        ldr     r4, [r0], #4
        cmp     r3, #0
        mov     r4, r4, lsl #2
        smull   r4, r5, lr, r4
        rsblt   r5, r5, #0
        add     r12, r12, #1
        str     r5, [r1], #4
        cmp     r12, r2
        blt     LGHP2
        ldmia   sp!, {r4 - r6, pc}
LGHP3:
        rsb     r5, lr, #0
        and     lr, r5, #3
        rsb     lr, lr, #0
        mov     r5, r5, asr #2
        add     lr, r4, lr, lsl #2
        ldr     lr, [lr, #0xC]
        cmp     r2, #0
        ble     LGHP5
        add     r4, r5, #2
LGHP4:
        ldr     r5, [r0], #4
        cmp     r3, #0
        mov     r5, r5, lsl r4
        smull   r5, r6, lr, r5
        rsblt   r6, r6, #0
        add     r12, r12, #1
        str     r6, [r1], #4
        cmp     r12, r2
        blt     LGHP4
LGHP5:
        ldmia   sp!, {r4 - r6, pc}
        .long   LGHP__pAacIsSqrt14_32s


        .data
        .align  4


LGHP__pAacIsSqrt14_32s:
        .byte   0x65,0x7E,0xA2,0x6B,0x9A,0x79,0x82,0x5A,0x29,0xF8,0x1B,0x4C,0x00,0x00,0x00,0x40
        .byte   0x33,0x3F,0xD1,0x35,0xCD,0x3C,0x41,0x2D,0x14,0xFC,0x0D,0x26,0x00,0x00,0x00,0x20
        .byte   0x99,0x9F,0xE8,0x1A,0x66,0x9E,0xA0,0x16,0x0A,0xFE,0x06,0x13


