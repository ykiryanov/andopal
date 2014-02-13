        .text
        .align  4
        .globl  _ippsFixedCodebookSearch_G729_32f


_ippsFixedCodebookSearch_G729_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x9A, 30
        add     lr, sp, #0x6A, 30
        add     r12, sp, #0xE8
        and     r7, lr, #0x1F
        and     r12, r12, #0x1F
        ldr     r11, [sp, #0x28C]
        ldr     lr, [sp, #0x290]
        rsb     r8, r7, #0
        rsb     r7, r12, #0
        add     r6, sp, #0x6A, 30
        add     r5, sp, #0xE8
        and     r12, r8, #0x1F
        and     r7, r7, #0x1F
        cmp     r0, #0
        add     r5, r5, r7
        str     r1, [sp, #0x28]
        mov     r4, r2
        str     r3, [sp, #0xAC]
        add     r6, r6, r12
        beq     LDLV22
        ldr     r3, [sp, #0x28]
        cmp     r3, #0
        beq     LDLV22
        cmp     r11, #0
        beq     LDLV22
        cmp     r4, #0
        beq     LDLV22
        ldr     r3, [sp, #0xAC]
        cmp     r3, #0
        beq     LDLV22
        ldr     r3, [sp, #0x28]
        cmp     lr, #0
        add     lr, r3, #0x20
        str     lr, [sp, #0x58]
        add     lr, r3, #0x40
        str     lr, [sp, #0x5C]
        add     lr, r3, #0x60
        str     lr, [sp, #0x60]
        add     lr, r3, #0x80
        str     lr, [sp, #0x64]
        add     lr, r3, #0xA0
        str     lr, [sp, #0x68]
        add     lr, r3, #0x1A, 28
        str     lr, [sp, #0x6C]
        add     lr, r3, #0x2A, 28
        str     lr, [sp, #0x70]
        add     lr, r3, #0x4A, 28
        str     lr, [sp, #0x74]
        add     lr, r3, #0x5A, 28
        add     r3, r3, #0x7A, 28
        str     lr, [sp, #0x78]
        str     r3, [sp, #0x7C]
        moveq   r3, #0x1E
        streq   r3, [r11]
        ldr     r3, [pc, #0xA28]
        add     lr, r6, #0x20
        add     r8, r6, #0x40
        ldr     r1, [r3]
        add     r3, r0, #4
        str     r3, [sp, #0x2C]
        add     r3, r0, #8
        str     r3, [sp, #0x34]
        add     r3, r5, #0x40
        str     r3, [sp, #0x24]
        add     r3, r0, #0xC
        add     r2, r6, #0x60
        str     r3, [sp, #0x3C]
        str     r8, [sp, #0x50]
        add     r7, r6, #0x80
        add     r3, r0, #0x10
        str     lr, [sp, #0x4C]
        str     r2, [sp, #0x54]
        str     r3, [sp, #0x44]
        str     r7, [sp, #0x48]
        str     r8, [sp, #0x38]
        add     r3, r5, #0x80
        str     r2, [sp, #0x40]
        add     r10, r5, #0x20
        add     r9, r5, #0x60
        mov     r7, r6
        mov     r8, r5
        str     r5, [sp, #0x10]
        str     r6, [sp, #0x14]
        str     r11, [sp, #0x1C]
        ldr     r11, [sp, #0x40]
        ldr     r5, [pc, #0x9B0]
        ldr     r6, [pc, #0x9B0]
        str     lr, [sp, #0x30]
        mov     lr, #8
        str     r4, [sp, #0x20]
        str     r0, [sp, #8]
        str     lr, [sp, #4]
        str     r3, [sp, #0xC]
        str     r12, [sp, #0x18]
        mov     r4, r1
LDLV0:
        ldr     r2, [sp, #8]
        mov     r1, r4
        ldr     r0, [r2], #0x14
        str     r2, [sp, #8]
        str     r0, [sp]
        bl      __gesf2
        cmp     r0, #0
        blt     LDLV1
        ldr     r2, [sp]
        ldr     r0, [r6]
        str     r2, [r7]
        b       LDLV2
LDLV1:
        ldr     r2, [sp]
        ldr     r0, [r5]
        eor     r2, r2, #2, 2
        str     r2, [r7]
LDLV2:
        str     r0, [r8]
        ldr     r2, [sp, #0x2C]
        mov     r1, r4
        ldr     r0, [r2], #0x14
        str     r2, [sp, #0x2C]
        str     r0, [sp]
        bl      __gesf2
        cmp     r0, #0
        blt     LDLV3
        ldr     r3, [sp]
        ldr     r2, [sp, #0x30]
        ldr     r0, [r6]
        str     r3, [r2]
        b       LDLV4
LDLV3:
        ldr     r2, [sp]
        ldr     r3, [sp, #0x30]
        ldr     r0, [r5]
        eor     r2, r2, #2, 2
        str     r2, [r3]
LDLV4:
        str     r0, [r10]
        ldr     r2, [sp, #0x34]
        mov     r1, r4
        ldr     r0, [r2], #0x14
        str     r2, [sp, #0x34]
        str     r0, [sp]
        bl      __gesf2
        cmp     r0, #0
        blt     LDLV5
        ldr     r3, [sp]
        ldr     r2, [sp, #0x38]
        ldr     r0, [r6]
        str     r3, [r2]
        b       LDLV6
LDLV5:
        ldr     r2, [sp]
        ldr     r3, [sp, #0x38]
        ldr     r0, [r5]
        eor     r2, r2, #2, 2
        str     r2, [r3]
LDLV6:
        ldr     r2, [sp, #0x24]
        mov     r1, r4
        str     r0, [r2]
        ldr     r2, [sp, #0x3C]
        ldr     r0, [r2], #0x14
        str     r2, [sp, #0x3C]
        str     r0, [sp]
        bl      __gesf2
        cmp     r0, #0
        blt     LDLV7
        ldr     r2, [sp]
        ldr     r0, [r6]
        str     r2, [r11]
        b       LDLV8
LDLV7:
        ldr     r2, [sp]
        ldr     r0, [r5]
        eor     r2, r2, #2, 2
        str     r2, [r11]
LDLV8:
        str     r0, [r9]
        ldr     r2, [sp, #0x44]
        mov     r1, r4
        ldr     r0, [r2], #0x14
        str     r2, [sp, #0x44]
        str     r0, [sp]
        bl      __gesf2
        cmp     r0, #0
        blt     LDLV9
        ldr     r3, [sp]
        ldr     r0, [sp, #0x48]
        ldr     r2, [r6]
        str     r3, [r0]
        b       LDLV10
LDLV9:
        ldr     r0, [sp]
        ldr     r3, [sp, #0x48]
        ldr     r2, [r5]
        eor     r0, r0, #2, 2
        str     r0, [r3]
LDLV10:
        ldr     r0, [sp, #0xC]
        add     r7, r7, #4
        add     r10, r10, #4
        str     r2, [r0], #4
        ldr     r3, [sp, #0x30]
        ldr     r2, [sp, #4]
        add     r9, r9, #4
        add     r3, r3, #4
        str     r3, [sp, #0x30]
        ldr     r3, [sp, #0x24]
        subs    r2, r2, #1
        add     r3, r3, #4
        str     r3, [sp, #0x24]
        ldr     r3, [sp, #0x38]
        str     r0, [sp, #0xC]
        ldr     r0, [sp, #0x48]
        add     r3, r3, #4
        str     r2, [sp, #4]
        add     r0, r0, #4
        str     r3, [sp, #0x38]
        add     r11, r11, #4
        str     r0, [sp, #0x48]
        add     r8, r8, #4
        bne     LDLV0
        ldr     r12, [sp, #0x18]
        ldr     r6, [sp, #0x14]
        ldr     r5, [sp, #0x10]
        ldr     r11, [sp, #0x1C]
        ldr     r4, [sp, #0x20]
        add     r3, sp, #0x6A, 30
        ldr     r9, [r12, +r3]
        ldr     r7, [r6, #0x20]
        ldr     r10, [r6, #0x40]
        add     r8, r6, #4
        mov     r0, r9
        mov     r1, r7
        bl      __addsf3
        mov     r1, r10
        bl      __addsf3
        str     r0, [sp, #0x24]
        add     r0, r6, #0x24
        add     r1, r6, #0x44
        mov     r2, #7
        str     r10, [sp, #0x18]
        str     r9, [sp, #0xC]
        str     r11, [sp, #0x1C]
        str     r5, [sp, #0x10]
        str     r6, [sp, #0x14]
        str     r4, [sp, #0x20]
        mov     r9, r0
        mov     r10, r1
        mov     r11, r2
LDLV11:
        ldr     r4, [r8], #4
        ldr     r6, [r9], #4
        ldr     r5, [r10], #4
        mov     r0, r4
        mov     r1, r6
        bl      __addsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r1, [sp, #0x24]
        bl      __addsf3
        ldr     r1, [sp, #0xC]
        str     r0, [sp, #0x24]
        mov     r0, r4
        bl      __gtsf2
        cmp     r0, #0
        strgt   r4, [sp, #0xC]
        mov     r0, r6
        mov     r1, r7
        bl      __gtsf2
        cmp     r0, #0
        movgt   r7, r6
        mov     r0, r5
        ldr     r1, [sp, #0x18]
        bl      __gtsf2
        cmp     r0, #0
        strgt   r5, [sp, #0x18]
        subs    r11, r11, #1
        bne     LDLV11
        ldr     r10, [sp, #0x18]
        ldr     r9, [sp, #0xC]
        ldr     r6, [sp, #0x14]
        ldr     r5, [sp, #0x10]
        ldr     r11, [sp, #0x1C]
        ldr     r4, [sp, #0x20]
        mov     r0, r9
        mov     r1, r7
        bl      __addsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r3, [pc, #0x6B8]
        mov     r7, #0
        mov     r8, r0
        ldr     r0, [sp, #0x24]
        ldr     r1, [r3]
        ldr     r3, [sp, #0x28]
        str     r7, [sp, #0x40]
        add     r3, r3, #0xA0
        str     r3, [sp, #0xE0]
        bl      __mulsf3
        str     r0, [sp, #0xDC]
        ldr     r1, [sp, #0xDC]
        mov     r0, r8
        bl      __subsf3
        ldr     r3, [pc, #0x684]
        mov     r9, r7
        ldr     r1, [r3]
        str     r6, [sp, #0x48]
        mov     r8, r9
        bl      __mulsf3
        ldr     r1, [sp, #0xDC]
        bl      __addsf3
        str     r0, [sp, #0x44]
        ldr     r0, [sp, #0xE0]
        mov     r1, r5
        mov     r10, r8
        bl      ownFixedCodebookCorrSign_32f
        ldr     r12, [pc, #0x640]
        ldr     r3, [pc, #0x650]
        ldr     r0, [pc, #0x650]
        ldr     lr, [r11]
        ldr     r12, [r12]
        ldr     r3, [r3]
        ldr     r0, [r0]
        mov     r1, r12
        add     lr, lr, #0x4B
        str     r0, [sp, #0xD0]
        str     r10, [sp, #0xCC]
        str     r9, [sp, #0xC4]
        str     lr, [sp, #0xBC]
        str     r3, [sp, #0xB8]
        str     r1, [sp, #0xB4]
        str     r12, [sp, #0xB0]
        str     r11, [sp, #0x1C]
        ldr     r1, [sp, #0x48]
        ldr     r2, [sp, #0x40]
        ldr     r3, [sp, #0x4C]
        ldr     r12, [sp, #0x78]
        ldr     r0, [sp, #0x74]
        ldr     lr, [sp, #0x70]
        ldr     r9, [sp, #0x6C]
        ldr     r10, [sp, #0x58]
        ldr     r11, [sp, #0x28]
        str     r8, [sp, #0xC8]
        str     r7, [sp, #0xC0]
        str     r5, [sp, #0x10]
        str     r4, [sp, #0x20]
LDLV12:
        ldr     r4, [r1], #4
        mov     r8, r10
        str     r4, [sp, #0xE0]
        ldr     r4, [r11], #4
        str     r4, [sp, #0xDC]
        add     r4, r6, #0x80
        str     r4, [sp, #0xD8]
        str     r11, [sp, #0x28]
        ldr     r11, [sp, #0x68]
        add     r4, lr, #1, 24
        str     r4, [sp, #0xD4]
        str     r0, [sp, #0x80]
        mov     r7, r12
        mov     r5, #0
        mov     r4, r3
        str     r1, [sp, #0x48]
        str     r2, [sp, #0x40]
        str     lr, [sp, #0x70]
        str     r6, [sp, #0x14]
LDLV13:
        ldr     r0, [sp, #0xE0]
        ldr     r1, [r4], #4
        bl      __addsf3
        mov     r10, r0
        ldr     r0, [sp, #0xDC]
        ldr     r1, [r8], #4
        bl      __addsf3
        ldr     r1, [sp, #0xD0]
        ldr     r2, [r11], #4
        mov     r6, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        mov     r1, r0
        ldr     r0, [sp, #0x5C]
        ldr     r2, [sp, #0x7C]
        ldr     r6, [sp, #0x50]
        str     r8, [sp]
        ldr     r8, [sp, #0x80]
        mov     r3, #0
        add     r12, r7, #1, 24
        str     r10, [sp, #0x38]
        str     r5, [sp, #0x2C]
        str     r11, [sp, #0x68]
        str     r12, [sp, #0x30]
        str     r1, [sp, #0x3C]
        str     r4, [sp, #8]
        str     r7, [sp, #4]
        mov     r5, r0
        mov     r11, r2
        mov     r10, r3
LDLV14:
        ldr     r1, [r6], #4
        ldr     r0, [sp, #0x38]
        bl      __addsf3
        ldr     r1, [r5], #4
        mov     r4, r0
        ldr     r0, [sp, #0x3C]
        bl      __addsf3
        ldr     r1, [r8], #4
        ldr     r2, [r9], #4
        mov     r7, r0
        mov     r0, r2
        bl      __addsf3
        ldr     r1, [sp, #0xD0]
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        ldr     r1, [sp, #0x44]
        str     r0, [sp, #0x34]
        mov     r0, r4
        bl      __gtsf2
        cmp     r0, #0
        ble     LDLV19
        ldr     r1, [sp, #0x54]
        ldr     r7, [sp, #0xD8]
        ldr     r0, [sp, #0x60]
        str     r1, [sp, #0xC]
        ldr     r1, [sp, #0x64]
        ldr     lr, [sp, #0xD4]
        mov     r2, #0
        str     r1, [sp, #0x18]
        ldr     r1, [sp, #0x30]
        str     r4, [sp, #0x98]
        str     r5, [sp, #0x84]
        ldr     r5, [sp, #0xB8]
        ldr     r4, [sp, #0xB4]
        str     r2, [sp, #0x24]
        add     r3, r11, #1, 24
        mvn     r12, #0
        str     r6, [sp, #0x8C]
        str     r10, [sp, #0x88]
        str     r11, [sp, #0x94]
        str     r8, [sp, #0x80]
        str     r9, [sp, #0x6C]
        str     r12, [sp, #0x90]
        mov     r6, r0
        mov     r8, r1
        mov     r10, r2
        mov     r11, r3
        mov     r9, lr
LDLV15:
        ldr     r12, [sp, #0xC]
        ldr     r0, [sp, #0x98]
        ldr     r1, [r12], #4
        str     r12, [sp, #0xC]
        bl      __addsf3
        ldr     r1, [r7], #4
        str     r0, [sp, #0xA4]
        ldr     r0, [sp, #0x98]
        bl      __addsf3
        ldr     r1, [r6], #4
        str     r0, [sp, #0xE4]
        ldr     r0, [sp, #0x34]
        bl      __addsf3
        ldr     r12, [sp, #0x70]
        ldr     r1, [r12, +r10, lsl #2]
        ldr     r12, [sp, #4]
        ldr     r2, [r12, +r10, lsl #2]
        str     r0, [sp, #0xA8]
        mov     r0, r2
        bl      __addsf3
        ldr     r12, [sp, #0x94]
        ldr     r1, [r12, +r10, lsl #2]
        bl      __addsf3
        ldr     r1, [sp, #0xD0]
        bl      __mulsf3
        ldr     r1, [sp, #0xA8]
        bl      __addsf3
        ldr     r12, [sp, #0x18]
        ldr     r1, [r12], #4
        str     r0, [sp, #0x9C]
        ldr     r0, [sp, #0x34]
        str     r12, [sp, #0x18]
        bl      __addsf3
        ldr     r2, [r8], #4
        ldr     r1, [r9], #4
        str     r0, [sp, #0xA8]
        mov     r0, r2
        bl      __addsf3
        ldr     r1, [r11], #4
        bl      __addsf3
        ldr     r1, [sp, #0xD0]
        bl      __mulsf3
        ldr     r1, [sp, #0xA8]
        bl      __addsf3
        str     r0, [sp, #0xA8]
        ldr     r0, [sp, #0xA4]
        mov     r1, r0
        bl      __mulsf3
        ldr     r1, [sp, #0xE4]
        str     r0, [sp, #0xA0]
        mov     r0, r1
        bl      __mulsf3
        ldr     r1, [sp, #0x9C]
        str     r0, [sp, #0xA4]
        mov     r0, r4
        bl      __mulsf3
        str     r0, [sp, #0xE4]
        ldr     r0, [sp, #0xA0]
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0xE4]
        bl      __subsf3
        ldr     r1, [sp, #0xB0]
        bl      __ltsf2
        cmp     r0, #0
        bge     LDLV16
        ldr     r4, [sp, #0xA0]
        ldr     r5, [sp, #0x9C]
        mov     r12, r10, lsl #1
        str     r12, [sp, #0x90]
LDLV16:
        mov     r0, r4
        ldr     r1, [sp, #0xA8]
        bl      __mulsf3
        str     r0, [sp, #0xE4]
        ldr     r0, [sp, #0xA4]
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0xE4]
        bl      __subsf3
        ldr     r1, [sp, #0xB0]
        bl      __ltsf2
        cmp     r0, #0
        bge     LDLV17
        ldr     r12, [sp, #0x24]
        ldr     r4, [sp, #0xA4]
        ldr     r5, [sp, #0xA8]
        add     r12, r12, #1
        str     r12, [sp, #0x90]
LDLV17:
        ldr     r12, [sp, #0x24]
        add     r10, r10, #1
        cmp     r10, #8
        add     r12, r12, #2
        str     r12, [sp, #0x24]
        blt     LDLV15
        ldr     r12, [sp, #0x90]
        str     r5, [sp, #0xB8]
        ldr     r6, [sp, #0x8C]
        ldr     r10, [sp, #0x88]
        ldr     r11, [sp, #0x94]
        ldr     r5, [sp, #0x84]
        ldr     r8, [sp, #0x80]
        ldr     r9, [sp, #0x6C]
        cmp     r12, #0
        str     r4, [sp, #0xB4]
        blt     LDLV18
        ldr     r1, [sp, #0x40]
        str     r10, [sp, #0xC8]
        str     r1, [sp, #0xC0]
        ldr     r1, [sp, #0x2C]
        str     r12, [sp, #0xCC]
        str     r1, [sp, #0xC4]
LDLV18:
        ldr     r1, [sp, #0xBC]
        sub     r1, r1, #1
        cmp     r1, #0
        str     r1, [sp, #0xBC]
        ble     LDLV21
LDLV19:
        add     r10, r10, #1
        cmp     r10, #8
        add     r11, r11, #0x20
        blt     LDLV14
        ldr     r5, [sp, #0x2C]
        ldr     r7, [sp, #4]
        str     r8, [sp, #0x80]
        ldr     r4, [sp, #8]
        ldr     r8, [sp]
        ldr     r11, [sp, #0x68]
        add     r5, r5, #1
        cmp     r5, #8
        add     r7, r7, #0x20
        sub     r9, r9, #0x20
        blt     LDLV13
        ldr     r2, [sp, #0x40]
        ldr     lr, [sp, #0x70]
        str     r11, [sp, #0x68]
        ldr     r1, [sp, #0x48]
        ldr     r3, [sp, #0x4C]
        ldr     r12, [sp, #0x78]
        ldr     r0, [sp, #0x74]
        ldr     r10, [sp, #0x58]
        ldr     r6, [sp, #0x14]
        ldr     r11, [sp, #0x28]
        add     r2, r2, #1
        cmp     r2, #8
        add     lr, lr, #0x20
        add     r9, r9, #0x20
        blt     LDLV12
        ldr     r10, [sp, #0xCC]
        ldr     r8, [sp, #0xC8]
        ldr     r9, [sp, #0xC4]
        ldr     r7, [sp, #0xC0]
        ldr     lr, [sp, #0xBC]
        ldr     r5, [sp, #0x10]
        ldr     r11, [sp, #0x1C]
        ldr     r4, [sp, #0x20]
LDLV20:
        and     r3, r10, #1
        add     r3, r3, #3
        str     lr, [r11]
        ldr     r6, [r5, +r7, lsl #2]
        mov     r3, r3, lsl #3
        add     r11, r3, r10, asr #1
        add     r10, r9, #8
        ldr     r3, [r5, +r10, lsl #2]
        add     r9, r8, #0x10
        mov     r1, #0x28
        mov     r0, r4
        str     r3, [sp, #0x1C]
        ldr     r8, [r5, +r9, lsl #2]
        ldr     r5, [r5, +r11, lsl #2]
        str     r5, [sp, #0x24]
        bl      _ippsZero_32f
        ands    r12, r7, #7
        mov     r1, r7, lsr #31
        subne   r12, r12, r1, lsl #3
        ands    r1, r10, #7
        mov     r3, r10, lsr #31
        subne   r1, r1, r3, lsl #3
        str     r1, [sp, #0xE4]
        ldr     r1, [pc, #0x16C]
        ands    r3, r9, #7
        mov     r0, r9, lsr #31
        ldr     r5, [r1]
        mov     lr, r7, asr #2
        subne   r3, r3, r0, lsl #3
        add     r7, r7, lr, lsr #29
        add     r0, r12, r12, lsl #2
        mov     lr, r10, asr #2
        add     r7, r0, r7, asr #3
        str     r6, [r4, +r7, lsl #2]
        ldr     r0, [sp, #0xE4]
        add     r10, r10, lr, lsr #29
        ands    r12, r11, #7
        add     r0, r0, r0, lsl #2
        add     r10, r0, r10, asr #3
        ldr     r0, [sp, #0x1C]
        mov     lr, r9, asr #2
        add     r3, r3, r3, lsl #2
        add     r9, r9, lr, lsr #29
        str     r0, [r4, +r10, lsl #2]
        mov     lr, r11, asr #2
        add     r9, r3, r9, asr #3
        mov     r0, r11, lsr #31
        str     r8, [r4, +r9, lsl #2]
        ldr     r3, [sp, #0x24]
        subne   r12, r12, r0, lsl #3
        add     lr, r11, lr, lsr #29
        mov     r0, r6
        add     r12, r12, r12, lsl #2
        add     r11, r12, lr, asr #3
        str     r3, [r4, +r11, lsl #2]
        mov     r1, r5
        bl      __gtsf2
        cmp     r0, #0
        movle   r4, #0
        movgt   r4, #1
        ldr     r0, [sp, #0x1C]
        mov     r1, r5
        bl      __gtsf2
        cmp     r0, #0
        addgt   r4, r4, #2
        mov     r0, r8
        mov     r1, r5
        bl      __gtsf2
        cmp     r0, #0
        addgt   r4, r4, #4
        ldr     r0, [sp, #0x24]
        mov     r1, r5
        bl      __gtsf2
        cmp     r0, #0
        addgt   r4, r4, #8
        ldr     r3, [pc, #0xB8]
        ldr     r0, [sp, #0xAC]
        smull   r2, r1, r11, r3
        smull   r2, lr, r11, r3
        smull   r2, r12, r7, r3
        smull   r5, r2, r10, r3
        smull   r5, r3, r9, r3
        str     r4, [r0, #4]
        mov     r4, r11, asr #31
        rsb     r1, r4, r1, asr #1
        rsb     lr, r4, lr, asr #1
        mov     r7, r7, asr #31
        add     r1, r1, r1, lsl #2
        sub     r11, r11, r1
        sub     r1, r11, #3
        add     lr, r1, lr, lsl #1
        mov     r9, r9, asr #31
        mov     r10, r10, asr #31
        rsb     r3, r9, r3, asr #1
        rsb     r2, r10, r2, asr #1
        mov     lr, lr, lsl #9
        rsb     r12, r7, r12, asr #1
        add     r3, lr, r3, lsl #6
        add     r2, r12, r2, lsl #3
        add     r3, r2, r3
        str     r3, [r0]
        mov     r0, #0
        add     sp, sp, #0x9A, 30
        ldmia   sp!, {r4 - r11, pc}
LDLV21:
        ldr     r10, [sp, #0xCC]
        ldr     r8, [sp, #0xC8]
        ldr     r9, [sp, #0xC4]
        ldr     r7, [sp, #0xC0]
        ldr     lr, [sp, #0xBC]
        ldr     r5, [sp, #0x10]
        ldr     r11, [sp, #0x1C]
        ldr     r4, [sp, #0x20]
        b       LDLV20
LDLV22:
        mvn     r0, #7
        add     sp, sp, #0x9A, 30
        ldmia   sp!, {r4 - r11, pc}
        .long   LDLV__2il0floatpacket.1
        .long   LDLV__2il0floatpacket.2
        .long   LDLV__2il0floatpacket.3
        .long   LDLV__2il0floatpacket.4
        .long   LDLV__2il0floatpacket.5
        .long   LDLV__2il0floatpacket.6
        .long   LDLV__2il0floatpacket.7
        .long   0x66666667


        .data
        .align  4


LDLV__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00
LDLV__2il0floatpacket.2:
        .byte   0x00,0x00,0x80,0xBF
LDLV__2il0floatpacket.3:
        .byte   0x00,0x00,0x80,0x3F
LDLV__2il0floatpacket.4:
        .byte   0x00,0x00,0x00,0x3E
LDLV__2il0floatpacket.5:
        .byte   0xCD,0xCC,0xCC,0x3E
LDLV__2il0floatpacket.6:
        .byte   0x00,0x24,0x74,0x49
LDLV__2il0floatpacket.7:
        .byte   0x00,0x00,0x00,0x40


