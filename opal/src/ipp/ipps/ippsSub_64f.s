        .text
        .align  4
        .globl  _ippsSub_64f


_ippsSub_64f:
        stmdb   sp!, {r4 - r7, lr}
        mov     r6, r0
        cmp     r6, #0
        mov     r5, r1
        mov     r4, r2
        beq     LAUC2
        cmp     r5, #0
        beq     LAUC2
        cmp     r4, #0
        beq     LAUC2
        cmp     r3, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r7, pc}
        cmp     r3, #0
        sub     r7, r3, #1
        beq     LAUC1
LAUC0:
        ldr     r0, [r5]
        ldr     r1, [r5, #4]
        ldr     r2, [r6]
        ldr     r3, [r6, #4]
        bl      __subdf3
        sub     r7, r7, #1
        str     r0, [r4]
        str     r1, [r4, #4]
        cmn     r7, #1
        add     r5, r5, #8
        add     r6, r6, #8
        add     r4, r4, #8
        bne     LAUC0
LAUC1:
        mov     r0, #0
        ldmia   sp!, {r4 - r7, pc}
LAUC2:
        mvn     r0, #7
        ldmia   sp!, {r4 - r7, pc}


