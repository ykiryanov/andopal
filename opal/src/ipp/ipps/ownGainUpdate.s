        .text
        .align  4
        .globl  ownGainUpdate


ownGainUpdate:
        stmdb   sp!, {r4, lr}
        sub     sp, sp, #8
        mov     r4, r0
        ldrsh   r3, [r4, #4]
        mov     r0, r1
        add     r2, sp, #4
        strh    r3, [r4, #6]
        ldrsh   r3, [r4, #2]
        mov     r1, sp
        strh    r3, [r4, #4]
        ldrsh   r3, [r4]
        strh    r3, [r4, #2]
        bl      ownLog2
        ldrsh   r1, [sp]
        ldrsh   r3, [sp, #4]
        mvn     r2, #0xFF, 14
        sub     r1, r1, #0xD
        bic     r2, r2, #0x3F, 6
        mov     r3, r3, lsl #1
        add     r1, r3, r1, lsl #16
        cmp     r2, r1
        mvnlt   r1, #2, 2
        blt     LDND0
        cmn     r1, #1, 14
        movge   r1, r1, lsl #13
        movlt   r1, #2, 2
LDND0:
        mov     r1, r1, asr #16
        mov     r2, #0x54
        mov     r1, r1, lsl #16
        orr     r2, r2, #6, 20
        mov     r1, r1, asr #16
        mul     r2, r1, r2
        mov     r1, r2, asr #15
        strh    r1, [r4]
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}


