        .text
        .align  4
        .globl  _ippsConjCcs_32fc


_ippsConjCcs_32fc:
        stmdb   sp!, {r4, lr}
        cmp     r0, #0
        beq     LCYB3
        cmp     r1, #0
        beq     LCYB3
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4, pc}
        ldr     r3, [r0]
        mov     r12, #0
        cmp     r2, #0
        str     r3, [r1]
        mov     r3, #1
        movlt   r12, r3
        ldr     r3, [r0, #4]
        add     r12, r2, r12
        tst     r2, #1
        str     r3, [r1, #4]
        mov     r2, r12, asr #1
        add     r3, r2, #1
        bne     LCYB0
        sub     r2, r2, #1
        add     r4, r0, #8
        ldr     lr, [r4, +r2, lsl #3]
        add     r12, r1, #8
        add     r4, r4, r2, lsl #3
        str     lr, [r12, +r2, lsl #3]
        ldr     lr, [r4, #4]
        add     r12, r12, r2, lsl #3
        str     lr, [r12, #4]
LCYB0:
        cmp     r2, #0
        ble     LCYB2
        mov     r3, r3, lsl #3
        mov     r12, r2, lsl #3
        sub     r3, r3, #4
        add     r12, r12, #0xC
        add     r3, r3, r1
        add     r1, r12, r1
        add     r0, r12, r0
LCYB1:
        ldr     lr, [r0, #-8]
        ldr     r12, [r0, #-0xC]
        sub     r0, r0, #8
        str     lr, [r1, #-8]
        eor     lr, lr, #2, 2
        str     r12, [r1, #-0xC]
        sub     r2, r2, #1
        str     r12, [r3, #4]
        str     lr, [r3, #8]!
        cmp     r2, #0
        sub     r1, r1, #8
        bgt     LCYB1
LCYB2:
        mov     r0, #0
        ldmia   sp!, {r4, pc}
LCYB3:
        mvn     r0, #7
        ldmia   sp!, {r4, pc}


