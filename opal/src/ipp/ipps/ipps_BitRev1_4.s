        .text
        .align  4
        .globl  _ipps_BitRev1_4


_ipps_BitRev1_4:
        stmdb   sp!, {r4 - r6, lr}
        cmp     r1, #4
        ldmltia sp!, {r4 - r6, pc}
        ldr     r12, [r2]
        ldr     r3, [r2, #4]
        mvn     lr, #6, 2
        and     r1, r1, lr
        mov     r12, r12, asr #1
        cmp     r12, #0
        add     r1, r0, r1, lsl #1
        mov     r3, r3, asr #1
        add     r5, r2, #4
        addle   r4, r0, #4
        ble     LCYK1
        add     r4, r0, #4
        add     lr, r1, #4
LCYK0:
        ldr     r5, [r0, +r3, lsl #2]
        ldr     r6, [r0, +r12, lsl #2]
        str     r5, [r0, +r12, lsl #2]
        str     r6, [r0, +r3, lsl #2]
        ldr     r5, [r1, +r3, lsl #2]
        ldr     r6, [r4, +r12, lsl #2]
        str     r5, [r4, +r12, lsl #2]
        str     r6, [r1, +r3, lsl #2]
        ldr     r5, [r4, +r3, lsl #2]
        ldr     r6, [r1, +r12, lsl #2]
        str     r5, [r1, +r12, lsl #2]
        str     r6, [r4, +r3, lsl #2]
        ldr     r5, [lr, +r3, lsl #2]
        ldr     r6, [lr, +r12, lsl #2]
        str     r5, [lr, +r12, lsl #2]
        str     r6, [lr, +r3, lsl #2]
        ldr     r12, [r2, #8]!
        ldr     r3, [r2, #4]
        mov     r12, r12, asr #1
        cmp     r12, #0
        add     r5, r2, #4
        mov     r3, r3, asr #1
        bgt     LCYK0
LCYK1:
        ldr     r0, [r1, +r12, lsl #2]
        ldr     r2, [r4, +r12, lsl #2]
        str     r0, [r4, +r12, lsl #2]
        str     r2, [r1, +r12, lsl #2]
        ldr     r0, [r5]
        mov     r12, r0, asr #1
        cmp     r12, #0
        addgt   r5, r5, #4
        bgt     LCYK1
        ldmia   sp!, {r4 - r6, pc}


