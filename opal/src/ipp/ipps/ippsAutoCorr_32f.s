        .text
        .align  4
        .globl  _ippsAutoCorr_32f


_ippsAutoCorr_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x3C
        mov     r10, r0
        cmp     r10, #0
        mov     r6, r1
        mov     r5, r2
        mov     r9, r3
        beq     LCZD17
        cmp     r5, #0
        beq     LCZD17
        cmp     r6, #0
        ble     LCZD16
        cmp     r9, #0
        ble     LCZD16
        cmp     r6, r9
        mov     r11, r9
        movlt   r11, r6
        cmp     r11, #0x96, 30
        bge     LCZD12
        cmp     r11, r9
        bge     LCZD0
        sub     r1, r9, r11
        add     r0, r5, r11, lsl #2
        bl      _ippsZero_32f
LCZD0:
        bic     r3, r11, #3
        cmp     r3, #0
        sub     r7, r11, r3
        sub     r12, r6, #3
        mov     r9, r10
        mov     lr, r3
        ble     LCZD4
        ldr     r4, [pc, #0x500]
        ldr     r4, [r4]
        str     lr, [sp, #0x1C]
        str     r7, [sp, #0x20]
        str     r4, [sp, #0x18]
        str     r3, [sp, #0x24]
        str     r12, [sp, #0xC]
        str     r6, [sp, #0x2C]
        str     r10, [sp, #0x30]
LCZD1:
        ldr     r6, [sp, #0x18]
        ldr     r3, [sp, #0xC]
        ldr     r7, [sp, #0x30]
        mov     r4, r6
        mov     r1, r4
        cmp     r3, #0
        str     r4, [sp]
        str     r1, [sp, #4]
        ble     LCZD11
        add     r8, r9, #4
        add     r10, r9, #8
        add     r0, r9, #0xC
        mov     r1, r8
        mov     r2, r10
        str     r8, [sp, #0x10]
        str     r10, [sp, #0x14]
        str     r9, [sp, #8]
        mov     r11, #0
        str     r5, [sp, #0x28]
        mov     r10, r0
        mov     r9, r1
        mov     r8, r2
LCZD2:
        ldr     r5, [r7], #4
        ldr     r3, [sp, #8]
        mov     r0, r5
        ldr     r1, [r3, +r11, lsl #2]
        add     r11, r11, #1
        bl      __mulsf3
        ldr     r1, [sp, #4]
        bl      __addsf3
        ldr     r1, [r9], #4
        str     r0, [sp, #4]
        mov     r0, r5
        bl      __mulsf3
        ldr     r1, [sp]
        bl      __addsf3
        ldr     r1, [r8], #4
        str     r0, [sp]
        mov     r0, r5
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r1, [r10], #4
        mov     r4, r0
        mov     r0, r5
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        ldr     r3, [sp, #0xC]
        cmp     r11, r3
        mov     r6, r0
        blt     LCZD2
        ldr     r8, [sp, #0x10]
        ldr     r10, [sp, #0x14]
        ldr     r9, [sp, #8]
        ldr     r5, [sp, #0x28]
LCZD3:
        ldr     r3, [sp, #0x1C]
        ldr     r1, [r9, +r11, lsl #2]
        ldr     r0, [r7]
        sub     r3, r3, #4
        str     r3, [sp, #0x1C]
        ldr     r3, [sp, #0xC]
        sub     r3, r3, #4
        str     r3, [sp, #0xC]
        bl      __mulsf3
        ldr     r1, [sp, #4]
        bl      __addsf3
        ldr     r2, [r8, +r11, lsl #2]
        ldr     r1, [r7, #4]
        str     r0, [sp, #4]
        add     r9, r9, #0x10
        mov     r0, r1
        mov     r1, r2
        bl      __mulsf3
        ldr     r1, [sp, #4]
        bl      __addsf3
        ldr     r2, [r7, #8]
        ldr     r1, [r10, +r11, lsl #2]
        str     r0, [sp, #4]
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [sp, #4]
        bl      __addsf3
        str     r0, [r5]
        ldr     r1, [r8, +r11, lsl #2]
        ldr     r0, [r7]
        bl      __mulsf3
        ldr     r1, [sp]
        bl      __addsf3
        ldr     r1, [r7, #4]
        ldr     r2, [r10, +r11, lsl #2]
        mov     r8, r0
        mov     r0, r1
        mov     r1, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        str     r0, [r5, #4]
        ldr     r1, [r10, +r11, lsl #2]
        ldr     r0, [r7]
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        str     r0, [r5, #8]
        str     r6, [r5, #0xC]
        ldr     r0, [sp, #0x1C]
        add     r5, r5, #0x10
        cmp     r0, #0
        bgt     LCZD1
        ldr     r7, [sp, #0x20]
        ldr     r3, [sp, #0x24]
        ldr     r6, [sp, #0x2C]
        ldr     r10, [sp, #0x30]
LCZD4:
        cmp     r7, #0
        sub     r8, r6, r3
        mov     r4, #0
        ble     LCZD10
        ldr     r3, [pc, #0x308]
        mov     r1, r5
        mov     r0, r10
        ldr     r6, [r3]
LCZD5:
        cmp     r8, #0
        mov     r5, r6
        ble     LCZD9
        cmp     r8, #6
        movlt   r10, r4
        blt     LCZD7
        mov     r10, r4
        mov     r11, #0xC
        str     r11, [sp, #0x2C]
        sub     lr, r8, #6
        str     r8, [sp, #0x24]
        ldr     r8, [sp, #0x2C]
        mov     r12, #4
        add     r3, r0, #4
        mov     r2, #8
        str     r4, [sp, #0x18]
        str     r6, [sp, #0x1C]
        str     r7, [sp, #0x20]
        mov     r11, #0x10
        str     lr, [sp, #0x14]
        str     r1, [sp, #0x28]
        str     r0, [sp, #0x30]
        mov     r4, r2
        mov     r6, r3
        mov     r7, r12
LCZD6:
        ldr     r1, [r9, +r10, lsl #2]
        ldr     r0, [r6, #-4]
        add     r10, r10, #5
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r1, [r6]
        ldr     r2, [r7, +r9]
        mov     r5, r0
        mov     r0, r1
        add     r7, r7, #0x14
        mov     r1, r2
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r1, [r6, #4]
        ldr     r2, [r4, +r9]
        mov     r5, r0
        mov     r0, r1
        add     r4, r4, #0x14
        mov     r1, r2
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r1, [r6, #8]
        ldr     r2, [r8, +r9]
        mov     r5, r0
        mov     r0, r1
        add     r8, r8, #0x14
        mov     r1, r2
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        mov     r5, r0
        ldr     r0, [r6, #0xC]
        ldr     r1, [r11, +r9]
        add     r6, r6, #0x14
        add     r11, r11, #0x14
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     lr, [sp, #0x14]
        mov     r5, r0
        cmp     r10, lr
        ble     LCZD6
        ldr     r4, [sp, #0x18]
        ldr     r6, [sp, #0x1C]
        ldr     r8, [sp, #0x24]
        ldr     r7, [sp, #0x20]
        ldr     r1, [sp, #0x28]
        ldr     r0, [sp, #0x30]
LCZD7:
        add     r11, r0, r10, lsl #2
        str     r1, [sp, #0x28]
        str     r0, [sp, #0x30]
LCZD8:
        ldr     r1, [r9, +r10, lsl #2]
        ldr     r0, [r11], #4
        add     r10, r10, #1
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        cmp     r10, r8
        mov     r5, r0
        blt     LCZD8
        ldr     r1, [sp, #0x28]
        ldr     r0, [sp, #0x30]
LCZD9:
        str     r5, [r1], #4
        subs    r7, r7, #1
        sub     r8, r8, #1
        add     r9, r9, #4
        bne     LCZD5
        mov     r4, #0
        mov     r0, r4
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LCZD10:
        mov     r0, r4
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LCZD11:
        mov     r11, #0
        add     r8, r9, #4
        add     r10, r9, #8
        b       LCZD3
LCZD12:
        mov     r12, r6, lsl #1
        cmp     r12, #2
        mov     lr, #1
        movle   r1, #1
        movle   r8, #2
        ble     LCZD14
        mov     r1, #1
LCZD13:
        add     r1, r1, #1
        mov     r8, lr, lsl r1
        cmp     r8, r12
        blt     LCZD13
LCZD14:
        add     r0, sp, #0x38
        mov     r3, #0
        mov     r2, #2
        bl      _ippsFFTInitAlloc_R_32f
        cmp     r0, #0
        addne   sp, sp, #0x3C
        ldmneia sp!, {r4 - r11, pc}
        ldr     r0, [sp, #0x38]
        add     r1, sp, #0x34
        bl      _ippsFFTGetBufSize_R_32f
        mov     r4, r0
        cmp     r4, #0
        movlt   r7, #0
        strlt   r7, [sp, #0x24]
        blt     LCZD15
        ldr     r0, [sp, #0x34]
        bl      _ippsMalloc_8u
        str     r0, [sp, #0x24]
        mov     r0, r8
        bl      _ippsMalloc_32f
        mov     r7, r0
        cmp     r7, #0
        mvneq   r4, #8
        beq     LCZD15
        mov     r0, r10
        mov     r1, r7
        mov     r2, r6
        bl      _ippsCopy_32f
        add     r0, r7, r6, lsl #2
        sub     r1, r8, r6
        bl      _ippsZero_32f
        ldr     r2, [sp, #0x38]
        ldr     r3, [sp, #0x24]
        mov     r0, r7
        mov     r1, r7
        bl      _ippsFFTFwd_RToPack_32f
        mov     r4, r0
        cmp     r4, #0
        blt     LCZD15
        mov     r2, r8
        mov     r0, r7
        mov     r1, r7
        bl      _ippsMulPackConj_32f_I
        ldr     r2, [sp, #0x38]
        ldr     r3, [sp, #0x24]
        mov     r0, r7
        mov     r1, r7
        bl      _ippsFFTInv_PackToR_32f
        mov     r4, r0
        cmp     r4, #0
        blt     LCZD15
        mov     r2, r11
        mov     r1, r5
        mov     r0, r7
        bl      _ippsCopy_32f
        cmp     r11, r9
        bge     LCZD15
        sub     r1, r9, r11
        add     r0, r5, r11, lsl #2
        bl      _ippsZero_32f
LCZD15:
        ldr     r0, [sp, #0x38]
        bl      _ippsFFTFree_R_32f
        mov     r0, r7
        bl      _ippsFree
        ldr     r0, [sp, #0x24]
        bl      _ippsFree
        mov     r0, r4
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LCZD16:
        mvn     r0, #5
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LCZD17:
        mvn     r0, #7
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
        .long   LCZD__2il0floatpacket.1


        .data
        .align  4


LCZD__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


