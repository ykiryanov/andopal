        .text
        .align  4
        .globl  _ippsVLCDecodeEscBlock_AAC_1u16s


_ippsVLCDecodeEscBlock_AAC_1u16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x44
        ldr     lr, [sp, #0x68]
        cmp     r0, #0
        beq     LGAF55
        cmp     r1, #0
        beq     LGAF55
        cmp     r2, #0
        beq     LGAF55
        cmp     lr, #0
        beq     LGAF55
        ldr     r12, [r1]
        cmp     r12, #0
        blt     LGAF0
        cmp     r12, #7
        ble     LGAF1
LGAF0:
        mvn     r0, #0xC0
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LGAF1:
        and     r4, lr, #0x1F
        rsb     r4, r4, #0
        and     r6, r4, #0x1F
        ldr     r4, [r6, +lr]
        ldr     r5, [pc, #0xD2C]
        add     r9, lr, r6
        cmp     r5, r4
        beq     LGAF2
        mvn     r0, #0x10
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LGAF2:
        ldr     r10, [r0]
        ldr     r6, [r9, #0xC]
        ldr     r5, [r9, #8]
        ldr     r8, [r9, #0x14]
        ands    lr, r10, #3
        sub     r11, r10, lr
        sub     r4, r10, r11
        mov     r4, r4, lsl #3
        rsb     r4, r4, #0
        sub     r4, r4, r12
        add     r7, r4, #0x20
        mov     r12, #1
        add     r4, r8, #1
        mov     r12, r12, lsl r4
        sub     r12, r12, #1
        beq     LGAF47
        rsb     lr, lr, #4
        str     lr, [sp, #0x2C]
        str     r1, [sp, #0x20]
        ldr     r1, [sp, #0x2C]
        mov     lr, #0
        str     r0, [sp, #0x24]
LGAF3:
        ldrb    r0, [r10], #1
        subs    r1, r1, #1
        orr     lr, r0, lr, lsl #8
        bne     LGAF3
        ldr     r1, [sp, #0x20]
        ldr     r0, [sp, #0x24]
LGAF4:
        ldr     r9, [r9, #0x10]
        bic     r3, r3, #1
        str     r3, [sp, #0x2C]
        ldr     r3, [r11, #4]
        cmp     r9, #0x20
        add     r11, r11, #8
        and     r10, r3, #0xFF, 24
        mov     r9, r3, lsr #8
        str     r11, [sp, #0x30]
        mov     r10, r10, lsl #8
        mvn     r11, #0xFF, 8
        and     r9, r9, #0xFF, 24
        orr     r10, r10, r3, lsl #24
        bic     r11, r3, r11
        orr     r9, r10, r9
        orr     r3, r9, r11, lsr #24
        beq     LGAF26
        ldr     r9, [sp, #0x2C]
        cmp     r9, #0
        ble     LGAF13
        add     r8, r8, #9
        str     r8, [sp, #0x34]
        ldr     r8, [pc, #0xC4C]
        add     r11, r2, #2
        mov     r10, #0
        add     r9, r6, #2
        sub     r8, r8, #0x84
        str     r11, [sp, #4]
        str     r2, [sp, #0x1C]
        str     r1, [sp, #0x20]
        str     r0, [sp, #0x24]
LGAF5:
        ldrh    r0, [r6]
        cmp     r7, r5
        str     r0, [sp, #8]
        bge     LGAF6
        ldr     r1, [r8, +r7, lsl #2]
        sub     r2, r5, r7
        str     r2, [sp, #0x28]
        ldr     r11, [sp, #0x28]
        rsb     r2, r2, #0x20
        mov     r2, r3, lsr r2
        and     r1, lr, r1
        orr     r2, r2, r1, lsl r11
        b       LGAF7
LGAF6:
        ldr     r2, [r8, +r5, lsl #2]
        sub     r1, r7, r5
        and     r2, r2, lr, lsr r1
LGAF7:
        sub     r1, r5, r0
        mov     r1, r2, lsr r1
        mov     r1, r1, lsl #1
        ldrh    r1, [r9, +r1]
        mov     r11, r1, asr #1
        str     r11, [sp, #0x28]
        tst     r1, #1
        movne   r11, #0
        bne     LGAF9
        str     r12, [sp, #0x14]
        str     r4, [sp, #0x18]
        ldr     r12, [sp, #0x28]
        ldr     r4, [sp, #8]
        mov     r11, #0
        str     r7, [sp, #0x10]
LGAF8:
        mov     r1, r12, lsl #1
        add     r11, r11, r0
        ldrh    r0, [r6, +r1]
        ldr     r1, [r8, +r0, lsl #2]
        add     r4, r0, r4
        sub     r7, r5, r4
        and     r7, r1, r2, lsr r7
        add     r12, r7, r12
        mov     r1, r12, lsl #1
        ldrh    r1, [r9, +r1]
        tst     r1, #1
        mov     r12, r1, asr #1
        beq     LGAF8
        ldr     r7, [sp, #0x10]
        ldr     r12, [sp, #0x14]
        ldr     r4, [sp, #0x18]
LGAF9:
        and     r2, r12, r1
        mov     r0, r1, lsl #16
        add     r11, r11, r2, asr #1
        mov     r2, r1, asr r4
        mov     r1, r0, asr #16
        and     r0, r2, #0xFF
        ldr     r2, [sp, #0x34]
        sub     r7, r7, r11
        cmp     r7, #0
        mov     r1, r1, asr r2
        sub     r0, r0, #0x80
        bgt     LGAF10
        ldr     r11, [sp, #0x30]
        add     r7, r7, #0x20
        mov     lr, r3
        ldr     r2, [r11], #4
        str     r11, [sp, #0x30]
        mvn     r11, #0xFF, 8
        and     r3, r2, #0xFF, 24
        str     r3, [sp, #0x28]
        mov     r3, r2, lsr #8
        str     r3, [sp, #0xC]
        ldr     r3, [sp, #0x28]
        mov     r3, r3, lsl #8
        orr     r3, r3, r2, lsl #24
        str     r3, [sp, #0x28]
        ldr     r3, [sp, #0xC]
        str     r11, [sp, #0xC]
        ldr     r11, [sp, #0x28]
        and     r3, r3, #0xFF, 24
        orr     r3, r11, r3
        ldr     r11, [sp, #0xC]
        bic     r11, r2, r11
        orr     r3, r3, r11, lsr #24
LGAF10:
        cmp     r1, #0x10
        beq     LGAF23
        cmn     r1, #0x10
        beq     LGAF20
        ldr     r11, [sp, #0x1C]
        mov     r2, r10, lsl #1
        strh    r1, [r11, +r2]
LGAF11:
        cmp     r0, #0x10
        beq     LGAF17
        cmn     r0, #0x10
        ldrne   r1, [sp, #4]
        strneh  r0, [r1, +r2]
        beq     LGAF14
LGAF12:
        ldr     r0, [sp, #0x2C]
        add     r10, r10, #2
        cmp     r10, r0
        blt     LGAF5
        ldr     r1, [sp, #0x20]
        ldr     r0, [sp, #0x24]
LGAF13:
        ldr     r2, [sp, #0x30]
        rsb     r7, r7, #0x20
        sub     r2, r2, #8
        add     r2, r2, r7, asr #3
        str     r2, [r0]
        and     r7, r7, #7
        mov     r0, #0
        str     r7, [r1]
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LGAF14:
        cmp     r7, #0x15
        bge     LGAF15
        ldr     r0, [r8, +r7, lsl #2]
        rsb     r11, r7, #0x15
        str     r11, [sp, #0x28]
        ldr     r11, [sp, #0x28]
        add     r1, r7, #0xB
        and     r0, lr, r0
        mov     r1, r3, lsr r1
        orr     r0, r1, r0, lsl r11
        b       LGAF16
LGAF15:
        ldr     r0, [pc, #0xA44]
        sub     r1, r7, #0x15
        ldr     r0, [r0, #-0x30]
        and     r0, r0, lr, lsr r1
LGAF16:
        ldr     r1, [pc, #0xA34]
        ldrb    r1, [r1, +r0, lsr #12]
        cmp     r1, #0xC
        bgt     LGAF53
        mov     r11, r1, lsl #1
        str     r11, [sp, #0x28]
        mov     r11, #1
        mov     r11, r11, lsl r1
        ldr     r1, [sp, #0x28]
        str     r11, [sp, #8]
        sub     r11, r11, #1
        rsb     r1, r1, #0x18
        and     r1, r11, r0, lsr r1
        ldr     r0, [sp, #0x28]
        ldr     r11, [sp, #4]
        sub     r0, r7, r0
        ldr     r7, [sp, #8]
        add     r1, r1, r7
        add     r7, r0, #3
        rsb     r1, r1, #0
        cmp     r7, #0
        strh    r1, [r11, +r2]
        bgt     LGAF12
        ldr     r1, [sp, #0x30]
        add     r7, r0, #0x23
        mov     lr, r3
        ldr     r2, [r1], #4
        str     r1, [sp, #0x30]
        str     r2, [sp, #0x28]
        ldr     r0, [sp, #0x28]
        ldr     r1, [sp, #0x28]
        and     r2, r0, #0xFF, 24
        mov     r0, r0, lsr #8
        mov     r2, r2, lsl #8
        orr     r1, r2, r1, lsl #24
        and     r2, r0, #0xFF, 24
        orr     r1, r1, r2
        ldr     r2, [sp, #0x28]
        mvn     r0, #0xFF, 8
        bic     r0, r2, r0
        orr     r3, r1, r0, lsr #24
        b       LGAF12
LGAF17:
        cmp     r7, #0x15
        bge     LGAF18
        ldr     r0, [r8, +r7, lsl #2]
        rsb     r11, r7, #0x15
        str     r11, [sp, #0x28]
        ldr     r11, [sp, #0x28]
        add     r1, r7, #0xB
        mov     r1, r3, lsr r1
        and     r0, lr, r0
        orr     r1, r1, r0, lsl r11
        b       LGAF19
LGAF18:
        ldr     r0, [pc, #0x960]
        sub     r1, r7, #0x15
        ldr     r0, [r0, #-0x30]
        and     r1, r0, lr, lsr r1
LGAF19:
        ldr     r0, [pc, #0x950]
        ldrb    r0, [r0, +r1, lsr #12]
        cmp     r0, #0xC
        str     r0, [sp, #0x28]
        bgt     LGAF49
        ldr     r0, [sp, #0x28]
        mov     r11, r0, lsl #1
        str     r11, [sp, #8]
        mov     r11, #1
        mov     r0, r11, lsl r0
        str     r0, [sp, #0x28]
        ldr     r0, [sp, #8]
        rsb     r0, r0, #0x18
        str     r0, [sp]
        ldr     r0, [sp, #0x28]
        sub     r0, r0, #1
        str     r0, [sp, #0x38]
        ldr     r0, [sp, #8]
        ldr     r11, [sp, #0x38]
        sub     r0, r7, r0
        ldr     r7, [sp]
        and     r1, r11, r1, lsr r7
        ldr     r11, [sp, #0x28]
        add     r7, r0, #3
        cmp     r7, #0
        add     r1, r1, r11
        ldr     r11, [sp, #4]
        strh    r1, [r11, +r2]
        bgt     LGAF12
        ldr     r1, [sp, #0x30]
        add     r7, r0, #0x23
        mov     lr, r3
        ldr     r2, [r1], #4
        str     r1, [sp, #0x30]
        str     r2, [sp, #0x38]
        ldr     r0, [sp, #0x38]
        ldr     r1, [sp, #0x38]
        and     r2, r0, #0xFF, 24
        mov     r0, r0, lsr #8
        mov     r2, r2, lsl #8
        orr     r1, r2, r1, lsl #24
        and     r2, r0, #0xFF, 24
        orr     r1, r1, r2
        ldr     r2, [sp, #0x38]
        mvn     r0, #0xFF, 8
        bic     r0, r2, r0
        orr     r3, r1, r0, lsr #24
        b       LGAF12
LGAF20:
        cmp     r7, #0x15
        bge     LGAF21
        ldr     r1, [r8, +r7, lsl #2]
        rsb     r11, r7, #0x15
        str     r11, [sp, #0x38]
        ldr     r11, [sp, #0x38]
        add     r2, r7, #0xB
        and     r1, lr, r1
        mov     r2, r3, lsr r2
        orr     r1, r2, r1, lsl r11
        b       LGAF22
LGAF21:
        ldr     r1, [pc, #0x864]
        sub     r2, r7, #0x15
        ldr     r1, [r1, #-0x30]
        and     r1, r1, lr, lsr r2
LGAF22:
        ldr     r2, [pc, #0x854]
        ldrb    r2, [r2, +r1, lsr #12]
        cmp     r2, #0xC
        bgt     LGAF50
        mov     r11, r2, lsl #1
        str     r11, [sp, #0x38]
        mov     r11, #1
        mov     r11, r11, lsl r2
        ldr     r2, [sp, #0x38]
        str     r11, [sp, #8]
        sub     r11, r11, #1
        rsb     r2, r2, #0x18
        and     r2, r11, r1, lsr r2
        ldr     r1, [sp, #0x38]
        ldr     r11, [sp, #0x1C]
        sub     r7, r7, r1
        ldr     r1, [sp, #8]
        str     r7, [sp, #0x28]
        add     r7, r7, #3
        cmp     r7, #0
        add     r1, r2, r1
        mov     r2, r10, lsl #1
        rsb     r1, r1, #0
        strh    r1, [r11, +r2]
        bgt     LGAF11
        ldr     r1, [sp, #0x30]
        ldr     lr, [r1], #4
        str     r1, [sp, #0x30]
        str     lr, [sp, #0x38]
        ldr     lr, [sp, #0x28]
        ldr     r11, [sp, #0x38]
        ldr     r1, [sp, #0x38]
        add     r7, lr, #0x23
        mov     lr, r3
        and     r3, r11, #0xFF, 24
        mov     r11, r11, lsr #8
        str     r11, [sp, #0x28]
        mov     r3, r3, lsl #8
        orr     r1, r3, r1, lsl #24
        ldr     r3, [sp, #0x28]
        mvn     r11, #0xFF, 8
        str     r11, [sp, #0x28]
        and     r3, r3, #0xFF, 24
        orr     r1, r1, r3
        ldr     r3, [sp, #0x28]
        ldr     r11, [sp, #0x38]
        bic     r3, r11, r3
        orr     r3, r1, r3, lsr #24
        b       LGAF11
LGAF23:
        cmp     r7, #0x15
        bge     LGAF24
        ldr     r1, [r8, +r7, lsl #2]
        rsb     r11, r7, #0x15
        str     r11, [sp, #0x38]
        ldr     r11, [sp, #0x38]
        add     r2, r7, #0xB
        and     r1, lr, r1
        mov     r2, r3, lsr r2
        orr     r1, r2, r1, lsl r11
        b       LGAF25
LGAF24:
        ldr     r1, [pc, #0x764]
        sub     r2, r7, #0x15
        ldr     r1, [r1, #-0x30]
        and     r1, r1, lr, lsr r2
LGAF25:
        ldr     r2, [pc, #0x754]
        ldrb    r2, [r2, +r1, lsr #12]
        cmp     r2, #0xC
        str     r2, [sp, #0x28]
        bgt     LGAF51
        ldr     r2, [sp, #0x28]
        mov     r11, r2, lsl #1
        str     r11, [sp, #0x38]
        mov     r11, #1
        mov     r2, r11, lsl r2
        ldr     r11, [sp, #0x38]
        str     r2, [sp, #8]
        sub     r2, r2, #1
        str     r2, [sp, #0x3C]
        ldr     r2, [sp, #0x38]
        rsb     r11, r11, #0x18
        str     r11, [sp]
        sub     r7, r7, r2
        ldr     r11, [sp, #0x3C]
        ldr     r2, [sp]
        str     r7, [sp, #0x28]
        add     r7, r7, #3
        cmp     r7, #0
        and     r1, r11, r1, lsr r2
        ldr     r11, [sp, #8]
        mov     r2, r10, lsl #1
        add     r1, r1, r11
        ldr     r11, [sp, #0x1C]
        strh    r1, [r11, +r2]
        bgt     LGAF11
        ldr     r1, [sp, #0x30]
        ldr     lr, [r1], #4
        str     r1, [sp, #0x30]
        str     lr, [sp, #0x3C]
        ldr     lr, [sp, #0x28]
        ldr     r11, [sp, #0x3C]
        ldr     r1, [sp, #0x3C]
        add     r7, lr, #0x23
        mov     lr, r3
        and     r3, r11, #0xFF, 24
        mov     r11, r11, lsr #8
        str     r11, [sp, #0x38]
        mov     r3, r3, lsl #8
        orr     r1, r3, r1, lsl #24
        ldr     r3, [sp, #0x38]
        mvn     r11, #0xFF, 8
        str     r11, [sp, #0x38]
        and     r3, r3, #0xFF, 24
        orr     r1, r1, r3
        ldr     r3, [sp, #0x38]
        ldr     r11, [sp, #0x3C]
        bic     r3, r11, r3
        orr     r3, r1, r3, lsr #24
        b       LGAF11
LGAF26:
        ldr     r9, [sp, #0x2C]
        cmp     r9, #0
        ble     LGAF13
        add     r11, r6, #4
        str     r11, [sp, #0x28]
        ldr     r11, [pc, #0x668]
        add     r10, r2, #2
        add     r8, r8, #9
        sub     r11, r11, #0x84
        str     r11, [sp, #0x34]
        str     r2, [sp, #0x1C]
        str     r1, [sp, #0x20]
        ldr     r1, [sp, #0x34]
        ldr     r2, [sp, #0x28]
        mov     r9, #0
        str     r10, [sp]
        str     r12, [sp, #0x14]
        str     r0, [sp, #0x24]
LGAF27:
        ldr     r0, [r6]
        cmp     r7, r5
        str     r0, [sp, #4]
        bge     LGAF28
        ldr     r12, [r1, +r7, lsl #2]
        sub     r11, r5, r7
        rsb     r10, r11, #0x20
        mov     r10, r3, lsr r10
        and     r12, lr, r12
        orr     r10, r10, r12, lsl r11
        b       LGAF29
LGAF28:
        ldr     r12, [r1, +r5, lsl #2]
        sub     r10, r7, r5
        and     r10, r12, lr, lsr r10
LGAF29:
        sub     r12, r5, r0
        mov     r12, r10, lsr r12
        ldr     r12, [r2, +r12, lsl #2]
        mov     r11, r12, lsr #1
        str     r11, [sp, #8]
        tst     r12, #1
        movne   r11, #0
        bne     LGAF31
        str     r3, [sp, #0xC]
        str     r4, [sp, #0x18]
        ldr     r3, [sp, #8]
        ldr     r4, [sp, #4]
        mov     r11, #0
        str     r7, [sp, #0x10]
LGAF30:
        add     r11, r11, r0
        ldr     r0, [r6, +r3, lsl #2]
        ldr     r7, [r1, +r0, lsl #2]
        add     r4, r0, r4
        sub     r12, r5, r4
        and     r12, r7, r10, lsr r12
        add     r3, r12, r3
        ldr     r12, [r2, +r3, lsl #2]
        tst     r12, #1
        mov     r3, r12, lsr #1
        beq     LGAF30
        ldr     r3, [sp, #0xC]
        ldr     r7, [sp, #0x10]
        ldr     r4, [sp, #0x18]
LGAF31:
        ldr     r0, [sp, #0x14]
        and     r10, r12, r0
        mov     r0, r12, lsr r4
        and     r0, r0, #0xFF
        add     r10, r11, r10, lsr #1
        sub     r7, r7, r10
        cmp     r7, #0
        mov     r12, r12, asr r8
        sub     r0, r0, #0x80
        bgt     LGAF32
        ldr     r11, [sp, #0x30]
        add     r7, r7, #0x20
        mov     lr, r3
        ldr     r10, [r11], #4
        str     r11, [sp, #0x30]
        mvn     r11, #0xFF, 8
        and     r3, r10, #0xFF, 24
        str     r3, [sp, #0x3C]
        mov     r3, r10, lsr #8
        str     r3, [sp, #0x38]
        ldr     r3, [sp, #0x3C]
        mov     r3, r3, lsl #8
        orr     r3, r3, r10, lsl #24
        str     r3, [sp, #0x3C]
        ldr     r3, [sp, #0x38]
        str     r11, [sp, #0x38]
        ldr     r11, [sp, #0x3C]
        and     r3, r3, #0xFF, 24
        orr     r3, r11, r3
        ldr     r11, [sp, #0x38]
        bic     r11, r10, r11
        orr     r3, r3, r11, lsr #24
LGAF32:
        cmp     r12, #0x10
        beq     LGAF38
        cmn     r12, #0x10
        beq     LGAF35
        ldr     r11, [sp, #0x1C]
        mov     r10, r9, lsl #1
        strh    r12, [r11, +r10]
LGAF33:
        cmp     r0, #0x10
        beq     LGAF41
        cmn     r0, #0x10
        ldrne   r12, [sp]
        strneh  r0, [r12, +r10]
        beq     LGAF44
LGAF34:
        ldr     r0, [sp, #0x2C]
        add     r9, r9, #2
        cmp     r9, r0
        blt     LGAF27
        ldr     r1, [sp, #0x20]
        ldr     r0, [sp, #0x24]
        b       LGAF13
LGAF35:
        cmp     r7, #0x15
        bge     LGAF36
        ldr     r11, [r1, +r7, lsl #2]
        rsb     r12, r7, #0x15
        str     r12, [sp, #0x3C]
        and     r12, lr, r11
        ldr     r11, [sp, #0x3C]
        add     r10, r7, #0xB
        mov     r10, r3, lsr r10
        orr     r12, r10, r12, lsl r11
        b       LGAF37
LGAF36:
        ldr     r12, [pc, #0x490]
        sub     r10, r7, #0x15
        ldr     r12, [r12, #-0x30]
        and     r12, r12, lr, lsr r10
LGAF37:
        ldr     r10, [pc, #0x480]
        ldrb    r10, [r10, +r12, lsr #12]
        cmp     r10, #0xC
        bgt     LGAF48
        mov     r11, r10, lsl #1
        str     r11, [sp, #0x3C]
        mov     r11, #1
        mov     r11, r11, lsl r10
        ldr     r10, [sp, #0x3C]
        str     r11, [sp, #0x38]
        sub     r11, r11, #1
        rsb     r10, r10, #0x18
        and     r10, r11, r12, lsr r10
        ldr     r12, [sp, #0x3C]
        ldr     r11, [sp, #0x1C]
        sub     r7, r7, r12
        ldr     r12, [sp, #0x38]
        str     r7, [sp, #4]
        add     r7, r7, #3
        cmp     r7, #0
        add     r12, r10, r12
        mov     r10, r9, lsl #1
        rsb     r12, r12, #0
        strh    r12, [r11, +r10]
        bgt     LGAF33
        ldr     r12, [sp, #0x30]
        ldr     lr, [r12], #4
        str     r12, [sp, #0x30]
        str     lr, [sp, #0x3C]
        ldr     lr, [sp, #4]
        ldr     r11, [sp, #0x3C]
        ldr     r12, [sp, #0x3C]
        add     r7, lr, #0x23
        mov     lr, r3
        and     r3, r11, #0xFF, 24
        mov     r11, r11, lsr #8
        str     r11, [sp, #0x38]
        mov     r3, r3, lsl #8
        orr     r3, r3, r12, lsl #24
        ldr     r12, [sp, #0x38]
        mvn     r11, #0xFF, 8
        str     r11, [sp, #0x38]
        and     r12, r12, #0xFF, 24
        orr     r3, r3, r12
        ldr     r11, [sp, #0x38]
        ldr     r12, [sp, #0x3C]
        bic     r11, r12, r11
        orr     r3, r3, r11, lsr #24
        b       LGAF33
LGAF38:
        cmp     r7, #0x15
        bge     LGAF39
        ldr     r11, [r1, +r7, lsl #2]
        rsb     r12, r7, #0x15
        str     r12, [sp, #0x3C]
        and     r12, lr, r11
        ldr     r11, [sp, #0x3C]
        add     r10, r7, #0xB
        mov     r10, r3, lsr r10
        orr     r12, r10, r12, lsl r11
        b       LGAF40
LGAF39:
        ldr     r12, [pc, #0x390]
        sub     r10, r7, #0x15
        ldr     r12, [r12, #-0x30]
        and     r12, r12, lr, lsr r10
LGAF40:
        ldr     r10, [pc, #0x380]
        ldrb    r10, [r10, +r12, lsr #12]
        cmp     r10, #0xC
        str     r10, [sp, #8]
        bgt     LGAF56
        ldr     r10, [sp, #8]
        mov     r11, r10, lsl #1
        str     r11, [sp, #0x3C]
        mov     r11, #1
        mov     r10, r11, lsl r10
        ldr     r11, [sp, #0x3C]
        str     r10, [sp, #0x38]
        sub     r10, r10, #1
        str     r10, [sp, #0x40]
        ldr     r10, [sp, #0x3C]
        rsb     r11, r11, #0x18
        str     r11, [sp, #8]
        sub     r7, r7, r10
        ldr     r11, [sp, #8]
        ldr     r10, [sp, #0x40]
        str     r7, [sp, #4]
        add     r7, r7, #3
        cmp     r7, #0
        and     r12, r10, r12, lsr r11
        ldr     r11, [sp, #0x38]
        mov     r10, r9, lsl #1
        add     r12, r12, r11
        ldr     r11, [sp, #0x1C]
        strh    r12, [r11, +r10]
        bgt     LGAF33
        ldr     r12, [sp, #0x30]
        ldr     lr, [r12], #4
        str     r12, [sp, #0x30]
        str     lr, [sp, #0x40]
        ldr     lr, [sp, #4]
        ldr     r11, [sp, #0x40]
        ldr     r12, [sp, #0x40]
        add     r7, lr, #0x23
        mov     lr, r3
        and     r3, r11, #0xFF, 24
        mov     r11, r11, lsr #8
        str     r11, [sp, #0x3C]
        mov     r3, r3, lsl #8
        orr     r3, r3, r12, lsl #24
        ldr     r12, [sp, #0x3C]
        mvn     r11, #0xFF, 8
        str     r11, [sp, #0x3C]
        and     r12, r12, #0xFF, 24
        orr     r3, r3, r12
        ldr     r11, [sp, #0x3C]
        ldr     r12, [sp, #0x40]
        bic     r11, r12, r11
        orr     r3, r3, r11, lsr #24
        b       LGAF33
LGAF41:
        cmp     r7, #0x15
        bge     LGAF42
        ldr     r0, [r1, +r7, lsl #2]
        add     r12, r7, #0xB
        str     r12, [sp, #0x40]
        ldr     r11, [sp, #0x40]
        rsb     r12, r7, #0x15
        and     r0, lr, r0
        mov     r11, r3, lsr r11
        orr     r12, r11, r0, lsl r12
        b       LGAF43
LGAF42:
        ldr     r0, [pc, #0x27C]
        sub     r12, r7, #0x15
        ldr     r0, [r0, #-0x30]
        and     r12, r0, lr, lsr r12
LGAF43:
        ldr     r0, [pc, #0x26C]
        ldrb    r0, [r0, +r12, lsr #12]
        cmp     r0, #0xC
        str     r0, [sp, #8]
        bgt     LGAF52
        ldr     r0, [sp, #8]
        mov     r11, r0, lsl #1
        str     r11, [sp, #0x40]
        mov     r11, #1
        mov     r0, r11, lsl r0
        str     r0, [sp, #0x3C]
        ldr     r0, [sp, #0x40]
        rsb     r0, r0, #0x18
        str     r0, [sp, #0x38]
        ldr     r0, [sp, #0x3C]
        ldr     r11, [sp, #0x38]
        sub     r0, r0, #1
        str     r0, [sp, #8]
        ldr     r0, [sp, #0x40]
        sub     r0, r7, r0
        ldr     r7, [sp, #8]
        and     r12, r7, r12, lsr r11
        ldr     r11, [sp, #0x3C]
        add     r7, r0, #3
        cmp     r7, #0
        add     r12, r12, r11
        ldr     r11, [sp]
        strh    r12, [r11, +r10]
        bgt     LGAF34
        ldr     r12, [sp, #0x30]
        add     r7, r0, #0x23
        ldr     lr, [r12], #4
        str     r12, [sp, #0x30]
        str     lr, [sp, #0x40]
        ldr     r0, [sp, #0x40]
        ldr     r12, [sp, #0x40]
        mov     lr, r3
        and     r3, r0, #0xFF, 24
        mov     r0, r0, lsr #8
        mov     r3, r3, lsl #8
        orr     r3, r3, r12, lsl #24
        and     r12, r0, #0xFF, 24
        orr     r3, r3, r12
        ldr     r12, [sp, #0x40]
        mvn     r0, #0xFF, 8
        bic     r0, r12, r0
        orr     r3, r3, r0, lsr #24
        b       LGAF34
LGAF44:
        cmp     r7, #0x15
        bge     LGAF45
        ldr     r11, [r1, +r7, lsl #2]
        rsb     r0, r7, #0x15
        str     r0, [sp, #0x40]
        and     r0, lr, r11
        ldr     r11, [sp, #0x40]
        add     r12, r7, #0xB
        mov     r12, r3, lsr r12
        orr     r0, r12, r0, lsl r11
        b       LGAF46
LGAF45:
        ldr     r0, [pc, #0x180]
        sub     r12, r7, #0x15
        ldr     r0, [r0, #-0x30]
        and     r0, r0, lr, lsr r12
LGAF46:
        ldr     r12, [pc, #0x170]
        ldrb    r12, [r12, +r0, lsr #12]
        cmp     r12, #0xC
        bgt     LGAF54
        mov     r11, r12, lsl #1
        str     r11, [sp, #0x40]
        mov     r11, #1
        mov     r11, r11, lsl r12
        ldr     r12, [sp, #0x40]
        str     r11, [sp, #0x3C]
        sub     r11, r11, #1
        rsb     r12, r12, #0x18
        and     r12, r11, r0, lsr r12
        ldr     r0, [sp, #0x40]
        ldr     r11, [sp]
        sub     r0, r7, r0
        ldr     r7, [sp, #0x3C]
        add     r12, r12, r7
        add     r7, r0, #3
        rsb     r12, r12, #0
        cmp     r7, #0
        strh    r12, [r11, +r10]
        bgt     LGAF34
        ldr     r12, [sp, #0x30]
        add     r7, r0, #0x23
        ldr     lr, [r12], #4
        str     r12, [sp, #0x30]
        str     lr, [sp, #0x40]
        ldr     r0, [sp, #0x40]
        ldr     r12, [sp, #0x40]
        mov     lr, r3
        and     r3, r0, #0xFF, 24
        mov     r0, r0, lsr #8
        mov     r3, r3, lsl #8
        orr     r3, r3, r12, lsl #24
        and     r12, r0, #0xFF, 24
        orr     r3, r3, r12
        ldr     r12, [sp, #0x40]
        mvn     r0, #0xFF, 8
        bic     r0, r12, r0
        orr     r3, r3, r0, lsr #24
        b       LGAF34
LGAF47:
        ldr     lr, [r11]
        str     lr, [sp, #0x40]
        mvn     lr, #0xFF, 8
        str     lr, [sp, #0x3C]
        ldr     lr, [sp, #0x40]
        ldr     r10, [sp, #0x40]
        and     lr, lr, #0xFF, 24
        str     lr, [sp, #0x38]
        ldr     lr, [sp, #0x40]
        mov     lr, lr, lsr #8
        and     lr, lr, #0xFF, 24
        str     lr, [sp, #0x34]
        ldr     lr, [sp, #0x38]
        mov     lr, lr, lsl #8
        orr     lr, lr, r10, lsl #24
        ldr     r10, [sp, #0x34]
        orr     r10, lr, r10
        str     r10, [sp, #0x38]
        ldr     lr, [sp, #0x3C]
        ldr     r10, [sp, #0x40]
        bic     lr, r10, lr
        ldr     r10, [sp, #0x38]
        orr     lr, r10, lr, lsr #24
        b       LGAF4
LGAF48:
        mvn     r0, #0x7E
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LGAF49:
        mvn     r0, #0x7E
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LGAF50:
        mvn     r0, #0x7E
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LGAF51:
        mvn     r0, #0x7E
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LGAF52:
        mvn     r0, #0x7E
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LGAF53:
        mvn     r0, #0x7E
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LGAF54:
        mvn     r0, #0x7E
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LGAF55:
        mvn     r0, #7
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LGAF56:
        mvn     r0, #0x7E
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
        .long   0x434d4160
        .long   LGAF_aac_table


        .data
        .align  4


LGAF_table:
        .byte   0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x07,0x00,0x00,0x00
        .byte   0x0F,0x00,0x00,0x00,0x1F,0x00,0x00,0x00,0x3F,0x00,0x00,0x00,0x7F,0x00,0x00,0x00
        .byte   0xFF,0x00,0x00,0x00,0xFF,0x01,0x00,0x00,0xFF,0x03,0x00,0x00,0xFF,0x07,0x00,0x00
        .byte   0xFF,0x0F,0x00,0x00,0xFF,0x1F,0x00,0x00,0xFF,0x3F,0x00,0x00,0xFF,0x7F,0x00,0x00
        .byte   0xFF,0xFF,0x00,0x00,0xFF,0xFF,0x01,0x00,0xFF,0xFF,0x03,0x00,0xFF,0xFF,0x07,0x00
        .byte   0xFF,0xFF,0x0F,0x00,0xFF,0xFF,0x1F,0x00,0xFF,0xFF,0x3F,0x00,0xFF,0xFF,0x7F,0x00
        .byte   0xFF,0xFF,0xFF,0x00,0xFF,0xFF,0xFF,0x01,0xFF,0xFF,0xFF,0x03,0xFF,0xFF,0xFF,0x07
        .byte   0xFF,0xFF,0xFF,0x0F,0xFF,0xFF,0xFF,0x1F,0xFF,0xFF,0xFF,0x3F,0xFF,0xFF,0xFF,0x7F
        .byte   0xFF,0xFF,0xFF,0xFF
LGAF_aac_table:
        .byte   0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04
        .byte   0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04
        .byte   0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04
        .byte   0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04
        .byte   0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04
        .byte   0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04
        .byte   0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04
        .byte   0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04
        .byte   0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04
        .byte   0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04
        .byte   0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04
        .byte   0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04
        .byte   0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04
        .byte   0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04
        .byte   0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04
        .byte   0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04
        .byte   0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05
        .byte   0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05
        .byte   0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05
        .byte   0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05
        .byte   0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05
        .byte   0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05
        .byte   0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05
        .byte   0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05
        .byte   0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06
        .byte   0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06
        .byte   0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06
        .byte   0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06
        .byte   0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07
        .byte   0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07
        .byte   0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08
        .byte   0x09,0x09,0x09,0x09,0x09,0x09,0x09,0x09,0x0A,0x0A,0x0A,0x0A,0x0B,0x0B,0x0C,0x0D


