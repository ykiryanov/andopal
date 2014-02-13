        .text
        .align  4
        .globl  _ippsCplxToReal_16sc


_ippsCplxToReal_16sc:
        stmdb   sp!, {r4 - r10, lr}
        cmp     r0, #0
        beq     LCUJ3
        cmp     r1, #0
        beq     LCUJ3
        cmp     r2, #0
        beq     LCUJ3
        cmp     r3, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r10, pc}
        cmp     r3, #5
        mov     r6, #0
        blt     LCUJ1
        sub     r5, r3, #5
        mov     r4, r1
        mov     lr, r2
        sub     r12, r0, #0xE
LCUJ0:
        ldrsh   r7, [r12, #0xE]
        add     r9, r6, #2
        strh    r7, [r4], #8
        ldrsh   r7, [r12, #0x10]!
        strh    r7, [lr], #8
        add     r7, r6, #1
        mov     r10, r7, lsl #2
        ldrsh   r8, [r0, +r10]
        mov     r7, r7, lsl #1
        add     r10, r0, r10
        strh    r8, [r1, +r7]
        ldrsh   r10, [r10, #2]
        mov     r8, r9, lsl #2
        mov     r9, r9, lsl #1
        strh    r10, [r2, +r7]
        ldrsh   r7, [r0, +r8]
        add     r8, r0, r8
        strh    r7, [r1, +r9]
        ldrsh   r8, [r8, #2]
        add     r7, r6, #3
        add     r6, r6, #4
        strh    r8, [r2, +r9]
        mov     r9, r7, lsl #2
        ldrsh   r8, [r0, +r9]
        mov     r7, r7, lsl #1
        add     r9, r0, r9
        strh    r8, [r1, +r7]
        ldrsh   r9, [r9, #2]
        cmp     r6, r5
        strh    r9, [r2, +r7]
        ble     LCUJ0
LCUJ1:
        mov     r12, r6, lsl #2
        sub     r12, r12, #2
        add     r0, r12, r0
        add     r1, r1, r6, lsl #1
        add     r2, r2, r6, lsl #1
LCUJ2:
        ldrsh   r12, [r0, #2]
        add     r6, r6, #1
        cmp     r6, r3
        strh    r12, [r1], #2
        ldrsh   r12, [r0, #4]!
        strh    r12, [r2], #2
        blt     LCUJ2
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LCUJ3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r10, pc}


