        .text
        .align  4
        .globl  _ippsIIRInitAlloc32f_16s


LBRK_ownsIIRGetStateSize32f_16s:
        stmdb   sp!, {r4, r5, lr}
        mov     r12, #0
        mov     r2, r12
        cmp     r0, #0
        mov     r3, #1
        movlt   r2, r3
        adds    lr, r0, #1
        movmi   r12, r3
        add     r12, r0, r12
        add     r3, r12, #1
        add     r2, r0, r2
        and     r12, r0, #1
        cmp     r12, #1
        mov     r2, r2, asr #1
        mov     r3, r3, asr #1
        addeq   r2, r2, #1
        addne   r3, r3, #1
        add     r4, r0, #2
        mov     r12, r0, lsl #2
        mov     lr, lr, lsl #2
        mov     r0, r0, lsl #3
        mov     r4, r4, lsl #3
        add     lr, lr, #7
        add     r5, r0, #7
        mov     r2, r2, lsl #2
        add     r12, r12, #7
        add     r4, r4, #7
        bic     lr, lr, #7
        bic     r0, r4, #7
        add     r2, r2, #7
        bic     r12, r12, #7
        bic     r5, r5, #7
        add     lr, lr, r5
        add     r0, r0, r12
        bic     r2, r2, #7
        mov     r3, r3, lsl #2
        add     lr, r0, lr
        add     r2, r12, r2
        add     r3, r3, #7
        mov     r0, #0x48
        add     r2, lr, r2
        bic     r3, r3, #7
        orr     r0, r0, #1, 18
        add     r2, r2, r3
        add     r0, r2, r0
        str     r0, [r1]
        mov     r0, #0
        ldmia   sp!, {r4, r5, pc}
