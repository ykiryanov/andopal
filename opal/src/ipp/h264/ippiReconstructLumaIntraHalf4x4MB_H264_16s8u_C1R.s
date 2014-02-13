        .text
        .align  4
        .globl  _ippiReconstructLumaIntraHalf4x4MB_H264_16s8u_C1R


_ippiReconstructLumaIntraHalf4x4MB_H264_16s8u_C1R:
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
        beq     LKWE74
        cmp     r1, #0
        beq     LKWE74
        ldr     r5, [r0]
        cmp     r5, #0
        str     r5, [sp, #0x1C]
        beq     LKWE74
        cmp     r12, #0
        beq     LKWE74
        cmp     r3, #0
        beq     LKWE74
        cmp     r4, #0x33
        bls     LKWE0
        mvn     r0, #0xA
        add     sp, sp, #0xA0
        ldmia   sp!, {r4 - r11, pc}
LKWE0:
        ldr     r8, [pc, #0xFD8]
        ldr     r7, [pc, #0xFD8]
        ldr     r6, [pc, #0xFD8]
        ldr     r9, [pc, #0xFD8]
        and     r11, lr, #4
        str     r11, [sp, #0x28]
        and     r11, lr, #1
        str     r11, [sp, #0x2C]
        and     r11, lr, #0x20
        mov     r5, #0
        str     r11, [sp, #0x30]
        str     r5, [sp, #0x40]
        mvn     r11, #0xFF
        mov     r10, #1
        str     r11, [sp, #0x34]
        str     r12, [sp, #0x14]
        str     lr, [sp, #0x10]
        str     r4, [sp, #0xC]
        str     r0, [sp]
LKWE1:
        ldrb    r12, [r8], #1
        ldr     r4, [r3], #4
        ldrb    r0, [r7], #1
        cmp     r12, #0
        beq     LKWE2
        ldr     r12, [sp, #0x28]
        cmp     r12, #0
        movne   r12, #1
        bne     LKWE3
LKWE2:
        mov     r12, #0
LKWE3:
        cmp     r0, #0
        beq     LKWE4
        ldr     r0, [sp, #0x2C]
        cmp     r0, #0
        movne   r0, #1
        bne     LKWE5
LKWE4:
        cmp     r12, #0
        movne   r0, #0
        beq     LKWE6
LKWE5:
        cmp     r5, #0
        bne     LKWE7
        ldr     lr, [sp, #0x10]
        tst     lr, #0x10
        bne     LKWE7
        b       LKWE8
LKWE6:
        ldr     r0, [sp, #0x10]
        tst     r0, #0x10
        moveq   r0, #0
        beq     LKWE8
        cmp     r5, #0
        movne   r0, #0
        moveq   r0, #0
        bne     LKWE8
LKWE7:
        mov     lr, #1
        str     lr, [sp, #0x50]
        b       LKWE9
LKWE8:
        mov     lr, #0
        str     lr, [sp, #0x50]
LKWE9:
        cmp     r12, #0
        beq     LKWE10
        cmp     r5, #5
        bne     LKWE11
LKWE10:
        ldrb    lr, [r6]
        cmp     lr, #0
        beq     LKWE11
        ldr     lr, [sp, #0x30]
        cmp     lr, #0
        beq     LKWE12
        cmp     r5, #5
        bne     LKWE12
LKWE11:
        mov     lr, #1
        b       LKWE13
LKWE12:
        mov     lr, #0
LKWE13:
        cmp     r12, #0
        mov     r12, #0
        mov     r11, #1
        moveq   r12, r11
        cmp     r0, #0
        mov     r0, #0
        mov     r11, #1
        moveq   r0, r11
        str     r0, [sp, #0x64]
        ldr     r0, [sp, #0x50]
        mov     r11, #1
        sub     r4, r4, #9
        cmp     r0, #0
        mov     r0, #0
        moveq   r0, r11
        ldr     r11, [pc, #0xE8C]
        cmp     lr, #0
        mov     lr, #1
        str     r11, [sp, #0x60]
        mov     r11, #0
        moveq   r11, lr
        ldr     lr, [sp, #0x60]
        adds    r4, #9						//SB		cmn     r4, #9
        ldrcs   lr, [lr, +r4, lsl #2]
        ldr     r4, [sp, #0x64]
        orr     r4, r12, r4, lsl #1
        orr     r0, r4, r0, lsl #5
        orr     r0, r0, r11, lsl #6
        mov     r12, r1
        addcs   pc, pc, lr
        mvn     r0, #0xA
LKWE_.Lpc1:
        add     sp, sp, #0xA0
        ldmia   sp!, {r4 - r11, pc}
LKWE_bd.1.1:
        .long   0xe3100001
        .long   0x0a00001c
        .long   0xe0410002
        .long   0xe5d0e000
        .long   0xe0824082
        .long   0xe081c004
        .long   0xe7c1e004
        .long   0xe7c1e082
        .long   0xe7c2e001
        .long   0xe5c1e000
        .long   0xe5d04001
        .long   0xe081b002
        .long   0xe58db064
        .long   0xe5cc4001
        .long   0xe081e082
        .long   0xe5ce4001
        .long   0xe5cb4001
        .long   0xe5c14001
        .long   0xe5d04002
        .long   0xe5cc4002
        .long   0xe5ce4002
        .long   0xe59db064
        .long   0xe5cb4002
        .long   0xe5c14002
        .long   0xe5d00003
        .long   0xe5cc0003
        .long   0xe5ce0003
        .long   0xe59dc064
        .long   0xe5cc0003
        .long   0xe5c10003
        .long   0xea000015
LKWE14:
        .long   0xe3a0c080
        .long   0xe5c1c003
        .long   0xe5c1c002
        .long   0xe5c1c001
        .long   0xe5c1c000
        .long   0xe081e002
        .long   0xe5cec003
        .long   0xe5cec002
        .long   0xe5cec001
        .long   0xe7c2c001
        .long   0xe082000e
        .long   0xe7cec002
        .long   0xe5c0c003
        .long   0xe5c0c002
        .long   0xe5c0c001
        .long   0xe082e000
        .long   0xe7c0c002
        .long   0xe5cec003
        .long   0xe5cec002
        .long   0xe5cec001
        .long   0xe3a0000b
        .long   0xe58d0040
LKWE15:
        .long   0xe59d0008
        .long   0xe110000a
        .long   0x0a000119
        .long   0xe59dc018
        .long   0xe59f0d64
        .long   0xe35c0000
        .long   0xe59dc00c
        .long   0xe08c009c
        .long   0xe1a0012c
        .long   0x0a0000ec
        .long   0xe59dc00c
        .long   0xe35c0000
        .long   0x8a0000e9
LKWE16:
        .long   0xe59d000c
        .long   0xe3500000
        .long   0x1a0000bb
        .long   0xe59d0018
        .long   0xe3500000
        .long   0x0a0000b8
LKWE17:
        .long   0xe59dc01c
        .long   0xe28db080
        .long   0xe28c0008
        .long   0xe58d0050
        .long   0xe59d0018
        .long   0xe28ce010
        .long   0xe28c4018
        .long   0xe58de054
        .long   0xe58d404c
        .long   0xe58bc000
        .long   0xe59db050
        .long   0xe28dc080
        .long   0xe3500000
        .long   0xe58cb004
        .long   0xe28dc080
        .long   0xe58ce008
        .long   0xe28dc080
        .long   0xe3a00000
        .long   0xe58c400c
        .long   0x0a000002
        .long   0xe59dc00c
        .long   0xe35c0000
        .long   0x9a00005c
LKWE18:
        .long   0xe1a0c000
        .long   0xe58d5024
        .long   0xe58da020
        .long   0xe58d2068
        .long   0xe58d1004
LKWE19:
        .long   0xe28d1080
        .long   0xe791e10c
        .long   0xe28cc001
        .long   0xe35c0003
        .long   0xe1de20f2
        .long   0xe1de40f6
        .long   0xe1de50f0
        .long   0xe1dea0f4
        .long   0xe06410c2
        .long   0xe08220c4
        .long   0xe085400a
        .long   0xe045500a
        .long   0xe1a01801
        .long   0xe1a02802
        .long   0xe1a04804
        .long   0xe1a05805
        .long   0xe1a01841
        .long   0xe1a02842
        .long   0xe082b844
        .long   0xe081a845
        .long   0xe0615845
        .long   0xe0624844
        .long   0xe1ceb0b0
        .long   0xe1cea0b2
        .long   0xe1ce50b4
        .long   0xe1ce40b6
        .long   0xdaffffe4
        .long   0xe59d5024
        .long   0xe59d2068
        .long   0xe59da020
        .long   0xe59d1004
        .long   0xe3a0c000
        .long   0xe58dc058
        .long   0xe58d3048
        .long   0xe58d5024
        .long   0xe58d2068
        .long   0xe59d3058
        .long   0xe59de04c
        .long   0xe59d2054
        .long   0xe59d4050
        .long   0xe59d501c
        .long   0xe3a0c004
        .long   0xe58d7044
        .long   0xe58d803c
        .long   0xe58d9038
        .long   0xe58da020
        .long   0xe58d1004
LKWE20:
        .long   0xe1d410f0
        .long   0xe1de80f0
        .long   0xe19590f3
        .long   0xe1d2a0f0
        .long   0xe25cc001
        .long   0xe08170c8
        .long   0xe06810c1
        .long   0xe089800a
        .long   0xe049900a
        .long   0xe1a07807
        .long   0xe1a01801
        .long   0xe1a0b809
        .long   0xe1a08808
        .long   0xe1a07847
        .long   0xe1a0a841
        .long   0xe0879848
        .long   0xe2891020
        .long   0xe08a984b
        .long   0xe2899020
        .long   0xe1a01341
        .long   0xe18510b3
        .long   0xe06ab84b
        .long   0xe28b1020
        .long   0xe1a09349
        .long   0xe0c490b2
        .long   0xe1a01341
        .long   0xe0678848
        .long   0xe0c210b2
        .long   0xe2888020
        .long   0xe1a01348
        .long   0xe0ce10b2
        .long   0xe2833002
        .long   0x1affffde
        .long   0xe59d3048
        .long   0xe59d7044
        .long   0xe59d803c
        .long   0xe59d9038
        .long   0xe59d5024
        .long   0xe59da020
        .long   0xe59d2068
        .long   0xe59d1004
LKWE21:
        .long   0xe1a0c001
        .long   0xe58d7044
        .long   0xe58d9038
        .long   0xe59d7034
        .long   0xe59f9b4c
        .long   0xe58d803c
        .long   0xe58d3048
        .long   0xe58d5024
        .long   0xe58da020
        .long   0xe58d1004
        .long   0xe3a08c01
LKWE22:
        .long   0xe28d1080
        .long   0xe7911100
        .long   0xe5dc3000
        .long   0xe5dce001
        .long   0xe1d1a0f0
        .long   0xe5dc4002
        .long   0xe5dc5003
        .long   0xe1a0b007
        .long   0xe15a0007
        .long   0xc1a0b00a
        .long   0xe35b0c01
        .long   0xc1a0b008
        .long   0xe089b00b
        .long   0xe08b3003
        .long   0xe5d33100
        .long   0xe2800001
        .long   0xe1a0a007
        .long   0xe5cc3000
        .long   0xe1d130f2
        .long   0xe1530007
        .long   0xc1a0a003
        .long   0xe35a0c01
        .long   0xc1a0a008
        .long   0xe089a00a
        .long   0xe08ae00e
        .long   0xe5de3100
        .long   0xe1a0e007
        .long   0xe5cc3001
        .long   0xe1d130f4
        .long   0xe1530007
        .long   0xc1a0e003
        .long   0xe35e0c01
        .long   0xc1a0e008
        .long   0xe089e00e
        .long   0xe08e4004
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
        .long   0xe59d3048
        .long   0xe59d7044
        .long   0xe59d803c
        .long   0xe59d9038
        .long   0xe59d5024
        .long   0xe59da020
        .long   0xe59d1004
        .long   0xea000026
LKWE23:
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
        .long   0xe59f4a08
        .long   0xe0840000
LKWE24:
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
LKWE25:
        .long   0xe59d001c
        .long   0xe2800020
        .long   0xe58d001c
        .long   0xea000025
LKWE26:
        .long   0xe240b004
        .long   0xe58db054
        .long   0xe260c003
        .long   0xe3a0b001
        .long   0xe1a0cc1b
        .long   0xe58d9038
        .long   0xe58d5024
        .long   0xe58da020
        .long   0xe59d5054
        .long   0xe59d901c
        .long   0xe59da014
        .long   0xe59db00c
        .long   0xe3a04000
        .long   0xe1a0e004
        .long   0xe2600004
        .long   0xe58d2068
        .long   0xe58d1004
LKWE27:
        .long   0xe1a02084
        .long   0xe19910f2
        .long   0xe3510000
        .long   0x0a00000c
        .long   0xe19ae0f2
        .long   0xe35b0018
        .long   0x200e0e91
        .long   0x21a0e51e
        .long   0x2a000001
        .long   0xe02ece91
        .long   0xe1a0e05e
LKWE28:
        .long   0xe2844001
        .long   0xe3540010
        .long   0xe189e0b2
        .long   0xb3a0e001
        .long   0xbaffffef
        .long   0xea000012
LKWE29:
        .long   0xe2844001
        .long   0xe3540010
        .long   0xbaffffeb
        .long   0xea000016
LKWE30:
        .long   0xe1d9c0d1
        .long   0xe1f900d2
        .long   0xe2866001
        .long   0xe081c00c
        .long   0xe2855001
        .long   0xe021c092
        .long   0xe3550008
        .long   0xe1a0a08a
        .long   0x3afffe4e
        .long   0xe59d0000
        .long   0xe59d101c
        .long   0xe5801000
        .long   0xe59d0040
        .long   0xe28dd0a0
        .long   0xe8bd8ff0
LKWE31:
        .long   0xe58da014
        .long   0xe59d9038
        .long   0xe59d5024
        .long   0xe59da020
        .long   0xe59d2068
        .long   0xe59d1004
        .long   0xe58db00c
        .long   0xeafffede
LKWE32:
        .long   0xe58da014
        .long   0xe59d9038
        .long   0xe59d5024
        .long   0xe59da020
        .long   0xe59d2068
        .long   0xe59d1004
        .long   0xe35e0000
        .long   0xe58db00c
        .long   0x1afffed5
        .long   0xeafffece
LKWE_bd.1.2:
        .long   0xe3100002
        .long   0x0a000019
        .long   0xe551e001
        .long   0xe0810002
        .long   0xe082c000
        .long   0xe5c1e003
        .long   0xe5c1e002
        .long   0xe5c1e001
        .long   0xe5c1e000
        .long   0xe550e001
        .long   0xe082400c
        .long   0xe58d4064
        .long   0xe5c0e003
        .long   0xe5c0e002
        .long   0xe5c0e001
        .long   0xe7c2e001
        .long   0xe55ce001
        .long   0xe7c0e002
        .long   0xe5cce003
        .long   0xe5cce002
        .long   0xe5cce001
        .long   0xe59de064
        .long   0xe55e0001
        .long   0xe5ce0003
        .long   0xe5ce0002
        .long   0xe5ce0001
        .long   0xe7cc0002
        .long   0xeafffea5
LKWE33:
        .long   0xe3a0c080
        .long   0xe5c1c003
        .long   0xe5c1c002
        .long   0xe5c1c001
        .long   0xe5c1c000
        .long   0xe081e002
        .long   0xe5cec003
        .long   0xe5cec002
        .long   0xe5cec001
        .long   0xe7c2c001
        .long   0xe082000e
        .long   0xe7cec002
        .long   0xe5c0c003
        .long   0xe5c0c002
        .long   0xe5c0c001
        .long   0xe082e000
        .long   0xe7c0c002
        .long   0xe5cec003
        .long   0xe5cec002
        .long   0xe5cec001
        .long   0xe3a0000b
        .long   0xe58d0040
        .long   0xeafffe8e
LKWE_bd.1.3:
        .long   0xe200c003
        .long   0xe35c0003
        .long   0x0a00003d
        .long   0xe3100001
        .long   0x0a000010
        .long   0xe0410002
        .long   0xe5d0c001
        .long   0xe5d0e000
        .long   0xe5d04002
        .long   0xe08ec00c
        .long   0xe58d4064
        .long   0xe59de064
        .long   0xe5d00003
        .long   0xe08cc00e
        .long   0xe58d0060
        .long   0xe59de060
        .long   0xe0810002
        .long   0xe08ce00e
        .long   0xe28ec002
        .long   0xe1a0c14c
        .long   0xe20cc0ff
        .long   0xea000016
LKWE34:
        .long   0xe3100002
        .long   0xe0810002
        .long   0x03a0c080
        .long   0x0a000012
        .long   0xe551c001
        .long   0xe58dc064
        .long   0xe550c001
        .long   0xe59d4064
        .long   0xe58dc060
        .long   0xe081c082
        .long   0xe55cc001
        .long   0xe59de060
        .long   0xe58dc05c
        .long   0xe082c082
        .long   0xe08cc001
        .long   0xe55cc001
        .long   0xe084e00e
        .long   0xe59d405c
        .long   0xe08e4004
        .long   0xe084c00c
        .long   0xe28cc002
        .long   0xe1a0c14c
        .long   0xe20cc0ff
LKWE35:
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
        .long   0xeafffe4d
LKWE36:
        .long   0xe041c002
        .long   0xe5dce000
        .long   0xe0810002
        .long   0xe58de064
        .long   0xe5dce001
        .long   0xe58de060
        .long   0xe5dce002
        .long   0xe58de05c
        .long   0xe5dcc003
        .long   0xe59de064
        .long   0xe58dc058
        .long   0xe551c001
        .long   0xe59d4058
        .long   0xe58dc054
        .long   0xe550c001
        .long   0xe58dc050
        .long   0xe081c082
        .long   0xe55cc001
        .long   0xe59db050
        .long   0xe58dc04c
        .long   0xe082c082
        .long   0xe08cc001
        .long   0xe55cc001
        .long   0xe58dc06c
        .long   0xe59dc060
        .long   0xe08ec00c
        .long   0xe59de054
        .long   0xe084400e
        .long   0xe59de04c
        .long   0xe08be00e
        .long   0xe59db05c
        .long   0xe084e00e
        .long   0xe08cc00b
        .long   0xe08cc00e
        .long   0xe59de06c
        .long   0xe08ce00e
        .long   0xe28ec004
        .long   0xe1a0c1cc
        .long   0xe20cc0ff
        .long   0xeaffffc3
LKWE_bd.1.4:
        .long   0xe3100001
        .long   0x0a000013
        .long   0xe041e002
        .long   0xe5de4000
        .long   0xe58d406c
        .long   0xe5de4001
        .long   0xe59db06c
        .long   0xe58d4064
        .long   0xe5de4002
        .long   0xe58d4060
        .long   0xe5dee003
        .long   0xe28d4078
        .long   0xe5c4b000
        .long   0xe59db064
        .long   0xe28d4078
        .long   0xe5c4b001
        .long   0xe59db060
        .long   0xe28d4078
        .long   0xe5c4b002
        .long   0xe28d4078
        .long   0xe5c4e003
        .long   0xea00000a
LKWE37:
        .long   0xe28d4078
        .long   0xe3a0e080
        .long   0xe5c4e003
        .long   0xe28d4078
        .long   0xe5c4e002
        .long   0xe28d4078
        .long   0xe5c4e001
        .long   0xe28d4078
        .long   0xe5c4e000
        .long   0xe3a0400b
        .long   0xe58d4040
LKWE38:
        .long   0xe3100040
        .long   0x0a00000f
        .long   0xe0410002
        .long   0xe5d0e004
        .long   0xe58de06c
        .long   0xe5d0e005
        .long   0xe59db06c
        .long   0xe58de064
        .long   0xe5d04006
        .long   0xe5d0e007
        .long   0xe28d0078
        .long   0xe5c0b004
        .long   0xe59db064
        .long   0xe28d0078
        .long   0xe5c0b005
        .long   0xe28d0078
        .long   0xe5c04006
        .long   0xea000006
LKWE39:
        .long   0xe1a0400e
        .long   0xe28d0078
        .long   0xe5c0e006
        .long   0xe28d0078
        .long   0xe5c0e005
        .long   0xe28d0078
        .long   0xe5c0e004
LKWE40:
        .long   0xe28d0078
        .long   0xe5c0e007
        .long   0xe3a00000
        .long   0xe58d803c
        .long   0xe58d9038
        .long   0xe58d5024
        .long   0xe58da020
        .long   0xe58d1004
LKWE41:
        .long   0xe08e508e
        .long   0xe0845005
        .long   0xe28d1078
        .long   0xe2858002
        .long   0xe3a09000
        .long   0xe0815000
LKWE42:
        .long   0xe0891005
        .long   0xe5d1b001
        .long   0xe7d5a009
        .long   0xe5d11002
        .long   0xe08ab08b
        .long   0xe08b1001
        .long   0xe2811002
LKWE43:
        .long   0xe1a01141
        .long   0xe7c9100c
        .long   0xe2899001
        .long   0xe3590004
        .long   0xaa000002
        .long   0xe3590003
        .long   0x0a00000a
        .long   0xeafffff0
LKWE44:
        .long   0xe2800001
        .long   0xe3500004
        .long   0xe082c00c
        .long   0xbaffffe6
        .long   0xe59d803c
        .long   0xe59d9038
        .long   0xe59d5024
        .long   0xe59da020
        .long   0xe59d1004
        .long   0xeafffdc4
LKWE45:
        .long   0xe3500003
        .long   0x01a01008
        .long   0x0affffea
        .long   0xeaffffe2
LKWE_bd.1.5:
        .long   0xe3100020
        .long   0xe28d4098
        .long   0x1a000004
        .long   0xe3a0e080
        .long   0xe5c4e000
        .long   0xe3a0400b
        .long   0xe58d4040
        .long   0xea000002
LKWE46:
        .long   0xe041e002
        .long   0xe55ee001
        .long   0xe5c4e000
LKWE47:
        .long   0xe28d4090
        .long   0xe3100002
        .long   0xe5c4e000
        .long   0x1a00000c
        .long   0xe3a04080
        .long   0xe58d4054
        .long   0xe28db090
        .long   0xe5cb4004
        .long   0xe28db090
        .long   0xe5cb4003
        .long   0xe28db090
        .long   0xe5cb4002
        .long   0xe28db090
        .long   0xe5cb4001
        .long   0xe3a0400b
        .long   0xe58d4040
        .long   0xea000018
LKWE48:
        .long   0xe5514001
        .long   0xe082b082
        .long   0xe58db06c
        .long   0xe58d4054
        .long   0xe081b002
        .long   0xe55bb001
        .long   0xe58db064
        .long   0xe081b082
        .long   0xe55bb001
        .long   0xe58db060
        .long   0xe59db06c
        .long   0xe08bb001
        .long   0xe55bb001
        .long   0xe58db06c
        .long   0xe28db090
        .long   0xe5cb4001
        .long   0xe59db064
        .long   0xe28d4090
        .long   0xe5c4b002
        .long   0xe59db060
        .long   0xe28d4090
        .long   0xe5c4b003
        .long   0xe59db06c
        .long   0xe28d4090
        .long   0xe5c4b004
LKWE49:
        .long   0xe3100001
        .long   0x1a00000b
        .long   0xe28d0098
        .long   0xe3a04080
        .long   0xe5c04004
        .long   0xe28d0098
        .long   0xe5c04003
        .long   0xe28d0098
        .long   0xe5c04002
        .long   0xe28d0098
        .long   0xe5c04001
        .long   0xe3a0000b
        .long   0xe58d0040
        .long   0xea000012
LKWE50:
        .long   0xe0410002
        .long   0xe5d0b001
        .long   0xe5d04000
        .long   0xe58db06c
        .long   0xe5d0b002
        .long   0xe58db064
        .long   0xe5d00003
        .long   0xe58d0060
        .long   0xe28d0098
        .long   0xe5c04001
        .long   0xe59db06c
        .long   0xe28d0098
        .long   0xe5c0b002
        .long   0xe59db064
        .long   0xe28d0098
        .long   0xe5c0b003
        .long   0xe59db060
        .long   0xe28d0098
        .long   0xe5c0b004
LKWE51:
        .long   0xe59d0054
        .long   0xe58d9038
        .long   0xe58d5024
        .long   0xe0840000
        .long   0xe080000e
        .long   0xe28ee002
        .long   0xe080000e
        .long   0xe3a0e000
        .long   0xe1a00140
        .long   0xe58da020
        .long   0xe58d1004
LKWE52:
        .long   0xe35e0000
        .long   0xda00000f
        .long   0xe28d1090
        .long   0xe3a05000
        .long   0xe081400e
LKWE53:
        .long   0xe0441005
        .long   0xe551a001
        .long   0xe5d19000
        .long   0xe5d11001
        .long   0xe08aa009
        .long   0xe08a9009
        .long   0xe0891001
        .long   0xe2811002
        .long   0xe1a01141
        .long   0xe7c5100c
        .long   0xe2855001
        .long   0xe155000e
        .long   0xbafffff2
LKWE54:
        .long   0xe28e5001
        .long   0xe3550004
        .long   0xe1a04005
        .long   0xaa00000e
        .long   0xe28d1098
        .long   0xe041100e
        .long   0xe0841001
LKWE55:
        .long   0xe551b001
        .long   0xe5d19000
        .long   0xe5f1a001
        .long   0xe08bb009
        .long   0xe08b9009
        .long   0xe089a00a
        .long   0xe28a9002
        .long   0xe1a09149
        .long   0xe7c4900c
        .long   0xe2844001
        .long   0xe3540004
        .long   0xbafffff3
LKWE56:
        .long   0xe7cc000e
        .long   0xe3550004
        .long   0xe1a0e005
        .long   0xe082c00c
        .long   0xbaffffd5
        .long   0xe59d9038
        .long   0xe59d5024
        .long   0xe59da020
        .long   0xe59d1004
        .long   0xeafffd30
LKWE_bd.1.6:
        .long   0xe3100020
        .long   0x1a000004
        .long   0xe3a0c080
        .long   0xe58dc054
        .long   0xe3a0c00b
        .long   0xe58dc040
        .long   0xea000002
LKWE57:
        .long   0xe041c002
        .long   0xe55cc001
        .long   0xe58dc054
LKWE58:
        .long   0xe3100001
        .long   0x1a000006
        .long   0xe3a0e080
        .long   0xe1a0c00e
        .long   0xe58dc058
        .long   0xe3a0b00b
        .long   0xe1a0400c
        .long   0xe58db040
        .long   0xea000005
LKWE59:
        .long   0xe041b002
        .long   0xe5dbe000
        .long   0xe5db4001
        .long   0xe5dbc002
        .long   0xe5dbb003
        .long   0xe58db058
LKWE60:
        .long   0xe3100002
        .long   0x1a000008
        .long   0xe3a00080
        .long   0xe58d0050
        .long   0xe58d0064
        .long   0xe58d0060
        .long   0xe3a0000b
        .long   0xe58d0040
        .long   0xe1a00082
        .long   0xe58d004c
        .long   0xea000009
LKWE61:
        .long   0xe5510001
        .long   0xe081b002
        .long   0xe58d0050
        .long   0xe1a00082
        .long   0xe58d004c
        .long   0xe55bb001
        .long   0xe0810000
        .long   0xe58db060
        .long   0xe5500001
        .long   0xe58d0064
LKWE62:
        .long   0xe59db04c
        .long   0xe59d0054
        .long   0xe081b00b
        .long   0xe58db06c
        .long   0xe59db06c
        .long   0xe080000e
        .long   0xe2800001
        .long   0xe1a000c0
        .long   0xe58d005c
        .long   0xe5cb0001
        .long   0xe59db05c
        .long   0xe08e0004
        .long   0xe2800001
        .long   0xe5c1b000
        .long   0xe59db06c
        .long   0xe1a000c0
        .long   0xe58d005c
        .long   0xe5cb0002
        .long   0xe59db05c
        .long   0xe084000c
        .long   0xe2800001
        .long   0xe5c1b001
        .long   0xe59db06c
        .long   0xe1a000c0
        .long   0xe5cb0003
        .long   0xe59db058
        .long   0xe5c10002
        .long   0xe08cb00b
        .long   0xe28b0001
        .long   0xe59db054
        .long   0xe1a000c0
        .long   0xe08eb08b
        .long   0xe58db06c
        .long   0xe5c10003
        .long   0xe59db06c
        .long   0xe59d0050
        .long   0xe08b0000
        .long   0xe2800002
        .long   0xe082b082
        .long   0xe1a00140
        .long   0xe58d005c
        .long   0xe58db06c
        .long   0xe59d006c
        .long   0xe59db05c
        .long   0xe0810000
        .long   0xe58d0070
        .long   0xe5c0b001
        .long   0xe59d0054
        .long   0xe59db05c
        .long   0xe080008e
        .long   0xe0800004
        .long   0xe2800002
        .long   0xe7c2b001
        .long   0xe59db070
        .long   0xe1a00140
        .long   0xe58d005c
        .long   0xe5cb0002
        .long   0xe08ee084
        .long   0xe08eb00c
        .long   0xe59de05c
        .long   0xe0810002
        .long   0xe28bb002
        .long   0xe5c0e001
        .long   0xe59de070
        .long   0xe1a0b14b
        .long   0xe58db05c
        .long   0xe5ceb003
        .long   0xe59de058
        .long   0xe084c08c
        .long   0xe59d4054
        .long   0xe08cc00e
        .long   0xe59de050
        .long   0xe59db050
        .long   0xe28cc002
        .long   0xe084e08e
        .long   0xe59d4060
        .long   0xe1a0c14c
        .long   0xe08ee004
        .long   0xe28ee002
        .long   0xe08b4084
        .long   0xe59db05c
        .long   0xe5c0c003
        .long   0xe5c0b002
        .long   0xe59d0064
        .long   0xe0844000
        .long   0xe1a0014e
        .long   0xe59de04c
        .long   0xe284c002
        .long   0xe1a0c14c
        .long   0xe7ce0001
        .long   0xe59d006c
        .long   0xe7c1c000
        .long   0xeafffca5
        .long   top_edge_tab16
        .long   left_edge_tab16
        .long   above_right_avail_4x4
        .long   xyoff
        .long   LKWE_bt.1
        .long   0xaaaaaaab
        .long   ClampTbl
LKWE_bd.1.7:
        .long   0xe3100020
        .long   0x1041c002
        .long   0x155cc001
        .long   0x1a000002
        .long   0xe3a0e00b
        .long   0xe3a0c080
        .long   0xe58de040
LKWE63:
        .long   0xe3100001
        .long   0x1a000006
        .long   0xe3a0e080
        .long   0xe58de054
        .long   0xe58de04c
        .long   0xe58de060
        .long   0xe3a0e00b
        .long   0xe58de040
        .long   0xea000006
LKWE64:
        .long   0xe041e002
        .long   0xe5de4000
        .long   0xe58d4054
        .long   0xe5de4001
        .long   0xe58d4060
        .long   0xe5dee002
        .long   0xe58de04c
LKWE65:
        .long   0xe3100002
        .long   0x1a00000a
        .long   0xe3a0e080
        .long   0xe1a0000e
        .long   0xe3a0400b
        .long   0xe58d4040
        .long   0xe58d0064
        .long   0xe1a04082
        .long   0xe58d4058
        .long   0xe58d0050
        .long   0xe0824082
        .long   0xe58d405c
        .long   0xea00000c
LKWE66:
        .long   0xe551e001
        .long   0xe1a04082
        .long   0xe58d4058
        .long   0xe082b082
        .long   0xe58db05c
        .long   0xe0814004
        .long   0xe5544001
        .long   0xe0810002
        .long   0xe5500001
        .long   0xe58d4050
        .long   0xe081b00b
        .long   0xe55b4001
        .long   0xe58d4064
LKWE67:
        .long   0xe59db054
        .long   0xe08c400e
        .long   0xe2844001
        .long   0xe08bb08c
        .long   0xe58db070
        .long   0xe081b002
        .long   0xe58db074
        .long   0xe1a040c4
        .long   0xe58d406c
        .long   0xe5cb4002
        .long   0xe59d4070
        .long   0xe59db06c
        .long   0xe084400e
        .long   0xe2844002
        .long   0xe5c1b000
        .long   0xe59db054
        .long   0xe1a04144
        .long   0xe58d406c
        .long   0xe08cb08b
        .long   0xe58db070
        .long   0xe59db074
        .long   0xe5cb4003
        .long   0xe59d4060
        .long   0xe59db054
        .long   0xe08bb084
        .long   0xe58db054
        .long   0xe59db070
        .long   0xe08b4004
        .long   0xe58d4070
        .long   0xe59d404c
        .long   0xe59db054
        .long   0xe08b4004
        .long   0xe59db070
        .long   0xe2844002
        .long   0xe28bb002
        .long   0xe58db070
        .long   0xe59db06c
        .long   0xe1a04144
        .long   0xe5c1b001
        .long   0xe59db070
        .long   0xe5c14003
        .long   0xe08e4000
        .long   0xe1a0b14b
        .long   0xe5c1b002
        .long   0xe284b001
        .long   0xe08c408e
        .long   0xe1a0c0cb
        .long   0xe59db058
        .long   0xe58dc070
        .long   0xe0844000
        .long   0xe081b00b
        .long   0xe58db06c
        .long   0xe5cbc002
        .long   0xe284c002
        .long   0xe59d4070
        .long   0xe1a0c14c
        .long   0xe08ee080
        .long   0xe7c24001
        .long   0xe59d406c
        .long   0xe5c4c003
        .long   0xe59d4074
        .long   0xe5c4c001
        .long   0xe59dc050
        .long   0xe59db05c
        .long   0xe58de074
        .long   0xe080400c
        .long   0xe2844001
        .long   0xe081b00b
        .long   0xe1a040c4
        .long   0xe58d4070
        .long   0xe5cb4002
        .long   0xe59d4074
        .long   0xe59de070
        .long   0xe080008c
        .long   0xe084400c
        .long   0xe2844002
        .long   0xe58d4074
        .long   0xe59d4058
        .long   0xe7c4e001
        .long   0xe59d4074
        .long   0xe58d0074
        .long   0xe1a04144
        .long   0xe5cb4003
        .long   0xe59d0064
        .long   0xe08cc000
        .long   0xe58dc070
        .long   0xe59dc074
        .long   0xe08c0000
        .long   0xe59dc06c
        .long   0xe5cc4001
        .long   0xe59dc070
        .long   0xe28ce001
        .long   0xe280c002
        .long   0xe1a000ce
        .long   0xe59de05c
        .long   0xe1a0c14c
        .long   0xe5cbc001
        .long   0xe7ce0001
        .long   0xeafffc0a
LKWE_bd.1.8:
        .long   0xe3100001
        .long   0x1a000006
        .long   0xe3a0c080
        .long   0xe58dc050
        .long   0xe1a0e00c
        .long   0xe3a0b00b
        .long   0xe58de054
        .long   0xe58db040
        .long   0xea000006
LKWE68:
        .long   0xe041c002
        .long   0xe5dce000
        .long   0xe58de050
        .long   0xe5dce001
        .long   0xe58de054
        .long   0xe5dce002
        .long   0xe5dcc003
LKWE69:
        .long   0xe3100040
        .long   0x0a000006
        .long   0xe0410002
        .long   0xe5d0b005
        .long   0xe5d04004
        .long   0xe58db04c
        .long   0xe5d00006
        .long   0xe58d0064
        .long   0xea000002
LKWE70:
        .long   0xe1a0400c
        .long   0xe58d4064
        .long   0xe58d404c
LKWE71:
        .long   0xe59d0050
        .long   0xe59db054
        .long   0xe080000b
        .long   0xe2800001
        .long   0xe08bb00e
        .long   0xe58db074
        .long   0xe59db074
        .long   0xe1a000c0
        .long   0xe28bb001
        .long   0xe58db074
        .long   0xe5c10000
        .long   0xe59d0074
        .long   0xe1a000c0
        .long   0xe58d0074
        .long   0xe7c10082
        .long   0xe59db074
        .long   0xe08e000c
        .long   0xe2800001
        .long   0xe5c1b001
        .long   0xe081b082
        .long   0xe1a000c0
        .long   0xe58db070
        .long   0xe58d0074
        .long   0xe5cb0001
        .long   0xe59db074
        .long   0xe08c0004
        .long   0xe2800001
        .long   0xe5c1b002
        .long   0xe59db070
        .long   0xe1a000c0
        .long   0xe5cb0002
        .long   0xe5c10003
        .long   0xe59d004c
        .long   0xe59db050
        .long   0xe0840000
        .long   0xe2800001
        .long   0xe58d0074
        .long   0xe59d0054
        .long   0xe08b0080
        .long   0xe59db070
        .long   0xe58d006c
        .long   0xe59d0074
        .long   0xe1a000c0
        .long   0xe5cb0003
        .long   0xe59db06c
        .long   0xe59d0054
        .long   0xe08bb00e
        .long   0xe58db074
        .long   0xe59db074
        .long   0xe080008e
        .long   0xe080000c
        .long   0xe28bb002
        .long   0xe58db074
        .long   0xe59db074
        .long   0xe2800002
        .long   0xe08ee08c
        .long   0xe1a0b14b
        .long   0xe7c2b001
        .long   0xe082b082
        .long   0xe1a00140
        .long   0xe58d0074
        .long   0xe58db070
        .long   0xe7c1000b
        .long   0xe59db074
        .long   0xe0810002
        .long   0xe08ee004
        .long   0xe5c0b001
        .long   0xe59db04c
        .long   0xe28ee002
        .long   0xe1a0e14e
        .long   0xe58de074
        .long   0xe59de070
        .long   0xe08cc00b
        .long   0xe59db074
        .long   0xe081e00e
        .long   0xe08cc084
        .long   0xe5ceb001
        .long   0xe28cb002
        .long   0xe59dc074
        .long   0xe1a0b14b
        .long   0xe5c0c002
        .long   0xe58db074
        .long   0xe59db04c
        .long   0xe59dc064
        .long   0xe08cb08b
        .long   0xe59dc074
        .long   0xe08b4004
        .long   0xe5cec002
        .long   0xe284c002
        .long   0xe59d4074
        .long   0xe1a0c14c
        .long   0xe5c04003
        .long   0xe5cec003
        .long   0xeafffb90
LKWE_bd.1.9:
        .long   0xe3100002
        .long   0x1a000009
        .long   0xe3a00080
        .long   0xe58d0054
        .long   0xe3a0400b
        .long   0xe1a0e000
        .long   0xe58d4040
        .long   0xe082b082
        .long   0xe1a0c00e
        .long   0xe1a04082
        .long   0xe58db050
        .long   0xea00000a
LKWE72:
        .long   0xe5510001
        .long   0xe1a04082
        .long   0xe081c002
        .long   0xe58d0054
        .long   0xe0820082
        .long   0xe58d0050
        .long   0xe55cc001
        .long   0xe081e004
        .long   0xe55ee001
        .long   0xe0810000
        .long   0xe5500001
LKWE73:
        .long   0xe59db054
        .long   0xe08bb08c
        .long   0xe58db074
        .long   0xe59db054
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
        .long   0xe08ee080
        .long   0xe1a0c0cc
        .long   0xe58dc070
        .long   0xe7c4c001
        .long   0xe08ee000
        .long   0xe28ec002
        .long   0xe59de074
        .long   0xe59db070
        .long   0xe1a0c14c
        .long   0xe0814004
        .long   0xe5ceb002
        .long   0xe5c4c001
        .long   0xe59de074
        .long   0xe5cec003
        .long   0xe59dc050
        .long   0xe081e00c
        .long   0xe5ce0003
        .long   0xe5ce0002
        .long   0xe5ce0001
        .long   0xe7cc0001
        .long   0xe5c40003
        .long   0xe5c40002
        .long   0xeafffb34
LKWE74:
        mvn     r0, #7
        add     sp, sp, #0xA0
        ldmia   sp!, {r4 - r11, pc}
LKWE_bt.1:
        .long   0x00000008
        .long   0x000005D4
        .long   0x000006A0
        .long   0x00000844
        .long   0x000009D8
        .long   0x00000C18
        .long   0x00000E60
        .long   0x000010B0
        .long   0x00001298
