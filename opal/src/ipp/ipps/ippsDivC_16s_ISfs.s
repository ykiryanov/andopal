        .text
        .align  4
        .globl  _ippsDivC_16s_ISfs


_ippsDivC_16s_ISfs:
        stmdb   sp!, {r4, lr}
        sub     sp, sp, #8
        mov     r4, r1
        cmp     r4, #0
        mov     r1, r0
        beq     LCIF1
        cmp     r2, #0
        ble     LCIF0
        str     r3, [sp]
        mov     r3, r2
        mov     r0, r4
        mov     r2, r4
        bl      _ippsDivC_16s_Sfs
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}
LCIF0:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}
LCIF1:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}


