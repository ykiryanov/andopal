        .text
        .align  4
        .globl  _ippsACELPFixedCodebookSearch_G723_32s16s


_ippsACELPFixedCodebookSearch_G723_32s16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1E, 28
        add     r5, sp, #0x17, 28
        add     lr, sp, #7, 26
        and     r5, r5, #0xF
        and     r7, lr, #0xF
        rsb     r8, r5, #0
        ldr     r5, [sp, #0x204]
        add     r12, sp, #0xE0
        and     lr, r12, #0xF
        and     r8, r8, #0xF
        add     r6, sp, #0x17, 28
        rsb     r7, r7, #0
        rsb     lr, lr, #0
        add     r8, r6, r8
        ldr     r6, [sp, #0x20C]
        add     r4, sp, #7, 26
        str     r5, [sp, #0xA4]
        ldr     r5, [sp, #0x208]
        and     r7, r7, #0xF
        str     r2, [sp, #0x9C]
        add     r12, sp, #0xE0
        and     lr, lr, #0xF
        add     r2, r4, r7
        cmp     r0, #0
        str     r7, [sp, #0x14]
        str     r8, [sp, #0xA8]
        str     r1, [sp, #0x2C]
        str     r3, [sp, #0xA0]
        add     r4, r12, lr
        beq     LDVM18
        ldr     r1, [sp, #0x2C]
        cmp     r1, #0
        beq     LDVM18
        ldr     r1, [sp, #0x9C]
        cmp     r1, #0
        beq     LDVM18
        ldr     r1, [sp, #0xA0]
        cmp     r1, #0
        beq     LDVM18
        ldr     r1, [sp, #0xA4]
        cmp     r1, #0
        beq     LDVM18
        cmp     r5, #0
        beq     LDVM18
        cmp     r6, #0
        beq     LDVM18
        mov     r1, #0
        strh    r1, [r4, #0x7E]
        strh    r1, [r4, #0x7C]
        strh    r1, [r4, #0x7A]
        strh    r1, [r4, #0x78]
        add     r7, r4, #2
        str     r7, [sp, #0x28]
        ldr     r8, [sp, #0x28]
        ldr     r9, [sp, #0xA8]
        add     r3, r0, #2
        str     r5, [sp, #0x10]
LDVM0:
        mov     r7, r1, lsl #1
        ldrsh   r10, [r3, +r7]
        ldrsh   r11, [r0, +r7]
        rsb     r5, r10, #0
        cmp     r11, r5
        bge     LDVM1
        rsb     r11, r11, #0
        strh    r11, [r4, +r7]
        strh    r5, [r8, +r7]
        mvn     r5, #0
        b       LDVM2
LDVM1:
        strh    r11, [r4, +r7]
        strh    r10, [r8, +r7]
        mov     r5, #1
LDVM2:
        add     r7, r1, #2
        bic     r1, r1, #1
        mov     r7, r7, lsl #16
        strh    r5, [r1, +r9]
        mov     r1, r7, asr #16
        cmp     r1, #0x3C
        blt     LDVM0
        str     r8, [sp, #0x28]
        ldr     r3, [sp, #0x14]
        ldr     r5, [sp, #0x10]
        ldrsh   r12, [lr, +r12]
        add     r1, sp, #7, 26
        ldrsh   r7, [r4, #2]
        strh    r12, [r3, +r1]
        ldr     r10, [sp, #0xA8]
        ldrsh   r8, [r4, #4]
        ldrsh   lr, [r4, #6]
        ldrsh   r1, [r4, #8]
        ldrsh   r12, [r4, #0xA]
        ldrsh   r9, [r4, #0xC]
        ldrsh   r3, [r4, #0xE]
        mov     r11, #1
        strh    r11, [r10, #0x3E]
        strh    r11, [r10, #0x3C]
        strh    r7, [r2, #2]
        add     r10, r4, #4
        str     r10, [sp, #0x20]
        strh    r8, [r2, #4]
        add     r10, r4, #6
        str     r10, [sp, #0x24]
        strh    lr, [r2, #6]
        add     r10, r4, #8
        str     r10, [sp, #0x1C]
        strh    r1, [r2, #8]
        add     r10, r4, #0xA
        str     r10, [sp, #0x18]
        strh    r12, [r2, #0xA]
        strh    r9, [r2, #0xC]
        strh    r3, [r2, #0xE]
        add     r11, r4, #0x10
        str     r4, [sp, #0x30]
        ldr     r4, [sp, #0x14]
        mov     r10, #7
        str     r6, [sp, #0xC]
        str     r5, [sp, #0x10]
        add     r0, sp, #7, 26
LDVM3:
        ldrsh   r5, [r4, +r0]
        ldrsh   r6, [r11]
        cmp     r6, r5
        ble     LDVM4
        strh    r6, [r4, +r0]
        ldrsh   r7, [r2, #2]
        ldrsh   r8, [r2, #4]
        ldrsh   lr, [r2, #6]
        ldrsh   r1, [r2, #8]
        ldrsh   r12, [r2, #0xA]
        ldrsh   r9, [r2, #0xC]
        ldrsh   r3, [r2, #0xE]
LDVM4:
        ldrsh   r5, [r11, #2]
        cmp     r5, r7
        movgt   r7, r5
        strgth  r5, [r2, #2]
        ldrsh   r5, [r11, #4]
        cmp     r5, r8
        movgt   r8, r5
        strgth  r5, [r2, #4]
        ldrsh   r5, [r11, #6]
        cmp     r5, lr
        movgt   lr, r5
        strgth  r5, [r2, #6]
        ldrsh   r5, [r11, #8]
        cmp     r5, r1
        movgt   r1, r5
        strgth  r5, [r2, #8]
        ldrsh   r5, [r11, #0xA]
        cmp     r5, r12
        movgt   r12, r5
        strgth  r5, [r2, #0xA]
        ldrsh   r5, [r11, #0xC]
        cmp     r5, r9
        movgt   r9, r5
        strgth  r5, [r2, #0xC]
        ldrsh   r5, [r11, #0xE]
        cmp     r5, r3
        movgt   r3, r5
        strgth  r5, [r2, #0xE]
        subs    r10, r10, #1
        add     r11, r11, #0x10
        bne     LDVM3
        ldr     r3, [sp, #0x14]
        ldr     r4, [sp, #0x30]
        ldr     r6, [sp, #0xC]
        ldr     r5, [sp, #0x10]
        add     r2, sp, #7, 26
        ldrsh   r9, [r3, +r2]
        ldr     r10, [sp, #0x1C]
        ldr     r11, [sp, #0x20]
        str     r7, [sp, #8]
        add     r8, r9, r8
        ldr     r7, [sp, #0x28]
        ldr     r9, [sp, #0x18]
        add     r8, r8, r1
        mov     r3, #0
        mov     r2, r3
        mov     r8, r8, lsl #16
        mov     r1, r2
        str     r8, [sp, #0x14]
        str     r12, [sp]
        str     lr, [sp, #4]
        str     r6, [sp, #0xC]
        str     r5, [sp, #0x10]
LDVM5:
        ldr     r0, [sp, #0x24]
        mov     r12, r3, lsl #1
        ldrsh   lr, [r4, +r12]
        ldrsh   r5, [r11, +r12]
        ldrsh   r8, [r10, +r12]
        ldrsh   r6, [r7, +r12]
        ldrsh   r0, [r0, +r12]
        ldrsh   r12, [r9, +r12]
        add     r3, r3, #8
        add     r5, lr, r5
        add     r2, r8, r2
        mov     r3, r3, lsl #16
        add     r1, r12, r1
        add     r0, r6, r0
        mov     r3, r3, asr #16
        cmp     r3, #0x3C
        add     r2, r5, r2
        add     r1, r0, r1
        blt     LDVM5
        str     r7, [sp, #0x28]
        ldr     lr, [sp, #4]
        ldr     r7, [sp, #8]
        ldr     r12, [sp]
        ldr     r6, [sp, #0xC]
        ldr     r5, [sp, #0x10]
        mov     r3, r2, asr #3
        mov     r2, r1, asr #3
        add     lr, r7, lr
        mov     r1, r3, lsl #16
        add     r12, lr, r12
        ldr     r7, [sp, #0x2C]
        mov     r2, r2, lsl #16
        mov     r3, r12, lsl #16
        ldr     r12, [sp, #0x14]
        mov     r1, r1, asr #16
        mov     r2, r2, asr #16
        rsb     r3, r2, r3, asr #16
        rsb     r12, r1, r12, asr #16
        add     r0, r7, #0x80
        mov     r3, r3, lsl #14
        mov     r12, r12, lsl #14
        add     r3, r2, r3, asr #15
        add     r12, r1, r12, asr #15
        mov     r1, r3, lsl #16
        mov     r12, r12, lsl #16
        mov     r2, r12, asr #16
        mov     r3, r1, asr #16
        ldr     r1, [sp, #0xA8]
        cmp     r3, r2
        movgt   r2, r3
        str     r2, [sp, #0x14]
        bl      LDVM_ownFixedCodebookSearchCorrSign_G723_16s
        ldrsh   r2, [r6]
        mov     r1, #0
        str     r1, [sp, #4]
        mov     r12, r1
        add     lr, r2, #0x78
        mov     r3, r12
        mov     r8, lr, lsl #16
        mov     r2, r3
        mvn     lr, #0
        mov     r9, r8, asr #16
        add     r10, lr, #2, 18
        mov     r11, r2
        str     r11, [sp, #8]
        str     r10, [sp, #0xC4]
        str     r9, [sp, #0xAC]
        str     r6, [sp, #0xC]
        str     r5, [sp, #0x10]
        ldr     r5, [sp, #0x28]
        ldr     r6, [sp, #4]
        ldr     r9, [sp, #0x24]
        ldr     r10, [sp, #0x20]
        ldr     r11, [sp, #0x2C]
        add     r8, r7, #0x20
        str     r2, [sp, #0xC0]
        mov     lr, r4
        str     r2, [sp, #0xBC]
        str     r3, [sp, #0xB8]
        str     r12, [sp, #0xB4]
        str     r1, [sp, #0xB0]
        str     r4, [sp, #0x30]
LDVM6:
        ldrsh   r0, [lr], #0x10
        ldr     r2, [r7], #4
        add     r1, r6, #4
        str     r0, [sp, #0xDC]
        ldrsh   r4, [r5], #0x10
        mov     r0, r1, lsl #3
        mov     r3, r2, asr #15
        add     r2, r0, #0x80
        add     r0, r0, #0x40
        add     r0, r11, r0, lsl #2
        str     r0, [sp, #0xD0]
        add     r0, r11, r1, lsl #5
        add     r1, r11, #0x40
        str     r1, [sp, #0xCC]
        mov     r3, r3, lsl #16
        add     r2, r11, r2, lsl #2
        add     r1, r11, #0x60
        str     r3, [sp, #0xD8]
        str     r2, [sp, #0xD4]
        str     r1, [sp, #0xC8]
        mov     r12, #0
        mov     r1, r10
        mov     r2, r9
        mov     r3, r8
        str     r4, [sp, #0x60]
        str     lr, [sp, #0x64]
        str     r5, [sp, #0x28]
        str     r7, [sp, #0x68]
        str     r8, [sp, #0x6C]
        str     r6, [sp, #4]
LDVM7:
        ldr     r4, [r3], #4
        ldr     r5, [sp, #0xD8]
        ldrsh   r8, [r1], #0x10
        ldr     r9, [sp, #0xDC]
        ldr     r6, [r0], #4
        ldrsh   r7, [r2], #0x10
        mov     r4, r4, asr #15
        add     lr, r12, #4
        add     r5, r4, r5, asr #16
        add     r11, r9, r8
        ldr     r8, [sp, #0x60]
        mov     lr, lr, lsl #3
        add     r9, r5, r6, lsl #1
        ldr     r5, [sp, #0x2C]
        add     r4, lr, #1, 24
        add     r7, r8, r7
        ldr     r6, [sp, #0x18]
        add     lr, lr, #0xC0
        add     r8, r5, r4, lsl #2
        add     r10, r5, lr, lsl #2
        ldr     r5, [sp, #0x1C]
        ldr     lr, [sp, #0xCC]
        ldr     r4, [sp, #0xD0]
        str     r7, [sp, #0x74]
        str     r8, [sp, #0x44]
        str     r9, [sp, #0x40]
        ldr     r8, [sp, #0x74]
        ldr     r9, [sp, #0x14]
        mov     r7, #0
        str     r1, [sp, #0x50]
        str     r2, [sp, #0x54]
        str     r3, [sp, #0x58]
        str     r0, [sp, #0x5C]
        str     r12, [sp, #0x48]
LDVM8:
        ldrsh   r1, [r5], #0x10
        ldrsh   r0, [r6], #0x10
        add     r1, r11, r1
        add     r0, r8, r0
        mov     r1, r1, lsl #16
        mov     r12, r1, asr #16
        mov     r0, r0, lsl #16
        mov     r1, r0, asr #16
        cmp     r1, r12
        movle   r0, #0
        movgt   r0, #1
        movgt   r12, r1
        cmp     r12, r9
        ble     LDVM12
        ldr     r3, [r10]
        ldr     r1, [lr]
        ldr     r2, [r4]
        str     r3, [sp, #0x94]
        add     r3, r7, #4
        str     r3, [sp, #0x4C]
        ldr     r3, [sp, #0x40]
        ldr     r8, [sp, #0xC4]
        ldr     r9, [sp, #8]
        add     r1, r3, r1, asr #15
        add     r2, r1, r2, lsl #1
        str     r2, [sp, #0x3C]
        ldr     r2, [sp, #0x30]
        ldr     r1, [sp, #0x4C]
        ldr     r3, [sp, #0x3C]
        add     r2, r2, r0, lsl #1
        str     r2, [sp, #0x38]
        mov     r1, r1, lsl #3
        add     r2, r1, #5, 26
        ldr     r1, [sp, #0x94]
        str     lr, [sp, #0x90]
        str     r4, [sp, #0x8C]
        add     r1, r3, r1, lsl #1
        mov     r3, #0
        str     r3, [sp, #0x3C]
        ldr     r3, [sp, #0x2C]
        str     r1, [sp, #0x4C]
        ldr     r1, [sp, #0x38]
        add     r2, r3, r2, lsl #2
        ldr     r3, [sp, #0xD4]
        str     r2, [sp]
        ldr     r2, [sp, #0xC8]
        add     r1, r1, #0xC
        str     r3, [sp, #0x34]
        str     r1, [sp, #0x38]
        ldr     r3, [sp, #0x44]
        str     r10, [sp, #0x88]
        str     r0, [sp, #0x84]
        str     r5, [sp, #0x80]
        str     r7, [sp, #0x78]
        ldr     r10, [sp, #0x38]
        ldr     r7, [sp, #0x34]
        ldr     r5, [sp]
        ldr     r0, [sp, #0x3C]
        mvn     r1, #0
        str     r1, [sp, #0x94]
        str     r12, [sp, #0x98]
        str     r6, [sp, #0x7C]
        str     r11, [sp, #0x70]
LDVM9:
        ldr     r1, [sp, #0x98]
        ldrsh   lr, [r10], #0x10
        ldr     r6, [r2], #4
        ldr     r11, [sp, #0x4C]
        ldr     r12, [r7], #4
        add     r1, r1, lr
        ldr     lr, [r3], #4
        ldr     r4, [r5], #4
        mov     r1, r1, lsl #16
        add     r6, r11, r6, asr #15
        add     r12, r6, r12, lsl #1
        mov     r1, r1, asr #16
        mul     r1, r1, r1
        add     lr, r12, lr, lsl #1
        add     r4, lr, r4, lsl #1
        mov     r1, r1, asr #15
        mov     r12, r4, asr #4
        mov     r1, r1, lsl #16
        mov     lr, r12, lsl #16
        mov     r1, r1, asr #16
        mul     r12, r8, r1
        mov     lr, lr, asr #16
        mul     r4, r9, lr
        cmp     r12, r4
        ble     LDVM10
        mov     r9, r1
        mov     r8, lr
        str     r0, [sp, #0x94]
LDVM10:
        add     r0, r0, #1
        cmp     r0, #8
        blt     LDVM9
        ldr     r1, [sp, #0x94]
        str     r8, [sp, #0xC4]
        str     r9, [sp, #8]
        ldr     lr, [sp, #0x90]
        ldr     r4, [sp, #0x8C]
        ldr     r10, [sp, #0x88]
        ldr     r0, [sp, #0x84]
        ldr     r5, [sp, #0x80]
        ldr     r6, [sp, #0x7C]
        ldr     r7, [sp, #0x78]
        ldr     r8, [sp, #0x74]
        ldr     r11, [sp, #0x70]
        ldr     r9, [sp, #0x14]
        cmp     r1, #0
        blt     LDVM11
        ldr     r2, [sp, #4]
        str     r7, [sp, #0xB8]
        str     r2, [sp, #0xB0]
        ldr     r2, [sp, #0x48]
        str     r2, [sp, #0xB4]
        str     r1, [sp, #0xBC]
        str     r0, [sp, #0xC0]
LDVM11:
        ldr     r0, [sp, #0xAC]
        sub     r0, r0, #1
        str     r0, [sp, #0xAC]
        mov     r0, r0, lsl #16
        cmp     r0, #0
        ble     LDVM17
LDVM12:
        add     r7, r7, #1
        cmp     r7, #8
        add     lr, lr, #4
        add     r4, r4, #4
        add     r10, r10, #4
        blt     LDVM8
        ldr     r12, [sp, #0x48]
        ldr     r1, [sp, #0x50]
        ldr     r2, [sp, #0x54]
        ldr     r3, [sp, #0x58]
        ldr     r0, [sp, #0x5C]
        add     r12, r12, #1
        cmp     r12, #8
        blt     LDVM7
        ldr     r6, [sp, #4]
        ldr     lr, [sp, #0x64]
        ldr     r5, [sp, #0x28]
        ldr     r7, [sp, #0x68]
        ldr     r8, [sp, #0x6C]
        ldr     r9, [sp, #0x24]
        ldr     r10, [sp, #0x20]
        ldr     r11, [sp, #0x2C]
        add     r6, r6, #1
        cmp     r6, #8
        blt     LDVM6
        ldr     r2, [sp, #0xBC]
        ldr     r3, [sp, #0xB8]
        ldr     r12, [sp, #0xB4]
        ldr     r1, [sp, #0xB0]
        ldr     r9, [sp, #0xAC]
        ldr     r6, [sp, #0xC]
        ldr     r5, [sp, #0x10]
LDVM13:
        strh    r9, [r6]
        mov     r6, r1, lsl #3
        ldr     r1, [sp, #0xA8]
        mov     r12, r12, lsl #3
        mov     r3, r3, lsl #3
        mov     r4, r2, lsl #3
        str     r12, [sp, #8]
        str     r3, [sp, #0xC]
        bic     r2, r6, #1
        ldrsh   r7, [r2, +r1]
        add     r10, r12, #2
        bic     r2, r10, #1
        ldrsh   r8, [r2, +r1]
        add     r9, r3, #4
        bic     r2, r9, #1
        ldrsh   r2, [r2, +r1]
        add     r11, r4, #6
        bic     r3, r11, #1
        str     r2, [sp, #4]
        ldrsh   r1, [r3, +r1]
        ldr     r3, [sp, #0x9C]
        mov     r0, r5
        str     r1, [sp]
        strh    r1, [r3, #6]
        strh    r2, [r3, #4]
        strh    r7, [r3]
        strh    r8, [r3, #2]
        mov     r1, #0x3C
        bl      _ippsZero_16s
        ldr     r1, [sp, #0xC0]
        cmp     r1, #0
        ble     LDVM14
        ldr     r1, [sp, #8]
        add     r6, r6, #1
        add     r11, r4, #7
        add     r10, r1, #3
        ldr     r1, [sp, #0xC]
        add     r9, r1, #5
LDVM14:
        ldr     r1, [sp, #0xA0]
        cmp     r9, #0x3C
        strh    r6, [r1]
        strh    r10, [r1, #2]
        strh    r9, [r1, #4]
        strh    r11, [r1, #6]
        mov     r6, r6, lsl #1
        strh    r7, [r5, +r6]
        mov     r10, r10, lsl #1
        strh    r8, [r5, +r10]
        bge     LDVM15
        ldr     r1, [sp, #4]
        mov     r9, r9, lsl #1
        strh    r1, [r5, +r9]
LDVM15:
        cmp     r11, #0x3C
        bge     LDVM16
        ldr     r1, [sp]
        mov     r11, r11, lsl #1
        strh    r1, [r5, +r11]
LDVM16:
        ldr     r0, [sp, #0xA4]
        ldr     r1, [sp, #0xC0]
        strh    r1, [r0]
        mov     r0, #0
        add     sp, sp, #0x1E, 28
        ldmia   sp!, {r4 - r11, pc}
LDVM17:
        ldr     r2, [sp, #0xBC]
        ldr     r3, [sp, #0xB8]
        ldr     r12, [sp, #0xB4]
        ldr     r1, [sp, #0xB0]
        ldr     r9, [sp, #0xAC]
        ldr     r6, [sp, #0xC]
        ldr     r5, [sp, #0x10]
        b       LDVM13
LDVM18:
        mvn     r0, #7
        add     sp, sp, #0x1E, 28
        ldmia   sp!, {r4 - r11, pc}
LDVM_ownFixedCodebookSearchCorrSign_G723_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xAC
        mov     r2, #0x47, 30
        orr     r2, r2, #1, 22
        sub     r5, r2, #0x14
        add     r5, r0, r5
        str     r5, [sp, #0x20]
        add     r5, r0, #0x42, 30
        str     r5, [sp, #0x10]
        add     r5, r0, #0x82, 30
        str     r5, [sp, #0x14]
        add     r5, r0, #0xC2, 30
        str     r5, [sp, #0x18]
        add     r5, r0, #0xC
        str     r5, [sp, #0x24]
        add     r5, r0, #0x43, 30
        str     r5, [sp, #0x28]
        add     r5, r0, #0x83, 30
        str     r5, [sp, #0x2C]
        add     r5, r0, #0xC3, 30
        str     r5, [sp, #0x30]
        add     r5, r0, #0x10
        str     r5, [sp, #0x3C]
        add     r5, r0, #0x11, 28
        str     r5, [sp, #0x40]
        add     r5, r0, #0x21, 28
        sub     r4, r2, #0x11, 28
        str     r5, [sp, #0x44]
        add     r5, r0, #0x31, 28
        sub     r12, r2, #0x10
        add     r4, r0, r4
        str     r5, [sp, #0x48]
        add     r5, r0, #0x41, 28
        str     r4, [sp, #0x34]
        add     r12, r0, r12
        add     r4, r0, #2, 24
        str     r5, [sp, #0x4C]
        add     r5, r0, #0x51, 28
        str     r12, [sp, #0x38]
        sub     r12, r2, #8
        str     r4, [sp, #0xA4]
        add     r4, r0, #3, 24
        str     r5, [sp, #0x50]
        add     r5, r0, #0x14
        add     r12, r0, r12
        str     r4, [sp, #0x9C]
        add     r4, r0, #1, 22
        str     r5, [sp, #0x54]
        add     r5, r0, #0x45, 30
        str     r12, [sp, #0x68]
        sub     r12, r2, #0x41, 30
        str     r4, [sp, #0xA0]
        add     r4, r0, #5, 24
        str     r5, [sp, #0x58]
        add     r5, r0, #0x85, 30
        add     r12, r0, r12
        str     r4, [sp, #0x94]
        add     r4, r0, #4
        str     r5, [sp, #0x5C]
        add     r5, r0, #0xC5, 30
        str     r12, [sp, #0x7C]
        sub     r12, r2, #4
        sub     lr, r2, #0x42, 30
        str     r4, [sp, #0x8C]
        add     r4, r0, #0x41, 30
        str     r5, [sp, #0x60]
        add     r5, r0, #0x86, 30
        add     r12, r0, r12
        str     r4, [sp, #0x78]
        add     lr, r0, lr
        add     r4, r0, #0x81, 30
        sub     r7, r2, #0x46, 30
        sub     r6, r2, #0x45, 30
        str     r5, [sp, #0x74]
        add     r5, r0, #0x1C
        sub     r3, r2, #0x18
        str     r12, [sp, #0x80]
        str     lr, [sp, #0x64]
        str     r4, [sp, #0x70]
        sub     r12, r2, #1, 24
        mov     lr, #0
        add     r4, r0, #0xC1, 30
        str     r5, [sp, #0x84]
        add     r7, r0, r7
        add     r6, r0, r6
        add     r5, r0, #0x47, 30
        add     r2, r0, r2
        str     lr, [sp, #0xA8]
        str     r4, [sp, #0x6C]
        str     r7, [sp, #0xC]
        add     r3, r0, r3
        str     r6, [sp, #0x1C]
        add     lr, r0, #1, 24
        add     r4, r0, #8
        str     r5, [sp, #0x88]
        add     r11, r0, #0xC7, 30
        str     r2, [sp, #0x98]
        add     r10, r1, #2
        add     r9, r1, #4
        add     r8, r0, #0x18
        add     r7, r0, #0x46, 30
        add     r6, r0, #0xC6, 30
        add     r5, r0, #0x87, 30
        str     r11, [sp, #0x90]
        add     r12, r0, r12
        mov     r2, r1
        str     r4, [sp]
        str     r3, [sp, #4]
        str     lr, [sp, #8]
LDVM19:
        ldr     r4, [r0]
        ldrsh   r3, [r1, #2]
        ldr     r11, [sp, #0xA8]
        ldrsh   lr, [r2]
        mov     r4, r4, asr #15
        mul     r4, r3, r4
        add     r11, r11, #4
        str     r11, [sp, #0xA8]
        ldr     r3, [sp, #0xA8]
        mul     lr, r4, lr
        cmp     r3, #0x1E
        str     lr, [r0], #0x20
        ldr     r3, [sp, #8]
        ldrsh   lr, [r1, #4]
        ldr     r4, [r3]
        ldrsh   r3, [r2]
        mov     r4, r4, asr #15
        mul     r4, lr, r4
        mul     lr, r4, r3
        ldr     r3, [sp, #8]
        str     lr, [r3], #0x20
        ldr     lr, [sp, #0xA4]
        ldrsh   r4, [r2]
        ldr     r11, [lr]
        ldrsh   lr, [r1, #6]
        str     r3, [sp, #8]
        ldr     r3, [sp, #0xA4]
        mov     r11, r11, asr #15
        mul     r11, lr, r11
        mul     r4, r11, r4
        str     r4, [r3], #0x20
        ldr     lr, [sp, #0x9C]
        ldrsh   r4, [r10]
        ldr     r11, [lr]
        ldrsh   lr, [r1, #4]
        str     r3, [sp, #0xA4]
        ldr     r3, [sp, #0x9C]
        mov     r11, r11, asr #15
        mul     r11, lr, r11
        mul     r4, r11, r4
        str     r4, [r3], #0x20
        ldr     lr, [sp, #0xA0]
        ldrsh   r4, [r10]
        ldr     r11, [lr]
        ldrsh   lr, [r1, #6]
        str     r3, [sp, #0x9C]
        ldr     r3, [sp, #0xA0]
        mov     r11, r11, asr #15
        mul     r11, lr, r11
        mul     r4, r11, r4
        str     r4, [r3], #0x20
        ldr     lr, [sp, #0x94]
        ldrsh   r4, [r9]
        ldr     r11, [lr]
        ldrsh   lr, [r1, #6]
        str     r3, [sp, #0xA0]
        ldr     r3, [sp, #0x94]
        mov     r11, r11, asr #15
        mul     r11, lr, r11
        mul     r4, r11, r4
        str     r4, [r3], #0x20
        ldr     lr, [sp, #0x8C]
        ldrsh   r4, [r2]
        ldr     r11, [lr]
        ldrsh   lr, [r1, #0xA]
        str     r3, [sp, #0x94]
        ldr     r3, [sp, #0x8C]
        mov     r11, r11, asr #15
        mul     r11, lr, r11
        mul     r4, r11, r4
        str     r4, [r3], #0x20
        ldr     lr, [sp, #0x78]
        ldrsh   r4, [r2]
        ldr     r11, [lr]
        ldrsh   lr, [r1, #0xC]
        str     r3, [sp, #0x8C]
        ldr     r3, [sp, #0x78]
        mov     r11, r11, asr #15
        mul     r11, lr, r11
        mul     r4, r11, r4
        str     r4, [r3], #0x20
        ldr     lr, [sp, #0x70]
        ldrsh   r4, [r2]
        ldr     r11, [lr]
        ldrsh   lr, [r1, #0xE]
        str     r3, [sp, #0x78]
        ldr     r3, [sp, #0x70]
        mov     r11, r11, asr #15
        mul     r11, lr, r11
        mul     r4, r11, r4
        str     r4, [r3], #0x20
        ldr     lr, [sp, #0x6C]
        ldrsh   r4, [r10]
        ldr     r11, [lr]
        ldrsh   lr, [r1, #0xC]
        str     r3, [sp, #0x70]
        ldr     r3, [sp, #0x6C]
        mov     r11, r11, asr #15
        mul     r11, lr, r11
        mul     r4, r11, r4
        str     r4, [r3], #0x20
        ldr     lr, [sp, #0xC]
        ldrsh   r4, [r10]
        ldr     r11, [lr]
        ldrsh   lr, [r1, #0xE]
        str     r3, [sp, #0x6C]
        ldr     r3, [sp, #0xC]
        mov     r11, r11, asr #15
        mul     r11, lr, r11
        mul     r4, r11, r4
        str     r4, [r3], #0x20
        ldr     lr, [sp, #4]
        ldrsh   r4, [r9]
        ldr     r11, [lr]
        ldrsh   lr, [r1, #0xE]
        str     r3, [sp, #0xC]
        ldr     r3, [sp, #4]
        mov     r11, r11, asr #15
        mul     r11, lr, r11
        mul     r4, r11, r4
        str     r4, [r3], #0x20
        ldr     lr, [sp]
        ldrsh   r4, [r2]
        ldr     r11, [lr]
        ldrsh   lr, [r1, #0x12]
        str     r3, [sp, #4]
        ldr     r3, [sp]
        mov     r11, r11, asr #15
        mul     r11, lr, r11
        mul     r4, r11, r4
        str     r4, [r3], #0x20
        ldr     lr, [sp, #0x10]
        ldrsh   r4, [r2]
        ldr     r11, [lr]
        ldrsh   lr, [r1, #0x14]
        str     r3, [sp]
        ldr     r3, [sp, #0x10]
        mov     r11, r11, asr #15
        mul     r11, lr, r11
        mul     r4, r11, r4
        str     r4, [r3], #0x20
        ldr     lr, [sp, #0x14]
        ldrsh   r4, [r2]
        ldr     r11, [lr]
        ldrsh   lr, [r1, #0x16]
        str     r3, [sp, #0x10]
        ldr     r3, [sp, #0x14]
        mov     r11, r11, asr #15
        mul     r11, lr, r11
        mul     r4, r11, r4
        str     r4, [r3], #0x20
        ldr     lr, [sp, #0x18]
        ldrsh   r4, [r10]
        ldr     r11, [lr]
        ldrsh   lr, [r1, #0x14]
        str     r3, [sp, #0x14]
        ldr     r3, [sp, #0x18]
        mov     r11, r11, asr #15
        mul     r11, lr, r11
        mul     r4, r11, r4
        str     r4, [r3], #0x20
        ldr     lr, [sp, #0x1C]
        ldrsh   r4, [r10]
        ldr     r11, [lr]
        ldrsh   lr, [r1, #0x16]
        str     r3, [sp, #0x18]
        ldr     r3, [sp, #0x1C]
        mov     r11, r11, asr #15
        mul     r11, lr, r11
        mul     r4, r11, r4
        str     r4, [r3], #0x20
        ldr     lr, [sp, #0x20]
        ldrsh   r4, [r9]
        ldr     r11, [lr]
        ldrsh   lr, [r1, #0x16]
        str     r3, [sp, #0x1C]
        ldr     r3, [sp, #0x20]
        mov     r11, r11, asr #15
        mul     r11, lr, r11
        mul     r4, r11, r4
        str     r4, [r3], #0x20
        ldr     lr, [sp, #0x24]
        ldrsh   r4, [r2]
        ldr     r11, [lr]
        ldrsh   lr, [r1, #0x1A]
        str     r3, [sp, #0x20]
        ldr     r3, [sp, #0x24]
        mov     r11, r11, asr #15
        mul     r11, lr, r11
        mul     r4, r11, r4
        str     r4, [r3], #0x20
        ldr     lr, [sp, #0x28]
        ldrsh   r4, [r2]
        ldr     r11, [lr]
        ldrsh   lr, [r1, #0x1C]
        str     r3, [sp, #0x24]
        ldr     r3, [sp, #0x28]
        mov     r11, r11, asr #15
        mul     r11, lr, r11
        mul     r4, r11, r4
        str     r4, [r3], #0x20
        ldr     lr, [sp, #0x2C]
        ldrsh   r4, [r2]
        ldr     r11, [lr]
        ldrsh   lr, [r1, #0x1E]
        str     r3, [sp, #0x28]
        ldr     r3, [sp, #0x2C]
        mov     r11, r11, asr #15
        mul     r11, lr, r11
        mul     r4, r11, r4
        str     r4, [r3], #0x20
        ldr     lr, [sp, #0x30]
        ldrsh   r4, [r10]
        ldr     r11, [lr]
        ldrsh   lr, [r1, #0x1C]
        str     r3, [sp, #0x2C]
        ldr     r3, [sp, #0x30]
        mov     r11, r11, asr #15
        mul     r11, lr, r11
        mul     r4, r11, r4
        str     r4, [r3], #0x20
        ldr     lr, [sp, #0x34]
        ldrsh   r4, [r10]
        ldr     r11, [lr]
        ldrsh   lr, [r1, #0x1E]
        str     r3, [sp, #0x30]
        ldr     r3, [sp, #0x34]
        mov     r11, r11, asr #15
        mul     r11, lr, r11
        mul     r4, r11, r4
        str     r4, [r3], #0x20
        ldr     lr, [sp, #0x38]
        ldrsh   r4, [r9]
        ldr     r11, [lr]
        ldrsh   lr, [r1, #0x1E]
        str     r3, [sp, #0x34]
        ldr     r3, [sp, #0x38]
        mov     r11, r11, asr #15
        mul     r11, lr, r11
        mul     r4, r11, r4
        str     r4, [r3], #0x20
        ldr     lr, [sp, #0x3C]
        ldrsh   r4, [r2]
        ldr     r11, [lr]
        ldrsh   lr, [r1, #0x22]
        str     r3, [sp, #0x38]
        ldr     r3, [sp, #0x3C]
        mov     r11, r11, asr #15
        mul     r11, lr, r11
        mul     r4, r11, r4
        str     r4, [r3], #0x20
        ldr     lr, [sp, #0x40]
        ldrsh   r4, [r2]
        ldr     r11, [lr]
        ldrsh   lr, [r1, #0x24]
        str     r3, [sp, #0x3C]
        ldr     r3, [sp, #0x40]
        mov     r11, r11, asr #15
        mul     r11, lr, r11
        mul     r4, r11, r4
        str     r4, [r3], #0x20
        ldr     lr, [sp, #0x44]
        ldrsh   r4, [r2]
        ldr     r11, [lr]
        ldrsh   lr, [r1, #0x26]
        str     r3, [sp, #0x40]
        ldr     r3, [sp, #0x44]
        mov     r11, r11, asr #15
        mul     r11, lr, r11
        mul     r4, r11, r4
        str     r4, [r3], #0x20
        ldr     lr, [sp, #0x48]
        ldrsh   r4, [r10]
        ldr     r11, [lr]
        ldrsh   lr, [r1, #0x24]
        str     r3, [sp, #0x44]
        ldr     r3, [sp, #0x48]
        mov     r11, r11, asr #15
        mul     r11, lr, r11
        mul     r4, r11, r4
        str     r4, [r3], #0x20
        ldr     lr, [sp, #0x4C]
        ldrsh   r4, [r10]
        ldr     r11, [lr]
        ldrsh   lr, [r1, #0x26]
        str     r3, [sp, #0x48]
        ldr     r3, [sp, #0x4C]
        mov     r11, r11, asr #15
        mul     r11, lr, r11
        mul     r4, r11, r4
        str     r4, [r3], #0x20
        ldr     lr, [sp, #0x50]
        ldrsh   r4, [r9]
        ldr     r11, [lr]
        ldrsh   lr, [r1, #0x26]
        str     r3, [sp, #0x4C]
        ldr     r3, [sp, #0x50]
        mov     r11, r11, asr #15
        mul     r11, lr, r11
        mul     r4, r11, r4
        str     r4, [r3], #0x20
        ldr     lr, [sp, #0x54]
        ldrsh   r4, [r2]
        ldr     r11, [lr]
        ldrsh   lr, [r1, #0x2A]
        str     r3, [sp, #0x50]
        ldr     r3, [sp, #0x54]
        mov     r11, r11, asr #15
        mul     r11, lr, r11
        mul     r4, r11, r4
        str     r4, [r3], #0x20
        ldr     lr, [sp, #0x58]
        ldrsh   r4, [r2]
        ldr     r11, [lr]
        ldrsh   lr, [r1, #0x2C]
        str     r3, [sp, #0x54]
        ldr     r3, [sp, #0x58]
        mov     r11, r11, asr #15
        mul     r11, lr, r11
        mul     r4, r11, r4
        str     r4, [r3], #0x20
        ldr     lr, [sp, #0x5C]
        ldrsh   r4, [r2]
        ldr     r11, [lr]
        ldrsh   lr, [r1, #0x2E]
        str     r3, [sp, #0x58]
        ldr     r3, [sp, #0x5C]
        mov     r11, r11, asr #15
        mul     r11, lr, r11
        mul     r4, r11, r4
        str     r4, [r3], #0x20
        ldr     lr, [sp, #0x60]
        ldrsh   r4, [r10]
        ldr     r11, [lr]
        ldrsh   lr, [r1, #0x2C]
        str     r3, [sp, #0x5C]
        ldr     r3, [sp, #0x60]
        mov     r11, r11, asr #15
        mul     r11, lr, r11
        mul     r4, r11, r4
        str     r4, [r3], #0x20
        ldr     lr, [sp, #0x64]
        ldrsh   r4, [r10]
        ldr     r11, [lr]
        ldrsh   lr, [r1, #0x2E]
        str     r3, [sp, #0x60]
        ldr     r3, [sp, #0x64]
        mov     r11, r11, asr #15
        mul     r11, lr, r11
        mul     r4, r11, r4
        str     r4, [r3], #0x20
        ldr     lr, [sp, #0x68]
        ldrsh   r4, [r9]
        ldr     r11, [lr]
        ldrsh   lr, [r1, #0x2E]
        str     r3, [sp, #0x64]
        ldr     r3, [sp, #0x68]
        mov     r11, r11, asr #15
        mul     r11, lr, r11
        mul     r4, r11, r4
        str     r4, [r3], #0x20
        ldr     r11, [r8]
        ldrsh   lr, [r1, #0x32]
        ldrsh   r4, [r2]
        str     r3, [sp, #0x68]
        mov     r11, r11, asr #15
        mul     r11, lr, r11
        mul     r4, r11, r4
        str     r4, [r8], #0x20
        ldr     r4, [r7]
        ldrsh   lr, [r1, #0x34]
        ldrsh   r3, [r2]
        mov     r4, r4, asr #15
        mul     r4, lr, r4
        mul     r3, r4, r3
        str     r3, [r7], #0x20
        ldr     r3, [sp, #0x74]
        ldrsh   lr, [r1, #0x36]
        ldr     r4, [r3]
        ldrsh   r3, [r2]
        mov     r4, r4, asr #15
        mul     r4, lr, r4
        mul     lr, r4, r3
        ldr     r3, [sp, #0x74]
        str     lr, [r3], #0x20
        ldr     r11, [r6]
        ldrsh   lr, [r1, #0x34]
        ldrsh   r4, [r10]
        mov     r11, r11, asr #15
        mul     r11, lr, r11
        str     r3, [sp, #0x74]
        mul     r4, r11, r4
        str     r4, [r6], #0x20
        ldr     r3, [sp, #0x7C]
        ldrsh   lr, [r1, #0x36]
        ldr     r4, [r3]
        ldrsh   r3, [r10]
        mov     r4, r4, asr #15
        mul     r4, lr, r4
        ldr     lr, [sp, #0x7C]
        mul     r3, r4, r3
        str     r3, [lr]
        ldr     r3, [sp, #0x80]
        ldr     r11, [sp, #0x7C]
        ldrsh   lr, [r9]
        ldr     r4, [r3]
        ldrsh   r3, [r1, #0x36]
        add     r11, r11, #0x20
        str     r11, [sp, #0x7C]
        mov     r4, r4, asr #15
        mul     r4, r3, r4
        ldr     r3, [sp, #0x80]
        mul     lr, r4, lr
        str     lr, [r3]
        ldr     r3, [sp, #0x84]
        ldrsh   lr, [r2]
        ldr     r11, [sp, #0x80]
        ldr     r4, [r3]
        ldrsh   r3, [r1, #0x3A]
        mov     r4, r4, asr #15
        add     r11, r11, #0x20
        str     r11, [sp, #0x80]
        mul     r4, r3, r4
        ldr     r3, [sp, #0x84]
        mul     lr, r4, lr
        str     lr, [r3]
        ldr     r3, [sp, #0x88]
        ldr     r11, [sp, #0x84]
        ldrsh   lr, [r2]
        ldr     r4, [r3]
        ldrsh   r3, [r1, #0x3C]
        add     r11, r11, #0x20
        str     r11, [sp, #0x84]
        mov     r4, r4, asr #15
        mul     r4, r3, r4
        ldr     r3, [sp, #0x88]
        mul     lr, r4, lr
        str     lr, [r3], #0x20
        ldr     r11, [r5]
        ldrsh   lr, [r1, #0x3E]
        ldrsh   r4, [r2], #8
        mov     r11, r11, asr #15
        mul     r11, lr, r11
        str     r3, [sp, #0x88]
        mul     r4, r11, r4
        str     r4, [r5], #0x20
        ldr     r3, [sp, #0x90]
        ldrsh   lr, [r1, #0x3C]
        ldr     r4, [r3]
        ldrsh   r3, [r10]
        mov     r4, r4, asr #15
        mul     r4, lr, r4
        mul     lr, r4, r3
        ldr     r3, [sp, #0x90]
        str     lr, [r3], #0x20
        ldr     r11, [r12]
        ldrsh   lr, [r1, #0x3E]
        ldrsh   r4, [r10], #8
        mov     r11, r11, asr #15
        mul     r11, lr, r11
        str     r3, [sp, #0x90]
        mul     r4, r11, r4
        str     r4, [r12], #0x20
        ldr     r3, [sp, #0x98]
        ldrsh   lr, [r1, #0x3E]
        ldr     r4, [r3]
        ldrsh   r3, [r9], #8
        mov     r4, r4, asr #15
        mul     r4, lr, r4
        ldr     lr, [sp, #0x98]
        mul     r3, r4, r3
        str     r3, [lr], #0x20
        str     lr, [sp, #0x98]
        blt     LDVM19
        add     sp, sp, #0xAC
        ldmia   sp!, {r4 - r11, pc}


