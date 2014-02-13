        .text
        .align  4
        .globl  _ippsTone_Direct_16sc


_ippsTone_Direct_16sc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        ldr     r11, [sp, #0x44]
        mov     r8, r0
        mov     r7, r1
        cmp     r11, #0
        mov     r4, r2
        mov     r5, r3
        beq     LAOI20
        cmp     r4, #0
        ble     LAOI19
        ldr     r12, [pc, #0x544]
        mov     r0, r5
        ldr     r10, [r12]
        mov     r1, r10
        bl      __ltsf2
        cmp     r0, #0
        blt     LAOI17
        mov     r0, r5
        bl      __extendsfdf2
        mov     r3, #0xFE, 12
        orr     r3, r3, #3, 4
        mov     r6, r0
        mov     r5, r1
        add     r3, r3, #1, 12
        mov     r2, #0
        bl      __gedf2
        cmp     r0, #0
        bge     LAOI17
        ldr     r9, [r11]
        mov     r1, r10
        mov     r0, r9
        bl      __ltsf2
        cmp     r0, #0
        blt     LAOI16
        mov     r0, r9
        bl      __extendsfdf2
        ldr     r2, [pc, #0x4E0]
        ldr     r3, [pc, #0x4E0]
        str     r0, [sp, #4]
        str     r1, [sp]
        bl      __gedf2
        cmp     r0, #0
        bge     LAOI16
        cmp     r8, #0
        beq     LAOI20
        cmp     r7, #0
        ble     LAOI18
        mov     r0, r6
        mov     r1, r5
        ldr     r2, [pc, #0x4AC]
        ldr     r3, [pc, #0x4AC]
        bl      __muldf3
        mov     r5, r0
        str     r5, [sp, #0x10]
        mov     r6, r1
        str     r6, [sp, #0xC]
        mov     r0, r7
        bl      __floatsidf
        mov     r2, r5
        mov     r3, r6
        bl      __muldf3
        ldr     r2, [sp, #4]
        ldr     r3, [sp]
        bl      __adddf3
        ldr     r2, [pc, #0x478]
        ldr     r3, [pc, #0x478]
        mov     r5, r0
        mov     r6, r1
        bl      __muldf3
        bl      floor
        ldr     r2, [pc, #0x458]
        ldr     r3, [pc, #0x458]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r5
        mov     r1, r6
        bl      __subdf3
        bl      __truncdfsf2
        str     r0, [sp, #8]
        bl      __extendsfdf2
        mov     r5, r0
        mov     r6, r1
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        blt     LAOI0
        ldr     r2, [pc, #0x410]
        ldr     r3, [pc, #0x410]
        mov     r0, r5
        mov     r1, r6
        bl      __gedf2
        cmp     r0, #0
        ldrlt   r3, [sp, #8]
        strlt   r3, [r11]
        blt     LAOI1
LAOI0:
        str     r10, [r11]
LAOI1:
        mov     r0, r9
        bl      __extendsfdf2
        mov     r11, r0
        mov     r6, r1
        bl      cos
        mov     r5, r0
        mov     r0, r4
        mov     r4, r1
        bl      __floatsidf
        mov     r9, r0
        mov     r10, r1
        mov     r3, r4
        mov     r2, r5
        bl      __muldf3
        mov     r4, r1
        str     r4, [sp, #4]
        mov     r5, r0
        mov     r1, r6
        mov     r0, r11
        bl      sin
        mov     r2, r9
        mov     r3, r10
        bl      __muldf3
        str     r0, [sp]
        str     r1, [sp, #8]
        mov     r0, r5
        mov     r1, r4
        mov     r2, #0
        mov     r3, #0
        bl      __gtdf2
        cmp     r0, #0
        ble     LAOI2
        ldr     r3, [sp, #4]
        mov     r12, #0xFE, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        mov     r2, r5
        bl      __adddf3
        b       LAOI3
LAOI2:
        mov     r0, r5
        ldr     r1, [sp, #4]
        mov     r12, #0xFE, 12
        orr     r3, r12, #3, 4
        mov     r2, #0
        bl      __subdf3
LAOI3:
        bl      __fixdfsi
        strh    r0, [r8]
        ldr     r0, [sp]
        ldr     r1, [sp, #8]
        mov     r2, #0
        mov     r3, #0
        bl      __gtdf2
        cmp     r0, #0
        ble     LAOI4
        ldr     r2, [sp]
        ldr     r3, [sp, #8]
        mov     r12, #0xFE, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __adddf3
        b       LAOI5
LAOI4:
        ldr     r0, [sp]
        ldr     r1, [sp, #8]
        mov     r12, #0xFE, 12
        orr     r3, r12, #3, 4
        mov     r2, #0
        bl      __subdf3
LAOI5:
        bl      __fixdfsi
        cmp     r7, #1
        strh    r0, [r8, #2]
        beq     LAOI15
        mov     r2, r11
        mov     r3, r6
        ldr     r0, [sp, #0x10]
        ldr     r1, [sp, #0xC]
        bl      __adddf3
        str     r1, [sp, #0x1C]
        mov     r11, r0
        bl      cos
        mov     r2, r9
        mov     r3, r10
        bl      __muldf3
        mov     r4, r1
        ldr     r1, [sp, #0x1C]
        mov     r6, r0
        mov     r0, r11
        bl      sin
        mov     r2, r9
        mov     r3, r10
        bl      __muldf3
        mov     r10, r0
        mov     r9, r1
        mov     r0, r6
        mov     r1, r4
        mov     r2, #0
        mov     r3, #0
        bl      __gtdf2
        cmp     r0, #0
        ble     LAOI6
        mov     r12, #0xFE, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        mov     r2, r6
        mov     r3, r4
        bl      __adddf3
        b       LAOI7
LAOI6:
        mov     r0, r6
        mov     r1, r4
        mov     r12, #0xFE, 12
        orr     r3, r12, #3, 4
        mov     r2, #0
        bl      __subdf3
LAOI7:
        bl      __fixdfsi
        strh    r0, [r8, #4]
        mov     r0, r10
        mov     r1, r9
        mov     r2, #0
        mov     r3, #0
        bl      __gtdf2
        cmp     r0, #0
        ble     LAOI8
        mov     r12, #0xFE, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        mov     r2, r10
        mov     r3, r9
        bl      __adddf3
        b       LAOI9
LAOI8:
        mov     r0, r10
        mov     r1, r9
        mov     r12, #0xFE, 12
        orr     r3, r12, #3, 4
        mov     r2, #0
        bl      __subdf3
LAOI9:
        bl      __fixdfsi
        cmp     r7, #2
        strh    r0, [r8, #6]
        beq     LAOI15
        ldr     r1, [sp, #0xC]
        ldr     r0, [sp, #0x10]
        bl      cos
        mov     r2, r0
        mov     r3, r1
        bl      __adddf3
        cmp     r7, #2
        ble     LAOI15
        add     r8, r8, #6
        sub     r7, r7, #2
        str     r8, [sp, #0x1C]
        str     r1, [sp, #0x10]
        str     r0, [sp, #0xC]
        str     r6, [sp, #0x18]
        str     r5, [sp, #0x14]
LAOI10:
        ldr     r0, [sp, #0x18]
        ldr     r11, [sp, #0xC]
        ldr     r8, [sp, #0x10]
        mov     r1, r4
        mov     r2, r11
        mov     r3, r8
        bl      __muldf3
        ldr     r3, [sp, #4]
        ldr     r2, [sp, #0x14]
        bl      __subdf3
        mov     r5, r0
        mov     r6, r1
        mov     r2, r11
        mov     r3, r8
        mov     r0, r10
        mov     r1, r9
        bl      __muldf3
        ldr     r2, [sp]
        ldr     r3, [sp, #8]
        bl      __subdf3
        mov     r11, r0
        mov     r8, r1
        mov     r0, r5
        mov     r1, r6
        mov     r2, #0
        mov     r3, #0
        bl      __gtdf2
        ldr     r12, [sp, #0x18]
        str     r4, [sp, #4]
        str     r10, [sp]
        str     r9, [sp, #8]
        cmp     r0, #0
        str     r12, [sp, #0x14]
        str     r5, [sp, #0x18]
        mov     r4, r6
        mov     r10, r11
        mov     r9, r8
        ble     LAOI11
        mov     r12, #0xFE, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        mov     r2, r5
        mov     r3, r6
        bl      __adddf3
        b       LAOI12
LAOI11:
        mov     r0, r5
        mov     r1, r6
        mov     r12, #0xFE, 12
        orr     r3, r12, #3, 4
        mov     r2, #0
        bl      __subdf3
LAOI12:
        bl      __fixdfsi
        ldr     r12, [sp, #0x1C]
        mov     r1, r8
        strh    r0, [r12, #2]
        mov     r0, r11
        mov     r2, #0
        mov     r3, #0
        bl      __gtdf2
        cmp     r0, #0
        ble     LAOI13
        mov     r12, #0xFE, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        mov     r2, r11
        mov     r3, r8
        bl      __adddf3
        b       LAOI14
LAOI13:
        mov     r0, r11
        mov     r1, r8
        mov     r12, #0xFE, 12
        orr     r3, r12, #3, 4
        mov     r2, #0
        bl      __subdf3
LAOI14:
        bl      __fixdfsi
        ldr     r12, [sp, #0x1C]
        subs    r7, r7, #1
        strh    r0, [r12, #4]!
        str     r12, [sp, #0x1C]
        bne     LAOI10
LAOI15:
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LAOI16:
        mvn     r0, #0x2B
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LAOI17:
        mvn     r0, #0x2C
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LAOI18:
        mvn     r0, #5
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LAOI19:
        mvn     r0, #0x2D
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LAOI20:
        mvn     r0, #7
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
        .long   LAOI__2il0floatpacket.1
        .long   0x54442d18
        .long   0x401921fb
        .long   0x6dc9c883
        .long   0x3fc45f30


        .data
        .align  4


LAOI__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


