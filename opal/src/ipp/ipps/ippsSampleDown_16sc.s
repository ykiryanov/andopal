        .text
        .align  4
        .globl  _ippsSampleDown_16sc


_ippsSampleDown_16sc:
        stmdb   sp!, {r4 - r10, lr}
        ldr     r12, [sp, #0x20]
        ldr     lr, [sp, #0x24]
        mov     r4, r1
        cmp     r0, #0
        mov     r1, r2
        mov     r5, r3
        beq     LAYU4
        cmp     r1, #0
        beq     LAYU4
        cmp     lr, #0
        beq     LAYU4
        cmp     r4, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r10, pc}
        cmp     r5, #0
        beq     LAYU4
        cmp     r12, #0
        mvnle   r0, #0x1E
        ldmleia sp!, {r4 - r10, pc}
        ldr     r7, [lr]
        cmp     r7, #0
        blt     LAYU2
        cmp     r7, r12
        bge     LAYU2
        cmp     r12, #1
        beq     LAYU3
        cmp     r7, r4
        mov     r6, #0
        bge     LAYU1
        sub     r8, r1, #2
LAYU0:
        mov     r10, r7, lsl #2
        ldrsh   r9, [r0, +r10]
        add     r10, r0, r10
        add     r7, r12, r7
        strh    r9, [r8, #2]
        ldrsh   r10, [r10, #2]
        cmp     r7, r4
        add     r6, r6, #1
        strh    r10, [r8, #4]!
        blt     LAYU0
LAYU1:
        sub     r7, r7, r4
        str     r7, [lr]
        str     r6, [r5]
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LAYU2:
        mvn     r0, #0x1D
        ldmia   sp!, {r4 - r10, pc}
LAYU3:
        mov     r2, r4
        bl      _ippsCopy_16sc
        str     r4, [r5]
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LAYU4:
        mvn     r0, #7
        ldmia   sp!, {r4 - r10, pc}


