        .text
        .align  4
        .globl  ownps_Div_16u_Sfs


ownps_Div_16u_Sfs:
        stmdb   sp!, {r1, r4 - r11, lr}
        ldr     r12, [sp, #0x28]
        mov     lr, #0xFF
        orr     r9, lr, #0xFF, 24
        cmp     r12, #0
        mov     r7, r0
        mov     r6, r1
        mov     r5, r2
        mov     r11, r3
        mov     r10, #0
        mov     lr, #1
        bne     LCZT3
        cmp     r11, #0
        ble     LCZT7
        mov     r4, #0
        mov     r10, r4
        mov     r8, r10
LCZT0:
        ldrh    r1, [r7], #2
        ldrh    r12, [r6], #2
        cmp     r1, #0
        bne     LCZT1
        cmp     r12, #0
        moveq   r12, #0
        movne   r12, r9
        strh    r12, [r5]
        mov     r4, #1
        b       LCZT2
LCZT1:
        cmp     r12, #0
        streqh  r8, [r5]
        beq     LCZT2
        mov     r0, r12, lsl #16
        bl      __intel_uidiv
        and     lr, r0, #1, 16
        sub     r12, r9, #2, 18
        mov     lr, lr, lsr #16
        add     lr, r12, lr, lsl #1
        add     lr, r0, lr
        mov     r12, lr, lsr #16
        strh    r12, [r5]
LCZT2:
        add     r10, r10, #1
        cmp     r10, r11
        add     r5, r5, #2
        blt     LCZT0
        mov     r0, r4
        ldmia   sp!, {r1, r4 - r11, pc}
LCZT3:
        cmp     r12, #0
        ble     LCZT9
        cmp     r11, #0
        mov     r8, lr, lsl r12
        ble     LCZT8
        mov     r4, #0
        mov     r10, r4
        mov     r12, r10
LCZT4:
        ldrh    lr, [r7], #2
        ldrh    r12, [r6], #2
        muls    r1, r8, lr
        bne     LCZT5
        cmp     r12, #0
        moveq   r12, #0
        movne   r12, r9
        strh    r12, [r5]
        mov     r4, #1
        b       LCZT6
LCZT5:
        cmp     r12, #0
        moveq   r12, #0
        streqh  r12, [r5]
        beq     LCZT6
        mov     r0, r12, lsl #16
        bl      __intel_uidiv
        and     r12, r0, #1, 16
        sub     lr, r9, #2, 18
        mov     r12, r12, lsr #16
        add     r12, lr, r12, lsl #1
        add     r12, r0, r12
        mov     r12, r12, lsr #16
        strh    r12, [r5]
LCZT6:
        add     r10, r10, #1
        cmp     r10, r11
        add     r5, r5, #2
        blt     LCZT4
        mov     r0, r4
        ldmia   sp!, {r1, r4 - r11, pc}
LCZT7:
        mov     r4, #0
        mov     r0, r4
        ldmia   sp!, {r1, r4 - r11, pc}
LCZT8:
        mov     r4, #0
        mov     r0, r4
        ldmia   sp!, {r1, r4 - r11, pc}
LCZT9:
        rsb     r2, r12, #0
        mov     r0, #1
        mov     r3, r2, asr #31
        mov     r1, #0
        bl      __ashldi3
        cmp     r11, #0
        ble     LCZT13
        mov     r4, #0
        str     r9, [sp]
        mov     r8, r4
        mov     r10, r0
        mov     r9, r1
LCZT10:
        ldrh    r12, [r6], #2
        ldrh    r2, [r7], #2
        umull   lr, r0, r10, r12
        mla     r12, r9, r12, r0
        cmp     r2, #0
        bne     LCZT11
        orrs    r12, lr, r12
        moveq   r12, #0
        movne   r12, #0xFF
        orrne   r12, r12, #0xFF, 24
        strh    r12, [r5]
        mov     r4, #1
        b       LCZT12
LCZT11:
        orrs    r0, lr, r12
        moveq   r12, #0
        streqh  r12, [r5]
        beq     LCZT12
        mov     r1, lr, lsr #16
        mov     r0, lr, lsl #16
        orr     r1, r1, r12, lsl #16
        mov     r3, #0
        bl      __udivdi3
        and     r12, r0, #1, 16
        mov     r12, r12, lsr #16
        adds    r2, r12, r12
        mov     r12, #0
        adc     lr, r12, #0
        mov     r12, #0xFF
        orr     r12, r12, #0xFF, 24
        sub     r3, r12, #2, 18
        adds    r2, r2, r3
        adc     lr, lr, #0
        adds    r0, r0, r2
        adc     r1, r1, lr
        mov     lr, r1, lsr #16
        cmp     lr, #0
        ldreq   lr, [sp]
        mov     r1, r1, lsl #16
        orr     r0, r1, r0, lsr #16
        cmpeq   r0, lr
        bicls   r0, r0, #0xFF, 8
        bicls   r12, r0, #0xFF, 16
        strh    r12, [r5]
LCZT12:
        add     r8, r8, #1
        cmp     r8, r11
        add     r5, r5, #2
        blt     LCZT10
        mov     r0, r4
        ldmia   sp!, {r1, r4 - r11, pc}
LCZT13:
        mov     r4, #0
        mov     r0, r4
        ldmia   sp!, {r1, r4 - r11, pc}


