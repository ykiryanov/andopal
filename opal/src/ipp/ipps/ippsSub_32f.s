        .text
        .align  4
        .globl  _ippsSub_32f


_ippsSub_32f:
        stmdb   sp!, {r4 - r7, lr}
        mov     r6, r0
        cmp     r6, #0
        mov     r5, r1
        mov     r4, r2
        beq     LAUG2
        cmp     r5, #0
        beq     LAUG2
        cmp     r4, #0
        beq     LAUG2
        cmp     r3, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r7, pc}
        cmp     r3, #0
        sub     r7, r3, #1
        beq     LAUG1
LAUG0:
        ldr     r0, [r5], #4
        ldr     r1, [r6], #4
        sub     r7, r7, #1
        bl      __subsf3
        str     r0, [r4], #4
        cmn     r7, #1
        bne     LAUG0
LAUG1:
        mov     r0, #0
        ldmia   sp!, {r4 - r7, pc}
LAUG2:
        mvn     r0, #7
        ldmia   sp!, {r4 - r7, pc}


