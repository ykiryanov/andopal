        .text
        .align  4
        .globl  _ippsAddC_64f


_ippsAddC_64f:
        stmdb   sp!, {r4 - r8, lr}
        ldr     r8, [sp, #0x18]
        mov     r7, r0
        cmp     r7, #0
        mov     r5, r1
        mov     r4, r2
        mov     r6, r3
        beq     LDDF3
        cmp     r6, #0
        beq     LDDF3
        cmp     r8, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r8, pc}
        mov     r0, r5
        mov     r1, r4
        mov     r2, #0
        mov     r3, #0
        bl      __eqdf2
        cmp     r0, #0
        beq     LDDF2
        cmp     r8, #0
        sub     r8, r8, #1
        beq     LDDF1
LDDF0:
        ldr     r2, [r7]
        ldr     r3, [r7, #4]
        mov     r0, r5
        mov     r1, r4
        bl      __adddf3
        sub     r8, r8, #1
        str     r0, [r6]
        str     r1, [r6, #4]
        cmn     r8, #1
        add     r7, r7, #8
        add     r6, r6, #8
        bne     LDDF0
LDDF1:
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}
LDDF2:
        mov     r2, r8, lsl #3
        mov     r0, r7
        mov     r1, r6
        ldmia   sp!, {r4 - r8, lr}
        b       _ippsCopy_8u
LDDF3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r8, pc}


