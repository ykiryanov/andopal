        .text
        .align  4
        .globl  __rsbdf3
        .globl  __aeabi_drsub
        .globl  __aeabi_dsub
        .globl  __subdf3
        .globl  __aeabi_dadd
        .globl  __adddf3


__rsbdf3:
__aeabi_drsub:
        eor     r3, r3, #2, 2
        eor     r1, r1, #2, 2
__aeabi_dsub:
__subdf3:
        mov     r12, #0xFF, 8
        orr     r12, r12, #0xE, 12
        cmp     r12, r3, lsl #1
        bcc     LAGW_DBL_SUB_SPECIAL
        eor     r3, r3, #2, 2
__adddf3:
__aeabi_dadd:
        stmdb   sp!, {r4, r5}
        mov     r4, #1, 10
        adds    r12, r4, r3, lsl #1
        cmpcc   r4, r3, lsl #1
        addccs  r5, r4, r1, lsl #1
        cmpcc   r4, r1, lsl #1
        bcs     LAGW_DBL_ADD_SPECIAL
        teq     r1, r3
        bmi     LAGW_SUB_PATH
LAGW_BACK_MAIN:
        mov     r5, r1, lsr #20
        mov     r4, r3, lsr #20
        subs    r12, r5, r4
        bcc     LAGW_REVERSE_ADD
        sub     r3, r3, r4, lsl #20
        orr     r3, r3, #1, 12
LAGW_RETURN_DEN_ADD:
        rsbs    r4, r12, #0x20
        bcc     LAGW_LONG_ADD
        adds    r0, r0, r2, lsr r12
        adc     r1, r1, r3, lsr r12
        adds    r0, r0, r3, lsl r4
        mov     r12, r2, lsl r4
        adc     r1, r1, #0
        cmp     r5, r1, lsr #20
        bcc     LAGW_ADD_SHIFT
        ldmia   sp!, {r4, r5}
        movs    r12, r12, lsl #1
        bxcc    lr
        orr     r12, r12, r0, lsl #31
        subcss  r12, r12, #1
        adcs    r0, r0, #0
        adc     r1, r1, #0
        bx      lr
LAGW_ADD_SHIFT_LONG:
        orr     r12, r12, r2
LAGW_ADD_SHIFT:
        add     r5, r5, #1
        movs    r0, r0, lsr #1
        orr     r0, r0, r1, lsl #31
        mov     r1, r1, lsr #1
        orr     r12, r12, r0, lsl #31
        subcss  r12, r12, #1
        adcs    r0, r0, #0
        adc     r1, r1, r5, lsl #19
        ldmia   sp!, {r4, r5}
        bx      lr
LAGW_LONG_ADD:
        sub     r12, r12, #0x20
        rsbs    r4, r12, #0x20
        bls     LAGW_RETURN
        adds    r0, r0, r3, lsr r12
        adc     r1, r1, #0
        mov     r12, r3, lsl r4
        cmp     r5, r1, lsr #20
        bcc     LAGW_ADD_SHIFT_LONG
        ldmia   sp!, {r4, r5}
        movs    r12, r12, lsl #1
        bxcc    lr
        orr     r2, r2, r0, lsl #31
        orr     r2, r2, r12
        subcss  r2, r2, #1
        adcs    r0, r0, #0
        adc     r1, r1, #0
        bx      lr
LAGW_REVERSE_ADD:
        rsb     r12, r12, #0
        sub     r1, r1, r5, lsl #20
        orr     r1, r1, #1, 12
        rsbs    r5, r12, #0x20
        bcc     LAGW_REVERSE_LONG_ADD
        adds    r2, r2, r0, lsr r12
        adc     r3, r3, r1, lsr r12
        mov     r12, r0, lsl r5
        adds    r0, r2, r1, lsl r5
        adc     r1, r3, #0
        cmp     r4, r1, lsr #20
        bcc     LAGW_REVERSE_ADD_SHIFT
        ldmia   sp!, {r4, r5}
        movs    r12, r12, lsl #1
        bxcc    lr
        orr     r12, r12, r0, lsl #31
        subcss  r12, r12, #1
        adcs    r0, r0, #0
        adc     r1, r1, #0
        bx      lr
