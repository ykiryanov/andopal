        .text
        .align  4
        .globl  _ippsDivC_32fc_I


_ippsDivC_32fc_I:
        stmdb   sp!, {r4, lr}
        sub     sp, sp, #0x10
        str     r0, [sp, #8]
        cmp     r2, #0
        str     r1, [sp, #0xC]
        beq     LCHY1
        cmp     r3, #0
        ble     LCHY0
        str     r3, [sp]
        ldr     r1, [sp, #8]
        ldr     r4, [sp, #0xC]
        mov     r0, r2
        mov     r3, r2
        mov     r2, r4
        bl      _ippsDivC_32fc
        add     sp, sp, #0x10
        ldmia   sp!, {r4, pc}
LCHY0:
        mvn     r0, #5
        add     sp, sp, #0x10
        ldmia   sp!, {r4, pc}
LCHY1:
        mvn     r0, #7
        add     sp, sp, #0x10
        ldmia   sp!, {r4, pc}


