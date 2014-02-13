        .text
        .align  4
        .globl  _ippsFIRLMSMRUpdateTaps32s_16s


_ippsFIRLMSMRUpdateTaps32s_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        cmp     r1, #0
        beq     LBVX13
        ldr     r3, [r1]
        ldr     r2, [pc, #0x2DC]
        cmp     r2, r3
        beq     LBVX0
        mvn     r0, #0x10
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBVX0:
        ldr     r2, [r1, #0x20]
        ldr     lr, [r1, #0x1C]
        ldr     r5, [r1, #0x10]
        mul     r2, r0, r2
        ldr     r12, [r1, #0xC]
        ldr     r3, [r1, #4]
        ldr     r4, [r1, #8]
        add     lr, lr, r5
        cmp     r2, #2, 2
        sub     r0, lr, #1
        mvneq   r6, #2, 2
        beq     LBVX1
        cmp     r2, #0
        rsblt   r6, r2, #0
        movge   r6, r2
LBVX1:
        ldr     r7, [r1, #0x24]
        mov     lr, #0
        cmp     r7, #0
        ble     LBVX12
        mov     r1, #1
        mov     r7, r1, lsl r7
        cmp     r7, r6, asr #1
        movge   r1, lr
        bge     LBVX2
        cmp     r7, r6, asr #2
        bge     LBVX2
        cmp     r7, r6, asr #3
        movge   r1, #2
        bge     LBVX2
        cmp     r7, r6, asr #4
        movge   r1, #3
        bge     LBVX2
        cmp     r7, r6, asr #5
        movge   r1, #4
        bge     LBVX2
        cmp     r7, r6, asr #6
        movge   r1, #5
        bge     LBVX2
        cmp     r7, r6, asr #7
        movge   r1, #6
        bge     LBVX2
        cmp     r7, r6, asr #8
        movge   r1, #7
        bge     LBVX2
        cmp     r7, r6, asr #9
        movge   r1, #8
        bge     LBVX2
        cmp     r7, r6, asr #10
        movge   r1, #9
        bge     LBVX2
        cmp     r7, r6, asr #11
        movge   r1, #0xA
        bge     LBVX2
        cmp     r7, r6, asr #12
        movge   r1, #0xB
        bge     LBVX2
        cmp     r7, r6, asr #13
        movge   r1, #0xC
        bge     LBVX2
        cmp     r7, r6, asr #14
        movge   r1, #0xD
        bge     LBVX2
        cmp     r7, r6, asr #15
        movge   r1, #0xE
        movlt   r1, #0xF
LBVX2:
        mov     r2, r2, asr r1
        rsb     r1, r1, #0xF
LBVX3:
        cmp     r1, #0
        ble     LBVX8
        cmp     r12, #0
        ble     LBVX7
        cmp     r12, #5
        blt     LBVX5
        sub     r7, r12, #5
        add     r6, r3, #4
        str     r3, [sp, #4]
        str     r12, [sp]
LBVX4:
        mov     r3, r0, lsl #1
        ldrsh   r12, [r4, +r3]
        ldr     r3, [r6, #-4]
        ldr     r8, [r6]
        mul     r12, r2, r12
        ldr     r9, [r6, #4]
        ldr     r10, [r6, #8]
        add     lr, lr, #4
        cmp     lr, r7
        add     r12, r3, r12, asr r1
        add     r3, r5, r0
        str     r12, [r6, #-4]
        mov     r0, r3, lsl #1
        ldrsh   r0, [r4, +r0]
        add     r3, r5, r3
        mul     r12, r2, r0
        mov     r11, r3, lsl #1
        add     r3, r5, r3
        add     r0, r5, r3
        mov     r3, r3, lsl #1
        add     r12, r8, r12, asr r1
        str     r12, [r6]
        ldrsh   r11, [r4, +r11]
        mul     r11, r2, r11
        add     r11, r9, r11, asr r1
        str     r11, [r6, #4]
        ldrsh   r3, [r4, +r3]
        mul     r3, r2, r3
        add     r3, r10, r3, asr r1
        str     r3, [r6, #8]
        add     r6, r6, #0x10
        ble     LBVX4
        ldr     r3, [sp, #4]
        ldr     r12, [sp]
LBVX5:
        add     r3, r3, lr, lsl #2
LBVX6:
        mov     r6, r0, lsl #1
        ldrsh   r7, [r4, +r6]
        ldr     r6, [r3]
        add     lr, lr, #1
        mul     r7, r2, r7
        add     r0, r5, r0
        cmp     lr, r12
        add     r7, r6, r7, asr r1
        str     r7, [r3], #4
        blt     LBVX6
LBVX7:
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBVX8:
        cmp     r12, #0
        ble     LBVX7
        cmp     r12, #5
        blt     LBVX10
        sub     r6, r12, #5
        add     r1, r3, #4
LBVX9:
        mov     r7, r0, lsl #1
        ldrsh   r7, [r4, +r7]
        ldr     r8, [r1, #-4]
        ldr     r9, [r1, #8]
        add     lr, lr, #4
        cmp     lr, r6
        mla     r10, r2, r7, r8
        ldr     r7, [r1]
        ldr     r8, [r1, #4]
        str     r10, [r1, #-4]
        add     r10, r5, r0
        add     r0, r5, r10
        mov     r10, r10, lsl #1
        ldrsh   r10, [r4, +r10]
        mla     r7, r2, r10, r7
        str     r7, [r1]
        mov     r7, r0, lsl #1
        ldrsh   r7, [r4, +r7]
        mla     r8, r2, r7, r8
        add     r7, r5, r0
        add     r0, r5, r7
        mov     r7, r7, lsl #1
        str     r8, [r1, #4]
        ldrsh   r7, [r4, +r7]
        mla     r9, r2, r7, r9
        str     r9, [r1, #8]
        add     r1, r1, #0x10
        ble     LBVX9
LBVX10:
        add     r3, r3, lr, lsl #2
LBVX11:
        mov     r1, r0, lsl #1
        ldr     r6, [r3]
        ldrsh   r1, [r4, +r1]
        add     lr, lr, #1
        add     r0, r5, r0
        cmp     lr, r12
        mla     r6, r2, r1, r6
        str     r6, [r3], #4
        blt     LBVX11
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBVX12:
        add     r2, r2, #1, 18
        mov     r1, lr
        mov     r2, r2, asr #15
        b       LBVX3
LBVX13:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
        .long   0x4c4d5352


