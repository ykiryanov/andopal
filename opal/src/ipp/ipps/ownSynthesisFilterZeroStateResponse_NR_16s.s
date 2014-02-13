        .text
        .align  4
        .globl  ownSynthesisFilterZeroStateResponse_NR_16s


ownSynthesisFilterZeroStateResponse_NR_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x28
        ldrsh   r12, [r0]
        cmp     r2, #1
        strh    r12, [r1]
        sub     r9, r3, #1
        mov     r8, #1
        ble     LDTQ5
        mov     r7, #9
        mov     r6, #1
LDTQ0:
        rsb     r11, r7, #0xA
        cmp     r11, #1
        mov     r12, #0
        movlt   r10, r6, lsl #1
        blt     LDTQ4
        rsb     lr, r7, #0
        sub     lr, lr, #1
        add     lr, lr, #0xA
        cmp     lr, #6
        blt     LDTQ6
        rsb     r5, r7, #4
        str     r5, [sp, #0x24]
        str     r9, [sp, #0x10]
        ldr     r9, [sp, #0x24]
        mov     r10, r6, lsl #1
        mov     r4, #1
        add     lr, r1, r10
        add     r5, r0, #2
        str     r10, [sp]
        str     r11, [sp, #4]
        str     r6, [sp, #8]
        str     r7, [sp, #0xC]
        str     r3, [sp, #0x14]
        str     r2, [sp, #0x18]
        str     r1, [sp, #0x1C]
        str     r0, [sp, #0x20]
LDTQ1:
        ldrsh   r11, [r5]
        mvn     r0, #0
        ldrsh   r3, [r5, #2]
        ldrsh   r6, [r5, #4]
        ldrsh   r7, [r5, #6]
        ldrsh   r8, [r5, #8]
        rsb     r2, r4, #0
        rsb     r1, r4, r0
        mvn     r0, #1
        mov     r2, r2, lsl #1
        ldrsh   r2, [lr, +r2]
        mov     r1, r1, lsl #1
        rsb     r0, r4, r0
        ldrsh   r1, [lr, +r1]
        mul     r2, r11, r2
        mov     r0, r0, lsl #1
        ldrsh   r0, [lr, +r0]
        mul     r1, r3, r1
        mvn     r10, #2
        mul     r0, r6, r0
        mvn     r11, #3
        rsb     r10, r4, r10
        rsb     r11, r4, r11
        sub     r12, r12, r2
        mov     r10, r10, lsl #1
        ldrsh   r3, [lr, +r10]
        mov     r11, r11, lsl #1
        ldrsh   r6, [lr, +r11]
        sub     r1, r12, r1
        mul     r3, r7, r3
        sub     r1, r1, r0
        mul     r6, r8, r6
        add     r4, r4, #5
        cmp     r4, r9
        sub     r1, r1, r3
        sub     r12, r1, r6
        add     r5, r5, #0xA
        ble     LDTQ1
        ldr     r10, [sp]
        ldr     r11, [sp, #4]
        ldr     r6, [sp, #8]
        ldr     r7, [sp, #0xC]
        ldr     r9, [sp, #0x10]
        ldr     r3, [sp, #0x14]
        ldr     r2, [sp, #0x18]
        ldr     r1, [sp, #0x1C]
        ldr     r0, [sp, #0x20]
        mov     r8, #1
LDTQ2:
        add     r5, r0, r4, lsl #1
        str     r1, [sp, #0x1C]
        str     r0, [sp, #0x20]
LDTQ3:
        rsb     r1, r4, #0
        ldrsh   r0, [r5], #2
        mov     r1, r1, lsl #1
        ldrsh   r1, [lr, +r1]
        add     r4, r4, #1
        mul     r1, r0, r1
        cmp     r4, r11
        sub     r12, r12, r1
        ble     LDTQ3
        ldr     r1, [sp, #0x1C]
        ldr     r0, [sp, #0x20]
LDTQ4:
        add     r12, r12, r8, lsl r9
        mov     r12, r12, asr r3
        cmp     r7, #0
        strh    r12, [r10, +r1]
        subgt   r7, r7, #1
        add     r6, r6, #1
        cmp     r6, r2
        blt     LDTQ0
LDTQ5:
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LDTQ6:
        mov     r10, r6, lsl #1
        mov     r4, #1
        add     lr, r1, r10
        b       LDTQ2


