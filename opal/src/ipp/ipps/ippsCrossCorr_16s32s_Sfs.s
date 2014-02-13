        .text
        .align  4
        .globl  _ippsCrossCorr_16s32s_Sfs


_ippsCrossCorr_16s32s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        ldr     r12, [sp, #0x3C]
        cmp     r0, #0
        beq     LDUV15
        cmp     r1, #0
        beq     LDUV15
        cmp     r3, #0
        beq     LDUV15
        cmp     r2, #0
        ble     LDUV6
        cmp     r12, #0
        blt     LDUV8
        cmp     r2, #0
        ble     LDUV5
        mov     r10, #0
LDUV0:
        sub     r9, r2, r10
        cmp     r9, #0
        movle   lr, #0
        ble     LDUV4
        cmp     r9, #6
        blt     LDUV7
        mov     lr, #0
        add     r4, r1, r10, lsl #1
        mov     r5, lr
        sub     r8, r9, #6
        mov     r7, r4
        mov     r6, r0
        str     r10, [sp]
        str     r12, [sp, #4]
        str     r3, [sp, #8]
        str     r2, [sp, #0xC]
        str     r1, [sp, #0x10]
        str     r0, [sp, #0x14]
LDUV1:
        ldrsh   r3, [r6]
        ldrsh   r12, [r7]
        ldrsh   r1, [r7, #2]
        ldrsh   r2, [r6, #2]
        ldrsh   r0, [r7, #4]
        mla     r11, r3, r12, lr
        ldrsh   r3, [r6, #4]
        ldrsh   r12, [r7, #6]
        ldrsh   lr, [r6, #6]
        ldrsh   r10, [r7, #8]
        mla     r11, r2, r1, r11
        ldrsh   r1, [r6, #8]
        add     r5, r5, #5
        cmp     r5, r8
        add     r7, r7, #0xA
        mla     r11, r3, r0, r11
        add     r6, r6, #0xA
        mla     r11, lr, r12, r11
        mla     lr, r1, r10, r11
        ble     LDUV1
        ldr     r10, [sp]
        ldr     r12, [sp, #4]
        ldr     r3, [sp, #8]
        ldr     r2, [sp, #0xC]
        ldr     r1, [sp, #0x10]
        ldr     r0, [sp, #0x14]
LDUV2:
        mov     r8, r5, lsl #1
        add     r11, r0, r5, lsl #1
LDUV3:
        ldrsh   r6, [r4, +r8]
        ldrsh   r7, [r11], #2
        add     r5, r5, #1
        add     r8, r8, #2
        mla     lr, r7, r6, lr
        cmp     r5, r9
        blt     LDUV3
LDUV4:
        mov     lr, lr, asr r12
        add     r10, r10, #1
        str     lr, [r3], #4
        cmp     r10, r2
        blt     LDUV0
LDUV5:
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LDUV6:
        mvn     r0, #5
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LDUV7:
        mov     lr, #0
        mov     r5, lr
        add     r4, r1, r10, lsl #1
        b       LDUV2
LDUV8:
        cmp     r2, #0
        rsb     r9, r12, #0
        ble     LDUV5
        mov     r10, #0
LDUV9:
        sub     r8, r2, r10
        cmp     r8, #0
        movle   r12, #0
        ble     LDUV13
        cmp     r8, #6
        blt     LDUV14
        mov     r12, #0
        add     lr, r1, r10, lsl #1
        mov     r4, r12
        sub     r7, r8, #6
        mov     r6, lr
        mov     r5, r0
        str     r10, [sp]
        str     r9, [sp, #4]
        str     r3, [sp, #8]
        str     r2, [sp, #0xC]
        str     r1, [sp, #0x10]
        str     r0, [sp, #0x14]
LDUV10:
        ldrsh   r3, [r6]
        ldrsh   r9, [r5]
        ldrsh   r1, [r6, #2]
        ldrsh   r2, [r5, #2]
        ldrsh   r0, [r6, #4]
        mla     r11, r9, r3, r12
        ldrsh   r3, [r5, #4]
        ldrsh   r12, [r6, #6]
        ldrsh   r9, [r5, #6]
        ldrsh   r10, [r6, #8]
        mla     r11, r2, r1, r11
        ldrsh   r1, [r5, #8]
        add     r4, r4, #5
        cmp     r4, r7
        add     r6, r6, #0xA
        mla     r11, r3, r0, r11
        add     r5, r5, #0xA
        mla     r11, r9, r12, r11
        mla     r12, r1, r10, r11
        ble     LDUV10
        ldr     r10, [sp]
        ldr     r9, [sp, #4]
        ldr     r3, [sp, #8]
        ldr     r2, [sp, #0xC]
        ldr     r1, [sp, #0x10]
        ldr     r0, [sp, #0x14]
LDUV11:
        mov     r6, r4, lsl #1
        add     r5, r0, r4, lsl #1
LDUV12:
        ldrsh   r11, [lr, +r6]
        ldrsh   r7, [r5], #2
        add     r4, r4, #1
        add     r6, r6, #2
        mla     r12, r7, r11, r12
        cmp     r4, r8
        blt     LDUV12
LDUV13:
        mov     r12, r12, lsl r9
        add     r10, r10, #1
        str     r12, [r3], #4
        cmp     r10, r2
        blt     LDUV9
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LDUV14:
        mov     r12, #0
        mov     r4, r12
        add     lr, r1, r10, lsl #1
        b       LDUV11
LDUV15:
        mvn     r0, #7
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}


