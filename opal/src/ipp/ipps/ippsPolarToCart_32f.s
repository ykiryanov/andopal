        .text
        .align  4
        .globl  _ippsPolarToCart_32f


_ippsPolarToCart_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x94
        ldr     r8, [sp, #0xB8]
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        mov     r7, r2
        mov     r6, r3
        beq     LBAR8
        cmp     r4, #0
        beq     LBAR8
        cmp     r7, #0
        beq     LBAR8
        cmp     r6, #0
        beq     LBAR8
        cmp     r8, #1
        blt     LBAR7
        cmp     r8, #2
        bge     LBAR1
        cmp     r8, #0
        ble     LBAR6
LBAR0:
        ldr     r0, [r4]
        bl      __extendsfdf2
        bl      sin
        ldr     r9, [r5]
        bl      __truncdfsf2
        mov     r1, r9
        bl      __mulsf3
        str     r0, [r6], #4
        ldr     r0, [r4], #4
        bl      __extendsfdf2
        bl      cos
        ldr     r9, [r5], #4
        bl      __truncdfsf2
        mov     r1, r9
        bl      __mulsf3
        str     r0, [r7], #4
        subs    r8, r8, #1
        bne     LBAR0
        mov     r0, #0
        add     sp, sp, #0x94
        ldmia   sp!, {r4 - r11, pc}
LBAR1:
        cmp     r8, #2
        blt     LBAR5
        ldr     r12, [pc, #0x6C4]
        mov     lr, #0
        add     r9, r4, #4
        ldr     r12, [r12]
        str     r9, [sp, #0x48]
        add     r2, r6, #4
        add     r1, r5, #4
        add     r0, r7, #4
        mov     r11, r5
        mov     r10, r6
        mov     r9, r7
        mov     r3, r4
        str     r3, [sp, #0x28]
        str     r9, [sp, #0x18]
        str     r10, [sp, #0x1C]
        str     r11, [sp, #0xC]
        str     r0, [sp, #0x20]
        str     r1, [sp, #8]
        str     r2, [sp, #0x2C]
        str     r12, [sp, #0x30]
        str     lr, [sp, #0x14]
        str     r8, [sp, #0x34]
        str     r6, [sp, #0x38]
        str     r7, [sp, #0x3C]
        str     r4, [sp, #0x40]
        str     r5, [sp, #0x44]
LBAR2:
        ldr     r3, [sp, #0x28]
        ldr     r0, [sp, #0x48]
        mvn     r9, #2, 2
        ldr     r11, [r3], #8
        ldr     r8, [r0]
        str     r3, [sp, #0x28]
        str     r11, [sp, #0x90]
        mov     r0, r11
        str     r8, [sp, #0x8C]
        bl      __extendsfdf2
        ldr     r2, [pc, #0x638]
        ldr     r3, [pc, #0x638]
        mov     r6, r0
        mov     r4, r1
        bl      __muldf3
        bl      __fixdfsi
        mov     r10, r0
        str     r10, [sp, #4]
        mov     r0, r8
        bl      __extendsfdf2
        ldr     r2, [pc, #0x610]
        ldr     r3, [pc, #0x610]
        mov     r5, r0
        mov     r7, r1
        bl      __muldf3
        bl      __fixdfsi
        str     r0, [sp]
        mov     r0, r10
        bl      __floatsidf
        ldr     r2, [pc, #0x5F4]
        add     r10, r2, #1, 12
        ldr     r2, [pc, #0x5F0]
        mov     r3, r10
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r6
        mov     r1, r4
        bl      __subdf3
        mov     r4, r0
        ldr     r0, [sp]
        mov     r6, r1
        bic     r11, r11, r9
        bic     r9, r8, r9
        bl      __floatsidf
        ldr     r2, [pc, #0x5B8]
        mov     r3, r10
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r5
        mov     r1, r7
        bl      __subdf3
        mov     r11, r11, asr #30
        mov     r5, r0
        add     r0, r11, #1
        mov     r7, r1
        bl      __floatsidf
        ldr     r2, [pc, #0x584]
        ldr     r3, [pc, #0x57C]
        mov     r11, r1
        bic     r1, r6, #2, 2
        mov     r10, r0
        mov     r0, r4
        bl      __gtdf2
        ldr     r12, [sp, #0x30]
        ldr     r8, [sp, #0x48]
        mov     lr, r9, asr #30
        add     r8, r8, #8
        str     r12, [sp, #0x10]
        str     r8, [sp, #0x48]
        cmp     r0, #0
        str     r12, [sp, #0x24]
        add     r8, lr, #1
        ble     LBAR3
        ldr     r12, [pc, #0x53C]
        ldr     r2, [pc, #0x53C]
        mov     r0, r10
        add     r3, r12, #1, 12
        mov     r1, r11
        bl      __muldf3
        mov     r2, r4
        mov     r3, r6
        bl      __subdf3
        ldr     r12, [pc, #0x520]
        mov     r4, r0
        mov     r6, r1
        ldr     r12, [r12]
        str     r12, [sp, #0x10]
LBAR3:
        mov     r0, r8
        bl      __floatsidf
        ldr     r2, [pc, #0x500]
        ldr     r3, [pc, #0x4F8]
        mov     r9, r1
        bic     r1, r7, #2, 2
        mov     r8, r0
        mov     r0, r5
        bl      __gtdf2
        cmp     r0, #0
        ble     LBAR4
        ldr     r12, [pc, #0x4D8]
        ldr     r2, [pc, #0x4D8]
        mov     r0, r8
        add     r3, r12, #1, 12
        mov     r1, r9
        bl      __muldf3
        mov     r2, r5
        mov     r3, r7
        bl      __subdf3
        ldr     r12, [pc, #0x4BC]
        mov     r5, r0
        mov     r7, r1
        ldr     r12, [r12]
        str     r12, [sp, #0x24]
LBAR4:
        mov     r0, r10
        ldr     r2, [pc, #0x4A0]
        ldr     r3, [pc, #0x498]
        mov     r1, r11
        bl      __muldf3
        mov     r2, r4
        mov     r3, r6
        bl      __subdf3
        ldr     r2, [pc, #0x484]
        ldr     r3, [pc, #0x47C]
        str     r0, [sp, #0x4C]
        mov     r10, r1
        mov     r0, r8
        mov     r1, r9
        bl      __muldf3
        mov     r2, r5
        mov     r3, r7
        bl      __subdf3
        str     r0, [sp, #0x50]
        bic     r1, r1, #2, 2
        str     r1, [sp, #0x54]
        mov     r2, r4
        mov     r3, r6
        mov     r0, r4
        mov     r1, r6
        bl      __muldf3
        mov     r9, r0
        mov     r8, r1
        mov     r0, r5
        mov     r1, r7
        mov     r2, r5
        mov     r3, r7
        bl      __muldf3
        bic     r10, r10, #2, 2
        ldr     r2, [sp, #0x4C]
        str     r1, [sp, #0x60]
        str     r10, [sp, #0x58]
        ldr     r1, [sp, #0x58]
        ldr     r3, [sp, #0x58]
        str     r0, [sp, #0x5C]
        mov     r0, r2
        bl      __muldf3
        ldr     r2, [sp, #0x50]
        ldr     r3, [sp, #0x54]
        str     r1, [sp, #0x68]
        ldr     r1, [sp, #0x54]
        str     r0, [sp, #0x64]
        mov     r0, r2
        bl      __muldf3
        mov     r10, r0
        mov     r11, r1
        mov     r1, r8
        mov     r2, r4
        mov     r0, r9
        mov     r3, r6
        bl      __muldf3
        str     r0, [sp, #0x6C]
        ldr     r0, [pc, #0x3C8]
        str     r1, [sp, #0x70]
        ldr     r1, [pc, #0x3C4]
        mov     r3, r8
        mov     r2, r9
        bl      __muldf3
        ldr     r2, [pc, #0x3B8]
        ldr     r3, [pc, #0x3B8]
        bl      __adddf3
        mov     r3, r8
        mov     r2, r9
        bl      __muldf3
        ldr     r2, [pc, #0x3A8]
        ldr     r3, [pc, #0x3A8]
        bl      __adddf3
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        ldr     r9, [pc, #0x398]
        ldr     r8, [pc, #0x398]
        mov     r3, r9
        mov     r2, r8
        bl      __adddf3
        ldr     r2, [sp, #0x6C]
        ldr     r3, [sp, #0x70]
        bl      __muldf3
        mov     r2, r4
        mov     r3, r6
        bl      __adddf3
        str     r0, [sp, #0x70]
        str     r1, [sp, #0x6C]
        ldr     r0, [sp, #0x5C]
        ldr     r1, [sp, #0x60]
        mov     r2, r5
        mov     r3, r7
        bl      __muldf3
        ldr     r2, [sp, #0x5C]
        ldr     r3, [sp, #0x60]
        str     r0, [sp, #0x74]
        ldr     r0, [pc, #0x32C]
        str     r1, [sp, #0x78]
        ldr     r1, [pc, #0x328]
        bl      __muldf3
        ldr     r2, [pc, #0x324]
        ldr     r3, [pc, #0x324]
        bl      __adddf3
        ldr     r2, [sp, #0x5C]
        ldr     r3, [sp, #0x60]
        bl      __muldf3
        ldr     r2, [pc, #0x314]
        ldr     r3, [pc, #0x314]
        bl      __adddf3
        ldr     r2, [sp, #0x5C]
        ldr     r3, [sp, #0x60]
        bl      __muldf3
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        ldr     r2, [sp, #0x74]
        ldr     r3, [sp, #0x78]
        bl      __muldf3
        mov     r3, r7
        mov     r2, r5
        bl      __adddf3
        str     r0, [sp, #0x78]
        str     r1, [sp, #0x74]
        ldr     r0, [sp, #0x64]
        ldr     r1, [sp, #0x68]
        ldr     r2, [sp, #0x4C]
        ldr     r3, [sp, #0x58]
        bl      __muldf3
        mov     r4, r0
        ldr     r0, [pc, #0x2A8]
        ldr     r2, [sp, #0x64]
        ldr     r3, [sp, #0x68]
        mov     r5, r1
        ldr     r1, [pc, #0x29C]
        bl      __muldf3
        ldr     r2, [pc, #0x298]
        ldr     r3, [pc, #0x298]
        bl      __adddf3
        ldr     r2, [sp, #0x64]
        ldr     r3, [sp, #0x68]
        bl      __muldf3
        ldr     r2, [pc, #0x288]
        ldr     r3, [pc, #0x288]
        bl      __adddf3
        ldr     r2, [sp, #0x64]
        ldr     r3, [sp, #0x68]
        bl      __muldf3
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [sp, #0x4C]
        ldr     r3, [sp, #0x58]
        bl      __adddf3
        ldr     r2, [sp, #0x50]
        ldr     r3, [sp, #0x54]
        mov     r6, r1
        mov     r7, r0
        mov     r0, r10
        mov     r1, r11
        bl      __muldf3
        mov     r4, r0
        ldr     r0, [pc, #0x21C]
        mov     r5, r1
        ldr     r1, [pc, #0x218]
        mov     r2, r10
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [pc, #0x20C]
        ldr     r3, [pc, #0x20C]
        bl      __adddf3
        mov     r2, r10
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [pc, #0x1FC]
        ldr     r3, [pc, #0x1FC]
        bl      __adddf3
        mov     r2, r10
        mov     r3, r11
        bl      __muldf3
        mov     r3, r9
        mov     r2, r8
        bl      __adddf3
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [sp, #0x50]
        ldr     r3, [sp, #0x54]
        bl      __adddf3
        mov     r5, r1
        mov     r4, r0
        ldr     r1, [sp, #0x6C]
        ldr     r0, [sp, #0x70]
        bl      __truncdfsf2
        ldr     r1, [sp, #0x74]
        mov     r2, r0
        ldr     r0, [sp, #0x78]
        str     r2, [sp, #0x88]
        bl      __truncdfsf2
        str     r0, [sp, #0x84]
        mov     r0, r7
        mov     r1, r6
        bl      __truncdfsf2
        str     r0, [sp, #0x80]
        mov     r1, r5
        mov     r0, r4
        bl      __truncdfsf2
        ldr     r1, [sp, #0x88]
        ldr     r12, [sp, #0x80]
        ldr     r7, [sp, #0x84]
        ldr     r4, [sp, #0xC]
        ldr     r6, [sp, #4]
        eor     r1, r1, r6, lsl #31
        ldr     r2, [r4]
        str     r1, [sp, #0x88]
        ldr     r8, [sp]
        eor     r6, r12, r6, lsl #31
        str     r6, [sp, #0x80]
        eor     r7, r7, r8, lsl #31
        eor     r8, r0, r8, lsl #31
        str     r7, [sp, #0x84]
        str     r8, [sp, #0x7C]
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [sp, #0x80]
        ldr     r2, [sp, #0x1C]
        str     r0, [r2], #8
        ldr     r0, [r4], #8
        str     r2, [sp, #0x1C]
        bl      __mulsf3
        ldr     r1, [sp, #0x10]
        bl      __mulsf3
        ldr     r2, [sp, #0x18]
        ldr     r1, [sp, #0x84]
        str     r0, [r2], #8
        ldr     r5, [sp, #8]
        ldr     r0, [r5]
        str     r2, [sp, #0x18]
        str     r4, [sp, #0xC]
        bl      __mulsf3
        ldr     r2, [sp, #0x2C]
        ldr     r1, [sp, #0x7C]
        str     r0, [r2], #8
        ldr     r0, [r5], #8
        str     r2, [sp, #0x2C]
        str     r5, [sp, #8]
        bl      __mulsf3
        ldr     r1, [sp, #0x24]
        bl      __mulsf3
        ldr     r1, [sp, #0x14]
        ldr     r2, [sp, #0x34]
        add     r1, r1, #2
        str     r1, [sp, #0x14]
        sub     r1, r2, r1
        ldr     r2, [sp, #0x20]
        cmp     r1, #2
        str     r0, [r2], #8
        str     r2, [sp, #0x20]
        bge     LBAR2
        ldr     r8, [sp, #0x34]
        ldr     r6, [sp, #0x38]
        ldr     r7, [sp, #0x3C]
        ldr     r4, [sp, #0x40]
        ldr     r5, [sp, #0x44]
LBAR5:
        tst     r8, #1
        beq     LBAR6
        sub     r4, r4, #4
        ldr     r0, [r4, +r8, lsl #2]
        sub     r5, r5, #4
        sub     r6, r6, #4
        bl      __extendsfdf2
        bl      sin
        bl      __truncdfsf2
        ldr     r1, [r5, +r8, lsl #2]
        bl      __mulsf3
        str     r0, [r6, +r8, lsl #2]
        ldr     r0, [r4, +r8, lsl #2]
        sub     r7, r7, #4
        bl      __extendsfdf2
        bl      cos
        bl      __truncdfsf2
        ldr     r1, [r5, +r8, lsl #2]
        bl      __mulsf3
        str     r0, [r7, +r8, lsl #2]
LBAR6:
        mov     r0, #0
        add     sp, sp, #0x94
        ldmia   sp!, {r4 - r11, pc}
LBAR7:
        mvn     r0, #5
        add     sp, sp, #0x94
        ldmia   sp!, {r4 - r11, pc}
LBAR8:
        mvn     r0, #7
        add     sp, sp, #0x94
        ldmia   sp!, {r4 - r11, pc}
        .long   LBAR__2il0floatpacket.1
        .long   0x6dc9c883
        .long   0x3fd45f30
        .long   0x3ff921fb
        .long   0x54442d18
        .long   LBAR__2il0floatpacket.2
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


LBAR__2il0floatpacket.1:
        .byte   0x00,0x00,0x80,0x3F
LBAR__2il0floatpacket.2:
        .byte   0x00,0x00,0x80,0xBF


