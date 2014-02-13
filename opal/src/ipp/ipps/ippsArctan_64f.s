        .text
        .align  4
        .globl  _ippsArctan_64f


_ippsArctan_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x4A, 30
        ldr     r9, [pc, #0xD64]
        ldr     r7, [pc, #0xD64]
        ldr     r8, [pc, #0xD64]
        ldr     r11, [r9]
        ldr     r10, [pc, #0xD60]
        ldr     lr, [pc, #0xD60]
        ldr     r3, [pc, #0xD60]
        ldr     r12, [pc, #0xD60]
        ldr     r9, [pc, #0xD60]
        ldr     r7, [r7]
        ldr     r8, [r8]
        ldr     r10, [r10]
        ldr     lr, [lr]
        ldr     r3, [r3]
        ldr     r12, [r12]
        ldr     r9, [r9]
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        str     r7, [sp, #0x120]
        str     r8, [sp, #0x118]
        str     r10, [sp, #0x110]
        mov     r6, r2
        str     r11, [sp, #0x108]
        beq     LCZG70
        cmp     r4, #0
        beq     LCZG70
        cmp     r6, #1
        blt     LCZG28
        ldr     r7, [pc, #0xD10]
        mov     r10, #0xFF
        mov     r8, #0xFF, 12
        orr     r11, r10, #3, 24
        orr     r10, r8, #7, 4
        cmp     r6, #4
        mov     r8, #0
        bge     LCZG7
        cmp     r6, #0
        ble     LCZG6
        str     lr, [sp, #0x124]
        add     r10, r10, #2, 14
        mov     r3, r11, lsl #1
        str     r10, [sp, #0xF8]
        str     r3, [sp, #0xF0]
        str     r11, [sp, #0xF4]
LCZG0:
        ldr     r10, [r5]
        ldr     r9, [r5, #4]
        mov     lr, #0xFF, 12
        orr     lr, lr, #3, 4
        str     r10, [sp, #0x120]
        add     lr, lr, #1, 2
        str     r9, [sp, #0x124]
        and     r12, r9, lr
        ldr     lr, [sp, #0xF0]
        cmp     lr, r12, lsr #20
        mov     lr, r9, lsr #24
        and     lr, lr, #0x80
        mov     r8, lr, lsr #7
        bge     LCZG3
        mvn     r12, #0xFE, 14
        bic     r12, r12, #0x3F, 6
        bic     r12, r9, r12
        cmn     r12, #2, 14
        bne     LCZG1
        mov     r3, #0
        str     r3, [sp, #0x120]
        str     r3, [r4]
        ldr     r3, [sp, #0x124]
        str     r3, [r4, #4]
        b       LCZG5
LCZG1:
        ldr     r3, [sp, #0xF8]
        cmp     r3, r12
        bne     LCZG2
        mov     r3, #0
        str     r3, [sp, #0x120]
        str     r3, [r4]
        ldr     r3, [sp, #0x124]
        str     r3, [r4, #4]
        b       LCZG5
LCZG2:
        add     r3, r7, r8, lsl #3
        ldr     r8, [r7, +r8, lsl #3]
        ldr     r3, [r3, #4]
        str     r8, [r4]
        str     r3, [r4, #4]
        b       LCZG5
LCZG3:
        ldr     lr, [sp, #0xF4]
        cmp     lr, r12, lsr #20
        bgt     LCZG4
        mov     r2, r10
        mov     r3, r9
        mov     r12, #0xFF
        orr     r12, r12, #3, 24
        mov     r0, #0
        mov     r1, r12, lsl #20
        bl      __divdf3
        mov     r3, r1
        str     r3, [sp, #0xEC]
        mov     r11, r0
        mov     r2, r11
        bl      __muldf3
        ldr     r3, [sp, #0xEC]
        mov     r10, r0
        ldr     r0, [r7, +r8, lsl #3]
        mov     r9, r1
        add     r8, r7, r8, lsl #3
        ldr     r1, [r8, #4]
        mov     r2, r11
        bl      __subdf3
        ldr     r12, [r7, #0x38]
        str     r12, [sp, #0xE8]
        ldr     r12, [r7, #0x3C]
        str     r12, [sp, #0xE4]
        ldr     r12, [r7, #0x48]
        str     r12, [sp, #0xE0]
        ldr     r8, [r7, #0x4C]
        ldr     r12, [r7, #0x18]
        str     r12, [sp, #0xDC]
        ldr     r12, [r7, #0x1C]
        str     r12, [sp, #0xD8]
        ldr     r12, [r7, #0x40]
        ldr     r2, [r7, #0x10]
        ldr     r3, [r7, #0x14]
        str     r12, [sp, #0xD4]
        ldr     r12, [r7, #0x44]
        str     r12, [sp, #0xD0]
        ldr     r12, [r7, #0x30]
        str     r12, [sp, #0xCC]
        ldr     r12, [r7, #0x34]
        str     r12, [sp, #0xC8]
        ldr     r12, [r7, #0x28]
        str     r12, [sp, #0xC4]
        ldr     r12, [r7, #0x2C]
        str     r12, [sp, #0xC0]
        ldr     r12, [r7, #0x20]
        str     r12, [sp, #0xBC]
        ldr     r12, [r7, #0x24]
        str     r0, [sp, #0xB4]
        str     r1, [sp, #0xB0]
        str     r12, [sp, #0xB8]
        mov     r0, r2
        mov     r1, r3
        mov     r2, r10
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #0xDC]
        ldr     r3, [sp, #0xD8]
        bl      __adddf3
        mov     r2, r10
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #0xBC]
        ldr     r3, [sp, #0xB8]
        bl      __adddf3
        mov     r2, r10
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #0xC4]
        ldr     r3, [sp, #0xC0]
        bl      __adddf3
        mov     r2, r10
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #0xCC]
        ldr     r3, [sp, #0xC8]
        bl      __adddf3
        mov     r2, r10
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #0xE8]
        ldr     r3, [sp, #0xE4]
        bl      __adddf3
        mov     r2, r10
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #0xD4]
        ldr     r3, [sp, #0xD0]
        bl      __adddf3
        mov     r2, r10
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #0xE0]
        mov     r3, r8
        bl      __adddf3
        ldr     r3, [sp, #0xEC]
        mov     r2, r11
        bl      __muldf3
        ldr     r12, [r7, #0x80]
        str     r12, [sp, #0xEC]
        ldr     r11, [r7, #0x84]
        ldr     r12, [r7, #0x60]
        str     r12, [sp, #0xE8]
        ldr     r12, [r7, #0x64]
        str     r12, [sp, #0xE4]
        ldr     r12, [r7, #0x78]
        str     r12, [sp, #0xE0]
        ldr     r12, [r7, #0x7C]
        str     r12, [sp, #0xDC]
        ldr     r12, [r7, #0x74]
        ldr     r8, [r7, #0x70]
        str     r12, [sp, #0xD8]
        ldr     r12, [r7, #0x68]
        str     r12, [sp, #0xD4]
        ldr     r12, [r7, #0x6C]
        str     r12, [sp, #0xD0]
        ldr     r2, [r7, #0x50]
        ldr     r3, [r7, #0x54]
        ldr     r12, [r7, #0x88]
        str     r12, [sp, #0xCC]
        ldr     r12, [r7, #0x8C]
        str     r12, [sp, #0xC8]
        ldr     r12, [r7, #0x58]
        str     r12, [sp, #0xC4]
        ldr     r12, [r7, #0x5C]
        str     r0, [sp, #0xBC]
        str     r1, [sp, #0xB8]
        str     r12, [sp, #0xC0]
        mov     r0, r2
        mov     r1, r3
        mov     r2, r10
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #0xC4]
        ldr     r3, [sp, #0xC0]
        bl      __adddf3
        mov     r2, r10
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #0xE8]
        ldr     r3, [sp, #0xE4]
        bl      __adddf3
        mov     r2, r10
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #0xD4]
        ldr     r3, [sp, #0xD0]
        bl      __adddf3
        mov     r2, r10
        mov     r3, r9
        bl      __muldf3
        ldr     r3, [sp, #0xD8]
        mov     r2, r8
        bl      __adddf3
        mov     r2, r10
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #0xE0]
        ldr     r3, [sp, #0xDC]
        bl      __adddf3
        mov     r2, r10
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #0xEC]
        mov     r3, r11
        bl      __adddf3
        mov     r2, r10
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #0xCC]
        ldr     r3, [sp, #0xC8]
        bl      __adddf3
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [sp, #0xBC]
        ldr     r1, [sp, #0xB8]
        bl      __divdf3
        ldr     r2, [sp, #0xB4]
        ldr     r3, [sp, #0xB0]
        bl      __adddf3
        str     r0, [r4]
        str     r1, [r4, #4]
        b       LCZG5
LCZG4:
        mov     r2, r10
        mov     r3, r9
        mov     r0, r10
        mov     r1, r9
        bl      __muldf3
        ldr     r12, [r7, #0x48]
        ldr     r2, [r7, #0x10]
        ldr     r3, [r7, #0x14]
        str     r12, [sp, #0xEC]
        ldr     r12, [r7, #0x4C]
        mov     r8, r0
        str     r12, [sp, #0xE8]
        ldr     r12, [r7, #0x40]
        mov     r11, r1
        str     r12, [sp, #0xE4]
        ldr     r12, [r7, #0x44]
        str     r12, [sp, #0xE0]
        ldr     r12, [r7, #0x38]
        str     r12, [sp, #0xDC]
        ldr     r12, [r7, #0x3C]
        str     r12, [sp, #0xD8]
        ldr     r12, [r7, #0x30]
        str     r12, [sp, #0xD4]
        ldr     r12, [r7, #0x34]
        str     r12, [sp, #0xD0]
        ldr     r12, [r7, #0x28]
        str     r12, [sp, #0xCC]
        ldr     r12, [r7, #0x2C]
        str     r12, [sp, #0xC8]
        ldr     r12, [r7, #0x20]
        str     r12, [sp, #0xC4]
        ldr     r12, [r7, #0x24]
        str     r12, [sp, #0xC0]
        ldr     r12, [r7, #0x18]
        str     r12, [sp, #0xBC]
        ldr     r12, [r7, #0x1C]
        str     r12, [sp, #0xB8]
        bl      __muldf3
        ldr     r3, [sp, #0xB8]
        ldr     r2, [sp, #0xBC]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [sp, #0xC4]
        ldr     r3, [sp, #0xC0]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [sp, #0xCC]
        ldr     r3, [sp, #0xC8]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [sp, #0xD4]
        ldr     r3, [sp, #0xD0]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r11
        bl      __muldf3
        ldr     r3, [sp, #0xD8]
        ldr     r2, [sp, #0xDC]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [sp, #0xE4]
        ldr     r3, [sp, #0xE0]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [sp, #0xEC]
        ldr     r3, [sp, #0xE8]
        bl      __adddf3
        mov     r2, r10
        mov     r3, r9
        bl      __muldf3
        ldr     lr, [r7, #0x50]
        ldr     r12, [r7, #0x54]
        ldr     r2, [r7, #0x88]
        str     r2, [sp, #0xEC]
        ldr     r2, [r7, #0x8C]
        mov     r3, r11
        str     r2, [sp, #0xE8]
        ldr     r2, [r7, #0x80]
        str     r2, [sp, #0xE4]
        ldr     r2, [r7, #0x84]
        str     r2, [sp, #0xE0]
        ldr     r2, [r7, #0x78]
        str     r2, [sp, #0xDC]
        ldr     r2, [r7, #0x7C]
        str     r2, [sp, #0xD8]
        ldr     r2, [r7, #0x70]
        str     r2, [sp, #0xD4]
        ldr     r2, [r7, #0x74]
        str     r2, [sp, #0xD0]
        ldr     r2, [r7, #0x68]
        str     r2, [sp, #0xCC]
        ldr     r2, [r7, #0x6C]
        str     r2, [sp, #0xC8]
        ldr     r2, [r7, #0x60]
        str     r2, [sp, #0xC4]
        ldr     r2, [r7, #0x64]
        str     r2, [sp, #0xC0]
        ldr     r2, [r7, #0x58]
        str     r2, [sp, #0xBC]
        ldr     r2, [r7, #0x5C]
        str     r0, [sp, #0xB4]
        str     r1, [sp, #0xB0]
        str     r2, [sp, #0xB8]
        mov     r0, lr
        mov     r1, r12
        mov     r2, r8
        bl      __muldf3
        ldr     r2, [sp, #0xBC]
        ldr     r3, [sp, #0xB8]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [sp, #0xC4]
        ldr     r3, [sp, #0xC0]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [sp, #0xCC]
        ldr     r3, [sp, #0xC8]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [sp, #0xD4]
        ldr     r3, [sp, #0xD0]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [sp, #0xDC]
        ldr     r3, [sp, #0xD8]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [sp, #0xE4]
        ldr     r3, [sp, #0xE0]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [sp, #0xEC]
        ldr     r3, [sp, #0xE8]
        bl      __adddf3
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [sp, #0xB4]
        ldr     r1, [sp, #0xB0]
        bl      __divdf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r10
        mov     r1, r9
        bl      __subdf3
        str     r0, [r4]
        str     r1, [r4, #4]
LCZG5:
        subs    r6, r6, #1
        add     r4, r4, #8
        add     r5, r5, #8
        bne     LCZG0
LCZG6:
        mov     r0, #0
        add     sp, sp, #0x4A, 30
        ldmia   sp!, {r4 - r11, pc}
LCZG7:
        subs    r6, r6, #1
        str     r12, [sp, #0x114]
        str     r3, [sp, #0x11C]
        str     lr, [sp, #0x124]
        movmi   r2, #0
        bmi     LCZG12
        mov     r11, r11, lsl #1
        add     r10, r10, #2, 14
        add     r0, r4, r6, lsl #3
        add     r1, r5, r6, lsl #3
        str     r9, [sp, #0xC8]
        str     r12, [sp, #0xCC]
        str     r3, [sp, #0xD0]
LCZG8:
        ldr     lr, [r1, #4]
        ldr     r12, [r1]
        mov     r2, #0xFF, 12
        orr     r2, r2, #3, 4
        add     r2, r2, #1, 2
        mov     r3, lr, lsr #24
        and     r2, lr, r2
        str     r12, [sp, #0x120]
        cmp     r11, r2, lsr #20
        and     r3, r3, #0x80
        str     lr, [sp, #0x124]
        mov     r2, r3, lsr #7
        bge     LCZG69
        mov     r3, #0xFE, 18
        orr     r3, r3, #0x3F, 10
        and     r3, lr, r3
        cmn     r3, #2, 14
        bne     LCZG9
        str     r8, [sp, #0x120]
        ldr     r3, [sp, #0x124]
        str     r8, [r0]
        str     r3, [r0, #4]
        b       LCZG11
LCZG9:
        mvn     r3, #0xFE, 14
        bic     r3, r3, #0x3F, 6
        bic     r3, lr, r3
        cmp     r10, r3
        bne     LCZG10
        str     r8, [sp, #0x120]
        ldr     r3, [sp, #0x124]
        str     r8, [r0]
        str     r3, [r0, #4]
        b       LCZG11
LCZG10:
        add     r12, r7, r2, lsl #3
        ldr     r3, [r7, +r2, lsl #3]
        ldr     r12, [r12, #4]
        str     r3, [r0]
        str     r12, [r0, #4]
LCZG11:
        subs    r6, r6, #1
        sub     r0, r0, #8
        sub     r1, r1, #8
        bpl     LCZG8
        ldr     r9, [sp, #0xC8]
        ldr     r12, [sp, #0xCC]
        ldr     r3, [sp, #0xD0]
LCZG12:
        subs    r7, r6, #1
        mov     r8, #0
        movmi   r8, #0
        strmi   r8, [sp, #0xE4]
        bmi     LCZG17
        ldr     r3, [pc, #0x590]
        mov     r10, #0xFF
        mov     r11, #0xFF, 12
        orr     r0, r11, #7, 4
        orr     r10, r10, #3, 24
        add     r1, r5, r7, lsl #3
        str     r4, [sp]
        mov     r11, r10, lsl #1
        add     r10, r0, #2, 14
        add     r0, r4, r7, lsl #3
        str     r5, [sp, #0x14]
        str     r9, [sp, #0xC8]
        str     r12, [sp, #0xCC]
        str     lr, [sp, #0xC4]
LCZG13:
        ldr     r4, [r1, #4]
        ldr     r5, [r1]
        mov     r12, #0xFF, 12
        orr     r12, r12, #3, 4
        add     r12, r12, #1, 2
        mov     lr, r4, lsr #24
        and     r12, r4, r12
        str     r5, [sp, #0x118]
        cmp     r11, r12, lsr #20
        and     lr, lr, #0x80
        str     r4, [sp, #0x11C]
        mov     r12, lr, lsr #7
        bge     LCZG68
        mvn     lr, #0xFE, 14
        bic     lr, lr, #0x3F, 6
        bic     lr, r4, lr
        cmn     lr, #2, 14
        bne     LCZG14
        str     r8, [sp, #0x118]
        ldr     lr, [sp, #0x11C]
        str     r8, [r0]
        str     lr, [r0, #4]
        b       LCZG16
LCZG14:
        cmp     r10, lr
        bne     LCZG15
        str     r8, [sp, #0x118]
        ldr     lr, [sp, #0x11C]
        str     r8, [r0]
        str     lr, [r0, #4]
        b       LCZG16
LCZG15:
        add     r5, r3, r12, lsl #3
        ldr     lr, [r3, +r12, lsl #3]
        ldr     r5, [r5, #4]
        str     lr, [r0]
        str     r5, [r0, #4]
LCZG16:
        subs    r7, r7, #1
        sub     r0, r0, #8
        sub     r1, r1, #8
        bpl     LCZG13
        str     r12, [sp, #0xE4]
        mov     r3, r4
        ldr     r4, [sp]
        ldr     r5, [sp, #0x14]
        ldr     r9, [sp, #0xC8]
        ldr     r12, [sp, #0xCC]
        ldr     lr, [sp, #0xC4]
LCZG17:
        subs    r8, r7, #1
        movmi   r10, #0
        strmi   r10, [sp, #0xE8]
        bmi     LCZG22
        mov     r12, #0xFF
        mov     r10, #0xFF, 12
        str     lr, [sp, #0xC4]
        ldr     lr, [pc, #0x484]
        orr     r12, r12, #3, 24
        orr     r10, r10, #7, 4
        add     r10, r10, #2, 14
        mov     r11, r12, lsl #1
        mov     r12, #0
        add     r0, r4, r8, lsl #3
        add     r1, r5, r8, lsl #3
        str     r6, [sp, #0x60]
        str     r4, [sp]
        str     r5, [sp, #0x14]
        str     r9, [sp, #0xC8]
        str     r3, [sp, #0xD0]
LCZG18:
        ldr     r3, [r1, #4]
        ldr     r6, [r1]
        mov     r4, #0xFF, 12
        orr     r4, r4, #3, 4
        add     r4, r4, #1, 2
        mov     r5, r3, lsr #24
        and     r4, r3, r4
        str     r6, [sp, #0x110]
        cmp     r11, r4, lsr #20
        and     r5, r5, #0x80
        str     r3, [sp, #0x114]
        mov     r4, r5, lsr #7
        bge     LCZG67
        mvn     r5, #0xFE, 14
        bic     r5, r5, #0x3F, 6
        bic     r5, r3, r5
        cmn     r5, #2, 14
        bne     LCZG19
        str     r12, [sp, #0x110]
        ldr     r5, [sp, #0x114]
        str     r12, [r0]
        str     r5, [r0, #4]
        b       LCZG21
LCZG19:
        cmp     r10, r5
        bne     LCZG20
        str     r12, [sp, #0x110]
        ldr     r5, [sp, #0x114]
        str     r12, [r0]
        str     r5, [r0, #4]
        b       LCZG21
LCZG20:
        add     r6, lr, r4, lsl #3
        ldr     r5, [lr, +r4, lsl #3]
        ldr     r6, [r6, #4]
        str     r5, [r0]
        str     r6, [r0, #4]
LCZG21:
        subs    r8, r8, #1
        sub     r0, r0, #8
        sub     r1, r1, #8
        bpl     LCZG18
        str     r4, [sp, #0xE8]
        mov     r12, r3
        ldr     r6, [sp, #0x60]
        ldr     r4, [sp]
        ldr     r5, [sp, #0x14]
        ldr     r9, [sp, #0xC8]
        ldr     r3, [sp, #0xD0]
        ldr     lr, [sp, #0xC4]
LCZG22:
        subs    r10, r8, #1
        bmi     LCZG27
        mov     r0, #0xFF, 12
        str     r9, [sp, #0x10C]
        orr     r0, r0, #7, 4
        add     r9, r0, #2, 14
        add     r0, r4, r10, lsl #3
        str     r4, [sp]
        ldr     r4, [pc, #0x374]
        mov     r11, #0xFF
        add     r1, r5, r10, lsl #3
        str     r5, [sp, #0x14]
        orr     r11, r11, #3, 24
        str     r7, [sp, #0x5C]
        str     r6, [sp, #0x60]
        str     r12, [sp, #0xCC]
        str     r3, [sp, #0xD0]
        str     lr, [sp, #0xC4]
        mov     r5, #0
LCZG23:
        ldr     r12, [r1, #4]
        ldr     lr, [r1]
        mov     r7, #0xFF, 12
        orr     r7, r7, #3, 4
        add     r7, r7, #1, 2
        and     r7, r12, r7
        mov     r6, r12, lsr #24
        str     lr, [sp, #0x108]
        mov     r7, r7, lsr #20
        and     r6, r6, #0x80
        cmp     r7, r11, lsl #1
        str     r12, [sp, #0x10C]
        mov     r3, r6, lsr #7
        ble     LCZG29
        mvn     lr, #0xFE, 14
        bic     lr, lr, #0x3F, 6
        bic     lr, r12, lr
        cmn     lr, #2, 14
        bne     LCZG24
        str     r5, [sp, #0x108]
        ldr     r3, [sp, #0x10C]
        str     r5, [r0]
        str     r3, [r0, #4]
        b       LCZG26
LCZG24:
        cmp     r9, lr
        bne     LCZG25
        str     r5, [sp, #0x108]
        ldr     r3, [sp, #0x10C]
        str     r5, [r0]
        str     r3, [r0, #4]
        b       LCZG26
LCZG25:
        add     r12, r4, r3, lsl #3
        ldr     r3, [r4, +r3, lsl #3]
        ldr     r12, [r12, #4]
        str     r3, [r0]
        str     r12, [r0, #4]
LCZG26:
        subs    r10, r10, #1
        sub     r0, r0, #8
        sub     r1, r1, #8
        bpl     LCZG23
        ldr     r7, [sp, #0x5C]
        ldr     r6, [sp, #0x60]
        ldr     r4, [sp]
LCZG27:
        cmp     r6, #0
        blt     LCZG6
        ldr     r0, [sp, #0x120]
        ldr     r1, [sp, #0x124]
        add     r5, r4, r6, lsl #3
        bl      atan
        str     r0, [r4, +r6, lsl #3]
        cmp     r7, #0
        str     r1, [r5, #4]
        blt     LCZG6
        ldr     r0, [sp, #0x118]
        ldr     r1, [sp, #0x11C]
        add     r5, r4, r7, lsl #3
        bl      atan
        str     r0, [r4, +r7, lsl #3]
        cmp     r8, #0
        str     r1, [r5, #4]
        blt     LCZG6
        ldr     r0, [sp, #0x110]
        ldr     r1, [sp, #0x114]
        add     r5, r4, r8, lsl #3
        bl      atan
        str     r0, [r4, +r8, lsl #3]
        mov     r0, #0
        str     r1, [r5, #4]
        add     sp, sp, #0x4A, 30
        ldmia   sp!, {r4 - r11, pc}
LCZG28:
        mvn     r0, #5
        add     sp, sp, #0x4A, 30
        ldmia   sp!, {r4 - r11, pc}
LCZG29:
        ldr     r11, [sp, #0x120]
        ldr     r1, [sp, #0x110]
        ldr     r6, [sp, #0x60]
        ldr     r4, [sp]
        ldr     r5, [sp, #0x14]
        ldr     r0, [sp, #0x118]
        str     r3, [sp, #0xDC]
        ldr     r3, [sp, #0xD0]
        str     lr, [sp, #0xD4]
        ldr     lr, [sp, #0xC4]
        mov     r9, #0xFF, 12
        str     r12, [sp, #0xD8]
        ldr     r12, [sp, #0xCC]
        orr     r9, r9, #3, 4
        str     r11, [sp, #0xEC]
        ldr     r11, [sp, #0x124]
        str     r1, [sp, #0xF8]
        ldr     r1, [sp, #0x114]
        add     r9, r9, #1, 2
        and     lr, lr, r9
        and     r3, r3, r9
        and     r9, r12, r9
        str     r7, [sp, #0xE0]
        ldr     r7, [sp, #0x5C]
        str     r11, [sp, #0xF0]
        ldr     r11, [sp, #0x11C]
        str     r1, [sp, #0xF4]
        mov     r12, #0xFF, 12
        mov     r1, r9, lsr #20
        orr     r12, r12, #7, 4
        mov     r9, #0xFF
        mov     lr, lr, lsr #20
        mov     r3, r3, lsr #20
        orr     r9, r9, #3, 24
        add     r12, r12, #2, 14
        str     r2, [sp, #0xB8]
        str     r12, [sp, #0xBC]
        str     r9, [sp, #0x18]
        str     r11, [sp, #0xA4]
        str     r0, [sp, #0xA8]
        str     r1, [sp, #0xAC]
        str     r3, [sp, #0xB0]
        str     lr, [sp, #0xB4]
        str     r8, [sp, #0x58]
        str     r7, [sp, #0x5C]
        str     r6, [sp, #0x60]
        str     r10, [sp, #0x24]
        str     r4, [sp]
        str     r5, [sp, #0x14]
LCZG30:
        ldr     r0, [sp, #0xB4]
        ldr     r1, [sp, #0x18]
        cmp     r1, r0
        bgt     LCZG31
        ldr     r2, [sp, #0xEC]
        ldr     r3, [sp, #0xF0]
        mov     r0, #0xFF
        orr     r1, r0, #3, 24
        mov     r0, #0
        mov     r1, r1, lsl #20
        bl      __divdf3
        str     r0, [sp, #0x3C]
        mov     r0, #1
        str     r1, [sp, #0x38]
        str     r0, [sp, #0x94]
        b       LCZG32
LCZG31:
        ldr     r0, [sp, #0xEC]
        str     r0, [sp, #0x3C]
        ldr     r0, [sp, #0xF0]
        str     r0, [sp, #0x38]
        mov     r0, #0
        str     r0, [sp, #0x94]
LCZG32:
        ldr     r0, [sp, #0xB0]
        ldr     r1, [sp, #0x18]
        cmp     r1, r0
        bgt     LCZG33
        ldr     r2, [sp, #0xA8]
        ldr     r3, [sp, #0xA4]
        mov     r0, #0xFF
        orr     r1, r0, #3, 24
        mov     r0, #0
        mov     r1, r1, lsl #20
        bl      __divdf3
        str     r0, [sp, #0x44]
        mov     r0, #1
        str     r1, [sp, #0x40]
        str     r0, [sp, #0xA0]
        b       LCZG34
LCZG33:
        ldr     r0, [sp, #0xA8]
        str     r0, [sp, #0x44]
        ldr     r0, [sp, #0xA4]
        str     r0, [sp, #0x40]
        mov     r0, #0
        str     r0, [sp, #0xA0]
LCZG34:
        ldr     r0, [sp, #0xAC]
        ldr     r1, [sp, #0x18]
        cmp     r1, r0
        bgt     LCZG35
        ldr     r2, [sp, #0xF8]
        ldr     r3, [sp, #0xF4]
        mov     r0, #0xFF
        orr     r1, r0, #3, 24
        mov     r0, #0
        mov     r1, r1, lsl #20
        bl      __divdf3
        str     r0, [sp, #0x48]
        mov     r0, #1
        str     r1, [sp, #0x4C]
        str     r0, [sp, #0x9C]
        b       LCZG36
LCZG35:
        ldr     r0, [sp, #0xF8]
        str     r0, [sp, #0x48]
        ldr     r0, [sp, #0xF4]
        str     r0, [sp, #0x4C]
        mov     r0, #0
        str     r0, [sp, #0x9C]
LCZG36:
        ldr     r0, [sp, #0xE0]
        ldr     r1, [sp, #0x18]
        cmp     r1, r0
        bgt     LCZG37
        ldr     r2, [sp, #0xD4]
        ldr     r3, [sp, #0xD8]
        mov     r0, #0xFF
        orr     r1, r0, #3, 24
        mov     r0, #0
        mov     r1, r1, lsl #20
        bl      __divdf3
        str     r0, [sp, #0x54]
        mov     r0, #1
        str     r1, [sp, #0x50]
        str     r0, [sp, #0x98]
        b       LCZG38
        .long   LCZG_x4.3621.0.0.0
        .long   LCZG_x1.3621.0.0.0
        .long   LCZG_x2.3621.0.0.0
        .long   LCZG_x3.3621.0.0.0
        .long   LCZG_x1.3621.0.0.0
        .long   LCZG_x2.3621.0.0.0
        .long   LCZG_x3.3621.0.0.0
        .long   LCZG_x4.3621.0.0.0
        .long   LCZG_pi_2d
LCZG37:
        ldr     r0, [sp, #0xD4]
        str     r0, [sp, #0x54]
        ldr     r0, [sp, #0xD8]
        str     r0, [sp, #0x50]
        mov     r0, #0
        str     r0, [sp, #0x98]
LCZG38:
        ldr     r2, [sp, #0x3C]
        ldr     r3, [sp, #0x38]
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        ldr     r2, [sp, #0x44]
        ldr     r3, [sp, #0x40]
        mov     r8, r1
        mov     r5, r0
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        ldr     r2, [sp, #0x48]
        ldr     r3, [sp, #0x4C]
        mov     r9, r1
        mov     r4, r0
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        str     r0, [sp, #0xD0]
        ldr     r0, [sp, #0x54]
        mov     r10, r1
        ldr     r1, [sp, #0x50]
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        ldr     r11, [pc, #-0x8C]
        mov     r7, r1
        mov     r6, r0
        mov     r2, r5
        ldr     r12, [r11, #0x10]
        mov     r3, r8
        str     r12, [sp, #0xCC]
        ldr     r12, [r11, #0x14]
        ldr     r0, [sp, #0xCC]
        str     r12, [sp, #0xC8]
        ldr     r12, [r11, #0x28]
        ldr     r1, [sp, #0xC8]
        str     r12, [sp, #0xC4]
        ldr     r12, [r11, #0x2C]
        str     r12, [sp, #0xC0]
        ldr     r12, [r11, #0x48]
        str     r12, [sp, #0x88]
        ldr     r12, [r11, #0x4C]
        str     r12, [sp, #0x84]
        ldr     r12, [r11, #0x40]
        str     r12, [sp, #0x78]
        ldr     r12, [r11, #0x44]
        str     r12, [sp, #0x6C]
        ldr     r12, [r11, #0x38]
        str     r12, [sp, #0x68]
        ldr     r12, [r11, #0x3C]
        str     r12, [sp, #0x64]
        ldr     r12, [r11, #0x30]
        str     r12, [sp, #0x34]
        ldr     r12, [r11, #0x34]
        str     r12, [sp, #0x30]
        ldr     r12, [r11, #0x20]
        str     r12, [sp, #0x2C]
        ldr     r12, [r11, #0x24]
        str     r12, [sp, #0x28]
        ldr     r12, [r11, #0x18]
        str     r12, [sp, #0x20]
        ldr     r12, [r11, #0x1C]
        str     r12, [sp, #0x1C]
        bl      __muldf3
        ldr     r2, [sp, #0x20]
        ldr     r3, [sp, #0x1C]
        bl      __adddf3
        mov     r2, r5
        mov     r3, r8
        bl      __muldf3
        ldr     r3, [sp, #0x28]
        ldr     r2, [sp, #0x2C]
        bl      __adddf3
        mov     r2, r5
        mov     r3, r8
        bl      __muldf3
        ldr     r3, [sp, #0xC0]
        ldr     r2, [sp, #0xC4]
        bl      __adddf3
        mov     r3, r8
        mov     r2, r5
        bl      __muldf3
        ldr     r3, [sp, #0x30]
        ldr     r2, [sp, #0x34]
        bl      __adddf3
        mov     r3, r8
        mov     r2, r5
        bl      __muldf3
        ldr     r2, [sp, #0x68]
        ldr     r3, [sp, #0x64]
        bl      __adddf3
        mov     r3, r8
        mov     r2, r5
        bl      __muldf3
        ldr     r2, [sp, #0x78]
        ldr     r3, [sp, #0x6C]
        bl      __adddf3
        mov     r2, r5
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [sp, #0x88]
        ldr     r3, [sp, #0x84]
        bl      __adddf3
        ldr     r2, [sp, #0x3C]
        ldr     r3, [sp, #0x38]
        bl      __muldf3
        str     r0, [sp, #0x90]
        ldr     r0, [sp, #0xCC]
        str     r1, [sp, #0x8C]
        ldr     r1, [sp, #0xC8]
        mov     r2, r4
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #0x20]
        ldr     r3, [sp, #0x1C]
        bl      __adddf3
        mov     r2, r4
        mov     r3, r9
        bl      __muldf3
        ldr     r3, [sp, #0x28]
        ldr     r2, [sp, #0x2C]
        bl      __adddf3
        mov     r2, r4
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #0xC4]
        ldr     r3, [sp, #0xC0]
        bl      __adddf3
        mov     r3, r9
        mov     r2, r4
        bl      __muldf3
        ldr     r2, [sp, #0x34]
        ldr     r3, [sp, #0x30]
        bl      __adddf3
        mov     r3, r9
        mov     r2, r4
        bl      __muldf3
        ldr     r2, [sp, #0x68]
        ldr     r3, [sp, #0x64]
        bl      __adddf3
        mov     r3, r9
        mov     r2, r4
        bl      __muldf3
        ldr     r3, [sp, #0x6C]
        ldr     r2, [sp, #0x78]
        bl      __adddf3
        mov     r3, r9
        mov     r2, r4
        bl      __muldf3
        ldr     r2, [sp, #0x88]
        ldr     r3, [sp, #0x84]
        bl      __adddf3
        ldr     r2, [sp, #0x44]
        ldr     r3, [sp, #0x40]
        bl      __muldf3
        ldr     r2, [sp, #0xD0]
        str     r0, [sp, #0x7C]
        ldr     r0, [sp, #0xCC]
        str     r1, [sp, #0x80]
        ldr     r1, [sp, #0xC8]
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0x20]
        ldr     r3, [sp, #0x1C]
        bl      __adddf3
        ldr     r2, [sp, #0xD0]
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0x2C]
        ldr     r3, [sp, #0x28]
        bl      __adddf3
        ldr     r2, [sp, #0xD0]
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0xC4]
        ldr     r3, [sp, #0xC0]
        bl      __adddf3
        ldr     r2, [sp, #0xD0]
        mov     r3, r10
        bl      __muldf3
        ldr     r3, [sp, #0x30]
        ldr     r2, [sp, #0x34]
        bl      __adddf3
        ldr     r2, [sp, #0xD0]
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0x68]
        ldr     r3, [sp, #0x64]
        bl      __adddf3
        ldr     r2, [sp, #0xD0]
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0x78]
        ldr     r3, [sp, #0x6C]
        bl      __adddf3
        ldr     r2, [sp, #0xD0]
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0x88]
        ldr     r3, [sp, #0x84]
        bl      __adddf3
        ldr     r2, [sp, #0x48]
        ldr     r3, [sp, #0x4C]
        bl      __muldf3
        str     r0, [sp, #0x74]
        ldr     r0, [sp, #0xCC]
        str     r1, [sp, #0x70]
        ldr     r1, [sp, #0xC8]
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        ldr     r2, [sp, #0x20]
        ldr     r3, [sp, #0x1C]
        bl      __adddf3
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        ldr     r2, [sp, #0x2C]
        ldr     r3, [sp, #0x28]
        bl      __adddf3
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        ldr     r3, [sp, #0xC0]
        ldr     r2, [sp, #0xC4]
        bl      __adddf3
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        ldr     r3, [sp, #0x30]
        ldr     r2, [sp, #0x34]
        bl      __adddf3
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        ldr     r2, [sp, #0x68]
        ldr     r3, [sp, #0x64]
        bl      __adddf3
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        ldr     r2, [sp, #0x78]
        ldr     r3, [sp, #0x6C]
        bl      __adddf3
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        ldr     r2, [sp, #0x88]
        ldr     r3, [sp, #0x84]
        bl      __adddf3
        ldr     r2, [sp, #0x54]
        ldr     r3, [sp, #0x50]
        bl      __muldf3
        ldr     r12, [r11, #0x50]
        mov     r2, r5
        str     r12, [sp, #0xC8]
        ldr     r12, [r11, #0x54]
        mov     r3, r8
        str     r12, [sp, #0xC4]
        ldr     r12, [r11, #0x88]
        str     r12, [sp, #0xC0]
        ldr     r12, [r11, #0x8C]
        str     r12, [sp, #0x88]
        ldr     r12, [r11, #0x80]
        str     r12, [sp, #0x84]
        ldr     r12, [r11, #0x84]
        str     r12, [sp, #0x78]
        ldr     r12, [r11, #0x78]
        str     r12, [sp, #0x6C]
        ldr     r12, [r11, #0x7C]
        str     r12, [sp, #0x34]
        ldr     r12, [r11, #0x70]
        str     r12, [sp, #0x30]
        ldr     r12, [r11, #0x74]
        str     r12, [sp, #0x2C]
        ldr     r12, [r11, #0x68]
        str     r12, [sp, #0x28]
        ldr     r12, [r11, #0x6C]
        str     r12, [sp, #8]
        ldr     r12, [r11, #0x60]
        str     r12, [sp, #4]
        ldr     r12, [r11, #0x64]
        str     r12, [sp, #0xFC]
        ldr     r12, [r11, #0x58]
        str     r12, [sp, #0x100]
        ldr     r11, [r11, #0x5C]
        str     r0, [sp, #0x68]
        str     r1, [sp, #0x64]
        ldr     r0, [sp, #0xC8]
        ldr     r1, [sp, #0xC4]
        str     r11, [sp, #0x104]
        bl      __muldf3
        ldr     r2, [sp, #0x100]
        ldr     r3, [sp, #0x104]
        bl      __adddf3
        mov     r3, r8
        mov     r2, r5
        bl      __muldf3
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #0xFC]
        bl      __adddf3
        mov     r2, r5
        mov     r3, r8
        bl      __muldf3
        ldr     r3, [sp, #8]
        ldr     r2, [sp, #0x28]
        bl      __adddf3
        mov     r2, r5
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [sp, #0x30]
        ldr     r3, [sp, #0x2C]
        bl      __adddf3
        mov     r2, r5
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [sp, #0x6C]
        ldr     r3, [sp, #0x34]
        bl      __adddf3
        mov     r3, r8
        mov     r2, r5
        bl      __muldf3
        ldr     r2, [sp, #0x84]
        ldr     r3, [sp, #0x78]
        bl      __adddf3
        mov     r3, r8
        mov     r2, r5
        bl      __muldf3
        ldr     r2, [sp, #0xC0]
        ldr     r3, [sp, #0x88]
        bl      __adddf3
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #0xC8]
        str     r1, [sp, #0x1C]
        ldr     r1, [sp, #0xC4]
        mov     r2, r4
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #0x100]
        ldr     r3, [sp, #0x104]
        bl      __adddf3
        mov     r2, r4
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #0xFC]
        bl      __adddf3
        mov     r2, r4
        mov     r3, r9
        bl      __muldf3
        ldr     r3, [sp, #8]
        ldr     r2, [sp, #0x28]
        bl      __adddf3
        mov     r2, r4
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #0x30]
        ldr     r3, [sp, #0x2C]
        bl      __adddf3
        mov     r3, r9
        mov     r2, r4
        bl      __muldf3
        ldr     r2, [sp, #0x6C]
        ldr     r3, [sp, #0x34]
        bl      __adddf3
        mov     r2, r4
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #0x84]
        ldr     r3, [sp, #0x78]
        bl      __adddf3
        mov     r3, r9
        mov     r2, r4
        bl      __muldf3
        ldr     r2, [sp, #0xC0]
        ldr     r3, [sp, #0x88]
        bl      __adddf3
        ldr     r2, [sp, #0xD0]
        mov     r8, r0
        ldr     r0, [sp, #0xC8]
        str     r8, [sp, #0x10]
        mov     r9, r1
        ldr     r1, [sp, #0xC4]
        str     r9, [sp, #0xC]
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0x100]
        ldr     r3, [sp, #0x104]
        bl      __adddf3
        ldr     r2, [sp, #0xD0]
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #0xFC]
        bl      __adddf3
        ldr     r2, [sp, #0xD0]
        mov     r3, r10
        bl      __muldf3
        ldr     r3, [sp, #8]
        ldr     r2, [sp, #0x28]
        bl      __adddf3
        ldr     r2, [sp, #0xD0]
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0x30]
        ldr     r3, [sp, #0x2C]
        bl      __adddf3
        ldr     r2, [sp, #0xD0]
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0x6C]
        ldr     r3, [sp, #0x34]
        bl      __adddf3
        ldr     r2, [sp, #0xD0]
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0x84]
        ldr     r3, [sp, #0x78]
        bl      __adddf3
        ldr     r2, [sp, #0xD0]
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0xC0]
        ldr     r3, [sp, #0x88]
        bl      __adddf3
        mov     r5, r0
        mov     r4, r1
        ldr     r0, [sp, #0xC8]
        ldr     r1, [sp, #0xC4]
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        ldr     r2, [sp, #0x100]
        ldr     r3, [sp, #0x104]
        bl      __adddf3
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #0xFC]
        bl      __adddf3
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        ldr     r3, [sp, #8]
        ldr     r2, [sp, #0x28]
        bl      __adddf3
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        ldr     r2, [sp, #0x30]
        ldr     r3, [sp, #0x2C]
        bl      __adddf3
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        ldr     r2, [sp, #0x6C]
        ldr     r3, [sp, #0x34]
        bl      __adddf3
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        ldr     r2, [sp, #0x84]
        ldr     r3, [sp, #0x78]
        bl      __adddf3
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        ldr     r2, [sp, #0xC0]
        ldr     r3, [sp, #0x88]
        bl      __adddf3
        str     r0, [sp, #8]
        str     r1, [sp, #4]
        ldr     r0, [sp, #0x20]
        ldr     r1, [sp, #0x1C]
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        mov     r9, r0
        mov     r8, r1
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #4]
        bl      __muldf3
        mov     r3, r1
        mov     r12, #0xFF, 12
        mov     r2, r0
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __divdf3
        ldr     r10, [sp, #0xB8]
        ldr     r12, [sp, #0x60]
        mov     r7, r0
        mov     r6, r1
        str     r10, [sp, #0x6C]
        ldr     r10, [sp, #0xE4]
        str     r12, [sp, #0x2C]
        ldr     r12, [sp, #0x24]
        str     r10, [sp, #0x78]
        ldr     r10, [sp, #0xE8]
        subs    lr, r12, #1
        str     lr, [sp, #0x60]
        str     r10, [sp, #0x84]
        ldr     r10, [sp, #0xDC]
        str     r12, [sp, #0x30]
        str     r10, [sp, #0x88]
        ldr     r10, [sp, #0x5C]
        str     r10, [sp, #0x28]
        ldr     r10, [sp, #0x58]
        str     r10, [sp, #0x34]
        bmi     LCZG43
        ldr     lr, [sp, #0x60]
        ldr     r12, [sp]
        ldr     r10, [sp, #0x14]
        str     r9, [sp, #0xC8]
        str     r4, [sp, #0xCC]
        str     r5, [sp, #0xD0]
        ldr     r0, [sp, #0xBC]
        ldr     r4, [sp, #0x18]
        ldr     r5, [pc, #-0x850]
        ldr     r9, [sp, #0x60]
        add     r12, r12, lr, lsl #3
        add     lr, r10, lr, lsl #3
        str     r7, [sp, #0xC0]
        str     r8, [sp, #0xC4]
        mov     r2, #0
LCZG39:
        ldr     r7, [lr, #4]
        ldr     r8, [lr]
        mov     r1, #0xFF, 12
        orr     r1, r1, #3, 4
        add     r1, r1, #1, 2
        mov     r3, r7, lsr #24
        and     r1, r7, r1
        str     r8, [sp, #0x120]
        mov     r10, r1, lsr #20
        and     r3, r3, #0x80
        cmp     r10, r4, lsl #1
        str     r7, [sp, #0x124]
        mov     r11, r3, lsr #7
        ble     LCZG65
        mvn     r1, #0xFE, 14
        bic     r1, r1, #0x3F, 6
        bic     r1, r7, r1
        cmn     r1, #2, 14
        bne     LCZG40
        str     r2, [sp, #0x120]
        ldr     r7, [sp, #0x124]
        mov     r8, #0
        str     r8, [r12]
        str     r7, [r12, #4]
        b       LCZG42
LCZG40:
        cmp     r0, r1
        bne     LCZG41
        str     r2, [sp, #0x120]
        ldr     r7, [sp, #0x124]
        mov     r8, #0
        str     r8, [r12]
        str     r7, [r12, #4]
        b       LCZG42
LCZG41:
        add     r3, r5, r11, lsl #3
        ldr     r1, [r5, +r11, lsl #3]
        ldr     r3, [r3, #4]
        str     r1, [r12]
        str     r3, [r12, #4]
LCZG42:
        subs    r9, r9, #1
        sub     r12, r12, #8
        sub     lr, lr, #8
        bpl     LCZG39
        str     r7, [sp, #0xF0]
        str     r8, [sp, #0xEC]
        str     r9, [sp, #0x60]
        ldr     r7, [sp, #0xC0]
        ldr     r8, [sp, #0xC4]
        ldr     r9, [sp, #0xC8]
        ldr     r4, [sp, #0xCC]
        ldr     r5, [sp, #0xD0]
        str     r11, [sp, #0xB8]
        str     r10, [sp, #0xB4]
LCZG43:
        ldr     r12, [sp, #0x60]
        subs    r12, r12, #1
        str     r12, [sp, #0x5C]
        bmi     LCZG48
        ldr     lr, [sp, #0x5C]
        ldr     r12, [sp]
        ldr     r10, [sp, #0x14]
        str     r9, [sp, #0xC8]
        str     r4, [sp, #0xCC]
        str     r5, [sp, #0xD0]
        ldr     r0, [sp, #0xBC]
        ldr     r4, [sp, #0x18]
        ldr     r5, [pc, #-0x96C]
        ldr     r9, [sp, #0x5C]
        add     r12, r12, lr, lsl #3
        add     lr, r10, lr, lsl #3
        str     r7, [sp, #0xC0]
        str     r8, [sp, #0xC4]
        mov     r2, #0
LCZG44:
        ldr     r7, [lr, #4]
        ldr     r8, [lr]
        mov     r1, #0xFF, 12
        orr     r1, r1, #3, 4
        add     r1, r1, #1, 2
        mov     r3, r7, lsr #24
        and     r1, r7, r1
        str     r8, [sp, #0x118]
        mov     r10, r1, lsr #20
        and     r3, r3, #0x80
        cmp     r10, r4, lsl #1
        str     r7, [sp, #0x11C]
        mov     r11, r3, lsr #7
        ble     LCZG64
        mvn     r1, #0xFE, 14
        bic     r1, r1, #0x3F, 6
        bic     r1, r7, r1
        cmn     r1, #2, 14
        bne     LCZG45
        str     r2, [sp, #0x118]
        ldr     r7, [sp, #0x11C]
        mov     r8, #0
        str     r8, [r12]
        str     r7, [r12, #4]
        b       LCZG47
LCZG45:
        cmp     r0, r1
        bne     LCZG46
        str     r2, [sp, #0x118]
        ldr     r7, [sp, #0x11C]
        mov     r8, #0
        str     r8, [r12]
        str     r7, [r12, #4]
        b       LCZG47
LCZG46:
        add     r3, r5, r11, lsl #3
        ldr     r1, [r5, +r11, lsl #3]
        ldr     r3, [r3, #4]
        str     r1, [r12]
        str     r3, [r12, #4]
LCZG47:
        subs    r9, r9, #1
        sub     r12, r12, #8
        sub     lr, lr, #8
        bpl     LCZG44
        str     r7, [sp, #0xA4]
        str     r8, [sp, #0xA8]
        str     r9, [sp, #0x5C]
        ldr     r7, [sp, #0xC0]
        ldr     r8, [sp, #0xC4]
        ldr     r9, [sp, #0xC8]
        ldr     r4, [sp, #0xCC]
        ldr     r5, [sp, #0xD0]
        str     r11, [sp, #0xE4]
        str     r10, [sp, #0xB0]
LCZG48:
        ldr     r12, [sp, #0x5C]
        subs    r12, r12, #1
        str     r12, [sp, #0x58]
        bmi     LCZG53
        ldr     lr, [sp, #0x58]
        ldr     r12, [sp]
        ldr     r10, [sp, #0x14]
        str     r9, [sp, #0xC8]
        str     r4, [sp, #0xCC]
        str     r5, [sp, #0xD0]
        ldr     r0, [sp, #0xBC]
        ldr     r4, [sp, #0x18]
        ldr     r5, [pc, #-0xA88]
        ldr     r9, [sp, #0x58]
        add     r12, r12, lr, lsl #3
        add     lr, r10, lr, lsl #3
        str     r7, [sp, #0xC0]
        str     r8, [sp, #0xC4]
        mov     r2, #0
LCZG49:
        ldr     r7, [lr, #4]
        ldr     r8, [lr]
        mov     r1, #0xFF, 12
        orr     r1, r1, #3, 4
        add     r1, r1, #1, 2
        mov     r3, r7, lsr #24
        and     r1, r7, r1
        str     r8, [sp, #0x110]
        mov     r10, r1, lsr #20
        and     r3, r3, #0x80
        cmp     r10, r4, lsl #1
        str     r7, [sp, #0x114]
        mov     r11, r3, lsr #7
        ble     LCZG63
        mvn     r1, #0xFE, 14
        bic     r1, r1, #0x3F, 6
        bic     r1, r7, r1
        cmn     r1, #2, 14
        bne     LCZG50
        str     r2, [sp, #0x110]
        ldr     r7, [sp, #0x114]
        mov     r8, #0
        str     r8, [r12]
        str     r7, [r12, #4]
        b       LCZG52
LCZG50:
        cmp     r0, r1
        bne     LCZG51
        str     r2, [sp, #0x110]
        ldr     r7, [sp, #0x114]
        mov     r8, #0
        str     r8, [r12]
        str     r7, [r12, #4]
        b       LCZG52
LCZG51:
        add     r3, r5, r11, lsl #3
        ldr     r1, [r5, +r11, lsl #3]
        ldr     r3, [r3, #4]
        str     r1, [r12]
        str     r3, [r12, #4]
LCZG52:
        subs    r9, r9, #1
        sub     r12, r12, #8
        sub     lr, lr, #8
        bpl     LCZG49
        str     r7, [sp, #0xF4]
        str     r8, [sp, #0xF8]
        str     r9, [sp, #0x58]
        ldr     r7, [sp, #0xC0]
        ldr     r8, [sp, #0xC4]
        ldr     r9, [sp, #0xC8]
        ldr     r4, [sp, #0xCC]
        ldr     r5, [sp, #0xD0]
        str     r11, [sp, #0xE8]
        str     r10, [sp, #0xAC]
LCZG53:
        ldr     r12, [sp, #0x58]
        subs    r12, r12, #1
        str     r12, [sp, #0x24]
        bmi     LCZG58
        ldr     lr, [sp, #0x24]
        ldr     r12, [sp]
        ldr     r10, [sp, #0x14]
        str     r8, [sp, #0xC4]
        str     r9, [sp, #0xC8]
        str     r5, [sp, #0xD0]
        ldr     r5, [sp, #0xBC]
        ldr     r8, [sp, #0x18]
        ldr     r9, [pc, #-0xBA4]
        ldr     r1, [sp, #0x24]
        add     r12, r12, lr, lsl #3
        str     r7, [sp, #0xC0]
        add     lr, r10, lr, lsl #3
        str     r4, [sp, #0xCC]
        mov     r7, #0
LCZG54:
        ldr     r10, [lr, #4]
        ldr     r11, [lr]
        mov     r4, #0xFF
        orr     r4, r4, #3, 24
        mov     r2, r10, lsr #24
        str     r11, [sp, #0x108]
        mov     r4, r4, lsl #20
        add     r4, r4, #1, 2
        and     r0, r10, r4
        and     r2, r2, #0x80
        mov     r0, r0, lsr #20
        cmp     r0, r8, lsl #1
        str     r10, [sp, #0x10C]
        mov     r2, r2, lsr #7
        ble     LCZG66
        mvn     r4, #0xFE, 14
        bic     r4, r4, #0x3F, 6
        bic     r4, r10, r4
        cmn     r4, #2, 14
        bne     LCZG55
        str     r7, [sp, #0x108]
        ldr     r10, [sp, #0x10C]
        mov     r11, #0
        str     r11, [r12]
        str     r10, [r12, #4]
        b       LCZG57
LCZG55:
        cmp     r5, r4
        bne     LCZG56
        str     r7, [sp, #0x108]
        ldr     r10, [sp, #0x10C]
        mov     r11, #0
        str     r11, [r12]
        str     r10, [r12, #4]
        b       LCZG57
LCZG56:
        add     r3, r9, r2, lsl #3
        ldr     r4, [r9, +r2, lsl #3]
        ldr     r3, [r3, #4]
        str     r4, [r12]
        str     r3, [r12, #4]
LCZG57:
        subs    r1, r1, #1
        sub     r12, r12, #8
        sub     lr, lr, #8
        bpl     LCZG54
        ldr     r7, [sp, #0xC0]
        ldr     r8, [sp, #0xC4]
        ldr     r9, [sp, #0xC8]
        ldr     r4, [sp, #0xCC]
        ldr     r5, [sp, #0xD0]
        str     r0, [sp, #0xE0]
        str     r2, [sp, #0xDC]
        str     r10, [sp, #0xD8]
        str     r11, [sp, #0xD4]
        str     r1, [sp, #0x24]
LCZG58:
        mov     r0, r5
        mov     r1, r4
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #4]
        bl      __muldf3
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        mov     r11, r0
        mov     r10, r1
        mov     r2, r9
        mov     r3, r8
        mov     r0, r7
        mov     r1, r6
        bl      __muldf3
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0xC]
        mov     r6, r0
        mov     r7, r1
        mov     r0, r11
        mov     r1, r10
        bl      __muldf3
        ldr     r2, [sp, #0x90]
        ldr     r3, [sp, #0x8C]
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x3C]
        mov     r3, r1
        ldr     r1, [sp, #0x38]
        bl      __subdf3
        ldr     r2, [sp, #0x20]
        ldr     r3, [sp, #0x1C]
        str     r0, [sp, #0xC]
        str     r1, [sp, #0x10]
        mov     r0, r11
        mov     r1, r10
        bl      __muldf3
        ldr     r2, [sp, #0x7C]
        ldr     r3, [sp, #0x80]
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x44]
        mov     r3, r1
        ldr     r1, [sp, #0x40]
        bl      __subdf3
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #4]
        mov     r11, r0
        mov     r10, r1
        mov     r0, r6
        mov     r1, r7
        bl      __muldf3
        ldr     r2, [sp, #0x74]
        ldr     r3, [sp, #0x70]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [sp, #0x48]
        ldr     r1, [sp, #0x4C]
        bl      __subdf3
        mov     r9, r0
        mov     r8, r1
        mov     r2, r5
        mov     r3, r4
        mov     r0, r6
        mov     r1, r7
        bl      __muldf3
        ldr     r2, [sp, #0x68]
        ldr     r3, [sp, #0x64]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [sp, #0x54]
        ldr     r1, [sp, #0x50]
        bl      __subdf3
        ldr     r12, [sp, #0x94]
        mov     r4, r0
        mov     r5, r1
        cmp     r12, #0
        beq     LCZG59
        ldr     lr, [sp, #0x6C]
        ldr     r6, [pc, #-0xDD8]
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #0x10]
        add     r12, r6, lr, lsl #3
        ldr     r0, [r6, +lr, lsl #3]
        ldr     r1, [r12, #4]
        bl      __subdf3
        str     r0, [sp, #0xC]
        str     r1, [sp, #0x10]
LCZG59:
        ldr     r12, [sp, #0xA0]
        cmp     r12, #0
        beq     LCZG60
        ldr     lr, [sp, #0x78]
        ldr     r6, [pc, #-0xE0C]
        mov     r2, r11
        mov     r3, r10
        add     r12, r6, lr, lsl #3
        ldr     r0, [r6, +lr, lsl #3]
        ldr     r1, [r12, #4]
        bl      __subdf3
        mov     r11, r0
        mov     r10, r1
LCZG60:
        ldr     r12, [sp, #0x9C]
        cmp     r12, #0
        beq     LCZG61
        ldr     lr, [sp, #0x84]
        ldr     r6, [pc, #-0xE40]
        mov     r2, r9
        mov     r3, r8
        add     r12, r6, lr, lsl #3
        ldr     r0, [r6, +lr, lsl #3]
        ldr     r1, [r12, #4]
        bl      __subdf3
        mov     r9, r0
        mov     r8, r1
LCZG61:
        ldr     r12, [sp, #0x98]
        cmp     r12, #0
        beq     LCZG62
        ldr     lr, [sp, #0x88]
        ldr     r6, [pc, #-0xE74]
        mov     r2, r4
        mov     r3, r5
        add     r12, r6, lr, lsl #3
        ldr     r0, [r6, +lr, lsl #3]
        ldr     r1, [r12, #4]
        bl      __subdf3
        mov     r4, r0
        mov     r5, r1
LCZG62:
        ldr     lr, [sp, #0x2C]
        ldr     r6, [sp, #0xC]
        ldr     r12, [sp]
        str     r6, [r12, +lr, lsl #3]
        ldr     r6, [sp, #0x10]
        add     lr, r12, lr, lsl #3
        str     r6, [lr, #4]
        ldr     lr, [sp, #0x28]
        str     r11, [r12, +lr, lsl #3]
        add     lr, r12, lr, lsl #3
        str     r10, [lr, #4]
        ldr     lr, [sp, #0x34]
        str     r9, [r12, +lr, lsl #3]
        add     lr, r12, lr, lsl #3
        str     r8, [lr, #4]
        ldr     lr, [sp, #0x30]
        str     r4, [r12, +lr, lsl #3]
        ldr     r0, [sp, #0x24]
        add     lr, r12, lr, lsl #3
        str     r5, [lr, #4]
        cmp     r0, #0
        bge     LCZG30
        ldr     r8, [sp, #0x58]
        ldr     r7, [sp, #0x5C]
        ldr     r6, [sp, #0x60]
        ldr     r4, [sp]
        b       LCZG27
LCZG63:
        str     r7, [sp, #0xF4]
        str     r8, [sp, #0xF8]
        str     r9, [sp, #0x58]
        ldr     r7, [sp, #0xC0]
        ldr     r8, [sp, #0xC4]
        ldr     r9, [sp, #0xC8]
        ldr     r4, [sp, #0xCC]
        ldr     r5, [sp, #0xD0]
        str     r11, [sp, #0xE8]
        str     r10, [sp, #0xAC]
        b       LCZG53
LCZG64:
        str     r7, [sp, #0xA4]
        str     r8, [sp, #0xA8]
        str     r9, [sp, #0x5C]
        ldr     r7, [sp, #0xC0]
        ldr     r8, [sp, #0xC4]
        ldr     r9, [sp, #0xC8]
        ldr     r4, [sp, #0xCC]
        ldr     r5, [sp, #0xD0]
        str     r11, [sp, #0xE4]
        str     r10, [sp, #0xB0]
        b       LCZG48
LCZG65:
        str     r7, [sp, #0xF0]
        str     r8, [sp, #0xEC]
        str     r9, [sp, #0x60]
        ldr     r7, [sp, #0xC0]
        ldr     r8, [sp, #0xC4]
        ldr     r9, [sp, #0xC8]
        ldr     r4, [sp, #0xCC]
        ldr     r5, [sp, #0xD0]
        str     r11, [sp, #0xB8]
        str     r10, [sp, #0xB4]
        b       LCZG43
LCZG66:
        ldr     r7, [sp, #0xC0]
        ldr     r8, [sp, #0xC4]
        ldr     r9, [sp, #0xC8]
        ldr     r4, [sp, #0xCC]
        ldr     r5, [sp, #0xD0]
        str     r0, [sp, #0xE0]
        str     r2, [sp, #0xDC]
        str     r10, [sp, #0xD8]
        str     r11, [sp, #0xD4]
        str     r1, [sp, #0x24]
        b       LCZG58
LCZG67:
        str     r4, [sp, #0xE8]
        mov     r12, r3
        ldr     r6, [sp, #0x60]
        ldr     r4, [sp]
        ldr     r5, [sp, #0x14]
        ldr     r9, [sp, #0xC8]
        ldr     r3, [sp, #0xD0]
        ldr     lr, [sp, #0xC4]
        b       LCZG22
LCZG68:
        str     r12, [sp, #0xE4]
        mov     r3, r4
        ldr     r4, [sp]
        ldr     r5, [sp, #0x14]
        ldr     r9, [sp, #0xC8]
        ldr     r12, [sp, #0xCC]
        ldr     lr, [sp, #0xC4]
        b       LCZG17
LCZG69:
        ldr     r9, [sp, #0xC8]
        ldr     r12, [sp, #0xCC]
        ldr     r3, [sp, #0xD0]
        b       LCZG12
LCZG70:
        mvn     r0, #7
        add     sp, sp, #0x4A, 30
        ldmia   sp!, {r4 - r11, pc}


        .data
        .align  4


LCZG_x1.3621.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LCZG_x2.3621.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LCZG_x3.3621.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LCZG_x4.3621.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00


        .data
        .align  4


LCZG_pi_2d:
        .byte   0x18,0x2D,0x44,0x54,0xFB,0x21,0xF9,0x3F,0x18,0x2D,0x44,0x54,0xFB,0x21,0xF9,0xBF
LCZG_d_P:
        .byte   0xDA,0xFA,0x18,0x09,0x1C,0x36,0x01,0x3F,0xB6,0x3E,0x69,0xC8,0x73,0xA5,0x57,0x3F
        .byte   0xCF,0xEF,0xC1,0x51,0xF2,0x10,0x91,0x3F,0xE0,0x54,0x79,0x13,0x1F,0xD1,0xB3,0x3F
        .byte   0xFF,0x0D,0x9B,0xF6,0x96,0x50,0xC5,0x3F,0xE9,0xEB,0x7D,0xA1,0x4C,0x33,0xC5,0x3F
        .byte   0xA0,0x59,0x49,0x65,0x52,0x80,0xAF,0x3F,0x91,0x93,0xD2,0x46,0xBC,0x68,0xE1,0x3B
LCZG_d_Q:
        .byte   0xCF,0xA9,0xA6,0x51,0x52,0xCE,0x02,0x3F,0xC4,0x6D,0xED,0x8C,0x78,0x6C,0x5F,0x3F
        .byte   0x84,0xA9,0xE4,0xB0,0x26,0x6C,0x9C,0x3F,0xA1,0x2D,0x62,0x93,0x5D,0x8D,0xC5,0x3F
        .byte   0x72,0x02,0x0E,0x02,0xC3,0x23,0xE0,0x3F,0x7C,0xD5,0x8B,0xF7,0x0A,0x1F,0xE9,0x3F
        .byte   0xFB,0x4A,0x50,0xF1,0xB5,0x71,0xE3,0x3F,0x38,0x03,0xF7,0xCB,0x3D,0xA0,0xC7,0x3F


