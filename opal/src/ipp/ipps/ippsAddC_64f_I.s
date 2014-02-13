        .text
        .align  4
        .globl  _ippsAddC_64f_I


_ippsAddC_64f_I:
        stmdb   sp!, {r4 - r7, lr}
        mov     r6, r2
        cmp     r6, #0
        mov     r5, r0
        mov     r4, r1
        mov     r7, r3
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r7, pc}
        cmp     r7, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r7, pc}
        mov     r0, r5
        mov     r1, r4
        mov     r2, #0
        mov     r3, #0
        bl      __eqdf2
        cmp     r0, #0
        beq     LDDE1
        cmp     r7, #0
        sub     r7, r7, #1
        beq     LDDE1
LDDE0:
        ldr     r2, [r6]
        ldr     r3, [r6, #4]
        mov     r0, r5
        mov     r1, r4
        bl      __adddf3
        sub     r7, r7, #1
        str     r0, [r6]
        str     r1, [r6, #4]
        cmn     r7, #1
        add     r6, r6, #8
        bne     LDDE0
LDDE1:
        mov     r0, #0
        ldmia   sp!, {r4 - r7, pc}


