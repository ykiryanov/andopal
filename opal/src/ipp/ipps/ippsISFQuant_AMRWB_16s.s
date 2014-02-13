        .text
        .align  4
        .globl  _ippsISFQuant_AMRWB_16s


_ippsISFQuant_AMRWB_16s:
        stmdb   sp!, {r4, lr}
        sub     sp, sp, #8
        ldr     r12, [sp, #0x10]
        cmp     r0, #0
        mov     r4, r2
        beq     LDIP2
        cmp     r1, #0
        beq     LDIP2
        cmp     r4, #0
        beq     LDIP2
        cmp     r3, #0
        beq     LDIP2
        cmp     r12, #5
        mov     lr, #4
        beq     LDIP0
        cmp     r12, #9
        beq     LDIP1
        cmp     r12, #0xD
        beq     LDIP1
        cmp     r12, #0xF
        beq     LDIP1
        cmp     r12, #0x10
        beq     LDIP1
        cmp     r12, #0x12
        beq     LDIP1
        cmp     r12, #0x13
        beq     LDIP1
        cmp     r12, #0x14
        beq     LDIP1
        cmp     r12, #0x15
        beq     LDIP1
        cmp     r12, #0x19
        beq     LDIP0
        mvn     r0, #6
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}
LDIP0:
        mov     r2, r1
        str     lr, [sp]
        mov     r1, r4
        bl      LDIP_ownQuantPredISF_36b
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}
LDIP1:
        mov     r2, r1
        str     lr, [sp]
        mov     r1, r4
        bl      LDIP_ownQuantPredISF_46b
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}
LDIP2:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}
        .long   meanISFTbl
        .long   QCdbk1ISFTbl
        .long   QCdbk21ISFTbl
        .long   QCdbk22ISFTbl
        .long   QCdbk23ISFTbl
        .long   QCdbk2ISFTbl
        .long   QCdbk24ISFTbl
        .long   QCdbk25ISFTbl
