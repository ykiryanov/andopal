        .text
        .align  4
        .globl  _ippsAddC_32s_ISfs


_ippsAddC_32s_ISfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        mov     r4, r3
        cmp     r4, #0x20
        mov     r6, r0
        mov     r7, r1
        mov     r5, r2
        bgt     LDCN11
        cmp     r7, #0
        beq     LDCN16
        cmp     r5, #0
        ble     LDCN15
        cmp     r4, #0
        mvn     r0, #2, 2
        mvn     r8, #0
        mov     r9, #0
        bne     LDCN0
        cmp     r6, #0
        bne     LDCN4
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LDCN0:
        cmn     r4, #0x1F
        bgt     LDCN3
        cmp     r5, #0
        ble     LDCN2
LDCN1:
        ldr     r12, [r7]
        adds    r3, r6, r12
        mov     r12, r12, asr #31
        adc     r12, r12, r6, asr #31
        orrs    lr, r3, r12, lsl #1
        tstcs   lr, #0
        movne   r3, r0
        movne   r12, r9
        tst     r12, r12
        movmi   r3, #2, 2
        str     r3, [r7], #4
        subs    r5, r5, #1
        bne     LDCN1
LDCN2:
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LDCN3:
        cmp     r4, #0
        bne     LDCN6
LDCN4:
        cmp     r6, #0
        ble     LDCN12
LDCN5:
        ldr     r12, [r7]
        adds    r3, r6, r12
        mov     r12, r12, asr #31
        adc     r12, r12, r6, asr #31
        cmp     r3, r0
        sbcs    r12, r12, #0
        movge   r3, r0
        add     r9, r9, #1
        str     r3, [r7], #4
        cmp     r9, r5
        blt     LDCN5
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LDCN6:
        cmp     r4, #0
        ble     LDCN13
        sub     r2, r4, #1
        mov     r0, #1
        mov     r3, r2, asr #31
        mov     r1, #0
        bl      __ashldi3
        adds    r0, r0, r8
        adc     r10, r1, r8
        cmp     r5, #5
        movlt   r11, r6, asr #31
        movlt   r8, r4, asr #31
        blt     LDCN8
        sub     r12, r5, #5
        add     r1, r7, #4
        str     r7, [sp, #0xC]
        str     r5, [sp]
        mov     r11, r6, asr #31
        mov     r8, r4, asr #31
        str     r12, [sp, #0x10]
        str     r9, [sp, #0x14]
        mov     r5, r0
        mov     r7, r1
LDCN7:
        ldr     r12, [r7, #-4]
        ldr     lr, [sp, #0x14]
        mov     r2, r4
        adds    r0, r6, r12
        adc     r1, r11, r12, asr #31
        adds    r12, r5, r0
        add     lr, lr, #4
        str     lr, [sp, #0x14]
        str     r12, [sp, #0x18]
        mov     r3, r8
        adc     r9, r10, r1
        bl      __ashrdi3
        ldr     lr, [sp, #0x18]
        and     r12, r0, #1
        adds    r0, lr, r12
        adc     r1, r9, #0
        mov     r2, r4
        mov     r3, r8
        bl      __ashrdi3
        ldr     r12, [r7]
        str     r0, [r7, #-4]
        mov     r2, r4
        mov     r3, r8
        adds    r9, r6, r12
        adc     r1, r11, r12, asr #31
        str     r1, [sp, #0x18]
        mov     r0, r9
        bl      __ashrdi3
        ldr     r12, [sp, #0x18]
        adds    r9, r5, r9
        adc     r1, r10, r12
        and     r0, r0, #1
        adds    r0, r9, r0
        adc     r1, r1, #0
        mov     r2, r4
        mov     r3, r8
        bl      __ashrdi3
        ldr     r12, [r7, #4]
        str     r0, [r7]
        adds    r9, r6, r12
        adc     r1, r11, r12, asr #31
        str     r1, [sp, #0x18]
        mov     r0, r9
        mov     r2, r4
        mov     r3, r8
        bl      __ashrdi3
        ldr     r12, [sp, #0x18]
        adds    r9, r5, r9
        adc     r1, r10, r12
        and     r0, r0, #1
        adds    r0, r9, r0
        adc     r1, r1, #0
        mov     r2, r4
        mov     r3, r8
        bl      __ashrdi3
        ldr     r12, [r7, #8]
        str     r0, [r7, #4]
        adds    r9, r6, r12
        adc     r1, r11, r12, asr #31
        str     r1, [sp, #0x18]
        mov     r0, r9
        mov     r2, r4
        mov     r3, r8
        bl      __ashrdi3
        ldr     r12, [sp, #0x18]
        adds    r9, r5, r9
        adc     r1, r10, r12
        and     r0, r0, #1
        adds    r0, r9, r0
        adc     r1, r1, #0
        mov     r2, r4
        mov     r3, r8
        bl      __ashrdi3
        ldr     lr, [sp, #0x10]
        ldr     r12, [sp, #0x14]
        str     r0, [r7, #8]
        add     r7, r7, #0x10
        cmp     r12, lr
        ble     LDCN7
        mov     r0, r5
        ldr     r7, [sp, #0xC]
        ldr     r9, [sp, #0x14]
        ldr     r5, [sp]
LDCN8:
        add     r7, r7, r9, lsl #2
        str     r11, [sp, #4]
        str     r0, [sp, #8]
        str     r5, [sp]
LDCN9:
        ldr     r1, [r7]
        ldr     r12, [sp, #4]
        add     r9, r9, #1
        adds    r0, r6, r1
        mov     r2, r4
        adc     r1, r12, r1, asr #31
        ldr     r12, [sp, #8]
        mov     r3, r8
        adds    r11, r12, r0
        adc     r5, r10, r1
        bl      __ashrdi3
        and     r0, r0, #1
        adds    r0, r11, r0
        adc     r1, r5, #0
        mov     r2, r4
        mov     r3, r8
        bl      __ashrdi3
        str     r0, [r7], #4
        ldr     r1, [sp]
        cmp     r9, r1
        blt     LDCN9
LDCN10:
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LDCN11:
        mov     r0, r7
        mov     r1, r5
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsZero_32s
LDCN12:
        ldr     r12, [r7]
        adds    r3, r6, r12
        mov     r12, r12, asr #31
        adc     lr, r12, r6, asr #31
        subs    r12, r3, #2, 2
        sbcs    lr, lr, r8
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        moveq   r3, #2, 2
        add     r9, r9, #1
        str     r3, [r7], #4
        cmp     r9, r5
        blt     LDCN12
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LDCN13:
        cmp     r4, #0
        bge     LDCN10
        cmp     r5, #0
        rsb     r4, r4, #0
        ble     LDCN10
        mov     r11, r9
        str     r9, [sp, #0x14]
        mov     r10, r4, asr #31
        mov     r9, r0
LDCN14:
        ldr     r12, [r7]
        mov     r3, r10
        mov     r2, r4
        adds    r0, r6, r12
        mov     r12, r12, asr #31
        adc     r1, r12, r6, asr #31
        bl      __ashldi3
        cmp     r0, r9
        sbcs    r12, r1, #0
        movge   r0, r9
        ldrge   r1, [sp, #0x14]
        subs    r12, r0, #2, 2
        sbcs    r1, r1, r8
        movlt   r12, #0
        movlt   r1, #0
        orrs    r1, r12, r1
        moveq   r0, #2, 2
        add     r11, r11, #1
        str     r0, [r7], #4
        cmp     r11, r5
        blt     LDCN14
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LDCN15:
        mvn     r0, #5
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LDCN16:
        mvn     r0, #7
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}


