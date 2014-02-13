        .text
        .align  4
        .globl  _ippsMul_16u_Sfs


_ippsMul_16u_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x28
        ldr     r4, [sp, #0x4C]
        mov     r11, r0
        mov     r8, r1
        cmp     r4, #0x20
        mov     r6, r2
        mov     r7, r3
        ble     LDAH0
        cmp     r11, #0
        beq     LDAH5
        cmp     r8, #0
        beq     LDAH5
        mov     r0, r6
        mov     r1, r7
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsZero_16s
LDAH0:
        cmp     r11, #0
        beq     LDAH5
        cmp     r8, #0
        beq     LDAH5
        cmp     r6, #0
        beq     LDAH5
        cmp     r7, #0
        ble     LDAH6
        cmp     r4, #0x10
        ble     LDAH4
        sub     r2, r4, #1
        mov     r0, #1
        mov     r3, r2, asr #31
        mov     r1, #0
        bl      __ashldi3
        mvn     r12, #0
        adds    r0, r0, r12
        adc     r1, r1, r12
        cmp     r7, #4
        mov     r10, #0
        movlt   r5, r4, asr #31
        blt     LDAH2
        add     r2, r12, #1, 16
        sub     lr, r7, #4
        mov     r12, r8
        mov     r3, r11
        mov     r9, r6
        str     r10, [sp, #8]
        str     r7, [sp, #0x10]
        str     r6, [sp, #0x14]
        str     r8, [sp, #0x18]
        str     r11, [sp, #0x1C]
        mov     r5, r4, asr #31
        str     lr, [sp, #0xC]
        mov     r7, r0
        mov     r6, r1
        mov     r11, r2
        mov     r8, r3
        mov     r10, r12
LDAH1:
        ldrh    lr, [r10]
        ldrh    r0, [r8]
        ldr     r1, [sp, #8]
        mov     r2, r4
        mov     r3, r5
        mul     r0, r0, lr
        add     r1, r1, #3
        str     r1, [sp, #8]
        mov     lr, r0, lsr r4
        and     lr, lr, #1
        adds    r1, r7, r0
        adc     r0, r6, #0
        adds    lr, r1, lr
        adc     r1, r0, #0
        mov     r0, lr
        bl      __lshrdi3
        mov     lr, r11
        cmp     r0, r11
        movcc   lr, r0
        strh    lr, [r9]
        ldrh    lr, [r10, #2]
        ldrh    r0, [r8, #2]
        mov     r2, r4
        mov     r3, r5
        mul     r0, r0, lr
        adds    r12, r7, r0
        adc     lr, r6, #0
        mov     r0, r0, lsr r4
        and     r0, r0, #1
        adds    r0, r12, r0
        adc     r1, lr, #0
        bl      __lshrdi3
        cmp     r0, r11
        mov     lr, r11
        movcc   lr, r0
        strh    lr, [r9, #2]
        ldrh    r0, [r8, #4]
        ldrh    lr, [r10, #4]
        mov     r2, r4
        mov     r3, r5
        add     r10, r10, #6
        mul     r0, r0, lr
        add     r8, r8, #6
        adds    r12, r7, r0
        adc     lr, r6, #0
        mov     r0, r0, lsr r4
        and     r0, r0, #1
        adds    r0, r12, r0
        adc     r1, lr, #0
        bl      __lshrdi3
        cmp     r0, r11
        mov     lr, r11
        movcc   lr, r0
        strh    lr, [r9, #4]
        ldr     lr, [sp, #0xC]
        ldr     r0, [sp, #8]
        add     r9, r9, #6
        cmp     r0, lr
        ble     LDAH1
        mov     r1, r6
        mov     r0, r7
        ldr     r10, [sp, #8]
        ldr     r7, [sp, #0x10]
        ldr     r6, [sp, #0x14]
        ldr     r8, [sp, #0x18]
        ldr     r11, [sp, #0x1C]
LDAH2:
        mvn     r12, #0
        add     r9, r12, #1, 16
        add     r8, r8, r10, lsl #1
        add     r11, r11, r10, lsl #1
        add     r6, r6, r10, lsl #1
        str     r1, [sp, #0x20]
        str     r0, [sp, #0x24]
LDAH3:
        ldrh    r12, [r11], #2
        ldrh    r0, [r8], #2
        add     r10, r10, #1
        mul     r12, r12, r0
        ldr     r0, [sp, #0x24]
        mov     r2, r4
        mov     r3, r5
        adds    r0, r0, r12
        mov     r12, r12, lsr r4
        and     lr, r12, #1
        ldr     r12, [sp, #0x20]
        adc     r12, r12, #0
        adds    r0, r0, lr
        adc     r1, r12, #0
        bl      __lshrdi3
        cmp     r0, r9
        mov     r12, r9
        movcc   r12, r0
        strh    r12, [r6], #2
        cmp     r10, r7
        blt     LDAH3
        mov     r0, #0
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LDAH4:
        str     r4, [sp]
        mov     r3, r7
        mov     r2, r6
        mov     r1, r8
        mov     r0, r11
        bl      ownps_Mul_16u_Sfs
        mov     r0, #0
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LDAH5:
        mvn     r0, #7
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LDAH6:
        mvn     r0, #5
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}


