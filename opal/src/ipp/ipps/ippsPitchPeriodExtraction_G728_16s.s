        .text
        .align  4
        .globl  _ippsPitchPeriodExtraction_G728_16s


_ippsPitchPeriodExtraction_G728_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x43, 30
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        beq     LDEE17
        cmp     r4, #0
        beq     LDEE17
        cmp     r2, #0
        beq     LDEE17
        ldr     r12, [pc, #0x7F0]
        mov     lr, #0xFF
        mov     r3, #2, 2
        orr     r6, lr, #0x7F, 24
        mvn     r7, #2, 2
        sub     r3, r3, #2, 18
        mov     lr, #0x50
        str     r7, [sp, #0xDC]
        str     r6, [sp, #0xD8]
        str     r4, [sp, #0x2C]
LDEE0:
        ldrsh   r1, [r12, #-6]
        ldrsh   r10, [r2]
        mov     r11, lr, lsl #1
        ldrsh   r8, [r5, +r11]
        ldrsh   r9, [r12, #-8]
        mul     r0, r1, r10
        ldrsh   r1, [r12, #-4]
        ldrsh   r6, [r2, #2]
        ldrsh   r4, [r12, #-2]
        ldrsh   r7, [r2, #4]
        mla     r0, r9, r8, r0
        strh    r6, [r2, #4]
        strh    r10, [r2, #2]
        ldrsh   r11, [r5, +r11]
        ldrsh   r8, [r2, #8]
        mla     r0, r1, r6, r0
        ldrsh   r1, [r2, #0xA]
        strh    r11, [r2]
        ldrsh   r6, [r12]
        mla     r0, r4, r7, r0
        ldrsh   r7, [r12, #2]
        rsb     r6, r6, #0
        mov     r4, r0, asr #6
        mla     r6, r6, r8, r4
        ldrsh   r4, [r12, #4]
        rsb     r7, r7, #0
        rsb     r4, r4, #0
        mla     r6, r7, r1, r6
        ldrsh   r7, [r2, #0xC]
        mla     r6, r4, r7, r6
        cmn     r6, #0x1F, 4
        ldrgt   r4, [sp, #0xDC]
        bgt     LDEE1
        cmp     r6, #0xF, 4
        movge   r4, r6, lsl #3
        movlt   r4, #2, 2
LDEE1:
        cmp     r3, r4
        strh    r1, [r2, #0xC]
        strh    r8, [r2, #0xA]
        ldrle   r1, [sp, #0xD8]
        ble     LDEE2
        add     r4, r4, #2, 18
        mov     r4, r4, asr #16
        mov     r4, r4, lsl #16
        mov     r1, r4, asr #16
LDEE2:
        add     lr, lr, #1
        strh    r1, [r2, #8]
        mov     r4, lr, asr #2
        cmp     lr, r4, lsl #2
        addeq   r4, r2, r4, lsl #1
        streqh  r1, [r4, #0x54]
        cmp     lr, #0x64
        blt     LDEE0
        ldrsh   r3, [r2, #0x56]
        ldr     r4, [sp, #0x2C]
        mov     lr, #0x23
        str     r3, [sp, #0xC0]
        ldrsh   r3, [r2, #0x58]
        add     r0, r2, #0x7A
        add     r10, r2, #0x7C
        str     r3, [sp, #0xB8]
        ldrsh   r3, [r2, #0x5A]
        add     r8, r2, #0x7E
        add     r1, r2, #0x84
        str     r3, [sp, #0xB0]
        ldrsh   r3, [r2, #0x5C]
        str     r3, [sp, #0xA8]
        ldrsh   r3, [r2, #0x5E]
        str     r3, [sp, #0xA0]
        ldrsh   r3, [r2, #0x60]
        str     r3, [sp, #0x98]
        ldrsh   r3, [r2, #0x62]
        str     r3, [sp, #0x90]
        ldrsh   r3, [r2, #0x64]
        str     r3, [sp, #0x88]
        ldrsh   r3, [r2, #0x66]
        str     r3, [sp, #0x80]
        ldrsh   r3, [r2, #0x68]
        str     r3, [sp, #0x78]
        ldrsh   r3, [r2, #0x6A]
        str     r3, [sp, #0x70]
        ldrsh   r3, [r2, #0x6C]
        str     r3, [sp, #0x68]
        ldrsh   r3, [r2, #0x6E]
        str     r3, [sp, #0x60]
        ldrsh   r3, [r2, #0x70]
        str     r3, [sp, #0x58]
        ldrsh   r3, [r2, #0x72]
        str     r3, [sp, #0x50]
        ldrsh   r3, [r2, #0x74]
        str     r3, [sp, #0x48]
        ldrsh   r3, [r2, #0x76]
        str     r3, [sp, #0x40]
        ldrsh   r3, [r2, #0x78]
        str     r3, [sp, #0x38]
        ldrsh   r3, [r2, #0x84]
        ldrsh   r11, [r2, #0x7A]
        ldrsh   r9, [r2, #0x7C]
        ldrsh   r7, [r2, #0x7E]
        ldrsh   r6, [r2, #0x80]
        ldrsh   r12, [r2, #0x82]
        str     r3, [sp, #0xD8]
        ldrsh   r3, [r2, #0x86]
        str     lr, [sp, #0xC8]
        add     lr, r2, #0x56
        str     lr, [sp, #0xC4]
        add     lr, r2, #0x58
        str     lr, [sp, #0xBC]
        add     lr, r2, #0x5A
        str     lr, [sp, #0xB4]
        add     lr, r2, #0x5C
        str     lr, [sp, #0xAC]
        add     lr, r2, #0x5E
        str     lr, [sp, #0xA4]
        add     lr, r2, #0x60
        str     lr, [sp, #0x9C]
        add     lr, r2, #0x62
        str     lr, [sp, #0x94]
        add     lr, r2, #0x64
        str     lr, [sp, #0x8C]
        add     lr, r2, #0x66
        str     lr, [sp, #0x84]
        add     lr, r2, #0x68
        str     lr, [sp, #0x7C]
        add     lr, r2, #0x6A
        str     lr, [sp, #0x74]
        add     lr, r2, #0x6C
        str     lr, [sp, #0x6C]
        add     lr, r2, #0x6E
        str     lr, [sp, #0x64]
        add     lr, r2, #0x70
        str     lr, [sp, #0x5C]
        add     lr, r2, #0x72
        str     lr, [sp, #0x54]
        add     lr, r2, #0x74
        str     lr, [sp, #0x4C]
        add     lr, r2, #0x76
        str     lr, [sp, #0x44]
        add     lr, r2, #0x78
        str     r3, [sp, #0xDC]
        str     lr, [sp, #0x3C]
        mov     r3, #2, 2
        add     lr, r2, #0x80
        str     r0, [sp, #8]
        ldr     r0, [sp, #0xC8]
        str     r3, [sp, #0xCC]
        str     lr, [sp, #0x34]
        str     r1, [sp, #0xD4]
        mov     r3, #0
        add     lr, r2, #0x82
        add     r1, r2, #0x86
        str     r1, [sp, #0xD0]
        str     r12, [sp, #0xC]
        str     lr, [sp, #0x1C]
        str     r6, [sp]
        str     r7, [sp, #0x10]
        str     r8, [sp, #0x14]
        str     r9, [sp, #0x20]
        str     r10, [sp, #4]
        str     r11, [sp, #0x18]
        str     r3, [sp, #0x24]
        str     r2, [sp, #0x28]
        str     r4, [sp, #0x2C]
        str     r5, [sp, #0x30]
LDEE3:
        ldr     r3, [sp, #0xB4]
        ldr     r11, [sp, #0x98]
        ldr     r9, [sp, #0xA0]
        rsb     r1, r0, #0
        ldr     r2, [sp, #0xBC]
        ldr     r4, [sp, #0x94]
        mov     r5, r1, lsl #1
        ldr     r1, [sp, #0xC4]
        ldrsh   r2, [r2, +r5]
        ldrsh   r12, [r3, +r5]
        ldr     r3, [sp, #0xC0]
        ldrsh   r1, [r1, +r5]
        ldr     r8, [sp, #0x7C]
        ldrsh   r6, [r4, +r5]
        ldr     r4, [sp, #0xB8]
        mul     r3, r3, r1
        ldr     r1, [sp, #0xAC]
        ldrsh   r8, [r8, +r5]
        ldrsh   lr, [r1, +r5]
        ldr     r1, [sp, #0xA4]
        mla     r4, r4, r2, r3
        ldr     r3, [sp, #0x84]
        ldr     r2, [sp, #0x8C]
        ldrsh   r7, [r1, +r5]
        ldr     r1, [sp, #0x9C]
        ldrsh   r3, [r3, +r5]
        ldrsh   r2, [r2, +r5]
        ldrsh   r1, [r1, +r5]
        str     r8, [sp, #0xE0]
        ldr     r8, [sp, #0x74]
        ldrsh   r8, [r8, +r5]
        str     r8, [sp, #0xE4]
        ldr     r8, [sp, #0xB0]
        mla     r4, r8, r12, r4
        ldr     r12, [sp, #0x6C]
        ldr     r8, [sp, #0x64]
        ldrsh   r12, [r12, +r5]
        ldrsh   r8, [r8, +r5]
        str     r8, [sp, #0xE8]
        ldr     r8, [sp, #0x5C]
        ldrsh   r8, [r8, +r5]
        str     r8, [sp, #0xEC]
        ldr     r8, [sp, #0x54]
        ldrsh   r8, [r8, +r5]
        str     r8, [sp, #0xF0]
        ldr     r8, [sp, #0xA8]
        mla     r8, r8, lr, r4
        ldr     lr, [sp, #0x4C]
        ldr     r4, [sp, #0x44]
        ldrsh   lr, [lr, +r5]
        mla     r10, r9, r7, r8
        ldr     r9, [sp, #0x34]
        ldrsh   r4, [r4, +r5]
        ldr     r7, [sp, #4]
        ldr     r8, [sp, #0x14]
        mla     r10, r11, r1, r10
        str     r4, [sp, #0xF4]
        ldr     r4, [sp, #0x3C]
        ldr     r1, [sp, #0xD4]
        ldr     r11, [sp, #0xD0]
        ldrsh   r4, [r4, +r5]
        str     r4, [sp, #0xF8]
        ldr     r4, [sp, #8]
        ldrsh   r9, [r9, +r5]
        ldrsh   r7, [r7, +r5]
        ldrsh   r4, [r4, +r5]
        ldrsh   r8, [r8, +r5]
        str     r9, [sp, #0xFC]
        ldr     r9, [sp, #0x1C]
        ldrsh   r1, [r1, +r5]
        ldrsh   r9, [r9, +r5]
        ldrsh   r5, [r11, +r5]
        ldr     r11, [sp, #0x90]
        mla     r10, r11, r6, r10
        ldr     r6, [sp, #0x88]
        mla     r10, r6, r2, r10
        ldr     r2, [sp, #0x80]
        ldr     r6, [sp, #0x78]
        mla     r3, r2, r3, r10
        ldr     r2, [sp, #0xE0]
        mla     r2, r6, r2, r3
        ldr     r3, [sp, #0xE4]
        ldr     r6, [sp, #0x70]
        mla     r2, r6, r3, r2
        ldr     r3, [sp, #0x68]
        mla     r12, r3, r12, r2
        ldr     r2, [sp, #0xE8]
        ldr     r3, [sp, #0x60]
        mla     r2, r3, r2, r12
        ldr     r3, [sp, #0xEC]
        ldr     r12, [sp, #0x58]
        mla     r2, r12, r3, r2
        ldr     r3, [sp, #0xF0]
        ldr     r12, [sp, #0x50]
        mla     r2, r12, r3, r2
        ldr     r3, [sp, #0x48]
        ldr     r12, [sp, #0x38]
        mla     lr, r3, lr, r2
        ldr     r2, [sp, #0xF4]
        ldr     r3, [sp, #0x40]
        mla     r2, r3, r2, lr
        ldr     r3, [sp, #0xF8]
        mla     r2, r12, r3, r2
        ldr     r3, [sp, #0x18]
        mla     r2, r3, r4, r2
        ldr     r3, [sp, #0x20]
        mla     r2, r3, r7, r2
        ldr     r3, [sp, #0x10]
        mla     r8, r3, r8, r2
        ldr     r2, [sp, #0xFC]
        ldr     r3, [sp]
        mla     r8, r3, r2, r8
        ldr     r2, [sp, #0xC]
        mla     r8, r2, r9, r8
        ldr     r2, [sp, #0xD8]
        mla     r8, r2, r1, r8
        ldr     r1, [sp, #0xDC]
        mla     r12, r1, r5, r8
        ldr     r1, [sp, #0xCC]
        cmp     r12, r1
        strge   r12, [sp, #0xCC]
        strge   r0, [sp, #0x24]
        sub     r0, r0, #1
        cmp     r0, #5
        bge     LDEE3
        ldr     r2, [sp, #0x28]
        ldr     r3, [sp, #0x24]
        ldr     r4, [sp, #0x2C]
        ldr     r5, [sp, #0x30]
        add     lr, r2, #0x1A
        mvn     r6, #0x22
        add     r2, r2, #0x10
LDEE4:
        ldrsh   r7, [lr]
        add     r6, r6, #5
        cmp     r6, #0x14
        strh    r7, [r2]
        ldrsh   r7, [lr, #2]
        strh    r7, [r2, #2]
        ldrsh   r7, [lr, #4]
        strh    r7, [r2, #4]
        ldrsh   r7, [lr, #6]
        strh    r7, [r2, #6]
        ldrsh   r7, [lr, #8]
        add     lr, lr, #0xA
        strh    r7, [r2, #8]
        add     r2, r2, #0xA
        blt     LDEE4
        mov     r3, r3, lsl #2
        sub     lr, r3, #3
        cmp     lr, #0x14
        mov     r2, #0x14
        movlt   lr, r2
        add     r2, r3, #3
        cmp     r2, #0x8C
        mov     r3, #0x8C
        movgt   r2, r3
        cmp     r2, lr
        mov     r9, #2, 2
        movlt   r8, #0
        blt     LDEE7
        mov     r8, #0
LDEE5:
        rsb     r3, r2, #0
        mov     r12, #0
        mov     r7, r12
        add     r3, r5, r3, lsl #1
        mov     r6, r5
LDEE6:
        ldrsh   r10, [r6]
        ldrsh   r11, [r3]
        add     r7, r7, #4
        cmp     r7, #0x64
        mla     r12, r10, r11, r12
        ldrsh   r11, [r3, #2]
        ldrsh   r10, [r6, #2]
        mla     r12, r10, r11, r12
        ldrsh   r11, [r3, #4]
        ldrsh   r10, [r6, #4]
        mla     r12, r10, r11, r12
        ldrsh   r11, [r3, #6]
        ldrsh   r10, [r6, #6]
        add     r3, r3, #8
        add     r6, r6, #8
        mla     r12, r10, r11, r12
        blt     LDEE6
        cmp     r12, r9
        movge   r9, r12
        movge   r8, r2
        sub     r2, r2, #1
        cmp     r2, lr
        bge     LDEE5
LDEE7:
        ldr     r2, [r4]
        add     r3, r2, #7
        cmp     r8, r3
        sub     r3, r2, #6
        add     r2, r2, #6
        blt     LDEE15
        cmp     r3, #0x14
        mov     lr, #0x14
        movlt   r3, lr
        cmp     r2, #0x8C
        mov     lr, #0x8C
        movgt   r2, lr
        cmp     r2, r3
        mov     r6, #2, 2
        blt     LDEE16
        mov     r7, #0
        str     r8, [sp, #0xDC]
        str     r9, [sp, #0xD8]
        str     r4, [sp, #0x2C]
LDEE8:
        rsb     r1, r2, #0
        mov     r12, #0
        mov     r4, r12
        add     r1, r5, r1, lsl #1
        mov     lr, r5
        str     r5, [sp, #0x30]
LDEE9:
        ldrsh   r10, [lr]
        ldrsh   r9, [r1]
        ldrsh   r5, [r1, #2]
        ldrsh   r8, [lr, #2]
        ldrsh   r0, [r1, #4]
        mla     r11, r10, r9, r12
        ldrsh   r10, [lr, #4]
        ldrsh   r12, [r1, #6]
        ldrsh   r9, [lr, #6]
        add     r4, r4, #4
        mla     r11, r8, r5, r11
        cmp     r4, #0x64
        add     lr, lr, #8
        add     r1, r1, #8
        mla     r11, r10, r0, r11
        mla     r12, r9, r12, r11
        blt     LDEE9
        ldr     r5, [sp, #0x30]
        cmp     r12, r6
        movge   r6, r12
        movge   r7, r2
        sub     r2, r2, #1
        cmp     r2, r3
        bge     LDEE8
        ldr     r8, [sp, #0xDC]
        ldr     r9, [sp, #0xD8]
        ldr     r4, [sp, #0x2C]
        str     r6, [sp, #0x104]
        str     r12, [sp, #0x108]
LDEE10:
        add     r3, sp, #0x42, 30
        sub     r0, r5, r8, lsl #1
        mov     r2, #0
        mov     r1, #0x64
        bl      _ippsSumSquare_NS_16s32s_Sfs
        add     r3, sp, #0x41, 30
        sub     r0, r5, r7, lsl #1
        mov     r2, #0
        mov     r1, #0x64
        bl      _ippsSumSquare_NS_16s32s_Sfs
        ldr     r2, [sp, #0x108]
        mov     r3, #0
        cmp     r2, #0
        moveq   r9, #0
        ldr     r0, [sp, #0x104]
        cmp     r0, #0
        moveq   r6, #0
        cmp     r2, r9
        movlt   r9, r2
        cmp     r0, r6
        movlt   r6, r0
        cmp     r9, #0
        movlt   r9, r3
        cmp     r6, #0
        movlt   r6, r3
        cmp     r2, r0
        add     r2, sp, #1, 24
        ble     LDEE11
        add     r1, sp, #0x42, 30
        add     r0, sp, #0x42, 30
        bl      ownVscaleOne_Range30_32s
        add     r3, sp, #1, 24
        ldr     r0, [sp, #0x104]
        ldrsh   r3, [r3]
        ldr     r2, [sp, #0x108]
        mov     r0, r0, lsl r3
        b       LDEE12
LDEE11:
        add     r1, sp, #0x41, 30
        add     r0, sp, #0x41, 30
        bl      ownVscaleOne_Range30_32s
        add     r3, sp, #1, 24
        ldr     r2, [sp, #0x108]
        ldrsh   r3, [r3]
        ldr     r0, [sp, #0x104]
        mov     r2, r2, lsl r3
LDEE12:
        bic     r12, r3, #0xFF, 8
        mov     r3, r0, asr #16
        bic     r0, r12, #0xFF, 16
        mov     r2, r2, asr #16
        mov     r12, r3, lsl #16
        mov     r2, r2, lsl #16
        mvn     r3, #2, 2
        cmp     r9, r3, asr r0
        mov     r2, r2, asr #16
        mov     r12, r12, asr #16
        mov     lr, #2, 2
        movgt   r9, r3
        bgt     LDEE13
        cmp     r9, lr, asr r0
        movge   r9, r9, lsl r0
        movlt   r9, #2, 2
LDEE13:
        mov     r5, r9, asr #16
        cmp     r6, r3, asr r0
        mov     r5, r5, lsl #16
        mov     r5, r5, asr #16
        bgt     LDEE14
        cmp     r6, lr, asr r0
        movge   r3, r6, lsl r0
        movlt   r3, #2, 2
LDEE14:
        mul     r5, r12, r5
        mov     r3, r3, asr #16
        mov     r0, #0x66
        mov     r12, r3, lsl #16
        mov     r3, r5, asr #16
        orr     r0, r0, #0x66, 24
        mov     r12, r12, asr #16
        mul     r2, r2, r12
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
        mul     r0, r3, r0
        cmp     r2, r0
        movgt   r8, r7
LDEE15:
        mov     r0, #0
        str     r8, [r4]
        add     sp, sp, #0x43, 30
        ldmia   sp!, {r4 - r11, pc}
LDEE16:
        mov     r7, #0
        str     r6, [sp, #0x104]
        str     r12, [sp, #0x108]
        b       LDEE10
LDEE17:
        mvn     r0, #7
        add     sp, sp, #0x43, 30
        ldmia   sp!, {r4 - r11, pc}
        .long   LDEE_al


        .data
        .align  4


LDEE_bl:
        .byte   0x21,0x49,0xAC,0xF1,0xAC,0xF1,0x21,0x49
LDEE_al:
        .byte   0x1C,0xB5,0x61,0x40,0x59,0xEC


