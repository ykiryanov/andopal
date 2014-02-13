        .text
        .align  4
        .globl  _ippsMDCTFwdInit_32f


LGEE_deleteMdctCtx_32f:
        stmdb   sp!, {r4, lr}
        mov     r4, r0
        cmp     r4, #0
        beq     LGEE1
        ldr     r2, [r4, #0x10]
        mov     r1, #0
        str     r1, [r4]
        cmp     r2, #0
        beq     LGEE1
        ldr     r0, [r4, #0x18]
        cmp     r0, #0
        beq     LGEE0
        bl      _ippsFFTFree_C_32fc
LGEE0:
        mov     r0, r4
        ldmia   sp!, {r4, lr}
        b       _ippsFree
LGEE1:
        ldmia   sp!, {r4, pc}
_ippsMDCTFwdInit_32f:
        stmdb   sp!, {r4, r5, lr}
        sub     sp, sp, #0x14
        sub     r12, r1, #1
        tst     r12, r1
        mov     r4, r0
        bne     LGEE3
        cmp     r1, #0x20
        blt     LGEE4
        cmp     r4, #0
        beq     LGEE2
        cmp     r2, #0
        beq     LGEE2
        cmp     r3, #0
        bne     LGEE6
LGEE2:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4, r5, pc}
LGEE3:
        cmp     r1, #0xC
        beq     LGEE5
        cmp     r1, #0x24
        beq     LGEE5
LGEE4:
        mvn     r0, #5
        add     sp, sp, #0x14
        ldmia   sp!, {r4, r5, pc}
LGEE5:
        cmp     r4, #0
        beq     LGEE2
        cmp     r2, #0
        beq     LGEE2
LGEE6:
        ldr     lr, [pc, #0x6D0]
        ldr     r5, [pc, #0x6D0]
        add     r0, sp, #0x10
        mov     r12, #0x37
        str     r12, [sp]
        str     lr, [sp, #8]
        str     r5, [sp, #4]
        bl      LGEE_ownMDCTInit_32f
        cmp     r0, #0
        ldreq   r1, [sp, #0x10]
        streq   r1, [r4]
        add     sp, sp, #0x14
        ldmia   sp!, {r4, r5, pc}
LGEE_ownMDCTInit_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x7C
        mov     r6, r2
        and     r12, r6, #0x1F
        str     r0, [sp, #0x34]
        rsb     r12, r12, #0
        and     r10, r12, #0x1F
        add     r5, r6, r10
        mov     r9, r1
        mov     r1, #0x1C
        mov     r0, r5
        mov     r4, r3
        bl      _ippsZero_8u
        add     lr, r5, #0x1C
        and     r7, lr, #0x1F
        rsb     r7, r7, #0
        sub     r12, r9, #1
        and     r7, r7, #0x1F
        tst     r12, r9
        mov     r8, #0
        mov     r2, r9, asr #1
        add     r7, lr, r7
        mov     r12, #0x37
        str     r8, [sp, #0x78]
        str     r12, [r10, +r6]
        str     r9, [r5, #4]
        str     r8, [r5, #0x10]
        str     r8, [r5, #0x18]
        str     r7, [r5, #0x14]
        add     r2, r9, r2, lsr #30
        movne   r6, r2, asr #2
        movne   r10, r8
        beq     LGEE10
LGEE7:
        ldr     r2, [sp, #0x78]
        str     r10, [r5, #0xC]
        mov     r0, r9
        add     r2, r2, r9, lsl #2
        add     r2, r2, #0x20
        str     r2, [r5, #8]
        bl      __floatsidf
        ldr     r4, [pc, #0x604]
        mov     r3, r1
        ldr     r1, [pc, #0x600]
        mov     r2, r0
        mov     r0, r4
        bl      __divdf3
        cmp     r6, #0
        str     r0, [sp, #0x38]
        mov     r4, r1
        ble     LGEE9
        cmp     r9, #0
        mov     r12, r8
        mov     r2, #1
        movlt   r12, r2
        add     r3, r7, #0x10
        add     r12, r9, r12
        str     r3, [sp, #0x50]
        mov     lr, r12, asr #1
        add     r3, r7, #0x18
        str     r3, [sp, #0x58]
        add     r3, r7, #4
        sub     r2, lr, #6
        sub     r10, lr, #4
        str     r3, [sp, #0x48]
        add     r3, r7, #0xC
        add     r2, r7, r2, lsl #2
        add     r10, r7, r10, lsl #2
        str     r3, [sp, #0x44]
        add     r3, r7, #0x14
        str     r2, [sp, #0x4C]
        str     r10, [sp, #0x54]
        sub     r12, lr, #8
        sub     r2, lr, #2
        sub     r0, lr, #7
        sub     r1, lr, #5
        sub     r10, lr, #3
        sub     r11, lr, #1
        str     r3, [sp, #0x40]
        add     r9, r7, #8
        add     r12, r7, r12, lsl #2
        add     r2, r7, r2, lsl #2
        add     r3, r7, #0x1C
        add     r0, r7, r0, lsl #2
        add     r1, r7, r1, lsl #2
        add     r10, r7, r10, lsl #2
        add     r11, r7, r11, lsl #2
        str     r7, [sp, #8]
        ldr     r7, [sp, #0x38]
        str     r3, [sp, #0x3C]
        str     r11, [sp, #0x28]
        str     r10, [sp, #0x2C]
        str     r1, [sp, #0x24]
        str     r0, [sp, #0x20]
        str     r2, [sp, #0x1C]
        str     r12, [sp, #0x14]
        str     lr, [sp, #0x10]
        str     r9, [sp, #0xC]
        str     r6, [sp, #0x18]
        str     r5, [sp, #0x30]
LGEE8:
        mov     r0, r8, asr #1
        bl      __floatsidf
        mov     r10, r0
        mov     r9, r1
        mov     r2, #0
        mov     r3, #0xFF, 10
        bl      __adddf3
        mov     r2, r7
        mov     r3, r4
        bl      __muldf3
        str     r0, [sp, #0x5C]
        ldr     r0, [sp, #0x5C]
        str     r1, [sp, #0x60]
        bl      sin
        ldr     r6, [pc, #0x4DC]
        ldr     r5, [pc, #0x4D4]
        mov     r2, r6
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r12, [sp, #8]
        mov     r11, #9, 16
        orr     r11, r11, #1, 2
        sub     r1, r11, #0x17, 16
        str     r0, [r12]
        mov     r2, r10
        mov     r0, #0
        mov     r3, r9
        bl      __adddf3
        mov     r2, r7
        mov     r3, r4
        bl      __muldf3
        str     r0, [sp, #0x64]
        ldr     r0, [sp, #0x64]
        str     r1, [sp, #0x68]
        bl      sin
        mov     r2, r6
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r12, [sp, #0xC]
        sub     r1, r11, #2, 14
        str     r0, [r12]
        mov     r2, r10
        mov     r0, #0
        mov     r3, r9
        bl      __adddf3
        mov     r2, r7
        mov     r3, r4
        bl      __muldf3
        str     r0, [sp, #0x6C]
        ldr     r0, [sp, #0x6C]
        str     r1, [sp, #0x70]
        bl      sin
        mov     r2, r6
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r12, [sp, #0x50]
        mov     r1, r11
        str     r0, [r12]
        mov     r0, #0
        mov     r3, r9
        mov     r2, r10
        bl      __adddf3
        mov     r2, r7
        mov     r3, r4
        bl      __muldf3
        mov     r9, r0
        str     r1, [sp, #0x74]
        bl      sin
        mov     r2, r6
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r12, [sp, #0x58]
        str     r0, [r12]
        ldr     r1, [sp, #0x60]
        ldr     r0, [sp, #0x5C]
        bl      cos
        mov     r2, r6
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r12, [sp, #0x48]
        str     r0, [r12]
        ldr     r1, [sp, #0x68]
        ldr     r0, [sp, #0x64]
        bl      cos
        mov     r2, r6
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r12, [sp, #0x44]
        str     r0, [r12]
        ldr     r1, [sp, #0x70]
        ldr     r0, [sp, #0x6C]
        bl      cos
        mov     r2, r6
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r12, [sp, #0x40]
        str     r0, [r12]
        ldr     r1, [sp, #0x74]
        mov     r0, r9
        rsb     r9, r8, #0
        bl      cos
        mov     r2, r6
        mov     r3, r5
        bl      __muldf3
        ldr     r12, [sp, #0x10]
        sub     r10, r12, r8
        bl      __truncdfsf2
        ldr     lr, [sp, #0x3C]
        sub     r12, r10, #8
        sub     r11, r10, #2
        str     r0, [lr]
        mov     r0, r12, asr #1
        bl      __floatsidf
        mov     r2, #0
        mov     r3, #0xFF, 10
        bl      __adddf3
        mov     r2, r7
        mov     r3, r4
        bl      __muldf3
        bl      sin
        mov     r2, r6
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        ldr     lr, [sp, #0x14]
        sub     r12, r10, #6
        str     r0, [lr, +r9, lsl #2]
        mov     r0, r12, asr #1
        bl      __floatsidf
        mov     r2, #0
        mov     r3, #0xFF, 10
        bl      __adddf3
        mov     r2, r7
        mov     r3, r4
        bl      __muldf3
        bl      sin
        mov     r2, r6
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        ldr     lr, [sp, #0x4C]
        sub     r12, r10, #4
        str     r0, [lr, +r9, lsl #2]
        mov     r11, r11, asr #1
        mov     r0, r12, asr #1
        bl      __floatsidf
        mov     r2, #0
        mov     r3, #0xFF, 10
        bl      __adddf3
        mov     r2, r7
        mov     r3, r4
        bl      __muldf3
        bl      sin
        mov     r2, r6
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r12, [sp, #0x54]
        add     r8, r8, #8
        str     r0, [r12, +r9, lsl #2]
        mov     r0, r11
        bl      __floatsidf
        mov     r2, #0
        mov     r3, #0xFF, 10
        bl      __adddf3
        mov     r2, r7
        mov     r3, r4
        bl      __muldf3
        bl      sin
        mov     r2, r6
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        ldr     lr, [sp, #0x1C]
        sub     r12, r10, #7
        str     r0, [lr, +r9, lsl #2]
        sub     r11, r10, #3
        mov     r0, r12, asr #1
        bl      __floatsidf
        mov     r2, #0
        mov     r3, #0xFF, 10
        bl      __adddf3
        mov     r2, r7
        mov     r3, r4
        bl      __muldf3
        bl      cos
        mov     r2, r6
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        ldr     lr, [sp, #0x20]
        sub     r12, r10, #5
        str     r0, [lr, +r9, lsl #2]
        mov     r0, r12, asr #1
        bl      __floatsidf
        mov     r2, #0
        mov     r3, #0xFF, 10
        bl      __adddf3
        mov     r2, r7
        mov     r3, r4
        bl      __muldf3
        bl      cos
        mov     r2, r6
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r12, [sp, #0x24]
        mov     r11, r11, asr #1
        str     r0, [r12, +r9, lsl #2]
        mov     r0, r11
        bl      __floatsidf
        mov     r2, #0
        mov     r3, #0xFF, 10
        bl      __adddf3
        mov     r2, r7
        mov     r3, r4
        bl      __muldf3
        bl      cos
        mov     r2, r6
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r12, [sp, #0x2C]
        sub     r10, r10, #1
        str     r0, [r12, +r9, lsl #2]
        mov     r0, r10, asr #1
        bl      __floatsidf
        mov     r2, #0
        mov     r3, #0xFF, 10
        bl      __adddf3
        mov     r2, r7
        mov     r3, r4
        bl      __muldf3
        bl      cos
        mov     r2, r6
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r12, [sp, #0x18]
        cmp     r8, r12
        ldr     r12, [sp, #8]
        add     r12, r12, #0x20
        str     r12, [sp, #8]
        ldr     r12, [sp, #0xC]
        add     r12, r12, #0x20
        str     r12, [sp, #0xC]
        ldr     r12, [sp, #0x50]
        add     r12, r12, #0x20
        str     r12, [sp, #0x50]
        ldr     r12, [sp, #0x58]
        add     r12, r12, #0x20
        str     r12, [sp, #0x58]
        ldr     r12, [sp, #0x48]
        add     r12, r12, #0x20
        str     r12, [sp, #0x48]
        ldr     r12, [sp, #0x44]
        add     r12, r12, #0x20
        str     r12, [sp, #0x44]
        ldr     r12, [sp, #0x40]
        add     r12, r12, #0x20
        str     r12, [sp, #0x40]
        ldr     r12, [sp, #0x3C]
        add     r12, r12, #0x20
        str     r12, [sp, #0x3C]
        ldr     r12, [sp, #0x28]
        str     r0, [r12, +r9, lsl #2]
        blt     LGEE8
        ldr     r5, [sp, #0x30]
LGEE9:
        ldr     r1, [sp, #0x34]
        mov     r0, #0
        str     r5, [r1]
        add     sp, sp, #0x7C
        ldmia   sp!, {r4 - r11, pc}
LGEE10:
        mov     r6, r2, asr #2
        cmp     r6, #1
        movle   r10, r8
        ble     LGEE12
        mov     r10, r8
        mov     r2, #1
LGEE11:
        mov     r2, r2, lsl #1
        cmp     r2, r6
        add     r10, r10, #1
        blt     LGEE11
LGEE12:
        cmp     r9, #0
        mov     r3, r8
        mov     r2, #1
        movlt   r3, r2
        add     r2, r9, r3
        str     r4, [sp, #4]
        mov     r2, r2, asr #1
        add     r2, r2, #0x1F
        mvn     r3, #0x7F, 2
        and     r2, r2, r3
        add     r0, r5, #0x18
        add     r2, r7, r2, lsl #2
        str     r2, [sp]
        mov     r3, #0
        mov     r2, #8
        mov     r1, r10
        bl      _ippsFFTInit_C_32fc
        mov     r4, r0
        cmp     r4, #0
        beq     LGEE13
        mov     r0, r5
        bl      LGEE_deleteMdctCtx_32f
        mov     r0, r4
        add     sp, sp, #0x7C
        ldmia   sp!, {r4 - r11, pc}
LGEE13:
        ldr     r0, [r5, #0x18]
        add     r1, sp, #0x78
        bl      _ippsFFTGetBufSize_C_32fc
        mov     r4, r0
        cmp     r4, #0
        beq     LGEE7
        mov     r0, r5
        bl      LGEE_deleteMdctCtx_32f
        mov     r0, r4
        add     sp, sp, #0x7C
        ldmia   sp!, {r4 - r11, pc}
        .long   0x3ff6a09e
        .long   0x667f3bcd
        .long   0x54442d18
        .long   0x401921fb


