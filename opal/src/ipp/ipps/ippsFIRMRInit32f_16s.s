        .text
        .align  4
        .globl  _ippsFIRMRInit32f_16s


LBXK_ownsMRSetDlyLine32f_16s:
        mov     r2, r1
        ldr     r1, [r2, #0x48]
        ldr     r3, [r2, #4]
        cmp     r0, #0
        moveq   r0, r3
        beq     _ippsZero_16s
        mov     r2, r1
        mov     r1, r3
        b       _ippsFlip_16u
_ippsFIRMRInit32f_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x40
        ldr     r12, [sp, #0x70]
        ldr     r10, [sp, #0x64]
        ldr     r8, [sp, #0x68]
        ldr     r9, [sp, #0x6C]
        ldr     r11, [sp, #0x74]
        mov     r7, r0
        cmp     r7, #0
        str     r12, [sp, #0x18]
        mov     r6, r1
        mov     r5, r2
        mov     r4, r3
        beq     LBXK11
        cmp     r6, #0
        beq     LBXK11
        cmp     r11, #0
        beq     LBXK11
        cmp     r5, #0
        ble     LBXK10
        cmp     r4, #1
        blt     LBXK8
        cmp     r10, #0
        blt     LBXK7
        cmp     r4, r10
        ble     LBXK7
        cmp     r8, #1
        blt     LBXK8
        cmp     r9, #0
        blt     LBXK7
        cmp     r8, r9
        ble     LBXK7
        cmp     r4, #1
        beq     LBXK9
LBXK0:
        add     r12, r5, r4
        sub     r0, r12, #1
        mov     r1, r4
        bl      __intel_idiv
        mov     r1, r0
        str     r1, [sp, #0x14]
        add     r12, r8, r8, lsl #1
        add     r0, r5, r12
        add     r1, r1, #1
        bic     r12, r1, #1
        str     r12, [sp, #0x30]
        mul     r12, r4, r12
        str     r0, [sp, #0x1C]
        mov     r1, r4
        str     r12, [sp, #0x20]
        bl      __intel_imod
        cmp     r0, #0
        ble     LBXK2
        str     r7, [sp, #8]
        ldr     r7, [sp, #0x1C]
LBXK1:
        add     r7, r7, #1
        mov     r0, r7
        mov     r1, r4
        bl      __intel_imod
        cmp     r0, #0
        bgt     LBXK1
        str     r7, [sp, #0x1C]
        ldr     r7, [sp, #8]
LBXK2:
        ldr     lr, [sp, #0x20]
        ldr     r12, [sp, #0x1C]
        cmp     lr, r12
        ldrle   r12, [sp, #0x1C]
        strle   r12, [sp, #0x20]
        ldr     r12, [sp, #0x14]
        cmp     r12, #0
        movlt   r12, #0
        strlt   r12, [sp, #0x28]
        blt     LBXK4
        mov     r12, #0
        str     r12, [sp, #0x28]
        ldr     r12, [sp, #0x28]
        ldr     lr, [sp, #0x14]
LBXK3:
        add     r12, r12, r8, lsl #2
        cmp     lr, r12
        bge     LBXK3
        str     r12, [sp, #0x28]
LBXK4:
        ldr     r12, [sp, #0x14]
        mov     r1, r8
        add     r12, r12, r8
        sub     r0, r12, #1
        bl      __intel_idiv
        mul     r0, r4, r0
        ldr     r12, [sp, #0x28]
        mov     r1, r4, lsl #2
        str     r1, [sp, #0x24]
        str     r0, [sp, #0x2C]
        add     r12, r12, #1
        str     r12, [sp, #0x28]
        bl      __intel_imod
        cmp     r0, #0
        ble     LBXK6
        str     r5, [sp, #0x10]
        str     r6, [sp, #0xC]
        str     r7, [sp, #8]
        ldr     r6, [sp, #0x24]
        ldr     r5, [sp, #0x2C]
        ldr     r7, [sp, #0x28]
LBXK5:
        add     r5, r4, r5
        mov     r0, r5
        mov     r1, r6
        bl      __intel_imod
        cmp     r0, #0
        add     r7, r7, r8
        bgt     LBXK5
        str     r5, [sp, #0x2C]
        str     r7, [sp, #0x28]
        ldr     r5, [sp, #0x10]
        ldr     r6, [sp, #0xC]
        ldr     r7, [sp, #8]
LBXK6:
        ldr     r12, [sp, #0x24]
        mov     lr, r5, lsl #1
        add     lr, lr, #0xF
        bic     lr, lr, #0xF
        str     lr, [sp, #0x24]
        ldr     lr, [sp, #0x20]
        add     r12, r12, #1
        add     r11, r11, #0xF
        mov     lr, lr, lsl #3
        add     lr, lr, #0xF
        bic     lr, lr, #0xF
        str     lr, [sp, #0x34]
        mov     lr, r5, lsl #2
        add     lr, lr, #0xF
        bic     lr, lr, #0xF
        str     lr, [sp, #0x38]
        mov     r12, r12, lsl #2
        add     r12, r12, #0xF
        bic     lr, r11, #0xF
        bic     r12, r12, #0xF
        str     lr, [r7]
        add     r11, lr, #0x70
        add     r12, r12, r11
        str     r12, [lr]
        ldr     r0, [r7]
        ldr     lr, [sp, #0x24]
        ldr     r3, [sp, #0x34]
        add     r2, r12, lr
        ldr     lr, [sp, #0x28]
        ldr     r12, [sp, #0x14]
        add     r3, r2, r3
        str     r2, [sp, #0x24]
        str     r3, [sp, #0x34]
        str     r3, [r0, #4]
        ldr     r0, [r7]
        ldr     r2, [sp, #0x34]
        add     r1, r12, lr
        str     r0, [sp, #0x3C]
        add     r1, r1, #1
        mov     r0, r1, lsl #1
        add     r0, r0, #0xF
        bic     r0, r0, #0xF
        add     r0, r2, r0
        ldr     r2, [sp, #0x3C]
        str     r0, [r2, #0x54]
        ldr     r3, [sp, #0x38]
        ldr     r2, [r7]
        add     r0, r0, r3
        ldr     r3, [sp, #0x20]
        add     r3, r0, r3, lsl #4
        str     r3, [r2, #0x4C]
        ldr     r0, [r7]
        str     r5, [r0, #8]
        ldr     r2, [sp, #0x1C]
        ldr     r0, [r7]
        str     r2, [r0, #0x24]
        ldr     r2, [sp, #0x24]
        ldr     r0, [r7]
        str     r2, [r0, #0x34]
        ldr     r0, [r7]
        ldr     r2, [sp, #0x30]
        str     r2, [r0, #0x5C]
        ldr     r0, [r7]
        str     r11, [r0, #0x30]
        ldr     r11, [r7]
        str     r12, [r11, #0x48]
        ldr     r12, [r7]
        ldr     r11, [pc, #0x100]
        str     r11, [r12, #0x58]
        ldr     r12, [r7]
        str     r4, [r12, #0xC]
        ldr     r12, [r7]
        str     lr, [r12, #0x1C]
        ldr     r12, [r7]
        str     r8, [r12, #0x10]
        ldr     r12, [r7]
        ldr     lr, [sp, #0x2C]
        str     lr, [r12, #0x20]
        ldr     r12, [r7]
        mov     lr, #0
        str     lr, [r12, #0x50]
        ldr     r12, [r7]
        str     r10, [r12, #0x14]
        ldr     r12, [r7]
        str     r9, [r12, #0x18]
        ldr     r12, [r7]
        ldr     r0, [r12, #4]
        bl      _ippsZero_16s
        ldr     r12, [r7]
        cmp     r4, #1
        moveq   r3, #2
        movne   r3, #3
        str     r3, [r12, #0x44]
        ldr     r1, [r7]
        mov     r0, r6
        bl      ownsMRSetTaps32f_16s
        ldr     r0, [sp, #0x18]
        ldr     r1, [r7]
        bl      LBXK_ownsMRSetDlyLine32f_16s
        ldr     r3, [r7]
        mov     r1, r5
        ldr     r0, [r3]
        bl      ownsTestTaps
        ldr     r7, [r7]
        cmp     r0, #0
        ldreq   r0, [pc, #0x6C]
        ldrne   r0, [pc, #0x6C]
        str     r0, [r7, #0x6C]
        mov     r0, #0
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LBXK7:
        mvn     r0, #0x1B
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LBXK8:
        mvn     r0, #0x1C
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LBXK9:
        cmp     r8, #1
        bne     LBXK0
        str     r11, [sp]
        ldr     r3, [sp, #0x18]
        mov     r0, r7
        mov     r2, r5
        mov     r1, r6
        bl      _ippsFIRInit32f_16s
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LBXK10:
        mvn     r0, #0x19
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LBXK11:
        mvn     r0, #7
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
        .long   0x46493037
        .long   ownsMR_16s_Sfs
        .long   ownsMR64s_16s_Sfs


