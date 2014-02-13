        .text
        .align  4
        .globl  _ippsCrossCorr_Step_NR_Sfs_16s


_ippsCrossCorr_Step_NR_Sfs_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x28
        ldr     r12, [sp, #0x54]
        ldr     r4, [sp, #0x4C]
        ldr     lr, [sp, #0x50]
        cmp     r12, #0
        mov     r10, #0
        moveq   r5, r10
        beq     LDUW0
        sub     r5, r12, #1
        mov     r6, #1
        mov     r5, r6, lsl r5
LDUW0:
        cmp     lr, #0
        ble     LDUW6
        rsb     r8, r3, #0
        sub     r7, r2, #5
LDUW1:
        cmp     r2, #0
        movle   r6, #0
        ble     LDUW5
        cmp     r2, #5
        blt     LDUW7
        add     r11, r1, r10, lsl #1
        str     r11, [sp, #0x24]
        str     r11, [sp, #0x1C]
        str     r0, [sp, #0x20]
        str     lr, [sp, #0x18]
        str     r1, [sp, #8]
        ldr     r1, [sp, #0x20]
        ldr     lr, [sp, #0x1C]
        mov     r9, #0
        mov     r6, r9
        str     r4, [sp, #0x14]
        str     r3, [sp, #0x10]
        str     r2, [sp, #0xC]
        str     r0, [sp, #4]
        str     r10, [sp]
LDUW2:
        ldrsh   r10, [lr]
        ldrsh   r4, [r1]
        ldrsh   r2, [lr, #2]
        ldrsh   r3, [r1, #2]
        ldrsh   r0, [lr, #4]
        mla     r11, r4, r10, r6
        ldrsh   r10, [r1, #4]
        ldrsh   r4, [lr, #6]
        ldrsh   r6, [r1, #6]
        add     lr, lr, #8
        mla     r11, r3, r2, r11
        add     r1, r1, #8
        add     r9, r9, #4
        cmp     r9, r7
        mla     r11, r10, r0, r11
        mla     r6, r6, r4, r11
        ble     LDUW2
        ldr     lr, [sp, #0x18]
        ldr     r4, [sp, #0x14]
        ldr     r3, [sp, #0x10]
        ldr     r2, [sp, #0xC]
        ldr     r1, [sp, #8]
        ldr     r0, [sp, #4]
        ldr     r10, [sp]
LDUW3:
        mov     r11, r9, lsl #1
        str     r11, [sp, #0x1C]
        add     r11, r0, r9, lsl #1
        str     r11, [sp, #0x20]
        str     r3, [sp, #0x10]
        str     r1, [sp, #8]
        str     r0, [sp, #4]
        ldr     r3, [sp, #0x24]
        ldr     r1, [sp, #0x20]
        ldr     r0, [sp, #0x1C]
        str     r10, [sp]
LDUW4:
        ldrsh   r10, [r3, +r0]
        ldrsh   r11, [r1], #2
        add     r9, r9, #1
        cmp     r9, r2
        mla     r6, r11, r10, r6
        add     r0, r0, #2
        blt     LDUW4
        ldr     r3, [sp, #0x10]
        ldr     r1, [sp, #8]
        ldr     r0, [sp, #4]
        ldr     r10, [sp]
LDUW5:
        add     r6, r5, r6
        mov     r6, r6, asr r12
        strh    r6, [r4], #2
        subs    lr, lr, #1
        add     r2, r2, r8
        add     r7, r7, r8
        add     r10, r10, r3
        bne     LDUW1
LDUW6:
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LDUW7:
        mov     r9, #0
        add     r11, r1, r10, lsl #1
        mov     r6, r9
        str     r11, [sp, #0x24]
        b       LDUW3


