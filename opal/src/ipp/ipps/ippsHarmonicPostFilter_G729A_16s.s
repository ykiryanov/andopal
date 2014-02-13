        .text
        .align  4
        .globl  _ippsHarmonicPostFilter_G729A_16s


_ippsHarmonicPostFilter_G729A_16s:
        stmdb   sp!, {r4 - r10, lr}
        sub     sp, sp, #0x66, 30
        add     r12, sp, #8
        and     r12, r12, #0xF
        rsb     r12, r12, #0
        add     r3, sp, #8
        and     r12, r12, #0xF
        add     r6, r3, r12
        str     r0, [sp, #0x194]
        mov     r8, #0x1F
        mov     r5, r1
        add     r3, r8, #0xFF
        mov     r4, r2
        sub     r0, r5, r3
        add     r2, r6, #2
        mov     r3, #0xB7
        mov     r1, #2
        bl      _ippsRShiftC_16s
        ldr     r3, [sp, #0x194]
        add     r6, r6, #0x12, 28
        sub     r2, r3, #3
        add     r3, r2, #6
        cmp     r3, #0x8F
        movgt   r3, #0x8F
        movgt   r2, #0x89
        add     lr, sp, #0x65, 30
        add     r12, sp, #0x62, 30
        str     lr, [sp, #4]
        str     r12, [sp]
        mov     r0, r6
        mov     r1, #0x28
        bl      _ippsAutoCorrLagMax_Inv_16s
        ldr     r12, [sp, #0x188]
        ldr     r7, [sp, #0x194]
        add     r3, sp, #0x19, 28
        cmp     r12, #0
        sub     r0, r6, r7, lsl #1
        mov     r7, #0
        movlt   r12, r7
        str     r12, [sp, #0x188]
        mov     r2, #0
        mov     r1, #0x28
        bl      _ippsSumSquare_NS_16s32s_Sfs
        ldr     lr, [sp, #0x190]
        add     r3, sp, #0x63, 30
        mov     lr, lr, lsl #1
        add     lr, lr, #1
        str     lr, [sp, #0x190]
        mov     r0, r6
        mov     r2, #0
        mov     r1, #0x28
        bl      _ippsSumSquare_NS_16s32s_Sfs
        ldr     r6, [sp, #0x188]
        ldr     r12, [sp, #0x190]
        ldr     r3, [sp, #0x18C]
        mov     r9, r6
        cmp     r12, r6
        mov     r3, r3, lsl #1
        movgt   r9, r12
        add     r3, r3, #1
        cmp     r3, r9
        movgt   r9, r3
        cmp     r9, #0
        moveq   r8, r7
        beq     LDQP1
        cmn     r9, #1
        beq     LDQP1
        cmp     r9, #0
        mvnlt   r9, r9
        cmp     r9, #0
        moveq   r8, r7
        beq     LDQP1
        ldr     lr, [pc, #0x1A8]
        ldr     r8, [pc, #0x1A8]
        movs    r10, r9, lsr #16
        bne     LDQP0
        bic     r9, r9, #0xFF, 8
        bic     r9, r9, #0xFF, 16
        movs    r10, r9, asr #8
        movne   r9, r10, lsl #1
        movne   r8, lr
        moveq   r9, r9, lsl #1
        ldrsh   r9, [r8, +r9]
        add     lr, r9, #0x10
        mov     lr, lr, lsl #16
        mov     r8, lr, asr #16
        b       LDQP1
LDQP0:
        movs    r9, r9, lsr #24
        movne   r9, r9, lsl #1
        ldrnesh r8, [lr, +r9]
        moveq   r10, r10, lsl #1
        ldreqsh r8, [r8, +r10]
LDQP1:
        ldr     lr, [pc, #0x160]
        mov     r9, r6, lsl r8
        mov     r6, #0xFF
        cmp     lr, r9
        orr     r6, r6, #0x7F, 24
        movle   r9, r6
        ble     LDQP2
        add     r9, r9, #2, 18
        mov     r9, r9, asr #16
        mov     r9, r9, lsl #16
        mov     r9, r9, asr #16
LDQP2:
        mov     r12, r12, lsl r8
        cmp     lr, r12
        movle   r12, r6
        ble     LDQP3
        add     r12, r12, #2, 18
        mov     r12, r12, asr #16
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
LDQP3:
        mov     r8, r3, lsl r8
        cmp     lr, r8
        movle   r8, r6
        ble     LDQP4
        add     r8, r8, #2, 18
        mov     r8, r8, asr #16
        mov     r8, r8, lsl #16
        mov     r8, r8, asr #16
LDQP4:
        mul     lr, r12, r8
        mov     r8, r9, lsl #1
        mul     r8, r8, r9
        cmp     r8, lr
        blt     LDQP8
        cmp     r9, r12
        ble     LDQP5
        mov     r12, #0x55
        mov     r3, #0xAB
        orr     r6, r12, #0x55, 24
        orr     r12, r3, #0x2A, 24
        b       LDQP6
LDQP5:
        mov     r9, r9, lsl #14
        mov     r9, r9, asr #16
        mov     r9, r9, lsl #16
        mov     r3, r9, asr #16
        add     r12, r3, r12, asr #1
        mov     r12, r12, lsl #16
        mov     r1, r12, asr #16
        cmp     r1, #0
        movle   r12, r7
        ble     LDQP6
        mov     r0, r3, lsl #15
        bl      __intel_idiv
        mov     r0, r0, lsl #16
        mov     r12, r0, asr #16
        rsb     r6, r12, r6
        mov     r6, r6, lsl #16
        mov     r6, r6, asr #16
LDQP6:
        ldr     r3, [sp, #0x194]
        rsb     r3, r3, #0
        add     r3, r5, r3, lsl #1
LDQP7:
        ldrsh   r8, [r3]
        ldrsh   lr, [r5]
        add     r7, r7, #2
        mul     r8, r12, r8
        cmp     r7, #0x28
        mul     lr, r6, lr
        mov     r8, r8, asr #15
        add     lr, r8, lr, asr #15
        strh    lr, [r4]
        ldrsh   r8, [r3, #2]
        ldrsh   lr, [r5, #2]
        add     r3, r3, #4
        mul     r8, r12, r8
        add     r5, r5, #4
        mul     lr, r6, lr
        mov     r8, r8, asr #15
        add     lr, r8, lr, asr #15
        strh    lr, [r4, #2]
        add     r4, r4, #4
        blt     LDQP7
        add     sp, sp, #0x66, 30
        ldmia   sp!, {r4 - r10, pc}
LDQP8:
        mov     r1, r4
        mov     r0, r5
        str     r3, [sp, #0x18C]
        mov     r2, #0x28
        bl      _ippsCopy_16s
        add     sp, sp, #0x66, 30
        ldmia   sp!, {r4 - r10, pc}
        .long   NormTable
        .long   NormTable2
        .long   0x7fff8000


