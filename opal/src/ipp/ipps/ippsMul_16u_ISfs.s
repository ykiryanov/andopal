        .text
        .align  4
        .globl  _ippsMul_16u_ISfs


_ippsMul_16u_ISfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        mov     r4, r3
        cmp     r4, #0x20
        mov     r9, r0
        mov     r7, r1
        mov     r6, r2
        ble     LDAI0
        cmp     r9, #0
        beq     LDAI6
        mov     r0, r7
        mov     r1, r6
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsZero_16s
LDAI0:
        cmp     r9, #0
        beq     LDAI6
        cmp     r7, #0
        beq     LDAI6
        cmp     r6, #0
        ble     LDAI5
        cmp     r4, #0x10
        ble     LDAI4
        sub     r2, r4, #1
        mov     r0, #1
        mov     r3, r2, asr #31
        mov     r1, #0
        bl      __ashldi3
        mvn     r12, #0
        adds    r0, r0, r12
        adc     r11, r1, r12
        cmp     r6, #4
        mov     r8, #0
        movlt   r5, r4, asr #31
        blt     LDAI2
        add     r1, r12, #1, 16
        sub     r12, r6, #4
        mov     r2, r9
        mov     r10, r7
        str     r6, [sp, #4]
        str     r7, [sp, #8]
        str     r9, [sp, #0xC]
        mov     r5, r4, asr #31
        str     r12, [sp]
        mov     r6, r0
        mov     r9, r1
        mov     r7, r2
LDAI1:
        ldrh    r12, [r7]
        ldrh    lr, [r10]
        mov     r2, r4
        mov     r3, r5
        add     r8, r8, #3
        mul     lr, lr, r12
        adds    r1, r6, lr
        adc     r12, r11, #0
        mov     lr, lr, lsr r4
        and     lr, lr, #1
        adds    r0, r1, lr
        adc     r1, r12, #0
        bl      __lshrdi3
        ldrh    lr, [r10, #2]
        mov     r12, r9
        cmp     r0, r9
        movcc   r12, r0
        strh    r12, [r10]
        ldrh    r12, [r7, #2]
        mov     r2, r4
        mov     r3, r5
        mul     lr, lr, r12
        adds    r1, r6, lr
        adc     r12, r11, #0
        mov     lr, lr, lsr r4
        and     lr, lr, #1
        adds    r0, r1, lr
        adc     r1, r12, #0
        bl      __lshrdi3
        cmp     r0, r9
        mov     r12, r9
        movcc   r12, r0
        strh    r12, [r10, #2]
        ldrh    lr, [r10, #4]
        ldrh    r12, [r7, #4]
        add     r7, r7, #6
        mov     r2, r4
        mov     r3, r5
        mul     lr, lr, r12
        adds    r1, r6, lr
        adc     r12, r11, #0
        mov     lr, lr, lsr r4
        and     lr, lr, #1
        adds    r0, r1, lr
        adc     r1, r12, #0
        bl      __lshrdi3
        cmp     r0, r9
        mov     r12, r9
        movcc   r12, r0
        strh    r12, [r10, #4]
        ldr     r12, [sp]
        add     r10, r10, #6
        cmp     r8, r12
        ble     LDAI1
        mov     r0, r6
        ldr     r6, [sp, #4]
        ldr     r7, [sp, #8]
        ldr     r9, [sp, #0xC]
LDAI2:
        mvn     r12, #0
        add     r10, r12, #1, 16
        add     r9, r9, r8, lsl #1
        add     r7, r7, r8, lsl #1
        str     r0, [sp, #0x10]
LDAI3:
        ldrh    r12, [r7]
        ldrh    r0, [r9], #2
        add     r8, r8, #1
        mov     r2, r4
        mul     r12, r12, r0
        ldr     r0, [sp, #0x10]
        mov     r3, r5
        adds    r0, r0, r12
        mov     r12, r12, lsr r4
        and     lr, r12, #1
        adc     r12, r11, #0
        adds    r0, r0, lr
        adc     r1, r12, #0
        bl      __lshrdi3
        cmp     r0, r10
        mov     r12, r10
        movcc   r12, r0
        strh    r12, [r7], #2
        cmp     r8, r6
        blt     LDAI3
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LDAI4:
        mov     r3, r4
        mov     r2, r6
        mov     r1, r7
        mov     r0, r9
        bl      ownps_Mul_16u_ISfs
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LDAI5:
        mvn     r0, #5
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LDAI6:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}


