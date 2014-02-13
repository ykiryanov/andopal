        .text
        .align  4
        .globl  _ippsAutoCorr_NormE_G723_16s


_ippsAutoCorr_NormE_G723_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x30
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        mov     r6, r2
        beq     LDVA13
        cmp     r4, #0
        beq     LDVA13
        cmp     r6, #0
        beq     LDVA13
        add     r3, sp, #0x2C
        mov     r2, #0
        mov     r1, #0xB4
        mov     r0, r5
        bl      _ippsSumSquare_NS_16s32s_Sfs
        ldr     r3, [sp, #0x2C]
        adds    r3, r3, r3, asr #10
        moveq   r0, #0
        beq     LDVA2
        ldr     lr, [pc, #0x28C]
        ldr     r12, [pc, #0x28C]
        movs    r7, r3, asr #16
        bne     LDVA0
        bic     r7, r3, #0xFF, 8
        bic     r7, r7, #0xFF, 16
        movs    r8, r7, asr #8
        movne   r7, r8, lsl #1
        movne   r12, lr
        moveq   r7, r7, lsl #1
        ldrsh   r7, [r12, +r7]
        add     r12, r7, #0x10
        mov     r12, r12, lsl #16
        mov     r0, r12, asr #16
        b       LDVA1
LDVA0:
        bic     r7, r7, #0xFF, 8
        bic     r7, r7, #0xFF, 16
        movs    r8, r7, asr #8
        movne   r8, r8, lsl #1
        ldrnesh r0, [lr, +r8]
        moveq   r7, r7, lsl #1
        ldreqsh r0, [r12, +r7]
LDVA1:
        mov     r3, r3, lsl r0
LDVA2:
        mov     r2, #2, 2
        sub     r12, r2, #2, 18
        cmp     r12, r3
        str     r0, [r6]
        mvn     r11, #0
        addle   r12, r11, #2, 18
        ble     LDVA3
        add     r12, r3, #2, 18
        mov     r12, r12, asr #16
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
LDVA3:
        cmp     r12, #0
        strh    r12, [r4]
        bne     LDVA4
        mov     r0, r4
        str     r3, [sp, #0x2C]
        mov     r1, #0xB
        bl      _ippsZero_16s
        mov     r0, #0
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LDVA4:
        ldr     r3, [pc, #0x1E4]
        sub     r8, r2, #2, 18
        mov     r10, #1
        mvn     r9, #2, 2
LDVA5:
        rsb     r1, r10, #0xB4
        cmp     r1, #0
        mov     r2, #0
        movle   r12, r10, lsl #1
        ble     LDVA9
        rsb     r12, r10, #0
        add     r12, r12, #0xB4
        cmp     r12, #6
        blt     LDVA12
        mov     r12, r10, lsl #1
        add     r7, r5, r12
        rsb     r6, r10, #0xAE
        str     r6, [sp, #0x24]
        str     r7, [sp, #0x28]
        str     r1, [sp, #0x1C]
        str     r4, [sp, #4]
        ldr     r4, [sp, #0x28]
        ldr     r1, [sp, #0x24]
        mov     lr, #0
        mov     r6, r5
        str     r7, [sp, #0x20]
        str     r8, [sp, #0x18]
        str     r9, [sp, #0x14]
        str     r10, [sp, #0x10]
        str     r11, [sp, #0xC]
        str     r0, [sp, #8]
        str     r5, [sp]
LDVA6:
        ldrsh   r8, [r4]
        ldrsh   r9, [r6]
        ldrsh   r5, [r4, #2]
        ldrsh   r7, [r6, #2]
        ldrsh   r0, [r4, #4]
        mla     r11, r9, r8, r2
        ldrsh   r2, [r6, #4]
        ldrsh   r8, [r4, #6]
        ldrsh   r9, [r6, #6]
        ldrsh   r10, [r4, #8]
        mla     r11, r7, r5, r11
        ldrsh   r5, [r6, #8]
        add     r4, r4, #0xA
        add     r6, r6, #0xA
        add     lr, lr, #5
        mla     r11, r2, r0, r11
        cmp     lr, r1
        mla     r11, r9, r8, r11
        mla     r2, r5, r10, r11
        ble     LDVA6
        ldr     r7, [sp, #0x20]
        ldr     r1, [sp, #0x1C]
        ldr     r8, [sp, #0x18]
        ldr     r9, [sp, #0x14]
        ldr     r10, [sp, #0x10]
        ldr     r11, [sp, #0xC]
        ldr     r0, [sp, #8]
        ldr     r4, [sp, #4]
        ldr     r5, [sp]
LDVA7:
        mov     r6, lr, lsl #1
        str     r6, [sp, #0x24]
        add     r6, r5, lr, lsl #1
        str     r5, [sp]
        ldr     r5, [sp, #0x24]
        str     r0, [sp, #8]
        str     r4, [sp, #4]
LDVA8:
        ldrsh   r4, [r7, +r5]
        ldrsh   r0, [r6], #2
        add     lr, lr, #1
        cmp     lr, r1
        mla     r2, r0, r4, r2
        add     r5, r5, #2
        blt     LDVA8
        ldr     r0, [sp, #8]
        ldr     r4, [sp, #4]
        ldr     r5, [sp]
LDVA9:
        ldrsh   lr, [r3], #2
        mov     r6, r2, lsl r0
        bic     r2, r6, #0xFF, 8
        bic     r2, r2, #0xFF, 16
        mul     r2, lr, r2
        mov     lr, lr, lsl #1
        mov     r6, r6, asr #16
        mul     lr, lr, r6
        mov     r2, r2, asr #15
        mov     r6, r2, asr #31
        adds    r2, lr, r2
        adc     lr, r6, lr, asr #31
        subs    r7, r2, r9
        sbcs    r6, lr, #0
        movlt   r7, #0
        movlt   r6, #0
        orrs    r6, r7, r6
        mvnne   r2, #2, 2
        bne     LDVA10
        cmp     r2, #2, 2
        sbcs    lr, lr, r11
        movlt   r2, #2, 2
LDVA10:
        cmp     r8, r2
        mvnle   r2, #0
        addle   r2, r2, #2, 18
        ble     LDVA11
        add     r2, r2, #2, 18
        mov     r2, r2, asr #16
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #16
LDVA11:
        add     r10, r10, #1
        cmp     r10, #0xA
        strh    r2, [r4, +r12]
        ble     LDVA5
        mov     r0, #0
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LDVA12:
        mov     r12, r10, lsl #1
        mov     lr, #0
        add     r7, r5, r12
        b       LDVA7
LDVA13:
        mvn     r0, #7
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
        .long   NormTable
        .long   NormTable2
        .long   LDVA_BinomWindowCoeffTbl_G723


        .data
        .align  4


LDVA_BinomWindowCoeffTbl_G723:
        .byte   0xFF,0x7F,0xED,0x7F,0xB7,0x7F,0x5C,0x7F,0xDD,0x7E,0x3B,0x7E,0x76,0x7D,0x8F,0x7C
        .byte   0x86,0x7B,0x5C,0x7A,0x13,0x79


