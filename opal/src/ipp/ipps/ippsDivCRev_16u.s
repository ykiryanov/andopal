        .text
        .align  4
        .globl  _ippsDivCRev_16u


_ippsDivCRev_16u:
        stmdb   sp!, {r4 - r11, lr}
        mov     r8, r0
        cmp     r8, #0
        mov     r4, r2
        mov     r5, r3
        beq     LCIH7
        cmp     r4, #0
        beq     LCIH7
        cmp     r5, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r11, pc}
        cmp     r1, #0
        mov     r11, #0
        beq     LCIH2
        cmp     r5, #0
        mov     r6, r1, lsl #16
        ble     LCIH5
        mov     r12, #0xFF
        orr     r9, r12, #0x7F, 24
        mov     r7, r11
        orr     r10, r9, #2, 18
LCIH0:
        ldrh    r1, [r8], #2
        cmp     r1, #0
        streqh  r10, [r4]
        moveq   r7, #6
        beq     LCIH1
        mov     r0, r6
        bl      __intel_uidiv
        and     r12, r0, #1, 16
        mov     r12, r12, lsr #16
        add     r12, r9, r12, lsl #1
        add     r12, r0, r12
        mov     r12, r12, lsr #16
        strh    r12, [r4]
LCIH1:
        add     r11, r11, #1
        cmp     r11, r5
        add     r4, r4, #2
        blt     LCIH0
        mov     r0, r7
        ldmia   sp!, {r4 - r11, pc}
LCIH2:
        cmp     r5, #0
        movle   r7, r11
        ble     LCIH4
        mov     r12, r5
LCIH3:
        ldrh    lr, [r8], #2
        cmp     lr, #0
        beq     LCIH6
        subs    r12, r12, #1
        bne     LCIH3
        mov     r7, r11
LCIH4:
        mov     r1, r5
        mov     r0, r4
        bl      _ippsZero_16s
        mov     r0, r7
        ldmia   sp!, {r4 - r11, pc}
LCIH5:
        mov     r7, r11
        mov     r0, r7
        ldmia   sp!, {r4 - r11, pc}
LCIH6:
        mov     r7, #6
        b       LCIH4
LCIH7:
        mvn     r0, #7
        ldmia   sp!, {r4 - r11, pc}


