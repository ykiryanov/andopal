        .text
        .align  4
        .globl  _ippsIIROne32fc_16sc_Sfs


_ippsIIROne32fc_16sc_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x28
        cmp     r2, #0
        str     r0, [sp, #0x24]
        mov     r4, r1
        beq     LBRF28
        cmp     r4, #0
        beq     LBRF28
        ldr     r12, [pc, #0xD3C]
        ldr     lr, [r2]
        ldr     r0, [r2, #0x34]
        subs    r12, lr, r12
        add     r0, r3, r0
        beq     LBRF23
        adds    r12, r12, #1
        beq     LBRF0
        mvn     r0, #0x10
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LBRF0:
        ldr     r5, [r2, #0x2C]
        cmp     r5, #7
        bge     LBRF12
        cmp     r0, #0
        blt     LBRF1
        cmp     r0, #0x1F
        bgt     LBRF1
        ldrh    r0, [sp, #0x24]
        ldrh    r12, [sp, #0x26]
        mov     r1, r4
        orr     r0, r0, r12, lsl #16
        bl      LBRF_ownsIIRAROne32fc_16sc_Sfs
        mov     r0, #0
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LBRF1:
        ldr     r0, [pc, #0xCD8]
        ldr     r11, [r2, #4]
        cmp     r3, #0
        ldr     r0, [r0]
        str     r0, [sp, #0x20]
        andge   r3, r3, #0x7F
        subge   r8, r0, r3, lsl #23
        blt     LBRF26
LBRF2:
        str     r8, [sp, #0x20]
        ldr     r7, [r11]
        ldrsh   r0, [sp, #0x24]
        cmp     r5, #0
        beq     LBRF4
        ldr     r10, [r2, #8]
        bl      __floatsisf
        str     r0, [sp, #0x14]
        mov     r1, r7
        bl      __mulsf3
        ldrsh   r1, [sp, #0x26]
        ldr     r9, [r11, #4]
        mov     r6, r0
        mov     r0, r1
        bl      __floatsisf
        str     r0, [sp, #0x10]
        mov     r1, r9
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r6
        bl      __subsf3
        ldr     r1, [r10]
        add     r2, r11, r5, lsl #3
        str     r2, [sp, #0x18]
        bl      __addsf3
        ldr     r1, [sp, #0x14]
        mov     r6, r0
        mov     r0, r9
        bl      __mulsf3
        ldr     r1, [sp, #0x10]
        mov     r9, r0
        mov     r0, r7
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        ldr     r1, [r10, #4]
        bl      __addsf3
        cmp     r5, #0
        mov     r7, r0
        ble     LBRF5
        ldr     r2, [sp, #0x18]
        str     r5, [sp, #4]
        str     r4, [sp, #0xC]
        ldr     r4, [sp, #0x10]
        ldr     r5, [sp, #0x14]
        add     r0, r10, #4
        str     r7, [sp]
        add     r9, r2, #4
        add     r11, r11, #4
        sub     r10, r10, #4
        str     r8, [sp, #8]
        mov     r7, r0
LBRF3:
        ldr     r0, [r11, #4]
        mov     r1, r5
        bl      __mulsf3
        mov     r8, r0
        ldr     r0, [r11, #8]
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r8
        bl      __subsf3
        mov     r8, r0
        ldr     r0, [r9, #4]
        mov     r1, r6
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r8
        bl      __subsf3
        ldr     r1, [sp]
        mov     r8, r0
        ldr     r0, [r9, #8]
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r7, #4]
        bl      __addsf3
        str     r0, [r10, #4]
        ldr     r0, [r11, #4]
        mov     r1, r4
        bl      __mulsf3
        mov     r8, r0
        ldr     r0, [r11, #8]!
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [sp]
        ldr     r2, [r9, #4]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r8
        bl      __subsf3
        ldr     r2, [r9, #8]!
        mov     r8, r0
        mov     r1, r6
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r8
        bl      __subsf3
        ldr     r1, [r7, #8]!
        bl      __addsf3
        str     r0, [r10, #8]!
        ldr     r2, [sp, #4]
        subs    r2, r2, #1
        str     r2, [sp, #4]
        bne     LBRF3
        ldr     r7, [sp]
        ldr     r8, [sp, #8]
        ldr     r4, [sp, #0xC]
        b       LBRF5
LBRF4:
        bl      __floatsisf
        mov     r5, r0
        mov     r1, r7
        bl      __mulsf3
        ldrsh   r1, [sp, #0x26]
        ldr     r11, [r11, #4]
        mov     r6, r0
        mov     r0, r1
        bl      __floatsisf
        mov     r9, r0
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r6
        bl      __subsf3
        mov     r6, r0
        mov     r1, r5
        mov     r0, r11
        bl      __mulsf3
        mov     r5, r0
        mov     r0, r7
        mov     r1, r9
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        mov     r7, r0
LBRF5:
        mov     r0, r6
        mov     r1, r8
        bl      __mulsf3
        ldr     r3, [pc, #0xA80]
        mov     r9, r0
        mov     r2, #0xFF
        ldr     r5, [r3]
        orr     r6, r2, #0x7F, 24
        mov     r1, r5
        bl      __gtsf2
        cmp     r0, #0
        movgt   r0, r6
        bgt     LBRF8
        ldr     r2, [pc, #0xA5C]
        mov     r0, r9
        ldr     r1, [r2]
        bl      __ltsf2
        cmp     r0, #0
        mvnlt   r0, r6
        blt     LBRF8
        ldr     r2, [pc, #0xA44]
        mov     r0, r9
        ldr     r10, [r2]
        mov     r1, r10
        bl      __gtsf2
        cmp     r0, #0
        ble     LBRF6
        ldr     r2, [pc, #0xA2C]
        mov     r1, r9
        ldr     r0, [r2]
        bl      __addsf3
        mov     r9, r0
LBRF6:
        mov     r0, r9
        mov     r1, r10
        bl      __ltsf2
        cmp     r0, #0
        bge     LBRF7
        ldr     r2, [pc, #0xA04]
        mov     r0, r9
        ldr     r1, [r2]
        bl      __subsf3
        mov     r9, r0
LBRF7:
        mov     r0, r9
        bl      __fixsfsi
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
LBRF8:
        strh    r0, [r4]
        mov     r0, r7
        mov     r1, r8
        bl      __mulsf3
        mov     r7, r0
        mov     r1, r5
        bl      __gtsf2
        cmp     r0, #0
        bgt     LBRF11
        ldr     r2, [pc, #0x9B4]
        mov     r0, r7
        ldr     r1, [r2]
        bl      __ltsf2
        cmp     r0, #0
        mvnlt   r6, r6
        blt     LBRF11
        ldr     r2, [pc, #0x99C]
        mov     r0, r7
        ldr     r5, [r2]
        mov     r1, r5
        bl      __gtsf2
        cmp     r0, #0
        ble     LBRF9
        ldr     r2, [pc, #0x984]
        mov     r1, r7
        ldr     r0, [r2]
        bl      __addsf3
        mov     r7, r0
LBRF9:
        mov     r0, r7
        mov     r1, r5
        bl      __ltsf2
        cmp     r0, #0
        bge     LBRF10
        ldr     r2, [pc, #0x95C]
        mov     r0, r7
        ldr     r1, [r2]
        bl      __subsf3
        mov     r7, r0
LBRF10:
        mov     r0, r7
        bl      __fixsfsi
        mov     r0, r0, lsl #16
        mov     r6, r0, asr #16
LBRF11:
        mov     r0, #0
        strh    r6, [r4, #2]
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LBRF12:
        ldr     r0, [pc, #0x918]
        ldr     r11, [r2, #4]
        cmp     r3, #0
        ldr     r0, [r0]
        str     r0, [sp, #0x1C]
        andge   r3, r3, #0x7F
        subge   r8, r0, r3, lsl #23
        blt     LBRF27
LBRF13:
        str     r8, [sp, #0x1C]
        ldr     r6, [r11]
        ldrsh   r0, [sp, #0x24]
        cmp     r5, #0
        beq     LBRF15
        ldr     r10, [r2, #8]
        bl      __floatsisf
        str     r0, [sp, #0x10]
        mov     r1, r6
        bl      __mulsf3
        ldrsh   r1, [sp, #0x26]
        ldr     r9, [r11, #4]
        mov     r7, r0
        mov     r0, r1
        bl      __floatsisf
        str     r0, [sp]
        mov     r1, r9
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r7
        bl      __subsf3
        ldr     r1, [r10]
        add     r2, r11, r5, lsl #3
        str     r2, [sp, #8]
        bl      __addsf3
        ldr     r1, [sp, #0x10]
        mov     r7, r0
        mov     r0, r9
        bl      __mulsf3
        ldr     r1, [sp]
        mov     r9, r0
        mov     r0, r6
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        ldr     r1, [r10, #4]
        bl      __addsf3
        cmp     r5, #0
        mov     r6, r0
        ble     LBRF16
        ldr     r2, [sp, #8]
        str     r4, [sp, #0xC]
        ldr     r4, [sp, #0x10]
        add     r0, r10, #4
        str     r5, [sp, #4]
        add     r9, r2, #4
        add     r11, r11, #4
        sub     r10, r10, #4
        str     r8, [sp, #0x18]
        mov     r5, r0
LBRF14:
        ldr     r0, [r11, #4]
        mov     r1, r4
        bl      __mulsf3
        mov     r8, r0
        ldr     r1, [sp]
        ldr     r0, [r11, #8]
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r8
        bl      __subsf3
        mov     r8, r0
        ldr     r0, [r9, #4]
        mov     r1, r7
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r8
        bl      __subsf3
        mov     r8, r0
        ldr     r0, [r9, #8]
        mov     r1, r6
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r5, #4]
        bl      __addsf3
        str     r0, [r10, #4]
        ldr     r0, [r11, #4]
        ldr     r1, [sp]
        bl      __mulsf3
        mov     r1, r4
        mov     r8, r0
        ldr     r0, [r11, #8]!
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [r9, #4]
        mov     r8, r0
        mov     r1, r6
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r8
        bl      __subsf3
        ldr     r2, [r9, #8]!
        mov     r8, r0
        mov     r1, r7
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r8
        bl      __subsf3
        ldr     r1, [r5, #8]!
        bl      __addsf3
        str     r0, [r10, #8]!
        ldr     r2, [sp, #4]
        subs    r2, r2, #1
        str     r2, [sp, #4]
        bne     LBRF14
        ldr     r8, [sp, #0x18]
        ldr     r4, [sp, #0xC]
        b       LBRF16
LBRF15:
        bl      __floatsisf
        mov     r5, r0
        mov     r1, r6
        bl      __mulsf3
        ldrsh   r1, [sp, #0x26]
        ldr     r11, [r11, #4]
        mov     r7, r0
        mov     r0, r1
        bl      __floatsisf
        mov     r9, r0
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r7
        bl      __subsf3
        mov     r7, r0
        mov     r1, r5
        mov     r0, r11
        bl      __mulsf3
        mov     r5, r0
        mov     r0, r6
        mov     r1, r9
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        mov     r6, r0
LBRF16:
        mov     r0, r7
        mov     r1, r8
        bl      __mulsf3
        ldr     r3, [pc, #0x6CC]
        mov     r9, r0
        mov     r2, #0xFF
        ldr     r5, [r3]
        orr     r7, r2, #0x7F, 24
        mov     r1, r5
        bl      __gtsf2
        cmp     r0, #0
        movgt   r0, r7
        bgt     LBRF19
        ldr     r2, [pc, #0x6A8]
        mov     r0, r9
        ldr     r1, [r2]
        bl      __ltsf2
        cmp     r0, #0
        mvnlt   r0, r7
        blt     LBRF19
        ldr     r2, [pc, #0x690]
        mov     r0, r9
        ldr     r10, [r2]
        mov     r1, r10
        bl      __gtsf2
        cmp     r0, #0
        ble     LBRF17
        ldr     r2, [pc, #0x678]
        mov     r1, r9
        ldr     r0, [r2]
        bl      __addsf3
        mov     r9, r0
LBRF17:
        mov     r0, r9
        mov     r1, r10
        bl      __ltsf2
        cmp     r0, #0
        bge     LBRF18
        ldr     r2, [pc, #0x650]
        mov     r0, r9
        ldr     r1, [r2]
        bl      __subsf3
        mov     r9, r0
LBRF18:
        mov     r0, r9
        bl      __fixsfsi
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
LBRF19:
        strh    r0, [r4]
        mov     r0, r6
        mov     r1, r8
        bl      __mulsf3
        mov     r6, r0
        mov     r1, r5
        bl      __gtsf2
        cmp     r0, #0
        bgt     LBRF22
        ldr     r2, [pc, #0x600]
        mov     r0, r6
        ldr     r1, [r2]
        bl      __ltsf2
        cmp     r0, #0
        mvnlt   r7, r7
        blt     LBRF22
        ldr     r2, [pc, #0x5E8]
        mov     r0, r6
        ldr     r5, [r2]
        mov     r1, r5
        bl      __gtsf2
        cmp     r0, #0
        ble     LBRF20
        ldr     r2, [pc, #0x5D0]
        mov     r1, r6
        ldr     r0, [r2]
        bl      __addsf3
        mov     r6, r0
LBRF20:
        mov     r0, r6
        mov     r1, r5
        bl      __ltsf2
        cmp     r0, #0
        bge     LBRF21
        ldr     r2, [pc, #0x5A8]
        mov     r0, r6
        ldr     r1, [r2]
        bl      __subsf3
        mov     r6, r0
LBRF21:
        mov     r0, r6
        bl      __fixsfsi
        mov     r0, r0, lsl #16
        mov     r7, r0, asr #16
LBRF22:
        mov     r0, #0
        strh    r7, [r4, #2]
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LBRF23:
        ldr     r12, [r2, #0x2C]
        cmp     r12, #6
        bge     LBRF25
        cmp     r0, #0
        blt     LBRF24
        cmp     r0, #0x1F
        bgt     LBRF24
        ldrh    r0, [sp, #0x24]
        ldrh    r12, [sp, #0x26]
        mov     r1, r4
        orr     r0, r0, r12, lsl #16
        bl      LBRF_ownsIIRBQOne32fc_16sc_Sfs
        mov     r0, #0
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LBRF24:
        ldrh    r0, [sp, #0x24]
        ldrh    r12, [sp, #0x26]
        mov     r1, r4
        orr     r0, r0, r12, lsl #16
        bl      LBRF_refsIIRBQOne32fc_16sc_Sfs
        mov     r0, #0
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LBRF25:
        ldrh    r0, [sp, #0x24]
        ldrh    r12, [sp, #0x26]
        mov     r1, r4
        orr     r0, r0, r12, lsl #16
        bl      LBRF_refsIIRBQOne32fc_16sc_Sfs
        mov     r0, #0
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LBRF26:
        rsb     r3, r3, #0
        and     r3, r3, #0x7F
        add     r8, r0, r3, lsl #23
        b       LBRF2
LBRF27:
        rsb     r3, r3, #0
        and     r3, r3, #0x7F
        add     r8, r0, r3, lsl #23
        b       LBRF13
LBRF28:
        mvn     r0, #7
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LBRF_ownsIIRBQOne32fc_16sc_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x54
        ldr     r10, [r2, #0x2C]
        ldr     lr, [r2, #0x34]
        ldr     r12, [r2, #0xC]
        ldr     r4, [r2, #0x10]
        str     r0, [sp, #0x50]
        cmp     r10, #0
        mov     r2, r0, lsl #16
        mov     r0, r0, asr #16
        str     r0, [sp, #8]
        mov     r9, r1
        mov     r7, r2, asr #16
        add     r6, r3, lr
        ble     LBRF38
        mov     r3, #1
        sub     r0, lr, #1
        mov     r3, r3, lsl r0
        mvn     r0, #0xFF
        add     r2, r12, #0xE
        mov     r11, lr, asr #31
        sub     r8, r4, #0x14
        sub     r1, r12, #0xA
        str     r2, [sp]
        str     r8, [sp, #4]
        bic     r0, r0, #0x7F, 24
        str     r1, [sp, #0x38]
        str     r11, [sp, #0x3C]
        str     r10, [sp, #0x20]
        ldr     r1, [sp, #8]
        ldr     r10, [sp, #4]
        ldr     r11, [sp]
        sub     r5, r3, #1
        mvn     r0, r0
        mvn     r3, #0
        sub     r2, r12, #0xE
        sub     r4, r4, #4
        add     r8, r12, #0x12
        str     r12, [sp, #0x24]
        str     r2, [sp, #0x34]
        str     r3, [sp, #0x14]
        str     r0, [sp, #0x1C]
        str     r6, [sp, #0x10]
        str     lr, [sp, #0x40]
        str     r9, [sp, #0xC]
LBRF29:
        ldr     r0, [sp, #0x24]
        ldr     lr, [r10, #0x1C]
        mov     r1, r1, lsl #16
        ldrsh   r3, [r0, #2]
        ldrsh   r0, [r0]
        mov     r9, r7
        mov     r6, r1, asr #16
        mul     r12, r9, r3
        mul     r2, r9, r0
        mul     r1, r3, r6
        ldr     r3, [r10, #0x14]
        mla     r12, r0, r6, r12
        ldr     r0, [r10, #0x18]
        sub     r2, r2, r1
        ldr     r1, [r10, #0x20]
        adds    r7, r2, r3
        ldr     r3, [sp, #0x3C]
        str     r7, [sp, #0x28]
        str     r1, [sp, #0x30]
        adc     r1, r0, r2, asr #31
        ldr     r2, [sp, #0x40]
        adds    lr, r12, lr
        str     lr, [sp, #0x2C]
        ldr     lr, [sp, #0x30]
        str     r1, [sp, #0x18]
        mov     r0, r7
        adc     r12, lr, r12, asr #31
        str     r12, [sp, #0x30]
        bl      __ashrdi3
        ldr     r1, [sp, #0x18]
        adds    r7, r7, r5
        ldr     r2, [sp, #0x40]
        ldr     r3, [sp, #0x3C]
        adc     r1, r1, r5, asr #31
        and     r0, r0, #1
        adds    r0, r7, r0
        adc     r1, r1, #0
        bl      __ashrdi3
        ldr     r2, [sp, #0x1C]
        subs    r2, r0, r2
        sbcs    r3, r1, #0
        movlt   r2, #0
        movlt   r3, #0
        orrs    r2, r2, r3
        ldr     r3, [sp, #0x24]
        add     r3, r3, #0x14
        str     r3, [sp, #0x24]
        bne     LBRF30
        mov     r2, #0
        sub     r2, r2, #2, 18
        cmp     r0, r2
        ldr     r2, [sp, #0x14]
        sbcs    r1, r1, r2
        movge   r0, r0, lsl #16
        movge   r7, r0, asr #16
        movlt   r0, #0
        sublt   r7, r0, #2, 18
        b       LBRF31
LBRF30:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r7, r0
LBRF31:
        ldr     r0, [sp, #0x2C]
        ldr     r1, [sp, #0x30]
        ldr     r2, [sp, #0x40]
        ldr     r3, [sp, #0x3C]
        bl      __ashrdi3
        ldr     r1, [sp, #0x2C]
        ldr     r2, [sp, #0x30]
        ldr     r3, [sp, #0x3C]
        adds    r1, r1, r5
        and     r0, r0, #1
        adc     r2, r2, r5, asr #31
        adds    r0, r1, r0
        adc     r1, r2, #0
        ldr     r2, [sp, #0x40]
        bl      __ashrdi3
        ldr     r2, [sp, #0x1C]
        subs    r2, r0, r2
        sbcs    r3, r1, #0
        movlt   r2, #0
        movlt   r3, #0
        orrs    r3, r2, r3
        bne     LBRF32
        mov     r2, #0
        sub     r2, r2, #2, 18
        cmp     r0, r2
        ldr     r2, [sp, #0x14]
        sbcs    r1, r1, r2
        movge   r0, r0, lsl #16
        movge   r1, r0, asr #16
        movlt   r0, #0
        sublt   r1, r0, #2, 18
        b       LBRF33
LBRF32:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r1, r0
LBRF33:
        ldr     r3, [sp, #0x34]
        ldrsh   r0, [r11]
        ldrsh   lr, [r11, #-2]
        ldrsh   r12, [r3, #0x14]
        ldrsh   r2, [r3, #0x12]
        str     lr, [sp, #0x44]
        ldr     lr, [r4, #0x14]
        mul     r12, r6, r12
        mul     r2, r9, r2
        rsb     r0, r0, #0
        mul     r0, r0, r1
        str     lr, [sp, #0x48]
        str     r2, [sp, #0x4C]
        ldr     lr, [sp, #0x4C]
        ldr     r2, [r4, #0x18]
        sub     r12, lr, r12
        ldr     lr, [sp, #0x44]
        mla     r0, lr, r7, r0
        sub     r12, r12, r0
        ldr     r0, [sp, #0x48]
        adds    r0, r0, r12
        adc     r12, r2, r12, asr #31
        str     r12, [r10, #0x18]
        str     r0, [r10, #0x14]
        ldrsh   r0, [r3, #0x14]
        ldrsh   r12, [r11, #-2]
        ldrsh   lr, [r11], #0x14
        mul     r0, r9, r0
        ldrsh   r2, [r3, #0x12]
        mul     r12, r12, r1
        str     lr, [sp, #0x4C]
        mla     r0, r6, r2, r0
        ldr     r2, [sp, #0x4C]
        add     r3, r3, #0x14
        str     r12, [sp, #0x48]
        ldr     r12, [r4, #0x1C]
        ldr     lr, [sp, #0x48]
        mla     r2, r2, r7, lr
        str     r12, [sp, #0x44]
        ldr     r12, [r4, #0x20]
        str     r3, [sp, #0x34]
        sub     r0, r0, r2
        ldr     r2, [sp, #0x44]
        adds    r2, r2, r0
        adc     r0, r12, r0, asr #31
        str     r2, [r10, #0x1C]
        str     r0, [r10, #0x20]!
        ldr     r12, [sp, #0x38]
        ldrsh   r3, [r8]
        ldrsh   lr, [r8, #-2]
        ldrsh   r2, [r12, #0x12]
        ldrsh   r0, [r12, #0x14]
        rsb     r3, r3, #0
        mul     r3, r3, r1
        mul     r2, r9, r2
        mla     r3, lr, r7, r3
        str     r2, [sp, #0x4C]
        mul     r2, r6, r0
        ldr     lr, [sp, #0x4C]
        ldr     r0, [sp, #0x20]
        sub     lr, lr, r2
        sub     lr, lr, r3
        mov     r2, lr, asr #31
        subs    r0, r0, #1
        str     r0, [sp, #0x20]
        str     lr, [r4, #0x14]
        str     r2, [r4, #0x18]
        ldrsh   lr, [r12, #0x14]
        ldrsh   r2, [r8, #-2]
        ldrsh   r3, [r12, #0x12]
        mul     r9, r9, lr
        ldrsh   lr, [r8], #0x14
        mul     r2, r2, r1
        add     r12, r12, #0x14
        mla     r9, r6, r3, r9
        str     r12, [sp, #0x38]
        mla     r2, lr, r7, r2
        sub     r9, r9, r2
        str     r9, [r4, #0x1C]
        mov     r2, r9, asr #31
        str     r2, [r4, #0x20]!
        bne     LBRF29
        ldr     r5, [sp, #0x30]
        ldr     r11, [sp, #0x2C]
        ldr     r1, [sp, #0x18]
        ldr     r0, [sp, #0x28]
        ldr     r6, [sp, #0x10]
        ldr     r9, [sp, #0xC]
LBRF34:
        sub     r3, r6, #1
        mov     r12, #1
        mov     r3, r12, lsl r3
        sub     r7, r3, #1
        adds    r10, r0, r7
        mov     r4, r6, asr #31
        mov     r2, r6
        mov     r3, r4
        adc     r8, r1, r7, asr #31
        bl      __ashrdi3
        and     r0, r0, #1
        adds    r0, r10, r0
        adc     r1, r8, #0
        mov     r2, r6
        mov     r3, r4
        bl      __ashrdi3
        mvn     r12, #0xFF
        bic     r8, r12, #0x7F, 24
        mvn     r12, r8
        subs    r12, r0, r12
        sbcs    lr, r1, #0
        movlt   r12, #0
        movlt   lr, #0
        orrs    r12, r12, lr
        mvn     r10, #0
        mvnne   r0, r8
        bne     LBRF35
        mov     r12, #0
        sub     r12, r12, #2, 18
        cmp     r0, r12
        sbcs    r1, r1, r10
        movge   r0, r0, lsl #16
        movge   r0, r0, asr #16
        movlt   r12, #0
        sublt   r0, r12, #2, 18
LBRF35:
        strh    r0, [r9]
        mov     r0, r11
        mov     r1, r5
        mov     r2, r6
        mov     r3, r4
        bl      __ashrdi3
        adds    r11, r7, r11
        and     r0, r0, #1
        adc     r7, r5, r7, asr #31
        adds    r0, r11, r0
        adc     r1, r7, #0
        mov     r2, r6
        mov     r3, r4
        bl      __ashrdi3
        mvn     r2, r8
        subs    r2, r0, r2
        sbcs    r3, r1, #0
        movlt   r2, #0
        movlt   r3, #0
        orrs    r3, r2, r3
        bne     LBRF36
        mov     r2, #0
        sub     r2, r2, #2, 18
        cmp     r0, r2
        sbcs    r1, r1, r10
        movge   r0, r0, lsl #16
        movge   r8, r0, asr #16
        b       LBRF37
LBRF36:
        mov     r0, #0
        sub     r0, r0, #2, 18
        mvn     r8, r0
LBRF37:
        mov     r0, #0
        strh    r8, [r9, #2]
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}
LBRF38:
        mov     r1, #0
        mov     r11, r1
        mov     r5, r11
        mov     r0, r5
        b       LBRF34
        .long   0x49493038
        .long   LBRF__2il0floatpacket.1
        .long   LBRF__2il0floatpacket.2
        .long   LBRF__2il0floatpacket.3
        .long   LBRF__2il0floatpacket.4
        .long   LBRF__2il0floatpacket.5
        .long   LBRF__2il0floatpacket.6
        .long   LBRF__2il0floatpacket.7
        .long   LBRF__2il0floatpacket.8
        .long   LBRF__2il0floatpacket.9
        .long   LBRF__2il0floatpacket.10
LBRF_refsIIRBQOne32fc_16sc_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x28
        ldr     r12, [pc, #-0x24]
        ldr     r9, [r2, #0x2C]
        ldr     r12, [r12]
        ldr     r11, [r2, #4]
        ldr     r10, [r2, #8]
        cmp     r3, #0
        str     r0, [sp, #0x24]
        str     r12, [sp, #0x20]
        mov     r8, r1
        andge   r3, r3, #0x7F
        subge   r7, r12, r3, lsl #23
        blt     LBRF48
LBRF39:
        ldrsh   r0, [sp, #0x24]
        str     r7, [sp, #0x20]
        bl      __floatsisf
        ldrsh   r1, [sp, #0x26]
        mov     r6, r0
        mov     r0, r1
        bl      __floatsisf
        ldr     r2, [pc, #-0x6C]
        cmp     r9, #0
        ldr     r5, [r2]
        ble     LBRF41
        sub     r2, r10, #0xC
        sub     r12, r10, #4
        add     r3, r11, #4
        sub     r1, r11, #0x14
        sub     r10, r11, #4
        sub     r4, r11, #0xC
        str     r5, [sp, #8]
        str     r9, [sp, #0x10]
        sub     r11, r11, #0x1C
        str     r12, [sp, #0x18]
        str     r2, [sp, #0x14]
        str     r3, [sp, #0xC]
        str     r7, [sp, #4]
        str     r8, [sp]
        mov     r5, r0
        mov     r9, r1
LBRF40:
        ldr     r2, [sp, #0xC]
        mov     r1, r6
        ldr     r3, [r2, #-4]
        ldr     r8, [r2], #0x28
        str     r2, [sp, #0xC]
        str     r3, [sp, #0x1C]
        ldr     r0, [sp, #0x1C]
        bl      __mulsf3
        mov     r7, r0
        mov     r1, r5
        mov     r0, r8
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r7
        bl      __subsf3
        ldr     r2, [sp, #0x14]
        ldr     r1, [r2, #0xC]
        bl      __addsf3
        mov     r7, r0
        ldr     r0, [sp, #0x1C]
        mov     r1, r5
        bl      __mulsf3
        str     r0, [sp, #0x1C]
        mov     r0, r8
        mov     r1, r6
        bl      __mulsf3
        ldr     r1, [sp, #0x1C]
        bl      __addsf3
        ldr     r2, [sp, #0x14]
        ldr     r1, [r2, #0x10]
        bl      __addsf3
        ldr     r2, [r11, #0x24]
        mov     r8, r0
        mov     r1, r6
        mov     r0, r2
        bl      __mulsf3
        ldr     r2, [r11, #0x28]
        str     r0, [sp, #0x1C]
        mov     r0, r2
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x1C]
        bl      __subsf3
        ldr     r2, [sp, #0x18]
        ldr     r1, [r2, #0xC]
        bl      __addsf3
        ldr     r2, [r4, #0x28]
        str     r0, [sp, #0x1C]
        mov     r0, r2
        mov     r1, r8
        bl      __mulsf3
        ldr     r1, [sp, #0x1C]
        bl      __addsf3
        ldr     r2, [r4, #0x24]
        str     r0, [sp, #0x1C]
        mov     r0, r2
        mov     r1, r7
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x1C]
        bl      __subsf3
        ldr     r2, [sp, #0x14]
        mov     r1, r5
        str     r0, [r2, #0xC]
        ldr     r0, [r11, #0x24]
        bl      __mulsf3
        ldr     r2, [r11, #0x28]!
        str     r0, [sp, #0x1C]
        mov     r0, r2
        mov     r1, r6
        bl      __mulsf3
        ldr     r1, [sp, #0x1C]
        bl      __addsf3
        ldr     r2, [sp, #0x18]
        ldr     r1, [r2, #0x10]
        bl      __addsf3
        ldr     r2, [r4, #0x24]
        str     r0, [sp, #0x1C]
        mov     r1, r8
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x1C]
        bl      __subsf3
        ldr     r2, [r4, #0x28]!
        str     r0, [sp, #0x1C]
        mov     r1, r7
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x1C]
        bl      __subsf3
        ldr     r2, [sp, #0x14]
        mov     r1, r6
        str     r0, [r2, #0x10]!
        str     r2, [sp, #0x14]
        ldr     r0, [r9, #0x24]
        bl      __mulsf3
        str     r0, [sp, #0x1C]
        ldr     r0, [r9, #0x28]
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x1C]
        bl      __subsf3
        str     r0, [sp, #0x1C]
        ldr     r0, [r10, #0x28]
        mov     r1, r8
        bl      __mulsf3
        ldr     r1, [sp, #0x1C]
        bl      __addsf3
        str     r0, [sp, #0x1C]
        ldr     r0, [r10, #0x24]
        mov     r1, r7
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x1C]
        bl      __subsf3
        ldr     r2, [sp, #0x18]
        mov     r1, r5
        str     r0, [r2, #0xC]
        ldr     r0, [r9, #0x24]
        bl      __mulsf3
        ldr     r2, [r9, #0x28]!
        mov     r5, r0
        mov     r1, r6
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r2, [r10, #0x24]
        mov     r5, r0
        mov     r1, r8
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r5
        bl      __subsf3
        ldr     r2, [r10, #0x28]!
        mov     r5, r0
        mov     r1, r7
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r5
        bl      __subsf3
        ldr     r2, [sp, #0x18]
        str     r0, [r2, #0x10]!
        str     r2, [sp, #0x18]
        ldr     r2, [sp, #0x10]
        mov     r6, r7
        subs    r2, r2, #1
        str     r2, [sp, #0x10]
        mov     r5, r8
        bne     LBRF40
        mov     r1, r7
        mov     r4, r8
        ldr     r5, [sp, #8]
        ldr     r7, [sp, #4]
        ldr     r8, [sp]
LBRF41:
        mov     r0, r1
        mov     r1, r7
        bl      __mulsf3
        ldr     r3, [pc, #-0x348]
        mov     r10, r0
        mov     r2, #0xFF
        ldr     r6, [r3]
        orr     r9, r2, #0x7F, 24
        mov     r1, r6
        bl      __gtsf2
        cmp     r0, #0
        movgt   r2, r9
        bgt     LBRF44
        ldr     r2, [pc, #-0x36C]
        mov     r0, r10
        ldr     r1, [r2]
        bl      __ltsf2
        cmp     r0, #0
        mvnlt   r2, r9
        blt     LBRF44
        mov     r0, r10
        mov     r1, r5
        bl      __gtsf2
        cmp     r0, #0
        ble     LBRF42
        ldr     r2, [pc, #-0x398]
        mov     r1, r10
        ldr     r0, [r2]
        bl      __addsf3
        mov     r10, r0
LBRF42:
        mov     r0, r10
        mov     r1, r5
        bl      __ltsf2
        cmp     r0, #0
        bge     LBRF43
        ldr     r2, [pc, #-0x3C0]
        mov     r0, r10
        ldr     r1, [r2]
        bl      __subsf3
        mov     r10, r0
LBRF43:
        mov     r0, r10
        bl      __fixsfsi
        mov     r0, r0, lsl #16
        mov     r2, r0, asr #16
LBRF44:
        strh    r2, [r8]
        mov     r0, r4
        mov     r1, r7
        bl      __mulsf3
        mov     r4, r0
        mov     r1, r6
        bl      __gtsf2
        cmp     r0, #0
        bgt     LBRF47
        ldr     r2, [pc, #-0x40C]
        mov     r0, r4
        ldr     r1, [r2]
        bl      __ltsf2
        cmp     r0, #0
        mvnlt   r9, r9
        blt     LBRF47
        mov     r0, r4
        mov     r1, r5
        bl      __gtsf2
        cmp     r0, #0
        ble     LBRF45
        ldr     r2, [pc, #-0x438]
        mov     r1, r4
        ldr     r0, [r2]
        bl      __addsf3
        mov     r4, r0
LBRF45:
        mov     r0, r4
        mov     r1, r5
        bl      __ltsf2
        cmp     r0, #0
        bge     LBRF46
        ldr     r2, [pc, #-0x460]
        mov     r0, r4
        ldr     r1, [r2]
        bl      __subsf3
        mov     r4, r0
LBRF46:
        mov     r0, r4
        bl      __fixsfsi
        mov     r0, r0, lsl #16
        mov     r9, r0, asr #16
LBRF47:
        mov     r0, #0
        strh    r9, [r8, #2]
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LBRF48:
        rsb     r3, r3, #0
        and     r0, r3, #0x7F
        add     r7, r12, r0, lsl #23
        b       LBRF39
LBRF_ownsIIRAROne32fc_16sc_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x4C
        str     r0, [sp, #0x48]
        ldr     r9, [r2, #0xC]
        ldr     r6, [r2, #0x2C]
        mov     r8, r1
        mov     r10, r0, asr #16
        str     r6, [sp, #0x3C]
        ldrsh   r5, [r9, #2]
        mov     r0, r0, lsl #16
        ldr     r11, [r2, #0x34]
        ldrsh   lr, [r9]
        mov     r0, r0, asr #16
        mul     r12, r0, r5
        str     r0, [sp, #0x40]
        rsb     r0, r10, #0
        mul     r5, r5, r0
        cmp     r6, #0
        add     r4, r3, r11
        str     r0, [sp, #0x28]
        bne     LBRF49
        ldr     r0, [sp, #0x40]
        mla     r12, lr, r10, r12
        mla     r7, r0, lr, r5
        str     r12, [sp, #0x38]
        mov     r5, r7, asr #31
        mov     r6, r12, asr #31
        b       LBRF56
LBRF49:
        ldr     r2, [r2, #0x10]
        mla     r12, lr, r10, r12
        ldr     r0, [sp, #0x40]
        str     r2, [sp, #0x34]
        sub     r6, r11, #1
        mla     r3, r0, lr, r5
        ldr     r0, [r2]
        ldr     lr, [r2, #4]
        adds    r7, r3, r0
        mov     r0, r7
        adc     r5, lr, r3, asr #31
        ldr     lr, [r2, #8]
        ldr     r2, [r2, #0xC]
        mov     r3, r11, asr #31
        str     r3, [sp, #4]
        adds    lr, r12, lr
        str     lr, [sp, #0x38]
        mov     lr, #1
        mov     r6, lr, lsl r6
        sub     lr, r6, #1
        str     r2, [sp, #0x30]
        str     lr, [sp]
        ldr     lr, [sp, #0x30]
        mov     r1, r5
        mov     r2, r11
        adc     r6, lr, r12, asr #31
        bl      __ashrdi3
        ldr     r3, [sp]
        ldr     r12, [sp]
        and     r0, r0, #1
        adds    r3, r7, r3
        adc     r12, r5, r12, asr #31
        adds    r0, r3, r0
        ldr     r3, [sp, #4]
        adc     r1, r12, #0
        mov     r2, r11
        bl      __ashrdi3
        ldr     r12, [sp, #0x3C]
        mvn     r3, #0
        add     r3, r3, #2, 18
        subs    r3, r0, r3
        sbcs    lr, r1, #0
        mov     r12, r12, lsl #2
        movlt   r3, #0
        str     r12, [sp, #0x1C]
        movlt   lr, #0
        add     r12, r9, r12
        orrs    lr, r3, lr
        str     r12, [sp, #0x2C]
        add     r3, r9, #4
        add     r12, r12, #4
        str     r3, [sp, #0x20]
        str     r12, [sp, #0x24]
        bne     LBRF51
        mvn     r3, #0
        cmp     r0, r3, lsl #15
        sbcs    r1, r1, r3
        bge     LBRF50
        mvn     r3, #0
        mov     r3, r3, lsl #15
        str     r3, [sp, #0x30]
        b       LBRF52
LBRF50:
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        str     r0, [sp, #0x30]
        b       LBRF52
LBRF51:
        mvn     r3, #0
        add     r3, r3, #2, 18
        str     r3, [sp, #0x30]
LBRF52:
        ldr     r0, [sp, #0x38]
        ldr     r3, [sp, #4]
        mov     r1, r6
        mov     r2, r11
        bl      __ashrdi3
        ldr     r3, [sp, #0x38]
        ldr     r12, [sp]
        and     r0, r0, #1
        adds    r3, r3, r12
        adc     r12, r6, r12, asr #31
        adds    r0, r3, r0
        ldr     r3, [sp, #4]
        adc     r1, r12, #0
        mov     r2, r11
        bl      __ashrdi3
        mvn     r3, #0
        add     r3, r3, #2, 18
        subs    r3, r0, r3
        sbcs    r12, r1, #0
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        mvnne   r3, #0
        addne   r0, r3, #2, 18
        bne     LBRF53
        mvn     r3, #0
        cmp     r0, r3, lsl #15
        sbcs    r1, r1, r3
        movge   r0, r0, lsl #16
        movge   r0, r0, asr #16
        mvnlt   r3, #0
        movlt   r0, r3, lsl #15
LBRF53:
        ldr     r3, [sp, #0x3C]
        sub     lr, r3, #1
        cmp     lr, #0
        ble     LBRF55
        ldr     r3, [sp, #0x34]
        rsb     r1, r0, #0
        add     r9, r9, #2
        add     r11, r3, #0xC
        sub     r12, r3, #4
        ldr     r3, [sp, #0x2C]
        str     r1, [sp]
        str     r0, [sp, #4]
        ldr     r0, [sp, #0x30]
        ldr     r1, [sp, #0x40]
        add     r3, r3, #2
        str     r6, [sp, #8]
        str     r5, [sp, #0xC]
        str     r7, [sp, #0x10]
        str     r4, [sp, #0x14]
        str     r8, [sp, #0x18]
LBRF54:
        ldrsh   r2, [r9, #4]
        ldrsh   r6, [r3, #4]
        ldr     r5, [sp, #0x28]
        ldr     r7, [sp]
        ldrsh   r4, [r9, #2]
        mul     r2, r5, r2
        ldrsh   r5, [r3, #2]
        mul     r6, r7, r6
        ldr     r7, [r11, #4]
        ldr     r8, [r11, #8]
        mla     r2, r1, r4, r2
        mla     r6, r0, r5, r6
        sub     r2, r2, r6
        adds    r7, r2, r7
        adc     r2, r8, r2, asr #31
        str     r7, [r12, #4]
        str     r2, [r12, #8]
        ldrsh   r4, [r9, #4]
        ldrsh   r2, [r3, #4]
        ldrsh   r8, [r9, #2]
        mul     r7, r1, r4
        ldrsh   r6, [r3, #2]
        mul     r2, r0, r2
        ldr     r5, [r11, #0xC]
        ldr     r4, [r11, #0x10]!
        mla     r7, r10, r8, r7
        ldr     r8, [sp, #4]
        add     r3, r3, #4
        add     r9, r9, #4
        mla     r2, r8, r6, r2
        sub     r7, r7, r2
        adds    r5, r7, r5
        adc     r7, r4, r7, asr #31
        str     r5, [r12, #0xC]
        str     r7, [r12, #0x10]!
        subs    lr, lr, #1
        bne     LBRF54
        ldr     r0, [sp, #4]
        ldr     r6, [sp, #8]
        ldr     r5, [sp, #0xC]
        ldr     r7, [sp, #0x10]
        ldr     r4, [sp, #0x14]
        ldr     r8, [sp, #0x18]
LBRF55:
        ldr     r3, [sp, #0x1C]
        ldr     r12, [sp, #0x20]
        ldr     r9, [sp, #0x24]
        sub     r3, r3, #4
        str     r3, [sp, #0x2C]
        ldrsh   r11, [r9, +r3]
        ldrsh   lr, [r12, +r3]
        add     r3, r3, r9
        str     r11, [sp, #0x1C]
        str     r3, [sp]
        ldrsh   r11, [r3, #2]
        ldr     r3, [sp, #0x2C]
        ldr     r2, [sp, #0x40]
        rsb     r11, r11, #0
        mul     r11, r11, r0
        add     r3, r3, r12
        str     r3, [sp, #0x44]
        ldrsh   r1, [r3, #2]
        ldr     r3, [sp, #0x3C]
        str     r11, [sp, #0x3C]
        ldr     r11, [sp, #0x28]
        mov     r3, r3, lsl #4
        mul     r1, r11, r1
        sub     r11, r3, #0x10
        ldr     r3, [sp, #0x34]
        mla     r1, r2, lr, r1
        ldr     lr, [sp, #0x30]
        ldr     r2, [sp, #0x3C]
        add     r3, r11, r3
        str     r1, [sp, #0x28]
        ldr     r1, [sp, #0x1C]
        mla     r1, r1, lr, r2
        ldr     r2, [sp, #0x28]
        sub     r1, r2, r1
        ldr     r2, [sp, #0x34]
        str     r1, [r2, +r11]
        mov     r1, r1, asr #31
        str     r1, [r3, #4]
        ldr     r1, [sp, #0x2C]
        ldr     r11, [sp, #0x44]
        ldrsh   r9, [r9, +r1]
        ldrsh   r12, [r12, +r1]
        ldr     r1, [sp, #0x40]
        ldrsh   r11, [r11, #2]
        mul     r0, r9, r0
        mul     r1, r1, r11
        ldr     r11, [sp]
        ldrsh   r11, [r11, #2]
        mla     r1, r10, r12, r1
        mla     r0, r11, lr, r0
        sub     r1, r1, r0
        str     r1, [r3, #8]
        mov     r12, r1, asr #31
        str     r12, [r3, #0xC]
LBRF56:
        sub     r12, r4, #1
        mov     r3, #1
        mov     r12, r3, lsl r12
        mov     r9, r4, asr #31
        mov     r0, r7
        mov     r1, r5
        mov     r2, r4
        mov     r3, r9
        sub     r10, r12, #1
        bl      __ashrdi3
        adds    r7, r7, r10
        and     r0, r0, #1
        adc     r5, r5, r10, asr #31
        adds    r0, r7, r0
        adc     r1, r5, #0
        mov     r2, r4
        mov     r3, r9
        bl      __ashrdi3
        mvn     r7, #0
        add     r12, r7, #2, 18
        subs    r12, r0, r12
        sbcs    lr, r1, #0
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        addne   r0, r7, #2, 18
        bne     LBRF57
        cmp     r0, r7, lsl #15
        sbcs    r1, r1, r7
        movge   r0, r0, lsl #16
        movge   r0, r0, asr #16
        movlt   r0, r7, lsl #15
LBRF57:
        strh    r0, [r8]
        ldr     r0, [sp, #0x38]
        mov     r1, r6
        mov     r2, r4
        mov     r3, r9
        adds    r5, r10, r0
        adc     r10, r6, r10, asr #31
        bl      __ashrdi3
        and     r0, r0, #1
        adds    r0, r5, r0
        adc     r1, r10, #0
        mov     r2, r4
        mov     r3, r9
        bl      __ashrdi3
        add     r2, r7, #2, 18
        subs    r2, r0, r2
        sbcs    r3, r1, #0
        movlt   r2, #0
        movlt   r3, #0
        orrs    r3, r2, r3
        addne   r7, r7, #2, 18
        bne     LBRF58
        cmp     r0, r7, lsl #15
        sbcs    r1, r1, r7
        movge   r0, r0, lsl #16
        movge   r7, r0, asr #16
        movlt   r7, r7, lsl #15
LBRF58:
        mov     r0, #0
        strh    r7, [r8, #2]
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}


        .data
        .align  4


LBRF__2il0floatpacket.1:
        .byte   0x00,0x00,0x80,0x3F
LBRF__2il0floatpacket.2:
        .byte   0x00,0xFE,0xFF,0x46
LBRF__2il0floatpacket.3:
        .byte   0x00,0x00,0x00,0xC7
LBRF__2il0floatpacket.4:
        .byte   0x00,0x00,0x00,0x00
LBRF__2il0floatpacket.5:
        .byte   0x00,0x00,0x00,0x3F
LBRF__2il0floatpacket.6:
        .byte   0x00,0x00,0x80,0x3F
LBRF__2il0floatpacket.7:
        .byte   0x00,0x00,0x00,0x00
LBRF__2il0floatpacket.8:
        .byte   0x00,0xFE,0xFF,0x46
LBRF__2il0floatpacket.9:
        .byte   0x00,0x00,0x00,0xC7
LBRF__2il0floatpacket.10:
        .byte   0x00,0x00,0x00,0x3F


