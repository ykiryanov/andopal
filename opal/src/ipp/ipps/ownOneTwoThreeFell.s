        .text
        .align  4
        .globl  ownOneTwoThreeFell


ownOneTwoThreeFell:
        stmdb   sp!, {r4 - r10, lr}
        cmp     r1, #8
        mov     r2, #0
        ble     LAWX4
        mov     r8, r1, asr #3
        cmp     r8, #0
        and     r9, r1, #7
        ble     LAWX1
        add     r7, r0, #4
        add     r6, r0, #8
        add     r5, r0, #0xC
        add     r4, r0, #0x10
        add     lr, r0, #0x14
        add     r12, r0, #0x18
        add     r3, r0, #0x1C
LAWX0:
        str     r2, [r0, +r2, lsl #2]
        add     r10, r2, #1
        str     r10, [r7], #0x20
        add     r10, r2, #2
        str     r10, [r6], #0x20
        add     r10, r2, #3
        str     r10, [r5], #0x20
        add     r10, r2, #4
        str     r10, [r4], #0x20
        add     r10, r2, #5
        str     r10, [lr], #0x20
        add     r10, r2, #6
        str     r10, [r12], #0x20
        add     r10, r2, #7
        str     r10, [r3], #0x20
        subs    r8, r8, #1
        add     r2, r2, #8
        bne     LAWX0
LAWX1:
        sub     r9, r1, r9
        cmp     r9, r1
        bge     LAWX7
        sub     r2, r1, r9
        cmp     r2, #6
        blt     LAWX3
        sub     r2, r1, #6
LAWX2:
        str     r9, [r0, +r9, lsl #2]
        add     r3, r9, #1
        str     r3, [r0, +r3, lsl #2]
        add     r3, r9, #2
        str     r3, [r0, +r3, lsl #2]
        add     r3, r9, #3
        str     r3, [r0, +r3, lsl #2]
        add     r3, r9, #4
        add     r9, r9, #5
        cmp     r9, r2
        str     r3, [r0, +r3, lsl #2]
        ble     LAWX2
LAWX3:
        str     r9, [r0, +r9, lsl #2]
        add     r9, r9, #1
        cmp     r9, r1
        blt     LAWX3
        ldmia   sp!, {r4 - r10, pc}
LAWX4:
        cmp     r1, #0
        ble     LAWX7
        cmp     r1, #6
        blt     LAWX6
        sub     r3, r1, #6
LAWX5:
        str     r2, [r0, +r2, lsl #2]
        add     r12, r2, #1
        str     r12, [r0, +r12, lsl #2]
        add     r12, r2, #2
        str     r12, [r0, +r12, lsl #2]
        add     r12, r2, #3
        str     r12, [r0, +r12, lsl #2]
        add     r12, r2, #4
        add     r2, r2, #5
        cmp     r2, r3
        str     r12, [r0, +r12, lsl #2]
        ble     LAWX5
LAWX6:
        str     r2, [r0, +r2, lsl #2]
        add     r2, r2, #1
        cmp     r2, r1
        blt     LAWX6
LAWX7:
        ldmia   sp!, {r4 - r10, pc}


