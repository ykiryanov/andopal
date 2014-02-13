        .text
        .align  4
        .globl  ownGainUpdateErasure


ownGainUpdateErasure:
        ldrsh   r12, [r0, #2]
        ldrsh   r3, [r0]
        ldrsh   r2, [r0, #4]
        ldrsh   r1, [r0, #6]
        add     r12, r3, r12
        add     r2, r12, r2
        add     r1, r2, r1
        mov     r2, r1, asr #2
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mov     r2, r2, lsl #16
        mvn     r3, r1
        mov     r2, r2, asr #16
        sub     r2, r2, #1, 20
        cmp     r3, r2
        mvnlt   r2, r1
        blt     LDNC0
        cmn     r2, #2, 18
        movge   r2, r2, lsl #16
        movge   r2, r2, asr #16
        movlt   r2, r1
LDNC0:
        ldrsh   r3, [r0, #4]
        add     r1, r1, #0x12, 22
        cmp     r2, r1
        movgt   r1, r2
        ldrsh   r2, [r0, #2]
        strh    r3, [r0, #6]
        ldrsh   r3, [r0]
        strh    r1, [r0]
        strh    r2, [r0, #4]
        strh    r3, [r0, #2]
        bx      lr


