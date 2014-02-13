        .text
        .align  4
        .globl  _ippsFFTInv_CCSToR_32s16s_Sfs


_ippsFFTInv_CCSToR_32s16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        ldr     r11, [sp, #0x30]
        mov     r10, r2
        cmp     r10, #0
        mov     r7, r0
        mov     r5, r1
        mov     r8, r3
        beq     LCAT7
        ldr     lr, [r10]
        ldr     r12, [pc, #0x1B0]
        cmp     r12, lr
        beq     LCAT0
        mvn     r0, #0x10
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LCAT0:
        cmp     r7, #0
        beq     LCAT7
        cmp     r5, #0
        beq     LCAT7
        ldr     lr, [r10, #4]
        mov     r12, #1
        cmp     lr, #0
        str     lr, [sp]
        mov     r6, r12, lsl lr
        beq     LCAT4
        cmp     r11, #0
        beq     LCAT6
        and     r12, r11, #0x1F
        rsb     r12, r12, #0
        and     r12, r12, #0x1F
        add     r4, r11, r12
LCAT1:
        ldr     r12, [sp]
        mov     lr, #1
        add     r2, r6, #1
        rsb     r9, r12, #0x20
        sub     r12, r12, #1
        mov     r12, lr, lsl r12
        str     r12, [sp]
        mov     r0, r7
        mov     r3, r9
        mov     r1, r4
        bl      _ipps_cnvrt_32s64s
        ldr     r7, [r4]
        ldr     lr, [r4, +r6, lsl #3]
        add     r12, r4, r6, lsl #3
        ldr     r12, [r12, #4]
        ldr     r0, [r4, #4]
        adds    r1, lr, r7
        str     r1, [r4]
        adc     r1, r12, r0
        subs    r7, r7, lr
        sbc     r0, r0, r12
        str     r1, [r4, #4]
        str     r7, [r4, #8]
        str     r0, [r4, #0xC]
        ldr     r12, [sp]
        cmp     r12, #1
        ble     LCAT2
        ldr     r1, [sp]
        ldr     r3, [r10, #0x28]
        mvn     r2, #0
        mov     r0, r4
        bl      _ipps_jCcsRecombine_32s
        ldr     r1, [sp]
        ldr     r3, [r10, #0x24]
        mov     r2, #1
        mov     r0, r4
        bl      _ipps_jFft_Core_32s
        ldr     r1, [sp]
        ldr     r2, [r10, #0x20]
        mov     r0, r4
        bl      _ipps_BitRev1_16
LCAT2:
        ldr     r12, [r10, #0x1C]
        cmp     r12, #0
        beq     LCAT3
        mov     r1, r6
        mov     r0, r4
        bl      _ipps_ibMpyBySqrt2_64s
LCAT3:
        ldr     r10, [r10, #0x18]
        mov     r2, r6
        mov     r1, r5
        add     r8, r10, r8
        add     r3, r8, r9
        mov     r0, r4
        bl      _ipps_cnvrt_64s16s
        cmp     r11, #0
        beq     LCAT5
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LCAT4:
        ldr     r7, [r7]
        add     r12, sp, #4
        add     r0, sp, #4
        mov     r2, r7, asr #31
        str     r2, [r12, #4]
        str     r7, [r12]
        mov     r3, r8
        mov     r1, r5
        mov     r2, #1
        bl      _ipps_cnvrt_64s16s
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LCAT5:
        mov     r0, r4
        bl      _ippsFree
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LCAT6:
        ldr     r0, [r10, #0xC]
        bl      _ippsMalloc_8u
        mov     r4, r0
        cmp     r4, #0
        bne     LCAT1
        mvn     r0, #8
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LCAT7:
        mvn     r0, #7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
        .long   0x434d414f


