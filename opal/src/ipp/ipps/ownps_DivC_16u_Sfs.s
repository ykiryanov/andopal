        .text
        .align  4
        .globl  ownps_DivC_16u_Sfs


ownps_DivC_16u_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        ldr     r12, [sp, #0x24]
        mov     lr, #0xFF
        orr     r9, lr, #0x7F, 24
        cmp     r12, #0
        mov     r7, r0
        mov     r4, r1
        mov     r8, r2
        mov     r5, r3
        mov     r10, #0
        bne     LCZV2
        cmp     r5, #0
        ble     LCZV5
        mov     r6, #0
LCZV0:
        ldrh    r12, [r7], #2
        cmp     r12, #0
        moveq   r12, #0
        beq     LCZV1
        mov     r0, r12, lsl #16
        mov     r1, r4
        bl      __intel_uidiv
        and     r12, r0, #1, 16
        mov     r12, r12, lsr #16
        add     r12, r9, r12, lsl #1
        add     r12, r0, r12
        mov     r12, r12, lsr #16
LCZV1:
        add     r6, r6, #1
        strh    r12, [r8], #2
        cmp     r6, r5
        blt     LCZV0
        ldmia   sp!, {r4 - r11, pc}
LCZV2:
        cmp     r12, #0
        ble     LCZV6
        mov     lr, #1
        mov     r12, lr, lsl r12
        mul     r4, r4, r12
        cmp     r5, #0
        ble     LCZV5
        mov     r6, #0
LCZV3:
        ldrh    r12, [r7], #2
        cmp     r12, #0
        moveq   r12, #0
        beq     LCZV4
        mov     r0, r12, lsl #16
        mov     r1, r4
        bl      __intel_uidiv
        and     r12, r0, #1, 16
        mov     r12, r12, lsr #16
        add     r12, r9, r12, lsl #1
        add     r12, r0, r12
        mov     r12, r12, lsr #16
LCZV4:
        add     r6, r6, #1
        strh    r12, [r8], #2
        cmp     r6, r5
        blt     LCZV3
LCZV5:
        ldmia   sp!, {r4 - r11, pc}
LCZV6:
        rsb     r2, r12, #0
        mov     r0, #1
        mov     r3, r2, asr #31
        mov     r1, #0
        bl      __ashldi3
        cmp     r5, #0
        mov     r6, r1
        ble     LCZV5
        mov     r10, r5
        add     r9, r9, #2, 18
        mov     r11, #0
        mov     r5, r0
LCZV7:
        ldrh    lr, [r7], #2
        umull   r12, r0, r5, lr
        mla     lr, r6, lr, r0
        orrs    r0, r12, lr
        moveq   r12, #0
        streqh  r12, [r8]
        beq     LCZV8
        mov     r0, r12, lsr #16
        orr     r1, r0, lr, lsl #16
        mov     r0, r12, lsl #16
        mov     r2, r4
        mov     r3, #0
        bl      __udivdi3
        and     r12, r0, #1, 16
        mov     r12, r12, lsr #16
        adds    r2, r12, r12
        mov     r12, #0
        adc     lr, r12, #0
        mov     r12, #0xFF
        orr     r12, r12, #0x7F, 24
        adds    r2, r2, r12
        adc     lr, lr, #0
        adds    r0, r0, r2
        adc     r1, r1, lr
        mov     lr, r1, lsr #16
        mov     r1, r1, lsl #16
        cmp     lr, #0
        orr     r0, r1, r0, lsr #16
        cmpeq   r0, r9
        bicls   r0, r0, #0xFF, 8
        bicls   r12, r0, #0xFF, 16
        addhi   r12, r12, #2, 18
        strh    r12, [r8]
LCZV8:
        add     r11, r11, #1
        cmp     r11, r10
        add     r8, r8, #2
        blt     LCZV7
        ldmia   sp!, {r4 - r11, pc}


