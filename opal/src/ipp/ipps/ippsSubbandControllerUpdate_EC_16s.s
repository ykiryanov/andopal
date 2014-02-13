        .text
        .align  4
        .globl  _ippsSubbandControllerUpdate_EC_16s


_ippsSubbandControllerUpdate_EC_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x2C
        ldr     r11, [sp, #0x50]
        ldr     r12, [sp, #0x54]
        cmp     r0, #0
        mov     r10, r2
        mov     r5, r3
        beq     LDKE19
        cmp     r1, #0
        beq     LDKE19
        cmp     r10, #0
        beq     LDKE19
        cmp     r11, #0
        beq     LDKE19
        cmp     r12, #0
        beq     LDKE19
        and     r0, r12, #0xF
        rsb     r0, r0, #0
        and     r0, r0, #0xF
        ldr     r4, [r0, +r12]
        add     r6, r12, r0
        ldr     r0, [r10]
        ldr     r1, [r6, #0x1C]
        mov     r3, #0xA
        mov     r2, r4
        bl      _ippsMagSquared_32sc32s_Sfs
        ldr     r1, [r6, #0x18]
        ldr     r0, [r6, #0x1C]
        mov     r3, #0
        mov     r2, r4
        bl      _ippsAdd_32s_ISfs
        ldr     r0, [r6, #0x24]
        ldr     r8, [r6, #0x18]
        ldr     r12, [r6, #0x4C]
        ldr     lr, [r6, #0x50]
        ldr     r2, [r6, #0x48]
        tst     r0, #1, 2
        mov     r1, #0
        bne     LDKE1
LDKE0:
        mov     r0, r0, lsl #1
        tst     r0, #1, 2
        add     r1, r1, #1
        beq     LDKE0
LDKE1:
        cmp     r4, #0
        ble     LDKE8
        mov     r7, r11
        str     r10, [sp, #0x24]
        mov     r9, #0
        str     r2, [sp, #4]
        str     lr, [sp, #0x14]
        str     r12, [sp, #0x10]
        str     r4, [sp, #8]
        str     r6, [sp, #0x1C]
        str     r1, [sp, #0x18]
        str     r5, [sp, #0x20]
        mov     r10, r0
LDKE2:
        ldr     r5, [r8], #4
        ldr     r1, [sp, #4]
        cmp     r5, r1
        ble     LDKE6
        tst     r5, #1, 2
        mov     r4, r10
        movne   r1, #0
        strne   r1, [sp]
        bne     LDKE4
        mov     r1, #0
        str     r1, [sp]
        ldr     r1, [sp]
LDKE3:
        mov     r5, r5, lsl #1
        tst     r5, #1, 2
        add     r1, r1, #1
        beq     LDKE3
        str     r1, [sp]
LDKE4:
        cmp     r10, r5
        mov     r6, r9, lsl #3
        movlt   r1, #0
        strlt   r1, [sp, #0xC]
        blt     LDKE5
        mov     r1, #1, 2
        str     r1, [sp, #0xC]
        sub     r4, r10, r5
LDKE5:
        mov     r1, r5, asr #16
        mov     r2, #0xFE, 18
        mov     r1, r1, lsl #16
        orr     r0, r2, #0x7F, 10
        mov     r1, r1, asr #16
        str     r1, [sp, #0x28]
        ldr     r1, [sp, #0x28]
        bl      __intel_idiv
        ldr     r12, [sp, #0x28]
        mvn     r1, #0
        mov     r2, r0, lsl #16
        add     r1, r1, #2, 18
        and     r5, r1, r5, asr #1
        mov     r0, r2, asr #16
        mul     r3, r5, r0
        ldr     r5, [sp, #0x18]
        mov     r2, r0, lsl #1
        mul     r2, r12, r2
        mvn     r12, #2, 2
        bic     lr, r3, r1
        mov     r3, r4, asr #17
        mov     lr, lr, asr #14
        rsb     lr, lr, #0
        sub     lr, lr, r2
        add     r2, lr, r12
        mov     r3, r3, lsl #16
        and     r12, r1, r2, asr #1
        mul     r12, r12, r0
        mov     r2, r2, asr #16
        and     r4, r1, r4, asr #2
        mov     lr, r2, lsl #16
        ldr     r2, [sp]
        mov     r12, r12, asr #15
        mov     lr, lr, asr #16
        mla     r12, lr, r0, r12
        mov     r3, r3, asr #16
        sub     r2, r2, r5
        and     r1, r12, r1
        mul     r1, r3, r1
        mov     lr, r12, asr #15
        mov     lr, lr, lsl #16
        mov     r0, lr, asr #16
        mul     r4, r4, r0
        mov     r1, r1, asr #15
        mla     r1, r3, r0, r1
        add     r4, r1, r4, asr #15
        ldr     r1, [sp, #0xC]
        add     r4, r1, r4, lsl #3
        str     r4, [r11, +r6]
        b       LDKE7
LDKE6:
        ldr     r1, [sp, #0x10]
        mov     r6, r9, lsl #3
        str     r1, [r7]
        ldr     r2, [sp, #0x14]
LDKE7:
        sub     r2, r2, #0xA
        rsb     r1, r2, #0x3D
        ldr     r2, [sp, #8]
        add     r9, r9, #1
        add     r6, r11, r6
        cmp     r2, r9
        str     r1, [r6, #4]
        add     r7, r7, #8
        bgt     LDKE2
        ldr     r4, [sp, #8]
        ldr     r6, [sp, #0x1C]
        ldr     r5, [sp, #0x20]
        ldr     r10, [sp, #0x24]
LDKE8:
        ldr     r0, [r6, #8]
        sub     r10, r10, #4
        ldr     r1, [r6, #0x1C]
        ldr     r0, [r10, +r0, lsl #2]
        mov     r3, #0xA
        mov     r2, r4
        bl      _ippsMagSquared_32sc32s_Sfs
        cmp     r4, #0
        mvn     r9, #2, 2
        mvn     r8, #0
        ble     LDKE11
        mov     lr, #0
        mov     r12, lr
        mov     r1, r12
LDKE9:
        ldr     r0, [r6, #0x1C]
        ldr     r7, [r6, #0x18]
        ldr     r0, [r0, +r12, lsl #2]
        ldr     r11, [r7, +r12, lsl #2]
        mov     r10, r0, asr #31
        subs    r0, r11, r0
        rsc     r10, r10, r11, asr #31
        subs    r11, r0, r9
        sbcs    r2, r10, #0
        movlt   r11, #0
        movlt   r2, #0
        orrs    r2, r11, r2
        movne   r0, r9
        bne     LDKE10
        cmp     r0, #2, 2
        sbcs    r10, r10, r8
        movlt   r0, #2, 2
LDKE10:
        str     r0, [r7, +lr, lsl #2]
        ldr     r7, [r6, #0x18]
        ldr     r0, [r7, +lr, lsl #2]
        cmp     r0, #0
        strlt   r1, [r7, +lr, lsl #2]
        add     r12, r12, #1
        cmp     r12, r4
        add     lr, lr, #1
        blt     LDKE9
LDKE11:
        cmp     r5, #0
        beq     LDKE17
        mov     r0, #1
        cmp     r4, #0
        str     r0, [r6, #0x58]
        mov     r7, #0
        movle   r1, #0
        movle   r0, r1
        ble     LDKE15
        cmp     r4, #5
        blt     LDKE18
        mov     r1, #0
        mov     r0, r1
        sub     r10, r4, #5
        mov     lr, r0
        sub     r12, r5, #4
        str     r10, [sp, #0x14]
        str     r8, [sp, #0x18]
        str     r9, [sp, #0x24]
        str     r4, [sp, #8]
        str     r6, [sp, #0x1C]
        str     r5, [sp, #0x20]
LDKE12:
        ldr     r2, [r12, #8]
        ldr     r3, [r12, #4]
        ldr     r4, [r12, #0xC]
        smull   r11, r2, r2, r2
        ldr     r5, [r12, #0x14]
        smull   r10, r6, r3, r3
        smull   r4, r8, r4, r4
        ldr     r3, [r12, #0x10]
        ldr     r9, [r12, #0x18]
        add     lr, lr, #4
        smull   r3, r7, r3, r3
        adds    r11, r10, r11
        smull   r5, r10, r5, r5
        adc     r2, r6, r2
        adds    r11, r11, #2, 24
        adc     r2, r2, #0
        str     r5, [sp, #0x28]
        smull   r5, r9, r9, r9
        mov     r6, r2, lsl #22
        orr     r6, r6, r11, lsr #10
        adds    r1, r6, r1
        adc     r2, r0, r2, asr #10
        adds    r3, r4, r3
        adc     r7, r8, r7
        adds    r3, r3, #2, 24
        adc     r0, r7, #0
        str     r10, [sp, #0x10]
        str     r9, [sp, #0xC]
        ldr     r9, [r12, #0x1C]
        ldr     r10, [r12, #0x20]!
        mov     r4, r0, lsl #22
        smull   r11, r9, r9, r9
        orr     r3, r4, r3, lsr #10
        adds    r1, r3, r1
        adc     r2, r2, r0, asr #10
        ldr     r0, [sp, #0x28]
        ldr     r3, [sp, #0xC]
        str     r11, [sp, #4]
        smull   r10, r11, r10, r10
        adds    r5, r0, r5
        ldr     r0, [sp, #0x10]
        adc     r0, r0, r3
        adds    r3, r5, #2, 24
        adc     r0, r0, #0
        mov     r4, r0, lsl #22
        orr     r3, r4, r3, lsr #10
        adds    r1, r3, r1
        adc     r2, r2, r0, asr #10
        ldr     r0, [sp, #4]
        adds    r10, r0, r10
        adc     r11, r9, r11
        adds    r3, r10, #2, 24
        adc     r0, r11, #0
        mov     r4, r0, lsl #22
        orr     r3, r4, r3, lsr #10
        adds    r1, r3, r1
        adc     r0, r2, r0, asr #10
        ldr     r2, [sp, #0x14]
        cmp     lr, r2
        ble     LDKE12
        ldr     r8, [sp, #0x18]
        ldr     r9, [sp, #0x24]
        ldr     r4, [sp, #8]
        ldr     r6, [sp, #0x1C]
        ldr     r5, [sp, #0x20]
        mov     r7, #0
LDKE13:
        mov     r12, lr, lsl #3
        add     r12, r12, #4
        add     r5, r12, r5
LDKE14:
        ldr     r3, [r5]
        ldr     r10, [r5, #-4]
        add     r5, r5, #8
        smull   r12, r3, r3, r3
        add     lr, lr, #1
        smull   r11, r10, r10, r10
        adds    r12, r11, r12
        adc     r3, r10, r3
        adds    r12, r12, #2, 24
        adc     r3, r3, #0
        mov     r10, r3, lsl #22
        orr     r12, r10, r12, lsr #10
        adds    r1, r12, r1
        adc     r0, r0, r3, asr #10
        cmp     lr, r4
        blt     LDKE14
LDKE15:
        ldr     lr, [r6, #0x2C]
        ldr     r3, [r6, #0x28]
        mov     r2, lr, asr #31
        rsbs    r12, lr, #0
        rsc     r2, r2, #0
        smull   r3, lr, r3, lr
        adds    r4, r12, #1, 18
        umull   r12, r5, r4, r1
        mla     r0, r4, r0, r5
        adc     r2, r2, #0
        adds    r3, r3, #2, 20
        adc     lr, lr, #0
        adds    r3, r12, r3
        mla     r0, r2, r1, r0
        adc     lr, r0, lr
        mov     r0, lr, lsl #18
        orr     r0, r0, r3, lsr #14
        subs    r1, r0, r9
        rscs    r7, r7, lr, asr #14
        movlt   r1, #0
        movlt   r7, #0
        orrs    r7, r1, r7
        movne   r0, r9
        bne     LDKE16
        cmp     r0, #2, 2
        rscs    lr, r8, lr, asr #14
        movlt   r0, #2, 2
LDKE16:
        str     r0, [r6, #0x28]
LDKE17:
        mov     r0, #0
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LDKE18:
        mov     r1, #0
        mov     r0, r1
        mov     lr, r0
        b       LDKE13
LDKE19:
        mvn     r0, #7
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}


