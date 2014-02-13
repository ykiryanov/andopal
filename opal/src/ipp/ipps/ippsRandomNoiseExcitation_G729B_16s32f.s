        .text
        .align  4
        .globl  _ippsRandomNoiseExcitation_G729B_16s32f


_ippsRandomNoiseExcitation_G729B_16s32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x38
        mov     r8, r0
        cmp     r8, #0
        mov     r5, r2
        beq     LDHP5
        cmp     r1, #0
        beq     LDHP5
        cmp     r5, #0
        ble     LDHP6
        ldrsh   r3, [r8]
        cmp     r5, #4
        mov     r12, #4
        ble     LDHP2
        ldr     lr, [pc, #0x330]
        ldr     r10, [pc, #0x330]
        sub     r7, r1, #0x10
        ldr     r4, [lr]
        sub     r9, r1, #8
        sub     lr, r1, #4
        sub     r6, r1, #0xC
        add     r9, r9, #0x10
        add     lr, lr, #0x10
        add     r11, r10, #0x20
        add     r7, r7, #0x10
        add     r6, r6, #0x10
        str     lr, [sp, #0x2C]
        str     r9, [sp, #0x28]
        str     r11, [sp, #0x20]
        str     r3, [sp, #0x34]
        str     r12, [sp, #0x30]
        str     r5, [sp, #0x24]
        str     r1, [sp, #0x18]
        str     r8, [sp, #0x14]
LDHP0:
        ldr     r3, [sp, #0x34]
        ldrsh   r5, [r10, #0x3A]
        ldrsh   r8, [r10, #0x1A]
        ldrsh   r12, [r10, #0x38]
        ldrsh   lr, [r10, #0x18]
        ldrsh   r9, [r10, #0x3C]
        ldrsh   r11, [r10, #0x1C]
        ldrsh   r2, [r10, #0x36]
        ldrsh   r1, [r10, #0x16]
        ldr     r0, [sp, #0x20]
        mla     r5, r8, r3, r5
        mla     r12, lr, r3, r12
        mla     r9, r11, r3, r9
        mla     r2, r1, r3, r2
        mov     r5, r5, lsl #16
        str     r3, [sp, #0x1C]
        mov     lr, r9, lsl #16
        mov     r3, r10
        mov     r11, r5, asr #16
        mov     r12, r12, lsl #16
        mov     r5, lr, asr #16
        mov     r2, r2, lsl #16
        mov     r1, r12, asr #16
        str     r5, [sp, #0x34]
        mov     r2, r2, asr #16
        mov     lr, r2
        mov     r8, r1
        mov     r9, r11
        mov     r12, #0xB
        str     r11, [sp, #4]
        str     r1, [sp]
        str     r6, [sp, #8]
        str     r7, [sp, #0xC]
        str     r4, [sp, #0x10]
LDHP1:
        ldrsh   r7, [r0], #2
        ldrsh   r10, [r3], #2
        ldr     r1, [sp, #0x1C]
        ldr     r4, [sp]
        ldr     r11, [sp, #4]
        mla     r1, r10, r1, r7
        mla     r6, r10, r2, r7
        mla     r4, r10, r4, r7
        mla     r7, r11, r10, r7
        subs    r12, r12, #1
        mov     r1, r1, lsl #16
        mov     r6, r6, lsl #16
        mov     r4, r4, lsl #16
        mov     r7, r7, lsl #16
        add     lr, lr, r1, asr #16
        add     r8, r8, r6, asr #16
        add     r9, r9, r4, asr #16
        add     r5, r5, r7, asr #16
        bne     LDHP1
        ldr     r7, [sp, #0xC]
        ldr     r6, [sp, #8]
        ldr     r10, [pc, #0x208]
        ldr     r4, [sp, #0x10]
        mov     r0, lr, asr #7
        bl      __floatsisf
        mov     r1, r4
        bl      __mulsf3
        str     r0, [r7], #0x10
        mov     r0, r8, asr #7
        bl      __floatsisf
        mov     r1, r4
        bl      __mulsf3
        str     r0, [r6], #0x10
        mov     r9, r9, asr #7
        mov     r0, r9
        bl      __floatsisf
        mov     r1, r4
        bl      __mulsf3
        ldr     r2, [sp, #0x28]
        mov     r1, r0
        mov     r0, r5, asr #7
        str     r1, [r2], #0x10
        str     r2, [sp, #0x28]
        bl      __floatsisf
        mov     r1, r4
        bl      __mulsf3
        ldr     r2, [sp, #0x2C]
        str     r0, [r2], #0x10
        ldr     r0, [sp, #0x30]
        str     r2, [sp, #0x2C]
        ldr     r2, [sp, #0x24]
        add     r0, r0, #4
        cmp     r0, r2
        str     r0, [sp, #0x30]
        blt     LDHP0
        ldr     r3, [sp, #0x34]
        ldr     r12, [sp, #0x30]
        ldr     r5, [sp, #0x24]
        ldr     r1, [sp, #0x18]
        ldr     r8, [sp, #0x14]
LDHP2:
        sub     r4, r12, #4
        cmp     r4, r5
        bge     LDHP4
        ldr     r12, [pc, #0x15C]
        add     r7, r1, r4, lsl #2
        mov     lr, #0x4D
        ldr     r6, [r12]
        mov     r12, #0x19
        orr     r10, lr, #0x1F, 22
        orr     r9, r12, #0x36, 24
LDHP3:
        mul     r3, r3, r10
        add     r4, r4, #1
        add     r3, r3, r9
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
        mul     r12, r3, r10
        add     r12, r12, r9
        mov     r12, r12, lsl #16
        mov     lr, r12, asr #16
        mul     r12, lr, r10
        add     r3, lr, r3
        add     r12, r12, r9
        mov     r12, r12, lsl #16
        mov     lr, r12, asr #16
        mul     r12, lr, r10
        add     r3, lr, r3
        add     r12, r12, r9
        mov     r12, r12, lsl #16
        mov     lr, r12, asr #16
        mul     r12, lr, r10
        add     r3, lr, r3
        add     r12, r12, r9
        mov     r12, r12, lsl #16
        mov     lr, r12, asr #16
        mul     r12, lr, r10
        add     r3, lr, r3
        add     r12, r12, r9
        mov     r12, r12, lsl #16
        mov     lr, r12, asr #16
        mul     r12, lr, r10
        add     r3, lr, r3
        add     r12, r12, r9
        mov     r12, r12, lsl #16
        mov     lr, r12, asr #16
        mul     r12, lr, r10
        add     r3, lr, r3
        add     r12, r12, r9
        mov     r12, r12, lsl #16
        mov     lr, r12, asr #16
        mul     r12, lr, r10
        add     r3, lr, r3
        add     r12, r12, r9
        mov     r12, r12, lsl #16
        mov     lr, r12, asr #16
        mul     r12, lr, r10
        add     r3, lr, r3
        add     r12, r12, r9
        mov     r12, r12, lsl #16
        mov     lr, r12, asr #16
        mul     r12, lr, r10
        add     r3, lr, r3
        add     r12, r12, r9
        mov     r12, r12, lsl #16
        mov     lr, r12, asr #16
        mul     r12, lr, r10
        add     r3, lr, r3
        add     r12, r12, r9
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        add     r3, r12, r3
        strh    r12, [r8]
        mov     r0, r3, asr #7
        bl      __floatsisf
        mov     r1, r6
        bl      __mulsf3
        str     r0, [r7], #4
        cmp     r4, r5
        ldrltsh r3, [r8]
        blt     LDHP3
        mov     r0, #0
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LDHP4:
        strh    r3, [r8]
        mov     r0, #0
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LDHP5:
        mvn     r0, #7
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LDHP6:
        mvn     r0, #5
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
        .long   LDHP__2il0floatpacket.1
        .long   LDHP_randMul


        .data
        .align  4


LDHP__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x3B


        .data
        .align  4


LDHP_randMul:
        .byte   0x4D,0x7C,0x29,0xAF,0x55,0x8B,0x91,0x14,0x9D,0x6B,0x39,0x6A,0x25,0x8F,0x21,0xFA
        .byte   0xED,0x37,0x49,0x9E,0xF5,0xF7,0xB1,0x40,0x61,0xFA,0x11,0x5D,0xC1,0x98,0x00,0x00
LDHP_randAdd:
        .byte   0x19,0x36,0x9E,0x97,0x9F,0x58,0xEC,0xE1,0x15,0x7A,0x6A,0x1A,0xFB,0x7F,0x98,0x48
        .byte   0xD1,0xAB,0xF6,0x1F,0x17,0xFB,0x04,0xE0,0xC8,0xC2,0x4C,0x8C,0x90,0xE0


