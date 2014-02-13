        .text
        .align  4
        .globl  _ippsHighPassFilter_G723_16s


_ippsHighPassFilter_G723_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        cmp     r0, #0
        mov     r8, r2
        beq     LDUP3
        cmp     r1, #0
        beq     LDUP3
        cmp     r8, #0
        beq     LDUP3
        ldr     r3, [r8]
        ldr     r2, [r8, #4]
        mov     r7, #0
        mov     r3, r3, lsl #15
        add     lr, r0, #2
        add     r6, r1, #2
        mvn     r5, #2, 2
        mvn     r4, #0
        mov     r12, r0
        str     r8, [sp, #4]
        str     r0, [sp]
LDUP0:
        ldrsh   r10, [r12], #4
        ldrsh   r9, [lr], #4
        rsb     r0, r3, r10, lsl #15
        bic     r3, r2, #0xFF, 8
        bic     r11, r3, #0xFF, 16
        mov     r8, r2, asr #16
        mov     r3, r9, lsl #15
        rsb     r11, r11, r11, lsl #7
        rsb     r8, r8, r8, lsl #7
        sub     r2, r3, r10, lsl #15
        mov     r9, r11, lsl #8
        mov     r10, r8, lsl #9
        mov     r9, r9, asr #15
        adds    r8, r10, r9
        mov     r9, r9, asr #31
        adc     r9, r9, r10, asr #31
        subs    r10, r8, r5
        sbcs    r11, r9, #0
        movlt   r10, #0
        movlt   r11, #0
        orrs    r11, r10, r11
        mvnne   r8, #2, 2
        bne     LDUP1
        cmp     r8, #2, 2
        sbcs    r9, r9, r4
        movlt   r8, #2, 2
LDUP1:
        add     r0, r0, r8
        bic     r8, r0, #0xFF, 8
        bic     r8, r8, #0xFF, 16
        mov     r9, r0, asr #16
        rsb     r8, r8, r8, lsl #7
        rsb     r9, r9, r9, lsl #7
        mov     r8, r8, lsl #8
        mov     r9, r9, lsl #9
        mov     r10, r8, asr #15
        adds    r8, r9, r10
        mov     r10, r10, asr #31
        adc     r9, r10, r9, asr #31
        subs    r10, r8, r5
        sbcs    r11, r9, #0
        movlt   r10, #0
        movlt   r11, #0
        orrs    r11, r10, r11
        mvnne   r8, #2, 2
        bne     LDUP2
        cmp     r8, #2, 2
        sbcs    r9, r9, r4
        movlt   r8, #2, 2
LDUP2:
        add     r0, r0, #2, 18
        add     r2, r2, r8
        mov     r0, r0, asr #16
        strh    r0, [r1], #4
        add     r0, r2, #2, 18
        add     r7, r7, #2
        mov     r0, r0, asr #16
        strh    r0, [r6], #4
        cmp     r7, #0xF0
        blt     LDUP0
        ldr     r0, [sp]
        ldr     r8, [sp, #4]
        mov     r1, #0xDE
        orr     r1, r1, #1, 24
        ldrsh   r1, [r1, +r0]
        mov     r0, #0
        str     r2, [r8, #4]
        str     r1, [r8]
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LDUP3:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}


