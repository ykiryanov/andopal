        .text
        .align  4
        .globl  _ippsIIR_32f


_ippsIIR_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x3C
        cmp     r3, #0
        beq     LBQD5
        cmp     r0, #0
        beq     LBQD5
        cmp     r1, #0
        beq     LBQD5
        cmp     r2, #0
        ble     LBQD6
        ldr     r12, [r3]
        ldr     lr, [pc, #0xB48]
        subs    r12, r12, lr
        beq     LBQD1
        adds    r12, r12, #1
        beq     LBQD0
        mvn     r0, #0x10
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LBQD0:
        bl      ippsIIRAR_32f
        mov     r0, #0
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LBQD1:
        ldr     lr, [r3, #4]
        ldr     r5, [r3, #8]
        ldr     r3, [r3, #0xC]
        add     r8, lr, #0xC
        add     r9, lr, #4
        add     r7, r5, #4
        add     r10, lr, #0x10
        add     r6, lr, #8
        mov     r12, #0
        str     r6, [sp, #0x24]
        str     r10, [sp, #0x20]
        str     r9, [sp, #0x1C]
        str     r8, [sp, #0x18]
        str     r7, [sp, #0x14]
        str     r5, [sp, #0xC]
        str     lr, [sp, #8]
LBQD2:
        ldr     r5, [r0], #4
        cmp     r3, #0
        ble     LBQD4
        ldr     r4, [sp, #8]
        ldr     lr, [sp, #0x20]
        ldr     r10, [sp, #0x18]
        ldr     r9, [sp, #0x1C]
        ldr     r8, [sp, #0x24]
        ldr     r7, [sp, #0xC]
        ldr     r6, [sp, #0x14]
        mov     r11, #0
        str     lr, [sp, #0x30]
        str     r4, [sp, #0x34]
        str     r0, [sp, #0x28]
        str     r12, [sp, #0x10]
        str     r3, [sp, #0x2C]
        str     r2, [sp, #4]
        str     r1, [sp]
LBQD3:
        ldr     r0, [sp, #0x34]
        ldr     r4, [r7]
        mov     r1, r5
        ldr     r0, [r0]
        add     r11, r11, #2
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r1, [r10], #0x14
        ldr     r2, [r6]
        mov     r4, r0
        str     r2, [sp, #0x38]
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x38]
        bl      __subsf3
        ldr     r3, [sp, #0x34]
        ldr     r2, [r9], #0x14
        str     r0, [sp, #0x38]
        add     r3, r3, #0x14
        str     r3, [sp, #0x34]
        mov     r0, r2
        mov     r1, r5
        bl      __mulsf3
        ldr     r1, [sp, #0x38]
        bl      __addsf3
        str     r0, [r7], #8
        ldr     r2, [sp, #0x30]
        mov     r1, r4
        ldr     r2, [r2]
        eor     r0, r2, #2, 2
        bl      __mulsf3
        ldr     r2, [r8], #0x14
        str     r0, [sp, #0x38]
        mov     r0, r2
        mov     r1, r5
        bl      __mulsf3
        ldr     r1, [sp, #0x38]
        bl      __addsf3
        str     r0, [r6], #8
        ldr     r2, [sp, #0x2C]
        cmp     r11, r2
        ldr     r2, [sp, #0x30]
        mov     r5, r4
        add     r2, r2, #0x14
        str     r2, [sp, #0x30]
        blt     LBQD3
        ldr     r0, [sp, #0x28]
        ldr     r12, [sp, #0x10]
        ldr     r3, [sp, #0x2C]
        ldr     r2, [sp, #4]
        ldr     r1, [sp]
LBQD4:
        add     r12, r12, #1
        str     r4, [r1], #4
        cmp     r12, r2
        blt     LBQD2
        mov     r0, #0
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LBQD5:
        mvn     r0, #7
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LBQD6:
        mvn     r0, #5
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LBQD__ippsIIRAR_32f:
        .long   0xe92d4ff0
        .long   0xe24dd070
        .long   0xe593b004
        .long   0xe593800c
        .long   0xe5937008
        .long   0xe59b3000
        .long   0xe3580000
        .long   0xe1a04001
        .long   0xe58d3044
        .long   0xe1a06002
        .long   0xe3a05000
        .long   0xe58d3054
        .long   0x01a09005
        .long   0x0a0001b7
        .long   0xe59b3004
        .long   0xe3580001
        .long   0xe28ba004
        .long   0xe58d3054
        .long   0xe1a03108
        .long   0xe2833004
        .long   0xe08b9003
        .long   0xda0001af
        .long   0xe3c61001
        .long   0xe3510000
        .long   0xda00011e
        .long   0xe2802004
        .long   0xe58d2058
        .long   0xe2472004
        .long   0xe1a0c108
        .long   0xe58d2068
        .long   0xe2842004
        .long   0xe24cc004
        .long   0xe58d2060
        .long   0xe2892004
        .long   0xe58dc064
        .long   0xe58d2030
        .long   0xe248e001
        .long   0xe248c005
        .long   0xe58d8010
        .long   0xe59d8030
        .long   0xe3a05000
        .long   0xe1a02000
        .long   0xe58d405c
        .long   0xe58d202c
        .long   0xe58dc028
        .long   0xe58de034
        .long   0xe58d5038
        .long   0xe58d103c
        .long   0xe58d3040
        .long   0xe58d6018
        .long   0xe58d401c
        .long   0xe58d0004
LBQD7:
        .long   0xe59d002c
        .long   0xe59d6058
        .long   0xe5904000
        .long   0xe58d4000
        .long   0xe4960008
        .long   0xe1a01004
        .long   0xe58d0050
        .long   0xe59d0044
        .long   0xe5975000
        .long   0xeb000000
        .long   0xe1a01005
        .long   0xeb000000
        .long   0xe5972004
        .long   0xe1a05000
        .long   0xe59d0054
        .long   0xe58d204c
        .long   0xe58d5020
        .long   0xe1a01004
        .long   0xeb000000
        .long   0xe59d104c
        .long   0xeb000000
        .long   0xe59d2040
        .long   0xe59d302c
        .long   0xe1a04000
        .long   0xe79b2002
        .long   0xe1a01005
        .long   0xe2833008
        .long   0xe58d302c
        .long   0xe1a00002
        .long   0xeb000000
        .long   0xe1a01000
        .long   0xe1a00004
        .long   0xeb000000
        .long   0xe1a04000
        .long   0xe59d0044
        .long   0xe59d1050
        .long   0xeb000000
        .long   0xe1a01004
        .long   0xeb000000
        .long   0xe59d2034
        .long   0xe58d6058
        .long   0xe1a04000
        .long   0xe3520000
        .long   0xda0000b7
        .long   0xe59d2034
        .long   0xe3520004
        .long   0xb3a00000
        .long   0xba00007a
        .long   0xe287600c
        .long   0xe2875004
        .long   0xe58d7014
        .long   0xe59d7050
        .long   0xe28b1008
        .long   0xe2892004
        .long   0xe28b300c
        .long   0xe288c004
        .long   0xe3a00000
        .long   0xe58d9008
        .long   0xe58da00c
        .long   0xe58db048
        .long   0xe58d0024
        .long   0xe1a0b001
        .long   0xe1a0a002
        .long   0xe1a09003
        .long   0xe1a0800c
LBQD8:
        .long   0xe59de024
        .long   0xe51b0004
        .long   0xe1a01007
        .long   0xe28ee003
        .long   0xe58de024
        .long   0xeb000000
        .long   0xe51a2004
        .long   0xe58d006c
        .long   0xe1a00002
        .long   0xe1a01004
        .long   0xeb000000
        .long   0xe1a01000
        .long   0xe59d006c
        .long   0xeb000000
        .long   0xe5192004
        .long   0xe59d1000
        .long   0xe58d006c
        .long   0xe1a00002
        .long   0xeb000000
        .long   0xe59d106c
        .long   0xeb000000
        .long   0xe5182004
        .long   0xe59d1020
        .long   0xe58d006c
        .long   0xe1a00002
        .long   0xeb000000
        .long   0xe1a01000
        .long   0xe59d006c
        .long   0xeb000000
        .long   0xe5161004
        .long   0xeb000000
        .long   0xe5050004
        .long   0xe59b0000
        .long   0xe1a01007
        .long   0xeb000000
        .long   0xe59a2000
        .long   0xe58d006c
        .long   0xe1a00002
        .long   0xe1a01004
        .long   0xeb000000
        .long   0xe1a01000
        .long   0xe59d006c
        .long   0xeb000000
        .long   0xe5992000
        .long   0xe59d1000
        .long   0xe58d006c
        .long   0xe1a00002
        .long   0xeb000000
        .long   0xe59d106c
        .long   0xeb000000
        .long   0xe5982000
        .long   0xe59d1020
        .long   0xe58d006c
        .long   0xe1a00002
        .long   0xeb000000
        .long   0xe1a01000
        .long   0xe59d006c
        .long   0xeb000000
        .long   0xe5961000
        .long   0xeb000000
        .long   0xe5850000
        .long   0xe59b0004
        .long   0xe1a01007
        .long   0xe28bb00c
        .long   0xeb000000
        .long   0xe59a2004
        .long   0xe58d006c
        .long   0xe1a00002
        .long   0xe1a01004
        .long   0xeb000000
        .long   0xe1a01000
        .long   0xe59d006c
        .long   0xe28aa00c
        .long   0xeb000000
        .long   0xe5992004
        .long   0xe59d1000
        .long   0xe58d006c
        .long   0xe1a00002
        .long   0xeb000000
        .long   0xe59d106c
        .long   0xeb000000
        .long   0xe5982004
        .long   0xe59d1020
        .long   0xe58d006c
        .long   0xe1a00002
        .long   0xeb000000
        .long   0xe1a01000
        .long   0xe59d006c
        .long   0xe289900c
        .long   0xeb000000
        .long   0xe5961004
        .long   0xeb000000
        .long   0xe5850004
        .long   0xe59de028
        .long   0xe59d0024
        .long   0xe288800c
        .long   0xe286600c
        .long   0xe285500c
        .long   0xe150000e
        .long   0xdaffff9b
        .long   0xe59d0024
        .long   0xe59d8030
        .long   0xe59d9008
        .long   0xe59da00c
        .long   0xe59db048
        .long   0xe59d7014
LBQD9:
        .long   0xe08b3100
        .long   0xe3a0e008
        .long   0xe0876100
        .long   0xe08a2100
        .long   0xe0891100
        .long   0xe088c100
        .long   0xe08e3003
        .long   0xe58d404c
        .long   0xe58d9008
        .long   0xe58da00c
        .long   0xe58d7014
        .long   0xe08e5006
        .long   0xe58db048
        .long   0xe1a0a000
        .long   0xe1a08001
        .long   0xe1a09002
        .long   0xe1a07003
        .long   0xe1a0400c
LBQD10:
        .long   0xe4990004
        .long   0xe59d1050
        .long   0xe28aa001
        .long   0xeb000000
        .long   0xe4982004
        .long   0xe59d104c
        .long   0xe1a0b000
        .long   0xe1a00002
        .long   0xeb000000
        .long   0xe1a01000
        .long   0xe1a0000b
        .long   0xeb000000
        .long   0xe59d1000
        .long   0xe4972004
        .long   0xe1a0b000
        .long   0xe1a00002
        .long   0xeb000000
        .long   0xe1a0100b
        .long   0xeb000000
        .long   0xe59d1020
        .long   0xe4942004
        .long   0xe1a0b000
        .long   0xe1a00002
        .long   0xeb000000
        .long   0xe1a01000
        .long   0xe1a0000b
        .long   0xeb000000
        .long   0xe4951004
        .long   0xeb000000
        .long   0xe4860004
        .long   0xe59de034
        .long   0xe15a000e
        .long   0xbaffffde
        .long   0xe59d404c
        .long   0xe59d8030
        .long   0xe59d9008
        .long   0xe59da00c
        .long   0xe59db048
        .long   0xe59d7014
LBQD11:
        .long   0xe59d6064
        .long   0xe59d2038
        .long   0xe59d1050
        .long   0xe796000a
        .long   0xe2825002
        .long   0xe58d5038
        .long   0xeb000000
        .long   0xe7962009
        .long   0xe1a06000
        .long   0xe1a01004
        .long   0xe1a00002
        .long   0xeb000000
        .long   0xe1a01000
        .long   0xe1a00006
        .long   0xeb000000
        .long   0xe59d3010
        .long   0xe59d2068
        .long   0xe7820103
        .long   0xe59d3020
        .long   0xe59d205c
        .long   0xe4823008
        .long   0xe59d3060
        .long   0xe4834008
        .long   0xe59d003c
        .long   0xe58d205c
        .long   0xe1550000
        .long   0xe58d3060
        .long   0xbafffeff
        .long   0xe59d8010
        .long   0xe59d6018
        .long   0xe59d401c
        .long   0xe59d0004
LBQD12:
        .long   0xe3160001
        .long   0x0a0000f5
        .long   0xe2400004
        .long   0xe7901106
        .long   0xe59d0044
        .long   0xe58d1068
        .long   0xe5975000
        .long   0xeb000000
        .long   0xe1a01005
        .long   0xeb000000
        .long   0xe3580000
        .long   0xe1a05000
        .long   0xda00007b
        .long   0xe3580005
        .long   0xe3a00000
        .long   0xb2871004
        .long   0xba00005b
        .long   0xe2871004
        .long   0xe58d401c
        .long   0xe59d4068
        .long   0xe28bb008
        .long   0xe2892004
        .long   0xe58d9008
        .long   0xe248e005
        .long   0xe2873008
        .long   0xe1a0c001
        .long   0xe58d8010
        .long   0xe58d7014
        .long   0xe58d6018
        .long   0xe1a0900b
        .long   0xe58d1004
        .long   0xe58de000
        .long   0xe58da00c
        .long   0xe1a06000
        .long   0xe1a08002
        .long   0xe1a07003
        .long   0xe1a0b00c
LBQD13:
        .long   0xe5190004
        .long   0xe1a01004
        .long   0xe2866004
        .long   0xeb000000
        .long   0xe5182004
        .long   0xe1a0a000
        .long   0xe1a01005
        .long   0xe1a00002
        .long   0xeb000000
        .long   0xe1a01000
        .long   0xe1a0000a
        .long   0xeb000000
        .long   0xe5171004
        .long   0xeb000000
        .long   0xe50b0004
        .long   0xe5990000
        .long   0xe1a01004
        .long   0xeb000000
        .long   0xe5982000
        .long   0xe1a0a000
        .long   0xe1a01005
        .long   0xe1a00002
        .long   0xeb000000
        .long   0xe1a01000
        .long   0xe1a0000a
        .long   0xeb000000
        .long   0xe5971000
        .long   0xeb000000
        .long   0xe58b0000
        .long   0xe5990004
        .long   0xe1a01004
        .long   0xeb000000
        .long   0xe5982004
        .long   0xe1a0a000
        .long   0xe1a01005
        .long   0xe1a00002
        .long   0xeb000000
        .long   0xe1a01000
        .long   0xe1a0000a
        .long   0xeb000000
        .long   0xe5971004
        .long   0xeb000000
        .long   0xe58b0004
        .long   0xe5990008
        .long   0xe1a01004
        .long   0xe2899010
        .long   0xeb000000
        .long   0xe5982008
        .long   0xe1a0a000
        .long   0xe1a01005
        .long   0xe1a00002
        .long   0xeb000000
        .long   0xe1a01000
        .long   0xe1a0000a
        .long   0xeb000000
        .long   0xe5971008
        .long   0xeb000000
        .long   0xe59de000
        .long   0xe58b0008
        .long   0xe156000e
        .long   0xe2888010
        .long   0xe2877010
        .long   0xe28bb010
        .long   0xdaffffbf
        .long   0xe1a00006
        .long   0xe59d1004
        .long   0xe59d9008
        .long   0xe59da00c
        .long   0xe59d8010
        .long   0xe59d7014
        .long   0xe59d6018
        .long   0xe59d401c
LBQD14:
        .long   0xe58d8010
        .long   0xe59d8068
        .long   0xe087b100
        .long   0xe58d6018
        .long   0xe08aa100
        .long   0xe0899100
        .long   0xe58d401c
        .long   0xe1a06000
        .long   0xe1a07001
LBQD15:
        .long   0xe49a0004
        .long   0xe1a01008
        .long   0xeb000000
        .long   0xe1a04000
        .long   0xe4990004
        .long   0xe1a01005
        .long   0xeb000000
        .long   0xe1a01000
        .long   0xe1a00004
        .long   0xeb000000
        .long   0xe7971106
        .long   0xeb000000
        .long   0xe48b0004
        .long   0xe59d2010
        .long   0xe2866001
        .long   0xe1560002
        .long   0xbaffffee
        .long   0xe59d6018
        .long   0xe59d401c
LBQD16:
        .long   0xe2444004
        .long   0xe7845106
        .long   0xe3a00000
        .long   0xe28dd070
        .long   0xe8bd8ff0
LBQD17:
        .long   0xe3580000
        .long   0xda00006a
        .long   0xe3560000
        .long   0xda000065
        .long   0xe3560004
        .long   0xba00004a
        .long   0xe2463004
        .long   0xe2848004
        .long   0xe58d6018
        .long   0xe58d401c
        .long   0xe59d6054
        .long   0xe59d4044
        .long   0xe280a004
        .long   0xe58d3010
        .long   0xe58d0004
LBQD18:
        .long   0xe51a1004
        .long   0xe2855003
        .long   0xe1a00004
        .long   0xe58d106c
        .long   0xeb000000
        .long   0xe5971000
        .long   0xeb000000
        .long   0xe59d106c
        .long   0xe1a0b000
        .long   0xe1a00006
        .long   0xeb000000
        .long   0xe58d006c
        .long   0xe5990000
        .long   0xe1a0100b
        .long   0xeb000000
        .long   0xe1a01000
        .long   0xe59d006c
        .long   0xeb000000
        .long   0xe5870000
        .long   0xe508b004
        .long   0xe59a1000
        .long   0xe1a00004
        .long   0xe58d106c
        .long   0xeb000000
        .long   0xe5971000
        .long   0xeb000000
        .long   0xe59d106c
        .long   0xe1a0b000
        .long   0xe1a00006
        .long   0xeb000000
        .long   0xe58d006c
        .long   0xe5990000
        .long   0xe1a0100b
        .long   0xeb000000
        .long   0xe1a01000
        .long   0xe59d006c
        .long   0xeb000000
        .long   0xe5870000
        .long   0xe588b000
        .long   0xe59a1004
        .long   0xe1a00004
        .long   0xe28aa00c
        .long   0xe58d106c
        .long   0xeb000000
        .long   0xe5971000
        .long   0xeb000000
        .long   0xe59d106c
        .long   0xe1a0b000
        .long   0xe1a00006
        .long   0xeb000000
        .long   0xe58d006c
        .long   0xe5990000
        .long   0xe1a0100b
        .long   0xeb000000
        .long   0xe1a01000
        .long   0xe59d006c
        .long   0xeb000000
        .long   0xe59d2010
        .long   0xe5870000
        .long   0xe588b004
        .long   0xe1550002
        .long   0xe288800c
        .long   0xdaffffc0
        .long   0xe59d6018
        .long   0xe59d401c
        .long   0xe59d0004
LBQD19:
        .long   0xe0808105
        .long   0xe084a105
LBQD20:
        .long   0xe59d0044
        .long   0xe498b004
        .long   0xe2855001
        .long   0xe1a0100b
        .long   0xeb000000
        .long   0xe5971000
        .long   0xeb000000
        .long   0xe1a04000
        .long   0xe59d0054
        .long   0xe1a0100b
        .long   0xeb000000
        .long   0xe5992000
        .long   0xe1a0b000
        .long   0xe1a01004
        .long   0xe1a00002
        .long   0xeb000000
        .long   0xe1a01000
        .long   0xe1a0000b
        .long   0xeb000000
        .long   0xe5870000
        .long   0xe48a4004
        .long   0xe1550006
        .long   0xbaffffe8
LBQD21:
        .long   0xe3a00000
        .long   0xe28dd070
        .long   0xe8bd8ff0
LBQD22:
        .long   0xe3560000
        .long   0xdafffffa
        .long   0xe3560006
        .long   0xba000020
        .long   0xe1a0b005
        .long   0xe59d5044
        .long   0xe2469006
        .long   0xe2808004
        .long   0xe2847004
        .long   0xe1a0a000
LBQD23:
        .long   0xe5181004
        .long   0xe1a00005
        .long   0xe28bb005
        .long   0xeb000000
        .long   0xe5070004
        .long   0xe5981000
        .long   0xe1a00005
        .long   0xeb000000
        .long   0xe5870000
        .long   0xe5981004
        .long   0xe1a00005
        .long   0xeb000000
        .long   0xe5870004
        .long   0xe5981008
        .long   0xe1a00005
        .long   0xeb000000
        .long   0xe5870008
        .long   0xe598100c
        .long   0xe1a00005
        .long   0xe2888014
        .long   0xeb000000
        .long   0xe587000c
        .long   0xe15b0009
        .long   0xe2877014
        .long   0xdaffffe6
        .long   0xe1a0000a
        .long   0xe1a0500b
LBQD24:
        .long   0xe0848105
        .long   0xe59d4044
        .long   0xe0807105
LBQD25:
        .long   0xe4971004
        .long   0xe1a00004
        .long   0xeb000000
        .long   0xe2855001
        .long   0xe4880004
        .long   0xe1550006
        .long   0xbafffff8
        .long   0xe3a00000
        .long   0xe28dd070
        .long   0xe8bd8ff0
        .long   0x49493032


        .data
        .align  4


LBQD__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00
LBQD__2il0floatpacket.2:
        .byte   0x00,0x00,0x00,0x00


