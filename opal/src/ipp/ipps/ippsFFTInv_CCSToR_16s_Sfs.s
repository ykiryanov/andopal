        .text
        .align  4
        .globl  _ippsFFTInv_CCSToR_16s_Sfs


_ippsFFTInv_CCSToR_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        ldr     r10, [sp, #0x2C]
        mov     r9, r2
        cmp     r9, #0
        mov     r8, r0
        mov     r5, r1
        mov     r7, r3
        beq     LCCR7
        ldr     r12, [r9]
        cmp     r12, #3
        beq     LCCR0
        mvn     r0, #0x10
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCCR0:
        cmp     r8, #0
        beq     LCCR7
        cmp     r5, #0
        beq     LCCR7
        ldr     r11, [r9, #4]
        mov     r12, #1
        cmp     r11, #0
        mov     r6, r12, lsl r11
        beq     LCCR4
        cmp     r10, #0
        beq     LCCR6
        and     r12, r10, #0x1F
        rsb     r12, r12, #0
        and     r12, r12, #0x1F
        add     r4, r10, r12
LCCR1:
        mov     r12, #0xF
        cmp     r11, #0xF
        movlt   r12, r11
        rsb     r12, r12, #0xF
        add     r3, r12, #1
        str     r3, [sp]
        add     r2, r6, #1
        sub     r11, r11, #1
        mov     r12, #1
        mov     r0, r8
        mov     r1, r4
        mov     r11, r12, lsl r11
        bl      _ipps_cnvrt_16s32s
        ldr     r8, [r4]
        ldr     lr, [r4, +r6, lsl #2]
        cmp     r11, #1
        add     r12, lr, r8
        str     r12, [r4]
        sub     r8, r8, lr
        str     r8, [r4, #4]
        ble     LCCR2
        ldr     r3, [r9, #0x28]
        mvn     r2, #0
        mov     r1, r11
        mov     r0, r4
        bl      _ipps_jCcsRecombine_16s
        ldr     r3, [r9, #0x24]
        mov     r2, #1
        mov     r1, r11
        mov     r0, r4
        bl      _ipps_jFft_Core_16s
LCCR2:
        ldr     r12, [r9, #0x10]
        cmp     r12, #0
        beq     LCCR3
        mov     r1, r6
        mov     r0, r4
        bl      _ipps_ibMpyBySqrt2_32s
LCCR3:
        ldr     r2, [r9, #0x20]
        ldr     r9, [r9, #0xC]
        mov     r1, r11
        mov     r0, r4
        bl      _ipps_BitRev1_8
        ldr     r3, [sp]
        add     r7, r9, r7
        add     r3, r7, r3
        mov     r2, r6
        mov     r1, r5
        mov     r0, r4
        bl      _ipps_cnvrt_32s16s
        cmp     r10, #0
        beq     LCCR5
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCCR4:
        ldrsh   r8, [r8]
        add     r2, sp, #4
        add     r0, sp, #4
        str     r8, [r2]
        mov     r3, r7
        mov     r1, r5
        mov     r2, #1
        bl      _ipps_cnvrt_32s16s
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCCR5:
        mov     r0, r4
        bl      _ippsFree
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCCR6:
        ldr     r0, [r9, #0x18]
        bl      _ippsMalloc_8u
        mov     r4, r0
        cmp     r4, #0
        bne     LCCR1
        mvn     r0, #8
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCCR7:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}


