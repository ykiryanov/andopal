        .text
        .align  4
        .globl  _ipps_vbFftMerge_16s


_ipps_vbFftMerge_16s:
        stmdb   sp!, {r4 - r10, lr}
        mov     r12, #1
        mov     r3, r12, lsl r3
        cmp     r3, #0
        ble     LCCA3
        cmp     r3, #5
        mov     r7, #0
        blt     LCCA1
        sub     r6, r3, #5
        sub     r5, r0, #0xE
        mov     r4, r1
        mov     lr, r2
LCCA0:
        ldrsh   r12, [r4], #8
        strh    r12, [r5, #0xE]
        ldrsh   r8, [lr], #8
        add     r12, r7, #1
        strh    r8, [r5, #0x10]!
        mov     r9, r12, lsl #1
        ldrsh   r8, [r1, +r9]
        mov     r12, r12, lsl #2
        strh    r8, [r0, +r12]
        ldrsh   r9, [r2, +r9]
        add     r12, r0, r12
        add     r8, r7, #2
        strh    r9, [r12, #2]
        add     r12, r7, #3
        mov     r10, r8, lsl #1
        ldrsh   r9, [r1, +r10]
        mov     r8, r8, lsl #2
        add     r7, r7, #4
        strh    r9, [r0, +r8]
        ldrsh   r10, [r2, +r10]
        add     r8, r0, r8
        mov     r9, r12, lsl #1
        strh    r10, [r8, #2]
        ldrsh   r8, [r1, +r9]
        mov     r12, r12, lsl #2
        cmp     r7, r6
        strh    r8, [r0, +r12]
        ldrsh   r9, [r2, +r9]
        add     r12, r0, r12
        strh    r9, [r12, #2]
        ble     LCCA0
LCCA1:
        mov     r12, r7, lsl #2
        sub     r12, r12, #2
        add     r0, r12, r0
        add     r1, r1, r7, lsl #1
        add     r2, r2, r7, lsl #1
LCCA2:
        ldrsh   r12, [r1], #2
        add     r7, r7, #1
        strh    r12, [r0, #2]
        ldrsh   r12, [r2], #2
        cmp     r7, r3
        strh    r12, [r0, #4]!
        blt     LCCA2
LCCA3:
        ldmia   sp!, {r4 - r10, pc}


