        .text
        .align  4
        .globl  llround


llround:
        stmdb   sp!, {r4 - r10, lr}
        sub     sp, sp, #0x10
        str     r0, [sp, #8]
        mov     r2, #0xFF
        orr     r9, r2, #3, 24
        str     r1, [sp, #0xC]
        mvn     r2, #2, 2
        and     r4, r1, r2
        bic     r8, r1, r2
        sub     r2, r9, #1
        cmp     r2, r4, lsr #20
        mov     r7, r0
        blt     LABY2
        sub     r2, r9, #1
        cmp     r2, r4, lsr #20
        beq     LABY0
        sub     r9, r9, #1
        cmp     r9, r4, lsr #20
        ble     LABY3
        mov     r0, #0
        mov     r1, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r10, pc}
LABY0:
        cmp     r8, #2, 2
        bne     LABY1
        mvn     r0, #0
        mvn     r1, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r10, pc}
LABY1:
        mov     r0, #1
        mov     r1, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r10, pc}
LABY2:
        add     r2, r9, #0x3F
        cmp     r2, r4, lsr #20
        bgt     LABY8
LABY3:
        mov     r2, #0x3E, 12
        orr     r2, r2, #3, 2
        cmp     r1, r2
        mov     r0, #0
        cmpeq   r7, r0
        mov     r5, #2, 2
        beq     LABY7
        mov     r2, #0xFF
        orr     r2, r2, #7, 24
        cmp     r2, r4, lsr #20
        ble     LABY5
LABY4:
        str     r0, [sp]
        mov     r2, sp
        add     r1, sp, #8
        add     r0, sp, #8
        str     r5, [sp, #4]
        mov     r3, #0xC1
        bl      __libm_error_support
        ldr     r0, [sp]
        ldr     r5, [sp, #4]
        b       LABY6
LABY5:
        mov     r2, #0xFF, 12
        orr     r2, r2, #7, 4
        cmp     r2, r4
        bne     LABY6
        cmp     r7, #0
        beq     LABY4
LABY6:
        mov     r1, r5
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r10, pc}
LABY7:
        mov     r0, #0
        mov     r1, #2, 2
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r10, pc}
LABY8:
        rsb     r6, r9, r4, lsr #20
        mov     r0, #0
        mov     r5, r6, asr #31
        mov     r1, #2, 14
        mov     r2, r6
        mov     r3, r5
        bl      __ashrdi3
        adds    r7, r7, r0
        mov     r0, #0xFF, 12
        orr     r0, r0, #0xF, 4
        add     r9, r9, #1, 22
        mvn     r0, r0
        mov     r10, r1
        mov     r9, r9, lsl #20
        sub     r1, r9, #2, 2
        and     r4, r4, r0
        mov     r0, #0
        mov     r2, r6
        mov     r3, r5
        orr     r4, r4, #1, 12
        adc     r10, r4, r10
        bl      __ashrdi3
        cmp     r6, #0x34
        and     r0, r7, r0
        and     r1, r10, r1
        ble     LABY9
        sub     r2, r6, #0x34
        mov     r3, r2, asr #31
        bl      __ashldi3
        b       LABY10
LABY9:
        rsb     r2, r6, #0x34
        mov     r3, r2, asr #31
        bl      __ashrdi3
LABY10:
        cmp     r8, #2, 2
        bne     LABY11
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
LABY11:
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r10, pc}


