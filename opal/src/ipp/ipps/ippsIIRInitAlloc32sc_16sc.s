        .text
        .align  4
        .globl  _ippsIIRInitAlloc32sc_16sc


LBOE_ownsIIRSetTaps32sc_16sc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x50
        ldr     lr, [pc, #0xE48]
        mov     r5, r1
        ldr     r12, [r5]
        ldr     r4, [r5, #4]
        sub     r6, lr, #1
        mov     r9, r0
        cmp     r6, r12
        mov     r3, r2
        beq     LBOE8
        cmp     lr, r12
        beq     LBOE0
        mvn     r0, #0x10
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LBOE0:
        ldr     r8, [r5, #0x2C]
        mov     r1, r4
        rsb     r12, r8, r8, lsl #2
        mov     r0, r9
        mov     r2, r12, lsl #2
        bl      _ippsConvert_32s32f_Sfs
        cmp     r8, #0
        add     r2, r8, r8, lsl #2
        ble     LBOE4
        ldr     r12, [pc, #0xDF0]
        add     r3, r9, #0x18
        mov     r7, #0
        ldr     r12, [r12]
        add     r10, r4, #4
        sub     lr, r4, #0x24
        mov     r6, r7
        str     lr, [sp, #0x18]
        str     r10, [sp, #0x20]
        str     r12, [sp, #8]
        str     r3, [sp, #0x14]
        str     r2, [sp, #0xC]
        str     r8, [sp, #4]
        str     r4, [sp, #0x1C]
        str     r5, [sp, #0x10]
        str     r9, [sp]
LBOE1:
        ldr     r0, [sp, #0x14]
        ldr     r0, [r0]
        bl      __floatsisf
        ldr     r1, [sp, #8]
        bl      __eqsf2
        cmp     r0, #0
        beq     LBOE7
LBOE2:
        ldr     r0, [sp]
        ldr     r0, [r0]
        bl      __floatsisf
        ldr     r1, [sp, #8]
        bl      __eqsf2
        cmp     r0, #0
        beq     LBOE6
LBOE3:
        ldr     r0, [sp, #0x14]
        ldr     r1, [sp, #0x1C]
        add     r0, r0, #0x30
        str     r0, [sp, #0x14]
        ldr     r0, [sp]
        add     r1, r1, #0x20
        add     r0, r0, #0x30
        str     r0, [sp]
        ldr     r0, [sp, #0x1C]
        add     r0, r0, #0x18
        str     r0, [sp, #0x24]
        add     r0, r6, r0
        ldr     r8, [r0, #4]
        str     r1, [sp, #0x28]
        ldr     r1, [sp, #0x24]
        mov     r0, r8
        eor     r8, r8, #2, 2
        add     r1, r1, r7
        str     r1, [sp, #0x2C]
        bl      __extendsfdf2
        ldr     r12, [sp, #0x24]
        mov     r4, r0
        mov     r5, r1
        ldr     r2, [r12, +r6]
        str     r8, [sp, #0x30]
        mov     r0, r2
        bl      __extendsfdf2
        mov     r8, r0
        mov     r3, r1
        str     r3, [sp, #0x34]
        mov     r2, r8
        bl      __muldf3
        mov     r9, r0
        mov     r10, r1
        mov     r3, r5
        mov     r1, r5
        mov     r2, r4
        mov     r0, r4
        bl      __muldf3
        mov     r2, r9
        mov     r3, r10
        bl      __adddf3
        mov     r9, r0
        ldr     r0, [sp, #0x30]
        mov     r10, r1
        bl      __extendsfdf2
        mov     r3, r10
        mov     r2, r9
        bl      __divdf3
        mov     r5, r1
        ldr     r1, [sp, #0x34]
        mov     r4, r0
        mov     r2, r9
        mov     r0, r8
        mov     r3, r10
        bl      __divdf3
        ldr     r12, [sp, #0x20]
        mov     r9, r0
        mov     r8, r1
        ldr     r2, [r12, #-4]
        ldr     r12, [sp, #0x1C]
        add     r10, r12, #8
        mov     r0, r2
        bl      __extendsfdf2
        mov     r3, r8
        mov     r2, r9
        bl      __muldf3
        ldr     r12, [sp, #0x20]
        ldr     r2, [r12]
        str     r0, [sp, #0x34]
        add     r12, r6, r10
        str     r1, [sp, #0x30]
        str     r12, [sp, #0x38]
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x34]
        mov     r3, r1
        ldr     r1, [sp, #0x30]
        bl      __subdf3
        bl      __truncdfsf2
        ldr     r12, [sp, #0x18]
        str     r0, [r12, #0x24]
        ldr     r12, [sp, #0x20]
        ldr     r0, [r12]
        add     r12, r10, r7
        str     r12, [sp, #0x34]
        ldr     r12, [sp, #0x1C]
        add     r11, r12, #0x10
        bl      __extendsfdf2
        mov     r3, r8
        mov     r2, r9
        bl      __muldf3
        ldr     r12, [sp, #0x20]
        ldr     r2, [r12, #-4]
        str     r0, [sp, #0x30]
        add     r12, r7, r11
        str     r12, [sp, #0x40]
        str     r1, [sp, #0x3C]
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r3, [sp, #0x3C]
        ldr     r2, [sp, #0x30]
        bl      __adddf3
        bl      __truncdfsf2
        ldr     r12, [sp, #0x18]
        str     r0, [r12, #0x28]
        ldr     r0, [r10, +r6]
        add     r12, r6, r11
        str     r12, [sp, #0x3C]
        ldr     r12, [sp, #0x28]
        add     r12, r6, r12
        str     r12, [sp, #0x30]
        bl      __extendsfdf2
        mov     r3, r8
        mov     r2, r9
        bl      __muldf3
        ldr     r12, [sp, #0x38]
        ldr     r2, [r12, #4]
        ldr     r12, [sp, #0x28]
        str     r0, [sp, #0x44]
        str     r1, [sp, #0x48]
        mov     r0, r2
        add     r12, r7, r12
        str     r12, [sp, #0x4C]
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x44]
        mov     r3, r1
        ldr     r1, [sp, #0x48]
        bl      __subdf3
        bl      __truncdfsf2
        str     r0, [r10, +r7]
        ldr     r12, [sp, #0x38]
        ldr     r0, [r12, #4]
        ldr     r12, [sp, #0x1C]
        add     r12, r12, #0x28
        str     r12, [sp, #0x48]
        add     r12, r6, r12
        str     r12, [sp, #0x44]
        bl      __extendsfdf2
        mov     r3, r8
        mov     r2, r9
        bl      __muldf3
        ldr     r2, [r10, +r6]
        ldr     r12, [sp, #0x20]
        str     r0, [sp, #0x38]
        mov     r10, r1
        add     r12, r12, #0x30
        str     r12, [sp, #0x20]
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [sp, #0x38]
        mov     r3, r10
        bl      __adddf3
        bl      __truncdfsf2
        ldr     r12, [sp, #0x34]
        str     r0, [r12, #4]
        ldr     r12, [sp, #0x18]
        ldr     r0, [r11, +r6]
        add     r12, r12, #0x28
        str     r12, [sp, #0x18]
        bl      __extendsfdf2
        mov     r3, r8
        mov     r2, r9
        bl      __muldf3
        ldr     r12, [sp, #0x3C]
        mov     r10, r1
        ldr     r2, [r12, #4]
        str     r0, [sp, #0x38]
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x38]
        mov     r3, r1
        mov     r1, r10
        bl      __subdf3
        bl      __truncdfsf2
        str     r0, [r11, +r7]
        ldr     r12, [sp, #0x3C]
        ldr     r0, [r12, #4]
        bl      __extendsfdf2
        mov     r3, r8
        mov     r2, r9
        bl      __muldf3
        ldr     r2, [r11, +r6]
        mov     r10, r0
        mov     r11, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        bl      __truncdfsf2
        ldr     r12, [sp, #0x40]
        str     r0, [r12, #4]
        ldr     r12, [sp, #0x28]
        ldr     r0, [r12, +r6]
        bl      __extendsfdf2
        mov     r3, r8
        mov     r2, r9
        bl      __muldf3
        ldr     r12, [sp, #0x30]
        mov     r10, r0
        mov     r11, r1
        ldr     r2, [r12, #4]
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r10
        mov     r1, r11
        bl      __subdf3
        bl      __truncdfsf2
        ldr     r12, [sp, #0x24]
        str     r0, [r12, +r7]
        ldr     r12, [sp, #0x30]
        ldr     r0, [r12, #4]
        bl      __extendsfdf2
        mov     r3, r8
        mov     r2, r9
        bl      __muldf3
        ldr     r12, [sp, #0x28]
        mov     r10, r0
        mov     r11, r1
        ldr     r2, [r12, +r6]
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        mov     r3, r11
        mov     r2, r10
        bl      __adddf3
        bl      __truncdfsf2
        ldr     r12, [sp, #0x2C]
        str     r0, [r12, #4]
        ldr     r12, [sp, #0x48]
        ldr     r0, [r12, +r6]
        bl      __extendsfdf2
        mov     r3, r8
        mov     r2, r9
        bl      __muldf3
        ldr     r12, [sp, #0x44]
        mov     r11, r1
        mov     r10, r0
        ldr     r2, [r12, #4]
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r10
        mov     r1, r11
        bl      __subdf3
        bl      __truncdfsf2
        ldr     r12, [sp, #0x28]
        str     r0, [r12, +r7]
        ldr     r12, [sp, #0x44]
        add     r7, r7, #0x28
        ldr     r0, [r12, #4]
        bl      __extendsfdf2
        mov     r3, r8
        mov     r2, r9
        bl      __muldf3
        ldr     r12, [sp, #0x48]
        mov     r8, r0
        mov     r9, r1
        ldr     r2, [r12, +r6]
        add     r6, r6, #0x30
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        bl      __truncdfsf2
        ldr     r1, [sp, #4]
        ldr     r2, [sp, #0x4C]
        subs    r1, r1, #1
        str     r1, [sp, #4]
        str     r0, [r2, #4]
        bne     LBOE1
        ldr     r2, [sp, #0xC]
        ldr     r5, [sp, #0x10]
LBOE4:
        ldr     r0, [r5, #4]
        ldr     r1, [r5, #0xC]
        bl      ownsConvert32fcTo16sc
LBOE5:
        add     r0, r0, #0xE
        str     r0, [r5, #0x34]
        mov     r0, #0
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LBOE6:
        ldr     r0, [sp]
        ldr     r0, [r0, #4]
        bl      __floatsisf
        ldr     r1, [sp, #8]
        bl      __eqsf2
        cmp     r0, #0
        bne     LBOE3
        mvn     r0, #9
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LBOE7:
        ldr     r0, [sp, #0x14]
        ldr     r0, [r0, #4]
        bl      __floatsisf
        ldr     r1, [sp, #8]
        bl      __eqsf2
        cmp     r0, #0
        bne     LBOE2
        mvn     r0, #9
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LBOE8:
        ldr     r8, [r5, #0x2C]
        add     r12, r9, #8
        ldr     lr, [r12, +r8, lsl #3]
        cmp     lr, #0
        bne     LBOE9
        add     r12, r12, r8, lsl #3
        ldr     r12, [r12, #4]
        cmp     r12, #0
        bne     LBOE9
        mvn     r0, #9
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LBOE9:
        mov     lr, r8, lsl #1
        add     r12, lr, #2
        add     lr, lr, #1
        str     lr, [sp, #0x20]
        mov     r2, r12, lsl #1
        mov     r1, r4
        mov     r0, r9
        add     r6, r4, #8
        bl      _ippsConvert_32s32f_Sfs
        add     r2, r6, r8, lsl #3
        ldr     r0, [r2, #4]
        add     r2, r8, #1
        str     r2, [sp, #0x4C]
        eor     r9, r0, #2, 2
        bl      __extendsfdf2
        ldr     r6, [r6, +r8, lsl #3]
        mov     r10, r0
        mov     r7, r1
        mov     r0, r6
        bl      __extendsfdf2
        str     r1, [sp, #0x48]
        mov     r3, r1
        mov     r6, r0
        mov     r2, r6
        bl      __muldf3
        str     r0, [sp, #0x44]
        mov     r11, r1
        mov     r2, r10
        mov     r0, r10
        mov     r3, r7
        mov     r1, r7
        bl      __muldf3
        ldr     r2, [sp, #0x44]
        mov     r3, r11
        bl      __adddf3
        mov     r7, r0
        mov     r11, r1
        mov     r0, r9
        bl      __extendsfdf2
        mov     r3, r11
        mov     r2, r7
        bl      __divdf3
        mov     r9, r0
        str     r9, [sp, #0xC]
        mov     r10, r1
        ldr     r1, [sp, #0x48]
        str     r10, [sp]
        mov     r0, r6
        mov     r3, r11
        mov     r2, r7
        bl      __divdf3
        ldr     r2, [r4, #4]
        mov     r11, r1
        str     r11, [sp, #8]
        mov     r7, r0
        str     r7, [sp, #4]
        mov     r0, r2
        bl      __extendsfdf2
        ldr     r2, [r4]
        mov     r6, r0
        str     r1, [sp, #0x48]
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r7
        mov     r3, r11
        bl      __muldf3
        str     r1, [sp, #0x40]
        ldr     r1, [sp, #0x48]
        str     r0, [sp, #0x44]
        mov     r0, r6
        mov     r2, r9
        mov     r3, r10
        bl      __muldf3
        mov     r3, r1
        mov     r2, r0
        ldr     r0, [sp, #0x44]
        ldr     r1, [sp, #0x40]
        bl      __subdf3
        bl      __truncdfsf2
        str     r0, [r4]
        bl      __extendsfdf2
        mov     r2, r9
        mov     r3, r10
        bl      __muldf3
        str     r1, [sp, #0x40]
        ldr     r1, [sp, #0x48]
        str     r0, [sp, #0x44]
        mov     r0, r6
        mov     r2, r7
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [sp, #0x44]
        ldr     r3, [sp, #0x40]
        bl      __adddf3
        bl      __truncdfsf2
        ldr     r2, [sp, #0x4C]
        str     r0, [r4, #4]
        cmp     r2, #1
        ble     LBOE11
        add     r2, r8, #1
        add     r8, r4, r8, lsl #3
        add     r6, r8, #4
        add     r3, r4, r2, lsl #3
        add     r8, r4, #4
        str     r4, [sp, #0x1C]
        str     r5, [sp, #0x10]
        ldr     r4, [sp, #8]
        ldr     r5, [sp, #4]
        ldr     r10, [sp]
        ldr     r11, [sp, #0xC]
        add     r7, r3, #4
        mov     r9, #1
        str     r2, [sp, #0x18]
LBOE10:
        ldr     r0, [r8, #8]
        add     r9, r9, #1
        bl      __extendsfdf2
        str     r1, [sp, #0x48]
        str     r0, [sp, #0x4C]
        ldr     r0, [r8, #4]
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        str     r1, [sp, #0x40]
        ldr     r1, [sp, #0x48]
        str     r0, [sp, #0x44]
        ldr     r0, [sp, #0x4C]
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        mov     r3, r1
        ldr     r1, [sp, #0x40]
        mov     r2, r0
        ldr     r0, [sp, #0x44]
        bl      __subdf3
        bl      __truncdfsf2
        str     r0, [r8, #4]
        bl      __extendsfdf2
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        str     r0, [sp, #0x44]
        str     r1, [sp, #0x40]
        ldr     r1, [sp, #0x48]
        ldr     r0, [sp, #0x4C]
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [sp, #0x44]
        ldr     r3, [sp, #0x40]
        bl      __adddf3
        bl      __truncdfsf2
        str     r0, [r8, #8]!
        ldr     r0, [r7, #4]
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        str     r1, [sp, #0x48]
        str     r0, [sp, #0x4C]
        ldr     r0, [r7, #8]
        bl      __extendsfdf2
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x4C]
        mov     r3, r1
        ldr     r1, [sp, #0x48]
        bl      __subdf3
        bl      __truncdfsf2
        str     r0, [r6, #4]
        ldr     r0, [r7, #4]
        bl      __extendsfdf2
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        str     r0, [sp, #0x4C]
        ldr     r0, [r7, #8]!
        str     r1, [sp, #0x48]
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [sp, #0x4C]
        ldr     r3, [sp, #0x48]
        bl      __adddf3
        bl      __truncdfsf2
        str     r0, [r6, #8]!
        ldr     r0, [sp, #0x18]
        cmp     r9, r0
        blt     LBOE10
        ldr     r4, [sp, #0x1C]
        ldr     r5, [sp, #0x10]
LBOE11:
        ldr     r2, [sp, #0x20]
        ldr     r1, [r5, #0xC]
        mov     r0, r4
        bl      ownsConvert32fcTo16sc
        b       LBOE5
_ippsIIRInitAlloc32sc_16sc:
        stmdb   sp!, {lr}
        sub     sp, sp, #8
        ldr     r12, [sp, #0xC]
        cmp     r1, #0
        beq     LBOE13
        cmp     r0, #0
        beq     LBOE13
        cmp     r2, #1
        bge     LBOE12
        mvn     r0, #0x18
        add     sp, sp, #8
        ldr     pc, [sp], #4
LBOE12:
        str     r12, [sp]
        bl      LBOE_ownsIIRInitAlloc32sc_16sc
        add     sp, sp, #8
        ldr     pc, [sp], #4
LBOE13:
        mvn     r0, #7
        add     sp, sp, #8
        ldr     pc, [sp], #4
LBOE_ownsIIRInitAlloc32sc_16sc:
        stmdb   sp!, {r4 - r9, lr}
        sub     sp, sp, #0xC
        ldr     r8, [sp, #0x28]
        add     r9, sp, #8
        mov     r5, r2
        mov     r7, r1
        mov     r4, r0
        mov     r1, r9
        mov     r0, r5
        mov     r6, r3
        bl      _ippsIIRGetStateSize32fc_16sc
        ldr     r0, [sp, #8]
        bl      _ippsMalloc_8u
        mov     r9, r0
        cmp     r9, #0
        bne     LBOE14
        mvn     r0, #8
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r9, pc}
LBOE14:
        str     r8, [sp]
        str     r9, [sp, #4]
        mov     r2, r5
        mov     r3, r6
        mov     r1, r7
        mov     r0, r4
        bl      LBOE_ownsIIRInit32sc_16sc
        mov     r5, r0
        cmp     r5, #0
        beq     LBOE15
        mov     r0, r9
        bl      _ippsFree
        mov     r0, r5
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r9, pc}
LBOE15:
        ldr     r4, [r4]
        mov     r1, #1
        mov     r0, r5
        str     r1, [r4, #0x30]
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r9, pc}
LBOE_ownsIIRInit32sc_16sc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        mov     r4, r2
        ldr     r8, [sp, #0x30]
        ldr     r5, [sp, #0x34]
        cmp     r4, #0
        mov     r12, #0
        mov     r7, r12
        mov     lr, #1
        movlt   r7, lr
        add     lr, r4, r7
        and     r7, r4, #1
        mov     r6, r0
        cmp     r7, #1
        mov     r0, r1
        mov     r2, r3
        mov     lr, lr, asr #1
        addeq   lr, lr, #1
        add     r7, r5, #7
        ldr     r5, [pc, #0x3B0]
        bic     r7, r7, #7
        str     r7, [r6]
        str     r5, [r7]
        ldr     r9, [r6]
        add     r11, r4, #2
        add     r10, r7, #0x48
        str     r10, [r9, #4]
        ldr     r10, [r6]
        mov     r11, r11, lsl #4
        add     r11, r11, #7
        bic     r11, r11, #7
        add     r9, r7, r11
        add     r7, r9, #0x48
        str     r7, [r10, #8]
        ldr     r7, [r6]
        mov     r10, r4, lsl #3
        add     r10, r10, #7
        bic     r10, r10, #7
        add     r9, r9, r10
        add     r10, r9, #0x48
        str     r10, [r7, #0xC]
        ldr     r7, [r6]
        add     r11, r4, #1
        mov     r11, r11, lsl #3
        add     r10, r11, #7
        bic     r10, r10, #7
        add     r10, r9, r10
        add     r9, r10, #0x48
        str     r9, [r7, #0x10]
        ldr     r7, [r6]
        str     r12, [r7, #0x14]
        ldr     r7, [r6]
        str     r12, [r7, #0x18]
        ldr     r7, [r6]
        str     r12, [r7, #0x1C]
        ldr     r7, [r6]
        str     r12, [r7, #0x20]
        ldr     r7, [r6]
        str     r12, [r7, #0x24]
        ldr     r7, [r6]
        str     r12, [r7, #0x28]
        ldr     r7, [r6]
        str     r4, [r7, #0x2C]
        ldr     r7, [r6]
        str     r12, [r7, #0x30]
        ldr     r7, [r6]
        str     r12, [r7, #0x34]
        ldr     r7, [r6]
        str     lr, [r7, #0x38]
        ldr     lr, [r6]
        str     r12, [lr, #0x3C]
        ldr     lr, [r6]
        str     r12, [lr, #0x40]
        ldr     r1, [r6]
        bl      LBOE_ownsIIRSetTaps32sc_16sc
        cmp     r0, #0
        addne   sp, sp, #0xC
        ldmneia sp!, {r4 - r11, pc}
        cmp     r4, #0
        ble     LBOE24
        ldr     r4, [r6]
        ldr     r0, [r4]
        cmp     r5, r0
        ldreq   r9, [r4, #0x2C]
        movne   r9, #0
        add     r5, r5, #1
        cmp     r5, r0
        ldreq   r0, [r4, #0x2C]
        moveq   r9, r0, lsl #1
        cmp     r8, #0
        beq     LBOE25
        cmp     r9, #0
        ble     LBOE19
        cmp     r9, #5
        movlt   r6, #0
        blt     LBOE17
        mov     r6, #0
        sub     r5, r9, #5
        mov     lr, r6
        sub     r12, r8, #4
        mov     r3, #8
        mov     r2, #0x10
        mov     r0, #0x18
LBOE16:
        ldr     r10, [r4, #8]
        ldr     r7, [r12, #4]
        str     r7, [r10, +r6, lsl #3]
        ldr     r10, [r4, #8]
        ldr     r7, [r12, #8]
        add     r6, r6, #4
        cmp     r6, r5
        add     r10, r10, lr
        str     r7, [r10, #4]
        ldr     r10, [r4, #8]
        ldr     r7, [r12, #0xC]
        add     lr, lr, #0x20
        str     r7, [r3, +r10]
        ldr     r10, [r4, #8]
        ldr     r7, [r12, #0x10]
        add     r10, r10, r3
        add     r3, r3, #0x20
        str     r7, [r10, #4]
        ldr     r10, [r4, #8]
        ldr     r7, [r12, #0x14]
        str     r7, [r2, +r10]
        ldr     r10, [r4, #8]
        ldr     r7, [r12, #0x18]
        add     r10, r10, r2
        add     r2, r2, #0x20
        str     r7, [r10, #4]
        ldr     r10, [r4, #8]
        ldr     r7, [r12, #0x1C]
        str     r7, [r0, +r10]
        ldr     r10, [r4, #8]
        ldr     r7, [r12, #0x20]!
        add     r10, r10, r0
        add     r0, r0, #0x20
        str     r7, [r10, #4]
        ble     LBOE16
LBOE17:
        mov     r0, r6, lsl #3
        sub     r2, r0, #4
        add     r2, r2, r8
LBOE18:
        ldr     r12, [r4, #8]
        ldr     r3, [r2, #4]
        str     r3, [r12, +r6, lsl #3]
        ldr     r12, [r4, #8]
        ldr     r3, [r2, #8]!
        add     r6, r6, #1
        add     r12, r12, r0
        cmp     r6, r9
        str     r3, [r12, #4]
        add     r0, r0, #8
        blt     LBOE18
LBOE19:
        cmp     r9, #0
        ble     LBOE23
        cmp     r9, #5
        movlt   r7, #0
        blt     LBOE21
        mov     r7, #0
        sub     r0, r9, #5
        mov     r6, r7
        sub     r5, r8, #0x1C
        str     r0, [sp]
        str     r9, [sp, #4]
LBOE20:
        ldr     r0, [r5, #0x1C]
        add     r11, r7, #1
        add     r10, r7, #2
        bl      __fixsfdi
        ldr     r2, [r4, #0x10]
        str     r0, [r2, +r7, lsl #4]
        add     r2, r2, r6
        str     r1, [r2, #4]
        ldr     r0, [r5, #0x20]!
        add     r9, r8, r11, lsl #3
        bl      __fixsfdi
        ldr     r2, [r4, #0x10]
        add     r2, r2, r6
        str     r0, [r2, #8]
        str     r1, [r2, #0xC]
        ldr     r0, [r8, +r11, lsl #3]
        add     r6, r6, #0x40
        bl      __fixsfdi
        ldr     r2, [r4, #0x10]
        str     r0, [r2, +r11, lsl #4]
        add     r0, r8, r10, lsl #3
        str     r0, [sp, #8]
        add     r2, r2, r11, lsl #4
        str     r1, [r2, #4]
        ldr     r0, [r9, #4]
        add     r9, r7, #3
        add     r7, r7, #4
        bl      __fixsfdi
        ldr     r2, [r4, #0x10]
        add     r11, r2, r11, lsl #4
        str     r0, [r11, #8]
        str     r1, [r11, #0xC]
        ldr     r0, [r8, +r10, lsl #3]
        add     r11, r8, r9, lsl #3
        bl      __fixsfdi
        ldr     r2, [r4, #0x10]
        str     r0, [r2, +r10, lsl #4]
        add     r2, r2, r10, lsl #4
        str     r1, [r2, #4]
        ldr     r0, [sp, #8]
        ldr     r0, [r0, #4]
        bl      __fixsfdi
        ldr     r2, [r4, #0x10]
        add     r10, r2, r10, lsl #4
        str     r0, [r10, #8]
        str     r1, [r10, #0xC]
        ldr     r0, [r8, +r9, lsl #3]
        bl      __fixsfdi
        ldr     r2, [r4, #0x10]
        str     r0, [r2, +r9, lsl #4]
        add     r2, r2, r9, lsl #4
        str     r1, [r2, #4]
        ldr     r0, [r11, #4]
        bl      __fixsfdi
        ldr     r2, [r4, #0x10]
        ldr     r3, [sp]
        add     r9, r2, r9, lsl #4
        cmp     r7, r3
        str     r0, [r9, #8]
        str     r1, [r9, #0xC]
        ble     LBOE20
        ldr     r9, [sp, #4]
LBOE21:
        mov     r0, r7, lsl #3
        sub     r0, r0, #4
        add     r8, r0, r8
        mov     r5, r7, lsl #4
LBOE22:
        ldr     r0, [r8, #4]
        bl      __fixsfdi
        ldr     r2, [r4, #0x10]
        str     r0, [r2, +r7, lsl #4]
        add     r2, r2, r5
        str     r1, [r2, #4]
        ldr     r0, [r8, #8]!
        add     r7, r7, #1
        bl      __fixsfdi
        ldr     r2, [r4, #0x10]
        add     r2, r2, r5
        cmp     r7, r9
        str     r0, [r2, #8]
        str     r1, [r2, #0xC]
        add     r5, r5, #0x10
        blt     LBOE22
LBOE23:
        mov     r0, #0
LBOE24:
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LBOE25:
        ldr     r0, [r4, #8]
        mov     r1, r9
        bl      _ippsZero_32fc
        ldr     r0, [r4, #0x10]
        mov     r1, r9
        bl      _ippsZero_64sc
        b       LBOE23
        .long   0x49493132
        .long   LBOE__2il0floatpacket.1
        .long   0x49493131


        .data
        .align  4


LBOE__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


