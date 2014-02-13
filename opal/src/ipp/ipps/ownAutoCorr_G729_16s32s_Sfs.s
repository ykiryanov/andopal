        .text
        .align  4
        .globl  ownAutoCorr_G729_16s32s_Sfs


ownAutoCorr_G729_16s32s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        ldr     r12, [sp, #0x44]
        ldr     lr, [sp, #0x48]
        cmp     r3, #0
        ble     LDVY6
        bic     r4, r12, #0xFF, 8
        sub     r12, r1, lr
        add     lr, r0, lr, lsl #1
        bic     r1, r4, #0xFF, 16
        mov     r9, #0
        mvn     r8, #2, 2
        mov     r7, #2, 2
        str     lr, [sp, #0x1C]
LDVY0:
        sub     r11, r12, r9
        cmp     r11, #0
        movle   lr, #0
        ble     LDVY4
        sub     lr, r12, r9
        cmp     lr, #5
        movlt   lr, #0
        movlt   r10, lr
        blt     LDVY2
        str     r12, [sp, #0x10]
        ldr     r12, [sp, #0x1C]
        mov     lr, #0
        mov     r10, lr
        sub     r6, r11, #5
        mov     r5, r9
        mov     r4, r0
        str     r8, [sp, #0x18]
        str     r1, [sp, #0x14]
        str     r9, [sp, #0xC]
        str     r3, [sp, #8]
        str     r2, [sp, #4]
        str     r0, [sp]
LDVY1:
        mov     r1, r5, lsl #1
        ldrsh   r9, [r12, +r1]
        ldrsh   r8, [r4]
        ldrsh   r0, [r4, #2]
        ldrsh   r3, [r4, #4]
        ldrsh   r2, [r4, #6]
        mla     r9, r8, r9, lr
        add     lr, r1, #2
        ldrsh   lr, [r12, +lr]
        add     r8, r1, #4
        ldrsh   r8, [r12, +r8]
        mla     r9, r0, lr, r9
        add     r1, r1, #6
        ldrsh   r0, [r12, +r1]
        add     r5, r5, #4
        add     r10, r10, #4
        mla     r9, r3, r8, r9
        cmp     r10, r6
        add     r4, r4, #8
        mla     lr, r2, r0, r9
        ble     LDVY1
        ldr     r8, [sp, #0x18]
        ldr     r1, [sp, #0x14]
        ldr     r12, [sp, #0x10]
        ldr     r9, [sp, #0xC]
        ldr     r3, [sp, #8]
        ldr     r2, [sp, #4]
        ldr     r0, [sp]
LDVY2:
        add     r4, r0, r10, lsl #1
        str     r0, [sp]
        ldr     r0, [sp, #0x1C]
        add     r5, r10, r9
        str     r2, [sp, #4]
LDVY3:
        mov     r6, r5, lsl #1
        ldrsh   r2, [r4], #2
        ldrsh   r6, [r0, +r6]
        add     r10, r10, #1
        cmp     r10, r11
        mla     lr, r2, r6, lr
        add     r5, r5, #1
        blt     LDVY3
        ldr     r2, [sp, #4]
        ldr     r0, [sp]
LDVY4:
        cmp     lr, r8, asr r1
        mvngt   lr, #2, 2
        bgt     LDVY5
        cmp     lr, r7, asr r1
        movge   lr, lr, lsl r1
        movlt   lr, #2, 2
LDVY5:
        add     r9, r9, #1
        str     lr, [r2], #4
        cmp     r9, r3
        blt     LDVY0
LDVY6:
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}


