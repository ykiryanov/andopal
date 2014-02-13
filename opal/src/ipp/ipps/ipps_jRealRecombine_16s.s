        .text
        .align  4
        .globl  _ipps_jRealRecombine_16s


_ipps_jRealRecombine_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        movs    r12, r1, asr #1
        beq     LCCE2
        cmp     r2, #0
        sub     r1, r1, #1
        ble     LCCE3
        cmp     r12, #1
        ble     LCCE1
        mov     r1, r1, lsl #3
        add     r1, r1, #0xC
        add     r2, r1, r0
        add     r8, r3, #2
        add     r1, r3, #0xE
        add     r7, r0, #4
        sub     r6, r12, #1
        str     r12, [sp]
        str     r0, [sp, #4]
LCCE0:
        ldr     r5, [r2, #-8]
        ldr     r4, [r7, #8]
        ldr     lr, [r2, #-0xC]
        ldr     r3, [r7, #4]
        ldrsh   r12, [r8, #6]
        ldrsh   r10, [r8, #8]!
        add     r0, r4, r5
        ldrsh   r11, [r1]
        mov     r0, r0, asr #1
        sub     r9, r3, lr
        sub     r4, r4, r5
        ldrsh   r5, [r1, #-2]
        rsb     r0, r0, #0
        add     lr, r3, lr
        bic     r3, r0, #0xFF, 8
        mov     r0, r0, asr #16
        bic     r3, r3, #0xFF, 16
        str     r0, [sp, #8]
        subs    r6, r6, #1
        mov     r0, r3, asr #1
        mul     r3, r12, r0
        add     r1, r1, #8
        str     r3, [sp, #0xC]
        ldr     r3, [sp, #8]
        mul     r12, r12, r3
        mul     r3, r3, r5
        mul     r5, r0, r5
        mov     r0, r9, asr #1
        bic     r0, r0, #0xFF, 8
        mov     r9, r9, asr #17
        mla     r12, r9, r10, r12
        mla     r3, r11, r9, r3
        ldr     r9, [sp, #0xC]
        bic     r0, r0, #0xFF, 16
        mov     r0, r0, asr #1
        mla     r5, r11, r0, r5
        mla     r10, r10, r0, r9
        add     r10, r10, #1, 20
        mov     r0, r10, asr #13
        add     r12, r0, r12, lsl #2
        add     r5, r5, #1, 20
        rsb     r0, r12, lr, asr #1
        str     r0, [r7, #4]
        mov     r5, r5, asr #13
        add     r3, r5, r3, lsl #2
        rsb     r0, r3, r4, asr #1
        add     lr, r12, lr, asr #1
        str     lr, [r2, #-0xC]
        rsb     r3, r3, #0
        str     r0, [r7, #8]!
        sub     r3, r3, r4, asr #1
        str     r3, [r2, #-8]!
        bne     LCCE0
        ldr     r12, [sp]
        ldr     r0, [sp, #4]
LCCE1:
        add     r12, r0, r12, lsl #3
        ldr     r0, [r12, #4]
        rsb     r0, r0, #0
        str     r0, [r12, #4]
LCCE2:
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCCE3:
        cmp     r12, #1
        ble     LCCE2
        mov     r1, r1, lsl #3
        add     r1, r1, #0xC
        add     r2, r1, r0
        add     r1, r0, #4
        sub     r0, r12, #1
        add     r12, r3, #2
        add     r3, r3, #0xE
        str     r3, [sp, #4]
        str     r12, [sp]
LCCE4:
        ldr     r5, [sp]
        ldr     r4, [r2, #-8]
        ldr     lr, [r1, #8]
        ldrsh   r6, [r5, #6]
        ldrsh   r7, [r5, #8]!
        ldr     r12, [r2, #-0xC]
        ldr     r3, [r1, #4]
        add     r9, lr, r4
        sub     lr, r4, lr
        ldr     r4, [sp, #4]
        str     r5, [sp]
        subs    r0, r0, #1
        ldrsh   r5, [r4, #-2]
        ldrsh   r8, [r4], #8
        str     r4, [sp, #4]
        sub     r4, r12, r3
        add     r12, r3, r12
        mov     r3, r9, asr #1
        mov     r9, r9, asr #17
        mul     r10, r5, r9
        mov     r11, r4, asr #1
        mov     r4, r4, asr #17
        rsb     r9, r3, #0
        mla     r4, r8, r4, r10
        bic     r3, r3, #0xFF, 8
        bic     r3, r3, #0xFF, 16
        rsb     r10, r11, #0
        mov     r3, r3, asr #1
        mul     r5, r5, r3
        bic     r11, r11, #0xFF, 8
        bic     r11, r11, #0xFF, 16
        bic     r3, r9, #0xFF, 8
        mov     r11, r11, asr #1
        mla     r5, r8, r11, r5
        bic     r3, r3, #0xFF, 16
        mov     r9, r9, asr #16
        mul     r8, r6, r9
        mov     r3, r3, asr #1
        mul     r6, r6, r3
        bic     r3, r10, #0xFF, 8
        bic     r3, r3, #0xFF, 16
        mov     r10, r10, asr #16
        mla     r8, r7, r10, r8
        mov     r3, r3, asr #1
        mla     r6, r7, r3, r6
        add     r5, r5, #1, 20
        mov     r5, r5, asr #13
        add     r4, r5, r4, lsl #2
        add     r6, r6, #1, 20
        mov     r6, r6, asr #13
        add     r8, r6, r8, lsl #2
        rsb     r3, r8, r12, asr #1
        str     r3, [r1, #4]
        rsb     r3, r4, lr, asr #1
        add     r12, r8, r12, asr #1
        str     r12, [r2, #-0xC]
        rsb     r4, r4, #0
        str     r3, [r1, #8]!
        sub     r4, r4, lr, asr #1
        str     r4, [r2, #-8]!
        bne     LCCE4
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}


