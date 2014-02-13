        .text
        .align  4
        .globl  _ippsThreshold_LTInv_64f_I


_ippsThreshold_LTInv_64f_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x3C
        mov     r6, r0
        cmp     r6, #0
        mov     r4, r1
        mov     r9, r2
        mov     r8, r3
        beq     LBMJ28
        cmp     r4, #0
        ble     LBMJ29
        mov     r0, r9
        mov     r1, r8
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        blt     LBMJ9
        mov     r0, r9
        mov     r1, r8
        mov     r2, #0
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        mov     r7, #0
        beq     LBMJ11
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        mov     r2, r9
        mov     r3, r8
        bl      __divdf3
        str     r1, [sp, #0xC]
        eor     r1, r1, #2, 2
        subs    r12, r4, #2
        str     r0, [sp, #0x18]
        str     r1, [sp, #8]
        bmi     LBMJ5
        add     r10, r6, #8
        mov     r5, r6
        str     r12, [sp, #0x1C]
        str     r7, [sp, #0x20]
        str     r4, [sp, #4]
        str     r6, [sp]
LBMJ0:
        ldr     r11, [r5, #4]
        ldr     r7, [r5]
        ldr     r4, [r10]
        ldr     r6, [r10, #4]
        bic     r1, r11, #2, 2
        mov     r0, r7
        mov     r2, r9
        mov     r3, r8
        bl      __gtdf2
        cmp     r0, #0
        ble     LBMJ2
        bic     r1, r6, #2, 2
        mov     r0, r4
        mov     r2, r9
        mov     r3, r8
        bl      __gtdf2
        cmp     r0, #0
        ble     LBMJ1
        mov     r0, r7
        mov     r1, r11
        mov     r2, r4
        mov     r3, r6
        bl      __muldf3
        mov     r3, r1
        mov     r12, #0xFF, 12
        mov     r2, r0
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __divdf3
        str     r0, [sp, #0x14]
        str     r1, [sp, #0x10]
        mov     r2, #0
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        beq     LBMJ10
        ldr     r0, [sp, #0x14]
        ldr     r1, [sp, #0x10]
        mov     r2, r4
        mov     r3, r6
        bl      __muldf3
        str     r0, [r5]
        str     r1, [r5, #4]
        ldr     r0, [sp, #0x14]
        ldr     r1, [sp, #0x10]
        mov     r2, r7
        mov     r3, r11
        bl      __muldf3
        str     r0, [r10]
        str     r1, [r10, #4]
        b       LBMJ4
LBMJ1:
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        mov     r2, r7
        mov     r3, r11
        bl      __divdf3
        str     r0, [r5]
        str     r1, [r5, #4]
        mov     r0, r4
        mov     r1, r6
        mov     r2, #0
        mov     r3, #0
        bl      __gedf2
        cmp     r0, #0
        ldrlt   r12, [sp, #8]
        ldrge   r12, [sp, #0xC]
        str     r12, [r10, #4]
        ldr     r12, [sp, #0x18]
        str     r12, [r10]
        b       LBMJ4
LBMJ2:
        mov     r0, r7
        mov     r1, r11
        mov     r2, #0
        mov     r3, #0
        bl      __gedf2
        cmp     r0, #0
        ldrlt   r12, [sp, #8]
        ldrge   r12, [sp, #0xC]
        ldr     lr, [sp, #0x18]
        bic     r1, r6, #2, 2
        str     r12, [r5, #4]
        str     lr, [r5]
        mov     r0, r4
        mov     r2, r9
        mov     r3, r8
        bl      __gtdf2
        cmp     r0, #0
        ble     LBMJ3
        mov     r2, r4
        mov     r3, r6
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __divdf3
        str     r0, [r10]
        str     r1, [r10, #4]
        b       LBMJ4
LBMJ3:
        mov     r0, r4
        mov     r1, r6
        mov     r2, #0
        mov     r3, #0
        bl      __gedf2
        cmp     r0, #0
        ldrlt   r12, [sp, #8]
        ldrge   r12, [sp, #0xC]
        str     r12, [r10, #4]
        ldr     r12, [sp, #0x18]
        str     r12, [r10]
LBMJ4:
        ldr     r12, [sp, #0x20]
        ldr     lr, [sp, #0x1C]
        add     r10, r10, #0x10
        add     r12, r12, #2
        str     r12, [sp, #0x20]
        cmp     r12, lr
        add     r5, r5, #0x10
        ble     LBMJ0
        ldr     r7, [sp, #0x20]
        ldr     r4, [sp, #4]
        ldr     r6, [sp]
LBMJ5:
        cmp     r7, r4
        mov     r5, #0
        blt     LBMJ6
        mov     r0, r5
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LBMJ6:
        ldr     r4, [r6, +r7, lsl #3]
        mov     r11, r7, lsl #3
        add     r12, r6, r11
        ldr     r10, [r12, #4]
        mov     r2, r9
        mov     r3, r8
        mov     r0, r4
        bic     r1, r10, #2, 2
        bl      __gtdf2
        cmp     r0, #0
        ble     LBMJ7
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        mov     r2, r4
        mov     r3, r10
        bl      __divdf3
        str     r0, [r6, +r7, lsl #3]
        add     r11, r6, r11
        str     r1, [r11, #4]
        mov     r0, r5
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LBMJ7:
        mov     r0, r4
        mov     r1, r10
        mov     r2, #0
        mov     r3, #0
        bl      __gedf2
        cmp     r0, #0
        ldrlt   r1, [sp, #8]
        strlt   r1, [sp, #0xC]
        ldr     r1, [sp, #0x18]
        str     r1, [r6, +r11]
        ldr     r1, [sp, #0xC]
        add     r11, r6, r11
        str     r1, [r11, #4]
LBMJ8:
        mov     r0, r5
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LBMJ9:
        mvn     r0, #0x12
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LBMJ10:
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        str     r1, [sp, #0x38]
        mov     r0, #0
        mov     r2, r7
        mov     r3, r11
        bl      __divdf3
        str     r1, [r5, #4]
        str     r0, [r5]
        ldr     r1, [sp, #0x38]
        mov     r0, #0
        mov     r2, r4
        mov     r3, r6
        bl      __divdf3
        str     r0, [r10]
        str     r1, [r10, #4]
        b       LBMJ4
LBMJ11:
        subs    r2, r4, #4
        movmi   r5, r7
        bmi     LBMJ14
        mov     r5, r7
        add     r10, r6, #8
        add     r9, r6, #0x10
        add     r8, r6, #0x18
        mov     r11, r6
        str     r2, [sp, #0x18]
        str     r5, [sp, #0x1C]
        str     r7, [sp, #0x20]
        str     r4, [sp, #4]
        str     r6, [sp]
LBMJ12:
        ldr     r0, [r11]
        str     r0, [sp, #0xC]
        ldr     r1, [r11, #4]
        str     r1, [sp, #0x10]
        ldr     r2, [r10]
        str     r2, [sp, #8]
        ldr     r3, [r10, #4]
        str     r3, [sp, #0x24]
        ldr     r12, [r8]
        ldr     r6, [r9]
        ldr     r5, [r9, #4]
        str     r12, [sp, #0x38]
        ldr     r4, [r8, #4]
        bl      __muldf3
        ldr     r2, [sp, #0x38]
        str     r0, [sp, #0x2C]
        mov     r7, r1
        str     r7, [sp, #0x30]
        mov     r0, r6
        mov     r1, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [sp, #0x2C]
        str     r0, [sp, #0x34]
        str     r1, [sp, #0x14]
        mov     r3, r7
        bl      __muldf3
        str     r1, [sp, #0x28]
        mov     r7, r0
        mov     r2, #0
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        beq     LBMJ19
        ldr     r3, [sp, #0x28]
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        mov     r2, r7
        mov     r0, #0
        bl      __divdf3
        str     r1, [sp, #0x28]
        mov     r7, r0
        mov     r2, #0
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        beq     LBMJ18
        ldr     r3, [sp, #0x14]
        ldr     r1, [sp, #0x28]
        ldr     r2, [sp, #0x34]
        mov     r0, r7
        bl      __muldf3
        ldr     r3, [sp, #0x30]
        ldr     r2, [sp, #0x2C]
        str     r1, [sp, #0x14]
        ldr     r1, [sp, #0x28]
        str     r0, [sp, #0x34]
        mov     r0, r7
        bl      __muldf3
        str     r0, [sp, #0x30]
        mov     r7, r1
        ldr     r0, [sp, #0x34]
        ldr     r1, [sp, #0x14]
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #0x24]
        bl      __muldf3
        str     r0, [r11]
        str     r1, [r11, #4]
        ldr     r0, [sp, #0x34]
        ldr     r1, [sp, #0x14]
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #0x10]
        bl      __muldf3
        str     r0, [r10]
        str     r1, [r10, #4]
        ldr     r0, [sp, #0x30]
        ldr     r2, [sp, #0x38]
        mov     r1, r7
        mov     r3, r4
        bl      __muldf3
        str     r0, [r9]
        str     r1, [r9, #4]
        ldr     r0, [sp, #0x30]
        mov     r1, r7
        mov     r2, r6
        mov     r3, r5
        bl      __muldf3
        str     r0, [r8]
        str     r1, [r8, #4]
LBMJ13:
        ldr     r0, [sp, #0x20]
        ldr     r1, [sp, #0x18]
        add     r8, r8, #0x20
        add     r0, r0, #4
        str     r0, [sp, #0x20]
        cmp     r0, r1
        add     r9, r9, #0x20
        add     r10, r10, #0x20
        add     r11, r11, #0x20
        ble     LBMJ12
        ldr     r5, [sp, #0x1C]
        ldr     r7, [sp, #0x20]
        ldr     r4, [sp, #4]
        ldr     r6, [sp]
LBMJ14:
        cmp     r7, r4
        bge     LBMJ8
        ldr     r9, [pc, #0x244]
        mov     r2, #0xFF, 12
        orr     r8, r2, #3, 4
        add     r11, r6, r7, lsl #3
LBMJ15:
        ldr     r10, [r11]
        ldr     r6, [r11, #4]
        mov     r2, #0
        mov     r0, r10
        mov     r3, #0
        mov     r1, r6
        bl      __nedf2
        cmp     r0, #0
        beq     LBMJ17
        mov     r1, r8
        mov     r2, r10
        mov     r3, r6
        mov     r0, #0
        bl      __divdf3
LBMJ16:
        add     r7, r7, #1
        str     r0, [r11]
        str     r1, [r11, #4]
        cmp     r7, r4
        add     r11, r11, #8
        blt     LBMJ15
        mov     r0, r5
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LBMJ17:
        ldr     r0, [r9]
        ldr     r1, [r9, #4]
        mov     r5, #4
        b       LBMJ16
LBMJ18:
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #0x10]
        mov     r12, #0xFF, 12
        orr     r7, r12, #3, 4
        mov     r0, #0
        mov     r1, r7
        bl      __divdf3
        str     r0, [r11]
        str     r1, [r11, #4]
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #0x24]
        mov     r0, #0
        mov     r1, r7
        bl      __divdf3
        str     r0, [r10]
        str     r1, [r10, #4]
        mov     r0, #0
        mov     r1, r7
        mov     r2, r6
        mov     r3, r5
        bl      __divdf3
        str     r0, [r9]
        str     r1, [r9, #4]
        ldr     r2, [sp, #0x38]
        mov     r1, r7
        mov     r3, r4
        mov     r0, #0
        bl      __divdf3
        str     r0, [r8]
        str     r1, [r8, #4]
        b       LBMJ13
LBMJ19:
        ldr     r0, [sp, #0xC]
        ldr     r1, [sp, #0x10]
        mov     r2, #0
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        beq     LBMJ27
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #0x10]
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __divdf3
LBMJ20:
        str     r0, [r11]
        str     r1, [r11, #4]
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #0x24]
        mov     r2, #0
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        beq     LBMJ26
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #0x24]
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __divdf3
LBMJ21:
        str     r0, [r10]
        str     r1, [r10, #4]
        mov     r0, r6
        mov     r1, r5
        mov     r2, #0
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        beq     LBMJ25
        mov     r2, r6
        mov     r3, r5
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __divdf3
LBMJ22:
        str     r0, [r9]
        str     r1, [r9, #4]
        ldr     r0, [sp, #0x38]
        mov     r1, r4
        mov     r2, #0
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        beq     LBMJ24
        ldr     r2, [sp, #0x38]
        mov     r0, #0xFF, 12
        orr     r1, r0, #3, 4
        mov     r3, r4
        mov     r0, #0
        bl      __divdf3
LBMJ23:
        str     r0, [r8]
        str     r1, [r8, #4]
        mov     r0, #4
        str     r0, [sp, #0x1C]
        b       LBMJ13
LBMJ24:
        ldr     r1, [pc, #0x50]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        b       LBMJ23
LBMJ25:
        ldr     r2, [pc, #0x40]
        ldr     r0, [r2]
        ldr     r1, [r2, #4]
        b       LBMJ22
LBMJ26:
        ldr     r12, [pc, #0x30]
        ldr     r0, [r12]
        ldr     r1, [r12, #4]
        b       LBMJ21
LBMJ27:
        ldr     r12, [pc, #0x20]
        ldr     r0, [r12]
        ldr     r1, [r12, #4]
        b       LBMJ20
LBMJ28:
        mvn     r0, #7
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LBMJ29:
        mvn     r0, #5
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
        .long   ippConstantOfINF_64f


