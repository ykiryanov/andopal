        .text
        .align  4
        .globl  _ippiReconstructLumaIntraHalfMB_H264_16s8u_C1R


_ippiReconstructLumaIntraHalfMB_H264_16s8u_C1R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x9C
        ldr     r12, [sp, #0xC0]
        ldr     lr, [sp, #0xC4]
        str     r12, [sp, #8]
        ldr     r12, [sp, #0xC8]
        cmp     r0, #0
        beq     LKWP69
        cmp     r1, #0
        beq     LKWP69
        ldr     r9, [r0]
        cmp     r9, #0
        beq     LKWP69
        cmp     r2, #0
        ble     LKWP68
        cmp     lr, #0
        blt     LKWP0
        cmp     lr, #0x33
        ble     LKWP1
LKWP0:
        mvn     r0, #0xA
        add     sp, sp, #0x9C
        ldmia   sp!, {r4 - r11, pc}
LKWP1:
        ldr     r4, [pc, #0xFCC]
        ldr     r5, [pc, #0xFCC]
        ldr     r6, [pc, #0xFCC]
        and     r11, r12, #4
        str     r11, [sp, #0x1C]
        and     r11, r12, #1
        add     lr, r4, lr, lsl #5
        ldr     r4, [pc, #0xFBC]
        str     r11, [sp, #0x20]
        and     r11, r12, #0x20
        str     lr, [sp, #0x28]
        ldr     lr, [pc, #0xFB0]
        str     r11, [sp, #0x24]
        mov     r10, #0
        mvn     r11, #0xFF
        mov     r8, #1
        mov     r7, r10
        str     r11, [sp, #0x2C]
        str     r10, [sp, #0x40]
        str     r12, [sp, #0xC]
        str     r0, [sp]
LKWP2:
        ldr     r0, [r3], #4
        ldrb    r12, [r5], #1
        str     r0, [sp, #0x5C]
        ldrb    r0, [r4], #1
        cmp     r12, #0
        beq     LKWP3
        ldr     r12, [sp, #0x1C]
        cmp     r12, #0
        movne   r10, #1
        bne     LKWP4
LKWP3:
        mov     r10, #0
LKWP4:
        cmp     r0, #0
        beq     LKWP5
        ldr     r0, [sp, #0x20]
        cmp     r0, #0
        movne   r12, #1
        bne     LKWP6
LKWP5:
        cmp     r10, #0
        movne   r12, #0
        beq     LKWP7
LKWP6:
        cmp     r7, #0
        bne     LKWP8
        ldr     r0, [sp, #0xC]
        tst     r0, #0x10
        bne     LKWP8
        b       LKWP9
LKWP7:
        ldr     r0, [sp, #0xC]
        tst     r0, #0x10
        moveq   r12, #0
        beq     LKWP9
        cmp     r7, #0
        movne   r12, #0
        moveq   r12, #0
        bne     LKWP9
LKWP8:
        mov     r0, #1
        b       LKWP10
LKWP9:
        mov     r0, #0
LKWP10:
        cmp     r10, #0
        beq     LKWP11
        cmp     r7, #5
        bne     LKWP12
LKWP11:
        ldrb    r11, [lr]
        cmp     r11, #0
        beq     LKWP12
        ldr     r11, [sp, #0x24]
        cmp     r11, #0
        beq     LKWP13
        cmp     r7, #5
        bne     LKWP13
LKWP12:
        mov     r11, #1
        str     r11, [sp, #0x60]
        b       LKWP14
LKWP13:
        mov     r11, #0
        str     r11, [sp, #0x60]
LKWP14:
        cmp     r10, #0
        mov     r10, #0
        mov     r11, #1
        moveq   r10, r11
        cmp     r12, #0
        str     r10, [sp, #0x58]
        mov     r12, #0
        mov     r10, #1
        moveq   r12, r10
        cmp     r0, #0
        str     r12, [sp, #0x54]
        mov     r0, #0
        mov     r12, #1
        moveq   r0, r12
        ldr     r12, [pc, #0xE7C]
        mov     r10, #1
        str     r12, [sp, #0x50]
        ldr     r12, [sp, #0x60]
        ldr     r11, [sp, #0x50]
        cmp     r12, #0
        mov     r12, #0
        moveq   r12, r10
        ldr     r10, [sp, #0x5C]
        sub     r10, r10, #9
        adds    r10, #9								@//SB	cmn     r10, #9
        ldrcs   r10, [r11, +r10, lsl #2]
        ldr     r11, [sp, #0x54]
        strcs   r10, [sp, #0x60]
        ldr     r10, [sp, #0x58]
        orr     r11, r10, r11, lsl #1
        ldr     r10, [sp, #0x60]
        orr     r0, r11, r0, lsl #5
        orr     r0, r0, r12, lsl #6
        mov     r12, r1
        addcs   pc, pc, r10
        mvn     r0, #0xA
LKWP_.Lpc1:
        add     sp, sp, #0x9C
        ldmia   sp!, {r4 - r11, pc}
LKWP_bd.1.1:
        .long   0xe3100001
        .long   0x0a000021
        .long   0xe0410002
        .long   0xe5d0b000
        .long   0xe082a082
        .long   0xe081c00a
        .long   0xe58dc060
        .long   0xe7c1b00a
        .long   0xe7c1b082
        .long   0xe7c2b001
        .long   0xe5c1b000
        .long   0xe5d0a001
        .long   0xe59db060
        .long   0xe081c082
        .long   0xe58dc05c
        .long   0xe081c002
        .long   0xe5cba001
        .long   0xe59db05c
        .long   0xe5cba001
        .long   0xe5cca001
        .long   0xe5c1a001
        .long   0xe59db060
        .long   0xe5d0a002
        .long   0xe5cba002
        .long   0xe59db05c
        .long   0xe5cba002
        .long   0xe5cca002
        .long   0xe5c1a002
        .long   0xe59da060
        .long   0xe5d00003
        .long   0xe5ca0003
        .long   0xe59da05c
        .long   0xe5ca0003
        .long   0xe5cc0003
        .long   0xe5c10003
        .long   0xea000015
LKWP15:
        .long   0xe3a00080
        .long   0xe5c10003
        .long   0xe5c10002
        .long   0xe5c10001
        .long   0xe5c10000
        .long   0xe081a002
        .long   0xe5ca0003
        .long   0xe5ca0002
        .long   0xe5ca0001
        .long   0xe7c20001
        .long   0xe082c00a
        .long   0xe7ca0002
        .long   0xe5cc0003
        .long   0xe5cc0002
        .long   0xe5cc0001
        .long   0xe082a00c
        .long   0xe5ca0003
        .long   0xe5ca0002
        .long   0xe5ca0001
        .long   0xe7cc0002
        .long   0xe3a0000b
        .long   0xe58d0040
LKWP16:
        .long   0xe59d0008
        .long   0xe1100008
        .long   0x0a0000f6
        .long   0xe59d0028
        .long   0xe1d9a0f0
        .long   0xe3a0b002
        .long   0xe1d0c0f4
        .long   0xe58db058
        .long   0xe2800002
        .long   0xe58dc060
        .long   0xe59db060
        .long   0xe3a0c000
        .long   0xe00b0a9b
        .long   0xe3a0a00f
        .long   0xe1c9b0b0
        .long   0xe58d1004
        .long   0xe59d1058
        .long   0xe58d2064
LKWP17:
        .long   0xe199b0f1
        .long   0xe35b0000
        .long   0x0a000003
        .long   0xe1d020f0
        .long   0xe3a0c001
        .long   0xe002029b
        .long   0xe18920b1
LKWP18:
        .long   0xe25aa001
        .long   0xe2811002
        .long   0xe2800002
        .long   0x1afffff4
        .long   0xe59d2064
        .long   0xe59d1004
        .long   0xe35c0000
        .long   0x1a000028
        .long   0xe1d900f0
        .long   0xe1a0a001
        .long   0xe3a0c004
        .long   0xe2800020
        .long   0xe58d8014
        .long   0xe58d9010
        .long   0xe1a00340
        .long   0xe58d1004
        .long   0xe1a00800
        .long   0xe1a0b840
        .long   0xe59d002c
        .long   0xe15b0000
        .long   0xc1a0000b
        .long   0xe3500c01
        .long   0xe3a0bc01
        .long   0xc1a0000b
        .long   0xe59fbc74
        .long   0xe08b0000
LKWP19:
        .long   0xe5da8000
        .long   0xe5da1001
        .long   0xe5da9002
        .long   0xe5dab003
        .long   0xe0808008
        .long   0xe5d88100
        .long   0xe0801001
        .long   0xe5d11100
        .long   0xe0809009
        .long   0xe5d99100
        .long   0xe080b00b
        .long   0xe5dbb100
        .long   0xe5ca8000
        .long   0xe5ca1001
        .long   0xe5ca9002
        .long   0xe5cab003
        .long   0xe25cc001
        .long   0xe082a00a
        .long   0x1affffec
        .long   0xe59d8014
        .long   0xe59d9010
        .long   0xe59d1004
        .long   0xea0000ae
LKWP20:
        .long   0xe28d007c
        .long   0xe5809000
        .long   0xe28d007c
        .long   0xe289b008
        .long   0xe580b004
        .long   0xe28d007c
        .long   0xe289a010
        .long   0xe580a008
        .long   0xe28d007c
        .long   0xe289c018
        .long   0xe580c00c
        .long   0xe3a00000
        .long   0xe58d5034
        .long   0xe58d6030
        .long   0xe58d7018
        .long   0xe58d8014
        .long   0xe58d9010
        .long   0xe58d2064
        .long   0xe58d1004
LKWP21:
        .long   0xe28d107c
        .long   0xe7915100
        .long   0xe2800001
        .long   0xe3500003
        .long   0xe1d520f2
        .long   0xe1d560f6
        .long   0xe1d570f0
        .long   0xe1d580f4
        .long   0xe06610c2
        .long   0xe08220c6
        .long   0xe0876008
        .long   0xe0477008
        .long   0xe1a01801
        .long   0xe1a02802
        .long   0xe1a06806
        .long   0xe1a07807
        .long   0xe1a01841
        .long   0xe1a02842
        .long   0xe0829846
        .long   0xe0818847
        .long   0xe0617847
        .long   0xe0626846
        .long   0xe1c590b0
        .long   0xe1c580b2
        .long   0xe1c570b4
        .long   0xe1c560b6
        .long   0xdaffffe4
        .long   0xe59d2064
        .long   0xe59d5034
        .long   0xe59d6030
        .long   0xe59d7018
        .long   0xe59d8014
        .long   0xe59d9010
        .long   0xe59d1004
        .long   0xe3a00000
        .long   0xe58d0058
        .long   0xe58d2064
        .long   0xe59d2058
        .long   0xe3a00004
        .long   0xe58d4038
        .long   0xe58d5034
        .long   0xe58d6030
        .long   0xe58d7018
        .long   0xe58d8014
        .long   0xe58d1004
LKWP22:
        .long   0xe1dc10f0
        .long   0xe1db50f0
        .long   0xe19960f2
        .long   0xe1da70f0
        .long   0xe2500001
        .long   0xe08540c1
        .long   0xe06110c5
        .long   0xe0865007
        .long   0xe0466007
        .long   0xe1a04804
        .long   0xe1a01801
        .long   0xe1a08806
        .long   0xe1a05805
        .long   0xe1a04844
        .long   0xe1a07841
        .long   0xe0846845
        .long   0xe2861020
        .long   0xe0876848
        .long   0xe2866020
        .long   0xe1a01341
        .long   0xe18910b2
        .long   0xe0678848
        .long   0xe0645845
        .long   0xe2881020
        .long   0xe1a06346
        .long   0xe0cb60b2
        .long   0xe2855020
        .long   0xe1a01341
        .long   0xe0ca10b2
        .long   0xe1a05345
        .long   0xe0cc50b2
        .long   0xe2822002
        .long   0x1affffde
        .long   0xe59d7018
        .long   0xe59d8014
        .long   0xe59d1004
        .long   0xe59d4038
        .long   0xe59d5034
        .long   0xe59d6030
        .long   0xe59d2064
        .long   0xe58d7018
        .long   0xe58d9010
        .long   0xe59d702c
        .long   0xe59f9a64
        .long   0xe58d8014
        .long   0xe1a0c001
        .long   0xe3a00000
        .long   0xe58d303c
        .long   0xe58d4038
        .long   0xe58d5034
        .long   0xe58d6030
        .long   0xe58d1004
        .long   0xe3a08c01
LKWP23:
        .long   0xe28d107c
        .long   0xe7911100
        .long   0xe5dc3000
        .long   0xe5dc4001
        .long   0xe1d1a0f0
        .long   0xe5dc5002
        .long   0xe5dc6003
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
        .long   0xe08a4004
        .long   0xe5d43100
        .long   0xe1a04007
        .long   0xe5cc3001
        .long   0xe1d130f4
        .long   0xe1530007
        .long   0xc1a04003
        .long   0xe3540c01
        .long   0xc1a04008
        .long   0xe0894004
        .long   0xe0845005
        .long   0xe5d53100
        .long   0xe5cc3002
        .long   0xe1d110f6
        .long   0xe1a03007
        .long   0xe1510007
        .long   0xc1a03001
        .long   0xe3530c01
        .long   0xc1a03008
        .long   0xe0893003
        .long   0xe0836006
        .long   0xe5d61100
        .long   0xe3500004
        .long   0xe5cc1003
        .long   0xe082c00c
        .long   0xbaffffcd
        .long   0xe59d303c
        .long   0xe59d4038
        .long   0xe59d5034
        .long   0xe59d6030
        .long   0xe59d7018
        .long   0xe59d8014
        .long   0xe59d9010
        .long   0xe59d1004
LKWP24:
        .long   0xe2899020
LKWP25:
        .long   0xe1d6c0d1
        .long   0xe1f600d2
        .long   0xe28ee001
        .long   0xe081c00c
        .long   0xe2877001
        .long   0xe021c092
        .long   0xe3570008
        .long   0xe1a08088
        .long   0x3afffe66
        .long   0xe59d0000
        .long   0xe59da040
        .long   0xe5809000
        .long   0xe1a0000a
        .long   0xe28dd09c
        .long   0xe8bd8ff0
LKWP_bd.1.2:
        .long   0xe3100002
        .long   0x0a000017
        .long   0xe551c001
        .long   0xe0810002
        .long   0xe082a000
        .long   0xe5c1c003
        .long   0xe5c1c002
        .long   0xe5c1c001
        .long   0xe5c1c000
        .long   0xe550b001
        .long   0xe082c00a
        .long   0xe5c0b003
        .long   0xe5c0b002
        .long   0xe5c0b001
        .long   0xe7c2b001
        .long   0xe55ab001
        .long   0xe7c0b002
        .long   0xe5cab003
        .long   0xe5cab002
        .long   0xe5cab001
        .long   0xe55c0001
        .long   0xe5cc0003
        .long   0xe5cc0002
        .long   0xe5cc0001
        .long   0xe7ca0002
        .long   0xeafffedc
LKWP26:
        .long   0xe3a00080
        .long   0xe5c10003
        .long   0xe5c10002
        .long   0xe5c10001
        .long   0xe5c10000
        .long   0xe081a002
        .long   0xe5ca0003
        .long   0xe5ca0002
        .long   0xe5ca0001
        .long   0xe7c20001
        .long   0xe082c00a
        .long   0xe7ca0002
        .long   0xe5cc0003
        .long   0xe5cc0002
        .long   0xe5cc0001
        .long   0xe082a00c
        .long   0xe5ca0003
        .long   0xe5ca0002
        .long   0xe5ca0001
        .long   0xe7cc0002
        .long   0xe3a0000b
        .long   0xe58d0040
        .long   0xeafffec5
LKWP_bd.1.3:
        .long   0xe200c003
        .long   0xe35c0003
        .long   0x0a00003d
        .long   0xe3100001
        .long   0x0a000010
        .long   0xe041b002
        .long   0xe5dba001
        .long   0xe5dbc000
        .long   0xe5db0002
        .long   0xe08ca00a
        .long   0xe58d0060
        .long   0xe59dc060
        .long   0xe5dbb003
        .long   0xe0810002
        .long   0xe08aa00c
        .long   0xe58db05c
        .long   0xe59dc05c
        .long   0xe08ac00c
        .long   0xe28cc002
        .long   0xe1a0c14c
        .long   0xe20cc0ff
        .long   0xea000016
LKWP27:
        .long   0xe3100002
        .long   0xe0810002
        .long   0x03a0c080
        .long   0x0a000012
        .long   0xe551c001
        .long   0xe58dc060
        .long   0xe550c001
        .long   0xe59da060
        .long   0xe58dc05c
        .long   0xe081c082
        .long   0xe55cc001
        .long   0xe59db05c
        .long   0xe58dc058
        .long   0xe082c082
        .long   0xe08cc001
        .long   0xe55cc001
        .long   0xe08aa00b
        .long   0xe59db058
        .long   0xe08ab00b
        .long   0xe08bc00c
        .long   0xe28cc002
        .long   0xe1a0c14c
        .long   0xe20cc0ff
LKWP28:
        .long   0xe5c1c003
        .long   0xe5c1c002
        .long   0xe5c1c001
        .long   0xe5c1c000
        .long   0xe081a002
        .long   0xe5cac003
        .long   0xe5cac002
        .long   0xe5cac001
        .long   0xe7c2c001
        .long   0xe082a000
        .long   0xe7c0c002
        .long   0xe5cac003
        .long   0xe5cac002
        .long   0xe5cac001
        .long   0xe082000a
        .long   0xe5c0c003
        .long   0xe5c0c002
        .long   0xe5c0c001
        .long   0xe7cac002
        .long   0xeafffe84
LKWP29:
        .long   0xe041c002
        .long   0xe5dca000
        .long   0xe0810002
        .long   0xe58da060
        .long   0xe5dca001
        .long   0xe58da05c
        .long   0xe5dca002
        .long   0xe58da058
        .long   0xe5dcc003
        .long   0xe59da05c
        .long   0xe58dc054
        .long   0xe551c001
        .long   0xe58dc050
        .long   0xe550c001
        .long   0xe59db050
        .long   0xe58dc04c
        .long   0xe081c082
        .long   0xe55cc001
        .long   0xe58dc048
        .long   0xe082c082
        .long   0xe08cc001
        .long   0xe55cc001
        .long   0xe58dc044
        .long   0xe59dc060
        .long   0xe08ca00a
        .long   0xe59dc054
        .long   0xe08cb00b
        .long   0xe59dc04c
        .long   0xe58db060
        .long   0xe59db048
        .long   0xe08cc00b
        .long   0xe59db058
        .long   0xe08aa00b
        .long   0xe59db060
        .long   0xe08bc00c
        .long   0xe08ac00c
        .long   0xe59da044
        .long   0xe08ca00a
        .long   0xe28ac004
        .long   0xe1a0c1cc
        .long   0xe20cc0ff
        .long   0xeaffffc1
LKWP_bd.1.4:
        .long   0xe3100001
        .long   0x0a000015
        .long   0xe041a002
        .long   0xe5dab000
        .long   0xe58db060
        .long   0xe5dab001
        .long   0xe58db058
        .long   0xe5dab002
        .long   0xe58db054
        .long   0xe5daa003
        .long   0xe28db074
        .long   0xe58da05c
        .long   0xe59da060
        .long   0xe5cba000
        .long   0xe59da058
        .long   0xe28db074
        .long   0xe5cba001
        .long   0xe59da054
        .long   0xe28db074
        .long   0xe5cba002
        .long   0xe59da05c
        .long   0xe28db074
        .long   0xe5cba003
        .long   0xea00000b
LKWP30:
        .long   0xe3a0a080
        .long   0xe58da05c
        .long   0xe28db074
        .long   0xe5cba003
        .long   0xe28db074
        .long   0xe5cba002
        .long   0xe28db074
        .long   0xe5cba001
        .long   0xe28db074
        .long   0xe5cba000
        .long   0xe3a0a00b
        .long   0xe58da040
LKWP31:
        .long   0xe3100040
        .long   0x0a000013
        .long   0xe041a002
        .long   0xe5da0004
        .long   0xe28db074
        .long   0xe58d0060
        .long   0xe5da0005
        .long   0xe58d0058
        .long   0xe5da0006
        .long   0xe5daa007
        .long   0xe58da05c
        .long   0xe59da060
        .long   0xe5cba004
        .long   0xe59da058
        .long   0xe28db074
        .long   0xe5cba005
        .long   0xe28da074
        .long   0xe5ca0006
        .long   0xe59da05c
        .long   0xe28db074
        .long   0xe5cba007
        .long   0xea000008
LKWP32:
        .long   0xe59d005c
        .long   0xe28da074
        .long   0xe5ca0007
        .long   0xe28da074
        .long   0xe5ca0006
        .long   0xe28da074
        .long   0xe5ca0005
        .long   0xe28da074
        .long   0xe5ca0004
LKWP33:
        .long   0xe59da05c
        .long   0xe58d7018
        .long   0xe58d8014
        .long   0xe08aa08a
        .long   0xe080000a
        .long   0xe3a0a000
        .long   0xe2800002
        .long   0xe58d9010
        .long   0xe58d1004
LKWP34:
        .long   0xe28d1074
        .long   0xe3a08000
        .long   0xe081700a
LKWP35:
        .long   0xe0881007
        .long   0xe5d1b001
        .long   0xe7d79008
        .long   0xe5d11002
        .long   0xe089b08b
        .long   0xe08b1001
        .long   0xe2811002
LKWP36:
        .long   0xe1a01141
        .long   0xe7c8100c
        .long   0xe2888001
        .long   0xe3580004
        .long   0xaa000002
        .long   0xe3580003
        .long   0x0a000009
        .long   0xeafffff0
LKWP37:
        .long   0xe28aa001
        .long   0xe35a0004
        .long   0xe082c00c
        .long   0xbaffffe9
        .long   0xe59d7018
        .long   0xe59d8014
        .long   0xe59d9010
        .long   0xe59d1004
        .long   0xeafffdf3
LKWP38:
        .long   0xe35a0003
        .long   0x01a01000
        .long   0x0affffeb
        .long   0xeaffffe3
LKWP_bd.1.5:
        .long   0xe3100020
        .long   0x1a000006
        .long   0xe3a0a080
        .long   0xe58da05c
        .long   0xe28db094
        .long   0xe5cba000
        .long   0xe3a0a00b
        .long   0xe58da040
        .long   0xea000004
LKWP39:
        .long   0xe041a002
        .long   0xe55aa001
        .long   0xe28db094
        .long   0xe58da05c
        .long   0xe5cba000
LKWP40:
        .long   0xe59da05c
        .long   0xe28db08c
        .long   0xe3100002
        .long   0xe5cba000
        .long   0x1a00000c
        .long   0xe3a0a080
        .long   0xe58da058
        .long   0xe28db08c
        .long   0xe5cba004
        .long   0xe28db08c
        .long   0xe5cba003
        .long   0xe28db08c
        .long   0xe5cba002
        .long   0xe28db08c
        .long   0xe5cba001
        .long   0xe3a0a00b
        .long   0xe58da040
        .long   0xea000019
LKWP41:
        .long   0xe551a001
        .long   0xe28db08c
        .long   0xe58da058
        .long   0xe082a082
        .long   0xe58da060
        .long   0xe081a002
        .long   0xe55aa001
        .long   0xe58da054
        .long   0xe081a082
        .long   0xe55aa001
        .long   0xe58da050
        .long   0xe59da060
        .long   0xe08aa001
        .long   0xe55aa001
        .long   0xe58da060
        .long   0xe59da058
        .long   0xe5cba001
        .long   0xe59da054
        .long   0xe28db08c
        .long   0xe5cba002
        .long   0xe59da050
        .long   0xe28db08c
        .long   0xe5cba003
        .long   0xe59da060
        .long   0xe28db08c
        .long   0xe5cba004
LKWP42:
        .long   0xe3100001
        .long   0x1a00000b
        .long   0xe28da094
        .long   0xe3a00080
        .long   0xe5ca0004
        .long   0xe28da094
        .long   0xe5ca0003
        .long   0xe28da094
        .long   0xe5ca0002
        .long   0xe28da094
        .long   0xe5ca0001
        .long   0xe3a0a00b
        .long   0xe58da040
        .long   0xea000015
LKWP43:
        .long   0xe041a002
        .long   0xe58da060
        .long   0xe5da0000
        .long   0xe5daa001
        .long   0xe28db094
        .long   0xe58da054
        .long   0xe59da060
        .long   0xe5daa002
        .long   0xe58da050
        .long   0xe59da060
        .long   0xe5daa003
        .long   0xe58da060
        .long   0xe28da094
        .long   0xe5ca0001
        .long   0xe59da054
        .long   0xe5cba002
        .long   0xe59da050
        .long   0xe28db094
        .long   0xe5cba003
        .long   0xe59da060
        .long   0xe28db094
        .long   0xe5cba004
LKWP44:
        .long   0xe59da058
        .long   0xe58d6030
        .long   0xe58d7018
        .long   0xe080000a
        .long   0xe59da05c
        .long   0xe58d8014
        .long   0xe58d9010
        .long   0xe080000a
        .long   0xe28aa002
        .long   0xe080000a
        .long   0xe3a0a000
        .long   0xe1a00140
        .long   0xe58d1004
LKWP45:
        .long   0xe35a0000
        .long   0xda00000f
        .long   0xe28d108c
        .long   0xe3a07000
        .long   0xe081600a
LKWP46:
        .long   0xe0461007
        .long   0xe5519001
        .long   0xe5d18000
        .long   0xe5d11001
        .long   0xe0899008
        .long   0xe0898008
        .long   0xe0881001
        .long   0xe2811002
        .long   0xe1a01141
        .long   0xe7c7100c
        .long   0xe2877001
        .long   0xe157000a
        .long   0xbafffff2
LKWP47:
        .long   0xe28a7001
        .long   0xe3570004
        .long   0xe1a06007
        .long   0xaa00000e
        .long   0xe28d1094
        .long   0xe041100a
        .long   0xe0861001
LKWP48:
        .long   0xe551b001
        .long   0xe5d18000
        .long   0xe5f19001
        .long   0xe08bb008
        .long   0xe08b8008
        .long   0xe0889009
        .long   0xe2898002
        .long   0xe1a08148
        .long   0xe7c6800c
        .long   0xe2866001
        .long   0xe3560004
        .long   0xbafffff3
LKWP49:
        .long   0xe7cc000a
        .long   0xe3570004
        .long   0xe1a0a007
        .long   0xe082c00c
        .long   0xbaffffd5
        .long   0xe59d6030
        .long   0xe59d7018
        .long   0xe59d8014
        .long   0xe59d9010
        .long   0xe59d1004
        .long   0xeafffd54
LKWP_bd.1.6:
        .long   0xe3100020
        .long   0x1a000004
        .long   0xe3a0c080
        .long   0xe58dc054
        .long   0xe3a0c00b
        .long   0xe58dc040
        .long   0xea000002
LKWP50:
        .long   0xe041c002
        .long   0xe55cc001
        .long   0xe58dc054
LKWP51:
        .long   0xe3100001
        .long   0x1a000006
        .long   0xe3a0c080
        .long   0xe1a0a00c
        .long   0xe58da04c
        .long   0xe58da05c
        .long   0xe3a0b00b
        .long   0xe58db040
        .long   0xea000008
LKWP52:
        .long   0xe041b002
        .long   0xe58db060
        .long   0xe5dbc000
        .long   0xe5dba001
        .long   0xe5dbb002
        .long   0xe58db05c
        .long   0xe59db060
        .long   0xe5dbb003
        .long   0xe58db04c
LKWP53:
        .long   0xe3100002
        .long   0x1a000008
        .long   0xe3a00080
        .long   0xe58d0058
        .long   0xe58d0044
        .long   0xe58d0048
        .long   0xe3a0000b
        .long   0xe58d0040
        .long   0xe1a00082
        .long   0xe58d0050
        .long   0xea000009
LKWP54:
        .long   0xe5510001
        .long   0xe081b002
        .long   0xe58d0058
        .long   0xe1a00082
        .long   0xe58d0050
        .long   0xe55bb001
        .long   0xe0810000
        .long   0xe58db048
        .long   0xe5500001
        .long   0xe58d0044
LKWP55:
        .long   0xe59d0054
        .long   0xe59db050
        .long   0xe080000c
        .long   0xe2800001
        .long   0xe081b00b
        .long   0xe58db060
        .long   0xe59db060
        .long   0xe1a000c0
        .long   0xe58d0068
        .long   0xe5cb0001
        .long   0xe59db068
        .long   0xe08c000a
        .long   0xe2800001
        .long   0xe5c1b000
        .long   0xe59db060
        .long   0xe1a000c0
        .long   0xe58d0068
        .long   0xe5cb0002
        .long   0xe59d005c
        .long   0xe59db068
        .long   0xe08a0000
        .long   0xe2800001
        .long   0xe5c1b001
        .long   0xe59db060
        .long   0xe1a000c0
        .long   0xe58d0068
        .long   0xe5cb0003
        .long   0xe59db04c
        .long   0xe59d005c
        .long   0xe080000b
        .long   0xe59db068
        .long   0xe2800001
        .long   0xe5c1b002
        .long   0xe59db054
        .long   0xe1a000c0
        .long   0xe08cb08b
        .long   0xe58db068
        .long   0xe5c10003
        .long   0xe59d0068
        .long   0xe59db058
        .long   0xe080b00b
        .long   0xe28b0002
        .long   0xe082b082
        .long   0xe1a00140
        .long   0xe58d0060
        .long   0xe58db068
        .long   0xe59d0068
        .long   0xe59db060
        .long   0xe0810000
        .long   0xe58d006c
        .long   0xe5c0b001
        .long   0xe59d0054
        .long   0xe59db060
        .long   0xe080008c
        .long   0xe080000a
        .long   0xe2800002
        .long   0xe7c2b001
        .long   0xe59db06c
        .long   0xe1a00140
        .long   0xe58d0060
        .long   0xe5cb0002
        .long   0xe59db05c
        .long   0xe08cc08a
        .long   0xe0810002
        .long   0xe08cc00b
        .long   0xe59db060
        .long   0xe5c0b001
        .long   0xe28cb002
        .long   0xe59dc05c
        .long   0xe1a0b14b
        .long   0xe58db060
        .long   0xe08aa08c
        .long   0xe59dc06c
        .long   0xe5ccb003
        .long   0xe59dc04c
        .long   0xe59db058
        .long   0xe08aa00c
        .long   0xe59dc054
        .long   0xe28aa002
        .long   0xe58da06c
        .long   0xe59da048
        .long   0xe08cc08b
        .long   0xe59db058
        .long   0xe08cc00a
        .long   0xe28cc002
        .long   0xe08ba08a
        .long   0xe59db06c
        .long   0xe1a0c14c
        .long   0xe1a0b14b
        .long   0xe58db06c
        .long   0xe59db060
        .long   0xe5c0b002
        .long   0xe59db06c
        .long   0xe5c0b003
        .long   0xe59d0044
        .long   0xe08aa000
        .long   0xe28a0002
        .long   0xe59da050
        .long   0xe1a00140
        .long   0xe7cac001
        .long   0xe59dc068
        .long   0xe7c1000c
        .long   0xeafffcbc
LKWP_bd.1.7:
        .long   0xe3100020
        .long   0x1a00000b
        .long   0xe3a0c080
        .long   0xe58dc060
        .long   0xe3a0c00b
        .long   0xe58dc040
        .long   0xea000009
        .long   InvQuantTable_w7
        .long   top_edge_tab16
        .long   xyoff
        .long   left_edge_tab16
        .long   above_right_avail_4x4
        .long   LKWP_bt.1
        .long   ClampTbl
LKWP56:
        .long   0xe041c002
        .long   0xe55cc001
        .long   0xe58dc060
LKWP57:
        .long   0xe3100001
        .long   0x1a000006
        .long   0xe3a0c080
        .long   0xe58dc05c
        .long   0xe58dc04c
        .long   0xe58dc048
        .long   0xe3a0c00b
        .long   0xe58dc040
        .long   0xea000006
LKWP58:
        .long   0xe041c002
        .long   0xe5dca000
        .long   0xe58da05c
        .long   0xe5dca001
        .long   0xe58da048
        .long   0xe5dcc002
        .long   0xe58dc04c
LKWP59:
        .long   0xe3100002
        .long   0x1a00000a
        .long   0xe3a0a080
        .long   0xe1a0000a
        .long   0xe3a0c00b
        .long   0xe58dc040
        .long   0xe58d0044
        .long   0xe1a0c082
        .long   0xe58dc054
        .long   0xe58d0058
        .long   0xe082c082
        .long   0xe58dc050
        .long   0xea00000d
LKWP60:
        .long   0xe551a001
        .long   0xe1a0c082
        .long   0xe58dc054
        .long   0xe082b082
        .long   0xe58db050
        .long   0xe081c00c
        .long   0xe55cc001
        .long   0xe081b002
        .long   0xe55b0001
        .long   0xe58dc058
        .long   0xe59dc050
        .long   0xe081c00c
        .long   0xe55cc001
        .long   0xe58dc044
LKWP61:
        .long   0xe59dc060
        .long   0xe59db060
        .long   0xe08cc00a
        .long   0xe28cc001
        .long   0xe58dc06c
        .long   0xe59dc05c
        .long   0xe08cb08b
        .long   0xe59dc06c
        .long   0xe58db068
        .long   0xe081b002
        .long   0xe58db070
        .long   0xe1a0c0cc
        .long   0xe58dc06c
        .long   0xe5cbc002
        .long   0xe59dc068
        .long   0xe08cc00a
        .long   0xe58dc068
        .long   0xe59dc06c
        .long   0xe5c1c000
        .long   0xe59dc068
        .long   0xe59db05c
        .long   0xe28cc002
        .long   0xe58dc06c
        .long   0xe59dc060
        .long   0xe08cb08b
        .long   0xe59dc06c
        .long   0xe58db068
        .long   0xe59db070
        .long   0xe1a0c14c
        .long   0xe58dc06c
        .long   0xe5cbc003
        .long   0xe59db048
        .long   0xe59dc05c
        .long   0xe08cb08b
        .long   0xe59dc068
        .long   0xe58db05c
        .long   0xe59db048
        .long   0xe08cb00b
        .long   0xe59dc05c
        .long   0xe58db068
        .long   0xe59db04c
        .long   0xe08cb00b
        .long   0xe59dc068
        .long   0xe58db05c
        .long   0xe28cc002
        .long   0xe58dc068
        .long   0xe59dc05c
        .long   0xe28cc002
        .long   0xe58dc05c
        .long   0xe59dc06c
        .long   0xe5c1c001
        .long   0xe59dc068
        .long   0xe1a0c14c
        .long   0xe5c1c002
        .long   0xe59dc05c
        .long   0xe1a0c14c
        .long   0xe5c1c003
        .long   0xe59db060
        .long   0xe08ac000
        .long   0xe28cc001
        .long   0xe08bb08a
        .long   0xe58db06c
        .long   0xe59db054
        .long   0xe1a0c0cc
        .long   0xe58dc068
        .long   0xe081b00b
        .long   0xe58db060
        .long   0xe5cbc002
        .long   0xe59db068
        .long   0xe59dc06c
        .long   0xe08aa080
        .long   0xe7c2b001
        .long   0xe59db060
        .long   0xe08cc000
        .long   0xe28cc002
        .long   0xe1a0c14c
        .long   0xe5cbc003
        .long   0xe59db070
        .long   0xe5cbc001
        .long   0xe59dc058
        .long   0xe58da070
        .long   0xe59da050
        .long   0xe080b00c
        .long   0xe28bb001
        .long   0xe081a00a
        .long   0xe1a0b0cb
        .long   0xe58db06c
        .long   0xe58da068
        .long   0xe5cab002
        .long   0xe59db070
        .long   0xe59da054
        .long   0xe080008c
        .long   0xe08bb00c
        .long   0xe28bb002
        .long   0xe58db070
        .long   0xe59db06c
        .long   0xe7cab001
        .long   0xe59db070
        .long   0xe58d0070
        .long   0xe59d0068
        .long   0xe1a0b14b
        .long   0xe5c0b003
        .long   0xe59d0044
        .long   0xe08cc000
        .long   0xe58dc06c
        .long   0xe59dc070
        .long   0xe08c0000
        .long   0xe59dc060
        .long   0xe280a002
        .long   0xe5ccb001
        .long   0xe59dc06c
        .long   0xe28cc001
        .long   0xe1a000cc
        .long   0xe1a0c14a
        .long   0xe59da050
        .long   0xe7ca0001
        .long   0xe59d0068
        .long   0xe5c0c001
        .long   0xeafffc09
LKWP_bd.1.8:
        .long   0xe3100001
        .long   0x1a000007
        .long   0xe3a0c080
        .long   0xe58dc058
        .long   0xe1a0a00c
        .long   0xe58da05c
        .long   0xe3a0b00b
        .long   0xe58da050
        .long   0xe58db040
        .long   0xea000007
LKWP62:
        .long   0xe041c002
        .long   0xe5dca000
        .long   0xe58da058
        .long   0xe5dca001
        .long   0xe58da050
        .long   0xe5dca002
        .long   0xe58da05c
        .long   0xe5dcc003
LKWP63:
        .long   0xe3100040
        .long   0x0a000006
        .long   0xe041b002
        .long   0xe5db0005
        .long   0xe5dba004
        .long   0xe58d0054
        .long   0xe5dbb006
        .long   0xe58db044
        .long   0xea000002
LKWP64:
        .long   0xe1a0a00c
        .long   0xe58da044
        .long   0xe58da054
LKWP65:
        .long   0xe59db058
        .long   0xe59d0050
        .long   0xe08bb000
        .long   0xe58db070
        .long   0xe59db05c
        .long   0xe080b00b
        .long   0xe59d0070
        .long   0xe58db06c
        .long   0xe2800001
        .long   0xe58d0070
        .long   0xe59d006c
        .long   0xe2800001
        .long   0xe58d006c
        .long   0xe59d0070
        .long   0xe1a000c0
        .long   0xe5c10000
        .long   0xe59d006c
        .long   0xe1a000c0
        .long   0xe58d0070
        .long   0xe7c10082
        .long   0xe59d005c
        .long   0xe59db070
        .long   0xe080000c
        .long   0xe2800001
        .long   0xe5c1b001
        .long   0xe081b082
        .long   0xe58db06c
        .long   0xe1a000c0
        .long   0xe58d0070
        .long   0xe5cb0001
        .long   0xe59db070
        .long   0xe08c000a
        .long   0xe2800001
        .long   0xe5c1b002
        .long   0xe59db06c
        .long   0xe1a000c0
        .long   0xe5cb0002
        .long   0xe5c10003
        .long   0xe59d0054
        .long   0xe59db050
        .long   0xe08a0000
        .long   0xe2800001
        .long   0xe58d0070
        .long   0xe59d0058
        .long   0xe080b08b
        .long   0xe59d0070
        .long   0xe58db068
        .long   0xe59db06c
        .long   0xe1a000c0
        .long   0xe5cb0003
        .long   0xe59d0050
        .long   0xe59db05c
        .long   0xe080b08b
        .long   0xe59d0068
        .long   0xe58db070
        .long   0xe59db05c
        .long   0xe080b00b
        .long   0xe59d0070
        .long   0xe58db06c
        .long   0xe082b082
        .long   0xe080000c
        .long   0xe58d0070
        .long   0xe59d006c
        .long   0xe2800002
        .long   0xe58d006c
        .long   0xe59d0070
        .long   0xe2800002
        .long   0xe58d0070
        .long   0xe59d006c
        .long   0xe1a00140
        .long   0xe7c20001
        .long   0xe59d0070
        .long   0xe58db06c
        .long   0xe1a00140
        .long   0xe58d0070
        .long   0xe7c1000b
        .long   0xe0810002
        .long   0xe58d0068
        .long   0xe59d005c
        .long   0xe59db068
        .long   0xe080008c
        .long   0xe080000a
        .long   0xe2800002
        .long   0xe58d0060
        .long   0xe59d0070
        .long   0xe5cb0001
        .long   0xe59d0060
        .long   0xe59db054
        .long   0xe1a00140
        .long   0xe58d0070
        .long   0xe59d006c
        .long   0xe08cb00b
        .long   0xe58db06c
        .long   0xe59db070
        .long   0xe0810000
        .long   0xe5c0b001
        .long   0xe59db06c
        .long   0xe59dc068
        .long   0xe08bb08a
        .long   0xe28bb002
        .long   0xe58db06c
        .long   0xe59db070
        .long   0xe5ccb002
        .long   0xe59db06c
        .long   0xe59dc054
        .long   0xe1a0b14b
        .long   0xe58db070
        .long   0xe59db044
        .long   0xe08bc08c
        .long   0xe08ca00a
        .long   0xe59dc070
        .long   0xe5c0c002
        .long   0xe28ac002
        .long   0xe59da070
        .long   0xe59db068
        .long   0xe1a0c14c
        .long   0xe5cba003
        .long   0xe5c0c003
        .long   0xeafffb74
LKWP_bd.1.9:
        .long   0xe3100002
        .long   0x1a00000a
        .long   0xe3a0b00b
        .long   0xe3a00080
        .long   0xe58db040
        .long   0xe1a0b082
        .long   0xe58d0058
        .long   0xe58db05c
        .long   0xe1a0a000
        .long   0xe082b082
        .long   0xe1a0c00a
        .long   0xe58db054
        .long   0xea00000b
LKWP66:
        .long   0xe5510001
        .long   0xe1a0a082
        .long   0xe58da05c
        .long   0xe58d0058
        .long   0xe0820082
        .long   0xe58d0054
        .long   0xe081c002
        .long   0xe55cc001
        .long   0xe081a00a
        .long   0xe55aa001
        .long   0xe0810000
        .long   0xe5500001
LKWP67:
        .long   0xe59db058
        .long   0xe08bb08c
        .long   0xe58db070
        .long   0xe59db058
        .long   0xe08bb00c
        .long   0xe58db06c
        .long   0xe59db070
        .long   0xe08bb00a
        .long   0xe58db070
        .long   0xe08cb00a
        .long   0xe58db068
        .long   0xe59db06c
        .long   0xe08cc08a
        .long   0xe08cc000
        .long   0xe28bb001
        .long   0xe58db06c
        .long   0xe59db070
        .long   0xe28cc002
        .long   0xe28bb002
        .long   0xe58db070
        .long   0xe59db068
        .long   0xe1a0c14c
        .long   0xe28bb001
        .long   0xe58db068
        .long   0xe59db06c
        .long   0xe1a0b0cb
        .long   0xe58db06c
        .long   0xe59db070
        .long   0xe1a0b14b
        .long   0xe58db070
        .long   0xe59db06c
        .long   0xe5c1b000
        .long   0xe59db070
        .long   0xe5c1b001
        .long   0xe59db068
        .long   0xe1a0b0cb
        .long   0xe58db070
        .long   0xe7c2b001
        .long   0xe59db070
        .long   0xe5c1b002
        .long   0xe081b002
        .long   0xe58db070
        .long   0xe5cbc001
        .long   0xe5c1c003
        .long   0xe08ac000
        .long   0xe28cc001
        .long   0xe58dc06c
        .long   0xe08ac080
        .long   0xe59da06c
        .long   0xe08cc000
        .long   0xe28cc002
        .long   0xe1a0b0ca
        .long   0xe59da05c
        .long   0xe58db06c
        .long   0xe7cab001
        .long   0xe58dc068
        .long   0xe59dc06c
        .long   0xe59db070
        .long   0xe081a00a
        .long   0xe5cbc002
        .long   0xe59dc068
        .long   0xe1a0c14c
        .long   0xe5cac001
        .long   0xe59db070
        .long   0xe5cbc003
        .long   0xe59db054
        .long   0xe081c00b
        .long   0xe5cc0003
        .long   0xe5cc0002
        .long   0xe5cc0001
        .long   0xe7cb0001
        .long   0xe5ca0003
        .long   0xe5ca0002
        .long   0xeafffb11
LKWP68:
        mvn     r0, #0xD
        add     sp, sp, #0x9C
        ldmia   sp!, {r4 - r11, pc}
LKWP69:
        mvn     r0, #7
        add     sp, sp, #0x9C
        ldmia   sp!, {r4 - r11, pc}
LKWP_bt.1:
        .long   0x00000008
        .long   0x00000514
        .long   0x000005D8
        .long   0x00000784
        .long   0x00000930
        .long   0x00000B9C
        .long   0x00000DFC
        .long   0x000010C8
        .long   0x0000131C
