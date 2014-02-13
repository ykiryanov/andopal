        .text
        .align  4
        .globl  _ipps_cnvrt_64s32s


_ipps_cnvrt_64s32s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        mov     r10, r3
        cmp     r10, #0
        mov     r8, r0
        mov     r5, r1
        mov     r4, r2
        mvn     r7, #2, 2
        mvn     r11, #0
        mov     r6, #0
        ble     LCAA3
        sub     r2, r10, #1
        mov     r0, #1
        mov     r3, r2, asr #31
        mov     r1, #0
        bl      __ashldi3
        cmp     r4, #0
        ble     LCAA2
        str     r4, [sp, #8]
        mov     r9, r10, asr #31
        mov     r4, r10
        str     r11, [sp, #4]
        mov     r10, r6
        ldr     r6, [sp, #8]
        mov     r11, r7
        mov     r7, r5
        str     r1, [sp]
        mov     r5, r0
LCAA0:
        ldr     lr, [r8]
        ldr     r12, [r8, #4]
        mov     r3, r9
        adds    r0, r5, lr
        ldr     lr, [sp]
        mov     r2, r4
        adc     r1, lr, r12
        bl      __ashrdi3
        subs    lr, r0, r11
        sbcs    r12, r1, #0
        movlt   lr, #0
        movlt   r12, #0
        orrs    r12, lr, r12
        movne   r0, r11
        bne     LCAA1
        ldr     r12, [sp, #4]
        cmp     r0, #2, 2
        sbcs    r1, r1, r12
        movlt   r0, #2, 2
LCAA1:
        add     r10, r10, #1
        str     r0, [r7], #4
        cmp     r10, r6
        add     r8, r8, #8
        blt     LCAA0
LCAA2:
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LCAA3:
        cmp     r10, #0
        mov     r12, #2, 2
        blt     LCAA6
        cmp     r4, #0
        ble     LCAA2
LCAA4:
        ldr     r3, [r8]
        ldr     r12, [r8, #4]
        subs    lr, r3, r7
        sbcs    r9, r12, #0
        movlt   lr, #0
        movlt   r9, #0
        orrs    r9, lr, r9
        movne   r3, r7
        bne     LCAA5
        cmp     r3, #2, 2
        sbcs    r12, r12, r11
        movlt   r3, #2, 2
LCAA5:
        add     r6, r6, #1
        str     r3, [r5], #4
        cmp     r6, r4
        add     r8, r8, #8
        blt     LCAA4
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LCAA6:
        rsb     r9, r10, #0
        cmp     r9, #0x20
        movge   r10, r6
        movlt   r10, r12, asr r9
        cmp     r4, #0
        mov     r11, r7, asr r9
        ble     LCAA2
LCAA7:
        ldr     r0, [r8]
        ldr     r1, [r8, #4]
        subs    r3, r0, r11
        sbcs    r12, r1, r11, asr #31
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        movne   r0, r7
        bne     LCAA8
        cmp     r0, r10
        sbcs    r3, r1, r10, asr #31
        movlt   r0, #2, 2
        blt     LCAA8
        mov     r3, r9, asr #31
        mov     r2, r9
        bl      __ashldi3
LCAA8:
        add     r6, r6, #1
        str     r0, [r5], #4
        cmp     r6, r4
        add     r8, r8, #8
        blt     LCAA7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}


