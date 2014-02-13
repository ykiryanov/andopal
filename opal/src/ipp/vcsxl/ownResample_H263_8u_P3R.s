        .text
        .align  4
        .globl  ownResample_H263_8u_P3R


ownResample_H263_8u_P3R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x15, 28
        ldr     r4, [sp, #0x174]
        str     r2, [sp, #0x148]
        ldr     lr, [sp, #0x1A8]
        str     r4, [sp, #0x60]
        ldr     r4, [sp, #0x178]
        ldr     r12, [sp, #0x188]
        ldr     r5, [sp, #0x18C]
        str     r4, [sp, #0x5C]
        ldr     r4, [sp, #0x17C]
        cmp     lr, #0
        ldr     lr, [sp, #0x184]
        str     r4, [sp, #0x58]
        ldr     r4, [sp, #0x180]
        str     lr, [sp, #0xC8]
        str     r4, [sp, #0x64]
        str     r3, [sp, #0x14C]
        str     r0, [sp, #0x50]
        ldr     r0, [sp, #0x19C]
        str     r12, [sp, #0xB8]
        ldr     r12, [sp, #0x194]
        str     r0, [sp, #0xC0]
        ldr     r0, [sp, #0x1A0]
        str     r12, [sp, #0xC4]
        ldr     r12, [sp, #0x198]
        str     r0, [sp, #0xCC]
        ldr     r0, [sp, #0x1AC]
        str     r12, [sp, #0xBC]
        str     r3, [sp, #0x24]
        ldr     r12, [sp, #0x1A4]
        ldr     r3, [sp, #0x1B0]
        ldr     r4, [sp, #0x190]
        str     r1, [sp, #0x54]
        mov     r6, r2
        str     r0, [sp, #0x48]
        moveq   r0, #1
        streq   r0, [sp, #0x4C]
        movne   r0, #4
        strne   r0, [sp, #0x4C]
        ldrsh   r9, [r12, #2]
        ldrsh   r1, [r12]
        ldrsh   r2, [r12, #8]
        ldrsh   r8, [r12, #6]
        ldrsh   r11, [r12, #0xA]
        ldrsh   lr, [r12, #4]
        ldrsh   r0, [r12, #0xC]
        ldr     r7, [r3]
        ldrsh   r12, [r12, #0xE]
        sub     r10, r6, r5
        add     r0, r2, r0
        str     r7, [sp, #0xB4]
        ldr     r7, [r3, #4]
        add     r10, r1, r10, lsl #1
        add     lr, r10, lr
        str     r7, [sp, #0xB0]
        ldr     r3, [r3, #8]
        mov     r7, r1, lsl #4
        add     r12, r11, r12
        str     r3, [sp, #0xAC]
        ldr     r3, [sp, #0x24]
        add     r2, r1, r2
        add     r0, lr, r0
        sub     r3, r3, r4
        cmp     r5, #1
        mov     lr, lr, lsl #4
        add     r3, r9, r3, lsl #1
        add     r10, r8, r3
        add     r8, r9, r8
        add     r3, r11, r3
        add     r12, r10, r12
        mov     r2, r2, lsl #4
        mov     r0, r0, lsl #4
        mov     r8, r8, lsl #4
        mov     r3, r3, lsl #4
        mov     r12, r12, lsl #4
        str     r2, [sp, #0xC]
        str     r0, [sp, #0x14]
        mov     r9, r9, lsl #4
        str     r8, [sp, #0x10]
        str     r3, [sp]
        str     r12, [sp, #0x2C]
        ble     LFEY55
        mov     r0, #0
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x18]
        mov     r8, #1
LFEY0:
        mov     r8, r8, lsl #1
        cmp     r8, r5
        add     r0, r0, #1
        blt     LFEY0
        str     r0, [sp, #0x18]
LFEY1:
        cmp     r4, #1
        mov     r10, #1
        movle   r0, #0
        strle   r0, [sp, #0x20]
        ble     LFEY3
        mov     r0, #0
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #0x20]
LFEY2:
        mov     r10, r10, lsl #1
        cmp     r10, r4
        add     r0, r0, #1
        blt     LFEY2
        str     r0, [sp, #0x20]
LFEY3:
        rsb     r3, r8, #0
        mul     r0, r7, r3
        mov     r12, r5, asr #1
        str     r12, [sp, #0x28]
        mla     r0, r5, r7, r0
        mlas    r0, lr, r8, r0
        str     r0, [sp, #8]
        bmi     LFEY54
        ldr     r0, [sp, #8]
        ldr     r12, [sp, #0x28]
        add     r0, r12, r0
LFEY4:
        mul     r11, r9, r3
        mov     r1, r5
        bl      __intel_idiv
        mla     r11, r5, r9, r11
        str     r0, [sp, #0x38]
        ldr     r0, [sp, #0x10]
        mlas    r11, r8, r0, r11
        str     r11, [sp, #4]
        bmi     LFEY53
        ldr     r0, [sp, #4]
        ldr     r3, [sp, #0x28]
        add     r0, r3, r0
LFEY5:
        ldr     r3, [sp, #0xC]
        mov     r1, r5
        mul     r11, r3, r10
        bl      __intel_idiv
        rsb     r3, r10, r4
        str     r0, [sp, #0x30]
        mlas    r11, r3, r7, r11
        submi   r0, r11, r4, asr #1
        addpl   r0, r11, r4, asr #1
        ldr     r3, [sp]
        mov     r1, r4
        mul     r11, r10, r3
        bl      __intel_idiv
        rsb     r3, r10, r4
        str     r0, [sp, #0x1C]
        mlas    r11, r3, r9, r11
        submi   r0, r11, r4, asr #1
        addpl   r0, r11, r4, asr #1
        ldr     r3, [sp, #0x14]
        mul     r11, r5, r4
        mul     r3, r8, r3
        mov     r1, r4
        str     r3, [sp, #0x13C]
        bl      __intel_idiv
        ldr     r3, [sp, #0x13C]
        ldr     r12, [sp, #0xC]
        rsb     lr, r8, r5
        mla     r3, lr, r12, r3
        ldr     r12, [sp, #8]
        str     r0, [sp, #0x14]
        sub     r0, r4, r10
        str     r0, [sp, #0xC]
        mul     r3, r3, r10
        mlas    r3, r12, r0, r3
        submi   r0, r3, r11, asr #1
        addpl   r0, r3, r11, asr #1
        ldr     r3, [sp, #0x2C]
        mov     r1, r11
        mul     r3, r8, r3
        str     r3, [sp, #0x13C]
        bl      __intel_idiv
        ldr     r3, [sp, #0x13C]
        ldr     r12, [sp]
        rsb     lr, r8, r5
        str     r0, [sp, #0x10]
        mla     r3, lr, r12, r3
        ldr     r12, [sp, #4]
        mul     r0, r3, r10
        ldr     r3, [sp, #0xC]
        mlas    r0, r12, r3, r0
        submi   r0, r0, r11, asr #1
        addpl   r0, r0, r11, asr #1
        mov     r1, r11
        bl      __intel_idiv
        cmp     r4, #0
        ble     LFEY45
        mov     r3, r10, lsl #1
        rsb     r12, r7, #0
        mla     lr, r7, r3, r12
        mla     r12, r7, r10, r12
        mov     r8, r8, lsl #6
        str     r8, [sp, #0x68]
        str     lr, [sp, #0x13C]
        ldr     r8, [sp, #0x48]
        str     r12, [sp, #0x138]
        rsb     r12, r9, #0
        mla     lr, r9, r3, r12
        mla     r12, r9, r10, r12
        str     r0, [sp, #0xFC]
        str     r9, [sp, #0xF8]
        str     lr, [sp, #0x134]
        ldr     lr, [sp, #0x38]
        str     r12, [sp, #0x130]
        ldr     r1, [sp, #0x134]
        rsb     r12, lr, #0
        mla     r11, lr, r3, r12
        mla     r12, r10, lr, r12
        ldr     lr, [sp, #0x30]
        str     r7, [sp, #0xF4]
        str     r4, [sp, #0xF0]
        str     r12, [sp, #0x128]
        rsb     r12, lr, #0
        mla     r3, lr, r3, r12
        mla     r12, r10, lr, r12
        ldr     r10, [sp, #0x4C]
        str     r11, [sp, #0x12C]
        ldr     r2, [sp, #0x12C]
        str     r3, [sp, #0x124]
        mov     lr, r10, lsl #1
        str     r12, [sp, #0x120]
        ldr     r12, [sp, #0x18]
        str     lr, [sp, #0x98]
        sub     lr, lr, #1
        str     lr, [sp, #0x11C]
        mov     r11, #0
        str     r11, [sp, #0xA8]
        str     r11, [sp, #0xC]
        ldr     r7, [sp, #0xC]
        mov     r11, #1
        sub     r3, r12, r10
        mov     r10, r11, lsl r10
        str     r10, [sp, #8]
        ldr     r10, [sp, #0x13C]
        mov     lr, r6, asr #1
        str     lr, [sp]
        ldr     lr, [sp, #0x24]
        mov     r11, #1
        str     r5, [sp, #0xEC]
        mov     lr, lr, asr #1
        str     lr, [sp, #4]
        ldr     lr, [sp, #0x1C]
        str     r6, [sp, #0x108]
        add     r10, r10, lr
        str     r10, [sp, #0x9C]
        ldr     r10, [sp, #0x20]
        mov     r11, r11, lsl r10
        str     r11, [sp, #0xA0]
        add     r11, r10, #1
        str     r11, [sp, #0xA4]
        ldr     r11, [sp, #0x14]
        ldr     r5, [sp, #0xA4]
        sub     r10, r10, #1
        add     r1, r1, r11
        str     r1, [sp, #0x94]
        ldr     r1, [sp, #0x10]
        str     r10, [sp, #0x44]
        ldr     r10, [sp, #0x60]
        add     r1, r2, r1
        str     r1, [sp, #0x90]
        ldr     r1, [sp, #0x124]
        add     r1, r1, r0
        str     r1, [sp, #0x88]
        add     r1, r3, #5
        add     r3, r3, #6
        str     r3, [sp, #0x7C]
        add     r3, r12, #1
        str     r3, [sp, #0x80]
        ldr     r3, [sp, #8]
        str     r1, [sp, #0x8C]
        ldr     r4, [sp, #0x8C]
        sub     r3, r3, #1
        str     r3, [sp, #0x6C]
        sub     r3, r6, #1
        str     r3, [sp, #0x70]
        ldr     r3, [sp, #0x24]
        ldr     r6, [sp, #0xA0]
        add     r12, r12, #6
        sub     r3, r3, #1
        str     r3, [sp, #0x74]
        ldr     r3, [sp, #0x54]
        str     r12, [sp, #0x84]
        ldr     r12, [sp, #0x50]
        add     r3, r12, r3
        str     r3, [sp, #0x78]
        ldr     r3, [sp, #0x11C]
        mov     r12, #1
        add     r3, r8, r12, lsl r3
        str     r3, [sp, #0x48]
        ldr     r3, [sp, #0x138]
        ldr     r12, [sp, #0x10]
        ldr     r8, [sp, #0x5C]
        add     r3, lr, r3
        str     r3, [sp, #0x40]
        ldr     r3, [sp, #0x130]
        add     r8, r10, r8
        ldr     r10, [sp, #0x64]
        add     r3, r11, r3
        str     r3, [sp, #0x3C]
        ldr     r3, [sp, #0x128]
        ldr     r11, [sp, #0x58]
        str     r8, [sp, #0x104]
        add     r3, r12, r3
        str     r3, [sp, #0x34]
        ldr     r3, [sp, #0x120]
        ldr     r8, [sp, #0xA8]
        add     r10, r11, r10
        add     lr, r0, r3
        ldr     r3, [sp]
        str     r10, [sp, #0x2C]
        str     lr, [sp, #0x100]
        ldr     lr, [sp, #0xC8]
        sub     r12, r3, #1
        ldr     r3, [sp, #4]
        str     r12, [sp, #0xE4]
        sub     r3, r3, #1
        str     r3, [sp, #0x110]
LFEY6:
        ldr     r0, [sp, #0x1C]
        ldr     r1, [sp, #0xFC]
        ldr     r9, [sp, #0xF4]
        mul     r3, r8, r0
        ldr     r0, [sp, #0x14]
        mul     r1, r1, r8
        ldr     r10, [sp, #0x90]
        mul     r2, r8, r0
        ldr     r0, [sp, #0x10]
        rsb     r12, r8, #0
        mla     r3, r9, r12, r3
        ldr     r9, [sp, #0xF8]
        mul     r0, r8, r0
        mla     r2, r9, r12, r2
        ldr     r9, [sp, #0x38]
        mla     r0, r9, r12, r0
        ldr     r9, [sp, #0x30]
        mla     r12, r9, r12, r1
        ldr     r1, [sp, #0x84]
        str     r0, [sp, #0xE0]
        add     r10, r10, r0
        mov     r1, r7, lsl r1
        str     r1, [sp, #0x13C]
        ldr     r1, [sp, #0x9C]
        add     r9, r1, r3
        ldr     r1, [sp, #0x94]
        add     r11, r9, r6
        add     r0, r11, r9, asr #31
        ldr     r9, [sp, #0x88]
        add     r1, r1, r2
        add     r11, r1, r6
        add     r1, r11, r1, asr #31
        mov     r1, r1, asr r5
        add     r9, r9, r12
        str     r1, [sp, #0x138]
        add     r1, r9, r6
        add     r9, r1, r9, asr #31
        ldr     r1, [sp, #0x80]
        add     r11, r10, r6
        mov     r0, r0, asr r5
        add     r10, r11, r10, asr #31
        str     r9, [sp, #0x134]
        ldr     r11, [sp, #0x13C]
        mov     r9, r0, lsl r1
        rsb     r10, r0, r10, asr r5
        mov     r0, #1
        add     r0, r9, r0, lsl r4
        mov     r1, #1
        ldr     r9, [sp, #0x138]
        str     r0, [sp, #0x13C]
        ldr     r0, [sp, #0x134]
        add     r1, r11, r1, lsl r4
        ldr     r11, [sp, #0x80]
        rsb     r0, r9, r0, asr r5
        add     r9, r1, r9, lsl r11
        ldr     r11, [sp, #0xF0]
        add     r9, r9, r0
        str     r9, [sp, #0x120]
        ldr     r9, [sp, #0x68]
        cmp     r7, r11, asr #1
        ldr     r11, [sp, #0x13C]
        add     r11, r11, r10
        add     r10, r9, r10, lsl #1
        str     r11, [sp, #0x124]
        str     r10, [sp, #0x10C]
        bge     LFEY34
        ldr     r9, [sp, #0x40]
        ldr     r11, [sp, #0xE0]
        add     r10, r3, r9
        ldr     r3, [sp, #0x3C]
        ldr     r9, [sp, #0x44]
        add     r2, r2, r3
        mov     r3, #1
        add     r3, r10, r3, lsl r9
        str     r3, [sp, #0x13C]
        ldr     r3, [sp, #0x34]
        add     r3, r11, r3
        ldr     r11, [sp, #0x13C]
        add     r10, r11, r10, asr #31
        str     r10, [sp, #0x13C]
        ldr     r10, [sp, #0x100]
        ldr     r11, [sp, #0x13C]
        add     r10, r12, r10
        mov     r12, #1
        add     r12, r2, r12, lsl r9
        str     r12, [sp, #0x138]
        ldr     r12, [sp, #0x20]
        mov     r11, r11, asr r12
        str     r11, [sp, #0x13C]
        ldr     r11, [sp, #0x138]
        add     r11, r11, r2, asr #31
        mov     r2, #1
        mov     r11, r11, asr r12
        str     r11, [sp, #0x138]
        add     r2, r3, r2, lsl r9
        mov     r11, #1
        add     r9, r10, r11, lsl r9
        add     r3, r2, r3, asr #31
        add     r11, r9, r10, asr #31
        ldr     r2, [sp, #0x13C]
        ldr     r9, [sp, #0x18]
        mov     r10, r2, lsl r9
        rsb     r2, r2, r3, asr r12
        mov     r3, #1
        add     r3, r10, r3, lsl r4
        ldr     r10, [sp, #0x138]
        add     r3, r3, r2
        str     r3, [sp, #0xDC]
        add     r9, r1, r10, lsl r9
        ldr     r1, [sp, #0x28]
        rsb     r12, r10, r11, asr r12
        add     r9, r9, r12
        cmp     r1, #0
        ldr     r1, [sp, #0x68]
        str     r9, [sp, #0xE0]
        add     r2, r1, r2, lsl #1
        movle   r1, #0
        ble     LFEY24
        mov     r3, lr
        ldr     r9, [sp, #0xC4]
        ldr     r10, [sp, #0xC0]
        str     r3, [sp, #0x114]
        str     r0, [sp, #0xD8]
        str     r7, [sp, #0xC]
        ldr     r3, [sp, #0xE4]
        ldr     r4, [sp, #0x48]
        ldr     r5, [sp, #0x98]
        ldr     r0, [sp, #0x70]
        ldr     r6, [sp, #0xB4]
        ldr     r7, [sp, #0x4C]
        mov     r1, #0
        str     r1, [sp, #0x12C]
        str     r10, [sp, #0x118]
        str     r9, [sp, #0x128]
        str     lr, [sp, #0xC8]
        str     r2, [sp, #0xD4]
        str     r12, [sp, #0xD0]
        str     r8, [sp, #0xA8]
LFEY7:
        ldr     r2, [sp, #0x7C]
        ldr     r1, [sp, #0x124]
        ldr     r12, [sp, #0x120]
        cmp     r6, #0
        mov     r1, r1, asr r2
        mov     r2, r12, asr r2
        ldr     r12, [sp, #0x6C]
        mov     r8, r2, asr r7
        mov     lr, r1, asr r7
        and     r2, r12, r2
        and     r1, r1, r12
        str     r2, [sp, #0x13C]
        blt     LFEY51
        cmp     lr, #0
        blt     LFEY8
        cmp     lr, r0
        bgt     LFEY8
        cmp     r8, #0
        blt     LFEY8
        ldr     r2, [sp, #0x74]
        cmp     r8, r2
        bgt     LFEY8
        ldr     r2, [sp, #0x54]
        ldr     r12, [sp, #0x50]
        mul     r2, r2, r8
        add     r12, r12, lr
        ldrb    r12, [r2, +r12]
        b       LFEY9
LFEY8:
        mov     r12, r6
LFEY9:
        adds    r10, lr, #1
        bmi     LFEY10
        cmp     r10, r0
        bgt     LFEY10
        cmp     r8, #0
        blt     LFEY10
        ldr     r2, [sp, #0x74]
        cmp     r8, r2
        bgt     LFEY10
        ldr     r2, [sp, #0x50]
        ldr     r9, [sp, #0x54]
        add     r2, r2, lr
        mla     r2, r9, r8, r2
        ldrb    r2, [r2, #1]
        b       LFEY11
LFEY10:
        mov     r2, r6
LFEY11:
        cmp     lr, #0
        blt     LFEY12
        cmp     lr, r0
        bgt     LFEY12
        adds    r9, r8, #1
        bmi     LFEY12
        ldr     r11, [sp, #0x74]
        cmp     r9, r11
        bgt     LFEY12
        ldr     r9, [sp, #0x54]
        ldr     r11, [sp, #0x78]
        mla     r9, r9, r8, lr
        ldrb    r9, [r9, +r11]
        b       LFEY13
LFEY12:
        mov     r9, r6
LFEY13:
        cmp     r10, #0
        blt     LFEY14
        cmp     r10, r0
        bgt     LFEY14
        adds    r10, r8, #1
        bmi     LFEY14
        ldr     r11, [sp, #0x74]
        cmp     r10, r11
        bgt     LFEY14
        ldr     r10, [sp, #0x78]
        add     lr, lr, r10
        ldr     r10, [sp, #0x54]
        mla     lr, r10, r8, lr
        ldrb    r10, [lr, #1]
        b       LFEY15
LFEY14:
        mov     r10, r6
LFEY15:
        mov     lr, r9, lsl r7
        sub     r10, r10, r9
        mla     r8, r1, r10, lr
        mov     lr, r12, lsl r7
        sub     r2, r2, r12
        mla     lr, r1, r2, lr
        ldr     r1, [sp, #0x13C]
        ldr     r2, [sp, #8]
        ldr     r9, [sp, #0xE0]
        mul     r12, r1, r8
        cmp     r6, #0
        sub     r8, r2, r1
        ldr     r2, [sp, #0xDC]
        ldr     r1, [sp, #0x7C]
        mla     r8, r8, lr, r12
        ldr     lr, [sp, #0x6C]
        mov     r2, r2, asr r1
        mov     r1, r9, asr r1
        and     r12, r2, lr
        mov     r10, r2, asr r7
        ldr     r2, [sp, #0x114]
        add     r8, r8, r4
        mov     r9, r1, asr r7
        and     lr, lr, r1
        sub     r8, r8, #1
        mov     r1, r8, asr r5
        strb    r1, [r2], #1
        str     r2, [sp, #0x114]
        blt     LFEY50
        cmp     r10, #0
        blt     LFEY16
        cmp     r10, r3
        bgt     LFEY16
        cmp     r9, #0
        blt     LFEY16
        ldr     r1, [sp, #0x110]
        cmp     r9, r1
        bgt     LFEY16
        ldr     r1, [sp, #0x5C]
        mul     r11, r1, r9
        ldr     r1, [sp, #0x64]
        mul     r8, r9, r1
        ldr     r1, [sp, #0x60]
        add     r2, r1, r10
        ldr     r1, [sp, #0x58]
        ldrb    r2, [r11, +r2]
        add     r1, r10, r1
        str     r2, [sp, #0x138]
        ldrb    r1, [r8, +r1]
        str     r1, [sp, #0x11C]
        b       LFEY17
LFEY16:
        ldr     r1, [sp, #0xB0]
        str     r1, [sp, #0x138]
        ldr     r1, [sp, #0xAC]
        str     r1, [sp, #0x11C]
LFEY17:
        cmp     r6, #0
        blt     LFEY49
        adds    r8, r10, #1
        bmi     LFEY18
        cmp     r8, r3
        bgt     LFEY18
        cmp     r9, #0
        blt     LFEY18
        ldr     r1, [sp, #0x110]
        cmp     r9, r1
        bgt     LFEY18
        ldr     r1, [sp, #0x60]
        ldr     r2, [sp, #0x5C]
        ldr     r11, [sp, #0x64]
        add     r1, r1, r10
        mla     r1, r2, r9, r1
        ldr     r2, [sp, #0x58]
        add     r2, r10, r2
        mla     r2, r9, r11, r2
        ldrb    r1, [r1, #1]
        str     r1, [sp, #0x13C]
        ldrb    r2, [r2, #1]
        str     r2, [sp, #0x130]
        b       LFEY19
LFEY18:
        ldr     r1, [sp, #0xB0]
        str     r1, [sp, #0x13C]
        ldr     r1, [sp, #0xAC]
        str     r1, [sp, #0x130]
LFEY19:
        cmp     r6, #0
        blt     LFEY48
        cmp     r10, #0
        blt     LFEY20
        cmp     r10, r3
        bgt     LFEY20
        adds    r1, r9, #1
        bmi     LFEY20
        ldr     r2, [sp, #0x110]
        cmp     r1, r2
        bgt     LFEY20
        ldr     r2, [sp, #0x64]
        ldr     r1, [sp, #0x5C]
        ldr     r11, [sp, #0x2C]
        mla     r2, r9, r2, r10
        mla     r1, r1, r9, r10
        str     r2, [sp, #0x134]
        ldr     r2, [sp, #0x104]
        ldrb    r1, [r1, +r2]
        ldr     r2, [sp, #0x134]
        ldrb    r2, [r2, +r11]
        b       LFEY21
LFEY20:
        ldr     r1, [sp, #0xB0]
        ldr     r2, [sp, #0xAC]
LFEY21:
        cmp     r6, #0
        blt     LFEY47
        cmp     r8, #0
        blt     LFEY22
        cmp     r8, r3
        bgt     LFEY22
        adds    r8, r9, #1
        bmi     LFEY22
        ldr     r11, [sp, #0x110]
        cmp     r8, r11
        bgt     LFEY22
        ldr     r8, [sp, #0x104]
        ldr     r11, [sp, #0x5C]
        add     r8, r10, r8
        mla     r8, r11, r9, r8
        str     r8, [sp, #0x134]
        ldr     r8, [sp, #0x2C]
        add     r10, r10, r8
        ldr     r8, [sp, #0x64]
        mla     r10, r9, r8, r10
        ldr     r8, [sp, #0x134]
        ldrb    r8, [r8, #1]
        str     r8, [sp, #0x134]
        ldrb    r10, [r10, #1]
        str     r10, [sp, #0xE8]
        b       LFEY23
LFEY22:
        ldr     r8, [sp, #0xB0]
        str     r8, [sp, #0x134]
        ldr     r8, [sp, #0xAC]
        str     r8, [sp, #0xE8]
LFEY23:
        ldr     r11, [sp, #0x138]
        ldr     r10, [sp, #0x13C]
        mul     r9, r12, lr
        ldr     r8, [sp, #8]
        rsb     r10, r11, r10
        mov     r11, r11, lsl r7
        mla     r11, r10, r12, r11
        mov     r10, r1, lsl r7
        mul     r10, lr, r10
        sub     r8, r8, lr
        str     r11, [sp, #0x13C]
        ldr     r11, [sp, #0x130]
        str     r10, [sp, #0x138]
        ldr     r10, [sp, #0x11C]
        rsb     r11, r10, r11
        str     r11, [sp, #0x130]
        ldr     r11, [sp, #0x130]
        mov     r10, r10, lsl r7
        mla     r12, r11, r12, r10
        ldr     r10, [sp, #0x13C]
        ldr     r11, [sp, #0x138]
        mla     r10, r8, r10, r11
        mov     r11, r2, lsl r7
        mul     lr, lr, r11
        ldr     r11, [sp, #0x134]
        rsb     r11, r1, r11
        mla     r10, r11, r9, r10
        ldr     r1, [sp, #0xE8]
        ldr     r11, [sp, #0x124]
        mla     lr, r8, r12, lr
        rsb     r2, r2, r1
        ldr     r1, [sp, #0x10C]
        add     r10, r10, r4
        sub     r10, r10, #1
        mla     r9, r2, r9, lr
        mov     r12, r10, asr r5
        add     r11, r1, r11
        ldr     r1, [sp, #0x128]
        str     r11, [sp, #0x124]
        add     r9, r9, r4
        sub     r9, r9, #1
        strb    r12, [r1], #1
        ldr     r2, [sp, #0xD8]
        str     r1, [sp, #0x128]
        ldr     r1, [sp, #0x120]
        ldr     r12, [sp, #0x118]
        add     r2, r1, r2, lsl #1
        str     r2, [sp, #0x120]
        ldr     r2, [sp, #0xDC]
        ldr     r1, [sp, #0xD4]
        add     r2, r1, r2
        str     r2, [sp, #0xDC]
        ldr     r2, [sp, #0x12C]
        mov     r1, r9, asr r5
        add     r2, r2, #1
        str     r2, [sp, #0x12C]
        strb    r1, [r12], #1
        ldr     r1, [sp, #0x28]
        str     r12, [sp, #0x118]
        cmp     r2, r1
        ldr     r2, [sp, #0xD0]
        ldr     r1, [sp, #0xE0]
        add     r2, r1, r2, lsl #1
        str     r2, [sp, #0xE0]
        blt     LFEY7
        ldr     r1, [sp, #0x12C]
        ldr     lr, [sp, #0xC8]
        ldr     r0, [sp, #0xD8]
        ldr     r4, [sp, #0x8C]
        ldr     r5, [sp, #0xA4]
        ldr     r6, [sp, #0xA0]
        ldr     r7, [sp, #0xC]
        ldr     r8, [sp, #0xA8]
LFEY24:
        ldr     r2, [sp, #0xEC]
        cmp     r1, r2
        bge     LFEY44
        str     r0, [sp, #0xD8]
        str     r7, [sp, #0xC]
        str     r8, [sp, #0xA8]
        ldr     r7, [sp, #0x120]
        ldr     r8, [sp, #0x124]
        ldr     r0, [sp, #0x70]
        ldr     r3, [sp, #0xB4]
        ldr     r9, [sp, #0x4C]
        add     r2, r1, lr
        str     r2, [sp, #0xD4]
        str     lr, [sp, #0xC8]
LFEY25:
        ldr     r2, [sp, #0x7C]
        ldr     lr, [sp, #0x6C]
        cmp     r3, #0
        mov     r12, r8, asr r2
        mov     r5, r12, asr r9
        mov     r2, r7, asr r2
        and     r12, r12, lr
        mov     r6, r2, asr r9
        and     lr, lr, r2
        blt     LFEY46
        cmp     r5, #0
        blt     LFEY26
        cmp     r5, r0
        bgt     LFEY26
        cmp     r6, #0
        blt     LFEY26
        ldr     r2, [sp, #0x74]
        cmp     r6, r2
        bgt     LFEY26
        ldr     r2, [sp, #0x54]
        ldr     r4, [sp, #0x50]
        mul     r2, r2, r6
        add     r4, r4, r5
        ldrb    r4, [r2, +r4]
        b       LFEY27
LFEY26:
        mov     r4, r3
LFEY27:
        adds    r10, r5, #1
        bmi     LFEY28
        cmp     r10, r0
        bgt     LFEY28
        cmp     r6, #0
        blt     LFEY28
        ldr     r2, [sp, #0x74]
        cmp     r6, r2
        bgt     LFEY28
        ldr     r2, [sp, #0x50]
        ldr     r11, [sp, #0x54]
        add     r2, r2, r5
        mla     r2, r11, r6, r2
        ldrb    r2, [r2, #1]
        str     r2, [sp, #0xD0]
        b       LFEY29
LFEY28:
        str     r3, [sp, #0xD0]
LFEY29:
        cmp     r5, #0
        blt     LFEY30
        cmp     r5, r0
        bgt     LFEY30
        adds    r11, r6, #1
        bmi     LFEY30
        ldr     r2, [sp, #0x74]
        cmp     r11, r2
        bgt     LFEY30
        ldr     r2, [sp, #0x54]
        ldr     r11, [sp, #0x78]
        mla     r2, r2, r6, r5
        ldrb    r2, [r2, +r11]
        b       LFEY31
LFEY30:
        mov     r2, r3
LFEY31:
        cmp     r10, #0
        blt     LFEY32
        cmp     r10, r0
        bgt     LFEY32
        adds    r11, r6, #1
        bmi     LFEY32
        ldr     r10, [sp, #0x74]
        cmp     r11, r10
        bgt     LFEY32
        ldr     r10, [sp, #0x78]
        add     r5, r5, r10
        ldr     r10, [sp, #0x54]
        mla     r5, r10, r6, r5
        ldrb    r6, [r5, #1]
        b       LFEY33
LFEY32:
        mov     r6, r3
LFEY33:
        sub     r6, r6, r2
        mov     r5, r2, lsl r9
        mla     r2, r12, r6, r5
        ldr     r6, [sp, #0xD0]
        mov     r5, r4, lsl r9
        add     r1, r1, #1
        mul     r2, lr, r2
        sub     r6, r6, r4
        mla     r12, r12, r6, r5
        ldr     r4, [sp, #8]
        sub     lr, r4, lr
        ldr     r4, [sp, #0x10C]
        mla     r2, lr, r12, r2
        ldr     r12, [sp, #0xEC]
        add     r8, r4, r8
        ldr     r4, [sp, #0xD8]
        cmp     r1, r12
        ldr     r12, [sp, #0x48]
        add     r7, r7, r4, lsl #1
        add     r12, r2, r12
        sub     r2, r12, #1
        ldr     r12, [sp, #0x98]
        mov     r2, r2, asr r12
        ldr     r12, [sp, #0xD4]
        strb    r2, [r12], #1
        str     r12, [sp, #0xD4]
        blt     LFEY25
        ldr     lr, [sp, #0xC8]
        ldr     r4, [sp, #0x8C]
        ldr     r5, [sp, #0xA4]
        ldr     r6, [sp, #0xA0]
        ldr     r7, [sp, #0xC]
        ldr     r8, [sp, #0xA8]
        b       LFEY44
LFEY34:
        ldr     r1, [sp, #0xEC]
        cmp     r1, #0
        ble     LFEY44
        mov     r2, lr
        ldr     r1, [sp, #0xEC]
        str     r2, [sp, #0xD4]
        str     r0, [sp, #0xD8]
        str     r7, [sp, #0xC]
        ldr     r4, [sp, #0x120]
        ldr     r5, [sp, #0x124]
        ldr     r6, [sp, #0x74]
        ldr     r0, [sp, #0x70]
        ldr     r2, [sp, #0xB4]
        ldr     r7, [sp, #0x4C]
        str     lr, [sp, #0xC8]
        str     r8, [sp, #0xA8]
LFEY35:
        ldr     r12, [sp, #0x7C]
        ldr     r8, [sp, #0x6C]
        cmp     r2, #0
        mov     r3, r5, asr r12
        mov     r12, r4, asr r12
        mov     lr, r12, asr r7
        mov     r9, r3, asr r7
        and     r12, r8, r12
        and     r3, r3, r8
        str     r12, [sp, #0xE8]
        blt     LFEY52
        cmp     r9, #0
        blt     LFEY36
        cmp     r9, r0
        bgt     LFEY36
        cmp     lr, #0
        blt     LFEY36
        cmp     lr, r6
        bgt     LFEY36
        ldr     r12, [sp, #0x54]
        ldr     r8, [sp, #0x50]
        mul     r12, lr, r12
        add     r8, r9, r8
        ldrb    r12, [r12, +r8]
        b       LFEY37
LFEY36:
        mov     r12, r2
LFEY37:
        adds    r10, r9, #1
        bmi     LFEY38
        cmp     r10, r0
        bgt     LFEY38
        cmp     lr, #0
        blt     LFEY38
        cmp     lr, r6
        bgt     LFEY38
        ldr     r8, [sp, #0x50]
        ldr     r11, [sp, #0x54]
        add     r8, r9, r8
        mla     r8, lr, r11, r8
        ldrb    r8, [r8, #1]
        str     r8, [sp, #0xD0]
        b       LFEY39
LFEY38:
        str     r2, [sp, #0xD0]
LFEY39:
        cmp     r9, #0
        blt     LFEY40
        cmp     r9, r0
        bgt     LFEY40
        adds    r8, lr, #1
        bmi     LFEY40
        cmp     r8, r6
        bgt     LFEY40
        ldr     r8, [sp, #0x54]
        ldr     r11, [sp, #0x78]
        mla     r8, lr, r8, r9
        ldrb    r8, [r8, +r11]
        b       LFEY41
LFEY40:
        mov     r8, r2
LFEY41:
        cmp     r10, #0
        blt     LFEY42
        cmp     r10, r0
        bgt     LFEY42
        adds    r10, lr, #1
        bmi     LFEY42
        cmp     r10, r6
        bgt     LFEY42
        ldr     r10, [sp, #0x78]
        add     r9, r9, r10
        ldr     r10, [sp, #0x54]
        mla     r9, lr, r10, r9
        ldrb    r10, [r9, #1]
        b       LFEY43
LFEY42:
        mov     r10, r2
LFEY43:
        mov     lr, r8, lsl r7
        sub     r10, r10, r8
        mla     lr, r3, r10, lr
        ldr     r9, [sp, #0xD0]
        mov     r8, r12, lsl r7
        subs    r1, r1, #1
        sub     r9, r9, r12
        mla     r3, r3, r9, r8
        ldr     r12, [sp, #0xE8]
        ldr     r8, [sp, #8]
        mul     lr, r12, lr
        sub     r12, r8, r12
        ldr     r8, [sp, #0x10C]
        mla     lr, r12, r3, lr
        ldr     r3, [sp, #0x48]
        ldr     r12, [sp, #0x98]
        add     r5, r8, r5
        ldr     r8, [sp, #0xD8]
        add     r3, lr, r3
        sub     r3, r3, #1
        mov     r3, r3, asr r12
        ldr     r12, [sp, #0xD4]
        add     r4, r4, r8, lsl #1
        strb    r3, [r12], #1
        str     r12, [sp, #0xD4]
        bne     LFEY35
        ldr     lr, [sp, #0xC8]
        ldr     r4, [sp, #0x8C]
        ldr     r5, [sp, #0xA4]
        ldr     r6, [sp, #0xA0]
        ldr     r7, [sp, #0xC]
        ldr     r8, [sp, #0xA8]
LFEY44:
        ldr     r0, [sp, #0xF0]
        add     r7, r7, #1
        ldr     r1, [sp, #0xC4]
        cmp     r7, r0
        ldr     r0, [sp, #0xB8]
        add     r8, r8, #2
        add     lr, lr, r0
        ldr     r0, [sp, #0xBC]
        add     r0, r1, r0
        str     r0, [sp, #0xC4]
        ldr     r0, [sp, #0xCC]
        ldr     r1, [sp, #0xC0]
        add     r0, r1, r0
        str     r0, [sp, #0xC0]
        blt     LFEY6
LFEY45:
        add     sp, sp, #0x15, 28
        ldmia   sp!, {r4 - r11, pc}
LFEY46:
        ldr     r4, [sp, #0x108]
        mov     r2, #0
        cmp     r5, #0
        movgt   r2, r5
        cmp     r2, r4
        str     r2, [sp, #0xDC]
        strge   r0, [sp, #0xE0]
        ldrlt   r2, [sp, #0xDC]
        strlt   r2, [sp, #0xE0]
        ldr     r4, [sp, #0x24]
        mov     r2, #0
        cmp     r6, #0
        movgt   r2, r6
        cmp     r2, r4
        ldrge   r4, [sp, #0x74]
        movlt   r4, r2
        ldr     r10, [sp, #0x54]
        ldr     r11, [sp, #0x50]
        add     r5, r5, #1
        mul     r4, r10, r4
        ldr     r10, [sp, #0xE0]
        cmp     r5, #0
        add     r10, r11, r10
        ldrb    r4, [r4, +r10]
        mov     r10, #0
        movgt   r10, r5
        ldr     r5, [sp, #0x108]
        str     r10, [sp, #0xE0]
        cmp     r10, r5
        movge   r5, r0
        ldrlt   r5, [sp, #0xE0]
        ldr     r10, [sp, #0x24]
        cmp     r2, r10
        ldrge   r2, [sp, #0x74]
        ldr     r10, [sp, #0x54]
        ldr     r11, [sp, #0xDC]
        mul     r2, r10, r2
        ldr     r10, [sp, #0x50]
        add     r5, r10, r5
        ldr     r10, [sp, #0x108]
        ldrb    r5, [r2, +r5]
        cmp     r11, r10
        str     r5, [sp, #0xD0]
        strge   r0, [sp, #0xDC]
        ldr     r2, [sp, #0x24]
        add     r6, r6, #1
        mov     r5, #0
        cmp     r6, #0
        movgt   r5, r6
        cmp     r5, r2
        ldrge   r2, [sp, #0x74]
        movlt   r2, r5
        ldr     r6, [sp, #0x54]
        ldr     r10, [sp, #0x50]
        ldr     r11, [sp, #0xE0]
        mul     r2, r6, r2
        ldr     r6, [sp, #0xDC]
        add     r6, r10, r6
        ldr     r10, [sp, #0x108]
        ldrb    r2, [r2, +r6]
        cmp     r11, r10
        strge   r0, [sp, #0xE0]
        ldr     r6, [sp, #0x24]
        cmp     r5, r6
        ldrge   r5, [sp, #0x74]
        ldr     r6, [sp, #0x54]
        ldr     r10, [sp, #0x50]
        mul     r5, r6, r5
        ldr     r6, [sp, #0xE0]
        add     r6, r10, r6
        ldrb    r6, [r5, +r6]
        b       LFEY33
LFEY47:
        mov     r10, #0
        cmp     r8, #0
        movgt   r10, r8
        ldr     r8, [sp]
        str     r10, [sp, #0xE8]
        cmp     r10, r8
        strge   r3, [sp, #0xE8]
        add     r9, r9, #1
        mov     r8, #0
        cmp     r9, #0
        movgt   r8, r9
        ldr     r9, [sp, #4]
        cmp     r8, r9
        ldrge   r8, [sp, #0x110]
        ldr     r9, [sp, #0x5C]
        ldr     r10, [sp, #0x58]
        mul     r9, r9, r8
        str     r9, [sp, #0x134]
        ldr     r9, [sp, #0x64]
        mul     r8, r9, r8
        ldr     r9, [sp, #0xE8]
        str     r8, [sp, #0x140]
        ldr     r8, [sp, #0x60]
        add     r8, r8, r9
        add     r9, r10, r9
        ldr     r10, [sp, #0x134]
        ldrb    r8, [r10, +r8]
        str     r8, [sp, #0x134]
        ldr     r8, [sp, #0x140]
        ldrb    r9, [r8, +r9]
        str     r9, [sp, #0xE8]
        b       LFEY23
LFEY48:
        ldr     r1, [sp]
        mov     r2, #0
        cmp     r10, #0
        movgt   r2, r10
        cmp     r2, r1
        movge   r2, r3
        add     r1, r9, #1
        str     r1, [sp, #0x140]
        ldr     r11, [sp, #0x140]
        cmp     r1, #0
        mov     r1, #0
        movgt   r1, r11
        ldr     r11, [sp, #4]
        str     r1, [sp, #0xE8]
        cmp     r1, r11
        ldrge   r1, [sp, #0x110]
        strge   r1, [sp, #0xE8]
        ldr     r11, [sp, #0xE8]
        ldr     r1, [sp, #0x5C]
        mul     r11, r1, r11
        ldr     r1, [sp, #0x64]
        str     r11, [sp, #0x140]
        ldr     r11, [sp, #0xE8]
        mul     r11, r1, r11
        ldr     r1, [sp, #0x60]
        add     r1, r1, r2
        str     r1, [sp, #0xE8]
        ldr     r1, [sp, #0x58]
        str     r11, [sp, #0x134]
        add     r2, r1, r2
        str     r2, [sp, #0x144]
        ldr     r1, [sp, #0x140]
        ldr     r2, [sp, #0xE8]
        ldr     r11, [sp, #0x144]
        ldrb    r1, [r1, +r2]
        ldr     r2, [sp, #0x134]
        ldrb    r2, [r2, +r11]
        b       LFEY21
LFEY49:
        ldr     r2, [sp]
        add     r8, r10, #1
        mov     r1, #0
        cmp     r8, #0
        movgt   r1, r8
        cmp     r1, r2
        movge   r1, r3
        ldr     r11, [sp, #4]
        mov     r2, #0
        cmp     r9, #0
        movgt   r2, r9
        cmp     r2, r11
        ldrge   r2, [sp, #0x110]
        ldr     r11, [sp, #0x5C]
        mul     r11, r11, r2
        str     r11, [sp, #0x144]
        ldr     r11, [sp, #0x64]
        mul     r2, r11, r2
        ldr     r11, [sp, #0x58]
        str     r2, [sp, #0x140]
        ldr     r2, [sp, #0x60]
        add     r2, r2, r1
        add     r1, r11, r1
        ldr     r11, [sp, #0x144]
        ldrb    r2, [r11, +r2]
        str     r2, [sp, #0x13C]
        ldr     r2, [sp, #0x140]
        ldrb    r1, [r2, +r1]
        str     r1, [sp, #0x130]
        b       LFEY19
LFEY50:
        ldr     r2, [sp]
        mov     r1, #0
        cmp     r10, #0
        movgt   r1, r10
        cmp     r1, r2
        movge   r1, r3
        ldr     r8, [sp, #4]
        mov     r2, #0
        cmp     r9, #0
        movgt   r2, r9
        cmp     r2, r8
        ldrge   r2, [sp, #0x110]
        ldr     r8, [sp, #0x5C]
        ldr     r11, [sp, #0x58]
        mul     r8, r8, r2
        str     r8, [sp, #0x144]
        ldr     r8, [sp, #0x64]
        mul     r8, r8, r2
        ldr     r2, [sp, #0x60]
        add     r2, r2, r1
        add     r1, r11, r1
        ldr     r11, [sp, #0x144]
        ldrb    r2, [r11, +r2]
        str     r2, [sp, #0x138]
        ldrb    r1, [r8, +r1]
        str     r1, [sp, #0x11C]
        b       LFEY17
LFEY51:
        ldr     r12, [sp, #0x108]
        mov     r2, #0
        cmp     lr, #0
        movgt   r2, lr
        cmp     r2, r12
        str     r2, [sp, #0x11C]
        strge   r0, [sp, #0xE8]
        ldrlt   r2, [sp, #0x11C]
        strlt   r2, [sp, #0xE8]
        ldr     r12, [sp, #0x24]
        mov     r2, #0
        cmp     r8, #0
        movgt   r2, r8
        cmp     r2, r12
        ldrge   r12, [sp, #0x74]
        movlt   r12, r2
        ldr     r9, [sp, #0x54]
        ldr     r10, [sp, #0xE8]
        add     lr, lr, #1
        mul     r12, r9, r12
        ldr     r9, [sp, #0x50]
        cmp     lr, #0
        add     r10, r9, r10
        mov     r9, #0
        ldrb    r12, [r12, +r10]
        movgt   r9, lr
        ldr     lr, [sp, #0x108]
        str     r9, [sp, #0xE8]
        cmp     r9, lr
        movge   lr, r0
        ldrlt   lr, [sp, #0xE8]
        ldr     r9, [sp, #0x24]
        cmp     r2, r9
        ldrge   r2, [sp, #0x74]
        ldr     r9, [sp, #0x54]
        ldr     r10, [sp, #0x108]
        mul     r2, r9, r2
        ldr     r9, [sp, #0x50]
        add     lr, r9, lr
        ldr     r9, [sp, #0x11C]
        ldrb    r2, [r2, +lr]
        cmp     r9, r10
        strge   r0, [sp, #0x11C]
        add     r8, r8, #1
        mov     lr, #0
        cmp     r8, #0
        movgt   lr, r8
        ldr     r8, [sp, #0x24]
        cmp     lr, r8
        ldrge   r8, [sp, #0x74]
        movlt   r8, lr
        ldr     r9, [sp, #0x54]
        ldr     r10, [sp, #0x11C]
        ldr     r11, [sp, #0x108]
        mul     r8, r9, r8
        ldr     r9, [sp, #0x50]
        add     r9, r9, r10
        ldr     r10, [sp, #0xE8]
        ldrb    r9, [r8, +r9]
        cmp     r10, r11
        strge   r0, [sp, #0xE8]
        ldr     r8, [sp, #0x24]
        cmp     lr, r8
        ldrge   lr, [sp, #0x74]
        ldr     r8, [sp, #0x54]
        ldr     r10, [sp, #0xE8]
        mul     lr, r8, lr
        ldr     r8, [sp, #0x50]
        add     r10, r8, r10
        ldrb    r10, [lr, +r10]
        b       LFEY15
LFEY52:
        ldr     r8, [sp, #0x108]
        mov     r12, #0
        cmp     r9, #0
        movgt   r12, r9
        cmp     r12, r8
        str     r12, [sp, #0xDC]
        strge   r0, [sp, #0xE0]
        ldrlt   r12, [sp, #0xDC]
        strlt   r12, [sp, #0xE0]
        ldr     r12, [sp, #0x24]
        mov     r8, #0
        cmp     lr, #0
        movgt   r8, lr
        cmp     r8, r12
        movge   r10, r6
        movlt   r10, r8
        ldr     r12, [sp, #0x54]
        add     r9, r9, #1
        cmp     r9, #0
        mul     r10, r12, r10
        ldr     r12, [sp, #0x50]
        str     r10, [sp, #0x144]
        ldr     r10, [sp, #0xE0]
        add     r12, r12, r10
        ldr     r10, [sp, #0x144]
        ldrb    r12, [r10, +r12]
        mov     r10, #0
        movgt   r10, r9
        ldr     r9, [sp, #0x108]
        str     r10, [sp, #0xE0]
        cmp     r10, r9
        movge   r9, r0
        ldrlt   r9, [sp, #0xE0]
        ldr     r10, [sp, #0x24]
        cmp     r8, r10
        movge   r8, r6
        ldr     r10, [sp, #0x54]
        ldr     r11, [sp, #0x108]
        mul     r8, r10, r8
        ldr     r10, [sp, #0x50]
        add     r9, r10, r9
        ldr     r10, [sp, #0xDC]
        ldrb    r9, [r8, +r9]
        cmp     r10, r11
        str     r9, [sp, #0xD0]
        strge   r0, [sp, #0xDC]
        add     r8, lr, #1
        mov     lr, #0
        cmp     r8, #0
        movgt   lr, r8
        ldr     r8, [sp, #0x24]
        cmp     lr, r8
        movge   r9, r6
        movlt   r9, lr
        ldr     r8, [sp, #0x54]
        ldr     r10, [sp, #0xDC]
        ldr     r11, [sp, #0x108]
        mul     r8, r8, r9
        ldr     r9, [sp, #0x50]
        add     r9, r9, r10
        ldr     r10, [sp, #0xE0]
        ldrb    r8, [r8, +r9]
        cmp     r10, r11
        strge   r0, [sp, #0xE0]
        ldr     r9, [sp, #0x24]
        cmp     lr, r9
        movge   lr, r6
        ldr     r9, [sp, #0x54]
        ldr     r10, [sp, #0xE0]
        mul     lr, r9, lr
        ldr     r9, [sp, #0x50]
        add     r10, r9, r10
        ldrb    r10, [lr, +r10]
        b       LFEY43
LFEY53:
        ldr     r0, [sp, #4]
        ldr     r3, [sp, #0x28]
        sub     r0, r0, r3
        b       LFEY5
LFEY54:
        ldr     r0, [sp, #8]
        ldr     r12, [sp, #0x28]
        sub     r0, r0, r12
        b       LFEY4
LFEY55:
        mov     r0, #0
        mov     r8, #1
        str     r0, [sp, #0x18]
        b       LFEY1


