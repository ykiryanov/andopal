        .text
        .align  4
        .globl  ownLog2


ownLog2:
        stmdb   sp!, {r4, lr}
        cmp     r0, #0
        mov     r4, #0
        ble     LDMZ3
        cmp     r0, #0
        mov     lr, r0
        beq     LDMZ2
        cmn     r0, #1
        moveq   r0, #2, 2
        moveq   r4, #0x1F
        beq     LDMZ2
        cmp     r0, #0
        mvnlt   lr, r0
        cmp     lr, #0
        beq     LDMZ1
        ldr     r12, [pc, #0xB0]
        ldr     r3, [pc, #0xB0]
        movs    r4, lr, lsr #16
        bne     LDMZ0
        bic     lr, lr, #0xFF, 8
        bic     lr, lr, #0xFF, 16
        movs    r4, lr, asr #8
        movne   lr, r4, lsl #1
        movne   r3, r12
        moveq   lr, lr, lsl #1
        ldrsh   lr, [r3, +lr]
        add     r3, lr, #0x10
        mov     r3, r3, lsl #16
        mov     r4, r3, asr #16
        b       LDMZ1
LDMZ0:
        movs    lr, lr, lsr #24
        movne   lr, lr, lsl #1
        ldrnesh r4, [r12, +lr]
        moveq   r4, r4, lsl #1
        ldreqsh r4, [r3, +r4]
LDMZ1:
        mov     r0, r0, lsl r4
LDMZ2:
        rsb     r4, r4, #0x1E
        strh    r4, [r1]
        mov     r1, r0, asr #25
        sub     r1, r1, #0x20
        ldr     r3, [pc, #0x54]
        mov     r1, r1, lsl #16
        mov     r12, r1, asr #16
        mov     r1, #0xFF
        orr     r1, r1, #0x7F, 24
        and     r1, r1, r0, asr #10
        mov     r0, r12, lsl #1
        ldrsh   r0, [r3, +r0]
        add     r12, r3, r12, lsl #1
        ldrsh   r3, [r12, #2]
        sub     r3, r0, r3
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
        mul     r3, r1, r3
        rsb     r0, r3, r0, lsl #15
        mov     r0, r0, asr #15
        strh    r0, [r2]
        ldmia   sp!, {r4, pc}
LDMZ3:
        strh    r4, [r1]
        strh    r4, [r2]
        ldmia   sp!, {r4, pc}
        .long   NormTable
        .long   NormTable2
        .long   LDMZ_tablog


        .data
        .align  4


LDMZ_tablog:
        .byte   0x00,0x00,0xAF,0x05,0x32,0x0B,0x8C,0x10,0xC0,0x15,0xCF,0x1A,0xBC,0x1F,0x88,0x24
        .byte   0x35,0x29,0xC4,0x2D,0x37,0x32,0x8F,0x36,0xCE,0x3A,0xF5,0x3E,0x04,0x43,0xFC,0x46
        .byte   0xDF,0x4A,0xAE,0x4E,0x69,0x52,0x11,0x56,0xA7,0x59,0x2C,0x5D,0x9F,0x60,0x03,0x64
        .byte   0x57,0x67,0x9B,0x6A,0xD1,0x6D,0xFA,0x70,0x14,0x74,0x21,0x77,0x22,0x7A,0x17,0x7D
        .byte   0xFF,0x7F


