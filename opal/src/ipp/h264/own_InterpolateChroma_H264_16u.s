        .text
        .align  4
        .globl  own_InterpolateChroma_H264_16u


own_InterpolateChroma_H264_16u:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        ldr     r12, [r2, #0x1C]
        ldr     lr, [r2, #0x10]
        ldr     r3, [r2, #0x14]
        ldr     r7, [r2, #8]
        cmp     r12, #0
        rsb     lr, lr, #8
        rsb     r3, r3, #8
        ble     LLAL3
        mul     r4, lr, r3
        ldr     r8, [r2, #0x18]
        mov     r9, #0
        str     lr, [sp, #0x14]
        str     r4, [sp, #0x1C]
LLAL0:
        cmp     r8, #0
        addle   r10, r0, r1, lsl #1
        ble     LLAL2
        add     r10, r0, r1, lsl #1
        add     r8, r0, #2
        mov     r6, #0
        mov     r5, r6
        mov     r4, r8
        mov     lr, r10
        mov     r12, r1
        str     r10, [sp, #8]
        str     r8, [sp, #0xC]
        str     r9, [sp, #4]
        str     r7, [sp, #0x10]
        str     r1, [sp]
        str     r0, [sp, #0x18]
LLAL1:
        ldr     r1, [sp, #0x14]
        ldr     r9, [r2, #0x14]
        ldrh    r11, [lr], #2
        ldrh    r0, [r4], #2
        ldr     r8, [r2, #0x10]
        mul     r10, r1, r9
        ldr     r1, [sp, #0x18]
        mul     r0, r3, r0
        mov     r7, r12, lsl #1
        ldrh    r1, [r1, +r5]
        mul     r11, r10, r11
        ldr     r10, [sp, #0xC]
        add     r12, r12, #1
        ldrh    r7, [r10, +r7]
        add     r6, r6, #1
        mla     r0, r9, r7, r0
        ldr     r7, [sp, #0x1C]
        mla     r11, r7, r1, r11
        add     r1, r11, #0x20
        mla     r1, r0, r8, r1
        mov     r0, r1, asr #6
        ldr     r1, [sp, #0x10]
        strh    r0, [r1, +r5]
        ldr     r8, [r2, #0x18]
        add     r5, r5, #2
        cmp     r6, r8
        blt     LLAL1
        ldr     r10, [sp, #8]
        ldr     r9, [sp, #4]
        ldr     r7, [sp, #0x10]
        ldr     r1, [sp]
        ldr     r12, [r2, #0x1C]
LLAL2:
        ldr     lr, [r2, #0xC]
        add     r9, r9, #1
        cmp     r9, r12
        mov     r0, r10
        add     r7, r7, lr, lsl #1
        blt     LLAL0
LLAL3:
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}


