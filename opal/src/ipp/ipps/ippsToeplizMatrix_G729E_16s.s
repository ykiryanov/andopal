        .text
        .align  4
        .globl  _ippsToeplizMatrix_G729E_16s


_ippsToeplizMatrix_G729E_16s:
        stmdb   sp!, {r0, r4 - r11, lr}
        ldr     r10, [sp, #0x28]
        ldr     r9, [sp, #0x2C]
        ldr     r6, [sp, #0x30]
        mov     r5, r0
        mov     r11, sp
        mov     r8, r1
        mov     r7, r2
        mov     r4, r3
        mov     r3, r11
        mov     r2, #0
        mov     r1, #0x28
        bl      _ippsSumSquare_NS_16s32s_Sfs
        ldr     r0, [sp]
        cmp     r0, #0
        ble     LDHH4
        cmp     r0, #0
        moveq   r12, #0
        beq     LDHH1
        ldr     lr, [pc, #0x144]
        ldr     r12, [pc, #0x144]
        movs    r11, r0, lsr #16
        bne     LDHH0
        bic     r0, r0, #0xFF, 8
        bic     r11, r0, #0xFF, 16
        movs    r0, r11, asr #8
        movne   r11, r0, lsl #1
        movne   r12, lr
        moveq   r11, r11, lsl #1
        ldrsh   r11, [r12, +r11]
        add     r12, r11, #0x10
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        b       LDHH1
LDHH0:
        movs    r0, r0, lsr #24
        movne   r0, r0, lsl #1
        ldrnesh r12, [lr, +r0]
        moveq   r11, r11, lsl #1
        ldreqsh r12, [r12, +r11]
LDHH1:
        sub     r12, r12, #1
        mov     r0, r5
        mov     r12, r12, lsl #16
        mov     r3, #0x28
        mov     r12, r12, asr #17
        mov     r2, r4
        mov     r12, r12, lsl #16
        mov     r11, r4
        mov     r5, r12, asr #16
        mov     r1, r5
        bl      _ippsLShiftC_16s
        ldr     lr, [sp]
        mov     r5, r5, lsl #1
        mov     r0, sp
        mov     lr, lr, lsl r5
        mov     r1, #1
        mov     lr, lr, asr #11
        str     lr, [sp]
        bl      _ippsInvSqrt_32s_I
        ldr     r12, [sp]
        mov     r0, #0
        mov     r5, r10
        mov     r12, r12, asr #8
        mov     r12, r12, lsl #16
        mov     lr, r12, asr #16
LDHH2:
        ldrsh   r1, [r11]
        add     r12, r0, #1
        add     r0, r0, #2
        mul     r1, lr, r1
        mov     r12, r12, lsl #16
        cmp     r0, #0x28
        mov     r12, r12, asr #15
        mov     r1, r1, asr #15
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        strh    r1, [r11], #4
        rsb     r1, r1, #0
        strh    r1, [r5], #4
        ldrsh   r1, [r4, +r12]
        mul     r1, lr, r1
        mov     r1, r1, asr #15
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        strh    r1, [r4, +r12]
        rsb     r1, r1, #0
        strh    r1, [r10, +r12]
        blt     LDHH2
LDHH3:
        mov     r1, r9
        mov     r0, r4
        mov     r2, r6
        bl      ownToeplizMatrix_G729E_32s
        mov     r2, r7
        mov     r1, r8
        mov     r0, r6
        bl      ownTakeSign_G729E_16s
        ldmia   sp!, {r0, r4 - r11, pc}
LDHH4:
        mov     r0, r4
        mov     r1, #0x28
        bl      _ippsZero_16s
        mov     r0, r10
        mov     r1, #0x28
        bl      _ippsZero_16s
        b       LDHH3
        .long   NormTable
        .long   NormTable2


