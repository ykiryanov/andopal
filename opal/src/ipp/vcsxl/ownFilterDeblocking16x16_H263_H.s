        .text
        .align  4
        .globl  ownFilterDeblocking16x16_H263_H


ownFilterDeblocking16x16_H263_H:
        stmdb   sp!, {r4 - r10, lr}
        sub     r3, r0, r1
        sub     r2, r0, r1, lsl #1
        add     r1, r0, r1
        mov     r5, #1
        mov     r4, #0
        mov     lr, #0xFF
        mov     r12, #0x10
LFGB0:
        ldrb    r8, [r0]
        ldrb    r6, [r2]
        ldrb    r9, [r3]
        ldrb    r7, [r1]
        sub     r10, r6, r9, lsl #2
        rsb     r8, r7, r8, lsl #2
        add     r10, r10, r8
        mov     r10, r10, asr #2
        add     r10, r6, r10, lsr #29
        sub     r10, r10, r9, lsl #2
        add     r8, r10, r8
        mov     r9, r4
        movs    r8, r8, asr #3
        sub     r10, r6, r7
        movmi   r9, r5
        mov     r10, r10, asr #1
        add     r9, r8, r9
        add     r10, r6, r10, lsr #30
        mov     r9, r9, asr #1
        sub     r7, r10, r7
        eor     r10, r9, r9, asr #31
        mov     r7, r7, asr #2
        sub     r9, r10, r9, asr #31
        cmp     r7, r9
        bgt     LFGB1
        rsb     r10, r9, #0
        cmp     r10, r7
        mov     r9, r7
        movgt   r9, r10
LFGB1:
        sub     r6, r6, r9
        strb    r6, [r2], #1
        ldrb    r6, [r3]
        mov     r7, lr
        adds    r6, r8, r6
        movmi   r6, r4
        cmp     r6, #0xFF
        movlt   r7, r6
        strb    r7, [r3], #1
        ldrb    r6, [r0]
        subs    r8, r6, r8
        movmi   r8, r4
        cmp     r8, #0xFF
        mov     r6, lr
        movlt   r6, r8
        strb    r6, [r0], #1
        ldrb    r6, [r1]
        subs    r12, r12, #1
        add     r9, r6, r9
        strb    r9, [r1], #1
        bne     LFGB0
        ldmia   sp!, {r4 - r10, pc}


