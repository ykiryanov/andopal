        .text
        .align  4
        .globl  _ippsPowerSpectr_16s32f


_ippsPowerSpectr_16s32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x84
        mov     r7, r0
        cmp     r7, #0
        mov     r6, r1
        mov     r5, r2
        mov     r8, r3
        beq     LBAK11
        cmp     r6, #0
        beq     LBAK11
        cmp     r5, #0
        beq     LBAK11
        cmp     r8, #1
        blt     LBAK10
        cmp     r8, #8
        ble     LBAK5
        mov     r11, r8, asr #3
        cmp     r11, #0
        and     r10, r8, #7
        ble     LBAK1
        add     r4, r6, #4
        str     r4, [sp, #0x40]
        add     r4, r7, #6
        str     r4, [sp, #0x3C]
        add     r4, r6, #6
        str     r4, [sp, #0x38]
        add     r4, r5, #4
        str     r4, [sp, #0x34]
        add     r4, r5, #8
        str     r4, [sp, #0x30]
        add     r4, r5, #0xC
        str     r4, [sp, #0x2C]
        add     r4, r7, #8
        str     r4, [sp, #0x28]
        add     r4, r6, #8
        str     r4, [sp, #0x24]
        add     r4, r7, #0xA
        str     r4, [sp, #0x20]
        add     r4, r6, #0xA
        str     r4, [sp, #0x1C]
        add     r4, r7, #0xC
        str     r4, [sp, #0x18]
        add     r4, r6, #0xC
        str     r4, [sp, #0x14]
        add     r4, r7, #0xE
        str     r4, [sp, #0x10]
        add     r4, r6, #0xE
        str     r4, [sp, #0xC]
        add     r4, r5, #0x10
        str     r4, [sp]
        add     r4, r5, #0x14
        add     r9, r7, #2
        str     r4, [sp, #4]
        add     lr, r6, #2
        add     r12, r7, #4
        add     r1, r5, #0x18
        add     r2, r5, #0x1C
        mov     r3, r7
        mov     r0, r5
        mov     r4, r6
        str     r9, [sp, #0x60]
        str     r10, [sp, #0x50]
        str     r11, [sp, #0x58]
        str     r8, [sp, #8]
        str     r5, [sp, #0x4C]
        str     r6, [sp, #0x48]
        str     r7, [sp, #0x44]
        ldr     r6, [sp, #4]
        ldr     r7, [sp]
        ldr     r8, [sp, #0xC]
        ldr     r9, [sp, #0x10]
        ldr     r10, [sp, #0x18]
        ldr     r11, [sp, #0x1C]
        ldr     r5, [sp, #0x28]
        str     r0, [sp, #0x5C]
        str     r3, [sp, #0x70]
        str     r2, [sp, #0x54]
        str     r1, [sp, #0x6C]
        str     r12, [sp, #0x68]
        str     lr, [sp, #0x64]
LBAK0:
        ldrsh   r2, [r4], #0x10
        ldr     r0, [sp, #0x70]
        ldr     r1, [sp, #0x60]
        mul     r12, r2, r2
        ldr     r2, [sp, #0x68]
        ldrsh   r0, [r0]
        ldrsh   r1, [r1]
        ldrsh   r3, [r2]
        mla     r0, r0, r0, r12
        mul     r2, r1, r1
        ldr     r1, [sp, #0x64]
        mul     r3, r3, r3
        ldr     r12, [sp, #0x40]
        ldrsh   r1, [r1]
        ldrsh   r12, [r12]
        mla     r2, r1, r1, r2
        ldr     r1, [sp, #0x3C]
        mla     r3, r12, r12, r3
        str     r2, [sp, #0x74]
        ldrsh   r1, [r1]
        ldr     r2, [sp, #0x38]
        mul     r1, r1, r1
        str     r3, [sp, #0x78]
        ldrsh   r2, [r2]
        str     r1, [sp, #0x80]
        str     r2, [sp, #0x7C]
        bl      __floatunssisf
        ldr     r1, [sp, #0x5C]
        str     r0, [r1]
        ldr     r2, [sp, #0x80]
        ldr     r0, [sp, #0x74]
        ldr     r1, [sp, #0x7C]
        mla     r2, r1, r1, r2
        str     r2, [sp, #0x80]
        bl      __floatunssisf
        ldr     r1, [sp, #0x34]
        str     r0, [r1]
        ldr     r0, [sp, #0x78]
        bl      __floatunssisf
        ldr     r1, [sp, #0x30]
        str     r0, [r1]
        ldr     r0, [sp, #0x80]
        bl      __floatunssisf
        ldr     r1, [sp, #0x2C]
        str     r0, [r1]
        ldrsh   r2, [r5], #0x10
        ldr     r0, [sp, #0x24]
        ldr     r1, [sp, #0x20]
        mul     r12, r2, r2
        ldrsh   r3, [r11], #0x10
        ldrsh   r0, [r0]
        ldrsh   r1, [r1]
        ldrsh   r2, [r10], #0x10
        mla     r0, r0, r0, r12
        mul     r1, r1, r1
        mul     r2, r2, r2
        ldr     r12, [sp, #0x14]
        mla     r1, r3, r3, r1
        ldrsh   r12, [r12]
        mla     r2, r12, r12, r2
        str     r1, [sp, #0x80]
        ldrsh   r1, [r9], #0x10
        str     r2, [sp, #0x7C]
        mul     r1, r1, r1
        ldrsh   r2, [r8], #0x10
        str     r1, [sp, #0x74]
        str     r2, [sp, #0x78]
        bl      __floatunssisf
        str     r0, [r7], #0x20
        ldr     r2, [sp, #0x74]
        ldr     r1, [sp, #0x78]
        ldr     r0, [sp, #0x80]
        mla     r2, r1, r1, r2
        str     r2, [sp, #0x80]
        bl      __floatunssisf
        str     r0, [r6], #0x20
        ldr     r0, [sp, #0x7C]
        bl      __floatunssisf
        ldr     r1, [sp, #0x6C]
        str     r0, [r1]
        ldr     r0, [sp, #0x80]
        bl      __floatunssisf
        ldr     r1, [sp, #0x54]
        str     r0, [r1], #0x20
        ldr     r0, [sp, #0x58]
        str     r1, [sp, #0x54]
        subs    r0, r0, #1
        str     r0, [sp, #0x58]
        ldr     r0, [sp, #0x70]
        add     r0, r0, #0x10
        str     r0, [sp, #0x70]
        ldr     r0, [sp, #0x60]
        add     r0, r0, #0x10
        str     r0, [sp, #0x60]
        ldr     r0, [sp, #0x64]
        add     r0, r0, #0x10
        str     r0, [sp, #0x64]
        ldr     r0, [sp, #0x68]
        add     r0, r0, #0x10
        str     r0, [sp, #0x68]
        ldr     r0, [sp, #0x40]
        add     r0, r0, #0x10
        str     r0, [sp, #0x40]
        ldr     r0, [sp, #0x3C]
        add     r0, r0, #0x10
        str     r0, [sp, #0x3C]
        ldr     r0, [sp, #0x38]
        add     r0, r0, #0x10
        str     r0, [sp, #0x38]
        ldr     r0, [sp, #0x5C]
        add     r0, r0, #0x20
        str     r0, [sp, #0x5C]
        ldr     r0, [sp, #0x34]
        add     r0, r0, #0x20
        str     r0, [sp, #0x34]
        ldr     r0, [sp, #0x30]
        add     r0, r0, #0x20
        str     r0, [sp, #0x30]
        ldr     r0, [sp, #0x2C]
        add     r0, r0, #0x20
        str     r0, [sp, #0x2C]
        ldr     r0, [sp, #0x24]
        add     r0, r0, #0x10
        str     r0, [sp, #0x24]
        ldr     r0, [sp, #0x20]
        add     r0, r0, #0x10
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #0x14]
        add     r0, r0, #0x10
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #0x6C]
        add     r0, r0, #0x20
        str     r0, [sp, #0x6C]
        ldr     r0, [sp, #0x58]
        bne     LBAK0
        ldr     r10, [sp, #0x50]
        ldr     r8, [sp, #8]
        ldr     r5, [sp, #0x4C]
        ldr     r6, [sp, #0x48]
        ldr     r7, [sp, #0x44]
LBAK1:
        sub     r4, r8, r10
        cmp     r4, r8
        bge     LBAK9
        sub     r12, r8, r4
        cmp     r12, #4
        blt     LBAK3
        sub     lr, r8, #4
        add     r12, r5, r4, lsl #2
        add     r10, r7, r4, lsl #1
        add     r9, r6, r4, lsl #1
        str     r12, [sp, #0x6C]
        str     lr, [sp, #0x70]
        str     r8, [sp, #8]
LBAK2:
        ldrsh   r12, [r10], #6
        ldrsh   r3, [r9], #6
        mul     r12, r12, r12
        add     r8, r4, #1
        add     r11, r4, #2
        add     r4, r4, #3
        mla     r0, r3, r3, r12
        bl      __floatunssisf
        ldr     r3, [sp, #0x6C]
        mov     lr, r11, lsl #1
        str     r0, [r3], #0xC
        str     r3, [sp, #0x6C]
        mov     r3, r8, lsl #1
        ldrsh   r12, [r7, +r3]
        ldrsh   r3, [r6, +r3]
        str     lr, [sp, #0x80]
        mul     r12, r12, r12
        mla     r0, r3, r3, r12
        bl      __floatunssisf
        str     r0, [r5, +r8, lsl #2]
        ldr     r3, [sp, #0x80]
        ldrsh   r12, [r7, +r3]
        ldrsh   r3, [r6, +r3]
        mul     r12, r12, r12
        mla     r0, r3, r3, r12
        bl      __floatunssisf
        ldr     r3, [sp, #0x70]
        str     r0, [r5, +r11, lsl #2]
        cmp     r4, r3
        ble     LBAK2
        ldr     r8, [sp, #8]
LBAK3:
        add     r7, r7, r4, lsl #1
        add     r6, r6, r4, lsl #1
        add     r5, r5, r4, lsl #2
LBAK4:
        ldrsh   r1, [r7], #2
        ldrsh   r0, [r6], #2
        mul     r1, r1, r1
        add     r4, r4, #1
        mla     r0, r0, r0, r1
        bl      __floatunssisf
        str     r0, [r5], #4
        cmp     r4, r8
        blt     LBAK4
        mov     r0, #0
        add     sp, sp, #0x84
        ldmia   sp!, {r4 - r11, pc}
LBAK5:
        cmp     r8, #4
        mov     r10, #0
        blt     LBAK7
        sub     lr, r8, #4
        mov     r12, r5
        mov     r9, r7
        mov     r4, r6
        str     r12, [sp]
        str     lr, [sp, #4]
        str     r8, [sp, #8]
LBAK6:
        ldrsh   r12, [r9], #6
        ldrsh   r3, [r4], #6
        mul     r12, r12, r12
        add     r8, r10, #1
        add     r11, r10, #2
        add     r10, r10, #3
        mla     r0, r3, r3, r12
        bl      __floatunssisf
        ldr     r3, [sp]
        mov     lr, r11, lsl #1
        str     r0, [r3], #0xC
        str     r3, [sp]
        mov     r3, r8, lsl #1
        ldrsh   r12, [r7, +r3]
        ldrsh   r3, [r6, +r3]
        str     lr, [sp, #0x80]
        mul     r12, r12, r12
        mla     r0, r3, r3, r12
        bl      __floatunssisf
        str     r0, [r5, +r8, lsl #2]
        ldr     r3, [sp, #0x80]
        ldrsh   r12, [r7, +r3]
        ldrsh   r3, [r6, +r3]
        mul     r12, r12, r12
        mla     r0, r3, r3, r12
        bl      __floatunssisf
        ldr     r3, [sp, #4]
        str     r0, [r5, +r11, lsl #2]
        cmp     r10, r3
        ble     LBAK6
        ldr     r8, [sp, #8]
LBAK7:
        add     r7, r7, r10, lsl #1
        add     r6, r6, r10, lsl #1
        add     r5, r5, r10, lsl #2
LBAK8:
        ldrsh   r1, [r7], #2
        ldrsh   r0, [r6], #2
        mul     r1, r1, r1
        add     r10, r10, #1
        mla     r0, r0, r0, r1
        bl      __floatunssisf
        str     r0, [r5], #4
        cmp     r10, r8
        blt     LBAK8
LBAK9:
        mov     r0, #0
        add     sp, sp, #0x84
        ldmia   sp!, {r4 - r11, pc}
LBAK10:
        mvn     r0, #5
        add     sp, sp, #0x84
        ldmia   sp!, {r4 - r11, pc}
LBAK11:
        mvn     r0, #7
        add     sp, sp, #0x84
        ldmia   sp!, {r4 - r11, pc}


