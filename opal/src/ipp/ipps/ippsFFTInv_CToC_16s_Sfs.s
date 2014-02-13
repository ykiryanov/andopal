        .text
        .align  4
        .globl  _ippsFFTInv_CToC_16s_Sfs


_ippsFFTInv_CToC_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        ldr     r8, [sp, #0x3C]
        ldr     r12, [sp, #0x40]
        ldr     r9, [sp, #0x44]
        cmp     r8, #0
        mov     r10, r0
        str     r12, [sp, #8]
        mov     r11, r1
        mov     r6, r2
        mov     r7, r3
        beq     LCCP7
        ldr     r12, [r8]
        cmp     r12, #2
        beq     LCCP0
        mvn     r0, #0x10
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LCCP0:
        cmp     r10, #0
        beq     LCCP7
        cmp     r11, #0
        beq     LCCP7
        cmp     r6, #0
        beq     LCCP7
        cmp     r7, #0
        beq     LCCP7
        ldr     lr, [r8, #4]
        mov     r12, #1
        cmp     lr, #0
        str     lr, [sp, #4]
        mov     r5, r12, lsl lr
        beq     LCCP4
        cmp     r9, #0
        beq     LCCP6
        and     r12, r9, #0x1F
        rsb     r12, r12, #0
        and     r12, r12, #0x1F
        add     r4, r9, r12
LCCP1:
        ldr     r12, [sp, #4]
        cmp     r12, #0xF
        movge   r12, #0
        strge   r12, [sp]
        bge     LCCP2
        ldr     r12, [sp, #4]
        rsb     r12, r12, #0xF
        str     r12, [sp]
LCCP2:
        mov     r2, r11
        mov     r1, r10
        ldr     r3, [sp, #4]
        add     r10, r4, r5, lsl #3
        mov     r0, r10
        bl      _ipps_vbFftMerge_16s
        ldr     r3, [sp]
        mov     r11, r5, lsl #1
        mov     r2, r11
        mov     r1, r4
        mov     r0, r10
        bl      _ipps_cnvrt_16s32s
        ldr     r3, [r8, #0x24]
        mvn     r2, #0
        mov     r1, r5
        mov     r0, r4
        bl      _ipps_jFft_Core_16s
        ldr     r12, [r8, #0x10]
        cmp     r12, #0
        beq     LCCP3
        mov     r1, r11
        mov     r0, r4
        bl      _ipps_ibMpyBySqrt2_32s
LCCP3:
        ldr     r12, [r8, #0xC]
        ldr     lr, [sp, #8]
        mov     r2, r11
        mov     r1, r10
        mov     r0, r4
        add     r12, r12, lr
        ldr     lr, [sp]
        add     r3, r12, lr
        bl      _ipps_cnvrt_32s16s
        ldr     r2, [r8, #0x20]
        mov     r1, r5
        mov     r0, r10
        bl      _ipps_BitRev1_4
        ldr     r3, [sp, #4]
        mov     r2, r7
        mov     r1, r6
        mov     r0, r10
        bl      _ipps_vbFftSplit_16s
        cmp     r9, #0
        beq     LCCP5
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LCCP4:
        ldrsh   r10, [r10]
        ldrsh   r11, [r11]
        add     lr, sp, #0xC
        str     r10, [lr]
        ldr     r3, [sp, #8]
        add     r0, sp, #0xC
        add     r1, sp, #0x14
        add     r12, sp, #0xC
        str     r11, [r12, #4]
        mov     r2, #2
        bl      _ipps_cnvrt_32s16s
        add     r0, sp, #0x14
        ldrsh   lr, [r0]
        add     r12, sp, #0x14
        ldrsh   r12, [r12, #2]
        strh    lr, [r6]
        mov     r0, #0
        strh    r12, [r7]
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LCCP5:
        mov     r0, r4
        bl      _ippsFree
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LCCP6:
        ldr     r0, [r8, #0x18]
        bl      _ippsMalloc_8u
        mov     r4, r0
        cmp     r4, #0
        bne     LCCP1
        mvn     r0, #8
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LCCP7:
        mvn     r0, #7
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}


