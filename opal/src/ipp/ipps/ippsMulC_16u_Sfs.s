        .text
        .align  4
        .globl  _ippsMulC_16u_Sfs


_ippsMulC_16u_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        ldr     r8, [sp, #0x30]
        mov     r6, r0
        mov     r7, r1
        cmp     r8, #0
        mov     r5, r2
        mov     r4, r3
        bne     LDAJ0
        cmp     r7, #1
        beq     LDAJ5
LDAJ0:
        cmp     r7, #0
        beq     LDAJ4
        cmp     r8, #0x20
        bgt     LDAJ4
        cmp     r6, #0
        beq     LDAJ7
        cmp     r5, #0
        beq     LDAJ7
        cmp     r4, #0
        ble     LDAJ6
        cmp     r8, #0x10
        ble     LDAJ2
        sub     r2, r8, #1
        mov     r0, #1
        mov     r3, r2, asr #31
        mov     r1, #0
        bl      __ashldi3
        mvn     r12, #0
        adds    r0, r0, r12
        adc     r10, r1, r12
        cmp     r4, #0
        ble     LDAJ3
        str     r7, [sp, #8]
        mov     r9, r8, asr #31
        mov     r7, r8
        add     r11, r12, #1, 16
        mov     r8, r0
LDAJ1:
        ldr     lr, [sp, #8]
        ldrh    r12, [r6], #2
        mov     r3, r9
        mov     r2, r7
        mul     lr, lr, r12
        adds    r1, r8, lr
        adc     r12, r10, #0
        mov     lr, lr, lsr r7
        and     lr, lr, #1
        adds    r0, r1, lr
        adc     r1, r12, #0
        bl      __lshrdi3
        cmp     r0, r11
        mov     r12, r11
        movcc   r12, r0
        strh    r12, [r5], #2
        subs    r4, r4, #1
        bne     LDAJ1
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LDAJ2:
        str     r8, [sp]
        mov     r3, r4
        mov     r2, r5
        mov     r1, r7
        mov     r0, r6
        bl      ownps_MulC_16u_Sfs
LDAJ3:
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LDAJ4:
        cmp     r6, #0
        beq     LDAJ7
        mov     r0, r5
        mov     r1, r4
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsZero_16s
LDAJ5:
        mov     r0, r6
        mov     r2, r4
        mov     r1, r5
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsCopy_16s
LDAJ6:
        mvn     r0, #5
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LDAJ7:
        mvn     r0, #7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}


