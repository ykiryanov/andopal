        .text
        .align  4
        .globl  LsfWeight


LsfWeight:
        stmdb   sp!, {r4 - r7, lr}
        ldrsh   r2, [r0, #2]
        ldr     r5, [pc, #0x120]
        strh    r2, [r1]
        ldrsh   r3, [r0]
        ldrsh   r2, [r0, #4]
        mov     r12, #0x62
        orr     r12, r12, #6, 22
        sub     r2, r2, r3
        strh    r2, [r1, #2]
        ldrsh   r3, [r0, #6]
        ldrsh   lr, [r0, #2]
        mov     r2, #0xFF
        orr     r4, r2, #0x7F, 24
        sub     r3, r3, lr
        strh    r3, [r1, #4]
        ldrsh   lr, [r0, #8]
        ldrsh   r6, [r0, #4]
        orr     r3, r2, #0xF, 24
        mov     r2, #0x63
        orr     r2, r2, #0xD, 24
        sub     lr, lr, r6
        strh    lr, [r1, #6]
        ldrsh   r6, [r0, #0xA]
        ldrsh   r7, [r0, #6]
        sub     lr, r2, #0x63, 28
        sub     r6, r6, r7
        strh    r6, [r1, #8]
        ldrsh   r6, [r0, #0xC]
        ldrsh   r7, [r0, #8]
        sub     r6, r6, r7
        strh    r6, [r1, #0xA]
        ldrsh   r6, [r0, #0xE]
        ldrsh   r7, [r0, #0xA]
        sub     r6, r6, r7
        strh    r6, [r1, #0xC]
        ldrsh   r6, [r0, #0x10]
        ldrsh   r7, [r0, #0xC]
        sub     r6, r6, r7
        strh    r6, [r1, #0xE]
        ldrsh   r6, [r0, #0x12]
        ldrsh   r7, [r0, #0xE]
        sub     r6, r6, r7
        strh    r6, [r1, #0x10]
        ldrsh   r6, [r0, #0x10]
        mov     r0, #0xA
        rsb     r6, r6, #1, 18
        strh    r6, [r1, #0x12]
LDOX0:
        ldrsh   r6, [r1]
        cmp     lr, r6
        ble     LDOX1
        rsb     r7, r6, r6, lsl #3
        rsb     r7, r6, r7, lsl #3
        mov     r6, r7, lsl #9
        sub     r6, r2, r6, asr #15
        b       LDOX2
LDOX1:
        mul     r7, r6, r12
        sub     r6, r2, #0x63, 28
        sub     r7, r7, r5
        sub     r6, r6, r7, asr #15
LDOX2:
        mov     r6, r6, lsl #16
        mov     r6, r6, asr #16
        cmp     r3, r6
        addlt   r6, r2, #0xA7, 30
        addlt   r6, r6, #7, 20
        blt     LDOX3
        cmn     r6, #1, 20
        mvnlt   r6, r4
        blt     LDOX3
        mov     r6, r6, lsl #3
        mov     r6, r6, lsl #16
        mov     r6, r6, asr #16
LDOX3:
        strh    r6, [r1], #2
        subs    r0, r0, #1
        bne     LDOX0
        ldmia   sp!, {r4 - r7, pc}
        .long   0x00af8986


