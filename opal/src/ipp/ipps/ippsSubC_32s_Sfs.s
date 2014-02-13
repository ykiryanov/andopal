        .text
        .align  4
        .globl  _ippsSubC_32s_Sfs


_ippsSubC_32s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        ldr     r8, [sp, #0x34]
        mov     r4, r2
        mov     r6, r0
        cmp     r8, #0
        mov     r5, r1
        mov     r2, r3
        bne     LATI0
        cmp     r5, #0
        bne     LATI1
        mov     r0, r6
        mov     r1, r4
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsCopy_32s
LATI0:
        cmp     r8, #0x20
        ble     LATI1
        cmp     r6, #0
        beq     LATI13
        mov     r0, r4
        mov     r1, r2
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsZero_32s
LATI1:
        cmp     r6, #0
        beq     LATI13
        cmp     r4, #0
        beq     LATI13
        cmp     r2, #0
        ble     LATI12
        cmn     r8, #0x1F
        mvn     r10, #2, 2
        mov     r9, #0
        bgt     LATI4
        cmp     r2, #0
        ble     LATI3
LATI2:
        ldr     lr, [r6], #4
        subs    r12, lr, r5
        mov     lr, lr, asr #31
        sbc     lr, lr, r5, asr #31
        orrs    r7, r12, lr, lsl #1
        tstcs   r7, #0
        movne   r12, r10
        movne   lr, r9
        tst     lr, lr
        movmi   r12, #2, 2
        str     r12, [r4], #4
        subs    r2, r2, #1
        bne     LATI2
LATI3:
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LATI4:
        cmp     r8, #0
        mvn     r12, #0
        bne     LATI6
        cmp     r5, #0
        blt     LATI11
LATI5:
        ldr     r7, [r6], #4
        subs    lr, r7, r5
        mov     r7, r7, asr #31
        sbc     r8, r7, r5, asr #31
        subs    r7, lr, #2, 2
        sbcs    r8, r8, r12
        movlt   r7, #0
        movlt   r8, #0
        orrs    r8, r7, r8
        moveq   lr, #2, 2
        add     r9, r9, #1
        str     lr, [r4], #4
        cmp     r9, r2
        blt     LATI5
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LATI6:
        cmp     r8, #0
        ble     LATI8
        sub     r12, r8, #1
        mov     lr, #1
        mov     r12, lr, lsl r12
        cmp     r2, #0
        sub     r12, r12, #1
        ble     LATI10
        mov     r7, r8, asr #31
        str     r12, [sp]
        str     r2, [sp, #8]
LATI7:
        ldr     r12, [r6], #4
        mov     r2, r8
        subs    r0, r12, r5
        mov     r12, r12, asr #31
        mov     r3, r7
        sbc     r1, r12, r5, asr #31
        ldr     r12, [sp]
        adds    lr, r12, r0
        str     lr, [sp, #0xC]
        adc     r11, r1, r12, asr #31
        bl      __ashrdi3
        ldr     lr, [sp, #0xC]
        and     r12, r0, #1
        adds    r0, lr, r12
        adc     r1, r11, #0
        mov     r3, r7
        mov     r2, r8
        bl      __ashrdi3
        cmp     r0, r10
        sbcs    r1, r1, #0
        movge   r0, r10
        str     r0, [r4], #4
        ldr     r12, [sp, #8]
        add     r9, r9, #1
        cmp     r9, r12
        blt     LATI7
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LATI8:
        cmp     r2, #0
        rsb     r7, r8, #0
        ble     LATI10
        mov     r11, r9
        str     r9, [sp, #4]
        mov     r9, r5
        mov     r5, r4
        mov     r8, r7, asr #31
        str     r12, [sp]
        mov     r4, r2
LATI9:
        ldr     r12, [r6], #4
        mov     r3, r8
        subs    r0, r12, r9
        mov     r12, r12, asr #31
        mov     r2, r7
        sbc     r1, r12, r9, asr #31
        bl      __ashldi3
        cmp     r0, r10
        sbcs    r12, r1, #0
        movge   r0, r10
        ldrge   r1, [sp, #4]
        ldr     lr, [sp]
        subs    r12, r0, #2, 2
        sbcs    r1, r1, lr
        movlt   r12, #0
        movlt   r1, #0
        orrs    r1, r12, r1
        moveq   r0, #2, 2
        add     r11, r11, #1
        str     r0, [r5], #4
        cmp     r11, r4
        blt     LATI9
LATI10:
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LATI11:
        ldr     lr, [r6], #4
        subs    r12, lr, r5
        mov     lr, lr, asr #31
        sbc     lr, lr, r5, asr #31
        cmp     r12, r10
        sbcs    lr, lr, #0
        movge   r12, r10
        add     r9, r9, #1
        str     r12, [r4], #4
        cmp     r9, r2
        blt     LATI11
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LATI12:
        mvn     r0, #5
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LATI13:
        mvn     r0, #7
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}


