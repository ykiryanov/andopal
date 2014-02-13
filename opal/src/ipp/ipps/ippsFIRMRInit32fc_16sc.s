        .text
        .align  4
        .globl  _ippsFIRMRInit32fc_16sc


LBXJ_ownsMRSetDlyLine32fc_16sc:
        stmdb   sp!, {r4 - r10, lr}
        ldr     r2, [r1, #4]
        ldr     r1, [r1, #0x48]
        cmp     r0, #0
        beq     LBXJ4
        cmp     r1, #0
        ble     LBXJ3
        cmp     r1, #5
        mov     r7, #0
        sub     r3, r1, #1
        addlt   r3, r0, r3, lsl #2
        blt     LBXJ1
        add     r3, r0, r3, lsl #2
        mvn     r6, #0
        mvn     r5, #1
        mvn     r4, #2
        sub     lr, r1, #5
        sub     r12, r2, #2
LBXJ0:
        rsb     r9, r7, #0
        rsb     r8, r7, r6
        mov     r10, r9, lsl #2
        ldrsh   r9, [r3, +r10]
        add     r10, r3, r10
        mov     r8, r8, lsl #2
        strh    r9, [r12, #2]
        ldrsh   r10, [r10, #2]
        strh    r10, [r12, #4]
        ldrsh   r9, [r3, +r8]
        add     r8, r3, r8
        strh    r9, [r12, #6]
        ldrsh   r8, [r8, #2]
        rsb     r9, r7, r5
        mov     r10, r9, lsl #2
        strh    r8, [r12, #8]
        ldrsh   r9, [r3, +r10]
        add     r10, r3, r10
        rsb     r8, r7, r4
        strh    r9, [r12, #0xA]
        ldrsh   r10, [r10, #2]
        mov     r8, r8, lsl #2
        add     r7, r7, #4
        strh    r10, [r12, #0xC]
        ldrsh   r9, [r3, +r8]
        add     r8, r3, r8
        cmp     r7, lr
        strh    r9, [r12, #0xE]
        ldrsh   r8, [r8, #2]
        strh    r8, [r12, #0x10]!
        ble     LBXJ0
LBXJ1:
        mov     r12, r7, lsl #2
        sub     r12, r12, #2
        add     r2, r12, r2
LBXJ2:
        rsb     r0, r7, #0
        add     r7, r7, #1
        mov     r12, r0, lsl #2
        ldrsh   r0, [r3, +r12]
        add     r12, r3, r12
        cmp     r7, r1
        strh    r0, [r2, #2]
        ldrsh   r12, [r12, #2]
        strh    r12, [r2, #4]!
        blt     LBXJ2
LBXJ3:
        ldmia   sp!, {r4 - r10, pc}
LBXJ4:
        mov     r0, r2
        ldmia   sp!, {r4 - r10, lr}
        b       _ippsZero_16sc
_ippsFIRMRInit32fc_16sc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x38
        ldr     r12, [sp, #0x68]
        ldr     r10, [sp, #0x5C]
        ldr     r9, [sp, #0x60]
        ldr     r11, [sp, #0x64]
        ldr     r8, [sp, #0x6C]
        mov     r7, r0
        cmp     r7, #0
        str     r12, [sp, #0x14]
        mov     r5, r1
        mov     r6, r2
        mov     r4, r3
        beq     LBXJ16
        cmp     r5, #0
        beq     LBXJ16
        cmp     r8, #0
        beq     LBXJ16
        cmp     r6, #0
        ble     LBXJ15
        cmp     r4, #1
        blt     LBXJ13
        cmp     r10, #0
        blt     LBXJ12
        cmp     r4, r10
        ble     LBXJ12
        cmp     r9, #1
        blt     LBXJ13
        cmp     r11, #0
        blt     LBXJ12
        cmp     r9, r11
        ble     LBXJ12
        cmp     r4, #1
        beq     LBXJ14
LBXJ5:
        add     r12, r6, r4
        sub     r0, r12, #1
        mov     r1, r4
        bl      __intel_idiv
        str     r0, [sp, #0x18]
        add     r12, r9, r9, lsl #1
        add     r0, r6, r12
        str     r0, [sp, #0x2C]
        mov     r1, r4
        bl      __intel_imod
        cmp     r0, #0
        ble     LBXJ7
        str     r7, [sp, #8]
        ldr     r7, [sp, #0x2C]
LBXJ6:
        add     r7, r7, #1
        mov     r0, r7
        mov     r1, r4
        bl      __intel_imod
        cmp     r0, #0
        bgt     LBXJ6
        str     r7, [sp, #0x2C]
        ldr     r7, [sp, #8]
LBXJ7:
        ldr     r12, [sp, #0x18]
        mov     lr, #0
        cmp     r12, #0
        blt     LBXJ9
        ldr     r12, [sp, #0x18]
LBXJ8:
        add     lr, lr, r9, lsl #2
        cmp     r12, lr
        bge     LBXJ8
LBXJ9:
        ldr     r12, [sp, #0x18]
        add     lr, lr, #1
        str     lr, [sp, #0x1C]
        add     r12, r9, r12
        sub     r0, r12, #1
        mov     r1, r9
        bl      __intel_idiv
        mul     r0, r4, r0
        mov     r1, r4, lsl #2
        str     r1, [sp, #0x24]
        str     r0, [sp, #0x34]
        bl      __intel_imod
        cmp     r0, #0
        ble     LBXJ11
        str     r6, [sp, #0x10]
        str     r5, [sp, #0xC]
        str     r7, [sp, #8]
        ldr     r6, [sp, #0x24]
        ldr     r5, [sp, #0x34]
        ldr     r7, [sp, #0x1C]
LBXJ10:
        add     r5, r4, r5
        mov     r0, r5
        mov     r1, r6
        bl      __intel_imod
        cmp     r0, #0
        add     r7, r7, r9
        bgt     LBXJ10
        str     r5, [sp, #0x34]
        str     r7, [sp, #0x1C]
        ldr     r6, [sp, #0x10]
        ldr     r5, [sp, #0xC]
        ldr     r7, [sp, #8]
LBXJ11:
        ldr     lr, [sp, #0x1C]
        ldr     r12, [sp, #0x18]
        add     r8, r8, #0xF
        bic     r0, r8, #0xF
        str     r0, [r7]
        add     lr, lr, r12
        add     lr, lr, #1
        ldr     r3, [sp, #0x2C]
        mov     lr, lr, lsl #2
        add     lr, lr, #0xF
        bic     r1, lr, #0xF
        ldr     lr, [sp, #0x24]
        str     r1, [sp, #0x20]
        mov     r12, r6, lsl #2
        add     lr, lr, #1
        mov     r3, r3, lsl #5
        mov     lr, lr, lsl #2
        str     lr, [sp, #0x28]
        add     r2, r0, #0x70
        str     r3, [sp, #0x30]
        str     r2, [r0]
        ldr     lr, [sp, #0x30]
        add     r12, r12, #0xF
        bic     r12, r12, #0xF
        add     r8, r12, r2
        add     r2, lr, #0xF
        ldr     lr, [sp, #0x28]
        mov     r12, r6, lsl #3
        add     r12, r12, #0xF
        add     lr, lr, #0xF
        bic     r12, r12, #0xF
        bic     r2, r2, #0xF
        bic     lr, lr, #0xF
        str     r12, [sp, #0x30]
        str     r2, [sp, #0x28]
        str     lr, [sp, #0x24]
        mov     r0, r8
        bl      _ippsZero_8u
        ldr     lr, [r7]
        ldr     r12, [sp, #0x20]
        cmp     r4, #1
        str     r8, [lr, #4]
        ldr     lr, [sp, #0x28]
        ldr     r0, [r7]
        add     r12, r8, r12
        ldr     r8, [sp, #0x24]
        add     lr, r12, lr
        str     r12, [r0, #0x34]
        ldr     r1, [r7]
        ldr     r12, [sp, #0x30]
        add     r8, lr, r8
        str     lr, [r1, #0x30]
        ldr     lr, [r7]
        add     r0, r8, r12
        mov     r12, #0
        str     r8, [lr, #0x54]
        ldr     lr, [r7]
        str     r0, [lr, #0x4C]
        ldr     lr, [r7]
        ldr     r8, [sp, #0x2C]
        str     r8, [lr, #0x24]
        ldr     lr, [r7]
        str     r6, [lr, #8]
        ldr     lr, [r7]
        ldr     r8, [sp, #0x18]
        str     r8, [lr, #0x48]
        ldr     lr, [r7]
        ldr     r8, [pc, #0xF0]
        str     r8, [lr, #0x58]
        ldr     lr, [r7]
        str     r4, [lr, #0xC]
        ldr     r3, [r7]
        ldr     lr, [sp, #0x1C]
        str     lr, [r3, #0x1C]
        ldr     r3, [r7]
        str     r9, [r3, #0x10]
        ldr     r3, [r7]
        ldr     lr, [sp, #0x34]
        str     lr, [r3, #0x20]
        ldr     r3, [r7]
        str     r12, [r3, #0x50]
        ldr     r3, [r7]
        str     r10, [r3, #0x14]
        ldr     r3, [r7]
        str     r11, [r3, #0x18]
        ldr     r12, [r7]
        moveq   r3, #2
        movne   r3, #3
        str     r3, [r12, #0x44]
        ldr     r1, [r7]
        mov     r0, r5
        bl      ownsMRSetTaps32fc_16sc
        ldr     r0, [sp, #0x14]
        ldr     r1, [r7]
        bl      LBXJ_ownsMRSetDlyLine32fc_16sc
        ldr     r3, [r7]
        mov     r1, r6
        ldr     r0, [r3]
        bl      ownsTestTapsCplx
        ldr     r7, [r7]
        cmp     r0, #0
        ldreq   r0, [pc, #0x6C]
        ldrne   r0, [pc, #0x6C]
        str     r0, [r7, #0x6C]
        mov     r0, #0
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LBXJ12:
        mvn     r0, #0x1B
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LBXJ13:
        mvn     r0, #0x1C
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LBXJ14:
        cmp     r9, #1
        bne     LBXJ5
        str     r8, [sp]
        ldr     r3, [sp, #0x14]
        mov     r0, r7
        mov     r2, r6
        mov     r1, r5
        bl      _ippsFIRInit32fc_16sc
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LBXJ15:
        mvn     r0, #0x19
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LBXJ16:
        mvn     r0, #7
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
        .long   0x46493038
        .long   ownsMR_16sc_Sfs
        .long   ownsMR64sc_16sc_Sfs


