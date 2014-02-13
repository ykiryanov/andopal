        .text
        .align  4
        .globl  ownWeightedMSE_AMRWB


ownWeightedMSE_AMRWB:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x34
        ldr     r12, [sp, #0x58]
        ldr     lr, [sp, #0x5C]
        cmp     r12, #0
        str     lr, [sp, #0xC]
        str     r0, [sp, #8]
        str     r1, [sp, #4]
        str     r2, [sp]
        mov     r8, #0
        movle   r0, r8
        ble     LDIU2
        ldrsh   r10, [r3, #2]
        ldrsh   r11, [r3, #0xE]
        ldrsh   r1, [r3]
        ldrsh   r2, [r3, #4]
        ldrsh   lr, [r3, #0xC]
        ldrsh   r9, [r3, #0x10]
        ldrsh   r6, [r3, #8]
        ldrsh   r5, [r3, #0xA]
        ldrsh   r4, [r3, #6]
        ldrsh   r3, [r3, #0x12]
        str     r11, [sp, #0x24]
        str     r10, [sp, #0x30]
        ldr     r10, [sp]
        ldr     r11, [sp, #4]
        mov     r0, r8
        mvn     r7, #2, 2
        str     r0, [sp, #0x10]
        str     r3, [sp, #0x18]
        str     r9, [sp, #0x20]
        str     lr, [sp, #0x2C]
        str     r2, [sp, #0x28]
        str     r1, [sp, #0x1C]
        str     r12, [sp, #0x14]
LDIU0:
        ldrsh   r3, [r11, #2]
        ldr     r2, [sp, #8]
        ldrsh   r0, [r11], #4
        ldrsh   r1, [r10], #2
        ldr     r12, [sp, #0x30]
        mul     r3, r2, r3
        ldr     r2, [sp, #0x1C]
        ldr     lr, [sp, #0x28]
        mul     r2, r2, r1
        mul     r1, r1, r12
        add     r3, r3, #1, 18
        mov     r12, #0xFF
        mov     r3, r3, asr #15
        mla     lr, r0, lr, r2
        mla     r1, r0, r4, r1
        mov     r3, r3, lsl #16
        orr     r2, r12, #0x7F, 24
        mov     r12, r3, asr #16
        mul     r3, r12, r0
        mul     r9, r12, r12
        mov     r0, r9, asr #15
        mov     r0, r0, lsl #16
        add     r3, r3, #1, 18
        mov     r0, r0, asr #16
        mla     lr, r6, r0, lr
        mla     r1, r0, r5, r1
        and     r2, r9, r2
        mul     r0, r5, r2
        ldr     r2, [sp, #0x2C]
        mov     r3, r3, asr #15
        mla     lr, r12, r2, lr
        ldr     r2, [sp, #0x24]
        mov     r3, r3, lsl #16
        mla     r1, r12, r2, r1
        mov     r2, r3, asr #16
        ldr     r3, [sp, #0x20]
        mla     lr, r3, r2, lr
        ldr     r3, [sp, #0x18]
        mla     r1, r2, r3, r1
        add     r0, lr, r0, asr #3
        mov     r1, r1, lsl #1
        add     r0, r1, r0, asr #11
        cmp     r0, r7
        bge     LDIU1
        mov     r1, r8, lsl #16
        mov     r7, r0
        mov     r1, r1, asr #16
        str     r1, [sp, #0x10]
LDIU1:
        ldr     r0, [sp, #0x14]
        add     r8, r8, #1
        cmp     r8, r0
        blt     LDIU0
        ldr     r0, [sp, #0x10]
LDIU2:
        ldr     r1, [sp, #0xC]
        strh    r0, [r1]
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}


