        .text
        .align  4
        .globl  _ippsFIRLMSMRInitAlloc32sc_16sc


_ippsFIRLMSMRInitAlloc32sc_16sc:
        stmdb   sp!, {r1, r4 - r11, lr}
        ldr     r12, [sp, #0x34]
        ldr     r11, [sp, #0x28]
        ldr     r10, [sp, #0x2C]
        ldr     r5, [sp, #0x30]
        mov     r9, r0
        cmp     r9, #0
        str     r12, [sp]
        mov     r8, r1
        mov     r7, r2
        mov     r4, r3
        beq     LBWK9
        cmp     r7, #0
        ble     LBWK0
        cmp     r10, #0
        ble     LBWK0
        mla     r6, r7, r10, r5
        cmp     r11, #0
        blt     LBWK0
        cmp     r11, r6
        blt     LBWK1
LBWK0:
        mvn     r0, #5
        ldmia   sp!, {r1, r4 - r11, pc}
LBWK1:
        mov     r0, #0x28
        bl      _ippsMalloc_8u
        cmp     r0, #0
        str     r0, [r9]
        beq     LBWK6
        str     r6, [r0, #0x14]
        ldr     r12, [r9]
        mov     r0, r7
        str     r10, [r12, #0x10]
        ldr     r12, [r9]
        str     r5, [r12, #0x18]
        ldr     lr, [r9]
        ldr     r12, [pc, #0x19C]
        str     r7, [lr, #0xC]
        ldr     lr, [r9]
        str     r11, [lr, #0x1C]
        ldr     lr, [sp]
        ldr     r5, [r9]
        mov     r11, #0
        str     lr, [r5, #0x20]
        ldr     lr, [r9]
        mov     r5, r6, lsl #1
        str     r12, [lr]
        bl      _ippsMalloc_32sc
        ldr     r12, [r9]
        mov     r1, r0
        mov     r0, r5
        str     r1, [r12, #4]
        bl      _ippsMalloc_16sc
        ldr     r12, [r9]
        str     r0, [r12, #8]
        ldr     r12, [r9]
        str     r11, [r12, #0x24]
        ldr     r0, [r9]
        ldr     r2, [r0, #4]
        cmp     r2, #0
        beq     LBWK6
        ldr     r12, [r0, #8]
        cmp     r12, #0
        beq     LBWK6
        cmp     r8, #0
        beq     LBWK8
        cmp     r7, #5
        sublt   r12, r2, #8
        blt     LBWK3
        sub     r12, r2, #8
        sub     r10, r7, #5
        sub     lr, r8, #4
LBWK2:
        ldr     r1, [lr, #4]
        sub     r0, r7, r11
        add     r11, r11, #4
        str     r1, [r12, +r0, lsl #3]
        ldr     r1, [lr, #8]
        add     r2, r12, r0, lsl #3
        cmp     r11, r10
        str     r1, [r2, #4]
        ldr     r1, [lr, #0xC]
        mov     r0, r0, lsl #3
        sub     r2, r0, #8
        str     r1, [r12, +r2]
        ldr     r1, [lr, #0x10]
        add     r2, r12, r2
        str     r1, [r2, #4]
        ldr     r2, [lr, #0x14]
        sub     r1, r0, #0x10
        sub     r0, r0, #0x18
        str     r2, [r12, +r1]
        ldr     r2, [lr, #0x18]
        add     r1, r12, r1
        str     r2, [r1, #4]
        ldr     r1, [lr, #0x1C]
        str     r1, [r12, +r0]
        ldr     r1, [lr, #0x20]!
        add     r0, r12, r0
        str     r1, [r0, #4]
        ble     LBWK2
LBWK3:
        mov     lr, r11, lsl #3
        sub     lr, lr, #4
        add     r8, lr, r8
LBWK4:
        ldr     lr, [r8, #4]
        sub     r10, r7, r11
        add     r11, r11, #1
        str     lr, [r12, +r10, lsl #3]
        ldr     lr, [r8, #8]!
        add     r10, r12, r10, lsl #3
        cmp     r11, r7
        str     lr, [r10, #4]
        blt     LBWK4
LBWK5:
        ldr     r12, [r9]
        cmp     r4, #0
        ldr     r0, [r12, #8]
        beq     LBWK7
        mov     r1, r0
        mov     r2, r6
        mov     r0, r4
        bl      _ippsCopy_16sc
        ldr     r9, [r9]
        mov     r0, r4
        mov     r2, r6
        ldr     r9, [r9, #8]
        add     r1, r9, r6, lsl #2
        bl      _ippsCopy_16sc
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LBWK6:
        bl      _ippsFIRLMSMRFree32sc_16sc
        mvn     r0, #8
        ldmia   sp!, {r1, r4 - r11, pc}
LBWK7:
        mov     r1, r5
        bl      _ippsZero_16sc
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LBWK8:
        mov     r1, r7, lsl #3
        mov     r0, r2
        bl      _ippsZero_8u
        b       LBWK5
LBWK9:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r11, pc}
        .long   0x4c4d5343


