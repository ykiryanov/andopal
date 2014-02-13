        .text
        .align  4
        .globl  _ippsFixedCodebookSearch_G729D_16s


_ippsFixedCodebookSearch_G729D_16s:
        stmdb   sp!, {r4 - r10, lr}
        sub     sp, sp, #0x72, 30
        sub     sp, sp, #2, 22
        add     lr, sp, #8
        ldr     r5, [sp, #0x9E8]
        and     lr, lr, #0x1F
        ldr     r6, [sp, #0x9EC]
        rsb     lr, lr, #0
        mov     r4, r0
        add     r12, sp, #8
        and     lr, lr, #0x1F
        cmp     r4, #0
        add     r7, r12, lr
        mov     r8, r1
        mov     r9, r2
        mov     r10, r3
        beq     LDFC0
        cmp     r8, #0
        beq     LDFC0
        cmp     r9, #0
        beq     LDFC0
        cmp     r10, #0
        beq     LDFC0
        cmp     r5, #0
        beq     LDFC0
        cmp     r6, #0
        beq     LDFC0
        mov     r0, r8
        mov     r1, r7
        bl      _ippsToeplizMatrix_G729D_16s32s
        mov     r0, #0xF
        mov     r2, #0x9A, 30
        mov     r1, r7
        bl      _ippsRShiftC_32s_I
        str     r5, [sp, #4]
        str     r10, [sp]
        mov     r0, r4
        mov     r3, r9
        mov     r2, r8
        mov     r1, r7
        bl      LDFC_ownD2i40_11
        add     sp, sp, #0x72, 30
        strh    r0, [r6]
        mov     r0, #0
        add     sp, sp, #2, 22
        ldmia   sp!, {r4 - r10, pc}
LDFC0:
        add     sp, sp, #0x72, 30
        mvn     r0, #7
        add     sp, sp, #2, 22
        ldmia   sp!, {r4 - r10, pc}
LDFC_ownD2i40_11:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x51, 30
        add     r5, sp, #0xE4
        add     r6, sp, #0x84
        ldr     r8, [sp, #0x16C]
        and     r5, r5, #0xF
        and     r6, r6, #0xF
        rsb     r5, r5, #0
        rsb     r7, r6, #0
        ldr     r6, [sp, #0x168]
        add     r12, sp, #0x84
        and     r5, r5, #0xF
        add     lr, sp, #0xE4
        and     r7, r7, #0xF
        add     r5, lr, r5
        add     r12, r12, r7
        str     r8, [sp, #0x24]
        str     r2, [sp, #0x18]
        mov     r4, r3
        mov     r2, #1
        mvn     lr, #0
        mov     r9, r5
        mov     r8, r12
        mov     r7, #0x28
LDFC1:
        ldrsh   r10, [r0], #2
        cmp     r10, #0
        strgeh  r2, [r9]
        strgeh  r10, [r8]
        blt     LDFC19
LDFC2:
        subs    r7, r7, #1
        add     r9, r9, #2
        add     r8, r8, #2
        bne     LDFC1
        ldr     lr, [pc, #0x914]
        add     r8, r5, #2
        add     r2, r5, #6
        sub     lr, lr, #0x7C
        str     lr, [sp, #0x10]
        add     lr, r1, #1, 22
        str     lr, [sp, #4]
        add     lr, r1, #5, 24
        str     lr, [sp]
        add     lr, r1, #6, 24
        add     r9, r5, #4
        str     lr, [sp, #8]
        add     r10, r5, #8
        add     lr, r1, #7, 24
        add     r11, r1, #3, 24
        str     r8, [sp, #0x1C]
        str     lr, [sp, #0xC]
        str     r5, [sp, #0x20]
        str     r2, [sp, #0x14]
        mov     lr, r9
        str     r9, [sp, #0x28]
        str     r10, [sp, #0x30]
        str     r11, [sp, #0x44]
        str     r8, [sp, #0x6C]
        ldr     r10, [sp, #0x20]
        ldr     r11, [sp, #0x1C]
        ldr     r8, [sp, #0x14]
        ldr     r9, [sp, #0x10]
        add     r3, r1, #1, 24
        add     r0, r1, #2, 24
        mov     r7, #0
        str     r0, [sp, #0x54]
        str     r3, [sp, #0x58]
        str     r12, [sp, #0x2C]
        str     r5, [sp, #0x50]
        str     r6, [sp, #0x4C]
        str     r4, [sp, #0x48]
        str     r1, [sp, #0x64]
LDFC3:
        ldrsh   r4, [r10], #0xA
        ldrsh   r1, [r8], #0xA
        ldrsh   r0, [r11], #0xA
        ldrsh   r3, [lr], #0xA
        add     r4, r9, r4, lsl #1
        add     r0, r9, r0, lsl #1
        add     r1, r9, r1, lsl #1
        add     r3, r9, r3, lsl #1
        add     r12, r7, #5
        str     r4, [sp, #0x34]
        ldr     r4, [sp, #0x64]
        str     r0, [sp, #0x38]
        str     r1, [sp, #0x3C]
        str     r3, [sp, #0x40]
        ldr     r3, [sp, #0x6C]
        ldr     r1, [sp, #0x30]
        ldr     r0, [sp, #0x28]
        str     r8, [sp, #0x14]
        str     r7, [sp, #0x5C]
        ldr     r7, [sp, #0xC]
        ldr     r8, [sp, #4]
        mov     r6, r12, lsl #3
        add     r12, r4, r12, lsl #5
        mov     r5, r2
        mov     r4, #8
        str     r10, [sp, #0x20]
        str     r11, [sp, #0x1C]
        str     lr, [sp, #0x68]
        str     r2, [sp, #0x60]
LDFC4:
        ldrsh   r10, [r3], #0xA
        ldr     r2, [r12]
        subs    r4, r4, #1
        str     r2, [sp, #0x70]
        ldr     r2, [sp, #0x34]
        ldrsh   r11, [r0], #0xA
        ldrsh   lr, [r5], #0xA
        add     r2, r2, r10, lsl #1
        ldrsh   r9, [r2, #4]
        ldrsh   r2, [r1], #0xA
        str     r11, [sp, #0x74]
        ldr     r11, [sp, #0x70]
        mul     r9, r11, r9
        ldr     r11, [sp, #0x38]
        add     r10, r11, r10, lsl #1
        ldr     r11, [sp, #0x34]
        mov     r9, r9, asr #15
        add     r11, r11, lr, lsl #1
        str     r11, [sp, #0x70]
        str     r9, [r12], #4
        ldr     r9, [sp, #0x58]
        ldrsh   r10, [r10, #4]
        ldr     r11, [sp, #0x3C]
        ldr     r9, [r9, +r6, lsl #2]
        add     r11, r11, r2, lsl #1
        str     r11, [sp, #0x78]
        mul     r9, r9, r10
        ldr     r11, [sp, #0x74]
        ldr     r10, [sp, #0x38]
        mov     r9, r9, asr #15
        add     r11, r10, r11, lsl #1
        str     r11, [sp, #0x74]
        add     r2, r10, r2, lsl #1
        add     r11, r10, lr, lsl #1
        ldr     r10, [sp, #0x40]
        str     r11, [sp, #0x7C]
        add     lr, r10, lr, lsl #1
        str     lr, [sp, #0x80]
        ldr     lr, [sp, #0x58]
        str     r9, [lr, +r6, lsl #2]
        ldr     lr, [sp, #0x54]
        ldr     r9, [sp, #0x70]
        ldr     lr, [lr, +r6, lsl #2]
        ldrsh   r9, [r9, #4]
        mul     r9, lr, r9
        mov     lr, r9, asr #15
        ldr     r9, [sp, #0x54]
        str     lr, [r9, +r6, lsl #2]
        ldr     lr, [sp, #0x44]
        ldr     r9, [sp, #0x78]
        ldr     lr, [lr, +r6, lsl #2]
        ldrsh   r9, [r9, #4]
        mul     r9, lr, r9
        mov     lr, r9, asr #15
        ldr     r9, [sp, #0x44]
        str     lr, [r9, +r6, lsl #2]
        ldr     r9, [sp, #0x74]
        ldr     lr, [r8, +r6, lsl #2]
        ldrsh   r9, [r9, #4]
        mul     r9, lr, r9
        mov     lr, r9, asr #15
        str     lr, [r8, +r6, lsl #2]
        ldr     r9, [sp, #0x7C]
        ldr     lr, [sp]
        ldrsh   r9, [r9, #4]
        ldr     lr, [lr, +r6, lsl #2]
        mul     r9, lr, r9
        mov     lr, r9, asr #15
        ldr     r9, [sp]
        str     lr, [r9, +r6, lsl #2]
        ldr     lr, [sp, #8]
        ldrsh   r2, [r2, #4]
        ldr     lr, [lr, +r6, lsl #2]
        mul     r2, lr, r2
        ldr     lr, [sp, #8]
        mov     r2, r2, asr #15
        str     r2, [lr, +r6, lsl #2]
        ldr     lr, [sp, #0x80]
        ldr     r2, [r7, +r6, lsl #2]
        ldrsh   lr, [lr, #4]
        mul     lr, r2, lr
        mov     r2, lr, asr #15
        str     r2, [r7, +r6, lsl #2]
        add     r6, r6, #1
        bne     LDFC4
        ldr     r7, [sp, #0x5C]
        ldr     r10, [sp, #0x20]
        ldr     r11, [sp, #0x1C]
        ldr     r8, [sp, #0x14]
        ldr     lr, [sp, #0x68]
        ldr     r9, [sp, #0x10]
        ldr     r2, [sp, #0x60]
        add     r7, r7, #1
        cmp     r7, #8
        blt     LDFC3
        ldr     r2, [pc, #0x68C]
        ldr     r12, [sp, #0x2C]
        ldr     r5, [sp, #0x50]
        ldr     r6, [sp, #0x4C]
        ldr     r4, [sp, #0x48]
        ldr     r1, [sp, #0x64]
        mvn     lr, #0
        mov     r11, #0
        mov     r0, r11
        add     lr, lr, #2, 18
        str     r0, [sp, #4]
        str     lr, [sp, #0x20]
        mov     r3, #1
        sub     r8, r2, #0x34
        sub     r7, r2, #0x48
        sub     lr, r2, #0x5C
        add     r10, r1, #0xA0
        mov     r9, r0
        sub     r2, r2, #0x70
        str     r0, [sp, #0x54]
        str     r3, [sp, #0x58]
        str     r5, [sp, #0x50]
        str     r6, [sp, #0x4C]
        str     r4, [sp, #0x48]
        str     r1, [sp, #0x64]
LDFC5:
        cmp     r11, #4
        beq     LDFC18
LDFC6:
        mov     r1, r11, lsl #1
        ldrsh   r3, [r7, +r1]
        ldrsh   r5, [lr, +r1]
        ldrsh   r6, [r2, +r1]
        ldrsh   r1, [r8, +r1]
        ldr     r0, [sp, #0x64]
        and     r11, r11, #1
        mov     r4, #8
        add     r3, r0, r3, lsl #2
        str     r3, [sp, #0x60]
        mov     r3, #0
        str     r3, [sp, #0x68]
        add     r3, r12, r5, lsl #1
        add     r0, r0, r1, lsl #2
        str     r3, [sp, #0x5C]
        add     r1, r12, r6, lsl #1
        mov     r3, r10
        str     r11, [sp, #0x1C]
        str     r2, [sp, #0x14]
        str     lr, [sp, #0x10]
        str     r7, [sp, #0xC]
        str     r8, [sp, #8]
        str     r9, [sp]
        str     r10, [sp, #0x28]
        str     r12, [sp, #0x2C]
LDFC7:
        ldrsh   r11, [r1], #0xA
        ldr     r10, [r0], #4
        ldr     r12, [sp, #0x5C]
        ldr     lr, [sp, #0x60]
        str     r1, [sp, #0x44]
        str     r0, [sp, #0x40]
        ldr     r0, [sp, #0x20]
        ldr     r1, [sp, #0x54]
        mov     r2, r6, lsl #16
        mov     r9, r5
        mov     r2, r2, asr #16
        mov     r7, r3
        mov     r8, #8
        str     r3, [sp, #0x3C]
        str     r4, [sp, #0x38]
        str     r5, [sp, #0x34]
        str     r6, [sp, #0x30]
LDFC8:
        ldrsh   r5, [r12], #0xA
        ldr     r4, [lr], #4
        ldr     r3, [r7], #4
        add     r5, r11, r5
        mov     r5, r5, lsl #16
        add     r4, r4, r10
        add     r3, r4, r3, lsl #1
        mov     r5, r5, asr #16
        mul     r5, r5, r5
        mov     r3, r3, asr #4
        mov     r3, r3, lsl #16
        mov     r5, r5, asr #15
        mov     r6, r5, lsl #16
        mov     r4, r3, asr #16
        mul     r5, r1, r4
        mov     r3, r6, asr #16
        mul     r6, r0, r3
        sub     r6, r6, r5
        cmp     r6, #0
        ble     LDFC9
        mov     r5, r9, lsl #16
        mov     r1, r3
        mov     r5, r5, asr #16
        mov     r3, #1
        mov     r0, r4
        str     r5, [sp, #0x58]
        str     r2, [sp, #4]
        str     r3, [sp, #0x68]
LDFC9:
        subs    r8, r8, #1
        add     r9, r9, #5
        bne     LDFC8
        ldr     r4, [sp, #0x38]
        ldr     r3, [sp, #0x3C]
        ldr     r6, [sp, #0x30]
        str     r0, [sp, #0x20]
        str     r1, [sp, #0x54]
        ldr     r1, [sp, #0x44]
        ldr     r0, [sp, #0x40]
        ldr     r5, [sp, #0x34]
        subs    r4, r4, #1
        add     r6, r6, #5
        add     r3, r3, #0x20
        bne     LDFC7
        ldr     r11, [sp, #0x1C]
        ldr     r10, [sp, #0x28]
        ldr     r2, [sp, #0x14]
        ldr     lr, [sp, #0x10]
        ldr     r7, [sp, #0xC]
        ldr     r8, [sp, #8]
        ldr     r9, [sp]
        ldr     r12, [sp, #0x2C]
        cmp     r11, #0
        add     r10, r10, #1, 24
        beq     LDFC10
        ldr     r0, [sp, #0x68]
        cmp     r0, #0
        beq     LDFC10
        ldr     r0, [sp, #0x58]
        ldr     r1, [sp, #4]
        str     r0, [sp, #4]
        str     r1, [sp, #0x58]
LDFC10:
        add     r9, r9, #1
        mov     r0, r9, lsl #16
        mov     r11, r0, asr #16
        cmp     r11, #9
        blt     LDFC5
        ldr     r3, [sp, #0x58]
        ldr     r1, [pc, #0x46C]
        ldr     r5, [sp, #0x50]
        ldr     r6, [sp, #0x4C]
        ldr     r4, [sp, #0x48]
        ldrsh   r12, [r1, #-0x20]
        mov     r3, r3, lsl #16
        mov     r11, #1
        mov     r2, #0x10
        cmp     r12, r3, asr #16
        moveq   lr, #0
        beq     LDFC11
        ldrsh   r12, [r1, #-0x1E]
        cmp     r12, r3, asr #16
        moveq   lr, r11
        beq     LDFC11
        ldrsh   r12, [r1, #-0x1C]
        cmp     r12, r3, asr #16
        moveq   lr, #2
        beq     LDFC11
        ldrsh   r12, [r1, #-0x1A]
        cmp     r12, r3, asr #16
        moveq   lr, #3
        beq     LDFC11
        ldrsh   r12, [r1, #-0x18]
        cmp     r12, r3, asr #16
        moveq   lr, #4
        beq     LDFC11
        ldrsh   r12, [r1, #-0x16]
        cmp     r12, r3, asr #16
        moveq   lr, #5
        beq     LDFC11
        ldrsh   r12, [r1, #-0x14]
        cmp     r12, r3, asr #16
        moveq   lr, #6
        beq     LDFC11
        ldrsh   r12, [r1, #-0x12]
        cmp     r12, r3, asr #16
        moveq   lr, #7
        beq     LDFC11
        ldrsh   r12, [r1, #-0x10]
        cmp     r12, r3, asr #16
        moveq   lr, #8
        beq     LDFC11
        ldrsh   r12, [r1, #-0xE]
        cmp     r12, r3, asr #16
        moveq   lr, #9
        beq     LDFC11
        ldrsh   r12, [r1, #-0xC]
        cmp     r12, r3, asr #16
        moveq   lr, #0xA
        beq     LDFC11
        ldrsh   r12, [r1, #-0xA]
        cmp     r12, r3, asr #16
        moveq   lr, #0xB
        beq     LDFC11
        ldrsh   r12, [r1, #-8]
        cmp     r12, r3, asr #16
        moveq   lr, #0xC
        beq     LDFC11
        ldrsh   r12, [r1, #-6]
        cmp     r12, r3, asr #16
        moveq   lr, #0xD
        beq     LDFC11
        ldrsh   r12, [r1, #-4]
        cmp     r12, r3, asr #16
        moveq   lr, #0xE
        beq     LDFC11
        ldrsh   r12, [r1, #-2]
        cmp     r12, r3, asr #16
        moveq   lr, #0xF
        movne   lr, r2
LDFC11:
        ldr     r12, [sp, #4]
        ldrsh   r7, [r1]
        mov     r12, r12, lsl #16
        cmp     r7, r12, asr #16
        moveq   r2, #0
        beq     LDFC12
        ldrsh   r7, [r1, #2]
        cmp     r7, r12, asr #16
        moveq   r2, r11
        beq     LDFC12
        ldrsh   r7, [r1, #4]
        cmp     r7, r12, asr #16
        moveq   r2, #2
        beq     LDFC12
        ldrsh   r7, [r1, #6]
        cmp     r7, r12, asr #16
        moveq   r2, #3
        beq     LDFC12
        ldrsh   r7, [r1, #8]
        cmp     r7, r12, asr #16
        moveq   r2, #4
        beq     LDFC12
        ldrsh   r7, [r1, #0xA]
        cmp     r7, r12, asr #16
        moveq   r2, #5
        beq     LDFC12
        ldrsh   r7, [r1, #0xC]
        cmp     r7, r12, asr #16
        moveq   r2, #6
        beq     LDFC12
        ldrsh   r7, [r1, #0xE]
        cmp     r7, r12, asr #16
        moveq   r2, #7
        beq     LDFC12
        ldrsh   r7, [r1, #0x10]
        cmp     r7, r12, asr #16
        moveq   r2, #8
        beq     LDFC12
        ldrsh   r7, [r1, #0x12]
        cmp     r7, r12, asr #16
        moveq   r2, #9
        beq     LDFC12
        ldrsh   r7, [r1, #0x14]
        cmp     r7, r12, asr #16
        moveq   r2, #0xA
        beq     LDFC12
        ldrsh   r7, [r1, #0x16]
        cmp     r7, r12, asr #16
        moveq   r2, #0xB
        beq     LDFC12
        ldrsh   r7, [r1, #0x18]
        cmp     r7, r12, asr #16
        moveq   r2, #0xC
        beq     LDFC12
        ldrsh   r7, [r1, #0x1A]
        cmp     r7, r12, asr #16
        moveq   r2, #0xD
        beq     LDFC12
        ldrsh   r7, [r1, #0x1C]
        cmp     r7, r12, asr #16
        moveq   r2, #0xE
        beq     LDFC12
        ldrsh   r7, [r1, #0x1E]
        cmp     r7, r12, asr #16
        moveq   r2, #0xF
        beq     LDFC12
        ldrsh   r7, [r1, #0x20]
        cmp     r7, r12, asr #16
        beq     LDFC12
        ldrsh   r2, [r1, #0x22]
        cmp     r2, r12, asr #16
        moveq   r2, #0x11
        beq     LDFC12
        ldrsh   r2, [r1, #0x24]
        cmp     r2, r12, asr #16
        moveq   r2, #0x12
        beq     LDFC12
        ldrsh   r2, [r1, #0x26]
        cmp     r2, r12, asr #16
        moveq   r2, #0x13
        beq     LDFC12
        ldrsh   r2, [r1, #0x28]
        cmp     r2, r12, asr #16
        moveq   r2, #0x14
        beq     LDFC12
        ldrsh   r2, [r1, #0x2A]
        cmp     r2, r12, asr #16
        moveq   r2, #0x15
        beq     LDFC12
        ldrsh   r2, [r1, #0x2C]
        cmp     r2, r12, asr #16
        moveq   r2, #0x16
        beq     LDFC12
        ldrsh   r2, [r1, #0x2E]
        cmp     r2, r12, asr #16
        moveq   r2, #0x17
        beq     LDFC12
        ldrsh   r2, [r1, #0x30]
        cmp     r2, r12, asr #16
        moveq   r2, #0x18
        beq     LDFC12
        ldrsh   r2, [r1, #0x32]
        cmp     r2, r12, asr #16
        moveq   r2, #0x19
        beq     LDFC12
        ldrsh   r2, [r1, #0x34]
        cmp     r2, r12, asr #16
        moveq   r2, #0x1A
        beq     LDFC12
        ldrsh   r2, [r1, #0x36]
        cmp     r2, r12, asr #16
        moveq   r2, #0x1B
        beq     LDFC12
        ldrsh   r2, [r1, #0x38]
        cmp     r2, r12, asr #16
        moveq   r2, #0x1C
        beq     LDFC12
        ldrsh   r2, [r1, #0x3A]
        cmp     r2, r12, asr #16
        moveq   r2, #0x1D
        beq     LDFC12
        ldrsh   r2, [r1, #0x3C]
        cmp     r2, r12, asr #16
        moveq   r2, #0x1E
        beq     LDFC12
        ldrsh   r2, [r1, #0x3E]
        cmp     r2, r12, asr #16
        moveq   r2, #0x1F
        movne   r2, #0x20
LDFC12:
        sub     r12, r1, #0x20
        mov     lr, lr, lsl #1
        ldrsh   r7, [r12, +lr]
        mov     r2, r2, lsl #1
        ldrsh   r10, [r1, +r2]
        add     r12, r1, #0x40
        ldrsh   r1, [r12, +lr]
        ldrsh   r2, [r12, +r2]
        mov     r9, r7, lsl #1
        ldrsh   r12, [r5, +r9]
        cmp     r12, #0
        movle   r11, #0
        mov     r8, r10, lsl #1
        ldrsh   r12, [r5, +r8]
        cmp     r12, #0
        movle   r12, #0
        strle   r12, [sp]
        movgt   r12, #1
        strgt   r12, [sp]
        add     r2, r1, r2, lsl #4
        mov     r1, #0x28
        mov     r2, r2, lsl #16
        str     r2, [sp, #0x80]
        mov     r0, r4
        bl      _ippsZero_16s
        ldr     r2, [sp, #0x80]
        ldr     r1, [pc, #0xE4]
        mov     r0, r6
        mov     r2, r2, asr #16
        str     r2, [sp, #4]
        ldrsh   r12, [r5, +r9]
        add     r1, r1, #0x80
        ldrsh   r5, [r5, +r8]
        ldr     r2, [sp]
        add     r12, r1, r12, lsl #1
        ldrsh   r12, [r12, #2]
        add     r5, r1, r5, lsl #1
        add     r2, r11, r2, lsl #1
        strh    r12, [r4, +r9]
        ldrsh   r5, [r5, #2]
        ldrsh   r12, [r4, +r8]
        mov     r1, #0x28
        add     r5, r12, r5
        strh    r5, [r4, +r8]
        ldr     r3, [sp, #0x24]
        strh    r2, [r3]
        bl      _ippsZero_16s
        cmp     r11, #0
        bne     LDFC14
        cmp     r7, #0x28
        bge     LDFC15
        ldr     r2, [sp, #0x18]
        add     r1, r6, r7, lsl #1
LDFC13:
        ldrsh   r3, [r2], #2
        add     r7, r7, #1
        rsb     r3, r3, #0
        strh    r3, [r1], #2
        cmp     r7, #0x28
        blt     LDFC13
        b       LDFC15
LDFC14:
        ldr     r0, [sp, #0x18]
        rsb     r2, r7, #0x28
        add     r1, r6, r9
        bl      _ippsCopy_16s
LDFC15:
        ldr     r1, [sp]
        rsb     r2, r10, #0x28
        cmp     r1, #0
        add     r1, r6, r8
        bne     LDFC16
        ldr     r0, [sp, #0x18]
        bl      _ippsSub_16s_I
        b       LDFC17
LDFC16:
        ldr     r0, [sp, #0x18]
        bl      _ippsAdd_16s_I
LDFC17:
        ldr     r0, [sp, #4]
        add     sp, sp, #0x51, 30
        ldmia   sp!, {r4 - r11, pc}
LDFC18:
        add     r9, r9, #1
        mov     r0, r9, lsl #16
        mov     r11, r0, asr #16
        b       LDFC6
LDFC19:
        rsb     r10, r10, #0
        strh    lr, [r9]
        strh    r10, [r8]
        b       LDFC2
        .long   LDFC_trackTable1


        .data
        .align  4


LDFC_mult_sign:
        .byte   0xFF,0x7F,0x00,0x00,0x01,0x80,0x00,0x00,0xFE,0x7F,0x00,0x00
LDFC_startPos_p0:
        .byte   0x00,0x00,0x01,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x01,0x00,0x01,0x00,0x01,0x00
        .byte   0x02,0x00,0x00,0x00
LDFC_startPos_p1:
        .byte   0x01,0x00,0x01,0x00,0x03,0x00,0x04,0x00,0x00,0x00,0x02,0x00,0x03,0x00,0x04,0x00
        .byte   0x03,0x00,0x00,0x00
LDFC_offset_outptr:
        .byte   0x08,0x00,0x08,0x00,0x18,0x00,0x20,0x00,0x00,0x00,0x10,0x00,0x18,0x00,0x20,0x00
        .byte   0x18,0x00,0x00,0x00
LDFC_offset_i0i0:
        .byte   0x00,0x00,0x08,0x00,0x00,0x00,0x18,0x00,0x00,0x00,0x08,0x00,0x08,0x00,0x08,0x00
        .byte   0x10,0x00,0x00,0x00
LDFC_trackTable0:
        .byte   0x01,0x00,0x03,0x00,0x06,0x00,0x08,0x00,0x0B,0x00,0x0D,0x00,0x10,0x00,0x12,0x00
        .byte   0x15,0x00,0x17,0x00,0x1A,0x00,0x1C,0x00,0x1F,0x00,0x21,0x00,0x24,0x00,0x26,0x00
LDFC_trackTable1:
        .byte   0x00,0x00,0x02,0x00,0x04,0x00,0x05,0x00,0x07,0x00,0x09,0x00,0x0A,0x00,0x0C,0x00
        .byte   0x0E,0x00,0x0F,0x00,0x11,0x00,0x13,0x00,0x14,0x00,0x16,0x00,0x18,0x00,0x19,0x00
        .byte   0x1B,0x00,0x1D,0x00,0x1E,0x00,0x20,0x00,0x22,0x00,0x23,0x00,0x25,0x00,0x27,0x00
        .byte   0x01,0x00,0x06,0x00,0x0B,0x00,0x10,0x00,0x15,0x00,0x1A,0x00,0x1F,0x00,0x24,0x00
LDFC_grayEncode:
        .byte   0x00,0x00,0x01,0x00,0x03,0x00,0x02,0x00,0x06,0x00,0x07,0x00,0x05,0x00,0x04,0x00
        .byte   0x0C,0x00,0x0D,0x00,0x0F,0x00,0x0E,0x00,0x0A,0x00,0x0B,0x00,0x09,0x00,0x08,0x00
        .byte   0x18,0x00,0x19,0x00,0x1B,0x00,0x1A,0x00,0x1E,0x00,0x1F,0x00,0x1D,0x00,0x1C,0x00
        .byte   0x14,0x00,0x15,0x00,0x17,0x00,0x16,0x00,0x12,0x00,0x13,0x00,0x11,0x00,0x10,0x00
LDFC_shr_sign:
        .byte   0x00,0xE0,0x00,0x00,0xFF,0x1F


