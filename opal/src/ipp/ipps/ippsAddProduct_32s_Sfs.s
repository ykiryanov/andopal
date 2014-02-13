        .text
        .align  4
        .globl  _ippsAddProduct_32s_Sfs


_ippsAddProduct_32s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        ldr     r8, [sp, #0x38]
        mov     r6, r0
        cmp     r6, #0
        mov     r5, r1
        mov     r4, r2
        mov     r7, r3
        beq     LDBN9
        cmp     r5, #0
        beq     LDBN9
        cmp     r4, #0
        beq     LDBN9
        cmp     r7, #0
        ble     LDBN10
        cmp     r8, #0
        mvn     r10, #2, 2
        mvn     r11, #0
        mov     r9, #0
        bne     LDBN1
        cmp     r7, #0
        ble     LDBN3
        mov     lr, r9
LDBN0:
        ldr     r0, [r5], #4
        ldr     r12, [r6], #4
        ldr     r8, [r4]
        smull   r12, r0, r12, r0
        adds    r12, r8, r12
        adc     r8, r0, r8, asr #31
        cmp     r12, r10
        sbcs    r0, r8, #0
        movge   r12, r10
        movge   r8, r9
        subs    r0, r12, #2, 2
        sbcs    r8, r8, r11
        movlt   r0, #0
        movlt   r8, #0
        orrs    r8, r0, r8
        moveq   r12, #2, 2
        add     lr, lr, #1
        str     r12, [r4], #4
        cmp     lr, r7
        blt     LDBN0
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LDBN1:
        cmp     r8, #0
        ble     LDBN5
        cmp     r8, #0x3E
        bgt     LDBN4
        sub     r2, r8, #1
        mov     r0, #1
        mov     r3, r2, asr #31
        mov     r1, #0
        bl      __ashldi3
        adds    r12, r0, r11
        adc     lr, r1, r11
        cmp     r7, #0
        ble     LDBN3
        mov     r3, r8, asr #31
        str     r7, [sp, #4]
        str     lr, [sp]
        str     r12, [sp, #8]
        str     r11, [sp, #0xC]
        str     r10, [sp, #0x10]
        mov     r7, r3
LDBN2:
        ldr     r10, [r5], #4
        ldr     lr, [r6], #4
        ldr     r12, [r4]
        smull   r10, lr, lr, r10
        mov     r2, r8
        mov     r3, r7
        adds    r10, r12, r10
        adc     r11, lr, r12, asr #31
        mov     r0, r10
        mov     r1, r11
        bl      __ashrdi3
        ldr     r12, [sp, #8]
        and     r0, r0, #1
        adds    r10, r12, r10
        ldr     r12, [sp]
        mov     r3, r7
        mov     r2, r8
        adc     r11, r12, r11
        adds    r0, r10, r0
        adc     r1, r11, #0
        bl      __ashrdi3
        ldr     r12, [sp, #0x10]
        cmp     r0, r12
        sbcs    r12, r1, #0
        ldrge   r0, [sp, #0x10]
        movge   r1, #0
        ldr     lr, [sp, #0xC]
        subs    r12, r0, #2, 2
        sbcs    r1, r1, lr
        movlt   r12, #0
        movlt   r1, #0
        orrs    r1, r12, r1
        moveq   r0, #2, 2
        str     r0, [r4], #4
        ldr     r12, [sp, #4]
        add     r9, r9, #1
        cmp     r9, r12
        blt     LDBN2
LDBN3:
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LDBN4:
        mov     r0, r4
        mov     r1, r7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsZero_16sc
LDBN5:
        cmn     r8, #0x1F
        bgt     LDBN7
        cmp     r7, #0
        ble     LDBN3
        mov     r12, r9
LDBN6:
        ldr     r11, [r5], #4
        ldr     r8, [r6], #4
        ldr     lr, [r4]
        smull   r8, r11, r8, r11
        adds    r8, lr, r8
        adc     lr, r11, lr, asr #31
        orrs    r11, r8, lr, lsl #1
        tstcs   r11, #0
        movne   r8, r10
        movne   lr, r9
        tst     lr, lr
        movmi   r8, #2, 2
        add     r12, r12, #1
        str     r8, [r4], #4
        cmp     r12, r7
        blt     LDBN6
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LDBN7:
        cmp     r7, #0
        rsb     r8, r8, #0
        ble     LDBN3
LDBN8:
        ldr     lr, [r5], #4
        ldr     r0, [r6], #4
        ldr     r12, [r4]
        smull   r0, lr, r0, lr
        adds    r0, r12, r0
        adc     r1, lr, r12, asr #31
        subs    lr, r0, #2, 2
        sbcs    r12, r1, r11
        movlt   lr, #0
        movlt   r12, #0
        orrs    r12, lr, r12
        moveq   r0, #2, 2
        moveq   r1, r11
        cmp     r0, r10
        sbcs    r12, r1, #0
        movge   r0, r10
        movge   r1, #0
        mov     r2, r8
        mov     r3, #0
        bl      __ashldi3
        subs    lr, r0, #2, 2
        sbcs    r12, r1, r11
        movlt   lr, #0
        movlt   r12, #0
        orrs    r12, lr, r12
        moveq   r0, #2, 2
        moveq   r1, r11
        cmp     r0, r10
        sbcs    r1, r1, #0
        movge   r0, r10
        add     r9, r9, #1
        str     r0, [r4], #4
        cmp     r9, r7
        blt     LDBN8
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LDBN9:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LDBN10:
        mvn     r0, #5
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}


