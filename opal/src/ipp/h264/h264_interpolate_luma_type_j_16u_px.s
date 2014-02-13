        .text
        .align  4
        .globl  h264_interpolate_luma_type_j_16u_px


h264_interpolate_luma_type_j_16u_px:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x59, 30
        sub     sp, sp, #1, 22
        ldr     r6, [r0, #0x1C]
        ldr     r4, [r0]
        ldr     lr, [r0, #4]
        add     r5, sp, #0x2C
        cmp     r6, #0
        mov     r12, r5
        ble     LKYR3
        ldr     r2, [r0, #0x18]
        add     r1, lr, lr, lsl #2
        add     r1, lr, r1
        add     r2, r2, #3
        mov     r3, r6
        str     r6, [sp, #0x14]
        str     r5, [sp, #0x18]
        str     r0, [sp, #0x20]
LKYR0:
        cmn     r2, #2
        addle   r11, r4, lr, lsl #1
        ble     LKYR2
        add     r0, r4, r1
        sub     r5, r4, lr, lsl #2
        add     r11, r4, lr, lsl #1
        sub     r6, r4, lr, lsl #1
        add     r7, r4, lr, lsl #2
        sub     r5, r5, #4
        sub     r0, r0, #4
        sub     r6, r6, #4
        sub     r7, r7, #4
        mvn     r10, #1
        mvn     r9, #3
        sub     r8, r11, #4
        str     r11, [sp, #8]
        str     r3, [sp, #0xC]
        str     r1, [sp, #0x10]
        str     r12, [sp, #4]
        str     lr, [sp, #0x1C]
        str     r4, [sp]
LKYR1:
        ldr     r3, [sp]
        ldrh    r1, [r8], #2
        ldrh    r12, [r6], #2
        ldrh    r11, [r3, +r9]
        ldrh    r3, [r7], #2
        ldrh    lr, [r5], #2
        ldrh    r4, [r0], #2
        add     r11, r1, r11
        add     r12, r3, r12
        add     r4, lr, r4
        add     r1, r11, r11, lsl #2
        add     r12, r12, r12, lsl #2
        add     r1, r4, r1, lsl #2
        rsb     r12, r12, r1
        ldr     r1, [sp, #4]
        str     r12, [r1, +r10, lsl #2]
        add     r10, r10, #1
        cmp     r10, r2
        add     r9, r9, #2
        blt     LKYR1
        ldr     r11, [sp, #8]
        ldr     r3, [sp, #0xC]
        ldr     r1, [sp, #0x10]
        ldr     r12, [sp, #4]
        ldr     lr, [sp, #0x1C]
LKYR2:
        subs    r3, r3, #1
        add     r12, r12, #0x54
        mov     r4, r11
        bne     LKYR0
        ldr     r6, [sp, #0x14]
        ldr     r5, [sp, #0x18]
        ldr     r0, [sp, #0x20]
LKYR3:
        ldr     r1, [r0, #0x44]
        ldr     r12, [r0, #8]
        ldr     r3, [r0, #0xC]
        mov     r2, #1
        mov     r1, r2, lsl r1
        cmp     r6, #0
        sub     r1, r1, #1
        ble     LKYR8
        ldr     lr, [r0, #0x18]
        mov     r2, #0
LKYR4:
        cmp     lr, #0
        ble     LKYR7
        mov     r8, #0
        mov     r6, r5
        mov     r7, r8
LKYR5:
        ldr     r4, [r6, #4]
        ldr     lr, [r6, #8]
        ldr     r10, [r5, +r8, lsl #2]
        ldr     r9, [r6, #-4]
        add     r4, r4, r10
        ldr     r10, [r6, #0xC]
        add     r4, r4, r4, lsl #2
        add     lr, lr, r9
        ldr     r9, [r6, #-8]
        add     lr, lr, lr, lsl #2
        add     r9, r9, r10
        add     r4, r9, r4, lsl #2
        rsb     r4, lr, r4
        add     lr, r4, #2, 24
        mov     lr, lr, asr #10
        cmp     lr, #0
        movle   lr, #0
        ble     LKYR6
        cmp     r1, lr
        movlt   lr, r1
LKYR6:
        strh    lr, [r12, +r7]
        ldr     lr, [r0, #0x18]
        add     r8, r8, #1
        add     r7, r7, #2
        cmp     r8, lr
        add     r6, r6, #4
        blt     LKYR5
        ldr     r6, [r0, #0x1C]
LKYR7:
        add     r2, r2, #1
        cmp     r2, r6
        add     r12, r12, r3, lsl #1
        add     r5, r5, #0x54
        blt     LKYR4
LKYR8:
        add     sp, sp, #0x59, 30
        add     sp, sp, #1, 22
        ldmia   sp!, {r4 - r11, pc}


