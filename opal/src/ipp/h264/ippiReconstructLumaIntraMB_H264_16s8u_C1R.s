        .text
        .align  4
        .globl  _ippiReconstructLumaIntraMB_H264_16s8u_C1R


_ippiReconstructLumaIntraMB_H264_16s8u_C1R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x9C
        ldr     r12, [sp, #0xC0]
        ldr     lr, [sp, #0xC4]
        str     r12, [sp, #0x28]
        ldr     r12, [sp, #0xC8]
        cmp     r0, #0
        beq     LKWO67
        cmp     r1, #0
        beq     LKWO67
        cmp     r3, #0
        beq     LKWO67
        ldr     r9, [r0]
        cmp     r9, #0
        beq     LKWO67
        cmp     lr, #0x33
        bls     LKWO0
        mvn     r0, #0xA
        add     sp, sp, #0x9C
        ldmia   sp!, {r4 - r11, pc}
LKWO0:
        ldr     r4, [pc, #0xFCC]
        ldr     r5, [pc, #0xFCC]
        ldr     r6, [pc, #0xFCC]
        and     r11, r12, #4
        str     r11, [sp, #0x14]
        and     r11, r12, #1
        add     lr, r4, lr, lsl #5
        ldr     r4, [pc, #0xFBC]
        str     r11, [sp, #0x10]
        and     r11, r12, #0x20
        str     lr, [sp, #8]
        ldr     lr, [pc, #0xFB0]
        str     r11, [sp, #0xC]
        mov     r10, #0
        mvn     r11, #0xFF
        mov     r8, #2
        mov     r7, r10
        str     r11, [sp, #4]
        str     r10, [sp, #0x40]
        str     r12, [sp, #0x24]
        str     r0, [sp, #0x30]
LKWO1:
        ldr     r0, [r3], #4
        ldrb    r12, [r5], #1
        str     r0, [sp, #0x5C]
        ldrb    r0, [r4], #1
        cmp     r12, #0
        beq     LKWO2
        ldr     r12, [sp, #0x14]
        cmp     r12, #0
        movne   r10, #1
        bne     LKWO3
LKWO2:
        mov     r10, #0
LKWO3:
        cmp     r0, #0
        beq     LKWO4
        ldr     r0, [sp, #0x10]
        cmp     r0, #0
        movne   r0, #1
        bne     LKWO5
LKWO4:
        cmp     r10, #0
        movne   r0, #0
        beq     LKWO6
LKWO5:
        cmp     r7, #0
        bne     LKWO7
        ldr     r12, [sp, #0x24]
        tst     r12, #0x10
        bne     LKWO7
        b       LKWO8
LKWO6:
        ldr     r0, [sp, #0x24]
        tst     r0, #0x10
        moveq   r0, #0
        beq     LKWO8
        cmp     r7, #0
        movne   r0, #0
        moveq   r0, #0
        bne     LKWO8
LKWO7:
        mov     r12, #1
        b       LKWO9
LKWO8:
        mov     r12, #0
LKWO9:
        cmp     r10, #0
        beq     LKWO10
        cmp     r7, #5
        bne     LKWO11
LKWO10:
        ldrb    r11, [lr]
        cmp     r11, #0
        beq     LKWO11
        ldr     r11, [sp, #0xC]
        cmp     r11, #0
        beq     LKWO12
        cmp     r7, #5
        bne     LKWO12
LKWO11:
        mov     r11, #1
        str     r11, [sp, #0x60]
        b       LKWO13
LKWO12:
        mov     r11, #0
        str     r11, [sp, #0x60]
LKWO13:
        cmp     r10, #0
        mov     r10, #0
        mov     r11, #1
        moveq   r10, r11
        cmp     r0, #0
        str     r10, [sp, #0x58]
        mov     r0, #0
        mov     r10, #1
        moveq   r0, r10
        cmp     r12, #0
        mov     r12, #0
        mov     r10, #1
        moveq   r12, r10
        ldr     r10, [pc, #0xE80]
        mov     r11, #1
        str     r10, [sp, #0x54]
        ldr     r10, [sp, #0x60]
        cmp     r10, #0
        mov     r10, #0
        moveq   r10, r11
        str     r10, [sp, #0x60]
        ldr     r10, [sp, #0x5C]
        ldr     r11, [sp, #0x54]
        sub     r10, r10, #9
        adds    r10, #9						//SB cmn     r10, #9
        ldrcs   r10, [r11, +r10, lsl #2]
        ldr     r11, [sp, #0x58]
        orr     r0, r11, r0, lsl #1
        orr     r12, r0, r12, lsl #5
        ldr     r0, [sp, #0x60]
        orr     r0, r12, r0, lsl #6
        mov     r12, r1
        addcs   pc, pc, r10
        mvn     r0, #0xA
LKWO_.Lpc1:
        add     sp, sp, #0x9C
        ldmia   sp!, {r4 - r11, pc}
LKWO_bd.1.1:
        .long   0xe3100001
        .long   0x0a000021
        .long   0xe0410002
        .long   0xe5d0b000
        .long   0xe082a082
        .long   0xe081c00a
        .long   0xe7c1b00a
        .long   0xe7c1b082
        .long   0xe7c2b001
        .long   0xe5c1b000
        .long   0xe5d0a001
        .long   0xe081b082
        .long   0xe58db060
        .long   0xe081b002
        .long   0xe58db05c
        .long   0xe5cca001
        .long   0xe59db060
        .long   0xe5cba001
        .long   0xe59db05c
        .long   0xe5cba001
        .long   0xe5c1a001
        .long   0xe5d0a002
        .long   0xe5cca002
        .long   0xe59db060
        .long   0xe5cba002
        .long   0xe59db05c
        .long   0xe5cba002
        .long   0xe5c1a002
        .long   0xe5d00003
        .long   0xe5cc0003
        .long   0xe59dc060
        .long   0xe5cc0003
        .long   0xe59dc05c
        .long   0xe5cc0003
        .long   0xe5c10003
        .long   0xea000015
LKWO14:
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
LKWO15:
        .long   0xe59d0028
        .long   0xe1100008
        .long   0x0a0000f6
        .long   0xe1d900f0
        .long   0xe59db008
        .long   0xe3a0c000
        .long   0xe58d0060
        .long   0xe3a00002
        .long   0xe1dba0f4
        .long   0xe58d0058
        .long   0xe28b0002
        .long   0xe59db060
        .long   0xe00b0b9a
        .long   0xe3a0a00f
        .long   0xe1c9b0b0
        .long   0xe58d102c
        .long   0xe59d1058
        .long   0xe58d2064
LKWO16:
        .long   0xe199b0f1
        .long   0xe35b0000
        .long   0x0a000003
        .long   0xe1d020f0
        .long   0xe3a0c001
        .long   0xe002029b
        .long   0xe18920b1
LKWO17:
        .long   0xe25aa001
        .long   0xe2811002
        .long   0xe2800002
        .long   0x1afffff4
        .long   0xe59d2064
        .long   0xe59d102c
        .long   0xe35c0000
        .long   0x1a000028
        .long   0xe1d900f0
        .long   0xe1a0a001
        .long   0xe3a0c004
        .long   0xe2800020
        .long   0xe58d801c
        .long   0xe58d9020
        .long   0xe1a00340
        .long   0xe58d102c
        .long   0xe1a00800
        .long   0xe1a0b840
        .long   0xe59d0004
        .long   0xe15b0000
        .long   0xc1a0000b
        .long   0xe3500c01
        .long   0xe3a0bc01
        .long   0xc1a0000b
        .long   0xe59fbc7c
        .long   0xe08b0000
LKWO18:
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
        .long   0xe59d801c
        .long   0xe59d9020
        .long   0xe59d102c
        .long   0xea0000ae
LKWO19:
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
        .long   0xe58d6000
        .long   0xe58d7018
        .long   0xe58d801c
        .long   0xe58d9020
        .long   0xe58d2064
        .long   0xe58d102c
LKWO20:
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
        .long   0xe59d6000
        .long   0xe59d7018
        .long   0xe59d801c
        .long   0xe59d9020
        .long   0xe59d102c
        .long   0xe3a00000
        .long   0xe58d0058
        .long   0xe58d2064
        .long   0xe59d2058
        .long   0xe3a00004
        .long   0xe58d4038
        .long   0xe58d5034
        .long   0xe58d6000
        .long   0xe58d7018
        .long   0xe58d801c
        .long   0xe58d102c
LKWO21:
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
        .long   0xe59d801c
        .long   0xe59d102c
        .long   0xe59d4038
        .long   0xe59d5034
        .long   0xe59d6000
        .long   0xe59d2064
        .long   0xe58d7018
        .long   0xe58d9020
        .long   0xe59d7004
        .long   0xe59f9a6c
        .long   0xe58d801c
        .long   0xe1a0c001
        .long   0xe3a00000
        .long   0xe58d303c
        .long   0xe58d4038
        .long   0xe58d5034
        .long   0xe58d6000
        .long   0xe58d102c
        .long   0xe3a08c01
LKWO22:
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
        .long   0xe59d6000
        .long   0xe59d7018
        .long   0xe59d801c
        .long   0xe59d9020
        .long   0xe59d102c
LKWO23:
        .long   0xe2899020
LKWO24:
        .long   0xe1d6c0d1
        .long   0xe1f600d2
        .long   0xe28ee001
        .long   0xe081c00c
        .long   0xe2877001
        .long   0xe021c092
        .long   0xe3570010
        .long   0xe1a08088
        .long   0x3afffe68
        .long   0xe59d0030
        .long   0xe59da040
        .long   0xe5809000
        .long   0xe1a0000a
        .long   0xe28dd09c
        .long   0xe8bd8ff0
LKWO_bd.1.2:
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
LKWO25:
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
LKWO_bd.1.3:
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
LKWO26:
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
LKWO27:
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
LKWO28:
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
LKWO_bd.1.4:
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
LKWO29:
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
LKWO30:
        .long   0xe3100040
        .long   0x0a000010
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
        .long   0xea000006
LKWO31:
        .long   0xe59d005c
        .long   0xe28da074
        .long   0xe5ca0006
        .long   0xe28da074
        .long   0xe5ca0005
        .long   0xe28da074
        .long   0xe5ca0004
LKWO32:
        .long   0xe59da05c
        .long   0xe28db074
        .long   0xe5cba007
        .long   0xe58d801c
        .long   0xe59d805c
        .long   0xe3a0a000
        .long   0xe58d5034
        .long   0xe58d6000
        .long   0xe58d7018
        .long   0xe58d9020
        .long   0xe58d102c
LKWO33:
        .long   0xe0885088
        .long   0xe0805005
        .long   0xe28d1074
        .long   0xe2856002
        .long   0xe3a07000
        .long   0xe081500a
LKWO34:
        .long   0xe0871005
        .long   0xe5d1b001
        .long   0xe7d59007
        .long   0xe5d11002
        .long   0xe089b08b
        .long   0xe08b1001
        .long   0xe2811002
LKWO35:
        .long   0xe1a01141
        .long   0xe7c7100c
        .long   0xe2877001
        .long   0xe3570004
        .long   0xaa000002
        .long   0xe3570003
        .long   0x0a00000b
        .long   0xeafffff0
LKWO36:
        .long   0xe28aa001
        .long   0xe35a0004
        .long   0xe082c00c
        .long   0xbaffffe6
        .long   0xe59d5034
        .long   0xe59d6000
        .long   0xe59d7018
        .long   0xe59d801c
        .long   0xe59d9020
        .long   0xe59d102c
        .long   0xeafffdf1
LKWO37:
        .long   0xe35a0003
        .long   0x01a01006
        .long   0x0affffe9
        .long   0xeaffffe1
LKWO_bd.1.5:
        .long   0xe3100020
        .long   0x1a000006
        .long   0xe3a0a080
        .long   0xe58da05c
        .long   0xe28db094
        .long   0xe5cba000
        .long   0xe3a0a00b
        .long   0xe58da040
        .long   0xea000004
LKWO38:
        .long   0xe041a002
        .long   0xe55aa001
        .long   0xe28db094
        .long   0xe58da05c
        .long   0xe5cba000
LKWO39:
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
LKWO40:
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
LKWO41:
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
LKWO42:
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
LKWO43:
        .long   0xe59da058
        .long   0xe58d6000
        .long   0xe58d7018
        .long   0xe080000a
        .long   0xe59da05c
        .long   0xe58d801c
        .long   0xe58d9020
        .long   0xe080000a
        .long   0xe28aa002
        .long   0xe080000a
        .long   0xe3a0a000
        .long   0xe1a00140
        .long   0xe58d102c
LKWO44:
        .long   0xe35a0000
        .long   0xda00000f
        .long   0xe28d108c
        .long   0xe3a07000
        .long   0xe081600a
LKWO45:
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
LKWO46:
        .long   0xe28a7001
        .long   0xe3570004
        .long   0xe1a06007
        .long   0xaa00000e
        .long   0xe28d1094
        .long   0xe041100a
        .long   0xe0861001
LKWO47:
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
LKWO48:
        .long   0xe7cc000a
        .long   0xe3570004
        .long   0xe1a0a007
        .long   0xe082c00c
        .long   0xbaffffd5
        .long   0xe59d6000
        .long   0xe59d7018
        .long   0xe59d801c
        .long   0xe59d9020
        .long   0xe59d102c
        .long   0xeafffd52
LKWO_bd.1.6:
        .long   0xe3100020
        .long   0x1a000004
        .long   0xe3a0c080
        .long   0xe58dc054
        .long   0xe3a0c00b
        .long   0xe58dc040
        .long   0xea000002
LKWO49:
        .long   0xe041c002
        .long   0xe55cc001
        .long   0xe58dc054
LKWO50:
        .long   0xe3100001
        .long   0x1a000006
        .long   0xe3a0c080
        .long   0xe1a0a00c
        .long   0xe58da04c
        .long   0xe58da05c
        .long   0xe3a0b00b
        .long   0xe58db040
        .long   0xea000008
LKWO51:
        .long   0xe041b002
        .long   0xe58db060
        .long   0xe5dbc000
        .long   0xe5dba001
        .long   0xe5dbb002
        .long   0xe58db05c
        .long   0xe59db060
        .long   0xe5dbb003
        .long   0xe58db04c
LKWO52:
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
LKWO53:
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
LKWO54:
        .long   0xe59db050
        .long   0xe59d0054
        .long   0xe081b00b
        .long   0xe58db060
        .long   0xe59db060
        .long   0xe080000c
        .long   0xe2800001
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
        .long   0xe59d005c
        .long   0xe59db04c
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
        .long   0xe58db068
        .long   0xe1a00140
        .long   0xe58d0060
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
        .long   0xe1a0a14a
        .long   0xe08cc08b
        .long   0xe59db048
        .long   0xe08cc00b
        .long   0xe58dc06c
        .long   0xe59dc058
        .long   0xe08cb08b
        .long   0xe59dc060
        .long   0xe58db05c
        .long   0xe5c0a003
        .long   0xe5c0c002
        .long   0xe59dc05c
        .long   0xe59d006c
        .long   0xe59da044
        .long   0xe08cc00a
        .long   0xe59da050
        .long   0xe2800002
        .long   0xe28cc002
        .long   0xe1a00140
        .long   0xe7ca0001
        .long   0xe59d0068
        .long   0xe1a0c14c
        .long   0xe7c1c000
        .long   0xeafffcba
LKWO_bd.1.7:
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
        .long   LKWO_bt.1
        .long   ClampTbl
LKWO55:
        .long   0xe041c002
        .long   0xe55cc001
        .long   0xe58dc060
LKWO56:
        .long   0xe3100001
        .long   0x1a000006
        .long   0xe3a0c080
        .long   0xe58dc05c
        .long   0xe58dc04c
        .long   0xe58dc048
        .long   0xe3a0c00b
        .long   0xe58dc040
        .long   0xea000006
LKWO57:
        .long   0xe041c002
        .long   0xe5dca000
        .long   0xe58da05c
        .long   0xe5dca001
        .long   0xe58da048
        .long   0xe5dcc002
        .long   0xe58dc04c
LKWO58:
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
LKWO59:
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
LKWO60:
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
        .long   0xeafffc07
LKWO_bd.1.8:
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
LKWO61:
        .long   0xe041c002
        .long   0xe5dca000
        .long   0xe58da058
        .long   0xe5dca001
        .long   0xe58da050
        .long   0xe5dca002
        .long   0xe58da05c
        .long   0xe5dcc003
LKWO62:
        .long   0xe3100040
        .long   0x0a000006
        .long   0xe041b002
        .long   0xe5db0005
        .long   0xe5dba004
        .long   0xe58d0054
        .long   0xe5dbb006
        .long   0xe58db044
        .long   0xea000002
LKWO63:
        .long   0xe1a0a00c
        .long   0xe58da044
        .long   0xe58da054
LKWO64:
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
        .long   0xe58db068
        .long   0xe59d0070
        .long   0xe59db06c
        .long   0xe1a000c0
        .long   0xe5cb0003
        .long   0xe59db05c
        .long   0xe59d0050
        .long   0xe080b08b
        .long   0xe58db070
        .long   0xe59db05c
        .long   0xe59d0068
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
        .long   0xe59db05c
        .long   0xe0810002
        .long   0xe08bb08c
        .long   0xe08bb00a
        .long   0xe28bb002
        .long   0xe58db068
        .long   0xe59db070
        .long   0xe5c0b001
        .long   0xe59db068
        .long   0xe1a0b14b
        .long   0xe58db070
        .long   0xe59db06c
        .long   0xe081b00b
        .long   0xe58db06c
        .long   0xe59db054
        .long   0xe08cb00b
        .long   0xe58db068
        .long   0xe59db070
        .long   0xe59dc06c
        .long   0xe5ccb001
        .long   0xe59db068
        .long   0xe08bb08a
        .long   0xe28bb002
        .long   0xe58db068
        .long   0xe59db070
        .long   0xe5c0b002
        .long   0xe59db068
        .long   0xe59dc054
        .long   0xe1a0b14b
        .long   0xe58db070
        .long   0xe59db044
        .long   0xe08bc08c
        .long   0xe08ca00a
        .long   0xe59dc070
        .long   0xe59db06c
        .long   0xe28aa002
        .long   0xe5cbc002
        .long   0xe59dc070
        .long   0xe1a0a14a
        .long   0xe5c0c003
        .long   0xe59d006c
        .long   0xe5c0a003
        .long   0xeafffb72
LKWO_bd.1.9:
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
LKWO65:
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
LKWO66:
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
        .long   0xeafffb0f
LKWO67:
        mvn     r0, #7
        add     sp, sp, #0x9C
        ldmia   sp!, {r4 - r11, pc}
LKWO_bt.1:
        .long   0x00000008
        .long   0x00000514
        .long   0x000005d8
        .long   0x00000784
        .long   0x00000938
        .long   0x00000ba4
        .long   0x00000e04
        .long   0x000010d0
        .long   0x00001324
