        .text
        .align  4
        .globl  _ippsMaxOrder_32s


_ippsMaxOrder_32s:
        stmdb   sp!, {r4 - r11, lr}
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r11, pc}
        cmp     r0, #0
        beq     LBID5
        cmp     r2, #0
        beq     LBID5
        cmp     r1, #6
        mov     r5, #0
        movlt   r3, r5
        movlt   r12, r3
        blt     LBID1
        mov     r3, r5
        mov     r12, r3
        sub     r4, r1, #6
        add     lr, r0, #4
LBID0:
        ldr     r11, [lr, #-4]
        ldr     r6, [lr]
        ldr     r7, [lr, #4]
        ldr     r8, [lr, #8]
        ldr     r9, [lr, #0xC]
        eor     r10, r11, r11, asr #31
        add     r12, r12, #5
        cmp     r12, r4
        sub     r10, r10, r11, asr #31
        orr     r3, r3, r10
        eor     r10, r6, r6, asr #31
        add     lr, lr, #0x14
        sub     r10, r10, r6, asr #31
        eor     r6, r7, r7, asr #31
        orr     r3, r3, r10
        sub     r6, r6, r7, asr #31
        orr     r3, r3, r6
        eor     r6, r8, r8, asr #31
        sub     r6, r6, r8, asr #31
        orr     r3, r3, r6
        eor     r6, r9, r9, asr #31
        sub     r6, r6, r9, asr #31
        orr     r3, r3, r6
        ble     LBID0
LBID1:
        add     r0, r0, r12, lsl #2
LBID2:
        ldr     lr, [r0], #4
        add     r12, r12, #1
        eor     r4, lr, lr, asr #31
        cmp     r12, r1
        sub     r4, r4, lr, asr #31
        orr     r3, r3, r4
        blt     LBID2
        cmp     r3, #0
        bne     LBID3
        str     r5, [r2]
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LBID3:
        mov     r0, #0x10
LBID4:
        movs    r1, r3, asr r0
        movne   r3, r1
        addne   r5, r0, r5
        movs    r0, r0, asr #1
        bne     LBID4
        add     r5, r5, #1
        str     r5, [r2]
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LBID5:
        mvn     r0, #7
        ldmia   sp!, {r4 - r11, pc}


