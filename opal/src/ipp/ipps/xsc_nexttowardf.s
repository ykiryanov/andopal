        .text
        .align  4
        .globl  nexttowardf


nexttowardf:
        stmdb   sp!, {r4 - r7, lr}
        sub     sp, sp, #0x10
        str     r1, [sp, #8]
        mov     r12, #0xFF
        orr     r5, r12, #7, 24
        mov     r3, r0
        str     r2, [sp, #0xC]
        mov     r12, r3, asr #23
        and     r4, r12, #0xFF
        and     lr, r5, r2, asr #20
        sub     r12, r4, #0xFF
        sub     r6, lr, r5
        and     r12, r12, r6
        mov     r6, r3, lsl #1
        tst     r6, r12, asr #31
        mov     r12, #0xFE, 10
        str     r0, [sp, #4]
        orr     r12, r12, #1, 2
        beq     LABB2
        cmp     r4, #0
        mov     r5, r3, lsl #9
        movne   r6, #0
        bne     LABB0
        ldr     r3, [sp, #4]
        clz     r6, r5
        str     r5, [sp]
        mov     r5, r5, lsl #1
LABB0:
        add     r4, r4, #0xE, 26
        sub     r7, r4, r6
        mov     r4, r3, asr #31
        eor     lr, lr, r2, asr #31
        eor     r7, r7, r4
        cmp     lr, r7
        bne     LABB1
        mov     lr, r1, lsl #11
        mov     r1, r1, lsr #20
        mov     lr, lr, lsr #1
        rsb     lr, lr, #0
        orr     r1, r1, r2, lsl #12
        mov     r6, r5, lsl r6
        orr     lr, r1, lr, lsr #30
        cmp     lr, r6
        beq     LABB11
        mov     r1, lr, lsr #1
        eor     lr, r1, r2, asr #31
        eor     r7, r4, r6, lsr #1
LABB1:
        mov     r4, r4, lsl #1
        cmp     r7, lr
        add     r4, r4, #1
        rsbgt   r4, r4, #0
        add     r3, r3, r4
        mov     r1, r3, lsl #1
        sub     r1, r1, #1, 8
        cmp     r1, #0xFE, 8
        bcc     LABB5
        tst     r3, r12
        bne     LABB8
        b       LABB5
LABB2:
        cmp     r5, lr
        mvn     lr, #2, 2
        beq     LABB10
LABB3:
        cmp     r6, #0xFF, 8
        bhi     LABB7
        mov     r4, r2, lsl #1
        cmp     r4, #0xFF, 8
        bhi     LABB6
        cmp     r6, #0
        bne     LABB4
        orrs    r4, r1, r4
        bic     r3, r2, lr
        beq     LABB5
        orr     r3, r3, #1
        mov     r0, r3
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r7, pc}
LABB4:
        cmp     r2, r3
        beq     LABB5
        and     r4, r3, lr
        mov     r1, r3, asr #31
        and     lr, r2, lr
        eor     r4, r4, r1
        eor     r2, lr, r2, asr #31
        mov     r1, r1, lsl #1
        cmp     r4, r2
        add     r1, r1, #1
        rsbgt   r1, r1, #0
        add     r3, r3, r1
        and     r1, r3, r12
        cmp     r12, r1
        beq     LABB9
LABB5:
        mov     r0, r3
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r7, pc}
LABB6:
        orr     r0, r2, #1, 10
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r7, pc}
LABB7:
        orr     r0, r3, #1, 10
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r7, pc}
LABB8:
        mov     r2, sp
        add     r1, sp, #8
        add     r0, sp, #4
        str     r3, [sp]
        mov     r3, #0xC8
        bl      __libm_error_support
        ldr     r3, [sp]
        mov     r0, r3
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r7, pc}
LABB9:
        mov     r2, sp
        add     r1, sp, #8
        add     r0, sp, #4
        str     r3, [sp]
        mov     r3, #0xC8
        bl      __libm_error_support
        ldr     r3, [sp]
        mov     r0, r3
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r7, pc}
LABB10:
        mov     r5, r1, lsl #3
        mov     r4, r1, lsr #20
        mov     r5, r5, lsr #1
        orr     r4, r4, r2, lsl #12
        rsb     r5, r5, #0
        mov     r4, r4, lsr #9
        orr     r5, r4, r5, lsr #31
        bic     r2, r2, lr
        orr     r5, r5, r12
        orr     r2, r2, r5
        b       LABB3
LABB11:
        mov     r0, r3
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r7, pc}


