        .text
        .align  4
        .globl  _ippsTriangle_Direct_32f


_ippsTriangle_Direct_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x64
        ldr     r5, [sp, #0x8C]
        ldr     r6, [sp, #0x88]
        cmp     r5, #0
        str     r0, [sp, #0x58]
        mov     r11, r1
        mov     r10, r2
        mov     r7, r3
        beq     LANV20
        ldr     r12, [pc, #0x658]
        mov     r0, r10
        ldr     r4, [r12]
        mov     r1, r4
        bl      __lesf2
        cmp     r0, #0
        ble     LANV16
        mov     r0, r7
        mov     r1, r4
        bl      __ltsf2
        cmp     r0, #0
        blt     LANV15
        mov     r0, r7
        bl      __extendsfdf2
        mov     r12, #0xFF, 12
        orr     r12, r12, #3, 4
        sub     r3, r12, #1, 12
        mov     r9, r0
        mov     r8, r1
        mov     r2, #0
        bl      __gedf2
        cmp     r0, #0
        bge     LANV15
        mov     r0, r6
        bl      __extendsfdf2
        ldr     r12, [pc, #0x5F8]
        ldr     r2, [pc, #0x5F8]
        mov     r6, r0
        sub     r3, r12, #2, 2
        mov     r7, r1
        bl      __ltdf2
        cmp     r0, #0
        blt     LANV14
        mov     r0, r6
        mov     r1, r7
        ldr     r2, [pc, #0x5D4]
        ldr     r3, [pc, #0x5CC]
        bl      __gedf2
        cmp     r0, #0
        bge     LANV14
        ldr     r0, [r5]
        mov     r1, r4
        str     r0, [sp, #0x54]
        bl      __ltsf2
        cmp     r0, #0
        blt     LANV13
        ldr     r0, [sp, #0x54]
        bl      __extendsfdf2
        ldr     r12, [pc, #0x59C]
        ldr     r2, [pc, #0x59C]
        str     r0, [sp, #0x50]
        str     r1, [sp, #0x54]
        add     r3, r12, #1, 12
        bl      __gedf2
        cmp     r0, #0
        bge     LANV13
        ldr     r12, [sp, #0x58]
        cmp     r12, #0
        beq     LANV20
        cmp     r11, #0
        ble     LANV21
        ldr     r12, [pc, #0x568]
        ldr     r2, [pc, #0x568]
        mov     r0, r9
        add     r12, r12, #1, 12
        str     r12, [sp, #0x60]
        ldr     r3, [sp, #0x60]
        mov     r1, r8
        bl      __muldf3
        str     r0, [sp, #0x5C]
        mov     r4, r1
        mov     r0, r11
        bl      __floatsidf
        ldr     r2, [sp, #0x5C]
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [sp, #0x50]
        ldr     r3, [sp, #0x54]
        bl      __adddf3
        ldr     r2, [pc, #0x528]
        ldr     r3, [pc, #0x528]
        str     r0, [sp, #0x5C]
        ldr     r0, [sp, #0x5C]
        mov     r4, r1
        bl      __muldf3
        bl      floor
        ldr     r3, [sp, #0x60]
        ldr     r2, [pc, #0x504]
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x5C]
        mov     r3, r1
        mov     r1, r4
        bl      __subdf3
        str     r1, [sp, #0x4C]
        mov     r4, r0
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        blt     LANV0
        ldr     r12, [pc, #0x4C8]
        ldr     r1, [sp, #0x4C]
        ldr     r2, [pc, #0x4C4]
        add     r3, r12, #1, 12
        mov     r0, r4
        bl      __gedf2
        cmp     r0, #0
        blt     LANV1
LANV0:
        mov     r4, #0
        str     r4, [sp, #0x4C]
LANV1:
        ldr     r1, [sp, #0x4C]
        mov     r0, r4
        bl      __truncdfsf2
        ldr     r1, [pc, #0x494]
        str     r0, [r5]
        ldr     r0, [pc, #0x490]
        mov     r2, r6
        mov     r3, r7
        bl      __adddf3
        mov     r5, r1
        ldr     r1, [pc, #0x478]
        mov     r4, r0
        ldr     r0, [pc, #0x474]
        mov     r2, r6
        mov     r3, r7
        bl      __subdf3
        ldr     r12, [pc, #0x460]
        str     r0, [sp, #0x5C]
        str     r1, [sp, #0x60]
        add     r12, r12, #2, 12
        str     r12, [sp, #0x44]
        mov     r0, r10
        bl      __extendsfdf2
        ldr     r2, [pc, #0x448]
        ldr     r3, [sp, #0x44]
        mov     r6, r0
        str     r6, [sp, #0x4C]
        mov     r7, r1
        str     r7, [sp, #0x48]
        bl      __muldf3
        str     r0, [sp, #0x1C]
        ldr     r0, [sp, #0x1C]
        str     r1, [sp, #0x18]
        mov     r3, r8
        mov     r2, r9
        bl      __muldf3
        mov     r8, r1
        str     r0, [sp, #0x3C]
        eor     r1, r8, #2, 2
        mov     r2, r4
        mov     r3, r5
        bl      __divdf3
        ldr     r2, [sp, #0x5C]
        ldr     r3, [sp, #0x60]
        str     r0, [sp, #0x44]
        ldr     r0, [sp, #0x3C]
        str     r1, [sp, #0x40]
        mov     r1, r8
        bl      __divdf3
        ldr     r12, [sp, #0x60]
        str     r0, [sp, #0x2C]
        ldr     r0, [sp, #0x5C]
        str     r1, [sp, #0x28]
        eor     r1, r12, #2, 2
        mov     r2, r4
        mov     r3, r5
        bl      __divdf3
        ldr     r2, [sp, #0x5C]
        ldr     r3, [sp, #0x60]
        str     r0, [sp, #0x3C]
        mov     r9, r1
        eor     r1, r5, #2, 2
        str     r9, [sp, #0x38]
        mov     r0, r4
        bl      __divdf3
        ldr     r2, [sp, #0x5C]
        ldr     r3, [sp, #0x60]
        str     r0, [sp, #0x30]
        ldr     r0, [sp, #0x1C]
        mov     r8, r1
        ldr     r1, [sp, #0x18]
        str     r8, [sp, #0x34]
        bl      __divdf3
        str     r0, [sp, #0x24]
        ldr     r0, [sp, #0x1C]
        str     r1, [sp, #0x20]
        ldr     r1, [sp, #0x18]
        mov     r2, r4
        mov     r3, r5
        bl      __divdf3
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x3C]
        str     r1, [sp, #0x1C]
        mov     r2, r6
        mov     r3, r7
        mov     r1, r9
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r6
        mov     r1, r7
        bl      __subdf3
        ldr     r2, [sp, #0x30]
        str     r0, [sp, #0x14]
        str     r1, [sp, #0x10]
        mov     r0, r6
        mov     r1, r7
        mov     r3, r8
        bl      __muldf3
        mov     r2, r6
        mov     r3, r7
        bl      __subdf3
        ldr     r2, [sp, #0x50]
        ldr     r3, [sp, #0x54]
        str     r0, [sp, #0xC]
        str     r1, [sp, #8]
        mov     r0, r4
        mov     r1, r5
        bl      __gtdf2
        cmp     r0, #0
        ble     LANV2
        ldr     r2, [sp, #0x50]
        ldr     r3, [sp, #0x54]
        mov     r0, r2
        mov     r1, r3
        bl      __adddf3
        mov     r2, r4
        mov     r3, r5
        bl      __divdf3
        mov     r3, r1
        mov     r12, #0xFF, 12
        mov     r2, r0
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __subdf3
        ldr     r7, [sp, #0x44]
        ldr     r6, [sp, #0x40]
        b       LANV3
LANV2:
        ldr     r0, [sp, #0x50]
        ldr     r1, [sp, #0x54]
        mov     r2, r4
        mov     r3, r5
        bl      __subdf3
        mov     r2, #0
        mov     r3, #1, 2
        bl      __muldf3
        ldr     r2, [sp, #0x5C]
        ldr     r3, [sp, #0x60]
        bl      __divdf3
        mov     r3, #0xFF, 12
        orr     r3, r3, #3, 4
        sub     r3, r3, #2, 2
        mov     r2, #0
        bl      __adddf3
        ldr     r7, [sp, #0x2C]
        ldr     r6, [sp, #0x28]
LANV3:
        ldr     r2, [sp, #0x4C]
        ldr     r3, [sp, #0x48]
        bl      __muldf3
        mov     r5, r0
        mov     r4, r1
        mov     r0, r7
        mov     r1, r6
        mov     r2, #0
        mov     r3, #0
        bl      __gtdf2
        cmp     r0, #0
        ble     LANV4
        cmp     r11, #0
        movgt   r9, #1
        bgt     LANV5
        b       LANV17
LANV4:
        cmp     r11, #0
        movgt   r9, #0
        ble     LANV17
LANV5:
        mov     r8, #0
        str     r10, [sp]
        str     r11, [sp, #4]
LANV6:
        mov     r0, r5
        mov     r1, r4
        bl      __truncdfsf2
        ldr     r12, [sp, #0x58]
        mov     r1, r6
        str     r0, [r12, +r8, lsl #2]
        mov     r2, r5
        mov     r3, r4
        mov     r0, r7
        bl      __adddf3
        mov     r11, r0
        mov     r10, r1
        cmp     r9, #0
        mov     r5, r11
        mov     r4, r10
        beq     LANV9
        mov     r0, r11
        mov     r1, r10
        ldr     r2, [sp, #0x4C]
        ldr     r3, [sp, #0x48]
        bl      __gtdf2
        cmp     r0, #0
        ble     LANV8
        ldr     r0, [sp, #0x3C]
        ldr     r1, [sp, #0x38]
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0x14]
        ldr     r3, [sp, #0x10]
        bl      __adddf3
        ldr     r12, [sp]
        mov     r5, r0
        mov     r4, r1
        eor     r0, r12, #2, 2
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __gtdf2
        cmp     r0, #0
        ble     LANV7
        mov     r0, r11
        mov     r1, r10
        ldr     r2, [sp, #0x24]
        ldr     r3, [sp, #0x20]
        bl      __subdf3
        mov     r5, r0
        mov     r4, r1
        b       LANV11
LANV7:
        ldr     r7, [sp, #0x44]
        ldr     r6, [sp, #0x40]
        mov     r9, #0
        b       LANV11
LANV8:
        ldr     r12, [sp, #4]
        add     r8, r8, #1
        cmp     r8, r12
        blt     LANV6
        b       LANV17
LANV9:
        ldr     r12, [sp]
        eor     r0, r12, #2, 2
        bl      __extendsfdf2
        mov     r2, r11
        mov     r3, r10
        bl      __gtdf2
        cmp     r0, #0
        ble     LANV12
        ldr     r0, [sp, #0x30]
        ldr     r1, [sp, #0x34]
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #8]
        bl      __adddf3
        ldr     r2, [sp, #0x4C]
        ldr     r3, [sp, #0x48]
        mov     r5, r0
        mov     r4, r1
        bl      __gtdf2
        cmp     r0, #0
        ble     LANV10
        ldr     r0, [sp, #0x18]
        ldr     r1, [sp, #0x1C]
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        mov     r5, r0
        mov     r4, r1
        b       LANV11
LANV10:
        ldr     r7, [sp, #0x2C]
        ldr     r6, [sp, #0x28]
        mov     r9, #1
LANV11:
        ldr     r12, [sp, #4]
        add     r8, r8, #1
        cmp     r8, r12
        blt     LANV6
        b       LANV18
LANV12:
        ldr     r12, [sp, #4]
        add     r8, r8, #1
        cmp     r8, r12
        blt     LANV6
        b       LANV19
LANV13:
        mvn     r0, #0x28
        add     sp, sp, #0x64
        ldmia   sp!, {r4 - r11, pc}
LANV14:
        mvn     r0, #0x27
        add     sp, sp, #0x64
        ldmia   sp!, {r4 - r11, pc}
LANV15:
        mvn     r0, #0x29
        add     sp, sp, #0x64
        ldmia   sp!, {r4 - r11, pc}
LANV16:
        mvn     r0, #0x2A
        add     sp, sp, #0x64
        ldmia   sp!, {r4 - r11, pc}
LANV17:
        mov     r0, #0
        add     sp, sp, #0x64
        ldmia   sp!, {r4 - r11, pc}
LANV18:
        mov     r0, #0
        add     sp, sp, #0x64
        ldmia   sp!, {r4 - r11, pc}
LANV19:
        mov     r0, #0
        add     sp, sp, #0x64
        ldmia   sp!, {r4 - r11, pc}
LANV20:
        mvn     r0, #7
        add     sp, sp, #0x64
        ldmia   sp!, {r4 - r11, pc}
LANV21:
        mvn     r0, #5
        add     sp, sp, #0x64
        ldmia   sp!, {r4 - r11, pc}
        .long   LANV__2il0floatpacket.1
        .long   0x400921fb
        .long   0x54442d18
        .long   0x6dc9c883
        .long   0x3fc45f30


        .data
        .align  4


LANV__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