LAGW_REVERSE_ADD_SHIFT_LONG:
        orr     r12, r0, r12
        mov     r0, r2
LAGW_REVERSE_ADD_SHIFT:
        add     r4, r4, #1
        movs    r0, r0, lsr #1
        orr     r0, r0, r1, lsl #31
        mov     r1, r1, lsr #1
        orr     r12, r12, r0, lsl #31
        subcss  r12, r12, #1
        adcs    r0, r0, #0
        adc     r1, r1, r4, lsl #19
        ldmia   sp!, {r4, r5}
        bx      lr
LAGW_REVERSE_LONG_ADD:
        sub     r12, r12, #0x20
        rsbs    r5, r12, #0x20
        bls     LAGW_REVERSE_RETURN
        adds    r2, r2, r1, lsr r12
        mov     r12, r1, lsl r5
        adc     r1, r3, #0
        cmp     r4, r1, lsr #20
        bcc     LAGW_REVERSE_ADD_SHIFT_LONG
        ldmia   sp!, {r4, r5}
        movs    r12, r12, lsl #1
        movcc   r0, r2
        bxcc    lr
        orr     r0, r0, r2, lsl #31
        orr     r0, r0, r12
        subcss  r12, r0, #1
        adcs    r0, r2, #0
        adc     r1, r1, #0
        bx      lr
LAGW_REVERSE_SUB:
        eor     r3, r3, #2, 2
        eor     r1, r1, #2, 2
        mov     r4, r1, lsr #20
        mov     r5, r3, lsr #20
        sub     r12, r5, r4
        sub     r1, r1, r4, lsl #20
        orr     r1, r1, #1, 12
        rsbs    r4, r12, #0x20
        bcc     LAGW_REVERSE_LONG_SUB
        subs    r2, r2, r0, lsr r12
        sbc     r3, r3, r1, lsr r12
        mov     r12, r0, lsl r4
        rsbs    r12, r12, #0
        sbcs    r0, r2, r1, lsl r4
        sbc     r1, r3, #0
        cmp     r5, r1, lsr #20
        bhi     LAGW_SUB_SHIFT
        ldmia   sp!, {r4, r5}
        movs    r12, r12, lsl #1
        bxcc    lr
        orr     r12, r12, r0, lsl #31
        subcss  r12, r12, #1
        adcs    r0, r0, #0
        adc     r1, r1, #0
        bx      lr
LAGW_SUB_PATH:
        eor     r3, r3, #2, 2
        cmp     r1, r3
        cmpeq   r0, r2
        bcc     LAGW_REVERSE_SUB
        mov     r5, r1, lsr #20
        mov     r4, r3, lsr #20
        sub     r12, r5, r4
        sub     r3, r3, r4, lsl #20
        orr     r3, r3, #1, 12
LAGW_RETURN_DEN_SUB:
        rsbs    r4, r12, #0x20
        bcc     LAGW_LONG_SUB
        subs    r0, r0, r2, lsr r12
        sbc     r1, r1, r3, lsr r12
        mov     r12, r2, lsl r4
        rsbs    r12, r12, #0
        sbcs    r0, r0, r3, lsl r4
        sbc     r1, r1, #0
        cmp     r5, r1, lsr #20
        bhi     LAGW_SUB_SHIFT
        ldmia   sp!, {r4, r5}
        movs    r12, r12, lsl #1
        bxcc    lr
        orr     r12, r12, r0, lsl #31
        subcss  r12, r12, #1
        adcs    r0, r0, #0
        adc     r1, r1, #0
        bx      lr
