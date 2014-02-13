        .text
        .align  4
        .globl  _ippsXorC_32u


_ippsXorC_32u:
        stmdb   sp!, {r4 - r7, lr}
        mov     r4, r1
        mov     r1, r2
        cmp     r4, #0
        mov     r2, r3
        ldmeqia sp!, {r4 - r7, lr}
        beq     _ippsCopy_32s
        cmp     r0, #0
        beq     LBJC3
        cmp     r1, #0
        beq     LBJC3
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r7, pc}
        cmp     r2, #6
        mov     r6, #0
        blt     LBJC1
        sub     r5, r2, #6
        add     lr, r0, #4
        add     r12, r1, #4
LBJC0:
        ldr     r7, [lr, #-4]
        add     r6, r6, #5
        cmp     r6, r5
        eor     r7, r4, r7
        str     r7, [r12, #-4]
        ldr     r7, [lr]
        eor     r7, r4, r7
        str     r7, [r12]
        ldr     r7, [lr, #4]
        eor     r7, r4, r7
        str     r7, [r12, #4]
        ldr     r7, [lr, #8]
        eor     r7, r4, r7
        str     r7, [r12, #8]
        ldr     r7, [lr, #0xC]
        add     lr, lr, #0x14
        eor     r7, r4, r7
        str     r7, [r12, #0xC]
        add     r12, r12, #0x14
        ble     LBJC0
LBJC1:
        add     r0, r0, r6, lsl #2
        add     r1, r1, r6, lsl #2
LBJC2:
        ldr     r12, [r0], #4
        add     r6, r6, #1
        eor     r12, r4, r12
        str     r12, [r1], #4
        cmp     r6, r2
        blt     LBJC2
        mov     r0, #0
        ldmia   sp!, {r4 - r7, pc}
LBJC3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r7, pc}

