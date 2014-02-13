        .text
        .align  4
        .globl  _ippsIIROne32f_16s_Sfs


_ippsIIROne32f_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x30
        cmp     r2, #0
        mov     r4, r0
        mov     r7, r1
        beq     LBRG61
        cmp     r7, #0
        beq     LBRG61
        ldr     r12, [r2]
        ldr     lr, [pc, #0xFF0]
        ldr     r6, [r2, #0x30]
        subs    r12, r12, lr
        add     r5, r3, r6
        beq     LBRG30
        adds    r12, r12, #1
        beq     LBRG0
        mvn     r0, #0x10
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LBRG0:
        ldr     r9, [r2, #0x28]
        mov     r12, #0
        mvn     r10, #0
        cmp     r9, #7
        str     r12, [sp, #0x10]
        bge     LBRG19
        cmp     r5, #0
        blt     LBRG8
        cmp     r5, #0x1F
        bgt     LBRG8
        ldr     r8, [r2, #0xC]
        ldr     r11, [r2, #0x10]
        cmp     r9, #1
        add     r3, r8, r9, lsl #1
        str     r3, [sp, #8]
        add     r3, r3, #2
        str     r3, [sp, #0xC]
        add     r3, r8, #2
        str     r3, [sp, #0x10]
        bgt     LBRG3
        ldrsh   r3, [r8]
        cmp     r9, #0
        mul     r0, r4, r3
        add     r3, r10, #2, 18
        str     r3, [sp, #0x10]
        mov     r1, r0, asr #31
        ble     LBRG45
        ldr     r12, [r11]
        ldr     r3, [r11, #4]
        mov     r2, r6
        adds    r9, r0, r12
        mov     r12, #1
        adc     r10, r1, r3
        mov     r3, r6, asr #31
        str     r3, [sp, #0xC]
        sub     r3, r6, #1
        mov     r3, r12, lsl r3
        sub     r3, r3, #1
        str     r3, [sp, #4]
        ldr     r3, [sp, #0xC]
        mov     r0, r9
        mov     r1, r10
        bl      __ashrdi3
        ldr     lr, [sp, #4]
        and     r12, r0, #1
        ldr     r3, [sp, #0xC]
        adds    r0, r9, lr
        adc     lr, r10, lr, asr #31
        adds    r0, r0, r12
        adc     r1, lr, #0
        mov     r2, r6
        bl      __ashrdi3
        ldr     r3, [sp, #0x10]
        subs    r3, r0, r3
        sbcs    r12, r1, #0
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        mvn     r3, #0
        addne   r3, r3, #2, 18
        strne   r3, [sp, #0x10]
        bne     LBRG1
        cmp     r0, r3, lsl #15
        sbcs    r1, r1, r3
        movlt   r3, r3, lsl #15
        strlt   r3, [sp, #0x10]
        blt     LBRG1
        mov     r0, r0, lsl #16
        mov     r3, r0, asr #16
        str     r3, [sp, #0x10]
LBRG1:
        sub     r3, r5, #1
        mov     r12, #1
        mov     r3, r12, lsl r3
        sub     r12, r3, #1
        mov     r0, r9
        adds    r9, r12, r9
        str     r9, [sp, #0xC]
        mov     r6, r5, asr #31
        mov     r1, r10
        mov     r2, r5
        mov     r3, r6
        adc     r9, r10, r12, asr #31
        bl      __ashrdi3
        ldr     lr, [sp, #0xC]
        and     r12, r0, #1
        adds    r0, lr, r12
        adc     r1, r9, #0
        mov     r2, r5
        mov     r3, r6
        bl      __ashrdi3
        mvn     r2, #0
        add     r3, r2, #2, 18
        subs    r3, r0, r3
        sbcs    r12, r1, #0
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        addne   r2, r2, #2, 18
        bne     LBRG2
        cmp     r0, r2, lsl #15
        sbcs    r1, r1, r2
        movge   r0, r0, lsl #16
        movge   r2, r0, asr #16
        movlt   r2, r2, lsl #15
LBRG2:
        strh    r2, [r7]
        ldr     r1, [sp, #8]
        ldrsh   r8, [r8, #2]
        ldr     r2, [sp, #0x10]
        ldrsh   r1, [r1, #2]
        rsb     r1, r1, #0
        mul     r2, r1, r2
        mla     r2, r4, r8, r2
        mov     r0, r2, asr #31
        str     r0, [r11, #4]
        str     r2, [r11]
        mov     r0, #0
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LBRG3:
        ldrsh   r8, [r8]
        ldr     lr, [r11]
        ldr     r12, [r11, #4]
        mul     r3, r4, r8
        mov     r2, r6
        adds    r8, r3, lr
        str     r8, [sp, #8]
        mov     r0, r8
        adc     r1, r12, r3, asr #31
        sub     r12, r6, #1
        mov     r3, r6, asr #31
        mov     lr, #1
        str     r1, [sp, #4]
        str     r3, [sp, #0x18]
        mov     r12, lr, lsl r12
        str     r12, [sp, #0x1C]
        bl      __ashrdi3
        ldr     r3, [sp, #0x1C]
        ldr     r12, [sp, #4]
        sub     r3, r3, #1
        adds    r8, r8, r3
        and     r0, r0, #1
        adc     r3, r12, r3, asr #31
        adds    r0, r8, r0
        adc     r1, r3, #0
        ldr     r3, [sp, #0x18]
        mov     r2, r6
        bl      __ashrdi3
        add     r3, r10, #2, 18
        subs    r3, r0, r3
        sbcs    r12, r1, #0
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        addne   r10, r10, #2, 18
        bne     LBRG4
        mvn     r3, #0
        cmp     r0, r3, lsl #15
        sbcs    r1, r1, r3
        movge   r0, r0, lsl #16
        movge   r10, r0, asr #16
        movlt   r10, r3, lsl #15
LBRG4:
        ldr     r0, [sp, #8]
        sub     r3, r5, #1
        mov     r12, #1
        ldr     r1, [sp, #4]
        mov     r3, r12, lsl r3
        sub     r12, r3, #1
        adds    lr, r0, r12
        str     lr, [sp, #0x1C]
        adc     r8, r1, r12, asr #31
        mov     r6, r5, asr #31
        mov     r2, r5
        mov     r3, r6
        bl      __ashrdi3
        ldr     lr, [sp, #0x1C]
        and     r12, r0, #1
        adds    r0, lr, r12
        adc     r1, r8, #0
        mov     r2, r5
        mov     r3, r6
        bl      __ashrdi3
        mvn     r2, #0
        add     r3, r2, #2, 18
        subs    r3, r0, r3
        sbcs    r12, r1, #0
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        addne   r2, r2, #2, 18
        bne     LBRG5
        cmp     r0, r2, lsl #15
        sbcs    r1, r1, r2
        movge   r0, r0, lsl #16
        movge   r2, r0, asr #16
        movlt   r2, r2, lsl #15
LBRG5:
        sub     r1, r9, #1
        cmp     r1, #0
        strh    r2, [r7]
        ble     LBRG7
        ldr     r2, [sp, #0x10]
        ldr     r1, [sp, #0xC]
        mov     r8, #0
        sub     r7, r9, #1
        rsb     r6, r10, #0
        sub     r5, r11, #4
        add     lr, r11, #4
LBRG6:
        ldrsh   r3, [r1], #2
        ldrsh   r0, [r2], #2
        ldr     r12, [lr, #4]
        mul     r3, r6, r3
        add     r8, r8, #1
        mla     r3, r4, r0, r3
        ldr     r0, [lr, #8]!
        adds    r12, r3, r12
        str     r12, [r5, #4]
        adc     r3, r0, r3, asr #31
        str     r3, [r5, #8]!
        cmp     r8, r7
        blt     LBRG6
LBRG7:
        ldr     r2, [sp, #0xC]
        mov     r1, r9, lsl #1
        sub     r1, r1, #2
        ldrsh   r2, [r2, +r1]
        ldr     r3, [sp, #0x10]
        mov     r9, r9, lsl #3
        rsb     r2, r2, #0
        mul     r10, r2, r10
        ldrsh   r1, [r3, +r1]
        sub     r9, r9, #8
        add     r2, r9, r11
        mla     r10, r4, r1, r10
        str     r10, [r11, +r9]
        mov     r10, r10, asr #31
        str     r10, [r2, #4]
        mov     r0, #0
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LBRG8:
        ldr     r12, [pc, #0xC1C]
        cmp     r3, #0
        ldr     r12, [r12]
        str     r12, [sp, #0x28]
        andge   r3, r3, #0x7F
        subge   r5, r12, r3, lsl #23
        blt     LBRG52
LBRG9:
        ldr     r6, [r2, #4]
        ldr     r8, [r2, #8]
        str     r5, [sp, #0x28]
        add     r11, r6, r9, lsl #2
        add     r2, r11, #4
        str     r2, [sp, #0xC]
        add     r2, r6, #4
        cmp     r9, #1
        str     r2, [sp, #8]
        bgt     LBRG13
        cmp     r9, #0
        ble     LBRG47
        mov     r0, r4
        bl      __floatsisf
        ldr     r1, [r6]
        mov     r4, r0
        bl      __mulsf3
        ldr     r1, [r8]
        bl      __addsf3
        mov     r1, r5
        bl      __mulsf3
        ldr     r2, [pc, #0xBB0]
        mov     r5, r0
        ldr     r1, [r2]
        bl      __gtsf2
        cmp     r0, #0
        addgt   r10, r10, #2, 18
        bgt     LBRG12
        ldr     r2, [pc, #0xB98]
        mov     r0, r5
        ldr     r1, [r2]
        bl      __ltsf2
        cmp     r0, #0
        movlt   r10, r10, lsl #15
        blt     LBRG12
        ldr     r2, [pc, #0xB80]
        mov     r0, r5
        ldr     r9, [r2]
        mov     r1, r9
        bl      __gtsf2
        cmp     r0, #0
        ble     LBRG10
        ldr     r2, [pc, #0xB68]
        mov     r1, r5
        ldr     r0, [r2]
        bl      __addsf3
        mov     r5, r0
LBRG10:
        mov     r0, r5
        mov     r1, r9
        bl      __ltsf2
        cmp     r0, #0
        bge     LBRG11
        ldr     r2, [pc, #0xB40]
        mov     r0, r5
        ldr     r1, [r2]
        bl      __subsf3
        mov     r5, r0
LBRG11:
        mov     r0, r5
        bl      __fixsfsi
        mov     r0, r0, lsl #16
        mov     r10, r0, asr #16
LBRG12:
        strh    r10, [r7]
        ldr     r0, [r6, #4]
        mov     r1, r4
        bl      __mulsf3
        ldr     r11, [r11, #4]
        mov     r4, r0
        mov     r0, r10
        bl      __floatsisf
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r4
        bl      __subsf3
        str     r0, [r8]
        mov     r0, #0
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LBRG13:
        mov     r0, r4
        bl      __floatsisf
        ldr     r1, [r6]
        mov     r4, r0
        bl      __mulsf3
        ldr     r1, [r8]
        bl      __addsf3
        mov     r1, r5
        bl      __mulsf3
        ldr     r2, [pc, #0xAA8]
        mov     r5, r0
        ldr     r1, [r2]
        bl      __gtsf2
        cmp     r0, #0
        addgt   r0, r10, #2, 18
        bgt     LBRG16
        ldr     r2, [pc, #0xA90]
        mov     r0, r5
        ldr     r1, [r2]
        bl      __ltsf2
        cmp     r0, #0
        movlt   r0, r10, lsl #15
        blt     LBRG16
        ldr     r2, [pc, #0xA78]
        mov     r0, r5
        ldr     r6, [r2]
        mov     r1, r6
        bl      __gtsf2
        cmp     r0, #0
        ble     LBRG14
        ldr     r2, [pc, #0xA60]
        mov     r1, r5
        ldr     r0, [r2]
        bl      __addsf3
        mov     r5, r0
LBRG14:
        mov     r0, r5
        mov     r1, r6
        bl      __ltsf2
        cmp     r0, #0
        bge     LBRG15
        ldr     r2, [pc, #0xA38]
        mov     r0, r5
        ldr     r1, [r2]
        bl      __subsf3
        mov     r5, r0
LBRG15:
        mov     r0, r5
        bl      __fixsfsi
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
LBRG16:
        sub     r2, r9, #1
        cmp     r2, #0
        strh    r0, [r7]
        ble     LBRG51
        bl      __floatsisf
        ldr     r7, [sp, #8]
        ldr     r6, [sp, #0xC]
        sub     r2, r9, #1
        str     r9, [sp]
        ldr     r9, [sp, #0x10]
        mov     r5, r0
        add     r11, r8, #4
        mov     r10, r8
        str     r2, [sp, #0x14]
        str     r8, [sp, #4]
LBRG17:
        ldr     r0, [r7], #4
        mov     r1, r4
        bl      __mulsf3
        mov     r8, r0
        ldr     r0, [r6], #4
        mov     r1, r5
        add     r9, r9, #1
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r8
        bl      __subsf3
        ldr     r1, [r11], #4
        bl      __addsf3
        str     r0, [r10], #4
        ldr     r2, [sp, #0x14]
        cmp     r9, r2
        blt     LBRG17
        ldr     r8, [sp, #4]
        ldr     r9, [sp]
LBRG18:
        ldr     r2, [sp, #8]
        mov     r9, r9, lsl #2
        sub     r6, r9, #4
        ldr     r0, [r2, +r6]
        mov     r1, r4
        bl      __mulsf3
        ldr     r2, [sp, #0xC]
        mov     r4, r0
        mov     r1, r5
        ldr     r2, [r2, +r6]
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r4
        bl      __subsf3
        str     r0, [r8, +r6]
        mov     r0, #0
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LBRG19:
        ldr     r12, [pc, #0x930]
        cmp     r3, #0
        ldr     r12, [r12]
        str     r12, [sp, #0x20]
        andge   r3, r3, #0x7F
        subge   r5, r12, r3, lsl #23
        blt     LBRG58
LBRG20:
        ldr     r6, [r2, #4]
        ldr     r8, [r2, #8]
        str     r5, [sp, #0x20]
        add     r11, r6, r9, lsl #2
        add     r2, r11, #4
        str     r2, [sp, #0xC]
        add     r2, r6, #4
        cmp     r9, #1
        str     r2, [sp, #8]
        bgt     LBRG24
        cmp     r9, #0
        ble     LBRG53
        mov     r0, r4
        bl      __floatsisf
        ldr     r1, [r6]
        mov     r4, r0
        bl      __mulsf3
        ldr     r1, [r8]
        bl      __addsf3
        mov     r1, r5
        bl      __mulsf3
        ldr     r2, [pc, #0x8C4]
        mov     r5, r0
        ldr     r1, [r2]
        bl      __gtsf2
        cmp     r0, #0
        addgt   r10, r10, #2, 18
        bgt     LBRG23
        ldr     r2, [pc, #0x8AC]
        mov     r0, r5
        ldr     r1, [r2]
        bl      __ltsf2
        cmp     r0, #0
        movlt   r10, r10, lsl #15
        blt     LBRG23
        ldr     r2, [pc, #0x894]
        mov     r0, r5
        ldr     r9, [r2]
        mov     r1, r9
        bl      __gtsf2
        cmp     r0, #0
        ble     LBRG21
        ldr     r2, [pc, #0x87C]
        mov     r1, r5
        ldr     r0, [r2]
        bl      __addsf3
        mov     r5, r0
LBRG21:
        mov     r0, r5
        mov     r1, r9
        bl      __ltsf2
        cmp     r0, #0
        bge     LBRG22
        ldr     r2, [pc, #0x854]
        mov     r0, r5
        ldr     r1, [r2]
        bl      __subsf3
        mov     r5, r0
LBRG22:
        mov     r0, r5
        bl      __fixsfsi
        mov     r0, r0, lsl #16
        mov     r10, r0, asr #16
LBRG23:
        strh    r10, [r7]
        ldr     r0, [r6, #4]
        mov     r1, r4
        bl      __mulsf3
        ldr     r11, [r11, #4]
        mov     r4, r0
        mov     r0, r10
        bl      __floatsisf
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r4
        bl      __subsf3
        str     r0, [r8]
        mov     r0, #0
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LBRG24:
        mov     r0, r4
        bl      __floatsisf
        ldr     r1, [r6]
        mov     r4, r0
        bl      __mulsf3
        ldr     r1, [r8]
        bl      __addsf3
        mov     r1, r5
        bl      __mulsf3
        ldr     r2, [pc, #0x7BC]
        mov     r5, r0
        ldr     r1, [r2]
        bl      __gtsf2
        cmp     r0, #0
        addgt   r0, r10, #2, 18
        bgt     LBRG27
        ldr     r2, [pc, #0x7A4]
        mov     r0, r5
        ldr     r1, [r2]
        bl      __ltsf2
        cmp     r0, #0
        movlt   r0, r10, lsl #15
        blt     LBRG27
        ldr     r2, [pc, #0x78C]
        mov     r0, r5
        ldr     r6, [r2]
        mov     r1, r6
        bl      __gtsf2
        cmp     r0, #0
        ble     LBRG25
        ldr     r2, [pc, #0x774]
        mov     r1, r5
        ldr     r0, [r2]
        bl      __addsf3
        mov     r5, r0
LBRG25:
        mov     r0, r5
        mov     r1, r6
        bl      __ltsf2
        cmp     r0, #0
        bge     LBRG26
        ldr     r2, [pc, #0x74C]
        mov     r0, r5
        ldr     r1, [r2]
        bl      __subsf3
        mov     r5, r0
LBRG26:
        mov     r0, r5
        bl      __fixsfsi
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
LBRG27:
        sub     r2, r9, #1
        cmp     r2, #0
        strh    r0, [r7]
        ble     LBRG57
        bl      __floatsisf
        ldr     r7, [sp, #8]
        ldr     r6, [sp, #0xC]
        sub     r2, r9, #1
        str     r9, [sp]
        ldr     r9, [sp, #0x10]
        mov     r5, r0
        add     r11, r8, #4
        mov     r10, r8
        str     r2, [sp, #0x14]
        str     r8, [sp, #4]
LBRG28:
        ldr     r0, [r7], #4
        mov     r1, r4
        bl      __mulsf3
        mov     r8, r0
        ldr     r0, [r6], #4
        mov     r1, r5
        add     r9, r9, #1
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r8
        bl      __subsf3
        ldr     r1, [r11], #4
        bl      __addsf3
        str     r0, [r10], #4
        ldr     r2, [sp, #0x14]
        cmp     r9, r2
        blt     LBRG28
        ldr     r8, [sp, #4]
        ldr     r9, [sp]
LBRG29:
        ldr     r2, [sp, #8]
        mov     r9, r9, lsl #2
        sub     r6, r9, #4
        ldr     r0, [r2, +r6]
        mov     r1, r4
        bl      __mulsf3
        ldr     r2, [sp, #0xC]
        mov     r4, r0
        mov     r1, r5
        ldr     r2, [r2, +r6]
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r4
        bl      __subsf3
        str     r0, [r8, +r6]
        mov     r0, #0
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LBRG30:
        ldr     r6, [r2, #0x28]
        cmp     r6, #6
        bge     LBRG38
        cmp     r5, #0
        blt     LBRG31
        cmp     r5, #0x1F
        bgt     LBRG31
        mov     r0, r4
        mov     r1, r7
        bl      LBRG_ownsIIRBQOne32f_16s_Sfs
        mov     r0, #0
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LBRG31:
        ldr     r12, [pc, #0x610]
        ldr     r5, [r2, #4]
        ldr     r8, [r2, #8]
        ldr     r12, [r12]
        cmp     r3, #0
        str     r12, [sp, #0x2C]
        andge   r3, r3, #0x7F
        subge   r9, r12, r3, lsl #23
        blt     LBRG59
LBRG32:
        ldr     r2, [pc, #0x5F8]
        str     r9, [sp, #0x2C]
        mov     r0, r4
        ldr     r11, [r2]
        bl      __floatsisf
        cmp     r6, #0
        mov     r4, r11
        mov     r1, r0
        ble     LBRG34
        str     r9, [sp, #0x10]
        add     r3, r5, #4
        add     r2, r5, #0xC
        add     lr, r5, #8
        add     r12, r5, #0x10
        str     r11, [sp, #0xC]
        str     r7, [sp, #0x14]
        mov     r9, r5
        add     r10, r8, #4
        str     r12, [sp]
        str     lr, [sp, #4]
        str     r0, [sp, #8]
        mov     r11, r1
        mov     r5, r2
        mov     r7, r3
LBRG33:
        ldr     r0, [r9], #0x14
        ldr     r1, [sp, #8]
        bl      __mulsf3
        ldr     r1, [r8]
        bl      __addsf3
        mov     r4, r0
        ldr     r0, [r7], #0x14
        mov     r1, r11
        bl      __mulsf3
        str     r0, [sp, #0x1C]
        ldr     r0, [r5], #0x14
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x1C]
        bl      __subsf3
        ldr     r1, [r10]
        bl      __addsf3
        str     r0, [r8], #8
        ldr     r12, [sp, #4]
        mov     r1, r11
        ldr     r0, [r12], #0x14
        str     r12, [sp, #4]
        bl      __mulsf3
        ldr     r12, [sp]
        mov     r11, r0
        mov     r1, r4
        ldr     r0, [r12], #0x14
        str     r12, [sp]
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        str     r0, [r10], #8
        subs    r6, r6, #1
        mov     r11, r4
        bne     LBRG33
        ldr     r11, [sp, #0xC]
        ldr     r9, [sp, #0x10]
        ldr     r7, [sp, #0x14]
LBRG34:
        mov     r0, r4
        mov     r1, r9
        bl      __mulsf3
        ldr     r2, [pc, #0x4E4]
        mov     r4, r0
        mvn     r5, #0
        ldr     r1, [r2]
        bl      __gtsf2
        cmp     r0, #0
        addgt   r0, r5, #2, 18
        bgt     LBRG37
        ldr     r2, [pc, #0x4C8]
        mov     r0, r4
        ldr     r1, [r2]
        bl      __ltsf2
        cmp     r0, #0
        movlt   r0, r5, lsl #15
        blt     LBRG37
        mov     r0, r4
        mov     r1, r11
        bl      __gtsf2
        cmp     r0, #0
        ble     LBRG35
        ldr     r2, [pc, #0x4A0]
        mov     r1, r4
        ldr     r0, [r2]
        bl      __addsf3
        mov     r4, r0
LBRG35:
        mov     r0, r4
        mov     r1, r11
        bl      __ltsf2
        cmp     r0, #0
        bge     LBRG36
        ldr     r2, [pc, #0x478]
        mov     r0, r4
        ldr     r1, [r2]
        bl      __subsf3
        mov     r4, r0
LBRG36:
        mov     r0, r4
        bl      __fixsfsi
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
LBRG37:
        strh    r0, [r7]
        mov     r0, #0
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LBRG38:
        ldr     r12, [pc, #0x434]
        ldr     r5, [r2, #4]
        ldr     r8, [r2, #8]
        ldr     r12, [r12]
        cmp     r3, #0
        str     r12, [sp, #0x24]
        andge   r3, r3, #0x7F
        subge   r9, r12, r3, lsl #23
        blt     LBRG60
LBRG39:
        ldr     r2, [pc, #0x41C]
        str     r9, [sp, #0x24]
        mov     r0, r4
        ldr     r11, [r2]
        bl      __floatsisf
        cmp     r6, #0
        mov     r4, r11
        mov     r1, r0
        ble     LBRG41
        str     r9, [sp, #0x10]
        add     r2, r5, #4
        add     r3, r5, #0xC
        add     lr, r5, #8
        add     r12, r5, #0x10
        str     r11, [sp, #0xC]
        str     r7, [sp, #0x14]
        mov     r9, r5
        add     r10, r8, #4
        str     r12, [sp]
        str     lr, [sp, #4]
        str     r0, [sp, #8]
        mov     r11, r1
        mov     r7, r2
        mov     r5, r3
LBRG40:
        ldr     r0, [r9], #0x14
        ldr     r1, [sp, #8]
        bl      __mulsf3
        ldr     r1, [r8]
        bl      __addsf3
        mov     r4, r0
        ldr     r0, [r7], #0x14
        mov     r1, r11
        bl      __mulsf3
        str     r0, [sp, #0x1C]
        ldr     r0, [r5], #0x14
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x1C]
        bl      __subsf3
        ldr     r1, [r10]
        bl      __addsf3
        str     r0, [r8], #8
        ldr     r12, [sp, #4]
        mov     r1, r11
        ldr     r0, [r12], #0x14
        str     r12, [sp, #4]
        bl      __mulsf3
        ldr     r12, [sp]
        mov     r11, r0
        mov     r1, r4
        ldr     r0, [r12], #0x14
        str     r12, [sp]
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        str     r0, [r10], #8
        subs    r6, r6, #1
        mov     r11, r4
        bne     LBRG40
        ldr     r11, [sp, #0xC]
        ldr     r9, [sp, #0x10]
        ldr     r7, [sp, #0x14]
LBRG41:
        mov     r0, r4
        mov     r1, r9
        bl      __mulsf3
        ldr     r2, [pc, #0x308]
        mov     r4, r0
        mvn     r5, #0
        ldr     r1, [r2]
        bl      __gtsf2
        cmp     r0, #0
        addgt   r0, r5, #2, 18
        bgt     LBRG44
        ldr     r2, [pc, #0x2EC]
        mov     r0, r4
        ldr     r1, [r2]
        bl      __ltsf2
        cmp     r0, #0
        movlt   r0, r5, lsl #15
        blt     LBRG44
        mov     r0, r4
        mov     r1, r11
        bl      __gtsf2
        cmp     r0, #0
        ble     LBRG42
        ldr     r2, [pc, #0x2C4]
        mov     r1, r4
        ldr     r0, [r2]
        bl      __addsf3
        mov     r4, r0
LBRG42:
        mov     r0, r4
        mov     r1, r11
        bl      __ltsf2
        cmp     r0, #0
        bge     LBRG43
        ldr     r2, [pc, #0x29C]
        mov     r0, r4
        ldr     r1, [r2]
        bl      __subsf3
        mov     r4, r0
LBRG43:
        mov     r0, r4
        bl      __fixsfsi
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
LBRG44:
        strh    r0, [r7]
        mov     r0, #0
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LBRG45:
        sub     r3, r5, #1
        mov     r12, #1
        mov     r3, r12, lsl r3
        sub     r12, r3, #1
        adds    r6, r12, r0
        mov     r4, r5, asr #31
        adc     r8, r1, r12, asr #31
        mov     r2, r5
        mov     r3, r4
        bl      __ashrdi3
        and     r0, r0, #1
        adds    r0, r6, r0
        adc     r1, r8, #0
        mov     r2, r5
        mov     r3, r4
        bl      __ashrdi3
        ldr     r2, [sp, #0x10]
        subs    r2, r0, r2
        sbcs    r3, r1, #0
        movlt   r2, #0
        movlt   r3, #0
        orrs    r3, r2, r3
        addne   r10, r10, #2, 18
        bne     LBRG46
        cmp     r0, r10, lsl #15
        sbcs    r1, r1, r10
        movge   r0, r0, lsl #16
        movge   r10, r0, asr #16
        movlt   r10, r10, lsl #15
LBRG46:
        strh    r10, [r7]
        mov     r0, #0
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LBRG47:
        mov     r0, r4
        bl      __floatsisf
        ldr     r1, [r6]
        bl      __mulsf3
        mov     r1, r5
        bl      __mulsf3
        ldr     r2, [pc, #0x1C0]
        mov     r4, r0
        ldr     r1, [r2]
        bl      __gtsf2
        cmp     r0, #0
        addgt   r0, r10, #2, 18
        bgt     LBRG50
        ldr     r2, [pc, #0x1A8]
        mov     r0, r4
        ldr     r1, [r2]
        bl      __ltsf2
        cmp     r0, #0
        movlt   r0, r10, lsl #15
        blt     LBRG50
        ldr     r2, [pc, #0x190]
        mov     r0, r4
        ldr     r5, [r2]
        mov     r1, r5
        bl      __gtsf2
        cmp     r0, #0
        ble     LBRG48
        ldr     r2, [pc, #0x178]
        mov     r1, r4
        ldr     r0, [r2]
        bl      __addsf3
        mov     r4, r0
LBRG48:
        mov     r0, r4
        mov     r1, r5
        bl      __ltsf2
        cmp     r0, #0
        bge     LBRG49
        ldr     r2, [pc, #0x150]
        mov     r0, r4
        ldr     r1, [r2]
        bl      __subsf3
        mov     r4, r0
LBRG49:
        mov     r0, r4
        bl      __fixsfsi
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
LBRG50:
        strh    r0, [r7]
        mov     r0, #0
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LBRG51:
        bl      __floatsisf
        mov     r5, r0
        b       LBRG18
LBRG52:
        rsb     r3, r3, #0
        and     r3, r3, #0x7F
        add     r5, r12, r3, lsl #23
        b       LBRG9
LBRG53:
        mov     r0, r4
        bl      __floatsisf
        ldr     r1, [r6]
        bl      __mulsf3
        mov     r1, r5
        bl      __mulsf3
        ldr     r2, [pc, #0xDC]
        mov     r4, r0
        ldr     r1, [r2]
        bl      __gtsf2
        cmp     r0, #0
        addgt   r0, r10, #2, 18
        bgt     LBRG56
        ldr     r2, [pc, #0xC4]
        mov     r0, r4
        ldr     r1, [r2]
        bl      __ltsf2
        cmp     r0, #0
        movlt   r0, r10, lsl #15
        blt     LBRG56
        ldr     r2, [pc, #0xAC]
        mov     r0, r4
        ldr     r5, [r2]
        mov     r1, r5
        bl      __gtsf2
        cmp     r0, #0
        ble     LBRG54
        ldr     r2, [pc, #0x94]
        mov     r1, r4
        ldr     r0, [r2]
        bl      __addsf3
        mov     r4, r0
LBRG54:
        mov     r0, r4
        mov     r1, r5
        bl      __ltsf2
        cmp     r0, #0
        bge     LBRG55
        ldr     r2, [pc, #0x6C]
        mov     r0, r4
        ldr     r1, [r2]
        bl      __subsf3
        mov     r4, r0
LBRG55:
        mov     r0, r4
        bl      __fixsfsi
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
LBRG56:
        strh    r0, [r7]
        mov     r0, #0
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LBRG57:
        bl      __floatsisf
        mov     r5, r0
        b       LBRG29
LBRG58:
        rsb     r3, r3, #0
        and     r3, r3, #0x7F
        add     r5, r12, r3, lsl #23
        b       LBRG20
LBRG59:
        rsb     r3, r3, #0
        and     r2, r3, #0x7F
        add     r9, r12, r2, lsl #23
        b       LBRG32
        .long   0x49493036
        .long   LBRG__2il0floatpacket.1
        .long   LBRG__2il0floatpacket.3
        .long   LBRG__2il0floatpacket.4
        .long   LBRG__2il0floatpacket.2
        .long   LBRG__2il0floatpacket.5
LBRG60:
        rsb     r3, r3, #0
        and     r2, r3, #0x7F
        add     r9, r12, r2, lsl #23
        b       LBRG39
LBRG61:
        mvn     r0, #7
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LBRG_ownsIIRBQOne32f_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x3C
        ldr     r12, [r2, #0x28]
        ldr     r6, [r2, #0x30]
        ldr     r11, [r2, #0xC]
        ldr     r10, [r2, #0x10]
        sub     lr, r12, #1
        cmp     lr, #0
        str     lr, [sp, #4]
        sub     lr, r6, #1
        mov     r4, #1
        add     r3, r3, r6
        mov     lr, r4, lsl lr
        mov     r7, r0
        str     r1, [sp, #8]
        str     r3, [sp, #0x14]
        ble     LBRG67
        sub     lr, lr, #1
        str     lr, [sp, #0x20]
        mov     r3, lr, asr #31
        str     r3, [sp, #0x1C]
        mov     r3, r6, asr #31
        str     r3, [sp, #0x30]
        add     r0, r11, #2
        add     r3, r11, #4
        add     lr, r11, #8
        add     r5, r11, #6
        mov     r4, r11
        str     r11, [sp, #0xC]
        ldr     r11, [sp, #4]
        mvn     r1, #0
        add     r2, r1, #2, 18
        str     r6, [sp, #0x2C]
        sub     r8, r10, #0xC
        sub     r9, r10, #4
        str     r2, [sp, #0x24]
        str     r1, [sp, #0x18]
        str     lr, [sp, #0x34]
        str     r3, [sp, #0x28]
        str     r10, [sp, #0x10]
        str     r12, [sp]
        mov     r6, r0
LBRG62:
        ldrsh   r1, [r4], #0xA
        mov     r10, r7
        ldr     r3, [r8, #0xC]
        mul     r1, r10, r1
        ldr     r12, [r8, #0x10]
        ldr     r2, [sp, #0x2C]
        adds    r7, r1, r3
        ldr     r3, [sp, #0x30]
        adc     r1, r12, r1, asr #31
        str     r1, [sp, #0x38]
        mov     r0, r7
        bl      __ashrdi3
        ldr     r1, [sp, #0x20]
        ldr     r2, [sp, #0x38]
        ldr     r3, [sp, #0x30]
        adds    r7, r1, r7
        ldr     r1, [sp, #0x1C]
        and     r0, r0, #1
        adc     r1, r1, r2
        ldr     r2, [sp, #0x2C]
        adds    r0, r7, r0
        adc     r1, r1, #0
        bl      __ashrdi3
        ldr     r2, [sp, #0x24]
        subs    r2, r0, r2
        sbcs    r3, r1, #0
        movlt   r2, #0
        movlt   r3, #0
        orrs    r3, r2, r3
        mvnne   r1, #0
        addne   r7, r1, #2, 18
        bne     LBRG63
        mvn     r2, #0
        cmp     r0, r2, lsl #15
        ldr     r2, [sp, #0x18]
        sbcs    r1, r1, r2
        movge   r0, r0, lsl #16
        movge   r7, r0, asr #16
        mvnlt   r1, #0
        movlt   r7, r1, lsl #15
LBRG63:
        ldrsh   r12, [r5], #0xA
        ldrsh   r3, [r6], #0xA
        ldr     r1, [r9, #0xC]
        ldr     r2, [r9, #0x10]
        rsb     r12, r12, #0
        mul     r12, r12, r7
        mla     r12, r10, r3, r12
        adds    r1, r1, r12
        str     r1, [r8, #0xC]
        adc     r12, r2, r12, asr #31
        str     r12, [r8, #0x10]!
        ldr     r2, [sp, #0x34]
        ldr     r12, [sp, #0x28]
        ldrsh   r3, [r2], #0xA
        ldrsh   r1, [r12], #0xA
        str     r2, [sp, #0x34]
        rsb     r3, r3, #0
        mul     r3, r3, r7
        str     r12, [sp, #0x28]
        subs    r11, r11, #1
        mla     r3, r10, r1, r3
        mov     r1, r3, asr #31
        str     r1, [r9, #0x10]
        str     r3, [r9, #0xC]
        add     r9, r9, #0x10
        bne     LBRG62
        ldr     r10, [sp, #0x10]
        ldr     r11, [sp, #0xC]
        ldr     r6, [sp, #0x2C]
        ldr     r12, [sp]
LBRG64:
        mov     r1, r12, lsl #4
        str     r1, [sp, #4]
        sub     r9, r1, #0x10
        ldr     lr, [r9, +r10]
        add     r1, r12, r12, lsl #2
        add     r3, r10, r9
        ldr     r12, [r3, #4]
        mov     r8, r1, lsl #1
        sub     r1, r8, #0xA
        ldrsh   r1, [r11, +r1]
        ldr     r3, [sp, #0x30]
        mvn     r4, #0
        mul     r1, r1, r7
        str     r4, [sp]
        add     r4, r4, #2, 18
        str     r4, [sp, #0x38]
        mov     r2, r6
        adds    r4, lr, r1
        adc     r5, r12, r1, asr #31
        mov     r0, r4
        mov     r1, r5
        bl      __ashrdi3
        ldr     r3, [sp, #0x20]
        ldr     r12, [sp, #0x1C]
        adds    r3, r4, r3
        and     r0, r0, #1
        adc     r12, r5, r12
        adds    r0, r3, r0
        ldr     r3, [sp, #0x30]
        adc     r1, r12, #0
        mov     r2, r6
        bl      __ashrdi3
        ldr     r2, [sp, #0x38]
        subs    r2, r0, r2
        sbcs    r3, r1, #0
        movlt   r2, #0
        movlt   r3, #0
        orrs    r3, r2, r3
        ldrne   r2, [sp]
        addne   r6, r2, #2, 18
        bne     LBRG65
        mvn     r2, #0
        cmp     r0, r2, lsl #15
        sbcs    r1, r1, r2
        movge   r0, r0, lsl #16
        movge   r6, r0, asr #16
        movlt   r6, r2, lsl #15
LBRG65:
        ldr     r2, [sp, #0x14]
        mov     lr, #1
        mov     r0, r4
        sub     r12, r2, #1
        mov     r3, r2, asr #31
        str     r3, [sp, #0x38]
        mov     r12, lr, lsl r12
        str     r12, [sp, #0x34]
        mov     r1, r5
        bl      __ashrdi3
        ldr     r2, [sp, #0x34]
        ldr     r3, [sp, #0x38]
        sub     r2, r2, #1
        adds    r4, r4, r2
        and     r0, r0, #1
        adc     r2, r5, r2, asr #31
        adds    r0, r4, r0
        adc     r1, r2, #0
        ldr     r2, [sp, #0x14]
        bl      __ashrdi3
        mvn     r2, #0
        add     r3, r2, #2, 18
        subs    r3, r0, r3
        sbcs    r12, r1, #0
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        addne   r2, r2, #2, 18
        bne     LBRG66
        cmp     r0, r2, lsl #15
        sbcs    r1, r1, r2
        movge   r0, r0, lsl #16
        movge   r2, r0, asr #16
        movlt   r2, r2, lsl #15
LBRG66:
        ldr     r1, [sp, #8]
        sub     r3, r8, #8
        sub     lr, r8, #6
        strh    r2, [r1]
        ldr     r1, [sp, #4]
        sub     r2, r8, #4
        ldrsh   r2, [r11, +r2]
        ldrsh   r3, [r11, +r3]
        sub     r1, r1, #8
        ldr     r4, [r10, +r1]
        rsb     r2, r2, #0
        mul     r12, r2, r6
        add     r2, r1, r10
        ldr     r5, [r2, #4]
        sub     r8, r8, #2
        mov     r0, #0
        mla     r3, r3, r7, r12
        add     r12, r10, r9
        adds    r4, r4, r3
        str     r4, [r9, +r10]
        adc     r3, r5, r3, asr #31
        str     r3, [r12, #4]
        ldrsh   r8, [r11, +r8]
        ldrsh   lr, [r11, +lr]
        rsb     r8, r8, #0
        mul     r6, r8, r6
        mla     r6, lr, r7, r6
        str     r6, [r10, +r1]
        mov     r6, r6, asr #31
        str     r6, [r2, #4]
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LBRG67:
        sub     lr, lr, #1
        str     lr, [sp, #0x20]
        mov     r1, r6, asr #31
        mov     lr, lr, asr #31
        str     r1, [sp, #0x30]
        str     lr, [sp, #0x1C]
        b       LBRG64


        .data
        .align  4


LBRG__2il0floatpacket.1:
        .byte   0x00,0x00,0x80,0x3F
LBRG__2il0floatpacket.2:
        .byte   0x00,0x00,0x00,0x00
LBRG__2il0floatpacket.3:
        .byte   0x00,0xFE,0xFF,0x46
LBRG__2il0floatpacket.4:
        .byte   0x00,0x00,0x00,0xC7
LBRG__2il0floatpacket.5:
        .byte   0x00,0x00,0x00,0x3F


