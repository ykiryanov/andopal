        .text
        .align  4
        .globl  _ippsFFTFwd_RToCCS_16s32s_Sfs


_ippsFFTFwd_RToCCS_16s32s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        ldr     r9, [sp, #0x30]
        mov     r8, r2
        cmp     r8, #0
        mov     r10, r0
        mov     r6, r1
        mov     r7, r3
        beq     LCBQ7
        ldr     lr, [r8]
        ldr     r12, [pc, #0x1C0]
        cmp     r12, lr
        beq     LCBQ0
        mvn     r0, #0x10
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LCBQ0:
        cmp     r10, #0
        beq     LCBQ7
        cmp     r6, #0
        beq     LCBQ7
        ldr     r11, [r8, #4]
        mov     r12, #1
        cmp     r11, #0
        mov     r5, r12, lsl r11
        beq     LCBQ4
        cmp     r9, #0
        beq     LCBQ6
        and     r12, r9, #0x1F
        rsb     r12, r12, #0
        and     r12, r12, #0x1F
        add     r4, r9, r12
LCBQ1:
        rsb     r3, r11, #0x20
        str     r3, [sp]
        mov     r0, r10
        mov     r12, #1
        sub     r11, r11, #1
        mov     r2, r5
        mov     r1, r4
        mov     r10, r12, lsl r11
        bl      _ipps_cnvrt_16s64s
        cmp     r10, #1
        ble     LCBQ2
        ldr     r3, [r8, #0x24]
        mov     r2, #1
        mov     r1, r10
        mov     r0, r4
        bl      _ipps_jFft_Core_32s
        ldr     r2, [r8, #0x20]
        mov     r1, r10
        mov     r0, r4
        bl      _ipps_BitRev1_16
        ldr     r3, [r8, #0x28]
        mov     r1, r10
        mov     r2, #1
        mov     r0, r4
        bl      _ipps_jRealRecombine_32s
LCBQ2:
        ldr     r0, [r4]
        ldr     r11, [r4, #8]
        ldr     r12, [r4, #0xC]
        ldr     lr, [r4, #4]
        adds    r10, r11, r0
        str     r10, [r4]
        adc     r10, r12, lr
        subs    r0, r0, r11
        sbc     lr, lr, r12
        str     r10, [r4, #4]
        str     r0, [r4, #8]
        str     lr, [r4, #0xC]
        ldr     r12, [r8, #0x1C]
        cmp     r12, #0
        beq     LCBQ3
        mov     r1, r5
        mov     r0, r4
        bl      _ipps_ibMpyBySqrt2_64s
LCBQ3:
        ldr     r8, [r8, #0x14]
        ldr     r3, [sp]
        mov     r2, r5
        add     r7, r8, r7
        mov     r1, r6
        add     r3, r7, r3
        mov     r0, r4
        bl      _ipps_cnvrt_64s32s
        ldr     r3, [r6, #4]
        cmp     r9, #0
        add     r12, r6, #4
        str     r3, [r6, +r5, lsl #2]
        mov     r3, #0
        str     r3, [r12, +r5, lsl #2]
        str     r3, [r6, #4]
        beq     LCBQ5
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LCBQ4:
        ldrsh   r10, [r10]
        add     r12, sp, #4
        add     r0, sp, #4
        mov     r2, r10, asr #31
        str     r2, [r12, #4]
        str     r10, [r12]
        mov     r3, r7
        mov     r2, #1
        mov     r1, r6
        bl      _ipps_cnvrt_64s32s
        mov     r0, #0
        str     r0, [r6, #4]
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LCBQ5:
        mov     r0, r4
        bl      _ippsFree
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LCBQ6:
        ldr     r0, [r8, #0xC]
        bl      _ippsMalloc_8u
        mov     r4, r0
        cmp     r4, #0
        bne     LCBQ1
        mvn     r0, #8
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LCBQ7:
        mvn     r0, #7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
        .long   0x434d414f


