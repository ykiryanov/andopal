        .text
        .align  4
        .globl  _ippsFFTFwd_CToC_32sc_Sfs


_ippsFFTFwd_CToC_32sc_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        ldr     r10, [sp, #0x38]
        mov     r9, r2
        cmp     r9, #0
        mov     r8, r0
        mov     r5, r1
        mov     r7, r3
        beq     LCBR6
        ldr     lr, [r9]
        ldr     r12, [pc, #0x160]
        cmp     r12, lr
        beq     LCBR0
        mvn     r0, #0x10
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCBR0:
        cmp     r8, #0
        beq     LCBR6
        cmp     r5, #0
        beq     LCBR6
        ldr     r11, [r9, #4]
        mov     r12, #1
        cmp     r11, #0
        mov     r6, r12, lsl r11
        beq     LCBR3
        cmp     r10, #0
        beq     LCBR5
        and     r12, r10, #0x1F
        rsb     r12, r12, #0
        and     r12, r12, #0x1F
        add     r4, r10, r12
LCBR1:
        rsb     r3, r11, #0x1F
        str     r3, [sp]
        mov     r11, r6, lsl #1
        mov     r0, r8
        mov     r2, r11
        mov     r1, r4
        bl      _ipps_cnvrt_32s64s
        ldr     r3, [r9, #0x24]
        mov     r2, #1
        mov     r1, r6
        mov     r0, r4
        bl      _ipps_jFft_Core_32s
        ldr     r12, [r9, #0x1C]
        cmp     r12, #0
        beq     LCBR2
        mov     r1, r11
        mov     r0, r4
        bl      _ipps_ibMpyBySqrt2_64s
LCBR2:
        ldr     r12, [r9, #0x14]
        ldr     r3, [sp]
        mov     r2, r11
        add     r7, r12, r7
        mov     r1, r5
        add     r3, r7, r3
        mov     r0, r4
        bl      _ipps_cnvrt_64s32s
        ldr     r2, [r9, #0x20]
        mov     r1, r6
        mov     r0, r5
        bl      _ipps_BitRev1_8
        cmp     r10, #0
        beq     LCBR4
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCBR3:
        ldr     r12, [r8]
        ldr     r8, [r8, #4]
        add     r2, sp, #4
        add     lr, sp, #4
        str     r12, [lr]
        str     r8, [r2, #8]
        add     r0, sp, #4
        mov     r12, r12, asr #31
        mov     r8, r8, asr #31
        str     r8, [r2, #0xC]
        str     r12, [lr, #4]
        mov     r3, r7
        mov     r1, r5
        mov     r2, #2
        bl      _ipps_cnvrt_64s32s
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCBR4:
        mov     r0, r4
        bl      _ippsFree
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCBR5:
        ldr     r0, [r9, #0xC]
        bl      _ippsMalloc_8u
        mov     r4, r0
        cmp     r4, #0
        bne     LCBR1
        mvn     r0, #8
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCBR6:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
        .long   0x434d414c


