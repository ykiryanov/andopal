        .text
        .align  4
        .globl  _ippsVectorSlope_8u


_ippsVectorSlope_8u:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        mov     r8, r0
        cmp     r8, #0
        mov     r9, r1
        mov     r4, r2
        mov     r5, r3
        beq     LAXS16
        cmp     r9, #0
        ble     LAXS15
        mov     r0, r5
        bl      __extendsfdf2
        mov     r7, r0
        mov     r6, r1
        mov     r2, #0
        mov     r3, #0
        bl      __eqdf2
        ldr     r11, [pc, #0x4D8]
        mov     r12, #0xFE, 12
        orr     r12, r12, #3, 4
        cmp     r0, #0
        str     r12, [sp, #4]
        beq     LAXS12
        ldr     r12, [sp, #4]
        mov     r3, r6
        mov     r2, r7
        add     r10, r12, #1, 12
        mov     r1, r10
        mov     r0, #0
        bl      __divdf3
        bl      __truncdfsf2
        ldr     r6, [r11]
        mov     r11, r0
        mov     r1, r4
        mov     r0, r6
        bl      __subsf3
        mov     r1, r11
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r3, r10
        mov     r2, #0
        bl      __adddf3
        bl      __truncdfsf2
        ldr     r12, [pc, #0x474]
        str     r0, [sp, #8]
        ldr     r0, [r12]
        mov     r1, r4
        mov     r12, #0
        str     r12, [sp]
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
        mov     r1, r6
        bl      __gtsf2
        ldr     r12, [pc, #0x430]
        cmp     r0, #0
        ldr     r10, [r12]
        mvn     r7, #2, 2
        ble     LAXS3
        ldr     r0, [sp, #8]
        mov     r1, r10
        bl      __gtsf2
        cmp     r0, #0
        movgt   r11, r7
        bgt     LAXS0
        ldr     r0, [sp, #8]
        mov     r1, r6
        bl      __ltsf2
        cmp     r0, #0
        ldrlt   r11, [sp]
        blt     LAXS0
        ldr     r0, [sp, #8]
        bl      __fixsfsi
        mov     r11, r0
LAXS0:
        mov     r1, r10
        ldr     r0, [sp, #0xC]
        bl      __gtsf2
        cmp     r0, #0
        bgt     LAXS1
        ldr     r0, [sp, #0xC]
        mov     r1, r6
        bl      __ltsf2
        cmp     r0, #0
        ldrlt   r7, [sp]
        blt     LAXS1
        ldr     r0, [sp, #0xC]
        bl      __fixsfsi
        mov     r7, r0
LAXS1:
        cmp     r7, r9
        bge     LAXS2
        cmp     r7, #0
        ble     LAXS2
        sub     r2, r9, r7
        add     r1, r8, r7
        mov     r0, #0xFF
        bl      _ippsSet_8u
        mov     r9, r7
LAXS2:
        cmp     r11, #0
        ble     LAXS7
        cmp     r11, r9
        movge   r11, r9
        mov     r2, r11
        mov     r1, r8
        mov     r0, #0
        bl      _ippsSet_8u
        mov     r0, r11
        bl      __floatsisf
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        sub     r9, r9, r11
        add     r8, r8, r11
        mov     r4, r0
        b       LAXS7
LAXS3:
        ldr     r0, [sp, #8]
        mov     r1, r10
        bl      __gtsf2
        cmp     r0, #0
        movgt   r11, r7
        bgt     LAXS4
        ldr     r0, [sp, #8]
        mov     r1, r6
        bl      __ltsf2
        cmp     r0, #0
        ldrlt   r11, [sp]
        blt     LAXS4
        ldr     r0, [sp, #8]
        bl      __fixsfsi
        mov     r11, r0
LAXS4:
        mov     r1, r10
        ldr     r0, [sp, #0xC]
        bl      __gtsf2
        cmp     r0, #0
        bgt     LAXS5
        ldr     r0, [sp, #0xC]
        mov     r1, r6
        bl      __ltsf2
        cmp     r0, #0
        ldrlt   r7, [sp]
        blt     LAXS5
        ldr     r0, [sp, #0xC]
        bl      __fixsfsi
        mov     r7, r0
LAXS5:
        cmp     r11, r9
        bge     LAXS6
        cmp     r11, #0
        ble     LAXS6
        sub     r2, r9, r11
        add     r1, r8, r11
        mov     r0, #0
        bl      _ippsSet_8u
        mov     r9, r11
LAXS6:
        cmp     r7, #0
        ble     LAXS7
        cmp     r7, r9
        movge   r7, r9
        mov     r2, r7
        mov     r1, r8
        mov     r0, #0xFF
        bl      _ippsSet_8u
        mov     r0, r7
        bl      __floatsisf
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        sub     r9, r9, r7
        add     r8, r8, r7
        mov     r4, r0
LAXS7:
        cmp     r9, #0
        ble     LAXS11
        cmp     r9, #0
        ble     LAXS11
        cmp     r9, #6
        blt     LAXS9
        ldr     r7, [sp]
        ldr     r6, [sp, #4]
        sub     r11, r9, #6
        sub     r10, r8, #1
LAXS8:
        mov     r0, r7
        bl      __floatsisf
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        bl      __extendsfdf2
        mov     r2, #0
        mov     r3, r6
        bl      __adddf3
        bl      __truncdfsf2
        bl      __fixunssfsi
        strb    r0, [r7, +r8]
        add     r0, r7, #1
        bl      __floatsisf
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        bl      __extendsfdf2
        mov     r2, #0
        mov     r3, r6
        bl      __adddf3
        bl      __truncdfsf2
        bl      __fixunssfsi
        strb    r0, [r10, #2]
        add     r0, r7, #2
        bl      __floatsisf
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        bl      __extendsfdf2
        mov     r2, #0
        mov     r3, r6
        bl      __adddf3
        bl      __truncdfsf2
        bl      __fixunssfsi
        strb    r0, [r10, #3]
        add     r0, r7, #3
        bl      __floatsisf
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        bl      __extendsfdf2
        mov     r2, #0
        mov     r3, r6
        bl      __adddf3
        bl      __truncdfsf2
        bl      __fixunssfsi
        strb    r0, [r10, #4]
        add     r0, r7, #4
        bl      __floatsisf
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        bl      __extendsfdf2
        mov     r2, #0
        mov     r3, r6
        bl      __adddf3
        bl      __truncdfsf2
        bl      __fixunssfsi
        add     r7, r7, #5
        strb    r0, [r10, #5]!
        cmp     r7, r11
        ble     LAXS8
        str     r7, [sp]
LAXS9:
        ldr     r7, [sp]
        ldr     r6, [sp, #4]
LAXS10:
        mov     r0, r7
        bl      __floatsisf
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        bl      __extendsfdf2
        mov     r2, #0
        mov     r3, r6
        bl      __adddf3
        bl      __truncdfsf2
        bl      __fixunssfsi
        strb    r0, [r7, +r8]
        add     r7, r7, #1
        cmp     r7, r9
        blt     LAXS10
LAXS11:
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LAXS12:
        ldr     r11, [r11]
        mov     r0, r4
        mov     r1, r11
        bl      __gtsf2
        cmp     r0, #0
        ble     LAXS13
        mov     r0, r4
        bl      __extendsfdf2
        ldr     r3, [sp, #4]
        mov     r2, #0
        bl      __adddf3
        bl      __truncdfsf2
        mov     r4, r0
LAXS13:
        mov     r0, r4
        mov     r1, r11
        bl      __ltsf2
        cmp     r0, #0
        bge     LAXS14
        mov     r0, r4
        bl      __extendsfdf2
        ldr     r3, [sp, #4]
        mov     r2, #0
        bl      __subdf3
        bl      __truncdfsf2
        mov     r4, r0
LAXS14:
        ldr     r3, [pc, #0x68]
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
        and     r0, r0, #0xFF
        mov     r2, r9
        mov     r1, r8
        bl      _ippsSet_8u
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LAXS15:
        mvn     r0, #5
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LAXS16:
        mvn     r0, #7
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
        .long   LAXS__2il0floatpacket.1
        .long   LAXS__2il0floatpacket.2
        .long   LAXS__2il0floatpacket.3


        .data
        .align  4


LAXS__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00
LAXS__2il0floatpacket.2:
        .byte   0x00,0x00,0x7F,0x43
LAXS__2il0floatpacket.3:
        .byte   0x00,0x00,0x00,0x4F


