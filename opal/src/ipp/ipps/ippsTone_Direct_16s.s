        .text
        .align  4
        .globl  _ippsTone_Direct_16s


_ippsTone_Direct_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x38
        ldr     r11, [sp, #0x5C]
        mov     r7, r0
        mov     r6, r1
        cmp     r11, #0
        mov     r8, r2
        mov     r4, r3
        beq     LAOJ23
        cmp     r8, #0
        ble     LAOJ22
        ldr     r12, [pc, #0x624]
        mov     r0, r4
        ldr     r10, [r12]
        mov     r1, r10
        bl      __ltsf2
        cmp     r0, #0
        blt     LAOJ20
        mov     r0, r4
        bl      __extendsfdf2
        mov     r3, #0xFE, 12
        mov     r5, r0
        mov     r4, r1
        orr     r3, r3, #3, 4
        mov     r2, #0
        bl      __gedf2
        cmp     r0, #0
        bge     LAOJ20
        ldr     r9, [r11]
        mov     r1, r10
        mov     r0, r9
        bl      __ltsf2
        cmp     r0, #0
        blt     LAOJ19
        mov     r0, r9
        bl      __extendsfdf2
        ldr     r2, [pc, #0x5C4]
        ldr     r3, [pc, #0x5C4]
        str     r0, [sp, #4]
        str     r1, [sp]
        bl      __gedf2
        cmp     r0, #0
        bge     LAOJ19
        cmp     r7, #0
        beq     LAOJ23
        cmp     r6, #0
        ble     LAOJ21
        mov     r0, r5
        mov     r1, r4
        ldr     r2, [pc, #0x590]
        ldr     r3, [pc, #0x590]
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
        ldr     r2, [pc, #0x564]
        ldr     r3, [pc, #0x564]
        str     r0, [sp, #0x34]
        ldr     r0, [sp, #0x34]
        str     r1, [sp, #0x30]
        bl      __muldf3
        bl      floor
        ldr     r2, [pc, #0x540]
        ldr     r3, [pc, #0x540]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [sp, #0x34]
        ldr     r1, [sp, #0x30]
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
        blt     LAOJ0
        ldr     r0, [sp, #4]
        ldr     r1, [sp]
        ldr     r2, [pc, #0x4F0]
        ldr     r3, [pc, #0x4F0]
        bl      __gedf2
        cmp     r0, #0
        ldrlt   r12, [sp, #8]
        strlt   r12, [r11]
        blt     LAOJ1
LAOJ0:
        str     r10, [r11]
LAOJ1:
        mov     r0, r9
        bl      __extendsfdf2
        str     r1, [sp, #4]
        mov     r9, r0
        bl      cos
        str     r0, [sp, #0x34]
        mov     r0, r8
        mov     r8, r1
        bl      __floatsidf
        ldr     r2, [sp, #0x34]
        mov     r10, r0
        mov     r11, r1
        mov     r3, r8
        bl      __muldf3
        str     r1, [sp, #0x20]
        mov     r8, r0
        mov     r2, #0
        mov     r3, #0
        bl      __gtdf2
        mov     r12, #0xFE, 12
        cmp     r0, #0
        orr     r3, r12, #3, 4
        ble     LAOJ2
        mov     r1, r3
        mov     r2, r8
        ldr     r3, [sp, #0x20]
        mov     r0, #0
        bl      __adddf3
        b       LAOJ3
LAOJ2:
        mov     r0, r8
        ldr     r1, [sp, #0x20]
        mov     r2, #0
        bl      __subdf3
LAOJ3:
        bl      __fixdfsi
        cmp     r6, #1
        strh    r0, [r7]
        beq     LAOJ18
        mov     r2, r9
        ldr     r3, [sp, #4]
        mov     r0, r4
        mov     r1, r5
        bl      __adddf3
        bl      cos
        mov     r2, r10
        mov     r3, r11
        bl      __muldf3
        mov     r10, r0
        mov     r9, r1
        mov     r2, #0
        mov     r3, #0
        bl      __gtdf2
        mov     r12, #0xFE, 12
        orr     r12, r12, #3, 4
        cmp     r0, #0
        str     r12, [sp, #4]
        ble     LAOJ4
        ldr     r1, [sp, #4]
        mov     r0, #0
        mov     r2, r10
        mov     r3, r9
        bl      __adddf3
        b       LAOJ5
LAOJ4:
        mov     r0, r10
        mov     r1, r9
        ldr     r3, [sp, #4]
        mov     r2, #0
        bl      __subdf3
LAOJ5:
        bl      __fixdfsi
        cmp     r6, #2
        strh    r0, [r7, #2]
        beq     LAOJ18
        mov     r1, r5
        mov     r0, r4
        bl      cos
        mov     r2, r0
        mov     r3, r1
        bl      __adddf3
        str     r1, [sp]
        mov     r11, r0
        mov     r2, r10
        mov     r3, r9
        bl      __muldf3
        ldr     r3, [sp, #0x20]
        mov     r2, r8
        bl      __subdf3
        mov     r5, r0
        mov     r4, r1
        mov     r2, #0
        mov     r3, #0
        bl      __gtdf2
        cmp     r0, #0
        ble     LAOJ6
        ldr     r1, [sp, #4]
        mov     r0, #0
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        b       LAOJ7
LAOJ6:
        ldr     r3, [sp, #4]
        mov     r0, r5
        mov     r1, r4
        mov     r2, #0
        bl      __subdf3
LAOJ7:
        bl      __fixdfsi
        cmp     r6, #3
        strh    r0, [r7, #4]
        beq     LAOJ18
        mov     r0, r5
        mov     r1, r4
        mov     r2, r11
        ldr     r3, [sp]
        bl      __muldf3
        mov     r2, r10
        mov     r3, r9
        bl      __subdf3
        str     r0, [sp, #4]
        str     r1, [sp, #8]
        mov     r2, #0
        mov     r3, #0
        bl      __gtdf2
        cmp     r0, #0
        ble     LAOJ8
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #8]
        mov     r12, #0xFE, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __adddf3
        b       LAOJ9
LAOJ8:
        ldr     r0, [sp, #4]
        ldr     r1, [sp, #8]
        mov     r12, #0xFE, 12
        orr     r3, r12, #3, 4
        mov     r2, #0
        bl      __subdf3
LAOJ9:
        bl      __fixdfsi
        strh    r0, [r7, #6]
        ldr     r3, [sp]
        mov     r0, r11
        mov     r2, r11
        mov     r1, r3
        bl      __muldf3
        mov     r2, #0
        mov     r3, #1, 2
        bl      __subdf3
        bic     lr, r6, #1
        cmp     lr, #4
        mov     r2, r0
        str     r1, [sp, #0x28]
        ble     LAOJ15
        mov     r11, #4
        str     r11, [sp, #0x34]
        str     r10, [sp, #0x1C]
        ldr     r11, [sp, #8]
        ldr     r10, [sp, #4]
        add     r0, r7, #8
        add     r12, r7, #0xA
        str     r0, [sp, #0x30]
        str     r12, [sp, #0x14]
        str     lr, [sp]
        str     r2, [sp, #0x2C]
        str     r9, [sp, #0x18]
        str     r8, [sp, #0x24]
        str     r6, [sp, #0x10]
        str     r7, [sp, #0xC]
LAOJ10:
        mov     r0, r5
        mov     r1, r4
        ldr     r6, [sp, #0x2C]
        ldr     r7, [sp, #0x28]
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        ldr     r2, [sp, #0x24]
        ldr     r3, [sp, #0x20]
        bl      __subdf3
        mov     r8, r0
        mov     r9, r1
        mov     r2, r6
        mov     r3, r7
        mov     r0, r10
        mov     r1, r11
        bl      __muldf3
        ldr     r2, [sp, #0x1C]
        ldr     r3, [sp, #0x18]
        bl      __subdf3
        mov     r6, r0
        mov     r7, r1
        mov     r0, r8
        mov     r1, r9
        mov     r2, #0
        mov     r3, #0
        bl      __gtdf2
        str     r5, [sp, #0x24]
        str     r4, [sp, #0x20]
        str     r10, [sp, #0x1C]
        str     r11, [sp, #0x18]
        cmp     r0, #0
        mov     r5, r8
        mov     r4, r9
        mov     r10, r6
        mov     r11, r7
        ble     LAOJ11
        mov     r12, #0xFE, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        b       LAOJ12
LAOJ11:
        mov     r0, r8
        mov     r1, r9
        mov     r12, #0xFE, 12
        orr     r3, r12, #3, 4
        mov     r2, #0
        bl      __subdf3
LAOJ12:
        bl      __fixdfsi
        ldr     r8, [sp, #0x30]
        mov     r1, r7
        strh    r0, [r8], #4
        mov     r0, r6
        mov     r2, #0
        mov     r3, #0
        bl      __gtdf2
        cmp     r0, #0
        str     r8, [sp, #0x30]
        ble     LAOJ13
        mov     r12, #0xFE, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        mov     r2, r6
        mov     r3, r7
        bl      __adddf3
        b       LAOJ14
LAOJ13:
        mov     r0, r6
        mov     r1, r7
        mov     r12, #0xFE, 12
        orr     r3, r12, #3, 4
        mov     r2, #0
        bl      __subdf3
LAOJ14:
        bl      __fixdfsi
        ldr     r12, [sp, #0x34]
        ldr     lr, [sp, #0x14]
        add     r12, r12, #2
        str     r12, [sp, #0x34]
        strh    r0, [lr], #4
        ldr     r6, [sp]
        str     lr, [sp, #0x14]
        cmp     r12, r6
        blt     LAOJ10
        ldr     r2, [sp, #0x2C]
        ldr     r8, [sp, #0x24]
        ldr     r6, [sp, #0x10]
        ldr     r7, [sp, #0xC]
LAOJ15:
        tst     r6, #1
        beq     LAOJ18
        mov     r0, r5
        mov     r1, r4
        ldr     r3, [sp, #0x28]
        bl      __muldf3
        ldr     r3, [sp, #0x20]
        mov     r4, r0
        mov     r5, r1
        mov     r2, r8
        bl      __subdf3
        mov     r2, #0
        mov     r3, #0
        bl      __gtdf2
        mov     r12, #0xFE, 12
        cmp     r0, #0
        orr     r3, r12, #3, 4
        ble     LAOJ16
        mov     r1, r3
        mov     r2, r8
        ldr     r3, [sp, #0x20]
        mov     r0, #0
        bl      __subdf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        b       LAOJ17
LAOJ16:
        mov     r0, r4
        mov     r1, r5
        mov     r2, #0
        bl      __subdf3
        ldr     r3, [sp, #0x20]
        mov     r2, r8
        bl      __subdf3
LAOJ17:
        bl      __fixdfsi
        sub     r7, r7, #2
        mov     r6, r6, lsl #1
        strh    r0, [r7, +r6]
LAOJ18:
        mov     r0, #0
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LAOJ19:
        mvn     r0, #0x2B
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LAOJ20:
        mvn     r0, #0x2C
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LAOJ21:
        mvn     r0, #5
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LAOJ22:
        mvn     r0, #0x2D
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LAOJ23:
        mvn     r0, #7
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
        .long   LAOJ__2il0floatpacket.1
        .long   0x54442d18
        .long   0x401921fb
        .long   0x6dc9c883
        .long   0x3fc45f30


        .data
        .align  4


LAOJ__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


