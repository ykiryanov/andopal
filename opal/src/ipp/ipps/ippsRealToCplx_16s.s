        .text
        .align  4
        .globl  _ippsRealToCplx_16s


_ippsRealToCplx_16s:
        stmdb   sp!, {r4 - r10, lr}
        cmp     r2, #0
        beq     LCUH9
        cmp     r0, #0
        beq     LCUH8
LCUH0:
        cmp     r3, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r10, pc}
        cmp     r1, #0
        mov     r6, #0
        beq     LCUH4
        cmp     r0, #0
        beq     LCUH2
        sub     r2, r2, #2
LCUH1:
        ldrsh   r12, [r0], #2
        add     r6, r6, #1
        strh    r12, [r2, #2]
        ldrsh   r12, [r1], #2
        cmp     r6, r3
        strh    r12, [r2, #4]!
        blt     LCUH1
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LCUH2:
        sub     r2, r2, #2
        mov     r12, r6
LCUH3:
        strh    r6, [r2, #2]
        ldrsh   r0, [r1], #2
        add     r12, r12, #1
        cmp     r12, r3
        strh    r0, [r2, #4]!
        blt     LCUH3
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LCUH4:
        cmp     r3, #6
        movlt   r1, r6
        blt     LCUH6
        mov     r1, r6
        sub     r5, r3, #6
        mov     r4, r1
        sub     lr, r2, #0x12
        mov     r12, r0
LCUH5:
        ldrsh   r7, [r12], #0xA
        strh    r4, [lr, #0x14]
        add     r8, r1, #1
        strh    r7, [lr, #0x12]
        mov     r7, r8, lsl #1
        ldrsh   r7, [r0, +r7]
        mov     r8, r8, lsl #2
        add     r9, r2, r8
        strh    r4, [r9, #2]
        strh    r7, [r2, +r8]
        add     r9, r1, #2
        mov     r8, r9, lsl #1
        ldrsh   r8, [r0, +r8]
        mov     r9, r9, lsl #2
        add     r7, r1, #3
        strh    r8, [r2, +r9]
        add     r10, r2, r9
        strh    r4, [r10, #2]
        mov     r8, r7, lsl #1
        ldrsh   r8, [r0, +r8]
        mov     r9, r7, lsl #2
        add     lr, lr, #0x14
        strh    r8, [r2, +r9]
        add     r7, r1, #4
        add     r9, r2, r9
        strh    r4, [r9, #2]
        mov     r8, r7, lsl #1
        ldrsh   r8, [r0, +r8]
        mov     r7, r7, lsl #2
        add     r1, r1, #5
        add     r9, r2, r7
        cmp     r1, r5
        strh    r8, [r2, +r7]
        strh    r4, [r9, #2]
        ble     LCUH5
LCUH6:
        mov     r12, r1, lsl #2
        sub     r12, r12, #2
        add     r2, r12, r2
        add     r0, r0, r1, lsl #1
LCUH7:
        ldrsh   r12, [r0], #2
        add     r1, r1, #1
        strh    r6, [r2, #4]
        strh    r12, [r2, #2]
        cmp     r1, r3
        add     r2, r2, #4
        blt     LCUH7
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LCUH8:
        cmp     r1, #0
        bne     LCUH0
LCUH9:
        mvn     r0, #7
        ldmia   sp!, {r4 - r10, pc}


