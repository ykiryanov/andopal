        .text
        .align  4
        .globl  ownComputeMaxAmplitude_G723


ownComputeMaxAmplitude_G723:
        stmdb   sp!, {r4 - r7, lr}
        ldr     r12, [sp, #0x14]
        ldr     lr, [sp, #0x18]
        cmp     r2, #0x3C
        mov     r4, #0
        movge   r0, r4
        bge     LDRA1
        add     r5, r0, r2, lsl #2
        mov     r0, r4
LDRA0:
        ldr     r7, [r5]
        str     r7, [r1], #4
        ldr     r6, [r5], #8
        cmp     r6, #0
        rsblt   r7, r6, #0
        cmp     r7, r0
        movge   r0, r7
        movge   r4, r2
        add     r2, r2, #2
        cmp     r2, #0x3C
        blt     LDRA0
LDRA1:
        ldr     r1, [pc, #0x54]
        strh    r4, [r12]
        mvn     r2, #2, 2
        mov     r4, #0x16
        mov     r12, r2
        mov     r5, r4
LDRA2:
        ldrsh   r6, [r1], #-2
        mov     r6, r6, lsl #1
        mul     r6, r3, r6
        subs    r6, r6, r0
        bpl     LDRA3
        cmp     r6, #2, 2
        moveq   r6, r2
        rsbne   r6, r6, #0
LDRA3:
        cmp     r6, r12
        movlt   r12, r6
        movlt   r5, r4
        sub     r4, r4, #1
        cmp     r4, #2
        bge     LDRA2
        sub     r5, r5, #1
        strh    r5, [lr]
        ldmia   sp!, {r4 - r7, pc}
        .long   LDRA_GainDBLvls


        .data
        .align  4


LDRA_GainDBLvls:
        .byte   0x01,0x00,0x02,0x00,0x03,0x00,0x04,0x00,0x06,0x00,0x09,0x00,0x0D,0x00,0x12,0x00
        .byte   0x1A,0x00,0x26,0x00,0x37,0x00,0x50,0x00,0x73,0x00,0xA6,0x00,0xF0,0x00,0x5C,0x01
        .byte   0xF6,0x01,0xD6,0x02,0x1A,0x04,0xED,0x05,0x91,0x08,0x62,0x0C,0xE6,0x11,0xDF,0x19


