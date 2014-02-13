        .text
        .align  4
        .globl  ownFilterDeblocking16x16_H263_V


ownFilterDeblocking16x16_H263_V:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        sub     r7, r0, #1
        sub     r5, r0, #2
        add     r4, r0, #1
        mov     r6, #0
        mov     lr, #0
        mov     r3, #1
        mov     r2, #0xFF
        mov     r12, #0x10
        str     r7, [sp]
        str     r1, [sp, #8]
        str     r0, [sp, #4]
LFGA0:
        ldr     r0, [sp]
        ldrb    r8, [lr, +r5]
        ldrb    r6, [r4, +lr]
        ldrb    r7, [r0, +lr]
        add     r1, lr, r0
        ldr     r0, [sp, #4]
        add     r10, r5, lr
        add     r9, lr, r4
        sub     r3, r8, r7, lsl #2
        ldrb    r2, [lr, +r0]
        add     r0, r0, lr
        sub     r11, r8, r6
        rsb     r2, r6, r2, lsl #2
        add     r3, r3, r2
        mov     r11, r11, asr #1
        mov     r3, r3, asr #2
        add     r3, r8, r3, lsr #29
        add     r11, r8, r11, lsr #30
        sub     r3, r3, r7, lsl #2
        add     r2, r3, r2
        mov     r3, #0
        movs    r2, r2, asr #3
        mov     r7, #1
        movmi   r3, r7
        add     r3, r2, r3
        sub     r6, r11, r6
        mov     r3, r3, asr #1
        mov     r6, r6, asr #2
        eor     r7, r3, r3, asr #31
        sub     r3, r7, r3, asr #31
        cmp     r6, r3
        bgt     LFGA1
        rsb     r7, r3, #0
        cmp     r7, r6
        mov     r3, r6
        movgt   r3, r7
LFGA1:
        sub     r8, r8, r3
        strb    r8, [r10]
        ldrb    r6, [r1]
        ldr     r7, [sp, #8]
        adds    r8, r2, r6
        mov     r6, #0xFF
        mov     r10, r6
        add     lr, lr, r7
        mov     r7, #0
        movmi   r8, r7
        cmp     r8, #0xFF
        movlt   r10, r8
        strb    r10, [r1]
        ldrb    r1, [r0]
        subs    r2, r1, r2
        movmi   r2, r7
        cmp     r2, #0xFF
        movlt   r6, r2
        strb    r6, [r0]
        ldrb    r0, [r9]
        subs    r12, r12, #1
        add     r3, r0, r3
        strb    r3, [r9]
        bne     LFGA0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}


