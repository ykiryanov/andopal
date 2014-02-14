        .text
        .align  4
        .globl  ippiQuantInter_H263_16s_C1I


ippiQuantInter_H263_16s_C1I:
        stmdb   sp!, {lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldreq   pc, [sp], #4
        cmp     r1, #1
        blt     LFFS1
        cmp     r1, #0x1F
        bgt     LFFS1
        cmp     r1, #8
        bge     LFFS0
        cmp     r3, #0
        bne     LFFS0
        bl      ownph263_QuantInter_16s_I
        mov     r0, #0
        ldr     pc, [sp], #4
LFFS0:
        bl      ownph263_QuantInterNoClip_16s_I
        mov     r0, #0
        ldr     pc, [sp], #4
LFFS1:
        mvn     r0, #0xBF
        ldr     pc, [sp], #4


