        .text
        .align  4
        .globl  ldexp


ldexp:
        stmdb   sp!, {r4 - r9, lr}
        sub     sp, sp, #0x14
        str     r0, [sp, #8]
        mov     r3, #0xFF
        orr     r3, r3, #7, 24
        str     r1, [sp, #0xC]
        str     r2, [sp, #0x10]
        mov     r4, r0
        and     r2, r3, r1, asr #20
        cmp     r3, r2
        ble     LACD4
        cmp     r2, #0
        mvn     r12, #2, 2
        bne     LACD3
        mov     lr, r1, lsl #12
        orrs    r2, lr, r4
        beq     LACD2
        cmp     lr, #0
        beq     LACD0
        clz     r2, lr
        rsb     lr, r2, #0x1F
        mov     lr, r4, lsr lr
        add     r5, r2, #1
        orr     lr, lr, r1, lsl r5
        mov     r4, r4, lsl r5
        b       LACD1
LACD0:
        clz     r2, r4
        mov     lr, r4, lsl r2
        add     r2, r2, #0x14
        mov     r4, lr, lsl #21
        mov     lr, lr, lsr #11
LACD1:
        bic     r1, r1, r12
        orr     r1, lr, r1
        rsb     r2, r2, #0
        b       LACD3
LACD2:
        mov     r0, r4
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r9, pc}
LACD3:
        ldr     lr, [sp, #0x10]
        mov     r9, #0
        add     r5, r2, lr
        cmp     r3, r5
        ble     LACD9
        cmp     r5, #0
        bicgt   r3, r1, r3, lsl #20
        orrgt   r1, r3, r5, lsl #20
        bgt     LACD5
        b       LACD6
LACD4:
        orr     r2, r4, r1, lsl #12
        rsb     r3, r2, #0
        orr     r3, r2, r3
        mov     r2, r3, lsr #12
        and     r2, r2, #2, 14
        orr     r1, r1, r2
LACD5:
        mov     r0, r4
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r9, pc}
LACD6:
        cmp     lr, #0x37
        bgt     LACD8
        cmn     r5, #0x36
        bicle   r7, r1, r12
        ble     LACD7
        mvn     r2, #0xFF, 12
        bic     r2, r2, #0xF, 4
        and     r3, r1, r2
        rsb     r2, r5, #1
        orr     r8, r3, #1, 12
        mov     r3, r2, asr #31
        bic     r7, r1, r12
        mov     r0, r4
        mov     r1, r8
        bl      __lshrdi3
        add     r2, r5, #0x3E
        mov     r9, r0
        mov     r6, r1
        mov     r0, r4
        mov     r1, r8
        mov     r3, #0
        bl      __ashldi3
        orr     r2, r0, r1, lsl #2
        rsb     r3, r2, #0
        orr     r3, r2, r3
        mov     r12, r3, lsr #31
        mov     r12, r12, lsl #1
        orr     r1, r12, r1, lsr #30
        rsb     r12, r1, #2
        adds    r9, r9, r12, lsr #31
        str     r9, [sp, #8]
        adc     r6, r6, #0
        str     r6, [sp, #0xC]
        orr     r7, r6, r7
LACD7:
        mov     r2, sp
        add     r1, sp, #0x10
        str     r9, [sp]
        add     r0, sp, #8
        str     r7, [sp, #4]
        mov     r3, #0x93
        bl      __libm_error_support
        ldr     r4, [sp]
        ldr     r1, [sp, #4]
        b       LACD5
LACD8:
        bic     r12, r1, r12
        add     r0, sp, #0x10
        str     r9, [sp]
        orr     r3, r12, r3, lsl #20
        mov     r2, sp
        str     r3, [sp, #4]
        mov     r1, r0
        add     r4, sp, #8
        mov     r0, r4
        mov     r3, #0x92
        bl      __libm_error_support
        ldr     r4, [sp]
        ldr     r1, [sp, #4]
        b       LACD5
LACD9:
        bic     r12, r1, r12
        add     r0, sp, #0x10
        str     r9, [sp]
        orr     r3, r12, r3, lsl #20
        mov     r2, sp
        str     r3, [sp, #4]
        mov     r1, r0
        add     r4, sp, #8
        mov     r0, r4
        mov     r3, #0x92
        bl      __libm_error_support
        ldr     r4, [sp]
        ldr     r1, [sp, #4]
        b       LACD5


