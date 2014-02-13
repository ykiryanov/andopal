        .text
        .align  4
        .globl  _ippsSchur_GSMFR_32s16s


_ippsSchur_GSMFR_32s16s:
        stmdb   sp!, {lr}
        cmp     r0, #0
        beq     LDTE4
        cmp     r1, #0
        beq     LDTE4
        cmp     r2, #9
        bge     LDTE1
        cmp     r2, #0
        beq     LDTE1
        ldr     r3, [r0]
        cmp     r3, #0
        beq     LDTE0
        cmp     r2, #4
        beq     LDTE3
        cmp     r2, #8
        beq     LDTE2
        bl      LDTE_ownSchur_GSMFR_32s16s_PX
        mov     r0, #0
        ldr     pc, [sp], #4
LDTE0:
        mov     r0, r1
        mov     r1, r2
        bl      _ippsZero_16s
        mov     r0, #0
        ldr     pc, [sp], #4
LDTE1:
        mvn     r0, #5
        ldr     pc, [sp], #4
LDTE2:
        bl      LDTE_ownSchur_GSMFR_32s16s_PX_9L
        mov     r0, #0
        ldr     pc, [sp], #4
LDTE3:
        bl      LDTE_ownSchur_GSMFR_32s16s_PX_5L
        mov     r0, #0
        ldr     pc, [sp], #4
LDTE4:
        mvn     r0, #7
        ldr     pc, [sp], #4
