        .text
        .align  4
        .globl  _ippsIIRGetDlyLine32s_16s


_ippsIIRGetDlyLine32s_16s:
        stmdb   sp!, {r4, r5, lr}
        mov     r4, r0
        cmp     r4, #0
        beq     LBPA4
        cmp     r1, #0
        beq     LBPA4
        ldr     r2, [r4]
        ldr     r5, [pc, #0x7C]
        cmp     r5, r2
        beq     LBPA0
        add     r3, r5, #0xF7
        cmp     r3, r2
        mvnne   r0, #0x10
        ldmneia sp!, {r4, r5, pc}
LBPA0:
        cmp     r5, r2
        subeq   r2, r5, #4
        streq   r2, [r4]
        beq     LBPA1
        add     r3, r5, #0xF7
        cmp     r3, r2
        subeq   r2, r5, #3
        streq   r2, [r4]
LBPA1:
        mov     r0, r4
        bl      _ippsIIRGetDlyLine32f_16s
        cmp     r0, #0
        bne     LBPA2
        ldr     r1, [r4]
        sub     r2, r5, #4
        cmp     r2, r1
        streq   r5, [r4]
        ldmeqia sp!, {r4, r5, pc}
        sub     r2, r5, #3
        cmp     r2, r1
        beq     LBPA3
LBPA2:
        ldmia   sp!, {r4, r5, pc}
LBPA3:
        add     r5, r5, #0xF7
        str     r5, [r4]
        ldmia   sp!, {r4, r5, pc}
LBPA4:
        mvn     r0, #7
        ldmia   sp!, {r4, r5, pc}
        .long   0x49493039


