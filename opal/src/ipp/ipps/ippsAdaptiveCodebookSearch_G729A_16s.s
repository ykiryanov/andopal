        .text
        .align  4
        .globl  _ippsAdaptiveCodebookSearch_G729A_16s


_ippsAdaptiveCodebookSearch_G729A_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xD8
        add     lr, sp, #0x70
        ldr     r8, [sp, #0xFC]
        and     lr, lr, #7
        ldr     r7, [sp, #0x100]
        ldr     r9, [sp, #0x104]
        rsb     lr, lr, #0
        add     r12, sp, #0x70
        and     lr, lr, #7
        mov     r10, r0
        cmp     r1, #0
        add     r5, r12, lr
        mov     r0, r2
        mov     r6, r3
        beq     LDPU6
        cmp     r0, #0
        beq     LDPU6
        cmp     r6, #0
        beq     LDPU6
        cmp     r8, #0
        beq     LDPU6
        cmp     r7, #0
        beq     LDPU6
        cmp     r10, #0x12
        blt     LDPU5
        cmp     r10, #0x91
        bgt     LDPU5
        cmp     r9, #0
        blt     LDPU5
        cmp     r9, #1
        bgt     LDPU5
        cmp     r9, #0
        add     r4, r6, #0x4D, 30
        mov     r12, #0x14
        bne     LDPU0
        sub     r10, r10, #3
        cmp     r10, #0x14
        movlt   r10, r12
        add     r11, r10, #6
        cmp     r11, #0x8F
        movgt   r11, #0x8F
        movgt   r10, #0x89
        b       LDPU1
LDPU0:
        sub     r10, r10, #5
        cmp     r10, #0x14
        movlt   r10, r12
        add     r11, r10, #9
        cmp     r11, #0x8F
        movgt   r11, #0x8F
        movgt   r10, #0x86
LDPU1:
        mov     r3, r5
        mov     r2, #0x28
        bl      _ippsCrossCorr_NormM_16s
        add     r2, sp, #0xCC
        add     r12, sp, #0xD0
        str     r2, [sp, #4]
        str     r12, [sp, #8]
        str     r11, [sp]
        mov     r3, r10
        mov     r1, r4
        mov     r0, r5
        mov     r2, #0x28
        bl      _ippsCrossCorrLagMax_Inv_16s
        ldr     r2, [sp, #0xD0]
        add     r12, sp, #0xD4
        add     r0, sp, #0xD4
        strh    r2, [r12]
        add     r10, sp, #0xD4
        mov     r11, #0
        strh    r11, [r10, #2]
        mov     r1, r6
        bl      _ippsDecodeAdaptiveVector_G729_16s_I
        cmp     r9, #0
        strh    r11, [r8, #2]
        bne     LDPU2
        ldr     r2, [sp, #0xD0]
        cmp     r2, #0x54
        bgt     LDPU4
LDPU2:
        add     r12, sp, #0x10
        and     r12, r12, #0xF
        rsb     r12, r12, #0
        add     r2, sp, #0x10
        add     r3, sp, #0xCC
        and     r12, r12, #0xF
        add     r9, r2, r12
        mov     r1, r4
        mov     r0, r5
        mov     r2, #0x28
        bl      _ippsDotProd_16s32s
        mov     r1, r9
        mov     r0, r4
        mov     r2, #0x28
        bl      _ippsCopy_16s
        add     r0, sp, #0xD4
        mvn     r11, #0
        strh    r11, [r10, #2]
        mov     r1, r6
        bl      _ippsDecodeAdaptiveVector_G729_16s_I
        add     r3, sp, #0xC8
        mov     r2, #0x28
        mov     r1, r4
        mov     r0, r5
        bl      _ippsDotProd_16s32s
        ldr     r12, [sp, #0xC8]
        ldr     r2, [sp, #0xCC]
        cmp     r12, r2
        ble     LDPU3
        str     r12, [sp, #0xCC]
        strh    r11, [r8, #2]
        mov     r2, #0x28
        mov     r1, r9
        mov     r0, r4
        bl      _ippsCopy_16s
LDPU3:
        add     r0, sp, #0xD4
        mov     r11, #1
        strh    r11, [r10, #2]
        mov     r1, r6
        bl      _ippsDecodeAdaptiveVector_G729_16s_I
        add     r3, sp, #0xC8
        mov     r0, r5
        mov     r2, #0x28
        mov     r1, r4
        bl      _ippsDotProd_16s32s
        ldr     r2, [sp, #0xC8]
        ldr     r3, [sp, #0xCC]
        cmp     r2, r3
        strgth  r11, [r8, #2]
        strgt   r2, [sp, #0xCC]
        bgt     LDPU4
        mov     r0, r9
        mov     r1, r4
        mov     r2, #0x28
        bl      _ippsCopy_16s
LDPU4:
        mov     r0, r4
        mov     r1, r7
        mov     r2, #0x28
        bl      _ippsCopy_16s
        ldr     r1, [sp, #0xD0]
        mov     r0, #0
        strh    r1, [r8]
        add     sp, sp, #0xD8
        ldmia   sp!, {r4 - r11, pc}
LDPU5:
        mvn     r0, #6
        add     sp, sp, #0xD8
        ldmia   sp!, {r4 - r11, pc}
LDPU6:
        mvn     r0, #7
        add     sp, sp, #0xD8
        ldmia   sp!, {r4 - r11, pc}


