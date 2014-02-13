        .text
        .align  4
        .globl  _ippiReconstructLumaInter8x8_H264High_32s16u_IP1R


_ippiReconstructLumaInter8x8_H264High_32s16u_IP1R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x74
        cmp     r0, #0
        beq     LKVX23
        ldr     r1, [r0]
        cmp     r1, #0
        beq     LKVX23
        ldr     lr, [r0, #4]
        cmp     lr, #0
        beq     LKVX23
        ldr     r1, [r1]
        cmp     r1, #0
        beq     LKVX23
        ldr     r1, [r0, #0x14]
        cmp     r1, #0
        beq     LKVX23
        ldr     r1, [r0, #8]
        cmp     r1, #0
        ble     LKVX22
        ldr     r2, [r0, #0x10]
        cmp     r2, #0
        blt     LKVX21
        ldr     r12, [r0, #0x1C]
        add     r3, r12, r12, lsl #2
        add     r3, r12, r3
        add     r3, r3, #3
        cmp     r2, r3
        bgt     LKVX21
        ldr     r4, [r0, #0xC]
        ldr     r2, [pc, #0x8DC]
        tst     r2, r4, lsl #1
        beq     LKVX20
        ldr     r3, [pc, #0x8D4]
        add     r5, sp, #0x54
        add     r6, sp, #0x54
        add     r7, sp, #0x54
        add     r8, sp, #0x54
        add     r9, sp, #0x54
        add     r10, sp, #0x54
        mov     r12, #2
        mov     r11, #1
        mov     r2, #4
        str     r4, [sp, #0x38]
LKVX0:
        ldr     r4, [sp, #0x38]
        tst     r12, r4, lsl #1
        beq     LKVX19
        ldr     r5, [r0]
        ldr     r1, [r5]
        add     r4, r1, #1, 24
        str     r4, [r5]
        ldr     r4, [r0, #0x18]
        cmp     r4, #0
        ldreq   r5, [r0, #0x10]
        beq     LKVX1
        ldr     r5, [r0, #0x10]
        cmp     r5, #0
        ble     LKVX5
LKVX1:
        ldr     r4, [pc, #0x874]
        smull   r4, r6, r5, r4
        sub     r4, r6, r5, asr #31
        cmp     r4, #6
        blt     LKVX3
        mov     r7, #0
        sub     r4, r4, #6
        mov     r6, r7
        mov     r5, r1
        str     r2, [sp, #4]
        str     r3, [sp, #8]
        str     r12, [sp, #0xC]
        str     lr, [sp, #0x10]
LKVX2:
        ldr     r12, [r0, #0x14]
        ldr     r2, [r5]
        add     r3, r6, #1
        ldrsh   r12, [r12, +r7]
        mov     r10, r3, lsl #1
        add     lr, r6, #2
        add     r9, r6, #3
        mul     r2, r2, r12
        mov     r12, lr, lsl #1
        mov     r8, r9, lsl #1
        add     r7, r7, #8
        add     r6, r6, #4
        mov     r2, r2, lsl r4
        str     r2, [r5], #0x10
        ldr     r11, [r0, #0x14]
        ldr     r2, [r1, +r3, lsl #2]
        ldrsh   r10, [r11, +r10]
        cmp     r6, #0x40
        mul     r10, r2, r10
        mov     r2, r10, lsl r4
        str     r2, [r1, +r3, lsl #2]
        ldr     r3, [r0, #0x14]
        ldr     r2, [r1, +lr, lsl #2]
        ldrsh   r12, [r3, +r12]
        mul     r12, r2, r12
        mov     r2, r12, lsl r4
        str     r2, [r1, +lr, lsl #2]
        ldr     r3, [r0, #0x14]
        ldr     r2, [r1, +r9, lsl #2]
        ldrsh   r8, [r3, +r8]
        mul     r8, r2, r8
        mov     r2, r8, lsl r4
        str     r2, [r1, +r9, lsl #2]
        blt     LKVX2
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #8]
        ldr     r12, [sp, #0xC]
        ldr     lr, [sp, #0x10]
        ldr     r4, [r0, #0x18]
        b       LKVX5
LKVX3:
        rsb     r6, r4, #5
        mov     r5, #1
        mov     r8, #0
        mov     r5, r5, lsl r6
        rsb     r4, r4, #6
        mov     r7, r8
        mov     r6, r1
        str     lr, [sp, #0x10]
LKVX4:
        ldr     r9, [r0, #0x14]
        ldr     r10, [r6]
        add     lr, r7, #1
        ldrsh   r11, [r9, +r8]
        mov     r9, lr, lsl #1
        add     r8, r8, #4
        add     r7, r7, #2
        mla     r11, r10, r11, r5
        cmp     r7, #0x40
        mov     r10, r11, asr r4
        str     r10, [r6], #8
        ldr     r11, [r0, #0x14]
        ldr     r10, [r1, +lr, lsl #2]
        ldrsh   r9, [r11, +r9]
        mla     r9, r10, r9, r5
        mov     r9, r9, asr r4
        str     r9, [r1, +lr, lsl #2]
        blt     LKVX4
        ldr     lr, [sp, #0x10]
        ldr     r4, [r0, #0x18]
LKVX5:
        add     r5, r1, #0x20
        add     r6, r1, #0x40
        add     r7, r1, #0x60
        add     r8, r1, #0x80
        cmp     r4, #0
        add     r9, r1, #0xA0
        str     r5, [sp, #0x1C]
        str     r6, [sp, #0x2C]
        str     r7, [sp, #0x34]
        str     r8, [sp, #0x30]
        str     r9, [sp, #0x28]
        add     r10, r1, #0xC0
        str     r10, [sp, #0x24]
        add     r11, r1, #0xE0
        str     r11, [sp, #0x20]
        add     r4, sp, #0x54
        str     r1, [r4]
        add     r4, sp, #0x54
        str     r5, [r4, #4]
        add     r4, sp, #0x54
        str     r6, [r4, #8]
        add     r4, sp, #0x54
        str     r7, [r4, #0xC]
        add     r4, sp, #0x54
        str     r8, [r4, #0x10]
        add     r4, sp, #0x54
        str     r9, [r4, #0x14]
        add     r4, sp, #0x54
        str     r10, [r4, #0x18]
        add     r4, sp, #0x54
        str     r11, [r4, #0x1C]
        beq     LKVX6
        ldr     r4, [r0, #0x10]
        cmp     r4, #0
        ble     LKVX9
LKVX6:
        mov     r4, #0
        str     r4, [sp]
        str     r1, [sp, #0x18]
        str     r2, [sp, #4]
        str     r3, [sp, #8]
        str     r12, [sp, #0xC]
        str     lr, [sp, #0x10]
        str     r0, [sp, #0x14]
LKVX7:
        ldr     r1, [sp]
        add     r0, sp, #0x54
        ldr     r0, [r0, +r1, lsl #2]
        add     r1, r1, #1
        str     r1, [sp]
        ldr     r12, [r0, #0xC]
        ldr     r2, [r0, #0x1C]
        ldr     r8, [r0, #0x14]
        ldr     lr, [r0, #4]
        cmp     r1, #8
        ldr     r9, [r0]
        ldr     r10, [r0, #0x10]
        ldr     r5, [r0, #8]
        ldr     r4, [r0, #0x18]
        mov     r1, r12, asr #1
        mov     r3, r2, asr #1
        rsb     r1, r1, #0
        rsb     r3, r3, #0
        add     r6, lr, r2
        sub     r1, r1, r12
        sub     r11, r8, r12
        sub     r3, r3, r2
        add     r7, r8, r8, asr #1
        add     r12, r12, r8
        sub     r2, r2, lr
        add     r1, r6, r1
        add     r8, r9, r10
        rsb     r6, r4, r5, asr #1
        add     lr, lr, lr, asr #1
        sub     r9, r9, r10
        add     r4, r5, r4, asr #1
        add     lr, r12, lr
        add     r7, r2, r7
        add     r3, r11, r3
        add     r5, r8, r4
        add     r10, r9, r6
        add     r2, r3, lr, asr #2
        add     r12, r1, r7, asr #2
        sub     r9, r9, r6
        sub     r8, r8, r4
        rsb     r1, r7, r1, asr #2
        sub     lr, lr, r3, asr #2
        add     r7, r5, lr
        add     r3, r10, r1
        add     r4, r12, r9
        add     r6, r2, r8
        sub     r8, r8, r2
        sub     r9, r9, r12
        sub     r10, r10, r1
        sub     r5, r5, lr
        str     r7, [r0]
        str     r3, [r0, #4]
        str     r4, [r0, #8]
        str     r6, [r0, #0xC]
        str     r8, [r0, #0x10]
        str     r9, [r0, #0x14]
        str     r10, [r0, #0x18]
        str     r5, [r0, #0x1C]
        blt     LKVX7
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #8]
        ldr     r12, [sp, #0xC]
        ldr     lr, [sp, #0x10]
        ldr     r0, [sp, #0x14]
        ldr     r1, [sp, #0x18]
        ldr     r6, [sp, #0x24]
        ldr     r7, [sp, #0x28]
        ldr     r5, [sp, #0x1C]
        mov     r4, #8
        str     r4, [sp]
        str     r2, [sp, #4]
        str     r3, [sp, #8]
        str     r12, [sp, #0xC]
        str     lr, [sp, #0x10]
        str     r0, [sp, #0x14]
LKVX8:
        ldr     r0, [sp, #0x20]
        ldr     r2, [sp, #0x34]
        ldr     r10, [r5]
        ldr     r0, [r0]
        ldr     r3, [sp, #0x30]
        ldr     r4, [r2]
        ldr     r2, [r7]
        ldr     r12, [sp, #0x2C]
        ldr     lr, [r1]
        ldr     r3, [r3]
        ldr     r9, [r6]
        ldr     r8, [r12]
        mov     r12, r0, asr #1
        rsb     r12, r12, #0
        sub     r11, r2, r4
        str     r11, [sp, #0x3C]
        sub     r12, r12, r0
        mov     r11, r4, asr #1
        str     r11, [sp, #0x40]
        add     r11, r4, r2
        str     r11, [sp, #0x44]
        add     r11, r10, r10, asr #1
        str     r11, [sp, #0x48]
        add     r11, lr, r3
        str     r11, [sp, #0x4C]
        ldr     r11, [sp, #0x3C]
        add     r2, r2, r2, asr #1
        sub     r3, lr, r3
        add     r12, r11, r12
        str     r12, [sp, #0x3C]
        ldr     r12, [sp, #0x40]
        ldr     r11, [sp, #0x44]
        rsb     r12, r12, #0
        str     r12, [sp, #0x40]
        add     r12, r8, r9, asr #1
        str     r12, [sp, #0x50]
        ldr     r12, [sp, #0x48]
        rsb     r8, r9, r8, asr #1
        add     r12, r11, r12
        add     r11, r10, r0
        str     r11, [sp, #0x48]
        ldr     r11, [sp, #0x40]
        sub     r0, r0, r10
        ldr     r10, [sp, #0x4C]
        sub     r11, r11, r4
        ldr     r4, [sp, #0x50]
        str     r11, [sp, #0x44]
        ldr     lr, [sp, #0x44]
        add     r4, r10, r4
        ldr     r10, [sp, #0x3C]
        sub     r10, r12, r10, asr #2
        str     r10, [sp, #0x40]
        ldr     r10, [sp, #0x48]
        add     lr, r10, lr
        add     r10, r0, r2
        ldr     r0, [sp, #0x40]
        add     r2, r3, r8
        rsb     r9, r10, lr, asr #2
        add     lr, lr, r10, asr #2
        add     r0, r4, r0
        add     r0, r0, #0x20
        sub     r3, r3, r8
        mov     r0, r0, asr #6
        str     r0, [r1], #4
        ldr     r8, [sp, #0x3C]
        ldr     r10, [sp, #0x50]
        add     r0, r2, r9
        add     r0, r0, #0x20
        add     r8, r8, r12, asr #2
        ldr     r12, [sp, #0x4C]
        mov     r0, r0, asr #6
        str     r0, [r5], #4
        ldr     r11, [sp, #0x2C]
        sub     r12, r12, r10
        add     r0, lr, r3
        add     r10, r0, #0x20
        add     r0, r8, r12
        add     r0, r0, #0x20
        mov     r10, r10, asr #6
        str     r10, [r11]
        sub     r12, r12, r8
        ldr     r8, [sp, #0x34]
        mov     r0, r0, asr #6
        add     r12, r12, #0x20
        str     r0, [r8]
        ldr     r0, [sp, #0x30]
        sub     r3, r3, lr
        mov     r12, r12, asr #6
        str     r12, [r0]
        add     r3, r3, #0x20
        sub     r2, r2, r9
        mov     r3, r3, asr #6
        str     r3, [r7], #4
        add     r0, r2, #0x20
        ldr     r2, [sp, #0x40]
        mov     r0, r0, asr #6
        str     r0, [r6], #4
        ldr     r0, [sp, #0x20]
        sub     r4, r4, r2
        add     r4, r4, #0x20
        mov     r2, r4, asr #6
        str     r2, [r0], #4
        ldr     r3, [sp, #0x2C]
        ldr     r2, [sp]
        add     r3, r3, #4
        str     r3, [sp, #0x2C]
        ldr     r3, [sp, #0x34]
        subs    r2, r2, #1
        str     r2, [sp]
        add     r3, r3, #4
        str     r3, [sp, #0x34]
        ldr     r3, [sp, #0x30]
        add     r3, r3, #4
        str     r3, [sp, #0x30]
        str     r0, [sp, #0x20]
        bne     LKVX8
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #8]
        ldr     r12, [sp, #0xC]
        ldr     lr, [sp, #0x10]
        ldr     r0, [sp, #0x14]
LKVX9:
        mov     r5, lr
        mov     r4, #0
        mov     r6, #1
LKVX10:
        ldr     r7, [r0, #0x1C]
        add     r1, sp, #0x54
        ldr     r1, [r1, +r4, lsl #2]
        ldrh    r8, [r5]
        mov     r7, r6, lsl r7
        ldr     r10, [r1]
        rsb     r9, r7, #1
        sub     r7, r7, #1
        cmp     r10, r9
        movgt   r9, r10
        cmp     r7, r9
        mov     r10, r9
        movlt   r10, r7
        add     r10, r8, r10
        cmp     r7, r10
        blt     LKVX11
        cmp     r7, r9
        mov     r10, r9
        movlt   r10, r7
        adds    r10, r8, r10
        movmi   r7, #0
        bmi     LKVX11
        cmp     r7, r9
        movlt   r9, r7
        add     r7, r9, r8
LKVX11:
        strh    r7, [r5]
        ldr     r9, [r0, #0x1C]
        ldr     r7, [r1, #4]
        ldrh    r8, [r5, #2]
        mov     r10, r6, lsl r9
        rsb     r9, r10, #1
        cmp     r7, r9
        movgt   r9, r7
        sub     r7, r10, #1
        cmp     r7, r9
        mov     r10, r9
        movlt   r10, r7
        add     r10, r8, r10
        cmp     r7, r10
        blt     LKVX12
        cmp     r7, r9
        mov     r10, r9
        movlt   r10, r7
        adds    r10, r8, r10
        movmi   r7, #0
        bmi     LKVX12
        cmp     r7, r9
        movlt   r9, r7
        add     r7, r8, r9
LKVX12:
        strh    r7, [r5, #2]
        ldr     r9, [r0, #0x1C]
        ldr     r7, [r1, #8]
        ldrh    r8, [r5, #4]
        mov     r10, r6, lsl r9
        rsb     r9, r10, #1
        cmp     r7, r9
        movgt   r9, r7
        sub     r7, r10, #1
        cmp     r7, r9
        mov     r10, r9
        movlt   r10, r7
        add     r10, r8, r10
        cmp     r7, r10
        blt     LKVX13
        cmp     r7, r9
        mov     r10, r9
        movlt   r10, r7
        adds    r10, r8, r10
        movmi   r7, #0
        bmi     LKVX13
        cmp     r7, r9
        movlt   r9, r7
        add     r7, r8, r9
LKVX13:
        strh    r7, [r5, #4]
        ldr     r9, [r0, #0x1C]
        ldr     r7, [r1, #0xC]
        ldrh    r8, [r5, #6]
        mov     r10, r6, lsl r9
        rsb     r9, r10, #1
        cmp     r7, r9
        movgt   r9, r7
        sub     r7, r10, #1
        cmp     r7, r9
        mov     r10, r9
        movlt   r10, r7
        add     r10, r8, r10
        cmp     r7, r10
        blt     LKVX14
        cmp     r7, r9
        mov     r10, r9
        movlt   r10, r7
        adds    r10, r8, r10
        movmi   r7, #0
        bmi     LKVX14
        cmp     r7, r9
        movlt   r9, r7
        add     r7, r8, r9
LKVX14:
        strh    r7, [r5, #6]
        ldr     r9, [r0, #0x1C]
        ldr     r7, [r1, #0x10]
        ldrh    r8, [r5, #8]
        mov     r10, r6, lsl r9
        rsb     r9, r10, #1
        cmp     r7, r9
        movgt   r9, r7
        sub     r7, r10, #1
        cmp     r7, r9
        mov     r10, r9
        movlt   r10, r7
        add     r10, r8, r10
        cmp     r7, r10
        blt     LKVX15
        cmp     r7, r9
        mov     r10, r9
        movlt   r10, r7
        adds    r10, r8, r10
        movmi   r7, #0
        bmi     LKVX15
        cmp     r7, r9
        movlt   r9, r7
        add     r7, r8, r9
LKVX15:
        strh    r7, [r5, #8]
        ldr     r9, [r0, #0x1C]
        ldr     r7, [r1, #0x14]
        ldrh    r8, [r5, #0xA]
        mov     r10, r6, lsl r9
        rsb     r9, r10, #1
        cmp     r7, r9
        movgt   r9, r7
        sub     r7, r10, #1
        cmp     r7, r9
        mov     r10, r9
        movlt   r10, r7
        add     r10, r8, r10
        cmp     r7, r10
        blt     LKVX16
        cmp     r7, r9
        mov     r10, r9
        movlt   r10, r7
        adds    r10, r8, r10
        movmi   r7, #0
        bmi     LKVX16
        cmp     r7, r9
        movlt   r9, r7
        add     r7, r8, r9
LKVX16:
        strh    r7, [r5, #0xA]
        ldr     r9, [r0, #0x1C]
        ldr     r7, [r1, #0x18]
        ldrh    r8, [r5, #0xC]
        mov     r10, r6, lsl r9
        rsb     r9, r10, #1
        cmp     r7, r9
        movgt   r9, r7
        sub     r7, r10, #1
        cmp     r7, r9
        mov     r10, r9
        movlt   r10, r7
        add     r10, r8, r10
        cmp     r7, r10
        blt     LKVX17
        cmp     r7, r9
        mov     r10, r9
        movlt   r10, r7
        adds    r10, r8, r10
        movmi   r7, #0
        bmi     LKVX17
        cmp     r7, r9
        movlt   r9, r7
        add     r7, r8, r9
LKVX17:
        strh    r7, [r5, #0xC]
        ldr     r8, [r0, #0x1C]
        ldr     r1, [r1, #0x1C]
        ldrh    r7, [r5, #0xE]
        mov     r9, r6, lsl r8
        rsb     r8, r9, #1
        cmp     r1, r8
        movgt   r8, r1
        sub     r1, r9, #1
        cmp     r1, r8
        mov     r9, r8
        movlt   r9, r1
        add     r9, r7, r9
        cmp     r1, r9
        blt     LKVX18
        cmp     r1, r8
        mov     r9, r8
        movlt   r9, r1
        adds    r9, r7, r9
        movmi   r1, #0
        bmi     LKVX18
        cmp     r1, r8
        movlt   r8, r1
        add     r1, r7, r8
LKVX18:
        strh    r1, [r5, #0xE]
        ldr     r1, [r0, #8]
        add     r4, r4, #1
        cmp     r4, #8
        add     r5, r5, r1, lsl #1
        blt     LKVX10
LKVX19:
        ldrsb   r5, [r3, #1]
        ldrsb   r4, [r3, #2]!
        mov     r12, r12, lsl #1
        subs    r2, r2, #1
        mla     r5, r1, r4, r5
        add     lr, lr, r5, lsl #1
        bne     LKVX0
LKVX20:
        mov     r0, #0
        add     sp, sp, #0x74
        ldmia   sp!, {r4 - r11, pc}
LKVX21:
        mvn     r0, #0xA
        add     sp, sp, #0x74
        ldmia   sp!, {r4 - r11, pc}
LKVX22:
        mvn     r0, #0xD
        add     sp, sp, #0x74
        ldmia   sp!, {r4 - r11, pc}
LKVX23:
        mvn     r0, #7
        add     sp, sp, #0x74
        ldmia   sp!, {r4 - r11, pc}
        .long   0x0001fffe
        .long   xyoff8
        .long   0x2aaaaaab


