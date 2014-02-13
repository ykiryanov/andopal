        .text
        .align  4
        .globl  _ippsImag_16sc


_ippsImag_16sc:
        stmdb   sp!, {r4 - r7, lr}
        cmp     r0, #0
        beq     LCUI3
        cmp     r1, #0
        beq     LCUI3
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r7, pc}
        cmp     r2, #6
        mov     r4, #0
        blt     LCUI1
        sub     lr, r2, #6
        sub     r12, r0, #0x12
        mov     r3, r1
LCUI0:
        ldrsh   r6, [r12, #0x14]!
        add     r5, r4, #1
        strh    r6, [r3], #0xA
        add     r6, r0, r5, lsl #2
        ldrsh   r6, [r6, #2]
        mov     r5, r5, lsl #1
        add     r7, r4, #2
        strh    r6, [r1, +r5]
        add     r6, r0, r7, lsl #2
        ldrsh   r6, [r6, #2]
        mov     r7, r7, lsl #1
        add     r5, r4, #3
        strh    r6, [r1, +r7]
        add     r6, r0, r5, lsl #2
        ldrsh   r6, [r6, #2]
        mov     r7, r5, lsl #1
        add     r5, r4, #4
        strh    r6, [r1, +r7]
        add     r4, r4, #5
        add     r6, r0, r5, lsl #2
        ldrsh   r6, [r6, #2]
        mov     r5, r5, lsl #1
        cmp     r4, lr
        strh    r6, [r1, +r5]
        ble     LCUI0
LCUI1:
        mov     r3, r4, lsl #2
        sub     r3, r3, #2
        add     r0, r3, r0
        add     r1, r1, r4, lsl #1
LCUI2:
        ldrsh   r3, [r0, #4]!
        add     r4, r4, #1
        cmp     r4, r2
        strh    r3, [r1], #2
        blt     LCUI2
        mov     r0, #0
        ldmia   sp!, {r4 - r7, pc}
LCUI3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r7, pc}


