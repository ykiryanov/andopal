        .text
        .align  4
        .globl  _ippsFFTInv_CCSToR_32s_Sfs


_ippsFFTInv_CCSToR_32s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        ldr     r10, [sp, #0x30]
        mov     r9, r2
        cmp     r9, #0
        mov     r8, r0
        mov     r5, r1
        mov     r7, r3
        beq     LCAR7
        ldr     lr, [r9]
        ldr     r12, [pc, #0x1A4]
        cmp     r12, lr
        beq     LCAR0
        mvn     r0, #0x10
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LCAR0:
        cmp     r8, #0
        beq     LCAR7
        cmp     r5, #0
        beq     LCAR7
        ldr     r11, [r9, #4]
        mov     r12, #1
        cmp     r11, #0
        mov     r6, r12, lsl r11
        beq     LCAR4
        cmp     r10, #0
        beq     LCAR6
        and     r12, r10, #0x1F
        rsb     r12, r12, #0
        and     r12, r12, #0x1F
        add     r4, r10, r12
LCAR1:
        rsb     r3, r11, #0x20
        str     r3, [sp]
        add     r2, r6, #1
        sub     r11, r11, #1
        mov     r12, #1
        mov     r0, r8
        mov     r1, r4
        mov     r11, r12, lsl r11
        bl      _ipps_cnvrt_32s64s
        ldr     r8, [r4]
        ldr     lr, [r4, +r6, lsl #3]
        add     r12, r4, r6, lsl #3
        ldr     r12, [r12, #4]
        ldr     r0, [r4, #4]
        adds    r1, lr, r8
        str     r1, [r4]
        adc     r1, r12, r0
        subs    r8, r8, lr
        sbc     r0, r0, r12
        cmp     r11, #1
        str     r1, [r4, #4]
        str     r8, [r4, #8]
        str     r0, [r4, #0xC]
        ble     LCAR2
        ldr     r3, [r9, #0x28]
        mvn     r2, #0
        mov     r1, r11
        mov     r0, r4
        bl      _ipps_jCcsRecombine_32s
        ldr     r3, [r9, #0x24]
        mov     r2, #1
        mov     r1, r11
        mov     r0, r4
        bl      _ipps_jFft_Core_32s
LCAR2:
        ldr     r12, [r9, #0x1C]
        cmp     r12, #0
        beq     LCAR3
        mov     r1, r6
        mov     r0, r4
        bl      _ipps_ibMpyBySqrt2_64s
LCAR3:
        ldr     r12, [r9, #0x18]
        ldr     r3, [sp]
        mov     r2, r6
        add     r7, r12, r7
        mov     r1, r5
        add     r3, r7, r3
        mov     r0, r4
        bl      _ipps_cnvrt_64s32s
        ldr     r2, [r9, #0x20]
        mov     r1, r11
        mov     r0, r5
        bl      _ipps_BitRev1_8
        cmp     r10, #0
        beq     LCAR5
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LCAR4:
        ldr     r8, [r8]
        add     r12, sp, #4
        add     r0, sp, #4
        mov     r2, r8, asr #31
        str     r2, [r12, #4]
        str     r8, [r12]
        mov     r3, r7
        mov     r1, r5
        mov     r2, #1
        bl      _ipps_cnvrt_64s32s
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LCAR5:
        mov     r0, r4
        bl      _ippsFree
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LCAR6:
        ldr     r0, [r9, #0xC]
        bl      _ippsMalloc_8u
        mov     r4, r0
        cmp     r4, #0
        bne     LCAR1
        mvn     r0, #8
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LCAR7:
        mvn     r0, #7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
        .long   0x434d414e


