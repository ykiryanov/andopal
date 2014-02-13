        .text
        .align  4
        .globl  _ippiReconstructLumaInter8x8MB_H264_16s8u_C1R


_ippiReconstructLumaInter8x8MB_H264_16s8u_C1R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x88
        ldr     r7, [sp, #0xAC]
        ldr     r6, [sp, #0xB0]
        ldr     r5, [sp, #0xB4]
        cmp     r0, #0
        beq     LKWH14
        cmp     r1, #0
        beq     LKWH14
        ldr     r12, [r0]
        cmp     r12, #0
        beq     LKWH14
        cmp     r6, #0
        beq     LKWH14
        cmp     r7, #0x33
        bhi     LKWH13
        ldr     r12, [pc, #0x758]
        tst     r12, r3, lsl #1
        beq     LKWH12
        ldr     lr, [pc, #0x750]
        mvn     r11, #0xFF
        add     r8, sp, #0x68
        add     r9, sp, #0x68
        mov     r4, #2
        mov     r10, #1, 24
        mov     r12, #4
        str     r11, [sp, #0x1C]
        str     r5, [sp, #0x48]
        str     r6, [sp, #0x20]
        str     r7, [sp, #0x44]
        str     r3, [sp, #0x4C]
        str     r0, [sp]
LKWH0:
        ldr     r0, [sp, #0x4C]
        tst     r4, r0, lsl #1
        beq     LKWH11
        ldr     r0, [sp]
        ldr     r3, [sp, #0x48]
        ldr     r5, [r0]
        str     r5, [sp, #0x40]
        add     r5, r5, #0x80
        cmp     r3, #0
        str     r5, [r0]
        beq     LKWH1
        ldr     r0, [sp, #0x44]
        cmp     r0, #0
        ble     LKWH5
LKWH1:
        ldr     r3, [pc, #0x6E8]
        ldr     r0, [sp, #0x44]
        smull   r3, r5, r0, r3
        cmp     r0, #0x24
        sub     r0, r5, r0, asr #31
        blt     LKWH3
        sub     r5, r0, #6
        ldr     r3, [sp, #0x20]
        ldr     r0, [sp, #0x40]
        mov     r6, #0
LKWH2:
        ldrsh   r11, [r3]
        ldrsh   r10, [r0]
        ldrsh   r7, [r0, #2]
        ldrsh   r8, [r0, #4]
        ldrsh   r9, [r0, #6]
        mul     r11, r10, r11
        add     r6, r6, #4
        cmp     r6, #0x40
        mov     r10, r11, lsl r5
        strh    r10, [r0]
        ldrsh   r10, [r3, #2]
        mul     r10, r7, r10
        mov     r7, r10, lsl r5
        strh    r7, [r0, #2]
        ldrsh   r7, [r3, #4]
        mul     r7, r8, r7
        mov     r7, r7, lsl r5
        strh    r7, [r0, #4]
        ldrsh   r7, [r3, #6]
        add     r3, r3, #8
        mul     r7, r9, r7
        mov     r7, r7, lsl r5
        strh    r7, [r0, #6]
        add     r0, r0, #8
        blt     LKWH2
        b       LKWH5
LKWH3:
        rsb     r5, r0, #5
        mov     r3, #1
        mov     r5, r3, lsl r5
        str     r5, [sp, #4]
        rsb     r5, r0, #6
        ldr     r3, [sp, #0x20]
        ldr     r0, [sp, #0x40]
        ldr     r9, [sp, #4]
        mov     r6, #0
        str     r1, [sp, #0x18]
LKWH4:
        ldrsh   r10, [r3]
        ldrsh   r11, [r0]
        ldrsh   r1, [r0, #2]
        ldrsh   r7, [r0, #4]
        ldrsh   r8, [r0, #6]
        mla     r10, r11, r10, r9
        add     r6, r6, #4
        cmp     r6, #0x40
        mov     r10, r10, asr r5
        strh    r10, [r0]
        ldrsh   r10, [r3, #2]
        mla     r10, r1, r10, r9
        mov     r1, r10, asr r5
        strh    r1, [r0, #2]
        ldrsh   r1, [r3, #4]
        mla     r1, r7, r1, r9
        mov     r1, r1, asr r5
        strh    r1, [r0, #4]
        ldrsh   r1, [r3, #6]
        add     r3, r3, #8
        mla     r1, r8, r1, r9
        mov     r1, r1, asr r5
        strh    r1, [r0, #6]
        add     r0, r0, #8
        blt     LKWH4
        ldr     r1, [sp, #0x18]
LKWH5:
        ldr     r0, [sp, #0x40]
        ldr     r11, [sp, #0x48]
        add     r3, r0, #0x10
        add     r5, r0, #0x20
        add     r6, r0, #0x30
        add     r7, r0, #0x40
        add     r8, r0, #0x50
        add     r9, r0, #0x60
        add     r10, r0, #0x70
        str     r3, [sp, #0x30]
        str     r5, [sp, #0x38]
        str     r6, [sp, #0x28]
        str     r7, [sp, #0x24]
        str     r8, [sp, #0x2C]
        str     r9, [sp, #0x34]
        str     r10, [sp, #0x3C]
        cmp     r11, #0
        add     r11, sp, #0x68
        str     r0, [r11]
        add     r0, sp, #0x68
        str     r3, [r0, #4]
        add     r0, sp, #0x68
        str     r5, [r0, #8]
        add     r0, sp, #0x68
        str     r6, [r0, #0xC]
        add     r0, sp, #0x68
        str     r7, [r0, #0x10]
        add     r0, sp, #0x68
        str     r8, [r0, #0x14]
        add     r0, sp, #0x68
        str     r9, [r0, #0x18]
        add     r0, sp, #0x68
        str     r10, [r0, #0x1C]
        beq     LKWH6
        ldr     r0, [sp, #0x44]
        cmp     r0, #0
        ble     LKWH9
LKWH6:
        mov     r0, #0
        str     r0, [sp, #4]
        str     r12, [sp, #8]
        str     lr, [sp, #0xC]
        str     r4, [sp, #0x10]
        str     r2, [sp, #0x14]
        str     r1, [sp, #0x18]
LKWH7:
        ldr     r1, [sp, #4]
        add     r0, sp, #0x68
        ldr     r0, [r0, +r1, lsl #2]
        add     r1, r1, #1
        str     r1, [sp, #4]
        ldrsh   r12, [r0, #6]
        ldrsh   r2, [r0, #0xE]
        ldrsh   r8, [r0, #0xA]
        ldrsh   lr, [r0, #2]
        cmp     r1, #8
        ldrsh   r9, [r0]
        ldrsh   r10, [r0, #8]
        ldrsh   r5, [r0, #4]
        ldrsh   r4, [r0, #0xC]
        mov     r1, r12, asr #1
        mov     r3, r2, asr #1
        rsb     r1, r1, #0
        rsb     r3, r3, #0
        add     r6, lr, r2
        sub     r1, r1, r12
        sub     r11, r8, r12
        sub     r3, r3, r2
        add     r7, r8, r8, asr #1
        add     r12, r12, r8
        sub     r2, r2, lr
        add     r1, r6, r1
        add     r8, r9, r10
        rsb     r6, r4, r5, asr #1
        add     lr, lr, lr, asr #1
        sub     r9, r9, r10
        add     r4, r5, r4, asr #1
        add     lr, r12, lr
        add     r7, r2, r7
        add     r3, r11, r3
        add     r5, r8, r4
        add     r10, r9, r6
        add     r2, r3, lr, asr #2
        add     r12, r1, r7, asr #2
        sub     r9, r9, r6
        sub     r8, r8, r4
        rsb     r1, r7, r1, asr #2
        sub     lr, lr, r3, asr #2
        add     r7, r5, lr
        add     r3, r10, r1
        add     r4, r12, r9
        add     r6, r2, r8
        sub     r8, r8, r2
        sub     r9, r9, r12
        sub     r10, r10, r1
        sub     r5, r5, lr
        strh    r7, [r0]
        strh    r3, [r0, #2]
        strh    r4, [r0, #4]
        strh    r6, [r0, #6]
        strh    r8, [r0, #8]
        strh    r9, [r0, #0xA]
        strh    r10, [r0, #0xC]
        strh    r5, [r0, #0xE]
        blt     LKWH7
        ldr     r4, [sp, #0x10]
        ldr     r12, [sp, #8]
        ldr     lr, [sp, #0xC]
        ldr     r2, [sp, #0x14]
        ldr     r1, [sp, #0x18]
        str     r4, [sp, #0x10]
        ldr     r5, [sp, #0x34]
        ldr     r6, [sp, #0x2C]
        ldr     r4, [sp, #0x30]
        ldr     r7, [sp, #0x40]
        mov     r0, #8
        str     r0, [sp, #4]
        str     r12, [sp, #8]
        str     lr, [sp, #0xC]
        str     r2, [sp, #0x14]
        str     r1, [sp, #0x18]
LKWH8:
        ldr     r0, [sp, #0x3C]
        ldr     r1, [sp, #0x28]
        ldrsh   r10, [r4]
        ldrsh   r0, [r0]
        ldr     r2, [sp, #0x24]
        ldrsh   lr, [r1]
        ldrsh   r1, [r6]
        ldr     r3, [sp, #0x38]
        ldrsh   r12, [r7]
        ldrsh   r2, [r2]
        ldrsh   r9, [r5]
        ldrsh   r8, [r3]
        mov     r3, r0, asr #1
        rsb     r3, r3, #0
        sub     r11, r1, lr
        str     r11, [sp, #0x50]
        sub     r3, r3, r0
        mov     r11, lr, asr #1
        str     r11, [sp, #0x54]
        add     r11, lr, r1
        str     r11, [sp, #0x58]
        add     r11, r10, r10, asr #1
        str     r11, [sp, #0x5C]
        add     r11, r12, r2
        str     r11, [sp, #0x60]
        ldr     r11, [sp, #0x50]
        add     r1, r1, r1, asr #1
        sub     r2, r12, r2
        add     r3, r11, r3
        str     r3, [sp, #0x50]
        ldr     r3, [sp, #0x54]
        ldr     r11, [sp, #0x58]
        rsb     r3, r3, #0
        str     r3, [sp, #0x54]
        add     r3, r8, r9, asr #1
        str     r3, [sp, #0x64]
        ldr     r3, [sp, #0x5C]
        rsb     r8, r9, r8, asr #1
        add     r3, r11, r3
        add     r11, r10, r0
        str     r11, [sp, #0x5C]
        ldr     r11, [sp, #0x54]
        sub     r0, r0, r10
        ldr     r10, [sp, #0x60]
        sub     r11, r11, lr
        ldr     lr, [sp, #0x64]
        str     r11, [sp, #0x58]
        ldr     r12, [sp, #0x58]
        add     lr, r10, lr
        ldr     r10, [sp, #0x50]
        sub     r10, r3, r10, asr #2
        str     r10, [sp, #0x54]
        ldr     r10, [sp, #0x5C]
        add     r12, r10, r12
        add     r10, r0, r1
        ldr     r0, [sp, #0x54]
        add     r1, r2, r8
        rsb     r9, r10, r12, asr #2
        add     r12, r12, r10, asr #2
        add     r0, lr, r0
        add     r0, r0, #0x20
        sub     r2, r2, r8
        mov     r0, r0, asr #6
        strh    r0, [r7], #2
        ldr     r8, [sp, #0x50]
        ldr     r10, [sp, #0x64]
        add     r0, r1, r9
        add     r0, r0, #0x20
        add     r8, r8, r3, asr #2
        ldr     r3, [sp, #0x60]
        mov     r0, r0, asr #6
        strh    r0, [r4], #2
        ldr     r11, [sp, #0x38]
        sub     r3, r3, r10
        add     r0, r12, r2
        add     r10, r0, #0x20
        add     r0, r8, r3
        add     r0, r0, #0x20
        mov     r10, r10, asr #6
        strh    r10, [r11]
        sub     r3, r3, r8
        ldr     r8, [sp, #0x28]
        mov     r0, r0, asr #6
        add     r3, r3, #0x20
        strh    r0, [r8]
        ldr     r0, [sp, #0x24]
        sub     r2, r2, r12
        mov     r3, r3, asr #6
        strh    r3, [r0]
        add     r2, r2, #0x20
        sub     r1, r1, r9
        mov     r2, r2, asr #6
        strh    r2, [r6], #2
        add     r0, r1, #0x20
        ldr     r1, [sp, #0x54]
        mov     r0, r0, asr #6
        strh    r0, [r5], #2
        ldr     r0, [sp, #0x3C]
        sub     lr, lr, r1
        add     lr, lr, #0x20
        mov     r1, lr, asr #6
        strh    r1, [r0], #2
        ldr     r2, [sp, #0x38]
        ldr     r1, [sp, #4]
        add     r2, r2, #2
        str     r2, [sp, #0x38]
        ldr     r2, [sp, #0x28]
        subs    r1, r1, #1
        str     r1, [sp, #4]
        add     r2, r2, #2
        str     r2, [sp, #0x28]
        ldr     r2, [sp, #0x24]
        add     r2, r2, #2
        str     r2, [sp, #0x24]
        str     r0, [sp, #0x3C]
        bne     LKWH8
        ldr     r12, [sp, #8]
        ldr     lr, [sp, #0xC]
        ldr     r4, [sp, #0x10]
        ldr     r2, [sp, #0x14]
        ldr     r1, [sp, #0x18]
LKWH9:
        mov     r3, r1
        ldr     r8, [sp, #0x1C]
        ldr     r10, [pc, #0x204]
        mov     r0, #0
        str     r12, [sp, #8]
        str     lr, [sp, #0xC]
        str     r4, [sp, #0x10]
        str     r2, [sp, #0x14]
        str     r1, [sp, #0x18]
        mov     r9, #1, 24
LKWH10:
        add     r1, sp, #0x68
        ldrb    lr, [r3, #1]
        ldrb    r4, [r3, #2]
        ldr     r1, [r1, +r0, lsl #2]
        ldrb    r5, [r3, #3]
        ldrb    r12, [r3]
        ldrb    r2, [r3, #4]
        mov     r11, r8
        add     r0, r0, #1
        str     r2, [sp, #0x64]
        ldrsh   r2, [r1]
        ldrb    r6, [r3, #5]
        ldrb    r7, [r3, #6]
        cmp     r2, r8
        movgt   r11, r2
        str     r7, [sp, #0x60]
        ldrb    r7, [r3, #7]
        cmp     r11, #1, 24
        movgt   r11, r9
        add     r11, r10, r11
        add     r12, r11, r12
        ldrb    r2, [r12, #0x100]
        strb    r2, [r3]
        ldrsh   r12, [r1, #2]
        mov     r2, r8
        cmp     r12, r8
        movgt   r2, r12
        cmp     r2, #1, 24
        movgt   r2, r9
        add     r2, r10, r2
        add     lr, r2, lr
        ldrb    r2, [lr, #0x100]
        strb    r2, [r3, #1]
        ldrsh   r12, [r1, #4]
        mov     r2, r8
        cmp     r12, r8
        movgt   r2, r12
        cmp     r2, #1, 24
        movgt   r2, r9
        add     r2, r10, r2
        add     r4, r2, r4
        ldrb    r2, [r4, #0x100]
        strb    r2, [r3, #2]
        ldrsh   r12, [r1, #6]
        mov     r2, r8
        cmp     r12, r8
        movgt   r2, r12
        cmp     r2, #1, 24
        movgt   r2, r9
        add     r2, r10, r2
        add     r5, r2, r5
        ldrb    r2, [r5, #0x100]
        strb    r2, [r3, #3]
        ldrsh   r12, [r1, #8]
        mov     r2, r8
        cmp     r12, r8
        movgt   r2, r12
        ldr     r12, [sp, #0x64]
        cmp     r2, #1, 24
        movgt   r2, r9
        add     r2, r10, r2
        add     r12, r2, r12
        ldrb    r2, [r12, #0x100]
        strb    r2, [r3, #4]
        ldrsh   r12, [r1, #0xA]
        mov     r2, r8
        cmp     r12, r8
        movgt   r2, r12
        cmp     r2, #1, 24
        movgt   r2, r9
        add     r2, r10, r2
        add     r6, r2, r6
        ldrb    r2, [r6, #0x100]
        strb    r2, [r3, #5]
        ldrsh   r12, [r1, #0xC]
        mov     r2, r8
        cmp     r12, r8
        movgt   r2, r12
        ldr     r12, [sp, #0x60]
        cmp     r2, #1, 24
        movgt   r2, r9
        add     r2, r10, r2
        add     r12, r2, r12
        ldrb    r2, [r12, #0x100]
        strb    r2, [r3, #6]
        ldrsh   r1, [r1, #0xE]
        mov     r2, r8
        cmp     r1, r8
        movgt   r2, r1
        cmp     r2, #1, 24
        movgt   r2, r9
        add     r2, r10, r2
        add     r7, r2, r7
        ldrb    r1, [r7, #0x100]
        cmp     r0, #8
        strb    r1, [r3, #7]
        ldr     r1, [sp, #0x14]
        add     r3, r3, r1
        blt     LKWH10
        ldr     r12, [sp, #8]
        ldr     lr, [sp, #0xC]
        ldr     r4, [sp, #0x10]
        ldr     r2, [sp, #0x14]
        ldr     r1, [sp, #0x18]
LKWH11:
        ldrsb   r3, [lr, #1]
        ldrsb   r0, [lr, #2]!
        mov     r4, r4, lsl #1
        add     r3, r1, r3
        mla     r1, r2, r0, r3
        subs    r12, r12, #1
        bne     LKWH0
LKWH12:
        mov     r0, #0
        add     sp, sp, #0x88
        ldmia   sp!, {r4 - r11, pc}
LKWH13:
        mvn     r0, #0xA
        add     sp, sp, #0x88
        ldmia   sp!, {r4 - r11, pc}
LKWH14:
        mvn     r0, #7
        add     sp, sp, #0x88
        ldmia   sp!, {r4 - r11, pc}
        .long   0x0001fffe
        .long   xyoff8
        .long   0x2aaaaaab
        .long   ClampTbl


