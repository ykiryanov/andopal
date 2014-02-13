        .text
        .align  4
        .globl  _ippsGainControl_G729_16s_I


_ippsGainControl_G729_16s_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xE8
        add     r3, sp, #0x74
        and     lr, r3, #0x1F
        mov     r4, sp
        rsb     r6, lr, #0
        and     r4, r4, #0x1F
        rsb     lr, r4, #0
        add     r12, sp, #0x74
        mov     r3, sp
        and     r6, r6, #0x1F
        and     r10, lr, #0x1F
        cmp     r0, #0
        add     r4, r12, r6
        mov     r5, r1
        mov     r7, r2
        add     r8, r3, r10
        beq     LDVR13
        cmp     r5, #0
        beq     LDVR13
        cmp     r7, #0
        beq     LDVR13
        mov     r1, r4
        mov     r2, #0x28
        bl      _ippsAbs_16s
        add     r2, sp, #0xE4
        mov     r3, #0
        mov     r1, #0x28
        mov     r0, r4
        bl      _ippsSum_16s32s_Sfs
        ldr     r3, [sp, #0xE4]
        mov     r11, #0
        cmp     r3, #0
        beq     LDVR10
        ldr     r6, [pc, #0x2B0]
        cmp     r3, #0
        beq     LDVR2
        movs    r12, r3, asr #16
        bne     LDVR0
        bic     r12, r3, #0xFF, 8
        bic     r12, r12, #0xFF, 16
        movs    lr, r12, asr #8
        movne   r12, lr, lsl #1
        ldrne   lr, [pc, #0x290]
        moveq   r12, r12, lsl #1
        moveq   lr, r6
        ldrsh   r12, [lr, +r12]
        add     r12, r12, #0x10
        mov     r12, r12, lsl #16
        mov     r11, r12, asr #16
        b       LDVR1
LDVR0:
        bic     r12, r12, #0xFF, 8
        bic     r12, r12, #0xFF, 16
        movs    lr, r12, asr #8
        moveq   r12, r12, lsl #1
        ldreqsh r11, [r6, +r12]
        beq     LDVR1
        mov     r12, lr, lsl #1
        ldr     lr, [pc, #0x254]
        ldrsh   r11, [lr, +r12]
LDVR1:
        mov     r3, r3, lsl r11
        str     r3, [sp, #0xE4]
LDVR2:
        mov     r3, r3, asr #16
        mov     r2, #0x28
        mov     r3, r3, lsl #16
        mov     r1, r4
        mov     r0, r5
        mov     r9, r3, asr #16
        bl      _ippsAbs_16s
        add     r2, sp, #0xE4
        mov     r0, r4
        mov     r3, #0
        mov     r1, #0x28
        bl      _ippsSum_16s32s_Sfs
        ldr     r3, [sp, #0xE4]
        mov     r12, #0
        cmp     r3, #0
        bne     LDVR3
        mov     r0, #0
        strh    r12, [r7]
        add     sp, sp, #0xE8
        ldmia   sp!, {r4 - r11, pc}
LDVR3:
        cmp     r3, #0
        beq     LDVR6
        movs    r12, r3, asr #16
        bne     LDVR4
        bic     r12, r3, #0xFF, 8
        bic     r12, r12, #0xFF, 16
        movs    lr, r12, asr #8
        ldrne   r6, [pc, #0x1D8]
        movne   r12, lr, lsl #1
        moveq   r12, r12, lsl #1
        ldrsh   r12, [r6, +r12]
        add     r12, r12, #0x10
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        b       LDVR5
LDVR4:
        bic     r12, r12, #0xFF, 8
        bic     r12, r12, #0xFF, 16
        movs    lr, r12, asr #8
        moveq   r12, r12, lsl #1
        ldreqsh r12, [r6, +r12]
        beq     LDVR5
        ldr     r12, [pc, #0x1A0]
        mov     lr, lr, lsl #1
        ldrsh   r12, [r12, +lr]
LDVR5:
        mov     r3, r3, lsl r12
        str     r3, [sp, #0xE4]
LDVR6:
        mov     r3, r3, asr #16
        sub     r11, r11, r12
        mov     r3, r3, lsl #16
        add     r12, r11, #1
        mov     r3, r3, asr #16
        mov     r12, r12, lsl #16
        cmp     r9, r3
        mov     r4, r12, asr #16
        mov     r1, r3
        bge     LDVR7
        mov     r0, r9, lsl #15
        bl      __intel_idiv
        b       LDVR8
LDVR7:
        sub     r9, r9, r3
        sub     r4, r4, #1
        mov     r3, r9, lsl #16
        mov     r4, r4, lsl #16
        mov     r0, r3, asr #1
        bl      __intel_idiv
        mov     r4, r4, asr #16
        mov     r0, r0, asr #1
        add     r0, r0, #1, 18
LDVR8:
        mov     r0, r0, lsl #16
        cmp     r4, #0
        mov     r3, r0, asr #16
        ble     LDVR12
        mov     r4, r3, asr r4
        mov     r3, r4, lsl #16
        mov     r12, r3, asr #16
LDVR9:
        mov     r3, #0x9A
        orr     r3, r3, #1, 24
        mul     r3, r12, r3
        add     r3, r3, #1, 18
        mov     r3, r3, asr #15
        mov     r3, r3, lsl #16
        mov     r11, r3, asr #16
LDVR10:
        ldrsh   r3, [r7]
        mov     r12, sp
        mov     lr, #0x66
        strh    r3, [r10, +r12]
        add     r0, r8, #2
        orr     r3, lr, #0x7E, 24
        mov     r4, #0
        mov     lr, r8
        mov     r12, r0
LDVR11:
        ldrsh   r6, [lr]
        add     r4, r4, #4
        cmp     r4, #0x28
        mul     r6, r6, r3
        add     r6, r6, #1, 18
        add     r6, r11, r6, asr #15
        strh    r6, [r12]
        ldrsh   r6, [lr, #2]
        mul     r6, r6, r3
        add     r6, r6, #1, 18
        add     r6, r11, r6, asr #15
        strh    r6, [r12, #2]
        ldrsh   r6, [lr, #4]
        mul     r6, r6, r3
        add     r6, r6, #1, 18
        add     r6, r11, r6, asr #15
        strh    r6, [r12, #4]
        ldrsh   r6, [lr, #6]
        add     lr, lr, #8
        mul     r6, r6, r3
        add     r6, r6, #1, 18
        add     r6, r11, r6, asr #15
        strh    r6, [r12, #6]
        add     r12, r12, #8
        blt     LDVR11
        mov     r1, r5
        mov     r3, #0xE
        mov     r2, #0x28
        bl      _ippsMul_NR_16s_ISfs
        ldrsh   r8, [r8, #0x50]
        mov     r0, #0
        strh    r8, [r7]
        add     sp, sp, #0xE8
        ldmia   sp!, {r4 - r11, pc}
LDVR12:
        rsb     r4, r4, #0
        mvn     r12, #0xFF
        bic     lr, r4, #0xFF, 8
        bic     r12, r12, #0x7F, 24
        mvn     r4, r12
        bic     lr, lr, #0xFF, 16
        cmp     r3, r4, asr lr
        mov     r6, #0
        sub     r4, r6, #2, 18
        subgt   r6, r6, #2, 18
        mvngt   r12, r6
        bgt     LDVR9
        cmp     r3, r4, asr lr
        blt     LDVR9
        mov     lr, r3, lsl lr
        mov     r3, lr, lsl #16
        mov     r12, r3, asr #16
        b       LDVR9
LDVR13:
        mvn     r0, #7
        add     sp, sp, #0xE8
        ldmia   sp!, {r4 - r11, pc}
        .long   NormTable2
        .long   NormTable


