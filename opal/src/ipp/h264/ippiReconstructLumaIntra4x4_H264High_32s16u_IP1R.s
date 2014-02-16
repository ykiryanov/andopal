        .text
        .align  4
        .globl  ippiReconstructLumaIntra4x4_H264High_32s16u_IP1R


ippiReconstructLumaIntra4x4_H264High_32s16u_IP1R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x8C
        cmp     r0, #0
        mov     r4, r2
        beq     LKVV86
        ldr     r3, [r0]
        cmp     r3, #0
        beq     LKVV86
        ldr     r10, [r0, #4]
        cmp     r10, #0
        beq     LKVV86
        cmp     r1, #0
        beq     LKVV86
        ldr     r3, [r3]
        cmp     r3, #0
        beq     LKVV86
        ldr     r12, [r0, #0x14]
        cmp     r12, #0
        beq     LKVV86
        ldr     lr, [r0, #8]
        cmp     lr, #0
        ble     LKVV85
        ldr     r12, [r0, #0x10]
        cmp     r12, #0
        blt     LKVV0
        ldr     r5, [r0, #0x1C]
        add     r6, r5, r5, lsl #2
        add     r6, r5, r6
        add     r5, r6, #3
        cmp     r12, r5
        ble     LKVV1
LKVV0:
        mvn     r0, #0xA
        add     sp, sp, #0x8C
        ldmia   sp!, {r4 - r11, pc}
LKVV1:
        ldr     r12, [pc, #0xF58]
        ldr     r7, [pc, #0xF58]
        ldr     r6, [pc, #0xF58]
        ldr     r5, [pc, #0xF58]
        str     r12, [sp, #0x20]
        and     r12, r4, #0x20
        str     r12, [sp, #0x14]
        mov     r2, #0
        and     r12, r4, #1
        and     r11, r4, #4
        mov     r9, #2
        mov     r8, r2
        str     r2, [sp, #0x44]
        str     r11, [sp, #0x1C]
        str     r12, [sp, #0x18]
        str     r3, [sp, #8]
        str     r4, [sp]
LKVV2:
        ldr     r2, [r1], #4
        ldrb    r3, [r7], #1
        str     r2, [sp, #0x30]
        ldrb    r2, [r6], #1
        cmp     r3, #0
        beq     LKVV3
        ldr     r3, [sp, #0x1C]
        cmp     r3, #0
        movne   r3, #1
        bne     LKVV4
LKVV3:
        mov     r3, #0
LKVV4:
        cmp     r2, #0
        beq     LKVV5
        ldr     r2, [sp, #0x18]
        cmp     r2, #0
        movne   r12, #1
        bne     LKVV6
LKVV5:
        cmp     r3, #0
        movne   r12, #0
        beq     LKVV7
LKVV6:
        cmp     r8, #0
        bne     LKVV8
        ldr     r2, [sp]
        tst     r2, #0x10
        bne     LKVV8
        b       LKVV9
LKVV7:
        ldr     r2, [sp]
        tst     r2, #0x10
        moveq   r12, #0
        beq     LKVV9
        cmp     r8, #0
        movne   r12, #0
        moveq   r12, #0
        bne     LKVV9
LKVV8:
        mov     r4, #1
        b       LKVV10
LKVV9:
        mov     r4, #0
LKVV10:
        cmp     r3, #0
        beq     LKVV11
        cmp     r8, #5
        bne     LKVV12
LKVV11:
        ldrb    r2, [r5]
        cmp     r2, #0
        beq     LKVV12
        ldr     r2, [sp, #0x14]
        cmp     r2, #0
        beq     LKVV13
        cmp     r8, #5
        bne     LKVV13
LKVV12:
        mov     r2, #1
        b       LKVV14
LKVV13:
        mov     r2, #0
LKVV14:
        cmp     r3, #0
        mov     r3, #0
        mov     r11, #1
        moveq   r3, r11
        cmp     r12, #0
        mov     r12, #0
        mov     r11, #1
        moveq   r12, r11
        str     r12, [sp, #0x40]
        cmp     r4, #0
        mov     r12, #0
        mov     r4, #1
        moveq   r12, r4
        ldr     r4, [pc, #0xE20]
        cmp     r2, #0
        mov     r2, #1
        str     r4, [sp, #0x3C]
        mov     r4, #0
        moveq   r4, r2
        ldr     r2, [sp, #0x30]
        ldr     r11, [sp, #0x3C]
        sub     r2, r2, #9
        adds    r2, #9							@//SB        cmn     r2, #9
        ldrcs   r2, [r11, +r2, lsl #2]
        ldr     r11, [sp, #0x40]
        orr     r11, r3, r11, lsl #1
        orr     r12, r11, r12, lsl #5
        orr     r12, r12, r4, lsl #6
        mov     r3, r10
        addcs   pc, pc, r2
        mvn     r0, #0xA
LKVV_.Lpc1:
        add     sp, sp, #0x8C
        ldmia   sp!, {r4 - r11, pc}
LKVV_bd.1.1:
        .long   0xe31c0001
        .long   0x0a000042
        .long   0xe04a208e
        .long   0xe1d220b0
        .long   0xe08e310e
        .long   0xe08e3003
        .long   0xe18a20b3
        .long   0xe5903008
        .long   0xe1a03103
        .long   0xe18a20b3
        .long   0xe5903008
        .long   0xe1a03083
        .long   0xe18a20b3
        .long   0xe1ca20b0
        .long   0xe5903008
        .long   0xe2632000
        .long   0xe1a02082
        .long   0xe2822002
        .long   0xe19a20b2
        .long   0xe0833083
        .long   0xe1a03083
        .long   0xe2833002
        .long   0xe18a20b3
        .long   0xe5903008
        .long   0xe1a03103
        .long   0xe2833002
        .long   0xe18a20b3
        .long   0xe5903008
        .long   0xe1a03083
        .long   0xe2833002
        .long   0xe18a20b3
        .long   0xe1ca20b2
        .long   0xe5903008
        .long   0xe2632000
        .long   0xe1a02082
        .long   0xe2822004
        .long   0xe19a20b2
        .long   0xe0833083
        .long   0xe1a03083
        .long   0xe2833004
        .long   0xe18a20b3
        .long   0xe5903008
        .long   0xe1a03103
        .long   0xe2833004
        .long   0xe18a20b3
        .long   0xe5903008
        .long   0xe1a03083
        .long   0xe2833004
        .long   0xe18a20b3
        .long   0xe1ca20b4
        .long   0xe5903008
        .long   0xe2632000
        .long   0xe1a02082
        .long   0xe2822006
        .long   0xe19a20b2
        .long   0xe0833083
        .long   0xe1a03083
        .long   0xe2833006
        .long   0xe18a20b3
        .long   0xe5903008
        .long   0xe1a03103
        .long   0xe2833006
        .long   0xe18a20b3
        .long   0xe5903008
        .long   0xe1a03083
        .long   0xe2833006
        .long   0xe18a20b3
        .long   0xe1ca20b6
        .long   0xea000027
LKVV15:
        .long   0xe590201c
        .long   0xe3a0300b
        .long   0xe58d3044
        .long   0xe2422001
        .long   0xe3a03001
        .long   0xe1a02213
        .long   0xe1ca20b6
        .long   0xe1ca20b4
        .long   0xe1ca20b2
        .long   0xe1ca20b0
        .long   0xe590c01c
        .long   0xe5902008
        .long   0xe24cc001
        .long   0xe1a0cc13
        .long   0xe1a02082
        .long   0xe082e00a
        .long   0xe18ac0b2
        .long   0xe1cec0b6
        .long   0xe1cec0b4
        .long   0xe1cec0b2
        .long   0xe590401c
        .long   0xe5902008
        .long   0xe2444001
        .long   0xe1a04413
        .long   0xe1a0c082
        .long   0xe08c200e
        .long   0xe18e40bc
        .long   0xe1c240b6
        .long   0xe1c240b4
        .long   0xe1c240b2
        .long   0xe590401c
        .long   0xe590c008
        .long   0xe2444001
        .long   0xe1a04413
        .long   0xe1a0c08c
        .long   0xe08ce002
        .long   0xe1ce40b6
        .long   0xe1ce40b4
        .long   0xe1ce40b2
        .long   0xe18240bc
LKVV16:
        .long   0xe590200c
        .long   0xe1120009
        .long   0x0590e008
        .long   0x0a00002f
        .long   0xe5902018
        .long   0xe3520000
        .long   0x05903010
        .long   0x0a000002
        .long   0xe5903010
        .long   0xe3530000
        .long   0xda000118
LKVV17:
        .long   0xe59fcbf4
        .long   0xe3a02000
        .long   0xe58d2040
        .long   0xe0cecc93
        .long   0xe04ecfc3
        .long   0xe26c3003
        .long   0xe58d900c
        .long   0xe58da004
        .long   0xe59d9040
        .long   0xe59da008
        .long   0xe3a0e001
        .long   0xe1a0331e
        .long   0xe24c4004
        .long   0xe26ce004
        .long   0xe58d7024
        .long   0xe58d8010
LKVV18:
        .long   0xe79a7109
        .long   0xe1a08109
        .long   0xe3570000
        .long   0x0a000010
        .long   0xe590b014
        .long   0xe1a02089
        .long   0xe35c0004
        .long   0xe19b20f2
        .long   0xa0020297
        .long   0xa1a02412
        .long   0xaa000001
        .long   0xe0223297
        .long   0xe1a02e52
LKVV19:
        .long   0xe3590000
        .long   0xe78a2008
        .long   0xda0000ee
        .long   0xe2899001
        .long   0xe3590010
        .long   0xb3a02001
        .long   0xbaffffeb
        .long   0xea000015
LKVV20:
        .long   0xe2899001
        .long   0xe3590010
        .long   0xbaffffe7
        .long   0xea000160
LKVV21:
        .long   0xe59dc020
        .long   0xe2888001
        .long   0xe2855001
        .long   0xe1dc20d1
        .long   0xe1fc30d2
        .long   0xe58dc020
        .long   0xe022239e
        .long   0xe3580010
        .long   0xe1a09089
        .long   0xe08aa082
        .long   0x3afffefe
        .long   0xe5901000
        .long   0xe59d2044
        .long   0xe59d3008
        .long   0xe1a00002
        .long   0xe5813000
        .long   0xe28dd08c
        .long   0xe8bd8ff0
LKVV22:
        .long   0xe58da008
        .long   0xe59d7024
        .long   0xe59d8010
        .long   0xe59d900c
        .long   0xe59da004
        .long   0xe5902018
LKVV23:
        .long   0xe59db008
        .long   0xe28d407c
        .long   0xe3520000
        .long   0xe584b000
        .long   0xe28d407c
        .long   0xe28be010
        .long   0xe584e004
        .long   0xe28d407c
        .long   0xe28bc020
        .long   0xe584c008
        .long   0xe28b3030
        .long   0xe28d407c
        .long   0xe3a02000
        .long   0xe584300c
        .long   0x0a000002
        .long   0xe5904010
        .long   0xe3540000
        .long   0xda00004a
LKVV24:
        .long   0xe1a04002
        .long   0xe58d6028
        .long   0xe58d7024
        .long   0xe58d8010
        .long   0xe58d900c
        .long   0xe58da004
        .long   0xe58d0048
LKVV25:
        .long   0xe28d007c
        .long   0xe7900104
        .long   0xe2844001
        .long   0xe3540003
        .long   0xe5906008
        .long   0xe5908000
        .long   0xe5909004
        .long   0xe590a00c
        .long   0xe0887006
        .long   0xe0486006
        .long   0xe06a80c9
        .long   0xe08990ca
        .long   0xe087b009
        .long   0xe086a008
        .long   0xe0466008
        .long   0xe0477009
        .long   0xe580b000
        .long   0xe580a004
        .long   0xe5806008
        .long   0xe580700c
        .long   0xdaffffea
        .long   0xe59da004
        .long   0xe59d6028
        .long   0xe59d7024
        .long   0xe59d8010
        .long   0xe59d900c
        .long   0xe59d0048
        .long   0xe58da004
        .long   0xe59da008
        .long   0xe3a04000
        .long   0xe58d6028
        .long   0xe58d7024
        .long   0xe58d8010
        .long   0xe58d900c
        .long   0xe58d0048
LKVV26:
        .long   0xe79a6104
        .long   0xe59c7000
        .long   0xe59e0000
        .long   0xe593b000
        .long   0xe0868007
        .long   0xe0466007
        .long   0xe08090cb
        .long   0xe06b00c0
        .long   0xe0887009
        .long   0xe086b000
        .long   0xe2877020
        .long   0xe0466000
        .long   0xe28bb020
        .long   0xe1a07347
        .long   0xe78a7104
        .long   0xe2860020
        .long   0xe1a0b34b
        .long   0xe48eb004
        .long   0xe1a00340
        .long   0xe0488009
        .long   0xe48c0004
        .long   0xe2888020
        .long   0xe2844001
        .long   0xe1a00348
        .long   0xe4830004
        .long   0xe3540003
        .long   0xdaffffe4
        .long   0xe59d6028
        .long   0xe59d7024
        .long   0xe59d8010
        .long   0xe59d900c
        .long   0xe59da004
        .long   0xe59d0048
LKVV27:
        .long   0xe1a0300a
        .long   0xe58d900c
        .long   0xe58da004
        .long   0xe3a0c001
LKVV28:
        .long   0xe590401c
        .long   0xe28de07c
        .long   0xe79ee102
        .long   0xe1d390b0
        .long   0xe1a0441c
        .long   0xe59eb000
        .long   0xe264a001
        .long   0xe2444001
        .long   0xe15b000a
        .long   0xc1a0a00b
        .long   0xe154000a
        .long   0xe1a0b00a
        .long   0xb1a0b004
        .long   0xe089b00b
        .long   0xe154000b
        .long   0xba000008
        .long   0xe154000a
        .long   0xe1a0b00a
        .long   0xb1a0b004
        .long   0xe099b00b
        .long   0x43a04000
        .long   0x4a000002
        .long   0xe154000a
        .long   0xb1a0a004
        .long   0xe08a4009
LKVV29:
        .long   0xe1c340b0
        .long   0xe590901c
        .long   0xe59ea004
        .long   0xe1d340b2
        .long   0xe1a0b91c
        .long   0xe26b9001
        .long   0xe15a0009
        .long   0xc1a0900a
        .long   0xe24ba001
        .long   0xe15a0009
        .long   0xe1a0b009
        .long   0xb1a0b00a
        .long   0xe084b00b
        .long   0xe15a000b
        .long   0xba000008
        .long   0xe15a0009
        .long   0xe1a0b009
        .long   0xb1a0b00a
        .long   0xe094b00b
        .long   0x43a0a000
        .long   0x4a000002
        .long   0xe15a0009
        .long   0xb1a0900a
        .long   0xe084a009
LKVV30:
        .long   0xe1c3a0b2
        .long   0xe590901c
        .long   0xe59ea008
        .long   0xe1d340b4
        .long   0xe1a0b91c
        .long   0xe26b9001
        .long   0xe15a0009
        .long   0xc1a0900a
        .long   0xe24ba001
        .long   0xe15a0009
        .long   0xe1a0b009
        .long   0xb1a0b00a
        .long   0xe084b00b
        .long   0xe15a000b
        .long   0xba000008
        .long   0xe15a0009
        .long   0xe1a0b009
        .long   0xb1a0b00a
        .long   0xe094b00b
        .long   0x43a0a000
        .long   0x4a000002
        .long   0xe15a0009
        .long   0xb1a0900a
        .long   0xe084a009
LKVV31:
        .long   0xe1c3a0b4
        .long   0xe590901c
        .long   0xe59ee00c
        .long   0xe1d340b6
        .long   0xe1a0a91c
        .long   0xe26a9001
        .long   0xe15e0009
        .long   0xc1a0900e
        .long   0xe24ae001
        .long   0xe15e0009
        .long   0xe1a0a009
        .long   0xb1a0a00e
        .long   0xe084a00a
        .long   0xe15e000a
        .long   0xba000008
        .long   0xe15e0009
        .long   0xe1a0a009
        .long   0xb1a0a00e
        .long   0xe094a00a
        .long   0x43a0e000
        .long   0x4a000002
        .long   0xe15e0009
        .long   0xb1a0900e
        .long   0xe084e009
LKVV32:
        .long   0xe1c3e0b6
        .long   0xe590e008
        .long   0xe2822001
        .long   0xe3520004
        .long   0xe083308e
        .long   0xbaffff98
        .long   0xe59d900c
        .long   0xe59da004
LKVV33:
        .long   0xe59d2008
        .long   0xe2822040
        .long   0xe58d2008
        .long   0xeaffff19
LKVV34:
        .long   0xe2899001
        .long   0xe3590010
        .long   0xb3a02000
        .long   0xbafffefc
        .long   0xe58da008
        .long   0xe59d7024
        .long   0xe59d8010
        .long   0xe59d900c
        .long   0xe59da004
        .long   0xe5903010
LKVV35:
        .long   0xe3530000
        .long   0x1a000002
        .long   0xe5902018
        .long   0xe3520000
        .long   0x1affff22
LKVV36:
        .long   0xe59d2008
        .long   0xe1a0c00a
        .long   0xe3a03004
        .long   0xe5922000
        .long   0xe58d900c
        .long   0xe58da004
        .long   0xe3a04001
        .long   0xe2822020
        .long   0xe1a02342
LKVV37:
        .long   0xe590e01c
        .long   0xe1dc90b0
        .long   0xe1a0ee14
        .long   0xe26ea001
        .long   0xe152000a
        .long   0xc1a0a002
        .long   0xe24ee001
        .long   0xe15e000a
        .long   0xe1a0b00a
        .long   0xb1a0b00e
        .long   0xe089b00b
        .long   0xe15e000b
        .long   0xba000008
        .long   0xe15e000a
        .long   0xe1a0b00a
        .long   0xb1a0b00e
        .long   0xe099b00b
        .long   0x43a0e000
        .long   0x4a000002
        .long   0xe15e000a
        .long   0xb1a0a00e
        .long   0xe089e00a
LKVV38:
        .long   0xe1cce0b0
        .long   0xe590e01c
        .long   0xe1dc90b2
        .long   0xe1a0ee14
        .long   0xe26ea001
        .long   0xe152000a
        .long   0xc1a0a002
        .long   0xe24ee001
        .long   0xe15e000a
        .long   0xe1a0b00a
        .long   0xb1a0b00e
        .long   0xe089b00b
        .long   0xe15e000b
        .long   0xba000008
        .long   0xe15e000a
        .long   0xe1a0b00a
        .long   0xb1a0b00e
        .long   0xe099b00b
        .long   0x43a0e000
        .long   0x4a000002
        .long   0xe15e000a
        .long   0xb1a0a00e
        .long   0xe089e00a
LKVV39:
        .long   0xe1cce0b2
        .long   0xe590e01c
        .long   0xe1dc90b4
        .long   0xe1a0ee14
        .long   0xe26ea001
        .long   0xe152000a
        .long   0xc1a0a002
        .long   0xe24ee001
        .long   0xe15e000a
        .long   0xe1a0b00a
        .long   0xb1a0b00e
        .long   0xe089b00b
        .long   0xe15e000b
        .long   0xba000008
        .long   0xe15e000a
        .long   0xe1a0b00a
        .long   0xb1a0b00e
        .long   0xe099b00b
        .long   0x43a0e000
        .long   0x4a000002
        .long   0xe15e000a
        .long   0xb1a0a00e
        .long   0xe089e00a
LKVV40:
        .long   0xe1cce0b4
        .long   0xe590e01c
        .long   0xe1dc90b6
        .long   0xe1a0ee14
        .long   0xe26ea001
        .long   0xe152000a
        .long   0xc1a0a002
        .long   0xe24ee001
        .long   0xe15e000a
        .long   0xe1a0b00a
        .long   0xb1a0b00e
        .long   0xe089b00b
        .long   0xe15e000b
        .long   0xba000008
        .long   0xe15e000a
        .long   0xe1a0b00a
        .long   0xb1a0b00e
        .long   0xe099b00b
        .long   0x43a0e000
        .long   0x4a000002
        .long   0xe15e000a
        .long   0xb1a0a00e
        .long   0xe089e00a
LKVV41:
        .long   0xe1cce0b6
        .long   0xe590e008
        .long   0xe2533001
        .long   0xe08cc08e
        .long   0x1affff9f
        .long   0xe59d900c
        .long   0xe59da004
        .long   0xeaffff80
LKVV42:
        .long   0xe58da008
        .long   0xe59d7024
        .long   0xe59d8010
        .long   0xe59d900c
        .long   0xe59da004
        .long   0xe3520000
        .long   0x05903010
        .long   0x15902018
        .long   0x1afffead
        .long   0xeaffff84
LKVV_bd.1.2:
        .long   0xe31c0002
        .long   0x0a00001d
        .long   0xe15a20b2
        .long   0xe1ca20b6
        .long   0xe1ca20b4
        .long   0xe1ca20b2
        .long   0xe1ca20b0
        .long   0xe5902008
        .long   0xe1a03082
        .long   0xe083200a
        .long   0xe152c0b2
        .long   0xe18ac0b3
        .long   0xe1c2c0b6
        .long   0xe1c2c0b4
        .long   0xe1c2c0b2
        .long   0xe5903008
        .long   0xe1a0c083
        .long   0xe08c3002
        .long   0xe153e0b2
        .long   0xe182e0bc
        .long   0xe1c3e0b6
        .long   0xe1c3e0b4
        .long   0xe1c3e0b2
        .long   0xe5902008
        .long   0xe1a02082
        .long   0xe082e003
        .long   0xe15ec0b2
        .long   0xe1cec0b6
        .long   0xe1cec0b4
        .long   0xe1cec0b2
        .long   0xe183c0b2
        .long   0xeafffe40
LKVV43:
        .long   0xe590201c
        .long   0xe3a0300b
        .long   0xe58d3044
        .long   0xe2422001
        .long   0xe3a03001
        .long   0xe1a02213
        .long   0xe1ca20b6
        .long   0xe1ca20b4
        .long   0xe1ca20b2
        .long   0xe1ca20b0
        .long   0xe590c01c
        .long   0xe5902008
        .long   0xe24cc001
        .long   0xe1a0cc13
        .long   0xe1a02082
        .long   0xe082e00a
        .long   0xe18ac0b2
        .long   0xe1cec0b6
        .long   0xe1cec0b4
        .long   0xe1cec0b2
        .long   0xe590401c
        .long   0xe5902008
        .long   0xe2444001
        .long   0xe1a04413
        .long   0xe1a0c082
        .long   0xe08c200e
        .long   0xe18e40bc
        .long   0xe1c240b6
        .long   0xe1c240b4
        .long   0xe1c240b2
        .long   0xe590401c
        .long   0xe590c008
        .long   0xe2444001
        .long   0xe1a04413
        .long   0xe1a0c08c
        .long   0xe08ce002
        .long   0xe1ce40b6
        .long   0xe1ce40b4
        .long   0xe1ce40b2
        .long   0xe18240bc
        .long   0xeafffe17
LKVV_bd.1.3:
        .long   0xe20c2003
        .long   0xe3520003
        .long   0x0a00004c
        .long   0xe31c0001
        .long   0x0a000012
        .long   0xe26e2000
        .long   0xe04ae08e
        .long   0xe1dee0b0
        .long   0xe1a02082
        .long   0xe2823002
        .long   0xe58de040
        .long   0xe19a30b3
        .long   0xe59de040
        .long   0xe282c004
        .long   0xe19ac0bc
        .long   0xe2822006
        .long   0xe19a20b2
        .long   0xe08e3003
        .long   0xe083c00c
        .long   0xe08c2002
        .long   0xe2822002
        .long   0xe1a02142
        .long   0xe3c22803
        .long   0xea00001d
LKVV44:
        .long   0xe31c0002
        .long   0x0a000015
        .long   0xe15a30b2
        .long   0xe1a0208e
        .long   0xe2422002
        .long   0xe58d3040
        .long   0xe19a20b2
        .long   0xe58d203c
        .long   0xe1a0210e
        .long   0xe08ee08e
        .long   0xe59dc03c
        .long   0xe1a0e08e
        .long   0xe2422002
        .long   0xe19a20b2
        .long   0xe24e3002
        .long   0xe19a30b3
        .long   0xe59de040
        .long   0xe08ec00c
        .long   0xe08c2002
        .long   0xe0823003
        .long   0xe2832002
        .long   0xe1a02142
        .long   0xe3c22803
        .long   0xea000005
LKVV45:
        .long   0xe590201c
        .long   0xe3a03001
        .long   0xe2422001
        .long   0xe1a02213
        .long   0xe3c224ff
        .long   0xe3c228ff
LKVV46:
        .long   0xe1ca20b6
        .long   0xe1ca20b4
        .long   0xe1ca20b2
        .long   0xe1ca20b0
        .long   0xe5903008
        .long   0xe1a03083
        .long   0xe083c00a
        .long   0xe18a20b3
        .long   0xe1cc20b6
        .long   0xe1cc20b4
        .long   0xe1cc20b2
        .long   0xe5903008
        .long   0xe1a0e083
        .long   0xe08e300c
        .long   0xe18c20be
        .long   0xe1c320b6
        .long   0xe1c320b4
        .long   0xe1c320b2
        .long   0xe590c008
        .long   0xe1a0c08c
        .long   0xe08ce003
        .long   0xe1ce20b6
        .long   0xe1ce20b4
        .long   0xe1ce20b2
        .long   0xe18320bc
        .long   0xeafffdc7
LKVV47:
        .long   0xe15a30b2
        .long   0xe1a0c10e
        .long   0xe58dc03c
        .long   0xe58d3040
        .long   0xe1a0308e
        .long   0xe04ac003
        .long   0xe1dcc0b0
        .long   0xe26e2000
        .long   0xe2433002
        .long   0xe58dc038
        .long   0xe1a02082
        .long   0xe282c002
        .long   0xe19ac0bc
        .long   0xe08ee08e
        .long   0xe58dc034
        .long   0xe282c006
        .long   0xe19ac0bc
        .long   0xe2822004
        .long   0xe1a0e08e
        .long   0xe58dc030
        .long   0xe19a30b3
        .long   0xe59dc040
        .long   0xe58d304c
        .long   0xe59d303c
        .long   0xe59d404c
        .long   0xe2433002
        .long   0xe19a30b3
        .long   0xe58d303c
        .long   0xe19a20b2
        .long   0xe59d3038
        .long   0xe58d2050
        .long   0xe59d2034
        .long   0xe0833002
        .long   0xe24e2002
        .long   0xe59de030
        .long   0xe19a20b2
        .long   0xe08ec00c
        .long   0xe59de03c
        .long   0xe084e00e
        .long   0xe59d4050
        .long   0xe08ce00e
        .long   0xe0833004
        .long   0xe083e00e
        .long   0xe08e2002
        .long   0xe2822004
        .long   0xe1a021c2
        .long   0xe3c22803
        .long   0xeaffffb5
LKVV_bd.1.4:
        .long   0xe31c0001
        .long   0x0a000018
        .long   0xe04a408e
        .long   0xe1d440b0
        .long   0xe26e2000
        .long   0xe58d4050
        .long   0xe59db050
        .long   0xe1a02082
        .long   0xe2824002
        .long   0xe19a40b4
        .long   0xe58d404c
        .long   0xe2824004
        .long   0xe19a40b4
        .long   0xe2822006
        .long   0xe58d4040
        .long   0xe19a20b2
        .long   0xe28d4054
        .long   0xe1c4b0b0
        .long   0xe59db04c
        .long   0xe28d4054
        .long   0xe1c4b0b2
        .long   0xe59db040
        .long   0xe28d4054
        .long   0xe1c4b0b4
        .long   0xe28d4054
        .long   0xe1c420b6
        .long   0xea00000f
LKVV48:
        .long   0xe590201c
        .long   0xe3a0400b
        .long   0xe58d4044
        .long   0xe2422001
        .long   0xe3a04001
        .long   0xe1a02214
        .long   0xe3c224ff
        .long   0xe28d4054
        .long   0xe3c228ff
        .long   0xe1c420b6
        .long   0xe28d4054
        .long   0xe1c420b4
        .long   0xe28d4054
        .long   0xe1c420b2
        .long   0xe28d4054
        .long   0xe1c420b0
LKVV49:
        .long   0xe31c0040
        .long   0x0a000012
        .long   0xe26ee000
        .long   0xe28d4054
        .long   0xe1a0208e
        .long   0xe282c008
        .long   0xe19ac0bc
        .long   0xe58dc050
        .long   0xe282c00a
        .long   0xe19ae0bc
        .long   0xe59db050
        .long   0xe282c00c
        .long   0xe19ac0bc
        .long   0xe282200e
        .long   0xe19a20b2
        .long   0xe1c4b0b8
        .long   0xe28d4054
        .long   0xe1c4e0ba
        .long   0xe28de054
        .long   0xe1cec0bc
        .long   0xea000006
LKVV50:
        .long   0xe1a0c002
        .long   0xe28de054
        .long   0xe1ce20bc
        .long   0xe28de054
        .long   0xe1ce20ba
        .long   0xe28de054
        .long   0xe1ce20b8
LKVV51:
        .long   0xe28de054
        .long   0xe1ce20be
        .long   0xe3a04000
        .long   0xe1a0e004
        .long   0xe58d102c
        .long   0xe58d6028
        .long   0xe58d7024
        .long   0xe58d8010
        .long   0xe58d900c
        .long   0xe58da004
LKVV52:
        .long   0xe0826082
        .long   0xe08c6006
        .long   0xe28d1054
        .long   0xe2867002
        .long   0xe3a08000
        .long   0xe0816004
LKVV53:
        .long   0xe1a09088
        .long   0xe0861009
        .long   0xe1d1b0b2
        .long   0xe196a0b9
        .long   0xe1d110b4
        .long   0xe08ab08b
        .long   0xe08b1001
        .long   0xe2811002
LKVV54:
        .long   0xe1a01141
        .long   0xe2888001
        .long   0xe18310b9
        .long   0xe3580004
        .long   0xe2899002
        .long   0xaa000002
        .long   0xe3580003
        .long   0x0a00000d
        .long   0xeaffffee
LKVV55:
        .long   0xe5901008
        .long   0xe28ee001
        .long   0xe35e0004
        .long   0xe2844002
        .long   0xe0833081
        .long   0xbaffffe2
        .long   0xe59d102c
        .long   0xe59d6028
        .long   0xe59d7024
        .long   0xe59d8010
        .long   0xe59d900c
        .long   0xe59da004
        .long   0xeafffd22
LKVV56:
        .long   0xe35e0003
        .long   0x01a01007
        .long   0x0affffe6
        .long   0xeaffffdd
LKVV_bd.1.5:
        .long   0xe31c0020
        .long   0x104a208e
        .long   0x115220b2
        .long   0x1a000007
        .long   0xe590201c
        .long   0xe3a0400b
        .long   0xe58d4044
        .long   0xe2422001
        .long   0xe3a04001
        .long   0xe1a02214
        .long   0xe3c224ff
        .long   0xe3c228ff
LKVV57:
        .long   0xe28db070
        .long   0xe1cb20b0
        .long   0xe28d4064
        .long   0xe31c0002
        .long   0xe1c420b0
        .long   0x1a000017
        .long   0xe590401c
        .long   0xe3a0b00b
        .long   0xe58db044
        .long   0xe2444001
        .long   0xe3a0b001
        .long   0xe1a0441b
        .long   0xe3c444ff
        .long   0xe3c448ff
        .long   0xe58d4030
        .long   0xe28db064
        .long   0xe1cb40b8
        .long   0xe28db064
        .long   0xe1cb40b6
        .long   0xe28db064
        .long   0xe1cb40b4
        .long   0xe28db064
        .long   0xe1cb40b2
        .long   0xea000027
        .long   xyoff
        .long   top_edge_tab16
        .long   left_edge_tab16
        .long   above_right_avail_4x4
        .long   LKVV_bt.1
        .long   0x2aaaaaab
LKVV58:
        .long   0xe15a40b2
        .long   0xe08eb08e
        .long   0xe58db050
        .long   0xe1a0b08e
        .long   0xe58db04c
        .long   0xe1a0b10e
        .long   0xe58db040
        .long   0xe59db050
        .long   0xe58d4030
        .long   0xe1a0b08b
        .long   0xe58db050
        .long   0xe59db04c
        .long   0xe24bb002
        .long   0xe19ab0bb
        .long   0xe58db04c
        .long   0xe59db040
        .long   0xe24bb002
        .long   0xe19ab0bb
        .long   0xe58db040
        .long   0xe59db050
        .long   0xe24bb002
        .long   0xe19ab0bb
        .long   0xe58db050
        .long   0xe28db064
        .long   0xe1cb40b2
        .long   0xe59db04c
        .long   0xe28d4064
        .long   0xe1c4b0b4
        .long   0xe59db040
        .long   0xe28d4064
        .long   0xe1c4b0b6
        .long   0xe59db050
        .long   0xe28d4064
        .long   0xe1c4b0b8
LKVV59:
        .long   0xe31c0001
        .long   0x1a000010
        .long   0xe590c01c
        .long   0xe3a0e00b
        .long   0xe58de044
        .long   0xe24cc001
        .long   0xe3a0e001
        .long   0xe1a0cc1e
        .long   0xe3ccc4ff
        .long   0xe3cce8ff
        .long   0xe28dc070
        .long   0xe1cce0b8
        .long   0xe28dc070
        .long   0xe1cce0b6
        .long   0xe28dc070
        .long   0xe1cce0b4
        .long   0xe28dc070
        .long   0xe1cce0b2
        .long   0xea000014
LKVV60:
        .long   0xe1a0e08e
        .long   0xe06ec00a
        .long   0xe58dc050
        .long   0xe59dc050
        .long   0xe26ee000
        .long   0xe19ae0be
        .long   0xe1dc40b2
        .long   0xe58d404c
        .long   0xe1dc40b4
        .long   0xe58d4040
        .long   0xe1dcc0b6
        .long   0xe28d4070
        .long   0xe1c4e0b2
        .long   0xe59db04c
        .long   0xe28d4070
        .long   0xe1c4b0b4
        .long   0xe59db040
        .long   0xe28d4070
        .long   0xe1c4b0b6
        .long   0xe28d4070
        .long   0xe1c4c0b8
LKVV61:
        .long   0xe59dc030
        .long   0xe58d7024
        .long   0xe58d8010
        .long   0xe08ec00c
        .long   0xe08cc002
        .long   0xe2822002
        .long   0xe08c2002
        .long   0xe3a0c000
        .long   0xe1a02142
        .long   0xe58d900c
        .long   0xe58da004
LKVV62:
        .long   0xe35c0000
        .long   0xda000013
        .long   0xe28de064
        .long   0xe3a09000
        .long   0xe1a08009
        .long   0xe08e408c
LKVV63:
        .long   0xe268e000
        .long   0xe2888001
        .long   0xe1a0708e
        .long   0xe084e007
        .long   0xe15ea0b2
        .long   0xe19470b7
        .long   0xe1dee0b2
        .long   0xe158000c
        .long   0xe08aa007
        .long   0xe08a7007
        .long   0xe087e00e
        .long   0xe28ee002
        .long   0xe1a0e14e
        .long   0xe183e0b9
        .long   0xe2899002
        .long   0xbaffffef
LKVV64:
        .long   0xe28c8001
        .long   0xe3580004
        .long   0xe1a07008
        .long   0xaa000011
        .long   0xe26ce000
        .long   0xe28d9070
        .long   0xe089e08e
        .long   0xe1a04087
        .long   0xe08ee087
LKVV65:
        .long   0xe15eb0b2
        .long   0xe1de90b0
        .long   0xe1fea0b2
        .long   0xe2877001
        .long   0xe08bb009
        .long   0xe08b9009
        .long   0xe089a00a
        .long   0xe28a9002
        .long   0xe3570004
        .long   0xe1a09149
        .long   0xe18390b4
        .long   0xe2844002
        .long   0xbafffff2
LKVV66:
        .long   0xe1a0c08c
        .long   0xe18320bc
        .long   0xe590e008
        .long   0xe3580004
        .long   0xe1a0c008
        .long   0xe083308e
        .long   0xbaffffcc
        .long   0xe59d7024
        .long   0xe59d8010
        .long   0xe59d900c
        .long   0xe59da004
        .long   0xeafffc67
LKVV_bd.1.6:
        .long   0xe31c0020
        .long   0x1a000009
        .long   0xe590201c
        .long   0xe3a0300b
        .long   0xe58d3044
        .long   0xe2422001
        .long   0xe3a03001
        .long   0xe1a02213
        .long   0xe3c224ff
        .long   0xe3c228ff
        .long   0xe58d2034
        .long   0xea000004
LKVV67:
        .long   0xe26e2000
        .long   0xe1a02082
        .long   0xe2422002
        .long   0xe19a20b2
        .long   0xe58d2034
LKVV68:
        .long   0xe1a0208e
        .long   0xe31c0001
        .long   0xe58d2030
        .long   0x1a00000b
        .long   0xe590201c
        .long   0xe3a0300b
        .long   0xe58d3044
        .long   0xe2422001
        .long   0xe3a03001
        .long   0xe1a02213
        .long   0xe3c224ff
        .long   0xe3c2e8ff
        .long   0xe1a0200e
        .long   0xe58d203c
        .long   0xe1a03002
        .long   0xea00000e
LKVV69:
        .long   0xe59d2030
        .long   0xe26e3000
        .long   0xe04a2002
        .long   0xe1d2e0b0
        .long   0xe1a03083
        .long   0xe58d3050
        .long   0xe59d4050
        .long   0xe2833002
        .long   0xe19a30b3
        .long   0xe2844004
        .long   0xe19a20b4
        .long   0xe59d4050
        .long   0xe2844006
        .long   0xe19a40b4
        .long   0xe58d403c
LKVV70:
        .long   0xe31c0002
        .long   0xe59dc030
        .long   0xe1a0b08c
        .long   0x1a00000b
        .long   0xe590c01c
        .long   0xe3a0400b
        .long   0xe58d4044
        .long   0xe24cc001
        .long   0xe3a04001
        .long   0xe1a0cc14
        .long   0xe3ccc4ff
        .long   0xe3ccc8ff
        .long   0xe58dc038
        .long   0xe58dc030
        .long   0xe58dc040
        .long   0xea000008
LKVV71:
        .long   0xe15ac0b2
        .long   0xe58dc038
        .long   0xe59dc030
        .long   0xe24cc002
        .long   0xe19ac0bc
        .long   0xe58dc040
        .long   0xe24bc002
        .long   0xe19ac0bc
        .long   0xe58dc030
LKVV72:
        .long   0xe59d4034
        .long   0xe28bb002
        .long   0xe084c00e
        .long   0xe28cc001
        .long   0xe1a0c0cc
        .long   0xe18ac0bb
        .long   0xe1cac0b0
        .long   0xe590b008
        .long   0xe08ec003
        .long   0xe28cc001
        .long   0xe1a0b10b
        .long   0xe28bb004
        .long   0xe1a0c0cc
        .long   0xe18ac0bb
        .long   0xe1cac0b2
        .long   0xe590b008
        .long   0xe083c002
        .long   0xe28cc001
        .long   0xe1a0b10b
        .long   0xe58db050
        .long   0xe59db03c
        .long   0xe1a0c0cc
        .long   0xe082b00b
        .long   0xe58db04c
        .long   0xe59db050
        .long   0xe28bb006
        .long   0xe18ac0bb
        .long   0xe59db04c
        .long   0xe1cac0b4
        .long   0xe28bb001
        .long   0xe1a0b0cb
        .long   0xe1cab0b6
        .long   0xe590c008
        .long   0xe08eb084
        .long   0xe58dc050
        .long   0xe59dc038
        .long   0xe08bc00c
        .long   0xe28cc002
        .long   0xe58dc04c
        .long   0xe59dc050
        .long   0xe08cb08c
        .long   0xe084c08e
        .long   0xe58dc050
        .long   0xe59dc04c
        .long   0xe1a0b08b
        .long   0xe28bb002
        .long   0xe1a0c14c
        .long   0xe18ac0bb
        .long   0xe590b008
        .long   0xe08ee083
        .long   0xe08ee002
        .long   0xe58db04c
        .long   0xe59db050
        .long   0xe28ee002
        .long   0xe0832082
        .long   0xe08bb003
        .long   0xe28bb002
        .long   0xe58db050
        .long   0xe59db04c
        .long   0xe1a0e14e
        .long   0xe1a0b08b
        .long   0xe18ac0bb
        .long   0xe590b008
        .long   0xe59dc050
        .long   0xe08bb08b
        .long   0xe1a0b08b
        .long   0xe28bb004
        .long   0xe1a0c14c
        .long   0xe18ac0bb
        .long   0xe590b008
        .long   0xe1a0b08b
        .long   0xe28b3002
        .long   0xe18ac0b3
        .long   0xe5903008
        .long   0xe59dc03c
        .long   0xe0833083
        .long   0xe1a03083
        .long   0xe2833006
        .long   0xe082c00c
        .long   0xe28c2002
        .long   0xe59dc038
        .long   0xe18ae0b3
        .long   0xe59d3040
        .long   0xe590b008
        .long   0xe084408c
        .long   0xe0844003
        .long   0xe284c002
        .long   0xe1a0b08b
        .long   0xe28b4004
        .long   0xe18ae0b4
        .long   0xe590e008
        .long   0xe59d4038
        .long   0xe1a02142
        .long   0xe1a0e08e
        .long   0xe28ee006
        .long   0xe18a20be
        .long   0xe5902008
        .long   0xe59de030
        .long   0xe1a0c14c
        .long   0xe1a02102
        .long   0xe18ac0b2
        .long   0xe5902008
        .long   0xe0843083
        .long   0xe083e00e
        .long   0xe28e3002
        .long   0xe082c102
        .long   0xe082c00c
        .long   0xe1a03143
        .long   0xe18a30bc
        .long   0xeafffbb0
LKVV_bd.1.7:
        .long   0xe31c0020
        .long   0x1a000008
        .long   0xe590201c
        .long   0xe3a0300b
        .long   0xe58d3044
        .long   0xe2422001
        .long   0xe3a03001
        .long   0xe1a02213
        .long   0xe3c224ff
        .long   0xe3c2b8ff
        .long   0xea000003
LKVV73:
        .long   0xe26e2000
        .long   0xe1a02082
        .long   0xe2422002
        .long   0xe19ab0b2
LKVV74:
        .long   0xe1a0208e
        .long   0xe31c0001
        .long   0xe58d2030
        .long   0x1a00000b
        .long   0xe590201c
        .long   0xe3a0300b
        .long   0xe58d3044
        .long   0xe2422001
        .long   0xe3a03001
        .long   0xe1a02213
        .long   0xe3c224ff
        .long   0xe3c248ff
        .long   0xe1a02004
        .long   0xe58d203c
        .long   0xe58d2034
        .long   0xea00000a
LKVV75:
        .long   0xe59d3030
        .long   0xe26e2000
        .long   0xe04a3003
        .long   0xe1d340b0
        .long   0xe1a02082
        .long   0xe2823002
        .long   0xe19a30b3
        .long   0xe2822004
        .long   0xe58d3034
        .long   0xe19a30b2
        .long   0xe58d303c
LKVV76:
        .long   0xe31c0002
        .long   0x1a00000b
        .long   0xe590301c
        .long   0xe3a0c00b
        .long   0xe58dc044
        .long   0xe2433001
        .long   0xe3a0c001
        .long   0xe1a0331c
        .long   0xe3c334ff
        .long   0xe3c328ff
        .long   0xe1a03002
        .long   0xe58d3040
        .long   0xe58d3038
        .long   0xea00000e
LKVV77:
        .long   0xe59dc030
        .long   0xe15a20b2
        .long   0xe08ee08e
        .long   0xe1a0308c
        .long   0xe58d3050
        .long   0xe24cc002
        .long   0xe19a30bc
        .long   0xe1a0c08e
        .long   0xe59de050
        .long   0xe24cc002
        .long   0xe24ee002
        .long   0xe19ae0be
        .long   0xe58de038
        .long   0xe19ac0bc
        .long   0xe58dc040
LKVV78:
        .long   0xe59de030
        .long   0xe08bc002
        .long   0xe28cc001
        .long   0xe28ee004
        .long   0xe1a0c0cc
        .long   0xe18ac0be
        .long   0xe1cac0b0
        .long   0xe590c008
        .long   0xe08be084
        .long   0xe58de04c
        .long   0xe59de034
        .long   0xe58dc050
        .long   0xe084c08b
        .long   0xe084e08e
        .long   0xe58de030
        .long   0xe59d404c
        .long   0xe59de034
        .long   0xe08bb082
        .long   0xe08cc002
        .long   0xe28cc002
        .long   0xe084e00e
        .long   0xe59d4030
        .long   0xe58de04c
        .long   0xe59de03c
        .long   0xe1a0c14c
        .long   0xe084e00e
        .long   0xe59d4050
        .long   0xe28ee002
        .long   0xe58de03c
        .long   0xe1a04084
        .long   0xe58d4050
        .long   0xe59d404c
        .long   0xe59de050
        .long   0xe2844002
        .long   0xe58d404c
        .long   0xe28ee006
        .long   0xe18ac0be
        .long   0xe59d403c
        .long   0xe59de04c
        .long   0xe1cac0b2
        .long   0xe1a04144
        .long   0xe1ca40b6
        .long   0xe1a0e14e
        .long   0xe1cae0b4
        .long   0xe590e008
        .long   0xe082c003
        .long   0xe28cc001
        .long   0xe1a0e10e
        .long   0xe28e4004
        .long   0xe1a0e0cc
        .long   0xe18ae0b4
        .long   0xe5904008
        .long   0xe08bc003
        .long   0xe28cc002
        .long   0xe1a04084
        .long   0xe18ae0b4
        .long   0xe5904008
        .long   0xe59db038
        .long   0xe1a0c14c
        .long   0xe1a04104
        .long   0xe2844006
        .long   0xe18ac0b4
        .long   0xe5904008
        .long   0xe083e00b
        .long   0xe28ee001
        .long   0xe1a04084
        .long   0xe2844002
        .long   0xe18ac0b4
        .long   0xe590c008
        .long   0xe0822083
        .long   0xe082400b
        .long   0xe08c208c
        .long   0xe59dc040
        .long   0xe1a0e0ce
        .long   0xe1a02082
        .long   0xe2822004
        .long   0xe18ae0b2
        .long   0xe5902008
        .long   0xe2844002
        .long   0xe08bc00c
        .long   0xe1a02102
        .long   0xe18ae0b2
        .long   0xe590e008
        .long   0xe59d2040
        .long   0xe1a04144
        .long   0xe08ee08e
        .long   0xe083b08b
        .long   0xe28cc001
        .long   0xe1a0e08e
        .long   0xe28e3006
        .long   0xe18a40b3
        .long   0xe5903008
        .long   0xe1a0c0cc
        .long   0xe08b2002
        .long   0xe1a03103
        .long   0xe2833002
        .long   0xe18a40b3
        .long   0xe590e008
        .long   0xe2822002
        .long   0xe08e310e
        .long   0xe08e3003
        .long   0xe18ac0b3
        .long   0xe5903008
        .long   0xe1a02142
        .long   0xe0833083
        .long   0xe1a03083
        .long   0xe2833002
        .long   0xe18a20b3
        .long   0xeafffafc
LKVV_bd.1.8:
        .long   0xe31c0001
        .long   0x1a00000b
        .long   0xe590201c
        .long   0xe3a0300b
        .long   0xe58d3044
        .long   0xe2422001
        .long   0xe3a03001
        .long   0xe1a02213
        .long   0xe3c224ff
        .long   0xe3c228ff
        .long   0xe58d2038
        .long   0xe1a04002
        .long   0xe1a03004
        .long   0xea00000a
LKVV79:
        .long   0xe04a308e
        .long   0xe1d330b0
        .long   0xe26e2000
        .long   0xe1a02082
        .long   0xe58d3038
        .long   0xe2823002
        .long   0xe19a30b3
        .long   0xe2824004
        .long   0xe19a40b4
        .long   0xe2822006
        .long   0xe19a20b2
LKVV80:
        .long   0xe31c0040
        .long   0x0a00000a
        .long   0xe26ee000
        .long   0xe1a0c08e
        .long   0xe28ce008
        .long   0xe19ab0be
        .long   0xe28ce00a
        .long   0xe19ae0be
        .long   0xe28cc00c
        .long   0xe58de034
        .long   0xe19ac0bc
        .long   0xe58dc040
        .long   0xea000002
LKVV81:
        .long   0xe1a0b002
        .long   0xe58db040
        .long   0xe58db034
LKVV82:
        .long   0xe59dc038
        .long   0xe084e002
        .long   0xe58de050
        .long   0xe08cc003
        .long   0xe28cc001
        .long   0xe083e004
        .long   0xe1a0c0cc
        .long   0xe1cac0b0
        .long   0xe590c008
        .long   0xe28ee001
        .long   0xe58de04c
        .long   0xe59de050
        .long   0xe1a0c10c
        .long   0xe28ee001
        .long   0xe58de050
        .long   0xe59de04c
        .long   0xe1a0e0ce
        .long   0xe18ae0bc
        .long   0xe1cae0b2
        .long   0xe590c008
        .long   0xe59de050
        .long   0xe1a0c10c
        .long   0xe28cc002
        .long   0xe1a0e0ce
        .long   0xe58de050
        .long   0xe082e00b
        .long   0xe58de04c
        .long   0xe59de050
        .long   0xe18ae0bc
        .long   0xe1cae0b4
        .long   0xe590c008
        .long   0xe59de034
        .long   0xe58dc050
        .long   0xe59dc04c
        .long   0xe08be00e
        .long   0xe58de04c
        .long   0xe59de050
        .long   0xe28cc001
        .long   0xe1a0e10e
        .long   0xe58de050
        .long   0xe59de050
        .long   0xe1a0c0cc
        .long   0xe28ee004
        .long   0xe18ac0be
        .long   0xe1cac0b6
        .long   0xe59de04c
        .long   0xe590c008
        .long   0xe28ee001
        .long   0xe58de050
        .long   0xe59de038
        .long   0xe1a0c10c
        .long   0xe28cc006
        .long   0xe08ee083
        .long   0xe58de04c
        .long   0xe59de050
        .long   0xe0833084
        .long   0xe0833002
        .long   0xe1a0e0ce
        .long   0xe58de050
        .long   0xe59de050
        .long   0xe2833002
        .long   0xe18ae0bc
        .long   0xe590c008
        .long   0xe58dc050
        .long   0xe59dc04c
        .long   0xe59de050
        .long   0xe08cc004
        .long   0xe28cc002
        .long   0xe0844082
        .long   0xe1a0e08e
        .long   0xe58de050
        .long   0xe59de050
        .long   0xe1a0c14c
        .long   0xe18ac0be
        .long   0xe590c008
        .long   0xe58dc050
        .long   0xe59de050
        .long   0xe08ec10e
        .long   0xe08ee00c
        .long   0xe1a0c143
        .long   0xe18ac0be
        .long   0xe590e008
        .long   0xe084300b
        .long   0xe2833002
        .long   0xe1a0e08e
        .long   0xe28ee002
        .long   0xe18ac0be
        .long   0xe59de034
        .long   0xe590c008
        .long   0xe1a03143
        .long   0xe082200e
        .long   0xe08ce08c
        .long   0xe082c08b
        .long   0xe28c4002
        .long   0xe1a0e08e
        .long   0xe28ee002
        .long   0xe18a30be
        .long   0xe590e008
        .long   0xe59d2040
        .long   0xe59dc034
        .long   0xe1a0e08e
        .long   0xe28ee004
        .long   0xe18a30be
        .long   0xe5903008
        .long   0xe082c08c
        .long   0xe1a04144
        .long   0xe0833083
        .long   0xe08cb00b
        .long   0xe28b2002
        .long   0xe1a03083
        .long   0xe2833004
        .long   0xe18a40b3
        .long   0xe5903008
        .long   0xe1a02142
        .long   0xe1a03083
        .long   0xe2833006
        .long   0xe18a40b3
        .long   0xe5903008
        .long   0xe0833083
        .long   0xe1a03083
        .long   0xe2833006
        .long   0xe18a20b3
        .long   0xeafffa58
LKVV_bd.1.9:
        .long   0xe31c0002
        .long   0x1a00000b
        .long   0xe590201c
        .long   0xe3a0300b
        .long   0xe58d3044
        .long   0xe2422001
        .long   0xe3a03001
        .long   0xe1a02213
        .long   0xe3c224ff
        .long   0xe3c228ff
        .long   0xe1a03002
        .long   0xe1a0e003
        .long   0xe1a0c00e
        .long   0xea00000a
LKVV83:
        .long   0xe15a20b2
        .long   0xe08e308e
        .long   0xe1a0c08e
        .long   0xe1a0e10e
        .long   0xe1a03083
        .long   0xe24cc002
        .long   0xe19ac0bc
        .long   0xe24ee002
        .long   0xe19ae0be
        .long   0xe2433002
        .long   0xe19a30b3
LKVV84:
        .long   0xe082b08c
        .long   0xe082400c
        .long   0xe08b200e
        .long   0xe2844001
        .long   0xe2822002
        .long   0xe1a040c4
        .long   0xe1ca40b0
        .long   0xe1a02142
        .long   0xe1ca20b2
        .long   0xe5902008
        .long   0xe08c400e
        .long   0xe2844001
        .long   0xe1a02082
        .long   0xe1a040c4
        .long   0xe18a40b2
        .long   0xe1ca40b4
        .long   0xe5904008
        .long   0xe08cc08e
        .long   0xe08cc003
        .long   0xe28c2002
        .long   0xe1a04084
        .long   0xe284c002
        .long   0xe1a02142
        .long   0xe18a20bc
        .long   0xe1ca20b6
        .long   0xe5902008
        .long   0xe08ec003
        .long   0xe28cc001
        .long   0xe1a02102
        .long   0xe08ee083
        .long   0xe1a0c0cc
        .long   0xe18ac0b2
        .long   0xe5904008
        .long   0xe08ee003
        .long   0xe28e2002
        .long   0xe1a04084
        .long   0xe284e004
        .long   0xe18ac0be
        .long   0xe590c008
        .long   0xe1a02142
        .long   0xe1a0c10c
        .long   0xe28cc002
        .long   0xe18a20bc
        .long   0xe590c008
        .long   0xe1a0c08c
        .long   0xe28cc006
        .long   0xe18a20bc
        .long   0xe5902008
        .long   0xe0822082
        .long   0xe1a02082
        .long   0xe2822006
        .long   0xe18a30b2
        .long   0xe5902008
        .long   0xe0822082
        .long   0xe1a02082
        .long   0xe2822004
        .long   0xe18a30b2
        .long   0xe5902008
        .long   0xe0822082
        .long   0xe1a02082
        .long   0xe2822002
        .long   0xe18a30b2
        .long   0xe590c008
        .long   0xe08c210c
        .long   0xe08c2002
        .long   0xe18a30b2
        .long   0xe5902008
        .long   0xe1a02102
        .long   0xe2822006
        .long   0xe18a30b2
        .long   0xe5902008
        .long   0xe1a02102
        .long   0xe2822004
        .long   0xe18a30b2
        .long   0xeafff9f4
LKVV85:
        mvn     r0, #0xD
        add     sp, sp, #0x8C
        ldmia   sp!, {r4 - r11, pc}
LKVV86:
        mvn     r0, #7
        add     sp, sp, #0x8C
        ldmia   sp!, {r4 - r11, pc}
LKVV_bt.1:
        .long   0x00000008
        .long   0x00000838
        .long   0x0000095c
        .long   0x00000b5c
        .long   0x00000d40
        .long   0x0000101c
        .long   0x000012f8
        .long   0x000015c8
        .long   0x00001858
