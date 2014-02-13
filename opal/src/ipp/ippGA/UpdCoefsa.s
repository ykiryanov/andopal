        .text
        .align  4
        .globl  _ippsCoefUpdateAECNLMS_32sc_I


LAAA_UPDCOEFSA:
_ippsCoefUpdateAECNLMS_32sc_I:
        stmdb   sp!, {r4 - r12, lr}
        ldr     r4, [sp, #0x28]
        ldr     r5, [sp, #0x2C]
        ldr     r6, [sp, #0x30]
        sub     r5, r5, #1
LAAA_ippsCoefUpdateAECNLMS_32sc_I_Len_Loop:
        add     lr, r2, r5, lsl #3
        add     r12, r0, r5, lsl #3
        ldr     r7, [lr], #4
        ldr     r8, [lr]
        ldr     r9, [r12], #4
        ldr     r10, [r12]
        mov     r11, #1, 2
        mov     r12, #0
        smlal   r11, r12, r9, r7
        mov     lr, #1, 2
        mov     r7, #0
        smlal   lr, r7, r9, r8
        mov     r11, r11, lsr #31
        mov     r12, r12, lsl #1
        orr     r8, r11, r12
        mov     lr, lr, lsr #31
        mov     r7, r7, lsl #1
        orr     r7, r7, lr
        sub     r9, r10, r6
        sub     r9, r9, #0x1F
        cmp     r9, #0
        blt     LAAA_ippsCoefUpdateAECNLMS_32sc_I_shift_switch
        stmdb   sp!, {r0 - r6}
LAAA_ippsCoefUpdateAECNLMS_32sc_I_numSegments_loop_1:
        ldr     r0, [r1]
        ldr     r2, [r3]
        ldr     r5, [sp, #0x14]
        add     r0, r0, r5, lsl #3
        add     r2, r2, r5, lsl #3
        ldr     r5, [r0]
        ldr     r6, [r0, #4]
        cmp     r6, #2, 2
        mvneq   r6, #2, 2
        rsbne   r6, r6, #0
        rsb     r10, r6, #0
        smull   r11, r12, r10, r7
        smlal   r11, r12, r5, r8
        cmp     r9, #0x20
        subge   lr, r9, #0x20
        movge   r11, r12, asr lr
        movge   r12, r12, asr #32
        bge     LAAA_ippsCoefUpdateAECNLMS_32sc_I_numSegments_loop_1_re_add
        rsb     lr, r9, #0x20
        mov     r11, r11, lsr r9
        mov     r10, r12, lsl lr
        mov     r12, r12, asr r9
        orr     r11, r11, r10
LAAA_ippsCoefUpdateAECNLMS_32sc_I_numSegments_loop_1_re_add:
        mov     lr, #0
        ldr     r10, [r2]
        cmp     r10, #0
        sublt   lr, lr, #1
        adds    r11, r11, r10
        adc     r12, r12, lr
        cmp     r12, #0
        mvngt   r11, #2, 2
        bgt     LAAA_ippsCoefUpdateAECNLMS_32sc_I_numSegments_loop_1_save_re
        cmn     r12, #1
        movlt   r11, #2, 2
        blt     LAAA_ippsCoefUpdateAECNLMS_32sc_I_numSegments_loop_1_save_re
        eors    r10, r11, r12
        bge     LAAA_ippsCoefUpdateAECNLMS_32sc_I_numSegments_loop_1_save_re
        cmp     r11, #0
        movge   r11, #2, 2
        mvnlt   r11, #2, 2
LAAA_ippsCoefUpdateAECNLMS_32sc_I_numSegments_loop_1_save_re:
        str     r11, [r2]
        smull   r11, r12, r6, r8
        smlal   r11, r12, r5, r7
        cmp     r9, #0x20
        subge   lr, r9, #0x20
        movge   r11, r12, asr lr
        movge   r12, r12, asr #32
        bge     LAAA_ippsCoefUpdateAECNLMS_32sc_I_numSegments_loop_1_im_add
        rsb     lr, r9, #0x20
        mov     r11, r11, lsr r9
        mov     r10, r12, lsl lr
        mov     r12, r12, asr r9
        orr     r11, r11, r10
LAAA_ippsCoefUpdateAECNLMS_32sc_I_numSegments_loop_1_im_add:
        mov     lr, #0
        ldr     r10, [r2, #4]
        cmp     r10, #0
        sublt   lr, lr, #1
        adds    r11, r11, r10
        adc     r12, r12, lr
        cmp     r12, #0
        mvngt   r11, #2, 2
        bgt     LAAA_ippsCoefUpdateAECNLMS_32sc_I_numSegments_loop_1_save_im
        cmn     r12, #1
        movlt   r11, #2, 2
        blt     LAAA_ippsCoefUpdateAECNLMS_32sc_I_numSegments_loop_1_save_im
        eors    r10, r11, r12
        bge     LAAA_ippsCoefUpdateAECNLMS_32sc_I_numSegments_loop_1_save_im
        cmp     r11, #0
        movge   r11, #2, 2
        mvnlt   r11, #2, 2
LAAA_ippsCoefUpdateAECNLMS_32sc_I_numSegments_loop_1_save_im:
        str     r11, [r2, #4]
        add     r1, r1, #4
        add     r3, r3, #4
        subs    r4, r4, #1
        bgt     LAAA_ippsCoefUpdateAECNLMS_32sc_I_numSegments_loop_1
        ldmia   sp!, {r0 - r6}
        b       LAAA_ippsCoefUpdateAECNLMS_32sc_I_shift_switch_end
LAAA_ippsCoefUpdateAECNLMS_32sc_I_shift_switch:
        rsb     r9, r9, #0
        mvn     lr, #2, 2
        movs    lr, lr, lsr r9
        stmdb   sp!, {r0 - r6}
LAAA_ippsCoefUpdateAECNLMS_32sc_I_numSegments_loop_2:
        ldr     r0, [r1]
        ldr     r2, [r3]
        ldr     r5, [sp, #0x14]
        add     r0, r0, r5, lsl #3
        add     r2, r2, r5, lsl #3
        ldr     r5, [r0]
        ldr     r6, [r0, #4]
        cmp     r6, #2, 2
        mvneq   r6, #2, 2
        rsbne   r6, r6, #0
        rsb     r10, r6, #0
        smull   r11, r12, r10, r7
        smlal   r11, r12, r5, r8
        cmp     r12, lr
        mvngt   r11, #2, 2
        bgt     LAAA_ippsCoefUpdateAECNLMS_32sc_I_numSegments_loop_2_save_re
        cmn     r12, lr
        movlt   r11, #2, 2
        blt     LAAA_ippsCoefUpdateAECNLMS_32sc_I_numSegments_loop_2_save_re
        rsb     r10, r9, #0x20
        mov     r12, r12, lsl r9
        mov     r10, r11, lsr r10
        mov     r11, r11, lsl r9
        orr     r12, r12, r10
        cmp     r12, #2
        mvnge   r11, #2, 2
        bge     LAAA_ippsCoefUpdateAECNLMS_32sc_I_numSegments_loop_2_save_re
        cmn     r12, #2
        movle   r11, #2, 2
        ble     LAAA_ippsCoefUpdateAECNLMS_32sc_I_numSegments_loop_2_save_re
        mov     r0, #0
        ldr     r10, [r2]
        cmp     r10, #0
        sublt   r0, r0, #1
        adds    r11, r11, r10
        adc     r12, r12, r0
        cmp     r12, #0
        mvngt   r11, #2, 2
        bgt     LAAA_ippsCoefUpdateAECNLMS_32sc_I_numSegments_loop_2_save_re
        cmn     r12, #1
        movlt   r11, #2, 2
        blt     LAAA_ippsCoefUpdateAECNLMS_32sc_I_numSegments_loop_2_save_re
        eors    r10, r11, r12
        bge     LAAA_ippsCoefUpdateAECNLMS_32sc_I_numSegments_loop_2_save_re
        cmp     r11, #0
        movge   r11, #2, 2
        mvnlt   r11, #2, 2
LAAA_ippsCoefUpdateAECNLMS_32sc_I_numSegments_loop_2_save_re:
        str     r11, [r2]
        smull   r11, r12, r6, r8
        smlal   r11, r12, r5, r7
        cmp     r12, lr
        mvngt   r11, #2, 2
        bgt     LAAA_ippsCoefUpdateAECNLMS_32sc_I_numSegments_loop_2_save_im
        cmn     r12, lr
        movlt   r11, #2, 2
        blt     LAAA_ippsCoefUpdateAECNLMS_32sc_I_numSegments_loop_2_save_im
        rsb     r10, r9, #0x20
        mov     r12, r12, lsl r9
        mov     r10, r11, lsr r10
        mov     r11, r11, lsl r9
        orr     r12, r12, r10
        cmp     r12, #2
        mvnge   r11, #2, 2
        bge     LAAA_ippsCoefUpdateAECNLMS_32sc_I_numSegments_loop_2_save_im
        cmn     r12, #2
        movle   r11, #2, 2
        ble     LAAA_ippsCoefUpdateAECNLMS_32sc_I_numSegments_loop_2_save_im
        mov     r0, #0
        ldr     r10, [r2, #4]
        cmp     r10, #0
        sublt   r0, r0, #1
        adds    r11, r11, r10
        adc     r12, r12, r0
        cmp     r12, #0
        mvngt   r11, #2, 2
        bgt     LAAA_ippsCoefUpdateAECNLMS_32sc_I_numSegments_loop_2_save_im
        cmn     r12, #1
        movlt   r11, #2, 2
        blt     LAAA_ippsCoefUpdateAECNLMS_32sc_I_numSegments_loop_2_save_im
        eors    r10, r11, r12
        bge     LAAA_ippsCoefUpdateAECNLMS_32sc_I_numSegments_loop_2_save_im
        cmp     r11, #0
        movge   r11, #2, 2
        mvnlt   r11, #2, 2
LAAA_ippsCoefUpdateAECNLMS_32sc_I_numSegments_loop_2_save_im:
        str     r11, [r2, #4]
        add     r1, r1, #4
        add     r3, r3, #4
        subs    r4, r4, #1
        bgt     LAAA_ippsCoefUpdateAECNLMS_32sc_I_numSegments_loop_2
        ldmia   sp!, {r0 - r6}
LAAA_ippsCoefUpdateAECNLMS_32sc_I_shift_switch_end:
        subs    r5, r5, #1
        bge     LAAA_ippsCoefUpdateAECNLMS_32sc_I_Len_Loop
LAAA_ippsCoefUpdateAECNLMS_32sc_I_End:
        mov     r0, #0
LAAA_ippsCoefUpdateAECNLMS_32sc_I_Quit:
        ldmia   sp!, {r4 - r12, pc}


