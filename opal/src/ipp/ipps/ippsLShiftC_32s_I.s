        .text
        .align  4
        .globl  _ippsLShiftC_32s_I


_ippsLShiftC_32s_I:
        stmdb   sp!, {r4 - r8, lr}
        cmp     r0, #0x1F
        bgt     LAYK3
        cmp     r1, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r8, pc}
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r8, pc}
        cmp     r0, #0
        mvnlt   r0, #0x1F
        ldmltia sp!, {r4 - r8, pc}
        cmp     r0, #0
        moveq   r0, #0
        ldmeqia sp!, {r4 - r8, pc}
        cmp     r2, #6
        mov     lr, #0
        blt     LAYK1
        sub     r12, r2, #6
        add     r3, r1, #4
LAYK0:
        ldr     r8, [r3, #-4]
        ldr     r7, [r3]
        ldr     r6, [r3, #4]
        ldr     r5, [r3, #8]
        ldr     r4, [r3, #0xC]
        mov     r8, r8, lsl r0
        mov     r7, r7, lsl r0
        mov     r6, r6, lsl r0
        mov     r5, r5, lsl r0
        mov     r4, r4, lsl r0
        add     lr, lr, #5
        str     r8, [r3, #-4]
        str     r7, [r3]
        str     r6, [r3, #4]
        str     r5, [r3, #8]
        str     r4, [r3, #0xC]
        cmp     lr, r12
        add     r3, r3, #0x14
        ble     LAYK0
LAYK1:
        add     r1, r1, lr, lsl #2
LAYK2:
        ldr     r3, [r1]
        add     lr, lr, #1
        cmp     lr, r2
        mov     r3, r3, lsl r0
        str     r3, [r1], #4
        blt     LAYK2
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}
LAYK3:
        mov     r0, r1
        mov     r1, r2
        ldmia   sp!, {r4 - r8, lr}
        b       _ippsZero_32s


