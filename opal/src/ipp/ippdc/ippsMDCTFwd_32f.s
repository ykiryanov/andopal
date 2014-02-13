        .text
        .align  4
        .globl  _ippsMDCTFwd_32f


_ippsMDCTFwd_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x44
        mov     r7, r2
        cmp     r7, #0
        mov     r8, r0
        mov     r5, r1
        mov     r6, r3
        beq     LGED18
        ldr     r12, [r7]
        cmp     r12, #0x37
        beq     LGED0
        mvn     r0, #0x10
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LGED0:
        cmp     r8, #0
        beq     LGED18
        cmp     r5, #0
        beq     LGED18
        cmp     r6, #0
        beq     LGED17
        and     r12, r6, #0x1F
        rsb     r12, r12, #0x20
        and     r12, r12, #0x1F
        add     r4, r6, r12
LGED1:
        ldr     r10, [r7, #4]
        ldr     r12, [r7, #0x14]
        mov     r11, #0
        mov     lr, r10, asr #1
        sub     r9, r10, #1
        tst     r9, r10
        add     lr, r10, lr, lsr #30
        mov     r0, #1
        mov     r9, lr, asr #2
        add     r1, r9, #1
        bne     LGED7
        cmp     r1, #0
        movlt   r11, r0
        add     r11, r9, r11
        add     r11, r11, #1
        mov     r0, r11, asr #1
        cmp     r0, #0
        ble     LGED3
        sub     r1, r10, r9
        sub     r11, r1, #1
        add     r3, r8, r9, lsl #2
        add     r11, r8, r11, lsl #2
        str     r3, [sp, #0x38]
        add     r3, r12, #4
        str     r11, [sp, #0x2C]
        sub     r11, r9, #1
        str     r3, [sp, #0x3C]
        add     r1, r8, r1, lsl #2
        str     r1, [sp, #0x34]
        add     r3, r8, r11, lsl #2
        str     r9, [sp, #0xC]
        str     r7, [sp, #0x20]
        str     r8, [sp, #0x28]
        ldr     r7, [sp, #0x3C]
        ldr     r8, [sp, #0x38]
        ldr     r9, [sp, #0x34]
        mov     r2, #0
        sub     r11, r4, #4
        mov     r1, r2
        str     r11, [sp, #0x30]
        str     r6, [sp, #0x1C]
        str     r5, [sp, #0x24]
        mov     r11, r12
        str     r3, [sp, #8]
        str     r4, [sp, #4]
        str     r0, [sp]
        str     lr, [sp, #0x10]
        str     r12, [sp, #0x14]
        str     r10, [sp, #0x18]
        mov     r5, r1
        mov     r6, r2
LGED2:
        ldr     r0, [r9], #8
        ldr     r3, [sp, #0x2C]
        rsb     r10, r6, #0
        eor     r0, r0, #2, 2
        ldr     r1, [r3, +r10, lsl #2]
        add     r6, r6, #2
        bl      __subsf3
        ldr     r3, [sp, #8]
        ldr     r1, [r8], #8
        mov     r4, r0
        ldr     r10, [r3, +r10, lsl #2]
        mov     r0, r10
        bl      __subsf3
        ldr     r1, [r7]
        mov     r10, r0
        mov     r0, r4
        bl      __mulsf3
        ldr     r1, [r11]
        str     r0, [sp, #0x40]
        mov     r0, r10
        bl      __mulsf3
        ldr     r1, [sp, #0x40]
        bl      __addsf3
        ldr     r3, [sp, #4]
        str     r0, [r3, +r5, lsl #3]
        ldr     r1, [r7], #8
        mov     r0, r10
        bl      __mulsf3
        ldr     r1, [r11], #8
        mov     r10, r0
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r10
        bl      __subsf3
        ldr     r3, [sp, #0x30]
        add     r5, r5, #1
        str     r0, [r3, #8]!
        ldr     r0, [sp]
        str     r3, [sp, #0x30]
        cmp     r5, r0
        blt     LGED2
        ldr     r4, [sp, #4]
        ldr     r0, [sp]
        ldr     r9, [sp, #0xC]
        ldr     lr, [sp, #0x10]
        ldr     r12, [sp, #0x14]
        ldr     r10, [sp, #0x18]
        ldr     r6, [sp, #0x1C]
        ldr     r7, [sp, #0x20]
        ldr     r5, [sp, #0x24]
        ldr     r8, [sp, #0x28]
LGED3:
        cmp     r0, r9
        bge     LGED5
        add     r11, r12, r0, lsl #3
        sub     r12, r10, r9
        sub     r2, r12, #1
        add     r12, r10, r9
        sub     r12, r12, #1
        rsb     r1, r9, #0
        add     r12, r8, r12, lsl #2
        add     r2, r8, r2, lsl #2
        add     r1, r8, r1, lsl #2
        str     r12, [sp, #0x30]
        mov     r12, r0, lsl #3
        add     r8, r8, r9, lsl #2
        str     r2, [sp, #0x2C]
        add     r2, r8, r0, lsl #3
        sub     r12, r12, #4
        mov     r8, #4
        add     r1, r1, r0, lsl #3
        mov     r3, r0, lsl #1
        add     r12, r12, r4
        str     r9, [sp, #0xC]
        str     r6, [sp, #0x1C]
        str     r7, [sp, #0x20]
        str     r5, [sp, #0x24]
        add     r8, r8, r11
        str     r12, [sp, #0x28]
        str     r4, [sp, #4]
        str     lr, [sp, #0x10]
        str     r10, [sp, #0x18]
        mov     r6, r0
        mov     r5, r1
        mov     r7, r2
        mov     r9, r3
LGED4:
        ldr     r0, [r5], #8
        ldr     r12, [sp, #0x2C]
        rsb     r10, r9, #0
        ldr     r1, [r12, +r10, lsl #2]
        add     r9, r9, #2
        bl      __subsf3
        ldr     r12, [sp, #0x30]
        ldr     r1, [r7], #8
        mov     r4, r0
        ldr     r10, [r12, +r10, lsl #2]
        eor     r0, r10, #2, 2
        bl      __subsf3
        ldr     r1, [r8]
        mov     r10, r0
        mov     r0, r4
        bl      __mulsf3
        ldr     r1, [r11]
        str     r0, [sp, #0x40]
        mov     r0, r10
        bl      __mulsf3
        ldr     r1, [sp, #0x40]
        bl      __addsf3
        ldr     r12, [sp, #4]
        str     r0, [r12, +r6, lsl #3]
        ldr     r1, [r8], #8
        mov     r0, r10
        add     r6, r6, #1
        bl      __mulsf3
        ldr     r1, [r11], #8
        mov     r10, r0
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r10
        bl      __subsf3
        ldr     r12, [sp, #0x28]
        str     r0, [r12, #8]!
        str     r12, [sp, #0x28]
        ldr     r12, [sp, #0xC]
        cmp     r6, r12
        blt     LGED4
        ldr     r4, [sp, #4]
        ldr     r9, [sp, #0xC]
        ldr     lr, [sp, #0x10]
        ldr     r10, [sp, #0x18]
        ldr     r6, [sp, #0x1C]
        ldr     r7, [sp, #0x20]
        ldr     r5, [sp, #0x24]
LGED5:
        ldr     r2, [r7, #0x18]
        mvn     r12, #0xE, 2
        and     lr, lr, r12
        mov     r0, r4
        add     r3, r4, lr, lsl #1
        mov     r1, r4
        bl      _ippsFFTFwd_CToC_32fc
        mov     r8, r0
        cmp     r8, #0
        bne     LGED14
        ldr     r0, [r7, #0x14]
        cmp     r10, #0
        mov     r1, #0
        mov     r2, r1
        mov     r12, #1
        movlt   r2, r12
        add     r2, r10, r2
        cmp     r9, #0
        mov     r2, r2, asr #1
        ble     LGED14
        sub     r2, r2, #1
        str     r8, [sp, #0x3C]
        add     r2, r5, r2, lsl #2
        str     r6, [sp, #0x1C]
        mov     r10, r1
        add     r11, r0, #4
        sub     r7, r4, #4
        str     r2, [sp, #0x38]
        str     r4, [sp, #4]
        str     r9, [sp, #0xC]
        mov     r8, r0
        mov     r6, r1
LGED6:
        ldr     r2, [sp, #4]
        ldr     r1, [r11]
        ldr     r4, [r7, #8]!
        ldr     r9, [r2, +r10, lsl #3]
        add     r10, r10, #1
        mov     r0, r9
        bl      __mulsf3
        str     r0, [sp, #0x40]
        ldr     r1, [r8]
        rsb     r2, r6, #0
        mov     r0, r4
        str     r2, [sp, #0x34]
        bl      __mulsf3
        ldr     r1, [sp, #0x40]
        bl      __addsf3
        str     r0, [r5], #8
        ldr     r1, [r8], #8
        mov     r0, r9
        add     r6, r6, #2
        bl      __mulsf3
        ldr     r1, [r11], #8
        mov     r9, r0
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r9
        bl      __subsf3
        ldr     r2, [sp, #0x38]
        ldr     r3, [sp, #0x34]
        str     r0, [r2, +r3, lsl #2]
        ldr     r2, [sp, #0xC]
        cmp     r10, r2
        blt     LGED6
        ldr     r8, [sp, #0x3C]
        ldr     r4, [sp, #4]
        ldr     r6, [sp, #0x1C]
        b       LGED14
LGED7:
        cmp     r1, #0
        movlt   r11, r0
        add     r11, r9, r11
        add     lr, r11, #1
        mov     r0, lr, asr #1
        cmp     r0, #0
        ble     LGED9
        sub     r11, r10, r9
        sub     lr, r11, #1
        mov     r3, #0
        add     lr, r8, lr, lsl #2
        str     lr, [sp, #0x30]
        sub     lr, r9, #1
        add     r1, r8, r11, lsl #2
        add     lr, r8, lr, lsl #2
        str     lr, [sp, #0x2C]
        add     lr, r12, #4
        str     lr, [sp, #0x34]
        add     r11, r8, r9, lsl #2
        str     r12, [sp, #0x10]
        str     r9, [sp, #0xC]
        str     r8, [sp, #0x28]
        ldr     r9, [sp, #0x10]
        ldr     r8, [sp, #0x34]
        mov     r2, r3
        sub     lr, r4, #4
        str     r6, [sp, #0x1C]
        str     r7, [sp, #0x20]
        str     r5, [sp, #0x24]
        str     lr, [sp, #0x3C]
        str     r0, [sp, #8]
        str     r4, [sp, #4]
        str     r12, [sp, #0x14]
        str     r10, [sp, #0x18]
        mov     r5, r1
        mov     r6, r2
        mov     r7, r3
LGED8:
        ldr     r0, [r5], #8
        ldr     r12, [sp, #0x30]
        rsb     r10, r7, #0
        eor     r0, r0, #2, 2
        ldr     r1, [r12, +r10, lsl #2]
        add     r7, r7, #2
        bl      __subsf3
        ldr     r12, [sp, #0x2C]
        ldr     r1, [r11], #8
        mov     r4, r0
        ldr     r10, [r12, +r10, lsl #2]
        mov     r0, r10
        bl      __subsf3
        ldr     r1, [r8]
        mov     r10, r0
        mov     r0, r4
        bl      __mulsf3
        ldr     r1, [r9]
        str     r0, [sp, #0x40]
        mov     r0, r10
        bl      __mulsf3
        ldr     r1, [sp, #0x40]
        bl      __addsf3
        ldr     r12, [sp, #4]
        str     r0, [r12, +r6, lsl #3]
        ldr     r1, [r8], #8
        mov     r0, r10
        bl      __mulsf3
        ldr     r1, [r9], #8
        mov     r10, r0
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r10
        bl      __subsf3
        ldr     r12, [sp, #0x3C]
        add     r6, r6, #1
        str     r0, [r12, #8]!
        ldr     r0, [sp, #8]
        str     r12, [sp, #0x3C]
        cmp     r6, r0
        blt     LGED8
        ldr     r0, [sp, #8]
        ldr     r4, [sp, #4]
        ldr     r9, [sp, #0xC]
        ldr     r12, [sp, #0x14]
        ldr     r10, [sp, #0x18]
        ldr     r6, [sp, #0x1C]
        ldr     r7, [sp, #0x20]
        ldr     r5, [sp, #0x24]
        ldr     r8, [sp, #0x28]
LGED9:
        cmp     r0, r9
        bge     LGED11
        rsb     r11, r9, #0
        sub     lr, r10, r9
        add     r11, r8, r11, lsl #2
        add     r11, r11, r0, lsl #3
        str     r11, [sp, #0x30]
        add     r11, r12, r0, lsl #3
        add     r12, r10, r9
        sub     lr, lr, #1
        sub     r12, r12, #1
        mov     r1, r0, lsl #3
        add     lr, r8, lr, lsl #2
        add     r12, r8, r12, lsl #2
        sub     r1, r1, #4
        add     r8, r8, r9, lsl #2
        add     r3, r1, r4
        add     r1, r8, r0, lsl #3
        str     r9, [sp, #0xC]
        ldr     r9, [sp, #0x30]
        mov     r8, #4
        mov     r2, r0, lsl #1
        str     r6, [sp, #0x1C]
        str     r7, [sp, #0x20]
        str     r5, [sp, #0x24]
        add     r8, r8, r11
        str     r3, [sp, #0x34]
        str     r12, [sp, #0x38]
        str     lr, [sp, #0x3C]
        str     r4, [sp, #4]
        str     r10, [sp, #0x18]
        mov     r5, r0
        mov     r6, r1
        mov     r7, r2
LGED10:
        ldr     r3, [sp, #0x3C]
        ldr     r0, [r9], #8
        rsb     r10, r7, #0
        ldr     r1, [r3, +r10, lsl #2]
        add     r7, r7, #2
        bl      __subsf3
        ldr     r3, [sp, #0x38]
        ldr     r1, [r6], #8
        mov     r4, r0
        ldr     r10, [r3, +r10, lsl #2]
        eor     r0, r10, #2, 2
        bl      __subsf3
        ldr     r1, [r8]
        mov     r10, r0
        mov     r0, r4
        bl      __mulsf3
        str     r0, [sp, #0x40]
        ldr     r1, [r11]
        mov     r0, r10
        bl      __mulsf3
        ldr     r1, [sp, #0x40]
        bl      __addsf3
        ldr     r3, [sp, #4]
        str     r0, [r3, +r5, lsl #3]
        ldr     r1, [r8], #8
        mov     r0, r10
        bl      __mulsf3
        ldr     r1, [r11], #8
        mov     r10, r0
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r10
        bl      __subsf3
        ldr     r3, [sp, #0x34]
        add     r5, r5, #1
        str     r0, [r3, #8]!
        str     r3, [sp, #0x34]
        ldr     r3, [sp, #0xC]
        cmp     r5, r3
        blt     LGED10
        ldr     r4, [sp, #4]
        ldr     r9, [sp, #0xC]
        ldr     r10, [sp, #0x18]
        ldr     r6, [sp, #0x1C]
        ldr     r7, [sp, #0x20]
        ldr     r5, [sp, #0x24]
LGED11:
        cmp     r10, #0xC
        beq     LGED16
        mov     r0, r4
        bl      LGED_dft9
LGED12:
        ldr     r0, [r7, #0x14]
        cmp     r10, #0
        mov     r8, #0
        mov     r2, r8
        mov     r12, #1
        movlt   r2, r12
        add     r2, r10, r2
        cmp     r9, #0
        mov     r2, r2, asr #1
        ble     LGED14
        sub     r2, r2, #1
        mov     r1, r8
        add     r2, r5, r2, lsl #2
        str     r8, [sp, #0x3C]
        str     r6, [sp, #0x1C]
        add     r11, r0, #4
        sub     r10, r4, #4
        mov     r7, r1
        str     r2, [sp, #0x38]
        str     r4, [sp, #4]
        str     r9, [sp, #0xC]
        mov     r8, r0
        mov     r6, r1
LGED13:
        ldr     r2, [sp, #4]
        ldr     r1, [r11]
        ldr     r4, [r10, #8]!
        ldr     r9, [r2, +r6, lsl #3]
        add     r6, r6, #1
        mov     r0, r9
        bl      __mulsf3
        str     r0, [sp, #0x40]
        ldr     r1, [r8]
        rsb     r2, r7, #0
        mov     r0, r4
        str     r2, [sp, #0x34]
        bl      __mulsf3
        ldr     r1, [sp, #0x40]
        bl      __addsf3
        str     r0, [r5], #8
        ldr     r1, [r8], #8
        mov     r0, r9
        add     r7, r7, #2
        bl      __mulsf3
        ldr     r1, [r11], #8
        mov     r9, r0
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r9
        bl      __subsf3
        ldr     r2, [sp, #0x38]
        ldr     r3, [sp, #0x34]
        str     r0, [r2, +r3, lsl #2]
        ldr     r2, [sp, #0xC]
        cmp     r6, r2
        blt     LGED13
        ldr     r8, [sp, #0x3C]
        ldr     r4, [sp, #4]
        ldr     r6, [sp, #0x1C]
LGED14:
        cmp     r6, #0
        beq     LGED15
        mov     r0, r8
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LGED15:
        mov     r0, r4
        bl      _ippsFree
        mov     r0, r8
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LGED16:
        mov     r0, r4
        bl      LGED_dft3
        b       LGED12
LGED17:
        ldr     r0, [r7, #8]
        bl      _ippsMalloc_8u
        mov     r4, r0
        cmp     r4, #0
        bne     LGED1
        mvn     r0, #8
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LGED18:
        mvn     r0, #7
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LGED_dft9:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x44
        mov     r11, r0
        ldr     r4, [r11, #0x18]
        ldr     r5, [r11, #0x30]
        mov     r0, r4
        mov     r1, r5
        bl      __addsf3
        str     r0, [sp]
        mov     r0, r4
        mov     r1, r5
        bl      __subsf3
        str     r0, [sp, #4]
        ldr     r5, [r11, #0x34]
        ldr     r4, [r11, #0x1C]
        mov     r1, r5
        mov     r0, r4
        bl      __addsf3
        mov     r6, r0
        mov     r1, r5
        mov     r0, r4
        bl      __subsf3
        ldr     r3, [r11]
        ldr     r2, [pc, #0x860]
        mov     r5, r0
        ldr     r0, [sp]
        str     r3, [sp, #8]
        ldr     r4, [r2]
        mov     r1, r4
        bl      __mulsf3
        ldr     r1, [sp, #8]
        bl      __addsf3
        ldr     r2, [r11, #4]
        mov     r7, r0
        mov     r0, r6
        mov     r1, r4
        str     r2, [sp, #0xC]
        bl      __mulsf3
        ldr     r1, [sp, #0xC]
        bl      __addsf3
        ldr     r2, [pc, #0x820]
        mov     r8, r0
        mov     r0, r5
        ldr     r5, [r2]
        mov     r1, r5
        bl      __mulsf3
        mov     r9, r0
        ldr     r0, [sp, #4]
        mov     r1, r5
        bl      __mulsf3
        ldr     r1, [sp, #8]
        mov     r10, r0
        ldr     r0, [sp]
        bl      __addsf3
        str     r0, [sp, #8]
        ldr     r0, [sp, #0xC]
        mov     r1, r6
        bl      __addsf3
        str     r0, [sp, #0xC]
        mov     r0, r7
        mov     r1, r9
        bl      __subsf3
        str     r0, [sp, #4]
        mov     r1, r10
        mov     r0, r8
        bl      __addsf3
        str     r0, [sp]
        mov     r1, r9
        mov     r0, r7
        bl      __addsf3
        str     r0, [sp, #0x10]
        mov     r0, r8
        mov     r1, r10
        bl      __subsf3
        ldr     r7, [r11, #0x38]
        ldr     r6, [r11, #0x20]
        str     r0, [sp, #0x14]
        mov     r1, r7
        mov     r0, r6
        bl      __addsf3
        str     r0, [sp, #0x18]
        mov     r1, r7
        mov     r0, r6
        bl      __subsf3
        str     r0, [sp, #0x1C]
        ldr     r7, [r11, #0x24]
        ldr     r6, [r11, #0x3C]
        mov     r0, r7
        mov     r1, r6
        bl      __addsf3
        str     r0, [sp, #0x20]
        mov     r1, r6
        mov     r0, r7
        bl      __subsf3
        mov     r9, r0
        ldr     r2, [r11, #8]
        ldr     r0, [sp, #0x18]
        mov     r1, r4
        str     r2, [sp, #0x24]
        bl      __mulsf3
        ldr     r1, [sp, #0x24]
        bl      __addsf3
        ldr     r8, [r11, #0xC]
        mov     r6, r0
        ldr     r0, [sp, #0x20]
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        mov     r7, r0
        mov     r1, r5
        mov     r0, r9
        bl      __mulsf3
        mov     r9, r0
        ldr     r0, [sp, #0x1C]
        mov     r1, r5
        bl      __mulsf3
        mov     r10, r0
        ldr     r1, [sp, #0x18]
        ldr     r0, [sp, #0x24]
        bl      __addsf3
        ldr     r1, [sp, #0x20]
        str     r0, [sp, #0x24]
        mov     r0, r8
        bl      __addsf3
        str     r0, [sp, #0x20]
        mov     r1, r9
        mov     r0, r6
        bl      __subsf3
        str     r0, [sp, #0x1C]
        mov     r0, r7
        mov     r1, r10
        bl      __addsf3
        str     r0, [sp, #0x18]
        mov     r1, r9
        mov     r0, r6
        bl      __addsf3
        str     r0, [sp, #0x28]
        mov     r0, r7
        mov     r1, r10
        bl      __subsf3
        ldr     r7, [r11, #0x40]
        ldr     r6, [r11, #0x28]
        str     r0, [sp, #0x2C]
        mov     r1, r7
        mov     r0, r6
        bl      __addsf3
        mov     r9, r0
        mov     r0, r6
        mov     r1, r7
        bl      __subsf3
        ldr     r8, [r11, #0x44]
        ldr     r7, [r11, #0x2C]
        str     r0, [sp, #0x30]
        mov     r1, r8
        mov     r0, r7
        bl      __addsf3
        mov     r6, r0
        mov     r0, r7
        mov     r1, r8
        bl      __subsf3
        ldr     r10, [r11, #0x10]
        str     r0, [sp, #0x34]
        mov     r1, r4
        mov     r0, r9
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r8, [r11, #0x14]
        str     r0, [sp, #0x38]
        mov     r1, r4
        mov     r0, r6
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        mov     r7, r0
        ldr     r0, [sp, #0x34]
        mov     r1, r5
        bl      __mulsf3
        str     r0, [sp, #0x34]
        ldr     r0, [sp, #0x30]
        mov     r1, r5
        bl      __mulsf3
        str     r0, [sp, #0x30]
        mov     r1, r9
        mov     r0, r10
        bl      __addsf3
        mov     r9, r0
        mov     r0, r8
        mov     r1, r6
        bl      __addsf3
        mov     r6, r0
        ldr     r1, [sp, #0x34]
        ldr     r0, [sp, #0x38]
        bl      __subsf3
        ldr     r1, [sp, #0x30]
        str     r0, [sp, #0x3C]
        mov     r0, r7
        bl      __addsf3
        ldr     r1, [sp, #0x34]
        str     r0, [sp, #0x40]
        ldr     r0, [sp, #0x38]
        bl      __addsf3
        ldr     r1, [sp, #0x30]
        str     r0, [sp, #0x38]
        mov     r0, r7
        bl      __subsf3
        str     r0, [sp, #0x34]
        ldr     r0, [sp, #0x24]
        mov     r1, r9
        bl      __addsf3
        str     r0, [sp, #0x30]
        ldr     r0, [sp, #0x24]
        mov     r1, r9
        bl      __subsf3
        str     r0, [sp, #0x24]
        ldr     r0, [sp, #0x20]
        mov     r1, r6
        bl      __addsf3
        mov     r8, r0
        ldr     r0, [sp, #0x20]
        mov     r1, r6
        bl      __subsf3
        mov     r9, r0
        ldr     r0, [sp, #0x30]
        mov     r1, r4
        bl      __mulsf3
        ldr     r1, [sp, #8]
        bl      __addsf3
        mov     r6, r0
        mov     r1, r4
        mov     r0, r8
        bl      __mulsf3
        ldr     r1, [sp, #0xC]
        bl      __addsf3
        mov     r7, r0
        mov     r1, r5
        mov     r0, r9
        bl      __mulsf3
        mov     r9, r0
        ldr     r0, [sp, #0x24]
        mov     r1, r5
        bl      __mulsf3
        mov     r10, r0
        ldr     r0, [sp, #0x30]
        ldr     r1, [sp, #8]
        bl      __addsf3
        str     r0, [r11]
        ldr     r1, [sp, #0xC]
        mov     r0, r8
        bl      __addsf3
        str     r0, [r11, #4]
        mov     r1, r9
        mov     r0, r6
        bl      __subsf3
        str     r0, [r11, #0x18]
        mov     r1, r10
        mov     r0, r7
        bl      __addsf3
        str     r0, [r11, #0x1C]
        mov     r0, r6
        mov     r1, r9
        bl      __addsf3
        str     r0, [r11, #0x30]
        mov     r1, r10
        mov     r0, r7
        bl      __subsf3
        ldr     r3, [pc, #0x498]
        ldr     r2, [pc, #0x498]
        ldr     r7, [r3]
        str     r0, [r11, #0x34]
        ldr     r0, [sp, #0x1C]
        ldr     r6, [r2]
        mov     r1, r7
        bl      __mulsf3
        mov     r8, r0
        ldr     r0, [sp, #0x18]
        mov     r1, r6
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r8
        bl      __subsf3
        mov     r8, r0
        ldr     r0, [sp, #0x1C]
        mov     r1, r6
        bl      __mulsf3
        mov     r6, r0
        ldr     r0, [sp, #0x18]
        mov     r1, r7
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        ldr     r3, [pc, #0x43C]
        ldr     r2, [pc, #0x43C]
        mov     r9, r0
        ldr     r0, [sp, #0x3C]
        ldr     r6, [r3]
        ldr     r7, [r2]
        mov     r1, r6
        bl      __mulsf3
        mov     r10, r0
        ldr     r0, [sp, #0x40]
        mov     r1, r7
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r10
        bl      __subsf3
        str     r0, [sp, #0x30]
        ldr     r0, [sp, #0x3C]
        mov     r1, r7
        bl      __mulsf3
        mov     r10, r0
        ldr     r0, [sp, #0x40]
        mov     r1, r6
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r1, [sp, #0x30]
        mov     r10, r0
        mov     r0, r8
        bl      __addsf3
        ldr     r1, [sp, #0x30]
        str     r0, [sp, #0x40]
        mov     r0, r8
        bl      __subsf3
        str     r0, [sp, #0x3C]
        mov     r0, r9
        mov     r1, r10
        bl      __addsf3
        str     r0, [sp, #0x30]
        mov     r0, r9
        mov     r1, r10
        bl      __subsf3
        mov     r9, r0
        ldr     r0, [sp, #0x40]
        mov     r1, r4
        bl      __mulsf3
        ldr     r1, [sp, #4]
        bl      __addsf3
        mov     r8, r0
        ldr     r0, [sp, #0x30]
        mov     r1, r4
        bl      __mulsf3
        ldr     r1, [sp]
        bl      __addsf3
        str     r0, [sp, #0x24]
        mov     r1, r5
        mov     r0, r9
        bl      __mulsf3
        mov     r9, r0
        ldr     r0, [sp, #0x3C]
        mov     r1, r5
        bl      __mulsf3
        ldr     r1, [sp, #4]
        mov     r10, r0
        ldr     r0, [sp, #0x40]
        bl      __addsf3
        str     r0, [r11, #8]
        ldr     r0, [sp, #0x30]
        ldr     r1, [sp]
        bl      __addsf3
        str     r0, [r11, #0xC]
        mov     r1, r9
        mov     r0, r8
        bl      __subsf3
        str     r0, [r11, #0x20]
        ldr     r0, [sp, #0x24]
        mov     r1, r10
        bl      __addsf3
        str     r0, [r11, #0x24]
        mov     r1, r9
        mov     r0, r8
        bl      __addsf3
        str     r0, [r11, #0x38]
        ldr     r0, [sp, #0x24]
        mov     r1, r10
        bl      __subsf3
        str     r0, [r11, #0x3C]
        ldr     r0, [sp, #0x28]
        mov     r1, r6
        bl      __mulsf3
        mov     r8, r0
        ldr     r0, [sp, #0x2C]
        mov     r1, r7
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r8
        bl      __subsf3
        mov     r8, r0
        ldr     r0, [sp, #0x28]
        mov     r1, r7
        bl      __mulsf3
        mov     r7, r0
        ldr     r0, [sp, #0x2C]
        mov     r1, r6
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        ldr     r3, [pc, #0x29C]
        ldr     r2, [pc, #0x29C]
        mov     r6, r0
        ldr     r9, [r3]
        ldr     r0, [sp, #0x38]
        ldr     r7, [r2]
        mov     r1, r9
        bl      __mulsf3
        mov     r10, r0
        ldr     r0, [sp, #0x34]
        mov     r1, r7
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r10
        bl      __subsf3
        mov     r10, r0
        ldr     r0, [sp, #0x38]
        mov     r1, r7
        bl      __mulsf3
        mov     r7, r0
        ldr     r0, [sp, #0x34]
        mov     r1, r9
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        mov     r7, r0
        mov     r0, r8
        mov     r1, r10
        bl      __addsf3
        mov     r9, r0
        mov     r1, r10
        mov     r0, r8
        bl      __subsf3
        mov     r10, r0
        mov     r1, r7
        mov     r0, r6
        bl      __addsf3
        mov     r8, r0
        mov     r0, r6
        mov     r1, r7
        bl      __subsf3
        mov     r7, r0
        mov     r0, r9
        mov     r1, r4
        bl      __mulsf3
        ldr     r1, [sp, #0x10]
        bl      __addsf3
        mov     r6, r0
        mov     r0, r8
        mov     r1, r4
        bl      __mulsf3
        ldr     r1, [sp, #0x14]
        bl      __addsf3
        mov     r4, r0
        mov     r0, r7
        mov     r1, r5
        bl      __mulsf3
        mov     r7, r0
        mov     r0, r10
        mov     r1, r5
        bl      __mulsf3
        ldr     r1, [sp, #0x10]
        mov     r5, r0
        mov     r0, r9
        bl      __addsf3
        str     r0, [r11, #0x10]
        ldr     r1, [sp, #0x14]
        mov     r0, r8
        bl      __addsf3
        str     r0, [r11, #0x14]
        mov     r0, r6
        mov     r1, r7
        bl      __subsf3
        str     r0, [r11, #0x28]
        mov     r0, r4
        mov     r1, r5
        bl      __addsf3
        str     r0, [r11, #0x2C]
        mov     r0, r6
        mov     r1, r7
        bl      __addsf3
        str     r0, [r11, #0x40]
        mov     r0, r4
        mov     r1, r5
        bl      __subsf3
        str     r0, [r11, #0x44]
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LGED_dft3:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        mov     r11, r0
        ldr     r6, [r11, #0x10]
        ldr     r5, [r11, #8]
        mov     r1, r6
        mov     r0, r5
        bl      __addsf3
        mov     r4, r0
        mov     r1, r6
        mov     r0, r5
        bl      __subsf3
        str     r0, [sp]
        ldr     r7, [r11, #0x14]
        ldr     r6, [r11, #0xC]
        mov     r1, r7
        mov     r0, r6
        bl      __addsf3
        mov     r5, r0
        mov     r0, r6
        mov     r1, r7
        bl      __subsf3
        ldr     r2, [pc, #0xCC]
        ldr     r9, [r11]
        mov     r8, r0
        ldr     r7, [r2]
        mov     r0, r4
        mov     r1, r7
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        ldr     r10, [r11, #4]
        mov     r6, r0
        mov     r1, r7
        mov     r0, r5
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r2, [pc, #0x90]
        mov     r7, r0
        mov     r0, r8
        ldr     r1, [r2]
        str     r1, [sp, #4]
        bl      __mulsf3
        mov     r8, r0
        ldr     r0, [sp]
        ldr     r1, [sp, #4]
        bl      __mulsf3
        str     r0, [sp, #4]
        mov     r0, r4
        mov     r1, r9
        bl      __addsf3
        str     r0, [r11]
        mov     r0, r10
        mov     r1, r5
        bl      __addsf3
        str     r0, [r11, #4]
        mov     r0, r6
        mov     r1, r8
        bl      __subsf3
        str     r0, [r11, #8]
        ldr     r1, [sp, #4]
        mov     r0, r7
        bl      __addsf3
        str     r0, [r11, #0xC]
        mov     r0, r6
        mov     r1, r8
        bl      __addsf3
        str     r0, [r11, #0x10]
        ldr     r1, [sp, #4]
        mov     r0, r7
        bl      __subsf3
        str     r0, [r11, #0x14]
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
        .long   LGED_C_1_3
        .long   LGED_S_1_3
        .long   LGED_C_1_9
        .long   LGED_S_1_9
        .long   LGED_C_2_9
        .long   LGED_S_2_9
        .long   LGED_C_4_9
        .long   LGED_S_4_9


        .data
        .align  4


LGED_C_1_3:
        .byte   0x00,0x00,0x00,0xBF
LGED_S_1_3:
        .byte   0xD7,0xB3,0x5D,0xBF
LGED_C_1_9:
        .byte   0x7D,0x1B,0x44,0x3F
LGED_S_1_9:
        .byte   0xBB,0x8D,0x24,0xBF
LGED_C_2_9:
        .byte   0xD4,0xD0,0x31,0x3E
LGED_S_2_9:
        .byte   0x5C,0x1C,0x7C,0xBF
LGED_C_4_9:
        .byte   0xB2,0x8F,0x70,0xBF
LGED_S_4_9:
        .byte   0x44,0x1D,0xAF,0xBE


