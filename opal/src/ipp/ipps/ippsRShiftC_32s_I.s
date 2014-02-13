        .text
        .align  4
        .globl  _ippsRShiftC_32s_I


_ippsRShiftC_32s_I:
        stmdb   sp!, {r4 - r8, lr}
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
        cmp     r0, #0x1F
        mov     lr, #0
        bgt     LAYC3
        cmp     r2, #6
        blt     LAYC1
        sub     r12, r2, #6
        add     r3, r1, #4
LAYC0:
        ldr     r8, [r3, #-4]
        ldr     r7, [r3]
        ldr     r6, [r3, #4]
        ldr     r5, [r3, #8]
        ldr     r4, [r3, #0xC]
        mov     r8, r8, asr r0
        mov     r7, r7, asr r0
        mov     r6, r6, asr r0
        mov     r5, r5, asr r0
        mov     r4, r4, asr r0
        add     lr, lr, #5
        str     r8, [r3, #-4]
        str     r7, [r3]
        str     r6, [r3, #4]
        str     r5, [r3, #8]
        str     r4, [r3, #0xC]
        cmp     lr, r12
        add     r3, r3, #0x14
        ble     LAYC0
LAYC1:
        add     r1, r1, lr, lsl #2
LAYC2:
        ldr     r3, [r1]
        add     lr, lr, #1
        cmp     lr, r2
        mov     r3, r3, asr r0
        str     r3, [r1], #4
        blt     LAYC2
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}
LAYC3:
        mvn     r3, #0
        mov     r0, lr
LAYC4:
        ldr     r12, [r1]
        cmp     r12, #0
        movlt   r12, r3
        movge   r12, lr
        add     r0, r0, #1
        str     r12, [r1], #4
        cmp     r0, r2
        blt     LAYC4
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}


