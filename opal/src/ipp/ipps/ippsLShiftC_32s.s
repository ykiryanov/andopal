        .text
        .align  4
        .globl  _ippsLShiftC_32s


_ippsLShiftC_32s:
        stmdb   sp!, {r4 - r7, lr}
        mov     r4, r1
        mov     r1, r2
        cmp     r4, #0
        mov     r2, r3
        ldmeqia sp!, {r4 - r7, lr}
        beq     _ippsCopy_32s
        cmp     r4, #0x1F
        ble     LAYL0
        cmp     r0, #0
        beq     LAYL4
        mov     r0, r1
        mov     r1, r2
        ldmia   sp!, {r4 - r7, lr}
        b       _ippsZero_32s
LAYL0:
        cmp     r0, #0
        beq     LAYL4
        cmp     r1, #0
        beq     LAYL4
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r7, pc}
        cmp     r4, #0
        mvnlt   r0, #0x1F
        ldmltia sp!, {r4 - r7, pc}
        cmp     r2, #6
        mov     r6, #0
        blt     LAYL2
        sub     r5, r2, #6
        add     lr, r0, #4
        add     r12, r1, #4
LAYL1:
        ldr     r7, [lr, #-4]
        add     r6, r6, #5
        cmp     r6, r5
        mov     r7, r7, lsl r4
        str     r7, [r12, #-4]
        ldr     r7, [lr]
        mov     r7, r7, lsl r4
        str     r7, [r12]
        ldr     r7, [lr, #4]
        mov     r7, r7, lsl r4
        str     r7, [r12, #4]
        ldr     r7, [lr, #8]
        mov     r7, r7, lsl r4
        str     r7, [r12, #8]
        ldr     r7, [lr, #0xC]
        add     lr, lr, #0x14
        mov     r7, r7, lsl r4
        str     r7, [r12, #0xC]
        add     r12, r12, #0x14
        ble     LAYL1
LAYL2:
        add     r0, r0, r6, lsl #2
        add     r1, r1, r6, lsl #2
LAYL3:
        ldr     r12, [r0], #4
        add     r6, r6, #1
        mov     r12, r12, lsl r4
        str     r12, [r1], #4
        cmp     r6, r2
        blt     LAYL3
        mov     r0, #0
        ldmia   sp!, {r4 - r7, pc}
LAYL4:
        mvn     r0, #7
        ldmia   sp!, {r4 - r7, pc}


