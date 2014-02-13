        .text
        .align  4
        .globl  _ippsIIRSetTaps32sc_16sc32fc


_ippsIIRSetTaps32sc_16sc32fc:
        stmdb   sp!, {r4, r5, lr}
        mov     r4, r1
        cmp     r4, #0
        beq     LBNT2
        cmp     r0, #0
        beq     LBNT2
        ldr     r5, [pc, #0x74]
        ldr     r2, [r4]
        add     r3, r5, #4
        cmp     r3, r2
        streq   r5, [r4]
        beq     LBNT0
        add     r3, r5, #0xFB
        cmp     r3, r2
        addeq   r2, r5, #1
        streq   r2, [r4]
LBNT0:
        mov     r1, r4
        bl      _ippsIIRSetTaps32fc_16sc
        cmp     r0, #0
        ldmneia sp!, {r4, r5, pc}
        ldr     r2, [r4]
        cmp     r5, r2
        beq     LBNT1
        add     r0, r5, #1
        cmp     r0, r2
        movne   r0, #0
        ldmneia sp!, {r4, r5, pc}
        add     r5, r5, #0xFB
        str     r5, [r4]
        mov     r0, #0
        ldmia   sp!, {r4, r5, pc}
LBNT1:
        add     r5, r5, #4
        str     r5, [r4]
        mov     r0, #0
        ldmia   sp!, {r4, r5, pc}
LBNT2:
        mvn     r0, #7
        ldmia   sp!, {r4, r5, pc}
        .long   0x49493035


