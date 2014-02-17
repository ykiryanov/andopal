        .text
        .align  4
        .globl  ippiSAD4x4_8u32s


ippiSAD4x4_8u32s:
        stmdb   sp!, {r4 - r8, lr}
        ldr     r12, [sp, #0x18]
        cmp     r0, #0
        beq     LKJC1
        cmp     r2, #0
        beq     LKJC1
        cmp     r12, #0
        beq     LKJC1
        mov     r6, #0
        str     r6, [r12]
        mov     r5, #4
LKJC0:
        ldrb    r7, [r0]
        ldrb    r4, [r2]
        subs    r5, r5, #1
        add     lr, r0, #4
        add     lr, lr, r1
        sub     r7, r7, r4
        add     r4, r2, #4
        eor     r8, r7, r7, asr #31
        add     r4, r4, r3
        sub     r8, r8, r7, asr #31
        mov     r7, r8, lsl #16
        add     r6, r6, r7, asr #16
        str     r6, [r12]
        ldrb    r7, [r2, #1]
        ldrb    r8, [r0, #1]
        sub     r7, r8, r7
        eor     r8, r7, r7, asr #31
        sub     r8, r8, r7, asr #31
        mov     r7, r8, lsl #16
        add     r6, r6, r7, asr #16
        str     r6, [r12]
        ldrb    r7, [r2, #2]
        ldrb    r8, [r0, #2]
        sub     r7, r8, r7
        eor     r8, r7, r7, asr #31
        sub     r8, r8, r7, asr #31
        mov     r7, r8, lsl #16
        add     r6, r6, r7, asr #16
        str     r6, [r12]
        ldrb    r8, [r0, #3]
        ldrb    r7, [r2, #3]
        sub     r0, lr, #4
        sub     r2, r4, #4
        sub     r8, r8, r7
        eor     lr, r8, r8, asr #31
        sub     lr, lr, r8, asr #31
        mov     lr, lr, lsl #16
        add     r6, r6, lr, asr #16
        str     r6, [r12]
        bne     LKJC0
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}
LKJC1:
        mvn     r0, #7
        ldmia   sp!, {r4 - r8, pc}


