        .text
        .align  4
        .globl  ownps_DivC_16u_ISfs


ownps_DivC_16u_ISfs:
        stmdb   sp!, {r0, r4 - r11, lr}
        mov     r12, #0xFF
        cmp     r3, #0
        orr     r9, r12, #0x7F, 24
        mov     r4, r0
        mov     r7, r1
        mov     r8, r2
        mov     r11, #0
        bne     LCZW2
        cmp     r8, #0
        ble     LCZW5
LCZW0:
        ldrh    r3, [r7]
        cmp     r3, #0
        beq     LCZW1
        mov     r0, r3, lsl #16
        mov     r1, r4
        bl      __intel_uidiv
        and     r3, r0, #1, 16
        mov     r3, r3, lsr #16
        add     r3, r9, r3, lsl #1
        add     r3, r0, r3
        mov     r3, r3, lsr #16
        strh    r3, [r7]
LCZW1:
        add     r11, r11, #1
        cmp     r11, r8
        add     r7, r7, #2
        blt     LCZW0
        ldmia   sp!, {r0, r4 - r11, pc}
LCZW2:
        cmp     r3, #0
        ble     LCZW6
        mov     r12, #1
        mov     r3, r12, lsl r3
        mul     r4, r4, r3
        cmp     r8, #0
        ble     LCZW5
LCZW3:
        ldrh    r0, [r7]
        cmp     r0, #0
        beq     LCZW4
        mov     r0, r0, lsl #16
        mov     r1, r4
        bl      __intel_uidiv
        and     r3, r0, #1, 16
        mov     r3, r3, lsr #16
        add     r3, r9, r3, lsl #1
        add     r3, r0, r3
        mov     r0, r3, lsr #16
        strh    r0, [r7]
LCZW4:
        add     r11, r11, #1
        cmp     r11, r8
        add     r7, r7, #2
        blt     LCZW3
LCZW5:
        ldmia   sp!, {r0, r4 - r11, pc}
LCZW6:
        rsb     r2, r3, #0
        mov     r0, #1
        mov     r3, r2, asr #31
        mov     r1, #0
        bl      __ashldi3
        cmp     r8, #0
        mov     r6, r0
        mov     r5, r1
        ble     LCZW5
        mov     r10, r11
        add     r3, r9, #2, 18
        str     r3, [sp]
LCZW7:
        ldrh    r12, [r7]
        umull   r3, lr, r6, r12
        mla     r12, r5, r12, lr
        orrs    lr, r3, r12
        beq     LCZW8
        mov     lr, r3, lsr #16
        mov     r0, r3, lsl #16
        orr     r1, lr, r12, lsl #16
        mov     r2, r4
        mov     r3, #0
        bl      __udivdi3
        and     r3, r0, #1, 16
        mov     r3, r3, lsr #16
        adds    r3, r3, r3
        adc     r12, r11, #0
        adds    r3, r3, r9
        adc     r12, r12, #0
        adds    r0, r0, r3
        adc     r12, r1, r12
        mov     r3, r12, lsr #16
        cmp     r3, #0
        ldreq   r3, [sp]
        mov     r12, r12, lsl #16
        orr     r0, r12, r0, lsr #16
        cmpeq   r0, r3
        bicls   r0, r0, #0xFF, 8
        bicls   r0, r0, #0xFF, 16
        addhi   r0, r9, #2, 18
        strh    r0, [r7]
LCZW8:
        add     r10, r10, #1
        cmp     r10, r8
        add     r7, r7, #2
        blt     LCZW7
        ldmia   sp!, {r0, r4 - r11, pc}


