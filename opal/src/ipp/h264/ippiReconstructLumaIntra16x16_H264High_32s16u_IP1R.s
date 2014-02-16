        .text
        .align  4
        .globl  ippiReconstructLumaIntra16x16_H264High_32s16u_IP1R


ippiReconstructLumaIntra16x16_H264High_32s16u_IP1R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x84
        and     r12, r2, #4
        and     r3, r2, #1
        cmp     r0, #0
        and     r2, r2, #0x10
        beq     LKVW73
        ldr     lr, [r0]
        cmp     lr, #0
        beq     LKVW73
        ldr     r8, [r0, #4]
        cmp     r8, #0
        beq     LKVW73
        ldr     lr, [lr]
        cmp     lr, #0
        beq     LKVW73
        ldr     lr, [r0, #0x14]
        cmp     lr, #0
        beq     LKVW73
        ldr     r7, [r0, #8]
        cmp     r7, #0
        ble     LKVW72
        ldr     lr, [r0, #0x10]
        cmp     lr, #0
        blt     LKVW0
        ldr     r6, [r0, #0x1C]
        add     r4, r6, r6, lsl #2
        add     r4, r6, r4
        add     r4, r4, #3
        cmp     lr, r4
        bgt     LKVW0
        subs    r1, r1, #3
        mov     r5, #1
        beq     LKVW64
        adds    r1, r1, #1
        beq     LKVW54
        adds    r1, r1, #1
        beq     LKVW50
        adds    r1, r1, #1
        beq     LKVW1
LKVW0:
        mvn     r0, #0xA
        add     sp, sp, #0x84
        ldmia   sp!, {r4 - r11, pc}
LKVW1:
        cmp     r12, #0
        beq     LKVW2
        mvn     r0, #0x74
        add     sp, sp, #0x84
        ldmia   sp!, {r4 - r11, pc}
LKVW2:
        sub     r7, r8, r7, lsl #1
        mov     r1, #0x10
LKVW3:
        mov     r3, r7
        mov     r12, #0
        mov     r2, #0x10
LKVW4:
        ldrh    lr, [r3], #2
        subs    r2, r2, #1
        strh    lr, [r8, +r12]
        add     r12, r12, #2
        bne     LKVW4
        ldr     r2, [r0, #8]
        subs    r1, r1, #1
        add     r8, r8, r2, lsl #1
        bne     LKVW3
LKVW5:
        ldr     r9, [r0, #0xC]
        mvn     r1, #0xFE, 16
        bic     r1, r1, #0xFF, 8
        tst     r9, r1
        beq     LKVW38
        ldr     r1, [pc, #0xD10]
        tst     r9, #1
        mov     r3, #0
        mov     r2, #1
        beq     LKVW12
        ldr     r12, [r0]
        ldr     r1, [r12]
        add     lr, r1, #0x40
        str     lr, [r12]
        ldr     r12, [r0, #0x18]
        cmp     r12, #0
        beq     LKVW6
        ldr     r12, [r0, #0x10]
        cmp     r12, #0
        ldrle   r9, [r0, #0xC]
        ble     LKVW12
LKVW6:
        add     r5, sp, #0x74
        add     r4, sp, #0x74
        add     lr, sp, #0x74
        str     r1, [r5]
        add     r7, r1, #0x10
        add     r6, r1, #0x20
        add     r12, sp, #0x74
        str     r7, [r4, #4]
        str     r6, [lr, #8]
        add     r5, r1, #0x30
        str     r5, [r12, #0xC]
        mov     r4, r1
        mov     lr, #4
LKVW7:
        ldr     r12, [r4]
        ldr     r8, [r7]
        ldr     r10, [r6]
        ldr     r11, [r5]
        subs    lr, lr, #1
        add     r9, r12, r8
        sub     r12, r12, r8
        add     r8, r10, r11
        sub     r10, r10, r11
        add     r11, r9, r8
        str     r11, [r4], #4
        sub     r9, r9, r8
        str     r9, [r7], #4
        sub     r8, r12, r10
        str     r8, [r6], #4
        add     r12, r10, r12
        str     r12, [r5], #4
        bne     LKVW7
        mov     r4, r3
LKVW8:
        add     r12, sp, #0x74
        ldr     r12, [r12, +r4, lsl #2]
        add     r4, r4, #1
        cmp     r4, #4
        ldr     lr, [r12, #4]
        ldr     r8, [r12]
        ldr     r7, [r12, #8]
        ldr     r6, [r12, #0xC]
        add     r5, r8, lr
        sub     lr, r8, lr
        add     r8, r7, r6
        sub     r6, r7, r6
        add     r7, r5, r8
        sub     r5, r5, r8
        str     r5, [r12, #4]
        sub     r5, lr, r6
        add     lr, r6, lr
        str     r7, [r12]
        str     r5, [r12, #8]
        str     lr, [r12, #0xC]
        blt     LKVW8
        ldr     r4, [pc, #0xC00]
        ldr     lr, [r0, #0x10]
        mov     r12, #0x10
        smull   r4, r5, lr, r4
        sub     r4, r5, lr, asr #31
        cmp     r4, #6
        blt     LKVW10
        sub     lr, r4, #6
        mov     r4, r1
LKVW9:
        ldr     r6, [r0, #0x14]
        ldr     r5, [r4]
        subs    r12, r12, #1
        ldrsh   r6, [r6]
        mul     r5, r6, r5
        mov     r5, r5, lsl lr
        str     r5, [r4], #4
        bne     LKVW9
        ldr     r9, [r0, #0xC]
        b       LKVW12
LKVW10:
        rsb     lr, r4, #5
        mov     lr, r2, lsl lr
        rsb     r4, r4, #6
        mov     r5, r1
LKVW11:
        ldr     r7, [r0, #0x14]
        ldr     r6, [r5]
        subs    r12, r12, #1
        ldrsh   r7, [r7]
        mla     r6, r7, r6, lr
        mov     r6, r6, asr r4
        str     r6, [r5], #4
        bne     LKVW11
        ldr     r9, [r0, #0xC]
LKVW12:
        ldr     r6, [r0, #4]
        ldr     lr, [pc, #0xB80]
        ldr     r12, [pc, #0xB80]
        mov     r4, r3
        add     r8, sp, #0x74
        add     r10, sp, #0x74
        add     r11, sp, #0x74
        mov     r5, #2
        mov     r7, r4
LKVW13:
        ldrb    r8, [r3, +lr]
        ldr     r8, [r1, +r8, lsl #2]
        cmp     r8, #0
        addne   r7, sp, #0x70
        tst     r9, r5
        beq     LKVW14
        ldr     r10, [r0]
        ldr     r4, [r10]
        add     r9, r4, #0x40
        str     r9, [r10]
LKVW14:
        cmp     r4, #0
        beq     LKVW40
        cmp     r7, #0
        moveq   r8, #0
        strne   r8, [sp, #0x70]
        ldrne   r8, [r7]
        str     r8, [r4]
        ldr     r8, [pc, #0xB18]
        ldr     r10, [r0, #0x10]
        ldr     r9, [r0, #0x18]
        smull   r8, r11, r10, r8
        cmp     r9, #0
        sub     r8, r11, r10, asr #31
        beq     LKVW15
        cmp     r10, #0
        movle   r10, #0
        ble     LKVW20
LKVW15:
        mov     r11, #1
        str     r11, [sp, #0x24]
        rsb     r9, r8, #3
        mov     r9, r2, lsl r9
        str     r11, [sp, #0x14]
        str     r9, [sp, #0x1C]
        sub     r11, r8, #4
        str     r11, [sp, #0x18]
        rsb     r9, r8, #4
        str     r9, [sp, #0x20]
        str     r5, [sp, #0x10]
        str     r6, [sp, #0xC]
        str     r3, [sp]
        ldr     r2, [sp, #0x24]
        ldr     r3, [sp, #0x20]
        ldr     r5, [sp, #0x1C]
        ldr     r6, [sp, #0x18]
        ldr     r11, [sp, #0x14]
        mov     r10, #0
        mov     r9, #2
        str     r1, [sp, #4]
LKVW16:
        ldr     r1, [r4, +r11, lsl #2]
        cmp     r1, #0
        beq     LKVW19
        ldr     r10, [r0, #0x14]
        cmp     r8, #4
        bge     LKVW17
        ldrsh   r10, [r10, +r9]
        mla     r10, r1, r10, r5
        mov     r1, r10, asr r3
        b       LKVW18
LKVW17:
        ldrsh   r10, [r10, +r9]
        mul     r10, r1, r10
        mov     r1, r10, lsl r6
LKVW18:
        str     r1, [r4, +r2, lsl #2]
        mov     r10, #1
LKVW19:
        add     r11, r11, #1
        cmp     r11, #0x10
        add     r9, r9, #2
        add     r2, r2, #1
        blt     LKVW16
        ldr     r5, [sp, #0x10]
        ldr     r6, [sp, #0xC]
        ldr     r1, [sp, #4]
        ldr     r3, [sp]
        mov     r2, #1
LKVW20:
        cmp     r10, #0
        ldrne   r8, [r0, #0x18]
        bne     LKVW21
        ldr     r8, [r0, #0x10]
        cmp     r8, #0
        bne     LKVW31
        ldr     r8, [r0, #0x18]
        cmp     r8, #0
        beq     LKVW31
LKVW21:
        add     r7, sp, #0x74
        str     r4, [r7]
        add     r7, sp, #0x74
        add     r9, r4, #0x10
        str     r9, [r7, #4]
        cmp     r8, #0
        add     r7, sp, #0x74
        add     r8, r4, #0x20
        str     r8, [r7, #8]
        add     r7, r4, #0x30
        add     r10, sp, #0x74
        str     r7, [r10, #0xC]
        beq     LKVW22
        ldr     r10, [r0, #0x10]
        cmp     r10, #0
        ble     LKVW25
LKVW22:
        mov     r10, #0
        str     r5, [sp, #0x10]
        str     r6, [sp, #0xC]
        str     r1, [sp, #4]
        str     r3, [sp]
        str     r0, [sp, #8]
LKVW23:
        add     r0, sp, #0x74
        ldr     r0, [r0, +r10, lsl #2]
        add     r10, r10, #1
        cmp     r10, #3
        ldr     r1, [r0]
        ldr     r3, [r0, #8]
        ldr     r5, [r0, #4]
        ldr     r6, [r0, #0xC]
        add     r2, r1, r3
        sub     r1, r1, r3
        rsb     r3, r6, r5, asr #1
        add     r5, r5, r6, asr #1
        add     r11, r2, r5
        add     r6, r1, r3
        sub     r1, r1, r3
        sub     r2, r2, r5
        str     r11, [r0]
        str     r6, [r0, #4]
        str     r1, [r0, #8]
        str     r2, [r0, #0xC]
        ble     LKVW23
        ldr     r6, [sp, #0xC]
        ldr     r1, [sp, #4]
        ldr     r3, [sp]
        ldr     r0, [sp, #8]
        ldr     r5, [sp, #0x10]
        mov     r2, #1
        mov     r10, #0
        str     r6, [sp, #0xC]
        str     r1, [sp, #4]
        str     r3, [sp]
        str     r0, [sp, #8]
LKVW24:
        ldr     r1, [r8]
        ldr     r2, [r4, +r10, lsl #2]
        ldr     r0, [r9]
        ldr     r11, [r7]
        add     r3, r2, r1
        sub     r1, r2, r1
        add     r6, r0, r11, asr #1
        rsb     r0, r11, r0, asr #1
        add     r2, r3, r6
        add     r11, r1, r0
        add     r2, r2, #0x20
        sub     r1, r1, r0
        add     r11, r11, #0x20
        mov     r2, r2, asr #6
        str     r2, [r4, +r10, lsl #2]
        sub     r3, r3, r6
        add     r0, r1, #0x20
        mov     r11, r11, asr #6
        str     r11, [r9], #4
        add     r3, r3, #0x20
        mov     r0, r0, asr #6
        str     r0, [r8], #4
        mov     r3, r3, asr #6
        add     r10, r10, #1
        str     r3, [r7], #4
        cmp     r10, #3
        ble     LKVW24
        ldr     r6, [sp, #0xC]
        ldr     r1, [sp, #4]
        ldr     r3, [sp]
        ldr     r0, [sp, #8]
        mov     r2, #1
LKVW25:
        mov     r7, r6
        mov     r4, #0
        str     r3, [sp]
LKVW26:
        ldr     r8, [r0, #0x1C]
        add     r3, sp, #0x74
        ldr     r3, [r3, +r4, lsl #2]
        ldrh    r9, [r7]
        mov     r8, r2, lsl r8
        ldr     r11, [r3]
        rsb     r10, r8, #1
        sub     r8, r8, #1
        cmp     r11, r10
        movgt   r10, r11
        cmp     r8, r10
        mov     r11, r10
        movlt   r11, r8
        add     r11, r9, r11
        cmp     r8, r11
        blt     LKVW27
        cmp     r8, r10
        mov     r11, r10
        movlt   r11, r8
        adds    r11, r9, r11
        movmi   r8, #0
        bmi     LKVW27
        cmp     r8, r10
        movlt   r10, r8
        add     r8, r10, r9
LKVW27:
        strh    r8, [r7]
        ldr     r9, [r0, #0x1C]
        ldr     r10, [r3, #4]
        ldrh    r8, [r7, #2]
        mov     r11, r2, lsl r9
        rsb     r9, r11, #1
        cmp     r10, r9
        movgt   r9, r10
        sub     r10, r11, #1
        cmp     r10, r9
        mov     r11, r9
        movlt   r11, r10
        add     r11, r8, r11
        cmp     r10, r11
        blt     LKVW28
        cmp     r10, r9
        mov     r11, r9
        movlt   r11, r10
        adds    r11, r8, r11
        movmi   r10, #0
        bmi     LKVW28
        cmp     r10, r9
        movlt   r9, r10
        add     r10, r8, r9
LKVW28:
        strh    r10, [r7, #2]
        ldr     r9, [r0, #0x1C]
        ldr     r10, [r3, #8]
        ldrh    r8, [r7, #4]
        mov     r11, r2, lsl r9
        rsb     r9, r11, #1
        cmp     r10, r9
        movgt   r9, r10
        sub     r10, r11, #1
        cmp     r10, r9
        mov     r11, r9
        movlt   r11, r10
        add     r11, r8, r11
        cmp     r10, r11
        blt     LKVW29
        cmp     r10, r9
        mov     r11, r9
        movlt   r11, r10
        adds    r11, r8, r11
        movmi   r10, #0
        bmi     LKVW29
        cmp     r10, r9
        movlt   r9, r10
        add     r10, r8, r9
LKVW29:
        strh    r10, [r7, #4]
        ldr     r9, [r0, #0x1C]
        ldr     r3, [r3, #0xC]
        ldrh    r8, [r7, #6]
        mov     r10, r2, lsl r9
        rsb     r9, r10, #1
        cmp     r3, r9
        movgt   r9, r3
        sub     r3, r10, #1
        cmp     r3, r9
        mov     r10, r9
        movlt   r10, r3
        add     r10, r8, r10
        cmp     r3, r10
        blt     LKVW30
        cmp     r3, r9
        mov     r10, r9
        movlt   r10, r3
        adds    r10, r8, r10
        movmi   r3, #0
        bmi     LKVW30
        cmp     r3, r9
        movlt   r9, r3
        add     r3, r8, r9
LKVW30:
        strh    r3, [r7, #6]
        ldr     r8, [r0, #8]
        add     r4, r4, #1
        cmp     r4, #4
        add     r7, r7, r8, lsl #1
        blt     LKVW26
        ldr     r3, [sp]
        mov     r7, #0
        mov     r4, r7
        b       LKVW37
LKVW31:
        ldr     r8, [r4]
        mov     r11, r6
        mov     r10, #4
        add     r8, r8, #0x20
        str     r6, [sp, #0xC]
        str     r1, [sp, #4]
        mov     r9, r8, asr #6
        str     r3, [sp]
LKVW32:
        ldr     r1, [r0, #0x1C]
        ldrh    r3, [r11]
        mov     r1, r2, lsl r1
        rsb     r6, r1, #1
        cmp     r9, r6
        movgt   r6, r9
        sub     r1, r1, #1
        cmp     r1, r6
        mov     r8, r6
        movlt   r8, r1
        add     r8, r3, r8
        cmp     r1, r8
        blt     LKVW33
        cmp     r1, r6
        mov     r8, r6
        movlt   r8, r1
        adds    r8, r3, r8
        movmi   r1, #0
        bmi     LKVW33
        cmp     r1, r6
        movlt   r6, r1
        add     r1, r3, r6
LKVW33:
        strh    r1, [r11]
        ldr     r1, [r0, #0x1C]
        ldrh    r3, [r11, #2]
        mov     r1, r2, lsl r1
        rsb     r6, r1, #1
        cmp     r9, r6
        movgt   r6, r9
        sub     r1, r1, #1
        cmp     r1, r6
        mov     r8, r6
        movlt   r8, r1
        add     r8, r3, r8
        cmp     r1, r8
        blt     LKVW34
        cmp     r1, r6
        mov     r8, r6
        movlt   r8, r1
        adds    r8, r3, r8
        movmi   r1, #0
        bmi     LKVW34
        cmp     r1, r6
        movlt   r6, r1
        add     r1, r3, r6
LKVW34:
        strh    r1, [r11, #2]
        ldr     r1, [r0, #0x1C]
        ldrh    r3, [r11, #4]
        mov     r1, r2, lsl r1
        rsb     r6, r1, #1
        cmp     r9, r6
        movgt   r6, r9
        sub     r1, r1, #1
        cmp     r1, r6
        mov     r8, r6
        movlt   r8, r1
        add     r8, r3, r8
        cmp     r1, r8
        blt     LKVW35
        cmp     r1, r6
        mov     r8, r6
        movlt   r8, r1
        adds    r8, r3, r8
        movmi   r1, #0
        bmi     LKVW35
        cmp     r1, r6
        movlt   r6, r1
        add     r1, r3, r6
LKVW35:
        strh    r1, [r11, #4]
        ldr     r1, [r0, #0x1C]
        ldrh    r3, [r11, #6]
        mov     r1, r2, lsl r1
        rsb     r6, r1, #1
        cmp     r9, r6
        movgt   r6, r9
        sub     r1, r1, #1
        cmp     r1, r6
        mov     r8, r6
        movlt   r8, r1
        add     r8, r3, r8
        cmp     r1, r8
        blt     LKVW36
        cmp     r1, r6
        mov     r8, r6
        movlt   r8, r1
        adds    r8, r3, r8
        movmi   r1, #0
        bmi     LKVW36
        cmp     r1, r6
        movlt   r6, r1
        add     r1, r3, r6
LKVW36:
        strh    r1, [r11, #6]
        ldr     r8, [r0, #8]
        subs    r10, r10, #1
        add     r11, r11, r8, lsl #1
        bne     LKVW32
        ldr     r6, [sp, #0xC]
        ldr     r1, [sp, #4]
        ldr     r3, [sp]
LKVW37:
        mov     r9, r3, lsl #1
        add     r10, r12, r9
        ldrsb   r9, [r12, +r9]
        ldrsb   r10, [r10, #1]
        add     r3, r3, #1
        mov     r5, r5, lsl #1
        cmp     r3, #0x10
        mla     r9, r8, r10, r9
        add     r6, r6, r9, lsl #1
        ldrcc   r9, [r0, #0xC]
        bcc     LKVW13
        b       LKVW39
LKVW38:
        mov     r0, #0
        add     sp, sp, #0x84
        ldmia   sp!, {r4 - r11, pc}
LKVW39:
        mov     r0, #0
        add     sp, sp, #0x84
        ldmia   sp!, {r4 - r11, pc}
LKVW40:
        cmp     r7, #0
        ldreq   r8, [r0, #8]
        beq     LKVW37
        ldr     r9, [r0, #0x18]
        str     r8, [sp, #0x70]
        cmp     r9, #0
        beq     LKVW41
        ldr     r8, [r0, #0x10]
        cmp     r8, #0
        ble     LKVW48
LKVW41:
        ldr     r7, [r7]
        mov     r10, r6
        mov     r9, #4
        add     r7, r7, #0x20
        str     r1, [sp, #4]
        str     r3, [sp]
        mov     r7, r7, asr #6
LKVW42:
        ldr     r1, [r0, #0x1C]
        ldrh    r3, [r10]
        mov     r1, r2, lsl r1
        rsb     r8, r1, #1
        cmp     r7, r8
        movgt   r8, r7
        sub     r1, r1, #1
        cmp     r1, r8
        mov     r11, r8
        movlt   r11, r1
        add     r11, r3, r11
        cmp     r1, r11
        blt     LKVW43
        cmp     r1, r8
        mov     r11, r8
        movlt   r11, r1
        adds    r11, r3, r11
        movmi   r1, #0
        bmi     LKVW43
        cmp     r1, r8
        movlt   r8, r1
        add     r1, r3, r8
LKVW43:
        strh    r1, [r10]
        ldr     r1, [r0, #0x1C]
        ldrh    r3, [r10, #2]
        mov     r1, r2, lsl r1
        rsb     r8, r1, #1
        cmp     r7, r8
        movgt   r8, r7
        sub     r1, r1, #1
        cmp     r1, r8
        mov     r11, r8
        movlt   r11, r1
        add     r11, r3, r11
        cmp     r1, r11
        blt     LKVW44
        cmp     r1, r8
        mov     r11, r8
        movlt   r11, r1
        adds    r11, r3, r11
        movmi   r1, #0
        bmi     LKVW44
        cmp     r1, r8
        movlt   r8, r1
        add     r1, r3, r8
LKVW44:
        strh    r1, [r10, #2]
        ldr     r1, [r0, #0x1C]
        ldrh    r3, [r10, #4]
        mov     r1, r2, lsl r1
        rsb     r8, r1, #1
        cmp     r7, r8
        movgt   r8, r7
        sub     r1, r1, #1
        cmp     r1, r8
        mov     r11, r8
        movlt   r11, r1
        add     r11, r3, r11
        cmp     r1, r11
        blt     LKVW45
        cmp     r1, r8
        mov     r11, r8
        movlt   r11, r1
        adds    r11, r3, r11
        movmi   r1, #0
        bmi     LKVW45
        cmp     r1, r8
        movlt   r8, r1
        add     r1, r3, r8
LKVW45:
        strh    r1, [r10, #4]
        ldr     r1, [r0, #0x1C]
        ldrh    r3, [r10, #6]
        mov     r1, r2, lsl r1
        rsb     r8, r1, #1
        cmp     r7, r8
        movgt   r8, r7
        sub     r1, r1, #1
        cmp     r1, r8
        mov     r11, r8
        movlt   r11, r1
        add     r11, r3, r11
        cmp     r1, r11
        blt     LKVW46
        cmp     r1, r8
        mov     r11, r8
        movlt   r11, r1
        adds    r11, r3, r11
        movmi   r1, #0
        bmi     LKVW46
        cmp     r1, r8
        movlt   r8, r1
        add     r1, r3, r8
LKVW46:
        strh    r1, [r10, #6]
        ldr     r8, [r0, #8]
        subs    r9, r9, #1
        add     r10, r10, r8, lsl #1
        bne     LKVW42
        ldr     r1, [sp, #4]
        ldr     r3, [sp]
LKVW47:
        mov     r7, #0
        b       LKVW37
LKVW48:
        ldr     r9, [r0, #0x1C]
        ldr     r7, [r7]
        ldrh    r8, [r6]
        mov     r10, r2, lsl r9
        rsb     r9, r10, #1
        cmp     r7, r9
        movgt   r9, r7
        sub     r7, r10, #1
        cmp     r7, r9
        str     r9, [sp, #0x18]
        movlt   r9, r7
        add     r9, r8, r9
        cmp     r7, r9
        str     r8, [sp, #0x14]
        blt     LKVW49
        ldr     r8, [sp, #0x18]
        ldr     r9, [sp, #0x14]
        cmp     r7, r8
        movlt   r8, r7
        adds    r8, r9, r8
        movmi   r7, #0
        bmi     LKVW49
        ldr     r8, [sp, #0x18]
        cmp     r7, r8
        movlt   r8, r7
        ldr     r7, [sp, #0x14]
        add     r7, r8, r7
LKVW49:
        strh    r7, [r6]
        ldr     r8, [r0, #8]
        b       LKVW47
LKVW50:
        cmp     r3, #0
        beq     LKVW51
        mvn     r0, #0x74
        add     sp, sp, #0x84
        ldmia   sp!, {r4 - r11, pc}
LKVW51:
        mov     r1, #0x10
LKVW52:
        mov     r3, #0
        mov     r2, #0x10
LKVW53:
        ldrh    r12, [r8, #-2]
        subs    r2, r2, #1
        strh    r12, [r8, +r3]
        add     r3, r3, #2
        bne     LKVW53
        ldr     r2, [r0, #8]
        subs    r1, r1, #1
        add     r8, r8, r2, lsl #1
        bne     LKVW52
        b       LKVW5
LKVW54:
        cmp     r12, #0
        bne     LKVW58
        cmp     r3, #0
        sub     r1, r8, r7, lsl #1
        beq     LKVW56
        mov     r3, #0
        mov     r12, #0x10
LKVW55:
        ldrh    r2, [r1], #2
        subs    r12, r12, #1
        add     r3, r2, r3
        bne     LKVW55
        add     r3, r3, #8
        mov     r1, r3, asr #4
        b       LKVW61
LKVW56:
        mov     r7, r7, lsl #1
        sub     r3, r8, #2
        mov     lr, #0
        mov     r12, #0x10
LKVW57:
        ldrh    r4, [r1], #2
        ldrh    r2, [r3], +r7
        add     lr, r4, lr
        subs    r12, r12, #1
        add     lr, lr, r2
        bne     LKVW57
        add     lr, lr, #0x10
        mov     r1, lr, asr #5
        b       LKVW61
LKVW58:
        cmp     r3, #0
        beq     LKVW59
        sub     r6, r6, #1
        mov     r6, r5, lsl r6
        bic     r1, r6, #0xFF, 8
        bic     r1, r1, #0xFF, 16
        b       LKVW61
LKVW59:
        mov     r7, r7, lsl #1
        sub     r2, r8, #2
        mov     r3, #0
        mov     r12, #0x10
LKVW60:
        ldrh    r1, [r2], +r7
        subs    r12, r12, #1
        add     r3, r3, r1
        bne     LKVW60
        add     r3, r3, #8
        mov     r1, r3, asr #4
LKVW61:
        mov     r2, #0x10
LKVW62:
        mov     r12, #0
        mov     r3, #0x10
LKVW63:
        strh    r1, [r8, +r12]
        subs    r3, r3, #1
        add     r12, r12, #2
        bne     LKVW63
        ldr     r3, [r0, #8]
        subs    r2, r2, #1
        add     r8, r8, r3, lsl #1
        bne     LKVW62
        b       LKVW5
LKVW64:
        cmp     r12, #0
        bne     LKVW65
        cmp     r3, #0
        bne     LKVW65
        cmp     r2, #0
        beq     LKVW66
LKVW65:
        mvn     r0, #0x74
        add     sp, sp, #0x84
        ldmia   sp!, {r4 - r11, pc}
LKVW66:
        mov     r2, #0
        mov     r1, r2
LKVW67:
        sub     lr, r2, #1
        mul     lr, r7, lr
        sub     r4, r2, r7
        add     r3, sp, #0x4C
        mov     r4, r4, lsl #1
        mov     lr, lr, lsl #1
        sub     r4, r4, #2
        ldrh    r4, [r8, +r4]
        sub     lr, lr, #2
        ldrh    lr, [r8, +lr]
        add     r12, sp, #0x28
        add     r2, r2, #1
        strh    r4, [r3, +r1]
        strh    lr, [r12, +r1]
        cmp     r2, #0x11
        add     r1, r1, #2
        blt     LKVW67
        mov     r4, #0
        mov     lr, r4
        mov     r12, #1
        mov     r3, #2
LKVW68:
        rsb     r10, r12, #0
        add     r11, sp, #0x28
        add     r1, sp, #0x28
        add     r2, sp, #0x4C
        add     r11, r11, r10, lsl #1
        ldrh    r11, [r11, #0x10]
        add     r1, r1, r3
        ldrh    r1, [r1, #0x10]
        add     r2, r2, r3
        ldrh    r2, [r2, #0x10]
        add     r9, sp, #0x4C
        add     r10, r9, r10, lsl #1
        ldrh    r9, [r10, #0x10]
        sub     r1, r1, r11
        mla     lr, r12, r1, lr
        add     r3, r3, #2
        sub     r2, r2, r9
        mla     r4, r12, r2, r4
        add     r12, r12, #1
        cmp     r12, #8
        ble     LKVW68
        add     r1, sp, #0x28
        ldrh    r3, [r1, #0x20]
        add     r2, sp, #0x4C
        ldrh    r2, [r2, #0x20]
        add     r4, r4, r4, lsl #2
        add     r12, r4, #0x20
        add     lr, lr, lr, lsl #2
        add     r3, r2, r3
        mov     r1, r12, asr #6
        add     r12, lr, #0x20
        mov     r4, #0
        mov     lr, r4
        mov     r2, r12, asr #6
        sub     r12, r1, r1, lsl #3
        add     r3, r12, r3, lsl #4
        sub     r12, r2, r2, lsl #3
        add     r12, r3, r12
LKVW69:
        mla     r3, r2, r4, r12
        mov     r9, #0
        add     r3, r3, #0x10
LKVW70:
        mla     r7, r4, r7, r9
        mov     r6, r5, lsl r6
        sub     r6, r6, #1
        mov     r10, r3, asr #5
        cmp     r10, r6
        movlt   r6, r10
        cmp     r6, #0
        movlt   r6, lr
        add     r9, r9, #1
        mov     r7, r7, lsl #1
        cmp     r9, #0x10
        add     r3, r3, r1
        strh    r6, [r8, +r7]
        bge     LKVW71
        ldr     r8, [r0, #4]
        ldr     r7, [r0, #8]
        ldr     r6, [r0, #0x1C]
        b       LKVW70
LKVW71:
        add     r4, r4, #1
        cmp     r4, #0x10
        bge     LKVW5
        ldr     r8, [r0, #4]
        ldr     r7, [r0, #8]
        ldr     r6, [r0, #0x1C]
        b       LKVW69
LKVW72:
        mvn     r0, #0xD
        add     sp, sp, #0x84
        ldmia   sp!, {r4 - r11, pc}
LKVW73:
        mvn     r0, #7
        add     sp, sp, #0x84
        ldmia   sp!, {r4 - r11, pc}
        .long   zeroArray32
        .long   0x2aaaaaab
        .long   block_subblock_mapping
        .long   xyoff


