        .text
        .align  4
        .globl  ownsFIRSR_16sc_Sfs


ownsFIRSR_16sc_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x24
        ldr     r0, [r0]
        ldr     r9, [sp, #0x48]
        ldr     r10, [sp, #0x4C]
        cmp     r3, #0
        ble     LBVK9
        cmp     r10, #0x1F
        mov     r6, r10
        mov     r12, #0x1F
        movgt   r6, r12
        cmn     r6, #0x1F
        mvn     r12, #0x1E
        movlt   r6, r12
        mvn     r12, #0xFF
        rsb     lr, r6, #0
        bic     r12, r12, #0x7F, 24
        sub     r5, lr, #1
        mvn     r12, r12
        mov     r7, #0
        mov     r4, #1
        str     r5, [sp, #0x20]
        str     lr, [sp, #0x14]
LBVK0:
        cmp     r9, #0
        ble     LBVK10
        add     lr, r0, #2
        str     lr, [sp, #0x1C]
        str     r9, [sp, #0x18]
        str     r10, [sp, #0x10]
        ldr     r11, [sp, #0x18]
        ldr     r10, [sp, #0x1C]
        mov     r8, r7, lsl #2
        add     lr, r1, r8
        mov     r5, #0
        add     lr, lr, #2
        mov     r4, r5
        str     r9, [sp, #0xC]
        str     r3, [sp, #8]
        str     r2, [sp, #4]
        str     r1, [sp]
LBVK1:
        ldrsh   r3, [r10]
        ldrsh   r1, [lr, #-2]
        ldrsh   r2, [r10, #-2]
        ldrsh   r9, [lr], #4
        add     r10, r10, #4
        mla     r4, r1, r3, r4
        mla     r5, r1, r2, r5
        mul     r3, r3, r9
        subs    r11, r11, #1
        mla     r4, r9, r2, r4
        sub     r5, r5, r3
        bne     LBVK1
        ldr     r10, [sp, #0x10]
        ldr     r9, [sp, #0xC]
        ldr     r3, [sp, #8]
        ldr     r2, [sp, #4]
        ldr     r1, [sp]
LBVK2:
        cmp     r10, #0
        beq     LBVK3
        cmp     r6, #0
        movgt   r5, r5, lsl r6
        bgt     LBVK3
        ldr     lr, [sp, #0x14]
        mov     r11, #1
        mov     lr, r5, asr lr
        str     lr, [sp, #0x1C]
        ldr     lr, [sp, #0x20]
        add     lr, r5, r11, lsl lr
        str     lr, [sp, #0x18]
        ldr     lr, [sp, #0x1C]
        ldr     r5, [sp, #0x18]
        and     lr, lr, #1
        add     lr, r5, lr
        ldr     r5, [sp, #0x14]
        sub     lr, lr, #1
        mov     r5, lr, asr r5
LBVK3:
        cmp     r12, r5
        blt     LBVK4
        cmn     r5, #2, 18
        movge   r5, r5, lsl #16
        movge   r5, r5, asr #16
        movlt   lr, #0
        sublt   r5, lr, #2, 18
        b       LBVK5
LBVK4:
        mvn     lr, #0xFF
        bic     lr, lr, #0x7F, 24
        mvn     r5, lr
LBVK5:
        cmp     r10, #0
        strh    r5, [r2, +r8]
        beq     LBVK6
        cmp     r6, #0
        movgt   r4, r4, lsl r6
        bgt     LBVK6
        ldr     lr, [sp, #0x14]
        mov     r11, #1
        mov     r5, r4, asr lr
        str     r5, [sp, #0x1C]
        ldr     r5, [sp, #0x20]
        add     r4, r4, r11, lsl r5
        ldr     r5, [sp, #0x1C]
        and     r5, r5, #1
        add     r5, r4, r5
        sub     r4, r5, #1
        mov     r4, r4, asr lr
LBVK6:
        cmp     r12, r4
        blt     LBVK7
        cmn     r4, #2, 18
        movge   r4, r4, lsl #16
        movge   lr, r4, asr #16
        mvnlt   lr, #0xFF
        biclt   lr, lr, #0x7F, 24
        b       LBVK8
LBVK7:
        mov     lr, #0
        sub     lr, lr, #2, 18
        mvn     lr, lr
LBVK8:
        add     r7, r7, #1
        add     r8, r8, r2
        cmp     r7, r3
        strh    lr, [r8, #2]
        blt     LBVK0
LBVK9:
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LBVK10:
        mov     r5, #0
        mov     r4, r5
        mov     r8, r7, lsl #2
        b       LBVK2


