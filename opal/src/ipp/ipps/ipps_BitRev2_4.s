        .text
        .align  4
        .globl  _ipps_BitRev2_4


_ipps_BitRev2_4:
        stmdb   sp!, {r4 - r9, lr}
        cmp     r2, #8
        bge     LCYH1
        ldr     r3, [r0]
        sub     r12, r0, #4
        cmp     r2, #2
        str     r3, [r1]
        ldr     r3, [r12, +r2, lsl #2]
        sub     r12, r1, #4
        str     r3, [r12, +r2, lsl #2]
        ble     LCYH0
        ldr     r2, [r0, #4]
        str     r2, [r1, #8]
        ldr     r0, [r0, #8]
        str     r0, [r1, #4]
LCYH0:
        ldmia   sp!, {r4 - r9, pc}
LCYH1:
        ldr     lr, [r3]
        ldr     r12, [r3, #4]
        mvn     r4, #6, 2
        and     r2, r2, r4
        mov     lr, lr, asr #1
        cmp     lr, #0
        add     r9, r1, r2, lsl #1
        mov     r12, r12, asr #1
        add     r2, r0, r2, lsl #1
        add     r4, r3, #4
        ble     LCYH4
        add     r5, r1, #4
        add     r6, r0, #4
        add     r8, r9, #4
        add     r7, r2, #4
LCYH2:
        ldr     r4, [r0, +lr, lsl #2]
        str     r4, [r1, +r12, lsl #2]
        ldr     r4, [r2, +lr, lsl #2]
        str     r4, [r5, +r12, lsl #2]
        ldr     r4, [r0, +r12, lsl #2]
        str     r4, [r1, +lr, lsl #2]
        ldr     r4, [r2, +r12, lsl #2]
        str     r4, [r5, +lr, lsl #2]
        ldr     r4, [r6, +lr, lsl #2]
        str     r4, [r9, +r12, lsl #2]
        ldr     r4, [r7, +lr, lsl #2]
        str     r4, [r8, +r12, lsl #2]
        ldr     r4, [r6, +r12, lsl #2]
        str     r4, [r9, +lr, lsl #2]
        ldr     r12, [r7, +r12, lsl #2]
        str     r12, [r8, +lr, lsl #2]
        ldr     lr, [r3, #8]!
        ldr     r12, [r3, #4]
        mov     lr, lr, asr #1
        cmp     lr, #0
        add     r4, r3, #4
        mov     r12, r12, asr #1
        bgt     LCYH2
LCYH3:
        ldr     r3, [r0, +lr, lsl #2]
        str     r3, [r1, +lr, lsl #2]
        ldr     r3, [r2, +lr, lsl #2]
        str     r3, [r5, +lr, lsl #2]
        ldr     r3, [r6, +lr, lsl #2]
        str     r3, [r9, +lr, lsl #2]
        ldr     r3, [r7, +lr, lsl #2]
        str     r3, [r8, +lr, lsl #2]
        ldr     r3, [r4]
        mov     lr, r3, asr #1
        cmp     lr, #0
        addgt   r4, r4, #4
        bgt     LCYH3
        b       LCYH5
LCYH4:
        add     r5, r1, #4
        add     r6, r0, #4
        add     r8, r9, #4
        add     r7, r2, #4
        b       LCYH3
LCYH5:
        ldmia   sp!, {r4 - r9, pc}


