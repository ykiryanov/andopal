        .text
        .align  4
        .globl  _ippsPolarToCart_64fc


_ippsPolarToCart_64fc:
        stmdb   sp!, {r4 - r7, lr}
        cmp     r2, #0
        mov     r4, r3
        beq     LBAN2
        cmp     r0, #0
        beq     LBAN2
        cmp     r1, #0
        beq     LBAN2
        cmp     r4, #1
        mvnlt   r0, #5
        ldmltia sp!, {r4 - r7, pc}
        cmp     r4, #0
        ble     LBAN1
        sub     r7, r0, #4
        sub     r6, r1, #4
        sub     r5, r2, #4
LBAN0:
        ldr     r0, [r6, #4]
        ldr     r1, [r6, #8]
        bl      cos
        ldr     r2, [r7, #4]
        ldr     r3, [r7, #8]
        bl      __muldf3
        str     r0, [r5, #4]
        str     r1, [r5, #8]
        ldr     r0, [r6, #4]
        ldr     r1, [r6, #8]!
        bl      sin
        ldr     r2, [r7, #4]
        ldr     r3, [r7, #8]!
        bl      __muldf3
        str     r0, [r5, #0xC]
        str     r1, [r5, #0x10]!
        subs    r4, r4, #1
        bne     LBAN0
LBAN1:
        mov     r0, #0
        ldmia   sp!, {r4 - r7, pc}
LBAN2:
        mvn     r0, #7
        ldmia   sp!, {r4 - r7, pc}


