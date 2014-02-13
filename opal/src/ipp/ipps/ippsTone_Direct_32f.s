        .text
        .align  4
        .globl  _ippsTone_Direct_32f


_ippsTone_Direct_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x48
        ldr     r11, [sp, #0x6C]
        mov     r7, r0
        mov     r6, r1
        cmp     r11, #0
        mov     r8, r2
        mov     r4, r3
        beq     LAOH11
        ldr     r12, [pc, #0x5E0]
        mov     r0, r8
        ldr     r9, [r12]
        mov     r1, r9
        bl      __lesf2
        cmp     r0, #0
        ble     LAOH9
        mov     r0, r4
        mov     r1, r9
        bl      __ltsf2
        cmp     r0, #0
        blt     LAOH8
        mov     r0, r4
        bl      __extendsfdf2
        mov     r3, #0xFE, 12
        mov     r5, r0
        mov     r4, r1
        orr     r3, r3, #3, 4
        mov     r2, #0
        bl      __gedf2
        cmp     r0, #0
        bge     LAOH8
        ldr     r10, [r11]
        mov     r1, r9
        mov     r0, r10
        bl      __ltsf2
        cmp     r0, #0
        blt     LAOH7
        mov     r0, r10
        bl      __extendsfdf2
        ldr     r2, [pc, #0x56C]
        ldr     r3, [pc, #0x56C]
        str     r0, [sp, #4]
        str     r1, [sp]
        bl      __gedf2
        cmp     r0, #0
        bge     LAOH7
        cmp     r7, #0
        beq     LAOH11
        cmp     r6, #0
        ble     LAOH10
        mov     r0, r5
        mov     r1, r4
        ldr     r2, [pc, #0x538]
        ldr     r3, [pc, #0x538]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        mov     r0, r6
        bl      __floatsidf
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [sp, #4]
        ldr     r3, [sp]
        bl      __adddf3
        ldr     r2, [pc, #0x50C]
        ldr     r3, [pc, #0x50C]
        str     r0, [sp, #0x38]
        ldr     r0, [sp, #0x38]
        str     r1, [sp, #0x34]
        bl      __muldf3
        bl      floor
        ldr     r2, [pc, #0x4E8]
        ldr     r3, [pc, #0x4E8]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [sp, #0x38]
        ldr     r1, [sp, #0x34]
        bl      __subdf3
        bl      __truncdfsf2
        str     r0, [sp, #8]
        bl      __extendsfdf2
        str     r0, [sp, #4]
        str     r1, [sp]
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        blt     LAOH0
        ldr     r0, [sp, #4]
        ldr     r1, [sp]
        ldr     r2, [pc, #0x498]
        ldr     r3, [pc, #0x498]
        bl      __gedf2
        cmp     r0, #0
        ldrlt   r12, [sp, #8]
        strlt   r12, [r11]
        blt     LAOH1
LAOH0:
        str     r9, [r11]
LAOH1:
        mov     r0, r10
        bl      __extendsfdf2
        str     r1, [sp, #4]
        mov     r9, r0
        bl      cos
        str     r0, [sp, #0x38]
        mov     r0, r8
        mov     r10, r1
        bl      __extendsfdf2
        ldr     r2, [sp, #0x38]
        mov     r8, r0
        mov     r11, r1
        mov     r3, r10
        bl      __muldf3
        str     r1, [sp, #0x34]
        mov     r10, r0
        bl      __truncdfsf2
        cmp     r6, #1
        str     r0, [r7]
        beq     LAOH6
        mov     r2, r9
        ldr     r3, [sp, #4]
        mov     r0, r4
        mov     r1, r5
        bl      __adddf3
        bl      cos
        mov     r2, r8
        mov     r3, r11
        bl      __muldf3
        mov     r9, r0
        mov     r8, r1
        bl      __truncdfsf2
        cmp     r6, #2
        str     r0, [r7, #4]
        beq     LAOH6
        mov     r1, r5
        mov     r0, r4
        bl      cos
        mov     r2, r0
        mov     r3, r1
        bl      __adddf3
        mov     r5, r0
        mov     r11, r1
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        ldr     r3, [sp, #0x34]
        mov     r2, r10
        bl      __subdf3
        str     r1, [sp, #0x2C]
        mov     r4, r0
        bl      __truncdfsf2
        cmp     r6, #3
        str     r0, [r7, #8]
        beq     LAOH6
        mov     r2, r5
        mov     r3, r11
        mov     r0, r4
        ldr     r1, [sp, #0x2C]
        bl      __muldf3
        mov     r2, r9
        mov     r3, r8
        bl      __subdf3
        str     r0, [sp, #0x28]
        str     r1, [sp, #0x30]
        bl      __truncdfsf2
        str     r0, [r7, #0xC]
        mov     r0, r5
        mov     r2, r5
        mov     r1, r11
        mov     r3, r11
        bl      __muldf3
        mov     r2, #0
        mov     r3, #1, 2
        bl      __subdf3
        bic     r12, r6, #1
        cmp     r12, #4
        mov     r2, r0
        str     r1, [sp, #4]
        ble     LAOH5
        sub     lr, r12, #4
        cmp     lr, #8
        movlt   r0, #4
        blt     LAOH3
        add     lr, r7, #0x1C
        add     r5, r7, #0x18
        str     r7, [sp, #0xC]
        ldr     r7, [sp, #4]
        mov     r0, #4
        sub     r11, r12, #8
        str     r6, [sp, #0x10]
        str     r0, [sp, #0x24]
        str     lr, [sp, #0x38]
        str     r11, [sp, #0x20]
        str     r12, [sp, #8]
        mov     r6, r2
LAOH2:
        mov     r3, r7
        mov     r0, r4
        ldr     r1, [sp, #0x2C]
        mov     r2, r6
        bl      __muldf3
        ldr     r3, [sp, #0x34]
        mov     r2, r10
        bl      __subdf3
        str     r1, [sp, #0x3C]
        str     r0, [sp, #0x40]
        ldr     r0, [sp, #0x28]
        ldr     r1, [sp, #0x30]
        mov     r3, r7
        mov     r2, r6
        bl      __muldf3
        mov     r3, r8
        mov     r2, r9
        bl      __subdf3
        str     r0, [sp, #0x44]
        mov     r11, r1
        ldr     r1, [sp, #0x3C]
        ldr     r0, [sp, #0x40]
        bl      __truncdfsf2
        str     r0, [r5, #-8]
        ldr     r0, [sp, #0x44]
        mov     r1, r11
        bl      __truncdfsf2
        ldr     r12, [sp, #0x38]
        mov     r2, r6
        str     r0, [r12, #-8]
        ldr     r0, [sp, #0x40]
        ldr     r1, [sp, #0x3C]
        mov     r3, r7
        bl      __muldf3
        ldr     r3, [sp, #0x2C]
        mov     r2, r4
        bl      __subdf3
        mov     r10, r0
        ldr     r0, [sp, #0x44]
        str     r1, [sp, #0x34]
        mov     r2, r6
        mov     r3, r7
        mov     r1, r11
        bl      __muldf3
        ldr     r3, [sp, #0x30]
        ldr     r2, [sp, #0x28]
        bl      __subdf3
        mov     r8, r1
        ldr     r1, [sp, #0x34]
        mov     r9, r0
        mov     r0, r10
        bl      __truncdfsf2
        str     r0, [r5]
        mov     r0, r9
        mov     r1, r8
        bl      __truncdfsf2
        ldr     r12, [sp, #0x38]
        mov     r2, r6
        str     r0, [r12]
        ldr     r1, [sp, #0x34]
        mov     r0, r10
        mov     r3, r7
        bl      __muldf3
        ldr     r2, [sp, #0x40]
        ldr     r3, [sp, #0x3C]
        bl      __subdf3
        str     r1, [sp, #0x2C]
        mov     r4, r0
        mov     r0, r9
        mov     r1, r8
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        ldr     r2, [sp, #0x44]
        mov     r3, r11
        bl      __subdf3
        str     r1, [sp, #0x30]
        ldr     r1, [sp, #0x2C]
        str     r0, [sp, #0x28]
        mov     r0, r4
        bl      __truncdfsf2
        str     r0, [r5, #8]
        ldr     r0, [sp, #0x28]
        ldr     r1, [sp, #0x30]
        add     r5, r5, #0x18
        bl      __truncdfsf2
        ldr     r12, [sp, #0x24]
        add     r12, r12, #6
        str     r12, [sp, #0x24]
        ldr     r12, [sp, #0x38]
        str     r0, [r12, #8]
        ldr     r12, [sp, #0x24]
        ldr     lr, [sp, #0x20]
        cmp     r12, lr
        ldr     r12, [sp, #0x38]
        add     r12, r12, #0x18
        str     r12, [sp, #0x38]
        ble     LAOH2
        mov     r2, r6
        ldr     r0, [sp, #0x24]
        ldr     r12, [sp, #8]
        ldr     r6, [sp, #0x10]
        ldr     r7, [sp, #0xC]
LAOH3:
        add     r11, r7, r0, lsl #2
        mov     lr, #4
        str     r10, [sp, #0x18]
        add     r5, lr, r11
        str     r12, [sp, #8]
        str     r2, [sp, #0x1C]
        str     r8, [sp]
        str     r9, [sp, #0x14]
        str     r6, [sp, #0x10]
        str     r7, [sp, #0xC]
        mov     r10, r0
LAOH4:
        mov     r0, r4
        ldr     r1, [sp, #0x2C]
        ldr     r2, [sp, #0x1C]
        ldr     r3, [sp, #4]
        add     r10, r10, #2
        bl      __muldf3
        ldr     r3, [sp, #0x34]
        ldr     r2, [sp, #0x18]
        bl      __subdf3
        mov     r8, r1
        mov     r9, r0
        ldr     r0, [sp, #0x28]
        ldr     r1, [sp, #0x30]
        ldr     r2, [sp, #0x1C]
        ldr     r3, [sp, #4]
        bl      __muldf3
        ldr     r2, [sp, #0x14]
        ldr     r3, [sp]
        bl      __subdf3
        mov     r7, r1
        mov     r6, r0
        mov     r1, r8
        mov     r0, r9
        bl      __truncdfsf2
        str     r0, [r11], #8
        mov     r0, r6
        mov     r1, r7
        bl      __truncdfsf2
        ldr     r2, [sp, #0x2C]
        str     r2, [sp, #0x34]
        ldr     r2, [sp, #0x28]
        str     r4, [sp, #0x18]
        mov     r4, r9
        str     r2, [sp, #0x14]
        ldr     r2, [sp, #0x30]
        str     r2, [sp]
        str     r0, [r5], #8
        ldr     r2, [sp, #8]
        str     r8, [sp, #0x2C]
        cmp     r10, r2
        str     r6, [sp, #0x28]
        str     r7, [sp, #0x30]
        blt     LAOH4
        ldr     r2, [sp, #0x1C]
        ldr     r10, [sp, #0x18]
        ldr     r6, [sp, #0x10]
        ldr     r7, [sp, #0xC]
LAOH5:
        tst     r6, #1
        beq     LAOH6
        mov     r0, r4
        ldr     r1, [sp, #0x2C]
        ldr     r3, [sp, #4]
        sub     r7, r7, #4
        bl      __muldf3
        ldr     r3, [sp, #0x34]
        mov     r2, r10
        bl      __subdf3
        bl      __truncdfsf2
        str     r0, [r7, +r6, lsl #2]
LAOH6:
        mov     r0, #0
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LAOH7:
        mvn     r0, #0x2B
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LAOH8:
        mvn     r0, #0x2C
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LAOH9:
        mvn     r0, #0x2D
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LAOH10:
        mvn     r0, #5
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LAOH11:
        mvn     r0, #7
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
        .long   LAOH__2il0floatpacket.1
        .long   0x54442d18
        .long   0x401921fb
        .long   0x6dc9c883
        .long   0x3fc45f30


        .data
        .align  4


LAOH__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


