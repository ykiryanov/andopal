        .text
        .align  4
        .globl  _ippsPowerSpectr_16sc32f


_ippsPowerSpectr_16sc32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x54
        mov     r10, r0
        cmp     r10, #0
        mov     r9, r1
        mov     r8, r2
        beq     LBAI11
        cmp     r9, #0
        beq     LBAI11
        cmp     r8, #1
        blt     LBAI10
        cmp     r8, #8
        ble     LBAI5
        mov     r1, r8, asr #3
        cmp     r1, #0
        and     r0, r8, #7
        ble     LBAI1
        add     r4, r9, #0x18
        str     r4, [sp, #0x14]
        add     r4, r9, #0x1C
        str     r4, [sp, #0x10]
        sub     r4, r10, #2
        str     r4, [sp, #0xC]
        sub     r4, r10, #6
        str     r4, [sp, #8]
        sub     r4, r10, #0xA
        str     r4, [sp, #4]
        sub     r4, r10, #0xE
        add     r3, r9, #0x10
        add     r11, r9, #4
        str     r4, [sp]
        str     r3, [sp, #0x18]
        add     lr, r9, #8
        add     r12, r9, #0xC
        add     r3, r9, #0x14
        mov     r2, r9
        sub     r7, r10, #0x12
        sub     r6, r10, #0x16
        sub     r5, r10, #0x1A
        sub     r4, r10, #0x1E
        str     r11, [sp, #0x34]
        str     r8, [sp, #0x24]
        str     r9, [sp, #0x20]
        str     r10, [sp, #0x1C]
        ldr     r9, [sp]
        ldr     r10, [sp, #4]
        ldr     r11, [sp, #8]
        ldr     r8, [sp, #0xC]
        str     r2, [sp, #0x30]
        str     r3, [sp, #0x38]
        str     r12, [sp, #0x40]
        str     lr, [sp, #0x3C]
        str     r0, [sp, #0x28]
        str     r1, [sp, #0x2C]
LBAI0:
        ldrsh   r0, [r4, #0x20]
        ldrsh   r1, [r5, #0x1E]
        ldrsh   r12, [r4, #0x1E]
        mul     r0, r0, r0
        ldrsh   r2, [r6, #0x1E]
        mul     r1, r1, r1
        ldrsh   r3, [r5, #0x20]!
        mul     r2, r2, r2
        mla     r0, r12, r12, r0
        ldrsh   r12, [r6, #0x20]!
        mla     r1, r3, r3, r1
        mla     r2, r12, r12, r2
        str     r1, [sp, #0x44]
        ldrsh   r1, [r7, #0x1E]
        str     r2, [sp, #0x48]
        ldrsh   r2, [r7, #0x20]!
        mul     r1, r1, r1
        add     r4, r4, #0x20
        str     r2, [sp, #0x4C]
        str     r1, [sp, #0x50]
        bl      __floatunssisf
        ldr     r1, [sp, #0x30]
        str     r0, [r1]
        ldr     r2, [sp, #0x50]
        ldr     r0, [sp, #0x44]
        ldr     r1, [sp, #0x4C]
        mla     r2, r1, r1, r2
        str     r2, [sp, #0x50]
        bl      __floatunssisf
        ldr     r1, [sp, #0x34]
        str     r0, [r1]
        ldr     r0, [sp, #0x48]
        bl      __floatunssisf
        ldr     r1, [sp, #0x3C]
        str     r0, [r1]
        ldr     r0, [sp, #0x50]
        bl      __floatunssisf
        ldr     r1, [sp, #0x40]
        str     r0, [r1]
        ldrsh   r0, [r9, #0x1E]
        ldrsh   r1, [r10, #0x1E]
        ldrsh   r3, [r10, #0x20]!
        mul     r0, r0, r0
        ldrsh   r12, [r9, #0x20]!
        mul     r1, r1, r1
        ldrsh   r2, [r11, #0x1E]
        mla     r0, r12, r12, r0
        ldrsh   r12, [r11, #0x20]!
        mla     r1, r3, r3, r1
        mul     r2, r2, r2
        str     r1, [sp, #0x50]
        mla     r2, r12, r12, r2
        ldrsh   r1, [r8, #0x1E]
        mul     r1, r1, r1
        str     r2, [sp, #0x4C]
        ldrsh   r2, [r8, #0x20]!
        str     r2, [sp, #0x48]
        str     r1, [sp, #0x44]
        bl      __floatunssisf
        ldr     r1, [sp, #0x18]
        str     r0, [r1]
        ldr     r1, [sp, #0x48]
        ldr     r0, [sp, #0x50]
        ldr     r2, [sp, #0x44]
        mla     r2, r1, r1, r2
        str     r2, [sp, #0x50]
        bl      __floatunssisf
        ldr     r1, [sp, #0x38]
        str     r0, [r1]
        ldr     r0, [sp, #0x4C]
        bl      __floatunssisf
        ldr     r1, [sp, #0x14]
        str     r0, [r1]
        ldr     r0, [sp, #0x50]
        bl      __floatunssisf
        ldr     r1, [sp, #0x10]
        str     r0, [r1], #0x20
        ldr     r0, [sp, #0x2C]
        str     r1, [sp, #0x10]
        subs    r0, r0, #1
        str     r0, [sp, #0x2C]
        ldr     r0, [sp, #0x30]
        add     r0, r0, #0x20
        str     r0, [sp, #0x30]
        ldr     r0, [sp, #0x34]
        add     r0, r0, #0x20
        str     r0, [sp, #0x34]
        ldr     r0, [sp, #0x3C]
        add     r0, r0, #0x20
        str     r0, [sp, #0x3C]
        ldr     r0, [sp, #0x40]
        add     r0, r0, #0x20
        str     r0, [sp, #0x40]
        ldr     r0, [sp, #0x18]
        add     r0, r0, #0x20
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x38]
        add     r0, r0, #0x20
        str     r0, [sp, #0x38]
        ldr     r0, [sp, #0x14]
        add     r0, r0, #0x20
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #0x2C]
        bne     LBAI0
        ldr     r0, [sp, #0x28]
        ldr     r8, [sp, #0x24]
        ldr     r9, [sp, #0x20]
        ldr     r10, [sp, #0x1C]
LBAI1:
        sub     r4, r8, r0
        cmp     r4, r8
        bge     LBAI9
        sub     r3, r8, r4
        cmp     r3, #4
        blt     LBAI3
        mov     r3, r4, lsl #2
        sub     r12, r3, #2
        add     r3, r3, #4
        add     r6, r12, r10
        add     r5, r3, r9
        sub     r7, r8, #4
LBAI2:
        ldrsh   r12, [r6, #2]
        ldrsh   r3, [r6, #4]
        add     r4, r4, #3
        mul     r12, r12, r12
        mla     r0, r3, r3, r12
        bl      __floatunssisf
        str     r0, [r5, #-4]
        ldrsh   r12, [r6, #6]
        ldrsh   r3, [r6, #8]
        mul     r12, r12, r12
        mla     r0, r3, r3, r12
        bl      __floatunssisf
        str     r0, [r5]
        ldrsh   r12, [r6, #0xA]
        ldrsh   r3, [r6, #0xC]!
        mul     r12, r12, r12
        mla     r0, r3, r3, r12
        bl      __floatunssisf
        str     r0, [r5, #4]
        cmp     r4, r7
        add     r5, r5, #0xC
        ble     LBAI2
LBAI3:
        mov     r3, r4, lsl #2
        sub     r3, r3, #2
        add     r10, r3, r10
        add     r9, r9, r4, lsl #2
LBAI4:
        ldrsh   r1, [r10, #2]
        ldrsh   r0, [r10, #4]!
        mul     r1, r1, r1
        add     r4, r4, #1
        mla     r0, r0, r0, r1
        bl      __floatunssisf
        str     r0, [r9], #4
        cmp     r4, r8
        blt     LBAI4
        mov     r0, #0
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}
LBAI5:
        cmp     r8, #4
        mov     r4, #0
        blt     LBAI7
        sub     r7, r8, #4
        sub     r6, r10, #2
        add     r5, r9, #4
LBAI6:
        ldrsh   r12, [r6, #2]
        ldrsh   r3, [r6, #4]
        add     r4, r4, #3
        mul     r12, r12, r12
        mla     r0, r3, r3, r12
        bl      __floatunssisf
        str     r0, [r5, #-4]
        ldrsh   r12, [r6, #6]
        ldrsh   r3, [r6, #8]
        mul     r12, r12, r12
        mla     r0, r3, r3, r12
        bl      __floatunssisf
        str     r0, [r5]
        ldrsh   r12, [r6, #0xA]
        ldrsh   r3, [r6, #0xC]!
        mul     r12, r12, r12
        mla     r0, r3, r3, r12
        bl      __floatunssisf
        str     r0, [r5, #4]
        cmp     r4, r7
        add     r5, r5, #0xC
        ble     LBAI6
LBAI7:
        mov     r3, r4, lsl #2
        sub     r3, r3, #2
        add     r10, r3, r10
        add     r9, r9, r4, lsl #2
LBAI8:
        ldrsh   r1, [r10, #2]
        ldrsh   r0, [r10, #4]!
        mul     r1, r1, r1
        add     r4, r4, #1
        mla     r0, r0, r0, r1
        bl      __floatunssisf
        str     r0, [r9], #4
        cmp     r4, r8
        blt     LBAI8
LBAI9:
        mov     r0, #0
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}
LBAI10:
        mvn     r0, #5
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}
LBAI11:
        mvn     r0, #7
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}


