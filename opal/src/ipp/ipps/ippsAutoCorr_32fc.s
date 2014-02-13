        .text
        .align  4
        .globl  _ippsAutoCorr_32fc


_ippsAutoCorr_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x3C
        mov     r4, r0
        cmp     r4, #0
        mov     r9, r1
        mov     r5, r2
        mov     r10, r3
        beq     LCZC13
        cmp     r5, #0
        beq     LCZC13
        cmp     r9, #0
        ble     LCZC12
        cmp     r10, #0
        ble     LCZC12
        cmp     r9, r10
        mov     r8, r10
        movlt   r8, r9
        cmp     r8, #0x60
        bge     LCZC8
        cmp     r8, r10
        bge     LCZC0
        sub     r1, r10, r8
        add     r0, r5, r8, lsl #3
        bl      _ippsZero_32fc
LCZC0:
        bic     r3, r8, #1
        and     r12, r8, #1
        cmp     r3, #0
        sub     r7, r9, #1
        mov     r8, r4
        mov     r6, r3
        ble     LCZC4
        ldr     lr, [pc, #0x47C]
        ldr     lr, [lr]
        str     r12, [sp]
        str     r3, [sp, #0xC]
        str     lr, [sp, #0x1C]
        str     r9, [sp, #4]
        str     r4, [sp, #0x14]
LCZC1:
        ldr     r4, [sp, #0x1C]
        ldr     r9, [sp, #0x14]
        cmp     r7, #0
        str     r4, [sp, #0x24]
        str     r4, [sp, #0x28]
        str     r4, [sp, #0x30]
        movle   r11, #0
        ble     LCZC3
        add     r0, r8, #0xC
        str     r7, [sp, #0x20]
        mov     r11, #0
        sub     r10, r8, #4
        str     r4, [sp, #0x2C]
        str     r6, [sp, #0x18]
        str     r8, [sp, #8]
        str     r5, [sp, #0x10]
        mov     r7, r0
LCZC2:
        ldr     r1, [sp, #8]
        ldr     r4, [r9]
        ldr     r8, [r10, #8]!
        ldr     r6, [r1, +r11, lsl #3]
        ldr     r5, [r9, #4]
        mov     r0, r4
        add     r11, r11, #1
        mov     r1, r6
        bl      __mulsf3
        ldr     r1, [sp, #0x2C]
        bl      __addsf3
        str     r0, [sp, #0x2C]
        mov     r0, r5
        mov     r1, r8
        bl      __mulsf3
        ldr     r1, [sp, #0x2C]
        bl      __addsf3
        str     r0, [sp, #0x2C]
        mov     r0, r4
        mov     r1, r8
        bl      __mulsf3
        ldr     r1, [sp, #0x28]
        bl      __addsf3
        mov     r8, r0
        mov     r0, r5
        mov     r1, r6
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r8
        bl      __subsf3
        ldr     r6, [r7]
        ldr     r8, [r7, #-4]
        str     r0, [sp, #0x28]
        mov     r0, r4
        mov     r1, r8
        bl      __mulsf3
        ldr     r1, [sp, #0x30]
        bl      __addsf3
        str     r0, [sp, #0x30]
        mov     r0, r5
        mov     r1, r6
        bl      __mulsf3
        ldr     r1, [sp, #0x30]
        bl      __addsf3
        str     r0, [sp, #0x30]
        mov     r0, r4
        mov     r1, r6
        bl      __mulsf3
        ldr     r1, [sp, #0x24]
        bl      __addsf3
        mov     r4, r0
        mov     r0, r5
        mov     r1, r8
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r4
        bl      __subsf3
        ldr     r1, [sp, #0x20]
        str     r0, [sp, #0x24]
        cmp     r11, r1
        add     r7, r7, #8
        add     r9, r9, #8
        blt     LCZC2
        ldr     r4, [sp, #0x2C]
        ldr     r6, [sp, #0x18]
        ldr     r8, [sp, #8]
        ldr     r7, [sp, #0x20]
        ldr     r5, [sp, #0x10]
LCZC3:
        ldr     r0, [r9]
        ldr     r1, [r8, +r11, lsl #3]
        add     r10, r8, r11, lsl #3
        sub     r6, r6, #2
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r1, [r10, #4]
        ldr     r2, [r9, #4]
        mov     r4, r0
        sub     r7, r7, #2
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        str     r0, [r5]
        ldr     r0, [r9]
        ldr     r1, [r10, #4]
        bl      __mulsf3
        ldr     r1, [sp, #0x28]
        bl      __addsf3
        ldr     r1, [r8, +r11, lsl #3]
        ldr     r9, [r9, #4]
        mov     r4, r0
        add     r8, r8, #0x10
        mov     r0, r9
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r4
        bl      __subsf3
        ldr     r3, [sp, #0x30]
        str     r0, [r5, #4]
        str     r3, [r5, #8]
        ldr     r0, [sp, #0x24]
        cmp     r6, #0
        str     r0, [r5, #0xC]
        add     r5, r5, #0x10
        bgt     LCZC1
        ldr     r12, [sp]
        ldr     r3, [sp, #0xC]
        ldr     r9, [sp, #4]
        ldr     r4, [sp, #0x14]
LCZC4:
        cmp     r12, #0
        sub     r3, r9, r3
        mov     r6, #0
        beq     LCZC7
        ldr     r12, [pc, #0x254]
        cmp     r3, #0
        ldr     r7, [r12]
        mov     r9, r7
        ble     LCZC6
        mov     r10, r6
        sub     r12, r8, #4
        str     r6, [sp, #0xC]
        str     r12, [sp]
        str     r3, [sp, #4]
        str     r8, [sp, #8]
        str     r5, [sp, #0x10]
LCZC5:
        ldr     r2, [sp, #8]
        ldr     r11, [r4]
        ldr     r5, [r2, +r10, lsl #3]
        ldr     r2, [sp]
        add     r10, r10, #1
        mov     r1, r5
        mov     r0, r11
        ldr     r8, [r2, #8]!
        str     r2, [sp]
        ldr     r6, [r4, #4]
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        mov     r9, r0
        mov     r0, r6
        mov     r1, r8
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        mov     r9, r0
        mov     r0, r11
        mov     r1, r8
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        mov     r7, r0
        mov     r0, r6
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r7
        bl      __subsf3
        ldr     r2, [sp, #4]
        add     r4, r4, #8
        mov     r7, r0
        cmp     r10, r2
        blt     LCZC5
        ldr     r6, [sp, #0xC]
        ldr     r5, [sp, #0x10]
LCZC6:
        str     r9, [r5]
        str     r7, [r5, #4]
        mov     r0, r6
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LCZC7:
        mov     r0, r6
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LCZC8:
        mov     r12, r9, lsl #1
        cmp     r12, #2
        mov     lr, #1
        movle   r1, #1
        movle   r7, #2
        ble     LCZC10
        mov     r1, #1
LCZC9:
        add     r1, r1, #1
        mov     r7, lr, lsl r1
        cmp     r7, r12
        blt     LCZC9
LCZC10:
        add     r0, sp, #0x38
        mov     r3, #0
        mov     r2, #2
        bl      _ippsFFTInitAlloc_C_32fc
        cmp     r0, #0
        addne   sp, sp, #0x3C
        ldmneia sp!, {r4 - r11, pc}
        ldr     r0, [sp, #0x38]
        add     r1, sp, #0x34
        bl      _ippsFFTGetBufSize_C_32fc
        mov     r6, r0
        cmp     r6, #0
        movlt   r11, #0
        strlt   r11, [sp, #8]
        blt     LCZC11
        ldr     r0, [sp, #0x34]
        mov     r6, r7, lsl #1
        bl      _ippsMalloc_8u
        str     r0, [sp, #8]
        mov     r0, r6
        bl      _ippsMalloc_32fc
        mov     r11, r0
        cmp     r11, #0
        mvneq   r6, #8
        beq     LCZC11
        mov     r0, r4
        mov     r1, r11
        mov     r2, r9
        bl      _ippsCopy_32fc
        add     r0, r11, r9, lsl #3
        sub     r1, r7, r9
        bl      _ippsZero_32fc
        ldr     r2, [sp, #0x38]
        ldr     r3, [sp, #8]
        mov     r0, r11
        mov     r1, r11
        bl      _ippsFFTFwd_CToC_32fc
        mov     r6, r0
        cmp     r6, #0
        blt     LCZC11
        add     r4, r11, r7, lsl #3
        mov     r2, r7
        mov     r1, r4
        mov     r0, r11
        bl      _ippsConj_32fc
        mov     r0, r4
        mov     r2, r7
        mov     r1, r11
        bl      _ippsMul_32fc_I
        ldr     r2, [sp, #0x38]
        ldr     r3, [sp, #8]
        mov     r0, r11
        mov     r1, r11
        bl      _ippsFFTInv_CToC_32fc
        mov     r6, r0
        cmp     r6, #0
        blt     LCZC11
        mov     r2, r8
        mov     r1, r5
        mov     r0, r11
        bl      _ippsCopy_32fc
        cmp     r8, r10
        bge     LCZC11
        sub     r1, r10, r8
        add     r0, r5, r8, lsl #3
        bl      _ippsZero_32fc
LCZC11:
        ldr     r0, [sp, #0x38]
        bl      _ippsFFTFree_C_32fc
        mov     r0, r11
        bl      _ippsFree
        ldr     r0, [sp, #8]
        bl      _ippsFree
        mov     r0, r6
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LCZC12:
        mvn     r0, #5
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LCZC13:
        mvn     r0, #7
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
        .long   LCZC__2il0floatpacket.1


        .data
        .align  4


LCZC__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


