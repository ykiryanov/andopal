        .text
        .align  4
        .globl  _ippsIIRInit32sc_BiQuad_16sc


LBOK_ownsIIRSetTaps32sc_16sc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x50
        ldr     lr, [pc, #0xD94]
        mov     r5, r1
        ldr     r12, [r5]
        ldr     r4, [r5, #4]
        sub     r6, lr, #1
        mov     r9, r0
        cmp     r6, r12
        mov     r3, r2
        beq     LBOK8
        cmp     lr, r12
        beq     LBOK0
        mvn     r0, #0x10
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LBOK0:
        ldr     r8, [r5, #0x2C]
        mov     r1, r4
        rsb     r12, r8, r8, lsl #2
        mov     r0, r9
        mov     r2, r12, lsl #2
        bl      _ippsConvert_32s32f_Sfs
        cmp     r8, #0
        add     r2, r8, r8, lsl #2
        ble     LBOK4
        ldr     r12, [pc, #0xD3C]
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
LBOK1:
        ldr     r0, [sp, #0x14]
        ldr     r0, [r0]
        bl      __floatsisf
        ldr     r1, [sp, #8]
        bl      __eqsf2
        cmp     r0, #0
        beq     LBOK7
LBOK2:
        ldr     r0, [sp]
        ldr     r0, [r0]
        bl      __floatsisf
        ldr     r1, [sp, #8]
        bl      __eqsf2
        cmp     r0, #0
        beq     LBOK6
LBOK3:
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
        bne     LBOK1
        ldr     r2, [sp, #0xC]
        ldr     r5, [sp, #0x10]
LBOK4:
        ldr     r0, [r5, #4]
        ldr     r1, [r5, #0xC]
        bl      ownsConvert32fcTo16sc
LBOK5:
        add     r0, r0, #0xE
        str     r0, [r5, #0x34]
        mov     r0, #0
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LBOK6:
        ldr     r0, [sp]
        ldr     r0, [r0, #4]
        bl      __floatsisf
        ldr     r1, [sp, #8]
        bl      __eqsf2
        cmp     r0, #0
        bne     LBOK3
        mvn     r0, #9
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LBOK7:
        ldr     r0, [sp, #0x14]
        ldr     r0, [r0, #4]
        bl      __floatsisf
        ldr     r1, [sp, #8]
        bl      __eqsf2
        cmp     r0, #0
        bne     LBOK2
        mvn     r0, #9
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LBOK8:
        ldr     r8, [r5, #0x2C]
        add     r12, r9, #8
        ldr     lr, [r12, +r8, lsl #3]
        cmp     lr, #0
        bne     LBOK9
        add     r12, r12, r8, lsl #3
        ldr     r12, [r12, #4]
        cmp     r12, #0
        bne     LBOK9
        mvn     r0, #9
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LBOK9:
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
        ble     LBOK11
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
LBOK10:
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
        blt     LBOK10
        ldr     r4, [sp, #0x1C]
        ldr     r5, [sp, #0x10]
LBOK11:
        ldr     r2, [sp, #0x20]
        ldr     r1, [r5, #0xC]
        mov     r0, r4
        bl      ownsConvert32fcTo16sc
        b       LBOK5
_ippsIIRInit32sc_BiQuad_16sc:
        stmdb   sp!, {lr}
        sub     sp, sp, #8
        ldr     lr, [sp, #0xC]
        ldr     r12, [sp, #0x10]
        cmp     r1, #0
        beq     LBOK13
        cmp     r0, #0
        beq     LBOK13
        cmp     r12, #0
        beq     LBOK13
        cmp     r2, #1
        bge     LBOK12
        mvn     r0, #0x18
        add     sp, sp, #8
        ldr     pc, [sp], #4
LBOK12:
        str     r12, [sp, #4]
        str     lr, [sp]
        bl      LBOK_ownsIIRInit32sc_BiQuad_16sc
        add     sp, sp, #8
        ldr     pc, [sp], #4
LBOK13:
        mvn     r0, #7
        add     sp, sp, #8
        ldr     pc, [sp], #4
LBOK_ownsIIRInit32sc_BiQuad_16sc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        ldr     r12, [sp, #0x34]
        ldr     r5, [pc, #0x3C4]
        ldr     r8, [sp, #0x30]
        mov     r4, r0
        add     r12, r12, #7
        bic     r12, r12, #7
        str     r12, [r4]
        str     r5, [r12]
        ldr     lr, [r4]
        mov     r7, r2
        add     r6, r12, #0x48
        str     r6, [lr, #4]
        ldr     r6, [r4]
        rsb     r9, r7, r7, lsl #2
        mov     r0, r1
        mov     r2, r3
        mov     r9, r9, lsl #4
        add     lr, r9, #7
        bic     lr, lr, #7
        add     lr, r12, lr
        add     r12, lr, #0x48
        str     r12, [r6, #8]
        ldr     r12, [r4]
        mov     r6, r7, lsl #4
        add     r6, r6, #7
        bic     r6, r6, #7
        add     r9, r6, #0x48
        add     r9, lr, r9
        str     r9, [r12, #0xC]
        ldr     r12, [r4]
        add     lr, r6, lr
        add     r9, r7, r7, lsl #2
        mov     r6, #0
        mov     r9, r9, lsl #2
        add     r9, r9, #7
        bic     r9, r9, #7
        add     r9, r9, #0x48
        add     r9, lr, r9
        str     r9, [r12, #0x10]
        ldr     r12, [r4]
        str     r6, [r12, #0x14]
        ldr     r12, [r4]
        str     r6, [r12, #0x18]
        ldr     r12, [r4]
        str     r6, [r12, #0x1C]
        ldr     r12, [r4]
        str     r6, [r12, #0x20]
        ldr     r12, [r4]
        str     r6, [r12, #0x24]
        ldr     r12, [r4]
        str     r6, [r12, #0x28]
        ldr     r12, [r4]
        str     r7, [r12, #0x2C]
        ldr     r12, [r4]
        str     r6, [r12, #0x30]
        ldr     r12, [r4]
        str     r6, [r12, #0x34]
        ldr     r12, [r4]
        str     r6, [r12, #0x38]
        ldr     r12, [r4]
        str     r6, [r12, #0x3C]
        ldr     r12, [r4]
        str     r6, [r12, #0x40]
        ldr     r1, [r4]
        bl      LBOK_ownsIIRSetTaps32sc_16sc
        cmp     r0, #0
        addne   sp, sp, #0xC
        ldmneia sp!, {r4 - r11, pc}
        ldr     r4, [r4]
        sub     r1, r5, #1
        ldr     r0, [r4]
        cmp     r1, r0
        ldreq   r9, [r4, #0x2C]
        movne   r9, r6
        cmp     r5, r0
        ldreq   r0, [r4, #0x2C]
        moveq   r9, r0, lsl #1
        cmp     r8, #0
        beq     LBOK22
        cmp     r9, #0
        ble     LBOK17
        cmp     r9, #5
        movlt   r7, r6
        blt     LBOK15
        mov     r7, r6
        sub     r5, r9, #5
        mov     lr, r7
        sub     r12, r8, #4
        mov     r3, #8
        mov     r2, #0x10
        mov     r0, #0x18
LBOK14:
        ldr     r11, [r4, #8]
        ldr     r10, [r12, #4]
        str     r10, [r11, +r7, lsl #3]
        ldr     r11, [r4, #8]
        ldr     r10, [r12, #8]
        add     r7, r7, #4
        cmp     r7, r5
        add     r11, r11, lr
        str     r10, [r11, #4]
        ldr     r11, [r4, #8]
        ldr     r10, [r12, #0xC]
        add     lr, lr, #0x20
        str     r10, [r3, +r11]
        ldr     r11, [r4, #8]
        ldr     r10, [r12, #0x10]
        add     r11, r11, r3
        add     r3, r3, #0x20
        str     r10, [r11, #4]
        ldr     r11, [r4, #8]
        ldr     r10, [r12, #0x14]
        str     r10, [r2, +r11]
        ldr     r11, [r4, #8]
        ldr     r10, [r12, #0x18]
        add     r11, r11, r2
        add     r2, r2, #0x20
        str     r10, [r11, #4]
        ldr     r11, [r4, #8]
        ldr     r10, [r12, #0x1C]
        str     r10, [r0, +r11]
        ldr     r11, [r4, #8]
        ldr     r10, [r12, #0x20]!
        add     r11, r11, r0
        str     r10, [r11, #4]
        add     r0, r0, #0x20
        ble     LBOK14
LBOK15:
        mov     r0, r7, lsl #3
        sub     r2, r0, #4
        add     r2, r2, r8
LBOK16:
        ldr     r12, [r4, #8]
        ldr     r3, [r2, #4]
        str     r3, [r12, +r7, lsl #3]
        ldr     r12, [r4, #8]
        ldr     r3, [r2, #8]!
        add     r7, r7, #1
        add     r12, r12, r0
        cmp     r7, r9
        str     r3, [r12, #4]
        add     r0, r0, #8
        blt     LBOK16
LBOK17:
        cmp     r9, #0
        ble     LBOK21
        cmp     r9, #5
        movlt   r7, r6
        blt     LBOK19
        mov     r7, r6
        sub     r0, r9, #5
        sub     r5, r8, #0x1C
        str     r0, [sp]
        str     r9, [sp, #4]
LBOK18:
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
        ble     LBOK18
        ldr     r9, [sp, #4]
LBOK19:
        mov     r0, r7, lsl #3
        sub     r0, r0, #4
        add     r8, r0, r8
        mov     r5, r7, lsl #4
LBOK20:
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
        blt     LBOK20
LBOK21:
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LBOK22:
        ldr     r0, [r4, #8]
        mov     r1, r9
        bl      _ippsZero_32fc
        ldr     r0, [r4, #0x10]
        mov     r1, r9
        bl      _ippsZero_64sc
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
        .long   0x49493132
        .long   LBOK__2il0floatpacket.1


        .data
        .align  4


LBOK__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


