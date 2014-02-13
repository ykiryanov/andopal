        .text
        .align  4
        .globl  _ippsSynthesisFilter_G729E_16s_I


_ippsSynthesisFilter_G729E_16s_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x44
        ldr     r12, [sp, #0x68]
        mov     r4, r1
        mov     r1, r2
        cmp     r0, #0
        mov     r2, r3
        beq     LDTV20
        cmp     r1, #0
        beq     LDTV20
        cmp     r2, #0
        ble     LDTV19
        cmp     r4, #0
        ble     LDTV19
        cmp     r4, #0xA
        beq     LDTV18
        adds    r5, r12, r4, lsl #1
        add     r12, r4, #1
        mov     r4, #0
        mov     lr, r12
        beq     LDTV12
        mvn     r6, #0
        add     r9, r6, #2, 18
        mov     r6, r6, lsl #15
        mov     r10, r4
        str     r6, [sp, #0x20]
LDTV0:
        ldrsh   r6, [r1]
        ldrsh   r7, [r0]
        mul     r6, r7, r6
        sub     r7, r12, lr
        cmp     r7, #1
        movlt   r11, #0
        movlt   r8, #1
        blt     LDTV4
        sub     r8, r7, #1
        cmp     r8, #6
        movlt   r11, #0
        movlt   r8, #1
        blt     LDTV2
        sub     r3, r7, #6
        str     r3, [sp, #0x24]
        add     r3, r0, #2
        str     r3, [sp, #0x1C]
        str     r7, [sp, #0x2C]
        str     r4, [sp, #0x10]
        ldr     r4, [sp, #0x1C]
        ldr     r7, [sp, #0x24]
        mov     r11, #0
        mov     r8, #1
        str     r6, [sp, #0x34]
        str     r9, [sp, #0x30]
        str     lr, [sp, #0x18]
        str     r12, [sp, #0x14]
        str     r5, [sp, #0x40]
        str     r2, [sp, #0xC]
        str     r0, [sp, #8]
LDTV1:
        rsb     r0, r8, #0
        ldrsh   r2, [r4]
        ldrsh   lr, [r4, #2]
        ldrsh   r12, [r4, #4]
        ldrsh   r6, [r4, #6]
        ldrsh   r5, [r4, #8]
        mov     r0, r0, lsl #1
        ldrsh   r9, [r1, +r0]
        mvn     r0, #0
        rsb     r0, r8, r0
        mvn     r3, #1
        mla     r11, r2, r9, r11
        mov     r0, r0, lsl #1
        ldrsh   r9, [r1, +r0]
        rsb     r3, r8, r3
        mvn     r0, #2
        mla     r11, lr, r9, r11
        mov     r3, r3, lsl #1
        ldrsh   r3, [r1, +r3]
        rsb     lr, r8, r0
        mvn     r0, #3
        mla     r11, r12, r3, r11
        mov     lr, lr, lsl #1
        ldrsh   r3, [r1, +lr]
        rsb     r0, r8, r0
        add     r4, r4, #0xA
        mla     r11, r6, r3, r11
        mov     r0, r0, lsl #1
        ldrsh   r0, [r1, +r0]
        add     r8, r8, #5
        cmp     r8, r7
        mla     r11, r5, r0, r11
        ble     LDTV1
        ldr     r7, [sp, #0x2C]
        ldr     r6, [sp, #0x34]
        ldr     r9, [sp, #0x30]
        ldr     lr, [sp, #0x18]
        ldr     r12, [sp, #0x14]
        ldr     r5, [sp, #0x40]
        ldr     r4, [sp, #0x10]
        ldr     r2, [sp, #0xC]
        ldr     r0, [sp, #8]
LDTV2:
        add     r3, r0, r8, lsl #1
        str     r3, [sp, #0x1C]
        str     r0, [sp, #8]
        ldr     r0, [sp, #0x1C]
        str     r2, [sp, #0xC]
LDTV3:
        rsb     r2, r8, #0
        ldrsh   r3, [r0], #2
        mov     r2, r2, lsl #1
        ldrsh   r2, [r1, +r2]
        add     r8, r8, #1
        cmp     r8, r7
        mla     r11, r3, r2, r11
        ble     LDTV3
        ldr     r2, [sp, #0xC]
        ldr     r0, [sp, #8]
LDTV4:
        cmp     lr, #1
        ble     LDTV8
        sub     r7, lr, #1
        cmp     r7, #6
        movlt   r7, #1
        blt     LDTV6
        sub     r3, lr, #6
        str     r3, [sp, #0x24]
        add     r3, r0, r8, lsl #1
        str     r3, [sp, #0x28]
        mov     r3, #2
        str     r3, [sp, #0x2C]
        sub     r3, r5, #4
        str     r3, [sp, #0x1C]
        str     r1, [sp, #0x3C]
        str     r2, [sp, #0xC]
        ldr     r2, [sp, #0x1C]
        ldr     r1, [sp, #0x2C]
        ldr     r3, [sp, #0x28]
        mov     r7, #1
        str     r10, [sp, #0x38]
        str     r6, [sp, #0x34]
        str     r9, [sp, #0x30]
        str     lr, [sp, #0x18]
        str     r12, [sp, #0x14]
        str     r4, [sp, #0x10]
        str     r0, [sp, #8]
LDTV5:
        sub     r0, r5, r1
        ldrsh   r6, [r0]
        ldrsh   r4, [r3]
        ldrsh   lr, [r2]
        ldrsh   r12, [r3, #2]
        ldrsh   r0, [r2, #-2]
        mla     r11, r4, r6, r11
        ldrsh   r4, [r3, #4]
        ldrsh   r6, [r2, #-4]
        ldrsh   r9, [r3, #6]
        ldrsh   r10, [r2, #-6]
        mla     r11, r12, lr, r11
        ldrsh   r12, [r3, #8]
        add     r1, r1, #0xA
        sub     r2, r2, #0xA
        add     r7, r7, #5
        mla     r11, r4, r0, r11
        ldr     r0, [sp, #0x24]
        add     r3, r3, #0xA
        add     r8, r8, #5
        cmp     r7, r0
        mla     r11, r9, r6, r11
        mla     r11, r12, r10, r11
        ble     LDTV5
        ldr     r1, [sp, #0x3C]
        ldr     r10, [sp, #0x38]
        ldr     r6, [sp, #0x34]
        ldr     r9, [sp, #0x30]
        ldr     lr, [sp, #0x18]
        ldr     r12, [sp, #0x14]
        ldr     r4, [sp, #0x10]
        ldr     r2, [sp, #0xC]
        ldr     r0, [sp, #8]
LDTV6:
        add     r8, r0, r8, lsl #1
        str     r8, [sp, #0x1C]
        str     r0, [sp, #8]
        ldr     r0, [sp, #0x1C]
        mov     r8, r7, lsl #1
        str     r2, [sp, #0xC]
LDTV7:
        sub     r2, r5, r8
        ldrsh   r3, [r0], #2
        ldrsh   r2, [r2]
        add     r7, r7, #1
        cmp     r7, lr
        mla     r11, r3, r2, r11
        add     r8, r8, #2
        blt     LDTV7
        ldr     r2, [sp, #0xC]
        ldr     r0, [sp, #8]
LDTV8:
        sub     r6, r6, r11
        add     r6, r6, #2, 22
        mov     r6, r6, asr #12
        cmp     r9, r6
        strlth  r9, [r1]
        movlt   r10, #1
        blt     LDTV9
        cmn     r6, #2, 18
        strgeh  r6, [r1]
        bge     LDTV9
        ldr     r6, [sp, #0x20]
        mov     r10, #1
        strh    r6, [r1]
LDTV9:
        cmp     lr, #1
        subgt   lr, lr, #1
        add     r4, r4, #1
        cmp     r4, r2
        add     r1, r1, #2
        blt     LDTV0
LDTV10:
        cmp     r10, #0
        beq     LDTV11
        mov     r0, #0xC
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LDTV11:
        mov     r0, #0
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LDTV12:
        mov     r11, r4
LDTV13:
        ldrsh   r5, [r1]
        ldrsh   r6, [r0]
        sub     r9, r12, lr
        cmp     r9, #1
        mul     r10, r6, r5
        movlt   r5, r4
        blt     LDTV17
        sub     r5, r9, #1
        cmp     r5, #6
        mov     r8, #1
        movlt   r5, r4
        blt     LDTV15
        mov     r5, r4
        sub     r7, r9, #6
        add     r6, r0, #2
        str     r10, [sp, #0x20]
        str     r11, [sp, #0x1C]
        str     lr, [sp, #0x18]
        str     r12, [sp, #0x14]
        str     r4, [sp, #0x10]
        str     r2, [sp, #0xC]
        str     r0, [sp, #8]
LDTV14:
        rsb     r0, r8, #0
        ldrsh   r2, [r6]
        ldrsh   lr, [r6, #2]
        ldrsh   r12, [r6, #4]
        ldrsh   r4, [r6, #6]
        ldrsh   r10, [r6, #8]
        mov     r0, r0, lsl #1
        ldrsh   r11, [r1, +r0]
        mvn     r0, #0
        rsb     r0, r8, r0
        mvn     r3, #1
        mla     r5, r2, r11, r5
        mov     r0, r0, lsl #1
        ldrsh   r11, [r1, +r0]
        rsb     r3, r8, r3
        mvn     r0, #2
        mla     r5, lr, r11, r5
        mov     r3, r3, lsl #1
        ldrsh   lr, [r1, +r3]
        rsb     r3, r8, r0
        mvn     r0, #3
        mla     r5, r12, lr, r5
        mov     r3, r3, lsl #1
        ldrsh   r3, [r1, +r3]
        rsb     r0, r8, r0
        add     r6, r6, #0xA
        mla     r5, r4, r3, r5
        mov     r0, r0, lsl #1
        ldrsh   r0, [r1, +r0]
        add     r8, r8, #5
        cmp     r8, r7
        mla     r5, r10, r0, r5
        ble     LDTV14
        ldr     r10, [sp, #0x20]
        ldr     r11, [sp, #0x1C]
        ldr     lr, [sp, #0x18]
        ldr     r12, [sp, #0x14]
        ldr     r4, [sp, #0x10]
        ldr     r2, [sp, #0xC]
        ldr     r0, [sp, #8]
LDTV15:
        add     r6, r0, r8, lsl #1
LDTV16:
        rsb     r7, r8, #0
        ldrsh   r3, [r6], #2
        mov     r7, r7, lsl #1
        ldrsh   r7, [r1, +r7]
        add     r8, r8, #1
        cmp     r8, r9
        mla     r5, r3, r7, r5
        ble     LDTV16
LDTV17:
        sub     r10, r10, r5
        add     r5, r10, #2, 22
        cmp     lr, #1
        mov     r5, r5, asr #12
        strh    r5, [r1]
        subgt   lr, lr, #1
        add     r11, r11, #1
        cmp     r11, r2
        add     r1, r1, #2
        blt     LDTV13
        mov     r10, #0
        b       LDTV10
LDTV18:
        str     r12, [sp]
        mov     r3, #0xC
        bl      _ippsSynthesisFilter_NR_16s_ISfs
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LDTV19:
        mvn     r0, #5
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LDTV20:
        mvn     r0, #7
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}


