        .text
        .align  4
        .globl  ownsFIROne_16s_Sfs


ownsFIROne_16s_Sfs:
        stmdb   sp!, {r4 - r10, lr}
        ldr     r6, [r2, #0x2C]
        ldr     r4, [r2, #4]
        ldr     r12, [r2, #8]
        ldr     r5, [r2, #0x28]
        ldr     lr, [r2]
        mov     r6, r6, lsl #1
        add     r7, r4, r12, lsl #1
        strh    r0, [r7, +r6]
        ldr     r6, [r2, #0x2C]
        mov     r6, r6, lsl #1
        strh    r0, [r4, +r6]
        ldr     r6, [r2, #0x2C]
        sub     r0, r5, r3
        mov     r3, #0
        add     r6, r6, #1
        cmp     r6, r12
        strlt   r6, [r2, #0x2C]
        movge   r6, #0
        strge   r6, [r2, #0x2C]
        cmp     r12, #0
        add     r4, r4, r6, lsl #1
        movle   r2, #0
        ble     LBVP3
        cmp     r12, #6
        movlt   r2, #0
        movlt   r5, r2
        blt     LBVP1
        mov     r2, #0
        mov     r5, r2
        sub     r8, r12, #6
        mov     r7, r4
        mov     r6, lr
LBVP0:
        ldrsh   r9, [r7]
        ldrsh   r10, [r6]
        add     r5, r5, #5
        cmp     r5, r8
        mla     r2, r10, r9, r2
        ldrsh   r9, [r7, #2]
        ldrsh   r10, [r6, #2]
        mla     r2, r10, r9, r2
        ldrsh   r9, [r7, #4]
        ldrsh   r10, [r6, #4]
        mla     r2, r10, r9, r2
        ldrsh   r9, [r7, #6]
        ldrsh   r10, [r6, #6]
        mla     r2, r10, r9, r2
        ldrsh   r9, [r7, #8]
        ldrsh   r10, [r6, #8]
        add     r7, r7, #0xA
        add     r6, r6, #0xA
        mla     r2, r10, r9, r2
        ble     LBVP0
LBVP1:
        add     r4, r4, r5, lsl #1
        add     lr, lr, r5, lsl #1
LBVP2:
        ldrsh   r7, [r4], #2
        ldrsh   r6, [lr], #2
        add     r5, r5, #1
        mla     r2, r6, r7, r2
        cmp     r5, r12
        blt     LBVP2
LBVP3:
        cmp     r0, #0
        beq     LBVP4
        cmp     r0, #0x1F
        mov     r12, #0x1F
        movgt   r0, r12
        cmn     r0, #0x1F
        mvn     r12, #0x1E
        movlt   r0, r12
        cmp     r0, #0
        movgt   r2, r2, lsl r0
        bgt     LBVP4
        rsb     r0, r0, #0
        sub     r12, r0, #1
        mov     lr, #1
        add     r12, r2, lr, lsl r12
        mov     r2, r2, asr r0
        and     r2, r2, #1
        add     r2, r12, r2
        sub     r2, r2, #1
        mov     r2, r2, asr r0
LBVP4:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r12, r0
        cmp     r12, r2
        sublt   r3, r3, #2, 18
        mvnlt   r0, r3
        blt     LBVP5
        cmn     r2, #2, 18
        movge   r2, r2, lsl #16
        movge   r0, r2, asr #16
LBVP5:
        strh    r0, [r1]
        ldmia   sp!, {r4 - r10, pc}


