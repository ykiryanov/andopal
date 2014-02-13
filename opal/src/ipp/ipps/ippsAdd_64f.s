        .text
        .align  4
        .globl  _ippsAdd_64f


_ippsAdd_64f:
        stmdb   sp!, {r4 - r7, lr}
        mov     r6, r0
        cmp     r6, #0
        mov     r5, r1
        mov     r4, r2
        beq     LDCW2
        cmp     r5, #0
        beq     LDCW2
        cmp     r4, #0
        beq     LDCW2
        cmp     r3, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r7, pc}
        cmp     r3, #0
        sub     r7, r3, #1
        beq     LDCW1
LDCW0:
        ldr     r0, [r6]
        ldr     r1, [r6, #4]
        ldr     r2, [r5]
        ldr     r3, [r5, #4]
        bl      __adddf3
        sub     r7, r7, #1
        str     r0, [r4]
        str     r1, [r4, #4]
        cmn     r7, #1
        add     r6, r6, #8
        add     r5, r5, #8
        add     r4, r4, #8
        bne     LDCW0
LDCW1:
        mov     r0, #0
        ldmia   sp!, {r4 - r7, pc}
LDCW2:
        mvn     r0, #7
        ldmia   sp!, {r4 - r7, pc}


