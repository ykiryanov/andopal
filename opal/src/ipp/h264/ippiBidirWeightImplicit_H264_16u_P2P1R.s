        .text
        .align  4
        .globl  ippiBidirWeightImplicit_H264_16u_P2P1R


ippiBidirWeightImplicit_H264_16u_P2P1R:
        stmdb   sp!, {r4 - r10, lr}
        cmp     r0, #0
        beq     LLAR9
        ldr     r8, [r0]
        cmp     r8, #0
        beq     LLAR9
        ldr     r7, [r0, #8]
        cmp     r7, #0
        beq     LLAR9
        ldr     r6, [r0, #0x10]
        cmp     r6, #0
        beq     LLAR9
        ldr     r9, [r0, #4]
        ldr     r5, [r0, #0x18]
        cmp     r9, r5
        blt     LLAR1
        ldr     r12, [r0, #0xC]
        cmp     r12, r5
        blt     LLAR1
        ldr     r3, [r0, #0x14]
        cmp     r3, r5
        blt     LLAR1
        ldr     r4, [r0, #0x1C]
        cmp     r4, #2
        beq     LLAR2
        cmp     r4, #4
        beq     LLAR2
        cmp     r4, #8
        beq     LLAR2
        cmp     r4, #0x10
        beq     LLAR2
LLAR0:
        mvn     r0, #5
        ldmia   sp!, {r4 - r10, pc}
LLAR1:
        mvn     r0, #0xD
        ldmia   sp!, {r4 - r10, pc}
LLAR2:
        cmp     r5, #2
        beq     LLAR3
        cmp     r5, #4
        beq     LLAR3
        cmp     r5, #8
        beq     LLAR3
        cmp     r5, #0x10
        bne     LLAR0
LLAR3:
        cmp     r4, #0
        bls     LLAR8
        mov     lr, #1
LLAR4:
        cmp     r5, #0
        bls     LLAR7
        mov     r10, #0
        mov     r9, r5
LLAR5:
        ldrh    r3, [r7, +r10]
        ldrh    r12, [r8, +r10]
        mul     r3, r2, r3
        mla     r12, r1, r12, r3
        ldr     r3, [r0, #0x20]
        mov     r3, lr, lsl r3
        sub     r3, r3, #1
        add     r12, r12, #0x20
        mov     r12, r12, asr #6
        cmp     r3, r12
        blt     LLAR6
        cmp     r12, #0
        movlt   r3, #0
        movge   r3, r12
LLAR6:
        strh    r3, [r6, +r10]
        subs    r9, r9, #1
        add     r10, r10, #2
        bne     LLAR5
        ldr     r9, [r0, #4]
        ldr     r12, [r0, #0xC]
        ldr     r3, [r0, #0x14]
LLAR7:
        subs    r4, r4, #1
        add     r8, r8, r9, lsl #1
        add     r7, r7, r12, lsl #1
        add     r6, r6, r3, lsl #1
        bne     LLAR4
LLAR8:
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LLAR9:
        mvn     r0, #7
        ldmia   sp!, {r4 - r10, pc}


