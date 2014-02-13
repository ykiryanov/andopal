        .text
        .align  4
        .globl  _ippsAdd_64f_I


_ippsAdd_64f_I:
        stmdb   sp!, {r4 - r6, lr}
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        beq     LDCV2
        cmp     r4, #0
        beq     LDCV2
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r6, pc}
        cmp     r2, #0
        sub     r6, r2, #1
        beq     LDCV1
LDCV0:
        ldr     r0, [r5]
        ldr     r1, [r5, #4]
        ldr     r2, [r4]
        ldr     r3, [r4, #4]
        bl      __adddf3
        sub     r6, r6, #1
        str     r0, [r4]
        str     r1, [r4, #4]
        cmn     r6, #1
        add     r5, r5, #8
        add     r4, r4, #8
        bne     LDCV0
LDCV1:
        mov     r0, #0
        ldmia   sp!, {r4 - r6, pc}
LDCV2:
        mvn     r0, #7
        ldmia   sp!, {r4 - r6, pc}


