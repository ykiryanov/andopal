        .text
        .align  4
        .globl  _ipps_initTabBitRev


_ipps_initTabBitRev:
        stmdb   sp!, {r4 - r8, lr}
        cmp     r0, #2
        movlt   r0, r1
        ldmltia sp!, {r4 - r8, pc}
        sub     r0, r0, #2
        mov     r3, #1
        mov     r2, r3, lsl r0
        add     r12, r2, #1
        cmp     r2, #1
        add     r12, r1, r12, lsl #2
        and     lr, r12, #0x1F
        rsb     lr, lr, #0
        and     lr, lr, #0x1F
        add     r0, r12, lr
        mov     r12, #0
        mov     r7, r2, asr #1
        sub     r6, r2, #1
        ble     LCYF5
        mov     r5, r12
        add     r4, r1, #4
        mov     lr, #4
LCYF0:
        cmp     r7, r5
        mov     r8, r7
        bgt     LCYF2
LCYF1:
        sub     r5, r5, r8
        mov     r8, r8, asr #1
        cmp     r8, r5
        ble     LCYF1
LCYF2:
        add     r5, r5, r8
        cmp     r3, r5
        bge     LCYF3
        str     lr, [r1, +r12, lsl #2]
        mov     r8, r5, lsl #2
        str     r8, [r4, +r12, lsl #2]
        add     r12, r12, #2
        b       LCYF4
LCYF3:
        cmp     r3, r5
        streq   lr, [r1, +r6, lsl #2]
        subeq   r6, r6, #1
LCYF4:
        add     r3, r3, #1
        cmp     r3, r2
        add     lr, lr, #4
        blt     LCYF0
LCYF5:
        mov     r3, #0
        str     r3, [r1, +r12, lsl #2]
        str     r3, [r1, +r2, lsl #2]
        ldmia   sp!, {r4 - r8, pc}


