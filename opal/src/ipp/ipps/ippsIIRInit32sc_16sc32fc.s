        .text
        .align  4
        .globl  _ippsIIRInit32sc_16sc32fc


_ippsIIRInit32sc_16sc32fc:
        stmdb   sp!, {r4, lr}
        sub     sp, sp, #8
        ldr     r12, [sp, #0x10]
        cmp     r1, #0
        mov     r4, r0
        beq     LBOL1
        cmp     r4, #0
        beq     LBOL1
        cmp     r12, #0
        beq     LBOL1
        cmp     r2, #1
        bge     LBOL0
        mvn     r0, #0x18
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}
LBOL0:
        str     r12, [sp]
        mov     r0, r4
        bl      _ippsIIRInit32fc_16sc
        cmp     r0, #0
        addne   sp, sp, #8
        ldmneia sp!, {r4, pc}
        ldr     r4, [r4]
        ldr     r1, [pc, #0x18]
        mov     r0, #0
        str     r1, [r4]
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}
LBOL1:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}
        .long   0x49493131


