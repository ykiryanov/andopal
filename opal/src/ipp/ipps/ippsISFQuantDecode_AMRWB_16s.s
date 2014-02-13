        .text
        .align  4
        .globl  _ippsISFQuantDecode_AMRWB_16s


_ippsISFQuantDecode_AMRWB_16s:
        stmdb   sp!, {r4, lr}
        sub     sp, sp, #0x10
        ldr     r4, [sp, #0x18]
        ldr     lr, [sp, #0x1C]
        ldr     r12, [sp, #0x20]
        cmp     r0, #0
        beq     LDIQ1
        cmp     r1, #0
        beq     LDIQ1
        cmp     r2, #0
        beq     LDIQ1
        cmp     r3, #0
        beq     LDIQ1
        cmp     r4, #0
        beq     LDIQ1
        cmp     r12, #5
        beq     LDIQ0
        cmp     r12, #9
        beq     LDIQ0
        cmp     r12, #0xD
        beq     LDIQ0
        cmp     r12, #0xF
        beq     LDIQ0
        cmp     r12, #0x10
        beq     LDIQ0
        cmp     r12, #0x12
        beq     LDIQ0
        cmp     r12, #0x13
        beq     LDIQ0
        cmp     r12, #0x14
        beq     LDIQ0
        cmp     r12, #0x15
        beq     LDIQ0
        cmp     r12, #0x19
        beq     LDIQ0
        mvn     r0, #6
        add     sp, sp, #0x10
        ldmia   sp!, {r4, pc}
LDIQ0:
        str     r12, [sp, #0xC]
        mov     r12, #0
        str     lr, [sp, #4]
        str     r12, [sp, #8]
        str     r4, [sp]
        bl      LDIQ_ownISFQuantDecode_AMRWBE_16s
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4, pc}
LDIQ1:
        mvn     r0, #7
        add     sp, sp, #0x10
        ldmia   sp!, {r4, pc}
LDIQ_ownISFQuantDecode_AMRWBE_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x12, 28
        ldr     lr, [sp, #0x148]
        add     r6, sp, #0xF0
        and     r6, r6, #0xF
        ldr     r7, [sp, #0x150]
        ldr     r11, [pc, #0xD0C]
        ldr     r9, [sp, #0x144]
        rsb     r6, r6, #0
        cmp     lr, #0
        mov     lr, #0xAB
        and     r8, r6, #0xF
        orr     r6, lr, #0x2A, 24
        add     r12, sp, #0xF0
        str     r7, [sp, #0x14]
        mov     r10, r0
        mov     lr, #0x10
        mov     r4, r1
        mov     r5, r2
        mov     r0, r3
        str     lr, [sp, #0x10]
        add     r7, r12, r8
        beq     LDIQ2
        ldrsh   lr, [r11]
        ldrsh   r12, [r9]
        add     lr, r12, lr
        ldrsh   r12, [r9, #0x20]
        add     lr, r12, lr
        str     lr, [sp, #0x14]
        ldrsh   r12, [r9, #2]
        ldrsh   lr, [r11, #2]
        add     lr, r12, lr
        str     lr, [sp, #0x18]
        ldrsh   lr, [r11, #4]
        ldrsh   r12, [r9, #4]
        str     r12, [sp, #0x1C]
        ldrsh   r12, [r11, #6]
        str     r12, [sp, #0x20]
        ldrsh   r12, [r9, #6]
        ldr     r3, [sp, #0x20]
        str     r12, [sp, #0x24]
        ldrsh   r12, [r11, #8]
        str     r12, [sp, #0x28]
        ldrsh   r12, [r9, #8]
        str     r12, [sp, #0x2C]
        ldrsh   r12, [r11, #0xA]
        str     r12, [sp, #0x30]
        ldrsh   r12, [r9, #0xA]
        str     r12, [sp, #0x34]
        ldrsh   r12, [r11, #0xC]
        str     r12, [sp, #0x38]
        ldrsh   r12, [r9, #0xC]
        str     r12, [sp, #0x3C]
        ldrsh   r12, [r11, #0xE]
        str     r12, [sp, #0x40]
        ldrsh   r12, [r9, #0xE]
        str     r12, [sp, #0x44]
        ldrsh   r12, [r11, #0x10]
        str     r12, [sp, #0x48]
        ldrsh   r12, [r9, #0x10]
        str     r12, [sp, #0x4C]
        ldrsh   r12, [r11, #0x12]
        str     r12, [sp, #0x50]
        ldrsh   r12, [r9, #0x12]
        str     r12, [sp, #0x54]
        ldrsh   r12, [r11, #0x14]
        str     r12, [sp, #0x58]
        ldrsh   r12, [r9, #0x14]
        str     r12, [sp, #0x5C]
        ldrsh   r12, [r11, #0x16]
        str     r12, [sp, #0x60]
        ldrsh   r12, [r9, #0x16]
        str     r12, [sp, #0x64]
        ldrsh   r12, [r11, #0x18]
        str     r12, [sp, #0x68]
        ldrsh   r12, [r9, #0x18]
        str     r12, [sp, #0x6C]
        ldrsh   r12, [r11, #0x1A]
        str     r12, [sp, #0x70]
        ldrsh   r12, [r9, #0x1A]
        str     r12, [sp, #0x74]
        ldrsh   r12, [r11, #0x1C]
        str     r12, [sp, #0x78]
        ldrsh   r12, [r9, #0x1C]
        str     r12, [sp, #0x7C]
        ldrsh   r11, [r11, #0x1E]
        str     r11, [sp, #0x80]
        ldrsh   r12, [r9, #0x1E]
        str     r12, [sp, #0x84]
        ldrsh   r11, [r9, #0x24]
        ldrsh   r10, [r9, #0x40]
        ldrsh   r12, [r9, #0x22]
        str     r11, [sp, #0x88]
        ldrsh   r1, [r9, #0x26]
        ldrsh   r11, [r9, #0x28]
        str     r11, [sp, #0x8C]
        ldrsh   r11, [r9, #0x2A]
        str     r11, [sp, #0x90]
        ldrsh   r11, [r9, #0x2C]
        str     r11, [sp, #0x94]
        ldrsh   r11, [r9, #0x2E]
        str     r11, [sp, #0x98]
        ldrsh   r11, [r9, #0x30]
        str     r11, [sp, #0x9C]
        ldrsh   r11, [r9, #0x32]
        str     r11, [sp, #0xA0]
        ldrsh   r11, [r9, #0x34]
        str     r11, [sp, #0xA4]
        ldrsh   r11, [r9, #0x36]
        str     r11, [sp, #0xA8]
        ldrsh   r11, [r9, #0x38]
        str     r11, [sp, #0xAC]
        ldrsh   r11, [r9, #0x3A]
        str     r11, [sp, #0xB0]
        ldrsh   r11, [r9, #0x3C]
        str     r11, [sp, #0xB4]
        ldrsh   r11, [r9, #0x3E]
        str     r11, [sp, #0xB8]
        ldrsh   r11, [r9, #0x42]
        str     r11, [sp, #0xBC]
        ldrsh   r11, [r9, #0x44]
        str     r11, [sp, #0xC0]
        ldrsh   r11, [r9, #0x46]
        str     r11, [sp, #0xC4]
        ldrsh   r11, [r9, #0x48]
        str     r11, [sp, #0xC8]
        ldrsh   r2, [r9, #0x4C]
        ldrsh   r11, [r9, #0x4A]
        str     r2, [sp, #0xCC]
        ldrsh   r2, [r9, #0x4E]
        str     r2, [sp, #0xD0]
        ldrsh   r2, [r9, #0x50]
        str     r2, [sp, #0xD4]
        ldrsh   r2, [r9, #0x52]
        str     r2, [sp, #0xD8]
        ldrsh   r2, [r9, #0x54]
        str     r2, [sp, #0xDC]
        ldrsh   r2, [r9, #0x56]
        str     r2, [sp, #0xE0]
        ldrsh   r2, [r9, #0x58]
        str     r2, [sp, #0xE4]
        ldrsh   r2, [r9, #0x5A]
        str     r2, [sp, #0xE8]
        ldrsh   r2, [r9, #0x5C]
        str     r2, [sp, #0xEC]
        ldrsh   r9, [r9, #0x5E]
        ldr     r2, [sp, #0x14]
        add     r2, r10, r2
        ldr     r10, [sp, #0x1C]
        add     r2, r2, #2
        add     r10, r10, lr
        ldr     lr, [sp, #0x24]
        mov     r2, r2, asr #2
        add     lr, lr, r3
        add     r3, sp, #0xF0
        strh    r2, [r8, +r3]
        ldr     r2, [sp, #0x28]
        add     lr, r1, lr
        ldr     r1, [sp, #0xC4]
        add     lr, r1, lr
        add     r1, lr, #2
        ldr     lr, [sp, #0x2C]
        mov     r1, r1, asr #2
        strh    r1, [r7, #6]
        ldr     r1, [sp, #0x34]
        add     lr, lr, r2
        ldr     r2, [sp, #0x30]
        add     r1, r1, r2
        ldr     r2, [sp, #0x90]
        add     r1, r2, r1
        add     r1, r11, r1
        ldr     r2, [sp, #0x38]
        add     r11, r1, #2
        ldr     r1, [sp, #0x3C]
        mov     r11, r11, asr #2
        strh    r11, [r7, #0xA]
        ldr     r11, [sp, #0x94]
        add     r1, r1, r2
        ldr     r2, [sp, #0x40]
        add     r1, r11, r1
        ldr     r11, [sp, #0xCC]
        add     r1, r11, r1
        add     r11, r1, #2
        ldr     r1, [sp, #0x44]
        mov     r11, r11, asr #2
        strh    r11, [r7, #0xC]
        ldr     r11, [sp, #0x98]
        add     r1, r1, r2
        ldr     r2, [sp, #0x48]
        add     r1, r11, r1
        ldr     r11, [sp, #0xD0]
        add     r1, r11, r1
        add     r11, r1, #2
        ldr     r1, [sp, #0x4C]
        mov     r11, r11, asr #2
        strh    r11, [r7, #0xE]
        ldr     r11, [sp, #0x9C]
        add     r1, r1, r2
        ldr     r2, [sp, #0x50]
        add     r1, r11, r1
        ldr     r11, [sp, #0xD4]
        add     r1, r11, r1
        add     r11, r1, #2
        ldr     r1, [sp, #0x54]
        mov     r11, r11, asr #2
        strh    r11, [r7, #0x10]
        ldr     r11, [sp, #0xA0]
        add     r1, r1, r2
        ldr     r2, [sp, #0x58]
        add     r1, r11, r1
        ldr     r11, [sp, #0xD8]
        add     r1, r11, r1
        add     r11, r1, #2
        ldr     r1, [sp, #0x5C]
        mov     r11, r11, asr #2
        strh    r11, [r7, #0x12]
        ldr     r11, [sp, #0xA4]
        add     r1, r1, r2
        ldr     r2, [sp, #0x60]
        add     r1, r11, r1
        ldr     r11, [sp, #0xDC]
        add     r1, r11, r1
        add     r11, r1, #2
        ldr     r1, [sp, #0x64]
        mov     r11, r11, asr #2
        strh    r11, [r7, #0x14]
        ldr     r11, [sp, #0xA8]
        add     r1, r1, r2
        ldr     r2, [sp, #0x68]
        add     r1, r11, r1
        ldr     r11, [sp, #0xE0]
        add     r1, r11, r1
        add     r11, r1, #2
        ldr     r1, [sp, #0x6C]
        mov     r11, r11, asr #2
        strh    r11, [r7, #0x16]
        ldr     r11, [sp, #0xAC]
        add     r1, r1, r2
        ldr     r2, [sp, #0x70]
        add     r1, r11, r1
        ldr     r11, [sp, #0xE4]
        add     r1, r11, r1
        add     r11, r1, #2
        ldr     r1, [sp, #0x74]
        mov     r11, r11, asr #2
        strh    r11, [r7, #0x18]
        ldr     r11, [sp, #0xB0]
        add     r1, r1, r2
        ldr     r2, [sp, #0x78]
        add     r1, r11, r1
        ldr     r11, [sp, #0xE8]
        add     r1, r11, r1
        add     r11, r1, #2
        ldr     r1, [sp, #0x7C]
        mov     r11, r11, asr #2
        strh    r11, [r7, #0x1A]
        ldr     r11, [sp, #0xB4]
        add     r1, r1, r2
        ldr     r2, [sp, #0x80]
        add     r1, r11, r1
        ldr     r11, [sp, #0xEC]
        add     r1, r11, r1
        add     r11, r1, #2
        ldr     r1, [sp, #0x84]
        mov     r11, r11, asr #2
        add     r1, r1, r2
        ldr     r2, [sp, #0x18]
        add     r12, r12, r2
        ldr     r2, [sp, #0x88]
        add     r10, r2, r10
        ldr     r2, [sp, #0x8C]
        strh    r11, [r7, #0x1C]
        ldr     r11, [sp, #0xB8]
        add     lr, r2, lr
        mov     r2, r7
        add     r1, r11, r1
        ldr     r11, [sp, #0xBC]
        add     r9, r9, r1
        add     r9, r9, #2
        add     r12, r11, r12
        ldr     r11, [sp, #0xC0]
        add     r12, r12, #2
        mov     r9, r9, asr #2
        mov     r12, r12, asr #2
        add     r10, r11, r10
        ldr     r11, [sp, #0xC8]
        strh    r12, [r7, #2]
        strh    r9, [r7, #0x1E]
        add     r10, r10, #2
        add     lr, r11, lr
        add     lr, lr, #2
        mov     r10, r10, asr #2
        mov     lr, lr, asr #2
        strh    lr, [r7, #8]
        strh    r10, [r7, #4]
        mov     r12, #0xF
        str     r12, [sp, #8]
        ldr     r12, [sp, #0x10]
        str     r4, [sp]
        mov     lr, #0xCD
        str     r12, [sp, #4]
        mov     r12, #0x33
        orr     r3, lr, #3, 22
        orr     r1, r12, #0x73, 24
        bl      _ippsInterpolateC_G729_16s_Sfs
        ldrsh   r12, [r7, #2]
        ldrsh   r3, [r5]
        str     r12, [sp, #0xEC]
        ldrsh   r12, [r7, #4]
        mul     r3, r3, r6
        str     r12, [sp, #0xE8]
        ldrsh   r11, [r5, #2]
        add     r12, sp, #0xF0
        ldrsh   r8, [r8, +r12]
        ldrsh   r12, [r4]
        ldrsh   r9, [r5, #4]
        add     r3, r8, r3, asr #15
        sub     r12, r12, r3
        ldrsh   r3, [r7, #6]
        mul     r9, r9, r6
        mov     r12, r12, lsl #16
        str     r3, [sp, #0xE4]
        ldrsh   r8, [r5, #6]
        ldrsh   r3, [r7, #8]
        mov     r12, r12, asr #17
        str     r3, [sp, #0xE0]
        mul     r8, r8, r6
        ldrsh   r10, [r5, #8]
        ldrsh   r3, [r7, #0xA]
        mul     r10, r10, r6
        str     r3, [sp, #0xDC]
        ldrsh   r3, [r7, #0xC]
        ldrsh   lr, [r5, #0xA]
        str     r3, [sp, #0xD8]
        ldrsh   r1, [r5, #0xC]
        ldrsh   r3, [r7, #0xE]
        mul     lr, lr, r6
        str     r3, [sp, #0xD4]
        ldrsh   r0, [r5, #0xE]
        ldrsh   r3, [r7, #0x10]
        mul     r0, r0, r6
        str     r3, [sp, #0xD0]
        ldrsh   r3, [r5, #0x10]
        str     r3, [sp, #0xCC]
        ldrsh   r3, [r7, #0x12]
        str     r3, [sp, #0xC8]
        ldrsh   r3, [r5, #0x12]
        ldrsh   r2, [r7, #0x14]
        mul     r3, r3, r6
        str     r2, [sp, #0xC4]
        ldrsh   r2, [r5, #0x14]
        str     r2, [sp, #0xC0]
        ldrsh   r2, [r7, #0x16]
        str     r2, [sp, #0xBC]
        ldrsh   r2, [r5, #0x16]
        str     r2, [sp, #0xB8]
        ldrsh   r2, [r7, #0x18]
        str     r2, [sp, #0xB4]
        ldrsh   r2, [r5, #0x18]
        str     r2, [sp, #0xB0]
        ldrsh   r2, [r7, #0x1A]
        str     r2, [sp, #0xAC]
        ldrsh   r2, [r5, #0x1A]
        str     r2, [sp, #0xA8]
        ldrsh   r2, [r7, #0x1C]
        str     r2, [sp, #0xA4]
        ldrsh   r2, [r5, #0x1C]
        str     r2, [sp, #0xA0]
        ldrsh   r7, [r7, #0x1E]
        str     r7, [sp, #0x9C]
        ldrsh   r7, [r5, #0x1E]
        strh    r12, [r5]
        mul     r12, r11, r6
        mul     r7, r7, r6
        ldr     r2, [sp, #0xB8]
        str     r7, [sp, #0x98]
        mul     r7, r1, r6
        ldr     r1, [sp, #0xCC]
        mul     r2, r2, r6
        ldrsh   r11, [r4, #2]
        mul     r1, r1, r6
        str     r1, [sp, #0xCC]
        ldr     r1, [sp, #0xC0]
        str     r2, [sp, #0xC0]
        ldr     r2, [sp, #0xB0]
        mul     r1, r1, r6
        mul     r2, r2, r6
        str     r2, [sp, #0xB8]
        ldr     r2, [sp, #0xA8]
        mul     r2, r2, r6
        str     r2, [sp, #0xB0]
        ldr     r2, [sp, #0xA0]
        mul     r6, r2, r6
        str     r6, [sp, #0xA8]
        ldr     r6, [sp, #0xEC]
        add     r12, r6, r12, asr #15
        sub     r11, r11, r12
        ldr     r12, [sp, #0xE8]
        mov     r11, r11, lsl #16
        mov     r11, r11, asr #17
        add     r9, r12, r9, asr #15
        ldr     r12, [sp, #0xE4]
        add     r8, r12, r8, asr #15
        ldr     r12, [sp, #0xE0]
        add     r10, r12, r10, asr #15
        ldr     r12, [sp, #0xDC]
        str     r10, [sp, #0xEC]
        strh    r11, [r5, #2]
        ldr     r6, [sp, #0xD8]
        add     lr, r12, lr, asr #15
        ldrsh   r12, [r4, #4]
        add     r7, r6, r7, asr #15
        ldr     r6, [sp, #0xD4]
        sub     r9, r12, r9
        ldr     r12, [sp, #0xD0]
        add     r0, r6, r0, asr #15
        ldr     r6, [sp, #0xCC]
        add     r6, r12, r6, asr #15
        ldr     r12, [sp, #0xC8]
        str     r6, [sp, #0xE8]
        mov     r6, r9, lsl #16
        add     r3, r12, r3, asr #15
        ldr     r12, [sp, #0xC4]
        ldr     r9, [sp, #0xC0]
        mov     r6, r6, asr #17
        add     r1, r12, r1, asr #15
        ldr     r12, [sp, #0xBC]
        strh    r6, [r5, #4]
        ldr     r11, [sp, #0xB0]
        ldrsh   r10, [r4, #6]
        add     r12, r12, r9, asr #15
        ldr     r6, [sp, #0xB4]
        ldr     r9, [sp, #0xB8]
        ldr     r2, [sp, #0x98]
        add     r6, r6, r9, asr #15
        ldr     r9, [sp, #0xAC]
        add     r9, r9, r11, asr #15
        sub     r11, r10, r8
        ldr     r8, [sp, #0xA4]
        ldr     r10, [sp, #0xA8]
        mov     r11, r11, lsl #16
        mov     r11, r11, asr #17
        add     r10, r8, r10, asr #15
        ldr     r8, [sp, #0x9C]
        strh    r11, [r5, #6]
        ldr     r11, [sp, #0xEC]
        add     r8, r8, r2, asr #15
        ldrsh   r2, [r4, #8]
        sub     r2, r2, r11
        mov     r11, r2, lsl #16
        mov     r11, r11, asr #17
        strh    r11, [r5, #8]
        ldrsh   r11, [r4, #0xA]
        sub     r11, r11, lr
        mov     lr, r11, lsl #16
        mov     lr, lr, asr #17
        strh    lr, [r5, #0xA]
        ldrsh   lr, [r4, #0xC]
        sub     lr, lr, r7
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #17
        strh    lr, [r5, #0xC]
        ldrsh   lr, [r4, #0xE]
        sub     lr, lr, r0
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #17
        strh    lr, [r5, #0xE]
        ldrsh   r7, [r4, #0x10]
        ldr     lr, [sp, #0xE8]
        sub     r7, r7, lr
        mov     lr, r7, lsl #16
        mov     lr, lr, asr #17
        strh    lr, [r5, #0x10]
        ldrsh   lr, [r4, #0x12]
        sub     lr, lr, r3
        mov     r3, lr, lsl #16
        mov     r3, r3, asr #17
        strh    r3, [r5, #0x12]
        ldrsh   r3, [r4, #0x14]
        sub     r3, r3, r1
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #17
        strh    r3, [r5, #0x14]
        ldrsh   r3, [r4, #0x16]
        sub     r3, r3, r12
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #17
        strh    r3, [r5, #0x16]
        ldrsh   r3, [r4, #0x18]
        sub     r3, r3, r6
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #17
        strh    r3, [r5, #0x18]
        ldrsh   r3, [r4, #0x1A]
        sub     r3, r3, r9
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #17
        strh    r3, [r5, #0x1A]
        ldrsh   r3, [r4, #0x1C]
        sub     r3, r3, r10
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #17
        strh    r3, [r5, #0x1C]
        ldrsh   r3, [r4, #0x1E]
        sub     r3, r3, r8
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #17
        strh    r3, [r5, #0x1E]
        b       LDIQ5
LDIQ2:
        ldrsh   r12, [r10]
        ldr     r3, [pc, #0x530]
        mov     r2, #9
        rsb     r12, r12, r12, lsl #2
        mov     r1, r4
        add     r7, r4, #0x12
        add     r0, r3, r12, lsl #3
        bl      _ippsCopy_16s
        ldrsh   r12, [r10, #2]
        ldr     r3, [pc, #0x514]
        mov     r2, #7
        mov     r1, r7
        add     r0, r3, r12, lsl #4
        bl      _ippsCopy_16s
        ldr     r3, [sp, #0x14]
        cmp     r3, #5
        beq     LDIQ6
        ldr     r3, [sp, #0x14]
        cmp     r3, #0x19
        beq     LDIQ6
        ldrsh   lr, [r10, #4]
        ldr     r3, [pc, #0x4E8]
        ldrsh   r7, [r4]
        ldrsh   r12, [r4, #6]
        mov     lr, lr, lsl #3
        ldrsh   r8, [r3, +lr]
        ldr     lr, [pc, #0x4D8]
        add     r7, r8, r7
        strh    r7, [r4]
        ldrsh   r8, [r10, #4]
        ldrsh   r7, [r4, #2]
        add     r8, r3, r8, lsl #3
        ldrsh   r8, [r8, #2]
        add     r7, r8, r7
        ldrsh   r8, [r4, #4]
        strh    r7, [r4, #2]
        ldrsh   r7, [r10, #4]
        add     r7, r3, r7, lsl #3
        ldrsh   r7, [r7, #4]
        ldrsh   r3, [r4, #0xE]
        add     r8, r7, r8
        strh    r8, [r4, #4]
        ldrsh   r8, [r10, #6]
        ldrsh   r7, [r4, #8]
        mov     r8, r8, lsl #3
        ldrsh   r8, [lr, +r8]
        add     r12, r8, r12
        strh    r12, [r4, #6]
        ldrsh   r8, [r10, #6]
        ldrsh   r12, [r4, #0xA]
        add     r8, lr, r8, lsl #3
        ldrsh   r8, [r8, #2]
        add     r7, r8, r7
        ldrsh   r8, [r4, #0xC]
        strh    r7, [r4, #8]
        ldrsh   r7, [r10, #6]
        add     r7, lr, r7, lsl #3
        ldrsh   lr, [r7, #4]
        ldr     r7, [pc, #0x45C]
        add     r12, lr, r12
        ldrsh   lr, [r4, #0x10]
        strh    r12, [r4, #0xA]
        ldrsh   r12, [r10, #8]
        mov     r12, r12, lsl #3
        ldrsh   r12, [r7, +r12]
        add     r8, r12, r8
        ldr     r12, [pc, #0x440]
        strh    r8, [r4, #0xC]
        ldrsh   r8, [r10, #8]
        add     r8, r7, r8, lsl #3
        ldrsh   r8, [r8, #2]
        add     r3, r8, r3
        strh    r3, [r4, #0xE]
        ldrsh   r3, [r10, #8]
        add     r3, r7, r3, lsl #3
        ldrsh   r7, [r3, #4]
        ldrsh   r3, [r4, #0x12]
        add     lr, r7, lr
        strh    lr, [r4, #0x10]
        ldrsh   lr, [r10, #0xA]
        ldrsh   r7, [r4, #0x14]
        mov     lr, lr, lsl #3
        ldrsh   lr, [r12, +lr]
        add     r3, lr, r3
        strh    r3, [r4, #0x12]
        ldrsh   r3, [r10, #0xA]
        ldrsh   lr, [r4, #0x16]
        add     r3, r12, r3, lsl #3
        ldrsh   r3, [r3, #2]
        add     r7, r3, r7
        strh    r7, [r4, #0x14]
        ldrsh   r7, [r10, #0xA]
        ldr     r3, [pc, #0x3DC]
        add     r7, r12, r7, lsl #3
        ldrsh   r7, [r7, #4]
        ldrsh   r12, [r4, #0x18]
        add     lr, r7, lr
        strh    lr, [r4, #0x16]
        ldrsh   r7, [r10, #0xC]
        ldrsh   lr, [r4, #0x1A]
        mov     r7, r7, lsl #3
        ldrsh   r7, [r3, +r7]
        add     r12, r7, r12
        strh    r12, [r4, #0x18]
        ldrsh   r7, [r10, #0xC]
        ldrsh   r12, [r4, #0x1C]
        add     r7, r3, r7, lsl #3
        ldrsh   r7, [r7, #2]
        add     lr, r7, lr
        strh    lr, [r4, #0x1A]
        ldrsh   r7, [r10, #0xC]
        ldrsh   lr, [r4, #0x1E]
        add     r7, r3, r7, lsl #3
        ldrsh   r7, [r7, #4]
        add     r12, r7, r12
        strh    r12, [r4, #0x1C]
        ldrsh   r10, [r10, #0xC]
        add     r10, r3, r10, lsl #3
        ldrsh   r3, [r10, #6]
        add     lr, r3, lr
        strh    lr, [r4, #0x1E]
LDIQ3:
        ldrsh   r3, [r4]
        ldrsh   r12, [r11]
        add     r9, r9, #0x20
        add     r12, r12, r3
        mov     r12, r12, lsl #16
        mov     lr, r12, asr #16
        strh    lr, [r4]
        ldrsh   r7, [r5]
        mov     r12, r4
        mul     r7, r7, r6
        add     r7, lr, r7, asr #15
        strh    r7, [r4]
        strh    r3, [r5]
        ldrsh   r3, [r4, #2]
        ldrsh   lr, [r11, #2]
        add     lr, lr, r3
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        strh    lr, [r4, #2]
        ldrsh   r7, [r5, #2]
        mul     r7, r7, r6
        add     r7, lr, r7, asr #15
        strh    r7, [r4, #2]
        strh    r3, [r5, #2]
        ldrsh   lr, [r11, #4]
        ldrsh   r3, [r4, #4]
        add     lr, lr, r3
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        strh    lr, [r4, #4]
        ldrsh   r7, [r5, #4]
        mul     r7, r7, r6
        add     r7, lr, r7, asr #15
        strh    r7, [r4, #4]
        strh    r3, [r5, #4]
        ldrsh   lr, [r11, #6]
        ldrsh   r3, [r4, #6]
        add     lr, lr, r3
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        strh    lr, [r4, #6]
        ldrsh   r7, [r5, #6]
        mul     r7, r7, r6
        add     r7, lr, r7, asr #15
        strh    r7, [r4, #6]
        strh    r3, [r5, #6]
        ldrsh   lr, [r11, #8]
        ldrsh   r3, [r4, #8]
        add     lr, lr, r3
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        strh    lr, [r4, #8]
        ldrsh   r7, [r5, #8]
        mul     r7, r7, r6
        add     r7, lr, r7, asr #15
        strh    r7, [r4, #8]
        strh    r3, [r5, #8]
        ldrsh   lr, [r11, #0xA]
        ldrsh   r3, [r4, #0xA]
        add     lr, lr, r3
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        strh    lr, [r4, #0xA]
        ldrsh   r7, [r5, #0xA]
        mul     r7, r7, r6
        add     r7, lr, r7, asr #15
        strh    r7, [r4, #0xA]
        strh    r3, [r5, #0xA]
        ldrsh   lr, [r11, #0xC]
        ldrsh   r3, [r4, #0xC]
        add     lr, lr, r3
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        strh    lr, [r4, #0xC]
        ldrsh   r7, [r5, #0xC]
        mul     r7, r7, r6
        add     r7, lr, r7, asr #15
        strh    r7, [r4, #0xC]
        strh    r3, [r5, #0xC]
        ldrsh   r3, [r4, #0xE]
        ldrsh   lr, [r11, #0xE]
        add     lr, lr, r3
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        strh    lr, [r4, #0xE]
        ldrsh   r7, [r5, #0xE]
        mul     r7, r7, r6
        add     r7, lr, r7, asr #15
        strh    r7, [r4, #0xE]
        strh    r3, [r5, #0xE]
        ldrsh   r3, [r4, #0x10]
        ldrsh   lr, [r11, #0x10]
        add     lr, lr, r3
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        strh    lr, [r4, #0x10]
        ldrsh   r7, [r5, #0x10]
        mul     r7, r7, r6
        add     r7, lr, r7, asr #15
        strh    r7, [r4, #0x10]
        strh    r3, [r5, #0x10]
        ldrsh   r3, [r4, #0x12]
        ldrsh   lr, [r11, #0x12]
        add     lr, lr, r3
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        strh    lr, [r4, #0x12]
        ldrsh   r7, [r5, #0x12]
        mul     r7, r7, r6
        add     r7, lr, r7, asr #15
        strh    r7, [r4, #0x12]
        strh    r3, [r5, #0x12]
        ldrsh   r3, [r4, #0x14]
        ldrsh   lr, [r11, #0x14]
        add     lr, lr, r3
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        strh    lr, [r4, #0x14]
        ldrsh   r7, [r5, #0x14]
        mul     r7, r7, r6
        add     r7, lr, r7, asr #15
        strh    r7, [r4, #0x14]
        strh    r3, [r5, #0x14]
        ldrsh   lr, [r11, #0x16]
        ldrsh   r3, [r4, #0x16]
        add     lr, lr, r3
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        strh    lr, [r4, #0x16]
        ldrsh   r7, [r5, #0x16]
        mul     r7, r7, r6
        add     r7, lr, r7, asr #15
        strh    r7, [r4, #0x16]
        strh    r3, [r5, #0x16]
        ldrsh   lr, [r11, #0x18]
        ldrsh   r3, [r4, #0x18]
        add     lr, lr, r3
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        strh    lr, [r4, #0x18]
        ldrsh   r7, [r5, #0x18]
        mul     r7, r7, r6
        add     r7, lr, r7, asr #15
        strh    r7, [r4, #0x18]
        strh    r3, [r5, #0x18]
        ldrsh   lr, [r11, #0x1A]
        ldrsh   r3, [r4, #0x1A]
        add     lr, lr, r3
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        strh    lr, [r4, #0x1A]
        ldrsh   r7, [r5, #0x1A]
        mul     r7, r7, r6
        add     r7, lr, r7, asr #15
        strh    r7, [r4, #0x1A]
        strh    r3, [r5, #0x1A]
        ldrsh   lr, [r11, #0x1C]
        ldrsh   r3, [r4, #0x1C]
        add     lr, lr, r3
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        strh    lr, [r4, #0x1C]
        ldrsh   r7, [r5, #0x1C]
        mul     r7, r7, r6
        add     r7, lr, r7, asr #15
        strh    r7, [r4, #0x1C]
        strh    r3, [r5, #0x1C]
        ldrsh   r11, [r11, #0x1E]
        ldrsh   r3, [r4, #0x1E]
        add     r11, r11, r3
        mov     r11, r11, lsl #16
        mov     lr, r11, asr #16
        strh    lr, [r4, #0x1E]
        ldrsh   r7, [r5, #0x1E]
        mul     r6, r7, r6
        add     r6, lr, r6, asr #15
        strh    r6, [r4, #0x1E]
        strh    r3, [r5, #0x1E]
        ldr     r2, [sp, #0x10]
LDIQ4:
        ldrsh   lr, [r9]
        ldrsh   r3, [r9, #-0x20]
        subs    r2, r2, #1
        strh    lr, [r9, #0x20]
        strh    r3, [r9]
        ldrsh   r3, [r12], #2
        strh    r3, [r9, #-0x20]
        add     r9, r9, #2
        bne     LDIQ4
LDIQ5:
        mov     r0, r4
        mov     r2, #0xF
        mov     r1, #0x80
        bl      ReorderLsf
        add     sp, sp, #0x12, 28
        ldmia   sp!, {r4 - r11, pc}
LDIQ6:
        ldrsh   r12, [r10, #4]
        ldr     r3, [pc, #0x60]
        mov     r2, #5
        mov     r1, r4
        add     r0, r3, r12, lsl #4
        bl      _ippsAdd_16s_I
        ldrsh   r12, [r10, #6]
        ldr     r3, [pc, #0x4C]
        add     r1, r4, #0xA
        mov     r2, #4
        add     r0, r3, r12, lsl #3
        bl      _ippsAdd_16s_I
        ldrsh   r10, [r10, #8]
        ldr     r3, [pc, #0x38]
        mov     r1, r7
        mov     r2, #7
        add     r0, r3, r10, lsl #4
        bl      _ippsAdd_16s_I
        b       LDIQ3
        .long   meanISFTbl
        .long   QCdbk1ISFTbl
        .long   QCdbk2ISFTbl
        .long   QCdbk21ISFTbl
        .long   QCdbk22ISFTbl
        .long   QCdbk23ISFTbl
        .long   QCdbk24ISFTbl
        .long   QCdbk25ISFTbl
        .long   QCdbk21ISF36bTbl
        .long   QCdbk22ISF36bTbl
        .long   QCdbk23ISF36bTbl


