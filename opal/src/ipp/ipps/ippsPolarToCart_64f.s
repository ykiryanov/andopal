        .text
        .align  4
        .globl  _ippsPolarToCart_64f


_ippsPolarToCart_64f:
        stmdb   sp!, {r4 - r8, lr}
        ldr     r8, [sp, #0x18]
        cmp     r0, #0
        beq     LBAO2
        cmp     r1, #0
        beq     LBAO2
        cmp     r2, #0
        beq     LBAO2
        cmp     r3, #0
        beq     LBAO2
        cmp     r8, #1
        mvnlt   r0, #5
        ldmltia sp!, {r4 - r8, pc}
        cmp     r8, #0
        ble     LBAO1
        sub     r7, r3, #4
        sub     r6, r2, #4
        sub     r5, r0, #4
        sub     r4, r1, #4
LBAO0:
        ldr     r0, [r4, #4]
        ldr     r1, [r4, #8]
        bl      cos
        ldr     r2, [r5, #4]
        ldr     r3, [r5, #8]
        bl      __muldf3
        str     r0, [r6, #4]
        str     r1, [r6, #8]!
        ldr     r0, [r4, #4]
        ldr     r1, [r4, #8]!
        bl      sin
        ldr     r2, [r5, #4]
        ldr     r3, [r5, #8]!
        bl      __muldf3
        str     r0, [r7, #4]
        str     r1, [r7, #8]!
        subs    r8, r8, #1
        bne     LBAO0
LBAO1:
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}
LBAO2:
        mvn     r0, #7
        ldmia   sp!, {r4 - r8, pc}


