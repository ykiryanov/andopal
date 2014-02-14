        .text
        .align  4
        .globl  ippiDCT8x8Inv_16s8u_C1R


ippiDCT8x8Inv_16s8u_C1R:
        stmdb   sp!, {lr}
        cmp     r0, #0
        beq     LKHS0
        cmp     r1, #0
        beq     LKHS0
        cmp     r2, #0
        mvnle   r0, #0xD
        ldrle   pc, [sp], #4
        bl      LKHS_dct_8x8_inv_16s8uR
        mov     r0, #0
        ldr     pc, [sp], #4
LKHS0:
        mvn     r0, #7
        ldr     pc, [sp], #4
LKHS_dct_8x8_inv_16s8uR:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xB8
        mov     r6, #0x7E, 30
        mov     r5, #0x46
        mov     r4, #0x92
        mvn     lr, #0x8A
        add     r9, sp, #0x38
        mov     r12, #0xA1
        mvn     r3, #0x82
        orr     r6, r6, #6, 20
        orr     r5, r5, #0x45, 24
        orr     r4, r4, #0x19, 22
        bic     lr, lr, #0xB1, 24
        orr     r12, r12, #0x16, 24
        bic     r3, r3, #0x3B, 22
        mov     r8, r9
        mov     r7, #8
        str     r9, [sp, #0x10]
        str     r2, [sp, #0x14]
        str     r1, [sp, #0x18]
        str     lr, [sp, #0xC]
        str     r4, [sp, #8]
        str     r5, [sp, #4]
        str     r6, [sp]
LKHS1:
        ldr     r5, [sp, #0xC]
        ldrsh   r4, [r0, #0x30]
        ldrsh   r1, [r0, #0x70]
        ldrsh   lr, [r0, #0x50]
        ldrsh   r2, [r0, #0x10]
        mul     r5, r4, r5
        subs    r7, r7, #1
        mov     r6, #0x6E
        add     r4, lr, r4
        orr     r6, r6, #0x6A, 24
        str     r5, [sp, #0x28]
        ldrsh   r9, [r0]
        ldr     r5, [sp, #8]
        mul     r6, r4, r6
        str     r9, [sp, #0x24]
        ldrsh   r9, [r0, #0x40]
        mul     r5, r2, r5
        ldr     r4, [sp]
        str     r9, [sp, #0x20]
        ldrsh   r10, [r0, #0x60]
        ldrsh   r11, [r0, #0x20]
        add     r2, r2, r1
        add     r0, r0, #2
        mul     r9, r10, r3
        mul     r4, r11, r4
        add     r10, r11, r10
        ldr     r11, [sp, #0x20]
        str     r9, [sp, #0x2C]
        mvn     r9, #0x35, 28
        str     r9, [sp, #0x30]
        add     r9, r12, #0x96, 30
        mul     r2, r2, r9
        ldr     r9, [sp, #0x30]
        bic     r9, r9, #2, 20
        mul     r9, lr, r9
        add     lr, r3, #0x56, 24
        mul     lr, r1, lr
        ldr     r1, [sp, #0x28]
        add     r5, r5, r2
        add     r1, r1, r6
        add     r6, r9, r6
        ldr     r9, [sp, #4]
        mul     r9, r10, r9
        add     r10, lr, r2
        sub     lr, r5, r6
        add     r2, r6, r5
        add     r5, r1, r10
        add     r5, r5, #2, 22
        sub     r6, r10, r1
        mov     r5, r5, asr #12
        mul     r1, r5, r12
        ldr     r5, [sp, #0x24]
        add     r2, r2, #2, 22
        add     r4, r4, r9
        add     r10, r5, r11
        sub     r5, r5, r11
        ldr     r11, [sp, #0x2C]
        mov     r2, r2, asr #12
        mul     r2, r2, r12
        add     r11, r11, r9
        add     r9, lr, r6
        sub     lr, lr, r6
        add     r6, r4, r10, lsl #15
        rsb     r4, r4, r10, lsl #15
        add     r10, r11, r5, lsl #15
        rsb     r5, r11, r5, lsl #15
        add     r11, r2, r6
        sub     r2, r6, r2
        add     r6, r9, r10
        sub     r10, r10, r9
        add     r9, lr, r5
        sub     r5, r5, lr
        add     lr, r1, r4
        sub     r4, r4, r1
        add     r11, r11, #2, 22
        add     r2, r2, #2, 22
        add     r6, r6, #2, 22
        add     r10, r10, #2, 22
        add     r9, r9, #2, 22
        add     r5, r5, #2, 22
        add     lr, lr, #2, 22
        add     r4, r4, #2, 22
        mov     r11, r11, asr #12
        mov     r2, r2, asr #12
        mov     r6, r6, asr #12
        mov     r10, r10, asr #12
        mov     r9, r9, asr #12
        mov     r5, r5, asr #12
        mov     lr, lr, asr #12
        mov     r4, r4, asr #12
        strh    r11, [r8]
        strh    r2, [r8, #0x70]
        strh    r6, [r8, #0x10]
        strh    r10, [r8, #0x60]
        strh    r9, [r8, #0x20]
        strh    r5, [r8, #0x50]
        strh    lr, [r8, #0x30]
        strh    r4, [r8, #0x40]
        add     r8, r8, #2
        bne     LKHS1
        ldr     r9, [sp, #0x10]
        ldr     r2, [sp, #0x14]
        ldr     r1, [sp, #0x18]
        ldr     lr, [sp, #0xC]
        ldr     r4, [sp, #8]
        ldr     r5, [sp, #4]
        ldr     r6, [sp]
        mvn     r0, #0x35, 28
        bic     r10, r0, #2, 20
        mov     r0, #0x6E
        orr     r11, r0, #0x6A, 24
        mov     r8, #8
        mov     r7, r9
        mov     r0, r8
        str     r8, [sp, #0x28]
        str     r11, [sp, #0x24]
        str     r10, [sp, #0x20]
        str     r9, [sp, #0x10]
        str     r2, [sp, #0x14]
        str     r1, [sp, #0x18]
        str     lr, [sp, #0xC]
        str     r4, [sp, #8]
        str     r5, [sp, #4]
        str     r6, [sp]
        str     r3, [sp, #0x1C]
LKHS2:
        ldrsh   lr, [r7, #0xA]
        ldr     r4, [sp, #0xC]
        ldrsh   r3, [r7, #6]
        ldr     r1, [sp, #0x20]
        ldrsh   r2, [r7, #2]
        mul     r5, r3, r4
        ldrsh   r6, [r7, #0xE]
        mul     r1, lr, r1
        ldr     r4, [sp, #8]
        add     r3, lr, r3
        ldr     lr, [sp, #0x24]
        ldr     r10, [sp]
        mul     r4, r2, r4
        add     r2, r2, r6
        mul     lr, r3, lr
        add     r3, r12, #0x96, 30
        mul     r3, r2, r3
        subs    r0, r0, #1
        str     lr, [sp, #0x30]
        ldrsh   r8, [r7, #4]
        ldrsh   r9, [r7, #0xC]
        ldrsh   lr, [r7]
        mul     r10, r8, r10
        ldrsh   r2, [r7, #8]
        str     r10, [sp, #0x2C]
        ldr     r10, [sp, #0x1C]
        mul     r11, r9, r10
        add     r9, r8, r9
        add     r10, r10, #0x56, 24
        mul     r6, r6, r10
        ldr     r10, [sp, #0x30]
        str     r11, [sp, #0x34]
        add     r1, r1, r10
        add     r5, r5, r10
        add     r10, r4, r3
        ldr     r4, [sp, #4]
        add     r8, r6, r3
        add     r6, r1, r10
        sub     r3, r10, r1
        mul     r4, r9, r4
        sub     r9, r8, r5
        add     r1, r5, r8
        add     r6, r6, #2, 22
        add     r5, lr, r2
        add     r1, r1, #2, 22
        mov     r6, r6, asr #12
        mul     r8, r6, r12
        sub     r2, lr, r2
        ldr     lr, [sp, #0x2C]
        ldr     r6, [sp, #0x34]
        mov     r1, r1, asr #12
        mul     r1, r1, r12
        add     lr, lr, r4
        add     r6, r6, r4
        add     r4, r3, r9
        sub     r3, r3, r9
        add     r9, lr, r5, lsl #15
        rsb     lr, lr, r5, lsl #15
        add     r5, r6, r2, lsl #15
        rsb     r2, r6, r2, lsl #15
        add     r6, r8, r9
        sub     r8, r9, r8
        add     r9, r4, r5
        sub     r5, r5, r4
        add     r4, r3, r2
        sub     r2, r2, r3
        add     r3, r1, lr
        sub     lr, lr, r1
        add     r6, r6, #1, 12
        add     r8, r8, #1, 12
        add     r9, r9, #1, 12
        add     r5, r5, #1, 12
        add     r4, r4, #1, 12
        add     r2, r2, #1, 12
        add     r3, r3, #1, 12
        add     lr, lr, #1, 12
        mov     r6, r6, asr #21
        mov     r8, r8, asr #21
        mov     r9, r9, asr #21
        mov     r5, r5, asr #21
        mov     r4, r4, asr #21
        mov     r2, r2, asr #21
        mov     r3, r3, asr #21
        mov     lr, lr, asr #21
        strh    r6, [r7]
        strh    r8, [r7, #0xE]
        strh    r9, [r7, #2]
        strh    r5, [r7, #0xC]
        strh    r4, [r7, #4]
        strh    r2, [r7, #0xA]
        strh    r3, [r7, #6]
        strh    lr, [r7, #8]
        add     r7, r7, #0x10
        bne     LKHS2
        ldr     r8, [sp, #0x28]
        ldr     r9, [sp, #0x10]
        ldr     r2, [sp, #0x14]
        ldr     r1, [sp, #0x18]
        mov     lr, #0
        mov     r12, #0xFF
LKHS3:
        ldrsh   r6, [r9]
        ldrsh   r0, [r9, #6]
        ldrsh   r5, [r9, #2]
        ldrsh   r4, [r9, #4]
        cmp     r6, #0xFF
        movgt   r6, r12
        cmp     r6, #0
        mov     r3, lr
        movgt   r3, r6
        cmp     r5, #0xFF
        movgt   r5, r12
        mov     r6, lr
        cmp     r5, #0
        movgt   r6, r5
        ldrsh   r5, [r9, #0xA]
        cmp     r4, #0xFF
        movgt   r4, r12
        mov     r7, lr
        cmp     r4, #0
        movgt   r7, r4
        cmp     r0, #0xFF
        strb    r3, [r1]
        ldrsh   r3, [r9, #8]
        movgt   r0, r12
        strb    r6, [r1, #1]
        cmp     r0, #0
        mov     r6, lr
        movgt   r6, r0
        cmp     r3, #0xFF
        movgt   r3, r12
        cmp     r3, #0
        mov     r4, lr
        movgt   r4, r3
        cmp     r5, #0xFF
        ldrsh   r3, [r9, #0xC]
        movgt   r5, r12
        cmp     r5, #0
        mov     r0, lr
        movgt   r0, r5
        cmp     r3, #0xFF
        ldrsh   r5, [r9, #0xE]
        movgt   r3, r12
        strb    r4, [r1, #4]
        cmp     r3, #0
        mov     r4, lr
        movgt   r4, r3
        cmp     r5, #0xFF
        movgt   r5, r12
        cmp     r5, #0
        mov     r3, lr
        movgt   r3, r5
        strb    r7, [r1, #2]
        strb    r6, [r1, #3]
        strb    r0, [r1, #5]
        strb    r4, [r1, #6]
        strb    r3, [r1, #7]
        subs    r8, r8, #1
        add     r1, r1, r2
        add     r9, r9, #0x10
        bne     LKHS3
        add     sp, sp, #0xB8
        ldmia   sp!, {r4 - r11, pc}


