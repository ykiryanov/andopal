        .text
        .align  4
        .globl  _ippiReconstructLumaIntra16x16MB_H264_16s8u_C1R


_ippiReconstructLumaIntra16x16MB_H264_16s8u_C1R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x74
        ldr     r4, [sp, #0xA0]
        ldr     r12, [sp, #0x98]
        ldr     lr, [sp, #0x9C]
        cmp     r0, #0
        and     r7, r4, #4
        and     r6, r4, #1
        and     r8, r4, #0x10
        beq     LKWQ43
        cmp     r1, #0
        beq     LKWQ43
        ldr     r4, [r0]
        cmp     r4, #0
        beq     LKWQ43
        cmp     lr, #0x33
        bhi     LKWQ1
        ldr     r4, [pc, #0x9A4]
        cmp     lr, #6
        ldr     r4, [r4, +lr, lsl #2]
        mov     r4, r4, lsl #16
        mov     r4, r4, asr #16
        movcc   r5, #2
        bcc     LKWQ0
        cmp     lr, #0xC
        movcs   r5, #0
        movcc   r5, #1
LKWQ0:
        subs    r9, r3, #3
        mov     r3, #0
        beq     LKWQ38
        adds    r9, r9, #1
        beq     LKWQ29
        adds    r9, r9, #1
        mov     r8, #0x10
        beq     LKWQ24
        adds    r9, r9, #1
        beq     LKWQ2
LKWQ1:
        mvn     r0, #0xA
        add     sp, sp, #0x74
        ldmia   sp!, {r4 - r11, pc}
LKWQ2:
        cmp     r7, #0
        beq     LKWQ3
        mvn     r0, #0x74
        add     sp, sp, #0x74
        ldmia   sp!, {r4 - r11, pc}
LKWQ3:
        sub     r7, r1, r2
        mov     r6, r1
LKWQ4:
        mov     r11, r7
        mov     r10, r3
LKWQ5:
        ldrb    r9, [r11], #1
        strb    r9, [r6, +r10]
        add     r10, r10, #1
        cmp     r10, #0x10
        blt     LKWQ5
        subs    r8, r8, #1
        add     r6, r2, r6
        bne     LKWQ4
LKWQ6:
        mvn     r3, #0xFE, 16
        bic     r3, r3, #0xFF, 8
        tst     r12, r3
        beq     LKWQ21
        ldr     r3, [pc, #0x8F8]
        tst     r12, #1
        beq     LKWQ10
        ldr     r3, [r0]
        add     r9, sp, #0x64
        add     r8, sp, #0x64
        str     r3, [r9]
        add     r9, r3, #0x20
        add     r10, r3, #8
        str     r9, [r0]
        str     r10, [r8, #4]
        add     r7, sp, #0x64
        add     r6, sp, #0x64
        add     r9, r3, #0x10
        add     r8, r3, #0x18
        str     r9, [r7, #8]
        str     r8, [r6, #0xC]
        mov     r7, r3
        mov     r6, #4
        str     r12, [sp, #8]
        str     r2, [sp, #0x14]
        str     r1, [sp, #0xC]
        str     r0, [sp, #0x10]
LKWQ7:
        ldrsh   r2, [r9]
        ldrsh   r12, [r8]
        ldrsh   r11, [r7]
        ldrsh   r1, [r10]
        subs    r6, r6, #1
        add     r0, r2, r12
        sub     r2, r2, r12
        add     r12, r11, r1
        mov     r0, r0, lsl #16
        sub     r1, r11, r1
        mov     r12, r12, lsl #16
        mov     r0, r0, asr #16
        mov     r2, r2, lsl #16
        add     r11, r0, r12, asr #16
        strh    r11, [r7], #2
        rsb     r12, r0, r12, asr #16
        mov     r1, r1, lsl #16
        mov     r2, r2, asr #16
        strh    r12, [r10], #2
        rsb     r0, r2, r1, asr #16
        strh    r0, [r9], #2
        add     r1, r2, r1, asr #16
        strh    r1, [r8], #2
        bne     LKWQ7
        ldr     r0, [sp, #0x10]
        ldr     r12, [sp, #8]
        ldr     r2, [sp, #0x14]
        ldr     r1, [sp, #0xC]
        mov     r6, #0
        str     r0, [sp, #0x10]
LKWQ8:
        add     r0, sp, #0x64
        ldr     r7, [r0, +r6, lsl #2]
        add     r6, r6, #1
        cmp     r6, #4
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
        blt     LKWQ8
        ldr     r0, [sp, #0x10]
        mov     r7, r3
        mov     r6, #0x10
LKWQ9:
        ldrsh   r8, [r7]
        subs    r6, r6, #1
        mla     r8, r4, r8, r5
        mov     r8, r8, asr r5
        strh    r8, [r7], #2
        bne     LKWQ9
LKWQ10:
        ldr     r4, [pc, #0x798]
        ldr     r5, [pc, #0x798]
        add     r10, sp, #0x64
        add     r11, r4, lr, lsl #5
        ldr     lr, [pc, #0x790]
        str     r11, [sp, #0x30]
        ldr     r11, [pc, #0x78C]
        mov     r9, #0
        mov     r8, #2
        mov     r7, r9
        mvn     r6, #0xFF
        mov     r4, #0x10
        str     r3, [sp, #0x34]
        str     r0, [sp, #0x10]
LKWQ11:
        ldrb    r0, [lr], #1
        ldr     r3, [sp, #0x34]
        mov     r0, r0, lsl #1
        ldrsh   r0, [r3, +r0]
        cmp     r0, #0
        addne   r9, sp, #0x60
        tst     r12, r8
        beq     LKWQ12
        ldr     r10, [sp, #0x10]
        ldr     r7, [r10]
        add     r3, r7, #0x20
        str     r3, [r10]
LKWQ12:
        cmp     r7, #0
        beq     LKWQ22
        cmp     r9, #0
        moveq   r0, #0
        strneh  r0, [sp, #0x60]
        ldrnesh r0, [r9]
        strh    r0, [r7]
        ldr     r0, [sp, #0x30]
        mov     r10, #0
        mov     r3, #2
        add     r0, r0, #2
        str     r0, [sp, #0x2C]
        str     r1, [sp, #0xC]
        ldr     r1, [sp, #0x2C]
        mov     r0, #0xF
        str     r12, [sp, #8]
        str     r2, [sp, #0x14]
LKWQ13:
        ldrsh   r12, [r7, +r3]
        cmp     r12, #0
        beq     LKWQ14
        ldrsh   r2, [r1]
        mov     r10, #1
        mul     r2, r12, r2
        strh    r2, [r7, +r3]
LKWQ14:
        subs    r0, r0, #1
        add     r3, r3, #2
        add     r1, r1, #2
        bne     LKWQ13
        ldr     r12, [sp, #8]
        ldr     r2, [sp, #0x14]
        ldr     r1, [sp, #0xC]
        cmp     r10, #0
        bne     LKWQ16
        ldrsh   r0, [r7]
        str     r1, [sp, #0x28]
        add     r0, r0, #0x20
        ldr     r10, [sp, #0x28]
        mov     r0, r0, asr #6
        mov     r3, #4
        str     r3, [sp, #0x2C]
        mov     r0, r0, lsl #16
        str     r9, [sp]
        mov     r3, r0, asr #16
        cmp     r3, r6
        mov     r0, r6
        movgt   r0, r3
        ldr     r9, [sp, #0x2C]
        cmp     r0, #1, 24
        mov     r3, #1, 24
        movgt   r0, r3
        add     r0, r11, r0
        str     r8, [sp, #4]
        str     r12, [sp, #8]
        str     r1, [sp, #0xC]
LKWQ15:
        ldrb    r3, [r10]
        ldrb    r1, [r10, #1]
        ldrb    r12, [r10, #2]
        ldrb    r8, [r10, #3]
        add     r3, r0, r3
        ldrb    r3, [r3, #0x100]
        add     r1, r0, r1
        ldrb    r1, [r1, #0x100]
        add     r12, r0, r12
        ldrb    r12, [r12, #0x100]
        add     r8, r0, r8
        ldrb    r8, [r8, #0x100]
        strb    r3, [r10]
        strb    r1, [r10, #1]
        strb    r12, [r10, #2]
        strb    r8, [r10, #3]
        subs    r9, r9, #1
        add     r10, r2, r10
        bne     LKWQ15
        ldr     r9, [sp]
        ldr     r8, [sp, #4]
        ldr     r12, [sp, #8]
        ldr     r1, [sp, #0xC]
        b       LKWQ20
LKWQ16:
        add     r0, sp, #0x64
        str     r7, [r0]
        add     r0, sp, #0x64
        add     r10, r7, #8
        str     r10, [r0, #4]
        add     r0, sp, #0x64
        add     r9, r7, #0x10
        str     r9, [r0, #8]
        add     r0, sp, #0x64
        add     r3, r7, #0x18
        str     r3, [r0, #0xC]
        mov     r0, #0
        str     r6, [sp, #0x1C]
        str     r7, [sp, #0x18]
        str     r8, [sp, #4]
        str     r12, [sp, #8]
        str     r2, [sp, #0x14]
        str     r1, [sp, #0xC]
LKWQ17:
        add     r1, sp, #0x64
        ldr     r12, [r1, +r0, lsl #2]
        add     r0, r0, #1
        cmp     r0, #3
        ldrsh   r2, [r12, #6]
        ldrsh   r6, [r12, #2]
        ldrsh   r7, [r12]
        ldrsh   r8, [r12, #4]
        rsb     r1, r2, r6, asr #1
        add     r2, r6, r2, asr #1
        add     r6, r7, r8
        sub     r7, r7, r8
        mov     r1, r1, lsl #16
        mov     r2, r2, lsl #16
        mov     r6, r6, lsl #16
        mov     r7, r7, lsl #16
        mov     r1, r1, asr #16
        mov     r2, r2, asr #16
        add     r11, r2, r6, asr #16
        add     r8, r1, r7, asr #16
        rsb     r7, r1, r7, asr #16
        rsb     r6, r2, r6, asr #16
        strh    r11, [r12]
        strh    r8, [r12, #2]
        strh    r7, [r12, #4]
        strh    r6, [r12, #6]
        ble     LKWQ17
        ldr     r2, [sp, #0x14]
        ldr     r1, [sp, #0xC]
        ldr     r6, [sp, #0x1C]
        ldr     r11, [pc, #0x544]
        ldr     r7, [sp, #0x18]
        ldr     r8, [sp, #4]
        ldr     r12, [sp, #8]
        mov     r0, #0
        str     r0, [sp, #0x28]
        mov     r0, #4
        str     r0, [sp, #0x2C]
        str     r2, [sp, #0x14]
        str     r1, [sp, #0xC]
        ldr     r1, [sp, #0x2C]
        ldr     r2, [sp, #0x28]
        str     r5, [sp, #0x20]
        str     r6, [sp, #0x1C]
        str     r8, [sp, #4]
        str     r12, [sp, #8]
LKWQ18:
        ldrsh   r0, [r10]
        ldrsh   r5, [r3]
        ldrsh   r6, [r7, +r2]
        ldrsh   r8, [r9]
        subs    r1, r1, #1
        add     r12, r0, r5, asr #1
        rsb     r0, r5, r0, asr #1
        add     r5, r6, r8
        sub     r6, r6, r8
        mov     r12, r12, lsl #16
        mov     r0, r0, lsl #16
        mov     r11, r6, lsl #16
        mov     r5, r5, lsl #16
        mov     r12, r12, asr #16
        mov     r8, r0, asr #16
        add     r6, r12, r5, asr #16
        add     r0, r6, #0x20
        add     r6, r8, r11, asr #16
        add     r6, r6, #0x20
        mov     r0, r0, asr #6
        strh    r0, [r7, +r2]
        rsb     r11, r8, r11, asr #16
        add     r0, r11, #0x20
        mov     r6, r6, asr #6
        strh    r6, [r10], #2
        mov     r0, r0, asr #6
        rsb     r5, r12, r5, asr #16
        strh    r0, [r9], #2
        add     r5, r5, #0x20
        mov     r0, r5, asr #6
        strh    r0, [r3], #2
        add     r2, r2, #2
        bne     LKWQ18
        ldr     r8, [sp, #4]
        ldr     r1, [sp, #0xC]
        ldr     r5, [sp, #0x20]
        ldr     r12, [sp, #8]
        ldr     r6, [sp, #0x1C]
        ldr     r11, [pc, #0x46C]
        ldr     r2, [sp, #0x14]
        str     r8, [sp, #4]
        mov     r3, r1
        mov     r0, #0
        str     r4, [sp, #0x24]
        str     r5, [sp, #0x20]
        str     r12, [sp, #8]
        str     r1, [sp, #0xC]
        mov     r8, #1, 24
LKWQ19:
        ldrb    r12, [r3]
        ldrb    r4, [r3, #1]
        ldrb    r5, [r3, #2]
        ldrb    r7, [r3, #3]
        add     r1, sp, #0x64
        ldr     r1, [r1, +r0, lsl #2]
        mov     r9, r6
        add     r0, r0, #1
        ldrsh   r10, [r1]
        cmp     r10, r6
        movgt   r9, r10
        cmp     r9, #1, 24
        movgt   r9, r8
        add     r9, r11, r9
        add     r12, r9, r12
        ldrb    r12, [r12, #0x100]
        strb    r12, [r3]
        ldrsh   r9, [r1, #2]
        mov     r12, r6
        cmp     r9, r6
        movgt   r12, r9
        cmp     r12, #1, 24
        movgt   r12, r8
        add     r12, r11, r12
        add     r4, r12, r4
        ldrb    r12, [r4, #0x100]
        strb    r12, [r3, #1]
        ldrsh   r4, [r1, #4]
        mov     r12, r6
        cmp     r4, r6
        movgt   r12, r4
        cmp     r12, #1, 24
        movgt   r12, r8
        add     r12, r11, r12
        add     r5, r12, r5
        ldrb    r12, [r5, #0x100]
        strb    r12, [r3, #2]
        ldrsh   r1, [r1, #6]
        mov     r12, r6
        cmp     r1, r6
        movgt   r12, r1
        cmp     r12, #1, 24
        movgt   r12, r8
        add     r12, r11, r12
        add     r7, r12, r7
        ldrb    r1, [r7, #0x100]
        cmp     r0, #4
        strb    r1, [r3, #3]
        add     r3, r2, r3
        blt     LKWQ19
        ldr     r4, [sp, #0x24]
        ldr     r5, [sp, #0x20]
        ldr     r8, [sp, #4]
        ldr     r12, [sp, #8]
        ldr     r1, [sp, #0xC]
        mov     r9, #0
        mov     r7, r9
LKWQ20:
        ldrsb   r3, [r5, #1]
        ldrsb   r0, [r5, #2]!
        add     r3, r1, r3
        subs    r4, r4, #1
        mla     r1, r2, r0, r3
        mov     r8, r8, lsl #1
        bne     LKWQ11
LKWQ21:
        mov     r0, #0
        add     sp, sp, #0x74
        ldmia   sp!, {r4 - r11, pc}
LKWQ22:
        cmp     r9, #0
        beq     LKWQ20
        mov     r10, #4
        str     r10, [sp, #0x28]
        str     r1, [sp, #0x2C]
        strh    r0, [sp, #0x60]
        ldrsh   r9, [r9]
        ldr     r10, [sp, #0x2C]
        mov     r0, r6
        add     r9, r9, #0x20
        str     r8, [sp, #4]
        str     r12, [sp, #8]
        mov     r9, r9, asr #6
        str     r1, [sp, #0xC]
        mov     r9, r9, lsl #16
        mov     r3, r9, asr #16
        cmp     r3, r6
        movgt   r0, r3
        ldr     r9, [sp, #0x28]
        cmp     r0, #1, 24
        mov     r3, #1, 24
        movgt   r0, r3
        add     r0, r11, r0
LKWQ23:
        ldrb    r3, [r10]
        ldrb    r1, [r10, #1]
        ldrb    r12, [r10, #2]
        ldrb    r8, [r10, #3]
        add     r3, r0, r3
        ldrb    r3, [r3, #0x100]
        add     r1, r0, r1
        ldrb    r1, [r1, #0x100]
        add     r12, r0, r12
        ldrb    r12, [r12, #0x100]
        add     r8, r0, r8
        ldrb    r8, [r8, #0x100]
        strb    r3, [r10]
        strb    r1, [r10, #1]
        strb    r12, [r10, #2]
        strb    r8, [r10, #3]
        subs    r9, r9, #1
        add     r10, r2, r10
        bne     LKWQ23
        ldr     r8, [sp, #4]
        ldr     r12, [sp, #8]
        ldr     r1, [sp, #0xC]
        mov     r9, #0
        b       LKWQ20
LKWQ24:
        cmp     r6, #0
        beq     LKWQ26
LKWQ25:
        mvn     r0, #0x74
        add     sp, sp, #0x74
        ldmia   sp!, {r4 - r11, pc}
LKWQ26:
        mov     r6, r1
LKWQ27:
        mov     r9, r3
LKWQ28:
        ldrb    r7, [r6, #-1]
        strb    r7, [r6, +r9]
        add     r9, r9, #1
        cmp     r9, #0x10
        blt     LKWQ28
        subs    r8, r8, #1
        add     r6, r2, r6
        bne     LKWQ27
        b       LKWQ6
LKWQ29:
        cmp     r7, #0
        mov     r8, #0x10
        mov     r7, r1
        bne     LKWQ33
        cmp     r6, #0
        sub     r9, r1, r2
        beq     LKWQ31
LKWQ30:
        ldrb    r6, [r9], #1
        subs    r8, r8, #1
        add     r3, r6, r3
        bne     LKWQ30
        add     r3, r3, #8
        mov     r3, r3, asr #4
        b       LKWQ35
LKWQ31:
        sub     r6, r1, #1
LKWQ32:
        ldrb    r10, [r9], #1
        subs    r8, r8, #1
        add     r3, r10, r3
        ldrb    r10, [r6], +r2
        add     r3, r3, r10
        bne     LKWQ32
        add     r3, r3, #0x10
        mov     r3, r3, asr #5
        b       LKWQ35
LKWQ33:
        cmp     r6, #0
        movne   r3, #0x80
        bne     LKWQ35
        sub     r6, r1, #1
LKWQ34:
        ldrb    r9, [r6], +r2
        subs    r8, r8, #1
        add     r3, r3, r9
        bne     LKWQ34
        add     r3, r3, #8
        mov     r3, r3, asr #4
LKWQ35:
        mov     r6, #0x10
LKWQ36:
        mov     r8, #0
LKWQ37:
        strb    r3, [r7, +r8]
        add     r8, r8, #1
        cmp     r8, #0x10
        blt     LKWQ37
        subs    r6, r6, #1
        add     r7, r2, r7
        bne     LKWQ36
        b       LKWQ6
LKWQ38:
        cmp     r7, #0
        bne     LKWQ25
        cmp     r6, #0
        bne     LKWQ25
        cmp     r8, #0
        bne     LKWQ25
        sub     r7, r1, r2
        rsb     r6, r2, r1
        sub     r7, r7, #2
        sub     r6, r6, #2
        mov     r8, r3
        str     r0, [sp, #0x10]
LKWQ39:
        ldrb    r11, [r7, #1]!
        ldrb    r9, [r6, #1]
        add     r10, sp, #0x4C
        add     r0, sp, #0x38
        strb    r11, [r8, +r10]
        strb    r9, [r8, +r0]
        add     r8, r8, #1
        cmp     r8, #0x11
        add     r6, r6, r2
        blt     LKWQ39
        ldr     r0, [sp, #0x10]
        mov     r8, r3
        mov     r7, r8
        mov     r6, #1
        str     r0, [sp, #0x10]
LKWQ40:
        add     r0, sp, #0x38
        add     r11, sp, #0x4C
        add     r9, sp, #0x38
        add     r10, sp, #0x4C
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
        ble     LKWQ40
        ldr     r0, [sp, #0x10]
        add     r6, sp, #0x4C
        add     r9, sp, #0x38
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
        str     r4, [sp]
        sub     r9, r7, r7, lsl #3
        add     r8, r8, r9
        mov     r9, r1
        str     lr, [sp, #4]
        str     r12, [sp, #8]
        str     r1, [sp, #0xC]
        str     r0, [sp, #0x10]
LKWQ41:
        add     r12, r8, #0x10
        mov     lr, r9
        mov     r4, #0x10
LKWQ42:
        mov     r0, r12, asr #5
        cmp     r0, #0xFF
        mov     r1, r11
        movlt   r1, r0
        cmp     r1, #0
        movlt   r1, r3
        strb    r1, [lr], #1
        subs    r4, r4, #1
        add     r12, r12, r6
        bne     LKWQ42
        subs    r10, r10, #1
        add     r8, r8, r7
        add     r9, r9, r2
        bne     LKWQ41
        ldr     r4, [sp]
        ldr     lr, [sp, #4]
        ldr     r12, [sp, #8]
        ldr     r1, [sp, #0xC]
        ldr     r0, [sp, #0x10]
        b       LKWQ6
LKWQ43:
        mvn     r0, #7
        add     sp, sp, #0x74
        ldmia   sp!, {r4 - r11, pc}
        .long   InvQuantLuma16x16DCTable
        .long   LKWQ_zeroArray
        .long   InvQuantTable_w7
        .long   xyoff
        .long   block_subblock_mapping
        .long   ClampTbl


        .data
        .align  4


LKWQ_zeroArray:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00


