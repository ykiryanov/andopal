        .text
        .align  4
        .globl  lround


lround:
        stmdb   sp!, {r4 - r7, lr}
        sub     sp, sp, #0x10
        str     r0, [sp, #8]
        str     r1, [sp, #0xC]
        mvn     r3, #2, 2
        mov     r2, #0xFF
        and     r6, r1, r3
        orr     r2, r2, #7, 24
        bic     r5, r1, r3
        sub     r3, r2, #1, 22
        cmp     r3, r6, lsr #20
        mov     r4, r0
        ble     LABK2
        mov     r1, #0xFF
        orr     r1, r1, #3, 24
        sub     r3, r1, #1
        cmp     r3, r6, lsr #20
        beq     LABK0
        sub     r1, r1, #1
        cmp     r1, r6, lsr #20
        ble     LABK3
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r7, pc}
LABK0:
        cmp     r5, #2, 2
        bne     LABK1
        mvn     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r7, pc}
LABK1:
        mov     r0, #1
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r7, pc}
LABK2:
        mvn     r3, #0xE2, 12
        bic     r3, r3, #0xB, 4
        cmp     r1, r3
        mov     r3, #0xFE, 12
        orr     r3, r3, #0xF, 4
        cmpeq   r4, r3
        bcc     LABK7
        cmp     r5, #0
        beq     LABK3
        mov     r3, r2, lsl #21
        sub     r3, r3, #0x3E, 8
        cmp     r1, r3
        mov     r1, #0
        cmpeq   r4, r1
        bls     LABK7
LABK3:
        mov     r1, #2, 2
        cmp     r2, r6, lsr #20
        str     r1, [sp]
        ble     LABK5
LABK4:
        mov     r2, sp
        add     r1, sp, #8
        add     r0, sp, #8
        mov     r3, #0xBE
        bl      __libm_error_support
        b       LABK6
LABK5:
        cmp     r6, r2, lsl #20
        bne     LABK6
        cmp     r4, #0
        beq     LABK4
LABK6:
        ldr     r0, [sp]
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r7, pc}
LABK7:
        sub     r2, r2, #1, 22
        rsb     r7, r2, r6, lsr #20
        mov     r0, #0
        mov     r3, r7, asr #31
        mov     r1, #2, 14
        mov     r2, r7
        bl      __lshrdi3
        mvn     r3, #0xFF, 12
        bic     r3, r3, #0xF, 4
        and     r3, r6, r3
        orr     r3, r3, #1, 12
        adds    r0, r4, r0
        rsb     r2, r7, #0x34
        adc     r1, r3, r1
        mov     r3, r2, asr #31
        bl      __lshrdi3
        cmp     r5, #2, 2
        rsbeq   r0, r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r7, pc}


