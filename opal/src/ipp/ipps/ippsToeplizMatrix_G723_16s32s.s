        .text
        .align  4
        .globl  _ippsToeplizMatrix_G723_16s32s


_ippsToeplizMatrix_G723_16s32s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x56, 30
        add     r2, sp, #0xC4
        and     r2, r2, #0xF
        rsb     r2, r2, #0
        mov     r10, r0
        add     r6, sp, #0xC4
        and     r5, r2, #0xF
        cmp     r10, #0
        mov     r7, r1
        add     r8, r6, r5
        beq     LDVI8
        cmp     r7, #0
        beq     LDVI8
        add     r3, sp, #0x55, 30
        mov     r2, #0
        mov     r1, #0x3C
        mov     r0, r10
        bl      _ippsSumSquare_NS_16s32s_Sfs
        ldr     lr, [sp, #0x154]
        mov     r9, #0
        cmp     lr, #0xFA, 10
        ble     LDVI0
        add     r4, r8, #8
        mov     r0, r10
        mov     r3, #0x3C
        mov     r2, r4
        mov     r1, #1
        bl      _ippsRShiftC_16s
        b       LDVI3
LDVI0:
        cmp     lr, #0
        moveq   r2, r9
        beq     LDVI2
        ldr     r2, [pc, #0x6C8]
        ldr     r3, [pc, #0x6C8]
        movs    r12, lr, lsr #16
        bne     LDVI1
        bic     lr, lr, #0xFF, 8
        bic     r12, lr, #0xFF, 16
        movs    lr, r12, asr #8
        movne   r12, lr, lsl #1
        movne   r3, r2
        moveq   r12, r12, lsl #1
        ldrsh   r12, [r3, +r12]
        add     r2, r12, #0x10
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #16
        b       LDVI2
LDVI1:
        movs    lr, lr, lsr #24
        movne   lr, lr, lsl #1
        ldrnesh r2, [r2, +lr]
        moveq   r12, r12, lsl #1
        ldreqsh r2, [r3, +r12]
LDVI2:
        sub     r3, r2, #1
        add     r4, r8, #8
        mov     r1, r3, asr #1
        mov     r0, r10
        mov     r3, #0x3C
        mov     r2, r4
        bl      _ippsLShiftC_16s
LDVI3:
        mov     r0, r9
        strh    r0, [r5, +r6]
        strh    r0, [r8, #2]
        strh    r0, [r8, #4]
        strh    r0, [r8, #6]
        add     r2, r8, #0x10
        str     r2, [sp, #0x78]
        add     r2, r8, #0x12
        add     r5, r7, #0x7C
        str     r2, [sp, #0x88]
        str     r5, [sp, #0x94]
        add     r2, r8, #0x14
        add     r5, r7, #0x5C
        str     r2, [sp, #0x90]
        str     r5, [sp, #0x64]
        add     r2, r8, #0x16
        add     r5, r7, #0x3C
        str     r2, [sp, #0x84]
        str     r5, [sp, #0x70]
        add     r2, r8, #0x18
        add     r5, r7, #0x1C
        add     r1, r8, #2
        add     r11, r8, #4
        add     r10, r8, #6
        add     lr, r8, #0xA
        add     r12, r8, #0xC
        add     r3, r8, #0xE
        str     r2, [sp, #0x8C]
        str     r5, [sp, #0x98]
        add     r2, r8, #0x1A
        sub     r5, r7, #4
        sub     r7, r7, #8
        mov     r6, r0
        str     r2, [sp, #0x7C]
        str     r8, [sp, #0x80]
        str     r1, [sp, #0x58]
        str     r11, [sp, #0x5C]
        str     r10, [sp, #0x60]
        str     lr, [sp, #0x68]
        str     r12, [sp, #0x6C]
        str     r3, [sp, #0x74]
        str     r7, [sp, #0x4C]
        str     r3, [sp, #0x28]
        str     r12, [sp, #0x2C]
        str     lr, [sp, #0x30]
        str     r10, [sp, #0x34]
        str     r11, [sp, #0x38]
        str     r1, [sp, #0x3C]
        str     r0, [sp, #0x40]
        str     r4, [sp, #0x24]
        str     r9, [sp, #0x44]
        str     r8, [sp, #0x48]
LDVI4:
        ldr     r11, [sp, #0x80]
        ldr     r3, [sp, #0x40]
        ldr     r10, [sp, #0x58]
        ldrsh   r2, [r11], #0x10
        ldr     r4, [sp, #0x44]
        ldrsh   r8, [r10], #0x10
        ldr     r1, [sp, #0x5C]
        mla     lr, r2, r2, r3
        ldr     r3, [sp, #0x24]
        ldr     r2, [sp, #0x60]
        ldrsh   r0, [r1], #0x10
        ldrsh   r4, [r3, +r4]
        mla     lr, r8, r8, lr
        ldrsh   r12, [r2], #0x10
        ldr     r3, [sp, #0x68]
        ldr     r7, [sp, #0x6C]
        str     r4, [sp, #0x54]
        ldrsh   r4, [r3], #0x10
        ldrsh   r9, [r7], #0x10
        str     lr, [sp, #0x50]
        ldr     lr, [sp, #0x74]
        ldrsh   r8, [lr], #0x10
        str     r11, [sp, #0x80]
        ldr     r11, [sp, #0x50]
        str     r10, [sp, #0x58]
        rsb     r10, r6, #0
        mla     r0, r0, r0, r11
        str     r0, [sp, #0x40]
        ldr     r0, [sp, #0x94]
        str     r11, [r0, +r10, lsl #2]
        ldr     r0, [sp, #0x40]
        str     r1, [sp, #0x5C]
        ldr     r1, [sp, #0x64]
        mla     r12, r12, r12, r0
        rsb     r0, r6, #7
        str     r0, [sp, #0x50]
        cmp     r0, #0
        ldr     r0, [sp, #0x54]
        str     r2, [sp, #0x60]
        str     r3, [sp, #0x68]
        str     r7, [sp, #0x6C]
        mla     r0, r0, r0, r12
        str     lr, [sp, #0x74]
        str     r12, [r1, +r10, lsl #2]
        ldr     r1, [sp, #0x70]
        mla     r0, r4, r4, r0
        mla     r9, r9, r9, r0
        str     r0, [r1, +r10, lsl #2]
        ldr     r0, [sp, #0x98]
        mla     r9, r8, r8, r9
        str     r9, [sp, #0x40]
        str     r9, [r0, +r10, lsl #2]
        ble     LDVI7
        ldr     r10, [sp, #0x2C]
        ldr     r3, [sp, #0x38]
        ldr     r7, [sp, #0x48]
        ldr     lr, [sp, #0x3C]
        ldr     r2, [sp, #0x34]
        ldr     r1, [sp, #0x30]
        mov     r9, #0
        str     r10, [sp, #0x54]
        ldr     r10, [sp, #0x28]
        mov     r12, r9
        mov     r4, r12
        mov     r0, r4
        str     r3, [sp, #0xC]
        ldr     r3, [sp, #0x4C]
        str     r0, [sp]
        mov     r8, r6
        str     r10, [sp, #0x20]
        str     r1, [sp, #0x1C]
        str     r2, [sp, #0x18]
        str     lr, [sp, #0x10]
        str     r8, [sp, #4]
        str     r7, [sp, #8]
        str     r9, [sp, #0x14]
LDVI5:
        ldr     r1, [sp, #8]
        ldr     lr, [sp, #0x34]
        ldrsh   r1, [r1]
        str     r1, [sp, #0x9C]
        ldr     r1, [sp, #4]
        ldr     r8, [sp, #0x9C]
        mov     r2, r1, lsl #4
        ldr     r1, [sp, #0x38]
        ldrsh   lr, [lr, +r2]
        ldrsh   r7, [r1, +r2]
        ldr     r1, [sp, #0x10]
        ldrsh   r1, [r1]
        str     lr, [sp, #0xA0]
        mla     r8, r8, r7, r12
        ldr     lr, [sp, #0x24]
        ldr     r7, [sp, #0x9C]
        ldr     r10, [sp, #0xA0]
        ldrsh   lr, [lr, +r2]
        ldr     r12, [sp, #0xC]
        mla     r8, r1, r10, r8
        ldr     r10, [sp, #0x24]
        mla     r4, r7, lr, r4
        ldr     r7, [sp, #0x30]
        ldrsh   r12, [r12]
        ldrsh   r9, [r7, +r2]
        ldr     r7, [sp, #0x18]
        ldrsh   r7, [r7]
        str     r8, [sp, #0xA0]
        mla     r4, r9, r1, r4
        ldr     r8, [sp, #0x2C]
        ldrsh   r11, [r8, +r2]
        ldr     r8, [sp, #0x14]
        str     r4, [sp, #0xA4]
        ldr     r4, [sp, #0xA0]
        ldrsh   r10, [r10, +r8]
        ldr     r8, [sp, #0x28]
        mla     r4, lr, r12, r4
        ldr     lr, [sp]
        ldrsh   r8, [r8, +r2]
        str     r4, [sp, #0xA8]
        ldr     r4, [sp, #0x9C]
        mla     lr, r4, r11, lr
        ldr     r4, [sp, #0x54]
        str     lr, [sp, #0x9C]
        ldr     lr, [sp, #0xA4]
        mla     lr, r11, r12, lr
        str     lr, [sp]
        ldr     lr, [sp, #0x1C]
        ldrsh   r4, [r4]
        ldrsh   lr, [lr]
        str     r4, [sp, #0xAC]
        ldr     r4, [sp, #0xA8]
        mla     r4, r7, r9, r4
        ldr     r9, [sp, #0x9C]
        str     r4, [sp, #0xA8]
        ldr     r4, [sp, #0xA8]
        mla     r9, r8, r1, r9
        ldr     r1, [sp, #0x78]
        mla     r4, r11, r10, r4
        str     r9, [sp, #0x9C]
        ldr     r11, [sp, #0x9C]
        ldrsh   r9, [r1, +r2]
        ldr     r1, [sp]
        mla     r1, r8, r7, r1
        mla     r11, r12, r9, r11
        ldr     r12, [sp, #0x88]
        str     r1, [sp, #0xB0]
        ldr     r1, [sp, #0x20]
        ldrsh   r1, [r1]
        str     r11, [sp, #0xB4]
        ldr     r11, [sp, #0xB0]
        str     r4, [sp]
        ldrsh   r12, [r12, +r2]
        mla     r11, r10, r9, r11
        ldr     r4, [sp, #0xAC]
        str     r11, [sp, #0xB8]
        ldr     r11, [sp, #0x90]
        ldrsh   r11, [r11, +r2]
        str     r11, [sp, #0xBC]
        ldr     r11, [sp]
        mla     r11, lr, r8, r11
        ldr     r8, [sp, #0xB4]
        str     r11, [sp, #0xC0]
        ldr     r11, [sp, #0x8C]
        mla     r8, r7, r12, r8
        ldr     r7, [sp, #0x84]
        ldrsh   r7, [r7, +r2]
        str     r7, [sp, #0xB4]
        ldrsh   r11, [r11, +r2]
        ldr     r7, [sp, #0xB8]
        str     r11, [sp, #0xB8]
        ldr     r11, [sp, #0xC0]
        mla     r7, lr, r12, r7
        mla     r11, r9, r4, r11
        ldr     r9, [sp, #0xBC]
        ldr     r4, [sp, #0xAC]
        str     r11, [sp]
        rsb     r11, r0, #0
        mla     r10, r10, r9, r8
        mla     r9, r4, r9, r7
        str     r9, [sp, #0xBC]
        sub     r9, r11, r6
        ldr     r11, [sp]
        mla     r12, r12, r1, r11
        ldr     r11, [sp, #0xB4]
        mla     r10, lr, r11, r10
        add     lr, r9, #0x34
        str     lr, [sp]
        ldr     lr, [sp, #0xBC]
        mla     r4, r1, r11, lr
        ldr     lr, [sp]
        ldr     r11, [sp, #0xA0]
        rsb     lr, r0, lr, lsl #3
        str     r11, [r5, +lr, lsl #2]
        ldr     r11, [sp, #0xAC]
        ldr     lr, [sp, #0xB8]
        mla     lr, r11, lr, r10
        ldr     r11, [sp, #0x7C]
        str     lr, [sp, #0xBC]
        add     lr, r9, #0x24
        ldrsh   r2, [r11, +r2]
        ldr     r11, [sp, #0xA8]
        rsb     lr, r0, lr, lsl #3
        str     r11, [r5, +lr, lsl #2]
        ldr     lr, [sp, #0xBC]
        mla     lr, r1, r2, lr
        add     r2, r9, #0xC
        rsb     r1, r0, #0x1C
        rsb     r2, r0, r2, lsl #3
        str     lr, [sp]
        ldr     lr, [sp, #0xC0]
        rsb     r1, r6, r1, lsl #3
        sub     r1, r1, r0
        str     lr, [r5, +r2, lsl #2]
        str     r12, [r3, +r1, lsl #2]
        ldr     lr, [sp, #0xA4]
        add     r2, r9, #0x2C
        add     r1, r9, #0x14
        add     r9, r9, #0x1C
        rsb     r2, r0, r2, lsl #3
        str     lr, [r5, +r2, lsl #2]
        ldr     r2, [sp, #0xB0]
        rsb     r1, r0, r1, lsl #3
        rsb     lr, r0, #0x24
        str     r2, [r5, +r1, lsl #2]
        rsb     r2, r0, #0x2C
        rsb     r1, r0, #0x14
        rsb     r2, r6, r2, lsl #3
        sub     r2, r2, r0
        rsb     r1, r6, r1, lsl #3
        str     r7, [r3, +r2, lsl #2]
        sub     r1, r1, r0
        str     r4, [r3, +r1, lsl #2]
        rsb     r7, r0, r9, lsl #3
        ldr     r9, [sp, #0x9C]
        rsb     r1, r0, #0x34
        rsb     lr, r6, lr, lsl #3
        str     r9, [r5, +r7, lsl #2]
        rsb     r2, r6, r1, lsl #3
        sub     r2, r2, r0
        str     r8, [r3, +r2, lsl #2]
        rsb     r1, r0, #0xC
        sub     lr, lr, r0
        str     r10, [r3, +lr, lsl #2]
        ldr     r2, [sp, #0x50]
        rsb     r1, r6, r1, lsl #3
        sub     r1, r1, r0
        add     r0, r0, #1
        cmp     r0, r2
        ldr     r2, [sp, #8]
        add     r2, r2, #0x10
        str     r2, [sp, #8]
        ldr     r2, [sp, #0x10]
        add     r2, r2, #0x10
        str     r2, [sp, #0x10]
        ldr     r2, [sp, #0xC]
        add     r2, r2, #0x10
        str     r2, [sp, #0xC]
        ldr     r2, [sp, #0x18]
        add     r2, r2, #0x10
        str     r2, [sp, #0x18]
        ldr     r2, [sp, #0x1C]
        add     r2, r2, #0x10
        str     r2, [sp, #0x1C]
        ldr     r2, [sp, #0x54]
        add     r2, r2, #0x10
        str     r2, [sp, #0x54]
        ldr     r2, [sp, #0x20]
        add     r2, r2, #0x10
        str     r2, [sp, #0x20]
        ldr     r2, [sp]
        str     r2, [r3, +r1, lsl #2]
        ldr     r1, [sp, #4]
        add     r1, r1, #1
        str     r1, [sp, #4]
        ldr     r1, [sp, #0x14]
        add     r1, r1, #0x10
        str     r1, [sp, #0x14]
        blt     LDVI5
LDVI6:
        ldr     r2, [sp, #0x48]
        ldr     lr, [sp, #0x38]
        ldr     r11, [sp, #0x34]
        ldr     r9, [sp, #0x24]
        add     r1, r6, r0
        mov     r7, r0, lsl #4
        ldrsh   r3, [r2, +r7]
        mov     r1, r1, lsl #4
        ldrsh   r10, [lr, +r1]
        ldr     r2, [sp, #0x3C]
        ldrsh   r8, [r11, +r1]
        ldrsh   r2, [r2, +r7]
        mla     r10, r3, r10, r12
        str     r8, [sp, #0xC0]
        ldrsh   r8, [r9, +r1]
        ldrsh   r12, [lr, +r7]
        ldrsh   r11, [r11, +r7]
        mla     lr, r3, r8, r4
        ldr     r4, [sp, #0x30]
        ldrsh   r4, [r4, +r1]
        str     r11, [sp, #0xBC]
        ldr     r11, [sp, #0xC0]
        ldrsh   r9, [r9, +r7]
        mla     lr, r4, r2, lr
        mla     r11, r2, r11, r10
        ldr     r10, [sp, #0x2C]
        ldrsh   r10, [r10, +r1]
        str     r9, [sp, #0xC0]
        ldr     r9, [sp, #0x28]
        mla     r8, r8, r12, r11
        mla     r12, r10, r12, lr
        ldrsh   r1, [r9, +r1]
        ldr     r9, [sp]
        mla     r3, r3, r10, r9
        ldr     r9, [sp, #0x30]
        ldrsh   r7, [r9, +r7]
        rsb     r9, r0, #0
        sub     r9, r9, r6
        mla     r3, r1, r2, r3
        add     r2, r9, #0x34
        str     r7, [sp, #0xB8]
        ldr     r7, [sp, #0xBC]
        rsb     r2, r0, r2, lsl #3
        add     r6, r6, #1
        cmp     r6, #8
        mla     r8, r7, r4, r8
        mla     r12, r1, r7, r12
        ldr     r7, [sp, #0xC0]
        str     r11, [r5, +r2, lsl #2]
        ldr     r2, [sp, #0xB8]
        mla     r10, r7, r10, r8
        add     r7, r9, #0x24
        rsb     r7, r0, r7, lsl #3
        str     r8, [r5, +r7, lsl #2]
        add     r7, r9, #0xC
        mla     r10, r2, r1, r10
        add     r2, r9, #0x2C
        add     r1, r9, #0x14
        rsb     r7, r0, r7, lsl #3
        str     r10, [r5, +r7, lsl #2]
        rsb     r2, r0, r2, lsl #3
        str     lr, [r5, +r2, lsl #2]
        add     r9, r9, #0x1C
        rsb     r1, r0, r1, lsl #3
        str     r12, [r5, +r1, lsl #2]
        rsb     r9, r0, r9, lsl #3
        str     r3, [r5, +r9, lsl #2]
        ldr     r0, [sp, #0x44]
        add     r0, r0, #0x10
        str     r0, [sp, #0x44]
        blt     LDVI4
        mov     r0, #0
        add     sp, sp, #0x56, 30
        ldmia   sp!, {r4 - r11, pc}
LDVI7:
        mov     r0, #0
        mov     r12, r0
        mov     r4, r12
        str     r4, [sp]
        b       LDVI6
LDVI8:
        mvn     r0, #7
        add     sp, sp, #0x56, 30
        ldmia   sp!, {r4 - r11, pc}
        .long   NormTable
        .long   NormTable2


