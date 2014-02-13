        .text
        .align  4
        .globl  _ippsSynthesisFilterLow_NR_16s_ISfs


_ippsSynthesisFilterLow_NR_16s_ISfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x2C
        ldr     r12, [sp, #0x50]
        cmp     r0, #0
        beq     LDTY23
        cmp     r1, #0
        beq     LDTY23
        cmp     r2, #0
        ble     LDTY24
        cmp     r3, #0xC
        blt     LDTY10
        cmp     r3, #0xD
        bgt     LDTY10
        cmp     r12, #0
        mov     r6, #0xB
        sub     r5, r3, #1
        mov     r4, #1
        beq     LDTY17
        adds    lr, r12, #0x14
        beq     LDTY11
        cmp     r2, #0
        ble     LDTY9
        str     lr, [sp, #0x10]
LDTY0:
        ldrsh   lr, [r1]
        ldrsh   r7, [r0]
        rsb     r11, r6, #0xB
        cmp     r11, #1
        mul     lr, r7, lr
        movlt   r7, #0
        movlt   r8, #1
        blt     LDTY4
        rsb     r7, r6, #0xA
        cmp     r7, #6
        movlt   r7, #0
        movlt   r8, #1
        blt     LDTY2
        mov     r7, #0
        mov     r8, #1
        rsb     r10, r6, #5
        add     r9, r0, #2
        str     lr, [sp, #0x24]
        str     r5, [sp, #0x20]
        str     r6, [sp, #0x1C]
        str     r12, [sp, #0x18]
        str     r3, [sp, #0x14]
        str     r2, [sp, #4]
        str     r0, [sp]
LDTY1:
        rsb     r0, r8, #0
        ldrsh   r6, [r9]
        ldrsh   r12, [r9, #2]
        ldrsh   r3, [r9, #4]
        ldrsh   r4, [r9, #6]
        ldrsh   lr, [r9, #8]
        mov     r0, r0, lsl #1
        ldrsh   r5, [r1, +r0]
        mvn     r0, #0
        rsb     r0, r8, r0
        mvn     r2, #1
        mla     r7, r6, r5, r7
        mov     r0, r0, lsl #1
        ldrsh   r5, [r1, +r0]
        rsb     r2, r8, r2
        mvn     r0, #2
        mla     r7, r12, r5, r7
        mov     r2, r2, lsl #1
        ldrsh   r2, [r1, +r2]
        rsb     r12, r8, r0
        mvn     r0, #3
        mla     r7, r3, r2, r7
        mov     r12, r12, lsl #1
        ldrsh   r2, [r1, +r12]
        rsb     r0, r8, r0
        add     r9, r9, #0xA
        mla     r7, r4, r2, r7
        mov     r0, r0, lsl #1
        ldrsh   r0, [r1, +r0]
        add     r8, r8, #5
        cmp     r8, r10
        mla     r7, lr, r0, r7
        ble     LDTY1
        ldr     lr, [sp, #0x24]
        ldr     r5, [sp, #0x20]
        ldr     r6, [sp, #0x1C]
        ldr     r12, [sp, #0x18]
        ldr     r3, [sp, #0x14]
        ldr     r2, [sp, #4]
        ldr     r0, [sp]
        mov     r4, #1
LDTY2:
        add     r9, r0, r8, lsl #1
        str     r0, [sp]
LDTY3:
        rsb     r10, r8, #0
        ldrsh   r0, [r9], #2
        mov     r10, r10, lsl #1
        ldrsh   r10, [r1, +r10]
        add     r8, r8, #1
        cmp     r8, r11
        mla     r7, r0, r10, r7
        ble     LDTY3
        ldr     r0, [sp]
LDTY4:
        cmp     r6, #1
        ble     LDTY8
        sub     r9, r6, #1
        cmp     r9, #6
        movlt   r11, #1
        blt     LDTY6
        add     r9, r0, r8, lsl #1
        str     r9, [sp, #8]
        mov     r9, #2
        str     r9, [sp, #0xC]
        str     r1, [sp, #0x28]
        str     r2, [sp, #4]
        ldr     r1, [sp, #0xC]
        ldr     r2, [sp, #8]
        mov     r11, #1
        sub     r10, r6, #6
        add     r9, r12, #0x10
        str     lr, [sp, #0x24]
        str     r5, [sp, #0x20]
        str     r6, [sp, #0x1C]
        str     r12, [sp, #0x18]
        str     r3, [sp, #0x14]
        str     r0, [sp]
LDTY5:
        ldr     r0, [sp, #0x10]
        ldrsh   lr, [r2]
        ldrsh   r12, [r9]
        sub     r0, r0, r1
        ldrsh   r4, [r0]
        ldrsh   r3, [r2, #2]
        ldrsh   r0, [r9, #-2]
        ldrsh   r5, [r2, #6]
        mla     r7, lr, r4, r7
        ldrsh   lr, [r2, #4]
        ldrsh   r4, [r9, #-4]
        ldrsh   r6, [r9, #-6]
        add     r1, r1, #0xA
        mla     r7, r3, r12, r7
        ldrsh   r3, [r2, #8]
        sub     r9, r9, #0xA
        add     r11, r11, #5
        add     r2, r2, #0xA
        mla     r7, lr, r0, r7
        add     r8, r8, #5
        cmp     r11, r10
        mla     r7, r5, r4, r7
        mla     r7, r3, r6, r7
        ble     LDTY5
        ldr     r1, [sp, #0x28]
        ldr     lr, [sp, #0x24]
        ldr     r5, [sp, #0x20]
        ldr     r6, [sp, #0x1C]
        ldr     r12, [sp, #0x18]
        ldr     r3, [sp, #0x14]
        ldr     r2, [sp, #4]
        ldr     r0, [sp]
        mov     r4, #1
LDTY6:
        add     r8, r0, r8, lsl #1
        str     r0, [sp]
        ldr     r0, [sp, #0x10]
        mov     r9, r11, lsl #1
        str     r2, [sp, #4]
LDTY7:
        sub     r10, r0, r9
        ldrsh   r2, [r8], #2
        ldrsh   r10, [r10]
        add     r11, r11, #1
        cmp     r11, r6
        mla     r7, r2, r10, r7
        add     r9, r9, #2
        blt     LDTY7
        ldr     r2, [sp, #4]
        ldr     r0, [sp]
LDTY8:
        sub     lr, lr, r7
        add     lr, lr, r4, lsl r5
        mov     lr, lr, asr r3
        cmp     r6, #1
        strh    lr, [r1]
        subgt   r6, r6, #1
        subs    r2, r2, #1
        add     r1, r1, #2
        bne     LDTY0
LDTY9:
        mov     r0, #0
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LDTY10:
        mvn     r0, #0xC
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LDTY11:
        cmp     r2, #0
        ble     LDTY9
LDTY12:
        ldrsh   r12, [r1]
        ldrsh   lr, [r0]
        rsb     r9, r6, #0xB
        cmp     r9, #1
        mul     r10, lr, r12
        movlt   r12, #0
        blt     LDTY16
        rsb     r12, r6, #0xA
        cmp     r12, #6
        movlt   r12, #0
        movlt   lr, #1
        blt     LDTY14
        mov     r12, #0
        mov     lr, #1
        rsb     r8, r6, #5
        add     r7, r0, #2
        str     r10, [sp, #0x24]
        str     r5, [sp, #0x20]
        str     r6, [sp, #0x1C]
        str     r3, [sp, #0x14]
        str     r2, [sp, #4]
        str     r0, [sp]
LDTY13:
        rsb     r0, lr, #0
        ldrsh   r11, [r7]
        ldrsh   r4, [r7, #2]
        ldrsh   r3, [r7, #4]
        ldrsh   r6, [r7, #6]
        ldrsh   r5, [r7, #8]
        mov     r0, r0, lsl #1
        ldrsh   r10, [r1, +r0]
        mvn     r0, #0
        rsb     r0, lr, r0
        mvn     r2, #1
        mla     r12, r11, r10, r12
        mov     r0, r0, lsl #1
        ldrsh   r10, [r1, +r0]
        rsb     r2, lr, r2
        mvn     r0, #2
        mla     r12, r4, r10, r12
        mov     r2, r2, lsl #1
        ldrsh   r4, [r1, +r2]
        rsb     r2, lr, r0
        mvn     r0, #3
        mla     r12, r3, r4, r12
        mov     r2, r2, lsl #1
        ldrsh   r2, [r1, +r2]
        rsb     r0, lr, r0
        add     r7, r7, #0xA
        mla     r12, r6, r2, r12
        mov     r0, r0, lsl #1
        ldrsh   r0, [r1, +r0]
        add     lr, lr, #5
        cmp     lr, r8
        mla     r12, r5, r0, r12
        ble     LDTY13
        ldr     r10, [sp, #0x24]
        ldr     r5, [sp, #0x20]
        ldr     r6, [sp, #0x1C]
        ldr     r3, [sp, #0x14]
        ldr     r2, [sp, #4]
        ldr     r0, [sp]
        mov     r4, #1
LDTY14:
        add     r7, r0, lr, lsl #1
LDTY15:
        rsb     r8, lr, #0
        ldrsh   r11, [r7], #2
        mov     r8, r8, lsl #1
        ldrsh   r8, [r1, +r8]
        add     lr, lr, #1
        cmp     lr, r9
        mla     r12, r11, r8, r12
        ble     LDTY15
LDTY16:
        sub     r10, r10, r12
        add     r12, r10, r4, lsl r5
        mov     r12, r12, asr r3
        cmp     r6, #1
        strh    r12, [r1]
        subgt   r6, r6, #1
        subs    r2, r2, #1
        add     r1, r1, #2
        bne     LDTY12
        mov     r0, #0
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LDTY17:
        cmp     r2, #0
        ble     LDTY9
LDTY18:
        ldrsh   lr, [r1]
        ldrsh   r12, [r0]
        rsb     r9, r6, #0xB
        cmp     r9, #1
        mul     r10, r12, lr
        movlt   r12, #0
        blt     LDTY22
        rsb     r12, r6, #0
        sub     r12, r12, #1
        add     r12, r12, #0xB
        cmp     r12, #6
        movlt   r12, #0
        movlt   lr, #1
        blt     LDTY20
        mov     r12, #0
        mov     lr, #1
        rsb     r8, r6, #5
        add     r7, r0, #2
        str     r10, [sp, #0x24]
        str     r5, [sp, #0x20]
        str     r6, [sp, #0x1C]
        str     r3, [sp, #0x14]
        str     r2, [sp, #4]
        str     r0, [sp]
LDTY19:
        rsb     r0, lr, #0
        ldrsh   r11, [r7]
        ldrsh   r4, [r7, #2]
        ldrsh   r3, [r7, #4]
        ldrsh   r6, [r7, #6]
        ldrsh   r5, [r7, #8]
        mov     r0, r0, lsl #1
        ldrsh   r10, [r1, +r0]
        mvn     r0, #0
        rsb     r0, lr, r0
        mvn     r2, #1
        mla     r12, r11, r10, r12
        mov     r0, r0, lsl #1
        ldrsh   r10, [r1, +r0]
        rsb     r2, lr, r2
        mvn     r0, #2
        mla     r12, r4, r10, r12
        mov     r2, r2, lsl #1
        ldrsh   r4, [r1, +r2]
        rsb     r2, lr, r0
        mvn     r0, #3
        mla     r12, r3, r4, r12
        mov     r2, r2, lsl #1
        ldrsh   r2, [r1, +r2]
        rsb     r0, lr, r0
        add     r7, r7, #0xA
        mla     r12, r6, r2, r12
        mov     r0, r0, lsl #1
        ldrsh   r0, [r1, +r0]
        add     lr, lr, #5
        cmp     lr, r8
        mla     r12, r5, r0, r12
        ble     LDTY19
        ldr     r10, [sp, #0x24]
        ldr     r5, [sp, #0x20]
        ldr     r6, [sp, #0x1C]
        ldr     r3, [sp, #0x14]
        ldr     r2, [sp, #4]
        ldr     r0, [sp]
        mov     r4, #1
LDTY20:
        add     r7, r0, lr, lsl #1
LDTY21:
        rsb     r8, lr, #0
        ldrsh   r11, [r7], #2
        mov     r8, r8, lsl #1
        ldrsh   r8, [r1, +r8]
        add     lr, lr, #1
        cmp     lr, r9
        mla     r12, r11, r8, r12
        ble     LDTY21
LDTY22:
        sub     r10, r10, r12
        add     r12, r10, r4, lsl r5
        mov     r12, r12, asr r3
        cmp     r6, #1
        strh    r12, [r1]
        subgt   r6, r6, #1
        subs    r2, r2, #1
        add     r1, r1, #2
        bne     LDTY18
        mov     r0, #0
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LDTY23:
        mvn     r0, #7
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LDTY24:
        mvn     r0, #5
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}


