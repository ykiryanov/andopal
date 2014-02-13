        .text
        .align  4
        .globl  _ippsFIR_EC_16s


_ippsFIR_EC_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        ldr     lr, [sp, #0x38]
        ldr     r12, [sp, #0x3C]
        cmp     r0, #0
        beq     LDKP8
        cmp     r1, #0
        beq     LDKP8
        cmp     r2, #0
        beq     LDKP8
        cmp     lr, #0
        beq     LDKP8
        cmp     r3, #0
        ble     LDKP7
        cmp     r12, #0
        ble     LDKP7
        cmp     r3, #0
        ble     LDKP6
        mvn     r4, #0xFF
        bic     r4, r4, #0x7F, 24
        mvn     r7, #2, 2
        mvn     r4, r4
        mov     r6, #0
        mvn     r5, #0
        str     r7, [sp, #0x10]
LDKP0:
        cmp     r12, #0
        movle   r11, #0
        movle   r10, r6, lsl #1
        ble     LDKP3
        mov     r10, r6, lsl #1
        add     r8, r0, r10
        str     r0, [sp]
        ldr     r0, [sp, #0x10]
        mov     r11, #0
        mov     r9, r11
        mov     r7, lr
        str     r3, [sp, #0xC]
        str     r2, [sp, #8]
        str     r1, [sp, #4]
LDKP1:
        rsb     r1, r9, #0
        ldrsh   r2, [r7], #2
        mov     r1, r1, lsl #1
        ldrsh   r3, [r8, +r1]
        mov     r1, r11, asr #31
        mul     r2, r3, r2
        add     r2, r2, #1, 18
        mov     r2, r2, asr #15
        adds    r11, r2, r11
        adc     r1, r1, r2, asr #31
        subs    r2, r11, r0
        sbcs    r3, r1, #0
        movlt   r2, #0
        movlt   r3, #0
        orrs    r3, r2, r3
        mvnne   r11, #2, 2
        bne     LDKP2
        cmp     r11, #2, 2
        sbcs    r1, r1, r5
        movlt   r11, #2, 2
LDKP2:
        add     r9, r9, #1
        cmp     r9, r12
        blt     LDKP1
        ldr     r3, [sp, #0xC]
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LDKP3:
        ldrsh   r7, [r1, +r10]
        sub     r7, r7, r11
        cmp     r4, r7
        blt     LDKP4
        cmn     r7, #2, 18
        movge   r7, r7, lsl #16
        movge   r7, r7, asr #16
        mvnlt   r7, #0xFF
        biclt   r7, r7, #0x7F, 24
        b       LDKP5
LDKP4:
        mov     r7, #0
        sub     r7, r7, #2, 18
        mvn     r7, r7
LDKP5:
        add     r6, r6, #1
        cmp     r6, r3
        strh    r7, [r2, +r10]
        blt     LDKP0
LDKP6:
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LDKP7:
        mvn     r0, #4
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LDKP8:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}


