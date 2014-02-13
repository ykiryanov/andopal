        .text
        .align  4
        .globl  ownFilterDeblocking8x8_H263_V


ownFilterDeblocking8x8_H263_V:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        sub     r8, r0, #2
        sub     r7, r0, #1
        add     lr, r0, #1
        mov     r6, #0
        mov     r12, #0
        mov     r5, #1
        mov     r4, #0xFF
        mov     r3, #8
        str     r7, [sp, #4]
        str     r8, [sp, #8]
        str     r2, [sp, #0x10]
        str     r1, [sp, #0xC]
        str     r0, [sp]
LFFY0:
        ldr     r0, [sp, #8]
        ldrb    r4, [lr, +r12]
        ldrb    r5, [r12, +r0]
        add     r2, r0, r12
        ldr     r0, [sp, #4]
        ldrb    r8, [r0, +r12]
        add     r1, r12, r0
        ldr     r0, [sp]
        sub     r6, r5, r8, lsl #2
        ldrb    r7, [r12, +r0]
        add     r0, r0, r12
        rsb     r7, r4, r7, lsl #2
        add     r9, r6, r7
        add     r6, r12, lr
        mov     r9, r9, asr #2
        add     r9, r5, r9, lsr #29
        sub     r9, r9, r8, lsl #2
        add     r7, r9, r7
        movs    r8, r7, asr #3
        mvnmi   r9, #0
        movpl   r9, #1
        eor     r10, r8, r8, asr #31
        sub     r7, r5, r4
        sub     r8, r10, r8, asr #31
        ldr     r10, [sp, #0x10]
        mov     r7, r7, asr #1
        mov     r11, #0
        sub     r10, r8, r10
        add     r7, r5, r7, lsr #30
        mov     r10, r10, lsl #1
        cmp     r10, #0
        movgt   r11, r10
        mov     r10, #0
        sub     r8, r8, r11
        cmp     r8, #0
        movgt   r10, r8
        muls    r9, r9, r10
        sub     r4, r7, r4
        mov     r7, #0
        mov     r8, #1
        movmi   r7, r8
        add     r7, r9, r7
        mov     r4, r4, asr #2
        mov     r7, r7, asr #1
        eor     r8, r7, r7, asr #31
        sub     r7, r8, r7, asr #31
        cmp     r4, r7
        bgt     LFFY1
        rsb     r8, r7, #0
        cmp     r8, r4
        mov     r7, r4
        movgt   r7, r8
LFFY1:
        sub     r5, r5, r7
        strb    r5, [r2]
        ldrb    r2, [r1]
        ldr     r4, [sp, #0xC]
        adds    r5, r9, r2
        mov     r2, #0xFF
        mov     r8, r2
        add     r12, r12, r4
        mov     r4, #0
        movmi   r5, r4
        cmp     r5, #0xFF
        movlt   r8, r5
        strb    r8, [r1]
        ldrb    r1, [r0]
        subs    r9, r1, r9
        movmi   r9, r4
        cmp     r9, #0xFF
        movlt   r2, r9
        strb    r2, [r0]
        ldrb    r0, [r6]
        subs    r3, r3, #1
        add     r7, r0, r7
        strb    r7, [r6]
        bne     LFFY0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}


