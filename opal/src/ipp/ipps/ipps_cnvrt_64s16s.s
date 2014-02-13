        .text
        .align  4
        .globl  _ipps_cnvrt_64s16s


_ipps_cnvrt_64s16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        mov     r11, r3
        mvn     r12, #0xFF
        cmp     r11, #0
        bic     r6, r12, #0x7F, 24
        mov     r7, r0
        mov     r5, r1
        mov     r4, r2
        mvn     r10, #0
        mov     r8, #0
        ble     LCAB3
        sub     r2, r11, #1
        mov     r0, #1
        mov     r3, r2, asr #31
        mov     r1, #0
        bl      __ashldi3
        cmp     r4, #0
        ble     LCAB2
        mvn     r9, r6
        str     r6, [sp, #4]
        mov     r6, r5
        mov     r5, r4
        mov     r3, r11, asr #31
        mov     r4, r11
        str     r10, [sp, #8]
        mov     r11, r8
        str     r0, [sp]
        mov     r10, r1
        mov     r8, r3
LCAB0:
        ldr     r12, [r7]
        ldr     lr, [sp]
        mov     r3, r8
        mov     r2, r4
        adds    r0, lr, r12
        ldr     r12, [r7, #4]
        adc     r1, r10, r12
        bl      __ashrdi3
        subs    r12, r0, r9
        sbcs    lr, r1, #0
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        ldrne   r12, [sp, #4]
        mvnne   r0, r12
        bne     LCAB1
        mov     r12, #0
        sub     r12, r12, #2, 18
        cmp     r0, r12
        ldr     r12, [sp, #8]
        sbcs    r1, r1, r12
        movlt   r12, #0
        sublt   r0, r12, #2, 18
LCAB1:
        add     r11, r11, #1
        strh    r0, [r6], #2
        cmp     r11, r5
        add     r7, r7, #8
        blt     LCAB0
LCAB2:
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCAB3:
        cmp     r11, #0
        blt     LCAB6
        cmp     r4, #0
        ble     LCAB2
        mov     r12, r8
        mvn     r3, r6
LCAB4:
        ldr     lr, [r7]
        ldr     r9, [r7, #4]
        subs    r0, lr, r3
        sbcs    r1, r9, #0
        movlt   r0, #0
        movlt   r1, #0
        orrs    r1, r0, r1
        mvnne   lr, r6
        bne     LCAB5
        sub     r0, r8, #2, 18
        cmp     lr, r0
        sbcs    r9, r9, r10
        sublt   lr, r8, #2, 18
LCAB5:
        add     r12, r12, #1
        strh    lr, [r5], #2
        cmp     r12, r4
        add     r7, r7, #8
        blt     LCAB4
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCAB6:
        rsb     r2, r11, #0
        cmp     r2, #0x10
        movge   r10, r8
        sublt   r3, r8, #2, 18
        movlt   r10, r3, asr r2
        mvn     r3, r6
        cmp     r4, #0
        mov     r9, r3, asr r2
        ble     LCAB2
        mov     r11, r8
        str     r8, [sp, #0xC]
        mov     r8, r6
        mov     r6, r2
LCAB7:
        ldr     r0, [r7]
        ldr     r1, [r7, #4]
        subs    r3, r0, r9
        sbcs    r12, r1, r9, asr #31
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        mvnne   r0, r8
        bne     LCAB8
        cmp     r0, r10
        sbcs    r3, r1, r10, asr #31
        ldrlt   r3, [sp, #0xC]
        sublt   r0, r3, #2, 18
        blt     LCAB8
        mov     r3, r6, asr #31
        mov     r2, r6
        bl      __ashldi3
LCAB8:
        add     r11, r11, #1
        strh    r0, [r5], #2
        cmp     r11, r4
        add     r7, r7, #8
        blt     LCAB7
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}


