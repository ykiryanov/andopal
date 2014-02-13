        .text
        .align  4
        .globl  ownFilterDeblocking8x8_H263_H


ownFilterDeblocking8x8_H263_H:
        stmdb   sp!, {r4 - r11, lr}
        sub     r12, r0, r1
        sub     r3, r0, r1, lsl #1
        add     r1, r0, r1
        mov     r4, #0
        mov     r6, #1
        mov     r5, #0xFF
        mov     lr, #8
LFFZ0:
        ldrb    r6, [r3]
        ldrb    r7, [r0]
        ldrb    r8, [r12]
        ldrb    r5, [r1]
        sub     r9, r6, r8, lsl #2
        rsb     r7, r5, r7, lsl #2
        add     r9, r9, r7
        mov     r9, r9, asr #2
        add     r9, r6, r9, lsr #29
        sub     r9, r9, r8, lsl #2
        add     r7, r9, r7
        movs    r8, r7, asr #3
        mvnmi   r9, #0
        movpl   r9, #1
        eor     r10, r8, r8, asr #31
        sub     r7, r6, r5
        sub     r8, r10, r8, asr #31
        sub     r10, r8, r2
        mov     r7, r7, asr #1
        mov     r10, r10, lsl #1
        cmp     r10, #0
        mov     r11, r4
        movgt   r11, r10
        sub     r8, r8, r11
        cmp     r8, #0
        mov     r10, r4
        movgt   r10, r8
        muls    r8, r9, r10
        add     r7, r6, r7, lsr #30
        sub     r5, r7, r5
        mov     r7, r4
        mov     r9, #1
        movmi   r7, r9
        add     r7, r8, r7
        mov     r5, r5, asr #2
        mov     r7, r7, asr #1
        eor     r9, r7, r7, asr #31
        sub     r7, r9, r7, asr #31
        cmp     r5, r7
        bgt     LFFZ1
        rsb     r9, r7, #0
        cmp     r9, r5
        mov     r7, r5
        movgt   r7, r9
LFFZ1:
        sub     r6, r6, r7
        strb    r6, [r3], #1
        ldrb    r5, [r12]
        adds    r6, r8, r5
        movmi   r6, r4
        cmp     r6, #0xFF
        mov     r5, #0xFF
        mov     r9, r5
        movlt   r9, r6
        strb    r9, [r12], #1
        ldrb    r6, [r0]
        subs    r8, r6, r8
        movmi   r8, r4
        cmp     r8, #0xFF
        movlt   r5, r8
        strb    r5, [r0], #1
        ldrb    r5, [r1]
        subs    lr, lr, #1
        add     r7, r5, r7
        strb    r7, [r1], #1
        bne     LFFZ0
        ldmia   sp!, {r4 - r11, pc}


