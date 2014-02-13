        .text
        .align  4
        .globl  _ipps_BitRev1_8


_ipps_BitRev1_8:
        stmdb   sp!, {r4 - r8, lr}
        cmp     r1, #4
        ldmltia sp!, {r4 - r8, pc}
        ldr     r3, [r2]
        ldr     r12, [r2, #4]
        mvn     lr, #7, 2
        and     r1, r1, lr
        mov     r3, r3, asr #1
        mov     lr, r12, asr #1
        cmp     r3, #0
        add     r1, r0, r1, lsl #2
        add     r12, r2, #4
        ble     LCYJ1
LCYJ0:
        ldr     r4, [r0, +r3, lsl #3]
        ldr     r7, [r0, +lr, lsl #3]
        add     r6, r0, lr, lsl #3
        add     r12, r0, r3, lsl #3
        ldr     r5, [r12, #4]
        str     r7, [r0, +r3, lsl #3]
        ldr     r7, [r6, #4]
        add     r8, r1, lr, lsl #3
        str     r7, [r12, #4]
        str     r4, [r0, +lr, lsl #3]
        mov     r12, r3, lsl #3
        str     r5, [r6, #4]
        ldr     r6, [r1, +lr, lsl #3]
        add     r12, r12, #8
        ldr     r5, [r0, +r12]
        str     r6, [r12, +r0]
        add     r4, r0, r12
        ldr     r6, [r8, #4]
        ldr     r7, [r4, #4]
        str     r6, [r4, #4]
        str     r5, [r1, +lr, lsl #3]
        mov     lr, lr, lsl #3
        str     r7, [r8, #4]
        add     lr, lr, #8
        ldr     r6, [r0, +lr]
        ldr     r5, [r1, +r3, lsl #3]
        add     r4, r1, r3, lsl #3
        str     r6, [r1, +r3, lsl #3]
        ldr     r6, [r4, #4]
        add     r7, r0, lr
        ldr     r3, [r7, #4]
        str     r3, [r4, #4]
        str     r5, [lr, +r0]
        str     r6, [r7, #4]
        ldr     r5, [lr, +r1]
        ldr     r4, [r1, +r12]
        add     r3, r12, r1
        str     r5, [r1, +r12]
        ldr     r5, [r3, #4]
        add     r6, r1, lr
        ldr     r12, [r6, #4]
        str     r12, [r3, #4]
        str     r4, [lr, +r1]
        str     r5, [r6, #4]
        ldr     r3, [r2, #8]!
        ldr     lr, [r2, #4]
        mov     r3, r3, asr #1
        cmp     r3, #0
        add     r12, r2, #4
        mov     lr, lr, asr #1
        bgt     LCYJ0
LCYJ1:
        mov     r2, r3, lsl #3
        add     r5, r2, #8
        ldr     r6, [r1, +r3, lsl #3]
        add     r2, r0, r5
        ldr     lr, [r0, +r5]
        ldr     r4, [r2, #4]
        str     r6, [r5, +r0]
        add     r6, r1, r3, lsl #3
        ldr     r5, [r6, #4]
        str     r5, [r2, #4]
        str     lr, [r1, +r3, lsl #3]
        str     r4, [r6, #4]
        ldr     r2, [r12]
        mov     r3, r2, asr #1
        cmp     r3, #0
        addgt   r12, r12, #4
        bgt     LCYJ1
        ldmia   sp!, {r4 - r8, pc}


