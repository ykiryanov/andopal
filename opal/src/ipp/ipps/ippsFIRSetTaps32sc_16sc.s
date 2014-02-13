        .text
        .align  4
        .globl  _ippsFIRSetTaps32sc_16sc


_ippsFIRSetTaps32sc_16sc:
        stmdb   sp!, {lr}
        cmp     r1, #0
        mov     r3, r2
        beq     LBTL1
        cmp     r0, #0
        beq     LBTL1
        ldr     lr, [r1, #0x58]
        ldr     r12, [pc, #0x54C]
        subs    lr, lr, r12
        beq     LBTL0
        adds    r12, lr, #2
        mvnne   r0, #0x10
        ldrne   pc, [sp], #4
        mov     r2, r1
        mov     r1, r3
        bl      LBTL_ownsSRSetTaps32sc_16sc
        mov     r0, #0
        ldr     pc, [sp], #4
LBTL0:
        mov     r2, r1
        mov     r1, r3
        bl      LBTL_ownsMRSetTaps32sc_16sc
        mov     r0, #0
        ldr     pc, [sp], #4
LBTL1:
        mvn     r0, #7
        ldr     pc, [sp], #4
LBTL_ownsMRSetTaps32sc_16sc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x44
        mov     r7, r2
        ldr     r2, [r7]
        ldr     r6, [r7, #0xC]
        ldr     r11, [r7, #8]
        ldr     r3, [r7, #0x14]
        str     r3, [sp, #0x24]
        ldr     r3, [r7, #0x10]
        mov     r4, r6, lsl #2
        str     r3, [sp, #8]
        ldr     r9, [r7, #0x48]
        ldr     r10, [r7, #0x18]
        str     r1, [sp, #0x3C]
        ldr     r3, [r7, #0x34]
        ldr     r8, [r7, #0x24]
        str     r1, [r7, #0x60]
        mov     r1, r2
        str     r3, [sp, #0x40]
        ldr     r3, [r7, #0x4C]
        ldr     r5, [r7, #0x30]
        mov     r2, r11
        str     r3, [sp, #0x38]
        mul     r3, r6, r9
        str     r3, [sp, #0x28]
        bl      ownsCvt32scTo16sc
        ldr     r3, [sp, #0x3C]
        mov     r2, r4
        mov     r1, r5
        add     r3, r0, r3
        str     r3, [r7, #0x28]
        mvn     r0, #0
        bl      _ippsSet_32s
        ldr     r1, [sp, #0x38]
        mov     r2, r8, lsl #3
        add     r3, r1, r8, lsl #4
        str     r3, [sp, #0x3C]
        mvn     r0, #0
        bl      _ippsSet_32s
        ldr     r12, [sp, #0x3C]
        ldr     r2, [sp, #8]
        mov     r1, #0
LBTL2:
        cmp     r11, #0
        ble     LBTL35
        cmp     r11, #6
        add     r0, r8, r2
        blt     LBTL34
        mul     r0, r1, r0
        mov     r3, #0
        sub     lr, r11, #6
        str     r11, [sp, #4]
        add     r0, r12, r0, lsl #2
        str     r7, [sp]
LBTL3:
        str     r3, [r0, +r3, lsl #2]
        add     r7, r3, #1
        str     r7, [r0, +r7, lsl #2]
        add     r7, r3, #2
        str     r7, [r0, +r7, lsl #2]
        add     r11, r3, #3
        add     r7, r3, #4
        str     r11, [r0, +r11, lsl #2]
        add     r3, r3, #5
        cmp     r3, lr
        str     r7, [r0, +r7, lsl #2]
        ble     LBTL3
        ldr     r11, [sp, #4]
        ldr     r7, [sp]
LBTL4:
        str     r3, [r0, +r3, lsl #2]
        add     r3, r3, #1
        cmp     r3, r11
        blt     LBTL4
        add     r1, r1, #1
        cmp     r1, #4
        blt     LBTL2
        str     r12, [sp, #0x3C]
LBTL5:
        sub     r0, r11, #1
        mov     r1, r6
        bl      __intel_imod
        ldr     r3, [sp, #0x24]
        add     r3, r0, r3
        cmp     r3, r6
        movlt   lr, #1
        subge   r3, r3, r6
        movge   lr, #0
        cmp     r6, #0
        movle   r12, #0
        ble     LBTL14
        mov     r0, r10
        cmp     r3, r0
        bge     LBTL33
        mov     r12, #0
        mov     r1, r12
        mov     r11, r1
LBTL6:
        add     r3, r6, r3
        cmp     r3, r0
        add     lr, lr, #1
        blt     LBTL6
LBTL7:
        str     r5, [sp, #0x2C]
        ldr     r5, [sp, #8]
        str     r4, [sp, #0x14]
        str     r8, [sp, #0x34]
        str     r7, [sp]
LBTL8:
        cmp     r1, #0
        moveq   r12, lr
        mul     r2, r9, r1
        str     r9, [sp, #0x10]
        str     r10, [sp, #0xC]
        str     r6, [sp, #0x30]
        ldr     r5, [sp, #0x3C]
        ldr     r10, [sp, #0x28]
        ldr     r6, [sp, #0x38]
        ldr     r9, [sp, #0x34]
        mov     r4, #0
        sub     r0, r3, r0
        mov     r8, r4
        mov     r7, r11
        str     r12, [sp, #0x1C]
        str     r1, [sp, #0x18]
        str     r3, [sp, #4]
LBTL9:
        mla     r12, r10, r8, r2
        cmp     r0, r9
        mov     r3, r0
        bge     LBTL12
        mov     r1, lr
        str     lr, [sp, #0x24]
        ldr     lr, [sp, #0x2C]
        ldr     r10, [sp, #0x30]
        str     r11, [sp, #0x20]
LBTL10:
        add     r11, r3, r4
        ldr     r11, [r5, +r11, lsl #2]
        cmn     r11, #1
        ble     LBTL11
        str     r11, [r6, +r12, lsl #2]
        ldr     r11, [lr, +r7, lsl #2]
        cmn     r11, #1
        streq   r1, [lr, +r7, lsl #2]
        add     r12, r12, #1
LBTL11:
        add     r3, r10, r3
        cmp     r3, r9
        add     r1, r1, #1
        blt     LBTL10
        ldr     r11, [sp, #0x20]
        ldr     lr, [sp, #0x24]
        ldr     r10, [sp, #0x28]
LBTL12:
        add     r8, r8, #1
        cmp     r8, #4
        add     r4, r4, r9
        add     r7, r7, #1
        add     r11, r11, #1
        blt     LBTL9
        ldr     r1, [sp, #0x18]
        ldr     r6, [sp, #0x30]
        ldr     r12, [sp, #0x1C]
        ldr     r3, [sp, #4]
        ldr     r9, [sp, #0x10]
        ldr     r10, [sp, #0xC]
        ldr     r5, [sp, #8]
        add     r1, r1, #1
        cmp     r1, r6
        bge     LBTL13
        mov     r0, r1, lsl #2
        mla     r0, r5, r0, r10
        cmp     r3, r0
        bge     LBTL8
        ldr     r4, [sp, #0x14]
        ldr     r5, [sp, #0x2C]
        ldr     r8, [sp, #0x34]
        ldr     r7, [sp]
        b       LBTL6
LBTL13:
        ldr     r4, [sp, #0x14]
        ldr     r5, [sp, #0x2C]
        ldr     r7, [sp]
LBTL14:
        ldr     r0, [sp, #8]
        mla     r10, r0, r4, r10
        cmp     r3, r10
        bge     LBTL16
LBTL15:
        add     r3, r6, r3
        cmp     r3, r10
        add     lr, lr, #1
        blt     LBTL15
LBTL16:
        ldr     r0, [r5]
        cmp     r0, #0
        strlt   r12, [r5]
        movlt   r0, r12
        sub     lr, lr, r0
        cmp     r4, #0
        str     lr, [r5, +r6, lsl #4]
        ble     LBTL19
        mov     r3, #0
        mov     r0, r5
LBTL17:
        ldr     r12, [r0]
        cmp     r12, #0
        blt     LBTL32
LBTL18:
        add     r3, r3, #1
        cmp     r3, r4
        add     r0, r0, #4
        blt     LBTL17
LBTL19:
        cmp     r6, #0
        ble     LBTL26
        mov     lr, #0
        mov     r12, lr
        sub     r3, r9, #5
LBTL20:
        ldr     r8, [sp, #0x3C]
        ldr     r11, [sp, #0x28]
        ldr     r1, [sp, #0x38]
        mov     r0, #0
        str     r7, [sp]
LBTL21:
        cmp     r9, #0
        ble     LBTL31
        cmp     r9, #5
        blt     LBTL30
        mul     r4, r0, r11
        mul     r10, r9, r12
        mov     r2, lr, lsl #2
        add     r2, r2, #4
        mov     r5, #0
        add     r4, r1, r4, lsl #2
        add     r2, r2, r8
        mov     r7, r10
        str     r9, [sp, #0x10]
        str     r6, [sp, #0x30]
LBTL22:
        ldr     r6, [r4, +r7, lsl #2]
        mov     r9, r7, lsl #2
        add     r1, r9, #4
        str     r6, [r2, #-4]
        ldr     r1, [r4, +r1]
        add     r6, r9, #8
        add     r9, r9, #0xC
        str     r1, [r2]
        ldr     r6, [r4, +r6]
        add     r7, r7, #4
        add     r5, r5, #4
        str     r6, [r2, #4]
        ldr     r9, [r4, +r9]
        cmp     r5, r3
        add     lr, lr, #4
        str     r9, [r2, #8]
        add     r2, r2, #0x10
        ble     LBTL22
        ldr     r1, [sp, #0x38]
        ldr     r9, [sp, #0x10]
        ldr     r6, [sp, #0x30]
LBTL23:
        add     r2, r8, lr, lsl #2
        add     r10, r5, r10
LBTL24:
        ldr     r7, [r4, +r10, lsl #2]
        add     r5, r5, #1
        cmp     r5, r9
        str     r7, [r2], #4
        add     r10, r10, #1
        add     lr, lr, #1
        blt     LBTL24
        add     r0, r0, #1
        cmp     r0, #4
        blt     LBTL21
        ldr     r7, [sp]
        str     r8, [sp, #0x3C]
LBTL25:
        add     r12, r12, #1
        cmp     r12, r6
        blt     LBTL20
LBTL26:
        ldr     r0, [sp, #0x28]
        mov     r0, r0, lsl #2
        cmp     r0, #0
        ble     LBTL29
        ldr     r12, [sp, #0x3C]
        ldr     r3, [sp, #0x40]
        mov     r1, #0
LBTL27:
        ldr     r4, [r12]
        cmn     r4, #1
        strleh  r1, [r3, #2]
        strleh  r1, [r3]
        ble     LBTL28
        ldr     lr, [r7]
        mov     r4, r4, lsl #2
        ldrsh   r4, [lr, +r4]
        strh    r4, [r3]
        ldr     r4, [r12]
        ldr     lr, [r7]
        add     r4, lr, r4, lsl #2
        ldrsh   lr, [r4, #2]
        strh    lr, [r3, #2]
LBTL28:
        subs    r0, r0, #1
        add     r3, r3, #4
        add     r12, r12, #4
        bne     LBTL27
LBTL29:
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LBTL30:
        mul     r2, r0, r11
        mul     r10, r9, r12
        mov     r5, #0
        add     r4, r1, r2, lsl #2
        b       LBTL23
LBTL31:
        add     r0, r0, #1
        cmp     r0, #4
        blt     LBTL21
        ldr     r7, [sp]
        str     r8, [sp, #0x3C]
        b       LBTL25
LBTL32:
        sub     r12, r5, #4
        ldr     r12, [r12, +r3, lsl #2]
        str     r12, [r0]
        b       LBTL18
LBTL33:
        mov     r12, #0
        mov     r1, r12
        mov     r11, r1
        b       LBTL7
LBTL34:
        mul     r0, r1, r0
        mov     r3, #0
        add     r0, r12, r0, lsl #2
        b       LBTL4
LBTL35:
        add     r1, r1, #1
        cmp     r1, #4
        blt     LBTL2
        str     r12, [sp, #0x3C]
        b       LBTL5
LBTL_ownsSRSetTaps32sc_16sc:
        stmdb   sp!, {r4, r5, lr}
        mov     r4, r2
        mov     r5, r1
        ldr     r2, [r4, #8]
        ldr     r1, [r4]
        bl      ownsCvt32scTo16sc
        add     r5, r0, r5
        str     r5, [r4, #0x28]
        ldmia   sp!, {r4, r5, pc}
        .long   0x46493132


