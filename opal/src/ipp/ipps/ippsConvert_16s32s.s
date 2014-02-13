        .text
        .align  4
        .globl  _ippsConvert_16s32s


_ippsConvert_16s32s:
        stmdb   sp!, {r4 - r8, lr}
        cmp     r0, #0
        beq     LCWE3
        cmp     r1, #0
        beq     LCWE3
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r8, pc}
        cmp     r2, #6
        mov     r4, #0
        blt     LCWE1
        sub     lr, r2, #6
        mov     r12, r0
        mov     r3, r1
LCWE0:
        ldrsh   r6, [r12], #0xA
        add     r5, r4, #1
        str     r6, [r3], #0x14
        mov     r6, r5, lsl #1
        ldrsh   r7, [r0, +r6]
        add     r6, r4, #2
        str     r7, [r1, +r5, lsl #2]
        mov     r7, r6, lsl #1
        ldrsh   r7, [r0, +r7]
        add     r5, r4, #3
        str     r7, [r1, +r6, lsl #2]
        add     r6, r4, #4
        mov     r8, r5, lsl #1
        ldrsh   r8, [r0, +r8]
        add     r4, r4, #5
        cmp     r4, lr
        str     r8, [r1, +r5, lsl #2]
        mov     r5, r6, lsl #1
        ldrsh   r5, [r0, +r5]
        str     r5, [r1, +r6, lsl #2]
        ble     LCWE0
LCWE1:
        add     r0, r0, r4, lsl #1
        add     r1, r1, r4, lsl #2
LCWE2:
        ldrsh   r3, [r0], #2
        add     r4, r4, #1
        cmp     r4, r2
        str     r3, [r1], #4
        blt     LCWE2
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}
LCWE3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r8, pc}


