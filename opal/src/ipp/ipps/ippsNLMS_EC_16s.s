        .text
        .align  4
        .globl  _ippsNLMS_EC_16s


_ippsNLMS_EC_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x2C
        ldr     r4, [sp, #0x50]
        ldr     lr, [sp, #0x54]
        ldr     r12, [sp, #0x58]
        ldr     r8, [sp, #0x5C]
        cmp     r0, #0
        beq     LDKJ12
        cmp     r1, #0
        beq     LDKJ12
        cmp     r3, #0
        beq     LDKJ12
        cmp     lr, #0
        beq     LDKJ12
        cmp     r2, #0
        beq     LDKJ12
        cmp     r8, #0
        beq     LDKJ12
        cmp     r4, #0
        ble     LDKJ11
        cmp     r12, #0
        ble     LDKJ11
        ldrsh   r6, [r8]
        cmp     r4, #0
        ble     LDKJ8
        mvn     r5, #0xFF
        bic     r5, r5, #0x7F, 24
        sub     r10, r0, #2
        mvn     r9, #2, 2
        mvn     r11, #0
        mvn     r5, r5
        mov     r7, #0
        str     r11, [sp]
        str     r9, [sp, #0x28]
        str     r10, [sp, #0x24]
        str     r8, [sp, #8]
        str     r0, [sp, #0x20]
LDKJ0:
        cmp     r12, #0
        movle   r10, #0
        movle   r11, r7, lsl #1
        ble     LDKJ5
        ldr     r0, [sp, #0x20]
        str     r2, [sp, #0x18]
        str     r1, [sp, #0x1C]
        ldr     r1, [sp, #0x28]
        ldr     r2, [sp, #0x24]
        mov     r11, r7, lsl #1
        mov     r9, #0
        mov     r10, r9
        add     r0, r0, r11
        mov     r8, lr
        str     r11, [sp, #4]
        str     lr, [sp, #0xC]
        str     r4, [sp, #0x10]
        str     r3, [sp, #0x14]
LDKJ1:
        ldrsh   r3, [r8]
        sub     lr, r7, r9
        mov     lr, lr, lsl #1
        ldrsh   lr, [r2, +lr]
        mul     lr, r6, lr
        add     lr, lr, #1, 20
        add     lr, r3, lr, asr #13
        cmp     r5, lr
        blt     LDKJ2
        cmn     lr, #2, 18
        movge   r3, lr, lsl #16
        movge   r3, r3, asr #16
        movlt   r3, #0
        sublt   r3, r3, #2, 18
        b       LDKJ3
LDKJ2:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r3, r3
LDKJ3:
        rsb     r4, r9, #0
        mov     lr, r10, asr #31
        mov     r4, r4, lsl #1
        ldrsh   r4, [r0, +r4]
        mul     r4, r3, r4
        add     r4, r4, #1, 18
        mov     r4, r4, asr #15
        adds    r10, r4, r10
        adc     lr, lr, r4, asr #31
        subs    r11, r10, r1
        sbcs    r4, lr, #0
        movlt   r11, #0
        movlt   r4, #0
        orrs    r4, r11, r4
        mvnne   r10, #2, 2
        bne     LDKJ4
        ldr     r4, [sp]
        cmp     r10, #2, 2
        sbcs    lr, lr, r4
        movlt   r10, #2, 2
LDKJ4:
        add     r9, r9, #1
        strh    r3, [r8], #2
        cmp     r9, r12
        blt     LDKJ1
        ldr     r11, [sp, #4]
        ldr     lr, [sp, #0xC]
        ldr     r4, [sp, #0x10]
        ldr     r3, [sp, #0x14]
        ldr     r2, [sp, #0x18]
        ldr     r1, [sp, #0x1C]
LDKJ5:
        ldrsh   r0, [r1, +r11]
        sub     r0, r0, r10
        cmp     r5, r0
        blt     LDKJ6
        cmn     r0, #2, 18
        movge   r0, r0, lsl #16
        movge   r0, r0, asr #16
        movlt   r0, #0
        sublt   r0, r0, #2, 18
        b       LDKJ7
LDKJ6:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r0, r0
LDKJ7:
        strh    r0, [r3, +r11]
        ldr     r6, [r2], #4
        add     r7, r7, #1
        mul     r6, r0, r6
        cmp     r7, r4
        add     r0, r6, #1, 22
        mov     r6, r0, asr #11
        blt     LDKJ0
        ldr     r8, [sp, #8]
LDKJ8:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r1, r0
        cmp     r1, r6
        blt     LDKJ9
        cmn     r6, #2, 18
        movge   r6, r6, lsl #16
        movge   r0, r6, asr #16
        b       LDKJ10
LDKJ9:
        mov     r0, #0
        sub     r0, r0, #2, 18
        mvn     r0, r0
LDKJ10:
        strh    r0, [r8]
        mov     r0, #0
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LDKJ11:
        mvn     r0, #4
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LDKJ12:
        mvn     r0, #7
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}


