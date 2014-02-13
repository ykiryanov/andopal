        .text
        .align  4
        .globl  _ippsFindNearestOne_16u


_ippsFindNearestOne_16u:
        stmdb   sp!, {r4 - r7, lr}
        ldr     lr, [sp, #0x14]
        cmp     r1, #0
        beq     LBYK6
        cmp     r2, #0
        beq     LBYK6
        cmp     r3, #0
        beq     LBYK6
        cmp     lr, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r7, pc}
        cmp     lr, #2
        mov     r12, #0
        blt     LBYK4
        ldrh    r4, [r3]
        cmp     r0, r4
        ble     LBYK4
        mov     r5, lr, lsl #1
        sub     r4, r3, #2
        ldrh    r5, [r4, +r5]
        cmp     r0, r5
        blt     LBYK0
        sub     r12, lr, #1
        mov     r0, r12, lsl #1
        ldrh    lr, [r3, +r0]
        b       LBYK5
LBYK0:
        sub     lr, lr, #1
        cmp     lr, #1
        mov     r4, r3
        ble     LBYK3
LBYK1:
        mov     r5, lr, asr #1
        mov     r7, r5, lsl #1
        ldrh    r6, [r4, +r7]
        add     r7, r4, r7
        cmp     r0, r6
        movlt   lr, r5
        blt     LBYK2
        sub     lr, lr, r5
        add     r12, r12, r5
        mov     r4, r7
LBYK2:
        cmp     lr, #1
        bgt     LBYK1
LBYK3:
        mov     r5, r12, lsl #1
        ldrh    lr, [r3, +r5]
        add     r4, r3, #2
        ldrh    r5, [r4, +r5]
        sub     r4, r0, lr
        sub     r5, r5, r0
        cmp     r4, r5
        ble     LBYK5
        add     r12, r12, #1
        mov     r0, r12, lsl #1
        ldrh    lr, [r3, +r0]
        b       LBYK5
LBYK4:
        ldrh    lr, [r3]
LBYK5:
        strh    lr, [r1]
        mov     r0, #0
        str     r12, [r2]
        ldmia   sp!, {r4 - r7, pc}
LBYK6:
        mvn     r0, #7
        ldmia   sp!, {r4 - r7, pc}


