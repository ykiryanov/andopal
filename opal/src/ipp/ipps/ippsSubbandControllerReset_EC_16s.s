        .text
        .align  4
        .globl  _ippsSubbandControllerReset_EC_16s


_ippsSubbandControllerReset_EC_16s:
        stmdb   sp!, {r4, r5, lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4, r5, pc}
        and     r1, r0, #0xF
        rsb     r1, r1, #0
        and     r1, r1, #0xF
        ldr     r5, [r1, +r0]
        add     r4, r0, r1
        ldr     r0, [r4, #0x14]
        mov     r1, r5
        bl      _ippsZero_32s
        ldr     r0, [r4, #0x10]
        mov     r1, r5
        bl      _ippsZero_32s
        ldr     r0, [r4, #0x20]
        mov     r1, r5
        bl      _ippsZero_32s
        mov     r0, #0
        ldmia   sp!, {r4, r5, pc}


