        .text
        .align  4
        .globl  _ippsSubCRev_32s_Sfs


_ippsSubCRev_32s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        ldr     r8, [sp, #0x34]
        mov     r7, r0
        mov     r4, r1
        cmp     r8, #0x20
        mov     r0, r2
        mov     r5, r3
        ble     LATT0
        cmp     r7, #0
        beq     LATT12
        mov     r1, r5
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsZero_32s
LATT0:
        cmp     r7, #0
        beq     LATT12
        cmp     r0, #0
        beq     LATT12
        cmp     r5, #0
        ble     LATT11
        cmn     r8, #0x1F
        mvn     r11, #2, 2
        mov     r9, #0
        bgt     LATT3
        cmp     r5, #0
        ble     LATT2
LATT1:
        ldr     lr, [r7], #4
        subs    r12, r4, lr
        mov     lr, lr, asr #31
        rsc     lr, lr, r4, asr #31
        orrs    r6, r12, lr, lsl #1
        tstcs   r6, #0
        movne   r12, r11
        movne   lr, r9
        tst     lr, lr
        movmi   r12, #2, 2
        str     r12, [r0], #4
        subs    r5, r5, #1
        bne     LATT1
LATT2:
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LATT3:
        cmp     r8, #0
        mvn     r12, #0
        bne     LATT5
        cmp     r4, #0
        blt     LATT10
LATT4:
        ldr     lr, [r7], #4
        subs    r12, r4, lr
        mov     lr, lr, asr #31
        rsc     lr, lr, r4, asr #31
        cmp     r12, r11
        sbcs    lr, lr, #0
        movge   r12, r11
        add     r9, r9, #1
        str     r12, [r0], #4
        cmp     r9, r5
        blt     LATT4
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LATT5:
        cmp     r8, #0
        ble     LATT7
        sub     r12, r8, #1
        mov     lr, #1
        mov     r12, lr, lsl r12
        cmp     r5, #0
        sub     r12, r12, #1
        ble     LATT9
        mov     r6, r8, asr #31
        str     r12, [sp]
        str     r5, [sp, #8]
        str     r0, [sp, #0xC]
LATT6:
        ldr     r12, [r7], #4
        mov     r2, r8
        subs    r0, r4, r12
        mov     r12, r12, asr #31
        rsc     r1, r12, r4, asr #31
        ldr     r12, [sp]
        mov     r3, r6
        adds    r5, r12, r0
        adc     r10, r1, r12, asr #31
        bl      __ashrdi3
        and     r0, r0, #1
        adds    r0, r5, r0
        adc     r1, r10, #0
        mov     r3, r6
        mov     r2, r8
        bl      __ashrdi3
        cmp     r0, r11
        sbcs    r1, r1, #0
        movge   r0, r11
        ldr     r12, [sp, #0xC]
        add     r9, r9, #1
        str     r0, [r12], #4
        ldr     lr, [sp, #8]
        str     r12, [sp, #0xC]
        cmp     r9, lr
        blt     LATT6
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LATT7:
        cmp     r5, #0
        rsb     r6, r8, #0
        ble     LATT9
        mov     r10, r9
        str     r9, [sp, #4]
        mov     r9, r4
        mov     r8, r6, asr #31
        str     r12, [sp]
        mov     r4, r0
LATT8:
        ldr     r12, [r7], #4
        mov     r3, r8
        subs    r0, r9, r12
        mov     r12, r12, asr #31
        rsc     r1, r12, r9, asr #31
        mov     r2, r6
        bl      __ashldi3
        cmp     r0, r11
        sbcs    r12, r1, #0
        movge   r0, r11
        ldrge   r1, [sp, #4]
        ldr     lr, [sp]
        subs    r12, r0, #2, 2
        sbcs    r1, r1, lr
        movlt   r12, #0
        movlt   r1, #0
        orrs    r1, r12, r1
        moveq   r0, #2, 2
        add     r10, r10, #1
        str     r0, [r4], #4
        cmp     r10, r5
        blt     LATT8
LATT9:
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LATT10:
        ldr     r6, [r7], #4
        subs    lr, r4, r6
        mov     r6, r6, asr #31
        rsc     r8, r6, r4, asr #31
        subs    r6, lr, #2, 2
        sbcs    r8, r8, r12
        movlt   r6, #0
        movlt   r8, #0
        orrs    r8, r6, r8
        moveq   lr, #2, 2
        add     r9, r9, #1
        str     lr, [r0], #4
        cmp     r9, r5
        blt     LATT10
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LATT11:
        mvn     r0, #5
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LATT12:
        mvn     r0, #7
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}


