        .text
        .align  4
        .globl  _ippsSampleDown_16s


_ippsSampleDown_16s:
        stmdb   sp!, {r4 - r8, lr}
        ldr     lr, [sp, #0x18]
        ldr     r12, [sp, #0x1C]
        mov     r4, r1
        cmp     r0, #0
        mov     r1, r2
        mov     r5, r3
        beq     LAYV4
        cmp     r1, #0
        beq     LAYV4
        cmp     r12, #0
        beq     LAYV4
        cmp     r4, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r8, pc}
        cmp     r5, #0
        beq     LAYV4
        cmp     lr, #0
        mvnle   r0, #0x1E
        ldmleia sp!, {r4 - r8, pc}
        ldr     r7, [r12]
        cmp     r7, #0
        blt     LAYV2
        cmp     r7, lr
        bge     LAYV2
        cmp     lr, #1
        beq     LAYV3
        cmp     r7, r4
        mov     r6, #0
        bge     LAYV1
LAYV0:
        mov     r8, r7, lsl #1
        ldrsh   r8, [r0, +r8]
        add     r7, lr, r7
        cmp     r7, r4
        strh    r8, [r1], #2
        add     r6, r6, #1
        blt     LAYV0
LAYV1:
        sub     r7, r7, r4
        str     r7, [r12]
        str     r6, [r5]
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}
LAYV2:
        mvn     r0, #0x1D
        ldmia   sp!, {r4 - r8, pc}
LAYV3:
        mov     r2, r4
        bl      _ippsCopy_16s
        str     r4, [r5]
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}
LAYV4:
        mvn     r0, #7
        ldmia   sp!, {r4 - r8, pc}


