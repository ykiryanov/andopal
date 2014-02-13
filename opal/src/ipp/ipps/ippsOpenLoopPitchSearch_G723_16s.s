        .text
        .align  4
        .globl  _ippsOpenLoopPitchSearch_G723_16s


_ippsOpenLoopPitchSearch_G723_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x58
        sub     sp, sp, #2, 22
        add     r12, sp, #1, 22
        add     r2, sp, #1, 22
        add     r12, r12, #0xD3, 30
        add     r2, r2, #0x4D, 30
        add     r3, sp, #0x19, 26
        and     r5, r12, #0xF
        and     lr, r2, #0xF
        and     r4, r3, #0xF
        add     r12, sp, #1, 22
        add     r2, sp, #1, 22
        rsb     r5, r5, #0
        rsb     r4, r4, #0
        rsb     lr, lr, #0
        mov     r6, r0
        add     r12, r12, #0xD3, 30
        add     r3, sp, #0x19, 26
        add     r2, r2, #0x4D, 30
        and     r5, r5, #0xF
        and     r4, r4, #0xF
        and     lr, lr, #0xF
        cmp     r6, #0
        add     r10, r12, r5
        add     r8, r3, r4
        add     r7, r2, lr
        mov     r9, r1
        beq     LDVJ3
        cmp     r9, #0
        beq     LDVJ3
        add     r4, sp, #0x22, 28
        and     r4, r4, #0x1F
        add     lr, sp, #1, 22
        rsb     r4, r4, #0
        add     r5, sp, #0xC
        add     lr, lr, #0x34
        and     r4, r4, #0x1F
        add     r12, sp, #0x22, 28
        and     r5, r5, #0x1F
        and     lr, lr, #0xF
        add     r4, r12, r4
        rsb     r5, r5, #0
        add     r12, sp, #1, 22
        rsb     lr, lr, #0
        add     r11, sp, #0xC
        and     r5, r5, #0x1F
        sub     r0, r6, #0x47, 30
        add     r12, r12, #0x34
        and     lr, lr, #0xF
        add     r5, r11, r5
        add     r11, r12, lr
        mov     r2, r4
        mov     r1, #0x78
        mov     r3, #0x7D
        bl      ownEnergy_16s32s
        mov     r0, r6
        mov     r2, #0x78
        mov     r1, r11
        bl      _ippsCopy_16s
        sub     r1, r6, #0x24
        mov     r6, #0x7D
        str     r6, [sp]
        mov     r3, r5
        mov     r0, r11
        mov     r2, #0x78
        bl      _ippsCrossCorr_Inv_16s32s
        str     r6, [sp, #4]
        str     r10, [sp]
        mov     r0, r4
        mov     r1, r5
        mov     r3, r8
        mov     r2, r7
        bl      ownNormCrossPos_NR_32s16s
        mov     r0, #0xFF
        mov     r4, #0
        orr     r0, r0, #0x7F, 24
        mov     r5, r4
        mov     lr, #0x1E
        mov     r12, #1, 18
        str     r9, [sp, #8]
LDVJ0:
        ldrsh   r2, [r10], #2
        cmp     lr, r2
        blt     LDVJ2
        ldrsh   r11, [r8]
        sub     r1, lr, r2
        cmp     r1, #1
        ldrgtsh r9, [r7]
        bgt     LDVJ1
        mul     r6, r0, r11
        ldrsh   r9, [r7]
        mov     r1, r12, asr r1
        mul     r1, r9, r1
        cmp     r6, r1
        ble     LDVJ2
        mov     r3, r5, lsl #16
        sub     r3, r4, r3, asr #16
        cmp     r3, #0x12
        sub     r6, r6, r6, asr #2
        blt     LDVJ1
        cmp     r6, r1
        ble     LDVJ2
LDVJ1:
        mov     lr, r2
        mov     r12, r11
        mov     r0, r9
        mov     r5, r4
LDVJ2:
        add     r4, r4, #1
        cmp     r4, #0x7D
        add     r8, r8, #2
        add     r7, r7, #2
        blt     LDVJ0
        ldr     r9, [sp, #8]
        add     sp, sp, #0x58
        add     r5, r5, #0x12
        mov     r0, #0
        strh    r5, [r9]
        add     sp, sp, #2, 22
        ldmia   sp!, {r4 - r11, pc}
LDVJ3:
        add     sp, sp, #0x58
        mvn     r0, #7
        add     sp, sp, #2, 22
        ldmia   sp!, {r4 - r11, pc}


