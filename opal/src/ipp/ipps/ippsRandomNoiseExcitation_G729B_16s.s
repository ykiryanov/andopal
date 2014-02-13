        .text
        .align  4
        .globl  _ippsRandomNoiseExcitation_G729B_16s


_ippsRandomNoiseExcitation_G729B_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x34
        cmp     r0, #0
        beq     LDRI5
        cmp     r1, #0
        beq     LDRI5
        cmp     r2, #0
        ble     LDRI6
        ldrsh   r3, [r0]
        cmp     r2, #4
        mov     r4, #4
        ble     LDRI2
        ldr     lr, [pc, #0x2CC]
        sub     r5, r1, #6
        sub     r7, r1, #4
        sub     r6, r1, #2
        sub     r12, r1, #8
        add     r5, r5, #8
        add     r7, r7, #8
        add     r6, r6, #8
        add     r8, lr, #0x20
        add     r12, r12, #8
        str     r6, [sp, #0x28]
        str     r7, [sp, #0x30]
        str     r5, [sp, #0x2C]
        str     r8, [sp, #0x24]
        str     r2, [sp, #0x20]
        str     r1, [sp, #0x18]
        str     r0, [sp, #0x14]
LDRI0:
        ldrsh   r7, [lr, #0x36]
        ldrsh   r10, [lr, #0x16]
        ldrsh   r8, [lr, #0x38]
        ldrsh   r9, [lr, #0x18]
        ldrsh   r2, [lr, #0x3A]
        ldrsh   r1, [lr, #0x1A]
        ldr     r0, [sp, #0x24]
        ldrsh   r5, [lr, #0x3C]
        ldrsh   r6, [lr, #0x1C]
        mla     r2, r1, r3, r2
        mla     r7, r10, r3, r7
        mla     r8, r9, r3, r8
        str     r3, [sp, #0x1C]
        mla     r3, r6, r3, r5
        mov     r7, r7, lsl #16
        mov     r2, r2, lsl #16
        mov     r8, r8, lsl #16
        mov     r3, r3, lsl #16
        mov     r10, r2, asr #16
        mov     r11, r8, asr #16
        mov     r1, r7, asr #16
        mov     r3, r3, asr #16
        mov     r5, lr
        mov     r9, r1
        mov     r8, r11
        mov     r7, r10
        mov     r6, r3
        mov     r2, #0xB
        str     r10, [sp, #4]
        str     r11, [sp]
        str     r12, [sp, #8]
        str     r3, [sp, #0xC]
        str     r4, [sp, #0x10]
LDRI1:
        ldrsh   r4, [r0], #2
        ldrsh   r10, [r5], #2
        ldr     r3, [sp, #0x1C]
        ldr     r12, [sp]
        ldr     r11, [sp, #4]
        mla     r3, r10, r3, r4
        mla     lr, r10, r1, r4
        mla     r12, r10, r12, r4
        mla     r4, r11, r10, r4
        subs    r2, r2, #1
        mov     r3, r3, lsl #16
        mov     lr, lr, lsl #16
        mov     r12, r12, lsl #16
        mov     r4, r4, lsl #16
        add     r9, r9, r3, asr #16
        add     r8, r8, lr, asr #16
        add     r7, r7, r12, asr #16
        add     r6, r6, r4, asr #16
        bne     LDRI1
        ldr     r12, [sp, #8]
        ldr     r4, [sp, #0x10]
        ldr     r3, [sp, #0xC]
        ldr     lr, [pc, #0x1AC]
        mov     r9, r9, asr #7
        strh    r9, [r12], #8
        ldr     r0, [sp, #0x2C]
        mov     r8, r8, asr #7
        strh    r8, [r0], #8
        str     r0, [sp, #0x2C]
        ldr     r0, [sp, #0x30]
        mov     r7, r7, asr #7
        mov     r6, r6, asr #7
        strh    r7, [r0], #8
        str     r0, [sp, #0x30]
        ldr     r0, [sp, #0x28]
        add     r4, r4, #4
        strh    r6, [r0], #8
        str     r0, [sp, #0x28]
        ldr     r0, [sp, #0x20]
        cmp     r4, r0
        blt     LDRI0
        ldr     r2, [sp, #0x20]
        ldr     r1, [sp, #0x18]
        ldr     r0, [sp, #0x14]
LDRI2:
        sub     r4, r4, #4
        cmp     r4, r2
        bge     LDRI4
        mov     lr, #0x4D
        mov     r12, #0x19
        orr     lr, lr, #0x1F, 22
        orr     r12, r12, #0x36, 24
        add     r1, r1, r4, lsl #1
LDRI3:
        mul     r3, r3, lr
        add     r4, r4, #1
        cmp     r4, r2
        add     r3, r3, r12
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
        mul     r5, r3, lr
        add     r5, r5, r12
        mov     r5, r5, lsl #16
        mov     r6, r5, asr #16
        mul     r5, r6, lr
        add     r3, r6, r3
        add     r5, r5, r12
        mov     r5, r5, lsl #16
        mov     r6, r5, asr #16
        mul     r5, r6, lr
        add     r3, r6, r3
        add     r5, r5, r12
        mov     r5, r5, lsl #16
        mov     r6, r5, asr #16
        mul     r5, r6, lr
        add     r3, r6, r3
        add     r5, r5, r12
        mov     r5, r5, lsl #16
        mov     r6, r5, asr #16
        mul     r5, r6, lr
        add     r3, r6, r3
        add     r5, r5, r12
        mov     r5, r5, lsl #16
        mov     r6, r5, asr #16
        mul     r5, r6, lr
        add     r3, r6, r3
        add     r5, r5, r12
        mov     r5, r5, lsl #16
        mov     r6, r5, asr #16
        mul     r5, r6, lr
        add     r3, r6, r3
        add     r5, r5, r12
        mov     r5, r5, lsl #16
        mov     r6, r5, asr #16
        mul     r5, r6, lr
        add     r3, r6, r3
        add     r5, r5, r12
        mov     r5, r5, lsl #16
        mov     r6, r5, asr #16
        mul     r5, r6, lr
        add     r3, r6, r3
        add     r5, r5, r12
        mov     r5, r5, lsl #16
        mov     r6, r5, asr #16
        mul     r5, r6, lr
        add     r3, r6, r3
        add     r5, r5, r12
        mov     r5, r5, lsl #16
        mov     r6, r5, asr #16
        mul     r5, r6, lr
        add     r3, r6, r3
        add     r5, r5, r12
        mov     r5, r5, lsl #16
        mov     r5, r5, asr #16
        add     r3, r5, r3
        strh    r5, [r0]
        mov     r3, r3, asr #7
        strh    r3, [r1], #2
        ldrltsh r3, [r0]
        blt     LDRI3
        mov     r0, #0
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LDRI4:
        strh    r3, [r0]
        mov     r0, #0
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LDRI5:
        mvn     r0, #7
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LDRI6:
        mvn     r0, #5
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
        .long   LDRI_randMul


        .data
        .align  4


LDRI_randMul:
        .byte   0x4D,0x7C,0x29,0xAF,0x55,0x8B,0x91,0x14,0x9D,0x6B,0x39,0x6A,0x25,0x8F,0x21,0xFA
        .byte   0xED,0x37,0x49,0x9E,0xF5,0xF7,0xB1,0x40,0x61,0xFA,0x11,0x5D,0xC1,0x98,0x00,0x00
LDRI_randAdd:
        .byte   0x19,0x36,0x9E,0x97,0x9F,0x58,0xEC,0xE1,0x15,0x7A,0x6A,0x1A,0xFB,0x7F,0x98,0x48
        .byte   0xD1,0xAB,0xF6,0x1F,0x17,0xFB,0x04,0xE0,0xC8,0xC2,0x4C,0x8C,0x90,0xE0


