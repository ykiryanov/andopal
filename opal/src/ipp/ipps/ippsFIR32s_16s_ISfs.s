        .text
        .align  4
        .globl  _ippsFIR32s_16s_ISfs


_ippsFIR32s_16s_ISfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        mov     r5, r2
        cmp     r5, #0
        mov     r4, r0
        mov     r7, r1
        mov     r8, r3
        beq     LBVB11
        cmp     r4, #0
        beq     LBVB11
        cmp     r7, #0
        ble     LBVB10
        ldr     lr, [r5, #0x58]
        ldr     r12, [pc, #0xBAC]
        subs    lr, lr, r12
        beq     LBVB5
        adds    r12, lr, #0xF8
        beq     LBVB0
        mvn     r0, #0x10
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LBVB0:
        ldr     r6, [r5, #0x4C]
        cmp     r7, #0
        ble     LBVB4
        mov     r12, #0
        mov     lr, #1, 20
        str     r8, [sp, #0x14]
LBVB1:
        cmp     r7, #1, 20
        mov     r8, r7
        mov     r12, #1, 20
        movgt   r8, r12
        mov     r2, r8
        mov     r1, r6
        mov     r0, r4
        bl      _ippsCopy_16s
        ldr     r12, [r5, #0x2C]
        ldr     r9, [r5, #8]
        ldr     lr, [r5, #4]
        ldr     r2, [r5, #0x1C]
        mov     r10, #0
        str     r10, [r5, #0x2C]
        add     r12, lr, r12, lsl #1
        ldr     lr, [r5, #0x28]
        add     r10, r9, #3
        bic     r11, r10, #3
        ldr     r10, [sp, #0x14]
        sub     r7, r7, r8
        cmp     r8, r2
        add     r1, r12, r9, lsl #1
        sub     lr, lr, r10
        str     lr, [sp, #8]
        sub     lr, r6, r9, lsl #1
        add     lr, lr, r11, lsl #1
        add     lr, lr, #2
        str     lr, [sp, #0x10]
        add     r10, r12, #2
        ble     LBVB2
        mov     r0, r6
        bl      _ippsCopy_16s
        ldr     r12, [sp, #8]
        str     r9, [sp]
        mov     r1, r10
        str     r12, [sp, #4]
        ldr     r12, [r5, #0x68]
        mov     r2, r4
        mov     r0, r5
        mov     r3, r11
        blx     r12
        ldr     r1, [r5, #4]
        mov     r12, r8, lsl #1
        str     r12, [sp, #0xC]
        add     r12, r6, r12
        mov     r2, r9
        sub     r0, r12, r9, lsl #1
        bl      _ippsCopy_16s
        ldr     r12, [sp, #8]
        str     r9, [sp]
        sub     r3, r8, r11
        str     r12, [sp, #4]
        ldr     r1, [sp, #0x10]
        ldr     r12, [r5, #0x68]
        add     r2, r4, r11, lsl #1
        mov     r0, r5
        blx     r12
        b       LBVB3
LBVB2:
        mov     r2, r8
        mov     r0, r6
        bl      _ippsCopy_16s
        ldr     r12, [sp, #8]
        str     r9, [sp]
        mov     r2, r4
        str     r12, [sp, #4]
        ldr     r12, [r5, #0x68]
        mov     r3, r8
        mov     r1, r10
        mov     r0, r5
        blx     r12
        ldr     r1, [r5, #4]
        mov     r8, r8, lsl #1
        add     r10, r8, r10
        sub     r0, r10, #2
        str     r8, [sp, #0xC]
        mov     r2, r9
        bl      _ippsCopy_16s
LBVB3:
        ldr     r12, [sp, #0xC]
        cmp     r7, #0
        add     r4, r4, r12
        bgt     LBVB1
LBVB4:
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LBVB5:
        ldr     r9, [r5, #0xC]
        ldr     r11, [r5, #0x10]
        ldr     r6, [r5, #0x4C]
        mov     r1, r9
        mov     r0, #1, 20
        bl      __intel_idiv
        cmp     r9, r11
        mov     r10, r0
        mov     r9, r4
        bgt     LBVB7
        cmp     r7, #0
        ble     LBVB8
LBVB6:
        cmp     r10, r7
        mov     r11, r7
        str     r8, [sp]
        movlt   r11, r10
        mov     r2, r6
        mov     r1, r9
        mov     r0, r5
        mov     r3, r11
        bl      LBVB_ownsFIRMR_16s_Sfs
        ldr     r12, [r5, #0xC]
        sub     r7, r7, r11
        mov     r0, r6
        mul     r2, r12, r11
        mov     r1, r4
        bl      _ippsCopy_16s
        ldr     r12, [r5, #0x10]
        ldr     lr, [r5, #0xC]
        cmp     r7, #0
        mul     r12, r11, r12
        mul     r11, lr, r11
        add     r9, r9, r12, lsl #1
        add     r4, r4, r11, lsl #1
        bgt     LBVB6
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LBVB7:
        mul     r11, r11, r7
        mov     r0, r11
        bl      _ippsMalloc_16s
        mov     r6, r0
        cmp     r6, #0
        bne     LBVB9
LBVB8:
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LBVB9:
        mov     r2, r11
        mov     r0, r4
        mov     r1, r6
        bl      _ippsCopy_16s
        str     r8, [sp]
        mov     r0, r5
        mov     r3, r7
        mov     r2, r4
        mov     r1, r6
        bl      LBVB_ownsFIRMR_16s_Sfs
        mov     r0, r6
        bl      _ippsFree
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LBVB10:
        mvn     r0, #5
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LBVB11:
        mvn     r0, #7
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LBVB_ownsFIRMR_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x84
        mov     r10, r0
        ldr     lr, [r10, #0x10]
        ldr     r12, [r10, #0xC]
        mov     r0, r3
        mul     r7, r0, lr
        ldr     lr, [sp, #0xA8]
        mul     r0, r0, r12
        str     r12, [sp, #0x80]
        ldr     r3, [r10, #0x1C]
        cmp     r7, r3
        str     r0, [sp, #0x68]
        ldr     r5, [r10, #0x28]
        ldr     r8, [r10, #0x30]
        ldr     r6, [r10, #0x48]
        ldr     r4, [r10, #4]
        str     r1, [sp, #0x6C]
        sub     r9, r5, lr
        ldr     lr, [r10, #0x20]
        str     r2, [sp, #0x64]
        add     r1, r4, r6, lsl #1
        str     lr, [sp, #0x78]
        ldr     r11, [r10, #0x5C]
        ldr     r5, [r10, #0x34]
        mov     lr, r12, lsl #2
        add     r12, r8, r12, lsl #4
        str     r12, [sp, #0x7C]
        add     r12, r6, r7
        str     lr, [sp, #0x70]
        str     r12, [sp, #0x5C]
        ble     LBVB23
        ldr     r0, [sp, #0x6C]
        mov     r2, r3
        bl      _ippsCopy_16s
        str     r9, [sp, #0x10]
        ldr     r12, [sp, #0x7C]
        str     r11, [sp, #8]
        str     r8, [sp]
        str     r12, [sp, #0xC]
        mov     r12, #0
        str     r12, [sp, #4]
        ldr     r2, [sp, #0x78]
        ldr     r1, [sp, #0x64]
        ldr     r12, [r10, #0x6C]
        mov     r0, r4
        mov     r3, r5
        blx     r12
        ldr     r12, [sp, #0x6C]
        str     r0, [sp, #0x74]
        mov     r1, r4
        sub     r12, r12, r6, lsl #1
        add     r0, r12, r7, lsl #1
        str     r12, [sp, #0x6C]
        mov     r2, r6
        bl      _ippsCopy_16s
        ldr     r1, [sp, #0x78]
        ldr     r2, [sp, #0x68]
        sub     r4, r2, r1
        ldr     r1, [sp, #0x70]
        mov     r0, r4
        bl      __intel_imod
        ldr     r12, [sp, #0x78]
        ldr     r1, [sp, #0x64]
        mov     r6, r0
        sub     r4, r4, r6
        cmp     r4, #0
        add     r12, r1, r12, lsl #1
        str     r12, [sp, #0x78]
        ble     LBVB12
        ldr     r1, [sp, #0x70]
        sub     r4, r4, r1
        add     r6, r1, r6
LBVB12:
        ldr     r1, [sp, #0x74]
        str     r9, [sp, #0x10]
        mov     r3, r5
        str     r1, [sp, #4]
        ldr     r1, [sp, #0x7C]
        str     r11, [sp, #8]
        str     r8, [sp]
        str     r1, [sp, #0xC]
        ldr     r0, [sp, #0x6C]
        ldr     r1, [sp, #0x78]
        ldr     r10, [r10, #0x6C]
        mov     r2, r4
        blx     r10
        str     r0, [sp, #0x70]
        ldr     r1, [sp, #0x78]
        cmp     r6, #0
        mov     r12, r8
        add     r1, r1, r4, lsl #1
        mov     r4, r5
        addle   sp, sp, #0x84
        ldmleia sp!, {r4 - r11, pc}
        cmp     r9, #0x1F
        mov     r2, r9
        mov     lr, #0x1F
        movgt   r2, lr
        cmn     r2, #0x1F
        mvn     r7, #0x1E
        mvn     lr, #0xFF
        mov     r10, #0
        str     r10, [sp, #0x74]
        movlt   r2, r7
        bic     lr, lr, #0x7F, 24
        mov     r7, #1
        ldr     r7, [sp, #0x74]
        sub     r10, r11, #5
        mvn     lr, lr
        mvn     r0, #0
        str     r0, [sp, #0x60]
        str     lr, [sp, #0x54]
        str     r10, [sp, #0x68]
        str     r2, [sp, #0x4C]
        str     r12, [sp, #0x44]
        str     r1, [sp, #0x48]
        str     r6, [sp, #0x58]
        str     r9, [sp, #0x28]
        str     r5, [sp, #0x38]
        str     r8, [sp, #0x34]
LBVB13:
        cmp     r7, #0
        ble     LBVB14
        tst     r7, #3
        bne     LBVB14
        ldr     r1, [sp, #0x7C]
        ldr     r0, [sp, #0x44]
        cmp     r0, r1
        bcc     LBVB14
        ldr     r1, [sp, #0x34]
        ldr     r0, [sp, #0x80]
        ldr     r4, [sp, #0x38]
        ldr     r0, [r1, +r0, lsl #4]
        str     r1, [sp, #0x44]
        ldr     r1, [sp, #0x70]
        add     r1, r0, r1
        str     r1, [sp, #0x70]
LBVB14:
        ldr     r1, [sp, #0x44]
        cmp     r11, #0
        ldr     r0, [r1], #4
        str     r1, [sp, #0x44]
        ldr     r1, [sp, #0x70]
        add     r0, r0, r1
        movle   r5, #0
        movle   r6, r5
        ble     LBVB18
        cmp     r11, #5
        blt     LBVB39
        ldr     r2, [sp, #0x6C]
        add     r3, r0, #1
        mov     r1, #6
        mov     r10, #0
        mov     r6, r10
        str     r3, [sp, #0x3C]
        mov     r5, r6
        add     r2, r2, r0, lsl #1
        mov     r9, r0
        add     r8, r0, #2
        add     lr, r0, #3
        str     r1, [sp, #0x64]
        str     r0, [sp, #0x78]
        ldr     r1, [sp, #0x3C]
        ldr     r0, [sp, #0x5C]
        str     r5, [sp, #0x40]
        mov     r12, #2
        mov     r3, #4
        str     r7, [sp, #0x74]
        str     r11, [sp, #0x50]
LBVB15:
        cmp     r0, r9
        ble     LBVB38
        ldrsh   r7, [r4, +r10]
        ldrsh   r11, [r2]
        mul     r7, r11, r7
        adds    r6, r6, r7
        adc     r5, r5, r7, asr #31
        cmp     r0, r1
        ble     LBVB37
        ldrsh   r7, [r4, +r12]
        ldrsh   r11, [r2, #2]
        mul     r7, r11, r7
        adds    r6, r6, r7
        adc     r5, r5, r7, asr #31
        cmp     r0, r8
        ble     LBVB36
        ldrsh   r7, [r4, +r3]
        ldrsh   r11, [r2, #4]
        mul     r7, r11, r7
        adds    r6, r6, r7
        adc     r5, r5, r7, asr #31
        cmp     r0, lr
        ble     LBVB35
        ldr     r7, [sp, #0x64]
        ldrsh   r11, [r2, #6]
        add     r9, r9, #4
        ldrsh   r7, [r4, +r7]
        add     r1, r1, #4
        add     r8, r8, #4
        add     lr, lr, #4
        mul     r11, r11, r7
        ldr     r7, [sp, #0x40]
        add     r10, r10, #8
        add     r2, r2, #8
        add     r7, r7, #4
        adds    r6, r6, r11
        adc     r5, r5, r11, asr #31
        ldr     r11, [sp, #0x68]
        str     r7, [sp, #0x40]
        add     r12, r12, #8
        add     r3, r3, #8
        cmp     r7, r11
        ldr     r7, [sp, #0x64]
        add     r7, r7, #8
        str     r7, [sp, #0x64]
        ble     LBVB15
        ldr     r0, [sp, #0x78]
        ldr     r7, [sp, #0x74]
        ldr     r11, [sp, #0x50]
LBVB16:
        ldr     r2, [sp, #0x6C]
        ldr     r12, [sp, #0x40]
        ldr     lr, [sp, #0x5C]
        add     r3, r2, r0, lsl #1
        add     r0, r12, r0
        mov     r2, r12, lsl #1
        add     r3, r3, r12, lsl #1
        ldr     r12, [sp, #0x40]
LBVB17:
        cmp     lr, r0
        ble     LBVB18
        ldrsh   r8, [r4, +r2]
        ldrsh   r9, [r3], #2
        add     r0, r0, #1
        add     r2, r2, #2
        mul     r8, r9, r8
        add     r12, r12, #1
        adds    r6, r6, r8
        adc     r5, r5, r8, asr #31
        cmp     r12, r11
        blt     LBVB17
LBVB18:
        ldr     r2, [sp, #0x28]
        add     r4, r4, r11, lsl #1
        cmp     r2, #0
        beq     LBVB20
        ldr     r2, [sp, #0x4C]
        cmp     r2, #0
        ble     LBVB19
        mov     r0, r6
        mov     r1, r5
        ldr     r2, [sp, #0x4C]
        mov     r3, #0
        bl      __ashldi3
        mov     r6, r0
        mov     r5, r1
        b       LBVB20
LBVB19:
        ldr     r2, [sp, #0x4C]
        mov     r0, r6
        mov     r1, r5
        rsb     r2, r2, #0
        str     r2, [sp, #0x78]
        sub     r12, r2, #1
        mov     r3, r2, asr #31
        str     r3, [sp, #0x64]
        mov     lr, #1
        mov     r8, lr, lsl r12
        bl      __ashrdi3
        sub     r8, r8, #1
        adds    r6, r6, r8
        ldr     r2, [sp, #0x78]
        ldr     r3, [sp, #0x64]
        and     r0, r0, #1
        adc     r8, r5, r8, asr #31
        adds    r0, r6, r0
        adc     r1, r8, #0
        bl      __ashrdi3
        mov     r6, r0
        mov     r5, r1
LBVB20:
        ldr     r2, [sp, #0x54]
        subs    r2, r6, r2
        sbcs    r3, r5, #0
        movlt   r2, #0
        movlt   r3, #0
        orrs    r3, r2, r3
        bne     LBVB21
        mov     r2, #0
        sub     r2, r2, #2, 18
        cmp     r6, r2
        ldr     r2, [sp, #0x60]
        sbcs    r5, r5, r2
        movge   r6, r6, lsl #16
        movge   r1, r6, asr #16
        movlt   r0, #0
        sublt   r1, r0, #2, 18
        b       LBVB22
LBVB21:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r1, r0
LBVB22:
        ldr     r0, [sp, #0x48]
        add     r7, r7, #1
        strh    r1, [r0], #2
        ldr     r1, [sp, #0x58]
        str     r0, [sp, #0x48]
        cmp     r7, r1
        blt     LBVB13
        add     sp, sp, #0x84
        ldmia   sp!, {r4 - r11, pc}
LBVB23:
        ldr     r0, [sp, #0x6C]
        mov     r2, r7
        bl      _ippsCopy_16s
        ldr     r1, [sp, #0x70]
        ldr     r0, [sp, #0x68]
        str     r9, [sp, #0x10]
        bl      __intel_imod
        ldr     r12, [sp, #0x7C]
        str     r11, [sp, #8]
        str     r8, [sp]
        str     r12, [sp, #0xC]
        mov     r12, #0
        str     r12, [sp, #4]
        ldr     r12, [r10, #0x6C]
        ldr     lr, [sp, #0x68]
        ldr     r1, [sp, #0x64]
        str     r0, [sp, #0x78]
        sub     r10, lr, r0
        mov     r3, r5
        mov     r2, r10
        mov     r0, r4
        blx     r12
        ldr     r12, [sp, #0x78]
        str     r0, [sp, #0x60]
        cmp     r12, #0
        ldr     r12, [sp, #0x64]
        add     r10, r12, r10, lsl #1
        str     r10, [sp, #0x70]
        str     r8, [sp, #0x6C]
        str     r5, [sp, #0x64]
        ble     LBVB34
        cmp     r9, #0x1F
        mov     r12, r9
        mov     lr, #0x1F
        movgt   r12, lr
        cmn     r12, #0x1F
        mvn     lr, #0x1E
        movlt   r12, lr
        rsb     lr, r12, #0
        str     r12, [sp, #0x68]
        mov     r12, #1
        sub     r0, lr, #1
        mov     r12, r12, lsl r0
        mvn     r10, #0xFF
        mov     r1, lr, asr #31
        bic     r0, r10, #0x7F, 24
        str     r6, [sp, #0x4C]
        ldr     r6, [sp, #0x64]
        str     r1, [sp, #0x74]
        sub     r12, r12, #1
        sub     r1, r11, #5
        mvn     r0, r0
        mvn     r2, #0
        mov     r10, #0
        str     r2, [sp, #0x2C]
        str     r0, [sp, #0x24]
        str     r1, [sp, #0x44]
        str     r12, [sp, #0x40]
        str     lr, [sp, #0x3C]
        str     r7, [sp, #0x48]
        str     r9, [sp, #0x28]
        str     r4, [sp, #0x20]
        str     r5, [sp, #0x38]
        str     r8, [sp, #0x34]
LBVB24:
        cmp     r10, #0
        ble     LBVB25
        tst     r10, #3
        bne     LBVB25
        ldr     r0, [sp, #0x7C]
        ldr     r1, [sp, #0x6C]
        cmp     r1, r0
        bcc     LBVB25
        ldr     r1, [sp, #0x34]
        ldr     r0, [sp, #0x80]
        ldr     r6, [sp, #0x38]
        ldr     r0, [r1, +r0, lsl #4]
        str     r1, [sp, #0x6C]
        ldr     r1, [sp, #0x60]
        add     r1, r0, r1
        str     r1, [sp, #0x60]
LBVB25:
        ldr     r1, [sp, #0x6C]
        cmp     r11, #0
        ldr     r0, [r1], #4
        str     r1, [sp, #0x6C]
        ldr     r1, [sp, #0x60]
        add     r0, r0, r1
        movle   r4, #0
        movle   r5, r4
        ble     LBVB29
        cmp     r11, #5
        blt     LBVB44
        ldr     r2, [sp, #0x20]
        add     r3, r0, #1
        mov     r1, #6
        mov     r9, #0
        mov     r5, r9
        str     r3, [sp, #0x18]
        mov     r4, r5
        add     r2, r2, r0, lsl #1
        mov     r8, r0
        add     r7, r0, #2
        add     lr, r0, #3
        str     r1, [sp, #0x30]
        str     r0, [sp, #0x58]
        ldr     r1, [sp, #0x18]
        ldr     r0, [sp, #0x5C]
        str     r4, [sp, #0x1C]
        mov     r12, #2
        mov     r3, #4
        str     r10, [sp, #0x54]
        str     r11, [sp, #0x50]
LBVB26:
        cmp     r0, r8
        ble     LBVB43
        ldrsh   r11, [r6, +r9]
        ldrsh   r10, [r2]
        mul     r11, r10, r11
        adds    r5, r5, r11
        adc     r4, r4, r11, asr #31
        cmp     r0, r1
        ble     LBVB42
        ldrsh   r11, [r6, +r12]
        ldrsh   r10, [r2, #2]
        mul     r11, r10, r11
        adds    r5, r5, r11
        adc     r4, r4, r11, asr #31
        cmp     r0, r7
        ble     LBVB41
        ldrsh   r11, [r6, +r3]
        ldrsh   r10, [r2, #4]
        mul     r11, r10, r11
        adds    r5, r5, r11
        adc     r4, r4, r11, asr #31
        cmp     r0, lr
        ble     LBVB40
        ldr     r10, [sp, #0x30]
        ldrsh   r11, [r2, #6]
        add     r8, r8, #4
        ldrsh   r10, [r6, +r10]
        add     r1, r1, #4
        add     r7, r7, #4
        add     lr, lr, #4
        mul     r11, r11, r10
        ldr     r10, [sp, #0x1C]
        add     r9, r9, #8
        add     r2, r2, #8
        add     r10, r10, #4
        adds    r5, r5, r11
        adc     r4, r4, r11, asr #31
        ldr     r11, [sp, #0x44]
        str     r10, [sp, #0x1C]
        add     r12, r12, #8
        add     r3, r3, #8
        cmp     r10, r11
        ldr     r10, [sp, #0x30]
        add     r10, r10, #8
        str     r10, [sp, #0x30]
        ble     LBVB26
        ldr     r0, [sp, #0x58]
        ldr     r10, [sp, #0x54]
        ldr     r11, [sp, #0x50]
LBVB27:
        ldr     r2, [sp, #0x20]
        ldr     r12, [sp, #0x1C]
        ldr     lr, [sp, #0x1C]
        add     r3, r2, r0, lsl #1
        add     r0, r12, r0
        mov     r2, r12, lsl #1
        add     r3, r3, r12, lsl #1
        ldr     r12, [sp, #0x5C]
LBVB28:
        cmp     r12, r0
        ble     LBVB29
        ldrsh   r8, [r6, +r2]
        ldrsh   r7, [r3], #2
        add     r0, r0, #1
        add     r2, r2, #2
        mul     r8, r7, r8
        add     lr, lr, #1
        adds    r5, r5, r8
        adc     r4, r4, r8, asr #31
        cmp     lr, r11
        blt     LBVB28
LBVB29:
        ldr     r2, [sp, #0x28]
        add     r6, r6, r11, lsl #1
        cmp     r2, #0
        beq     LBVB31
        ldr     r2, [sp, #0x68]
        cmp     r2, #0
        ble     LBVB30
        mov     r0, r5
        mov     r1, r4
        ldr     r2, [sp, #0x68]
        mov     r3, #0
        bl      __ashldi3
        mov     r5, r0
        mov     r4, r1
        b       LBVB31
LBVB30:
        mov     r0, r5
        mov     r1, r4
        ldr     r8, [sp, #0x3C]
        ldr     r7, [sp, #0x74]
        mov     r2, r8
        mov     r3, r7
        bl      __ashrdi3
        ldr     r12, [sp, #0x40]
        and     r0, r0, #1
        mov     r2, r8
        adds    r5, r5, r12
        adc     r12, r4, r12, asr #31
        adds    r0, r5, r0
        adc     r1, r12, #0
        mov     r3, r7
        bl      __ashrdi3
        mov     r5, r0
        mov     r4, r1
LBVB31:
        ldr     r2, [sp, #0x24]
        subs    r2, r5, r2
        sbcs    r3, r4, #0
        movlt   r2, #0
        movlt   r3, #0
        orrs    r3, r2, r3
        bne     LBVB32
        mov     r2, #0
        sub     r2, r2, #2, 18
        cmp     r5, r2
        ldr     r2, [sp, #0x2C]
        sbcs    r4, r4, r2
        movge   r5, r5, lsl #16
        movge   r1, r5, asr #16
        mvnlt   r0, #0xFF
        biclt   r1, r0, #0x7F, 24
        b       LBVB33
LBVB32:
        mov     r0, #0
        sub     r0, r0, #2, 18
        mvn     r1, r0
LBVB33:
        ldr     r0, [sp, #0x70]
        add     r10, r10, #1
        strh    r1, [r0], #2
        ldr     r1, [sp, #0x78]
        str     r0, [sp, #0x70]
        cmp     r10, r1
        blt     LBVB24
        ldr     r7, [sp, #0x48]
        ldr     r4, [sp, #0x20]
        ldr     r6, [sp, #0x4C]
LBVB34:
        add     r0, r4, r7, lsl #1
        mov     r2, r6
        mov     r1, r4
        add     sp, sp, #0x84
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsCopy_16s
LBVB35:
        ldr     r7, [sp, #0x74]
        ldr     r11, [sp, #0x50]
        b       LBVB18
LBVB36:
        ldr     r7, [sp, #0x74]
        ldr     r11, [sp, #0x50]
        b       LBVB18
LBVB37:
        ldr     r7, [sp, #0x74]
        ldr     r11, [sp, #0x50]
        b       LBVB18
LBVB38:
        ldr     r7, [sp, #0x74]
        ldr     r11, [sp, #0x50]
        b       LBVB18
LBVB39:
        mov     r6, #0
        str     r6, [sp, #0x40]
        mov     r5, r6
        b       LBVB16
LBVB40:
        ldr     r10, [sp, #0x54]
        ldr     r11, [sp, #0x50]
        b       LBVB29
LBVB41:
        ldr     r10, [sp, #0x54]
        ldr     r11, [sp, #0x50]
        b       LBVB29
LBVB42:
        ldr     r10, [sp, #0x54]
        ldr     r11, [sp, #0x50]
        b       LBVB29
LBVB43:
        ldr     r10, [sp, #0x54]
        ldr     r11, [sp, #0x50]
        b       LBVB29
LBVB44:
        mov     r5, #0
        str     r5, [sp, #0x1C]
        mov     r4, r5
        b       LBVB27
        .long   0x46493131


