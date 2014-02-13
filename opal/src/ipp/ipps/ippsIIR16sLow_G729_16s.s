#include "TargetConditionals.h"
#if !TARGET_IPHONE_SIMULATOR
        .text
        .align  4
        .globl  _ippsIIR16sLow_G729_16s


_ippsIIR16sLow_G729_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x68
        cmp     r0, #0
        beq     LDUC1
        cmp     r1, #0
        beq     LDUC1
        cmp     r2, #0
        beq     LDUC1
        cmp     r3, #0
        beq     LDUC1
        ldrsh   r4, [r3, #6]
        ldrsh   lr, [r3]
        ldrsh   r6, [r3, #2]
        ldrsh   r7, [r3, #4]
        ldrsh   r12, [r3, #8]
        add     r5, sp, #4
        strh    r4, [r5, #6]
        ldrsh   r4, [r3, #0x10]
        strh    lr, [r5]
        strh    r12, [r5, #8]
        ldrsh   lr, [r3, #0xA]
        strh    r6, [r5, #2]
        strh    r7, [r5, #4]
        ldrsh   r12, [r3, #0x12]
        ldrsh   r6, [r3, #0xC]
        ldrsh   r7, [r3, #0xE]
        strh    r4, [r5, #0x10]
        strh    lr, [r5, #0xA]
        strh    r12, [r5, #0x12]
        strh    r6, [r5, #0xC]
        strh    r7, [r5, #0xE]
        mov     r4, #0
        mov     lr, r4
        add     r12, r1, #0x14
        str     r3, [sp]
LDUC0:
        ldrsh   r7, [r0]
        ldrsh   r6, [r12], #2
        ldrsh   r9, [r0, #2]
        add     r3, lr, #0xA
        add     lr, lr, #1
        add     r5, r1, r3, lsl #1
        ldrsh   r8, [r5, #-2]
        add     r3, sp, #4
        cmp     lr, #0x28
        mul     r8, r9, r8
        mla     r8, r7, r6, r8
        ldrsh   r7, [r0, #4]
        ldrsh   r6, [r5, #-4]
        mla     r6, r7, r6, r8
        ldrsh   r7, [r5, #-6]
        ldrsh   r8, [r0, #6]
        mla     r6, r8, r7, r6
        ldrsh   r7, [r5, #-8]
        ldrsh   r8, [r0, #8]
        mla     r6, r8, r7, r6
        ldrsh   r7, [r5, #-0xA]
        ldrsh   r8, [r0, #0xA]
        mla     r6, r8, r7, r6
        ldrsh   r7, [r5, #-0xC]
        ldrsh   r8, [r0, #0xC]
        mla     r6, r8, r7, r6
        ldrsh   r7, [r5, #-0xE]
        ldrsh   r8, [r0, #0xE]
        mla     r6, r8, r7, r6
        ldrsh   r7, [r5, #-0x10]
        ldrsh   r8, [r0, #0x10]
        mla     r6, r8, r7, r6
        ldrsh   r7, [r5, #-0x12]
        ldrsh   r8, [r0, #0x12]
        ldrsh   r5, [r5, #-0x14]
        mla     r6, r8, r7, r6
        ldrsh   r8, [r0, #0x14]
        ldrsh   r7, [r0, #0x16]
        mla     r6, r8, r5, r6
        ldrsh   r8, [r0, #0x18]
        add     r5, r3, r4
        ldrsh   r3, [r3, +r4]
        add     r6, r6, #2, 22
        ldrsh   r9, [r5, #0x12]
        mov     r10, r6, asr #12
        ldrsh   r6, [r0, #0x1A]
        mov     r10, r10, lsl #16
        mul     r9, r8, r9
        mov     r10, r10, asr #16
        mul     r7, r7, r10
        ldrsh   r10, [r5, #0x10]
        ldrsh   r8, [r0, #0x1C]
        add     r4, r4, #2
        sub     r7, r7, r9
        mul     r10, r6, r10
        ldrsh   r9, [r5, #0xE]
        ldrsh   r6, [r0, #0x1E]
        mul     r9, r8, r9
        ldrsh   r8, [r0, #0x20]
        sub     r7, r7, r10
        ldrsh   r10, [r5, #0xC]
        sub     r7, r7, r9
        mul     r9, r6, r10
        ldrsh   r10, [r5, #0xA]
        ldrsh   r6, [r0, #0x22]
        mul     r8, r8, r10
        sub     r10, r7, r9
        ldrsh   r7, [r5, #8]
        ldrsh   r9, [r0, #0x24]
        sub     r8, r10, r8
        mul     r10, r6, r7
        ldrsh   r6, [r5, #6]
        ldrsh   r7, [r0, #0x26]
        mul     r6, r9, r6
        ldrsh   r9, [r0, #0x28]
        sub     r11, r8, r10
        ldrsh   r10, [r5, #4]
        ldrsh   r8, [r0, #0x2A]
        sub     r6, r11, r6
        mul     r10, r7, r10
        ldrsh   r7, [r5, #2]
        mul     r3, r8, r3
        mul     r7, r9, r7
        sub     r6, r6, r10
        sub     r6, r6, r7
        sub     r6, r6, r3
        add     r3, r6, #2, 22
        mov     r3, r3, asr #12
        strh    r3, [r2], #2
        strh    r3, [r5, #0x14]
        blt     LDUC0
        add     r5, sp, #4
        ldr     r3, [sp]
        ldrsh   r7, [r5, #0x50]
        ldrsh   r0, [r5, #0x52]
        ldrsh   r1, [r5, #0x54]
        ldrsh   r2, [r5, #0x56]
        ldrsh   r12, [r5, #0x58]
        ldrsh   lr, [r5, #0x5A]
        ldrsh   r4, [r5, #0x5C]
        ldrsh   r6, [r5, #0x5E]
        strh    r7, [r3]
        ldrsh   r7, [r5, #0x60]
        ldrsh   r5, [r5, #0x62]
        strh    r0, [r3, #2]
        mov     r0, #0
        strh    r1, [r3, #4]
        strh    r2, [r3, #6]
        strh    r12, [r3, #8]
        strh    lr, [r3, #0xA]
        strh    r4, [r3, #0xC]
        strh    r6, [r3, #0xE]
        strh    r7, [r3, #0x10]
        strh    r5, [r3, #0x12]
        add     sp, sp, #0x68
        ldmia   sp!, {r4 - r11, pc}
LDUC1:
        mvn     r0, #7
        add     sp, sp, #0x68
        ldmia   sp!, {r4 - r11, pc}

#endif // !TARGET_IPHONE_SIMULATOR


