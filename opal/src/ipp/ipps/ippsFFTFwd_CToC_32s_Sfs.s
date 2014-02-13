        .text
        .align  4
        .globl  _ippsFFTFwd_CToC_32s_Sfs


_ippsFFTFwd_CToC_32s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x24
        ldr     r8, [sp, #0x48]
        ldr     r12, [sp, #0x4C]
        ldr     r9, [sp, #0x50]
        cmp     r8, #0
        mov     r10, r0
        str     r12, [sp, #4]
        mov     r11, r1
        mov     r6, r2
        mov     r7, r3
        beq     LCBT6
        ldr     lr, [r8]
        ldr     r12, [pc, #0x1C8]
        cmp     r12, lr
        beq     LCBT0
        mvn     r0, #0x10
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LCBT0:
        cmp     r10, #0
        beq     LCBT6
        cmp     r11, #0
        beq     LCBT6
        cmp     r6, #0
        beq     LCBT6
        cmp     r7, #0
        beq     LCBT6
        ldr     lr, [r8, #4]
        mov     r12, #1
        cmp     lr, #0
        str     lr, [sp]
        mov     lr, r12, lsl lr
        str     lr, [sp, #8]
        beq     LCBT3
        cmp     r9, #0
        beq     LCBT5
        and     r12, r9, #0x1F
        rsb     r12, r12, #0
        and     r12, r12, #0x1F
        add     r4, r9, r12
LCBT1:
        ldr     r12, [sp, #8]
        mov     r1, r10
        ldr     r10, [sp]
        add     r5, r4, r12, lsl #4
        mov     r2, r11
        mov     r0, r5
        mov     r3, r10
        bl      _ipps_vbFftMerge_32s
        rsb     r11, r10, #0x1F
        ldr     r12, [sp, #8]
        mov     r3, r11
        mov     r1, r4
        mov     r10, r12, lsl #1
        mov     r2, r10
        mov     r0, r5
        bl      _ipps_cnvrt_32s64s
        ldr     r1, [sp, #8]
        ldr     r3, [r8, #0x24]
        mov     r2, #1
        mov     r0, r4
        bl      _ipps_jFft_Core_32s
        ldr     r12, [r8, #0x1C]
        cmp     r12, #0
        beq     LCBT2
        mov     r1, r10
        mov     r0, r4
        bl      _ipps_ibMpyBySqrt2_64s
LCBT2:
        ldr     lr, [sp, #4]
        ldr     r12, [r8, #0x14]
        mov     r2, r10
        mov     r1, r5
        mov     r0, r4
        add     lr, r12, lr
        add     r3, lr, r11
        bl      _ipps_cnvrt_64s32s
        ldr     r1, [sp, #8]
        ldr     r2, [r8, #0x20]
        mov     r0, r5
        bl      _ipps_BitRev1_8
        ldr     r3, [sp]
        mov     r2, r7
        mov     r1, r6
        mov     r0, r5
        bl      _ipps_vbFftSplit_32s
        cmp     r9, #0
        beq     LCBT4
        mov     r0, #0
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LCBT3:
        ldr     r10, [r10]
        ldr     r11, [r11]
        add     lr, sp, #0xC
        add     r12, sp, #0xC
        str     r10, [lr]
        str     r11, [r12, #8]
        mov     r10, r10, asr #31
        mov     r11, r11, asr #31
        str     r10, [lr, #4]
        str     r11, [r12, #0xC]
        ldr     r3, [sp, #4]
        add     r0, sp, #0xC
        add     r1, sp, #0x1C
        mov     r2, #2
        bl      _ipps_cnvrt_64s32s
        add     r0, sp, #0x1C
        ldr     lr, [r0]
        add     r12, sp, #0x1C
        ldr     r12, [r12, #4]
        str     lr, [r6]
        mov     r0, #0
        str     r12, [r7]
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LCBT4:
        mov     r0, r4
        bl      _ippsFree
        mov     r0, #0
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LCBT5:
        ldr     r0, [r8, #0xC]
        bl      _ippsMalloc_8u
        mov     r4, r0
        cmp     r4, #0
        bne     LCBT1
        mvn     r0, #8
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LCBT6:
        mvn     r0, #7
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
        .long   0x434d414d