LAGW_REVERSE_LONG_SUB:
        sub     r12, r12, #0x20
        rsbs    r4, r12, #0x20
        bls     LAGW_REVERSE_RETURN
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
        adds    r2, r2, r1, asr r12
        mov     r12, r1, lsl r4
        sbc     r1, r3, #0
        cmp     r5, r1, lsr #20
        bne     LAGW_REVERSE_LONG_SUB_SHIFT
        ldmia   sp!, {r4, r5}
        movs    r12, r12, lsl #1
        movcc   r0, r2
        bxcc    lr
        orr     r12, r12, r2, lsl #31
        orr     r12, r12, r0
        subcss  r12, r12, #1
        adcs    r0, r2, #0
        adc     r1, r1, #0
        bx      lr
LAGW_REVERSE_LONG_SUB_SHIFT:
        cmp     r4, #0x1F
        orreq   r12, r12, r0, lsr #1
        moveq   r0, r0, lsl #31
        sub     r1, r1, r5, lsl #20
        mov     r1, r1, lsl #1
        orr     r1, r1, r2, lsr #31
        mov     r2, r2, lsl #1
        orr     r2, r2, r12, lsr #31
        movs    r12, r12, lsl #2
        orr     r12, r12, r2, lsl #31
        orr     r12, r12, r0
        subcss  r12, r12, #1
        adcs    r0, r2, #0
        adc     r1, r1, r5, lsl #20
        ldmia   sp!, {r4, r5}
        bx      lr
LAGW_LONG_SUB_SHIFT:
        cmp     r4, #0x1F
        orreq   r12, r12, r2, lsr #1
        moveq   r2, r2, lsl #31
        sub     r1, r1, r5, lsl #20
        mov     r1, r1, lsl #1
        orr     r1, r1, r0, lsr #31
        mov     r0, r0, lsl #1
        orr     r0, r0, r12, lsr #31
        movs    r12, r12, lsl #2
        orr     r12, r12, r0, lsl #31
        orr     r12, r12, r2
        subcss  r12, r12, #1
        adcs    r0, r0, #0
        adc     r1, r1, r5, lsl #20
        ldmia   sp!, {r4, r5}
        bx      lr
LAGW_LONG_SUB:
        sub     r12, r12, #0x20
        rsbs    r4, r12, #0x20
        bls     LAGW_RETURN
        rsbs    r2, r2, #0
        rsc     r3, r3, #0
        adds    r0, r0, r3, asr r12
        sbc     r1, r1, #0
        mov     r12, r3, lsl r4
        cmp     r5, r1, lsr #20
        bne     LAGW_LONG_SUB_SHIFT
        ldmia   sp!, {r4, r5}
        movs    r12, r12, lsl #1
        bxcc    lr
        orr     r12, r12, r0, lsl #31
        orr     r12, r12, r2
        subcss  r12, r12, #1
        adcs    r0, r0, #0
        adc     r1, r1, #0
        bx      lr
LAGW_SUB_SHIFT:
        mov     r1, r1, lsl #10
        bic     r1, r1, #3, 2
        clz     r4, r1
        mov     r1, r1, lsr #10
        cmp     r4, #0x20
        bcs     LAGW_SUB_SHIFT2
        mov     r5, r5, ror #11
        cmp     r5, r4, lsl #21
        bcc     LAGW_SUB_UF
        rsb     r5, r4, r5, ror #21
        sub     r4, r4, #1
        rsb     r3, r4, #0x20
        mov     r1, r1, lsl r4
        orr     r1, r1, r0, lsr r3
        mov     r0, r0, lsl r4
        orr     r0, r0, r12, lsr r3
        mov     r12, r12, lsl r4
        movs    r12, r12, lsl #1
        add     r1, r1, r5, lsl #20
        ldmia   sp!, {r4, r5}
        bxcc    lr
        orr     r12, r12, r0, lsl #31
        subcss  r12, r12, #1
        adcs    r0, r0, #0
        adc     r1, r1, #0
        bx      lr
LAGW_SUB_SHIFT2:
        cmp     r0, #0
        beq     LAGW_RETURN_ZERO
