        .text
        .align  4
        .globl  _ippsIIRSetTaps32sc_16sc


_ippsIIRSetTaps32sc_16sc:
        stmdb   sp!, {lr}
        cmp     r0, #0
        beq     LBNU1
        cmp     r1, #0
        beq     LBNU1
        ldr     r12, [pc, #0x998]
        ldr     lr, [r1]
        sub     r3, r12, #1
        cmp     r3, lr
        beq     LBNU0
        cmp     r12, lr
        mvnne   r0, #0x10
        ldrne   pc, [sp], #4
LBNU0:
        ldr     lr, [sp], #4
        b       LBNU_ownsIIRSetTaps32sc_16sc
LBNU1:
        mvn     r0, #7
        ldr     pc, [sp], #4
LBNU_ownsIIRSetTaps32sc_16sc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x50
        ldr     lr, [pc, #0x960]
        mov     r5, r1
        ldr     r12, [r5]
        ldr     r4, [r5, #4]
        sub     r6, lr, #1
        mov     r9, r0
        cmp     r6, r12
        mov     r3, r2
        beq     LBNU10
        cmp     lr, r12
        beq     LBNU2
        mvn     r0, #0x10
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LBNU2:
        ldr     r8, [r5, #0x2C]
        mov     r1, r4
        rsb     r12, r8, r8, lsl #2
        mov     r0, r9
        mov     r2, r12, lsl #2
        bl      _ippsConvert_32s32f_Sfs
        cmp     r8, #0
        add     r2, r8, r8, lsl #2
        ble     LBNU6
        ldr     r12, [pc, #0x908]
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
LBNU3:
        ldr     r0, [sp, #0x14]
        ldr     r0, [r0]
        bl      __floatsisf
        ldr     r1, [sp, #8]
        bl      __eqsf2
        cmp     r0, #0
        beq     LBNU9
LBNU4:
        ldr     r0, [sp]
        ldr     r0, [r0]
        bl      __floatsisf
        ldr     r1, [sp, #8]
        bl      __eqsf2
        cmp     r0, #0
        beq     LBNU8
LBNU5:
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
        bne     LBNU3
        ldr     r2, [sp, #0xC]
        ldr     r5, [sp, #0x10]
LBNU6:
        ldr     r0, [r5, #4]
        ldr     r1, [r5, #0xC]
        bl      ownsConvert32fcTo16sc
LBNU7:
        add     r0, r0, #0xE
        str     r0, [r5, #0x34]
        mov     r0, #0
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LBNU8:
        ldr     r0, [sp]
        ldr     r0, [r0, #4]
        bl      __floatsisf
        ldr     r1, [sp, #8]
        bl      __eqsf2
        cmp     r0, #0
        bne     LBNU5
        mvn     r0, #9
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LBNU9:
        ldr     r0, [sp, #0x14]
        ldr     r0, [r0, #4]
        bl      __floatsisf
        ldr     r1, [sp, #8]
        bl      __eqsf2
        cmp     r0, #0
        bne     LBNU4
        mvn     r0, #9
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LBNU10:
        ldr     r8, [r5, #0x2C]
        add     r12, r9, #8
        ldr     lr, [r12, +r8, lsl #3]
        cmp     lr, #0
        bne     LBNU11
        add     r12, r12, r8, lsl #3
        ldr     r12, [r12, #4]
        cmp     r12, #0
        bne     LBNU11
        mvn     r0, #9
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LBNU11:
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
        ble     LBNU13
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
LBNU12:
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
        blt     LBNU12
        ldr     r4, [sp, #0x1C]
        ldr     r5, [sp, #0x10]
LBNU13:
        ldr     r2, [sp, #0x20]
        ldr     r1, [r5, #0xC]
        mov     r0, r4
        bl      ownsConvert32fcTo16sc
        b       LBNU7
        .long   0x49493132
        .long   LBNU__2il0floatpacket.1


        .data
        .align  4


LBNU__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


