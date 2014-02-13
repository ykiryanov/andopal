        .text
        .align  4
        .globl  ownsOverlapAdd_Short_32s


ownsOverlapAdd_Short_32s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x50
        ldr     r12, [sp, #0x7C]
        ldr     r9, [sp, #0x78]
        ldr     lr, [sp, #0x74]
        str     r12, [sp, #0x14]
        mov     r5, r0
        mov     r8, r9, asr #1
        mov     r12, r8
        cmp     r12, #0
        str     r1, [sp, #4]
        mov     r4, r2
        mov     r6, r3
        movle   r7, r9, lsl #2
        ble     LGGJ1
        mov     r7, r9, lsl #2
        add     r1, r8, r7
        sub     r10, r1, #1
        rsb     r1, r8, #0
        str     r5, [sp, #0x30]
        str     r5, [sp]
        ldr     r5, [sp, #0x30]
        add     r11, r4, r1, lsl #2
        sub     r1, r9, #1
        add     r10, r4, r10, lsl #2
        mov     r3, #0
        add     r1, lr, r1, lsl #2
        mov     r2, r7
        mov     r0, r4
        str     r8, [sp, #0x18]
        str     r9, [sp, #0x10]
        str     r6, [sp, #0xC]
        str     r4, [sp, #8]
LGGJ0:
        ldr     r9, [lr], #4
        ldr     r6, [r5]
        ldr     r8, [r11, +r2, lsl #2]
        rsb     r4, r3, #0
        smull   r6, r9, r6, r9
        mov     r9, r9, lsl #1
        add     r3, r3, #1
        cmp     r3, r12
        orr     r6, r9, r6, lsr #31
        add     r6, r8, r6
        add     r6, r6, #4
        mov     r6, r6, asr #3
        str     r6, [r11, +r2, lsl #2]
        ldr     r9, [r5], #4
        ldr     r8, [r1, +r4, lsl #2]
        ldr     r6, [r10, +r4, lsl #2]
        rsb     r9, r9, #0
        smull   r8, r9, r9, r8
        mov     r9, r9, lsl #1
        add     r2, r2, #1
        orr     r8, r9, r8, lsr #31
        add     r8, r6, r8
        add     r6, r8, #4
        mov     r6, r6, asr #3
        str     r6, [r10, +r4, lsl #2]
        ldr     r4, [r0]
        add     r4, r4, #4
        mov     r4, r4, asr #3
        str     r4, [r0], #4
        blt     LGGJ0
        ldr     r8, [sp, #0x18]
        ldr     r9, [sp, #0x10]
        ldr     r6, [sp, #0xC]
        ldr     r4, [sp, #8]
        ldr     r5, [sp]
LGGJ1:
        cmp     r12, r9
        bge     LGGJ3
        add     r1, r9, r9, lsl #2
        add     r1, r9, r1
        sub     r1, r1, #1
        add     lr, r9, r8
        add     r10, r4, r1, lsl #2
        rsb     r1, r8, #0
        sub     lr, lr, #1
        add     r1, r6, r1, lsl #2
        add     r11, r6, lr, lsl #2
        add     lr, r1, r12, lsl #2
        add     r1, r4, r7, lsl #2
        add     r1, r1, r12, lsl #2
        add     r2, r5, r12, lsl #2
        add     r0, r4, r12, lsl #2
        str     r6, [sp, #0xC]
        str     r4, [sp, #8]
        str     r5, [sp]
LGGJ2:
        rsb     r3, r12, #0
        ldr     r4, [r11, +r3, lsl #2]
        ldr     r6, [r2]
        ldr     r5, [r1]
        add     r12, r12, #1
        cmp     r12, r9
        smull   r4, r6, r6, r4
        mov     r6, r6, lsl #1
        orr     r4, r6, r4, lsr #31
        add     r4, r5, r4
        str     r4, [r1], #4
        ldr     r4, [lr], #4
        ldr     r6, [r2], #4
        ldr     r5, [r10, +r3, lsl #2]
        smull   r4, r6, r6, r4
        mov     r6, r6, lsl #1
        orr     r4, r6, r4, lsr #31
        add     r4, r5, r4
        str     r4, [r10, +r3, lsl #2]
        ldr     r3, [r0]
        add     r3, r3, #4
        mov     r3, r3, asr #3
        str     r3, [r0], #4
        blt     LGGJ2
        ldr     r6, [sp, #0xC]
        ldr     r4, [sp, #8]
        ldr     r5, [sp]
LGGJ3:
        mvn     r1, #0
        add     r11, r9, r8
        add     r1, r11, r1
        add     r12, r1, #0
        rsb     r1, r8, #0
        add     lr, r12, r9
        add     r12, r9, r9, lsl #2
        add     r2, r9, r12
        add     r12, r6, r1, lsl #2
        str     r1, [sp, #0x24]
        add     r1, r4, r1, lsl #2
        str     r12, [sp, #0x28]
        str     r1, [sp, #0x48]
        add     r12, r4, r7, lsl #2
        add     r1, r8, r7
        mov     r3, #2
        mov     r0, r9
        mov     r10, r11
        str     r3, [sp, #0x30]
        str     r2, [sp, #0x40]
        str     r1, [sp, #0x3C]
        str     r12, [sp, #0x2C]
        str     r11, [sp, #0x20]
        str     r7, [sp, #0x1C]
        str     r8, [sp, #0x18]
LGGJ4:
        cmp     r0, r10
        mov     r2, r0
        addge   r3, r9, r0
        bge     LGGJ6
        ldr     r12, [sp, #0x3C]
        add     r3, r9, r0
        sub     r7, r3, #1
        add     r12, r12, r0, lsl #1
        sub     r12, r12, #1
        add     r11, r5, r2, lsl #2
        add     r8, r6, r7, lsl #2
        add     r7, r4, r12, lsl #2
        str     r11, [sp, #0x4C]
        ldr     r12, [sp, #0x1C]
        rsb     r1, r0, #0
        add     r11, r4, r2, lsl #2
        str     lr, [sp, #0x34]
        str     r4, [sp, #8]
        ldr     r4, [sp, #0x4C]
        ldr     lr, [sp, #0x48]
        add     r1, r6, r1, lsl #2
        add     r12, r2, r12
        add     r1, r1, r2, lsl #2
        str     r0, [sp, #0x38]
        str     r9, [sp, #0x10]
        str     r6, [sp, #0xC]
        str     r5, [sp]
LGGJ5:
        ldr     r9, [r1], #4
        ldr     r5, [r4]
        ldr     r6, [lr, +r12, lsl #2]
        rsb     r0, r2, #0
        smull   r5, r9, r5, r9
        mov     r9, r9, lsl #1
        add     r2, r2, #1
        cmp     r2, r10
        orr     r5, r9, r5, lsr #31
        add     r5, r6, r5
        add     r5, r5, #4
        mov     r5, r5, asr #3
        str     r5, [lr, +r12, lsl #2]
        ldr     r9, [r4], #4
        ldr     r6, [r8, +r0, lsl #2]
        ldr     r5, [r7, +r0, lsl #2]
        rsb     r9, r9, #0
        smull   r6, r9, r9, r6
        mov     r9, r9, lsl #1
        add     r12, r12, #1
        orr     r6, r9, r6, lsr #31
        add     r6, r5, r6
        add     r5, r6, #4
        mov     r5, r5, asr #3
        str     r5, [r7, +r0, lsl #2]
        ldr     r0, [r11]
        add     r0, r0, #4
        mov     r0, r0, asr #3
        str     r0, [r11], #4
        blt     LGGJ5
        ldr     lr, [sp, #0x34]
        ldr     r0, [sp, #0x38]
        ldr     r9, [sp, #0x10]
        ldr     r6, [sp, #0xC]
        ldr     r4, [sp, #8]
        ldr     r5, [sp]
LGGJ6:
        ldr     r1, [sp, #0x18]
        add     r7, r0, r1
        cmp     r7, r3
        bge     LGGJ8
        ldr     r1, [sp, #0x40]
        add     r2, r6, lr, lsl #2
        add     r11, r5, r7, lsl #2
        add     r1, r1, r0, lsl #1
        sub     r1, r1, #1
        add     r8, r4, r7, lsl #2
        add     r12, r4, r1, lsl #2
        ldr     r1, [sp, #0x2C]
        str     r4, [sp, #8]
        ldr     r4, [sp, #0x28]
        add     r1, r1, r7, lsl #2
        str     r10, [sp, #0x44]
        str     lr, [sp, #0x34]
        str     r9, [sp, #0x10]
        str     r6, [sp, #0xC]
        str     r5, [sp]
LGGJ7:
        rsb     lr, r7, #0
        ldr     r5, [r2, +lr, lsl #2]
        ldr     r10, [r11]
        ldr     r6, [r1]
        sub     r9, r7, r0
        add     r7, r7, #1
        smull   r5, r10, r10, r5
        mov     r10, r10, lsl #1
        cmp     r7, r3
        orr     r5, r10, r5, lsr #31
        add     r5, r6, r5
        str     r5, [r1], #4
        ldr     r6, [r11], #4
        ldr     r9, [r4, +r9, lsl #2]
        ldr     r5, [r12, +lr, lsl #2]
        smull   r6, r9, r6, r9
        mov     r9, r9, lsl #1
        orr     r6, r9, r6, lsr #31
        add     r6, r5, r6
        str     r6, [r12, +lr, lsl #2]
        ldr     lr, [r8]
        add     lr, lr, #4
        mov     lr, lr, asr #3
        str     lr, [r8], #4
        blt     LGGJ7
        ldr     r10, [sp, #0x44]
        ldr     lr, [sp, #0x34]
        ldr     r9, [sp, #0x10]
        ldr     r6, [sp, #0xC]
        ldr     r4, [sp, #8]
        ldr     r5, [sp]
LGGJ8:
        ldr     r1, [sp, #0x30]
        add     r0, r0, r9
        add     lr, lr, r9
        subs    r1, r1, #1
        str     r1, [sp, #0x30]
        add     r10, r10, r9
        bne     LGGJ4
        ldr     r8, [sp, #0x18]
        ldr     r1, [sp, #0x3C]
        ldr     r12, [sp, #0x2C]
        ldr     r11, [sp, #0x20]
        ldr     r7, [sp, #0x1C]
        add     r10, r9, r9, lsl #1
        add     lr, r10, r8
        cmp     r10, lr
        str     lr, [sp, #0x40]
        mov     r0, r10
        addge   lr, r9, r10
        bge     LGGJ10
        add     r2, r1, r10, lsl #1
        rsb     r3, r10, #0
        add     lr, r9, r10
        add     r1, r6, r3, lsl #2
        sub     r3, lr, #1
        str     r3, [sp, #0x4C]
        ldr     r3, [sp, #0x4C]
        sub     r2, r2, #1
        add     r1, r1, r0, lsl #2
        add     r3, r6, r3, lsl #2
        add     r2, r4, r2, lsl #2
        str     r2, [sp, #0x34]
        add     r2, r0, r7
        str     r3, [sp, #0x3C]
        str     r2, [sp, #0x38]
        add     r3, r5, r0, lsl #2
        add     r2, r4, r0, lsl #2
        str     r7, [sp, #0x1C]
        str     r8, [sp, #0x18]
        str     r6, [sp, #0xC]
        str     r4, [sp, #8]
        str     r5, [sp]
        ldr     r4, [sp, #0x38]
        ldr     r5, [sp, #0x34]
        ldr     r6, [sp, #0x3C]
        ldr     r7, [sp, #0x40]
        ldr     r8, [sp, #0x48]
        str     r10, [sp, #0x30]
        str     r12, [sp, #0x2C]
        str     r11, [sp, #0x20]
        str     r9, [sp, #0x10]
LGGJ9:
        ldr     r11, [r1], #4
        ldr     r9, [r3]
        ldr     r10, [r8, +r4, lsl #2]
        rsb     r12, r0, #0
        smull   r9, r11, r9, r11
        mov     r11, r11, lsl #1
        add     r0, r0, #1
        cmp     r0, r7
        orr     r9, r11, r9, lsr #31
        add     r9, r10, r9
        add     r9, r9, #4
        mov     r9, r9, asr #3
        str     r9, [r8, +r4, lsl #2]
        ldr     r11, [r3], #4
        ldr     r10, [r6, +r12, lsl #2]
        ldr     r9, [r5, +r12, lsl #2]
        rsb     r11, r11, #0
        smull   r10, r11, r11, r10
        mov     r11, r11, lsl #1
        add     r4, r4, #1
        orr     r10, r11, r10, lsr #31
        add     r10, r9, r10
        add     r9, r10, #4
        mov     r9, r9, asr #3
        str     r9, [r5, +r12, lsl #2]
        ldr     r12, [r2]
        add     r12, r12, #4
        mov     r12, r12, asr #3
        str     r12, [r2], #4
        blt     LGGJ9
        ldr     r10, [sp, #0x30]
        ldr     r12, [sp, #0x2C]
        ldr     r11, [sp, #0x20]
        ldr     r7, [sp, #0x1C]
        ldr     r8, [sp, #0x18]
        ldr     r9, [sp, #0x10]
        ldr     r6, [sp, #0xC]
        ldr     r4, [sp, #8]
        ldr     r5, [sp]
LGGJ10:
        add     r2, r10, r8
        cmp     r2, lr
        bge     LGGJ12
        sub     r0, lr, #1
        add     r1, r10, r11
        add     r0, r5, r0, lsl #2
        str     r0, [sp, #0x34]
        str     r7, [sp, #0x1C]
        str     r8, [sp, #0x18]
        ldr     r7, [sp, #0x34]
        ldr     r8, [sp, #0x28]
        sub     r1, r1, #1
        add     r0, r5, r2, lsl #2
        add     r1, r6, r1, lsl #2
        add     r12, r12, r2, lsl #2
        str     r9, [sp, #0x10]
        str     r6, [sp, #0xC]
        str     r4, [sp, #8]
        str     r5, [sp]
LGGJ11:
        rsb     r5, r2, #0
        ldr     r9, [r0]
        ldr     r3, [r1, +r5, lsl #2]
        ldr     r4, [r12]
        sub     r6, r2, r10
        add     r2, r2, #1
        smull   r3, r9, r9, r3
        mov     r9, r9, lsl #1
        cmp     r2, lr
        orr     r3, r9, r3, lsr #31
        add     r3, r4, r3
        str     r3, [r12], #4
        ldr     r3, [r0], #4
        ldr     r6, [r8, +r6, lsl #2]
        smull   r3, r4, r3, r6
        mov     r4, r4, lsl #1
        orr     r3, r4, r3, lsr #31
        str     r3, [r7, +r5, lsl #2]
        blt     LGGJ11
        ldr     r7, [sp, #0x1C]
        ldr     r8, [sp, #0x18]
        ldr     r9, [sp, #0x10]
        ldr     r6, [sp, #0xC]
        ldr     r4, [sp, #8]
        ldr     r5, [sp]
LGGJ12:
        add     r2, r7, r8
        cmp     r7, r2
        mov     r3, r7
        bge     LGGJ14
        add     lr, r9, r7
        sub     lr, lr, #1
        rsb     r1, r7, #0
        add     lr, r6, lr, lsl #2
        sub     r12, r2, #1
        str     lr, [sp, #0x34]
        add     r1, r6, r1, lsl #2
        add     r12, r5, r12, lsl #2
        add     lr, r5, r3, lsl #2
        str     r6, [sp, #0xC]
        str     r5, [sp]
        ldr     r5, [sp, #0x34]
        ldr     r6, [sp, #0x48]
        add     r0, r3, r7
        add     r1, r1, r3, lsl #2
        str     r7, [sp, #0x1C]
        str     r8, [sp, #0x18]
        str     r9, [sp, #0x10]
        str     r4, [sp, #8]
LGGJ13:
        ldr     r9, [r1], #4
        ldr     r7, [lr]
        ldr     r8, [r6, +r0, lsl #2]
        rsb     r4, r3, #0
        smull   r7, r9, r7, r9
        mov     r9, r9, lsl #1
        add     r3, r3, #1
        cmp     r3, r2
        orr     r7, r9, r7, lsr #31
        add     r7, r8, r7
        add     r7, r7, #4
        mov     r7, r7, asr #3
        str     r7, [r6, +r0, lsl #2]
        ldr     r9, [lr], #4
        ldr     r8, [r5, +r4, lsl #2]
        ldr     r7, [r12, +r4, lsl #2]
        rsb     r9, r9, #0
        smull   r8, r9, r9, r8
        mov     r9, r9, lsl #1
        add     r0, r0, #1
        orr     r8, r9, r8, lsr #31
        add     r8, r7, r8
        str     r8, [r12, +r4, lsl #2]
        blt     LGGJ13
        ldr     r7, [sp, #0x1C]
        ldr     r8, [sp, #0x18]
        ldr     r9, [sp, #0x10]
        ldr     r6, [sp, #0xC]
        ldr     r4, [sp, #8]
        ldr     r5, [sp]
LGGJ14:
        ldr     r3, [sp, #0x14]
        ldr     r1, [sp, #4]
        mov     r2, r9, lsl #3
        mov     r0, r4
        bl      ownsPcmAudioOutput_32s16s
        add     r2, r7, r8
        add     r1, r9, r7
        cmp     r2, r1
        bge     LGGJ16
        ldr     r1, [sp, #0x24]
        add     r12, r7, r9, lsl #1
        sub     r12, r12, #1
        add     r1, r5, r1, lsl #2
        str     r1, [sp, #0x2C]
        add     r1, r7, r11
        sub     r1, r1, #1
        add     r3, r5, r2, lsl #2
        add     lr, r6, r1, lsl #2
        str     r3, [sp, #0x34]
        rsb     r1, r7, #0
        add     r0, r9, r7
        str     r10, [sp, #0x30]
        str     r8, [sp, #0x18]
        str     r9, [sp, #0x10]
        str     r6, [sp, #0xC]
        ldr     r6, [sp, #0x34]
        ldr     r8, [sp, #0x2C]
        ldr     r9, [sp, #0x48]
        ldr     r10, [sp, #0x28]
        add     r1, r4, r1, lsl #2
        add     r12, r4, r12, lsl #2
        add     r1, r1, r2, lsl #2
        str     r11, [sp, #0x20]
        str     r4, [sp, #8]
        str     r5, [sp]
LGGJ15:
        sub     r4, r2, r7
        ldr     r3, [r8, +r4, lsl #2]
        rsb     r5, r2, #0
        add     r2, r2, #1
        str     r3, [r9, +r4, lsl #2]
        ldr     r11, [r6]
        ldr     r3, [lr, +r5, lsl #2]
        cmp     r2, r0
        smull   r3, r11, r11, r3
        mov     r11, r11, lsl #1
        orr     r3, r11, r3, lsr #31
        str     r3, [r1], #4
        ldr     r3, [r6], #4
        ldr     r4, [r10, +r4, lsl #2]
        smull   r3, r4, r3, r4
        mov     r4, r4, lsl #1
        orr     r3, r4, r3, lsr #31
        str     r3, [r12, +r5, lsl #2]
        blt     LGGJ15
        ldr     r10, [sp, #0x30]
        ldr     r11, [sp, #0x20]
        ldr     r8, [sp, #0x18]
        ldr     r9, [sp, #0x10]
        ldr     r6, [sp, #0xC]
        ldr     r4, [sp, #8]
        ldr     r5, [sp]
LGGJ16:
        mvn     r1, #0
        add     r1, r11, r1
        rsb     r12, r7, #0
        add     r1, r1, #0
        add     r11, r4, r12, lsl #2
        add     lr, r9, r9, lsl #2
        sub     r0, r8, r7
        add     r1, r1, lr
        mov     r12, #3
        str     r11, [sp, #0x3C]
        str     r0, [sp, #0x40]
        str     r10, [sp, #0x30]
        str     r7, [sp, #0x1C]
LGGJ17:
        add     r11, lr, r8
        cmp     lr, r11
        mov     r7, lr
        addge   r10, r9, lr
        bge     LGGJ19
        ldr     r0, [sp, #0x40]
        add     r10, r9, lr
        rsb     r3, lr, #0
        add     r0, r0, lr, lsl #1
        sub     r0, r0, #1
        sub     r2, r10, #1
        add     r0, r4, r0, lsl #2
        str     r0, [sp, #0x20]
        add     r3, r6, r3, lsl #2
        add     r2, r6, r2, lsl #2
        str     r2, [sp, #0x24]
        add     r0, r3, r7, lsl #2
        str     r12, [sp, #0x2C]
        str     r1, [sp, #0x34]
        str     lr, [sp, #0x38]
        ldr     r1, [sp, #0x20]
        ldr     r3, [sp, #0x24]
        ldr     r12, [sp, #0x48]
        ldr     lr, [sp, #0x1C]
        add     r2, r5, r7, lsl #2
        str     r8, [sp, #0x18]
        str     r9, [sp, #0x10]
        str     r6, [sp, #0xC]
        str     r4, [sp, #8]
        str     r5, [sp]
LGGJ18:
        ldr     r5, [r0], #4
        ldr     r4, [r2]
        sub     r8, r7, lr
        ldr     r6, [r12, +r8, lsl #2]
        smull   r5, r4, r4, r5
        mov     r9, r4, lsl #1
        rsb     r4, r7, #0
        add     r7, r7, #1
        cmp     r7, r11
        orr     r5, r9, r5, lsr #31
        add     r5, r6, r5
        str     r5, [r12, +r8, lsl #2]
        ldr     r8, [r2], #4
        ldr     r6, [r3, +r4, lsl #2]
        ldr     r5, [r1, +r4, lsl #2]
        rsb     r8, r8, #0
        smull   r6, r8, r8, r6
        mov     r8, r8, lsl #1
        orr     r6, r8, r6, lsr #31
        add     r6, r5, r6
        str     r6, [r1, +r4, lsl #2]
        blt     LGGJ18
        ldr     r12, [sp, #0x2C]
        ldr     r1, [sp, #0x34]
        ldr     lr, [sp, #0x38]
        ldr     r8, [sp, #0x18]
        ldr     r9, [sp, #0x10]
        ldr     r6, [sp, #0xC]
        ldr     r4, [sp, #8]
        ldr     r5, [sp]
LGGJ19:
        cmp     r11, r10
        bge     LGGJ21
        mov     r7, lr, lsl #1
        add     r0, r5, r11, lsl #2
        sub     r7, r7, r9, lsl #1
        sub     r7, r7, #1
        str     r0, [sp, #0x24]
        add     r0, r4, r7, lsl #2
        ldr     r7, [sp, #0x3C]
        add     r2, r6, r1, lsl #2
        str     r8, [sp, #0x18]
        str     r6, [sp, #0xC]
        ldr     r6, [sp, #0x24]
        ldr     r8, [sp, #0x28]
        add     r7, r7, r11, lsl #2
        str     r9, [sp, #0x10]
        str     r4, [sp, #8]
        str     r5, [sp]
LGGJ20:
        rsb     r5, r11, #0
        ldr     r9, [r6]
        ldr     r3, [r2, +r5, lsl #2]
        sub     r4, r11, lr
        add     r11, r11, #1
        cmp     r11, r10
        smull   r3, r9, r9, r3
        mov     r9, r9, lsl #1
        orr     r3, r9, r3, lsr #31
        str     r3, [r7], #4
        ldr     r3, [r6], #4
        ldr     r4, [r8, +r4, lsl #2]
        smull   r3, r4, r3, r4
        mov     r4, r4, lsl #1
        orr     r3, r4, r3, lsr #31
        str     r3, [r0, +r5, lsl #2]
        blt     LGGJ20
        ldr     r8, [sp, #0x18]
        ldr     r9, [sp, #0x10]
        ldr     r6, [sp, #0xC]
        ldr     r4, [sp, #8]
        ldr     r5, [sp]
LGGJ21:
        subs    r12, r12, #1
        add     lr, lr, r9
        add     r1, r1, r9
        bne     LGGJ17
        ldr     r10, [sp, #0x30]
        mov     r3, #0
        cmp     r9, #0
        mov     r1, #1
        movlt   r3, r1
        add     r1, r9, r3
        mvn     r0, #6, 2
        and     r0, r1, r0
        add     r10, r10, r1, asr #1
        add     r9, r4, r9, lsl #4
        mov     r1, r10, lsl #2
        add     r0, r9, r0, lsl #1
        bl      _ippsZero_8u
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}


