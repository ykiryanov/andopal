        .text
        .align  4
        .globl  _ippsShortTermSynthesisFilter_GSMFR_16s


_ippsShortTermSynthesisFilter_GSMFR_16s:
        stmdb   sp!, {r4 - r11, lr}
        ldr     r12, [sp, #0x24]
        cmp     r0, #0
        beq     LDTC5
        cmp     r1, #0
        beq     LDTC5
        cmp     r2, #0
        beq     LDTC5
        cmp     r12, #0
        beq     LDTC5
        cmp     r3, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r11, pc}
        cmp     r3, #0
        ble     LDTC4
        mov     lr, #0xFF
        orr     lr, lr, #0x7F, 24
LDTC0:
        ldrsh   r4, [r1], #2
        add     r5, r0, #0xE
        mov     r8, #7
        add     r6, r12, #0xE
        add     r7, r12, #0x10
LDTC1:
        ldrsh   r10, [r5], #-2
        ldrsh   r9, [r6], #-2
        mul     r11, r10, r9
        add     r11, r11, #1, 18
        mov     r11, r11, asr #15
        mov     r11, r11, lsl #16
        sub     r4, r4, r11, asr #16
        cmp     lr, r4
        movlt   r4, #0xFF
        orrlt   r4, r4, #0x7F, 24
        blt     LDTC2
        cmn     r4, #2, 18
        movge   r4, r4, lsl #16
        movge   r4, r4, asr #16
        bge     LDTC2
        mov     r4, #0xFF
        orr     r4, r4, #0x7F, 24
        mvn     r4, r4
LDTC2:
        mul     r10, r10, r4
        add     r10, r10, #1, 18
        mov     r10, r10, asr #15
        mov     r10, r10, lsl #16
        add     r10, r9, r10, asr #16
        cmp     lr, r10
        movlt   r9, #0xFF
        orrlt   r9, r9, #0x7F, 24
        blt     LDTC3
        cmn     r10, #2, 18
        movge   r9, r10, lsl #16
        movge   r9, r9, asr #16
        bge     LDTC3
        mov     r9, #0xFF
        orr     r9, r9, #0x7F, 24
        mvn     r9, r9
LDTC3:
        sub     r8, r8, #1
        strh    r9, [r7], #-2
        cmn     r8, #1
        bne     LDTC1
        strh    r4, [r12]
        strh    r4, [r2], #2
        subs    r3, r3, #1
        bne     LDTC0
LDTC4:
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LDTC5:
        mvn     r0, #7
        ldmia   sp!, {r4 - r11, pc}


