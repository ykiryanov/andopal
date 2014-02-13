        .text
        .align  4
        .globl  _ippsFIR_Direct_16s_ISfs


_ippsFIR_Direct_16s_ISfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x30
        ldr     lr, [sp, #0x54]
        ldr     r12, [sp, #0x58]
        ldr     r4, [sp, #0x5C]
        cmp     r0, #0
        beq     LCRR15
        cmp     r2, #0
        beq     LCRR15
        cmp     lr, #0
        beq     LCRR15
        cmp     r12, #0
        beq     LCRR15
        cmp     r1, #0
        ble     LCRR14
        cmp     r3, #0
        ble     LCRR13
        ldr     r9, [r12]
        cmp     r9, r3
        blt     LCRR1
LCRR0:
        mvn     r0, #0x17
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LCRR1:
        cmp     r9, #0
        blt     LCRR0
        cmp     r1, #0
        add     r8, r4, #0xF
        add     r5, r4, #0xE
        ble     LCRR11
        mvn     r4, #0xFF
        bic     r4, r4, #0x7F, 24
        sub     r2, r2, #2
        sub     r11, r3, #6
        mvn     r4, r4
        mov     r10, #0
        mov     r7, #0
        add     r6, lr, r3, lsl #1
        str     r11, [sp, #4]
        str     r2, [sp]
LCRR2:
        mov     r10, r7, lsl #1
        ldrsh   r2, [r0, +r10]
        mov     r9, r9, lsl #1
        strh    r2, [r6, +r9]
        ldr     r9, [r12]
        mov     r9, r9, lsl #1
        strh    r2, [lr, +r9]
        ldr     r2, [r12]
        add     r2, r2, #1
        cmp     r2, r3
        strlt   r2, [r12]
        blt     LCRR3
        mov     r9, #0
        mov     r2, #0
        str     r9, [r12]
LCRR3:
        cmp     r3, #0
        add     r2, lr, r2, lsl #1
        movle   r11, #0
        ble     LCRR7
        cmp     r3, #6
        movlt   r9, #0
        movlt   r11, r9
        blt     LCRR5
        str     r2, [sp, #8]
        str     r4, [sp, #0x18]
        str     r6, [sp, #0x1C]
        str     r5, [sp, #0x24]
        ldr     r6, [sp, #8]
        ldr     r4, [sp, #4]
        ldr     r5, [sp]
        mov     r9, #0
        mov     r11, r9
        str     r7, [sp, #0x20]
        str     r8, [sp, #0x28]
        str     r12, [sp, #0x2C]
        str     lr, [sp, #0xC]
        str     r1, [sp, #0x10]
        str     r0, [sp, #0x14]
LCRR4:
        sub     r0, r3, r9
        ldrsh   r7, [r6]
        mov     r0, r0, lsl #1
        ldrsh   r8, [r5, +r0]
        ldrsh   r1, [r6, #2]
        ldrsh   r12, [r6, #4]
        ldrsh   lr, [r6, #6]
        mla     r11, r8, r7, r11
        sub     r7, r0, #2
        ldrsh   r8, [r5, +r7]
        sub     r7, r0, #4
        ldrsh   r7, [r5, +r7]
        mla     r8, r8, r1, r11
        sub     r1, r0, #6
        ldrsh   r1, [r5, +r1]
        ldrsh   r11, [r6, #8]
        sub     r0, r0, #8
        mla     r8, r7, r12, r8
        ldrsh   r0, [r5, +r0]
        add     r6, r6, #0xA
        add     r9, r9, #5
        cmp     r9, r4
        mla     r8, r1, lr, r8
        mla     r11, r0, r11, r8
        ble     LCRR4
        ldr     r4, [sp, #0x18]
        ldr     r6, [sp, #0x1C]
        ldr     r7, [sp, #0x20]
        ldr     r5, [sp, #0x24]
        ldr     r8, [sp, #0x28]
        ldr     r12, [sp, #0x2C]
        ldr     lr, [sp, #0xC]
        ldr     r1, [sp, #0x10]
        ldr     r0, [sp, #0x14]
LCRR5:
        str     r1, [sp, #0x10]
        ldr     r1, [sp]
        add     r2, r2, r9, lsl #1
        str     lr, [sp, #0xC]
        str     r0, [sp, #0x14]
LCRR6:
        ldrsh   r0, [r2], #2
        sub     lr, r3, r9
        add     r9, r9, #1
        mov     lr, lr, lsl #1
        ldrsh   lr, [r1, +lr]
        cmp     r9, r3
        mla     r11, lr, r0, r11
        blt     LCRR6
        ldr     lr, [sp, #0xC]
        ldr     r1, [sp, #0x10]
        ldr     r0, [sp, #0x14]
LCRR7:
        cmp     r8, #0
        ble     LCRR12
        mov     r2, r11, asr r8
        and     r2, r2, #1
        mov     r9, #1
        add     r2, r11, r2
        add     r9, r2, r9, lsl r5
        sub     r2, r9, #1
        mov     r11, r2, asr r8
LCRR8:
        cmp     r4, r11
        bge     LCRR9
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r11, r2
        b       LCRR10
LCRR9:
        cmn     r11, #2, 18
        movlt   r2, #0
        sublt   r11, r2, #2, 18
LCRR10:
        add     r7, r7, #1
        cmp     r7, r1
        strh    r11, [r0, +r10]
        ldrlt   r9, [r12]
        blt     LCRR2
LCRR11:
        mov     r0, #0
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LCRR12:
        cmp     r8, #0
        rsblt   r2, r8, #0
        movlt   r11, r11, lsl r2
        b       LCRR8
LCRR13:
        mvn     r0, #0x19
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LCRR14:
        mvn     r0, #5
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LCRR15:
        mvn     r0, #7
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}


