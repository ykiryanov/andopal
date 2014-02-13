        .text
        .align  4
        .globl  _ippsMinMax_32f


_ippsMinMax_32f:
        stmdb   sp!, {r4 - r10, lr}
        mov     r6, r0
        cmp     r6, #0
        mov     r5, r1
        mov     r10, r2
        mov     r9, r3
        beq     LBGT2
        cmp     r10, #0
        beq     LBGT2
        cmp     r9, #0
        beq     LBGT2
        cmp     r5, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r10, pc}
        ldr     r8, [r6]
        cmp     r5, #0
        mov     r7, r8
        ble     LBGT1
LBGT0:
        ldr     r4, [r6], #4
        mov     r1, r8
        mov     r0, r4
        bl      __ltsf2
        cmp     r0, #0
        mov     r1, r7
        mov     r0, r4
        movlt   r8, r4
        bl      __gtsf2
        cmp     r0, #0
        movgt   r7, r4
        subs    r5, r5, #1
        bne     LBGT0
LBGT1:
        str     r8, [r10]
        mov     r0, #0
        str     r7, [r9]
        ldmia   sp!, {r4 - r10, pc}
LBGT2:
        mvn     r0, #7
        ldmia   sp!, {r4 - r10, pc}


