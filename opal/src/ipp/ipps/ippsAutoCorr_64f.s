        .text
        .align  4
        .globl  _ippsAutoCorr_64f


_ippsAutoCorr_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x54
        mov     r8, r0
        cmp     r8, #0
        mov     r9, r1
        mov     r7, r2
        mov     r11, r3
        beq     LCZB18
        cmp     r7, #0
        beq     LCZB18
        cmp     r9, #0
        ble     LCZB17
        cmp     r11, #0
        ble     LCZB17
        cmp     r9, r11
        mov     r10, r11
        movlt   r10, r9
        cmp     r10, #0x96, 30
        mov     r5, #0
        bge     LCZB13
        cmp     r10, r11
        bge     LCZB0
        sub     r1, r11, r10
        add     r0, r7, r10, lsl #3
        bl      _ippsZero_64f
LCZB0:
        bic     lr, r10, #3
        sub     r12, r10, lr
        cmp     lr, #0
        sub     r10, r9, #3
        mov     r6, r8
        mov     r4, lr
        ble     LCZB4
        str     r4, [sp, #0x30]
        str     r12, [sp, #0x34]
        str     lr, [sp, #0x38]
        str     r10, [sp, #0x20]
        str     r5, [sp, #0x3C]
        str     r9, [sp, #0x44]
        str     r8, [sp, #0x48]
LCZB1:
        ldr     r0, [sp, #0x20]
        ldr     r4, [sp, #0x48]
        cmp     r0, #0
        ble     LCZB12
        ldr     r9, [sp, #0x3C]
        add     r8, r6, #8
        add     r10, r6, #0x10
        str     r9, [sp, #4]
        str     r9, [sp, #0xC]
        str     r9, [sp, #8]
        str     r9, [sp]
        str     r9, [sp, #0x10]
        str     r9, [sp, #0x14]
        mov     r11, r9
        mov     r5, r11
        add     r0, r6, #0x14
        add     r1, r6, #0xC
        add     r2, r6, #4
        sub     r3, r6, #4
        str     r8, [sp, #0x28]
        str     r10, [sp, #0x2C]
        str     r11, [sp, #0x1C]
        str     r9, [sp, #0x18]
        str     r6, [sp, #0x24]
        str     r7, [sp, #0x40]
        mov     r11, r0
        mov     r10, r1
        mov     r9, r2
        mov     r8, r3
LCZB2:
        ldr     r12, [sp, #0x24]
        ldr     r3, [r8, #8]!
        ldr     r6, [r4]
        ldr     r2, [r12, +r5, lsl #3]
        ldr     r7, [r4, #4]
        mov     r0, r6
        mov     r1, r7
        bl      __muldf3
        ldr     r2, [sp, #0x18]
        ldr     r3, [sp, #0x1C]
        bl      __adddf3
        ldr     r2, [r9, #4]
        ldr     r3, [r9, #8]!
        str     r0, [sp, #0x18]
        str     r1, [sp, #0x1C]
        mov     r0, r6
        mov     r1, r7
        bl      __muldf3
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0x14]
        bl      __adddf3
        ldr     r2, [r10, #4]
        ldr     r3, [r10, #8]!
        str     r0, [sp, #0x10]
        str     r1, [sp, #0x14]
        mov     r0, r6
        mov     r1, r7
        bl      __muldf3
        ldr     r2, [sp, #8]
        ldr     r3, [sp]
        bl      __adddf3
        ldr     r2, [r11, #4]
        ldr     r3, [r11, #8]!
        str     r0, [sp, #8]
        str     r1, [sp]
        mov     r0, r6
        mov     r1, r7
        bl      __muldf3
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #0xC]
        bl      __adddf3
        ldr     r12, [sp, #0x20]
        add     r5, r5, #1
        cmp     r5, r12
        str     r0, [sp, #4]
        str     r1, [sp, #0xC]
        add     r4, r4, #8
        blt     LCZB2
        ldr     r8, [sp, #0x28]
        ldr     r10, [sp, #0x2C]
        ldr     r11, [sp, #0x1C]
        ldr     r9, [sp, #0x18]
        ldr     r6, [sp, #0x24]
        ldr     r7, [sp, #0x40]
LCZB3:
        ldr     r0, [r4]
        ldr     r1, [r4, #4]
        ldr     r2, [r6, +r5, lsl #3]
        add     r12, r6, r5, lsl #3
        ldr     r3, [r12, #4]
        bl      __muldf3
        mov     r3, r11
        mov     r2, r9
        add     r9, r8, r5, lsl #3
        bl      __adddf3
        ldr     r3, [r9, #4]
        ldr     r2, [r8, +r5, lsl #3]
        ldr     r12, [r4, #8]
        ldr     lr, [r4, #0xC]
        str     r0, [sp, #0x1C]
        mov     r11, r1
        mov     r0, r12
        mov     r1, lr
        bl      __muldf3
        ldr     r2, [sp, #0x1C]
        mov     r3, r11
        bl      __adddf3
        ldr     r2, [r10, +r5, lsl #3]
        ldr     r12, [r4, #0x10]
        ldr     lr, [r4, #0x14]
        add     r11, r10, r5, lsl #3
        ldr     r3, [r11, #4]
        str     r0, [sp, #0x1C]
        str     r1, [sp, #0x18]
        mov     r0, r12
        mov     r1, lr
        bl      __muldf3
        ldr     r2, [sp, #0x1C]
        ldr     r3, [sp, #0x18]
        bl      __adddf3
        str     r0, [r7]
        str     r1, [r7, #4]
        ldr     r3, [r9, #4]
        ldr     r2, [r8, +r5, lsl #3]
        ldr     r0, [r4]
        ldr     r1, [r4, #4]
        bl      __muldf3
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0x14]
        bl      __adddf3
        ldr     r2, [r4, #8]
        ldr     lr, [r10, +r5, lsl #3]
        ldr     r3, [r11, #4]
        ldr     r12, [r4, #0xC]
        mov     r8, r0
        mov     r0, r2
        mov     r9, r1
        mov     r1, r12
        mov     r2, lr
        bl      __muldf3
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        str     r0, [r7, #8]
        str     r1, [r7, #0xC]
        ldr     r0, [r4]
        ldr     r1, [r4, #4]
        ldr     r2, [r10, +r5, lsl #3]
        ldr     r3, [r11, #4]
        bl      __muldf3
        ldr     r2, [sp, #8]
        ldr     r3, [sp]
        bl      __adddf3
        ldr     r3, [sp, #0x30]
        ldr     r12, [sp, #4]
        sub     r3, r3, #4
        str     r3, [sp, #0x30]
        str     r12, [r7, #0x18]
        ldr     r12, [sp, #0xC]
        str     r0, [r7, #0x10]
        str     r1, [r7, #0x14]
        str     r12, [r7, #0x1C]
        ldr     r0, [sp, #0x20]
        cmp     r3, #0
        add     r6, r6, #0x20
        sub     r0, r0, #4
        str     r0, [sp, #0x20]
        add     r7, r7, #0x20
        bgt     LCZB1
        ldr     r12, [sp, #0x34]
        ldr     lr, [sp, #0x38]
        ldr     r9, [sp, #0x44]
        ldr     r8, [sp, #0x48]
LCZB4:
        cmp     r12, #0
        sub     r5, r9, lr
        mov     r4, #0
        ble     LCZB11
        mov     r1, r7
        mov     r0, r8
LCZB5:
        cmp     r5, #0
        movle   r8, r4
        movle   r7, r8
        ble     LCZB9
        cmp     r5, #6
        blt     LCZB10
        mov     r9, r4
        sub     r3, r6, #0x1C
        str     r3, [sp, #0x28]
        mov     r3, #0x10
        str     r3, [sp, #0x2C]
        sub     r3, r6, #0x14
        str     r3, [sp, #0x30]
        mov     r3, #0x18
        str     r3, [sp, #0x38]
        sub     r3, r6, #0xC
        str     r3, [sp, #0x3C]
        mov     r3, #0x20
        sub     r2, r5, #6
        str     r4, [sp, #0x1C]
        str     r5, [sp, #0x20]
        ldr     r4, [sp, #0x30]
        ldr     r5, [sp, #0x28]
        str     r3, [sp, #0x44]
        mov     r8, r9
        sub     lr, r6, #0x24
        sub     r3, r6, #4
        mov     r7, r8
        sub     r11, r0, #4
        mov     r10, #8
        str     r3, [sp, #0x14]
        str     lr, [sp, #0x10]
        str     r2, [sp, #0x18]
        str     r12, [sp, #0x34]
        str     r1, [sp, #0x40]
        str     r0, [sp, #0x48]
LCZB6:
        ldr     r2, [r6, +r9, lsl #3]
        ldr     r12, [sp, #0x10]
        ldr     r0, [r11, #4]
        ldr     r1, [r11, #8]
        ldr     r3, [r12, #0x28]
        add     r9, r9, #5
        bl      __muldf3
        mov     r2, r8
        mov     r3, r7
        bl      __adddf3
        ldr     r12, [r11, #0xC]
        ldr     lr, [r11, #0x10]
        ldr     r2, [r10, +r6]
        ldr     r3, [r5, #0x28]!
        mov     r7, r0
        mov     r8, r1
        mov     r0, r12
        mov     r1, lr
        bl      __muldf3
        mov     r2, r7
        mov     r3, r8
        bl      __adddf3
        ldr     r12, [sp, #0x2C]
        ldr     lr, [r11, #0x18]
        ldr     r3, [r4, #0x28]!
        ldr     r2, [r12, +r6]
        ldr     r12, [r11, #0x14]
        mov     r7, r0
        mov     r8, r1
        mov     r0, r12
        mov     r1, lr
        bl      __muldf3
        mov     r2, r7
        mov     r3, r8
        bl      __adddf3
        ldr     r2, [sp, #0x38]
        ldr     r3, [sp, #0x3C]
        ldr     lr, [r11, #0x1C]
        ldr     r12, [r11, #0x20]
        ldr     r2, [r2, +r6]
        ldr     r3, [r3, #0x28]
        mov     r7, r0
        mov     r8, r1
        mov     r0, lr
        mov     r1, r12
        bl      __muldf3
        mov     r2, r7
        mov     r3, r8
        bl      __adddf3
        ldr     r2, [sp, #0x44]
        ldr     r3, [sp, #0x14]
        ldr     lr, [r11, #0x24]
        ldr     r12, [r11, #0x28]!
        ldr     r2, [r2, +r6]
        ldr     r3, [r3, #0x28]
        mov     r7, r0
        mov     r8, r1
        mov     r0, lr
        mov     r1, r12
        bl      __muldf3
        mov     r2, r7
        mov     r3, r8
        bl      __adddf3
        ldr     r12, [sp, #0x18]
        mov     r8, r0
        mov     r7, r1
        cmp     r9, r12
        ldr     r12, [sp, #0x10]
        add     r10, r10, #0x28
        add     r12, r12, #0x28
        str     r12, [sp, #0x10]
        ldr     r12, [sp, #0x2C]
        add     r12, r12, #0x28
        str     r12, [sp, #0x2C]
        ldr     r12, [sp, #0x38]
        add     r12, r12, #0x28
        str     r12, [sp, #0x38]
        ldr     r12, [sp, #0x3C]
        add     r12, r12, #0x28
        str     r12, [sp, #0x3C]
        ldr     r12, [sp, #0x44]
        add     r12, r12, #0x28
        str     r12, [sp, #0x44]
        ldr     r12, [sp, #0x14]
        add     r12, r12, #0x28
        str     r12, [sp, #0x14]
        ble     LCZB6
        ldr     r4, [sp, #0x1C]
        ldr     r5, [sp, #0x20]
        ldr     r12, [sp, #0x34]
        ldr     r1, [sp, #0x40]
        ldr     r0, [sp, #0x48]
LCZB7:
        mov     lr, r9, lsl #3
        sub     lr, lr, #4
        add     r11, lr, r6
        add     r10, lr, r0
        str     r12, [sp, #0x34]
        str     r1, [sp, #0x40]
        str     r0, [sp, #0x48]
LCZB8:
        ldr     r2, [r6, +r9, lsl #3]
        ldr     r0, [r10, #4]
        ldr     r1, [r10, #8]!
        ldr     r3, [r11, #8]!
        bl      __muldf3
        mov     r2, r8
        mov     r3, r7
        bl      __adddf3
        add     r9, r9, #1
        cmp     r9, r5
        mov     r8, r0
        mov     r7, r1
        blt     LCZB8
        ldr     r12, [sp, #0x34]
        ldr     r1, [sp, #0x40]
        ldr     r0, [sp, #0x48]
LCZB9:
        str     r8, [r1]
        str     r7, [r1, #4]
        subs    r12, r12, #1
        sub     r5, r5, #1
        add     r6, r6, #8
        add     r1, r1, #8
        bne     LCZB5
        mov     r4, #0
        mov     r0, r4
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}
LCZB10:
        mov     r9, r4
        mov     r8, r9
        mov     r7, r8
        b       LCZB7
LCZB11:
        mov     r0, r4
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}
LCZB12:
        ldr     r9, [sp, #0x3C]
        add     r8, r6, #8
        add     r10, r6, #0x10
        str     r9, [sp, #4]
        str     r9, [sp, #0xC]
        str     r9, [sp, #8]
        str     r9, [sp]
        str     r9, [sp, #0x10]
        str     r9, [sp, #0x14]
        mov     r11, r9
        mov     r5, r11
        b       LCZB3
LCZB13:
        mov     r12, r9, lsl #1
        cmp     r12, #2
        mov     lr, #1
        movle   r1, #1
        movle   r6, #2
        ble     LCZB15
        mov     r1, #1
LCZB14:
        add     r1, r1, #1
        mov     r6, lr, lsl r1
        cmp     r6, r12
        blt     LCZB14
LCZB15:
        add     r0, sp, #0x50
        mov     r3, #0
        mov     r2, #2
        bl      _ippsFFTInitAlloc_R_64f
        cmp     r0, #0
        addne   sp, sp, #0x54
        ldmneia sp!, {r4 - r11, pc}
        ldr     r0, [sp, #0x50]
        add     r1, sp, #0x4C
        bl      _ippsFFTGetBufSize_R_64f
        mov     r4, r0
        cmp     r4, #0
        strlt   r5, [sp, #0x38]
        blt     LCZB16
        ldr     r0, [sp, #0x4C]
        bl      _ippsMalloc_8u
        mov     r5, r0
        mov     r0, r6
        bl      _ippsMalloc_64f
        cmp     r0, #0
        str     r0, [sp, #0x38]
        mvneq   r4, #8
        beq     LCZB16
        mov     r0, r8
        ldr     r4, [sp, #0x38]
        mov     r2, r9
        mov     r1, r4
        bl      _ippsCopy_64f
        add     r0, r4, r9, lsl #3
        sub     r1, r6, r9
        bl      _ippsZero_64f
        ldr     r2, [sp, #0x50]
        mov     r0, r4
        mov     r1, r4
        mov     r3, r5
        bl      _ippsFFTFwd_RToPack_64f
        mov     r4, r0
        cmp     r4, #0
        blt     LCZB16
        mov     r2, r6
        ldr     r4, [sp, #0x38]
        mov     r0, r4
        mov     r1, r4
        bl      _ippsMulPackConj_64f_I
        ldr     r2, [sp, #0x50]
        mov     r0, r4
        mov     r1, r4
        mov     r3, r5
        bl      _ippsFFTInv_PackToR_64f
        mov     r4, r0
        cmp     r4, #0
        blt     LCZB16
        mov     r2, r10
        mov     r1, r7
        ldr     r0, [sp, #0x38]
        bl      _ippsCopy_64f
        cmp     r10, r11
        bge     LCZB16
        sub     r1, r11, r10
        add     r0, r7, r10, lsl #3
        bl      _ippsZero_64f
LCZB16:
        ldr     r0, [sp, #0x50]
        bl      _ippsFFTFree_R_64f
        ldr     r0, [sp, #0x38]
        bl      _ippsFree
        mov     r0, r5
        bl      _ippsFree
        mov     r0, r4
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}
LCZB17:
        mvn     r0, #5
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}
LCZB18:
        mvn     r0, #7
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}


