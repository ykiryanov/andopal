        .text
        .align  4
        .globl  _ippsMulC_32fc_I


_ippsMulC_32fc_I:
        stmdb   sp!, {r4 - r10, lr}
        sub     sp, sp, #8
        mov     r9, r2
        str     r0, [sp]
        cmp     r9, #0
        str     r1, [sp, #4]
        beq     LBEP3
        cmp     r3, #0
        ble     LBEP2
        cmp     r3, #0
        sub     r10, r3, #1
        beq     LBEP1
        ldr     r6, [sp]
        ldr     r5, [sp, #4]
LBEP0:
        ldr     r4, [r9]
        ldr     r7, [r9, #4]
        mov     r1, r6
        mov     r0, r4
        bl      __mulsf3
        mov     r8, r0
        mov     r0, r7
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r8
        bl      __subsf3
        mov     r8, r0
        mov     r0, r4
        mov     r1, r5
        bl      __mulsf3
        mov     r4, r0
        mov     r0, r7
        mov     r1, r6
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        sub     r10, r10, #1
        str     r0, [r9, #4]
        str     r8, [r9], #8
        cmn     r10, #1
        bne     LBEP0
LBEP1:
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r10, pc}
LBEP2:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r10, pc}
LBEP3:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r10, pc}


