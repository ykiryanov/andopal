        .text
        .align  4
        .globl  ownvc_Add8x8_16s8u_C1IRS


ownvc_Add8x8_16s8u_C1IRS:
        stmdb   sp!, {r4 - r8, lr}
        mov     r4, #0
        mov     lr, #0xFF
        mov     r12, #8
LEME0:
        ldrsh   r8, [r0]
        ldrb    r6, [r2]
        ldrb    r5, [r2, #4]
        ldrb    r7, [r2, #1]
        add     r6, r8, r6
        cmp     r6, #0xFF
        movgt   r6, lr
        cmp     r6, #0
        mov     r8, r4
        movgt   r8, r6
        strb    r8, [r2]
        ldrsh   r8, [r0, #2]
        ldrb    r6, [r2, #2]
        add     r7, r8, r7
        cmp     r7, #0xFF
        movgt   r7, lr
        mov     r8, r4
        cmp     r7, #0
        movgt   r8, r7
        ldrb    r7, [r2, #3]
        strb    r8, [r2, #1]
        ldrsh   r8, [r0, #4]
        add     r6, r8, r6
        cmp     r6, #0xFF
        movgt   r6, lr
        cmp     r6, #0
        mov     r8, r4
        movgt   r8, r6
        strb    r8, [r2, #2]
        ldrsh   r8, [r0, #6]
        ldrb    r6, [r2, #5]
        add     r7, r8, r7
        cmp     r7, #0xFF
        movgt   r7, lr
        mov     r8, r4
        cmp     r7, #0
        movgt   r8, r7
        strb    r8, [r2, #3]
        ldrsh   r8, [r0, #8]
        ldrb    r7, [r2, #6]
        add     r5, r8, r5
        cmp     r5, #0xFF
        movgt   r5, lr
        cmp     r5, #0
        mov     r8, r4
        movgt   r8, r5
        strb    r8, [r2, #4]
        ldrsh   r8, [r0, #0xA]
        ldrb    r5, [r2, #7]
        add     r6, r8, r6
        cmp     r6, #0xFF
        movgt   r6, lr
        cmp     r6, #0
        mov     r8, r4
        movgt   r8, r6
        strb    r8, [r2, #5]
        ldrsh   r6, [r0, #0xC]
        add     r7, r6, r7
        cmp     r7, #0xFF
        movgt   r7, lr
        cmp     r7, #0
        mov     r6, r4
        movgt   r6, r7
        strb    r6, [r2, #6]
        ldrsh   r6, [r0, #0xE]
        add     r0, r0, r1
        add     r5, r6, r5
        cmp     r5, #0xFF
        movgt   r5, lr
        cmp     r5, #0
        mov     r6, r4
        movgt   r6, r5
        strb    r6, [r2, #7]
        subs    r12, r12, #1
        add     r2, r2, r3
        bne     LEME0
        ldmia   sp!, {r4 - r8, pc}


