        .text
        .align  4
        .globl  ownGainPredict


ownGainPredict:
        stmdb   sp!, {r4 - r10, lr}
        sub     sp, sp, #8
        mov     r4, r0
        mov     r0, r1, lsl #1
        mov     r6, r2
        add     r2, sp, #4
        mov     r1, sp
        mvn     r12, #0x53
        bic     r7, r12, #6, 20
        mov     r5, r3
        bl      ownLog2
        ldrsh   r8, [sp, #4]
        ldrsh   r1, [sp]
        ldr     lr, [pc, #0xB0]
        mul     r10, r8, r7
        ldrsh   r9, [r4, #2]
        mul     r12, r1, r7
        ldrsh   r1, [r4]
        mov     r7, #0xA6, 26
        orr     r8, r7, #0x3F, 18
        ldrsh   r7, [lr]
        add     r10, r12, r10, asr #15
        add     r10, r10, r8
        ldrsh   r8, [lr, #2]
        ldrsh   r12, [r4, #4]
        mov     r10, r10, lsl #10
        mla     r7, r7, r1, r10
        ldrsh   r4, [r4, #6]
        ldrsh   r1, [lr, #4]
        ldrsh   lr, [lr, #6]
        mov     r0, #0xFF
        mla     r7, r8, r9, r7
        orr     r0, r0, #0x7F, 24
        mla     r7, r1, r12, r7
        mla     r7, lr, r4, r7
        mov     r1, r7, asr #15
        cmp     r0, r1
        movlt   r1, r0
        blt     LDNE0
        cmn     r1, #2, 18
        movge   r1, r1, lsl #16
        movge   r1, r1, asr #16
        mvnlt   r1, r0
LDNE0:
        add     r4, r1, r1, lsl #2
        strh    r1, [r6]
        add     r4, r4, r4, lsl #4
        rsb     r4, r1, r4, lsl #6
        and     r1, r0, r4, asr #8
        strh    r1, [sp, #4]
        mov     r4, r4, asr #23
        strh    r4, [sp]
        mov     r0, #0xE
        bl      ownPow2
        ldrsh   r1, [sp]
        strh    r0, [r6]
        rsb     r1, r1, #0xE
        strh    r1, [r5]
        add     sp, sp, #8
        ldmia   sp!, {r4 - r10, pc}
        .long   LDNE_pred


        .data
        .align  4


LDNE_pred:
        .byte   0xC3,0x15,0x8F,0x12,0xE1,0x0A,0x14,0x06


