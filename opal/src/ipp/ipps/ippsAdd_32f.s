        .text
        .align  4
        .globl  _ippsAdd_32f


_ippsAdd_32f:
        stmdb   sp!, {r4 - r7, lr}
        mov     r6, r0
        cmp     r6, #0
        mov     r5, r1
        mov     r4, r2
        beq     LDDA2
        cmp     r5, #0
        beq     LDDA2
        cmp     r4, #0
        beq     LDDA2
        cmp     r3, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r7, pc}
        cmp     r3, #0
        sub     r7, r3, #1
        beq     LDDA1
LDDA0:
        ldr     r0, [r6], #4
        ldr     r1, [r5], #4
        sub     r7, r7, #1
        bl      __addsf3
        str     r0, [r4], #4
        cmn     r7, #1
        bne     LDDA0
LDDA1:
        mov     r0, #0
        ldmia   sp!, {r4 - r7, pc}
LDDA2:
        mvn     r0, #7
        ldmia   sp!, {r4 - r7, pc}


