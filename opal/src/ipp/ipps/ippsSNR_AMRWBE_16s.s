        .text
        .align  4
        .globl  _ippsSNR_AMRWBE_16s


_ippsSNR_AMRWBE_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        ldr     r5, [sp, #0x38]
        mov     r11, r0
        cmp     r11, #0
        mov     r10, r1
        mov     r7, r2
        mov     r6, r3
        beq     LDDX21
        cmp     r10, #0
        beq     LDDX21
        cmp     r5, #0
        beq     LDDX21
        cmp     r7, #0
        ble     LDDX20
        cmp     r6, #0
        ble     LDDX20
        mov     r0, r7
        mov     r1, r6
        bl      __intel_imod
        cmp     r0, #0
        bne     LDDX20
        cmp     r7, #0
        mov     r9, #0
        movle   r4, r9
        ble     LDDX5
        mvn     r12, #0xFF
        bic     r12, r12, #0x7F, 24
        sub     r8, r12, #2, 2
        mov     r4, r9
        str     r5, [sp, #8]
        str     r10, [sp, #4]
        str     r11, [sp]
LDDX0:
        cmp     r6, #0
        mov     r5, #1
        movle   r0, r5
        ble     LDDX4
        mov     r0, r5
        mov     r11, r6
        ldr     r1, [sp, #4]
        ldr     r2, [sp]
LDDX1:
        ldrsh   r10, [r2]
        ldrsh   lr, [r1]
        mov     r12, r10, lsl #12
        mov     r12, r12, asr #15
        mov     r12, r12, lsl #16
        mov     lr, lr, lsl #13
        mov     r12, r12, asr #16
        mul     r12, r12, r12
        rsb     r10, lr, r10, lsl #13
        cmp     r8, r10
        add     r0, r0, r12, lsl #1
        ble     LDDX2
        add     r10, r10, #2, 18
        mov     r10, r10, asr #16
        mov     r10, r10, lsl #16
        mov     r10, r10, asr #16
        b       LDDX3
LDDX2:
        mvn     r12, #0xFF
        bic     r12, r12, #0x7F, 24
        mvn     r10, r12
LDDX3:
        mul     r12, r10, r10
        subs    r11, r11, #1
        add     r2, r2, #2
        add     r1, r1, #2
        add     r5, r5, r12, lsl #1
        bne     LDDX1
        str     r1, [sp, #4]
        str     r2, [sp]
LDDX4:
        add     r2, sp, #0x10
        add     r1, sp, #0xC
        bl      ownLog2
        ldrsh   r10, [sp, #0xC]
        ldrsh   r11, [sp, #0x10]
        add     r2, sp, #0x10
        add     r1, sp, #0xC
        mov     r0, r5
        bl      ownLog2
        ldrsh   lr, [sp, #0xC]
        ldrsh   r12, [sp, #0x10]
        mov     r5, #0x2A
        orr     r5, r5, #3, 20
        mul     r11, r11, r5
        mul     r10, r10, r5
        mul     lr, lr, r5
        mul     r5, r12, r5
        add     r9, r6, r9
        add     r11, r10, r11, asr #15
        cmp     r9, r7
        add     r4, r4, r11, lsl #1
        add     r5, lr, r5, asr #15
        sub     r4, r4, r5, lsl #1
        blt     LDDX0
        ldr     r5, [sp, #8]
LDDX5:
        mov     r0, r7, lsl #16
        ldr     r7, [pc, #0x24C]
        ldr     lr, [pc, #0x24C]
        mov     r1, r6, lsl #16
        mov     r0, r0, asr #16
        mov     r6, r0
        mov     r3, r1, asr #16
        cmn     r6, #1
        mov     r1, #0
        mov     r2, #0xF
        moveq   r0, r2
        beq     LDDX7
        cmp     r6, #0
        moveq   r0, r1
        beq     LDDX7
        cmp     r6, #0
        blt     LDDX18
LDDX6:
        bic     r0, r0, #0xFF, 8
        bic     r0, r0, #0xFF, 16
        movs    r12, r0, asr #8
        movne   r12, r12, lsl #1
        ldrnesh r0, [lr, +r12]
        moveq   r0, r0, lsl #1
        ldreqsh r0, [r7, +r0]
LDDX7:
        mov     r12, r3
        cmn     r12, #1
        moveq   r3, r2
        beq     LDDX9
        cmp     r12, #0
        moveq   r3, r1
        beq     LDDX9
        cmp     r12, #0
        blt     LDDX19
LDDX8:
        bic     r3, r3, #0xFF, 8
        bic     r3, r3, #0xFF, 16
        movs    r8, r3, asr #8
        movne   r8, r8, lsl #1
        ldrnesh r3, [lr, +r8]
        moveq   r3, r3, lsl #1
        ldreqsh r3, [r7, +r3]
LDDX9:
        sub     r3, r3, #1
        mov     r6, r6, lsl r0
        mov     r3, r3, lsl #16
        mov     lr, r6, lsl #16
        mov     r3, r3, asr #16
        mov     r12, r12, lsl r3
        mov     r6, lr, asr #16
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        cmp     r12, r6
        bgt     LDDX14
        cmp     r12, #0
        blt     LDDX14
        cmp     r6, #0
        blt     LDDX14
        cmp     r6, #0
        beq     LDDX14
        cmp     r12, #0
        beq     LDDX14
        mvn     lr, #0xFF
        cmp     r12, r6
        bic     lr, lr, #0x7F, 24
        mvneq   r1, lr
        beq     LDDX14
        mvn     lr, lr
        mvn     r9, #2, 2
        mvn     r8, #0
LDDX10:
        mov     r1, r1, lsl #1
        mov     r12, r12, lsl #1
        mov     r1, r1, lsl #16
        cmp     r12, r6
        mov     r1, r1, asr #16
        blt     LDDX13
        mov     r7, r12, asr #31
        subs    r12, r12, r6
        sbc     r7, r7, r6, asr #31
        subs    r10, r12, r9
        sbcs    r11, r7, #0
        movlt   r10, #0
        movlt   r11, #0
        orrs    r11, r10, r11
        mvnne   r12, #2, 2
        bne     LDDX11
        cmp     r12, #2, 2
        sbcs    r7, r7, r8
        movlt   r12, #2, 2
LDDX11:
        add     r1, r1, #1
        cmp     lr, r1
        blt     LDDX12
        cmn     r1, #2, 18
        movge   r1, r1, lsl #16
        movge   r1, r1, asr #16
        mvnlt   r1, #0xFF
        biclt   r1, r1, #0x7F, 24
        b       LDDX13
LDDX12:
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r1, r1
LDDX13:
        subs    r2, r2, #1
        bne     LDDX10
LDDX14:
        sub     r0, r0, r3
        add     r0, r0, #0xB
        bic     r0, r0, #0xFF, 8
        bic     r2, r0, #0xFF, 16
        mvn     r0, #2, 2
        cmp     r4, r0, asr r2
        mov     r3, #2, 2
        bgt     LDDX15
        cmp     r4, r3, asr r2
        movge   r0, r4, lsl r2
        movlt   r0, #2, 2
LDDX15:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        sub     r2, r2, #2, 2
        cmp     r2, r0
        ble     LDDX16
        add     r0, r0, #2, 18
        mov     r0, r0, asr #16
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LDDX17
LDDX16:
        mov     r0, #0
        sub     r0, r0, #2, 18
        mvn     r0, r0
LDDX17:
        mul     r1, r1, r0
        mvn     r0, #3
        bic     r0, r0, #0x63, 24
        mov     r1, r1, asr #15
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        cmp     r1, r0
        movgt   r0, r1
        strh    r0, [r5]
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LDDX18:
        mvn     r0, r6
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LDDX6
LDDX19:
        mvn     r3, r12
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
        b       LDDX8
LDDX20:
        mvn     r0, #5
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LDDX21:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
        .long   NormTable2
        .long   NormTable


