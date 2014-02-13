        .text
        .align  4
        .globl  _ippsLShiftC_16u_I


_ippsLShiftC_16u_I:
        stmdb   sp!, {r4 - r8, lr}
        cmp     r0, #0xF
        bgt     LAYM3
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
        blt     LAYM1
        sub     r12, r2, #6
        mov     r3, r1
LAYM0:
        ldrh    r8, [r3]
        ldrh    r7, [r3, #2]
        ldrh    r6, [r3, #4]
        ldrh    r5, [r3, #6]
        ldrh    r4, [r3, #8]
        mov     r8, r8, lsl r0
        mov     r7, r7, lsl r0
        mov     r6, r6, lsl r0
        mov     r5, r5, lsl r0
        mov     r4, r4, lsl r0
        add     lr, lr, #5
        strh    r8, [r3]
        strh    r7, [r3, #2]
        strh    r6, [r3, #4]
        strh    r5, [r3, #6]
        strh    r4, [r3, #8]
        cmp     lr, r12
        add     r3, r3, #0xA
        ble     LAYM0
LAYM1:
        add     r1, r1, lr, lsl #1
LAYM2:
        ldrh    r3, [r1]
        add     lr, lr, #1
        cmp     lr, r2
        mov     r3, r3, lsl r0
        strh    r3, [r1], #2
        blt     LAYM2
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}
LAYM3:
        mov     r0, r1
        mov     r1, r2
        ldmia   sp!, {r4 - r8, lr}
        b       _ippsZero_16s


