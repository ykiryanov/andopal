        .text
        .align  4
        .globl  _ippsFIRLMSMRInitAlloc32s_16s


_ippsFIRLMSMRInitAlloc32s_16s:
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
        beq     LBWL9
        cmp     r7, #0
        ble     LBWL0
        cmp     r10, #0
        ble     LBWL0
        mla     r6, r7, r10, r5
        cmp     r11, #0
        blt     LBWL0
        cmp     r11, r6
        blt     LBWL1
LBWL0:
        mvn     r0, #5
        ldmia   sp!, {r1, r4 - r11, pc}
LBWL1:
        mov     r0, #0x28
        bl      _ippsMalloc_8u
        mov     r1, r0
        cmp     r1, #0
        str     r1, [r9]
        beq     LBWL6
        str     r6, [r1, #0x14]
        ldr     r12, [r9]
        mov     r0, r7
        str     r10, [r12, #0x10]
        ldr     r12, [r9]
        str     r5, [r12, #0x18]
        ldr     lr, [r9]
        ldr     r12, [pc, #0x16C]
        str     r7, [lr, #0xC]
        ldr     lr, [r9]
        str     r11, [lr, #0x1C]
        ldr     lr, [r9]
        ldr     r5, [sp]
        str     r5, [lr, #0x20]
        ldr     lr, [r9]
        mov     r5, r6, lsl #1
        str     r12, [lr]
        bl      _ippsMalloc_32s
        ldr     r12, [r9]
        mov     r1, r0
        mov     r0, r5
        str     r1, [r12, #4]
        bl      _ippsMalloc_16s
        ldr     r12, [r9]
        str     r0, [r12, #8]
        ldr     r12, [r9]
        mov     r0, #0
        str     r0, [r12, #0x24]
        ldr     r1, [r9]
        ldr     r2, [r1, #4]
        cmp     r2, #0
        beq     LBWL6
        ldr     r12, [r1, #8]
        cmp     r12, #0
        beq     LBWL6
        cmp     r8, #0
        beq     LBWL8
        cmp     r7, #6
        sublt   lr, r2, #4
        blt     LBWL3
        sub     lr, r2, #4
        sub     r11, r7, #6
        add     r10, r8, #4
LBWL2:
        ldr     r1, [r10, #-4]
        sub     r12, r7, r0
        add     r0, r0, #5
        str     r1, [lr, +r12, lsl #2]
        ldr     r1, [r10]
        mov     r12, r12, lsl #2
        sub     r2, r12, #4
        str     r1, [lr, +r2]
        ldr     r2, [r10, #4]
        sub     r1, r12, #8
        cmp     r0, r11
        str     r2, [lr, +r1]
        ldr     r2, [r10, #8]
        sub     r1, r12, #0xC
        sub     r12, r12, #0x10
        str     r2, [lr, +r1]
        ldr     r1, [r10, #0xC]
        add     r10, r10, #0x14
        str     r1, [lr, +r12]
        ble     LBWL2
LBWL3:
        add     r8, r8, r0, lsl #2
LBWL4:
        ldr     r12, [r8], #4
        sub     r10, r7, r0
        add     r0, r0, #1
        cmp     r0, r7
        str     r12, [lr, +r10, lsl #2]
        blt     LBWL4
LBWL5:
        ldr     r12, [r9]
        cmp     r4, #0
        ldr     r0, [r12, #8]
        beq     LBWL7
        mov     r1, r0
        mov     r2, r6
        mov     r0, r4
        bl      _ippsCopy_16s
        ldr     r9, [r9]
        mov     r2, r6
        mov     r0, r4
        ldr     r9, [r9, #8]
        add     r1, r5, r9
        bl      _ippsCopy_16s
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LBWL6:
        mov     r0, r1
        bl      _ippsFIRLMSMRFree32s_16s
        mvn     r0, #8
        ldmia   sp!, {r1, r4 - r11, pc}
LBWL7:
        mov     r1, r5
        bl      _ippsZero_16s
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LBWL8:
        mov     r1, r7, lsl #2
        mov     r0, r2
        bl      _ippsZero_8u
        b       LBWL5
LBWL9:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r11, pc}
        .long   0x4c4d5352


