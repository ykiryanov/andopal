        .text
        .align  4
        .globl  _ippsVectorSlope_32u


_ippsVectorSlope_32u:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        ldr     r7, [sp, #0x3C]
        ldr     r6, [sp, #0x40]
        mov     r8, r0
        cmp     r8, #0
        mov     r10, r1
        mov     r5, r2
        mov     r4, r3
        beq     LAXV16
        cmp     r10, #0
        ble     LAXV15
        mov     r0, r7
        mov     r1, r6
        mov     r2, #0
        mov     r3, #0
        bl      __eqdf2
        mov     lr, #0xFE, 12
        mvn     r12, #0xE1, 12
        orr     lr, lr, #0xF, 4
        bic     r12, r12, #0xB, 4
        cmp     r0, #0
        str     lr, [sp, #0x10]
        str     r12, [sp, #4]
        mov     r9, #0
        beq     LAXV12
        sub     r9, r9, #2, 12
        str     r9, [sp, #8]
        mov     r12, #0xFE, 12
        orr     r12, r12, #3, 4
        add     r9, r12, #1, 12
        mov     r1, r9
        mov     r2, r7
        mov     r3, r6
        mov     r0, #0
        bl      __divdf3
        bl      __truncdfsf2
        bl      __extendsfdf2
        str     r0, [sp, #0x14]
        mov     r11, r1
        mov     r2, r5
        mov     r3, r4
        mov     r0, #0
        mov     r1, #0
        bl      __subdf3
        ldr     r2, [sp, #0x14]
        mov     r3, r11
        bl      __muldf3
        mov     r3, r9
        mov     r2, #0
        bl      __adddf3
        bl      __truncdfsf2
        str     r0, [sp]
        ldr     r1, [sp, #4]
        ldr     r0, [sp, #8]
        mov     r2, r5
        mov     r3, r4
        bl      __subdf3
        ldr     r2, [sp, #0x14]
        mov     r3, r11
        bl      __muldf3
        mov     r3, r9
        mov     r2, #0
        bl      __adddf3
        bl      __truncdfsf2
        str     r0, [sp, #4]
        mov     r0, r7
        mov     r1, r6
        mov     r2, #0
        mov     r3, #0
        bl      __gtdf2
        ldr     r12, [pc, #0x498]
        cmp     r0, #0
        ldr     r12, [r12]
        mvn     r9, #2, 2
        str     r12, [sp, #8]
        ble     LAXV3
        ldr     r0, [sp]
        ldr     r1, [sp, #8]
        bl      __gtsf2
        cmp     r0, #0
        movgt   r11, r9
        bgt     LAXV0
        ldr     r12, [pc, #0x46C]
        ldr     r0, [sp]
        ldr     r1, [r12]
        bl      __ltsf2
        cmp     r0, #0
        movlt   r11, #0
        blt     LAXV0
        ldr     r0, [sp]
        bl      __fixsfsi
        mov     r11, r0
LAXV0:
        ldr     r1, [sp, #8]
        ldr     r0, [sp, #4]
        bl      __gtsf2
        cmp     r0, #0
        bgt     LAXV1
        ldr     r12, [pc, #0x430]
        ldr     r0, [sp, #4]
        ldr     r1, [r12]
        bl      __ltsf2
        cmp     r0, #0
        movlt   r9, #0
        blt     LAXV1
        ldr     r0, [sp, #4]
        bl      __fixsfsi
        mov     r9, r0
LAXV1:
        cmp     r9, r10
        bge     LAXV2
        cmp     r9, #0
        ble     LAXV2
        sub     r2, r10, r9
        add     r1, r8, r9, lsl #2
        mvn     r0, #0
        bl      _ippsSet_32s
        mov     r10, r9
LAXV2:
        cmp     r11, #0
        ble     LAXV7
        cmp     r11, r10
        movge   r11, r10
        mov     r2, r11
        mov     r1, r8
        mov     r0, #0
        bl      _ippsSet_32s
        mov     r0, r11
        bl      __floatsidf
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        sub     r10, r10, r11
        add     r8, r8, r11, lsl #2
        mov     r5, r0
        mov     r4, r1
        b       LAXV7
LAXV3:
        ldr     r0, [sp]
        ldr     r1, [sp, #8]
        bl      __gtsf2
        cmp     r0, #0
        movgt   r11, r9
        bgt     LAXV4
        ldr     r12, [pc, #0x378]
        ldr     r0, [sp]
        ldr     r1, [r12]
        bl      __ltsf2
        cmp     r0, #0
        movlt   r11, #0
        blt     LAXV4
        ldr     r0, [sp]
        bl      __fixsfsi
        mov     r11, r0
LAXV4:
        ldr     r1, [sp, #8]
        ldr     r0, [sp, #4]
        bl      __gtsf2
        cmp     r0, #0
        bgt     LAXV5
        ldr     r12, [pc, #0x33C]
        ldr     r0, [sp, #4]
        ldr     r1, [r12]
        bl      __ltsf2
        cmp     r0, #0
        movlt   r9, #0
        blt     LAXV5
        ldr     r0, [sp, #4]
        bl      __fixsfsi
        mov     r9, r0
LAXV5:
        cmp     r11, r10
        bge     LAXV6
        cmp     r11, #0
        ble     LAXV6
        sub     r2, r10, r11
        add     r1, r8, r11, lsl #2
        mov     r0, #0
        bl      _ippsSet_32s
        mov     r10, r11
LAXV6:
        cmp     r9, #0
        ble     LAXV7
        cmp     r9, r10
        movge   r9, r10
        mov     r2, r9
        mov     r1, r8
        mvn     r0, #0
        bl      _ippsSet_32s
        mov     r0, r9
        bl      __floatsidf
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        sub     r10, r10, r9
        add     r8, r8, r9, lsl #2
        mov     r5, r0
        mov     r4, r1
LAXV7:
        cmp     r10, #0
        ble     LAXV11
        cmp     r10, #0
        ble     LAXV11
        cmp     r10, #6
        mov     r9, #0
        blt     LAXV9
        sub     r12, r10, #6
        str     r12, [sp, #8]
        str     r10, [sp, #0xC]
LAXV8:
        mov     r0, r9
        bl      __floatsidf
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        ldr     r12, [sp, #0x10]
        add     r10, r12, #1, 2
        mov     r2, #0
        mov     r3, r10
        bl      __adddf3
        bl      __fixunsdfsi
        str     r0, [r8, +r9, lsl #2]
        add     r11, r9, #1
        mov     r0, r11
        bl      __floatsidf
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        mov     r2, #0
        mov     r3, r10
        bl      __adddf3
        bl      __fixunsdfsi
        str     r0, [r8, +r11, lsl #2]
        add     r11, r9, #2
        mov     r0, r11
        bl      __floatsidf
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        mov     r2, #0
        mov     r3, r10
        bl      __adddf3
        bl      __fixunsdfsi
        str     r0, [r8, +r11, lsl #2]
        add     r11, r9, #3
        mov     r0, r11
        bl      __floatsidf
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        mov     r2, #0
        mov     r3, r10
        bl      __adddf3
        bl      __fixunsdfsi
        str     r0, [r8, +r11, lsl #2]
        add     r11, r9, #4
        mov     r0, r11
        bl      __floatsidf
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        mov     r3, r10
        mov     r2, #0
        bl      __adddf3
        bl      __fixunsdfsi
        ldr     r12, [sp, #8]
        add     r9, r9, #5
        cmp     r9, r12
        str     r0, [r8, +r11, lsl #2]
        ble     LAXV8
        ldr     r10, [sp, #0xC]
LAXV9:
        ldr     r11, [sp, #0x10]
LAXV10:
        mov     r0, r9
        bl      __floatsidf
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        add     r3, r11, #1, 2
        mov     r2, #0
        bl      __adddf3
        bl      __fixunsdfsi
        str     r0, [r8, +r9, lsl #2]
        add     r9, r9, #1
        cmp     r9, r10
        blt     LAXV10
LAXV11:
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LAXV12:
        mov     r0, r5
        mov     r1, r4
        mov     r2, #0
        mov     r3, #0
        bl      __gtdf2
        cmp     r0, #0
        ble     LAXV13
        ldr     r12, [sp, #0x10]
        mov     r0, #0
        mov     r2, r5
        add     r1, r12, #1, 2
        mov     r3, r4
        bl      __adddf3
        mov     r5, r0
        mov     r4, r1
LAXV13:
        mov     r0, r5
        mov     r1, r4
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        bge     LAXV14
        ldr     r12, [sp, #0x10]
        mov     r0, r5
        mov     r1, r4
        add     r3, r12, #1, 2
        mov     r2, #0
        bl      __subdf3
        mov     r5, r0
        mov     r4, r1
LAXV14:
        ldr     r6, [sp, #4]
        sub     r7, r9, #2, 12
        mov     r2, r5
        mov     r3, r4
        mov     r0, r7
        mov     r1, r6
        bl      __ltdf2
        cmp     r0, #0
        movlt   r5, r7
        movlt   r4, r6
        mov     r2, r5
        mov     r3, r4
        mov     r0, #0
        mov     r1, #0
        bl      __gtdf2
        cmp     r0, #0
        movgt   r5, r9
        movgt   r4, r9
        mov     r0, r5
        mov     r1, r4
        bl      __fixunsdfsi
        mov     r2, r10
        mov     r1, r8
        bl      _ippsSet_32s
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LAXV15:
        mvn     r0, #5
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LAXV16:
        mvn     r0, #7
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
        .long   LAXV__2il0floatpacket.1
        .long   LAXV__2il0floatpacket.2


        .data
        .align  4


LAXV__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x4F
LAXV__2il0floatpacket.2:
        .byte   0x00,0x00,0x00,0x00


