        .text
        .align  4
        .globl  _ippsVectorSlope_16u


_ippsVectorSlope_16u:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        mov     r6, r0
        cmp     r6, #0
        mov     r7, r1
        mov     r4, r2
        mov     r5, r3
        beq     LAXY16
        cmp     r7, #0
        ble     LAXY15
        mov     r0, r5
        bl      __extendsfdf2
        mov     r9, r0
        mov     r8, r1
        mov     r2, #0
        mov     r3, #0
        bl      __eqdf2
        ldr     r11, [pc, #0x50C]
        mov     r12, #0xFE, 12
        orr     r12, r12, #3, 4
        cmp     r0, #0
        str     r12, [sp]
        beq     LAXY12
        ldr     r12, [sp]
        mov     r3, r8
        mov     r2, r9
        add     r10, r12, #1, 12
        mov     r1, r10
        mov     r0, #0
        bl      __divdf3
        bl      __truncdfsf2
        ldr     r8, [r11]
        mov     r11, r0
        mov     r1, r4
        mov     r0, r8
        bl      __subsf3
        mov     r1, r11
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r3, r10
        mov     r2, #0
        bl      __adddf3
        bl      __truncdfsf2
        ldr     r12, [pc, #0x4A8]
        str     r0, [sp, #8]
        ldr     r0, [r12]
        mov     r1, r4
        mov     r12, #0
        str     r12, [sp, #4]
        bl      __subsf3
        mov     r1, r11
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r3, r10
        mov     r2, #0
        bl      __adddf3
        bl      __truncdfsf2
        str     r0, [sp, #0xC]
        mov     r0, r5
        mov     r1, r8
        bl      __gtsf2
        ldr     r12, [pc, #0x464]
        cmp     r0, #0
        ldr     r10, [r12]
        mvn     r9, #2, 2
        ble     LAXY3
        ldr     r0, [sp, #8]
        mov     r1, r10
        bl      __gtsf2
        cmp     r0, #0
        movgt   r11, r9
        bgt     LAXY0
        ldr     r0, [sp, #8]
        mov     r1, r8
        bl      __ltsf2
        cmp     r0, #0
        ldrlt   r11, [sp, #4]
        blt     LAXY0
        ldr     r0, [sp, #8]
        bl      __fixsfsi
        mov     r11, r0
LAXY0:
        mov     r1, r10
        ldr     r0, [sp, #0xC]
        bl      __gtsf2
        cmp     r0, #0
        bgt     LAXY1
        ldr     r0, [sp, #0xC]
        mov     r1, r8
        bl      __ltsf2
        cmp     r0, #0
        ldrlt   r9, [sp, #4]
        blt     LAXY1
        ldr     r0, [sp, #0xC]
        bl      __fixsfsi
        mov     r9, r0
LAXY1:
        cmp     r9, r7
        bge     LAXY2
        cmp     r9, #0
        ble     LAXY2
        sub     r2, r7, r9
        add     r1, r6, r9, lsl #1
        mvn     r0, #0
        bl      _ippsSet_16s
        mov     r7, r9
LAXY2:
        cmp     r11, #0
        ble     LAXY7
        cmp     r11, r7
        movge   r11, r7
        mov     r2, r11
        mov     r1, r6
        mov     r0, #0
        bl      _ippsSet_16s
        mov     r0, r11
        bl      __floatsisf
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        sub     r7, r7, r11
        add     r6, r6, r11, lsl #1
        mov     r4, r0
        b       LAXY7
LAXY3:
        ldr     r0, [sp, #8]
        mov     r1, r10
        bl      __gtsf2
        cmp     r0, #0
        movgt   r11, r9
        bgt     LAXY4
        ldr     r0, [sp, #8]
        mov     r1, r8
        bl      __ltsf2
        cmp     r0, #0
        ldrlt   r11, [sp, #4]
        blt     LAXY4
        ldr     r0, [sp, #8]
        bl      __fixsfsi
        mov     r11, r0
LAXY4:
        mov     r1, r10
        ldr     r0, [sp, #0xC]
        bl      __gtsf2
        cmp     r0, #0
        bgt     LAXY5
        ldr     r0, [sp, #0xC]
        mov     r1, r8
        bl      __ltsf2
        cmp     r0, #0
        ldrlt   r9, [sp, #4]
        blt     LAXY5
        ldr     r0, [sp, #0xC]
        bl      __fixsfsi
        mov     r9, r0
LAXY5:
        cmp     r11, r7
        bge     LAXY6
        cmp     r11, #0
        ble     LAXY6
        sub     r2, r7, r11
        add     r1, r6, r11, lsl #1
        mov     r0, #0
        bl      _ippsSet_16s
        mov     r7, r11
LAXY6:
        cmp     r9, #0
        ble     LAXY7
        cmp     r9, r7
        movge   r9, r7
        mov     r2, r9
        mov     r1, r6
        mvn     r0, #0
        bl      _ippsSet_16s
        mov     r0, r9
        bl      __floatsisf
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        sub     r7, r7, r9
        add     r6, r6, r9, lsl #1
        mov     r4, r0
LAXY7:
        cmp     r7, #0
        ble     LAXY11
        cmp     r7, #0
        ble     LAXY11
        cmp     r7, #6
        ldrlt   r8, [sp, #4]
        blt     LAXY9
        ldr     r8, [sp, #4]
        sub     r9, r7, #6
        str     r7, [sp, #0x10]
        ldr     r10, [sp, #4]
        ldr     r7, [sp]
LAXY8:
        mov     r0, r8
        bl      __floatsisf
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        bl      __extendsfdf2
        mov     r2, #0
        mov     r3, r7
        bl      __adddf3
        bl      __truncdfsf2
        bl      __fixunssfsi
        strh    r0, [r6, +r10]
        add     r11, r8, #1
        mov     r0, r11
        bl      __floatsisf
        mov     r11, r11, lsl #1
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        bl      __extendsfdf2
        mov     r2, #0
        mov     r3, r7
        bl      __adddf3
        bl      __truncdfsf2
        bl      __fixunssfsi
        strh    r0, [r6, +r11]
        add     r11, r8, #2
        mov     r0, r11
        bl      __floatsisf
        mov     r1, r5
        bl      __mulsf3
        mov     r11, r11, lsl #1
        mov     r1, r4
        bl      __addsf3
        bl      __extendsfdf2
        mov     r2, #0
        mov     r3, r7
        bl      __adddf3
        bl      __truncdfsf2
        bl      __fixunssfsi
        strh    r0, [r6, +r11]
        add     r11, r8, #3
        mov     r0, r11
        bl      __floatsisf
        mov     r1, r5
        bl      __mulsf3
        mov     r11, r11, lsl #1
        mov     r1, r4
        bl      __addsf3
        bl      __extendsfdf2
        mov     r2, #0
        mov     r3, r7
        bl      __adddf3
        bl      __truncdfsf2
        bl      __fixunssfsi
        strh    r0, [r6, +r11]
        add     r11, r8, #4
        mov     r0, r11
        bl      __floatsisf
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        bl      __extendsfdf2
        mov     r2, #0
        mov     r3, r7
        bl      __adddf3
        bl      __truncdfsf2
        bl      __fixunssfsi
        add     r8, r8, #5
        mov     r11, r11, lsl #1
        cmp     r8, r9
        add     r10, r10, #0xA
        strh    r0, [r6, +r11]
        ble     LAXY8
        ldr     r7, [sp, #0x10]
LAXY9:
        ldr     r9, [sp]
        mov     r10, r8, lsl #1
LAXY10:
        mov     r0, r8
        bl      __floatsisf
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        bl      __extendsfdf2
        mov     r2, #0
        mov     r3, r9
        bl      __adddf3
        bl      __truncdfsf2
        bl      __fixunssfsi
        add     r8, r8, #1
        strh    r0, [r6, +r10]
        cmp     r8, r7
        add     r10, r10, #2
        blt     LAXY10
LAXY11:
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LAXY12:
        ldr     r11, [r11]
        mov     r0, r4
        mov     r1, r11
        bl      __gtsf2
        cmp     r0, #0
        ble     LAXY13
        mov     r0, r4
        bl      __extendsfdf2
        ldr     r3, [sp]
        mov     r2, #0
        bl      __adddf3
        bl      __truncdfsf2
        mov     r4, r0
LAXY13:
        mov     r0, r4
        mov     r1, r11
        bl      __ltsf2
        cmp     r0, #0
        bge     LAXY14
        mov     r0, r4
        bl      __extendsfdf2
        ldr     r3, [sp]
        mov     r2, #0
        bl      __subdf3
        bl      __truncdfsf2
        mov     r4, r0
LAXY14:
        ldr     r3, [pc, #0x6C]
        mov     r1, r4
        ldr     r5, [r3]
        mov     r0, r5
        bl      __ltsf2
        cmp     r0, #0
        movlt   r4, r5
        mov     r1, r4
        mov     r0, r11
        bl      __gtsf2
        cmp     r0, #0
        movgt   r4, r11
        mov     r0, r4
        bl      __fixunssfsi
        mov     r2, r7
        mov     r0, r0, lsl #16
        mov     r1, r6
        mov     r0, r0, asr #16
        bl      _ippsSet_16s
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LAXY15:
        mvn     r0, #5
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LAXY16:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
        .long   LAXY__2il0floatpacket.1
        .long   LAXY__2il0floatpacket.2
        .long   LAXY__2il0floatpacket.3


        .data
        .align  4


LAXY__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00
LAXY__2il0floatpacket.2:
        .byte   0x00,0xFF,0x7F,0x47
LAXY__2il0floatpacket.3:
        .byte   0x00,0x00,0x00,0x4F


