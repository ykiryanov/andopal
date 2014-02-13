        .text
        .align  4
        .globl  _ippsMDCTInvInit_32f


LGDX_deleteMdctCtx_32f:
        stmdb   sp!, {r4, lr}
        mov     r4, r0
        cmp     r4, #0
        beq     LGDX1
        ldr     r2, [r4, #0x10]
        mov     r1, #0
        str     r1, [r4]
        cmp     r2, #0
        beq     LGDX1
        ldr     r0, [r4, #0x18]
        cmp     r0, #0
        beq     LGDX0
        bl      _ippsFFTFree_C_32fc
LGDX0:
        mov     r0, r4
        ldmia   sp!, {r4, lr}
        b       _ippsFree
LGDX1:
        ldmia   sp!, {r4, pc}
_ippsMDCTInvInit_32f:
        stmdb   sp!, {r4 - r7, lr}
        sub     sp, sp, #0x14
        mov     r5, r1
        sub     r12, r5, #1
        tst     r12, r5
        mov     r7, r0
        mov     r6, r2
        mov     r4, r3
        bne     LGDX3
        cmp     r5, #0x20
        blt     LGDX4
        cmp     r7, #0
        beq     LGDX2
        cmp     r6, #0
        beq     LGDX2
        cmp     r4, #0
        bne     LGDX6
LGDX2:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r7, pc}
LGDX3:
        cmp     r5, #0xC
        beq     LGDX5
        cmp     r5, #0x24
        beq     LGDX5
LGDX4:
        mvn     r0, #5
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r7, pc}
LGDX5:
        cmp     r7, #0
        beq     LGDX2
        cmp     r6, #0
        beq     LGDX2
