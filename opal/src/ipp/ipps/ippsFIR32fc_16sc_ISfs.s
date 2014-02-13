        .text
        .align  4
        .globl  _ippsFIR32fc_16sc_ISfs


_ippsFIR32fc_16sc_ISfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        mov     r4, r2
        cmp     r4, #0
        mov     r5, r0
        mov     r8, r1
        beq     LBYA9
        cmp     r5, #0
        beq     LBYA9
        cmp     r8, #0
        ble     LBYA8
        ldr     r12, [r4, #0x58]
        ldr     lr, [pc, #0x78C]
        subs    r12, r12, lr
        beq     LBYA7
        adds    r12, r12, #2
        beq     LBYA0
        mvn     r0, #0x10
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LBYA0:
        ldr     r6, [r4, #0x4C]
        cmp     r8, #0
        ble     LBYA6
        and     lr, r6, #3
        mov     r7, #0
        mov     r12, #1, 20
        str     lr, [sp, #0x14]
        str     r3, [sp, #0x18]
LBYA1:
        cmp     r8, #1, 20
        mov     r7, r8
        mov     r12, #1, 20
        movgt   r7, r12
        mov     r2, r7
        mov     r1, r6
        mov     r0, r5
        bl      _ippsCopy_16sc
        ldr     r12, [sp, #0x14]
        sub     r8, r8, r7
        cmp     r12, #0
        bls     LBYA3
        cmp     r7, #0
        movle   r11, r7, lsl #2
        ble     LBYA5
        mov     r9, r5
        mov     r10, r6
        str     r5, [sp, #8]
        ldr     r5, [sp, #0x18]
        mov     r11, #0
LBYA2:
        ldrh    r0, [r10, #2]
        ldrh    lr, [r10], #4
        ldr     r12, [r4, #0x64]
        mov     r3, r5
        orr     r0, lr, r0, lsl #16
        mov     r2, r4
        mov     r1, r9
        blx     r12
        add     r11, r11, #1
        cmp     r11, r7
        add     r9, r9, #4
        blt     LBYA2
        ldr     r5, [sp, #8]
        mov     r11, r7, lsl #2
        b       LBYA5
LBYA3:
        ldr     r12, [r4, #0x2C]
        ldr     r9, [r4, #8]
        mov     lr, #0
        str     lr, [r4, #0x2C]
        ldr     lr, [r4, #0x28]
        ldr     r10, [r4, #4]
        ldr     r11, [sp, #0x18]
        ldr     r2, [r4, #0x1C]
        add     r12, r10, r12, lsl #2
        sub     lr, lr, r11
        str     lr, [sp, #0xC]
        add     r10, r9, #3
        add     lr, r12, #4
        cmp     r7, r2
        bic     r10, r10, #3
        str     lr, [sp, #0x10]
        add     r1, r12, r9, lsl #2
        ble     LBYA4
        mov     r0, r6
        bl      _ippsCopy_16sc
        ldr     r12, [sp, #0xC]
        str     r9, [sp]
        mov     r2, r5
        str     r12, [sp, #4]
        ldr     r1, [sp, #0x10]
        mov     r0, r4
        mov     r3, r10
        bl      ownsFIRSR_16sc_Sfs
        ldr     r1, [r4, #4]
        sub     r12, r6, r9, lsl #2
        mov     r11, r7, lsl #2
        add     r12, r12, r10, lsl #2
        add     lr, r6, r11
        add     r12, r12, #4
        str     r12, [sp, #0x10]
        sub     r0, lr, r9, lsl #2
        mov     r2, r9
        bl      _ippsCopy_16sc
        ldr     r12, [sp, #0xC]
        str     r9, [sp]
        add     r2, r5, r10, lsl #2
        str     r12, [sp, #4]
        ldr     r1, [sp, #0x10]
        sub     r3, r7, r10
        mov     r0, r4
        bl      ownsFIRSR_16sc_Sfs
        b       LBYA5
LBYA4:
        mov     r2, r7
        mov     r0, r6
        bl      _ippsCopy_16sc
        ldr     r12, [sp, #0xC]
        str     r9, [sp]
        mov     r2, r5
        str     r12, [sp, #4]
        ldr     r10, [sp, #0x10]
        mov     r0, r4
        mov     r3, r7
        mov     r1, r10
        bl      ownsFIRSR_16sc_Sfs
        ldr     r1, [r4, #4]
        mov     r11, r7, lsl #2
        add     r10, r11, r10
        sub     r0, r10, #4
        mov     r2, r9
        bl      _ippsCopy_16sc
LBYA5:
        cmp     r8, #0
        add     r5, r5, r11
        bgt     LBYA1
LBYA6:
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LBYA7:
        mov     r0, r4
        mov     r2, r8
        mov     r1, r5
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, lr}
        b       LBYA_ownsFIRMR32fc_16sc_ISfs
LBYA8:
        mvn     r0, #5
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LBYA9:
        mvn     r0, #7
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LBYA_ownsFIRMR32fc_16sc_ISfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x50
        mov     r6, r0
        ldr     r11, [r6, #0xC]
        ldr     r4, [r6, #0x10]
        mov     r7, r1
        ldr     r9, [r6, #0x4C]
        mov     r0, #1, 20
        mov     r1, r11
        mov     r5, r2
        mov     r8, r3
        bl      __intel_idiv
        cmp     r11, r4
        mov     lr, r7
        bgt     LBYA15
        cmp     r5, #0
        ble     LBYA14
        mov     r12, #0
        str     lr, [sp, #0x34]
        str     r9, [sp, #0x40]
        str     r0, [sp, #0x1C]
        str     r8, [sp, #0x18]
        str     r7, [sp, #0x38]
LBYA10:
        ldr     r12, [sp, #0x1C]
        ldr     r2, [r6, #0x1C]
        ldr     r7, [r6, #0x48]
        cmp     r12, r5
        mov     r10, r5
        ldr     lr, [r6, #0x20]
        movlt   r10, r12
        mul     r8, r10, r4
        ldr     r12, [r6, #0x28]
        ldr     r9, [r6, #0x30]
        ldr     r4, [r6, #4]
        str     lr, [sp, #0x2C]
        ldr     lr, [r6, #0x34]
        sub     r5, r5, r10
        cmp     r8, r2
        add     r1, r4, r7, lsl #2
        str     lr, [sp, #0x3C]
        mov     lr, r11, lsl #2
        str     lr, [sp, #0x30]
        ldr     lr, [sp, #0x18]
        sub     r12, r12, lr
        str     r12, [sp, #0x48]
        add     r12, r9, r11, lsl #4
        str     r12, [sp, #0x44]
        add     r12, r7, r8
        str     r12, [sp, #0x24]
        ble     LBYA12
        ldr     r0, [sp, #0x38]
        bl      _ippsCopy_16sc
        ldr     r12, [sp, #0x48]
        mov     r0, r4
        str     r12, [sp, #0x10]
        ldr     r12, [sp, #0x44]
        str     r7, [sp, #8]
        str     r9, [sp]
        str     r12, [sp, #0xC]
        mov     r12, #0
        str     r12, [sp, #4]
        ldr     r3, [sp, #0x3C]
        ldr     r2, [sp, #0x2C]
        ldr     r1, [sp, #0x40]
        ldr     r12, [r6, #0x6C]
        blx     r12
        str     r0, [sp, #0x20]
        ldr     r12, [sp, #0x38]
        mul     r11, r10, r11
        mov     r1, r4
        sub     r12, r12, r7, lsl #2
        add     r0, r12, r8, lsl #2
        str     r12, [sp, #0x28]
        str     r11, [sp, #0x4C]
        mov     r2, r7
        bl      _ippsCopy_16sc
        ldr     r1, [sp, #0x4C]
        ldr     r11, [sp, #0x2C]
        sub     r8, r1, r11
        ldr     r1, [sp, #0x30]
        mov     r0, r8
        bl      __intel_imod
        ldr     r1, [sp, #0x40]
        mov     r4, r0
        sub     r8, r8, r4
        add     r11, r1, r11, lsl #2
        cmp     r8, #0
        str     r11, [sp, #0x2C]
        ble     LBYA11
        ldr     r1, [sp, #0x30]
        sub     r8, r8, r1
        add     r4, r1, r4
LBYA11:
        ldr     r1, [sp, #0x48]
        mov     r2, r8
        str     r1, [sp, #0x10]
        ldr     r1, [sp, #0x44]
        str     r7, [sp, #8]
        str     r1, [sp, #0xC]
        ldr     r1, [sp, #0x20]
        str     r9, [sp]
        str     r1, [sp, #4]
        ldr     r0, [sp, #0x28]
        ldr     r3, [sp, #0x3C]
        ldr     r1, [sp, #0x2C]
        ldr     r12, [r6, #0x6C]
        blx     r12
        ldr     r12, [sp, #0x48]
        ldr     r1, [sp, #0x2C]
        mov     r2, r4
        str     r12, [sp, #0x14]
        ldr     r12, [sp, #0x24]
        add     r1, r1, r8, lsl #2
        str     r12, [sp, #0x10]
        ldr     r12, [sp, #0x44]
        str     r0, [sp, #4]
        str     r7, [sp, #8]
        str     r12, [sp, #0xC]
        str     r9, [sp]
        ldr     r3, [sp, #0x3C]
        ldr     r0, [sp, #0x28]
        bl      ownsMRtail_16sc_Sfs
        b       LBYA13
LBYA12:
        mul     r11, r10, r11
        ldr     r0, [sp, #0x38]
        mov     r2, r8
        str     r11, [sp, #0x4C]
        bl      _ippsCopy_16sc
        ldr     r0, [sp, #0x4C]
        ldr     r1, [sp, #0x30]
        bl      __intel_imod
        ldr     r12, [sp, #0x48]
        str     r12, [sp, #0x10]
        ldr     r12, [sp, #0x44]
        str     r7, [sp, #8]
        str     r9, [sp]
        str     r12, [sp, #0xC]
        mov     r12, #0
        str     r12, [sp, #4]
        ldr     lr, [sp, #0x4C]
        ldr     r12, [r6, #0x6C]
        ldr     r1, [sp, #0x40]
        ldr     r11, [sp, #0x3C]
        sub     r2, lr, r0
        str     r2, [sp, #0x4C]
        str     r0, [sp, #0x30]
        mov     r0, r4
        mov     r3, r11
        blx     r12
        ldr     r12, [sp, #0x40]
        ldr     lr, [sp, #0x4C]
        mov     r3, r11
        add     r1, r12, lr, lsl #2
        ldr     r12, [sp, #0x48]
        str     r12, [sp, #0x14]
        ldr     r12, [sp, #0x24]
        str     r12, [sp, #0x10]
        ldr     r12, [sp, #0x44]
        str     r0, [sp, #4]
        str     r7, [sp, #8]
        str     r12, [sp, #0xC]
        str     r9, [sp]
        ldr     r2, [sp, #0x30]
        mov     r0, r4
        bl      ownsMRtail_16sc_Sfs
        add     r0, r4, r8, lsl #2
        mov     r2, r7
        mov     r1, r4
        bl      _ippsCopy_16sc
LBYA13:
        ldr     r12, [r6, #0xC]
        ldr     r1, [sp, #0x34]
        ldr     r0, [sp, #0x40]
        mul     r2, r12, r10
        bl      _ippsCopy_16sc
        ldr     r4, [r6, #0x10]
        ldr     r11, [r6, #0xC]
        ldr     lr, [sp, #0x38]
        mul     r12, r10, r4
        cmp     r5, #0
        mul     r10, r10, r11
        add     r12, lr, r12, lsl #2
        str     r12, [sp, #0x38]
        ldr     r12, [sp, #0x34]
        add     r10, r12, r10, lsl #2
        str     r10, [sp, #0x34]
        bgt     LBYA10
LBYA14:
        mov     r0, #0
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LBYA15:
        mul     r9, r4, r5
        mov     r0, r9
        bl      _ippsMalloc_16sc
        mov     r4, r0
        cmp     r4, #0
        bne     LBYA16
        mvn     r0, #8
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LBYA16:
        mov     r2, r9
        mov     r0, r7
        mov     r1, r4
        bl      _ippsCopy_16sc
        str     r8, [sp]
        mov     r0, r6
        mov     r3, r5
        mov     r2, r7
        mov     r1, r4
        bl      LBYA_ownsFIRMR_16sc_Sfs
        mov     r0, r4
        bl      _ippsFree
        mov     r0, #0
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LBYA_ownsFIRMR_16sc_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x34
        mov     r6, r0
        ldr     lr, [r6, #0x10]
        ldr     r12, [r6, #0xC]
        mov     r0, r3
        mul     r11, r0, lr
        ldr     r3, [r6, #0x1C]
        mul     r0, r0, r12
        ldr     lr, [sp, #0x58]
        cmp     r11, r3
        str     r0, [sp, #0x2C]
        ldr     r4, [r6, #0x28]
        ldr     r5, [r6, #0x48]
        ldr     r9, [r6, #0x30]
        ldr     r10, [r6, #4]
        str     r1, [sp, #0x20]
        sub     r8, r4, lr
        ldr     lr, [r6, #0x20]
        str     r2, [sp, #0x30]
        add     r7, r9, r12, lsl #4
        add     r1, r10, r5, lsl #2
        str     lr, [sp, #0x24]
        ldr     r4, [r6, #0x34]
        mov     lr, r12, lsl #2
        add     r12, r5, r11
        str     lr, [sp, #0x28]
        str     r12, [sp, #0x1C]
        ble     LBYA18
        ldr     r0, [sp, #0x20]
        mov     r2, r3
        bl      _ippsCopy_16sc
        mov     r12, #0
        str     r12, [sp, #4]
        str     r8, [sp, #0x10]
        str     r7, [sp, #0xC]
        str     r5, [sp, #8]
        str     r9, [sp]
        ldr     r2, [sp, #0x24]
        ldr     r1, [sp, #0x30]
        ldr     r12, [r6, #0x6C]
        mov     r0, r10
        mov     r3, r4
        blx     r12
        ldr     r12, [sp, #0x20]
        str     r0, [sp, #0x18]
        mov     r1, r10
        sub     r12, r12, r5, lsl #2
        add     r0, r12, r11, lsl #2
        str     r12, [sp, #0x20]
        mov     r2, r5
        bl      _ippsCopy_16sc
        ldr     r1, [sp, #0x24]
        ldr     r12, [sp, #0x2C]
        sub     r11, r12, r1
        ldr     r12, [sp, #0x30]
        mov     r0, r11
        add     r1, r12, r1, lsl #2
        str     r1, [sp, #0x24]
        ldr     r1, [sp, #0x28]
        bl      __intel_imod
        mov     r10, r0
        sub     r11, r11, r10
        cmp     r11, #0
        ble     LBYA17
        ldr     r1, [sp, #0x28]
        sub     r11, r11, r1
        add     r10, r1, r10
LBYA17:
        ldr     r1, [sp, #0x18]
        str     r8, [sp, #0x10]
        str     r7, [sp, #0xC]
        str     r1, [sp, #4]
        str     r5, [sp, #8]
        str     r9, [sp]
        ldr     r0, [sp, #0x20]
        ldr     r1, [sp, #0x24]
        ldr     r6, [r6, #0x6C]
        mov     r3, r4
        mov     r2, r11
        blx     r6
        ldr     r1, [sp, #0x24]
        str     r8, [sp, #0x14]
        ldr     r12, [sp, #0x1C]
        str     r0, [sp, #4]
        str     r7, [sp, #0xC]
        str     r12, [sp, #0x10]
        str     r5, [sp, #8]
        str     r9, [sp]
        ldr     r0, [sp, #0x20]
        add     r1, r1, r11, lsl #2
        mov     r3, r4
        mov     r2, r10
        bl      ownsMRtail_16sc_Sfs
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LBYA18:
        ldr     r0, [sp, #0x20]
        mov     r2, r11
        bl      _ippsCopy_16sc
        mov     r12, #0
        str     r12, [sp, #4]
        ldr     r1, [sp, #0x28]
        str     r8, [sp, #0x10]
        str     r7, [sp, #0xC]
        str     r5, [sp, #8]
        str     r9, [sp]
        ldr     r6, [r6, #0x6C]
        add     r11, r10, r11, lsl #2
        str     r6, [sp, #0x28]
        ldr     r6, [sp, #0x2C]
        str     r11, [sp, #0x24]
        ldr     r11, [sp, #0x30]
        mov     r0, r6
        bl      __intel_imod
        ldr     r12, [sp, #0x28]
        str     r0, [sp, #0x20]
        sub     r6, r6, r0
        mov     r0, r10
        mov     r2, r6
        mov     r1, r11
        mov     r3, r4
        blx     r12
        str     r8, [sp, #0x14]
        ldr     r12, [sp, #0x1C]
        str     r0, [sp, #4]
        str     r12, [sp, #0x10]
        str     r7, [sp, #0xC]
        str     r9, [sp]
        str     r5, [sp, #8]
        ldr     r2, [sp, #0x20]
        add     r1, r11, r6, lsl #2
        mov     r3, r4
        mov     r0, r10
        bl      ownsMRtail_16sc_Sfs
        ldr     r0, [sp, #0x24]
        mov     r2, r5
        mov     r1, r10
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsCopy_16sc
        .long   0x46493038


