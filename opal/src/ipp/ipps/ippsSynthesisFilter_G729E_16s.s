        .text
        .align  4
        .globl  _ippsSynthesisFilter_G729E_16s


_ippsSynthesisFilter_G729E_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x50
        ldr     r4, [sp, #0x74]
        ldr     r12, [sp, #0x78]
        mov     r5, r1
        mov     r1, r2
        cmp     r0, #0
        mov     r2, r3
        beq     LDTW24
        cmp     r1, #0
        beq     LDTW24
        cmp     r2, #0
        beq     LDTW24
        cmp     r4, #0
        ble     LDTW23
        cmp     r5, #0
        ble     LDTW23
        cmp     r5, #0xA
        beq     LDTW22
        adds    r8, r12, r5, lsl #1
        add     r7, r5, #1
        mov     r12, #0
        mov     lr, r7
        beq     LDTW15
        mvn     r5, #0
        mov     r9, r12
        mov     r10, r5, lsl #15
        add     r6, r5, #2, 18
        mov     r5, r2
        str     r9, [sp, #0x4C]
        str     r10, [sp, #0x44]
        str     r7, [sp, #0x14]
        str     r8, [sp, #0x48]
LDTW0:
        ldrsh   r9, [r1], #2
        ldrsh   r7, [r0]
        ldr     r8, [sp, #0x14]
        sub     r8, r8, lr
        mul     r7, r7, r9
        cmp     r8, #1
        blt     LDTW14
        sub     r9, r8, #1
        cmp     r9, #6
        blt     LDTW13
        sub     r3, r8, #6
        str     r3, [sp, #0x3C]
        add     r3, r0, #2
        str     r3, [sp, #0x40]
        str     r7, [sp, #0x34]
        str     r4, [sp, #0x10]
        ldr     r4, [sp, #0x40]
        ldr     r7, [sp, #0x3C]
        mov     r11, #0
        mov     r9, #1
        add     r10, r2, r12, lsl #1
        str     r5, [sp, #0x2C]
        str     r12, [sp, #0x1C]
        str     r8, [sp, #0x30]
        str     r6, [sp, #0x38]
        str     lr, [sp, #0x18]
        str     r2, [sp, #0xC]
        str     r0, [sp, #8]
LDTW1:
        rsb     r0, r9, #0
        ldrsh   r2, [r4]
        ldrsh   lr, [r4, #2]
        ldrsh   r12, [r4, #4]
        ldrsh   r6, [r4, #6]
        ldrsh   r5, [r4, #8]
        mov     r0, r0, lsl #1
        ldrsh   r8, [r10, +r0]
        mvn     r0, #0
        rsb     r0, r9, r0
        mvn     r3, #1
        mla     r11, r2, r8, r11
        mov     r0, r0, lsl #1
        ldrsh   r8, [r10, +r0]
        rsb     r3, r9, r3
        mvn     r0, #2
        mla     r11, lr, r8, r11
        mov     r3, r3, lsl #1
        ldrsh   lr, [r10, +r3]
        rsb     r3, r9, r0
        mvn     r0, #3
        mla     r11, r12, lr, r11
        mov     r3, r3, lsl #1
        ldrsh   r3, [r10, +r3]
        rsb     r0, r9, r0
        add     r4, r4, #0xA
        mla     r11, r6, r3, r11
        mov     r0, r0, lsl #1
        ldrsh   r0, [r10, +r0]
        add     r9, r9, #5
        cmp     r9, r7
        mla     r11, r5, r0, r11
        ble     LDTW1
        ldr     r5, [sp, #0x2C]
        ldr     r12, [sp, #0x1C]
        ldr     r8, [sp, #0x30]
        ldr     r7, [sp, #0x34]
        ldr     r6, [sp, #0x38]
        ldr     lr, [sp, #0x18]
        ldr     r4, [sp, #0x10]
        ldr     r2, [sp, #0xC]
        ldr     r0, [sp, #8]
LDTW2:
        add     r3, r0, r9, lsl #1
        str     r3, [sp, #0x40]
        str     r2, [sp, #0xC]
        ldr     r2, [sp, #0x40]
        str     r0, [sp, #8]
LDTW3:
        rsb     r3, r9, #0
        ldrsh   r0, [r2], #2
        mov     r3, r3, lsl #1
        ldrsh   r3, [r10, +r3]
        add     r9, r9, #1
        cmp     r9, r8
        mla     r11, r0, r3, r11
        ble     LDTW3
        ldr     r2, [sp, #0xC]
        ldr     r0, [sp, #8]
LDTW4:
        cmp     lr, #1
        ble     LDTW8
        sub     r8, lr, #1
        cmp     r8, #6
        movlt   r8, #1
        blt     LDTW6
        sub     r3, lr, #6
        str     r3, [sp, #0x3C]
        add     r3, r0, r9, lsl #1
        str     r3, [sp, #0x24]
        mov     r3, #2
        str     r3, [sp, #0x30]
        ldr     r3, [sp, #0x48]
        mov     r8, #1
        str     r1, [sp, #0x20]
        sub     r3, r3, #4
        str     r3, [sp, #0x40]
        str     r12, [sp, #0x1C]
        str     r2, [sp, #0xC]
        ldr     r12, [sp, #0x40]
        ldr     r3, [sp, #0x30]
        ldr     r2, [sp, #0x24]
        ldr     r1, [sp, #0x48]
        str     r10, [sp, #0x28]
        str     r5, [sp, #0x2C]
        str     r7, [sp, #0x34]
        str     r6, [sp, #0x38]
        str     lr, [sp, #0x18]
        str     r4, [sp, #0x10]
        str     r0, [sp, #8]
LDTW5:
        sub     r0, r1, r3
        ldrsh   r6, [r0]
        ldrsh   r5, [r2]
        ldrsh   r4, [r12]
        ldrsh   lr, [r2, #2]
        ldrsh   r0, [r12, #-2]
        mla     r11, r5, r6, r11
        ldrsh   r5, [r2, #4]
        ldrsh   r6, [r12, #-4]
        ldrsh   r7, [r2, #6]
        ldrsh   r10, [r12, #-6]
        mla     r11, lr, r4, r11
        ldrsh   lr, [r2, #8]
        add     r2, r2, #0xA
        add     r9, r9, #5
        add     r3, r3, #0xA
        mla     r11, r5, r0, r11
        ldr     r0, [sp, #0x3C]
        sub     r12, r12, #0xA
        add     r8, r8, #5
        cmp     r8, r0
        mla     r11, r7, r6, r11
        mla     r11, lr, r10, r11
        ble     LDTW5
        ldr     r1, [sp, #0x20]
        ldr     r10, [sp, #0x28]
        ldr     r5, [sp, #0x2C]
        ldr     r12, [sp, #0x1C]
        ldr     r7, [sp, #0x34]
        ldr     r6, [sp, #0x38]
        ldr     lr, [sp, #0x18]
        ldr     r4, [sp, #0x10]
        ldr     r2, [sp, #0xC]
        ldr     r0, [sp, #8]
LDTW6:
        mov     r3, r8, lsl #1
        str     r3, [sp, #0x40]
        add     r9, r0, r9, lsl #1
        str     r0, [sp, #8]
        ldr     r0, [sp, #0x40]
        ldr     r3, [sp, #0x48]
        str     r4, [sp, #0x10]
        str     r2, [sp, #0xC]
LDTW7:
        sub     r2, r3, r0
        ldrsh   r4, [r9], #2
        ldrsh   r2, [r2]
        add     r8, r8, #1
        cmp     r8, lr
        mla     r11, r4, r2, r11
        add     r0, r0, #2
        blt     LDTW7
        ldr     r4, [sp, #0x10]
        ldr     r2, [sp, #0xC]
        ldr     r0, [sp, #8]
LDTW8:
        sub     r7, r7, r11
        add     r7, r7, #2, 22
        mov     r7, r7, asr #12
        cmp     r6, r7
        bge     LDTW9
        strh    r6, [r5]
        mov     r7, #1
        str     r7, [sp, #0x4C]
        b       LDTW10
LDTW9:
        cmn     r7, #2, 18
        strgeh  r7, [r10]
        bge     LDTW10
        ldr     r7, [sp, #0x44]
        strh    r7, [r5]
        mov     r7, #1
        str     r7, [sp, #0x4C]
LDTW10:
        cmp     lr, #1
        subgt   lr, lr, #1
        add     r12, r12, #1
        cmp     r12, r4
        add     r5, r5, #2
        blt     LDTW0
        ldr     r9, [sp, #0x4C]
LDTW11:
        cmp     r9, #0
        beq     LDTW12
        mov     r0, #0xC
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LDTW12:
        mov     r0, #0
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LDTW13:
        mov     r11, #0
        mov     r9, #1
        add     r10, r2, r12, lsl #1
        b       LDTW2
LDTW14:
        mov     r11, #0
        mov     r9, #1
        add     r10, r2, r12, lsl #1
        b       LDTW4
LDTW15:
        mov     r10, r12
        mov     r6, r2
LDTW16:
        ldrsh   r8, [r1], #2
        ldrsh   r5, [r0]
        sub     r11, r7, lr
        cmp     r11, #1
        mul     r9, r5, r8
        movlt   r5, r12
        blt     LDTW20
        sub     r5, r11, #1
        cmp     r5, #6
        blt     LDTW21
        mov     r5, r12
        add     r3, r2, r10, lsl #1
        str     r3, [sp, #0x38]
        sub     r3, r11, #6
        str     r3, [sp, #0x30]
        add     r3, r0, #2
        str     r3, [sp, #0x34]
        str     r9, [sp, #0x24]
        str     r12, [sp, #0x1C]
        str     lr, [sp, #0x18]
        ldr     lr, [sp, #0x38]
        ldr     r12, [sp, #0x34]
        ldr     r9, [sp, #0x30]
        mov     r8, #1
        str     r10, [sp, #0x2C]
        str     r11, [sp, #0x28]
        str     r1, [sp, #0x20]
        str     r7, [sp, #0x14]
        str     r4, [sp, #0x10]
        str     r2, [sp, #0xC]
        str     r0, [sp, #8]
LDTW17:
        rsb     r0, r8, #0
        ldrsh   r11, [r12]
        ldrsh   r3, [r12, #2]
        ldrsh   r2, [r12, #4]
        ldrsh   r7, [r12, #6]
        ldrsh   r4, [r12, #8]
        mov     r0, r0, lsl #1
        ldrsh   r10, [lr, +r0]
        mvn     r0, #0
        rsb     r0, r8, r0
        mvn     r1, #1
        mla     r5, r11, r10, r5
        mov     r0, r0, lsl #1
        ldrsh   r10, [lr, +r0]
        rsb     r1, r8, r1
        mvn     r0, #2
        mla     r5, r3, r10, r5
        mov     r1, r1, lsl #1
        ldrsh   r3, [lr, +r1]
        rsb     r1, r8, r0
        mvn     r0, #3
        mla     r5, r2, r3, r5
        mov     r1, r1, lsl #1
        ldrsh   r1, [lr, +r1]
        rsb     r0, r8, r0
        add     r12, r12, #0xA
        mla     r5, r7, r1, r5
        mov     r0, r0, lsl #1
        ldrsh   r0, [lr, +r0]
        add     r8, r8, #5
        cmp     r8, r9
        mla     r5, r4, r0, r5
        ble     LDTW17
        ldr     r10, [sp, #0x2C]
        ldr     r11, [sp, #0x28]
        ldr     r9, [sp, #0x24]
        ldr     r1, [sp, #0x20]
        ldr     r12, [sp, #0x1C]
        ldr     lr, [sp, #0x18]
        ldr     r7, [sp, #0x14]
        ldr     r4, [sp, #0x10]
        ldr     r2, [sp, #0xC]
        ldr     r0, [sp, #8]
LDTW18:
        add     r3, r0, r8, lsl #1
        str     r3, [sp, #0x34]
        str     r4, [sp, #0x10]
        str     r0, [sp, #8]
        ldr     r0, [sp, #0x38]
        ldr     r4, [sp, #0x34]
        str     r2, [sp, #0xC]
LDTW19:
        rsb     r2, r8, #0
        ldrsh   r3, [r4], #2
        mov     r2, r2, lsl #1
        ldrsh   r2, [r0, +r2]
        add     r8, r8, #1
        cmp     r8, r11
        mla     r5, r3, r2, r5
        ble     LDTW19
        ldr     r4, [sp, #0x10]
        ldr     r2, [sp, #0xC]
        ldr     r0, [sp, #8]
LDTW20:
        sub     r9, r9, r5
        add     r5, r9, #2, 22
        cmp     lr, #1
        mov     r5, r5, asr #12
        strh    r5, [r6], #2
        subgt   lr, lr, #1
        add     r10, r10, #1
        cmp     r10, r4
        blt     LDTW16
        mov     r9, #0
        b       LDTW11
LDTW21:
        mov     r5, r12
        add     r3, r2, r10, lsl #1
        mov     r8, #1
        str     r3, [sp, #0x38]
        b       LDTW18
LDTW22:
        str     r12, [sp, #4]
        mov     r12, #0xC
        str     r12, [sp]
        mov     r3, r4
        bl      _ippsSynthesisFilter_NR_16s_Sfs
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LDTW23:
        mvn     r0, #5
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LDTW24:
        mvn     r0, #7
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}


