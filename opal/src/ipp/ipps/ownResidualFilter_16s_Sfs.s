        .text
        .align  4
        .globl  ownResidualFilter_16s_Sfs


ownResidualFilter_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x28
        ldr     r12, [sp, #0x4C]
        ldr     lr, [sp, #0x50]
        cmp     r12, #0
        rsb     lr, lr, #0xF
        ble     LDJB7
        bic     lr, lr, #0xFF, 8
        sub     r5, r1, #5
        mov     r4, #2, 2
        bic     lr, lr, #0xFF, 16
        mov     r8, #0
        add     r1, r1, #1
        mvn     r7, #2, 2
        sub     r6, r4, #2, 18
        str     r5, [sp, #0x24]
LDJB0:
        cmp     r1, #0
        movle   r4, #0
        movle   r9, r8, lsl #1
        ble     LDJB4
        cmp     r1, #6
        blt     LDJB8
        str     r6, [sp, #0x20]
        ldr     r6, [sp, #0x24]
        mov     r11, #0
        mov     r9, r8, lsl #1
        mov     r4, r11
        add     r10, r2, r9
        mov     r5, r0
        str     r7, [sp, #0x1C]
        str     lr, [sp, #0x18]
        str     r1, [sp, #0x14]
        str     r8, [sp, #0x10]
        str     r12, [sp, #0xC]
        str     r3, [sp, #8]
        str     r2, [sp, #4]
        str     r0, [sp]
LDJB1:
        rsb     r0, r11, #0
        ldrsh   r8, [r5]
        ldrsh   r3, [r5, #2]
        ldrsh   r2, [r5, #4]
        ldrsh   lr, [r5, #6]
        ldrsh   r12, [r5, #8]
        mov     r0, r0, lsl #1
        ldrsh   r7, [r10, +r0]
        mvn     r0, #0
        rsb     r0, r11, r0
        mvn     r1, #1
        mla     r4, r8, r7, r4
        mov     r0, r0, lsl #1
        ldrsh   r7, [r10, +r0]
        rsb     r1, r11, r1
        mvn     r0, #2
        mla     r4, r3, r7, r4
        mov     r1, r1, lsl #1
        ldrsh   r3, [r10, +r1]
        rsb     r1, r11, r0
        mvn     r0, #3
        mla     r4, r2, r3, r4
        mov     r1, r1, lsl #1
        ldrsh   r1, [r10, +r1]
        rsb     r0, r11, r0
        add     r5, r5, #0xA
        mla     r4, lr, r1, r4
        mov     r0, r0, lsl #1
        ldrsh   r0, [r10, +r0]
        add     r11, r11, #5
        cmp     r11, r6
        mla     r4, r12, r0, r4
        ble     LDJB1
        ldr     r6, [sp, #0x20]
        ldr     r7, [sp, #0x1C]
        ldr     lr, [sp, #0x18]
        ldr     r1, [sp, #0x14]
        ldr     r8, [sp, #0x10]
        ldr     r12, [sp, #0xC]
        ldr     r3, [sp, #8]
        ldr     r2, [sp, #4]
        ldr     r0, [sp]
LDJB2:
        add     r5, r0, r11, lsl #1
        str     r2, [sp, #4]
        str     r0, [sp]
LDJB3:
        rsb     r2, r11, #0
        ldrsh   r0, [r5], #2
        mov     r2, r2, lsl #1
        ldrsh   r2, [r10, +r2]
        add     r11, r11, #1
        cmp     r11, r1
        mla     r4, r0, r2, r4
        blt     LDJB3
        ldr     r2, [sp, #4]
        ldr     r0, [sp]
LDJB4:
        cmp     r4, r7, asr lr
        mvngt   r4, #2, 2
        bgt     LDJB5
        mov     r5, #2, 2
        cmp     r4, r5, asr lr
        movge   r4, r4, lsl lr
        movlt   r4, #2, 2
LDJB5:
        cmp     r6, r4
        mvnle   r4, #0
        addle   r4, r4, #2, 18
        ble     LDJB6
        add     r4, r4, #2, 18
        mov     r4, r4, asr #16
        mov     r4, r4, lsl #16
        mov     r4, r4, asr #16
LDJB6:
        add     r8, r8, #1
        cmp     r8, r12
        strh    r4, [r3, +r9]
        blt     LDJB0
LDJB7:
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LDJB8:
        mov     r11, #0
        mov     r9, r8, lsl #1
        mov     r4, r11
        add     r10, r2, r9
        b       LDJB2


