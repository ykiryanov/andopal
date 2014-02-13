        .text
        .align  4
        .globl  _ippsToeplizMatrix_G729_16s32s


_ippsToeplizMatrix_G729_16s32s:
        stmdb   sp!, {r4 - r7, lr}
        sub     sp, sp, #0x7C
        add     r3, sp, #8
        and     r3, r3, #0x1F
        rsb     r3, r3, #0
        mov     r4, r0
        add     r2, sp, #8
        and     r3, r3, #0x1F
        cmp     r4, #0
        add     r5, r2, r3
        mov     r6, r1
        beq     LDHG5
        cmp     r6, #0
        beq     LDHG5
        add     r3, sp, #0x78
        mov     r7, #0
        str     r7, [sp]
        mov     r2, #0x28
        mov     r1, r4
        mov     r0, r4
        bl      _ippsDotProd_16s32s_Sfs
        ldr     lr, [sp, #0x78]
        mov     r3, lr, asr #15
        cmp     r3, #0
        ble     LDHG4
        cmp     r3, #0x7D, 24
        ble     LDHG0
        mov     r0, r4
        mov     r2, r5
        mov     r3, #0x28
        mov     r1, #1
        bl      _ippsRShiftC_16s
        b       LDHG3
LDHG0:
        cmp     lr, #0
        beq     LDHG2
        ldr     r12, [pc, #0x94]
        ldr     r3, [pc, #0x94]
        movs    r7, lr, lsr #16
        bne     LDHG1
        bic     lr, lr, #0xFF, 8
        bic     lr, lr, #0xFF, 16
        movs    r7, lr, asr #8
        movne   lr, r7, lsl #1
        movne   r3, r12
        moveq   lr, lr, lsl #1
        ldrsh   lr, [r3, +lr]
        add     r3, lr, #0x10
        mov     r3, r3, lsl #16
        mov     r7, r3, asr #16
        b       LDHG2
LDHG1:
        movs    lr, lr, lsr #24
        movne   lr, lr, lsl #1
        ldrnesh r7, [r12, +lr]
        moveq   r7, r7, lsl #1
        ldreqsh r7, [r3, +r7]
LDHG2:
        sub     r7, r7, #1
        mov     r0, r4
        mov     r1, r7, asr #1
        mov     r3, #0x28
        mov     r2, r5
        bl      _ippsLShiftC_16s
LDHG3:
        mov     r0, r5
        mov     r1, r6
        bl      ownToeplizMatrix_G729_32s
        mov     r0, #0
        add     sp, sp, #0x7C
        ldmia   sp!, {r4 - r7, pc}
LDHG4:
        mov     r0, r5
        mov     r1, #0x28
        bl      _ippsZero_16s
        b       LDHG3
LDHG5:
        mvn     r0, #7
        add     sp, sp, #0x7C
        ldmia   sp!, {r4 - r7, pc}
        .long   NormTable
        .long   NormTable2


