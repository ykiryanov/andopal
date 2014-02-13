        .text
        .align  4
        .globl  _ippsSub_32s_ISfs


_ippsSub_32s_ISfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        mov     r5, r3
        cmp     r5, #0x20
        mov     r7, r0
        mov     r4, r1
        ble     LASX0
        cmp     r7, #0
        beq     LASX11
        mov     r0, r4
        mov     r1, r2
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsZero_32s
LASX0:
        cmp     r7, #0
        beq     LASX11
        cmp     r4, #0
        beq     LASX11
        cmp     r2, #0
        ble     LASX10
        cmn     r5, #0x1F
        mvn     r10, #2, 2
        mov     r8, #0
        bgt     LASX3
        cmp     r2, #0
        ble     LASX2
LASX1:
        ldr     r3, [r7], #4
        ldr     lr, [r4]
        mov     r12, r3, asr #31
        subs    r3, lr, r3
        rsc     lr, r12, lr, asr #31
        orrs    r12, r3, lr, lsl #1
        tstcs   r12, #0
        movne   r3, r10
        movne   lr, r8
        tst     lr, lr
        movmi   r3, #2, 2
        str     r3, [r4], #4
        subs    r2, r2, #1
        bne     LASX1
LASX2:
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LASX3:
        cmp     r5, #0
        mvn     r9, #0
        bne     LASX5
        cmp     r2, #0
        ble     LASX9
        mov     r12, r8
LASX4:
        ldr     r3, [r7], #4
        ldr     lr, [r4]
        mov     r5, r3, asr #31
        subs    r3, lr, r3
        rsc     lr, r5, lr, asr #31
        cmp     r3, r10
        sbcs    r5, lr, #0
        movge   r3, r10
        movge   lr, r8
        subs    r5, r3, #2, 2
        sbcs    lr, lr, r9
        movlt   r5, #0
        movlt   lr, #0
        orrs    lr, r5, lr
        moveq   r3, #2, 2
        add     r12, r12, #1
        str     r3, [r4], #4
        cmp     r12, r2
        blt     LASX4
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LASX5:
        cmp     r5, #0
        ble     LASX7
        sub     r12, r5, #1
        mov     lr, #1
        mov     r12, lr, lsl r12
        cmp     r2, #0
        sub     r12, r12, #1
        ble     LASX9
        mov     r6, r5, asr #31
        str     r12, [sp, #4]
        str     r2, [sp]
LASX6:
        ldr     r12, [r4]
        ldr     r9, [r7], #4
        mov     r2, r5
        mov     r3, r6
        subs    r0, r12, r9
        mov     lr, r9, asr #31
        rsc     r1, lr, r12, asr #31
        ldr     r12, [sp, #4]
        adds    r9, r12, r0
        adc     r11, r1, r12, asr #31
        bl      __ashrdi3
        and     r0, r0, #1
        adds    r0, r9, r0
        adc     r1, r11, #0
        mov     r3, r6
        mov     r2, r5
        bl      __ashrdi3
        cmp     r0, r10
        sbcs    r1, r1, #0
        movge   r0, r10
        str     r0, [r4], #4
        ldr     r12, [sp]
        add     r8, r8, #1
        cmp     r8, r12
        blt     LASX6
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LASX7:
        cmp     r2, #0
        rsb     r5, r5, #0
        ble     LASX9
        mov     r11, r8
        str     r8, [sp, #8]
        mov     r6, r5, asr #31
        mov     r8, r2
LASX8:
        ldr     r0, [r7], #4
        ldr     lr, [r4]
        mov     r12, r0, asr #31
        mov     r3, r6
        subs    r0, lr, r0
        rsc     r1, r12, lr, asr #31
        mov     r2, r5
        bl      __ashldi3
        cmp     r0, r10
        sbcs    r12, r1, #0
        movge   r0, r10
        ldrge   r1, [sp, #8]
        subs    r12, r0, #2, 2
        sbcs    r1, r1, r9
        movlt   r12, #0
        movlt   r1, #0
        orrs    r1, r12, r1
        moveq   r0, #2, 2
        add     r11, r11, #1
        str     r0, [r4], #4
        cmp     r11, r8
        blt     LASX8
LASX9:
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LASX10:
        mvn     r0, #5
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LASX11:
        mvn     r0, #7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}


