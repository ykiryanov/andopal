        .text
        .align  4
        .globl  nexttoward


nexttoward:
        stmdb   sp!, {r4 - r10, lr}
        sub     sp, sp, #0x18
        mov     r4, r0
        str     r0, [sp, #8]
        mov     r12, r2
        str     r2, [sp, #0x10]
        mov     r5, #0xFF, 12
        rsb     r2, r4, #0
        str     r1, [sp, #0xC]
        orr     r5, r5, #7, 4
        orr     r2, r4, r2
        rsb     lr, r12, #0
        str     r3, [sp, #0x14]
        add     r9, r5, #1
        orr     r8, r1, r2, lsr #31
        mvn     r6, #2, 2
        orr     lr, r12, lr
        and     r5, r8, r6
        orr     r7, r3, lr, lsr #31
        sub     r2, r5, r9
        and     lr, r7, r6
        sub     r9, lr, r9
        tst     r2, r9
        mov     r2, #0xFF
        orr     r2, r2, #7, 24
        bmi     LABC1
        cmp     lr, r2, lsl #20
        movgt   r1, r3
        movgt   r4, r12
        orr     r6, r1, #2, 14
LABC0:
        mov     r0, r4
        mov     r1, r6
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r10, pc}
LABC1:
        sub     r10, r4, r12
        sub     r9, r1, r3
        orrs    r10, r9, r10
        beq     LABC6
        bic     r7, r7, r6
        eor     r7, r8, r7
        cmp     r7, #2, 2
        beq     LABC5
        mov     r8, r1, asr #31
        cmp     r5, lr
        mov     r7, r8, lsl #1
        beq     LABC2
        eor     r8, r5, r8
        eor     r3, lr, r3, asr #31
        cmp     r8, r3
        add     r7, r7, #1
        rsbgt   r7, r7, #0
        b       LABC4
LABC2:
        and     lr, r1, r6
        and     r6, r3, r6
        eor     lr, lr, r8
        eor     r3, r6, r3, asr #31
        cmp     r3, lr
        eor     r12, r12, r3, asr #31
        add     r7, r7, #1
        eor     r5, r4, lr, asr #31
        blt     LABC3
        cmp     r3, lr
        bne     LABC4
        cmp     r12, r5
        bcs     LABC4
LABC3:
        rsb     r7, r7, #0
LABC4:
        adds    r4, r4, r7
        adc     r6, r1, r7, asr #31
        mov     r3, r6, lsl #1
        sub     r3, r3, #2, 12
        cmn     r3, #1, 10
        bcc     LABC0
        tst     r2, r6, asr #20
        bne     LABC7
        b       LABC0
LABC5:
        rsb     lr, lr, #0
        bic     r6, r3, r6
        mov     r4, lr, lsr #31
        b       LABC0
LABC6:
        mov     r0, r4
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r10, pc}
LABC7:
        str     r4, [sp]
        mov     r2, sp
        add     r1, sp, #0x10
        add     r0, sp, #8
        str     r6, [sp, #4]
        mov     r3, #0xC7
        bl      __libm_error_support
        ldr     r4, [sp]
        ldr     r6, [sp, #4]
        b       LABC0


