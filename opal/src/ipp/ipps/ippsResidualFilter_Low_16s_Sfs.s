        .text
        .align  4
        .globl  _ippsResidualFilter_Low_16s_Sfs


_ippsResidualFilter_Low_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x28
        ldr     lr, [sp, #0x4C]
        ldr     r12, [sp, #0x50]
        cmp     r0, #0
        beq     LDJF13
        cmp     r2, #0
        beq     LDJF13
        cmp     r3, #0
        beq     LDJF13
        cmp     r1, #0
        ble     LDJF12
        cmp     lr, #0
        ble     LDJF12
        cmp     lr, r1
        blt     LDJF12
        cmp     r12, #0
        blt     LDJF0
        cmp     r12, #0xF
        ble     LDJF1
LDJF0:
        mvn     r0, #0xC
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LDJF1:
        cmp     r12, #0
        mov     r8, #0
        moveq   r5, r8
        beq     LDJF2
        sub     r5, r12, #1
        mov     r4, #1
        mov     r5, r4, lsl r5
LDJF2:
        cmp     lr, #0
        ble     LDJF10
        mvn     r4, #0xFF
        bic     r4, r4, #0x7F, 24
        sub     r6, r1, #5
        mvn     r4, r4
        add     r1, r1, #1
        str     r6, [sp]
LDJF3:
        cmp     r1, #0
        movle   r6, #0
        movle   r9, r8, lsl #1
        ble     LDJF7
        cmp     r1, #6
        blt     LDJF11
        str     r4, [sp, #0xC]
        ldr     r4, [sp]
        mov     r11, #0
        mov     r9, r8, lsl #1
        mov     r6, r11
        add     r10, r2, r9
        mov     r7, r0
        str     r1, [sp, #0x10]
        str     r5, [sp, #0x14]
        str     r8, [sp, #0x18]
        str     r12, [sp, #0x1C]
        str     lr, [sp, #0x20]
        str     r3, [sp, #0x24]
        str     r2, [sp, #4]
        str     r0, [sp, #8]
LDJF4:
        rsb     r0, r11, #0
        ldrsh   r8, [r7]
        ldrsh   r3, [r7, #2]
        ldrsh   r2, [r7, #4]
        ldrsh   lr, [r7, #6]
        ldrsh   r12, [r7, #8]
        mov     r0, r0, lsl #1
        ldrsh   r5, [r10, +r0]
        mvn     r0, #0
        rsb     r0, r11, r0
        mvn     r1, #1
        mla     r6, r8, r5, r6
        mov     r0, r0, lsl #1
        ldrsh   r5, [r10, +r0]
        rsb     r1, r11, r1
        mvn     r0, #2
        mla     r6, r3, r5, r6
        mov     r1, r1, lsl #1
        ldrsh   r1, [r10, +r1]
        rsb     r3, r11, r0
        mvn     r0, #3
        mla     r6, r2, r1, r6
        mov     r3, r3, lsl #1
        ldrsh   r1, [r10, +r3]
        rsb     r0, r11, r0
        add     r7, r7, #0xA
        mla     r6, lr, r1, r6
        mov     r0, r0, lsl #1
        ldrsh   r0, [r10, +r0]
        add     r11, r11, #5
        cmp     r11, r4
        mla     r6, r12, r0, r6
        ble     LDJF4
        ldr     r4, [sp, #0xC]
        ldr     r1, [sp, #0x10]
        ldr     r5, [sp, #0x14]
        ldr     r8, [sp, #0x18]
        ldr     r12, [sp, #0x1C]
        ldr     lr, [sp, #0x20]
        ldr     r3, [sp, #0x24]
        ldr     r2, [sp, #4]
        ldr     r0, [sp, #8]
LDJF5:
        add     r7, r0, r11, lsl #1
        str     r2, [sp, #4]
        str     r0, [sp, #8]
LDJF6:
        rsb     r2, r11, #0
        ldrsh   r0, [r7], #2
        mov     r2, r2, lsl #1
        ldrsh   r2, [r10, +r2]
        add     r11, r11, #1
        cmp     r11, r1
        mla     r6, r0, r2, r6
        blt     LDJF6
        ldr     r2, [sp, #4]
        ldr     r0, [sp, #8]
LDJF7:
        add     r6, r5, r6
        mov     r6, r6, asr r12
        cmp     r4, r6
        blt     LDJF8
        cmn     r6, #2, 18
        movge   r6, r6, lsl #16
        movge   r6, r6, asr #16
        mvnlt   r6, #0xFF
        biclt   r6, r6, #0x7F, 24
        b       LDJF9
LDJF8:
        mov     r6, #0
        sub     r6, r6, #2, 18
        mvn     r6, r6
LDJF9:
        add     r8, r8, #1
        cmp     r8, lr
        strh    r6, [r3, +r9]
        blt     LDJF3
LDJF10:
        mov     r0, #0
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LDJF11:
        mov     r11, #0
        mov     r9, r8, lsl #1
        mov     r6, r11
        add     r10, r2, r9
        b       LDJF5
LDJF12:
        mvn     r0, #5
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LDJF13:
        mvn     r0, #7
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}


