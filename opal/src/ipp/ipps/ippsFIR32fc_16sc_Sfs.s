        .text
        .align  4
        .globl  _ippsFIR32fc_16sc_Sfs


_ippsFIR32fc_16sc_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        ldr     r9, [sp, #0x2C]
        mov     r4, r3
        cmp     r4, #0
        mov     r6, r0
        mov     r5, r1
        mov     r7, r2
        beq     LBXZ7
        cmp     r6, #0
        beq     LBXZ7
        cmp     r5, #0
        beq     LBXZ7
        cmp     r7, #0
        ble     LBXZ6
        ldr     r12, [r4, #0x58]
        ldr     lr, [pc, #0x3C0]
        subs    r12, r12, lr
        beq     LBXZ5
        adds    r12, r12, #2
        beq     LBXZ0
        mvn     r0, #0x10
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBXZ0:
        and     r12, r6, #3
        cmp     r12, #0
        mov     r10, #0
        bls     LBXZ2
        cmp     r7, #0
        ble     LBXZ4
LBXZ1:
        ldrh    lr, [r6]
        ldrh    r8, [r6, #2]
        ldr     r12, [r4, #0x64]
        add     r6, r6, #4
        mov     r3, r9
        orr     r0, lr, r8, lsl #16
        mov     r2, r4
        mov     r1, r5
        blx     r12
        add     r10, r10, #1
        cmp     r10, r7
        add     r5, r5, #4
        blt     LBXZ1
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBXZ2:
        ldr     r12, [r4, #0x2C]
        ldr     r11, [r4, #4]
        ldr     r8, [r4, #8]
        ldr     lr, [r4, #0x28]
        ldr     r2, [r4, #0x1C]
        add     r12, r11, r12, lsl #2
        str     r10, [r4, #0x2C]
        add     r10, r8, #3
        sub     r11, lr, r9
        cmp     r7, r2
        bic     r10, r10, #3
        add     r9, r12, #4
        add     r1, r12, r8, lsl #2
        ble     LBXZ3
        mov     r0, r6
        bl      _ippsCopy_16sc
        str     r11, [sp, #4]
        str     r8, [sp]
        mov     r1, r9
        mov     r2, r5
        mov     r0, r4
        mov     r3, r10
        bl      ownsFIRSR_16sc_Sfs
        ldr     r1, [r4, #4]
        add     r12, r6, r7, lsl #2
        sub     r6, r6, r8, lsl #2
        add     r6, r6, r10, lsl #2
        sub     r0, r12, r8, lsl #2
        mov     r2, r8
        bl      _ippsCopy_16sc
        add     r1, r6, #4
        add     r2, r5, r10, lsl #2
        sub     r3, r7, r10
        str     r11, [sp, #4]
        str     r8, [sp]
        mov     r0, r4
        bl      ownsFIRSR_16sc_Sfs
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBXZ3:
        mov     r0, r6
        mov     r2, r7
        bl      _ippsCopy_16sc
        str     r11, [sp, #4]
        str     r8, [sp]
        mov     r3, r7
        mov     r2, r5
        mov     r1, r9
        mov     r0, r4
        bl      ownsFIRSR_16sc_Sfs
        ldr     r1, [r4, #4]
        add     r7, r9, r7, lsl #2
        sub     r0, r7, #4
        mov     r2, r8
        bl      _ippsCopy_16sc
LBXZ4:
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBXZ5:
        str     r9, [sp]
        mov     r0, r4
        mov     r3, r7
        mov     r2, r5
        mov     r1, r6
        bl      LBXZ_ownsFIRMR_16sc_Sfs
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBXZ6:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBXZ7:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBXZ_ownsFIRMR_16sc_Sfs:
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
        ble     LBXZ9
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
        ble     LBXZ8
        ldr     r1, [sp, #0x28]
        sub     r11, r11, r1
        add     r10, r1, r10
LBXZ8:
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
LBXZ9:
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


