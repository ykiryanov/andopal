        .text
        .align  4
        .globl  _ippsAdd_32f_I


_ippsAdd_32f_I:
        stmdb   sp!, {r4 - r6, lr}
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        beq     LDCZ2
        cmp     r4, #0
        beq     LDCZ2
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r6, pc}
        cmp     r2, #0
        sub     r6, r2, #1
        beq     LDCZ1
LDCZ0:
        ldr     r0, [r5], #4
        ldr     r1, [r4]
        sub     r6, r6, #1
        bl      __addsf3
        str     r0, [r4], #4
        cmn     r6, #1
        bne     LDCZ0
LDCZ1:
        mov     r0, #0
        ldmia   sp!, {r4 - r6, pc}
LDCZ2:
        mvn     r0, #7
        ldmia   sp!, {r4 - r6, pc}


