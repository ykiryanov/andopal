        .text
        .align  4
        .globl  ownsFIRSR_16s_Sfs


ownsFIRSR_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x4C
        ldr     r0, [r0]
        ldr     lr, [sp, #0x70]
        ldr     r12, [sp, #0x74]
        str     r0, [sp, #0x48]
        bic     r0, r3, #3
        cmp     r0, #0
        ble     LBVL15
        cmp     r12, #0x1F
        mov     r5, r12
        mov     r4, #0x1F
        movgt   r5, r4
        cmn     r5, #0x1F
        mvn     r4, #0x1E
        add     r11, r1, #2
        movlt   r5, r4
        str     r11, [sp, #0x40]
        mvn     r4, #0xFF
        add     r7, r2, #4
        add     r11, r1, #4
        rsb     r10, r5, #0
        str     r7, [sp, #0x44]
        str     r11, [sp, #0x3C]
        bic     r4, r4, #0x7F, 24
        sub     r9, r10, #1
        add     r8, r2, #2
        add     r7, r2, #6
        add     r11, r1, #6
        mvn     r4, r4
        mov     r6, #0
        str     r11, [sp]
        str     r7, [sp, #0xC]
        str     r8, [sp, #0x10]
        str     r9, [sp, #0x14]
        str     r10, [sp, #0x18]
        str     r0, [sp, #0x24]
        str     r3, [sp, #0x30]
        str     r2, [sp, #0x34]
        str     r1, [sp, #0x38]
LBVL0:
        cmp     lr, #0
        ble     LBVL26
        ldr     r0, [sp, #0x38]
        mov     r9, r6, lsl #1
        mov     r8, #0
        add     r1, r0, r9
        ldr     r0, [sp, #0x48]
        mov     r2, r8
        mov     r3, r2
        mov     r7, r3
        mov     r11, r6
        mov     r10, lr
        str     r9, [sp, #4]
        str     r4, [sp, #8]
        str     r5, [sp, #0x1C]
        str     r6, [sp, #0x20]
        str     r12, [sp, #0x28]
        str     lr, [sp, #0x2C]
LBVL1:
        ldr     r12, [sp, #0x40]
        ldrsh   r6, [r0], #2
        ldrsh   r5, [r1], #2
        mov     r4, r11, lsl #1
        ldrsh   lr, [r12, +r4]
        ldr     r12, [sp, #0x3C]
        ldr     r9, [sp]
        mla     r8, r5, r6, r8
        ldrsh   r12, [r12, +r4]
        mla     r7, lr, r6, r7
        ldrsh   r4, [r9, +r4]
        subs    r10, r10, #1
        mla     r3, r12, r6, r3
        mla     r2, r4, r6, r2
        add     r11, r11, #1
        bne     LBVL1
        ldr     r9, [sp, #4]
        ldr     r4, [sp, #8]
        ldr     r5, [sp, #0x1C]
        ldr     r6, [sp, #0x20]
        ldr     r12, [sp, #0x28]
        ldr     lr, [sp, #0x2C]
LBVL2:
        cmp     r12, #0
        beq     LBVL3
        cmp     r5, #0
        movgt   r8, r8, lsl r5
        bgt     LBVL3
        ldr     r1, [sp, #0x18]
        ldr     r11, [sp, #0x14]
        mov     r10, #1
        mov     r0, r8, asr r1
        and     r0, r0, #1
        add     r11, r8, r10, lsl r11
        add     r0, r11, r0
        sub     r0, r0, #1
        mov     r8, r0, asr r1
LBVL3:
        cmp     r4, r8
        blt     LBVL4
        cmn     r8, #2, 18
        movge   r8, r8, lsl #16
        movge   r0, r8, asr #16
        movlt   r0, #0
        sublt   r0, r0, #2, 18
        b       LBVL5
LBVL4:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r0, r0
LBVL5:
        ldr     r1, [sp, #0x34]
        cmp     r12, #0
        strh    r0, [r1, +r9]
        beq     LBVL6
        cmp     r5, #0
        movgt   r7, r7, lsl r5
        bgt     LBVL6
        ldr     r0, [sp, #0x18]
        ldr     r10, [sp, #0x14]
        mov     r8, #1
        mov     r1, r7, asr r0
        and     r1, r1, #1
        add     r10, r7, r8, lsl r10
        add     r1, r10, r1
        sub     r1, r1, #1
        mov     r7, r1, asr r0
LBVL6:
        cmp     r4, r7
        blt     LBVL7
        cmn     r7, #2, 18
        movge   r7, r7, lsl #16
        movge   r0, r7, asr #16
        movlt   r0, #0
        sublt   r0, r0, #2, 18
        b       LBVL8
LBVL7:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r0, r0
LBVL8:
        ldr     r1, [sp, #0x10]
        cmp     r12, #0
        strh    r0, [r1, +r9]
        beq     LBVL9
        cmp     r5, #0
        movgt   r3, r3, lsl r5
        bgt     LBVL9
        ldr     r0, [sp, #0x18]
        ldr     r8, [sp, #0x14]
        mov     r7, #1
        mov     r1, r3, asr r0
        and     r1, r1, #1
        add     r8, r3, r7, lsl r8
        add     r1, r8, r1
        sub     r1, r1, #1
        mov     r3, r1, asr r0
LBVL9:
        cmp     r4, r3
        blt     LBVL10
        cmn     r3, #2, 18
        movge   r3, r3, lsl #16
        movge   r0, r3, asr #16
        movlt   r0, #0
        sublt   r0, r0, #2, 18
        b       LBVL11
LBVL10:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r0, r0
LBVL11:
        ldr     r1, [sp, #0x44]
        cmp     r12, #0
        strh    r0, [r1, +r9]
        beq     LBVL12
        cmp     r5, #0
        movgt   r2, r2, lsl r5
        bgt     LBVL12
        ldr     r0, [sp, #0x18]
        ldr     r7, [sp, #0x14]
        mov     r3, #1
        mov     r1, r2, asr r0
        and     r1, r1, #1
        add     r7, r2, r3, lsl r7
        add     r1, r7, r1
        sub     r1, r1, #1
        mov     r2, r1, asr r0
LBVL12:
        cmp     r4, r2
        blt     LBVL13
        cmn     r2, #2, 18
        movge   r2, r2, lsl #16
        movge   r0, r2, asr #16
        movlt   r0, #0
        sublt   r0, r0, #2, 18
        b       LBVL14
LBVL13:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r0, r0
LBVL14:
        ldr     r1, [sp, #0x24]
        add     r6, r6, #4
        cmp     r6, r1
        ldr     r1, [sp, #0xC]
        strh    r0, [r1, +r9]
        blt     LBVL0
        ldr     r0, [sp, #0x24]
        ldr     r3, [sp, #0x30]
        ldr     r2, [sp, #0x34]
        ldr     r1, [sp, #0x38]
LBVL15:
        cmp     r0, r3
        bge     LBVL24
        cmp     r12, #0x1F
        mov     r10, r12
        mov     r4, #0x1F
        movgt   r10, r4
        cmn     r10, #0x1F
        mvn     r4, #0x1E
        movlt   r10, r4
        mvn     r4, #0xFF
        bic     r5, r4, #0x7F, 24
        ldr     r8, [sp, #0x48]
        rsb     r4, r10, #0
        mvn     r9, r5
        sub     r6, r4, #1
        sub     r5, lr, #6
        mov     r7, #1
        str     r5, [sp, #0x14]
        str     r6, [sp, #0x18]
        str     r4, [sp, #0x3C]
LBVL16:
        cmp     lr, #0
        movle   r5, #0
        movle   r6, r0, lsl #1
        ble     LBVL20
        cmp     lr, #6
        blt     LBVL25
        mov     r6, r0, lsl #1
        add     r4, r1, r6
        str     r8, [sp, #0x1C]
        str     r4, [sp, #0x20]
        str     r3, [sp, #0x30]
        str     r2, [sp, #0x34]
        str     r1, [sp, #0x38]
        ldr     r3, [sp, #0x20]
        ldr     r2, [sp, #0x1C]
        ldr     r1, [sp, #0x14]
        mov     r7, #0
        mov     r5, r7
        str     r9, [sp, #0x40]
        str     r10, [sp, #0x44]
        str     r0, [sp, #0x24]
        str     r12, [sp, #0x28]
        str     lr, [sp, #0x2C]
LBVL17:
        ldrsh   r8, [r2]
        ldrsh   r9, [r3]
        ldrsh   r12, [r2, #2]
        ldrsh   lr, [r3, #2]
        ldrsh   r0, [r2, #4]
        mla     r11, r9, r8, r5
        ldrsh   r5, [r3, #4]
        ldrsh   r8, [r2, #6]
        ldrsh   r9, [r3, #6]
        ldrsh   r10, [r2, #8]
        mla     r11, lr, r12, r11
        ldrsh   r12, [r3, #8]
        add     r2, r2, #0xA
        add     r3, r3, #0xA
        add     r7, r7, #5
        mla     r11, r5, r0, r11
        cmp     r7, r1
        mla     r11, r9, r8, r11
        mla     r5, r12, r10, r11
        ble     LBVL17
        ldr     r9, [sp, #0x40]
        ldr     r10, [sp, #0x44]
        ldr     r0, [sp, #0x24]
        ldr     r8, [sp, #0x48]
        ldr     r12, [sp, #0x28]
        ldr     lr, [sp, #0x2C]
        ldr     r3, [sp, #0x30]
        ldr     r2, [sp, #0x34]
        ldr     r1, [sp, #0x38]
LBVL18:
        mov     r11, r7, lsl #1
        str     r11, [sp, #0x1C]
        add     r11, r8, r7, lsl #1
        str     r11, [sp, #0x20]
        str     r3, [sp, #0x30]
        ldr     r3, [sp, #0x20]
        ldr     r11, [sp, #0x1C]
        str     r2, [sp, #0x34]
        str     r1, [sp, #0x38]
LBVL19:
        ldrsh   r2, [r3], #2
        ldrsh   r1, [r4, +r11]
        add     r7, r7, #1
        cmp     r7, lr
        mla     r5, r1, r2, r5
        add     r11, r11, #2
        blt     LBVL19
        ldr     r3, [sp, #0x30]
        ldr     r2, [sp, #0x34]
        ldr     r1, [sp, #0x38]
LBVL20:
        cmp     r12, #0
        beq     LBVL21
        cmp     r10, #0
        movgt   r5, r5, lsl r10
        bgt     LBVL21
        ldr     r4, [sp, #0x3C]
        mov     r11, #1
        mov     r7, r5, asr r4
        str     r7, [sp, #0x20]
        ldr     r7, [sp, #0x18]
        add     r5, r5, r11, lsl r7
        ldr     r7, [sp, #0x20]
        and     r7, r7, #1
        add     r7, r5, r7
        sub     r5, r7, #1
        mov     r5, r5, asr r4
LBVL21:
        cmp     r9, r5
        blt     LBVL22
        cmn     r5, #2, 18
        movge   r5, r5, lsl #16
        movge   r5, r5, asr #16
        mvnlt   r4, #0xFF
        biclt   r5, r4, #0x7F, 24
        b       LBVL23
LBVL22:
        mov     r4, #0
        sub     r4, r4, #2, 18
        mvn     r5, r4
LBVL23:
        add     r0, r0, #1
        cmp     r0, r3
        strh    r5, [r2, +r6]
        blt     LBVL16
LBVL24:
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
LBVL25:
        mov     r7, #0
        mov     r6, r0, lsl #1
        mov     r5, r7
        add     r4, r1, r6
        b       LBVL18
LBVL26:
        mov     r8, #0
        mov     r2, r8
        mov     r3, r2
        mov     r7, r3
        mov     r9, r6, lsl #1
        b       LBVL2


