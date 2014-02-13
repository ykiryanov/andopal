        .text
        .align  4
        .globl  _ippsIIR32fc_16sc_Sfs


_ippsIIR32fc_16sc_Sfs:
        stmdb   sp!, {r4, r5, lr}
        sub     sp, sp, #8
        ldr     r12, [sp, #0x14]
        cmp     r3, #0
        beq     LBRX6
        cmp     r0, #0
        beq     LBRX6
        cmp     r1, #0
        beq     LBRX6
        cmp     r2, #0
        ble     LBRX7
        ldr     r4, [pc, #0xD90]
        ldr     r5, [r3]
        ldr     lr, [r3, #0x34]
        subs    r4, r5, r4
        add     lr, lr, r12
        beq     LBRX3
        adds    r4, r4, #1
        beq     LBRX0
        mvn     r0, #0x10
        add     sp, sp, #8
        ldmia   sp!, {r4, r5, pc}
LBRX0:
        ldr     r4, [r3, #0x2C]
        cmp     r4, #7
        bge     LBRX2
        cmp     lr, #0
        blt     LBRX1
        cmp     lr, #0x1F
        bgt     LBRX1
        str     r12, [sp]
        bl      LBRX_ownsIIRAR32fc_16sc_Sfs
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4, r5, pc}
LBRX1:
        str     r12, [sp]
        bl      LBRX_refsIIRAR32fc_16sc_Sfs
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4, r5, pc}
LBRX2:
        str     r12, [sp]
        bl      LBRX_refsIIRAR32fc_16sc_Sfs
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4, r5, pc}
LBRX3:
        ldr     r4, [r3, #0x2C]
        cmp     r4, #6
        bge     LBRX5
        cmp     lr, #0
        blt     LBRX4
        cmp     lr, #0x1F
        bgt     LBRX4
        str     r12, [sp]
        bl      LBRX_ownsIIRBQ32fc_16sc_Sfs
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4, r5, pc}
LBRX4:
        str     r12, [sp]
        bl      LBRX_refsIIRBQ32fc_16sc_Sfs
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4, r5, pc}
LBRX5:
        str     r12, [sp]
        bl      LBRX_refsIIRBQ32fc_16sc_Sfs
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4, r5, pc}
LBRX6:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4, r5, pc}
LBRX7:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4, r5, pc}
LBRX_ownsIIRBQ32fc_16sc_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x6C
        ldr     r4, [r3, #0x2C]
        ldr     r12, [r3, #0x34]
        ldr     lr, [sp, #0x90]
        str     r4, [sp, #4]
        ldr     r4, [r3, #0xC]
        cmp     r2, #0
        mov     r6, r0
        str     r4, [sp, #8]
        ldr     r3, [r3, #0x10]
        str     r2, [sp]
        str     r3, [sp, #0xC]
        add     r4, lr, r12
        ble     LBRX19
        sub     r7, r1, #2
        sub     r1, r4, #1
        mov     r3, #1
        mov     r1, r3, lsl r1
        sub     r11, r1, #1
        sub     r1, r12, #1
        mov     r1, r3, lsl r1
        mvn     r3, #0xFF
        mov     lr, #0
        mov     r8, lr
        bic     r3, r3, #0x7F, 24
        mov     r0, r8
        mvn     r10, r3
        sub     r1, r1, #1
        mov     r2, r0
        mov     r3, r12, asr #31
        mvn     r9, #0
        mov     r5, r4, asr #31
        str     r9, [sp, #0x30]
        str     r3, [sp, #0x5C]
        str     r1, [sp, #0x58]
        str     r2, [sp, #0x44]
        str     r0, [sp, #0x4C]
        str     r8, [sp, #0x48]
        str     lr, [sp, #0x34]
        str     r12, [sp, #0x18]
LBRX8:
        ldrsh   r1, [r6]
        str     r1, [sp, #0x10]
        ldrsh   r1, [r6, #2]
        str     r1, [sp, #0x14]
        ldr     r1, [sp, #4]
        cmp     r1, #0
        ble     LBRX14
        ldr     r12, [sp, #8]
        ldr     r1, [sp, #0xC]
        ldr     r3, [sp, #4]
        str     r6, [sp, #0x28]
        sub     r0, r1, #4
        str     r7, [sp, #0x2C]
        str     r4, [sp, #0x1C]
        mov     r6, r0
        ldr     r7, [sp, #0x10]
        ldr     r0, [sp, #0x14]
        ldr     r4, [sp, #0x18]
        sub     r8, r1, #0x14
        add     r1, r12, #0x12
        sub     r2, r12, #0xA
        sub     lr, r12, #0xE
        str     r5, [sp, #0x24]
        add     r9, r12, #0xE
        str     r12, [sp, #0x40]
        str     r3, [sp, #0x3C]
        str     lr, [sp, #0x50]
        str     r2, [sp, #0x54]
        str     r10, [sp, #0x38]
        str     r11, [sp, #0x20]
        mov     r5, r1
LBRX9:
        ldr     r12, [sp, #0x40]
        ldr     r2, [r8, #0x18]
        mov     r10, r0
        ldrsh   r3, [r12, #2]
        ldrsh   r12, [r12]
        mov     r11, r7
        ldr     r7, [r8, #0x20]
        mul     lr, r11, r3
        mul     r1, r11, r12
        mul     r0, r3, r10
        ldr     r3, [r8, #0x14]
        mla     r12, r12, r10, lr
        ldr     lr, [r8, #0x1C]
        str     r7, [sp, #0x4C]
        sub     r1, r1, r0
        adds    r7, r1, r3
        ldr     r3, [sp, #0x5C]
        adc     r1, r2, r1, asr #31
        adds    lr, r12, lr
        str     lr, [sp, #0x48]
        ldr     lr, [sp, #0x4C]
        str     r1, [sp, #0x34]
        str     r7, [sp, #0x44]
        adc     r12, lr, r12, asr #31
        str     r12, [sp, #0x4C]
        mov     r0, r7
        mov     r2, r4
        bl      __ashrdi3
        ldr     r3, [sp, #0x58]
        ldr     r12, [sp, #0x34]
        adds    r7, r7, r3
        and     r0, r0, #1
        adc     r3, r12, r3, asr #31
        adds    r0, r7, r0
        adc     r1, r3, #0
        ldr     r3, [sp, #0x5C]
        mov     r2, r4
        bl      __ashrdi3
        ldr     r3, [sp, #0x38]
        subs    r3, r0, r3
        sbcs    r12, r1, #0
        movlt   r3, #0
        movlt   r12, #0
        orrs    r3, r3, r12
        ldr     r12, [sp, #0x40]
        add     r12, r12, #0x14
        str     r12, [sp, #0x40]
        bne     LBRX10
        mov     r3, #0
        sub     r3, r3, #2, 18
        cmp     r0, r3
        ldr     r3, [sp, #0x30]
        sbcs    r1, r1, r3
        movge   r0, r0, lsl #16
        movge   r7, r0, asr #16
        movlt   r3, #0
        sublt   r7, r3, #2, 18
        b       LBRX11
LBRX10:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r7, r3
LBRX11:
        ldr     r0, [sp, #0x48]
        ldr     r1, [sp, #0x4C]
        ldr     r3, [sp, #0x5C]
        mov     r2, r4
        bl      __ashrdi3
        ldr     r3, [sp, #0x48]
        ldr     r12, [sp, #0x58]
        ldr     lr, [sp, #0x4C]
        adds    r3, r3, r12
        and     r0, r0, #1
        adc     r12, lr, r12, asr #31
        adds    r0, r3, r0
        ldr     r3, [sp, #0x5C]
        adc     r1, r12, #0
        mov     r2, r4
        bl      __ashrdi3
        ldr     r3, [sp, #0x38]
        subs    r3, r0, r3
        sbcs    r12, r1, #0
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        bne     LBRX12
        mov     r3, #0
        sub     r3, r3, #2, 18
        cmp     r0, r3
        ldr     r3, [sp, #0x30]
        sbcs    r1, r1, r3
        movge   r0, r0, lsl #16
        movge   r0, r0, asr #16
        movlt   r3, #0
        sublt   r0, r3, #2, 18
        b       LBRX13
LBRX12:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r0, r3
LBRX13:
        ldr     r12, [sp, #0x50]
        ldrsh   r2, [r9]
        ldrsh   r1, [r9, #-2]
        ldrsh   lr, [r12, #0x12]
        ldrsh   r3, [r12, #0x14]
        str     r1, [sp, #0x60]
        ldr     r1, [r6, #0x14]
        rsb     r2, r2, #0
        mul     r3, r10, r3
        mul     r2, r2, r0
        str     r1, [sp, #0x64]
        mul     r1, r11, lr
        ldr     lr, [r6, #0x18]
        sub     r1, r1, r3
        ldr     r3, [sp, #0x60]
        mla     r2, r3, r7, r2
        ldr     r3, [sp, #0x64]
        sub     r1, r1, r2
        adds    r3, r3, r1
        str     r3, [r8, #0x14]
        adc     r1, lr, r1, asr #31
        str     r1, [r8, #0x18]
        ldrsh   lr, [r9, #-2]
        ldrsh   r1, [r12, #0x14]
        ldrsh   r2, [r9], #0x14
        mul     lr, lr, r0
        ldrsh   r3, [r12, #0x12]
        mul     r1, r11, r1
        str     r2, [sp, #0x64]
        str     lr, [sp, #0x60]
        ldr     r2, [r6, #0x20]
        ldr     lr, [r6, #0x1C]
        mla     r1, r10, r3, r1
        ldr     r3, [sp, #0x64]
        str     r2, [sp, #0x68]
        ldr     r2, [sp, #0x60]
        add     r12, r12, #0x14
        str     r12, [sp, #0x50]
        mla     r3, r3, r7, r2
        sub     r1, r1, r3
        adds    lr, lr, r1
        str     lr, [r8, #0x1C]
        ldr     r3, [sp, #0x68]
        adc     r1, r3, r1, asr #31
        str     r1, [r8, #0x20]!
        ldr     lr, [sp, #0x54]
        ldrsh   r2, [r5]
        ldrsh   r3, [r5, #-2]
        ldrsh   r12, [lr, #0x12]
        ldrsh   r1, [lr, #0x14]
        str     r3, [sp, #0x68]
        rsb     r2, r2, #0
        mul     r3, r2, r0
        mul     r12, r11, r12
        ldr     r2, [sp, #0x68]
        str     r12, [sp, #0x64]
        mul     r12, r10, r1
        ldr     r1, [sp, #0x3C]
        mla     r3, r2, r7, r3
        ldr     r2, [sp, #0x64]
        subs    r1, r1, #1
        str     r1, [sp, #0x3C]
        sub     r2, r2, r12
        sub     r2, r2, r3
        str     r2, [r6, #0x14]
        mov     r3, r2, asr #31
        str     r3, [r6, #0x18]
        ldrsh   r2, [lr, #0x14]
        ldrsh   r3, [r5, #-2]
        ldrsh   r12, [lr, #0x12]
        mul     r11, r11, r2
        ldrsh   r2, [r5], #0x14
        mul     r3, r3, r0
        add     lr, lr, #0x14
        mla     r11, r10, r12, r11
        str     lr, [sp, #0x54]
        mla     r3, r2, r7, r3
        sub     r11, r11, r3
        str     r11, [r6, #0x1C]
        mov     r3, r11, asr #31
        str     r3, [r6, #0x20]!
        bne     LBRX9
        ldr     r7, [sp, #0x2C]
        ldr     r6, [sp, #0x28]
        ldr     r10, [sp, #0x38]
        ldr     r5, [sp, #0x24]
        ldr     r11, [sp, #0x20]
        ldr     r4, [sp, #0x1C]
LBRX14:
        ldr     r9, [sp, #0x44]
        ldr     r8, [sp, #0x34]
        mov     r2, r4
        mov     r0, r9
        mov     r3, r5
        mov     r1, r8
        bl      __ashrdi3
        adds    r9, r9, r11
        and     r0, r0, #1
        adc     r8, r8, r11, asr #31
        adds    r0, r9, r0
        adc     r1, r8, #0
        mov     r2, r4
        mov     r3, r5
        bl      __ashrdi3
        subs    r12, r0, r10
        sbcs    lr, r1, #0
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        bne     LBRX15
        mov     r12, #0
        sub     r12, r12, #2, 18
        cmp     r0, r12
        ldr     r12, [sp, #0x30]
        sbcs    r1, r1, r12
        movge   r0, r0, lsl #16
        movge   r0, r0, asr #16
        movlt   r1, #0
        sublt   r0, r1, #2, 18
        b       LBRX16
LBRX15:
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r0, r1
LBRX16:
        strh    r0, [r7, #2]
        ldr     r9, [sp, #0x48]
        ldr     r8, [sp, #0x4C]
        mov     r2, r4
        mov     r0, r9
        mov     r3, r5
        mov     r1, r8
        bl      __ashrdi3
        adds    r9, r11, r9
        and     r0, r0, #1
        adc     r8, r8, r11, asr #31
        adds    r0, r9, r0
        adc     r1, r8, #0
        mov     r2, r4
        mov     r3, r5
        bl      __ashrdi3
        subs    r12, r0, r10
        sbcs    lr, r1, #0
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        bne     LBRX17
        mov     r12, #0
        sub     r12, r12, #2, 18
        cmp     r0, r12
        ldr     r12, [sp, #0x30]
        sbcs    r1, r1, r12
        movge   r0, r0, lsl #16
        movge   r0, r0, asr #16
        mvnlt   r1, #0xFF
        biclt   r0, r1, #0x7F, 24
        b       LBRX18
LBRX17:
        mov     r1, #0
        sub     r1, r1, #2, 18
        mvn     r0, r1
LBRX18:
        strh    r0, [r7, #4]!
        ldr     r1, [sp]
        add     r6, r6, #4
        subs    r1, r1, #1
        str     r1, [sp]
        bne     LBRX8
LBRX19:
        mov     r0, #0
        add     sp, sp, #0x6C
        ldmia   sp!, {r4 - r11, pc}
LBRX_refsIIRBQ32fc_16sc_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x4C
        ldr     r12, [pc, #0x75C]
        ldr     r5, [sp, #0x70]
        ldr     r4, [r12]
        ldr     lr, [r3, #0x2C]
        ldr     r12, [r3, #4]
        ldr     r3, [r3, #8]
        cmp     r5, #0
        str     r4, [sp, #0x48]
        mov     r10, r0
        andge   r5, r5, #0x7F
        subge   r9, r4, r5, lsl #23
        blt     LBRX33
LBRX20:
        cmp     r2, #0
        str     r9, [sp, #0x48]
        ble     LBRX32
        ldr     r4, [pc, #0x724]
        ldr     r6, [pc, #0x724]
        ldr     r5, [pc, #0x724]
        ldr     r7, [r4]
        ldr     r4, [pc, #0x720]
        ldr     r8, [r6]
        ldr     r6, [r5]
        ldr     r0, [r4]
        sub     r11, r1, #2
        str     r6, [sp, #0x24]
        str     r3, [sp, #0x14]
        str     r0, [sp, #0x28]
        str     r12, [sp, #0x10]
        str     lr, [sp, #0xC]
        str     r2, [sp, #8]
LBRX21:
        ldrsh   r0, [r10]
        bl      __floatsisf
        ldrsh   r1, [r10, #2]
        str     r0, [sp, #4]
        mov     r0, r1
        bl      __floatsisf
        ldr     r2, [sp, #0xC]
        str     r0, [sp]
        cmp     r2, #0
        ble     LBRX23
        ldr     r4, [sp, #0x10]
        ldr     r2, [sp, #0x14]
        str     r11, [sp, #0x30]
        add     r12, r4, #4
        sub     r1, r4, #0x14
        sub     lr, r2, #0xC
        sub     r3, r2, #4
        sub     r2, r4, #4
        sub     r0, r4, #0xC
        sub     r6, r4, #0x1C
        ldr     r4, [sp, #0xC]
        str     r8, [sp, #0x20]
        str     r7, [sp, #0x1C]
        ldr     r8, [sp]
        ldr     r7, [sp, #4]
        str     r10, [sp, #0x2C]
        str     r9, [sp, #0x18]
        str     r4, [sp, #0x34]
        str     r3, [sp, #0x40]
        str     lr, [sp, #0x3C]
        str     r12, [sp, #0x38]
        mov     r11, r0
        mov     r9, r1
        mov     r10, r2
LBRX22:
        ldr     r12, [sp, #0x38]
        mov     r1, r7
        ldr     r3, [r12, #-4]
        str     r3, [sp, #0x44]
        ldr     r0, [sp, #0x44]
        ldr     r4, [r12]
        bl      __mulsf3
        mov     r5, r0
        mov     r1, r8
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r5
        bl      __subsf3
        ldr     r3, [sp, #0x3C]
        ldr     r1, [r3, #0xC]
        ldr     r3, [sp, #0x38]
        add     r3, r3, #0x28
        str     r3, [sp, #0x38]
        bl      __addsf3
        mov     r5, r0
        ldr     r0, [sp, #0x44]
        mov     r1, r8
        bl      __mulsf3
        str     r0, [sp, #0x44]
        mov     r1, r7
        mov     r0, r4
        bl      __mulsf3
        ldr     r1, [sp, #0x44]
        bl      __addsf3
        ldr     r3, [sp, #0x3C]
        ldr     r1, [r3, #0x10]
        bl      __addsf3
        ldr     r2, [r6, #0x24]
        mov     r4, r0
        mov     r1, r7
        mov     r0, r2
        bl      __mulsf3
        ldr     r2, [r6, #0x28]
        str     r0, [sp, #0x44]
        mov     r0, r2
        mov     r1, r8
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x44]
        bl      __subsf3
        ldr     r2, [r11, #0x24]
        str     r0, [sp, #0x44]
        mov     r0, r2
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x44]
        bl      __subsf3
        ldr     r2, [r11, #0x28]
        str     r0, [sp, #0x44]
        mov     r1, r4
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [sp, #0x44]
        bl      __addsf3
        ldr     r3, [sp, #0x40]
        ldr     r1, [r3, #0xC]
        bl      __addsf3
        ldr     r3, [sp, #0x3C]
        mov     r1, r8
        str     r0, [r3, #0xC]
        ldr     r0, [r6, #0x24]
        bl      __mulsf3
        ldr     r2, [r6, #0x28]!
        str     r0, [sp, #0x44]
        mov     r0, r2
        mov     r1, r7
        bl      __mulsf3
        ldr     r1, [sp, #0x44]
        bl      __addsf3
        ldr     r2, [r11, #0x24]
        str     r0, [sp, #0x44]
        mov     r1, r4
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x44]
        bl      __subsf3
        ldr     r2, [r11, #0x28]!
        str     r0, [sp, #0x44]
        mov     r1, r5
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x44]
        bl      __subsf3
        ldr     r3, [sp, #0x40]
        ldr     r1, [r3, #0x10]
        bl      __addsf3
        ldr     r3, [sp, #0x3C]
        mov     r1, r7
        str     r0, [r3, #0x10]!
        ldr     r0, [r9, #0x24]
        str     r3, [sp, #0x3C]
        bl      __mulsf3
        ldr     r2, [r9, #0x28]
        str     r0, [sp, #0x44]
        mov     r1, r8
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x44]
        bl      __subsf3
        ldr     r2, [r10, #0x24]
        str     r0, [sp, #0x44]
        mov     r1, r5
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x44]
        bl      __subsf3
        ldr     r2, [r10, #0x28]
        str     r0, [sp, #0x44]
        mov     r0, r2
        mov     r1, r4
        bl      __mulsf3
        ldr     r1, [sp, #0x44]
        bl      __addsf3
        ldr     r3, [sp, #0x40]
        mov     r1, r8
        str     r0, [r3, #0xC]
        ldr     r0, [r9, #0x24]
        mov     r8, r4
        bl      __mulsf3
        ldr     r2, [r9, #0x28]!
        str     r0, [sp, #0x44]
        mov     r1, r7
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [sp, #0x44]
        bl      __addsf3
        ldr     r2, [r10, #0x24]
        str     r0, [sp, #0x44]
        mov     r0, r2
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x44]
        mov     r7, r5
        bl      __subsf3
        ldr     r2, [r10, #0x28]!
        str     r0, [sp, #0x44]
        mov     r0, r2
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x44]
        bl      __subsf3
        ldr     r3, [sp, #0x40]
        str     r0, [r3, #0x10]!
        ldr     r12, [sp, #0x34]
        str     r3, [sp, #0x40]
        subs    r12, r12, #1
        str     r12, [sp, #0x34]
        bne     LBRX22
        ldr     r11, [sp, #0x30]
        ldr     r10, [sp, #0x2C]
        ldr     r8, [sp, #0x20]
        ldr     r7, [sp, #0x1C]
        ldr     r9, [sp, #0x18]
LBRX23:
        mov     r0, r5
        mov     r1, r9
        bl      __mulsf3
        mov     r6, r0
        mov     r1, r8
        bl      __gtsf2
        cmp     r0, #0
        movgt   r2, #0xFF
        orrgt   r0, r2, #0x7F, 24
        bgt     LBRX27
        mov     r0, r6
        ldr     r1, [sp, #0x24]
        bl      __ltsf2
        cmp     r0, #0
        blt     LBRX26
        mov     r0, r6
        mov     r1, r7
        bl      __gtsf2
        cmp     r0, #0
        ble     LBRX24
        ldr     r0, [sp, #0x28]
        mov     r1, r6
        bl      __addsf3
        mov     r6, r0
LBRX24:
        mov     r0, r6
        mov     r1, r7
        bl      __ltsf2
        cmp     r0, #0
        bge     LBRX25
        mov     r0, r6
        ldr     r1, [sp, #0x28]
        bl      __subsf3
        mov     r6, r0
LBRX25:
        mov     r0, r6
        bl      __fixsfsi
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LBRX27
LBRX26:
        mov     r2, #0xFF
        orr     r2, r2, #0x7F, 24
        mvn     r0, r2
LBRX27:
        strh    r0, [r11, #2]
        mov     r0, r4
        mov     r1, r9
        bl      __mulsf3
        mov     r6, r0
        mov     r1, r8
        bl      __gtsf2
        cmp     r0, #0
        movgt   r2, #0xFF
        orrgt   r0, r2, #0x7F, 24
        bgt     LBRX31
        mov     r0, r6
        ldr     r1, [sp, #0x24]
        bl      __ltsf2
        cmp     r0, #0
        blt     LBRX30
        mov     r0, r6
        mov     r1, r7
        bl      __gtsf2
        cmp     r0, #0
        ble     LBRX28
        ldr     r0, [sp, #0x28]
        mov     r1, r6
        bl      __addsf3
        mov     r6, r0
LBRX28:
        mov     r0, r6
        mov     r1, r7
        bl      __ltsf2
        cmp     r0, #0
        bge     LBRX29
        mov     r0, r6
        ldr     r1, [sp, #0x28]
        bl      __subsf3
        mov     r6, r0
LBRX29:
        mov     r0, r6
        bl      __fixsfsi
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LBRX31
LBRX30:
        mov     r2, #0xFF
        orr     r2, r2, #0x7F, 24
        mvn     r0, r2
LBRX31:
        strh    r0, [r11, #4]!
        ldr     r2, [sp, #8]
        add     r10, r10, #4
        subs    r2, r2, #1
        str     r2, [sp, #8]
        bne     LBRX21
LBRX32:
        mov     r0, #0
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
LBRX33:
        rsb     r5, r5, #0
        and     r5, r5, #0x7F
        add     r9, r4, r5, lsl #23
        b       LBRX20
LBRX_ownsIIRAR32fc_16sc_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x70
        ldr     r10, [r3, #0xC]
        ldr     lr, [r3, #0x2C]
        ldr     r6, [r3, #0x34]
        ldr     r12, [r3, #0x10]
        ldrsh   r3, [r10]
        ldr     r4, [sp, #0x94]
        str     r3, [sp, #0x18]
        ldrsh   r9, [r10, #2]
        str     r0, [sp, #0x14]
        mov     r0, lr, lsl #2
        add     r3, r10, r0
        str     r3, [sp, #0xC]
        add     r3, r3, #4
        str     r3, [sp]
        add     r3, r10, #4
        cmp     lr, #1
        add     r4, r4, r6
        str     r3, [sp, #8]
        ble     LBRX45
        cmp     r2, #0
        ble     LBRX59
        sub     r0, r0, #4
        str     r0, [sp, #0x2C]
        rsb     r0, r9, #0
        sub     r5, r4, #1
        mov     r7, #1
        str     r0, [sp, #0x30]
        mov     r0, r4, asr #31
        mov     r5, r7, lsl r5
        sub     r3, r6, #1
        str     r0, [sp, #0x28]
        mov     r0, r6, asr #31
        str     r0, [sp, #0x20]
        mov     r7, r7, lsl r3
        mov     r8, lr, lsl #4
        str     r6, [sp, #0x44]
        ldr     r6, [sp, #0x20]
        sub     r5, r5, #1
        mvn     r3, #0
        mov     r11, #0
        str     r5, [sp, #0x24]
        sub     r7, r7, #1
        sub     lr, lr, #1
        sub     r8, r8, #0x10
        str     r11, [sp, #0x34]
        str     r7, [sp, #0x1C]
        add     r5, r3, #2, 18
        str     r3, [sp, #0x5C]
        str     r8, [sp, #0x58]
        str     lr, [sp, #0x54]
        str     r9, [sp, #0x10]
        str     r10, [sp, #0x4C]
        str     r12, [sp, #0x48]
        str     r2, [sp, #4]
        str     r1, [sp, #0x40]
LBRX34:
        ldr     r0, [sp, #0x14]
        ldr     r1, [sp, #0x30]
        ldr     r12, [sp, #0x48]
        ldrsh   r10, [r0, #2]
        ldrsh   lr, [r0]
        ldr     r11, [sp, #0x18]
        ldr     r2, [sp, #0x44]
        mul     r1, r1, r10
        str     lr, [sp, #0x3C]
        mul     r7, r11, r10
        ldr     r0, [r12]
        ldr     r9, [r12, #4]
        mla     r1, r11, lr, r1
        ldr     r11, [sp, #0x10]
        ldr     r8, [r12, #8]
        ldr     r12, [r12, #0xC]
        mla     lr, lr, r11, r7
        adds    r7, r0, r1
        adc     r9, r9, r1, asr #31
        mov     r3, r6
        mov     r0, r7
        adds    r8, r8, lr
        adc     r11, r12, lr, asr #31
        mov     r1, r9
        bl      __ashrdi3
        ldr     lr, [sp, #0x1C]
        ldr     r2, [sp, #0x44]
        and     r0, r0, #1
        adds    r12, r7, lr
        adc     lr, r9, lr, asr #31
        adds    r0, r12, r0
        adc     r1, lr, #0
        mov     r3, r6
        bl      __ashrdi3
        subs    r12, r0, r5
        sbcs    lr, r1, #0
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        bne     LBRX36
        mvn     r12, #0
        cmp     r0, r12, lsl #15
        ldr     r12, [sp, #0x5C]
        sbcs    r1, r1, r12
        bge     LBRX35
        mvn     r12, #0
        mov     r12, r12, lsl #15
        str     r12, [sp, #0x38]
        b       LBRX37
LBRX35:
        mov     r0, r0, lsl #16
        mov     r12, r0, asr #16
        str     r12, [sp, #0x38]
        b       LBRX37
LBRX36:
        mvn     r12, #0
        add     r12, r12, #2, 18
        str     r12, [sp, #0x38]
LBRX37:
        mov     r0, r8
        mov     r1, r11
        ldr     r2, [sp, #0x44]
        mov     r3, r6
        bl      __ashrdi3
        ldr     lr, [sp, #0x1C]
        ldr     r2, [sp, #0x44]
        and     r0, r0, #1
        adds    r12, r8, lr
        adc     lr, r11, lr, asr #31
        adds    r0, r12, r0
        adc     r1, lr, #0
        mov     r3, r6
        bl      __ashrdi3
        subs    r12, r0, r5
        sbcs    lr, r1, #0
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        bne     LBRX39
        mvn     r12, #0
        cmp     r0, r12, lsl #15
        ldr     r12, [sp, #0x5C]
        sbcs    r1, r1, r12
        bge     LBRX38
        mvn     r12, #0
        mov     r12, r12, lsl #15
        str     r12, [sp, #0x64]
        b       LBRX40
LBRX38:
        mov     r0, r0, lsl #16
        mov     r12, r0, asr #16
        str     r12, [sp, #0x64]
        b       LBRX40
        .long   0x49493038
        .long   LBRX__2il0floatpacket.1
        .long   LBRX__2il0floatpacket.2
        .long   LBRX__2il0floatpacket.3
        .long   LBRX__2il0floatpacket.4
        .long   LBRX__2il0floatpacket.5
LBRX39:
        mvn     r12, #0
        add     r12, r12, #2, 18
        str     r12, [sp, #0x64]
LBRX40:
        mov     r0, r7
        mov     r1, r9
        mov     r2, r4
        ldr     r3, [sp, #0x28]
        bl      __ashrdi3
        ldr     r12, [sp, #0x24]
        ldr     r3, [sp, #0x28]
        adds    r7, r12, r7
        and     r0, r0, #1
        adc     r12, r9, r12, asr #31
        adds    r0, r7, r0
        adc     r1, r12, #0
        mov     r2, r4
        bl      __ashrdi3
        subs    r12, r0, r5
        sbcs    lr, r1, #0
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        mvnne   r12, #0
        addne   r12, r12, #2, 18
        bne     LBRX41
        mvn     r12, #0
        cmp     r0, r12, lsl #15
        ldr     r12, [sp, #0x5C]
        sbcs    r1, r1, r12
        movge   r0, r0, lsl #16
        movge   r12, r0, asr #16
        mvnlt   r12, #0
        movlt   r12, r12, lsl #15
LBRX41:
        ldr     lr, [sp, #0x40]
        mov     r0, r8
        mov     r1, r11
        strh    r12, [lr]
        ldr     r7, [sp, #0x28]
        mov     r2, r4
        mov     r3, r7
        bl      __ashrdi3
        ldr     r12, [sp, #0x24]
        and     r0, r0, #1
        mov     r2, r4
        adds    r8, r12, r8
        adc     r12, r11, r12, asr #31
        adds    r0, r8, r0
        adc     r1, r12, #0
        mov     r3, r7
        bl      __ashrdi3
        subs    r12, r0, r5
        sbcs    lr, r1, #0
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        mvnne   r0, #0
        addne   r0, r0, #2, 18
        bne     LBRX42
        mvn     r12, #0
        cmp     r0, r12, lsl #15
        ldr     r12, [sp, #0x5C]
        sbcs    r1, r1, r12
        movge   r0, r0, lsl #16
        movge   r0, r0, asr #16
        mvnlt   r0, #0
        movlt   r0, r0, lsl #15
LBRX42:
        ldr     r1, [sp, #0x54]
        cmp     r1, #0
        ldr     r1, [sp, #0x40]
        strh    r0, [r1, #2]
        ble     LBRX44
        ldr     r0, [sp, #0x64]
        ldr     r2, [sp, #0x38]
        ldr     r3, [sp, #0x3C]
        rsb     r8, r0, #0
        ldr     r0, [sp, #0x48]
        rsb     r9, r10, #0
        str     r8, [sp, #0x68]
        str     r9, [sp, #0x6C]
        add     r7, r0, #0xC
        sub     lr, r0, #4
        ldr     r0, [sp, #0xC]
        str     r5, [sp, #0x60]
        str     r4, [sp, #0x50]
        add     r12, r0, #2
        ldr     r0, [sp, #0x4C]
        add     r1, r0, #2
        ldr     r0, [sp, #0x54]
LBRX43:
        ldr     r4, [sp, #0x6C]
        ldrsh   r6, [r1, #4]
        ldrsh   r8, [r12, #4]
        ldr     r9, [sp, #0x68]
        ldrsh   r5, [r1, #2]
        mul     r4, r4, r6
        ldrsh   r6, [r12, #2]
        mul     r8, r9, r8
        ldr     r9, [r7, #4]
        ldr     r11, [r7, #8]
        mla     r4, r3, r5, r4
        mla     r8, r2, r6, r8
        sub     r4, r4, r8
        adds    r9, r4, r9
        adc     r4, r11, r4, asr #31
        str     r9, [lr, #4]
        str     r4, [lr, #8]
        ldrsh   r5, [r1, #4]
        ldrsh   r4, [r12, #4]
        ldrsh   r11, [r1, #2]
        mul     r9, r3, r5
        ldrsh   r8, [r12, #2]
        mul     r4, r2, r4
        ldr     r6, [r7, #0xC]
        ldr     r5, [r7, #0x10]!
        mla     r9, r10, r11, r9
        ldr     r11, [sp, #0x64]
        add     r12, r12, #4
        add     r1, r1, #4
        mla     r4, r11, r8, r4
        sub     r9, r9, r4
        adds    r6, r9, r6
        adc     r9, r5, r9, asr #31
        str     r6, [lr, #0xC]
        str     r9, [lr, #0x10]!
        subs    r0, r0, #1
        bne     LBRX43
        ldr     r5, [sp, #0x60]
        ldr     r6, [sp, #0x20]
        ldr     r4, [sp, #0x50]
LBRX44:
        ldr     r7, [sp, #0x2C]
        ldr     r11, [sp]
        ldr     lr, [sp, #8]
        ldr     r8, [sp, #0x58]
        add     r0, r7, r11
        str     r0, [sp, #0x6C]
        add     r2, r7, lr
        ldrsh   r1, [r2, #2]
        ldrsh   r0, [r0, #2]
        ldrsh   r3, [lr, +r7]
        ldrsh   r9, [r11, +r7]
        rsb     r1, r1, #0
        mul     r12, r1, r10
        ldr     r1, [sp, #0x64]
        rsb     r0, r0, #0
        mul     r0, r0, r1
        ldr     r1, [sp, #0x48]
        add     r1, r8, r1
        ldr     r8, [sp, #0x40]
        add     r8, r8, #4
        str     r8, [sp, #0x40]
        ldr     r8, [sp, #0x3C]
        mla     r3, r3, r8, r12
        ldr     r12, [sp, #0x38]
        mla     r0, r9, r12, r0
        ldr     r9, [sp, #4]
        str     r0, [sp, #0x68]
        ldr     r0, [sp, #0x14]
        add     r0, r0, #4
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #0x34]
        add     r0, r0, #1
        str     r0, [sp, #0x34]
        cmp     r0, r9
        ldr     r0, [sp, #0x68]
        ldr     r9, [sp, #0x48]
        sub     r3, r3, r0
        ldr     r0, [sp, #0x58]
        str     r3, [r9, +r0]
        mov     r3, r3, asr #31
        str     r3, [r1, #4]
        ldrsh   lr, [lr, +r7]
        ldrsh   r7, [r11, +r7]
        ldrsh   r2, [r2, #2]
        mul     r10, lr, r10
        ldr     r0, [sp, #0x6C]
        ldr     lr, [sp, #0x64]
        ldrsh   r0, [r0, #2]
        mla     r10, r2, r8, r10
        mul     r7, r7, lr
        mla     r7, r0, r12, r7
        sub     r10, r10, r7
        str     r10, [r1, #8]
        mov     r0, r10, asr #31
        str     r0, [r1, #0xC]
        blt     LBRX34
        mov     r0, #0
        add     sp, sp, #0x70
        ldmia   sp!, {r4 - r11, pc}
LBRX45:
        cmp     lr, #0
        mvn     r0, #0
        beq     LBRX55
        cmp     r2, #0
        ble     LBRX59
        ldr     r3, [r12]
        sub     r1, r1, #2
        str     r1, [sp, #0x28]
        str     r3, [sp, #0x24]
        ldr     r1, [r12, #0xC]
        ldr     r11, [r12, #4]
        ldr     lr, [r12, #8]
        str     r1, [sp, #0x2C]
        mov     r5, #1
        sub     r1, r4, #1
        sub     r3, r6, #1
        mov     r1, r5, lsl r1
        mov     r3, r5, lsl r3
        rsb     r5, r9, #0
        str     r5, [sp, #0x30]
        mov     r5, r4, asr #31
        str     r5, [sp, #0x34]
        str     r9, [sp, #0x10]
        ldr     r9, [sp, #0x34]
        sub     r1, r1, #1
        sub     r7, r3, #1
        mov     r5, r6, asr #31
        add     r8, r0, #2, 18
        str     r11, [sp, #0x58]
        str     r1, [sp, #0x54]
        str     r0, [sp, #8]
        str     r10, [sp, #0x4C]
        str     r12, [sp, #0x48]
        str     r2, [sp, #4]
LBRX46:
        ldr     r1, [sp, #0x14]
        ldr     r10, [sp, #0x18]
        mov     r2, r6
        ldrsh   r0, [r1, #2]
        mov     r3, r5
        str     r0, [sp, #0x68]
        ldrsh   r12, [r1]
        ldr     r1, [sp, #0x30]
        str     r12, [sp, #0x6C]
        mul     r1, r1, r0
        mul     r0, r10, r0
        mla     r1, r10, r12, r1
        ldr     r10, [sp, #0x10]
        mla     r0, r12, r10, r0
        ldr     r12, [sp, #0x58]
        str     r0, [sp, #0x64]
        ldr     r0, [sp, #0x24]
        adds    r0, r1, r0
        adc     r1, r12, r1, asr #31
        ldr     r12, [sp, #0x64]
        str     r0, [sp, #0x5C]
        str     r1, [sp, #0x58]
        adds    r10, r12, lr
        ldr     lr, [sp, #0x2C]
        adc     r11, lr, r12, asr #31
        bl      __ashrdi3
        ldr     r12, [sp, #0x5C]
        ldr     lr, [sp, #0x58]
        and     r0, r0, #1
        adds    r12, r12, r7
        adc     lr, lr, r7, asr #31
        adds    r0, r12, r0
        adc     r1, lr, #0
        mov     r2, r6
        mov     r3, r5
        bl      __ashrdi3
        subs    r12, r0, r8
        sbcs    lr, r1, #0
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        bne     LBRX48
        mvn     r12, #0
        cmp     r0, r12, lsl #15
        ldr     r12, [sp, #8]
        sbcs    r1, r1, r12
        bge     LBRX47
        mvn     r12, #0
        mov     r12, r12, lsl #15
        str     r12, [sp, #0x64]
        b       LBRX49
LBRX47:
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        str     r0, [sp, #0x64]
        b       LBRX49
LBRX48:
        mvn     r12, #0
        add     r12, r12, #2, 18
        str     r12, [sp, #0x64]
LBRX49:
        mov     r0, r10
        mov     r1, r11
        mov     r2, r6
        mov     r3, r5
        bl      __ashrdi3
        adds    r12, r10, r7
        and     r0, r0, #1
        adc     lr, r11, r7, asr #31
        adds    r0, r12, r0
        adc     r1, lr, #0
        mov     r2, r6
        mov     r3, r5
        bl      __ashrdi3
        subs    r12, r0, r8
        sbcs    lr, r1, #0
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        bne     LBRX51
        mvn     r12, #0
        cmp     r0, r12, lsl #15
        ldr     r12, [sp, #8]
        sbcs    r1, r1, r12
        bge     LBRX50
        mvn     r12, #0
        mov     r12, r12, lsl #15
        str     r12, [sp, #0x60]
        b       LBRX52
LBRX50:
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        str     r0, [sp, #0x60]
        b       LBRX52
LBRX51:
        mvn     r12, #0
        add     r12, r12, #2, 18
        str     r12, [sp, #0x60]
LBRX52:
        ldr     r0, [sp, #0x5C]
        ldr     r1, [sp, #0x58]
        mov     r2, r4
        mov     r3, r9
        bl      __ashrdi3
        ldr     r12, [sp, #0x5C]
        ldr     lr, [sp, #0x54]
        ldr     r1, [sp, #0x58]
        adds    r12, lr, r12
        and     r0, r0, #1
        adc     lr, r1, lr, asr #31
        adds    r0, r12, r0
        adc     r1, lr, #0
        mov     r2, r4
        mov     r3, r9
        bl      __ashrdi3
        subs    r12, r0, r8
        sbcs    lr, r1, #0
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        mvnne   r12, #0
        addne   r12, r12, #2, 18
        bne     LBRX53
        mvn     r12, #0
        cmp     r0, r12, lsl #15
        ldr     r12, [sp, #8]
        sbcs    r1, r1, r12
        movge   r0, r0, lsl #16
        movge   r12, r0, asr #16
        mvnlt   r12, #0
        movlt   r12, r12, lsl #15
LBRX53:
        ldr     lr, [sp, #0x28]
        mov     r0, r10
        mov     r1, r11
        strh    r12, [lr, #2]
        mov     r2, r4
        mov     r3, r9
        bl      __ashrdi3
        ldr     r12, [sp, #0x54]
        and     r0, r0, #1
        adds    r10, r12, r10
        adc     r12, r11, r12, asr #31
        adds    r0, r10, r0
        adc     r1, r12, #0
        mov     r2, r4
        mov     r3, r9
        bl      __ashrdi3
        subs    r12, r0, r8
        sbcs    lr, r1, #0
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        mvnne   r0, #0
        addne   r0, r0, #2, 18
        bne     LBRX54
        mvn     r12, #0
        cmp     r0, r12, lsl #15
        ldr     r12, [sp, #8]
        sbcs    r1, r1, r12
        movge   r0, r0, lsl #16
        movge   r0, r0, asr #16
        mvnlt   r0, #0
        movlt   r0, r0, lsl #15
LBRX54:
        ldr     r2, [sp, #0x28]
        strh    r0, [r2, #4]!
        ldr     lr, [sp, #0xC]
        ldr     r11, [sp, #0x4C]
        ldr     r3, [sp, #0x60]
        ldrsh   r1, [lr, #4]
        ldrsh   r0, [lr, #6]
        ldrsh   r10, [r11, #6]
        ldrsh   r12, [r11, #4]
        str     r2, [sp, #0x28]
        ldr     r2, [sp, #0x14]
        str     r1, [sp, #0x5C]
        rsb     r1, r10, #0
        ldr     r10, [sp, #0x68]
        add     r2, r2, #4
        str     r2, [sp, #0x14]
        mul     r1, r1, r10
        ldr     r2, [sp, #0x6C]
        rsb     r0, r0, #0
        mul     r0, r0, r3
        mla     r12, r12, r2, r1
        ldr     r2, [sp, #0x5C]
        ldr     r1, [sp, #0x64]
        mla     r2, r2, r1, r0
        ldr     r0, [sp, #4]
        sub     r2, r12, r2
        ldr     r12, [sp, #0x48]
        str     r2, [sp, #0x24]
        subs    r0, r0, #1
        str     r0, [sp, #4]
        str     r2, [r12]
        mov     r2, r2, asr #31
        str     r2, [sp, #0x58]
        str     r2, [r12, #4]
        ldrsh   r2, [r11, #4]
        ldrsh   r3, [lr, #4]
        mul     r10, r2, r10
        str     r3, [sp, #0x5C]
        ldr     r2, [sp, #0x5C]
        ldr     r3, [sp, #0x60]
        ldrsh   r11, [r11, #6]
        ldrsh   lr, [lr, #6]
        mul     r2, r2, r3
        ldr     r3, [sp, #0x6C]
        mla     r2, lr, r1, r2
        mla     r10, r11, r3, r10
        sub     lr, r10, r2
        str     lr, [r12, #8]
        mov     r1, lr, asr #31
        str     r1, [sp, #0x2C]
        str     r1, [r12, #0xC]
        bne     LBRX46
        mov     r0, #0
        add     sp, sp, #0x70
        ldmia   sp!, {r4 - r11, pc}
LBRX55:
        cmp     r2, #0
        ble     LBRX59
        ldr     r10, [sp, #0x14]
        ldr     r11, [sp, #0x18]
        sub     r3, r4, #1
        mov     r12, #1
        sub     r6, r1, #2
        mov     r3, r12, lsl r3
        rsb     r1, r9, #0
        sub     r7, r3, #1
        mov     r5, r4, asr #31
        add     r8, r0, #2, 18
        str     r1, [sp, #0xC]
        str     r0, [sp, #8]
        str     r9, [sp, #0x10]
        str     r2, [sp, #4]
LBRX56:
        ldrsh   r0, [r10, #2]
        ldr     r1, [sp, #0xC]
        mov     r2, r4
        str     r0, [sp]
        ldrsh   r9, [r10]
        mul     r0, r1, r0
        mov     r3, r5
        mla     r0, r11, r9, r0
        str     r0, [sp, #0x6C]
        mov     r1, r0, asr #31
        ldr     r0, [sp, #0x6C]
        str     r1, [sp, #0x68]
        bl      __ashrdi3
        ldr     r1, [sp, #0x6C]
        ldr     r12, [sp, #0x68]
        adds    r1, r1, r7
        and     r0, r0, #1
        adc     r12, r12, r7, asr #31
        adds    r0, r1, r0
        adc     r1, r12, #0
        mov     r2, r4
        mov     r3, r5
        bl      __ashrdi3
        subs    r12, r0, r8
        sbcs    lr, r1, #0
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        mvnne   r0, #0
        addne   r1, r0, #2, 18
        bne     LBRX57
        mvn     r12, #0
        cmp     r0, r12, lsl #15
        ldr     r12, [sp, #8]
        sbcs    r1, r1, r12
        movge   r0, r0, lsl #16
        movge   r1, r0, asr #16
        mvnlt   r0, #0
        movlt   r1, r0, lsl #15
LBRX57:
        ldr     r0, [sp]
        strh    r1, [r6, #2]
        ldr     r1, [sp, #0x10]
        mul     r0, r11, r0
        mov     r2, r4
        mov     r3, r5
        mla     r9, r9, r1, r0
        mov     r1, r9, asr #31
        str     r1, [sp, #0x6C]
        mov     r0, r9
        bl      __ashrdi3
        ldr     r1, [sp, #0x6C]
        adds    r9, r7, r9
        adc     r1, r1, r7, asr #31
        and     r0, r0, #1
        adds    r0, r9, r0
        adc     r1, r1, #0
        mov     r2, r4
        mov     r3, r5
        bl      __ashrdi3
        subs    lr, r0, r8
        sbcs    r12, r1, #0
        movlt   lr, #0
        movlt   r12, #0
        orrs    r12, lr, r12
        mvnne   r0, #0
        addne   r12, r0, #2, 18
        bne     LBRX58
        ldr     lr, [sp, #8]
        mvn     r12, #0
        cmp     r0, r12, lsl #15
        sbcs    r1, r1, lr
        movge   r0, r0, lsl #16
        movge   r12, r0, asr #16
        movlt   r12, r12, lsl #15
LBRX58:
        strh    r12, [r6, #4]!
        ldr     r0, [sp, #4]
        add     r10, r10, #4
        subs    r0, r0, #1
        str     r0, [sp, #4]
        bne     LBRX56
LBRX59:
        mov     r0, #0
        add     sp, sp, #0x70
        ldmia   sp!, {r4 - r11, pc}
LBRX_refsIIRAR32fc_16sc_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xA0
        ldr     r12, [pc, #0xF24]
        ldr     r8, [r3, #4]
        ldr     r11, [r3, #0x2C]
        ldr     r12, [r12]
        ldr     r9, [r3, #8]
        ldr     lr, [sp, #0xC4]
        add     r7, r8, r11, lsl #3
        str     r12, [sp, #0x9C]
        add     r3, r8, #8
        cmp     lr, #0
        mov     r6, r1
        add     r10, r7, #8
        str     r3, [sp, #0x84]
        andge   lr, lr, #0x7F
        subge   r5, r12, lr, lsl #23
        blt     LBRX113
LBRX60:
        ldr     r3, [r8]
        cmp     r11, #1
        str     r3, [sp, #0x48]
        ldr     r3, [r8, #4]
        str     r5, [sp, #0x9C]
        str     r3, [sp, #0x44]
        ble     LBRX81
        bic     r3, r2, #1
        cmp     r3, #0
        ble     LBRX80
        ldr     r1, [pc, #0xEC0]
        ldr     r12, [pc, #0xEC0]
        ldr     lr, [pc, #0xEC0]
        ldr     r1, [r1]
        ldr     r4, [pc, #0xEBC]
        str     r1, [sp, #0x80]
        ldr     r12, [r12]
        str     r12, [sp, #0x6C]
        ldr     lr, [lr]
        mov     r12, #0
        str     lr, [sp, #0x68]
        ldr     r4, [r4]
        mov     lr, r11, lsl #3
        sub     r1, lr, #0x10
        str     r4, [sp, #0x64]
        sub     r4, lr, #8
        add     lr, r0, #4
        str     lr, [sp, #0x70]
        add     lr, r6, #4
        str     lr, [sp, #0x7C]
        sub     lr, r11, #2
        str     lr, [sp, #0x78]
        mov     lr, r0
        str     r8, [sp, #0x54]
        str     r6, [sp, #0x74]
        str     r0, [sp, #0x2C]
        str     lr, [sp, #0x30]
        str     r12, [sp, #0x3C]
        str     r3, [sp, #0x40]
        str     r5, [sp, #0x14]
        str     r7, [sp, #0x50]
        str     r11, [sp, #0x58]
        str     r2, [sp, #0x1C]
        str     r6, [sp, #0x5C]
        mov     r8, r1
LBRX61:
        ldr     r5, [sp, #0x30]
        ldrsh   r0, [r5]
        bl      __floatsisf
        ldrsh   r5, [r5, #2]
        mov     r11, r0
        str     r11, [sp, #4]
        mov     r0, r5
        bl      __floatsisf
        ldr     r5, [sp, #0x70]
        mov     r6, r0
        ldrsh   r1, [r5]
        mov     r0, r1
        bl      __floatsisf
        ldrsh   r5, [r5, #2]
        mov     r7, r0
        mov     r0, r5
        bl      __floatsisf
        ldr     r5, [r9]
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x48]
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        mov     r5, r0
        ldr     r0, [sp, #0x44]
        mov     r1, r6
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r5
        bl      __subsf3
        ldr     r2, [r9, #4]
        mov     r5, r0
        ldr     r0, [sp, #0x44]
        str     r2, [sp, #0x60]
        mov     r1, r11
        bl      __mulsf3
        ldr     r1, [sp, #0x60]
        bl      __addsf3
        str     r0, [sp, #0x60]
        ldr     r0, [sp, #0x48]
        mov     r1, r6
        bl      __mulsf3
        ldr     r1, [sp, #0x60]
        bl      __addsf3
        ldr     r3, [sp, #0x54]
        mov     r1, r11
        ldr     r2, [r3, #8]
        str     r2, [sp, #0x60]
        ldr     r2, [sp, #0x50]
        ldr     r12, [r2, #0xC]
        str     r12, [sp, #0x28]
        ldr     r3, [r3, #0xC]
        str     r3, [sp, #0x24]
        ldr     r3, [r9, #8]
        str     r3, [sp]
        ldr     r2, [r2, #8]
        str     r0, [sp, #0x10]
        ldr     r0, [sp, #0x60]
        str     r2, [sp, #0x88]
        bl      __mulsf3
        ldr     r1, [sp]
        bl      __addsf3
        str     r0, [sp]
        ldr     r0, [sp, #0x24]
        mov     r1, r6
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp]
        bl      __subsf3
        str     r0, [sp]
        ldr     r0, [sp, #0x88]
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp]
        bl      __subsf3
        ldr     r1, [sp, #0x10]
        str     r0, [sp]
        ldr     r0, [sp, #0x28]
        bl      __mulsf3
        ldr     r1, [sp]
        bl      __addsf3
        str     r0, [sp]
        ldr     r0, [sp, #0x48]
        mov     r1, r7
        bl      __mulsf3
        ldr     r1, [sp]
        bl      __addsf3
        ldr     r1, [sp, #0x18]
        str     r0, [sp]
        ldr     r0, [sp, #0x44]
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp]
        bl      __subsf3
        ldr     r2, [r9, #0xC]
        str     r0, [sp]
        ldr     r0, [sp, #0x24]
        str     r2, [sp, #0x8C]
        mov     r1, r11
        bl      __mulsf3
        ldr     r1, [sp, #0x8C]
        bl      __addsf3
        str     r0, [sp, #0x8C]
        ldr     r0, [sp, #0x60]
        mov     r1, r6
        bl      __mulsf3
        ldr     r1, [sp, #0x8C]
        bl      __addsf3
        str     r0, [sp, #0x8C]
        ldr     r0, [sp, #0x28]
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x8C]
        bl      __subsf3
        str     r0, [sp, #0x8C]
        ldr     r1, [sp, #0x10]
        ldr     r0, [sp, #0x88]
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x8C]
        bl      __subsf3
        str     r0, [sp, #0x8C]
        ldr     r0, [sp, #0x44]
        mov     r1, r7
        bl      __mulsf3
        ldr     r1, [sp, #0x8C]
        bl      __addsf3
        str     r0, [sp, #0x8C]
        ldr     r0, [sp, #0x48]
        ldr     r1, [sp, #0x18]
        bl      __mulsf3
        ldr     r1, [sp, #0x8C]
        bl      __addsf3
        ldr     r1, [sp, #0x14]
        str     r0, [sp, #0x24]
        mov     r0, r5
        bl      __mulsf3
        ldr     r1, [sp, #0x80]
        str     r0, [sp, #0x60]
        bl      __gtsf2
        cmp     r0, #0
        bgt     LBRX64
        ldr     r0, [sp, #0x60]
        ldr     r1, [sp, #0x6C]
        bl      __ltsf2
        cmp     r0, #0
        movlt   r2, #0
        sublt   r2, r2, #2, 18
        blt     LBRX65
        ldr     r0, [sp, #0x60]
        ldr     r1, [sp, #0x68]
        bl      __gtsf2
        cmp     r0, #0
        ble     LBRX62
        ldr     r1, [sp, #0x60]
        ldr     r0, [sp, #0x64]
        bl      __addsf3
        str     r0, [sp, #0x60]
LBRX62:
        ldr     r0, [sp, #0x60]
        ldr     r1, [sp, #0x68]
        bl      __ltsf2
        cmp     r0, #0
        bge     LBRX63
        ldr     r0, [sp, #0x60]
        ldr     r1, [sp, #0x64]
        bl      __subsf3
        str     r0, [sp, #0x60]
LBRX63:
        ldr     r0, [sp, #0x60]
        bl      __fixsfsi
        mov     r0, r0, lsl #16
        mov     r2, r0, asr #16
        b       LBRX65
LBRX64:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r2, r2
LBRX65:
        ldr     r3, [sp, #0x74]
        strh    r2, [r3]
        ldr     r0, [sp, #0x10]
        ldr     r1, [sp, #0x14]
        bl      __mulsf3
        ldr     r1, [sp, #0x80]
        str     r0, [sp, #0x60]
        bl      __gtsf2
        cmp     r0, #0
        bgt     LBRX68
        ldr     r0, [sp, #0x60]
        ldr     r1, [sp, #0x6C]
        bl      __ltsf2
        cmp     r0, #0
        movlt   r2, #0
        sublt   r2, r2, #2, 18
        blt     LBRX69
        ldr     r0, [sp, #0x60]
        ldr     r1, [sp, #0x68]
        bl      __gtsf2
        cmp     r0, #0
        ble     LBRX66
        ldr     r1, [sp, #0x60]
        ldr     r0, [sp, #0x64]
        bl      __addsf3
        str     r0, [sp, #0x60]
LBRX66:
        ldr     r0, [sp, #0x60]
        ldr     r1, [sp, #0x68]
        bl      __ltsf2
        cmp     r0, #0
        bge     LBRX67
        ldr     r0, [sp, #0x60]
        ldr     r1, [sp, #0x64]
        bl      __subsf3
        str     r0, [sp, #0x60]
LBRX67:
        ldr     r0, [sp, #0x60]
        bl      __fixsfsi
        mov     r0, r0, lsl #16
        mov     r2, r0, asr #16
        b       LBRX69
LBRX68:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r2, r2
LBRX69:
        ldr     r3, [sp, #0x74]
        strh    r2, [r3, #2]
        ldr     r0, [sp]
        ldr     r1, [sp, #0x14]
        bl      __mulsf3
        ldr     r1, [sp, #0x80]
        str     r0, [sp, #0x60]
        bl      __gtsf2
        cmp     r0, #0
        bgt     LBRX72
        ldr     r0, [sp, #0x60]
        ldr     r1, [sp, #0x6C]
        bl      __ltsf2
        cmp     r0, #0
        movlt   r2, #0
        sublt   r2, r2, #2, 18
        blt     LBRX73
        ldr     r0, [sp, #0x60]
        ldr     r1, [sp, #0x68]
        bl      __gtsf2
        cmp     r0, #0
        ble     LBRX70
        ldr     r1, [sp, #0x60]
        ldr     r0, [sp, #0x64]
        bl      __addsf3
        str     r0, [sp, #0x60]
LBRX70:
        ldr     r0, [sp, #0x60]
        ldr     r1, [sp, #0x68]
        bl      __ltsf2
        cmp     r0, #0
        bge     LBRX71
        ldr     r0, [sp, #0x60]
        ldr     r1, [sp, #0x64]
        bl      __subsf3
        str     r0, [sp, #0x60]
LBRX71:
        ldr     r0, [sp, #0x60]
        bl      __fixsfsi
        mov     r0, r0, lsl #16
        mov     r2, r0, asr #16
        b       LBRX73
LBRX72:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r2, r2
LBRX73:
        ldr     r3, [sp, #0x7C]
        strh    r2, [r3]
        ldr     r0, [sp, #0x24]
        ldr     r1, [sp, #0x14]
        bl      __mulsf3
        ldr     r1, [sp, #0x80]
        str     r0, [sp, #0x60]
        bl      __gtsf2
        cmp     r0, #0
        bgt     LBRX76
        ldr     r0, [sp, #0x60]
        ldr     r1, [sp, #0x6C]
        bl      __ltsf2
        cmp     r0, #0
        movlt   r2, #0
        sublt   r2, r2, #2, 18
        blt     LBRX77
        ldr     r0, [sp, #0x60]
        ldr     r1, [sp, #0x68]
        bl      __gtsf2
        cmp     r0, #0
        ble     LBRX74
        ldr     r1, [sp, #0x60]
        ldr     r0, [sp, #0x64]
        bl      __addsf3
        str     r0, [sp, #0x60]
LBRX74:
        ldr     r0, [sp, #0x60]
        ldr     r1, [sp, #0x68]
        bl      __ltsf2
        cmp     r0, #0
        bge     LBRX75
        ldr     r0, [sp, #0x60]
        ldr     r1, [sp, #0x64]
        bl      __subsf3
        str     r0, [sp, #0x60]
LBRX75:
        ldr     r0, [sp, #0x60]
        bl      __fixsfsi
        mov     r0, r0, lsl #16
        mov     r2, r0, asr #16
        b       LBRX77
LBRX76:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r2, r2
LBRX77:
        ldr     r3, [sp, #0x78]
        cmp     r3, #0
        ldr     r3, [sp, #0x7C]
        strh    r2, [r3, #2]
        ble     LBRX79
        ldr     r12, [sp, #0x54]
        ldr     lr, [sp, #0x50]
        add     r3, r9, #0xC
        add     r1, r12, #0xC
        add     r11, r12, #4
        sub     r12, r9, #4
        str     r12, [sp, #0x60]
        ldr     r12, [sp, #0x78]
        str     r9, [sp, #0xC]
        ldr     r9, [sp, #0x60]
        add     r2, lr, #0xC
        add     r0, lr, #4
        str     r7, [sp, #8]
        str     r6, [sp, #0x20]
        str     r4, [sp, #0x34]
        str     r8, [sp, #0x38]
        str     r12, [sp, #0x28]
        str     r10, [sp, #0x4C]
        mov     r4, r0
        mov     r6, r1
        mov     r7, r2
        mov     r8, r3
LBRX78:
        ldr     r1, [sp, #8]
        ldr     r0, [r11, #4]
        bl      __mulsf3
        ldr     r1, [sp, #0x18]
        ldr     r2, [r11, #8]
        mov     r10, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r10
        bl      __subsf3
        ldr     r1, [sp]
        ldr     r2, [r4, #4]
        mov     r10, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r10
        bl      __subsf3
        ldr     r2, [r4, #8]
        ldr     r1, [sp, #0x24]
        mov     r10, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r1, [sp, #4]
        ldr     r2, [r6, #4]
        mov     r10, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r2, [r6, #8]
        ldr     r1, [sp, #0x20]
        mov     r10, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r10
        bl      __subsf3
        ldr     r2, [r7, #4]
        mov     r10, r0
        mov     r1, r5
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r10
        bl      __subsf3
        ldr     r1, [sp, #0x10]
        ldr     r2, [r7, #8]
        mov     r10, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r1, [r8, #4]
        bl      __addsf3
        str     r0, [r9, #4]
        ldr     r0, [r11, #4]
        ldr     r1, [sp, #0x18]
        bl      __mulsf3
        ldr     r1, [sp, #8]
        ldr     r2, [r11, #8]!
        mov     r10, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r2, [r4, #4]
        ldr     r1, [sp, #0x24]
        mov     r10, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r10
        bl      __subsf3
        ldr     r1, [sp]
        ldr     r2, [r4, #8]!
        mov     r10, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r10
        bl      __subsf3
        ldr     r2, [r6, #4]
        ldr     r1, [sp, #0x20]
        mov     r10, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r2, [r6, #8]!
        ldr     r1, [sp, #4]
        mov     r10, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r1, [sp, #0x10]
        ldr     r2, [r7, #4]
        mov     r10, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r10
        bl      __subsf3
        ldr     r2, [r7, #8]!
        mov     r10, r0
        mov     r1, r5
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r10
        bl      __subsf3
        ldr     r1, [r8, #8]!
        bl      __addsf3
        str     r0, [r9, #8]!
        ldr     r12, [sp, #0x28]
        subs    r12, r12, #1
        str     r12, [sp, #0x28]
        bne     LBRX78
        ldr     r7, [sp, #8]
        ldr     r6, [sp, #0x20]
        ldr     r4, [sp, #0x34]
        ldr     r8, [sp, #0x38]
        ldr     r10, [sp, #0x4C]
        ldr     r9, [sp, #0xC]
LBRX79:
        ldr     r11, [sp, #0x84]
        ldr     r1, [sp, #4]
        ldr     r0, [r4, +r11]
        add     r2, r11, r4
        str     r2, [sp, #0x8C]
        add     r2, r8, r11
        str     r2, [sp, #0x88]
        add     r2, r8, r10
        str     r2, [sp, #0x60]
        add     r2, r10, r4
        str     r2, [sp, #0x28]
        add     r2, r9, r8
        str     r2, [sp, #0x90]
        bl      __mulsf3
        ldr     r2, [sp, #0x8C]
        add     r3, r9, r4
        ldr     r2, [r2, #4]
        str     r0, [sp, #0x94]
        mov     r1, r6
        str     r3, [sp, #0x98]
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x94]
        bl      __subsf3
        ldr     r3, [sp, #0x7C]
        ldr     r2, [r4, +r10]
        str     r0, [sp, #0x94]
        add     r3, r3, #8
        str     r3, [sp, #0x7C]
        mov     r0, r2
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x94]
        bl      __subsf3
        ldr     r2, [sp, #0x28]
        ldr     r1, [sp, #0x10]
        ldr     r3, [sp, #0x74]
        ldr     r2, [r2, #4]
        str     r0, [sp, #0x94]
        add     r3, r3, #8
        str     r3, [sp, #0x74]
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [sp, #0x94]
        bl      __addsf3
        ldr     r2, [r11, +r8]
        ldr     r3, [sp, #0x70]
        str     r0, [sp, #0x94]
        mov     r0, r2
        mov     r1, r7
        add     r3, r3, #8
        str     r3, [sp, #0x70]
        bl      __mulsf3
        ldr     r1, [sp, #0x94]
        bl      __addsf3
        ldr     r2, [sp, #0x88]
        ldr     r3, [sp, #0x30]
        ldr     r1, [sp, #0x18]
        ldr     r2, [r2, #4]
        str     r0, [sp, #0x94]
        add     r3, r3, #8
        str     r3, [sp, #0x30]
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x94]
        bl      __subsf3
        ldr     r2, [r10, +r8]
        ldr     r3, [sp, #0x3C]
        ldr     r1, [sp]
        str     r0, [sp, #0x94]
        add     r3, r3, #2
        str     r3, [sp, #0x3C]
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x94]
        bl      __subsf3
        ldr     r2, [sp, #0x60]
        ldr     r1, [sp, #0x24]
        ldr     r2, [r2, #4]
        str     r0, [sp, #0x94]
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [sp, #0x94]
        bl      __addsf3
        str     r0, [r8, +r9]
        ldr     r2, [sp, #0x8C]
        ldr     r1, [sp, #4]
        ldr     r0, [r2, #4]
        bl      __mulsf3
        ldr     r2, [r4, +r11]
        str     r0, [sp, #0x94]
        mov     r0, r2
        mov     r1, r6
        bl      __mulsf3
        ldr     r1, [sp, #0x94]
        bl      __addsf3
        ldr     r2, [sp, #0x28]
        mov     r6, r0
        mov     r1, r5
        ldr     r2, [r2, #4]
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r6
        bl      __subsf3
        ldr     r1, [sp, #0x10]
        ldr     r2, [r4, +r10]
        mov     r5, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r5
        bl      __subsf3
        ldr     r2, [sp, #0x88]
        mov     r5, r0
        mov     r1, r7
        ldr     r2, [r2, #4]
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r2, [r11, +r8]
        ldr     r1, [sp, #0x18]
        mov     r5, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r2, [sp, #0x60]
        ldr     r1, [sp]
        mov     r5, r0
        ldr     r2, [r2, #4]
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r5
        bl      __subsf3
        ldr     r2, [r10, +r8]
        ldr     r1, [sp, #0x24]
        mov     r5, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r5
        bl      __subsf3
        ldr     r2, [sp, #0x90]
        mov     r1, r7
        str     r0, [r2, #4]
        ldr     r0, [r4, +r11]
        bl      __mulsf3
        ldr     r2, [sp, #0x8C]
        ldr     r1, [sp, #0x18]
        mov     r5, r0
        ldr     r2, [r2, #4]
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r5
        bl      __subsf3
        ldr     r1, [sp]
        ldr     r2, [r4, +r10]
        mov     r5, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r5
        bl      __subsf3
        ldr     r2, [sp, #0x28]
        ldr     r1, [sp, #0x24]
        mov     r5, r0
        ldr     r2, [r2, #4]
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        str     r0, [r4, +r9]
        ldr     r2, [sp, #0x8C]
        mov     r1, r7
        ldr     r0, [r2, #4]
        bl      __mulsf3
        ldr     r11, [r4, +r11]
        ldr     r1, [sp, #0x18]
        mov     r5, r0
        mov     r0, r11
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r2, [sp, #0x28]
        ldr     r1, [sp]
        mov     r5, r0
        ldr     r2, [r2, #4]
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r5
        bl      __subsf3
        ldr     r1, [sp, #0x24]
        ldr     r2, [r4, +r10]
        mov     r5, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r5
        bl      __subsf3
        ldr     r2, [sp, #0x3C]
        ldr     r3, [sp, #0x40]
        cmp     r2, r3
        ldr     r2, [sp, #0x98]
        str     r0, [r2, #4]
        blt     LBRX61
        ldr     r0, [sp, #0x2C]
        ldr     r5, [sp, #0x14]
        ldr     r7, [sp, #0x50]
        ldr     r8, [sp, #0x54]
        ldr     r11, [sp, #0x58]
        ldr     r2, [sp, #0x1C]
        ldr     r6, [sp, #0x5C]
LBRX80:
        tst     r2, #1
        beq     LBRX101
        b       LBRX102
LBRX81:
        cmp     r11, #0
        mov     r3, #0
        beq     LBRX91
        cmp     r2, #0
        ble     LBRX101
        ldr     r12, [pc, #0x368]
        ldr     r4, [r9]
        ldr     lr, [r9, #4]
        ldr     r12, [r12]
        ldr     r11, [pc, #0x35C]
        ldr     r10, [pc, #0x35C]
        ldr     r1, [pc, #0x35C]
        str     r9, [sp, #0xC]
        mov     r9, r8
        sub     r6, r6, #2
        mov     r8, r7
        str     r6, [sp, #4]
        str     lr, [sp, #8]
        str     r4, [sp, #0x10]
        str     r12, [sp, #0x18]
        str     r3, [sp]
        str     r5, [sp, #0x14]
        str     r2, [sp, #0x1C]
        mov     r7, r0
LBRX82:
        ldrsh   r0, [r7]
        bl      __floatsisf
        ldrsh   r1, [r7, #2]
        mov     r5, r0
        mov     r0, r1
        bl      __floatsisf
        ldr     r11, [sp, #0x48]
        mov     r4, r0
        mov     r1, r5
        mov     r0, r11
        bl      __mulsf3
        ldr     r10, [sp, #0x44]
        mov     r6, r0
        mov     r1, r4
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r6
        bl      __subsf3
        ldr     r1, [sp, #0x10]
        bl      __addsf3
        mov     r6, r0
        mov     r0, r10
        mov     r1, r5
        bl      __mulsf3
        mov     r10, r0
        mov     r0, r11
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r1, [sp, #8]
        bl      __addsf3
        ldr     r1, [sp, #0x14]
        mov     r10, r0
        mov     r0, r6
        bl      __mulsf3
        ldr     r1, [sp, #0x18]
        mov     r11, r0
        bl      __gtsf2
        cmp     r0, #0
        bgt     LBRX85
        ldr     r2, [pc, #0x278]
        mov     r0, r11
        ldr     r1, [r2]
        bl      __ltsf2
        cmp     r0, #0
        movlt   r2, #0
        sublt   r2, r2, #2, 18
        blt     LBRX86
        ldr     r2, [pc, #0x25C]
        mov     r0, r11
        ldr     r1, [r2]
        str     r1, [sp, #0x10]
        bl      __gtsf2
        cmp     r0, #0
        ble     LBRX83
        ldr     r2, [pc, #0x244]
        mov     r1, r11
        ldr     r0, [r2]
        bl      __addsf3
        mov     r11, r0
LBRX83:
        mov     r0, r11
        ldr     r1, [sp, #0x10]
        bl      __ltsf2
        cmp     r0, #0
        bge     LBRX84
        ldr     r2, [pc, #0x21C]
        mov     r0, r11
        ldr     r1, [r2]
        bl      __subsf3
        mov     r11, r0
LBRX84:
        mov     r0, r11
        bl      __fixsfsi
        mov     r0, r0, lsl #16
        mov     r2, r0, asr #16
        b       LBRX86
LBRX85:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r2, r2
LBRX86:
        ldr     r3, [sp, #4]
        mov     r0, r10
        strh    r2, [r3, #2]
        ldr     r1, [sp, #0x14]
        bl      __mulsf3
        ldr     r1, [sp, #0x18]
        mov     r11, r0
        bl      __gtsf2
        cmp     r0, #0
        bgt     LBRX89
        ldr     r2, [pc, #0x1B8]
        mov     r0, r11
        ldr     r1, [r2]
        bl      __ltsf2
        cmp     r0, #0
        movlt   r2, #0
        sublt   r3, r2, #2, 18
        blt     LBRX90
        ldr     r2, [pc, #0x19C]
        mov     r0, r11
        ldr     r1, [r2]
        str     r1, [sp, #0x10]
        bl      __gtsf2
        cmp     r0, #0
        ble     LBRX87
        ldr     r2, [pc, #0x184]
        mov     r1, r11
        ldr     r0, [r2]
        bl      __addsf3
        mov     r11, r0
LBRX87:
        mov     r0, r11
        ldr     r1, [sp, #0x10]
        bl      __ltsf2
        cmp     r0, #0
        bge     LBRX88
        ldr     r2, [pc, #0x15C]
        mov     r0, r11
        ldr     r1, [r2]
        bl      __subsf3
        mov     r11, r0
LBRX88:
        mov     r0, r11
        bl      __fixsfsi
        mov     r0, r0, lsl #16
        mov     r3, r0, asr #16
        b       LBRX90
LBRX89:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r3, r2
LBRX90:
        ldr     r2, [sp, #4]
        mov     r1, r5
        add     r7, r7, #4
        strh    r3, [r2, #4]!
        ldr     r0, [r9, #8]
        str     r2, [sp, #4]
        bl      __mulsf3
        ldr     r2, [r9, #0xC]
        mov     r11, r0
        mov     r1, r4
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        ldr     r3, [sp]
        ldr     r2, [r8, #8]
        mov     r11, r0
        add     r3, r3, #1
        str     r3, [sp]
        mov     r0, r2
        mov     r1, r6
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        ldr     r2, [r8, #0xC]
        mov     r11, r0
        mov     r1, r10
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r11, [sp, #0xC]
        str     r0, [sp, #0x10]
        str     r0, [r11]
        ldr     r0, [r9, #0xC]
        mov     r1, r5
        bl      __mulsf3
        ldr     r2, [r9, #8]
        mov     r5, r0
        mov     r1, r4
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r2, [r8, #0xC]
        mov     r4, r0
        mov     r1, r6
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r4
        bl      __subsf3
        ldr     r2, [r8, #8]
        mov     r4, r0
        mov     r1, r10
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r4
        bl      __subsf3
        ldr     r1, [sp, #0x1C]
        ldr     r2, [sp]
        str     r0, [sp, #8]
        str     r0, [r11, #4]
        cmp     r2, r1
        blt     LBRX82
        mov     r0, #0
        add     sp, sp, #0xA0
        ldmia   sp!, {r4 - r11, pc}
        .long   0xea000004
        .long   LBRX__2il0floatpacket.6
        .long   LBRX__2il0floatpacket.7
        .long   LBRX__2il0floatpacket.8
        .long   LBRX__2il0floatpacket.9
        .long   LBRX__2il0floatpacket.10
LBRX91:
        cmp     r2, #0
        ble     LBRX101
        ldr     r4, [pc, #-0x20]
        ldr     r10, [pc, #-0x18]
        ldr     lr, [pc, #-0x24]
        ldr     r4, [r4]
        ldr     r12, [pc, #-0x28]
        ldr     r10, [sp, #0x44]
        sub     r6, r6, #2
        mov     r8, r3
        str     r3, [sp]
        str     r5, [sp, #0x14]
        str     r2, [sp, #0x1C]
        mov     r9, r0
LBRX92:
        ldrsh   r0, [r9]
        bl      __floatsisf
        mov     r5, r0
        ldrsh   r0, [r9, #2]
        bl      __floatsisf
        mov     r7, r0
        ldr     r0, [sp, #0x48]
        mov     r1, r5
        bl      __mulsf3
        mov     r11, r0
        mov     r0, r10
        mov     r1, r7
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        ldr     r1, [sp, #0x14]
        bl      __mulsf3
        mov     r11, r0
        mov     r1, r4
        bl      __gtsf2
        cmp     r0, #0
        bgt     LBRX95
        ldr     r2, [pc, #-0xA8]
        mov     r0, r11
        ldr     r1, [r2]
        bl      __ltsf2
        cmp     r0, #0
        ldrlt   r2, [sp]
        sublt   r0, r2, #2, 18
        blt     LBRX96
        ldr     r2, [pc, #-0xC4]
        mov     r0, r11
        ldr     r1, [r2]
        str     r1, [sp, #0x80]
        bl      __gtsf2
        cmp     r0, #0
        ble     LBRX93
        ldr     r2, [pc, #-0xDC]
        mov     r1, r11
        ldr     r0, [r2]
        bl      __addsf3
        mov     r11, r0
LBRX93:
        mov     r0, r11
        ldr     r1, [sp, #0x80]
        bl      __ltsf2
        cmp     r0, #0
        bge     LBRX94
        ldr     r2, [pc, #-0x104]
        mov     r0, r11
        ldr     r1, [r2]
        bl      __subsf3
        mov     r11, r0
LBRX94:
        mov     r0, r11
        bl      __fixsfsi
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LBRX96
LBRX95:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r0, r2
LBRX96:
        strh    r0, [r6, #2]
        mov     r1, r5
        mov     r0, r10
        bl      __mulsf3
        mov     r5, r0
        ldr     r0, [sp, #0x48]
        mov     r1, r7
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r1, [sp, #0x14]
        bl      __mulsf3
        mov     r5, r0
        mov     r1, r4
        bl      __gtsf2
        cmp     r0, #0
        bgt     LBRX99
        ldr     r2, [pc, #-0x184]
        mov     r0, r5
        ldr     r1, [r2]
        bl      __ltsf2
        cmp     r0, #0
        movlt   r2, #0
        sublt   r0, r2, #2, 18
        blt     LBRX100
        ldr     r2, [pc, #-0x1A0]
        mov     r0, r5
        ldr     r7, [r2]
        mov     r1, r7
        bl      __gtsf2
        cmp     r0, #0
        ble     LBRX97
        ldr     r2, [pc, #-0x1B8]
        mov     r1, r5
        ldr     r0, [r2]
        bl      __addsf3
        mov     r5, r0
LBRX97:
        mov     r0, r5
        mov     r1, r7
        bl      __ltsf2
        cmp     r0, #0
        bge     LBRX98
        ldr     r2, [pc, #-0x1E0]
        mov     r0, r5
        ldr     r1, [r2]
        bl      __subsf3
        mov     r5, r0
LBRX98:
        mov     r0, r5
        bl      __fixsfsi
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LBRX100
LBRX99:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r0, r2
LBRX100:
        strh    r0, [r6, #4]!
        ldr     r2, [sp, #0x1C]
        add     r8, r8, #1
        cmp     r8, r2
        add     r9, r9, #4
        blt     LBRX92
LBRX101:
        mov     r0, #0
        add     sp, sp, #0xA0
        ldmia   sp!, {r4 - r11, pc}
LBRX102:
        sub     r3, r0, #4
        mov     r2, r2, lsl #2
        str     r2, [sp, #0x40]
        ldrsh   r0, [r3, +r2]
        add     r4, r3, r2
        bl      __floatsisf
        ldrsh   r1, [r4, #2]
        mov     r4, r0
        mov     r0, r1
        bl      __floatsisf
        str     r0, [sp, #0x7C]
        ldr     r2, [r9]
        ldr     r0, [sp, #0x48]
        mov     r1, r4
        str     r2, [sp, #0x98]
        bl      __mulsf3
        ldr     r1, [sp, #0x98]
        bl      __addsf3
        ldr     r1, [sp, #0x7C]
        str     r0, [sp, #0x98]
        ldr     r0, [sp, #0x44]
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x98]
        bl      __subsf3
        ldr     r2, [r9, #4]
        str     r0, [sp, #0x74]
        ldr     r0, [sp, #0x44]
        str     r2, [sp, #0x98]
        mov     r1, r4
        bl      __mulsf3
        ldr     r1, [sp, #0x98]
        bl      __addsf3
        str     r0, [sp, #0x98]
        ldr     r0, [sp, #0x48]
        ldr     r1, [sp, #0x7C]
        bl      __mulsf3
        ldr     r1, [sp, #0x98]
        bl      __addsf3
        str     r0, [sp, #0x78]
        ldr     r0, [sp, #0x74]
        mov     r1, r5
        bl      __mulsf3
        ldr     r2, [pc, #-0x2F0]
        str     r0, [sp, #0x80]
        ldr     r1, [r2]
        str     r1, [sp, #0x48]
        bl      __gtsf2
        cmp     r0, #0
        bgt     LBRX105
        ldr     r2, [pc, #-0x308]
        ldr     r0, [sp, #0x80]
        ldr     r1, [r2]
        bl      __ltsf2
        cmp     r0, #0
        movlt   r2, #0
        sublt   r2, r2, #2, 18
        blt     LBRX106
        ldr     r2, [pc, #-0x324]
        ldr     r0, [sp, #0x80]
        ldr     r1, [r2]
        str     r1, [sp, #0x60]
        bl      __gtsf2
        cmp     r0, #0
        ble     LBRX103
        ldr     r2, [pc, #-0x33C]
        ldr     r1, [sp, #0x80]
        ldr     r0, [r2]
        bl      __addsf3
        str     r0, [sp, #0x80]
LBRX103:
        ldr     r0, [sp, #0x80]
        ldr     r1, [sp, #0x60]
        bl      __ltsf2
        cmp     r0, #0
        bge     LBRX104
        ldr     r2, [pc, #-0x364]
        ldr     r0, [sp, #0x80]
        ldr     r1, [r2]
        bl      __subsf3
        str     r0, [sp, #0x80]
LBRX104:
        ldr     r0, [sp, #0x80]
        bl      __fixsfsi
        mov     r0, r0, lsl #16
        mov     r2, r0, asr #16
        b       LBRX106
LBRX105:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r2, r2
LBRX106:
        ldr     r3, [sp, #0x40]
        sub     r6, r6, #4
        str     r6, [sp, #0x5C]
        strh    r2, [r6, +r3]
        ldr     r0, [sp, #0x78]
        mov     r1, r5
        bl      __mulsf3
        ldr     r1, [sp, #0x48]
        mov     r5, r0
        bl      __gtsf2
        cmp     r0, #0
        bgt     LBRX109
        ldr     r2, [pc, #-0x3D0]
        mov     r0, r5
        ldr     r1, [r2]
        bl      __ltsf2
        cmp     r0, #0
        mvnlt   r2, #0xFF
        biclt   r2, r2, #0x7F, 24
        blt     LBRX110
        ldr     r2, [pc, #-0x3EC]
        mov     r0, r5
        ldr     r1, [r2]
        str     r1, [sp, #0x60]
        bl      __gtsf2
        cmp     r0, #0
        ble     LBRX107
        ldr     r2, [pc, #-0x404]
        mov     r1, r5
        ldr     r0, [r2]
        bl      __addsf3
        mov     r5, r0
LBRX107:
        mov     r0, r5
        ldr     r1, [sp, #0x60]
        bl      __ltsf2
        cmp     r0, #0
        bge     LBRX108
        ldr     r2, [pc, #-0x42C]
        mov     r0, r5
        ldr     r1, [r2]
        bl      __subsf3
        mov     r5, r0
LBRX108:
        mov     r0, r5
        bl      __fixsfsi
        mov     r0, r0, lsl #16
        mov     r2, r0, asr #16
        b       LBRX110
LBRX109:
        mov     r2, #0
        sub     r2, r2, #2, 18
        mvn     r2, r2
LBRX110:
        ldr     r12, [sp, #0x5C]
        ldr     r3, [sp, #0x40]
        sub     r0, r11, #1
        cmp     r0, #0
        add     r12, r3, r12
        strh    r2, [r12, #2]
        ble     LBRX112
        add     r6, r9, #4
        sub     r5, r9, #4
        str     r9, [sp, #0xC]
        ldr     r9, [sp, #0x7C]
        str     r10, [sp, #0x4C]
        add     r7, r7, #4
        add     r8, r8, #4
        str     r11, [sp, #0x58]
        mov     r10, r0
LBRX111:
        ldr     r0, [r8, #4]
        mov     r1, r4
        bl      __mulsf3
        ldr     r2, [r8, #8]
        mov     r11, r0
        mov     r1, r9
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        ldr     r1, [sp, #0x74]
        ldr     r2, [r7, #4]
        mov     r11, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        ldr     r1, [sp, #0x78]
        ldr     r2, [r7, #8]
        mov     r11, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r1, [r6, #4]
        bl      __addsf3
        str     r0, [r5, #4]
        ldr     r0, [r8, #4]
        mov     r1, r9
        bl      __mulsf3
        ldr     r2, [r8, #8]!
        mov     r11, r0
        mov     r1, r4
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r1, [sp, #0x78]
        mov     r11, r0
        ldr     r0, [r7, #4]
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        ldr     r1, [sp, #0x74]
        mov     r11, r0
        ldr     r0, [r7, #8]!
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        ldr     r1, [r6, #8]!
        bl      __addsf3
        str     r0, [r5, #8]!
        subs    r10, r10, #1
        bne     LBRX111
        ldr     r10, [sp, #0x4C]
        ldr     r9, [sp, #0xC]
        ldr     r11, [sp, #0x58]
LBRX112:
        ldr     r8, [sp, #0x84]
        mov     r11, r11, lsl #3
        sub     r7, r11, #8
        ldr     r0, [r7, +r8]
        mov     r1, r4
        add     r11, r10, r7
        bl      __mulsf3
        add     r2, r8, r7
        str     r2, [sp, #0x98]
        ldr     r1, [sp, #0x7C]
        mov     r5, r0
        ldr     r0, [r2, #4]
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r5
        bl      __subsf3
        ldr     r6, [sp, #0x74]
        mov     r5, r0
        ldr     r0, [r7, +r10]
        mov     r1, r6
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r5
        bl      __subsf3
        ldr     r2, [r11, #4]
        ldr     r5, [sp, #0x78]
        str     r0, [sp, #0x94]
        mov     r0, r2
        mov     r1, r5
        bl      __mulsf3
        ldr     r1, [sp, #0x94]
        bl      __addsf3
        str     r0, [r7, +r9]
        ldr     r2, [sp, #0x98]
        mov     r1, r4
        add     r9, r9, r7
        ldr     r0, [r2, #4]
        bl      __mulsf3
        ldr     r1, [sp, #0x7C]
        ldr     r8, [r7, +r8]
        mov     r4, r0
        mov     r0, r8
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r11, [r11, #4]
        mov     r4, r0
        mov     r1, r6
        mov     r0, r11
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r4
        bl      __subsf3
        ldr     r10, [r7, +r10]
        mov     r4, r0
        mov     r1, r5
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r4
        bl      __subsf3
        str     r0, [r9, #4]
        mov     r0, #0
        add     sp, sp, #0xA0
        ldmia   sp!, {r4 - r11, pc}
LBRX113:
        rsb     lr, lr, #0
        and     lr, lr, #0x7F
        add     r5, r12, lr, lsl #23
        b       LBRX60


        .data
        .align  4


LBRX__2il0floatpacket.1:
        .byte   0x00,0x00,0x80,0x3F
LBRX__2il0floatpacket.2:
        .byte   0x00,0x00,0x00,0x00
LBRX__2il0floatpacket.3:
        .byte   0x00,0xFE,0xFF,0x46
LBRX__2il0floatpacket.4:
        .byte   0x00,0x00,0x00,0xC7
LBRX__2il0floatpacket.5:
        .byte   0x00,0x00,0x00,0x3F
LBRX__2il0floatpacket.6:
        .byte   0x00,0x00,0x80,0x3F
LBRX__2il0floatpacket.7:
        .byte   0x00,0xFE,0xFF,0x46
LBRX__2il0floatpacket.8:
        .byte   0x00,0x00,0x00,0xC7
LBRX__2il0floatpacket.9:
        .byte   0x00,0x00,0x00,0x00
LBRX__2il0floatpacket.10:
        .byte   0x00,0x00,0x00,0x3F


