        .text
        .align  4
        .globl  _ippsPostFilter_G728_16s


_ippsPostFilter_G728_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x2C
        ldr     r4, [sp, #0x50]
        ldr     r12, [sp, #0x54]
        ldr     r6, [sp, #0x58]
        ldr     lr, [sp, #0x5C]
        cmp     r4, #0
        beq     LDFY4
        cmp     r12, #0
        beq     LDFY4
        cmp     r6, #0
        beq     LDFY4
        cmp     lr, #0
        beq     LDFY4
        mvn     r5, #0xFF
        bic     r7, r5, #0x7F, 24
        rsb     r2, r2, #0
        mov     r5, #0xFF
        sub     r8, r7, #2, 2
        add     r2, r12, r2, lsl #1
        orr     r5, r5, #0x7F, 24
        mov     r7, #5
        str     r8, [sp]
        str     r6, [sp, #0x10]
        str     r3, [sp, #8]
        str     r1, [sp, #4]
        str     r0, [sp, #0xC]
LDFY0:
        ldr     r0, [sp, #0xC]
        ldrsh   r1, [r12], #2
        ldrsh   r3, [r2], #2
        ldrsh   r6, [r4, #0x12]
        ldrsh   r8, [lr, #0x10]
        mul     r0, r0, r1
        ldr     r1, [sp, #4]
        mla     r0, r1, r3, r0
        ldrsh   r3, [lr, #0x12]
        ldrsh   r1, [lr, #0x10]
        strh    r1, [lr, #0x12]
        ldrsh   r1, [r4, #0x10]
        mla     r3, r3, r6, r0
        ldrsh   r6, [lr, #0xE]
        mov     r0, r0, lsl #2
        strh    r6, [lr, #0x10]
        ldrsh   r6, [lr, #0xE]
        mla     r3, r8, r1, r3
        ldrsh   r8, [r4, #0xE]
        ldrsh   r1, [lr, #0xC]
        strh    r1, [lr, #0xE]
        ldrsh   r1, [lr, #0xA]
        mla     r3, r6, r8, r3
        ldrsh   r8, [r4, #0xC]
        ldrsh   r6, [lr, #0xC]
        strh    r1, [lr, #0xC]
        ldrsh   r1, [lr, #8]
        mla     r3, r6, r8, r3
        ldrsh   r8, [r4, #0xA]
        ldrsh   r6, [lr, #0xA]
        strh    r1, [lr, #0xA]
        ldrsh   r1, [lr, #6]
        mla     r3, r6, r8, r3
        ldrsh   r8, [r4, #8]
        ldrsh   r6, [lr, #8]
        strh    r1, [lr, #8]
        ldrsh   r1, [lr, #4]
        mla     r3, r6, r8, r3
        ldrsh   r8, [r4, #6]
        ldrsh   r6, [lr, #6]
        strh    r1, [lr, #6]
        ldrsh   r1, [lr, #2]
        mla     r3, r6, r8, r3
        ldrsh   r8, [r4, #4]
        ldrsh   r6, [lr, #4]
        strh    r1, [lr, #4]
        ldrsh   r1, [lr]
        mla     r3, r6, r8, r3
        ldrsh   r6, [lr, #2]
        ldrsh   r8, [r4, #2]
        strh    r1, [lr, #2]
        mla     r1, r6, r8, r3
        ldrsh   r6, [lr]
        ldrsh   r3, [r4]
        ldr     r8, [sp]
        mla     r1, r3, r6, r1
        cmp     r8, r0
        str     r1, [sp, #0x14]
        movle   r0, #0xFF
        orrle   r0, r0, #0x7F, 24
        ble     LDFY1
        add     r0, r0, #2, 18
        mov     r0, r0, asr #16
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
LDFY1:
        ldrsh   r3, [lr, #0x2E]
        ldrsh   r10, [lr, #0x2E]
        ldrsh   r6, [lr, #0x30]
        strh    r0, [lr]
        ldrsh   r0, [lr, #0x32]
        ldrsh   r8, [r4, #0x26]
        strh    r6, [lr, #0x32]
        ldrsh   r6, [r4, #0x24]
        ldrsh   r1, [lr, #0x30]
        mul     r0, r0, r8
        strh    r3, [lr, #0x30]
        ldrsh   r3, [lr, #0x2C]
        mul     r1, r1, r6
        ldrsh   r9, [r4, #0x22]
        ldrsh   r6, [lr, #0x2A]
        ldrsh   r8, [lr, #0x2C]
        mul     r9, r10, r9
        strh    r3, [lr, #0x2E]
        ldrsh   r3, [r4, #0x20]
        mul     r3, r8, r3
        str     r9, [sp, #0x18]
        ldrsh   r9, [lr, #0x2A]
        str     r3, [sp, #0x1C]
        ldrsh   r3, [lr, #0x28]
        strh    r6, [lr, #0x2C]
        ldrsh   r8, [r4, #0x1E]
        ldrsh   r6, [lr, #0x28]
        mul     r8, r9, r8
        str     r8, [sp, #0x20]
        strh    r3, [lr, #0x2A]
        ldrsh   r8, [lr, #0x26]
        ldrsh   r9, [r4, #0x1C]
        ldrsh   r3, [lr, #0x26]
        strh    r8, [lr, #0x28]
        ldrsh   r10, [r4, #0x1A]
        ldrsh   r8, [lr, #0x24]
        mul     r6, r6, r9
        ldrsh   r9, [lr, #0x24]
        mul     r3, r3, r10
        strh    r8, [lr, #0x26]
        ldrsh   r8, [lr, #0x22]
        ldrsh   r11, [r4, #0x18]
        ldrsh   r10, [lr, #0x22]
        str     r8, [sp, #0x24]
        mul     r8, r9, r11
        ldrsh   r9, [lr, #0x20]
        strh    r10, [lr, #0x24]
        ldrsh   r10, [lr, #0x20]
        ldrsh   r11, [r4, #0x16]
        str     r10, [sp, #0x28]
        strh    r9, [lr, #0x22]
        ldr     r10, [sp, #0x14]
        sub     r10, r10, r0
        ldr     r0, [sp, #0x24]
        sub     r10, r10, r1
        ldr     r1, [sp, #0x18]
        mul     r0, r0, r11
        sub     r10, r10, r1
        ldr     r1, [sp, #0x1C]
        sub     r10, r10, r1
        ldr     r1, [sp, #0x20]
        sub     r10, r10, r1
        ldrsh   r1, [r4, #0x14]
        sub     r10, r10, r6
        sub     r10, r10, r3
        ldr     r3, [sp, #0x28]
        sub     r10, r10, r8
        sub     r0, r10, r0
        rsb     r1, r1, #0
        mla     r0, r1, r3, r0
        mov     r1, r0, asr #14
        cmp     r5, r1
        movlt   r1, #0xFF
        orrlt   r1, r1, #0x7F, 24
        blt     LDFY2
        cmn     r1, #2, 18
        movge   r1, r1, lsl #16
        movge   r1, r1, asr #16
        bge     LDFY2
        mov     r1, #0xFF
        orr     r1, r1, #0x7F, 24
        mvn     r1, r1
LDFY2:
        ldr     r3, [sp, #8]
        strh    r1, [lr, #0x20]
        mla     r0, r3, r9, r0
        mov     r0, r0, asr #14
        cmp     r5, r0
        movlt   r0, #0xFF
        orrlt   r0, r0, #0x7F, 24
        blt     LDFY3
        cmn     r0, #2, 18
        movge   r0, r0, lsl #16
        movge   r0, r0, asr #16
        bge     LDFY3
        mov     r0, #0xFF
        orr     r0, r0, #0x7F, 24
        mvn     r0, r0
LDFY3:
        ldr     r1, [sp, #0x10]
        subs    r7, r7, #1
        strh    r0, [r1], #2
        str     r1, [sp, #0x10]
        bne     LDFY0
        mov     r0, #0
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LDFY4:
        mvn     r0, #7
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}


