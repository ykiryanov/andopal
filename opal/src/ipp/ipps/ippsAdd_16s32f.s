        .text
        .align  4
        .globl  _ippsAdd_16s32f


_ippsAdd_16s32f:
        stmdb   sp!, {r4 - r8, lr}
        mov     r6, r0
        cmp     r6, #0
        mov     r5, r1
        mov     r4, r2
        beq     LDDB2
        cmp     r5, #0
        beq     LDDB2
        cmp     r4, #0
        beq     LDDB2
        cmp     r3, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r8, pc}
        cmp     r3, #0
        sub     r7, r3, #1
        beq     LDDB1
LDDB0:
        ldrsh   r0, [r6], #2
        sub     r7, r7, #1
        bl      __floatsisf
        mov     r8, r0
        ldrsh   r0, [r5], #2
        bl      __floatsisf
        mov     r1, r8
        bl      __addsf3
        str     r0, [r4], #4
        cmn     r7, #1
        bne     LDDB0
LDDB1:
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}
LDDB2:
        mvn     r0, #7
        ldmia   sp!, {r4 - r8, pc}


