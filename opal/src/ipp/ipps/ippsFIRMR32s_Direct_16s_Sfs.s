        .text
        .align  4
        .globl  _ippsFIRMR32s_Direct_16s_Sfs


_ippsFIRMR32s_Direct_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x48
        ldr     r9, [sp, #0x6C]
        ldr     r6, [sp, #0x70]
        ldr     r4, [sp, #0x74]
        ldr     lr, [sp, #0x78]
        ldr     r7, [sp, #0x7C]
        ldr     r12, [sp, #0x80]
        ldr     r11, [sp, #0x84]
        ldr     r8, [sp, #0x88]
        cmp     r0, #0
        str     r0, [sp, #0x40]
        mov     r5, r1
        mov     r10, r3
        beq     LCRE15
        cmp     r5, #0
        beq     LCRE15
        cmp     r2, #0
        ble     LCRE14
        cmp     r10, #0
        beq     LCRE15
        cmp     r9, #0
        ble     LCRE13
        cmp     r4, #0
        ble     LCRE12
        cmp     r7, #0
        ble     LCRE12
        cmp     lr, #0
        blt     LCRE11
        cmp     r4, lr
        ble     LCRE11
        cmp     r12, #0
        blt     LCRE11
        cmp     r7, r12
        ble     LCRE11
        cmp     r11, #0
        beq     LCRE15
        mul     r2, r2, r4
        sub     r6, r6, r8
        str     r6, [sp, #0x3C]
        sub     lr, r4, lr
        mul     r8, r2, r7
        sub     r12, r7, r12
        str     lr, [sp, #0x38]
        str     r12, [sp, #0x34]
        mov     r0, r9
        mov     r1, r4
        bl      __intel_imod
        mov     r6, r0
        ldr     r0, [sp, #0x38]
        cmp     r6, #0
        mov     r12, #0
        mov     r2, #1
        movne   r12, r2
        str     r12, [sp, #0x24]
        mov     r1, r4
        bl      __intel_imod
        str     r0, [sp, #8]
        ldr     r0, [sp, #0x34]
        mov     r1, r7
        bl      __intel_imod
        str     r0, [sp, #0xC]
        mov     r0, r9
        mov     r1, r4
        bl      __intel_idiv
        ldr     r2, [sp, #0x24]
        str     r0, [sp, #0x38]
        add     r12, r2, r0
        sub     r2, r12, #1
        cmp     r8, #0
        mov     r2, r2, lsl #1
        str     r2, [sp, #0x34]
        ble     LCRE10
        ldr     r2, [sp, #0x3C]
        mov     lr, #0x1F
        mvn     r9, #0xFF
        cmp     r2, #0x1F
        movgt   r2, lr
        cmn     r2, #0x1F
        mvn     r1, #0x1E
        movlt   r2, r1
        bic     r0, r9, #0x7F, 24
        add     r1, r11, #2
        str     r11, [sp, #0x28]
        str     r10, [sp, #0x2C]
        ldr     r10, [sp, #0xC]
        ldr     r11, [sp, #8]
        mov     lr, #0
        mvn     r0, r0
        mov     r9, lr
        str     r0, [sp, #0x18]
        str     r1, [sp, #0x14]
        str     r2, [sp, #0x24]
        str     lr, [sp, #0x20]
        str     r12, [sp, #0x1C]
        str     r5, [sp, #0x30]
LCRE0:
        cmp     r11, r6
        ldrge   r5, [sp, #0x38]
        ldrlt   r5, [sp, #0x1C]
        cmp     r11, #0
        bne     LCRE1
        ldr     r2, [sp, #0x34]
        ldr     r1, [sp, #0x28]
        ldr     r0, [sp, #0x14]
        bl      memmove
        ldr     r3, [sp, #0x20]
        ldr     r2, [sp, #0x40]
        mov     r12, r3, lsl #1
        add     r3, r3, #1
        ldrsh   r2, [r2, +r12]
        str     r3, [sp, #0x20]
        ldr     r3, [sp, #0x28]
        strh    r2, [r3]
LCRE1:
        cmp     r10, #0
        bne     LCRE9
        ldr     r2, [sp, #0x2C]
        cmp     r5, #0
        add     r3, r2, r11, lsl #2
        movle   r12, #0
        ble     LCRE5
        cmp     r5, #6
        movlt   lr, #0
        movlt   r12, lr
        blt     LCRE3
        ldr     r2, [sp, #0x28]
        mov     lr, #0
        mov     r12, lr
        sub     r0, r5, #6
        str     r8, [sp, #0x10]
        str     r10, [sp, #0xC]
        str     r11, [sp, #8]
        str     r6, [sp, #4]
        str     r7, [sp]
LCRE2:
        ldr     r11, [r3]
        ldrsh   r10, [r2]
        ldr     r8, [r3, +r4, lsl #2]
        ldrsh   r6, [r2, #2]
        ldrsh   r7, [r2, #4]
        mla     r12, r11, r10, r12
        add     r3, r3, r4, lsl #2
        ldr     r1, [r3, +r4, lsl #2]
        ldrsh   r10, [r2, #6]
        ldrsh   r11, [r2, #8]
        mla     r12, r8, r6, r12
        add     r3, r3, r4, lsl #2
        ldr     r6, [r3, +r4, lsl #2]
        add     r3, r3, r4, lsl #2
        ldr     r8, [r3, +r4, lsl #2]
        mla     r12, r1, r7, r12
        add     r3, r3, r4, lsl #2
        add     r3, r3, r4, lsl #2
        add     r2, r2, #0xA
        add     lr, lr, #5
        mla     r12, r6, r10, r12
        cmp     lr, r0
        mla     r12, r8, r11, r12
        ble     LCRE2
        ldr     r8, [sp, #0x10]
        ldr     r10, [sp, #0xC]
        ldr     r11, [sp, #8]
        ldr     r6, [sp, #4]
        ldr     r7, [sp]
LCRE3:
        ldr     r2, [sp, #0x28]
        add     r2, r2, lr, lsl #1
LCRE4:
        ldrsh   r0, [r2], #2
        ldr     r1, [r3]
        add     lr, lr, #1
        cmp     lr, r5
        mla     r12, r1, r0, r12
        add     r3, r3, r4, lsl #2
        blt     LCRE4
LCRE5:
        ldr     r2, [sp, #0x3C]
        cmp     r2, #0
        beq     LCRE6
        ldr     r2, [sp, #0x24]
        cmp     r2, #0
        ldrgt   r2, [sp, #0x24]
        movgt   r12, r12, lsl r2
        bgt     LCRE6
        ldr     r2, [sp, #0x24]
        mov     r3, #1
        rsb     r2, r2, #0
        str     r2, [sp, #0x44]
        sub     lr, r2, #1
        mov     r2, r12, asr r2
        add     lr, r12, r3, lsl lr
        ldr     r3, [sp, #0x44]
        and     r2, r2, #1
        add     r2, lr, r2
        sub     r2, r2, #1
        mov     r12, r2, asr r3
LCRE6:
        ldr     r2, [sp, #0x18]
        cmp     r2, r12
        blt     LCRE7
        cmn     r12, #2, 18
        movge   r12, r12, lsl #16
        movge   r2, r12, asr #16
        mvnlt   r2, #0xFF
        biclt   r2, r2, #0x7F, 24
        b       LCRE8
LCRE7:
        mov     r2, #0
        sub     r2, r2, #2, 18
        mvn     r2, r2
LCRE8:
        mov     r3, r9
        ldr     r12, [sp, #0x30]
        mov     r3, r3, lsl #1
        add     r9, r9, #1
        strh    r2, [r12, +r3]
LCRE9:
        add     r11, r11, #1
        cmp     r11, r4
        subge   r11, r11, r4
        add     r10, r10, #1
        cmp     r10, r7
        subge   r10, r10, r7
        subs    r8, r8, #1
        bne     LCRE0
LCRE10:
        mov     r0, #0
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LCRE11:
        mvn     r0, #0x1B
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LCRE12:
        mvn     r0, #0x1C
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LCRE13:
        mvn     r0, #0x19
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LCRE14:
        mvn     r0, #5
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LCRE15:
        mvn     r0, #7
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}


