        .text
        .align  4
        .globl  ownLPCToLSP_G729_16s


ownLPCToLSP_G729_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xA8
        ldr     r5, [pc, #0xFE0]
        ldr     r6, [sp, #0xD0]
        add     r4, sp, #0x70
        ldr     r5, [r5, +r2, lsl #2]
        str     r1, [sp, #0x24]
        ldr     r1, [sp, #0xCC]
        add     lr, sp, #0x8C
        str     r5, [sp, #0x2C]
        str     r1, [sp, #0x28]
        add     r12, sp, #0x70
        add     r7, sp, #0x8C
        str     r0, [sp, #0x20]
        and     lr, lr, #0xF
        and     r4, r4, #0xF
        rsb     lr, lr, #0
        rsb     r2, r4, #0
        and     r2, r2, #0xF
        and     lr, lr, #0xF
        add     r2, r12, r2
        str     r2, [sp, #0x34]
        mov     r0, r3
        add     r4, r7, lr
        mov     r1, r4
        mov     r3, r6
        bl      LDSS_ownGetLPCPol_G729
        ldrsh   r5, [r5]
        str     r0, [sp, #0x38]
        ldrsh   lr, [r4, #8]
        ldrsh   r11, [r4, #6]
        ldrsh   r2, [r4, #2]
        mov     r12, #1
        mov     r12, r12, lsl r0
        mov     r2, r2, lsl r6
        mov     r12, r12, lsl #16
        mov     r11, r11, lsl r6
        mov     r8, r12, asr #16
        ldrsh   r12, [r4, #4]
        str     lr, [sp, #0x64]
        ldrsh   r10, [r4, #0xA]
        mov     lr, r5, lsl #1
        mla     r2, lr, r8, r2
        mvn     lr, #0xFF
        bic     lr, lr, #0x7F, 24
        mvn     lr, lr
        mov     r7, r2, asr #15
        and     r1, r2, lr
        mul     r2, r5, r1
        mov     r9, r7, lsl #16
        mov     r7, r8, lsl #15
        mov     r9, r9, asr #16
        str     r4, [sp, #0x1C]
        bic     r3, r2, lr
        rsb     r7, r7, #0
        mov     r2, r9, lsl #1
        mla     r2, r5, r2, r7
        mov     r12, r12, lsl r6
        add     r12, r12, r3, asr #14
        rsb     r3, r1, #0
        add     r12, r2, r12
        and     r2, r12, lr
        mul     r1, r5, r2
        mov     r12, r12, asr #15
        sub     r9, r3, r9, lsl #15
        mov     r12, r12, lsl #16
        rsb     r2, r2, #0
        bic     r1, r1, lr
        mov     r12, r12, asr #16
        sub     r2, r2, r12, lsl #15
        add     r1, r11, r1, asr #14
        mov     r12, r12, lsl #1
        mla     r11, r5, r12, r9
        ldr     r12, [sp, #0x64]
        add     r0, r0, #1
        mov     r9, r12, lsl r6
        sub     r12, r6, #1
        add     r1, r11, r1
        and     r11, r1, lr
        mul     r3, r5, r11
        mov     r1, r1, asr #15
        mov     r10, r10, lsl r12
        mov     r1, r1, lsl #16
        rsb     r11, r11, #0
        bic     r3, r3, lr
        mov     r1, r1, asr #16
        sub     r11, r11, r1, lsl #15
        add     r3, r9, r3, asr #14
        mov     r1, r1, lsl #1
        mla     r2, r5, r1, r2
        add     r9, r2, r3
        and     r2, r9, lr
        mul     r2, r5, r2
        mov     r9, r9, asr #15
        mov     r9, r9, lsl #16
        mov     r9, r9, asr #16
        mla     r11, r5, r9, r11
        add     r2, r10, r2, asr #15
        add     r2, r11, r2
        mov     r2, r2, asr r0
        cmp     lr, r2
        mov     lr, r2, lsl #16
        mov     r10, lr, asr #16
        bge     LDSS0
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r10, r2
        b       LDSS1
LDSS0:
        cmn     r2, #2, 18
        movlt   r2, #0
        sublt   r10, r2, #2, 18
LDSS1:
        ldr     lr, [sp, #0x2C]
        ldr     r3, [pc, #0xE2C]
        ldr     r11, [pc, #0xE2C]
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        str     r4, [sp, #0x30]
        ldr     r4, [sp, #0x1C]
        mov     r9, #0
        mov     r1, r9
        sub     lr, lr, #2
        mvn     r2, r2
        str     r1, [sp, #0x44]
        str     r2, [sp, #0x5C]
        str     lr, [sp, #0x40]
        str     r0, [sp, #0x54]
        str     r12, [sp, #0x50]
        str     r7, [sp, #0x58]
        str     r8, [sp, #0x4C]
LDSS2:
        ldr     r0, [sp, #0x20]
        cmp     r9, r0
        bge     LDSS26
        ldr     r1, [sp, #0x2C]
        ldr     r8, [sp, #0x4C]
        ldr     r3, [sp, #0x58]
        add     r9, r9, #2
        str     r5, [sp, #0x18]
        mov     r0, r9, lsl #1
        str     r0, [sp, #0x10]
        ldrsh   r5, [r1, +r0]
        ldrsh   r7, [r4, #2]
        ldrsh   lr, [r4, #4]
        ldrsh   r2, [r4, #6]
        ldrsh   r12, [r4, #8]
        ldrsh   r1, [r4, #0xA]
        mov     r0, r5, lsl #1
        mov     r7, r7, lsl r6
        mla     r11, r0, r8, r7
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        str     r7, [sp, #0x14]
        mvn     r7, r0
        mov     r0, r10
        and     r10, r11, r7
        mul     r8, r5, r10
        mov     r11, r11, asr #15
        rsb     r10, r10, #0
        mov     r11, r11, lsl #16
        bic     r8, r8, r7
        mov     r11, r11, asr #16
        sub     r10, r10, r11, lsl #15
        mov     r8, r8, asr #14
        mov     r11, r11, lsl #1
        mla     r11, r5, r11, r3
        add     r8, r8, lr, lsl r6
        add     r11, r11, r8
        and     r8, r11, r7
        mul     r3, r5, r8
        mov     r11, r11, asr #15
        rsb     r8, r8, #0
        mov     r11, r11, lsl #16
        bic     r3, r3, r7
        mov     r11, r11, asr #16
        sub     r8, r8, r11, lsl #15
        mov     r3, r3, asr #14
        mov     r11, r11, lsl #1
        mla     r10, r5, r11, r10
        add     r11, r3, r2, lsl r6
        add     r11, r10, r11
        and     r10, r11, r7
        mul     r3, r5, r10
        mov     r11, r11, asr #15
        rsb     r10, r10, #0
        mov     r11, r11, lsl #16
        bic     r3, r3, r7
        mov     r11, r11, asr #16
        sub     r10, r10, r11, lsl #15
        mov     r3, r3, asr #14
        mov     r11, r11, lsl #1
        mla     r8, r5, r11, r8
        add     r11, r3, r12, lsl r6
        add     r8, r8, r11
        and     r7, r8, r7
        mul     r7, r5, r7
        mov     r8, r8, asr #15
        mov     r8, r8, lsl #16
        mov     r8, r8, asr #16
        mla     r10, r5, r8, r10
        ldr     r8, [sp, #0x50]
        mov     r7, r7, asr #15
        add     r8, r7, r1, lsl r8
        ldr     r7, [sp, #0x54]
        add     r10, r10, r8
        ldr     r8, [sp, #0x5C]
        mov     r7, r10, asr r7
        cmp     r8, r7
        mov     r8, r7, lsl #16
        mov     r10, r8, asr #16
        bge     LDSS3
        mvn     r7, #0xFF
        bic     r7, r7, #0x7F, 24
        mvn     r10, r7
        b       LDSS4
LDSS3:
        cmn     r7, #2, 18
        movlt   r7, #0
        sublt   r10, r7, #2, 18
LDSS4:
        mul     r7, r0, r10
        cmp     r7, #0
        bgt     LDSS2
        ldr     r7, [sp, #0x40]
        ldr     r4, [sp, #0x10]
        ldr     r8, [sp, #0x14]
        ldr     r3, [sp, #0x4C]
        ldrsh   r4, [r7, +r4]
        mvn     r7, #0xFF
        bic     r7, r7, #0x7F, 24
        mov     r11, r4, lsl #1
        mla     r8, r3, r11, r8
        mvn     r7, r7
        str     r7, [sp, #0x1C]
        and     r7, r8, r7
        mul     r11, r4, r7
        rsb     r7, r7, #0
        str     r7, [sp, #0x68]
        mov     r8, r8, asr #15
        str     r11, [sp, #0x10]
        ldr     r11, [sp, #0x10]
        mov     r7, r8, lsl #16
        ldr     r8, [sp, #0x1C]
        mov     r7, r7, asr #16
        bic     r8, r11, r8
        ldr     r11, [sp, #0x68]
        mov     r8, r8, asr #14
        add     r8, r8, lr, lsl r6
        sub     r11, r11, r7, lsl #15
        str     r11, [sp, #0x68]
        ldr     r11, [sp, #0x58]
        mov     r7, r7, lsl #1
        mla     r7, r4, r7, r11
        add     r8, r7, r8
        ldr     r7, [sp, #0x1C]
        and     r7, r8, r7
        mul     r11, r4, r7
        mov     r8, r8, asr #15
        rsb     r7, r7, #0
        str     r7, [sp, #0x6C]
        str     r11, [sp, #0x10]
        ldr     r11, [sp, #0x10]
        mov     r8, r8, lsl #16
        mov     r7, r8, asr #16
        ldr     r8, [sp, #0x1C]
        bic     r8, r11, r8
        ldr     r11, [sp, #0x6C]
        mov     r8, r8, asr #14
        add     r8, r8, r2, lsl r6
        sub     r11, r11, r7, lsl #15
        str     r11, [sp, #0x6C]
        ldr     r11, [sp, #0x68]
        mov     r7, r7, lsl #1
        mla     r7, r4, r7, r11
        add     r8, r7, r8
        ldr     r7, [sp, #0x1C]
        and     r7, r8, r7
        mul     r11, r4, r7
        mov     r8, r8, asr #15
        rsb     r7, r7, #0
        str     r7, [sp, #0x10]
        mov     r8, r8, lsl #16
        str     r11, [sp, #0x68]
        mov     r7, r8, asr #16
        ldr     r8, [sp, #0x1C]
        ldr     r11, [sp, #0x68]
        bic     r8, r11, r8
        ldr     r11, [sp, #0x10]
        mov     r8, r8, asr #14
        add     r8, r8, r12, lsl r6
        sub     r11, r11, r7, lsl #15
        str     r11, [sp, #0x68]
        ldr     r11, [sp, #0x6C]
        mov     r7, r7, lsl #1
        mla     r7, r4, r7, r11
        ldr     r11, [sp, #0x50]
        add     r7, r7, r8
        ldr     r8, [sp, #0x1C]
        and     r8, r7, r8
        mul     r8, r4, r8
        mov     r7, r7, asr #15
        mov     r7, r7, lsl #16
        str     r8, [sp, #0x6C]
        ldr     r8, [sp, #0x68]
        mov     r7, r7, asr #16
        mla     r7, r4, r7, r8
        ldr     r8, [sp, #0x6C]
        mov     r8, r8, asr #15
        add     r11, r8, r1, lsl r11
        ldr     r8, [sp, #0x54]
        add     r7, r7, r11
        mov     r7, r7, asr r8
        ldr     r8, [sp, #0x5C]
        cmp     r8, r7
        mov     r8, r7, lsl #16
        mov     r8, r8, asr #16
        bge     LDSS5
        mvn     r7, #0xFF
        bic     r7, r7, #0x7F, 24
        mvn     r8, r7
        b       LDSS6
LDSS5:
        cmn     r7, #2, 18
        movlt   r7, #0
        sublt   r8, r7, #2, 18
LDSS6:
        mul     r7, r0, r8
        cmp     r7, #0
        movgt   r0, r8
        strgt   r4, [sp, #0x18]
        ble     LDSS25
LDSS7:
        ldr     r4, [sp, #0x24]
        cmp     r4, #0
        ble     LDSS11
        ldr     r4, [sp, #0x24]
        ldr     r11, [sp, #0x18]
        ldr     r3, [sp, #0x14]
        str     r0, [sp, #0x48]
        str     r1, [sp, #0x64]
        str     r2, [sp, #0x60]
        str     r9, [sp, #0x3C]
LDSS8:
        ldr     r9, [sp, #0x58]
        mov     r1, r11, lsl #16
        mov     r0, r5, lsl #16
        mov     r1, r1, asr #17
        add     r0, r1, r0, asr #17
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mov     r0, r0, lsl #16
        mvn     r2, r1
        mov     r7, r0, asr #16
        ldr     r0, [sp, #0x4C]
        mov     r1, r7, lsl #1
        mla     r0, r0, r1, r3
        and     r1, r0, r2
        mul     r8, r7, r1
        rsb     r1, r1, #0
        mov     r0, r0, asr #15
        mov     r0, r0, lsl #16
        bic     r8, r8, r2
        mov     r0, r0, asr #16
        sub     r1, r1, r0, lsl #15
        mov     r0, r0, lsl #1
        mla     r0, r7, r0, r9
        mov     r8, r8, asr #14
        add     r8, r8, lr, lsl r6
        add     r8, r0, r8
        and     r0, r8, r2
        mul     r9, r7, r0
        mov     r8, r8, asr #15
        rsb     r0, r0, #0
        mov     r8, r8, lsl #16
        bic     r9, r9, r2
        mov     r8, r8, asr #16
        sub     r0, r0, r8, lsl #15
        mov     r9, r9, asr #14
        mov     r8, r8, lsl #1
        mla     r1, r7, r8, r1
        ldr     r8, [sp, #0x60]
        add     r8, r9, r8, lsl r6
        add     r8, r1, r8
        and     r1, r8, r2
        mul     r9, r7, r1
        mov     r8, r8, asr #15
        rsb     r1, r1, #0
        mov     r8, r8, lsl #16
        mov     r8, r8, asr #16
        bic     r9, r9, r2
        sub     r1, r1, r8, lsl #15
        mov     r8, r8, lsl #1
        mla     r0, r7, r8, r0
        mov     r9, r9, asr #14
        add     r9, r9, r12, lsl r6
        add     r8, r0, r9
        and     r2, r8, r2
        mul     r0, r7, r2
        mov     r8, r8, asr #15
        ldr     r2, [sp, #0x64]
        mov     r8, r8, lsl #16
        mov     r8, r8, asr #16
        mla     r1, r7, r8, r1
        ldr     r8, [sp, #0x50]
        mov     r0, r0, asr #15
        add     r8, r0, r2, lsl r8
        ldr     r0, [sp, #0x54]
        add     r1, r1, r8
        mov     r0, r1, asr r0
        ldr     r1, [sp, #0x5C]
        cmp     r1, r0
        mov     r1, r0, lsl #16
        mov     r1, r1, asr #16
        bge     LDSS9
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r1, r0
        b       LDSS10
LDSS9:
        cmn     r0, #2, 18
        movlt   r0, #0
        sublt   r1, r0, #2, 18
LDSS10:
        mul     r0, r10, r1
        cmp     r0, #0
        strle   r1, [sp, #0x48]
        movle   r11, r7
        movgt   r5, r7
        movgt   r10, r1
        subs    r4, r4, #1
        bne     LDSS8
        ldr     r0, [sp, #0x48]
        ldr     r9, [sp, #0x3C]
        str     r11, [sp, #0x18]
LDSS11:
        sub     r0, r0, r10
        mov     r0, r0, lsl #16
        mov     r1, r0, asr #16
        cmp     r1, #0
        beq     LDSS18
        cmp     r1, #0
        str     r1, [sp, #0x10]
        blt     LDSS23
LDSS12:
        bic     r0, r1, #0xFF, 8
        bic     r0, r0, #0xFF, 16
        movs    r2, r0, asr #8
        bne     LDSS13
        ldr     r2, [pc, #0x91C]
        mov     r0, r0, lsl #1
        ldrsh   r0, [r2, +r0]
        str     r0, [sp, #0x14]
        b       LDSS14
LDSS13:
        mov     r0, r2, lsl #1
        ldr     r2, [pc, #0x908]
        ldrsh   r0, [r2, +r0]
        str     r0, [sp, #0x14]
LDSS14:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        add     r0, r0, #2, 4
        bl      __intel_idiv
        ldr     r1, [sp, #0x14]
        ldr     r2, [sp, #0x5C]
        mov     r0, r0, asr r1
        ldr     r1, [sp, #0x18]
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        sub     r1, r1, r5
        cmp     r2, r1
        blt     LDSS15
        cmn     r1, #2, 18
        movge   r1, r1, lsl #16
        movge   r1, r1, asr #16
        movlt   r1, #0
        sublt   r1, r1, #2, 18
        b       LDSS16
LDSS15:
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r1, r1
LDSS16:
        mul     r0, r0, r1
        ldr     r1, [sp, #0x14]
        ldr     r2, [sp, #0x10]
        rsb     r1, r1, #0x13
        mov     r1, r0, asr r1
        mov     r0, r1, lsl #16
        cmp     r2, #0
        mov     r0, r0, asr #16
        blt     LDSS21
LDSS17:
        mul     r0, r10, r0
        sub     r5, r5, r0, asr #10
        mov     r0, r5, lsl #16
        mov     r5, r0, asr #16
LDSS18:
        ldr     r1, [sp, #0x44]
        mov     r0, r1, lsl #1
        add     r1, r1, #1
        str     r1, [sp, #0x44]
        tst     r1, #1
        ldr     r1, [sp, #0x28]
        strh    r5, [r1, +r0]
        ldreq   r4, [sp, #0x30]
        ldrne   r4, [sp, #0x34]
        ldrsh   r0, [r4, #2]
        ldrsh   r2, [r4, #6]
        ldrsh   r1, [r4, #4]
        mov     r0, r0, lsl r6
        mov     r12, r5, lsl #1
        str     r2, [sp, #0x6C]
        ldrsh   r2, [r4, #8]
        mov     r1, r1, lsl r6
        str     r2, [sp, #0x68]
        ldrsh   r2, [r4, #0xA]
        str     r1, [sp, #0x60]
        str     r2, [sp, #0x64]
        ldr     r2, [sp, #0x4C]
        ldr     lr, [sp, #0x64]
        mla     r2, r12, r2, r0
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r0, r0
        mov     r12, r2, asr #15
        and     r2, r2, r0
        mul     r1, r5, r2
        mov     r12, r12, lsl #16
        rsb     r2, r2, #0
        mov     r12, r12, asr #16
        sub     r2, r2, r12, lsl #15
        str     r2, [sp, #0x48]
        bic     r2, r1, r0
        ldr     r1, [sp, #0x58]
        mov     r12, r12, lsl #1
        mla     r1, r5, r12, r1
        ldr     r12, [sp, #0x60]
        add     r2, r12, r2, asr #14
        ldr     r12, [sp, #0x6C]
        mov     r12, r12, lsl r6
        str     r12, [sp, #0x6C]
        ldr     r12, [sp, #0x68]
        mov     r12, r12, lsl r6
        str     r12, [sp, #0x68]
        ldr     r12, [sp, #0x50]
        mov     r12, lr, lsl r12
        str     r12, [sp, #0x64]
        add     r12, r1, r2
        and     r2, r12, r0
        mul     r1, r5, r2
        mov     r12, r12, asr #15
        rsb     r2, r2, #0
        mov     r12, r12, lsl #16
        bic     r1, r1, r0
        mov     r12, r12, asr #16
        sub     r2, r2, r12, lsl #15
        str     r2, [sp, #0x60]
        ldr     r2, [sp, #0x48]
        mov     r12, r12, lsl #1
        mla     r2, r5, r12, r2
        ldr     r12, [sp, #0x6C]
        add     r1, r12, r1, asr #14
        add     r12, r2, r1
        and     r2, r12, r0
        mul     r1, r5, r2
        mov     r12, r12, asr #15
        rsb     r2, r2, #0
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        sub     r2, r2, r12, lsl #15
        str     r2, [sp, #0x6C]
        ldr     r2, [sp, #0x60]
        mov     r12, r12, lsl #1
        bic     r1, r1, r0
        mla     r2, r5, r12, r2
        ldr     r12, [sp, #0x68]
        add     r1, r12, r1, asr #14
        add     r2, r2, r1
        and     r0, r2, r0
        mul     r0, r5, r0
        mov     r2, r2, asr #15
        mov     r1, r2, lsl #16
        ldr     r2, [sp, #0x6C]
        mov     r1, r1, asr #16
        mla     r1, r5, r1, r2
        ldr     r2, [sp, #0x64]
        add     r0, r2, r0, asr #15
        add     r1, r1, r0
        ldr     r0, [sp, #0x54]
        mov     r0, r1, asr r0
        ldr     r1, [sp, #0x5C]
        cmp     r1, r0
        mov     r1, r0, lsl #16
        mov     r10, r1, asr #16
        bge     LDSS19
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r10, r0
        b       LDSS20
LDSS19:
        cmn     r0, #2, 18
        mvnlt   r0, #0xFF
        biclt   r10, r0, #0x7F, 24
LDSS20:
        ldr     r0, [sp, #0x44]
        cmp     r0, #0xA
        blt     LDSS2
        ldr     r1, [sp, #0x44]
        mov     r0, r1
        add     sp, sp, #0xA8
        ldmia   sp!, {r4 - r11, pc}
LDSS21:
        cmn     r0, #2, 18
        beq     LDSS22
        rsb     r0, r0, #0
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LDSS17
LDSS22:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r0, r0
        b       LDSS17
LDSS23:
        cmn     r1, #2, 18
        beq     LDSS24
        rsb     r1, r1, #0
        mov     r0, r1, lsl #16
        mov     r1, r0, asr #16
        b       LDSS12
LDSS24:
        mov     r0, #0
        sub     r0, r0, #2, 18
        mvn     r1, r0
        b       LDSS12
LDSS25:
        mov     r10, r8
        mov     r5, r4
        sub     r9, r9, #1
        b       LDSS7
LDSS26:
        ldr     r4, [sp, #0x30]
        str     r6, [sp, #0xC]
        ldr     r0, [sp, #0x28]
        str     r0, [sp, #8]
        ldr     r0, [sp, #0x34]
        str     r4, [sp]
        str     r0, [sp, #4]
        ldr     r0, [sp, #0x38]
        ldr     r3, [sp, #0x2C]
        ldr     r2, [sp, #0x24]
        ldr     r1, [sp, #0x20]
        bl      LDSS_ownCalcLSPFromPol
        mov     r1, r0
        mov     r0, r1
        add     sp, sp, #0xA8
        ldmia   sp!, {r4 - r11, pc}
LDSS_ownGetLPCPol_G729:
        stmdb   sp!, {r1, r4 - r11, lr}
        cmp     r3, #0xC
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mov     r8, #1, 22
        beq     LDSS37
        strh    r8, [r1]
        strh    r8, [r2]
        ldrsh   r5, [r0, #0x14]
        ldrsh   r4, [r0, #2]
        ldrsh   lr, [r1]
        mvn     r12, r3
        add     r5, r4, r5
        mov     r4, r5, asr #2
        mov     r4, r4, lsl #16
        rsb     r4, lr, r4, asr #16
        cmp     r12, r4
        mvnlt   r4, r3
        blt     LDSS27
        cmn     r4, #2, 18
        movge   r4, r4, lsl #16
        movge   r4, r4, asr #16
        sublt   r4, r8, #0x21, 22
LDSS27:
        strh    r4, [r1, #2]
        ldrsh   r5, [r0, #2]
        ldrsh   r4, [r0, #0x14]
        ldrsh   lr, [r2]
        mvn     r12, r3
        sub     r5, r5, r4
        mov     r4, r5, asr #2
        mov     r4, r4, lsl #16
        add     r4, lr, r4, asr #16
        cmp     r12, r4
        mvnlt   r4, r3
        blt     LDSS28
        cmn     r4, #2, 18
        movge   r4, r4, lsl #16
        movge   r4, r4, asr #16
        sublt   r4, r8, #0x21, 22
LDSS28:
        strh    r4, [r2, #2]
        ldrsh   r5, [r0, #0x12]
        ldrsh   r4, [r0, #4]
        ldrsh   lr, [r1, #2]
        mvn     r12, r3
        add     r5, r4, r5
        mov     r4, r5, asr #2
        mov     r4, r4, lsl #16
        rsb     r4, lr, r4, asr #16
        cmp     r12, r4
        mvnlt   r4, r3
        blt     LDSS29
        cmn     r4, #2, 18
        movge   r4, r4, lsl #16
        movge   r4, r4, asr #16
        sublt   r4, r8, #0x21, 22
LDSS29:
        strh    r4, [r1, #4]
        ldrsh   r5, [r0, #4]
        ldrsh   r4, [r0, #0x12]
        ldrsh   lr, [r2, #2]
        mvn     r12, r3
        sub     r5, r5, r4
        mov     r4, r5, asr #2
        mov     r4, r4, lsl #16
        add     r4, lr, r4, asr #16
        cmp     r12, r4
        mvnlt   r4, r3
        blt     LDSS30
        cmn     r4, #2, 18
        movge   r4, r4, lsl #16
        movge   r4, r4, asr #16
        sublt   r4, r8, #0x21, 22
LDSS30:
        strh    r4, [r2, #4]
        ldrsh   r5, [r0, #0x10]
        ldrsh   r4, [r0, #6]
        ldrsh   lr, [r1, #4]
        mvn     r12, r3
        add     r5, r4, r5
        mov     r4, r5, asr #2
        mov     r4, r4, lsl #16
        rsb     r4, lr, r4, asr #16
        cmp     r12, r4
        mvnlt   r4, r3
        blt     LDSS31
        cmn     r4, #2, 18
        movge   r4, r4, lsl #16
        movge   r4, r4, asr #16
        sublt   r4, r8, #0x21, 22
LDSS31:
        strh    r4, [r1, #6]
        ldrsh   r5, [r0, #6]
        ldrsh   r4, [r0, #0x10]
        ldrsh   lr, [r2, #4]
        mvn     r12, r3
        sub     r5, r5, r4
        mov     r4, r5, asr #2
        mov     r4, r4, lsl #16
        add     r4, lr, r4, asr #16
        cmp     r12, r4
        mvnlt   r4, r3
        blt     LDSS32
        cmn     r4, #2, 18
        movge   r4, r4, lsl #16
        movge   r4, r4, asr #16
        sublt   r4, r8, #0x21, 22
LDSS32:
        strh    r4, [r2, #6]
        ldrsh   r5, [r0, #0xE]
        ldrsh   r4, [r0, #8]
        ldrsh   lr, [r1, #6]
        mvn     r12, r3
        add     r5, r4, r5
        mov     r4, r5, asr #2
        mov     r4, r4, lsl #16
        rsb     r4, lr, r4, asr #16
        cmp     r12, r4
        mvnlt   r4, r3
        blt     LDSS33
        cmn     r4, #2, 18
        movge   r4, r4, lsl #16
        movge   r4, r4, asr #16
        sublt   r4, r8, #0x21, 22
LDSS33:
        strh    r4, [r1, #8]
        ldrsh   r5, [r0, #8]
        ldrsh   r4, [r0, #0xE]
        ldrsh   lr, [r2, #6]
        mvn     r12, r3
        sub     r5, r5, r4
        mov     r4, r5, asr #2
        mov     r4, r4, lsl #16
        add     r4, lr, r4, asr #16
        cmp     r12, r4
        mvnlt   r4, r3
        blt     LDSS34
        cmn     r4, #2, 18
        movge   r4, r4, lsl #16
        movge   r4, r4, asr #16
        sublt   r4, r8, #0x21, 22
LDSS34:
        strh    r4, [r2, #8]
        ldrsh   r5, [r0, #0xC]
        ldrsh   r4, [r0, #0xA]
        ldrsh   lr, [r1, #8]
        mvn     r12, r3
        add     r5, r4, r5
        mov     r4, r5, asr #2
        mov     r4, r4, lsl #16
        rsb     r4, lr, r4, asr #16
        cmp     r12, r4
        mvnlt   r4, r3
        blt     LDSS35
        cmn     r4, #2, 18
        movge   r4, r4, lsl #16
        movge   r4, r4, asr #16
        sublt   r4, r8, #0x21, 22
LDSS35:
        strh    r4, [r1, #0xA]
        ldrsh   r12, [r0, #0xA]
        ldrsh   lr, [r0, #0xC]
        ldrsh   r1, [r2, #8]
        mvn     r0, r3
        sub     r12, r12, lr
        mov     r12, r12, asr #2
        mov     r12, r12, lsl #16
        add     r12, r1, r12, asr #16
        cmp     r0, r12
        mvnlt   r8, r3
        blt     LDSS36
        cmn     r12, #2, 18
        movge   r12, r12, lsl #16
        movge   r8, r12, asr #16
        sublt   r8, r8, #0x21, 22
LDSS36:
        strh    r8, [r2, #0xA]
        mov     r0, #8
        ldmia   sp!, {r1, r4 - r11, pc}
LDSS37:
        mov     r12, #2, 22
        strh    r12, [r1]
        strh    r12, [r2]
        mov     r7, #0
        add     r4, r0, #2
        add     r12, r1, #2
        add     r6, r2, #2
        mov     r5, r1
        mov     lr, r2
        str     r1, [sp]
LDSS38:
        ldrsh   r8, [r4]
        rsb     r1, r7, #0
        ldrsh   r9, [r5], #2
        add     r1, r0, r1, lsl #1
        ldrsh   r11, [r1, #0x14]
        mvn     r10, r3
        add     r11, r8, r11
        mov     r8, r11, asr #1
        mov     r8, r8, lsl #16
        rsb     r8, r9, r8, asr #16
        cmp     r10, r8
        blt     LDSS53
        cmn     r8, #2, 18
        blt     LDSS52
        strh    r8, [r12], #2
        ldrsh   r8, [r4], #2
        ldrsh   r1, [r1, #0x14]
        sub     r8, r8, r1
        ldrsh   r1, [lr], #2
        mov     r8, r8, asr #1
        mov     r8, r8, lsl #16
        add     r8, r1, r8, asr #16
        mvn     r1, r3
        cmp     r1, r8
        blt     LDSS51
        cmn     r8, #2, 18
        blt     LDSS39
        add     r7, r7, #1
        strh    r8, [r6], #2
        cmp     r7, #5
        blt     LDSS38
        mov     r0, #8
        ldmia   sp!, {r1, r4 - r11, pc}
LDSS39:
        ldr     r1, [sp]
        mov     r8, #1, 22
LDSS40:
        strh    r8, [r1]
        strh    r8, [r2]
        ldrsh   r5, [r0, #0x14]
        ldrsh   r4, [r0, #2]
        ldrsh   lr, [r1]
        mvn     r12, r3
        add     r5, r4, r5
        mov     r4, r5, asr #2
        mov     r4, r4, lsl #16
        rsb     r4, lr, r4, asr #16
        cmp     r12, r4
        mvnlt   r4, r3
        blt     LDSS41
        cmn     r4, #2, 18
        movge   r4, r4, lsl #16
        movge   r4, r4, asr #16
        sublt   r4, r8, #0x21, 22
LDSS41:
        strh    r4, [r1, #2]
        ldrsh   r5, [r0, #2]
        ldrsh   r4, [r0, #0x14]
        ldrsh   lr, [r2]
        mvn     r12, r3
        sub     r5, r5, r4
        mov     r4, r5, asr #2
        mov     r4, r4, lsl #16
        add     r4, lr, r4, asr #16
        cmp     r12, r4
        mvnlt   r4, r3
        blt     LDSS42
        cmn     r4, #2, 18
        movge   r4, r4, lsl #16
        movge   r4, r4, asr #16
        sublt   r4, r8, #0x21, 22
LDSS42:
        strh    r4, [r2, #2]
        ldrsh   r5, [r0, #0x12]
        ldrsh   r4, [r0, #4]
        ldrsh   lr, [r1, #2]
        mvn     r12, r3
        add     r5, r4, r5
        mov     r4, r5, asr #2
        mov     r4, r4, lsl #16
        rsb     r4, lr, r4, asr #16
        cmp     r12, r4
        mvnlt   r4, r3
        blt     LDSS43
        cmn     r4, #2, 18
        movge   r4, r4, lsl #16
        movge   r4, r4, asr #16
        sublt   r4, r8, #0x21, 22
LDSS43:
        strh    r4, [r1, #4]
        ldrsh   r5, [r0, #4]
        ldrsh   r4, [r0, #0x12]
        ldrsh   lr, [r2, #2]
        mvn     r12, r3
        sub     r5, r5, r4
        mov     r4, r5, asr #2
        mov     r4, r4, lsl #16
        add     r4, lr, r4, asr #16
        cmp     r12, r4
        mvnlt   r4, r3
        blt     LDSS44
        cmn     r4, #2, 18
        movge   r4, r4, lsl #16
        movge   r4, r4, asr #16
        sublt   r4, r8, #0x21, 22
LDSS44:
        strh    r4, [r2, #4]
        ldrsh   r5, [r0, #0x10]
        ldrsh   r4, [r0, #6]
        ldrsh   lr, [r1, #4]
        mvn     r12, r3
        add     r5, r4, r5
        mov     r4, r5, asr #2
        mov     r4, r4, lsl #16
        rsb     r4, lr, r4, asr #16
        cmp     r12, r4
        mvnlt   r4, r3
        blt     LDSS45
        cmn     r4, #2, 18
        movge   r4, r4, lsl #16
        movge   r4, r4, asr #16
        sublt   r4, r8, #0x21, 22
LDSS45:
        strh    r4, [r1, #6]
        ldrsh   r5, [r0, #6]
        ldrsh   r4, [r0, #0x10]
        ldrsh   lr, [r2, #4]
        mvn     r12, r3
        sub     r5, r5, r4
        mov     r4, r5, asr #2
        mov     r4, r4, lsl #16
        add     r4, lr, r4, asr #16
        cmp     r12, r4
        mvnlt   r4, r3
        blt     LDSS46
        cmn     r4, #2, 18
        movge   r4, r4, lsl #16
        movge   r4, r4, asr #16
        sublt   r4, r8, #0x21, 22
LDSS46:
        strh    r4, [r2, #6]
        ldrsh   r5, [r0, #0xE]
        ldrsh   r4, [r0, #8]
        ldrsh   lr, [r1, #6]
        mvn     r12, r3
        add     r5, r4, r5
        mov     r4, r5, asr #2
        mov     r4, r4, lsl #16
        rsb     r4, lr, r4, asr #16
        cmp     r12, r4
        mvnlt   r4, r3
        blt     LDSS47
        cmn     r4, #2, 18
        movge   r4, r4, lsl #16
        movge   r4, r4, asr #16
        sublt   r4, r8, #0x21, 22
LDSS47:
        strh    r4, [r1, #8]
        ldrsh   r5, [r0, #8]
        ldrsh   r4, [r0, #0xE]
        ldrsh   lr, [r2, #6]
        mvn     r12, r3
        sub     r5, r5, r4
        mov     r4, r5, asr #2
        mov     r4, r4, lsl #16
        add     r4, lr, r4, asr #16
        cmp     r12, r4
        mvnlt   r4, r3
        blt     LDSS48
        cmn     r4, #2, 18
        movge   r4, r4, lsl #16
        movge   r4, r4, asr #16
        sublt   r4, r8, #0x21, 22
LDSS48:
        strh    r4, [r2, #8]
        ldrsh   r5, [r0, #0xC]
        ldrsh   r4, [r0, #0xA]
        ldrsh   lr, [r1, #8]
        mvn     r12, r3
        add     r5, r4, r5
        mov     r4, r5, asr #2
        mov     r4, r4, lsl #16
        rsb     r4, lr, r4, asr #16
        cmp     r12, r4
        mvnlt   r4, r3
        blt     LDSS49
        cmn     r4, #2, 18
        movge   r4, r4, lsl #16
        movge   r4, r4, asr #16
        sublt   r4, r8, #0x21, 22
LDSS49:
        strh    r4, [r1, #0xA]
        ldrsh   r12, [r0, #0xA]
        ldrsh   lr, [r0, #0xC]
        ldrsh   r1, [r2, #8]
        mvn     r0, r3
        sub     r12, r12, lr
        mov     r12, r12, asr #2
        mov     r12, r12, lsl #16
        add     r12, r1, r12, asr #16
        cmp     r0, r12
        sublt   r8, r8, #0x21, 22
        mvnlt   r3, r8
        blt     LDSS50
        cmn     r12, #2, 18
        movge   r12, r12, lsl #16
        movge   r3, r12, asr #16
LDSS50:
        strh    r3, [r2, #0xA]
        mov     r0, #7
        ldmia   sp!, {r1, r4 - r11, pc}
LDSS51:
        ldr     r1, [sp]
        mov     r8, #1, 22
        b       LDSS40
LDSS52:
        ldr     r1, [sp]
        mov     r8, #1, 22
        b       LDSS40
LDSS53:
        ldr     r1, [sp]
        mov     r8, #1, 22
        b       LDSS40
        .long   LDSS_w_eval_tab
        .long   NormTable2
        .long   NormTable
LDSS_ownCalcLSPFromPol:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x48
        ldr     r12, [sp, #0x6C]
        str     r3, [sp, #0x28]
        ldrsh   r4, [r3]
        ldrsh   r3, [r12, #2]
        ldr     lr, [sp, #0x70]
        ldr     r6, [sp, #0x78]
        str     lr, [sp, #0x2C]
        ldr     lr, [sp, #0x74]
        str     r1, [sp, #0x24]
        str     lr, [sp, #0x20]
        str     r2, [sp, #0x30]
        ldrsh   r9, [r12, #4]
        ldrsh   r5, [r12, #8]
        ldrsh   r7, [r12, #0xA]
        mov     r1, #1
        mov     r2, r1, lsl r0
        add     r1, r0, #1
        mov     lr, r3, lsl r6
        mov     r2, r2, lsl #16
        ldrsh   r3, [r12, #6]
        mov     r0, r4, lsl #1
        mov     r2, r2, asr #16
        mla     lr, r0, r2, lr
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r0, r0
        mov     r11, lr, asr #15
        and     r10, lr, r0
        mul     r8, r4, r10
        mov     lr, r11, lsl #16
        mov     r11, r2, lsl #15
        str     r12, [sp, #0x34]
        mov     lr, lr, asr #16
        bic     r8, r8, r0
        str     r8, [sp, #0x40]
        rsb     r11, r11, #0
        mov     r8, lr, lsl #1
        mla     r8, r4, r8, r11
        str     r11, [sp, #0x38]
        ldr     r11, [sp, #0x40]
        mov     r9, r9, lsl r6
        mov     r3, r3, lsl r6
        mov     r5, r5, lsl r6
        add     r9, r9, r11, asr #14
        rsb     r11, r10, #0
        add     r10, r8, r9
        and     r8, r10, r0
        mul     r9, r4, r8
        mov     r10, r10, asr #15
        sub     lr, r11, lr, lsl #15
        mov     r10, r10, lsl #16
        rsb     r8, r8, #0
        bic     r9, r9, r0
        mov     r10, r10, asr #16
        sub     r8, r8, r10, lsl #15
        add     r9, r3, r9, asr #14
        mov     r10, r10, lsl #1
        mla     lr, r4, r10, lr
        sub     r3, r6, #1
        mov     r7, r7, lsl r3
        add     lr, lr, r9
        and     r10, lr, r0
        mul     r9, r4, r10
        mov     lr, lr, asr #15
        rsb     r10, r10, #0
        mov     lr, lr, lsl #16
        bic     r9, r9, r0
        mov     lr, lr, asr #16
        sub     r10, r10, lr, lsl #15
        add     r9, r5, r9, asr #14
        mov     lr, lr, lsl #1
        mla     r8, r4, lr, r8
        add     r8, r8, r9
        and     lr, r8, r0
        mul     lr, r4, lr
        mov     r8, r8, asr #15
        mov     r8, r8, lsl #16
        mov     r8, r8, asr #16
        mla     r10, r4, r8, r10
        add     lr, r7, lr, asr #15
        add     lr, r10, lr
        mov     lr, lr, asr r1
        cmp     r0, lr
        mov     r0, lr, lsl #16
        mov     r7, r0, asr #16
        bge     LDSS54
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r7, r0
        b       LDSS55
LDSS54:
        cmn     lr, #2, 18
        movlt   r0, #0
        sublt   r7, r0, #2, 18
LDSS55:
        mvn     r0, #0xFF
        bic     lr, r0, #0x7F, 24
        mvn     lr, lr
        str     lr, [sp]
        ldr     lr, [sp, #0x34]
        mov     r5, #0
        mov     r0, r5
        str     r0, [sp, #4]
        str     r1, [sp, #0x10]
        str     r3, [sp, #8]
        str     r2, [sp, #0xC]
        str     r12, [sp, #0x1C]
LDSS56:
        ldr     r0, [sp, #0x24]
        cmp     r5, r0
        bge     LDSS77
        ldr     r1, [sp, #0x28]
        ldr     r9, [sp, #0xC]
        add     r5, r5, #1
        str     r4, [sp, #0x18]
        ldrsh   r3, [lr, #6]
        ldrsh   r2, [lr, #8]
        mov     r0, r5, lsl #1
        ldrsh   r8, [lr, #2]
        ldrsh   r4, [r1, +r0]
        ldrsh   r1, [lr, #0xA]
        ldrsh   r12, [lr, #4]
        mov     r8, r8, lsl r6
        mov     r0, r4, lsl #1
        mla     r9, r0, r9, r8
        str     r8, [sp, #0x14]
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r8, r0
        mov     r0, r7
        and     r11, r9, r8
        mul     r7, r4, r11
        mov     r10, r9, asr #15
        rsb     r9, r11, #0
        mov     r10, r10, lsl #16
        ldr     r11, [sp, #0x38]
        bic     r7, r7, r8
        mov     r10, r10, asr #16
        sub     r9, r9, r10, lsl #15
        mov     r7, r7, asr #14
        mov     r10, r10, lsl #1
        mla     r10, r4, r10, r11
        add     r7, r7, r12, lsl r6
        add     r10, r10, r7
        and     r7, r10, r8
        mul     r11, r4, r7
        mov     r10, r10, asr #15
        rsb     r7, r7, #0
        mov     r10, r10, lsl #16
        bic     r11, r11, r8
        mov     r10, r10, asr #16
        sub     r7, r7, r10, lsl #15
        mov     r11, r11, asr #14
        mov     r10, r10, lsl #1
        mla     r9, r4, r10, r9
        add     r10, r11, r3, lsl r6
        add     r10, r9, r10
        and     r9, r10, r8
        mul     r11, r4, r9
        mov     r10, r10, asr #15
        rsb     r9, r9, #0
        mov     r10, r10, lsl #16
        bic     r11, r11, r8
        mov     r10, r10, asr #16
        sub     r9, r9, r10, lsl #15
        mov     r11, r11, asr #14
        mov     r10, r10, lsl #1
        mla     r7, r4, r10, r7
        add     r10, r11, r2, lsl r6
        add     r10, r7, r10
        and     r8, r10, r8
        mul     r7, r4, r8
        mov     r10, r10, asr #15
        mov     r8, r10, lsl #16
        mov     r8, r8, asr #16
        mla     r9, r4, r8, r9
        ldr     r8, [sp, #8]
        mov     r7, r7, asr #15
        add     r8, r7, r1, lsl r8
        ldr     r7, [sp, #0x10]
        add     r9, r9, r8
        mov     r8, r9, asr r7
        ldr     r7, [sp]
        cmp     r7, r8
        mov     r7, r8, lsl #16
        mov     r7, r7, asr #16
        bge     LDSS57
        mvn     r7, #0xFF
        bic     r7, r7, #0x7F, 24
        mvn     r7, r7
        b       LDSS58
LDSS57:
        cmn     r8, #2, 18
        movlt   r7, #0
        sublt   r7, r7, #2, 18
LDSS58:
        mul     r8, r0, r7
        cmp     r8, #0
        bgt     LDSS56
        ldr     lr, [sp, #0x30]
        cmp     lr, #0
        ble     LDSS62
        mov     lr, #0
        str     r0, [sp, #0x40]
        str     r5, [sp, #0x3C]
LDSS59:
        ldr     r0, [sp, #0x18]
        ldr     r10, [sp, #0x14]
        ldr     r8, [sp, #0xC]
        mov     r5, r0, lsl #16
        ldr     r11, [sp, #0x38]
        mvn     r0, #0xFF
        mov     r5, r5, asr #17
        add     r5, r5, r4, asr #1
        bic     r0, r0, #0x7F, 24
        mvn     r9, r0
        mov     r5, r5, lsl #16
        mov     r0, r5, asr #16
        mov     r5, r0, lsl #1
        mla     r5, r5, r8, r10
        and     r8, r5, r9
        mul     r10, r0, r8
        rsb     r8, r8, #0
        mov     r5, r5, asr #15
        mov     r5, r5, lsl #16
        mov     r5, r5, asr #16
        bic     r10, r10, r9
        sub     r8, r8, r5, lsl #15
        mov     r5, r5, lsl #1
        mla     r5, r0, r5, r11
        mov     r10, r10, asr #14
        add     r10, r10, r12, lsl r6
        add     r10, r5, r10
        and     r5, r10, r9
        mul     r11, r0, r5
        mov     r10, r10, asr #15
        rsb     r5, r5, #0
        mov     r10, r10, lsl #16
        bic     r11, r11, r9
        mov     r10, r10, asr #16
        sub     r5, r5, r10, lsl #15
        mov     r11, r11, asr #14
        mov     r10, r10, lsl #1
        mla     r8, r0, r10, r8
        add     r11, r11, r3, lsl r6
        add     r10, r8, r11
        and     r8, r10, r9
        mul     r11, r0, r8
        mov     r10, r10, asr #15
        rsb     r8, r8, #0
        mov     r10, r10, lsl #16
        bic     r11, r11, r9
        mov     r10, r10, asr #16
        sub     r8, r8, r10, lsl #15
        mov     r11, r11, asr #14
        mov     r10, r10, lsl #1
        mla     r5, r0, r10, r5
        add     r11, r11, r2, lsl r6
        add     r10, r5, r11
        and     r9, r10, r9
        mul     r5, r0, r9
        mov     r10, r10, asr #15
        ldr     r9, [sp, #8]
        mov     r10, r10, lsl #16
        mov     r10, r10, asr #16
        mla     r8, r0, r10, r8
        mov     r5, r5, asr #15
        add     r9, r5, r1, lsl r9
        ldr     r5, [sp, #0x10]
        add     r9, r8, r9
        ldr     r8, [sp]
        mov     r5, r9, asr r5
        cmp     r8, r5
        mov     r8, r5, lsl #16
        mov     r8, r8, asr #16
        bge     LDSS60
        mvn     r5, #0xFF
        bic     r5, r5, #0x7F, 24
        mvn     r8, r5
        b       LDSS61
LDSS60:
        cmn     r5, #2, 18
        movlt   r5, #0
        sublt   r8, r5, #2, 18
LDSS61:
        mul     r5, r7, r8
        cmp     r5, #0
        strle   r8, [sp, #0x40]
        strle   r0, [sp, #0x18]
        movgt   r4, r0
        movgt   r7, r8
        ldr     r0, [sp, #0x30]
        add     lr, lr, #1
        cmp     lr, r0
        blt     LDSS59
        ldr     r0, [sp, #0x40]
        ldr     r5, [sp, #0x3C]
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
LDSS62:
        ldr     r1, [sp]
        sub     r0, r0, r7
        cmp     r1, r0
        blt     LDSS63
        cmn     r0, #2, 18
        movge   r0, r0, lsl #16
        movge   r8, r0, asr #16
        movlt   r0, #0
        sublt   r8, r0, #2, 18
        b       LDSS64
LDSS63:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r8, r0
LDSS64:
        cmp     r8, #0
        beq     LDSS71
        cmn     r8, #2, 18
        beq     LDSS76
        eor     r0, r8, r8, asr #31
        sub     r0, r0, r8, asr #31
        mov     r0, r0, lsl #16
        mov     r1, r0, asr #16
LDSS65:
        mov     r0, #0
        cmp     r1, #1, 18
        str     r0, [sp, #0x14]
        bge     LDSS67
        mov     r2, r1
        ldr     r0, [sp, #0x14]
LDSS66:
        mov     r2, r2, lsl #1
        add     r0, r0, #1
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #16
        cmp     r2, #1, 18
        blt     LDSS66
        str     r0, [sp, #0x14]
LDSS67:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        add     r0, r0, #2, 4
        bl      __intel_idiv
        ldr     r1, [sp, #0x14]
        ldr     r2, [sp]
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        mov     r0, r0, asr r1
        str     r1, [sp, #0x14]
        ldr     r1, [sp, #0x18]
        mov     r0, r0, lsl #16
        sub     r1, r1, r4
        cmp     r2, r1
        mov     r0, r0, asr #16
        blt     LDSS68
        cmn     r1, #2, 18
        movge   r1, r1, lsl #16
        movge   r1, r1, asr #16
        movlt   r1, #0
        sublt   r1, r1, #2, 18
        b       LDSS69
LDSS68:
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r1, r1
LDSS69:
        mul     r0, r0, r1
        ldr     r1, [sp, #0x14]
        cmp     r8, #0
        rsb     r1, r1, #0x13
        mov     r1, r0, asr r1
        mov     r0, r1, lsl #16
        mov     r0, r0, asr #16
        blt     LDSS74
LDSS70:
        mul     r0, r7, r0
        sub     r4, r4, r0, asr #10
        mov     r0, r4, lsl #16
        mov     r4, r0, asr #16
LDSS71:
        ldr     r1, [sp, #4]
        mov     r0, r1, lsl #1
        add     r1, r1, #1
        str     r1, [sp, #4]
        tst     r1, #1
        ldr     r1, [sp, #0x20]
        strh    r4, [r1, +r0]
        ldreq   lr, [sp, #0x1C]
        ldrne   lr, [sp, #0x2C]
        ldrsh   r0, [lr, #2]
        ldrsh   r1, [lr, #4]
        ldrsh   r2, [lr, #6]
        mov     r0, r0, lsl r6
        mov     r3, r4, lsl #1
        str     r2, [sp, #0x40]
        ldrsh   r2, [lr, #8]
        str     r2, [sp, #0x18]
        ldrsh   r2, [lr, #0xA]
        str     r2, [sp, #0x14]
        ldr     r2, [sp, #0xC]
        ldr     r7, [sp, #0x14]
        mla     r3, r3, r2, r0
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r0, r0
        mov     r2, r1, lsl r6
        mov     r12, r3, asr #15
        and     r3, r3, r0
        mul     r1, r4, r3
        mov     r12, r12, lsl #16
        rsb     r3, r3, #0
        mov     r12, r12, asr #16
        sub     r3, r3, r12, lsl #15
        str     r3, [sp, #0x44]
        bic     r3, r1, r0
        ldr     r1, [sp, #0x38]
        mov     r12, r12, lsl #1
        add     r3, r2, r3, asr #14
        mla     r1, r4, r12, r1
        ldr     r2, [sp, #0x40]
        ldr     r12, [sp, #0x18]
        mov     r2, r2, lsl r6
        mov     r12, r12, lsl r6
        str     r12, [sp, #0x40]
        ldr     r12, [sp, #8]
        mov     r12, r7, lsl r12
        str     r12, [sp, #0x18]
        add     r12, r1, r3
        and     r3, r12, r0
        mul     r1, r4, r3
        mov     r12, r12, asr #15
        rsb     r3, r3, #0
        mov     r12, r12, lsl #16
        bic     r1, r1, r0
        mov     r12, r12, asr #16
        sub     r3, r3, r12, lsl #15
        str     r3, [sp, #0x14]
        ldr     r3, [sp, #0x44]
        mov     r12, r12, lsl #1
        add     r1, r2, r1, asr #14
        mla     r12, r4, r12, r3
        add     r12, r12, r1
        and     r3, r12, r0
        mul     r1, r4, r3
        mov     r2, r12, asr #15
        rsb     r3, r3, #0
        mov     r2, r2, lsl #16
        mov     r12, r2, asr #16
        bic     r2, r1, r0
        sub     r1, r3, r12, lsl #15
        ldr     r3, [sp, #0x14]
        mov     r12, r12, lsl #1
        mla     r3, r4, r12, r3
        ldr     r12, [sp, #0x40]
        add     r2, r12, r2, asr #14
        add     r3, r3, r2
        and     r0, r3, r0
        mul     r0, r4, r0
        mov     r3, r3, asr #15
        mov     r2, r3, lsl #16
        mov     r2, r2, asr #16
        mla     r1, r4, r2, r1
        ldr     r2, [sp, #0x18]
        add     r0, r2, r0, asr #15
        add     r1, r1, r0
        ldr     r0, [sp, #0x10]
        mov     r0, r1, asr r0
        ldr     r1, [sp]
        cmp     r1, r0
        mov     r1, r0, lsl #16
        mov     r7, r1, asr #16
        bge     LDSS72
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r7, r0
        b       LDSS73
LDSS72:
        cmn     r0, #2, 18
        mvnlt   r0, #0xFF
        biclt   r7, r0, #0x7F, 24
LDSS73:
        ldr     r0, [sp, #4]
        cmp     r0, #0xA
        blt     LDSS56
        ldr     r0, [sp, #4]
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LDSS74:
        cmn     r0, #2, 18
        beq     LDSS75
        rsb     r0, r0, #0
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LDSS70
LDSS75:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r0, r0
        b       LDSS70
LDSS76:
        mov     r0, #0
        sub     r0, r0, #2, 18
        mvn     r1, r0
        b       LDSS65
LDSS77:
        ldr     r0, [sp, #4]
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}


        .data
        .align  4


LDSS_w_eval_tab:
        .long   LDSS_w_eval_60
        .long   LDSS_w_eval_50
LDSS_w_eval_60:
        .byte   0xF8,0x7F,0xD3,0x7F,0x4C,0x7F,0x6C,0x7E,0x33,0x7D,0xA3,0x7B,0xBC,0x79,0x7F,0x77
        .byte   0xEF,0x74,0x0C,0x72,0xD9,0x6E,0x59,0x6B,0x8D,0x67,0x79,0x63,0x1F,0x5F,0x82,0x5A
        .byte   0xA6,0x55,0x8D,0x50,0x3C,0x4B,0xB6,0x45,0x00,0x40,0x1C,0x3A,0x0F,0x34,0xDF,0x2D
        .byte   0x8D,0x27,0x20,0x21,0x9C,0x1A,0x06,0x14,0x61,0x0D,0xB2,0x06,0x00,0x00,0x4E,0xF9
        .byte   0x9F,0xF2,0xFA,0xEB,0x64,0xE5,0xE0,0xDE,0x73,0xD8,0x21,0xD2,0xF1,0xCB,0xE4,0xC5
        .byte   0x00,0xC0,0x4A,0xBA,0xC4,0xB4,0x73,0xAF,0x5A,0xAA,0x7E,0xA5,0xE1,0xA0,0x87,0x9C
        .byte   0x73,0x98,0xA7,0x94,0x27,0x91,0xF4,0x8D,0x11,0x8B,0x81,0x88,0x44,0x86,0x5D,0x84
        .byte   0xCD,0x82,0x94,0x81,0xB4,0x80,0x2D,0x80,0x08,0x80,0x08,0x80,0x08,0x80,0x08,0x80
        .byte   0x08,0x80,0x00,0x00
LDSS_w_eval_50:
        .byte   0xF8,0x7F,0xBF,0x7F,0xFD,0x7E,0xBB,0x7D,0xFA,0x7B,0xBC,0x79,0x02,0x77,0xD1,0x73
        .byte   0x2A,0x70,0x12,0x6C,0x8D,0x67,0xA0,0x62,0x4E,0x5D,0x9F,0x57,0x97,0x51,0x3C,0x4B
        .byte   0x95,0x44,0xAA,0x3D,0x7F,0x36,0x1E,0x2F,0x8D,0x27,0xD5,0x1F,0xFC,0x17,0x0A,0x10
        .byte   0x09,0x08,0x00,0x00,0xF7,0xF7,0xF6,0xEF,0x04,0xE8,0x2B,0xE0,0x73,0xD8,0xE2,0xD0
        .byte   0x81,0xC9,0x56,0xC2,0x6B,0xBB,0xC4,0xB4,0x69,0xAE,0x61,0xA8,0xB2,0xA2,0x60,0x9D
        .byte   0x73,0x98,0xEE,0x93,0xD6,0x8F,0x2F,0x8C,0xFE,0x88,0x44,0x86,0x06,0x84,0x45,0x82
        .byte   0x03,0x81,0x41,0x80,0x08,0x80,0x08,0x80,0x08,0x80,0x00,0x00


