        .text
        .align  4
        .globl  _ipps_BitRev2_8


_ipps_BitRev2_8:
        stmdb   sp!, {r4 - r8, lr}
        cmp     r2, #8
        bge     LCYG1
        ldr     r3, [r0]
        cmp     r2, #2
        mov     r2, r2, lsl #3
        str     r3, [r1]
        ldr     r3, [r0, #4]
        sub     r2, r2, #8
        add     r12, r0, r2
        str     r3, [r1, #4]
        ldr     r3, [r0, +r2]
        str     r3, [r2, +r1]
        ldr     r3, [r12, #4]
        add     r2, r1, r2
        str     r3, [r2, #4]
        ble     LCYG0
        ldr     r2, [r0, #8]
        str     r2, [r1, #0x10]
        ldr     r2, [r0, #0xC]
        str     r2, [r1, #0x14]
        ldr     r2, [r0, #0x10]
        str     r2, [r1, #8]
        ldr     r0, [r0, #0x14]
        str     r0, [r1, #0xC]
LCYG0:
        ldmia   sp!, {r4 - r8, pc}
LCYG1:
        ldr     lr, [r3, #4]
        ldr     r12, [r3]
        mvn     r4, #7, 2
        and     r2, r2, r4
        mov     r4, lr, asr #1
        mov     r12, r12, asr #1
        add     lr, r1, r2, lsl #2
        cmp     r12, #0
        add     r2, r0, r2, lsl #2
        add     r5, r3, #4
        ble     LCYG3
LCYG2:
        ldr     r5, [r0, +r12, lsl #3]
        add     r7, r0, r12, lsl #3
        mov     r6, r4, lsl #3
        str     r5, [r1, +r4, lsl #3]
        ldr     r5, [r7, #4]
        add     r6, r6, #8
        add     r7, r1, r4, lsl #3
        str     r5, [r7, #4]
        ldr     r5, [r2, +r12, lsl #3]
        add     r7, r2, r12, lsl #3
        str     r5, [r1, +r6]
        ldr     r5, [r7, #4]
        add     r7, r1, r6
        str     r5, [r7, #4]
        ldr     r5, [r0, +r4, lsl #3]
        add     r7, r0, r4, lsl #3
        str     r5, [r1, +r12, lsl #3]
        ldr     r5, [r7, #4]
        add     r7, r1, r12, lsl #3
        str     r5, [r7, #4]
        ldr     r7, [r2, +r4, lsl #3]
        mov     r5, r12, lsl #3
        add     r5, r5, #8
        str     r7, [r1, +r5]
        add     r7, r2, r4, lsl #3
        ldr     r7, [r7, #4]
        add     r8, r1, r5
        str     r7, [r8, #4]
        ldr     r7, [r5, +r0]
        add     r8, r0, r5
        str     r7, [lr, +r4, lsl #3]
        ldr     r7, [r8, #4]
        add     r4, lr, r4, lsl #3
        str     r7, [r4, #4]
        ldr     r4, [r5, +r2]
        add     r7, r2, r5
        str     r4, [r6, +lr]
        ldr     r4, [r7, #4]
        add     r7, lr, r6
        str     r4, [r7, #4]
        ldr     r4, [r6, +r0]
        add     r7, r0, r6
        str     r4, [lr, +r12, lsl #3]
        ldr     r4, [r7, #4]
        add     r12, lr, r12, lsl #3
        str     r4, [r12, #4]
        ldr     r12, [r6, +r2]
        add     r6, r2, r6
        str     r12, [r5, +lr]
        ldr     r6, [r6, #4]
        add     r5, lr, r5
        str     r6, [r5, #4]
        ldr     r12, [r3, #8]!
        ldr     r4, [r3, #4]
        mov     r12, r12, asr #1
        cmp     r12, #0
        add     r5, r3, #4
        mov     r4, r4, asr #1
        bgt     LCYG2
LCYG3:
        ldr     r4, [r0, +r12, lsl #3]
        add     r3, r0, r12, lsl #3
        str     r4, [r1, +r12, lsl #3]
        ldr     r3, [r3, #4]
        add     r4, r1, r12, lsl #3
        str     r3, [r4, #4]
        ldr     r4, [r2, +r12, lsl #3]
        mov     r3, r12, lsl #3
        add     r3, r3, #8
        str     r4, [r1, +r3]
        add     r4, r2, r12, lsl #3
        ldr     r4, [r4, #4]
        add     r6, r1, r3
        str     r4, [r6, #4]
        ldr     r6, [r3, +r0]
        add     r4, r0, r3
        str     r6, [lr, +r12, lsl #3]
        ldr     r4, [r4, #4]
        add     r12, lr, r12, lsl #3
        str     r4, [r12, #4]
        ldr     r4, [r3, +r2]
        add     r12, r2, r3
        str     r4, [r3, +lr]
        ldr     r12, [r12, #4]
        add     r3, lr, r3
        str     r12, [r3, #4]
        ldr     r3, [r5]
        mov     r12, r3, asr #1
        cmp     r12, #0
        addgt   r5, r5, #4
        bgt     LCYG3
        ldmia   sp!, {r4 - r8, pc}


