        .text
        .align  4
        .globl  _ippsVectorSlope_8s


_ippsVectorSlope_8s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        mov     r6, r0
        cmp     r6, #0
        mov     r7, r1
        mov     r4, r2
        mov     r5, r3
        beq     LAXT16
        cmp     r7, #0
        ble     LAXT15
        mov     r0, r5
        bl      __extendsfdf2
        mov     r9, r0
        mov     r8, r1
        mov     r2, #0
        mov     r3, #0
        bl      __eqdf2
        mov     r12, #0xFE, 12
        orr     r12, r12, #3, 4
        cmp     r0, #0
        str     r12, [sp, #4]
        beq     LAXT12
        mov     r2, r9
        mov     r3, r8
        ldr     r12, [sp, #4]
        mov     r0, #0
        mvn     r9, #2, 2
        add     r10, r12, #1, 12
        mov     r1, r10
        bl      __divdf3
        bl      __truncdfsf2
        ldr     r12, [pc, #0x3D8]
        mov     r11, r0
        mov     r1, r4
        ldr     r0, [r12]
        mov     r12, #0
        str     r12, [sp, #8]
        bl      __subsf3
        mov     r1, r11
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r3, r10
        mov     r2, #0
        bl      __adddf3
        bl      __truncdfsf2
        ldr     r12, [pc, #0x3A4]
        mov     r8, r0
        mov     r1, r4
        ldr     r0, [r12]
        bl      __subsf3
        mov     r1, r11
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r3, r10
        mov     r2, #0
        bl      __adddf3
        bl      __truncdfsf2
        ldr     r12, [pc, #0x378]
        ldr     r10, [r12]
        str     r0, [sp]
        mov     r0, r5
        mov     r1, r10
        bl      __gtsf2
        ldr     r12, [pc, #0x364]
        cmp     r0, #0
        ldr     r11, [r12]
        ble     LAXT3
        mov     r0, r8
        mov     r1, r11
        bl      __gtsf2
        cmp     r0, #0
        movgt   r8, r9
        bgt     LAXT0
        mov     r0, r8
        mov     r1, r10
        bl      __ltsf2
        cmp     r0, #0
        ldrlt   r8, [sp, #8]
        blt     LAXT0
        mov     r0, r8
        bl      __fixsfsi
        mov     r8, r0
LAXT0:
        mov     r1, r11
        ldr     r0, [sp]
        bl      __gtsf2
        cmp     r0, #0
        bgt     LAXT1
        ldr     r0, [sp]
        mov     r1, r10
        bl      __ltsf2
        cmp     r0, #0
        ldrlt   r9, [sp, #8]
        blt     LAXT1
        ldr     r0, [sp]
        bl      __fixsfsi
        mov     r9, r0
LAXT1:
        cmp     r9, r7
        bge     LAXT2
        cmp     r9, #0
        ble     LAXT2
        sub     r2, r7, r9
        add     r1, r6, r9
        mov     r0, #0x7F
        bl      _ippsSet_8u
        mov     r7, r9
LAXT2:
        cmp     r8, #0
        ble     LAXT7
        cmp     r8, r7
        movge   r8, r7
        mov     r2, r8
        mov     r1, r6
        mov     r0, #0x80
        bl      _ippsSet_8u
        mov     r0, r8
        bl      __floatsisf
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        sub     r7, r7, r8
        add     r6, r6, r8
        mov     r4, r0
        b       LAXT7
LAXT3:
        mov     r0, r8
        mov     r1, r11
        bl      __gtsf2
        cmp     r0, #0
        movgt   r8, r9
        bgt     LAXT4
        mov     r0, r8
        mov     r1, r10
        bl      __ltsf2
        cmp     r0, #0
        ldrlt   r8, [sp, #8]
        blt     LAXT4
        mov     r0, r8
        bl      __fixsfsi
        mov     r8, r0
LAXT4:
        mov     r1, r11
        ldr     r0, [sp]
        bl      __gtsf2
        cmp     r0, #0
        bgt     LAXT5
        ldr     r0, [sp]
        mov     r1, r10
        bl      __ltsf2
        cmp     r0, #0
        ldrlt   r9, [sp, #8]
        blt     LAXT5
        ldr     r0, [sp]
        bl      __fixsfsi
        mov     r9, r0
LAXT5:
        cmp     r8, r7
        bge     LAXT6
        cmp     r8, #0
        ble     LAXT6
        sub     r2, r7, r8
        add     r1, r6, r8
        mov     r0, #0x80
        bl      _ippsSet_8u
        mov     r7, r8
LAXT6:
        cmp     r9, #0
        ble     LAXT7
        cmp     r9, r7
        movge   r9, r7
        mov     r2, r9
        mov     r1, r6
        mov     r0, #0x7F
        bl      _ippsSet_8u
        mov     r0, r9
        bl      __floatsisf
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        sub     r7, r7, r9
        add     r6, r6, r9
        mov     r4, r0
LAXT7:
        cmp     r7, #0
        ble     LAXT11
        cmp     r7, #0
        ble     LAXT11
        ldr     r12, [pc, #0x184]
        ldr     r10, [sp, #8]
        ldr     r9, [sp, #4]
        ldr     r8, [r12]
        str     r4, [sp, #0xC]
        str     r5, [sp, #0x10]
LAXT8:
        mov     r0, r10
        bl      __floatsisf
        ldr     r1, [sp, #0x10]
        bl      __mulsf3
        ldr     r1, [sp, #0xC]
        bl      __addsf3
        mov     r11, r0
        bl      __extendsfdf2
        mov     r5, r0
        mov     r4, r1
        mov     r0, r11
        mov     r1, r8
        bl      __gtsf2
        cmp     r0, #0
        ble     LAXT9
        mov     r2, r5
        mov     r3, r4
        mov     r1, r9
        mov     r0, #0
        bl      __adddf3
        bl      __truncdfsf2
        b       LAXT10
LAXT9:
        mov     r0, r5
        mov     r1, r4
        mov     r3, r9
        mov     r2, #0
        bl      __subdf3
        bl      __truncdfsf2
LAXT10:
        bl      __fixsfsi
        strb    r0, [r10, +r6]
        add     r10, r10, #1
        cmp     r10, r7
        blt     LAXT8
LAXT11:
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LAXT12:
        ldr     r3, [pc, #0xDC]
        mov     r0, r4
        ldr     r5, [r3]
        mov     r1, r5
        bl      __gtsf2
        cmp     r0, #0
        ble     LAXT13
        mov     r0, r4
        bl      __extendsfdf2
        ldr     r3, [sp, #4]
        mov     r2, #0
        bl      __adddf3
        bl      __truncdfsf2
        mov     r4, r0
LAXT13:
        mov     r0, r4
        mov     r1, r5
        bl      __ltsf2
        cmp     r0, #0
        bge     LAXT14
        mov     r0, r4
        bl      __extendsfdf2
        ldr     r3, [sp, #4]
        mov     r2, #0
        bl      __subdf3
        bl      __truncdfsf2
        mov     r4, r0
LAXT14:
        ldr     r3, [pc, #0x70]
        mov     r1, r4
        ldr     r5, [r3]
        mov     r0, r5
        bl      __ltsf2
        ldr     r3, [pc, #0x58]
        cmp     r0, #0
        movlt   r4, r5
        ldr     r5, [r3]
        mov     r1, r4
        mov     r0, r5
        bl      __gtsf2
        cmp     r0, #0
        movgt   r4, r5
        mov     r0, r4
        bl      __fixsfsi
        and     r0, r0, #0xFF
        mov     r2, r7
        mov     r1, r6
        bl      _ippsSet_8u
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LAXT15:
        mvn     r0, #5
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LAXT16:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
        .long   LAXT__2il0floatpacket.1
        .long   LAXT__2il0floatpacket.2
        .long   LAXT__2il0floatpacket.3
        .long   LAXT__2il0floatpacket.4


        .data
        .align  4


LAXT__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0xC3
LAXT__2il0floatpacket.2:
        .byte   0x00,0x00,0xFE,0x42
LAXT__2il0floatpacket.3:
        .byte   0x00,0x00,0x00,0x00
LAXT__2il0floatpacket.4:
        .byte   0x00,0x00,0x00,0x4F


