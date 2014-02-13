        .text
        .align  4
        .globl  ownsPcmAudioOutput_32s16s


ownsPcmAudioOutput_32s16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        cmp     r2, #0
        ble     LGGI3
        cmp     r2, #6
        mov     r9, #0
        movlt   r10, r9
        blt     LGGI1
        add     lr, r3, r3, lsl #1
        str     lr, [sp, #0x14]
        mvn     r12, #0xFF
        sub     r11, r2, #6
        str     r2, [sp, #0xC]
        ldr     r2, [sp, #0x14]
        bic     r12, r12, #0x7F, 24
        mov     r10, r9
        mvn     r12, r12
        mov     r8, r3, lsl #1
        mov     r7, r3, lsl #2
        sub     r6, r9, #2, 18
        add     r5, r3, r3, lsl #2
        mov     r4, r3
        add     lr, r0, #4
        str     r10, [sp]
        str     r11, [sp, #4]
        str     r3, [sp, #8]
        str     r0, [sp, #0x10]
LGGI0:
        ldr     r11, [lr, #-4]
        mov     r0, r9, lsl #1
        mov     r10, r4, lsl #1
        cmn     r11, #2, 18
        movlt   r11, r6
        cmp     r11, r12
        mov     r3, r12
        movlt   r3, r11
        strh    r3, [r1, +r0]
        ldr     r3, [lr]
        mov     r11, r2, lsl #1
        str     r11, [sp, #0x18]
        cmn     r3, #2, 18
        movlt   r3, r6
        cmp     r3, r12
        mov     r11, r12
        movlt   r11, r3
        strh    r11, [r1, +r10]
        ldr     r11, [lr, #4]
        mov     r0, r8, lsl #1
        mov     r3, r7, lsl #1
        cmn     r11, #2, 18
        movlt   r11, r6
        cmp     r11, r12
        mov     r10, r12
        movlt   r10, r11
        strh    r10, [r1, +r0]
        ldr     r10, [lr, #8]
        add     r9, r9, r5
        add     r7, r7, r5
        cmn     r10, #2, 18
        movlt   r10, r6
        cmp     r10, r12
        mov     r0, r12
        movlt   r0, r10
        ldr     r10, [sp, #0x18]
        add     r2, r2, r5
        add     r8, r8, r5
        strh    r0, [r1, +r10]
        ldr     r10, [lr, #0xC]
        add     r4, r4, r5
        add     lr, lr, #0x14
        cmn     r10, #2, 18
        movlt   r10, r6
        cmp     r10, r12
        mov     r0, r12
        movlt   r0, r10
        strh    r0, [r1, +r3]
        ldr     r3, [sp]
        ldr     r0, [sp, #4]
        add     r3, r3, #5
        str     r3, [sp]
        cmp     r3, r0
        ble     LGGI0
        ldr     r10, [sp]
        ldr     r3, [sp, #8]
        ldr     r2, [sp, #0xC]
        ldr     r0, [sp, #0x10]
LGGI1:
        mul     r12, r10, r3
        mvn     lr, #0xFF
        bic     lr, lr, #0x7F, 24
        mov     r4, #0
        mvn     lr, lr
        sub     r4, r4, #2, 18
        add     r0, r0, r10, lsl #2
LGGI2:
        ldr     r6, [r0], #4
        add     r10, r10, #1
        cmn     r6, #2, 18
        movlt   r6, r4
        cmp     r6, lr
        mov     r5, lr
        movlt   r5, r6
        mov     r6, r12, lsl #1
        cmp     r10, r2
        strh    r5, [r1, +r6]
        add     r12, r12, r3
        blt     LGGI2
LGGI3:
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}


