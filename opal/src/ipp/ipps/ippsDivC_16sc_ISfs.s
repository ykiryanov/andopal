        .text
        .align  4
        .globl  _ippsDivC_16sc_ISfs


_ippsDivC_16sc_ISfs:
        stmdb   sp!, {r4, lr}
        sub     sp, sp, #0xC
        mov     r4, r1
        cmp     r4, #0
        str     r0, [sp, #8]
        beq     LCID1
        cmp     r2, #0
        ble     LCID0
        str     r3, [sp]
        ldrh    lr, [sp, #0xA]
        ldrh    r12, [sp, #8]
        mov     r3, r2
        mov     r0, r4
        mov     r2, r4
        orr     r1, r12, lr, lsl #16
        bl      _ippsDivC_16sc_Sfs
        add     sp, sp, #0xC
        ldmia   sp!, {r4, pc}
LCID0:
        mvn     r0, #5
        add     sp, sp, #0xC
        ldmia   sp!, {r4, pc}
LCID1:
        mvn     r0, #7
        add     sp, sp, #0xC
        ldmia   sp!, {r4, pc}