LGDX6:
        mov     lr, #0
        cmp     r5, #0
        mov     r12, #1
        movlt   lr, r12
        add     lr, r5, lr
        mov     r0, lr, asr #1
        bl      __floatsidf
        bl      _sqrt
        mov     r3, r1
        mov     r12, #0xFF, 12
        mov     r2, r0
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __divdf3
        add     r2, sp, #0x10
        str     r0, [sp, #4]
        str     r1, [sp, #8]
        mov     r12, #0x38
        mov     r0, r2
        str     r12, [sp]
        mov     r3, r4
        mov     r2, r6
        mov     r1, r5
        bl      LGDX_ownMDCTInit_32f
        cmp     r0, #0
        ldreq   r1, [sp, #0x10]
        streq   r1, [r7]
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r7, pc}
LGDX_ownMDCTInit_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x84
        ldr     r12, [sp, #0xAC]
        mov     r6, r2
        mov     r9, r1
        str     r12, [sp, #0x3C]
        ldr     r12, [sp, #0xB0]
        str     r0, [sp, #0x34]
        str     r12, [sp, #0x38]
        and     r12, r6, #0x1F
        rsb     r12, r12, #0
        and     r10, r12, #0x1F
        add     r5, r6, r10
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
        mov     r12, #0x38
        str     r9, [r5, #4]
        str     r8, [sp, #0x80]
        str     r8, [r5, #0x10]
        str     r8, [r5, #0x18]
        str     r7, [r5, #0x14]
        str     r12, [r10, +r6]
        add     r2, r9, r2, lsr #30
        movne   r6, r2, asr #2
        movne   r10, r8
        beq     LGDX10
LGDX7:
        ldr     r2, [sp, #0x80]
        str     r10, [r5, #0xC]
        mov     r0, r9
        add     r2, r2, r9, lsl #2
        add     r2, r2, #0x20
        str     r2, [r5, #8]
        bl      __floatsidf
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [pc, #0x5F0]
        ldr     r1, [pc, #0x5F0]
        bl      __divdf3
        cmp     r6, #0
        str     r0, [sp, #0x40]
        mov     r4, r1
        ble     LGDX9
        cmp     r9, #0
        mov     r12, r8
        mov     r2, #1
        movlt   r12, r2
        add     r12, r9, r12
        add     r0, r7, #8
        mov     lr, r12, asr #1
        sub     r2, lr, #6
        sub     r12, lr, #8
        add     r2, r7, r2, lsl #2
        add     r12, r7, r12, lsl #2
        str     r0, [sp, #0x44]
        add     r0, r7, #0x10
        add     r3, r7, #0xC
        str     r2, [sp, #0x50]
        sub     r2, lr, #4
        str     r12, [sp, #0x54]
        str     r0, [sp, #0x58]
        str     r3, [sp, #0x4C]
        add     r12, r7, r2, lsl #2
        add     r0, r7, #0x18
        add     r3, r7, #0x14
        sub     r2, lr, #2
        sub     r1, lr, #7
        sub     r9, lr, #5
        sub     r10, lr, #3
        sub     r11, lr, #1
        str     r0, [sp, #0x60]
        str     r3, [sp, #0x5C]
        add     r0, r7, #4
        add     r3, r7, #0x1C
        add     r2, r7, r2, lsl #2
        add     r1, r7, r1, lsl #2
        add     r9, r7, r9, lsl #2
        add     r10, r7, r10, lsl #2
        add     r11, r7, r11, lsl #2
        str     r6, [sp, #0x14]
        str     r7, [sp, #0xC]
        str     r5, [sp, #0x30]
        ldr     r7, [sp, #0x40]
        ldr     r6, [sp, #0x38]
        ldr     r5, [sp, #0x3C]
        str     r3, [sp, #0x48]
        str     r11, [sp, #0x28]
        str     r10, [sp, #0x2C]
        str     r9, [sp, #0x24]
        str     r1, [sp, #0x20]
        str     r2, [sp, #0x1C]
        str     r12, [sp, #0x18]
        str     lr, [sp, #0x10]
        str     r0, [sp, #8]
LGDX8:
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
        str     r0, [sp, #0x64]
        ldr     r0, [sp, #0x64]
        str     r1, [sp, #0x68]
        bl      sin
        mov     r2, r5
        mov     r3, r6
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r12, [sp, #0xC]
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
        str     r0, [sp, #0x6C]
        ldr     r0, [sp, #0x6C]
        str     r1, [sp, #0x70]
        bl      sin
        mov     r2, r5
        mov     r3, r6
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r12, [sp, #0x44]
        sub     r1, r11, #2, 14
        str     r0, [r12]
        mov     r2, r10
        mov     r0, #0
        mov     r3, r9
        bl      __adddf3
        mov     r2, r7
        mov     r3, r4
        bl      __muldf3
        str     r0, [sp, #0x74]
        ldr     r0, [sp, #0x74]
        str     r1, [sp, #0x78]
        bl      sin
        mov     r2, r5
        mov     r3, r6
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r12, [sp, #0x58]
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
        str     r1, [sp, #0x7C]
        bl      sin
        mov     r2, r5
        mov     r3, r6
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r12, [sp, #0x60]
        str     r0, [r12]
        ldr     r1, [sp, #0x68]
        ldr     r0, [sp, #0x64]
        bl      cos
        mov     r2, r5
        mov     r3, r6
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r12, [sp, #8]
        str     r0, [r12]
        ldr     r1, [sp, #0x70]
        ldr     r0, [sp, #0x6C]
        bl      cos
        mov     r2, r5
        mov     r3, r6
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r12, [sp, #0x4C]
        str     r0, [r12]
        ldr     r1, [sp, #0x78]
        ldr     r0, [sp, #0x74]
        bl      cos
        mov     r2, r5
        mov     r3, r6
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r12, [sp, #0x5C]
        str     r0, [r12]
        ldr     r1, [sp, #0x7C]
        mov     r0, r9
        rsb     r9, r8, #0
        bl      cos
        mov     r2, r5
        mov     r3, r6
        bl      __muldf3
        ldr     r12, [sp, #0x10]
        sub     r10, r12, r8
        bl      __truncdfsf2
        ldr     lr, [sp, #0x48]
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
        mov     r2, r5
        mov     r3, r6
        bl      __muldf3
        bl      __truncdfsf2
        ldr     lr, [sp, #0x54]
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
        mov     r2, r5
        mov     r3, r6
        bl      __muldf3
        bl      __truncdfsf2
        ldr     lr, [sp, #0x50]
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
        mov     r2, r5
        mov     r3, r6
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r12, [sp, #0x18]
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
        mov     r2, r5
        mov     r3, r6
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
        mov     r2, r5
        mov     r3, r6
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
        mov     r2, r5
        mov     r3, r6
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
        mov     r2, r5
        mov     r3, r6
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
        mov     r2, r5
        mov     r3, r6
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r12, [sp, #0x14]
        cmp     r8, r12
        ldr     r12, [sp, #0xC]
        add     r12, r12, #0x20
        str     r12, [sp, #0xC]
        ldr     r12, [sp, #0x44]
        add     r12, r12, #0x20
        str     r12, [sp, #0x44]
        ldr     r12, [sp, #0x58]
        add     r12, r12, #0x20
        str     r12, [sp, #0x58]
        ldr     r12, [sp, #0x60]
        add     r12, r12, #0x20
        str     r12, [sp, #0x60]
        ldr     r12, [sp, #8]
        add     r12, r12, #0x20
        str     r12, [sp, #8]
        ldr     r12, [sp, #0x4C]
        add     r12, r12, #0x20
        str     r12, [sp, #0x4C]
        ldr     r12, [sp, #0x5C]
        add     r12, r12, #0x20
        str     r12, [sp, #0x5C]
        ldr     r12, [sp, #0x48]
        add     r12, r12, #0x20
        str     r12, [sp, #0x48]
        ldr     r12, [sp, #0x28]
        str     r0, [r12, +r9, lsl #2]
        blt     LGDX8
        ldr     r5, [sp, #0x30]
LGDX9:
        ldr     r1, [sp, #0x34]
        mov     r0, #0
        str     r5, [r1]
        add     sp, sp, #0x84
        ldmia   sp!, {r4 - r11, pc}
LGDX10:
        mov     r6, r2, asr #2
        cmp     r6, #1
        movle   r10, r8
        ble     LGDX12
        mov     r10, r8
        mov     r2, #1
LGDX11:
        mov     r2, r2, lsl #1
        cmp     r2, r6
        add     r10, r10, #1
        blt     LGDX11
LGDX12:
        cmp     r9, #0
        mov     r3, r8
        mov     r2, #1
        movlt   r3, r2
        add     r3, r9, r3
        str     r4, [sp, #4]
        mov     r3, r3, asr #1
        add     r2, r3, #0x1F
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
        beq     LGDX13
        mov     r0, r5
        bl      LGDX_deleteMdctCtx_32f
        mov     r0, r4
        add     sp, sp, #0x84
        ldmia   sp!, {r4 - r11, pc}
LGDX13:
        ldr     r0, [r5, #0x18]
        add     r1, sp, #0x80
        bl      _ippsFFTGetBufSize_C_32fc
        mov     r4, r0
        cmp     r4, #0
        beq     LGDX7
        mov     r0, r5
        bl      LGDX_deleteMdctCtx_32f
        mov     r0, r4
        add     sp, sp, #0x84
        ldmia   sp!, {r4 - r11, pc}
        .long   0x54442d18
        .long   0x401921fb