_ippsIIRInitAlloc32f_16s:
        stmdb   sp!, {r4 - r7, lr}
        mov     r7, r0
        cmp     r7, #0
        mov     r6, r1
        mov     r5, r2
        mov     r4, r3
        beq     LBRK0
        cmp     r6, #0
        beq     LBRK0
        cmp     r5, #1
        mvnlt   r0, #0x18
        ldmltia sp!, {r4 - r7, pc}
        ldr     r12, [pc, #0x834]
        add     lr, r6, #4
        ldr     r0, [lr, +r5, lsl #2]
        ldr     r1, [r12]
        bl      __eqsf2
        cmp     r0, #0
        mvneq   r0, #9
        ldmeqia sp!, {r4 - r7, pc}
        mov     r0, r7
        mov     r3, r4
        mov     r2, r5
        mov     r1, r6
        ldmia   sp!, {r4 - r7, lr}
        b       LBRK_ownsIIRInitAlloc32f_16s
LBRK0:
        mvn     r0, #7
        ldmia   sp!, {r4 - r7, pc}
LBRK_ownsIIRInitAlloc32f_16s:
        stmdb   sp!, {r4 - r8, lr}
        sub     sp, sp, #0xC
        mov     r7, r1
        add     r1, sp, #8
        mov     r5, r2
        mov     r4, r0
        mov     r0, r5
        mov     r6, r3
        bl      LBRK_ownsIIRGetStateSize32f_16s
        ldr     r0, [sp, #8]
        bl      _ippsMalloc_8u
        mov     r8, r0
        cmp     r8, #0
        bne     LBRK1
        mvn     r0, #8
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r8, pc}
LBRK1:
        str     r8, [sp]
        mov     r2, r5
        mov     r3, r6
        mov     r1, r7
        mov     r0, r4
        bl      LBRK_ownsIIRInit32f_16s
        mov     r5, r0
        cmp     r5, #0
        beq     LBRK2
        mov     r0, r8
        bl      _ippsFree
        mov     r0, r5
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r8, pc}
LBRK2:
        ldr     r4, [r4]
        mov     r0, #1
        str     r0, [r4, #0x2C]
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r8, pc}
LBRK_ownsIIRInit32f_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x34
        ldr     lr, [sp, #0x58]
        mov     r7, #0
        cmp     r2, #0
        mov     r8, r7
        mov     r10, #1
        movlt   r8, r10
        adds    r12, r2, #1
        mov     r9, r7
        movmi   r9, r10
        add     r9, r2, r9
        add     r9, r9, #1
        str     r10, [sp]
        mov     r10, r9, asr #1
        add     r8, r2, r8
        and     r9, r2, #1
        cmp     r9, #1
        mov     r6, r0
        mov     r5, r1
        mov     r4, r3
        mov     r8, r8, asr #1
        addeq   r8, r8, #1
        addne   r10, r10, #1
        ldr     r11, [pc, #0x704]
        add     lr, lr, #7
        bic     r9, lr, #7
        str     r9, [r6]
        mov     r12, r12, lsl #2
        add     r12, r12, #7
        mov     r10, r10, lsl #2
        bic     r0, r12, #7
        add     r12, r10, #7
        bic     r12, r12, #7
        str     r12, [sp, #0x24]
        sub     r12, r11, #1
        str     r12, [r9]
        ldr     r10, [r6]
        add     r11, r2, #2
        add     r1, r9, #0x40
        str     r1, [r10, #4]
        mov     r11, r11, lsl #3
        add     r11, r11, #7
        ldr     r10, [r6]
        bic     r11, r11, #7
        add     r11, r9, r11
        add     r9, r11, #0x40
        str     r9, [r10, #8]
        ldr     r1, [r6]
        mov     r9, r2, lsl #2
        add     r9, r9, #7
        bic     r9, r9, #7
        add     r10, r11, r9
        add     r3, r10, #0x40
        str     r3, [r1, #0xC]
        ldr     r1, [r6]
        add     r3, r0, r10
        add     r3, r3, #0x40
        str     r3, [r1, #0x10]
        ldr     r1, [r6]
        mov     lr, r2, lsl #3
        add     r3, r9, r0
        add     lr, lr, #7
        add     r11, r11, r3
        bic     lr, lr, #7
        add     r3, lr, r11
        add     r3, r3, #0x40
        str     r3, [r1, #0x14]
        ldr     r3, [r6]
        add     r1, r0, lr
        add     r0, r10, r1
        add     r0, r0, r9
        add     r0, r0, #0x40
        str     r0, [r3, #0x18]
        ldr     r3, [r6]
        mov     r0, r8, lsl #2
        add     lr, lr, r9
        add     r0, r0, #7
        add     lr, r11, lr
        bic     r0, r0, #7
        add     lr, lr, r0
        add     lr, lr, #0x40
        str     lr, [r3, #0x1C]
        ldr     lr, [r6]
        add     r0, r9, r0
        ldr     r9, [sp, #0x24]
        add     r0, r1, r0
        add     r10, r10, r0
        add     r9, r10, r9
        add     r10, r9, #0x40
        str     r10, [lr, #0x20]
        ldr     r10, [r6]
        add     lr, r9, #0x81, 26
        str     r7, [r10, #0x24]
        ldr     r9, [r6]
        str     r2, [r9, #0x28]
        ldr     r2, [r6]
        mov     r9, #0xC
        str     r9, [sp, #8]
        str     r7, [r2, #0x2C]
        ldr     r2, [r6]
        str     r7, [r2, #0x30]
        ldr     r2, [r6]
        str     r8, [r2, #0x34]
        ldr     r2, [r6]
        mov     r8, #8
        str     r8, [sp, #4]
        str     r7, [r2, #0x38]
        ldr     r2, [r6]
        str     lr, [r2, #0x3C]
        ldr     r8, [r6]
        ldr     r2, [r8]
        cmp     r12, r2
        beq     LBRK18
        ldr     r12, [pc, #0x59C]
        cmp     r12, r2
        mvnne   r0, #0x10
        bne     LBRK6
        ldr     r11, [r8, #0x28]
        cmp     r11, #0
        add     r2, r11, r11, lsl #2
        ble     LBRK4
        ldr     lr, [pc, #0x580]
        ldr     r12, [pc, #0x580]
        add     r1, r5, #0xC
        ldr     lr, [lr]
        str     r4, [sp, #0xC]
        ldr     r4, [sp, #8]
        mov     r3, r5
        mov     r0, #0x10
        mov     r10, r7
        mov     r9, #4
        str     r3, [sp, #0x18]
        str     r1, [sp, #0x1C]
        str     r0, [sp, #0x14]
        str     lr, [sp, #0x24]
        str     r2, [sp]
        str     r6, [sp, #0x10]
LBRK3:
        ldr     r2, [sp, #0x1C]
        ldr     r1, [sp, #0x24]
        ldr     r6, [r2], #0x18
        str     r2, [sp, #0x1C]
        mov     r0, r6
        bl      __eqsf2
        cmp     r0, #0
        beq     LBRK16
        ldr     r2, [sp, #0x18]
        ldr     r1, [sp, #0x24]
        ldr     r0, [r2], #0x18
        str     r2, [sp, #0x18]
        str     r0, [sp, #0x20]
        bl      __eqsf2
        cmp     r0, #0
        beq     LBRK15
        ldr     r2, [pc, #0x504]
        mov     r1, r6
        ldr     r0, [r2]
        add     r2, r5, #4
        str     r2, [sp, #0x2C]
        bl      __divsf3
        ldr     r1, [sp, #0x20]
        mov     r6, r0
        bl      __mulsf3
        ldr     r2, [r8, #4]
        add     r3, r5, #8
        str     r3, [sp, #0x20]
        str     r0, [r2, +r7]
        ldr     r2, [sp, #0x2C]
        mov     r1, r6
        add     r7, r7, #0x14
        ldr     r0, [r2, +r10]
        add     r2, r5, #0x10
        str     r2, [sp, #0x2C]
        add     r2, r5, #0x14
        str     r2, [sp, #0x30]
        bl      __mulsf3
        ldr     r2, [r8, #4]
        mov     r1, r6
        str     r0, [r2, +r9]
        ldr     r2, [sp, #0x20]
        add     r9, r9, #0x14
        ldr     r0, [r2, +r10]
        bl      __mulsf3
        ldr     r3, [r8, #4]
        ldr     r2, [sp, #4]
        mov     r1, r6
        str     r0, [r3, +r2]
        ldr     r3, [sp, #0x2C]
        add     r2, r2, #0x14
        ldr     r0, [r3, +r10]
        str     r2, [sp, #4]
        bl      __mulsf3
        ldr     r2, [r8, #4]
        mov     r1, r6
        str     r0, [r2, +r4]
        ldr     r2, [sp, #0x30]
        add     r4, r4, #0x14
        ldr     r0, [r2, +r10]
        add     r10, r10, #0x18
        bl      __mulsf3
        ldr     r3, [sp, #0x14]
        ldr     r2, [r8, #4]
        subs    r11, r11, #1
        str     r0, [r2, +r3]
        add     r3, r3, #0x14
        str     r3, [sp, #0x14]
        bne     LBRK3
        ldr     r2, [sp]
        ldr     r4, [sp, #0xC]
        ldr     r6, [sp, #0x10]
LBRK4:
        ldr     r0, [r8, #4]
        ldr     r1, [r8, #0xC]
        bl      ownsConvert32fTo16s
LBRK5:
        add     r0, r0, #0xE
        str     r0, [r8, #0x30]
        mov     r0, #0
LBRK6:
        cmp     r0, #0
        addne   sp, sp, #0x34
        ldmneia sp!, {r4 - r11, pc}
        ldr     r6, [r6]
        ldr     r2, [pc, #0x3F4]
        mov     r8, #0
        ldr     r0, [r6]
        sub     r1, r2, #1
        cmp     r1, r0
        ldreq   r10, [r6, #0x28]
        movne   r10, r8
        cmp     r2, r0
        ldreq   r0, [r6, #0x28]
        moveq   r10, r0, lsl #1
        cmp     r4, #0
        beq     LBRK17
        cmp     r10, #0
        ble     LBRK10
        cmp     r10, #6
        movlt   r9, r8
        blt     LBRK8
        mov     r9, r8
        sub     r7, r10, #6
        mov     r5, #4
        add     lr, r4, #4
        mov     r12, #8
        mov     r2, #0xC
        mov     r0, #0x10
LBRK7:
        ldr     r1, [lr, #-4]
        ldr     r11, [r6, #8]
        str     r1, [r11, +r9, lsl #2]
        ldr     r1, [lr]
        ldr     r11, [r6, #8]
        add     r9, r9, #5
        cmp     r9, r7
        str     r1, [r5, +r11]
        ldr     r1, [lr, #4]
        ldr     r11, [r6, #8]
        add     r5, r5, #0x14
        str     r1, [r12, +r11]
        ldr     r1, [lr, #8]
        ldr     r11, [r6, #8]
        add     r12, r12, #0x14
        str     r1, [r2, +r11]
        ldr     r1, [lr, #0xC]
        ldr     r11, [r6, #8]
        add     lr, lr, #0x14
        add     r2, r2, #0x14
        str     r1, [r0, +r11]
        add     r0, r0, #0x14
        ble     LBRK7
LBRK8:
        add     r12, r4, r9, lsl #2
LBRK9:
        ldr     r2, [r12], #4
        ldr     r0, [r6, #8]
        str     r2, [r0, +r9, lsl #2]
        add     r9, r9, #1
        cmp     r9, r10
        blt     LBRK9
LBRK10:
        cmp     r10, #0
        ble     LBRK14
        cmp     r10, #6
        movlt   r9, r8
        blt     LBRK12
        mov     r9, r8
        sub     r7, r10, #6
        mov     r5, r4
        str     r10, [sp, #0x24]
LBRK11:
        ldr     r0, [r5], #0x14
        add     r10, r9, #1
        bl      __fixsfdi
        ldr     r2, [r6, #0x10]
        str     r0, [r2, +r9, lsl #3]
        add     r2, r2, r8
        str     r1, [r2, #4]
        ldr     r0, [r4, +r10, lsl #2]
        add     r8, r8, #0x28
        add     r11, r9, #2
        bl      __fixsfdi
        ldr     r2, [r6, #0x10]
        str     r0, [r2, +r10, lsl #3]
        add     r10, r2, r10, lsl #3
        str     r1, [r10, #4]
        ldr     r0, [r4, +r11, lsl #2]
        add     r10, r9, #3
        bl      __fixsfdi
        ldr     r2, [r6, #0x10]
        str     r0, [r2, +r11, lsl #3]
        add     r11, r2, r11, lsl #3
        str     r1, [r11, #4]
        ldr     r0, [r4, +r10, lsl #2]
        add     r11, r9, #4
        add     r9, r9, #5
        bl      __fixsfdi
        ldr     r2, [r6, #0x10]
        str     r0, [r2, +r10, lsl #3]
        add     r10, r2, r10, lsl #3
        str     r1, [r10, #4]
        ldr     r0, [r4, +r11, lsl #2]
        bl      __fixsfdi
        ldr     r2, [r6, #0x10]
        cmp     r9, r7
        str     r0, [r2, +r11, lsl #3]
        add     r11, r2, r11, lsl #3
        str     r1, [r11, #4]
        ble     LBRK11
        ldr     r10, [sp, #0x24]
LBRK12:
        add     r4, r4, r9, lsl #2
        mov     r5, r9, lsl #3
LBRK13:
        ldr     r0, [r4], #4
        bl      __fixsfdi
        ldr     r2, [r6, #0x10]
        str     r0, [r2, +r9, lsl #3]
        add     r9, r9, #1
        add     r2, r2, r5
        cmp     r9, r10
        str     r1, [r2, #4]
        add     r5, r5, #8
        blt     LBRK13
LBRK14:
        mov     r0, #0
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LBRK15:
        ldr     r4, [sp, #0xC]
        ldr     r6, [sp, #0x10]
        mvn     r0, #9
        b       LBRK6
LBRK16:
        ldr     r4, [sp, #0xC]
        ldr     r6, [sp, #0x10]
        mvn     r0, #9
        b       LBRK6
LBRK17:
        ldr     r0, [r6, #8]
        mov     r1, r10
        bl      _ippsZero_32f
        ldr     r0, [r6, #0x10]
        mov     r1, r10
        bl      _ippsZero_64s
        mov     r0, #0
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LBRK18:
        ldr     r2, [pc, #0x1E0]
        ldr     r11, [r8, #0x28]
        add     r10, r5, #4
        ldr     r1, [r2]
        ldr     r7, [r10, +r11, lsl #2]
        mov     r0, r7
        bl      __eqsf2
        cmp     r0, #0
        mvneq   r0, #9
        beq     LBRK6
        ldr     r2, [pc, #0x1BC]
        mov     r1, r7
        ldr     r0, [r2]
        mov     r2, r11, lsl #1
        add     r9, r2, #1
        bl      __divsf3
        ldr     r1, [r5]
        mov     r7, r0
        bl      __mulsf3
        ldr     r12, [r8, #4]
        str     r0, [r12]
        add     r12, r11, #1
        cmp     r12, #1
        ble     LBRK22
        sub     r12, r11, #1
        add     r12, r12, #1
        cmp     r12, #4
        blt     LBRK20
        str     r6, [sp, #0x10]
        ldr     r6, [sp]
        add     r0, r5, #8
        sub     r12, r11, #3
        add     r1, r11, #1
        str     r4, [sp, #0xC]
        str     r5, [sp, #0x28]
        str     r12, [sp, #0x1C]
        str     r9, [sp, #0x20]
        str     r11, [sp, #0x24]
        mov     r4, r0
        mov     r5, r1
LBRK19:
        ldr     r0, [r4, #-4]
        mov     r1, r7
        mov     r11, r5, lsl #2
        bl      __mulsf3
        ldr     r2, [r8, #4]
        mov     r1, r7
        str     r0, [r2, +r6, lsl #2]
        ldr     r0, [r10, +r5, lsl #2]
        add     r9, r11, #4
        add     r11, r11, #8
        bl      __mulsf3
        ldr     r2, [r8, #4]
        add     r6, r6, #3
        str     r0, [r2, +r5, lsl #2]
        ldr     r0, [r4]
        mov     r1, r7
        add     r5, r5, #3
        bl      __mulsf3
        ldr     r3, [sp, #4]
        ldr     r2, [r8, #4]
        mov     r1, r7
        str     r0, [r3, +r2]
        ldr     r0, [r10, +r9]
        add     r3, r3, #0xC
        str     r3, [sp, #4]
        bl      __mulsf3
        ldr     r2, [r8, #4]
        mov     r1, r7
        str     r0, [r9, +r2]
        ldr     r0, [r4, #4]
        add     r4, r4, #0xC
        bl      __mulsf3
        ldr     r3, [sp, #8]
        ldr     r2, [r8, #4]
        mov     r1, r7
        str     r0, [r3, +r2]
        ldr     r0, [r10, +r11]
        add     r3, r3, #0xC
        str     r3, [sp, #8]
        bl      __mulsf3
        ldr     r3, [sp, #0x1C]
        ldr     r2, [r8, #4]
        cmp     r6, r3
        str     r0, [r11, +r2]
        ble     LBRK19
        str     r6, [sp]
        ldr     r9, [sp, #0x20]
        ldr     r11, [sp, #0x24]
        ldr     r4, [sp, #0xC]
        ldr     r5, [sp, #0x28]
        ldr     r6, [sp, #0x10]
LBRK20:
        ldr     r12, [sp]
        str     r6, [sp, #0x10]
        ldr     r6, [sp]
        add     r0, r11, #1
        str     r4, [sp, #0xC]
        add     r5, r5, r12, lsl #2
        add     r11, r12, r11
        mov     r4, r0
LBRK21:
        ldr     r0, [r5], #4
        mov     r1, r7
        bl      __mulsf3
        ldr     r3, [r8, #4]
        mov     r1, r7
        str     r0, [r3, +r6, lsl #2]
        ldr     r0, [r10, +r11, lsl #2]
        add     r6, r6, #1
        bl      __mulsf3
        ldr     r3, [r8, #4]
        cmp     r6, r4
        str     r0, [r3, +r11, lsl #2]
        add     r11, r11, #1
        blt     LBRK21
        ldr     r4, [sp, #0xC]
        ldr     r6, [sp, #0x10]
LBRK22:
        ldr     r0, [r8, #4]
        ldr     r1, [r8, #0xC]
        mov     r2, r9
        bl      ownsConvert32fTo16s
        b       LBRK5
        .long   LBRK__2il0floatpacket.1
        .long   0x49493036
        .long   LBRK__2il0floatpacket.2
        .long   LBRK__2il0floatpacket.3


        .data
        .align  4


LBRK__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00
LBRK__2il0floatpacket.2:
        .byte   0x00,0x00,0x00,0x00
LBRK__2il0floatpacket.3:
        .byte   0x00,0x00,0x80,0x3F


