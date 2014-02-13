        .text
        .align  4
        .globl  _ippsAdaptiveCodebookSearch_G723


_ippsAdaptiveCodebookSearch_G723:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xF1, 30
        sub     sp, sp, #2, 22
        add     r5, sp, #2, 22
        add     r5, r5, #0xBA, 30
        ldr     lr, [sp, #0xBF4]
        and     r8, r5, #0x1F
        ldr     r7, [sp, #0xBE8]
        rsb     r11, r8, #0
        add     r5, sp, #2, 22
        ldr     r10, [sp, #0xBEC]
        and     r11, r11, #0x1F
        add     r6, sp, #0x28
        add     r5, r5, #0xBA, 30
        and     r9, r6, #0x1F
        add     r11, r5, r11
        ldr     r5, [sp, #0xBF8]
        rsb     r8, r9, #0
        add     r6, sp, #0x28
        ldr     r9, [sp, #0xBF0]
        and     r8, r8, #0x1F
        str     r5, [sp, #0x10]
        mov     r12, r1
        add     r5, r6, r8
        ldr     r6, [sp, #0xBFC]
        str     r11, [sp, #0x14]
        mov     r1, r2
        and     r11, lr, #1
        cmp     r12, #0
        mov     r4, r0
        mov     r2, r3
        add     r8, r11, #3
        beq     LDVL16
        cmp     r1, #0
        beq     LDVL16
        cmp     r2, #0
        beq     LDVL16
        cmp     r7, #0
        beq     LDVL16
        cmp     r10, #0
        beq     LDVL16
        cmp     r9, #0
        beq     LDVL16
        cmp     r4, #0x12
        blt     LDVL0
        rsb     r0, r8, #0x91
        cmp     r0, r4
        blt     LDVL0
        cmp     lr, #0
        blt     LDVL0
        cmp     lr, #4
        bgt     LDVL0
        cmp     r6, #2
        beq     LDVL1
        cmp     r6, #4
        beq     LDVL1
LDVL0:
        add     sp, sp, #0xF1, 30
        mvn     r0, #6
        add     sp, sp, #2, 22
        ldmia   sp!, {r4 - r11, pc}
LDVL1:
        str     r5, [sp, #8]
        ldr     r0, [sp, #0x14]
        str     lr, [sp]
        str     r0, [sp, #4]
        mov     r0, r12
        mov     r3, r4
        bl      _ippsPitchPredictor_G723_16s
        add     r2, r8, r4
        mov     r3, #0x14
        mov     r1, r2, lsl #16
        add     r3, r3, #0x43, 28
        mov     r1, r1, asr #16
        mul     r3, r1, r3
        sub     r4, r4, #0x3E
        cmp     r4, #0
        mov     r1, r3, asr #15
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        movle   r4, #1
        mov     r12, #0x14
        mov     r4, r4, lsl #16
        add     r12, r12, #0x43, 28
        mov     r3, r4, asr #16
        mul     r12, r3, r12
        mov     r3, r12, asr #15
        mov     r12, r3, lsl #16
        cmp     r1, r12, asr #16
        strlt   r1, [sp, #0xBC0]
        mvnlt   r3, #0
        blt     LDVL4
        add     r7, r7, r1, lsl #2
        mvn     r3, #0
LDVL2:
        ldr     lr, [r7], #-4
        cmp     lr, r3
        movgt   r3, lr
        sub     r1, r1, #1
        cmp     r1, r12, asr #16
        bge     LDVL2
        cmp     r3, #1, 2
        str     r1, [sp, #0xBC0]
        ble     LDVL4
LDVL3:
        add     r3, sp, #2, 22
        add     r3, r3, #0xEF, 30
        mov     r1, #0x5D
        mov     r12, #0x33
        strh    r1, [r3, #2]
        b       LDVL5
LDVL4:
        ldr     r1, [sp, #0x10]
        cmp     r1, #0
        blt     LDVL3
        rsb     r1, r3, #1, 2
        add     r3, sp, #2, 22
        mov     r1, r1, asr #23
        add     r3, r3, #0xEF, 30
        mov     r1, r1, lsl #16
        mov     lr, #0xAA
        mov     r4, r1, asr #16
        mov     r1, #0x55
        mov     r12, r4, lsl #2
        add     r12, r12, #0x33
        mov     r4, r4, lsl #3
        mov     r12, r12, lsl #16
        add     r4, r4, #0x5D
        mov     r12, r12, asr #16
        cmp     r12, #0x55
        movgt   r12, r1
        mov     r4, r4, lsl #16
        mov     r1, r4, asr #16
        cmp     r1, #0xAA
        movgt   r1, lr
        strh    r1, [r3, #2]
LDVL5:
        add     lr, sp, #2, 22
        add     lr, lr, #0xEF, 30
        ldr     r0, [pc, #0x294]
        sub     r2, r2, #0x3E
        strh    r12, [lr]
        cmp     r6, #4
        mov     r12, r2, lsl #16
        add     r6, r3, #2
        mov     r2, #0x14
        mov     r7, r12, asr #16
        mov     r4, r5
        beq     LDVL12
        cmp     r8, #0
        ble     LDVL7
        str     r11, [sp, #0x18]
        ldr     r11, [sp, #0x14]
        str     r9, [sp, #0x1C]
        str     r10, [sp, #0x20]
        mov     r7, #0
        mov     r10, r0
        mov     r9, r2
LDVL6:
        add     r12, sp, #2, 22
        add     r12, r12, #0xEA, 30
        str     r1, [r12, +r7, lsl #2]
        str     r9, [sp]
        ldr     r0, [r10, #4]
        mov     r3, r4
        mov     r2, r11
        bl      _ippsMul_D2D1_16s32s
        add     r1, sp, #2, 22
        add     r1, r1, #0xEA, 30
        ldr     r1, [r1, +r7, lsl #2]
        add     r7, r7, #1
        cmp     r7, r8
        add     r11, r11, #0x28
        add     r4, r4, r1, lsl #2
        ldrltsh r1, [r6]
        blt     LDVL6
        ldr     r11, [sp, #0x18]
        ldr     r9, [sp, #0x1C]
        ldr     r10, [sp, #0x20]
LDVL7:
        add     r2, sp, #2, 22
        add     r3, sp, #0x2F, 26
        sub     r4, r4, r5
        add     r2, r2, #0xEE, 30
        mov     r1, r4, asr #2
        mov     r0, r5
        bl      _ippsMaxIndx_32s
        ldr     r0, [sp, #0xBB8]
        mov     r3, #0
        cmp     r0, #0
        movle   r2, r3
        movle   r0, #1
        ble     LDVL10
        cmp     r8, #0
        ldrle   r2, [sp, #0xBC0]
        movle   r0, r3
        ble     LDVL10
        add     r0, r11, #3
        cmp     r0, #6
        blt     LDVL11
        ldr     r2, [sp, #0xBC0]
        mov     r0, r3
        mov     r1, r0
LDVL8:
        add     r12, sp, #2, 22
        add     r12, r12, #0xEA, 30
        ldr     lr, [r12, +r1, lsl #2]
        add     r12, r12, r3
        cmp     r2, lr
        blt     LDVL10
        sub     r2, r2, lr
        ldr     lr, [r12, #4]
        add     r0, r0, #1
        cmp     r2, lr
        blt     LDVL10
        sub     r2, r2, lr
        ldr     lr, [r12, #8]
        add     r0, r0, #1
        cmp     r2, lr
        blt     LDVL10
        sub     r2, r2, lr
        ldr     lr, [r12, #0xC]
        add     r0, r0, #1
        cmp     r2, lr
        blt     LDVL10
        ldr     r12, [r12, #0x10]
        sub     r2, r2, lr
        add     r0, r0, #1
        cmp     r2, r12
        blt     LDVL10
        sub     r2, r2, r12
        add     r1, r1, #5
        sub     r12, r11, #3
        cmp     r1, r12
        add     r0, r0, #1
        add     r3, r3, #0x14
        ble     LDVL8
LDVL9:
        add     r3, sp, #2, 22
        add     r3, r3, #0xEA, 30
        ldr     r3, [r3, +r1, lsl #2]
        cmp     r2, r3
        blt     LDVL10
        add     r1, r1, #1
        cmp     r1, r8
        sub     r2, r2, r3
        add     r0, r0, #1
        blt     LDVL9
LDVL10:
        strh    r0, [r10]
        add     sp, sp, #0xF1, 30
        mov     r0, #0
        strh    r2, [r9]
        add     sp, sp, #2, 22
        ldmia   sp!, {r4 - r11, pc}
LDVL11:
        ldr     r2, [sp, #0xBC0]
        mov     r0, r3
        mov     r1, r0
        b       LDVL9
LDVL12:
        cmp     r8, #0
        ble     LDVL7
        mov     r6, r7
        str     r11, [sp, #0x18]
        ldr     r11, [sp, #0x14]
        mov     r1, #0
        str     r5, [sp, #0x24]
        str     r9, [sp, #0x1C]
        str     r10, [sp, #0x20]
        mov     r10, r0
        mov     r5, r1
        mov     r9, r2
LDVL13:
        cmp     r7, #0
        movge   r12, #1
        blt     LDVL15
LDVL14:
        add     r1, sp, #2, 22
        add     r1, r1, #0xEF, 30
        mov     r0, r12, lsl #1
        ldrsh   r1, [r1, +r0]
        add     lr, sp, #2, 22
        add     lr, lr, #0xEA, 30
        str     r1, [lr, +r5, lsl #2]
        str     r9, [sp]
        ldr     r0, [r10, +r12, lsl #2]
        mov     r3, r4
        mov     r2, r11
        bl      _ippsMul_D2D1_16s32s
        add     r12, sp, #2, 22
        add     r12, r12, #0xEA, 30
        ldr     r12, [r12, +r5, lsl #2]
        add     r5, r5, #1
        cmp     r5, r8
        add     r6, r6, #1
        add     r11, r11, #0x28
        add     r4, r4, r12, lsl #2
        blt     LDVL13
        ldr     r5, [sp, #0x24]
        ldr     r11, [sp, #0x18]
        ldr     r9, [sp, #0x1C]
        ldr     r10, [sp, #0x20]
        b       LDVL7
LDVL15:
        cmp     r8, #3
        movne   r12, #0
        bne     LDVL14
        cmp     r6, #0
        movlt   r12, #0
        movge   r12, #1
        b       LDVL14
LDVL16:
        add     sp, sp, #0xF1, 30
        mvn     r0, #7
        add     sp, sp, #2, 22
        ldmia   sp!, {r4 - r11, pc}
        .long   AdCdbkGainTbl_G723


