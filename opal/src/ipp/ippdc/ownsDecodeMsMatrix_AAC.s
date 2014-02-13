        .text
        .align  4
        .globl  ownsDecodeMsMatrix_AAC


ownsDecodeMsMatrix_AAC:
        stmdb   sp!, {r4 - r7, lr}
        cmp     r2, #0
        ble     LGHN3
        cmp     r2, #4
        mov     r4, #0
        blt     LGHN1
        sub     lr, r2, #4
        add     r12, r1, #4
        add     r3, r0, #4
LGHN0:
        ldr     r5, [r12, #-4]
        ldr     r6, [r3, #-4]
        add     r4, r4, #3
        cmp     r4, lr
        sub     r7, r6, r5
        str     r7, [r12, #-4]
        add     r5, r6, r5
        str     r5, [r3, #-4]
        ldr     r6, [r12]
        ldr     r7, [r3]
        sub     r5, r7, r6
        str     r5, [r12]
        ldr     r5, [r3, #4]
        add     r6, r7, r6
        str     r6, [r3]
        ldr     r6, [r12, #4]
        sub     r7, r5, r6
        str     r7, [r12, #4]
        add     r6, r5, r6
        str     r6, [r3, #4]
        add     r12, r12, #0xC
        add     r3, r3, #0xC
        ble     LGHN0
LGHN1:
        add     r1, r1, r4, lsl #2
        add     r0, r0, r4, lsl #2
LGHN2:
        ldr     r3, [r1]
        ldr     r12, [r0]
        add     r4, r4, #1
        cmp     r4, r2
        sub     lr, r12, r3
        str     lr, [r1], #4
        add     r3, r12, r3
        str     r3, [r0], #4
        blt     LGHN2
LGHN3:
        ldmia   sp!, {r4 - r7, pc}


