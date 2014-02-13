        .text
        .align  4
        .globl  _ippsIIROne_BiQuadDirect_16s_I


_ippsIIROne_BiQuadDirect_16s_I:
        stmdb   sp!, {r4, lr}
        sub     sp, sp, #8
        cmp     r2, #1
        mov     r4, r0
        blt     LCIS0
        cmp     r4, #0
        beq     LCIS1
        cmp     r1, #0
        beq     LCIS1
        cmp     r3, #0
        beq     LCIS1
        str     r3, [sp]
        ldrsh   r0, [r4]
        mov     r3, r2
        mov     r2, r1
        mov     r1, r4
        bl      ownsIIROne_BiQuadDirect_16s
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}
LCIS0:
        mvn     r0, #0x18
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}
LCIS1:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}


