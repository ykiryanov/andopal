        .text
        .align  4
        .globl  _ippsThreshold_16sc


_ippsThreshold_16sc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x44
        ldr     r12, [sp, #0x68]
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        beq     LARR20
        cmp     r4, #0
        beq     LARR20
        cmp     r2, #0
        ble     LARR19
        cmp     r3, #0
        blt     LARR21
        smull   r8, r7, r3, r3
        cmp     r12, #4
        mov     r6, #0
        mov     r12, r6
        beq     LARR12
        str     r3, [sp, #0x30]
        str     r2, [sp, #0x14]
LARR0:
        ldrsh   r2, [r5, #2]
        ldrsh   r11, [r5]
        smull   r12, r1, r2, r2
        str     r2, [sp, #0x20]
        smull   lr, r0, r11, r11
        adds    r9, lr, r12
        adc     r10, r0, r1
        cmp     r9, r8
        sbcs    r2, r10, r7
        blt     LARR1
        strh    r11, [r4]
        ldrsh   r2, [r5, #2]
        strh    r2, [r4, #2]
        b       LARR9
LARR1:
        orrs    r2, r9, r10
        beq     LARR8
        umull   r2, r3, r8, lr
        str     r3, [sp, #0x28]
        str     r2, [sp, #0x34]
        umull   r3, r2, r8, r12
        mla     r2, r8, r1, r2
        str     r3, [sp, #0x2C]
        ldr     r3, [sp, #0x28]
        mla     r3, r8, r0, r3
        ldr     r0, [sp, #0x34]
        str     r2, [sp, #0x24]
        mov     r2, r9
        str     r3, [sp, #0x28]
        ldr     r1, [sp, #0x28]
        mov     r3, r10
        mla     r1, r7, lr, r1
        ldr     lr, [sp, #0x24]
        mla     lr, r7, r12, lr
        str     r1, [sp, #0x38]
        ldr     r1, [sp, #0x38]
        str     lr, [sp, #0x1C]
        bl      __divdi3
        umull   lr, r12, r0, r9
        str     r0, [sp, #0xC]
        ldr     r0, [sp, #0x2C]
        mov     r2, r9
        str     lr, [sp, #0x3C]
        ldr     lr, [sp, #0xC]
        mov     r3, r10
        mla     r12, lr, r10, r12
        str     r1, [sp, #0x18]
        mla     r12, r1, r9, r12
        ldr     r1, [sp, #0x1C]
        str     r12, [sp, #0x40]
        bl      __divdi3
        str     r0, [sp, #4]
        ldr     r0, [sp, #0xC]
        str     r1, [sp, #8]
        ldr     r1, [sp, #0x18]
        bl      __floatdidf
        bl      sqrt
        bl      __fixdfdi
        umull   r12, lr, r0, r0
        str     r0, [sp]
        str     r1, [sp, #0x10]
        ldr     r0, [sp, #4]
        ldr     r1, [sp, #8]
        str     r12, [sp, #0x24]
        str     lr, [sp, #0x28]
        bl      __floatdidf
        bl      sqrt
        bl      __fixdfdi
        ldr     r12, [sp, #0x40]
        ldr     lr, [sp, #0x38]
        cmp     lr, r12
        ldr     r12, [sp, #0x3C]
        ldr     lr, [sp, #0x34]
        cmpeq   lr, r12
        beq     LARR2
        ldr     r2, [sp, #0x28]
        ldr     r12, [sp]
        ldr     lr, [sp, #0x10]
        ldr     r3, [sp, #0xC]
        mla     r2, r12, lr, r2
        str     r2, [sp, #0x40]
        ldr     r2, [sp, #0x24]
        cmp     r3, r2
        ldr     r2, [sp, #0x40]
        mla     r2, lr, r12, r2
        ldr     r12, [sp, #0x18]
        sbcs    r12, r12, r2
        blt     LARR3
        ldr     r12, [sp]
        adds    r12, r12, #1
        str     r12, [sp]
        b       LARR3
LARR2:
        ldr     r12, [sp, #0x28]
        ldr     lr, [sp, #0x10]
        ldr     r2, [sp]
        ldr     r3, [sp, #0x24]
        mla     r12, r2, lr, r12
        str     r12, [sp, #0x40]
        ldr     r12, [sp, #0xC]
        subs    r12, r12, r3
        ldr     r3, [sp, #0x40]
        mla     r3, lr, r2, r3
        ldr     lr, [sp, #0x18]
        sbcs    lr, lr, r3
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        beq     LARR3
        ldr     r12, [sp]
        adds    r12, r12, #1
        str     r12, [sp]
LARR3:
        ldr     lr, [sp, #4]
        umull   r2, r12, lr, r9
        mla     r10, lr, r10, r12
        ldr     lr, [sp, #8]
        umull   r12, r3, r0, r0
        str     r2, [sp, #0x40]
        ldr     r2, [sp, #0x1C]
        mla     r10, lr, r9, r10
        cmp     r2, r10
        ldreq   lr, [sp, #0x2C]
        ldr     r2, [sp, #0x40]
        cmpeq   lr, r2
        beq     LARR4
        mla     r3, r0, r1, r3
        ldr     r2, [sp, #4]
        cmp     r2, r12
        ldr     r2, [sp, #8]
        mla     r3, r1, r0, r3
        sbcs    r2, r2, r3
        blt     LARR5
        adds    r0, r0, #1
        b       LARR5
LARR4:
        mla     r3, r0, r1, r3
        ldr     r2, [sp, #4]
        subs    r12, r2, r12
        ldr     r2, [sp, #8]
        mla     r3, r1, r0, r3
        sbcs    r2, r2, r3
        movlt   r12, #0
        movlt   r2, #0
        orrs    r2, r12, r2
        beq     LARR5
        adds    r0, r0, #1
LARR5:
        cmp     r11, #0
        blt     LARR11
LARR6:
        ldr     r2, [sp, #0x20]
        cmp     r2, #0
        blt     LARR10
LARR7:
        ldr     r2, [sp]
        strh    r0, [r4, #2]
        strh    r2, [r4]
        b       LARR9
LARR8:
        mov     r2, #0
        strh    r2, [r4, #2]
        ldr     r2, [sp, #0x30]
        strh    r2, [r4]
LARR9:
        ldr     r2, [sp, #0x14]
        add     r6, r6, #1
        add     r4, r4, #4
        cmp     r6, r2
        add     r5, r5, #4
        blt     LARR0
        mov     r0, #0
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LARR10:
        rsbs    r0, r0, #0
        b       LARR7
LARR11:
        ldr     r2, [sp]
        rsbs    r2, r2, #0
        str     r2, [sp]
        b       LARR6
LARR12:
        str     r2, [sp, #0x14]
LARR13:
        ldrsh   r3, [r5, #2]
        ldrsh   r11, [r5]
        smull   r12, r1, r3, r3
        str     r3, [sp, #0x30]
        smull   lr, r2, r11, r11
        adds    r9, lr, r12
        adc     r10, r2, r1
        subs    r0, r9, r8
        sbcs    r3, r10, r7
        movlt   r0, #0
        movlt   r3, #0
        orrs    r3, r0, r3
        streqh  r11, [r4]
        ldreqsh r0, [r5, #2]
        beq     LARR16
        umull   r3, r0, r8, lr
        str     r0, [sp, #0x40]
        str     r3, [sp, #0x3C]
        umull   r3, r0, r8, r12
        mla     r0, r8, r1, r0
        str     r3, [sp, #0x38]
        ldr     r3, [sp, #0x40]
        mla     r3, r8, r2, r3
        mov     r2, r9
        str     r0, [sp, #0x34]
        ldr     r0, [sp, #0x3C]
        str     r3, [sp, #0x40]
        ldr     r1, [sp, #0x40]
        mov     r3, r10
        mla     r1, r7, lr, r1
        ldr     lr, [sp, #0x34]
        mla     lr, r7, r12, lr
        str     lr, [sp, #0x40]
        bl      __divdi3
        str     r0, [sp, #0x3C]
        ldr     r0, [sp, #0x38]
        str     r1, [sp, #0x34]
        ldr     r1, [sp, #0x40]
        mov     r3, r10
        mov     r2, r9
        bl      __divdi3
        str     r0, [sp, #0x28]
        mov     r10, r1
        ldr     r0, [sp, #0x3C]
        ldr     r1, [sp, #0x34]
        str     r10, [sp, #0x2C]
        bl      __floatdidf
        bl      sqrt
        bl      __fixdfdi
        mov     r9, r0
        ldr     r0, [sp, #0x28]
        str     r1, [sp, #0x40]
        mov     r1, r10
        bl      __floatdidf
        bl      sqrt
        adds    r10, r9, #1
        umull   r3, r2, r10, r10
        str     r3, [sp, #0x38]
        ldr     r3, [sp, #0x40]
        adc     r3, r3, #0
        mla     r2, r10, r3, r2
        str     r3, [sp, #0x40]
        str     r2, [sp, #0x24]
        bl      __fixdfdi
        ldr     r2, [sp, #0x3C]
        ldr     r3, [sp, #0x38]
        cmp     r2, r3
        ldr     r2, [sp, #0x40]
        ldr     r3, [sp, #0x24]
        mla     r2, r2, r10, r3
        ldr     r3, [sp, #0x34]
        sbcs    r3, r3, r2
        movge   r9, r10
        adds    r3, r0, #1
        umull   r2, r12, r3, r3
        adc     r1, r1, #0
        mla     r12, r3, r1, r12
        ldr     lr, [sp, #0x28]
        cmp     lr, r2
        ldr     r2, [sp, #0x2C]
        mla     r12, r1, r3, r12
        sbcs    r2, r2, r12
        movge   r0, r3
        cmp     r11, #0
        blt     LARR18
LARR14:
        ldr     r2, [sp, #0x30]
        cmp     r2, #0
        blt     LARR17
LARR15:
        strh    r9, [r4]
LARR16:
        strh    r0, [r4, #2]
        ldr     r2, [sp, #0x14]
        add     r6, r6, #1
        add     r4, r4, #4
        cmp     r6, r2
        add     r5, r5, #4
        blt     LARR13
        mov     r0, #0
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LARR17:
        rsbs    r0, r0, #0
        b       LARR15
LARR18:
        rsbs    r9, r9, #0
        b       LARR14
LARR19:
        mvn     r0, #5
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LARR20:
        mvn     r0, #7
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LARR21:
        mvn     r0, #0x12
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}


