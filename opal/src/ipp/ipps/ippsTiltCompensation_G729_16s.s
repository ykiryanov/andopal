        .text
        .align  4
        .globl  _ippsTiltCompensation_G729_16s


_ippsTiltCompensation_G729_16s:
        stmdb   sp!, {r4 - r7, lr}
        sub     sp, sp, #0x6C
        add     r3, sp, #8
        and     r3, r3, #7
        rsb     r3, r3, #0
        add     r2, sp, #8
        and     r3, r3, #7
        cmp     r0, #0
        add     r4, r2, r3
        mov     r5, r1
        beq     LDPF3
        cmp     r5, #0
        beq     LDPF3
        add     r12, sp, #0x68
        add     r2, sp, #0x60
        str     r12, [sp]
        mov     r3, #2
        mov     r1, #0x14
        bl      _ippsAutoCorr_NormE_16s32s
        add     r12, sp, #0x60
        ldr     r12, [r12, #4]
        add     lr, sp, #0x60
        ldr     lr, [lr]
        mov     r12, r12, asr #16
        mov     r3, #0xFF
        orr     r3, r3, #0x7F, 24
        mov     r12, r12, lsl #16
        mov     r7, lr, asr #16
        mov     r12, r12, asr #16
        mov     lr, r12
        mov     r6, lr
        mov     r7, r7, lsl #16
        cmp     r6, #0
        mov     r1, r7, asr #16
        bge     LDPF0
        cmn     r6, #2, 18
        moveq   lr, r3
        beq     LDPF0
        rsb     lr, r6, #0
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
LDPF0:
        cmp     r1, lr
        movlt   r0, #0
        blt     LDPF2
        cmp     r6, #0
        bge     LDPF1
        cmn     r6, #2, 18
        moveq   r12, r3
        beq     LDPF1
        rsb     r3, r6, #0
        mov     r3, r3, lsl #16
        mov     r12, r3, asr #16
LDPF1:
        mov     r0, r12, lsl #15
        bl      __intel_idiv
        cmp     r6, #0
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        ble     LDPF2
        rsb     r0, r0, #0
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
LDPF2:
        sub     r1, r5, #2
        mov     r2, r4
        bl      _ippsTiltCompensation_G729E_16s
        mov     r0, r4
        mov     r1, r5
        mov     r2, #0x28
        bl      _ippsCopy_16s
        mov     r0, #0
        add     sp, sp, #0x6C
        ldmia   sp!, {r4 - r7, pc}
LDPF3:
        mvn     r0, #7
        add     sp, sp, #0x6C
        ldmia   sp!, {r4 - r7, pc}


