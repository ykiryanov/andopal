        .text
        .align  4
        .globl  _ippiReconstructLumaIntra4x4MB_H264_16s8u_C1R


_ippiReconstructLumaIntra4x4MB_H264_16s8u_C1R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xA0
        ldr     r12, [sp, #0xC4]
        ldr     r5, [sp, #0xD4]
        ldr     r4, [sp, #0xC8]
        str     r12, [sp, #8]
        ldr     lr, [sp, #0xCC]
        ldr     r12, [sp, #0xD0]
        cmp     r0, #0
        str     r5, [sp, #0x18]
        beq     LKWG75
        cmp     r1, #0
        beq     LKWG75
        cmp     r3, #0
        beq     LKWG75
        ldr     r5, [r0]
        cmp     r5, #0
        str     r5, [sp, #0x1C]
        beq     LKWG75
        cmp     r12, #0
        beq     LKWG75
        cmp     r4, #0x33
        bls     LKWG0
        mvn     r0, #0xA
        add     sp, sp, #0xA0
        ldmia   sp!, {r4 - r11, pc}
LKWG0:
        ldr     r8, [pc, #0xFF0]
        ldr     r7, [pc, #0xFF0]
        ldr     r6, [pc, #0xFF0]
        ldr     r9, [pc, #0xFF0]
        and     r11, lr, #4
        str     r11, [sp, #0x28]
        and     r11, lr, #1
        str     r11, [sp, #0x2C]
        and     r11, lr, #0x20
        mov     r5, #0
        str     r11, [sp, #0x30]
        str     r5, [sp, #0x40]
        mvn     r11, #0xFF
        mov     r10, #2
        str     r11, [sp, #0x34]
        str     r12, [sp, #0x14]
        str     lr, [sp, #0x10]
        str     r4, [sp, #0xC]
        str     r0, [sp]
LKWG1:
        ldrb    r12, [r8], #1
        ldr     r4, [r3], #4
        ldrb    r0, [r7], #1
        cmp     r12, #0
        beq     LKWG2
        ldr     r12, [sp, #0x28]
        cmp     r12, #0
        movne   r12, #1
        bne     LKWG3
LKWG2:
        mov     r12, #0
LKWG3:
        cmp     r0, #0
        beq     LKWG4
        ldr     r0, [sp, #0x2C]
        cmp     r0, #0
        movne   r0, #1
        bne     LKWG5
LKWG4:
        cmp     r12, #0
        movne   r0, #0
        beq     LKWG6
LKWG5:
        cmp     r5, #0
        bne     LKWG7
        ldr     lr, [sp, #0x10]
        tst     lr, #0x10
        bne     LKWG7
        b       LKWG8
LKWG6:
        ldr     r0, [sp, #0x10]
        tst     r0, #0x10
        moveq   r0, #0
        beq     LKWG8
        cmp     r5, #0
        movne   r0, #0
        moveq   r0, #0
        bne     LKWG8
LKWG7:
        mov     lr, #1
        b       LKWG9
LKWG8:
        mov     lr, #0
LKWG9:
        cmp     r12, #0
        beq     LKWG10
        cmp     r5, #5
        bne     LKWG11
LKWG10:
        ldrb    r11, [r6]
        cmp     r11, #0
        beq     LKWG11
        ldr     r11, [sp, #0x30]
        cmp     r11, #0
        beq     LKWG12
        cmp     r5, #5
        bne     LKWG12
LKWG11:
        mov     r11, #1
        str     r11, [sp, #0x64]
        b       LKWG13
LKWG12:
        mov     r11, #0
        str     r11, [sp, #0x64]
LKWG13:
        cmp     r12, #0
        mov     r12, #0
        mov     r11, #1
        moveq   r12, r11
        cmp     r0, #0
        mov     r0, #0
        mov     r11, #1
        moveq   r0, r11
        cmp     lr, #0
        mov     lr, #0
        mov     r11, #1
        moveq   lr, r11
        str     lr, [sp, #0x60]
        ldr     lr, [pc, #0xEAC]
        mov     r11, #0
        str     lr, [sp, #0x5C]
        ldr     lr, [sp, #0x64]
        sub     r4, r4, #9
        orr     r0, r12, r0, lsl #1
        cmp     lr, #0
        mov     lr, #1
        moveq   r11, lr
        ldr     lr, [sp, #0x5C]
        ldr     r12, [sp, #0x60]
        adds    r4, #9
        ldrcs   lr, [lr, +r4, lsl #2]
        orr     r12, r0, r12, lsl #5
        orr     r4, r12, r11, lsl #6
        mov     r0, r1
        addcs   pc, pc, lr
        mvn     r0, #0xA
LKWG_.Lpc1:
        add     sp, sp, #0xA0
        ldmia   sp!, {r4 - r11, pc}
LKWG_bd.1.1:
        .long   0xe3140001
        .long   0x0a000019
        .long   0xe0410002
        .long   0xe5d0e000
        .long   0xe082c082
        .long   0xe081400c
        .long   0xe7c1e00c
        .long   0xe7c1e082
        .long   0xe7c2e001
        .long   0xe5c1e000
        .long   0xe5d0b001
        .long   0xe081c082
        .long   0xe081e002
        .long   0xe5c4b001
        .long   0xe5ccb001
        .long   0xe5ceb001
        .long   0xe5c1b001
        .long   0xe5d0b002
        .long   0xe5c4b002
        .long   0xe5ccb002
        .long   0xe5ceb002
        .long   0xe5c1b002
        .long   0xe5d00003
        .long   0xe5c40003
        .long   0xe5cc0003
        .long   0xe5ce0003
        .long   0xe5c10003
        .long   0xea000015
LKWG14:
        .long   0xe3a00080
        .long   0xe5c10003
        .long   0xe5c10002
        .long   0xe5c10001
        .long   0xe5c10000
        .long   0xe081e002
        .long   0xe5ce0003
        .long   0xe5ce0002
        .long   0xe5ce0001
        .long   0xe7c20001
        .long   0xe082c00e
        .long   0xe7ce0002
        .long   0xe5cc0003
        .long   0xe5cc0002
        .long   0xe5cc0001
        .long   0xe082e00c
        .long   0xe5ce0003
        .long   0xe5ce0002
        .long   0xe5ce0001
        .long   0xe7cc0002
        .long   0xe3a0000b
        .long   0xe58d0040
LKWG15:
        .long   0xe59d0008
        .long   0xe110000a
        .long   0x0a000113
        .long   0xe59d0018
        .long   0xe3500000
        .long   0x0a0000e5
        .long   0xe59d000c
        .long   0xe3500000
        .long   0x8a0000e2
LKWG16:
        .long   0xe59d000c
        .long   0xe3500000
        .long   0x1a0000b4
        .long   0xe59d0018
        .long   0xe3500000
        .long   0x0a0000b1
LKWG17:
        .long   0xe59d001c
        .long   0xe59db018
        .long   0xe2804008
        .long   0xe280e010
        .long   0xe280c018
        .long   0xe35b0000
        .long   0xe28db080
        .long   0xe58b0000
        .long   0xe28d0080
        .long   0xe5804004
        .long   0xe28d0080
        .long   0xe580e008
        .long   0xe28d0080
        .long   0xe580c00c
        .long   0x0a000002
        .long   0xe59d000c
        .long   0xe3500000
        .long   0x9a000059
LKWG18:
        .long   0xe3a00000
        .long   0xe58d803c
        .long   0xe58d9038
        .long   0xe58d5024
        .long   0xe58da020
        .long   0xe58d2044
        .long   0xe58d1004
LKWG19:
        .long   0xe28d1080
        .long   0xe7915100
        .long   0xe2800001
        .long   0xe3500003
        .long   0xe1d520f6
        .long   0xe1d580f2
        .long   0xe1d590f0
        .long   0xe1d5a0f4
        .long   0xe06210c8
        .long   0xe08820c2
        .long   0xe089800a
        .long   0xe049900a
        .long   0xe1a01801
        .long   0xe1a02802
        .long   0xe1a08808
        .long   0xe1a09809
        .long   0xe1a01841
        .long   0xe1a02842
        .long   0xe082b848
        .long   0xe081a849
        .long   0xe0619849
        .long   0xe0628848
        .long   0xe1c5b0b0
        .long   0xe1c5a0b2
        .long   0xe1c590b4
        .long   0xe1c580b6
        .long   0xdaffffe4
        .long   0xe59d2044
        .long   0xe59d803c
        .long   0xe59d9038
        .long   0xe59d5024
        .long   0xe59da020
        .long   0xe59d1004
        .long   0xe58d2044
        .long   0xe59d201c
        .long   0xe3a0b000
        .long   0xe3a00004
        .long   0xe58d7048
        .long   0xe58d803c
        .long   0xe58d9038
        .long   0xe58d5024
        .long   0xe58da020
        .long   0xe58d1004
LKWG20:
        .long   0xe1dc10f0
        .long   0xe1d470f0
        .long   0xe19280fb
        .long   0xe1de90f0
        .long   0xe2500001
        .long   0xe08750c1
        .long   0xe06110c7
        .long   0xe0887009
        .long   0xe0488009
        .long   0xe1a05805
        .long   0xe1a01801
        .long   0xe1a0a808
        .long   0xe1a07807
        .long   0xe1a05845
        .long   0xe1a09841
        .long   0xe0858847
        .long   0xe2881020
        .long   0xe089884a
        .long   0xe2888020
        .long   0xe1a01341
        .long   0xe18210bb
        .long   0xe069a84a
        .long   0xe0657847
        .long   0xe28a1020
        .long   0xe1a08348
        .long   0xe0c480b2
        .long   0xe2877020
        .long   0xe1a01341
        .long   0xe0ce10b2
        .long   0xe1a07347
        .long   0xe0cc70b2
        .long   0xe28bb002
        .long   0x1affffde
        .long   0xe59d7048
        .long   0xe59d803c
        .long   0xe59d9038
        .long   0xe59d5024
        .long   0xe59da020
        .long   0xe59d2044
        .long   0xe59d1004
LKWG21:
        .long   0xe1a0c001
        .long   0xe58d7048
        .long   0xe58d9038
        .long   0xe59d7034
        .long   0xe59f9b9c
        .long   0xe58d803c
        .long   0xe3a00000
        .long   0xe58d3068
        .long   0xe58d5024
        .long   0xe58da020
        .long   0xe58d1004
        .long   0xe3a08c01
LKWG22:
        .long   0xe5dc3000
        .long   0xe5dce001
        .long   0xe5dc4002
        .long   0xe5dc5003
        .long   0xe28d1080
        .long   0xe7911100
        .long   0xe1a0a007
        .long   0xe2800001
        .long   0xe1d1b0f0
        .long   0xe15b0007
        .long   0xc1a0a00b
        .long   0xe35a0c01
        .long   0xc1a0a008
        .long   0xe089a00a
        .long   0xe08a3003
        .long   0xe5d33100
        .long   0xe5cc3000
        .long   0xe1d1a0f2
        .long   0xe1a03007
        .long   0xe15a0007
        .long   0xc1a0300a
        .long   0xe3530c01
        .long   0xc1a03008
        .long   0xe0893003
        .long   0xe083e00e
        .long   0xe5de3100
        .long   0xe5cc3001
        .long   0xe1d1e0f4
        .long   0xe1a03007
        .long   0xe15e0007
        .long   0xc1a0300e
        .long   0xe3530c01
        .long   0xc1a03008
        .long   0xe0893003
        .long   0xe0834004
        .long   0xe5d43100
        .long   0xe5cc3002
        .long   0xe1d110f6
        .long   0xe1a03007
        .long   0xe1510007
        .long   0xc1a03001
        .long   0xe3530c01
        .long   0xc1a03008
        .long   0xe0893003
        .long   0xe0835005
        .long   0xe5d51100
        .long   0xe3500004
        .long   0xe5cc1003
        .long   0xe082c00c
        .long   0xbaffffcd
        .long   0xe59d3068
        .long   0xe59d7048
        .long   0xe59d803c
        .long   0xe59d9038
        .long   0xe59d5024
        .long   0xe59da020
        .long   0xe59d1004
        .long   0xea000026
LKWG23:
        .long   0xe59d001c
        .long   0xe1a0e001
        .long   0xe3a0c004
        .long   0xe1d000f0
        .long   0xe58da020
        .long   0xe58d1004
        .long   0xe2800020
        .long   0xe1a00340
        .long   0xe1a00800
        .long   0xe1a04840
        .long   0xe59d0034
        .long   0xe1540000
        .long   0xc1a00004
        .long   0xe3500c01
        .long   0xe3a04c01
        .long   0xc1a00004
        .long   0xe59f4a54
        .long   0xe0840000
LKWG24:
        .long   0xe5de4000
        .long   0xe5de1001
        .long   0xe5dea002
        .long   0xe5deb003
        .long   0xe0804004
        .long   0xe5d44100
        .long   0xe0801001
        .long   0xe5d11100
        .long   0xe080a00a
        .long   0xe5daa100
        .long   0xe080b00b
        .long   0xe5dbb100
        .long   0xe5ce4000
        .long   0xe5ce1001
        .long   0xe5cea002
        .long   0xe5ceb003
        .long   0xe25cc001
        .long   0xe082e00e
        .long   0x1affffec
        .long   0xe59da020
        .long   0xe59d1004
LKWG25:
        .long   0xe59d001c
        .long   0xe2800020
        .long   0xe58d001c
        .long   0xea00002a
LKWG26:
        .long   0xe59fc9ec
        .long   0xe59de00c
        .long   0xe3a00000
        .long   0xe58d004c
        .long   0xe08ecc9e
        .long   0xe1a0c12e
        .long   0xe26cb003
        .long   0xe3a0e001
        .long   0xe1a0eb1e
        .long   0xe58d9038
        .long   0xe58d5024
        .long   0xe58da020
        .long   0xe59d504c
        .long   0xe59d901c
        .long   0xe59da014
        .long   0xe59db00c
        .long   0xe24c4004
        .long   0xe26cc004
        .long   0xe58d2044
        .long   0xe58d1004
LKWG27:
        .long   0xe1a02085
        .long   0xe19910f2
        .long   0xe3510000
        .long   0x0a00000e
        .long   0xe19a00f2
        .long   0xe35b0018
        .long   0x20000091
        .long   0x21a00410
        .long   0x2a000001
        .long   0xe020e091
        .long   0xe1a00c50
LKWG28:
        .long   0xe3550000
        .long   0xe18900b2
        .long   0xda00001f
        .long   0xe2855001
        .long   0xe3550010
        .long   0xb3a00001
        .long   0xbaffffed
        .long   0xea000012
LKWG29:
        .long   0xe2855001
        .long   0xe3550010
        .long   0xbaffffe9
        .long   0xea000022
LKWG30:
        .long   0xe1d9c0d1
        .long   0xe1f900d2
        .long   0xe2866001
        .long   0xe081c00c
        .long   0xe2855001
        .long   0xe021c092
        .long   0xe3550010
        .long   0xe1a0a08a
        .long   0x3afffe57
        .long   0xe59d0000
        .long   0xe59d101c
        .long   0xe5801000
        .long   0xe59d0040
        .long   0xe28dd0a0
        .long   0xe8bd8ff0
LKWG31:
        .long   0xe58da014
        .long   0xe59d9038
        .long   0xe59d5024
        .long   0xe59da020
        .long   0xe59d2044
        .long   0xe59d1004
        .long   0xe58db00c
        .long   0xeafffee0
LKWG32:
        .long   0xe2855001
        .long   0xe3550010
        .long   0xb3a00000
        .long   0xbaffffcd
        .long   0xe58da014
        .long   0xe59d9038
        .long   0xe59d5024
        .long   0xe59da020
        .long   0xe59d2044
        .long   0xe59d1004
        .long   0xe58db00c
        .long   0xeafffece
LKWG33:
        .long   0xe58da014
        .long   0xe59d9038
        .long   0xe59d5024
        .long   0xe59da020
        .long   0xe59d2044
        .long   0xe59d1004
        .long   0xe3500000
        .long   0xe58db00c
        .long   0x1afffecb
        .long   0xeafffec4
LKWG_bd.1.2:
        .long   0xe3140002
        .long   0x0a000019
        .long   0xe551e001
        .long   0xe0810002
        .long   0xe082c000
        .long   0xe5c1e003
        .long   0xe5c1e002
        .long   0xe5c1e001
        .long   0xe5c1e000
        .long   0xe5504001
        .long   0xe082e00c
        .long   0xe58de064
        .long   0xe5c04003
        .long   0xe5c04002
        .long   0xe5c04001
        .long   0xe7c24001
        .long   0xe55ce001
        .long   0xe7c0e002
        .long   0xe5cce003
        .long   0xe5cce002
        .long   0xe5cce001
        .long   0xe59d0064
        .long   0xe550e001
        .long   0xe5c0e003
        .long   0xe5c0e002
        .long   0xe5c0e001
        .long   0xe7cce002
        .long   0xeafffe9f
LKWG34:
        .long   0xe3a00080
        .long   0xe5c10003
        .long   0xe5c10002
        .long   0xe5c10001
        .long   0xe5c10000
        .long   0xe081e002
        .long   0xe5ce0003
        .long   0xe5ce0002
        .long   0xe5ce0001
        .long   0xe7c20001
        .long   0xe082c00e
        .long   0xe7ce0002
        .long   0xe5cc0003
        .long   0xe5cc0002
        .long   0xe5cc0001
        .long   0xe082e00c
        .long   0xe5ce0003
        .long   0xe5ce0002
        .long   0xe5ce0001
        .long   0xe7cc0002
        .long   0xe3a0000b
        .long   0xe58d0040
        .long   0xeafffe88
LKWG_bd.1.3:
        .long   0xe2040003
        .long   0xe3500003
        .long   0x0a00003d
        .long   0xe3140001
        .long   0x0a000010
        .long   0xe0414002
        .long   0xe5d4c001
        .long   0xe5d4e000
        .long   0xe5d40002
        .long   0xe08ec00c
        .long   0xe58d0064
        .long   0xe59de064
        .long   0xe5d44003
        .long   0xe0810002
        .long   0xe08cc00e
        .long   0xe58d4060
        .long   0xe59de060
        .long   0xe08ce00e
        .long   0xe28ec002
        .long   0xe1a0c14c
        .long   0xe20cc0ff
        .long   0xea000016
LKWG35:
        .long   0xe3140002
        .long   0xe0810002
        .long   0x03a0c080
        .long   0x0a000012
        .long   0xe551c001
        .long   0xe58dc064
        .long   0xe550c001
        .long   0xe59de064
        .long   0xe58dc060
        .long   0xe081c082
        .long   0xe55cc001
        .long   0xe59d4060
        .long   0xe58dc05c
        .long   0xe082c082
        .long   0xe08cc001
        .long   0xe55cc001
        .long   0xe08ee004
        .long   0xe59d405c
        .long   0xe08e4004
        .long   0xe084c00c
        .long   0xe28cc002
        .long   0xe1a0c14c
        .long   0xe20cc0ff
LKWG36:
        .long   0xe5c1c003
        .long   0xe5c1c002
        .long   0xe5c1c001
        .long   0xe5c1c000
        .long   0xe081e002
        .long   0xe5cec003
        .long   0xe5cec002
        .long   0xe5cec001
        .long   0xe7c2c001
        .long   0xe082e000
        .long   0xe7c0c002
        .long   0xe5cec003
        .long   0xe5cec002
        .long   0xe5cec001
        .long   0xe082000e
        .long   0xe5c0c003
        .long   0xe5c0c002
        .long   0xe5c0c001
        .long   0xe7cec002
        .long   0xeafffe47
LKWG37:
        .long   0xe041c002
        .long   0xe5dce000
        .long   0xe0810002
        .long   0xe58de064
        .long   0xe5dce001
        .long   0xe58de060
        .long   0xe5dce002
        .long   0xe58de05c
        .long   0xe5dcc003
        .long   0xe59de060
        .long   0xe58dc058
        .long   0xe551c001
        .long   0xe58dc054
        .long   0xe550c001
        .long   0xe59d4054
        .long   0xe58dc050
        .long   0xe081c082
        .long   0xe55cc001
        .long   0xe58dc04c
        .long   0xe082c082
        .long   0xe08cc001
        .long   0xe55cc001
        .long   0xe59db04c
        .long   0xe58dc06c
        .long   0xe59dc064
        .long   0xe08ce00e
        .long   0xe59dc058
        .long   0xe08c4004
        .long   0xe59dc050
        .long   0xe08cc00b
        .long   0xe59db05c
        .long   0xe084c00c
        .long   0xe08ee00b
        .long   0xe08ec00c
        .long   0xe59de06c
        .long   0xe08ce00e
        .long   0xe28ec004
        .long   0xe1a0c1cc
        .long   0xe20cc0ff
        .long   0xeaffffc3
LKWG_bd.1.4:
        .long   0xe3140001
        .long   0x0a000013
        .long   0xe041c002
        .long   0xe5dce000
        .long   0xe28db078
        .long   0xe58de06c
        .long   0xe5dce001
        .long   0xe58de064
        .long   0xe5dce002
        .long   0xe58de060
        .long   0xe59de06c
        .long   0xe5dcc003
        .long   0xe5cbe000
        .long   0xe59de064
        .long   0xe28db078
        .long   0xe5cbe001
        .long   0xe59de060
        .long   0xe28db078
        .long   0xe5cbe002
        .long   0xe28de078
        .long   0xe5cec003
        .long   0xea00000a
LKWG38:
        .long   0xe28de078
        .long   0xe3a0c080
        .long   0xe5cec003
        .long   0xe28de078
        .long   0xe5cec002
        .long   0xe28de078
        .long   0xe5cec001
        .long   0xe28de078
        .long   0xe5cec000
        .long   0xe3a0e00b
        .long   0xe58de040
LKWG39:
        .long   0xe3140040
        .long   0x0a00000f
        .long   0xe041c002
        .long   0xe5dce004
        .long   0xe28db078
        .long   0xe58de06c
        .long   0xe5dce005
        .long   0xe58de064
        .long   0xe59de06c
        .long   0xe5dc4006
        .long   0xe5dcc007
        .long   0xe5cbe004
        .long   0xe59de064
        .long   0xe28db078
        .long   0xe5cbe005
        .long   0xe28de078
        .long   0xe5ce4006
        .long   0xea000006
LKWG40:
        .long   0xe1a0400c
        .long   0xe28de078
        .long   0xe5cec006
        .long   0xe28de078
        .long   0xe5cec005
        .long   0xe28de078
        .long   0xe5cec004
LKWG41:
        .long   0xe28de078
        .long   0xe5cec007
        .long   0xe3a0e000
        .long   0xe58d803c
        .long   0xe58d9038
        .long   0xe58d5024
        .long   0xe58da020
        .long   0xe58d1004
LKWG42:
        .long   0xe08c508c
        .long   0xe0845005
        .long   0xe28d1078
        .long   0xe2858002
        .long   0xe3a09000
        .long   0xe081500e
LKWG43:
        .long   0xe0891005
        .long   0xe5d1b001
        .long   0xe7d5a009
        .long   0xe5d11002
        .long   0xe08ab08b
        .long   0xe08b1001
        .long   0xe2811002
LKWG44:
        .long   0xe1a01141
        .long   0xe7c91000
        .long   0xe2899001
        .long   0xe3590004
        .long   0xaa000002
        .long   0xe3590003
        .long   0x0a00000a
        .long   0xeafffff0
LKWG45:
        .long   0xe28ee001
        .long   0xe35e0004
        .long   0xe0820000
        .long   0xbaffffe6
        .long   0xe59d803c
        .long   0xe59d9038
        .long   0xe59d5024
        .long   0xe59da020
        .long   0xe59d1004
        .long   0xeafffdbe
LKWG46:
        .long   0xe35e0003
        .long   0x01a01008
        .long   0x0affffea
        .long   0xeaffffe2
LKWG_bd.1.5:
        .long   0xe3140020
        .long   0xe28de098
        .long   0x1a000004
        .long   0xe3a0c080
        .long   0xe5cec000
        .long   0xe3a0e00b
        .long   0xe58de040
        .long   0xea000002
LKWG47:
        .long   0xe041c002
        .long   0xe55cc001
        .long   0xe5cec000
LKWG48:
        .long   0xe28de090
        .long   0xe3140002
        .long   0xe5cec000
        .long   0x1a00000c
        .long   0xe3a0e080
        .long   0xe58de064
        .long   0xe28db090
        .long   0xe5cbe004
        .long   0xe28db090
        .long   0xe5cbe003
        .long   0xe28db090
        .long   0xe5cbe002
        .long   0xe28db090
        .long   0xe5cbe001
        .long   0xe3a0e00b
        .long   0xe58de040
        .long   0xea000018
LKWG49:
        .long   0xe551e001
        .long   0xe082b082
        .long   0xe58db06c
        .long   0xe58de064
        .long   0xe081b002
        .long   0xe55bb001
        .long   0xe58db060
        .long   0xe081b082
        .long   0xe55bb001
        .long   0xe58db05c
        .long   0xe59db06c
        .long   0xe08bb001
        .long   0xe55bb001
        .long   0xe58db06c
        .long   0xe28db090
        .long   0xe5cbe001
        .long   0xe59de060
        .long   0xe28db090
        .long   0xe5cbe002
        .long   0xe59de05c
        .long   0xe28db090
        .long   0xe5cbe003
        .long   0xe59de06c
        .long   0xe28db090
        .long   0xe5cbe004
LKWG50:
        .long   0xe3140001
        .long   0x1a00000b
        .long   0xe28d4098
        .long   0xe3a0e080
        .long   0xe5c4e004
        .long   0xe28d4098
        .long   0xe5c4e003
        .long   0xe28d4098
        .long   0xe5c4e002
        .long   0xe28d4098
        .long   0xe5c4e001
        .long   0xe3a0400b
        .long   0xe58d4040
        .long   0xea000015
LKWG51:
        .long   0xe0414002
        .long   0xe58d406c
        .long   0xe5d4e000
        .long   0xe5d44001
        .long   0xe28db098
        .long   0xe58d4060
        .long   0xe59d406c
        .long   0xe5d44002
        .long   0xe58d405c
        .long   0xe59d406c
        .long   0xe5d44003
        .long   0xe58d406c
        .long   0xe28d4098
        .long   0xe5c4e001
        .long   0xe59d4060
        .long   0xe5cb4002
        .long   0xe59d405c
        .long   0xe28db098
        .long   0xe5cb4003
        .long   0xe59d406c
        .long   0xe28db098
        .long   0xe5cb4004
LKWG52:
        .long   0xe59d4064
        .long   0xe58d9038
        .long   0xe58d5024
        .long   0xe08e4004
        .long   0xe084e00c
        .long   0xe28cc002
        .long   0xe08ec00c
        .long   0xe3a0e000
        .long   0xe1a0c14c
        .long   0xe58da020
        .long   0xe58d1004
LKWG53:
        .long   0xe35e0000
        .long   0xda00000f
        .long   0xe28d1090
        .long   0xe3a05000
        .long   0xe081400e
LKWG54:
        .long   0xe0441005
        .long   0xe551a001
        .long   0xe5d19000
        .long   0xe5d11001
        .long   0xe08aa009
        .long   0xe08a9009
        .long   0xe0891001
        .long   0xe2811002
        .long   0xe1a01141
        .long   0xe7c51000
        .long   0xe2855001
        .long   0xe155000e
        .long   0xbafffff2
LKWG55:
        .long   0xe28e5001
        .long   0xe3550004
        .long   0xe1a04005
        .long   0xaa00000e
        .long   0xe28d1098
        .long   0xe041100e
        .long   0xe0841001
LKWG56:
        .long   0xe551b001
        .long   0xe5d19000
        .long   0xe5f1a001
        .long   0xe08bb009
        .long   0xe08b9009
        .long   0xe089a00a
        .long   0xe28a9002
        .long   0xe1a09149
        .long   0xe7c49000
        .long   0xe2844001
        .long   0xe3540004
        .long   0xbafffff3
LKWG57:
        .long   0xe7c0c00e
        .long   0xe3550004
        .long   0xe1a0e005
        .long   0xe0820000
        .long   0xbaffffd5
        .long   0xe59d9038
        .long   0xe59d5024
        .long   0xe59da020
        .long   0xe59d1004
        .long   0xeafffd27
LKWG_bd.1.6:
        .long   0xe3140020
        .long   0x1a000004
        .long   0xe3a00080
        .long   0xe58d0060
        .long   0xe3a0000b
        .long   0xe58d0040
        .long   0xea000002
LKWG58:
        .long   0xe0410002
        .long   0xe5500001
        .long   0xe58d0060
LKWG59:
        .long   0xe3140001
        .long   0x1a000006
        .long   0xe3a0c080
        .long   0xe1a0000c
        .long   0xe58d0054
        .long   0xe3a0b00b
        .long   0xe1a0e000
        .long   0xe58db040
        .long   0xea000005
LKWG60:
        .long   0xe041b002
        .long   0xe5dbc000
        .long   0xe5dbe001
        .long   0xe5db0002
        .long   0xe5dbb003
        .long   0xe58db054
LKWG61:
        .long   0xe3140002
        .long   0x1a000008
        .long   0xe3a04080
        .long   0xe58d405c
        .long   0xe58d404c
        .long   0xe58d4050
        .long   0xe3a0400b
        .long   0xe58d4040
        .long   0xe1a04082
        .long   0xe58d4058
        .long   0xea000009
LKWG62:
        .long   0xe5514001
        .long   0xe081b002
        .long   0xe58d405c
        .long   0xe1a04082
        .long   0xe58d4058
        .long   0xe55bb001
        .long   0xe0814004
        .long   0xe58db050
        .long   0xe5544001
        .long   0xe58d404c
LKWG63:
        .long   0xe59db058
        .long   0xe59d4060
        .long   0xe081b00b
        .long   0xe58db06c
        .long   0xe59db06c
        .long   0xe084400c
        .long   0xe2844001
        .long   0xe1a040c4
        .long   0xe58d4064
        .long   0xe5cb4001
        .long   0xe59db064
        .long   0xe08c400e
        .long   0xe2844001
        .long   0xe5c1b000
        .long   0xe59db06c
        .long   0xe1a040c4
        .long   0xe58d4064
        .long   0xe5cb4002
        .long   0xe59db064
        .long   0xe08e4000
        .long   0xe2844001
        .long   0xe5c1b001
        .long   0xe59db06c
        .long   0xe1a040c4
        .long   0xe5cb4003
        .long   0xe59db054
        .long   0xe5c14002
        .long   0xe080b00b
        .long   0xe28b4001
        .long   0xe59db060
        .long   0xe1a040c4
        .long   0xe08cb08b
        .long   0xe58db06c
        .long   0xe5c14003
        .long   0xe59db05c
        .long   0xe59d406c
        .long   0xe084b00b
        .long   0xe28b4002
        .long   0xe082b082
        .long   0xe58db06c
        .long   0xe1a04144
        .long   0xe58d4064
        .long   0xe59d406c
        .long   0xe59db064
        .long   0xe0814004
        .long   0xe58d4070
        .long   0xe5c4b001
        .long   0xe59d4060
        .long   0xe59db064
        .long   0xe084408c
        .long   0xe084400e
        .long   0xe2844002
        .long   0xe7c2b001
        .long   0xe59db070
        .long   0xe1a04144
        .long   0xe58d4064
        .long   0xe5cb4002
        .long   0xe08cc08e
        .long   0xe08cb000
        .long   0xe59dc064
        .long   0xe0814002
        .long   0xe28bb002
        .long   0xe5c4c001
        .long   0xe59dc070
        .long   0xe1a0b14b
        .long   0xe58db064
        .long   0xe5ccb003
        .long   0xe59dc054
        .long   0xe08e0080
        .long   0xe59de05c
        .long   0xe080000c
        .long   0xe59dc060
        .long   0xe59db05c
        .long   0xe2800002
        .long   0xe08cc08e
        .long   0xe59de050
        .long   0xe1a00140
        .long   0xe08cc00e
        .long   0xe28cc002
        .long   0xe08be08e
        .long   0xe59db064
        .long   0xe5c40003
        .long   0xe1a0c14c
        .long   0xe5c4b002
        .long   0xe59d004c
        .long   0xe08ee000
        .long   0xe28e0002
        .long   0xe59de058
        .long   0xe1a00140
        .long   0xe7cec001
        .long   0xe59dc06c
        .long   0xe7c1000c
        .long   0xeafffc9c
        .long   top_edge_tab16
        .long   left_edge_tab16
        .long   above_right_avail_4x4
        .long   xyoff
        .long   LKWG_bt.1
        .long   ClampTbl
        .long   0xaaaaaaab
LKWG_bd.1.7:
        .long   0xe3140020
        .long   0x10410002
        .long   0x1550e001
        .long   0x1a000002
        .long   0xe3a0000b
        .long   0xe3a0e080
        .long   0xe58d0040
LKWG64:
        .long   0xe3140001
        .long   0x1a000006
        .long   0xe3a00080
        .long   0xe58d0060
        .long   0xe58d0054
        .long   0xe58d0050
        .long   0xe3a0000b
        .long   0xe58d0040
        .long   0xea000006
LKWG65:
        .long   0xe0410002
        .long   0xe5d0c000
        .long   0xe58dc060
        .long   0xe5d0c001
        .long   0xe58dc050
        .long   0xe5d00002
        .long   0xe58d0054
LKWG66:
        .long   0xe3140002
        .long   0x1a00000a
        .long   0xe3a0c080
        .long   0xe1a0000c
        .long   0xe3a0400b
        .long   0xe58d4040
        .long   0xe58d004c
        .long   0xe1a04082
        .long   0xe58d405c
        .long   0xe58d0064
        .long   0xe0824082
        .long   0xe58d4058
        .long   0xea00000c
LKWG67:
        .long   0xe551c001
        .long   0xe1a04082
        .long   0xe58d405c
        .long   0xe082b082
        .long   0xe58db058
        .long   0xe0814004
        .long   0xe0810002
        .long   0xe5544001
        .long   0xe5500001
        .long   0xe081b00b
        .long   0xe58d4064
        .long   0xe55bb001
        .long   0xe58db04c
LKWG68:
        .long   0xe59db060
        .long   0xe08e400c
        .long   0xe2844001
        .long   0xe08bb08e
        .long   0xe58db070
        .long   0xe1a040c4
        .long   0xe58d406c
        .long   0xe081b002
        .long   0xe58db074
        .long   0xe5cb4002
        .long   0xe59d4070
        .long   0xe084400c
        .long   0xe58d4070
        .long   0xe59d406c
        .long   0xe5c14000
        .long   0xe59db060
        .long   0xe59d4070
        .long   0xe08eb08b
        .long   0xe58db070
        .long   0xe59db074
        .long   0xe2844002
        .long   0xe1a04144
        .long   0xe58d406c
        .long   0xe5cb4003
        .long   0xe59db060
        .long   0xe59d4050
        .long   0xe08bb084
        .long   0xe58db060
        .long   0xe59db070
        .long   0xe08b4004
        .long   0xe59db054
        .long   0xe58d4070
        .long   0xe59d4060
        .long   0xe084b00b
        .long   0xe59d4070
        .long   0xe58db060
        .long   0xe59db060
        .long   0xe2844002
        .long   0xe28bb002
        .long   0xe58db070
        .long   0xe59db06c
        .long   0xe1a04144
        .long   0xe5c14002
        .long   0xe5c1b001
        .long   0xe59d4070
        .long   0xe08eb08c
        .long   0xe08bb000
        .long   0xe1a04144
        .long   0xe5c14003
        .long   0xe59de05c
        .long   0xe08c4000
        .long   0xe2844001
        .long   0xe081e00e
        .long   0xe1a040c4
        .long   0xe58d4070
        .long   0xe5ce4002
        .long   0xe28b4002
        .long   0xe59db070
        .long   0xe1a04144
        .long   0xe08cc080
        .long   0xe7c2b001
        .long   0xe5ce4003
        .long   0xe59db074
        .long   0xe5cb4001
        .long   0xe59d4064
        .long   0xe58dc074
        .long   0xe59dc058
        .long   0xe080b004
        .long   0xe28bb001
        .long   0xe081c00c
        .long   0xe1a0b0cb
        .long   0xe58db070
        .long   0xe58dc06c
        .long   0xe5ccb002
        .long   0xe59db074
        .long   0xe59dc05c
        .long   0xe0800084
        .long   0xe08bb004
        .long   0xe28bb002
        .long   0xe58db074
        .long   0xe59db070
        .long   0xe7ccb001
        .long   0xe59db074
        .long   0xe58d0074
        .long   0xe59d006c
        .long   0xe1a0b14b
        .long   0xe5c0b003
        .long   0xe59d004c
        .long   0xe59dc074
        .long   0xe0844000
        .long   0xe58d4070
        .long   0xe5ceb001
        .long   0xe08c0000
        .long   0xe59dc070
        .long   0xe280e002
        .long   0xe28cc001
        .long   0xe1a000cc
        .long   0xe1a0c14e
        .long   0xe59de058
        .long   0xe7ce0001
        .long   0xe59d006c
        .long   0xe5c0c001
        .long   0xeafffbfd
LKWG_bd.1.8:
        .long   0xe3140001
        .long   0x1a000006
        .long   0xe3a00080
        .long   0xe58d0058
        .long   0xe1a0c000
        .long   0xe3a0b00b
        .long   0xe58dc064
        .long   0xe58db040
        .long   0xea000006
LKWG69:
        .long   0xe0410002
        .long   0xe5d0c000
        .long   0xe58dc058
        .long   0xe5d0c001
        .long   0xe58dc064
        .long   0xe5d0c002
        .long   0xe5d00003
LKWG70:
        .long   0xe3140040
        .long   0x0a000006
        .long   0xe041b002
        .long   0xe5db4005
        .long   0xe5dbe004
        .long   0xe58d405c
        .long   0xe5dbb006
        .long   0xe58db04c
        .long   0xea000002
LKWG71:
        .long   0xe1a0e000
        .long   0xe58de04c
        .long   0xe58de05c
LKWG72:
        .long   0xe59db064
        .long   0xe59d4058
        .long   0xe084400b
        .long   0xe08bb00c
        .long   0xe58db074
        .long   0xe2844001
        .long   0xe58d4070
        .long   0xe59d4074
        .long   0xe2844001
        .long   0xe58d4074
        .long   0xe59d4070
        .long   0xe1a040c4
        .long   0xe5c14000
        .long   0xe59d4074
        .long   0xe1a040c4
        .long   0xe58d4074
        .long   0xe7c14082
        .long   0xe59db074
        .long   0xe08c4000
        .long   0xe2844001
        .long   0xe5c1b001
        .long   0xe1a040c4
        .long   0xe58d4074
        .long   0xe081b082
        .long   0xe58db070
        .long   0xe5cb4001
        .long   0xe59db074
        .long   0xe080400e
        .long   0xe2844001
        .long   0xe5c1b002
        .long   0xe59db070
        .long   0xe1a040c4
        .long   0xe5cb4002
        .long   0xe5c14003
        .long   0xe59d405c
        .long   0xe59db064
        .long   0xe08e4004
        .long   0xe2844001
        .long   0xe58d4074
        .long   0xe59d4058
        .long   0xe084b08b
        .long   0xe58db06c
        .long   0xe59d4074
        .long   0xe59db070
        .long   0xe1a040c4
        .long   0xe5cb4003
        .long   0xe59db06c
        .long   0xe59d4064
        .long   0xe08bb00c
        .long   0xe28bb002
        .long   0xe084408c
        .long   0xe0844000
        .long   0xe1a0b14b
        .long   0xe2844002
        .long   0xe7c2b001
        .long   0xe1a0b144
        .long   0xe0824082
        .long   0xe58d4074
        .long   0xe7c1b004
        .long   0xe08cc080
        .long   0xe0814002
        .long   0xe08cc00e
        .long   0xe5c4b001
        .long   0xe59db05c
        .long   0xe28cc002
        .long   0xe1a0c14c
        .long   0xe58dc070
        .long   0xe59dc074
        .long   0xe080000b
        .long   0xe59db070
        .long   0xe081c00c
        .long   0xe080008e
        .long   0xe5ccb001
        .long   0xe280b002
        .long   0xe59d0070
        .long   0xe1a0b14b
        .long   0xe5c40002
        .long   0xe59d005c
        .long   0xe58db074
        .long   0xe59db04c
        .long   0xe08b0080
        .long   0xe080e00e
        .long   0xe59d0074
        .long   0xe5cc0002
        .long   0xe28e0002
        .long   0xe59de074
        .long   0xe1a00140
        .long   0xe5c4e003
        .long   0xe5cc0003
        .long   0xeafffb87
LKWG_bd.1.9:
        .long   0xe3140002
        .long   0x1a000009
        .long   0xe3a00080
        .long   0xe58d005c
        .long   0xe3a0400b
        .long   0xe1a0e000
        .long   0xe58d4040
        .long   0xe082b082
        .long   0xe1a0c00e
        .long   0xe1a04082
        .long   0xe58db064
        .long   0xea00000a
LKWG73:
        .long   0xe5510001
        .long   0xe1a04082
        .long   0xe081c002
        .long   0xe58d005c
        .long   0xe0820082
        .long   0xe58d0064
        .long   0xe55cc001
        .long   0xe081e004
        .long   0xe55ee001
        .long   0xe0810000
        .long   0xe5500001
LKWG74:
        .long   0xe59db05c
        .long   0xe08bb08c
        .long   0xe58db074
        .long   0xe59db05c
        .long   0xe08bb00c
        .long   0xe58db070
        .long   0xe59db074
        .long   0xe08bb00e
        .long   0xe58db074
        .long   0xe08cb00e
        .long   0xe58db06c
        .long   0xe59db070
        .long   0xe08cc08e
        .long   0xe08cc000
        .long   0xe28bb001
        .long   0xe58db070
        .long   0xe59db074
        .long   0xe28cc002
        .long   0xe28bb002
        .long   0xe58db074
        .long   0xe59db06c
        .long   0xe1a0c14c
        .long   0xe28bb001
        .long   0xe58db06c
        .long   0xe59db070
        .long   0xe1a0b0cb
        .long   0xe58db070
        .long   0xe59db074
        .long   0xe1a0b14b
        .long   0xe58db074
        .long   0xe59db070
        .long   0xe5c1b000
        .long   0xe59db074
        .long   0xe5c1b001
        .long   0xe59db06c
        .long   0xe1a0b0cb
        .long   0xe58db074
        .long   0xe7c2b001
        .long   0xe59db074
        .long   0xe5c1b002
        .long   0xe081b002
        .long   0xe58db074
        .long   0xe5cbc001
        .long   0xe5c1c003
        .long   0xe08ec000
        .long   0xe28cc001
        .long   0xe58dc070
        .long   0xe59dc070
        .long   0xe08ee080
        .long   0xe08ee000
        .long   0xe1a0c0cc
        .long   0xe58dc070
        .long   0xe7c4c001
        .long   0xe28ec002
        .long   0xe59de070
        .long   0xe59db074
        .long   0xe1a0c14c
        .long   0xe0814004
        .long   0xe5cbe002
        .long   0xe5c4c001
        .long   0xe59de074
        .long   0xe5cec003
        .long   0xe59de064
        .long   0xe081c00e
        .long   0xe5cc0003
        .long   0xe5cc0002
        .long   0xe5cc0001
        .long   0xe7ce0001
        .long   0xe5c40003
        .long   0xe5c40002
        .long   0xeafffb29
LKWG75:
        mvn     r0, #7
        add     sp, sp, #0xA0
        ldmia   sp!, {r4 - r11, pc}
LKWG_bt.1:
        .long   0x00000008
        .long   0x000005e0
        .long   0x000006ac
        .long   0x00000850
        .long   0x000009e4
        .long   0x00000c30
        .long   0x00000e78
        .long   0x000010d8
        .long   0x000012b0
