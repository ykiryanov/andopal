        .text
        .align  4
        .globl  _ippsLevinsonDurbin_G728_16s_Sfs


_ippsLevinsonDurbin_G728_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        ldr     r9, [sp, #0x2C]
        ldr     r8, [sp, #0x30]
        mov     r6, r0
        cmp     r6, #0
        mov     r5, r1
        mov     r4, r2
        mov     r10, r3
        beq     LDEI6
        cmp     r4, #0
        beq     LDEI6
        cmp     r10, #0
        beq     LDEI6
        cmp     r8, #0
        beq     LDEI6
        cmp     r9, #0
        beq     LDEI6
        cmp     r5, #0
        blt     LDEI7
        ldrsh   r12, [r6]
        cmp     r12, #0
        ble     LDEI7
        mov     r12, #0xF
        strh    r12, [r8]
        ldrsh   r12, [r6, #2]
        ldrsh   r1, [r6]
        mvn     r7, #2, 2
        eor     lr, r12, r12, asr #31
        sub     r12, lr, r12, asr #31
        mov     r0, r12, lsl #16
        bl      __intel_idiv
        mov     r12, #0xFF
        orr     r12, r12, #0xFF, 24
        cmp     r12, r0
        movlt   r0, r7
        blt     LDEI0
        cmn     r0, #1, 16
        movge   r0, r0, lsl #15
        movlt   r0, #2, 2
LDEI0:
        cmp     r0, r12, lsl #15
        mvn     r12, #0
        addge   lr, r12, #2, 18
        bge     LDEI1
        add     r0, r0, #2, 18
        mov     r0, r0, asr #16
        mov     r0, r0, lsl #16
        mov     lr, r0, asr #16
LDEI1:
        strh    lr, [r10]
        ldrsh   r11, [r6, #2]
        cmp     r11, #0
        ble     LDEI3
        cmn     lr, #2, 18
        addeq   lr, r12, #2, 18
        beq     LDEI2
        rsb     lr, lr, #0
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
LDEI2:
        strh    lr, [r10]
LDEI3:
        strh    lr, [r4]
        ldrsh   r11, [r6, #2]
        ldrsh   r10, [r6]
        mul     lr, r11, lr
        mov     r10, r10, lsl #16
        mov     r11, lr, lsl #1
        adds    lr, r11, r10
        mov     r10, r10, asr #31
        adc     r10, r10, r11, asr #31
        subs    r11, lr, r7
        sbcs    r0, r10, #0
        movlt   r11, #0
        movlt   r0, #0
        orrs    r0, r11, r0
        movne   lr, r7
        bne     LDEI4
        cmp     lr, #2, 2
        sbcs    r10, r10, r12
        movlt   lr, #2, 2
LDEI4:
        add     r7, r12, #1, 16
        cmp     lr, r7, lsl #15
        addge   lr, r12, #2, 18
        bge     LDEI5
        add     lr, lr, #2, 18
        mov     lr, lr, asr #16
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
LDEI5:
        strh    lr, [r9]
        str     r8, [sp, #4]
        str     r9, [sp]
        mov     r0, r6
        mov     r3, r4
        mov     r2, r5
        mov     r1, #1
        bl      _ippsLevinsonDurbin_G728_16s_ISfs
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LDEI6:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LDEI7:
        mvn     r0, #6
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}


