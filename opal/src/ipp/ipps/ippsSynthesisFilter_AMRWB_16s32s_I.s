        .text
        .align  4
        .globl  _ippsSynthesisFilter_AMRWB_16s32s_I


_ippsSynthesisFilter_AMRWB_16s32s_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x38
        ldr     r12, [sp, #0x5C]
        cmp     r0, #0
        beq     LDJD16
        cmp     r2, #0
        beq     LDJD16
        cmp     r3, #0
        beq     LDJD16
        cmp     r1, #0
        ble     LDJD15
        cmp     r12, #0
        ble     LDJD15
        cmp     r12, #0
        ble     LDJD12
        sub     r6, r1, #6
        sub     r7, r1, #5
        mvn     r8, #0
        mov     r5, #0
        sub     r4, r1, #1
        mvn     lr, #2, 2
        str     r8, [sp, #0x34]
        str     r7, [sp, #0x2C]
        str     r6, [sp, #0x30]
LDJD0:
        cmp     r1, #1
        blt     LDJD14
        cmp     r4, #5
        blt     LDJD13
        str     r12, [sp, #0x18]
        ldr     r12, [sp, #0x2C]
        mov     r7, r5, lsl #2
        mov     r8, #0
        mov     r10, #1
        add     r6, r3, r7
        add     r9, r0, #2
        str     r7, [sp]
        str     r2, [sp, #8]
        str     lr, [sp, #0xC]
        str     r4, [sp, #0x10]
        str     r5, [sp, #0x14]
        str     r3, [sp, #0x1C]
        str     r1, [sp, #0x20]
        str     r0, [sp, #0x24]
LDJD1:
        ldrsh   r11, [r9]
        ldrsh   lr, [r9, #2]
        ldrsh   r4, [r9, #4]
        ldrsh   r5, [r9, #6]
        rsb     r1, r10, #0
        ldr     r3, [r6, +r1, lsl #2]
        mvn     r0, #0
        add     r7, r0, #1, 20
        mvn     r1, #1
        rsb     r0, r10, r0
        ldr     r0, [r6, +r0, lsl #2]
        mvn     r2, #2
        rsb     r1, r10, r1
        ldr     r1, [r6, +r1, lsl #2]
        rsb     r2, r10, r2
        ldr     r2, [r6, +r2, lsl #2]
        and     r3, r7, r3, asr #4
        mul     r3, r11, r3
        and     r0, r7, r0, asr #4
        mul     lr, lr, r0
        and     r1, r7, r1, asr #4
        mul     r4, r4, r1
        sub     r8, r8, r3
        and     r2, r7, r2, asr #4
        mul     r5, r5, r2
        sub     r8, r8, lr
        add     r10, r10, #4
        sub     r8, r8, r4
        cmp     r10, r12
        sub     r8, r8, r5
        add     r9, r9, #8
        ble     LDJD1
        ldr     r7, [sp]
        ldr     r2, [sp, #8]
        ldr     lr, [sp, #0xC]
        ldr     r4, [sp, #0x10]
        ldr     r5, [sp, #0x14]
        ldr     r12, [sp, #0x18]
        ldr     r3, [sp, #0x1C]
        ldr     r1, [sp, #0x20]
        ldr     r0, [sp, #0x24]
LDJD2:
        add     r9, r0, r10, lsl #1
        str     r3, [sp, #0x1C]
        str     r0, [sp, #0x24]
LDJD3:
        rsb     r0, r10, #0
        ldr     r0, [r6, +r0, lsl #2]
        ldrsh   r3, [r9], #2
        mvn     r11, #0
        add     r11, r11, #1, 20
        and     r0, r11, r0, asr #4
        mul     r0, r3, r0
        add     r10, r10, #1
        cmp     r10, r1
        sub     r8, r8, r0
        ble     LDJD3
        ldr     r3, [sp, #0x1C]
        ldr     r0, [sp, #0x24]
LDJD4:
        ldrsh   r9, [r2], #2
        ldrsh   r11, [r0]
        mov     r10, r8, asr #11
        cmp     r1, #1
        mul     r8, r11, r9
        blt     LDJD8
        cmp     r4, #6
        movlt   r9, #1
        blt     LDJD6
        add     r11, r0, #2
        str     r11, [sp, #0x28]
        str     r12, [sp, #0x18]
        ldr     r12, [sp, #0x28]
        mov     r9, #1
        str     r7, [sp]
        str     r10, [sp, #4]
        str     r2, [sp, #8]
        str     lr, [sp, #0xC]
        str     r4, [sp, #0x10]
        str     r5, [sp, #0x14]
        str     r3, [sp, #0x1C]
        str     r1, [sp, #0x20]
        str     r0, [sp, #0x24]
LDJD5:
        ldrsh   r11, [r12]
        rsb     r0, r9, #0
        ldr     r3, [r6, +r0, lsl #2]
        ldrsh   lr, [r12, #2]
        mvn     r0, #0
        rsb     r0, r9, r0
        ldr     r0, [r6, +r0, lsl #2]
        ldrsh   r4, [r12, #4]
        ldrsh   r5, [r12, #6]
        ldrsh   r7, [r12, #8]
        mvn     r1, #1
        mvn     r2, #2
        rsb     r1, r9, r1
        ldr     r1, [r6, +r1, lsl #2]
        mvn     r10, #3
        rsb     r2, r9, r2
        ldr     r2, [r6, +r2, lsl #2]
        mov     r3, r3, asr #16
        mul     r3, r3, r11
        rsb     r10, r9, r10
        ldr     r10, [r6, +r10, lsl #2]
        mov     r0, r0, asr #16
        mul     lr, r0, lr
        ldr     r0, [sp, #0x30]
        mov     r1, r1, asr #16
        mul     r4, r1, r4
        sub     r8, r8, r3
        mov     r2, r2, asr #16
        mul     r5, r2, r5
        mov     r10, r10, asr #16
        mul     r7, r10, r7
        sub     r8, r8, lr
        sub     r8, r8, r4
        add     r9, r9, #5
        sub     r5, r8, r5
        cmp     r9, r0
        sub     r8, r5, r7
        add     r12, r12, #0xA
        ble     LDJD5
        ldr     r7, [sp]
        ldr     r10, [sp, #4]
        ldr     r2, [sp, #8]
        ldr     lr, [sp, #0xC]
        ldr     r4, [sp, #0x10]
        ldr     r5, [sp, #0x14]
        ldr     r12, [sp, #0x18]
        ldr     r3, [sp, #0x1C]
        ldr     r1, [sp, #0x20]
        ldr     r0, [sp, #0x24]
LDJD6:
        add     r11, r0, r9, lsl #1
        str     r11, [sp, #0x28]
        str     r3, [sp, #0x1C]
        ldr     r3, [sp, #0x28]
        str     r0, [sp, #0x24]
LDJD7:
        ldrsh   r0, [r3], #2
        rsb     r11, r9, #0
        ldr     r11, [r6, +r11, lsl #2]
        add     r9, r9, #1
        mov     r11, r11, asr #16
        mul     r0, r11, r0
        cmp     r9, r1
        sub     r8, r8, r0
        ble     LDJD7
        ldr     r3, [sp, #0x1C]
        ldr     r0, [sp, #0x24]
LDJD8:
        cmn     r8, #7, 2
        mvngt   r8, #2, 2
        bgt     LDJD9
        cmp     r8, #3, 2
        movge   r8, r8, lsl #1
        movlt   r8, #2, 2
LDJD9:
        adds    r6, r10, r8
        mov     r8, r8, asr #31
        adc     r10, r8, r10, asr #31
        subs    r9, r6, lr
        sbcs    r8, r10, #0
        movlt   r9, #0
        movlt   r8, #0
        orrs    r8, r9, r8
        mvnne   r6, #2, 2
        bne     LDJD10
        ldr     r8, [sp, #0x34]
        cmp     r6, #2, 2
        sbcs    r10, r10, r8
        movlt   r6, #2, 2
LDJD10:
        cmn     r6, #0x1F, 4
        mvngt   r6, #2, 2
        bgt     LDJD11
        cmp     r6, #0xF, 4
        movge   r6, r6, lsl #3
        movlt   r6, #2, 2
LDJD11:
        add     r5, r5, #1
        cmp     r5, r12
        str     r6, [r7, +r3]
        blt     LDJD0
LDJD12:
        mov     r0, #0
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LDJD13:
        mov     r7, r5, lsl #2
        mov     r8, #0
        mov     r10, #1
        add     r6, r3, r7
        b       LDJD2
LDJD14:
        mov     r7, r5, lsl #2
        mov     r8, #0
        add     r6, r3, r7
        b       LDJD4
LDJD15:
        mvn     r0, #5
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LDJD16:
        mvn     r0, #7
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}


