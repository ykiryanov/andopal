        .text
        .align  4
        .globl  _ippsLn_64f32f


_ippsLn_64f32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x46, 30
        cmp     r0, #0
        str     r0, [sp, #0x14]
        str     r1, [sp, #0x18]
        mov     r4, r2
        beq     LBKM91
        ldr     r0, [sp, #0x18]
        cmp     r0, #0
        beq     LBKM91
        cmp     r4, #1
        blt     LBKM56
        ldr     lr, [pc, #0xDC8]
        ldr     r3, [pc, #0xDC8]
        ldr     r5, [pc, #0xDC8]
        ldr     r10, [lr]
        ldr     r6, [pc, #0xDC4]
        ldr     r12, [pc, #0xDC4]
        ldr     r3, [r3]
        ldr     r11, [r6]
        ldr     r5, [r5]
        ldr     lr, [r12]
        ldr     r1, [pc, #0xDB4]
        ldr     r0, [pc, #0xDB4]
        str     r3, [sp, #0xAC]
        ldr     r6, [r1]
        ldr     r3, [pc, #0xDAC]
        ldr     r0, [r0]
        ldr     r1, [pc, #0xDA8]
        ldr     r12, [pc, #0xDA8]
        cmp     r4, #4
        str     r0, [sp, #0xA8]
        ldr     r0, [pc, #0xDA0]
        ldr     r12, [r12]
        ldr     r7, [r3]
        ldr     r8, [r1]
        ldr     r9, [r0]
        str     r12, [sp, #4]
        ldr     r12, [pc, #0xD8C]
        ldr     r3, [pc, #0xD8C]
        ldr     r1, [pc, #0xD8C]
        ldr     r0, [pc, #0xD8C]
        ldr     r12, [r12]
        str     r12, [sp, #8]
        ldr     r12, [pc, #0xD84]
        ldr     r12, [r12]
        str     r12, [sp]
        ldr     r12, [r3]
        ldr     r3, [r1]
        str     r5, [sp, #0x110]
        ldr     r1, [r0]
        str     r10, [sp, #0x108]
        str     r11, [sp, #0x114]
        str     lr, [sp, #0x100]
        ldr     r10, [sp, #0xAC]
        ldr     r0, [pc, #0xD5C]
        str     r6, [sp, #0xD8]
        str     r10, [sp, #0xF8]
        ldr     r6, [sp, #0xA8]
        ldr     r0, [r0]
        mov     r5, #0xFF, 12
        orr     r5, r5, #7, 4
        str     r6, [sp, #0xF0]
        str     r7, [sp, #0xE8]
        str     r8, [sp, #0xE0]
        str     r9, [sp, #0xD4]
        bge     LBKM6
        ldr     r0, [sp, #0x14]
        mvn     r9, #0x7F
        mov     r8, #0
        ldr     r6, [r0, #4]
        ldr     r7, [r0]
        mov     r12, r6, lsr #24
        and     r12, r12, #0x80
        str     r7, [sp, #0x110]
        tst     r12, r9
        str     r6, [sp, #0x114]
        bne     LBKM0
        str     r8, [sp, #0xAC]
        ldr     r10, [sp, #0xAC]
        ldr     r11, [sp, #0x18]
        b       LBKM3
LBKM0:
        str     r8, [sp, #0xAC]
        ldr     r10, [sp, #0xAC]
        ldr     r11, [sp, #0x18]
LBKM1:
        ldr     r0, [pc, #0xCE8]
        cmp     r10, #0
        ldr     r0, [r0]
        str     r0, [r11, +r8, lsl #2]
        moveq   r10, #4
LBKM2:
        add     r8, r8, #1
        cmp     r8, r4
        bge     LBKM57
        ldr     r0, [sp, #0x14]
        add     r1, r0, r8, lsl #3
        ldr     r6, [r1, #4]
        ldr     r7, [r0, +r8, lsl #3]
        mov     r12, r6, lsr #24
        and     r12, r12, #0x80
        str     r7, [sp, #0x110]
        tst     r12, r9
        str     r6, [sp, #0x114]
        beq     LBKM3
        b       LBKM1
LBKM3:
        ldr     r12, [sp, #0x114]
        add     r3, r5, #2, 14
        and     r12, r12, r3
        cmp     r3, r12
        bne     LBKM4
        ldr     r0, [pc, #0xC88]
        ldr     r0, [r0]
        eor     r0, r0, #2, 2
        str     r0, [r11, +r8, lsl #2]
        b       LBKM2
LBKM4:
        mov     r0, r7
        mov     r1, r6
        mov     r2, #0
        mov     r3, #0
        bl      __gedf2
        cmp     r0, #0
        blt     LBKM5
        mov     r0, r7
        mov     r1, r6
        mov     r2, #0
        mov     r3, #1, 12
        bl      __ltdf2
        cmp     r0, #0
        bge     LBKM5
        ldr     r0, [sp, #0xD4]
        cmp     r10, #0
        str     r0, [r11, +r8, lsl #2]
        moveq   r10, #2
        b       LBKM2
LBKM5:
        mov     r1, r6
        mov     r0, r7
        bl      log
        bl      __truncdfsf2
        str     r0, [r11, +r8, lsl #2]
        b       LBKM2
LBKM6:
        ldr     lr, [sp, #0x14]
        mvn     r10, #0x7F
        ldr     r8, [lr, #4]
        ldr     r6, [lr]
        mov     lr, #0xFF, 12
        mov     r9, r8, lsr #24
        and     r9, r9, #0x80
        str     r6, [sp, #0x110]
        tst     r9, r10
        ldr     r9, [sp]
        orr     r6, lr, #3, 4
        add     lr, r6, #1, 2
        str     r9, [sp, #0xFC]
        ldr     r9, [sp, #8]
        and     lr, r8, lr
        str     r9, [sp, #0x104]
        ldr     r9, [sp, #4]
        str     r8, [sp, #0x114]
        mov     lr, lr, lsr #20
        str     r9, [sp, #0x10C]
        str     lr, [sp, #0x20]
        beq     LBKM7
        mov     r5, #1
        str     r5, [sp, #0x1C]
        mov     r5, #4
        sub     lr, r6, #1
        str     r5, [sp, #0xAC]
        b       LBKM11
LBKM7:
        cmp     r8, #1, 12
        bcs     LBKM8
        mov     r5, #2
        str     r5, [sp, #0xAC]
        sub     lr, r6, #1
        str     r5, [sp, #0x1C]
        b       LBKM11
LBKM8:
        sub     r5, r5, #1
        mov     lr, #0
        cmp     r5, r8
        str     lr, [sp, #0xAC]
        bcs     LBKM9
        tst     r8, #2, 14
        moveq   lr, #3
        streq   lr, [sp, #0x1C]
        movne   lr, #4
        strne   lr, [sp, #0x1C]
        sub     lr, r6, #1
        b       LBKM11
LBKM9:
        ldr     r5, [pc, #0xB58]
        add     lr, r6, #1, 2
        bic     r8, r8, lr
        mov     lr, #0xFE
        orr     lr, lr, #3, 24
        ldr     r7, [sp, #0x20]
        orr     lr, r8, lr, lsl #20
        cmp     r5, lr
        mov     r5, #2
        add     r5, r5, #0xFF, 30
        sub     r7, r7, r5
        str     r7, [sp, #0x20]
        bls     LBKM10
        ldr     r5, [sp, #0x20]
        add     r6, r6, #1, 2
        sub     r5, r5, #1
        str     r5, [sp, #0x20]
        and     r5, lr, r6
        bic     lr, lr, r6
        mov     r6, #0xFF
        mov     r5, r5, lsr #20
        orr     r6, r6, #7, 24
        add     r5, r5, #1
        and     r6, r5, r6
        orr     lr, lr, r6, lsl #20
LBKM10:
        ldr     r5, [sp, #0xAC]
        str     r5, [sp, #0x1C]
LBKM11:
        ldr     r6, [sp, #0x14]
        mov     r8, #0xFF, 12
        orr     r8, r8, #3, 4
        ldr     r5, [r6, #0xC]
        ldr     r10, [r6, #8]!
        add     r8, r8, #1, 2
        mov     r9, r5, lsr #24
        str     r10, [sp, #0x108]
        and     r8, r5, r8
        str     r6, [sp, #0x24]
        and     r9, r9, #0x80
        mvn     r10, #0x7F
        str     r5, [sp, #0x10C]
        mov     r8, r8, lsr #20
        tst     r9, r10
        str     r8, [sp, #0x28]
        beq     LBKM12
        mov     r5, #0xFF, 12
        orr     r5, r5, #3, 4
        sub     r7, r5, #1
        mov     r5, #1
        str     r5, [sp, #0x2C]
        mov     r5, #4
        str     r5, [sp, #0xAC]
        b       LBKM16
LBKM12:
        cmp     r5, #1, 12
        bcs     LBKM13
        mov     r5, #0xFF, 12
        orr     r5, r5, #3, 4
        sub     r7, r5, #1
        mov     r5, #2
        str     r5, [sp, #0xAC]
        str     r5, [sp, #0x2C]
        b       LBKM16
LBKM13:
        mov     r6, #0xFF, 12
        orr     r6, r6, #7, 4
        sub     r6, r6, #1
        cmp     r6, r5
        bcs     LBKM14
        tst     r5, #2, 14
        moveq   r5, #3
        streq   r5, [sp, #0x2C]
        movne   r5, #4
        strne   r5, [sp, #0x2C]
        mov     r5, #0xFF, 12
        orr     r5, r5, #3, 4
        sub     r7, r5, #1
        b       LBKM16
LBKM14:
        mov     r6, #0xFF, 12
        orr     r7, r6, #3, 4
        ldr     r6, [pc, #0xA24]
        add     r7, r7, #1, 2
        mov     r8, #0xFE
        bic     r7, r5, r7
        orr     r8, r8, #3, 24
        mov     r5, #2
        add     r5, r5, #0xFF, 30
        orr     r7, r7, r8, lsl #20
        cmp     r6, r7
        ldr     r6, [sp, #0x28]
        sub     r6, r6, r5
        str     r6, [sp, #0x28]
        bls     LBKM15
        mov     r5, #0xFF, 12
        orr     r5, r5, #3, 4
        add     r5, r5, #1, 2
        and     r6, r7, r5
        mov     r8, #0xFF
        mov     r6, r6, lsr #20
        orr     r8, r8, #7, 24
        add     r6, r6, #1
        and     r8, r6, r8
        ldr     r6, [sp, #0x28]
        bic     r5, r7, r5
        orr     r7, r5, r8, lsl #20
        sub     r6, r6, #1
        str     r6, [sp, #0x28]
LBKM15:
        mov     r5, #0
        str     r5, [sp, #0x2C]
LBKM16:
        ldr     r6, [sp, #0x14]
        mov     r9, #0xFF, 12
        orr     r9, r9, #3, 4
        ldr     r5, [r6, #0x14]
        ldr     r11, [r6, #0x10]!
        add     r9, r9, #1, 2
        mov     r10, r5, lsr #24
        str     r11, [sp, #0x100]
        and     r9, r5, r9
        str     r6, [sp, #0x30]
        and     r10, r10, #0x80
        mvn     r11, #0x7F
        str     r5, [sp, #0x104]
        mov     r9, r9, lsr #20
        tst     r10, r11
        str     r9, [sp, #0x34]
        beq     LBKM17
        mov     r5, #0xFF, 12
        orr     r5, r5, #3, 4
        sub     r6, r5, #1
        mov     r5, #1
        str     r5, [sp, #0x38]
        mov     r5, #4
        str     r5, [sp, #0xAC]
        b       LBKM21
LBKM17:
        cmp     r5, #1, 12
        bcs     LBKM18
        mov     r5, #0xFF, 12
        orr     r6, r5, #3, 4
        mov     r5, #2
        str     r5, [sp, #0xAC]
        sub     r6, r6, #1
        str     r5, [sp, #0x38]
        b       LBKM21
LBKM18:
        mov     r6, #0xFF, 12
        orr     r6, r6, #7, 4
        sub     r6, r6, #1
        cmp     r6, r5
        bcs     LBKM19
        tst     r5, #2, 14
        moveq   r5, #3
        streq   r5, [sp, #0x38]
        movne   r5, #4
        strne   r5, [sp, #0x38]
        mov     r5, #0xFF, 12
        orr     r5, r5, #3, 4
        sub     r6, r5, #1
        b       LBKM21
LBKM19:
        mov     r6, #0xFF, 12
        orr     r6, r6, #3, 4
        ldr     r8, [pc, #0x8E8]
        add     r6, r6, #1, 2
        mov     r9, #0xFE
        bic     r6, r5, r6
        orr     r9, r9, #3, 24
        mov     r5, #2
        add     r5, r5, #0xFF, 30
        orr     r6, r6, r9, lsl #20
        cmp     r8, r6
        ldr     r8, [sp, #0x34]
        sub     r8, r8, r5
        str     r8, [sp, #0x34]
        bls     LBKM20
        mov     r5, #0xFF, 12
        orr     r5, r5, #3, 4
        add     r5, r5, #1, 2
        and     r8, r6, r5
        bic     r5, r6, r5
        ldr     r6, [sp, #0x34]
        mov     r9, #0xFF
        mov     r8, r8, lsr #20
        orr     r9, r9, #7, 24
        sub     r6, r6, #1
        add     r8, r8, #1
        and     r9, r8, r9
        str     r6, [sp, #0x34]
        orr     r6, r5, r9, lsl #20
LBKM20:
        mov     r5, #0
        str     r5, [sp, #0x38]
LBKM21:
        ldr     r9, [sp, #0x14]
        mov     r8, #0xFF, 12
        orr     r8, r8, #3, 4
        ldr     r5, [r9, #0x1C]
        ldr     r11, [r9, #0x18]!
        add     r8, r8, #1, 2
        mov     r10, r5, lsr #24
        str     r11, [sp, #0xF8]
        and     r8, r5, r8
        str     r9, [sp, #0x3C]
        and     r10, r10, #0x80
        mvn     r11, #0x7F
        str     r5, [sp, #0xFC]
        mov     r8, r8, lsr #20
        tst     r10, r11
        str     r8, [sp, #0x40]
        beq     LBKM22
        mov     r5, #0xFF, 12
        mov     r8, #1
        str     r8, [sp, #0x44]
        orr     r5, r5, #3, 4
        mov     r8, #4
        sub     r5, r5, #1
        str     r8, [sp, #0xAC]
        b       LBKM26
LBKM22:
        cmp     r5, #1, 12
        bcs     LBKM23
        mov     r8, #2
        mov     r5, #0xFF, 12
        str     r8, [sp, #0xAC]
        orr     r5, r5, #3, 4
        sub     r5, r5, #1
        str     r8, [sp, #0x44]
        b       LBKM26
LBKM23:
        mov     r8, #0xFF, 12
        orr     r8, r8, #7, 4
        sub     r8, r8, #1
        cmp     r8, r5
        bcs     LBKM24
        tst     r5, #2, 14
        moveq   r5, #3
        streq   r5, [sp, #0x44]
        movne   r5, #4
        strne   r5, [sp, #0x44]
        mov     r5, #0xFF, 12
        orr     r5, r5, #3, 4
        sub     r5, r5, #1
        b       LBKM26
LBKM24:
        mov     r8, #0xFF, 12
        orr     r9, r8, #3, 4
        ldr     r8, [pc, #0x7AC]
        add     r10, r9, #1, 2
        bic     r5, r5, r10
        mov     r9, #0xFE
        orr     r10, r9, #3, 24
        mov     r9, #2
        add     r9, r9, #0xFF, 30
        orr     r5, r5, r10, lsl #20
        cmp     r8, r5
        ldr     r8, [sp, #0x40]
        sub     r8, r8, r9
        str     r8, [sp, #0x40]
        bls     LBKM25
        mov     r8, #0xFF, 12
        orr     r8, r8, #3, 4
        add     r8, r8, #1, 2
        and     r9, r5, r8
        bic     r8, r5, r8
        ldr     r5, [sp, #0x40]
        mov     r10, #0xFF
        mov     r9, r9, lsr #20
        orr     r10, r10, #7, 24
        sub     r5, r5, #1
        add     r9, r9, #1
        and     r10, r9, r10
        str     r5, [sp, #0x40]
        orr     r5, r8, r10, lsl #20
LBKM25:
        mov     r8, #0
        str     r8, [sp, #0x44]
LBKM26:
        cmp     r4, #3
        movle   r5, #3
        ble     LBKM85
        mov     r8, #0
        str     r8, [sp, #0xC]
        str     r8, [sp]
        str     r8, [sp, #0x10]
        str     r8, [sp, #8]
        mov     r9, r8
        str     r9, [sp, #4]
        mov     r10, #0xFF, 12
        orr     r10, r10, #3, 4
        str     r5, [sp, #0xFC]
        mov     r11, r10, lsl #2
        str     r6, [sp, #0x104]
        str     lr, [sp, #0x114]
        str     r11, [sp, #0xD0]
        str     r0, [sp, #0xE4]
        str     r1, [sp, #0xEC]
        str     r3, [sp, #0xF4]
        str     r12, [sp, #0xDC]
        str     r7, [sp, #0x10C]
        mov     lr, r9
        mov     r5, #3
        sub     r6, r4, #4
        sub     r10, r10, #1
        str     r5, [sp, #0xA0]
        str     r10, [sp, #0x68]
        str     r6, [sp, #0x54]
        str     lr, [sp, #0x6C]
        str     r9, [sp, #0x60]
        str     r8, [sp, #0x64]
        str     r0, [sp, #0x5C]
        str     r1, [sp, #0x50]
        str     r3, [sp, #0x4C]
        str     r12, [sp, #0x48]
        str     r4, [sp, #0x58]
LBKM27:
        ldr     r2, [sp, #0x110]
        ldr     r3, [sp, #0x114]
        mov     r0, #0xFE, 12
        orr     r0, r0, #3, 4
        str     r2, [sp, #0xA4]
        str     r3, [sp, #0xA8]
        add     r4, r0, #1, 12
        mov     r1, r4
        mov     r0, #0
        bl      __adddf3
        ldr     r2, [sp, #0x108]
        ldr     r3, [sp, #0x10C]
        mov     r11, r0
        str     r2, [sp, #0x90]
        str     r11, [sp, #0x70]
        str     r3, [sp, #0x94]
        mov     r5, r1
        str     r5, [sp, #0x74]
        mov     r1, r4
        mov     r0, #0
        bl      __adddf3
        ldr     r2, [sp, #0x100]
        ldr     r3, [sp, #0x104]
        str     r0, [sp, #0x80]
        str     r2, [sp, #0x98]
        str     r3, [sp, #0x9C]
        mov     r10, r1
        str     r10, [sp, #0x84]
        mov     r1, r4
        mov     r0, #0
        bl      __adddf3
        ldr     r2, [sp, #0xF8]
        ldr     r3, [sp, #0xFC]
        mov     r6, r0
        str     r2, [sp, #0x88]
        mov     r7, r1
        str     r3, [sp, #0x8C]
        mov     r1, r4
        mov     r0, #0
        bl      __adddf3
        ldr     r2, [sp, #0x80]
        mov     r8, r0
        mov     r9, r1
        mov     r3, r10
        mov     r0, r11
        mov     r1, r5
        bl      __muldf3
        mov     r10, r0
        mov     r11, r1
        mov     r0, r6
        mov     r1, r7
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        str     r0, [sp, #0x78]
        str     r1, [sp, #0x7C]
        mov     r0, r10
        mov     r1, r11
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        mov     r3, r1
        mov     r2, r0
        mov     r1, r4
        mov     r0, #0
        bl      __divdf3
        ldr     r12, [sp, #0xA0]
        ldr     lr, [sp, #0x54]
        mov     r5, r0
        add     r12, r12, #1
        mov     r4, r1
        cmp     r12, lr
        bgt     LBKM47
        ldr     r1, [sp, #0xA0]
        ldr     r0, [sp, #0x24]
        mvn     r2, #0x7F
        mov     r12, r1, lsl #3
        add     lr, r12, r0
        ldr     r1, [r0, +r1, lsl #3]
        ldr     lr, [lr, #4]
        mov     r0, #0xFF, 12
        orr     r0, r0, #3, 4
        str     r1, [sp, #0xD8]
        add     r0, r0, #1, 2
        mov     r1, lr, lsr #24
        and     r0, lr, r0
        and     r1, r1, #0x80
        str     lr, [sp, #0xDC]
        mov     r0, r0, lsr #20
        tst     r1, r2
        str     r0, [sp]
        beq     LBKM28
        mov     r0, #0xFF, 12
        orr     r0, r0, #3, 4
        sub     r0, r0, #1
        str     r0, [sp, #0x48]
        str     r0, [sp, #0xDC]
        mov     lr, #1
        str     lr, [sp, #4]
        mov     lr, #4
        str     lr, [sp, #0xAC]
        b       LBKM32
LBKM28:
        cmp     lr, #1, 12
        bcs     LBKM29
        mov     r0, #0xFF, 12
        orr     r0, r0, #3, 4
        sub     r1, r0, #1
        mov     r0, #2
        str     r0, [sp, #0xAC]
        str     r1, [sp, #0x48]
        str     r1, [sp, #0xDC]
        str     r0, [sp, #4]
        b       LBKM32
LBKM29:
        mov     r0, #0xFF, 12
        orr     r0, r0, #7, 4
        sub     r0, r0, #1
        cmp     r0, lr
        bcs     LBKM30
        tst     lr, #2, 14
        moveq   lr, #3
        streq   lr, [sp, #4]
        movne   lr, #4
        strne   lr, [sp, #4]
        mov     r0, #0xFF, 12
        orr     r0, r0, #3, 4
        sub     r0, r0, #1
        str     r0, [sp, #0x48]
        str     r0, [sp, #0xDC]
        b       LBKM32
LBKM30:
        mov     r0, #0xFF, 12
        orr     r0, r0, #3, 4
        mov     r1, #0xFE
        add     r0, r0, #1, 2
        orr     r1, r1, #3, 24
        bic     r0, lr, r0
        orr     r1, r0, r1, lsl #20
        ldr     r0, [pc, #0x478]
        mov     lr, #2
        add     lr, lr, #0xFF, 30
        cmp     r0, r1
        ldr     r0, [sp]
        str     r1, [sp, #0x48]
        sub     r0, r0, lr
        str     r0, [sp]
        ldrls   lr, [sp, #0x48]
        strls   lr, [sp, #0xDC]
        bls     LBKM31
        ldr     r1, [sp, #0x48]
        mov     lr, #0xFF, 12
        orr     lr, lr, #3, 4
        add     lr, lr, #1, 2
        and     r0, r1, lr
        bic     lr, r1, lr
        mov     r0, r0, lsr #20
        mov     r1, #0xFF
        add     r0, r0, #1
        orr     r1, r1, #7, 24
        and     r0, r0, r1
        ldr     r1, [sp]
        orr     r0, lr, r0, lsl #20
        str     r0, [sp, #0x48]
        sub     r1, r1, #1
        str     r1, [sp]
        str     r0, [sp, #0xDC]
LBKM31:
        mov     lr, #0
        str     lr, [sp, #4]
LBKM32:
        ldr     r0, [sp, #0x30]
        mvn     r2, #0x7F
        add     lr, r12, r0
        ldr     r1, [r0, +r12]
        ldr     lr, [lr, #4]
        mov     r0, #0xFF, 12
        orr     r0, r0, #3, 4
        str     r1, [sp, #0xF0]
        add     r0, r0, #1, 2
        mov     r1, lr, lsr #24
        and     r0, lr, r0
        and     r1, r1, #0x80
        str     lr, [sp, #0xF4]
        mov     r0, r0, lsr #20
        tst     r1, r2
        str     r0, [sp, #0x10]
        beq     LBKM33
        mov     r0, #0xFF, 12
        orr     r0, r0, #3, 4
        sub     r0, r0, #1
        str     r0, [sp, #0x4C]
        str     r0, [sp, #0xF4]
        mov     lr, #1
        str     lr, [sp, #0x60]
        mov     lr, #4
        str     lr, [sp, #0xAC]
        b       LBKM37
LBKM33:
        cmp     lr, #1, 12
        bcs     LBKM34
        mov     r0, #0xFF, 12
        orr     r0, r0, #3, 4
        sub     r1, r0, #1
        mov     r0, #2
        str     r0, [sp, #0xAC]
        str     r1, [sp, #0x4C]
        str     r1, [sp, #0xF4]
        str     r0, [sp, #0x60]
        b       LBKM37
LBKM34:
        mov     r0, #0xFF, 12
        orr     r0, r0, #7, 4
        sub     r0, r0, #1
        cmp     r0, lr
        bcs     LBKM35
        tst     lr, #2, 14
        moveq   lr, #3
        streq   lr, [sp, #0x60]
        movne   lr, #4
        strne   lr, [sp, #0x60]
        mov     r0, #0xFF, 12
        orr     r0, r0, #3, 4
        sub     r0, r0, #1
        str     r0, [sp, #0x4C]
        str     r0, [sp, #0xF4]
        b       LBKM37
LBKM35:
        mov     r0, #0xFF, 12
        orr     r0, r0, #3, 4
        mov     r1, #0xFE
        add     r0, r0, #1, 2
        orr     r1, r1, #3, 24
        bic     r0, lr, r0
        orr     r1, r0, r1, lsl #20
        ldr     r0, [pc, #0x30C]
        mov     lr, #2
        add     lr, lr, #0xFF, 30
        cmp     r0, r1
        ldr     r0, [sp, #0x10]
        str     r1, [sp, #0x4C]
        sub     r0, r0, lr
        str     r0, [sp, #0x10]
        ldrls   lr, [sp, #0x4C]
        strls   lr, [sp, #0xF4]
        bls     LBKM36
        ldr     r1, [sp, #0x4C]
        mov     lr, #0xFF, 12
        orr     lr, lr, #3, 4
        add     lr, lr, #1, 2
        and     r0, r1, lr
        bic     lr, r1, lr
        mov     r0, r0, lsr #20
        mov     r1, #0xFF
        add     r0, r0, #1
        orr     r1, r1, #7, 24
        and     r0, r0, r1
        ldr     r1, [sp, #0x10]
        orr     r0, lr, r0, lsl #20
        str     r0, [sp, #0x4C]
        sub     r1, r1, #1
        str     r1, [sp, #0x10]
        str     r0, [sp, #0xF4]
LBKM36:
        mov     lr, #0
        str     lr, [sp, #0x60]
LBKM37:
        ldr     r0, [sp, #0x3C]
        mvn     r2, #0x7F
        add     lr, r0, r12
        ldr     r1, [r0, +r12]
        ldr     lr, [lr, #4]
        mov     r0, #0xFF, 12
        orr     r0, r0, #3, 4
        str     r1, [sp, #0xE8]
        add     r0, r0, #1, 2
        mov     r1, lr, lsr #24
        and     r0, lr, r0
        and     r1, r1, #0x80
        str     lr, [sp, #0xEC]
        mov     r0, r0, lsr #20
        tst     r1, r2
        str     r0, [sp, #8]
        beq     LBKM38
        mov     r0, #0xFF, 12
        orr     r0, r0, #3, 4
        sub     r0, r0, #1
        str     r0, [sp, #0x50]
        str     r0, [sp, #0xEC]
        mov     lr, #1
        str     lr, [sp, #0x6C]
        mov     lr, #4
        str     lr, [sp, #0xAC]
        b       LBKM42
LBKM38:
        cmp     lr, #1, 12
        bcs     LBKM39
        mov     r0, #0xFF, 12
        orr     r0, r0, #3, 4
        sub     r1, r0, #1
        mov     r0, #2
        str     r0, [sp, #0xAC]
        str     r1, [sp, #0x50]
        str     r1, [sp, #0xEC]
        str     r0, [sp, #0x6C]
        b       LBKM42
LBKM39:
        mov     r0, #0xFF, 12
        orr     r0, r0, #7, 4
        sub     r0, r0, #1
        cmp     r0, lr
        bcs     LBKM40
        tst     lr, #2, 14
        moveq   lr, #3
        streq   lr, [sp, #0x6C]
        movne   lr, #4
        strne   lr, [sp, #0x6C]
        mov     r0, #0xFF, 12
        orr     r0, r0, #3, 4
        sub     r0, r0, #1
        str     r0, [sp, #0x50]
        str     r0, [sp, #0xEC]
        b       LBKM42
LBKM40:
        mov     r0, #0xFF, 12
        orr     r0, r0, #3, 4
        mov     r1, #0xFE
        add     r0, r0, #1, 2
        orr     r1, r1, #3, 24
        bic     r0, lr, r0
        orr     r1, r0, r1, lsl #20
        ldr     r0, [pc, #0x1A0]
        mov     lr, #2
        add     lr, lr, #0xFF, 30
        cmp     r0, r1
        ldr     r0, [sp, #8]
        str     r1, [sp, #0x50]
        sub     r0, r0, lr
        str     r0, [sp, #8]
        ldrls   lr, [sp, #0x50]
        strls   lr, [sp, #0xEC]
        bls     LBKM41
        ldr     r1, [sp, #0x50]
        mov     lr, #0xFF, 12
        orr     lr, lr, #3, 4
        add     lr, lr, #1, 2
        and     r0, r1, lr
        bic     lr, r1, lr
        mov     r0, r0, lsr #20
        mov     r1, #0xFF
        add     r0, r0, #1
        orr     r1, r1, #7, 24
        and     r0, r0, r1
        ldr     r1, [sp, #8]
        orr     r0, lr, r0, lsl #20
        str     r0, [sp, #0x50]
        sub     r1, r1, #1
        str     r1, [sp, #8]
        str     r0, [sp, #0xEC]
LBKM41:
        mov     lr, #0
        str     lr, [sp, #0x6C]
LBKM42:
        ldr     lr, [sp, #0x14]
        mvn     r1, #0x7F
        add     r0, lr, #0x20
        add     lr, r0, r12
        ldr     r0, [r0, +r12]
        ldr     lr, [lr, #4]
        mov     r12, #0xFF, 12
        orr     r12, r12, #3, 4
        str     r0, [sp, #0xE0]
        add     r12, r12, #1, 2
        mov     r0, lr, lsr #24
        and     r12, lr, r12
        and     r0, r0, #0x80
        str     lr, [sp, #0xE4]
        mov     r12, r12, lsr #20
        tst     r0, r1
        str     r12, [sp, #0x64]
        beq     LBKM43
        mov     lr, #0xFF, 12
        orr     lr, lr, #3, 4
        sub     lr, lr, #1
        str     lr, [sp, #0x5C]
        ldr     lr, [sp, #0x68]
        mov     r12, #1
        str     lr, [sp, #0xE4]
        str     r12, [sp, #0xC]
        mov     r12, #4
        str     r12, [sp, #0xAC]
        b       LBKM47
LBKM43:
        cmp     lr, #1, 12
        bcs     LBKM44
        mov     lr, #0xFF, 12
        orr     r0, lr, #3, 4
        sub     r0, r0, #1
        str     r0, [sp, #0x5C]
        ldr     r0, [sp, #0x68]
        mov     lr, #2
        str     lr, [sp, #0xAC]
        str     r0, [sp, #0xE4]
        str     lr, [sp, #0xC]
        b       LBKM47
LBKM44:
        mov     r12, #0xFF, 12
        orr     r12, r12, #7, 4
        sub     r12, r12, #1
        cmp     r12, lr
        bcs     LBKM45
        tst     lr, #2, 14
        moveq   r12, #3
        streq   r12, [sp, #0xC]
        movne   r12, #4
        strne   r12, [sp, #0xC]
        mov     lr, #0xFF, 12
        orr     lr, lr, #3, 4
        sub     lr, lr, #1
        str     lr, [sp, #0x5C]
        ldr     lr, [sp, #0x68]
        str     lr, [sp, #0xE4]
        b       LBKM47
        .long   LBKM_x2.3623.0.0.0
        .long   LBKM_x4.3623.0.0.0
        .long   LBKM_x1.3623.0.0.0
        .long   LBKM_x1.3623.0.0.0
        .long   LBKM_x3.3623.0.0.0
        .long   LBKM_x11.3623.0.0.0
        .long   LBKM_x12.3623.0.0.0
        .long   LBKM_x13.3623.0.0.0
        .long   LBKM_x14.3623.0.0.0
        .long   LBKM_x2.3623.0.0.0
        .long   LBKM_INF.3623.0.0.0
        .long   LBKM_x3.3623.0.0.0
        .long   LBKM_x11.3623.0.0.0
        .long   LBKM_x12.3623.0.0.0
        .long   LBKM_x13.3623.0.0.0
        .long   LBKM_x4.3623.0.0.0
        .long   LBKM_x14.3623.0.0.0
        .long   ippConstantOfNAN_32f
        .long   0x3fe6a09e
        .long   LBKM_p
        .long   0xfefa39ef
        .long   0x3fe62e42
LBKM45:
        mov     r12, #0xFF, 12
        orr     r12, r12, #3, 4
        add     r0, r12, #1, 2
        bic     lr, lr, r0
        mov     r12, #0xFE, 12
        orr     r0, r12, #3, 4
        orr     lr, lr, r0
        ldr     r0, [pc, #-0x34]
        str     lr, [sp, #0x5C]
        mov     r12, #0xFE
        cmp     r0, lr
        ldr     lr, [sp, #0x64]
        orr     r12, r12, #3, 24
        sub     lr, lr, r12
        str     lr, [sp, #0x64]
        ldrls   r12, [sp, #0x5C]
        strls   r12, [sp, #0xE4]
        bls     LBKM46
        ldr     r12, [sp, #0x5C]
        mov     r0, #0xFF, 12
        orr     lr, r0, #7, 4
        and     lr, r12, lr
        orr     r0, r0, #3, 4
        mov     r1, lr, lsr #20
        mov     lr, #0xFF
        add     r1, r1, #1
        orr     lr, lr, #7, 24
        and     r1, r1, lr
        ldr     lr, [sp, #0x64]
        add     r0, r0, #1, 2
        bic     r12, r12, r0
        orr     r1, r12, r1, lsl #20
        sub     lr, lr, #1
        str     lr, [sp, #0x64]
        str     r1, [sp, #0x5C]
        str     r1, [sp, #0xE4]
LBKM46:
        mov     r12, #0
        str     r12, [sp, #0xC]
LBKM47:
        ldr     r1, [sp, #0xA8]
        ldr     r0, [sp, #0xA4]
        mov     r2, #0
        mov     r12, #0xFE, 12
        orr     r12, r12, #3, 4
        add     r3, r12, #1, 12
        str     r3, [sp, #0xA8]
        bl      __subdf3
        str     r0, [sp, #0xA4]
        ldr     r0, [sp, #0xA4]
        str     r1, [sp, #0xB0]
        str     r0, [sp, #0x110]
        ldr     r12, [sp, #0xB0]
        mov     r2, #0
        str     r12, [sp, #0x114]
        ldr     r3, [sp, #0xA8]
        ldr     r0, [sp, #0x98]
        ldr     r1, [sp, #0x9C]
        bl      __subdf3
        str     r0, [sp, #0x9C]
        str     r0, [sp, #0x100]
        str     r1, [sp, #0x98]
        str     r1, [sp, #0x104]
        ldr     r0, [sp, #0x90]
        ldr     r1, [sp, #0x94]
        ldr     r3, [sp, #0xA8]
        mov     r2, #0
        bl      __subdf3
        str     r1, [sp, #0xA8]
        ldr     r1, [sp, #0x8C]
        str     r0, [sp, #0x94]
        str     r0, [sp, #0x108]
        ldr     r12, [sp, #0xA8]
        mov     r2, #0
        str     r12, [sp, #0x10C]
        ldr     r0, [sp, #0x88]
        mov     r12, #2
        add     r12, r12, #0xFF, 30
        mov     r12, r12, lsl #20
        add     r3, r12, #1, 12
        bl      __subdf3
        str     r0, [sp, #0x90]
        str     r0, [sp, #0xF8]
        str     r1, [sp, #0x8C]
        str     r1, [sp, #0xFC]
        ldr     r0, [sp, #0xA4]
        ldr     r1, [sp, #0xB0]
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [sp, #0x78]
        ldr     r3, [sp, #0x7C]
        bl      __muldf3
        ldr     r3, [sp, #0x84]
        ldr     r2, [sp, #0x80]
        bl      __muldf3
        str     r0, [sp, #0xB0]
        str     r1, [sp, #0xA4]
        ldr     r1, [sp, #0xA8]
        ldr     r0, [sp, #0x94]
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [sp, #0x78]
        ldr     r3, [sp, #0x7C]
        bl      __muldf3
        ldr     r3, [sp, #0x74]
        ldr     r2, [sp, #0x70]
        bl      __muldf3
        str     r0, [sp, #0xA8]
        ldr     r0, [sp, #0x9C]
        str     r1, [sp, #0x94]
        ldr     r1, [sp, #0x98]
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __muldf3
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        str     r0, [sp, #0x9C]
        ldr     r0, [sp, #0x90]
        str     r1, [sp, #0x98]
        ldr     r1, [sp, #0x8C]
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __muldf3
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        ldr     r2, [sp, #0xB0]
        ldr     r3, [sp, #0xA4]
        str     r1, [sp, #0x8C]
        ldr     r1, [sp, #0xA4]
        str     r0, [sp, #0x90]
        mov     r0, r2
        bl      __muldf3
        ldr     r3, [sp, #0x98]
        mov     r9, r0
        ldr     r0, [sp, #0x9C]
        mov     r8, r1
        ldr     r1, [sp, #0x98]
        mov     r2, r0
        bl      __muldf3
        ldr     r3, [sp, #0x94]
        mov     r6, r0
        ldr     r0, [sp, #0xA8]
        mov     r7, r1
        ldr     r1, [sp, #0x94]
        mov     r2, r0
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r0, [sp, #0x90]
        ldr     r1, [sp, #0x8C]
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        str     r0, [sp, #0x88]
        ldr     r0, [sp, #0x20]
        str     r1, [sp, #0x84]
        bl      __floatsidf
        ldr     r12, [pc, #-0x2A8]
        ldr     r11, [r12]
        ldr     r10, [r12, #4]
        str     r0, [sp, #0x80]
        str     r1, [sp, #0x7C]
        mov     r0, r9
        mov     r1, r8
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        str     r0, [sp, #0x78]
        ldr     r0, [sp, #0x28]
        str     r1, [sp, #0x74]
        bl      __floatsidf
        str     r1, [sp, #0x28]
        str     r0, [sp, #0x70]
        mov     r0, r4
        mov     r1, r5
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #0x34]
        str     r1, [sp, #0x34]
        bl      __floatsidf
        str     r0, [sp, #0xB4]
        str     r1, [sp, #0xB8]
        mov     r0, r6
        mov     r1, r7
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        str     r0, [sp, #0xBC]
        ldr     r0, [sp, #0x40]
        str     r1, [sp, #0xC0]
        bl      __floatsidf
        str     r0, [sp, #0x40]
        ldr     r0, [sp, #0x88]
        str     r1, [sp, #0xC4]
        ldr     r1, [sp, #0x84]
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldr     r12, [pc, #-0x354]
        ldr     r3, [sp, #0x74]
        ldr     r2, [sp, #0x78]
        ldr     r11, [r12, #8]
        ldr     r10, [r12, #0xC]
        str     r1, [sp, #0xCC]
        str     r0, [sp, #0xC8]
        mov     r0, r11
        mov     r1, r10
        bl      __adddf3
        ldr     r2, [pc, #-0x378]
        ldr     r3, [pc, #-0x378]
        str     r0, [sp, #0x78]
        ldr     r0, [sp, #0x80]
        str     r1, [sp, #0x74]
        ldr     r1, [sp, #0x7C]
        bl      __muldf3
        ldr     r2, [sp, #0x20]
        ldr     r3, [sp, #0x34]
        str     r0, [sp, #0x80]
        str     r1, [sp, #0x7C]
        mov     r0, r11
        mov     r1, r10
        bl      __adddf3
        ldr     r2, [pc, #-0x3B0]
        ldr     r3, [pc, #-0x3B0]
        str     r0, [sp, #0x34]
        ldr     r0, [sp, #0x70]
        str     r1, [sp, #0x20]
        ldr     r1, [sp, #0x28]
        bl      __muldf3
        ldr     r3, [sp, #0xC0]
        ldr     r2, [sp, #0xBC]
        str     r0, [sp, #0x70]
        str     r1, [sp, #0x28]
        mov     r0, r11
        mov     r1, r10
        bl      __adddf3
        str     r1, [sp, #0xBC]
        ldr     r1, [sp, #0xB8]
        str     r0, [sp, #0xC0]
        ldr     r2, [pc, #-0x3F4]
        ldr     r3, [pc, #-0x3F4]
        ldr     r0, [sp, #0xB4]
        bl      __muldf3
        ldr     r3, [sp, #0xCC]
        ldr     r2, [sp, #0xC8]
        str     r0, [sp, #0xB8]
        str     r1, [sp, #0xB4]
        mov     r0, r11
        mov     r1, r10
        bl      __adddf3
        str     r1, [sp, #0xC8]
        ldr     r2, [pc, #-0x424]
        ldr     r3, [pc, #-0x424]
        str     r0, [sp, #0xCC]
        ldr     r0, [sp, #0x40]
        ldr     r1, [sp, #0xC4]
        bl      __muldf3
        str     r1, [sp, #0x40]
        ldr     r1, [sp, #0x74]
        str     r0, [sp, #0xC4]
        ldr     r0, [sp, #0x78]
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        ldr     r12, [pc, #-0x45C]
        ldr     r11, [r12, #0x10]
        ldr     r10, [r12, #0x14]
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        str     r1, [sp, #0x74]
        ldr     r1, [sp, #0x20]
        str     r0, [sp, #0x78]
        ldr     r0, [sp, #0x34]
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        str     r0, [sp, #0x34]
        ldr     r0, [sp, #0xC0]
        str     r1, [sp, #0x20]
        ldr     r1, [sp, #0xBC]
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        ldr     r2, [sp, #0x88]
        ldr     r3, [sp, #0x84]
        str     r0, [sp, #0xC0]
        ldr     r0, [sp, #0xCC]
        str     r1, [sp, #0xBC]
        ldr     r1, [sp, #0xC8]
        bl      __muldf3
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        str     r0, [sp, #0xCC]
        ldr     r0, [sp, #0x78]
        str     r1, [sp, #0xC8]
        ldr     r1, [sp, #0x74]
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        ldr     r12, [pc, #-0x508]
        ldr     r11, [r12, #0x18]
        ldr     r10, [r12, #0x1C]
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        ldr     r12, [sp, #0xD8]
        str     r1, [sp, #0x74]
        str     r0, [sp, #0x78]
        str     r12, [sp, #0x110]
        ldr     r0, [sp, #0x34]
        ldr     r1, [sp, #0x20]
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        ldr     lr, [sp, #0xF0]
        str     r0, [sp, #0x34]
        str     r1, [sp, #0x20]
        str     lr, [sp, #0x108]
        ldr     r1, [sp, #0xBC]
        ldr     r0, [sp, #0xC0]
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        ldr     r2, [sp, #0x88]
        ldr     lr, [sp, #0xE8]
        str     r1, [sp, #0xBC]
        str     r0, [sp, #0xC0]
        str     lr, [sp, #0x100]
        ldr     r3, [sp, #0x84]
        ldr     r1, [sp, #0xC8]
        ldr     r0, [sp, #0xCC]
        bl      __muldf3
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        ldr     r12, [sp, #0xE0]
        str     r0, [sp, #0xCC]
        ldr     r0, [sp, #0x78]
        str     r1, [sp, #0xC8]
        str     r12, [sp, #0xF8]
        ldr     r1, [sp, #0x74]
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        ldr     r12, [pc, #-0x5D4]
        ldr     r9, [r12, #0x20]
        ldr     r8, [r12, #0x24]
        mov     r2, r9
        mov     r3, r8
        bl      __adddf3
        str     r0, [sp, #0x78]
        ldr     r0, [sp, #0x34]
        str     r1, [sp, #0x74]
        ldr     r1, [sp, #0x20]
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        mov     r2, r9
        mov     r3, r8
        bl      __adddf3
        mov     r4, r0
        mov     r5, r1
        ldr     r0, [sp, #0xC0]
        ldr     r1, [sp, #0xBC]
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        mov     r2, r9
        mov     r3, r8
        bl      __adddf3
        ldr     r2, [sp, #0x88]
        ldr     r3, [sp, #0x84]
        mov     r6, r0
        ldr     r0, [sp, #0xCC]
        mov     r7, r1
        ldr     r1, [sp, #0xC8]
        bl      __muldf3
        mov     r2, r9
        mov     r3, r8
        bl      __adddf3
        mov     r8, r0
        mov     r9, r1
        ldr     r2, [sp, #0x78]
        ldr     r3, [sp, #0x74]
        ldr     r0, [sp, #0xB0]
        ldr     r1, [sp, #0xA4]
        bl      __muldf3
        ldr     r2, [sp, #0x80]
        ldr     r3, [sp, #0x7C]
        bl      __adddf3
        mov     r11, r0
        mov     r10, r1
        ldr     r0, [sp, #0xA8]
        ldr     r1, [sp, #0x94]
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [sp, #0x70]
        ldr     r3, [sp, #0x28]
        bl      __adddf3
        mov     r5, r0
        mov     r4, r1
        ldr     r0, [sp, #0x9C]
        ldr     r1, [sp, #0x98]
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        ldr     r2, [sp, #0xB8]
        ldr     r3, [sp, #0xB4]
        bl      __adddf3
        mov     r7, r0
        mov     r6, r1
        ldr     r0, [sp, #0x90]
        ldr     r1, [sp, #0x8C]
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        ldr     r3, [sp, #0x40]
        ldr     r2, [sp, #0xC4]
        bl      __adddf3
        ldr     r2, [sp, #0x1C]
        mov     r9, r0
        mov     r8, r1
        cmp     r2, #0
        ldr     r2, [sp]
        str     r2, [sp, #0x20]
        ldr     r2, [sp, #0x10]
        str     r2, [sp, #0x28]
        ldr     r2, [sp, #8]
        str     r2, [sp, #0x34]
        ldr     r2, [sp, #0x64]
        str     r2, [sp, #0x40]
        beq     LBKM48
        ldr     r2, [sp, #0x1C]
        cmp     r2, #1
        beq     LBKM65
        ldr     r2, [sp, #0x1C]
        cmp     r2, #2
        beq     LBKM63
        ldr     r2, [sp, #0x1C]
        cmp     r2, #3
        beq     LBKM61
        ldr     r2, [sp, #0x1C]
        cmp     r2, #4
        beq     LBKM60
        b       LBKM49
LBKM48:
        mov     r0, r11
        mov     r1, r10
        bl      __truncdfsf2
        ldr     r2, [sp, #0x18]
        ldr     r3, [sp, #0xA0]
        sub     r2, r2, #0xC
        str     r0, [r2, +r3, lsl #2]
LBKM49:
        ldr     r2, [sp, #0x2C]
        cmp     r2, #0
        ldr     r2, [sp, #4]
        str     r2, [sp, #0x1C]
        beq     LBKM50
        ldr     r2, [sp, #0x2C]
        cmp     r2, #1
        beq     LBKM71
        ldr     r2, [sp, #0x2C]
        cmp     r2, #2
        beq     LBKM69
        ldr     r2, [sp, #0x2C]
        cmp     r2, #3
        beq     LBKM67
        ldr     r2, [sp, #0x2C]
        cmp     r2, #4
        beq     LBKM66
        b       LBKM51
LBKM50:
        mov     r0, r5
        mov     r1, r4
        bl      __truncdfsf2
        ldr     r2, [sp, #0x18]
        ldr     r3, [sp, #0xA0]
        sub     r2, r2, #8
        str     r0, [r2, +r3, lsl #2]
LBKM51:
        ldr     r2, [sp, #0x38]
        cmp     r2, #0
        ldr     r2, [sp, #0x60]
        str     r2, [sp, #0x2C]
        beq     LBKM52
        ldr     r2, [sp, #0x38]
        cmp     r2, #1
        beq     LBKM77
        ldr     r2, [sp, #0x38]
        cmp     r2, #2
        beq     LBKM75
        ldr     r2, [sp, #0x38]
        cmp     r2, #3
        beq     LBKM73
        ldr     r2, [sp, #0x38]
        cmp     r2, #4
        beq     LBKM72
        b       LBKM53
LBKM52:
        mov     r0, r7
        mov     r1, r6
        bl      __truncdfsf2
        ldr     r2, [sp, #0x18]
        ldr     r3, [sp, #0xA0]
        sub     r2, r2, #4
        str     r0, [r2, +r3, lsl #2]
LBKM53:
        ldr     r2, [sp, #0x44]
        cmp     r2, #0
        ldr     r2, [sp, #0x6C]
        str     r2, [sp, #0x38]
        beq     LBKM54
        ldr     r0, [sp, #0x44]
        cmp     r0, #1
        beq     LBKM83
        ldr     r0, [sp, #0x44]
        cmp     r0, #2
        beq     LBKM81
        ldr     r0, [sp, #0x44]
        cmp     r0, #3
        beq     LBKM79
        ldr     r0, [sp, #0x44]
        cmp     r0, #4
        beq     LBKM78
        b       LBKM55
LBKM54:
        mov     r0, r9
        mov     r1, r8
        bl      __truncdfsf2
        ldr     r1, [sp, #0x18]
        ldr     r2, [sp, #0xA0]
        str     r0, [r1, +r2, lsl #2]
LBKM55:
        ldr     r0, [sp, #0xA0]
        ldr     r1, [sp, #0x58]
        add     r0, r0, #4
        str     r0, [sp, #0xA0]
        cmp     r0, r1
        ldr     r0, [sp, #0xC]
        str     r0, [sp, #0x44]
        bge     LBKM84
        ldr     r3, [sp, #0x5C]
        str     r3, [sp, #0xFC]
        ldr     r3, [sp, #0x50]
        str     r3, [sp, #0x104]
        ldr     r2, [sp, #0x4C]
        str     r2, [sp, #0x10C]
        ldr     r1, [sp, #0x48]
        str     r1, [sp, #0x114]
        b       LBKM27
LBKM56:
        mvn     r0, #5
        add     sp, sp, #0x46, 30
        ldmia   sp!, {r4 - r11, pc}
LBKM57:
        str     r10, [sp, #0xAC]
LBKM58:
        ldr     r0, [sp, #0xAC]
        cmp     r0, #0
        beq     LBKM59
        ldr     r0, [sp, #0xAC]
        cmp     r0, #2
        beq     LBKM92
        mov     r0, #8
        add     sp, sp, #0x46, 30
        ldmia   sp!, {r4 - r11, pc}
LBKM59:
        mov     r0, #0
        add     sp, sp, #0x46, 30
        ldmia   sp!, {r4 - r11, pc}
LBKM60:
        ldr     r2, [sp, #0x18]
        ldr     r3, [sp, #0xD0]
        ldr     r12, [sp, #0xA0]
        sub     r2, r2, #0xC
        eor     r3, r3, #2, 2
        str     r3, [r2, +r12, lsl #2]
        b       LBKM49
LBKM61:
        ldr     r2, [sp, #0xA0]
        ldr     r12, [sp, #0xD4]
        mov     r3, r2, lsl #2
        ldr     r2, [sp, #0x18]
        sub     r2, r2, #0xC
LBKM62:
        eor     r12, r12, #2, 2
        str     r12, [r2, +r3]
        b       LBKM49
LBKM63:
        ldr     r2, [sp, #0xA0]
        mov     r3, r2, lsl #2
        ldr     r2, [sp, #0x18]
        sub     r2, r2, #0xC
        add     lr, r3, r2
LBKM64:
        ldr     r10, [sp, #0x1C]
        ldr     r12, [sp, #0xD4]
        cmp     r10, #3
        strne   r12, [lr]
        beq     LBKM62
        b       LBKM49
LBKM65:
        ldr     r2, [sp, #0xA0]
        ldr     r12, [sp, #0xD0]
        ldr     lr, [sp, #0x1C]
        mov     r3, r2, lsl #2
        ldr     r2, [sp, #0x18]
        cmp     lr, #2
        sub     r2, r2, #0xC
        add     lr, r3, r2
        ldrne   r3, [sp, #0xA0]
        strne   r12, [r2, +r3, lsl #2]
        beq     LBKM64
        b       LBKM49
LBKM66:
        ldr     r2, [sp, #0x18]
        ldr     r3, [sp, #0xD0]
        ldr     r12, [sp, #0xA0]
        sub     r2, r2, #8
        eor     r3, r3, #2, 2
        str     r3, [r2, +r12, lsl #2]
        b       LBKM51
LBKM67:
        ldr     r2, [sp, #0xA0]
        ldr     r3, [sp, #0x18]
        ldr     r12, [sp, #0xD4]
        mov     r2, r2, lsl #2
        sub     r3, r3, #8
LBKM68:
        eor     r12, r12, #2, 2
        str     r12, [r3, +r2]
        b       LBKM51
LBKM69:
        ldr     r2, [sp, #0xA0]
        ldr     r3, [sp, #0x18]
        mov     r2, r2, lsl #2
        sub     r3, r3, #8
        add     lr, r2, r3
LBKM70:
        ldr     r4, [sp, #0x2C]
        ldr     r12, [sp, #0xD4]
        cmp     r4, #3
        strne   r12, [lr]
        beq     LBKM68
        b       LBKM51
LBKM71:
        ldr     r2, [sp, #0xA0]
        ldr     r3, [sp, #0x18]
        ldr     lr, [sp, #0x2C]
        ldr     r12, [sp, #0xD0]
        mov     r2, r2, lsl #2
        cmp     lr, #2
        sub     r3, r3, #8
        add     lr, r2, r3
        ldrne   r2, [sp, #0xA0]
        strne   r12, [r3, +r2, lsl #2]
        beq     LBKM70
        b       LBKM51
LBKM72:
        ldr     r2, [sp, #0x18]
        ldr     r3, [sp, #0xD0]
        ldr     r12, [sp, #0xA0]
        sub     r2, r2, #4
        eor     r3, r3, #2, 2
        str     r3, [r2, +r12, lsl #2]
        b       LBKM53
LBKM73:
        ldr     r2, [sp, #0xA0]
        ldr     r3, [sp, #0x18]
        ldr     r12, [sp, #0xD4]
        mov     r2, r2, lsl #2
        sub     r3, r3, #4
LBKM74:
        eor     r12, r12, #2, 2
        str     r12, [r3, +r2]
        b       LBKM53
LBKM75:
        ldr     r2, [sp, #0xA0]
        ldr     r3, [sp, #0x18]
        mov     r2, r2, lsl #2
        sub     r3, r3, #4
        add     lr, r2, r3
LBKM76:
        ldr     r4, [sp, #0x38]
        ldr     r12, [sp, #0xD4]
        cmp     r4, #3
        strne   r12, [lr]
        beq     LBKM74
        b       LBKM53
LBKM77:
        ldr     r2, [sp, #0xA0]
        ldr     r3, [sp, #0x18]
        ldr     lr, [sp, #0x38]
        ldr     r12, [sp, #0xD0]
        mov     r2, r2, lsl #2
        cmp     lr, #2
        sub     r3, r3, #4
        add     lr, r2, r3
        ldrne   r2, [sp, #0xA0]
        strne   r12, [r3, +r2, lsl #2]
        beq     LBKM76
        b       LBKM53
LBKM78:
        ldr     r0, [sp, #0xD0]
        ldr     r1, [sp, #0x18]
        ldr     r2, [sp, #0xA0]
        eor     r0, r0, #2, 2
        str     r0, [r1, +r2, lsl #2]
        b       LBKM55
LBKM79:
        ldr     r0, [sp, #0xA0]
        ldr     r1, [sp, #0xD4]
        mov     r0, r0, lsl #2
LBKM80:
        ldr     r2, [sp, #0x18]
        eor     r1, r1, #2, 2
        str     r1, [r0, +r2]
        b       LBKM55
LBKM81:
        ldr     r0, [sp, #0xA0]
        ldr     r1, [sp, #0x18]
        mov     r0, r0, lsl #2
        add     r2, r1, r0
LBKM82:
        ldr     r3, [sp, #0x44]
        ldr     r1, [sp, #0xD4]
        cmp     r3, #3
        strne   r1, [r2]
        beq     LBKM80
        b       LBKM55
LBKM83:
        ldr     r2, [sp, #0x44]
        ldr     r0, [sp, #0xA0]
        ldr     r1, [sp, #0xD0]
        cmp     r2, #2
        ldr     r2, [sp, #0x18]
        mov     r0, r0, lsl #2
        add     r2, r2, r0
        beq     LBKM82
        ldr     r0, [sp, #0x18]
        ldr     r2, [sp, #0xA0]
        str     r1, [r0, +r2, lsl #2]
        b       LBKM55
LBKM84:
        ldr     r12, [sp, #0x48]
        ldr     r5, [sp, #0xA0]
        ldr     r4, [sp, #0x58]
        mov     lr, r12
LBKM85:
        add     r0, r4, #3
        cmp     r5, r0
        beq     LBKM58
        sub     r0, r5, #3
        cmp     r0, r4
        bge     LBKM58
        ldr     r5, [pc, #-0xBB8]
        mov     r1, #0xFF, 12
        str     lr, [sp, #0x114]
        orr     r8, r1, #7, 4
        ldr     r1, [sp, #0x14]
        sub     r10, r4, r0
        mvn     r11, #0x7F
        add     r6, r1, r0, lsl #3
        ldr     r1, [sp, #0x18]
        add     r7, r1, r0, lsl #2
        add     r0, r8, #2, 14
        str     r0, [sp, #0xA8]
LBKM86:
        ldr     r4, [r6, #4]
        ldr     r9, [r6]
        mov     r3, r4, lsr #24
        and     r3, r3, #0x80
        tst     r3, r11
        str     r9, [sp, #0x110]
        str     r4, [sp, #0x114]
        beq     LBKM87
        ldr     r1, [r5]
        mov     r0, #4
        str     r0, [sp, #0xAC]
        str     r1, [r7]
        b       LBKM90
LBKM87:
        ldr     r2, [sp, #0x114]
        add     r3, r8, #2, 14
        and     r2, r2, r3
        ldr     r3, [sp, #0xA8]
        cmp     r3, r2
        bne     LBKM88
        ldr     r0, [r5]
        eor     r0, r0, #2, 2
        str     r0, [r7]
        b       LBKM90
LBKM88:
        mov     r0, r9
        mov     r1, r4
        mov     r2, #0
        mov     r3, #0
        bl      __gedf2
        cmp     r0, #0
        blt     LBKM89
        mov     r0, r9
        mov     r1, r4
        mov     r2, #0
        mov     r3, #1, 12
        bl      __ltdf2
        cmp     r0, #0
        bge     LBKM89
        ldr     r1, [sp, #0xD4]
        mov     r0, #2
        str     r0, [sp, #0xAC]
        str     r1, [r7]
        b       LBKM90
LBKM89:
        mov     r1, r4
        mov     r0, r9
        bl      log
        bl      __truncdfsf2
        str     r0, [r7]
LBKM90:
        subs    r10, r10, #1
        add     r6, r6, #8
        add     r7, r7, #4
        bne     LBKM86
        b       LBKM58
LBKM91:
        mvn     r0, #7
        add     sp, sp, #0x46, 30
        ldmia   sp!, {r4 - r11, pc}
LBKM92:
        mov     r0, #7
        add     sp, sp, #0x46, 30
        ldmia   sp!, {r4 - r11, pc}


        .data
        .align  4


LBKM_x1.3623.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LBKM_x2.3623.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LBKM_x3.3623.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LBKM_x4.3623.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LBKM_x11.3623.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LBKM_x12.3623.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LBKM_x13.3623.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LBKM_x14.3623.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LBKM_INF.3623.0.0.0:
        .byte   0x00,0x00,0x80,0xFF


        .data
        .align  4


LBKM_p:
        .byte   0xAE,0x5B,0xE5,0x4A,0x7B,0x6A,0xCE,0x3F,0x52,0x7E,0x99,0x37,0x99,0x41,0xD2,0x3F
        .byte   0xDA,0x68,0x04,0xAE,0xB2,0x99,0xD9,0x3F,0xDE,0x42,0x5D,0x44,0x55,0x55,0xE5,0x3F
        .byte   0x04,0x9B,0x01,0x00,0x00,0x00,0x00,0x40


