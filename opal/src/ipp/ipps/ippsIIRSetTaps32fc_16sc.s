        .text
        .align  4
        .globl  _ippsIIRSetTaps32fc_16sc


_ippsIIRSetTaps32fc_16sc:
        cmp     r0, #0
        beq     LBRB1
        cmp     r1, #0
        beq     LBRB1
        ldr     r3, [pc, #0x998]
        ldr     r12, [r1]
        sub     r2, r3, #1
        cmp     r2, r12
        beq     LBRB0
        cmp     r3, r12
        mvnne   r0, #0x10
        bxne    lr
LBRB0:
        b       LBRB_ownsIIRSetTaps32fc_16sc
LBRB1:
        mvn     r0, #7
        bx      lr
LBRB_ownsIIRSetTaps32fc_16sc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x4C
        ldr     r2, [pc, #0x964]
        mov     r5, r1
        ldr     r3, [r5]
        sub     r12, r2, #1
        mov     lr, #8
        mov     r4, r0
        cmp     r12, r3
        str     lr, [sp, #8]
        beq     LBRB10
        cmp     r2, r3
        bne     LBRB7
        ldr     r3, [r5, #0x2C]
        cmp     r3, #0
        add     r2, r3, r3, lsl #2
        ble     LBRB5
        ldr     lr, [pc, #0x92C]
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
LBRB2:
        ldr     r0, [sp, #0x24]
        ldr     r1, [sp]
        ldr     r4, [r0, #0x2C]
        mov     r0, r4
        bl      __eqsf2
        cmp     r0, #0
        beq     LBRB9
LBRB3:
        ldr     r0, [r6, #-4]
        ldr     r1, [sp]
        str     r0, [sp, #0x2C]
        bl      __eqsf2
        cmp     r0, #0
        ldrne   r2, [r6]
        strne   r2, [sp, #0x28]
        beq     LBRB8
LBRB4:
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
        bne     LBRB2
        ldr     r2, [sp, #4]
LBRB5:
        ldr     r0, [r5, #4]
        ldr     r1, [r5, #0xC]
        bl      ownsConvert32fcTo16sc
LBRB6:
        add     r0, r0, #0xE
        str     r0, [r5, #0x34]
        mov     r0, #0
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
LBRB7:
        mvn     r0, #0x10
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
LBRB8:
        ldr     r0, [r6]
        ldr     r1, [sp]
        str     r0, [sp, #0x28]
        bl      __eqsf2
        cmp     r0, #0
        bne     LBRB4
        mvn     r0, #9
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
LBRB9:
        ldr     r2, [sp, #0x24]
        ldr     r1, [sp]
        ldr     r0, [r2, #0x30]
        bl      __eqsf2
        cmp     r0, #0
        bne     LBRB3
        mvn     r0, #9
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
LBRB10:
        ldr     r10, [r5, #0x2C]
        ldr     r2, [pc, #0x350]
        add     r3, r4, #8
        ldr     r6, [r3, +r10, lsl #3]
        add     r8, r3, r10, lsl #3
        ldr     r7, [r2]
        mov     r0, r6
        mov     r1, r7
        bl      __eqsf2
        cmp     r0, #0
        ldrne   r11, [r8, #4]
        beq     LBRB14
LBRB11:
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
        ble     LBRB13
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
LBRB12:
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
        blt     LBRB12
LBRB13:
        ldr     r2, [sp, #0x2C]
        ldr     r0, [r5, #4]
        ldr     r1, [r5, #0xC]
        bl      ownsConvert32fcTo16sc
        b       LBRB6
LBRB14:
        ldr     r11, [r8, #4]
        mov     r1, r7
        mov     r0, r11
        bl      __eqsf2
        cmp     r0, #0
        bne     LBRB11
        mvn     r0, #9
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
        .long   0x49493038
        .long   LBRB__2il0floatpacket.1


        .data
        .align  4


LBRB__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


