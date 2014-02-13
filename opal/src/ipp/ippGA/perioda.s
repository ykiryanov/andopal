        .text
        .align  4
        .globl  _ippsPeriodicityLSPE_16s
        .globl  _ippsPeriodicity_32s16s


LAAB_PERIODACODE:
LAAB__ONE_OVER_N_Q30_Table:
        .long   0x00000000
        .long   0x40000000
        .long   0x20000000
        .long   0x15555555
        .long   0x10000000
        .long   0x0ccccccc
        .long   0x0aaaaaaa
        .long   0x09249249
        .long   0x08000000
        .long   0x071c71c7
        .long   0x06666666
        .long   0x05d1745d
        .long   0x05555555
        .long   0x04ec4ec4
        .long   0x04924924
        .long   0x04444444
        .long   0x04000000
LAAB__ONE_OVER_SQRTN_Q30_Table:
        .long   0x00000000
        .long   0x40000000
        .long   0x2d413ccc
        .long   0x24f34e8b
        .long   0x20000000
        .long   0x1c9f25c5
        .long   0x1a20bd70
        .long   0x183091e6
        .long   0x16a09e66
        .long   0x15555555
        .long   0x143d1362
        .long   0x134bf63d
        .long   0x1279a745
        .long   0x11c01aa0
        .long   0x111acee5
        .long   0x108654a2
        .long   0x10000000
