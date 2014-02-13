        .text
        .align  4
        .globl  _ippsSub_32s_Sfs


_ippsSub_32s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        ldr     r5, [sp, #0x34]
        mov     r7, r0
        mov     r6, r1
        cmp     r5, #0x20
        mov     r4, r2
        ble     LASW0
        cmp     r7, #0
        beq     LASW10
        cmp     r6, #0
        beq     LASW10
        mov     r0, r4
        mov     r1, r3
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsZero_32s
LASW0:
        cmp     r7, #0
        beq     LASW10
        cmp     r6, #0
        beq     LASW10
        cmp     r4, #0
        beq     LASW10
        cmp     r3, #0
        ble     LASW11
        cmn     r5, #0x1F
        mvn     r10, #2, 2
        mov     r8, #0
        bgt     LASW3
        cmp     r3, #0
        ble     LASW2
LASW1:
        ldr     r12, [r7], #4
        ldr     r5, [r6], #4
        mov     lr, r12, asr #31
        subs    r12, r5, r12
        rsc     r5, lr, r5, asr #31
        orrs    lr, r12, r5, lsl #1
        tstcs   lr, #0
        movne   r12, r10
        movne   r5, r8
        tst     r5, r5
        movmi   r12, #2, 2
        str     r12, [r4], #4
        subs    r3, r3, #1
        bne     LASW1
LASW2:
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LASW3:
        cmp     r5, #0
        mvn     r9, #0
        bne     LASW5
        cmp     r3, #0
        ble     LASW9
        mov     lr, r8
LASW4:
        ldr     r12, [r7], #4
        ldr     r11, [r6], #4
        mov     r5, r12, asr #31
        subs    r12, r11, r12
        rsc     r5, r5, r11, asr #31
        cmp     r12, r10
        sbcs    r11, r5, #0
        movge   r12, r10
        movge   r5, r8
        subs    r11, r12, #2, 2
        sbcs    r5, r5, r9
        movlt   r11, #0
        movlt   r5, #0
        orrs    r5, r11, r5
        moveq   r12, #2, 2
        add     lr, lr, #1
        str     r12, [r4], #4
        cmp     lr, r3
        blt     LASW4
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LASW5:
        cmp     r5, #0
        ble     LASW7
        sub     r12, r5, #1
        mov     lr, #1
        mov     r12, lr, lsl r12
        cmp     r3, #0
        sub     r12, r12, #1
        ble     LASW9
        mov     r9, r5, asr #31
        str     r12, [sp, #4]
        str     r3, [sp]
LASW6:
        ldr     r11, [r7], #4
        ldr     lr, [r6], #4
        mov     r12, r11, asr #31
        subs    r0, lr, r11
        rsc     r1, r12, lr, asr #31
        ldr     r12, [sp, #4]
        mov     r2, r5
        mov     r3, r9
        adds    lr, r12, r0
        str     lr, [sp, #0xC]
        adc     r11, r1, r12, asr #31
        bl      __ashrdi3
        ldr     lr, [sp, #0xC]
        and     r12, r0, #1
        adds    r0, lr, r12
        adc     r1, r11, #0
        mov     r3, r9
        mov     r2, r5
        bl      __ashrdi3
        cmp     r0, r10
        sbcs    r1, r1, #0
        movge   r0, r10
        str     r0, [r4], #4
        ldr     r12, [sp]
        add     r8, r8, #1
        cmp     r8, r12
        blt     LASW6
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LASW7:
        cmp     r3, #0
        rsb     r5, r5, #0
        ble     LASW9
        mov     r11, r8
        str     r8, [sp, #8]
        mov     r12, r5, asr #31
        mov     r8, r4
        str     r12, [sp, #4]
        mov     r4, r3
LASW8:
        ldr     lr, [r7], #4
        ldr     r12, [r6], #4
        ldr     r3, [sp, #4]
        subs    r0, r12, lr
        mov     lr, lr, asr #31
        rsc     r1, lr, r12, asr #31
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
        str     r0, [r8], #4
        cmp     r11, r4
        blt     LASW8
LASW9:
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LASW10:
        mvn     r0, #7
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LASW11:
        mvn     r0, #5
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}


