        .text
        .align  4
        .globl  _ippsDotProdAutoScale_16s32s_Sfs


_ippsDotProdAutoScale_16s32s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x24
        ldr     r7, [sp, #0x48]
        cmp     r0, #0
        beq     LDRU5
        cmp     r1, #0
        beq     LDRU5
        cmp     r3, #0
        beq     LDRU5
        cmp     r7, #0
        beq     LDRU5
        cmp     r2, #0
        ble     LDRU6
        ldrsh   r10, [r0]
        ldrsh   r9, [r1]
        mov     r6, #0
        mov     r11, r6
        add     lr, sp, #0x20
        add     r12, sp, #0x20
        strh    r11, [lr]
        strh    r11, [r12, #2]
        mov     lr, r11
        str     r11, [sp, #0x14]
        mov     r8, #1
        mov     r12, lr
        mvn     r5, #2, 2
        mvn     r4, #0
        str     r7, [sp, #4]
        str     r3, [sp]
        str     r1, [sp, #0x18]
        str     r0, [sp, #0x1C]
        add     r11, sp, #0x20
LDRU0:
        mov     r0, r10, asr r12
        mov     r1, r9, asr r6
        mov     r0, r0, lsl #16
        mov     r1, r1, lsl #16
        mov     r0, r0, asr #16
        mov     r1, r1, asr #16
        mul     r0, r0, r1
        cmp     r2, #1
        mov     r7, r0, asr #31
        ble     LDRU2
        str     r10, [sp, #0xC]
        ldr     r10, [sp, #0x18]
        ldr     r11, [sp, #0x1C]
        mov     r1, #1
        mov     r3, r1
        str     r9, [sp, #0x10]
        str     r8, [sp, #8]
LDRU1:
        mov     r8, r1, lsl #1
        ldrsh   r1, [r11, +r8]
        ldrsh   r8, [r10, +r8]
        add     r3, r3, #1
        mov     r9, r1, asr r12
        mov     r1, r3, lsl #16
        mov     r8, r8, asr r6
        mov     r9, r9, lsl #16
        mov     r1, r1, asr #16
        mov     r8, r8, lsl #16
        mov     r9, r9, asr #15
        mov     r8, r8, asr #16
        mul     r8, r9, r8
        adds    r0, r8, r0
        adc     r7, r7, r8, asr #31
        cmp     r2, r1
        bgt     LDRU1
        ldr     r9, [sp, #0x10]
        ldr     r10, [sp, #0xC]
        ldr     r8, [sp, #8]
        add     r11, sp, #0x20
LDRU2:
        subs    r3, r0, r5
        sbcs    r1, r7, #0
        movlt   r3, #0
        movlt   r1, #0
        orrs    r1, r3, r1
        bne     LDRU3
        cmp     r0, #2, 2
        sbcs    r7, r7, r4
        strge   r0, [sp, #0x14]
        movge   lr, #1
        bge     LDRU4
LDRU3:
        mov     r1, r8, lsl #1
        add     r3, sp, #0x20
        ldrsh   r12, [r3, +r1]
        add     r0, sp, #0x20
        rsb     r8, r8, #1
        add     r12, r12, #1
        strh    r12, [r3, +r1]
        ldrsh   r12, [r0]
        ldrsh   r6, [r11, #2]
        mov     r8, r8, lsl #16
        mov     r8, r8, asr #16
LDRU4:
        cmp     lr, #0
        beq     LDRU0
        ldr     r11, [sp, #0x14]
        ldr     r3, [sp]
        ldr     r7, [sp, #4]
        add     r6, r12, r6
        mov     r0, #0
        str     r11, [r3]
        str     r6, [r7]
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LDRU5:
        mvn     r0, #7
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LDRU6:
        mvn     r0, #5
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}


