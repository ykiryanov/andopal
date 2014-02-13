        .text
        .align  4
        .globl  _ippsSqrt_64f


_ippsSqrt_64f:
        stmdb   sp!, {r4 - r10, lr}
        mov     r4, r0
        cmp     r4, #0
        mov     r6, r1
        mov     r5, r2
        beq     LAVT3
        cmp     r6, #0
        beq     LAVT3
        cmp     r5, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r10, pc}
        cmp     r5, #0
        mov     r7, #0
        movle   r0, r7
        ldmleia sp!, {r4 - r10, pc}
        ldr     r8, [pc, #0x64]
LAVT0:
        ldr     r9, [r4]
        ldr     r10, [r4, #4]
        mov     r2, #0
        mov     r0, r9
        mov     r3, #0
        mov     r1, r10
        bl      __gedf2
        cmp     r0, #0
        blt     LAVT1
        mov     r0, r9
        mov     r1, r10
        bl      sqrt
        b       LAVT2
LAVT1:
        ldr     r0, [r8]
        ldr     r1, [r8, #4]
        mov     r7, #3
LAVT2:
        str     r0, [r6]
        str     r1, [r6, #4]
        subs    r5, r5, #1
        add     r6, r6, #8
        add     r4, r4, #8
        bne     LAVT0
        mov     r0, r7
        ldmia   sp!, {r4 - r10, pc}
LAVT3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r10, pc}
        .long   ippConstantOfNAN_64f


