        .text
        .align  4
        .globl  ownQuantDim4SubVeq


ownQuantDim4SubVeq:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x2C
        cmp     r3, #0
        str     r3, [sp, #0xC]
        mov     r7, r0
        mov     r3, #0
        movle   r9, r3
        ble     LDOO1
        ldrsh   r12, [r7, #2]
        ldrsh   r6, [r7]
        mov     r9, r3
        str     r12, [sp, #4]
        ldrsh   r12, [r7, #4]
        add     lr, r1, #4
        add     r4, r1, #6
        str     r12, [sp]
        ldrsh   r11, [r2, #2]
        ldrsh   r0, [r2, #4]
        ldrsh   r8, [r2, #6]
        ldrsh   r5, [r2]
        ldrsh   r10, [r7, #6]
        mvn     r2, #2, 2
        str     r2, [sp, #8]
        add     r12, r1, #2
        mov     r2, r1
        str     r1, [sp, #0x14]
        str     r7, [sp, #0x10]
        ldr     r1, [sp]
        ldr     r7, [sp, #8]
        str     r9, [sp, #0x18]
        str     r8, [sp, #0x1C]
        str     r0, [sp, #0x24]
        str     r11, [sp, #0x20]
        str     r10, [sp, #0x28]
LDOO0:
        ldrsh   r0, [r2], #8
        ldrsh   r10, [r12], #8
        ldr     r11, [sp, #4]
        ldrsh   r8, [lr], #8
        sub     r9, r6, r0
        ldrsh   r0, [r4], #8
        mov     r9, r9, lsl #16
        sub     r11, r11, r10
        mov     r9, r9, asr #16
        mul     r10, r5, r9
        mov     r11, r11, lsl #16
        mov     r9, r11, asr #16
        ldr     r11, [sp, #0x20]
        mov     r10, r10, asr #15
        mul     r9, r11, r9
        sub     r8, r1, r8
        mov     r11, r10, lsl #16
        mov     r8, r8, lsl #16
        mov     r11, r11, asr #16
        mov     r10, r9, asr #15
        mul     r9, r11, r11
        ldr     r11, [sp, #0x24]
        mov     r10, r10, lsl #16
        mov     r8, r8, asr #16
        mul     r8, r11, r8
        mov     r10, r10, asr #16
        mla     r9, r10, r10, r9
        ldr     r10, [sp, #0x28]
        mov     r8, r8, asr #15
        sub     r0, r10, r0
        mov     r10, r0, lsl #16
        mov     r0, r8, lsl #16
        ldr     r8, [sp, #0x1C]
        mov     r10, r10, asr #16
        mov     r0, r0, asr #16
        mla     r9, r0, r0, r9
        mul     r8, r8, r10
        mov     r8, r8, asr #15
        mov     r8, r8, lsl #16
        mov     r8, r8, asr #16
        mla     r9, r8, r8, r9
        cmp     r9, r7
        movlt   r7, r9
        strlt   r3, [sp, #0x18]
        ldr     r0, [sp, #0xC]
        add     r3, r3, #1
        cmp     r3, r0
        blt     LDOO0
        ldr     r9, [sp, #0x18]
        ldr     r1, [sp, #0x14]
        ldr     r7, [sp, #0x10]
LDOO1:
        mov     r9, r9, lsl #16
        mov     r3, r9, asr #13
        ldrsh   r2, [r1, +r3]
        add     r1, r1, r3
        mov     r0, r9, asr #16
        strh    r2, [r7]
        ldrsh   r2, [r1, #2]
        strh    r2, [r7, #2]
        ldrsh   r2, [r1, #4]
        strh    r2, [r7, #4]
        ldrsh   r1, [r1, #6]
        strh    r1, [r7, #6]
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}


