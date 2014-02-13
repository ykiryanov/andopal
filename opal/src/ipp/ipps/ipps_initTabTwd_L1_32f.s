        .text
        .align  4
        .globl  _ipps_initTabTwd_L1_32f


_ipps_initTabTwd_L1_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        mov     lr, #1
        mov     r12, lr, lsl r0
        mov     r4, r12, asr #1
        sub     r0, r2, r0
        add     r4, r12, r4, lsr #30
        movs    r2, r4, asr #2
        add     r4, r2, r2, lsl #1
        mov     r5, lr, lsl r0
        add     r4, r4, #3
        add     r0, r3, r4, lsl #3
        and     lr, r0, #0x1F
        rsb     lr, lr, #0
        and     lr, lr, #0x1F
        add     r0, r0, lr
        bmi     LBYU10
        mul     r10, r5, r2
        mov     r11, #0
        mov     r4, r11
        mov     lr, r4
        mov     r8, lr
        add     r9, r3, #8
        mov     r7, r8
        sub     r6, r3, #4
        str     r0, [sp]
        str     r12, [sp, #4]
LBYU0:
        rsb     r0, r4, #0
        mla     r0, r5, r0, r10
        cmp     r8, r2
        ldr     r0, [r1, +r0, lsl #2]
        str     r0, [r3]
        ldr     r0, [r1, +lr, lsl #2]
        eor     r0, r0, #2, 2
        str     r0, [r3, #4]
        bgt     LBYU1
        rsb     r0, r8, #0
        mla     r0, r5, r0, r10
        ldr     r0, [r1, +r0, lsl #2]
        b       LBYU2
LBYU1:
        rsb     r0, r2, r8
        mul     r0, r0, r5
        ldr     r0, [r1, +r0, lsl #2]
        eor     r0, r0, #2, 2
LBYU2:
        cmp     r8, r2
        str     r0, [r9]
        mulle   r0, r5, r8
        ble     LBYU3
        ldr     r0, [sp, #4]
        mov     r12, #1
        cmp     r0, #0
        mov     r0, #0
        movlt   r0, r12
        ldr     r12, [sp, #4]
        add     r0, r12, r0
        rsb     r0, r8, r0, asr #1
        mul     r0, r0, r5
LBYU3:
        ldr     r0, [r1, +r0, lsl #2]
        cmp     r7, r2
        eor     r0, r0, #2, 2
        str     r0, [r9, #4]
        bgt     LBYU4
        sub     r0, r5, r5, lsl #2
        mla     r0, r0, r4, r10
        ldr     r0, [r1, +r0, lsl #2]
        b       LBYU6
LBYU4:
        ldr     r0, [sp, #4]
        mov     r12, #1
        cmp     r0, #0
        mov     r0, #0
        movlt   r0, r12
        ldr     r12, [sp, #4]
        add     r0, r12, r0
        cmp     r7, r0, asr #1
        bgt     LBYU5
        rsb     r0, r2, r7
        mul     r0, r0, r5
        ldr     r0, [r1, +r0, lsl #2]
        eor     r0, r0, #2, 2
        b       LBYU6
LBYU5:
        ldr     r0, [sp, #4]
        add     r0, r0, r0, lsl #1
        mov     r12, r0, asr #1
        add     r12, r0, r12, lsr #30
        add     r0, r11, r12, asr #2
        mul     r0, r0, r5
        ldr     r0, [r1, +r0, lsl #2]
        eor     r0, r0, #2, 2
LBYU6:
        cmp     r7, r2
        str     r0, [r6, #0x14]
        bgt     LBYU7
        add     r0, r5, r5, lsl #1
        mul     r0, r0, r4
        ldr     r0, [r1, +r0, lsl #2]
        eor     r0, r0, #2, 2
        b       LBYU9
LBYU7:
        ldr     r0, [sp, #4]
        mov     r12, #1
        cmp     r0, #0
        mov     r0, #0
        movlt   r0, r12
        ldr     r12, [sp, #4]
        add     r0, r12, r0
        cmp     r7, r0, asr #1
        bgt     LBYU8
        add     r0, r11, r0, asr #1
        mul     r0, r0, r5
        ldr     r0, [r1, +r0, lsl #2]
        eor     r0, r0, #2, 2
        b       LBYU9
LBYU8:
        sub     r0, r7, r0, asr #1
        mul     r0, r0, r5
        ldr     r0, [r1, +r0, lsl #2]
LBYU9:
        add     r4, r4, #1
        str     r0, [r6, #0x18]!
        cmp     r4, r2
        add     r3, r3, #0x18
        add     lr, lr, r5
        add     r8, r8, #2
        add     r7, r7, #3
        add     r9, r9, #0x18
        sub     r11, r11, #3
        ble     LBYU0
        ldr     r0, [sp]
LBYU10:
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}


