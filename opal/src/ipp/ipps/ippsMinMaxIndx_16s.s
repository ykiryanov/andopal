        .text
        .align  4
        .globl  _ippsMinMaxIndx_16s


_ippsMinMaxIndx_16s:
        stmdb   sp!, {r4 - r9, lr}
        ldr     r12, [sp, #0x1C]
        ldr     lr, [sp, #0x20]
        cmp     r0, #0
        beq     LBGO2
        cmp     r2, #0
        beq     LBGO2
        cmp     r12, #0
        beq     LBGO2
        cmp     r3, #0
        beq     LBGO2
        cmp     lr, #0
        beq     LBGO2
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r9, pc}
        ldrsh   r8, [r0]
        cmp     r1, #0
        mov     r4, #0
        mov     r7, r8
        movle   r6, r4
        movle   r5, r6
        ble     LBGO1
        mov     r6, r4
        mov     r5, r6
LBGO0:
        ldrsh   r9, [r0], #2
        cmp     r7, r9
        movgt   r7, r9
        movgt   r5, r4
        cmp     r8, r9
        movlt   r8, r9
        movlt   r6, r4
        add     r4, r4, #1
        cmp     r4, r1
        blt     LBGO0
LBGO1:
        strh    r7, [r2]
        strh    r8, [r12]
        str     r5, [r3]
        mov     r0, #0
        str     r6, [lr]
        ldmia   sp!, {r4 - r9, pc}
LBGO2:
        mvn     r0, #7
        ldmia   sp!, {r4 - r9, pc}

