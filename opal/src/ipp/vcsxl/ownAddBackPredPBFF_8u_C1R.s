        .text
        .align  4
        .globl  ownAddBackPredPBFF_8u_C1R


ownAddBackPredPBFF_8u_C1R:
        stmdb   sp!, {r4 - r9, lr}
        sub     sp, sp, #8
        str     r2, [sp]
        ldr     lr, [sp, #0x24]
        ldr     r12, [sp, #0x28]
        str     r3, [sp, #4]
        cmp     r3, #0
        ble     LFGN4
        sub     r4, r2, #5
LFGN0:
        cmp     r2, #0
        ble     LFGN3
        cmp     r2, #5
        movlt   r7, #0
        blt     LFGN2
        mov     r7, #0
        sub     r6, r0, #1
        sub     r5, lr, #1
LFGN1:
        ldrb    r9, [r7, +r0]
        ldrb    r8, [r7, +lr]
        add     r9, r8, r9
        mov     r8, r9, asr #1
        strb    r8, [r7, +lr]
        ldrb    r9, [r6, #2]
        ldrb    r8, [r5, #2]
        add     r7, r7, #4
        cmp     r7, r4
        add     r9, r8, r9
        mov     r8, r9, asr #1
        strb    r8, [r5, #2]
        ldrb    r9, [r6, #3]
        ldrb    r8, [r5, #3]
        add     r9, r8, r9
        ldrb    r8, [r5, #4]
        mov     r9, r9, asr #1
        strb    r9, [r5, #3]
        ldrb    r9, [r6, #4]!
        add     r9, r8, r9
        mov     r8, r9, asr #1
        strb    r8, [r5, #4]!
        ble     LFGN1
LFGN2:
        ldrb    r5, [r7, +r0]
        ldrb    r6, [r7, +lr]
        add     r5, r6, r5
        mov     r5, r5, asr #1
        strb    r5, [r7, +lr]
        add     r7, r7, #1
        cmp     r7, r2
        blt     LFGN2
LFGN3:
        subs    r3, r3, #1
        add     r0, r1, r0
        add     lr, r12, lr
        bne     LFGN0
LFGN4:
        add     sp, sp, #8
        ldmia   sp!, {r4 - r9, pc}


