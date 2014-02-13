        .text
        .align  4
        .globl  _ippsInterpolateC_NR_G729_16s_Sfs


_ippsInterpolateC_NR_G729_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        ldr     r11, [sp, #0x34]
        ldr     r10, [sp, #0x38]
        ldr     r7, [sp, #0x3C]
        mov     r4, r0
        cmp     r4, #0
        mov     r5, r2
        beq     LDRR7
        cmp     r5, #0
        beq     LDRR7
        cmp     r11, #0
        beq     LDRR7
        cmp     r7, #0
        blt     LDRR6
        cmp     r10, #0
        ble     LDRR5
        cmp     r7, #0
        moveq   r9, #0
        beq     LDRR0
        sub     r12, r7, #1
        mov     lr, #1
        mov     r9, lr, lsl r12
LDRR0:
        cmp     r10, #0
        ble     LDRR4
        mvn     r12, #0xFF
        bic     r12, r12, #0x7F, 24
        mvn     r8, r12
        mov     lr, r9, asr #31
        mvn     r12, #0
        mov     r6, r7, asr #31
        str     r12, [sp]
        str     lr, [sp, #4]
        str     r3, [sp, #0xC]
        str     r1, [sp, #8]
LDRR1:
        ldr     r1, [sp, #8]
        ldrsh   r12, [r4], #2
        ldrsh   lr, [r5], #2
        ldr     r0, [sp, #4]
        mul     r1, r1, r12
        ldr     r12, [sp, #0xC]
        mov     r3, r6
        mul     r12, r12, lr
        adds    lr, r9, r1
        adc     r1, r0, r1, asr #31
        mov     r2, r7
        adds    r0, lr, r12
        adc     r1, r1, r12, asr #31
        bl      __ashrdi3
        subs    r12, r0, r8
        sbcs    lr, r1, #0
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        beq     LDRR2
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r1, r1
        b       LDRR3
LDRR2:
        mov     r12, #0
        sub     r12, r12, #2, 18
        cmp     r0, r12
        ldr     r12, [sp]
        sbcs    r1, r1, r12
        movge   r0, r0, lsl #16
        movge   r1, r0, asr #16
        movlt   r1, #0
        sublt   r1, r1, #2, 18
LDRR3:
        strh    r1, [r11], #2
        subs    r10, r10, #1
        bne     LDRR1
LDRR4:
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LDRR5:
        mvn     r0, #5
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LDRR6:
        mvn     r0, #0xC
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LDRR7:
        mvn     r0, #7
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}


