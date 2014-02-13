        .text
        .align  4
        .globl  _ippsTriangle_Direct_16sc


_ippsTriangle_Direct_16sc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x70
        ldr     r5, [sp, #0x98]
        ldr     r6, [sp, #0x94]
        cmp     r5, #0
        str     r0, [sp]
        mov     r10, r1
        mov     r11, r2
        mov     r7, r3
        beq     LANW26
        cmp     r11, #0
        ble     LANW25
        ldr     r12, [pc, #0x970]
        mov     r0, r7
        ldr     r4, [r12]
        mov     r1, r4
        bl      __ltsf2
        cmp     r0, #0
        blt     LANW23
        mov     r0, r7
        bl      __extendsfdf2
        mov     r12, #0xFE, 12
        orr     r3, r12, #3, 4
        mov     r9, r0
        mov     r8, r1
        mov     r2, #0
        bl      __gedf2
        cmp     r0, #0
        bge     LANW23
        mov     r0, r6
        bl      __extendsfdf2
        ldr     r12, [pc, #0x928]
        ldr     r2, [pc, #0x928]
        mov     r6, r0
        sub     r3, r12, #2, 2
        mov     r7, r1
        bl      __ltdf2
        cmp     r0, #0
        blt     LANW22
        ldr     r12, [pc, #0x910]
        ldr     r2, [pc, #0x908]
        mov     r0, r6
        sub     r3, r12, #1, 12
        mov     r1, r7
        bl      __gedf2
        cmp     r0, #0
        bge     LANW22
        ldr     r0, [r5]
        mov     r1, r4
        str     r0, [sp, #4]
        bl      __ltsf2
        cmp     r0, #0
        blt     LANW21
        ldr     r0, [sp, #4]
        bl      __extendsfdf2
        ldr     r3, [pc, #0x8D0]
        ldr     r2, [pc, #0x8C8]
        str     r0, [sp, #0xC]
        str     r1, [sp, #8]
        bl      __gedf2
        cmp     r0, #0
        bge     LANW21
        ldr     r12, [sp]
        cmp     r12, #0
        beq     LANW26
        cmp     r10, #0
        ble     LANW24
        ldr     r3, [pc, #0x8A0]
        ldr     r2, [pc, #0x898]
        mov     r0, r9
        mov     r1, r8
        bl      __muldf3
        str     r0, [sp, #0x68]
        str     r1, [sp, #0x64]
        mov     r0, r10
        bl      __floatsidf
        ldr     r2, [sp, #0x68]
        ldr     r3, [sp, #0x64]
        bl      __muldf3
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #8]
        bl      __adddf3
        ldr     r2, [pc, #0x868]
        ldr     r3, [pc, #0x868]
        str     r0, [sp, #0x68]
        ldr     r0, [sp, #0x68]
        mov     r4, r1
        bl      __muldf3
        bl      floor
        ldr     r2, [pc, #0x844]
        ldr     r3, [pc, #0x844]
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x68]
        mov     r3, r1
        mov     r1, r4
        bl      __subdf3
        str     r1, [sp, #0x10]
        mov     r4, r0
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        blt     LANW0
        ldr     r1, [sp, #0x10]
        ldr     r2, [pc, #0x804]
        ldr     r3, [pc, #0x804]
        mov     r0, r4
        bl      __gedf2
        cmp     r0, #0
        blt     LANW1
LANW0:
        mov     r4, #0
        str     r4, [sp, #0x10]
LANW1:
        ldr     r1, [sp, #0x10]
        mov     r0, r4
        bl      __truncdfsf2
        ldr     r12, [pc, #0x7DC]
        str     r0, [r5]
        ldr     r0, [pc, #0x7D0]
        sub     lr, r12, #1, 12
        str     lr, [sp, #0x68]
        ldr     r1, [sp, #0x68]
        add     r12, r12, #1, 12
        str     r12, [sp, #0x60]
        mov     r2, r6
        mov     r3, r7
        bl      __adddf3
        mov     r4, r0
        ldr     r0, [pc, #0x7A8]
        mov     r5, r1
        ldr     r1, [sp, #0x68]
        mov     r2, r6
        mov     r3, r7
        bl      __subdf3
        str     r0, [sp, #4]
        str     r1, [sp, #0x10]
        mov     r0, r11
        bl      __floatsidf
        ldr     r3, [sp, #0x60]
        ldr     r2, [pc, #0x77C]
        mov     r7, r0
        mov     r6, r1
        bl      __muldf3
        str     r0, [sp, #0x60]
        ldr     r0, [sp, #0x60]
        str     r1, [sp, #0x5C]
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        mov     r8, r1
        str     r0, [sp, #0x58]
        eor     r1, r8, #2, 2
        mov     r2, r4
        mov     r3, r5
        bl      __divdf3
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #0x10]
        str     r0, [sp, #0x34]
        ldr     r0, [sp, #0x58]
        str     r1, [sp, #0x38]
        mov     r1, r8
        bl      __divdf3
        ldr     r12, [sp, #0x10]
        str     r0, [sp, #0x2C]
        ldr     r0, [sp, #4]
        str     r1, [sp, #0x30]
        eor     r1, r12, #2, 2
        mov     r2, r4
        mov     r3, r5
        bl      __divdf3
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #0x10]
        str     r0, [sp, #0x28]
        str     r1, [sp, #0x24]
        eor     r1, r5, #2, 2
        mov     r0, r4
        bl      __divdf3
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #0x10]
        mov     r9, r0
        ldr     r0, [sp, #0x60]
        str     r9, [sp, #0x20]
        mov     r8, r1
        ldr     r1, [sp, #0x5C]
        str     r8, [sp, #0x1C]
        bl      __divdf3
        str     r0, [sp, #0x54]
        ldr     r0, [sp, #0x60]
        str     r1, [sp, #0x58]
        ldr     r1, [sp, #0x5C]
        mov     r2, r4
        mov     r3, r5
        bl      __divdf3
        str     r0, [sp, #0x4C]
        ldr     r0, [sp, #0x28]
        str     r1, [sp, #0x50]
        ldr     r1, [sp, #0x24]
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r7
        mov     r1, r6
        bl      __subdf3
        str     r0, [sp, #0x60]
        str     r1, [sp, #0x48]
        mov     r0, r7
        mov     r1, r6
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        mov     r2, r7
        mov     r3, r6
        bl      __subdf3
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #8]
        str     r0, [sp, #0x40]
        str     r1, [sp, #0x44]
        mov     r0, r4
        mov     r1, r5
        bl      __gtdf2
        cmp     r0, #0
        ble     LANW2
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #8]
        mov     r0, r2
        mov     r1, r3
        bl      __adddf3
        mov     r2, r4
        mov     r3, r5
        bl      __divdf3
        mov     r12, #0xFE, 12
        mov     r3, r1
        orr     r12, r12, #3, 4
        mov     r2, r0
        add     r1, r12, #1, 12
        mov     r0, #0
        bl      __subdf3
        ldr     r12, [sp, #0x34]
        str     r12, [sp, #0x14]
        ldr     r12, [sp, #0x38]
        str     r12, [sp, #0x18]
        b       LANW3
LANW2:
        ldr     r0, [sp, #0xC]
        ldr     r1, [sp, #8]
        mov     r2, r4
        mov     r3, r5
        bl      __subdf3
        mov     r2, #0
        mov     r3, #1, 2
        bl      __muldf3
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #0x10]
        bl      __divdf3
        mov     r12, #0xFF, 12
        orr     r12, r12, #3, 4
        sub     r3, r12, #2, 2
        mov     r2, #0
        bl      __adddf3
        ldr     r12, [sp, #0x2C]
        str     r12, [sp, #0x14]
        ldr     r12, [sp, #0x30]
        str     r12, [sp, #0x18]
LANW3:
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        str     r0, [sp, #0x3C]
        str     r1, [sp, #0x5C]
        ldr     r0, [pc, #0x574]
        ldr     r1, [pc, #0x574]
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        mov     r12, #0xFE, 12
        orr     r3, r12, #3, 4
        mov     r2, #0
        bl      __muldf3
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #8]
        bl      __adddf3
        ldr     r2, [pc, #0x544]
        ldr     r3, [pc, #0x544]
        mov     r8, r0
        mov     r9, r1
        bl      __gedf2
        cmp     r0, #0
        blt     LANW4
        ldr     r2, [pc, #0x528]
        ldr     r3, [pc, #0x528]
        mov     r0, r8
        mov     r1, r9
        bl      __subdf3
        mov     r8, r0
        mov     r9, r1
LANW4:
        mov     r0, r8
        mov     r1, r9
        mov     r2, r4
        mov     r3, r5
        bl      __ltdf2
        cmp     r0, #0
        bge     LANW5
        mov     r0, r8
        mov     r1, r9
        mov     r2, r8
        mov     r3, r9
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
        ldr     r9, [sp, #0x34]
        ldr     r8, [sp, #0x38]
        b       LANW6
LANW5:
        mov     r0, r8
        mov     r1, r9
        mov     r2, r4
        mov     r3, r5
        bl      __subdf3
        mov     r2, #0
        mov     r3, #1, 2
        bl      __muldf3
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #0x10]
        bl      __divdf3
        mov     r12, #0xFE, 12
        orr     r12, r12, #3, 4
        add     r12, r12, #1, 12
        sub     r3, r12, #2, 2
        mov     r2, #0
        bl      __adddf3
        ldr     r9, [sp, #0x2C]
        ldr     r8, [sp, #0x30]
LANW6:
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        mov     r5, r0
        mov     r4, r1
        ldr     r0, [sp, #0x14]
        ldr     r1, [sp, #0x18]
        mov     r2, #0
        mov     r3, #0
        bl      __gtdf2
        cmp     r0, #0
        movle   r12, #0
        strle   r12, [sp, #0x10]
        movgt   r12, #1
        strgt   r12, [sp, #0x10]
        mov     r0, r9
        mov     r1, r8
        mov     r2, #0
        mov     r3, #0
        bl      __gtdf2
        cmp     r0, #0
        movle   r12, #0
        movgt   r12, #1
        cmp     r10, #0
        ble     LANW20
        str     r8, [sp, #8]
        str     r6, [sp, #0x64]
        str     r7, [sp, #0x68]
        ldr     r7, [sp, #0x5C]
        ldr     r6, [sp, #0x3C]
        ldr     r8, [sp]
        str     r12, [sp, #4]
        str     r9, [sp, #0xC]
        str     r11, [sp, #0x6C]
LANW7:
        mov     r0, r6
        mov     r1, r7
        mov     r2, #0
        mov     r3, #0
        bl      __gtdf2
        cmp     r0, #0
        ble     LANW8
        mov     r12, #0xFE, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        mov     r2, r6
        mov     r3, r7
        bl      __adddf3
        b       LANW9
LANW8:
        mov     r0, r6
        mov     r1, r7
        mov     r12, #0xFE, 12
        orr     r3, r12, #3, 4
        mov     r2, #0
        bl      __subdf3
LANW9:
        bl      __fixdfsi
        strh    r0, [r8]
        mov     r0, r5
        mov     r1, r4
        mov     r2, #0
        mov     r3, #0
        bl      __gtdf2
        cmp     r0, #0
        ble     LANW10
        mov     r12, #0xFE, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        b       LANW11
LANW10:
        mov     r0, r5
        mov     r1, r4
        mov     r12, #0xFE, 12
        orr     r3, r12, #3, 4
        mov     r2, #0
        bl      __subdf3
LANW11:
        bl      __fixdfsi
        strh    r0, [r8, #2]
        ldr     r0, [sp, #0x14]
        ldr     r1, [sp, #0x18]
        mov     r2, r6
        mov     r3, r7
        bl      __adddf3
        ldr     r12, [sp, #0x10]
        mov     r9, r0
        mov     r11, r1
        mov     r6, r9
        cmp     r12, #0
        mov     r7, r11
        beq     LANW13
        mov     r0, r9
        mov     r1, r11
        ldr     r2, [sp, #0x68]
        ldr     r3, [sp, #0x64]
        bl      __gtdf2
        cmp     r0, #0
        ble     LANW15
        ldr     r0, [sp, #0x28]
        ldr     r1, [sp, #0x24]
        mov     r2, r9
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [sp, #0x60]
        ldr     r3, [sp, #0x48]
        bl      __adddf3
        ldr     r12, [sp, #0x6C]
        mov     r6, r0
        mov     r7, r1
        rsb     r0, r12, #0
        bl      __floatsidf
        mov     r2, r6
        mov     r3, r7
        bl      __gtdf2
        cmp     r0, #0
        ble     LANW12
        mov     r0, r9
        mov     r1, r11
        ldr     r2, [sp, #0x54]
        ldr     r3, [sp, #0x58]
        bl      __subdf3
        mov     r6, r0
        mov     r7, r1
        b       LANW15
LANW12:
        ldr     r12, [sp, #0x34]
        str     r12, [sp, #0x14]
        ldr     r12, [sp, #0x38]
        str     r12, [sp, #0x18]
        mov     r12, #0
        str     r12, [sp, #0x10]
        b       LANW15
LANW13:
        ldr     r12, [sp, #0x6C]
        rsb     r0, r12, #0
        bl      __floatsidf
        mov     r2, r9
        mov     r3, r11
        bl      __gtdf2
        cmp     r0, #0
        ble     LANW15
        ldr     r0, [sp, #0x20]
        ldr     r1, [sp, #0x1C]
        mov     r2, r9
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [sp, #0x40]
        ldr     r3, [sp, #0x44]
        bl      __adddf3
        ldr     r2, [sp, #0x68]
        ldr     r3, [sp, #0x64]
        mov     r6, r0
        mov     r7, r1
        bl      __gtdf2
        cmp     r0, #0
        ble     LANW14
        ldr     r0, [sp, #0x4C]
        ldr     r1, [sp, #0x50]
        mov     r2, r9
        mov     r3, r11
        bl      __adddf3
        mov     r6, r0
        mov     r7, r1
        b       LANW15
LANW14:
        ldr     r12, [sp, #0x2C]
        str     r12, [sp, #0x14]
        ldr     r12, [sp, #0x30]
        str     r12, [sp, #0x18]
        mov     r12, #1
        str     r12, [sp, #0x10]
LANW15:
        ldr     r0, [sp, #0xC]
        ldr     r1, [sp, #8]
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        ldr     r12, [sp, #4]
        mov     r9, r0
        mov     r11, r1
        mov     r5, r9
        cmp     r12, #0
        mov     r4, r11
        beq     LANW17
        mov     r0, r9
        mov     r1, r11
        ldr     r2, [sp, #0x68]
        ldr     r3, [sp, #0x64]
        bl      __gtdf2
        cmp     r0, #0
        ble     LANW19
        ldr     r0, [sp, #0x28]
        ldr     r1, [sp, #0x24]
        mov     r2, r9
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [sp, #0x60]
        ldr     r3, [sp, #0x48]
        bl      __adddf3
        ldr     r12, [sp, #0x6C]
        mov     r5, r0
        mov     r4, r1
        rsb     r0, r12, #0
        bl      __floatsidf
        mov     r2, r5
        mov     r3, r4
        bl      __gtdf2
        cmp     r0, #0
        ble     LANW16
        mov     r0, r9
        mov     r1, r11
        ldr     r2, [sp, #0x54]
        ldr     r3, [sp, #0x58]
        bl      __subdf3
        mov     r5, r0
        mov     r4, r1
        b       LANW19
LANW16:
        ldr     r12, [sp, #0x34]
        str     r12, [sp, #0xC]
        ldr     r12, [sp, #0x38]
        str     r12, [sp, #8]
        mov     r12, #0
        str     r12, [sp, #4]
        b       LANW19
LANW17:
        ldr     r12, [sp, #0x6C]
        rsb     r0, r12, #0
        bl      __floatsidf
        mov     r2, r9
        mov     r3, r11
        bl      __gtdf2
        cmp     r0, #0
        ble     LANW19
        ldr     r0, [sp, #0x20]
        ldr     r1, [sp, #0x1C]
        mov     r2, r9
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [sp, #0x40]
        ldr     r3, [sp, #0x44]
        bl      __adddf3
        ldr     r2, [sp, #0x68]
        ldr     r3, [sp, #0x64]
        mov     r5, r0
        mov     r4, r1
        bl      __gtdf2
        cmp     r0, #0
        ble     LANW18
        ldr     r0, [sp, #0x4C]
        ldr     r1, [sp, #0x50]
        mov     r2, r9
        mov     r3, r11
        bl      __adddf3
        mov     r5, r0
        mov     r4, r1
        b       LANW19
LANW18:
        ldr     r12, [sp, #0x2C]
        str     r12, [sp, #0xC]
        ldr     r12, [sp, #0x30]
        str     r12, [sp, #8]
        mov     r12, #1
        str     r12, [sp, #4]
LANW19:
        subs    r10, r10, #1
        add     r8, r8, #4
        bne     LANW7
LANW20:
        mov     r0, #0
        add     sp, sp, #0x70
        ldmia   sp!, {r4 - r11, pc}
LANW21:
        mvn     r0, #0x28
        add     sp, sp, #0x70
        ldmia   sp!, {r4 - r11, pc}
LANW22:
        mvn     r0, #0x27
        add     sp, sp, #0x70
        ldmia   sp!, {r4 - r11, pc}
LANW23:
        mvn     r0, #0x29
        add     sp, sp, #0x70
        ldmia   sp!, {r4 - r11, pc}
LANW24:
        mvn     r0, #5
        add     sp, sp, #0x70
        ldmia   sp!, {r4 - r11, pc}
LANW25:
        mvn     r0, #0x2A
        add     sp, sp, #0x70
        ldmia   sp!, {r4 - r11, pc}
LANW26:
        mvn     r0, #7
        add     sp, sp, #0x70
        ldmia   sp!, {r4 - r11, pc}
        .long   LANW__2il0floatpacket.1
        .long   0x400921fb
        .long   0x54442d18
        .long   0x401921fb
        .long   0x6dc9c883
        .long   0x3fc45f30


        .data
        .align  4


LANW__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


