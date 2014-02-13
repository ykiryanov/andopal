        .text
        .align  4
        .globl  _ippsFilterAECNLMS_32sc_Sfs


LAAG_FLTNLMSA:
_ippsFilterAECNLMS_32sc_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        ldr     r4, [sp, #0x24]
        ldr     r5, [sp, #0x28]
        cmp     r5, #0
        blt     LAAG_ippsFilterAECNLMS_32sc_Sfs_IF_ELSE
        sub     r4, r4, #1
        mov     r4, r4, lsl #3
LAAG_ippsFilterAECNLMS_32sc_Sfs_1_To_LEN_element_loop_1:
        stmdb   sp!, {r2, r3, r5}
        mov     r6, #0
        mov     r7, #0
        mov     r12, #0
        mov     lr, #0
        sub     r3, r3, #1
        mov     r3, r3, lsl #2
LAAG_ippsFilterAECNLMS_32sc_Sfs_numSegments_loop_1:
        ldr     r8, [r0, +r3]
        ldr     r9, [r1, +r3]
        add     r8, r8, r4
        add     r9, r9, r4
        ldr     r10, [r8], #4
        ldr     r11, [r9], #4
        ldr     r8, [r8]
        ldr     r9, [r9]
        smull   r2, r5, r8, r11
        smlal   r2, r5, r9, r10
        cmp     r5, #2, 2
        mvneq   r5, #2, 2
        mvneq   r2, #0
        cmp     lr, #0
        blt     LAAG_ippsFilterAECNLMS_32sc_Sfs_numSegments_loop_1_im_if_switch
        adds    r12, r12, r2
        adcs    lr, lr, r5
        mvnvs   lr, #2, 2
        mvnvs   r12, #0
        b       LAAG_ippsFilterAECNLMS_32sc_Sfs_numSegments_loop_1_im_if_End
LAAG_ippsFilterAECNLMS_32sc_Sfs_numSegments_loop_1_im_if_switch:
        adds    r12, r12, r2
        adcs    lr, lr, r5
        movvs   lr, #2, 2
        movvs   r12, #0
LAAG_ippsFilterAECNLMS_32sc_Sfs_numSegments_loop_1_im_if_End:
        smull   r2, r5, r10, r11
        smull   r10, r11, r8, r9
        subs    r2, r2, r10
        sbc     r5, r5, r11
        cmp     r7, #0
        blt     LAAG_ippsFilterAECNLMS_32sc_Sfs_numSegments_loop_1_re_if_switch
        adds    r6, r6, r2
        adcs    r7, r7, r5
        mvnvs   r7, #2, 2
        mvnvs   r6, #0
        b       LAAG_ippsFilterAECNLMS_32sc_Sfs_numSegments_loop_1_re_if_End
LAAG_ippsFilterAECNLMS_32sc_Sfs_numSegments_loop_1_re_if_switch:
        adds    r6, r6, r2
        adcs    r7, r7, r5
        movvs   r7, #2, 2
        movvs   r6, #0
LAAG_ippsFilterAECNLMS_32sc_Sfs_numSegments_loop_1_re_if_End:
        subs    r3, r3, #4
        bge     LAAG_ippsFilterAECNLMS_32sc_Sfs_numSegments_loop_1
        ldmia   sp!, {r2, r3, r5}
        mov     r8, r7
        mov     r9, r7, asr r5
        cmp     r9, #0
        mvngt   r9, #2, 2
        strgt   r9, [r2, +r4]
        bgt     LAAG_ippsFilterAECNLMS_32sc_Sfs_indexVec_element_re_end
        cmnlt   r9, #1
        blt     LAAG_ippsFilterAECNLMS_32sc_Sfs_indexVec_element_re_NEG_MAX
        rsb     r10, r5, #0x20
        mov     r6, r6, lsr r5
        mov     r7, r7, lsl r10
        orr     r7, r7, r6
        eors    r8, r7, r8
        strge   r7, [r2, +r4]
        bge     LAAG_ippsFilterAECNLMS_32sc_Sfs_indexVec_element_re_end
        cmp     r7, #0
        bge     LAAG_ippsFilterAECNLMS_32sc_Sfs_indexVec_element_re_NEG_MAX
        mvn     r8, #2, 2
        str     r8, [r2, +r4]
        b       LAAG_ippsFilterAECNLMS_32sc_Sfs_indexVec_element_re_end
LAAG_ippsFilterAECNLMS_32sc_Sfs_indexVec_element_re_NEG_MAX:
        mov     r8, #2, 2
        str     r8, [r2, +r4]
LAAG_ippsFilterAECNLMS_32sc_Sfs_indexVec_element_re_end:
        add     r4, r4, #4
        mov     r8, lr
        mov     r9, lr, asr r5
        cmp     r9, #0
        mvngt   r9, #2, 2
        strgt   r9, [r2, +r4]
        bgt     LAAG_ippsFilterAECNLMS_32sc_Sfs_indexVec_element_im_end
        cmnlt   r9, #1
        blt     LAAG_ippsFilterAECNLMS_32sc_Sfs_indexVec_element_im_NEG_MAX
        rsb     r10, r5, #0x20
        mov     r12, r12, lsr r5
        mov     lr, lr, lsl r10
        orr     lr, r12, lr
        eors    r8, lr, r8
        strge   lr, [r2, +r4]
        bge     LAAG_ippsFilterAECNLMS_32sc_Sfs_indexVec_element_im_end
        cmp     lr, #0
        bge     LAAG_ippsFilterAECNLMS_32sc_Sfs_indexVec_element_im_NEG_MAX
        mvn     r8, #2, 2
        str     r8, [r2, +r4]
        b       LAAG_ippsFilterAECNLMS_32sc_Sfs_indexVec_element_im_end
LAAG_ippsFilterAECNLMS_32sc_Sfs_indexVec_element_im_NEG_MAX:
        mov     r8, #2, 2
        str     r8, [r2, +r4]
LAAG_ippsFilterAECNLMS_32sc_Sfs_indexVec_element_im_end:
        subs    r4, r4, #0xC
        bge     LAAG_ippsFilterAECNLMS_32sc_Sfs_1_To_LEN_element_loop_1
        b       LAAG_ippsFilterAECNLMS_32sc_Sfs_IF_END
LAAG_ippsFilterAECNLMS_32sc_Sfs_IF_ELSE:
        rsb     r5, r5, #0
        sub     r4, r4, #1
        mov     r4, r4, lsl #3
LAAG_ippsFilterAECNLMS_32sc_Sfs_1_To_LEN_element_loop_2:
        stmdb   sp!, {r2, r3, r5}
        mov     r6, #0
        mov     r7, #0
        mov     r12, #0
        mov     lr, #0
        mov     r3, r3, lsl #2
        stmdb   sp!, {r3}
        mov     r3, #0
LAAG_ippsFilterAECNLMS_32sc_Sfs_numSegments_loop_2:
        ldr     r8, [r0, +r3]
        ldr     r9, [r1, +r3]
        add     r8, r8, r4
        add     r9, r9, r4
        ldr     r10, [r8], #4
        ldr     r11, [r9], #4
        ldr     r8, [r8]
        ldr     r9, [r9]
        smull   r2, r5, r8, r11
        smlal   r2, r5, r9, r10
        cmp     r5, #2, 2
        mvneq   r5, #2, 2
        mvneq   r2, #0
        cmp     lr, #0
        blt     LAAG_ippsFilterAECNLMS_32sc_Sfs_numSegments_loop_2_im_if_switch
        adds    r12, r12, r2
        adcs    lr, lr, r5
        mvnvs   lr, #2, 2
        mvnvs   r12, #0
        b       LAAG_ippsFilterAECNLMS_32sc_Sfs_numSegments_loop_2_im_if_End
LAAG_ippsFilterAECNLMS_32sc_Sfs_numSegments_loop_2_im_if_switch:
        adds    r12, r12, r2
        adcs    lr, lr, r5
        movvs   lr, #2, 2
        movvs   r12, #0
LAAG_ippsFilterAECNLMS_32sc_Sfs_numSegments_loop_2_im_if_End:
        smull   r2, r5, r10, r11
        smull   r10, r11, r8, r9
        subs    r2, r2, r10
        sbc     r5, r5, r11
        cmp     r7, #0
        blt     LAAG_ippsFilterAECNLMS_32sc_Sfs_numSegments_loop_2_re_if_switch
        adds    r6, r6, r2
        adcs    r7, r7, r5
        mvnvs   r7, #2, 2
        mvnvs   r6, #0
        b       LAAG_ippsFilterAECNLMS_32sc_Sfs_numSegments_loop_2_re_if_End
LAAG_ippsFilterAECNLMS_32sc_Sfs_numSegments_loop_2_re_if_switch:
        adds    r6, r6, r2
        adcs    r7, r7, r5
        movvs   r7, #2, 2
        movvs   r6, #0
LAAG_ippsFilterAECNLMS_32sc_Sfs_numSegments_loop_2_re_if_End:
        ldr     r8, [sp]
        add     r3, r3, #4
        cmp     r3, r8
        blt     LAAG_ippsFilterAECNLMS_32sc_Sfs_numSegments_loop_2
        ldmia   sp!, {r3}
        ldmia   sp!, {r2, r3, r5}
        mov     r8, r7
        cmp     r7, #0
        mvngt   r7, #2, 2
        strgt   r7, [r2, +r4]
        bgt     LAAG_ippsFilterAECNLMS_32sc_Sfs_indexVec_element_re_end_2
        cmn     r7, #1
        blt     LAAG_ippsFilterAECNLMS_32sc_Sfs_indexVec_element_re_NEG_MAX_2
        rsb     r10, r5, #0x20
        mov     r7, r6, asr r10
        mov     r6, r6, lsl r5
        cmp     r7, #0
        mvngt   r7, #2, 2
        strgt   r7, [r2, +r4]
        bgt     LAAG_ippsFilterAECNLMS_32sc_Sfs_indexVec_element_re_end_2
        cmn     r7, #1
        blt     LAAG_ippsFilterAECNLMS_32sc_Sfs_indexVec_element_re_NEG_MAX_2
        eors    r8, r6, r8
        strge   r6, [r2, +r4]
        bge     LAAG_ippsFilterAECNLMS_32sc_Sfs_indexVec_element_re_end_2
        cmp     r6, #0
        bge     LAAG_ippsFilterAECNLMS_32sc_Sfs_indexVec_element_re_NEG_MAX_2
        mvn     r8, #2, 2
        str     r8, [r2, +r4]
        b       LAAG_ippsFilterAECNLMS_32sc_Sfs_indexVec_element_re_end_2
LAAG_ippsFilterAECNLMS_32sc_Sfs_indexVec_element_re_NEG_MAX_2:
        mov     r8, #2, 2
        str     r8, [r2, +r4]
LAAG_ippsFilterAECNLMS_32sc_Sfs_indexVec_element_re_end_2:
        add     r4, r4, #4
        mov     r8, lr
        cmp     lr, #0
        mvngt   lr, #2, 2
        strgt   lr, [r2, +r4]
        bgt     LAAG_ippsFilterAECNLMS_32sc_Sfs_indexVec_element_im_end_2
        cmnlt   lr, #1
        blt     LAAG_ippsFilterAECNLMS_32sc_Sfs_indexVec_element_im_NEG_MAX_2
        rsb     r10, r5, #0x20
        mov     lr, r12, asr r10
        mov     r12, r12, lsl r5
        cmp     lr, #0
        mvngt   lr, #2, 2
        strgt   lr, [r2, +r4]
        bgt     LAAG_ippsFilterAECNLMS_32sc_Sfs_indexVec_element_im_end_2
        cmnlt   lr, #1
        blt     LAAG_ippsFilterAECNLMS_32sc_Sfs_indexVec_element_im_NEG_MAX_2
        eors    r8, r12, r8
        strge   r12, [r2, +r4]
        bge     LAAG_ippsFilterAECNLMS_32sc_Sfs_indexVec_element_im_end_2
        cmp     r12, #0
        bge     LAAG_ippsFilterAECNLMS_32sc_Sfs_indexVec_element_im_NEG_MAX_2
        mvn     r8, #2, 2
        str     r8, [r2, +r4]
        b       LAAG_ippsFilterAECNLMS_32sc_Sfs_indexVec_element_im_end_2
LAAG_ippsFilterAECNLMS_32sc_Sfs_indexVec_element_im_NEG_MAX_2:
        mov     r8, #2, 2
        str     r8, [r2, +r4]
LAAG_ippsFilterAECNLMS_32sc_Sfs_indexVec_element_im_end_2:
        sub     r4, r4, #4
        subs    r4, r4, #8
        bge     LAAG_ippsFilterAECNLMS_32sc_Sfs_1_To_LEN_element_loop_2
LAAG_ippsFilterAECNLMS_32sc_Sfs_IF_END:
        mov     r0, #0
LAAG_ippsFilterAECNLMS_32sc_Sfs_quit:
        ldmia   sp!, {r4 - r11, pc}


