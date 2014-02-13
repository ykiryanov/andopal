        .text
        .align  4
        .globl  _ippsFIR_Direct_16s_Sfs


_ippsFIR_Direct_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x34
        ldr     r4, [sp, #0x58]
        ldr     lr, [sp, #0x5C]
        ldr     r12, [sp, #0x60]
        ldr     r5, [sp, #0x64]
        cmp     r0, #0
        beq     LCRQ15
        cmp     r3, #0
        beq     LCRQ15
        cmp     lr, #0
        beq     LCRQ15
        cmp     r12, #0
        beq     LCRQ15
        cmp     r1, #0
        beq     LCRQ15
        cmp     r2, #0
        ble     LCRQ14
        cmp     r4, #0
        ble     LCRQ13
        ldr     r9, [r12]
        cmp     r9, r4
        blt     LCRQ1
LCRQ0:
        mvn     r0, #0x17
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LCRQ1:
        cmp     r9, #0
        blt     LCRQ0
        cmp     r2, #0
        add     r8, r5, #0xF
        add     r10, r5, #0xE
        ble     LCRQ11
        mvn     r5, #0xFF
        bic     r5, r5, #0x7F, 24
        sub     r3, r3, #2
        sub     r11, r4, #6
        mvn     r5, r5
        mov     r7, #0
        add     r6, lr, r4, lsl #1
        str     r11, [sp, #0x2C]
        str     r3, [sp, #0x30]
        str     r10, [sp, #0x24]
LCRQ2:
        mov     r10, r7, lsl #1
        ldrsh   r3, [r0, +r10]
        mov     r9, r9, lsl #1
        strh    r3, [r6, +r9]
        ldr     r9, [r12]
        mov     r9, r9, lsl #1
        strh    r3, [lr, +r9]
        ldr     r3, [r12]
        add     r3, r3, #1
        cmp     r3, r4
        strlt   r3, [r12]
        blt     LCRQ3
        mov     r9, #0
        mov     r3, #0
        str     r9, [r12]
LCRQ3:
        cmp     r4, #0
        add     r3, lr, r3, lsl #1
        movle   r11, #0
        ble     LCRQ7
        cmp     r4, #6
        movlt   r9, #0
        movlt   r11, r9
        blt     LCRQ5
        str     r3, [sp, #0x28]
        str     r5, [sp, #0x20]
        str     r6, [sp, #0x1C]
        str     lr, [sp, #0xC]
        ldr     r6, [sp, #0x28]
        ldr     lr, [sp, #0x2C]
        ldr     r5, [sp, #0x30]
        mov     r9, #0
        mov     r11, r9
        str     r7, [sp, #0x18]
        str     r8, [sp, #0x14]
        str     r12, [sp, #0x10]
        str     r2, [sp, #8]
        str     r1, [sp, #4]
        str     r0, [sp]
LCRQ4:
        sub     r0, r4, r9
        ldrsh   r7, [r6]
        mov     r0, r0, lsl #1
        ldrsh   r8, [r5, +r0]
        ldrsh   r1, [r6, #2]
        ldrsh   r2, [r6, #4]
        ldrsh   r12, [r6, #6]
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
        mla     r8, r7, r2, r8
        ldrsh   r0, [r5, +r0]
        add     r6, r6, #0xA
        add     r9, r9, #5
        cmp     r9, lr
        mla     r8, r1, r12, r8
        mla     r11, r0, r11, r8
        ble     LCRQ4
        ldr     r5, [sp, #0x20]
        ldr     r6, [sp, #0x1C]
        ldr     r7, [sp, #0x18]
        ldr     r8, [sp, #0x14]
        ldr     r12, [sp, #0x10]
        ldr     lr, [sp, #0xC]
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LCRQ5:
        str     r1, [sp, #4]
        ldr     r1, [sp, #0x30]
        add     r3, r3, r9, lsl #1
        str     r2, [sp, #8]
        str     r0, [sp]
LCRQ6:
        ldrsh   r0, [r3], #2
        sub     r2, r4, r9
        add     r9, r9, #1
        mov     r2, r2, lsl #1
        ldrsh   r2, [r1, +r2]
        cmp     r9, r4
        mla     r11, r2, r0, r11
        blt     LCRQ6
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LCRQ7:
        cmp     r8, #0
        ble     LCRQ12
        mov     r3, r11, asr r8
        and     r3, r3, #1
        add     r11, r11, r3
        ldr     r3, [sp, #0x24]
        mov     r9, #1
        add     r3, r11, r9, lsl r3
        sub     r3, r3, #1
        mov     r11, r3, asr r8
LCRQ8:
        cmp     r5, r11
        bge     LCRQ9
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r11, r3
        b       LCRQ10
LCRQ9:
        cmn     r11, #2, 18
        movlt   r3, #0
        sublt   r11, r3, #2, 18
LCRQ10:
        add     r7, r7, #1
        cmp     r7, r2
        strh    r11, [r1, +r10]
        ldrlt   r9, [r12]
        blt     LCRQ2
LCRQ11:
        mov     r0, #0
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LCRQ12:
        cmp     r8, #0
        rsblt   r3, r8, #0
        movlt   r11, r11, lsl r3
        b       LCRQ8
LCRQ13:
        mvn     r0, #0x19
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LCRQ14:
        mvn     r0, #5
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LCRQ15:
        mvn     r0, #7
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}


