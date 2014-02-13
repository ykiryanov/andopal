        .text
        .align  4
        .globl  _ippsDivC_64f


_ippsDivC_64f:
        stmdb   sp!, {r4 - r8, lr}
        sub     sp, sp, #8
        ldr     r8, [sp, #0x20]
        mov     r5, r0
        cmp     r5, #0
        mov     r6, r1
        mov     r7, r2
        mov     r4, r3
        beq     LCHX1
        cmp     r4, #0
        beq     LCHX1
        cmp     r8, #0
        ble     LCHX2
        mov     r0, r6
        mov     r1, r7
        mov     r2, #0
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        mvneq   r0, #9
        beq     LCHX0
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        str     r8, [sp]
        mov     r2, r6
        mov     r0, #0
        mov     r3, r7
        bl      __divdf3
        mov     r2, r1
        mov     r6, r0
        mov     r0, r5
        mov     r3, r4
        mov     r1, r6
        bl      _ippsMulC_64f
        add     sp, sp, #8
        ldmia   sp!, {r4 - r8, pc}
LCHX0:
        add     sp, sp, #8
        ldmia   sp!, {r4 - r8, pc}
LCHX1:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r8, pc}
LCHX2:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r8, pc}