_ippsPeriodicityLSPE_16s:
        mov     r12, sp
        stmdb   sp!, {r0 - r3}
        stmdb   sp!, {r4 - r12, lr}
        ldr     r5, [sp, #0x3C]
        ldr     r4, [sp, #0x38]
        mov     r11, #0
        mov     r12, #0
        mov     lr, r1
        ands    r10, r1, #1
        beq     LAAB_ippsPeriodicityLSPE_16s_energy
LAAB_ippsPeriodicityLSPE_16s_energy_preStep:
        ldrsh   r6, [r0], #2
        smlal   r11, r12, r6, r6
LAAB_ippsPeriodicityLSPE_16s_energy:
        ldrsh   r6, [r0], #2
        ldrsh   r7, [r0], #2
        mov     r10, lr, asr #1
LAAB_ippsPeriodicityLSPE_16s_energy_loop:
        mul     r9, r6, r6
        ldrsh   r6, [r0], #2
        mul     r8, r7, r7
        adds    r11, r11, r9
        adc     r12, r12, #0
        ldrsh   r7, [r0], #2
        adds    r11, r11, r8
        adc     r12, r12, #0
        subs    r10, r10, #1
        bgt     LAAB_ippsPeriodicityLSPE_16s_energy_loop
        clz     r7, r12
        sub     r7, r7, #1
        rsb     r6, r7, #0x20
        mov     r11, r11, lsr r6
        orr     r9, r11, r12, lsl r7
        ldr     r0, [sp, #0x28]
        mov     r7, r6, asr #1
        sub     r7, r6, r7
        add     r7, r7, #0x1E
        sub     sp, sp, #0xA0
        str     r4, [sp, #0x90]
        str     r9, [sp, #0x88]
        mov     r11, #0
        str     r11, [sp, #0x7C]
        str     r11, [sp, #0x78]
LAAB_ippsPeriodicityLSPE_16s_period_loop:
        mov     r11, #0
        str     r11, [sp, #0x84]
        mov     r10, #0
        str     r10, [sp, #0x80]
        mov     lr, r5
        sub     lr, lr, #1
LAAB_ippsPeriodicityLSPE_16s_period_bias_loop:
        mov     r8, lr
        mov     r2, #0
        mov     r9, r8, lsl #1
        mov     r3, #0
        ldrsh   r10, [r0, +r9]
        mov     r4, #0
        ldr     r11, [pc, #0x7BC]
LAAB_ippsPeriodicityLSPE_16s_period_bias_innerLoop:
        add     r4, r4, #1
        add     r8, r8, r5
        add     r2, r2, r10
        mul     r12, r10, r10
        cmp     r8, r1
        movlt   r9, r8, lsl #1
        add     r3, r3, r12, lsr r6
        ldrltsh r10, [r0, +r9]
        blt     LAAB_ippsPeriodicityLSPE_16s_period_bias_innerLoop
        ldr     r9, [r11, +r4, lsl #2]
        ldr     r8, [pc, #0x794]
        mov     r10, r6, asr #1
        smull   r11, r12, r2, r9
        ldr     r9, [r8, +r4, lsl #2]
        add     r4, r10, #0x1E
        cmp     r4, #0x20
        blt     LAAB_ippsPeriodicityLSPE_16s_period_bias_i0_term1_sF_LT32
        sub     r4, r4, #0x20
        mov     r2, r12, asr r4
        b       LAAB_ippsPeriodicityLSPE_16s_period_bias_i0_term2
LAAB_ippsPeriodicityLSPE_16s_period_bias_i0_term1_sF_LT32:
        mov     r8, r11, lsr r4
        rsb     r4, r4, #0x20
        mov     r2, r12, lsl r4
        orr     r2, r8, r2
LAAB_ippsPeriodicityLSPE_16s_period_bias_i0_term2:
        cmp     r7, #0x20
        blt     LAAB_ippsPeriodicityLSPE_16s_period_bias_i0_term2_sF_LT32
        sub     r4, r7, #0x20
        mov     r8, r12, asr r4
        b       LAAB_ippsPeriodicityLSPE_16s_period_bias_contd
LAAB_ippsPeriodicityLSPE_16s_period_bias_i0_term2_sF_LT32:
        mov     r11, r11, lsr r7
        rsb     r4, r7, #0x20
        orr     r8, r11, r12, lsl r4
LAAB_ippsPeriodicityLSPE_16s_period_bias_contd:
        mul     r2, r8, r2
        ldr     r11, [sp, #0x84]
        ldr     r10, [sp, #0x80]
        smull   r4, r12, r3, r9
        add     r11, r11, r2
        str     r11, [sp, #0x84]
        subs    lr, lr, #1
        mov     r4, r4, lsr #30
        orr     r3, r4, r12, lsl #2
        add     r10, r10, r3
        str     r10, [sp, #0x80]
        bge     LAAB_ippsPeriodicityLSPE_16s_period_bias_loop
        ldr     r9, [sp, #0x88]
        ldr     r4, [sp, #0x90]
        subs    r3, r11, r10
        ble     LAAB_ippsPeriodicityLSPE_16s_next_period
        subs    r8, r9, r10
        ble     LAAB_ippsPeriodicityLSPE_16s_next_period
LAAB_ippsPeriodicityLSPE_16s_div32s:
        mov     r11, #2, 18
        sub     r9, r11, #1
        ldrsh   r2, [sp, #0x7C]
LAAB_ippsPeriodicityLSPE_16s_div32s_loop:
        clz     r10, r8
        subs    r12, r10, #2
        movlt   r8, r8, lsr #1
        movgt   r8, r8, lsl r12
        mov     lr, #1, 2
        mov     r11, #1
        sub     lr, lr, r8
        mov     r11, r11, lsl #1
        mov     lr, lr, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        addge   r11, r11, #1
        mov     lr, #0xF
        rsb     lr, lr, #0x3D
        smull   r8, r12, r11, r3
        sub     r10, lr, r10
        cmp     r10, #0x20
        blt     LAAB_ippsPeriodicityLSPE_16s_div32s_loop_sF_LT32
        sub     r10, r10, #0x20
        mov     r8, r12, lsr r10
        b       LAAB_ippsPeriodicityLSPE_16s_div32s_end
LAAB_ippsPeriodicityLSPE_16s_div32s_loop_sF_LT32:
        rsb     r3, r10, #0x20
        mov     r8, r8, lsr r10
        orr     r8, r8, r12, lsl r3
LAAB_ippsPeriodicityLSPE_16s_div32s_end:
        cmp     r8, r9
        movgt   r8, r9
        cmp     r8, r2
        strgt   r8, [sp, #0x7C]
        strgt   r5, [sp, #0x78]
LAAB_ippsPeriodicityLSPE_16s_next_period:
        add     r5, r5, #1
        cmp     r5, r4
        ble     LAAB_ippsPeriodicityLSPE_16s_period_loop
        ldr     r2, [sp, #0xD0]
        ldr     r4, [sp, #0x7C]
        ldr     r3, [sp, #0xD4]
        ldr     r5, [sp, #0x78]
        strh    r4, [r2]
        str     r5, [r3]
LAAB_ippsPeriodicityLSPE_16s_exit:
        add     sp, sp, #0xA0
        mov     r0, #0
        b       LAAB_ippsPeriodicityLSPE_16s_return
LAAB_ippsPeriodicityLSPE_16s_bad_arg_error:
        .long   0xe3e00004
LAAB_ippsPeriodicityLSPE_16s_return:
        ldmia   sp, {r4 - r11, sp, pc}
_ippsPeriodicity_32s16s:
        mov     r12, sp
        stmdb   sp!, {r0 - r3}
        stmdb   sp!, {r4 - r12, lr}
        ldr     r5, [sp, #0x3C]
        ldr     r4, [sp, #0x38]
        sub     sp, sp, #0xA0
        mov     r11, #0
        mov     r12, #0
        mov     r8, r0
        mov     lr, r1
        ands    r10, r1, #1
        beq     LAAB_ippsPeriodicity_32s16s_energy
LAAB_ippsPeriodicity_32s16s_energy_preStep:
        ldr     r6, [r8], #4
        mov     r11, r6
LAAB_ippsPeriodicity_32s16s_energy:
        ldr     r6, [r8], #4
        ldr     r7, [r8], #4
        mov     r10, lr, asr #1
LAAB_ippsPeriodicity_32s16s_energy_loop:
        adds    r11, r11, r6
        ldr     r6, [r8], #4
        adc     r12, r12, #0
        adds    r11, r11, r7
        ldr     r7, [r8], #4
        adc     r12, r12, #0
        subs    r10, r10, #1
        bgt     LAAB_ippsPeriodicity_32s16s_energy_loop
        clz     r7, r12
        sub     r7, r7, #1
        rsb     r6, r7, #0x20
        mov     r11, r11, lsr r6
        orrs    r9, r11, r12, lsl r7
        beq     LAAB_ippsPeriodicity_32s16s_zero_signal
        str     r4, [sp, #0x90]
        str     r9, [sp, #0x88]
        mov     r2, #0
        mov     r9, #0
        mov     r3, #0
        str     r3, [sp, #0x78]
LAAB_ippsPeriodicity_32s16s_period_loop:
        mov     lr, r5
        sub     lr, lr, #1
LAAB_ippsPeriodicity_32s16s_period_bias_loop:
        mov     r8, lr
        mov     r11, #0
        mov     r3, r8, lsl #2
        mov     r12, #0
        ldr     r10, [r0, +r3]
        mov     r7, #5
        ldr     r4, [pc, #0x35C]
LAAB_ippsPeriodicity_32s16s_period_bias_innerLoop:
        add     r8, r8, r5
        adds    r11, r11, r10
        adc     r12, r12, #0
        subs    r7, r7, #1
        blt     LAAB_ippsPeriodicity_32s16s_bias_loop_Contd
        cmp     r8, r1
        movlt   r3, r8, lsl #2
        ldrlt   r10, [r0, +r3]
        blt     LAAB_ippsPeriodicity_32s16s_period_bias_innerLoop
LAAB_ippsPeriodicity_32s16s_bias_loop_Contd:
        rsb     r7, r7, #5
        ldr     r8, [r4, +r7, lsl #2]
        umull   r7, r10, r11, r8
        smull   r4, r3, r12, r8
        mov     r10, r10, lsl #2
        orr     r7, r10, r7, lsr #30
        add     r4, r7, r4, lsl #2
        cmp     r2, r4
        bge     LAAB_ippsPeriodicity_32s16s_period_bias_contd
        mov     r2, r4
        mov     r11, r11, lsr r6
        rsb     r7, r6, #0x20
        orr     r9, r11, r12, lsl r7
        str     r5, [sp, #0x78]
LAAB_ippsPeriodicity_32s16s_period_bias_contd:
        subs    lr, lr, #1
        bge     LAAB_ippsPeriodicity_32s16s_period_bias_loop
LAAB_ippsPeriodicity_32s16s_next_period:
        ldr     r8, [sp, #0x90]
        add     r5, r5, #1
        cmp     r5, r8
        ble     LAAB_ippsPeriodicity_32s16s_period_loop
LAAB_ippsPeriodicity_32s16s_periodicity:
        ldr     r8, [sp, #0x88]
LAAB_ippsPeriodicity_32s16s_div32s:
        mov     r11, #2, 18
        sub     r4, r11, #1
        ldrsh   r2, [sp, #0x7C]
LAAB_ippsPeriodicity_32s16s_div32s_loop:
        clz     r10, r8
        subs    r12, r10, #2
        movlt   r8, r8, lsr #1
        movgt   r8, r8, lsl r12
        mov     lr, #1, 2
        mov     r11, #1
        sub     lr, lr, r8
        mov     r11, r11, lsl #1
        mov     lr, lr, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        subge   lr, lr, r8
        addge   r11, r11, #1
        mov     lr, lr, lsl #1
        mov     r11, r11, lsl #1
        cmp     lr, r8
        addge   r11, r11, #1
        mov     lr, #0xF
        rsb     lr, lr, #0x3D
        smull   r8, r12, r11, r9
        sub     r10, lr, r10
        cmp     r10, #0x20
        blt     LAAB_ippsPeriodicity_32s16s_div32s_loop_sF_LT32
        sub     r10, r10, #0x20
        mov     r8, r12, lsr r10
        b       LAAB_ippsPeriodicity_32s16s_div32s_end
LAAB_ippsPeriodicity_32s16s_div32s_loop_sF_LT32:
        rsb     r7, r10, #0x20
        mov     r8, r8, lsr r10
        orr     r8, r8, r12, lsl r7
LAAB_ippsPeriodicity_32s16s_div32s_end:
        cmp     r8, r4
        movgt   r8, r4
        ldr     r3, [sp, #0x78]
        ldr     r2, [sp, #0xD0]
        ldr     r5, [sp, #0xD4]
        strh    r8, [r2]
        str     r3, [r5]
LAAB_ippsPeriodicity_32s16s_exit:
        add     sp, sp, #0xA0
        mov     r0, #0
        b       LAAB_ippsPeriodicity_32s16s_return
LAAB_ippsPeriodicity_32s16s_zero_signal:
        mov     r0, #0
        ldr     r2, [sp, #0xD0]
        ldr     r5, [sp, #0xD4]
        strh    r0, [r2]
        str     r0, [r5]
        add     sp, sp, #0xA0
        b       LAAB_ippsPeriodicity_32s16s_return
LAAB_ippsPeriodicity_32s16s_bad_arg_error:
        .long   0xe3e00004
LAAB_ippsPeriodicity_32s16s_return:
        ldmia   sp, {r4 - r11, sp, pc}
        .long   LAAB_PERIODACODE
        .long   LAAB_PERIODACODE


