        .text
        .align  4
        .globl  _ippsVectorSlope_32s


_ippsVectorSlope_32s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        ldr     r7, [sp, #0x40]
        ldr     r6, [sp, #0x44]
        mov     r10, r0
        cmp     r10, #0
        mov     r9, r1
        mov     r4, r2
        mov     r5, r3
        beq     LAXW16
        cmp     r9, #0
        ble     LAXW15
        mov     r0, r7
        mov     r1, r6
        mov     r2, #0
        mov     r3, #0
        bl      __eqdf2
        mvn     lr, #0xE2, 12
        mov     r8, #0xFE, 12
        mov     r12, #0xFF, 12
        bic     lr, lr, #0xB, 4
        cmp     r0, #0
        orr     r8, r8, #3, 4
        str     lr, [sp, #8]
        orr     r11, r12, #3, 4
        beq     LAXW12
        add     r1, r8, #1, 12
        str     r1, [sp, #4]
        mov     r0, #0
        mov     r2, r7
        mov     r3, r6
        bl      __divdf3
        bl      __truncdfsf2
        bl      __extendsfdf2
        str     r1, [sp, #0x18]
        str     r0, [sp, #0x14]
        sub     r1, r8, #0x7E, 8
        mov     r2, r4
        mov     r3, r5
        mov     r0, #0
        bl      __subdf3
        ldr     r2, [sp, #0x14]
        ldr     r3, [sp, #0x18]
        bl      __muldf3
        ldr     r3, [sp, #4]
        mov     r2, #0
        bl      __adddf3
        bl      __truncdfsf2
        ldr     r1, [sp, #8]
        str     r0, [sp]
        mov     r0, r11, lsl #2
        mov     r2, r4
        mov     r3, r5
        bl      __subdf3
        ldr     r2, [sp, #0x14]
        ldr     r3, [sp, #0x18]
        bl      __muldf3
        mov     r3, r11
        mov     r2, #0
        bl      __adddf3
        bl      __truncdfsf2
        str     r0, [sp, #8]
        mov     r0, r7
        mov     r1, r6
        mov     r2, #0
        mov     r3, #0
        bl      __gtdf2
        ldr     r12, [pc, #0x3BC]
        cmp     r0, #0
        ldr     r12, [r12]
        mvn     r11, #2, 2
        str     r12, [sp, #4]
        ble     LAXW3
        ldr     r0, [sp]
        ldr     r1, [sp, #4]
        bl      __gtsf2
        cmp     r0, #0
        strgt   r11, [sp]
        bgt     LAXW0
        ldr     r12, [pc, #0x390]
        ldr     r0, [sp]
        ldr     r1, [r12]
        bl      __ltsf2
        cmp     r0, #0
        movlt   r12, #0
        strlt   r12, [sp]
        blt     LAXW0
        ldr     r0, [sp]
        bl      __fixsfsi
        str     r0, [sp]
LAXW0:
        ldr     r1, [sp, #4]
        ldr     r0, [sp, #8]
        bl      __gtsf2
        cmp     r0, #0
        bgt     LAXW1
        ldr     r12, [pc, #0x350]
        ldr     r0, [sp, #8]
        ldr     r1, [r12]
        bl      __ltsf2
        cmp     r0, #0
        movlt   r11, #0
        blt     LAXW1
        ldr     r0, [sp, #8]
        bl      __fixsfsi
        mov     r11, r0
LAXW1:
        cmp     r11, r9
        bge     LAXW2
        cmp     r11, #0
        ble     LAXW2
        sub     r2, r9, r11
        add     r1, r10, r11, lsl #2
        mvn     r0, #2, 2
        bl      _ippsSet_32s
        mov     r9, r11
LAXW2:
        ldr     r12, [sp]
        cmp     r12, #0
        ble     LAXW7
        ldr     r12, [sp]
        cmp     r12, r9
        strge   r9, [sp]
        ldr     r2, [sp]
        mov     r1, r10
        mov     r0, #2, 2
        bl      _ippsSet_32s
        ldr     r11, [sp]
        mov     r0, r11
        bl      __floatsidf
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        sub     r9, r9, r11
        add     r10, r10, r11, lsl #2
        mov     r4, r0
        mov     r5, r1
        b       LAXW7
LAXW3:
        ldr     r0, [sp]
        ldr     r1, [sp, #4]
        bl      __gtsf2
        cmp     r0, #0
        strgt   r11, [sp]
        bgt     LAXW4
        ldr     r12, [pc, #0x28C]
        ldr     r0, [sp]
        ldr     r1, [r12]
        bl      __ltsf2
        cmp     r0, #0
        movlt   r12, #0
        strlt   r12, [sp]
        blt     LAXW4
        ldr     r0, [sp]
        bl      __fixsfsi
        str     r0, [sp]
LAXW4:
        ldr     r1, [sp, #4]
        ldr     r0, [sp, #8]
        bl      __gtsf2
        cmp     r0, #0
        bgt     LAXW5
        ldr     r12, [pc, #0x24C]
        ldr     r0, [sp, #8]
        ldr     r1, [r12]
        bl      __ltsf2
        cmp     r0, #0
        movlt   r11, #0
        blt     LAXW5
        ldr     r0, [sp, #8]
        bl      __fixsfsi
        mov     r11, r0
LAXW5:
        ldr     r12, [sp]
        cmp     r12, r9
        bge     LAXW6
        ldr     r12, [sp]
        cmp     r12, #0
        ble     LAXW6
        ldr     r12, [sp]
        mov     r0, #2, 2
        sub     r2, r9, r12
        add     r1, r10, r12, lsl #2
        bl      _ippsSet_32s
        ldr     r9, [sp]
LAXW6:
        cmp     r11, #0
        ble     LAXW7
        cmp     r11, r9
        movge   r11, r9
        mov     r2, r11
        mov     r1, r10
        mvn     r0, #2, 2
        bl      _ippsSet_32s
        mov     r0, r11
        bl      __floatsidf
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        sub     r9, r9, r11
        add     r10, r10, r11, lsl #2
        mov     r4, r0
        mov     r5, r1
LAXW7:
        cmp     r9, #0
        ble     LAXW11
        cmp     r9, #0
        ble     LAXW11
        mov     r11, #0
        str     r10, [sp, #0xC]
        str     r5, [sp, #0x10]
LAXW8:
        mov     r0, r11
        bl      __floatsidf
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        ldr     r3, [sp, #0x10]
        mov     r2, r4
        bl      __adddf3
        mov     r10, r0
        mov     r5, r1
        mov     r2, #0
        mov     r3, #0
        bl      __gtdf2
        cmp     r0, #0
        ble     LAXW9
        mov     r2, r10
        mov     r3, r5
        mov     r1, r8
        mov     r0, #0
        bl      __adddf3
        b       LAXW10
LAXW9:
        mov     r0, r10
        mov     r1, r5
        mov     r3, r8
        mov     r2, #0
        bl      __subdf3
LAXW10:
        bl      __fixdfsi
        ldr     r12, [sp, #0xC]
        str     r0, [r12, +r11, lsl #2]
        add     r11, r11, #1
        cmp     r11, r9
        blt     LAXW8
LAXW11:
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LAXW12:
        mov     r0, r4
        mov     r1, r5
        mov     r2, #0
        mov     r3, #0
        bl      __gtdf2
        cmp     r0, #0
        ble     LAXW13
        mov     r1, r8
        mov     r2, r4
        mov     r3, r5
        mov     r0, #0
        bl      __adddf3
        mov     r4, r0
        mov     r5, r1
LAXW13:
        mov     r0, r4
        mov     r1, r5
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        bge     LAXW14
        mov     r0, r4
        mov     r1, r5
        mov     r3, r8
        mov     r2, #0
        bl      __subdf3
        mov     r4, r0
        mov     r5, r1
LAXW14:
        ldr     r6, [sp, #8]
        add     r12, r8, #1, 12
        mov     r11, r11, lsl #2
        mov     r1, r6
        mov     r0, r12, lsl #2
        mov     r2, r4
        mov     r3, r5
        bl      __ltdf2
        cmp     r0, #0
        movlt   r4, r11
        movlt   r5, r6
        sub     r8, r8, #0x7E, 8
        mov     r2, r4
        mov     r3, r5
        mov     r0, #0
        mov     r1, r8
        bl      __gtdf2
        cmp     r0, #0
        mov     r12, #0
        movgt   r4, r12
        movgt   r5, r8
        mov     r0, r4
        mov     r1, r5
        bl      __fixdfsi
        mov     r2, r9
        mov     r1, r10
        bl      _ippsSet_32s
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LAXW15:
        mvn     r0, #5
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LAXW16:
        mvn     r0, #7
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
        .long   LAXW__2il0floatpacket.1
        .long   LAXW__2il0floatpacket.2


        .data
        .align  4


LAXW__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x4F
LAXW__2il0floatpacket.2:
        .byte   0x00,0x00,0x00,0x00


