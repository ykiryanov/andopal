        .text
        .align  4
        .globl  _ippsThreshold_16s


_ippsThreshold_16s:
        stmdb   sp!, {r4, lr}
        ldr     r12, [sp, #8]
        cmp     r0, #0
        beq     LART2
        cmp     r1, #0
        beq     LART2
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4, pc}
        cmp     r12, #4
        mov     r12, #0
        beq     LART1
LART0:
        ldrsh   r4, [r0], #2
        mov     lr, r3
        add     r12, r12, #1
        cmp     r4, r3
        movgt   lr, r4
        strh    lr, [r1], #2
        cmp     r12, r2
        blt     LART0
        mov     r0, #0
        ldmia   sp!, {r4, pc}
LART1:
        ldrsh   lr, [r0], #2
        mov     r4, r3
        cmp     lr, r3
        movlt   r4, lr
        add     r12, r12, #1
        strh    r4, [r1], #2
        cmp     r12, r2
        blt     LART1
        mov     r0, #0
        ldmia   sp!, {r4, pc}
LART2:
        mvn     r0, #7
        ldmia   sp!, {r4, pc}


