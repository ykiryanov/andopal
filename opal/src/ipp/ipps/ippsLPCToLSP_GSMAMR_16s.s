        .text
        .align  4
        .globl  _ippsLPCToLSP_GSMAMR_16s


_ippsLPCToLSP_GSMAMR_16s:
        stmdb   sp!, {r4, r5, lr}
        sub     sp, sp, #8
        mov     r3, r0
        cmp     r3, #0
        mov     r5, r1
        mov     r4, r2
        beq     LDOU1
        cmp     r5, #0
        beq     LDOU1
        cmp     r4, #0
        beq     LDOU1
        mov     r12, #0xD
        str     r12, [sp, #4]
        str     r4, [sp]
        mov     r0, #0x3C
        mov     r2, #0
        mov     r1, #4
        bl      ownLPCToLSP_G729_16s
        cmp     r0, #0xA
        bge     LDOU0
        mov     r1, r4
        mov     r0, r5
        mov     r2, #0xA
        bl      _ippsCopy_16s
LDOU0:
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4, r5, pc}
LDOU1:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4, r5, pc}


