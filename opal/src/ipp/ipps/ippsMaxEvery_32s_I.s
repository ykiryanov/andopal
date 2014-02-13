        .text
        .align  4
        .globl  _ippsMaxEvery_32s_I


_ippsMaxEvery_32s_I:
        stmdb   sp!, {r4 - r8, lr}
        cmp     r0, #0
        beq     LBGA3
        cmp     r1, #0
        beq     LBGA3
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r8, pc}
        bic     r6, r2, #1
        cmp     r6, #0
        ble     LBGA1
        mov     r5, #0
        add     r4, r0, #4
        add     lr, r1, #4
        mov     r12, r0
        mov     r3, r1
LBGA0:
        ldr     r8, [r3]
        ldr     r7, [r12], #8
        add     r5, r5, #2
        cmp     r7, r8
        movgt   r8, r7
        str     r8, [r3], #8
        ldr     r8, [lr]
        ldr     r7, [r4], #8
        cmp     r7, r8
        movgt   r8, r7
        str     r8, [lr], #8
        cmp     r5, r6
        blt     LBGA0
LBGA1:
        tst     r2, #1
        beq     LBGA2
        sub     r0, r0, #4
        sub     r1, r1, #4
        ldr     r3, [r1, +r2, lsl #2]
        ldr     r0, [r0, +r2, lsl #2]
        cmp     r0, r3
        movgt   r3, r0
        str     r3, [r1, +r2, lsl #2]
LBGA2:
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}
LBGA3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r8, pc}


