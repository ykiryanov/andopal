        .text
        .align  4
        .globl  _ippsMaxOrder_16s


_ippsMaxOrder_16s:
        stmdb   sp!, {r4 - r11, lr}
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r11, pc}
        cmp     r0, #0
        beq     LBIF5
        cmp     r2, #0
        beq     LBIF5
        cmp     r1, #6
        mov     r5, #0
        movlt   r3, r5
        movlt   r12, r3
        blt     LBIF1
        mov     r3, r5
        mov     r12, r3
        sub     r4, r1, #6
        mov     lr, r0
LBIF0:
        ldrsh   r11, [lr]
        ldrsh   r6, [lr, #2]
        ldrsh   r7, [lr, #4]
        ldrsh   r8, [lr, #6]
        ldrsh   r9, [lr, #8]
        eor     r10, r11, r11, asr #31
        add     r12, r12, #5
        cmp     r12, r4
        sub     r10, r10, r11, asr #31
        orr     r3, r3, r10
        eor     r10, r6, r6, asr #31
        add     lr, lr, #0xA
        sub     r10, r10, r6, asr #31
        eor     r6, r7, r7, asr #31
        orr     r3, r3, r10
        sub     r6, r6, r7, asr #31
        orr     r3, r3, r6
        eor     r6, r8, r8, asr #31
        sub     r6, r6, r8, asr #31
        orr     r3, r3, r6
        eor     r6, r9, r9, asr #31
        sub     r6, r6, r9, asr #31
        orr     r6, r3, r6
        mov     r3, r6, lsl #16
        mov     r3, r3, asr #16
        ble     LBIF0
LBIF1:
        add     r0, r0, r12, lsl #1
LBIF2:
        ldrsh   lr, [r0], #2
        add     r12, r12, #1
        eor     r4, lr, lr, asr #31
        cmp     r12, r1
        sub     r4, r4, lr, asr #31
        orr     r4, r3, r4
        mov     r3, r4, lsl #16
        mov     r3, r3, asr #16
        blt     LBIF2
        cmp     r3, #0
        streq   r5, [r2]
        bne     LBIF3
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LBIF3:
        mov     r0, #8
LBIF4:
        mov     r1, r3, asr r0
        mov     r1, r1, lsl #16
        movs    r1, r1, asr #16
        movne   r3, r1
        addne   r5, r0, r5
        movs    r0, r0, asr #1
        bne     LBIF4
        add     r5, r5, #1
        str     r5, [r2]
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LBIF5:
        mvn     r0, #7
        ldmia   sp!, {r4 - r11, pc}


