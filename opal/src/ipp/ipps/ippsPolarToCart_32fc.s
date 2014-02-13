        .text
        .align  4
        .globl  _ippsPolarToCart_32fc


_ippsPolarToCart_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x88
        cmp     r2, #0
        mov     r5, r0
        mov     r6, r1
        mov     r4, r3
        beq     LBAQ8
        cmp     r5, #0
        beq     LBAQ8
        cmp     r6, #0
        beq     LBAQ8
        cmp     r4, #1
        blt     LBAQ7
        cmp     r4, #2
        mov     r7, #0
        blt     LBAQ4
        cmp     r4, #2
        blt     LBAQ3
        ldr     lr, [pc, #0x6FC]
        ldr     r12, [pc, #0x6FC]
        add     r9, r6, #4
        ldr     lr, [lr]
        add     r0, r5, #4
        mov     r11, r5
        mov     r8, r6
        sub     r10, r2, #4
        sub     r1, r2, #0xC
        str     r8, [sp, #0x14]
        str     r9, [sp, #0x1C]
        str     r1, [sp, #0x20]
        str     r10, [sp, #0x38]
        str     r11, [sp, #0x2C]
        str     r0, [sp, #0x28]
        str     lr, [sp, #0xC]
        str     r7, [sp, #0x24]
        str     r4, [sp, #0x10]
        str     r2, [sp, #8]
        str     r6, [sp, #4]
        str     r5, [sp]
LBAQ0:
        ldr     r0, [sp, #0xC]
        ldr     r3, [sp, #0x14]
        mvn     r7, #2, 2
        str     r0, [sp, #0x30]
        ldr     r0, [sp, #0x1C]
        ldr     r11, [r3], #8
        ldr     r6, [r0]
        str     r3, [sp, #0x14]
        str     r11, [sp, #0x84]
        mov     r0, r11
        str     r6, [sp, #0x80]
        bl      __extendsfdf2
        ldr     r2, [pc, #0x680]
        ldr     r3, [pc, #0x680]
        mov     r4, r1
        mov     r5, r0
        bl      __muldf3
        bl      __fixdfsi
        mov     r10, r0
        str     r10, [sp, #0x34]
        mov     r0, r6
        bl      __extendsfdf2
        ldr     r2, [pc, #0x658]
        ldr     r3, [pc, #0x658]
        mov     r8, r0
        mov     r9, r1
        bl      __muldf3
        bl      __fixdfsi
        str     r0, [sp, #0x3C]
        mov     r0, r10
        bl      __floatsidf
        ldr     r2, [pc, #0x63C]
        add     r10, r2, #1, 12
        ldr     r2, [pc, #0x638]
        mov     r3, r10
        bl      __muldf3
        mov     r3, r1
        mov     r2, r0
        mov     r1, r4
        mov     r0, r5
        bl      __subdf3
        mov     r4, r0
        ldr     r0, [sp, #0x3C]
        mov     r5, r1
        bic     r11, r11, r7
        bic     r7, r6, r7
        bl      __floatsidf
        ldr     r2, [pc, #0x600]
        mov     r3, r10
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r8
        mov     r1, r9
        bl      __subdf3
        mov     r11, r11, asr #30
        mov     r8, r0
        add     r0, r11, #1
        mov     r9, r1
        bl      __floatsidf
        ldr     r2, [pc, #0x5CC]
        ldr     r3, [pc, #0x5C4]
        mov     r10, r1
        bic     r1, r5, #2, 2
        mov     r11, r0
        mov     r0, r4
        bl      __gtdf2
        ldr     lr, [sp, #0x1C]
        cmp     r0, #0
        mov     r12, r7, asr #30
        add     lr, lr, #8
        str     lr, [sp, #0x1C]
        ldr     lr, [sp, #0x30]
        add     r6, r12, #1
        str     lr, [sp, #0x18]
        ble     LBAQ1
        ldr     r12, [pc, #0x588]
        ldr     r2, [pc, #0x588]
        mov     r0, r11
        add     r3, r12, #1, 12
        mov     r1, r10
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __subdf3
        ldr     r12, [pc, #0x558]
        mov     r4, r0
        mov     r5, r1
        ldr     r12, [r12]
        str     r12, [sp, #0x30]
LBAQ1:
        mov     r0, r6
        bl      __floatsidf
        ldr     r2, [pc, #0x54C]
        ldr     r3, [pc, #0x544]
        mov     r7, r1
        bic     r1, r9, #2, 2
        mov     r6, r0
        mov     r0, r8
        bl      __gtdf2
        cmp     r0, #0
        ble     LBAQ2
        ldr     r12, [pc, #0x524]
        ldr     r2, [pc, #0x524]
        mov     r0, r6
        add     r3, r12, #1, 12
        mov     r1, r7
        bl      __muldf3
        mov     r2, r8
        mov     r3, r9
        bl      __subdf3
        ldr     r12, [pc, #0x4F4]
        mov     r8, r0
        mov     r9, r1
        ldr     r12, [r12]
        str     r12, [sp, #0x18]
LBAQ2:
        mov     r0, r11
        mov     r1, r10
        ldr     r2, [pc, #0x4E8]
        ldr     r3, [pc, #0x4E0]
        bl      __muldf3
        mov     r3, r5
        mov     r2, r4
        bl      __subdf3
        ldr     r2, [pc, #0x4D0]
        ldr     r3, [pc, #0x4C8]
        str     r0, [sp, #0x40]
        bic     r1, r1, #2, 2
        str     r1, [sp, #0x44]
        mov     r1, r7
        mov     r0, r6
        bl      __muldf3
        mov     r2, r8
        mov     r3, r9
        bl      __subdf3
        bic     r1, r1, #2, 2
        str     r0, [sp, #0x48]
        str     r1, [sp, #0x4C]
        mov     r3, r5
        mov     r1, r5
        mov     r2, r4
        mov     r0, r4
        bl      __muldf3
        mov     r10, r1
        mov     r11, r0
        mov     r1, r9
        mov     r3, r9
        mov     r0, r8
        mov     r2, r8
        bl      __muldf3
        ldr     r2, [sp, #0x40]
        ldr     r3, [sp, #0x44]
        str     r0, [sp, #0x50]
        mov     r6, r1
        ldr     r1, [sp, #0x44]
        mov     r0, r2
        bl      __muldf3
        ldr     r3, [sp, #0x4C]
        ldr     r2, [sp, #0x48]
        str     r1, [sp, #0x54]
        ldr     r1, [sp, #0x4C]
        mov     r7, r0
        mov     r0, r2
        bl      __muldf3
        str     r0, [sp, #0x58]
        str     r1, [sp, #0x5C]
        mov     r0, r11
        mov     r1, r10
        mov     r3, r5
        mov     r2, r4
        bl      __muldf3
        str     r0, [sp, #0x60]
        ldr     r0, [pc, #0x414]
        str     r1, [sp, #0x64]
        ldr     r1, [pc, #0x410]
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [pc, #0x404]
        ldr     r3, [pc, #0x404]
        bl      __adddf3
        mov     r3, r10
        mov     r2, r11
        bl      __muldf3
        ldr     r2, [pc, #0x3F4]
        ldr     r3, [pc, #0x3F4]
        bl      __adddf3
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldr     r10, [pc, #0x3E4]
        ldr     r2, [pc, #0x3E4]
        mov     r3, r10
        bl      __adddf3
        ldr     r2, [sp, #0x60]
        ldr     r3, [sp, #0x64]
        bl      __muldf3
        mov     r3, r5
        mov     r2, r4
        bl      __adddf3
        str     r0, [sp, #0x64]
        ldr     r0, [sp, #0x50]
        str     r1, [sp, #0x60]
        mov     r2, r8
        mov     r3, r9
        mov     r1, r6
        bl      __muldf3
        ldr     r2, [sp, #0x50]
        str     r0, [sp, #0x68]
        ldr     r0, [pc, #0x380]
        str     r1, [sp, #0x6C]
        ldr     r1, [pc, #0x37C]
        mov     r3, r6
        bl      __muldf3
        ldr     r2, [pc, #0x374]
        ldr     r3, [pc, #0x374]
        bl      __adddf3
        ldr     r2, [sp, #0x50]
        mov     r3, r6
        bl      __muldf3
        ldr     r2, [pc, #0x364]
        ldr     r3, [pc, #0x364]
        bl      __adddf3
        ldr     r2, [sp, #0x50]
        mov     r3, r6
        bl      __muldf3
        ldr     r2, [pc, #0x358]
        mov     r3, r10
        bl      __adddf3
        ldr     r3, [sp, #0x6C]
        ldr     r2, [sp, #0x68]
        bl      __muldf3
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        ldr     r2, [sp, #0x40]
        ldr     r3, [sp, #0x44]
        str     r1, [sp, #0x68]
        ldr     r1, [sp, #0x54]
        str     r0, [sp, #0x6C]
        mov     r0, r7
        bl      __muldf3
        mov     r5, r1
        ldr     r1, [pc, #0x2FC]
        ldr     r3, [sp, #0x54]
        mov     r4, r0
        ldr     r0, [pc, #0x2EC]
        mov     r2, r7
        bl      __muldf3
        ldr     r2, [pc, #0x2E8]
        ldr     r3, [pc, #0x2E8]
        bl      __adddf3
        ldr     r3, [sp, #0x54]
        mov     r2, r7
        bl      __muldf3
        ldr     r2, [pc, #0x2D8]
        ldr     r3, [pc, #0x2D8]
        bl      __adddf3
        ldr     r3, [sp, #0x54]
        mov     r2, r7
        bl      __muldf3
        ldr     r2, [pc, #0x2CC]
        mov     r3, r10
        bl      __adddf3
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [sp, #0x40]
        ldr     r3, [sp, #0x44]
        bl      __adddf3
        mov     r4, r0
        mov     r5, r1
        ldr     r2, [sp, #0x48]
        ldr     r3, [sp, #0x4C]
        ldr     r0, [sp, #0x58]
        ldr     r1, [sp, #0x5C]
        bl      __muldf3
        mov     r7, r1
        ldr     r1, [pc, #0x270]
        ldr     r2, [sp, #0x58]
        ldr     r3, [sp, #0x5C]
        mov     r6, r0
        ldr     r0, [pc, #0x25C]
        bl      __muldf3
        ldr     r2, [pc, #0x25C]
        ldr     r3, [pc, #0x25C]
        bl      __adddf3
        ldr     r2, [sp, #0x58]
        ldr     r3, [sp, #0x5C]
        bl      __muldf3
        ldr     r2, [pc, #0x24C]
        ldr     r3, [pc, #0x24C]
        bl      __adddf3
        ldr     r2, [sp, #0x58]
        ldr     r3, [sp, #0x5C]
        bl      __muldf3
        ldr     r2, [pc, #0x240]
        mov     r3, r10
        bl      __adddf3
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        ldr     r2, [sp, #0x48]
        ldr     r3, [sp, #0x4C]
        bl      __adddf3
        mov     r7, r0
        ldr     r0, [sp, #0x64]
        mov     r6, r1
        ldr     r1, [sp, #0x60]
        bl      __truncdfsf2
        ldr     r1, [sp, #0x68]
        mov     r2, r0
        ldr     r0, [sp, #0x6C]
        str     r2, [sp, #0x7C]
        bl      __truncdfsf2
        mov     r1, r0
        str     r1, [sp, #0x78]
        mov     r1, r5
        mov     r0, r4
        bl      __truncdfsf2
        mov     r1, r0
        str     r1, [sp, #0x74]
        mov     r1, r6
        mov     r0, r7
        bl      __truncdfsf2
        ldr     r4, [sp, #0x2C]
        ldr     r9, [sp, #0x3C]
        ldr     r1, [sp, #0x74]
        ldr     r3, [sp, #0x7C]
        ldr     r8, [sp, #0x34]
        ldr     r12, [sp, #0x78]
        ldr     r2, [r4]
        eor     r0, r0, r9, lsl #31
        str     r0, [sp, #0x70]
        eor     r1, r1, r8, lsl #31
        str     r1, [sp, #0x74]
        eor     r8, r3, r8, lsl #31
        eor     r9, r12, r9, lsl #31
        str     r9, [sp, #0x78]
        str     r8, [sp, #0x7C]
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [sp, #0x30]
        bl      __mulsf3
        ldr     r5, [sp, #0x20]
        ldr     r1, [sp, #0x7C]
        str     r0, [r5, #0xC]
        ldr     r0, [r4], #8
        ldr     r2, [sp, #0x24]
        str     r4, [sp, #0x2C]
        add     r6, r2, #2
        str     r6, [sp, #0x24]
        bl      __mulsf3
        str     r0, [r5, #0x10]!
        ldr     r4, [sp, #0x28]
        ldr     r1, [sp, #0x70]
        ldr     r2, [sp, #0x10]
        ldr     r0, [r4]
        str     r5, [sp, #0x20]
        sub     r6, r2, r6
        bl      __mulsf3
        ldr     r1, [sp, #0x18]
        bl      __mulsf3
        ldr     r5, [sp, #0x38]
        ldr     r1, [sp, #0x78]
        str     r0, [r5, #0xC]
        ldr     r0, [r4], #8
        str     r4, [sp, #0x28]
        bl      __mulsf3
        str     r0, [r5, #0x10]!
        cmp     r6, #2
        str     r5, [sp, #0x38]
        bge     LBAQ0
        ldr     r4, [sp, #0x10]
        ldr     r2, [sp, #8]
        ldr     r6, [sp, #4]
        ldr     r5, [sp]
LBAQ3:
        tst     r4, #1
        beq     LBAQ6
        sub     r6, r6, #4
        ldr     r0, [r6, +r4, lsl #2]
        sub     r7, r2, #8
        sub     r5, r5, #4
        bl      __extendsfdf2
        bl      cos
        bl      __truncdfsf2
        ldr     r1, [r5, +r4, lsl #2]
        bl      __mulsf3
        str     r0, [r7, +r4, lsl #3]
        ldr     r0, [r6, +r4, lsl #2]
        add     r8, r7, r4, lsl #3
        bl      __extendsfdf2
        bl      sin
        bl      __truncdfsf2
        ldr     r1, [r5, +r4, lsl #2]
        bl      __mulsf3
        str     r0, [r8, #4]
        mov     r0, #0
        add     sp, sp, #0x88
        ldmia   sp!, {r4 - r11, pc}
LBAQ4:
        sub     r8, r2, #4
LBAQ5:
        ldr     r0, [r6]
        add     r7, r7, #1
        bl      __extendsfdf2
        bl      cos
        ldr     r9, [r5]
        bl      __truncdfsf2
        mov     r1, r9
        bl      __mulsf3
        str     r0, [r8, #4]
        ldr     r0, [r6], #4
        bl      __extendsfdf2
        bl      sin
        ldr     r9, [r5], #4
        bl      __truncdfsf2
        mov     r1, r9
        bl      __mulsf3
        str     r0, [r8, #8]!
        cmp     r7, r4
        blt     LBAQ5
LBAQ6:
        mov     r0, #0
        add     sp, sp, #0x88
        ldmia   sp!, {r4 - r11, pc}
LBAQ7:
        mvn     r0, #5
        add     sp, sp, #0x88
        ldmia   sp!, {r4 - r11, pc}
LBAQ8:
        mvn     r0, #7
        add     sp, sp, #0x88
        ldmia   sp!, {r4 - r11, pc}
        .long   LBAQ__2il0floatpacket.1
        .long   LBAQ__2il0floatpacket.2
        .long   0x6dc9c883
        .long   0x3fd45f30
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


LBAQ__2il0floatpacket.1:
        .byte   0x00,0x00,0x80,0x3F
LBAQ__2il0floatpacket.2:
        .byte   0x00,0x00,0x80,0xBF