LDTE_ownSchur_GSMFR_32s16s_PX:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x2C
        ldr     lr, [r0]
        mov     r7, r1
        mov     r6, r2
        cmp     lr, #0
        mov     r8, #0
        moveq   r1, #0
        beq     LDTE6
        ldr     r3, [pc, #0xB78]
        ldr     r12, [pc, #0xB78]
        movs    r4, lr, lsr #16
        bne     LDTE5
        bic     lr, lr, #0xFF, 8
        bic     lr, lr, #0xFF, 16
        movs    r4, lr, asr #8
        movne   lr, r4, lsl #1
        movne   r12, r3
        moveq   lr, lr, lsl #1
        ldrsh   lr, [r12, +lr]
        add     r3, lr, #0x10
        mov     r3, r3, lsl #16
        mov     r1, r3, asr #16
        b       LDTE6
LDTE5:
        movs    lr, lr, lsr #24
        movne   lr, lr, lsl #1
        ldrnesh r1, [r3, +lr]
        moveq   r4, r4, lsl #1
        ldreqsh r1, [r12, +r4]
LDTE6:
        cmp     r6, #0
        blt     LDTE10
        cmp     r6, #6
        movlt   r5, #0
        blt     LDTE8
        mov     r5, #0
        sub     r11, r6, #6
        mov     r10, r5
        add     r9, r0, #4
LDTE7:
        ldr     r3, [r9, #-4]
        ldr     lr, [r9]
        ldr     r4, [r9, #4]
        mov     r3, r3, lsl r1
        ldr     r2, [r9, #0xC]
        add     r12, sp, #0x18
        mov     r3, r3, asr #16
        strh    r3, [r12, +r10]
        ldr     r3, [r9, #8]
        mov     lr, lr, lsl r1
        mov     r4, r4, lsl r1
        add     r12, r12, r10
        mov     r3, r3, lsl r1
        mov     r2, r2, lsl r1
        add     r5, r5, #5
        mov     lr, lr, asr #16
        mov     r4, r4, asr #16
        mov     r3, r3, asr #16
        mov     r2, r2, asr #16
        cmp     r5, r11
        add     r10, r10, #0xA
        add     r9, r9, #0x14
        strh    lr, [r12, #2]
        strh    r4, [r12, #4]
        strh    r3, [r12, #6]
        strh    r2, [r12, #8]
        ble     LDTE7
LDTE8:
        add     r0, r0, r5, lsl #2
        mov     r3, r5, lsl #1
LDTE9:
        ldr     lr, [r0], #4
        add     r12, sp, #0x18
        mov     lr, lr, lsl r1
        add     r5, r5, #1
        cmp     r5, r6
        mov     lr, lr, asr #16
        strh    lr, [r12, +r3]
        add     r3, r3, #2
        ble     LDTE9
LDTE10:
        add     r11, sp, #0x18
        add     r1, sp, #8
        add     r0, r11, #2
        sub     r9, r6, #1
        mov     r2, r9
        bl      _ippsCopy_16s
        mov     r0, #0xFF
        cmp     r9, #0
        add     r3, sp, #0x18
        orr     r5, r0, #0x7F, 24
        ble     LDTE23
        ldrsh   r0, [r11, #2]
        ldrsh   r4, [r3]
        mov     r2, r7
        mov     r1, #0
        str     r7, [sp]
        mov     r8, r9
        mov     r10, r0
        mov     r7, r0
        mov     r9, r1
        mov     r11, r2
LDTE11:
        cmp     r10, #0
        mov     r3, r7
        bge     LDTE12
        cmn     r10, #2, 18
        moveq   r3, r5
        beq     LDTE12
        rsb     r3, r10, #0
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
LDTE12:
        cmp     r4, r3
        blt     LDTE22
        cmp     r3, r4
        moveq   r0, r5
        beq     LDTE13
        mov     r0, r3, lsl #15
        mov     r1, r4
        bl      __intel_idiv
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
LDTE13:
        cmp     r10, #0
        strleh  r0, [r11]
        ble     LDTE14
        rsb     r0, r0, #0
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        strh    r0, [r11]
LDTE14:
        mul     r1, r10, r0
        sub     r12, r6, r9
        add     lr, r12, #1
        add     r3, sp, #0x18
        add     r1, r1, #1, 18
        cmp     lr, #2
        add     r1, r4, r1, asr #15
        mov     lr, r1, lsl #16
        mov     r4, lr, asr #16
        strh    r4, [r3]
        ble     LDTE16
        sub     r1, r12, #1
        mov     r12, #4
LDTE15:
        add     r3, sp, #0x18
        ldrsh   r7, [r3, +r12]
        add     r4, sp, #4
        ldrsh   lr, [r4, +r12]
        mul     r2, r0, r7
        subs    r1, r1, #1
        add     r3, r3, r12
        mul     r10, r0, lr
        add     r2, r2, #1, 18
        add     r2, lr, r2, asr #15
        strh    r2, [r4, +r12]
        add     r12, r12, #2
        add     r10, r10, #1, 18
        add     r10, r7, r10, asr #15
        strh    r10, [r3, #-2]
        bne     LDTE15
        add     r0, sp, #0x18
        ldrsh   r7, [r0, #2]
        add     r3, sp, #0x18
        ldrsh   r4, [r3]
        mov     r10, r7
LDTE16:
        add     r9, r9, #1
        cmp     r9, r8
        add     r11, r11, #2
        blt     LDTE11
        mov     r0, r7
        ldr     r7, [sp]
        mov     r8, #0
LDTE17:
        cmp     r10, #0
        bge     LDTE18
        cmn     r10, #2, 18
        moveq   r0, r5
        beq     LDTE18
        rsb     r0, r10, #0
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
LDTE18:
        cmp     r4, r0
        sub     r7, r7, #2
        mov     r6, r6, lsl #1
        bge     LDTE19
        strh    r8, [r7, +r6]
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LDTE19:
        cmp     r0, r4
        beq     LDTE20
        mov     r0, r0, lsl #15
        mov     r1, r4
        bl      __intel_idiv
        mov     r0, r0, lsl #16
        mov     r5, r0, asr #16
LDTE20:
        cmp     r10, #0
        rsbgt   r5, r5, #0
        strgth  r5, [r7, +r6]
        ble     LDTE21
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LDTE21:
        strh    r5, [r7, +r6]
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LDTE22:
        mov     r1, r9
        ldr     r7, [sp]
        sub     r6, r6, r1
        add     r0, r7, r1, lsl #1
        mov     r1, r6
        bl      _ippsZero_16s
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LDTE23:
        ldrsh   r0, [r11, #2]
        ldrsh   r4, [r3]
        mov     r10, r0
        b       LDTE17
LDTE_ownSchur_GSMFR_32s16s_PX_9L:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x50
        ldr     r4, [r0]
        mov     r9, r1
        mov     r2, #0
        cmp     r4, #0
        moveq   r10, #0
        beq     LDTE25
        ldr     r3, [pc, #0x840]
        ldr     r12, [pc, #0x840]
        movs    lr, r4, lsr #16
        bne     LDTE24
        bic     r4, r4, #0xFF, 8
        bic     lr, r4, #0xFF, 16
        movs    r4, lr, asr #8
        movne   lr, r4, lsl #1
        movne   r12, r3
        moveq   lr, lr, lsl #1
        ldrsh   lr, [r12, +lr]
        add     r3, lr, #0x10
        mov     r3, r3, lsl #16
        mov     r10, r3, asr #16
        b       LDTE25
LDTE24:
        movs    r4, r4, lsr #24
        movne   r4, r4, lsl #1
        ldrnesh r10, [r3, +r4]
        moveq   lr, lr, lsl #1
        ldreqsh r10, [r12, +lr]
LDTE25:
        ldr     r4, [r0, #4]
        ldr     lr, [r0]
        ldr     r5, [r0, #8]
        mov     r4, r4, lsl r10
        ldr     r7, [r0, #0x10]
        ldr     r8, [r0, #0x18]
        mov     r4, r4, asr #16
        add     r3, sp, #0x3C
        add     r12, sp, #0x28
        strh    r4, [r3, #2]
        strh    r4, [r12, #4]
        ldr     r4, [r0, #0xC]
        mov     lr, lr, lsl r10
        mov     r5, r5, lsl r10
        mov     r11, r4, lsl r10
        mov     lr, lr, asr #16
        mov     r5, r5, asr #16
        strh    lr, [r3]
        strh    lr, [r12, #2]
        ldr     lr, [r0, #0x14]
        mov     r4, r7, lsl r10
        strh    r5, [r3, #4]
        strh    r5, [r12, #6]
        ldr     r7, [r0, #0x1C]
        ldr     r5, [r0, #0x20]
        mov     r11, r11, asr #16
        strh    r11, [r3, #6]
        strh    r11, [r12, #8]
        mov     lr, lr, lsl r10
        mov     r7, r7, lsl r10
        mov     r5, r5, lsl r10
        mov     r0, r8, lsl r10
        add     r6, sp, #0x3C
        ldrsh   r10, [r6, #2]
        add     r11, sp, #0x3C
        ldrsh   r8, [r11]
        mov     lr, lr, asr #16
        mov     r4, r4, asr #16
        mov     r7, r7, asr #16
        mov     r5, r5, asr #16
        mov     r0, r0, asr #16
        strh    lr, [r3, #0xA]
        strh    lr, [r12, #0xC]
        strh    r4, [r3, #8]
        strh    r4, [r12, #0xA]
        strh    r7, [r3, #0xE]
        strh    r7, [r12, #0x10]
        strh    r5, [r3, #0x10]
        strh    r5, [r12, #0x12]
        strh    r0, [r3, #0xC]
        strh    r0, [r12, #0xE]
        mov     lr, #0xFF
        orr     r4, lr, #0x7F, 24
        mov     r7, #0
        mov     r11, r10
        mov     r5, r9
        str     r9, [sp, #0x18]
LDTE26:
        cmp     r11, #0
        mov     r0, r10
        bge     LDTE27
        cmn     r11, #2, 18
        moveq   r0, r4
        beq     LDTE27
        rsb     r0, r11, #0
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
LDTE27:
        cmp     r8, r0
        blt     LDTE38
        cmp     r0, r8
        moveq   r2, r4
        beq     LDTE28
        mov     r0, r0, lsl #15
        mov     r1, r8
        bl      __intel_idiv
        mov     r0, r0, lsl #16
        mov     r2, r0, asr #16
LDTE28:
        cmp     r11, #0
        strleh  r2, [r5]
        ble     LDTE29
        rsb     r2, r2, #0
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #16
        strh    r2, [r5]
LDTE29:
        mul     r3, r11, r2
        add     r0, sp, #0x3C
        add     r3, r3, #1, 18
        add     r3, r8, r3, asr #15
        mov     r1, r3, lsl #16
        rsb     r3, r7, #9
        mov     r8, r1, asr #16
        cmp     r3, #2
        strh    r8, [r0]
        ble     LDTE33
        rsb     r0, r7, #0
        sub     r0, r0, #2
        add     r0, r0, #9
        cmp     r0, #4
        movlt   r0, #2
        blt     LDTE31
        rsb     r12, r7, #5
        mov     r0, #2
        mov     r1, #4
        str     r4, [sp, #8]
        str     r12, [sp, #4]
        str     r3, [sp, #0xC]
        str     r5, [sp, #0x10]
        str     r2, [sp]
        str     r7, [sp, #0x14]
LDTE30:
        add     r2, sp, #0x28
        ldrsh   r10, [r2, +r1]
        ldr     r12, [sp, #4]
        add     r9, r2, r1
        ldrsh   r6, [r9, #2]
        add     r2, sp, #0x3C
        ldrsh   r8, [r9, #4]
        add     r0, r0, #3
        add     r4, r2, r1
        cmp     r0, r12
        ldr     r12, [sp]
        ldrsh   r5, [r4, #2]
        add     r3, sp, #0x3C
        ldrsh   lr, [r3, +r1]
        mul     r11, r12, r5
        ldrsh   r7, [r4, #4]
        mul     r3, r12, r10
        mul     r2, r12, lr
        str     r11, [sp, #0x20]
        mul     r11, r12, r8
        add     r3, r3, #1, 18
        str     r2, [sp, #0x1C]
        mul     r2, r12, r6
        mul     r12, r12, r7
        add     r3, lr, r3, asr #15
        str     r11, [sp, #0x24]
        ldr     r11, [sp, #0x1C]
        add     r2, r2, #1, 18
        add     r12, r12, #1, 18
        add     lr, sp, #0x28
        add     r11, r11, #1, 18
        add     r12, r8, r12, asr #15
        add     r11, r10, r11, asr #15
        add     r10, r5, r2, asr #15
        ldr     r2, [sp, #0x20]
        ldr     r5, [sp, #0x24]
        strh    r11, [lr, +r1]
        add     lr, sp, #0x3C
        add     r2, r2, #1, 18
        add     r5, r5, #1, 18
        strh    r10, [lr, +r1]
        add     r2, r6, r2, asr #15
        add     r5, r7, r5, asr #15
        strh    r3, [r4, #-2]
        strh    r2, [r9, #2]
        strh    r5, [r4, #2]
        strh    r12, [r9, #4]
        add     r1, r1, #6
        ble     LDTE30
        ldr     r4, [sp, #8]
        ldr     r3, [sp, #0xC]
        ldr     r5, [sp, #0x10]
        ldr     r2, [sp]
        ldr     r7, [sp, #0x14]
        add     r6, sp, #0x3C
LDTE31:
        mov     r12, r0, lsl #1
LDTE32:
        add     r1, sp, #0x3C
        ldrsh   r9, [r1, +r12]
        add     r8, sp, #0x28
        ldrsh   lr, [r8, +r12]
        mul     r11, r2, r9
        add     r0, r0, #1
        cmp     r0, r3
        mul     r10, r2, lr
        add     r11, r11, #1, 18
        add     r1, r1, r12
        add     r11, lr, r11, asr #15
        strh    r11, [r8, +r12]
        add     r10, r10, #1, 18
        add     r12, r12, #2
        add     r10, r9, r10, asr #15
        strh    r10, [r1, #-2]
        blt     LDTE32
        ldrsh   r10, [r6, #2]
        add     r0, sp, #0x3C
        ldrsh   r8, [r0]
        mov     r11, r10
LDTE33:
        add     r7, r7, #1
        cmp     r7, #7
        add     r5, r5, #2
        blt     LDTE26
        ldr     r9, [sp, #0x18]
        cmp     r11, #0
        mov     r2, #0
        bge     LDTE34
        cmn     r11, #2, 18
        moveq   r10, r4
        beq     LDTE34
        rsb     r0, r11, #0
        mov     r0, r0, lsl #16
        mov     r10, r0, asr #16
LDTE34:
        cmp     r8, r10
        bge     LDTE35
        strh    r2, [r9, #0xE]
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LDTE35:
        cmp     r10, r8
        beq     LDTE36
        mov     r0, r10, lsl #15
        mov     r1, r8
        bl      __intel_idiv
        mov     r0, r0, lsl #16
        mov     r4, r0, asr #16
LDTE36:
        cmp     r11, #0
        rsbgt   r4, r4, #0
        strgth  r4, [r9, #0xE]
        ble     LDTE37
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LDTE37:
        strh    r4, [r9, #0xE]
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LDTE38:
        ldr     r9, [sp, #0x18]
        rsb     r1, r7, #8
        add     r0, r9, r7, lsl #1
        bl      _ippsZero_16s
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LDTE_ownSchur_GSMFR_32s16s_PX_5L:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        ldr     r12, [r0]
        mov     r4, r1
        cmp     r12, #0
        moveq   r5, #0
        beq     LDTE40
        ldr     r3, [pc, #0x44C]
        ldr     r2, [pc, #0x44C]
        movs    lr, r12, lsr #16
        bne     LDTE39
        bic     r12, r12, #0xFF, 8
        bic     r12, r12, #0xFF, 16
        movs    lr, r12, asr #8
        movne   r12, lr, lsl #1
        movne   r2, r3
        moveq   r12, r12, lsl #1
        ldrsh   r12, [r2, +r12]
        add     r2, r12, #0x10
        mov     r2, r2, lsl #16
        mov     r5, r2, asr #16
        b       LDTE40
LDTE39:
        movs    r12, r12, lsr #24
        movne   r12, r12, lsl #1
        ldrnesh r5, [r3, +r12]
        moveq   lr, lr, lsl #1
        ldreqsh r5, [r2, +lr]
LDTE40:
        ldr     r6, [r0, #4]
        ldr     lr, [r0]
        add     r3, sp, #0x10
        mov     r7, r6, lsl r5
        ldr     r6, [r0, #8]
        add     r12, sp, #4
        mov     r7, r7, asr #16
        strh    r7, [r3, #2]
        strh    r7, [r12, #4]
        ldr     r7, [r0, #0xC]
        ldr     r0, [r0, #0x10]
        add     r2, sp, #0x10
        ldrsh   r2, [r2, #2]
        mov     lr, lr, lsl r5
        mov     r6, r6, lsl r5
        mov     r7, r7, lsl r5
        mov     r0, r0, lsl r5
        mov     r5, lr, asr #16
        mov     lr, r6, asr #16
        strh    r5, [r3]
        strh    r5, [r12, #2]
        mov     r7, r7, asr #16
        mov     r8, r0, asr #16
        mov     r5, r2
        mov     r6, #0xFF
        cmp     r5, #0
        orr     r6, r6, #0x7F, 24
        strh    lr, [r3, #4]
        strh    lr, [r12, #6]
        strh    r7, [r3, #6]
        strh    r7, [r12, #8]
        strh    r8, [r3, #8]
        strh    r8, [r12, #0xA]
        bge     LDTE41
        cmn     r5, #2, 18
        moveq   r2, r6
        beq     LDTE41
        rsb     r2, r5, #0
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #16
LDTE41:
        add     r3, sp, #0x10
        ldrsh   r7, [r3]
        cmp     r7, r2
        blt     LDTE55
        cmp     r2, r7
        moveq   r9, r6
        beq     LDTE42
        mov     r0, r2, lsl #15
        mov     r1, r7
        bl      __intel_idiv
        mov     r0, r0, lsl #16
        mov     r9, r0, asr #16
LDTE42:
        cmp     r5, #0
        strleh  r9, [r4]
        ble     LDTE43
        rsb     r9, r9, #0
        mov     r9, r9, lsl #16
        mov     r9, r9, asr #16
        strh    r9, [r4]
LDTE43:
        mul     r5, r5, r9
        add     r3, sp, #0x10
        ldrsh   r0, [r3, #4]
        add     r2, r5, #1, 18
        add     r7, r7, r2, asr #15
        add     r2, sp, #4
        ldrsh   r10, [r2, #4]
        ldrsh   r8, [r2, #8]
        mul     r2, r9, r0
        mov     r3, r7, lsl #16
        mul     r1, r9, r10
        mov     r5, r3, asr #16
        add     r3, sp, #0x10
        ldrsh   lr, [r3, #6]
        add     r3, sp, #4
        ldrsh   r12, [r3, #6]
        add     r3, sp, #0x10
        ldrsh   r7, [r3, #8]
        mul     r3, r9, r8
        mul     r11, r9, r12
        add     r1, r1, #1, 18
        add     r2, r2, #1, 18
        str     r3, [sp]
        mul     r3, r9, lr
        mul     r9, r9, r7
        add     r1, r0, r1, asr #15
        add     r0, sp, #0x10
        strh    r1, [r0, #2]
        add     r3, r3, #1, 18
        ldr     r1, [sp]
        add     r2, r10, r2, asr #15
        add     r12, r12, r3, asr #15
        add     r3, r9, #1, 18
        mov     r2, r2, lsl #16
        add     r1, r1, #1, 18
        add     r3, r8, r3, asr #15
        add     r11, r11, #1, 18
        mov     r8, r2, asr #16
        add     r2, sp, #0x10
        add     r0, sp, #0x10
        ldrsh   r0, [r0, #2]
        add     r1, r7, r1, asr #15
        add     r11, lr, r11, asr #15
        strh    r11, [r2, #4]
        add     r2, sp, #4
        mov     r9, r1, lsl #16
        strh    r3, [r2, #8]
        mov     r7, r0
        mov     r12, r12, lsl #16
        mov     r9, r9, asr #16
        add     r2, sp, #0x10
        cmp     r7, #0
        mov     r10, r12, asr #16
        strh    r9, [r2, #6]
        bge     LDTE44
        cmn     r7, #2, 18
        moveq   r0, r6
        beq     LDTE44
        rsb     r2, r7, #0
        mov     r2, r2, lsl #16
        mov     r0, r2, asr #16
LDTE44:
        cmp     r5, r0
        blt     LDTE54
        cmp     r0, r5
        moveq   r2, r6
        beq     LDTE45
        mov     r0, r0, lsl #15
        mov     r1, r5
        bl      __intel_idiv
        mov     r0, r0, lsl #16
        mov     r2, r0, asr #16
LDTE45:
        cmp     r7, #0
        strleh  r2, [r4, #2]
        ble     LDTE46
        rsb     r2, r2, #0
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #16
        strh    r2, [r4, #2]
LDTE46:
        mul     r11, r8, r2
        mul     r7, r7, r2
        mul     lr, r10, r2
        mul     r3, r9, r2
        add     r12, sp, #0x10
        ldrsh   r0, [r12, #4]
        add     r1, r11, #1, 18
        add     r7, r7, #1, 18
        add     lr, lr, #1, 18
        mul     r11, r0, r2
        add     r1, r0, r1, asr #15
        strh    r1, [r12, #2]
        add     r2, sp, #0x10
        ldrsh   r2, [r2, #2]
        add     r3, r3, #1, 18
        add     r5, r5, r7, asr #15
        add     r11, r11, #1, 18
        add     lr, r9, lr, asr #15
        add     r10, r10, r3, asr #15
        add     r8, r8, r11, asr #15
        strh    lr, [r12, #4]
        mov     r7, r2
        mov     r3, r8, lsl #16
        mov     r5, r5, lsl #16
        add     r12, sp, #4
        cmp     r7, #0
        strh    r10, [r12, #6]
        mov     r8, r5, asr #16
        mov     r9, r3, asr #16
        bge     LDTE47
        cmn     r7, #2, 18
        moveq   r2, r6
        beq     LDTE47
        rsb     r2, r7, #0
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #16
LDTE47:
        cmp     r8, r2
        mov     r5, #0
        blt     LDTE53
        cmp     r2, r8
        moveq   r2, r6
        beq     LDTE48
        mov     r0, r2, lsl #15
        mov     r1, r8
        bl      __intel_idiv
        mov     r0, r0, lsl #16
        mov     r2, r0, asr #16
LDTE48:
        cmp     r7, #0
        strleh  r2, [r4, #4]
        ble     LDTE49
        rsb     r2, r2, #0
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #16
        strh    r2, [r4, #4]
LDTE49:
        mul     r9, r9, r2
        mul     r7, r7, r2
        add     r2, sp, #0x10
        ldrsh   r2, [r2, #4]
        add     r9, r9, #1, 18
        add     r3, r7, #1, 18
        add     r9, r2, r9, asr #15
        mov     r2, r9, lsl #16
        add     r3, r8, r3, asr #15
        mov     r2, r2, asr #16
        mov     r7, r2
        mov     r3, r3, lsl #16
        cmp     r7, #0
        mov     r1, r3, asr #16
        bge     LDTE50
        cmn     r7, #2, 18
        moveq   r2, r6
        beq     LDTE50
        rsb     r2, r7, #0
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #16
LDTE50:
        cmp     r1, r2
        bge     LDTE51
        strh    r5, [r4, #6]
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LDTE51:
        cmp     r2, r1
        beq     LDTE52
        mov     r0, r2, lsl #15
        bl      __intel_idiv
        mov     r0, r0, lsl #16
        mov     r6, r0, asr #16
LDTE52:
        cmp     r7, #0
        rsbgt   r6, r6, #0
        strgth  r6, [r4, #6]
        ble     LDTE56
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LDTE53:
        add     r2, sp, #4
        strh    r9, [r2, #4]
        add     r2, sp, #0x10
        add     r0, r4, #4
        strh    r8, [r2]
        mov     r1, #2
        bl      _ippsZero_16s
        strh    r5, [r4, #4]
        strh    r5, [r4, #6]
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LDTE54:
        add     r2, sp, #4
        strh    r10, [r2, #6]
        strh    r8, [r2, #4]
        mov     r2, #0
        strh    r2, [r4, #2]
        strh    r2, [r4, #4]
        strh    r2, [r4, #6]
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LDTE55:
        mov     r0, r4
        mov     r1, #4
        bl      _ippsZero_16s
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LDTE56:
        strh    r6, [r4, #6]
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
        .long   NormTable
        .long   NormTable2


