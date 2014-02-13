        .text
        .align  4
        .globl  _ippiInterpolateLuma_H264_16u_C1R


_ippiInterpolateLuma_H264_16u_C1R:
        mov     r2, r0
        cmp     r2, #0
        beq     LLAN5
        ldr     r0, [r2]
        cmp     r0, #0
        beq     LLAN5
        ldr     r1, [r2, #8]
        cmp     r1, #0
        beq     LLAN5
        ldr     r1, [r2, #4]
        ldr     r3, [r2, #0x18]
        cmp     r1, r3
        blt     LLAN2
        ldr     r12, [r2, #0xC]
        cmp     r12, r3
        blt     LLAN2
        ldr     r12, [r2, #0x10]
        cmp     r12, #0
        blt     LLAN1
        cmp     r12, #3
        bgt     LLAN1
        ldr     r12, [r2, #0x14]
        cmp     r12, #0
        blt     LLAN1
        cmp     r12, #3
        bgt     LLAN1
        ldr     r12, [r2, #0x1C]
        cmp     r12, #4
        beq     LLAN3
        cmp     r12, #8
        beq     LLAN3
        cmp     r12, #0x10
        beq     LLAN3
LLAN0:
        mvn     r0, #5
        bx      lr
LLAN1:
        mvn     r0, #4
        bx      lr
LLAN2:
        mvn     r0, #0xD
        bx      lr
LLAN3:
        cmp     r3, #4
        beq     LLAN4
        cmp     r3, #8
        beq     LLAN4
        cmp     r3, #0x10
        bne     LLAN0
LLAN4:
        add     r12, r3, r12
        cmp     r12, #0x14
        bne     own_InterpolateLuma_H264_16u
        b       LLAN0
LLAN5:
        mvn     r0, #7
        bx      lr


