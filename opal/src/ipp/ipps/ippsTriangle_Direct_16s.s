        .text
        .align  4
        .globl  _ippsTriangle_Direct_16s


_ippsTriangle_Direct_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x64
        ldr     r5, [sp, #0x8C]
        ldr     r10, [sp, #0x88]
        cmp     r5, #0
        str     r0, [sp, #4]
        mov     r8, r1
        mov     r9, r2
        mov     r6, r3
        beq     LANX17
        cmp     r9, #0
        ble     LANX16
        ldr     r12, [pc, #0x644]
        mov     r0, r6
        ldr     r4, [r12]
        mov     r1, r4
        bl      __ltsf2
        cmp     r0, #0
        blt     LANX14
        mov     r0, r6
        bl      __extendsfdf2
        mov     r12, #0xFE, 12
        orr     r3, r12, #3, 4
        mov     r7, r0
        mov     r6, r1
        mov     r2, #0
        bl      __gedf2
        cmp     r0, #0
        bge     LANX14
        mov     r0, r10
        bl      __extendsfdf2
        ldr     r12, [pc, #0x5FC]
        ldr     r2, [pc, #0x5FC]
        mov     r10, r0
        sub     r3, r12, #2, 2
        mov     r11, r1
        bl      __ltdf2
        cmp     r0, #0
        blt     LANX13
        mov     r0, r10
        mov     r1, r11
        ldr     r2, [pc, #0x5D8]
        ldr     r3, [pc, #0x5D0]
        bl      __gedf2
        cmp     r0, #0
        bge     LANX13
        ldr     r0, [r5]
        mov     r1, r4
        str     r0, [sp, #8]
        bl      __ltsf2
        cmp     r0, #0
        blt     LANX12
        ldr     r0, [sp, #8]
        bl      __extendsfdf2
        ldr     r12, [pc, #0x5A0]
        ldr     r2, [pc, #0x5A0]
        str     r0, [sp, #0x14]
        str     r1, [sp, #0x10]
        add     r3, r12, #1, 12
        bl      __gedf2
        cmp     r0, #0
        bge     LANX12
        ldr     r12, [sp, #4]
        cmp     r12, #0
        beq     LANX17
        cmp     r8, #0
        ble     LANX15
        ldr     r12, [pc, #0x56C]
        ldr     r2, [pc, #0x56C]
        mov     r0, r7
        add     r12, r12, #1, 12
        str     r12, [sp, #0x5C]
        ldr     r3, [sp, #0x5C]
        mov     r1, r6
        bl      __muldf3
        str     r0, [sp, #0x58]
        mov     r4, r1
        mov     r0, r8
        bl      __floatsidf
        ldr     r2, [sp, #0x58]
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [sp, #0x14]
        ldr     r3, [sp, #0x10]
        bl      __adddf3
        ldr     r2, [pc, #0x52C]
        ldr     r3, [pc, #0x52C]
        str     r0, [sp, #0x58]
        ldr     r0, [sp, #0x58]
        mov     r4, r1
        bl      __muldf3
        bl      floor
        ldr     r3, [sp, #0x5C]
        ldr     r2, [pc, #0x508]
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x58]
        mov     r3, r1
        mov     r1, r4
        bl      __subdf3
        str     r1, [sp, #0xC]
        mov     r4, r0
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        blt     LANX0
        ldr     r12, [pc, #0x4CC]
        ldr     r1, [sp, #0xC]
        ldr     r2, [pc, #0x4C8]
        add     r3, r12, #1, 12
        mov     r0, r4
        bl      __gedf2
        cmp     r0, #0
        blt     LANX1
LANX0:
        mov     r4, #0
        str     r4, [sp, #0xC]
LANX1:
        ldr     r1, [sp, #0xC]
        mov     r0, r4
        bl      __truncdfsf2
        ldr     r1, [pc, #0x498]
        str     r0, [r5]
        ldr     r0, [pc, #0x494]
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        mov     r5, r0
        str     r5, [sp, #8]
        ldr     r0, [pc, #0x47C]
        mov     r4, r1
        ldr     r1, [pc, #0x470]
        mov     r2, r10
        mov     r3, r11
        bl      __subdf3
        ldr     r12, [pc, #0x460]
        str     r0, [sp]
        str     r1, [sp, #0xC]
        add     r12, r12, #2, 12
        str     r12, [sp, #0x54]
        mov     r0, r9
        bl      __floatsidf
        ldr     r3, [sp, #0x54]
        ldr     r2, [pc, #0x444]
        mov     r11, r0
        mov     r10, r1
        bl      __muldf3
        str     r0, [sp, #0x4C]
        ldr     r0, [sp, #0x4C]
        str     r1, [sp, #0x48]
        mov     r3, r6
        mov     r2, r7
        bl      __muldf3
        mov     r6, r1
        str     r0, [sp, #0x54]
        eor     r1, r6, #2, 2
        mov     r2, r5
        mov     r3, r4
        bl      __divdf3
        ldr     r2, [sp]
        ldr     r3, [sp, #0xC]
        str     r0, [sp, #0x30]
        ldr     r0, [sp, #0x54]
        str     r1, [sp, #0x34]
        mov     r1, r6
        bl      __divdf3
        ldr     r12, [sp, #0xC]
        str     r0, [sp, #0x2C]
        ldr     r0, [sp]
        str     r1, [sp, #0x28]
        eor     r1, r12, #2, 2
        mov     r2, r5
        mov     r3, r4
        bl      __divdf3
        ldr     r2, [sp]
        ldr     r3, [sp, #0xC]
        str     r0, [sp, #0x24]
        mov     r7, r1
        eor     r1, r4, #2, 2
        str     r7, [sp, #0x20]
        mov     r0, r5
        bl      __divdf3
        ldr     r2, [sp]
        ldr     r3, [sp, #0xC]
        str     r1, [sp, #0x1C]
        ldr     r1, [sp, #0x48]
        mov     r6, r0
        ldr     r0, [sp, #0x4C]
        str     r6, [sp, #0x18]
        bl      __divdf3
        str     r0, [sp, #0x50]
        ldr     r0, [sp, #0x4C]
        str     r1, [sp, #0x54]
        ldr     r1, [sp, #0x48]
        mov     r2, r5
        mov     r3, r4
        bl      __divdf3
        str     r0, [sp, #0x48]
        ldr     r0, [sp, #0x24]
        str     r1, [sp, #0x4C]
        mov     r2, r11
        mov     r3, r10
        mov     r1, r7
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r11
        mov     r1, r10
        bl      __subdf3
        ldr     r3, [sp, #0x1C]
        str     r0, [sp, #0x44]
        str     r1, [sp, #0x40]
        mov     r0, r11
        mov     r1, r10
        mov     r2, r6
        bl      __muldf3
        mov     r2, r11
        mov     r3, r10
        bl      __subdf3
        ldr     r2, [sp, #0x14]
        ldr     r3, [sp, #0x10]
        str     r0, [sp, #0x38]
        str     r1, [sp, #0x3C]
        mov     r0, r5
        mov     r1, r4
        bl      __gtdf2
        cmp     r0, #0
        ble     LANX2
        ldr     r2, [sp, #0x14]
        ldr     r3, [sp, #0x10]
        mov     r0, r2
        mov     r1, r3
        bl      __adddf3
        ldr     r2, [sp, #8]
        mov     r3, r4
        bl      __divdf3
        mov     r3, r1
        mov     r12, #0xFF, 12
        mov     r2, r0
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __subdf3
        ldr     r6, [sp, #0x30]
        ldr     r7, [sp, #0x34]
        b       LANX3
LANX2:
        ldr     r0, [sp, #0x14]
        ldr     r1, [sp, #0x10]
        ldr     r2, [sp, #8]
        mov     r3, r4
        bl      __subdf3
        mov     r2, #0
        mov     r3, #1, 2
        bl      __muldf3
        ldr     r2, [sp]
        ldr     r3, [sp, #0xC]
        bl      __divdf3
        mov     r12, #0xFE, 12
        orr     r12, r12, #3, 4
        add     r12, r12, #1, 12
        sub     r3, r12, #2, 2
        mov     r2, #0
        bl      __adddf3
        ldr     r6, [sp, #0x2C]
        ldr     r7, [sp, #0x28]
LANX3:
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        mov     r0, r6
        mov     r1, r7
        mov     r2, #0
        mov     r3, #0
        bl      __gtdf2
        cmp     r0, #0
        movle   r0, #0
        movgt   r0, #1
        cmp     r8, #0
        ble     LANX11
        str     r11, [sp, #0x5C]
        ldr     r11, [sp, #4]
        str     r9, [sp, #0x60]
        str     r10, [sp, #0x58]
        mov     r9, r8
        str     r7, [sp, #0x14]
        mov     r10, r0
        mov     r8, r6
LANX4:
        mov     r0, r4
        mov     r1, r5
        mov     r2, #0
        mov     r3, #0
        bl      __gtdf2
        cmp     r0, #0
        ble     LANX5
        mov     r12, #0xFE, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        b       LANX6
LANX5:
        mov     r0, r4
        mov     r1, r5
        mov     r12, #0xFE, 12
        orr     r3, r12, #3, 4
        mov     r2, #0
        bl      __subdf3
LANX6:
        bl      __fixdfsi
        strh    r0, [r11], #2
        ldr     r1, [sp, #0x14]
        mov     r2, r4
        mov     r3, r5
        mov     r0, r8
        bl      __adddf3
        mov     r6, r0
        mov     r7, r1
        cmp     r10, #0
        mov     r4, r6
        mov     r5, r7
        beq     LANX8
        mov     r0, r6
        mov     r1, r7
        ldr     r2, [sp, #0x5C]
        ldr     r3, [sp, #0x58]
        bl      __gtdf2
        cmp     r0, #0
        ble     LANX10
        ldr     r0, [sp, #0x24]
        ldr     r1, [sp, #0x20]
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        ldr     r2, [sp, #0x44]
        ldr     r3, [sp, #0x40]
        bl      __adddf3
        ldr     r12, [sp, #0x60]
        mov     r4, r0
        mov     r5, r1
        rsb     r0, r12, #0
        bl      __floatsidf
        mov     r2, r4
        mov     r3, r5
        bl      __gtdf2
        cmp     r0, #0
        ble     LANX7
        mov     r0, r6
        mov     r1, r7
        ldr     r2, [sp, #0x50]
        ldr     r3, [sp, #0x54]
        bl      __subdf3
        mov     r4, r0
        mov     r5, r1
        b       LANX10
LANX7:
        ldr     r12, [sp, #0x34]
        ldr     r8, [sp, #0x30]
        mov     r10, #0
        str     r12, [sp, #0x14]
        b       LANX10
LANX8:
        ldr     r12, [sp, #0x60]
        rsb     r0, r12, #0
        bl      __floatsidf
        mov     r2, r6
        mov     r3, r7
        bl      __gtdf2
        cmp     r0, #0
        ble     LANX10
        ldr     r0, [sp, #0x18]
        ldr     r1, [sp, #0x1C]
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        ldr     r2, [sp, #0x38]
        ldr     r3, [sp, #0x3C]
        bl      __adddf3
        ldr     r2, [sp, #0x5C]
        ldr     r3, [sp, #0x58]
        mov     r4, r0
        mov     r5, r1
        bl      __gtdf2
        cmp     r0, #0
        ble     LANX9
        ldr     r0, [sp, #0x48]
        ldr     r1, [sp, #0x4C]
        mov     r2, r6
        mov     r3, r7
        bl      __adddf3
        mov     r4, r0
        mov     r5, r1
        b       LANX10
LANX9:
        ldr     r12, [sp, #0x28]
        ldr     r8, [sp, #0x2C]
        mov     r10, #1
        str     r12, [sp, #0x14]
LANX10:
        subs    r9, r9, #1
        bne     LANX4
LANX11:
        mov     r0, #0
        add     sp, sp, #0x64
        ldmia   sp!, {r4 - r11, pc}
LANX12:
        mvn     r0, #0x28
        add     sp, sp, #0x64
        ldmia   sp!, {r4 - r11, pc}
LANX13:
        mvn     r0, #0x27
        add     sp, sp, #0x64
        ldmia   sp!, {r4 - r11, pc}
LANX14:
        mvn     r0, #0x29
        add     sp, sp, #0x64
        ldmia   sp!, {r4 - r11, pc}
LANX15:
        mvn     r0, #5
        add     sp, sp, #0x64
        ldmia   sp!, {r4 - r11, pc}
LANX16:
        mvn     r0, #0x2A
        add     sp, sp, #0x64
        ldmia   sp!, {r4 - r11, pc}
LANX17:
        mvn     r0, #7
        add     sp, sp, #0x64
        ldmia   sp!, {r4 - r11, pc}
        .long   LANX__2il0floatpacket.1
        .long   0x400921fb
        .long   0x54442d18
        .long   0x6dc9c883
        .long   0x3fc45f30


        .data
        .align  4


LANX__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


