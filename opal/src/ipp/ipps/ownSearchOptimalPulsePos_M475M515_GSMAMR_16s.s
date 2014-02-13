        .text
        .align  4
        .globl  ownSearchOptimalPulsePos_M475M515_GSMAMR_16s


ownSearchOptimalPulsePos_M475M515_GSMAMR_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x44
        ldr     r12, [sp, #0x68]
        ldr     r4, [pc, #0x1B0]
        mov     lr, #0
        strh    lr, [r12]
        mov     lr, #1
        strh    lr, [r12, #2]
        add     r0, r4, r0, lsl #2
        mvn     r4, #0
        add     r7, r3, #1, 24
        mov     r6, #2
        str     r4, [sp, #0x30]
        str     lr, [sp, #0x34]
        str     r12, [sp, #0x24]
LDMQ0:
        ldrsh   r5, [r0, #2]
        ldrsh   r4, [r0]
        mov     r9, #8
        add     r8, r1, r5, lsl #1
        add     r12, r2, r5, lsl #5
        add     r10, r2, r4, lsl #5
        add     lr, r1, r4, lsl #1
        str     r10, [sp, #0x3C]
        str     r9, [sp, #0x40]
        str     r8, [sp, #0x2C]
        str     r12, [sp, #0x28]
        str     r0, [sp, #0x20]
        str     r6, [sp, #0x1C]
        str     r7, [sp, #0x18]
        str     r2, [sp, #0x14]
        str     r1, [sp, #0x10]
LDMQ1:
        ldr     r1, [sp, #0x3C]
        ldrsh   r9, [lr], #0xA
        ldr     r2, [sp, #0x28]
        ldr     r10, [r1], #4
        str     r1, [sp, #0x3C]
        ldr     r1, [sp, #0x2C]
        mvn     r0, #0
        mov     r11, r5
        mov     r12, #1
        str     r0, [sp, #0x38]
        mov     r8, #0
        mov     r6, r3
        mov     r7, #8
        str     r11, [sp]
        str     lr, [sp, #4]
        str     r3, [sp, #8]
        str     r4, [sp, #0xC]
LDMQ2:
        ldrsh   r4, [r1], #0xA
        ldr     lr, [r2], #4
        ldr     r3, [r6], #4
        add     r4, r9, r4
        mov     r4, r4, lsl #16
        add     lr, r10, lr
        mov     r4, r4, asr #16
        mul     r4, r4, r4
        add     r3, lr, r3, lsl #1
        add     r3, r3, #2
        mov     r4, r4, asr #15
        mov     r3, r3, asr #2
        mov     lr, r4, lsl #16
        mov     r3, r3, lsl #16
        mov     lr, lr, asr #16
        mul     r4, r12, lr
        mov     r3, r3, asr #16
        mul     r11, r0, r3
        sub     r4, r4, r11
        cmp     r4, #0
        ble     LDMQ3
        mov     r0, lr
        mov     r12, r3
        add     r3, r5, r8
        str     r3, [sp, #0x38]
LDMQ3:
        subs    r7, r7, #1
        add     r8, r8, #5
        bne     LDMQ2
        ldr     r1, [sp, #0x38]
        ldr     r11, [sp]
        ldr     lr, [sp, #4]
        ldr     r3, [sp, #8]
        ldr     r4, [sp, #0xC]
        mov     r1, r1, lsl #16
        movs    r1, r1, asr #16
        movpl   r11, r1
        ldr     r1, [sp, #0x30]
        ldr     r2, [sp, #0x34]
        rsb     r1, r1, #0
        mul     r1, r1, r12
        mla     r1, r2, r0, r1
        cmp     r1, #0
        ble     LDMQ4
        str     r0, [sp, #0x30]
        ldr     r0, [sp, #0x24]
        str     r12, [sp, #0x34]
        strh    r4, [r0]
        strh    r11, [r0, #2]
LDMQ4:
        ldr     r0, [sp, #0x40]
        add     r3, r3, #0x20
        add     r4, r4, #5
        subs    r0, r0, #1
        str     r0, [sp, #0x40]
        bne     LDMQ1
        ldr     r6, [sp, #0x1C]
        ldr     r0, [sp, #0x20]
        ldr     r7, [sp, #0x18]
        ldr     r2, [sp, #0x14]
        ldr     r1, [sp, #0x10]
        subs    r6, r6, #1
        mov     r3, r7
        add     r0, r0, #0x10
        bne     LDMQ0
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
        .long   LDMQ_startPos


        .data
        .align  4


LDMQ_startPos:
        .byte   0x00,0x00,0x02,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x02,0x00,0x00,0x00,0x03,0x00
        .byte   0x01,0x00,0x03,0x00,0x02,0x00,0x04,0x00,0x01,0x00,0x04,0x00,0x01,0x00,0x04,0x00


