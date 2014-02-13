        .text
        .align  4
        .globl  _ippsTiltCompensation_G729A_16s


_ippsTiltCompensation_G729A_16s:
        stmdb   sp!, {r4 - r9, lr}
        sub     sp, sp, #0xD4
        add     r2, sp, #8
        add     r3, sp, #0xAC
        add     lr, sp, #0x78
        and     r2, r2, #7
        and     r5, lr, #7
        and     r3, r3, #7
        rsb     r2, r2, #0
        rsb     r3, r3, #0
        rsb     r5, r5, #0
        add     r4, sp, #8
        and     r2, r2, #7
        mov     r7, r0
        and     r9, r5, #7
        and     r3, r3, #7
        add     r12, sp, #0xAC
        add     lr, sp, #0x78
        add     r6, r4, r2
        cmp     r7, #0
        mov     r8, r1
        add     r5, r12, r3
        add     r4, lr, r9
        beq     LDPG2
        cmp     r8, #0
        beq     LDPG2
        mov     r2, #0xB
        mov     r1, r6
        mov     r0, r7
        bl      _ippsCopy_16s
        add     r0, r7, #0x16
        mov     r1, r5
        mov     r2, #0xB
        bl      _ippsCopy_16s
        add     r0, r6, #0x16
        mov     r1, #0x28
        bl      _ippsZero_16s
        mov     r3, #0
        str     r3, [sp, #4]
        mov     r3, #0xC
        str     r3, [sp]
        mov     r0, r5
        mov     r1, r6
        mov     r3, #0x16
        mov     r2, r4
        bl      _ippsSynthesisFilter_NR_16s_Sfs
        add     r3, sp, #0xCC
        mov     r2, #0x16
        mov     r1, r4
        mov     r0, r4
        bl      _ippsDotProd_16s32s
        add     r3, sp, #0xCC
        ldr     r5, [r3]
        add     r6, sp, #0xCC
        add     r3, r6, #4
        add     r1, r4, #2
        mov     r0, r4
        mov     r2, #0x15
        bl      _ippsDotProd_16s32s
        ldr     r6, [r6, #4]
        mov     r5, r5, asr #15
        mov     r5, r5, lsl #16
        cmp     r6, #0
        mov     r1, r5, asr #16
        ble     LDPG1
        mov     r6, r6, asr #15
        mov     r2, #0x66
        mov     r0, r6, lsl #16
        orr     r2, r2, #0x66, 24
        mov     r0, r0, asr #16
        mul     r2, r0, r2
        cmp     r1, #0
        mov     r0, r2, asr #15
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #1
        movle   r0, #0xFF
        orrle   r0, r0, #0x7F, 24
        ble     LDPG0
        bl      __intel_idiv
LDPG0:
        mov     r0, r0, lsl #16
        sub     r3, r8, #2
        mov     r0, r0, asr #16
        mov     r1, r8
        mov     r2, #0x28
        bl      _ippsPreemphasize_G729A_16s_I
        mov     r0, #0
        add     sp, sp, #0xD4
        ldmia   sp!, {r4 - r9, pc}
LDPG1:
        ldrsh   r0, [r8, #0x4E]
        strh    r0, [r8, #-2]
        mov     r0, #0
        add     sp, sp, #0xD4
        ldmia   sp!, {r4 - r9, pc}
LDPG2:
        mvn     r0, #7
        add     sp, sp, #0xD4
        ldmia   sp!, {r4 - r9, pc}


