        .text
        .align  4
        .globl  _ippsDecodeAdaptiveVector_G729_16s_I


_ippsDecodeAdaptiveVector_G729_16s_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        cmp     r1, #0
        beq     LDQU7
        cmp     r0, #0
        beq     LDQU7
        ldrsh   r2, [r0]
        ldrsh   r0, [r0, #2]
        cmp     r2, #0x12
        blt     LDQU0
        cmp     r2, #0x90
        bgt     LDQU0
        cmn     r0, #1
        bge     LDQU1
LDQU0:
        mvn     r0, #0xA
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LDQU1:
        cmp     r0, #1
        bgt     LDQU0
        rsb     r3, r2, #0x9A
        rsbs    r2, r0, #0
        add     r0, r1, r3, lsl #1
        addmi   r2, r2, #3
        submi   r0, r0, #2
        ldr     r6, [pc, #0x26C]
        rsb     r3, r2, #0
        mov     r12, r2, lsl #1
        mov     r2, #0x6E, 30
        add     lr, r6, r3, lsl #1
        add     r3, r1, #0x4D, 30
        mvn     r7, #0
        orr     r2, r2, #9, 22
        add     r5, lr, #6
        add     r1, r6, r12
        mov     r4, #0x28
        str     r7, [sp]
LDQU2:
        mov     r11, r0
        add     r0, r0, #2
        ldrsh   r7, [r0]
        ldrsh   r6, [r11]
        adds    r7, r6, r7
        bpl     LDQU3
        cmp     r7, #2, 2
        rsbne   r7, r7, #0
        beq     LDQU4
LDQU3:
        cmp     r2, r7
        ble     LDQU4
        ldr     r6, [pc, #0x210]
        ldrsh   r7, [r11]
        ldrsh   r8, [lr, #6]
        ldrsh   r6, [r6, +r12]
        ldrsh   r9, [r0]
        mul     r9, r9, r8
        ldrsh   r8, [r11, #-2]
        mul     r7, r7, r6
        ldrsh   r6, [r1, #6]
        mul     r6, r8, r6
        ldrsh   r8, [lr, #0xC]
        adds    r7, r7, #0
        adds    r7, r7, r9
        ldrsh   r9, [r0, #2]
        adds    r6, r7, r6
        ldrsh   r7, [r1, #0xC]
        mul     r8, r9, r8
        ldrsh   r9, [r11, #-4]
        adds    r8, r6, r8
        ldrsh   r6, [lr, #0x12]
        mul     r7, r9, r7
        ldrsh   r9, [r0, #4]
        adds    r8, r8, r7
        ldrsh   r7, [r1, #0x12]
        mul     r6, r9, r6
        ldrsh   r9, [r11, #-6]
        adds    r8, r8, r6
        ldrsh   r6, [lr, #0x18]
        mul     r7, r9, r7
        ldrsh   r9, [r0, #6]
        adds    r8, r8, r7
        ldrsh   r7, [r1, #0x18]
        mul     r6, r9, r6
        ldrsh   r9, [r11, #-8]
        adds    r8, r8, r6
        ldrsh   r6, [lr, #0x1E]
        mul     r7, r9, r7
        ldrsh   r9, [r0, #8]
        adds    r8, r8, r7
        ldrsh   r7, [r1, #0x1E]
        mul     r6, r9, r6
        ldrsh   r9, [r11, #-0xA]
        adds    r8, r8, r6
        ldrsh   r6, [lr, #0x24]
        mul     r7, r9, r7
        ldrsh   r9, [r0, #0xA]
        adds    r8, r8, r7
        ldrsh   r7, [r1, #0x24]
        mul     r6, r9, r6
        ldrsh   r9, [r11, #-0xC]
        adds    r8, r8, r6
        ldrsh   r6, [lr, #0x2A]
        mul     r7, r9, r7
        ldrsh   r9, [r0, #0xC]
        adds    r8, r8, r7
        ldrsh   r7, [r1, #0x2A]
        mul     r6, r9, r6
        ldrsh   r9, [r11, #-0xE]
        mul     r7, r9, r7
        ldrsh   r9, [r0, #0xE]
        adds    r8, r8, r6
        ldrsh   r6, [lr, #0x30]
        adds    r7, r8, r7
        ldrsh   r8, [r1, #0x30]
        mul     r10, r9, r6
        ldrsh   r9, [r11, #-0x10]
        ldrsh   r6, [r11, #-0x12]
        ldrsh   r11, [lr, #0x3C]
        adds    r7, r7, r10
        mul     r10, r9, r8
        ldrsh   r8, [lr, #0x36]
        ldrsh   r9, [r0, #0x10]
        adds    r7, r7, r10
        ldrsh   r10, [r1, #0x36]
        mul     r8, r9, r8
        ldrsh   r9, [r0, #0x12]
        mul     r10, r6, r10
        adds    r8, r7, r8
        mul     r11, r9, r11
        adds    r10, r8, r10
        adds    r11, r10, r11
        mov     r7, r11, lsl #1
        b       LDQU6
LDQU4:
        mov     r9, r5
        str     r1, [sp, #4]
        str     r0, [sp, #8]
        str     r1, [sp, #0xC]
        str     r12, [sp, #0x10]
        str     r0, [sp, #0x1C]
        ldr     r0, [sp, #4]
        ldr     r12, [sp, #8]
        ldr     r1, [sp]
        mov     r10, #0
        mov     r7, r10
        mov     r6, r7
        mov     r8, #0xA
        str     r5, [sp, #0x14]
        str     lr, [sp, #0x18]
LDQU5:
        ldrsh   lr, [r0], #6
        sub     r5, r11, r10
        ldrsh   r5, [r5]
        mov     r5, r5, lsl #1
        mul     lr, r5, lr
        adds    r7, r7, lr
        adc     r6, r6, lr, asr #31
        cmp     r7, #2, 2
        sbcs    lr, r6, r1
        movlt   r7, #2, 2
        mvnlt   r6, #0
        ldrsh   r5, [r12], #2
        ldrsh   lr, [r9], #6
        mov     r5, r5, lsl #1
        mul     lr, r5, lr
        add     r10, r10, #2
        adds    r7, lr, r7
        adc     r6, r6, lr, asr #31
        subs    r8, r8, #1
        bne     LDQU5
        ldr     r1, [sp, #0xC]
        ldr     r12, [sp, #0x10]
        ldr     r5, [sp, #0x14]
        ldr     lr, [sp, #0x18]
        ldr     r0, [sp, #0x1C]
LDQU6:
        adds    r7, r7, #2, 18
        subs    r4, r4, #1
        mov     r7, r7, lsr #16
        strh    r7, [r3], #2
        bne     LDQU2
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LDQU7:
        mvn     r0, #7
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
        .long   inter_3l


