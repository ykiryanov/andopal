        .text
        .align  4
        .globl  ippiReconstructChroma422Inter4x4_H264High_32s16u_IP2R


ippiReconstructChroma422Inter4x4_H264High_32s16u_IP2R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x84
        cmp     r0, #0
        beq     LKWY37
        ldr     r12, [r0]
        cmp     r12, #0
        beq     LKWY37
        ldr     r3, [r0, #4]
        cmp     r3, #0
        beq     LKWY37
        ldr     r4, [r12]
        cmp     r4, #0
        beq     LKWY37
        ldr     lr, [r12, #4]
        cmp     lr, #0
        beq     LKWY37
        ldr     r4, [r4]
        cmp     r4, #0
        beq     LKWY37
        ldr     r4, [r3]
        cmp     r4, #0
        beq     LKWY37
        ldr     lr, [r3, #4]
        cmp     lr, #0
        beq     LKWY37
        ldr     r4, [r4]
        cmp     r4, #0
        beq     LKWY37
        ldr     lr, [r12, #0x14]
        cmp     lr, #0
        beq     LKWY37
        ldr     lr, [r3, #0x14]
        cmp     lr, #0
        beq     LKWY37
        ldr     lr, [r12, #0x10]
        cmp     lr, #0
        blt     LKWY33
        ldr     r4, [r12, #0x1C]
        add     r5, r4, r4, lsl #2
        add     r5, r4, r5
        sub     r4, r5, #9
        cmp     lr, r4
        bgt     LKWY33
        ldr     lr, [r3, #0x10]
        cmp     lr, #0
        blt     LKWY33
        cmp     lr, r4
        bgt     LKWY33
        ldr     r12, [r12, #0xC]
        cmp     r12, #0
        bne     LKWY0
        ldr     r3, [r3, #0xC]
        cmp     r3, #0
        beq     LKWY32
LKWY0:
        ldr     lr, [r0]
        ldr     r12, [pc, #0xD6C]
        add     r3, sp, #0x6C
        ldr     r4, [lr, #0xC]
        ldr     lr, [pc, #0xD64]
        add     r5, sp, #0x6C
        str     r12, [r3]
        str     r12, [r5, #4]
        tst     r4, #1
        mov     r12, #0
        bne     LKWY1
        mov     r5, r12
        str     r2, [sp, #0x20]
        str     r1, [sp, #0x24]
        b       LKWY6
LKWY1:
        ldr     r3, [r0]
        mov     r5, r12
        str     r12, [sp, #0x1C]
        str     r2, [sp, #0x20]
        str     r1, [sp, #0x24]
LKWY2:
        ldr     lr, [r3, #0x10]
        cmp     r5, #0
        add     r12, lr, #3
        ldrne   r1, [sp, #0x20]
        ldreq   r1, [sp, #0x24]
        ldr     r4, [pc, #0xD10]
        ldr     r2, [r3]
        ldr     r3, [r3, #0x18]
        smull   r4, r6, r12, r4
        sub     r12, r6, r12, asr #31
        ldr     r6, [r2]
        cmp     r3, #0
        add     r3, sp, #0x6C
        str     r6, [r3, +r5, lsl #2]
        beq     LKWY3
        cmp     lr, #0
        ble     LKWY5
LKWY3:
        ldr     r4, [r6, #0x18]
        ldr     r3, [r6, #0x10]
        ldr     lr, [r6]
        ldr     r9, [r6, #8]
        ldr     r10, [r6, #4]
        ldr     r11, [r6, #0xC]
        ldr     r7, [r6, #0x1C]
        ldr     r8, [r6, #0x14]
        add     r2, lr, r9
        sub     lr, lr, r9
        add     r9, r10, r11
        str     r2, [sp, #0x18]
        str     r9, [sp, #0x14]
        sub     r10, r10, r11
        rsb     r9, r7, #0
        rsb     r2, r4, #0
        str     r10, [sp, #0x10]
        add     r10, r3, r4
        sub     r11, r4, r3
        sub     r9, r9, r8
        sub     r2, r2, r3
        sub     r3, r3, r4
        str     r9, [sp, #0xC]
        add     r4, r8, r7
        sub     r9, r7, r8
        sub     r8, r8, r7
        ldr     r7, [sp, #0x18]
        str     r9, [sp, #8]
        add     r11, lr, r11
        add     r10, r7, r10
        ldr     r7, [sp, #0x18]
        add     lr, lr, r3
        ldr     r3, [sp, #0x14]
        str     r10, [sp, #4]
        cmp     r12, #6
        add     r2, r7, r2
        add     r10, r3, r4
        ldr     r4, [sp, #0xC]
        add     r7, r3, r4
        ldr     r3, [sp, #0x10]
        ldr     r4, [sp, #8]
        add     r9, r3, r8
        add     r8, r2, r7
        add     r4, r3, r4
        add     r3, r6, #8
        str     r3, [sp, #0x18]
        str     r8, [sp, #0xC]
        add     r8, r11, r4
        add     r3, r6, #0x10
        str     r3, [sp, #0x14]
        str     r8, [sp, #8]
        add     r3, r6, #0x18
        add     r8, lr, r9
        str     r3, [sp, #0x10]
        ldr     r3, [sp, #4]
        str     r8, [sp]
        ldr     r8, [sp, #4]
        sub     r2, r2, r7
        ldr     r7, [sp, #0x18]
        sub     r11, r11, r4
        add     r4, sp, #0x74
        add     r3, r3, r10
        str     r7, [r4, #4]
        ldr     r7, [sp, #0x14]
        add     r4, sp, #0x74
        sub     r8, r8, r10
        str     r7, [r4, #8]
        ldr     r7, [sp, #0x10]
        add     r4, sp, #0x74
        str     r3, [r6]
        str     r7, [r4, #0xC]
        ldr     r4, [sp, #0xC]
        sub     lr, lr, r9
        str     r4, [r6, #8]
        ldr     r4, [sp, #8]
        str     r4, [r6, #0x10]
        ldr     r4, [sp]
        str     r8, [r6, #4]
        str     r2, [r6, #0xC]
        str     r4, [r6, #0x18]
        str     r11, [r6, #0x14]
        str     lr, [r6, #0x1C]
        bge     LKWY4
        ldr     r2, [r6, #0x14]
        ldr     r10, [r6, #0x10]
        ldr     r7, [r6, #8]
        ldr     lr, [r6, #0x18]
        ldr     r4, [r6, #4]
        ldr     r9, [r6, #0xC]
        str     r2, [sp, #0x18]
        ldr     r2, [r6, #0x1C]
        mov     r8, #1
        str     r2, [sp, #0x14]
        rsb     r2, r12, #5
        mov     r8, r8, lsl r2
        mla     r2, r3, r1, r8
        mla     r3, r10, r1, r8
        ldr     r10, [sp, #0x18]
        mla     r7, r7, r1, r8
        mla     lr, lr, r1, r8
        mla     r4, r4, r1, r8
        mla     r9, r9, r1, r8
        mla     r10, r10, r1, r8
        ldr     r11, [sp, #0x14]
        rsb     r12, r12, #6
        mov     r2, r2, asr r12
        mla     r8, r11, r1, r8
        mov     r7, r7, asr r12
        mov     r3, r3, asr r12
        mov     lr, lr, asr r12
        mov     r4, r4, asr r12
        mov     r9, r9, asr r12
        mov     r10, r10, asr r12
        str     r2, [r6]
        mov     r12, r8, asr r12
        str     r7, [r6, #8]
        str     r3, [r6, #0x10]
        str     lr, [r6, #0x18]
        str     r4, [r6, #4]
        str     r9, [r6, #0xC]
        str     r10, [r6, #0x14]
        str     r12, [r6, #0x1C]
        ldr     r1, [sp, #0x1C]
        ldr     r1, [r1, +r0]
        ldr     r2, [r1]
        ldr     r6, [r2]
        b       LKWY5
LKWY4:
        mul     r3, r3, r1
        ldr     lr, [r6, #8]
        ldr     r2, [r6, #0x10]
        sub     r12, r12, #6
        mul     lr, lr, r1
        mov     r3, r3, lsl r12
        str     r3, [r6]
        mul     r3, r2, r1
        ldr     r4, [r6, #0x18]
        ldr     r2, [r6, #4]
        mov     lr, lr, lsl r12
        str     lr, [r6, #8]
        mul     lr, r4, r1
        mov     r3, r3, lsl r12
        str     r3, [r6, #0x10]
        mul     r3, r2, r1
        ldr     r2, [r6, #0xC]
        mov     lr, lr, lsl r12
        str     lr, [r6, #0x18]
        mul     r2, r2, r1
        ldr     lr, [r6, #0x14]
        mov     r3, r3, lsl r12
        str     r3, [r6, #4]
        mul     r3, lr, r1
        ldr     lr, [r6, #0x1C]
        mov     r2, r2, lsl r12
        str     r2, [r6, #0xC]
        mul     r1, lr, r1
        mov     r3, r3, lsl r12
        str     r3, [r6, #0x14]
        mov     r12, r1, lsl r12
        str     r12, [r6, #0x1C]
        ldr     r1, [sp, #0x1C]
        ldr     r1, [r1, +r0]
        ldr     r2, [r1]
        ldr     r6, [r2]
LKWY5:
        add     r6, r6, #0x20
        str     r6, [r2]
LKWY6:
        add     r1, r0, r5, lsl #2
LKWY7:
        add     r5, r5, #1
        cmp     r5, #2
        add     r1, r1, #4
        bcs     LKWY8
        ldr     r3, [r1]
        mov     r12, r5, lsl #2
        ldr     r2, [r3, #0xC]
        tst     r2, #1
        beq     LKWY7
        str     r12, [sp, #0x1C]
        b       LKWY2
LKWY8:
        ldr     r1, [r0]
        ldr     lr, [pc, #0xA18]
        add     r3, sp, #0x74
        ldr     r1, [r1, #4]
        mov     r8, #0
        add     r2, sp, #0x74
        add     r4, sp, #0x74
        add     r12, sp, #0x74
        mov     r7, r8
        mov     r6, #1
        mov     r5, r0
LKWY9:
        ldr     r4, [r5], #4
        add     r3, sp, #0x6C
        ldr     r2, [r4, #0x14]
        ldr     r9, [r4, #0x10]
        mov     r12, #2
        str     r2, [sp]
        smull   r10, r2, r9, lr
        ldr     r3, [r3, +r7, lsl #2]
        sub     r2, r2, r9, asr #31
        rsb     r10, r2, #3
        mov     r10, r6, lsl r10
        str     r10, [sp, #0xC]
        str     r3, [sp, #4]
        sub     r11, r2, #4
        rsb     r10, r2, #4
        mov     r3, #0
        str     r11, [sp, #8]
        str     r10, [sp, #0x18]
        str     r9, [sp, #0x20]
        str     r5, [sp, #0x14]
        str     r7, [sp, #0x10]
        str     r8, [sp, #0x24]
        str     r0, [sp, #0x28]
LKWY10:
        ldr     r0, [r4, #0xC]
        str     r1, [sp, #0x1C]
        tst     r0, r12
        beq     LKWY23
        ldr     r0, [r4]
        ldr     r4, [r0]
        add     lr, r4, #0x40
        str     lr, [r0]
        ldr     lr, [sp, #0x24]
        ldr     r0, [sp, #0x28]
        ldr     lr, [r0, +lr, lsl #2]
        ldr     r0, [lr, #0x18]
        cmp     r0, #0
        beq     LKWY11
        ldr     r0, [sp, #0x20]
        cmp     r0, #0
        ble     LKWY15
LKWY11:
        cmp     r2, #4
        blt     LKWY13
        ldr     r0, [sp]
        ldr     r6, [sp, #8]
        mov     r5, r4
        mov     lr, #0x10
LKWY12:
        ldrsh   r7, [r0], #2
        ldr     r8, [r5]
        subs    lr, lr, #1
        mul     r7, r8, r7
        mov     r7, r7, lsl r6
        str     r7, [r5], #4
        bne     LKWY12
        b       LKWY15
LKWY13:
        ldr     r0, [sp]
        ldr     r7, [sp, #0x18]
        ldr     r6, [sp, #0xC]
        mov     r5, r4
        mov     lr, #0x10
LKWY14:
        ldrsh   r8, [r0], #2
        ldr     r9, [r5]
        subs    lr, lr, #1
        mla     r8, r9, r8, r6
        mov     r8, r8, asr r7
        str     r8, [r5], #4
        bne     LKWY14
LKWY15:
        ldr     r0, [sp, #4]
        add     lr, sp, #0x74
        ldr     r5, [r0, +r3, lsl #2]
        add     r0, r4, #0x10
        str     r5, [r4]
        ldr     r5, [sp, #0x28]
        ldr     r6, [sp, #0x24]
        str     r4, [lr]
        add     lr, sp, #0x74
        str     r0, [lr, #4]
        ldr     r5, [r5, +r6, lsl #2]
        add     lr, r4, #0x20
        add     r0, r4, #0x30
        ldr     r5, [r5, #0x18]
        cmp     r5, #0
        add     r5, sp, #0x74
        str     lr, [r5, #8]
        add     lr, sp, #0x74
        str     r0, [lr, #0xC]
        beq     LKWY16
        ldr     r0, [sp, #0x20]
        cmp     r0, #0
        ble     LKWY17
LKWY16:
        add     r0, sp, #0x74
        ldr     r6, [r0]
        ldr     lr, [r0, #4]
        ldr     r0, [r0, #8]
        ldr     r8, [r6]
        ldr     r5, [r6, #8]
        ldr     r9, [r6, #0xC]
        ldr     r10, [r6, #4]
        add     r7, r8, r5
        sub     r5, r8, r5
        rsb     r8, r9, r10, asr #1
        add     r9, r10, r9, asr #1
        add     r10, r5, r8
        add     r11, r7, r9
        sub     r5, r5, r8
        sub     r7, r7, r9
        str     r11, [r6]
        str     r10, [r6, #4]
        str     r5, [r6, #8]
        str     r7, [r6, #0xC]
        ldr     r8, [lr]
        ldr     r6, [lr, #8]
        ldr     r10, [lr, #0xC]
        ldr     r9, [lr, #4]
        add     r5, sp, #0x74
        ldr     r5, [r5, #0xC]
        add     r7, r8, r6
        sub     r6, r8, r6
        rsb     r8, r10, r9, asr #1
        add     r9, r9, r10, asr #1
        add     r10, r6, r8
        add     r11, r7, r9
        sub     r6, r6, r8
        str     r10, [lr, #4]
        str     r6, [lr, #8]
        str     r11, [lr]
        sub     r7, r7, r9
        str     r7, [lr, #0xC]
        ldr     r9, [r0]
        ldr     lr, [r0, #8]
        ldr     r6, [r0, #4]
        ldr     r7, [r0, #0xC]
        add     r8, r9, lr
        sub     lr, r9, lr
        rsb     r9, r7, r6, asr #1
        add     r10, r6, r7, asr #1
        add     r7, lr, r9
        str     r7, [r0, #4]
        add     r6, r8, r10
        sub     lr, lr, r9
        str     r6, [r0]
        str     lr, [r0, #8]
        sub     r8, r8, r10
        str     r8, [r0, #0xC]
        ldr     r6, [r5]
        ldr     lr, [r5, #8]
        ldr     r8, [r5, #0xC]
        ldr     r7, [r5, #4]
        add     r0, r6, lr
        sub     lr, r6, lr
        add     r9, r7, r8, asr #1
        rsb     r6, r8, r7, asr #1
        add     r8, lr, r6
        str     r8, [r5, #4]
        add     r7, r0, r9
        str     r7, [r5]
        sub     lr, lr, r6
        str     lr, [r5, #8]
        sub     r0, r0, r9
        str     r0, [r5, #0xC]
        ldr     r11, [r4, #8]
        ldr     r6, [r4, #0x14]
        ldr     r9, [r4, #0x10]
        ldr     lr, [r4, #4]
        ldr     r0, [r4, #0x20]
        ldr     r10, [r4, #0x30]
        ldr     r8, [r4]
        ldr     r7, [r4, #0x34]
        ldr     r5, [r4, #0x24]
        str     r11, [sp, #0x2C]
        ldr     r11, [r4, #0x28]
        str     r11, [sp, #0x30]
        ldr     r11, [r4, #0x18]
        str     r11, [sp, #0x34]
        ldr     r11, [r4, #0x38]
        str     r11, [sp, #0x38]
        ldr     r11, [r4, #0xC]
        str     r11, [sp, #0x3C]
        ldr     r11, [r4, #0x2C]
        str     r11, [sp, #0x40]
        ldr     r11, [r4, #0x1C]
        str     r11, [sp, #0x44]
        ldr     r11, [r4, #0x3C]
        str     r11, [sp, #0x48]
        add     r11, r8, r0
        sub     r8, r8, r0
        str     r8, [sp, #0x50]
        str     r11, [sp, #0x4C]
        rsb     r0, r10, r9, asr #1
        add     r8, lr, r5
        sub     lr, lr, r5
        ldr     r5, [sp, #0x2C]
        str     r0, [sp, #0x54]
        ldr     r11, [sp, #0x54]
        str     lr, [sp, #0x58]
        add     r0, r9, r10, asr #1
        ldr     r10, [sp, #0x3C]
        ldr     r9, [sp, #0x40]
        rsb     lr, r7, r6, asr #1
        str     lr, [sp, #0x5C]
        ldr     lr, [sp, #0x30]
        add     r7, r6, r7, asr #1
        str     r7, [sp, #0x60]
        add     r6, r5, lr
        sub     r5, r5, lr
        ldr     lr, [sp, #0x34]
        ldr     r7, [sp, #0x38]
        str     r5, [sp, #0x30]
        rsb     r5, r7, lr, asr #1
        add     lr, lr, r7, asr #1
        add     r7, r10, r9
        sub     r10, r10, r9
        ldr     r9, [sp, #0x44]
        str     r10, [sp, #0x40]
        ldr     r10, [sp, #0x48]
        rsb     r10, r10, r9, asr #1
        str     r10, [sp, #0x3C]
        ldr     r10, [sp, #0x48]
        add     r9, r9, r10, asr #1
        ldr     r10, [sp, #0x4C]
        add     r10, r10, r0
        str     r10, [sp, #0x48]
        ldr     r10, [sp, #0x50]
        add     r11, r10, r11
        ldr     r10, [sp, #0x54]
        str     r11, [sp, #0x44]
        ldr     r11, [sp, #0x50]
        sub     r11, r11, r10
        ldr     r10, [sp, #0x4C]
        str     r11, [sp, #0x54]
        sub     r10, r10, r0
        ldr     r0, [sp, #0x60]
        str     r10, [sp, #0x50]
        ldr     r10, [sp, #0x5C]
        add     r0, r8, r0
        str     r0, [sp, #0x4C]
        ldr     r0, [sp, #0x58]
        add     r10, r0, r10
        ldr     r0, [sp, #0x5C]
        str     r10, [sp, #0x38]
        ldr     r10, [sp, #0x58]
        sub     r10, r10, r0
        ldr     r0, [sp, #0x60]
        str     r10, [sp, #0x5C]
        sub     r10, r7, r9
        sub     r8, r8, r0
        add     r0, r6, lr
        str     r0, [sp, #0x58]
        ldr     r0, [sp, #0x30]
        str     r8, [sp, #0x60]
        ldr     r11, [sp, #0x60]
        ldr     r8, [sp, #0x38]
        add     r0, r0, r5
        str     r0, [sp, #0x34]
        ldr     r0, [sp, #0x30]
        add     r11, r11, #0x20
        str     r11, [sp, #0x60]
        sub     r0, r0, r5
        str     r0, [sp, #0x30]
        ldr     r11, [sp, #0x58]
        ldr     r5, [sp, #0x54]
        sub     r6, r6, lr
        str     r6, [sp, #0x2C]
        ldr     lr, [sp, #0x3C]
        add     r0, r7, r9
        ldr     r9, [sp, #0x5C]
        str     r0, [sp, #0x64]
        ldr     r0, [sp, #0x40]
        ldr     r6, [sp, #0x50]
        ldr     r7, [sp, #0x4C]
        add     r11, r11, #0x20
        str     r11, [sp, #0x5C]
        ldr     r11, [sp, #0x34]
        add     lr, r0, lr
        ldr     r0, [sp, #0x3C]
        add     r11, r11, #0x20
        str     r11, [sp, #0x58]
        ldr     r11, [sp, #0x30]
        str     lr, [sp, #0x68]
        ldr     lr, [sp, #0x40]
        add     r11, r11, #0x20
        str     r11, [sp, #0x54]
        ldr     r11, [sp, #0x2C]
        sub     lr, lr, r0
        ldr     r0, [sp, #0x48]
        add     r11, r11, #0x20
        str     r11, [sp, #0x50]
        ldr     r11, [sp, #0x64]
        str     lr, [sp, #0x40]
        ldr     lr, [sp, #0x44]
        add     r11, r11, #0x20
        str     r11, [sp, #0x64]
        ldr     r11, [sp, #0x68]
        add     r6, r6, #0x20
        add     r0, r0, #0x20
        add     r11, r11, #0x20
        str     r11, [sp, #0x68]
        ldr     r11, [sp, #0x40]
        mov     r6, r6, asr #6
        mov     r0, r0, asr #6
        str     r6, [sp, #0x38]
        ldr     r6, [sp, #0x54]
        str     r0, [sp, #0x44]
        ldr     r0, [sp, #0x60]
        add     lr, lr, #0x20
        add     r5, r5, #0x20
        add     r7, r7, #0x20
        add     r8, r8, #0x20
        add     r9, r9, #0x20
        add     r11, r11, #0x20
        str     r11, [sp, #0x4C]
        add     r10, r10, #0x20
        mov     lr, lr, asr #6
        mov     r5, r5, asr #6
        mov     r7, r7, asr #6
        mov     r8, r8, asr #6
        mov     r9, r9, asr #6
        mov     r6, r6, asr #6
        str     r10, [sp, #0x48]
        str     lr, [sp, #0x40]
        ldr     r11, [sp, #0x44]
        str     r5, [sp, #0x3C]
        str     r7, [sp, #0x34]
        str     r8, [sp, #0x30]
        str     r9, [sp, #0x2C]
        str     r6, [sp, #0x60]
        ldr     lr, [sp, #0x5C]
        ldr     r5, [sp, #0x58]
        ldr     r6, [sp, #0x50]
        ldr     r7, [sp, #0x64]
        ldr     r8, [sp, #0x68]
        ldr     r9, [sp, #0x4C]
        ldr     r10, [sp, #0x48]
        str     r11, [r4]
        ldr     r11, [sp, #0x40]
        mov     r0, r0, asr #6
        mov     lr, lr, asr #6
        mov     r5, r5, asr #6
        str     r11, [r4, #0x10]
        ldr     r11, [sp, #0x3C]
        mov     r6, r6, asr #6
        mov     r7, r7, asr #6
        str     r11, [r4, #0x20]
        ldr     r11, [sp, #0x38]
        mov     r8, r8, asr #6
        mov     r9, r9, asr #6
        str     r11, [r4, #0x30]
        ldr     r11, [sp, #0x34]
        mov     r10, r10, asr #6
        str     r11, [r4, #4]
        ldr     r11, [sp, #0x30]
        str     r11, [r4, #0x14]
        ldr     r11, [sp, #0x2C]
        str     r0, [r4, #0x34]
        str     lr, [r4, #8]
        str     r11, [r4, #0x24]
        str     r5, [r4, #0x18]
        ldr     r0, [sp, #0x60]
        str     r6, [r4, #0x38]
        str     r7, [r4, #0xC]
        str     r0, [r4, #0x28]
        str     r8, [r4, #0x1C]
        str     r9, [r4, #0x2C]
        str     r10, [r4, #0x3C]
LKWY17:
        ldr     r4, [sp, #0x1C]
        ldr     r6, [sp, #0x24]
        ldr     r7, [sp, #0x28]
        mov     lr, #0
        mov     r5, #1
LKWY18:
        ldr     r8, [r7]
        ldrh    r10, [r4]
        add     r0, sp, #0x74
        ldr     r8, [r8, #0x1C]
        ldr     r0, [r0, +lr, lsl #2]
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
        blt     LKWY19
        cmp     r8, r11
        mov     r9, r11
        movlt   r9, r8
        adds    r9, r10, r9
        movmi   r8, #0
        bmi     LKWY19
        cmp     r8, r11
        movlt   r11, r8
        add     r8, r11, r10
LKWY19:
        strh    r8, [r4]
        ldr     r9, [r7]
        ldr     r10, [r0, #4]
        ldrh    r8, [r4, #2]
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
        blt     LKWY20
        cmp     r10, r9
        mov     r11, r9
        movlt   r11, r10
        adds    r11, r8, r11
        movmi   r10, #0
        bmi     LKWY20
        cmp     r10, r9
        movlt   r9, r10
        add     r10, r8, r9
LKWY20:
        strh    r10, [r4, #2]
        ldr     r9, [r7]
        ldr     r10, [r0, #8]
        ldrh    r8, [r4, #4]
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
        blt     LKWY21
        cmp     r10, r9
        mov     r11, r9
        movlt   r11, r10
        adds    r11, r8, r11
        movmi   r10, #0
        bmi     LKWY21
        cmp     r10, r9
        movlt   r9, r10
        add     r10, r8, r9
LKWY21:
        strh    r10, [r4, #4]
        ldr     r8, [r7]
        ldr     r9, [r0, #0xC]
        ldrh    r0, [r4, #6]
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
        blt     LKWY22
        cmp     r9, r8
        mov     r10, r8
        movlt   r10, r9
        adds    r10, r0, r10
        movmi   r9, #0
        bmi     LKWY22
        cmp     r9, r8
        movlt   r8, r9
        add     r9, r0, r8
LKWY22:
        strh    r9, [r4, #6]
        ldr     r0, [r7, +r6, lsl #2]
        add     lr, lr, #1
        cmp     lr, #4
        ldr     r0, [r0, #8]
        add     r4, r4, r0, lsl #1
        bcc     LKWY18
        b       LKWY30
LKWY23:
        ldr     r0, [sp, #4]
        ldr     r0, [r0, +r3, lsl #2]
        cmp     r0, #0
        beq     LKWY30
        ldr     r4, [r4, #0x18]
        cmp     r4, #0
        beq     LKWY24
        ldr     lr, [sp, #0x20]
        cmp     lr, #0
        ble     LKWY34
LKWY24:
        ldr     r4, [sp, #0x1C]
        ldr     r6, [sp, #0x24]
        ldr     r7, [sp, #0x28]
        add     r0, r0, #0x20
        mov     lr, #4
        mov     r5, #1
        mov     r0, r0, asr #6
LKWY25:
        ldr     r9, [r7]
        ldrh    r8, [r4]
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
        blt     LKWY26
        cmp     r10, #0
        movlt   r9, #0
        movge   r9, r10
LKWY26:
        strh    r9, [r4]
        ldr     r9, [r7]
        ldrh    r8, [r4, #2]
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
        blt     LKWY27
        cmp     r8, #0
        movlt   r9, #0
        movge   r9, r8
LKWY27:
        strh    r9, [r4, #2]
        ldr     r9, [r7]
        ldrh    r8, [r4, #4]
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
        blt     LKWY28
        cmp     r8, #0
        movlt   r9, #0
        movge   r9, r8
LKWY28:
        strh    r9, [r4, #4]
        ldr     r9, [r7]
        ldrh    r8, [r4, #6]
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
        blt     LKWY29
        cmp     r8, #0
        movlt   r9, #0
        movge   r9, r8
LKWY29:
        strh    r9, [r4, #6]
        ldr     r8, [r7, +r6, lsl #2]
        subs    lr, lr, #1
        ldr     r8, [r8, #8]
        add     r4, r4, r8, lsl #1
        bne     LKWY25
LKWY30:
        and     r0, r3, #1
        cmp     r0, #1
        add     r1, r1, #8
        bne     LKWY31
        ldr     lr, [sp, #0x24]
        ldr     r0, [sp, #0x28]
        ldr     lr, [r0, +lr, lsl #2]
        ldr     r0, [lr, #8]
        mov     r0, r0, lsl #2
        sub     r0, r0, #8
        add     r1, r1, r0, lsl #1
LKWY31:
        add     r3, r3, #1
        cmp     r3, #8
        mov     r12, r12, lsl #1
        bcs     LKWY36
        ldr     lr, [sp, #0x24]
        ldr     r0, [sp, #0x28]
        ldr     r4, [r0, +lr, lsl #2]
        b       LKWY10
LKWY32:
        mov     r0, #0
        add     sp, sp, #0x84
        ldmia   sp!, {r4 - r11, pc}
LKWY33:
        mvn     r0, #0xA
        add     sp, sp, #0x84
        ldmia   sp!, {r4 - r11, pc}
LKWY34:
        ldr     lr, [sp, #0x28]
        mov     r5, #1
        ldr     r4, [lr]
        ldrh    lr, [r1]
        ldr     r4, [r4, #0x1C]
        mov     r5, r5, lsl r4
        rsb     r4, r5, #1
        cmp     r0, r4
        movgt   r4, r0
        sub     r0, r5, #1
        cmp     r0, r4
        mov     r5, r4
        movlt   r5, r0
        add     r5, lr, r5
        cmp     r0, r5
        blt     LKWY35
        cmp     r0, r4
        mov     r5, r4
        movlt   r5, r0
        adds    r5, lr, r5
        movmi   r0, #0
        bmi     LKWY35
        cmp     r0, r4
        movlt   r4, r0
        add     r0, r4, lr
LKWY35:
        strh    r0, [r1]
        b       LKWY30
LKWY36:
        ldr     r0, [sp, #0x28]
        ldr     r7, [sp, #0x10]
        ldr     r5, [sp, #0x14]
        ldr     r1, [r0, #4]
        ldr     r8, [sp, #0x24]
        ldr     lr, [pc, #0x30]
        add     r7, r7, #1
        ldr     r1, [r1, #4]
        cmp     r7, #2
        mov     r6, #1
        add     r8, r8, #1
        bcc     LKWY9
        mov     r0, #0
        add     sp, sp, #0x84
        ldmia   sp!, {r4 - r11, pc}
LKWY37:
        mvn     r0, #7
        add     sp, sp, #0x84
        ldmia   sp!, {r4 - r11, pc}
        .long   zeroArray32
        .long   0x2aaaaaab


