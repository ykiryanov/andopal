        .text
        .align  4
        .globl  ownVadFilterBank_GSMAMR_16s


ownVadFilterBank_GSMAMR_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x65, 30
        add     lr, sp, #0x44
        and     lr, lr, #0xF
        mov     r5, r0
        ldrsh   r12, [r5, #0x48]
        ldrsh   r3, [r5, #0x4A]
        rsb     r8, lr, #0
        add     r4, sp, #0x44
        mov     lr, #0xC3
        orr     lr, lr, #0x55, 24
        mul     lr, r12, lr
        and     r8, r8, #0xF
        mov     r7, #0xF6
        add     r4, r4, r8
        orr     r7, r7, #6, 22
        mul     r7, r3, r7
        mov     r6, r2
        mov     r2, lr, asr #15
        add     r11, r4, #6
        add     r9, r4, #2
        add     lr, r4, #4
        str     r4, [sp, #0x2C]
        str     r5, [sp, #0x28]
        ldr     r5, [sp, #0x2C]
        str     r11, [sp, #0x30]
        mov     r0, r7, asr #15
        mov     r11, #0x28
        add     r10, r1, #2
        add     r8, r1, #4
        add     r7, r1, #6
        str     r11, [sp, #0x1C]
        str     r12, [sp, #0x18]
        str     r4, [sp, #0x20]
        str     r6, [sp, #0x24]
LDOC0:
        ldrsh   r12, [r10], #8
        ldrsh   r4, [r1], #8
        ldrsh   r6, [r8], #8
        mov     r12, r12, lsl #16
        ldrsh   r11, [r7], #8
        mov     r4, r4, lsl #16
        rsb     r12, r0, r12, asr #18
        mov     r0, #0xF6
        rsb     r4, r2, r4, asr #18
        mov     r12, r12, lsl #16
        orr     r0, r0, #6, 22
        mov     r4, r4, lsl #16
        mov     r12, r12, asr #16
        mul     r2, r12, r0
        str     r12, [sp, #0x34]
        mov     r12, #0xC3
        mov     r4, r4, asr #16
        str     r4, [sp, #0x38]
        add     r3, r3, r2, asr #15
        orr     r12, r12, #0x55, 24
        mul     r4, r4, r12
        str     r3, [sp, #0x3C]
        ldr     r3, [sp, #0x18]
        mov     r11, r11, lsl #16
        mov     r6, r6, lsl #16
        mov     r11, r11, asr #18
        str     r11, [sp, #0x40]
        add     r11, r3, r4, asr #15
        ldr     r3, [sp, #0x3C]
        mov     r6, r6, asr #18
        str     r6, [sp, #0x3C]
        mov     r3, r3, lsl #16
        mov     r11, r11, lsl #16
        mov     r6, r3, asr #16
        ldr     r3, [sp, #0x40]
        sub     r3, r3, r2, asr #15
        ldr     r2, [sp, #0x3C]
        str     r3, [sp, #0x40]
        add     r3, r6, r11, asr #16
        rsb     r11, r6, r11, asr #16
        sub     r4, r2, r4, asr #15
        ldr     r2, [sp, #0x40]
        strh    r3, [r5], #8
        mov     r4, r4, lsl #16
        mov     r2, r2, lsl #16
        mov     r4, r4, asr #16
        mul     r12, r4, r12
        mov     r3, r2, asr #16
        mul     r0, r3, r0
        ldr     r2, [sp, #0x34]
        str     r4, [sp, #0x18]
        mov     r0, r0, asr #15
        add     r4, r0, r2
        mov     r2, r12, asr #15
        ldr     r12, [sp, #0x38]
        mov     r4, r4, lsl #16
        strh    r11, [r9], #8
        mov     r4, r4, asr #16
        add     r12, r2, r12
        mov     r12, r12, lsl #16
        add     r6, r4, r12, asr #16
        strh    r6, [lr], #8
        rsb     r4, r4, r12, asr #16
        ldr     r12, [sp, #0x30]
        strh    r4, [r12], #8
        ldr     r4, [sp, #0x1C]
        str     r12, [sp, #0x30]
        subs    r4, r4, #1
        str     r4, [sp, #0x1C]
        ldr     r12, [sp, #0x1C]
        bne     LDOC0
        ldr     r5, [sp, #0x28]
        ldr     r12, [sp, #0x18]
        ldr     r4, [sp, #0x20]
        ldr     r6, [sp, #0x24]
        ldrsh   r7, [r5, #0x4C]
        ldrsh   lr, [r5, #0x4E]
        ldrsh   r9, [r5, #0x50]
        ldrsh   r8, [r5, #0x52]
        strh    r12, [r5, #0x48]
        strh    r3, [r5, #0x4A]
        mov     r10, #0xF6
        mov     r11, #0xC3
        orr     r12, r10, #6, 22
        orr     r3, r11, #0x55, 24
        mov     r11, r4
        mov     r10, #0x28
        str     r4, [sp, #0x20]
        str     r6, [sp, #0x24]
        str     r5, [sp, #0x28]
LDOC1:
        ldrsh   r1, [r11]
        str     lr, [sp, #0x40]
        ldrsh   r6, [r11, #6]
        mul     lr, lr, r12
        ldrsh   r5, [r11, #4]
        ldrsh   r4, [r11, #2]
        mov     r0, r9
        mul     r9, r0, r3
        mov     r2, r8
        mul     r8, r2, r12
        str     r7, [sp, #0x3C]
        mul     r7, r7, r3
        sub     r9, r4, r9, asr #15
        subs    r10, r10, #1
        sub     r6, r6, r8, asr #15
        sub     r1, r1, r7, asr #15
        sub     r5, r5, lr, asr #15
        mov     r4, r6, lsl #16
        mov     r6, r1, lsl #16
        mov     r5, r5, lsl #16
        mov     r8, r4, asr #16
        mul     r4, r8, r12
        mov     r7, r6, asr #16
        mul     r6, r7, r3
        mov     lr, r5, asr #16
        mul     r1, lr, r12
        mov     r5, r9, lsl #16
        str     r6, [sp, #0x38]
        ldr     r6, [sp, #0x40]
        mov     r9, r5, asr #16
        mul     r5, r9, r3
        add     r4, r2, r4, asr #15
        add     r1, r6, r1, asr #15
        ldr     r2, [sp, #0x38]
        ldr     r6, [sp, #0x3C]
        mov     r1, r1, lsl #16
        add     r0, r0, r5, asr #15
        add     r2, r6, r2, asr #15
        mov     r1, r1, asr #16
        mov     r4, r4, lsl #16
        mov     r2, r2, lsl #16
        mov     r0, r0, lsl #16
        mov     r4, r4, asr #16
        add     r5, r1, r2, asr #16
        rsb     r2, r1, r2, asr #16
        add     r1, r4, r0, asr #16
        rsb     r0, r4, r0, asr #16
        mov     r5, r5, asr #1
        mov     r2, r2, asr #1
        mov     r1, r1, asr #1
        mov     r0, r0, asr #1
        strh    r5, [r11]
        strh    r2, [r11, #4]
        strh    r1, [r11, #2]
        strh    r0, [r11, #6]
        add     r11, r11, #8
        bne     LDOC1
        ldr     r5, [sp, #0x28]
        ldr     r4, [sp, #0x20]
        ldr     r6, [sp, #0x24]
        ldrsh   r10, [r5, #0x54]
        ldrsh   r12, [r5, #0x56]
        ldrsh   r3, [r5, #0x5C]
        strh    r8, [r5, #0x52]
        strh    lr, [r5, #0x4E]
        strh    r7, [r5, #0x4C]
        mov     r8, #0x33
        strh    r9, [r5, #0x50]
        orr     lr, r8, #0xD, 22
        mov     r8, r4
        mov     r7, #0x14
        str     r4, [sp, #0x20]
        str     r6, [sp, #0x24]
        str     r5, [sp, #0x28]
LDOC2:
        ldrsh   r0, [r8]
        ldrsh   r1, [r8, #8]
        subs    r7, r7, #1
        str     r0, [sp, #0x40]
        ldrsh   r0, [r8]
        mov     r4, r10
        mul     r2, r4, lr
        str     r0, [sp, #0x3C]
        ldrsh   r9, [r8, #0xC]
        ldrsh   r0, [r8, #4]
        mov     r6, r12
        mul     r12, r6, lr
        mov     r5, r3
        mul     r3, r5, lr
        str     r0, [sp, #0x38]
        ldrsh   r10, [r8, #0xE]
        ldrsh   r0, [r8, #4]
        sub     r9, r9, r12, asr #15
        sub     r2, r1, r2, asr #15
        ldrsh   r1, [r8, #6]
        sub     r10, r10, r3, asr #15
        mov     r12, r2, lsl #16
        mov     r3, r9, lsl #16
        mov     r2, r10, lsl #16
        mov     r10, r12, asr #16
        mul     r9, r10, lr
        mov     r12, r3, asr #16
        mul     r3, r12, lr
        add     r9, r4, r9, asr #15
        str     r3, [sp, #0x34]
        ldr     r4, [sp, #0x34]
        mov     r3, r2, asr #16
        mul     r11, r3, lr
        ldrsh   r2, [r8, #6]
        add     r6, r6, r4, asr #15
        add     r4, r5, r11, asr #15
        mov     r5, r9, lsl #16
        mov     r11, r6, lsl #16
        ldr     r6, [sp, #0x40]
        ldr     r9, [sp, #0x3C]
        mov     r4, r4, lsl #16
        add     r0, r0, r11, asr #16
        sub     r6, r6, r5, asr #16
        add     r9, r9, r5, asr #16
        ldr     r5, [sp, #0x38]
        sub     r1, r1, r4, asr #16
        add     r4, r2, r4, asr #16
        mov     r6, r6, asr #1
        sub     r5, r5, r11, asr #16
        mov     r9, r9, asr #1
        mov     r0, r0, asr #1
        mov     r5, r5, asr #1
        mov     r1, r1, asr #1
        mov     r4, r4, asr #1
        strh    r6, [r8, #8]
        strh    r9, [r8]
        strh    r5, [r8, #0xC]
        strh    r0, [r8, #4]
        strh    r1, [r8, #0xE]
        strh    r4, [r8, #6]
        add     r8, r8, #0x10
        bne     LDOC2
        ldr     r5, [sp, #0x28]
        ldr     r6, [sp, #0x24]
        ldr     r4, [sp, #0x20]
        ldrsh   r8, [r5, #0x58]
        ldrsh   r7, [r5, #0x5A]
        strh    r3, [r5, #0x5C]
        strh    r12, [r5, #0x56]
        strh    r10, [r5, #0x54]
        mov     r12, r4
        mov     r3, #0xA
        str     r6, [sp, #0x24]
        str     r5, [sp, #0x28]
LDOC3:
        mov     r9, r8
        mul     r6, r9, lr
        ldrsh   r1, [r12, #0x10]
        ldrsh   r5, [r12]
        ldrsh   r2, [r12]
        sub     r1, r1, r6, asr #15
        mov     r6, r7
        ldrsh   r7, [r12, #0x18]
        mov     r8, r1, lsl #16
        mul     r1, r6, lr
        ldrsh   r10, [r12, #8]
        ldrsh   r11, [r12, #8]
        subs    r3, r3, #1
        mov     r8, r8, asr #16
        mul     r0, r8, lr
        sub     r7, r7, r1, asr #15
        mov     r1, r7, lsl #16
        mov     r7, r1, asr #16
        mul     r1, r7, lr
        add     r0, r9, r0, asr #15
        mov     r9, r0, lsl #16
        sub     r5, r5, r9, asr #16
        add     r2, r2, r9, asr #16
        add     r1, r6, r1, asr #15
        mov     r5, r5, asr #1
        strh    r5, [r12, #0x10]
        mov     r1, r1, lsl #16
        sub     r10, r10, r1, asr #16
        add     r1, r11, r1, asr #16
        mov     r2, r2, asr #1
        mov     r10, r10, asr #1
        mov     r1, r1, asr #1
        strh    r2, [r12]
        strh    r10, [r12, #0x18]
        strh    r1, [r12, #8]
        add     r12, r12, #0x20
        bne     LDOC3
        ldr     r6, [sp, #0x24]
        ldr     r5, [sp, #0x28]
        mov     r3, #0xF
        mov     r9, #0
        mov     r2, #0x20
        strh    r8, [r5, #0x58]
        strh    r7, [r5, #0x5A]
        str     r3, [sp, #8]
        mov     r7, #4
        str     r7, [sp]
        str     r9, [sp, #0x10]
        str     r9, [sp, #0xC]
        mov     r3, #1
        str     r3, [sp, #4]
        add     r1, r5, #0x10
        mov     r3, #0x28
        mov     r0, r4
        bl      ownSignalLevel_GSMAMR_16s
        strh    r0, [r6, #0x10]
        str     r9, [sp, #0x10]
        str     r9, [sp, #0xC]
        mov     r3, #7
        str     r3, [sp, #4]
        mov     r10, #0x10
        str     r10, [sp, #8]
        mov     r8, #8
        str     r8, [sp]
        add     r1, r5, #0xE
        mov     r3, #0x14
        mov     r2, #0x10
        mov     r0, r4
        bl      ownSignalLevel_GSMAMR_16s
        strh    r0, [r6, #0xE]
        str     r9, [sp, #0x10]
        str     r9, [sp, #0xC]
        str     r10, [sp, #8]
        str     r8, [sp]
        add     r1, r5, #0xC
        mov     r3, #3
        str     r3, [sp, #4]
        mov     r3, #0x14
        mov     r2, #0x10
        mov     r0, r4
        bl      ownSignalLevel_GSMAMR_16s
        strh    r0, [r6, #0xC]
        mov     r3, #2
        str     r3, [sp, #4]
        str     r9, [sp, #0x10]
        str     r9, [sp, #0xC]
        str     r10, [sp, #8]
        str     r8, [sp]
        add     r1, r5, #0xA
        mov     r3, #0x14
        mov     r2, #0x10
        mov     r0, r4
        bl      ownSignalLevel_GSMAMR_16s
        strh    r0, [r6, #0xA]
        str     r9, [sp, #0x10]
        str     r9, [sp, #0xC]
        str     r10, [sp, #8]
        str     r8, [sp]
        mov     r3, #6
        str     r3, [sp, #4]
        add     r1, r5, #8
        mov     r3, #0x14
        mov     r2, #0x10
        mov     r0, r4
        bl      ownSignalLevel_GSMAMR_16s
        strh    r0, [r6, #8]
        add     r1, r5, #6
        str     r7, [sp, #4]
        str     r9, [sp, #0x10]
        str     r9, [sp, #0xC]
        str     r10, [sp, #8]
        str     r10, [sp]
        mov     r0, r4
        mov     r3, #0xA
        mov     r2, #8
        bl      ownSignalLevel_GSMAMR_16s
        strh    r0, [r6, #6]
        mov     r3, #0xC
        str     r3, [sp, #4]
        add     r1, r5, #4
        str     r9, [sp, #0x10]
        str     r9, [sp, #0xC]
        str     r10, [sp, #8]
        str     r10, [sp]
        mov     r0, r4
        mov     r3, #0xA
        mov     r2, #8
        bl      ownSignalLevel_GSMAMR_16s
        strh    r0, [r6, #4]
        add     r1, r5, #2
        str     r8, [sp, #4]
        str     r9, [sp, #0x10]
        str     r9, [sp, #0xC]
        str     r10, [sp, #8]
        str     r10, [sp]
        mov     r0, r4
        mov     r3, #0xA
        mov     r2, #8
        bl      ownSignalLevel_GSMAMR_16s
        strh    r0, [r6, #2]
        str     r9, [sp, #0x10]
        str     r9, [sp, #0xC]
        str     r9, [sp, #4]
        str     r10, [sp, #8]
        str     r10, [sp]
        mov     r0, r4
        mov     r1, r5
        mov     r3, #0xA
        mov     r2, #8
        bl      ownSignalLevel_GSMAMR_16s
        strh    r0, [r6]
        add     sp, sp, #0x65, 30
        ldmia   sp!, {r4 - r11, pc}


