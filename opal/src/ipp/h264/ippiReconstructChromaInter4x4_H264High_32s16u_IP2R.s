        .text
        .align  4
        .globl  _ippiReconstructChromaInter4x4_H264High_32s16u_IP2R


_ippiReconstructChromaInter4x4_H264High_32s16u_IP2R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x88
        cmp     r0, #0
        beq     LKWB36
        ldr     r2, [r0]
        cmp     r2, #0
        beq     LKWB36
        ldr     r1, [r0, #4]
        cmp     r1, #0
        beq     LKWB36
        ldr     r3, [r2]
        cmp     r3, #0
        beq     LKWB36
        ldr     r12, [r2, #4]
        cmp     r12, #0
        beq     LKWB36
        ldr     r3, [r3]
        cmp     r3, #0
        beq     LKWB36
        ldr     r3, [r1]
        cmp     r3, #0
        beq     LKWB36
        ldr     r12, [r1, #4]
        cmp     r12, #0
        beq     LKWB36
        ldr     r3, [r3]
        cmp     r3, #0
        beq     LKWB36
        ldr     r3, [r2, #0x14]
        cmp     r3, #0
        beq     LKWB36
        ldr     r3, [r1, #0x14]
        cmp     r3, #0
        beq     LKWB36
        ldr     r3, [r2, #8]
        cmp     r3, #0
        ble     LKWB35
        ldr     r3, [r1, #8]
        cmp     r3, #0
        ble     LKWB35
        ldr     r3, [r2, #0x10]
        cmp     r3, #0
        blt     LKWB32
        ldr     lr, [r2, #0x1C]
        add     r12, lr, lr, lsl #2
        add     r12, lr, r12
        sub     r12, r12, #9
        cmp     r3, r12
        bgt     LKWB32
        ldr     r3, [r1, #0x10]
        cmp     r3, #0
        blt     LKWB32
        cmp     r3, r12
        bgt     LKWB32
        ldr     r2, [r2, #0xC]
        cmp     r2, #0
        bne     LKWB0
        ldr     r1, [r1, #0xC]
        cmp     r1, #0
        beq     LKWB31
LKWB0:
        ldr     r12, [r0]
        ldr     lr, [pc, #0xBE8]
        ldr     r2, [pc, #0xBE8]
        ldr     r1, [r12, #0xC]
        add     r4, sp, #0x70
        add     r3, sp, #0x70
        str     lr, [r4]
        tst     r1, #1
        str     lr, [r3, #4]
        beq     LKWB3
        ldr     r3, [r12, #0x10]
        ldr     r1, [r12]
        ldr     r5, [r12, #0x14]
        smull   r4, lr, r3, r2
        ldr     r6, [r12, #0x18]
        ldr     r9, [r1]
        ldrsh   r12, [r5]
        add     r4, sp, #0x70
        cmp     r6, #0
        sub     lr, lr, r3, asr #31
        str     r9, [r4]
        beq     LKWB1
        cmp     r3, #0
        ble     LKWB2
LKWB1:
        ldr     r8, [r9, #0xC]
        ldr     r5, [r9, #8]
        ldr     r6, [r9]
        ldr     r7, [r9, #4]
        rsb     r1, r8, #0
        sub     r3, r1, r5
        add     r1, r8, r5
        add     r4, r6, r7
        add     r1, r4, r1
        add     r4, r4, r3
        mul     r3, r1, r12
        mul     r1, r4, r12
        add     r4, r6, r5
        sub     r6, r6, r5
        add     r5, r8, r7
        sub     r4, r4, r5
        mul     r4, r4, r12
        sub     r7, r7, r8
        sub     r6, r6, r7
        mul     r12, r6, r12
        mov     r1, r1, lsl lr
        mov     r3, r3, lsl lr
        mov     r4, r4, lsl lr
        mov     r3, r3, asr #5
        mov     lr, r12, lsl lr
        mov     r1, r1, asr #5
        str     r1, [r9, #8]
        mov     r4, r4, asr #5
        mov     lr, lr, asr #5
        str     r3, [r9]
        str     r4, [r9, #4]
        str     lr, [r9, #0xC]
        ldr     r1, [r0]
        ldr     r1, [r1]
        ldr     r9, [r1]
LKWB2:
        add     r9, r9, #0x10
        str     r9, [r1]
LKWB3:
        ldr     r4, [r0, #4]
        ldr     r1, [r4, #0xC]
        tst     r1, #1
        beq     LKWB6
        ldr     r3, [r4, #0x10]
        ldr     r1, [r4]
        ldr     r12, [r4, #0x14]
        smull   r5, lr, r3, r2
        ldr     r5, [r4, #0x18]
        ldr     r9, [r1]
        ldrsh   r12, [r12]
        add     r4, sp, #0x70
        cmp     r5, #0
        sub     lr, lr, r3, asr #31
        str     r9, [r4, #4]
        beq     LKWB4
        cmp     r3, #0
        ble     LKWB5
LKWB4:
        ldr     r8, [r9, #0xC]
        ldr     r5, [r9, #8]
        ldr     r6, [r9]
        ldr     r7, [r9, #4]
        rsb     r1, r8, #0
        sub     r3, r1, r5
        add     r1, r8, r5
        add     r4, r6, r7
        add     r1, r4, r1
        add     r4, r4, r3
        mul     r3, r1, r12
        mul     r1, r4, r12
        add     r4, r6, r5
        sub     r6, r6, r5
        add     r5, r8, r7
        sub     r4, r4, r5
        mul     r4, r4, r12
        sub     r7, r7, r8
        sub     r6, r6, r7
        mul     r12, r6, r12
        mov     r1, r1, lsl lr
        mov     r3, r3, lsl lr
        mov     r4, r4, lsl lr
        mov     r3, r3, asr #5
        mov     lr, r12, lsl lr
        mov     r1, r1, asr #5
        str     r1, [r9, #8]
        mov     r4, r4, asr #5
        mov     lr, lr, asr #5
        str     r3, [r9]
        str     r4, [r9, #4]
        str     lr, [r9, #0xC]
        ldr     r1, [r0, #4]
        ldr     r1, [r1]
        ldr     r9, [r1]
LKWB5:
        add     r9, r9, #0x10
        str     r9, [r1]
LKWB6:
        ldr     r1, [r0]
        add     lr, sp, #0x78
        add     r4, sp, #0x78
        ldr     r1, [r1, #4]
        mov     r5, #0
        add     r6, sp, #0x78
        add     r7, sp, #0x78
        mov     r12, r5
        mov     r8, #1
        mov     r3, r0
        str     r0, [sp, #0x28]
LKWB7:
        ldr     r0, [r3], #4
        ldr     lr, [pc, #0x9F0]
        ldr     r7, [r0, #0x10]
        ldr     r8, [r0, #0x14]
        add     r2, sp, #0x70
        mov     r4, #2
        smull   r6, lr, r7, lr
        ldr     r6, [r2, +r12, lsl #2]
        sub     r2, lr, r7, asr #31
        mov     r10, #1
        rsb     r11, r2, #3
        mov     r10, r10, lsl r11
        sub     r9, r2, #4
        rsb     r11, r2, #4
        mov     lr, #0
        str     r11, [sp, #0x10]
        str     r10, [sp, #0xC]
        str     r9, [sp, #8]
        str     r6, [sp, #0x20]
        str     r7, [sp, #0x1C]
        str     r8, [sp, #0x14]
        str     r3, [sp, #4]
        str     r12, [sp]
        str     r5, [sp, #0x24]
LKWB8:
        ldr     r3, [r0, #0xC]
        str     r1, [sp, #0x18]
        tst     r3, r4
        beq     LKWB21
        ldr     r0, [r0]
        ldr     r12, [r0]
        add     r3, r12, #0x40
        str     r3, [r0]
        ldr     r3, [sp, #0x24]
        ldr     r0, [sp, #0x28]
        ldr     r3, [r0, +r3, lsl #2]
        ldr     r0, [r3, #0x18]
        cmp     r0, #0
        beq     LKWB9
        ldr     r0, [sp, #0x1C]
        cmp     r0, #0
        ble     LKWB13
LKWB9:
        cmp     r2, #4
        blt     LKWB11
        ldr     r0, [sp, #0x14]
        ldr     r6, [sp, #8]
        mov     r5, r12
        mov     r3, #0x10
LKWB10:
        ldrsh   r7, [r0], #2
        ldr     r8, [r5]
        subs    r3, r3, #1
        mul     r7, r8, r7
        mov     r7, r7, lsl r6
        str     r7, [r5], #4
        bne     LKWB10
        str     r6, [sp, #8]
        b       LKWB13
LKWB11:
        ldr     r0, [sp, #0x14]
        ldr     r7, [sp, #0x10]
        ldr     r6, [sp, #0xC]
        mov     r5, r12
        mov     r3, #0x10
LKWB12:
        ldrsh   r8, [r0], #2
        ldr     r9, [r5]
        subs    r3, r3, #1
        mla     r8, r9, r8, r6
        mov     r8, r8, asr r7
        str     r8, [r5], #4
        bne     LKWB12
        str     r7, [sp, #0x10]
        str     r6, [sp, #0xC]
LKWB13:
        ldr     r0, [sp, #0x20]
        add     r3, sp, #0x78
        ldr     r5, [r0, +lr, lsl #2]
        add     r0, r12, #0x10
        str     r5, [r12]
        ldr     r5, [sp, #0x28]
        ldr     r6, [sp, #0x24]
        str     r12, [r3]
        add     r3, sp, #0x78
        str     r0, [r3, #4]
        ldr     r5, [r5, +r6, lsl #2]
        add     r3, r12, #0x20
        add     r0, r12, #0x30
        ldr     r5, [r5, #0x18]
        cmp     r5, #0
        add     r5, sp, #0x78
        str     r3, [r5, #8]
        add     r3, sp, #0x78
        str     r0, [r3, #0xC]
        beq     LKWB14
        ldr     r0, [sp, #0x1C]
        cmp     r0, #0
        ble     LKWB15
LKWB14:
        add     r0, sp, #0x78
        ldr     r6, [r0]
        ldr     r3, [r0, #4]
        ldr     r0, [r0, #8]
        ldr     r5, [r6, #8]
        ldr     r8, [r6]
        ldr     r10, [r6, #4]
        ldr     r9, [r6, #0xC]
        add     r7, r8, r5
        sub     r5, r8, r5
        rsb     r8, r9, r10, asr #1
        add     r9, r10, r9, asr #1
        add     r11, r7, r9
        add     r10, r5, r8
        sub     r5, r5, r8
        sub     r7, r7, r9
        str     r7, [r6, #0xC]
        str     r11, [r6]
        str     r10, [r6, #4]
        str     r5, [r6, #8]
        ldr     r6, [r3, #8]
        ldr     r8, [r3]
        ldr     r9, [r3, #4]
        ldr     r10, [r3, #0xC]
        add     r5, sp, #0x78
        ldr     r5, [r5, #0xC]
        add     r7, r8, r6
        sub     r6, r8, r6
        rsb     r8, r10, r9, asr #1
        add     r9, r9, r10, asr #1
        add     r10, r6, r8
        str     r10, [r3, #4]
        add     r11, r7, r9
        str     r11, [r3]
        sub     r7, r7, r9
        str     r7, [r3, #0xC]
        sub     r6, r6, r8
        str     r6, [r3, #8]
        ldr     r9, [r0]
        ldr     r3, [r0, #8]
        ldr     r7, [r0, #0xC]
        ldr     r6, [r0, #4]
        add     r8, r9, r3
        sub     r3, r9, r3
        add     r10, r6, r7, asr #1
        rsb     r9, r7, r6, asr #1
        add     r6, r8, r10
        str     r6, [r0]
        add     r7, r3, r9
        sub     r3, r3, r9
        sub     r8, r8, r10
        str     r3, [r0, #8]
        str     r8, [r0, #0xC]
        str     r7, [r0, #4]
        ldr     r6, [r5]
        ldr     r3, [r5, #8]
        ldr     r8, [r5, #0xC]
        ldr     r7, [r5, #4]
        add     r0, r6, r3
        sub     r3, r6, r3
        add     r9, r7, r8, asr #1
        rsb     r6, r8, r7, asr #1
        add     r7, r0, r9
        str     r7, [r5]
        add     r8, r3, r6
        str     r8, [r5, #4]
        sub     r3, r3, r6
        sub     r0, r0, r9
        str     r0, [r5, #0xC]
        str     r3, [r5, #8]
        ldr     r3, [r12, #4]
        ldr     r8, [r12, #8]
        ldr     r7, [r12, #0x34]
        ldr     r6, [r12, #0x14]
        ldr     r11, [r12, #0x20]
        ldr     r10, [r12, #0x30]
        ldr     r9, [r12, #0x10]
        ldr     r0, [r12]
        ldr     r5, [r12, #0x24]
        str     r8, [sp, #0x2C]
        ldr     r8, [r12, #0x28]
        str     r8, [sp, #0x30]
        ldr     r8, [r12, #0x18]
        str     r8, [sp, #0x34]
        ldr     r8, [r12, #0x38]
        str     r8, [sp, #0x38]
        ldr     r8, [r12, #0xC]
        str     r8, [sp, #0x3C]
        ldr     r8, [r12, #0x2C]
        str     r8, [sp, #0x40]
        ldr     r8, [r12, #0x1C]
        str     r8, [sp, #0x44]
        ldr     r8, [r12, #0x3C]
        str     r8, [sp, #0x48]
        add     r8, r0, r11
        sub     r0, r0, r11
        str     r0, [sp, #0x4C]
        rsb     r0, r10, r9, asr #1
        str     r0, [sp, #0x50]
        ldr     r11, [sp, #0x3C]
        add     r10, r9, r10, asr #1
        str     r10, [sp, #0x54]
        ldr     r10, [sp, #0x40]
        add     r0, r3, r5
        sub     r3, r3, r5
        ldr     r5, [sp, #0x2C]
        str     r3, [sp, #0x58]
        rsb     r3, r7, r6, asr #1
        str     r3, [sp, #0x5C]
        ldr     r3, [sp, #0x30]
        add     r7, r6, r7, asr #1
        add     r9, r5, r3
        sub     r5, r5, r3
        str     r5, [sp, #0x30]
        ldr     r3, [sp, #0x34]
        ldr     r5, [sp, #0x38]
        rsb     r6, r5, r3, asr #1
        add     r5, r3, r5, asr #1
        add     r3, r11, r10
        sub     r11, r11, r10
        ldr     r10, [sp, #0x44]
        str     r11, [sp, #0x40]
        ldr     r11, [sp, #0x48]
        str     r3, [sp, #0x38]
        rsb     r3, r11, r10, asr #1
        str     r3, [sp, #0x3C]
        add     r3, r10, r11, asr #1
        ldr     r10, [sp, #0x54]
        ldr     r11, [sp, #0x50]
        add     r10, r8, r10
        str     r10, [sp, #0x48]
        ldr     r10, [sp, #0x4C]
        add     r11, r10, r11
        str     r11, [sp, #0x44]
        ldr     r11, [sp, #0x4C]
        ldr     r10, [sp, #0x50]
        sub     r11, r11, r10
        ldr     r10, [sp, #0x54]
        str     r11, [sp, #0x50]
        sub     r8, r8, r10
        str     r8, [sp, #0x54]
        add     r8, r0, r7
        str     r8, [sp, #0x4C]
        ldr     r8, [sp, #0x58]
        ldr     r10, [sp, #0x5C]
        sub     r0, r0, r7
        ldr     r7, [sp, #0x4C]
        add     r10, r8, r10
        ldr     r8, [sp, #0x5C]
        str     r10, [sp, #0x34]
        ldr     r10, [sp, #0x58]
        str     r0, [sp, #0x58]
        ldr     r11, [sp, #0x58]
        add     r0, r9, r5
        str     r0, [sp, #0x2C]
        sub     r10, r10, r8
        str     r10, [sp, #0x5C]
        ldr     r0, [sp, #0x30]
        ldr     r8, [sp, #0x34]
        sub     r9, r9, r5
        ldr     r5, [sp, #0x3C]
        str     r9, [sp, #0x64]
        ldr     r9, [sp, #0x5C]
        add     r11, r11, #0x20
        str     r11, [sp, #0x5C]
        ldr     r11, [sp, #0x2C]
        add     r0, r0, r6
        str     r0, [sp, #0x60]
        ldr     r0, [sp, #0x30]
        add     r11, r11, #0x20
        str     r11, [sp, #0x58]
        ldr     r11, [sp, #0x60]
        sub     r0, r0, r6
        ldr     r6, [sp, #0x54]
        str     r0, [sp, #0x30]
        ldr     r0, [sp, #0x38]
        add     r11, r11, #0x20
        str     r11, [sp, #0x60]
        ldr     r11, [sp, #0x30]
        add     r0, r0, r3
        str     r0, [sp, #0x68]
        ldr     r0, [sp, #0x40]
        add     r11, r11, #0x20
        str     r11, [sp, #0x54]
        ldr     r11, [sp, #0x64]
        add     r5, r0, r5
        str     r5, [sp, #0x6C]
        ldr     r5, [sp, #0x40]
        ldr     r0, [sp, #0x3C]
        add     r11, r11, #0x20
        str     r11, [sp, #0x64]
        ldr     r11, [sp, #0x68]
        sub     r5, r5, r0
        ldr     r0, [sp, #0x38]
        add     r11, r11, #0x20
        str     r11, [sp, #0x68]
        ldr     r11, [sp, #0x6C]
        str     r5, [sp, #0x40]
        ldr     r5, [sp, #0x50]
        add     r11, r11, #0x20
        sub     r10, r0, r3
        ldr     r0, [sp, #0x48]
        str     r11, [sp, #0x6C]
        ldr     r11, [sp, #0x40]
        ldr     r3, [sp, #0x44]
        add     r7, r7, #0x20
        add     r0, r0, #0x20
        add     r11, r11, #0x20
        mov     r7, r7, asr #6
        add     r10, r10, #0x20
        add     r6, r6, #0x20
        str     r11, [sp, #0x50]
        str     r10, [sp, #0x4C]
        ldr     r11, [sp, #0x4C]
        mov     r0, r0, asr #6
        add     r9, r9, #0x20
        str     r7, [sp, #0x38]
        str     r0, [sp, #0x48]
        mov     r6, r6, asr #6
        ldr     r7, [sp, #0x54]
        str     r6, [sp, #0x3C]
        ldr     r6, [sp, #0x60]
        ldr     r10, [sp, #0x50]
        add     r3, r3, #0x20
        add     r5, r5, #0x20
        add     r8, r8, #0x20
        mov     r0, r9, asr #6
        ldr     r9, [sp, #0x6C]
        mov     r11, r11, asr #6
        mov     r3, r3, asr #6
        str     r11, [sp, #0x6C]
        mov     r5, r5, asr #6
        mov     r8, r8, asr #6
        mov     r7, r7, asr #6
        str     r3, [sp, #0x44]
        ldr     r11, [sp, #0x48]
        str     r5, [sp, #0x40]
        str     r8, [sp, #0x34]
        str     r7, [sp, #0x60]
        ldr     r3, [sp, #0x5C]
        ldr     r5, [sp, #0x58]
        ldr     r7, [sp, #0x64]
        ldr     r8, [sp, #0x68]
        str     r11, [r12]
        ldr     r11, [sp, #0x44]
        mov     r3, r3, asr #6
        mov     r5, r5, asr #6
        mov     r6, r6, asr #6
        str     r11, [r12, #0x10]
        ldr     r11, [sp, #0x40]
        mov     r7, r7, asr #6
        mov     r8, r8, asr #6
        str     r11, [r12, #0x20]
        ldr     r11, [sp, #0x3C]
        mov     r9, r9, asr #6
        mov     r10, r10, asr #6
        str     r11, [r12, #0x30]
        ldr     r11, [sp, #0x38]
        str     r11, [r12, #4]
        ldr     r11, [sp, #0x34]
        str     r0, [r12, #0x24]
        str     r3, [r12, #0x34]
        str     r11, [r12, #0x14]
        str     r5, [r12, #8]
        str     r6, [r12, #0x18]
        ldr     r0, [sp, #0x60]
        str     r7, [r12, #0x38]
        str     r8, [r12, #0xC]
        str     r0, [r12, #0x28]
        str     r9, [r12, #0x1C]
        str     r10, [r12, #0x2C]
        ldr     r0, [sp, #0x6C]
        str     r0, [r12, #0x3C]
LKWB15:
        ldr     r12, [sp, #0x18]
        ldr     r6, [sp, #0x24]
        ldr     r7, [sp, #0x28]
        mov     r3, #0
        mov     r5, #1
LKWB16:
        ldr     r8, [r7]
        ldrh    r10, [r12]
        add     r0, sp, #0x78
        ldr     r8, [r8, #0x1C]
        ldr     r0, [r0, +r3, lsl #2]
        mov     r8, r5, lsl r8
        rsb     r11, r8, #1
        sub     r8, r8, #1
        ldr     r9, [r0]
        cmp     r9, r11
        movgt   r11, r9
        cmp     r8, r11
        mov     r9, r11
        movlt   r9, r8
        add     r9, r10, r9
        cmp     r8, r9
        blt     LKWB17
        cmp     r8, r11
        mov     r9, r11
        movlt   r9, r8
        adds    r9, r10, r9
        movmi   r8, #0
        bmi     LKWB17
        cmp     r8, r11
        movlt   r11, r8
        add     r8, r11, r10
LKWB17:
        strh    r8, [r12]
        ldr     r9, [r7]
        ldr     r10, [r0, #4]
        ldrh    r8, [r12, #2]
        ldr     r9, [r9, #0x1C]
        mov     r11, r5, lsl r9
        rsb     r9, r11, #1
        cmp     r10, r9
        movgt   r9, r10
        sub     r10, r11, #1
        cmp     r10, r9
        mov     r11, r9
        movlt   r11, r10
        add     r11, r8, r11
        cmp     r10, r11
        blt     LKWB18
        cmp     r10, r9
        mov     r11, r9
        movlt   r11, r10
        adds    r11, r8, r11
        movmi   r10, #0
        bmi     LKWB18
        cmp     r10, r9
        movlt   r9, r10
        add     r10, r8, r9
LKWB18:
        strh    r10, [r12, #2]
        ldr     r9, [r7]
        ldr     r10, [r0, #8]
        ldrh    r8, [r12, #4]
        ldr     r9, [r9, #0x1C]
        mov     r11, r5, lsl r9
        rsb     r9, r11, #1
        cmp     r10, r9
        movgt   r9, r10
        sub     r10, r11, #1
        cmp     r10, r9
        mov     r11, r9
        movlt   r11, r10
        add     r11, r8, r11
        cmp     r10, r11
        blt     LKWB19
        cmp     r10, r9
        mov     r11, r9
        movlt   r11, r10
        adds    r11, r8, r11
        movmi   r10, #0
        bmi     LKWB19
        cmp     r10, r9
        movlt   r9, r10
        add     r10, r8, r9
LKWB19:
        strh    r10, [r12, #4]
        ldr     r8, [r7]
        ldr     r9, [r0, #0xC]
        ldrh    r0, [r12, #6]
        ldr     r8, [r8, #0x1C]
        mov     r10, r5, lsl r8
        rsb     r8, r10, #1
        cmp     r9, r8
        movgt   r8, r9
        sub     r9, r10, #1
        cmp     r9, r8
        mov     r10, r8
        movlt   r10, r9
        add     r10, r0, r10
        cmp     r9, r10
        blt     LKWB20
        cmp     r9, r8
        mov     r10, r8
        movlt   r10, r9
        adds    r10, r0, r10
        movmi   r9, #0
        bmi     LKWB20
        cmp     r9, r8
        movlt   r8, r9
        add     r9, r0, r8
LKWB20:
        strh    r9, [r12, #6]
        ldr     r0, [r7, +r6, lsl #2]
        add     r3, r3, #1
        cmp     r3, #4
        ldr     r0, [r0, #8]
        add     r12, r12, r0, lsl #1
        bcc     LKWB16
        b       LKWB28
LKWB21:
        ldr     r3, [sp, #0x20]
        ldr     r3, [r3, +lr, lsl #2]
        cmp     r3, #0
        beq     LKWB28
        ldr     r0, [r0, #0x18]
        cmp     r0, #0
        beq     LKWB22
        ldr     r0, [sp, #0x1C]
        cmp     r0, #0
        ble     LKWB33
LKWB22:
        ldr     r12, [sp, #0x18]
        ldr     r6, [sp, #0x24]
        ldr     r7, [sp, #0x28]
        add     r0, r3, #0x20
        mov     r3, #4
        mov     r5, #1
        mov     r0, r0, asr #6
LKWB23:
        ldr     r9, [r7]
        ldrh    r8, [r12]
        ldr     r9, [r9, #0x1C]
        mov     r9, r5, lsl r9
        rsb     r10, r9, #1
        cmp     r0, r10
        movgt   r10, r0
        sub     r9, r9, #1
        cmp     r9, r10
        movlt   r10, r9
        add     r10, r8, r10
        cmp     r9, r10
        blt     LKWB24
        cmp     r10, #0
        movlt   r9, #0
        movge   r9, r10
LKWB24:
        strh    r9, [r12]
        ldr     r9, [r7]
        ldrh    r8, [r12, #2]
        ldr     r9, [r9, #0x1C]
        mov     r9, r5, lsl r9
        rsb     r10, r9, #1
        cmp     r0, r10
        movgt   r10, r0
        sub     r9, r9, #1
        cmp     r9, r10
        movlt   r10, r9
        add     r8, r10, r8
        cmp     r9, r8
        blt     LKWB25
        cmp     r8, #0
        movlt   r9, #0
        movge   r9, r8
LKWB25:
        strh    r9, [r12, #2]
        ldr     r9, [r7]
        ldrh    r8, [r12, #4]
        ldr     r9, [r9, #0x1C]
        mov     r9, r5, lsl r9
        rsb     r10, r9, #1
        cmp     r0, r10
        movgt   r10, r0
        sub     r9, r9, #1
        cmp     r9, r10
        movlt   r10, r9
        add     r8, r10, r8
        cmp     r9, r8
        blt     LKWB26
        cmp     r8, #0
        movlt   r9, #0
        movge   r9, r8
LKWB26:
        strh    r9, [r12, #4]
        ldr     r9, [r7]
        ldrh    r8, [r12, #6]
        ldr     r9, [r9, #0x1C]
        mov     r9, r5, lsl r9
        rsb     r10, r9, #1
        cmp     r0, r10
        movgt   r10, r0
        sub     r9, r9, #1
        cmp     r9, r10
        movlt   r10, r9
        add     r8, r10, r8
        cmp     r9, r8
        blt     LKWB27
        cmp     r8, #0
        movlt   r9, #0
        movge   r9, r8
LKWB27:
        strh    r9, [r12, #6]
        ldr     r8, [r7, +r6, lsl #2]
        subs    r3, r3, #1
        ldr     r8, [r8, #8]
        add     r12, r12, r8, lsl #1
        bne     LKWB23
        str     r6, [sp, #0x24]
LKWB28:
        cmp     lr, #1
        add     r1, r1, #8
        bne     LKWB29
        ldr     r3, [sp, #0x24]
        ldr     r0, [sp, #0x28]
        ldr     r3, [r0, +r3, lsl #2]
        ldr     r0, [r3, #8]
        mov     r0, r0, lsl #2
        sub     r0, r0, #8
        add     r1, r1, r0, lsl #1
LKWB29:
        add     lr, lr, #1
        cmp     lr, #4
        mov     r4, r4, lsl #1
        bcs     LKWB30
        ldr     r0, [sp, #0x28]
        ldr     r3, [sp, #0x24]
        ldr     r0, [r0, +r3, lsl #2]
        b       LKWB8
LKWB30:
        ldr     r0, [sp, #0x28]
        ldr     r12, [sp]
        ldr     r5, [sp, #0x24]
        ldr     r0, [r0, #4]
        ldr     r3, [sp, #4]
        add     r12, r12, #1
        cmp     r12, #2
        ldr     r1, [r0, #4]
        add     r5, r5, #1
        bcc     LKWB7
LKWB31:
        mov     r0, #0
        add     sp, sp, #0x88
        ldmia   sp!, {r4 - r11, pc}
LKWB32:
        mvn     r0, #0xA
        add     sp, sp, #0x88
        ldmia   sp!, {r4 - r11, pc}
LKWB33:
        ldr     r0, [sp, #0x28]
        mov     r5, #1
        ldr     r12, [r0]
        ldrh    r0, [r1]
        ldr     r12, [r12, #0x1C]
        mov     r5, r5, lsl r12
        rsb     r12, r5, #1
        cmp     r3, r12
        movgt   r12, r3
        sub     r3, r5, #1
        cmp     r3, r12
        mov     r5, r12
        movlt   r5, r3
        add     r5, r0, r5
        cmp     r3, r5
        blt     LKWB34
        cmp     r3, r12
        mov     r5, r12
        movlt   r5, r3
        adds    r5, r0, r5
        movmi   r3, #0
        bmi     LKWB34
        cmp     r3, r12
        movlt   r12, r3
        add     r3, r12, r0
LKWB34:
        strh    r3, [r1]
        b       LKWB28
LKWB35:
        mvn     r0, #0xD
        add     sp, sp, #0x88
        ldmia   sp!, {r4 - r11, pc}
LKWB36:
        mvn     r0, #7
        add     sp, sp, #0x88
        ldmia   sp!, {r4 - r11, pc}
        .long   zeroArray32
        .long   0x2aaaaaab


