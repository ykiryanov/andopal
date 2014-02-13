        .text
        .align  4
        .globl  _ippsIIRInit32fc_16sc


LBRM_ownsIIRSetTaps32fc_16sc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x4C
        ldr     r2, [pc, #0xE0C]
        mov     r5, r1
        ldr     r3, [r5]
        sub     r12, r2, #1
        mov     lr, #8
        mov     r4, r0
        cmp     r12, r3
        str     lr, [sp, #8]
        beq     LBRM8
        cmp     r2, r3
        bne     LBRM5
        ldr     r3, [r5, #0x2C]
        cmp     r3, #0
        add     r2, r3, r3, lsl #2
        ble     LBRM3
        ldr     lr, [pc, #0xDD4]
        mov     r12, #0
        mov     r7, r12
        ldr     lr, [lr]
        sub     r9, r4, #0x14
        mov     r10, #0x10
        mov     r11, #0x18
        mov     r8, #0x20
        add     r6, r4, #4
        str     r8, [sp, #0x1C]
        str     r11, [sp, #0x20]
        str     r10, [sp, #0x18]
        str     r9, [sp, #0x24]
        str     r12, [sp, #0x14]
        str     lr, [sp]
        str     r2, [sp, #4]
        str     r3, [sp, #0xC]
        str     r4, [sp, #0x10]
LBRM0:
        ldr     r0, [sp, #0x24]
        ldr     r1, [sp]
        ldr     r4, [r0, #0x2C]
        mov     r0, r4
        bl      __eqsf2
        cmp     r0, #0
        beq     LBRM7
LBRM1:
        ldr     r0, [r6, #-4]
        ldr     r1, [sp]
        str     r0, [sp, #0x2C]
        bl      __eqsf2
        cmp     r0, #0
        ldrne   r2, [r6]
        strne   r2, [sp, #0x28]
        beq     LBRM6
LBRM2:
        mov     r0, r4
        bl      __extendsfdf2
        ldr     r12, [sp, #0x24]
        mov     r4, r0
        mov     r8, r1
        ldr     r11, [r12, #0x30]
        mov     r0, r11
        bl      __extendsfdf2
        mov     r9, r0
        mov     r10, r1
        mov     r1, r8
        mov     r3, r8
        mov     r0, r4
        mov     r2, r4
        bl      __muldf3
        str     r0, [sp, #0x30]
        str     r1, [sp, #0x34]
        mov     r0, r9
        mov     r2, r9
        mov     r1, r10
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0x30]
        ldr     r3, [sp, #0x34]
        bl      __adddf3
        eor     r11, r11, #2, 2
        str     r0, [sp, #0x34]
        mov     r0, r11
        mov     r11, r1
        bl      __extendsfdf2
        ldr     r2, [sp, #0x34]
        mov     r3, r11
        bl      __divdf3
        ldr     r2, [sp, #0x34]
        mov     r10, r0
        mov     r9, r1
        mov     r3, r11
        mov     r0, r4
        mov     r1, r8
        bl      __divdf3
        mov     r4, r0
        ldr     r0, [sp, #0x2C]
        mov     r8, r1
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r8
        bl      __muldf3
        str     r0, [sp, #0x34]
        ldr     r0, [sp, #0x28]
        mov     r11, r1
        bl      __extendsfdf2
        mov     r2, r10
        mov     r3, r9
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x34]
        mov     r3, r1
        mov     r1, r11
        bl      __subdf3
        bl      __truncdfsf2
        ldr     lr, [sp, #0x10]
        ldr     r12, [r5, #4]
        add     lr, lr, #8
        str     lr, [sp, #0x34]
        add     lr, r7, lr
        str     lr, [sp, #0x30]
        ldr     lr, [sp, #0x14]
        str     r0, [r12, +lr]
        ldr     r0, [r6]
        ldr     r12, [sp, #0x10]
        add     r11, r12, #0x20
        add     r12, r12, #0x28
        str     r12, [sp, #0x2C]
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [r6, #-4]
        ldr     r12, [sp, #0x2C]
        str     r0, [sp, #0x28]
        str     r1, [sp, #0x38]
        add     r12, r7, r12
        str     r12, [sp, #0x3C]
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r10
        mov     r3, r9
        bl      __muldf3
        ldr     r3, [sp, #0x38]
        ldr     r2, [sp, #0x28]
        bl      __adddf3
        bl      __truncdfsf2
        ldr     r12, [r5, #4]
        ldr     lr, [sp, #0x10]
        add     r6, r6, #0x30
        add     lr, lr, #0x10
        str     lr, [sp, #0x38]
        add     lr, r7, lr
        str     lr, [sp, #0x28]
        ldr     lr, [sp, #0x14]
        add     r12, lr, r12
        str     r0, [r12, #4]
        ldr     r12, [sp, #0x34]
        ldr     r0, [r12, +r7]
        add     r12, r7, r11
        str     r12, [sp, #0x40]
        ldr     r12, [sp, #0x24]
        add     r12, r12, #0x30
        str     r12, [sp, #0x24]
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r8
        bl      __muldf3
        ldr     r12, [sp, #0x30]
        ldr     r2, [r12, #4]
        str     r0, [sp, #0x44]
        str     r1, [sp, #0x48]
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r10
        mov     r3, r9
        bl      __muldf3
        mov     r3, r1
        mov     r2, r0
        ldr     r0, [sp, #0x44]
        ldr     r1, [sp, #0x48]
        bl      __subdf3
        bl      __truncdfsf2
        ldr     lr, [sp, #0x14]
        ldr     r12, [r5, #4]
        add     lr, lr, #0x28
        str     lr, [sp, #0x14]
        ldr     lr, [sp, #8]
        str     r0, [r12, +lr]
        ldr     r12, [sp, #0x30]
        ldr     r0, [r12, #4]
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r8
        bl      __muldf3
        ldr     r12, [sp, #0x34]
        ldr     r2, [r12, +r7]
        str     r0, [sp, #0x48]
        str     r1, [sp, #0x44]
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r10
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #0x48]
        ldr     r3, [sp, #0x44]
        bl      __adddf3
        bl      __truncdfsf2
        ldr     r12, [r5, #4]
        ldr     lr, [sp, #8]
        add     r12, lr, r12
        str     r0, [r12, #4]
        ldr     r12, [sp, #0x38]
        ldr     r0, [r12, +r7]
        ldr     r12, [sp, #8]
        add     r12, r12, #0x28
        str     r12, [sp, #8]
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r8
        bl      __muldf3
        ldr     r12, [sp, #0x28]
        ldr     r2, [r12, #4]
        str     r0, [sp, #0x48]
        str     r1, [sp, #0x44]
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r10
        mov     r3, r9
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x48]
        mov     r3, r1
        ldr     r1, [sp, #0x44]
        bl      __subdf3
        bl      __truncdfsf2
        ldr     r12, [r5, #4]
        ldr     lr, [sp, #0x18]
        str     r0, [r12, +lr]
        ldr     r12, [sp, #0x28]
        ldr     r0, [r12, #4]
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r8
        bl      __muldf3
        ldr     r12, [sp, #0x38]
        ldr     r2, [r12, +r7]
        str     r0, [sp, #0x48]
        str     r1, [sp, #0x44]
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r10
        mov     r3, r9
        bl      __muldf3
        ldr     r3, [sp, #0x44]
        ldr     r2, [sp, #0x48]
        bl      __adddf3
        bl      __truncdfsf2
        ldr     lr, [sp, #0x18]
        ldr     r12, [r5, #4]
        add     r12, lr, r12
        str     r0, [r12, #4]
        ldr     r12, [sp, #0x18]
        ldr     r0, [r11, +r7]
        add     r12, r12, #0x28
        str     r12, [sp, #0x18]
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r8
        bl      __muldf3
        ldr     r12, [sp, #0x40]
        ldr     r2, [r12, #4]
        str     r0, [sp, #0x48]
        str     r1, [sp, #0x44]
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r10
        mov     r3, r9
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x48]
        mov     r3, r1
        ldr     r1, [sp, #0x44]
        bl      __subdf3
        bl      __truncdfsf2
        ldr     lr, [sp, #0x20]
        ldr     r12, [r5, #4]
        str     r0, [r12, +lr]
        ldr     r12, [sp, #0x40]
        ldr     r0, [r12, #4]
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [r11, +r7]
        str     r0, [sp, #0x48]
        mov     r11, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r10
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #0x48]
        mov     r3, r11
        bl      __adddf3
        bl      __truncdfsf2
        ldr     r12, [r5, #4]
        ldr     lr, [sp, #0x20]
        add     r12, lr, r12
        str     r0, [r12, #4]
        ldr     r12, [sp, #0x2C]
        ldr     r0, [r12, +r7]
        ldr     r12, [sp, #0x20]
        add     r12, r12, #0x28
        str     r12, [sp, #0x20]
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r8
        bl      __muldf3
        ldr     r12, [sp, #0x3C]
        mov     r11, r0
        ldr     r2, [r12, #4]
        str     r1, [sp, #0x48]
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r10
        mov     r3, r9
        bl      __muldf3
        mov     r3, r1
        ldr     r1, [sp, #0x48]
        mov     r2, r0
        mov     r0, r11
        bl      __subdf3
        bl      __truncdfsf2
        ldr     r12, [r5, #4]
        ldr     r11, [sp, #0x1C]
        str     r0, [r12, +r11]
        ldr     r12, [sp, #0x3C]
        ldr     r0, [r12, #4]
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r8
        bl      __muldf3
        ldr     r12, [sp, #0x2C]
        mov     r4, r0
        mov     r8, r1
        ldr     r2, [r12, +r7]
        add     r7, r7, #0x30
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r10
        mov     r3, r9
        bl      __muldf3
        mov     r2, r4
        mov     r3, r8
        bl      __adddf3
        bl      __truncdfsf2
        ldr     r3, [r5, #4]
        ldr     r2, [sp, #0xC]
        add     r3, r11, r3
        add     r11, r11, #0x28
        subs    r2, r2, #1
        str     r2, [sp, #0xC]
        str     r0, [r3, #4]
        str     r11, [sp, #0x1C]
        bne     LBRM0
        ldr     r2, [sp, #4]
LBRM3:
        ldr     r0, [r5, #4]
        ldr     r1, [r5, #0xC]
        bl      ownsConvert32fcTo16sc
LBRM4:
        add     r0, r0, #0xE
        str     r0, [r5, #0x34]
        mov     r0, #0
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
LBRM5:
        mvn     r0, #0x10
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
LBRM6:
        ldr     r0, [r6]
        ldr     r1, [sp]
        str     r0, [sp, #0x28]
        bl      __eqsf2
        cmp     r0, #0
        bne     LBRM2
        mvn     r0, #9
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
LBRM7:
        ldr     r2, [sp, #0x24]
        ldr     r1, [sp]
        ldr     r0, [r2, #0x30]
        bl      __eqsf2
        cmp     r0, #0
        bne     LBRM1
        mvn     r0, #9
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
LBRM8:
        ldr     r10, [r5, #0x2C]
        ldr     r2, [pc, #0x7F8]
        add     r3, r4, #8
        ldr     r6, [r3, +r10, lsl #3]
        add     r8, r3, r10, lsl #3
        ldr     r7, [r2]
        mov     r0, r6
        mov     r1, r7
        bl      __eqsf2
        cmp     r0, #0
        ldrne   r11, [r8, #4]
        beq     LBRM12
LBRM9:
        mov     r0, r11
        bl      __extendsfdf2
        mov     r8, r0
        mov     r9, r1
        mov     r0, r6
        bl      __extendsfdf2
        mov     r6, r0
        eor     r11, r11, #2, 2
        mov     r7, r1
        str     r11, [sp, #0x48]
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        str     r0, [sp, #0x44]
        mov     r11, r1
        mov     r2, r8
        mov     r0, r8
        mov     r3, r9
        mov     r1, r9
        bl      __muldf3
        ldr     r2, [sp, #0x44]
        mov     r3, r11
        bl      __adddf3
        str     r0, [sp, #0x44]
        ldr     r0, [sp, #0x48]
        mov     r11, r1
        bl      __extendsfdf2
        ldr     r2, [sp, #0x44]
        mov     r3, r11
        bl      __divdf3
        ldr     r2, [sp, #0x44]
        mov     r8, r0
        str     r8, [sp, #4]
        mov     r9, r1
        str     r9, [sp]
        mov     r3, r11
        mov     r0, r6
        mov     r1, r7
        bl      __divdf3
        ldr     r2, [r4]
        mov     r7, r0
        mov     r6, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        ldr     r2, [r4, #4]
        str     r0, [sp, #0x48]
        mov     r11, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x48]
        mov     r3, r1
        mov     r1, r11
        bl      __subdf3
        bl      __truncdfsf2
        ldr     r12, [r5, #4]
        str     r0, [r12]
        ldr     r0, [r4, #4]
        mov     r12, r10, lsl #1
        add     r12, r12, #1
        str     r12, [sp, #0x2C]
        bl      __extendsfdf2
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        str     r0, [sp, #0x48]
        ldr     r0, [r4]
        mov     r11, r1
        bl      __extendsfdf2
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #0x48]
        mov     r3, r11
        bl      __adddf3
        bl      __truncdfsf2
        ldr     r12, [r5, #4]
        str     r0, [r12, #4]
        add     r12, r10, #1
        cmp     r12, #1
        ble     LBRM11
        add     r12, r10, #1
        ldr     r9, [sp]
        add     r8, r4, r12, lsl #3
        add     r10, r4, #4
        ldr     r4, [sp, #4]
        mov     lr, #1
        add     r8, r8, #4
        mov     r11, r12
        str     r12, [sp, #0x28]
        str     lr, [sp, #0x24]
LBRM10:
        ldr     r0, [r10, #4]
        bl      __extendsfdf2
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        ldr     r2, [r10, #8]
        str     r0, [sp, #0x48]
        str     r1, [sp, #0x44]
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r9
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x48]
        mov     r3, r1
        ldr     r1, [sp, #0x44]
        bl      __subdf3
        bl      __truncdfsf2
        ldr     r12, [r5, #4]
        ldr     lr, [sp, #0x24]
        str     r0, [r12, +lr, lsl #3]
        add     lr, lr, #1
        str     lr, [sp, #0x24]
        ldr     r0, [r10, #4]
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r9
        bl      __muldf3
        str     r0, [sp, #0x48]
        str     r1, [sp, #0x44]
        ldr     r0, [r10, #8]!
        bl      __extendsfdf2
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        ldr     r3, [sp, #0x44]
        ldr     r2, [sp, #0x48]
        bl      __adddf3
        bl      __truncdfsf2
        ldr     lr, [sp, #8]
        ldr     r12, [r5, #4]
        add     lr, r12, lr
        str     r0, [lr, #4]
        ldr     r12, [sp, #8]
        ldr     r0, [r8, #4]
        add     r12, r12, #8
        str     r12, [sp, #8]
        bl      __extendsfdf2
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        str     r0, [sp, #0x48]
        str     r1, [sp, #0x44]
        ldr     r0, [r8, #8]
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r9
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [sp, #0x48]
        ldr     r1, [sp, #0x44]
        bl      __subdf3
        bl      __truncdfsf2
        ldr     r12, [r5, #4]
        str     r0, [r12, +r11, lsl #3]
        ldr     r0, [r8, #4]
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r9
        bl      __muldf3
        str     r0, [sp, #0x48]
        ldr     r0, [r8, #8]!
        str     r1, [sp, #0x44]
        bl      __extendsfdf2
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        ldr     r2, [sp, #0x48]
        ldr     r3, [sp, #0x44]
        bl      __adddf3
        bl      __truncdfsf2
        ldr     r12, [r5, #4]
        ldr     r1, [sp, #0x28]
        ldr     lr, [sp, #0x24]
        add     r12, r12, r11, lsl #3
        cmp     lr, r1
        str     r0, [r12, #4]
        add     r11, r11, #1
        blt     LBRM10
LBRM11:
        ldr     r2, [sp, #0x2C]
        ldr     r0, [r5, #4]
        ldr     r1, [r5, #0xC]
        bl      ownsConvert32fcTo16sc
        b       LBRM4
LBRM12:
        ldr     r11, [r8, #4]
        mov     r1, r7
        mov     r0, r11
        bl      __eqsf2
        cmp     r0, #0
        bne     LBRM9
        mvn     r0, #9
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
_ippsIIRInit32fc_16sc:
        stmdb   sp!, {r4 - r10, lr}
        sub     sp, sp, #8
        ldr     r10, [sp, #0x28]
        mov     r7, r1
        cmp     r7, #0
        mov     r8, r0
        mov     r6, r2
        mov     r5, r3
        beq     LBRM15
        cmp     r8, #0
        beq     LBRM15
        cmp     r10, #0
        beq     LBRM15
        cmp     r6, #1
        blt     LBRM14
        ldr     r12, [pc, #0x46C]
        add     r9, r7, #8
        ldr     r0, [r9, +r6, lsl #3]
        ldr     r4, [r12]
        mov     r1, r4
        bl      __eqsf2
        cmp     r0, #0
        bne     LBRM13
        add     r9, r9, r6, lsl #3
        ldr     r0, [r9, #4]
        mov     r1, r4
        bl      __eqsf2
        cmp     r0, #0
        bne     LBRM13
        mvn     r0, #9
        add     sp, sp, #8
        ldmia   sp!, {r4 - r10, pc}
LBRM13:
        str     r10, [sp]
        mov     r0, r8
        mov     r3, r5
        mov     r2, r6
        mov     r1, r7
        bl      LBRM_ownsIIRInit32fc_16sc
        add     sp, sp, #8
        ldmia   sp!, {r4 - r10, pc}
LBRM14:
        mvn     r0, #0x18
        add     sp, sp, #8
        ldmia   sp!, {r4 - r10, pc}
LBRM15:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r10, pc}
LBRM_ownsIIRInit32fc_16sc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        ldr     lr, [sp, #0x30]
        cmp     r2, #0
        mov     r7, #0
        mov     r6, r7
        mov     r12, #1
        movlt   r6, r12
        add     r12, r2, r6
        and     r6, r2, #1
        mov     r5, r0
        cmp     r6, #1
        mov     r0, r1
        mov     r4, r3
        mov     r12, r12, asr #1
        addeq   r12, r12, #1
        ldr     r6, [pc, #0x3B4]
        add     lr, lr, #7
        bic     lr, lr, #7
        str     lr, [r5]
        str     r6, [lr]
        ldr     r9, [r5]
        add     r10, r2, #2
        add     r8, lr, #0x48
        str     r8, [r9, #4]
        mov     r10, r10, lsl #4
        ldr     r8, [r5]
        add     r9, r10, #7
        bic     r9, r9, #7
        add     lr, lr, r9
        add     r9, lr, #0x48
        str     r9, [r8, #8]
        ldr     r8, [r5]
        mov     r9, r2, lsl #3
        add     r9, r9, #7
        bic     r9, r9, #7
        add     lr, lr, r9
        add     r9, r2, #1
        add     r10, lr, #0x48
        str     r10, [r8, #0xC]
        ldr     r8, [r5]
        mov     r9, r9, lsl #3
        add     r9, r9, #7
        bic     r9, r9, #7
        add     r9, lr, r9
        add     lr, r9, #0x48
        str     lr, [r8, #0x10]
        ldr     lr, [r5]
        str     r7, [lr, #0x14]
        ldr     lr, [r5]
        str     r7, [lr, #0x18]
        ldr     lr, [r5]
        str     r7, [lr, #0x1C]
        ldr     lr, [r5]
        str     r7, [lr, #0x20]
        ldr     lr, [r5]
        str     r7, [lr, #0x24]
        ldr     lr, [r5]
        str     r7, [lr, #0x28]
        ldr     lr, [r5]
        str     r2, [lr, #0x2C]
        ldr     r2, [r5]
        str     r7, [r2, #0x30]
        ldr     r2, [r5]
        str     r7, [r2, #0x34]
        ldr     r2, [r5]
        str     r12, [r2, #0x38]
        ldr     r2, [r5]
        str     r7, [r2, #0x3C]
        ldr     r2, [r5]
        str     r7, [r2, #0x40]
        ldr     r1, [r5]
        bl      LBRM_ownsIIRSetTaps32fc_16sc
        cmp     r0, #0
        addne   sp, sp, #0xC
        ldmneia sp!, {r4 - r11, pc}
        ldr     r5, [r5]
        ldr     r0, [r5]
        cmp     r6, r0
        ldreq   r9, [r5, #0x2C]
        movne   r9, r7
        add     r6, r6, #1
        cmp     r6, r0
        ldreq   r0, [r5, #0x2C]
        moveq   r9, r0, lsl #1
        cmp     r4, #0
        beq     LBRM24
        cmp     r9, #0
        ble     LBRM19
        cmp     r9, #5
        movlt   r10, r7
        blt     LBRM17
        mov     r10, r7
        sub     r8, r9, #5
        mov     r6, r10
        sub     lr, r4, #4
        mov     r12, #8
        mov     r2, #0x10
        mov     r0, #0x18
LBRM16:
        ldr     r1, [r5, #8]
        ldr     r11, [lr, #4]
        str     r11, [r1, +r10, lsl #3]
        ldr     r1, [r5, #8]
        ldr     r11, [lr, #8]
        add     r10, r10, #4
        cmp     r10, r8
        add     r1, r1, r6
        str     r11, [r1, #4]
        ldr     r1, [r5, #8]
        ldr     r11, [lr, #0xC]
        add     r6, r6, #0x20
        str     r11, [r12, +r1]
        ldr     r1, [r5, #8]
        ldr     r11, [lr, #0x10]
        add     r1, r1, r12
        add     r12, r12, #0x20
        str     r11, [r1, #4]
        ldr     r1, [r5, #8]
        ldr     r11, [lr, #0x14]
        str     r11, [r2, +r1]
        ldr     r1, [r5, #8]
        ldr     r11, [lr, #0x18]
        add     r1, r1, r2
        add     r2, r2, #0x20
        str     r11, [r1, #4]
        ldr     r1, [r5, #8]
        ldr     r11, [lr, #0x1C]
        str     r11, [r0, +r1]
        ldr     r1, [r5, #8]
        ldr     r11, [lr, #0x20]!
        add     r1, r1, r0
        str     r11, [r1, #4]
        add     r0, r0, #0x20
        ble     LBRM16
LBRM17:
        mov     r0, r10, lsl #3
        sub     r2, r0, #4
        add     r2, r2, r4
LBRM18:
        ldr     lr, [r5, #8]
        ldr     r12, [r2, #4]
        str     r12, [lr, +r10, lsl #3]
        ldr     lr, [r5, #8]
        ldr     r12, [r2, #8]!
        add     r10, r10, #1
        add     lr, lr, r0
        cmp     r10, r9
        str     r12, [lr, #4]
        add     r0, r0, #8
        blt     LBRM18
LBRM19:
        cmp     r9, #0
        ble     LBRM23
        cmp     r9, #5
        movlt   r8, r7
        blt     LBRM21
        mov     r8, r7
        sub     r0, r9, #5
        sub     r6, r4, #0x1C
        str     r0, [sp]
        str     r9, [sp, #4]
LBRM20:
        ldr     r0, [r6, #0x1C]
        add     r11, r8, #1
        add     r10, r8, #2
        bl      __fixsfdi
        ldr     r2, [r5, #0x10]
        str     r0, [r2, +r8, lsl #4]
        add     r2, r2, r7
        str     r1, [r2, #4]
        ldr     r0, [r6, #0x20]!
        add     r9, r4, r11, lsl #3
        bl      __fixsfdi
        ldr     r2, [r5, #0x10]
        add     r2, r2, r7
        str     r0, [r2, #8]
        str     r1, [r2, #0xC]
        ldr     r0, [r4, +r11, lsl #3]
        add     r7, r7, #0x40
        bl      __fixsfdi
        ldr     r2, [r5, #0x10]
        str     r0, [r2, +r11, lsl #4]
        add     r0, r4, r10, lsl #3
        str     r0, [sp, #8]
        add     r2, r2, r11, lsl #4
        str     r1, [r2, #4]
        ldr     r0, [r9, #4]
        add     r9, r8, #3
        add     r8, r8, #4
        bl      __fixsfdi
        ldr     r2, [r5, #0x10]
        add     r11, r2, r11, lsl #4
        str     r0, [r11, #8]
        str     r1, [r11, #0xC]
        ldr     r0, [r4, +r10, lsl #3]
        add     r11, r4, r9, lsl #3
        bl      __fixsfdi
        ldr     r2, [r5, #0x10]
        str     r0, [r2, +r10, lsl #4]
        add     r2, r2, r10, lsl #4
        str     r1, [r2, #4]
        ldr     r0, [sp, #8]
        ldr     r0, [r0, #4]
        bl      __fixsfdi
        ldr     r2, [r5, #0x10]
        add     r10, r2, r10, lsl #4
        str     r0, [r10, #8]
        str     r1, [r10, #0xC]
        ldr     r0, [r4, +r9, lsl #3]
        bl      __fixsfdi
        ldr     r2, [r5, #0x10]
        str     r0, [r2, +r9, lsl #4]
        add     r2, r2, r9, lsl #4
        str     r1, [r2, #4]
        ldr     r0, [r11, #4]
        bl      __fixsfdi
        ldr     r2, [r5, #0x10]
        ldr     r12, [sp]
        add     r9, r2, r9, lsl #4
        cmp     r8, r12
        str     r0, [r9, #8]
        str     r1, [r9, #0xC]
        ble     LBRM20
        ldr     r9, [sp, #4]
LBRM21:
        mov     r0, r8, lsl #3
        sub     r0, r0, #4
        add     r4, r0, r4
        mov     r6, r8, lsl #4
LBRM22:
        ldr     r0, [r4, #4]
        bl      __fixsfdi
        ldr     r2, [r5, #0x10]
        str     r0, [r2, +r8, lsl #4]
        add     r2, r2, r6
        str     r1, [r2, #4]
        ldr     r0, [r4, #8]!
        add     r8, r8, #1
        bl      __fixsfdi
        ldr     r2, [r5, #0x10]
        add     r2, r2, r6
        cmp     r8, r9
        str     r0, [r2, #8]
        str     r1, [r2, #0xC]
        add     r6, r6, #0x10
        blt     LBRM22
LBRM23:
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LBRM24:
        ldr     r0, [r5, #8]
        mov     r1, r9
        bl      _ippsZero_32fc
        ldr     r0, [r5, #0x10]
        mov     r1, r9
        bl      _ippsZero_64sc
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
        .long   0x49493038
        .long   LBRM__2il0floatpacket.1
        .long   LBRM__2il0floatpacket.2
        .long   0x49493037


        .data
        .align  4


LBRM__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00
LBRM__2il0floatpacket.2:
        .byte   0x00,0x00,0x00,0x00


