        .text
        .align  4
        .globl  ownPow2


ownPow2:
        stmdb   sp!, {lr}
        ldr     r12, [pc, #0x64]
        rsb     r2, r0, #0x1E
        mov     r0, r1, asr #10
        mov     r2, r2, lsl #16
        mov     r3, r0, lsl #1
        ldrsh   r3, [r12, +r3]
        add     r0, r12, r0, lsl #1
        ldrsh   r12, [r0, #2]
        mvn     r0, #0
        mov     r2, r2, asr #16
        cmp     r2, #0x1F
        sub     r12, r3, r12
        add     lr, r0, #2, 18
        and     r1, lr, r1, lsl #5
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #15
        mul     r12, r1, r12
        rsb     r3, r12, r3, lsl #16
        movlt   r0, r3, asr r2
        blt     LDMT0
        cmp     r3, #0
        movge   r0, #0
LDMT0:
        sub     r2, r2, #1
        mov     r1, #1
        tst     r3, r1, lsl r2
        addne   r0, r0, #1
        ldr     pc, [sp], #4
        .long   LDMT_tabpow


        .data
        .align  4


LDMT_tabpow:
        .byte   0x00,0x40,0x67,0x41,0xD5,0x42,0x4C,0x44,0xCB,0x45,0x52,0x47,0xE2,0x48,0x7A,0x4A
        .byte   0x1C,0x4C,0xC7,0x4D,0x7B,0x4F,0x38,0x51,0xFF,0x52,0xD1,0x54,0xAC,0x56,0x92,0x58
        .byte   0x82,0x5A,0x7E,0x5C,0x84,0x5E,0x96,0x60,0xB4,0x62,0xDD,0x64,0x12,0x67,0x54,0x69
        .byte   0xA2,0x6B,0xFE,0x6D,0x66,0x70,0xDD,0x72,0x60,0x75,0xF2,0x77,0x93,0x7A,0x42,0x7D
        .byte   0xFF,0x7F


