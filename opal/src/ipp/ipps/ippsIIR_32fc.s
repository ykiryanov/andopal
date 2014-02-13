        .text
        .align  4
        .globl  _ippsIIR_32fc


_ippsIIR_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x34
        cmp     r3, #0
        beq     LBQB5
        cmp     r0, #0
        beq     LBQB5
        cmp     r1, #0
        beq     LBQB5
        cmp     r2, #0
        ble     LBQB6
        ldr     r12, [r3]
        ldr     lr, [pc, #0xF98]
        subs    r12, r12, lr
        beq     LBQB1
        adds    r12, r12, #1
        beq     LBQB0
        mvn     r0, #0x10
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LBQB0:
        bl      ippsIIRAR_32fc
        mov     r0, #0
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LBQB1:
        ldr     lr, [r3, #4]
        ldr     r6, [r3, #8]
        ldr     r7, [r3, #0xC]
        sub     r3, r1, #4
        mov     r12, #0
        str     r7, [sp, #0x18]
        str     r6, [sp, #8]
        str     lr, [sp, #4]
LBQB2:
        ldr     lr, [sp, #0x18]
        ldr     r7, [r0]
        ldr     r6, [r0, #4]
        cmp     lr, #0
        ble     LBQB4
        ldr     lr, [sp, #4]
        ldr     r1, [sp, #8]
        mov     r4, #0
        sub     r11, lr, #4
        sub     r10, lr, #0x14
        sub     r5, r1, #4
        sub     r9, lr, #0x1C
        sub     r8, lr, #0xC
        add     lr, lr, #4
        sub     r1, r1, #0xC
        str     r1, [sp, #0x24]
        str     r5, [sp, #0x28]
        str     lr, [sp, #0x20]
        str     r4, [sp, #0x1C]
        str     r0, [sp, #0x14]
        str     r3, [sp, #0x10]
        str     r12, [sp, #0xC]
        str     r2, [sp]
LBQB3:
        ldr     r2, [sp, #0x20]
        mov     r1, r7
        ldr     r0, [r2, #-4]
        str     r0, [sp, #0x2C]
        ldr     r4, [r2]
        ldr     r2, [sp, #0x24]
        ldr     r0, [sp, #0x2C]
        ldr     r5, [r2, #0xC]
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        mov     r5, r0
        mov     r1, r6
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r5
        bl      __subsf3
        ldr     r2, [sp, #0x24]
        mov     r5, r0
        ldr     r0, [sp, #0x2C]
        ldr     r2, [r2, #0x10]
        mov     r1, r6
        str     r2, [sp, #0x30]
        bl      __mulsf3
        ldr     r1, [sp, #0x30]
        bl      __addsf3
        str     r0, [sp, #0x30]
        mov     r1, r7
        mov     r0, r4
        bl      __mulsf3
        ldr     r1, [sp, #0x30]
        bl      __addsf3
        ldr     r3, [sp, #0x28]
        ldr     r2, [r8, #0x24]
        mov     r4, r0
        ldr     r3, [r3, #0xC]
        mov     r1, r5
        mov     r0, r2
        str     r3, [sp, #0x30]
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x30]
        bl      __subsf3
        ldr     r2, [r8, #0x28]
        ldr     r3, [sp, #0x20]
        str     r0, [sp, #0x30]
        mov     r0, r2
        mov     r1, r4
        add     r3, r3, #0x28
        str     r3, [sp, #0x20]
        bl      __mulsf3
        ldr     r1, [sp, #0x30]
        bl      __addsf3
        ldr     r2, [r9, #0x24]
        ldr     r3, [sp, #0x1C]
        str     r0, [sp, #0x30]
        mov     r1, r7
        add     r3, r3, #2
        str     r3, [sp, #0x1C]
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [sp, #0x30]
        bl      __addsf3
        ldr     r2, [r9, #0x28]
        str     r0, [sp, #0x30]
        mov     r0, r2
        mov     r1, r6
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x30]
        bl      __subsf3
        ldr     r2, [sp, #0x24]
        mov     r1, r4
        str     r0, [r2, #0xC]
        ldr     r2, [sp, #0x28]
        ldr     r0, [r8, #0x24]
        ldr     r2, [r2, #0x10]
        str     r2, [sp, #0x30]
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x30]
        bl      __subsf3
        ldr     r2, [r8, #0x28]!
        str     r0, [sp, #0x30]
        mov     r1, r5
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x30]
        bl      __subsf3
        ldr     r2, [r9, #0x24]
        str     r0, [sp, #0x30]
        mov     r0, r2
        mov     r1, r6
        bl      __mulsf3
        ldr     r1, [sp, #0x30]
        bl      __addsf3
        ldr     r2, [r9, #0x28]!
        str     r0, [sp, #0x30]
        mov     r1, r7
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [sp, #0x30]
        bl      __addsf3
        ldr     r2, [sp, #0x24]
        mov     r1, r7
        str     r0, [r2, #0x10]!
        ldr     r0, [r10, #0x24]
        str     r2, [sp, #0x24]
        bl      __mulsf3
        ldr     r2, [r11, #0x24]
        str     r0, [sp, #0x30]
        mov     r1, r5
        mov     r0, r2
        bl      __mulsf3
        ldr     r2, [r11, #0x28]
        str     r0, [sp, #0x2C]
        mov     r1, r4
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x2C]
        bl      __subsf3
        mov     r1, r0
        ldr     r0, [sp, #0x30]
        bl      __subsf3
        ldr     r2, [r10, #0x28]
        str     r0, [sp, #0x30]
        mov     r0, r2
        mov     r1, r6
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x30]
        bl      __subsf3
        ldr     r2, [sp, #0x28]
        mov     r1, r6
        str     r0, [r2, #0xC]
        ldr     r0, [r10, #0x24]
        mov     r6, r4
        bl      __mulsf3
        ldr     r2, [r11, #0x24]
        str     r0, [sp, #0x30]
        mov     r1, r4
        mov     r0, r2
        bl      __mulsf3
        ldr     r2, [r11, #0x28]!
        str     r0, [sp, #0x2C]
        mov     r0, r2
        mov     r1, r5
        bl      __mulsf3
        ldr     r1, [sp, #0x2C]
        bl      __addsf3
        mov     r1, r0
        ldr     r0, [sp, #0x30]
        bl      __subsf3
        ldr     r2, [r10, #0x28]!
        str     r0, [sp, #0x30]
        mov     r0, r2
        mov     r1, r7
        bl      __mulsf3
        ldr     r1, [sp, #0x30]
        bl      __addsf3
        ldr     r2, [sp, #0x28]
        mov     r7, r5
        str     r0, [r2, #0x10]!
        str     r2, [sp, #0x28]
        ldr     r3, [sp, #0x18]
        ldr     r2, [sp, #0x1C]
        cmp     r2, r3
        blt     LBQB3
        ldr     r0, [sp, #0x14]
        ldr     r3, [sp, #0x10]
        ldr     r12, [sp, #0xC]
        ldr     r2, [sp]
LBQB4:
        add     r12, r12, #1
        str     r5, [r3, #4]
        str     r4, [r3, #8]!
        cmp     r12, r2
        add     r0, r0, #8
        blt     LBQB2
        mov     r0, #0
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LBQB5:
        mvn     r0, #7
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LBQB6:
        mvn     r0, #5
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LBQB__ippsIIRAR_32fc:
        .long   0xe92d4ff0
        .long   0xe24dd080
        .long   0xe5938004
        .long   0xe593900c
        .long   0xe5935008
        .long   0xe598b000
        .long   0xe5984004
        .long   0xe1a07001
        .long   0xe3590000
        .long   0xe1a06002
        .long   0xe3a01000
        .long   0x01a0a001
        .long   0x0a000209
        .long   0xe5983008
        .long   0xe598200c
        .long   0xe1a0c189
        .long   0xe28ce008
        .long   0xe3590001
        .long   0xe58de07c
        .long   0xe288c008
        .long   0xe08ea008
        .long   0xda000200
        .long   0xe3c6e001
        .long   0xe35e0000
        .long   0xe58de058
        .long   0xda000189
        .long   0xe1a0e189
        .long   0xe24e1008
        .long   0xe3a0e000
        .long   0xe58de074
        .long   0xe280e008
        .long   0xe58de05c
        .long   0xe249e001
        .long   0xe58de070
        .long   0xe08ce001
        .long   0xe58de06c
        .long   0xe28ae008
        .long   0xe58de068
        .long   0xe247e004
        .long   0xe58de064
        .long   0xe247e00c
        .long   0xe58d6008
        .long   0xe58de060
        .long   0xe58d0078
        .long   0xe58d2030
        .long   0xe58d3038
        .long   0xe58dc03c
        .long   0xe58d4040
        .long   0xe58db044
        .long   0xe58d8048
        .long   0xe58d9004
        .long   0xe58d700c
        .long   0xe58d0050
        .long   0xe1a06001
LBQB7:
        .long   0xe59d005c
        .long   0xe59d3078
        .long   0xe5954000
        .long   0xe5902000
        .long   0xe59d9044
        .long   0xe5938000
        .long   0xe58d2014
        .long   0xe5937004
        .long   0xe5900004
        .long   0xe1a01008
        .long   0xe58d0000
        .long   0xe1a00009
        .long   0xeb000000
        .long   0xe1a01004
        .long   0xeb000000
        .long   0xe59db040
        .long   0xe1a04000
        .long   0xe1a01007
        .long   0xe1a0000b
        .long   0xeb000000
        .long   0xe1a01000
        .long   0xe1a00004
        .long   0xeb000000
        .long   0xe5952004
        .long   0xe1a04000
        .long   0xe1a0000b
        .long   0xe58d2054
        .long   0xe1a01008
        .long   0xeb000000
        .long   0xe59d1054
        .long   0xeb000000
        .long   0xe58d0054
        .long   0xe1a01007
        .long   0xe1a00009
        .long   0xeb000000
        .long   0xe59d1054
        .long   0xeb000000
        .long   0xe59a2004
        .long   0xe59d307c
        .long   0xe58d2054
        .long   0xe59d2048
        .long   0xe1a01008
        .long   0xe7923003
        .long   0xe58d3028
        .long   0xe5952008
        .long   0xe58d0010
        .long   0xe59d0038
        .long   0xe58d2024
        .long   0xeb000000
        .long   0xe59d1024
        .long   0xeb000000
        .long   0xe58d0024
        .long   0xe59d0030
        .long   0xe1a01007
        .long   0xeb000000
        .long   0xe1a01000
        .long   0xe59d0024
        .long   0xeb000000
        .long   0xe58d0024
        .long   0xe59d0028
        .long   0xe1a01004
        .long   0xeb000000
        .long   0xe1a01000
        .long   0xe59d0024
        .long   0xeb000000
        .long   0xe59d1010
        .long   0xe58d0024
        .long   0xe59d0054
        .long   0xeb000000
        .long   0xe59d1024
        .long   0xeb000000
        .long   0xe59d1014
        .long   0xe58d0024
        .long   0xe1a00009
        .long   0xeb000000
        .long   0xe59d1024
        .long   0xeb000000
        .long   0xe59d1000
        .long   0xe58d0024
        .long   0xe1a0000b
        .long   0xeb000000
        .long   0xe1a01000
        .long   0xe59d0024
        .long   0xeb000000
        .long   0xe595200c
        .long   0xe58d001c
        .long   0xe59d0030
        .long   0xe58d2024
        .long   0xe1a01008
        .long   0xeb000000
        .long   0xe59d1024
        .long   0xeb000000
        .long   0xe58d0024
        .long   0xe59d0038
        .long   0xe1a01007
        .long   0xeb000000
        .long   0xe59d1024
        .long   0xeb000000
        .long   0xe58d0024
        .long   0xe59d0054
        .long   0xe1a01004
        .long   0xeb000000
        .long   0xe1a01000
        .long   0xe59d0024
        .long   0xeb000000
        .long   0xe59d1010
        .long   0xe58d0054
        .long   0xe59d0028
        .long   0xeb000000
        .long   0xe1a01000
        .long   0xe59d0054
        .long   0xeb000000
        .long   0xe59d1014
        .long   0xe58d0054
        .long   0xe1a0000b
        .long   0xeb000000
        .long   0xe59d1054
        .long   0xeb000000
        .long   0xe59d1000
        .long   0xe58d0054
        .long   0xe1a00009
        .long   0xeb000000
        .long   0xe59d1054
        .long   0xeb000000
        .long   0xe59d2070
        .long   0xe58d0024
        .long   0xe3520000
        .long   0xda000090
        .long   0xe59d3068
        .long   0xe285200c
        .long   0xe24ab004
        .long   0xe2430004
        .long   0xe59d3048
        .long   0xe58d7020
        .long   0xe58d8018
        .long   0xe58d602c
        .long   0xe283100c
        .long   0xe2839004
        .long   0xe2453004
        .long   0xe58d3054
        .long   0xe59d3070
        .long   0xe59d8054
        .long   0xe58d504c
        .long   0xe58d3028
        .long   0xe58da034
        .long   0xe1a06000
        .long   0xe1a05001
        .long   0xe1a07002
LBQB8:
        .long   0xe59d1014
        .long   0xe5990004
        .long   0xeb000000
        .long   0xe59d1000
        .long   0xe5992008
        .long   0xe1a0a000
        .long   0xe1a00002
        .long   0xeb000000
        .long   0xe1a01000
        .long   0xe1a0000a
        .long   0xeb000000
        .long   0xe59d101c
        .long   0xe59b2004
        .long   0xe1a0a000
        .long   0xe1a00002
        .long   0xeb000000
        .long   0xe1a01000
        .long   0xe1a0000a
        .long   0xeb000000
        .long   0xe59b2008
        .long   0xe59d1024
        .long   0xe1a0a000
        .long   0xe1a00002
        .long   0xeb000000
        .long   0xe1a0100a
        .long   0xeb000000
        .long   0xe59d1018
        .long   0xe5952004
        .long   0xe1a0a000
        .long   0xe1a00002
        .long   0xeb000000
        .long   0xe1a0100a
        .long   0xeb000000
        .long   0xe5952008
        .long   0xe59d1020
        .long   0xe1a0a000
        .long   0xe1a00002
        .long   0xeb000000
        .long   0xe1a01000
        .long   0xe1a0000a
        .long   0xeb000000
        .long   0xe5962004
        .long   0xe1a0a000
        .long   0xe1a01004
        .long   0xe1a00002
        .long   0xeb000000
        .long   0xe1a01000
        .long   0xe1a0000a
        .long   0xeb000000
        .long   0xe59d1010
        .long   0xe5962008
        .long   0xe1a0a000
        .long   0xe1a00002
        .long   0xeb000000
        .long   0xe1a0100a
        .long   0xeb000000
        .long   0xe5971004
        .long   0xeb000000
        .long   0xe5880004
        .long   0xe5990004
        .long   0xe59d1000
        .long   0xeb000000
        .long   0xe59d1014
        .long   0xe5b92008
        .long   0xe1a0a000
        .long   0xe1a00002
        .long   0xeb000000
        .long   0xe1a0100a
        .long   0xeb000000
        .long   0xe59b2004
        .long   0xe59d1024
        .long   0xe1a0a000
        .long   0xe1a00002
        .long   0xeb000000
        .long   0xe1a01000
        .long   0xe1a0000a
        .long   0xeb000000
        .long   0xe59d101c
        .long   0xe5bb2008
        .long   0xe1a0a000
        .long   0xe1a00002
        .long   0xeb000000
        .long   0xe1a01000
        .long   0xe1a0000a
        .long   0xeb000000
        .long   0xe5952004
        .long   0xe59d1020
        .long   0xe1a0a000
        .long   0xe1a00002
        .long   0xeb000000
        .long   0xe1a0100a
        .long   0xeb000000
        .long   0xe5b52008
        .long   0xe59d1018
        .long   0xe1a0a000
        .long   0xe1a00002
        .long   0xeb000000
        .long   0xe1a0100a
        .long   0xeb000000
        .long   0xe59d1010
        .long   0xe5962004
        .long   0xe1a0a000
        .long   0xe1a00002
        .long   0xeb000000
        .long   0xe1a01000
        .long   0xe1a0000a
        .long   0xeb000000
        .long   0xe5b62008
        .long   0xe1a0a000
        .long   0xe1a01004
        .long   0xe1a00002
        .long   0xeb000000
        .long   0xe1a01000
        .long   0xe1a0000a
        .long   0xeb000000
        .long   0xe5b71008
        .long   0xeb000000
        .long   0xe5a80008
        .long   0xe59d3028
        .long   0xe2533001
        .long   0xe58d3028
        .long   0x1affff85
        .long   0xe59d602c
        .long   0xe59da034
        .long   0xe59d504c
LBQB9:
        .long   0xe59d203c
        .long   0xe59db014
        .long   0xe08a9006
        .long   0xe7960002
        .long   0xe1a0100b
        .long   0xeb000000
        .long   0xe59d206c
        .long   0xe59d1000
        .long   0xe0853006
        .long   0xe5922004
        .long   0xe58d3054
        .long   0xe1a07000
        .long   0xe1a00002
        .long   0xeb000000
        .long   0xe1a01000
        .long   0xe1a00007
        .long   0xeb000000
        .long   0xe59d701c
        .long   0xe796200a
        .long   0xe59d305c
        .long   0xe1a08000
        .long   0xe1a01007
        .long   0xe2833010
        .long   0xe58d305c
        .long   0xe1a00002
        .long   0xeb000000
        .long   0xe1a01000
        .long   0xe1a00008
        .long   0xeb000000
        .long   0xe5992004
        .long   0xe59d8024
        .long   0xe59d3078
        .long   0xe58d0028
        .long   0xe2833010
        .long   0xe58d3078
        .long   0xe1a00002
        .long   0xe1a01008
        .long   0xeb000000
        .long   0xe59d1028
        .long   0xeb000000
        .long   0xe7860005
        .long   0xe59d206c
        .long   0xe1a0100b
        .long   0xe5920004
        .long   0xe59d2074
        .long   0xe282b002
        .long   0xe58db074
        .long   0xeb000000
        .long   0xe59d203c
        .long   0xe59d1000
        .long   0xe7962002
        .long   0xe58d0028
        .long   0xe1a00002
        .long   0xeb000000
        .long   0xe59d1028
        .long   0xeb000000
        .long   0xe5992004
        .long   0xe1a09000
        .long   0xe1a01007
        .long   0xe1a00002
        .long   0xeb000000
        .long   0xe1a01000
        .long   0xe1a00009
        .long   0xeb000000
        .long   0xe796200a
        .long   0xe1a09000
        .long   0xe1a01008
        .long   0xe1a00002
        .long   0xeb000000
        .long   0xe1a01000
        .long   0xe1a00009
        .long   0xeb000000
        .long   0xe59d2054
        .long   0xe5820004
        .long   0xe59d2060
        .long   0xe582400c
        .long   0xe59d0010
        .long   0xe5a20010
        .long   0xe59d0064
        .long   0xe580700c
        .long   0xe5a08010
        .long   0xe59d3058
        .long   0xe58d0064
        .long   0xe15b0003
        .long   0xe58d2060
        .long   0xbafffe98
        .long   0xe59d4040
        .long   0xe59db044
        .long   0xe59d8048
        .long   0xe59d9004
        .long   0xe59d6008
        .long   0xe59d700c
        .long   0xe59d0050
LBQB10:
        .long   0xe3160001
        .long   0x0a000155
        .long   0xe2400008
        .long   0xe7903186
        .long   0xe0800186
        .long   0xe58d3074
        .long   0xe5900004
        .long   0xe59d1074
        .long   0xe58d0078
        .long   0xe5953000
        .long   0xe1a0000b
        .long   0xe58d307c
        .long   0xeb000000
        .long   0xe59d107c
        .long   0xeb000000
        .long   0xe59d1078
        .long   0xe58d007c
        .long   0xe1a00004
        .long   0xeb000000
        .long   0xe1a01000
        .long   0xe59d007c
        .long   0xeb000000
        .long   0xe58d0000
        .long   0xe59d1074
        .long   0xe1a00004
        .long   0xe5954004
        .long   0xeb000000
        .long   0xe1a01004
        .long   0xeb000000
        .long   0xe59d1078
        .long   0xe1a04000
        .long   0xe1a0000b
        .long   0xeb000000
        .long   0xe1a01004
        .long   0xeb000000
        .long   0xe3590000
        .long   0xe1a04000
        .long   0xda000044
        .long   0xe58d6008
        .long   0xe58d700c
        .long   0xe59d6078
        .long   0xe59d7074
        .long   0xe285b004
        .long   0xe24aa004
        .long   0xe2888004
        .long   0xe2455004
        .long   0xe58d9004
LBQB11:
        .long   0xe5980004
        .long   0xe1a01007
        .long   0xeb000000
        .long   0xe1a09000
        .long   0xe5980008
        .long   0xe1a01006
        .long   0xeb000000
        .long   0xe1a01000
        .long   0xe1a00009
        .long   0xeb000000
        .long   0xe59d1000
        .long   0xe1a09000
        .long   0xe59a0004
        .long   0xeb000000
        .long   0xe1a01000
        .long   0xe1a00009
        .long   0xeb000000
        .long   0xe1a09000
        .long   0xe59a0008
        .long   0xe1a01004
        .long   0xeb000000
        .long   0xe1a01009
        .long   0xeb000000
        .long   0xe59b1004
        .long   0xeb000000
        .long   0xe5850004
        .long   0xe5980004
        .long   0xe1a01006
        .long   0xeb000000
        .long   0xe1a01007
        .long   0xe1a09000
        .long   0xe5b80008
        .long   0xeb000000
        .long   0xe1a01009
        .long   0xeb000000
        .long   0xe59a2004
        .long   0xe1a09000
        .long   0xe1a01004
        .long   0xe1a00002
        .long   0xeb000000
        .long   0xe1a01000
        .long   0xe1a00009
        .long   0xeb000000
        .long   0xe59d1000
        .long   0xe5ba2008
        .long   0xe1a09000
        .long   0xe1a00002
        .long   0xeb000000
        .long   0xe1a01000
        .long   0xe1a00009
        .long   0xeb000000
        .long   0xe5bb1008
        .long   0xeb000000
        .long   0xe5a50008
        .long   0xe59d2004
        .long   0xe2522001
        .long   0xe58d2004
        .long   0x1affffc5
        .long   0xe59d6008
        .long   0xe59d700c
LBQB12:
        .long   0xe59d3000
        .long   0xe2477008
        .long   0xe087c186
        .long   0xe7873186
        .long   0xe58c4004
        .long   0xe3a00000
        .long   0xe28dd080
        .long   0xe8bd8ff0
LBQB13:
        .long   0xe3590000
        .long   0x0a000068
        .long   0xe3560000
        .long   0xda0000e0
        .long   0xe2477004
        .long   0xe2400004
        .long   0xe58db044
        .long   0xe58d6008
        .long   0xe58d0078
        .long   0xe58d707c
        .long   0xe58d3038
        .long   0xe58d4040
        .long   0xe1a09001
        .long   0xe1a06002
        .long   0xe1a0b005
LBQB14:
        .long   0xe59d3078
        .long   0xe59d0044
        .long   0xe2899001
        .long   0xe5934004
        .long   0xe5b35008
        .long   0xe58d3078
        .long   0xe59b7000
        .long   0xe1a01004
        .long   0xeb000000
        .long   0xe1a01007
        .long   0xeb000000
        .long   0xe1a07000
        .long   0xe59d0040
        .long   0xe1a01005
        .long   0xeb000000
        .long   0xe1a01000
        .long   0xe1a00007
        .long   0xeb000000
        .long   0xe59b7004
        .long   0xe1a08000
        .long   0xe59d0040
        .long   0xe1a01004
        .long   0xeb000000
        .long   0xe1a01007
        .long   0xeb000000
        .long   0xe1a07000
        .long   0xe59d0044
        .long   0xe1a01005
        .long   0xeb000000
        .long   0xe1a01007
        .long   0xeb000000
        .long   0xe1a07000
        .long   0xe59d0038
        .long   0xe1a01004
        .long   0xeb000000
        .long   0xe58d0074
        .long   0xe1a01005
        .long   0xe1a00006
        .long   0xeb000000
        .long   0xe1a01000
        .long   0xe59d0074
        .long   0xeb000000
        .long   0xe59a2000
        .long   0xe58d0074
        .long   0xe1a00002
        .long   0xe1a01008
        .long   0xeb000000
        .long   0xe1a01000
        .long   0xe59d0074
        .long   0xeb000000
        .long   0xe59a2004
        .long   0xe58d0074
        .long   0xe1a00002
        .long   0xe1a01007
        .long   0xeb000000
        .long   0xe59d1074
        .long   0xeb000000
        .long   0xe58b0000
        .long   0xe1a01004
        .long   0xe1a00006
        .long   0xeb000000
        .long   0xe1a04000
        .long   0xe59d0038
        .long   0xe1a01005
        .long   0xeb000000
        .long   0xe1a01004
        .long   0xeb000000
        .long   0xe1a04000
        .long   0xe59a0004
        .long   0xe1a01008
        .long   0xeb000000
        .long   0xe1a01000
        .long   0xe1a00004
        .long   0xeb000000
        .long   0xe1a04000
        .long   0xe59a0000
        .long   0xe1a01007
        .long   0xeb000000
        .long   0xe1a01000
        .long   0xe1a00004
        .long   0xeb000000
        .long   0xe58b0004
        .long   0xe59d307c
        .long   0xe5838004
        .long   0xe5a37008
        .long   0xe58d307c
        .long   0xe59d3008
        .long   0xe1590003
        .long   0xbaffffa6
        .long   0xe3a00000
        .long   0xe28dd080
        .long   0xe8bd8ff0
LBQB15:
        .long   0xe3560000
        .long   0xda000077
        .long   0xe3560004
        .long   0xba000054
        .long   0xe2463004
        .long   0xe2478004
        .long   0xe2405004
        .long   0xe58d307c
        .long   0xe58d6008
        .long   0xe58d700c
        .long   0xe58d0050
        .long   0xe1a09001
LBQB16:
        .long   0xe5957004
        .long   0xe595a008
        .long   0xe1a0000b
        .long   0xe1a01007
        .long   0xeb000000
        .long   0xe1a06000
        .long   0xe1a0100a
        .long   0xe1a00004
        .long   0xeb000000
        .long   0xe1a01000
        .long   0xe1a00006
        .long   0xeb000000
        .long   0xe5880004
        .long   0xe1a01007
        .long   0xe1a00004
        .long   0xeb000000
        .long   0xe1a06000
        .long   0xe1a0100a
        .long   0xe1a0000b
        .long   0xeb000000
        .long   0xe1a01006
        .long   0xeb000000
        .long   0xe5880008
        .long   0xe595700c
        .long   0xe595a010
        .long   0xe1a0000b
        .long   0xe1a01007
        .long   0xeb000000
        .long   0xe1a06000
        .long   0xe1a0100a
        .long   0xe1a00004
        .long   0xeb000000
        .long   0xe1a01000
        .long   0xe1a00006
        .long   0xeb000000
        .long   0xe588000c
        .long   0xe1a00004
        .long   0xe1a01007
        .long   0xeb000000
        .long   0xe1a06000
        .long   0xe1a0100a
        .long   0xe1a0000b
        .long   0xeb000000
        .long   0xe1a01006
        .long   0xeb000000
        .long   0xe5880010
        .long   0xe5957014
        .long   0xe5b5a018
        .long   0xe1a0000b
        .long   0xe1a01007
        .long   0xeb000000
        .long   0xe1a06000
        .long   0xe1a00004
        .long   0xe1a0100a
        .long   0xeb000000
        .long   0xe1a01000
        .long   0xe1a00006
        .long   0xeb000000
        .long   0xe5880014
        .long   0xe1a01007
        .long   0xe1a00004
        .long   0xeb000000
        .long   0xe1a06000
        .long   0xe1a0100a
        .long   0xe1a0000b
        .long   0xeb000000
        .long   0xe1a01006
        .long   0xeb000000
        .long   0xe5a80018
        .long   0xe59d207c
        .long   0xe2899003
        .long   0xe1590002
        .long   0xdaffffb6
        .long   0xe1a01009
        .long   0xe59d6008
        .long   0xe59d700c
        .long   0xe59d0050
LBQB17:
        .long   0xe1a03181
        .long   0xe2433004
        .long   0xe0837007
        .long   0xe0835000
        .long   0xe58d6008
        .long   0xe1a09001
LBQB18:
        .long   0xe5958004
        .long   0xe5b5a008
        .long   0xe1a0000b
        .long   0xe1a01008
        .long   0xeb000000
        .long   0xe1a06000
        .long   0xe1a00004
        .long   0xe1a0100a
        .long   0xeb000000
        .long   0xe1a01000
        .long   0xe1a00006
        .long   0xeb000000
        .long   0xe5870004
        .long   0xe1a00004
        .long   0xe1a01008
        .long   0xeb000000
        .long   0xe1a06000
        .long   0xe1a0000b
        .long   0xe1a0100a
        .long   0xeb000000
        .long   0xe1a01006
        .long   0xeb000000
        .long   0xe5a70008
        .long   0xe59d2008
        .long   0xe2899001
        .long   0xe1590002
        .long   0xbaffffe4
LBQB19:
        .long   0xe3a00000
        .long   0xe28dd080
        .long   0xe8bd8ff0
        .long   0x49493034


        .data
        .align  4


LBQB__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00
LBQB__2il0floatpacket.2:
        .byte   0x00,0x00,0x00,0x00


