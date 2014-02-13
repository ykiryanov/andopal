        .text
        .align  4
        .globl  _ippsHighPassFilter_G729_16s_ISfs


_ippsHighPassFilter_G729_16s_ISfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        cmp     r0, #0
        beq     LDUD11
        cmp     r3, #0
        beq     LDUD11
        cmp     r1, #0
        ble     LDUD10
        cmp     r2, #0xC
        blt     LDUD6
        cmp     r2, #0xD
        bgt     LDUD6
        ldrsh   r7, [r3, #8]
        ldrsh   r12, [r3, #0xA]
        ldr     lr, [r3]
        ldr     r10, [r3, #4]
        cmp     r1, #0
        rsb     r2, r2, #0xF
        ble     LDUD5
        mvn     r4, #0
        mvn     r6, #2, 2
        str     r4, [sp]
        str     r2, [sp, #4]
LDUD0:
        ldrsh   r4, [r3, #0x12]
        ldrsh   r8, [r3, #0x10]
        ldrsh   r9, [r3, #0xE]
        str     r4, [sp, #8]
        ldrsh   r4, [r3, #0x14]
        mvn     r2, #0
        add     r2, r2, #2, 18
        str     r4, [sp, #0xC]
        ldrsh   r4, [r3, #0x16]
        str     r12, [sp, #0x14]
        mov     r12, r7
        str     r4, [sp, #0x10]
        ldrsh   r7, [r0]
        and     r4, r2, r10, asr #1
        mul     r5, r8, r4
        and     r4, r2, lr, asr #1
        mul     r4, r9, r4
        mov     r11, r10, asr #16
        mov     r10, lr, asr #16
        bic     r5, r5, r2
        mov     r11, r11, lsl #16
        bic     r2, r4, r2
        mov     r5, r5, asr #14
        mov     r10, r10, lsl #16
        mov     r8, r8, lsl #1
        mov     r11, r11, asr #16
        mla     r4, r8, r11, r5
        mov     r2, r2, asr #14
        mov     r10, r10, asr #16
        mov     r9, r9, lsl #1
        mla     r5, r9, r10, r2
        ldr     r2, [sp, #8]
        mov     r10, lr
        ldr     lr, [sp, #0xC]
        mov     r2, r2, lsl #1
        add     r4, r5, r4
        mla     r4, r2, r7, r4
        mov     r8, lr, lsl #1
        ldr     lr, [sp, #0x10]
        ldr     r2, [sp, #0x14]
        mla     r4, r8, r12, r4
        mov     lr, lr, lsl #1
        mla     r4, lr, r2, r4
        cmn     r4, #0x1E, 4
        movgt   lr, r6
        bgt     LDUD1
        cmp     r4, #0xE, 4
        movge   lr, r4, lsl #2
        movlt   lr, #2, 2
LDUD1:
        ldr     r2, [sp, #4]
        cmp     r2, #3
        beq     LDUD7
        cmn     lr, #7, 2
        movgt   r4, r6
        bgt     LDUD2
        cmp     lr, #3, 2
        movge   r4, lr, lsl #1
        movlt   r4, #2, 2
LDUD2:
        adds    r2, r4, #2, 18
        mov     r4, r4, asr #31
        adc     r4, r4, #0
        subs    r5, r2, r6
        sbcs    r8, r4, #0
        movlt   r5, #0
        movlt   r8, #0
        orrs    r8, r5, r8
        mvnne   r2, #2, 2
        bne     LDUD3
        ldr     r5, [sp]
        cmp     r2, #2, 2
        sbcs    r4, r4, r5
        movlt   r2, #2, 2
LDUD3:
        mov     r2, r2, asr #16
LDUD4:
        strh    r2, [r0], #2
        subs    r1, r1, #1
        bne     LDUD0
LDUD5:
        mov     r0, #0
        str     lr, [r3]
        str     r10, [r3, #4]
        strh    r7, [r3, #8]
        strh    r12, [r3, #0xA]
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LDUD6:
        mvn     r0, #0xC
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LDUD7:
        cmn     lr, #7, 2
        movgt   lr, r6
        bgt     LDUD8
        cmp     lr, #3, 2
        movge   lr, lr, lsl #1
        movlt   lr, #2, 2
LDUD8:
        mov     r4, lr, asr #31
        adds    r2, lr, #2, 18
        adc     r4, r4, #0
        subs    r5, r2, r6
        sbcs    r8, r4, #0
        movlt   r5, #0
        movlt   r8, #0
        orrs    r8, r5, r8
        movne   r2, r6
        bne     LDUD9
        ldr     r5, [sp]
        cmp     r2, #2, 2
        sbcs    r4, r4, r5
        movlt   r2, #2, 2
LDUD9:
        mov     r2, r2, asr #16
        b       LDUD4
LDUD10:
        mvn     r0, #5
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LDUD11:
        mvn     r0, #7
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}


