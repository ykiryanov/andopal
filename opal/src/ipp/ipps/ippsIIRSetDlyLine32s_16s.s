        .text
        .align  4
        .globl  _ippsIIRSetDlyLine32s_16s


_ippsIIRSetDlyLine32s_16s:
        stmdb   sp!, {r4, r5, lr}
        mov     r4, r0
        cmp     r4, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4, r5, pc}
        ldr     r2, [r4]
        ldr     r5, [pc, #0x74]
        cmp     r5, r2
        beq     LBNY0
        add     r3, r5, #0xF7
        cmp     r3, r2
        mvnne   r0, #0x10
        ldmneia sp!, {r4, r5, pc}
LBNY0:
        cmp     r5, r2
        subeq   r2, r5, #4
        streq   r2, [r4]
        beq     LBNY1
        add     r3, r5, #0xF7
        cmp     r3, r2
        subeq   r2, r5, #3
        streq   r2, [r4]
LBNY1:
        mov     r0, r4
        bl      _ippsIIRSetDlyLine32f_16s
        cmp     r0, #0
        bne     LBNY2
        ldr     r1, [r4]
        sub     r2, r5, #4
        cmp     r2, r1
        streq   r5, [r4]
        ldmeqia sp!, {r4, r5, pc}
        sub     r2, r5, #3
        cmp     r2, r1
        beq     LBNY3
LBNY2:
        ldmia   sp!, {r4, r5, pc}
LBNY3:
        add     r5, r5, #0xF7
        str     r5, [r4]
        ldmia   sp!, {r4, r5, pc}
        .long   0x49493039


