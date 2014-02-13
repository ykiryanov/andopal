        .text
        .align  4
        .globl  ownps_Div_16u_ISfs


ownps_Div_16u_ISfs:
        stmdb   sp!, {r4 - r11, lr}
        mov     r12, #0xFF
        orr     r11, r12, #0xFF, 24
        cmp     r3, #0
        mov     r6, r0
        mov     r5, r1
        mov     r10, r2
        mov     r9, #0
        mov     r12, #1
        bne     LCZU3
        cmp     r10, #0
        ble     LCZU7
        mov     r4, #0
        mov     r8, r4
        mov     r7, r8
LCZU0:
        ldrh    r1, [r6], #2
        ldrh    r3, [r5]
        cmp     r1, #0
        bne     LCZU1
        cmp     r3, #0
        moveq   r3, #0
        movne   r3, r11
        strh    r3, [r5]
        mov     r4, #1
        b       LCZU2
LCZU1:
        cmp     r3, #0
        streqh  r7, [r5]
        beq     LCZU2
        mov     r0, r3, lsl #16
        bl      __intel_uidiv
        and     r12, r0, #1, 16
        sub     r3, r11, #2, 18
        mov     r12, r12, lsr #16
        add     r12, r3, r12, lsl #1
        add     r12, r0, r12
        mov     r3, r12, lsr #16
        strh    r3, [r5]
LCZU2:
        add     r8, r8, #1
        cmp     r8, r10
        add     r5, r5, #2
        blt     LCZU0
        mov     r0, r4
        ldmia   sp!, {r4 - r11, pc}
LCZU3:
        cmp     r3, #0
        ble     LCZU9
        cmp     r10, #0
        mov     r7, r12, lsl r3
        ble     LCZU8
        mov     r4, #0
        mov     r9, r4
        mov     r8, r9
LCZU4:
        ldrh    r12, [r6], #2
        ldrh    r3, [r5]
        muls    r1, r7, r12
        bne     LCZU5
        cmp     r3, #0
        moveq   r3, #0
        movne   r3, r11
        strh    r3, [r5]
        mov     r4, #1
        b       LCZU6
LCZU5:
        cmp     r3, #0
        streqh  r8, [r5]
        beq     LCZU6
        mov     r0, r3, lsl #16
        bl      __intel_uidiv
        and     r12, r0, #1, 16
        sub     r3, r11, #2, 18
        mov     r12, r12, lsr #16
        add     r12, r3, r12, lsl #1
        add     r12, r0, r12
        mov     r3, r12, lsr #16
        strh    r3, [r5]
LCZU6:
        add     r9, r9, #1
        cmp     r9, r10
        add     r5, r5, #2
        blt     LCZU4
        mov     r0, r4
        ldmia   sp!, {r4 - r11, pc}
LCZU7:
        mov     r4, #0
        mov     r0, r4
        ldmia   sp!, {r4 - r11, pc}
LCZU8:
        mov     r4, #0
        mov     r0, r4
        ldmia   sp!, {r4 - r11, pc}
LCZU9:
        rsb     r2, r3, #0
        mov     r0, #1
        mov     r3, r2, asr #31
        mov     r1, #0
        bl      __ashldi3
        cmp     r10, #0
        mov     r7, r1
        ble     LCZU13
        mov     r4, #0
        mov     r8, r4
        mov     r9, r0
LCZU10:
        ldrh    r12, [r5]
        ldrh    r2, [r6], #2
        umull   r3, lr, r9, r12
        mla     r12, r7, r12, lr
        cmp     r2, #0
        bne     LCZU11
        orrs    r12, r3, r12
        moveq   r3, #0
        movne   r3, r11
        strh    r3, [r5]
        mov     r4, #1
        b       LCZU12
LCZU11:
        orrs    lr, r3, r12
        moveq   r3, #0
        streqh  r3, [r5]
        beq     LCZU12
        mov     lr, r3, lsr #16
        mov     r0, r3, lsl #16
        orr     r1, lr, r12, lsl #16
        mov     r3, #0
        bl      __udivdi3
        and     r3, r0, #1, 16
        mov     r3, r3, lsr #16
        adds    lr, r3, r3
        mov     r3, #0
        adc     r12, r3, #0
        mov     r3, #0xFF
        orr     r3, r3, #0xFF, 24
        sub     r2, r3, #2, 18
        adds    lr, lr, r2
        adc     r12, r12, #0
        adds    r0, r0, lr
        adc     r1, r1, r12
        mov     r12, r1, lsr #16
        mov     lr, r1, lsl #16
        cmp     r12, #0
        orr     r0, lr, r0, lsr #16
        cmpeq   r0, r11
        bicls   r0, r0, #0xFF, 8
        bicls   r3, r0, #0xFF, 16
        strh    r3, [r5]
LCZU12:
        add     r8, r8, #1
        cmp     r8, r10
        add     r5, r5, #2
        blt     LCZU10
        mov     r0, r4
        ldmia   sp!, {r4 - r11, pc}
LCZU13:
        mov     r4, #0
        mov     r0, r4
        ldmia   sp!, {r4 - r11, pc}


