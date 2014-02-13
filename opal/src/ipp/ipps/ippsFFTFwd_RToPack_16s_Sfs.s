        .text
        .align  4
        .globl  _ippsFFTFwd_RToPack_16s_Sfs


_ippsFFTFwd_RToPack_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        ldr     r9, [sp, #0x30]
        mov     r8, r2
        cmp     r8, #0
        mov     r10, r0
        mov     r6, r1
        mov     r7, r3
        beq     LCDH12
        ldr     r12, [r8]
        cmp     r12, #3
        beq     LCDH0
        mvn     r0, #0x10
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LCDH0:
        cmp     r10, #0
        beq     LCDH12
        cmp     r6, #0
        beq     LCDH12
        ldr     r11, [r8, #4]
        mov     r12, #1
        str     r12, [sp]
        cmp     r11, #0
        mov     r5, r12, lsl r11
        beq     LCDH9
        cmp     r9, #0
        beq     LCDH11
        and     r12, r9, #0x1F
        rsb     r12, r12, #0
        and     r12, r12, #0x1F
        add     r4, r9, r12
LCDH1:
        mov     r12, #0xF
        cmp     r11, #0xF
        movlt   r12, r11
        rsb     r12, r12, #0xF
        add     r3, r12, #1
        ldr     r12, [sp]
        str     r3, [sp, #4]
        mov     r0, r10
        sub     r11, r11, #1
        mov     r2, r5
        mov     r1, r4
        mov     r10, r12, lsl r11
        bl      _ipps_cnvrt_16s32s
        cmp     r10, #1
        ble     LCDH2
        ldr     r3, [r8, #0x24]
        mov     r2, #1
        mov     r1, r10
        mov     r0, r4
        bl      _ipps_jFft_Core_16s
        ldr     r2, [r8, #0x20]
        mov     r1, r10
        mov     r0, r4
        bl      _ipps_BitRev1_8
        ldr     r3, [r8, #0x28]
        mov     r1, r10
        mov     r2, #1
        mov     r0, r4
        bl      _ipps_jRealRecombine_16s
LCDH2:
        ldr     r10, [r4]
        ldr     lr, [r4, #4]
        add     r12, lr, r10
        str     r12, [r4]
        sub     r10, r10, lr
        str     r10, [r4, #4]
        ldr     r12, [r8, #0x10]
        cmp     r12, #0
        beq     LCDH3
        mov     r1, r5
        mov     r0, r4
        bl      _ipps_ibMpyBySqrt2_32s
LCDH3:
        ldr     r8, [r8, #8]
        ldr     r3, [sp, #4]
        mov     r2, r5
        add     r7, r8, r7
        mov     r1, r6
        add     r3, r7, r3
        mov     r0, r4
        bl      _ipps_cnvrt_32s16s
        cmp     r5, #2
        ble     LCDH8
        ldrsh   lr, [r6, #2]
        sub     r12, r5, #3
        cmp     r12, #1
        blt     LCDH7
        sub     r3, r5, #1
        sub     r3, r3, #3
        cmp     r3, #0xA
        addlt   r3, r6, #4
        blt     LCDH5
        ldr     r0, [sp]
        add     r3, r6, #4
        sub     r11, r5, #0xD
        mov     r10, r3
        add     r8, r6, #2
        add     r7, r6, #6
LCDH4:
        ldrsh   r1, [r10]
        add     r0, r0, #8
        cmp     r0, r11
        strh    r1, [r8]
        ldrsh   r1, [r7]
        strh    r1, [r10]
        ldrsh   r1, [r10, #4]
        strh    r1, [r8, #4]
        ldrsh   r1, [r7, #4]
        ldrsh   r2, [r10, #8]
        strh    r1, [r10, #4]
        strh    r2, [r8, #8]
        ldrsh   r1, [r7, #8]
        ldrsh   r2, [r10, #0xC]
        strh    r1, [r10, #8]
        strh    r2, [r8, #0xC]
        ldrsh   r1, [r7, #0xC]
        add     r8, r8, #0x10
        add     r7, r7, #0x10
        strh    r1, [r10, #0xC]
        add     r10, r10, #0x10
        ble     LCDH4
        str     r0, [sp]
LCDH5:
        ldr     r10, [sp]
        ldr     r11, [sp]
        mov     r8, #2
        add     r7, r6, r10, lsl #1
        add     r8, r8, r7
        mov     r10, r10, lsl #1
LCDH6:
        ldrsh   r0, [r8]
        add     r11, r11, #2
        cmp     r11, r12
        strh    r0, [r7], #4
        ldrsh   r0, [r3, +r10]
        add     r10, r10, #4
        strh    r0, [r8], #4
        ble     LCDH6
LCDH7:
        sub     r6, r6, #2
        mov     r5, r5, lsl #1
        strh    lr, [r6, +r5]
LCDH8:
        cmp     r9, #0
        beq     LCDH10
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LCDH9:
        ldrsh   r10, [r10]
        add     r2, sp, #8
        add     r0, sp, #8
        str     r10, [r2]
        mov     r3, r7
        mov     r1, r6
        mov     r2, #1
        bl      _ipps_cnvrt_32s16s
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LCDH10:
        mov     r0, r4
        bl      _ippsFree
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LCDH11:
        ldr     r0, [r8, #0x18]
        bl      _ippsMalloc_8u
        mov     r4, r0
        cmp     r4, #0
        bne     LCDH1
        mvn     r0, #8
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LCDH12:
        mvn     r0, #7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}


