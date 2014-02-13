        .text
        .align  4
        .globl  _ippsUpdateNoisePSDMCRA_32s_I


LAAC_NSPSDUPCA:
_ippsUpdateNoisePSDMCRA_32s_I:
        stmdb   sp!, {r4 - r12, lr}
        ldr     r3, [r1, #0x1C]
        ldr     r5, [r1, #4]
        ldr     r4, [r1, #0x34]
        mov     r5, r5, lsr #1
        cmp     r3, #0
        beq     LAAC_ippsUpdateNoisePSDMCRA_32s_I_RESET_IF_SWITCH
        ldr     r6, [r1, #0x38]
        ldr     r7, [r1, #0x3C]
        ldr     r8, [r1, #0x30]
        mov     r9, #0
LAAC_ippsUpdateNoisePSDMCRA_32s_I_RESET_LOOP:
        ldr     r10, [r0], #4
        str     r9, [r8], #4
        str     r10, [r4], #4
        str     r10, [r6], #4
        str     r10, [r7], #4
        str     r10, [r2], #4
        subs    r5, r5, #1
        bge     LAAC_ippsUpdateNoisePSDMCRA_32s_I_RESET_LOOP
        b       LAAC_ippsUpdateNoisePSDMCRA_32s_I_RESET_IF_END
LAAC_ippsUpdateNoisePSDMCRA_32s_I_RESET_IF_SWITCH:
        mov     lr, r0
        ldr     r6, [r1, #0x28]
        mvn     r7, #2, 2
        sub     r7, r7, r6
        mov     r12, r5
        ldr     r8, [r4]
        ldr     r9, [lr], #4
LAAC_ippsUpdateNoisePSDMCRA_32s_I_PSD_SMOOTHING_LOOP:
        smull   r10, r11, r6, r8
        subs    r12, r12, #1
        ldrge   r8, [r4, #4]
        smlal   r10, r11, r7, r9
        ldrge   r9, [lr], #4
        mov     r10, r10, lsr #31
        mov     r11, r11, lsl #1
        orr     r11, r11, r10
        str     r11, [r4], #4
        bge     LAAC_ippsUpdateNoisePSDMCRA_32s_I_PSD_SMOOTHING_LOOP
        stmdb   sp!, {r5}
        ldr     r6, [r1, #0x18]
        ldr     r7, [r1, #0x14]
        ldr     r8, [r1, #0x34]
        ldr     r9, [r1, #0x3C]
        ldr     r10, [r1, #0x38]
        cmp     r6, r7
        bne     LAAC_ippsUpdateNoisePSDMCRA_32s_I_UPD_MINI_IF_SWITCH
LAAC_ippsUpdateNoisePSDMCRA_32s_I_UPD_MINI_LOOP_1:
        ldr     r11, [r8], #4
        ldr     lr, [r9]
        str     r11, [r9], #4
        cmp     r11, lr
        strge   lr, [r10], #4
        strlt   r11, [r10], #4
        subs    r5, r5, #1
        bge     LAAC_ippsUpdateNoisePSDMCRA_32s_I_UPD_MINI_LOOP_1
        mov     r11, #0
        str     r11, [r1, #0x18]
        b       LAAC_ippsUpdateNoisePSDMCRA_32s_I_UPD_MINI_IF_END
LAAC_ippsUpdateNoisePSDMCRA_32s_I_UPD_MINI_LOOP_2:
LAAC_ippsUpdateNoisePSDMCRA_32s_I_UPD_MINI_IF_SWITCH:
        ldr     r11, [r8], #4
        ldr     lr, [r10]
        ldr     r12, [r9]
        cmp     r11, lr
        strge   lr, [r10], #4
        strlt   r11, [r10], #4
        cmp     r11, r12
        strge   r12, [r9], #4
        strlt   r11, [r9], #4
        subs    r5, r5, #1
        bge     LAAC_ippsUpdateNoisePSDMCRA_32s_I_UPD_MINI_IF_SWITCH
LAAC_ippsUpdateNoisePSDMCRA_32s_I_UPD_MINI_IF_END:
        ldmia   sp!, {r5}
        stmdb   sp!, {r1}
        ldr     r3, [r1, #0x24]
        ldr     r4, [r1, #0x20]
        mvn     r6, #2, 2
        ldr     r7, [r1, #0x30]
        ldr     r8, [r1, #0x38]
        ldr     r9, [r1, #0x2C]
        ldr     r10, [r1, #0x34]
LAAC_ippsUpdateNoisePSDMCRA_32s_I_LAST_BIG_LOOP:
        ldr     r11, [r7]
        smull   r12, lr, r11, r3
        mov     r12, r12, lsr #31
        mov     lr, lr, lsl #1
        orr     r11, r12, lr
        ldr     r12, [r8], #4
        smull   r12, lr, r9, r12
        mov     r1, lr, lsr #15
        cmp     r1, #0
        mvngt   r1, #2, 2
        bgt     LAAC_ippsUpdateNoisePSDMCRA_32s_I_THRESHOLD_END
        mov     r12, r12, lsr #15
        mov     lr, lr, lsl #17
        orr     r1, r12, lr
        cmp     r1, #0
        mvnlt   r1, #2, 2
LAAC_ippsUpdateNoisePSDMCRA_32s_I_THRESHOLD_END:
        ldr     r12, [r10], #4
        cmp     r12, r1
        ble     LAAC_ippsUpdateNoisePSDMCRA_32s_I_THRESHOLD_IF_END
        sub     r1, r6, r3
        add     r11, r11, r1
LAAC_ippsUpdateNoisePSDMCRA_32s_I_THRESHOLD_IF_END:
        str     r11, [r7], #4
        sub     r1, r6, r4
        smull   r12, lr, r1, r11
        mov     r12, r12, lsr #31
        mov     lr, lr, lsl #1
        orr     r1, lr, r12
        add     r1, r1, r4
        ldr     r11, [r2]
        smull   r12, lr, r1, r11
        sub     r11, r6, r1
        ldr     r1, [r0], #4
        smlal   r12, lr, r1, r11
        mov     r12, r12, lsr #31
        mov     lr, lr, lsl #1
        orr     r1, r12, lr
        str     r1, [r2], #4
        subs    r5, r5, #1
        bge     LAAC_ippsUpdateNoisePSDMCRA_32s_I_LAST_BIG_LOOP
        ldmia   sp!, {r1}
LAAC_ippsUpdateNoisePSDMCRA_32s_I_RESET_IF_END:
        ldr     r4, [r1, #0x18]
        mov     r3, #0
        str     r3, [r1, #0x1C]
        add     r4, r4, #1
        str     r4, [r1, #0x18]
        mov     r0, #0
LAAC_ippsUpdateNoisePSDMCRA_32s_I_quit:
        ldmia   sp!, {r4 - r12, pc}


