        .text
        .align  4
        .globl  _ippsThreshold_32f


_ippsThreshold_32f:
        stmdb   sp!, {r4 - r9, lr}
        ldr     r12, [sp, #0x1C]
        mov     r5, r0
        cmp     r5, #0
        mov     r7, r1
        mov     r6, r2
        mov     r4, r3
        beq     LARP2
        cmp     r7, #0
        beq     LARP2
        cmp     r6, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r9, pc}
        cmp     r12, #4
        mov     r8, #0
        beq     LARP1
LARP0:
        ldr     r9, [r5], #4
        mov     r1, r4
        mov     r0, r9
        bl      __gesf2
        cmp     r0, #0
        movlt   r9, r4
        add     r8, r8, #1
        str     r9, [r7], #4
        cmp     r8, r6
        blt     LARP0
        mov     r0, #0
        ldmia   sp!, {r4 - r9, pc}
LARP1:
        ldr     r9, [r5], #4
        mov     r1, r4
        mov     r0, r9
        bl      __lesf2
        cmp     r0, #0
        movgt   r9, r4
        add     r8, r8, #1
        str     r9, [r7], #4
        cmp     r8, r6
        blt     LARP1
        mov     r0, #0
        ldmia   sp!, {r4 - r9, pc}
LARP2:
        mvn     r0, #7
        ldmia   sp!, {r4 - r9, pc}


