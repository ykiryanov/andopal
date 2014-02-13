        .text
        .align  4
        .globl  _ippsTone_Direct_32fc


_ippsTone_Direct_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x34
        ldr     r11, [sp, #0x58]
        mov     r10, r0
        mov     r9, r1
        cmp     r11, #0
        mov     r4, r2
        mov     r6, r3
        beq     LAOG10
        ldr     r12, [pc, #0x540]
        mov     r0, r4
        ldr     r5, [r12]
        mov     r1, r5
        bl      __lesf2
        cmp     r0, #0
        ble     LAOG8
        mov     r0, r6
        mov     r1, r5
        bl      __ltsf2
        cmp     r0, #0
        blt     LAOG7
        mov     r0, r6
        bl      __extendsfdf2
        mov     r3, #0xFF, 12
        mov     r7, r0
        mov     r6, r1
        orr     r3, r3, #3, 4
        mov     r2, #0
        bl      __gedf2
        cmp     r0, #0
        bge     LAOG7
        ldr     r8, [r11]
        mov     r1, r5
        mov     r0, r8
        bl      __ltsf2
        cmp     r0, #0
        blt     LAOG6
        mov     r0, r8
        bl      __extendsfdf2
        ldr     r2, [pc, #0x4CC]
        ldr     r3, [pc, #0x4CC]
        str     r0, [sp, #4]
        str     r1, [sp]
        bl      __gedf2
        cmp     r0, #0
        bge     LAOG6
        cmp     r10, #0
        beq     LAOG10
        cmp     r9, #0
        ble     LAOG9
        mov     r0, r7
        mov     r1, r6
        ldr     r2, [pc, #0x498]
        ldr     r3, [pc, #0x498]
        bl      __muldf3
        mov     r7, r0
        mov     r6, r1
        mov     r0, r9
        bl      __floatsidf
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        ldr     r2, [sp, #4]
        ldr     r3, [sp]
        bl      __adddf3
        ldr     r2, [pc, #0x46C]
        ldr     r3, [pc, #0x46C]
        str     r0, [sp, #0x2C]
        ldr     r0, [sp, #0x2C]
        str     r1, [sp, #0x28]
        bl      __muldf3
        bl      floor
        ldr     r2, [pc, #0x448]
        ldr     r3, [pc, #0x448]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [sp, #0x2C]
        ldr     r1, [sp, #0x28]
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
        blt     LAOG0
        ldr     r0, [sp, #4]
        ldr     r1, [sp]
        ldr     r2, [pc, #0x3F8]
        ldr     r3, [pc, #0x3F8]
        bl      __gedf2
        cmp     r0, #0
        ldrlt   r12, [sp, #8]
        strlt   r12, [r11]
        blt     LAOG1
LAOG0:
        str     r5, [r11]
LAOG1:
        mov     r0, r8
        bl      __extendsfdf2
        mov     r8, r0
        mov     r11, r1
        bl      cos
        str     r0, [sp, #0x2C]
        str     r1, [sp, #0x28]
        mov     r0, r4
        bl      __extendsfdf2
        ldr     r2, [sp, #0x2C]
        ldr     r3, [sp, #0x28]
        mov     r4, r0
        mov     r5, r1
        bl      __muldf3
        str     r0, [sp, #0x2C]
        str     r1, [sp, #0x28]
        mov     r1, r11
        mov     r0, r8
        bl      sin
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        str     r0, [sp, #0x24]
        str     r1, [sp, #0x1C]
        ldr     r0, [sp, #0x2C]
        ldr     r1, [sp, #0x28]
        bl      __truncdfsf2
        str     r0, [r10]
        ldr     r0, [sp, #0x24]
        ldr     r1, [sp, #0x1C]
        bl      __truncdfsf2
        cmp     r9, #1
        str     r0, [r10, #4]
        beq     LAOG5
        mov     r2, r8
        mov     r3, r11
        mov     r0, r7
        mov     r1, r6
        bl      __adddf3
        mov     r11, r0
        str     r1, [sp, #0x14]
        bl      cos
        mov     r3, r5
        mov     r2, r4
        bl      __muldf3
        str     r1, [sp, #0x20]
        ldr     r1, [sp, #0x14]
        mov     r8, r0
        str     r8, [sp, #0x18]
        mov     r0, r11
        bl      sin
        mov     r3, r5
        mov     r2, r4
        bl      __muldf3
        mov     r5, r1
        ldr     r1, [sp, #0x20]
        mov     r4, r0
        mov     r0, r8
        bl      __truncdfsf2
        str     r0, [r10, #8]
        mov     r0, r4
        mov     r1, r5
        bl      __truncdfsf2
        cmp     r9, #2
        str     r0, [r10, #0xC]
        beq     LAOG5
        mov     r1, r6
        mov     r0, r7
        bl      cos
        mov     r2, r0
        mov     r3, r1
        bl      __adddf3
        cmp     r9, #2
        mov     r7, r0
        mov     r6, r1
        ble     LAOG5
        sub     r12, r9, #2
        cmp     r12, #4
        movlt   r8, #2
        blt     LAOG3
        mov     r8, #2
        sub     r12, r9, #4
        add     r11, r10, #0xC
        str     r8, [sp, #0x14]
        str     r12, [sp]
        str     r9, [sp, #0xC]
        str     r10, [sp, #0x10]
LAOG2:
        ldr     r0, [sp, #0x18]
        ldr     r1, [sp, #0x20]
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        ldr     r3, [sp, #0x28]
        ldr     r2, [sp, #0x2C]
        bl      __subdf3
        str     r0, [sp, #0x30]
        mov     r8, r1
        mov     r0, r4
        mov     r1, r5
        mov     r3, r6
        mov     r2, r7
        bl      __muldf3
        ldr     r3, [sp, #0x1C]
        ldr     r2, [sp, #0x24]
        bl      __subdf3
        mov     r10, r0
        ldr     r0, [sp, #0x30]
        mov     r9, r1
        mov     r1, r8
        bl      __truncdfsf2
        str     r0, [r11, #4]
        mov     r0, r10
        mov     r1, r9
        bl      __truncdfsf2
        str     r0, [r11, #8]
        ldr     r0, [sp, #0x30]
        mov     r2, r7
        mov     r3, r6
        mov     r1, r8
        bl      __muldf3
        ldr     r2, [sp, #0x18]
        ldr     r3, [sp, #0x20]
        bl      __subdf3
        str     r1, [sp, #0x28]
        str     r0, [sp, #0x2C]
        mov     r2, r7
        mov     r3, r6
        mov     r0, r10
        mov     r1, r9
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __subdf3
        str     r1, [sp, #0x1C]
        ldr     r1, [sp, #0x28]
        str     r0, [sp, #0x24]
        ldr     r0, [sp, #0x2C]
        bl      __truncdfsf2
        str     r0, [r11, #0xC]
        ldr     r0, [sp, #0x24]
        ldr     r1, [sp, #0x1C]
        bl      __truncdfsf2
        str     r0, [r11, #0x10]
        ldr     r0, [sp, #0x2C]
        ldr     r1, [sp, #0x28]
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        ldr     r2, [sp, #0x30]
        mov     r3, r8
        bl      __subdf3
        str     r0, [sp, #0x18]
        str     r1, [sp, #0x20]
        ldr     r0, [sp, #0x24]
        ldr     r1, [sp, #0x1C]
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        mov     r2, r10
        mov     r3, r9
        bl      __subdf3
        mov     r4, r0
        mov     r5, r1
        ldr     r0, [sp, #0x18]
        ldr     r1, [sp, #0x20]
        bl      __truncdfsf2
        str     r0, [r11, #0x14]
        mov     r0, r4
        mov     r1, r5
        bl      __truncdfsf2
        ldr     r12, [sp, #0x14]
        add     r12, r12, #3
        str     r12, [sp, #0x14]
        str     r0, [r11, #0x18]!
        ldr     lr, [sp]
        ldr     r12, [sp, #0x14]
        cmp     r12, lr
        ble     LAOG2
        ldr     r8, [sp, #0x14]
        ldr     r9, [sp, #0xC]
        ldr     r10, [sp, #0x10]
LAOG3:
        mov     r12, r8, lsl #3
        sub     r12, r12, #4
        add     r10, r12, r10
        str     r6, [sp, #8]
        str     r7, [sp, #4]
        str     r9, [sp, #0xC]
LAOG4:
        ldr     r0, [sp, #0x18]
        ldr     r1, [sp, #0x20]
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #8]
        bl      __muldf3
        ldr     r2, [sp, #0x2C]
        ldr     r3, [sp, #0x28]
        bl      __subdf3
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #8]
        mov     r6, r0
        mov     r7, r1
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        ldr     r2, [sp, #0x24]
        ldr     r3, [sp, #0x1C]
        bl      __subdf3
        mov     r9, r0
        mov     r11, r1
        mov     r0, r6
        mov     r1, r7
        bl      __truncdfsf2
        str     r0, [r10, #4]
        mov     r0, r9
        mov     r1, r11
        bl      __truncdfsf2
        ldr     r12, [sp, #0x18]
        add     r8, r8, #1
        str     r12, [sp, #0x2C]
        ldr     r12, [sp, #0x20]
        str     r4, [sp, #0x24]
        str     r5, [sp, #0x1C]
        str     r12, [sp, #0x28]
        str     r0, [r10, #8]!
        ldr     r2, [sp, #0xC]
        cmp     r8, r2
        str     r6, [sp, #0x18]
        str     r7, [sp, #0x20]
        mov     r4, r9
        mov     r5, r11
        blt     LAOG4
LAOG5:
        mov     r0, #0
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LAOG6:
        mvn     r0, #0x2B
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LAOG7:
        mvn     r0, #0x2C
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LAOG8:
        mvn     r0, #0x2D
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LAOG9:
        mvn     r0, #5
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LAOG10:
        mvn     r0, #7
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
        .long   LAOG__2il0floatpacket.1
        .long   0x54442d18
        .long   0x401921fb
        .long   0x6dc9c883
        .long   0x3fc45f30


        .data
        .align  4


LAOG__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