LAGW_SUB_SHIFT2_RET:
        clz     r4, r0
        add     r4, r4, #0x16
        mov     r5, r5, ror #11
        cmp     r5, r4, lsl #21
        bcc     LAGW_SUB_UF
        rsb     r5, r4, r5, ror #21
        sub     r4, r4, #1
        rsbs    r3, r4, #0x20
        subcc   r4, r4, #0x20
        movcc   r1, r0
        movcc   r0, r12
        movcc   r12, #0
        rsbcc   r3, r4, #0x20
        mov     r1, r1, lsl r4
        orr     r1, r1, r0, lsr r3
        mov     r0, r0, lsl r4
        orr     r0, r0, r12, lsr r3
        movs    r12, r12, lsl #1
        add     r1, r1, r5, lsl #20
        ldmia   sp!, {r4, r5}
        bx      lr
LAGW_SUB_UF:
        mov     r4, r5, lsr #21
        sub     r5, r5, #1
        cmp     r4, #0x20
        movcs   r1, r0
        movcs   r0, r12
        movcs   r12, #0
        subcs   r4, r4, #0x20
        rsb     r3, r4, #0x20
        mov     r1, r1, lsl r4
        orr     r1, r1, r0, lsr r3
        mov     r0, r0, lsl r4
        orr     r0, r0, r12, lsr r3
        mov     r12, r12, lsl r4
        orr     r1, r1, r5, lsr #31
        movs    r12, r12, lsl #1
        orr     r12, r12, r0, lsl #31
        subcss  r12, r12, #1
        adcs    r0, r0, #0
        adc     r1, r1, #0
        ldmia   sp!, {r4, r5}
        bx      lr
LAGW_RETURN_ZERO:
        cmp     r12, #0
        bne     LAGW_SUB_SHIFT2_RET
        mov     r5, r5, lsr #11
        mov     r1, r5, lsr #31
        mov     r0, #0
        ldmia   sp!, {r4, r5}
        bx      lr
LAGW_REVERSE_RETURN:
        mov     r1, r3
        mov     r0, r2
LAGW_RETURN:
        ldmia   sp!, {r4, r5}
        bx      lr
LAGW_SPECIAL_OP:
        and     r5, r12, r1, lsr #20
        teq     r5, r12
        beq     LAGW_A_NAN_Inf
        teq     r4, r12
        beq     LAGW_B_NAN_Inf
        cmp     r4, #0
        beq     LAGW_DEN_B
        b       LAGW_DEN_A
LAGW_A_NAN_Inf:
        cmp     r0, #0
        orrne   r1, r1, #2, 14
        bne     LAGW_RETURN
        movs    r0, r1, lsl #12
        mov     r0, #0
        orrne   r1, r1, #2, 14
        bne     LAGW_RETURN
        mov     r12, r3, lsl #1
        cmp     r12, r1, lsl #1
        cmpeq   r2, r0
        bcc     LAGW_RETURN
        orrhi   r1, r3, #2, 14
        movhi   r0, r2
        bhi     LAGW_RETURN
        teq     r1, r3
        orrmi   r1, r1, #2, 14
        b       LAGW_RETURN
LAGW_B_NAN_Inf:
        movs    r0, r2
        orrne   r1, r3, #2, 14
        bne     LAGW_RETURN
        movs    r2, r3, lsl #12
        orrne   r1, r3, #2, 14
        mov     r1, r3
        b       LAGW_RETURN
LAGW_DBL_SUB_SPECIAL:
        stmdb   sp!, {r4, r5}
LAGW_DBL_ADD_SPECIAL:
        mov     r12, #0x7F, 28
        orr     r12, r12, #0xF
        ands    r4, r12, r3, lsr #20
        teqne   r4, r12
        andnes  r5, r12, r1, lsr #20
        teqne   r5, r12
        beq     LAGW_SPECIAL_OP
        sub     r12, r12, #1
        cmp     r4, r12
        beq     LAGW_LARGE_B
        cmp     r5, r12
        beq     LAGW_LARGE_A
        teq     r1, r3
        bpl     LAGW_BACK_MAIN
        cmp     r4, r5
        cmpeq   r4, #1
        beq     LAGW_DEN_AB
        b       LAGW_SUB_PATH
LAGW_LARGE_A:
        teq     r1, r3
        bmi     LAGW_SUB_PATH
