        .text
        .align  4
        .globl  _ippsPitchPredictor_G723_16s


_ippsPitchPredictor_G723_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x44
        ldr     r9, [sp, #0x70]
        ldr     r12, [sp, #0x68]
        ldr     r7, [sp, #0x6C]
        mov     r11, r0
        mov     r10, r1
        add     r6, r9, #0xA0
        mov     r1, #5, 26
        mov     r0, r6
        and     r5, r12, #1
        mov     r8, r2
        mov     r4, r3
        bl      _ippsZero_16s
        add     lr, r5, #3
        cmp     lr, #0
        add     r0, r9, #0x33, 28
        add     r12, r9, #8
        ble     LDRC11
        sub     r2, r4, #1
        add     r1, r9, #0x10
        mov     r3, r0
        str     r7, [sp, #0x24]
        str     r8, [sp, #0x28]
        str     r10, [sp, #0x40]
        str     r11, [sp, #0x2C]
        add     r5, r5, #3
        add     r4, r9, #0xD1, 30
        str     r1, [sp, #0xC]
        str     r12, [sp, #0x10]
        str     r0, [sp, #0x14]
        str     lr, [sp, #0x1C]
        mov     r7, r2
        mov     r8, r3
        mov     r10, #0x40
        mov     r11, #0x3C
LDRC0:
        mov     r2, r7
        ldr     r1, [sp, #0x10]
        ldr     r0, [sp, #0x28]
        bl      _ippsExcitationDelay_G723_16s
        str     r5, [sp, #0x34]
        str     r6, [sp, #0x18]
        ldr     r5, [sp, #0xC]
        ldr     r6, [sp, #0x40]
        mov     r12, #0
        add     r1, r9, #0x2A, 28
        str     r4, [sp, #0x38]
        str     r8, [sp, #0x3C]
        str     r7, [sp, #8]
        str     r9, [sp, #0x20]
LDRC1:
        cmp     r12, #0
        movlt   r0, #0
        blt     LDRC5
        cmp     r12, #6
        blt     LDRC15
        mov     r3, #0
        mov     r0, r3
        add     r2, r6, r12, lsl #1
        sub     r4, r12, #6
        mov     lr, r5
        str     r12, [sp, #0x30]
LDRC2:
        rsb     r12, r3, #0
        ldrsh   r11, [lr]
        ldrsh   r7, [lr, #2]
        ldrsh   r6, [lr, #4]
        ldrsh   r9, [lr, #6]
        ldrsh   r8, [lr, #8]
        mov     r12, r12, lsl #1
        ldrsh   r10, [r2, +r12]
        mvn     r12, #0
        rsb     r12, r3, r12
        mvn     r5, #1
        mla     r0, r11, r10, r0
        mov     r12, r12, lsl #1
        ldrsh   r10, [r2, +r12]
        rsb     r5, r3, r5
        mvn     r12, #2
        mla     r0, r7, r10, r0
        mov     r5, r5, lsl #1
        ldrsh   r5, [r2, +r5]
        rsb     r7, r3, r12
        mvn     r12, #3
        mla     r0, r6, r5, r0
        mov     r7, r7, lsl #1
        ldrsh   r5, [r2, +r7]
        rsb     r12, r3, r12
        add     lr, lr, #0xA
        mla     r0, r9, r5, r0
        mov     r12, r12, lsl #1
        ldrsh   r12, [r2, +r12]
        add     r3, r3, #5
        cmp     r3, r4
        mla     r0, r8, r12, r0
        ble     LDRC2
        ldr     r12, [sp, #0x30]
        ldr     r5, [sp, #0xC]
        ldr     r6, [sp, #0x40]
LDRC3:
        add     r4, r5, r3, lsl #1
LDRC4:
        rsb     r7, r3, #0
        ldrsh   lr, [r4], #2
        mov     r7, r7, lsl #1
        ldrsh   r7, [r2, +r7]
        add     r3, r3, #1
        cmp     r3, r12
        mla     r0, lr, r7, r0
        ble     LDRC4
LDRC5:
        add     r0, r0, #1, 18
        add     r12, r12, #1
        mov     r0, r0, asr #15
        strh    r0, [r1], #2
        cmp     r12, #0x3C
        blt     LDRC1
        ldr     r6, [sp, #0x18]
        ldr     r9, [sp, #0x20]
        ldr     r7, [sp, #8]
        ldr     r5, [sp, #0x34]
        ldr     r4, [sp, #0x38]
        ldr     r8, [sp, #0x3C]
        str     r6, [sp, #0x18]
        ldr     r6, [sp, #0x40]
        mov     r10, #0x40
        mov     r11, #0x3C
        mov     lr, #3
        add     r12, r9, #0xE
        add     r1, r9, #0x22, 28
        str     r7, [sp, #8]
        str     r9, [sp, #0x20]
LDRC6:
        ldrsh   r0, [r12], #-2
        mov     r10, #1
        mov     r7, r0, lsl #13
        add     r11, r7, #1, 18
        mov     r9, r1
        add     r7, r6, #2
        mov     r11, r11, asr #15
        strh    r11, [r1]
LDRC7:
        ldrsh   r3, [r7]
        ldrsh   r11, [r9, #0x80]
        ldrsh   r2, [r9, #0x82]
        mul     r3, r0, r3
        add     r10, r10, #2
        cmp     r10, #0x3A
        add     r3, r3, #1, 18
        add     r3, r11, r3, asr #15
        strh    r3, [r9, #2]
        ldrsh   r11, [r7, #2]
        add     r7, r7, #4
        mul     r11, r0, r11
        add     r11, r11, #1, 18
        add     r11, r2, r11, asr #15
        strh    r11, [r9, #4]!
        blt     LDRC7
        mov     r10, r10, lsl #1
        ldrsh   r9, [r6, +r10]
        add     r7, r1, r10
        ldrsh   r7, [r7, #0x7E]
        mul     r9, r0, r9
        subs    lr, lr, #1
        add     r0, r9, #1, 18
        add     r0, r7, r0, asr #15
        strh    r0, [r1, +r10]
        sub     r1, r1, #0x80
        bpl     LDRC6
        ldr     r6, [sp, #0x18]
        ldr     r7, [sp, #8]
        ldr     r9, [sp, #0x20]
        mov     r10, #0x40
        mov     r11, #0x3C
        str     r10, [sp, #4]
        str     r11, [sp]
        ldr     r2, [sp, #0x2C]
        mov     r3, r8
        mov     r1, #5
        mov     r0, r6
        bl      _ippsMul_D2D1Step_16s32s
        mov     r0, r6
        mov     r3, #0x40
        mov     r2, r4
        mov     r1, #5
        bl      _ippsMul_D2_16s32s
        mov     r1, #0
        add     r12, r8, #0x28
LDRC8:
        ldr     lr, [r12]
        cmn     lr, #7, 2
        mvngt   lr, #2, 2
        bgt     LDRC9
        cmp     lr, #3, 2
        movge   lr, lr, lsl #1
        movlt   lr, #2, 2
LDRC9:
        ldr     r0, [r12, #4]
        str     lr, [r12]
        cmn     r0, #7, 2
        mvngt   r0, #2, 2
        bgt     LDRC10
        cmp     r0, #3, 2
        movge   r0, r0, lsl #1
        movlt   r0, #2, 2
LDRC10:
        add     r1, r1, #2
        str     r0, [r12, #4]
        cmp     r1, #0xA
        add     r12, r12, #8
        blt     LDRC8
        subs    r5, r5, #1
        add     r7, r7, #1
        add     r8, r8, #0x50
        add     r4, r4, #0x50
        bne     LDRC0
        ldr     r0, [sp, #0x14]
        ldr     lr, [sp, #0x1C]
        ldr     r7, [sp, #0x24]
LDRC11:
        add     lr, lr, lr, lsl #2
        mov     r2, lr, lsl #2
        cmp     r2, #0
        ble     LDRC14
        mvn     r3, #2, 2
        mov     lr, r0
        mov     r12, r2
LDRC12:
        ldr     r4, [lr]
        cmn     r4, #7, 2
        movgt   r4, r3
        bgt     LDRC13
        cmp     r4, #3, 2
        movge   r4, r4, lsl #1
        movlt   r4, #2, 2
LDRC13:
        str     r4, [lr], #4
        subs    r12, r12, #1
        bne     LDRC12
LDRC14:
        mov     r1, r7
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, lr}
        b       ownAutoScale_NR_32s16s
LDRC15:
        mov     r3, #0
        mov     r0, r3
        add     r2, r6, r12, lsl #1
        b       LDRC3


