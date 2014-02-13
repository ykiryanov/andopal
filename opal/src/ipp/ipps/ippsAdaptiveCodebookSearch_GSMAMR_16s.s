        .text
        .align  4
        .globl  _ippsAdaptiveCodebookSearch_GSMAMR_16s


_ippsAdaptiveCodebookSearch_GSMAMR_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xA0
        ldr     lr, [sp, #0xC4]
        ldr     r10, [sp, #0xC8]
        ldr     r9, [sp, #0xCC]
        ldr     r6, [sp, #0xD0]
        ldr     r12, [sp, #0xD4]
        ldr     r8, [sp, #0xD8]
        cmp     r0, #0
        mov     r7, r3
        beq     LDVU61
        cmp     r1, #0
        beq     LDVU61
        cmp     r2, #0
        beq     LDVU61
        cmp     r7, #0
        beq     LDVU61
        cmp     lr, #0
        beq     LDVU61
        cmp     r10, #0
        beq     LDVU61
        cmp     r9, #0
        beq     LDVU61
        cmp     r6, #0
        beq     LDVU61
        cmp     r12, #0
        blt     LDVU0
        cmp     r12, #3
        bgt     LDVU0
        cmp     r8, #0
        beq     LDVU1
        cmp     r8, #1
        beq     LDVU1
        cmp     r8, #3
        beq     LDVU1
        cmp     r8, #6
        beq     LDVU1
        cmp     r8, #7
        beq     LDVU1
        cmp     r8, #8
        beq     LDVU1
        cmp     r8, #0xB
        beq     LDVU1
        cmp     r8, #0xC
        beq     LDVU1
        mvn     r0, #6
        add     sp, sp, #0xA0
        ldmia   sp!, {r4 - r11, pc}
LDVU0:
        mvn     r0, #5
        add     sp, sp, #0xA0
        ldmia   sp!, {r4 - r11, pc}
LDVU1:
        add     lr, lr, #0x4D, 30
        cmp     r8, #0
        str     lr, [sp, #0x3C]
        moveq   lr, #0
        beq     LDVU2
        cmp     r8, #1
        moveq   lr, #1
        beq     LDVU2
        cmp     r8, #3
        moveq   lr, #2
        beq     LDVU2
        cmp     r8, #6
        moveq   lr, #3
        beq     LDVU2
        cmp     r8, #7
        moveq   lr, #4
        beq     LDVU2
        cmp     r8, #8
        moveq   lr, #5
        beq     LDVU2
        cmp     r8, #0xB
        moveq   lr, #6
        movne   lr, #7
LDVU2:
        ldr     r3, [pc, #0xDD0]
        add     r4, lr, lr, lsl #4
        add     r5, lr, r4
        ldr     lr, [pc, #0xDC8]
        ldr     r11, [pc, #0xDC8]
        cmp     r12, #0
        ldrsh   lr, [lr, +r5]
        str     lr, [sp, #0x38]
        ldr     lr, [pc, #0xDBC]
        ldrsh   lr, [lr, +r5]
        str     lr, [sp, #0x4C]
        ldr     lr, [pc, #0xDB4]
        ldrsh   r4, [lr, +r5]
        ldr     lr, [pc, #0xDB0]
        ldrsh   lr, [lr, +r5]
        str     lr, [sp, #0x34]
        ldr     lr, [pc, #0xDA8]
        ldrsh   lr, [lr, +r5]
        str     lr, [sp, #0x1C]
        ldr     lr, [pc, #0xDA0]
        ldrsh   r11, [r11, +r5]
        ldrsh   lr, [lr, +r5]
        str     r11, [sp, #0x18]
        ldr     r11, [pc, #0xD94]
        ldrsh   r3, [r3, +r5]
        ldrsh   r11, [r11, +r5]
        beq     LDVU3
        cmp     r12, #2
        bne     LDVU6
LDVU3:
        cmp     r8, #0
        beq     LDVU4
        cmp     r8, #1
        bne     LDVU5
LDVU4:
        cmp     r12, #2
        beq     LDVU44
LDVU5:
        cmp     r12, #0
        movne   r12, #1
        moveq   r12, #0
        mov     r12, r12, lsl #1
        ldrsh   r12, [r2, +r12]
        ldr     r5, [sp, #0x1C]
        sub     r12, r12, r5
        mov     r12, r12, lsl #16
        mov     r5, r12, asr #16
        cmp     r3, r5
        movgt   r5, r3
        add     r12, r5, lr
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        cmp     r12, #0x8F
        str     r12, [sp, #0x40]
        movle   r12, #0
        strle   r12, [sp, #0x44]
        ble     LDVU7
        rsb     lr, lr, #0x8F
        mov     r12, lr, lsl #16
        mov     r5, r12, asr #16
        mov     r12, #0
        str     r12, [sp, #0x44]
        mov     r12, #0x8F
        str     r12, [sp, #0x40]
        b       LDVU7
LDVU6:
        ldrsh   r12, [r7]
        ldr     lr, [sp, #0x18]
        sub     r12, r12, lr
        mov     r12, r12, lsl #16
        mov     r5, r12, asr #16
        cmp     r3, r5
        movgt   r5, r3
        add     r12, r5, r11
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        cmp     r12, #0x8F
        str     r12, [sp, #0x40]
        movle   r12, #1
        strle   r12, [sp, #0x44]
        ble     LDVU7
        rsb     r11, r11, #0x8F
        mov     r12, r11, lsl #16
        mov     r5, r12, asr #16
        mov     r12, #1
        str     r12, [sp, #0x44]
        mov     r12, #0x8F
        str     r12, [sp, #0x40]
LDVU7:
        sub     r12, r5, #4
        mov     r11, #0x28
        mov     lr, r12, lsl #16
        ldr     r12, [sp, #0x40]
        mov     r3, lr, asr #16
        str     r11, [sp, #8]
        add     r12, r12, #4
        add     r11, sp, #0x50
        mov     lr, r12, lsl #16
        rsb     r12, r3, #0
        mov     lr, lr, asr #16
        add     r12, r11, r12, lsl #1
        str     r12, [sp, #0x10]
        mov     r2, r1
        str     r12, [sp, #4]
        str     lr, [sp]
        mov     r1, r0
        ldr     r0, [sp, #0x3C]
        bl      _ippsMeanSquareWeightedError_16s
        ldr     lr, [sp, #0x10]
        add     r0, r5, #1
        mov     r12, r5, lsl #1
        ldrsh   r12, [lr, +r12]
        ldr     lr, [sp, #0x40]
        mov     r0, r0, lsl #16
        mov     r11, r5
        mov     r0, r0, asr #16
        cmp     r0, lr
        bgt     LDVU9
        ldr     lr, [sp, #0x10]
        ldr     r2, [sp, #0x40]
        add     lr, lr, r0, lsl #1
LDVU8:
        ldrsh   r1, [lr], #2
        cmp     r1, r12
        movge   r12, r1
        movge   r11, r0
        add     r0, r0, #1
        cmp     r0, r2
        ble     LDVU8
LDVU9:
        ldr     r0, [sp, #0x44]
        cmp     r0, #0
        bne     LDVU10
        ldr     r12, [sp, #0x38]
        mov     r0, r11, lsl #16
        mov     r0, r0, asr #16
        cmp     r0, r12
        str     r0, [sp, #0x48]
        movgt   r4, #0
        bgt     LDVU38
        b       LDVU11
LDVU10:
        mov     r0, r11, lsl #16
        mov     r0, r0, asr #16
        str     r0, [sp, #0x48]
LDVU11:
        ldr     r0, [sp, #0x44]
        cmp     r0, #0
        beq     LDVU32
        cmp     r8, #0
        beq     LDVU12
        cmp     r8, #1
        beq     LDVU12
        cmp     r8, #3
        beq     LDVU12
        cmp     r8, #6
        bne     LDVU32
LDVU12:
        ldrsh   r0, [r7]
        sub     r12, r0, r5
        cmp     r12, #5
        ble     LDVU13
        add     r0, r5, #5
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
LDVU13:
        ldr     r12, [sp, #0x40]
        sub     r12, r12, r0
        cmp     r12, #4
        ble     LDVU14
        ldr     r0, [sp, #0x40]
        sub     r0, r0, #4
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
LDVU14:
        ldr     r12, [sp, #0x48]
        cmp     r12, r0
        beq     LDVU26
        ldr     r12, [sp, #0x48]
        sub     r0, r12, r0
        adds    r12, r0, #1
        beq     LDVU26
        adds    r12, r0, #2
        beq     LDVU20
        subs    r0, r0, #1
        movne   r4, #0
        bne     LDVU38
        ldr     r0, [sp, #0x48]
        ldr     r12, [sp, #0x10]
        ldr     r2, [sp, #0x4C]
        mov     r1, r4
        add     r0, r12, r0, lsl #1
        str     r0, [sp, #0x38]
        bl      LDVU_ownInterpol3or6
        mov     lr, r4
        add     r12, lr, #1
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        cmp     r12, #0
        bgt     LDVU17
        ldr     r1, [pc, #0xB04]
        mov     lr, r12, lsl #1
        str     r11, [sp, #0x18]
        str     r0, [sp, #0x34]
        str     r4, [sp, #0x14]
        str     r5, [sp, #0x1C]
        str     r8, [sp, #0x20]
        str     r6, [sp, #0x24]
        str     r9, [sp, #0x28]
        str     r10, [sp, #0x2C]
        str     r7, [sp, #0x30]
LDVU15:
        ldr     r0, [sp, #0x4C]
        mov     r1, r12
        cmp     r0, #0
        ldr     r0, [sp, #0x38]
        movne   r1, lr, lsl #16
        movne   r1, r1, asr #16
        mov     r1, r1, lsl #16
        movs    r2, r1, asr #16
        bmi     LDVU48
LDVU16:
        ldr     r5, [pc, #0xAB4]
        rsb     r1, r2, #0
        mov     r4, r2, lsl #1
        ldrsh   r3, [r0, #-4]
        add     r11, r5, r1, lsl #1
        add     r1, r5, r4
        ldrsh   r2, [r1, #0x18]
        ldrsh   r8, [r5, +r4]
        ldrsh   r9, [r0]
        ldrsh   r5, [r11, #0x30]
        mul     r2, r3, r2
        ldrsh   r4, [r11, #0x18]
        ldrsh   r7, [r0, #4]
        ldrsh   r6, [r0, #8]
        mul     r3, r9, r8
        ldrsh   r10, [r0, #-6]
        mul     r4, r7, r4
        mul     r5, r6, r5
        ldrsh   r9, [r0, #-2]
        ldrsh   r8, [r0, #2]
        ldrsh   r7, [r11, #0xC]
        ldrsh   r6, [r1, #0x24]
        ldrsh   r0, [r0, #6]
        ldrsh   r11, [r11, #0x24]
        ldrsh   r1, [r1, #0xC]
        mla     r2, r10, r6, r2
        mla     r4, r8, r7, r4
        mla     r5, r0, r11, r5
        mla     r3, r9, r1, r3
        ldr     r1, [sp, #0x34]
        add     r5, r4, r5
        add     r3, r2, r3
        add     r5, r3, r5
        add     r0, r5, #1, 18
        mov     r0, r0, asr #15
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        cmp     r0, r1
        strgt   r0, [sp, #0x34]
        strgt   r12, [sp, #0x14]
        add     r12, r12, #1
        cmp     r12, #0
        add     lr, lr, #2
        ble     LDVU15
        ldr     r4, [sp, #0x14]
        ldr     r11, [sp, #0x18]
        ldr     r5, [sp, #0x1C]
        ldr     r8, [sp, #0x20]
        ldr     r6, [sp, #0x24]
        ldr     r9, [sp, #0x28]
        ldr     r10, [sp, #0x2C]
        ldr     r7, [sp, #0x30]
        mov     r0, r4, lsl #16
        mov     lr, r0, asr #16
LDVU17:
        ldr     r0, [sp, #0x4C]
        cmp     r0, #0
        bne     LDVU18
        cmn     lr, #3
        beq     LDVU45
        b       LDVU38
LDVU18:
        cmn     lr, #2
        beq     LDVU47
LDVU19:
        cmp     lr, #2
        beq     LDVU46
        b       LDVU38
LDVU20:
        ldr     r0, [sp, #0x48]
        ldr     r12, [sp, #0x10]
        ldr     r2, [sp, #0x4C]
        mov     r1, #0
        add     r0, r12, r0, lsl #1
        str     r0, [sp, #0x38]
        bl      LDVU_ownInterpol3or6
        ldr     r12, [sp, #0x34]
        cmp     r12, #1
        movlt   r4, #0
        blt     LDVU23
        ldr     r1, [pc, #0x984]
        mov     r4, #0
        mov     r12, #1
        mov     lr, #2
        str     r11, [sp, #0x18]
        str     r0, [sp, #0x10]
        str     r4, [sp, #0x14]
        str     r5, [sp, #0x1C]
        str     r8, [sp, #0x20]
        str     r6, [sp, #0x24]
        str     r9, [sp, #0x28]
        str     r10, [sp, #0x2C]
        str     r7, [sp, #0x30]
LDVU21:
        ldr     r0, [sp, #0x4C]
        mov     r1, r12
        cmp     r0, #0
        ldr     r0, [sp, #0x38]
        movne   r1, lr, lsl #16
        movne   r1, r1, asr #16
        mov     r1, r1, lsl #16
        movs    r2, r1, asr #16
        bmi     LDVU52
LDVU22:
        ldr     r5, [pc, #0x92C]
        rsb     r1, r2, #0
        mov     r4, r2, lsl #1
        ldrsh   r3, [r0, #-4]
        add     r11, r5, r1, lsl #1
        add     r1, r5, r4
        ldrsh   r2, [r1, #0x18]
        ldrsh   r8, [r5, +r4]
        ldrsh   r9, [r0]
        ldrsh   r5, [r11, #0x30]
        mul     r2, r3, r2
        ldrsh   r4, [r11, #0x18]
        ldrsh   r7, [r0, #4]
        ldrsh   r6, [r0, #8]
        mul     r3, r9, r8
        ldrsh   r10, [r0, #-6]
        mul     r4, r7, r4
        mul     r5, r6, r5
        ldrsh   r9, [r0, #-2]
        ldrsh   r8, [r0, #2]
        ldrsh   r7, [r11, #0xC]
        ldrsh   r6, [r1, #0x24]
        ldrsh   r0, [r0, #6]
        ldrsh   r11, [r11, #0x24]
        ldrsh   r1, [r1, #0xC]
        mla     r2, r10, r6, r2
        mla     r4, r8, r7, r4
        mla     r5, r0, r11, r5
        mla     r3, r9, r1, r3
        ldr     r1, [sp, #0x10]
        add     r5, r4, r5
        add     r3, r2, r3
        add     r5, r3, r5
        add     r0, r5, #1, 18
        mov     r0, r0, asr #15
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        cmp     r0, r1
        strgt   r0, [sp, #0x10]
        strgt   r12, [sp, #0x14]
        ldr     r0, [sp, #0x34]
        add     r12, r12, #1
        add     lr, lr, #2
        cmp     r12, r0
        ble     LDVU21
        ldr     r11, [sp, #0x18]
        ldr     r4, [sp, #0x14]
        ldr     r5, [sp, #0x1C]
        ldr     r8, [sp, #0x20]
        ldr     r6, [sp, #0x24]
        ldr     r9, [sp, #0x28]
        ldr     r10, [sp, #0x2C]
        ldr     r7, [sp, #0x30]
LDVU23:
        ldr     r0, [sp, #0x4C]
        cmp     r0, #0
        bne     LDVU24
        mov     r0, r4, lsl #16
        cmn     r0, #3, 16
        beq     LDVU49
        b       LDVU38
LDVU24:
        mov     r0, r4, lsl #16
        mov     r0, r0, asr #16
        cmn     r0, #2
        beq     LDVU51
LDVU25:
        cmp     r0, #2
        beq     LDVU50
        b       LDVU38
LDVU26:
        ldr     r0, [sp, #0x48]
        ldr     r12, [sp, #0x10]
        ldr     r2, [sp, #0x4C]
        mov     r1, r4
        add     r0, r12, r0, lsl #1
        str     r0, [sp, #0x38]
        bl      LDVU_ownInterpol3or6
        mov     lr, r4
        ldr     r1, [sp, #0x34]
        add     r12, lr, #1
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        cmp     r12, r1
        bgt     LDVU29
        ldr     r1, [pc, #0x7E8]
        mov     lr, r12, lsl #1
        str     r11, [sp, #0x18]
        str     r0, [sp, #0x10]
        str     r4, [sp, #0x14]
        str     r5, [sp, #0x1C]
        str     r8, [sp, #0x20]
        str     r6, [sp, #0x24]
        str     r9, [sp, #0x28]
        str     r10, [sp, #0x2C]
        str     r7, [sp, #0x30]
LDVU27:
        ldr     r0, [sp, #0x4C]
        mov     r1, r12
        cmp     r0, #0
        ldr     r0, [sp, #0x38]
        movne   r1, lr, lsl #16
        movne   r1, r1, asr #16
        mov     r1, r1, lsl #16
        movs    r2, r1, asr #16
        bmi     LDVU56
LDVU28:
        ldr     r5, [pc, #0x798]
        rsb     r1, r2, #0
        mov     r4, r2, lsl #1
        ldrsh   r3, [r0, #-4]
        add     r11, r5, r1, lsl #1
        add     r1, r5, r4
        ldrsh   r2, [r1, #0x18]
        ldrsh   r8, [r5, +r4]
        ldrsh   r9, [r0]
        ldrsh   r5, [r11, #0x30]
        mul     r2, r3, r2
        ldrsh   r4, [r11, #0x18]
        ldrsh   r7, [r0, #4]
        ldrsh   r6, [r0, #8]
        mul     r3, r9, r8
        ldrsh   r10, [r0, #-6]
        mul     r4, r7, r4
        mul     r5, r6, r5
        ldrsh   r9, [r0, #-2]
        ldrsh   r8, [r0, #2]
        ldrsh   r7, [r11, #0xC]
        ldrsh   r6, [r1, #0x24]
        ldrsh   r0, [r0, #6]
        ldrsh   r11, [r11, #0x24]
        ldrsh   r1, [r1, #0xC]
        mla     r2, r10, r6, r2
        mla     r4, r8, r7, r4
        mla     r5, r0, r11, r5
        mla     r3, r9, r1, r3
        ldr     r1, [sp, #0x10]
        add     r5, r4, r5
        add     r3, r2, r3
        add     r5, r3, r5
        add     r0, r5, #1, 18
        mov     r0, r0, asr #15
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        cmp     r0, r1
        strgt   r0, [sp, #0x10]
        strgt   r12, [sp, #0x14]
        ldr     r0, [sp, #0x34]
        add     r12, r12, #1
        add     lr, lr, #2
        cmp     r12, r0
        ble     LDVU27
        ldr     r4, [sp, #0x14]
        ldr     r11, [sp, #0x18]
        ldr     r5, [sp, #0x1C]
        ldr     r8, [sp, #0x20]
        ldr     r6, [sp, #0x24]
        ldr     r9, [sp, #0x28]
        ldr     r10, [sp, #0x2C]
        ldr     r7, [sp, #0x30]
        mov     r0, r4, lsl #16
        mov     lr, r0, asr #16
LDVU29:
        ldr     r0, [sp, #0x4C]
        cmp     r0, #0
        bne     LDVU30
        cmn     lr, #3
        beq     LDVU53
        b       LDVU38
LDVU30:
        cmn     lr, #2
        beq     LDVU55
LDVU31:
        cmp     lr, #2
        beq     LDVU54
        b       LDVU38
LDVU32:
        ldr     r0, [sp, #0x48]
        ldr     r12, [sp, #0x10]
        ldr     r2, [sp, #0x4C]
        mov     r1, r4
        add     r0, r12, r0, lsl #1
        str     r0, [sp, #0x38]
        bl      LDVU_ownInterpol3or6
        mov     lr, r4
        ldr     r1, [sp, #0x34]
        add     r12, lr, #1
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        cmp     r12, r1
        bgt     LDVU35
        ldr     r1, [pc, #0x658]
        mov     lr, r12, lsl #1
        str     r11, [sp, #0x18]
        str     r0, [sp, #0x10]
        str     r4, [sp, #0x14]
        str     r5, [sp, #0x1C]
        str     r8, [sp, #0x20]
        str     r6, [sp, #0x24]
        str     r9, [sp, #0x28]
        str     r10, [sp, #0x2C]
        str     r7, [sp, #0x30]
LDVU33:
        ldr     r0, [sp, #0x4C]
        mov     r1, r12
        cmp     r0, #0
        ldr     r0, [sp, #0x38]
        movne   r1, lr, lsl #16
        movne   r1, r1, asr #16
        mov     r1, r1, lsl #16
        movs    r2, r1, asr #16
        bmi     LDVU60
LDVU34:
        ldr     r5, [pc, #0x608]
        rsb     r1, r2, #0
        mov     r4, r2, lsl #1
        ldrsh   r3, [r0, #-4]
        add     r11, r5, r1, lsl #1
        add     r1, r5, r4
        ldrsh   r2, [r1, #0x18]
        ldrsh   r8, [r5, +r4]
        ldrsh   r9, [r0]
        ldrsh   r5, [r11, #0x30]
        mul     r2, r3, r2
        ldrsh   r4, [r11, #0x18]
        ldrsh   r7, [r0, #4]
        ldrsh   r6, [r0, #8]
        mul     r3, r9, r8
        ldrsh   r10, [r0, #-6]
        mul     r4, r7, r4
        mul     r5, r6, r5
        ldrsh   r9, [r0, #-2]
        ldrsh   r8, [r0, #2]
        ldrsh   r7, [r11, #0xC]
        ldrsh   r6, [r1, #0x24]
        ldrsh   r0, [r0, #6]
        ldrsh   r11, [r11, #0x24]
        ldrsh   r1, [r1, #0xC]
        mla     r2, r10, r6, r2
        mla     r4, r8, r7, r4
        mla     r5, r0, r11, r5
        mla     r3, r9, r1, r3
        ldr     r1, [sp, #0x10]
        add     r5, r4, r5
        add     r3, r2, r3
        add     r5, r3, r5
        add     r0, r5, #1, 18
        mov     r0, r0, asr #15
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        cmp     r0, r1
        strgt   r0, [sp, #0x10]
        strgt   r12, [sp, #0x14]
        ldr     r0, [sp, #0x34]
        add     r12, r12, #1
        add     lr, lr, #2
        cmp     r12, r0
        ble     LDVU33
        ldr     r4, [sp, #0x14]
        ldr     r11, [sp, #0x18]
        ldr     r5, [sp, #0x1C]
        ldr     r8, [sp, #0x20]
        ldr     r6, [sp, #0x24]
        ldr     r9, [sp, #0x28]
        ldr     r10, [sp, #0x2C]
        ldr     r7, [sp, #0x30]
        mov     r0, r4, lsl #16
        mov     lr, r0, asr #16
LDVU35:
        ldr     r0, [sp, #0x4C]
        cmp     r0, #0
        bne     LDVU36
        cmn     lr, #3
        beq     LDVU57
        b       LDVU38
LDVU36:
        cmn     lr, #2
        beq     LDVU59
LDVU37:
        cmp     lr, #2
        beq     LDVU58
LDVU38:
        ldr     r0, [sp, #0x4C]
        cmp     r0, #0
        beq     LDVU42
        cmp     r8, #0
        bne     LDVU40
LDVU39:
        mov     r0, #1
        b       LDVU41
LDVU40:
        cmp     r8, #1
        beq     LDVU39
        cmp     r8, #3
        beq     LDVU39
        cmp     r8, #6
        movne   r0, #0
        beq     LDVU39
LDVU41:
        str     r0, [sp, #8]
        ldr     r0, [sp, #0x44]
        mov     r3, r5
        mov     r12, r4, lsl #16
        str     r0, [sp, #4]
        ldr     r0, [sp, #0x40]
        mov     r1, r12, asr #16
        str     r0, [sp]
        ldrsh   r2, [r7]
        mov     r0, r11, lsl #16
        mov     r0, r0, asr #16
        bl      LDVU_ownEncLag3
        b       LDVU43
LDVU42:
        ldr     r3, [sp, #0x44]
        mov     r0, r11, lsl #16
        mov     r12, r4, lsl #16
        mov     r0, r0, asr #16
        mov     r1, r12, asr #16
        mov     r2, r5
        bl      LDVU_ownEncLag6
LDVU43:
        strh    r0, [r9]
        strh    r11, [r7]
        strh    r4, [r10]
        ldr     r0, [sp, #0x4C]
        mov     r2, r4, lsl #16
        mov     r3, #0x28
        str     r0, [sp]
        ldrsh   r1, [r7]
        ldr     r4, [sp, #0x3C]
        mov     r2, r2, asr #16
        mov     r0, r4
        bl      ownPredLT3or6
        mov     r0, r4
        mov     r1, r6
        mov     r2, #0x28
        bl      _ippsCopy_16s
        mov     r0, #0
        add     sp, sp, #0xA0
        ldmia   sp!, {r4 - r11, pc}
LDVU44:
        ldrsh   r12, [r7]
        ldr     lr, [sp, #0x18]
        sub     r12, r12, lr
        mov     r12, r12, lsl #16
        mov     r5, r12, asr #16
        cmp     r3, r5
        movgt   r5, r3
        add     r12, r5, r11
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        cmp     r12, #0x8F
        str     r12, [sp, #0x40]
        movle   r12, #1
        strle   r12, [sp, #0x44]
        ble     LDVU7
        rsb     r11, r11, #0x8F
        mov     r12, r11, lsl #16
        mov     r5, r12, asr #16
        mov     r12, #1
        str     r12, [sp, #0x44]
        mov     r12, #0x8F
        str     r12, [sp, #0x40]
        b       LDVU7
LDVU45:
        ldr     r0, [sp, #0x48]
        mov     r4, #3
        sub     r0, r0, #1
        mov     r0, r0, lsl #16
        mov     r11, r0, asr #16
        b       LDVU38
LDVU46:
        add     r11, r11, #1
        mvn     r4, #0
        mov     r0, r11, lsl #16
        mov     r11, r0, asr #16
        b       LDVU38
LDVU47:
        ldr     r0, [sp, #0x48]
        mov     lr, #1
        mov     r4, lr
        sub     r0, r0, #1
        mov     r0, r0, lsl #16
        mov     r11, r0, asr #16
        b       LDVU19
LDVU48:
        ldr     r0, [sp, #0x38]
        add     r1, r2, #6
        mov     r1, r1, lsl #16
        sub     r0, r0, #2
        mov     r2, r1, asr #16
        b       LDVU16
LDVU49:
        ldr     r0, [sp, #0x48]
        mov     r4, #3
        sub     r0, r0, #1
        mov     r0, r0, lsl #16
        mov     r11, r0, asr #16
        b       LDVU38
LDVU50:
        add     r11, r11, #1
        mvn     r4, #0
        mov     r0, r11, lsl #16
        mov     r11, r0, asr #16
        b       LDVU38
LDVU51:
        ldr     r0, [sp, #0x48]
        sub     r0, r0, #1
        mov     r12, r0, lsl #16
        mov     r0, #1
        mov     r11, r12, asr #16
        mov     r4, r0
        b       LDVU25
LDVU52:
        ldr     r0, [sp, #0x38]
        add     r1, r2, #6
        mov     r1, r1, lsl #16
        sub     r0, r0, #2
        mov     r2, r1, asr #16
        b       LDVU22
LDVU53:
        ldr     r0, [sp, #0x48]
        mov     r4, #3
        sub     r0, r0, #1
        mov     r0, r0, lsl #16
        mov     r11, r0, asr #16
        b       LDVU38
LDVU54:
        add     r11, r11, #1
        mvn     r4, #0
        mov     r0, r11, lsl #16
        mov     r11, r0, asr #16
        b       LDVU38
LDVU55:
        ldr     r0, [sp, #0x48]
        mov     lr, #1
        mov     r4, lr
        sub     r0, r0, #1
        mov     r0, r0, lsl #16
        mov     r11, r0, asr #16
        b       LDVU31
LDVU56:
        ldr     r0, [sp, #0x38]
        add     r1, r2, #6
        mov     r1, r1, lsl #16
        sub     r0, r0, #2
        mov     r2, r1, asr #16
        b       LDVU28
LDVU57:
        ldr     r0, [sp, #0x48]
        mov     r4, #3
        sub     r0, r0, #1
        mov     r0, r0, lsl #16
        mov     r11, r0, asr #16
        b       LDVU38
LDVU58:
        add     r11, r11, #1
        mvn     r4, #0
        mov     r0, r11, lsl #16
        mov     r11, r0, asr #16
        b       LDVU38
LDVU59:
        ldr     r0, [sp, #0x48]
        mov     lr, #1
        mov     r4, lr
        sub     r0, r0, #1
        mov     r0, r0, lsl #16
        mov     r11, r0, asr #16
        b       LDVU37
LDVU60:
        ldr     r0, [sp, #0x38]
        add     r1, r2, #6
        mov     r1, r1, lsl #16
        sub     r0, r0, #2
        mov     r2, r1, asr #16
        b       LDVU34
LDVU61:
        mvn     r0, #7
        add     sp, sp, #0xA0
        ldmia   sp!, {r4 - r11, pc}
LDVU_ownInterpol3or6:
        stmdb   sp!, {r4 - r8, lr}
        cmp     r2, #0
        beq     LDVU62
        mov     r1, r1, lsl #1
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
LDVU62:
        cmp     r1, #0
        blt     LDVU64
LDVU63:
        ldr     r2, [pc, #0x228]
        mov     r3, r1, lsl #1
        rsb     r1, r1, #0
        add     r12, r2, r3
        ldrsh   r6, [r12, #0x18]
        add     r1, r2, r1, lsl #1
        ldrsh   r2, [r2, +r3]
        ldrsh   r4, [r0, #-4]
        ldrsh   r3, [r0, #4]
        ldrsh   lr, [r1, #0x18]
        ldrsh   r5, [r0]
        mul     r4, r4, r6
        mul     r3, r3, lr
        ldrsh   lr, [r0, #8]
        mul     r2, r5, r2
        ldrsh   r5, [r1, #0x30]
        ldrsh   r6, [r12, #0x24]
        ldrsh   r12, [r12, #0xC]
        ldrsh   r8, [r0, #-2]
        mul     lr, lr, r5
        ldrsh   r7, [r0, #-6]
        ldrsh   r5, [r1, #0xC]
        mla     r2, r8, r12, r2
        ldrsh   r12, [r0, #2]
        ldrsh   r0, [r0, #6]
        ldrsh   r1, [r1, #0x24]
        mla     r4, r7, r6, r4
        mla     r3, r12, r5, r3
        mla     lr, r0, r1, lr
        add     r2, r4, r2
        add     lr, r3, lr
        add     lr, r2, lr
        add     r0, lr, #1, 18
        mov     r0, r0, asr #15
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        ldmia   sp!, {r4 - r8, pc}
LDVU64:
        add     r1, r1, #6
        sub     r0, r0, #2
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        b       LDVU63
LDVU_ownEncLag6:
        cmp     r3, #0
        bne     LDVU66
        cmp     r0, #0x5E
        bgt     LDVU65
        add     r2, r0, r0, lsl #2
        add     r2, r0, r2
        add     r1, r2, r1
        sub     r0, r1, #0x69
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        bx      lr
LDVU65:
        add     r0, r0, #0x17, 28
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        bx      lr
LDVU66:
        sub     r0, r0, r2
        add     r2, r0, r0, lsl #2
        add     r2, r0, r2
        add     r2, r1, r2
        add     r0, r2, #3
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        bx      lr
LDVU_ownEncLag3:
        stmdb   sp!, {r4, lr}
        ldr     r4, [sp, #0xC]
        ldr     r12, [sp, #8]
        ldr     lr, [sp, #0x10]
        cmp     r4, #0
        bne     LDVU68
        cmp     r0, #0x55
        bgt     LDVU67
        add     r0, r0, r0, lsl #1
        add     r1, r0, r1
        sub     r0, r1, #0x3A
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        ldmia   sp!, {r4, pc}
LDVU67:
        add     r0, r0, #0x70
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        ldmia   sp!, {r4, pc}
LDVU68:
        cmp     lr, #0
        bne     LDVU69
        sub     r0, r0, r3
        add     r0, r0, r0, lsl #1
        add     r0, r1, r0
        add     r0, r0, #2
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        ldmia   sp!, {r4, pc}
LDVU69:
        sub     lr, r2, r3
        cmp     lr, #5
        ble     LDVU70
        add     r3, r3, #5
        mov     r3, r3, lsl #16
        mov     r2, r3, asr #16
LDVU70:
        sub     r3, r12, r2
        cmp     r3, #4
        ble     LDVU71
        sub     r12, r12, #4
        mov     r12, r12, lsl #16
        mov     r2, r12, asr #16
LDVU71:
        add     r12, r0, r0, lsl #1
        add     r1, r12, r1
        add     r3, r2, r2, lsl #1
        sub     r12, r3, #6
        mov     r1, r1, lsl #16
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        cmp     r12, r1, asr #16
        blt     LDVU72
        sub     r0, r0, r2
        add     r0, r0, #5
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        ldmia   sp!, {r4, pc}
LDVU72:
        add     r3, r3, #3
        cmp     r3, r1, asr #16
        ble     LDVU73
        rsb     r1, r12, r1, asr #16
        add     r0, r1, #3
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        ldmia   sp!, {r4, pc}
LDVU73:
        sub     r0, r0, r2
        add     r0, r0, #0xB
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        ldmia   sp!, {r4, pc}
        .long   LDVU_SearchPrm
        .long   LDVU_SearchPrm
        .long   LDVU_SearchPrm
        .long   LDVU_SearchPrm
        .long   LDVU_SearchPrm
        .long   LDVU_SearchPrm
        .long   LDVU_SearchPrm
        .long   LDVU_SearchPrm
        .long   LDVU_SearchPrm
        .long   LDVU_inter_6


        .data
        .align  4


LDVU_SearchPrm:
        .byte   0x54,0x00,0x01,0x00,0xFE,0xFF,0x02,0x00,0x05,0x00,0x0A,0x00,0x05,0x00,0x09,0x00
        .byte   0x14,0x00,0x54,0x00,0x01,0x00,0xFE,0xFF,0x02,0x00,0x05,0x00,0x0A,0x00,0x05,0x00
        .byte   0x09,0x00,0x14,0x00,0x54,0x00,0x01,0x00,0xFE,0xFF,0x02,0x00,0x03,0x00,0x06,0x00
        .byte   0x05,0x00,0x09,0x00,0x14,0x00,0x54,0x00,0x01,0x00,0xFE,0xFF,0x02,0x00,0x03,0x00
        .byte   0x06,0x00,0x05,0x00,0x09,0x00,0x14,0x00,0x54,0x00,0x01,0x00,0xFE,0xFF,0x02,0x00
        .byte   0x03,0x00,0x06,0x00,0x05,0x00,0x09,0x00,0x14,0x00,0x54,0x00,0x01,0x00,0xFE,0xFF
        .byte   0x02,0x00,0x03,0x00,0x06,0x00,0x0A,0x00,0x13,0x00,0x14,0x00,0x54,0x00,0x01,0x00
        .byte   0xFE,0xFF,0x02,0x00,0x03,0x00,0x06,0x00,0x05,0x00,0x09,0x00,0x14,0x00,0x5E,0x00
        .byte   0x00,0x00,0xFD,0xFF,0x03,0x00,0x03,0x00,0x06,0x00,0x05,0x00,0x09,0x00,0x12,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00


        .data
        .align  4


LDVU_inter_6:
        .byte   0x4F,0x73,0x9C,0x6E,0x4A,0x61,0x7E,0x4D,0x48,0x36,0x09,0x1F,0xC3,0x0A,0x99,0xFB
        .byte   0x7D,0xF2,0x30,0xEF,0x7F,0xF0,0xAD,0xF4,0xE7,0xF9,0xB0,0xFE,0x16,0x02,0xCA,0x03
        .byte   0xFF,0x03,0x37,0x03,0x04,0x02,0xDC,0x00,0x00,0x00,0x7D,0xFF,0x3E,0xFF,0x29,0xFF
        .byte   0x00,0x00


