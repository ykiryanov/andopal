        .text
        .align  4
        .globl  _ippsFFTFwd_RToPack_32s_Sfs


_ippsFFTFwd_RToPack_32s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        ldr     r9, [sp, #0x34]
        mov     r8, r2
        cmp     r8, #0
        mov     r10, r0
        mov     r6, r1
        mov     r7, r3
        beq     LCBM12
        ldr     lr, [r8]
        ldr     r12, [pc, #0x27C]
        cmp     r12, lr
        beq     LCBM0
        mvn     r0, #0x10
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCBM0:
        cmp     r10, #0
        beq     LCBM12
        cmp     r6, #0
        beq     LCBM12
        ldr     r11, [r8, #4]
        mov     r12, #1
        str     r12, [sp]
        cmp     r11, #0
        mov     r5, r12, lsl r11
        beq     LCBM9
        cmp     r9, #0
        beq     LCBM11
        and     r12, r9, #0x1F
        rsb     r12, r12, #0
        and     r12, r12, #0x1F
        add     r4, r9, r12
LCBM1:
        ldr     r12, [sp]
        rsb     r3, r11, #0x20
        str     r3, [sp, #4]
        mov     r0, r10
        sub     r11, r11, #1
        mov     r2, r5
        mov     r1, r4
        mov     r10, r12, lsl r11
        bl      _ipps_cnvrt_32s64s
        cmp     r10, #1
        ble     LCBM2
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
LCBM2:
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
        beq     LCBM3
        mov     r1, r5
        mov     r0, r4
        bl      _ipps_ibMpyBySqrt2_64s
LCBM3:
        ldr     r8, [r8, #0x14]
        ldr     r3, [sp, #4]
        mov     r2, r5
        add     r7, r8, r7
        mov     r1, r6
        add     r3, r7, r3
        mov     r0, r4
        bl      _ipps_cnvrt_64s32s
        cmp     r5, #2
        ble     LCBM8
        ldr     r11, [r6, #4]
        sub     r10, r5, #3
        cmp     r10, #1
        blt     LCBM7
        sub     r3, r5, #1
        sub     r3, r3, #3
        cmp     r3, #0xA
        addlt   r8, r6, #8
        blt     LCBM5
        ldr     r0, [sp]
        add     r8, r6, #8
        sub     r7, r5, #0xD
        add     lr, r6, #0x10
        add     r12, r6, #0xC
        add     r3, r6, #0x14
LCBM4:
        ldr     r1, [lr, #-8]
        add     r0, r0, #8
        cmp     r0, r7
        str     r1, [r12, #-8]
        ldr     r1, [r3, #-8]
        str     r1, [lr, #-8]
        ldr     r1, [lr]
        str     r1, [r12]
        ldr     r1, [r3]
        ldr     r2, [lr, #8]
        str     r1, [lr]
        str     r2, [r12, #8]
        ldr     r1, [r3, #8]
        ldr     r2, [lr, #0x10]
        str     r1, [lr, #8]
        str     r2, [r12, #0x10]
        ldr     r1, [r3, #0x10]
        add     r12, r12, #0x20
        add     r3, r3, #0x20
        str     r1, [lr, #0x10]
        add     lr, lr, #0x20
        ble     LCBM4
        str     r0, [sp]
LCBM5:
        ldr     r3, [sp]
        ldr     lr, [sp]
        mov     r12, #4
        add     r3, r6, r3, lsl #2
        add     r12, r12, r3
LCBM6:
        ldr     r7, [r12]
        str     r7, [r3], #8
        ldr     r7, [r8, +lr, lsl #2]
        add     lr, lr, #2
        cmp     lr, r10
        str     r7, [r12], #8
        ble     LCBM6
LCBM7:
        sub     r6, r6, #4
        str     r11, [r6, +r5, lsl #2]
LCBM8:
        cmp     r9, #0
        beq     LCBM10
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCBM9:
        ldr     r10, [r10]
        add     r12, sp, #8
        add     r0, sp, #8
        mov     r2, r10, asr #31
        str     r2, [r12, #4]
        str     r10, [r12]
        mov     r3, r7
        mov     r1, r6
        mov     r2, #1
        bl      _ipps_cnvrt_64s32s
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCBM10:
        mov     r0, r4
        bl      _ippsFree
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCBM11:
        ldr     r0, [r8, #0xC]
        bl      _ippsMalloc_8u
        mov     r4, r0
        cmp     r4, #0
        bne     LCBM1
        mvn     r0, #8
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCBM12:
        mvn     r0, #7
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
        .long   0x434d414e


