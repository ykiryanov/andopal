        .text
        .align  4
        .globl  _ippsAutoCorr_NormE_Step_NR_16s


_ippsAutoCorr_NormE_Step_NR_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        ldr     r6, [sp, #0x40]
        ldr     r9, [sp, #0x44]
        mov     r4, r0
        mov     r8, r1
        add     r10, sp, #0x18
        mov     r7, r3
        mov     r5, r2
        mov     r3, r10
        mov     r2, #0
        bl      _ippsSumSquare_NS_16s32s_Sfs
        ldr     r12, [sp, #0x18]
        mvn     r10, #3, 2
        mov     lr, #0
        cmn     r12, #7, 2
        movgt   r12, r10
        movs    r12, r12, lsl #1
        mov     r0, r12
        beq     LDWB2
        cmn     r12, #1
        moveq   r12, #2, 2
        moveq   lr, #0x1F
        beq     LDWB2
        cmp     r12, #0
        mvnlt   r0, r12
        cmp     r0, #0
        beq     LDWB1
        ldr     r10, [pc, #0x210]
        ldr     lr, [pc, #0x210]
        movs    r11, r0, lsr #16
        bne     LDWB0
        bic     r0, r0, #0xFF, 8
        bic     r11, r0, #0xFF, 16
        movs    r0, r11, asr #8
        movne   r11, r0, lsl #1
        movne   lr, r10
        moveq   r11, r11, lsl #1
        ldrsh   r11, [lr, +r11]
        add     lr, r11, #0x10
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        b       LDWB1
LDWB0:
        movs    r0, r0, lsr #24
        movne   r0, r0, lsl #1
        ldrnesh lr, [r10, +r0]
        moveq   r11, r11, lsl #1
        ldreqsh lr, [lr, +r11]
LDWB1:
        mov     r12, r12, lsl lr
LDWB2:
        str     lr, [r9]
        mvn     r9, #2, 18
        bic     r9, r9, #2, 2
        cmp     r9, r12
        movle   r12, #0xFF
        orrle   r12, r12, #0x7F, 24
        ble     LDWB3
        add     r12, r12, #2, 18
        mov     r12, r12, asr #16
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
LDWB3:
        cmp     r6, #1
        strh    r12, [r7]
        ble     LDWB10
        mvn     r12, #4
        add     r12, r8, r12
        add     r12, r12, #0
        add     lr, lr, #1
        rsb     r9, r5, r8
        rsb     r8, r5, r12
        add     r7, r7, #2
        sub     r6, r6, #1
        rsb     r11, r5, #0
        mov     r10, r5
        str     lr, [sp, #0xC]
LDWB4:
        cmp     r9, #0
        mov     r2, #0
        movle   r0, r2
        movle   r1, r0
        ble     LDWB8
        cmp     r9, #5
        blt     LDWB11
        mov     r0, r2
        add     lr, r4, r5, lsl #1
        mov     r1, r0
        mov     r12, lr
        mov     r3, r4
        str     r10, [sp, #0x14]
        str     r9, [sp, #0x10]
        str     r11, [sp, #8]
        str     r5, [sp, #4]
        str     r4, [sp]
LDWB5:
        ldrsh   r4, [r3]
        ldrsh   r11, [r12]
        ldrsh   r5, [r12, #2]
        ldrsh   r10, [r3, #2]
        ldrsh   r9, [r12, #4]
        mul     r4, r4, r11
        ldrsh   r11, [r3, #4]
        mul     r5, r10, r5
        ldrsh   r10, [r12, #6]
        mul     r9, r11, r9
        ldrsh   r11, [r3, #6]
        adds    r0, r0, r4
        adc     r4, r1, r4, asr #31
        adds    r0, r0, r5
        mul     r10, r11, r10
        adc     r5, r4, r5, asr #31
        adds    r0, r0, r9
        adc     r9, r5, r9, asr #31
        add     r2, r2, #4
        adds    r0, r0, r10
        adc     r1, r9, r10, asr #31
        cmp     r2, r8
        add     r12, r12, #8
        add     r3, r3, #8
        ble     LDWB5
        ldr     r10, [sp, #0x14]
        ldr     r9, [sp, #0x10]
        ldr     r11, [sp, #8]
        ldr     r5, [sp, #4]
        ldr     r4, [sp]
LDWB6:
        mov     r12, r2, lsl #1
        add     r3, r4, r2, lsl #1
        str     r5, [sp, #4]
        str     r4, [sp]
LDWB7:
        ldrsh   r4, [lr, +r12]
        ldrsh   r5, [r3], #2
        add     r12, r12, #2
        add     r2, r2, #1
        mul     r4, r5, r4
        adds    r0, r0, r4
        adc     r1, r1, r4, asr #31
        cmp     r2, r9
        blt     LDWB7
        ldr     r5, [sp, #4]
        ldr     r4, [sp]
LDWB8:
        ldr     r2, [sp, #0xC]
        mov     r3, #0
        bl      __ashldi3
        mvn     r3, #2, 18
        bic     r3, r3, #2, 2
        cmp     r0, r3
        sbcs    r1, r1, #0
        movge   r1, #0xFF
        orrge   r0, r1, #0x7F, 24
        bge     LDWB9
        adds    r0, r0, #2, 18
        mov     r0, r0, lsr #16
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
LDWB9:
        strh    r0, [r7], #2
        subs    r6, r6, #1
        add     r5, r5, r10
        add     r9, r9, r11
        add     r8, r8, r11
        bne     LDWB4
LDWB10:
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LDWB11:
        mov     r0, r2
        mov     r1, r0
        add     lr, r4, r5, lsl #1
        b       LDWB6
        .long   NormTable
        .long   NormTable2


