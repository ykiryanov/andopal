        .text
        .align  4
        .globl  _ippiReconstructLumaIntra8x8MB_H264_16s8u_C1R


_ippiReconstructLumaIntra8x8MB_H264_16s8u_C1R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC3, 30
        ldr     r6, [sp, #0x330]
        ldr     r5, [sp, #0x334]
        ldr     r4, [sp, #0x338]
        ldr     lr, [sp, #0x33C]
        ldr     r12, [sp, #0x340]
        cmp     r0, #0
        beq     LKWF69
        cmp     r1, #0
        beq     LKWF69
        cmp     r3, #0
        beq     LKWF69
        ldr     r10, [r0]
        cmp     r10, #0
        beq     LKWF69
        cmp     lr, #0
        beq     LKWF69
        cmp     r5, #0x33
        bls     LKWF0
        mvn     r0, #0xA
        add     sp, sp, #0xC3, 30
        ldmia   sp!, {r4 - r11, pc}
LKWF0:
        mov     r8, #0
        mov     r9, r8
        mov     r11, #1, 24
LKWF1:
        add     r7, sp, #0xA8
        strh    r9, [r7, +r8]
        subs    r11, r11, #1
        add     r8, r8, #2
        bne     LKWF1
        ldr     r7, [pc, #0xED8]
        mov     r9, #1
        mov     r8, #0
        str     r7, [sp, #0x1C]
        ldr     r7, [pc, #0xECC]
        str     r8, [sp, #4]
        and     r8, r4, #4
        str     r7, [sp, #0x20]
        ldr     r7, [pc, #0xEC0]
        str     r8, [sp, #0x10]
        and     r8, r4, #1
        str     r7, [sp, #0x18]
        add     r7, r2, r2, lsl #2
        add     r11, r2, r7
        str     r11, [sp, #0xC]
        rsb     r11, r2, r2, lsl #3
        str     r0, [sp]
        ldr     r0, [sp, #4]
        str     r8, [sp, #0x14]
        str     r11, [sp, #8]
        add     r8, r2, r2, lsl #1
        mvn     r11, #0xFF
        str     r3, [sp, #0x40]
        str     r11, [sp, #0x68]
        str     r7, [sp, #0x4C]
        str     r8, [sp, #0x50]
        str     r9, [sp, #0x44]
        str     r10, [sp, #0x54]
        str     r12, [sp, #0x58]
        str     lr, [sp, #0x6C]
        str     r4, [sp, #0x64]
        str     r5, [sp, #0x60]
        str     r6, [sp, #0x5C]
LKWF2:
        ldr     r3, [sp, #0x1C]
        ldr     r4, [sp, #0x40]
        ldr     lr, [sp, #0x20]
        ldrb    r5, [r3], #1
        ldr     r10, [r4], #4
        ldrb    r12, [lr], #1
        cmp     r5, #0
        str     r4, [sp, #0x40]
        str     lr, [sp, #0x20]
        str     r3, [sp, #0x1C]
        beq     LKWF3
        ldr     r3, [sp, #0x10]
        cmp     r3, #0
        movne   r3, #1
        bne     LKWF4
LKWF3:
        mov     r3, #0
LKWF4:
        cmp     r12, #0
        beq     LKWF5
        ldr     r12, [sp, #0x14]
        cmp     r12, #0
        movne   lr, #1
        bne     LKWF6
LKWF5:
        cmp     r3, #0
        movne   lr, #0
        beq     LKWF7
LKWF6:
        cmp     r0, #0
        bne     LKWF8
        ldr     r12, [sp, #0x64]
        tst     r12, #0x10
        bne     LKWF8
        b       LKWF9
LKWF7:
        ldr     r12, [sp, #0x64]
        tst     r12, #0x10
        moveq   lr, #0
        beq     LKWF9
        cmp     r0, #0
        movne   lr, #0
        moveq   lr, #0
        bne     LKWF9
LKWF8:
        mov     r4, #1
        b       LKWF10
LKWF9:
        mov     r4, #0
LKWF10:
        cmp     r3, #0
        beq     LKWF11
        cmp     r0, #1
        bne     LKWF13
        ldr     r12, [sp, #0x64]
        tst     r12, #0x20
        bne     LKWF13
        b       LKWF14
LKWF11:
        ldr     r12, [sp, #0x64]
        tst     r12, #0x20
        beq     LKWF12
        cmp     r0, #1
        beq     LKWF13
LKWF12:
        cmp     r0, #3
        bne     LKWF14
LKWF13:
        mov     r5, #1
        b       LKWF15
LKWF14:
        mov     r5, #0
LKWF15:
        cmp     r3, #0
        mov     r12, #0
        mov     r6, r12
        mov     r3, #1
        moveq   r6, r3
        cmp     lr, #0
        mov     r7, r12
        moveq   r7, r3
        cmp     r4, #0
        mov     lr, r12
        moveq   lr, r3
        cmp     r5, #0
        orr     r7, r6, r7, lsl #1
        orr     lr, r7, lr, lsl #5
        moveq   r12, r3
        orr     r4, lr, r12, lsl #6
        ands    r9, r4, #1
        str     r1, [sp, #0x48]
        beq     LKWF16
        sub     r12, r1, r2
        ldrb    r3, [r12, #1]
        ldrb    r8, [r12]
        str     r3, [sp, #0x30]
        ldrb    r11, [r12, #6]
        ldrb    lr, [r12, #2]
        ldrb    r5, [r12, #3]
        ldrb    r6, [r12, #4]
        ldrb    r7, [r12, #5]
        str     r11, [sp, #0x74]
        ldrb    r12, [r12, #7]
        add     r11, sp, #0xAA, 30
        strb    r8, [r11, #1]
        add     r11, sp, #0xAA, 30
        strb    r3, [r11, #2]
        add     r3, sp, #0xAA, 30
        strb    lr, [r3, #3]
        add     r3, sp, #0xAA, 30
        strb    r5, [r3, #4]
        add     r3, sp, #0xAA, 30
        strb    r6, [r3, #5]
        add     r3, sp, #0xAA, 30
        strb    r7, [r3, #6]
        ldr     lr, [sp, #0x74]
        add     r3, sp, #0xAA, 30
        strb    lr, [r3, #7]
        add     r3, sp, #0xAA, 30
        strb    r12, [r3, #8]
        b       LKWF17
LKWF16:
        add     lr, sp, #0xAA, 30
        mov     r3, #0x80
        strb    r3, [lr, #8]
        add     lr, sp, #0xAA, 30
        strb    r3, [lr, #7]
        add     lr, sp, #0xAA, 30
        strb    r3, [lr, #6]
        add     lr, sp, #0xAA, 30
        strb    r3, [lr, #5]
        add     lr, sp, #0xAA, 30
        strb    r3, [lr, #4]
        mov     r8, #0x80
        add     lr, sp, #0xAA, 30
        mov     r12, r8
        strb    r3, [lr, #3]
        str     r12, [sp, #0x30]
        add     lr, sp, #0xAA, 30
        strb    r3, [lr, #2]
        add     lr, sp, #0xAA, 30
        strb    r3, [lr, #1]
LKWF17:
        tst     r4, #0x40
        beq     LKWF18
        sub     r12, r1, r2
        ldrb    r3, [r12, #8]
        add     r7, sp, #0xAA, 30
        str     r3, [sp, #0x74]
        ldrb    r3, [r12, #9]
        ldr     r11, [sp, #0x74]
        str     r3, [sp, #0x70]
        ldrb    r5, [r12, #0xC]
        ldrb    r3, [r12, #0xA]
        ldrb    lr, [r12, #0xB]
        str     r5, [sp, #0x3C]
        ldrb    r6, [r12, #0xE]
        ldrb    r5, [r12, #0xD]
        str     r6, [sp, #0x38]
        strb    r11, [r7, #9]
        ldr     r11, [sp, #0x70]
        ldrb    r12, [r12, #0xF]
        add     r7, sp, #0xAA, 30
        strb    r11, [r7, #0xA]
        add     r7, sp, #0xAA, 30
        strb    r3, [r7, #0xB]
        add     r3, sp, #0xAA, 30
        strb    lr, [r3, #0xC]
        ldr     lr, [sp, #0x3C]
        add     r3, sp, #0xAA, 30
        strb    lr, [r3, #0xD]
        add     r3, sp, #0xAA, 30
        strb    r5, [r3, #0xE]
        add     r3, sp, #0xAA, 30
        strb    r6, [r3, #0xF]
        b       LKWF19
LKWF18:
        str     r12, [sp, #0x38]
        add     r3, sp, #0xAA, 30
        strb    r12, [r3, #0xF]
        add     r3, sp, #0xAA, 30
        strb    r12, [r3, #0xE]
        add     r3, sp, #0xAA, 30
        strb    r12, [r3, #0xD]
        add     r3, sp, #0xAA, 30
        strb    r12, [r3, #0xC]
        add     r3, sp, #0xAA, 30
        strb    r12, [r3, #0xB]
        add     r3, sp, #0xAA, 30
        strb    r12, [r3, #0xA]
        add     r3, sp, #0xAA, 30
        strb    r12, [r3, #9]
LKWF19:
        add     r3, sp, #0xAA, 30
        ands    r7, r4, #2
        strb    r12, [r3, #0x10]
        beq     LKWF20
        ldrb    r3, [r1, #-1]
        add     lr, r2, r1
        ldrb    lr, [lr, #-1]
        add     r6, r1, r2, lsl #1
        add     r11, sp, #0xAA, 30
        str     lr, [sp, #0x3C]
        ldrb    r6, [r6, #-1]
        str     r6, [sp, #0x74]
        ldr     r6, [sp, #0x50]
        add     r6, r1, r6
        ldrb    r6, [r6, #-1]
        str     r6, [sp, #0x70]
        add     r6, r1, r2, lsl #2
        ldrb    r6, [r6, #-1]
        str     r6, [sp, #0x78]
        ldr     r6, [sp, #0x4C]
        add     r6, r1, r6
        ldrb    r6, [r6, #-1]
        str     r6, [sp, #0x7C]
        ldr     r6, [sp, #0xC]
        add     r6, r1, r6
        ldrb    r5, [r6, #-1]
        ldr     r6, [sp, #8]
        str     r5, [sp, #0x2C]
        add     r6, r1, r6
        ldrb    r6, [r6, #-1]
        str     r6, [sp, #0x34]
        strb    r3, [r11, #0x11]
        add     r11, sp, #0xAA, 30
        strb    lr, [r11, #0x12]
        ldr     r11, [sp, #0x74]
        add     lr, sp, #0xAA, 30
        strb    r11, [lr, #0x13]
        ldr     r11, [sp, #0x70]
        add     lr, sp, #0xAA, 30
        strb    r11, [lr, #0x14]
        ldr     r11, [sp, #0x78]
        add     lr, sp, #0xAA, 30
        strb    r11, [lr, #0x15]
        ldr     r11, [sp, #0x7C]
        add     lr, sp, #0xAA, 30
        strb    r11, [lr, #0x16]
        add     lr, sp, #0xAA, 30
        strb    r5, [lr, #0x17]
        add     lr, sp, #0xAA, 30
        strb    r6, [lr, #0x18]
        b       LKWF21
LKWF20:
        mov     r3, #0x80
        mov     r5, r3
        str     r5, [sp, #0x34]
        str     r5, [sp, #0x2C]
        add     r6, sp, #0xAA, 30
        mov     lr, #0x80
        strb    lr, [r6, #0x18]
        add     r6, sp, #0xAA, 30
        strb    lr, [r6, #0x17]
        add     r6, sp, #0xAA, 30
        strb    lr, [r6, #0x16]
        add     r6, sp, #0xAA, 30
        strb    lr, [r6, #0x15]
        add     r6, sp, #0xAA, 30
        strb    lr, [r6, #0x14]
        add     r6, sp, #0xAA, 30
        strb    lr, [r6, #0x13]
        str     r5, [sp, #0x3C]
        add     r6, sp, #0xAA, 30
        strb    lr, [r6, #0x12]
        add     r6, sp, #0xAA, 30
        strb    lr, [r6, #0x11]
LKWF21:
        ands    r6, r4, #0x20
        moveq   lr, #0x80
        subne   lr, r1, r2
        ldrneb  lr, [lr, #-1]
        add     r11, sp, #0xAA, 30
        strb    lr, [r11]
        mov     r5, #0
        str     r1, [sp, #0x28]
LKWF22:
        add     r11, sp, #0xAA, 30
        ldrb    r11, [r5, +r11]
        add     r1, sp, #0xB9, 30
        strb    r11, [r5, +r1]
        add     r5, r5, #1
        cmp     r5, #0x19
        blt     LKWF22
        ldr     r1, [sp, #0x28]
        cmp     r9, #0
        beq     LKWF26
        cmp     r6, #0
        beq     LKWF23
        ldr     r11, [sp, #0x30]
        add     r5, lr, r8, lsl #1
        add     r11, r11, #2
        add     r11, r5, r11
        b       LKWF24
LKWF23:
        ldr     r11, [sp, #0x30]
        add     r5, r8, r8, lsl #1
        add     r11, r5, r11
        add     r11, r11, #2
LKWF24:
        add     r5, sp, #0xB9, 30
        mov     r11, r11, asr #2
        strb    r11, [r5, #1]
        mov     r5, #2
        str     r0, [sp, #4]
        str     r2, [sp, #0x24]
        str     r1, [sp, #0x28]
LKWF25:
        add     r0, sp, #0xAA, 30
        add     r11, r0, r5
        ldrb    r2, [r11, #-1]
        ldrb    r0, [r5, +r0]
        ldrb    r11, [r11, #1]
        add     r1, sp, #0xB9, 30
        add     r0, r2, r0, lsl #1
        add     r11, r0, r11
        add     r0, r11, #2
        mov     r0, r0, asr #2
        strb    r0, [r5, +r1]
        add     r5, r5, #1
        cmp     r5, #0x10
        blt     LKWF25
        ldr     r11, [sp, #0x38]
        ldr     r0, [sp, #4]
        ldr     r2, [sp, #0x24]
        ldr     r1, [sp, #0x28]
        add     r12, r12, r12, lsl #1
        add     r12, r11, r12
        add     r12, r12, #2
        add     r11, sp, #0xB9, 30
        mov     r12, r12, asr #2
        strb    r12, [r11, #0x10]
LKWF26:
        cmp     r6, #0
        beq     LKWF28
        and     r12, r4, #3
        cmp     r12, #3
        beq     LKWF33
        cmp     r9, #0
        beq     LKWF27
        add     r12, lr, lr, lsl #1
        add     r8, r12, r8
        add     r12, r8, #2
        add     r8, sp, #0xB9, 30
        mov     r12, r12, asr #2
        strb    r12, [r8]
        b       LKWF28
LKWF27:
        cmp     r7, #0
        beq     LKWF28
        add     r12, lr, lr, lsl #1
        add     r12, r12, r3
        add     r12, r12, #2
        add     r8, sp, #0xB9, 30
        mov     r12, r12, asr #2
        strb    r12, [r8]
LKWF28:
        cmp     r7, #0
        beq     LKWF32
        cmp     r6, #0
        beq     LKWF29
        ldr     r12, [sp, #0x3C]
        add     r3, lr, r3, lsl #1
        add     r12, r12, #2
        add     r12, r3, r12
        b       LKWF30
LKWF29:
        ldr     r12, [sp, #0x3C]
        add     r3, r3, r3, lsl #1
        add     r12, r3, r12
        add     r12, r12, #2
LKWF30:
        mov     r3, r12, asr #2
        add     r12, sp, #0xB9, 30
        strb    r3, [r12, #0x11]
        mov     r3, #0x12
LKWF31:
        add     lr, sp, #0xAA, 30
        add     r5, lr, r3
        ldrb    r6, [r5, #-1]
        ldrb    lr, [r3, +lr]
        ldrb    r5, [r5, #1]
        add     r12, sp, #0xB9, 30
        add     lr, r6, lr, lsl #1
        add     r5, lr, r5
        add     lr, r5, #2
        mov     lr, lr, asr #2
        strb    lr, [r3, +r12]
        add     r3, r3, #1
        cmp     r3, #0x18
        blt     LKWF31
        ldr     r3, [sp, #0x34]
        ldr     r12, [sp, #0x2C]
        add     r3, r3, r3, lsl #1
        add     r3, r12, r3
        add     r3, r3, #2
        add     r12, sp, #0xB9, 30
        mov     r3, r3, asr #2
        strb    r3, [r12, #0x18]
LKWF32:
        ldr     r3, [pc, #0x898]
        sub     r10, r10, #9
        adds    r10, #9							//SB		cmn     r10, #9
        ldrcs   r10, [r3, +r10, lsl #2]
        addcs   pc, pc, r10
        mvn     r0, #0xA
LKWF_.Lpc1:
        add     sp, sp, #0xC3, 30
        ldmia   sp!, {r4 - r11, pc}
LKWF33:
        add     r8, r8, #2
        add     r12, r3, lr, lsl #1
        add     r8, r12, r8
        mov     r12, r8, asr #2
        add     r8, sp, #0xB9, 30
        strb    r12, [r8]
        b       LKWF28
LKWF_bd.1.1:
        .long   0xe59d7008
        .long   0xe28d3fb9
        .long   0xe5d3c001
        .long   0xe28d9fb9
        .long   0xe081a082
        .long   0xe28d4fb9
        .long   0xe7c1c007
        .long   0xe59d500c
        .long   0xe28d3fb9
        .long   0xe5d3e005
        .long   0xe7c1c005
        .long   0xe59d604c
        .long   0xe28d3fb9
        .long   0xe5d33002
        .long   0xe0817007
        .long   0xe7c1c006
        .long   0xe7c1c102
        .long   0xe59d8050
        .long   0xe0815005
        .long   0xe0816006
        .long   0xe7c1c008
        .long   0xe7c1c082
        .long   0xe7c1c002
        .long   0xe5c1c000
        .long   0xe28dcfb9
        .long   0xe5dcc003
        .long   0xe0818008
        .long   0xe082b001
        .long   0xe58dc07c
        .long   0xe28dcfb9
        .long   0xe5dcc004
        .long   0xe5d99007
        .long   0xe5d44006
        .long   0xe58d9078
        .long   0xe28d9fb9
        .long   0xe5d99008
        .long   0xe58d9074
        .long   0xe5c73001
        .long   0xe5c53001
        .long   0xe5c63001
        .long   0xe0819102
        .long   0xe5c93001
        .long   0xe5c83001
        .long   0xe5ca3001
        .long   0xe5cb3001
        .long   0xe5c13001
        .long   0xe59d307c
        .long   0xe5c73002
        .long   0xe5c53002
        .long   0xe5c63002
        .long   0xe5c93002
        .long   0xe5c83002
        .long   0xe5ca3002
        .long   0xe5cb3002
        .long   0xe5c13002
        .long   0xe5c7c003
        .long   0xe5c5c003
        .long   0xe5c6c003
        .long   0xe5c9c003
        .long   0xe5c8c003
        .long   0xe5cac003
        .long   0xe5cbc003
        .long   0xe5c1c003
        .long   0xe5c7e004
        .long   0xe5c5e004
        .long   0xe5c6e004
        .long   0xe5c9e004
        .long   0xe5c8e004
        .long   0xe5cae004
        .long   0xe5cbe004
        .long   0xe5c1e004
        .long   0xe5c74005
        .long   0xe5c54005
        .long   0xe5c64005
        .long   0xe5c94005
        .long   0xe5c84005
        .long   0xe5ca4005
        .long   0xe5cb4005
        .long   0xe5c14005
        .long   0xe59d3078
        .long   0xe5c73006
        .long   0xe5c53006
        .long   0xe5c63006
        .long   0xe5c93006
        .long   0xe5c83006
        .long   0xe5ca3006
        .long   0xe5cb3006
        .long   0xe5c13006
        .long   0xe59d3074
        .long   0xe5c73007
        .long   0xe5c53007
        .long   0xe5c63007
        .long   0xe5c93007
        .long   0xe5c83007
        .long   0xe5ca3007
        .long   0xe5cb3007
        .long   0xe5c13007
LKWF34:
        .long   0xe59dc05c
        .long   0xe59d3044
        .long   0xe11c0003
        .long   0x0a0001ec
        .long   0xe59d3058
        .long   0xe3530000
        .long   0x0a000002
        .long   0xe59d3060
        .long   0xe3530000
        .long   0x9a00003a
LKWF35:
        .long   0xe59dc060
        .long   0xe59f36b0
        .long   0xe35c0024
        .long   0xe08c339c
        .long   0xe1a0312c
        .long   0x3a000018
        .long   0xe59d6054
        .long   0xe59d706c
        .long   0xe3a0e000
        .long   0xe243c006
        .long   0xe1a0300e
LKWF36:
        .long   0xe3a0a000
        .long   0xe1a0508e
        .long   0xe087408e
LKWF37:
        .long   0xe0d490f2
        .long   0xe19680f5
        .long   0xe183300a
        .long   0xe28ee001
        .long   0xe0090998
        .long   0xe35e0040
        .long   0xe1a08c19
        .long   0xe18680b5
        .long   0xe2855002
        .long   0xaa0001e0
        .long   0xe35e0000
        .long   0xdafffff0
        .long   0xe19680f5
        .long   0xe3580000
        .long   0x13a0a001
        .long   0x1affffef
        .long   0xeaffffeb
LKWF38:
        .long   0xe263c005
        .long   0xe3a0e001
        .long   0xe59d7054
        .long   0xe59d806c
        .long   0xe1a0ec1e
        .long   0xe3a04000
        .long   0xe263c006
        .long   0xe1a03004
LKWF39:
        .long   0xe3a09000
        .long   0xe1a06084
        .long   0xe0885084
LKWF40:
        .long   0xe0d5a0f2
        .long   0xe197b0f6
        .long   0xe1833009
        .long   0xe2844001
        .long   0xe02aea9b
        .long   0xe3540040
        .long   0xe1a09c5a
        .long   0xe18790b6
        .long   0xe2866002
        .long   0xaa0001c9
        .long   0xe3540000
        .long   0xdafffff0
        .long   0xe19790f6
        .long   0xe3590000
        .long   0x13a09001
        .long   0x1affffef
        .long   0xeaffffeb
LKWF41:
        .long   0xe59d3058
        .long   0xe3530000
        .long   0x0a000172
        .long   0xe59d3060
        .long   0xe3530000
        .long   0x1a00016f
LKWF42:
        .long   0xe59d9054
        .long   0xe59da058
        .long   0xe28d4fb1
        .long   0xe5849000
        .long   0xe28d4fb1
        .long   0xe2897010
        .long   0xe5847004
        .long   0xe28d4fb1
        .long   0xe2896020
        .long   0xe5846008
        .long   0xe28d4fb1
        .long   0xe2895030
        .long   0xe584500c
        .long   0xe28d4fb1
        .long   0xe289e040
        .long   0xe584e010
        .long   0xe28d4fb1
        .long   0xe289c050
        .long   0xe584c014
        .long   0xe28d4fb1
        .long   0xe2893060
        .long   0xe5843018
        .long   0xe2898070
        .long   0xe28d4fb1
        .long   0xe35a0000
        .long   0xe584801c
        .long   0x0a000002
        .long   0xe59d4060
        .long   0xe3540000
        .long   0x9a0000dc
LKWF43:
        .long   0xe3a04000
        .long   0xe58d8070
        .long   0xe58d302c
        .long   0xe58dc030
        .long   0xe58de034
        .long   0xe58d5038
        .long   0xe58d603c
        .long   0xe58d7048
        .long   0xe58d0004
        .long   0xe58d2024
        .long   0xe58d1028
LKWF44:
        .long   0xe28d0fb1
        .long   0xe7900104
        .long   0xe2844001
        .long   0xe3540008
        .long   0xe1d0c0fe
        .long   0xe1d070f6
        .long   0xe1d080fa
        .long   0xe1d050f2
        .long   0xe1d020f0
        .long   0xe1d0a0f8
        .long   0xe1d0e0f4
        .long   0xe1d090fc
        .long   0xe1a010cc
        .long   0xe0486007
        .long   0xe58d607c
        .long   0xe59db07c
        .long   0xe1a030c7
        .long   0xe2611000
        .long   0xe085600c
        .long   0xe2633000
        .long   0xe041100c
        .long   0xe04cc005
        .long   0xe0433007
        .long   0xe58dc078
        .long   0xe0877008
        .long   0xe088c0c8
        .long   0xe08580c5
        .long   0xe082500a
        .long   0xe042200a
        .long   0xe59da078
        .long   0xe0863003
        .long   0xe06960ce
        .long   0xe0877008
        .long   0xe08ee0c9
        .long   0xe08b1001
        .long   0xe08ac00c
        .long   0xe085a00e
        .long   0xe082b006
        .long   0xe0818147
        .long   0xe083914c
        .long   0xe0422006
        .long   0xe045500e
        .long   0xe06c3143
        .long   0xe0477141
        .long   0xe08a6007
        .long   0xe08b1003
        .long   0xe089c002
        .long   0xe088e005
        .long   0xe0455008
        .long   0xe0422009
        .long   0xe04bb003
        .long   0xe04aa007
        .long   0xe1c060b0
        .long   0xe1c010b2
        .long   0xe1c0c0b4
        .long   0xe1c0e0b6
        .long   0xe1c050b8
        .long   0xe1c020ba
        .long   0xe1c0b0bc
        .long   0xe1c0a0be
        .long   0xbaffffc2
        .long   0xe59d8070
        .long   0xe59d0004
        .long   0xe59d2024
        .long   0xe59d1028
        .long   0xe59d302c
        .long   0xe59dc030
        .long   0xe59de034
        .long   0xe59d5038
        .long   0xe59d603c
        .long   0xe59d7048
        .long   0xe3a09008
        .long   0xe3a04000
        .long   0xe58d9074
        .long   0xe58d8070
        .long   0xe58d0004
        .long   0xe58d2024
        .long   0xe58d1028
LKWF45:
        .long   0xe59d0070
        .long   0xe1d520f0
        .long   0xe1dc90f0
        .long   0xe1d010f0
        .long   0xe59d0054
        .long   0xe1d780f0
        .long   0xe049b002
        .long   0xe19000f4
        .long   0xe1a0a0c1
        .long   0xe26aa000
        .long   0xe04aa001
        .long   0xe58d007c
        .long   0xe1de00f0
        .long   0xe58d0078
        .long   0xe1d600f0
        .long   0xe58d0080
        .long   0xe1d300f0
        .long   0xe58da088
        .long   0xe1a0a0c2
        .long   0xe58db084
        .long   0xe59db078
        .long   0xe58da08c
        .long   0xe082a009
        .long   0xe58da090
        .long   0xe088a0c8
        .long   0xe58da094
        .long   0xe59da07c
        .long   0xe08ab00b
        .long   0xe58db098
        .long   0xe59db088
        .long   0xe59da084
        .long   0xe08ab00b
        .long   0xe59da08c
        .long   0xe58db088
        .long   0xe59db094
        .long   0xe26aa000
        .long   0xe58da08c
        .long   0xe59da080
        .long   0xe08aa0c0
        .long   0xe58da084
        .long   0xe59da090
        .long   0xe08ab00b
        .long   0xe58db094
        .long   0xe088a001
        .long   0xe58da090
        .long   0xe59da08c
        .long   0xe0411008
        .long   0xe58d109c
        .long   0xe59d1098
        .long   0xe59d8084
        .long   0xe04aa002
        .long   0xe58da08c
        .long   0xe08920c9
        .long   0xe59d908c
        .long   0xe0818008
        .long   0xe58d80a0
        .long   0xe59d8094
        .long   0xe59d1088
        .long   0xe0488141
        .long   0xe59d1078
        .long   0xe58d80a4
        .long   0xe59d807c
        .long   0xe0481001
        .long   0xe59d8090
        .long   0xe0889009
        .long   0xe59d8080
        .long   0xe060a0c8
        .long   0xe59d009c
        .long   0xe080b002
        .long   0xe59d20a4
        .long   0xe59d00a0
        .long   0xe06b8149
        .long   0xe089914b
        .long   0xe0800002
        .long   0xe081200a
        .long   0xe041100a
        .long   0xe59da054
        .long   0xe2800020
        .long   0xe1a00340
        .long   0xe18a00b4
        .long   0xe0820008
        .long   0xe2800020
        .long   0xe58d009c
        .long   0xe59da094
        .long   0xe59d0088
        .long   0xe0422008
        .long   0xe2844002
        .long   0xe080b14a
        .long   0xe59da098
        .long   0xe59d0084
        .long   0xe04aa000
        .long   0xe59d009c
        .long   0xe1a00340
        .long   0xe0c700b2
        .long   0xe0890001
        .long   0xe2800020
        .long   0xe58d009c
        .long   0xe08b000a
        .long   0xe58d0098
        .long   0xe59d009c
        .long   0xe04aa00b
        .long   0xe28aa020
        .long   0xe1a00340
        .long   0xe0c600b2
        .long   0xe59d0098
        .long   0xe0411009
        .long   0xe1a0a34a
        .long   0xe2800020
        .long   0xe2811020
        .long   0xe1a00340
        .long   0xe0c500b2
        .long   0xe0cea0b2
        .long   0xe1a01341
        .long   0xe0cc10b2
        .long   0xe2820020
        .long   0xe59d10a4
        .long   0xe59d20a0
        .long   0xe1a00340
        .long   0xe0c300b2
        .long   0xe59d0070
        .long   0xe0421001
        .long   0xe2811020
        .long   0xe1a01341
        .long   0xe0c010b2
        .long   0xe59d1074
        .long   0xe2511001
        .long   0xe58d1074
        .long   0xe58d0070
        .long   0x1affff7e
        .long   0xe59d0004
        .long   0xe59d2024
        .long   0xe59d1028
LKWF46:
        .long   0xe1a0c001
        .long   0xe59d8068
        .long   0xe59fa1c0
        .long   0xe3a03000
        .long   0xe58d0004
        .long   0xe58d2024
        .long   0xe58d1028
        .long   0xe3a09c01
LKWF47:
        .long   0xe28d0fb1
        .long   0xe5dce001
        .long   0xe5dc4002
        .long   0xe7900103
        .long   0xe5dc5003
        .long   0xe5dc2000
        .long   0xe5dc1004
        .long   0xe1a0b008
        .long   0xe2833001
        .long   0xe58d10a4
        .long   0xe1d010f0
        .long   0xe5dc6005
        .long   0xe5dc7006
        .long   0xe1510008
        .long   0xc1a0b001
        .long   0xe58d70a0
        .long   0xe5dc7007
        .long   0xe35b0c01
        .long   0xc1a0b009
        .long   0xe08ab00b
        .long   0xe08b2002
        .long   0xe5d21100
        .long   0xe5cc1000
        .long   0xe1d020f2
        .long   0xe1a01008
        .long   0xe1520008
        .long   0xc1a01002
        .long   0xe3510c01
        .long   0xc1a01009
        .long   0xe08a1001
        .long   0xe081e00e
        .long   0xe5de1100
        .long   0xe5cc1001
        .long   0xe1d020f4
        .long   0xe1a01008
        .long   0xe1520008
        .long   0xc1a01002
        .long   0xe3510c01
        .long   0xc1a01009
        .long   0xe08a1001
        .long   0xe0814004
        .long   0xe5d41100
        .long   0xe5cc1002
        .long   0xe1d020f6
        .long   0xe1a01008
        .long   0xe1520008
        .long   0xc1a01002
        .long   0xe3510c01
        .long   0xc1a01009
        .long   0xe08a1001
        .long   0xe0815005
        .long   0xe5d51100
        .long   0xe5cc1003
        .long   0xe1d020f8
        .long   0xe1a01008
        .long   0xe1520008
        .long   0xc1a01002
        .long   0xe59d20a4
        .long   0xe3510c01
        .long   0xc1a01009
        .long   0xe08a1001
        .long   0xe0812002
        .long   0xe5d21100
        .long   0xe5cc1004
        .long   0xe1d020fa
        .long   0xe1a01008
        .long   0xe1520008
        .long   0xc1a01002
        .long   0xe3510c01
        .long   0xc1a01009
        .long   0xe08a1001
        .long   0xe0816006
        .long   0xe5d61100
        .long   0xe5cc1005
        .long   0xe1d020fc
        .long   0xe1a01008
        .long   0xe1520008
        .long   0xc1a01002
        .long   0xe59d20a0
        .long   0xe3510c01
        .long   0xc1a01009
        .long   0xe08a1001
        .long   0xe0812002
        .long   0xe5d21100
        .long   0xe5cc1006
        .long   0xe1d000fe
        .long   0xe1a01008
        .long   0xe1500008
        .long   0xc1a01000
        .long   0xe3510c01
        .long   0xc1a01009
        .long   0xe08a1001
        .long   0xe0817007
        .long   0xe5d70100
        .long   0xe3530008
        .long   0xe5cc0007
        .long   0xe59d0024
        .long   0xe080c00c
        .long   0xbaffff9c
        .long   0xe59d0004
        .long   0xe59d2024
        .long   0xe59d1028
        .long   0xea000038
        .long   top_edge_tab4
        .long   left_edge_tab4
        .long   xyoff8
        .long   LKWF_bt.1
        .long   0xaaaaaaab
        .long   ClampTbl
LKWF48:
        .long   0xe59d3054
        .long   0xe1a08001
        .long   0xe3a07008
        .long   0xe1d330f0
        .long   0xe2833020
        .long   0xe1a03343
        .long   0xe1a03803
        .long   0xe1a0c843
        .long   0xe59d3068
        .long   0xe15c0003
        .long   0xc1a0300c
        .long   0xe3530c01
        .long   0xe3a0cc01
        .long   0xc1a0300c
        .long   0xe51fc044
        .long   0xe08c5003
LKWF49:
        .long   0xe5d84000
        .long   0xe5d83001
        .long   0xe5d8c002
        .long   0xe5d8e003
        .long   0xe5d86004
        .long   0xe5d89005
        .long   0xe5d8a006
        .long   0xe5d8b007
        .long   0xe0854004
        .long   0xe5d44100
        .long   0xe0853003
        .long   0xe5d33100
        .long   0xe085c00c
        .long   0xe5dcc100
        .long   0xe085e00e
        .long   0xe5dee100
        .long   0xe0856006
        .long   0xe5d66100
        .long   0xe0859009
        .long   0xe5d99100
        .long   0xe085a00a
        .long   0xe5daa100
        .long   0xe085b00b
        .long   0xe5dbb100
        .long   0xe5c84000
        .long   0xe5c83001
        .long   0xe5c8c002
        .long   0xe5c8e003
        .long   0xe5c86004
        .long   0xe5c89005
        .long   0xe5c8a006
        .long   0xe5c8b007
        .long   0xe2577001
        .long   0xe0828008
        .long   0x1affffdc
LKWF50:
        .long   0xe59d3054
        .long   0xe2833080
        .long   0xe58d3054
LKWF51:
        .long   0xe59de018
        .long   0xe2800001
        .long   0xe3500004
        .long   0xe1dec0d1
        .long   0xe1fe30d2
        .long   0xe58de018
        .long   0xe081c00c
        .long   0xe021c392
        .long   0xe59d3044
        .long   0xe1a03083
        .long   0xe58d3044
        .long   0x3afffc20
        .long   0xe59d0000
        .long   0xe59da054
        .long   0xe580a000
        .long   0xe3a00000
        .long   0xe28ddfc3
        .long   0xe8bd8ff0
LKWF52:
        .long   0xe58d6054
        .long   0xe58d706c
LKWF53:
        .long   0xe3530000
        .long   0x1afffe43
        .long   0xeafffe3c
LKWF54:
        .long   0xe58d7054
        .long   0xe58d806c
        .long   0xeafffff9
LKWF_bd.1.2:
        .long   0xe28d3fb9
        .long   0xe5d3e011
        .long   0xe28d3fb9
        .long   0xe5d3c012
        .long   0xe5c1e007
        .long   0xe5c1e006
        .long   0xe5c1e005
        .long   0xe5c1e004
        .long   0xe5c1e003
        .long   0xe5c1e002
        .long   0xe5c1e001
        .long   0xe5c1e000
        .long   0xe28d3fb9
        .long   0xe5d33013
        .long   0xe0825001
        .long   0xe5c5c007
        .long   0xe5c5c006
        .long   0xe5c5c005
        .long   0xe5c5c004
        .long   0xe5c5c003
        .long   0xe5c5c002
        .long   0xe5c5c001
        .long   0xe7c1c002
        .long   0xe28defb9
        .long   0xe5dee014
        .long   0xe0824005
        .long   0xe7c53002
        .long   0xe5c43007
        .long   0xe5c43006
        .long   0xe5c43005
        .long   0xe5c43004
        .long   0xe5c43003
        .long   0xe5c43002
        .long   0xe5c43001
        .long   0xe28dcfb9
        .long   0xe5dcc015
        .long   0xe0825004
        .long   0xe7c4e002
        .long   0xe5c5e007
        .long   0xe5c5e006
        .long   0xe5c5e005
        .long   0xe5c5e004
        .long   0xe5c5e003
        .long   0xe5c5e002
        .long   0xe5c5e001
        .long   0xe28d3fb9
        .long   0xe5d33016
        .long   0xe0824005
        .long   0xe7c5c002
        .long   0xe5c4c007
        .long   0xe5c4c006
        .long   0xe5c4c005
        .long   0xe5c4c004
        .long   0xe5c4c003
        .long   0xe5c4c002
        .long   0xe5c4c001
        .long   0xe28defb9
        .long   0xe5dee017
        .long   0xe0825004
        .long   0xe5c53007
        .long   0xe5c53006
        .long   0xe5c53005
        .long   0xe5c53004
        .long   0xe5c53003
        .long   0xe5c53002
        .long   0xe5c53001
        .long   0xe7c43002
        .long   0xe28dcfb9
        .long   0xe5dcc018
        .long   0xe0823005
        .long   0xe5c3e007
        .long   0xe5c3e006
        .long   0xe5c3e005
        .long   0xe5c3e004
        .long   0xe5c3e003
        .long   0xe5c3e002
        .long   0xe5c3e001
        .long   0xe7c5e002
        .long   0xe082e003
        .long   0xe5cec007
        .long   0xe5cec006
        .long   0xe5cec005
        .long   0xe5cec004
        .long   0xe5cec003
        .long   0xe5cec002
        .long   0xe5cec001
        .long   0xe7c3c002
        .long   0xeafffd9c
LKWF_bd.1.3:
        .long   0xe2044003
        .long   0xe3540003
        .long   0x0a000085
        .long   0xe3590000
        .long   0x0a00001c
        .long   0xe28defb9
        .long   0xe5de5004
        .long   0xe28defb9
        .long   0xe5de4005
        .long   0xe28defb9
        .long   0xe5de7006
        .long   0xe28d3fb9
        .long   0xe5d3c001
        .long   0xe28defb9
        .long   0xe5de6007
        .long   0xe28d3fb9
        .long   0xe5d33002
        .long   0xe28defb9
        .long   0xe5dee003
        .long   0xe28d8fb9
        .long   0xe5d88008
        .long   0xe08c3003
        .long   0xe083e00e
        .long   0xe0854004
        .long   0xe58d80a4
        .long   0xe59d30a4
        .long   0xe0876006
        .long   0xe0846006
        .long   0xe2833004
        .long   0xe08ee006
        .long   0xe08e3003
        .long   0xe1a031c3
        .long   0xe20330ff
        .long   0xea00001e
LKWF55:
        .long   0xe3570000
        .long   0x03a03080
        .long   0x0a00001b
        .long   0xe28defb9
        .long   0xe5de5014
        .long   0xe28defb9
        .long   0xe5de4015
        .long   0xe28defb9
        .long   0xe5de7016
        .long   0xe28d3fb9
        .long   0xe5d3c011
        .long   0xe28defb9
        .long   0xe5de6017
        .long   0xe28d3fb9
        .long   0xe5d33012
        .long   0xe28defb9
        .long   0xe5dee013
        .long   0xe28d8fb9
        .long   0xe5d88018
        .long   0xe08c3003
        .long   0xe083e00e
        .long   0xe0854004
        .long   0xe58d80a4
        .long   0xe59d30a4
        .long   0xe0876006
        .long   0xe0846006
        .long   0xe2833004
        .long   0xe08ee006
        .long   0xe08e3003
        .long   0xe1a031c3
        .long   0xe20330ff
LKWF56:
        .long   0xe5c13007
        .long   0xe5c13006
        .long   0xe5c13005
        .long   0xe5c13004
        .long   0xe5c13003
        .long   0xe5c13002
        .long   0xe5c13001
        .long   0xe5c13000
        .long   0xe082e001
        .long   0xe5ce3007
        .long   0xe5ce3006
        .long   0xe5ce3005
        .long   0xe5ce3004
        .long   0xe5ce3003
        .long   0xe5ce3002
        .long   0xe5ce3001
        .long   0xe7c13002
        .long   0xe082c00e
        .long   0xe7ce3002
        .long   0xe5cc3007
        .long   0xe5cc3006
        .long   0xe5cc3005
        .long   0xe5cc3004
        .long   0xe5cc3003
        .long   0xe5cc3002
        .long   0xe5cc3001
        .long   0xe082e00c
        .long   0xe7cc3002
        .long   0xe5ce3007
        .long   0xe5ce3006
        .long   0xe5ce3005
        .long   0xe5ce3004
        .long   0xe5ce3003
        .long   0xe5ce3002
        .long   0xe5ce3001
        .long   0xe082c00e
        .long   0xe7ce3002
        .long   0xe5cc3007
        .long   0xe5cc3006
        .long   0xe5cc3005
        .long   0xe5cc3004
        .long   0xe5cc3003
        .long   0xe5cc3002
        .long   0xe5cc3001
        .long   0xe082e00c
        .long   0xe7cc3002
        .long   0xe5ce3007
        .long   0xe5ce3006
        .long   0xe5ce3005
        .long   0xe5ce3004
        .long   0xe5ce3003
        .long   0xe5ce3002
        .long   0xe5ce3001
        .long   0xe082c00e
        .long   0xe7ce3002
        .long   0xe5cc3007
        .long   0xe5cc3006
        .long   0xe5cc3005
        .long   0xe5cc3004
        .long   0xe5cc3003
        .long   0xe5cc3002
        .long   0xe5cc3001
        .long   0xe082e00c
        .long   0xe5ce3007
        .long   0xe5ce3006
        .long   0xe5ce3005
        .long   0xe5ce3004
        .long   0xe5ce3003
        .long   0xe5ce3002
        .long   0xe5ce3001
        .long   0xe7cc3002
        .long   0xeafffd13
LKWF57:
        .long   0xe28d3fb9
        .long   0xe5d37001
        .long   0xe28d3fb9
        .long   0xe5d38002
        .long   0xe28d3fb9
        .long   0xe5d36004
        .long   0xe28d3fb9
        .long   0xe5d35005
        .long   0xe28d3fb9
        .long   0xe5d3c006
        .long   0xe28defb9
        .long   0xe5de4008
        .long   0xe28d9fb9
        .long   0xe5d99012
        .long   0xe28d3fb9
        .long   0xe5d33007
        .long   0xe28defb9
        .long   0xe5dee011
        .long   0xe58d90a4
        .long   0xe28d9fb9
        .long   0xe5d99013
        .long   0xe0877008
        .long   0xe0865005
        .long   0xe58d90a0
        .long   0xe28d9fb9
        .long   0xe5d99003
        .long   0xe08cc003
        .long   0xe59d30a0
        .long   0xe58d909c
        .long   0xe28d9fb9
        .long   0xe5d99014
        .long   0xe084e00e
        .long   0xe59d40a4
        .long   0xe58d9098
        .long   0xe28d9fb9
        .long   0xe5d99015
        .long   0xe0843003
        .long   0xe59d409c
        .long   0xe58d9094
        .long   0xe28d9fb9
        .long   0xe5d99016
        .long   0xe0877004
        .long   0xe59d4094
        .long   0xe58d9090
        .long   0xe28d9fb9
        .long   0xe5d99017
        .long   0xe085c00c
        .long   0xe59d5098
        .long   0xe58d908c
        .long   0xe28d9fb9
        .long   0xe5d99018
        .long   0xe08e3003
        .long   0xe087700c
        .long   0xe59dc08c
        .long   0xe59de090
        .long   0xe58d9088
        .long   0xe0854004
        .long   0xe0843003
        .long   0xe08ec00c
        .long   0xe59de088
        .long   0xe0873003
        .long   0xe28ee008
        .long   0xe08ce00e
        .long   0xe083e00e
        .long   0xe1a0324e
        .long   0xe20330ff
        .long   0xeaffff74
LKWF_bd.1.4:
        .long   0xe59d5048
        .long   0xe3a0c000
        .long   0xe28d6fb9
LKWF58:
        .long   0xe28d3fb9
        .long   0xe28d4fb9
        .long   0xe3a0e000
        .long   0xe083300c
LKWF59:
        .long   0xe08e7003
        .long   0xe5d79002
        .long   0xe5d78001
        .long   0xe5d77003
        .long   0xe0889089
        .long   0xe0897007
        .long   0xe2877002
LKWF60:
        .long   0xe1a07147
        .long   0xe7ce7005
        .long   0xe28ee001
        .long   0xe35e0008
        .long   0xaa00000b
        .long   0xe35e0007
        .long   0x0a000000
        .long   0xeafffff0
LKWF61:
        .long   0xe35c0007
        .long   0x0a000000
        .long   0xeaffffed
LKWF62:
        .long   0xe5d68010
        .long   0xe5d4700f
        .long   0xe0888088
        .long   0xe0878008
        .long   0xe2887002
        .long   0xeaffffee
LKWF63:
        .long   0xe28cc001
        .long   0xe35c0008
        .long   0xe0825005
        .long   0xbaffffdf
        .long   0xeafffcac
LKWF_bd.1.5:
        .long   0xe28defb9
        .long   0xe5de9001
        .long   0xe28d3fb9
        .long   0xe28dcfb9
        .long   0xe5dcc011
        .long   0xe5d33000
        .long   0xe28d7fb9
        .long   0xe5d77016
        .long   0xe28defb9
        .long   0xe5dee012
        .long   0xe28d4fb9
        .long   0xe5d44013
        .long   0xe28d5fb9
        .long   0xe5d55014
        .long   0xe28d6fb9
        .long   0xe5d66015
        .long   0xe089900c
        .long   0xe0899003
        .long   0xe283a002
        .long   0xe58d70a4
        .long   0xe089900a
        .long   0xe28dac03
        .long   0xe5ca3000
        .long   0xe28d3c03
        .long   0xe5c3c001
        .long   0xe28d3c03
        .long   0xe5c3e002
        .long   0xe28d3c03
        .long   0xe5c34003
        .long   0xe28d3c03
        .long   0xe5c35004
        .long   0xe28d3c03
        .long   0xe5c36005
        .long   0xe59dc0a4
        .long   0xe28d7fb9
        .long   0xe5d77017
        .long   0xe28d3c03
        .long   0xe5c3c006
        .long   0xe28d8fb9
        .long   0xe5d88018
        .long   0xe28d3c03
        .long   0xe5c37007
        .long   0xe28d3c03
        .long   0xe5c38008
        .long   0xe59dc048
        .long   0xe1a09149
        .long   0xe3a03000
LKWF64:
        .long   0xe3530000
        .long   0xda00000f
        .long   0xe28dec03
        .long   0xe3a04000
        .long   0xe08ee003
LKWF65:
        .long   0xe04e5004
        .long   0xe5557001
        .long   0xe5d56000
        .long   0xe5d55001
        .long   0xe0877006
        .long   0xe0876006
        .long   0xe0865005
        .long   0xe2855002
        .long   0xe1a05145
        .long   0xe7c4500c
        .long   0xe2844001
        .long   0xe1540003
        .long   0xbafffff2
LKWF66:
        .long   0xe2835001
        .long   0xe3550008
        .long   0xe1a04005
        .long   0xaa00000e
        .long   0xe28defb9
        .long   0xe04ee003
        .long   0xe084e00e
LKWF67:
        .long   0xe55e8001
        .long   0xe5de7000
        .long   0xe5fe6001
        .long   0xe0888007
        .long   0xe0887007
        .long   0xe0876006
        .long   0xe2866002
        .long   0xe1a06146
        .long   0xe7c4600c
        .long   0xe2844001
        .long   0xe3540008
        .long   0xbafffff3
LKWF68:
        .long   0xe7cc9003
        .long   0xe3550008
        .long   0xe1a03005
        .long   0xe082c00c
        .long   0xbaffffd5
        .long   0xeafffc52
LKWF_bd.1.6:
        .long   0xe28d3fb9
        .long   0xe5d3c001
        .long   0xe28defb9
        .long   0xe5dee000
        .long   0xe28d3fb9
        .long   0xe5d33002
        .long   0xe58de0a4
        .long   0xe28d4fb9
        .long   0xe5d44004
        .long   0xe28defb9
        .long   0xe5dee003
        .long   0xe58d40a0
        .long   0xe28d4fb9
        .long   0xe5d44005
        .long   0xe59d80a0
        .long   0xe081a102
        .long   0xe58d409c
        .long   0xe28d4fb9
        .long   0xe5d44006
        .long   0xe28d5fb9
        .long   0xe5d55007
        .long   0xe58d5098
        .long   0xe28d5fb9
        .long   0xe5d55008
        .long   0xe58d5094
        .long   0xe28d5fb9
        .long   0xe5d55011
        .long   0xe58d5090
        .long   0xe28d5fb9
        .long   0xe5d55012
        .long   0xe58d508c
        .long   0xe28d5fb9
        .long   0xe5d55013
        .long   0xe58d5088
        .long   0xe28d5fb9
        .long   0xe5d55014
        .long   0xe58d5084
        .long   0xe28d5fb9
        .long   0xe5d55015
        .long   0xe58d5080
        .long   0xe28d5fb9
        .long   0xe5d55016
        .long   0xe58d507c
        .long   0xe28d5fb9
        .long   0xe5d55017
        .long   0xe58d5078
        .long   0xe59d50a4
        .long   0xe08c5005
        .long   0xe2856001
        .long   0xe59d500c
        .long   0xe0817005
        .long   0xe59d509c
        .long   0xe0885005
        .long   0xe1a080c6
        .long   0xe5c78003
        .long   0xe5ca8002
        .long   0xe0816082
        .long   0xe5c68001
        .long   0xe5c18000
        .long   0xe08c8003
        .long   0xe2855001
        .long   0xe2888001
        .long   0xe58d5074
        .long   0xe1a080c8
        .long   0xe5c78004
        .long   0xe5ca8003
        .long   0xe5c68002
        .long   0xe5c18001
        .long   0xe59d8074
        .long   0xe083500e
        .long   0xe2855001
        .long   0xe1a080c8
        .long   0xe58d8074
        .long   0xe1a050c5
        .long   0xe5c75005
        .long   0xe5ca5004
        .long   0xe5c65003
        .long   0xe5c15002
        .long   0xe59d50a0
        .long   0xe59d80a4
        .long   0xe08e5005
        .long   0xe2855001
        .long   0xe088808c
        .long   0xe58d8070
        .long   0xe1a050c5
        .long   0xe5c75006
        .long   0xe5ca5005
        .long   0xe5c65004
        .long   0xe5c15003
        .long   0xe59d5074
        .long   0xe2838002
        .long   0xe5c75007
        .long   0xe5ca5006
        .long   0xe5c65005
        .long   0xe5c15004
        .long   0xe59d509c
        .long   0xe58d8074
        .long   0xe0855004
        .long   0xe2855001
        .long   0xe1a050c5
        .long   0xe5ca5007
        .long   0xe5c65006
        .long   0xe5c15005
        .long   0xe59d5098
        .long   0xe59d9098
        .long   0xe59d8094
        .long   0xe0845005
        .long   0xe2855001
        .long   0xe0898008
        .long   0xe1a050c5
        .long   0xe5c65007
        .long   0xe5c15006
        .long   0xe59d60a4
        .long   0xe2885001
        .long   0xe59d8090
        .long   0xe1a050c5
        .long   0xe5c15007
        .long   0xe59d5008
        .long   0xe0886086
        .long   0xe28c8002
        .long   0xe0866008
        .long   0xe0818005
        .long   0xe08cc083
        .long   0xe1a06146
        .long   0xe58d6048
        .long   0xe5c86003
        .long   0xe59d504c
        .long   0xe083308e
        .long   0xe0816005
        .long   0xe59d5048
        .long   0xe5c65002
        .long   0xe59d5050
        .long   0xe59d9048
        .long   0xe0815005
        .long   0xe5c59001
        .long   0xe59db070
        .long   0xe59d9074
        .long   0xe08b9009
        .long   0xe59db048
        .long   0xe1a09149
        .long   0xe7c1b002
        .long   0xe58d9074
        .long   0xe5c89004
        .long   0xe5c69003
        .long   0xe5c59002
        .long   0xe28eb002
        .long   0xe0829001
        .long   0xe08cc00b
        .long   0xe59db074
        .long   0xe1a0c14c
        .long   0xe5c9b001
        .long   0xe58dc074
        .long   0xe5c8c005
        .long   0xe5c6c004
        .long   0xe5c5c003
        .long   0xe59dc0a0
        .long   0xe28cc002
        .long   0xe083c00c
        .long   0xe59d3074
        .long   0xe1a0c14c
        .long   0xe5c93002
        .long   0xe58dc074
        .long   0xe5c8c006
        .long   0xe5c6c005
        .long   0xe5c5c004
        .long   0xe59d30a0
        .long   0xe59dc074
        .long   0xe08ee083
        .long   0xe59d309c
        .long   0xe5c9c003
        .long   0xe2833002
        .long   0xe08e3003
        .long   0xe1a03143
        .long   0xe5c83007
        .long   0xe5c63006
        .long   0xe5c53005
        .long   0xe59dc09c
        .long   0xe59de0a0
        .long   0xe5c93004
        .long   0xe08ec08c
        .long   0xe284e002
        .long   0xe08ce00e
        .long   0xe1a0314e
        .long   0xe5c63007
        .long   0xe5c53006
        .long   0xe59de098
        .long   0xe59dc09c
        .long   0xe5c93005
        .long   0xe28ee002
        .long   0xe08cc084
        .long   0xe08ce00e
        .long   0xe1a0314e
        .long   0xe5c53007
        .long   0xe59dc098
        .long   0xe084408c
        .long   0xe59dc094
        .long   0xe5c93006
        .long   0xe28cc002
        .long   0xe084c00c
        .long   0xe1a0c14c
        .long   0xe5c9c007
        .long   0xe59d3090
        .long   0xe59dc08c
        .long   0xe59de088
        .long   0xe08c3083
        .long   0xe59dc0a4
        .long   0xe28cc002
        .long   0xe083c00c
        .long   0xe59d308c
        .long   0xe1a0c14c
        .long   0xe5c7c002
        .long   0xe5cac001
        .long   0xe7c1c082
        .long   0xe59dc090
        .long   0xe08e3083
        .long   0xe59de084
        .long   0xe28cc002
        .long   0xe083c00c
        .long   0xe59d3088
        .long   0xe1a0c14c
        .long   0xe5c8c002
        .long   0xe5c6c001
        .long   0xe08e3083
        .long   0xe59de050
        .long   0xe7c1c00e
        .long   0xe59dc08c
        .long   0xe59de080
        .long   0xe28cc002
        .long   0xe083c00c
        .long   0xe59d3084
        .long   0xe1a0c14c
        .long   0xe5c7c001
        .long   0xe7c1c102
        .long   0xe59dc088
        .long   0xe08e3083
        .long   0xe59de07c
        .long   0xe28cc002
        .long   0xe083c00c
        .long   0xe59d3080
        .long   0xe1a0c14c
        .long   0xe5c8c001
        .long   0xe59d404c
        .long   0xe08e3083
        .long   0xe59de084
        .long   0xe7c1c004
        .long   0xe59dc07c
        .long   0xe28ee002
        .long   0xe083300e
        .long   0xe59de078
        .long   0xe1a03143
        .long   0xe08ec08c
        .long   0xe59de080
        .long   0xe28ee002
        .long   0xe08ce00e
        .long   0xe59dc00c
        .long   0xe1a0e14e
        .long   0xe7c1300c
        .long   0xe59d3008
        .long   0xe7c1e003
        .long   0xeafffb4e
LKWF_bd.1.7:
        .long   0xe28dcfb9
        .long   0xe5dcc011
        .long   0xe28d3fb9
        .long   0xe0828001
        .long   0xe58dc0a4
        .long   0xe59d40a4
        .long   0xe28dcfb9
        .long   0xe5dce013
        .long   0xe5d33000
        .long   0xe0819102
        .long   0xe58d30a0
        .long   0xe28d3fb9
        .long   0xe5d33014
        .long   0xe58d309c
        .long   0xe28d3fb9
        .long   0xe5d3c012
        .long   0xe28d3fb9
        .long   0xe5d33015
        .long   0xe58d3098
        .long   0xe28d3fb9
        .long   0xe5d33016
        .long   0xe58d3094
        .long   0xe28d3fb9
        .long   0xe5d33017
        .long   0xe59d7094
        .long   0xe58d3090
        .long   0xe28d3fb9
        .long   0xe5d33018
        .long   0xe59d5090
        .long   0xe58d308c
        .long   0xe28d3fb9
        .long   0xe5d33001
        .long   0xe0875005
        .long   0xe0817082
        .long   0xe58d3088
        .long   0xe28d3fb9
        .long   0xe5d33002
        .long   0xe58d3084
        .long   0xe28d3fb9
        .long   0xe5d33003
        .long   0xe58d3080
        .long   0xe28d3fb9
        .long   0xe5d33004
        .long   0xe58d307c
        .long   0xe28d3fb9
        .long   0xe5d33005
        .long   0xe58d3078
        .long   0xe28d3fb9
        .long   0xe5d33006
        .long   0xe58d3074
        .long   0xe28d3fb9
        .long   0xe5d33007
        .long   0xe58d5048
        .long   0xe58d3070
        .long   0xe59d30a0
        .long   0xe0843003
        .long   0xe2834001
        .long   0xe59d3050
        .long   0xe1a040c4
        .long   0xe0816003
        .long   0xe5c64006
        .long   0xe5c74004
        .long   0xe5c84002
        .long   0xe5c14000
        .long   0xe59d40a4
        .long   0xe084400c
        .long   0xe2844001
        .long   0xe1a040c4
        .long   0xe5c94006
        .long   0xe5c64004
        .long   0xe5c74002
        .long   0xe7c14002
        .long   0xe08c400e
        .long   0xe2845001
        .long   0xe59d404c
        .long   0xe1a050c5
        .long   0xe0814004
        .long   0xe5c45006
        .long   0xe5c95004
        .long   0xe5c65002
        .long   0xe7c15082
        .long   0xe59d509c
        .long   0xe08e5005
        .long   0xe285a001
        .long   0xe59d500c
        .long   0xe1a0a0ca
        .long   0xe0815005
        .long   0xe5c5a006
        .long   0xe5c4a004
        .long   0xe5c9a002
        .long   0xe7c1a003
        .long   0xe59d3098
        .long   0xe59da09c
        .long   0xe08a3003
        .long   0xe283a001
        .long   0xe59d3008
        .long   0xe1a0a0ca
        .long   0xe0813003
        .long   0xe5c3a006
        .long   0xe5c5a004
        .long   0xe5c4a002
        .long   0xe7c1a102
        .long   0xe59da094
        .long   0xe59db098
        .long   0xe08ba00a
        .long   0xe59db048
        .long   0xe28aa001
        .long   0xe28bb001
        .long   0xe58db048
        .long   0xe1a0a0ca
        .long   0xe5c3a004
        .long   0xe5c5a002
        .long   0xe59db04c
        .long   0xe7c1a00b
        .long   0xe59da048
        .long   0xe1a0a0ca
        .long   0xe5c3a002
        .long   0xe59db00c
        .long   0xe7c1a00b
        .long   0xe59db090
        .long   0xe59da08c
        .long   0xe08ba00a
        .long   0xe58da048
        .long   0xe59da088
        .long   0xe59db0a4
        .long   0xe28aa002
        .long   0xe58da03c
        .long   0xe59da0a0
        .long   0xe08ba08a
        .long   0xe58da038
        .long   0xe59da048
        .long   0xe59db038
        .long   0xe28aa001
        .long   0xe58da048
        .long   0xe59da03c
        .long   0xe08ba00a
        .long   0xe59db008
        .long   0xe58da038
        .long   0xe59da048
        .long   0xe1a0a0ca
        .long   0xe7c1a00b
        .long   0xe59da038
        .long   0xe1a0a14a
        .long   0xe5c6a007
        .long   0xe5c7a005
        .long   0xe5c8a003
        .long   0xe5c1a001
        .long   0xe59db0a0
        .long   0xe59da0a4
        .long   0xe08ba08a
        .long   0xe28cb002
        .long   0xe08aa00b
        .long   0xe59db0a4
        .long   0xe1a0a14a
        .long   0xe08bb08c
        .long   0xe58db0a4
        .long   0xe5c9a007
        .long   0xe5c6a005
        .long   0xe5c7a003
        .long   0xe5c8a001
        .long   0xe59db0a4
        .long   0xe28ea002
        .long   0xe08cc08e
        .long   0xe08ba00a
        .long   0xe58dc0a4
        .long   0xe1a0a14a
        .long   0xe5c4a007
        .long   0xe5c9a005
        .long   0xe5c6a003
        .long   0xe5c7a001
        .long   0xe59dc09c
        .long   0xe59da0a4
        .long   0xe28cc002
        .long   0xe08ac00c
        .long   0xe59da09c
        .long   0xe1a0c14c
        .long   0xe5c5c007
        .long   0xe5c4c005
        .long   0xe5c9c003
        .long   0xe5c6c001
        .long   0xe59dc098
        .long   0xe08ee08a
        .long   0xe59d609c
        .long   0xe28cc002
        .long   0xe08ee00c
        .long   0xe59dc098
        .long   0xe1a0e14e
        .long   0xe5c3e007
        .long   0xe5c5e005
        .long   0xe5c4e003
        .long   0xe5c9e001
        .long   0xe59de094
        .long   0xe086c08c
        .long   0xe59d6098
        .long   0xe28ee002
        .long   0xe08ce00e
        .long   0xe59dc094
        .long   0xe1a0e14e
        .long   0xe5c3e005
        .long   0xe5c5e003
        .long   0xe5c4e001
        .long   0xe59de090
        .long   0xe59d4094
        .long   0xe086c08c
        .long   0xe28ee002
        .long   0xe08ce00e
        .long   0xe59dc090
        .long   0xe1a0e14e
        .long   0xe5c3e003
        .long   0xe5c5e001
        .long   0xe59de08c
        .long   0xe084c08c
        .long   0xe59d4084
        .long   0xe28ee002
        .long   0xe08ce00e
        .long   0xe59dc088
        .long   0xe1a0e14e
        .long   0xe5c3e001
        .long   0xe59d30a0
        .long   0xe59de080
        .long   0xe084c08c
        .long   0xe2833002
        .long   0xe08c3003
        .long   0xe59dc084
        .long   0xe1a03143
        .long   0xe5c73006
        .long   0xe5c83004
        .long   0xe08ec08c
        .long   0xe59de03c
        .long   0xe5c13002
        .long   0xe08ce00e
        .long   0xe1a0314e
        .long   0xe5c73007
        .long   0xe5c83005
        .long   0xe59dc080
        .long   0xe59de07c
        .long   0xe08ec08c
        .long   0xe59de084
        .long   0xe5c13003
        .long   0xe28ee002
        .long   0xe08ce00e
        .long   0xe1a0314e
        .long   0xe5c83006
        .long   0xe59dc07c
        .long   0xe59de078
        .long   0xe08ec08c
        .long   0xe59de080
        .long   0xe5c13004
        .long   0xe28ee002
        .long   0xe08ce00e
        .long   0xe1a0314e
        .long   0xe5c83007
        .long   0xe59dc078
        .long   0xe59d4074
        .long   0xe59de074
        .long   0xe59d5070
        .long   0xe08ec08c
        .long   0xe59de07c
        .long   0xe0854084
        .long   0xe59d5078
        .long   0xe5c13005
        .long   0xe28ee002
        .long   0xe08ce00e
        .long   0xe2855002
        .long   0xe0845005
        .long   0xe1a0e14e
        .long   0xe1a05145
        .long   0xe5c1e006
        .long   0xe5c15007
        .long   0xeafffa40
LKWF_bd.1.8:
        .long   0xe28d3fb9
        .long   0xe5d33001
        .long   0xe28d7fb9
        .long   0xe28dcfb9
        .long   0xe58d30a4
        .long   0xe59d90a4
        .long   0xe28d3fb9
        .long   0xe5d33002
        .long   0xe28defb9
        .long   0xe28d8fb9
        .long   0xe58d30a0
        .long   0xe28d3fb9
        .long   0xe5d36003
        .long   0xe28d3fb9
        .long   0xe5d35004
        .long   0xe28d3fb9
        .long   0xe5d33009
        .long   0xe58d309c
        .long   0xe5dc4006
        .long   0xe28d3fb9
        .long   0xe5d33005
        .long   0xe28dcfb9
        .long   0xe5dcc007
        .long   0xe5dee008
        .long   0xe58de098
        .long   0xe28defb9
        .long   0xe5dee00a
        .long   0xe58de094
        .long   0xe28defb9
        .long   0xe5d7700c
        .long   0xe5dee00b
        .long   0xe58d7090
        .long   0xe59d70a0
        .long   0xe5d8800d
        .long   0xe58d808c
        .long   0xe59d80a0
        .long   0xe0897007
        .long   0xe2877001
        .long   0xe0888006
        .long   0xe1a070c7
        .long   0xe5c17000
        .long   0xe2888001
        .long   0xe0867005
        .long   0xe1a080c8
        .long   0xe7c18082
        .long   0xe2877001
        .long   0xe5c18001
        .long   0xe1a090c7
        .long   0xe7c19102
        .long   0xe0817082
        .long   0xe5c79001
        .long   0xe5c19002
        .long   0xe59da00c
        .long   0xe0859003
        .long   0xe289b001
        .long   0xe0818102
        .long   0xe081900a
        .long   0xe1a0b0cb
        .long   0xe7c1b00a
        .long   0xe5c8b001
        .long   0xe5c7b002
        .long   0xe5c1b003
        .long   0xe083a004
        .long   0xe28aa001
        .long   0xe58da088
        .long   0xe59db09c
        .long   0xe59da094
        .long   0xe08ba00a
        .long   0xe58da084
        .long   0xe59da088
        .long   0xe1a0a0ca
        .long   0xe5c9a001
        .long   0xe5c8a002
        .long   0xe5c7a003
        .long   0xe5c1a004
        .long   0xe59db084
        .long   0xe084a00c
        .long   0xe28aa001
        .long   0xe28bb001
        .long   0xe58db088
        .long   0xe1a0a0ca
        .long   0xe5c9a002
        .long   0xe5c8a003
        .long   0xe5c7a004
        .long   0xe5c1a005
        .long   0xe59da098
        .long   0xe59db088
        .long   0xe08ca00a
        .long   0xe28aa001
        .long   0xe1a0b0cb
        .long   0xe58db088
        .long   0xe1a0a0ca
        .long   0xe5c9a003
        .long   0xe5c8a004
        .long   0xe5c7a005
        .long   0xe5c1a006
        .long   0xe59da09c
        .long   0xe59db098
        .long   0xe08ba00a
        .long   0xe59db094
        .long   0xe28aa001
        .long   0xe08bb00e
        .long   0xe58db084
        .long   0xe1a0a0ca
        .long   0xe5c9a004
        .long   0xe5c8a005
        .long   0xe5c7a006
        .long   0xe5c1a007
        .long   0xe59da088
        .long   0xe5c9a005
        .long   0xe5c8a006
        .long   0xe5c7a007
        .long   0xe59d7084
        .long   0xe287a001
        .long   0xe59d7090
        .long   0xe1a0a0ca
        .long   0xe5c9a006
        .long   0xe5c8a007
        .long   0xe59d80a0
        .long   0xe59da0a4
        .long   0xe08e7007
        .long   0xe2877001
        .long   0xe08a8088
        .long   0xe58d80a4
        .long   0xe1a070c7
        .long   0xe5c97007
        .long   0xe59d70a0
        .long   0xe2859002
        .long   0xe0878086
        .long   0xe2867002
        .long   0xe0888009
        .long   0xe59d90a4
        .long   0xe0866085
        .long   0xe1a08148
        .long   0xe0855083
        .long   0xe0899007
        .long   0xe0827001
        .long   0xe5c78001
        .long   0xe1a09149
        .long   0xe7c19002
        .long   0xe59da050
        .long   0xe2839002
        .long   0xe0869009
        .long   0xe7c1800a
        .long   0xe081600a
        .long   0xe1a09149
        .long   0xe5c69001
        .long   0xe2848002
        .long   0xe5c79002
        .long   0xe0858008
        .long   0xe59d504c
        .long   0xe1a08148
        .long   0xe0833084
        .long   0xe7c19005
        .long   0xe5c68002
        .long   0xe5c78003
        .long   0xe28c9002
        .long   0xe0815005
        .long   0xe5c58001
        .long   0xe0839009
        .long   0xe59d3008
        .long   0xe084408c
        .long   0xe7c18003
        .long   0xe1a08149
        .long   0xe5c68003
        .long   0xe5c78004
        .long   0xe5c58002
        .long   0xe59d9098
        .long   0xe0813003
        .long   0xe5c38001
        .long   0xe2899002
        .long   0xe0849009
        .long   0xe1a04149
        .long   0xe5c64004
        .long   0xe5c74005
        .long   0xe5c54003
        .long   0xe59d8098
        .long   0xe08cc088
        .long   0xe59d809c
        .long   0xe5c34002
        .long   0xe2888002
        .long   0xe08c8008
        .long   0xe1a0c148
        .long   0xe5c6c005
        .long   0xe5c7c006
        .long   0xe5c5c004
        .long   0xe59d409c
        .long   0xe59d8098
        .long   0xe0884084
        .long   0xe59d8094
        .long   0xe5c3c003
        .long   0xe2888002
        .long   0xe0848008
        .long   0xe1a0c148
        .long   0xe5c6c006
        .long   0xe5c7c007
        .long   0xe5c5c005
        .long   0xe59d4094
        .long   0xe59d709c
        .long   0xe5c3c004
        .long   0xe0874084
        .long   0xe28e7002
        .long   0xe0847007
        .long   0xe1a0c147
        .long   0xe5c6c007
        .long   0xe5c5c006
        .long   0xe59d4094
        .long   0xe59d6090
        .long   0xe5c3c005
        .long   0xe084408e
        .long   0xe2866002
        .long   0xe0846006
        .long   0xe59d4090
        .long   0xe1a0c146
        .long   0xe08ee084
        .long   0xe59d408c
        .long   0xe5c5c007
        .long   0xe5c3c006
        .long   0xe2844002
        .long   0xe08e4004
        .long   0xe1a04144
        .long   0xe5c34007
        .long   0xeafff961
LKWF_bd.1.9:
        .long   0xe28d3fb9
        .long   0xe5d33011
        .long   0xe0829001
        .long   0xe58d30a4
        .long   0xe28d3fb9
        .long   0xe5d33012
        .long   0xe59dc0a4
        .long   0xe58d30a0
        .long   0xe28d3fb9
        .long   0xe5d35013
        .long   0xe28d3fb9
        .long   0xe5d36014
        .long   0xe28d3fb9
        .long   0xe5d33015
        .long   0xe58d309c
        .long   0xe28d3fb9
        .long   0xe5d38016
        .long   0xe28d3fb9
        .long   0xe5d37017
        .long   0xe28d3fb9
        .long   0xe5d33018
        .long   0xe58d3098
        .long   0xe59d30a0
        .long   0xe08c3003
        .long   0xe59dc0a0
        .long   0xe2833001
        .long   0xe08cc005
        .long   0xe28cc001
        .long   0xe1a030c3
        .long   0xe5c13000
        .long   0xe1a0c0cc
        .long   0xe7c1c002
        .long   0xe5c1c002
        .long   0xe0853006
        .long   0xe283c001
        .long   0xe59d3098
        .long   0xe1a0c0cc
        .long   0xe7c1c082
        .long   0xe5c9c002
        .long   0xe5c1c004
        .long   0xe59dc09c
        .long   0xe0833083
        .long   0xe0873003
        .long   0xe58d3094
        .long   0xe086c00c
        .long   0xe28cc001
        .long   0xe0813082
        .long   0xe1a0e0cc
        .long   0xe59dc050
        .long   0xe7c1e00c
        .long   0xe5c3e002
        .long   0xe5c9e004
        .long   0xe5c1e006
        .long   0xe59de09c
        .long   0xe59d4094
        .long   0xe08ee008
        .long   0xe28ee001
        .long   0xe2844002
        .long   0xe58d4094
        .long   0xe1a040ce
        .long   0xe7c14102
        .long   0xe081e00c
        .long   0xe5ce4002
        .long   0xe5c34004
        .long   0xe5c94006
        .long   0xe59d4094
        .long   0xe088c007
        .long   0xe28cc001
        .long   0xe1a04144
        .long   0xe1a0a0cc
        .long   0xe59dc04c
        .long   0xe58d4094
        .long   0xe0814102
        .long   0xe7c1a00c
        .long   0xe5c4a002
        .long   0xe5cea004
        .long   0xe5c3a006
        .long   0xe59da098
        .long   0xe59db0a4
        .long   0xe081c00c
        .long   0xe087a00a
        .long   0xe28aa001
        .long   0xe58da090
        .long   0xe59da0a0
        .long   0xe08ba08a
        .long   0xe59db00c
        .long   0xe58da0a4
        .long   0xe59da090
        .long   0xe1a0a0ca
        .long   0xe7c1a00b
        .long   0xe5cca002
        .long   0xe5c4a004
        .long   0xe5cea006
        .long   0xe081a00b
        .long   0xe59db094
        .long   0xe58da090
        .long   0xe5cab001
        .long   0xe5ccb003
        .long   0xe5c4b005
        .long   0xe285a002
        .long   0xe58da08c
        .long   0xe59da0a0
        .long   0xe59db0a4
        .long   0xe08aa085
        .long   0xe58da0a0
        .long   0xe286a002
        .long   0xe58da088
        .long   0xe59da08c
        .long   0xe0855086
        .long   0xe08ba00a
        .long   0xe58da0a4
        .long   0xe59da094
        .long   0xe5cea007
        .long   0xe59da088
        .long   0xe59db0a0
        .long   0xe08ba00a
        .long   0xe58da0a0
        .long   0xe59da0a4
        .long   0xe1a0a14a
        .long   0xe5c1a001
        .long   0xe59da0a0
        .long   0xe1a0a14a
        .long   0xe58da0a4
        .long   0xe5c9a001
        .long   0xe59da09c
        .long   0xe28aa002
        .long   0xe085a00a
        .long   0xe59d50a4
        .long   0xe1a0a14a
        .long   0xe5c15003
        .long   0xe58da0a4
        .long   0xe5c3a001
        .long   0xe5c9a003
        .long   0xe59d509c
        .long   0xe0866085
        .long   0xe2885002
        .long   0xe0865005
        .long   0xe59d60a4
        .long   0xe1a05145
        .long   0xe5c16005
        .long   0xe5ce5001
        .long   0xe5c35003
        .long   0xe5c95005
        .long   0xe5c15007
        .long   0xe59d509c
        .long   0xe2876002
        .long   0xe0887087
        .long   0xe0855088
        .long   0xe0855006
        .long   0xe1a05145
        .long   0xe5c45001
        .long   0xe5ce5003
        .long   0xe5c35005
        .long   0xe5c95007
        .long   0xe59d5098
        .long   0xe59d6008
        .long   0xe2855002
        .long   0xe0877005
        .long   0xe1a07147
        .long   0xe5cc7001
        .long   0xe5c47003
        .long   0xe5ce7005
        .long   0xe5c37007
        .long   0xe59d3098
        .long   0xe0815006
        .long   0xe5c53007
        .long   0xe59de090
        .long   0xe5ce3007
        .long   0xe5cc3007
        .long   0xe5c43007
        .long   0xe5c53006
        .long   0xe5ce3006
        .long   0xe5cc3006
        .long   0xe5c43006
        .long   0xe5c53005
        .long   0xe59de090
        .long   0xe5ce3005
        .long   0xe5cc3005
        .long   0xe5c53004
        .long   0xe5ce3004
        .long   0xe5cc3004
        .long   0xe5c53003
        .long   0xe59dc090
        .long   0xe5cc3003
        .long   0xe5c53002
        .long   0xe5cc3002
        .long   0xe5c53001
        .long   0xe7c13006
        .long   0xeafff8a4
LKWF69:
        mvn     r0, #7
        add     sp, sp, #0xC3, 30
        ldmia   sp!, {r4 - r11, pc}
LKWF_bt.1:
        .long   0x00000024
        .long   0x000009d4
        .long   0x00000b34
        .long   0x00000e64
        .long   0x00000ef4
        .long   0x0000105c
        .long   0x0000146c
        .long   0x000018a4
        .long   0x00001c20