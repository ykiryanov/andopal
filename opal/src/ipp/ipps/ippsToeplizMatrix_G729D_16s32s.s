        .text
        .align  4
        .globl  _ippsToeplizMatrix_G729D_16s32s


_ippsToeplizMatrix_G729D_16s32s:
        stmdb   sp!, {r4 - r7, lr}
        sub     sp, sp, #0x64
        add     r3, sp, #0x60
        mov     r4, r0
        mov     r5, r1
        mov     r2, #0
        mov     r1, #0x28
        mov     r7, sp
        mov     r6, sp
        bl      _ippsSumSquare_NS_16s32s_Sfs
        ldr     r3, [sp, #0x60]
        and     r7, r7, #0xF
        rsb     r7, r7, #0
        mov     r12, r3, asr #15
        and     r7, r7, #0xF
        cmp     r12, #0
        add     r6, r6, r7
        ble     LDHI4
        cmp     r12, #0x7D, 24
        ble     LDHI0
        mov     r0, r4
        mov     r2, r6
        mov     r3, #0x28
        mov     r1, #1
        bl      _ippsRShiftC_16s
        b       LDHI3
LDHI0:
        cmp     r3, #0
        moveq   r3, #0
        beq     LDHI2
        ldr     lr, [pc, #0x94]
        ldr     r12, [pc, #0x94]
        movs    r7, r3, lsr #16
        bne     LDHI1
        bic     r3, r3, #0xFF, 8
        bic     r3, r3, #0xFF, 16
        movs    r7, r3, asr #8
        movne   r3, r7, lsl #1
        movne   r12, lr
        moveq   r3, r3, lsl #1
        ldrsh   r3, [r12, +r3]
        add     r3, r3, #0x10
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
        b       LDHI2
LDHI1:
        movs    r3, r3, lsr #24
        movne   r3, r3, lsl #1
        ldrnesh r3, [lr, +r3]
        moveq   r7, r7, lsl #1
        ldreqsh r3, [r12, +r7]
LDHI2:
        sub     r3, r3, #1
        mov     r0, r4
        mov     r3, r3, lsl #16
        mov     r2, r6
        mov     r3, r3, asr #17
        mov     r3, r3, lsl #16
        mov     r1, r3, asr #16
        mov     r3, #0x28
        bl      _ippsLShiftC_16s
LDHI3:
        mov     r0, r6
        mov     r1, r5
        bl      ownToeplizMatrix_G729D_32s
        mov     r0, #0
        add     sp, sp, #0x64
        ldmia   sp!, {r4 - r7, pc}
LDHI4:
        mov     r0, r6
        mov     r1, #0x28
        bl      _ippsZero_16s
        b       LDHI3
        .long   NormTable
        .long   NormTable2


