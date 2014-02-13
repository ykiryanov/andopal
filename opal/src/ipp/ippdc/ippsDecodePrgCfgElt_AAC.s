        .text
        .align  4
        .globl  _ippsDecodePrgCfgElt_AAC


_ippsDecodePrgCfgElt_AAC:
        stmdb   sp!, {r4 - r9, lr}
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        mov     r6, r2
        beq     LGFJ19
        cmp     r4, #0
        beq     LGFJ19
        cmp     r6, #0
        beq     LGFJ19
        ldr     r3, [r5]
        cmp     r3, #0
        beq     LGFJ19
        ldr     r3, [r4]
        cmp     r3, #0
        blt     LGFJ0
        cmp     r3, #7
        ble     LGFJ1
LGFJ0:
        mvn     r0, #0x94
        ldmia   sp!, {r4 - r9, pc}
LGFJ1:
        mov     r2, #4
        mov     r1, r4
        mov     r0, r5
        bl      ownsGetBits_AAC
        str     r0, [r6]
        mov     r2, #2
        mov     r1, r4
        mov     r0, r5
        bl      ownsGetBits_AAC
        str     r0, [r6, #4]
        mov     r0, r5
        mov     r2, #4
        mov     r1, r4
        bl      ownsGetBits_AAC
        str     r0, [r6, #8]
        mov     r0, r5
        mov     r2, #4
        mov     r1, r4
        bl      ownsGetBits_AAC
        str     r0, [r6, #0xC]
        mov     r2, #4
        mov     r1, r4
        mov     r0, r5
        bl      ownsGetBits_AAC
        str     r0, [r6, #0x10]
        mov     r2, #4
        mov     r1, r4
        mov     r0, r5
        bl      ownsGetBits_AAC
        str     r0, [r6, #0x14]
        mov     r0, r5
        mov     r2, #2
        mov     r1, r4
        bl      ownsGetBits_AAC
        str     r0, [r6, #0x18]
        mov     r0, r5
        mov     r2, #3
        mov     r1, r4
        bl      ownsGetBits_AAC
        str     r0, [r6, #0x1C]
        mov     r0, r5
        mov     r2, #4
        mov     r1, r4
        bl      ownsGetBits_AAC
        str     r0, [r6, #0x20]
        mov     r7, #0
        str     r7, [r6, #0x28]
        str     r7, [r6, #0x30]
        str     r7, [r6, #0x38]
        str     r7, [r6, #0x3C]
        mov     r0, r5
        mov     r2, #1
        mov     r1, r4
        bl      ownsGetBits_AAC
        cmp     r0, #0
        str     r0, [r6, #0x24]
        beq     LGFJ2
        mov     r0, r5
        mov     r1, r4
        mov     r2, #4
        bl      ownsGetBits_AAC
        str     r0, [r6, #0x28]
LGFJ2:
        mov     r0, r5
        mov     r1, r4
        mov     r2, #1
        bl      ownsGetBits_AAC
        cmp     r0, #0
        str     r0, [r6, #0x2C]
        beq     LGFJ3
        mov     r0, r5
        mov     r1, r4
        mov     r2, #4
        bl      ownsGetBits_AAC
        str     r0, [r6, #0x30]
LGFJ3:
        mov     r0, r5
        mov     r1, r4
        mov     r2, #1
        bl      ownsGetBits_AAC
        cmp     r0, #0
        str     r0, [r6, #0x34]
        beq     LGFJ4
        mov     r0, r5
        mov     r1, r4
        mov     r2, #2
        bl      ownsGetBits_AAC
        str     r0, [r6, #0x38]
        mov     r0, r5
        mov     r2, #1
        mov     r1, r4
        bl      ownsGetBits_AAC
        str     r0, [r6, #0x3C]
LGFJ4:
        ldr     r3, [r6, #0xC]
        cmp     r3, #0
        ble     LGFJ6
        mov     r9, r7
        add     r8, r6, #0x7C
LGFJ5:
        mov     r0, r5
        mov     r1, r4
        mov     r2, #1
        bl      ownsGetBits_AAC
        str     r0, [r8, #-0x3C]
        mov     r0, r5
        mov     r2, #4
        mov     r1, r4
        bl      ownsGetBits_AAC
        str     r0, [r8, #4]!
        ldr     r3, [r6, #0xC]
        add     r9, r9, #1
        cmp     r9, r3
        blt     LGFJ5
LGFJ6:
        ldr     r3, [r6, #0x10]
        cmp     r3, #0
        ble     LGFJ8
        mov     r9, r7
        add     r8, r6, #0xFC
LGFJ7:
        mov     r0, r5
        mov     r1, r4
        mov     r2, #1
        bl      ownsGetBits_AAC
        str     r0, [r8, #-0x3C]
        mov     r0, r5
        mov     r2, #4
        mov     r1, r4
        bl      ownsGetBits_AAC
        str     r0, [r8, #4]!
        ldr     r3, [r6, #0x10]
        add     r9, r9, #1
        cmp     r9, r3
        blt     LGFJ7
LGFJ8:
        ldr     r3, [r6, #0x14]
        cmp     r3, #0
        ble     LGFJ10
        mov     r9, r7
        add     r8, r6, #0x5F, 30
LGFJ9:
        mov     r0, r5
        mov     r1, r4
        mov     r2, #1
        bl      ownsGetBits_AAC
        str     r0, [r8, #-0x3C]
        mov     r0, r5
        mov     r2, #4
        mov     r1, r4
        bl      ownsGetBits_AAC
        str     r0, [r8, #4]!
        ldr     r3, [r6, #0x14]
        add     r9, r9, #1
        cmp     r9, r3
        blt     LGFJ9
LGFJ10:
        ldr     r3, [r6, #0x18]
        cmp     r3, #0
        ble     LGFJ12
        mov     r8, r7
        add     r9, r6, #0x6F, 30
LGFJ11:
        mov     r0, r5
        mov     r1, r4
        mov     r2, #4
        bl      ownsGetBits_AAC
        str     r0, [r9, #4]!
        ldr     r3, [r6, #0x18]
        add     r8, r8, #1
        cmp     r8, r3
        blt     LGFJ11
LGFJ12:
        ldr     r3, [r6, #0x1C]
        cmp     r3, #0
        ble     LGFJ14
        mov     r9, r7
        add     r8, r6, #0x73, 30
LGFJ13:
        mov     r0, r5
        mov     r1, r4
        mov     r2, #4
        bl      ownsGetBits_AAC
        str     r0, [r8, #4]!
        ldr     r3, [r6, #0x1C]
        add     r9, r9, #1
        cmp     r9, r3
        blt     LGFJ13
LGFJ14:
        ldr     r3, [r6, #0x20]
        cmp     r3, #0
        ble     LGFJ16
        mov     r9, r7
        add     r8, r6, #0x8B, 30
LGFJ15:
        mov     r0, r5
        mov     r1, r4
        mov     r2, #1
        bl      ownsGetBits_AAC
        str     r0, [r8, #-0x3C]
        mov     r0, r5
        mov     r2, #4
        mov     r1, r4
        bl      ownsGetBits_AAC
        str     r0, [r8, #4]!
        ldr     r3, [r6, #0x20]
        add     r9, r9, #1
        cmp     r9, r3
        blt     LGFJ15
LGFJ16:
        mov     r0, r5
        mov     r1, r4
        bl      ownsByteAlign_AAC
        mov     r0, r5
        mov     r2, #8
        mov     r1, r4
        bl      ownsGetBits_AAC
        cmp     r0, #0
        str     r0, [r6, #0x270]
        ble     LGFJ18
        mov     r3, #0x73
        orr     r3, r3, #2, 24
        add     r8, r6, r3
LGFJ17:
        mov     r0, r5
        mov     r1, r4
        mov     r2, #8
        bl      ownsGetBits_AAC
        strb    r0, [r8, #1]!
        ldr     r3, [r6, #0x270]
        add     r7, r7, #1
        cmp     r7, r3
        blt     LGFJ17
LGFJ18:
        mov     r0, #0
        ldmia   sp!, {r4 - r9, pc}
LGFJ19:
        mvn     r0, #7
        ldmia   sp!, {r4 - r9, pc}


