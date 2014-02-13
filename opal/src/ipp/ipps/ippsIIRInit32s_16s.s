        .text
        .align  4
        .globl  _ippsIIRInit32s_16s


_ippsIIRInit32s_16s:
        stmdb   sp!, {r4, lr}
        sub     sp, sp, #8
        ldr     lr, [sp, #0x10]
        ldr     r12, [sp, #0x14]
        cmp     r0, #0
        beq     LBOQ2
        cmp     r1, #0
        beq     LBOQ2
        cmp     r12, #0
        beq     LBOQ2
        cmp     r2, #1
        blt     LBOQ0
        add     r4, r1, #4
        ldr     r4, [r4, +r2, lsl #2]
        cmp     r4, #0
        bne     LBOQ1
        mvn     r0, #9
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}
LBOQ0:
        mvn     r0, #0x18
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}
LBOQ1:
        str     r12, [sp, #4]
        str     lr, [sp]
        bl      LBOQ_ownsIIRInit32s_16s
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}
LBOQ2:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}
LBOQ_ownsIIRInit32s_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x30
        ldr     r12, [sp, #0x54]
        mov     r7, r2
        ldr     r9, [sp, #0x58]
        mov     r6, #0
        cmp     r7, #0
        mov     lr, r6
        mov     r5, #1
        movlt   lr, r5
        str     r12, [sp, #0x20]
        adds    r12, r7, #1
        str     r3, [sp, #8]
        mov     r3, r6
        movmi   r3, r5
        add     r3, r7, r3
        and     r10, r7, #1
        add     lr, r7, lr
        cmp     r10, #1
        add     r3, r3, #1
        mov     r8, r0
        mov     r4, r1
        mov     lr, lr, asr #1
        mov     r10, r3, asr #1
        addeq   lr, lr, #1
        addne   r10, r10, #1
        ldr     r3, [pc, #0x704]
        add     r9, r9, #7
        bic     r9, r9, #7
        str     r9, [r8]
        str     r3, [r9]
        ldr     r11, [r8]
        mov     r12, r12, lsl #2
        add     r12, r12, #7
        bic     r3, r12, #7
        mov     r10, r10, lsl #2
        add     r10, r10, #7
        bic     r12, r10, #7
        add     r0, r7, #2
        add     r10, r9, #0x40
        mov     r0, r0, lsl #3
        str     r10, [r11, #4]
        ldr     r10, [r8]
        add     r0, r0, #7
        bic     r0, r0, #7
        add     r1, r9, r0
        add     r9, r1, #0x40
        str     r9, [r10, #8]
        ldr     r0, [r8]
        mov     r11, r7, lsl #2
        add     r11, r11, #7
        bic     r9, r11, #7
        add     r11, r1, r9
        add     r10, r11, #0x40
        str     r10, [r0, #0xC]
        ldr     r0, [r8]
        add     r2, r3, r11
        mov     r10, r7, lsl #3
        add     r2, r2, #0x40
        str     r2, [r0, #0x10]
        ldr     r0, [r8]
        add     r10, r10, #7
        add     r2, r9, r3
        bic     r10, r10, #7
        add     r1, r1, r2
        add     r2, r10, r1
        add     r2, r2, #0x40
        str     r2, [r0, #0x14]
        ldr     r2, [r8]
        add     r0, r3, r10
        add     r3, r11, r0
        add     r3, r3, r9
        add     r3, r3, #0x40
        str     r3, [r2, #0x18]
        ldr     r2, [r8]
        mov     r3, lr, lsl #2
        add     r10, r10, r9
        add     r3, r3, #7
        add     r10, r1, r10
        bic     r3, r3, #7
        add     r10, r10, r3
        add     r3, r9, r3
        add     r10, r10, #0x40
        str     r10, [r2, #0x1C]
        ldr     r10, [r8]
        add     r3, r0, r3
        add     r3, r11, r3
        add     r12, r3, r12
        add     r3, r12, #0x40
        str     r3, [r10, #0x20]
        ldr     r9, [r8]
        add     r3, r12, #0x81, 26
        str     r6, [r9, #0x24]
        ldr     r12, [r8]
        str     r7, [r12, #0x28]
        ldr     r12, [r8]
        str     r6, [r12, #0x2C]
        ldr     r12, [r8]
        str     r6, [r12, #0x30]
        ldr     r12, [r8]
        str     lr, [r12, #0x34]
        ldr     r12, [r8]
        str     r6, [r12, #0x38]
        ldr     r12, [r8]
        str     r3, [r12, #0x3C]
        ldr     r11, [r8]
        ldr     r3, [pc, #0x5C4]
        ldr     r12, [r11]
        ldr     r9, [r11, #4]
        ldr     r10, [r11, #0x28]
        cmp     r3, r12
        bne     LBOQ7
        add     r3, r4, #4
        ldr     r3, [r3, +r10, lsl #2]
        cmp     r3, #0
        mvneq   r4, #9
        beq     LBOQ11
        mov     r0, r4
        ldr     r3, [sp, #8]
        mov     r12, r10, lsl #1
        add     lr, r12, #2
        add     r4, r12, #1
        mov     r2, lr, lsl #1
        mov     r1, r9
        bl      _ippsConvert_32s32f_Sfs
        ldr     r3, [pc, #0x57C]
        add     r12, r9, #4
        str     r12, [sp, #0xC]
        ldr     r1, [r12, +r10, lsl #2]
        ldr     r0, [r3]
        add     r6, r10, #1
        bl      __divsf3
        str     r0, [sp, #8]
        ldr     r1, [r9]
        bl      __mulsf3
        cmp     r6, #1
        str     r0, [r9]
        ble     LBOQ6
        sub     r3, r10, #1
        add     r3, r3, #1
        cmp     r3, #5
        addlt   r6, r9, r10, lsl #2
        blt     LBOQ4
        add     r6, r9, r10, lsl #2
        add     r1, r9, #8
        str     r4, [sp]
        str     r9, [sp, #0x1C]
        ldr     r4, [sp, #8]
        ldr     r9, [sp, #0xC]
        add     r0, r6, #8
        sub     r3, r10, #4
        add     r2, r10, #1
        str     r6, [sp, #0x24]
        str     r7, [sp, #0x14]
        str     r8, [sp, #0x18]
        str     r3, [sp, #0x28]
        str     r10, [sp, #4]
        str     r11, [sp, #0x10]
        mov     r6, r0
        mov     r7, r1
        mov     r8, r2
LBOQ3:
        ldr     r0, [r7, #-4]
        mov     r1, r4
        mov     r11, r8, lsl #2
        bl      __mulsf3
        str     r0, [r7, #-4]
        ldr     r0, [r9, +r8, lsl #2]
        add     r3, r11, #4
        str     r3, [sp, #0x2C]
        mov     r1, r4
        bl      __mulsf3
        str     r0, [r6, #-4]
        ldr     r0, [r7]
        mov     r1, r4
        add     r10, r11, #8
        bl      __mulsf3
        str     r0, [r7]
        ldr     r3, [sp, #0x2C]
        mov     r1, r4
        add     r11, r11, #0xC
        ldr     r0, [r9, +r3]
        add     r8, r8, #4
        add     r5, r5, #4
        bl      __mulsf3
        str     r0, [r6]
        ldr     r0, [r7, #4]
        mov     r1, r4
        bl      __mulsf3
        str     r0, [r7, #4]
        ldr     r0, [r9, +r10]
        mov     r1, r4
        bl      __mulsf3
        str     r0, [r6, #4]
        ldr     r0, [r7, #8]
        mov     r1, r4
        bl      __mulsf3
        str     r0, [r7, #8]
        ldr     r0, [r9, +r11]
        mov     r1, r4
        add     r7, r7, #0x10
        bl      __mulsf3
        str     r0, [r6, #8]
        ldr     r3, [sp, #0x28]
        add     r6, r6, #0x10
        cmp     r5, r3
        ble     LBOQ3
        ldr     r6, [sp, #0x24]
        ldr     r4, [sp]
        ldr     r10, [sp, #4]
        ldr     r9, [sp, #0x1C]
        ldr     r11, [sp, #0x10]
        ldr     r7, [sp, #0x14]
        ldr     r8, [sp, #0x18]
LBOQ4:
        add     r0, r10, #1
        add     r10, r5, r10
        add     r1, r9, r5, lsl #2
        str     r8, [sp, #0x18]
        str     r11, [sp, #0x10]
        mov     r8, r5
        ldr     r5, [sp, #8]
        ldr     r11, [sp, #0xC]
        str     r9, [sp, #0x1C]
        str     r7, [sp, #0x14]
        mov     r9, r10
        mov     r7, r0
        mov     r10, r1
LBOQ5:
        ldr     r0, [r10]
        mov     r1, r5
        bl      __mulsf3
        str     r0, [r10], #4
        ldr     r0, [r11, +r9, lsl #2]
        mov     r1, r5
        bl      __mulsf3
        str     r0, [r6, +r8, lsl #2]
        add     r8, r8, #1
        cmp     r8, r7
        add     r9, r9, #1
        blt     LBOQ5
        ldr     r9, [sp, #0x1C]
        ldr     r11, [sp, #0x10]
        ldr     r7, [sp, #0x14]
        ldr     r8, [sp, #0x18]
LBOQ6:
        ldr     r1, [r11, #0xC]
        mov     r0, r9
        mov     r2, r4
        bl      ownsConvert32fTo16s
        b       LBOQ10
LBOQ7:
        ldr     r3, [sp, #8]
        add     r5, r10, r10, lsl #2
        add     r2, r10, r5
        mov     r1, r9
        mov     r0, r4
        bl      _ippsConvert_32s32f_Sfs
        cmp     r10, #0
        ble     LBOQ9
        ldr     r3, [pc, #0x374]
        mov     r1, r9
        str     r8, [sp, #0x18]
        mov     r2, r6
        add     r0, r4, #0xC
        mov     r12, r1
        str     r5, [sp, #0xC]
        str     r7, [sp, #0x14]
        mov     r8, r6
        str     r4, [sp]
        str     r12, [sp, #8]
        str     r10, [sp, #4]
        str     r11, [sp, #0x10]
        mov     r5, r0
        mov     r6, r1
        mov     r7, r2
LBOQ8:
        ldr     r3, [r5], #0x18
        cmp     r3, #0
        beq     LBOQ23
        ldr     r12, [sp]
        ldr     r3, [r12], #0x18
        str     r12, [sp]
        cmp     r3, #0
        beq     LBOQ22
        ldr     r3, [pc, #0x314]
        add     r11, r9, #4
        add     r10, r9, #8
        ldr     r0, [r3]
        add     r3, r9, #0xC
        str     r3, [sp, #0x2C]
        ldr     r1, [r3, +r7]
        bl      __divsf3
        ldr     r1, [r6], #0x18
        mov     r4, r0
        bl      __mulsf3
        ldr     r3, [sp, #8]
        mov     r1, r4
        str     r0, [r3], #0x14
        ldr     r0, [r11, +r7]
        str     r3, [sp, #8]
        bl      __mulsf3
        str     r0, [r11, +r8]
        ldr     r0, [r10, +r7]
        mov     r1, r4
        add     r11, r9, #0x10
        bl      __mulsf3
        str     r0, [r10, +r8]
        ldr     r0, [r11, +r7]
        mov     r1, r4
        add     r10, r9, #0x14
        bl      __mulsf3
        ldr     r3, [sp, #0x2C]
        mov     r1, r4
        str     r0, [r3, +r8]
        ldr     r0, [r10, +r7]
        add     r7, r7, #0x18
        bl      __mulsf3
        str     r0, [r11, +r8]
        ldr     r3, [sp, #4]
        add     r8, r8, #0x14
        subs    r3, r3, #1
        str     r3, [sp, #4]
        bne     LBOQ8
        ldr     r5, [sp, #0xC]
        ldr     r11, [sp, #0x10]
        ldr     r7, [sp, #0x14]
        ldr     r8, [sp, #0x18]
LBOQ9:
        ldr     r1, [r11, #0xC]
        mov     r0, r9
        mov     r2, r5
        bl      ownsConvert32fTo16s
LBOQ10:
        add     r0, r0, #0xE
        str     r0, [r11, #0x30]
        mov     r4, #0
LBOQ11:
        cmp     r4, #0
        bne     LBOQ20
        cmp     r7, #0
        ble     LBOQ19
        ldr     r8, [r8]
        ldr     r3, [pc, #0x234]
        mov     r4, #0
        ldr     r2, [r8]
        cmp     r3, r2
        ldreq   r10, [r8, #0x28]
        movne   r10, r4
        add     r3, r3, #0xF7
        cmp     r3, r2
        ldreq   r1, [r8, #0x28]
        moveq   r10, r1, lsl #1
        ldr     r2, [sp, #0x20]
        cmp     r2, #0
        beq     LBOQ21
        cmp     r10, #0
        ble     LBOQ15
        cmp     r10, #6
        movlt   r7, r4
        blt     LBOQ13
        mov     r7, r4
        ldr     r2, [sp, #0x20]
        sub     r6, r10, #6
        mov     r5, #4
        add     r2, r2, #4
        mov     lr, #8
        mov     r12, #0xC
        mov     r3, #0x10
LBOQ12:
        ldr     r11, [r2, #-4]
        ldr     r9, [r8, #8]
        str     r11, [r9, +r7, lsl #2]
        ldr     r11, [r2]
        ldr     r9, [r8, #8]
        add     r7, r7, #5
        cmp     r7, r6
        str     r11, [r5, +r9]
        ldr     r11, [r2, #4]
        ldr     r9, [r8, #8]
        add     r5, r5, #0x14
        str     r11, [lr, +r9]
        ldr     r11, [r2, #8]
        ldr     r9, [r8, #8]
        add     lr, lr, #0x14
        str     r11, [r12, +r9]
        ldr     r11, [r2, #0xC]
        ldr     r9, [r8, #8]
        add     r2, r2, #0x14
        add     r12, r12, #0x14
        str     r11, [r3, +r9]
        add     r3, r3, #0x14
        ble     LBOQ12
LBOQ13:
        ldr     r2, [sp, #0x20]
        add     r2, r2, r7, lsl #2
LBOQ14:
        ldr     r3, [r2], #4
        ldr     r12, [r8, #8]
        str     r3, [r12, +r7, lsl #2]
        add     r7, r7, #1
        cmp     r7, r10
        blt     LBOQ14
LBOQ15:
        cmp     r10, #0
        ble     LBOQ19
        cmp     r10, #6
        movlt   r9, r4
        blt     LBOQ17
        mov     r9, r4
        ldr     r5, [sp, #0x20]
        str     r4, [sp, #0x1C]
        ldr     r4, [sp, #0x20]
        sub     r7, r10, #6
        mov     r6, r9
        str     r10, [sp, #0x18]
LBOQ16:
        ldr     r0, [r5], #0x14
        add     r10, r9, #1
        bl      __fixsfdi
        ldr     r2, [r8, #0x10]
        str     r0, [r2, +r9, lsl #3]
        add     r2, r2, r6
        str     r1, [r2, #4]
        ldr     r0, [r4, +r10, lsl #2]
        add     r6, r6, #0x28
        add     r11, r9, #2
        bl      __fixsfdi
        ldr     r2, [r8, #0x10]
        str     r0, [r2, +r10, lsl #3]
        add     r10, r2, r10, lsl #3
        str     r1, [r10, #4]
        ldr     r0, [r4, +r11, lsl #2]
        add     r10, r9, #3
        bl      __fixsfdi
        ldr     r2, [r8, #0x10]
        str     r0, [r2, +r11, lsl #3]
        add     r11, r2, r11, lsl #3
        str     r1, [r11, #4]
        ldr     r0, [r4, +r10, lsl #2]
        add     r11, r9, #4
        add     r9, r9, #5
        bl      __fixsfdi
        ldr     r2, [r8, #0x10]
        str     r0, [r2, +r10, lsl #3]
        add     r10, r2, r10, lsl #3
        str     r1, [r10, #4]
        ldr     r0, [r4, +r11, lsl #2]
        bl      __fixsfdi
        ldr     r2, [r8, #0x10]
        cmp     r9, r7
        str     r0, [r2, +r11, lsl #3]
        add     r11, r2, r11, lsl #3
        str     r1, [r11, #4]
        ble     LBOQ16
        ldr     r10, [sp, #0x18]
        ldr     r4, [sp, #0x1C]
LBOQ17:
        ldr     r2, [sp, #0x20]
        mov     r6, r9, lsl #3
        add     r5, r2, r9, lsl #2
LBOQ18:
        ldr     r0, [r5], #4
        bl      __fixsfdi
        ldr     r2, [r8, #0x10]
        str     r0, [r2, +r9, lsl #3]
        add     r9, r9, #1
        add     r2, r2, r6
        cmp     r9, r10
        str     r1, [r2, #4]
        add     r6, r6, #8
        blt     LBOQ18
LBOQ19:
        mov     r0, r4
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LBOQ20:
        mov     r0, r4
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LBOQ21:
        ldr     r0, [r8, #8]
        mov     r1, r10
        bl      _ippsZero_32f
        ldr     r0, [r8, #0x10]
        mov     r1, r10
        bl      _ippsZero_64s
        b       LBOQ19
LBOQ22:
        ldr     r7, [sp, #0x14]
        ldr     r8, [sp, #0x18]
        mvn     r4, #9
        b       LBOQ11
LBOQ23:
        ldr     r7, [sp, #0x14]
        ldr     r8, [sp, #0x18]
        mvn     r4, #9
        b       LBOQ11
        .long   0x49493039
        .long   LBOQ__2il0floatpacket.1


        .data
        .align  4


LBOQ__2il0floatpacket.1:
        .byte   0x00,0x00,0x80,0x3F

