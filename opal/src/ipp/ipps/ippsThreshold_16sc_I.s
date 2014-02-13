        .text
        .align  4
        .globl  _ippsThreshold_16sc_I


_ippsThreshold_16sc_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x44
        mov     r4, r0
        cmp     r4, #0
        mov     r11, r1
        beq     LARQ18
        cmp     r11, #0
        ble     LARQ17
        cmp     r2, #0
        blt     LARQ19
        smull   r6, r5, r2, r2
        cmp     r3, #4
        mov     r7, #0
        beq     LARQ10
        str     r2, [sp, #0x2C]
LARQ0:
        ldrsh   r2, [r4]
        str     r2, [sp, #0x18]
        ldrsh   r3, [r4, #2]
        smull   lr, r2, r2, r2
        smull   r12, r1, r3, r3
        str     r3, [sp, #0x14]
        adds    r8, lr, r12
        adc     r9, r2, r1
        cmp     r8, r6
        sbcs    r10, r9, r5
        bge     LARQ7
        orrs    r10, r8, r9
        ldreq   r2, [sp, #0x2C]
        streqh  r2, [r4]
        beq     LARQ7
        umull   r0, r10, r6, lr
        mla     r10, r6, r2, r10
        mov     r2, r8
        str     r0, [sp, #0x34]
        umull   r3, r0, r6, r12
        mla     r1, r6, r1, r0
        mla     r10, r5, lr, r10
        ldr     r0, [sp, #0x34]
        str     r3, [sp, #0x28]
        mla     r1, r5, r12, r1
        mov     r3, r9
        str     r10, [sp, #0x38]
        str     r1, [sp, #0x1C]
        ldr     r1, [sp, #0x38]
        bl      __divdi3
        mov     r10, r0
        umull   lr, r12, r10, r8
        mla     r12, r10, r9, r12
        ldr     r0, [sp, #0x28]
        str     r10, [sp, #0x10]
        str     lr, [sp, #0x3C]
        mla     r12, r1, r8, r12
        str     r1, [sp, #8]
        ldr     r1, [sp, #0x1C]
        mov     r2, r8
        mov     r3, r9
        str     r12, [sp, #0x40]
        bl      __divdi3
        str     r1, [sp, #4]
        ldr     r1, [sp, #8]
        str     r0, [sp]
        mov     r0, r10
        bl      __floatdidf
        bl      sqrt
        bl      __fixdfdi
        mov     r10, r0
        umull   lr, r12, r10, r10
        str     r1, [sp, #0xC]
        ldr     r0, [sp]
        ldr     r1, [sp, #4]
        str     lr, [sp, #0x20]
        str     r12, [sp, #0x24]
        bl      __floatdidf
        bl      sqrt
        bl      __fixdfdi
        ldr     r12, [sp, #0x40]
        ldr     lr, [sp, #0x38]
        cmp     lr, r12
        ldr     r12, [sp, #0x3C]
        ldr     lr, [sp, #0x34]
        cmpeq   lr, r12
        beq     LARQ1
        ldr     lr, [sp, #0x24]
        ldr     r12, [sp, #0xC]
        ldr     r2, [sp, #0x20]
        ldr     r3, [sp, #0x10]
        mla     lr, r10, r12, lr
        cmp     r3, r2
        mla     lr, r12, r10, lr
        ldr     r12, [sp, #8]
        sbcs    r12, r12, lr
        blt     LARQ2
        adds    r10, r10, #1
        b       LARQ2
LARQ1:
        ldr     r12, [sp, #0x24]
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #0x20]
        ldr     lr, [sp, #0x10]
        mla     r12, r10, r2, r12
        subs    lr, lr, r3
        mla     r12, r2, r10, r12
        ldr     r2, [sp, #8]
        sbcs    r2, r2, r12
        movlt   lr, #0
        movlt   r2, #0
        orrs    r2, lr, r2
        beq     LARQ2
        adds    r10, r10, #1
LARQ2:
        ldr     r2, [sp]
        umull   r12, lr, r2, r8
        mla     r9, r2, r9, lr
        ldr     r2, [sp, #4]
        umull   lr, r3, r0, r0
        mla     r9, r2, r8, r9
        ldr     r2, [sp, #0x1C]
        cmp     r2, r9
        ldreq   r2, [sp, #0x28]
        cmpeq   r2, r12
        beq     LARQ3
        mla     r3, r0, r1, r3
        ldr     r2, [sp]
        cmp     r2, lr
        ldr     r2, [sp, #4]
        mla     r3, r1, r0, r3
        sbcs    r2, r2, r3
        blt     LARQ4
        adds    r0, r0, #1
        b       LARQ4
LARQ3:
        mla     r3, r0, r1, r3
        ldr     r2, [sp]
        subs    lr, r2, lr
        ldr     r2, [sp, #4]
        mla     r3, r1, r0, r3
        sbcs    r2, r2, r3
        movlt   lr, #0
        movlt   r2, #0
        orrs    r2, lr, r2
        beq     LARQ4
        adds    r0, r0, #1
LARQ4:
        ldr     r2, [sp, #0x18]
        cmp     r2, #0
        blt     LARQ9
LARQ5:
        ldr     r2, [sp, #0x14]
        cmp     r2, #0
        blt     LARQ8
LARQ6:
        strh    r10, [r4]
        strh    r0, [r4, #2]
LARQ7:
        add     r7, r7, #1
        cmp     r7, r11
        add     r4, r4, #4
        blt     LARQ0
        mov     r0, #0
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LARQ8:
        rsbs    r0, r0, #0
        b       LARQ6
LARQ9:
        rsbs    r10, r10, #0
        b       LARQ5
LARQ10:
        str     r11, [sp, #0x30]
LARQ11:
        ldrsh   r1, [r4]
        str     r1, [sp, #0x2C]
        ldrsh   r2, [r4, #2]
        smull   r1, lr, r1, r1
        smull   r12, r10, r2, r2
        str     r2, [sp, #0x28]
        adds    r8, r1, r12
        adc     r9, lr, r10
        subs    r11, r8, r6
        sbcs    r0, r9, r5
        movlt   r11, #0
        movlt   r0, #0
        orrs    r0, r11, r0
        beq     LARQ14
        umull   r0, r3, r6, r1
        umull   r2, r11, r6, r12
        mla     lr, r6, lr, r3
        mla     r10, r6, r10, r11
        mov     r3, r9
        str     r2, [sp, #0x40]
        mov     r2, r8
        mla     r1, r5, r1, lr
        mla     r10, r5, r12, r10
        str     r10, [sp, #0x3C]
        bl      __divdi3
        mov     r11, r0
        ldr     r0, [sp, #0x40]
        mov     r10, r1
        ldr     r1, [sp, #0x3C]
        mov     r3, r9
        mov     r2, r8
        bl      __divdi3
        str     r1, [sp, #0x24]
        mov     r9, r0
        str     r9, [sp, #0x20]
        mov     r1, r10
        mov     r0, r11
        bl      __floatdidf
        bl      sqrt
        bl      __fixdfdi
        str     r1, [sp, #0x40]
        ldr     r1, [sp, #0x24]
        mov     r8, r0
        mov     r0, r9
        bl      __floatdidf
        bl      sqrt
        adds    r9, r8, #1
        umull   r3, r2, r9, r9
        str     r3, [sp, #0x3C]
        ldr     r3, [sp, #0x40]
        adc     r3, r3, #0
        mla     r2, r9, r3, r2
        str     r3, [sp, #0x40]
        str     r2, [sp, #0x38]
        bl      __fixdfdi
        ldr     r2, [sp, #0x3C]
        ldr     r3, [sp, #0x38]
        cmp     r11, r2
        ldr     r2, [sp, #0x40]
        mla     r2, r2, r9, r3
        sbcs    r10, r10, r2
        movge   r8, r9
        adds    r2, r0, #1
        umull   r3, r12, r2, r2
        adc     r1, r1, #0
        mla     r12, r2, r1, r12
        ldr     lr, [sp, #0x20]
        cmp     lr, r3
        mla     r12, r1, r2, r12
        ldr     r1, [sp, #0x24]
        sbcs    r1, r1, r12
        movge   r0, r2
        ldr     r1, [sp, #0x2C]
        cmp     r1, #0
        blt     LARQ16
LARQ12:
        ldr     r1, [sp, #0x28]
        cmp     r1, #0
        blt     LARQ15
LARQ13:
        strh    r8, [r4]
        strh    r0, [r4, #2]
LARQ14:
        ldr     r1, [sp, #0x30]
        add     r7, r7, #1
        add     r4, r4, #4
        cmp     r7, r1
        blt     LARQ11
        mov     r0, #0
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LARQ15:
        rsbs    r0, r0, #0
        b       LARQ13
LARQ16:
        rsbs    r8, r8, #0
        b       LARQ12
LARQ17:
        mvn     r0, #5
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LARQ18:
        mvn     r0, #7
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LARQ19:
        mvn     r0, #0x12
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}


