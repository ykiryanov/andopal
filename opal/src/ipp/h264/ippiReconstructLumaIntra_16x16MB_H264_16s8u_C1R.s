        .text
        .align  4
        .globl  _ippiReconstructLumaIntra_16x16MB_H264_16s8u_C1R


_ippiReconstructLumaIntra_16x16MB_H264_16s8u_C1R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x88
        ldr     r6, [sp, #0xB4]
        ldr     r5, [sp, #0xAC]
        ldr     r4, [sp, #0xB0]
        ldr     lr, [sp, #0xB8]
        ldr     r12, [sp, #0xBC]
        and     r8, r6, #4
        and     r7, r6, #1
        cmp     r0, #0
        and     r6, r6, #0x10
        beq     LKWC55
        cmp     r1, #0
        beq     LKWC55
        ldr     r9, [r0]
        cmp     r9, #0
        beq     LKWC55
        cmp     lr, #0
        beq     LKWC55
        cmp     r4, #0x33
        bhi     LKWC0
        subs    r9, r3, #3
        mov     r3, #0
        beq     LKWC48
        adds    r9, r9, #1
        beq     LKWC39
        adds    r9, r9, #1
        mov     r6, #0x10
        beq     LKWC35
        adds    r9, r9, #1
        beq     LKWC1
LKWC0:
        mvn     r0, #0xA
        add     sp, sp, #0x88
        ldmia   sp!, {r4 - r11, pc}
LKWC1:
        cmp     r8, #0
        beq     LKWC2
        mvn     r0, #0x74
        add     sp, sp, #0x88
        ldmia   sp!, {r4 - r11, pc}
LKWC2:
        sub     r8, r1, r2
        mov     r7, r1
LKWC3:
        mov     r11, r8
        mov     r10, r3
LKWC4:
        ldrb    r9, [r11], #1
        strb    r9, [r7, +r10]
        add     r10, r10, #1
        cmp     r10, #0x10
        blt     LKWC4
        subs    r6, r6, #1
        add     r7, r2, r7
        bne     LKWC3
LKWC5:
        mvn     r3, #0xFE, 16
        bic     r3, r3, #0xFF, 8
        tst     r5, r3
        beq     LKWC30
        ldr     r6, [pc, #0xA74]
        tst     r5, #1
        beq     LKWC12
        ldr     r6, [r0]
        cmp     r12, #0
        add     r3, r6, #0x20
        str     r3, [r0]
        beq     LKWC6
        cmp     r4, #0
        bls     LKWC12
LKWC6:
        add     r7, sp, #0x78
        add     r8, sp, #0x78
        str     r6, [r7]
        add     r10, r6, #8
        str     r10, [r8, #4]
        add     r3, sp, #0x78
        add     r7, sp, #0x78
        add     r9, r6, #0x10
        add     r8, r6, #0x18
        str     r9, [r3, #8]
        str     r8, [r7, #0xC]
        mov     r7, r6
        mov     r3, #4
        str     r5, [sp, #8]
        str     r2, [sp, #0x14]
        str     r1, [sp, #0xC]
        str     r0, [sp, #0x10]
LKWC7:
        ldrsh   r2, [r8]
        ldrsh   r5, [r9]
        ldrsh   r11, [r7]
        ldrsh   r1, [r10]
        subs    r3, r3, #1
        add     r0, r5, r2
        sub     r2, r5, r2
        add     r5, r11, r1
        mov     r0, r0, lsl #16
        sub     r1, r11, r1
        mov     r5, r5, lsl #16
        mov     r0, r0, asr #16
        mov     r2, r2, lsl #16
        add     r11, r0, r5, asr #16
        strh    r11, [r7], #2
        rsb     r5, r0, r5, asr #16
        mov     r1, r1, lsl #16
        mov     r2, r2, asr #16
        strh    r5, [r10], #2
        rsb     r0, r2, r1, asr #16
        strh    r0, [r9], #2
        add     r1, r2, r1, asr #16
        strh    r1, [r8], #2
        bne     LKWC7
        ldr     r0, [sp, #0x10]
        ldr     r5, [sp, #8]
        ldr     r2, [sp, #0x14]
        ldr     r1, [sp, #0xC]
        mov     r3, #0
        str     r0, [sp, #0x10]
LKWC8:
        add     r0, sp, #0x78
        ldr     r7, [r0, +r3, lsl #2]
        add     r3, r3, #1
        cmp     r3, #4
        ldrsh   r9, [r7, #4]
        ldrsh   r10, [r7, #6]
        ldrsh   r11, [r7]
        ldrsh   r8, [r7, #2]
        add     r0, r9, r10
        sub     r9, r9, r10
        mov     r10, r0, lsl #16
        mov     r0, r9, lsl #16
        add     r9, r11, r8
        sub     r8, r11, r8
        mov     r10, r10, asr #16
        mov     r9, r9, lsl #16
        mov     r8, r8, lsl #16
        mov     r0, r0, asr #16
        add     r11, r10, r9, asr #16
        rsb     r9, r10, r9, asr #16
        strh    r9, [r7, #2]
        rsb     r9, r0, r8, asr #16
        add     r8, r0, r8, asr #16
        strh    r11, [r7]
        strh    r9, [r7, #4]
        strh    r8, [r7, #6]
        blt     LKWC8
        ldr     r7, [pc, #0x928]
        ldr     r0, [sp, #0x10]
        cmp     r4, #0x24
        sub     r7, r7, #2, 2
        umull   r7, r8, r4, r7
        mov     r3, #0x10
        mov     r7, r8, lsr #2
        bcc     LKWC10
        sub     r7, r7, #6
        mov     r8, r6
LKWC9:
        ldrsh   r9, [r8]
        ldrsh   r10, [lr]
        subs    r3, r3, #1
        mul     r9, r10, r9
        mov     r9, r9, lsl r7
        strh    r9, [r8], #2
        bne     LKWC9
        b       LKWC12
LKWC10:
        rsb     r8, r7, #5
        mov     r9, #1
        mov     r8, r9, lsl r8
        rsb     r7, r7, #6
        mov     r9, r6
LKWC11:
        ldrsh   r10, [r9]
        ldrsh   r11, [lr]
        subs    r3, r3, #1
        mla     r10, r11, r10, r8
        mov     r10, r10, asr r7
        strh    r10, [r9], #2
        bne     LKWC11
LKWC12:
        ldr     r3, [pc, #0x8B4]
        ldr     r7, [pc, #0x8B4]
        mov     r8, r4, lsl #16
        str     r3, [sp, #0x38]
        mov     r3, #0
        mov     r11, #0x10
        str     r3, [sp, #0x40]
        str     r11, [sp, #0x34]
        str     lr, [sp]
        str     r4, [sp, #4]
        str     r0, [sp, #0x10]
        ldr     r0, [sp, #0x34]
        ldr     lr, [sp, #0x38]
        ldr     r4, [sp, #0x40]
        mov     r10, r8, asr #16
        mov     r9, #2
        mvn     r8, #0xFF
        str     r10, [sp, #0x44]
        str     r6, [sp, #0x48]
        str     r5, [sp, #8]
LKWC13:
        ldrb    r5, [r7], #1
        ldr     r6, [sp, #0x48]
        mov     r5, r5, lsl #1
        ldrsh   r5, [r6, +r5]
        cmp     r5, #0
        addne   r3, sp, #0x74
        ldr     r6, [sp, #8]
        tst     r6, r9
        beq     LKWC14
        ldr     r6, [sp, #0x10]
        ldr     r4, [r6]
        add     r10, r4, #0x20
        str     r10, [r6]
LKWC14:
        cmp     r4, #0
        beq     LKWC31
        cmp     r3, #0
        moveq   r5, #0
        strneh  r5, [sp, #0x74]
        ldrnesh r5, [r3]
        strh    r5, [r4]
        ldr     r6, [pc, #0x810]
        ldr     r5, [sp, #0x44]
        cmp     r12, #0
        smull   r6, r10, r5, r6
        sub     r5, r10, r5, asr #31
        beq     LKWC15
        ldr     r6, [sp, #4]
        cmp     r6, #0
        movls   r10, #0
        bls     LKWC20
LKWC15:
        rsb     r6, r5, #3
        str     r6, [sp, #0x2C]
        sub     r6, r5, #4
        str     r6, [sp, #0x30]
        ldr     r6, [sp, #0x2C]
        mov     r11, #1
        mov     r10, #0
        mov     r6, r11, lsl r6
        str     r6, [sp, #0x2C]
        mov     r6, #2
        str     r6, [sp, #0x24]
        ldr     r6, [sp]
        ldr     r11, [sp, #4]
        rsb     r5, r5, #4
        add     r6, r6, #2
        str     r6, [sp, #0x28]
        str     r3, [sp, #0x20]
        str     r9, [sp, #0x1C]
        str     r12, [sp, #0x18]
        str     r2, [sp, #0x14]
        ldr     r2, [sp, #0x28]
        ldr     r3, [sp, #0x24]
        ldr     r12, [sp, #0x2C]
        ldr     r9, [sp, #0x30]
        mov     r6, #0xF
        str     r1, [sp, #0xC]
LKWC16:
        ldrsh   r1, [r4, +r3]
        cmp     r1, #0
        beq     LKWC19
        cmp     r11, #0x18
        bcs     LKWC17
        ldrsh   r10, [r2]
        mla     r10, r1, r10, r12
        mov     r10, r10, asr r5
        b       LKWC18
LKWC17:
        ldrsh   r10, [r2]
        mul     r10, r1, r10
        mov     r10, r10, lsl r9
LKWC18:
        strh    r10, [r4, +r3]
        mov     r10, #1
LKWC19:
        subs    r6, r6, #1
        add     r3, r3, #2
        add     r2, r2, #2
        bne     LKWC16
        ldr     r3, [sp, #0x20]
        ldr     r9, [sp, #0x1C]
        ldr     r12, [sp, #0x18]
        ldr     r2, [sp, #0x14]
        ldr     r1, [sp, #0xC]
LKWC20:
        cmp     r10, #0
        bne     LKWC21
        ldr     r5, [sp, #4]
        cmp     r5, #0
        bne     LKWC27
        cmp     r12, #0
        beq     LKWC27
LKWC21:
        add     r10, sp, #0x78
        str     r4, [r10]
        add     r10, sp, #0x78
        add     r6, r4, #8
        str     r6, [r10, #4]
        add     r10, sp, #0x78
        add     r5, r4, #0x10
        str     r5, [r10, #8]
        add     r3, r4, #0x18
        add     r10, sp, #0x78
        cmp     r12, #0
        str     r3, [r10, #0xC]
        beq     LKWC22
        ldr     r10, [sp, #4]
        cmp     r10, #0
        bls     LKWC25
LKWC22:
        mov     r10, #0
        str     r8, [sp, #0x3C]
        str     r4, [sp, #0x40]
        str     r9, [sp, #0x1C]
        str     r12, [sp, #0x18]
        str     r2, [sp, #0x14]
        str     r1, [sp, #0xC]
LKWC23:
        add     r1, sp, #0x78
        ldr     r12, [r1, +r10, lsl #2]
        add     r10, r10, #1
        cmp     r10, #3
        ldrsh   r2, [r12, #2]
        ldrsh   r4, [r12, #6]
        ldrsh   r8, [r12]
        ldrsh   r9, [r12, #4]
        rsb     r1, r4, r2, asr #1
        add     r2, r2, r4, asr #1
        add     r4, r8, r9
        sub     r8, r8, r9
        mov     r1, r1, lsl #16
        mov     r2, r2, lsl #16
        mov     r4, r4, lsl #16
        mov     r8, r8, lsl #16
        mov     r1, r1, asr #16
        mov     r2, r2, asr #16
        add     r11, r2, r4, asr #16
        add     r9, r1, r8, asr #16
        rsb     r8, r1, r8, asr #16
        rsb     r4, r2, r4, asr #16
        strh    r11, [r12]
        strh    r9, [r12, #2]
        strh    r8, [r12, #4]
        strh    r4, [r12, #6]
        ble     LKWC23
        ldr     r12, [sp, #0x18]
        ldr     r2, [sp, #0x14]
        ldr     r8, [sp, #0x3C]
        ldr     r4, [sp, #0x40]
        ldr     r9, [sp, #0x1C]
        ldr     r1, [sp, #0xC]
        mov     r10, #0
        str     r10, [sp, #0x20]
        mov     r10, #4
        str     r10, [sp, #0x30]
        str     r12, [sp, #0x18]
        str     r2, [sp, #0x14]
        ldr     r2, [sp, #0x30]
        ldr     r12, [sp, #0x20]
        str     lr, [sp, #0x38]
        str     r8, [sp, #0x3C]
        str     r9, [sp, #0x1C]
        str     r1, [sp, #0xC]
LKWC24:
        ldrsh   r1, [r6]
        ldrsh   r8, [r3]
        ldrsh   r9, [r4, +r12]
        ldrsh   r10, [r5]
        subs    r2, r2, #1
        add     lr, r1, r8, asr #1
        rsb     r1, r8, r1, asr #1
        add     r8, r9, r10
        sub     r9, r9, r10
        mov     lr, lr, lsl #16
        mov     r1, r1, lsl #16
        mov     r11, r9, lsl #16
        mov     r8, r8, lsl #16
        mov     lr, lr, asr #16
        mov     r10, r1, asr #16
        add     r9, lr, r8, asr #16
        add     r1, r9, #0x20
        add     r9, r10, r11, asr #16
        add     r9, r9, #0x20
        mov     r1, r1, asr #6
        strh    r1, [r4, +r12]
        rsb     r11, r10, r11, asr #16
        add     r1, r11, #0x20
        mov     r9, r9, asr #6
        strh    r9, [r6], #2
        mov     r1, r1, asr #6
        rsb     r8, lr, r8, asr #16
        strh    r1, [r5], #2
        add     r8, r8, #0x20
        mov     r1, r8, asr #6
        strh    r1, [r3], #2
        add     r12, r12, #2
        bne     LKWC24
        ldr     lr, [sp, #0x38]
        ldr     r8, [sp, #0x3C]
        ldr     r9, [sp, #0x1C]
        ldr     r12, [sp, #0x18]
        ldr     r2, [sp, #0x14]
        ldr     r1, [sp, #0xC]
LKWC25:
        mov     r4, r1
        str     r9, [sp, #0x1C]
        ldr     r9, [pc, #0x560]
        mov     r3, #0
        str     r0, [sp, #0x34]
        str     lr, [sp, #0x38]
        str     r12, [sp, #0x18]
        str     r1, [sp, #0xC]
        mov     r6, #1, 24
LKWC26:
        add     r0, sp, #0x78
        ldr     r0, [r0, +r3, lsl #2]
        ldrb    r1, [r4]
        ldrb    r12, [r4, #1]
        ldrsh   r10, [r0]
        ldrb    lr, [r4, #2]
        ldrb    r5, [r4, #3]
        mov     r11, r8
        cmp     r10, r8
        movgt   r11, r10
        cmp     r11, #1, 24
        movgt   r11, r6
        add     r11, r9, r11
        add     r1, r11, r1
        ldrb    r1, [r1, #0x100]
        add     r3, r3, #1
        mov     r10, r8
        strb    r1, [r4]
        ldrsh   r1, [r0, #2]
        cmp     r1, r8
        movgt   r10, r1
        cmp     r10, #1, 24
        movgt   r10, r6
        add     r10, r9, r10
        add     r12, r10, r12
        ldrb    r1, [r12, #0x100]
        mov     r12, r8
        strb    r1, [r4, #1]
        ldrsh   r1, [r0, #4]
        cmp     r1, r8
        movgt   r12, r1
        cmp     r12, #1, 24
        movgt   r12, r6
        add     r12, r9, r12
        add     lr, r12, lr
        ldrb    r1, [lr, #0x100]
        strb    r1, [r4, #2]
        ldrsh   r0, [r0, #6]
        mov     r1, r8
        cmp     r0, r8
        movgt   r1, r0
        cmp     r1, #1, 24
        movgt   r1, r6
        add     r1, r9, r1
        add     r5, r1, r5
        ldrb    r0, [r5, #0x100]
        cmp     r3, #4
        strb    r0, [r4, #3]
        add     r4, r2, r4
        blt     LKWC26
        ldr     r0, [sp, #0x34]
        ldr     lr, [sp, #0x38]
        ldr     r9, [sp, #0x1C]
        ldr     r12, [sp, #0x18]
        ldr     r1, [sp, #0xC]
        mov     r3, #0
        mov     r4, r3
        b       LKWC29
LKWC27:
        ldrsh   r5, [r4]
        str     r1, [sp, #0x30]
        add     r5, r5, #0x20
        ldr     r11, [sp, #0x30]
        mov     r5, r5, asr #6
        mov     r6, #4
        str     r6, [sp, #0x2C]
        mov     r5, r5, lsl #16
        ldr     r10, [sp, #0x2C]
        mov     r6, r5, asr #16
        cmp     r6, r8
        mov     r5, r8
        movgt   r5, r6
        cmp     r5, #1, 24
        mov     r6, #1, 24
        movgt   r5, r6
        ldr     r6, [pc, #0x41C]
        str     r9, [sp, #0x1C]
        str     r12, [sp, #0x18]
        add     r5, r6, r5
        str     r1, [sp, #0xC]
LKWC28:
        ldrb    r12, [r11]
        ldrb    r1, [r11, #1]
        ldrb    r6, [r11, #2]
        ldrb    r9, [r11, #3]
        add     r12, r5, r12
        ldrb    r12, [r12, #0x100]
        add     r1, r5, r1
        ldrb    r1, [r1, #0x100]
        add     r6, r5, r6
        ldrb    r6, [r6, #0x100]
        add     r9, r5, r9
        ldrb    r9, [r9, #0x100]
        strb    r12, [r11]
        strb    r1, [r11, #1]
        strb    r6, [r11, #2]
        strb    r9, [r11, #3]
        subs    r10, r10, #1
        add     r11, r2, r11
        bne     LKWC28
        ldr     r9, [sp, #0x1C]
        ldr     r12, [sp, #0x18]
        ldr     r1, [sp, #0xC]
LKWC29:
        ldrsb   r6, [lr, #1]
        ldrsb   r5, [lr, #2]!
        add     r6, r1, r6
        subs    r0, r0, #1
        mla     r1, r2, r5, r6
        mov     r9, r9, lsl #1
        bne     LKWC13
LKWC30:
        mov     r0, #0
        add     sp, sp, #0x88
        ldmia   sp!, {r4 - r11, pc}
LKWC31:
        cmp     r3, #0
        beq     LKWC29
        ldr     r10, [sp, #4]
        str     r1, [sp, #0x30]
        cmp     r10, #0
        strh    r5, [sp, #0x74]
        bne     LKWC32
        cmp     r12, #0
        beq     LKWC32
        ldrsh   r6, [r3]
        ldrb    r3, [r1]
        mov     r5, r8
        cmp     r6, r8
        movgt   r5, r6
        cmp     r5, #1, 24
        mov     r6, #1, 24
        movgt   r5, r6
        ldr     r6, [pc, #0x344]
        add     r5, r6, r5
        add     r3, r5, r3
        ldrb    r3, [r3, #0x100]
        strb    r3, [r1]
        b       LKWC34
LKWC32:
        ldrsh   r3, [r3]
        ldr     r11, [sp, #0x30]
        mov     r5, #4
        add     r3, r3, #0x20
        str     r5, [sp, #0x2C]
        ldr     r10, [sp, #0x2C]
        mov     r3, r3, asr #6
        str     r12, [sp, #0x18]
        str     r1, [sp, #0xC]
        mov     r3, r3, lsl #16
        mov     r5, r3, asr #16
        cmp     r5, r8
        mov     r3, r8
        movgt   r3, r5
        cmp     r3, #1, 24
        mov     r5, #1, 24
        movgt   r3, r5
        ldr     r5, [pc, #0x2E8]
        add     r3, r5, r3
LKWC33:
        ldrb    r12, [r11]
        ldrb    r1, [r11, #1]
        ldrb    r5, [r11, #2]
        ldrb    r6, [r11, #3]
        add     r12, r3, r12
        ldrb    r12, [r12, #0x100]
        add     r1, r3, r1
        ldrb    r1, [r1, #0x100]
        add     r5, r3, r5
        ldrb    r5, [r5, #0x100]
        add     r6, r3, r6
        ldrb    r6, [r6, #0x100]
        strb    r12, [r11]
        strb    r1, [r11, #1]
        strb    r5, [r11, #2]
        strb    r6, [r11, #3]
        subs    r10, r10, #1
        add     r11, r2, r11
        bne     LKWC33
        ldr     r12, [sp, #0x18]
        ldr     r1, [sp, #0xC]
LKWC34:
        mov     r3, #0
        b       LKWC29
LKWC35:
        cmp     r7, #0
        beq     LKWC36
        mvn     r0, #0x74
        add     sp, sp, #0x88
        ldmia   sp!, {r4 - r11, pc}
LKWC36:
        mov     r7, r1
LKWC37:
        mov     r9, r3
LKWC38:
        ldrb    r8, [r7, #-1]
        strb    r8, [r7, +r9]
        add     r9, r9, #1
        cmp     r9, #0x10
        blt     LKWC38
        subs    r6, r6, #1
        add     r7, r2, r7
        bne     LKWC37
        b       LKWC5
LKWC39:
        cmp     r8, #0
        mov     r8, #0x10
        mov     r6, r1
        bne     LKWC43
        cmp     r7, #0
        sub     r9, r1, r2
        beq     LKWC41
LKWC40:
        ldrb    r7, [r9], #1
        subs    r8, r8, #1
        add     r3, r7, r3
        bne     LKWC40
        add     r3, r3, #8
        mov     r3, r3, asr #4
        b       LKWC45
LKWC41:
        sub     r7, r1, #1
LKWC42:
        ldrb    r10, [r9], #1
        subs    r8, r8, #1
        add     r3, r10, r3
        ldrb    r10, [r7], +r2
        add     r3, r3, r10
        bne     LKWC42
        add     r3, r3, #0x10
        mov     r3, r3, asr #5
        b       LKWC45
LKWC43:
        cmp     r7, #0
        movne   r3, #0x80
        bne     LKWC45
        sub     r7, r1, #1
LKWC44:
        ldrb    r9, [r7], +r2
        subs    r8, r8, #1
        add     r3, r3, r9
        bne     LKWC44
        add     r3, r3, #8
        mov     r3, r3, asr #4
LKWC45:
        mov     r7, #0x10
LKWC46:
        mov     r8, #0
LKWC47:
        strb    r3, [r6, +r8]
        add     r8, r8, #1
        cmp     r8, #0x10
        blt     LKWC47
        subs    r7, r7, #1
        add     r6, r2, r6
        bne     LKWC46
        b       LKWC5
LKWC48:
        cmp     r8, #0
        bne     LKWC49
        cmp     r7, #0
        bne     LKWC49
        cmp     r6, #0
        beq     LKWC50
LKWC49:
        mvn     r0, #0x74
        add     sp, sp, #0x88
        ldmia   sp!, {r4 - r11, pc}
LKWC50:
        sub     r7, r1, r2
        rsb     r6, r2, r1
        sub     r7, r7, #2
        sub     r6, r6, #2
        mov     r8, r3
        str     r0, [sp, #0x10]
LKWC51:
        ldrb    r11, [r7, #1]!
        ldrb    r9, [r6, #1]
        add     r10, sp, #0x60
        add     r0, sp, #0x4C
        strb    r11, [r8, +r10]
        strb    r9, [r8, +r0]
        add     r8, r8, #1
        cmp     r8, #0x11
        add     r6, r6, r2
        blt     LKWC51
        ldr     r0, [sp, #0x10]
        mov     r8, r3
        mov     r7, r8
        mov     r6, #1
        str     r0, [sp, #0x10]
LKWC52:
        add     r0, sp, #0x4C
        add     r11, sp, #0x60
        add     r9, sp, #0x4C
        add     r10, sp, #0x60
        add     r0, r0, r6
        ldrb    r0, [r0, #8]
        add     r11, r11, r6
        sub     r9, r9, r6
        ldrb    r9, [r9, #8]
        ldrb    r11, [r11, #8]
        sub     r10, r10, r6
        ldrb    r10, [r10, #8]
        sub     r0, r0, r9
        mla     r7, r6, r0, r7
        sub     r11, r11, r10
        mla     r8, r6, r11, r8
        add     r6, r6, #1
        cmp     r6, #8
        ble     LKWC52
        ldr     r0, [sp, #0x10]
        add     r6, sp, #0x60
        add     r9, sp, #0x4C
        ldrb    r6, [r6, #0x10]
        ldrb    r9, [r9, #0x10]
        add     r8, r8, r8, lsl #2
        add     r10, r8, #0x20
        add     r8, r6, r9
        add     r7, r7, r7, lsl #2
        mov     r6, r10, asr #6
        add     r7, r7, #0x20
        mov     r11, #0xFF
        sub     r9, r6, r6, lsl #3
        add     r8, r9, r8, lsl #4
        mov     r7, r7, asr #6
        mov     r10, #0x10
        str     lr, [sp]
        sub     r9, r7, r7, lsl #3
        add     r8, r8, r9
        mov     r9, r1
        str     r4, [sp, #4]
        str     r5, [sp, #8]
        str     r1, [sp, #0xC]
        str     r0, [sp, #0x10]
LKWC53:
        add     lr, r8, #0x10
        mov     r4, r9
        mov     r5, #0x10
LKWC54:
        mov     r0, lr, asr #5
        cmp     r0, #0xFF
        mov     r1, r11
        movlt   r1, r0
        cmp     r1, #0
        movlt   r1, r3
        strb    r1, [r4], #1
        subs    r5, r5, #1
        add     lr, lr, r6
        bne     LKWC54
        subs    r10, r10, #1
        add     r8, r8, r7
        add     r9, r9, r2
        bne     LKWC53
        ldr     lr, [sp]
        ldr     r4, [sp, #4]
        ldr     r5, [sp, #8]
        ldr     r1, [sp, #0xC]
        ldr     r0, [sp, #0x10]
        b       LKWC5
LKWC55:
        mvn     r0, #7
        add     sp, sp, #0x88
        ldmia   sp!, {r4 - r11, pc}
        .long   LKWC_zeroArray
        .long   0x2aaaaaab
        .long   xyoff
        .long   block_subblock_mapping
        .long   ClampTbl


        .data
        .align  4


LKWC_zeroArray:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00


