        .text
        .align  4
        .globl  ownSignalLevel_GSMAMR_16s


ownSignalLevel_GSMAMR_16s:
        stmdb   sp!, {r4 - r11, lr}
        ldr     r6, [sp, #0x24]
        ldr     r5, [sp, #0x28]
        ldr     r4, [sp, #0x2C]
        ldr     lr, [sp, #0x30]
        ldr     r12, [sp, #0x34]
        cmp     r2, r3
        mov     r7, #0
        mov     r10, r2
        bge     LDOE2
        mul     r8, r10, r6
        add     r9, r0, r5, lsl #1
LDOE0:
        mov     r11, r8, lsl #1
        ldrsh   r11, [r9, +r11]
        cmp     r11, #0
        bge     LDOE1
        cmn     r11, #2, 18
        mvneq   r11, #0
        addeq   r11, r11, #2, 18
        beq     LDOE1
        rsb     r11, r11, #0
        mov     r11, r11, lsl #16
        mov     r11, r11, asr #16
LDOE1:
        add     r10, r10, #1
        cmp     r10, r3
        add     r7, r7, r11
        add     r8, r8, r6
        blt     LDOE0
LDOE2:
        ldrsh   r9, [r1]
        cmp     r4, #0x10
        mov     r3, r7, lsl #1
        mvn     r8, #2, 2
        bge     LDOE4
        rsb     r7, r4, #0x10
        bic     r7, r7, #0xFF, 8
        bic     r7, r7, #0xFF, 16
        cmp     r9, r8, asr r7
        mov     r10, #2, 2
        bgt     LDOE3
        cmp     r9, r10, asr r7
        movge   r8, r9, lsl r7
        movlt   r8, #2, 2
LDOE3:
        adds    r7, r3, r8
        mov     r8, r8, asr #31
        adc     r8, r8, r3, asr #31
        mvn     r9, #2, 2
        subs    r10, r7, r9
        sbcs    r11, r8, #0
        movlt   r10, #0
        movlt   r11, #0
        orrs    r11, r10, r11
        movne   r7, r9
        bne     LDOE5
        cmp     r7, #2, 2
        mvn     r9, #0
        sbcs    r8, r8, r9
        movlt   r7, #2, 2
        b       LDOE5
LDOE4:
        sub     r7, r4, #0x10
        mov     r9, r9, asr r7
        adds    r7, r3, r9
        mov     r9, r9, asr #31
        adc     r9, r9, r3, asr #31
        subs    r10, r7, r8
        sbcs    r11, r9, #0
        movlt   r10, #0
        movlt   r11, #0
        orrs    r11, r10, r11
        movne   r7, r8
        bne     LDOE5
        cmp     r7, #2, 2
        mvn     r8, #0
        sbcs    r9, r9, r8
        movlt   r7, #2, 2
LDOE5:
        cmp     r2, #0
        ble     LDOE8
        add     r5, r0, r5, lsl #1
        mov     r0, #0
LDOE6:
        mov     r8, r0, lsl #1
        ldrsh   r8, [r5, +r8]
        cmp     r8, #0
        bge     LDOE7
        cmn     r8, #2, 18
        mvneq   r8, #0
        addeq   r8, r8, #2, 18
        beq     LDOE7
        rsb     r8, r8, #0
        mov     r8, r8, lsl #16
        mov     r8, r8, asr #16
LDOE7:
        subs    r2, r2, #1
        add     r7, r7, r8, lsl #1
        add     r0, r0, r6
        bne     LDOE6
LDOE8:
        cmp     lr, #0
        mvn     r2, #2, 2
        mov     r5, #2, 2
        beq     LDOE11
        sub     r0, r4, #4
        bic     r0, r0, #0xFF, 8
        bic     r0, r0, #0xFF, 16
        cmp     r7, r2, asr r0
        movgt   r0, r2
        bgt     LDOE9
        cmp     r7, r5, asr r0
        movge   r0, r7, lsl r0
        movlt   r0, #2, 2
LDOE9:
        ldr     r6, [pc, #0x98]
        mov     r12, r12, lsl #1
        ldrsh   r12, [r6, +r12]
        mvn     r6, #0
        add     r6, r6, #2, 18
        and     r6, r6, r0, asr #1
        mul     r6, r6, r12
        mov     r0, r0, asr #16
        mov     r0, r0, lsl #16
        mov     r6, r6, asr #15
        mov     r0, r0, asr #16
        mla     r6, r0, r12, r6
        mov     r0, r6, lsl #1
        cmn     r0, #0x1E, 4
        movgt   r6, r2
        bgt     LDOE10
        cmp     r0, #0xE, 4
        movge   r6, r6, lsl #3
        movlt   r6, #2, 2
LDOE10:
        mov     r6, r6, asr #16
        strh    r6, [lr]
LDOE11:
        bic     r4, r4, #0xFF, 8
        bic     r0, r4, #0xFF, 16
        cmp     r3, r2, asr r0
        movgt   r3, r2
        bgt     LDOE12
        cmp     r3, r5, asr r0
        movge   r3, r3, lsl r0
        movlt   r3, #2, 2
LDOE12:
        mov     r3, r3, asr #16
        cmp     r7, r2, asr r0
        strh    r3, [r1]
        bgt     LDOE13
        cmp     r7, r5, asr r0
        movge   r2, r7, lsl r0
        movlt   r2, #2, 2
LDOE13:
        mov     r2, r2, asr #16
        mov     r2, r2, lsl #16
        mov     r0, r2, asr #16
        ldmia   sp!, {r4 - r11, pc}
        .long   Bw_inv_AMRWBE


