        .text
        .align  4
        .globl  _ippsAutoCorr_64fc


_ippsAutoCorr_64fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x5C
        mov     r7, r0
        cmp     r7, #0
        mov     r9, r1
        mov     r4, r2
        mov     r11, r3
        beq     LCZA15
        cmp     r4, #0
        beq     LCZA15
        cmp     r9, #0
        ble     LCZA14
        cmp     r11, #0
        ble     LCZA14
        cmp     r9, r11
        mov     r10, r11
        movlt   r10, r9
        cmp     r10, #0x60
        mov     r8, #0
        bge     LCZA10
        cmp     r10, r11
        bge     LCZA0
        sub     r1, r11, r10
        add     r0, r4, r10, lsl #4
        bl      _ippsZero_64fc
LCZA0:
        bic     r12, r10, #1
        cmp     r12, #0
        and     r10, r10, #1
        sub     r6, r9, #1
        mov     r5, r7
        mov     lr, r12
        ble     LCZA4
        str     lr, [sp]
        str     r10, [sp, #0x10]
        str     r12, [sp, #0x14]
        str     r8, [sp, #4]
        str     r9, [sp, #8]
        str     r7, [sp, #0x1C]
LCZA1:
        ldr     r8, [sp, #0x1C]
        cmp     r6, #0
        ble     LCZA9
        ldr     r7, [sp, #4]
        add     r0, r5, #4
        sub     r11, r5, #0xC
        str     r7, [sp, #0x2C]
        str     r7, [sp, #0x30]
        str     r7, [sp, #0x3C]
        str     r7, [sp, #0x38]
        str     r7, [sp, #0x34]
        str     r7, [sp, #0x40]
        mov     r9, r7
        mov     r10, r9
        str     r10, [sp, #0x44]
        str     r9, [sp, #0x24]
        str     r7, [sp, #0x28]
        str     r0, [sp, #0x48]
        str     r5, [sp, #0xC]
        str     r6, [sp, #0x20]
        str     r4, [sp, #0x18]
LCZA2:
        ldr     r3, [sp, #0x44]
        ldr     r2, [sp, #0xC]
        ldr     r5, [r8]
        ldr     r4, [r8, #4]
        ldr     r2, [r2, +r3, lsl #4]
        mov     r0, r5
        str     r2, [sp, #0x4C]
        ldr     r3, [r11, #0x10]
        mov     r1, r4
        str     r3, [sp, #0x50]
        ldr     r9, [r11, #0x14]
        ldr     r3, [sp, #0x50]
        ldr     r10, [r11, #0x18]
        ldr     r6, [r8, #8]
        ldr     r7, [r8, #0xC]
        bl      __muldf3
        ldr     r2, [sp, #0x28]
        ldr     r3, [sp, #0x24]
        bl      __adddf3
        str     r0, [sp, #0x28]
        str     r1, [sp, #0x24]
        mov     r0, r6
        mov     r1, r7
        mov     r2, r9
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0x28]
        ldr     r3, [sp, #0x24]
        bl      __adddf3
        str     r0, [sp, #0x28]
        str     r1, [sp, #0x24]
        mov     r0, r5
        mov     r1, r4
        mov     r2, r9
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0x3C]
        ldr     r3, [sp, #0x38]
        bl      __adddf3
        ldr     r2, [sp, #0x4C]
        ldr     r3, [sp, #0x50]
        mov     r9, r0
        mov     r10, r1
        mov     r0, r6
        mov     r1, r7
        bl      __muldf3
        mov     r3, r1
        mov     r2, r0
        mov     r1, r10
        mov     r0, r9
        bl      __subdf3
        ldr     r2, [sp, #0x48]
        add     r11, r11, #0x10
        ldr     r3, [r2, #0xC]
        add     r8, r8, #0x10
        str     r3, [sp, #0x50]
        ldr     r10, [r2, #0x10]
        ldr     r12, [r2, #0x14]
        mov     r3, r10
        str     r12, [sp, #0x4C]
        ldr     r9, [r2, #0x18]
        ldr     r2, [sp, #0x50]
        str     r0, [sp, #0x3C]
        str     r1, [sp, #0x38]
        mov     r0, r5
        mov     r1, r4
        bl      __muldf3
        ldr     r2, [sp, #0x34]
        ldr     r3, [sp, #0x40]
        bl      __adddf3
        ldr     r2, [sp, #0x4C]
        str     r0, [sp, #0x40]
        str     r1, [sp, #0x34]
        mov     r0, r6
        mov     r1, r7
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #0x40]
        ldr     r3, [sp, #0x34]
        bl      __adddf3
        ldr     r2, [sp, #0x4C]
        str     r0, [sp, #0x34]
        str     r1, [sp, #0x40]
        mov     r0, r5
        mov     r1, r4
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #0x2C]
        ldr     r3, [sp, #0x30]
        bl      __adddf3
        ldr     r2, [sp, #0x50]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r6
        mov     r1, r7
        mov     r3, r10
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        ldr     r2, [sp, #0x44]
        ldr     r3, [sp, #0x20]
        str     r0, [sp, #0x2C]
        ldr     r0, [sp, #0x48]
        add     r2, r2, #1
        add     r0, r0, #0x10
        cmp     r2, r3
        str     r2, [sp, #0x44]
        str     r1, [sp, #0x30]
        str     r0, [sp, #0x48]
        blt     LCZA2
        ldr     r10, [sp, #0x44]
        ldr     r9, [sp, #0x24]
        ldr     r7, [sp, #0x28]
        ldr     r5, [sp, #0xC]
        ldr     r6, [sp, #0x20]
        ldr     r4, [sp, #0x18]
LCZA3:
        ldr     r2, [r5, +r10, lsl #4]
        ldr     r0, [r8]
        ldr     r1, [r8, #4]
        add     r11, r5, r10, lsl #4
        ldr     r3, [r11, #4]
        bl      __muldf3
        mov     r2, r7
        mov     r3, r9
        bl      __adddf3
        ldr     lr, [r8, #8]
        ldr     r12, [r8, #0xC]
        ldr     r2, [r11, #8]
        ldr     r3, [r11, #0xC]
        mov     r7, r0
        mov     r9, r1
        mov     r0, lr
        mov     r1, r12
        bl      __muldf3
        mov     r2, r7
        mov     r3, r9
        bl      __adddf3
        str     r0, [r4]
        str     r1, [r4, #4]
        ldr     r0, [r8]
        ldr     r1, [r8, #4]
        ldr     r2, [r11, #8]
        ldr     r3, [r11, #0xC]
        bl      __muldf3
        ldr     r2, [sp, #0x3C]
        ldr     r3, [sp, #0x38]
        bl      __adddf3
        ldr     r2, [r8, #8]
        ldr     r3, [r8, #0xC]
        ldr     r10, [r5, +r10, lsl #4]
        ldr     r11, [r11, #4]
        mov     r7, r0
        mov     r8, r1
        mov     r0, r2
        mov     r1, r3
        mov     r2, r10
        mov     r3, r11
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r7
        mov     r1, r8
        bl      __subdf3
        ldr     r3, [sp]
        sub     r6, r6, #2
        sub     r3, r3, #2
        str     r3, [sp]
        str     r0, [r4, #8]
        str     r1, [r4, #0xC]
        ldr     r0, [sp, #0x34]
        cmp     r3, #0
        add     r5, r5, #0x20
        str     r0, [r4, #0x10]
        ldr     r0, [sp, #0x40]
        str     r0, [r4, #0x14]
        ldr     r0, [sp, #0x2C]
        str     r0, [r4, #0x18]
        ldr     r0, [sp, #0x30]
        str     r0, [r4, #0x1C]
        add     r4, r4, #0x20
        bgt     LCZA1
        ldr     r10, [sp, #0x10]
        ldr     r12, [sp, #0x14]
        ldr     r9, [sp, #8]
        ldr     r7, [sp, #0x1C]
LCZA4:
        cmp     r10, #0
        sub     r3, r9, r12
        mov     r6, #0
        beq     LCZA7
        cmp     r3, #0
        ble     LCZA8
        mov     r10, r6
        mov     lr, r10
        mov     r11, lr
        mov     r8, r11
        mov     r12, r8
        sub     r9, r5, #0xC
        str     r6, [sp, #0x14]
        str     r12, [sp]
        str     r11, [sp, #4]
        str     lr, [sp, #8]
        str     r3, [sp, #0x10]
        str     r5, [sp, #0xC]
        str     r4, [sp, #0x18]
LCZA5:
        ldr     r1, [r7]
        str     r1, [sp, #0x50]
        ldr     r1, [r7, #4]
        ldr     r0, [sp, #0x50]
        str     r1, [sp, #0x4C]
        ldr     r1, [sp, #0xC]
        ldr     r2, [r1, +r10, lsl #4]
        add     r10, r10, #1
        str     r2, [sp, #0x48]
        ldr     r1, [r9, #0x10]
        str     r1, [sp, #0x44]
        ldr     r4, [r9, #0x14]
        ldr     r5, [r9, #0x18]
        ldr     r11, [r7, #8]
        ldr     r6, [r7, #0xC]
        ldr     r3, [sp, #0x44]
        ldr     r1, [sp, #0x4C]
        add     r7, r7, #0x10
        add     r9, r9, #0x10
        bl      __muldf3
        ldr     r3, [sp]
        mov     r2, r8
        bl      __adddf3
        str     r0, [sp, #0x40]
        mov     r8, r1
        mov     r2, r4
        mov     r3, r5
        mov     r0, r11
        mov     r1, r6
        bl      __muldf3
        ldr     r2, [sp, #0x40]
        mov     r3, r8
        bl      __adddf3
        str     r1, [sp]
        mov     r8, r0
        ldr     r0, [sp, #0x50]
        ldr     r1, [sp, #0x4C]
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #4]
        bl      __adddf3
        ldr     r2, [sp, #0x48]
        ldr     r3, [sp, #0x44]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r11
        mov     r1, r6
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        ldr     r3, [sp, #0x10]
        str     r0, [sp, #8]
        cmp     r10, r3
        str     r1, [sp, #4]
        blt     LCZA5
        ldr     r6, [sp, #0x14]
        ldr     r12, [sp]
        ldr     r11, [sp, #4]
        ldr     lr, [sp, #8]
        ldr     r4, [sp, #0x18]
LCZA6:
        str     r8, [r4]
        str     r12, [r4, #4]
        str     lr, [r4, #8]
        str     r11, [r4, #0xC]
        mov     r0, r6
        add     sp, sp, #0x5C
        ldmia   sp!, {r4 - r11, pc}
LCZA7:
        mov     r0, r6
        add     sp, sp, #0x5C
        ldmia   sp!, {r4 - r11, pc}
LCZA8:
        mov     lr, r6
        mov     r11, lr
        mov     r8, r11
        mov     r12, r8
        b       LCZA6
LCZA9:
        ldr     r7, [sp, #4]
        str     r7, [sp, #0x2C]
        str     r7, [sp, #0x30]
        str     r7, [sp, #0x3C]
        str     r7, [sp, #0x38]
        str     r7, [sp, #0x34]
        str     r7, [sp, #0x40]
        mov     r9, r7
        mov     r10, r9
        b       LCZA3
LCZA10:
        mov     r12, r9, lsl #1
        cmp     r12, #2
        mov     lr, #1
        movle   r1, #1
        movle   r5, #2
        ble     LCZA12
        mov     r1, #1
LCZA11:
        add     r1, r1, #1
        mov     r5, lr, lsl r1
        cmp     r5, r12
        blt     LCZA11
LCZA12:
        add     r0, sp, #0x58
        mov     r3, #0
        mov     r2, #2
        bl      _ippsFFTInitAlloc_C_64fc
        cmp     r0, #0
        addne   sp, sp, #0x5C
        ldmneia sp!, {r4 - r11, pc}
        ldr     r0, [sp, #0x58]
        add     r1, sp, #0x54
        bl      _ippsFFTGetBufSize_C_64fc
        mov     r6, r0
        cmp     r6, #0
        strlt   r8, [sp, #0x10]
        blt     LCZA13
        ldr     r0, [sp, #0x54]
        mov     r6, r5, lsl #1
        bl      _ippsMalloc_8u
        mov     r8, r0
        mov     r0, r6
        bl      _ippsMalloc_64fc
        cmp     r0, #0
        str     r0, [sp, #0x10]
        mvneq   r6, #8
        beq     LCZA13
        mov     r0, r7
        ldr     r6, [sp, #0x10]
        mov     r2, r9
        mov     r1, r6
        bl      _ippsCopy_64fc
        add     r0, r6, r9, lsl #4
        sub     r1, r5, r9
        bl      _ippsZero_64fc
        ldr     r2, [sp, #0x58]
        mov     r0, r6
        mov     r1, r6
        mov     r3, r8
        bl      _ippsFFTFwd_CToC_64fc
        mov     r6, r0
        cmp     r6, #0
        blt     LCZA13
        ldr     r0, [sp, #0x10]
        mov     r2, r5
        add     r6, r0, r5, lsl #4
        mov     r1, r6
        bl      _ippsConj_64fc
        mov     r0, r6
        mov     r2, r5
        ldr     r5, [sp, #0x10]
        mov     r1, r5
        bl      _ippsMul_64fc_I
        ldr     r2, [sp, #0x58]
        mov     r0, r5
        mov     r3, r8
        mov     r1, r5
        bl      _ippsFFTInv_CToC_64fc
        mov     r6, r0
        cmp     r6, #0
        blt     LCZA13
        mov     r2, r10
        mov     r1, r4
        ldr     r0, [sp, #0x10]
        bl      _ippsCopy_64fc
        cmp     r10, r11
        bge     LCZA13
        sub     r1, r11, r10
        add     r0, r4, r10, lsl #4
        bl      _ippsZero_64fc
LCZA13:
        ldr     r0, [sp, #0x58]
        bl      _ippsFFTFree_C_64fc
        ldr     r0, [sp, #0x10]
        bl      _ippsFree
        mov     r0, r8
        bl      _ippsFree
        mov     r0, r6
        add     sp, sp, #0x5C
        ldmia   sp!, {r4 - r11, pc}
LCZA14:
        mvn     r0, #5
        add     sp, sp, #0x5C
        ldmia   sp!, {r4 - r11, pc}
LCZA15:
        mvn     r0, #7
        add     sp, sp, #0x5C
        ldmia   sp!, {r4 - r11, pc}


