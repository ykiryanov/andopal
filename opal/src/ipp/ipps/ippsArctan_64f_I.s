        .text
        .align  4
        .globl  _ippsArctan_64f_I


_ippsArctan_64f_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x4A, 30
        ldr     r6, [pc, #0xD00]
        ldr     r7, [pc, #0xD00]
        ldr     r8, [pc, #0xD00]
        ldr     r9, [pc, #0xD00]
        ldr     r3, [pc, #0xD00]
        ldr     r12, [pc, #0xD00]
        ldr     r2, [pc, #0xD00]
        ldr     lr, [pc, #0xD00]
        ldr     r6, [r6]
        ldr     r7, [r7]
        ldr     r8, [r8]
        ldr     r9, [r9]
        ldr     r3, [r3]
        ldr     r12, [r12]
        ldr     r2, [r2]
        ldr     lr, [lr]
        mov     r4, r0
        cmp     r4, #0
        mov     r5, r1
        str     r6, [sp, #0x120]
        str     r7, [sp, #0x118]
        str     r8, [sp, #0x110]
        str     r9, [sp, #0x108]
        beq     LCZF70
        cmp     r5, #1
        blt     LCZF28
        ldr     r6, [pc, #0xCB8]
        mov     r8, #0xFF
        mov     r7, #0xFF, 12
        orr     r10, r8, #3, 24
        orr     r8, r7, #3, 4
        orr     r9, r7, #7, 4
        cmp     r5, #4
        mov     r7, #0
        bge     LCZF7
        cmp     r5, #0
        ble     LCZF6
        str     r3, [sp, #0x124]
        add     r9, r9, #2, 14
        mov     r2, r10, lsl #1
        str     r9, [sp, #0xC]
        str     r2, [sp, #4]
        str     r8, [sp]
        str     r10, [sp, #8]
LCZF0:
        ldr     r8, [r4]
        ldr     r9, [r4, #4]
        str     r8, [sp, #0x120]
        ldr     lr, [sp]
        str     r9, [sp, #0x124]
        add     lr, lr, #1, 2
        and     r12, r9, lr
        ldr     lr, [sp, #4]
        cmp     lr, r12, lsr #20
        mov     lr, r9, lsr #24
        and     lr, lr, #0x80
        mov     r7, lr, lsr #7
        bge     LCZF3
        mvn     r2, #0xFE, 14
        bic     r2, r2, #0x3F, 6
        bic     r2, r9, r2
        cmn     r2, #2, 14
        bne     LCZF1
        mov     r3, #0
        str     r3, [sp, #0x120]
        ldr     r2, [sp, #0x124]
        str     r3, [r4]
        str     r2, [r4, #4]
        b       LCZF5
LCZF1:
        ldr     r3, [sp, #0xC]
        cmp     r3, r2
        bne     LCZF2
        mov     r3, #0
        str     r3, [sp, #0x120]
        ldr     r2, [sp, #0x124]
        str     r3, [r4]
        str     r2, [r4, #4]
        b       LCZF5
LCZF2:
        add     r2, r6, r7, lsl #3
        ldr     r7, [r6, +r7, lsl #3]
        ldr     r2, [r2, #4]
        str     r7, [r4]
        str     r2, [r4, #4]
        b       LCZF5
LCZF3:
        ldr     lr, [sp, #8]
        cmp     lr, r12, lsr #20
        bgt     LCZF4
        mov     r2, r8
        mov     r3, r9
        mov     r12, #0xFF
        orr     r12, r12, #3, 24
        mov     r0, #0
        mov     r1, r12, lsl #20
        bl      __divdf3
        mov     r10, r0
        mov     r11, r1
        mov     r2, r10
        mov     r3, r11
        bl      __muldf3
        mov     r8, r0
        ldr     r0, [r6, +r7, lsl #3]
        mov     r9, r1
        add     r7, r6, r7, lsl #3
        ldr     r1, [r7, #4]
        mov     r2, r10
        mov     r3, r11
        bl      __subdf3
        ldr     r12, [r6, #0x38]
        str     r12, [sp, #0xF0]
        ldr     r12, [r6, #0x3C]
        str     r12, [sp, #0xEC]
        ldr     r12, [r6, #0x48]
        str     r12, [sp, #0xE8]
        ldr     r12, [r6, #0x4C]
        str     r12, [sp, #0xE4]
        ldr     r12, [r6, #0x18]
        str     r12, [sp, #0xE0]
        ldr     r7, [r6, #0x1C]
        ldr     r2, [r6, #0x10]
        ldr     r3, [r6, #0x14]
        ldr     r12, [r6, #0x40]
        str     r12, [sp, #0xDC]
        ldr     r12, [r6, #0x44]
        str     r12, [sp, #0xD8]
        ldr     r12, [r6, #0x30]
        str     r12, [sp, #0xD4]
        ldr     r12, [r6, #0x34]
        str     r12, [sp, #0xD0]
        ldr     r12, [r6, #0x28]
        str     r12, [sp, #0xCC]
        ldr     r12, [r6, #0x2C]
        str     r12, [sp, #0xC8]
        ldr     r12, [r6, #0x20]
        str     r12, [sp, #0xC4]
        ldr     r12, [r6, #0x24]
        str     r0, [sp, #0xBC]
        str     r1, [sp, #0xB8]
        mov     r0, r2
        str     r12, [sp, #0xC0]
        mov     r1, r3
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #0xE0]
        mov     r3, r7
        bl      __adddf3
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #0xC4]
        ldr     r3, [sp, #0xC0]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        ldr     r3, [sp, #0xC8]
        ldr     r2, [sp, #0xCC]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        ldr     r3, [sp, #0xD0]
        ldr     r2, [sp, #0xD4]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        ldr     r3, [sp, #0xEC]
        ldr     r2, [sp, #0xF0]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        ldr     r3, [sp, #0xD8]
        ldr     r2, [sp, #0xDC]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        ldr     r3, [sp, #0xE4]
        ldr     r2, [sp, #0xE8]
        bl      __adddf3
        mov     r2, r10
        mov     r3, r11
        bl      __muldf3
        ldr     r12, [r6, #0x80]
        str     r12, [sp, #0xF0]
        ldr     r12, [r6, #0x84]
        str     r12, [sp, #0xEC]
        ldr     r12, [r6, #0x60]
        str     r12, [sp, #0xE8]
        ldr     r12, [r6, #0x64]
        str     r12, [sp, #0xE4]
        ldr     r12, [r6, #0x78]
        str     r12, [sp, #0xE0]
        ldr     r12, [r6, #0x7C]
        str     r12, [sp, #0xDC]
        ldr     r12, [r6, #0x70]
        str     r12, [sp, #0xD8]
        ldr     r12, [r6, #0x74]
        str     r12, [sp, #0xD4]
        ldr     r12, [r6, #0x68]
        str     r12, [sp, #0xD0]
        ldr     r12, [r6, #0x6C]
        str     r12, [sp, #0xCC]
        ldr     r3, [r6, #0x50]
        ldr     r2, [r6, #0x54]
        ldr     r12, [r6, #0x88]
        str     r12, [sp, #0xC8]
        ldr     r7, [r6, #0x8C]
        ldr     r10, [r6, #0x58]
        ldr     r11, [r6, #0x5C]
        str     r0, [sp, #0xC4]
        str     r1, [sp, #0xC0]
        mov     r0, r3
        mov     r1, r2
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #0xE8]
        ldr     r3, [sp, #0xE4]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #0xD0]
        ldr     r3, [sp, #0xCC]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #0xD8]
        ldr     r3, [sp, #0xD4]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #0xE0]
        ldr     r3, [sp, #0xDC]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #0xF0]
        ldr     r3, [sp, #0xEC]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #0xC8]
        mov     r3, r7
        bl      __adddf3
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [sp, #0xC4]
        ldr     r1, [sp, #0xC0]
        bl      __divdf3
        ldr     r2, [sp, #0xBC]
        ldr     r3, [sp, #0xB8]
        bl      __adddf3
        str     r0, [r4]
        str     r1, [r4, #4]
        b       LCZF5
LCZF4:
        mov     r2, r8
        mov     r3, r9
        mov     r0, r8
        mov     r1, r9
        bl      __muldf3
        ldr     r2, [r6, #0x10]
        ldr     r3, [r6, #0x14]
        ldr     r12, [r6, #0x48]
        mov     r7, r0
        str     r12, [sp, #0xF0]
        ldr     r12, [r6, #0x40]
        ldr     r11, [r6, #0x4C]
        mov     r10, r1
        str     r12, [sp, #0xEC]
        ldr     r12, [r6, #0x44]
        str     r12, [sp, #0xE8]
        ldr     r12, [r6, #0x38]
        str     r12, [sp, #0xE4]
        ldr     r12, [r6, #0x3C]
        str     r12, [sp, #0xE0]
        ldr     r12, [r6, #0x30]
        str     r12, [sp, #0xDC]
        ldr     r12, [r6, #0x34]
        str     r12, [sp, #0xD8]
        ldr     r12, [r6, #0x28]
        str     r12, [sp, #0xD4]
        ldr     r12, [r6, #0x2C]
        str     r12, [sp, #0xD0]
        ldr     r12, [r6, #0x20]
        str     r12, [sp, #0xCC]
        ldr     r12, [r6, #0x24]
        str     r12, [sp, #0xC8]
        ldr     r12, [r6, #0x18]
        str     r12, [sp, #0xC4]
        ldr     r12, [r6, #0x1C]
        str     r12, [sp, #0xC0]
        bl      __muldf3
        ldr     r3, [sp, #0xC0]
        ldr     r2, [sp, #0xC4]
        bl      __adddf3
        mov     r2, r7
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0xCC]
        ldr     r3, [sp, #0xC8]
        bl      __adddf3
        mov     r2, r7
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0xD4]
        ldr     r3, [sp, #0xD0]
        bl      __adddf3
        mov     r2, r7
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0xDC]
        ldr     r3, [sp, #0xD8]
        bl      __adddf3
        mov     r2, r7
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0xE4]
        ldr     r3, [sp, #0xE0]
        bl      __adddf3
        mov     r2, r7
        mov     r3, r10
        bl      __muldf3
        ldr     r3, [sp, #0xE8]
        ldr     r2, [sp, #0xEC]
        bl      __adddf3
        mov     r2, r7
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0xF0]
        mov     r3, r11
        bl      __adddf3
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [r6, #0x88]
        ldr     lr, [r6, #0x50]
        ldr     r12, [r6, #0x54]
        str     r2, [sp, #0xF0]
        ldr     r2, [r6, #0x8C]
        mov     r3, r10
        mov     r11, r1
        mov     r1, r12
        str     r2, [sp, #0xEC]
        ldr     r2, [r6, #0x80]
        str     r2, [sp, #0xE8]
        ldr     r2, [r6, #0x84]
        str     r2, [sp, #0xE4]
        ldr     r2, [r6, #0x78]
        str     r2, [sp, #0xE0]
        ldr     r2, [r6, #0x7C]
        str     r2, [sp, #0xDC]
        ldr     r2, [r6, #0x70]
        str     r2, [sp, #0xD8]
        ldr     r2, [r6, #0x74]
        str     r2, [sp, #0xD4]
        ldr     r2, [r6, #0x68]
        str     r2, [sp, #0xD0]
        ldr     r2, [r6, #0x6C]
        str     r2, [sp, #0xCC]
        ldr     r2, [r6, #0x60]
        str     r2, [sp, #0xC8]
        ldr     r2, [r6, #0x64]
        str     r2, [sp, #0xC4]
        ldr     r2, [r6, #0x58]
        str     r2, [sp, #0xC0]
        ldr     r2, [r6, #0x5C]
        str     r0, [sp, #0xB8]
        mov     r0, lr
        str     r2, [sp, #0xBC]
        mov     r2, r7
        bl      __muldf3
        ldr     r2, [sp, #0xC0]
        ldr     r3, [sp, #0xBC]
        bl      __adddf3
        mov     r2, r7
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0xC8]
        ldr     r3, [sp, #0xC4]
        bl      __adddf3
        mov     r2, r7
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0xD0]
        ldr     r3, [sp, #0xCC]
        bl      __adddf3
        mov     r2, r7
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0xD8]
        ldr     r3, [sp, #0xD4]
        bl      __adddf3
        mov     r2, r7
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0xE0]
        ldr     r3, [sp, #0xDC]
        bl      __adddf3
        mov     r2, r7
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0xE8]
        ldr     r3, [sp, #0xE4]
        bl      __adddf3
        mov     r2, r7
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0xF0]
        ldr     r3, [sp, #0xEC]
        bl      __adddf3
        mov     r2, r0
        ldr     r0, [sp, #0xB8]
        mov     r3, r1
        mov     r1, r11
        bl      __divdf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r8
        mov     r1, r9
        bl      __subdf3
        str     r0, [r4]
        str     r1, [r4, #4]
LCZF5:
        subs    r5, r5, #1
        add     r4, r4, #8
        bne     LCZF0
LCZF6:
        mov     r0, #0
        add     sp, sp, #0x4A, 30
        ldmia   sp!, {r4 - r11, pc}
LCZF7:
        subs    r5, r5, #1
        str     r2, [sp, #0x114]
        str     r12, [sp, #0x11C]
        str     r3, [sp, #0x124]
        movmi   r1, #0
        bmi     LCZF12
        mov     r10, r10, lsl #1
        add     r9, r9, #2, 14
        add     r11, r4, r5, lsl #3
        str     r12, [sp, #0xC]
        str     r4, [sp, #0x10]
LCZF8:
        ldr     r3, [r11, #4]
        ldr     r4, [r11]
        add     r0, r8, #1, 2
        mov     r12, r3, lsr #24
        and     r0, r3, r0
        str     r4, [sp, #0x120]
        and     r12, r12, #0x80
        cmp     r10, r0, lsr #20
        str     r3, [sp, #0x124]
        mov     r1, r12, lsr #7
        bge     LCZF69
        mov     r0, #0xFE, 18
        orr     r0, r0, #0x3F, 10
        and     r0, r3, r0
        cmn     r0, #2, 14
        bne     LCZF9
        str     r7, [sp, #0x120]
        ldr     r0, [sp, #0x124]
        str     r7, [r11]
        str     r0, [r11, #4]
        b       LCZF11
LCZF9:
        mvn     r0, #0xFE, 14
        bic     r0, r0, #0x3F, 6
        bic     r0, r3, r0
        cmp     r9, r0
        bne     LCZF10
        str     r7, [sp, #0x120]
        ldr     r0, [sp, #0x124]
        str     r7, [r11]
        str     r0, [r11, #4]
        b       LCZF11
LCZF10:
        add     r12, r6, r1, lsl #3
        ldr     r0, [r6, +r1, lsl #3]
        ldr     r12, [r12, #4]
        str     r0, [r11]
        str     r12, [r11, #4]
LCZF11:
        subs    r5, r5, #1
        sub     r11, r11, #8
        bpl     LCZF8
        ldr     r12, [sp, #0xC]
        ldr     r4, [sp, #0x10]
LCZF12:
        subs    r7, r5, #1
        mov     r0, #0
        movmi   r9, #0
        bmi     LCZF17
        ldr     r11, [pc, #0x55C]
        mov     r6, #0xFF, 12
        mov     r12, #0xFF
        orr     r6, r6, #7, 4
        orr     r12, r12, #3, 24
        add     r6, r6, #2, 14
        add     r10, r4, r7, lsl #3
        mov     r8, r12, lsl #1
        str     r2, [sp, #0x14]
        str     r3, [sp, #4]
        str     r4, [sp, #0x10]
LCZF13:
        ldr     r12, [r10, #4]
        ldr     r4, [r10]
        mov     r2, #0xFF, 12
        orr     r2, r2, #3, 4
        add     r2, r2, #1, 2
        mov     r3, r12, lsr #24
        str     r4, [sp, #0x118]
        and     r2, r12, r2
        and     r3, r3, #0x80
        cmp     r8, r2, lsr #20
        str     r12, [sp, #0x11C]
        mov     r9, r3, lsr #7
        bge     LCZF68
        mvn     r2, #0xFE, 14
        bic     r2, r2, #0x3F, 6
        bic     r2, r12, r2
        cmn     r2, #2, 14
        bne     LCZF14
        str     r0, [sp, #0x118]
        ldr     r2, [sp, #0x11C]
        str     r0, [r10]
        str     r2, [r10, #4]
        b       LCZF16
LCZF14:
        cmp     r6, r2
        bne     LCZF15
        str     r0, [sp, #0x118]
        ldr     r2, [sp, #0x11C]
        str     r0, [r10]
        str     r2, [r10, #4]
        b       LCZF16
LCZF15:
        add     r3, r11, r9, lsl #3
        ldr     r2, [r11, +r9, lsl #3]
        ldr     r3, [r3, #4]
        str     r2, [r10]
        str     r3, [r10, #4]
LCZF16:
        subs    r7, r7, #1
        sub     r10, r10, #8
        bpl     LCZF13
        ldr     r2, [sp, #0x14]
        ldr     r3, [sp, #4]
        ldr     r4, [sp, #0x10]
LCZF17:
        subs    r6, r7, #1
        mov     r10, #0
        movmi   r8, #0
        bmi     LCZF22
        ldr     r8, [pc, #0x47C]
        mov     r2, #0xFF
        mov     r11, #0xFF, 12
        orr     r2, r2, #3, 24
        orr     r11, r11, #7, 4
        add     r11, r11, #2, 14
        mov     r0, r2, lsl #1
        add     r2, r4, r6, lsl #3
        str     r5, [sp, #0x1C]
        str     lr, [sp, #0x18]
        str     r12, [sp, #0xC]
        str     r3, [sp, #4]
        str     r4, [sp, #0x10]
LCZF18:
        ldr     r3, [r2, #4]
        ldr     r4, [r2]
        mov     r12, #0xFF, 12
        orr     r12, r12, #3, 4
        add     r12, r12, #1, 2
        mov     lr, r3, lsr #24
        str     r4, [sp, #0x110]
        and     r12, r3, r12
        and     lr, lr, #0x80
        cmp     r0, r12, lsr #20
        str     r3, [sp, #0x114]
        mov     r4, lr, lsr #7
        bge     LCZF67
        mvn     r12, #0xFE, 14
        bic     r12, r12, #0x3F, 6
        bic     r12, r3, r12
        cmn     r12, #2, 14
        bne     LCZF19
        str     r10, [sp, #0x110]
        ldr     r12, [sp, #0x114]
        str     r10, [r2]
        str     r12, [r2, #4]
        b       LCZF21
LCZF19:
        cmp     r11, r12
        bne     LCZF20
        str     r10, [sp, #0x110]
        ldr     r12, [sp, #0x114]
        str     r10, [r2]
        str     r12, [r2, #4]
        b       LCZF21
LCZF20:
        add     lr, r8, r4, lsl #3
        ldr     r12, [r8, +r4, lsl #3]
        ldr     lr, [lr, #4]
        str     r12, [r2]
        str     lr, [r2, #4]
LCZF21:
        subs    r6, r6, #1
        sub     r2, r2, #8
        bpl     LCZF18
        mov     r2, r3
        mov     r8, r4
        ldr     r5, [sp, #0x1C]
        ldr     lr, [sp, #0x18]
        ldr     r12, [sp, #0xC]
        ldr     r3, [sp, #4]
        ldr     r4, [sp, #0x10]
LCZF22:
        subs    r10, r6, #1
        bmi     LCZF27
        str     lr, [sp, #0x10C]
        mov     lr, #0xFF, 12
        add     r0, r4, r10, lsl #3
        str     r4, [sp, #0x10]
        ldr     r4, [pc, #0x37C]
        orr     lr, lr, #7, 4
        mov     r11, #0xFF
        str     r5, [sp, #0x1C]
        add     lr, lr, #2, 14
        orr     r11, r11, #3, 24
        str     r6, [sp]
        str     r7, [sp, #8]
        str     r2, [sp, #0x14]
        str     r12, [sp, #0xC]
        str     r3, [sp, #4]
        mov     r5, #0
LCZF23:
        ldr     r3, [r0, #4]
        ldr     r12, [r0]
        mov     r7, #0xFF, 12
        orr     r7, r7, #3, 4
        add     r7, r7, #1, 2
        and     r7, r3, r7
        mov     r6, r3, lsr #24
        str     r12, [sp, #0x108]
        mov     r7, r7, lsr #20
        and     r6, r6, #0x80
        cmp     r7, r11, lsl #1
        str     r3, [sp, #0x10C]
        mov     r2, r6, lsr #7
        ble     LCZF29
        mvn     r12, #0xFE, 14
        bic     r12, r12, #0x3F, 6
        bic     r12, r3, r12
        cmn     r12, #2, 14
        bne     LCZF24
        str     r5, [sp, #0x108]
        ldr     r2, [sp, #0x10C]
        str     r5, [r0]
        str     r2, [r0, #4]
        b       LCZF26
LCZF24:
        cmp     lr, r12
        bne     LCZF25
        str     r5, [sp, #0x108]
        ldr     r2, [sp, #0x10C]
        str     r5, [r0]
        str     r2, [r0, #4]
        b       LCZF26
LCZF25:
        add     r3, r4, r2, lsl #3
        ldr     r2, [r4, +r2, lsl #3]
        ldr     r3, [r3, #4]
        str     r2, [r0]
        str     r3, [r0, #4]
LCZF26:
        subs    r10, r10, #1
        sub     r0, r0, #8
        bpl     LCZF23
        ldr     r6, [sp]
        ldr     r7, [sp, #8]
        ldr     r5, [sp, #0x1C]
        ldr     r4, [sp, #0x10]
LCZF27:
        cmp     r5, #0
        blt     LCZF6
        ldr     r0, [sp, #0x120]
        ldr     r1, [sp, #0x124]
        add     r8, r4, r5, lsl #3
        bl      atan
        str     r0, [r4, +r5, lsl #3]
        cmp     r7, #0
        str     r1, [r8, #4]
        blt     LCZF6
        ldr     r0, [sp, #0x118]
        ldr     r1, [sp, #0x11C]
        add     r5, r4, r7, lsl #3
        bl      atan
        str     r0, [r4, +r7, lsl #3]
        cmp     r6, #0
        str     r1, [r5, #4]
        blt     LCZF6
        ldr     r0, [sp, #0x110]
        ldr     r1, [sp, #0x114]
        add     r5, r4, r6, lsl #3
        bl      atan
        str     r0, [r4, +r6, lsl #3]
        mov     r0, #0
        str     r1, [r5, #4]
        add     sp, sp, #0x4A, 30
        ldmia   sp!, {r4 - r11, pc}
LCZF28:
        mvn     r0, #5
        add     sp, sp, #0x4A, 30
        ldmia   sp!, {r4 - r11, pc}
LCZF29:
        ldr     r0, [sp, #0x11C]
        ldr     r6, [sp]
        ldr     r5, [sp, #0x1C]
        ldr     r4, [sp, #0x10]
        ldr     r11, [sp, #0x120]
        mov     lr, #0xFF, 12
        orr     lr, lr, #3, 4
        str     r0, [sp, #0x34]
        ldr     r0, [sp, #0x110]
        str     r3, [sp, #0x20]
        ldr     r3, [sp, #4]
        str     r12, [sp, #0x18]
        ldr     r12, [sp, #0xC]
        str     r2, [sp, #0x24]
        ldr     r2, [sp, #0x14]
        str     r11, [sp, #0x3C]
        ldr     r11, [sp, #0x124]
        str     r0, [sp, #0x2C]
        ldr     r0, [sp, #0x114]
        add     lr, lr, #1, 2
        and     r3, r3, lr
        and     r12, r12, lr
        and     lr, r2, lr
        str     r7, [sp, #0x28]
        ldr     r7, [sp, #8]
        str     r11, [sp, #0x30]
        ldr     r11, [sp, #0x118]
        str     r0, [sp, #0x38]
        mov     r2, #0xFF, 12
        mov     r0, lr, lsr #20
        orr     r2, r2, #7, 4
        mov     lr, #0xFF
        mov     r3, r3, lsr #20
        mov     r12, r12, lsr #20
        orr     lr, lr, #3, 24
        add     r2, r2, #2, 14
        str     r1, [sp, #0x48]
        str     r9, [sp, #0x4C]
        str     r8, [sp, #0x50]
        str     r2, [sp, #0x44]
        str     lr, [sp, #0xE0]
        str     r11, [sp, #0x60]
        str     r0, [sp, #0x58]
        str     r12, [sp, #0x5C]
        str     r3, [sp, #0x54]
        str     r6, [sp]
        str     r7, [sp, #8]
        str     r5, [sp, #0x1C]
        str     r10, [sp, #0xA4]
        str     r4, [sp, #0x10]
LCZF30:
        ldr     r1, [sp, #0x54]
        ldr     r0, [sp, #0xE0]
        cmp     r0, r1
        bgt     LCZF31
        ldr     r2, [sp, #0x3C]
        ldr     r3, [sp, #0x30]
        mov     r0, #0xFF
        orr     r1, r0, #3, 24
        mov     r0, #0
        mov     r1, r1, lsl #20
        bl      __divdf3
        str     r0, [sp, #0xC0]
        mov     r0, #1
        str     r1, [sp, #0xC4]
        str     r0, [sp, #0x70]
        b       LCZF32
LCZF31:
        ldr     r0, [sp, #0x3C]
        str     r0, [sp, #0xC0]
        ldr     r0, [sp, #0x30]
        str     r0, [sp, #0xC4]
        mov     r0, #0
        str     r0, [sp, #0x70]
LCZF32:
        ldr     r1, [sp, #0x5C]
        ldr     r0, [sp, #0xE0]
        cmp     r0, r1
        bgt     LCZF33
        ldr     r2, [sp, #0x60]
        ldr     r3, [sp, #0x34]
        mov     r0, #0xFF
        orr     r1, r0, #3, 24
        mov     r0, #0
        mov     r1, r1, lsl #20
        bl      __divdf3
        str     r0, [sp, #0xB8]
        mov     r0, #1
        str     r1, [sp, #0xBC]
        str     r0, [sp, #0x6C]
        b       LCZF34
LCZF33:
        ldr     r0, [sp, #0x60]
        str     r0, [sp, #0xB8]
        ldr     r0, [sp, #0x34]
        str     r0, [sp, #0xBC]
        mov     r0, #0
        str     r0, [sp, #0x6C]
LCZF34:
        ldr     r1, [sp, #0x58]
        ldr     r0, [sp, #0xE0]
        cmp     r0, r1
        bgt     LCZF35
        ldr     r2, [sp, #0x2C]
        ldr     r3, [sp, #0x38]
        mov     r0, #0xFF
        orr     r1, r0, #3, 24
        mov     r0, #0
        mov     r1, r1, lsl #20
        bl      __divdf3
        str     r0, [sp, #0xB4]
        mov     r0, #1
        str     r1, [sp, #0xB0]
        str     r0, [sp, #0x64]
        b       LCZF36
LCZF35:
        ldr     r0, [sp, #0x2C]
        str     r0, [sp, #0xB4]
        ldr     r0, [sp, #0x38]
        str     r0, [sp, #0xB0]
        mov     r0, #0
        str     r0, [sp, #0x64]
LCZF36:
        ldr     r1, [sp, #0x28]
        ldr     r0, [sp, #0xE0]
        cmp     r0, r1
        bgt     LCZF37
        ldr     r2, [sp, #0x18]
        ldr     r3, [sp, #0x20]
        mov     r0, #0xFF
        orr     r1, r0, #3, 24
        mov     r0, #0
        mov     r1, r1, lsl #20
        bl      __divdf3
        str     r0, [sp, #0xA8]
        mov     r0, #1
        str     r1, [sp, #0xAC]
        str     r0, [sp, #0x68]
        b       LCZF38
        .long   LCZF_x1.3620.0.0.0
        .long   LCZF_x2.3620.0.0.0
        .long   LCZF_x3.3620.0.0.0
        .long   LCZF_x4.3620.0.0.0
        .long   LCZF_x1.3620.0.0.0
        .long   LCZF_x2.3620.0.0.0
        .long   LCZF_x3.3620.0.0.0
        .long   LCZF_x4.3620.0.0.0
        .long   LCZF_pi_2d
LCZF37:
        ldr     r0, [sp, #0x18]
        str     r0, [sp, #0xA8]
        ldr     r0, [sp, #0x20]
        str     r0, [sp, #0xAC]
        mov     r0, #0
        str     r0, [sp, #0x68]
LCZF38:
        ldr     r2, [sp, #0xC0]
        ldr     r3, [sp, #0xC4]
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        ldr     r2, [sp, #0xB8]
        ldr     r3, [sp, #0xBC]
        mov     r5, r0
        mov     r4, r1
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        ldr     r2, [sp, #0xB4]
        ldr     r3, [sp, #0xB0]
        mov     r8, r0
        mov     r9, r1
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        str     r0, [sp, #0xF0]
        mov     r10, r1
        ldr     r0, [sp, #0xA8]
        ldr     r1, [sp, #0xAC]
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        ldr     r11, [pc, #-0x8C]
        mov     r6, r0
        mov     r7, r1
        mov     r2, r5
        ldr     r12, [r11, #0x10]
        mov     r3, r4
        str     r12, [sp, #0xEC]
        ldr     r12, [r11, #0x14]
        ldr     r0, [sp, #0xEC]
        str     r12, [sp, #0xE8]
        ldr     r12, [r11, #0x28]
        ldr     r1, [sp, #0xE8]
        str     r12, [sp, #0xE4]
        ldr     r12, [r11, #0x2C]
        str     r12, [sp, #0xDC]
        ldr     r12, [r11, #0x48]
        str     r12, [sp, #0xD8]
        ldr     r12, [r11, #0x4C]
        str     r12, [sp, #0xD4]
        ldr     r12, [r11, #0x40]
        str     r12, [sp, #0xD0]
        ldr     r12, [r11, #0x44]
        str     r12, [sp, #0xCC]
        ldr     r12, [r11, #0x38]
        str     r12, [sp, #0xC8]
        ldr     r12, [r11, #0x3C]
        str     r12, [sp, #0xA0]
        ldr     r12, [r11, #0x30]
        str     r12, [sp, #0x9C]
        ldr     r12, [r11, #0x34]
        str     r12, [sp, #0x98]
        ldr     r12, [r11, #0x20]
        str     r12, [sp, #0x94]
        ldr     r12, [r11, #0x24]
        str     r12, [sp, #0x88]
        ldr     r12, [r11, #0x18]
        str     r12, [sp, #0x7C]
        ldr     r12, [r11, #0x1C]
        str     r12, [sp, #0x40]
        bl      __muldf3
        ldr     r3, [sp, #0x40]
        ldr     r2, [sp, #0x7C]
        bl      __adddf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [sp, #0x94]
        ldr     r3, [sp, #0x88]
        bl      __adddf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [sp, #0xE4]
        ldr     r3, [sp, #0xDC]
        bl      __adddf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r3, [sp, #0x98]
        ldr     r2, [sp, #0x9C]
        bl      __adddf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [sp, #0xC8]
        ldr     r3, [sp, #0xA0]
        bl      __adddf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [sp, #0xD0]
        ldr     r3, [sp, #0xCC]
        bl      __adddf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [sp, #0xD8]
        ldr     r3, [sp, #0xD4]
        bl      __adddf3
        ldr     r2, [sp, #0xC0]
        ldr     r3, [sp, #0xC4]
        bl      __muldf3
        str     r0, [sp, #0x74]
        ldr     r0, [sp, #0xEC]
        str     r1, [sp, #0x78]
        ldr     r1, [sp, #0xE8]
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #0x7C]
        ldr     r3, [sp, #0x40]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #0x94]
        ldr     r3, [sp, #0x88]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #0xE4]
        ldr     r3, [sp, #0xDC]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #0x9C]
        ldr     r3, [sp, #0x98]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        ldr     r3, [sp, #0xA0]
        ldr     r2, [sp, #0xC8]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #0xD0]
        ldr     r3, [sp, #0xCC]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #0xD8]
        ldr     r3, [sp, #0xD4]
        bl      __adddf3
        ldr     r2, [sp, #0xB8]
        ldr     r3, [sp, #0xBC]
        bl      __muldf3
        ldr     r2, [sp, #0xF0]
        str     r0, [sp, #0x84]
        ldr     r0, [sp, #0xEC]
        str     r1, [sp, #0x80]
        ldr     r1, [sp, #0xE8]
        mov     r3, r10
        bl      __muldf3
        ldr     r3, [sp, #0x40]
        ldr     r2, [sp, #0x7C]
        bl      __adddf3
        ldr     r2, [sp, #0xF0]
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0x94]
        ldr     r3, [sp, #0x88]
        bl      __adddf3
        ldr     r2, [sp, #0xF0]
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0xE4]
        ldr     r3, [sp, #0xDC]
        bl      __adddf3
        ldr     r2, [sp, #0xF0]
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0x9C]
        ldr     r3, [sp, #0x98]
        bl      __adddf3
        ldr     r2, [sp, #0xF0]
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0xC8]
        ldr     r3, [sp, #0xA0]
        bl      __adddf3
        ldr     r2, [sp, #0xF0]
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0xD0]
        ldr     r3, [sp, #0xCC]
        bl      __adddf3
        ldr     r2, [sp, #0xF0]
        mov     r3, r10
        bl      __muldf3
        ldr     r3, [sp, #0xD4]
        ldr     r2, [sp, #0xD8]
        bl      __adddf3
        ldr     r2, [sp, #0xB4]
        ldr     r3, [sp, #0xB0]
        bl      __muldf3
        str     r0, [sp, #0x8C]
        ldr     r0, [sp, #0xEC]
        str     r1, [sp, #0x90]
        ldr     r1, [sp, #0xE8]
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        ldr     r3, [sp, #0x40]
        ldr     r2, [sp, #0x7C]
        bl      __adddf3
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        ldr     r2, [sp, #0x94]
        ldr     r3, [sp, #0x88]
        bl      __adddf3
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        ldr     r2, [sp, #0xE4]
        ldr     r3, [sp, #0xDC]
        bl      __adddf3
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        ldr     r2, [sp, #0x9C]
        ldr     r3, [sp, #0x98]
        bl      __adddf3
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        ldr     r2, [sp, #0xC8]
        ldr     r3, [sp, #0xA0]
        bl      __adddf3
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        ldr     r2, [sp, #0xD0]
        ldr     r3, [sp, #0xCC]
        bl      __adddf3
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        ldr     r3, [sp, #0xD4]
        ldr     r2, [sp, #0xD8]
        bl      __adddf3
        ldr     r2, [sp, #0xA8]
        ldr     r3, [sp, #0xAC]
        bl      __muldf3
        ldr     r12, [r11, #0x50]
        mov     r2, r5
        mov     r3, r4
        str     r12, [sp, #0xEC]
        ldr     r12, [r11, #0x54]
        str     r12, [sp, #0xD4]
        ldr     r12, [r11, #0x88]
        str     r12, [sp, #0xD0]
        ldr     r12, [r11, #0x8C]
        str     r12, [sp, #0xCC]
        ldr     r12, [r11, #0x80]
        str     r12, [sp, #0xC8]
        ldr     r12, [r11, #0x84]
        str     r12, [sp, #0x98]
        ldr     r12, [r11, #0x78]
        str     r12, [sp, #0x94]
        ldr     r12, [r11, #0x7C]
        str     r12, [sp, #0x88]
        ldr     r12, [r11, #0x70]
        str     r12, [sp, #0x7C]
        ldr     r12, [r11, #0x74]
        str     r12, [sp, #0x40]
        ldr     r12, [r11, #0x68]
        str     r12, [sp, #4]
        ldr     r12, [r11, #0x6C]
        str     r12, [sp, #0xF4]
        ldr     r12, [r11, #0x60]
        str     r12, [sp, #0xF8]
        ldr     r12, [r11, #0x64]
        str     r12, [sp, #0xFC]
        ldr     r12, [r11, #0x58]
        str     r12, [sp, #0x100]
        ldr     r11, [r11, #0x5C]
        str     r0, [sp, #0xA0]
        str     r1, [sp, #0x9C]
        ldr     r0, [sp, #0xEC]
        ldr     r1, [sp, #0xD4]
        str     r11, [sp, #0x104]
        bl      __muldf3
        ldr     r2, [sp, #0x100]
        ldr     r3, [sp, #0x104]
        bl      __adddf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [sp, #0xF8]
        ldr     r3, [sp, #0xFC]
        bl      __adddf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #0xF4]
        bl      __adddf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [sp, #0x7C]
        ldr     r3, [sp, #0x40]
        bl      __adddf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [sp, #0x94]
        ldr     r3, [sp, #0x88]
        bl      __adddf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [sp, #0xC8]
        ldr     r3, [sp, #0x98]
        bl      __adddf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [sp, #0xD0]
        ldr     r3, [sp, #0xCC]
        bl      __adddf3
        str     r0, [sp, #0xD8]
        ldr     r0, [sp, #0xEC]
        str     r1, [sp, #0xDC]
        ldr     r1, [sp, #0xD4]
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #0x100]
        ldr     r3, [sp, #0x104]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #0xF8]
        ldr     r3, [sp, #0xFC]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #0xF4]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #0x7C]
        ldr     r3, [sp, #0x40]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #0x94]
        ldr     r3, [sp, #0x88]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #0xC8]
        ldr     r3, [sp, #0x98]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #0xD0]
        ldr     r3, [sp, #0xCC]
        bl      __adddf3
        mov     r8, r0
        mov     r9, r1
        ldr     r2, [sp, #0xF0]
        ldr     r0, [sp, #0xEC]
        ldr     r1, [sp, #0xD4]
        str     r8, [sp, #0xE4]
        str     r9, [sp, #0xE8]
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0x100]
        ldr     r3, [sp, #0x104]
        bl      __adddf3
        ldr     r2, [sp, #0xF0]
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0xF8]
        ldr     r3, [sp, #0xFC]
        bl      __adddf3
        ldr     r2, [sp, #0xF0]
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #0xF4]
        bl      __adddf3
        ldr     r2, [sp, #0xF0]
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0x7C]
        ldr     r3, [sp, #0x40]
        bl      __adddf3
        ldr     r2, [sp, #0xF0]
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0x94]
        ldr     r3, [sp, #0x88]
        bl      __adddf3
        ldr     r2, [sp, #0xF0]
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0xC8]
        ldr     r3, [sp, #0x98]
        bl      __adddf3
        ldr     r2, [sp, #0xF0]
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0xD0]
        ldr     r3, [sp, #0xCC]
        bl      __adddf3
        mov     r5, r0
        ldr     r0, [sp, #0xEC]
        mov     r4, r1
        ldr     r1, [sp, #0xD4]
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        ldr     r2, [sp, #0x100]
        ldr     r3, [sp, #0x104]
        bl      __adddf3
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        ldr     r2, [sp, #0xF8]
        ldr     r3, [sp, #0xFC]
        bl      __adddf3
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #0xF4]
        bl      __adddf3
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        ldr     r2, [sp, #0x7C]
        ldr     r3, [sp, #0x40]
        bl      __adddf3
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        ldr     r2, [sp, #0x94]
        ldr     r3, [sp, #0x88]
        bl      __adddf3
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        ldr     r2, [sp, #0xC8]
        ldr     r3, [sp, #0x98]
        bl      __adddf3
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        ldr     r2, [sp, #0xD0]
        ldr     r3, [sp, #0xCC]
        bl      __adddf3
        str     r0, [sp, #0xF0]
        str     r1, [sp, #0xEC]
        ldr     r0, [sp, #0xD8]
        ldr     r1, [sp, #0xDC]
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        mov     r11, r0
        mov     r10, r1
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [sp, #0xF0]
        ldr     r3, [sp, #0xEC]
        bl      __muldf3
        mov     r3, r1
        mov     r12, #0xFF, 12
        mov     r2, r0
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __divdf3
        ldr     r6, [sp, #0x48]
        ldr     r12, [sp, #0x1C]
        mov     r9, r0
        mov     r8, r1
        str     r6, [sp, #0x98]
        ldr     r6, [sp, #0x4C]
        str     r12, [sp, #0xCC]
        ldr     r12, [sp, #0xA4]
        str     r6, [sp, #0x94]
        ldr     r6, [sp, #0x50]
        subs    lr, r12, #1
        str     lr, [sp, #0x1C]
        str     r6, [sp, #0x88]
        ldr     r6, [sp, #0x24]
        str     r12, [sp, #0xD0]
        str     r6, [sp, #0x7C]
        ldr     r6, [sp, #8]
        str     r6, [sp, #0xD4]
        ldr     r6, [sp]
        str     r6, [sp, #0xC8]
        bmi     LCZF43
        ldr     r12, [sp, #0x10]
        ldr     lr, [sp, #0x1C]
        str     r11, [sp, #4]
        str     r5, [sp, #0x14]
        ldr     r5, [sp, #0xE0]
        add     r12, r12, lr, lsl #3
        ldr     lr, [sp, #0x44]
        ldr     r6, [pc, #-0x84C]
        ldr     r11, [sp, #0x1C]
        str     r4, [sp, #0xC]
        str     r10, [sp, #0x40]
        mov     r4, #0
LCZF39:
        ldr     r7, [r12, #4]
        ldr     r10, [r12]
        mov     r2, #0xFF, 12
        orr     r2, r2, #3, 4
        add     r2, r2, #1, 2
        mov     r3, r7, lsr #24
        and     r2, r7, r2
        str     r10, [sp, #0x120]
        mov     r0, r2, lsr #20
        and     r3, r3, #0x80
        cmp     r0, r5, lsl #1
        str     r7, [sp, #0x124]
        mov     r1, r3, lsr #7
        ble     LCZF65
        mvn     r2, #0xFE, 14
        bic     r2, r2, #0x3F, 6
        bic     r2, r7, r2
        cmn     r2, #2, 14
        bne     LCZF40
        str     r4, [sp, #0x120]
        ldr     r7, [sp, #0x124]
        mov     r10, #0
        str     r10, [r12]
        str     r7, [r12, #4]
        b       LCZF42
LCZF40:
        cmp     lr, r2
        bne     LCZF41
        str     r4, [sp, #0x120]
        ldr     r7, [sp, #0x124]
        mov     r10, #0
        str     r10, [r12]
        str     r7, [r12, #4]
        b       LCZF42
LCZF41:
        add     r3, r6, r1, lsl #3
        ldr     r2, [r6, +r1, lsl #3]
        ldr     r3, [r3, #4]
        str     r2, [r12]
        str     r3, [r12, #4]
LCZF42:
        subs    r11, r11, #1
        sub     r12, r12, #8
        bpl     LCZF39
        str     r10, [sp, #0x3C]
        str     r11, [sp, #0x1C]
        ldr     r10, [sp, #0x40]
        ldr     r11, [sp, #4]
        ldr     r4, [sp, #0xC]
        ldr     r5, [sp, #0x14]
        str     r1, [sp, #0x48]
        str     r7, [sp, #0x30]
        str     r0, [sp, #0x54]
LCZF43:
        ldr     r12, [sp, #0x1C]
        subs    r12, r12, #1
        str     r12, [sp, #8]
        bmi     LCZF48
        ldr     r12, [sp, #0x10]
        ldr     lr, [sp, #8]
        str     r11, [sp, #4]
        str     r5, [sp, #0x14]
        ldr     r5, [sp, #0xE0]
        add     r12, r12, lr, lsl #3
        ldr     lr, [sp, #0x44]
        ldr     r6, [pc, #-0x954]
        ldr     r11, [sp, #8]
        str     r4, [sp, #0xC]
        str     r10, [sp, #0x40]
        mov     r4, #0
LCZF44:
        ldr     r7, [r12, #4]
        ldr     r10, [r12]
        mov     r2, #0xFF, 12
        orr     r2, r2, #3, 4
        add     r2, r2, #1, 2
        mov     r3, r7, lsr #24
        and     r2, r7, r2
        str     r10, [sp, #0x118]
        mov     r0, r2, lsr #20
        and     r3, r3, #0x80
        cmp     r0, r5, lsl #1
        str     r7, [sp, #0x11C]
        mov     r1, r3, lsr #7
        ble     LCZF64
        mvn     r2, #0xFE, 14
        bic     r2, r2, #0x3F, 6
        bic     r2, r7, r2
        cmn     r2, #2, 14
        bne     LCZF45
        str     r4, [sp, #0x118]
        ldr     r7, [sp, #0x11C]
        mov     r10, #0
        str     r10, [r12]
        str     r7, [r12, #4]
        b       LCZF47
LCZF45:
        cmp     lr, r2
        bne     LCZF46
        str     r4, [sp, #0x118]
        ldr     r7, [sp, #0x11C]
        mov     r10, #0
        str     r10, [r12]
        str     r7, [r12, #4]
        b       LCZF47
LCZF46:
        add     r3, r6, r1, lsl #3
        ldr     r2, [r6, +r1, lsl #3]
        ldr     r3, [r3, #4]
        str     r2, [r12]
        str     r3, [r12, #4]
LCZF47:
        subs    r11, r11, #1
        sub     r12, r12, #8
        bpl     LCZF44
        str     r10, [sp, #0x60]
        str     r11, [sp, #8]
        ldr     r10, [sp, #0x40]
        ldr     r11, [sp, #4]
        ldr     r4, [sp, #0xC]
        ldr     r5, [sp, #0x14]
        str     r1, [sp, #0x4C]
        str     r7, [sp, #0x34]
        str     r0, [sp, #0x5C]
LCZF48:
        ldr     r12, [sp, #8]
        subs    r12, r12, #1
        str     r12, [sp]
        bmi     LCZF53
        ldr     r12, [sp, #0x10]
        ldr     lr, [sp]
        str     r11, [sp, #4]
        str     r5, [sp, #0x14]
        ldr     r5, [sp, #0xE0]
        add     r12, r12, lr, lsl #3
        ldr     lr, [sp, #0x44]
        ldr     r6, [pc, #-0xA5C]
        ldr     r11, [sp]
        str     r4, [sp, #0xC]
        str     r10, [sp, #0x40]
        mov     r4, #0
LCZF49:
        ldr     r7, [r12, #4]
        ldr     r10, [r12]
        mov     r2, #0xFF, 12
        orr     r2, r2, #3, 4
        add     r2, r2, #1, 2
        mov     r3, r7, lsr #24
        and     r2, r7, r2
        str     r10, [sp, #0x110]
        mov     r0, r2, lsr #20
        and     r3, r3, #0x80
        cmp     r0, r5, lsl #1
        str     r7, [sp, #0x114]
        mov     r1, r3, lsr #7
        ble     LCZF63
        mvn     r2, #0xFE, 14
        bic     r2, r2, #0x3F, 6
        bic     r2, r7, r2
        cmn     r2, #2, 14
        bne     LCZF50
        str     r4, [sp, #0x110]
        ldr     r7, [sp, #0x114]
        mov     r10, #0
        str     r10, [r12]
        str     r7, [r12, #4]
        b       LCZF52
LCZF50:
        cmp     lr, r2
        bne     LCZF51
        str     r4, [sp, #0x110]
        ldr     r7, [sp, #0x114]
        mov     r10, #0
        str     r10, [r12]
        str     r7, [r12, #4]
        b       LCZF52
LCZF51:
        add     r3, r6, r1, lsl #3
        ldr     r2, [r6, +r1, lsl #3]
        ldr     r3, [r3, #4]
        str     r2, [r12]
        str     r3, [r12, #4]
LCZF52:
        subs    r11, r11, #1
        sub     r12, r12, #8
        bpl     LCZF49
        str     r10, [sp, #0x2C]
        str     r11, [sp]
        ldr     r10, [sp, #0x40]
        ldr     r11, [sp, #4]
        ldr     r4, [sp, #0xC]
        ldr     r5, [sp, #0x14]
        str     r1, [sp, #0x50]
        str     r7, [sp, #0x38]
        str     r0, [sp, #0x58]
LCZF53:
        ldr     r12, [sp]
        subs    r12, r12, #1
        str     r12, [sp, #0xA4]
        bmi     LCZF58
        ldr     r12, [sp, #0x10]
        ldr     lr, [sp, #0xA4]
        str     r10, [sp, #0x40]
        str     r5, [sp, #0x14]
        ldr     r5, [sp, #0x44]
        ldr     r7, [sp, #0xE0]
        ldr     r10, [pc, #-0xB60]
        ldr     r1, [sp, #0xA4]
        add     r12, r12, lr, lsl #3
        str     r11, [sp, #4]
        str     r4, [sp, #0xC]
        mov     r6, #0
LCZF54:
        ldr     r11, [r12, #4]
        ldr     r0, [r12]
        mov     r2, #0xFF
        orr     r2, r2, #3, 24
        mov     r4, r11, lsr #24
        str     r0, [sp, #0x108]
        mov     r2, r2, lsl #20
        add     lr, r2, #1, 2
        and     lr, r11, lr
        and     r4, r4, #0x80
        mov     lr, lr, lsr #20
        cmp     lr, r7, lsl #1
        str     r11, [sp, #0x10C]
        mov     r4, r4, lsr #7
        ble     LCZF66
        mvn     r2, #0xFE, 14
        bic     r2, r2, #0x3F, 6
        bic     r2, r11, r2
        cmn     r2, #2, 14
        bne     LCZF55
        str     r6, [sp, #0x108]
        ldr     r11, [sp, #0x10C]
        mov     r0, #0
        str     r0, [r12]
        str     r11, [r12, #4]
        b       LCZF57
LCZF55:
        cmp     r5, r2
        bne     LCZF56
        str     r6, [sp, #0x108]
        ldr     r11, [sp, #0x10C]
        mov     r0, #0
        str     r0, [r12]
        str     r11, [r12, #4]
        b       LCZF57
LCZF56:
        add     r3, r10, r4, lsl #3
        ldr     r2, [r10, +r4, lsl #3]
        ldr     r3, [r3, #4]
        str     r2, [r12]
        str     r3, [r12, #4]
LCZF57:
        subs    r1, r1, #1
        sub     r12, r12, #8
        bpl     LCZF54
        str     r4, [sp, #0x24]
        str     r11, [sp, #0x20]
        ldr     r10, [sp, #0x40]
        ldr     r11, [sp, #4]
        ldr     r4, [sp, #0xC]
        ldr     r5, [sp, #0x14]
        str     lr, [sp, #0x28]
        str     r0, [sp, #0x18]
        str     r1, [sp, #0xA4]
LCZF58:
        mov     r0, r5
        mov     r1, r4
        ldr     r2, [sp, #0xF0]
        ldr     r3, [sp, #0xEC]
        bl      __muldf3
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        mov     r7, r0
        mov     r6, r1
        mov     r2, r11
        mov     r3, r10
        mov     r0, r9
        mov     r1, r8
        bl      __muldf3
        ldr     r2, [sp, #0xE4]
        ldr     r3, [sp, #0xE8]
        mov     r8, r0
        mov     r9, r1
        mov     r0, r7
        mov     r1, r6
        bl      __muldf3
        ldr     r2, [sp, #0x74]
        ldr     r3, [sp, #0x78]
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0xC0]
        mov     r3, r1
        ldr     r1, [sp, #0xC4]
        bl      __subdf3
        ldr     r2, [sp, #0xD8]
        ldr     r3, [sp, #0xDC]
        str     r0, [sp, #0xE8]
        str     r1, [sp, #0xE4]
        mov     r0, r7
        mov     r1, r6
        bl      __muldf3
        ldr     r2, [sp, #0x84]
        ldr     r3, [sp, #0x80]
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0xB8]
        mov     r3, r1
        ldr     r1, [sp, #0xBC]
        bl      __subdf3
        ldr     r2, [sp, #0xF0]
        ldr     r3, [sp, #0xEC]
        mov     r11, r0
        mov     r10, r1
        mov     r0, r8
        mov     r1, r9
        bl      __muldf3
        ldr     r2, [sp, #0x8C]
        ldr     r3, [sp, #0x90]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [sp, #0xB4]
        ldr     r1, [sp, #0xB0]
        bl      __subdf3
        mov     r7, r0
        mov     r6, r1
        mov     r2, r5
        mov     r3, r4
        mov     r0, r8
        mov     r1, r9
        bl      __muldf3
        ldr     r2, [sp, #0xA0]
        ldr     r3, [sp, #0x9C]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [sp, #0xA8]
        ldr     r1, [sp, #0xAC]
        bl      __subdf3
        ldr     r12, [sp, #0x70]
        mov     r5, r0
        mov     r4, r1
        cmp     r12, #0
        beq     LCZF59
        ldr     r8, [sp, #0x98]
        ldr     lr, [pc, #-0xD88]
        ldr     r2, [sp, #0xE8]
        ldr     r3, [sp, #0xE4]
        add     r12, lr, r8, lsl #3
        ldr     r0, [lr, +r8, lsl #3]
        ldr     r1, [r12, #4]
        bl      __subdf3
        str     r0, [sp, #0xE8]
        str     r1, [sp, #0xE4]
LCZF59:
        ldr     r12, [sp, #0x6C]
        cmp     r12, #0
        beq     LCZF60
        ldr     r8, [sp, #0x94]
        ldr     lr, [pc, #-0xDBC]
        mov     r2, r11
        mov     r3, r10
        add     r12, lr, r8, lsl #3
        ldr     r0, [lr, +r8, lsl #3]
        ldr     r1, [r12, #4]
        bl      __subdf3
        mov     r11, r0
        mov     r10, r1
LCZF60:
        ldr     r12, [sp, #0x64]
        cmp     r12, #0
        beq     LCZF61
        ldr     r8, [sp, #0x88]
        ldr     lr, [pc, #-0xDF0]
        mov     r2, r7
        mov     r3, r6
        add     r12, lr, r8, lsl #3
        ldr     r0, [lr, +r8, lsl #3]
        ldr     r1, [r12, #4]
        bl      __subdf3
        mov     r7, r0
        mov     r6, r1
LCZF61:
        ldr     r12, [sp, #0x68]
        cmp     r12, #0
        beq     LCZF62
        ldr     r8, [sp, #0x7C]
        ldr     lr, [pc, #-0xE24]
        mov     r2, r5
        mov     r3, r4
        add     r12, lr, r8, lsl #3
        ldr     r0, [lr, +r8, lsl #3]
        ldr     r1, [r12, #4]
        bl      __subdf3
        mov     r5, r0
        mov     r4, r1
LCZF62:
        ldr     r8, [sp, #0xCC]
        ldr     r12, [sp, #0x10]
        ldr     lr, [sp, #0xE8]
        str     lr, [r12, +r8, lsl #3]
        add     lr, r12, r8, lsl #3
        ldr     r8, [sp, #0xE4]
        str     r8, [lr, #4]
        ldr     lr, [sp, #0xD4]
        str     r11, [r12, +lr, lsl #3]
        add     lr, r12, lr, lsl #3
        str     r10, [lr, #4]
        ldr     lr, [sp, #0xC8]
        str     r7, [r12, +lr, lsl #3]
        add     lr, r12, lr, lsl #3
        str     r6, [lr, #4]
        ldr     lr, [sp, #0xD0]
        str     r5, [r12, +lr, lsl #3]
        ldr     r0, [sp, #0xA4]
        add     lr, r12, lr, lsl #3
        str     r4, [lr, #4]
        cmp     r0, #0
        bge     LCZF30
        ldr     r6, [sp]
        ldr     r7, [sp, #8]
        ldr     r5, [sp, #0x1C]
        ldr     r4, [sp, #0x10]
        b       LCZF27
LCZF63:
        str     r10, [sp, #0x2C]
        str     r11, [sp]
        ldr     r10, [sp, #0x40]
        ldr     r11, [sp, #4]
        ldr     r4, [sp, #0xC]
        ldr     r5, [sp, #0x14]
        str     r1, [sp, #0x50]
        str     r7, [sp, #0x38]
        str     r0, [sp, #0x58]
        b       LCZF53
LCZF64:
        str     r10, [sp, #0x60]
        str     r11, [sp, #8]
        ldr     r10, [sp, #0x40]
        ldr     r11, [sp, #4]
        ldr     r4, [sp, #0xC]
        ldr     r5, [sp, #0x14]
        str     r1, [sp, #0x4C]
        str     r7, [sp, #0x34]
        str     r0, [sp, #0x5C]
        b       LCZF48
LCZF65:
        str     r10, [sp, #0x3C]
        str     r11, [sp, #0x1C]
        ldr     r10, [sp, #0x40]
        ldr     r11, [sp, #4]
        ldr     r4, [sp, #0xC]
        ldr     r5, [sp, #0x14]
        str     r1, [sp, #0x48]
        str     r7, [sp, #0x30]
        str     r0, [sp, #0x54]
        b       LCZF43
LCZF66:
        str     r4, [sp, #0x24]
        str     r11, [sp, #0x20]
        ldr     r10, [sp, #0x40]
        ldr     r11, [sp, #4]
        ldr     r4, [sp, #0xC]
        ldr     r5, [sp, #0x14]
        str     lr, [sp, #0x28]
        str     r0, [sp, #0x18]
        str     r1, [sp, #0xA4]
        b       LCZF58
LCZF67:
        mov     r2, r3
        mov     r8, r4
        ldr     r5, [sp, #0x1C]
        ldr     lr, [sp, #0x18]
        ldr     r12, [sp, #0xC]
        ldr     r3, [sp, #4]
        ldr     r4, [sp, #0x10]
        b       LCZF22
LCZF68:
        ldr     r2, [sp, #0x14]
        ldr     r3, [sp, #4]
        ldr     r4, [sp, #0x10]
        b       LCZF17
LCZF69:
        ldr     r12, [sp, #0xC]
        ldr     r4, [sp, #0x10]
        b       LCZF12
LCZF70:
        mvn     r0, #7
        add     sp, sp, #0x4A, 30
        ldmia   sp!, {r4 - r11, pc}


        .data
        .align  4


LCZF_x1.3620.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LCZF_x2.3620.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LCZF_x3.3620.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LCZF_x4.3620.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00


        .data
        .align  4


LCZF_pi_2d:
        .byte   0x18,0x2D,0x44,0x54,0xFB,0x21,0xF9,0x3F,0x18,0x2D,0x44,0x54,0xFB,0x21,0xF9,0xBF
LCZF_d_P:
        .byte   0xDA,0xFA,0x18,0x09,0x1C,0x36,0x01,0x3F,0xB6,0x3E,0x69,0xC8,0x73,0xA5,0x57,0x3F
        .byte   0xCF,0xEF,0xC1,0x51,0xF2,0x10,0x91,0x3F,0xE0,0x54,0x79,0x13,0x1F,0xD1,0xB3,0x3F
        .byte   0xFF,0x0D,0x9B,0xF6,0x96,0x50,0xC5,0x3F,0xE9,0xEB,0x7D,0xA1,0x4C,0x33,0xC5,0x3F
        .byte   0xA0,0x59,0x49,0x65,0x52,0x80,0xAF,0x3F,0x91,0x93,0xD2,0x46,0xBC,0x68,0xE1,0x3B
LCZF_d_Q:
        .byte   0xCF,0xA9,0xA6,0x51,0x52,0xCE,0x02,0x3F,0xC4,0x6D,0xED,0x8C,0x78,0x6C,0x5F,0x3F
        .byte   0x84,0xA9,0xE4,0xB0,0x26,0x6C,0x9C,0x3F,0xA1,0x2D,0x62,0x93,0x5D,0x8D,0xC5,0x3F
        .byte   0x72,0x02,0x0E,0x02,0xC3,0x23,0xE0,0x3F,0x7C,0xD5,0x8B,0xF7,0x0A,0x1F,0xE9,0x3F
        .byte   0xFB,0x4A,0x50,0xF1,0xB5,0x71,0xE3,0x3F,0x38,0x03,0xF7,0xCB,0x3D,0xA0,0xC7,0x3F