LAGW_LARGE_A_CONT:
        mov     r5, r1, lsr #20
        mov     r4, r3, lsr #20
        sub     r12, r5, r4
        cmp     r12, #0x36
        bcs     LAGW_RETURN
        sub     r1, r1, r5, lsl #20
        sub     r3, r3, r4, lsl #20
        orr     r3, r3, #1, 12
        rsbs    r4, r12, #0x20
        bcc     LAGW_LARGE_A_LONG
        adds    r0, r0, r2, lsr r12
        adc     r1, r1, r3, lsr r12
        adds    r0, r0, r3, lsl r4
        adc     r1, r1, #0
        mov     r12, r2, lsl r4
        movs    r12, r12, lsl #1
        orr     r12, r12, r0, lsl #31
        subcss  r12, r12, #1
        adcs    r0, r0, #0
        adc     r1, r1, #0
        cmp     r1, #1, 12
        bcs     LAGW_ADD_OF
        add     r1, r1, r5, lsl #20
        b       LAGW_RETURN
LAGW_LARGE_A_LONG:
        sub     r12, r12, #0x20
        rsb     r4, r12, #0x20
        adds    r0, r0, r3, lsr r12
        adc     r1, r1, #0
        mov     r3, r3, lsl r4
        movs    r12, r12, lsl #1
        orr     r12, r12, r0, lsl #31
        subcss  r12, r12, #1
        adcs    r0, r0, #0
        adc     r1, r1, #0
        cmp     r1, #1, 12
        bcs     LAGW_ADD_OF
        add     r1, r1, r5, lsl #20
        b       LAGW_RETURN
LAGW_LARGE_B:
        teq     r1, r3
        bmi     LAGW_SUB_PATH
        mov     r12, r1
        mov     r1, r3
        mov     r3, r12
        mov     r12, r0
        mov     r0, r2
        mov     r2, r12
        b       LAGW_LARGE_A_CONT
LAGW_DEN_A:
        cmp     r4, #1
        bls     LAGW_DEN_AB
        rsb     r12, r5, r4
        sub     r12, r12, #1
        cmp     r12, #0x38
        bcs     LAGW_REVERSE_RETURN
        mov     r5, r3
        mov     r3, r1
        mov     r1, r5
        mov     r5, r2
        mov     r2, r0
        mov     r0, r5
        b       LAGW_DEN_CONT
LAGW_DEN_B:
        cmp     r5, #1
        bls     LAGW_DEN_AB
        sub     r12, r5, r4
        sub     r12, r12, #1
        cmp     r12, #0x38
        bcs     LAGW_RETURN
LAGW_DEN_CONT:
        teq     r1, r3
        mov     r3, r3, lsl #12
        mov     r3, r3, lsr #12
        mov     r5, r1, lsr #20
        bmi     LAGW_RETURN_DEN_SUB
        b       LAGW_RETURN_DEN_ADD
LAGW_DEN_AB:
        teq     r1, r3
        bmi     LAGW_DEN_AB_SUB
        bic     r3, r3, #2, 2
        adds    r0, r0, r2
        adc     r1, r1, r3
        b       LAGW_RETURN
LAGW_DEN_AB_SUB:
        mov     r12, r1, lsl #1
        cmp     r12, r3, lsl #1
        cmpeq   r0, r2
        bcc     LAGW_REVERSE_DEN_AB_SUB
        bic     r3, r3, #2, 2
        subs    r0, r0, r2
        sbc     r1, r1, r3
        orrs    r12, r0, r1, lsl #1
        biceq   r1, r1, #2, 2
        b       LAGW_RETURN
LAGW_REVERSE_DEN_AB_SUB:
        and     r12, r3, #2, 2
        eor     r1, r1, #2, 2
        subs    r0, r2, r0
        sbc     r1, r3, r1
        orr     r1, r1, r12
        b       LAGW_RETURN
LAGW_ADD_OF:
        orr     r5, r5, #0x7F, 28
        orr     r5, r5, #0xF
        mov     r1, r5, lsl #20
        mov     r0, #0
        b       LAGW_RETURN


