        .text
        .align  4
        .globl  ownCrossCorr_Inv_16s32s


ownCrossCorr_Inv_16s32s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        ldr     r12, [sp, #0x34]
        cmp     r12, #0
        ble     LDUS6
        mov     r5, #0
        sub     r4, r2, #6
LDUS0:
        cmp     r2, #0
        movle   r9, #0
        ble     LDUS4
        cmp     r2, #6
        blt     LDUS7
        rsb     lr, r5, #0
        mov     r9, #0
        add     lr, r1, lr, lsl #1
        mov     r6, r9
        mov     r8, lr
        mov     r7, r0
        str     r3, [sp, #0xC]
        str     r2, [sp, #8]
        str     r1, [sp, #4]
        str     r0, [sp]
LDUS1:
        ldrsh   r0, [r8]
        ldrsh   r1, [r7]
        ldrsh   r2, [r7, #2]
        ldrsh   r3, [r8, #4]
        ldrsh   r10, [r8, #6]
        mla     r0, r1, r0, r9
        ldrsh   r1, [r8, #2]
        ldrsh   r9, [r7, #4]
        add     r6, r6, #5
        cmp     r6, r4
        mla     r11, r2, r1, r0
        ldrsh   r2, [r7, #6]
        ldrsh   r0, [r8, #8]
        ldrsh   r1, [r7, #8]
        add     r8, r8, #0xA
        mla     r11, r9, r3, r11
        add     r7, r7, #0xA
        mla     r11, r2, r10, r11
        mla     r9, r1, r0, r11
        ble     LDUS1
        ldr     r3, [sp, #0xC]
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LDUS2:
        mov     r8, r6, lsl #1
        add     r7, r0, r6, lsl #1
LDUS3:
        ldrsh   r11, [lr, +r8]
        ldrsh   r10, [r7], #2
        add     r6, r6, #1
        add     r8, r8, #2
        mla     r9, r10, r11, r9
        cmp     r6, r2
        blt     LDUS3
LDUS4:
        cmn     r9, #7, 2
        mvngt   r9, #2, 2
        bgt     LDUS5
        cmp     r9, #3, 2
        movge   r9, r9, lsl #1
        movlt   r9, #2, 2
LDUS5:
        add     r5, r5, #1
        str     r9, [r3], #4
        cmp     r5, r12
        blt     LDUS0
LDUS6:
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LDUS7:
        rsb     lr, r5, #0
        mov     r9, #0
        mov     r6, r9
        add     lr, r1, lr, lsl #1
        b       LDUS2


