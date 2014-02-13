        .text
        .align  4
        .globl  _ippsVectorSlope_16s


_ippsVectorSlope_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        mov     r6, r0
        cmp     r6, #0
        mov     r7, r1
        mov     r4, r2
        mov     r5, r3
        beq     LAXZ16
        cmp     r7, #0
        ble     LAXZ15
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
        beq     LAXZ12
        mov     r2, r9
        mov     r3, r8
        ldr     r12, [sp, #4]
        mov     r0, #0
        mvn     r11, #2, 2
        add     r9, r12, #1, 12
        mov     r1, r9
        bl      __divdf3
        bl      __truncdfsf2
        ldr     r12, [pc, #0x3F8]
        mov     r10, r0
        mov     r1, r4
        ldr     r0, [r12]
        mvn     r12, #0xFF
        bic     r12, r12, #0x7F, 24
        str     r12, [sp, #8]
        bl      __subsf3
        mov     r1, r10
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r3, r9
        mov     r2, #0
        bl      __adddf3
        bl      __truncdfsf2
        ldr     r12, [pc, #0x3C0]
        mov     r8, r0
        mov     r1, r4
        ldr     r0, [r12]
        bl      __subsf3
        mov     r1, r10
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r3, r9
        mov     r2, #0
        bl      __adddf3
        bl      __truncdfsf2
        ldr     r12, [pc, #0x394]
        ldr     r9, [r12]
        str     r0, [sp]
        mov     r0, r5
        mov     r1, r9
        bl      __gtsf2
        ldr     r12, [pc, #0x380]
        cmp     r0, #0
        ldr     r10, [r12]
        ble     LAXZ3
        mov     r0, r8
        mov     r1, r10
        bl      __gtsf2
        cmp     r0, #0
        movgt   r8, r11
        bgt     LAXZ0
        mov     r0, r8
        mov     r1, r9
        bl      __ltsf2
        cmp     r0, #0
        movlt   r8, #0
        blt     LAXZ0
        mov     r0, r8
        bl      __fixsfsi
        mov     r8, r0
LAXZ0:
        mov     r1, r10
        ldr     r0, [sp]
        bl      __gtsf2
        cmp     r0, #0
        bgt     LAXZ1
        ldr     r0, [sp]
        mov     r1, r9
        bl      __ltsf2
        cmp     r0, #0
        movlt   r11, #0
        blt     LAXZ1
        ldr     r0, [sp]
        bl      __fixsfsi
        mov     r11, r0
LAXZ1:
        cmp     r11, r7
        bge     LAXZ2
        cmp     r11, #0
        ble     LAXZ2
        ldr     r12, [sp, #8]
        sub     r2, r7, r11
        add     r1, r6, r11, lsl #1
        mvn     r0, r12
        bl      _ippsSet_16s
        mov     r7, r11
LAXZ2:
        cmp     r8, #0
        ble     LAXZ7
        cmp     r8, r7
        movge   r8, r7
        mov     r12, #0
        sub     r0, r12, #2, 18
        mov     r2, r8
        mov     r1, r6
        bl      _ippsSet_16s
        mov     r0, r8
        bl      __floatsisf
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        sub     r7, r7, r8
        add     r6, r6, r8, lsl #1
        mov     r4, r0
        b       LAXZ7
LAXZ3:
        mov     r0, r8
        mov     r1, r10
        bl      __gtsf2
        cmp     r0, #0
        movgt   r8, r11
        bgt     LAXZ4
        mov     r0, r8
        mov     r1, r9
        bl      __ltsf2
        cmp     r0, #0
        movlt   r8, #0
        blt     LAXZ4
        mov     r0, r8
        bl      __fixsfsi
        mov     r8, r0
LAXZ4:
        mov     r1, r10
        ldr     r0, [sp]
        bl      __gtsf2
        cmp     r0, #0
        bgt     LAXZ5
        ldr     r0, [sp]
        mov     r1, r9
        bl      __ltsf2
        cmp     r0, #0
        movlt   r11, #0
        blt     LAXZ5
        ldr     r0, [sp]
        bl      __fixsfsi
        mov     r11, r0
LAXZ5:
        cmp     r8, r7
        bge     LAXZ6
        cmp     r8, #0
        ble     LAXZ6
        ldr     r0, [sp, #8]
        sub     r2, r7, r8
        add     r1, r6, r8, lsl #1
        bl      _ippsSet_16s
        mov     r7, r8
LAXZ6:
        cmp     r11, #0
        ble     LAXZ7
        cmp     r11, r7
        movge   r11, r7
        mov     r12, #0
        sub     r12, r12, #2, 18
        mvn     r0, r12
        mov     r2, r11
        mov     r1, r6
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
LAXZ7:
        cmp     r7, #0
        ble     LAXZ11
        cmp     r7, #0
        ble     LAXZ11
        ldr     r12, [pc, #0x190]
        mov     r10, #0
        mov     r9, r10
        ldr     r8, [r12]
        str     r5, [sp, #0xC]
        str     r7, [sp, #0x10]
LAXZ8:
        mov     r0, r9
        bl      __floatsisf
        ldr     r1, [sp, #0xC]
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        mov     r11, r0
        bl      __extendsfdf2
        mov     r7, r0
        mov     r5, r1
        mov     r0, r11
        mov     r1, r8
        bl      __gtsf2
        cmp     r0, #0
        ble     LAXZ9
        mov     r2, r7
        mov     r3, r5
        ldr     r1, [sp, #4]
        mov     r0, #0
        bl      __adddf3
        bl      __truncdfsf2
        b       LAXZ10
LAXZ9:
        mov     r0, r7
        mov     r1, r5
        ldr     r3, [sp, #4]
        mov     r2, #0
        bl      __subdf3
        bl      __truncdfsf2
LAXZ10:
        bl      __fixsfsi
        strh    r0, [r6, +r10]
        ldr     r3, [sp, #0x10]
        add     r9, r9, #1
        add     r10, r10, #2
        cmp     r9, r3
        blt     LAXZ8
LAXZ11:
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LAXZ12:
        ldr     r3, [pc, #0xE0]
        mov     r0, r4
        ldr     r5, [r3]
        mov     r1, r5
        bl      __gtsf2
        cmp     r0, #0
        ble     LAXZ13
        mov     r0, r4
        bl      __extendsfdf2
        ldr     r3, [sp, #4]
        mov     r2, #0
        bl      __adddf3
        bl      __truncdfsf2
        mov     r4, r0
LAXZ13:
        mov     r0, r4
        mov     r1, r5
        bl      __ltsf2
        cmp     r0, #0
        bge     LAXZ14
        mov     r0, r4
        bl      __extendsfdf2
        ldr     r3, [sp, #4]
        mov     r2, #0
        bl      __subdf3
        bl      __truncdfsf2
        mov     r4, r0
LAXZ14:
        ldr     r3, [pc, #0x74]
        mov     r1, r4
        ldr     r5, [r3]
        mov     r0, r5
        bl      __ltsf2
        ldr     r3, [pc, #0x5C]
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
        mov     r2, r7
        mov     r0, r0, lsl #16
        mov     r1, r6
        mov     r0, r0, asr #16
        bl      _ippsSet_16s
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LAXZ15:
        mvn     r0, #5
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LAXZ16:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
        .long   LAXZ__2il0floatpacket.1
        .long   LAXZ__2il0floatpacket.2
        .long   LAXZ__2il0floatpacket.3
        .long   LAXZ__2il0floatpacket.4


        .data
        .align  4


LAXZ__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0xC7
LAXZ__2il0floatpacket.2:
        .byte   0x00,0xFE,0xFF,0x46
LAXZ__2il0floatpacket.3:
        .byte   0x00,0x00,0x00,0x00
LAXZ__2il0floatpacket.4:
        .byte   0x00,0x00,0x00,0x4F


