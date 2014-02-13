        .text
        .align  4
        .globl  _ippsIIRInit32f_BiQuad_16s


_ippsIIRInit32f_BiQuad_16s:
        stmdb   sp!, {lr}
        sub     sp, sp, #8
        ldr     r12, [sp, #0xC]
        cmp     r0, #0
        beq     LBRN1
        cmp     r1, #0
        beq     LBRN1
        cmp     r12, #0
        beq     LBRN1
        cmp     r2, #1
        bge     LBRN0
        mvn     r0, #0x18
        add     sp, sp, #8
        ldr     pc, [sp], #4
LBRN0:
        str     r12, [sp]
        bl      LBRN_ownsIIRInit32f_BiQuad_16s
        add     sp, sp, #8
        ldr     pc, [sp], #4
LBRN1:
        mvn     r0, #7
        add     sp, sp, #8
        ldr     pc, [sp], #4
LBRN_ownsIIRInit32f_BiQuad_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x34
        ldr     lr, [sp, #0x58]
        ldr     r12, [pc, #0x6F4]
        mov     r8, r0
        add     lr, lr, #7
        bic     r5, lr, #7
        str     r5, [r8]
        str     r12, [r5]
        ldr     r9, [r8]
        rsb     lr, r2, r2, lsl #2
        add     r7, r2, r2, lsl #3
        add     r7, r2, r7
        mov     lr, lr, lsl #3
        add     r7, r7, #7
        add     lr, lr, #7
        bic     r11, r7, #7
        bic     r7, lr, #7
        add     r7, r5, r7
        add     r5, r5, #0x40
        str     r5, [r9, #4]
        ldr     r5, [r8]
        add     r9, r7, #0x40
        mov     lr, r2, lsl #4
        str     r9, [r5, #8]
        ldr     r9, [r8]
        add     lr, lr, #7
        mov     r5, r2, lsl #3
        add     r5, r5, #7
        bic     r5, r5, #7
        add     r10, r5, #0x40
        add     r0, r7, r10
        str     r0, [r9, #0xC]
        ldr     r0, [r8]
        mov     r4, r1
        add     r9, r7, r5
        bic     lr, lr, #7
        add     r1, r11, #0x40
        add     r1, r9, r1
        str     r1, [r0, #0x10]
        ldr     r0, [r8]
        add     r1, r5, r11
        add     r7, r7, r1
        add     r1, lr, #0x40
        add     r1, r7, r1
        str     r1, [r0, #0x14]
        ldr     r0, [r8]
        add     r11, r11, lr
        add     r1, r10, r11
        add     r1, r9, r1
        str     r1, [r0, #0x18]
        ldr     r1, [r8]
        mov     r0, r2, lsl #2
        add     r0, r0, #7
        bic     r0, r0, #7
        mov     r6, r3
        add     lr, lr, r5
        add     r3, r0, #0x40
        add     r3, lr, r3
        add     r3, r7, r3
        str     r3, [r1, #0x1C]
        add     r0, r5, r0
        ldr     lr, [r8]
        add     r0, r11, r0
        add     r9, r9, r0
        add     r10, r10, r9
        str     r10, [lr, #0x20]
        ldr     lr, [r8]
        mov     r0, #0
        add     r5, r5, #0x81, 26
        str     r0, [lr, #0x24]
        ldr     r7, [r8]
        add     lr, r9, r5
        mov     r5, #0xC
        str     r2, [r7, #0x28]
        ldr     r2, [r8]
        str     r5, [sp]
        mov     r7, #8
        str     r0, [r2, #0x2C]
        ldr     r2, [r8]
        str     r0, [r2, #0x30]
        ldr     r2, [r8]
        str     r0, [r2, #0x34]
        ldr     r2, [r8]
        str     r0, [r2, #0x38]
        ldr     r2, [r8]
        str     lr, [r2, #0x3C]
        ldr     r5, [r8]
        sub     lr, r12, #1
        ldr     r2, [r5]
        cmp     lr, r2
        beq     LBRN17
        cmp     r12, r2
        mvnne   r0, #0x10
        bne     LBRN5
        ldr     r11, [r5, #0x28]
        cmp     r11, #0
        add     r2, r11, r11, lsl #2
        ble     LBRN3
        ldr     r12, [pc, #0x578]
        add     r1, r4, #0xC
        mov     r10, r0
        ldr     r12, [r12]
        mov     r3, r4
        mov     lr, #0x10
        str     r6, [sp, #8]
        mov     r9, #4
        str     r3, [sp, #0x14]
        str     r1, [sp, #0x18]
        str     lr, [sp, #0x10]
        str     r12, [sp, #0x20]
        str     r2, [sp, #0xC]
        str     r8, [sp, #4]
        mov     r6, r0
LBRN2:
        ldr     r2, [sp, #0x18]
        ldr     r1, [sp, #0x20]
        ldr     r8, [r2], #0x18
        str     r2, [sp, #0x18]
        mov     r0, r8
        bl      __eqsf2
        cmp     r0, #0
        beq     LBRN15
        ldr     r2, [sp, #0x14]
        ldr     r1, [sp, #0x20]
        ldr     r0, [r2], #0x18
        str     r2, [sp, #0x14]
        str     r0, [sp, #0x1C]
        bl      __eqsf2
        cmp     r0, #0
        beq     LBRN14
        ldr     r2, [pc, #0x500]
        mov     r1, r8
        ldr     r0, [r2]
        add     r2, r4, #4
        str     r2, [sp, #0x2C]
        bl      __divsf3
        ldr     r1, [sp, #0x1C]
        mov     r8, r0
        bl      __mulsf3
        ldr     r2, [r5, #4]
        add     r3, r4, #8
        str     r3, [sp, #0x1C]
        str     r0, [r2, +r6]
        ldr     r2, [sp, #0x2C]
        mov     r1, r8
        add     r6, r6, #0x14
        ldr     r0, [r2, +r10]
        add     r2, r4, #0x10
        str     r2, [sp, #0x2C]
        add     r2, r4, #0x14
        str     r2, [sp, #0x30]
        bl      __mulsf3
        ldr     r2, [r5, #4]
        mov     r1, r8
        str     r0, [r2, +r9]
        ldr     r2, [sp, #0x1C]
        add     r9, r9, #0x14
        ldr     r0, [r2, +r10]
        bl      __mulsf3
        ldr     r2, [r5, #4]
        mov     r1, r8
        str     r0, [r2, +r7]
        ldr     r2, [sp, #0x2C]
        add     r7, r7, #0x14
        ldr     r0, [r2, +r10]
        bl      __mulsf3
        ldr     r2, [r5, #4]
        ldr     r3, [sp]
        mov     r1, r8
        str     r0, [r2, +r3]
        ldr     r2, [sp, #0x30]
        add     r3, r3, #0x14
        ldr     r0, [r2, +r10]
        str     r3, [sp]
        add     r10, r10, #0x18
        bl      __mulsf3
        ldr     r3, [sp, #0x10]
        ldr     r2, [r5, #4]
        subs    r11, r11, #1
        str     r0, [r2, +r3]
        add     r3, r3, #0x14
        str     r3, [sp, #0x10]
        bne     LBRN2
        ldr     r2, [sp, #0xC]
        ldr     r6, [sp, #8]
        ldr     r8, [sp, #4]
LBRN3:
        ldr     r0, [r5, #4]
        ldr     r1, [r5, #0xC]
        bl      ownsConvert32fTo16s
LBRN4:
        add     r0, r0, #0xE
        str     r0, [r5, #0x30]
        mov     r0, #0
LBRN5:
        cmp     r0, #0
        addne   sp, sp, #0x34
        ldmneia sp!, {r4 - r11, pc}
        ldr     r8, [r8]
        ldr     r2, [pc, #0x3F0]
        mov     r7, #0
        ldr     r0, [r8]
        sub     r1, r2, #1
        cmp     r1, r0
        ldreq   r10, [r8, #0x28]
        movne   r10, r7
        cmp     r2, r0
        ldreq   r0, [r8, #0x28]
        moveq   r10, r0, lsl #1
        cmp     r6, #0
        beq     LBRN16
        cmp     r10, #0
        ble     LBRN9
        cmp     r10, #6
        movlt   r9, r7
        blt     LBRN7
        mov     r9, r7
        sub     r5, r10, #6
        mov     r4, #4
        add     lr, r6, #4
        mov     r12, #8
        mov     r2, #0xC
        mov     r0, #0x10
LBRN6:
        ldr     r1, [lr, #-4]
        ldr     r11, [r8, #8]
        str     r1, [r11, +r9, lsl #2]
        ldr     r1, [lr]
        ldr     r11, [r8, #8]
        add     r9, r9, #5
        cmp     r9, r5
        str     r1, [r4, +r11]
        ldr     r1, [lr, #4]
        ldr     r11, [r8, #8]
        add     r4, r4, #0x14
        str     r1, [r12, +r11]
        ldr     r1, [lr, #8]
        ldr     r11, [r8, #8]
        add     r12, r12, #0x14
        str     r1, [r2, +r11]
        ldr     r1, [lr, #0xC]
        ldr     r11, [r8, #8]
        add     lr, lr, #0x14
        add     r2, r2, #0x14
        str     r1, [r0, +r11]
        add     r0, r0, #0x14
        ble     LBRN6
LBRN7:
        add     r12, r6, r9, lsl #2
LBRN8:
        ldr     r2, [r12], #4
        ldr     r0, [r8, #8]
        str     r2, [r0, +r9, lsl #2]
        add     r9, r9, #1
        cmp     r9, r10
        blt     LBRN8
LBRN9:
        cmp     r10, #0
        ble     LBRN13
        cmp     r10, #6
        movlt   r9, r7
        blt     LBRN11
        mov     r9, r7
        sub     r5, r10, #6
        mov     r4, r6
        str     r10, [sp, #0x20]
LBRN10:
        ldr     r0, [r4], #0x14
        add     r10, r9, #1
        bl      __fixsfdi
        ldr     r2, [r8, #0x10]
        str     r0, [r2, +r9, lsl #3]
        add     r2, r2, r7
        str     r1, [r2, #4]
        ldr     r0, [r6, +r10, lsl #2]
        add     r7, r7, #0x28
        add     r11, r9, #2
        bl      __fixsfdi
        ldr     r2, [r8, #0x10]
        str     r0, [r2, +r10, lsl #3]
        add     r10, r2, r10, lsl #3
        str     r1, [r10, #4]
        ldr     r0, [r6, +r11, lsl #2]
        add     r10, r9, #3
        bl      __fixsfdi
        ldr     r2, [r8, #0x10]
        str     r0, [r2, +r11, lsl #3]
        add     r11, r2, r11, lsl #3
        str     r1, [r11, #4]
        ldr     r0, [r6, +r10, lsl #2]
        add     r11, r9, #4
        add     r9, r9, #5
        bl      __fixsfdi
        ldr     r2, [r8, #0x10]
        str     r0, [r2, +r10, lsl #3]
        add     r10, r2, r10, lsl #3
        str     r1, [r10, #4]
        ldr     r0, [r6, +r11, lsl #2]
        bl      __fixsfdi
        ldr     r2, [r8, #0x10]
        cmp     r9, r5
        str     r0, [r2, +r11, lsl #3]
        add     r11, r2, r11, lsl #3
        str     r1, [r11, #4]
        ble     LBRN10
        ldr     r10, [sp, #0x20]
LBRN11:
        add     r6, r6, r9, lsl #2
        mov     r4, r9, lsl #3
LBRN12:
        ldr     r0, [r6], #4
        bl      __fixsfdi
        ldr     r2, [r8, #0x10]
        str     r0, [r2, +r9, lsl #3]
        add     r9, r9, #1
        add     r2, r2, r4
        cmp     r9, r10
        str     r1, [r2, #4]
        add     r4, r4, #8
        blt     LBRN12
LBRN13:
        mov     r0, #0
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LBRN14:
        ldr     r6, [sp, #8]
        ldr     r8, [sp, #4]
        mvn     r0, #9
        b       LBRN5
LBRN15:
        ldr     r6, [sp, #8]
        ldr     r8, [sp, #4]
        mvn     r0, #9
        b       LBRN5
LBRN16:
        ldr     r0, [r8, #8]
        mov     r1, r10
        bl      _ippsZero_32f
        ldr     r0, [r8, #0x10]
        mov     r1, r10
        bl      _ippsZero_64s
        mov     r0, #0
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LBRN17:
        ldr     r2, [pc, #0x1DC]
        ldr     r11, [r5, #0x28]
        add     r10, r4, #4
        ldr     r1, [r2]
        ldr     r9, [r10, +r11, lsl #2]
        mov     r0, r9
        bl      __eqsf2
        cmp     r0, #0
        mvneq   r0, #9
        beq     LBRN5
        ldr     r2, [pc, #0x1B8]
        mov     r1, r9
        ldr     r0, [r2]
        mov     r2, r11, lsl #1
        add     r2, r2, #1
        str     r2, [sp, #0x1C]
        bl      __divsf3
        ldr     r1, [r4]
        mov     r9, r0
        bl      __mulsf3
        ldr     r2, [r5, #4]
        str     r0, [r2]
        add     r2, r11, #1
        cmp     r2, #1
        ble     LBRN21
        sub     r2, r11, #1
        add     r2, r2, #1
        cmp     r2, #4
        mov     r0, #1
        blt     LBRN19
        str     r7, [sp, #0x28]
        add     r1, r4, #8
        sub     r12, r11, #3
        add     r2, r11, #1
        str     r6, [sp, #8]
        str     r4, [sp, #0x24]
        mov     r7, r5
        str     r12, [sp, #0x18]
        str     r11, [sp, #0x20]
        str     r8, [sp, #4]
        mov     r4, r0
        mov     r5, r1
        mov     r6, r2
LBRN18:
        ldr     r0, [r5, #-4]
        mov     r1, r9
        mov     r11, r6, lsl #2
        bl      __mulsf3
        ldr     r3, [r7, #4]
        mov     r1, r9
        str     r0, [r3, +r4, lsl #2]
        ldr     r0, [r10, +r6, lsl #2]
        add     r8, r11, #4
        add     r11, r11, #8
        bl      __mulsf3
        ldr     r3, [r7, #4]
        add     r4, r4, #3
        str     r0, [r3, +r6, lsl #2]
        ldr     r0, [r5]
        mov     r1, r9
        add     r6, r6, #3
        bl      __mulsf3
        ldr     r3, [sp, #0x28]
        ldr     r2, [r7, #4]
        mov     r1, r9
        str     r0, [r3, +r2]
        ldr     r0, [r10, +r8]
        add     r3, r3, #0xC
        str     r3, [sp, #0x28]
        bl      __mulsf3
        ldr     r3, [r7, #4]
        mov     r1, r9
        str     r0, [r8, +r3]
        ldr     r0, [r5, #4]
        add     r5, r5, #0xC
        bl      __mulsf3
        ldr     r12, [sp]
        ldr     r3, [r7, #4]
        mov     r1, r9
        str     r0, [r12, +r3]
        ldr     r0, [r10, +r11]
        add     r12, r12, #0xC
        str     r12, [sp]
        bl      __mulsf3
        ldr     r12, [sp, #0x18]
        ldr     r3, [r7, #4]
        cmp     r4, r12
        str     r0, [r11, +r3]
        ble     LBRN18
        mov     r0, r4
        mov     r5, r7
        ldr     r11, [sp, #0x20]
        ldr     r6, [sp, #8]
        ldr     r4, [sp, #0x24]
        ldr     r8, [sp, #4]
LBRN19:
        add     r1, r11, #1
        str     r8, [sp, #4]
        add     r4, r4, r0, lsl #2
        add     r11, r0, r11
        mov     r7, r0
        mov     r8, r1
LBRN20:
        ldr     r0, [r4], #4
        mov     r1, r9
        bl      __mulsf3
        ldr     r2, [r5, #4]
        mov     r1, r9
        str     r0, [r2, +r7, lsl #2]
        ldr     r0, [r10, +r11, lsl #2]
        add     r7, r7, #1
        bl      __mulsf3
        ldr     r2, [r5, #4]
        cmp     r7, r8
        str     r0, [r2, +r11, lsl #2]
        add     r11, r11, #1
        blt     LBRN20
        ldr     r8, [sp, #4]
LBRN21:
        ldr     r2, [sp, #0x1C]
        ldr     r0, [r5, #4]
        ldr     r1, [r5, #0xC]
        bl      ownsConvert32fTo16s
        b       LBRN4
        .long   0x49493036
        .long   LBRN__2il0floatpacket.1
        .long   LBRN__2il0floatpacket.2


        .data
        .align  4


LBRN__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00
LBRN__2il0floatpacket.2:
        .byte   0x00,0x00,0x80,0x3F


