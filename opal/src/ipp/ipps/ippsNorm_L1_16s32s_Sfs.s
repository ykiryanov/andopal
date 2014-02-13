        .text
        .align  4
        .globl  _ippsNorm_L1_16s32s_Sfs


_ippsNorm_L1_16s32s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        mov     r4, r2
        cmp     r0, #0
        mov     r7, r1
        mov     r2, r3
        beq     LBCE20
        cmp     r4, #0
        beq     LBCE20
        cmp     r7, #0
        ble     LBCE21
        cmp     r7, #1, 16
        mov     r6, #0
        ble     LBCE10
        mov     r8, r7, asr #16
        cmp     r8, #0
        movle   r3, #0
        movle   r1, r3
        ble     LBCE2
        mov     r3, #0
        mov     r1, r3
LBCE0:
        mov     lr, #0
        mov     r5, lr
        mov     r6, #1, 16
LBCE1:
        ldrsh   r12, [r0, +r5]
        cmp     r12, #0
        rsblt   r12, r12, #0
        subs    r6, r6, #1
        add     lr, lr, r12
        add     r5, r5, #2
        bne     LBCE1
        adds    r3, r3, lr
        adc     r1, r1, #0
        subs    r8, r8, #1
        add     r0, r0, #2, 16
        bne     LBCE0
