        .text
        .align  4
        .globl  _ippsFFTFwd_CToC_16sc_Sfs


_ippsFFTFwd_CToC_16sc_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        ldr     r10, [sp, #0x30]
        mov     r9, r2
        cmp     r9, #0
        mov     r8, r0
        mov     r5, r1
        mov     r7, r3
        beq     LCDL6
        ldr     r12, [r9]
        cmp     r12, #1
        beq     LCDL0
        mvn     r0, #0x10
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LCDL0:
        cmp     r8, #0
        beq     LCDL6
        cmp     r5, #0
        beq     LCDL6
        ldr     r11, [r9, #4]
        mov     r12, #1
        cmp     r11, #0
        mov     r6, r12, lsl r11
        beq     LCDL3
        cmp     r10, #0
        beq     LCDL5
        and     r12, r10, #0x1F
        rsb     r12, r12, #0
        and     r12, r12, #0x1F
        add     r4, r10, r12
LCDL1:
        mov     r12, #0xF
        cmp     r11, #0xF
        movlt   r12, r11
        rsb     r3, r12, #0xF
        str     r3, [sp]
        mov     r11, r6, lsl #1
        mov     r0, r8
        mov     r2, r11
        mov     r1, r4
        bl      _ipps_cnvrt_16s32s
        ldr     r3, [r9, #0x24]
        mov     r2, #1
        mov     r1, r6
        mov     r0, r4
        bl      _ipps_jFft_Core_16s
        ldr     r12, [r9, #0x10]
        cmp     r12, #0
        beq     LCDL2
        mov     r1, r11
        mov     r0, r4
        bl      _ipps_ibMpyBySqrt2_32s
LCDL2:
        ldr     r2, [r9, #0x20]
        ldr     r9, [r9, #8]
        mov     r1, r6
        mov     r0, r4
        bl      _ipps_BitRev1_8
        ldr     r3, [sp]
        add     r7, r9, r7
        add     r3, r7, r3
        mov     r2, r11
        mov     r1, r5
        mov     r0, r4
        bl      _ipps_cnvrt_32s16s
        cmp     r10, #0
        beq     LCDL4
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LCDL3:
        ldrsh   r2, [r8]
        ldrsh   r8, [r8, #2]
        add     r12, sp, #4
        add     r0, sp, #4
        str     r2, [r12]
        add     lr, sp, #4
        str     r8, [lr, #4]
        mov     r3, r7
        mov     r1, r5
        mov     r2, #2
        bl      _ipps_cnvrt_32s16s
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LCDL4:
        mov     r0, r4
        bl      _ippsFree
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LCDL5:
        ldr     r0, [r9, #0x18]
        bl      _ippsMalloc_8u
        mov     r4, r0
        cmp     r4, #0
        bne     LCDL1
        mvn     r0, #8
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LCDL6:
        mvn     r0, #7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}


