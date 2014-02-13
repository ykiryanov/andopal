        .text
        .align  4
        .globl  _ippsMeanSquareWeightedError_16s


_ippsMeanSquareWeightedError_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x45, 30
        add     lr, sp, #0x34
        ldr     r5, [sp, #0x140]
        ldr     r9, [sp, #0x138]
        ldr     r11, [sp, #0x13C]
        and     lr, lr, #0xF
        rsb     lr, lr, #0
        add     r12, sp, #0x34
        and     lr, lr, #0xF
        add     r4, r12, lr
        mov     r6, r3
        rsb     r12, r6, #0
        str     lr, [sp, #0x20]
        mov     r12, r12, lsl #16
        str     r1, [sp, #0xC]
        mov     r8, r12, asr #16
        mov     r10, r0
        mov     r12, #0xC
        str     r12, [sp]
        mov     r7, r2
        add     r0, r10, r8, lsl #1
        mov     r3, r5
        mov     r2, r4
        mov     r1, r7
        bl      _ippsConvPartial_16s_Sfs
        add     r3, sp, #0x11, 28
        mov     r2, #0
        mov     r1, r5
        mov     r0, r4
        bl      _ippsSumSquare_NS_16s32s_Sfs
        ldr     r12, [sp, #0x110]
        cmp     r12, #2, 8
        movle   r12, #0xC
        movle   lr, #0
        ble     LDVD0
        mov     r2, r5
        mov     r1, r4
        mov     r0, #2
        bl      _ippsRShiftC_16s_I
        mov     r12, #0xE
        mov     lr, #2
LDVD0:
        cmp     r6, r9
        bgt     LDVD12
        str     r10, [sp, #8]
        ldr     r10, [sp, #0xC]
        sub     r0, r5, #1
        sub     r2, r4, #2
        str     r7, [sp, #0x10]
        add     r11, r11, r6, lsl #1
        mov     r1, #0
        str     r2, [sp, #0x28]
        str     lr, [sp, #0x2C]
        str     r12, [sp, #0x30]
        mov     r7, r0
LDVD1:
        add     r3, sp, #0x11, 28
        mov     r2, #0
        mov     r1, r5
        mov     r0, r4
        bl      _ippsSumSquare_NS_16s32s_Sfs
        ldr     r12, [sp, #0x110]
        cmn     r12, #7, 2
        movle   r12, r12, lsl #1
        mvngt   r12, #2, 2
        add     r0, sp, #0x11, 28
        str     r12, [sp, #0x110]
        mov     r1, #1
        bl      _ippsInvSqrt_32s_I
        add     r3, sp, #0x43, 30
        mov     r2, r5
        mov     r1, r4
        mov     r0, r10
        bl      _ippsDotProd_16s32s
        ldr     r12, [sp, #0x110]
        ldr     r1, [sp, #0x10C]
        mov     lr, #0xFF
        orr     lr, lr, #0x7F, 24
        mov     r0, r12, asr #16
        and     r12, lr, r12, asr #1
        and     lr, r1, lr
        mov     r0, r0, lsl #16
        mov     r2, r1, asr #15
        cmp     r6, r9
        mov     r0, r0, asr #16
        mul     r1, lr, r0
        mov     r2, r2, lsl #16
        mov     lr, r2, asr #16
        mul     r12, lr, r12
        mov     r1, r1, asr #15
        mla     r1, r0, lr, r1
        add     r12, r1, r12, asr #15
        mov     r12, r12, lsl #1
        strh    r12, [r11], #2
        beq     LDVD11
        ldr     lr, [sp, #8]
        sub     r8, r8, #1
        mov     r1, r7
        mov     r12, r8, lsl #1
        ldrsh   r0, [lr, +r12]
        cmp     r0, #0
        beq     LDVD6
        cmp     r7, #0
        ble     LDVD5
        cmp     r7, #5
        blt     LDVD3
        ldr     r12, [sp, #0x10]
        add     r2, r4, r1, lsl #1
        str     r4, [sp, #0x24]
        add     lr, r12, r1, lsl #1
        ldr     r12, [sp, #0x28]
        str     r9, [sp, #0x18]
        ldr     r9, [sp, #0x30]
        add     r12, r12, r1, lsl #1
        str     r5, [sp, #0x1C]
        str     r6, [sp, #0x14]
LDVD2:
        ldrsh   r3, [lr]
        ldrsh   r6, [r12]
        ldrsh   r5, [lr, #-2]
        mul     r4, r0, r3
        ldrsh   r3, [lr, #-4]
        mul     r5, r0, r5
        ldrsh   r10, [lr, #-6]
        mul     r3, r0, r3
        add     r4, r6, r4, asr r9
        strh    r4, [r2]
        ldrsh   r4, [r12, #-2]
        mul     r10, r0, r10
        sub     lr, lr, #8
        add     r5, r4, r5, asr r9
        strh    r5, [r2, #-2]
        ldrsh   r4, [r12, #-4]
        sub     r1, r1, #4
        cmp     r1, #5
        add     r3, r4, r3, asr r9
        strh    r3, [r2, #-4]
        ldrsh   r3, [r12, #-6]
        sub     r12, r12, #8
        add     r10, r3, r10, asr r9
        strh    r10, [r2, #-6]
        sub     r2, r2, #8
        bge     LDVD2
        str     r9, [sp, #0x30]
        ldr     r4, [sp, #0x24]
        ldr     r5, [sp, #0x1C]
        ldr     r9, [sp, #0x18]
        ldr     r6, [sp, #0x14]
        ldr     r10, [sp, #0xC]
LDVD3:
        ldr     r12, [sp, #0x10]
        add     r2, r4, r1, lsl #1
        str     r6, [sp, #0x14]
        add     lr, r12, r1, lsl #1
        ldr     r12, [sp, #0x28]
        ldr     r6, [sp, #0x30]
        add     r12, r12, r1, lsl #1
LDVD4:
        ldrsh   r3, [lr], #-2
        ldrsh   r10, [r12], #-2
        mul     r3, r0, r3
        sub     r1, r1, #1
        cmp     r1, #0
        add     r3, r10, r3, asr r6
        strh    r3, [r2], #-2
        bgt     LDVD4
        ldr     r6, [sp, #0x14]
        ldr     r10, [sp, #0xC]
LDVD5:
        ldr     r12, [sp, #0x2C]
        ldr     lr, [sp, #0x20]
        mov     r0, r0, asr r12
        add     r12, sp, #0x34
        strh    r0, [lr, +r12]
        b       LDVD11
LDVD6:
        cmp     r7, #0
        ble     LDVD10
        cmp     r7, #6
        blt     LDVD8
        ldr     r12, [sp, #0x28]
        add     lr, r4, r1, lsl #1
        add     r12, r12, r1, lsl #1
LDVD7:
        ldrsh   r0, [r12]
        sub     r1, r1, #5
        cmp     r1, #6
        strh    r0, [lr]
        ldrsh   r0, [r12, #-2]
        strh    r0, [lr, #-2]
        ldrsh   r0, [r12, #-4]
        strh    r0, [lr, #-4]
        ldrsh   r0, [r12, #-6]
        strh    r0, [lr, #-6]
        ldrsh   r0, [r12, #-8]
        sub     r12, r12, #0xA
        strh    r0, [lr, #-8]
        sub     lr, lr, #0xA
        bge     LDVD7
LDVD8:
        ldr     r12, [sp, #0x28]
        add     r0, r4, r1, lsl #1
        add     r12, r12, r1, lsl #1
LDVD9:
        ldrsh   lr, [r12], #-2
        sub     r1, r1, #1
        cmp     r1, #0
        strh    lr, [r0], #-2
        bgt     LDVD9
LDVD10:
        ldr     lr, [sp, #0x20]
        mov     r0, #0
        add     r12, sp, #0x34
        strh    r0, [lr, +r12]
LDVD11:
        add     r6, r6, #1
        cmp     r6, r9
        ble     LDVD1
LDVD12:
        add     sp, sp, #0x45, 30
        ldmia   sp!, {r4 - r11, pc}


