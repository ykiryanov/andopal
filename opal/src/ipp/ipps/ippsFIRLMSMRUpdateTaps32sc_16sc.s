        .text
        .align  4
        .globl  _ippsFIRLMSMRUpdateTaps32sc_16sc


_ippsFIRLMSMRUpdateTaps32sc_16sc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        str     r0, [sp, #0x10]
        cmp     r2, #0
        str     r1, [sp, #0x14]
        beq     LBVW12
        ldr     r1, [r2]
        ldr     r0, [pc, #0x1D0]
        cmp     r0, r1
        bne     LBVW9
        ldr     r1, [r2, #0x20]
        ldr     r0, [sp, #0x14]
        ldr     r3, [sp, #0x10]
        ldr     lr, [r2, #0x10]
        ldr     r6, [r2, #0x1C]
        mul     r12, r0, r1
        mul     r3, r3, r1
        ldr     r5, [r2, #0x24]
        ldr     r4, [r2, #0xC]
        ldr     r0, [r2, #4]
        ldr     r1, [r2, #8]
        add     r6, r6, lr
        cmp     r5, #0
        sub     r2, r6, #1
        mov     r7, #0
        ble     LBVW5
        cmp     r3, #2, 2
        mvn     r9, #2, 2
        moveq   r6, r9
        beq     LBVW0
        cmp     r3, #0
        rsblt   r6, r3, #0
        movge   r6, r3
LBVW0:
        cmp     r12, #2, 2
        beq     LBVW1
        cmp     r12, #0
        rsblt   r9, r12, #0
        movge   r9, r12
LBVW1:
        mov     r8, #1
LBVW2:
        mov     r6, r6, asr #1
        cmp     r6, r8, lsl r5
        mov     r9, r9, asr #1
        bgt     LBVW3
        cmp     r9, r8, lsl r5
        ble     LBVW4
LBVW3:
        add     r7, r7, #1
        cmp     r7, #0xF
        blt     LBVW2
LBVW4:
        mov     r3, r3, asr r7
        mov     r12, r12, asr r7
        rsb     r7, r7, #0xF
        b       LBVW6
LBVW5:
        add     r3, r3, #1, 18
        add     r12, r12, #1, 18
        mov     r3, r3, asr #15
        mov     r12, r12, asr #15
LBVW6:
        cmp     r7, #0
        mov     r6, #0
        ble     LBVW10
        cmp     r4, #0
        ble     LBVW8
        sub     r0, r0, #4
        rsb     r5, r3, #0
        str     r3, [sp, #4]
        str     lr, [sp, #8]
        str     r4, [sp]
LBVW7:
        ldr     r3, [sp, #8]
        mov     r8, r2, lsl #2
        ldr     lr, [r0, #4]
        add     r2, r3, r2
        ldr     r3, [sp]
        add     r4, r1, r8
        ldrsh   r9, [r4, #2]
        ldr     r11, [sp, #4]
        add     r6, r6, #1
        cmp     r6, r3
        mul     r10, r12, r9
        ldrsh   r3, [r1, +r8]
        ldr     r9, [r0, #8]
        mla     r10, r11, r3, r10
        add     r10, lr, r10, asr r7
        str     r10, [r0, #4]
        ldrsh   r4, [r4, #2]
        ldrsh   r8, [r1, +r8]
        mul     r4, r5, r4
        mla     r4, r12, r8, r4
        add     r4, r9, r4, asr r7
        str     r4, [r0, #8]!
        blt     LBVW7
LBVW8:
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LBVW9:
        mvn     r0, #0x10
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LBVW10:
        cmp     r4, #0
        ble     LBVW8
        sub     r0, r0, #4
        rsb     r8, r3, #0
LBVW11:
        mov     r7, r2, lsl #2
        add     r5, r1, r7
        ldrsh   r9, [r5, #2]
        ldrsh   r10, [r1, +r7]
        add     r2, lr, r2
        mul     r9, r12, r9
        add     r6, r6, #1
        cmp     r6, r4
        mla     r9, r3, r10, r9
        ldr     r10, [r0, #4]
        add     r10, r9, r10
        str     r10, [r0, #4]
        ldrsh   r9, [r5, #2]
        ldrsh   r7, [r1, +r7]
        ldr     r5, [r0, #8]
        mul     r9, r8, r9
        mla     r9, r12, r7, r9
        add     r5, r9, r5
        str     r5, [r0, #8]!
        blt     LBVW11
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LBVW12:
        mvn     r0, #7
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
        .long   0x4c4d5343


