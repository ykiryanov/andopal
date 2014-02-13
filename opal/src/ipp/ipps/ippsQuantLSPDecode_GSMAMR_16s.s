        .text
        .align  4
        .globl  _ippsQuantLSPDecode_GSMAMR_16s


_ippsQuantLSPDecode_GSMAMR_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x5E, 30
        ldr     r11, [sp, #0x1A0]
        add     r4, sp, #0xC4
        add     lr, sp, #0xA0
        and     r4, r4, #0xF
        add     r6, sp, #0x13, 28
        and     lr, lr, #0xF
        rsb     r4, r4, #0
        add     r5, sp, #0x43, 30
        and     r6, r6, #0xF
        rsb     lr, lr, #0
        add     r7, sp, #0x55, 30
        and     r8, r4, #0xF
        add     r12, sp, #0xE8
        and     r5, r5, #0xF
        rsb     r6, r6, #0
        and     r9, lr, #0xF
        ldr     lr, [sp, #0x19C]
        and     r7, r7, #0xF
        add     r10, sp, #0xC4
        add     r4, sp, #0x13, 28
        and     r12, r12, #0xF
        and     r6, r6, #0xF
        rsb     r7, r7, #0
        rsb     r5, r5, #0
        add     r8, r10, r8
        str     r2, [sp, #0x28]
        add     r4, r4, r6
        str     r3, [sp, #0x30]
        rsb     r12, r12, #0
        and     r2, r7, #0xF
        ldr     r7, [sp, #0x1A4]
        and     r3, r5, #0xF
        str     r8, [sp, #0x40]
        str     lr, [sp, #0x38]
        str     r4, [sp, #0x20]
        add     r8, sp, #0xA0
        add     r5, sp, #0xE8
        add     lr, sp, #0x55, 30
        add     r4, sp, #0x43, 30
        and     r12, r12, #0xF
        add     r9, r8, r9
        cmp     r0, #0
        add     lr, lr, r2
        add     r4, r4, r3
        add     r5, r5, r12
        str     r9, [sp, #0x1C]
        beq     LDOQ18
        cmp     r1, #0
        beq     LDOQ18
        ldr     r8, [sp, #0x28]
        cmp     r8, #0
        beq     LDOQ18
        ldr     r8, [sp, #0x30]
        cmp     r8, #0
        beq     LDOQ18
        ldr     r8, [sp, #0x38]
        cmp     r8, #0
        beq     LDOQ18
        cmp     r7, #0
        beq     LDOQ0
        cmp     r7, #1
        beq     LDOQ0
        cmp     r7, #3
        beq     LDOQ0
        cmp     r7, #6
        beq     LDOQ0
        cmp     r7, #7
        beq     LDOQ0
        cmp     r7, #8
        beq     LDOQ0
        cmp     r7, #0xB
        beq     LDOQ0
        cmp     r7, #0xC
        beq     LDOQ9
        cmp     r7, #0x19
        beq     LDOQ0
        mvn     r0, #6
        add     sp, sp, #0x5E, 30
        ldmia   sp!, {r4 - r11, pc}
LDOQ0:
        cmp     r11, #0
        beq     LDOQ1
        ldr     r2, [sp, #0x28]
        ldr     r0, [pc, #0xD10]
        ldrsh   r12, [r2]
        str     r12, [sp, #0x3C]
        ldrsh   r12, [r2, #2]
        str     r12, [sp, #0x34]
        ldrsh   r12, [r0, #4]
        ldrsh   r6, [r0, #2]
        str     r12, [sp, #0x2C]
        ldrsh   r12, [r0, #0xA]
        ldrsh   r5, [r0, #8]
        ldrsh   lr, [r0, #6]
        str     r12, [sp, #0x24]
        ldrsh   r12, [r0, #0xC]
        str     r12, [sp, #0x20]
        ldrsh   r12, [r0, #0xE]
        str     r12, [sp, #0x1C]
        ldrsh   r12, [r0, #0x10]
        str     r12, [sp, #0x18]
        ldrsh   r12, [r0, #0x12]
        str     r12, [sp, #0x14]
        ldrsh   r12, [r0]
        str     r12, [sp, #0x10]
        ldrsh   r12, [r2, #4]
        str     r12, [sp, #0xC]
        ldrsh   r12, [r2, #6]
        str     r12, [sp, #8]
        ldrsh   r12, [r2, #8]
        str     r12, [sp, #4]
        ldrsh   r12, [r2, #0xA]
        str     r12, [sp]
        ldrsh   r12, [r2, #0xC]
        str     r12, [sp, #0x44]
        ldrsh   r12, [r2, #0xE]
        str     r12, [sp, #0x48]
        ldrsh   r12, [r2, #0x10]
        str     r12, [sp, #0x4C]
        ldrsh   r2, [r2, #0x12]
        str     r2, [sp, #0x50]
        ldrsh   r2, [r1]
        str     r2, [sp, #0x54]
        ldr     r2, [pc, #0xC74]
        ldrsh   r12, [r1, #4]
        ldrsh   r10, [r1, #2]
        ldrsh   r7, [r2, #4]
        ldrsh   r11, [r2, #2]
        ldrsh   r8, [r2, #6]
        ldrsh   r9, [r1, #6]
        mul     r7, r12, r7
        mul     r11, r10, r11
        str     r9, [sp, #0x58]
        ldr     r12, [sp, #0x58]
        str     r7, [sp, #0x60]
        str     r11, [sp, #0x5C]
        mul     r8, r12, r8
        str     r8, [sp, #0x58]
        ldrsh   r10, [r2, #8]
        ldrsh   r7, [r1, #8]
        ldrsh   r12, [r2, #0xA]
        ldrsh   r8, [r2, #0xC]
        mul     r10, r7, r10
        ldrsh   r9, [r1, #0xA]
        mul     r12, r9, r12
        str     r10, [sp, #0x64]
        ldrsh   r7, [r1, #0xC]
        mul     r8, r7, r8
        str     r12, [sp, #0x68]
        ldrsh   r12, [r1, #0xE]
        ldrsh   r9, [r2, #0xE]
        str     r8, [sp, #0x6C]
        ldrsh   r8, [r2, #0x10]
        ldrsh   r7, [r1, #0x10]
        mul     r9, r12, r9
        mul     r8, r7, r8
        mov     r7, #0xCD
        orr     r11, r7, #3, 22
        mul     r6, r6, r11
        mul     lr, lr, r11
        str     r9, [sp, #0x70]
        ldrsh   r12, [r1, #0x12]
        ldrsh   r2, [r2, #0x12]
        ldr     r7, [sp, #0x10]
        str     lr, [sp, #0x80]
        ldr     lr, [sp, #0x24]
        mul     r2, r12, r2
        mul     r7, r7, r11
        str     r8, [sp, #0x74]
        mul     r8, lr, r11
        ldr     lr, [sp, #0x20]
        str     r6, [sp, #0x7C]
        str     r7, [sp, #0x78]
        mul     r7, r5, r11
        mul     lr, lr, r11
        ldr     r6, [sp, #0x2C]
        ldr     r5, [sp, #8]
        mov     r7, r7, asr #15
        str     lr, [sp, #0x24]
        ldr     lr, [sp, #0x1C]
        mul     r6, r6, r11
        str     r2, [sp, #0x1C]
        mov     r2, #0x33
        mul     r9, lr, r11
        ldr     lr, [sp, #0x18]
        str     r6, [sp, #0x2C]
        mov     r8, r8, asr #15
        mul     r10, lr, r11
        ldr     lr, [sp, #0x14]
        orr     r2, r2, #0x53, 24
        add     r6, r2, #2, 20
        mul     r11, lr, r11
        ldr     r2, [sp, #0x3C]
        mul     r5, r5, r6
        mov     r9, r9, asr #15
        mul     lr, r2, r6
        str     r11, [sp, #0x20]
        ldr     r11, [sp, #4]
        ldr     r2, [sp, #0x34]
        mov     r10, r10, asr #15
        mul     r11, r11, r6
        mul     r12, r2, r6
        ldr     r2, [sp, #0xC]
        mul     r2, r2, r6
        str     r11, [sp, #0x3C]
        ldr     r11, [sp]
        mul     r11, r11, r6
        str     r11, [sp, #0x34]
        ldr     r11, [sp, #0x44]
        mul     r11, r11, r6
        str     r11, [sp, #0x44]
        ldr     r11, [sp, #0x48]
        mul     r11, r11, r6
        str     r11, [sp, #0x48]
        ldr     r11, [sp, #0x4C]
        mul     r11, r11, r6
        str     r11, [sp, #0x4C]
        ldr     r11, [sp, #0x50]
        mul     r11, r11, r6
        ldr     r6, [sp, #0x78]
        mov     r6, r6, asr #15
        add     lr, r6, lr, asr #15
        add     r6, sp, #0x43, 30
        strh    lr, [r3, +r6]
        ldr     lr, [sp, #0x7C]
        ldr     r6, [sp, #0x80]
        mov     lr, lr, asr #15
        add     lr, lr, r12, asr #15
        ldr     r12, [sp, #0x2C]
        mov     r6, r6, asr #15
        mov     lr, lr, lsl #16
        add     r5, r6, r5, asr #15
        mov     r12, r12, asr #15
        mov     lr, lr, asr #16
        str     lr, [sp, #0x80]
        strh    lr, [r4, #2]
        add     r12, r12, r2, asr #15
        ldr     r2, [sp, #0x24]
        mov     r12, r12, lsl #16
        mov     lr, r5, lsl #16
        mov     r2, r2, asr #15
        mov     r12, r12, asr #16
        strh    r12, [r4, #4]
        ldr     r6, [sp, #0x3C]
        ldr     r5, [sp, #0x20]
        mov     lr, lr, asr #16
        add     r6, r7, r6, asr #15
        strh    lr, [r4, #6]
        ldr     r7, [sp, #0x34]
        mov     r6, r6, lsl #16
        mov     r5, r5, asr #15
        add     r8, r8, r7, asr #15
        mov     r6, r6, asr #16
        strh    r6, [r4, #8]
        mov     r7, r8, lsl #16
        ldr     r8, [sp, #0x44]
        add     r11, r5, r11, asr #15
        add     r8, r2, r8, asr #15
        mov     r2, r7, asr #16
        strh    r2, [r4, #0xA]
        mov     r7, r8, lsl #16
        ldr     r8, [sp, #0x48]
        mov     r7, r7, asr #16
        strh    r7, [r4, #0xC]
        add     r9, r9, r8, asr #15
        mov     r11, r11, lsl #16
        mov     r8, r9, lsl #16
        ldr     r9, [sp, #0x4C]
        mov     r8, r8, asr #16
        strh    r8, [r4, #0xE]
        add     r10, r10, r9, asr #15
        mov     r9, r10, lsl #16
        mov     r10, #0x55, 30
        mov     r5, r9, asr #16
        strh    r5, [r4, #0x10]
        mov     r9, r11, asr #16
        strh    r9, [r4, #0x12]
        ldr     r11, [sp, #0x54]
        orr     r10, r10, #9, 22
        mul     r10, r11, r10
        add     r11, sp, #0x43, 30
        ldrsh   r3, [r3, +r11]
        ldr     r11, [sp, #0x10]
        add     r10, r11, r10, asr #15
        sub     r3, r3, r10
        strh    r3, [r1]
        ldrsh   r3, [r0, #2]
        ldr     r10, [sp, #0x5C]
        add     r3, r3, r10, asr #15
        ldr     r10, [sp, #0x80]
        sub     r10, r10, r3
        strh    r10, [r1, #2]
        ldr     r10, [sp, #0x60]
        ldrsh   r3, [r0, #4]
        add     r10, r3, r10, asr #15
        sub     r12, r12, r10
        strh    r12, [r1, #4]
        ldr     r12, [sp, #0x58]
        ldrsh   r3, [r0, #6]
        add     r12, r3, r12, asr #15
        sub     lr, lr, r12
        strh    lr, [r1, #6]
        ldr     r12, [sp, #0x64]
        ldrsh   r3, [r0, #8]
        add     r12, r3, r12, asr #15
        sub     r6, r6, r12
        strh    r6, [r1, #8]
        ldr     r12, [sp, #0x68]
        ldrsh   r3, [r0, #0xA]
        add     r12, r3, r12, asr #15
        sub     r2, r2, r12
        strh    r2, [r1, #0xA]
        ldr     r3, [sp, #0x6C]
        ldrsh   r2, [r0, #0xC]
        add     r3, r2, r3, asr #15
        sub     r7, r7, r3
        strh    r7, [r1, #0xC]
        ldr     r3, [sp, #0x70]
        ldrsh   r2, [r0, #0xE]
        add     r3, r2, r3, asr #15
        sub     r8, r8, r3
        strh    r8, [r1, #0xE]
        ldr     r3, [sp, #0x74]
        ldrsh   r2, [r0, #0x10]
        add     r3, r2, r3, asr #15
        sub     r5, r5, r3
        strh    r5, [r1, #0x10]
        ldr     r2, [sp, #0x1C]
        ldrsh   r0, [r0, #0x12]
        add     r2, r0, r2, asr #15
        sub     r8, r9, r2
        b       LDOQ8
LDOQ1:
        cmp     r7, #0
        bne     LDOQ3
LDOQ2:
        ldr     r12, [pc, #0x92C]
        ldr     r6, [pc, #0x92C]
        str     r12, [sp, #0x3C]
        ldr     r12, [pc, #0x928]
        b       LDOQ4
LDOQ3:
        cmp     r7, #1
        beq     LDOQ2
        ldr     r12, [pc, #0x910]
        cmp     r7, #8
        str     r12, [sp, #0x3C]
        ldr     r12, [pc, #0x910]
        ldreq   r6, [pc, #0x910]
        ldrne   r6, [pc, #0x900]
LDOQ4:
        ldrsh   r8, [r0]
        ldrsh   r5, [r0, #2]
        cmp     r7, #0
        add     r9, r8, r8, lsl #2
        add     r9, r8, r9
        add     r8, r6, r9
        ldrsh   r6, [r6, +r9]
        ldrsh   r9, [r8, #2]
        add     r10, sp, #0x55, 30
        str     r9, [sp, #0x2C]
        ldrsh   r8, [r8, #4]
        str     r8, [sp, #0x34]
        strh    r6, [r2, +r10]
        strh    r9, [lr, #2]
        strh    r8, [lr, #4]
        bne     LDOQ6
LDOQ5:
        mov     r5, r5, lsl #1
        mov     r5, r5, lsl #16
        mov     r5, r5, asr #16
        b       LDOQ7
LDOQ6:
        cmp     r7, #1
        beq     LDOQ5
LDOQ7:
        ldrsh   r6, [r1]
        ldrsh   r0, [r0, #4]
        ldr     r8, [pc, #0x890]
        str     r6, [sp, #0x80]
        ldrsh   r6, [r1, #2]
        ldr     r7, [pc, #0x888]
        ldrsh   r8, [r8]
        mov     r0, r0, lsl #3
        str     r8, [sp, #0x7C]
        ldrsh   r8, [r1, #4]
        str     r8, [sp, #0x78]
        ldrsh   r11, [r7, #2]
        ldrsh   r8, [r7, #4]
        ldrsh   r9, [r1, #6]
        mul     r11, r6, r11
        ldr     r6, [sp, #0x78]
        ldrsh   r10, [r7, #6]
        mul     r8, r6, r8
        str     r11, [sp, #0x74]
        mul     r10, r9, r10
        str     r8, [sp, #0x78]
        str     r10, [sp, #0x70]
        ldrsh   r11, [r7, #8]
        ldrsh   r10, [r1, #8]
        ldrsh   r6, [r7, #0xA]
        ldrsh   r9, [r7, #0xC]
        mul     r11, r10, r11
        ldrsh   r8, [r1, #0xA]
        mul     r6, r8, r6
        str     r11, [sp, #0x6C]
        ldrsh   r10, [r1, #0xC]
        mul     r9, r10, r9
        str     r6, [sp, #0x68]
        ldrsh   r6, [r7, #0xE]
        ldrsh   r8, [r1, #0xE]
        str     r9, [sp, #0x64]
        ldrsh   r10, [r7, #0x10]
        ldrsh   r9, [r1, #0x10]
        mul     r6, r8, r6
        add     r8, r5, r5, lsl #2
        add     r5, r5, r8
        mul     r10, r9, r10
        str     r6, [sp, #0x60]
        ldrsh   r7, [r7, #0x12]
        ldrsh   r6, [r1, #0x12]
        add     r8, r12, r0
        str     r10, [sp, #0x5C]
        mul     r7, r6, r7
        str     r7, [sp, #0x58]
        ldr     r7, [sp, #0x3C]
        ldrsh   r10, [r8, #4]
        ldrsh   r12, [r12, +r0]
        ldrsh   r6, [r7, +r5]
        add     r5, r7, r5
        ldrsh   r7, [r5, #2]
        ldrsh   r9, [r8, #2]
        ldrsh   r8, [r8, #6]
        ldrsh   r5, [r5, #4]
        strh    r6, [lr, #6]
        strh    r7, [lr, #8]
        strh    r12, [lr, #0xC]
        strh    r5, [lr, #0xA]
        strh    r9, [lr, #0xE]
        strh    r10, [lr, #0x10]
        strh    r8, [lr, #0x12]
        ldr     r11, [sp, #0x80]
        add     lr, sp, #0x55, 30
        ldrsh   r2, [r2, +lr]
        mov     lr, #0x55, 30
        orr     lr, lr, #9, 22
        mul     lr, r11, lr
        str     lr, [sp, #0x80]
        ldr     lr, [pc, #0x778]
        strh    r2, [r1]
        ldr     r0, [sp, #0x2C]
        ldrsh   r11, [lr, #2]
        strh    r0, [r1, #2]
        ldrsh   r0, [lr, #4]
        str     r0, [sp, #0x54]
        ldr     r0, [sp, #0x34]
        strh    r0, [r1, #4]
        ldrsh   r0, [lr, #6]
        str     r0, [sp, #0x50]
        strh    r6, [r1, #6]
        ldrsh   r0, [lr, #8]
        str     r0, [sp, #0x4C]
        strh    r7, [r1, #8]
        ldrsh   r0, [lr, #0xA]
        str     r0, [sp, #0x48]
        strh    r5, [r1, #0xA]
        ldrsh   r0, [lr, #0xC]
        str     r0, [sp, #0x44]
        strh    r12, [r1, #0xC]
        ldrsh   r0, [lr, #0xE]
        str     r0, [sp, #0x3C]
        strh    r9, [r1, #0xE]
        ldrsh   r0, [lr, #0x10]
        str     r0, [sp, #0x24]
        strh    r10, [r1, #0x10]
        ldrsh   lr, [lr, #0x12]
        ldr     r0, [sp, #0x80]
        str     lr, [sp, #0x20]
        ldr     lr, [sp, #0x7C]
        add     r0, lr, r0, asr #15
        add     r0, r2, r0
        add     r2, sp, #0x43, 30
        strh    r0, [r3, +r2]
        ldr     r2, [sp, #0x74]
        ldr     r3, [sp, #0x78]
        ldr     lr, [sp, #0x70]
        add     r2, r11, r2, asr #15
        str     r2, [sp, #0x80]
        ldr     r2, [sp, #0x54]
        ldr     r0, [sp, #0x80]
        add     r2, r2, r3, asr #15
        ldr     r3, [sp, #0x50]
        add     r11, r3, lr, asr #15
        ldr     lr, [sp, #0x6C]
        ldr     r3, [sp, #0x4C]
        add     r6, r6, r11
        add     lr, r3, lr, asr #15
        str     lr, [sp, #0x7C]
        ldr     lr, [sp, #0x68]
        ldr     r3, [sp, #0x48]
        ldr     r11, [sp, #0x7C]
        add     lr, r3, lr, asr #15
        str     lr, [sp, #0x78]
        ldr     lr, [sp, #0x64]
        ldr     r3, [sp, #0x44]
        add     r7, r7, r11
        ldr     r11, [sp, #0x78]
        add     lr, r3, lr, asr #15
        str     lr, [sp, #0x74]
        ldr     lr, [sp, #0x60]
        ldr     r3, [sp, #0x3C]
        add     r5, r5, r11
        ldr     r11, [sp, #0x74]
        add     lr, r3, lr, asr #15
        str     lr, [sp, #0x70]
        ldr     lr, [sp, #0x5C]
        ldr     r3, [sp, #0x24]
        add     r12, r12, r11
        ldr     r11, [sp, #0x70]
        add     lr, r3, lr, asr #15
        str     lr, [sp, #0x6C]
        ldr     r3, [sp, #0x20]
        ldr     lr, [sp, #0x58]
        add     r9, r9, r11
        ldr     r11, [sp, #0x6C]
        add     r3, r3, lr, asr #15
        ldr     lr, [sp, #0x2C]
        add     r3, r8, r3
        add     r10, r10, r11
        add     lr, lr, r0
        ldr     r0, [sp, #0x34]
        strh    lr, [r4, #2]
        strh    r6, [r4, #6]
        strh    r7, [r4, #8]
        add     r2, r0, r2
        strh    r2, [r4, #4]
        strh    r5, [r4, #0xA]
        strh    r12, [r4, #0xC]
        strh    r9, [r4, #0xE]
        strh    r10, [r4, #0x10]
        strh    r3, [r4, #0x12]
LDOQ8:
        strh    r8, [r1, #0x12]
        mov     r0, r4
        mov     r2, #0xA
        mov     r1, #0xCD
        bl      ReorderLsf
        ldr     r1, [sp, #0x28]
        mov     r0, r4
        mov     r2, #0xA
        bl      _ippsCopy_16s
        mov     r0, r4
        ldr     r4, [sp, #0x40]
        mov     r1, r4
        bl      _ippsLSFToLSP_GSMAMR_16s
        ldr     r6, [sp, #0x38]
        ldr     r5, [sp, #0x30]
        mov     r0, r4
        mov     r2, r6
        mov     r3, #0xA
        mov     r1, r5
        bl      _ippsInterpolate_GSMAMR_16s
        add     r2, r6, #0x14
        mov     r1, r5
        mov     r0, r4
        mov     r3, #0xA
        bl      _ippsInterpolate_G729_16s
        add     r2, r6, #0x28
        mov     r1, r4
        mov     r0, r5
        mov     r3, #0xA
        bl      _ippsInterpolate_GSMAMR_16s
        add     r1, r6, #0x3C
        mov     r2, #0xA
        mov     r0, r4
        bl      _ippsCopy_16s
        mov     r1, r5
        mov     r0, r4
        mov     r2, #0xA
        bl      _ippsCopy_16s
        mov     r0, #0
        add     sp, sp, #0x5E, 30
        ldmia   sp!, {r4 - r11, pc}
LDOQ9:
        cmp     r11, #0
        beq     LDOQ10
        ldr     r6, [pc, #0x574]
        ldr     r11, [sp, #0x28]
        ldrsh   r7, [r6, #2]
        ldrsh   r2, [r11]
        ldrsh   lr, [r11, #2]
        str     r7, [sp, #0x80]
        ldrsh   r7, [r6, #4]
        str     r7, [sp, #0x7C]
        ldrsh   r7, [r6, #6]
        str     r7, [sp, #0x78]
        ldrsh   r7, [r6, #8]
        str     r7, [sp, #0x74]
        ldrsh   r7, [r6, #0xA]
        str     r7, [sp, #0x70]
        ldrsh   r7, [r6, #0xC]
        str     r7, [sp, #0x6C]
        ldrsh   r7, [r6, #0xE]
        str     r7, [sp, #0x68]
        ldrsh   r7, [r6, #0x10]
        str     r7, [sp, #0x64]
        ldrsh   r6, [r6, #0x12]
        str     r6, [sp, #0x60]
        ldrsh   r6, [r11, #4]
        str     r6, [sp, #0x5C]
        ldrsh   r10, [r11, #0xE]
        ldrsh   r6, [r11, #6]
        ldrsh   r7, [r11, #8]
        ldrsh   r8, [r11, #0xA]
        ldrsh   r9, [r11, #0xC]
        str     r10, [sp, #0x58]
        ldrsh   r10, [r11, #0x10]
        ldrsh   r0, [r1]
        ldrsh   r11, [r11, #0x12]
        str     r0, [sp, #0x54]
        ldrsh   r0, [r1, #2]
        str     r0, [sp, #0x50]
        ldrsh   r0, [r1, #4]
        str     r0, [sp, #0x4C]
        ldrsh   r0, [r1, #6]
        str     r0, [sp, #0x48]
        ldrsh   r0, [r1, #8]
        str     r0, [sp, #0x44]
        ldrsh   r0, [r1, #0xA]
        str     r0, [sp, #0x3C]
        ldrsh   r0, [r1, #0xC]
        str     r0, [sp, #0x34]
        ldrsh   r0, [r1, #0xE]
        str     r0, [sp, #0x2C]
        ldrsh   r0, [r1, #0x10]
        str     r0, [sp, #0x24]
        ldrsh   r0, [r1, #0x12]
        str     r0, [sp, #0x20]
        mov     r0, #0x66, 30
        orr     r0, r0, #0x1E, 22
        mul     r2, r2, r0
        mul     lr, lr, r0
        mul     r7, r7, r0
        mul     r6, r6, r0
        mul     r8, r8, r0
        mul     r9, r9, r0
        mul     r10, r10, r0
        str     r2, [sp, #0x18]
        ldr     r2, [sp, #0x5C]
        str     r7, [sp, #0xC]
        str     lr, [sp, #0x14]
        str     r6, [sp, #0x10]
        mul     r2, r2, r0
        str     r8, [sp, #8]
        str     r9, [sp, #4]
        str     r10, [sp]
        str     r2, [sp, #0x5C]
        ldr     r2, [sp, #0x58]
        mul     r2, r2, r0
        mul     r0, r11, r0
        str     r2, [sp, #0x58]
        mov     r2, #0x67
        orr     lr, r2, #6, 24
        ldr     r2, [sp, #0x80]
        str     r0, [sp, #0x84]
        ldr     r0, [sp, #0x64]
        str     lr, [sp, #0x88]
        mul     r11, r2, lr
        ldr     r2, [sp, #0x7C]
        mul     r0, r0, lr
        mul     r10, r2, lr
        ldr     r2, [sp, #0x78]
        mul     r9, r2, lr
        ldr     r2, [sp, #0x74]
        str     r0, [sp, #0x8C]
        ldr     r0, [sp, #0x60]
        mov     r10, r10, asr #15
        mul     r6, r2, lr
        ldr     r2, [sp, #0x70]
        mul     r7, r2, lr
        ldr     r2, [sp, #0x6C]
        mov     r6, r6, asr #15
        mul     r8, r2, lr
        ldr     r2, [sp, #0x68]
        mov     r7, r7, asr #15
        mul     r2, r2, lr
        mul     lr, r0, lr
        add     r0, sp, #0xE8
        mov     r8, r8, asr #15
        str     lr, [sp, #0x90]
        ldr     lr, [sp, #0x18]
        mov     lr, lr, asr #15
        add     lr, lr, #0x45
        str     lr, [sp, #0x18]
        strh    lr, [r12, +r0]
        ldr     r0, [sp, #0x90]
        mov     lr, r11, asr #15
        mov     r11, r9, asr #15
        mov     r9, r2, asr #15
        ldr     r2, [sp, #0x8C]
        mov     r0, r0, asr #15
        str     r0, [sp, #0x90]
        ldr     r0, [sp, #0x14]
        mov     r2, r2, asr #15
        add     r0, lr, r0, asr #15
        ldr     lr, [sp, #0x5C]
        str     r0, [sp, #0x8C]
        ldr     r0, [sp, #0x54]
        add     lr, r10, lr, asr #15
        ldr     r10, [sp, #0xC]
        str     lr, [sp, #0x5C]
        ldr     lr, [sp, #0x10]
        add     r6, r6, r10, asr #15
        ldr     r10, [sp, #8]
        mov     r6, r6, lsl #16
        add     lr, r11, lr, asr #15
        ldr     r11, [sp, #0x84]
        add     r7, r7, r10, asr #15
        ldr     r10, [sp, #4]
        mov     r6, r6, asr #16
        mov     lr, lr, lsl #16
        mov     r7, r7, lsl #16
        add     r8, r8, r10, asr #15
        ldr     r10, [sp, #0x58]
        mov     lr, lr, asr #16
        mov     r7, r7, asr #16
        mov     r8, r8, lsl #16
        add     r9, r9, r10, asr #15
        ldr     r10, [sp]
        mov     r8, r8, asr #16
        mov     r9, r9, lsl #16
        add     r10, r2, r10, asr #15
        ldr     r2, [sp, #0x90]
        mov     r9, r9, asr #16
        mov     r10, r10, lsl #16
        add     r2, r2, r11, asr #15
        mov     r11, #0x33
        orr     r11, r11, #0x53, 24
        mul     r0, r0, r11
        mov     r10, r10, asr #16
        mov     r2, r2, lsl #16
        str     r0, [sp, #0x90]
        ldr     r0, [sp, #0x50]
        mov     r2, r2, asr #16
        mul     r0, r0, r11
        str     r0, [sp, #0x84]
        ldr     r0, [sp, #0x4C]
        mul     r0, r0, r11
        str     r0, [sp, #0x58]
        ldr     r0, [sp, #0x48]
        mul     r0, r0, r11
        str     r0, [sp, #0x54]
        ldr     r0, [sp, #0x44]
        mul     r0, r0, r11
        str     r0, [sp, #0x50]
        ldr     r0, [sp, #0x3C]
        mul     r0, r0, r11
        str     r0, [sp, #0x4C]
        ldr     r0, [sp, #0x34]
        mul     r0, r0, r11
        str     r0, [sp, #0x48]
        ldr     r0, [sp, #0x2C]
        mul     r0, r0, r11
        str     r0, [sp, #0x44]
        ldr     r0, [sp, #0x24]
        mul     r0, r0, r11
        str     r0, [sp, #0x3C]
        ldr     r0, [sp, #0x20]
        mul     r11, r0, r11
        str     r11, [sp, #0x34]
        ldr     r11, [sp, #0x8C]
        mov     r11, r11, lsl #16
        str     r11, [sp, #0x8C]
        ldr     r0, [sp, #0x8C]
        ldr     r11, [sp, #0x5C]
        mov     r0, r0, asr #16
        str     r0, [sp]
        ldr     r0, [sp]
        strh    lr, [r5, #6]
        strh    r6, [r5, #8]
        strh    r7, [r5, #0xA]
        strh    r8, [r5, #0xC]
        strh    r9, [r5, #0xE]
        strh    r10, [r5, #0x10]
        strh    r2, [r5, #0x12]
        mov     r11, r11, lsl #16
        strh    r0, [r5, #2]
        mov     r11, r11, asr #16
        strh    r11, [r5, #4]
        add     r0, sp, #0xE8
        ldrsh   r0, [r12, +r0]
        ldr     r12, [sp, #0x88]
        str     r0, [sp, #0x8C]
        ldr     r0, [sp, #0x90]
        sub     r12, r12, #0xFF
        add     r12, r12, r0, asr #15
        ldr     r0, [sp, #0x8C]
        sub     r0, r0, r12
        ldr     r12, [sp, #0x80]
        str     r0, [sp, #0x90]
        ldr     r0, [sp, #0x84]
        add     r0, r12, r0, asr #15
        str     r0, [sp, #0x8C]
        ldr     r0, [sp, #0x58]
        ldr     r12, [sp, #0x7C]
        add     r0, r12, r0, asr #15
        ldr     r12, [sp, #0x78]
        str     r0, [sp, #0x88]
        ldr     r0, [sp, #0x54]
        add     r0, r12, r0, asr #15
        ldr     r12, [sp, #0x74]
        str     r0, [sp, #0x84]
        ldr     r0, [sp, #0x50]
        add     r0, r12, r0, asr #15
        ldr     r12, [sp, #0x70]
        str     r0, [sp, #0x80]
        ldr     r0, [sp, #0x4C]
        add     r0, r12, r0, asr #15
        str     r0, [sp, #0x7C]
        ldr     r0, [sp, #0x48]
        ldr     r12, [sp, #0x6C]
        add     r0, r12, r0, asr #15
        str     r0, [sp, #0x78]
        ldr     r0, [sp, #0x44]
        ldr     r12, [sp, #0x68]
        add     r0, r12, r0, asr #15
        str     r0, [sp, #0x74]
        ldr     r0, [sp, #0x3C]
        ldr     r12, [sp, #0x64]
        add     r0, r12, r0, asr #15
        str     r0, [sp, #0x70]
        ldr     r0, [sp, #0x34]
        ldr     r12, [sp, #0x60]
        add     r0, r12, r0, asr #15
        ldr     r12, [sp, #0x18]
        str     r0, [sp, #0x6C]
        add     r0, sp, #0x43, 30
        strh    r12, [r3, +r0]
        ldr     r3, [sp, #0x90]
        strh    r3, [r1]
        ldr     r12, [sp]
        ldr     r3, [sp, #0x8C]
        sub     r12, r12, r3
        ldr     r3, [sp, #0x88]
        str     r12, [sp, #0x10]
        sub     r3, r11, r3
        str     r3, [sp, #0x14]
        ldr     r3, [sp, #0x84]
        sub     r3, lr, r3
        str     r3, [sp, #0x18]
        ldr     r3, [sp, #0x80]
        sub     r3, r6, r3
        str     r3, [sp, #0xC]
        ldr     r3, [sp, #0x7C]
        sub     r3, r7, r3
        str     r3, [sp, #0x20]
        ldr     r3, [sp, #0x78]
        sub     r3, r8, r3
        str     r3, [sp, #0x24]
        ldr     r3, [sp, #0x74]
        sub     r3, r9, r3
        str     r3, [sp, #0x2C]
        ldr     r3, [sp, #0x70]
        sub     r3, r10, r3
        str     r3, [sp, #0x34]
        ldr     r3, [sp, #0x6C]
        sub     r3, r2, r3
        str     r3, [sp, #0x3C]
        b       LDOQ17
LDOQ10:
        ldrsh   r8, [r0]
        ldr     r9, [pc, #0x108]
        ldrsh   r7, [r0, #2]
        mov     r8, r8, lsl #3
        add     r11, sp, #0x55, 30
        ldrsh   r10, [r9, +r8]
        mov     r7, r7, lsl #3
        add     r8, r9, r8
        str     r10, [sp, #0x90]
        ldrsh   r10, [r0, #4]
        str     r10, [sp, #0x8C]
        ldrsh   r9, [r8, #2]
        ldr     r10, [sp, #0x90]
        str     r9, [sp]
        ldrsh   r9, [r8, #4]
        str     r9, [sp, #0x88]
        ldrsh   r8, [r8, #6]
        str     r8, [sp, #0x10]
        ldr     r8, [pc, #0xC8]
        add     r9, r8, r7
        ldrsh   r7, [r8, +r7]
        str     r7, [sp, #8]
        ldrsh   r8, [r9, #2]
        str     r8, [sp, #4]
        ldrsh   r7, [r9, #4]
        str     r7, [sp, #0x14]
        ldrsh   r9, [r9, #6]
        str     r9, [sp, #0x18]
        strh    r10, [r2, +r11]
        ldr     r10, [sp]
        add     r11, sp, #0x13, 28
        strh    r10, [lr, #2]
        ldr     r10, [sp, #0x88]
        strh    r10, [r6, +r11]
        ldr     r11, [sp, #0x10]
        ldr     r10, [sp, #0x20]
        strh    r11, [r10, #2]
        ldr     r11, [sp, #8]
        strh    r8, [lr, #6]
        strh    r7, [r10, #4]
        strh    r9, [r10, #6]
        strh    r11, [lr, #4]
        ldr     r7, [sp, #0x8C]
        ldr     r9, [pc, #0x68]
        mov     r8, r7, asr #1
        tst     r7, #1
        mov     r7, r8, lsl #3
        ldrsh   r8, [r9, +r7]
        add     r7, r9, r7
        str     r7, [sp, #0xC]
        bne     LDOQ11
        ldr     r9, [sp, #0xC]
        strh    r8, [lr, #8]
        ldrsh   r10, [r9, #2]
        ldrsh   r7, [r9, #4]
        ldrsh   r9, [r9, #6]
        strh    r10, [lr, #0xA]
        ldr     r8, [sp, #0x20]
        strh    r7, [r8, #8]
        strh    r9, [r8, #0xA]
        b       LDOQ16
        .long   TableMeanLsf2
        .long   LDOQ_TablePredFac
        .long   dico2_lsf2
        .long   dico1_lsf2
        .long   mr515_3_lsf
        .long   dico3_lsf2
        .long   mr795_1_lsf
        .long   LDOQ_TableMeanLsf1
        .long   dico1_lsf1
        .long   dico2_lsf1
        .long   dico3_lsf1
        .long   dico4_lsf1
        .long   dico5_lsf1
LDOQ11:
        cmn     r8, #2, 18
        moveq   r7, #0xFF
        orreq   r7, r7, #0x7F, 24
        beq     LDOQ12
        rsb     r8, r8, #0
        mov     r8, r8, lsl #16
        mov     r7, r8, asr #16
LDOQ12:
        ldr     r8, [sp, #0xC]
        strh    r7, [lr, #8]
        ldrsh   r8, [r8, #2]
        cmn     r8, #2, 18
        moveq   r7, #0xFF
        orreq   r7, r7, #0x7F, 24
        beq     LDOQ13
        rsb     r8, r8, #0
        mov     r8, r8, lsl #16
        mov     r7, r8, asr #16
LDOQ13:
        ldr     r8, [sp, #0xC]
        strh    r7, [lr, #0xA]
        ldrsh   r8, [r8, #4]
        cmn     r8, #2, 18
        moveq   r7, #0xFF
        orreq   r7, r7, #0x7F, 24
        beq     LDOQ14
        rsb     r8, r8, #0
        mov     r8, r8, lsl #16
        mov     r7, r8, asr #16
LDOQ14:
        ldr     r8, [sp, #0xC]
        ldr     r9, [sp, #0x20]
        ldrsh   r8, [r8, #6]
        cmn     r8, #2, 18
        strh    r7, [r9, #8]
        moveq   r7, #0xFF
        orreq   r7, r7, #0x7F, 24
        beq     LDOQ15
        rsb     r8, r8, #0
        mov     r8, r8, lsl #16
        mov     r7, r8, asr #16
LDOQ15:
        ldr     r8, [sp, #0x20]
        strh    r7, [r8, #0xA]
LDOQ16:
        ldrsh   r7, [r0, #6]
        ldrsh   r0, [r0, #8]
        ldrsh   r10, [r1]
        mov     r11, r7, lsl #3
        ldr     r7, [pc, #-0xC0]
        ldrsh   r7, [r7, +r11]
        str     r7, [sp, #0x90]
        ldrsh   r8, [r1, #2]
        mov     r7, r0, lsl #3
        str     r8, [sp, #0x8C]
        ldrsh   r8, [r1, #4]
        str     r8, [sp, #0x88]
        ldrsh   r8, [r1, #6]
        str     r8, [sp, #0x84]
        ldrsh   r8, [r1, #8]
        str     r8, [sp, #0x80]
        ldrsh   r9, [r1, #0xC]
        ldrsh   r8, [r1, #0xA]
        ldrsh   r0, [r1, #0xE]
        str     r0, [sp, #0x7C]
        ldrsh   r0, [r1, #0x10]
        str     r0, [sp, #0x78]
        ldrsh   r0, [r1, #0x12]
        str     r0, [sp, #0x74]
        ldr     r0, [pc, #-0x110]
        add     r11, r0, r11
        ldrsh   r0, [r11, #2]
        str     r0, [sp, #0x70]
        ldrsh   r0, [r11, #4]
        str     r0, [sp, #0x24]
        ldrsh   r11, [r11, #6]
        ldr     r0, [pc, #-0x128]
        str     r11, [sp, #0x2C]
        add     r11, r0, r7
        ldrsh   r7, [r0, +r7]
        str     r7, [sp, #0x6C]
        ldrsh   r7, [r11, #2]
        str     r7, [sp, #0x68]
        ldrsh   r7, [r11, #4]
        str     r7, [sp, #0x34]
        ldrsh   r11, [r11, #6]
        mov     r7, #0x33
        orr     r7, r7, #0x53, 24
        mul     r10, r10, r7
        mul     r8, r8, r7
        mul     r9, r9, r7
        str     r11, [sp, #0x3C]
        str     r10, [sp, #0x64]
        ldr     r10, [sp, #0x8C]
        ldr     r11, [pc, #-0x184]
        str     r9, [sp, #0x5C]
        str     r8, [sp, #0x60]
        mul     r10, r10, r7
        ldr     r8, [sp, #0x7C]
        str     r10, [sp, #0x8C]
        ldr     r10, [sp, #0x88]
        mul     r8, r8, r7
        mul     r10, r10, r7
        str     r8, [sp, #0x7C]
        ldr     r8, [sp, #0x78]
        str     r10, [sp, #0x88]
        ldr     r10, [sp, #0x84]
        mul     r8, r8, r7
        mul     r10, r10, r7
        str     r8, [sp, #0x78]
        ldr     r8, [sp, #0x74]
        str     r10, [sp, #0x84]
        ldr     r10, [sp, #0x80]
        mul     r10, r10, r7
        mul     r7, r8, r7
        str     r10, [sp, #0x80]
        ldr     r10, [sp, #0x20]
        str     r7, [sp, #0x74]
        ldr     r7, [sp, #0x24]
        ldrsh   r8, [r11, #2]
        ldrsh   r9, [r11, #4]
        ldrsh   r0, [r11, #8]
        strh    r7, [r10, #0xC]
        ldr     r7, [sp, #0x2C]
        strh    r7, [r10, #0xE]
        ldr     r7, [sp, #0x34]
        strh    r7, [r10, #0x10]
        ldr     r7, [sp, #0x3C]
        strh    r7, [r10, #0x12]
        ldrsh   r7, [r11, #6]
        str     r0, [sp, #0x58]
        ldrsh   r0, [r11, #0xA]
        str     r0, [sp, #0x54]
        ldrsh   r0, [r11, #0xC]
        str     r0, [sp, #0x50]
        ldrsh   r0, [r11, #0xE]
        str     r0, [sp, #0x4C]
        ldrsh   r0, [r11, #0x10]
        str     r0, [sp, #0x48]
        ldrsh   r11, [r11, #0x12]
        add     r0, sp, #0x13, 28
        str     r11, [sp, #0x44]
        ldrsh   r0, [r6, +r0]
        ldr     r6, [sp, #0x90]
        mov     r11, #0x67
        str     r0, [sp, #0x94]
        orr     r11, r11, #6, 24
        strh    r6, [lr, #0xC]
        ldr     r6, [sp, #0x70]
        sub     r11, r11, #0xFF
        strh    r6, [lr, #0xE]
        ldr     r6, [sp, #0x6C]
        strh    r6, [lr, #0x10]
        ldr     r6, [sp, #0x68]
        strh    r6, [lr, #0x12]
        add     r6, sp, #0x55, 30
        ldrsh   r6, [r2, +r6]
        str     r6, [sp, #0x98]
        ldrsh   r2, [r10, #8]
        str     r2, [sp, #0xC]
        ldrsh   r10, [r10, #0xA]
        ldr     r2, [sp, #0x64]
        str     r10, [sp, #0x20]
        add     r11, r11, r2, asr #15
        ldrsh   r2, [lr, #8]
        str     r2, [sp, #0x64]
        ldrsh   lr, [lr, #0xA]
        ldr     r2, [sp, #0x8C]
        str     lr, [sp, #0x9C]
        mov     lr, r11, lsl #16
        add     r8, r8, r2, asr #15
        ldr     r2, [sp, #0x88]
        add     r6, r9, r2, asr #15
        ldr     r2, [sp, #0x94]
        add     r9, sp, #0xE8
        add     r2, r2, lr, asr #16
        strh    r2, [r12, +r9]
        ldr     r2, [sp, #0x84]
        ldr     r10, [sp, #0x7C]
        ldr     r12, [sp, #0x80]
        ldr     r11, [sp, #0x78]
        add     r0, r7, r2, asr #15
        ldr     r2, [sp, #0x58]
        add     r7, r2, r12, asr #15
        ldr     r2, [sp, #0x54]
        ldr     r12, [sp, #0x60]
        mov     r7, r7, lsl #16
        str     r7, [sp, #0x84]
        add     r9, r2, r12, asr #15
        ldr     r12, [sp, #0x5C]
        ldr     r2, [sp, #0x50]
        mov     r7, r9, lsl #16
        add     r12, r2, r12, asr #15
        ldr     r2, [sp, #0x4C]
        add     r2, r2, r10, asr #15
        ldr     r10, [sp, #0x48]
        mov     r9, r2, lsl #16
        add     r11, r10, r11, asr #15
        str     r11, [sp, #0x8C]
        ldr     r10, [sp, #0x44]
        ldr     r11, [sp, #0x74]
        ldr     r2, [sp, #0x8C]
        add     r11, r10, r11, asr #15
        str     r11, [sp, #0x88]
        mov     r11, r6, lsl #16
        mov     r6, r0, lsl #16
        ldr     r0, [sp, #0x98]
        mov     r2, r2, lsl #16
        mov     r10, r8, lsl #16
        mov     r8, r12, lsl #16
        ldr     r12, [sp, #0x88]
        add     lr, r0, lr, asr #16
        str     lr, [sp, #0x98]
        ldr     lr, [sp, #0x10]
        ldr     r0, [sp, #0x84]
        mov     r12, r12, lsl #16
        add     lr, lr, r10, asr #16
        str     lr, [sp, #0x8C]
        ldr     lr, [sp, #0x14]
        add     lr, lr, r11, asr #16
        str     lr, [sp, #0x88]
        ldr     lr, [sp, #0x18]
        add     lr, lr, r6, asr #16
        str     lr, [sp, #0x80]
        ldr     lr, [sp, #0xC]
        add     r0, lr, r0, asr #16
        ldr     lr, [sp, #0x20]
        str     r0, [sp, #0x7C]
        add     r0, sp, #0x43, 30
        add     lr, lr, r7, asr #16
        str     lr, [sp, #0x78]
        ldr     lr, [sp, #0x24]
        add     lr, lr, r8, asr #16
        str     lr, [sp, #0x74]
        ldr     lr, [sp, #0x2C]
        add     lr, lr, r9, asr #16
        str     lr, [sp, #0x60]
        ldr     lr, [sp, #0x34]
        add     lr, lr, r2, asr #16
        str     lr, [sp, #0x5C]
        ldr     lr, [sp, #0x3C]
        add     lr, lr, r12, asr #16
        str     lr, [sp, #0x58]
        ldr     lr, [sp, #0x98]
        strh    lr, [r3, +r0]
        ldr     r3, [sp, #0x94]
        strh    r3, [r1]
        ldr     r3, [sp]
        add     r10, r3, r10, asr #16
        ldr     r3, [sp, #0x8C]
        str     r10, [sp]
        strh    r3, [r5, #2]
        ldr     r3, [sp, #8]
        add     r11, r3, r11, asr #16
        ldr     r3, [sp, #0x88]
        strh    r3, [r5, #4]
        ldr     r3, [sp, #4]
        add     lr, r3, r6, asr #16
        ldr     r3, [sp, #0x80]
        strh    r3, [r5, #6]
        ldr     r6, [sp, #0x84]
        ldr     r3, [sp, #0x64]
        add     r6, r3, r6, asr #16
        ldr     r3, [sp, #0x7C]
        strh    r3, [r5, #8]
        ldr     r3, [sp, #0x9C]
        add     r7, r3, r7, asr #16
        ldr     r3, [sp, #0x78]
        strh    r3, [r5, #0xA]
        ldr     r3, [sp, #0x90]
        add     r8, r3, r8, asr #16
        ldr     r3, [sp, #0x74]
        strh    r3, [r5, #0xC]
        ldr     r3, [sp, #0x70]
        add     r9, r3, r9, asr #16
        ldr     r3, [sp, #0x60]
        strh    r3, [r5, #0xE]
        ldr     r3, [sp, #0x6C]
        add     r10, r3, r2, asr #16
        ldr     r2, [sp, #0x5C]
        strh    r2, [r5, #0x10]
        ldr     r2, [sp, #0x68]
        ldr     r3, [sp, #0x58]
        add     r2, r2, r12, asr #16
        strh    r3, [r5, #0x12]
LDOQ17:
        ldr     r3, [sp]
        strh    lr, [r4, #6]
        strh    r11, [r4, #4]
        strh    r3, [r4, #2]
        strh    r6, [r4, #8]
        strh    r7, [r4, #0xA]
        strh    r8, [r4, #0xC]
        strh    r9, [r4, #0xE]
        strh    r10, [r4, #0x10]
        strh    r2, [r4, #0x12]
        ldr     r2, [sp, #0x10]
        mov     r0, r4
        strh    r2, [r1, #2]
        ldr     r2, [sp, #0x14]
        strh    r2, [r1, #4]
        ldr     r2, [sp, #0x18]
        strh    r2, [r1, #6]
        ldr     r2, [sp, #0xC]
        strh    r2, [r1, #8]
        ldr     r2, [sp, #0x20]
        strh    r2, [r1, #0xA]
        ldr     r2, [sp, #0x24]
        strh    r2, [r1, #0xC]
        ldr     r2, [sp, #0x2C]
        strh    r2, [r1, #0xE]
        ldr     r2, [sp, #0x34]
        strh    r2, [r1, #0x10]
        ldr     r2, [sp, #0x3C]
        strh    r2, [r1, #0x12]
        mov     r2, #0xA
        mov     r1, #0xCD
        bl      ReorderLsf
        mov     r0, r5
        mov     r2, #0xA
        mov     r1, #0xCD
        bl      ReorderLsf
        ldr     r1, [sp, #0x28]
        mov     r0, r5
        mov     r2, #0xA
        bl      _ippsCopy_16s
        mov     r0, r4
        ldr     r4, [sp, #0x40]
        mov     r1, r4
        bl      _ippsLSFToLSP_GSMAMR_16s
        mov     r0, r5
        ldr     r5, [sp, #0x1C]
        mov     r1, r5
        bl      _ippsLSFToLSP_GSMAMR_16s
        ldr     r7, [sp, #0x38]
        ldr     r6, [sp, #0x30]
        mov     r0, r4
        mov     r2, r7
        mov     r3, #0xA
        mov     r1, r6
        bl      _ippsInterpolate_G729_16s
        add     r2, r7, #0x28
        mov     r1, r5
        mov     r0, r4
        mov     r3, #0xA
        bl      _ippsInterpolate_G729_16s
        add     r1, r7, #0x14
        mov     r0, r4
        mov     r2, #0xA
        bl      _ippsCopy_16s
        add     r1, r7, #0x3C
        mov     r2, #0xA
        mov     r0, r5
        bl      _ippsCopy_16s
        mov     r1, r6
        mov     r0, r5
        mov     r2, #0xA
        bl      _ippsCopy_16s
        mov     r0, #0
        add     sp, sp, #0x5E, 30
        ldmia   sp!, {r4 - r11, pc}
LDOQ18:
        mvn     r0, #7
        add     sp, sp, #0x5E, 30
        ldmia   sp!, {r4 - r11, pc}


        .data
        .align  4


LDOQ_TablePredFac:
        .byte   0x54,0x25,0x11,0x2A,0x1B,0x31,0xEC,0x33,0x2D,0x38,0x83,0x2D,0x5C,0x29,0x27,0x26
        .byte   0x91,0x21,0x54,0x19
LDOQ_TableMeanLsf1:
        .byte   0x68,0x05,0x1D,0x08,0x5C,0x0D,0xF4,0x13,0x56,0x1A,0xBA,0x1F,0x87,0x26,0x54,0x2B
        .byte   0xAA,0x31,0x85,0x35


