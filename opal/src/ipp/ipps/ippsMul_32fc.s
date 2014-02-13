        .text
        .align  4
        .globl  _ippsMul_32fc


_ippsMul_32fc:
        stmdb   sp!, {r4 - r8, lr}
        mov     r6, r0
        cmp     r6, #0
        mov     r5, r1
        mov     r4, r2
        beq     LBEG2
        cmp     r5, #0
        beq     LBEG2
        cmp     r4, #0
        beq     LBEG2
        cmp     r3, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r8, pc}
        cmp     r3, #0
        sub     r7, r3, #1
        beq     LBEG1
LBEG0:
        ldr     r0, [r6]
        ldr     r1, [r5]
        sub     r7, r7, #1
        bl      __mulsf3
        mov     r8, r0
        ldr     r0, [r6, #4]
        ldr     r1, [r5, #4]
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r8
        bl      __subsf3
        str     r0, [r4]
        ldr     r0, [r6]
        ldr     r1, [r5, #4]
        bl      __mulsf3
        ldr     r1, [r6, #4]
        ldr     r2, [r5], #8
        mov     r8, r0
        mov     r0, r1
        add     r6, r6, #8
        mov     r1, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        str     r0, [r4, #4]
        cmn     r7, #1
        add     r4, r4, #8
        bne     LBEG0
LBEG1:
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}
LBEG2:
        mvn     r0, #7
        ldmia   sp!, {r4 - r8, pc}


