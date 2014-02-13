        .text
        .align  4
        .globl  h264_interpolate_luma_type_j_8u_px


h264_interpolate_luma_type_j_8u_px:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xB1, 30
        ldr     r6, [r0, #0x1C]
        ldr     r4, [r0]
        ldr     lr, [r0, #4]
        add     r5, sp, #0x28
        cmp     r6, #0
        mov     r12, r5
        ble     LKYQ3
        ldr     r1, [r0, #0x18]
        add     r3, lr, lr, lsl #1
        mov     r2, r6
        add     r1, r1, #3
        str     r6, [sp, #0x14]
        str     r5, [sp, #0x18]
        str     r0, [sp, #0x20]
LKYQ0:
        cmn     r1, #2
        addle   r11, lr, r4
        ble     LKYQ2
        add     r6, r4, lr, lsl #1
        sub     r7, r6, #2
        add     r0, r4, r3
        add     r11, lr, r4
        sub     r5, r4, lr, lsl #1
        sub     r6, r4, lr
        sub     r5, r5, #2
        sub     r0, r0, #2
        sub     r6, r6, #2
        mvn     r10, #1
        mvn     r9, #3
        sub     r8, r11, #2
        str     r11, [sp, #8]
        str     r2, [sp, #0xC]
        str     r3, [sp, #0x10]
        str     r12, [sp, #4]
        str     lr, [sp, #0x1C]
        str     r4, [sp]
LKYQ1:
        ldr     r2, [sp]
        ldrb    r11, [r8], #1
        ldrb    r3, [r6], #1
        ldrb    r4, [r10, +r2]
        ldrb    r2, [r7], #1
        ldrb    lr, [r5], #1
        ldrb    r12, [r0], #1
        add     r3, r2, r3
        add     r4, r11, r4
        add     r12, lr, r12
        add     r3, r3, r3, lsl #2
        add     r2, r4, r4, lsl #2
        add     r10, r10, #1
        cmp     r10, r1
        add     r2, r12, r2, lsl #2
        rsb     r3, r3, r2
        ldr     r2, [sp, #4]
        strh    r3, [r2, +r9]
        add     r9, r9, #2
        blt     LKYQ1
        ldr     r11, [sp, #8]
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #0x10]
        ldr     r12, [sp, #4]
        ldr     lr, [sp, #0x1C]
LKYQ2:
        subs    r2, r2, #1
        add     r12, r12, #0x2A
        mov     r4, r11
        bne     LKYQ0
        ldr     r6, [sp, #0x14]
        ldr     r5, [sp, #0x18]
        ldr     r0, [sp, #0x20]
LKYQ3:
        ldr     lr, [r0, #8]
        ldr     r12, [r0, #0xC]
        cmp     r6, #0
        ble     LKYQ7
        ldr     r4, [r0, #0x18]
        mov     r3, #0
        mov     r2, r3
        mov     r1, #0xFF
LKYQ4:
        cmp     r4, #0
        ble     LKYQ6
        mov     r8, #0
        mov     r7, r8
        add     r6, r5, #4
LKYQ5:
        ldrsh   r4, [r6, #-2]
        ldrsh   r10, [r5, +r7]
        ldrsh   r9, [r6]
        ldrsh   r11, [r6, #2]
        add     r7, r7, #2
        add     r4, r4, r10
        ldrsh   r10, [r6, #-6]
        add     r4, r4, r4, lsl #2
        add     r9, r9, r10
        ldrsh   r10, [r6, #-8]
        add     r6, r6, #2
        add     r9, r9, r9, lsl #2
        add     r10, r10, r11
        add     r4, r10, r4, lsl #2
        rsb     r4, r9, r4
        add     r4, r4, #2, 24
        mov     r9, r2
        mov     r4, r4, asr #10
        cmp     r4, #0xFF
        movgt   r4, r1
        cmp     r4, #0
        movgt   r9, r4
        strb    r9, [r8, +lr]
        ldr     r4, [r0, #0x18]
        add     r8, r8, #1
        cmp     r8, r4
        blt     LKYQ5
        ldr     r6, [r0, #0x1C]
LKYQ6:
        add     r3, r3, #1
        cmp     r3, r6
        add     lr, r12, lr
        add     r5, r5, #0x2A
        blt     LKYQ4
LKYQ7:
        add     sp, sp, #0xB1, 30
        ldmia   sp!, {r4 - r11, pc}


