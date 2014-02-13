        .text
        .align  4
        .globl  _ippsPowerSpectr_32fc


_ippsPowerSpectr_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x44
        mov     r6, r0
        cmp     r6, #0
        mov     r5, r1
        mov     r4, r2
        beq     LBAF11
        cmp     r5, #0
        beq     LBAF11
        cmp     r4, #1
        blt     LBAF10
        cmp     r4, #8
        ble     LBAF5
        mov     r10, r4, asr #3
        cmp     r10, #0
        and     r0, r4, #7
        ble     LBAF1
        add     r7, r5, #0x14
        str     r7, [sp, #0x1C]
        add     r7, r5, #0x18
        str     r7, [sp, #0x18]
        add     r7, r5, #0x1C
        str     r7, [sp, #0x14]
        add     r7, r6, #0x3C
        str     r7, [sp, #0x10]
        add     r7, r6, #0x34
        str     r7, [sp, #0xC]
        add     r7, r6, #0x2C
        str     r7, [sp]
        add     r7, r6, #0x24
        str     r7, [sp, #4]
        add     r11, r5, #4
        add     lr, r5, #8
        add     r12, r5, #0xC
        add     r3, r5, #0x10
        mov     r1, r5
        str     r4, [sp, #8]
        str     r5, [sp, #0x24]
        ldr     r5, [sp, #4]
        ldr     r4, [sp, #0x10]
        add     r2, r6, #4
        add     r9, r6, #0x1C
        add     r8, r6, #0x14
        add     r7, r6, #0xC
        str     r1, [sp, #0x2C]
        str     r2, [sp, #0x40]
        str     r3, [sp, #0x3C]
        str     r12, [sp, #0x38]
        str     lr, [sp, #0x34]
        str     r11, [sp, #0x30]
        str     r0, [sp, #0x28]
        str     r6, [sp, #0x20]
LBAF0:
        ldr     r2, [sp, #0x40]
        ldr     r0, [r2, #-4]
        ldr     r11, [r2], #0x40
        str     r2, [sp, #0x40]
        mov     r1, r0
        bl      __mulsf3
        mov     r6, r0
        mov     r1, r11
        mov     r0, r11
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        ldr     r2, [sp, #0x2C]
        str     r0, [r2], #0x20
        ldr     r11, [r7]
        ldr     r0, [r7, #-4]
        str     r2, [sp, #0x2C]
        add     r7, r7, #0x40
        mov     r1, r0
        bl      __mulsf3
        mov     r6, r0
        mov     r0, r11
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        ldr     r2, [sp, #0x30]
        str     r0, [r2], #0x20
        ldr     r1, [r8, #-4]
        ldr     r11, [r8], #0x40
        str     r2, [sp, #0x30]
        mov     r0, r1
        bl      __mulsf3
        mov     r6, r0
        mov     r0, r11
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        ldr     r2, [sp, #0x34]
        str     r0, [r2], #0x20
        ldr     r1, [r9, #-4]
        ldr     r11, [r9], #0x40
        mov     r0, r1
        str     r2, [sp, #0x34]
        bl      __mulsf3
        mov     r6, r0
        mov     r0, r11
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        ldr     r2, [sp, #0x38]
        str     r0, [r2], #0x20
        ldr     r1, [r5, #-4]
        ldr     r11, [r5], #0x40
        mov     r0, r1
        str     r2, [sp, #0x38]
        bl      __mulsf3
        mov     r6, r0
        mov     r0, r11
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        ldr     r1, [sp, #0x3C]
        str     r0, [r1], #0x20
        ldr     r2, [sp]
        str     r1, [sp, #0x3C]
        ldr     r11, [r2]
        ldr     r1, [r2, #-4]
        add     r2, r2, #0x40
        str     r2, [sp]
        mov     r0, r1
        bl      __mulsf3
        mov     r6, r0
        mov     r0, r11
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        ldr     r1, [sp, #0x1C]
        str     r0, [r1], #0x20
        ldr     r2, [sp, #0xC]
        str     r1, [sp, #0x1C]
        ldr     r11, [r2]
        ldr     r0, [r2, #-4]
        add     r2, r2, #0x40
        str     r2, [sp, #0xC]
        mov     r1, r0
        bl      __mulsf3
        mov     r6, r0
        mov     r1, r11
        mov     r0, r11
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        ldr     r2, [sp, #0x18]
        str     r0, [r2], #0x20
        ldr     r1, [r4, #-4]
        ldr     r11, [r4], #0x40
        str     r2, [sp, #0x18]
        mov     r0, r1
        bl      __mulsf3
        mov     r6, r0
        mov     r0, r11
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        ldr     r1, [sp, #0x14]
        subs    r10, r10, #1
        str     r0, [r1], #0x20
        str     r1, [sp, #0x14]
        bne     LBAF0
        ldr     r0, [sp, #0x28]
        ldr     r4, [sp, #8]
        ldr     r5, [sp, #0x24]
        ldr     r6, [sp, #0x20]
LBAF1:
        sub     r8, r4, r0
        cmp     r8, r4
        bge     LBAF9
        sub     r3, r4, r8
        cmp     r3, #5
        blt     LBAF3
        mov     r3, r8, lsl #3
        add     r3, r3, #4
        add     r7, r3, r6
        sub     r12, r4, #5
        add     r3, r5, r8, lsl #2
        str     r3, [sp, #0x3C]
        str     r12, [sp, #0x40]
        str     r4, [sp, #8]
LBAF2:
        ldr     r1, [r7, #-4]
        ldr     r11, [r7], #0x20
        add     r9, r8, #2
        mov     r0, r1
        bl      __mulsf3
        mov     r10, r0
        mov     r1, r11
        mov     r0, r11
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r2, [sp, #0x3C]
        add     r4, r8, #1
        str     r0, [r2], #0x10
        ldr     r0, [r6, +r4, lsl #3]
        str     r2, [sp, #0x3C]
        add     r2, r6, r4, lsl #3
        ldr     r10, [r2, #4]
        mov     r1, r0
        bl      __mulsf3
        mov     r11, r0
        mov     r1, r10
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        str     r0, [r5, +r4, lsl #2]
        ldr     r1, [r6, +r9, lsl #3]
        add     r2, r6, r9, lsl #3
        ldr     r4, [r2, #4]
        mov     r0, r1
        bl      __mulsf3
        mov     r10, r0
        mov     r1, r4
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        str     r0, [r5, +r9, lsl #2]
        add     r4, r8, #3
        ldr     r1, [r6, +r4, lsl #3]
        add     r2, r6, r4, lsl #3
        ldr     r9, [r2, #4]
        mov     r0, r1
        bl      __mulsf3
        mov     r10, r0
        mov     r0, r9
        mov     r1, r9
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r2, [sp, #0x40]
        add     r8, r8, #4
        cmp     r8, r2
        str     r0, [r5, +r4, lsl #2]
        ble     LBAF2
        ldr     r4, [sp, #8]
LBAF3:
        mov     r3, r8, lsl #3
        add     r3, r3, #4
        add     r6, r3, r6
        add     r5, r5, r8, lsl #2
LBAF4:
        ldr     r1, [r6, #-4]
        ldr     r9, [r6], #8
        mov     r0, r1
        bl      __mulsf3
        mov     r7, r0
        mov     r0, r9
        mov     r1, r9
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        add     r8, r8, #1
        str     r0, [r5], #4
        cmp     r8, r4
        blt     LBAF4
        mov     r0, #0
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LBAF5:
        cmp     r4, #5
        mov     r8, #0
        blt     LBAF7
        sub     r12, r4, #5
        mov     r3, r5
        add     r7, r6, #4
        str     r3, [sp]
        str     r12, [sp, #4]
        str     r4, [sp, #8]
LBAF6:
        ldr     r10, [r7]
        ldr     r1, [r7, #-4]
        add     r9, r8, #2
        add     r7, r7, #0x20
        add     r4, r8, #1
        mov     r0, r1
        bl      __mulsf3
        mov     r11, r0
        mov     r1, r10
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r2, [sp]
        str     r0, [r2], #0x10
        ldr     r0, [r6, +r4, lsl #3]
        str     r2, [sp]
        add     r2, r6, r4, lsl #3
        ldr     r10, [r2, #4]
        mov     r1, r0
        bl      __mulsf3
        mov     r11, r0
        mov     r1, r10
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        str     r0, [r5, +r4, lsl #2]
        ldr     r1, [r6, +r9, lsl #3]
        add     r2, r6, r9, lsl #3
        ldr     r4, [r2, #4]
        mov     r0, r1
        bl      __mulsf3
        mov     r10, r0
        mov     r1, r4
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        str     r0, [r5, +r9, lsl #2]
        add     r4, r8, #3
        ldr     r1, [r6, +r4, lsl #3]
        add     r2, r6, r4, lsl #3
        ldr     r9, [r2, #4]
        mov     r0, r1
        bl      __mulsf3
        mov     r10, r0
        mov     r0, r9
        mov     r1, r9
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r2, [sp, #4]
        add     r8, r8, #4
        cmp     r8, r2
        str     r0, [r5, +r4, lsl #2]
        ble     LBAF6
        ldr     r4, [sp, #8]
LBAF7:
        mov     r3, r8, lsl #3
        add     r3, r3, #4
        add     r6, r3, r6
        add     r5, r5, r8, lsl #2
LBAF8:
        ldr     r1, [r6, #-4]
        ldr     r7, [r6], #8
        mov     r0, r1
        bl      __mulsf3
        mov     r9, r0
        mov     r0, r7
        mov     r1, r7
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        add     r8, r8, #1
        str     r0, [r5], #4
        cmp     r8, r4
        blt     LBAF8
LBAF9:
        mov     r0, #0
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LBAF10:
        mvn     r0, #5
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LBAF11:
        mvn     r0, #7
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}