LBCE2:
        bic     r7, r7, #0xFF, 8
        bics    r10, r7, #0xFF, 16
        beq     LBCE7
        cmp     r10, #0
        movle   r12, #0
        ble     LBCE6
        cmp     r10, #6
        movlt   r12, #0
        movlt   lr, r12
        blt     LBCE4
        mov     r12, #0
        mov     lr, r12
        sub     r11, r10, #6
        mov     r9, lr
        mov     r8, #2
        mov     r7, #4
        mov     r6, #6
        mov     r5, #8
        str     r1, [sp, #8]
        str     r3, [sp, #0xC]
        str     r11, [sp, #4]
        str     r10, [sp, #0x10]
        str     r2, [sp, #0x14]
        str     r4, [sp, #0x18]
        str     r0, [sp]
LBCE3:
        ldr     r0, [sp]
        add     lr, lr, #5
        ldrsh   r2, [r0, +r9]
        ldrsh   r3, [r0, +r8]
        ldrsh   r10, [r0, +r7]
        ldrsh   r11, [r0, +r6]
        ldrsh   r0, [r0, +r5]
        eor     r1, r2, r2, asr #31
        eor     r4, r3, r3, asr #31
        sub     r1, r1, r2, asr #31
        str     r4, [sp, #0x1C]
        add     r12, r1, r12
        ldr     r1, [sp, #0x1C]
        eor     r4, r10, r10, asr #31
        eor     r2, r11, r11, asr #31
        sub     r1, r1, r3, asr #31
        add     r12, r1, r12
        eor     r1, r0, r0, asr #31
        sub     r4, r4, r10, asr #31
        add     r12, r4, r12
        sub     r1, r1, r0, asr #31
        ldr     r0, [sp, #4]
        sub     r2, r2, r11, asr #31
        add     r12, r2, r12
        add     r12, r1, r12
        cmp     lr, r0
        add     r9, r9, #0xA
        add     r8, r8, #0xA
        add     r7, r7, #0xA
        add     r6, r6, #0xA
        add     r5, r5, #0xA
        ble     LBCE3
        ldr     r1, [sp, #8]
        ldr     r3, [sp, #0xC]
        ldr     r10, [sp, #0x10]
        ldr     r2, [sp, #0x14]
        ldr     r4, [sp, #0x18]
        ldr     r0, [sp]
LBCE4:
        mov     r5, lr, lsl #1
LBCE5:
        ldrsh   r6, [r0, +r5]
        add     r5, r5, #2
        add     lr, lr, #1
        eor     r7, r6, r6, asr #31
        cmp     lr, r10
        sub     r7, r7, r6, asr #31
        add     r12, r7, r12
        blt     LBCE5
LBCE6:
        adds    r3, r3, r12
        adc     r1, r1, #0
LBCE7:
        cmp     r2, #0
        bne     LBCE8
        str     r3, [r4]
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBCE8:
        cmp     r2, #0
        mvn     r5, #2, 2
        ble     LBCE17
        cmp     r2, #0x3F
        ble     LBCE9
        mov     r0, #0
        str     r0, [r4]
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBCE9:
        mov     r0, r3
        mov     r3, r2, asr #31
        bl      __lshrdi3
        cmp     r1, #0
        cmpeq   r0, r5
        movhi   r0, r5
        str     r0, [r4]
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBCE10:
        cmp     r7, #6
        movlt   r3, #0
        movlt   r12, r3
        blt     LBCE12
        mov     r3, #0
        mov     r12, r3
        sub     r5, r7, #6
        mov     lr, r0
        str     r7, [sp, #0x10]
        str     r0, [sp]
LBCE11:
        ldrsh   r11, [lr]
        ldrsh   r7, [lr, #2]
        ldrsh   r1, [lr, #4]
        ldrsh   r8, [lr, #6]
        ldrsh   r9, [lr, #8]
        eor     r10, r11, r11, asr #31
        add     r12, r12, #5
        cmp     r12, r5
        sub     r10, r10, r11, asr #31
        add     r3, r10, r3
        eor     r11, r7, r7, asr #31
        eor     r0, r1, r1, asr #31
        add     lr, lr, #0xA
        sub     r11, r11, r7, asr #31
        add     r3, r11, r3
        sub     r0, r0, r1, asr #31
        add     r3, r0, r3
        eor     r10, r8, r8, asr #31
        eor     r0, r9, r9, asr #31
        sub     r10, r10, r8, asr #31
        add     r3, r10, r3
        sub     r0, r0, r9, asr #31
        add     r3, r0, r3
        ble     LBCE11
        ldr     r7, [sp, #0x10]
        ldr     r0, [sp]
LBCE12:
        add     r0, r0, r12, lsl #1
LBCE13:
        ldrsh   lr, [r0], #2
        add     r12, r12, #1
        eor     r5, lr, lr, asr #31
        cmp     r12, r7
        sub     r5, r5, lr, asr #31
        add     r3, r5, r3
        blt     LBCE13
        cmp     r2, #0
        bne     LBCE14
        str     r3, [r4]
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBCE14:
        cmp     r2, #0
        ble     LBCE16
        cmp     r2, #0x1F
        ble     LBCE15
        str     r6, [r4]
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBCE15:
        mov     r2, r3, lsr r2
        str     r2, [r4]
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBCE16:
        cmn     r2, #0x1F
        mvn     r1, #0x1E
        movlt   r2, r1
        rsb     r2, r2, #0
        mov     r0, r3
        mov     r3, r2, asr #31
        mov     r1, #0
        bl      __ashldi3
        cmp     r1, #0
        mvn     r1, #2, 2
        cmpeq   r0, r1
        movhi   r0, r1
        str     r0, [r4]
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBCE17:
        orrs    r12, r3, r1
        bne     LBCE18
        mov     r0, #0
        str     r0, [r4]
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBCE18:
        subs    r12, r3, r5
        sbcs    lr, r1, #0
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        beq     LBCE19
        str     r5, [r4]
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBCE19:
        cmn     r2, #0x20
        mvn     r12, #0x1F
        movlt   r2, r12
        rsb     r2, r2, #0
        mov     r0, r3
        mov     r3, r2, asr #31
        bl      __ashldi3
        cmp     r1, #0
        cmpeq   r0, r5
        movhi   r0, r5
        str     r0, [r4]
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBCE20:
        mvn     r0, #7
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBCE21:
        mvn     r0, #5
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}


