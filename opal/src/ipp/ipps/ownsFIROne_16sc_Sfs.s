        .text
        .align  4
        .globl  ownsFIROne_16sc_Sfs


ownsFIROne_16sc_Sfs:
        stmdb   sp!, {r0, r4 - r9, lr}
        ldr     r4, [r2, #0x2C]
        ldr     r5, [r2, #4]
        ldr     r12, [r2, #8]
        ldr     lr, [r2]
        mov     r7, r4, lsl #2
        mov     r6, r0, lsl #16
        str     r0, [sp]
        mov     r4, r6, asr #16
        add     r6, r5, r12, lsl #2
        strh    r4, [r6, +r7]
        ldr     r7, [r2, #0x2C]
        mov     r0, r0, asr #16
        mov     r7, r7, lsl #2
        strh    r4, [r5, +r7]
        ldr     r7, [r2, #0x2C]
        mov     r4, #0
        add     r7, r6, r7, lsl #2
        strh    r0, [r7, #2]
        ldr     r6, [r2, #0x2C]
        add     r6, r5, r6, lsl #2
        strh    r0, [r6, #2]
        ldr     r0, [r2, #0x2C]
        add     r0, r0, #1
        cmp     r0, r12
        strlt   r0, [r2, #0x2C]
        movge   r0, #0
        strge   r0, [r2, #0x2C]
        ldr     r2, [r2, #0x28]
        cmp     r12, #0
        add     r5, r5, r0, lsl #2
        sub     r2, r2, r3
        movle   r0, #0
        movle   r3, r0
        ble     LBVO1
        mov     r0, #0
        add     r5, r5, #2
        add     lr, lr, #2
        mov     r3, r0
LBVO0:
        ldrsh   r8, [r5]
        ldrsh   r9, [lr, #-2]
        ldrsh   r7, [r5, #-2]
        ldrsh   r6, [lr], #4
        add     r5, r5, #4
        mla     r0, r9, r8, r0
        mla     r3, r9, r7, r3
        mul     r8, r8, r6
        subs    r12, r12, #1
        mla     r0, r6, r7, r0
        sub     r3, r3, r8
        bne     LBVO0
LBVO1:
        cmp     r2, #0
        mvn     lr, #0x1E
        mov     r5, #1
        mov     r12, #0x1F
        beq     LBVO2
        cmp     r2, #0x1F
        mov     r6, r2
        movgt   r6, r12
        cmn     r6, #0x1F
        movlt   r6, lr
        cmp     r6, #0
        movgt   r3, r3, lsl r6
        bgt     LBVO2
        rsb     r6, r6, #0
        sub     r7, r6, #1
        add     r7, r3, r5, lsl r7
        mov     r3, r3, asr r6
        and     r3, r3, #1
        add     r3, r7, r3
        sub     r3, r3, #1
        mov     r3, r3, asr r6
LBVO2:
        mvn     r6, #0xFF
        bic     r6, r6, #0x7F, 24
        mvn     r7, r6
        cmp     r7, r3
        mvnlt   r3, r6
        blt     LBVO3
        cmn     r3, #2, 18
        movge   r3, r3, lsl #16
        movge   r3, r3, asr #16
        sublt   r3, r4, #2, 18
LBVO3:
        cmp     r2, #0
        strh    r3, [r1]
        beq     LBVO4
        cmp     r2, #0x1F
        movgt   r2, r12
        cmn     r2, #0x1F
        movlt   r2, lr
        cmp     r2, #0
        movgt   r0, r0, lsl r2
        bgt     LBVO4
        rsb     r2, r2, #0
        sub     r3, r2, #1
        add     r5, r0, r5, lsl r3
        mov     r0, r0, asr r2
        and     r0, r0, #1
        add     r0, r5, r0
        sub     r0, r0, #1
        mov     r0, r0, asr r2
LBVO4:
        mvn     r2, r6
        cmp     r2, r0
        sublt   r4, r4, #2, 18
        mvnlt   r6, r4
        blt     LBVO5
        cmn     r0, #2, 18
        movge   r0, r0, lsl #16
        movge   r6, r0, asr #16
LBVO5:
        strh    r6, [r1, #2]
        ldmia   sp!, {r0, r4 - r9, pc}


