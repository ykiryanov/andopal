        .text
        .align  4
        .globl  _ipps_jCcsRecombine_16s


_ipps_jCcsRecombine_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        movs    lr, r1, asr #1
        beq     LCCG2
        cmp     r2, #0
        sub     r1, r1, #1
        ble     LCCG4
        cmp     lr, #1
        ble     LCCG3
        mov     r1, r1, lsl #3
        add     r1, r1, #0xC
        add     r2, r1, r0
        add     r8, r3, #2
        add     r1, r3, #0xE
        add     r7, r0, #4
        sub     r6, lr, #1
        str     lr, [sp]
        str     r0, [sp, #4]
LCCG0:
        ldr     r5, [r2, #-8]
        ldr     r4, [r7, #8]
        ldr     lr, [r2, #-0xC]
        ldr     r3, [r7, #4]
        ldrsh   r12, [r8, #6]
        ldrsh   r10, [r8, #8]!
        add     r0, r4, r5
        ldrsh   r11, [r1]
        sub     r9, r3, lr
        sub     r4, r4, r5
        ldrsh   r5, [r1, #-2]
        rsb     r0, r0, #0
        add     lr, r3, lr
        bic     r3, r0, #0xFF, 8
        mov     r0, r0, asr #16
        bic     r3, r3, #0xFF, 16
        str     r0, [sp, #0xC]
        subs    r6, r6, #1
        mov     r0, r3, asr #1
        mul     r3, r12, r0
        add     r1, r1, #8
        str     r3, [sp, #8]
        ldr     r3, [sp, #0xC]
        mul     r12, r12, r3
        mul     r3, r3, r5
        mul     r5, r0, r5
        bic     r0, r9, #0xFF, 8
        mov     r9, r9, asr #16
        mla     r12, r9, r10, r12
        mla     r3, r11, r9, r3
        ldr     r9, [sp, #8]
        bic     r0, r0, #0xFF, 16
        mov     r0, r0, asr #1
        mla     r5, r11, r0, r5
        mla     r10, r10, r0, r9
        add     r10, r10, #1, 20
        mov     r0, r10, asr #13
        add     r12, r0, r12, lsl #2
        add     r5, r5, #1, 20
        add     r0, lr, r12
        str     r0, [r7, #4]
        mov     r5, r5, asr #13
        add     r3, r5, r3, lsl #2
        sub     lr, lr, r12
        str     lr, [r2, #-0xC]
        add     r0, r4, r3
        str     r0, [r7, #8]!
        sub     r3, r3, r4
        str     r3, [r2, #-8]!
        bne     LCCG0
        ldr     lr, [sp]
        ldr     r0, [sp, #4]
        mov     lr, lr, lsl #3
        add     r1, r0, lr
        ldr     r1, [r1, #4]
LCCG1:
        ldr     r2, [lr, +r0]
        mov     r1, r1, lsl #1
        add     r3, r0, lr
        mov     r2, r2, lsl #1
        str     r2, [lr, +r0]
        str     r1, [r3, #4]
LCCG2:
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LCCG3:
        mov     lr, lr, lsl #3
        add     r1, r0, lr
        ldr     r1, [r1, #4]
        b       LCCG1
LCCG4:
        cmp     lr, #1
        ble     LCCG6
        mov     r1, r1, lsl #3
        add     r1, r1, #0xC
        add     r2, r3, #2
        add     r4, r3, #0xE
        add     r1, r1, r0
        add     r12, r0, #4
        sub     r3, lr, #1
        str     r4, [sp, #8]
        str     r2, [sp, #0xC]
        str     lr, [sp]
        str     r0, [sp, #4]
LCCG5:
        ldr     r5, [sp, #0xC]
        ldr     r7, [r12, #4]
        ldr     r0, [r1, #-0xC]
        ldrsh   r8, [r5, #6]
        ldrsh   r4, [r5, #8]!
        ldr     r2, [r1, #-8]
        ldr     lr, [r12, #8]
        str     r5, [sp, #0xC]
        add     r5, lr, r2
        sub     r2, lr, r2
        ldr     lr, [sp, #8]
        ldr     r6, [sp, #8]
        subs    r3, r3, #1
        ldrsh   lr, [lr]
        rsb     r9, r5, #0
        bic     r11, r5, #0xFF, 8
        mov     r5, r5, asr #16
        str     lr, [sp, #0x10]
        ldrsh   lr, [r6, #-2]
        add     r6, r6, #8
        str     r6, [sp, #8]
        sub     r6, r7, r0
        add     r0, r7, r0
        rsb     r10, r6, #0
        bic     r7, r9, #0xFF, 8
        bic     r7, r7, #0xFF, 16
        str     r11, [sp, #0x14]
        mov     r11, r10, asr #16
        str     r11, [sp, #0x18]
        ldr     r11, [sp, #0x18]
        mov     r7, r7, asr #1
        mul     r7, r8, r7
        bic     r10, r10, #0xFF, 8
        bic     r10, r10, #0xFF, 16
        mov     r9, r9, asr #16
        mul     r8, r8, r9
        mov     r10, r10, asr #1
        mla     r10, r4, r10, r7
        ldr     r7, [sp, #0x14]
        mla     r8, r4, r11, r8
        add     r10, r10, #1, 20
        bic     r9, r7, #0xFF, 16
        mov     r7, r6, asr #16
        mov     r10, r10, asr #13
        mov     r9, r9, asr #1
        mul     r4, lr, r9
        mul     lr, lr, r5
        ldr     r5, [sp, #0x10]
        bic     r6, r6, #0xFF, 8
        bic     r6, r6, #0xFF, 16
        add     r8, r10, r8, lsl #2
        mov     r6, r6, asr #1
        mla     r4, r5, r6, r4
        mla     lr, r5, r7, lr
        add     r5, r0, r8
        str     r5, [r1, #-0xC]
        sub     r0, r0, r8
        add     r4, r4, #1, 20
        str     r0, [r12, #4]
        mov     r4, r4, asr #13
        add     lr, r4, lr, lsl #2
        add     r0, r2, lr
        str     r0, [r1, #-8]!
        sub     lr, lr, r2
        str     lr, [r12, #8]!
        bne     LCCG5
        ldr     lr, [sp]
        ldr     r0, [sp, #4]
LCCG6:
        mov     lr, lr, lsl #3
        add     r2, r0, lr
        ldr     r1, [r2, #4]
        rsb     r1, r1, #0
        str     r1, [r2, #4]
        b       LCCG1


