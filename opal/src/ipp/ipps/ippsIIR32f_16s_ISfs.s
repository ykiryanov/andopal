        .text
        .align  4
        .globl  _ippsIIR32f_16s_ISfs


_ippsIIR32f_16s_ISfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x58
        sub     sp, sp, #2, 22
        mov     r7, r2
        cmp     r7, #0
        mov     r4, r0
        mov     r5, r1
        mov     r8, r3
        beq     LBSA29
        cmp     r4, #0
        beq     LBSA29
        cmp     r5, #0
        ble     LBSA28
        ldr     lr, [r7]
        ldr     r6, [pc, #0xE2C]
        ldr     r12, [r7, #0x30]
        subs    lr, lr, r6
        add     r12, r8, r12
        beq     LBSA5
        adds    lr, lr, #1
        beq     LBSA0
        add     sp, sp, #0x58
        mvn     r0, #0x10
        add     sp, sp, #2, 22
        ldmia   sp!, {r4 - r11, pc}
LBSA0:
        ldr     lr, [r7, #0x28]
        cmp     lr, #7
        bge     LBSA4
        cmp     r12, #0
        blt     LBSA3
        cmp     r12, #0x1F
        bgt     LBSA3
        cmp     r5, #0
        mov     r9, r4
        movle   r0, #0
        ble     LBSA2
        mov     r10, #1, 22
LBSA1:
        cmp     r5, #1, 22
        mov     r6, r10
        add     r1, sp, #0x50
        movlt   r6, r5
        mov     r0, r4
        mov     r2, r6
        bl      _ippsCopy_16s
        add     r0, sp, #0x50
        str     r8, [sp]
        mov     r2, r6
        mov     r3, r7
        mov     r1, r9
        bl      LBSA_ownsIIRAR32f_16s_Sfs
        sub     r5, r5, #1, 22
        cmp     r5, #0
        add     r4, r4, #2, 22
        add     r9, r9, #2, 22
        bgt     LBSA1
LBSA2:
        add     sp, sp, #0x58
        add     sp, sp, #2, 22
        ldmia   sp!, {r4 - r11, pc}
LBSA3:
        str     r8, [sp]
        mov     r3, r7
        mov     r2, r5
        mov     r0, r4
        mov     r1, r4
        bl      LBSA_refsIIRAR32f_16s_Sfs
        add     sp, sp, #0x58
        mov     r0, #0
        add     sp, sp, #2, 22
        ldmia   sp!, {r4 - r11, pc}
LBSA4:
        str     r8, [sp]
        mov     r3, r7
        mov     r2, r5
        mov     r0, r4
        mov     r1, r4
        bl      LBSA_refsIIRAR32f_16s_Sfs
        add     sp, sp, #0x58
        mov     r0, #0
        add     sp, sp, #2, 22
        ldmia   sp!, {r4 - r11, pc}
LBSA5:
        ldr     r6, [r7, #0x28]
        cmp     r6, #6
        bge     LBSA16
        cmp     r12, #0
        blt     LBSA6
        cmp     r12, #0x1F
        bgt     LBSA6
        str     r8, [sp]
        mov     r3, r7
        mov     r2, r5
        mov     r0, r4
        mov     r1, r4
        bl      LBSA_ownsIIRBQ32f_16s_ISfs
        add     sp, sp, #0x58
        add     sp, sp, #2, 22
        ldmia   sp!, {r4 - r11, pc}
LBSA6:
        ldr     lr, [pc, #0xCF0]
        ldr     r12, [r7, #4]
        cmp     r8, #0
        ldr     r9, [lr]
        ldr     lr, [r7, #8]
        str     r9, [sp, #0x854]
        andge   r8, r8, #0x7F
        subge   r10, r9, r8, lsl #23
        blt     LBSA26
LBSA7:
        ldr     r7, [pc, #0xCD0]
        cmp     r5, #0
        str     r10, [sp, #0x854]
        ldr     r8, [r7]
        mov     r7, r8
        ble     LBSA15
        ldr     r11, [pc, #0xCBC]
        ldr     r9, [pc, #0xCBC]
        ldr     r3, [pc, #0xCBC]
        ldr     r11, [r11]
        add     r1, r12, #4
        add     r0, r12, #0xC
        add     r2, r12, #8
        str     r11, [sp, #8]
        ldr     r9, [r9]
        ldr     r3, [r3]
        add     r11, lr, #4
        str     r11, [sp, #0x38]
        ldr     r11, [sp, #8]
        str     r2, [sp, #0xC]
        add     r2, r12, #0x10
        str     r2, [sp, #0x3C]
        str     r0, [sp, #0x34]
        str     r1, [sp, #0x30]
        str     r3, [sp, #0x2C]
        str     r9, [sp, #0x28]
        str     r10, [sp, #0x20]
        str     lr, [sp, #0x1C]
        str     r12, [sp, #0x18]
LBSA8:
        ldrsh   r0, [r4]
        bl      __floatsisf
        cmp     r6, #0
        ble     LBSA10
        ldr     r12, [sp, #0x18]
        ldr     r7, [sp, #0x1C]
        ldr     r3, [sp, #0x30]
        ldr     r2, [sp, #0x34]
        ldr     r1, [sp, #0xC]
        ldr     r9, [sp, #0x3C]
        ldr     r10, [sp, #0x38]
        mov     lr, r6
        str     r4, [sp, #0x40]
        str     r8, [sp, #0x24]
        str     r6, [sp, #0x14]
        str     r5, [sp, #0x10]
        str     lr, [sp, #0x48]
        str     r12, [sp, #0x44]
        mov     r11, r0
        mov     r4, r1
        mov     r5, r2
        mov     r6, r3
        mov     r8, r7
LBSA9:
        ldr     r12, [sp, #0x44]
        mov     r1, r11
        ldr     r0, [r12], #0x14
        str     r12, [sp, #0x44]
        bl      __mulsf3
        ldr     r1, [r8]
        bl      __addsf3
        ldr     r2, [r6], #0x14
        mov     r7, r0
        mov     r1, r11
        mov     r0, r2
        bl      __mulsf3
        ldr     r2, [r5], #0x14
        str     r0, [sp, #0x4C]
        mov     r0, r2
        mov     r1, r7
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x4C]
        bl      __subsf3
        ldr     r1, [r10]
        bl      __addsf3
        str     r0, [r8], #8
        ldr     r0, [r4], #0x14
        mov     r1, r11
        bl      __mulsf3
        ldr     r2, [r9], #0x14
        mov     r11, r0
        mov     r1, r7
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        str     r0, [r10], #8
        ldr     r12, [sp, #0x48]
        subs    r12, r12, #1
        str     r12, [sp, #0x48]
        mov     r11, r7
        bne     LBSA9
        ldr     r4, [sp, #0x40]
        ldr     r11, [sp, #8]
        ldr     r8, [sp, #0x24]
        ldr     r6, [sp, #0x14]
        ldr     r5, [sp, #0x10]
LBSA10:
        mov     r0, r7
        ldr     r1, [sp, #0x20]
        bl      __mulsf3
        mov     r9, r0
        mov     r1, r11
        bl      __gtsf2
        cmp     r0, #0
        bgt     LBSA13
        mov     r0, r9
        ldr     r1, [sp, #0x28]
        bl      __ltsf2
        cmp     r0, #0
        movlt   r3, #0
        sublt   r0, r3, #2, 18
        blt     LBSA14
        mov     r0, r9
        mov     r1, r8
        bl      __gtsf2
        cmp     r0, #0
        ble     LBSA11
        ldr     r0, [sp, #0x2C]
        mov     r1, r9
        bl      __addsf3
        mov     r9, r0
LBSA11:
        mov     r0, r9
        mov     r1, r8
        bl      __ltsf2
        cmp     r0, #0
        bge     LBSA12
        mov     r0, r9
        ldr     r1, [sp, #0x2C]
        bl      __subsf3
        mov     r9, r0
LBSA12:
        mov     r0, r9
        bl      __fixsfsi
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LBSA14
LBSA13:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r0, r3
LBSA14:
        strh    r0, [r4], #2
        subs    r5, r5, #1
        bne     LBSA8
LBSA15:
        add     sp, sp, #0x58
        mov     r0, #0
        add     sp, sp, #2, 22
        ldmia   sp!, {r4 - r11, pc}
LBSA16:
        ldr     lr, [pc, #0xA88]
        ldr     r12, [r7, #4]
        cmp     r8, #0
        ldr     r9, [lr]
        ldr     lr, [r7, #8]
        str     r9, [sp, #0x850]
        andge   r8, r8, #0x7F
        subge   r10, r9, r8, lsl #23
        blt     LBSA27
LBSA17:
        ldr     r7, [pc, #0xA68]
        cmp     r5, #0
        str     r10, [sp, #0x850]
        ldr     r8, [r7]
        mov     r7, r8
        ble     LBSA25
        ldr     r11, [pc, #0xA54]
        ldr     r9, [pc, #0xA54]
        ldr     r3, [pc, #0xA54]
        ldr     r11, [r11]
        add     r1, r12, #4
        add     r0, r12, #0xC
        add     r2, r12, #8
        str     r11, [sp, #8]
        ldr     r9, [r9]
        ldr     r3, [r3]
        add     r11, lr, #4
        str     r11, [sp, #0x24]
        ldr     r11, [sp, #8]
        str     r2, [sp, #0xC]
        add     r2, r12, #0x10
        str     r2, [sp, #0x20]
        str     r0, [sp, #0x28]
        str     r1, [sp, #0x2C]
        str     r3, [sp, #0x30]
        str     r9, [sp, #0x34]
        str     r10, [sp, #0x3C]
        str     lr, [sp, #0x44]
        str     r12, [sp, #0x48]
LBSA18:
        ldrsh   r0, [r4]
        bl      __floatsisf
        cmp     r6, #0
        ble     LBSA20
        ldr     r12, [sp, #0x48]
        ldr     r7, [sp, #0x44]
        ldr     r3, [sp, #0x2C]
        ldr     r2, [sp, #0x28]
        ldr     r1, [sp, #0xC]
        ldr     r9, [sp, #0x20]
        ldr     r10, [sp, #0x24]
        mov     lr, r6
        str     r4, [sp, #0x40]
        str     r8, [sp, #0x38]
        str     r6, [sp, #0x14]
        str     r5, [sp, #0x10]
        str     lr, [sp, #0x18]
        str     r12, [sp, #0x1C]
        mov     r11, r0
        mov     r4, r1
        mov     r5, r2
        mov     r6, r3
        mov     r8, r7
LBSA19:
        ldr     r12, [sp, #0x1C]
        mov     r1, r11
        ldr     r0, [r12], #0x14
        str     r12, [sp, #0x1C]
        bl      __mulsf3
        ldr     r1, [r8]
        bl      __addsf3
        ldr     r2, [r6], #0x14
        mov     r7, r0
        mov     r1, r11
        mov     r0, r2
        bl      __mulsf3
        ldr     r2, [r5], #0x14
        str     r0, [sp, #0x4C]
        mov     r0, r2
        mov     r1, r7
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x4C]
        bl      __subsf3
        ldr     r1, [r10]
        bl      __addsf3
        str     r0, [r8], #8
        ldr     r0, [r4], #0x14
        mov     r1, r11
        bl      __mulsf3
        ldr     r2, [r9], #0x14
        mov     r11, r0
        mov     r1, r7
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        str     r0, [r10], #8
        ldr     r12, [sp, #0x18]
        subs    r12, r12, #1
        str     r12, [sp, #0x18]
        mov     r11, r7
        bne     LBSA19
        ldr     r4, [sp, #0x40]
        ldr     r11, [sp, #8]
        ldr     r8, [sp, #0x38]
        ldr     r6, [sp, #0x14]
        ldr     r5, [sp, #0x10]
LBSA20:
        mov     r0, r7
        ldr     r1, [sp, #0x3C]
        bl      __mulsf3
        mov     r9, r0
        mov     r1, r11
        bl      __gtsf2
        cmp     r0, #0
        bgt     LBSA23
        mov     r0, r9
        ldr     r1, [sp, #0x34]
        bl      __ltsf2
        cmp     r0, #0
        mvnlt   r3, #0xFF
        biclt   r0, r3, #0x7F, 24
        blt     LBSA24
        mov     r0, r9
        mov     r1, r8
        bl      __gtsf2
        cmp     r0, #0
        ble     LBSA21
        ldr     r0, [sp, #0x30]
        mov     r1, r9
        bl      __addsf3
        mov     r9, r0
LBSA21:
        mov     r0, r9
        mov     r1, r8
        bl      __ltsf2
        cmp     r0, #0
        bge     LBSA22
        mov     r0, r9
        ldr     r1, [sp, #0x30]
        bl      __subsf3
        mov     r9, r0
LBSA22:
        mov     r0, r9
        bl      __fixsfsi
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LBSA24
LBSA23:
        mov     r3, #0
        sub     r3, r3, #2, 18
        mvn     r0, r3
LBSA24:
        strh    r0, [r4], #2
        subs    r5, r5, #1
        bne     LBSA18
LBSA25:
        add     sp, sp, #0x58
        mov     r0, #0
        add     sp, sp, #2, 22
        ldmia   sp!, {r4 - r11, pc}
LBSA26:
        rsb     r8, r8, #0
        and     r3, r8, #0x7F
        add     r10, r9, r3, lsl #23
        b       LBSA7
LBSA27:
        rsb     r8, r8, #0
        and     r3, r8, #0x7F
        add     r10, r9, r3, lsl #23
        b       LBSA17
LBSA28:
        add     sp, sp, #0x58
        mvn     r0, #5
        add     sp, sp, #2, 22
        ldmia   sp!, {r4 - r11, pc}
LBSA29:
        add     sp, sp, #0x58
        mvn     r0, #7
        add     sp, sp, #2, 22
        ldmia   sp!, {r4 - r11, pc}
LBSA_ownsIIRAR32f_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x84
        ldr     r6, [r3, #0x28]
        ldr     r12, [r3, #0xC]
        ldr     r5, [r3, #0x30]
        ldr     r10, [r3, #0x10]
        ldr     r4, [sp, #0xA8]
        mov     r3, r6, lsl #1
        add     lr, r12, r3
        str     r0, [sp, #0x24]
        cmp     r6, #1
        mov     r8, r1
        mov     r9, r2
        add     r4, r4, r5
        mvn     r11, #0
        add     r7, lr, #2
        add     r0, r12, #2
        ble     LBSA37
        cmp     r9, #0
        ble     LBSA43
        sub     r3, r3, #2
        str     r3, [sp, #0x2C]
        sub     r3, r5, #1
        mov     lr, #1
        mov     r3, lr, lsl r3
        sub     r3, r3, #1
        sub     r1, r4, #1
        str     r3, [sp, #0x10]
        mov     r3, r5, asr #31
        mov     r1, lr, lsl r1
        mov     lr, r6, lsl #3
        str     r3, [sp, #0x28]
        mov     r2, #0
        sub     r3, r6, #1
        sub     lr, lr, #8
        str     r2, [sp]
        str     r3, [sp, #0xC]
        str     lr, [sp, #0x20]
        mov     r2, r4, asr #31
        str     r8, [sp, #0x14]
        str     r4, [sp, #0x48]
        str     r7, [sp, #0x3C]
        ldr     r7, [sp, #0x20]
        ldr     r8, [sp, #0xC]
        ldr     r4, [sp, #0x28]
        sub     r1, r1, #1
        add     r3, r10, #8
        sub     r6, r6, #6
        add     lr, r11, #2, 18
        str     r2, [sp, #8]
        str     lr, [sp, #0x50]
        str     r6, [sp, #0x58]
        str     r3, [sp, #0x30]
        str     r1, [sp, #0x4C]
        str     r0, [sp, #0x38]
        str     r12, [sp, #4]
        str     r9, [sp, #0x44]
        str     r11, [sp, #0x18]
LBSA30:
        ldr     r6, [sp, #0x24]
        ldr     r0, [sp, #4]
        mov     r2, r5
        ldrsh   r12, [r6], #2
        mov     r3, r4
        str     r12, [sp, #0x34]
        ldrsh   lr, [r0]
        ldr     r0, [r10]
        ldr     r1, [r10, #4]
        mul     r12, lr, r12
        str     r6, [sp, #0x24]
        adds    r9, r0, r12
        mov     r0, r9
        adc     r11, r1, r12, asr #31
        mov     r1, r11
        bl      __ashrdi3
        ldr     lr, [sp, #0x10]
        and     r0, r0, #1
        mov     r2, r5
        adds    r12, r9, lr
        adc     lr, r11, lr, asr #31
        adds    r0, r12, r0
        adc     r1, lr, #0
        mov     r3, r4
        bl      __ashrdi3
        ldr     r12, [sp, #0x50]
        subs    r12, r0, r12
        sbcs    lr, r1, #0
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        mvnne   r12, #0
        addne   r6, r12, #2, 18
        bne     LBSA31
        mvn     r12, #0
        cmp     r0, r12, lsl #15
        ldr     r12, [sp, #0x18]
        sbcs    r1, r1, r12
        movge   r0, r0, lsl #16
        movge   r6, r0, asr #16
        mvnlt   r12, #0
        movlt   r6, r12, lsl #15
LBSA31:
        mov     r0, r9
        mov     r1, r11
        ldr     r2, [sp, #0x48]
        ldr     r3, [sp, #8]
        bl      __ashrdi3
        ldr     r12, [sp, #0x4C]
        ldr     r2, [sp, #0x48]
        ldr     r3, [sp, #8]
        adds    r9, r12, r9
        and     r0, r0, #1
        adc     r12, r11, r12, asr #31
        adds    r0, r9, r0
        adc     r1, r12, #0
        bl      __ashrdi3
        ldr     r12, [sp, #0x50]
        subs    r12, r0, r12
        sbcs    lr, r1, #0
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        mvnne   r0, #0
        addne   r0, r0, #2, 18
        bne     LBSA32
        mvn     r12, #0
        cmp     r0, r12, lsl #15
        ldr     r12, [sp, #0x18]
        sbcs    r1, r1, r12
        movge   r0, r0, lsl #16
        movge   r0, r0, asr #16
        mvnlt   r0, #0
        movlt   r0, r0, lsl #15
LBSA32:
        ldr     r1, [sp, #0x14]
        cmp     r8, #0
        strh    r0, [r1], #2
        str     r1, [sp, #0x14]
        ble     LBSA36
        cmp     r8, #5
        movlt   r12, #0
        rsblt   r1, r6, #0
        blt     LBSA34
        ldr     r9, [sp, #0x38]
        ldr     r11, [sp, #0x3C]
        sub     lr, r10, #0x1C
        str     lr, [sp, #0x64]
        str     r5, [sp, #0x40]
        ldr     r3, [sp, #0x34]
        ldr     lr, [sp, #0x30]
        ldr     r4, [sp, #0x38]
        ldr     r5, [sp, #0x3C]
        mov     r12, #0
        rsb     r1, r6, #0
        sub     r0, r10, #0x14
        str     r11, [sp, #0x5C]
        str     r9, [sp, #0x60]
        str     r6, [sp, #0x54]
LBSA33:
        ldr     r2, [sp, #0x5C]
        ldr     r6, [sp, #0x60]
        ldr     r7, [r0, #0x1C]
        ldrsh   r2, [r2]
        ldrsh   r6, [r6]
        str     r7, [sp, #0x68]
        ldr     r7, [r0, #0x20]!
        mul     r8, r1, r2
        ldr     r2, [sp, #0x60]
        mla     r9, r3, r6, r8
        add     r6, r12, #2
        add     r2, r2, #8
        str     r2, [sp, #0x60]
        ldr     r2, [sp, #0x5C]
        add     r2, r2, #8
        str     r2, [sp, #0x5C]
        add     r2, r12, #1
        mov     r11, r2, lsl #1
        add     r8, lr, r2, lsl #3
        str     r8, [sp, #0x6C]
        add     r8, r10, r2, lsl #3
        str     r8, [sp, #0x70]
        ldr     r8, [sp, #0x68]
        adds    r8, r9, r8
        adc     r9, r7, r9, asr #31
        ldr     r7, [sp, #0x64]
        str     r8, [r7, #0x1C]
        str     r9, [r7, #0x20]
        ldrsh   r7, [r5, +r11]
        ldrsh   r11, [r4, +r11]
        ldr     r8, [lr, +r2, lsl #3]
        add     r9, lr, r6, lsl #3
        str     r8, [sp, #0x68]
        mul     r8, r1, r7
        ldr     r7, [sp, #0x6C]
        ldr     r7, [r7, #4]
        str     r9, [sp, #0x74]
        mla     r11, r3, r11, r8
        add     r9, r10, r6, lsl #3
        str     r9, [sp, #0x78]
        ldr     r9, [sp, #0x64]
        str     r7, [sp, #0x6C]
        add     r8, r12, #3
        mov     r7, r6, lsl #1
        add     r9, r9, #0x20
        str     r9, [sp, #0x64]
        mov     r9, r8, lsl #1
        str     r9, [sp, #0x7C]
        add     r9, lr, r8, lsl #3
        str     r9, [sp, #0x80]
        ldr     r9, [sp, #0x68]
        add     r12, r12, #4
        adds    r9, r11, r9
        str     r9, [r10, +r2, lsl #3]
        ldr     r2, [sp, #0x6C]
        adc     r11, r2, r11, asr #31
        ldr     r2, [sp, #0x70]
        str     r11, [r2, #4]
        ldrsh   r2, [r5, +r7]
        ldr     r11, [sp, #0x74]
        ldrsh   r7, [r4, +r7]
        mul     r2, r1, r2
        ldr     r9, [lr, +r6, lsl #3]
        ldr     r11, [r11, #4]
        str     r11, [sp, #0x74]
        add     r11, r10, r8, lsl #3
        mla     r2, r3, r7, r2
        str     r11, [sp, #0x70]
        adds    r9, r2, r9
        str     r9, [r10, +r6, lsl #3]
        ldr     r6, [sp, #0x74]
        adc     r2, r6, r2, asr #31
        ldr     r6, [sp, #0x78]
        str     r2, [r6, #4]
        ldr     r6, [sp, #0x7C]
        ldr     r7, [lr, +r8, lsl #3]
        ldrsh   r2, [r5, +r6]
        ldrsh   r6, [r4, +r6]
        mul     r9, r1, r2
        ldr     r2, [sp, #0x80]
        mla     r9, r3, r6, r9
        ldr     r2, [r2, #4]
        adds    r7, r9, r7
        str     r7, [r10, +r8, lsl #3]
        adc     r9, r2, r9, asr #31
        ldr     r2, [sp, #0x58]
        cmp     r12, r2
        ldr     r2, [sp, #0x70]
        str     r9, [r2, #4]
        ble     LBSA33
        ldr     r6, [sp, #0x54]
        ldr     r7, [sp, #0x20]
        ldr     r8, [sp, #0xC]
        ldr     r4, [sp, #0x28]
        ldr     r5, [sp, #0x40]
LBSA34:
        ldr     lr, [sp, #0x30]
        mov     r0, r12, lsl #3
        sub     r0, r0, #4
        add     r9, r0, lr
        add     r11, r0, r10
        ldr     r0, [sp, #0x38]
        str     r10, [sp, #0x1C]
        str     r5, [sp, #0x40]
        add     lr, r0, r12, lsl #1
        ldr     r0, [sp, #0x3C]
        ldr     r5, [sp, #0x34]
        add     r0, r0, r12, lsl #1
LBSA35:
        ldrsh   r3, [r0], #2
        ldrsh   r2, [lr], #2
        ldr     r4, [r9, #4]
        mul     r10, r1, r3
        ldr     r3, [r9, #8]!
        mla     r10, r5, r2, r10
        add     r12, r12, #1
        adds    r4, r10, r4
        str     r4, [r11, #4]
        adc     r10, r3, r10, asr #31
        str     r10, [r11, #8]!
        cmp     r12, r8
        blt     LBSA35
        ldr     r4, [sp, #0x28]
        ldr     r10, [sp, #0x1C]
        ldr     r5, [sp, #0x40]
LBSA36:
        ldr     r0, [sp, #0x2C]
        ldr     r1, [sp, #0x3C]
        ldr     lr, [sp, #0x44]
        ldrsh   r12, [r1, +r0]
        ldr     r1, [sp, #0x38]
        rsb     r12, r12, #0
        mul     r6, r12, r6
        ldr     r12, [sp]
        ldrsh   r0, [r1, +r0]
        add     r1, r7, r10
        add     r12, r12, #1
        str     r12, [sp]
        cmp     r12, lr
        ldr     r12, [sp, #0x34]
        mla     r6, r0, r12, r6
        mov     r0, r6, asr #31
        str     r6, [r10, +r7]
        str     r0, [r1, #4]
        blt     LBSA30
        mov     r0, #0
        add     sp, sp, #0x84
        ldmia   sp!, {r4 - r11, pc}
LBSA37:
        cmp     r6, #0
        mov     r3, #1
        ble     LBSA44
        cmp     r9, #0
        ble     LBSA43
        ldr     r6, [r10, #4]
        ldr     r0, [r10]
        mov     r7, r4, asr #31
        str     r6, [sp, #8]
        sub     r6, r4, #1
        mov     r6, r3, lsl r6
        sub     r1, r6, #1
        sub     r6, r5, #1
        mov     r6, r3, lsl r6
        add     r3, r11, #2, 18
        str     r3, [sp, #0x28]
        str     r1, [sp, #0xC]
        str     r8, [sp, #0x14]
        ldr     r8, [sp, #0x28]
        ldr     r1, [sp, #8]
        sub     r2, r6, #1
        mov     r6, r5, asr #31
        str     r2, [sp]
        str     r10, [sp, #0x1C]
        str     lr, [sp, #0x20]
        str     r12, [sp, #4]
        str     r11, [sp, #0x18]
LBSA38:
        ldr     r10, [sp, #0x24]
        ldr     lr, [sp, #4]
        mov     r2, r5
        ldrsh   r12, [r10], #2
        mov     r3, r6
        str     r12, [sp, #0x10]
        ldrsh   lr, [lr]
        str     r10, [sp, #0x24]
        mul     r12, lr, r12
        adds    r10, r0, r12
        mov     r0, r10
        adc     r11, r1, r12, asr #31
        mov     r1, r11
        bl      __ashrdi3
        ldr     lr, [sp]
        and     r0, r0, #1
        mov     r2, r5
        adds    r12, r10, lr
        adc     lr, r11, lr, asr #31
        adds    r0, r12, r0
        adc     r1, lr, #0
        mov     r3, r6
        bl      __ashrdi3
        subs    r12, r0, r8
        sbcs    lr, r1, #0
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        bne     LBSA40
        mvn     r12, #0
        cmp     r0, r12, lsl #15
        ldr     r12, [sp, #0x18]
        sbcs    r1, r1, r12
        bge     LBSA39
        mvn     r12, #0
        mov     r12, r12, lsl #15
        str     r12, [sp, #8]
        b       LBSA41
LBSA39:
        mov     r0, r0, lsl #16
        mov     r12, r0, asr #16
        str     r12, [sp, #8]
        b       LBSA41
LBSA40:
        mvn     r12, #0
        add     r12, r12, #2, 18
        str     r12, [sp, #8]
LBSA41:
        mov     r0, r10
        mov     r1, r11
        mov     r2, r4
        mov     r3, r7
        bl      __ashrdi3
        ldr     r12, [sp, #0xC]
        and     r0, r0, #1
        adds    r10, r12, r10
        adc     r12, r11, r12, asr #31
        adds    r0, r10, r0
        adc     r1, r12, #0
        mov     r2, r4
        mov     r3, r7
        bl      __ashrdi3
        subs    r12, r0, r8
        sbcs    lr, r1, #0
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        mvnne   r0, #0
        addne   r0, r0, #2, 18
        bne     LBSA42
        mvn     r12, #0
        cmp     r0, r12, lsl #15
        ldr     r12, [sp, #0x18]
        sbcs    r1, r1, r12
        movge   r0, r0, lsl #16
        movge   r0, r0, asr #16
        mvnlt   r0, #0
        movlt   r0, r0, lsl #15
LBSA42:
        ldr     r1, [sp, #0x14]
        subs    r9, r9, #1
        strh    r0, [r1], #2
        ldr     r0, [sp, #0x20]
        ldrsh   r12, [r0, #2]
        ldr     r0, [sp, #4]
        ldrsh   r0, [r0, #2]
        str     r1, [sp, #0x14]
        ldr     r1, [sp, #8]
        rsb     r12, r12, #0
        mul     r12, r12, r1
        ldr     r1, [sp, #0x10]
        mla     r0, r0, r1, r12
        ldr     r12, [sp, #0x1C]
        mov     r1, r0, asr #31
        str     r1, [r12, #4]
        str     r0, [r12]
        bne     LBSA38
LBSA43:
        mov     r0, #0
        add     sp, sp, #0x84
        ldmia   sp!, {r4 - r11, pc}
LBSA44:
        cmp     r9, #0
        ble     LBSA43
        sub     r0, r4, #1
        ldr     r10, [sp, #0x24]
        mov     r0, r3, lsl r0
        sub     r0, r0, #1
        add     lr, r11, #2, 18
        mov     r5, r4, asr #31
        str     lr, [sp, #0x60]
        str     r0, [sp, #0x64]
        str     r12, [sp, #4]
LBSA45:
        ldr     r12, [sp, #4]
        ldrsh   r0, [r10], #2
        ldrsh   r12, [r12]
        mov     r2, r4
        mov     r3, r5
        mul     r6, r12, r0
        mov     r7, r6, asr #31
        mov     r1, r7
        mov     r0, r6
        bl      __ashrdi3
        ldr     r12, [sp, #0x64]
        and     r0, r0, #1
        adds    r6, r6, r12
        adc     r7, r7, r12, asr #31
        adds    r0, r6, r0
        adc     r1, r7, #0
        mov     r3, r5
        mov     r2, r4
        bl      __ashrdi3
        ldr     r12, [sp, #0x60]
        subs    r12, r0, r12
        sbcs    lr, r1, #0
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        addne   r0, r11, #2, 18
        bne     LBSA46
        cmp     r0, r11, lsl #15
        sbcs    r1, r1, r11
        movge   r0, r0, lsl #16
        movge   r0, r0, asr #16
        movlt   r0, r11, lsl #15
LBSA46:
        strh    r0, [r8], #2
        subs    r9, r9, #1
        bne     LBSA45
        mov     r0, #0
        add     sp, sp, #0x84
        ldmia   sp!, {r4 - r11, pc}
LBSA_ownsIIRBQ32f_16s_ISfs:
        stmdb   sp!, {r4 - r10, lr}
        sub     sp, sp, #8
        sub     sp, sp, #2, 22
        ldr     r10, [sp, #0x828]
        mov     r8, r2
        cmp     r8, #0
        mov     r6, r0
        mov     r5, r1
        mov     r4, r3
        ble     LBSA48
        mov     r9, #1, 22
LBSA47:
        cmp     r8, #1, 22
        mov     r7, r9
        add     r1, sp, #8
        movlt   r7, r8
        mov     r2, r7
        mov     r0, r6
        bl      _ippsCopy_16s
        add     r0, sp, #8
        str     r10, [sp]
        mov     r3, r4
        mov     r2, r7
        mov     r1, r5
        bl      LBSA_ownsIIRBQ32f_16s_Sfs
        sub     r8, r8, #1, 22
        cmp     r8, #0
        add     r6, r6, #2, 22
        add     r5, r5, #2, 22
        bgt     LBSA47
LBSA48:
        add     sp, sp, #8
        mov     r0, #0
        add     sp, sp, #2, 22
        ldmia   sp!, {r4 - r10, pc}
        .long   0x49493036
        .long   LBSA__2il0floatpacket.1
        .long   LBSA__2il0floatpacket.2
        .long   LBSA__2il0floatpacket.3
        .long   LBSA__2il0floatpacket.4
        .long   LBSA__2il0floatpacket.5
LBSA_ownsIIRBQ32f_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x70
        ldr     r12, [r3, #0x30]
        ldr     lr, [r3, #0x28]
        ldr     r10, [r3, #0xC]
        ldr     r3, [r3, #0x10]
        ldr     r4, [sp, #0x94]
        str     r0, [sp, #0x24]
        cmp     r2, #0
        str     r3, [sp, #0x2C]
        str     r2, [sp, #0x28]
        add     r0, r4, r12
        ble     LBSA55
        add     r2, lr, lr, lsl #2
        sub     r3, r12, #1
        mov     r7, r2, lsl #1
        mov     r2, #1
        mov     r11, r0, asr #31
        mov     r3, r2, lsl r3
        str     r11, [sp, #0xC]
        add     r11, r10, #2
        sub     r3, r3, #1
        str     r11, [sp, #0x10]
        add     r11, r10, #6
        str     r3, [sp, #4]
        sub     r3, r0, #1
        mov     r4, lr, lsl #4
        str     r11, [sp, #8]
        add     r11, r10, #4
        mov     r3, r2, lsl r3
        str     r11, [sp, #0x18]
        add     r11, r10, #8
        sub     r2, r3, #1
        sub     r9, r4, #8
        sub     r5, r4, #0x10
        mvn     r3, #0
        sub     r4, r7, #6
        str     r11, [sp, #0x14]
        add     r11, r3, #2, 18
        sub     r8, r7, #8
        str     r4, [sp]
        str     r11, [sp, #0x1C]
        ldr     r11, [sp, #0x2C]
        sub     r6, r7, #2
        sub     r4, r7, #4
        str     r8, [sp, #0x20]
        sub     lr, lr, #1
        sub     r7, r7, #0xA
        mov     r8, r12, asr #31
        str     r3, [sp, #0x58]
        str     r2, [sp, #0x54]
        str     r8, [sp, #0x60]
        str     r7, [sp, #0x50]
        str     r4, [sp, #0x4C]
        str     r6, [sp, #0x48]
        str     lr, [sp, #0x3C]
        str     r0, [sp, #0x38]
        str     r12, [sp, #0x64]
        str     r1, [sp, #0x30]
LBSA49:
        ldr     r0, [sp, #0x24]
        ldr     r1, [sp, #0x3C]
        ldrsh   r6, [r0], #2
        str     r0, [sp, #0x24]
        cmp     r1, #0
        ble     LBSA52
        ldr     r1, [sp, #0x10]
        ldr     r0, [sp, #8]
        ldr     r3, [sp, #0x18]
        ldr     r12, [sp, #0x3C]
        ldr     r4, [sp, #0x14]
        mov     r7, r10
        sub     r2, r11, #4
        str     r5, [sp, #0x44]
        str     r9, [sp, #0x40]
        str     r10, [sp, #0x34]
        sub     r8, r11, #0xC
        str     r12, [sp, #0x68]
        str     r3, [sp, #0x5C]
        mov     r5, r0
        mov     r9, r1
        mov     r10, r2
LBSA50:
        ldrsh   r3, [r7], #0xA
        mov     r11, r6
        ldr     r12, [r8, #0xC]
        mul     r3, r11, r3
        ldr     lr, [r8, #0x10]
        ldr     r2, [sp, #0x64]
        adds    r6, r3, r12
        adc     r1, lr, r3, asr #31
        ldr     r3, [sp, #0x60]
        str     r1, [sp, #0x6C]
        mov     r0, r6
        bl      __ashrdi3
        ldr     r3, [sp, #4]
        ldr     r12, [sp, #0x6C]
        ldr     r2, [sp, #0x64]
        adds    r6, r3, r6
        adc     r3, r12, r3, asr #31
        and     r0, r0, #1
        adds    r0, r6, r0
        adc     r1, r3, #0
        ldr     r3, [sp, #0x60]
        bl      __ashrdi3
        ldr     r3, [sp, #0x1C]
        subs    r3, r0, r3
        sbcs    r12, r1, #0
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        mvnne   r3, #0
        addne   r6, r3, #2, 18
        bne     LBSA51
        mvn     r3, #0
        cmp     r0, r3, lsl #15
        ldr     r3, [sp, #0x58]
        sbcs    r1, r1, r3
        movge   r0, r0, lsl #16
        movge   r6, r0, asr #16
        mvnlt   r3, #0
        movlt   r6, r3, lsl #15
LBSA51:
        ldrsh   r0, [r5], #0xA
        ldrsh   lr, [r9], #0xA
        ldr     r3, [r10, #0xC]
        ldr     r12, [r10, #0x10]
        rsb     r0, r0, #0
        mul     r0, r0, r6
        mla     r0, r11, lr, r0
        adds    r3, r3, r0
        str     r3, [r8, #0xC]
        adc     r0, r12, r0, asr #31
        str     r0, [r8, #0x10]!
        ldr     lr, [sp, #0x5C]
        ldrsh   r12, [r4], #0xA
        ldrsh   r3, [lr], #0xA
        str     lr, [sp, #0x5C]
        rsb     r12, r12, #0
        mul     lr, r12, r6
        ldr     r12, [sp, #0x68]
        mla     lr, r11, r3, lr
        subs    r12, r12, #1
        str     r12, [sp, #0x68]
        mov     r3, lr, asr #31
        str     r3, [r10, #0x10]
        str     lr, [r10, #0xC]
        add     r10, r10, #0x10
        bne     LBSA50
        ldr     r5, [sp, #0x44]
        ldr     r9, [sp, #0x40]
        ldr     r11, [sp, #0x2C]
        ldr     r10, [sp, #0x34]
LBSA52:
        ldr     r0, [sp, #0x50]
        ldr     r8, [sp, #0x60]
        add     r2, r11, r5
        ldrsh   r1, [r0, +r10]
        ldr     r12, [r2, #4]
        ldr     r0, [r5, +r11]
        ldr     r2, [sp, #0x64]
        mul     r1, r1, r6
        mov     r3, r8
        adds    r4, r0, r1
        mov     r0, r4
        adc     r7, r12, r1, asr #31
        mov     r1, r7
        bl      __ashrdi3
        ldr     r12, [sp, #4]
        and     r0, r0, #1
        mov     r3, r8
        adds    r2, r4, r12
        adc     r12, r7, r12, asr #31
        adds    r0, r2, r0
        ldr     r2, [sp, #0x64]
        adc     r1, r12, #0
        bl      __ashrdi3
        ldr     r2, [sp, #0x1C]
        subs    r2, r0, r2
        sbcs    r3, r1, #0
        movlt   r2, #0
        movlt   r3, #0
        orrs    r3, r2, r3
        mvnne   r2, #0
        addne   r8, r2, #2, 18
        bne     LBSA53
        mvn     r2, #0
        cmp     r0, r2, lsl #15
        ldr     r2, [sp, #0x58]
        sbcs    r1, r1, r2
        movge   r0, r0, lsl #16
        movge   r8, r0, asr #16
        mvnlt   r2, #0
        movlt   r8, r2, lsl #15
LBSA53:
        mov     r0, r4
        mov     r1, r7
        ldr     r2, [sp, #0x38]
        ldr     r3, [sp, #0xC]
        bl      __ashrdi3
        ldr     r2, [sp, #0x54]
        ldr     r3, [sp, #0xC]
        adds    r4, r4, r2
        adc     r2, r7, r2, asr #31
        and     r0, r0, #1
        adds    r0, r4, r0
        adc     r1, r2, #0
        ldr     r2, [sp, #0x38]
        bl      __ashrdi3
        ldr     r2, [sp, #0x1C]
        subs    r2, r0, r2
        sbcs    r3, r1, #0
        movlt   r2, #0
        movlt   r3, #0
        orrs    r3, r2, r3
        mvnne   r0, #0
        addne   r0, r0, #2, 18
        bne     LBSA54
        mvn     r2, #0
        cmp     r0, r2, lsl #15
        ldr     r2, [sp, #0x58]
        sbcs    r1, r1, r2
        movge   r0, r0, lsl #16
        movge   r0, r0, asr #16
        mvnlt   r0, #0
        movlt   r0, r0, lsl #15
LBSA54:
        ldr     r1, [sp, #0x30]
        add     r12, r11, r5
        add     lr, r9, r11
        strh    r0, [r1], #2
        ldr     r0, [sp, #0x4C]
        ldr     r2, [r11, +r9]
        ldrsh   r3, [r0, +r10]
        ldr     r0, [sp, #0x20]
        rsb     r3, r3, #0
        mul     r4, r3, r8
        ldr     r3, [lr, #4]
        ldrsh   r0, [r0, +r10]
        str     r1, [sp, #0x30]
        mla     r4, r0, r6, r4
        adds    r2, r2, r4
        str     r2, [r5, +r11]
        adc     r4, r3, r4, asr #31
        str     r4, [r12, #4]
        ldr     r0, [sp, #0x48]
        ldrsh   r2, [r10, +r0]
        ldr     r0, [sp]
        ldrsh   r1, [r0, +r10]
        ldr     r0, [sp, #0x28]
        rsb     r2, r2, #0
        mul     r8, r2, r8
        subs    r0, r0, #1
        str     r0, [sp, #0x28]
        mla     r8, r1, r6, r8
        mov     r1, r8, asr #31
        str     r8, [r11, +r9]
        str     r1, [lr, #4]
        bne     LBSA49
LBSA55:
        mov     r0, #0
        add     sp, sp, #0x70
        ldmia   sp!, {r4 - r11, pc}
LBSA_refsIIRAR32f_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x80
        ldr     r10, [r3, #4]
        ldr     r12, [pc, #0xCDC]
        ldr     r11, [r3, #0x28]
        ldr     r7, [r3, #8]
        ldr     r3, [r10]
        ldr     r12, [r12]
        ldr     lr, [sp, #0xA4]
        str     r3, [sp, #0x54]
        add     r6, r10, r11, lsl #2
        str     r12, [sp, #0x7C]
        cmp     lr, #0
        mov     r5, r1
        add     r9, r6, #4
        add     r8, r10, #4
        andge   lr, lr, #0x7F
        subge   r4, r12, lr, lsl #23
        blt     LBSA93
LBSA56:
        cmp     r11, #1
        str     r4, [sp, #0x7C]
        ble     LBSA71
        bic     r3, r2, #1
        cmp     r3, #0
        ble     LBSA70
        ldr     r1, [pc, #0xC88]
        ldr     r12, [pc, #0xC88]
        ldr     lr, [pc, #0xC88]
        ldr     r1, [r1]
        str     r1, [sp, #0x24]
        ldr     r1, [pc, #0xC80]
        ldr     r1, [r1]
        str     r1, [sp, #0x28]
        ldr     r12, [r12]
        mov     r1, r11, lsl #2
        str     r12, [sp, #0x2C]
        ldr     lr, [lr]
        sub     r12, r1, #8
        sub     r1, r1, #4
        str     r1, [sp, #0x14]
        sub     r1, r11, #2
        str     r1, [sp, #8]
        sub     r1, r11, #6
        str     r1, [sp, #4]
        add     r1, r0, #2
        str     r1, [sp, #0x18]
        add     r1, r5, #2
        str     r4, [sp, #0x58]
        ldr     r4, [sp, #0x14]
        str     lr, [sp, #0x30]
        str     r1, [sp, #0x20]
        mov     lr, #0
        mov     r1, r5
        str     r0, [sp, #0x1C]
        str     r0, [sp, #0x6C]
        str     r1, [sp, #0x68]
        str     r12, [sp, #0x64]
        str     lr, [sp, #0x60]
        str     r3, [sp, #0x5C]
        str     r11, [sp, #0x50]
        str     r2, [sp, #0xC]
        str     r5, [sp, #0x4C]
LBSA57:
        ldr     r1, [sp, #0x1C]
        ldrsh   r0, [r1], #4
        str     r1, [sp, #0x1C]
        bl      __floatsisf
        ldr     r2, [sp, #0x18]
        mov     r11, r0
        ldrsh   r1, [r2], #4
        str     r11, [sp, #0x74]
        str     r2, [sp, #0x18]
        mov     r0, r1
        bl      __floatsisf
        str     r0, [sp, #0x38]
        ldr     r0, [sp, #0x54]
        mov     r1, r11
        bl      __mulsf3
        ldr     r1, [r7]
        bl      __addsf3
        ldr     r1, [sp, #0x38]
        mov     r5, r0
        ldr     r0, [sp, #0x54]
        str     r5, [sp, #0x70]
        bl      __mulsf3
        ldr     r2, [r10, #4]
        ldr     r3, [r7, #4]
        str     r0, [sp, #0x34]
        mov     r1, r11
        str     r3, [sp, #0x3C]
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [sp, #0x3C]
        bl      __addsf3
        ldr     r2, [r6, #4]
        mov     r11, r0
        mov     r1, r5
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        ldr     r1, [sp, #0x34]
        bl      __addsf3
        ldr     r1, [sp, #0x58]
        str     r0, [sp, #0x3C]
        mov     r0, r5
        bl      __mulsf3
        ldr     r1, [sp, #0x24]
        mov     r5, r0
        bl      __gtsf2
        cmp     r0, #0
        bgt     LBSA60
        mov     r0, r5
        ldr     r1, [sp, #0x28]
        bl      __ltsf2
        cmp     r0, #0
        movlt   r0, #0
        sublt   r0, r0, #2, 18
        blt     LBSA61
        mov     r0, r5
        ldr     r1, [sp, #0x2C]
        bl      __gtsf2
        cmp     r0, #0
        ble     LBSA58
        ldr     r0, [sp, #0x30]
        mov     r1, r5
        bl      __addsf3
        mov     r5, r0
LBSA58:
        mov     r0, r5
        ldr     r1, [sp, #0x2C]
        bl      __ltsf2
        cmp     r0, #0
        bge     LBSA59
        mov     r0, r5
        ldr     r1, [sp, #0x30]
        bl      __subsf3
        mov     r5, r0
LBSA59:
        mov     r0, r5
        bl      __fixsfsi
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LBSA61
LBSA60:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r0, r0
LBSA61:
        ldr     r2, [sp, #0x68]
        strh    r0, [r2], #4
        ldr     r5, [r7, #4]
        ldr     r1, [sp, #0x74]
        ldr     r0, [r10, #4]
        str     r2, [sp, #0x68]
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r1, [sp, #0x70]
        ldr     r2, [r6, #4]
        mov     r5, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r5
        bl      __subsf3
        ldr     r1, [sp, #0x34]
        bl      __addsf3
        ldr     r1, [sp, #0x58]
        bl      __mulsf3
        ldr     r1, [sp, #0x24]
        mov     r5, r0
        bl      __gtsf2
        cmp     r0, #0
        bgt     LBSA64
        mov     r0, r5
        ldr     r1, [sp, #0x28]
        bl      __ltsf2
        cmp     r0, #0
        movlt   r0, #0
        sublt   r1, r0, #2, 18
        blt     LBSA65
        mov     r0, r5
        ldr     r1, [sp, #0x2C]
        bl      __gtsf2
        cmp     r0, #0
        ble     LBSA62
        ldr     r0, [sp, #0x30]
        mov     r1, r5
        bl      __addsf3
        mov     r5, r0
LBSA62:
        mov     r0, r5
        ldr     r1, [sp, #0x2C]
        bl      __ltsf2
        cmp     r0, #0
        bge     LBSA63
        mov     r0, r5
        ldr     r1, [sp, #0x30]
        bl      __subsf3
        mov     r5, r0
LBSA63:
        mov     r0, r5
        bl      __fixsfsi
        mov     r0, r0, lsl #16
        mov     r1, r0, asr #16
        b       LBSA65
LBSA64:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r1, r0
LBSA65:
        ldr     r0, [sp, #0x20]
        strh    r1, [r0], #4
        ldr     r1, [sp, #8]
        str     r0, [sp, #0x20]
        cmp     r1, #0
        ble     LBSA69
        ldr     r0, [sp, #8]
        cmp     r0, #4
        movlt   r0, #0
        blt     LBSA67
        add     r3, r6, #8
        add     r1, r6, #0xC
        str     r6, [sp, #0x40]
        ldr     r4, [sp, #0x3C]
        ldr     r6, [sp, #0x38]
        add     r12, r10, #8
        add     r2, r10, #0xC
        mov     r0, #0
        add     r11, r7, #0xC
        add     r5, r7, #4
        str     r7, [sp]
        str     r8, [sp, #0x48]
        str     r9, [sp, #0x44]
        str     r10, [sp, #0x10]
        str     r0, [sp, #0x34]
        mov     r7, r1
        mov     r8, r2
        mov     r9, r3
        mov     r10, r12
LBSA66:
        ldr     lr, [sp, #0x34]
        ldr     r0, [r10, #-4]
        mov     r1, r6
        add     lr, lr, #3
        str     lr, [sp, #0x34]
        bl      __mulsf3
        ldr     r2, [r9, #-4]
        str     r0, [sp, #0x78]
        mov     r0, r2
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x78]
        bl      __subsf3
        ldr     r2, [r8, #-4]
        ldr     r1, [sp, #0x74]
        str     r0, [sp, #0x78]
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [sp, #0x78]
        bl      __addsf3
        ldr     r2, [r7, #-4]
        ldr     r1, [sp, #0x70]
        str     r0, [sp, #0x78]
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x78]
        bl      __subsf3
        ldr     r1, [r11, #-4]
        bl      __addsf3
        str     r0, [r5, #-4]
        ldr     r0, [r10]
        mov     r1, r6
        bl      __mulsf3
        ldr     r2, [r9]
        str     r0, [sp, #0x78]
        mov     r0, r2
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x78]
        bl      __subsf3
        ldr     r2, [r8]
        ldr     r1, [sp, #0x74]
        str     r0, [sp, #0x78]
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [sp, #0x78]
        bl      __addsf3
        ldr     r2, [r7]
        ldr     r1, [sp, #0x70]
        str     r0, [sp, #0x78]
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x78]
        bl      __subsf3
        ldr     r1, [r11]
        bl      __addsf3
        str     r0, [r5]
        ldr     r0, [r10, #4]
        mov     r1, r6
        add     r10, r10, #0xC
        bl      __mulsf3
        ldr     r2, [r9, #4]
        str     r0, [sp, #0x78]
        mov     r0, r2
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x78]
        add     r9, r9, #0xC
        bl      __subsf3
        ldr     r2, [r8, #4]
        ldr     r1, [sp, #0x74]
        str     r0, [sp, #0x78]
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [sp, #0x78]
        bl      __addsf3
        ldr     r2, [r7, #4]
        ldr     r1, [sp, #0x70]
        str     r0, [sp, #0x78]
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x78]
        add     r8, r8, #0xC
        bl      __subsf3
        ldr     r1, [r11, #4]
        bl      __addsf3
        str     r0, [r5, #4]
        ldr     lr, [sp, #4]
        ldr     r0, [sp, #0x34]
        add     r7, r7, #0xC
        add     r11, r11, #0xC
        add     r5, r5, #0xC
        cmp     r0, lr
        ble     LBSA66
        ldr     r0, [sp, #0x34]
        ldr     r4, [sp, #0x14]
        ldr     r7, [sp]
        ldr     r8, [sp, #0x48]
        ldr     r9, [sp, #0x44]
        ldr     r6, [sp, #0x40]
        ldr     r10, [sp, #0x10]
LBSA67:
        mov     r12, #8
        add     lr, r6, r0, lsl #2
        add     r1, r10, r0, lsl #2
        add     r11, r7, r0, lsl #2
        add     r3, r8, r0, lsl #2
        add     r2, r9, r0, lsl #2
        add     r1, r12, r1
        add     lr, r12, lr
        str     r7, [sp]
        str     r8, [sp, #0x48]
        str     r9, [sp, #0x44]
        str     r6, [sp, #0x40]
        add     r5, r12, r11
        str     r10, [sp, #0x10]
        mov     r9, r0
        mov     r6, r1
        mov     r7, r2
        mov     r8, r3
        mov     r4, lr
LBSA68:
        ldr     r0, [r8], #4
        ldr     r1, [sp, #0x38]
        add     r9, r9, #1
        bl      __mulsf3
        ldr     r2, [r7], #4
        ldr     r1, [sp, #0x3C]
        mov     r10, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r10
        bl      __subsf3
        ldr     r1, [sp, #0x74]
        ldr     r2, [r6], #4
        mov     r10, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r1, [sp, #0x70]
        ldr     r2, [r4], #4
        mov     r10, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r10
        bl      __subsf3
        ldr     r1, [r5], #4
        bl      __addsf3
        str     r0, [r11], #4
        ldr     r12, [sp, #8]
        cmp     r9, r12
        blt     LBSA68
        ldr     r4, [sp, #0x14]
        ldr     r7, [sp]
        ldr     r8, [sp, #0x48]
        ldr     r9, [sp, #0x44]
        ldr     r6, [sp, #0x40]
        ldr     r10, [sp, #0x10]
LBSA69:
        ldr     r1, [sp, #0x74]
        ldr     r0, [r4, +r8]
        ldr     r2, [sp, #0x60]
        add     r2, r2, #2
        str     r2, [sp, #0x60]
        bl      __mulsf3
        ldr     r1, [sp, #0x70]
        ldr     r2, [r4, +r9]
        mov     r5, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r5
        bl      __subsf3
        ldr     r11, [sp, #0x64]
        ldr     r1, [sp, #0x38]
        mov     r5, r0
        ldr     r2, [r8, +r11]
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r2, [r9, +r11]
        ldr     r5, [sp, #0x3C]
        str     r0, [sp, #0x78]
        mov     r0, r2
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x78]
        bl      __subsf3
        str     r0, [r11, +r7]
        ldr     r1, [sp, #0x38]
        ldr     r0, [r4, +r8]
        bl      __mulsf3
        ldr     r2, [r4, +r9]
        mov     r11, r0
        mov     r1, r5
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        ldr     r1, [sp, #0x5C]
        ldr     r2, [sp, #0x60]
        str     r0, [r4, +r7]
        cmp     r2, r1
        blt     LBSA57
        ldr     r0, [sp, #0x6C]
        ldr     r4, [sp, #0x58]
        ldr     r11, [sp, #0x50]
        ldr     r2, [sp, #0xC]
        ldr     r5, [sp, #0x4C]
LBSA70:
        tst     r2, #1
        beq     LBSA77
        b       LBSA78
LBSA71:
        cmp     r11, #0
        mov     r9, #0
        ble     LBSA87
        cmp     r2, #0
        ble     LBSA77
        ldr     r12, [pc, #0x5C0]
        ldr     r8, [r7]
        ldr     r3, [pc, #0x5C4]
        ldr     r12, [r12]
        ldr     r11, [pc, #0x5B4]
        ldr     lr, [pc, #0x5B4]
        str     r7, [sp]
        str     r10, [sp, #0x10]
        mov     r7, r5
        str     r12, [sp, #8]
        str     r2, [sp, #0xC]
        mov     r5, r0
        mov     r10, r6
LBSA72:
        ldrsh   r0, [r5], #2
        bl      __floatsisf
        ldr     r1, [sp, #0x54]
        mov     r6, r0
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        mov     r8, r0
        mov     r1, r4
        bl      __mulsf3
        ldr     r1, [sp, #8]
        mov     r11, r0
        bl      __gtsf2
        cmp     r0, #0
        bgt     LBSA75
        ldr     r2, [pc, #0x55C]
        mov     r0, r11
        ldr     r1, [r2]
        bl      __ltsf2
        cmp     r0, #0
        movlt   r2, #0
        sublt   r0, r2, #2, 18
        blt     LBSA76
        ldr     r2, [pc, #0x534]
        mov     r0, r11
        ldr     r1, [r2]
        str     r1, [sp, #0x14]
        bl      __gtsf2
        cmp     r0, #0
        ble     LBSA73
        ldr     r2, [pc, #0x51C]
        mov     r1, r11
        ldr     r0, [r2]
        bl      __addsf3
        mov     r11, r0
LBSA73:
        mov     r0, r11
        ldr     r1, [sp, #0x14]
        bl      __ltsf2
        cmp     r0, #0
        bge     LBSA74
        ldr     r2, [pc, #0x4F4]
        mov     r0, r11
        ldr     r1, [r2]
        bl      __subsf3
        mov     r11, r0
LBSA74:
        mov     r0, r11
        bl      __fixsfsi
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LBSA76
LBSA75:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r0, r2
LBSA76:
        strh    r0, [r7], #2
        ldr     r2, [sp, #0x10]
        mov     r1, r6
        ldr     r0, [r2, #4]
        add     r9, r9, #1
        bl      __mulsf3
        ldr     r2, [r10, #4]
        mov     r6, r0
        mov     r1, r8
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r6
        bl      __subsf3
        ldr     r2, [sp, #0xC]
        mov     r8, r0
        cmp     r9, r2
        ldr     r2, [sp]
        str     r8, [r2]
        blt     LBSA72
LBSA77:
        mov     r0, #0
        add     sp, sp, #0x80
        ldmia   sp!, {r4 - r11, pc}
LBSA78:
        mov     r2, r2, lsl #1
        str     r2, [sp, #0x28]
        sub     r0, r0, #2
        ldrsh   r0, [r0, +r2]
        bl      __floatsisf
        str     r0, [sp, #0x74]
        ldr     r2, [r7]
        ldr     r1, [sp, #0x54]
        str     r2, [sp, #0x78]
        bl      __mulsf3
        ldr     r1, [sp, #0x78]
        bl      __addsf3
        str     r0, [sp, #0x20]
        mov     r1, r4
        bl      __mulsf3
        ldr     r2, [pc, #0x420]
        mov     r4, r0
        ldr     r1, [r2]
        bl      __gtsf2
        cmp     r0, #0
        bgt     LBSA81
        ldr     r2, [pc, #0x414]
        mov     r0, r4
        ldr     r1, [r2]
        bl      __ltsf2
        cmp     r0, #0
        movlt   r0, #0
        sublt   r0, r0, #2, 18
        blt     LBSA82
        ldr     r2, [pc, #0x3EC]
        mov     r0, r4
        ldr     r1, [r2]
        str     r1, [sp, #0x30]
        bl      __gtsf2
        cmp     r0, #0
        ble     LBSA79
        ldr     r2, [pc, #0x3D4]
        mov     r1, r4
        ldr     r0, [r2]
        bl      __addsf3
        mov     r4, r0
LBSA79:
        ldr     r1, [sp, #0x30]
        mov     r0, r4
        bl      __ltsf2
        cmp     r0, #0
        bge     LBSA80
        ldr     r2, [pc, #0x3AC]
        mov     r0, r4
        ldr     r1, [r2]
        bl      __subsf3
        mov     r4, r0
LBSA80:
        mov     r0, r4
        bl      __fixsfsi
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LBSA82
LBSA81:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r0, r0
LBSA82:
        ldr     r1, [sp, #0x28]
        sub     r5, r5, #2
        strh    r0, [r5, +r1]
        sub     r0, r11, #1
        cmp     r0, #0
        ble     LBSA86
        sub     r1, r11, #1
        cmp     r1, #5
        mov     r4, #0
        addlt   r5, r7, #4
        blt     LBSA84
        add     r5, r7, #4
        add     r1, r10, #8
        add     r2, r6, #8
        add     r10, r7, #8
        mov     r6, r5
        str     r5, [sp, #0x6C]
        str     r7, [sp]
        ldr     r5, [sp, #0x20]
        ldr     r7, [sp, #0x74]
        sub     r3, r11, #6
        str     r8, [sp, #0x48]
        str     r9, [sp, #0x44]
        str     r3, [sp, #0x68]
        str     r0, [sp, #0x70]
        str     r11, [sp, #0x50]
        mov     r9, r1
        mov     r8, r2
LBSA83:
        ldr     r0, [r9, #-4]
        mov     r1, r7
        add     r4, r4, #4
        bl      __mulsf3
        ldr     r2, [r8, #-4]
        mov     r11, r0
        mov     r1, r5
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        ldr     r1, [r10, #-4]
        bl      __addsf3
        str     r0, [r6, #-4]
        ldr     r0, [r9]
        mov     r1, r7
        bl      __mulsf3
        ldr     r2, [r8]
        mov     r11, r0
        mov     r1, r5
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        ldr     r1, [r10]
        bl      __addsf3
        str     r0, [r6]
        ldr     r0, [r9, #4]
        mov     r1, r7
        bl      __mulsf3
        ldr     r2, [r8, #4]
        mov     r11, r0
        mov     r1, r5
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        ldr     r1, [r10, #4]
        bl      __addsf3
        str     r0, [r6, #4]
        ldr     r0, [r9, #8]
        mov     r1, r7
        add     r9, r9, #0x10
        bl      __mulsf3
        ldr     r2, [r8, #8]
        mov     r11, r0
        mov     r1, r5
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        ldr     r1, [r10, #8]
        bl      __addsf3
        ldr     r3, [sp, #0x68]
        str     r0, [r6, #8]
        cmp     r4, r3
        add     r8, r8, #0x10
        add     r10, r10, #0x10
        add     r6, r6, #0x10
        ble     LBSA83
        ldr     r5, [sp, #0x6C]
        ldr     r0, [sp, #0x70]
        ldr     r7, [sp]
        ldr     r8, [sp, #0x48]
        ldr     r9, [sp, #0x44]
        ldr     r11, [sp, #0x50]
LBSA84:
        str     r11, [sp, #0x50]
        ldr     r11, [sp, #0x20]
        add     r1, r8, r4, lsl #2
        add     r10, r9, r4, lsl #2
        str     r8, [sp, #0x48]
        str     r9, [sp, #0x44]
        add     r6, r7, r4, lsl #2
        str     r7, [sp]
        mov     r8, r0
        mov     r9, r1
LBSA85:
        ldr     r1, [sp, #0x74]
        ldr     r0, [r9], #4
        bl      __mulsf3
        mov     r7, r0
        ldr     r0, [r10], #4
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r7
        bl      __subsf3
        ldr     r1, [r5, +r4, lsl #2]
        bl      __addsf3
        add     r4, r4, #1
        str     r0, [r6], #4
        cmp     r4, r8
        blt     LBSA85
        ldr     r7, [sp]
        ldr     r8, [sp, #0x48]
        ldr     r9, [sp, #0x44]
        ldr     r11, [sp, #0x50]
LBSA86:
        ldr     r1, [sp, #0x74]
        mov     r11, r11, lsl #2
        sub     r4, r11, #4
        ldr     r0, [r4, +r8]
        bl      __mulsf3
        ldr     r1, [sp, #0x20]
        ldr     r9, [r4, +r9]
        mov     r5, r0
        mov     r0, r9
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r5
        bl      __subsf3
        str     r0, [r4, +r7]
        mov     r0, #0
        add     sp, sp, #0x80
        ldmia   sp!, {r4 - r11, pc}
LBSA87:
        cmp     r2, #0
        ble     LBSA77
        ldr     lr, [pc, #0x124]
        ldr     r3, [pc, #0x12C]
        ldr     r12, [pc, #0x120]
        ldr     r6, [lr]
        ldr     lr, [pc, #0x11C]
        mvn     r8, #0xFF
        bic     r11, r8, #0x7F, 24
        str     r11, [sp, #8]
        ldr     r11, [sp, #0x54]
        mov     r8, r9
        str     r9, [sp, #4]
        mov     r9, r5
        mov     r7, r0
        mov     r10, r2
        mov     r5, r4
LBSA88:
        ldrsh   r0, [r7], #2
        bl      __floatsisf
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r5
        bl      __mulsf3
        mov     r4, r0
        mov     r1, r6
        bl      __gtsf2
        cmp     r0, #0
        bgt     LBSA91
        ldr     r3, [pc, #0xC8]
        mov     r0, r4
        ldr     r1, [r3]
        bl      __ltsf2
        cmp     r0, #0
        ldrlt   r3, [sp, #8]
        blt     LBSA92
        ldr     r3, [pc, #0xA4]
        mov     r0, r4
        ldr     r1, [r3]
        str     r1, [sp]
        bl      __gtsf2
        cmp     r0, #0
        ble     LBSA89
        ldr     r3, [pc, #0x8C]
        mov     r1, r4
        ldr     r0, [r3]
        bl      __addsf3
        mov     r4, r0
LBSA89:
        mov     r0, r4
        ldr     r1, [sp]
        bl      __ltsf2
        cmp     r0, #0
        bge     LBSA90
        ldr     r3, [pc, #0x64]
        mov     r0, r4
        ldr     r1, [r3]
        bl      __subsf3
        mov     r4, r0
LBSA90:
        mov     r0, r4
        bl      __fixsfsi
        mov     r0, r0, lsl #16
        mov     r3, r0, asr #16
        b       LBSA92
LBSA91:
        ldr     r3, [sp, #4]
        sub     r3, r3, #2, 18
        mvn     r3, r3
LBSA92:
        add     r8, r8, #1
        strh    r3, [r9], #2
        cmp     r8, r10
        blt     LBSA88
        mov     r0, #0
        add     sp, sp, #0x80
        ldmia   sp!, {r4 - r11, pc}
LBSA93:
        rsb     lr, lr, #0
        and     r3, lr, #0x7F
        add     r4, r12, r3, lsl #23
        b       LBSA56
        .long   LBSA__2il0floatpacket.6
        .long   LBSA__2il0floatpacket.7
        .long   LBSA__2il0floatpacket.9
        .long   LBSA__2il0floatpacket.10
        .long   LBSA__2il0floatpacket.8


        .data
        .align  4


LBSA__2il0floatpacket.1:
        .byte   0x00,0x00,0x80,0x3F
LBSA__2il0floatpacket.2:
        .byte   0x00,0x00,0x00,0x00
LBSA__2il0floatpacket.3:
        .byte   0x00,0xFE,0xFF,0x46
LBSA__2il0floatpacket.4:
        .byte   0x00,0x00,0x00,0xC7
LBSA__2il0floatpacket.5:
        .byte   0x00,0x00,0x00,0x3F
LBSA__2il0floatpacket.6:
        .byte   0x00,0x00,0x80,0x3F
LBSA__2il0floatpacket.7:
        .byte   0x00,0xFE,0xFF,0x46
LBSA__2il0floatpacket.8:
        .byte   0x00,0x00,0x00,0xC7
LBSA__2il0floatpacket.9:
        .byte   0x00,0x00,0x00,0x00
LBSA__2il0floatpacket.10:
        .byte   0x00,0x00,0x00,0x3F


