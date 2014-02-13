        .text
        .align  4
        .globl  _ippsMulC_16u_ISfs


_ippsMulC_16u_ISfs:
        stmdb   sp!, {r4 - r11, lr}
        mov     r7, r0
        cmp     r7, #0
        mov     r6, r1
        mov     r5, r2
        mov     r4, r3
        beq     LDAK4
        cmp     r4, #0x20
        bgt     LDAK4
        cmp     r6, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r11, pc}
        cmp     r5, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r11, pc}
        cmp     r4, #0
        bne     LDAK0
        cmp     r7, #1
        beq     LDAK3
        b       LDAK2
LDAK0:
        cmp     r4, #0x10
        ble     LDAK2
        sub     r2, r4, #1
        mov     r0, #1
        mov     r3, r2, asr #31
        mov     r1, #0
        bl      __ashldi3
        mvn     r12, #0
        adds    r11, r0, r12
        adc     r10, r1, r12
        cmp     r5, #0
        ble     LDAK3
        add     r9, r12, #1, 16
        mov     r8, r4, asr #31
LDAK1:
        ldrh    r12, [r6]
        mov     r3, r8
        mov     r2, r4
        mul     r0, r7, r12
        adds    r12, r11, r0
        adc     lr, r10, #0
        mov     r0, r0, lsr r4
        and     r0, r0, #1
        adds    r0, r12, r0
        adc     r1, lr, #0
        bl      __lshrdi3
        cmp     r0, r9
        mov     r12, r9
        movcc   r12, r0
        strh    r12, [r6], #2
        subs    r5, r5, #1
        bne     LDAK1
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LDAK2:
        mov     r3, r4
        mov     r2, r5
        mov     r1, r6
        mov     r0, r7
        bl      ownps_MulC_16u_ISfs
LDAK3:
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LDAK4:
        mov     r0, r6
        mov     r1, r5
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsZero_16s


