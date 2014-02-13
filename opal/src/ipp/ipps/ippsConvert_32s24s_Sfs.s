        .text
        .align  4
        .globl  _ippsConvert_32s24s_Sfs


_ippsConvert_32s24s_Sfs:
        stmdb   sp!, {r1, r4 - r11, lr}
        mov     r5, r0
        cmp     r5, #0
        mov     r6, r2
        beq     LCVZ11
        cmp     r1, #0
        beq     LCVZ11
        cmp     r6, #0
        ble     LCVZ10
        mov     r12, #0xFE, 10
        cmp     r3, #0
        orr     r12, r12, #3, 2
        mov     lr, #0
        bne     LCVZ2
        cmp     r6, #0
        ble     LCVZ8
        sub     r1, r1, #1
        mov     r4, #0
        mvn     r3, r12
LCVZ0:
        ldr     r7, [r5], #4
        cmp     r3, r7
        mvnlt   r7, r12
        blt     LCVZ1
        cmn     r7, #2, 10
        sub     r8, lr, #2, 10
        movlt   r7, r8
LCVZ1:
        mov     r8, r7, asr #8
        strb    r8, [r1, #2]
        mov     r8, r7, asr #16
        add     r4, r4, #1
        strb    r7, [r1, #1]
        strb    r8, [r1, #3]!
        cmp     r4, r6
        blt     LCVZ0
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LCVZ2:
        cmp     r3, #0
        ble     LCVZ5
        mov     r4, #0x1F
        cmp     r3, #0x1F
        movlt   r4, r3
        sub     r7, r4, #1
        mov     r3, #1
        mov     r7, r3, lsl r7
        cmp     r6, #0
        sub     r9, r7, #1
        ble     LCVZ8
        sub     r8, r1, #1
        mov     r11, #0
        mov     r7, r4, asr #31
        mvn     r10, r12
        str     r12, [sp]
LCVZ3:
        ldr     lr, [r5], #4
        mov     r3, r7
        adds    r12, r9, lr
        mov     r1, lr, asr #31
        mov     lr, lr, asr r4
        adc     r1, r1, r9, asr #31
        and     lr, lr, #1
        adds    r0, r12, lr
        adc     r1, r1, lr, asr #31
        mov     r2, r4
        bl      __ashrdi3
        cmp     r10, r0
        ldrlt   r1, [sp]
        mvnlt   r0, r1
        blt     LCVZ4
        mov     r1, #0
        cmn     r0, #2, 10
        sub     r1, r1, #2, 10
        movlt   r0, r1
LCVZ4:
        mov     r1, r0, asr #8
        strb    r0, [r8, #1]
        mov     r0, r0, asr #16
        add     r11, r11, #1
        strb    r1, [r8, #2]
        strb    r0, [r8, #3]!
        cmp     r11, r6
        blt     LCVZ3
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LCVZ5:
        mvn     r4, #0x1E
        cmp     r3, r4
        movgt   r4, r3
        cmp     r6, #0
        rsb     r3, r4, #0
        ble     LCVZ8
        sub     r1, r1, #1
        mov     r8, #0
        mvn     r7, r12
        sub     r4, lr, #2, 10
LCVZ6:
        ldr     r9, [r5], #4
        cmp     r9, #0
        blt     LCVZ9
        cmp     r9, r7, asr r3
        movle   r9, r9, lsl r3
        mvngt   r9, r12
LCVZ7:
        mov     r10, r9, asr #8
        strb    r10, [r1, #2]
        mov     r10, r9, asr #16
        add     r8, r8, #1
        strb    r9, [r1, #1]
        strb    r10, [r1, #3]!
        cmp     r8, r6
        blt     LCVZ6
LCVZ8:
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LCVZ9:
        cmp     r9, r4, asr r3
        movgt   r9, r9, lsl r3
        suble   r9, lr, #2, 10
        b       LCVZ7
LCVZ10:
        mvn     r0, #5
        ldmia   sp!, {r1, r4 - r11, pc}
LCVZ11:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r11, pc}


