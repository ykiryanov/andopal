        .text
        .align  4
        .globl  ownsFIRSR64sc_16sc_Sfs


ownsFIRSR64sc_16sc_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x30
        ldr     r0, [r0]
        ldr     lr, [sp, #0x54]
        ldr     r12, [sp, #0x58]
        cmp     r3, #0
        ble     LBVM11
        cmp     r12, #0x1F
        mov     r8, r12
        mov     r4, #0x1F
        movgt   r8, r4
        cmn     r8, #0x1F
        mvn     r4, #0x1E
        movlt   r8, r4
        rsb     r4, r8, #0
        sub     r5, r4, #1
        mov     r6, #1
        mov     r5, r6, lsl r5
        mvn     r6, #0xFF
        bic     r6, r6, #0x7F, 24
        mvn     r9, r6
        sub     r5, r5, #1
        mov     r7, r4, asr #31
        mvn     r6, #0
        mov     r10, #0
        str     r6, [sp, #0x2C]
        str     r7, [sp, #0x28]
        str     r5, [sp, #0x24]
        str     r4, [sp, #0x20]
        str     r0, [sp, #0x14]
        str     r12, [sp, #0x10]
        str     lr, [sp, #0xC]
        str     r3, [sp, #8]
        str     r2, [sp, #4]
        str     r1, [sp]
LBVM0:
        ldr     r0, [sp, #0xC]
        cmp     r0, #0
        ble     LBVM12
        ldr     r3, [sp]
        ldr     r0, [sp, #0x14]
        mov     r11, r10, lsl #2
        add     r3, r3, r11
        add     r12, r3, #2
        ldr     r3, [sp, #0xC]
        mov     r6, #0
        mov     r5, r6
        mov     r4, r5
        add     lr, r0, #2
        mov     r7, r4
        str     r8, [sp, #0x1C]
        str     r10, [sp, #0x18]
LBVM1:
        ldrsh   r2, [lr, #-2]
        ldrsh   r8, [r12, #-2]
        ldrsh   r1, [r12], #4
        ldrsh   r10, [lr], #4
        mul     r0, r8, r2
        mul     r2, r1, r2
        mul     r1, r10, r1
        mla     r2, r8, r10, r2
        sub     r0, r0, r1
        adds    r7, r7, r0
        adc     r6, r6, r0, asr #31
        adds    r5, r5, r2
        adc     r4, r4, r2, asr #31
        subs    r3, r3, #1
        bne     LBVM1
        ldr     r8, [sp, #0x1C]
        ldr     r10, [sp, #0x18]
LBVM2:
        ldr     r3, [sp, #0x10]
        cmp     r3, #0
        beq     LBVM4
        cmp     r8, #0
        ble     LBVM3
        mov     r0, r7
        mov     r1, r6
        mov     r2, r8
        mov     r3, #0
        bl      __ashldi3
        mov     r7, r0
        mov     r6, r1
        b       LBVM4
LBVM3:
        mov     r0, r7
        mov     r1, r6
        ldr     r2, [sp, #0x20]
        ldr     r3, [sp, #0x28]
        bl      __ashrdi3
        ldr     r3, [sp, #0x24]
        ldr     r2, [sp, #0x20]
        adds    r7, r3, r7
        adc     r3, r6, r3, asr #31
        and     r0, r0, #1
        adds    r0, r7, r0
        adc     r1, r3, #0
        ldr     r3, [sp, #0x28]
        bl      __ashrdi3
        mov     r7, r0
        mov     r6, r1
LBVM4:
        subs    r12, r7, r9
        sbcs    r3, r6, #0
        movlt   r12, #0
        movlt   r3, #0
        orrs    r3, r12, r3
        bne     LBVM5
        mov     r3, #0
        sub     r3, r3, #2, 18
        cmp     r7, r3
        ldr     r3, [sp, #0x2C]
        sbcs    r6, r6, r3
        movge   r7, r7, lsl #16
        movge   r3, r7, asr #16
        movlt   r3, #0
        sublt   r3, r3, #2, 18
        b       LBVM6
LBVM5:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r3, r3
LBVM6:
        ldr     r12, [sp, #0x10]
        cmp     r12, #0
        ldr     r12, [sp, #4]
        strh    r3, [r12, +r11]
        beq     LBVM8
        cmp     r8, #0
        ble     LBVM7
        mov     r0, r5
        mov     r1, r4
        mov     r2, r8
        mov     r3, #0
        bl      __ashldi3
        mov     r5, r0
        mov     r4, r1
        b       LBVM8
LBVM7:
        mov     r0, r5
        mov     r1, r4
        ldr     r7, [sp, #0x20]
        ldr     r6, [sp, #0x28]
        mov     r2, r7
        mov     r3, r6
        bl      __ashrdi3
        ldr     r12, [sp, #0x24]
        and     r0, r0, #1
        mov     r2, r7
        adds    r5, r5, r12
        adc     r12, r4, r12, asr #31
        adds    r0, r5, r0
        adc     r1, r12, #0
        mov     r3, r6
        bl      __ashrdi3
        mov     r5, r0
        mov     r4, r1
LBVM8:
        subs    r12, r5, r9
        sbcs    r3, r4, #0
        movlt   r12, #0
        movlt   r3, #0
        orrs    r3, r12, r3
        bne     LBVM9
        mov     r3, #0
        sub     r3, r3, #2, 18
        cmp     r5, r3
        ldr     r3, [sp, #0x2C]
        sbcs    r4, r4, r3
        movge   r5, r5, lsl #16
        movge   r0, r5, asr #16
        mvnlt   r0, #0xFF
        biclt   r0, r0, #0x7F, 24
        b       LBVM10
LBVM9:
        mov     r0, #0
        sub     r0, r0, #2, 18
        mvn     r0, r0
LBVM10:
        ldr     r1, [sp, #4]
        add     r10, r10, #1
        add     r11, r11, r1
        ldr     r1, [sp, #8]
        strh    r0, [r11, #2]
        cmp     r10, r1
        blt     LBVM0
LBVM11:
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LBVM12:
        mov     r6, #0
        mov     r5, r6
        mov     r4, r5
        mov     r7, r4
        mov     r11, r10, lsl #2
        b       LBVM2


