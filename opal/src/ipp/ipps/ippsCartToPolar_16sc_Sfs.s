        .text
        .align  4
        .globl  _ippsCartToPolar_16sc_Sfs


_ippsCartToPolar_16sc_Sfs:
        stmdb   sp!, {r4 - r7, lr}
        mov     r5, r3
        ldr     r3, [sp, #0x14]
        ldr     r7, [sp, #0x18]
        mov     r4, r0
        mov     r6, r2
        mov     r2, r5
        bl      _ippsMagnitude_16sc_Sfs
        cmp     r0, #0
        ldmneia sp!, {r4 - r7, pc}
        mov     r0, r4
        mov     r3, r7
        mov     r2, r5
        mov     r1, r6
        ldmia   sp!, {r4 - r7, lr}
        b       _ippsPhase_16sc_Sfs


