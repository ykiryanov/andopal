        .text
        .align  4
        .globl  _ippsPolarToCart_16sc


_ippsPolarToCart_16sc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x8C
        ldr     r8, [sp, #0xB0]
        mov     r4, r2
        mov     r12, #1
        mov     r6, r0
        mov     r0, r12, lsl r4
        mov     r10, r3
        mov     r7, r1
        bl      __floatsidf
        mov     r3, r1
        mov     r12, #0xFF, 12
        mov     r2, r0
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __divdf3
        bl      __truncdfsf2
        cmp     r10, #0
        beq     LBAS8
        cmp     r6, #0
        beq     LBAS8
        cmp     r7, #0
        beq     LBAS8
        cmp     r8, #1
        blt     LBAS7
        cmp     r4, #0
        blt     LBAS7
        cmp     r4, #0xF
        bgt     LBAS7
        cmp     r8, #2
        bge     LBAS1
        cmp     r8, #0
        ble     LBAS6
        bl      __extendsfdf2
        mov     r5, r0
        mov     r4, r1
        sub     r10, r10, #2
LBAS0:
        ldrsh   r0, [r7]
        bl      __floatsidf
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        bl      cos
        ldrsh   r2, [r6]
        mov     r11, r0
        mov     r9, r1
        mov     r0, r2
        bl      __floatsidf
        mov     r2, r11
        mov     r3, r9
        bl      __muldf3
        bl      __fixdfsi
        strh    r0, [r10, #2]
        ldrsh   r0, [r7], #2
        bl      __floatsidf
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        bl      sin
        ldrsh   r2, [r6], #2
        mov     r11, r0
        mov     r9, r1
        mov     r0, r2
        bl      __floatsidf
        mov     r2, r11
        mov     r3, r9
        bl      __muldf3
        bl      __fixdfsi
        strh    r0, [r10, #4]!
        subs    r8, r8, #1
        bne     LBAS0
        mov     r0, #0
        add     sp, sp, #0x8C
        ldmia   sp!, {r4 - r11, pc}
LBAS1:
        cmp     r8, #2
        blt     LBAS5
        ldr     lr, [pc, #0x760]
        ldr     r2, [pc, #0x760]
        mov     r12, #0
        ldr     lr, [lr]
        add     r5, r7, #2
        add     r1, r6, #2
        mov     r4, r7
        mov     r11, r6
        sub     r9, r10, #2
        sub     r3, r10, #6
        str     r4, [sp, #0x2C]
        str     r5, [sp, #0x20]
        str     r3, [sp, #0x18]
        str     r9, [sp, #8]
        str     r11, [sp, #0x14]
        str     r1, [sp, #0x10]
        str     lr, [sp, #0x34]
        str     r12, [sp, #0x1C]
        str     r0, [sp, #0x28]
        str     r8, [sp, #0x30]
        str     r10, [sp, #0x38]
        str     r7, [sp, #0x3C]
        str     r6, [sp, #0x40]
LBAS2:
        ldr     r1, [sp, #0x2C]
        mvn     r11, #2, 2
        ldrsh   r0, [r1], #4
        str     r1, [sp, #0x2C]
        bl      __floatsisf
        ldr     r5, [sp, #0x28]
        mov     r1, r5
        bl      __mulsf3
        ldr     r2, [sp, #0x20]
        mov     r4, r0
        bic     r3, r4, r11
        ldrsh   r1, [r2]
        str     r3, [sp, #0x24]
        str     r4, [sp, #0x88]
        mov     r0, r1
        bl      __floatsisf
        mov     r1, r5
        bl      __mulsf3
        mov     r10, r0
        mov     r0, r4
        str     r10, [sp, #0x84]
        bl      __extendsfdf2
        ldr     r9, [pc, #0x6B4]
        ldr     r2, [pc, #0x6B4]
        mov     r5, r0
        mov     r4, r1
        mov     r3, r9
        bl      __muldf3
        bl      __fixdfsi
        mov     r8, r0
        str     r8, [sp, #4]
        mov     r0, r10
        bl      __extendsfdf2
        ldr     r2, [pc, #0x68C]
        mov     r6, r0
        mov     r7, r1
        mov     r3, r9
        bl      __muldf3
        bl      __fixdfsi
        mov     r9, r0
        str     r9, [sp]
        mov     r0, r8
        bl      __floatsidf
        ldr     r2, [pc, #0x668]
        add     r8, r2, #1, 12
        ldr     r2, [pc, #0x664]
        mov     r3, r8
        bl      __muldf3
        mov     r3, r1
        mov     r2, r0
        mov     r0, r5
        mov     r1, r4
        bl      __subdf3
        mov     r4, r0
        mov     r0, r9
        mov     r5, r1
        bl      __floatsidf
        ldr     r2, [pc, #0x634]
        mov     r3, r8
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r6
        mov     r1, r7
        bl      __subdf3
        ldr     r12, [sp, #0x24]
        mov     r6, r0
        mov     r7, r1
        bic     r11, r10, r11
        mov     r12, r12, asr #30
        add     r0, r12, #1
        bl      __floatsidf
        ldr     r2, [pc, #0x5F8]
        ldr     r3, [pc, #0x5F0]
        mov     r8, r1
        bic     r1, r5, #2, 2
        mov     r9, r0
        mov     r0, r4
        bl      __gtdf2
        ldr     r12, [sp, #0x34]
        ldr     r10, [sp, #0x20]
        mov     lr, r11, asr #30
        add     r10, r10, #4
        str     r12, [sp, #0xC]
        str     r10, [sp, #0x20]
        cmp     r0, #0
        str     r12, [sp, #0x24]
        add     r10, lr, #1
        ble     LBAS3
        ldr     r12, [pc, #0x5B0]
        ldr     r2, [pc, #0x5B0]
        mov     r0, r9
        add     r3, r12, #1, 12
        mov     r1, r8
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __subdf3
        ldr     r12, [pc, #0x580]
        mov     r4, r0
        mov     r5, r1
        ldr     r12, [r12]
        str     r12, [sp, #0xC]
LBAS3:
        mov     r0, r10
        bl      __floatsidf
        ldr     r2, [pc, #0x574]
        ldr     r3, [pc, #0x56C]
        mov     r11, r1
        bic     r1, r7, #2, 2
        mov     r10, r0
        mov     r0, r6
        bl      __gtdf2
        cmp     r0, #0
        ble     LBAS4
        ldr     r12, [pc, #0x54C]
        ldr     r2, [pc, #0x54C]
        mov     r0, r10
        add     r3, r12, #1, 12
        mov     r1, r11
        bl      __muldf3
        mov     r2, r6
        mov     r3, r7
        bl      __subdf3
        ldr     r12, [pc, #0x51C]
        mov     r6, r0
        mov     r7, r1
        ldr     r12, [r12]
        str     r12, [sp, #0x24]
LBAS4:
        mov     r0, r9
        mov     r1, r8
        ldr     r2, [pc, #0x510]
        ldr     r3, [pc, #0x508]
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __subdf3
        mov     r2, r1
        bic     r2, r2, #2, 2
        str     r2, [sp, #0x48]
        ldr     r2, [pc, #0x4EC]
        ldr     r3, [pc, #0x4E4]
        str     r0, [sp, #0x44]
        mov     r1, r11
        mov     r0, r10
        bl      __muldf3
        mov     r2, r6
        mov     r3, r7
        bl      __subdf3
        str     r0, [sp, #0x4C]
        bic     r1, r1, #2, 2
        str     r1, [sp, #0x50]
        mov     r2, r4
        mov     r0, r4
        mov     r3, r5
        mov     r1, r5
        bl      __muldf3
        mov     r11, r0
        mov     r10, r1
        mov     r2, r6
        mov     r0, r6
        mov     r3, r7
        mov     r1, r7
        bl      __muldf3
        ldr     r2, [sp, #0x44]
        str     r1, [sp, #0x58]
        ldr     r1, [sp, #0x48]
        ldr     r3, [sp, #0x48]
        str     r0, [sp, #0x54]
        mov     r0, r2
        bl      __muldf3
        ldr     r2, [sp, #0x4C]
        ldr     r3, [sp, #0x50]
        mov     r8, r1
        mov     r9, r0
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        str     r0, [sp, #0x5C]
        str     r1, [sp, #0x60]
        mov     r2, r4
        mov     r3, r5
        mov     r0, r11
        mov     r1, r10
        bl      __muldf3
        str     r0, [sp, #0x64]
        ldr     r0, [pc, #0x438]
        str     r1, [sp, #0x68]
        ldr     r1, [pc, #0x434]
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [pc, #0x428]
        ldr     r3, [pc, #0x428]
        bl      __adddf3
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [pc, #0x418]
        ldr     r3, [pc, #0x418]
        bl      __adddf3
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldr     r10, [pc, #0x408]
        ldr     r2, [pc, #0x408]
        mov     r3, r10
        bl      __adddf3
        ldr     r2, [sp, #0x64]
        ldr     r3, [sp, #0x68]
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        str     r0, [sp, #0x68]
        ldr     r0, [sp, #0x54]
        str     r1, [sp, #0x64]
        ldr     r1, [sp, #0x58]
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        ldr     r2, [sp, #0x54]
        ldr     r3, [sp, #0x58]
        str     r0, [sp, #0x6C]
        ldr     r0, [pc, #0x3A0]
        str     r1, [sp, #0x70]
        ldr     r1, [pc, #0x39C]
        bl      __muldf3
        ldr     r2, [pc, #0x398]
        ldr     r3, [pc, #0x398]
        bl      __adddf3
        ldr     r2, [sp, #0x54]
        ldr     r3, [sp, #0x58]
        bl      __muldf3
        ldr     r2, [pc, #0x388]
        ldr     r3, [pc, #0x388]
        bl      __adddf3
        ldr     r2, [sp, #0x54]
        ldr     r3, [sp, #0x58]
        bl      __muldf3
        ldr     r2, [pc, #0x37C]
        mov     r3, r10
        bl      __adddf3
        ldr     r2, [sp, #0x6C]
        ldr     r3, [sp, #0x70]
        bl      __muldf3
        mov     r2, r6
        mov     r3, r7
        bl      __adddf3
        ldr     r2, [sp, #0x44]
        ldr     r3, [sp, #0x48]
        str     r1, [sp, #0x70]
        str     r0, [sp, #0x6C]
        mov     r1, r8
        mov     r0, r9
        bl      __muldf3
        mov     r4, r0
        ldr     r0, [pc, #0x31C]
        mov     r5, r1
        ldr     r1, [pc, #0x318]
        mov     r3, r8
        mov     r2, r9
        bl      __muldf3
        ldr     r2, [pc, #0x30C]
        ldr     r3, [pc, #0x30C]
        bl      __adddf3
        mov     r3, r8
        mov     r2, r9
        bl      __muldf3
        ldr     r2, [pc, #0x2FC]
        ldr     r3, [pc, #0x2FC]
        bl      __adddf3
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [pc, #0x2F0]
        mov     r3, r10
        bl      __adddf3
        mov     r3, r5
        mov     r2, r4
        bl      __muldf3
        ldr     r2, [sp, #0x44]
        ldr     r3, [sp, #0x48]
        bl      __adddf3
        mov     r5, r0
        mov     r4, r1
        ldr     r2, [sp, #0x4C]
        ldr     r3, [sp, #0x50]
        ldr     r0, [sp, #0x5C]
        ldr     r1, [sp, #0x60]
        bl      __muldf3
        mov     r7, r1
        ldr     r1, [pc, #0x294]
        ldr     r2, [sp, #0x5C]
        ldr     r3, [sp, #0x60]
        mov     r6, r0
        ldr     r0, [pc, #0x280]
        bl      __muldf3
        ldr     r2, [pc, #0x280]
        ldr     r3, [pc, #0x280]
        bl      __adddf3
        ldr     r2, [sp, #0x5C]
        ldr     r3, [sp, #0x60]
        bl      __muldf3
        ldr     r2, [pc, #0x270]
        ldr     r3, [pc, #0x270]
        bl      __adddf3
        ldr     r2, [sp, #0x5C]
        ldr     r3, [sp, #0x60]
        bl      __muldf3
        ldr     r2, [pc, #0x264]
        mov     r3, r10
        bl      __adddf3
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        ldr     r2, [sp, #0x4C]
        ldr     r3, [sp, #0x50]
        bl      __adddf3
        mov     r6, r1
        ldr     r1, [sp, #0x64]
        mov     r7, r0
        ldr     r0, [sp, #0x68]
        bl      __truncdfsf2
        mov     r2, r0
        ldr     r1, [sp, #0x70]
        ldr     r0, [sp, #0x6C]
        str     r2, [sp, #0x80]
        bl      __truncdfsf2
        str     r0, [sp, #0x7C]
        mov     r0, r5
        mov     r1, r4
        bl      __truncdfsf2
        mov     r1, r0
        str     r1, [sp, #0x78]
        mov     r1, r6
        mov     r0, r7
        bl      __truncdfsf2
        ldr     r8, [sp, #0x7C]
        ldr     r4, [sp, #0x14]
        ldr     r5, [sp]
        ldr     r6, [sp, #0x80]
        ldr     r3, [sp, #0x78]
        ldrsh   r1, [r4]
        eor     r8, r8, r5, lsl #31
        str     r8, [sp, #0x7C]
        ldr     r7, [sp, #4]
        eor     r5, r0, r5, lsl #31
        eor     r6, r6, r7, lsl #31
        str     r6, [sp, #0x80]
        eor     r7, r3, r7, lsl #31
        str     r7, [sp, #0x78]
        str     r5, [sp, #0x74]
        mov     r0, r1
        bl      __floatsisf
        ldr     r1, [sp, #0x78]
        bl      __mulsf3
        ldr     r1, [sp, #0xC]
        bl      __mulsf3
        bl      __fixsfsi
        ldr     r6, [sp, #0x18]
        strh    r0, [r6, #6]
        ldrsh   r0, [r4], #4
        ldr     r1, [sp, #0x1C]
        str     r4, [sp, #0x14]
        add     r4, r1, #2
        str     r4, [sp, #0x1C]
        bl      __floatsisf
        ldr     r2, [sp, #0x30]
        ldr     r1, [sp, #0x80]
        sub     r4, r2, r4
        bl      __mulsf3
        bl      __fixsfsi
        strh    r0, [r6, #8]!
        ldr     r5, [sp, #0x10]
        ldrsh   r0, [r5]
        str     r6, [sp, #0x18]
        bl      __floatsisf
        ldr     r1, [sp, #0x74]
        bl      __mulsf3
        ldr     r1, [sp, #0x24]
        bl      __mulsf3
        bl      __fixsfsi
        ldr     r6, [sp, #8]
        strh    r0, [r6, #6]
        ldrsh   r0, [r5], #4
        str     r5, [sp, #0x10]
        bl      __floatsisf
        ldr     r1, [sp, #0x7C]
        bl      __mulsf3
        bl      __fixsfsi
        strh    r0, [r6, #8]!
        cmp     r4, #2
        str     r6, [sp, #8]
        bge     LBAS2
        ldr     r0, [sp, #0x28]
        ldr     r8, [sp, #0x30]
        ldr     r10, [sp, #0x38]
        ldr     r7, [sp, #0x3C]
        ldr     r6, [sp, #0x40]
LBAS5:
        tst     r8, #1
        beq     LBAS6
        bl      __extendsfdf2
        sub     r7, r7, #2
        mov     r4, r0
        mov     r9, r8, lsl #1
        ldrsh   r0, [r7, +r9]
        mov     r5, r1
        sub     r10, r10, #4
        bl      __floatsidf
        sub     r6, r6, #2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        mov     r8, r8, lsl #2
        bl      cos
        ldrsh   r2, [r6, +r9]
        str     r0, [sp, #0x70]
        mov     r0, r2
        mov     r11, r1
        bl      __floatsidf
        ldr     r2, [sp, #0x70]
        mov     r3, r11
        bl      __muldf3
        bl      __fixdfsi
        strh    r0, [r10, +r8]
        ldrsh   r0, [r7, +r9]
        add     r8, r10, r8
        bl      __floatsidf
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      sin
        ldrsh   r9, [r6, +r9]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r9
        bl      __floatsidf
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __fixdfsi
        strh    r0, [r8, #2]
LBAS6:
        mov     r0, #0
        add     sp, sp, #0x8C
        ldmia   sp!, {r4 - r11, pc}
LBAS7:
        mvn     r0, #5
        add     sp, sp, #0x8C
        ldmia   sp!, {r4 - r11, pc}
LBAS8:
        mvn     r0, #7
        add     sp, sp, #0x8C
        ldmia   sp!, {r4 - r11, pc}
        .long   LBAS__2il0floatpacket.1
        .long   LBAS__2il0floatpacket.2
        .long   0x3fd45f30
        .long   0x6dc9c883
        .long   0x3ff921fb
        .long   0x54442d18
        .long   0x6ebfd6d5
        .long   0x3ec60ff4
        .long   0x1214276e
        .long   0xbf29fab6
        .long   0x488b3d01
        .long   0x3f811101
        .long   0xbfc55555
        .long   0x339212a2


        .data
        .align  4


LBAS__2il0floatpacket.1:
        .byte   0x00,0x00,0x80,0x3F
LBAS__2il0floatpacket.2:
        .byte   0x00,0x00,0x80,0xBF


