        .text
        .align  4
        .globl  _ippsSynthesisFilter_NR_16s_ISfs


_ippsSynthesisFilter_NR_16s_ISfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x40
        ldr     r6, [sp, #0x64]
        cmp     r0, #0
        beq     LDTU26
        cmp     r1, #0
        beq     LDTU26
        cmp     r2, #0
        ble     LDTU27
        cmp     r3, #0xC
        blt     LDTU12
        cmp     r3, #0xD
        bgt     LDTU12
        cmp     r6, #0
        mov     r5, #0
        mov     r4, #0xB
        sub     lr, r3, #1
        mov     r12, #1
        beq     LDTU19
        adds    r7, r6, #0x14
        beq     LDTU13
        cmp     r2, #0
        ble     LDTU10
        mvn     r9, #0
        add     r8, r9, #2, 18
        mov     r9, r9, lsl #15
        str     r9, [sp, #0x38]
        str     r7, [sp, #0x24]
        str     r6, [sp, #0x3C]
LDTU0:
        ldrsh   r6, [r0]
        ldrsh   r7, [r1]
        rsb     r10, r4, #0xB
        cmp     r10, #1
        mul     r6, r6, r7
        movlt   r9, #0
        movlt   r7, #1
        blt     LDTU4
        rsb     r7, r4, #0xA
        cmp     r7, #6
        movlt   r9, #0
        movlt   r7, #1
        blt     LDTU2
        rsb     r11, r4, #5
        str     r11, [sp, #0x2C]
        add     r11, r0, #2
        str     r11, [sp, #0x30]
        str     r6, [sp, #0x1C]
        str     lr, [sp, #0x14]
        ldr     lr, [sp, #0x30]
        ldr     r6, [sp, #0x2C]
        mov     r9, #0
        mov     r7, #1
        str     r8, [sp, #0x18]
        str     r4, [sp, #0x10]
        str     r5, [sp, #0xC]
        str     r3, [sp, #8]
        str     r2, [sp, #4]
        str     r0, [sp]
LDTU1:
        rsb     r0, r7, #0
        ldrsh   r11, [lr]
        ldrsh   r12, [lr, #2]
        ldrsh   r3, [lr, #4]
        ldrsh   r5, [lr, #6]
        ldrsh   r4, [lr, #8]
        mov     r0, r0, lsl #1
        ldrsh   r8, [r1, +r0]
        mvn     r0, #0
        rsb     r0, r7, r0
        mvn     r2, #1
        mla     r9, r11, r8, r9
        mov     r0, r0, lsl #1
        ldrsh   r8, [r1, +r0]
        rsb     r2, r7, r2
        mvn     r0, #2
        mla     r9, r12, r8, r9
        mov     r2, r2, lsl #1
        ldrsh   r12, [r1, +r2]
        rsb     r2, r7, r0
        mvn     r0, #3
        mla     r9, r3, r12, r9
        mov     r2, r2, lsl #1
        ldrsh   r2, [r1, +r2]
        rsb     r0, r7, r0
        add     lr, lr, #0xA
        mla     r9, r5, r2, r9
        mov     r0, r0, lsl #1
        ldrsh   r0, [r1, +r0]
        add     r7, r7, #5
        cmp     r7, r6
        mla     r9, r4, r0, r9
        ble     LDTU1
        ldr     r6, [sp, #0x1C]
        ldr     r8, [sp, #0x18]
        ldr     lr, [sp, #0x14]
        ldr     r4, [sp, #0x10]
        ldr     r5, [sp, #0xC]
        ldr     r3, [sp, #8]
        ldr     r2, [sp, #4]
        ldr     r0, [sp]
        mov     r12, #1
LDTU2:
        add     r11, r0, r7, lsl #1
        str     r11, [sp, #0x34]
        str     r2, [sp, #4]
        ldr     r2, [sp, #0x34]
        str     r0, [sp]
LDTU3:
        rsb     r11, r7, #0
        ldrsh   r0, [r2], #2
        mov     r11, r11, lsl #1
        ldrsh   r11, [r1, +r11]
        add     r7, r7, #1
        cmp     r7, r10
        mla     r9, r0, r11, r9
        ble     LDTU3
        ldr     r2, [sp, #4]
        ldr     r0, [sp]
LDTU4:
        cmp     r4, #1
        ble     LDTU8
        sub     r10, r4, #1
        cmp     r10, #6
        movlt   r10, #1
        blt     LDTU6
        sub     r11, r4, #6
        str     r11, [sp, #0x30]
        add     r11, r0, r7, lsl #1
        str     r11, [sp, #0x2C]
        mov     r11, #2
        str     r11, [sp, #0x28]
        ldr     r11, [sp, #0x3C]
        ldr     r12, [sp, #0x2C]
        mov     r10, #1
        add     r11, r11, #0x10
        str     r11, [sp, #0x34]
        str     r1, [sp, #0x20]
        str     r3, [sp, #8]
        str     r2, [sp, #4]
        ldr     r3, [sp, #0x34]
        ldr     r2, [sp, #0x28]
        ldr     r1, [sp, #0x24]
        str     r6, [sp, #0x1C]
        str     r8, [sp, #0x18]
        str     lr, [sp, #0x14]
        str     r4, [sp, #0x10]
        str     r5, [sp, #0xC]
        str     r0, [sp]
LDTU5:
        sub     r0, r1, r2
        ldrsh   r6, [r0]
        ldrsh   r5, [r12]
        ldrsh   r4, [r3]
        ldrsh   lr, [r12, #2]
        ldrsh   r0, [r3, #-2]
        mla     r11, r5, r6, r9
        ldrsh   r5, [r12, #4]
        ldrsh   r6, [r3, #-4]
        ldrsh   r8, [r12, #6]
        ldrsh   r9, [r3, #-6]
        mla     r11, lr, r4, r11
        ldrsh   lr, [r12, #8]
        add     r2, r2, #0xA
        sub     r3, r3, #0xA
        add     r10, r10, #5
        mla     r11, r5, r0, r11
        ldr     r0, [sp, #0x30]
        add     r12, r12, #0xA
        add     r7, r7, #5
        cmp     r10, r0
        mla     r11, r8, r6, r11
        mla     r9, lr, r9, r11
        ble     LDTU5
        ldr     r1, [sp, #0x20]
        ldr     r6, [sp, #0x1C]
        ldr     r8, [sp, #0x18]
        ldr     lr, [sp, #0x14]
        ldr     r4, [sp, #0x10]
        ldr     r5, [sp, #0xC]
        ldr     r3, [sp, #8]
        ldr     r2, [sp, #4]
        ldr     r0, [sp]
        mov     r12, #1
LDTU6:
        mov     r11, r10, lsl #1
        str     r11, [sp, #0x34]
        add     r7, r0, r7, lsl #1
        str     r2, [sp, #4]
        str     r0, [sp]
        ldr     r0, [sp, #0x34]
        ldr     r2, [sp, #0x24]
        str     r3, [sp, #8]
LDTU7:
        sub     r11, r2, r0
        ldrsh   r3, [r7], #2
        ldrsh   r11, [r11]
        add     r10, r10, #1
        cmp     r10, r4
        mla     r9, r3, r11, r9
        add     r0, r0, #2
        blt     LDTU7
        ldr     r3, [sp, #8]
        ldr     r2, [sp, #4]
        ldr     r0, [sp]
LDTU8:
        sub     r6, r6, r9
        add     r6, r6, r12, lsl lr
        mov     r6, r6, asr r3
        cmp     r8, r6
        strlth  r8, [r1]
        movlt   r5, #1
        blt     LDTU9
        cmn     r6, #2, 18
        strgeh  r6, [r1]
        bge     LDTU9
        ldr     r5, [sp, #0x38]
        strh    r5, [r1]
        mov     r5, #1
LDTU9:
        cmp     r4, #1
        subgt   r4, r4, #1
        subs    r2, r2, #1
        add     r1, r1, #2
        bne     LDTU0
LDTU10:
        cmp     r5, #0
        beq     LDTU11
        mov     r0, #0xC
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LDTU11:
        mov     r0, #0
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LDTU12:
        mvn     r0, #0xC
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LDTU13:
        cmp     r2, #0
        ble     LDTU10
LDTU14:
        ldrsh   r7, [r1]
        ldrsh   r6, [r0]
        rsb     r10, r4, #0xB
        cmp     r10, #1
        mul     r11, r6, r7
        movlt   r6, r5
        blt     LDTU18
        rsb     r6, r4, #0xA
        cmp     r6, #6
        movlt   r6, r5
        movlt   r7, #1
        blt     LDTU16
        mov     r6, r5
        mov     r7, #1
        rsb     r9, r4, #5
        add     r8, r0, #2
        str     r11, [sp, #0x3C]
        str     lr, [sp, #0x14]
        str     r4, [sp, #0x10]
        str     r5, [sp, #0xC]
        str     r3, [sp, #8]
        str     r2, [sp, #4]
        str     r0, [sp]
LDTU15:
        rsb     r0, r7, #0
        ldrsh   r11, [r8]
        ldrsh   r12, [r8, #2]
        ldrsh   r3, [r8, #4]
        ldrsh   r4, [r8, #6]
        ldrsh   lr, [r8, #8]
        mov     r0, r0, lsl #1
        ldrsh   r5, [r1, +r0]
        mvn     r0, #0
        rsb     r0, r7, r0
        mvn     r2, #1
        mla     r6, r11, r5, r6
        mov     r0, r0, lsl #1
        ldrsh   r5, [r1, +r0]
        rsb     r2, r7, r2
        mvn     r0, #2
        mla     r6, r12, r5, r6
        mov     r2, r2, lsl #1
        ldrsh   r2, [r1, +r2]
        rsb     r12, r7, r0
        mvn     r0, #3
        mla     r6, r3, r2, r6
        mov     r12, r12, lsl #1
        ldrsh   r2, [r1, +r12]
        rsb     r0, r7, r0
        add     r8, r8, #0xA
        mla     r6, r4, r2, r6
        mov     r0, r0, lsl #1
        ldrsh   r0, [r1, +r0]
        add     r7, r7, #5
        cmp     r7, r9
        mla     r6, lr, r0, r6
        ble     LDTU15
        ldr     r11, [sp, #0x3C]
        ldr     lr, [sp, #0x14]
        ldr     r4, [sp, #0x10]
        ldr     r5, [sp, #0xC]
        ldr     r3, [sp, #8]
        ldr     r2, [sp, #4]
        ldr     r0, [sp]
        mov     r12, #1
LDTU16:
        add     r8, r0, r7, lsl #1
        str     r0, [sp]
LDTU17:
        rsb     r9, r7, #0
        ldrsh   r0, [r8], #2
        mov     r9, r9, lsl #1
        ldrsh   r9, [r1, +r9]
        add     r7, r7, #1
        cmp     r7, r10
        mla     r6, r0, r9, r6
        ble     LDTU17
        ldr     r0, [sp]
LDTU18:
        sub     r11, r11, r6
        add     r6, r11, r12, lsl lr
        mov     r6, r6, asr r3
        cmp     r4, #1
        strh    r6, [r1]
        subgt   r4, r4, #1
        subs    r2, r2, #1
        add     r1, r1, #2
        bne     LDTU14
        mov     r5, #0
        b       LDTU10
LDTU19:
        cmp     r2, #0
        ble     LDTU25
LDTU20:
        ldrsh   r7, [r1]
        ldrsh   r6, [r0]
        rsb     r10, r4, #0xB
        cmp     r10, #1
        mul     r11, r6, r7
        movlt   r6, r5
        blt     LDTU24
        rsb     r6, r4, #0
        sub     r6, r6, #1
        add     r6, r6, #0xB
        cmp     r6, #6
        movlt   r6, r5
        movlt   r7, #1
        blt     LDTU22
        mov     r6, r5
        mov     r7, #1
        rsb     r9, r4, #5
        add     r8, r0, #2
        str     r11, [sp, #0x3C]
        str     lr, [sp, #0x14]
        str     r4, [sp, #0x10]
        str     r5, [sp, #0xC]
        str     r3, [sp, #8]
        str     r2, [sp, #4]
        str     r0, [sp]
LDTU21:
        rsb     r0, r7, #0
        ldrsh   r11, [r8]
        ldrsh   r12, [r8, #2]
        ldrsh   r3, [r8, #4]
        ldrsh   r4, [r8, #6]
        ldrsh   lr, [r8, #8]
        mov     r0, r0, lsl #1
        ldrsh   r5, [r1, +r0]
        mvn     r0, #0
        rsb     r0, r7, r0
        mvn     r2, #1
        mla     r6, r11, r5, r6
        mov     r0, r0, lsl #1
        ldrsh   r5, [r1, +r0]
        rsb     r2, r7, r2
        mvn     r0, #2
        mla     r6, r12, r5, r6
        mov     r2, r2, lsl #1
        ldrsh   r12, [r1, +r2]
        rsb     r2, r7, r0
        mvn     r0, #3
        mla     r6, r3, r12, r6
        mov     r2, r2, lsl #1
        ldrsh   r2, [r1, +r2]
        rsb     r0, r7, r0
        add     r8, r8, #0xA
        mla     r6, r4, r2, r6
        mov     r0, r0, lsl #1
        ldrsh   r0, [r1, +r0]
        add     r7, r7, #5
        cmp     r7, r9
        mla     r6, lr, r0, r6
        ble     LDTU21
        ldr     r11, [sp, #0x3C]
        ldr     lr, [sp, #0x14]
        ldr     r4, [sp, #0x10]
        ldr     r5, [sp, #0xC]
        ldr     r3, [sp, #8]
        ldr     r2, [sp, #4]
        ldr     r0, [sp]
        mov     r12, #1
LDTU22:
        add     r8, r0, r7, lsl #1
        str     r0, [sp]
LDTU23:
        rsb     r9, r7, #0
        ldrsh   r0, [r8], #2
        mov     r9, r9, lsl #1
        ldrsh   r9, [r1, +r9]
        add     r7, r7, #1
        cmp     r7, r10
        mla     r6, r0, r9, r6
        ble     LDTU23
        ldr     r0, [sp]
LDTU24:
        sub     r11, r11, r6
        add     r6, r11, r12, lsl lr
        mov     r6, r6, asr r3
        cmp     r4, #1
        strh    r6, [r1]
        subgt   r4, r4, #1
        subs    r2, r2, #1
        add     r1, r1, #2
        bne     LDTU20
LDTU25:
        mov     r5, #0
        b       LDTU10
LDTU26:
        mvn     r0, #7
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LDTU27:
        mvn     r0, #5
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}


