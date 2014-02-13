        .text
        .align  4
        .globl  ownsConvDown2_32f


ownsConvDown2_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        ldr     r10, [r0]
        ldr     r5, [r0, #8]
        ldr     r12, [pc, #0xA54]
        sub     r0, r10, #8
        cmn     r0, #8
        ldrcs   r0, [r12, +r0, lsl #2]
        rsb     r12, r10, #1
        mov     r7, r2
        mov     r6, r3
        add     r4, r1, r12, lsl #2
        and     r1, r10, #3
        addcs   pc, pc, r0
        subs    r1, r1, #2
LAJZ_.Lpc1:
        beq     LAJZ1
        b       LAJZ0
LAJZ_bd.1.1:
        .long   0xe28dd010
        .long   0xe8bd8ff0
LAJZ0:
        adds    r0, r1, #1
        beq     LAJZ5
        adds    r0, r0, #1
        beq     LAJZ9
        b       LAJZ13
LAJZ1:
        cmp     r6, #0
        ble     |bd.1.1|
        sub     r10, r10, #3
LAJZ2:
        ldr     r1, [r5]
        ldr     r0, [r4]
        add     r12, r4, #8
        str     r12, [sp]
        bl      __mulsf3
        ldr     r2, [r4, #4]
        ldr     r1, [r5, #4]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r5, #8]
        ldr     r2, [r4, #8]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r5, #0xC]
        ldr     r2, [r4, #0xC]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        bl      __extendsfdf2
        cmp     r10, #4
        mov     r9, r0
        mov     r8, r1
        movle   r1, #4
        ble     LAJZ4
        add     r0, r5, #0xC
        mov     r1, #4
        str     r5, [sp, #4]
        str     r6, [sp, #8]
        add     r11, r4, #0xC
        str     r7, [sp, #0xC]
        mov     r6, r0
        mov     r5, r1
LAJZ3:
        ldr     r0, [r4, +r5, lsl #2]
        ldr     r1, [r6, #4]
        add     r5, r5, #4
        bl      __mulsf3
        ldr     r1, [r6, #8]
        mov     r7, r0
        ldr     r0, [r11, #8]
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        mov     r7, r0
        ldr     r1, [r6, #0xC]
        ldr     r0, [r11, #0xC]
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        mov     r7, r0
        ldr     r0, [r11, #0x10]!
        ldr     r1, [r6, #0x10]!
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        bl      __extendsfdf2
        mov     r2, r9
        mov     r3, r8
        bl      __adddf3
        cmp     r5, r10
        mov     r9, r0
        mov     r8, r1
        blt     LAJZ3
        mov     r1, r5
        ldr     r5, [sp, #4]
        ldr     r6, [sp, #8]
        ldr     r7, [sp, #0xC]
LAJZ4:
        ldr     r0, [r4, +r1, lsl #2]
        ldr     r2, [r5, +r1, lsl #2]
        add     r11, r5, r1, lsl #2
        add     r4, r4, r1, lsl #2
        mov     r1, r2
        bl      __mulsf3
        ldr     r1, [r4, #4]
        ldr     r2, [r11, #4]
        ldr     r4, [sp]
        mov     r11, r0
        mov     r0, r1
        mov     r1, r2
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        bl      __extendsfdf2
        mov     r2, r9
        mov     r3, r8
        bl      __adddf3
        bl      __truncdfsf2
        str     r0, [r7], #4
        subs    r6, r6, #1
        bne     LAJZ2
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LAJZ5:
        cmp     r6, #0
        ble     |bd.1.1|
        sub     r11, r10, #3
LAJZ6:
        ldr     r1, [r5]
        ldr     r0, [r4]
        add     r8, r4, #8
        bl      __mulsf3
        ldr     r1, [r4, #4]
        ldr     r2, [r5, #4]
        mov     r9, r0
        mov     r0, r1
        mov     r1, r2
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        ldr     r1, [r4, #8]
        ldr     r2, [r5, #8]
        mov     r9, r0
        mov     r0, r1
        mov     r1, r2
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        ldr     r1, [r4, #0xC]
        ldr     r2, [r5, #0xC]
        mov     r9, r0
        mov     r0, r1
        mov     r1, r2
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        bl      __extendsfdf2
        cmp     r11, #4
        mov     r10, r0
        mov     r9, r1
        movle   r0, #4
        ble     LAJZ8
        str     r6, [sp, #8]
        add     r1, r5, #0xC
        add     r2, r4, #0xC
        str     r5, [sp, #4]
        mov     r6, r4
        mov     r0, #4
        str     r8, [sp]
        mov     r5, r10
        mov     r4, r9
        str     r7, [sp, #0xC]
        mov     r8, r0
        mov     r10, r1
        mov     r9, r2
LAJZ7:
        ldr     r0, [r6, +r8, lsl #2]
        ldr     r1, [r10, #4]
        add     r8, r8, #4
        bl      __mulsf3
        ldr     r1, [r10, #8]
        mov     r7, r0
        ldr     r0, [r9, #8]
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        mov     r7, r0
        ldr     r1, [r10, #0xC]
        ldr     r0, [r9, #0xC]
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        mov     r7, r0
        ldr     r0, [r9, #0x10]!
        ldr     r1, [r10, #0x10]!
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        cmp     r8, r11
        mov     r5, r0
        mov     r4, r1
        blt     LAJZ7
        mov     r9, r4
        mov     r4, r6
        mov     r10, r5
        mov     r0, r8
        ldr     r8, [sp]
        ldr     r5, [sp, #4]
        ldr     r6, [sp, #8]
        ldr     r7, [sp, #0xC]
LAJZ8:
        ldr     r2, [r4, +r0, lsl #2]
        ldr     r1, [r5, +r0, lsl #2]
        mov     r4, r8
        mov     r0, r2
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r10
        mov     r3, r9
        bl      __adddf3
        bl      __truncdfsf2
        str     r0, [r7], #4
        subs    r6, r6, #1
        bne     LAJZ6
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LAJZ9:
        cmp     r6, #0
        ble     |bd.1.1|
LAJZ10:
        ldr     r1, [r5]
        ldr     r0, [r4]
        add     r11, r4, #8
        bl      __mulsf3
        ldr     r2, [r4, #4]
        ldr     r1, [r5, #4]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r5, #8]
        ldr     r2, [r4, #8]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r5, #0xC]
        ldr     r2, [r4, #0xC]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        bl      __extendsfdf2
        cmp     r10, #4
        mov     r9, r0
        mov     r8, r1
        ble     LAJZ12
        add     r1, r5, #0xC
        mov     r2, #4
        add     r0, r4, #0xC
        str     r5, [sp, #4]
        str     r6, [sp, #8]
        str     r7, [sp, #0xC]
        str     r11, [sp]
        mov     r5, r0
        mov     r6, r1
        mov     r7, r2
LAJZ11:
        ldr     r0, [r4, +r7, lsl #2]
        ldr     r1, [r6, #4]
        add     r7, r7, #4
        bl      __mulsf3
        ldr     r1, [r6, #8]
        mov     r11, r0
        ldr     r0, [r5, #8]
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        mov     r11, r0
        ldr     r1, [r6, #0xC]
        ldr     r0, [r5, #0xC]
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        mov     r11, r0
        ldr     r0, [r5, #0x10]!
        ldr     r1, [r6, #0x10]!
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        bl      __extendsfdf2
        mov     r2, r9
        mov     r3, r8
        bl      __adddf3
        cmp     r7, r10
        mov     r9, r0
        mov     r8, r1
        blt     LAJZ11
        ldr     r11, [sp]
        ldr     r5, [sp, #4]
        ldr     r6, [sp, #8]
        ldr     r7, [sp, #0xC]
LAJZ12:
        mov     r0, r9
        mov     r1, r8
        bl      __truncdfsf2
        str     r0, [r7], #4
        subs    r6, r6, #1
        mov     r4, r11
        bne     LAJZ10
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LAJZ13:
        cmp     r6, #0
        ble     |bd.1.1|
        sub     r8, r10, #3
        str     r6, [sp, #8]
        str     r7, [sp, #0xC]
LAJZ14:
        ldr     r1, [r5]
        ldr     r0, [r4]
        add     r2, r4, #8
        str     r2, [sp]
        bl      __mulsf3
        ldr     r1, [r4, #4]
        ldr     r2, [r5, #4]
        mov     r6, r0
        mov     r0, r1
        mov     r1, r2
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        ldr     r1, [r4, #8]
        ldr     r2, [r5, #8]
        mov     r6, r0
        mov     r0, r1
        mov     r1, r2
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        ldr     r1, [r4, #0xC]
        ldr     r2, [r5, #0xC]
        mov     r6, r0
        mov     r0, r1
        mov     r1, r2
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        bl      __extendsfdf2
        cmp     r8, #4
        mov     r7, r0
        mov     r6, r1
        movle   r9, #4
        ble     LAJZ16
        mov     r9, #4
        add     r11, r5, #0xC
        add     r10, r4, #0xC
        str     r5, [sp, #4]
LAJZ15:
        ldr     r0, [r4, +r9, lsl #2]
        ldr     r1, [r11, #4]
        add     r9, r9, #4
        bl      __mulsf3
        ldr     r1, [r11, #8]
        mov     r5, r0
        ldr     r0, [r10, #8]
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        mov     r5, r0
        ldr     r1, [r11, #0xC]
        ldr     r0, [r10, #0xC]
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        mov     r5, r0
        ldr     r0, [r10, #0x10]!
        ldr     r1, [r11, #0x10]!
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        bl      __extendsfdf2
        mov     r2, r7
        mov     r3, r6
        bl      __adddf3
        cmp     r9, r8
        mov     r7, r0
        mov     r6, r1
        blt     LAJZ15
        ldr     r5, [sp, #4]
LAJZ16:
        ldr     r0, [r4, +r9, lsl #2]
        ldr     r1, [r5, +r9, lsl #2]
        add     r11, r5, r9, lsl #2
        add     r10, r4, r9, lsl #2
        bl      __mulsf3
        mov     r9, r0
        ldr     r0, [r10, #4]
        ldr     r1, [r11, #4]
        ldr     r4, [sp]
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        ldr     r1, [r11, #8]
        ldr     r10, [r10, #8]
        mov     r9, r0
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        bl      __extendsfdf2
        mov     r2, r7
        mov     r3, r6
        bl      __adddf3
        bl      __truncdfsf2
        ldr     r1, [sp, #0xC]
        str     r0, [r1], #4
        ldr     r0, [sp, #8]
        str     r1, [sp, #0xC]
        subs    r0, r0, #1
        str     r0, [sp, #8]
        bne     LAJZ14
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LAJZ_bd.1.2:
        .long   0xe3560000
        .long   0xdafffe68
LAJZ17:
        .long   0xe4940008
        .long   0xe5951000
        .long   0xeb000000
        .long   0xe4870004
        .long   0xe2566001
        .long   0x1afffff9
        .long   0xe28dd010
        .long   0xe8bd8ff0
LAJZ_bd.1.3:
        .long   0xe3560000
        .long   0xdafffe5e
LAJZ18:
        .long   0xe5940000
        .long   0xe5951000
        .long   0xeb000000
        .long   0xe5942004
        .long   0xe5951004
        .long   0xe1a08000
        .long   0xe1a00002
        .long   0xe2844008
        .long   0xeb000000
        .long   0xe1a01008
        .long   0xeb000000
        .long   0xe4870004
        .long   0xe2566001
        .long   0x1afffff1
        .long   0xe28dd010
        .long   0xe8bd8ff0
LAJZ_bd.1.4:
        .long   0xe3560000
        .long   0xdafffe4c
LAJZ19:
        .long   0xe5940000
        .long   0xe5951000
        .long   0xe2848008
        .long   0xeb000000
        .long   0xe5941004
        .long   0xe5952004
        .long   0xe1a09000
        .long   0xe1a00001
        .long   0xe1a01002
        .long   0xeb000000
        .long   0xe1a01009
        .long   0xeb000000
        .long   0xe5941008
        .long   0xe5952008
        .long   0xe1a09000
        .long   0xe1a00001
        .long   0xe1a04008
        .long   0xe1a01002
        .long   0xeb000000
        .long   0xe1a01009
        .long   0xeb000000
        .long   0xe4870004
        .long   0xe2566001
        .long   0x1affffe7
        .long   0xe28dd010
        .long   0xe8bd8ff0
LAJZ_bd.1.5:
        .long   0xe3560000
        .long   0xdafffe30
LAJZ20:
        .long   0xe5940000
        .long   0xe5951000
        .long   0xe2848008
        .long   0xeb000000
        .long   0xe5942004
        .long   0xe5951004
        .long   0xe1a09000
        .long   0xe1a00002
        .long   0xeb000000
        .long   0xe1a01009
        .long   0xeb000000
        .long   0xe5942008
        .long   0xe5951008
        .long   0xe1a09000
        .long   0xe1a00002
        .long   0xeb000000
        .long   0xe1a01009
        .long   0xeb000000
        .long   0xe594200c
        .long   0xe595100c
        .long   0xe1a09000
        .long   0xe1a00002
        .long   0xe1a04008
        .long   0xeb000000
        .long   0xe1a01009
        .long   0xeb000000
        .long   0xe4870004
        .long   0xe2566001
        .long   0x1affffe2
        .long   0xe28dd010
        .long   0xe8bd8ff0
LAJZ_bd.1.6:
        .long   0xe3560000
        .long   0xdafffe0f
LAJZ21:
        .long   0xe5940000
        .long   0xe5951000
        .long   0xe2848008
        .long   0xeb000000
        .long   0xe5941004
        .long   0xe5952004
        .long   0xe1a09000
        .long   0xe1a00001
        .long   0xe1a01002
        .long   0xeb000000
        .long   0xe1a01009
        .long   0xeb000000
        .long   0xe5942008
        .long   0xe5951008
        .long   0xe1a09000
        .long   0xe1a00002
        .long   0xeb000000
        .long   0xe1a01009
        .long   0xeb000000
        .long   0xe594100c
        .long   0xe595200c
        .long   0xe1a09000
        .long   0xe1a00001
        .long   0xe1a01002
        .long   0xeb000000
        .long   0xe1a01009
        .long   0xeb000000
        .long   0xe5941010
        .long   0xe5952010
        .long   0xe1a09000
        .long   0xe1a00001
        .long   0xe1a04008
        .long   0xe1a01002
        .long   0xeb000000
        .long   0xe1a01009
        .long   0xeb000000
        .long   0xe4870004
        .long   0xe2566001
        .long   0x1affffd8
        .long   0xe28dd010
        .long   0xe8bd8ff0
LAJZ_bd.1.7:
        .long   0xe3560000
        .long   0xdafffde4
LAJZ22:
        .long   0xe5940000
        .long   0xe5951000
        .long   0xe2848008
        .long   0xeb000000
        .long   0xe5951004
        .long   0xe5942004
        .long   0xe1a09000
        .long   0xe1a00002
        .long   0xeb000000
        .long   0xe1a01009
        .long   0xeb000000
        .long   0xe5942008
        .long   0xe5951008
        .long   0xe1a09000
        .long   0xe1a00002
        .long   0xeb000000
        .long   0xe1a01009
        .long   0xeb000000
        .long   0xe594200c
        .long   0xe595100c
        .long   0xe1a09000
        .long   0xe1a00002
        .long   0xeb000000
        .long   0xe1a01009
        .long   0xeb000000
        .long   0xe5942010
        .long   0xe5951010
        .long   0xe1a09000
        .long   0xe1a00002
        .long   0xeb000000
        .long   0xe1a01009
        .long   0xeb000000
        .long   0xe5942014
        .long   0xe5951014
        .long   0xe1a09000
        .long   0xe1a00002
        .long   0xe1a04008
        .long   0xeb000000
        .long   0xe1a01009
        .long   0xeb000000
        .long   0xe4870004
        .long   0xe2566001
        .long   0x1affffd4
        .long   0xe28dd010
        .long   0xe8bd8ff0
LAJZ_bd.1.8:
        .long   0xe3560000
        .long   0xdafffdb5
LAJZ23:
        .long   0xe5940000
        .long   0xe5951000
        .long   0xe2848008
        .long   0xeb000000
        .long   0xe5941004
        .long   0xe5952004
        .long   0xe1a09000
        .long   0xe1a00001
        .long   0xe1a01002
        .long   0xeb000000
        .long   0xe1a01009
        .long   0xeb000000
        .long   0xe5951008
        .long   0xe5942008
        .long   0xe1a09000
        .long   0xe1a00002
        .long   0xeb000000
        .long   0xe1a01009
        .long   0xeb000000
        .long   0xe594100c
        .long   0xe595200c
        .long   0xe1a09000
        .long   0xe1a00001
        .long   0xe1a01002
        .long   0xeb000000
        .long   0xe1a01009
        .long   0xeb000000
        .long   0xe5942010
        .long   0xe5951010
        .long   0xe1a09000
        .long   0xe1a00002
        .long   0xeb000000
        .long   0xe1a01009
        .long   0xeb000000
        .long   0xe5941014
        .long   0xe5952014
        .long   0xe1a09000
        .long   0xe1a00001
        .long   0xe1a01002
        .long   0xeb000000
        .long   0xe1a01009
        .long   0xeb000000
        .long   0xe5941018
        .long   0xe5952018
        .long   0xe1a09000
        .long   0xe1a00001
        .long   0xe1a04008
        .long   0xe1a01002
        .long   0xeb000000
        .long   0xe1a01009
        .long   0xeb000000
        .long   0xe4870004
        .long   0xe2566001
        .long   0x1affffc9
        .long   0xe28dd010
        .long   0xe8bd8ff0
LAJZ_bt.1:
        .long   0x00000008
        .long   0x0000065c
        .long   0x00000684
        .long   0x000006cc
        .long   0x0000073c
        .long   0x000007c0
        .long   0x0000086c
        .long   0x00000928
        .long   LAJZ_bt.1


