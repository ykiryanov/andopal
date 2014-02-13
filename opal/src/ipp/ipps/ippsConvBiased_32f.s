        .text
        .align  4
        .globl  _ippsConvBiased_32f


_ippsConvBiased_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        ldr     r12, [sp, #0x40]
        ldr     lr, [sp, #0x44]
        ldr     r7, [sp, #0x48]
        cmp     r0, #0
        mov     r5, r1
        mov     r6, r3
        beq     LCXH47
        cmp     r2, #0
        beq     LCXH47
        cmp     r12, #0
        beq     LCXH47
        cmp     r6, #0x2D
        beq     LCXH44
        cmp     r6, #0x32
        mov     r4, #0x28
        beq     LCXH42
        cmp     r6, #0x38
        beq     LCXH40
        cmp     r6, #0x46
        beq     LCXH38
        cmp     r6, #0x6E
        beq     LCXH36
        cmp     r6, #0x28
        beq     LCXH29
        cmp     r6, #0x3C
        beq     LCXH22
LCXH0:
        cmp     r5, #0
        ble     LCXH46
        cmp     r6, #0
        ble     LCXH46
LCXH1:
        cmp     lr, #0
        ble     LCXH46
LCXH2:
        cmp     r5, r6
        bne     LCXH8
        cmp     r5, lr
        bne     LCXH8
        cmp     r7, #0
        bne     LCXH8
        cmp     lr, #0
        ble     LCXH19
        ldr     r1, [pc, #0xE84]
        mov     r11, #0
        mov     r5, lr
        ldr     r6, [r1]
LCXH3:
        cmp     r11, #0
        mov     r4, r6
        movlt   r8, r11, lsl #2
        blt     LCXH7
        cmp     r11, #6
        blt     LCXH20
        mov     r8, r11, lsl #2
        sub     r1, r11, #6
        str     r5, [sp, #0x10]
        mov     r10, #0
        add     r9, r8, r2
        add     r7, r0, #4
        str     r11, [sp, #8]
        str     r12, [sp, #0xC]
        str     r2, [sp, #4]
        str     r0, [sp]
        mov     r5, r1
LCXH4:
        ldr     r0, [r7, #-4]
        rsb     r2, r10, #0
        ldr     r1, [r9, +r2, lsl #2]
        mvn     r2, #0
        rsb     r11, r10, r2
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r1, [r9, +r11, lsl #2]
        ldr     r2, [r7]
        mov     r4, r0
        mvn     r11, #1
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r1, [r7, #4]
        rsb     r11, r10, r11
        ldr     r2, [r9, +r11, lsl #2]
        mov     r4, r0
        mov     r0, r1
        mvn     r11, #2
        mov     r1, r2
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r2, [r7, #8]
        rsb     r11, r10, r11
        ldr     r1, [r9, +r11, lsl #2]
        mov     r4, r0
        mov     r0, r2
        mvn     r3, #3
        rsb     r11, r10, r3
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r1, [r7, #0xC]
        ldr     r11, [r9, +r11, lsl #2]
        mov     r4, r0
        mov     r0, r1
        add     r7, r7, #0x14
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        add     r10, r10, #5
        cmp     r10, r5
        mov     r4, r0
        ble     LCXH4
        ldr     r11, [sp, #8]
        ldr     r5, [sp, #0x10]
        ldr     r12, [sp, #0xC]
        ldr     r2, [sp, #4]
        ldr     r0, [sp]
LCXH5:
        add     r7, r0, r10, lsl #2
        str     r12, [sp, #0xC]
        str     r2, [sp, #4]
        str     r0, [sp]
LCXH6:
        ldr     r0, [r7], #4
        rsb     r2, r10, #0
        ldr     r1, [r9, +r2, lsl #2]
        add     r10, r10, #1
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        cmp     r10, r11
        mov     r4, r0
        ble     LCXH6
        ldr     r12, [sp, #0xC]
        ldr     r2, [sp, #4]
        ldr     r0, [sp]
LCXH7:
        add     r11, r11, #1
        cmp     r11, r5
        str     r4, [r8, +r12]
        blt     LCXH3
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LCXH8:
        add     r4, lr, r7
        sub     r4, r4, #1
        cmp     r6, r4
        ble     LCXH14
        sub     r4, r5, #1
        cmp     r7, r4
        blt     LCXH14
        cmp     lr, #0
        ble     LCXH19
        ldr     r3, [pc, #0xCD4]
        mov     r11, #0
        ldr     r6, [r3]
        sub     r3, r5, #6
        str     r3, [sp, #8]
LCXH9:
        cmp     r5, #0
        mov     r4, r6
        movle   r8, r11, lsl #2
        ble     LCXH13
        cmp     r5, #6
        blt     LCXH21
        str     r5, [sp, #0x18]
        ldr     r5, [sp, #8]
        mov     r8, r11, lsl #2
        mov     r10, #0
        add     r9, r8, r2
        add     r7, r0, #4
        str     r11, [sp, #0x14]
        str     lr, [sp, #0x10]
        str     r12, [sp, #0xC]
        str     r2, [sp, #4]
        str     r0, [sp]
LCXH10:
        ldr     r0, [r7, #-4]
        rsb     r2, r10, #0
        ldr     r1, [r9, +r2, lsl #2]
        mvn     r2, #0
        rsb     r11, r10, r2
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r1, [r9, +r11, lsl #2]
        ldr     r2, [r7]
        mov     r4, r0
        mvn     r11, #1
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r1, [r7, #4]
        rsb     r11, r10, r11
        ldr     r2, [r9, +r11, lsl #2]
        mov     r4, r0
        mov     r0, r1
        mvn     r11, #2
        mov     r1, r2
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r2, [r7, #8]
        rsb     r11, r10, r11
        ldr     r1, [r9, +r11, lsl #2]
        mov     r4, r0
        mov     r0, r2
        mvn     r3, #3
        rsb     r11, r10, r3
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r1, [r7, #0xC]
        ldr     r11, [r9, +r11, lsl #2]
        mov     r4, r0
        mov     r0, r1
        add     r7, r7, #0x14
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        add     r10, r10, #5
        cmp     r10, r5
        mov     r4, r0
        ble     LCXH10
        ldr     r11, [sp, #0x14]
        ldr     lr, [sp, #0x10]
        ldr     r12, [sp, #0xC]
        ldr     r2, [sp, #4]
        ldr     r5, [sp, #0x18]
        ldr     r0, [sp]
LCXH11:
        add     r7, r0, r10, lsl #2
        str     lr, [sp, #0x10]
        str     r12, [sp, #0xC]
        str     r2, [sp, #4]
        str     r0, [sp]
LCXH12:
        ldr     r0, [r7], #4
        rsb     r2, r10, #0
        ldr     r1, [r9, +r2, lsl #2]
        add     r10, r10, #1
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        cmp     r10, r5
        mov     r4, r0
        blt     LCXH12
        ldr     lr, [sp, #0x10]
        ldr     r12, [sp, #0xC]
        ldr     r2, [sp, #4]
        ldr     r0, [sp]
LCXH13:
        add     r11, r11, #1
        cmp     r11, lr
        str     r4, [r8, +r12]
        blt     LCXH9
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LCXH14:
        cmp     lr, #0
        ble     LCXH19
        ldr     r4, [pc, #0xB30]
        mov     r1, #0
        ldr     r3, [r4]
LCXH15:
        cmp     r5, #0
        mov     r4, r3
        movle   r11, r1, lsl #2
        ble     LCXH18
        mov     r11, r1, lsl #2
        mov     r10, #0
        add     r9, r11, r2
        mov     r8, r0
        str     r3, [sp, #8]
        str     r1, [sp, #0x14]
        str     lr, [sp, #0x10]
        str     r12, [sp, #0xC]
        str     r2, [sp, #4]
        str     r0, [sp]
LCXH16:
        subs    r2, r7, r10
        bmi     LCXH17
        cmp     r2, r6
        bge     LCXH17
        ldr     r0, [r8]
        rsb     r2, r10, #0
        ldr     r1, [r9, +r2, lsl #2]
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        mov     r4, r0
LCXH17:
        add     r10, r10, #1
        cmp     r10, r5
        add     r8, r8, #4
        blt     LCXH16
        ldr     r3, [sp, #8]
        ldr     r1, [sp, #0x14]
        ldr     lr, [sp, #0x10]
        ldr     r12, [sp, #0xC]
        ldr     r2, [sp, #4]
        ldr     r0, [sp]
LCXH18:
        add     r1, r1, #1
        cmp     r1, lr
        str     r4, [r11, +r12]
        add     r7, r7, #1
        blt     LCXH15
LCXH19:
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LCXH20:
        mov     r8, r11, lsl #2
        mov     r10, #0
        add     r9, r8, r2
        b       LCXH5
LCXH21:
        mov     r8, r11, lsl #2
        mov     r10, #0
        add     r9, r8, r2
        b       LCXH11
LCXH22:
        cmp     r5, #0x3C
        bne     LCXH0
        cmp     lr, #0x3C
        bne     LCXH1
        cmp     r7, #0
        bne     LCXH2
        ldr     r1, [pc, #0xA40]
        mov     r11, #0
        mov     r10, r12
        ldr     r5, [r1]
LCXH23:
        cmp     r11, #0
        mov     r4, r5
        movlt   r6, r11, lsl #2
        blt     LCXH27
        cmp     r11, #6
        blt     LCXH28
        mov     r6, r11, lsl #2
        sub     r1, r11, #6
        str     r10, [sp, #0xC]
        mov     r8, #0
        add     r7, r6, r2
        add     r9, r0, #4
        str     r11, [sp, #0x18]
        str     r2, [sp, #4]
        str     r0, [sp]
        mov     r10, r1
LCXH24:
        ldr     r0, [r9, #-4]
        rsb     r2, r8, #0
        ldr     r1, [r7, +r2, lsl #2]
        mvn     r2, #0
        rsb     r11, r8, r2
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r1, [r7, +r11, lsl #2]
        mov     r4, r0
        ldr     r0, [r9]
        mvn     r2, #1
        rsb     r11, r8, r2
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r1, [r7, +r11, lsl #2]
        mov     r4, r0
        ldr     r0, [r9, #4]
        mvn     r2, #2
        rsb     r11, r8, r2
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r1, [r7, +r11, lsl #2]
        mov     r4, r0
        ldr     r0, [r9, #8]
        mvn     r2, #3
        rsb     r11, r8, r2
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r1, [r7, +r11, lsl #2]
        mov     r4, r0
        ldr     r0, [r9, #0xC]
        add     r8, r8, #5
        add     r9, r9, #0x14
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        cmp     r8, r10
        mov     r4, r0
        ble     LCXH24
        ldr     r11, [sp, #0x18]
        ldr     r10, [sp, #0xC]
        ldr     r2, [sp, #4]
        ldr     r0, [sp]
LCXH25:
        add     r9, r0, r8, lsl #2
        str     r2, [sp, #4]
        str     r0, [sp]
LCXH26:
        ldr     r0, [r9], #4
        rsb     r2, r8, #0
        ldr     r1, [r7, +r2, lsl #2]
        add     r8, r8, #1
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        cmp     r8, r11
        mov     r4, r0
        ble     LCXH26
        ldr     r2, [sp, #4]
        ldr     r0, [sp]
LCXH27:
        add     r11, r11, #1
        cmp     r11, #0x3C
        str     r4, [r6, +r10]
        blt     LCXH23
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LCXH28:
        mov     r6, r11, lsl #2
        mov     r8, #0
        add     r7, r6, r2
        b       LCXH25
LCXH29:
        cmp     r5, #0x28
        bne     LCXH0
        cmp     lr, #0x28
        bne     LCXH1
        cmp     r7, #0
        bne     LCXH2
        ldr     r1, [pc, #0x8B4]
        mov     r11, #0
        mov     r10, r12
        ldr     r5, [r1]
LCXH30:
        cmp     r11, #0
        mov     r4, r5
        movlt   r6, r11, lsl #2
        blt     LCXH34
        cmp     r11, #6
        blt     LCXH35
        mov     r6, r11, lsl #2
        sub     r1, r11, #6
        str     r10, [sp, #0xC]
        mov     r8, #0
        add     r7, r6, r2
        add     r9, r0, #4
        str     r11, [sp, #8]
        str     r2, [sp, #4]
        str     r0, [sp]
        mov     r10, r1
LCXH31:
        ldr     r0, [r9, #-4]
        rsb     r2, r8, #0
        ldr     r1, [r7, +r2, lsl #2]
        mvn     r2, #0
        rsb     r11, r8, r2
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r1, [r7, +r11, lsl #2]
        mov     r4, r0
        ldr     r0, [r9]
        mvn     r2, #1
        rsb     r11, r8, r2
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r1, [r7, +r11, lsl #2]
        mov     r4, r0
        ldr     r0, [r9, #4]
        mvn     r2, #2
        rsb     r11, r8, r2
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r1, [r7, +r11, lsl #2]
        mov     r4, r0
        ldr     r0, [r9, #8]
        mvn     r2, #3
        rsb     r11, r8, r2
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r1, [r7, +r11, lsl #2]
        mov     r4, r0
        ldr     r0, [r9, #0xC]
        add     r8, r8, #5
        add     r9, r9, #0x14
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        cmp     r8, r10
        mov     r4, r0
        ble     LCXH31
        ldr     r11, [sp, #8]
        ldr     r10, [sp, #0xC]
        ldr     r2, [sp, #4]
        ldr     r0, [sp]
LCXH32:
        add     r9, r0, r8, lsl #2
        str     r2, [sp, #4]
        str     r0, [sp]
LCXH33:
        ldr     r0, [r9], #4
        rsb     r2, r8, #0
        ldr     r1, [r7, +r2, lsl #2]
        add     r8, r8, #1
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        cmp     r8, r11
        mov     r4, r0
        ble     LCXH33
        ldr     r2, [sp, #4]
        ldr     r0, [sp]
LCXH34:
        add     r11, r11, #1
        cmp     r11, #0x28
        str     r4, [r6, +r10]
        blt     LCXH30
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LCXH35:
        mov     r6, r11, lsl #2
        mov     r8, #0
        add     r7, r6, r2
        b       LCXH32
LCXH36:
        cmp     r5, #0x1F
        bne     LCXH0
        cmp     lr, #0x50
        bne     LCXH1
        cmp     r7, #0x1E
        bne     LCXH2
        ldr     r1, [pc, #0x728]
        sub     r5, r2, #0x7C
        mov     r6, #0x50
        ldr     r4, [r1]
        mov     r7, r0
        mov     r10, r12
LCXH37:
        ldr     r1, [r5, #0x7C]
        ldr     r0, [r7]
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r2, [r7, #4]
        ldr     r1, [r5, #0x78]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r5, #0x74]
        ldr     r2, [r7, #8]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r5, #0x70]
        ldr     r2, [r7, #0xC]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r5, #0x6C]
        ldr     r2, [r7, #0x10]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [r7, #0x14]
        ldr     r1, [r5, #0x68]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r5, #0x64]
        ldr     r2, [r7, #0x18]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r5, #0x60]
        ldr     r2, [r7, #0x1C]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r5, #0x5C]
        ldr     r2, [r7, #0x20]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r5, #0x58]
        ldr     r2, [r7, #0x24]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [r7, #0x28]
        ldr     r1, [r5, #0x54]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r5, #0x50]
        ldr     r2, [r7, #0x2C]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r5, #0x4C]
        ldr     r2, [r7, #0x30]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r5, #0x48]
        ldr     r2, [r7, #0x34]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r5, #0x44]
        ldr     r2, [r7, #0x38]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r5, #0x40]
        ldr     r2, [r7, #0x3C]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r5, #0x3C]
        ldr     r2, [r7, #0x40]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r5, #0x38]
        ldr     r2, [r7, #0x44]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r5, #0x34]
        ldr     r2, [r7, #0x48]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r5, #0x30]
        ldr     r2, [r7, #0x4C]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r5, #0x2C]
        ldr     r2, [r7, #0x50]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [r7, #0x54]
        ldr     r1, [r5, #0x28]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [r7, #0x58]
        ldr     r1, [r5, #0x24]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r5, #0x20]
        ldr     r2, [r7, #0x5C]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r5, #0x1C]
        ldr     r2, [r7, #0x60]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r5, #0x18]
        ldr     r2, [r7, #0x64]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r5, #0x14]
        ldr     r2, [r7, #0x68]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [r7, #0x6C]
        ldr     r1, [r5, #0x10]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [r7, #0x70]
        ldr     r1, [r5, #0xC]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r5, #8]
        ldr     r2, [r7, #0x74]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r5, #4]!
        ldr     r2, [r7, #0x78]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        str     r0, [r10], #4
        subs    r6, r6, #1
        bne     LCXH37
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LCXH38:
        cmp     r5, #0x1F
        bne     LCXH0
        cmp     lr, #0x28
        bne     LCXH1
        cmp     r7, #0x1E
        bne     LCXH2
        ldr     r1, [pc, #0x384]
        sub     r6, r2, #0x7C
        mov     r7, r0
        ldr     r5, [r1]
        mov     r10, r12
LCXH39:
        ldr     r1, [r6, #0x7C]
        ldr     r0, [r7]
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r2, [r7, #4]
        ldr     r1, [r6, #0x78]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r6, #0x74]
        ldr     r2, [r7, #8]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r6, #0x70]
        ldr     r2, [r7, #0xC]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r6, #0x6C]
        ldr     r2, [r7, #0x10]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [r7, #0x14]
        ldr     r1, [r6, #0x68]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r6, #0x64]
        ldr     r2, [r7, #0x18]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r6, #0x60]
        ldr     r2, [r7, #0x1C]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r6, #0x5C]
        ldr     r2, [r7, #0x20]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r6, #0x58]
        ldr     r2, [r7, #0x24]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [r7, #0x28]
        ldr     r1, [r6, #0x54]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r6, #0x50]
        ldr     r2, [r7, #0x2C]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r6, #0x4C]
        ldr     r2, [r7, #0x30]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r6, #0x48]
        ldr     r2, [r7, #0x34]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r6, #0x44]
        ldr     r2, [r7, #0x38]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r6, #0x40]
        ldr     r2, [r7, #0x3C]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r6, #0x3C]
        ldr     r2, [r7, #0x40]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r6, #0x38]
        ldr     r2, [r7, #0x44]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r6, #0x34]
        ldr     r2, [r7, #0x48]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r6, #0x30]
        ldr     r2, [r7, #0x4C]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r6, #0x2C]
        ldr     r2, [r7, #0x50]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [r7, #0x54]
        ldr     r1, [r6, #0x28]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [r7, #0x58]
        ldr     r1, [r6, #0x24]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r6, #0x20]
        ldr     r2, [r7, #0x5C]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r6, #0x1C]
        ldr     r2, [r7, #0x60]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r6, #0x18]
        ldr     r2, [r7, #0x64]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r6, #0x14]
        ldr     r2, [r7, #0x68]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [r7, #0x6C]
        ldr     r1, [r6, #0x10]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [r7, #0x70]
        ldr     r1, [r6, #0xC]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r6, #8]
        ldr     r2, [r7, #0x74]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r6, #4]!
        ldr     r2, [r7, #0x78]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        str     r0, [r10], #4
        subs    r4, r4, #1
        bne     LCXH39
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
        .long   0xea000000
        .long   LCXH__2il0floatpacket.1
LCXH40:
        cmp     r5, #0x10
        bne     LCXH0
        cmp     lr, #0x28
        bne     LCXH1
        cmp     r7, #0x10
        bne     LCXH2
        ldr     r1, [pc, #-0x24]
        sub     r6, r2, #0x40
        mov     r7, r0
        ldr     r5, [r1]
        mov     r10, r12
LCXH41:
        ldr     r1, [r6, #0x40]
        ldr     r0, [r7]
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r1, [r6, #0x3C]
        ldr     r2, [r7, #4]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r6, #0x38]
        ldr     r2, [r7, #8]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r6, #0x34]
        ldr     r2, [r7, #0xC]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r6, #0x30]
        ldr     r2, [r7, #0x10]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r6, #0x2C]
        ldr     r2, [r7, #0x14]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [r7, #0x18]
        ldr     r1, [r6, #0x28]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [r7, #0x1C]
        ldr     r1, [r6, #0x24]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r6, #0x20]
        ldr     r2, [r7, #0x20]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r6, #0x1C]
        ldr     r2, [r7, #0x24]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r6, #0x18]
        ldr     r2, [r7, #0x28]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r6, #0x14]
        ldr     r2, [r7, #0x2C]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [r7, #0x30]
        ldr     r1, [r6, #0x10]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [r7, #0x34]
        ldr     r1, [r6, #0xC]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r6, #8]
        ldr     r2, [r7, #0x38]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r6, #4]!
        ldr     r2, [r7, #0x3C]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        str     r0, [r10], #4
        subs    r4, r4, #1
        bne     LCXH41
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LCXH42:
        cmp     r5, #0xB
        bne     LCXH0
        cmp     lr, #0x28
        bne     LCXH1
        cmp     r7, #0xA
        bne     LCXH2
        ldr     r1, [pc, #-0x220]
        sub     r6, r2, #0x2C
        mov     r7, r0
        ldr     r5, [r1]
        mov     r10, r12
LCXH43:
        ldr     r1, [r6, #0x2C]
        ldr     r0, [r7]
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r2, [r7, #4]
        ldr     r1, [r6, #0x28]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [r7, #8]
        ldr     r1, [r6, #0x24]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r6, #0x20]
        ldr     r2, [r7, #0xC]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r6, #0x1C]
        ldr     r2, [r7, #0x10]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r6, #0x18]
        ldr     r2, [r7, #0x14]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r6, #0x14]
        ldr     r2, [r7, #0x18]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [r7, #0x1C]
        ldr     r1, [r6, #0x10]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [r7, #0x20]
        ldr     r1, [r6, #0xC]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r6, #8]
        ldr     r2, [r7, #0x24]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r6, #4]!
        ldr     r2, [r7, #0x28]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        str     r0, [r10], #4
        subs    r4, r4, #1
        bne     LCXH43
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LCXH44:
        cmp     r5, #4
        bne     LCXH0
        cmp     lr, #0x29
        bne     LCXH1
        cmp     r7, #4
        bne     LCXH2
        ldr     r1, [pc, #-0x390]
        sub     r5, r2, #0x10
        mov     r6, #0x29
        ldr     r4, [r1]
        mov     r7, r0
        mov     r10, r12
LCXH45:
        ldr     r1, [r5, #0x10]
        ldr     r0, [r7]
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r2, [r7, #4]
        ldr     r1, [r5, #0xC]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r5, #8]
        ldr     r2, [r7, #8]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r5, #4]!
        ldr     r2, [r7, #0xC]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        str     r0, [r10], #4
        subs    r6, r6, #1
        bne     LCXH45
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LCXH46:
        mvn     r0, #5
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LCXH47:
        mvn     r0, #7
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}


        .data
        .align  4


LCXH__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