LDIP_ownQuantPredISF_46b:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x52, 30
        ldr     r8, [pc, #-0x30]
        ldr     r9, [sp, #0x16C]
        mov     r7, r2
        ldrsh   r12, [r7, #2]
        mov     r5, r1
        mov     r6, r3
        str     r12, [sp, #0x58]
        ldrsh   r12, [r7, #4]
        ldr     r3, [sp, #0x58]
        cmp     r9, #0
        str     r12, [sp, #0x54]
        ldrsh   r12, [r7, #6]
        str     r12, [sp, #0x50]
        ldrsh   r10, [r7, #0xC]
        ldrsh   r11, [r7, #0xE]
        ldrsh   r1, [r7, #0x10]
        ldrsh   r2, [r7]
        ldrsh   r4, [r7, #0xA]
        ldrsh   r12, [r8]
        ldrsh   lr, [r7, #8]
        str     r12, [sp, #0x4C]
        ldrsh   r12, [r0]
        str     r12, [sp, #0x48]
        ldrsh   r12, [r7, #0x12]
        str     r12, [sp, #0x44]
        ldrsh   r12, [r7, #0x14]
        str     r12, [sp, #0x40]
        ldrsh   r12, [r7, #0x16]
        str     r12, [sp, #0x3C]
        ldrsh   r12, [r7, #0x18]
        str     r12, [sp, #0x38]
        ldrsh   r12, [r7, #0x1A]
        str     r12, [sp, #0x34]
        ldrsh   r12, [r7, #0x1C]
        str     r12, [sp, #0x30]
        ldrsh   r12, [r7, #0x1E]
        str     r12, [sp, #0x2C]
        mov     r12, #0xAB
        orr     r12, r12, #0x2A, 24
        mul     r3, r3, r12
        mul     lr, lr, r12
        mul     r4, r4, r12
        mul     r10, r10, r12
        mul     r11, r11, r12
        mul     r1, r1, r12
        str     r3, [sp, #0x58]
        ldr     r3, [sp, #0x54]
        str     lr, [sp, #0x28]
        mul     lr, r2, r12
        str     r11, [sp, #0x1C]
        str     r10, [sp, #0x20]
        mul     r3, r3, r12
        str     r4, [sp, #0x24]
        str     r1, [sp, #0x18]
        str     r3, [sp, #0x54]
        ldr     r3, [sp, #0x50]
        mul     r3, r3, r12
        str     r3, [sp, #0x50]
        ldrsh   r4, [r8, #2]
        str     r4, [sp, #0x5C]
        ldrsh   r1, [r8, #6]
        ldrsh   r4, [r0, #2]
        ldrsh   r10, [r8, #4]
        ldrsh   r11, [r0, #4]
        str     r1, [sp, #0x60]
        ldrsh   r1, [r0, #6]
        ldrsh   r2, [r8, #8]
        sub     r10, r11, r10
        str     r2, [sp, #0x64]
        ldrsh   r2, [r0, #8]
        ldrsh   r3, [r8, #0xA]
        str     r3, [sp, #0x68]
        ldrsh   r3, [r0, #0xA]
        str     r3, [sp, #0x6C]
        ldrsh   r3, [r8, #0xC]
        str     r3, [sp, #0x70]
        ldrsh   r3, [r0, #0xC]
        str     r3, [sp, #0x74]
        ldrsh   r3, [r8, #0xE]
        str     r3, [sp, #0x78]
        ldrsh   r3, [r0, #0xE]
        str     r3, [sp, #0x7C]
        ldrsh   r3, [r8, #0x10]
        str     r3, [sp, #0x80]
        ldrsh   r3, [r0, #0x10]
        str     r3, [sp, #0x84]
        ldr     r3, [sp, #0x44]
        mul     r3, r3, r12
        str     r3, [sp, #0x88]
        ldr     r3, [sp, #0x40]
        mul     r3, r3, r12
        str     r3, [sp, #0x8C]
        ldr     r3, [sp, #0x3C]
        mul     r3, r3, r12
        str     r3, [sp, #0x90]
        ldr     r3, [sp, #0x38]
        mul     r3, r3, r12
        str     r3, [sp, #0x94]
        ldr     r3, [sp, #0x34]
        mul     r3, r3, r12
        str     r3, [sp, #0x98]
        ldr     r3, [sp, #0x30]
        mul     r3, r3, r12
        str     r3, [sp, #0x30]
        ldr     r3, [sp, #0x2C]
        mul     r12, r3, r12
        ldr     r3, [sp, #0x48]
        str     r12, [sp, #0x2C]
        ldrsh   r12, [r8, #0x12]
        str     r12, [sp, #0x44]
        ldrsh   r12, [r0, #0x12]
        str     r12, [sp, #0x40]
        ldrsh   r12, [r8, #0x14]
        str     r12, [sp, #0x3C]
        ldrsh   r12, [r0, #0x14]
        str     r12, [sp, #0x38]
        ldrsh   r12, [r8, #0x16]
        str     r12, [sp, #0x34]
        ldrsh   r12, [r0, #0x16]
        str     r12, [sp, #0x9C]
        ldrsh   r12, [r8, #0x18]
        str     r12, [sp, #0xA0]
        ldrsh   r12, [r0, #0x18]
        str     r12, [sp, #0xA4]
        ldrsh   r12, [r8, #0x1A]
        str     r12, [sp, #0xA8]
        ldrsh   r12, [r0, #0x1A]
        str     r12, [sp, #0xAC]
        ldrsh   r12, [r8, #0x1C]
        str     r12, [sp, #0xB0]
        ldrsh   r12, [r0, #0x1C]
        str     r12, [sp, #0xB4]
        ldrsh   r12, [r8, #0x1E]
        str     r12, [sp, #0xB8]
        ldrsh   r0, [r0, #0x1E]
        add     r12, sp, #0xF0
        and     r12, r12, #0xF
        str     r0, [sp, #0xBC]
        ldr     r0, [sp, #0x4C]
        rsb     r12, r12, #0
        and     r12, r12, #0xF
        str     r12, [sp, #0x10]
        sub     r0, r3, r0
        add     r3, sp, #0xF0
        add     r3, r3, r12
        str     r3, [sp, #0x14]
        ldr     r3, [sp, #0x5C]
        sub     r0, r0, lr, asr #15
        add     lr, sp, #0xF0
        sub     r4, r4, r3
        str     r4, [sp, #0x5C]
        strh    r0, [r12, +lr]
        ldr     r12, [sp, #0x60]
        ldr     r3, [sp, #0x5C]
        ldr     r4, [sp, #0x6C]
        sub     lr, r1, r12
        ldr     r12, [sp, #0x64]
        ldr     r1, [sp, #0x84]
        sub     r2, r2, r12
        ldr     r12, [sp, #0x68]
        sub     r11, r4, r12
        ldr     r12, [sp, #0x70]
        ldr     r4, [sp, #0x74]
        sub     r0, r4, r12
        ldr     r12, [sp, #0x78]
        ldr     r4, [sp, #0x7C]
        sub     r4, r4, r12
        ldr     r12, [sp, #0x80]
        sub     r1, r1, r12
        add     r12, sp, #0xC0
        and     r12, r12, #0xF
        str     r12, [sp, #0x84]
        ldr     r12, [sp, #0x58]
        sub     r3, r3, r12, asr #15
        ldr     r12, [sp, #0x54]
        str     r3, [sp, #0x80]
        ldr     r3, [sp, #0x38]
        sub     r12, r10, r12, asr #15
        ldr     r10, [sp, #0x50]
        mov     r12, r12, lsl #16
        str     r12, [sp, #0x7C]
        ldr     r12, [sp, #0x44]
        sub     lr, lr, r10, asr #15
        ldr     r10, [sp, #0x28]
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        str     lr, [sp, #0x48]
        sub     r10, r2, r10, asr #15
        ldr     r2, [sp, #0x24]
        mov     r10, r10, lsl #16
        sub     r11, r11, r2, asr #15
        ldr     r2, [sp, #0x20]
        mov     r10, r10, asr #16
        str     r10, [sp, #0x44]
        mov     r11, r11, lsl #16
        sub     r0, r0, r2, asr #15
        ldr     r2, [sp, #0x1C]
        mov     r0, r0, lsl #16
        mov     r11, r11, asr #16
        sub     r4, r4, r2, asr #15
        ldr     r2, [sp, #0x18]
        mov     r10, r0, asr #16
        mov     r4, r4, lsl #16
        sub     r1, r1, r2, asr #15
        ldr     r2, [sp, #0x84]
        mov     lr, r4, asr #16
        ldr     r4, [sp, #0x88]
        mov     r1, r1, lsl #16
        rsb     r2, r2, #0
        str     r2, [sp, #0x84]
        ldr     r2, [sp, #0x80]
        str     lr, [sp, #0x38]
        mov     r2, r2, lsl #16
        str     r2, [sp, #0x80]
        ldr     r2, [sp, #0x40]
        str     r11, [sp, #0x40]
        mov     r11, r1, asr #16
        sub     r12, r2, r12
        ldr     r2, [sp, #0x3C]
        str     r10, [sp, #0x3C]
        sub     r12, r12, r4, asr #15
        sub     r3, r3, r2
        ldr     r2, [sp, #0x34]
        str     r3, [sp, #0x78]
        ldr     r3, [sp, #0x9C]
        ldr     r4, [sp, #0x78]
        str     r11, [sp, #0x34]
        sub     r3, r3, r2
        str     r3, [sp, #0x9C]
        ldr     r3, [sp, #0xA4]
        ldr     r2, [sp, #0xA0]
        sub     r3, r3, r2
        str     r3, [sp, #0xA4]
        ldr     r2, [sp, #0xA8]
        ldr     r3, [sp, #0xAC]
        sub     r3, r3, r2
        str     r3, [sp, #0xAC]
        ldr     r2, [sp, #0xB0]
        ldr     r3, [sp, #0xB4]
        sub     r3, r3, r2
        ldr     r2, [sp, #0xB8]
        str     r12, [sp, #0xB8]
        ldr     r12, [sp, #0x8C]
        str     r3, [sp, #0xB4]
        ldr     r3, [sp, #0xBC]
        sub     r4, r4, r12, asr #15
        str     r4, [sp, #0xB0]
        ldr     r4, [sp, #0x9C]
        ldr     r12, [sp, #0x90]
        ldr     r0, [sp, #0xB4]
        sub     r3, r3, r2
        ldr     r2, [sp, #0x84]
        sub     r4, r4, r12, asr #15
        str     r4, [sp, #0xA8]
        ldr     r12, [sp, #0x94]
        ldr     r4, [sp, #0xA4]
        str     r3, [sp, #0xBC]
        and     r2, r2, #0xF
        str     r2, [sp, #0x18]
        ldr     r2, [sp, #0x80]
        sub     r1, r4, r12, asr #15
        ldr     r12, [sp, #0x98]
        ldr     r4, [sp, #0xAC]
        mov     r2, r2, asr #16
        str     r2, [sp, #0x50]
        ldr     r2, [sp, #0x7C]
        sub     r12, r4, r12, asr #15
        ldr     r4, [sp, #0x30]
        ldr     r3, [sp, #0x50]
        mov     r2, r2, asr #16
        str     r2, [sp, #0x4C]
        sub     r0, r0, r4, asr #15
        str     r0, [sp, #0xB4]
        ldr     r0, [sp, #0xBC]
        ldr     r4, [sp, #0x2C]
        ldr     r2, [sp, #0x18]
        sub     r0, r0, r4, asr #15
        add     r4, sp, #0xC0
        add     r4, r4, r2
        ldr     r2, [sp, #0x14]
        strh    r3, [r2, #2]
        ldr     r3, [sp, #0x4C]
        strh    r3, [r2, #4]
        ldr     r3, [sp, #0x48]
        strh    r3, [r2, #6]
        ldr     r3, [sp, #0x44]
        strh    r3, [r2, #8]
        ldr     r3, [sp, #0x40]
        strh    r10, [r2, #0xC]
        strh    lr, [r2, #0xE]
        strh    r3, [r2, #0xA]
        strh    r11, [r2, #0x10]
        ldr     r10, [sp, #0xB8]
        ldr     lr, [sp, #0x14]
        add     r2, r2, #0x12
        str     r2, [sp, #0x58]
        strh    r10, [lr, #0x12]
        ldr     r10, [sp, #0xB0]
        strh    r10, [lr, #0x14]
        ldr     r10, [sp, #0xA8]
        strh    r12, [lr, #0x1A]
        strh    r1, [lr, #0x18]
        strh    r10, [lr, #0x16]
        ldr     r12, [sp, #0xB4]
        strh    r0, [lr, #0x1E]
        strh    r12, [lr, #0x1C]
        ble     LDIP6
        cmp     r9, #6
        movlt   r0, #0
        blt     LDIP4
        mov     r11, #0
        mov     r0, r11
        sub     r10, r9, #6
        mvn     lr, #2, 2
        mov     r12, r0
        str     r9, [sp, #0xC]
        str     r6, [sp, #8]
        str     r7, [sp, #4]
        str     r5, [sp]
LDIP3:
        add     r7, sp, #5, 26
        add     r3, sp, #0x13, 28
        add     r6, r7, r11
        strh    r0, [r7, +r11]
        add     r5, r0, #1
        add     r1, r3, r12
        add     r7, r0, #2
        add     r9, r0, #3
        add     r2, r0, #4
        str     lr, [r3, +r0, lsl #2]
        add     r0, r0, #5
        cmp     r0, r10
        str     lr, [r1, #4]
        strh    r5, [r6, #2]
        str     lr, [r1, #8]
        strh    r7, [r6, #4]
        str     lr, [r1, #0xC]
        strh    r9, [r6, #6]
        str     lr, [r1, #0x10]
        strh    r2, [r6, #8]
        add     r12, r12, #0x14
        add     r11, r11, #0xA
        ble     LDIP3
        ldr     r9, [sp, #0xC]
        ldr     r6, [sp, #8]
        ldr     r7, [sp, #4]
        ldr     r5, [sp]
LDIP4:
        mvn     lr, #2, 2
        mov     r12, r0, lsl #1
LDIP5:
        add     r10, sp, #5, 26
        add     r11, sp, #0x13, 28
        strh    r0, [r10, +r12]
        str     lr, [r11, +r0, lsl #2]
        add     r0, r0, #1
        cmp     r0, r9
        add     r12, r12, #2
        blt     LDIP5
LDIP6:
        ldr     r12, [sp, #0x10]
        ldr     r10, [pc, #-0x5C0]
        add     lr, sp, #0xF0
        ldrsh   r11, [r12, +lr]
        ldr     r0, [sp, #0x3C]
        sub     r12, r9, #1
        mov     lr, #0
        str     r12, [sp, #0x24]
        str     r11, [sp, #0x28]
        str     r4, [sp, #0x54]
        str     r6, [sp, #8]
        str     r7, [sp, #4]
        str     r5, [sp]
LDIP7:
        ldr     r1, [sp, #0x28]
        ldrsh   r2, [r10]
        ldrsh   r4, [r10, #2]
        ldrsh   r8, [r10, #4]
        ldrsh   r5, [r10, #6]
        sub     r1, r1, r2
        ldr     r6, [sp, #0x50]
        ldrsh   r2, [r10, #8]
        mov     r1, r1, lsl #16
        ldrsh   r3, [r10, #0xA]
        ldrsh   r12, [r10, #0xC]
        mov     r1, r1, asr #16
        mul     r1, r1, r1
        sub     r4, r6, r4
        ldrsh   r6, [r10, #0xE]
        mov     r7, r4, lsl #16
        ldrsh   r4, [r10, #0x10]
        ldr     r11, [sp, #0x4C]
        mov     r7, r7, asr #16
        mla     r1, r7, r7, r1
        ldr     r7, [sp, #0x48]
        sub     r8, r11, r8
        sub     r12, r0, r12
        sub     r5, r7, r5
        ldr     r7, [sp, #0x44]
        mov     r8, r8, lsl #16
        mov     r5, r5, lsl #16
        mov     r8, r8, asr #16
        mla     r1, r8, r8, r1
        sub     r2, r7, r2
        ldr     r7, [sp, #0x40]
        mov     r5, r5, asr #16
        mov     r2, r2, lsl #16
        mla     r5, r5, r5, r1
        sub     r3, r7, r3
        mov     r2, r2, asr #16
        mov     r3, r3, lsl #16
        mov     r12, r12, lsl #16
        add     r10, r10, #0x18
        mov     r1, r3, asr #16
        mla     r3, r2, r2, r5
        ldr     r2, [sp, #0x38]
        cmp     r9, #0
        sub     r6, r2, r6
        mov     r2, r12, asr #16
        mla     r3, r1, r1, r3
        ldr     r1, [sp, #0x34]
        mov     r12, r6, lsl #16
        sub     r4, r1, r4
        mla     r3, r2, r2, r3
        mov     r12, r12, asr #16
        mov     r1, r4, lsl #16
        mov     r1, r1, asr #16
        mla     r3, r12, r12, r3
        mla     r12, r1, r1, r3
        ble     LDIP9
        mov     r4, #0
LDIP8:
        add     r1, sp, #0x13, 28
        ldr     r1, [r1, +r4, lsl #2]
        cmp     r12, r1
        blt     LDIP34
        add     r4, r4, #1
        cmp     r4, r9
        blt     LDIP8
LDIP9:
        add     lr, lr, #1
        cmp     lr, #1, 24
        blt     LDIP7
        ldr     r12, [sp, #0x24]
        ldr     r8, [pc, #-0x704]
        ldr     r4, [sp, #0x54]
        ldr     r6, [sp, #8]
        ldr     r7, [sp, #4]
        ldr     r5, [sp]
        cmp     r9, #0
        ble     LDIP15
        ldr     r11, [pc, #-0x71C]
        ldr     lr, [pc, #-0x71C]
        mvn     r2, #2, 2
        add     r1, r4, #6
        add     r0, r4, #0xC
        mov     r3, r9
        mov     r10, #0
        str     r3, [sp, #0x40]
        str     r0, [sp, #0x48]
        str     r1, [sp, #0x4C]
        str     r2, [sp, #0x44]
        str     r12, [sp, #0x24]
        str     r9, [sp, #0xC]
        str     r6, [sp, #8]
        str     r7, [sp, #4]
        str     r5, [sp]
LDIP10:
        add     r0, sp, #5, 26
        ldrsh   r0, [r0, +r10]
        ldr     r12, [pc, #-0x764]
        ldr     r1, [sp, #0x14]
        rsb     r0, r0, r0, lsl #2
        mov     r5, #0
        str     r5, [sp, #0x50]
        add     r0, r12, r0, lsl #3
        mov     r3, #9
        mov     r2, r4
        bl      _ippsSub_16s
        ldr     r0, [sp, #0x18]
        ldr     lr, [pc, #-0x788]
        add     r3, sp, #0xC0
        ldrsh   r0, [r0, +r3]
        ldrsh   r12, [r4, #2]
        ldrsh   r3, [r4, #4]
        ldr     r7, [sp, #0x50]
        mvn     r6, #2, 2
LDIP11:
        ldrsh   r9, [lr]
        ldrsh   r11, [lr, #2]
        ldrsh   r8, [lr, #4]
        sub     r9, r0, r9
        add     lr, lr, #8
        sub     r11, r12, r11
        mov     r9, r9, lsl #16
        sub     r8, r3, r8
        mov     r11, r11, lsl #16
        mov     r9, r9, asr #16
        mul     r9, r9, r9
        mov     r11, r11, asr #16
        mov     r8, r8, lsl #16
        mla     r9, r11, r11, r9
        mov     r8, r8, asr #16
        mla     r9, r8, r8, r9
        cmp     r9, r6
        movlt   r6, r9
        movlt   r5, r7
        add     r7, r7, #1
        cmp     r7, #0x40
        blt     LDIP11
        ldr     r0, [pc, #-0x7FC]
        mov     r2, #3
        mov     r1, r4
        add     r0, r0, r5, lsl #3
        bl      _ippsCopy_16s
        ldr     r9, [pc, #-0x80C]
        ldrsh   r12, [r4, #6]
        ldrsh   r3, [r4, #8]
        ldrsh   r0, [r4, #0xA]
        mov     lr, #0
        mov     r7, r6, lsl #1
        mov     r6, lr
        mvn     r8, #2, 2
LDIP12:
        ldrsh   r11, [r9]
        ldrsh   r2, [r9, #2]
        ldrsh   r1, [r9, #4]
        sub     r11, r12, r11
        add     r9, r9, #8
        sub     r2, r3, r2
        mov     r11, r11, lsl #16
        sub     r1, r0, r1
        mov     r2, r2, lsl #16
        mov     r11, r11, asr #16
        mul     r11, r11, r11
        mov     r2, r2, asr #16
        mov     r1, r1, lsl #16
        mla     r11, r2, r2, r11
        mov     r1, r1, asr #16
        mla     r11, r1, r1, r11
        cmp     r11, r8
        movlt   r8, r11
        movlt   r6, lr
        add     lr, lr, #1
        cmp     lr, #0x80
        blt     LDIP12
        ldr     r0, [pc, #-0x884]
        ldr     r1, [sp, #0x4C]
        mov     r2, #3
        add     r0, r0, r6, lsl #3
        bl      _ippsCopy_16s
        ldrsh   r12, [r4, #0xC]
        ldrsh   r3, [r4, #0xE]
        ldrsh   r0, [r4, #0x10]
        ldr     r11, [pc, #-0x8A0]
        mov     lr, #0
        add     r7, r7, r8, lsl #1
        mov     r8, lr
        mvn     r9, #2, 2
        str     r4, [sp, #0x54]
LDIP13:
        ldrsh   r1, [r11]
        ldrsh   r4, [r11, #2]
        ldrsh   r2, [r11, #4]
        sub     r1, r12, r1
        add     r11, r11, #8
        sub     r4, r3, r4
        mov     r1, r1, lsl #16
        sub     r2, r0, r2
        mov     r4, r4, lsl #16
        mov     r1, r1, asr #16
        mul     r1, r1, r1
        mov     r4, r4, asr #16
        mov     r2, r2, lsl #16
        mla     r1, r4, r4, r1
        mov     r2, r2, asr #16
        mla     r1, r2, r2, r1
        cmp     r1, r9
        movlt   r9, r1
        movlt   r8, lr
        add     lr, lr, #1
        cmp     lr, #0x80
        blt     LDIP13
        ldr     r0, [pc, #-0x910]
        ldr     r1, [sp, #0x48]
        ldr     r4, [sp, #0x54]
        add     r0, r0, r8, lsl #3
        mov     r2, #3
        bl      _ippsCopy_16s
        ldr     r0, [sp, #0x44]
        add     r9, r7, r9, lsl #1
        cmp     r9, r0
        bge     LDIP14
        ldr     r3, [sp, #8]
        str     r9, [sp, #0x44]
        add     r0, sp, #5, 26
        ldrsh   r0, [r0, +r10]
        strh    r5, [r3, #4]
        strh    r6, [r3, #6]
        strh    r8, [r3, #8]
        strh    r0, [r3]
LDIP14:
        ldr     r0, [sp, #0x40]
        add     r10, r10, #2
        subs    r0, r0, #1
        str     r0, [sp, #0x40]
        bne     LDIP10
        ldr     r12, [sp, #0x24]
        ldr     r8, [pc, #-0x980]
        ldr     r9, [sp, #0xC]
        ldr     r6, [sp, #8]
        ldr     r7, [sp, #4]
        ldr     r5, [sp]
LDIP15:
        cmp     r9, #0
        ble     LDIP19
        cmp     r9, #6
        mov     r0, #0
        movlt   r1, r0
        blt     LDIP17
        mov     r1, r0
        sub     r11, r9, #6
        mvn     r10, #2, 2
        mov     lr, r1
        str     r4, [sp, #0x54]
        str     r9, [sp, #0xC]
        str     r6, [sp, #8]
        str     r7, [sp, #4]
        str     r5, [sp]
LDIP16:
        add     r5, sp, #5, 26
        add     r2, sp, #0x12, 28
        add     r4, r5, r0
        strh    r1, [r5, +r0]
        add     r3, r1, #1
        add     r6, r2, lr
        add     r9, r1, #2
        add     r7, r1, #3
        add     r5, r1, #4
        str     r10, [r2, +r1, lsl #2]
        add     r1, r1, #5
        cmp     r1, r11
        str     r10, [r6, #4]
        strh    r3, [r4, #2]
        str     r10, [r6, #8]
        strh    r9, [r4, #4]
        str     r10, [r6, #0xC]
        strh    r7, [r4, #6]
        str     r10, [r6, #0x10]
        strh    r5, [r4, #8]
        add     lr, lr, #0x14
        add     r0, r0, #0xA
        ble     LDIP16
        ldr     r4, [sp, #0x54]
        ldr     r9, [sp, #0xC]
        ldr     r6, [sp, #8]
        ldr     r7, [sp, #4]
        ldr     r5, [sp]
LDIP17:
        mvn     r11, #2, 2
        mov     r0, r1, lsl #1
LDIP18:
        add     r10, sp, #5, 26
        add     lr, sp, #0x12, 28
        strh    r1, [r10, +r0]
        str     r11, [lr, +r1, lsl #2]
        add     r1, r1, #1
        cmp     r1, r9
        add     r0, r0, #2
        blt     LDIP18
LDIP19:
        ldr     r0, [sp, #0x14]
        ldr     r1, [pc, #-0xA58]
        ldrsh   lr, [r0, #0x1A]
        ldrsh   r2, [r0, #0x14]
        ldrsh   r3, [r0, #0x18]
        ldrsh   r11, [r0, #0x12]
        ldrsh   r10, [r0, #0x16]
        str     lr, [sp, #0x38]
        ldrsh   lr, [r0, #0x1C]
        ldrsh   r0, [r0, #0x1E]
        str     r3, [sp, #0x3C]
        str     r2, [sp, #0x44]
        str     r12, [sp, #0x24]
        str     r0, [sp, #0x30]
        mov     r0, #0
        str     r4, [sp, #0x54]
        str     r6, [sp, #8]
        str     r7, [sp, #4]
        str     r5, [sp]
LDIP20:
        ldrsh   r3, [r1]
        ldr     r8, [sp, #0x44]
        ldrsh   r2, [r1, #2]
        ldrsh   r7, [r1, #4]
        sub     r3, r11, r3
        ldrsh   r6, [r1, #6]
        ldrsh   r12, [r1, #8]
        ldrsh   r5, [r1, #0xA]
        ldrsh   r4, [r1, #0xC]
        mov     r3, r3, lsl #16
        sub     r8, r8, r2
        sub     r2, r10, r7
        mov     r3, r3, asr #16
        mul     r3, r3, r3
        mov     r7, r8, lsl #16
        ldr     r8, [sp, #0x3C]
        mov     r7, r7, asr #16
        mla     r3, r7, r7, r3
        mov     r2, r2, lsl #16
        ldr     r7, [sp, #0x38]
        sub     r6, r8, r6
        mov     r2, r2, asr #16
        mla     r3, r2, r2, r3
        sub     r7, r7, r12
        mov     r6, r6, lsl #16
        mov     r7, r7, lsl #16
        mov     r12, r6, asr #16
        mla     r3, r12, r12, r3
        ldr     r12, [sp, #0x30]
        sub     r5, lr, r5
        mov     r2, r7, asr #16
        sub     r4, r12, r4
        mla     r3, r2, r2, r3
        mov     r5, r5, lsl #16
        mov     r12, r4, lsl #16
        mov     r5, r5, asr #16
        add     r1, r1, #0x10
        mla     r3, r5, r5, r3
        mov     r12, r12, asr #16
        cmp     r9, #0
        mla     r3, r12, r12, r3
        ble     LDIP22
        mov     r12, #0
LDIP21:
        add     r2, sp, #0x12, 28
        ldr     r2, [r2, +r12, lsl #2]
        cmp     r3, r2
        blt     LDIP29
        add     r12, r12, #1
        cmp     r12, r9
        blt     LDIP21
LDIP22:
        add     r0, r0, #1
        cmp     r0, #1, 24
        blt     LDIP20
        ldr     r8, [pc, #-0xB88]
        ldr     r4, [sp, #0x54]
        ldr     r6, [sp, #8]
        ldr     r7, [sp, #4]
        ldr     r5, [sp]
        cmp     r9, #0
        ble     LDIP28
        ldr     r0, [pc, #-0xB90]
        ldr     lr, [pc, #-0xB90]
        ldr     r12, [pc, #-0xB90]
        add     r1, r4, #6
        mvn     r11, #2, 2
        mov     r10, #0
        str     r1, [sp, #0x50]
        str     r6, [sp, #8]
        str     r7, [sp, #4]
        str     r5, [sp]
LDIP23:
        add     r0, sp, #5, 26
        ldrsh   r0, [r0, +r10]
        ldr     r12, [pc, #-0xBC0]
        ldr     r1, [sp, #0x58]
        mov     r5, #0
        str     r5, [sp, #0x4C]
        add     r0, r12, r0, lsl #4
        mov     r3, #7
        mov     r2, r4
        bl      _ippsSub_16s
        ldr     r3, [sp, #0x18]
        ldr     r8, [pc, #-0xBE0]
        add     r0, sp, #0xC0
        ldrsh   r12, [r3, +r0]
        ldrsh   r7, [r4, #2]
        ldrsh   lr, [r4, #4]
        ldr     r1, [sp, #0x4C]
        mvn     r6, #2, 2
LDIP24:
        ldrsh   r0, [r8]
        ldrsh   r2, [r8, #2]
        ldrsh   r3, [r8, #4]
        sub     r0, r12, r0
        add     r8, r8, #8
        sub     r2, r7, r2
        mov     r0, r0, lsl #16
        sub     r3, lr, r3
        mov     r2, r2, lsl #16
        mov     r0, r0, asr #16
        mul     r0, r0, r0
        mov     r2, r2, asr #16
        mov     r3, r3, lsl #16
        mla     r0, r2, r2, r0
        mov     r3, r3, asr #16
        mla     r0, r3, r3, r0
        cmp     r0, r6
        movlt   r6, r0
        movlt   r5, r1
        add     r1, r1, #1
        cmp     r1, #0x20
        blt     LDIP24
        ldr     r0, [pc, #-0xC54]
        mov     r2, #3
        mov     r1, r4
        add     r0, r0, r5, lsl #3
        bl      _ippsCopy_16s
        ldrsh   lr, [r4, #6]
        ldrsh   r12, [r4, #8]
        ldrsh   r3, [r4, #0xA]
        ldrsh   r0, [r4, #0xC]
        ldr     r1, [pc, #-0xC74]
        mov     r8, #0
        mov     r6, r6, lsl #1
        mov     r7, r8
        mvn     r2, #2, 2
        str     r10, [sp, #0x48]
        str     r11, [sp, #0x44]
        str     r4, [sp, #0x54]
        str     r9, [sp, #0xC]
LDIP25:
        ldrsh   r10, [r1]
        ldrsh   r4, [r1, #2]
        ldrsh   r9, [r1, #4]
        sub     r10, lr, r10
        ldrsh   r11, [r1, #6]
        sub     r4, r12, r4
        mov     r10, r10, lsl #16
        mov     r4, r4, lsl #16
        sub     r9, r3, r9
        mov     r10, r10, asr #16
        mul     r10, r10, r10
        mov     r4, r4, asr #16
        mov     r9, r9, lsl #16
        sub     r11, r0, r11
        mla     r10, r4, r4, r10
        mov     r9, r9, asr #16
        mov     r11, r11, lsl #16
        add     r1, r1, #8
        mov     r4, r11, asr #16
        mla     r10, r9, r9, r10
        mla     r10, r4, r4, r10
        cmp     r10, r2
        movlt   r2, r10
        movlt   r7, r8
        add     r8, r8, #1
        cmp     r8, #0x20
        blt     LDIP25
        ldr     r10, [sp, #0x48]
        ldr     r11, [sp, #0x44]
        ldr     r4, [sp, #0x54]
        ldr     r9, [sp, #0xC]
        cmn     r2, #7, 2
        mvngt   r8, #2, 2
        bgt     LDIP26
        cmp     r2, #3, 2
        movge   r8, r2, lsl #1
        movlt   r8, #2, 2
LDIP26:
        ldr     r0, [pc, #-0xD2C]
        ldr     r1, [sp, #0x50]
        mov     r2, #4
        add     r0, r0, r7, lsl #3
        bl      _ippsCopy_16s
        add     r8, r6, r8
        cmp     r8, r11
        bge     LDIP27
        ldr     r0, [sp, #8]
        add     r3, sp, #5, 26
        ldrsh   r3, [r3, +r10]
        mov     r11, r8
        strh    r5, [r0, #0xA]
        strh    r7, [r0, #0xC]
        strh    r3, [r0, #2]
LDIP27:
        subs    r9, r9, #1
        add     r10, r10, #2
        bne     LDIP23
        ldr     r8, [pc, #-0xD90]
        ldr     r6, [sp, #8]
        ldr     r7, [sp, #4]
        ldr     r5, [sp]
LDIP28:
        ldrsh   lr, [r6]
        ldr     r12, [pc, #-0xDA0]
        mov     r4, #0xAB
        rsb     lr, lr, lr, lsl #2
        mov     r2, #9
        mov     r1, r5
        orr     r4, r4, #0x2A, 24
        add     r9, r5, #0x12
        add     r0, r12, lr, lsl #3
        bl      _ippsCopy_16s
        ldrsh   lr, [r6, #2]
        ldr     r12, [pc, #-0xDB8]
        mov     r1, r9
        mov     r2, #7
        add     r0, r12, lr, lsl #4
        bl      _ippsCopy_16s
        ldrsh   r12, [r6, #4]
        ldr     lr, [pc, #-0xDDC]
        ldr     r9, [pc, #-0xDD0]
        mov     r10, r12, lsl #3
        ldrsh   r12, [r5]
        ldrsh   r10, [lr, +r10]
        ldrsh   r11, [r5, #0x10]
        ldr     r3, [pc, #-0xDEC]
        add     r12, r12, r10
        ldr     r10, [pc, #-0xDE8]
        str     r11, [sp, #0xBC]
        ldrsh   r11, [r5, #8]
        mov     r12, r12, lsl #16
        mov     r2, #0xF
        mov     r12, r12, asr #16
        str     r11, [sp, #0xB8]
        strh    r12, [r5]
        ldrsh   r0, [r6, #6]
        ldrsh   r11, [r5, #0x1E]
        mov     r12, r12, lsl #16
        mov     r0, r0, lsl #3
        mov     r12, r12, asr #16
        str     r11, [sp, #0xB4]
        ldrsh   r11, [r5, #0x16]
        str     r11, [sp, #0xB0]
        ldrsh   r11, [r5, #4]
        str     r11, [sp, #0xAC]
        ldrsh   r11, [r5, #0x1A]
        str     r11, [sp, #0xA8]
        ldrsh   r11, [r5, #0x1C]
        str     r11, [sp, #0xA4]
        ldrsh   r11, [r5, #0xE]
        str     r11, [sp, #0xA0]
        ldrsh   r11, [r5, #0x14]
        str     r11, [sp, #0x9C]
        ldrsh   r1, [r5, #2]
        ldrsh   r11, [r5, #6]
        str     r1, [sp, #0x98]
        ldrsh   r1, [r5, #0x18]
        str     r1, [sp, #0x94]
        ldrsh   r1, [r5, #0x12]
        str     r1, [sp, #0x90]
        ldrsh   r1, [r5, #0xA]
        str     r1, [sp, #0x8C]
        ldr     r1, [pc, #-0xE84]
        ldrsh   r0, [r1, +r0]
        ldrsh   r1, [r5, #0xC]
        add     r0, r11, r0
        str     r1, [sp, #0x88]
        strh    r0, [r5, #6]
        ldrsh   r11, [r6, #8]
        mov     r1, #0x80
        mov     r0, r5
        mov     r11, r11, lsl #3
        ldrsh   r11, [r3, +r11]
        ldr     r3, [sp, #0x88]
        add     r11, r3, r11
        strh    r11, [r5, #0xC]
        ldrsh   r11, [r6, #0xA]
        ldr     r3, [sp, #0x90]
        mov     r11, r11, lsl #3
        ldrsh   r11, [r9, +r11]
        add     r11, r3, r11
        strh    r11, [r5, #0x12]
        ldrsh   r11, [r6, #0xC]
        ldr     r3, [sp, #0x94]
        mov     r11, r11, lsl #3
        ldrsh   r11, [r10, +r11]
        add     r11, r3, r11
        strh    r11, [r5, #0x18]
        ldrsh   r11, [r6, #4]
        ldr     r3, [sp, #0x98]
        add     r11, lr, r11, lsl #3
        ldrsh   r11, [r11, #2]
        add     r11, r3, r11
        strh    r11, [r5, #2]
        ldr     r11, [pc, #-0xF04]
        ldrsh   r3, [r6, #6]
        add     r3, r11, r3, lsl #3
        ldrsh   r11, [r3, #2]
        ldr     r3, [sp, #0xB8]
        add     r11, r3, r11
        strh    r11, [r5, #8]
        ldrsh   r3, [r6, #8]
        ldr     r11, [pc, #-0xF20]
        add     r3, r11, r3, lsl #3
        ldrsh   r11, [r3, #2]
        ldr     r3, [sp, #0xA0]
        add     r11, r3, r11
        strh    r11, [r5, #0xE]
        ldrsh   r11, [r6, #0xA]
        ldr     r3, [sp, #0x9C]
        add     r11, r9, r11, lsl #3
        ldrsh   r11, [r11, #2]
        add     r11, r3, r11
        strh    r11, [r5, #0x14]
        ldrsh   r11, [r6, #0xC]
        ldr     r3, [sp, #0xA8]
        add     r11, r10, r11, lsl #3
        ldrsh   r11, [r11, #2]
        add     r11, r3, r11
        strh    r11, [r5, #0x1A]
        ldrsh   r11, [r6, #4]
        add     r11, lr, r11, lsl #3
        ldrsh   lr, [r11, #4]
        ldr     r11, [sp, #0xAC]
        add     lr, r11, lr
        strh    lr, [r5, #4]
        ldr     lr, [pc, #-0xF84]
        ldrsh   r11, [r6, #6]
        add     r11, lr, r11, lsl #3
        ldrsh   lr, [r11, #4]
        ldr     r11, [sp, #0x8C]
        add     lr, r11, lr
        strh    lr, [r5, #0xA]
        ldr     lr, [pc, #-0xF9C]
        ldrsh   r11, [r6, #8]
        add     r11, lr, r11, lsl #3
        ldrsh   lr, [r11, #4]
        ldr     r11, [sp, #0xBC]
        add     lr, r11, lr
        strh    lr, [r5, #0x10]
        ldrsh   lr, [r6, #0xA]
        add     lr, r9, lr, lsl #3
        ldr     r9, [sp, #0xB0]
        ldrsh   lr, [lr, #4]
        add     lr, r9, lr
        strh    lr, [r5, #0x16]
        ldrsh   lr, [r6, #0xC]
        ldr     r9, [sp, #0xA4]
        add     lr, r10, lr, lsl #3
        ldrsh   lr, [lr, #4]
        add     lr, r9, lr
        strh    lr, [r5, #0x1C]
        ldrsh   r6, [r6, #0xC]
        ldr     lr, [sp, #0xB4]
        add     r6, r10, r6, lsl #3
        ldrsh   r3, [r6, #6]
        add     r3, lr, r3
        strh    r3, [r5, #0x1E]
        ldrsh   r3, [r8]
        add     r3, r3, r12
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
        strh    r3, [r5]
        ldrsh   lr, [r7]
        mul     lr, lr, r4
        add     lr, r3, lr, asr #15
        strh    lr, [r5]
        strh    r12, [r7]
        ldrsh   r12, [r8, #2]
        ldrsh   r3, [r5, #2]
        add     r12, r12, r3
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        strh    r12, [r5, #2]
        ldrsh   lr, [r7, #2]
        mul     lr, lr, r4
        add     lr, r12, lr, asr #15
        strh    lr, [r5, #2]
        strh    r3, [r7, #2]
        ldrsh   r3, [r5, #4]
        ldrsh   r12, [r8, #4]
        add     r12, r12, r3
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        strh    r12, [r5, #4]
        ldrsh   lr, [r7, #4]
        mul     lr, lr, r4
        add     lr, r12, lr, asr #15
        strh    lr, [r5, #4]
        strh    r3, [r7, #4]
        ldrsh   r12, [r8, #6]
        ldrsh   r3, [r5, #6]
        add     r12, r12, r3
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        strh    r12, [r5, #6]
        ldrsh   lr, [r7, #6]
        mul     lr, lr, r4
        add     lr, r12, lr, asr #15
        strh    lr, [r5, #6]
        strh    r3, [r7, #6]
        ldrsh   r12, [r8, #8]
        ldrsh   r3, [r5, #8]
        add     r12, r12, r3
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        strh    r12, [r5, #8]
        ldrsh   lr, [r7, #8]
        mul     lr, lr, r4
        add     lr, r12, lr, asr #15
        strh    lr, [r5, #8]
        strh    r3, [r7, #8]
        ldrsh   r12, [r8, #0xA]
        ldrsh   r3, [r5, #0xA]
        add     r12, r12, r3
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        strh    r12, [r5, #0xA]
        ldrsh   lr, [r7, #0xA]
        mul     lr, lr, r4
        add     lr, r12, lr, asr #15
        strh    lr, [r5, #0xA]
        strh    r3, [r7, #0xA]
        ldrsh   r12, [r8, #0xC]
        ldrsh   r3, [r5, #0xC]
        add     r12, r12, r3
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        strh    r12, [r5, #0xC]
        ldrsh   lr, [r7, #0xC]
        mul     lr, lr, r4
        add     lr, r12, lr, asr #15
        strh    lr, [r5, #0xC]
        strh    r3, [r7, #0xC]
        ldrsh   r12, [r8, #0xE]
        ldrsh   r3, [r5, #0xE]
        add     r12, r12, r3
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        strh    r12, [r5, #0xE]
        ldrsh   lr, [r7, #0xE]
        mul     lr, lr, r4
        add     lr, r12, lr, asr #15
        strh    lr, [r5, #0xE]
        strh    r3, [r7, #0xE]
        ldrsh   r12, [r8, #0x10]
        ldrsh   r3, [r5, #0x10]
        add     r12, r12, r3
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        strh    r12, [r5, #0x10]
        ldrsh   lr, [r7, #0x10]
        mul     lr, lr, r4
        add     lr, r12, lr, asr #15
        strh    lr, [r5, #0x10]
        strh    r3, [r7, #0x10]
        ldrsh   r12, [r8, #0x12]
        ldrsh   r3, [r5, #0x12]
        add     r12, r12, r3
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        strh    r12, [r5, #0x12]
        ldrsh   lr, [r7, #0x12]
        mul     lr, lr, r4
        add     lr, r12, lr, asr #15
        strh    lr, [r5, #0x12]
        strh    r3, [r7, #0x12]
        ldrsh   r3, [r5, #0x14]
        ldrsh   r12, [r8, #0x14]
        add     r12, r12, r3
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        strh    r12, [r5, #0x14]
        ldrsh   lr, [r7, #0x14]
        mul     lr, lr, r4
        add     lr, r12, lr, asr #15
        strh    lr, [r5, #0x14]
        strh    r3, [r7, #0x14]
        ldrsh   r3, [r5, #0x16]
        ldrsh   r12, [r8, #0x16]
        add     r12, r12, r3
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        strh    r12, [r5, #0x16]
        ldrsh   lr, [r7, #0x16]
        mul     lr, lr, r4
        add     lr, r12, lr, asr #15
        strh    lr, [r5, #0x16]
        strh    r3, [r7, #0x16]
        ldrsh   r12, [r8, #0x18]
        ldrsh   r3, [r5, #0x18]
        add     r12, r12, r3
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        strh    r12, [r5, #0x18]
        ldrsh   lr, [r7, #0x18]
        mul     lr, lr, r4
        add     lr, r12, lr, asr #15
        strh    lr, [r5, #0x18]
        strh    r3, [r7, #0x18]
        ldrsh   r12, [r8, #0x1A]
        ldrsh   r3, [r5, #0x1A]
        add     r12, r12, r3
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        strh    r12, [r5, #0x1A]
        ldrsh   lr, [r7, #0x1A]
        mul     lr, lr, r4
        add     lr, r12, lr, asr #15
        strh    lr, [r5, #0x1A]
        strh    r3, [r7, #0x1A]
        ldrsh   r12, [r8, #0x1C]
        ldrsh   r3, [r5, #0x1C]
        add     r12, r12, r3
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        strh    r12, [r5, #0x1C]
        ldrsh   lr, [r7, #0x1C]
        mul     lr, lr, r4
        add     lr, r12, lr, asr #15
        strh    lr, [r5, #0x1C]
        strh    r3, [r7, #0x1C]
        ldrsh   r8, [r8, #0x1E]
        ldrsh   r3, [r5, #0x1E]
        add     r8, r8, r3
        mov     r8, r8, lsl #16
        mov     r12, r8, asr #16
        strh    r12, [r5, #0x1E]
        ldrsh   lr, [r7, #0x1E]
        mul     r4, lr, r4
        add     r4, r12, r4, asr #15
        strh    r4, [r5, #0x1E]
        strh    r3, [r7, #0x1E]
        bl      ReorderLsf
        add     sp, sp, #0x52, 30
        ldmia   sp!, {r4 - r11, pc}
LDIP29:
        ldr     r2, [sp, #0x24]
        cmp     r2, r12
        ble     LDIP33
        ldr     r4, [sp, #0x24]
        sub     r4, r4, r12
        cmp     r4, #6
        blt     LDIP31
        add     r6, r12, #6
        mov     r5, r2, lsl #2
        mov     r4, r2, lsl #1
        str     r6, [sp, #0x20]
        str     r12, [sp, #0x28]
        str     r3, [sp, #0x2C]
        str     lr, [sp, #0x34]
        str     r10, [sp, #0x40]
        str     r11, [sp, #0x48]
        str     r0, [sp, #0x4C]
        str     r1, [sp, #0x50]
        str     r9, [sp, #0xC]
LDIP30:
        add     r3, sp, #0x12, 28
        add     r10, r3, r5
        ldr     r0, [r10, #-8]
        ldr     r1, [r10, #-4]
        add     r12, sp, #5, 26
        str     r0, [sp, #0xBC]
        add     r0, r12, r4
        ldrsh   r12, [r0, #-2]
        sub     r5, r5, #0x14
        str     r12, [sp, #0xB8]
        str     r1, [r3, +r2, lsl #2]
        ldr     r1, [sp, #0xB8]
        ldrsh   r12, [r0, #-4]
        ldr     lr, [r10, #-0xC]
        ldrsh   r6, [r0, #-6]
        ldr     r7, [r10, #-0x10]
        ldrsh   r8, [r0, #-8]
        ldr     r9, [r10, #-0x14]
        ldrsh   r11, [r0, #-0xA]
        add     r3, sp, #5, 26
        strh    r1, [r3, +r4]
        ldr     r1, [sp, #0x20]
        sub     r2, r2, #5
        sub     r4, r4, #0xA
        cmp     r2, r1
        ldr     r1, [sp, #0xBC]
        strh    r12, [r0, #-2]
        str     lr, [r10, #-8]
        strh    r6, [r0, #-4]
        str     r1, [r10, #-4]
        str     r7, [r10, #-0xC]
        strh    r8, [r0, #-6]
        str     r9, [r10, #-0x10]
        strh    r11, [r0, #-8]
        bgt     LDIP30
        ldr     r12, [sp, #0x28]
        ldr     r3, [sp, #0x2C]
        ldr     lr, [sp, #0x34]
        ldr     r10, [sp, #0x40]
        ldr     r11, [sp, #0x48]
        ldr     r0, [sp, #0x4C]
        ldr     r1, [sp, #0x50]
        ldr     r9, [sp, #0xC]
LDIP31:
        mov     r5, r2, lsl #2
        mov     r4, r2, lsl #1
        str     r9, [sp, #0xC]
LDIP32:
        add     r7, sp, #0x12, 28
        add     r6, r7, r5
        add     r8, sp, #5, 26
        ldr     r6, [r6, #-4]
        add     r9, r8, r4
        ldrsh   r9, [r9, #-2]
        str     r6, [r7, +r2, lsl #2]
        sub     r2, r2, #1
        strh    r9, [r8, +r4]
        cmp     r2, r12
        sub     r5, r5, #4
        sub     r4, r4, #2
        bgt     LDIP32
        ldr     r9, [sp, #0xC]
LDIP33:
        add     r5, sp, #0x12, 28
        add     r4, sp, #5, 26
        mov     r2, r12, lsl #1
        str     r3, [r5, +r12, lsl #2]
        strh    r0, [r4, +r2]
        b       LDIP22
LDIP34:
        ldr     r1, [sp, #0x24]
        cmp     r1, r4
        ble     LDIP38
        ldr     r2, [sp, #0x24]
        sub     r2, r2, r4
        cmp     r2, #6
        blt     LDIP36
        add     r5, r4, #6
        mov     r3, r1, lsl #2
        mov     r2, r1, lsl #1
        str     r5, [sp, #0x10]
        str     r4, [sp, #0x1C]
        str     r12, [sp, #0x20]
        str     lr, [sp, #0x2C]
        str     r10, [sp, #0x30]
        str     r9, [sp, #0xC]
LDIP35:
        add     r12, sp, #0x13, 28
        add     r10, r12, r3
        ldr     r4, [r10, #-8]
        ldr     lr, [r10, #-4]
        add     r0, sp, #5, 26
        str     r4, [sp, #0xBC]
        add     r0, r0, r2
        ldrsh   r4, [r0, #-2]
        sub     r3, r3, #0x14
        str     r4, [sp, #0xB8]
        str     lr, [r12, +r1, lsl #2]
        ldr     lr, [sp, #0xB8]
        ldrsh   r4, [r0, #-4]
        ldr     r5, [r10, #-0xC]
        ldrsh   r6, [r0, #-6]
        ldr     r7, [r10, #-0x10]
        ldrsh   r8, [r0, #-8]
        ldr     r9, [r10, #-0x14]
        ldrsh   r11, [r0, #-0xA]
        add     r12, sp, #5, 26
        strh    lr, [r12, +r2]
        ldr     r12, [sp, #0x10]
        sub     r1, r1, #5
        sub     r2, r2, #0xA
        cmp     r1, r12
        ldr     r12, [sp, #0xBC]
        strh    r4, [r0, #-2]
        str     r5, [r10, #-8]
        strh    r6, [r0, #-4]
        str     r12, [r10, #-4]
        str     r7, [r10, #-0xC]
        strh    r8, [r0, #-6]
        str     r9, [r10, #-0x10]
        strh    r11, [r0, #-8]
        bgt     LDIP35
        ldr     r4, [sp, #0x1C]
        ldr     r12, [sp, #0x20]
        ldr     lr, [sp, #0x2C]
        ldr     r10, [sp, #0x30]
        ldr     r0, [sp, #0x3C]
        ldr     r9, [sp, #0xC]
LDIP36:
        mov     r3, r1, lsl #2
        mov     r2, r1, lsl #1
LDIP37:
        add     r6, sp, #0x13, 28
        add     r7, r6, r3
        add     r5, sp, #5, 26
        ldr     r7, [r7, #-4]
        add     r8, r5, r2
        ldrsh   r8, [r8, #-2]
        str     r7, [r6, +r1, lsl #2]
        sub     r1, r1, #1
        strh    r8, [r5, +r2]
        cmp     r1, r4
        sub     r3, r3, #4
        sub     r2, r2, #2
        bgt     LDIP37
LDIP38:
        add     r3, sp, #0x13, 28
        add     r2, sp, #5, 26
        mov     r1, r4, lsl #1
        str     r12, [r3, +r4, lsl #2]
        strh    lr, [r2, +r1]
        b       LDIP9
LDIP_ownQuantPredISF_36b:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x51, 30
        mov     r8, r2
        ldrsh   r12, [r8, #2]
        ldr     r9, [pc, #0xFF8]
        ldr     r10, [sp, #0x168]
        str     r12, [sp, #0x58]
        ldrsh   r12, [r8, #4]
        ldr     r2, [sp, #0x58]
        mov     r7, r1
        str     r12, [sp, #0x54]
        ldrsh   lr, [r8, #6]
        ldrsh   r12, [r8, #0xA]
        ldrsh   r6, [r8, #0xC]
        ldrsh   r5, [r8, #8]
        str     r3, [sp, #8]
        ldrsh   r3, [r8, #0xE]
        ldrsh   r1, [r8]
        ldrsh   r11, [r8, #0x10]
        ldrsh   r4, [r9]
        cmp     r10, #0
        str     r4, [sp, #0x50]
        ldrsh   r4, [r0]
        str     r4, [sp, #0x4C]
        ldrsh   r4, [r8, #0x12]
        str     r4, [sp, #0x44]
        ldrsh   r4, [r8, #0x14]
        str     r4, [sp, #0x40]
        ldrsh   r4, [r8, #0x16]
        str     r4, [sp, #0x3C]
        ldrsh   r4, [r8, #0x18]
        str     r4, [sp, #0x38]
        ldrsh   r4, [r8, #0x1A]
        str     r4, [sp, #0x34]
        ldrsh   r4, [r8, #0x1C]
        str     r4, [sp, #0x30]
        ldrsh   r4, [r8, #0x1E]
        str     r4, [sp, #0x2C]
        mov     r4, #0xAB
        orr     r4, r4, #0x2A, 24
        mul     r2, r2, r4
        mul     lr, lr, r4
        mul     r5, r5, r4
        mul     r6, r6, r4
        mul     r12, r12, r4
        mul     r3, r3, r4
        mul     r11, r11, r4
        str     r2, [sp, #0x58]
        ldr     r2, [sp, #0x54]
        str     r5, [sp, #0x24]
        mul     r5, r1, r4
        str     lr, [sp, #0x28]
        mul     r2, r2, r4
        str     r12, [sp, #0x20]
        str     r6, [sp, #0x18]
        str     r3, [sp, #0x14]
        str     r11, [sp, #0x10]
        str     r2, [sp, #0x54]
        ldrsh   r3, [r0, #4]
        ldrsh   r1, [r0, #2]
        ldrsh   r6, [r9, #4]
        ldrsh   r11, [r9, #2]
        str     r3, [sp, #0xC]
        ldrsh   lr, [r0, #6]
        ldrsh   r12, [r9, #6]
        ldrsh   r3, [r9, #8]
        str     r3, [sp, #0x5C]
        ldrsh   r2, [r9, #0xA]
        ldrsh   r3, [r0, #8]
        str     r2, [sp, #0x60]
        ldrsh   r2, [r0, #0xA]
        str     r2, [sp, #0x64]
        ldrsh   r2, [r9, #0xC]
        str     r2, [sp, #0x68]
        ldrsh   r2, [r0, #0xC]
        str     r2, [sp, #0x6C]
        ldrsh   r2, [r9, #0xE]
        str     r2, [sp, #0x70]
        ldrsh   r2, [r0, #0xE]
        str     r2, [sp, #0x74]
        ldrsh   r2, [r9, #0x10]
        str     r2, [sp, #0x78]
        ldrsh   r2, [r0, #0x10]
        str     r2, [sp, #0x7C]
        ldr     r2, [sp, #0x44]
        mul     r2, r2, r4
        str     r2, [sp, #0x80]
        ldr     r2, [sp, #0x40]
        mul     r2, r2, r4
        str     r2, [sp, #0x84]
        ldr     r2, [sp, #0x3C]
        mul     r2, r2, r4
        str     r2, [sp, #0x88]
        ldr     r2, [sp, #0x38]
        mul     r2, r2, r4
        str     r2, [sp, #0x8C]
        ldr     r2, [sp, #0x34]
        mul     r2, r2, r4
        str     r2, [sp, #0x90]
        ldr     r2, [sp, #0x30]
        mul     r2, r2, r4
        str     r2, [sp, #0x94]
        ldr     r2, [sp, #0x2C]
        mul     r4, r2, r4
        ldr     r2, [sp, #0x4C]
        str     r4, [sp, #0x98]
        ldrsh   r4, [r9, #0x12]
        str     r4, [sp, #0x40]
        ldrsh   r4, [r0, #0x12]
        str     r4, [sp, #0x3C]
        ldrsh   r4, [r9, #0x14]
        str     r4, [sp, #0x38]
        ldrsh   r4, [r0, #0x14]
        str     r4, [sp, #0x34]
        ldrsh   r4, [r9, #0x16]
        str     r4, [sp, #0x30]
        ldrsh   r4, [r0, #0x16]
        str     r4, [sp, #0x2C]
        ldrsh   r4, [r9, #0x18]
        str     r4, [sp, #0x9C]
        ldrsh   r4, [r0, #0x18]
        str     r4, [sp, #0xA0]
        ldrsh   r4, [r9, #0x1A]
        str     r4, [sp, #0xA4]
        ldrsh   r4, [r0, #0x1A]
        str     r4, [sp, #0xA8]
        ldrsh   r4, [r9, #0x1C]
        str     r4, [sp, #0xAC]
        ldrsh   r4, [r0, #0x1C]
        str     r4, [sp, #0xB0]
        ldrsh   r4, [r9, #0x1E]
        str     r4, [sp, #0xB4]
        ldrsh   r0, [r0, #0x1E]
        add     r4, sp, #0xEC
        and     r4, r4, #0xF
        str     r0, [sp, #0xB8]
        rsb     r4, r4, #0
        and     r0, r4, #0xF
        ldr     r4, [sp, #0x50]
        str     r0, [sp, #0x1C]
        sub     r2, r2, r4
        add     r4, sp, #0xEC
        sub     r2, r2, r5, asr #15
        add     r4, r4, r0
        str     r4, [sp, #0x44]
        add     r5, sp, #0xEC
        strh    r2, [r0, +r5]
        ldr     r5, [sp, #0xC]
        ldr     r2, [sp, #0x58]
        sub     r4, r1, r11
        sub     r5, r5, r6
        sub     r6, lr, r12
        ldr     r12, [sp, #0x5C]
        ldr     lr, [sp, #0x7C]
        sub     r4, r4, r2, asr #15
        ldr     r2, [sp, #0x54]
        sub     r11, r3, r12
        ldr     r3, [sp, #0x60]
        ldr     r12, [sp, #0x64]
        sub     r5, r5, r2, asr #15
        ldr     r2, [sp, #0x28]
        sub     r0, r12, r3
        ldr     r3, [sp, #0x68]
        ldr     r12, [sp, #0x6C]
        sub     r6, r6, r2, asr #15
        ldr     r2, [sp, #0x24]
        sub     r1, r12, r3
        ldr     r3, [sp, #0x70]
        ldr     r12, [sp, #0x74]
        sub     r11, r11, r2, asr #15
        ldr     r2, [sp, #0x20]
        sub     r12, r12, r3
        ldr     r3, [sp, #0x78]
        mov     r5, r5, lsl #16
        sub     r0, r0, r2, asr #15
        ldr     r2, [sp, #0x18]
        sub     lr, lr, r3
        mov     r6, r6, lsl #16
        add     r3, sp, #0xBC
        sub     r1, r1, r2, asr #15
        ldr     r2, [sp, #0x14]
        and     r3, r3, #0xF
        rsb     r3, r3, #0
        str     r3, [sp, #0x7C]
        ldr     r3, [sp, #0x40]
        mov     r4, r4, lsl #16
        str     r4, [sp, #0x78]
        ldr     r4, [sp, #0x3C]
        sub     r12, r12, r2, asr #15
        ldr     r2, [sp, #0x10]
        mov     r11, r11, lsl #16
        sub     r3, r4, r3
        ldr     r4, [sp, #0x38]
        sub     lr, lr, r2, asr #15
        ldr     r2, [sp, #0x34]
        mov     r5, r5, asr #16
        str     r5, [sp, #0x3C]
        mov     r0, r0, lsl #16
        sub     r2, r2, r4
        ldr     r4, [sp, #0x30]
        str     r2, [sp, #0x74]
        ldr     r2, [sp, #0x2C]
        mov     r1, r1, lsl #16
        mov     r12, r12, lsl #16
        sub     r2, r2, r4
        str     r2, [sp, #0x70]
        ldr     r2, [sp, #0xA0]
        ldr     r4, [sp, #0x9C]
        ldr     r5, [sp, #0x70]
        mov     r6, r6, asr #16
        str     r6, [sp, #0x38]
        sub     r2, r2, r4
        str     r2, [sp, #0xA0]
        ldr     r2, [sp, #0xA8]
        ldr     r4, [sp, #0xA4]
        mov     r11, r11, asr #16
        str     r11, [sp, #0x34]
        mov     lr, lr, lsl #16
        sub     r2, r2, r4
        ldr     r4, [sp, #0xAC]
        str     r2, [sp, #0xA8]
        ldr     r2, [sp, #0xB0]
        ldr     r11, [sp, #0xA8]
        mov     r0, r0, asr #16
        sub     r2, r2, r4
        ldr     r4, [sp, #0xB4]
        str     r2, [sp, #0xB0]
        ldr     r2, [sp, #0xB8]
        str     r0, [sp, #0x30]
        mov     r1, r1, asr #16
        str     r1, [sp, #0x2C]
        sub     r2, r2, r4
        ldr     r4, [sp, #0x7C]
        str     r2, [sp, #0xB8]
        ldr     r2, [sp, #0xB0]
        and     r4, r4, #0xF
        str     r4, [sp, #0x50]
        ldr     r4, [sp, #0x78]
        mov     r12, r12, asr #16
        str     r12, [sp, #0x28]
        mov     r4, r4, asr #16
        str     r4, [sp, #0x40]
        ldr     r4, [sp, #0x80]
        mov     lr, lr, asr #16
        str     lr, [sp, #0x24]
        sub     r6, r3, r4, asr #15
        ldr     r3, [sp, #0x84]
        ldr     r4, [sp, #0x74]
        sub     r3, r4, r3, asr #15
        ldr     r4, [sp, #0x88]
        sub     r5, r5, r4, asr #15
        str     r5, [sp, #0xB4]
        ldr     r4, [sp, #0x8C]
        ldr     r5, [sp, #0xA0]
        sub     r4, r5, r4, asr #15
        ldr     r5, [sp, #0x90]
        sub     r5, r11, r5, asr #15
        ldr     r11, [sp, #0x94]
        sub     r2, r2, r11, asr #15
        str     r2, [sp, #0xB0]
        ldr     r2, [sp, #0xB8]
        ldr     r11, [sp, #0x98]
        sub     r2, r2, r11, asr #15
        str     r2, [sp, #0xB8]
        ldr     r2, [sp, #0x50]
        add     r11, sp, #0xBC
        add     r2, r11, r2
        str     r2, [sp, #0x4C]
        ldr     r2, [sp, #0x40]
        ldr     r11, [sp, #0x44]
        strh    r2, [r11, #2]
        ldr     r2, [sp, #0x3C]
        strh    r2, [r11, #4]
        ldr     r2, [sp, #0x38]
        strh    r2, [r11, #6]
        ldr     r2, [sp, #0x34]
        strh    r12, [r11, #0xE]
        strh    r0, [r11, #0xA]
        strh    r2, [r11, #8]
        strh    r1, [r11, #0xC]
        strh    lr, [r11, #0x10]
        ldr     r12, [sp, #0x44]
        add     r11, r11, #0x12
        str     r11, [sp, #0x54]
        strh    r3, [r12, #0x14]
        strh    r6, [r12, #0x12]
        ldr     r3, [sp, #0xB4]
        strh    r4, [r12, #0x18]
        strh    r5, [r12, #0x1A]
        strh    r3, [r12, #0x16]
        ldr     r3, [sp, #0xB0]
        strh    r3, [r12, #0x1C]
        ldr     r3, [sp, #0xB8]
        strh    r3, [r12, #0x1E]
        ble     LDIP42
        cmp     r10, #6
        movlt   r5, #0
        blt     LDIP40
        mov     r4, #0
        mov     r5, r4
        sub     lr, r10, #6
        mvn     r12, #2, 2
        mov     r3, r5
        str     r8, [sp, #4]
        str     r7, [sp]
LDIP39:
        add     r6, sp, #0x4F, 30
        add     r0, sp, #0x4B, 30
        add     r2, r6, r4
        strh    r5, [r6, +r4]
        add     r1, r5, #1
        add     r8, r0, r3
        add     r6, r5, #2
        add     r7, r5, #3
        add     r11, r5, #4
        str     r12, [r0, +r5, lsl #2]
        add     r5, r5, #5
        cmp     r5, lr
        str     r12, [r8, #4]
        strh    r1, [r2, #2]
        str     r12, [r8, #8]
        strh    r6, [r2, #4]
        str     r12, [r8, #0xC]
        strh    r7, [r2, #6]
        str     r12, [r8, #0x10]
        strh    r11, [r2, #8]
        add     r3, r3, #0x14
        add     r4, r4, #0xA
        ble     LDIP39
        ldr     r8, [sp, #4]
        ldr     r7, [sp]
LDIP40:
        mvn     r12, #2, 2
        mov     r3, r5, lsl #1
LDIP41:
        add     lr, sp, #0x4F, 30
        add     r4, sp, #0x4B, 30
        strh    r5, [lr, +r3]
        str     r12, [r4, +r5, lsl #2]
        add     r5, r5, #1
        cmp     r5, r10
        add     r3, r3, #2
        blt     LDIP41
LDIP42:
        ldr     r3, [sp, #0x1C]
        ldr     r12, [pc, #0xAB8]
        add     lr, sp, #0xEC
        ldrsh   lr, [r3, +lr]
        ldr     r0, [sp, #0x2C]
        sub     r4, r10, #1
        mov     r3, #0
        str     r4, [sp, #0x58]
        str     lr, [sp, #0x18]
        str     r8, [sp, #4]
        str     r7, [sp]
LDIP43:
        ldr     r1, [sp, #0x18]
        ldrsh   r2, [r12]
        ldrsh   r5, [r12, #2]
        ldrsh   r9, [r12, #4]
        ldrsh   r6, [r12, #6]
        sub     r1, r1, r2
        ldr     r7, [sp, #0x40]
        ldrsh   r2, [r12, #8]
        mov     r1, r1, lsl #16
        ldrsh   lr, [r12, #0xA]
        ldrsh   r4, [r12, #0xC]
        mov     r1, r1, asr #16
        mul     r1, r1, r1
        sub     r5, r7, r5
        ldrsh   r7, [r12, #0xE]
        mov     r8, r5, lsl #16
        ldrsh   r5, [r12, #0x10]
        ldr     r11, [sp, #0x3C]
        mov     r8, r8, asr #16
        mla     r1, r8, r8, r1
        ldr     r8, [sp, #0x38]
        sub     r9, r11, r9
        sub     r4, r0, r4
        sub     r6, r8, r6
        ldr     r8, [sp, #0x34]
        mov     r9, r9, lsl #16
        mov     r6, r6, lsl #16
        mov     r9, r9, asr #16
        mla     r1, r9, r9, r1
        sub     r2, r8, r2
        ldr     r8, [sp, #0x30]
        mov     r6, r6, asr #16
        mov     r2, r2, lsl #16
        mla     r6, r6, r6, r1
        sub     lr, r8, lr
        mov     r2, r2, asr #16
        mov     lr, lr, lsl #16
        mov     r4, r4, lsl #16
        add     r12, r12, #0x18
        mov     r1, lr, asr #16
        mla     lr, r2, r2, r6
        ldr     r2, [sp, #0x28]
        cmp     r10, #0
        sub     r7, r2, r7
        mov     r2, r4, asr #16
        mla     lr, r1, r1, lr
        ldr     r1, [sp, #0x24]
        mov     r4, r7, lsl #16
        sub     r5, r1, r5
        mla     lr, r2, r2, lr
        mov     r4, r4, asr #16
        mov     r1, r5, lsl #16
        mov     r1, r1, asr #16
        mla     lr, r4, r4, lr
        mla     r4, r1, r1, lr
        ble     LDIP45
        mov     r5, #0
LDIP44:
        add     r1, sp, #0x4B, 30
        ldr     r1, [r1, +r5, lsl #2]
        cmp     r4, r1
        blt     LDIP70
        add     r5, r5, #1
        cmp     r5, r10
        blt     LDIP44
LDIP45:
        add     r3, r3, #1
        cmp     r3, #1, 24
        blt     LDIP43
        ldr     r9, [pc, #0x980]
        ldr     r8, [sp, #4]
        ldr     r7, [sp]
        cmp     r10, #0
        ble     LDIP52
        ldr     r4, [sp, #0x4C]
        ldr     lr, [pc, #0x96C]
        ldr     r12, [pc, #0x96C]
        ldr     r3, [pc, #0x96C]
        str     r7, [sp]
        ldr     r7, [sp, #0x4C]
        add     r11, r4, #0xA
        mvn     r6, #2, 2
        mov     r5, #0
        mov     r4, r10
        str     r11, [sp, #0x30]
        str     r10, [sp, #0x48]
        str     r8, [sp, #4]
LDIP46:
        add     r0, sp, #0x4F, 30
        ldrsh   r0, [r0, +r5]
        ldr     r12, [pc, #0x934]
        ldr     r1, [sp, #0x44]
        rsb     r0, r0, r0, lsl #2
        mov     r8, #0
        str     r8, [sp, #0x34]
        add     r0, r12, r0, lsl #3
        mov     r3, #9
        mov     r2, r7
        bl      _ippsSub_16s
        ldr     r0, [sp, #0x50]
        ldr     r11, [pc, #0x910]
        add     r3, sp, #0xBC
        ldrsh   r0, [r0, +r3]
        ldrsh   r10, [r7, #2]
        ldrsh   lr, [r7, #4]
        ldrsh   r12, [r7, #6]
        ldrsh   r3, [r7, #8]
        str     r6, [sp, #0x38]
        ldr     r6, [sp, #0x34]
        mvn     r9, #2, 2
        str     r4, [sp, #0x40]
        str     r5, [sp, #0x3C]
LDIP47:
        ldrsh   r2, [r11]
        ldrsh   r1, [r11, #2]
        ldrsh   r7, [r11, #4]
        sub     r2, r0, r2
        ldrsh   r4, [r11, #6]
        ldrsh   r5, [r11, #8]
        mov     r2, r2, lsl #16
        sub     r1, r10, r1
        sub     r7, lr, r7
        mov     r2, r2, asr #16
        mul     r2, r2, r2
        mov     r1, r1, lsl #16
        mov     r7, r7, lsl #16
        mov     r1, r1, asr #16
        mla     r2, r1, r1, r2
        mov     r7, r7, asr #16
        sub     r4, r12, r4
        sub     r5, r3, r5
        mov     r4, r4, lsl #16
        mla     r2, r7, r7, r2
        mov     r1, r5, lsl #16
        mov     r4, r4, asr #16
        mov     r1, r1, asr #16
        add     r11, r11, #0x10
        mla     r2, r4, r4, r2
        mla     r2, r1, r1, r2
        cmp     r2, r9
        movlt   r9, r2
        movlt   r8, r6
        add     r6, r6, #1
        cmp     r6, #0x80
        blt     LDIP47
        ldr     r4, [sp, #0x40]
        ldr     r5, [sp, #0x3C]
        ldr     r6, [sp, #0x38]
        ldr     r7, [sp, #0x4C]
        cmn     r9, #7, 2
        mvngt   r9, #2, 2
        bgt     LDIP48
        cmp     r9, #3, 2
        movge   r9, r9, lsl #1
        movlt   r9, #2, 2
LDIP48:
        ldr     r0, [pc, #0x838]
        mov     r2, #5
        mov     r1, r7
        add     r0, r0, r8, lsl #4
        bl      _ippsCopy_16s
        ldrsh   lr, [r7, #0xA]
        ldrsh   r12, [r7, #0xC]
        ldrsh   r3, [r7, #0xE]
        ldrsh   r0, [r7, #0x10]
        ldr     r2, [pc, #0x818]
        mov     r1, #0
        mov     r10, r1
        mvn     r11, #2, 2
        str     r4, [sp, #0x40]
        str     r5, [sp, #0x3C]
        str     r6, [sp, #0x38]
LDIP49:
        ldrsh   r6, [r2]
        ldrsh   r4, [r2, #2]
        ldrsh   r5, [r2, #4]
        sub     r6, lr, r6
        ldrsh   r7, [r2, #6]
        sub     r4, r12, r4
        mov     r6, r6, lsl #16
        mov     r4, r4, lsl #16
        sub     r5, r3, r5
        mov     r6, r6, asr #16
        mul     r6, r6, r6
        mov     r4, r4, asr #16
        mov     r5, r5, lsl #16
        sub     r7, r0, r7
        mla     r6, r4, r4, r6
        mov     r5, r5, asr #16
        mov     r7, r7, lsl #16
        add     r2, r2, #8
        mov     r4, r7, asr #16
        mla     r6, r5, r5, r6
        mla     r6, r4, r4, r6
        cmp     r6, r11
        movlt   r11, r6
        movlt   r10, r1
        add     r1, r1, #1
        cmp     r1, #0x80
        blt     LDIP49
        ldr     r4, [sp, #0x40]
        ldr     r5, [sp, #0x3C]
        ldr     r6, [sp, #0x38]
        ldr     r7, [sp, #0x4C]
        cmn     r11, #7, 2
        mvngt   r11, #2, 2
        bgt     LDIP50
        cmp     r11, #3, 2
        movge   r11, r11, lsl #1
        movlt   r11, #2, 2
LDIP50:
        ldr     r0, [pc, #0x768]
        ldr     r1, [sp, #0x30]
        mov     r2, #4
        add     r0, r0, r10, lsl #3
        bl      _ippsCopy_16s
        add     r11, r9, r11
        cmp     r11, r6
        bge     LDIP51
        ldr     r3, [sp, #8]
        add     r0, sp, #0x4F, 30
        ldrsh   r0, [r0, +r5]
        mov     r6, r11
        strh    r8, [r3, #4]
        strh    r10, [r3, #6]
        strh    r0, [r3]
LDIP51:
        subs    r4, r4, #1
        add     r5, r5, #2
        bne     LDIP46
        ldr     r9, [pc, #0x714]
        ldr     r10, [sp, #0x48]
        ldr     r8, [sp, #4]
        ldr     r7, [sp]
LDIP52:
        cmp     r10, #0
        ble     LDIP56
        cmp     r10, #6
        mov     r4, #0
        movlt   r5, r4
        blt     LDIP54
        mov     r5, r4
        sub     lr, r10, #6
        mvn     r12, #2, 2
        mov     r3, r5
        str     r8, [sp, #4]
        str     r7, [sp]
LDIP53:
        add     r6, sp, #0x4F, 30
        add     r0, sp, #0x47, 30
        add     r2, r6, r4
        strh    r5, [r6, +r4]
        add     r1, r5, #1
        add     r7, r0, r3
        add     r11, r5, #2
        add     r8, r5, #3
        add     r6, r5, #4
        str     r12, [r0, +r5, lsl #2]
        add     r5, r5, #5
        cmp     r5, lr
        str     r12, [r7, #4]
        strh    r1, [r2, #2]
        str     r12, [r7, #8]
        strh    r11, [r2, #4]
        str     r12, [r7, #0xC]
        strh    r8, [r2, #6]
        str     r12, [r7, #0x10]
        strh    r6, [r2, #8]
        add     r3, r3, #0x14
        add     r4, r4, #0xA
        ble     LDIP53
        ldr     r8, [sp, #4]
        ldr     r7, [sp]
LDIP54:
        mvn     lr, #2, 2
        mov     r4, r5, lsl #1
LDIP55:
        add     r12, sp, #0x4F, 30
        add     r3, sp, #0x47, 30
        strh    r5, [r12, +r4]
        str     lr, [r3, +r5, lsl #2]
        add     r5, r5, #1
        cmp     r5, r10
        add     r4, r4, #2
        blt     LDIP55
LDIP56:
        ldr     r4, [sp, #0x44]
        ldr     r5, [pc, #0x654]
        ldrsh   r0, [r4, #0x16]
        ldrsh   r11, [r4, #0x1A]
        ldrsh   r6, [r4, #0x1C]
        ldrsh   r1, [r4, #0x1E]
        ldrsh   lr, [r4, #0x12]
        ldrsh   r12, [r4, #0x14]
        ldrsh   r3, [r4, #0x18]
        mov     r4, #0
        str     r1, [sp, #0x24]
        str     r6, [sp, #0x28]
        str     r11, [sp, #0x2C]
        str     r0, [sp, #0x34]
        str     r8, [sp, #4]
        str     r7, [sp]
LDIP57:
        ldrsh   r1, [r5]
        ldrsh   r9, [r5, #2]
        ldrsh   r0, [r5, #4]
        sub     r1, lr, r1
        ldrsh   r8, [r5, #6]
        ldrsh   r2, [r5, #8]
        mov     r1, r1, lsl #16
        ldrsh   r7, [r5, #0xA]
        ldrsh   r6, [r5, #0xC]
        ldr     r11, [sp, #0x34]
        mov     r1, r1, asr #16
        mul     r1, r1, r1
        sub     r9, r12, r9
        sub     r0, r11, r0
        mov     r9, r9, lsl #16
        mov     r0, r0, lsl #16
        sub     r8, r3, r8
        mov     r9, r9, asr #16
        mla     r1, r9, r9, r1
        mov     r0, r0, asr #16
        ldr     r9, [sp, #0x2C]
        mov     r8, r8, lsl #16
        add     r5, r5, #0x10
        mla     r1, r0, r0, r1
        sub     r9, r9, r2
        ldr     r0, [sp, #0x28]
        mov     r2, r8, asr #16
        mov     r9, r9, lsl #16
        mla     r1, r2, r2, r1
        sub     r7, r0, r7
        ldr     r2, [sp, #0x24]
        mov     r0, r9, asr #16
        mov     r7, r7, lsl #16
        mla     r1, r0, r0, r1
        sub     r6, r2, r6
        mov     r7, r7, asr #16
        mov     r2, r6, lsl #16
        cmp     r10, #0
        mla     r1, r7, r7, r1
        mov     r2, r2, asr #16
        mla     r1, r2, r2, r1
        ble     LDIP59
        mov     r2, #0
LDIP58:
        add     r0, sp, #0x47, 30
        ldr     r0, [r0, +r2, lsl #2]
        cmp     r1, r0
        blt     LDIP65
        add     r2, r2, #1
        cmp     r2, r10
        blt     LDIP58
LDIP59:
        add     r4, r4, #1
        cmp     r4, #1, 24
        blt     LDIP57
        ldr     r9, [pc, #0x534]
        ldr     r8, [sp, #4]
        ldr     r7, [sp]
        cmp     r10, #0
        ble     LDIP64
        ldr     r6, [pc, #0x530]
        ldr     r5, [pc, #0x530]
        str     r7, [sp]
        ldr     r7, [sp, #0x4C]
        mvn     r3, #2, 2
        mov     r4, #0
        str     r3, [sp, #0x44]
        str     r8, [sp, #4]
LDIP60:
        ldr     r1, [sp, #0x54]
        add     r0, sp, #0x4F, 30
        ldrsh   r0, [r0, +r4]
        mov     r3, #7
        add     r0, r6, r0, lsl #4
        mov     r2, r7
        bl      _ippsSub_16s
        ldr     r3, [sp, #0x50]
        ldr     lr, [pc, #0x4F4]
        add     r0, sp, #0xBC
        ldrsh   r1, [r3, +r0]
        ldrsh   r0, [r7, #4]
        ldrsh   r12, [r7, #2]
        mov     r8, #0
        str     r0, [sp, #0x40]
        ldrsh   r0, [r7, #8]
        ldrsh   r3, [r7, #6]
        mov     r11, r8
        str     r0, [sp, #0x3C]
        ldrsh   r2, [r7, #0xC]
        ldrsh   r0, [r7, #0xA]
        mvn     r9, #2, 2
        str     r2, [sp, #0x2C]
        str     r1, [sp, #0x30]
        str     r11, [sp, #0x34]
        str     r4, [sp, #0x38]
        str     r10, [sp, #0x48]
LDIP61:
        ldrsh   r2, [lr]
        ldr     r4, [sp, #0x30]
        ldrsh   r10, [lr, #2]
        ldrsh   r1, [lr, #4]
        ldrsh   r7, [lr, #6]
        sub     r2, r4, r2
        ldrsh   r4, [lr, #8]
        ldrsh   r6, [lr, #0xA]
        mov     r2, r2, lsl #16
        ldrsh   r5, [lr, #0xC]
        ldr     r11, [sp, #0x40]
        mov     r2, r2, asr #16
        mul     r2, r2, r2
        sub     r10, r12, r10
        sub     r1, r11, r1
        mov     r10, r10, lsl #16
        sub     r7, r3, r7
        mov     r1, r1, lsl #16
        mov     r10, r10, asr #16
        mla     r2, r10, r10, r2
        ldr     r10, [sp, #0x3C]
        mov     r1, r1, asr #16
        mov     r7, r7, lsl #16
        sub     r10, r10, r4
        mla     r2, r1, r1, r2
        mov     r4, r7, asr #16
        mov     r10, r10, lsl #16
        sub     r6, r0, r6
        mov     r1, r10, asr #16
        mla     r2, r4, r4, r2
        ldr     r4, [sp, #0x2C]
        mov     r6, r6, lsl #16
        add     lr, lr, #0x10
        sub     r5, r4, r5
        mla     r2, r1, r1, r2
        mov     r6, r6, asr #16
        mov     r4, r5, lsl #16
        mov     r4, r4, asr #16
        mla     r2, r6, r6, r2
        mla     r2, r4, r4, r2
        cmp     r2, r9
        movlt   r9, r2
        strlt   r8, [sp, #0x34]
        add     r8, r8, #1
        cmp     r8, #0x40
        blt     LDIP61
        ldr     r11, [sp, #0x34]
        ldr     r4, [sp, #0x38]
        ldr     r5, [pc, #0x3E8]
        ldr     r6, [pc, #0x3E0]
        ldr     r7, [sp, #0x4C]
        ldr     r10, [sp, #0x48]
        cmn     r9, #7, 2
        mvngt   r9, #2, 2
        bgt     LDIP62
        cmp     r9, #3, 2
        movge   r9, r9, lsl #1
        movlt   r9, #2, 2
LDIP62:
        add     r0, r5, r11, lsl #4
        mov     r2, #7
        mov     r1, r7
        bl      _ippsCopy_16s
        ldr     r0, [sp, #0x44]
        cmp     r9, r0
        bge     LDIP63
        ldr     r3, [sp, #8]
        add     r0, sp, #0x4F, 30
        str     r9, [sp, #0x44]
        ldrsh   r0, [r0, +r4]
        strh    r11, [r3, #8]
        strh    r0, [r3, #2]
LDIP63:
        subs    r10, r10, #1
        add     r4, r4, #2
        bne     LDIP60
        ldr     r9, [pc, #0x36C]
        ldr     r8, [sp, #4]
        ldr     r7, [sp]
LDIP64:
        ldr     r6, [sp, #8]
        ldr     r3, [pc, #0x360]
        mov     lr, #0xAB
        ldrsh   r12, [r6]
        orr     r4, lr, #0x2A, 24
        add     r5, r7, #0x12
        mov     r2, #9
        rsb     r12, r12, r12, lsl #2
        mov     r1, r7
        add     r0, r3, r12, lsl #3
        bl      _ippsCopy_16s
        ldr     r3, [pc, #0x344]
        ldrsh   r12, [r6, #2]
        mov     r2, #7
        mov     r1, r5
        add     r0, r3, r12, lsl #4
        bl      _ippsCopy_16s
        ldr     r3, [pc, #0x324]
        ldrsh   r12, [r6, #4]
        mov     r2, #5
        mov     r1, r7
        add     r0, r3, r12, lsl #4
        bl      _ippsAdd_16s_I
        ldrsh   r12, [r6, #6]
        ldr     r3, [pc, #0x30C]
        add     r1, r7, #0xA
        mov     r2, #4
        add     r0, r3, r12, lsl #3
        bl      _ippsAdd_16s_I
        ldrsh   r6, [r6, #8]
        ldr     r3, [pc, #0x2FC]
        mov     r1, r5
        mov     r2, #7
        add     r0, r3, r6, lsl #4
        bl      _ippsAdd_16s_I
        ldrsh   r12, [r9]
        ldrsh   r3, [r7]
        mov     r2, #0xF
        mov     r1, #0x80
        mov     r0, r7
        add     r12, r12, r3
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        strh    r12, [r7]
        ldrsh   lr, [r8]
        mul     lr, lr, r4
        add     lr, r12, lr, asr #15
        strh    lr, [r7]
        strh    r3, [r8]
        ldrsh   r12, [r9, #2]
        ldrsh   r3, [r7, #2]
        add     r12, r12, r3
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        strh    r12, [r7, #2]
        ldrsh   lr, [r8, #2]
        mul     lr, lr, r4
        add     lr, r12, lr, asr #15
        strh    lr, [r7, #2]
        strh    r3, [r8, #2]
        ldrsh   r3, [r7, #4]
        ldrsh   r12, [r9, #4]
        add     r12, r12, r3
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        strh    r12, [r7, #4]
        ldrsh   lr, [r8, #4]
        mul     lr, lr, r4
        add     lr, r12, lr, asr #15
        strh    lr, [r7, #4]
        strh    r3, [r8, #4]
        ldrsh   r12, [r9, #6]
        ldrsh   r3, [r7, #6]
        add     r12, r12, r3
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        strh    r12, [r7, #6]
        ldrsh   lr, [r8, #6]
        mul     lr, lr, r4
        add     lr, r12, lr, asr #15
        strh    lr, [r7, #6]
        strh    r3, [r8, #6]
        ldrsh   r12, [r9, #8]
        ldrsh   r3, [r7, #8]
        add     r12, r12, r3
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        strh    r12, [r7, #8]
        ldrsh   lr, [r8, #8]
        mul     lr, lr, r4
        add     lr, r12, lr, asr #15
        strh    lr, [r7, #8]
        strh    r3, [r8, #8]
        ldrsh   r12, [r9, #0xA]
        ldrsh   r3, [r7, #0xA]
        add     r12, r12, r3
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        strh    r12, [r7, #0xA]
        ldrsh   lr, [r8, #0xA]
        mul     lr, lr, r4
        add     lr, r12, lr, asr #15
        strh    lr, [r7, #0xA]
        strh    r3, [r8, #0xA]
        ldrsh   r12, [r9, #0xC]
        ldrsh   r3, [r7, #0xC]
        add     r12, r12, r3
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        strh    r12, [r7, #0xC]
        ldrsh   lr, [r8, #0xC]
        mul     lr, lr, r4
        add     lr, r12, lr, asr #15
        strh    lr, [r7, #0xC]
        strh    r3, [r8, #0xC]
        ldrsh   r12, [r9, #0xE]
        ldrsh   r3, [r7, #0xE]
        add     r12, r12, r3
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        strh    r12, [r7, #0xE]
        ldrsh   lr, [r8, #0xE]
        mul     lr, lr, r4
        add     lr, r12, lr, asr #15
        strh    lr, [r7, #0xE]
        strh    r3, [r8, #0xE]
        ldrsh   r12, [r9, #0x10]
        ldrsh   r3, [r7, #0x10]
        add     r12, r12, r3
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        strh    r12, [r7, #0x10]
        ldrsh   lr, [r8, #0x10]
        mul     lr, lr, r4
        add     lr, r12, lr, asr #15
        strh    lr, [r7, #0x10]
        strh    r3, [r8, #0x10]
        ldrsh   r12, [r9, #0x12]
        ldrsh   r3, [r7, #0x12]
        add     r12, r12, r3
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        strh    r12, [r7, #0x12]
        ldrsh   lr, [r8, #0x12]
        mul     lr, lr, r4
        add     lr, r12, lr, asr #15
        strh    lr, [r7, #0x12]
        strh    r3, [r8, #0x12]
        ldrsh   r3, [r7, #0x14]
        ldrsh   r12, [r9, #0x14]
        add     r12, r12, r3
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        strh    r12, [r7, #0x14]
        ldrsh   lr, [r8, #0x14]
        mul     lr, lr, r4
        add     lr, r12, lr, asr #15
        strh    lr, [r7, #0x14]
        strh    r3, [r8, #0x14]
        ldrsh   r3, [r7, #0x16]
        ldrsh   r12, [r9, #0x16]
        add     r12, r12, r3
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        strh    r12, [r7, #0x16]
        ldrsh   lr, [r8, #0x16]
        mul     lr, lr, r4
        add     lr, r12, lr, asr #15
        strh    lr, [r7, #0x16]
        strh    r3, [r8, #0x16]
        ldrsh   r12, [r9, #0x18]
        ldrsh   r3, [r7, #0x18]
        add     r12, r12, r3
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        strh    r12, [r7, #0x18]
        ldrsh   lr, [r8, #0x18]
        mul     lr, lr, r4
        add     lr, r12, lr, asr #15
        strh    lr, [r7, #0x18]
        strh    r3, [r8, #0x18]
        ldrsh   r12, [r9, #0x1A]
        ldrsh   r3, [r7, #0x1A]
        add     r12, r12, r3
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        strh    r12, [r7, #0x1A]
        ldrsh   lr, [r8, #0x1A]
        mul     lr, lr, r4
        add     lr, r12, lr, asr #15
        strh    lr, [r7, #0x1A]
        strh    r3, [r8, #0x1A]
        ldrsh   r12, [r9, #0x1C]
        ldrsh   r3, [r7, #0x1C]
        add     r12, r12, r3
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        strh    r12, [r7, #0x1C]
        ldrsh   lr, [r8, #0x1C]
        mul     lr, lr, r4
        add     lr, r12, lr, asr #15
        strh    lr, [r7, #0x1C]
        strh    r3, [r8, #0x1C]
        ldrsh   r9, [r9, #0x1E]
        ldrsh   r3, [r7, #0x1E]
        add     r9, r9, r3
        mov     r9, r9, lsl #16
        mov     r12, r9, asr #16
        strh    r12, [r7, #0x1E]
        ldrsh   lr, [r8, #0x1E]
        mul     r4, lr, r4
        add     r4, r12, r4, asr #15
        strh    r4, [r7, #0x1E]
        strh    r3, [r8, #0x1E]
        bl      ReorderLsf
        add     sp, sp, #0x51, 30
        ldmia   sp!, {r4 - r11, pc}
        .long   0xea000005
        .long   meanISFTbl
        .long   QCdbk1ISFTbl
        .long   QCdbk21ISF36bTbl
        .long   QCdbk22ISF36bTbl
        .long   QCdbk2ISFTbl
        .long   QCdbk23ISF36bTbl
LDIP65:
        ldr     r0, [sp, #0x58]
        cmp     r0, r2
        ble     LDIP69
        ldr     r6, [sp, #0x58]
        sub     r6, r6, r2
        cmp     r6, #6
        blt     LDIP67
        add     r8, r2, #6
        mov     r7, r0, lsl #2
        mov     r6, r0, lsl #1
        str     r8, [sp, #0x18]
        str     r2, [sp, #0x1C]
        str     r1, [sp, #0x20]
        str     r3, [sp, #0x30]
        str     r12, [sp, #0x38]
        str     lr, [sp, #0x3C]
        str     r4, [sp, #0x44]
        str     r5, [sp, #0x40]
        str     r10, [sp, #0x48]
LDIP66:
        add     r3, sp, #0x47, 30
        add     r10, r3, r7
        ldr     r1, [r10, #-8]
        ldr     r2, [r10, #-4]
        add     r12, sp, #0x4F, 30
        str     r1, [sp, #0xB8]
        add     r1, r12, r6
        ldrsh   r12, [r1, #-2]
        sub     r7, r7, #0x14
        str     r12, [sp, #0xB4]
        str     r2, [r3, +r0, lsl #2]
        ldr     r2, [sp, #0xB4]
        ldrsh   r12, [r1, #-4]
        ldr     lr, [r10, #-0xC]
        ldrsh   r4, [r1, #-6]
        ldr     r5, [r10, #-0x10]
        ldrsh   r8, [r1, #-8]
        ldr     r9, [r10, #-0x14]
        ldrsh   r11, [r1, #-0xA]
        add     r3, sp, #0x4F, 30
        strh    r2, [r3, +r6]
        ldr     r2, [sp, #0x18]
        sub     r0, r0, #5
        sub     r6, r6, #0xA
        cmp     r0, r2
        ldr     r2, [sp, #0xB8]
        strh    r12, [r1, #-2]
        str     lr, [r10, #-8]
        strh    r4, [r1, #-4]
        str     r2, [r10, #-4]
        str     r5, [r10, #-0xC]
        strh    r8, [r1, #-6]
        str     r9, [r10, #-0x10]
        strh    r11, [r1, #-8]
        bgt     LDIP66
        ldr     r2, [sp, #0x1C]
        ldr     r1, [sp, #0x20]
        ldr     r3, [sp, #0x30]
        ldr     r12, [sp, #0x38]
        ldr     lr, [sp, #0x3C]
        ldr     r4, [sp, #0x44]
        ldr     r5, [sp, #0x40]
        ldr     r10, [sp, #0x48]
LDIP67:
        mov     r7, r0, lsl #2
        mov     r6, r0, lsl #1
        str     r10, [sp, #0x48]
LDIP68:
        add     r9, sp, #0x47, 30
        add     r8, r9, r7
        add     r10, sp, #0x4F, 30
        ldr     r8, [r8, #-4]
        add     r11, r10, r6
        ldrsh   r11, [r11, #-2]
        str     r8, [r9, +r0, lsl #2]
        sub     r0, r0, #1
        strh    r11, [r10, +r6]
        cmp     r0, r2
        sub     r7, r7, #4
        sub     r6, r6, #2
        bgt     LDIP68
        ldr     r10, [sp, #0x48]
LDIP69:
        add     r7, sp, #0x47, 30
        add     r6, sp, #0x4F, 30
        mov     r0, r2, lsl #1
        str     r1, [r7, +r2, lsl #2]
        strh    r4, [r6, +r0]
        b       LDIP59
LDIP70:
        ldr     r1, [sp, #0x58]
        cmp     r1, r5
        ble     LDIP74
        ldr     r2, [sp, #0x58]
        sub     r2, r2, r5
        cmp     r2, #6
        blt     LDIP72
        add     r6, r5, #6
        mov     lr, r1, lsl #2
        mov     r2, r1, lsl #1
        str     r6, [sp, #0xC]
        str     r5, [sp, #0x10]
        str     r4, [sp, #0x14]
        str     r3, [sp, #0x1C]
        str     r12, [sp, #0x20]
        str     r10, [sp, #0x48]
LDIP71:
        add     r3, sp, #0x4B, 30
        add     r10, r3, lr
        ldr     r4, [r10, #-8]
        ldr     r12, [r10, #-4]
        add     r0, sp, #0x4F, 30
        str     r4, [sp, #0xB8]
        add     r0, r0, r2
        ldrsh   r4, [r0, #-2]
        sub     lr, lr, #0x14
        str     r4, [sp, #0xB4]
        str     r12, [r3, +r1, lsl #2]
        ldr     r12, [sp, #0xB4]
        ldrsh   r4, [r0, #-4]
        ldr     r5, [r10, #-0xC]
        ldrsh   r6, [r0, #-6]
        ldr     r7, [r10, #-0x10]
        ldrsh   r8, [r0, #-8]
        ldr     r9, [r10, #-0x14]
        ldrsh   r11, [r0, #-0xA]
        add     r3, sp, #0x4F, 30
        strh    r12, [r3, +r2]
        ldr     r3, [sp, #0xC]
        sub     r1, r1, #5
        sub     r2, r2, #0xA
        cmp     r1, r3
        ldr     r3, [sp, #0xB8]
        strh    r4, [r0, #-2]
        str     r5, [r10, #-8]
        strh    r6, [r0, #-4]
        str     r3, [r10, #-4]
        str     r7, [r10, #-0xC]
        strh    r8, [r0, #-6]
        str     r9, [r10, #-0x10]
        strh    r11, [r0, #-8]
        bgt     LDIP71
        ldr     r5, [sp, #0x10]
        ldr     r4, [sp, #0x14]
        ldr     r3, [sp, #0x1C]
        ldr     r12, [sp, #0x20]
        ldr     r0, [sp, #0x2C]
        ldr     r10, [sp, #0x48]
LDIP72:
        mov     lr, r1, lsl #2
        mov     r2, r1, lsl #1
LDIP73:
        add     r7, sp, #0x4B, 30
        add     r8, r7, lr
        add     r6, sp, #0x4F, 30
        ldr     r8, [r8, #-4]
        add     r9, r6, r2
        ldrsh   r9, [r9, #-2]
        str     r8, [r7, +r1, lsl #2]
        sub     r1, r1, #1
        strh    r9, [r6, +r2]
        cmp     r1, r5
        sub     lr, lr, #4
        sub     r2, r2, #2
        bgt     LDIP73
LDIP74:
        add     lr, sp, #0x4B, 30
        add     r2, sp, #0x4F, 30
        mov     r1, r5, lsl #1
        str     r4, [lr, +r5, lsl #2]
        strh    r3, [r2, +r1]
        b       LDIP45


